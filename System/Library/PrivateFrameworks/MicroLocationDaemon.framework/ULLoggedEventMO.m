@interface ULLoggedEventMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMicroLocationLoggedEventsTable::Entry>)convertToEntry;
@end

@implementation ULLoggedEventMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  v5 = [[ULLoggedEventMO alloc] initWithContext:a4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v7 = [v6 UUIDString];
  [(ULLoggedEventMO *)v5 setEventUUID:v7];

  [(ULLoggedEventMO *)v5 setReceivedTimestamp:*((double *)a3 + 2)];
  [(ULLoggedEventMO *)v5 setEventType:*((unsigned int *)a3 + 6)];
  CLMicroLocationProto::ReceivedEvent::ByteSize((CLMicroLocationProto::ReceivedEvent *)((char *)a3 + 32));
  operator new[]();
}

- (optional<CLMicroLocationLoggedEventsTable::Entry>)convertToEntry
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = [(ULLoggedEventMO *)self eventUUID];
  v5 = v4;
  if (v4)
  {
    [v4 boostUUID];
  }
  else
  {
    long long v18 = 0uLL;
    char v19 = 0;
  }

  if (v19)
  {
    [(ULLoggedEventMO *)self receivedTimestamp];
    double v7 = v6;
    int v8 = [(ULLoggedEventMO *)self eventType];
    id v9 = [(ULLoggedEventMO *)self event];
    uint64_t v10 = [v9 bytes];
    v11 = [(ULLoggedEventMO *)self event];
    [v11 length];
    LOBYTE(v10) = wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray((wireless_diagnostics::google::protobuf::MessageLite *)v15, (const void *)v10);

    if (v10)
    {
      if (!v19) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CLMicroLocationLoggedEventsTable::Entry::Entry((uint64_t)buf, &v18, v8, (CLMicroLocationProto::ReceivedEvent *)v15, v7);
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)buf;
      *(_OWORD *)((char *)&retstr->var0.var3.var1 + 4) = *(_OWORD *)&buf[12];
      CLMicroLocationProto::ReceivedEvent::ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)&retstr->var0.var3.var4, (const CLMicroLocationProto::ReceivedEvent *)v17);
      LOBYTE(retstr[1].var0.var3.var4) = 1;
      CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v17);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
      }
      v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_ERROR, "convertToEntry: Failed to deserialize loggedEvent protobuf from byte stream", buf, 2u);
      }
      retstr->var0.var0 = 0;
      LOBYTE(retstr[1].var0.var3.var4) = 0;
    }
    CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v15);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
    }
    v12 = logObject_MicroLocation_Default;
    result = (optional<CLMicroLocationLoggedEventsTable::Entry> *)os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_ERROR, "convertToEntry: loggedEvent's eventUUID has no value", buf, 2u);
    }
    retstr->var0.var0 = 0;
    LOBYTE(retstr[1].var0.var3.var4) = 0;
  }
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULLoggedEventMO"];
}

@end