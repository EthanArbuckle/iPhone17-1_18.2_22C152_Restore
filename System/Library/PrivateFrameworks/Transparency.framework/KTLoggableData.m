@interface KTLoggableData
+ (BOOL)isAccountKTCapable:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (void)combineLoggableDatasForUI:(id)a3 byAdding:(id)a4;
+ (void)loggableDataForDeviceID:(id)a3 application:(id)a4 completionBlock:(id)a5;
+ (void)loggableDataForDeviceID:(id)a3 completionBlock:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)ktCapable;
- (BOOL)marked;
- (BOOL)notInSyncedData;
- (BOOL)successfulSync;
- (KTLoggableData)initWithClientData:(id)a3;
- (KTLoggableData)initWithCoder:(id)a3;
- (NSData)clientData;
- (NSData)clientDataHash;
- (NSData)deviceID;
- (NSData)deviceIdHash;
- (NSData)signature;
- (NSDate)markExpiryDate;
- (NSError)failure;
- (NSNumber)version;
- (NSString)build;
- (NSString)product;
- (id)debugDescription;
- (id)diagnosticsJsonDictionary;
- (id)shortDescription;
- (unint64_t)result;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setClientData:(id)a3;
- (void)setClientDataHash:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setFailure:(id)a3;
- (void)setKtCapable:(BOOL)a3;
- (void)setMarkExpiryDate:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setNotInSyncedData:(BOOL)a3;
- (void)setProduct:(id)a3;
- (void)setResult:(unint64_t)a3;
- (void)setSignature:(id)a3;
- (void)setSuccessfulSync:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation KTLoggableData

- (KTLoggableData)initWithClientData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTLoggableData;
  v6 = [(KTLoggableData *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientData, a3);
    v7->_result = 2;
    *(_DWORD *)&v7->_successfulSync = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v24 = a3;
  v4 = [(KTLoggableData *)self deviceID];
  [v24 encodeObject:v4 forKey:@"deviceID"];

  id v5 = [(KTLoggableData *)self clientData];
  [v24 encodeObject:v5 forKey:@"clientData"];

  v6 = [(KTLoggableData *)self signature];
  [v24 encodeObject:v6 forKey:@"signature"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData successfulSync](self, "successfulSync"));
  [v24 encodeObject:v7 forKey:@"successfulSync"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData marked](self, "marked"));
  [v24 encodeObject:v8 forKey:@"marked"];

  objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData notInSyncedData](self, "notInSyncedData"));
  [v24 encodeObject:v9 forKey:@"notInSync"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTLoggableData result](self, "result"));
  [v24 encodeObject:v10 forKey:@"result"];

  v11 = [(KTLoggableData *)self failure];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F16D80];
    v13 = [(KTLoggableData *)self failure];
    v14 = [v12 cleanseErrorForXPC:v13];
    [v24 encodeObject:v14 forKey:@"failure"];
  }
  v15 = [(KTLoggableData *)self build];

  if (v15)
  {
    v16 = [(KTLoggableData *)self build];
    [v24 encodeObject:v16 forKey:@"build"];
  }
  v17 = [(KTLoggableData *)self product];

  if (v17)
  {
    v18 = [(KTLoggableData *)self product];
    [v24 encodeObject:v18 forKey:@"product"];
  }
  v19 = [(KTLoggableData *)self version];

  if (v19)
  {
    v20 = [(KTLoggableData *)self version];
    [v24 encodeObject:v20 forKey:@"version"];
  }
  v21 = [(KTLoggableData *)self markExpiryDate];

  if (v21)
  {
    v22 = [(KTLoggableData *)self markExpiryDate];
    [v24 encodeObject:v22 forKey:@"markExpiry"];
  }
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData ktCapable](self, "ktCapable"));
  [v24 encodeObject:v23 forKey:@"ktCapable"];
}

- (KTLoggableData)initWithCoder:(id)a3
{
  id v3 = a3;
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"clientData"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"successfulSync"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"marked"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"notInSync"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
  id v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v6 = [MEMORY[0x263F16D80] safeErrorClasses];
  v7 = [v5 setByAddingObjectsFromSet:v6];

  v8 = [v3 decodeObjectOfClasses:v7 forKey:@"failure"];
  objc_super v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ktCapable"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"markExpiry"];

  v14 = [[KTLoggableData alloc] initWithClientData:v4];
  v15 = v14;
  if (v14 && v23 && v22)
  {
    [(KTLoggableData *)v14 setDeviceID:v21];
    [(KTLoggableData *)v15 setSignature:v17];
    -[KTLoggableData setSuccessfulSync:](v15, "setSuccessfulSync:", [v23 BOOLValue]);
    -[KTLoggableData setMarked:](v15, "setMarked:", [v22 BOOLValue]);
    -[KTLoggableData setNotInSyncedData:](v15, "setNotInSyncedData:", [v20 BOOLValue]);
    -[KTLoggableData setResult:](v15, "setResult:", [v19 unsignedIntegerValue]);
    [(KTLoggableData *)v15 setFailure:v8];
    -[KTLoggableData setKtCapable:](v15, "setKtCapable:", [v9 BOOLValue]);
    [(KTLoggableData *)v15 setBuild:v10];
    [(KTLoggableData *)v15 setProduct:v11];
    [(KTLoggableData *)v15 setVersion:v12];
    [(KTLoggableData *)v15 setMarkExpiryDate:v13];
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KTLoggableData *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(KTLoggableData *)self deviceID];
      uint64_t v7 = [(KTLoggableData *)v5 deviceID];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        objc_super v9 = [(KTLoggableData *)self deviceID];
        v10 = [(KTLoggableData *)v5 deviceID];
        int v11 = [v9 isEqualToData:v10];

        if (!v11) {
          goto LABEL_19;
        }
      }
      v13 = [(KTLoggableData *)self clientData];
      uint64_t v14 = [(KTLoggableData *)v5 clientData];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        v16 = [(KTLoggableData *)self clientData];
        v17 = [(KTLoggableData *)v5 clientData];
        int v18 = [v16 isEqualToData:v17];

        if (!v18) {
          goto LABEL_19;
        }
      }
      v19 = [(KTLoggableData *)self signature];
      uint64_t v20 = [(KTLoggableData *)v5 signature];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(KTLoggableData *)self signature];
        v23 = [(KTLoggableData *)v5 signature];
        int v24 = [v22 isEqualToData:v23];

        if (!v24) {
          goto LABEL_19;
        }
      }
      BOOL v25 = [(KTLoggableData *)self successfulSync];
      if (v25 == [(KTLoggableData *)v5 successfulSync])
      {
        BOOL v26 = [(KTLoggableData *)self ktCapable];
        if (v26 == [(KTLoggableData *)v5 ktCapable])
        {
          BOOL v12 = 1;
          goto LABEL_20;
        }
      }
LABEL_19:
      BOOL v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)debugDescription
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"{\n"];
  v4 = [(KTLoggableData *)self deviceID];

  if (v4)
  {
    id v5 = [(KTLoggableData *)self deviceID];
    v6 = objc_msgSend(v5, "kt_hexString");
    [v3 appendFormat:@"    deviceId:%@\n", v6];
  }
  uint64_t v7 = [(KTLoggableData *)self product];
  if (v7)
  {
  }
  else
  {
    v8 = [(KTLoggableData *)self version];

    if (!v8) {
      goto LABEL_7;
    }
  }
  objc_super v9 = [(KTLoggableData *)self product];
  v10 = [(KTLoggableData *)self build];
  int v11 = [(KTLoggableData *)self version];
  [v3 appendFormat:@"    product: %@ build: %@ version:%@\n", v9, v10, v11];

LABEL_7:
  BOOL v12 = [(KTLoggableData *)self clientData];
  v13 = objc_msgSend(v12, "kt_hexString");
  [v3 appendFormat:@"    clientData:%@\n", v13];

  uint64_t v14 = [(KTLoggableData *)self signature];

  if (v14)
  {
    v15 = [(KTLoggableData *)self signature];
    v16 = objc_msgSend(v15, "kt_hexString");
    [v3 appendFormat:@"    signature:%@\n", v16];
  }
  if ([(KTLoggableData *)self ktCapable]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  [v3 appendFormat:@"    ktCapable:%@\n", v17];
  int v18 = [(KTLoggableData *)self deviceIdHash];

  if (v18)
  {
    v19 = [(KTLoggableData *)self deviceIdHash];
    uint64_t v20 = objc_msgSend(v19, "kt_hexString");
    [v3 appendFormat:@"    deviceIdHash:%@\n", v20];
  }
  v21 = [(KTLoggableData *)self clientDataHash];

  if (v21)
  {
    v22 = [(KTLoggableData *)self clientDataHash];
    v23 = objc_msgSend(v22, "kt_hexString");
    [v3 appendFormat:@"    clientDataHash:%@\n", v23];
  }
  if ([(KTLoggableData *)self notInSyncedData]) {
    int v24 = @"YES";
  }
  else {
    int v24 = @"NO";
  }
  [v3 appendFormat:@"    notInSyncedData:%@\n", v24];
  if ([(KTLoggableData *)self result])
  {
    unint64_t v25 = [(KTLoggableData *)self result];
    BOOL v26 = @"OK";
    if (v25 == 2) {
      BOOL v26 = @"Pending";
    }
  }
  else
  {
    BOOL v26 = @"Failed";
  }
  [v3 appendFormat:@"    result:%@\n", v26];
  v27 = [(KTLoggableData *)self failure];

  if (v27)
  {
    v28 = [(KTLoggableData *)self failure];
    [v3 appendFormat:@"    failure:%@\n", v28];
  }
  if ([(KTLoggableData *)self marked])
  {
    v29 = [(KTLoggableData *)self markExpiryDate];
    [v3 appendFormat:@"    markedExpiryDate:%@\n", v29];
  }
  [v3 appendFormat:@"}\n"];

  return v3;
}

- (id)diagnosticsJsonDictionary
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(KTLoggableData *)self deviceID];

  if (v4)
  {
    id v5 = [(KTLoggableData *)self deviceID];
    v6 = objc_msgSend(v5, "kt_hexString");
    [v3 setObject:v6 forKeyedSubscript:@"deviceID"];
  }
  uint64_t v7 = [(KTLoggableData *)self clientData];
  v8 = objc_msgSend(v7, "kt_hexString");
  [v3 setObject:v8 forKeyedSubscript:@"clientData"];

  objc_super v9 = [(KTLoggableData *)self signature];
  v10 = objc_msgSend(v9, "kt_hexString");
  [v3 setObject:v10 forKeyedSubscript:@"signature"];

  int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData ktCapable](self, "ktCapable"));
  [v3 setObject:v11 forKeyedSubscript:@"ktCapable"];

  BOOL v12 = [(KTLoggableData *)self version];

  if (v12)
  {
    v13 = [(KTLoggableData *)self version];
    [v3 setObject:v13 forKeyedSubscript:@"version"];
  }
  uint64_t v14 = [(KTLoggableData *)self product];

  if (v14)
  {
    v15 = [(KTLoggableData *)self product];
    [v3 setObject:v15 forKeyedSubscript:@"product"];
  }
  v16 = [(KTLoggableData *)self build];

  if (v16)
  {
    v17 = [(KTLoggableData *)self build];
    [v3 setObject:v17 forKeyedSubscript:@"build"];
  }
  int v18 = [(KTLoggableData *)self deviceIdHash];

  if (v18)
  {
    v19 = [(KTLoggableData *)self deviceIdHash];
    uint64_t v20 = objc_msgSend(v19, "kt_hexString");
    [v3 setObject:v20 forKeyedSubscript:@"deviceIDHash"];
  }
  v21 = [(KTLoggableData *)self clientDataHash];

  if (v21)
  {
    v22 = [(KTLoggableData *)self clientDataHash];
    v23 = objc_msgSend(v22, "kt_hexString");
    [v3 setObject:v23 forKeyedSubscript:@"clientDataHash"];
  }
  if ([(KTLoggableData *)self result] != 2)
  {
    int v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTLoggableData result](self, "result"));
    [v3 setObject:v24 forKeyedSubscript:@"result"];

    unint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData notInSyncedData](self, "notInSyncedData"));
    [v3 setObject:v25 forKeyedSubscript:@"notInSyncedData"];

    BOOL v26 = [(KTLoggableData *)self failure];

    if (v26)
    {
      v27 = [(KTLoggableData *)self failure];
      v28 = [v27 description];
      [v3 setObject:v28 forKeyedSubscript:@"failure"];
    }
  }
  if ([(KTLoggableData *)self marked])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[KTLoggableData marked](self, "marked"));
    [v3 setObject:v29 forKeyedSubscript:@"marked"];

    v30 = [(KTLoggableData *)self markExpiryDate];
    v31 = objc_msgSend(v30, "kt_toISO_8601_UTCString");
    [v3 setObject:v31 forKeyedSubscript:@"markedExpiryDate"];
  }

  return v3;
}

- (id)shortDescription
{
  id v3 = [(KTLoggableData *)self product];
  if (v3 || ([(KTLoggableData *)self version], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v4 = NSString;
    id v5 = [(KTLoggableData *)self deviceID];
    v6 = objc_msgSend(v5, "kt_hexString");
    uint64_t v7 = [(KTLoggableData *)self product];
    v8 = [(KTLoggableData *)self build];
    objc_super v9 = [(KTLoggableData *)self version];
    v10 = [(KTLoggableData *)self clientData];
    int v11 = objc_msgSend(v10, "kt_hexString");
    BOOL v12 = [v4 stringWithFormat:@"KTLoggableData: deviceId=%@, version=%@,%@,%@ clientData=%@", v6, v7, v8, v9, v11];

    goto LABEL_5;
  }
  uint64_t v14 = [(KTLoggableData *)self build];

  if (v14) {
    goto LABEL_4;
  }
  v15 = NSString;
  id v5 = [(KTLoggableData *)self deviceID];
  v6 = objc_msgSend(v5, "kt_hexString");
  uint64_t v7 = [(KTLoggableData *)self clientData];
  v8 = objc_msgSend(v7, "kt_hexString");
  BOOL v12 = [v15 stringWithFormat:@"KTLoggableData: deviceId=%@, clientData=%@", v6, v8];
LABEL_5:

  return v12;
}

+ (void)loggableDataForDeviceID:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke;
  v15[3] = &unk_26479E838;
  id v17 = v7;
  id v18 = v9;
  id v16 = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_126;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v7;
  id v12 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v15 errorHandler:v13];
}

void __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_2 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_2, &__block_literal_global_3);
    }
    id v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_2 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_2, &__block_literal_global_124);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      int v12 = 138412546;
      v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous fetch for device status for %@ device %@", (uint8_t *)&v12, 0x16u);
    }
    [v5 getLoggableDataForDeviceId:a1[5] application:a1[4] completionBlock:a1[6]];
  }
}

uint64_t __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_122()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)loggableDataForDeviceID:(id)a3 completionBlock:(id)a4
{
}

+ (BOOL)isAccountKTCapable:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "ktCapable", (void)v12))
          {
            BOOL v10 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_12:
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

+ (void)combineLoggableDatasForUI:(id)a3 byAdding:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 deviceID];
        long long v13 = [v5 objectForKeyedSubscript:v12];

        if ([v11 result]) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          long long v15 = [v11 deviceID];
          [v5 setObject:v11 forKeyedSubscript:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (NSData)deviceID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSData)clientData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientData:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignature:(id)a3
{
}

- (BOOL)successfulSync
{
  return self->_successfulSync;
}

- (void)setSuccessfulSync:(BOOL)a3
{
  self->_successfulSync = a3;
}

- (BOOL)ktCapable
{
  return self->_ktCapable;
}

- (void)setKtCapable:(BOOL)a3
{
  self->_ktCapable = a3;
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBuild:(id)a3
{
}

- (NSString)product
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProduct:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVersion:(id)a3
{
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFailure:(id)a3
{
}

- (NSDate)markExpiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMarkExpiryDate:(id)a3
{
}

- (BOOL)marked
{
  return self->_marked;
}

- (void)setMarked:(BOOL)a3
{
  self->_marked = a3;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (BOOL)notInSyncedData
{
  return self->_notInSyncedData;
}

- (void)setNotInSyncedData:(BOOL)a3
{
  self->_notInSyncedData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
  objc_storeStrong((id *)&self->_markExpiryDate, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_clientData, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end