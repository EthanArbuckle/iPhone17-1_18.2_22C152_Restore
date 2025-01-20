@interface TUConversationVirtualParticipantConfig
+ (BOOL)supportsSecureCoding;
+ (NSString)serverCertHostnameUserDefaultsKey;
+ (NSString)serverCertLeafMarkerOIDUserDefaultsKey;
+ (NSString)serverCertValidationEnabledUserDefaultsKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationVirtualParticipantConfig:(id)a3;
- (BOOL)serverCertValidationEnabled;
- (NSData)idsAliasingSalt;
- (NSString)serverCertHostnameOverride;
- (NSString)serverCertLeafMarkerOIDOverride;
- (TUConversationVirtualParticipantConfig)initWithCoder:(id)a3;
- (TUConversationVirtualParticipantConfig)initWithConnectionRetryIntervalMillis:(unint64_t)a3 connectionMaxAttempts:(unint64_t)a4 rpcStreamRetryIntervalMillis:(unint64_t)a5 rpcStreamMaxAttempts:(unint64_t)a6 serverCertValidationEnabled:(BOOL)a7 serverCertHostnameOverride:(id)a8 serverCertLeafMarkerOIDOverride:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)connectionMaxAttempts;
- (unint64_t)connectionRetryIntervalMillis;
- (unint64_t)hash;
- (unint64_t)rpcStreamMaxAttempts;
- (unint64_t)rpcStreamRetryIntervalMillis;
- (void)encodeWithCoder:(id)a3;
- (void)setIdsAliasingSalt:(id)a3;
@end

@implementation TUConversationVirtualParticipantConfig

+ (NSString)serverCertValidationEnabledUserDefaultsKey
{
  return (NSString *)@"qrPluginCertValidationEnabled";
}

+ (NSString)serverCertHostnameUserDefaultsKey
{
  return (NSString *)@"qrPluginCertHostname";
}

+ (NSString)serverCertLeafMarkerOIDUserDefaultsKey
{
  return (NSString *)@"qrPluginCertLeafMarkerOID";
}

- (TUConversationVirtualParticipantConfig)initWithConnectionRetryIntervalMillis:(unint64_t)a3 connectionMaxAttempts:(unint64_t)a4 rpcStreamRetryIntervalMillis:(unint64_t)a5 rpcStreamMaxAttempts:(unint64_t)a6 serverCertValidationEnabled:(BOOL)a7 serverCertHostnameOverride:(id)a8 serverCertLeafMarkerOIDOverride:(id)a9
{
  id v16 = a8;
  id v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationVirtualParticipantConfig;
  v18 = [(TUConversationVirtualParticipantConfig *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_connectionRetryIntervalMillis = a3;
    v18->_connectionMaxAttempts = a4;
    v18->_rpcStreamRetryIntervalMillis = a5;
    v18->_rpcStreamMaxAttempts = a6;
    v18->_serverCertValidationEnabled = a7;
    objc_storeStrong((id *)&v18->_serverCertHostnameOverride, a8);
    objc_storeStrong((id *)&v19->_serverCertLeafMarkerOIDOverride, a9);
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" connectionRetryIntervalMillis=%lu", -[TUConversationVirtualParticipantConfig connectionRetryIntervalMillis](self, "connectionRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", @" connectionMaxAttempts=%lu", -[TUConversationVirtualParticipantConfig connectionMaxAttempts](self, "connectionMaxAttempts"));
  objc_msgSend(v3, "appendFormat:", @" rpcStreamRetryIntervalMillis=%lu", -[TUConversationVirtualParticipantConfig rpcStreamRetryIntervalMillis](self, "rpcStreamRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", @" rpcStreamRetryIntervalMaxAttempts=%lu", -[TUConversationVirtualParticipantConfig rpcStreamMaxAttempts](self, "rpcStreamMaxAttempts"));
  BOOL v4 = [(TUConversationVirtualParticipantConfig *)self serverCertValidationEnabled];
  v5 = "NO";
  if (v4) {
    v5 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @" serverCertValidationEnabled=%s", v5);
  v6 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];

  if (v6)
  {
    v7 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
    [v3 appendFormat:@" serverCertHostnameOverride=%@", v7];
  }
  v8 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];

  if (v8)
  {
    v9 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
    [v3 appendFormat:@" serverCertLeafMarkerOIDOverride=%@", v9];
  }
  [v3 appendString:@">"];
  v10 = (void *)[v3 copy];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationVirtualParticipantConfig *)self isEqualToConversationVirtualParticipantConfig:v4];

  return v5;
}

- (BOOL)isEqualToConversationVirtualParticipantConfig:(id)a3
{
  id v6 = a3;
  unint64_t v7 = [(TUConversationVirtualParticipantConfig *)self connectionRetryIntervalMillis];
  if (v7 == [v6 connectionRetryIntervalMillis])
  {
    unint64_t v8 = [(TUConversationVirtualParticipantConfig *)self connectionMaxAttempts];
    if (v8 == [v6 connectionMaxAttempts])
    {
      unint64_t v9 = [(TUConversationVirtualParticipantConfig *)self rpcStreamRetryIntervalMillis];
      if (v9 == [v6 rpcStreamRetryIntervalMillis])
      {
        unint64_t v10 = [(TUConversationVirtualParticipantConfig *)self rpcStreamMaxAttempts];
        if (v10 == [v6 rpcStreamMaxAttempts])
        {
          int v11 = [(TUConversationVirtualParticipantConfig *)self serverCertValidationEnabled];
          if (v11 == [v6 serverCertValidationEnabled])
          {
            v14 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
            v15 = [v6 serverCertHostnameOverride];
            if (v14 != v15)
            {
              v3 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
              id v4 = [v6 serverCertHostnameOverride];
              if (![v3 isEqualToString:v4])
              {
                char v12 = 0;
                goto LABEL_21;
              }
            }
            id v16 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
            id v17 = [v6 serverCertLeafMarkerOIDOverride];
            if (v16 != v17)
            {
              v18 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
              v19 = [v6 serverCertLeafMarkerOIDOverride];
              if (![v18 isEqualToString:v19])
              {
                char v12 = 0;
                goto LABEL_19;
              }
              v30 = v19;
              v31 = v18;
            }
            v20 = [(TUConversationVirtualParticipantConfig *)self idsAliasingSalt];
            uint64_t v21 = [v6 idsAliasingSalt];
            if (v20 == (void *)v21)
            {

              char v12 = 1;
            }
            else
            {
              v22 = (void *)v21;
              [(TUConversationVirtualParticipantConfig *)self idsAliasingSalt];
              v23 = v29 = v3;
              [v6 idsAliasingSalt];
              v28 = v16;
              v24 = v15;
              v25 = v14;
              v27 = v26 = v4;
              char v12 = [v23 isEqualToData:v27];

              id v4 = v26;
              v14 = v25;
              v15 = v24;
              id v16 = v28;

              v3 = v29;
            }
            v19 = v30;
            v18 = v31;
            if (v16 == v17)
            {
LABEL_20:

              if (v14 == v15)
              {
LABEL_22:

                goto LABEL_7;
              }
LABEL_21:

              goto LABEL_22;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
      }
    }
  }
  char v12 = 0;
LABEL_7:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TUConversationVirtualParticipantConfig *)self connectionRetryIntervalMillis];
  unint64_t v4 = [(TUConversationVirtualParticipantConfig *)self connectionMaxAttempts] ^ v3;
  unint64_t v5 = [(TUConversationVirtualParticipantConfig *)self rpcStreamRetryIntervalMillis];
  unint64_t v6 = v4 ^ v5 ^ [(TUConversationVirtualParticipantConfig *)self rpcStreamMaxAttempts];
  BOOL v7 = [(TUConversationVirtualParticipantConfig *)self serverCertValidationEnabled];
  uint64_t v8 = 1237;
  if (v7) {
    uint64_t v8 = 1231;
  }
  unint64_t v9 = v6 ^ v8;
  unint64_t v10 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
  uint64_t v11 = [v10 hash];
  char v12 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(TUConversationVirtualParticipantConfig *)self idsAliasingSalt];
  unint64_t v15 = v9 ^ v13 ^ [v14 hash];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(TUConversationVirtualParticipantConfig *)self connectionRetryIntervalMillis];
  unint64_t v6 = [(TUConversationVirtualParticipantConfig *)self connectionMaxAttempts];
  unint64_t v7 = [(TUConversationVirtualParticipantConfig *)self rpcStreamRetryIntervalMillis];
  unint64_t v8 = [(TUConversationVirtualParticipantConfig *)self rpcStreamMaxAttempts];
  BOOL v9 = [(TUConversationVirtualParticipantConfig *)self serverCertValidationEnabled];
  unint64_t v10 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
  uint64_t v11 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
  char v12 = (void *)[v4 initWithConnectionRetryIntervalMillis:v5 connectionMaxAttempts:v6 rpcStreamRetryIntervalMillis:v7 rpcStreamMaxAttempts:v8 serverCertValidationEnabled:v9 serverCertHostnameOverride:v10 serverCertLeafMarkerOIDOverride:v11];

  uint64_t v13 = [(TUConversationVirtualParticipantConfig *)self idsAliasingSalt];
  [v12 setIdsAliasingSalt:v13];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationVirtualParticipantConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_connectionRetryIntervalMillis);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  unint64_t v7 = NSStringFromSelector(sel_connectionMaxAttempts);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];

  BOOL v9 = NSStringFromSelector(sel_rpcStreamRetryIntervalMillis);
  uint64_t v10 = [v4 decodeIntegerForKey:v9];

  uint64_t v11 = NSStringFromSelector(sel_rpcStreamMaxAttempts);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  uint64_t v13 = NSStringFromSelector(sel_serverCertValidationEnabled);
  uint64_t v14 = [v4 decodeBoolForKey:v13];

  uint64_t v15 = objc_opt_class();
  id v16 = NSStringFromSelector(sel_serverCertHostnameOverride);
  id v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

  uint64_t v18 = objc_opt_class();
  v19 = NSStringFromSelector(sel_serverCertLeafMarkerOIDOverride);
  v20 = [v4 decodeObjectOfClass:v18 forKey:v19];

  uint64_t v21 = [(TUConversationVirtualParticipantConfig *)self initWithConnectionRetryIntervalMillis:v6 connectionMaxAttempts:v8 rpcStreamRetryIntervalMillis:v10 rpcStreamMaxAttempts:v12 serverCertValidationEnabled:v14 serverCertHostnameOverride:v17 serverCertLeafMarkerOIDOverride:v20];
  if (v21)
  {
    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_idsAliasingSalt);
    v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    [(TUConversationVirtualParticipantConfig *)v21 setIdsAliasingSalt:v24];
  }
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationVirtualParticipantConfig *)self connectionRetryIntervalMillis];
  uint64_t v6 = NSStringFromSelector(sel_connectionRetryIntervalMillis);
  [v4 encodeInteger:v5 forKey:v6];

  unint64_t v7 = [(TUConversationVirtualParticipantConfig *)self connectionMaxAttempts];
  uint64_t v8 = NSStringFromSelector(sel_connectionMaxAttempts);
  [v4 encodeInteger:v7 forKey:v8];

  unint64_t v9 = [(TUConversationVirtualParticipantConfig *)self rpcStreamRetryIntervalMillis];
  uint64_t v10 = NSStringFromSelector(sel_rpcStreamRetryIntervalMillis);
  [v4 encodeInteger:v9 forKey:v10];

  unint64_t v11 = [(TUConversationVirtualParticipantConfig *)self rpcStreamMaxAttempts];
  uint64_t v12 = NSStringFromSelector(sel_rpcStreamMaxAttempts);
  [v4 encodeInteger:v11 forKey:v12];

  BOOL v13 = [(TUConversationVirtualParticipantConfig *)self serverCertValidationEnabled];
  uint64_t v14 = NSStringFromSelector(sel_serverCertValidationEnabled);
  [v4 encodeBool:v13 forKey:v14];

  uint64_t v15 = [(TUConversationVirtualParticipantConfig *)self serverCertHostnameOverride];
  id v16 = NSStringFromSelector(sel_serverCertHostnameOverride);
  [v4 encodeObject:v15 forKey:v16];

  id v17 = [(TUConversationVirtualParticipantConfig *)self serverCertLeafMarkerOIDOverride];
  uint64_t v18 = NSStringFromSelector(sel_serverCertLeafMarkerOIDOverride);
  [v4 encodeObject:v17 forKey:v18];

  id v20 = [(TUConversationVirtualParticipantConfig *)self idsAliasingSalt];
  v19 = NSStringFromSelector(sel_idsAliasingSalt);
  [v4 encodeObject:v20 forKey:v19];
}

- (unint64_t)connectionRetryIntervalMillis
{
  return self->_connectionRetryIntervalMillis;
}

- (unint64_t)connectionMaxAttempts
{
  return self->_connectionMaxAttempts;
}

- (unint64_t)rpcStreamRetryIntervalMillis
{
  return self->_rpcStreamRetryIntervalMillis;
}

- (unint64_t)rpcStreamMaxAttempts
{
  return self->_rpcStreamMaxAttempts;
}

- (BOOL)serverCertValidationEnabled
{
  return self->_serverCertValidationEnabled;
}

- (NSString)serverCertHostnameOverride
{
  return self->_serverCertHostnameOverride;
}

- (NSString)serverCertLeafMarkerOIDOverride
{
  return self->_serverCertLeafMarkerOIDOverride;
}

- (NSData)idsAliasingSalt
{
  return self->_idsAliasingSalt;
}

- (void)setIdsAliasingSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsAliasingSalt, 0);
  objc_storeStrong((id *)&self->_serverCertLeafMarkerOIDOverride, 0);

  objc_storeStrong((id *)&self->_serverCertHostnameOverride, 0);
}

@end