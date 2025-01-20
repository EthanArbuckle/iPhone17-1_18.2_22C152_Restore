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
  id v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)cipherSuite, @"cipherSuite");
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->_dhInfo, @"dhInfo");
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->_passphrase, @"passphrase");
  objc_msgSend_encodeObject_forKey_(v10, v8, (uint64_t)self->_datapathPmk, @"datapathPmk");
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)self->_datapathPmkID, @"datapathPmkID");
}

- (STSCHWiFiAwareSecurityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  v5 = [(STSCHWiFiAwareSecurityInfo *)&v35 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"cipherSuite");
    cipherSuite = v5->_cipherSuite;
    v5->_cipherSuite = (NSArray *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v18 = objc_msgSend_setWithObjects_(v14, v17, v15, v16, 0);
    uint64_t v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"dhInfo");
    dhInfo = v5->_dhInfo;
    v5->_dhInfo = (NSArray *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"passphrase");
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"datapathPmk");
    datapathPmk = v5->_datapathPmk;
    v5->_datapathPmk = (NSData *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"datapathPmkID");
    datapathPmkID = v5->_datapathPmkID;
    v5->_datapathPmkID = (NSData *)v32;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSCHWiFiAwareSecurityInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToData = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    cipherSuite = self->_cipherSuite;
    id v10 = objc_msgSend_cipherSuite(v6, v8, v9);
    LODWORD(cipherSuite) = objc_msgSend_isEqualToArray_(cipherSuite, v11, (uint64_t)v10);

    if (!cipherSuite) {
      goto LABEL_15;
    }
    dhInfo = self->_dhInfo;
    uint64_t v15 = objc_msgSend_dhInfo(v6, v12, v13);
    LODWORD(dhInfo) = objc_msgSend_isEqualToArray_(dhInfo, v16, (uint64_t)v15);

    if (!dhInfo) {
      goto LABEL_15;
    }
    uint64_t v19 = objc_msgSend_length(self->_passphrase, v17, v18);
    uint64_t v22 = objc_msgSend_passphrase(v6, v20, v21);
    uint64_t v25 = objc_msgSend_length(v22, v23, v24);

    if (v19 != v25) {
      goto LABEL_15;
    }
    passphrase = self->_passphrase;
    if (passphrase)
    {
      v29 = objc_msgSend_passphrase(v6, v26, v27);
      int isEqualToString = objc_msgSend_isEqualToString_(passphrase, v30, (uint64_t)v29);

      if (!isEqualToString) {
        goto LABEL_15;
      }
    }
    datapathPmk = self->_datapathPmk;
    if (!datapathPmk
      || (objc_msgSend_datapathPmk(v6, v26, v27),
          v33 = objc_claimAutoreleasedReturnValue(),
          int v35 = objc_msgSend_isEqualToData_(datapathPmk, v34, (uint64_t)v33),
          v33,
          v35))
    {
      datapathPmkID = self->_datapathPmkID;
      if (datapathPmkID)
      {
        v37 = objc_msgSend_datapathPmkID(v6, v26, v27);
        char isEqualToData = objc_msgSend_isEqualToData_(datapathPmkID, v38, (uint64_t)v37);
      }
      else
      {
        char isEqualToData = 1;
      }
    }
    else
    {
LABEL_15:
      char isEqualToData = 0;
    }
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (id)description
{
  if (self->_datapathPmk) {
    objc_msgSend_stringWithFormat_(NSString, a2, @"PMK & PMKID %@available", &stru_26C558D10);
  }
  else {
  v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"PMK & PMKID %@available", @"not ");
  }
  id v4 = NSString;
  uint64_t v7 = objc_msgSend_description(self->_cipherSuite, v5, v6);
  id v10 = objc_msgSend_description(self->_passphrase, v8, v9);
  uint64_t v13 = objc_msgSend_description(self->_dhInfo, v11, v12);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v4, v14, @"cipherSuite=%@, password=%@, DH=%@, %@", v7, v10, v13, v3);

  return v15;
}

- (STSCHWiFiAwareSecurityInfo)initWithCipherSuites:(id)a3 dhInfo:(id)a4 passphrase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  v11 = [(STSCHWiFiAwareSecurityInfo *)&v21 init];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v14 = objc_msgSend_initWithArray_(v12, v13, (uint64_t)v8);
    cipherSuite = v11->_cipherSuite;
    v11->_cipherSuite = (NSArray *)v14;

    id v16 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v18 = objc_msgSend_initWithArray_(v16, v17, (uint64_t)v9);
    dhInfo = v11->_dhInfo;
    v11->_dhInfo = (NSArray *)v18;

    objc_storeStrong((id *)&v11->_passphrase, a5);
  }

  return v11;
}

- (STSCHWiFiAwareSecurityInfo)initWithPMK:(id)a3 pmkID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_length(v8, v9, v10) == 16)
  {
    v15.receiver = self;
    v15.super_class = (Class)STSCHWiFiAwareSecurityInfo;
    v11 = [(STSCHWiFiAwareSecurityInfo *)&v15 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_datapathPmk, a3);
      objc_storeStrong(p_isa + 5, a4);
    }
    self = p_isa;
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)asData
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_data(MEMORY[0x263EFF990], a2, v2);
  if (objc_msgSend_count(self->_cipherSuite, v5, v6))
  {
    char v49 = objc_msgSend_count(self->_cipherSuite, v7, v8) + 1;
    objc_msgSend_appendBytes_length_(v4, v9, (uint64_t)&v49, 1);
    objc_msgSend_appendBytes_length_(v4, v10, (uint64_t)&unk_2146D4309, 1);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v11 = self->_cipherSuite;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v45, v51, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v11);
          }
          char v49 = objc_msgSend_unsignedCharValue(*(void **)(*((void *)&v45 + 1) + 8 * i), v14, v15);
          objc_msgSend_appendBytes_length_(v4, v19, (uint64_t)&v49, 1);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v45, v51, 16);
      }
      while (v16);
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v20 = self->_dhInfo;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v41, v50, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v20);
        }
        uint64_t v28 = objc_msgSend_asData(*(void **)(*((void *)&v41 + 1) + 8 * j), v23, v24, (void)v41);
        objc_msgSend_appendData_(v4, v29, (uint64_t)v28);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v41, v50, 16);
    }
    while (v25);
  }

  passphrase = self->_passphrase;
  if (passphrase && objc_msgSend_length(passphrase, v30, v31))
  {
    char v49 = objc_msgSend_length(self->_passphrase, v33, v34) + 1;
    objc_msgSend_appendBytes_length_(v4, v35, (uint64_t)&v49, 1);
    objc_msgSend_appendBytes_length_(v4, v36, (uint64_t)&unk_2146D430A, 1);
    v38 = objc_msgSend_dataUsingEncoding_(self->_passphrase, v37, 4);
    objc_msgSend_appendData_(v4, v39, (uint64_t)v38);
  }

  return v4;
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