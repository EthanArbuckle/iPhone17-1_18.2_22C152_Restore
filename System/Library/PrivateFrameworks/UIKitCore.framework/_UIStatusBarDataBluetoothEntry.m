@interface _UIStatusBarDataBluetoothEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataBatteryEntry)batteryEntry;
- (_UIStatusBarDataBluetoothEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryEntry:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _UIStatusBarDataBluetoothEntry

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  unint64_t v3 = self->_state ^ [(_UIStatusBarDataEntry *)&v5 hash];
  return v3 ^ [(_UIStatusBarDataBatteryEntry *)self->_batteryEntry hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v7 copyWithZone:a3];
  [v4 setState:self->_state];
  objc_super v5 = (void *)[(_UIStatusBarDataBatteryEntry *)self->_batteryEntry copy];
  [v4 setBatteryEntry:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, @"state", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_batteryEntry forKey:@"batteryEntry"];
}

- (_UIStatusBarDataBluetoothEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  -[_UIStatusBarDataBluetoothEntry setState:](v4, "setState:", objc_msgSend(v3, "decodeIntegerForKey:", @"state", v7.receiver, v7.super_class));
  objc_super v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"batteryEntry"];

  [(_UIStatusBarDataBluetoothEntry *)v4 setBatteryEntry:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  if ([(_UIStatusBarDataEntry *)&v15 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      state = (void *)self->_state;
      if (state == (void *)[v5 state])
      {
        BOOL v7 = [(_UIStatusBarDataEntry *)self->_batteryEntry isEnabled];
        if (v7
          || ([v5 batteryEntry],
              state = objc_claimAutoreleasedReturnValue(),
              [state isEnabled]))
        {
          batteryEntry = self->_batteryEntry;
          v9 = [v5 batteryEntry];
          v10 = batteryEntry;
          v11 = v9;
          v12 = v11;
          if (v10 == v11)
          {
            char v13 = 1;
          }
          else
          {
            char v13 = 0;
            if (v10 && v11) {
              char v13 = [(_UIStatusBarDataBatteryEntry *)v10 isEqual:v11];
            }
          }

          if (v7) {
            goto LABEL_19;
          }
        }
        else
        {
          char v13 = 1;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 1;
    }
LABEL_19:

    goto LABEL_20;
  }
  char v13 = 0;
LABEL_20:

  return v13;
}

- (id)_ui_descriptionBuilder
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataBluetoothEntry;
  v2 = [(_UIStatusBarDataEntry *)&v8 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_state);
  v9[0] = v3;
  id v4 = NSStringFromSelector(sel_batteryEntry);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 appendKeys:v5];

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_UIStatusBarDataBatteryEntry)batteryEntry
{
  return self->_batteryEntry;
}

- (void)setBatteryEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end