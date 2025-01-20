@interface SCRCThreadKey
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)threadDescription;
- (SCRCThreadKey)init;
- (SCRCThreadKey)initWithDescription:(id)a3;
- (SCRCThreadKey)initWithObject:(id)a3;
- (id)_allCurrentThreadIDs;
- (id)_initWithThreadID:(unint64_t)a3 description:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)threadID;
- (void)dealloc;
@end

@implementation SCRCThreadKey

+ (void)initialize
{
  id v2 = objc_alloc_init(MEMORY[0x263F08958]);
  v3 = (void *)_ThreadKeyLock;
  _ThreadKeyLock = (uint64_t)v2;

  _ThreadIDs = (uint64_t)CFArrayCreateMutable(0, 0, 0);
}

- (id)_initWithThreadID:(unint64_t)a3 description:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCRCThreadKey;
  v7 = [(SCRCThreadKey *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_threadID = a3;
    uint64_t v9 = [v6 copy];
    threadDescription = v8->_threadDescription;
    v8->_threadDescription = (NSString *)v9;

    [(id)_ThreadKeyLock lock];
    CFArrayAppendValue((CFMutableArrayRef)_ThreadIDs, (const void *)v8->_threadID);
    [(id)_ThreadKeyLock unlock];
  }

  return v8;
}

- (SCRCThreadKey)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCRCThreadKey;
  id v2 = [(SCRCThreadKey *)&v5 init];
  if (v2)
  {
    [(id)_ThreadKeyLock lock];
    int v3 = 100000;
    while (1)
    {
      v6.length = CFArrayGetCount((CFArrayRef)_ThreadIDs);
      ++_LastThreadID;
      v6.location = 0;
      if (!CFArrayContainsValue((CFArrayRef)_ThreadIDs, v6, (const void *)_LastThreadID)) {
        break;
      }
      if (!--v3) {
        goto LABEL_7;
      }
    }
    CFArrayAppendValue((CFMutableArrayRef)_ThreadIDs, (const void *)_LastThreadID);
    v2->_threadID = _LastThreadID;
LABEL_7:
    [(id)_ThreadKeyLock unlock];
  }
  return v2;
}

- (SCRCThreadKey)initWithDescription:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SCRCThreadKey *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    threadDescription = v5->_threadDescription;
    v5->_threadDescription = (NSString *)v6;
  }
  return v5;
}

- (SCRCThreadKey)initWithObject:(id)a3
{
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SCRCThreadKey *)self initWithDescription:v5];

  return v6;
}

- (id)_allCurrentThreadIDs
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v2 appendString:@"{"];
  [(id)_ThreadKeyLock lock];
  CFIndex Count = CFArrayGetCount((CFArrayRef)_ThreadIDs);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0; i != v4; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)_ThreadIDs, i);
      if (i) {
        [v2 appendString:@", "];
      }
      objc_msgSend(v2, "appendFormat:", @"%lu", ValueAtIndex);
    }
  }
  [(id)_ThreadKeyLock unlock];
  [v2 appendString:@"} "];
  return v2;
}

- (void)dealloc
{
  [(id)_ThreadKeyLock lock];
  v5.length = CFArrayGetCount((CFArrayRef)_ThreadIDs);
  v5.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue((CFArrayRef)_ThreadIDs, v5, (const void *)self->_threadID);
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)_ThreadIDs, FirstIndexOfValue);
  [(id)_ThreadKeyLock unlock];
  v4.receiver = self;
  v4.super_class = (Class)SCRCThreadKey;
  [(SCRCThreadKey *)&v4 dealloc];
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSString)threadDescription
{
  if (self->_threadDescription) {
    return self->_threadDescription;
  }
  else {
    return (NSString *)&stru_26CC25790;
  }
}

- (id)description
{
  int v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  CFRange v5 = NSStringFromClass(v4);
  unint64_t threadID = self->_threadID;
  v7 = [(SCRCThreadKey *)self threadDescription];
  v8 = [v3 stringWithFormat:@"<%@: %p> ThreadKeyID:%lu  Description:\"%@\"", v5, self, threadID, v7];

  return v8;
}

- (unint64_t)hash
{
  return self->_threadID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [v4 threadID], v5 == -[SCRCThreadKey threadID](self, "threadID")))
  {
    uint64_t v6 = [(SCRCThreadKey *)self threadDescription];
    uint64_t v7 = [v4 threadDescription];
    if (v6 | v7) {
      unsigned __int8 v8 = [(id)v6 isEqualToString:v7];
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCRCThreadKey;
    unsigned __int8 v8 = [(SCRCThreadKey *)&v10 isEqual:v4];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SCRCThreadKey alloc];
  unint64_t threadID = self->_threadID;
  threadDescription = self->_threadDescription;
  return [(SCRCThreadKey *)v4 _initWithThreadID:threadID description:threadDescription];
}

- (void).cxx_destruct
{
}

@end