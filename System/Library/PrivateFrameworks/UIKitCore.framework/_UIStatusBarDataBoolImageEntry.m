@interface _UIStatusBarDataBoolImageEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4;
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataBoolImageEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromData:(id *)a3 type:(int)a4 imageName:(const char *)a5 maxLength:(int)a6 BOOLValue:(BOOL)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation _UIStatusBarDataBoolImageEntry

+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 entryWithImageNamed:a3];
  [v5 setBoolValue:v4];
  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  return [(_UIStatusBarDataImageEntry *)&v3 hash] ^ self->_BOOLValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  id v4 = [(_UIStatusBarDataImageEntry *)&v6 copyWithZone:a3];
  [v4 setBoolValue:self->_BOOLValue];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  id v4 = a3;
  [(_UIStatusBarDataImageEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, @"BOOLValue", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataBoolImageEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataImageEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeBoolForKey:", @"BOOLValue", v7.receiver, v7.super_class);

  [(_UIStatusBarDataBoolImageEntry *)v4 setBoolValue:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  if ([(_UIStatusBarDataImageEntry *)&v9 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      int BOOLValue = self->_BOOLValue;
      BOOL v7 = BOOLValue == [v5 BOOLValue];
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  v2 = [(_UIStatusBarDataImageEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_BOOLValue);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  self->_int BOOLValue = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4 imageName:(const char *)a5 maxLength:(int)a6 BOOLValue:(BOOL)a7
{
  BOOL v7 = a7;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  id v8 = [(_UIStatusBarDataImageEntry *)&v10 initFromData:a3 type:*(void *)&a4 imageName:a5 maxLength:*(void *)&a6];
  [v8 setBoolValue:v7];
  return v8;
}

@end