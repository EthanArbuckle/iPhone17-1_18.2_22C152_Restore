@interface WLKFeature
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFeature:(id)a3;
- (NSString)domain;
- (NSString)name;
- (id)description;
- (id)jsonRepresentation;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setDomain:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation WLKFeature

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name length];
  return [(NSString *)self->_domain length] + v3;
}

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_name, @"name");
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_domain, @"domain");
  v4 = [NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v4 forKey:@"enabled"];

  v5 = (void *)[v3 copy];

  return v5;
}

- (void)setName:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDomain:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WLKFeature *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WLKFeature *)self isEqualToFeature:v4];
  }

  return v5;
}

- (BOOL)isEqualToFeature:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    name = self->_name;
    v7 = [v4 name];
    if ([(NSString *)name isEqual:v7])
    {
      domain = self->_domain;
      v9 = [v5 domain];
      if ([(NSString *)domain isEqual:v9])
      {
        int enabled = self->_enabled;
        BOOL v11 = enabled == [v5 enabled];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WLKFeature *)self name];
  v6 = [v4 name];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WLKFeature;
  id v4 = [(WLKFeature *)&v8 description];
  BOOL v5 = [(WLKFeature *)self jsonRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end