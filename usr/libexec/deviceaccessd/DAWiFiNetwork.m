@interface DAWiFiNetwork
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsecured;
- (NSString)SSID;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unint64_t)hash;
- (void)setSSID:(id)a3;
- (void)setUnsecured:(BOOL)a3;
@end

@implementation DAWiFiNetwork

- (BOOL)isEqual:(id)a3
{
  v4 = (DAWiFiNetwork *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v6 = v4;
    if ([(DAWiFiNetwork *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = [(DAWiFiNetwork *)v6 SSID];
      v8 = [(DAWiFiNetwork *)self SSID];
      if ([v7 isEqualToString:v8])
      {
        unsigned int v9 = [(DAWiFiNetwork *)v6 isUnsecured];
        unsigned int v10 = v9 ^ [(DAWiFiNetwork *)self isUnsecured] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_SSID hash];
}

- (id)description
{
  return [(DAWiFiNetwork *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v11 = SSID;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  if (self->_unsecured)
  {
    CUAppendF();
    v7 = v4;

    v4 = v7;
  }
  v8 = &stru_10003DF48;
  if (v4) {
    v8 = v4;
  }
  unsigned int v9 = v8;

  return v9;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (BOOL)isUnsecured
{
  return self->_unsecured;
}

- (void)setUnsecured:(BOOL)a3
{
  self->_unsecured = a3;
}

- (void).cxx_destruct
{
}

@end