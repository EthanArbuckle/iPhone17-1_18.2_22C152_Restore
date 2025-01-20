@interface ULCustomLoiMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMiLoCustomLoiTable::Entry>)convertToEntry;
@end

@implementation ULCustomLoiMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULCustomLoiMO"];
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULCustomLoiMO alloc] initWithContext:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  v8 = [v7 UUIDString];
  [(ULCustomLoiMO *)v6 setServiceId:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:(char *)a3 + 16];
  v10 = [v9 UUIDString];
  [(ULCustomLoiMO *)v6 setLoiId:v10];

  [(ULCustomLoiMO *)v6 setLastSeenTimeStamp:*((double *)a3 + 4)];
  return v6;
}

- (optional<CLMiLoCustomLoiTable::Entry>)convertToEntry
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(ULCustomLoiMO *)self lastSeenTimeStamp];
  double v5 = v4;
  v6 = [(ULCustomLoiMO *)self loiId];
  v7 = v6;
  if (v6)
  {
    [v6 boostUUID];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    char v20 = 0;
  }

  if (!v20)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_51);
    }
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_ERROR, "convertToEntry: CustomLOI record's LoiId has no value", (uint8_t *)v13, 2u);
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    if (!v20) {
      char v20 = 1;
    }
  }
  v9 = [(ULCustomLoiMO *)self serviceId];
  v10 = v9;
  if (v9)
  {
    [v9 boostUUID];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
  }

  if (!v17)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 1;
  }
  if (!v20) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  result = (optional<CLMiLoCustomLoiTable::Entry> *)CLMiLoCustomLoiTable::Entry::Entry((uint64_t)v13, v15, v16, v18, v19, v5);
  optional<CLMiLoCustomLoiTable::Entry> v12 = (optional<CLMiLoCustomLoiTable::Entry>)v13[1];
  *retstr = (optional<CLMiLoCustomLoiTable::Entry>)v13[0];
  retstr[1] = v12;
  *(void *)&retstr[2].var0.var0 = v14;
  retstr[2].var0.var1.var0.var0[8] = 1;
  return result;
}

@end