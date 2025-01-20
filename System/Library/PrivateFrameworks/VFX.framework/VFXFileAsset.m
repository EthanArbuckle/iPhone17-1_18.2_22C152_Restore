@interface VFXFileAsset
+ (BOOL)supportsSecureCoding;
- (NSString)filename;
- (VFXFileAsset)initWithCoder:(id)a3;
- (VFXFileAsset)initWithFileNamed:(id)a3 entityObject:(id)a4;
- (id)absolutePath;
- (id)copyWithFilename:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VFXFileAsset

- (VFXFileAsset)initWithFileNamed:(id)a3 entityObject:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VFXFileAsset;
  v5 = [(VFXCoreAsset *)&v10 initWithEntityObject:a4];
  if (v5)
  {
    v6 = (NSString *)a3;
    v5->_filename = v6;
    objc_msgSend_setName_(v5, v7, (uint64_t)v6, v8);
  }
  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (id)absolutePath
{
  uint64_t v4 = objc_msgSend_entityObject(self, a2, v2, v3);

  return (id)MEMORY[0x1F4181798](v4, sel_textureAbsolutePath, v5, v6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXFileAsset;
  [(VFXCoreAsset *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXFileAsset;
  uint64_t v4 = [(VFXCoreAsset *)&v9 copyWithZone:a3];

  v4[7] = (id)objc_msgSend_filename(self, v5, v6, v7);
  return v4;
}

- (id)copyWithFilename:(id)a3
{
  uint64_t v5 = objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  uint64_t v6 = (void *)v5;
  if (v5)
  {

    v6[7] = a3;
  }
  return v6;
}

- (VFXFileAsset)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VFXFileAsset;
  uint64_t v4 = -[VFXCoreAsset initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"filename");
    if (v7)
    {
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      v11 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"path");
      if (v11)
      {
        PathComponent = v11;
        if (objc_msgSend_hasPrefix_(v11, v12, @"/", v13)) {
          PathComponent = objc_msgSend_lastPathComponent(PathComponent, v15, v16, v17);
        }
        uint64_t v8 = PathComponent;
      }
      else
      {
        uint64_t v8 = &stru_1F0FCDBB0;
      }
    }
    v4->_filename = &v8->isa;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  filename = self->_filename;
  if (filename) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)filename, @"filename");
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXFileAsset;
  [(VFXCoreAsset *)&v6 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end