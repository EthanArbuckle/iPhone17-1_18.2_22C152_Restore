@interface NetworkQualityServersResult
+ (BOOL)supportsSecureCoding;
- (NSArray)servers;
- (NetworkQualityServersResult)init;
- (NetworkQualityServersResult)initWithCoder:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setServers:(id)a3;
@end

@implementation NetworkQualityServersResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityServersResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NetworkQualityServersResult;
  v5 = [(NetworkQualityServersResult *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    [v6 setWithObjects:v7, objc_opt_class(), nil];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_servers"];
    servers = v5->_servers;
    v5->_servers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: _servers=%@>", v5, self->_servers];

  return v6;
}

- (NetworkQualityServersResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)NetworkQualityServersResult;
  v2 = [(NetworkQualityServersResult *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    servers = v2->_servers;
    v2->_servers = v3;
  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NetworkQualityServersResult);
  v5 = [(NetworkQualityServersResult *)self servers];
  objc_super v6 = (void *)[v5 copy];
  [(NetworkQualityServersResult *)v4 setServers:v6];

  return v4;
}

- (NSArray)servers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end