@interface _UIStatusBarDataQuietModeEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)focusName;
- (_UIStatusBarDataQuietModeEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromData:(id *)a3 type:(int)a4 focusName:(const char *)a5 maxFocusLength:(int)a6 imageName:(const char *)a7 maxImageLength:(int)a8 BOOLValue:(BOOL)a9;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFocusName:(id)a3;
@end

@implementation _UIStatusBarDataQuietModeEntry

+ (id)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [a1 entryWithImageNamed:a4 BOOLValue:v5];
  [v9 setFocusName:v8];

  return v9;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  unint64_t v3 = [(_UIStatusBarDataBoolImageEntry *)&v5 hash];
  return [(NSString *)self->_focusName hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  id v4 = [(_UIStatusBarDataBoolImageEntry *)&v6 copyWithZone:a3];
  [v4 setFocusName:self->_focusName];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  id v4 = a3;
  [(_UIStatusBarDataBoolImageEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, @"focusName", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataQuietModeEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataBoolImageEntry *)&v7 initWithCoder:v3];
  objc_super v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"focusName", v7.receiver, v7.super_class);

  [(_UIStatusBarDataQuietModeEntry *)v4 setFocusName:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  if ([(_UIStatusBarDataBoolImageEntry *)&v14 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      focusName = self->_focusName;
      objc_super v7 = [v5 focusName];
      id v8 = focusName;
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
  v7.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v2 = [(_UIStatusBarDataBoolImageEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_focusName);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (NSString)focusName
{
  return self->_focusName;
}

- (void)setFocusName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)initFromData:(id *)a3 type:(int)a4 focusName:(const char *)a5 maxFocusLength:(int)a6 imageName:(const char *)a7 maxImageLength:(int)a8 BOOLValue:(BOOL)a9
{
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  id v11 = [(_UIStatusBarDataBoolImageEntry *)&v14 initFromData:a3 type:*(void *)&a4 imageName:a7 maxLength:*(void *)&a8 BOOLValue:a9];
  if (strnlen(a5, a6))
  {
    char v12 = [NSString stringWithUTF8String:a5];
    [v11 setFocusName:v12];
  }
  return v11;
}

@end