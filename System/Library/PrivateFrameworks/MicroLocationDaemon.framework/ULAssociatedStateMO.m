@interface ULAssociatedStateMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationAssociatedStateTable::Entry>)convertToEntry;
@end

@implementation ULAssociatedStateMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULAssociatedStateMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULAssociatedStateMO alloc] initWithContext:v5];
  if (*((char *)a3 + 23) >= 0) {
    v7 = a3;
  }
  else {
    v7 = *(const void **)a3;
  }
  v8 = [NSString stringWithUTF8String:v7];
  [(ULAssociatedStateMO *)v6 setLoiType:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 24];
  v10 = [v9 UUIDString];
  [(ULAssociatedStateMO *)v6 setLoiId:v10];

  [(ULAssociatedStateMO *)v6 setTimestamp:*((double *)a3 + 5)];
  [(ULAssociatedStateMO *)v6 setIsAssociated:*((unsigned __int8 *)a3 + 48)];
  v11 = NSString;
  CLMacAddress::str((uint64_t *)__p, (CLMacAddress *)a3 + 7);
  if (v16 >= 0) {
    v12 = __p;
  }
  else {
    v12 = (void **)__p[0];
  }
  v13 = [v11 stringWithUTF8String:v12];
  [(ULAssociatedStateMO *)v6 setMacAddress:v13];

  if (v16 < 0) {
    operator delete(__p[0]);
  }
  [(ULAssociatedStateMO *)v6 setBand:*((unsigned int *)a3 + 16)];
  [(ULAssociatedStateMO *)v6 setChannel:*((unsigned int *)a3 + 17)];

  return v6;
}

- (optional<CLMicroLocationAssociatedStateTable::Entry>)convertToEntry
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v7 = [(ULAssociatedStateMO *)self loiType];

  if (v7)
  {
    id v8 = [(ULAssociatedStateMO *)self loiType];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);

    v9 = [(ULAssociatedStateMO *)self loiId];
    v10 = v9;
    if (v9)
    {
      [v9 boostUUID];
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
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_31);
      }
      v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_ERROR, "convertToEntry: associatedState's LoiId has no value", buf, 2u);
      }
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      if (!v31) {
        char v31 = 1;
      }
    }
    [(ULAssociatedStateMO *)self timestamp];
    uint64_t v21 = v14;
    v15 = [(ULAssociatedStateMO *)self macAddress];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_31);
      }
      v19 = logObject_MicroLocation_Default;
      result = (optional<CLMicroLocationAssociatedStateTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_ERROR, "convertToEntry: associatedState's mac address has no value", buf, 2u);
      }
      retstr->var0.var0 = 0;
      retstr[2].var0.var1.var0.var0[8] = 0;
    }
    else
    {
      id v17 = [(ULAssociatedStateMO *)self macAddress];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v17 UTF8String]);
      uint64_t v20 = CLMacAddress::newFromStr((char *)buf);
      if (SHIBYTE(v25) < 0) {
        operator delete(*(void **)buf);
      }

      uint64_t v18 = [(ULAssociatedStateMO *)self band];
      if (!v31) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      result = (optional<CLMicroLocationAssociatedStateTable::Entry> *)CLMicroLocationAssociatedStateTable::Entry::Entry(buf, __p, &v29, &v21, [(ULAssociatedStateMO *)self isAssociated], &v20, v18, [(ULAssociatedStateMO *)self channel]);
      retstr->var0 = *($74F8CD3D603D8EDDACC82D378F791B4C *)buf;
      *(void *)retstr->var1.var0 = v25;
      *(uuid *)((char *)&retstr->var1 + 8) = v26;
      *($74F8CD3D603D8EDDACC82D378F791B4C *)((char *)&retstr[1].var0 + 8) = v27;
      *(uuid *)((char *)&retstr[1].var1 + 8) = v28;
      retstr[2].var0.var1.var0.var0[8] = 1;
    }
    if (v23 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_31);
    }
    v11 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationAssociatedStateTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_ERROR, "convertToEntry: associatedState's LOI Type has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    retstr[2].var0.var1.var0.var0[8] = 0;
  }
  return result;
}

@end