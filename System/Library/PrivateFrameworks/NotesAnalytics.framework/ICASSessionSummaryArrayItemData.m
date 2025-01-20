@interface ICASSessionSummaryArrayItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSessionSummaryArrayItemData)initWithSessionType:(id)a3 sessionDuration:(id)a4 sessionCount:(id)a5;
- (ICASSessionType)sessionType;
- (NSNumber)sessionCount;
- (NSNumber)sessionDuration;
- (id)toDict;
@end

@implementation ICASSessionSummaryArrayItemData

- (ICASSessionSummaryArrayItemData)initWithSessionType:(id)a3 sessionDuration:(id)a4 sessionCount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASSessionSummaryArrayItemData;
  v12 = [(ICASSessionSummaryArrayItemData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionType, a3);
    objc_storeStrong((id *)&v13->_sessionDuration, a4);
    objc_storeStrong((id *)&v13->_sessionCount, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"SessionSummaryArrayItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"sessionType";
  v3 = [(ICASSessionSummaryArrayItemData *)self sessionType];
  if (v3)
  {
    uint64_t v4 = [(ICASSessionSummaryArrayItemData *)self sessionType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"sessionDuration";
  v6 = [(ICASSessionSummaryArrayItemData *)self sessionDuration];
  if (v6)
  {
    uint64_t v7 = [(ICASSessionSummaryArrayItemData *)self sessionDuration];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"sessionCount";
  id v9 = [(ICASSessionSummaryArrayItemData *)self sessionCount];
  if (v9)
  {
    uint64_t v10 = [(ICASSessionSummaryArrayItemData *)self sessionCount];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASSessionType)sessionType
{
  return self->_sessionType;
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (NSNumber)sessionCount
{
  return self->_sessionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCount, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
}

@end