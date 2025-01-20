@interface TMLDynamicObject
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (id)dynamicPropertyType:(id)a3;
- (NSMutableDictionary)properties;
- (TMLDynamicObject)init;
@end

@implementation TMLDynamicObject

- (TMLDynamicObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)TMLDynamicObject;
  v2 = [(TMLDynamicObject *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->_properties;
    v2->_properties = v3;
  }
  return v2;
}

+ (id)dynamicPropertyType:(id)a3
{
  return 0;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  v5 = NSStringFromSelector(a3);
  objc_super v6 = (objc_class *)objc_opt_class();
  if ((unint64_t)objc_msgSend_length(v5, v7, v8) >= 4
    && objc_msgSend_hasPrefix_(v5, v9, v10, @"set"))
  {
    v11 = NSString;
    int v12 = 1;
    v13 = objc_msgSend_substringWithRange_(v5, v9, v10, 3, 1);
    v16 = objc_msgSend_lowercaseString(v13, v14, v15);
    uint64_t v19 = objc_msgSend_length(v5, v17, v18);
    v22 = objc_msgSend_substringWithRange_(v5, v20, v21, 4, v19 - 5);
    uint64_t v25 = objc_msgSend_stringWithFormat_(v11, v23, v24, @"%@%@", v16, v22);

    v5 = (void *)v25;
    objc_msgSend_dynamicPropertyType_(a1, v26, v27, v25);
  }
  else
  {
    int v12 = 0;
    objc_msgSend_dynamicPropertyType_(a1, v9, v10, v5);
  v29 = };
  if (v29)
  {
    if (v12) {
      v31 = @"v@:%@";
    }
    else {
      v31 = @"%@@:";
    }
    if (v12) {
      v32 = (void (*)(void))sub_239896AD0;
    }
    else {
      v32 = (void (*)(void))sub_239896BD8;
    }
    v33 = objc_msgSend_stringWithFormat_(NSString, v28, v30, v31, v29);
    if (objc_msgSend_hasPrefix_(v29, v34, v35, @"{CGPoint="))
    {
      BOOL v38 = v12 == 0;
      v39 = sub_239896D6C;
      v40 = (void (*)(void))sub_239896C4C;
    }
    else if (objc_msgSend_hasPrefix_(v29, v36, v37, @"{CGSize="))
    {
      BOOL v38 = v12 == 0;
      v39 = sub_239896F24;
      v40 = (void (*)(void))sub_239896E04;
    }
    else if (objc_msgSend_hasPrefix_(v29, v41, v42, @"{CGRect="))
    {
      BOOL v38 = v12 == 0;
      v39 = sub_2398970F4;
      v40 = (void (*)(void))sub_239896FBC;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v29, v43, v44, @"f"))
      {
        int isEqualToString = objc_msgSend_isEqualToString_(v29, v45, v46, @"I");
        v53 = (void (*)(void))sub_23989745C;
        if (v12) {
          v53 = (void (*)(void))sub_239897344;
        }
        if (isEqualToString) {
          v32 = v53;
        }
        goto LABEL_23;
      }
      BOOL v38 = v12 == 0;
      v39 = sub_2398972C0;
      v40 = (void (*)(void))sub_2398971A8;
    }
    if (v38) {
      v32 = (void (*)(void))v39;
    }
    else {
      v32 = v40;
    }
LABEL_23:
    id v47 = v33;
    v50 = (const char *)objc_msgSend_UTF8String(v47, v48, v49);
    class_addMethod(v6, a3, v32, v50);
  }
  return v29 != 0;
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end