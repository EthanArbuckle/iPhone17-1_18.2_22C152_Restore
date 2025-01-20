@interface _UIStatusBarDataBoolEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithBoolValue:(BOOL)a3;
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataBoolEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromData:(id *)a3 type:(int)a4 BOOLValue:(BOOL)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation _UIStatusBarDataBoolEntry

+ (id)entryWithBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 setBoolValue:v3];
  return v4;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataBoolEntry;
  return [(_UIStatusBarDataEntry *)&v3 hash] ^ *((unsigned __int8 *)&self->super._enabled + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBoolEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setBoolValue:*((unsigned __int8 *)&self->super._enabled + 1)];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBoolEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), @"BOOLValue", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataBoolEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBoolEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeBoolForKey:", @"BOOLValue", v7.receiver, v7.super_class);

  [(_UIStatusBarDataBoolEntry *)v4 setBoolValue:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataBoolEntry;
  if ([(_UIStatusBarDataEntry *)&v9 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      int v6 = *((unsigned __int8 *)&self->super._enabled + 1);
      BOOL v7 = v6 == [v5 BOOLValue];
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
  v7.super_class = (Class)_UIStatusBarDataBoolEntry;
  v2 = [(_UIStatusBarDataEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_BOOLValue);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (BOOL)BOOLValue
{
  return *(&self->super._enabled + 1);
}

- (void)setBoolValue:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4 BOOLValue:(BOOL)a5
{
  BOOL v5 = a5;
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataBoolEntry;
  id v6 = [(_UIStatusBarDataEntry *)&v8 initFromData:a3 type:*(void *)&a4];
  [v6 setBoolValue:v5];
  return v6;
}

@end