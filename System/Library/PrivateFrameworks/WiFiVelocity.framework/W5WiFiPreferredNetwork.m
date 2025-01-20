@interface W5WiFiPreferredNetwork
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isCaptive;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPreferredNetwork:(id)a3;
- (BOOL)isHidden;
- (BOOL)isMultiAP;
- (BOOL)isPasspoint;
- (NSData)ssid;
- (NSDate)lastJoinedTimestamp;
- (NSString)domainName;
- (NSString)identifier;
- (NSString)ssidString;
- (W5WiFiPreferredNetwork)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)security;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCaptive:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsMultiAP:(BOOL)a3;
- (void)setIsPasspoint:(BOOL)a3;
- (void)setLastJoinedTimestamp:(id)a3;
- (void)setSecurity:(int64_t)a3;
- (void)setSsid:(id)a3;
- (void)setSsidString:(id)a3;
@end

@implementation W5WiFiPreferredNetwork

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiPreferredNetwork;
  [(W5WiFiPreferredNetwork *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"SSID: %@ (%@)\n", -[W5WiFiPreferredNetwork ssidString](self, "ssidString"), -[W5WiFiPreferredNetwork ssid](self, "ssid")];
  [v3 appendFormat:@"Security: %@\n", W5DescriptionForSecurity(self->_security)];
  if (self->_isPasspoint) {
    v4 = "Yes";
  }
  else {
    v4 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"isPasspoint: %s\n", v4);
  [v3 appendFormat:@"Domain Name: %@\n", self->_domainName];
  if (self->_isEnabled) {
    v5 = "Yes";
  }
  else {
    v5 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"isEnabled: %s\n", v5);
  if (self->_isCaptive) {
    v6 = "Yes";
  }
  else {
    v6 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"isCaptive: %s\n", v6);
  if (self->_isHidden) {
    v7 = "Yes";
  }
  else {
    v7 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"isHidden: %s\n", v7);
  if (self->_isMultiAP) {
    v8 = "Yes";
  }
  else {
    v8 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"isMultiAP: %s\n", v8);
  id v9 = objc_alloc_init(MEMORY[0x263F08790]);
  [v9 setDateStyle:0];
  [v9 setTimeStyle:2];
  objc_msgSend(v9, "setLocale:", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"));
  [v3 appendFormat:@"Last Joined: %@\n", objc_msgSend(v9, "stringFromDate:", self->_lastJoinedTimestamp)];
  v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiPreferredNetwork;
  if (-[W5WiFiPreferredNetwork conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToPreferredNetwork:(id)a3
{
  v4 = [(W5WiFiPreferredNetwork *)self identifier];
  uint64_t v5 = [a3 identifier];
  return [(NSString *)v4 isEqualToString:v5];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5WiFiPreferredNetwork *)self isEqualToPreferredNetwork:a3];
}

- (unint64_t)hash
{
  v2 = [(W5WiFiPreferredNetwork *)self identifier];
  return [(NSString *)v2 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5WiFiPreferredNetwork allocWithZone:a3] init];
  [(W5WiFiPreferredNetwork *)v4 setIdentifier:self->_identifier];
  [(W5WiFiPreferredNetwork *)v4 setSsid:self->_ssid];
  [(W5WiFiPreferredNetwork *)v4 setSsidString:self->_ssidString];
  [(W5WiFiPreferredNetwork *)v4 setDomainName:self->_domainName];
  [(W5WiFiPreferredNetwork *)v4 setSecurity:self->_security];
  [(W5WiFiPreferredNetwork *)v4 setIsEnabled:self->_isEnabled];
  [(W5WiFiPreferredNetwork *)v4 setIsHidden:self->_isHidden];
  [(W5WiFiPreferredNetwork *)v4 setIsCaptive:self->_isCaptive];
  [(W5WiFiPreferredNetwork *)v4 setIsPasspoint:self->_isPasspoint];
  [(W5WiFiPreferredNetwork *)v4 setIsMultiAP:self->_isMultiAP];
  [(W5WiFiPreferredNetwork *)v4 setLastJoinedTimestamp:self->_lastJoinedTimestamp];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"_identifier"];
  [a3 encodeObject:self->_ssid forKey:@"_ssid"];
  [a3 encodeObject:self->_ssidString forKey:@"_ssidString"];
  [a3 encodeInteger:self->_security forKey:@"_security"];
  [a3 encodeBool:self->_isEnabled forKey:@"_isEnabled"];
  [a3 encodeBool:self->_isHidden forKey:@"_isHidden"];
  [a3 encodeBool:self->_isCaptive forKey:@"_isCaptive"];
  [a3 encodeBool:self->_isPasspoint forKey:@"_isPasspoint"];
  [a3 encodeBool:self->_isMultiAP forKey:@"_isMultiAP"];
  [a3 encodeObject:self->_domainName forKey:@"_domainName"];
  lastJoinedTimestamp = self->_lastJoinedTimestamp;
  [a3 encodeObject:lastJoinedTimestamp forKey:@"_lastJoinedTimestamp"];
}

- (W5WiFiPreferredNetwork)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)W5WiFiPreferredNetwork;
  v4 = [(W5WiFiPreferredNetwork *)&v6 init];
  if (v4)
  {
    v4->_identifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_identifier"), "copy");
    v4->_ssid = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ssid"), "copy");
    v4->_ssidString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_ssidString"), "copy");
    v4->_security = [a3 decodeIntegerForKey:@"_security"];
    v4->_isEnabled = [a3 decodeBoolForKey:@"_isEnabled"];
    v4->_isHidden = [a3 decodeBoolForKey:@"_isHidden"];
    v4->_isCaptive = [a3 decodeBoolForKey:@"_isCaptive"];
    v4->_isPasspoint = [a3 decodeBoolForKey:@"_isPasspoint"];
    v4->_isMultiAP = [a3 decodeBoolForKey:@"_isMultiAP"];
    v4->_domainName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_domainName"), "copy");
    v4->_lastJoinedTimestamp = (NSDate *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_lastJoinedTimestamp"), "copy");
  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(BOOL)a3
{
  self->_isCaptive = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isMultiAP
{
  return self->_isMultiAP;
}

- (void)setIsMultiAP:(BOOL)a3
{
  self->_isMultiAP = a3;
}

- (NSDate)lastJoinedTimestamp
{
  return self->_lastJoinedTimestamp;
}

- (void)setLastJoinedTimestamp:(id)a3
{
}

@end