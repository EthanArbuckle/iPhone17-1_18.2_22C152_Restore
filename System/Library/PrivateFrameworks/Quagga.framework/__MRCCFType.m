@interface __MRCCFType
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (__MRCCFType)retain;
- (id)description;
- (unint64_t)hash;
@end

@implementation __MRCCFType

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)description
{
  CFStringRef v2 = CFCopyDescription(self);
  v3 = (void *)CFMakeCollectable(v2);
  return v3;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating() != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain() != 0;
}

- (__MRCCFType)retain
{
  return (__MRCCFType *)MEMORY[0x1F40D8EC0](self, a2);
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

@end