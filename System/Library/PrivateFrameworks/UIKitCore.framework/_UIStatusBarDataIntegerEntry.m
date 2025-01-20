@interface _UIStatusBarDataIntegerEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)displayRawValue;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataIntegerEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)displayValue;
- (int64_t)rawValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayRawValue:(BOOL)a3;
- (void)setDisplayValue:(int64_t)a3;
- (void)setRawValue:(int64_t)a3;
@end

@implementation _UIStatusBarDataIntegerEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataIntegerEntry;
  return *(void *)&self->_displayRawValue ^ [(_UIStatusBarDataEntry *)&v3 hash] ^ self->_rawValue ^ *((unsigned __int8 *)&self->super._enabled + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataIntegerEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setRawValue:*(void *)&self->_displayRawValue];
  [v4 setDisplayValue:self->_rawValue];
  [v4 setDisplayRawValue:*((unsigned __int8 *)&self->super._enabled + 1)];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataIntegerEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_displayRawValue, @"rawValue", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_rawValue forKey:@"displayValue"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"displayRawValue"];
}

- (_UIStatusBarDataIntegerEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataIntegerEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  -[_UIStatusBarDataIntegerEntry setRawValue:](v4, "setRawValue:", objc_msgSend(v3, "decodeIntegerForKey:", @"rawValue", v7.receiver, v7.super_class));
  -[_UIStatusBarDataIntegerEntry setDisplayValue:](v4, "setDisplayValue:", [v3 decodeIntegerForKey:@"displayValue"]);
  uint64_t v5 = [v3 decodeIntegerForKey:@"displayRawValue"];

  [(_UIStatusBarDataIntegerEntry *)v4 setDisplayRawValue:v5 != 0];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataIntegerEntry;
  if ([(_UIStatusBarDataEntry *)&v11 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      uint64_t v6 = *(void *)&self->_displayRawValue;
      if (v6 == [v5 rawValue]
        && (int64_t rawValue = self->_rawValue, rawValue == [v5 displayValue]))
      {
        int v8 = *((unsigned __int8 *)&self->super._enabled + 1);
        BOOL v9 = v8 == [v5 displayRawValue];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_ui_descriptionBuilder
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataIntegerEntry;
  v2 = [(_UIStatusBarDataEntry *)&v9 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_rawValue);
  v10[0] = v3;
  id v4 = NSStringFromSelector(sel_displayValue);
  v10[1] = v4;
  id v5 = NSStringFromSelector(sel_displayRawValue);
  v10[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  objc_super v7 = [v2 appendKeys:v6];

  return v7;
}

- (int64_t)rawValue
{
  return *(void *)&self->_displayRawValue;
}

- (void)setRawValue:(int64_t)a3
{
  *(void *)&self->_displayRawValue = a3;
}

- (int64_t)displayValue
{
  return self->_rawValue;
}

- (void)setDisplayValue:(int64_t)a3
{
  self->_int64_t rawValue = a3;
}

- (BOOL)displayRawValue
{
  return *(&self->super._enabled + 1);
}

- (void)setDisplayRawValue:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

@end