@interface TMLAttributedString
+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4;
+ (void)initializeJSContext:(id)a3;
- (CGRect)boundingRectWithSize:(CGSize)a3 options:(int64_t)a4;
- (CGSize)size;
- (NSAttributedString)attributedString;
- (NSString)string;
- (TMLAttributedString)attributedStringWithAttachment:(id)a3;
- (TMLAttributedString)init;
- (TMLAttributedString)initWithAttributedString:(id)a3;
- (id)NSAttributedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5;
- (unint64_t)length;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addAttributes:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setString:(id)a3;
@end

@implementation TMLAttributedString

- (TMLAttributedString)init
{
  v3.receiver = self;
  v3.super_class = (Class)TMLAttributedString;
  return [(TMLAttributedString *)&v3 init];
}

- (TMLAttributedString)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v8 = (TMLAttributedString *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    uint64_t v10 = objc_msgSend_mutableCopy(v4, v7, v9);
    attributedString = v8->_attributedString;
    v8->_attributedString = (NSMutableAttributedString *)v10;
  }
  return v8;
}

- (TMLAttributedString)attributedStringWithAttachment:(id)a3
{
  v5 = objc_msgSend_attributedStringWithAttachment_(MEMORY[0x263F086A0], a2, v3, a3);
  v8 = (NSMutableAttributedString *)objc_msgSend_mutableCopy(v5, v6, v7);
  attributedString = self->_attributedString;
  self->_attributedString = v8;

  return (TMLAttributedString *)objc_msgSend_NSAttributedString(self, v10, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  attributedString = self->_attributedString;
  return (id)objc_msgSend_initWithAttributedString_(v8, v9, v10, attributedString);
}

- (NSString)string
{
  return (NSString *)objc_msgSend_string(self->_attributedString, a2, v2);
}

- (void)setString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v9 = (NSMutableAttributedString *)objc_msgSend_initWithString_(v6, v7, v8, v5);

  attributedString = self->_attributedString;
  self->_attributedString = v9;
}

- (id)NSAttributedString
{
  double v3 = objc_msgSend_copy(self->_attributedString, a2, v2);
  return v3;
}

- (unint64_t)length
{
  return objc_msgSend_length(self->_attributedString, a2, v2);
}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  objc_msgSend_addAttributes_range_(self->_attributedString, a2, v4, a3, a4.location, a4.length);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  objc_msgSend_addAttribute_value_range_(self->_attributedString, a2, v5, a3, a4, a5.location, a5.length);
}

+ (void)initializeJSContext:(id)a3
{
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_239838190;
  v20[3] = &unk_264DABD28;
  v20[4] = a1;
  id v4 = a3;
  double v5 = (void *)MEMORY[0x23ECA7DD0](v20);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v6, v7, v5, @"attributedstring");

  double v10 = objc_msgSend_objectForKeyedSubscript_(v4, v8, v9, @"attributedstring");
  objc_msgSend_setObject_forKeyedSubscript_(v10, v11, v12, &unk_26ECEBBF8, @"attributes");

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2398382BC;
  v19[3] = &unk_264DABD68;
  v19[4] = a1;
  v13 = (void *)MEMORY[0x23ECA7DD0](v19);
  v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, v15, @"attributedstring");

  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, v18, v13, @"markdown");
}

+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4
{
  id v5 = a4;
  double v8 = objc_msgSend_mutableCopy(a3, v6, v7);
  id v9 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v12 = objc_msgSend_length(v8, v10, v11);
  double v15 = objc_msgSend_initWithCapacity_(v9, v13, v14, v12);
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  v19 = objc_msgSend_initWithCapacity_(v16, v17, v18, 16);
  id v20 = objc_alloc(MEMORY[0x263EFF980]);
  v107 = objc_msgSend_initWithCapacity_(v20, v21, v22, 16);
  uint64_t v25 = objc_msgSend_length(v8, v23, v24);
  if (!v25) {
    goto LABEL_29;
  }
  unint64_t v28 = v25;
  NSUInteger v29 = 0;
  NSUInteger location = 0;
  int v31 = 0;
  NSUInteger v32 = 0;
  id v106 = v5;
  int v33 = 32;
  do
  {
    int v34 = objc_msgSend_characterAtIndex_(v8, length, v27, v32);
    int v35 = v34;
    switch(v34)
    {
      case '/':
        if (v31 != 1) {
          goto LABEL_12;
        }
        int v36 = 2;
        break;
      case ']':
        if (v33 == 92) {
          goto LABEL_9;
        }
        int v36 = 0;
        if (v31 && v29)
        {
          objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          if (v31 == 1
            && (objc_msgSend_substringWithRange_(v8, v40, v42, location - 1, 1),
                v43 = objc_claimAutoreleasedReturnValue(),
                char isEqualToString = objc_msgSend_isEqualToString_(v43, v44, v45, @"/"),
                v43,
                (isEqualToString & 1) == 0))
          {
            v69 = (void *)MEMORY[0x263F08D40];
            uint64_t v70 = objc_msgSend_length(v15, v47, v48);
            v73 = objc_msgSend_valueWithRange_(v69, v71, v72, v70, 0);
            objc_msgSend_addObject_(v19, v74, v75, v73);

            objc_msgSend_addObject_(v107, v76, v77, v41);
          }
          else
          {
            v112[0] = MEMORY[0x263EF8330];
            v112[1] = 3221225472;
            v112[2] = sub_2398388B8;
            v112[3] = &unk_264DABD90;
            id v41 = v41;
            id v113 = v41;
            uint64_t v51 = objc_msgSend_indexOfObjectWithOptions_passingTest_(v107, v49, v50, 2, v112);
            if (v51 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v54 = v51;
              v55 = objc_msgSend_objectAtIndexedSubscript_(v19, v52, v53, v51);
              uint64_t v58 = objc_msgSend_rangeValue(v55, v56, v57);

              uint64_t v61 = objc_msgSend_length(v15, v59, v60);
              v64 = objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], v62, v63, v58, v61 - v58);
              objc_msgSend_replaceObjectAtIndex_withObject_(v19, v65, v66, v54, v64);
            }
          }
          int v36 = 0;
          goto LABEL_24;
        }
        break;
      case '[':
        if (v33 == 92)
        {
LABEL_9:
          objc_msgSend_deleteCharactersInRange_(v8, length, v27, --v32, 1);
          unint64_t v28 = objc_msgSend_length(v8, v37, v38);
LABEL_12:
          v114.NSUInteger location = location;
          v114.length = v29;
          v115.NSUInteger location = v32;
          v115.length = 1;
          NSRange v39 = NSUnionRange(v114, v115);
          length = (const char *)v39.length;
          NSUInteger location = v39.location;
          NSUInteger v29 = v39.length;
          ++v32;
          goto LABEL_26;
        }
        int v36 = 1;
        break;
      default:
        goto LABEL_12;
    }
    if (v29)
    {
      objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v15, v67, v68, v41);
LABEL_24:
    }
    NSUInteger v29 = 0;
    ++v32;
    int v31 = v36;
    NSUInteger location = v32;
LABEL_26:
    int v33 = v35;
  }
  while (v32 < v28);
  id v5 = v106;
  if (v29)
  {
    v78 = objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
    objc_msgSend_appendString_(v15, v79, v80, v78);
  }
LABEL_29:
  v81 = objc_msgSend_objectForKey_(v5, length, v27, &stru_26ECF02A8);
  if (objc_msgSend_count(v81, v82, v83))
  {
    v84 = objc_alloc_init(TMLAttributedString_Attributes);
    objc_msgSend_setValuesForKeysWithDictionary_(v84, v85, v86, v81);
    uint64_t v89 = objc_msgSend_attributes(v84, v87, v88);

    v81 = (void *)v89;
  }
  id v90 = objc_alloc(MEMORY[0x263F089B8]);
  v93 = objc_msgSend_initWithString_attributes_(v90, v91, v92, v15, v81);
  objc_msgSend_beginEditing(v93, v94, v95);
  v108[0] = MEMORY[0x263EF8330];
  v108[1] = 3221225472;
  v108[2] = sub_2398388E8;
  v108[3] = &unk_264DABDB8;
  id v109 = v19;
  id v110 = v5;
  id v96 = v93;
  id v111 = v96;
  id v97 = v5;
  id v98 = v19;
  objc_msgSend_enumerateObjectsUsingBlock_(v107, v99, v100, v108);
  objc_msgSend_endEditing(v96, v101, v102);
  v103 = v111;
  id v104 = v96;

  return v104;
}

- (id)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = (objc_class *)MEMORY[0x263EFF980];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  attributedString = self->_attributedString;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_239838AD4;
  v20[3] = &unk_264DABDE0;
  id v21 = v11;
  id v13 = v11;
  objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(attributedString, v14, v15, v10, location, length, a5, v20);

  double v18 = objc_msgSend_copy(v13, v16, v17);
  return v18;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  objc_msgSend_replaceCharactersInRange_withString_(self->_attributedString, a2, v4, a3.location, a3.length, a4);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v15 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    attributedString = self->_attributedString;
    id v10 = objc_msgSend_NSAttributedString(v15, v7, v8);
    objc_msgSend_replaceCharactersInRange_withAttributedString_(attributedString, v11, v12, location, length, v10);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_replaceCharactersInRange_withAttributedString_(self->_attributedString, v13, v14, location, length, v15);
    }
  }
}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    attributedString = self->_attributedString;
    id v9 = objc_msgSend_NSAttributedString(v14, v6, v7);
    objc_msgSend_insertAttributedString_atIndex_(attributedString, v10, v11, v9, a4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_insertAttributedString_atIndex_(self->_attributedString, v12, v13, v14, a4);
    }
  }
}

- (void)appendAttributedString:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    attributedString = self->_attributedString;
    double v7 = objc_msgSend_NSAttributedString(v12, v4, v5);
    objc_msgSend_appendAttributedString_(attributedString, v8, v9, v7);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_appendAttributedString_(self->_attributedString, v10, v11, v12);
    }
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  objc_msgSend_deleteCharactersInRange_(self->_attributedString, a2, v3, a3.location, a3.length);
}

- (CGSize)size
{
  objc_msgSend_size(self->_attributedString, a2, v2);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)boundingRectWithSize:(CGSize)a3 options:(int64_t)a4
{
  MEMORY[0x270F9A6D0](self->_attributedString, sel_boundingRectWithSize_options_context_, a3.width);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSAttributedString)attributedString
{
  return &self->_attributedString->super;
}

- (void)setAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end