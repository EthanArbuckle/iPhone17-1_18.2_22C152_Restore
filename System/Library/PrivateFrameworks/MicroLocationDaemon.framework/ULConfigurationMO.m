@interface ULConfigurationMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationConfigurationTable::Entry>)convertToEntry;
@end

@implementation ULConfigurationMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [[ULConfigurationMO alloc] initWithContext:a4];
  [(ULConfigurationMO *)v5 setGenerationTimestamp:*(double *)a3];
  if (*((char *)a3 + 31) >= 0) {
    v6 = (char *)a3 + 8;
  }
  else {
    v6 = (char *)*((void *)a3 + 1);
  }
  v7 = [NSString stringWithUTF8String:v6];
  [(ULConfigurationMO *)v5 setLoiType:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 32];
  v9 = [v8 UUIDString];
  [(ULConfigurationMO *)v5 setLoiId:v9];

  v10 = (CLMicroLocationProto::Configuration *)[(ULConfigurationMO *)v5 setConfigurationType:*((unsigned int *)a3 + 12)];
  if (*((_DWORD *)a3 + 12) == 2)
  {
    uint64_t v11 = *((void *)a3 + 11);
    if (!v11) {
      uint64_t v11 = *(void *)(CLMicroLocationProto::Configuration::default_instance(v10) + 32);
    }
    CLMicroLocationProtobufHelper::uuidFromProtobuf(*(uint64_t ***)(v11 + 16), buf);
    if (v19)
    {
      id v12 = objc_alloc(MEMORY[0x263F08C38]);
      if (!v19) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      v13 = (void *)[v12 initWithUUIDBytes:buf];
      v14 = [v13 UUIDString];
      [(ULConfigurationMO *)v5 setAnchorStatsModelUUID:v14];
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_39);
      }
      v15 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "createFromEntry: Failed to get modelUUID for anchor value statistics configuration", v17, 2u);
      }
    }
  }
  CLMicroLocationProto::Configuration::ByteSize((CLMicroLocationProto::Configuration *)((char *)a3 + 56));
  operator new[]();
}

- (optional<CLMicroLocationConfigurationTable::Entry>)convertToEntry
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v6 = [(ULConfigurationMO *)self loiType];

  if (v6)
  {
    id v7 = [(ULConfigurationMO *)self loiType];
    std::string::basic_string[abi:ne180100]<0>(&v18, (char *)[v7 UTF8String]);

    v8 = [(ULConfigurationMO *)self loiId];
    v9 = v8;
    if (v8)
    {
      [v8 boostUUID];
    }
    else
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      char v25 = 0;
    }

    if (!v25)
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      char v25 = 1;
    }
    id v12 = [(ULConfigurationMO *)self configuration];
    uint64_t v13 = [v12 bytes];
    v14 = [(ULConfigurationMO *)self configuration];
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
      if (!v25) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CLMicroLocationConfigurationTable::Entry::Entry(buf, &__p, v17, v23, v24);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::__optional_destruct_base<CLMicroLocationConfigurationTable::Entry,false>::__optional_destruct_base[abi:ne180100]<CLMicroLocationConfigurationTable::Entry>((uint64_t)retstr, (uint64_t)buf);
      CLMicroLocationProto::Configuration::~Configuration((CLMicroLocationProto::Configuration *)&v22);
      if (v21 < 0) {
        operator delete(v20);
      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_39);
      }
      v15 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize configuration protobuf from byte stream", buf, 2u);
      }
      retstr->var0.var0 = 0;
      retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
    }
    CLMicroLocationProto::Configuration::~Configuration((CLMicroLocationProto::Configuration *)v17);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_39);
    }
    v10 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationConfigurationTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "convertToEntry: configuration's loiType has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    retstr[2].var0.var2.var0.var0.var0.var0.var0[16] = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULConfigurationMO"];
}

@end