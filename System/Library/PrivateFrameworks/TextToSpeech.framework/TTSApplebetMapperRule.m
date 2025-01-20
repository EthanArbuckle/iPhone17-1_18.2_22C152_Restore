@interface TTSApplebetMapperRule
+ (id)ruleWithHeterogeniousArray:(id)a3;
- (NSArray)left;
- (NSArray)match;
- (NSArray)right;
- (NSArray)substitution;
- (id)matchRule;
- (void)setLeft:(id)a3;
- (void)setMatch:(id)a3;
- (void)setMatchRule:(id)a3;
- (void)setRight:(id)a3;
- (void)setSubstitution:(id)a3;
@end

@implementation TTSApplebetMapperRule

+ (id)ruleWithHeterogeniousArray:(id)a3
{
  id v3 = a3;
  v4 = [TTSApplebetMapperRule alloc];
  v9 = objc_msgSend_init(v4, v5, v6, v7, v8);
  v13 = objc_msgSend_objectAtIndexedSubscript_(v3, v10, 0, v11, v12);
  objc_msgSend_setLeft_(v9, v14, (uint64_t)v13, v15, v16);

  v20 = objc_msgSend_objectAtIndexedSubscript_(v3, v17, 1, v18, v19);
  objc_msgSend_setMatch_(v9, v21, (uint64_t)v20, v22, v23);

  v27 = objc_msgSend_objectAtIndexedSubscript_(v3, v24, 2, v25, v26);
  objc_msgSend_setRight_(v9, v28, (uint64_t)v27, v29, v30);

  v34 = objc_msgSend_objectAtIndexedSubscript_(v3, v31, 3, v32, v33);
  objc_msgSend_setMatchRule_(v9, v35, (uint64_t)v34, v36, v37);

  v41 = objc_msgSend_objectAtIndexedSubscript_(v3, v38, 4, v39, v40);
  objc_msgSend_setSubstitution_(v9, v42, (uint64_t)v41, v43, v44);

  return v9;
}

- (NSArray)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (NSArray)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (NSArray)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
}

- (id)matchRule
{
  return self->_matchRule;
}

- (void)setMatchRule:(id)a3
{
}

- (NSArray)substitution
{
  return self->_substitution;
}

- (void)setSubstitution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitution, 0);
  objc_storeStrong(&self->_matchRule, 0);
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_match, 0);

  objc_storeStrong((id *)&self->_left, 0);
}

@end