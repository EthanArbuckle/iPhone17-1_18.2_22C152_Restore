@interface ICASSnapshotTimeData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSnapshotTimeData)initWithLastTimeOfAttemptedSchedule:(id)a3;
- (NSNumber)lastTimeOfAttemptedSchedule;
- (id)toDict;
@end

@implementation ICASSnapshotTimeData

- (ICASSnapshotTimeData)initWithLastTimeOfAttemptedSchedule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSnapshotTimeData;
  v6 = [(ICASSnapshotTimeData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lastTimeOfAttemptedSchedule, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SnapshotTimeData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"lastTimeOfAttemptedSchedule";
  v3 = [(ICASSnapshotTimeData *)self lastTimeOfAttemptedSchedule];
  if (v3)
  {
    uint64_t v4 = [(ICASSnapshotTimeData *)self lastTimeOfAttemptedSchedule];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (NSNumber)lastTimeOfAttemptedSchedule
{
  return self->_lastTimeOfAttemptedSchedule;
}

- (void).cxx_destruct
{
}

@end