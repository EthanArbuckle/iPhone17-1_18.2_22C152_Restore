@interface MKBDeviceLockModelEducationalMode
+ (id)sharedLockModelWithUID:(unsigned int)a3;
- (BOOL)isPermanentlyBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isWipePending;
- (MKBDeviceLockModelEducationalMode)initWithJournalPath:(id)a3 uid:(unsigned int)a4;
- (MKBDeviceLockModelEducationalMode)initWithUID:(unsigned int)a3;
- (double)timeUntilUnblockedSinceReferenceDate;
- (id)_lockStateValueForKey:(id)a3 ofType:(Class)a4;
- (unint64_t)failedPasscodeAttempts;
- (void)_loadLockState;
- (void)_persistentStateQueue_beginSpeculativeFailureCharge;
- (void)_persistentStateQueue_cancelSpeculativeFailureCharge;
- (void)_persistentStateQueue_loadLockState;
- (void)_persistentStateQueue_rollbackSpeculativeFailureCharge;
- (void)_persistentStateQueue_unlockFailed;
- (void)_persistentStateQueue_unlockSucceeded;
- (void)_setLockStateValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)notePasscodeUnlockFailed;
- (void)notePasscodeUnlockSucceeded;
@end

@implementation MKBDeviceLockModelEducationalMode

+ (id)sharedLockModelWithUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1000398E8 != -1) {
    dispatch_once(&qword_1000398E8, &stru_100030EC0);
  }
  v4 = (void *)qword_1000398E0;
  objc_sync_enter((id)qword_1000398E0);
  if (!objc_msgSend((id)qword_1000398E0, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3)))
  {
    v5 = [[MKBDeviceLockModelEducationalMode alloc] initWithUID:v3];
    [objc_msgSend((id)qword_1000398E0, "setObject:forKeyedSubscript:", v5, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  }
  id v6 = [[(id)qword_1000398E0 objectForKeyedSubscript:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3)];
  objc_sync_exit(v4);
  return v6;
}

- (MKBDeviceLockModelEducationalMode)initWithUID:(unsigned int)a3
{
  return [(MKBDeviceLockModelEducationalMode *)self initWithJournalPath:@"/private/var/keybags/LockoutState.plist" uid:*(void *)&a3];
}

- (MKBDeviceLockModelEducationalMode)initWithJournalPath:(id)a3 uid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)MKBDeviceLockModelEducationalMode;
  id v6 = [(MKBDeviceLockModelEducationalMode *)&v8 init];
  if (v6)
  {
    v6->_lockStatePath = (NSString *)[a3 copy];
    v6->_uid = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%d", v4];
    v6->_persistentStateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilekeybag.devicelockmodel", 0);
    [(MKBDeviceLockModelEducationalMode *)v6 _persistentStateQueue_loadLockState];
  }
  return v6;
}

- (void)dealloc
{
  persistentStateQueue = self->_persistentStateQueue;
  if (persistentStateQueue) {
    dispatch_release(persistentStateQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)MKBDeviceLockModelEducationalMode;
  [(MKBDeviceLockModelEducationalMode *)&v4 dealloc];
}

- (void)notePasscodeEntryBegan
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E890;
  block[3] = &unk_100030C28;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeEntryCancelled
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E90C;
  block[3] = &unk_100030C28;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeUnlockSucceeded
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E988;
  block[3] = &unk_100030C28;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeUnlockFailed
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EA04;
  block[3] = &unk_100030C28;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (BOOL)isPermanentlyBlocked
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EABC;
  v5[3] = &unk_100030EE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTemporarilyBlocked
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(MKBDeviceLockModelEducationalMode *)self timeUntilUnblockedSinceReferenceDate];
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EBC4;
  v5[3] = &unk_100030EE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWipePending
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EC84;
  v5[3] = &unk_100030EE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)failedPasscodeAttempts
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000ED44;
  v5[3] = &unk_100030EE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_persistentStateQueue_beginSpeculativeFailureCharge
{
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 1;
    unint64_t failedPasscodeAttempts = self->_failedPasscodeAttempts;
    unint64_t v4 = failedPasscodeAttempts + 1;
    self->_unint64_t failedPasscodeAttempts = failedPasscodeAttempts + 1;
    unint64_t v5 = failedPasscodeAttempts - 9;
    if (failedPasscodeAttempts - 9 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      int v6 = 0;
      double v7 = 60.0;
      switch(failedPasscodeAttempts)
      {
        case 5uLL:
          break;
        case 6uLL:
          int v6 = 0;
          double v7 = 300.0;
          break;
        case 7uLL:
          int v6 = 0;
          double v7 = 900.0;
          break;
        case 8uLL:
          int v6 = 0;
          double v7 = 3600.0;
          break;
        default:
          double v7 = -1.0;
          int v6 = 1;
          break;
      }
    }
    else
    {
      int v6 = 0;
      double v7 = 0.0;
    }
    if (self->_originalDefaultsForRollback) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MKBDeviceLockModelEducationalMode.m", 188, @"We should not have rollback values when beginning a speculative failure charge, but we had %@", self->_originalDefaultsForRollback object file lineNumber description];
    }
    v13[0] = @"MKBDeviceLockPendingWipe";
    v14[0] = +[NSNumber numberWithBool:self->_pendingWipe];
    v13[1] = @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate";
    v14[1] = +[NSNumber numberWithDouble:self->_unblockTime];
    v13[2] = @"MKBDeviceLockBlocked";
    v14[2] = +[NSNumber numberWithBool:self->_permanentlyBlocked];
    v13[3] = @"MKBDeviceLockFailedAttempts";
    v14[3] = +[NSNumber numberWithUnsignedInteger:self->_failedPasscodeAttempts];
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
    self->_originalDefaultsForRollback = v8;
    uint64_t v9 = v8;
    [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:+[NSNumber numberWithUnsignedInteger:self->_failedPasscodeAttempts] forKey:@"MKBDeviceLockFailedAttempts"];
    if (v5 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      if (v6)
      {
        [+[NSDate distantFuture] timeIntervalSinceReferenceDate];
        [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:@"MKBDeviceLockBlockTimeIntervalSinceReferenceDate"];
        v10 = (NSNumber *)&__kCFBooleanTrue;
        CFStringRef v11 = @"MKBDeviceLockBlocked";
      }
      else
      {
        +[NSDate timeIntervalSinceReferenceDate];
        v10 = +[NSNumber numberWithDouble:v7 + v12];
        CFStringRef v11 = @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate";
      }
      [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:v10 forKey:v11];
    }
    if (v4 >= 0xA) {
      [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:&__kCFBooleanTrue forKey:@"MKBDeviceLockPendingWipe"];
    }
    [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_loadLockState];
  }
}

- (void)_persistentStateQueue_cancelSpeculativeFailureCharge
{
  self->_speculativePasscodeFailureChargeOutstanding = 0;

  self->_originalDefaultsForRollback = 0;
}

- (void)_persistentStateQueue_rollbackSpeculativeFailureCharge
{
  if (self->_speculativePasscodeFailureChargeOutstanding)
  {
    [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:[(NSDictionary *)self->_originalDefaultsForRollback objectForKeyedSubscript:@"MKBDeviceLockPendingWipe"] forKey:@"MKBDeviceLockPendingWipe"];
    [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:[(NSDictionary *)self->_originalDefaultsForRollback objectForKeyedSubscript:@"MKBDeviceLockBlocked"] forKey:@"MKBDeviceLockBlocked"];
    [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:[(NSDictionary *)self->_originalDefaultsForRollback objectForKeyedSubscript:@"MKBDeviceLockBlockTimeIntervalSinceReferenceDate"] forKey:@"MKBDeviceLockBlockTimeIntervalSinceReferenceDate"];
    [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:[(NSDictionary *)self->_originalDefaultsForRollback objectForKeyedSubscript:@"MKBDeviceLockFailedAttempts"] forKey:@"MKBDeviceLockFailedAttempts"];
    [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_loadLockState];
    [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_cancelSpeculativeFailureCharge];
  }
}

- (void)_persistentStateQueue_unlockSucceeded
{
  [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_cancelSpeculativeFailureCharge];
  [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:0 forKey:@"MKBDeviceLockBlocked"];
  [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:0 forKey:@"MKBDeviceLockBlockTimeIntervalSinceReferenceDate"];
  [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:0 forKey:@"MKBDeviceLockPendingWipe"];
  [(MKBDeviceLockModelEducationalMode *)self _setLockStateValue:0 forKey:@"MKBDeviceLockFailedAttempts"];

  [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_loadLockState];
}

- (void)_persistentStateQueue_unlockFailed
{
  [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_cancelSpeculativeFailureCharge];

  [(MKBDeviceLockModelEducationalMode *)self _persistentStateQueue_loadLockState];
}

- (void)_persistentStateQueue_loadLockState
{
  id v3 = [(MKBDeviceLockModelEducationalMode *)self _lockStateValueForKey:@"MKBDeviceLockBlockTimeIntervalSinceReferenceDate" ofType:objc_opt_class()];
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [+[NSDate distantPast] timeIntervalSinceReferenceDate];
  }
  self->_unblockTime = v4;
  self->_pendingWipe = [[-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", @"MKBDeviceLockPendingWipe", objc_opt_class()) BOOLValue];
  self->_permanentlyBlocked = [[-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", @"MKBDeviceLockBlocked", objc_opt_class()) stringByAppendingPathComponent:@"DBCShutdownCookie"];
  self->_unint64_t failedPasscodeAttempts = (unint64_t)[[-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", @"MKBDeviceLockFailedAttempts", objc_opt_class()) unsignedIntegerValue];
}

- (void)_loadLockState
{
  id v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->_lockStatePath];
  self->_lockStateCache = v3;
  if (!v3) {
    self->_lockStateCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
}

- (id)_lockStateValueForKey:(id)a3 ofType:(Class)a4
{
  lockStateCache = self->_lockStateCache;
  if (!lockStateCache)
  {
    [(MKBDeviceLockModelEducationalMode *)self _loadLockState];
    lockStateCache = self->_lockStateCache;
  }
  id v7 = [[-[NSMutableDictionary objectForKeyedSubscript:](lockStateCache, "objectForKeyedSubscript:", self->_uid, a4) objectForKeyedSubscript:a3];
  if (objc_opt_isKindOfClass()) {
    return v7;
  }
  else {
    return 0;
  }
}

- (void)_setLockStateValue:(id)a3 forKey:(id)a4
{
  id v7 = [(NSMutableDictionary *)self->_lockStateCache objectForKeyedSubscript:self->_uid];
  if (a3)
  {
    if (!v7) {
      [(NSMutableDictionary *)self->_lockStateCache setObject:+[NSMutableDictionary dictionary] forKeyedSubscript:self->_uid];
    }
    [self->_lockStateCache objectForKeyedSubscript:self->_uid] setObject:a3 forKeyedSubscript:a4];
  }
  else
  {
    [v7 removeObjectForKey:a4];
  }
  [(NSMutableDictionary *)self->_lockStateCache writeToFile:self->_lockStatePath atomically:1];

  sync();
}

@end