@interface SESDesignatedKey
+ (id)fromDictionary:(id)a3;
+ (id)withAID:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9;
- (NSData)aid;
- (NSData)assetACL;
- (NSData)assetACLAttestation;
- (NSData)keyIdentifier;
- (id)asDictionary;
- (int64_t)designation;
- (int64_t)operationApprovalVersion;
- (int64_t)slotNumber;
@end

@implementation SESDesignatedKey

+ (id)withAID:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = objc_opt_new();
  v19 = (void *)v18[3];
  v18[3] = v14;
  id v20 = v14;

  v18[4] = a4;
  v21 = (void *)v18[2];
  v18[2] = v15;
  id v22 = v15;

  v23 = (void *)v18[5];
  v18[5] = v16;
  id v24 = v16;

  v25 = (void *)v18[6];
  v18[6] = v17;

  v18[7] = a8;
  v18[1] = a9;
  return v18;
}

+ (id)fromDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"AID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 objectForKeyedSubscript:@"slotNumber"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"slotNumber";
        _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      id v12 = 0;
      goto LABEL_34;
    }
    v7 = [v3 objectForKeyedSubscript:@"keyIdentifier"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"keyIdentifier";
        _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      id v12 = 0;
      goto LABEL_33;
    }
    v8 = [v3 objectForKeyedSubscript:@"assetACL"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = SESDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"assetACL";
        _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      id v12 = 0;
      goto LABEL_32;
    }
    v9 = [v3 objectForKeyedSubscript:@"assetACLAttestation"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = SESDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"assetACLAttestation";
        _os_log_impl(&dword_2146ED000, v10, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      id v12 = 0;
      goto LABEL_31;
    }
    v10 = [v3 objectForKeyedSubscript:@"oaVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v3 objectForKeyedSubscript:@"designation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)(v4 + 24), v5);
        *(void *)(v4 + 32) = [v6 integerValue];
        objc_storeStrong((id *)(v4 + 16), v7);
        objc_storeStrong((id *)(v4 + 40), v8);
        objc_storeStrong((id *)(v4 + 48), v9);
        *(void *)(v4 + 56) = [v10 integerValue];
        *(void *)(v4 + 8) = [v11 integerValue];
        id v12 = (id)v4;
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
      v13 = SESDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"designation";
        _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      v11 = SESDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2112;
        v18 = @"oaVersion";
        _os_log_impl(&dword_2146ED000, v11, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
    }
    id v12 = 0;
    goto LABEL_30;
  }
  v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v15 = 138412546;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2112;
    v18 = @"AID";
    _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
  }
  id v12 = 0;
LABEL_35:

  return v12;
}

- (id)asDictionary
{
  v12[7] = *MEMORY[0x263EF8340];
  int64_t slotNumber = self->_slotNumber;
  v12[0] = self->_aid;
  v11[0] = @"AID";
  v11[1] = @"slotNumber";
  uint64_t v4 = [NSNumber numberWithInteger:slotNumber];
  keyIdentifier = self->_keyIdentifier;
  v12[1] = v4;
  v12[2] = keyIdentifier;
  v11[2] = @"keyIdentifier";
  v11[3] = @"assetACL";
  assetACLAttestation = self->_assetACLAttestation;
  v12[3] = self->_assetACL;
  v12[4] = assetACLAttestation;
  v11[4] = @"assetACLAttestation";
  v11[5] = @"oaVersion";
  v7 = [NSNumber numberWithInteger:self->_operationApprovalVersion];
  v12[5] = v7;
  v11[6] = @"designation";
  v8 = [NSNumber numberWithInteger:self->_designation];
  v12[6] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

- (int64_t)designation
{
  return self->_designation;
}

- (NSData)keyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)aid
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)slotNumber
{
  return self->_slotNumber;
}

- (NSData)assetACL
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)assetACLAttestation
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)operationApprovalVersion
{
  return self->_operationApprovalVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetACLAttestation, 0);
  objc_storeStrong((id *)&self->_assetACL, 0);
  objc_storeStrong((id *)&self->_aid, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end