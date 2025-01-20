@interface _REAppKey
- (BOOL)isEqual:(id)a3;
- (BOOL)remote;
- (NSString)identifier;
- (_REAppKey)initWithIdentifier:(id)a3 remote:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _REAppKey

- (_REAppKey)initWithIdentifier:(id)a3 remote:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REAppKey;
  v7 = [(_REAppKey *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_remote = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash] ^ self->_remote;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REAppKey *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        v9 = identifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10)
        {
          BOOL v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      BOOL v11 = self->_remote == v5->_remote;
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  BOOL remote = self->_remote;
  return (id)[v4 initWithIdentifier:identifier remote:remote];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)remote
{
  return self->_remote;
}

- (void).cxx_destruct
{
}

@end