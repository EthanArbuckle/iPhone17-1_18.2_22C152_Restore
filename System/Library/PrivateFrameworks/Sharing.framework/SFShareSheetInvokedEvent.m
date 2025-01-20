@interface SFShareSheetInvokedEvent
+ (NSString)eventName;
- (BOOL)isCollaborative;
- (BOOL)isDarkMode;
- (NSDictionary)cacheAccessInfo;
- (NSDictionary)eventPayload;
- (NSString)appBundleId;
- (NSString)suggestionsHash;
- (int)daemonPID;
- (int64_t)cacheFileCount;
- (int64_t)durationInMS;
- (int64_t)numberOfSuggestions;
- (int64_t)totalCacheAccessCount;
- (void)setAppBundleId:(id)a3;
- (void)setCacheAccessInfo:(id)a3;
- (void)setCacheFileCount:(int64_t)a3;
- (void)setDaemonPID:(int)a3;
- (void)setDurationInMS:(int64_t)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsDarkMode:(BOOL)a3;
- (void)setNumberOfSuggestions:(int64_t)a3;
- (void)setSuggestionsHash:(id)a3;
- (void)setTotalCacheAccessCount:(int64_t)a3;
- (void)submitEvent;
@end

@implementation SFShareSheetInvokedEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.sharing.sharesheetInvocation";
}

- (NSDictionary)eventPayload
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v22[0] = @"sourceApplicationBundleID";
  uint64_t v3 = [(SFShareSheetInvokedEvent *)self appBundleId];
  v21 = (void *)v3;
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_1EF9BDC68;
  }
  v23[0] = v4;
  v22[1] = @"numberOfSuggestions";
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFShareSheetInvokedEvent numberOfSuggestions](self, "numberOfSuggestions"));
  v23[1] = v20;
  v22[2] = @"suggestionsHash";
  uint64_t v5 = [(SFShareSheetInvokedEvent *)self suggestionsHash];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EF9BDC68;
  }
  v23[2] = v7;
  v22[3] = @"daemonPID";
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SFShareSheetInvokedEvent daemonPID](self, "daemonPID"));
  v23[3] = v8;
  v22[4] = @"durationInMS";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFShareSheetInvokedEvent durationInMS](self, "durationInMS"));
  v23[4] = v9;
  v22[5] = @"isDarkMode";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SFShareSheetInvokedEvent isDarkMode](self, "isDarkMode"));
  v23[5] = v10;
  v22[6] = @"cacheFileCount";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFShareSheetInvokedEvent cacheFileCount](self, "cacheFileCount"));
  v23[6] = v11;
  v22[7] = @"totalCacheAccessCount";
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFShareSheetInvokedEvent totalCacheAccessCount](self, "totalCacheAccessCount"));
  v23[7] = v12;
  v22[8] = @"isCollaborative";
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[SFShareSheetInvokedEvent isCollaborative](self, "isCollaborative"));
  v23[8] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
  v15 = (void *)[v19 initWithDictionary:v14];

  v16 = [(SFShareSheetInvokedEvent *)self cacheAccessInfo];
  [v15 addEntriesFromDictionary:v16];

  v17 = (void *)[v15 copy];

  return (NSDictionary *)v17;
}

- (void)submitEvent
{
  id v4 = +[SFShareSheetInvokedEvent eventName];
  uint64_t v3 = [(SFShareSheetInvokedEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (int)daemonPID
{
  return self->_daemonPID;
}

- (void)setDaemonPID:(int)a3
{
  self->_daemonPID = a3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)suggestionsHash
{
  return self->_suggestionsHash;
}

- (void)setSuggestionsHash:(id)a3
{
}

- (int64_t)numberOfSuggestions
{
  return self->_numberOfSuggestions;
}

- (void)setNumberOfSuggestions:(int64_t)a3
{
  self->_numberOfSuggestions = a3;
}

- (int64_t)durationInMS
{
  return self->_durationInMS;
}

- (void)setDurationInMS:(int64_t)a3
{
  self->_durationInMS = a3;
}

- (int64_t)cacheFileCount
{
  return self->_cacheFileCount;
}

- (void)setCacheFileCount:(int64_t)a3
{
  self->_cacheFileCount = a3;
}

- (int64_t)totalCacheAccessCount
{
  return self->_totalCacheAccessCount;
}

- (void)setTotalCacheAccessCount:(int64_t)a3
{
  self->_totalCacheAccessCount = a3;
}

- (BOOL)isDarkMode
{
  return self->_isDarkMode;
}

- (void)setIsDarkMode:(BOOL)a3
{
  self->_isDarkMode = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (NSDictionary)cacheAccessInfo
{
  return self->_cacheAccessInfo;
}

- (void)setCacheAccessInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheAccessInfo, 0);
  objc_storeStrong((id *)&self->_suggestionsHash, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end