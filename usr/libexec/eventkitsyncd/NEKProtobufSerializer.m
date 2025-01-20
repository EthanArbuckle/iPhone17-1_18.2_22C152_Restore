@interface NEKProtobufSerializer
+ (void)oops;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
@end

@implementation NEKProtobufSerializer

+ (void)oops
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6C60);
  dword_1000C69E0 = (dword_1000C69E0 - 1) & 0x7FFFFFFF;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6C60);
}

- (id)dataFromChange:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NEKPBProtoBuffMessage);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6C60);
  if (dword_1000C69E0 == 0x80000000)
  {
    uint32_t v5 = arc4random();
    unsigned int v6 = v5 & 0x7FFFFFFF;
    uint64_t v7 = v5 | 0x80000000;
  }
  else
  {
    unsigned int v6 = (dword_1000C69E0 + 1) & 0x7FFFFFFF;
    uint64_t v7 = v6;
  }
  dword_1000C69E0 = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6C60);
  [(NEKPBProtoBuffMessage *)v4 setPacketNumber:v7];
  unsigned int v8 = [(NEKPBProtoBuffMessage *)v4 packetNumber];
  unsigned __int16 v9 = (unsigned __int16)[(NEKPBProtoBuffMessage *)v4 packetNumber];
  v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v9;
    int v12 = HIWORD(v8) & 0x7FFF;
    v13 = v10;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    int v22 = 138543874;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 1024;
    int v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "dataWithSYChange: serializing object of class: %{public}@ S_PKT_NUM:%04x_%04x", (uint8_t *)&v22, 0x18u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_1000460B8(v3);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [(NEKPBProtoBuffMessage *)v4 setStoreWrapper:v16];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sub_100044940(v3);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      [(NEKPBProtoBuffMessage *)v4 setCalendarWrapper:v16];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v3;
        if ([v16 isReminderWithLocation])
        {
          ct_green_tea_logger_create();
          v17 = getCTGreenTeaOsLogHandle();
          v18 = v17;
          if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v22) = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Sending reminder with location", (uint8_t *)&v22, 2u);
          }

          ct_green_tea_logger_destroy();
        }
        v19 = sub_1000456BC(v16);
        [(NEKPBProtoBuffMessage *)v4 setICSWrapper:v19];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          sub_1000465FC(v3);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          [(NEKPBProtoBuffMessage *)v4 setDeletionWrapper:v16];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          sub_100046768(v3);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          [(NEKPBProtoBuffMessage *)v4 setValidationWrapper:v16];
        }
      }
    }
  }

LABEL_22:
  v20 = [(NEKPBProtoBuffMessage *)v4 data];

  return v20;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v4 = a3;
  uint32_t v5 = [[NEKPBProtoBuffMessage alloc] initWithData:v4];

  unsigned int v6 = [(NEKPBProtoBuffMessage *)v5 storeWrapper];

  if (v6)
  {
    uint64_t v7 = [(NEKPBProtoBuffMessage *)v5 storeWrapper];
    uint64_t v8 = sub_100046364(v7);
  }
  else
  {
    unsigned __int16 v9 = [(NEKPBProtoBuffMessage *)v5 calendarWrapper];

    if (v9)
    {
      uint64_t v7 = [(NEKPBProtoBuffMessage *)v5 calendarWrapper];
      uint64_t v8 = sub_10004500C(v7);
    }
    else
    {
      v10 = [(NEKPBProtoBuffMessage *)v5 iCSWrapper];

      if (v10)
      {
        uint64_t v7 = [(NEKPBProtoBuffMessage *)v5 iCSWrapper];
        uint64_t v8 = sub_100045A78(v7);
      }
      else
      {
        int v11 = [(NEKPBProtoBuffMessage *)v5 deletionWrapper];

        if (v11)
        {
          uint64_t v7 = [(NEKPBProtoBuffMessage *)v5 deletionWrapper];
          uint64_t v8 = sub_1000466A8(v7);
        }
        else
        {
          int v12 = [(NEKPBProtoBuffMessage *)v5 validationWrapper];

          if (!v12)
          {
            __int16 v26 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              sub_10006F71C((uint64_t)v5, v26);
            }
            goto LABEL_26;
          }
          uint64_t v7 = [(NEKPBProtoBuffMessage *)v5 validationWrapper];
          uint64_t v8 = sub_100046840((uint64_t)v7);
        }
      }
    }
  }
  v13 = (void *)v8;

  if (v13)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6C60);
    int v14 = [(NEKPBProtoBuffMessage *)v5 packetNumber];
    unsigned int v15 = [(NEKPBProtoBuffMessage *)v5 packetNumber];
    unsigned __int16 v16 = v15;
    BOOL v17 = dword_1000C69E4 == 0x80000000 || v14 < 0;
    unsigned int v18 = v15 & 0x7FFFFFFF;
    int v19 = (dword_1000C69E4 + 1) & 0x7FFFFFFF;
    if (v17) {
      int v19 = v15 & 0x7FFFFFFF;
    }
    dword_1000C69E4 = v19;
    v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = v16;
      int v22 = v20;
      v23 = (objc_class *)objc_opt_class();
      __int16 v24 = NSStringFromClass(v23);
      int v29 = 138543874;
      v30 = v24;
      __int16 v31 = 1024;
      unsigned int v32 = HIWORD(v18);
      __int16 v33 = 1024;
      int v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SYChangeWithData: returning object of type: %{public}@ R_PKT_NUM:%04x_%04x", (uint8_t *)&v29, 0x18u);
    }
    if (v18 != dword_1000C69E4)
    {
      int v25 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10006F794(v25);
      }
      dword_1000C69E4 = v18;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6C60);
    goto LABEL_28;
  }
LABEL_26:
  v13 = +[SYDegenerateChange degenerateChange];
  int v27 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10006F6D8(v27);
  }
LABEL_28:

  return v13;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  return -[NEKProtobufSerializer dataFromChange:](self, "dataFromChange:", a3, a4);
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return [(NEKProtobufSerializer *)self changeFromData:a3 ofType:a5];
}

@end