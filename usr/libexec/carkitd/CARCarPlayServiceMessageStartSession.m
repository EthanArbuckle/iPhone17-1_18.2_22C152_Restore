@interface CARCarPlayServiceMessageStartSession
+ (unint64_t)identifier;
- (CARCarPlayServiceMessageStartSession)initWithDictionaryRepresentation:(id)a3;
- (CARCarPlayServiceMessageStartSession)initWithSSID:(id)a3 passphrase:(id)a4 channel:(id)a5 securityType:(id)a6 wirelessIPs:(id)a7 wiredIPs:(id)a8 port:(id)a9 deviceID:(id)a10 publicKey:(id)a11 sourceVersion:(id)a12 sdkVersion:(id)a13 assetIdentifier:(id)a14 assetVersion:(id)a15;
- (NSArray)wiredIPs;
- (NSArray)wirelessIPs;
- (NSNumber)assetVersion;
- (NSNumber)channel;
- (NSNumber)port;
- (NSNumber)securityType;
- (NSString)SSID;
- (NSString)assetIdentifier;
- (NSString)description;
- (NSString)deviceID;
- (NSString)passphrase;
- (NSString)publicKey;
- (NSString)sdkVersion;
- (NSString)sourceVersion;
- (id)dictionaryRepresentation;
@end

@implementation CARCarPlayServiceMessageStartSession

- (CARCarPlayServiceMessageStartSession)initWithSSID:(id)a3 passphrase:(id)a4 channel:(id)a5 securityType:(id)a6 wirelessIPs:(id)a7 wiredIPs:(id)a8 port:(id)a9 deviceID:(id)a10 publicKey:(id)a11 sourceVersion:(id)a12 sdkVersion:(id)a13 assetIdentifier:(id)a14 assetVersion:(id)a15
{
  id v40 = a3;
  id v29 = a4;
  id v39 = a4;
  id v30 = a5;
  id v38 = a5;
  id v31 = a6;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)CARCarPlayServiceMessageStartSession;
  v25 = [(CARCarPlayServiceMessageStartSession *)&v41 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_SSID, a3);
    objc_storeStrong((id *)&v26->_passphrase, v29);
    objc_storeStrong((id *)&v26->_channel, v30);
    objc_storeStrong((id *)&v26->_securityType, v31);
    objc_storeStrong((id *)&v26->_wirelessIPs, a7);
    objc_storeStrong((id *)&v26->_wiredIPs, a8);
    objc_storeStrong((id *)&v26->_port, a9);
    objc_storeStrong((id *)&v26->_deviceID, a10);
    objc_storeStrong((id *)&v26->_publicKey, a11);
    objc_storeStrong((id *)&v26->_sourceVersion, a12);
    objc_storeStrong((id *)&v26->_sdkVersion, a13);
    objc_storeStrong((id *)&v26->_assetIdentifier, a14);
    objc_storeStrong((id *)&v26->_assetVersion, a15);
  }

  return v26;
}

- (NSString)description
{
  v19.receiver = self;
  v19.super_class = (Class)CARCarPlayServiceMessageStartSession;
  v18 = [(CARCarPlayServiceMessageStartSession *)&v19 description];
  v14 = [(CARCarPlayServiceMessageStartSession *)self SSID];
  v17 = [(CARCarPlayServiceMessageStartSession *)self passphrase];
  v16 = [(CARCarPlayServiceMessageStartSession *)self channel];
  v3 = [(CARCarPlayServiceMessageStartSession *)self securityType];
  v4 = [(CARCarPlayServiceMessageStartSession *)self wirelessIPs];
  v5 = [(CARCarPlayServiceMessageStartSession *)self wiredIPs];
  v13 = [(CARCarPlayServiceMessageStartSession *)self port];
  v6 = [(CARCarPlayServiceMessageStartSession *)self deviceID];
  v7 = [(CARCarPlayServiceMessageStartSession *)self publicKey];
  v8 = [(CARCarPlayServiceMessageStartSession *)self sourceVersion];
  v9 = [(CARCarPlayServiceMessageStartSession *)self sdkVersion];
  v10 = [(CARCarPlayServiceMessageStartSession *)self assetIdentifier];
  v11 = [(CARCarPlayServiceMessageStartSession *)self assetVersion];
  id v15 = +[NSString stringWithFormat:@"%@ {ssid: %@, pass: %@, channel: %@, security: %@, wirelessIPs: %@, wiredIPs: %@, port: %@, deviceID: %@, publicKey: %@, srcVersion: %@, sdkVersion: %@, assetID: %@, assetVersion: %@}", v18, v14, v17, v16, v3, v4, v5, v13, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

+ (unint64_t)identifier
{
  return 3;
}

- (CARCarPlayServiceMessageStartSession)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 objectForKey:@"wireless"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (!v6)
    {
      v8 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100072C04();
      }
      v9 = 0;
      goto LABEL_127;
    }
    objc_opt_class();
    id v7 = [v6 objectForKey:@"SSID"];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }

    if (!v8)
    {
      v11 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100072D60();
      }
      v9 = 0;
      goto LABEL_126;
    }
    objc_opt_class();
    id v10 = [v6 objectForKey:@"passphrase"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }

    if (!v11)
    {
      v13 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100072DD4();
      }
      v9 = 0;
      goto LABEL_125;
    }
    objc_opt_class();
    id v12 = [v6 objectForKey:@"channel"];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }

    if (!v13)
    {
      id v15 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100072E48();
      }
      v9 = 0;
      goto LABEL_124;
    }
    objc_opt_class();
    id v14 = [v6 objectForKey:@"securityType"];
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (v15)
    {
      objc_opt_class();
      id v16 = [v6 objectForKey:@"ipAddresses"];
      if (v16 && (objc_opt_isKindOfClass() & 1) != 0) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }

      if (v17)
      {
        v72 = v15;
        v73 = v13;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        obj = v17;
        v18 = (char *)[obj countByEnumeratingWithState:&v79 objects:v84 count:16];
        if (v18)
        {
          objc_super v19 = v18;
          uint64_t v20 = *(void *)v80;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(void *)v80 != v20) {
                objc_enumerationMutation(obj);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v17 = obj;

                v9 = 0;
                id v15 = v72;
                v13 = v73;
                goto LABEL_123;
              }
            }
            objc_super v19 = (char *)[obj countByEnumeratingWithState:&v79 objects:v84 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        objc_opt_class();
        id v22 = [v4 objectForKey:@"wired"];
        if (v22 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v23 = v22;
        }
        else {
          id v23 = 0;
        }

        objc_opt_class();
        id v25 = [v23 objectForKey:@"ipAddresses"];
        if (v25 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v26 = v25;
        }
        else {
          id v26 = 0;
        }

        v70 = v26;
        v71 = v23;
        if (!v26 && v23)
        {
          v27 = sub_10005C6FC(2uLL);
          id v15 = v72;
          v13 = v73;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100072F30();
          }
          v9 = 0;
          v17 = obj;
          goto LABEL_121;
        }
        v69 = v11;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v28 = v26;
        id v29 = (char *)[v28 countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v76;
          while (2)
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(void *)v76 != v31) {
                objc_enumerationMutation(v28);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v9 = 0;
                v27 = v28;
                id v15 = v72;
                v13 = v73;
                v17 = obj;
                v11 = v69;
                goto LABEL_121;
              }
            }
            id v30 = (char *)[v28 countByEnumeratingWithState:&v75 objects:v83 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        if (v71 && ![v28 count])
        {
          v9 = 0;
          id v15 = v72;
          v13 = v73;
          v17 = obj;
          v11 = v69;
LABEL_122:

          goto LABEL_123;
        }
        v64 = v28;
        uint64_t v33 = objc_opt_class();
        id v34 = [v4 objectForKey:@"port"];
        uint64_t v35 = sub_100032500(v33, v34);

        v27 = v35;
        v13 = v73;
        v11 = v69;
        if (!v35)
        {
          v68 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
            sub_100072FA4();
          }
          v9 = 0;
          id v15 = v72;
          v17 = obj;
          goto LABEL_120;
        }
        v66 = v35;
        uint64_t v36 = objc_opt_class();
        id v37 = [v4 objectForKey:@"deviceID"];
        uint64_t v38 = sub_100032500(v36, v37);

        v68 = v38;
        if (!v38)
        {
          v67 = sub_10005C6FC(2uLL);
          id v15 = v72;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            sub_100073018();
          }
          v9 = 0;
          v17 = obj;
          v27 = v66;
          goto LABEL_119;
        }
        uint64_t v39 = objc_opt_class();
        id v40 = [v4 objectForKey:@"publicKey"];
        uint64_t v41 = sub_100032500(v39, v40);

        v67 = v41;
        if (!v41)
        {
          v63 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            sub_10007308C();
          }
          v9 = 0;
          id v15 = v72;
          v17 = obj;
          v27 = v66;
          goto LABEL_118;
        }
        uint64_t v42 = objc_opt_class();
        v43 = [v4 objectForKey:@"sourceVersion"];
        uint64_t v44 = sub_100032500(v42, v43);

        v63 = v44;
        if (!v44)
        {
          v62 = sub_10005C6FC(2uLL);
          id v15 = v72;
          v17 = obj;
          v27 = v66;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            sub_100073100();
          }
          v9 = 0;
          goto LABEL_117;
        }
        uint64_t v45 = objc_opt_class();
        v46 = [v4 objectForKey:@"sdkVersion"];
        uint64_t v47 = sub_100032500(v45, v46);

        v62 = v47;
        if (!v47)
        {
          v61 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            sub_100073174();
          }
          v9 = 0;
          id v15 = v72;
          v17 = obj;
          v27 = v66;
          goto LABEL_116;
        }
        uint64_t v48 = objc_opt_class();
        v49 = [v4 objectForKey:@"asset"];
        v50 = sub_100032500(v48, v49);

        v61 = v50;
        if (v50)
        {
          uint64_t v51 = objc_opt_class();
          v52 = [v50 objectForKey:@"id"];
          uint64_t v53 = sub_100032500(v51, v52);

          v60 = v53;
          if (!v53)
          {
            v60 = sub_10005C6FC(2uLL);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              sub_1000731E8();
            }
            v9 = 0;
            id v15 = v72;
            v13 = v73;
            v17 = obj;
            v27 = v66;
            v11 = v69;
            goto LABEL_115;
          }
          uint64_t v54 = objc_opt_class();
          v55 = [v50 objectForKey:@"version"];
          uint64_t v56 = sub_100032500(v54, v55);

          if (!v56)
          {
            v65 = sub_10005C6FC(2uLL);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              sub_10007325C();
              v58 = v65;
              v9 = 0;
              id v15 = v72;
              v13 = v73;
              v17 = obj;
              v27 = v66;
            }
            else
            {
              v9 = 0;
              id v15 = v72;
              v13 = v73;
              v17 = obj;
              v58 = v65;
              v27 = v66;
            }
            v11 = v69;
            goto LABEL_111;
          }
          id v15 = v72;
          v17 = obj;
          v27 = v66;
          v57 = v60;
        }
        else
        {
          v57 = 0;
          uint64_t v56 = 0;
          id v15 = v72;
          v17 = obj;
          v27 = v66;
        }
        v60 = v57;
        self = [(CARCarPlayServiceMessageStartSession *)self initWithSSID:v8 passphrase:v69 channel:v73 securityType:v15 wirelessIPs:v17 wiredIPs:v64 port:v27 deviceID:v68 publicKey:v67 sourceVersion:v63 sdkVersion:v62 assetIdentifier:v57 assetVersion:v56];
        v58 = (void *)v56;
        v9 = self;
LABEL_111:

LABEL_115:
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
LABEL_120:

LABEL_121:
        goto LABEL_122;
      }
      id v24 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100072F30();
      }
    }
    else
    {
      v17 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100072EBC();
      }
    }
    v9 = 0;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

    goto LABEL_128;
  }
  v9 = 0;
LABEL_128:

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [(CARCarPlayServiceMessageStartSession *)self SSID];
  [v4 cr_setSafeObject:v5 forKey:@"SSID"];

  id v6 = [(CARCarPlayServiceMessageStartSession *)self passphrase];
  [v4 cr_setSafeObject:v6 forKey:@"passphrase"];

  id v7 = [(CARCarPlayServiceMessageStartSession *)self channel];
  [v4 cr_setSafeObject:v7 forKey:@"channel"];

  v8 = [(CARCarPlayServiceMessageStartSession *)self securityType];
  [v4 cr_setSafeObject:v8 forKey:@"securityType"];

  v9 = [(CARCarPlayServiceMessageStartSession *)self wirelessIPs];
  [v4 cr_setSafeObject:v9 forKey:@"ipAddresses"];

  [v3 setObject:v4 forKey:@"wireless"];
  uint64_t v10 = [(CARCarPlayServiceMessageStartSession *)self wiredIPs];
  v11 = (void *)v10;
  if (v10)
  {
    CFStringRef v23 = @"ipAddresses";
    uint64_t v24 = v10;
    id v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v3 setObject:v12 forKey:@"wired"];
  }
  v13 = [(CARCarPlayServiceMessageStartSession *)self port];
  [v3 cr_setSafeObject:v13 forKey:@"port"];

  id v14 = [(CARCarPlayServiceMessageStartSession *)self deviceID];
  [v3 cr_setSafeObject:v14 forKey:@"deviceID"];

  id v15 = [(CARCarPlayServiceMessageStartSession *)self publicKey];
  [v3 cr_setSafeObject:v15 forKey:@"publicKey"];

  id v16 = [(CARCarPlayServiceMessageStartSession *)self sourceVersion];
  [v3 cr_setSafeObject:v16 forKey:@"sourceVersion"];

  v17 = [(CARCarPlayServiceMessageStartSession *)self sdkVersion];
  [v3 cr_setSafeObject:v17 forKey:@"sdkVersion"];

  v18 = [(CARCarPlayServiceMessageStartSession *)self assetIdentifier];
  uint64_t v19 = [(CARCarPlayServiceMessageStartSession *)self assetVersion];
  uint64_t v20 = (void *)v19;
  if (v18 && v19)
  {
    id v21 = +[NSMutableDictionary dictionary];
    [v21 setObject:v18 forKey:@"id"];
    [v21 setObject:v20 forKey:@"version"];
    [v3 setObject:v21 forKey:@"asset"];
  }

  return v3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSNumber)securityType
{
  return self->_securityType;
}

- (NSArray)wirelessIPs
{
  return self->_wirelessIPs;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSArray)wiredIPs
{
  return self->_wiredIPs;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSNumber)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_wiredIPs, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_wirelessIPs, 0);
  objc_storeStrong((id *)&self->_securityType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);

  objc_storeStrong((id *)&self->_SSID, 0);
}

@end