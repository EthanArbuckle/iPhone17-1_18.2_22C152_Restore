@interface _UIStatusBarDataBatteryEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)prominentlyShowsDetailString;
- (BOOL)saverModeActive;
- (NSString)detailString;
- (_UIStatusBarDataBatteryEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)capacity;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(int64_t)a3;
- (void)setDetailString:(id)a3;
- (void)setProminentlyShowsDetailString:(BOOL)a3;
- (void)setSaverModeActive:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _UIStatusBarDataBatteryEntry

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBatteryEntry;
  unint64_t v3 = *(void *)&self->_saverModeActive ^ [(_UIStatusBarDataEntry *)&v5 hash] ^ self->_capacity;
  return v3 ^ [self->_state hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBatteryEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setCapacity:*(void *)&self->_saverModeActive];
  [v4 setState:self->_capacity];
  [v4 setSaverModeActive:*((unsigned __int8 *)&self->super._enabled + 1)];
  [v4 setProminentlyShowsDetailString:*((unsigned __int8 *)&self->super._enabled + 2)];
  [v4 setDetailString:self->_state];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBatteryEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_saverModeActive, @"capacity", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_capacity forKey:@"state"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"saverModeActive"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 2) forKey:@"prominentlyShowsDetailString"];
  [v4 encodeObject:self->_state forKey:@"detailString"];
}

- (_UIStatusBarDataBatteryEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBatteryEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  -[_UIStatusBarDataBatteryEntry setCapacity:](v4, "setCapacity:", objc_msgSend(v3, "decodeIntegerForKey:", @"capacity", v7.receiver, v7.super_class));
  -[_UIStatusBarDataBatteryEntry setState:](v4, "setState:", [v3 decodeIntegerForKey:@"state"]);
  -[_UIStatusBarDataBatteryEntry setSaverModeActive:](v4, "setSaverModeActive:", [v3 decodeIntegerForKey:@"saverModeActive"] != 0);
  -[_UIStatusBarDataBatteryEntry setProminentlyShowsDetailString:](v4, "setProminentlyShowsDetailString:", [v3 decodeIntegerForKey:@"prominentlyShowsDetailString"] != 0);
  objc_super v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"detailString"];

  [(_UIStatusBarDataBatteryEntry *)v4 setDetailString:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarDataBatteryEntry;
  if ([(_UIStatusBarDataEntry *)&v17 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      uint64_t v6 = *(void *)&self->_saverModeActive;
      if (v6 == [v5 capacity]
        && (int64_t capacity = self->_capacity, capacity == [v5 state])
        && (int v8 = *((unsigned __int8 *)&self->super._enabled + 1), v8 == [v5 saverModeActive])&& (v9 = *((unsigned __int8 *)&self->super._enabled + 2), v9 == objc_msgSend(v5, "prominentlyShowsDetailString")))
      {
        state = (void *)self->_state;
        v11 = [v5 detailString];
        id v12 = state;
        id v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {
          char v15 = 1;
        }
        else
        {
          char v15 = 0;
          if (v12 && v13) {
            char v15 = [v12 isEqual:v13];
          }
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 1;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)_ui_descriptionBuilder
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataBatteryEntry;
  v2 = [(_UIStatusBarDataEntry *)&v11 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_capacity);
  v12[0] = v3;
  id v4 = NSStringFromSelector(sel_state);
  v12[1] = v4;
  id v5 = NSStringFromSelector(sel_saverModeActive);
  v12[2] = v5;
  uint64_t v6 = NSStringFromSelector(sel_prominentlyShowsDetailString);
  v12[3] = v6;
  objc_super v7 = NSStringFromSelector(sel_detailString);
  v12[4] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  int v9 = [v2 appendKeys:v8];

  return v9;
}

- (int64_t)capacity
{
  return *(void *)&self->_saverModeActive;
}

- (void)setCapacity:(int64_t)a3
{
  *(void *)&self->_saverModeActive = a3;
}

- (int64_t)state
{
  return self->_capacity;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t capacity = a3;
}

- (BOOL)saverModeActive
{
  return *(&self->super._enabled + 1);
}

- (void)setSaverModeActive:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (BOOL)prominentlyShowsDetailString
{
  return *(&self->super._enabled + 2);
}

- (void)setProminentlyShowsDetailString:(BOOL)a3
{
  *(&self->super._enabled + 2) = a3;
}

- (NSString)detailString
{
  return (NSString *)self->_state;
}

- (void)setDetailString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end