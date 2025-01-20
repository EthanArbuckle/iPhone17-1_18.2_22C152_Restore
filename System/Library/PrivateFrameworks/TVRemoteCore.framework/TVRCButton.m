@interface TVRCButton
+ (BOOL)_isMediaButtonEvent:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTapAction;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToButton:(id)a3;
- (NSDictionary)properties;
- (TVRCButton)initWithCoder:(id)a3;
- (id)_initWithButtonType:(int64_t)a3;
- (id)_initWithButtonType:(int64_t)a3 hasTapAction:(BOOL)a4 properties:(id)a5;
- (id)description;
- (int64_t)buttonType;
- (unint64_t)hash;
- (void)_setEnabled:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVRCButton;
  v5 = [(TVRCButton *)&v13 init];
  if (v5)
  {
    v5->_buttonType = [v4 decodeIntegerForKey:@"buttonType"];
    v5->_hasTapAction = [v4 decodeBoolForKey:@"hasTapAction"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t buttonType = self->_buttonType;
  id v5 = a3;
  [v5 encodeInteger:buttonType forKey:@"buttonType"];
  [v5 encodeBool:self->_hasTapAction forKey:@"hasTapAction"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
  [v5 encodeObject:self->_properties forKey:@"properties"];
}

- (id)_initWithButtonType:(int64_t)a3
{
  return [(TVRCButton *)self _initWithButtonType:a3 hasTapAction:0 properties:MEMORY[0x263EFFA78]];
}

- (id)_initWithButtonType:(int64_t)a3 hasTapAction:(BOOL)a4 properties:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TVRCButton;
  v9 = [(TVRCButton *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_int64_t buttonType = a3;
    v9->_hasTapAction = a4;
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v9->_properties, v11);
    v10->_enabled = 1;
  }

  return v10;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (BOOL)_isMediaButtonEvent:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v5 = [v3 setWithArray:&unk_26DA62FC8];
  v6 = NSNumber;
  uint64_t v7 = [v4 button];

  id v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "buttonType"));
  LOBYTE(v6) = [v5 containsObject:v8];

  return (char)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TVRCButton *)self isEqualToButton:v4];

  return v5;
}

- (unint64_t)hash
{
  return (((unint64_t)self->_enabled << 24) ^ (self->_buttonType << 16) | ((unint64_t)self->_hasTapAction << 8)) ^ [(NSDictionary *)self->_properties hash];
}

- (BOOL)isEqualToButton:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  BOOL v5 = v4;
  BOOL v6 = self->_buttonType == *((void *)v4 + 2)
    && self->_hasTapAction == v4[9]
    && self->_enabled == v4[8]
    && [(NSDictionary *)self->_properties isEqualToDictionary:*((void *)v4 + 3)];

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = TVRCButtonTypeDescription(self->_buttonType);
  BOOL v6 = (void *)v5;
  if (self->_hasTapAction) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  id v8 = (void *)[v3 initWithFormat:@"<%@ %p; type=%@; hasTapAction=%@", v4, self, v5, v7];

  if (!self->_enabled) {
    [v8 appendString:@"; disabled"];
  }
  if ([(NSDictionary *)self->_properties count]) {
    [v8 appendFormat:@"; properties=%@", self->_properties];
  }
  [v8 appendString:@">"];
  v9 = (void *)[v8 copy];

  return v9;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)hasTapAction
{
  return self->_hasTapAction;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end