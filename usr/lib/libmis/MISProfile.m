@interface MISProfile
- (CEQueryContext)derEntitlements;
- (MISProfile)init;
- (NSArray)certs;
- (NSDictionary)entitlements;
- (NSMutableDictionary)payload;
- (NSString)uuid;
- (int)fixUp;
- (int)flavor;
- (void)dealloc;
- (void)setCerts:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setFlavor:(int)a3;
- (void)setPayload:(id)a3;
@end

@implementation MISProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->certs, 0);
  objc_storeStrong((id *)&self->entitlements, 0);
  objc_storeStrong((id *)&self->payload, 0);
  objc_storeStrong((id *)&self->derEntitlementsStorage, 0);

  objc_storeStrong((id *)&self->signature, 0);
}

- (void)setCerts:(id)a3
{
}

- (NSArray)certs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlavor:(int)a3
{
  self->flavor = a3;
}

- (int)flavor
{
  return self->flavor;
}

- (void)setPayload:(id)a3
{
}

- (NSMutableDictionary)payload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (int)fixUp
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!self->_fixedup)
  {
    if ((self->flavor | 2) == 2)
    {
      MISProfileGetValue(self, @"Entitlements");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      entitlements = self->entitlements;
      self->entitlements = v4;

      v6 = MISProfileGetValue(self, @"DeveloperCertificates");
      v7 = (void *)MEMORY[0x263EFF980];
      uint64_t v11 = [v6 count:v8, v9, v10];
      v14 = [v7 arrayWithCapacity:v12, v11, v13];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = v6;
      uint64_t v17 = [v15 countByEnumeratingWithState:v16 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v15);
            }
            CFDataRef v21 = sub_20DC1B790(*(const __CFData **)(*((void *)&v39 + 1) + 8 * i));
            [v14 addObject:v22];
          }
          uint64_t v18 = [v15 countByEnumeratingWithState:v24 objects:(id *)v39 count:v43];
        }
        while (v18);
      }

      objc_storeStrong((id *)&self->certs, v14);
      v38 = 0;
      uint64_t v25 = CESerializeCFDictionary();
      v26 = (void *)MEMORY[0x263F8BAF0];
      if (v25 != *MEMORY[0x263F8BAF0])
      {
        v27 = sub_20DBFFB10();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
LABEL_29:
          _os_log_error_impl(&dword_20DBFC000, v27, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v37, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      derEntitlementsStorage = self->derEntitlementsStorage;
      self->derEntitlementsStorage = v38;

      if (CEManagedContextFromCFData() != *v26)
      {
        v27 = sub_20DBFFB10();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          goto LABEL_29;
        }
LABEL_19:
        int v2 = -402620413;

LABEL_23:
        return v2;
      }

LABEL_27:
      int v2 = 0;
      self->_fixedup = 1;
      return v2;
    }
    MISProfileGetValue(self, @"DeveloperCertificates");
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    certs = self->certs;
    self->certs = v28;

    MISProfileGetValue(self, @"Entitlements");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = CEManagedContextFromCFData();
    v31 = (void *)MEMORY[0x263F8BAF0];
    if (v30 == *MEMORY[0x263F8BAF0])
    {
      v38 = 0;
      if (CEQueryContextToCFDictionary() == *v31)
      {
        v36 = self->entitlements;
        self->entitlements = (NSDictionary *)v38;

        goto LABEL_27;
      }
      v32 = sub_20DBFFB10();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        v33 = v37;
        goto LABEL_31;
      }
    }
    else
    {
      v32 = sub_20DBFFB10();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v38) = 0;
        v33 = (uint8_t *)&v38;
LABEL_31:
        _os_log_error_impl(&dword_20DBFC000, v32, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v33, 2u);
      }
    }
    int v2 = -402620413;

    goto LABEL_23;
  }
  return 0;
}

- (void)dealloc
{
  if (self->ceCtx) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)MISProfile;
  [(MISProfile *)&v3 dealloc];
}

- (CEQueryContext)derEntitlements
{
  return self->ceCtx;
}

- (NSString)uuid
{
  return (NSString *)MISProfileGetValue(self, @"UUID");
}

- (MISProfile)init
{
  v14.receiver = self;
  v14.super_class = (Class)MISProfile;
  int v2 = [(MISProfile *)&v14 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_fixedup = 0;
    signature = v2->signature;
    v2->signature = 0;

    derEntitlementsStorage = v3->derEntitlementsStorage;
    v3->ceCtx = 0;
    v3->derEntitlementsStorage = 0;

    [v3 setPayload:v6];
    [v3 setEntitlements:v8];
    [v3 setCerts:v10];
    v12 = v3;
  }

  return v3;
}

@end