@interface ULRapportMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationRapportTable::Entry>)convertToEntry;
@end

@implementation ULRapportMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  v5 = [[ULRapportMO alloc] initWithContext:a4];
  [(ULRapportMO *)v5 setGenerationTimestamp:*(double *)a3];
  if (*((char *)a3 + 31) >= 0) {
    v6 = (char *)a3 + 8;
  }
  else {
    v6 = (char *)*((void *)a3 + 1);
  }
  v7 = [NSString stringWithUTF8String:v6];
  [(ULRapportMO *)v5 setLoiType:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 64];
  v9 = [v8 UUIDString];
  [(ULRapportMO *)v5 setLoiId:v9];

  CLMicroLocationProto::RapportDevice::ByteSize((CLMicroLocationProto::RapportDevice *)((char *)a3 + 32));
  operator new[]();
}

- (optional<CLMicroLocationRapportTable::Entry>)convertToEntry
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(ULRapportMO *)self generationTimestamp];
  uint64_t v19 = v5;
  v6 = [(ULRapportMO *)self loiType];

  if (v6)
  {
    id v7 = [(ULRapportMO *)self loiType];
    std::string::basic_string[abi:ne180100]<0>(&v18, (char *)[v7 UTF8String]);

    v8 = [(ULRapportMO *)self loiId];
    v9 = v8;
    if (v8)
    {
      [v8 boostUUID];
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      char v26 = 0;
    }

    if (!v26)
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      char v26 = 1;
    }
    CLMicroLocationProto::RapportDevice::RapportDevice(v17);
    id v12 = [(ULRapportMO *)self device];
    uint64_t v13 = [v12 bytes];
    v14 = [(ULRapportMO *)self device];
    [v14 length];
    LOBYTE(v13) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v17, (const void *)v13);

    if (v13)
    {
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v18;
      }
      if (!v26) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CLMicroLocationRapportTable::Entry::Entry(buf, &__p, v17, &v24, &v19);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::__optional_destruct_base<CLMicroLocationRapportTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationRapportTable::Entry>((uint64_t)retstr, (uint64_t)buf);
      CLMicroLocationProto::RapportDevice::~RapportDevice((CLMicroLocationProto::RapportDevice *)&v23);
      if (v22 < 0) {
        operator delete(v21);
      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_23);
      }
      v15 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize rapport device protobuf from byte stream", buf, 2u);
      }
      retstr->var0.var0 = 0;
      LOBYTE(retstr[1].var0.var2.var0.var1.var0[1]) = 0;
    }
    CLMicroLocationProto::RapportDevice::~RapportDevice((CLMicroLocationProto::RapportDevice *)v17);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_23);
    }
    v10 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationRapportTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "convertToEntry: rapport's loiType has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var2.var0.var1.var0[1]) = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULRapportMO"];
}

@end