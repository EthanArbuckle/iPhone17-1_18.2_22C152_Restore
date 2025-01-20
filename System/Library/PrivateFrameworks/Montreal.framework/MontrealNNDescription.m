@interface MontrealNNDescription
- (MontrealNNDescription)descriptionWithIndent:(id)a3;
- (id)description;
- (void)checkForValidity:(id)a3;
@end

@implementation MontrealNNDescription

- (MontrealNNDescription)descriptionWithIndent:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_indentByFactor_(v4, v5, 1, v6);
  v11 = objc_msgSend_string(MEMORY[0x1E4F28E78], v8, v9, v10);
  v14 = objc_msgSend_stringWithFormat_(NSString, v12, @"\r %@ {", v13, v4);
  objc_msgSend_appendString_(v11, v15, (uint64_t)v14, v16);

  if (objc_msgSend_conformsToProtocol_(self, v17, (uint64_t)&unk_1EF0B46B8, v18)) {
    objc_msgSend_description_indent_(self, v19, (uint64_t)v11, (uint64_t)v7);
  }
  v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"\r %@ }", v20, v4);
  objc_msgSend_appendString_(v11, v22, (uint64_t)v21, v23);

  return (MontrealNNDescription *)v11;
}

- (id)description
{
  id v4 = objc_msgSend_indentWithLevel_(MontrealLogIndent, a2, @"    ", v2);
  v7 = objc_msgSend_descriptionWithIndent_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (void)checkForValidity:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v48;
    unint64_t v10 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v3);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v19, v6, 0, v7);
        uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v19, v21, 1, v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!objc_msgSend_count(v23, v24, v25, v26)) {
            sub_19E15DB6C(@"%@ %@ has 0 elements", v12, v13, v14, v15, v16, v17, v18, (uint64_t)self);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v23) {
              sub_19E15DB6C(@"%@ %@ is nil", v27, v28, v29, v30, v31, v32, v33, (uint64_t)self);
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v34 = v10;
              id v35 = v23;
              if (!objc_msgSend_unsignedIntegerValue(v35, v36, v37, v38)) {
                sub_19E15DB6C(@"%@ %@: %@ is invalid", v39, v40, v41, v42, v43, v44, v45, (uint64_t)self);
              }

              unint64_t v10 = v34;
            }
          }
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v8);
  }
}

@end