@interface NRSecureDevicePropertyStore
+ (BOOL)supportsSecureCoding;
+ (id)classTypes;
+ (id)enclosedClassTypes;
- (BOOL)dirty;
- (NRSecureDevicePropertyStore)init;
- (NRSecureDevicePropertyStore)initWithCoder:(id)a3;
- (id)allSecurePropertyIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)securePropertyForID:(id)a3;
- (id)storeSecureProperty:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)forceImportSecureProperties:(id)a3;
- (void)forceWriteSecurePropertyID:(id)a3 withValue:(id)a4;
- (void)removeSecureProperty:(id)a3;
@end

@implementation NRSecureDevicePropertyStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyQueue, 0);
  objc_storeStrong((id *)&self->_propertyToID, 0);

  objc_storeStrong((id *)&self->_IDToProperty, 0);
}

- (NRSecureDevicePropertyStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyStore;
  v2 = [(NRSecureDevicePropertyStore *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    IDToProperty = v2->_IDToProperty;
    v2->_IDToProperty = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    propertyToID = v2->_propertyToID;
    v2->_propertyToID = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nanoregistry.nrsecuredevicepropertystore.dirtyqueue", 0);
    dirtyQueue = v2->_dirtyQueue;
    v2->_dirtyQueue = (OS_dispatch_queue *)v7;

    v2->_dirty = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[NRSecureDevicePropertyStore allocWithZone:](NRSecureDevicePropertyStore, "allocWithZone:") init];
  uint64_t v6 = [(NSMutableDictionary *)self->_IDToProperty mutableCopyWithZone:a3];
  IDToProperty = v5->_IDToProperty;
  v5->_IDToProperty = (NSMutableDictionary *)v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_propertyToID mutableCopyWithZone:a3];
  propertyToID = v5->_propertyToID;
  v5->_propertyToID = (NSMutableDictionary *)v8;

  v5->_dirty = 1;
  return v5;
}

+ (id)enclosedClassTypes
{
  v2 = +[NRMutableDeviceProperty enclosedClassTypes];
  uint64_t v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)storeSecureProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_propertyToID objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = objc_opt_new();
    [(NSMutableDictionary *)self->_IDToProperty setObject:v4 forKeyedSubscript:v5];
    [(NSMutableDictionary *)self->_propertyToID setObject:v5 forKeyedSubscript:v4];
    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NRSecureDevicePropertyStore_storeSecureProperty___block_invoke;
    block[3] = &unk_1E5B00230;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }

  return v5;
}

uint64_t __51__NRSecureDevicePropertyStore_storeSecureProperty___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

- (void)removeSecureProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_IDToProperty objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_IDToProperty removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_propertyToID removeObjectForKey:v5];
    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__NRSecureDevicePropertyStore_removeSecureProperty___block_invoke;
    block[3] = &unk_1E5B00230;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }
}

uint64_t __52__NRSecureDevicePropertyStore_removeSecureProperty___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

- (id)securePropertyForID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_IDToProperty objectForKeyedSubscript:a3];
}

- (id)allSecurePropertyIDs
{
  return (id)[(NSMutableDictionary *)self->_IDToProperty allKeys];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_IDToProperty count];
}

- (void)forceWriteSecurePropertyID:(id)a3 withValue:(id)a4
{
  [(NSMutableDictionary *)self->_IDToProperty setObject:a4 forKeyedSubscript:a3];
  dirtyQueue = self->_dirtyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NRSecureDevicePropertyStore_forceWriteSecurePropertyID_withValue___block_invoke;
  block[3] = &unk_1E5B00230;
  block[4] = self;
  dispatch_async(dirtyQueue, block);
}

uint64_t __68__NRSecureDevicePropertyStore_forceWriteSecurePropertyID_withValue___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

- (void)forceImportSecureProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [v5 objectForKeyedSubscript:v10];
          [(NSMutableDictionary *)self->_IDToProperty setObject:v11 forKeyedSubscript:v10];
          [(NSMutableDictionary *)self->_propertyToID setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NRSecureDevicePropertyStore_forceImportSecureProperties___block_invoke;
    block[3] = &unk_1E5B00230;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }
}

uint64_t __59__NRSecureDevicePropertyStore_forceImportSecureProperties___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

- (BOOL)dirty
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dirtyQueue = self->_dirtyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NRSecureDevicePropertyStore_dirty__block_invoke;
  v5[3] = &unk_1E5B00C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dirtyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__NRSecureDevicePropertyStore_dirty__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSecureDevicePropertyStore)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NRSecureDevicePropertyStore *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    char v9 = +[NRMutableDeviceProperty enclosedClassTypes];
    uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"properties"];
    IDToProperty = v5->_IDToProperty;
    v5->_IDToProperty = (NSMutableDictionary *)v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_IDToProperty name:@"NRSecureDevicePropertyStore property dictionary" owner:v5];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v13 = v5->_IDToProperty;
    uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_IDToProperty, "objectForKeyedSubscript:", v18, (void)v21);
          [(NSMutableDictionary *)v5->_propertyToID setObject:v18 forKeyedSubscript:v19];
        }
        uint64_t v15 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_IDToProperty forKey:@"properties"];
  dirtyQueue = self->_dirtyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NRSecureDevicePropertyStore_encodeWithCoder___block_invoke;
  block[3] = &unk_1E5B00230;
  block[4] = self;
  dispatch_async(dirtyQueue, block);
}

uint64_t __47__NRSecureDevicePropertyStore_encodeWithCoder___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

+ (id)classTypes
{
  v2 = [a1 enclosedClassTypes];
  char v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  if (self->_dirty) {
    uint64_t v7 = @"dirty";
  }
  else {
    uint64_t v7 = @"clean";
  }
  uint64_t v8 = [v3 stringWithFormat:@"%@: is %@\n", v5, v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v9 = self->_IDToProperty;
  uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v8;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        uint64_t v16 = [(NSMutableDictionary *)self->_IDToProperty objectForKeyedSubscript:v15];
        long long v17 = [NSString stringWithFormat:@"\t\t%@ = %@\n", v15, v16, (void)v19];
        uint64_t v8 = [v14 stringByAppendingString:v17];

        ++v13;
        uint64_t v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_IDToProperty copy];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

@end