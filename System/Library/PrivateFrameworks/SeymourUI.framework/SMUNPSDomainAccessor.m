@interface SMUNPSDomainAccessor
- (SMUNPSDomainAccessor)initWithDomain:(id)a3;
- (id)objectForKey:(id)a3;
- (id)synchronize;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
@end

@implementation SMUNPSDomainAccessor

- (SMUNPSDomainAccessor)initWithDomain:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMUNPSDomainAccessor;
  v5 = [(SMUNPSDomainAccessor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:v4];
    domainAccessor = v5->_domainAccessor;
    v5->_domainAccessor = (NPSDomainAccessor *)v6;
  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  return (id)[(NPSDomainAccessor *)self->_domainAccessor objectForKey:a3];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
}

- (id)synchronize
{
  return (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (void).cxx_destruct
{
}

@end