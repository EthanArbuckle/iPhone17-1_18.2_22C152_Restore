@interface ULRecordingEventMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (void)convertToEntry;
@end

@implementation ULRecordingEventMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = [[ULRecordingEventMO alloc] initWithContext:a4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v7 = [v6 UUIDString];
  [(ULRecordingEventMO *)v5 setRecordingUUID:v7];

  [(ULRecordingEventMO *)v5 setRecordingTimestamp:*((double *)a3 + 2)];
  if (*((char *)a3 + 47) >= 0) {
    v8 = (char *)a3 + 24;
  }
  else {
    v8 = (char *)*((void *)a3 + 3);
  }
  v9 = [NSString stringWithUTF8String:v8];
  [(ULRecordingEventMO *)v5 setLoiType:v9];

  [(ULRecordingEventMO *)v5 setReceivedTimestamp:*((double *)a3 + 8)];
  v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 48];
  v11 = [v10 UUIDString];
  [(ULRecordingEventMO *)v5 setLoiId:v11];

  if (*((unsigned char *)a3 + 240)) {
    long long v20 = *((_OWORD *)a3 + 14);
  }
  else {
    long long v20 = 0uLL;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v20];
  v13 = [v12 UUIDString];
  [(ULRecordingEventMO *)v5 setTriggerUUID:v13];

  v14 = (CLMicroLocationProto::RecordingEvent *)[(ULRecordingEventMO *)v5 setEventType:*((unsigned int *)a3 + 18)];
  int v15 = *((_DWORD *)a3 + 18);
  if (v15 == 13)
  {
    if ((*((unsigned char *)a3 + 221) & 4) != 0)
    {
      uint64_t v18 = *((void *)a3 + 21);
      if (!v18)
      {
        v14 = (CLMicroLocationProto::RecordingEvent *)CLMicroLocationProto::RecordingEvent::default_instance(v14);
        uint64_t v18 = *((void *)v14 + 11);
      }
      if ((*(unsigned char *)(v18 + 44) & 2) != 0)
      {
        uint64_t v17 = *((void *)a3 + 21);
        if (!v17) {
          uint64_t v17 = *(void *)(CLMicroLocationProto::RecordingEvent::default_instance(v14) + 88);
        }
        goto LABEL_21;
      }
    }
  }
  else if (v15 == 1 && (*((unsigned char *)a3 + 220) & 4) != 0)
  {
    uint64_t v16 = *((void *)a3 + 12);
    if (!v16)
    {
      v14 = (CLMicroLocationProto::RecordingEvent *)CLMicroLocationProto::RecordingEvent::default_instance(v14);
      uint64_t v16 = *((void *)v14 + 2);
    }
    if ((*(unsigned char *)(v16 + 44) & 2) != 0)
    {
      uint64_t v17 = *((void *)a3 + 12);
      if (!v17) {
        uint64_t v17 = *(void *)(CLMicroLocationProto::RecordingEvent::default_instance(v14) + 16);
      }
LABEL_21:
      [(ULRecordingEventMO *)v5 setEventSubType:*(unsigned int *)(v17 + 12)];
    }
  }
  CLMicroLocationProto::RecordingEvent::ByteSize((CLMicroLocationProto::RecordingEvent *)((char *)a3 + 80));
  operator new[]();
}

- (void)convertToEntry
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v4 = [a1 recordingUUID];
  v5 = v4;
  if (v4)
  {
    [v4 boostUUID];
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    char v47 = 0;
  }

  if (!v47)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_17);
    }
    int v15 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "convertToEntry: recordingEvent's recordingUUID has no value";
    goto LABEL_16;
  }
  [a1 recordingTimestamp];
  double v7 = v6;
  [a1 receivedTimestamp];
  double v9 = v8;
  v10 = [a1 loiType];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_17);
    }
    int v15 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "convertToEntry: recordingEvent's loiType has no value";
LABEL_16:
    _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
LABEL_17:
    *a2 = 0;
    a2[248] = 0;
    return;
  }
  id v12 = [a1 loiType];
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[v12 UTF8String]);

  v13 = [a1 loiId];
  v14 = v13;
  if (v13)
  {
    [v13 boostUUID];
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    char v44 = 0;
  }

  if (!v44)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    char v44 = 1;
  }
  int v17 = [a1 eventType];
  LOBYTE(v40) = 0;
  char v41 = 0;
  uint64_t v18 = [a1 triggerUUID];
  BOOL v19 = [v18 length] == 0;

  if (!v19)
  {
    long long v20 = [a1 triggerUUID];
    uint64_t v21 = v20;
    if (v20)
    {
      [v20 boostUUID];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      char v36 = 0;
    }
    long long v40 = *(_OWORD *)buf;
    char v41 = v36;

    memset(buf, 0, sizeof(buf));
    if (v41)
    {
      if ((void)v40 == *(void *)buf && *((void *)&v40 + 1) == *(void *)&buf[8]) {
        char v41 = 0;
      }
    }
  }
  objc_msgSend(a1, "event", CLMicroLocationProto::RecordingEvent::RecordingEvent((CLMicroLocationProto::RecordingEvent *)v31));
  id v23 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 bytes];
  v25 = [a1 event];
  [v25 length];
  LOBYTE(v24) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v31, (const void *)v24);

  if (v24)
  {
    if (!v47) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    uint64_t v27 = v45;
    uint64_t v28 = v46;
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v30, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
    }
    else {
      std::string v30 = v32;
    }
    long long v33 = v40;
    char v34 = v41;
    if (!v44) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    CLMicroLocationRecordingEventsTable::Entry::Entry((uint64_t)buf, v27, v28, (long long *)&v30, v17, (CLMicroLocationProto::RecordingEvent *)v31, &v33, v26, v7, v9, v42, v43);
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v30.__r_.__value_.__l.__data_);
    }
    std::__optional_destruct_base<CLMicroLocationRecordingEventsTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRecordingEventsTable::Entry>((uint64_t)a2, (long long *)buf);
    CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)&v39);
    if (v38 < 0) {
      operator delete(__p);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_17);
    }
    v29 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v29, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize recordingEvent protobuf from byte stream", buf, 2u);
    }
    *a2 = 0;
    a2[248] = 0;
  }
  CLMicroLocationProto::RecordingEvent::~RecordingEvent((CLMicroLocationProto::RecordingEvent *)v31);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULRecordingEventMO"];
}

@end