@interface ULBluetoothIdentityMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationBluetoothIdentityTable::Entry>)convertToEntry;
@end

@implementation ULBluetoothIdentityMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULBluetoothIdentityMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULBluetoothIdentityMO alloc] initWithContext:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v8 = [v7 UUIDString];
  [(ULBluetoothIdentityMO *)v6 setBluetoothId:v8];

  if (*((char *)a3 + 39) >= 0) {
    v9 = (char *)a3 + 16;
  }
  else {
    v9 = (char *)*((void *)a3 + 2);
  }
  v10 = [NSString stringWithUTF8String:v9];
  [(ULBluetoothIdentityMO *)v6 setDeviceName:v10];

  if (*((char *)a3 + 63) >= 0) {
    v11 = (char *)a3 + 40;
  }
  else {
    v11 = (char *)*((void *)a3 + 5);
  }
  v12 = [NSString stringWithUTF8String:v11];
  [(ULBluetoothIdentityMO *)v6 setStableIdentifier:v12];

  [(ULBluetoothIdentityMO *)v6 setLastSeenTimeStamp:*((double *)a3 + 8)];
  return v6;
}

- (optional<CLMicroLocationBluetoothIdentityTable::Entry>)convertToEntry
{
  v2 = v1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v4 = [v1 bluetoothId];
  id v5 = v4;
  if (v4)
  {
    [v4 boostUUID];
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v33 = 0;
  }

  if (!v33)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v33 = 1;
  }
  v6 = [v2 deviceName];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_100);
    }
    v15 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationBluetoothIdentityTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "convertToEntry: bluetoothIdentity's deviceName has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    retstr[1].var0.var1.var0.var0[8] = 0;
  }
  else
  {
    id v8 = [v2 deviceName];
    std::string::basic_string[abi:ne180100]<0>(&v24, (char *)[v8 UTF8String]);

    v9 = [v2 stableIdentifier];
    LODWORD(v8) = v9 == 0;

    if (v8)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_100);
      }
      v17 = logObject_MicroLocation_Default;
      result = (optional<CLMicroLocationBluetoothIdentityTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v17, OS_LOG_TYPE_ERROR, "convertToEntry: bluetoothIdentity's stableIdentifier has no value", buf, 2u);
      }
      retstr->var0.var0 = 0;
      retstr[1].var0.var1.var0.var0[8] = 0;
    }
    else
    {
      id v10 = [v2 stableIdentifier];
      std::string::basic_string[abi:ne180100]<0>(&v23, (char *)[v10 UTF8String]);

      [v2 lastSeenTimeStamp];
      if (!v33) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      double v12 = v11;
      uint64_t v13 = v31;
      uint64_t v14 = v32;
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v22, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
      }
      else {
        std::string v22 = v24;
      }
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v23;
      }
      result = (optional<CLMicroLocationBluetoothIdentityTable::Entry> *)CLMicroLocationBluetoothIdentityTable::Entry::Entry(buf, v13, v14, &v22, &__p, v12);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      long long v18 = v26;
      retstr->var0 = *($74F8CD3D603D8EDDACC82D378F791B4C *)buf;
      *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = v18;
      *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = v27;
      long long v26 = 0uLL;
      *(_OWORD *)retstr->var1.var0.var1.var0 = v28;
      uint64_t v27 = 0;
      long long v28 = 0uLL;
      unint64_t v19 = v29;
      uint64_t v20 = v30;
      unint64_t v29 = 0;
      retstr->var1.var0.var1.var0[2] = v19;
      *(void *)&retstr[1].var0.var0 = v20;
      retstr[1].var0.var1.var0.var0[8] = 1;
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
  return result;
}

@end