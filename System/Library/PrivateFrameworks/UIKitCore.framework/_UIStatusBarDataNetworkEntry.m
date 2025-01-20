@interface _UIStatusBarDataNetworkEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowDataModeActive;
- (_UIStatusBarDataNetworkEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLowDataModeActive:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation _UIStatusBarDataNetworkEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataNetworkEntry;
  return *(void *)&self->_lowDataModeActive ^ [(_UIStatusBarDataIntegerEntry *)&v3 hash] ^ LOBYTE(self->super._displayValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataNetworkEntry;
  id v4 = [(_UIStatusBarDataIntegerEntry *)&v6 copyWithZone:a3];
  [v4 setStatus:*(void *)&self->_lowDataModeActive];
  [v4 setLowDataModeActive:LOBYTE(self->super._displayValue)];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataNetworkEntry;
  id v4 = a3;
  [(_UIStatusBarDataIntegerEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_lowDataModeActive, @"status", v5.receiver, v5.super_class);
  [v4 encodeBool:LOBYTE(self->super._displayValue) forKey:@"lowDataModeActive"];
}

- (_UIStatusBarDataNetworkEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataNetworkEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataIntegerEntry *)&v7 initWithCoder:v3];
  -[_UIStatusBarDataNetworkEntry setStatus:](v4, "setStatus:", objc_msgSend(v3, "decodeIntegerForKey:", @"status", v7.receiver, v7.super_class));
  uint64_t v5 = [v3 decodeBoolForKey:@"lowDataModeActive"];

  [(_UIStatusBarDataNetworkEntry *)v4 setLowDataModeActive:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataNetworkEntry;
  if ([(_UIStatusBarDataIntegerEntry *)&v10 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      uint64_t v6 = *(void *)&self->_lowDataModeActive;
      if (v6 == [v5 status])
      {
        int displayValue_low = LOBYTE(self->super._displayValue);
        BOOL v8 = displayValue_low == [v5 lowDataModeActive];
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
  v8.super_class = (Class)_UIStatusBarDataNetworkEntry;
  v2 = [(_UIStatusBarDataIntegerEntry *)&v8 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_status);
  v9[0] = v3;
  id v4 = NSStringFromSelector(sel_lowDataModeActive);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v2 appendKeys:v5];

  return v6;
}

- (int64_t)status
{
  return *(void *)&self->_lowDataModeActive;
}

- (void)setStatus:(int64_t)a3
{
  *(void *)&self->_lowDataModeActive = a3;
}

- (BOOL)lowDataModeActive
{
  return self->super._displayValue;
}

- (void)setLowDataModeActive:(BOOL)a3
{
  LOBYTE(self->super._displayValue) = a3;
}

@end