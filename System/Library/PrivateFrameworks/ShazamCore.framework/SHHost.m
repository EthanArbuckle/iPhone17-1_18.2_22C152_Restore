@interface SHHost
- (NSString)name;
- (SHHost)initWithName:(id)a3;
@end

@implementation SHHost

- (SHHost)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHHost;
  v6 = [(SHHost *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end