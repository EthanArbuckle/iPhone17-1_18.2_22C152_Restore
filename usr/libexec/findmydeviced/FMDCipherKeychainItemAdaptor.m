@interface FMDCipherKeychainItemAdaptor
- (FMDCipherKeychainItemAdaptor)initWithCipher:(id)a3;
- (FMDCipherKeychainItemAdaptor)initWithKeychainItem:(id)a3;
- (FMDCiphering)cipher;
- (NSData)rawData;
- (NSDate)creationDate;
- (NSDate)lastModifyDate;
- (NSString)password;
- (void)setCipher:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setLastModifyDate:(id)a3;
- (void)setRawData:(id)a3;
@end

@implementation FMDCipherKeychainItemAdaptor

- (FMDCipherKeychainItemAdaptor)initWithKeychainItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDCipherKeychainItemAdaptor;
  v5 = [(FMDCipherKeychainItemAdaptor *)&v16 init];
  if (v5)
  {
    v6 = [v4 creationDate];
    [(FMDCipherKeychainItemAdaptor *)v5 setCreationDate:v6];

    v7 = [v4 lastModifyDate];
    [(FMDCipherKeychainItemAdaptor *)v5 setLastModifyDate:v7];

    v8 = [v4 rawData];
    [(FMDCipherKeychainItemAdaptor *)v5 setRawData:v8];
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    id v15 = 0;
    v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v8 error:&v15];
    id v12 = v15;
    if (v12)
    {
      sub_100004238();
      v13 = (FMDOneShotCipher *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
        sub_100242D40((uint64_t)v12, &v13->super);
      }
    }
    else
    {
      v13 = [[FMDOneShotCipher alloc] initWithDictionary:v11];
      [(FMDCipherKeychainItemAdaptor *)v5 setCipher:v13];
    }
  }
  return v5;
}

- (FMDCipherKeychainItemAdaptor)initWithCipher:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMDCipherKeychainItemAdaptor;
  v5 = [(FMDCipherKeychainItemAdaptor *)&v15 init];
  v6 = v5;
  if (v5)
  {
    [(FMDCipherKeychainItemAdaptor *)v5 setCipher:v4];
    v7 = +[NSDate date];
    [(FMDCipherKeychainItemAdaptor *)v6 setCreationDate:v7];

    v8 = [(FMDCipherKeychainItemAdaptor *)v6 creationDate];
    [(FMDCipherKeychainItemAdaptor *)v6 setLastModifyDate:v8];

    uint64_t v9 = [v4 dictionaryValue];
    id v14 = 0;
    v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v14];
    id v11 = v14;
    if (v11)
    {
      id v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100242DB8((uint64_t)v11, v12);
      }
    }
    [(FMDCipherKeychainItemAdaptor *)v6 setRawData:v10];
  }
  return v6;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (NSDate)lastModifyDate
{
  return self->_lastModifyDate;
}

- (void)setLastModifyDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (FMDCiphering)cipher
{
  return self->_cipher;
}

- (void)setCipher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cipher, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastModifyDate, 0);

  objc_storeStrong((id *)&self->_rawData, 0);
}

@end