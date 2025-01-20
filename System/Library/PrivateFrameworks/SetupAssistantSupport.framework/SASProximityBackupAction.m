@interface SASProximityBackupAction
+ (id)actionFromDictionary:(id)a3;
+ (unint64_t)actionID;
- (BOOL)finishedBackup;
- (BOOL)shouldStartBackup;
- (NSDate)completionDate;
- (NSError)error;
- (double)percentComplete;
- (id)requestPayload;
- (unint64_t)timeRemaining;
- (void)setCompletionDate:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishedBackup:(BOOL)a3;
- (void)setPercentComplete:(double)a3;
- (void)setShouldStartBackup:(BOOL)a3;
- (void)setTimeRemaining:(unint64_t)a3;
@end

@implementation SASProximityBackupAction

+ (unint64_t)actionID
{
  return 6;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SASProximityBackupAction);
  v5 = [v3 objectForKeyedSubscript:@"shouldStartBackup"];
  -[SASProximityBackupAction setShouldStartBackup:](v4, "setShouldStartBackup:", [v5 BOOLValue]);

  v6 = [v3 objectForKeyedSubscript:@"finishedBackup"];
  -[SASProximityBackupAction setFinishedBackup:](v4, "setFinishedBackup:", [v6 BOOLValue]);

  v7 = [v3 objectForKeyedSubscript:@"errorDomain"];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = [v3 objectForKeyedSubscript:@"errorDomain"];
    v10 = [v3 objectForKeyedSubscript:@"errorCode"];
    v11 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v10, "integerValue"), 0);
    [(SASProximityBackupAction *)v4 setError:v11];
  }
  v12 = [v3 objectForKeyedSubscript:@"percentComplete"];
  [v12 doubleValue];
  -[SASProximityBackupAction setPercentComplete:](v4, "setPercentComplete:");

  v13 = [v3 objectForKeyedSubscript:@"timeRemaining"];
  -[SASProximityBackupAction setTimeRemaining:](v4, "setTimeRemaining:", [v13 unsignedIntegerValue]);

  v14 = [v3 objectForKeyedSubscript:@"completionDate"];
  [(SASProximityBackupAction *)v4 setCompletionDate:v14];

  return v4;
}

- (id)requestPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SASProximityBackupAction shouldStartBackup](self, "shouldStartBackup"));
  [v3 setObject:v4 forKeyedSubscript:@"shouldStartBackup"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SASProximityBackupAction finishedBackup](self, "finishedBackup"));
  [v3 setObject:v5 forKeyedSubscript:@"finishedBackup"];

  v6 = [(SASProximityBackupAction *)self error];

  if (v6)
  {
    v7 = [(SASProximityBackupAction *)self error];
    v8 = [v7 domain];
    [v3 setObject:v8 forKeyedSubscript:@"errorDomain"];

    v9 = NSNumber;
    v10 = [(SASProximityBackupAction *)self error];
    v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
    [v3 setObject:v11 forKeyedSubscript:@"errorCode"];
  }
  v12 = NSNumber;
  [(SASProximityBackupAction *)self percentComplete];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"percentComplete"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SASProximityBackupAction timeRemaining](self, "timeRemaining"));
  [v3 setObject:v14 forKeyedSubscript:@"timeRemaining"];

  v15 = [(SASProximityBackupAction *)self completionDate];
  [v3 setObject:v15 forKeyedSubscript:@"completionDate"];

  return v3;
}

- (BOOL)shouldStartBackup
{
  return self->_shouldStartBackup;
}

- (void)setShouldStartBackup:(BOOL)a3
{
  self->_shouldStartBackup = a3;
}

- (BOOL)finishedBackup
{
  return self->_finishedBackup;
}

- (void)setFinishedBackup:(BOOL)a3
{
  self->_finishedBackup = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (unint64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(unint64_t)a3
{
  self->_timeRemaining = a3;
}

- (NSDate)completionDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end