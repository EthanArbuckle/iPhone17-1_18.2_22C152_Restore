@interface ULMeasurementMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationMeasurementTable::Entry>)convertToEntry;
@end

@implementation ULMeasurementMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULMeasurementMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  v5 = [[ULMeasurementMO alloc] initWithContext:a4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v7 = [v6 UUIDString];
  [(ULMeasurementMO *)v5 setRecordingUUID:v7];

  [(ULMeasurementMO *)v5 setScanCFTimestamp:*((double *)a3 + 2)];
  [(ULMeasurementMO *)v5 setScanMCTimestamp:*((void *)a3 + 3)];
  [(ULMeasurementMO *)v5 setFlags:*((unsigned int *)a3 + 28)];
  CLMicroLocationProto::Measurement::ByteSize((CLMicroLocationProto::Measurement *)((char *)a3 + 32));
  operator new[]();
}

- (optional<CLMicroLocationMeasurementTable::Entry>)convertToEntry
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = [(ULMeasurementMO *)self recordingUUID];
  v5 = v4;
  if (v4)
  {
    [v4 boostUUID];
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    char v21 = 0;
  }

  if (v21)
  {
    [(ULMeasurementMO *)self scanCFTimestamp];
    double v7 = v6;
    uint64_t v8 = [(ULMeasurementMO *)self scanMCTimestamp];
    unsigned int v9 = [(ULMeasurementMO *)self flags];
    id v10 = [(ULMeasurementMO *)self data];
    uint64_t v11 = [v10 bytes];
    v12 = [(ULMeasurementMO *)self data];
    [v12 length];
    LOBYTE(v11) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v16, (const void *)v11);

    if (v11)
    {
      if (!v21) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CLMicroLocationMeasurementTable::Entry::Entry((uint64_t)buf, v19, v20, v8, (CLMicroLocationProto::Measurement *)v16, v9 | 0x100000000, v7);
      CLMicroLocationMeasurementTable::Entry::Entry(retstr, buf);
      *((unsigned char *)&retstr[1].var0.var4 + 40) = 1;
      CLMicroLocationProto::Measurement::~Measurement((CLMicroLocationProto::Measurement *)&v18);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_54);
      }
      v15 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize measurement protobuf from byte stream", buf, 2u);
      }
      retstr->var0.var0 = 0;
      *((unsigned char *)&retstr[1].var0.var4 + 40) = 0;
    }
    CLMicroLocationProto::Measurement::~Measurement((CLMicroLocationProto::Measurement *)v16);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_54);
    }
    v13 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationMeasurementTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_ERROR, "convertToEntry: measuremnt's recordingUUID has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    *((unsigned char *)&retstr[1].var0.var4 + 40) = 0;
  }
  return result;
}

@end