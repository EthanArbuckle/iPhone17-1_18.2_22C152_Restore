@interface _NUImagePropertiesResult
- (NSString)description;
- (NUImageProperties)properties;
- (void)setProperties:(id)a3;
@end

@implementation _NUImagePropertiesResult

- (void).cxx_destruct
{
}

- (void)setProperties:(id)a3
{
}

- (NUImageProperties)properties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUImagePropertiesResult *)self properties];
  uint64_t v6 = [v5 description];
  v7 = (void *)v6;
  v8 = @"NONE";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = [v3 stringWithFormat:@"<%@:%p> properties=%@", v4, self, v8];

  return (NSString *)v9;
}

@end