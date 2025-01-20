@interface NIServerKeychainItem
- (BOOL)isEqual:(id)a3;
- (NIServerKeychainItem)initWithService:(id)a3 account:(id)a4 data:(id)a5;
- (NSData)data;
- (NSString)account;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation NIServerKeychainItem

- (NIServerKeychainItem)initWithService:(id)a3 account:(id)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v16 = "service";
    int v17 = 734;
    goto LABEL_10;
  }
  if (!v10)
  {
    v16 = "account";
    int v17 = 735;
    goto LABEL_10;
  }
  if (!v11)
  {
    v16 = "data";
    int v17 = 736;
LABEL_10:
    __assert_rtn("-[NIServerKeychainItem initWithService:account:data:]", "NIServerKeychainManager.mm", v17, v16);
  }
  v18.receiver = self;
  v18.super_class = (Class)NIServerKeychainItem;
  v13 = [(NIServerKeychainItem *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    objc_storeStrong((id *)&v14->_data, a5);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NIServerKeychainItem alloc];
  service = self->_service;
  account = self->_account;
  data = self->_data;

  return [(NIServerKeychainItem *)v4 initWithService:service account:account data:data];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIServerKeychainItem *)v4;
    v6 = v5;
    if (v5 == self)
    {
      BOOL v18 = 1;
    }
    else
    {
      service = v5->_service;
      v8 = self->_service;
      unsigned int v9 = [(NSString *)service isEqualToString:v8];
      if ((unint64_t)service | (unint64_t)v8) {
        int v10 = v9;
      }
      else {
        int v10 = 1;
      }
      unint64_t account = (unint64_t)v6->_account;
      v12 = self->_account;
      unsigned int v13 = [(id)account isEqualToString:v12];
      if (account | (unint64_t)v12) {
        int v14 = v13;
      }
      else {
        int v14 = 1;
      }
      unint64_t data = (unint64_t)v6->_data;
      BOOL v16 = (data | (unint64_t)self->_data) == 0;
      unsigned int v17 = v14 & (v16 | [data isEqualToData:]);
      if (v10) {
        BOOL v18 = v17;
      }
      else {
        BOOL v18 = 0;
      }
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_service hash];
  unint64_t v4 = [(NSString *)self->_account hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_data hash];
}

- (id)description
{
  if (+[NIPlatformInfo isInternalBuild]) {
    +[NSString stringWithFormat:@"%@", self->_data];
  }
  else {
  NSUInteger v3 = +[NSString stringWithFormat:@"{length = %d}", [(NSData *)self->_data length]];
  }
  unint64_t v4 = +[NSString stringWithFormat:@"<%@ -- %@ : %@>", self->_service, self->_account, v3];

  return v4;
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end