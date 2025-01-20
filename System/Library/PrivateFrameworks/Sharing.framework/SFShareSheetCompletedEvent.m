@interface SFShareSheetCompletedEvent
+ (NSString)eventName;
- (BOOL)isCollaborative;
- (BOOL)success;
- (NSDictionary)eventPayload;
- (NSString)activityType;
- (NSString)sessionID;
- (unint64_t)presentationMs;
- (unint64_t)totalShareTimeMs;
- (void)setActivityType:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setPresentationMs:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTotalShareTimeMs:(unint64_t)a3;
- (void)submitEvent;
@end

@implementation SFShareSheetCompletedEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.sharing.sharesheetCompleted";
}

- (NSDictionary)eventPayload
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v15[0] = @"sessionID";
  uint64_t v3 = [(SFShareSheetCompletedEvent *)self sessionID];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_1EF9BDC68;
  }
  v16[0] = v5;
  v15[1] = @"presentationMs";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SFShareSheetCompletedEvent presentationMs](self, "presentationMs"));
  v16[1] = v6;
  v15[2] = @"totalShareTimeMs";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SFShareSheetCompletedEvent totalShareTimeMs](self, "totalShareTimeMs"));
  v16[2] = v7;
  v15[3] = @"success";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SFShareSheetCompletedEvent success](self, "success"));
  v16[3] = v8;
  v15[4] = @"activityType";
  uint64_t v9 = [(SFShareSheetCompletedEvent *)self activityType];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1EF9BDC68;
  }
  v16[4] = v11;
  v15[5] = @"isCollaborative";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SFShareSheetCompletedEvent isCollaborative](self, "isCollaborative"));
  v16[5] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  return (NSDictionary *)v13;
}

- (void)submitEvent
{
  id v4 = +[SFShareSheetCompletedEvent eventName];
  uint64_t v3 = [(SFShareSheetCompletedEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (unint64_t)presentationMs
{
  return self->_presentationMs;
}

- (void)setPresentationMs:(unint64_t)a3
{
  self->_presentationMs = a3;
}

- (unint64_t)totalShareTimeMs
{
  return self->_totalShareTimeMs;
}

- (void)setTotalShareTimeMs:(unint64_t)a3
{
  self->_totalShareTimeMs = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end