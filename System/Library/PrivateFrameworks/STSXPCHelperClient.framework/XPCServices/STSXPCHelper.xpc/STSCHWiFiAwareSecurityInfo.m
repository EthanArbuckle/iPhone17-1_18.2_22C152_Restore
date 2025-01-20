@interface STSCHWiFiAwareSecurityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)cipherSuite;
- (NSArray)dhInfo;
- (NSData)datapathPmk;
- (NSData)datapathPmkID;
- (NSString)passphrase;
- (STSCHWiFiAwareSecurityInfo)initWithCipherSuites:(id)a3 dhInfo:(id)a4 passphrase:(id)a5;
- (STSCHWiFiAwareSecurityInfo)initWithCoder:(id)a3;
- (STSCHWiFiAwareSecurityInfo)initWithPMK:(id)a3 pmkID:(id)a4;
- (id)asData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCipherSuite:(id)a3;
- (void)setDatapathPmk:(id)a3;
- (void)setDatapathPmkID:(id)a3;
- (void)setDhInfo:(id)a3;
- (void)setPassphrase:(id)a3;
@end

@implementation STSCHWiFiAwareSecurityInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  cipherSuite = self->_cipherSuite;
  id v5 = a3;
  [v5 encodeObject:cipherSuite forKey:@"cipherSuite"];
  [v5 encodeObject:self->_dhInfo forKey:@"dhInfo"];
  [v5 encodeObject:self->_passphrase forKey:@"passphrase"];
  [v5 encodeObject:self->_datapathPmk forKey:@"datapathPmk"];
  [v5 encodeObject:self->_datapathPmkID forKey:@"datapathPmkID"];
}

- (STSCHWiFiAwareSecurityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  id v5 = [(STSCHWiFiAwareSecurityInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"cipherSuite"];
    cipherSuite = v5->_cipherSuite;
    v5->_cipherSuite = (NSArray *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"dhInfo"];
    dhInfo = v5->_dhInfo;
    v5->_dhInfo = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passphrase"];
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datapathPmk"];
    datapathPmk = v5->_datapathPmk;
    v5->_datapathPmk = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datapathPmkID"];
    datapathPmkID = v5->_datapathPmkID;
    v5->_datapathPmkID = (NSData *)v18;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSCHWiFiAwareSecurityInfo *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v22 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    cipherSuite = self->_cipherSuite;
    uint64_t v8 = [(STSCHWiFiAwareSecurityInfo *)v6 cipherSuite];
    LODWORD(cipherSuite) = [(NSArray *)cipherSuite isEqualToArray:v8];

    if (!cipherSuite) {
      goto LABEL_15;
    }
    dhInfo = self->_dhInfo;
    uint64_t v10 = [(STSCHWiFiAwareSecurityInfo *)v6 dhInfo];
    LODWORD(dhInfo) = [(NSArray *)dhInfo isEqualToArray:v10];

    if (!dhInfo) {
      goto LABEL_15;
    }
    NSUInteger v11 = [(NSString *)self->_passphrase length];
    uint64_t v12 = [(STSCHWiFiAwareSecurityInfo *)v6 passphrase];
    id v13 = [v12 length];

    if ((id)v11 != v13) {
      goto LABEL_15;
    }
    passphrase = self->_passphrase;
    if (passphrase)
    {
      v15 = [(STSCHWiFiAwareSecurityInfo *)v6 passphrase];
      unsigned int v16 = [(NSString *)passphrase isEqualToString:v15];

      if (!v16) {
        goto LABEL_15;
      }
    }
    datapathPmk = self->_datapathPmk;
    if (!datapathPmk
      || ([(STSCHWiFiAwareSecurityInfo *)v6 datapathPmk],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unsigned int v19 = [(NSData *)datapathPmk isEqualToData:v18],
          v18,
          v19))
    {
      datapathPmkID = self->_datapathPmkID;
      if (datapathPmkID)
      {
        objc_super v21 = [(STSCHWiFiAwareSecurityInfo *)v6 datapathPmkID];
        unsigned __int8 v22 = [(NSData *)datapathPmkID isEqualToData:v21];
      }
      else
      {
        unsigned __int8 v22 = 1;
      }
    }
    else
    {
LABEL_15:
      unsigned __int8 v22 = 0;
    }
  }
  else
  {
    unsigned __int8 v22 = 0;
  }

  return v22;
}

- (id)description
{
  if (self->_datapathPmk) {
    CFStringRef v3 = &stru_100055900;
  }
  else {
    CFStringRef v3 = @"not ";
  }
  id v4 = +[NSString stringWithFormat:@"PMK & PMKID %@available", v3];
  id v5 = [(NSArray *)self->_cipherSuite description];
  uint64_t v6 = [(NSString *)self->_passphrase description];
  v7 = [(NSArray *)self->_dhInfo description];
  uint64_t v8 = +[NSString stringWithFormat:@"cipherSuite=%@, password=%@, DH=%@, %@", v5, v6, v7, v4];

  return v8;
}

- (STSCHWiFiAwareSecurityInfo)initWithCipherSuites:(id)a3 dhInfo:(id)a4 passphrase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  NSUInteger v11 = [(STSCHWiFiAwareSecurityInfo *)&v17 init];
  if (v11)
  {
    uint64_t v12 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v8];
    cipherSuite = v11->_cipherSuite;
    v11->_cipherSuite = v12;

    uint64_t v14 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v9];
    dhInfo = v11->_dhInfo;
    v11->_dhInfo = v14;

    objc_storeStrong((id *)&v11->_passphrase, a5);
  }

  return v11;
}

- (STSCHWiFiAwareSecurityInfo)initWithPMK:(id)a3 pmkID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length] == (id)16)
  {
    v13.receiver = self;
    v13.super_class = (Class)STSCHWiFiAwareSecurityInfo;
    id v9 = [(STSCHWiFiAwareSecurityInfo *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_datapathPmk, a3);
      objc_storeStrong(p_isa + 5, a4);
    }
    self = p_isa;
    NSUInteger v11 = self;
  }
  else
  {
    NSUInteger v11 = 0;
  }

  return v11;
}

- (id)asData
{
  CFStringRef v3 = +[NSMutableData data];
  if ([(NSArray *)self->_cipherSuite count])
  {
    unsigned __int8 v26 = [(NSArray *)self->_cipherSuite count] + 1;
    [v3 appendBytes:&v26 length:1];
    [v3 appendBytes:&unk_100052219 length:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = self->_cipherSuite;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned __int8 v26 = [*(id *)(*((void *)&v22 + 1) + 8 * i) unsignedCharValue];
          [v3 appendBytes:&v26 length:1];
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v6);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_dhInfo;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)j), "asData", (void)v18);
        [v3 appendData:v14];
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v11);
  }

  passphrase = self->_passphrase;
  if (passphrase && [(NSString *)passphrase length])
  {
    unsigned __int8 v26 = [(NSString *)self->_passphrase length] + 1;
    [v3 appendBytes:&v26 length:1];
    [v3 appendBytes:&unk_10005221A length:1];
    unsigned int v16 = [(NSString *)self->_passphrase dataUsingEncoding:4];
    [v3 appendData:v16];
  }

  return v3;
}

- (NSArray)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(id)a3
{
}

- (NSArray)dhInfo
{
  return self->_dhInfo;
}

- (void)setDhInfo:(id)a3
{
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
}

- (NSData)datapathPmk
{
  return self->_datapathPmk;
}

- (void)setDatapathPmk:(id)a3
{
}

- (NSData)datapathPmkID
{
  return self->_datapathPmkID;
}

- (void)setDatapathPmkID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datapathPmkID, 0);
  objc_storeStrong((id *)&self->_datapathPmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_dhInfo, 0);

  objc_storeStrong((id *)&self->_cipherSuite, 0);
}

@end