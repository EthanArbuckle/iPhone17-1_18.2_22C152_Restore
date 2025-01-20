@interface NPKContactlessPaymentSessionState
+ (id)_timestampDateFormatter;
- (BOOL)_isEqualToSessionState:(id)a3;
- (BOOL)canChangePass;
- (BOOL)contactlessInterfaceReady;
- (BOOL)doublePressReceived;
- (BOOL)hasSession;
- (BOOL)inServiceMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSessionStateValid;
- (BOOL)isSwitchingSessionType;
- (BOOL)passActivating;
- (BOOL)sessionAuthorized;
- (BOOL)sessionStarted;
- (BOOL)sessionWaitingToStart;
- (BOOL)userRejectedReleaseData;
- (NPKContactlessPaymentSessionManagerTransactionContext)transactionContext;
- (NSDate)doublePressTimestamp;
- (NSDate)timestamp;
- (NSUUID)uniqueID;
- (PKPass)currentPass;
- (PKPass)serviceModeRequestedPass;
- (double)validityInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stateForNonModalDisplay;
- (unint64_t)completionReason;
- (unint64_t)expressTransactionStatus;
- (unint64_t)failureType;
- (unint64_t)hash;
- (unint64_t)sessionType;
- (void)setCanChangePass:(BOOL)a3;
- (void)setCompletionReason:(unint64_t)a3;
- (void)setContactlessInterfaceReady:(BOOL)a3;
- (void)setCurrentPass:(id)a3;
- (void)setDoublePressReceived:(BOOL)a3;
- (void)setDoublePressTimestamp:(id)a3;
- (void)setExpressTransactionStatus:(unint64_t)a3;
- (void)setFailureType:(unint64_t)a3;
- (void)setHasSession:(BOOL)a3;
- (void)setInServiceMode:(BOOL)a3;
- (void)setIsSwitchingSessionType:(BOOL)a3;
- (void)setPassActivating:(BOOL)a3;
- (void)setServiceModeRequestedPass:(id)a3;
- (void)setSessionAuthorized:(BOOL)a3;
- (void)setSessionStarted:(BOOL)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setSessionWaitingToStart:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setTransactionContext:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation NPKContactlessPaymentSessionState

+ (id)_timestampDateFormatter
{
  v2 = (void *)_timestampDateFormatter_timestampDateFormatter;
  if (!_timestampDateFormatter_timestampDateFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    v4 = (void *)_timestampDateFormatter_timestampDateFormatter;
    _timestampDateFormatter_timestampDateFormatter = (uint64_t)v3;

    v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(id)_timestampDateFormatter_timestampDateFormatter setLocale:v5];

    [(id)_timestampDateFormatter_timestampDateFormatter setDateFormat:@"yyyy-MM-dd' 'HH:mm:ss.SSSSZZZZZ"];
    v2 = (void *)_timestampDateFormatter_timestampDateFormatter;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 40), self->_uniqueID);
  objc_storeStrong((id *)(v4 + 24), self->_timestamp);
  objc_storeStrong((id *)(v4 + 32), self->_currentPass);
  *(unsigned char *)(v4 + 8) = self->_hasSession;
  *(void *)(v4 + 48) = self->_sessionType;
  *(unsigned char *)(v4 + 9) = self->_sessionStarted;
  *(unsigned char *)(v4 + 10) = self->_sessionWaitingToStart;
  *(unsigned char *)(v4 + 11) = self->_isSwitchingSessionType;
  *(unsigned char *)(v4 + 12) = self->_doublePressReceived;
  objc_storeStrong((id *)(v4 + 56), self->_doublePressTimestamp);
  *(unsigned char *)(v4 + 13) = self->_sessionAuthorized;
  *(unsigned char *)(v4 + 14) = self->_passActivating;
  *(unsigned char *)(v4 + 15) = self->_contactlessInterfaceReady;
  *(unsigned char *)(v4 + 16) = self->_canChangePass;
  *(unsigned char *)(v4 + 17) = self->_inServiceMode;
  objc_storeStrong((id *)(v4 + 64), self->_serviceModeRequestedPass);
  *(void *)(v4 + 72) = self->_expressTransactionStatus;
  *(void *)(v4 + 80) = self->_failureType;
  *(void *)(v4 + 88) = self->_completionReason;
  objc_storeStrong((id *)(v4 + 96), self->_transactionContext);
  return (id)v4;
}

- (id)description
{
  id v3 = [(id)objc_opt_class() _timestampDateFormatter];
  v28 = NSString;
  uint64_t v27 = objc_opt_class();
  v25 = [(NPKContactlessPaymentSessionState *)self uniqueID];
  v30 = [(NPKContactlessPaymentSessionState *)self timestamp];
  v26 = v3;
  v24 = [v3 stringFromDate:v30];
  v29 = [(NPKContactlessPaymentSessionState *)self currentPass];
  v23 = [v29 uniqueID];
  BOOL v21 = [(NPKContactlessPaymentSessionState *)self hasSession];
  v31 = NSStringFromNPKQuickPaymentSessionType([(NPKContactlessPaymentSessionState *)self sessionType]);
  BOOL v20 = [(NPKContactlessPaymentSessionState *)self sessionStarted];
  BOOL v19 = [(NPKContactlessPaymentSessionState *)self sessionWaitingToStart];
  BOOL v17 = [(NPKContactlessPaymentSessionState *)self isSwitchingSessionType];
  BOOL v16 = [(NPKContactlessPaymentSessionState *)self doublePressReceived];
  v22 = [(NPKContactlessPaymentSessionState *)self doublePressTimestamp];
  uint64_t v4 = [v3 stringFromDate:v22];
  BOOL v15 = [(NPKContactlessPaymentSessionState *)self sessionAuthorized];
  BOOL v14 = [(NPKContactlessPaymentSessionState *)self passActivating];
  BOOL v5 = [(NPKContactlessPaymentSessionState *)self contactlessInterfaceReady];
  BOOL v6 = [(NPKContactlessPaymentSessionState *)self canChangePass];
  v18 = [(NPKContactlessPaymentSessionState *)self serviceModeRequestedPass];
  v13 = [v18 uniqueID];
  LODWORD(v3) = [(NPKContactlessPaymentSessionState *)self inServiceMode];
  v7 = NSStringFromNPKExpressTransactionStatus([(NPKContactlessPaymentSessionState *)self expressTransactionStatus]);
  v8 = NSStringFromNPKContactlessPaymentSessionFailureType([(NPKContactlessPaymentSessionState *)self failureType]);
  v9 = NSStringFromNPKQuickPaymentSessionCompletionReason([(NPKContactlessPaymentSessionState *)self completionReason]);
  v10 = [(NPKContactlessPaymentSessionState *)self transactionContext];
  objc_msgSend(v28, "stringWithFormat:", @"<%@: %p\n\tuniqueID: %@\n\tTimestamp: %@\n\tPass unique ID: %@\n\tHas session: %d\n\tSession type: %@\n\tSession started: %d\n\tSession waiting to start: %d\n\tSwitching session type: %d\n\tDouble-press received: %d\n\tDouble-press timestamp: %@\n\tSession authorized: %d\n\tPass activating: %d\n\tContactless interface ready: %d\n\tCan change pass: %d\n\tService mode requested pass: %@\n\tIn service mode: %d\n\tExpress status: %@\n\tTransient failure type: %@\n\tCompletion reason: %@\n\tTransaction context: %@\n>", v27, self, v25, v24, v23, v21, v31, v20, v19, v17, v16, v4, v15, v14, v5, v6,
    v13,
    v3,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NPKContactlessPaymentSessionState *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NPKContactlessPaymentSessionState *)self _isEqualToSessionState:v5];

  return v6;
}

- (BOOL)_isEqualToSessionState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 timestamp];
  BOOL v6 = [(NPKContactlessPaymentSessionState *)self timestamp];
  if (PKEqualObjects())
  {
    v7 = [v4 currentPass];
    v8 = [(NPKContactlessPaymentSessionState *)self currentPass];
    if (!PKEqualObjects())
    {
      BOOL v23 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v9 = [v4 doublePressTimestamp];
    v10 = [(NPKContactlessPaymentSessionState *)self doublePressTimestamp];
    if (!PKEqualObjects())
    {
      BOOL v23 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v11 = [v4 serviceModeRequestedPass];
    v12 = [(NPKContactlessPaymentSessionState *)self serviceModeRequestedPass];
    if (!PKEqualObjects())
    {
      BOOL v23 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v33 = v12;
    uint64_t v13 = [v4 transactionContext];
    v31 = [(NPKContactlessPaymentSessionState *)self transactionContext];
    v32 = (void *)v13;
    if (PKEqualObjects())
    {
      v30 = v11;
      int v14 = [v4 hasSession];
      v12 = v33;
      if (v14 != [(NPKContactlessPaymentSessionState *)self hasSession]) {
        goto LABEL_15;
      }
      int v15 = [v4 sessionStarted];
      if (v15 != [(NPKContactlessPaymentSessionState *)self sessionStarted]
        || (int v16 = [v4 sessionWaitingToStart],
            v16 != [(NPKContactlessPaymentSessionState *)self sessionWaitingToStart])
        || (int v17 = [v4 isSwitchingSessionType],
            v17 != [(NPKContactlessPaymentSessionState *)self isSwitchingSessionType])
        || (int v18 = [v4 doublePressReceived],
            v18 != [(NPKContactlessPaymentSessionState *)self doublePressReceived])
        || (int v19 = [v4 sessionAuthorized],
            v19 != [(NPKContactlessPaymentSessionState *)self sessionAuthorized])
        || (int v20 = [v4 passActivating],
            v20 != [(NPKContactlessPaymentSessionState *)self passActivating])
        || (int v21 = [v4 contactlessInterfaceReady],
            v21 != [(NPKContactlessPaymentSessionState *)self contactlessInterfaceReady])
        || (int v22 = [v4 canChangePass],
            v22 != [(NPKContactlessPaymentSessionState *)self canChangePass]))
      {
LABEL_15:
        BOOL v23 = 0;
        v11 = v30;
LABEL_22:

        goto LABEL_23;
      }
      int v25 = [v4 inServiceMode];
      if (v25 == [(NPKContactlessPaymentSessionState *)self inServiceMode]
        && (uint64_t v26 = [v4 sessionType],
            v26 == [(NPKContactlessPaymentSessionState *)self sessionType])
        && (uint64_t v27 = [v4 expressTransactionStatus],
            v27 == [(NPKContactlessPaymentSessionState *)self expressTransactionStatus])
        && (uint64_t v28 = [v4 failureType],
            v28 == [(NPKContactlessPaymentSessionState *)self failureType]))
      {
        uint64_t v29 = [v4 completionReason];
        BOOL v23 = v29 == [(NPKContactlessPaymentSessionState *)self completionReason];
      }
      else
      {
        BOOL v23 = 0;
      }
      v11 = v30;
    }
    else
    {
      BOOL v23 = 0;
    }
    v12 = v33;
    goto LABEL_22;
  }
  BOOL v23 = 0;
LABEL_26:

  return v23;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(NPKContactlessPaymentSessionState *)self timestamp];
  [v3 safelyAddObject:v4];

  BOOL v5 = [(NPKContactlessPaymentSessionState *)self currentPass];
  [v3 safelyAddObject:v5];

  BOOL v6 = [(NPKContactlessPaymentSessionState *)self doublePressTimestamp];
  [v3 safelyAddObject:v6];

  v7 = [(NPKContactlessPaymentSessionState *)self serviceModeRequestedPass];
  [v3 safelyAddObject:v7];

  v8 = [(NPKContactlessPaymentSessionState *)self transactionContext];
  [v3 safelyAddObject:v8];

  PKCombinedHash();
  [(NPKContactlessPaymentSessionState *)self hasSession];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self sessionStarted];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self sessionWaitingToStart];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self isSwitchingSessionType];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self doublePressReceived];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self sessionAuthorized];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self passActivating];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self contactlessInterfaceReady];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self canChangePass];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self inServiceMode];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self sessionType];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self expressTransactionStatus];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self failureType];
  PKIntegerHash();
  [(NPKContactlessPaymentSessionState *)self completionReason];
  unint64_t v9 = PKIntegerHash();

  return v9;
}

- (id)stateForNonModalDisplay
{
  v2 = (void *)[(NPKContactlessPaymentSessionState *)self copy];
  [v2 setTransactionContext:0];
  [v2 setFailureType:0];
  return v2;
}

- (BOOL)isSessionStateValid
{
  v2 = self;
  id v3 = [(NPKContactlessPaymentSessionState *)self timestamp];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);
  [(NPKContactlessPaymentSessionState *)v2 validityInterval];
  LOBYTE(v2) = v5 < v6;

  return (char)v2;
}

- (double)validityInterval
{
  id v3 = [(NPKContactlessPaymentSessionState *)self transactionContext];
  if ([v3 transactionStatus] == 2)
  {

    return 5.0;
  }
  else
  {
    unint64_t v5 = [(NPKContactlessPaymentSessionState *)self completionReason];

    double result = 5.0;
    if (!v5)
    {
      unint64_t v6 = [(NPKContactlessPaymentSessionState *)self failureType];
      double result = 3.0;
      if (!v6)
      {
        v7 = [(NPKContactlessPaymentSessionState *)self transactionContext];
        uint64_t v8 = [v7 transactionStatus];

        double result = 60.0;
        if (v8 != 1) {
          return 0.0;
        }
      }
    }
  }
  return result;
}

- (BOOL)userRejectedReleaseData
{
  return [(NPKContactlessPaymentSessionState *)self failureType] == 7
      && [(NPKContactlessPaymentSessionManagerTransactionContext *)self->_transactionContext transactionType] == 5&& [(NPKContactlessPaymentSessionManagerTransactionContext *)self->_transactionContext releaseDataStatus] == 6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setCurrentPass:(id)a3
{
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)hasSession
{
  return self->_hasSession;
}

- (void)setHasSession:(BOOL)a3
{
  self->_hasSession = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (BOOL)sessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (BOOL)sessionWaitingToStart
{
  return self->_sessionWaitingToStart;
}

- (void)setSessionWaitingToStart:(BOOL)a3
{
  self->_sessionWaitingToStart = a3;
}

- (BOOL)isSwitchingSessionType
{
  return self->_isSwitchingSessionType;
}

- (void)setIsSwitchingSessionType:(BOOL)a3
{
  self->_isSwitchingSessionType = a3;
}

- (BOOL)doublePressReceived
{
  return self->_doublePressReceived;
}

- (void)setDoublePressReceived:(BOOL)a3
{
  self->_doublePressReceived = a3;
}

- (NSDate)doublePressTimestamp
{
  return self->_doublePressTimestamp;
}

- (void)setDoublePressTimestamp:(id)a3
{
}

- (BOOL)sessionAuthorized
{
  return self->_sessionAuthorized;
}

- (void)setSessionAuthorized:(BOOL)a3
{
  self->_sessionAuthorized = a3;
}

- (BOOL)passActivating
{
  return self->_passActivating;
}

- (void)setPassActivating:(BOOL)a3
{
  self->_passActivating = a3;
}

- (BOOL)contactlessInterfaceReady
{
  return self->_contactlessInterfaceReady;
}

- (void)setContactlessInterfaceReady:(BOOL)a3
{
  self->_contactlessInterfaceReady = a3;
}

- (BOOL)canChangePass
{
  return self->_canChangePass;
}

- (void)setCanChangePass:(BOOL)a3
{
  self->_canChangePass = a3;
}

- (PKPass)serviceModeRequestedPass
{
  return self->_serviceModeRequestedPass;
}

- (void)setServiceModeRequestedPass:(id)a3
{
}

- (BOOL)inServiceMode
{
  return self->_inServiceMode;
}

- (void)setInServiceMode:(BOOL)a3
{
  self->_inServiceMode = a3;
}

- (unint64_t)expressTransactionStatus
{
  return self->_expressTransactionStatus;
}

- (void)setExpressTransactionStatus:(unint64_t)a3
{
  self->_expressTransactionStatus = a3;
}

- (unint64_t)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(unint64_t)a3
{
  self->_failureType = a3;
}

- (unint64_t)completionReason
{
  return self->_completionReason;
}

- (void)setCompletionReason:(unint64_t)a3
{
  self->_completionReason = a3;
}

- (NPKContactlessPaymentSessionManagerTransactionContext)transactionContext
{
  return self->_transactionContext;
}

- (void)setTransactionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionContext, 0);
  objc_storeStrong((id *)&self->_serviceModeRequestedPass, 0);
  objc_storeStrong((id *)&self->_doublePressTimestamp, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end