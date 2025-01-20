@interface INDiagnosticReport
+ (BOOL)supportsSecureCoding;
- (BOOL)disabled;
- (INDiagnosticReport)initWithCoder:(id)a3;
- (NSArray)pushTopics;
- (NSDate)nextHeartbeatDate;
- (NSString)pushEnvironment;
- (NSString)pushToken;
- (void)encodeWithCoder:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setNextHeartbeatDate:(id)a3;
- (void)setPushEnvironment:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushTopics:(id)a3;
@end

@implementation INDiagnosticReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INDiagnosticReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INDiagnosticReport;
  v5 = [(INDiagnosticReport *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushEnvironment"];
    pushEnvironment = v5->_pushEnvironment;
    v5->_pushEnvironment = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pushTopics"];
    pushTopics = v5->_pushTopics;
    v5->_pushTopics = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextHeartbeatDate"];
    nextHeartbeatDate = v5->_nextHeartbeatDate;
    v5->_nextHeartbeatDate = (NSDate *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disabled"];
    v5->_disabled = [v17 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pushEnvironment = self->_pushEnvironment;
  id v5 = a3;
  [v5 encodeObject:pushEnvironment forKey:@"pushEnvironment"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeObject:self->_pushTopics forKey:@"pushTopics"];
  [v5 encodeObject:self->_nextHeartbeatDate forKey:@"nextHeartbeatDate"];
  id v6 = [NSNumber numberWithBool:self->_disabled];
  [v5 encodeObject:v6 forKey:@"disabled"];
}

- (NSString)pushEnvironment
{
  return self->_pushEnvironment;
}

- (void)setPushEnvironment:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSArray)pushTopics
{
  return self->_pushTopics;
}

- (void)setPushTopics:(id)a3
{
}

- (NSDate)nextHeartbeatDate
{
  return self->_nextHeartbeatDate;
}

- (void)setNextHeartbeatDate:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextHeartbeatDate, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
}

@end