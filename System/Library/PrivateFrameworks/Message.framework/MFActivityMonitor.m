@interface MFActivityMonitor
+ (MFActivityMonitor)currentMonitor;
+ (id)pushNewMonitor;
+ (void)destroyMonitor;
- (BOOL)canBeCancelled;
- (BOOL)isActive;
- (BOOL)isRemoteSearch;
- (BOOL)shouldCancel;
- (MFActivityMonitor)init;
- (MFError)error;
- (MFMailboxUid)mailbox;
- (double)percentDone;
- (double)startTime;
- (id)_ntsThrottledUserInfoDict;
- (id)reasons;
- (id)startedFetch;
- (id)userInfoForNotification;
- (int)acquireExclusiveAccessKey;
- (int64_t)transportType;
- (unint64_t)bytesRead;
- (unint64_t)bytesWritten;
- (unint64_t)expectedLength;
- (unint64_t)gotNewMessagesState;
- (void)_cancelAssociatedCancelables;
- (void)_didChange;
- (void)addCancelable:(id)a3;
- (void)addReason:(id)a3;
- (void)cancel;
- (void)cancelMessage;
- (void)finishedActivity:(id)a3;
- (void)postActivityFinished:(id)a3;
- (void)postActivityStarting;
- (void)postDidChangeWithUserInfo:(id)a3;
- (void)recordBytesRead:(unint64_t)a3;
- (void)recordBytesWritten:(unint64_t)a3;
- (void)recordTransportType:(int64_t)a3;
- (void)relinquishExclusiveAccessKey:(int)a3;
- (void)removeCancelable:(id)a3;
- (void)reset;
- (void)resetConnectionStats;
- (void)setCanBeCancelled:(BOOL)a3;
- (void)setCurrentCount:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4;
- (void)setError:(id)a3;
- (void)setExpectedLength:(unint64_t)a3;
- (void)setGotNewMessagesState:(unint64_t)a3;
- (void)setIsRemoteSearch:(BOOL)a3;
- (void)setMailbox:(id)a3;
- (void)setPercentDone:(double)a3;
- (void)setPercentDone:(double)a3 withKey:(int)a4;
- (void)setPercentDoneOfCurrentItem:(double)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setStartedFetch:(id)a3;
- (void)setStatusMessage:(id)a3 percentDone:(double)a4;
- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5;
- (void)setStatusMessage:(id)a3 withKey:(int)a4;
- (void)startActivity;
@end

@implementation MFActivityMonitor

- (void)setCanBeCancelled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 49) = *((unsigned char *)self + 49) & 0xDF | v3;
}

- (MFActivityMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFActivityMonitor;
  v2 = [(MFActivityMonitor *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    statusMessage = v2->_statusMessage;
    v2->_statusMessage = (NSString *)&stru_1EFF11268;

    v3->_percentDone = 0.0;
    *((unsigned char *)v3 + 49) |= 0x20u;
    *((unsigned char *)v3 + 49) &= ~0x40u;
    *((_WORD *)v3 + 24) &= 0xE000u;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startedFetch, 0);
  objc_storeStrong((id *)&self->_associatedCancelables, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_runningThread, 0);
}

- (BOOL)shouldCancel
{
  return (*((unsigned __int8 *)self + 49) >> 6) & 1;
}

- (void)startActivity
{
  +[MFActivityMonitor mf_lock];
  char v3 = [MEMORY[0x1E4F29060] currentThread];
  runningThread = self->_runningThread;
  self->_runningThread = v3;

  +[MFActivityMonitor mf_unlock];
  v5 = [(NSThread *)self->_runningThread threadDictionary];
  [v5 setObject:self forKeyedSubscript:*MEMORY[0x1E4F60CF8]];

  *((unsigned char *)self + 49) |= 0x80u;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  [(MFActivityMonitor *)self resetConnectionStats];
  [(MFActivityMonitor *)self setError:0];
  [(MFActivityMonitor *)self postActivityStarting];
}

- (void)setError:(id)a3
{
  id v5 = a3;
  +[MFActivityMonitor mf_lock];
  objc_storeStrong((id *)&self->_error, a3);
  +[MFActivityMonitor mf_unlock];
}

- (void)resetConnectionStats
{
  self->_transportType = 0;
  self->_bytesWritten = 0;
  self->_bytesRead = 0;
}

- (void)postActivityStarting
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MonitoredActivityStarted" object:self];
}

- (void)finishedActivity:(id)a3
{
  id v7 = a3;
  objc_msgSend(MEMORY[0x1E4FBA8A8], "mf_clearLocks");
  v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [v4 threadDictionary];
  [v5 removeObjectForKey:*MEMORY[0x1E4F60CF8]];

  *((unsigned char *)self + 49) &= ~0x80u;
  +[MFActivityMonitor mf_lock];
  runningThread = self->_runningThread;
  self->_runningThread = 0;

  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postActivityFinished:v7];
}

- (void)postActivityFinished:(id)a3
{
  id v6 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"MonitoredActivityInvocation", 0, 0);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MonitoredActivityEnded" object:self userInfo:v4];
}

+ (MFActivityMonitor)currentMonitor
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  v2 = objc_msgSendSuper2(&v4, sel_currentDesignator);
  return (MFActivityMonitor *)v2;
}

- (void)recordTransportType:(int64_t)a3
{
  int64_t transportType = self->_transportType;
  if (transportType != a3)
  {
    BOOL v4 = transportType < a3 && transportType < 3;
    if (v4 || (transportType >= 3 ? (v5 = a3 < 3) : (v5 = 1), !v5 ? (BOOL v6 = transportType <= a3) : (BOOL v6 = 1), !v6)) {
      self->_int64_t transportType = a3;
    }
  }
}

- (BOOL)isActive
{
  return *((unsigned __int8 *)self + 49) >> 7;
}

- (void)cancelMessage
{
  if ([(MFActivityMonitor *)self shouldCancel])
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

- (id)userInfoForNotification
{
  +[MFActivityMonitor mf_lock];
  unint64_t maxCount = self->_maxCount;
  if (maxCount)
  {
    if (self->_currentCount > maxCount) {
      unint64_t maxCount = self->_currentCount;
    }
    self->_unint64_t maxCount = maxCount;
  }
  if ([(NSString *)self->_displayName length])
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_maxCount];
    [v4 setObject:v5 forKey:@"MonitoredActivityMaxCount"];

    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_currentCount];
    [v4 setObject:v6 forKey:@"MonitoredActivityCurrentCount"];

    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }
  +[MFActivityMonitor mf_unlock];
  return v7;
}

- (void)postDidChangeWithUserInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MonitoredActivityMessage" object:self userInfo:v6];

    id v4 = v6;
  }
}

- (void)_didChange
{
  id v3 = [(MFActivityMonitor *)self userInfoForNotification];
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:");
}

- (void)setCurrentCount:(unint64_t)a3
{
  +[MFActivityMonitor mf_lock];
  self->_currentCount = a3;
  id v5 = [(MFActivityMonitor *)self userInfoForNotification];
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v5];
}

- (id)_ntsThrottledUserInfoDict
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = Current;
  if (self->_currentCount == self->_maxCount || Current - self->_lastTime >= 0.0333333351)
  {
    id v5 = [(MFActivityMonitor *)self userInfoForNotification];
    self->_lastTime = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setPercentDoneOfCurrentItem:(double)a3
{
  +[MFActivityMonitor mf_lock];
  id v4 = [(MFActivityMonitor *)self _ntsThrottledUserInfoDict];
  +[MFActivityMonitor mf_unlock];
  if (v4) {
    [(MFActivityMonitor *)self postDidChangeWithUserInfo:v4];
  }
}

- (void)reset
{
  v6[1] = *MEMORY[0x1E4F143B8];
  +[MFActivityMonitor mf_lock];
  self->_unint64_t maxCount = 0;
  self->_currentCount = 0;
  self->_percentDone = 0.0;
  self->_lastTime = 0.0;
  displayName = self->_displayName;
  self->_displayName = 0;

  +[MFActivityMonitor mf_unlock];
  if (self->_mailbox)
  {
    id v5 = @"MonitoredActivityReset";
    v6[0] = @"RESET";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [(MFActivityMonitor *)self postDidChangeWithUserInfo:v4];
  }
}

- (void)setGotNewMessagesState:(unint64_t)a3
{
  if (self->_gotNewMessagesState < a3) {
    self->_gotNewMessagesState = a3;
  }
}

- (unint64_t)gotNewMessagesState
{
  return self->_gotNewMessagesState;
}

- (void)addReason:(id)a3
{
  id v4 = a3;
  reasons = self->_reasons;
  id v8 = v4;
  if (!reasons)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_reasons;
    self->_reasons = v6;

    reasons = self->_reasons;
    id v4 = v8;
  }
  [(NSMutableSet *)reasons addObject:v4];
}

- (id)reasons
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithSet:self->_reasons];
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4
{
}

- (void)setPercentDone:(double)a3
{
}

- (double)percentDone
{
  return self->_percentDone;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4
{
  id v8 = a3;
  +[MFActivityMonitor mf_lock];
  objc_storeStrong((id *)&self->_displayName, a3);
  self->_unint64_t maxCount = a4;
  self->_currentCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  id v7 = [(MFActivityMonitor *)self userInfoForNotification];
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v7];
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)canBeCancelled
{
  return (*((unsigned __int8 *)self + 49) >> 5) & 1;
}

- (void)setShouldCancel:(BOOL)a3
{
  if ((*((unsigned char *)self + 49) & 0x20) != 0)
  {
    if (a3)
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        id v4 = [MEMORY[0x1E4F29060] currentThread];
        id v5 = [v4 threadDictionary];
        id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F60CF8]];

        if (v6 == self)
        {
          id v7 = MFLogGeneral();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Activity monitor cancelled on the Main Thread.  Why?", v9, 2u);
          }
        }
      }
      *((unsigned char *)self + 49) |= 0x40u;
      [(MFActivityMonitor *)self _cancelAssociatedCancelables];
    }
    else
    {
      *((unsigned char *)self + 49) &= ~0x40u;
    }
    +[MFActivityMonitor mf_lock];
    id v8 = self->_runningThread;
    +[MFActivityMonitor mf_unlock];
    if (v8) {
      [(MFActivityMonitor *)self performSelector:sel_cancelMessage onThread:v8 withObject:0 waitUntilDone:0];
    }
    else {
      [(MFActivityMonitor *)self cancelMessage];
    }
    [(MFActivityMonitor *)self _didChange];
  }
}

- (void)addCancelable:(id)a3
{
  id v7 = a3;
  +[MFActivityMonitor mf_lock];
  associatedCancelables = self->_associatedCancelables;
  if (!associatedCancelables)
  {
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = self->_associatedCancelables;
    self->_associatedCancelables = v5;

    associatedCancelables = self->_associatedCancelables;
  }
  [(NSMutableSet *)associatedCancelables addObject:v7];
  +[MFActivityMonitor mf_unlock];
  if ((*((unsigned char *)self + 49) & 0x40) != 0) {
    [v7 cancel];
  }
}

- (void)removeCancelable:(id)a3
{
  id v4 = a3;
  +[MFActivityMonitor mf_lock];
  [(NSMutableSet *)self->_associatedCancelables removeObject:v4];
  +[MFActivityMonitor mf_unlock];
}

- (void)_cancelAssociatedCancelables
{
  +[MFActivityMonitor mf_lock];
  id v3 = (id)[(NSMutableSet *)self->_associatedCancelables copy];
  +[MFActivityMonitor mf_unlock];
  [v3 makeObjectsPerformSelector:sel_cancel];
}

- (void)cancel
{
}

+ (id)pushNewMonitor
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  v2 = objc_msgSendSuper2(&v4, sel_pushNewDesignator);
  return v2;
}

+ (void)destroyMonitor
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  objc_msgSendSuper2(&v2, sel_destroyCurrentDesignator);
}

- (int)acquireExclusiveAccessKey
{
  +[MFActivityMonitor mf_lock];
  if ((*((_WORD *)self + 24) & 0x1FFF) != 0)
  {
    int v3 = 0;
  }
  else
  {
    *((_WORD *)self + 24) = *((_WORD *)self + 24) & 0xE000 | 1;
    int v3 = 1;
  }
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (void)relinquishExclusiveAccessKey:(int)a3
{
  +[MFActivityMonitor mf_lock];
  int v5 = *((unsigned __int16 *)self + 24);
  if (a3 == v5 << 19 >> 19) {
    *((_WORD *)self + 24) = v5 & 0xE000;
  }
  +[MFActivityMonitor mf_unlock];
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  -[MFActivityMonitor setStatusMessage:withKey:](self, "setStatusMessage:withKey:");
  [(MFActivityMonitor *)self setPercentDone:v5 withKey:a4];
}

- (void)setStatusMessage:(id)a3 withKey:(int)a4
{
  id v8 = (NSString *)a3;
  +[MFActivityMonitor mf_lock];
  if (a4 != *((unsigned __int16 *)self + 24) << 19 >> 19 || self->_statusMessage == v8)
  {
    id v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_statusMessage, a3);
    id v7 = [(MFActivityMonitor *)self userInfoForNotification];
  }
  +[MFActivityMonitor mf_unlock];
  if (v7) {
    [(MFActivityMonitor *)self postDidChangeWithUserInfo:v7];
  }
}

- (void)setPercentDone:(double)a3 withKey:(int)a4
{
  +[MFActivityMonitor mf_lock];
  if (a4 != *((unsigned __int16 *)self + 24) << 19 >> 19) {
    goto LABEL_6;
  }
  double v7 = 1.0;
  if (a3 <= 1.0) {
    double v7 = a3;
  }
  if (v7 == self->_percentDone)
  {
LABEL_6:
    uint64_t v8 = 0;
  }
  else
  {
    self->_percentDone = v7;
    uint64_t v8 = [(MFActivityMonitor *)self userInfoForNotification];
  }
  id v9 = (id)v8;
  +[MFActivityMonitor mf_unlock];
  if (v9) {
    [(MFActivityMonitor *)self postDidChangeWithUserInfo:v9];
  }
}

- (MFError)error
{
  +[MFActivityMonitor mf_lock];
  int v3 = self->_error;
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (void)recordBytesRead:(unint64_t)a3
{
  self->_bytesRead += a3;
}

- (void)recordBytesWritten:(unint64_t)a3
{
  self->_bytesWritten += a3;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMailbox:(id)a3
{
}

- (id)startedFetch
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setStartedFetch:(id)a3
{
}

- (BOOL)isRemoteSearch
{
  return self->_isRemoteSearch;
}

- (void)setIsRemoteSearch:(BOOL)a3
{
  self->_isRemoteSearch = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

@end