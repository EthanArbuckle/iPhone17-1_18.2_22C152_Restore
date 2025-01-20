@interface BKButtonHIDEventProcessor
- (BKButtonHIDEventProcessor)initWithContext:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (unint64_t)ringerState;
- (void)_postEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destination:(id)a6 cancelled:(BOOL)a7;
- (void)_processRingerSwitchEvent:(__IOHIDEvent *)a3 down:(BOOL)a4 sender:(id)a5 dispatcher:(id)a6;
- (void)cancelButtonForSenderID:(unint64_t)a3 uagePage:(unsigned __int16)a4 usage:(unsigned __int16)a5;
- (void)setRingerState:(unint64_t)a3;
@end

@implementation BKButtonHIDEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);

  objc_storeStrong((id *)&self->_eventRecords, 0);
}

- (void)setRingerState:(unint64_t)a3
{
  self->_ringerState = a3;
}

- (unint64_t)ringerState
{
  return self->_ringerState;
}

- (void)_processRingerSwitchEvent:(__IOHIDEvent *)a3 down:(BOOL)a4 sender:(id)a5 dispatcher:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  self->_ringerState = v7;
  v12 = sub_10005FA78();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = sub_100030BB4(self->_ringerState);
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ringer state changed to:%{public}@", buf, 0xCu);
  }
  v14 = [v11 destinationsForEvent:a3 fromSender:v10];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [(BKButtonHIDEventProcessor *)self _postEvent:a3 sender:v10 dispatcher:v11 destination:*(void *)(*((void *)&v19 + 1) + 8 * (void)v18) cancelled:0];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)_postEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destination:(id)a6 cancelled:(BOOL)a7
{
  id v14 = a6;
  id v10 = a5;
  id v11 = a4;
  Copy = (const void *)IOHIDEventCreateCopy();
  keyboardEventProcessor = self->_keyboardEventProcessor;
  if (keyboardEventProcessor) {
    [(BKKeyboardHIDEventProcessor *)keyboardEventProcessor eventSourceForSender:v11];
  }
  else {
    [v11 eventSource];
  }

  BKSHIDEventSetSimpleDeliveryInfo();
  if (Copy)
  {
    IOHIDEventGetTimeStamp();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
  }
  kdebug_trace();
  [v10 postEvent:Copy toDestination:v14];

  CFRelease(Copy);
}

- (void)cancelButtonForSenderID:(unint64_t)a3 uagePage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  int v5 = a5;
  int v6 = a4;
  p_eventRecordsLock = &self->_eventRecordsLock;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  if (eventRecords)
  {
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    v12 = +[NSNumber numberWithUnsignedInt:v5 | (v6 << 16)];
    v13 = [(NSMutableDictionary *)eventRecords->_usagePairsPerSenderID objectForKeyedSubscript:v11];
    id v14 = [v13 objectForKeyedSubscript:v12];
    sub_100022BDC((uint64_t)eventRecords, v13, v11, v12);
  }
  else
  {
    id v14 = 0;
  }
  os_unfair_lock_unlock(p_eventRecordsLock);
  id v15 = sub_10005FA78();
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = sub_10003A3B0(v14);
      *(_DWORD *)buf = 67109890;
      int v31 = v6;
      __int16 v32 = 1024;
      int v33 = v5;
      __int16 v34 = 2048;
      unint64_t v35 = a3;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX soft cancel: %{public}@", buf, 0x22u);
    }
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
    IOHIDEventSetSenderID();
    id v16 = v14[2];
    id v19 = v14[3];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v14[4];
    id v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        v24 = 0;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:](self, "_postEvent:sender:dispatcher:destination:cancelled:", KeyboardEvent, v16, v19, *(void *)(*((void *)&v25 + 1) + 8 * (void)v24), 1, (void)v25);
          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v22);
    }

    CFRelease(KeyboardEvent);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109632;
    int v31 = v6;
    __int16 v32 = 1024;
    int v33 = v5;
    __int16 v34 = 2048;
    unint64_t v35 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "0x%X/0x%X/%llX soft cancel: no event found, ignoring request", buf, 0x18u);
  }
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v9 = a4;
  id obj = a5;
  id v10 = a5;
  if (!self->_keyboardEventProcessor)
  {
    id v11 = +[BKHIDEventProcessorRegistry sharedInstance];
    v12 = [v11 eventProcessorOfClass:objc_opt_class()];
    keyboardEventProcessor = self->_keyboardEventProcessor;
    self->_keyboardEventProcessor = v12;
  }
  id v14 = *a3;
  uint64_t SenderID = IOHIDEventGetSenderID();
  int IntegerValue = IOHIDEventGetIntegerValue();
  unsigned __int16 v17 = IOHIDEventGetIntegerValue();
  uint64_t v18 = IOHIDEventGetIntegerValue();
  int Phase = IOHIDEventGetPhase();
  if ((unsigned __int16)IntegerValue == 11 && v17 == 46)
  {
    [(BKButtonHIDEventProcessor *)self _processRingerSwitchEvent:v14 down:v18 != 0 sender:v9 dispatcher:v10];
    goto LABEL_59;
  }
  id v62 = a4;
  LODWORD(v61) = (unsigned __int16)IntegerValue;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  HIDWORD(v61) = v17;
  uint64_t v21 = v17 | (IntegerValue << 16);
  uint64_t v64 = SenderID;
  unsigned int v63 = v17 | (IntegerValue << 16);
  if (eventRecords)
  {
    usagePairsPeruint64_t SenderID = eventRecords->_usagePairsPerSenderID;
    uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:SenderID];
    v24 = [(NSMutableDictionary *)usagePairsPerSenderID objectForKeyedSubscript:v23];

    long long v25 = +[NSNumber numberWithUnsignedInt:v21];
    uint64_t v26 = [v24 objectForKeyedSubscript:v25];
  }
  else
  {
    uint64_t v26 = 0;
  }
  if (!v18 || v26)
  {
    if (v18)
    {
      if (v26)
      {
        *(unsigned char *)(v26 + 10) = 0;
        int v36 = IOHIDEventGetPhase();
        if (v36)
        {
          if (!*(unsigned char *)(v26 + 8)) {
            *(unsigned char *)(v26 + 8) = v36 & 1;
          }
          if (!*(unsigned char *)(v26 + 9)) {
            *(unsigned char *)(v26 + 9) = (v36 & 4) != 0;
          }
        }
      }
      else
      {
        IOHIDEventGetPhase();
      }
    }
    else
    {
      int v46 = IOHIDEventGetPhase();
      if (!v26) {
        goto LABEL_44;
      }
      *(unsigned char *)(v26 + 10) = 1;
      int v47 = *(unsigned __int8 *)(v26 + 8);
      if (v46)
      {
        if (!*(unsigned char *)(v26 + 8))
        {
          int v47 = v46 & 1;
          *(unsigned char *)(v26 + 8) = v46 & 1;
        }
        if (!*(unsigned char *)(v26 + 9)) {
          *(unsigned char *)(v26 + 9) = (v46 & 4) != 0;
        }
      }
      if (!v47 || *(unsigned char *)(v26 + 9))
      {
LABEL_44:
        v48 = self->_eventRecords;
        if (v48)
        {
          v49 = +[NSNumber numberWithUnsignedLongLong:v64];
          v50 = +[NSNumber numberWithUnsignedInt:v63];
          v51 = [(NSMutableDictionary *)v48->_usagePairsPerSenderID objectForKeyedSubscript:v49];
          sub_100022BDC((uint64_t)v48, v51, v49, v50);
        }
        v52 = sub_10005FA78();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = sub_10003A3B0((id *)v26);
          *(_DWORD *)buf = 67109890;
          int v73 = v61;
          __int16 v74 = 1024;
          int v75 = HIDWORD(v61);
          __int16 v76 = 2048;
          uint64_t v77 = v64;
          __int16 v78 = 2114;
          v79 = v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX finished: %{public}@", buf, 0x22u);
        }
      }
    }
    goto LABEL_49;
  }
  long long v27 = [v10 destinationsForEvent:v14 fromSender:v9];
  if (!v27)
  {
    long long v27 = +[NSSet set];
  }
  long long v28 = objc_alloc_init(_BKButtonEventRecord);
  uint64_t v26 = (uint64_t)v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_eventDispatcher, obj);
    objc_storeStrong((id *)(v26 + 16), v62);
    +[NSDate timeIntervalSinceReferenceDate];
    *(void *)(v26 + 40) = v29;
    objc_storeStrong((id *)(v26 + 32), v27);
    int v30 = IOHIDEventGetPhase();
    if (v30)
    {
      if (!*(unsigned char *)(v26 + 8)) {
        *(unsigned char *)(v26 + 8) = v30 & 1;
      }
      if (!*(unsigned char *)(v26 + 9)) {
        *(unsigned char *)(v26 + 9) = (v30 & 4) != 0;
      }
    }
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    IOHIDEventGetPhase();
  }
  id obja = v27;
  int v31 = sub_10005FA78();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v32 = sub_10003A3B0((id *)v26);
    *(_DWORD *)buf = 67109890;
    int v73 = v61;
    __int16 v74 = 1024;
    int v75 = HIDWORD(v61);
    __int16 v76 = 2048;
    uint64_t v77 = v64;
    __int16 v78 = 2114;
    v79 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX began: %{public}@", buf, 0x22u);
  }
  int v33 = self->_eventRecords;
  if (v33)
  {
    id v34 = (id)v26;
    uint64_t v35 = v64;
LABEL_30:
    v40 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v35, v61);
    v41 = +[NSNumber numberWithUnsignedInt:v63];
    v42 = v33->_usagePairsPerSenderID;
    if (!v42)
    {
      v43 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v44 = v33->_usagePairsPerSenderID;
      v33->_usagePairsPeruint64_t SenderID = v43;

      v42 = v33->_usagePairsPerSenderID;
    }
    id v45 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v40];
    if (!v45)
    {
      id v45 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMutableDictionary *)v33->_usagePairsPerSenderID setObject:v45 forKeyedSubscript:v40];
    }
    [v45 setObject:v26 forKeyedSubscript:v41];

    goto LABEL_35;
  }
  v37 = objc_alloc_init(BKEventSenderUsagePairDictionary);
  v38 = self->_eventRecords;
  self->_eventRecords = v37;

  int v33 = self->_eventRecords;
  id v39 = (id)v26;
  uint64_t v35 = v64;
  if (v33) {
    goto LABEL_30;
  }
LABEL_35:

LABEL_49:
  os_unfair_lock_unlock(&self->_eventRecordsLock);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  if (v26) {
    v54 = *(void **)(v26 + 32);
  }
  else {
    v54 = 0;
  }
  id v55 = v54;
  id v56 = [v55 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v68;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(v55);
        }
        [(BKButtonHIDEventProcessor *)self _postEvent:v14 sender:v9 dispatcher:v10 destination:*(void *)(*((void *)&v67 + 1) + 8 * i) cancelled:Phase == 8];
      }
      id v57 = [v55 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v57);
  }

LABEL_59:
  return 1;
}

- (BKButtonHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKButtonHIDEventProcessor;
  int v5 = [(BKButtonHIDEventProcessor *)&v15 init];
  int v6 = v5;
  if (v5)
  {
    v5->_eventRecordsLock._os_unfair_lock_opaque = 0;
    BOOL v7 = [v4 systemInterface];
    uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
    if (KeyboardEvent)
    {
      id v9 = (const void *)KeyboardEvent;
      id v10 = [v7 systemEventOfType:3 matchingEvent:KeyboardEvent options:0];
      if (v10)
      {
        id v11 = v10;
        v6->_ringerState = IOHIDEventGetIntegerValue() != 0;
        v12 = sub_10005FA78();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = sub_100030BB4(v6->_ringerState);
          *(_DWORD *)buf = 138543362;
          unsigned __int16 v17 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "initial ringer state:%{public}@", buf, 0xCu);
        }
        CFRelease(v11);
      }
      CFRelease(v9);
    }
  }
  return v6;
}

@end