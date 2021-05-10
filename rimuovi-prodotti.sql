DELETE relations.*, taxes.*, terms.*
FROM wpv4_term_relationships AS relations
INNER JOIN wpv4_term_taxonomy AS taxes
ON relations.term_taxonomy_id=taxes.term_taxonomy_id
INNER JOIN wpv4_terms AS terms
ON taxes.term_id=terms.term_id
WHERE object_id IN (SELECT ID FROM wpv4_posts WHERE post_type='product');

DELETE FROM wpv4_postmeta WHERE post_id IN (SELECT ID FROM wpv4_posts WHERE post_type = 'product');
DELETE FROM wpv4_posts WHERE post_type = 'product';