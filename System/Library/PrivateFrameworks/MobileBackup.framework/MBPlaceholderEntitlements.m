@interface MBPlaceholderEntitlements
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (MBPlaceholderEntitlements)initWithBundleID:(id)a3 relativePath:(id)a4 entitlements:(id)a5;
- (MBPlaceholderEntitlements)initWithPropertyList:(id)a3;
- (NSDictionary)entitlements;
- (NSString)bundleID;
- (NSString)relativePath;
- (id)propertyList;
- (void)dealloc;
@end

@implementation MBPlaceholderEntitlements

- (MBPlaceholderEntitlements)initWithBundleID:(id)a3 relativePath:(id)a4 entitlements:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MBPlaceholderEntitlements;
  v8 = [(MBPlaceholderEntitlements *)&v10 init];
  if (v8)
  {
    v8->_bundleID = (NSString *)a3;
    v8->_relativePath = (NSString *)a4;
    v8->_entitlements = (NSDictionary *)a5;
  }
  return v8;
}

- (MBPlaceholderEntitlements)initWithPropertyList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBPlaceholderEntitlements;
  v4 = [(MBPlaceholderEntitlements *)&v6 init];
  if (v4)
  {
    v4->_bundleID = (NSString *)[a3 objectForKeyedSubscript:@"bundleID"];
    v4->_relativePath = (NSString *)[a3 objectForKeyedSubscript:@"relativePath"];
    v4->_entitlements = (NSDictionary *)[a3 objectForKeyedSubscript:@"entitlements"];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBPlaceholderEntitlements;
  [(MBPlaceholderEntitlements *)&v3 dealloc];
}

- (id)propertyList
{
  v3[0] = @"bundleID";
  v3[1] = @"relativePath";
  long long v4 = *(_OWORD *)&self->_bundleID;
  v3[2] = @"entitlements";
  entitlements = self->_entitlements;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:v3 count:3];
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  objc_super v6 = +[NSPropertyListSerialization dataWithPropertyList:self->_entitlements format:200 options:0 error:a4];
  if (v6)
  {
    LOBYTE(v6) = [(NSData *)v6 writeToFile:a3 options:1 error:a4];
  }
  return (char)v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

@end