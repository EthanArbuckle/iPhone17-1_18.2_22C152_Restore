@interface WBSMemoryFootprint
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (NSArray)zones;
- (WBSMemoryFootprint)init;
- (WBSMemoryFootprint)initWithCoder:(id)a3;
- (WBSMemoryFootprint)initWithError:(id *)a3;
- (WBSMemoryFootprintMallocZone)defaultMallocZone;
- (id)dictionaryRepresentation;
- (unint64_t)dirtySize;
- (unint64_t)residentSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSMemoryFootprint

+ (id)new
{
  return 0;
}

- (WBSMemoryFootprint)init
{
  return 0;
}

- (WBSMemoryFootprint)initWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WBSMemoryFootprint;
  id v3 = [(WBSMemoryFootprint *)&v10 init];
  if (v3)
  {
    mach_msg_type_number_t task_info_outCnt = 93;
    task_info(*MEMORY[0x1E4F14960], 0x16u, (task_info_t)v3 + 2, &task_info_outCnt);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    malloc_get_all_zones();
    uint64_t v5 = [v4 copy];
    v6 = (void *)*((void *)v3 + 48);
    *((void *)v3 + 48) = v5;

    id v7 = v3;
  }

  return (WBSMemoryFootprint *)v3;
}

- (WBSMemoryFootprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSMemoryFootprint;
  uint64_t v5 = [(WBSMemoryFootprint *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"zones"];
    zones = v5->_zones;
    v5->_zones = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vmInfo"];
    if ((unint64_t)[v11 length] >= 0x174) {
      memcpy(&v5->_vmInfo, (const void *)[v11 bytes], 0x174uLL);
    }
    v12 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  zones = self->_zones;
  id v5 = a3;
  [v5 encodeObject:zones forKey:@"zones"];
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_vmInfo length:372];
  [v5 encodeObject:v6 forKey:@"vmInfo"];
}

- (unint64_t)residentSize
{
  return self->_vmInfo.resident_size;
}

- (unint64_t)dirtySize
{
  return self->_vmInfo.internal;
}

- (WBSMemoryFootprintMallocZone)defaultMallocZone
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_zones;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "name", (void)v12);
        char v9 = [v8 isEqualToString:@"DefaultMallocZone"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (WBSMemoryFootprintMallocZone *)v10;
}

- (id)dictionaryRepresentation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"zones";
  uint64_t v3 = [(NSArray *)self->_zones safari_mapObjectsUsingBlock:&__block_literal_global_17];
  v15[0] = v3;
  v14[1] = @"vm_info";
  v12[0] = @"internal_size";
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_vmInfo.internal];
  v13[0] = v4;
  v12[1] = @"internal_size_peak";
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_vmInfo.internal_peak];
  v13[1] = v5;
  v12[2] = @"resident_size";
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_vmInfo.resident_size];
  v13[2] = v6;
  v12[3] = @"resident_size_peak";
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:self->_vmInfo.resident_size_peak];
  v13[3] = v7;
  v12[4] = @"virtual_size";
  v8 = [NSNumber numberWithUnsignedLongLong:self->_vmInfo.virtual_size];
  v13[4] = v8;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

uint64_t __46__WBSMemoryFootprint_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
}

@end