@interface ULModelMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationModelTable::Entry>)convertToEntry;
@end

@implementation ULModelMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULModelMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  v5 = [[ULModelMO alloc] initWithContext:a4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v7 = [v6 UUIDString];
  [(ULModelMO *)v5 setModelUUID:v7];

  [(ULModelMO *)v5 setGenerationTimestamp:*((double *)a3 + 2)];
  [(ULModelMO *)v5 setModelType:*((unsigned int *)a3 + 6)];
  int v8 = *((unsigned __int8 *)a3 + 264);
  if (*((unsigned char *)a3 + 264))
  {
    if (*((char *)a3 + 263) >= 0) {
      v9 = (char *)a3 + 240;
    }
    else {
      v9 = (char *)*((void *)a3 + 30);
    }
    v10 = [NSString stringWithUTF8String:v9];
  }
  else
  {
    v10 = &stru_2704E2F50;
  }
  [(ULModelMO *)v5 setClientId:v10];
  if (v8) {

  }
  if (*((unsigned char *)a3 + 288))
  {
    id v11 = objc_alloc(MEMORY[0x263F08C38]);
    if (!*((unsigned char *)a3 + 288)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v12 = (void *)[v11 initWithUUIDBytes:(char *)a3 + 272];
    v13 = [v12 UUIDString];
    [(ULModelMO *)v5 setServiceUUID:v13];
  }
  else
  {
    v14 = [(ULModelMO *)v5 clientId];
    v12 = CLMicroLocationClientUtils::getNSServiceUUIDFromClientIdAndServiceUUID(v14, v15);

    if (v12)
    {
      v13 = [v12 UUIDString];
    }
    else
    {
      v13 = &stru_2704E2F50;
    }
    [(ULModelMO *)v5 setServiceUUID:v13];
    if (!v12)
    {
LABEL_17:

      v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 289];
      v17 = [v16 UUIDString];
      [(ULModelMO *)v5 setLoiId:v17];

      CLMicroLocationProto::Model::ByteSize((CLMicroLocationProto::Model *)((char *)a3 + 32));
      operator new[]();
    }
  }

  goto LABEL_17;
}

- (optional<CLMicroLocationModelTable::Entry>)convertToEntry
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v5 = [(ULModelMO *)self modelUUID];
  v6 = v5;
  if (v5)
  {
    [v5 boostUUID];
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    char v50 = 0;
  }

  if (v50)
  {
    v7 = [(ULModelMO *)self loiId];
    int v8 = v7;
    if (v7)
    {
      [v7 boostUUID];
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
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_125);
      }
      id v11 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_ERROR, "convertToEntry: model's loiId has no value", buf, 2u);
      }
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      if (!v47) {
        char v47 = 1;
      }
    }
    [(ULModelMO *)self generationTimestamp];
    double v13 = v12;
    LOBYTE(v32[0]) = 0;
    char v34 = 0;
    v14 = [(ULModelMO *)self clientId];
    BOOL v15 = [v14 length] == 0;

    if (!v15)
    {
      id v16 = [(ULModelMO *)self clientId];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v16 UTF8String]);
      *(_OWORD *)v32 = *(_OWORD *)buf;
      uint64_t v33 = v39;
      uint64_t v39 = 0;
      memset(buf, 0, sizeof(buf));
      char v34 = 1;
    }
    v17 = [(ULModelMO *)self serviceUUID];
    BOOL v18 = [v17 length] == 0;

    if (v18)
    {
      char v22 = 0;
      uint8_t v21 = 0;
    }
    else
    {
      v19 = [(ULModelMO *)self serviceUUID];
      v20 = v19;
      if (v19)
      {
        [v19 boostUUID];
        uint8_t v21 = buf[0];
        char v22 = v39;
      }
      else
      {
        char v22 = 0;
        uint8_t v21 = 0;
        memset(buf, 0, sizeof(buf));
        LOBYTE(v39) = 0;
      }
      v44[0] = *(void *)&buf[1];
      *(void *)((char *)v44 + 7) = *(void *)&buf[8];
    }
    id v23 = [(ULModelMO *)self model];
    uint64_t v24 = [v23 bytes];
    v25 = [(ULModelMO *)self model];
    [v25 length];
    LOBYTE(v24) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v31, (const void *)v24);

    if (v24)
    {
      if (!v50) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      uint64_t v26 = v48;
      uint64_t v27 = v49;
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)v32);
      uint8_t v35 = v21;
      *(void *)v36 = v44[0];
      *(void *)&v36[7] = *(void *)((char *)v44 + 7);
      char v37 = v22;
      if (!v47) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CLMicroLocationModelTable::Entry::Entry(buf, v26, v27, v31, &__p, &v35, v45, v46, v13);
      if (v30 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      CLMicroLocationModelTable::Entry::Entry(retstr, buf);
      *((unsigned char *)&retstr[1].var0.var4 + 96) = 1;
      if (v43 && v42 < 0) {
        operator delete(v41);
      }
      CLMicroLocationProto::Model::~Model((CLMicroLocationProto::Model *)&v40);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_125);
      }
      v28 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v28, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize model protobuf from byte stream", buf, 2u);
      }
      retstr->var0.var0 = 0;
      *((unsigned char *)&retstr[1].var0.var4 + 96) = 0;
    }
    CLMicroLocationProto::Model::~Model((CLMicroLocationProto::Model *)v31);
    if (v34)
    {
      if (SHIBYTE(v33) < 0) {
        operator delete(v32[0]);
      }
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_125);
    }
    v9 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationModelTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "convertToEntry: model's modelUUID has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    *((unsigned char *)&retstr[1].var0.var4 + 96) = 0;
  }
  return result;
}

@end