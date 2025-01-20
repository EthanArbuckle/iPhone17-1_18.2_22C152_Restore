@interface KCSharingLocalItem
- (BOOL)isEqual:(id)a3;
- (KCSharingInternetPasswordCredential)internetPassword;
- (KCSharingLocalFingerprint)internetPasswordFingerprint;
- (KCSharingLocalFingerprint)privateKeyFingerprint;
- (KCSharingPrivateKeyCredential)privateKey;
- (NSDate)modificationDate;
- (NSString)description;
- (id)initPasskeyWithPrivateKeyDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (id)initPasswordWithInternetPasswordDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation KCSharingLocalItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_internetPassword, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);

  objc_storeStrong((id *)&self->_privateKey, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)modificationDate
{
  int64_t type = self->_type;
  if (type == 2)
  {
    v4 = [(KCSharingLocalItem *)self internetPassword];
  }
  else
  {
    if (type != 1) {
      goto LABEL_6;
    }
    v4 = [(KCSharingLocalItem *)self privateKey];
  }
  v5 = v4;
  v2 = [v4 modificationDate];

LABEL_6:

  return (NSDate *)v2;
}

- (KCSharingLocalFingerprint)internetPasswordFingerprint
{
  if (self->_type != 2)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingLocalItem.m" lineNumber:111 description:@"Can't get Internet password fingerprint for local item of type %ld", self->_type];
  }
  internetPasswordFingerprint = self->_internetPasswordFingerprint;

  return internetPasswordFingerprint;
}

- (KCSharingInternetPasswordCredential)internetPassword
{
  if (self->_type != 2)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingLocalItem.m" lineNumber:106 description:@"Can't get Internet password for local item of type %ld", self->_type];
  }
  internetPassword = self->_internetPassword;

  return internetPassword;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  if (self->_type != 1)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingLocalItem.m" lineNumber:101 description:@"Can't get private key fingerprint for local item of type %ld", self->_type];
  }
  privateKeyFingerprint = self->_privateKeyFingerprint;

  return privateKeyFingerprint;
}

- (KCSharingPrivateKeyCredential)privateKey
{
  if (self->_type != 1)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingLocalItem.m" lineNumber:96 description:@"Can't get private key for local item of type %ld", self->_type];
  }
  privateKey = self->_privateKey;

  return privateKey;
}

- (NSString)description
{
  int64_t v4 = [(KCSharingLocalItem *)self type];
  if (v4 == 2)
  {
    v5 = [(KCSharingLocalItem *)self internetPassword];
    v6 = [(KCSharingLocalItem *)self internetPasswordFingerprint];
    +[NSString stringWithFormat:@"KCSharingLocalItem(password:%@ passwordFingerprint:%@)", v5, v6];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    v5 = [(KCSharingLocalItem *)self privateKey];
    v6 = [(KCSharingLocalItem *)self privateKeyFingerprint];
    +[NSString stringWithFormat:@"KCSharingLocalItem(privateKey:%@ privateKeyFingerprint:%@)", v5, v6];
  v2 = };

LABEL_6:

  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (KCSharingLocalItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    if ([(KCSharingLocalItem *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      id type = self->_type;
      if (type == (id)[(KCSharingLocalItem *)v5 type])
      {
        int64_t v7 = self->_type;
        if (v7 == 2)
        {
          v8 = [(KCSharingLocalItem *)self internetPassword];
          v9 = [(KCSharingLocalItem *)v5 internetPassword];
          if ([v8 isEqual:v9])
          {
            v10 = [(KCSharingLocalItem *)self internetPasswordFingerprint];
            uint64_t v11 = [(KCSharingLocalItem *)v5 internetPasswordFingerprint];
            goto LABEL_13;
          }
LABEL_14:
          unsigned __int8 v12 = 0;
          goto LABEL_15;
        }
        if (v7 == 1)
        {
          v8 = [(KCSharingLocalItem *)self privateKey];
          v9 = [(KCSharingLocalItem *)v5 privateKey];
          if ([v8 isEqual:v9])
          {
            v10 = [(KCSharingLocalItem *)self privateKeyFingerprint];
            uint64_t v11 = [(KCSharingLocalItem *)v5 privateKeyFingerprint];
LABEL_13:
            v13 = (void *)v11;
            unsigned __int8 v12 = [v10 isEqual:v11];

LABEL_15:
            goto LABEL_16;
          }
          goto LABEL_14;
        }
      }
      unsigned __int8 v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    unsigned __int8 v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  unint64_t result = self->_type;
  if (result == 1)
  {
    uint64_t v4 = 24;
    uint64_t v5 = 961;
    uint64_t v6 = 16;
  }
  else
  {
    if (result != 2) {
      return result;
    }
    uint64_t v4 = 40;
    uint64_t v5 = 1922;
    uint64_t v6 = 32;
  }
  id v7 = [*(id *)((char *)&self->super.isa + v6) hash];
  return (unint64_t)[*(id *)((char *)&self->super.isa + v4) hash]
       + 32 * (void)v7
       + v5
       - (void)v7;
}

- (id)initPasswordWithInternetPasswordDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)KCSharingLocalItem;
  uint64_t v6 = [(KCSharingLocalItem *)&v14 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  v6->_id type = 2;
  v8 = [[KCSharingInternetPasswordCredential alloc] initWithDatabaseItem:a3 error:a4];
  internetPassword = v7->_internetPassword;
  v7->_internetPassword = v8;

  if (!v7->_internetPassword) {
    goto LABEL_5;
  }
  v10 = [[KCSharingLocalFingerprint alloc] initWithDatabaseItem:a3 error:a4];
  internetPasswordFingerprint = v7->_internetPasswordFingerprint;
  v7->_internetPasswordFingerprint = v10;

  if (v7->_internetPasswordFingerprint) {
LABEL_4:
  }
    unsigned __int8 v12 = v7;
  else {
LABEL_5:
  }
    unsigned __int8 v12 = 0;

  return v12;
}

- (id)initPasskeyWithPrivateKeyDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)KCSharingLocalItem;
  uint64_t v6 = [(KCSharingLocalItem *)&v14 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  v6->_id type = 1;
  v8 = [[KCSharingPrivateKeyCredential alloc] initWithDatabaseItem:a3 error:a4];
  privateKey = v7->_privateKey;
  v7->_privateKey = v8;

  if (!v7->_privateKey) {
    goto LABEL_5;
  }
  v10 = [[KCSharingLocalFingerprint alloc] initWithDatabaseItem:a3 error:a4];
  privateKeyFingerprint = v7->_privateKeyFingerprint;
  v7->_privateKeyFingerprint = v10;

  if (v7->_privateKeyFingerprint) {
LABEL_4:
  }
    unsigned __int8 v12 = v7;
  else {
LABEL_5:
  }
    unsigned __int8 v12 = 0;

  return v12;
}

@end