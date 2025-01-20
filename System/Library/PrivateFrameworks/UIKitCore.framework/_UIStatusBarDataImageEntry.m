@interface _UIStatusBarDataImageEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithImageNamed:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)imageName;
- (_UIStatusBarDataImageEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromData:(id *)a3 type:(int)a4 imageName:(const char *)a5 maxLength:(int)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImageName:(id)a3;
@end

@implementation _UIStatusBarDataImageEntry

+ (id)entryWithImageNamed:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setImageName:v4];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataImageEntry;
  unint64_t v3 = [(_UIStatusBarDataEntry *)&v5 hash];
  return [(NSString *)self->_imageName hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataImageEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setImageName:self->_imageName];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataImageEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, @"imageName", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataImageEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataImageEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  objc_super v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"imageName", v7.receiver, v7.super_class);

  [(_UIStatusBarDataImageEntry *)v4 setImageName:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataImageEntry;
  if ([(_UIStatusBarDataEntry *)&v14 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      imageName = self->_imageName;
      objc_super v7 = [v5 imageName];
      v8 = imageName;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        if (v8) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11) {
          char v12 = 0;
        }
        else {
          char v12 = [(NSString *)v8 isEqual:v9];
        }
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)_ui_descriptionBuilder
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataImageEntry;
  v2 = [(_UIStatusBarDataEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_imageName);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)initFromData:(id *)a3 type:(int)a4 imageName:(const char *)a5 maxLength:(int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataImageEntry;
  id v8 = [(_UIStatusBarDataEntry *)&v11 initFromData:a3 type:*(void *)&a4];
  if (strnlen(a5, a6))
  {
    v9 = [NSString stringWithUTF8String:a5];
    [v8 setImageName:v9];
  }
  return v8;
}

@end