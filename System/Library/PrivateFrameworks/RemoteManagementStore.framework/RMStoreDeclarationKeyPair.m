@interface RMStoreDeclarationKeyPair
+ (id)newDeclarationKeyPairWithNewKey:(id)a3;
+ (id)newDeclarationKeyPairWithUpdateKey:(id)a3 replaceKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (RMStoreDeclarationKey)applyKey;
- (RMStoreDeclarationKey)replaceKey;
- (RMStoreDeclarationKeyPair)initWithNewKey:(id)a3 replaceKey:(id)a4;
- (unint64_t)hash;
@end

@implementation RMStoreDeclarationKeyPair

+ (id)newDeclarationKeyPairWithNewKey:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreDeclarationKeyPair alloc] initWithNewKey:v3 replaceKey:0];

  return v4;
}

+ (id)newDeclarationKeyPairWithUpdateKey:(id)a3 replaceKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[RMStoreDeclarationKeyPair alloc] initWithNewKey:v6 replaceKey:v5];

  return v7;
}

- (RMStoreDeclarationKeyPair)initWithNewKey:(id)a3 replaceKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreDeclarationKeyPair;
  v9 = [(RMStoreDeclarationKeyPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applyKey, a3);
    objc_storeStrong((id *)&v10->_replaceKey, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RMStoreDeclarationKeyPair *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(RMStoreDeclarationKeyPair *)self applyKey];
      id v6 = [(RMStoreDeclarationKeyPair *)v4 applyKey];
      if ([v5 isEqual:v6])
      {
        uint64_t v7 = [(RMStoreDeclarationKeyPair *)self replaceKey];
        id v8 = (void *)v7;
        if (v7) {
          v9 = (__CFString *)v7;
        }
        else {
          v9 = &stru_2708C6930;
        }
        uint64_t v10 = [(RMStoreDeclarationKeyPair *)v4 replaceKey];
        v11 = (void *)v10;
        if (v10) {
          objc_super v12 = (__CFString *)v10;
        }
        else {
          objc_super v12 = &stru_2708C6930;
        }
        char v13 = [(__CFString *)v9 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  id v3 = [(RMStoreDeclarationKeyPair *)self applyKey];
  uint64_t v4 = [v3 hash];
  id v5 = [(RMStoreDeclarationKeyPair *)self replaceKey];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (RMStoreDeclarationKey)applyKey
{
  return self->_applyKey;
}

- (RMStoreDeclarationKey)replaceKey
{
  return self->_replaceKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceKey, 0);
  objc_storeStrong((id *)&self->_applyKey, 0);
}

@end