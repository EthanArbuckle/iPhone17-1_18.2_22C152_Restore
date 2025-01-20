@interface BKHIDTouchSensitiveButtonEventProcessor
- (BKHIDTouchSensitiveButtonEventProcessor)initWithContext:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5;
@end

@implementation BKHIDTouchSensitiveButtonEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_eventRecords, 0);

  objc_storeStrong((id *)&self->_buttonScanningController, 0);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetType() == 42)
  {
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v53 = v8;
    id v56 = v8;
    id v54 = v9;
    if (!self)
    {
LABEL_42:

      os_unfair_lock_unlock(lock);
      int64_t v35 = 1;
      id v8 = v53;
      goto LABEL_43;
    }
    os_unfair_lock_assert_owner(lock);
    id v11 = [v56 senderID];
    __int16 IntegerValue = IOHIDEventGetIntegerValue();
    __int16 v13 = IOHIDEventGetIntegerValue();
    uint64_t v14 = sub_100037DE8();
    if (!v14)
    {
      v22 = sub_10005FA78();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v36 = sub_100037EE8((uint64_t)v10);
        LODWORD(v57.receiver) = 138543362;
        *(id *)((char *)&v57.receiver + 4) = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "missing force stage event -- dropping event: %{public}@", (uint8_t *)&v57, 0xCu);
      }
      goto LABEL_41;
    }
    uint64_t v15 = v14;
    unsigned int v16 = IOHIDEventGetIntegerValue();
    int v17 = IOHIDEventGetIntegerValue();
    v18 = [_BKTouchSensitiveButtonKey alloc];
    if (v18)
    {
      v57.id receiver = v18;
      v57.Class super_class = (Class)_BKTouchSensitiveButtonKey;
      v19 = [(BKHIDTouchSensitiveButtonEventProcessor *)&v57 init];
      v20 = v19;
      if (v19)
      {
        *(void *)&v19->_lock._os_unfair_lock_opaque = v11;
        LOWORD(v19->_buttonScanningController) = IntegerValue;
        WORD1(v19->_buttonScanningController) = v13;
      }
    }
    else
    {
      v20 = 0;
    }
    v21 = [(NSMutableDictionary *)self->_lock_eventRecords objectForKey:v20];
    v22 = v20;
    v57.id receiver = v22;
    v52 = v21;
    v57.Class super_class = v52;
    unsigned int v58 = v16;
    int v59 = v17;
    v60 = v10;
    uint64_t v61 = v15;
    id v62 = v56;
    id v63 = v54;
    os_log_type_t v23 = 2 * (v17 == 0);
    v24 = sub_10005FA78();
    if (os_log_type_enabled(v24, v23))
    {
      uint64_t TimeStamp = IOHIDEventGetTimeStamp();
      v26 = sub_100037EE8((uint64_t)v10);
      *(_DWORD *)buf = 134218242;
      uint64_t v65 = TimeStamp;
      __int16 v66 = 2114;
      v67 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "in %llX %{public}@", buf, 0x16u);
    }
    if (!v58)
    {
      v34 = sub_10005FA78();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "TouchSensitiveButton: got event for idle stage, bailing", buf, 2u);
      }
      goto LABEL_39;
    }
    if (!v59)
    {
      if (!v57.super_class)
      {
        v34 = sub_10005FA78();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id receiver = v57.receiver;
          v46 = sub_10003760C(v58);
          *(_DWORD *)buf = 138543618;
          uint64_t v65 = (uint64_t)receiver;
          __int16 v66 = 2114;
          v67 = v46;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %{public}@, ignoring change event", buf, 0x16u);
        }
        goto LABEL_39;
      }
      sub_100046A6C(self, (uint64_t)v10, (uint64_t)&v57);
      sub_100046730((uint64_t)&v57);
      int v32 = v59;
      Class super_class = v57.super_class;
      if (v57.super_class) {
        Class super_class = (Class)*((void *)v57.super_class + 3);
      }
      goto LABEL_19;
    }
    if (v59 != 2)
    {
      if (v59 != 1)
      {
LABEL_40:
        sub_1000466E4((uint64_t)&v57);

LABEL_41:
        goto LABEL_42;
      }
      id v27 = v57.receiver;
      v28 = v57.super_class;
      if (!v28)
      {
        v28 = objc_alloc_init(_BKTouchSensitiveButtonEventRecord);
        objc_storeStrong((id *)&v57.super_class, v28);
        lock_eventRecords = self->_lock_eventRecords;
        if (!lock_eventRecords)
        {
          v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v31 = self->_lock_eventRecords;
          self->_lock_eventRecords = v30;

          lock_eventRecords = self->_lock_eventRecords;
        }
        [(NSMutableDictionary *)lock_eventRecords setObject:v28 forKey:v27];
      }

      sub_100046A6C(self, (uint64_t)v10, (uint64_t)&v57);
      sub_100046730((uint64_t)&v57);
      int v32 = v59;
      Class super_class = v57.super_class;
      if (v57.super_class) {
        Class super_class = (Class)*((void *)v57.super_class + 3);
      }
LABEL_19:
      v34 = super_class;
      sub_1000467D8((uint64_t)self, (uint64_t)v10, 0, v32, v34, v63);
LABEL_39:

      goto LABEL_40;
    }
    v37 = v57.super_class;
    v34 = v37;
    if (v37)
    {
      uint64_t v38 = v58;
      id v39 = v37[2];
      unsigned __int8 v40 = [v39 containsIndex:v38];

      if (v40)
      {
        sub_100046730((uint64_t)&v57);
        int v41 = v59;
        v42 = v34[3].isa;
        sub_1000467D8((uint64_t)self, (uint64_t)v10, 0, v41, v42, v63);

        v43 = v34[2].isa;
        BOOL v44 = [(objc_class *)v43 count] == 0;

        if (v44) {
          [(NSMutableDictionary *)self->_lock_eventRecords removeObjectForKey:v57.receiver];
        }
        goto LABEL_39;
      }
      v47 = sub_10005FA78();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v65 = (uint64_t)v57.receiver;
      __int16 v66 = 1024;
      LODWORD(v67) = v38;
      v48 = "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %d, ignoring exit event";
      v49 = v47;
      uint32_t v50 = 18;
    }
    else
    {
      v47 = sub_10005FA78();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_38:

        goto LABEL_39;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = (uint64_t)v57.receiver;
      v48 = "[TouchSensitiveButton %{public}@]: did not see an enter transition for this button, ignoring exit event";
      v49 = v47;
      uint32_t v50 = 12;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    goto LABEL_38;
  }
  int64_t v35 = 0;
LABEL_43:

  return v35;
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
}

- (BKHIDTouchSensitiveButtonEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v10.id receiver = self;
  v10.Class super_class = (Class)BKHIDTouchSensitiveButtonEventProcessor;
  v5 = [(BKHIDTouchSensitiveButtonEventProcessor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = [[BKHIDTouchSensitiveButtonScanningController alloc] initWithContext:v4];
    buttonScanningController = v6->_buttonScanningController;
    v6->_buttonScanningController = v7;
  }
  return v6;
}

@end