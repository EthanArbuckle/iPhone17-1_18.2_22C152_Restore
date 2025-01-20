@interface ABSSyncObject
+ (int)sequenceNumber;
+ (void)oops;
- (BOOL)matches:(id)a3;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (id)createProtobufWithOptions:(id)a3;
- (int64_t)changeType;
- (void)setChangeType:(int64_t)a3;
@end

@implementation ABSSyncObject

- (id)createProtobufWithOptions:(id)a3
{
  return 0;
}

- (BOOL)matches:(id)a3
{
  return 0;
}

- (NSString)objectIdentifier
{
  return 0;
}

- (NSString)sequencer
{
  return 0;
}

+ (int)sequenceNumber
{
  os_unfair_lock_lock(&stru_100069D28);
  if (dword_1000699F0 == 0x80000000)
  {
    uint32_t v2 = arc4random();
    int v3 = v2 & 0x7FFFFFFF;
    unsigned int v4 = v2 | 0x80000000;
  }
  else
  {
    int v3 = (dword_1000699F0 + 1) & 0x7FFFFFFF;
    unsigned int v4 = v3;
  }
  dword_1000699F0 = v3;
  os_unfair_lock_unlock(&stru_100069D28);
  return v4;
}

+ (void)oops
{
  os_unfair_lock_lock(&stru_100069D28);
  dword_1000699F0 = (dword_1000699F0 - 1) & 0x7FFFFFFF;

  os_unfair_lock_unlock(&stru_100069D28);
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

@end