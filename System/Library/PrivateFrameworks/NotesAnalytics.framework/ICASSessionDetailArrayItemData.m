@interface ICASSessionDetailArrayItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSessionDetailArrayItemData)initWithSessionType:(id)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 sessionDuration:(id)a6;
- (ICASSessionType)sessionType;
- (NSNumber)endTimestamp;
- (NSNumber)sessionDuration;
- (NSNumber)startTimestamp;
- (id)toDict;
@end

@implementation ICASSessionDetailArrayItemData

- (ICASSessionDetailArrayItemData)initWithSessionType:(id)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 sessionDuration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASSessionDetailArrayItemData;
  v15 = [(ICASSessionDetailArrayItemData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionType, a3);
    objc_storeStrong((id *)&v16->_startTimestamp, a4);
    objc_storeStrong((id *)&v16->_endTimestamp, a5);
    objc_storeStrong((id *)&v16->_sessionDuration, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"SessionDetailArrayItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"sessionType";
  v3 = [(ICASSessionDetailArrayItemData *)self sessionType];
  if (v3)
  {
    uint64_t v4 = [(ICASSessionDetailArrayItemData *)self sessionType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"startTimestamp";
  v6 = [(ICASSessionDetailArrayItemData *)self startTimestamp];
  if (v6)
  {
    uint64_t v7 = [(ICASSessionDetailArrayItemData *)self startTimestamp];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"endTimestamp";
  v9 = [(ICASSessionDetailArrayItemData *)self endTimestamp];
  if (v9)
  {
    uint64_t v10 = [(ICASSessionDetailArrayItemData *)self endTimestamp];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"sessionDuration";
  id v12 = [(ICASSessionDetailArrayItemData *)self sessionDuration];
  if (v12)
  {
    uint64_t v13 = [(ICASSessionDetailArrayItemData *)self sessionDuration];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (ICASSessionType)sessionType
{
  return self->_sessionType;
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
}

@end