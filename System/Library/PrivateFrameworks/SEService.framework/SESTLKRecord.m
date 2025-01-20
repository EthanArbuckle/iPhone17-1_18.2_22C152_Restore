@interface SESTLKRecord
+ (id)_uuidFromStringPermissive:(id)a3;
+ (id)withCKKSExternalKey:(id)a3;
+ (id)withView:(id)a3 tlkUUID:(id)a4 parentTLKUUID:(id)a5 recordData:(id)a6;
- (NSData)parentTLKUUID;
- (NSData)recordData;
- (NSData)tlkUUID;
- (NSString)view;
- (id)asCKKSExternalKey;
@end

@implementation SESTLKRecord

+ (id)withView:(id)a3 tlkUUID:(id)a4 parentTLKUUID:(id)a5 recordData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = (void *)v13[1];
  v13[1] = v9;
  id v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  id v17 = v10;

  v18 = (void *)v13[3];
  v13[3] = v11;
  id v19 = v11;

  v20 = (void *)v13[4];
  v13[4] = v12;

  return v13;
}

+ (id)withCKKSExternalKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uuid];
  v6 = [a1 _uuidFromStringPermissive:v5];

  v7 = [v4 parentKeyUUID];
  v8 = [a1 _uuidFromStringPermissive:v7];

  if (v6 && v8)
  {
    id v9 = [v4 view];
    id v10 = objc_msgSend(v6, "ses_toData");
    id v11 = objc_msgSend(v8, "ses_toData");
    id v12 = [v4 keyData];
    v13 = +[SESTLKRecord withView:v9 tlkUUID:v10 parentTLKUUID:v11 recordData:v12];
  }
  else
  {
    v14 = SESDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v4 uuid];
      v16 = [v4 keyData];
      id v17 = [v16 base64];
      int v19 = 138412546;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_2146ED000, v14, OS_LOG_TYPE_ERROR, "Couldn't convert from UUID String %@ %@", (uint8_t *)&v19, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)asCKKSExternalKey
{
  id v3 = objc_alloc(MEMORY[0x263F16CE0]);
  view = self->_view;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", -[NSData bytes](self->_tlkUUID, "bytes"));
  v6 = [v5 UUIDString];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", -[NSData bytes](self->_parentTLKUUID, "bytes"));
  v8 = [v7 UUIDString];
  id v9 = (void *)[v3 initWithView:view uuid:v6 parentTLKUUID:v8 keyData:self->_recordData];

  return v9;
}

+ (id)_uuidFromStringPermissive:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];
    if (v7)
    {
      objc_msgSend(MEMORY[0x263F08C38], "ses_withData:", v7);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Failed to permissive decode UUID %@", (uint8_t *)&v10, 0xCu);
      }

      id v6 = 0;
    }
  }
  return v6;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)tlkUUID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)parentTLKUUID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)recordData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordData, 0);
  objc_storeStrong((id *)&self->_parentTLKUUID, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end