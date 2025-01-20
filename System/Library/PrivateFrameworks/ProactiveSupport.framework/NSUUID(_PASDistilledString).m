@interface NSUUID(_PASDistilledString)
- (id)_pas_revivedString;
@end

@implementation NSUUID(_PASDistilledString)

- (id)_pas_revivedString
{
  v2 = (void *)MEMORY[0x1A62450A0]();
  v3 = [a1 UUIDString];

  return v3;
}

@end