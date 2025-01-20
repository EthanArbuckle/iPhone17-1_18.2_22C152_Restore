@interface PROConcretePlugInGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlugInGroup:(id)a3;
- (PROConcretePlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5;
- (__CFUUID)uuid;
- (id)description;
- (id)displayName;
- (id)name;
- (id)plugIns;
- (id)plugInsForProtocols:(id)a3;
- (id)uuidString;
- (unint64_t)hash;
- (void)addPlugIn:(id)a3;
- (void)dealloc;
- (void)removePlugIn:(id)a3;
@end

@implementation PROConcretePlugInGroup

- (PROConcretePlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5
{
  if (a3 && a4 && a5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PROConcretePlugInGroup;
    v8 = [(PROConcretePlugInGroup *)&v14 init];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [(PROConcretePlugInGroup *)v8 zone];
      v9->uuidRef = (__CFUUID *)CFRetain(a3);
      uint64_t v11 = [a4 copy];
      v9->name = (NSString *)v11;
      v9->displayName = (NSString *)objc_msgSend((id)objc_msgSend(a5, "localizedStringForKey:value:table:", v11, 0, 0), "copy");
      v9->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v10), "init");
      v9->protocols = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v10), "init");
      v9->mutex = (NSLock *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E08], "allocWithZone:", v10), "init");
    }
  }
  else
  {
    v12 = self;
    return 0;
  }
  return v9;
}

- (void)dealloc
{
  uuidRef = self->uuidRef;
  if (uuidRef) {
    CFRelease(uuidRef);
  }

  [(NSLock *)self->mutex lock];
  v4.receiver = self;
  v4.super_class = (Class)PROConcretePlugInGroup;
  [(PROConcretePlugInGroup *)&v4 dealloc];
}

- (BOOL)isEqualToPlugInGroup:(id)a3
{
  uuidRef = self->uuidRef;
  return uuidRef == (__CFUUID *)[a3 uuid];
}

- (BOOL)isEqual:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    return [(PROConcretePlugInGroup *)self isEqualToPlugInGroup:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PROConcretePlugInGroup;
    return [(PROConcretePlugInGroup *)&v6 isEqual:a3];
  }
}

- (unint64_t)hash
{
  return (unint64_t)self->uuidRef >> 2;
}

- (void)addPlugIn:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "plugIn", NSStringFromSelector(a2) format];
  }
  [(NSLock *)self->mutex lock];
  objc_msgSend((id)-[PROConcretePlugInGroup mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns"), "addObject:", a3);
  v5 = objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      [(NSMutableDictionary *)self->protocols addObject:a3 toSetForKey:v7];
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
  mutex = self->mutex;

  [(NSLock *)mutex unlock];
}

- (void)removePlugIn:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "plugIn", NSStringFromSelector(a2) format];
  }
  v5 = objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  [(NSLock *)self->mutex lock];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      [(NSMutableDictionary *)self->protocols removeObject:a3 fromSetForKey:v7];
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
  objc_msgSend((id)-[PROConcretePlugInGroup mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns", v7), "removeObject:", a3);
  mutex = self->mutex;

  [(NSLock *)mutex unlock];
}

- (id)name
{
  return self->name;
}

- (id)displayName
{
  return self->displayName;
}

- (id)plugIns
{
  return self->plugIns;
}

- (__CFUUID)uuid
{
  return self->uuidRef;
}

- (id)uuidString
{
  v2 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->uuidRef);

  return v2;
}

- (id)description
{
  v3 = (__CFString *)CFUUIDCreateString(0, self->uuidRef);
  objc_super v4 = (void *)[NSString stringWithFormat:@"Group: %@\n\tUUID: %@\n\tPlugins: %@\n\tProtocols: %@", -[PROConcretePlugInGroup displayName](self, "displayName"), v3, self->plugIns, self->protocols];

  return v4;
}

- (id)plugInsForProtocols:(id)a3
{
  return [(NSMutableDictionary *)self->protocols objectsInAllSetsForKeys:a3];
}

@end