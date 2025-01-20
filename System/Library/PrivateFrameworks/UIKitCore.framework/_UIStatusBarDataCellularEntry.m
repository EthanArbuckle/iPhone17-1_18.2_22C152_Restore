@interface _UIStatusBarDataCellularEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)callForwardingEnabled;
- (BOOL)isBootstrapCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsSOSWhenDisabled;
- (BOOL)sosAvailable;
- (BOOL)wifiCallingEnabled;
- (NSString)badgeString;
- (NSString)crossfadeString;
- (NSString)string;
- (_UIStatusBarDataCellularEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeString:(id)a3;
- (void)setCallForwardingEnabled:(BOOL)a3;
- (void)setCrossfadeString:(id)a3;
- (void)setIsBootstrapCellular:(BOOL)a3;
- (void)setShowsSOSWhenDisabled:(BOOL)a3;
- (void)setSosAvailable:(BOOL)a3;
- (void)setString:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWifiCallingEnabled:(BOOL)a3;
@end

@implementation _UIStatusBarDataCellularEntry

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataCellularEntry;
  unint64_t v3 = *(void *)&self->_wifiCallingEnabled ^ [(_UIStatusBarDataNetworkEntry *)&v7 hash];
  uint64_t v4 = v3 ^ [self->_type hash];
  NSUInteger v5 = [(NSString *)self->_string hash];
  return v4 ^ v5 ^ [(NSString *)self->_crossfadeString hash] ^ LOBYTE(self->super._status) ^ (unint64_t)BYTE1(self->super._status) ^ BYTE2(self->super._status) ^ BYTE3(self->super._status) ^ BYTE4(self->super._status);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataCellularEntry;
  id v4 = [(_UIStatusBarDataNetworkEntry *)&v6 copyWithZone:a3];
  [v4 setType:*(void *)&self->_wifiCallingEnabled];
  [v4 setString:self->_type];
  [v4 setCrossfadeString:self->_string];
  [v4 setBadgeString:self->_crossfadeString];
  [v4 setWifiCallingEnabled:LOBYTE(self->super._status)];
  [v4 setCallForwardingEnabled:BYTE1(self->super._status)];
  [v4 setShowsSOSWhenDisabled:BYTE2(self->super._status)];
  [v4 setSosAvailable:BYTE3(self->super._status)];
  [v4 setIsBootstrapCellular:BYTE4(self->super._status)];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataCellularEntry;
  id v4 = a3;
  [(_UIStatusBarDataNetworkEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_wifiCallingEnabled, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_type forKey:@"string"];
  [v4 encodeObject:self->_string forKey:@"crossfadeString"];
  [v4 encodeObject:self->_crossfadeString forKey:@"badgeString"];
  [v4 encodeBool:LOBYTE(self->super._status) forKey:@"wifiCallingEnabled"];
  [v4 encodeBool:BYTE1(self->super._status) forKey:@"callForwardingEnabled"];
  [v4 encodeBool:BYTE2(self->super._status) forKey:@"showsSOSWhenDisabled"];
  [v4 encodeBool:BYTE3(self->super._status) forKey:@"sosAvailable"];
  [v4 encodeBool:BYTE4(self->super._status) forKey:@"isBootstrapCellular"];
}

- (_UIStatusBarDataCellularEntry)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataCellularEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataNetworkEntry *)&v10 initWithCoder:v3];
  -[_UIStatusBarDataCellularEntry setType:](v4, "setType:", objc_msgSend(v3, "decodeIntegerForKey:", @"type", v10.receiver, v10.super_class));
  objc_super v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  [(_UIStatusBarDataCellularEntry *)v4 setString:v5];

  objc_super v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"crossfadeString"];
  [(_UIStatusBarDataCellularEntry *)v4 setCrossfadeString:v6];

  objc_super v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"badgeString"];
  [(_UIStatusBarDataCellularEntry *)v4 setBadgeString:v7];

  -[_UIStatusBarDataCellularEntry setWifiCallingEnabled:](v4, "setWifiCallingEnabled:", [v3 decodeBoolForKey:@"wifiCallingEnabled"]);
  -[_UIStatusBarDataCellularEntry setCallForwardingEnabled:](v4, "setCallForwardingEnabled:", [v3 decodeBoolForKey:@"callForwardingEnabled"]);
  -[_UIStatusBarDataCellularEntry setShowsSOSWhenDisabled:](v4, "setShowsSOSWhenDisabled:", [v3 decodeBoolForKey:@"showsSOSWhenDisabled"]);
  -[_UIStatusBarDataCellularEntry setSosAvailable:](v4, "setSosAvailable:", [v3 decodeBoolForKey:@"sosAvailable"]);
  uint64_t v8 = [v3 decodeBoolForKey:@"isBootstrapCellular"];

  [(_UIStatusBarDataCellularEntry *)v4 setIsBootstrapCellular:v8];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIStatusBarDataCellularEntry;
  if ([(_UIStatusBarDataNetworkEntry *)&v31 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      uint64_t v6 = *(void *)&self->_wifiCallingEnabled;
      if (v6 == [v5 type])
      {
        type = (void *)self->_type;
        uint64_t v8 = [v5 string];
        v9 = type;
        objc_super v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {
        }
        else
        {
          if (v9) {
            BOOL v12 = v10 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {
            BOOL v13 = 0;
            v14 = v10;
            goto LABEL_38;
          }
          int v15 = [(NSString *)v9 isEqual:v10];

          if (!v15)
          {
            BOOL v13 = 0;
LABEL_40:

            goto LABEL_41;
          }
        }
        string = self->_string;
        v17 = [v5 crossfadeString];
        v14 = string;
        v18 = v17;
        v9 = v18;
        if (v14 == v18)
        {
        }
        else
        {
          if (!v14 || !v18)
          {

            goto LABEL_37;
          }
          int v19 = [(NSString *)v14 isEqual:v18];

          if (!v19)
          {
            BOOL v13 = 0;
LABEL_39:

            goto LABEL_40;
          }
        }
        crossfadeString = self->_crossfadeString;
        v21 = [v5 badgeString];
        v22 = crossfadeString;
        v23 = v21;
        v14 = v23;
        if (v22 == v23)
        {

LABEL_31:
          int status_low = LOBYTE(self->super._status);
          if (status_low != [v5 wifiCallingEnabled]) {
            goto LABEL_37;
          }
          int v26 = BYTE1(self->super._status);
          if (v26 != [v5 callForwardingEnabled]) {
            goto LABEL_37;
          }
          int v27 = BYTE2(self->super._status);
          if (v27 != [v5 showsSOSWhenDisabled]) {
            goto LABEL_37;
          }
          int v28 = BYTE3(self->super._status);
          if (v28 != [v5 sosAvailable]) {
            goto LABEL_37;
          }
          int v29 = BYTE4(self->super._status);
          BOOL v13 = v29 == [v5 isBootstrapCellular];
LABEL_38:

          goto LABEL_39;
        }
        if (v22 && v23)
        {
          int v24 = [(NSString *)v22 isEqual:v23];

          if (!v24) {
            goto LABEL_37;
          }
          goto LABEL_31;
        }

LABEL_37:
        BOOL v13 = 0;
        goto LABEL_38;
      }
      BOOL v13 = 0;
    }
    else
    {
      BOOL v13 = 1;
    }
LABEL_41:

    goto LABEL_42;
  }
  BOOL v13 = 0;
LABEL_42:

  return v13;
}

- (id)_ui_descriptionBuilder
{
  v16[9] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarDataCellularEntry;
  v2 = [(_UIStatusBarDataNetworkEntry *)&v15 _ui_descriptionBuilder];
  v14 = NSStringFromSelector(sel_type);
  v16[0] = v14;
  BOOL v13 = NSStringFromSelector(sel_string);
  v16[1] = v13;
  id v3 = NSStringFromSelector(sel_crossfadeString);
  v16[2] = v3;
  id v4 = NSStringFromSelector(sel_badgeString);
  v16[3] = v4;
  id v5 = NSStringFromSelector(sel_wifiCallingEnabled);
  v16[4] = v5;
  uint64_t v6 = NSStringFromSelector(sel_callForwardingEnabled);
  v16[5] = v6;
  objc_super v7 = NSStringFromSelector(sel_showsSOSWhenDisabled);
  v16[6] = v7;
  uint64_t v8 = NSStringFromSelector(sel_sosAvailable);
  v16[7] = v8;
  v9 = NSStringFromSelector(sel_isBootstrapCellular);
  v16[8] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];
  v11 = [v2 appendKeys:v10];

  return v11;
}

- (int64_t)type
{
  return *(void *)&self->_wifiCallingEnabled;
}

- (void)setType:(int64_t)a3
{
  *(void *)&self->_wifiCallingEnabled = a3;
}

- (NSString)string
{
  return (NSString *)self->_type;
}

- (void)setString:(id)a3
{
}

- (NSString)crossfadeString
{
  return self->_string;
}

- (void)setCrossfadeString:(id)a3
{
}

- (NSString)badgeString
{
  return self->_crossfadeString;
}

- (void)setBadgeString:(id)a3
{
}

- (BOOL)wifiCallingEnabled
{
  return self->super._status;
}

- (void)setWifiCallingEnabled:(BOOL)a3
{
  LOBYTE(self->super._status) = a3;
}

- (BOOL)callForwardingEnabled
{
  return BYTE1(self->super._status);
}

- (void)setCallForwardingEnabled:(BOOL)a3
{
  BYTE1(self->super._status) = a3;
}

- (BOOL)showsSOSWhenDisabled
{
  return BYTE2(self->super._status);
}

- (void)setShowsSOSWhenDisabled:(BOOL)a3
{
  BYTE2(self->super._status) = a3;
}

- (BOOL)sosAvailable
{
  return BYTE3(self->super._status);
}

- (void)setSosAvailable:(BOOL)a3
{
  BYTE3(self->super._status) = a3;
}

- (BOOL)isBootstrapCellular
{
  return BYTE4(self->super._status);
}

- (void)setIsBootstrapCellular:(BOOL)a3
{
  BYTE4(self->super._status) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end