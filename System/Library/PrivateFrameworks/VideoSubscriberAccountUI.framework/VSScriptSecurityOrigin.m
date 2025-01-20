@interface VSScriptSecurityOrigin
- (BOOL)isEqual:(id)a3;
- (NSString)host;
- (NSString)scheme;
- (id)description;
- (int64_t)port;
- (unint64_t)hash;
- (void)setHost:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setScheme:(id)a3;
@end

@implementation VSScriptSecurityOrigin

- (NSString)scheme
{
  v2 = self->_scheme;
  if (!v2) {
    v2 = &stru_26F361E90;
  }
  return (NSString *)v2;
}

- (NSString)host
{
  v2 = self->_host;
  if (!v2) {
    v2 = &stru_26F361E90;
  }
  return (NSString *)v2;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VSScriptSecurityOrigin;
  v4 = [(VSScriptSecurityOrigin *)&v10 description];
  v5 = [(VSScriptSecurityOrigin *)self scheme];
  v6 = [(VSScriptSecurityOrigin *)self host];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[VSScriptSecurityOrigin port](self, "port"));
  v8 = [v3 stringWithFormat:@"<%@ %@://%@:%@>", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(VSScriptSecurityOrigin *)self scheme];
  uint64_t v4 = [v3 hash];

  v5 = [(VSScriptSecurityOrigin *)self host];
  uint64_t v6 = [v5 hash] ^ v4;

  return v6 ^ [(VSScriptSecurityOrigin *)self port];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x263EFF940];
        uint64_t v8 = *MEMORY[0x263EFF4A0];
        v9 = (objc_class *)objc_opt_class();
        objc_super v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSScriptSecurityOrigin.", v10 format];
      }
      id v11 = v6;
      v12 = [(VSScriptSecurityOrigin *)self scheme];
      v13 = [v11 scheme];
      uint64_t v14 = [v12 compare:v13 options:1];
      v15 = [(VSScriptSecurityOrigin *)self host];
      v16 = [v11 host];
      if (v14) {
        LOBYTE(v17) = 0;
      }
      else {
        BOOL v17 = [v15 compare:v16 options:1] == 0;
      }
      int64_t v19 = [(VSScriptSecurityOrigin *)self port];
      BOOL v18 = v19 == [v11 port] && v17;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)setScheme:(id)a3
{
}

- (void)setHost:(id)a3
{
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

@end