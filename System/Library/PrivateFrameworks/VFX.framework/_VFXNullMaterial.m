@interface _VFXNullMaterial
+ (BOOL)supportsSecureCoding;
+ (id)nullMaterial;
- (_VFXNullMaterial)initWithCoder:(id)a3;
@end

@implementation _VFXNullMaterial

+ (id)nullMaterial
{
  if (qword_1E9DDAF98 != -1) {
    dispatch_once(&qword_1E9DDAF98, &unk_1F0FB6EC8);
  }
  return (id)qword_1E9DDAF90;
}

- (_VFXNullMaterial)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_VFXNullMaterial;
  result = [(VFXMaterial *)&v7 initWithCoder:a3];
  if (result)
  {

    return (_VFXNullMaterial *)objc_msgSend_nullMaterial(_VFXNullMaterial, v4, v5, v6);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end