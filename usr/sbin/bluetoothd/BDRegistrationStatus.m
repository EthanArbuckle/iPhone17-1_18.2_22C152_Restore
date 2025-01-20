@interface BDRegistrationStatus
- (BOOL)isEqual:(id)a3;
- (BOOL)roaming;
- (BOOL)service;
- (id)description;
- (void)setRoaming:(BOOL)a3;
- (void)setService:(BOOL)a3;
@end

@implementation BDRegistrationStatus

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(BDRegistrationStatus *)self service];
    if (v6 == [v5 service])
    {
      unsigned int v8 = [(BDRegistrationStatus *)self roaming];
      unsigned int v7 = v8 ^ [v5 roaming] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<service:%d roaming:%d>", [(BDRegistrationStatus *)self service], [(BDRegistrationStatus *)self roaming]];
}

- (BOOL)service
{
  return self->_service;
}

- (void)setService:(BOOL)a3
{
  self->_service = a3;
}

- (BOOL)roaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

@end