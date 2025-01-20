@interface VFXProgramSemanticInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithSemantic:(id)a3 options:(id)a4;
- (NSDictionary)options;
- (NSString)semantic;
- (VFXProgramSemanticInfo)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSemantic:(id)a3;
@end

@implementation VFXProgramSemanticInfo

+ (id)infoWithSemantic:(id)a3 options:(id)a4
{
  id v6 = objc_alloc_init((Class)a1);
  objc_msgSend_setSemantic_(v6, v7, (uint64_t)a3, v8);
  objc_msgSend_setOptions_(v6, v9, (uint64_t)a4, v10);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = objc_msgSend_semantic(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, @"semantic");
  uint64_t v12 = objc_msgSend_options(self, v8, v9, v10);

  objc_msgSend_encodeObject_forKey_(a3, v11, v12, @"options");
}

- (VFXProgramSemanticInfo)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VFXProgramSemanticInfo;
  v4 = [(VFXProgramSemanticInfo *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"semantic");
    objc_msgSend_setSemantic_(v4, v8, v7, v9);
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"options");
    objc_msgSend_setOptions_(v4, v13, v12, v14);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXProgramSemanticInfo;
  [(VFXProgramSemanticInfo *)&v3 dealloc];
}

- (NSString)semantic
{
  return self->_semantic;
}

- (void)setSemantic:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

@end