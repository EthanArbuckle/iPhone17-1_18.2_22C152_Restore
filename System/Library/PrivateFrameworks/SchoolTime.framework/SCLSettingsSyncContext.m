@interface SCLSettingsSyncContext
+ (BOOL)supportsSecureCoding;
- (NSArray)recoveryHistory;
- (NSError)error;
- (NSString)messageIdentifier;
- (SCLSettingsSyncContext)init;
- (SCLSettingsSyncContext)initWithCoder:(id)a3;
- (unint64_t)syncStatus;
- (void)addRecoveryHistory:(unint64_t)a3;
- (void)clearRecoveryHistory;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setSyncStatus:(unint64_t)a3;
@end

@implementation SCLSettingsSyncContext

- (SCLSettingsSyncContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncContext;
  v2 = [(SCLSettingsSyncContext *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recoveryHistory = v2->_recoveryHistory;
    v2->_recoveryHistory = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLSettingsSyncContext syncStatus](self, "syncStatus"), @"syncStatus");
  v5 = [(SCLSettingsSyncContext *)self messageIdentifier];
  [v4 encodeObject:v5 forKey:@"messageIdentifier"];

  objc_super v6 = [(SCLSettingsSyncContext *)self error];
  [v4 encodeObject:v6 forKey:@"error"];

  id v7 = [(SCLSettingsSyncContext *)self recoveryHistory];
  [v4 encodeObject:v7 forKey:@"recoveryHistory"];
}

- (SCLSettingsSyncContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSettingsSyncContext;
  v5 = [(SCLSettingsSyncContext *)&v17 init];
  if (v5)
  {
    v5->_syncStatus = [v4 decodeIntegerForKey:@"syncStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageIdentifier"];
    messageIdentifier = v5->_messageIdentifier;
    v5->_messageIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"recoveryHistory"];
    uint64_t v14 = [v13 mutableCopy];
    recoveryHistory = v5->_recoveryHistory;
    v5->_recoveryHistory = (NSMutableArray *)v14;
  }
  return v5;
}

- (NSArray)recoveryHistory
{
  v2 = (void *)[(NSMutableArray *)self->_recoveryHistory copy];
  return (NSArray *)v2;
}

- (void)addRecoveryHistory:(unint64_t)a3
{
  recoveryHistory = self->_recoveryHistory;
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)recoveryHistory insertObject:v5 atIndex:0];

  if ((unint64_t)[(NSMutableArray *)self->_recoveryHistory count] >= 0xB)
  {
    uint64_t v6 = self->_recoveryHistory;
    [(NSMutableArray *)v6 removeLastObject];
  }
}

- (void)clearRecoveryHistory
{
}

- (unint64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(unint64_t)a3
{
  self->_syncStatus = a3;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_recoveryHistory, 0);
}

@end