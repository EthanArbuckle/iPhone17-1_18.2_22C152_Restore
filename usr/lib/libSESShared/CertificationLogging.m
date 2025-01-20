@interface CertificationLogging
+ (id)getInstance;
+ (void)bleLogMessageReceived:(id)a3 peerUUID:(id)a4;
+ (void)bleLogMessageSent:(id)a3 peerUUID:(id)a4;
+ (void)bleLogRSSI:(id)a3 peerUUID:(id)a4;
+ (void)bleLogVehicleConnected:(id)a3;
+ (void)bleLogVehicleDisconnected:(id)a3;
+ (void)logEncryptedAPDU:(id)a3 decrypted:(id)a4;
- (void)logEvent:(void *)a3 message:(void *)a4 peerUUID:;
@end

@implementation CertificationLogging

+ (id)getInstance
{
  self;
  if (getInstance_onceToken_1 != -1) {
    dispatch_once(&getInstance_onceToken_1, &__block_literal_global_5);
  }
  v0 = (void *)getInstance_instance_1;

  return v0;
}

void __35__CertificationLogging_getInstance__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@".GlobalPreferences"];
  if ([v4 BOOLForKey:@"com.apple.CarKeysTests.enableCertificationLogging"])
  {
    uint64_t v0 = objc_opt_new();
    v1 = (void *)getInstance_instance_1;
    getInstance_instance_1 = v0;

    os_log_t v2 = os_log_create("com.apple.certification", "digitalCarKey");
    v3 = *(void **)(getInstance_instance_1 + 8);
    *(void *)(getInstance_instance_1 + 8) = v2;
  }
}

- (void)logEvent:(void *)a3 message:(void *)a4 peerUUID:
{
  v50[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        if (v8)
        {
          v50[0] = @"event";
          v49[0] = @"log_type";
          v49[1] = @"vehicle_uuid";
          id v10 = [v8 UUIDString];
          v49[2] = @"payload";
          v50[1] = v10;
          v50[2] = @"connect";
          v11 = NSDictionary;
          v12 = v50;
          v13 = v49;
          goto LABEL_9;
        }
        break;
      case 1:
        if (v8)
        {
          v48[0] = @"event";
          v47[0] = @"log_type";
          v47[1] = @"vehicle_uuid";
          id v10 = [v8 UUIDString];
          v47[2] = @"payload";
          v48[1] = v10;
          v48[2] = @"disconnect";
          v11 = NSDictionary;
          v12 = v48;
          v13 = v47;
LABEL_9:
          v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:3];
          goto LABEL_23;
        }
        break;
      case 2:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v42[0] = @"dck_message";
              v41[0] = @"log_type";
              v41[1] = @"vehicle_uuid";
              id v10 = [v9 UUIDString];
              v42[1] = v10;
              v42[2] = @"out";
              v41[2] = @"direction";
              v41[3] = @"payload";
              v18 = [v7 base64];
              v42[3] = v18;
              v19 = NSDictionary;
              v20 = v42;
              v21 = v41;
              goto LABEL_18;
            }
          }
          v14 = SESDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v44 = 2;
            __int16 v45 = 2112;
            id v46 = v7;
            v15 = "Wrong payload for event type %lu %@";
            goto LABEL_47;
          }
          goto LABEL_49;
        }
        break;
      case 3:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40[0] = @"dck_message";
              v39[0] = @"log_type";
              v39[1] = @"vehicle_uuid";
              id v10 = [v9 UUIDString];
              v40[1] = v10;
              v40[2] = @"in";
              v39[2] = @"direction";
              v39[3] = @"payload";
              v18 = [v7 base64];
              v40[3] = v18;
              v19 = NSDictionary;
              v20 = v40;
              v21 = v39;
LABEL_18:
              v14 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:4];

              goto LABEL_23;
            }
          }
          v14 = SESDefaultLogObject();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v44 = 3;
          __int16 v45 = 2112;
          id v46 = v7;
          v15 = "Wrong payload for event type %lu %@";
          goto LABEL_47;
        }
        break;
      case 4:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = (void *)[v7 mutableCopy];
              v33[0] = MEMORY[0x263EF8330];
              v33[1] = 3221225472;
              v33[2] = __50__CertificationLogging_logEvent_message_peerUUID___block_invoke;
              v33[3] = &unk_2655D65F8;
              id v34 = v22;
              id v10 = v22;
              [v7 enumerateKeysAndObjectsUsingBlock:v33];
              v38[0] = @"rssi";
              v37[0] = @"log_type";
              v37[1] = @"vehicle_uuid";
              v23 = [v9 UUIDString];
              v37[2] = @"payload";
              v38[1] = v23;
              v38[2] = v10;
              v14 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

LABEL_23:
              goto LABEL_30;
            }
          }
          v14 = SESDefaultLogObject();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v44 = 4;
          __int16 v45 = 2112;
          id v46 = v7;
          v15 = "Wrong payload for event type %lu %@";
LABEL_47:
          v16 = v14;
          uint32_t v17 = 22;
          goto LABEL_48;
        }
        break;
      case 5:
        if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v24 = SESDefaultLogObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v44 = 5;
            __int16 v45 = 2112;
            id v46 = v7;
            _os_log_impl(&dword_263826000, v24, OS_LOG_TYPE_ERROR, "Wrong payload for event type %lu %@", buf, 0x16u);
          }
        }
        v35[0] = @"log_type";
        v35[1] = @"payload";
        v36[0] = @"dck_decrypted";
        v36[1] = v7;
        v14 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
LABEL_30:
        if ([MEMORY[0x263F08900] isValidJSONObject:v14])
        {
          id v32 = 0;
          v25 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:0 error:&v32];
          id v26 = v32;
          if (v26)
          {
            v27 = SESDefaultLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v44 = (uint64_t)v14;
              __int16 v45 = 2112;
              id v46 = v26;
              _os_log_impl(&dword_263826000, v27, OS_LOG_TYPE_ERROR, "Failed to serialize object %@ %@", buf, 0x16u);
            }
          }
          else
          {
            v29 = *(NSObject **)(a1 + 8);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
LABEL_40:

              goto LABEL_49;
            }
            v30 = (objc_class *)NSString;
            v27 = v29;
            v31 = (void *)[[v30 alloc] initWithData:v25 encoding:4];
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = (uint64_t)v31;
            _os_log_impl(&dword_263826000, v27, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
          goto LABEL_40;
        }
        v28 = SESDefaultLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)v14;
          _os_log_impl(&dword_263826000, v28, OS_LOG_TYPE_ERROR, "Invalid JSON object %@", buf, 0xCu);
        }

LABEL_49:
        break;
      default:
        v14 = SESDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v44 = a2;
          v15 = "Unknown event type %lu";
          v16 = v14;
          uint32_t v17 = 12;
LABEL_48:
          _os_log_impl(&dword_263826000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        }
        goto LABEL_49;
    }
  }
}

void __50__CertificationLogging_logEvent_message_peerUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 base64];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v6 = [v5 UUIDString];
  }
  id v7 = (void *)v6;
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v8];

LABEL_6:
}

+ (void)bleLogVehicleConnected:(id)a3
{
  id v3 = a3;
  +[CertificationLogging getInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v4, 0, 0, v3);
}

+ (void)bleLogVehicleDisconnected:(id)a3
{
  id v3 = a3;
  +[CertificationLogging getInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v4, 1, 0, v3);
}

+ (void)bleLogMessageSent:(id)a3 peerUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[CertificationLogging getInstance]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 2, v6, v5);
}

+ (void)bleLogMessageReceived:(id)a3 peerUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[CertificationLogging getInstance]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 3, v6, v5);
}

+ (void)bleLogRSSI:(id)a3 peerUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[CertificationLogging getInstance]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 4, v6, v5);
}

+ (void)logEncryptedAPDU:(id)a3 decrypted:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    id v7 = +[CertificationLogging getInstance]();
    v11[0] = @"raw_payload";
    id v8 = [v5 base64];
    v11[1] = @"decrypted_payload";
    v12[0] = v8;
    v9 = [v6 base64];
    v12[1] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 5, v10, 0);
  }
}

- (void).cxx_destruct
{
}

@end