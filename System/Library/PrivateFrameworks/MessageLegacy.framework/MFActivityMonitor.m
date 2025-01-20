@interface MFActivityMonitor
+ (id)currentMonitor;
+ (void)destroyMonitor;
- (BOOL)_lockedAddActivityTarget:(id)a3;
- (BOOL)canBeCancelled;
- (BOOL)hasReason:(id)a3;
- (BOOL)isActive;
- (BOOL)isRemoteSearch;
- (BOOL)shouldCancel;
- (MFActivityMonitor)init;
- (MFMailboxUid)mailbox;
- (NSString)description;
- (double)percentDone;
- (double)startTime;
- (id)_ntsThrottledUserInfoDict;
- (id)activityTarget;
- (id)activityTargets;
- (id)displayName;
- (id)error;
- (id)primaryTarget;
- (id)reasons;
- (id)statusMessage;
- (id)taskName;
- (id)userInfoForNotification;
- (int)acquireExclusiveAccessKey;
- (int)changeCount;
- (unint64_t)bytesRead;
- (unint64_t)bytesWritten;
- (unint64_t)expectedLength;
- (unint64_t)gotNewMessagesState;
- (void)_cancelAssociatedCancelables;
- (void)_didChange;
- (void)addActivityTarget:(id)a3;
- (void)addActivityTargets:(id)a3;
- (void)addCancelable:(id)a3;
- (void)addReason:(id)a3;
- (void)cancel;
- (void)cancelMessage;
- (void)dealloc;
- (void)finishedActivity:(id)a3;
- (void)notifyConnectionEstablished;
- (void)postActivityFinished:(id)a3;
- (void)postActivityStarting;
- (void)postDidChangeWithUserInfo:(id)a3;
- (void)recordBytesRead:(unint64_t)a3;
- (void)recordBytesWritten:(unint64_t)a3;
- (void)relinquishExclusiveAccessKey:(int)a3;
- (void)removeActivityTarget:(id)a3;
- (void)removeCancelable:(id)a3;
- (void)reset;
- (void)resetConnectionStats;
- (void)setActivityTarget:(id)a3;
- (void)setCanBeCancelled:(BOOL)a3;
- (void)setCurrentCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4;
- (void)setError:(id)a3;
- (void)setExpectedLength:(unint64_t)a3;
- (void)setGotNewMessagesState:(unint64_t)a3;
- (void)setInvocationQueue:(id)a3;
- (void)setIsRemoteSearch:(BOOL)a3;
- (void)setMailbox:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setPercentDone:(double)a3;
- (void)setPercentDone:(double)a3 withKey:(int)a4;
- (void)setPercentDoneOfCurrentItem:(double)a3;
- (void)setPrimaryTarget:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setStatusMessage:(id)a3;
- (void)setStatusMessage:(id)a3 percentDone:(double)a4;
- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5;
- (void)setStatusMessage:(id)a3 withKey:(int)a4;
- (void)setSupportsPerItemProgress:(BOOL)a3;
- (void)setTaskName:(id)a3;
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
  *((unsigned char *)self + 73) = *((unsigned char *)self + 73) & 0xDF | v3;
}

- (void)finishedActivity:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FBA8A8], "mf_clearLocks");
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  [v5 removeObjectForKey:*MEMORY[0x1E4F60CF8]];
  *((unsigned char *)self + 73) &= ~0x80u;
  +[MFActivityMonitor mf_lock];

  self->_runningThread = 0;
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postActivityFinished:a3];
}

- (void)startActivity
{
  +[MFActivityMonitor mf_lock];
  self->_runningThread = (NSThread *)(id)[MEMORY[0x1E4F29060] currentThread];
  +[MFActivityMonitor mf_unlock];
  char v3 = [(NSThread *)self->_runningThread threadDictionary];
  [(NSMutableDictionary *)v3 setObject:self forKey:*MEMORY[0x1E4F60CF8]];
  *((unsigned char *)self + 73) |= 0x80u;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  [(MFActivityMonitor *)self resetConnectionStats];
  [(MFActivityMonitor *)self setError:0];
  [(MFActivityMonitor *)self postActivityStarting];
}

- (void)postActivityFinished:(id)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"MonitoredActivityInvocation", 0, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MonitoredActivityEnded", self, v4);
}

- (BOOL)shouldCancel
{
  return (*((unsigned __int8 *)self + 73) >> 6) & 1;
}

- (void)setError:(id)a3
{
  +[MFActivityMonitor mf_lock];
  error = self->_error;
  if (error != a3)
  {

    self->_error = (MFError *)a3;
  }
  +[MFActivityMonitor mf_unlock];
}

- (void)resetConnectionStats
{
  self->_bytesWritten = 0;
  self->_bytesRead = 0;
}

- (void)postActivityStarting
{
  char v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MonitoredActivityStarted" object:self];
}

+ (id)currentMonitor
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  return objc_msgSendSuper2(&v3, sel_currentDesignator);
}

- (MFActivityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFActivityMonitor;
  result = [(MFActivityMonitor *)&v3 init];
  if (result)
  {
    result->_statusMessage = (NSString *)&stru_1F265CF90;
    result->_taskName = (NSString *)&stru_1F265CF90;
    result->_percentDone = 0.0;
    *((unsigned char *)result + 73) |= 0x20u;
    *((unsigned char *)result + 73) &= ~0x40u;
    *((_WORD *)result + 36) &= 0xE000u;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFActivityMonitor;
  [(MFActivityMonitor *)&v3 dealloc];
}

- (BOOL)isActive
{
  return *((unsigned __int8 *)self + 73) >> 7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)cancelMessage
{
  if ([(MFActivityMonitor *)self shouldCancel])
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

- (void)notifyConnectionEstablished
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NetworkConnectionEstablished" object:self];
}

- (id)userInfoForNotification
{
  +[MFActivityMonitor mf_lock];
  unint64_t maxCount = self->_maxCount;
  if (!maxCount)
  {
    v5 = &OBJC_IVAR___MFActivityMonitor__percentDone;
    goto LABEL_7;
  }
  if (self->_currentCount > maxCount) {
    unint64_t maxCount = self->_currentCount;
  }
  self->_unint64_t maxCount = maxCount;
  float v4 = 0.0;
  if (*((unsigned char *)self + 136))
  {
    v5 = &OBJC_IVAR___MFActivityMonitor__currentItemPercentDone;
LABEL_7:
    float v4 = *(double *)((char *)&self->super.super.isa + *v5);
  }
  if ([(NSString *)self->_displayName length])
  {
    if (!self->_maxCount
      && [(NSString *)self->_displayName rangeOfString:@"…"] == 0x7FFFFFFFFFFFFFFFLL
      && [(NSString *)self->_displayName rangeOfString:@"..."] == 0x7FFFFFFFFFFFFFFFLL)
    {
      displayName = (NSString *)[NSString stringWithFormat:MFLookupLocalizedString(@"MF_INDETERMINATE_PROGRESS_FORMAT", @"%@...", 0), self->_displayName];
    }
    else
    {
      displayName = self->_displayName;
    }
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:displayName forKey:@"MonitoredActivityDictMessage"];
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_maxCount), @"MonitoredActivityMaxCount");
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_currentCount), @"MonitoredActivityCurrentCount");
    *(float *)&double v8 = v4;
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v8), @"MonitoredActivityCurrentItemProgress");
  }
  else
  {
    v7 = 0;
  }
  +[MFActivityMonitor mf_unlock];
  return v7;
}

- (void)postDidChangeWithUserInfo:(id)a3
{
  if (a3)
  {
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MonitoredActivityMessage" object:self userInfo:a3];
  }
}

- (void)_didChange
{
  id v3 = [(MFActivityMonitor *)self userInfoForNotification];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v3];
}

- (void)setMaxCount:(unint64_t)a3
{
  +[MFActivityMonitor mf_lock];
  self->_unint64_t maxCount = a3;
  self->_lastTime = 0.0;
  id v5 = [(MFActivityMonitor *)self userInfoForNotification];
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v5];
}

- (void)setCurrentCount:(unint64_t)a3
{
  +[MFActivityMonitor mf_lock];
  self->_currentCount = a3;
  self->_currentItemPercentDone = 0.0;
  id v5 = [(MFActivityMonitor *)self userInfoForNotification];
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v5];
}

- (void)setSupportsPerItemProgress:(BOOL)a3
{
  *((unsigned char *)self + 136) = *((unsigned char *)self + 136) & 0xFE | a3;
}

- (id)_ntsThrottledUserInfoDict
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = Current;
  if (self->_currentCount != self->_maxCount && Current - self->_lastTime < 0.0333333351) {
    return 0;
  }
  id result = [(MFActivityMonitor *)self userInfoForNotification];
  self->_lastTime = v4;
  return result;
}

- (void)setPercentDoneOfCurrentItem:(double)a3
{
  +[MFActivityMonitor mf_lock];
  self->_currentItemPercentDone = a3;
  id v5 = [(MFActivityMonitor *)self _ntsThrottledUserInfoDict];
  +[MFActivityMonitor mf_unlock];
  if (v5)
  {
    [(MFActivityMonitor *)self postDidChangeWithUserInfo:v5];
  }
}

- (void)reset
{
  +[MFActivityMonitor mf_lock];
  self->_unint64_t maxCount = 0;
  self->_currentCount = 0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;
  [(MFActivityMonitor *)self setSupportsPerItemProgress:0];
  self->_lastTime = 0.0;

  self->_taskName = 0;
  self->_displayName = 0;
  +[MFActivityMonitor mf_unlock];
  if (self->_mailbox)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3 setObject:@"RESET" forKey:@"MonitoredActivityReset"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MonitoredActivityMessage", self, v3);
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
  reasons = self->_reasons;
  if (!reasons)
  {
    reasons = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_reasons = reasons;
  }
  [(NSMutableSet *)reasons addObject:a3];
}

- (BOOL)hasReason:(id)a3
{
  return [(NSMutableSet *)self->_reasons containsObject:a3];
}

- (id)reasons
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithSet:self->_reasons];
}

- (int)changeCount
{
  return *((char *)self + 74);
}

- (void)setStatusMessage:(id)a3
{
  [(MFActivityMonitor *)self percentDone];
  -[MFActivityMonitor setStatusMessage:percentDone:](self, "setStatusMessage:percentDone:", a3);
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4
{
}

- (id)statusMessage
{
  +[MFActivityMonitor mf_lock];
  p_statusMessage = &self->_statusMessage;
  statusMessage = self->_statusMessage;
  if (!statusMessage || [(NSString *)statusMessage isEqualToString:&stru_1F265CF90]) {
    p_statusMessage = &self->_taskName;
  }
  id v5 = *p_statusMessage;
  +[MFActivityMonitor mf_unlock];
  return v5;
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

- (NSString)description
{
  +[MFActivityMonitor mf_lock];
  descriptionString = self->_descriptionString;
  if (!descriptionString)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(self->_target, "displayName"), "length"))
    {
      id v4 = [NSString alloc];
      uint64_t v5 = [self->_target displayName];
      taskName = (__CFString *)self->_taskName;
      if (!taskName) {
        taskName = &stru_1F265CF90;
      }
      descriptionString = (NSString *)[v4 initWithFormat:@"[%@] %@", v5, taskName];
    }
    else
    {
      v7 = (__CFString *)self->_taskName;
      if (!v7) {
        v7 = &stru_1F265CF90;
      }
      descriptionString = v7;
    }
    self->_descriptionString = descriptionString;
  }
  double v8 = descriptionString;
  +[MFActivityMonitor mf_unlock];
  return v8;
}

- (id)taskName
{
  +[MFActivityMonitor mf_lock];
  id v3 = self->_taskName;
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (void)setTaskName:(id)a3
{
  +[MFActivityMonitor mf_lock];
  taskName = self->_taskName;
  if (taskName != a3)
  {
    v6 = taskName;
    self->_taskName = (NSString *)a3;
  }
  self->_currentCount = 0;
  self->_unint64_t maxCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;

  self->_displayName = 0;
  +[MFActivityMonitor mf_unlock];
}

- (id)displayName
{
  +[MFActivityMonitor mf_lock];
  id v3 = self->_displayName;
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4
{
  +[MFActivityMonitor mf_lock];
  displayName = self->_displayName;
  if (displayName != a3)
  {
    double v8 = displayName;
    self->_displayName = (NSString *)a3;
  }
  self->_unint64_t maxCount = a4;
  self->_currentCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;
  id v9 = [(MFActivityMonitor *)self userInfoForNotification];
  +[MFActivityMonitor mf_unlock];
  [(MFActivityMonitor *)self postDidChangeWithUserInfo:v9];
}

- (void)setDisplayName:(id)a3
{
}

- (void)setActivityTarget:(id)a3
{
  +[MFActivityMonitor mf_lock];
  if (self->_target == a3)
  {
    id target = 0;
  }
  else
  {
    id target = self->_target;
    self->_id target = a3;

    self->_descriptionString = 0;
  }
  +[MFActivityMonitor mf_unlock];
}

- (id)activityTarget
{
  +[MFActivityMonitor mf_lock];
  id v3 = self->_target;
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (BOOL)_lockedAddActivityTarget:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    self->_id target = objc_alloc_init(_MFActivityMonitorMultiTarget);

    self->_descriptionString = 0;
  }
  id target = self->_target;
  return [target addActivityTarget:a3];
}

- (void)addActivityTarget:(id)a3
{
  +[MFActivityMonitor mf_lock];
  id target = self->_target;
  BOOL v6 = [(MFActivityMonitor *)self _lockedAddActivityTarget:a3];
  if (self->_target == target) {
    v7 = 0;
  }
  else {
    v7 = target;
  }
  +[MFActivityMonitor mf_unlock];

  if (v6)
  {
    double v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"AddedTarget", 0);
    [v8 postNotificationName:@"MonitoredActivityDidAddActivityTarget" object:self userInfo:v9];
  }
}

- (void)addActivityTargets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  +[MFActivityMonitor mf_lock];
  id target = self->_target;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        v8 |= [(MFActivityMonitor *)self _lockedAddActivityTarget:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
    if (self->_target == target) {
      v11 = 0;
    }
    else {
      v11 = target;
    }
    +[MFActivityMonitor mf_unlock];

    if (v8) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MonitoredActivityDidAddActivityTarget", self, 0);
    }
  }
  else
  {
    if (self->_target == target) {
      v12 = 0;
    }
    else {
      v12 = target;
    }
    +[MFActivityMonitor mf_unlock];
  }
}

- (void)removeActivityTarget:(id)a3
{
  id v4 = a3;
  +[MFActivityMonitor mf_lock];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [self->_target removeActivityTarget:a3];
    +[MFActivityMonitor mf_unlock];
    if (v5)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v6, "postNotificationName:object:userInfo:", @"MonitoredActivityDidRemoveActivityTarget", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"RemovedTarget", 0));
    }
  }
  else
  {
    +[MFActivityMonitor mf_unlock];
  }
}

- (void)setPrimaryTarget:(id)a3
{
  +[MFActivityMonitor mf_lock];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id)[self->_target primaryTarget];
    [self->_target setPrimaryTarget:a3];

    self->_descriptionString = 0;
    +[MFActivityMonitor mf_unlock];
    if (v6)
    {
      int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"MonitoredActivityOldPrimaryTarget", a3, @"MonitoredActivityNewPrimaryTarget", 0);
      goto LABEL_6;
    }
  }
  else
  {
    +[MFActivityMonitor mf_unlock];
  }
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"MonitoredActivityNewPrimaryTarget", 0, @"MonitoredActivityOldPrimaryTarget", 0);
  id v6 = 0;
LABEL_6:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MonitoredActivityPrimaryTargetChanged", self, v5);
}

- (id)primaryTarget
{
  +[MFActivityMonitor mf_lock];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (id)[self->_target primaryTarget];
  }
  else {
    id v3 = 0;
  }
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (id)activityTargets
{
  +[MFActivityMonitor mf_lock];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (id)[self->_target allTargets];
  }
  else {
    id v3 = 0;
  }
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (BOOL)canBeCancelled
{
  return (*((unsigned __int8 *)self + 73) >> 5) & 1;
}

- (void)setShouldCancel:(BOOL)a3
{
  if ((*((unsigned char *)self + 73) & 0x20) != 0)
  {
    if (a3)
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        id v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
        if ((MFActivityMonitor *)[v4 objectForKey:*MEMORY[0x1E4F60CF8]] == self)
        {
          int v5 = MFLogGeneral();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v7 = 0;
            _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_DEFAULT, "#Warning Activity monitor cancelled on the Main Thread.  Why?", v7, 2u);
          }
        }
      }
      *((unsigned char *)self + 73) |= 0x40u;
      [(MFActivityMonitor *)self _cancelAssociatedCancelables];
    }
    else
    {
      *((unsigned char *)self + 73) &= ~0x40u;
    }
    +[MFActivityMonitor mf_lock];
    id v6 = self->_runningThread;
    +[MFActivityMonitor mf_unlock];
    if (v6) {
      [(MFActivityMonitor *)self performSelector:sel_cancelMessage onThread:v6 withObject:0 waitUntilDone:0];
    }
    else {
      [(MFActivityMonitor *)self cancelMessage];
    }

    [(MFInvocationQueue *)self->_ourQueue didCancel:self];
    [(MFActivityMonitor *)self _didChange];
  }
}

- (void)addCancelable:(id)a3
{
  +[MFActivityMonitor mf_lock];
  associatedCancelables = self->_associatedCancelables;
  if (!associatedCancelables)
  {
    associatedCancelables = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_associatedCancelables = associatedCancelables;
  }
  [(NSMutableSet *)associatedCancelables addObject:a3];
  +[MFActivityMonitor mf_unlock];
  if ((*((unsigned char *)self + 73) & 0x40) != 0)
  {
    [a3 cancel];
  }
}

- (void)removeCancelable:(id)a3
{
  +[MFActivityMonitor mf_lock];
  [(NSMutableSet *)self->_associatedCancelables removeObject:a3];
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

- (void)setInvocationQueue:(id)a3
{
  id v4 = (MFInvocationQueue *)a3;

  self->_ourQueue = v4;
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
  if ((*((_WORD *)self + 36) & 0x1FFF) != 0)
  {
    int v3 = 0;
  }
  else
  {
    *((_WORD *)self + 36) = *((_WORD *)self + 36) & 0xE000 | 1;
    int v3 = 1;
  }
  +[MFActivityMonitor mf_unlock];
  return v3;
}

- (void)relinquishExclusiveAccessKey:(int)a3
{
  +[MFActivityMonitor mf_lock];
  int v5 = *((unsigned __int16 *)self + 36);
  if (a3 == v5 << 19 >> 19) {
    *((_WORD *)self + 36) = v5 & 0xE000;
  }
  +[MFActivityMonitor mf_unlock];
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  -[MFActivityMonitor setStatusMessage:withKey:](self, "setStatusMessage:withKey:", a3);
  [(MFActivityMonitor *)self setPercentDone:v5 withKey:a4];
}

- (void)setStatusMessage:(id)a3 withKey:(int)a4
{
  +[MFActivityMonitor mf_lock];
  if (a4 != *((unsigned __int16 *)self + 36) << 19 >> 19 || (statusMessage = self->_statusMessage, statusMessage == a3))
  {
    +[MFActivityMonitor mf_unlock];
  }
  else
  {

    self->_statusMessage = (NSString *)a3;
    id v8 = [(MFActivityMonitor *)self userInfoForNotification];
    +[MFActivityMonitor mf_unlock];
    if (v8)
    {
      [(MFActivityMonitor *)self postDidChangeWithUserInfo:v8];
    }
  }
}

- (void)setPercentDone:(double)a3 withKey:(int)a4
{
  +[MFActivityMonitor mf_lock];
  if (a4 != *((unsigned __int16 *)self + 36) << 19 >> 19) {
    goto LABEL_9;
  }
  double v7 = 1.0;
  if (a3 <= 1.0) {
    double v7 = a3;
  }
  if (v7 == self->_percentDone)
  {
LABEL_9:
    +[MFActivityMonitor mf_unlock];
  }
  else
  {
    self->_percentDone = v7;
    id v8 = [(MFActivityMonitor *)self userInfoForNotification];
    +[MFActivityMonitor mf_unlock];
    if (v8)
    {
      [(MFActivityMonitor *)self postDidChangeWithUserInfo:v8];
    }
  }
}

- (id)error
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
  return (MFMailboxUid *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMailbox:(id)a3
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

@end