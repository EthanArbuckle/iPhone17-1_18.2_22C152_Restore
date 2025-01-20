@interface _UIStatusBarDataThermalEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)sunlightMode;
- (_UIStatusBarDataThermalEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)color;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(int64_t)a3;
- (void)setSunlightMode:(BOOL)a3;
@end

@implementation _UIStatusBarDataThermalEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataThermalEntry;
  return *(void *)&self->_sunlightMode ^ [(_UIStatusBarDataEntry *)&v3 hash] ^ *((unsigned __int8 *)&self->super._enabled
                                                                                          + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataThermalEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setColor:*(void *)&self->_sunlightMode];
  [v4 setSunlightMode:*((unsigned __int8 *)&self->super._enabled + 1)];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataThermalEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_sunlightMode, @"color", v5.receiver, v5.super_class);
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"sunlightMode"];
}

- (_UIStatusBarDataThermalEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataThermalEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  -[_UIStatusBarDataThermalEntry setColor:](v4, "setColor:", objc_msgSend(v3, "decodeIntegerForKey:", @"color", v7.receiver, v7.super_class));
  uint64_t v5 = [v3 decodeIntegerForKey:@"sunlightMode"];

  [(_UIStatusBarDataThermalEntry *)v4 setSunlightMode:v5 != 0];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataThermalEntry;
  if ([(_UIStatusBarDataEntry *)&v10 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      uint64_t v6 = *(void *)&self->_sunlightMode;
      if (v6 == [v5 color])
      {
        int v7 = *((unsigned __int8 *)&self->super._enabled + 1);
        BOOL v8 = v7 == [v5 sunlightMode];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_ui_descriptionBuilder
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataThermalEntry;
  v2 = [(_UIStatusBarDataEntry *)&v8 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_color);
  v9[0] = v3;
  id v4 = NSStringFromSelector(sel_sunlightMode);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v2 appendKeys:v5];

  return v6;
}

- (int64_t)color
{
  return *(void *)&self->_sunlightMode;
}

- (void)setColor:(int64_t)a3
{
  *(void *)&self->_sunlightMode = a3;
}

- (BOOL)sunlightMode
{
  return *(&self->super._enabled + 1);
}

- (void)setSunlightMode:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

@end