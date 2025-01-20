@interface KTSelfStatusResult
+ (BOOL)supportsSecureCoding;
- (BOOL)everOptIn;
- (BOOL)isEqual:(id)a3;
- (BOOL)pendingStatusChanges;
- (KTSelfStatusResult)init;
- (KTSelfStatusResult)initWithCoder:(id)a3;
- (NSArray)selfDevices;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSString)accountKey;
- (id)description;
- (id)simpleStatus;
- (unint64_t)accountStatus;
- (unint64_t)idsAccountStatus;
- (unint64_t)optIn;
- (unint64_t)selfStatus;
- (unint64_t)serverOptIn;
- (unint64_t)systemStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setAccountStatus:(unint64_t)a3;
- (void)setEverOptIn:(BOOL)a3;
- (void)setIdsAccountStatus:(unint64_t)a3;
- (void)setOptIn:(unint64_t)a3;
- (void)setPendingStatusChanges:(BOOL)a3;
- (void)setSelfDevices:(id)a3;
- (void)setSelfStatus:(unint64_t)a3;
- (void)setServerOptIn:(unint64_t)a3;
- (void)setSystemStatus:(unint64_t)a3;
@end

@implementation KTSelfStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTSelfStatusResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)KTSelfStatusResult;
  v2 = [(KTSelfStatusResult *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(KTSelfStatusResult *)v2 setOptIn:2];
    [(KTSelfStatusResult *)v3 setEverOptIn:0];
    [(KTSelfStatusResult *)v3 setServerOptIn:2];
    [(KTSelfStatusResult *)v3 setAccountStatus:0];
    [(KTSelfStatusResult *)v3 setSystemStatus:2];
    [(KTSelfStatusResult *)v3 setSelfStatus:2];
    [(KTSelfStatusResult *)v3 setPendingStatusChanges:1];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult optIn](self, "optIn"));
  [v16 encodeObject:v4 forKey:@"optInState"];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", -[KTSelfStatusResult everOptIn](self, "everOptIn"));
  [v16 encodeObject:v5 forKey:@"everOptInState"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult serverOptIn](self, "serverOptIn"));
  [v16 encodeObject:v6 forKey:@"serverOptInState"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult accountStatus](self, "accountStatus"));
  [v16 encodeObject:v7 forKey:@"accountStatus"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult systemStatus](self, "systemStatus"));
  [v16 encodeObject:v8 forKey:@"systemStatus"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult selfStatus](self, "selfStatus"));
  [v16 encodeObject:v9 forKey:@"selfStatus"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTSelfStatusResult idsAccountStatus](self, "idsAccountStatus"));
  [v16 encodeObject:v10 forKey:@"idsAccountStatus"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[KTSelfStatusResult pendingStatusChanges](self, "pendingStatusChanges"));
  [v16 encodeObject:v11 forKey:@"pendingChanges"];

  v12 = [(KTSelfStatusResult *)self selfDevices];

  if (v12)
  {
    v13 = [(KTSelfStatusResult *)self selfDevices];
    [v16 encodeObject:v13 forKey:@"selfDevices"];
  }
  v14 = [(KTSelfStatusResult *)self accountKey];

  if (v14)
  {
    v15 = [(KTSelfStatusResult *)self accountKey];
    [v16 encodeObject:v15 forKey:@"accountKey"];
  }
}

- (KTSelfStatusResult)initWithCoder:(id)a3
{
  id v3 = a3;
  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"optInState"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"everOptInState"];
  objc_super v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serverOptInState"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountStatus"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"systemStatus"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selfStatus"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"idsAccountStatus"];
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pendingChanges"];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v3 decodeObjectOfClasses:v11 forKey:@"selfDevices"];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountKey"];

  v14 = objc_alloc_init(KTSelfStatusResult);
  -[KTSelfStatusResult setOptIn:](v14, "setOptIn:", objc_msgSend(v16, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTSelfStatusResult setEverOptIn:](v14, "setEverOptIn:", [v4 BOOLValue]);
  -[KTSelfStatusResult setServerOptIn:](v14, "setServerOptIn:", objc_msgSend(v5, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTSelfStatusResult setAccountStatus:](v14, "setAccountStatus:", objc_msgSend(v6, "kt_enumValueWithMax:defaultValue:", 5, 0));
  -[KTSelfStatusResult setSystemStatus:](v14, "setSystemStatus:", objc_msgSend(v7, "kt_enumValueWithMax:defaultValue:", 5, 2));
  -[KTSelfStatusResult setSelfStatus:](v14, "setSelfStatus:", objc_msgSend(v8, "kt_enumValueWithMax:defaultValue:", 4, 2));
  -[KTSelfStatusResult setIdsAccountStatus:](v14, "setIdsAccountStatus:", objc_msgSend(v17, "kt_enumValueWithMax:defaultValue:", 3, 0));
  [(KTSelfStatusResult *)v14 setSelfDevices:v12];
  [(KTSelfStatusResult *)v14 setAccountKey:v13];
  -[KTSelfStatusResult setPendingStatusChanges:](v14, "setPendingStatusChanges:", [v18 BOOLValue]);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KTSelfStatusResult *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(KTSelfStatusResult *)self optIn];
      if (v6 != [(KTSelfStatusResult *)v5 optIn]) {
        goto LABEL_13;
      }
      BOOL v7 = [(KTSelfStatusResult *)self everOptIn];
      if (v7 != [(KTSelfStatusResult *)v5 everOptIn]) {
        goto LABEL_13;
      }
      unint64_t v8 = [(KTSelfStatusResult *)self accountStatus];
      if (v8 != [(KTSelfStatusResult *)v5 accountStatus]) {
        goto LABEL_13;
      }
      unint64_t v9 = [(KTSelfStatusResult *)self systemStatus];
      if (v9 != [(KTSelfStatusResult *)v5 systemStatus]) {
        goto LABEL_13;
      }
      unint64_t v10 = [(KTSelfStatusResult *)self selfStatus];
      if (v10 != [(KTSelfStatusResult *)v5 selfStatus]) {
        goto LABEL_13;
      }
      unint64_t v11 = [(KTSelfStatusResult *)self idsAccountStatus];
      if (v11 != [(KTSelfStatusResult *)v5 idsAccountStatus]) {
        goto LABEL_13;
      }
      v12 = [(KTSelfStatusResult *)self selfDevices];
      v13 = [(KTSelfStatusResult *)v5 selfDevices];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        BOOL v15 = [(KTSelfStatusResult *)self pendingStatusChanges];
        BOOL v16 = v15 ^ [(KTSelfStatusResult *)v5 pendingStatusChanges] ^ 1;
      }
      else
      {
LABEL_13:
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  v4 = KTOptInGetString([(KTSelfStatusResult *)self optIn]);
  BOOL v5 = [(KTSelfStatusResult *)self everOptIn];
  unint64_t v6 = KTOptInGetString([(KTSelfStatusResult *)self serverOptIn]);
  unint64_t v7 = [(KTSelfStatusResult *)self accountStatus] - 1;
  if (v7 > 5) {
    unint64_t v8 = @"Unknown";
  }
  else {
    unint64_t v8 = off_26479EB28[v7];
  }
  unint64_t v9 = [(KTSelfStatusResult *)self systemStatus] - 1;
  if (v9 > 4) {
    unint64_t v10 = @"OK";
  }
  else {
    unint64_t v10 = off_26479EB58[v9];
  }
  unint64_t v11 = [(KTSelfStatusResult *)self selfStatus] - 1;
  if (v11 > 3) {
    v12 = @"OK";
  }
  else {
    v12 = off_26479EB80[v11];
  }
  unint64_t v13 = [(KTSelfStatusResult *)self idsAccountStatus] - 1;
  if (v13 > 2) {
    int v14 = @"IDSAccountStatusInvalid";
  }
  else {
    int v14 = off_26479EBA0[v13];
  }
  BOOL v15 = [(KTSelfStatusResult *)self pendingStatusChanges];
  BOOL v16 = @"NO";
  if (v15) {
    BOOL v16 = @"YES";
  }
  v17 = [v3 stringWithFormat:@"KTStatus: optIn = %@, everOptIn = %d, serverOptIn = %@, accountStatus = %@, systemStatus = %@, selfStatus = %@, idsAccountStatus = %@, pendingChanges: %@\n", v4, v5, v6, v8, v10, v12, v14, v16];

  v18 = [(KTSelfStatusResult *)self selfDevices];
  [v17 appendFormat:@"\tdevices:%@\n", v18];

  return v17;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:@"2" forKeyedSubscript:@"copy_status_version"];
  v4 = KTOptInGetString([(KTSelfStatusResult *)self optIn]);
  [v3 setObject:v4 forKeyedSubscript:@"optedIn"];

  BOOL v5 = objc_msgSend(NSNumber, "numberWithBool:", -[KTSelfStatusResult everOptIn](self, "everOptIn"));
  [v3 setObject:v5 forKeyedSubscript:@"everOptIn"];

  unint64_t v6 = KTOptInGetString([(KTSelfStatusResult *)self serverOptIn]);
  [v3 setObject:v6 forKeyedSubscript:@"serverOptedIn"];

  unint64_t v7 = [(KTSelfStatusResult *)self accountStatus] - 1;
  if (v7 > 5) {
    unint64_t v8 = @"Unknown";
  }
  else {
    unint64_t v8 = off_26479EB28[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"accountStatus"];
  unint64_t v9 = [(KTSelfStatusResult *)self systemStatus] - 1;
  if (v9 > 4) {
    unint64_t v10 = @"OK";
  }
  else {
    unint64_t v10 = off_26479EB58[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"systemStatus"];
  unint64_t v11 = [(KTSelfStatusResult *)self selfStatus] - 1;
  if (v11 > 3) {
    v12 = @"OK";
  }
  else {
    v12 = off_26479EB80[v11];
  }
  [v3 setObject:v12 forKeyedSubscript:@"selfStatus"];
  unint64_t v13 = [(KTSelfStatusResult *)self idsAccountStatus] - 1;
  if (v13 > 2) {
    int v14 = @"IDSAccountStatusInvalid";
  }
  else {
    int v14 = off_26479EBA0[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"idsAccountStatus"];
  BOOL v15 = [(KTSelfStatusResult *)self selfDevices];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    v17 = (void *)MEMORY[0x263EFF980];
    v18 = [(KTSelfStatusResult *)self selfDevices];
    v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v20 = [(KTSelfStatusResult *)self selfDevices];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) diagnosticsJsonDictionary];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"loggableDevices"];
  }
  v26 = [(KTSelfStatusResult *)self accountKey];
  [v3 setObject:v26 forKeyedSubscript:@"accountKey"];

  if ([(KTSelfStatusResult *)self pendingStatusChanges]) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  [v3 setObject:v27 forKeyedSubscript:@"pendingChanges"];

  return (NSDictionary *)v3;
}

- (id)simpleStatus
{
  id v3 = objc_alloc_init(KTStatusResult);
  [(KTStatusResult *)v3 setOptIn:[(KTSelfStatusResult *)self optIn]];
  [(KTStatusResult *)v3 setServerOptIn:[(KTSelfStatusResult *)self serverOptIn]];
  [(KTStatusResult *)v3 setAccountStatus:[(KTSelfStatusResult *)self accountStatus]];
  [(KTStatusResult *)v3 setSystemStatus:[(KTSelfStatusResult *)self systemStatus]];
  [(KTStatusResult *)v3 setSelfStatus:[(KTSelfStatusResult *)self selfStatus]];
  [(KTStatusResult *)v3 setIdsAccountStatus:[(KTSelfStatusResult *)self idsAccountStatus]];
  [(KTStatusResult *)v3 setOptInState:[(KTStatusResult *)v3 optIn] == 1];
  [(KTStatusResult *)v3 setPendingStatusChanges:[(KTSelfStatusResult *)self pendingStatusChanges]];

  return v3;
}

- (unint64_t)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(unint64_t)a3
{
  self->_optIn = a3;
}

- (BOOL)everOptIn
{
  return self->_everOptIn;
}

- (void)setEverOptIn:(BOOL)a3
{
  self->_everOptIn = a3;
}

- (unint64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(unint64_t)a3
{
  self->_accountStatus = a3;
}

- (unint64_t)systemStatus
{
  return self->_systemStatus;
}

- (void)setSystemStatus:(unint64_t)a3
{
  self->_systemStatus = a3;
}

- (unint64_t)selfStatus
{
  return self->_selfStatus;
}

- (void)setSelfStatus:(unint64_t)a3
{
  self->_selfStatus = a3;
}

- (unint64_t)idsAccountStatus
{
  return self->_idsAccountStatus;
}

- (void)setIdsAccountStatus:(unint64_t)a3
{
  self->_idsAccountStatus = a3;
}

- (NSString)accountKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSArray)selfDevices
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelfDevices:(id)a3
{
}

- (BOOL)pendingStatusChanges
{
  return self->_pendingStatusChanges;
}

- (void)setPendingStatusChanges:(BOOL)a3
{
  self->_pendingStatusChanges = a3;
}

- (unint64_t)serverOptIn
{
  return self->_serverOptIn;
}

- (void)setServerOptIn:(unint64_t)a3
{
  self->_serverOptIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfDevices, 0);

  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end