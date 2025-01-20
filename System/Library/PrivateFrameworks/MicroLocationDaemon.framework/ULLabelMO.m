@interface ULLabelMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationRecordingLabelsTable::Entry>)convertToEntry;
@end

@implementation ULLabelMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULLabelMO alloc] initWithContext:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v8 = [v7 UUIDString];
  [(ULLabelMO *)v6 setTriggerUUID:v8];

  if (*((char *)a3 + 39) >= 0) {
    v9 = (char *)a3 + 16;
  }
  else {
    v9 = (char *)*((void *)a3 + 2);
  }
  v10 = [NSString stringWithUTF8String:v9];
  [(ULLabelMO *)v6 setClientId:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 40];
  v12 = [v11 UUIDString];
  [(ULLabelMO *)v6 setLabelUUID:v12];

  [(ULLabelMO *)v6 setReceivedTimestamp:*((double *)a3 + 7)];
  v13 = [(ULLabelMO *)v6 clientId];
  v15 = CLMicroLocationClientUtils::getNSServiceUUIDFromClientIdAndServiceUUID(v13, v14);

  if (v15)
  {
    v16 = [v15 UUIDString];
  }
  else
  {
    v16 = &stru_2704E2F50;
  }
  [(ULLabelMO *)v6 setServiceUUID:v16];
  if (v15) {

  }
  return v6;
}

- (optional<CLMicroLocationRecordingLabelsTable::Entry>)convertToEntry
{
  v2 = v1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = [v1 triggerUUID];
  id v5 = v4;
  if (v4)
  {
    [v4 boostUUID];
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    char v31 = 0;
  }

  if (!v31)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_29);
    }
    v8 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (!result) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v10 = "convertToEntry: label's triggerUUID has no value";
    goto LABEL_25;
  }
  v6 = [v2 labelUUID];
  v7 = v6;
  if (v6)
  {
    [v6 boostUUID];
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    char v28 = 0;
  }

  if (!v28)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_29);
    }
    v8 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (!result) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v10 = "convertToEntry: label's labelUUID has no value";
    goto LABEL_25;
  }
  v11 = [v2 clientId];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_29);
    }
    v8 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (!result) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v10 = "convertToEntry: label's clientId has no value";
LABEL_25:
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_ERROR, v10, buf, 2u);
LABEL_26:
    retstr->var0.var0 = 0;
    retstr[2].var0.var0 = 0;
    return result;
  }
  id v13 = [v2 clientId];
  std::string::basic_string[abi:ne180100]<0>(&v20, (char *)[v13 UTF8String]);

  [v2 receivedTimestamp];
  if (!v31) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  double v15 = v14;
  uint64_t v16 = v29;
  uint64_t v17 = v30;
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v20;
  }
  if (!v28) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  result = (optional<CLMicroLocationRecordingLabelsTable::Entry> *)CLMicroLocationRecordingLabelsTable::Entry::Entry((uint64_t)buf, v16, v17, (long long *)&__p, v26, v27, v15);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uuid v18 = v22;
  retstr->var0 = *($74F8CD3D603D8EDDACC82D378F791B4C *)buf;
  retstr->var1 = v18;
  *(void *)&retstr[1].var0.var0 = v23;
  *($74F8CD3D603D8EDDACC82D378F791B4C *)((char *)&retstr[1].var0 + 8) = v24;
  *(void *)&retstr[1].var1.var0[8] = v25;
  retstr[2].var0.var0 = 1;
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULLabelMO"];
}

@end