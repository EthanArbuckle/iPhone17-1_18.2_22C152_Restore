@interface ULLoiMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)createWithLastSeenTimeStamp:(double)a3 loiId:(id)a4 loiGroupId:(id)a5 loiType:(id)a6 inManagedObjectContext:(id)a7;
+ (id)fetchRequest;
- (optional<CLMiLoLoiTable::Entry>)convertToEntry;
@end

@implementation ULLoiMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULLoiMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULLoiMO alloc] initWithContext:v5];
  [(ULLoiMO *)v6 setLastSeenTimeStamp:*(double *)a3];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 8];
  v8 = [v7 UUIDString];
  [(ULLoiMO *)v6 setLoiId:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 24];
  v10 = [v9 UUIDString];
  [(ULLoiMO *)v6 setLoiGroupId:v10];

  v13 = (char *)*((void *)a3 + 5);
  v12 = (char *)a3 + 40;
  v11 = v13;
  if (v12[23] >= 0) {
    v14 = v12;
  }
  else {
    v14 = v11;
  }
  v15 = [NSString stringWithUTF8String:v14];
  [(ULLoiMO *)v6 setLoiType:v15];

  return v6;
}

+ (id)createWithLastSeenTimeStamp:(double)a3 loiId:(id)a4 loiGroupId:(id)a5 loiType:(id)a6 inManagedObjectContext:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [[ULLoiMO alloc] initWithContext:v14];
  [(ULLoiMO *)v15 setLastSeenTimeStamp:a3];
  [(ULLoiMO *)v15 setLoiId:v11];
  [(ULLoiMO *)v15 setLoiGroupId:v12];
  [(ULLoiMO *)v15 setLoiType:v13];

  return v15;
}

- (optional<CLMiLoLoiTable::Entry>)convertToEntry
{
  v2 = v1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  [v1 lastSeenTimeStamp];
  double v5 = v4;
  v6 = [v2 loiType];

  if (v6)
  {
    id v7 = [v2 loiType];
    std::string::basic_string[abi:ne180100]<0>(&v22, (char *)[v7 UTF8String]);

    v8 = [v2 loiId];
    v9 = v8;
    if (v8)
    {
      [v8 boostUUID];
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      char v33 = 0;
    }

    if (!v33)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_105);
      }
      id v12 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_ERROR, "convertToEntry: LOI record's LoiId has no value", buf, 2u);
      }
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      if (!v33) {
        char v33 = 1;
      }
    }
    id v13 = [v2 loiGroupId];
    id v14 = v13;
    if (v13)
    {
      [v13 boostUUID];
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      char v30 = 0;
    }

    if (!v30)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_105);
      }
      v15 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "convertToEntry: LOI record's LoiGroupId has no value", buf, 2u);
      }
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      if (!v30) {
        char v30 = 1;
      }
    }
    if (!v33) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    uint64_t v16 = v31;
    uint64_t v17 = v32;
    uint64_t v18 = v28;
    uint64_t v19 = v29;
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v22;
    }
    result = (optional<CLMiLoLoiTable::Entry> *)CLMiLoLoiTable::Entry::Entry((uint64_t)buf, v16, v17, v18, v19, (long long *)&__p, v5);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    long long v20 = v24;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)buf;
    *((_OWORD *)&retstr->var0.var4.var0.var0.var0.var1 + 1) = v20;
    retstr->var0.var4.var0.var1.var0[1] = v25;
    *(_OWORD *)&retstr->var0.var4.var0.var1.var0[2] = v26;
    retstr[1].var0.var4.var0.var0.var0.var1.var1 = v27;
    retstr[1].var0.var4.var0.var0.var0.var0.var0[16] = 1;
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_105);
    }
    v10 = logObject_MicroLocation_Default;
    result = (optional<CLMiLoLoiTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "convertToEntry: LOI record's LOI Type has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    retstr[1].var0.var4.var0.var0.var0.var0.var0[16] = 0;
  }
  return result;
}

@end