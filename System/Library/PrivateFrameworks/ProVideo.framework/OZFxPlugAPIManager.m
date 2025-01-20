@interface OZFxPlugAPIManager
- (OZFxPlugAPIManager)init;
- (id).cxx_construct;
- (id)apiForProtocol:(id)a3;
- (void)dealloc;
- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5;
- (void)unregisterAPIForProtocol:(id)a3;
@end

@implementation OZFxPlugAPIManager

- (OZFxPlugAPIManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugAPIManager;
  v2 = [(OZFxPlugAPIManager *)&v5 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
    v2->_apis = v3;
    if (!v3) {
  }
    }
  return v2;
}

- (void)dealloc
{
  self->_apis = 0;
  v3.receiver = self;
  v3.super_class = (Class)OZFxPlugAPIManager;
  [(OZFxPlugAPIManager *)&v3 dealloc];
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  v7 = (void *)[[NSString alloc] initWithUTF8String:protocol_getName((Protocol *)a4)];
  p_mutex = &self->_mutex;
  PCMutex::lock((PCMutex *)&self->_mutex);
  v8 = (void *)[(NSMutableDictionary *)self->_apis objectForKey:v7];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 objectForKey:@"RefCount"];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(v9, "objectForKey:", @"API Object"), @"API Object", v11, @"RefCount", 0, p_mutex), v7);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"API Object", objc_msgSend(NSNumber, "numberWithInt:", 1), @"RefCount", 0, p_mutex), v7);
  }

  PCMutex::unlock((PCMutex *)&self->_mutex);
}

- (void)unregisterAPIForProtocol:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v10 = (id)[[NSString alloc] initWithUTF8String:protocol_getName((Protocol *)a3)];
  PCMutex::lock((PCMutex *)&self->_mutex);
  v6 = (void *)[(NSMutableDictionary *)self->_apis objectForKey:v10];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 objectForKey:@"RefCount"];
    if ([v8 intValue] == 1)
    {
      [(NSMutableDictionary *)self->_apis removeObjectForKey:v10];
    }
    else
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue") - 1);
      -[NSMutableDictionary setObject:forKey:](self->_apis, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(v7, "objectForKey:", @"API Object"), @"API Object", v9, @"RefCount", 0), v10);
    }
  }
  PCMutex::unlock((PCMutex *)&self->_mutex);
}

- (id)apiForProtocol:(id)a3
{
  v4 = (void *)[[NSString alloc] initWithUTF8String:protocol_getName((Protocol *)a3)];
  p_mutex = (PCMutex *)&self->_mutex;
  PCMutex::lock((PCMutex *)&self->_mutex);
  LOBYTE(v8) = 1;
  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_apis, "objectForKey:", v4, &self->_mutex, v8), "objectForKey:", @"API Object");

  PCMutex::unlock(p_mutex);
  return v6;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_mutex._vptr$PCMutex = (void **)&unk_1F10933F0;
  return self;
}

@end