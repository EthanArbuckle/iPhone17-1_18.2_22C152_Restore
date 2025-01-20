@interface PaceInfo
- (id)description;
- (void)setOptionalParameter:(id)a3;
- (void)setProtocol:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PaceInfo

- (id)description
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 32, 1);
    if (v3)
    {
      v5 = v3;
      [NSString stringWithFormat:@", parameterId=%@", objc_getProperty(self, v4, 32, 1)];
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1F24CADC0;
    }
    v7 = off_1E65ABCA8[self->_protocol];
    int64_t version = self->_version;
  }
  else
  {
    int64_t version = 0;
    v6 = &stru_1F24CADC0;
    v7 = "DH_GM_3DES_CBC_CBC";
  }
  v9 = [NSString stringWithFormat:@"PACEInfo: protocol=%s, version=%ld%@", v7, version, v6];

  return v9;
}

- (void)setProtocol:(int64_t)a3
{
  self->_protocol = a3;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (void)setOptionalParameter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end