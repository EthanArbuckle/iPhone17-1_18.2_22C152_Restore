@interface SFRepairResultMetrics
- (BOOL)forceWiFi;
- (BOOL)hasView;
- (BOOL)isPreflightError;
- (NSDictionary)dict;
- (NSError)error;
- (NSString)peerBuild;
- (NSString)peerModel;
- (double)totalMs;
- (double)triggerMs;
- (int64_t)resultType;
- (unint64_t)peerProblemFlags;
- (unint64_t)problemFlags;
- (void)setError:(id)a3;
- (void)setForceWiFi:(BOOL)a3;
- (void)setHasView:(BOOL)a3;
- (void)setIsPreflightError:(BOOL)a3;
- (void)setPeerBuild:(id)a3;
- (void)setPeerModel:(id)a3;
- (void)setPeerProblemFlags:(unint64_t)a3;
- (void)setProblemFlags:(unint64_t)a3;
- (void)setTotalMs:(double)a3;
- (void)setTriggerMs:(double)a3;
@end

@implementation SFRepairResultMetrics

- (NSDictionary)dict
{
  v49[10] = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  NSAppendPrintF();
  v3 = (__CFString *)0;
  uint64_t v43 = 0;
  unint64_t peerProblemFlags = self->_peerProblemFlags;
  v4 = self;
  NSAppendPrintF();
  v5 = (__CFString *)0;
  v48[0] = @"resultType";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SFRepairResultMetrics resultType](self, "resultType", peerProblemFlags, &unk_1A56EB1F0));
  v49[0] = v6;
  v48[1] = @"success";
  v7 = [NSNumber numberWithInt:self->_error == 0];
  v49[1] = v7;
  v48[2] = @"forceWiFi";
  v8 = [NSNumber numberWithBool:self->_forceWiFi];
  v49[2] = v8;
  v48[3] = @"hasView";
  v9 = [NSNumber numberWithBool:self->_hasView];
  v49[3] = v9;
  v48[4] = @"totalMs";
  v10 = [NSNumber numberWithDouble:self->_totalMs];
  v49[4] = v10;
  v48[5] = @"triggerMs";
  uint64_t v11 = [NSNumber numberWithDouble:self->_triggerMs];
  v12 = (void *)v11;
  if (v3) {
    v13 = v3;
  }
  else {
    v13 = &stru_1EF9BDC68;
  }
  v49[5] = v11;
  v49[6] = v13;
  v48[6] = @"problemFlags";
  v48[7] = @"triggerFlags";
  if (v5) {
    v14 = v5;
  }
  else {
    v14 = &stru_1EF9BDC68;
  }
  peerModel = (__CFString *)self->_peerModel;
  peerBuild = self->_peerBuild;
  if (!peerModel) {
    peerModel = &stru_1EF9BDC68;
  }
  v49[7] = v14;
  v49[8] = peerModel;
  v48[8] = @"peerModel";
  v48[9] = @"peerBuild";
  if (peerBuild) {
    v17 = (__CFString *)peerBuild;
  }
  else {
    v17 = &stru_1EF9BDC68;
  }
  v49[9] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:10];
  id v38 = (id)[v18 mutableCopy];

  if (v4->_error)
  {
    id v19 = (id)objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v35 = v4;
    v20 = [(NSError *)v4->_error underlyingErrors];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
    v36 = v5;
    v37 = v3;
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        uint64_t v24 = 0;
        v25 = v19;
        do
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v39 + 1) + 8 * v24);
          if (objc_msgSend(v25, "length", v33, v34)) {
            [v25 appendString:@","];
          }
          uint64_t v27 = [v26 code];
          [v26 domain];
          v34 = uint64_t v33 = v27;
          NSAppendPrintF();
          id v19 = v25;

          ++v24;
          v25 = v19;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16, v27, v34);
      }
      while (v22);
    }

    v45[0] = @"errCode";
    v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](v35->_error, "code"));
    v46[0] = v28;
    v45[1] = @"errDomain";
    v29 = [(NSError *)v35->_error domain];
    v45[2] = @"underErr";
    v46[1] = v29;
    v46[2] = v19;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
    [v38 addEntriesFromDictionary:v30];

    v5 = v36;
    v3 = v37;
  }

  return (NSDictionary *)v38;
}

- (int64_t)resultType
{
  if (self->_error) {
    return 2 * self->_isPreflightError;
  }
  else {
    return 1;
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isPreflightError
{
  return self->_isPreflightError;
}

- (void)setIsPreflightError:(BOOL)a3
{
  self->_isPreflightError = a3;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(unint64_t)a3
{
  self->_problemFlags = a3;
}

- (unint64_t)peerProblemFlags
{
  return self->_peerProblemFlags;
}

- (void)setPeerProblemFlags:(unint64_t)a3
{
  self->_unint64_t peerProblemFlags = a3;
}

- (NSString)peerModel
{
  return self->_peerModel;
}

- (void)setPeerModel:(id)a3
{
}

- (NSString)peerBuild
{
  return self->_peerBuild;
}

- (void)setPeerBuild:(id)a3
{
}

- (BOOL)forceWiFi
{
  return self->_forceWiFi;
}

- (void)setForceWiFi:(BOOL)a3
{
  self->_forceWiFi = a3;
}

- (BOOL)hasView
{
  return self->_hasView;
}

- (void)setHasView:(BOOL)a3
{
  self->_hasView = a3;
}

- (double)totalMs
{
  return self->_totalMs;
}

- (void)setTotalMs:(double)a3
{
  self->_totalMs = a3;
}

- (double)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(double)a3
{
  self->_triggerMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerBuild, 0);
  objc_storeStrong((id *)&self->_peerModel, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end