@interface ULServiceMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMiLoServiceTable::Entry>)convertToEntry;
@end

@implementation ULServiceMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULServiceMO alloc] initWithContext:v5];
  [(ULServiceMO *)v6 setServiceType:*(unsigned int *)a3];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 8];
  v8 = [v7 UUIDString];
  [(ULServiceMO *)v6 setServiceUUID:v8];

  [(ULServiceMO *)v6 setLastActiveTimestamp:*((double *)a3 + 3)];
  if (*((char *)a3 + 55) >= 0) {
    v9 = (char *)a3 + 32;
  }
  else {
    v9 = (char *)*((void *)a3 + 4);
  }
  v10 = [NSString stringWithUTF8String:v9];
  [(ULServiceMO *)v6 setClientId:v10];

  [(ULServiceMO *)v6 setLocationTypes:*((void *)a3 + 7)];
  v13 = (char *)*((void *)a3 + 8);
  v12 = (char *)a3 + 64;
  v11 = v13;
  if (v12[23] >= 0) {
    v14 = v12;
  }
  else {
    v14 = v11;
  }
  v15 = [NSString stringWithUTF8String:v14];
  [(ULServiceMO *)v6 setUserId:v15];

  return v6;
}

- (optional<CLMiLoServiceTable::Entry>)convertToEntry
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(ULServiceMO *)self lastActiveTimestamp];
  double v6 = v5;
  v7 = [(ULServiceMO *)self serviceUUID];
  v8 = v7;
  if (v7)
  {
    [v7 boostUUID];
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v33 = 0;
  }

  if (v33)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    v9 = [(ULServiceMO *)self clientId];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      id v11 = [(ULServiceMO *)self clientId];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v11 UTF8String]);
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v23 = v25;
      BYTE7(v25) = 0;
      buf[0] = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v20, "");
    v12 = [(ULServiceMO *)self userId];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      id v14 = [(ULServiceMO *)self userId];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v14 UTF8String]);
      if (SHIBYTE(v21) < 0) {
        operator delete(v20[0]);
      }
      *(_OWORD *)v20 = *(_OWORD *)buf;
      uint64_t v21 = v25;
      BYTE7(v25) = 0;
      buf[0] = 0;
    }
    if (!v33) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    result = (optional<CLMiLoServiceTable::Entry> *)CLMiLoServiceTable::Entry::Entry(buf, v31, v32, [(ULServiceMO *)self serviceType], __p, [(ULServiceMO *)self locationTypes], v20, v6);
    long long v16 = v25;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)buf;
    *((_OWORD *)&retstr->var0.var2.var0.var0.var0.var1 + 1) = v16;
    *(_OWORD *)&retstr->var0.var2.var0.var1.var0[1] = v26;
    long long v26 = 0uLL;
    v17 = v27;
    unint64_t v18 = v28;
    v27 = 0;
    retstr[1].var0.var2.var0.var0.var0.var1.var0 = v17;
    retstr[1].var0.var2.var0.var0.var0.var1.var1 = v18;
    *((_OWORD *)&retstr[1].var0.var2.var0.var0.var0.var1 + 1) = v29;
    retstr[1].var0.var2.var0.var1.var0[1] = v30;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = 1;
    if (SHIBYTE(v21) < 0) {
      operator delete(v20[0]);
    }
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_55);
    }
    v19 = logObject_MicroLocation_Default;
    result = (optional<CLMiLoServiceTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_ERROR, "convertToEntry: service record's serviceUUID has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[2]) = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULServiceMO"];
}

@end