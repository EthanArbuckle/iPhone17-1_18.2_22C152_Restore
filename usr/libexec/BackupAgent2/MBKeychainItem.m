@interface MBKeychainItem
+ (id)keychainItemWithAttributes:(id)a3;
- (MBKeychainItem)initWithAttributes:(id)a3;
- (NSData)valueData;
- (NSMutableDictionary)attributes;
- (NSString)accessGroupName;
- (NSString)accessibilityType;
- (NSString)accountName;
- (NSString)serviceName;
- (id)description;
- (void)dealloc;
- (void)setAccessGroupName:(id)a3;
- (void)setAccessibilityType:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setValueData:(id)a3;
@end

@implementation MBKeychainItem

+ (id)keychainItemWithAttributes:(id)a3
{
  v3 = [[MBKeychainItem alloc] initWithAttributes:a3];

  return v3;
}

- (MBKeychainItem)initWithAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBKeychainItem;
  v4 = [(MBKeychainItem *)&v6 init];
  if (v4) {
    v4->_attributes = (NSMutableDictionary *)[a3 mutableCopy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBKeychainItem;
  [(MBKeychainItem *)&v3 dealloc];
}

- (NSString)serviceName
{
  return (NSString *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:kSecAttrService];
}

- (void)setServiceName:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:kSecAttrAccount];
}

- (void)setAccountName:(id)a3
{
}

- (NSString)accessGroupName
{
  return (NSString *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:kSecAttrAccessGroup];
}

- (void)setAccessGroupName:(id)a3
{
}

- (NSString)accessibilityType
{
  return (NSString *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:kSecAttrAccessible];
}

- (void)setAccessibilityType:(id)a3
{
}

- (NSData)valueData
{
  return (NSData *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:kSecValueData];
}

- (void)setValueData:(id)a3
{
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: service=%@, account=%@, accessGroup=%@, accessibility=%@>", objc_opt_class(), [(MBKeychainItem *)self serviceName], [(MBKeychainItem *)self accountName], [(MBKeychainItem *)self accessGroupName], [(MBKeychainItem *)self accessibilityType]];
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

@end