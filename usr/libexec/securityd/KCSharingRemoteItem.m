@interface KCSharingRemoteItem
- (BOOL)isEqual:(id)a3;
- (KCSharingInternetPasswordCredential)internetPassword;
- (KCSharingPrivateKeyCredential)privateKey;
- (KCSharingRemoteItem)initWithLocalItem:(id)a3;
- (NSString)description;
- (id)initPasskeyWithPrivateKey:(id)a3;
- (id)initPasskeyWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5;
- (id)initPasswordWithInternetPassword:(id)a3;
- (id)initPasswordWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5;
- (id)proto;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation KCSharingRemoteItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPassword, 0);

  objc_storeStrong((id *)&self->_privateKey, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (id)proto
{
  int64_t type = self->_type;
  if (type == 2)
  {
    v4 = objc_opt_new();
    v5 = [(KCSharingInternetPasswordCredential *)self->_internetPassword proto];
    [v4 setInternetPassword:v5];
    goto LABEL_5;
  }
  if (type == 1)
  {
    v4 = objc_opt_new();
    v5 = [(KCSharingPrivateKeyCredential *)self->_privateKey proto];
    [v4 setPrivateKey:v5];
LABEL_5:

    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (KCSharingInternetPasswordCredential)internetPassword
{
  if (self->_type != 2)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingRemoteItem.m" lineNumber:115 description:@"Can't get Internet password for remote item of type %ld" , self->_type];
  }
  internetPassword = self->_internetPassword;

  return internetPassword;
}

- (KCSharingPrivateKeyCredential)privateKey
{
  if (self->_type != 1)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingRemoteItem.m" lineNumber:110 description:@"Can't get private key for remote item of type %ld", self->_type];
  }
  privateKey = self->_privateKey;

  return privateKey;
}

- (NSString)description
{
  int64_t v4 = [(KCSharingRemoteItem *)self type];
  if (v4 == 2)
  {
    v5 = [(KCSharingRemoteItem *)self internetPassword];
    +[NSString stringWithFormat:@"KCSharingRemoteItem(password:%@)", v5];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    v5 = [(KCSharingRemoteItem *)self privateKey];
    +[NSString stringWithFormat:@"KCSharingRemoteItem(privateKey:%@)", v5];
  v2 = };

LABEL_6:

  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (KCSharingRemoteItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    if ([(KCSharingRemoteItem *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      id type = self->_type;
      if (type == (id)[(KCSharingRemoteItem *)v5 type])
      {
        int64_t v7 = self->_type;
        if (v7 == 2)
        {
          v8 = [(KCSharingRemoteItem *)self internetPassword];
          uint64_t v9 = [(KCSharingRemoteItem *)v5 internetPassword];
          goto LABEL_11;
        }
        if (v7 == 1)
        {
          v8 = [(KCSharingRemoteItem *)self privateKey];
          uint64_t v9 = [(KCSharingRemoteItem *)v5 privateKey];
LABEL_11:
          v11 = (void *)v9;
          unsigned __int8 v10 = [v8 isEqual:v9];

          goto LABEL_12;
        }
      }
      unsigned __int8 v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    uint64_t v3 = 31;
    uint64_t v4 = 16;
    return (unint64_t)[*(id *)((char *)&self->super.isa + v4) hash] + v3;
  }
  if (type == 2)
  {
    uint64_t v3 = 62;
    uint64_t v4 = 24;
    return (unint64_t)[*(id *)((char *)&self->super.isa + v4) hash] + v3;
  }
  return type;
}

- (id)initPasswordWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = [KCSharingInternetPasswordCredential alloc];
  v11 = [v9 internetPassword];

  v12 = [(KCSharingInternetPasswordCredential *)v10 initWithProto:v11 sharingGroup:v8 error:a5];
  if (v12)
  {
    self = (KCSharingRemoteItem *)[(KCSharingRemoteItem *)self initPasswordWithInternetPassword:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initPasskeyWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = [KCSharingPrivateKeyCredential alloc];
  v11 = [v9 privateKey];

  v12 = [(KCSharingPrivateKeyCredential *)v10 initWithProto:v11 sharingGroup:v8 error:a5];
  if (v12)
  {
    self = (KCSharingRemoteItem *)[(KCSharingRemoteItem *)self initPasskeyWithPrivateKey:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initPasswordWithInternetPassword:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingRemoteItem;
  v6 = [(KCSharingRemoteItem *)&v9 init];
  int64_t v7 = v6;
  if (v6)
  {
    v6->_unint64_t type = 2;
    objc_storeStrong((id *)&v6->_internetPassword, a3);
  }

  return v7;
}

- (id)initPasskeyWithPrivateKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingRemoteItem;
  v6 = [(KCSharingRemoteItem *)&v9 init];
  int64_t v7 = v6;
  if (v6)
  {
    v6->_unint64_t type = 1;
    objc_storeStrong((id *)&v6->_privateKey, a3);
  }

  return v7;
}

- (KCSharingRemoteItem)initWithLocalItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  if (v5 == (id)2)
  {
    v6 = [v4 internetPassword];
    id v7 = [(KCSharingRemoteItem *)self initPasswordWithInternetPassword:v6];
  }
  else
  {
    if (v5 != (id)1)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    v6 = [v4 privateKey];
    id v7 = [(KCSharingRemoteItem *)self initPasskeyWithPrivateKey:v6];
  }
  self = (KCSharingRemoteItem *)v7;

  id v8 = self;
LABEL_7:

  return v8;
}

@end