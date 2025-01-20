@interface KTStatusResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)optInState;
- (BOOL)pendingStatusChanges;
- (KTStatusResult)initWithCoder:(id)a3;
- (NSArray)recentFailedEventIds;
- (NSDate)expectedSelfResolutionDate;
- (NSDictionary)diagnosticsJsonDictionary;
- (id)description;
- (unint64_t)accountStatus;
- (unint64_t)idsAccountStatus;
- (unint64_t)optIn;
- (unint64_t)selfStatus;
- (unint64_t)serverOptIn;
- (unint64_t)systemStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountStatus:(unint64_t)a3;
- (void)setExpectedSelfResolutionDate:(id)a3;
- (void)setIdsAccountStatus:(unint64_t)a3;
- (void)setOptIn:(unint64_t)a3;
- (void)setOptInState:(BOOL)a3;
- (void)setPendingStatusChanges:(BOOL)a3;
- (void)setRecentFailedEventIds:(id)a3;
- (void)setSelfStatus:(unint64_t)a3;
- (void)setServerOptIn:(unint64_t)a3;
- (void)setSystemStatus:(unint64_t)a3;
@end

@implementation KTStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult optIn](self, "optIn"));
  [v15 encodeObject:v4 forKey:@"optInState"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult serverOptIn](self, "serverOptIn"));
  [v15 encodeObject:v5 forKey:@"serverOptInState"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult accountStatus](self, "accountStatus"));
  [v15 encodeObject:v6 forKey:@"accountStatus"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult systemStatus](self, "systemStatus"));
  [v15 encodeObject:v7 forKey:@"systemStatus"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult selfStatus](self, "selfStatus"));
  [v15 encodeObject:v8 forKey:@"selfStatus"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTStatusResult idsAccountStatus](self, "idsAccountStatus"));
  [v15 encodeObject:v9 forKey:@"idsAccountStatus"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[KTStatusResult pendingStatusChanges](self, "pendingStatusChanges"));
  [v15 encodeObject:v10 forKey:@"pendingChanges"];

  v11 = [(KTStatusResult *)self recentFailedEventIds];

  if (v11)
  {
    v12 = [(KTStatusResult *)self recentFailedEventIds];
    [v15 encodeObject:v12 forKey:@"failureEventIds"];
  }
  v13 = [(KTStatusResult *)self expectedSelfResolutionDate];

  if (v13)
  {
    v14 = [(KTStatusResult *)self expectedSelfResolutionDate];
    [v15 encodeObject:v14 forKey:@"selfResolutionDate"];
  }
}

- (KTStatusResult)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"optInState"];
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serverOptInState"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountStatus"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"systemStatus"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selfStatus"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"idsAccountStatus"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pendingChanges"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v3 decodeObjectOfClasses:v12 forKey:@"failureEventIds"];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selfResolutionDate"];

  id v15 = objc_alloc_init(KTStatusResult);
  [(KTStatusResult *)v15 setRecentFailedEventIds:v13];
  [(KTStatusResult *)v15 setExpectedSelfResolutionDate:v14];
  uint64_t v16 = objc_msgSend(v4, "kt_enumValueWithMax:defaultValue:", 2, 2);
  [(KTStatusResult *)v15 setOptIn:v16];
  [(KTStatusResult *)v15 setOptInState:v16 == 1];
  -[KTStatusResult setServerOptIn:](v15, "setServerOptIn:", objc_msgSend(v18, "kt_enumValueWithMax:defaultValue:", 2, 2));
  -[KTStatusResult setAccountStatus:](v15, "setAccountStatus:", objc_msgSend(v5, "kt_enumValueWithMax:defaultValue:", 5, 0));
  -[KTStatusResult setSystemStatus:](v15, "setSystemStatus:", objc_msgSend(v6, "kt_enumValueWithMax:defaultValue:", 5, 2));
  -[KTStatusResult setSelfStatus:](v15, "setSelfStatus:", objc_msgSend(v7, "kt_enumValueWithMax:defaultValue:", 4, 2));
  -[KTStatusResult setIdsAccountStatus:](v15, "setIdsAccountStatus:", objc_msgSend(v8, "kt_enumValueWithMax:defaultValue:", 3, 0));
  -[KTStatusResult setPendingStatusChanges:](v15, "setPendingStatusChanges:", [v9 BOOLValue]);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KTStatusResult *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(KTStatusResult *)self optIn];
      if (v6 == [(KTStatusResult *)v5 optIn]
        && (unint64_t v7 = [(KTStatusResult *)self accountStatus],
            v7 == [(KTStatusResult *)v5 accountStatus])
        && (unint64_t v8 = [(KTStatusResult *)self systemStatus],
            v8 == [(KTStatusResult *)v5 systemStatus])
        && (unint64_t v9 = [(KTStatusResult *)self selfStatus], v9 == [(KTStatusResult *)v5 selfStatus])
        && (unint64_t v10 = [(KTStatusResult *)self idsAccountStatus],
            v10 == [(KTStatusResult *)v5 idsAccountStatus]))
      {
        BOOL v11 = [(KTStatusResult *)self pendingStatusChanges];
        BOOL v12 = v11 ^ [(KTStatusResult *)v5 pendingStatusChanges] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  v4 = KTOptInGetString([(KTStatusResult *)self optIn]);
  v5 = KTOptInGetString([(KTStatusResult *)self serverOptIn]);
  unint64_t v6 = [(KTStatusResult *)self accountStatus] - 1;
  if (v6 > 5) {
    unint64_t v7 = @"Unknown";
  }
  else {
    unint64_t v7 = off_26479EB28[v6];
  }
  unint64_t v8 = [(KTStatusResult *)self systemStatus] - 1;
  if (v8 > 4) {
    unint64_t v9 = @"OK";
  }
  else {
    unint64_t v9 = off_26479EB58[v8];
  }
  unint64_t v10 = [(KTStatusResult *)self selfStatus] - 1;
  if (v10 > 3) {
    BOOL v11 = @"OK";
  }
  else {
    BOOL v11 = off_26479EB80[v10];
  }
  unint64_t v12 = [(KTStatusResult *)self idsAccountStatus] - 1;
  if (v12 > 2) {
    v13 = @"IDSAccountStatusInvalid";
  }
  else {
    v13 = off_26479EBA0[v12];
  }
  BOOL v14 = [(KTStatusResult *)self pendingStatusChanges];
  id v15 = @"NO";
  if (v14) {
    id v15 = @"YES";
  }
  uint64_t v16 = [v3 stringWithFormat:@"KTStatus: optIn = %@, serverOptIn = %@, accountStatus = %@, systemStatus = %@, selfStatus = %@, idsAccountStatus = %@, pendingChanges: %@\n", v4, v5, v7, v9, v11, v13, v15];

  v17 = [(KTStatusResult *)self expectedSelfResolutionDate];

  if (v17)
  {
    v18 = [(KTStatusResult *)self expectedSelfResolutionDate];
    [v16 appendFormat:@" expectedSelfResolutionDate: %@\n", v18];
  }
  v19 = [(KTStatusResult *)self recentFailedEventIds];

  if (v19)
  {
    v20 = [(KTStatusResult *)self recentFailedEventIds];
    [v16 appendFormat:@" failureEventIds: %@", v20];
  }

  return v16;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:@"2" forKeyedSubscript:@"copy_status_version"];
  v4 = KTOptInGetString([(KTStatusResult *)self optIn]);
  [v3 setObject:v4 forKeyedSubscript:@"optedIn"];

  v5 = KTOptInGetString([(KTStatusResult *)self serverOptIn]);
  [v3 setObject:v5 forKeyedSubscript:@"serverOptedIn"];

  unint64_t v6 = [(KTStatusResult *)self accountStatus] - 1;
  if (v6 > 5) {
    unint64_t v7 = @"Unknown";
  }
  else {
    unint64_t v7 = off_26479EB28[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"accountStatus"];
  unint64_t v8 = [(KTStatusResult *)self systemStatus] - 1;
  if (v8 > 4) {
    unint64_t v9 = @"OK";
  }
  else {
    unint64_t v9 = off_26479EB58[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"systemStatus"];
  unint64_t v10 = [(KTStatusResult *)self selfStatus] - 1;
  if (v10 > 3) {
    BOOL v11 = @"OK";
  }
  else {
    BOOL v11 = off_26479EB80[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"selfStatus"];
  unint64_t v12 = [(KTStatusResult *)self idsAccountStatus] - 1;
  if (v12 > 2) {
    v13 = @"IDSAccountStatusInvalid";
  }
  else {
    v13 = off_26479EBA0[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"idsAccountStatus"];
  if ([(KTStatusResult *)self pendingStatusChanges]) {
    BOOL v14 = @"YES";
  }
  else {
    BOOL v14 = @"NO";
  }
  [v3 setObject:v14 forKeyedSubscript:@"pendingChanges"];

  return (NSDictionary *)v3;
}

- (BOOL)optInState
{
  return self->_optInState;
}

- (void)setOptInState:(BOOL)a3
{
  self->_optInState = a3;
}

- (unint64_t)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(unint64_t)a3
{
  self->_optIn = a3;
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

- (NSArray)recentFailedEventIds
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecentFailedEventIds:(id)a3
{
}

- (NSDate)expectedSelfResolutionDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpectedSelfResolutionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedSelfResolutionDate, 0);

  objc_storeStrong((id *)&self->_recentFailedEventIds, 0);
}

@end