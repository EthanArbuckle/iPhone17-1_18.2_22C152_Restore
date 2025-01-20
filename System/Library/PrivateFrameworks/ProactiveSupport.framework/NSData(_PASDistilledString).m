@interface NSData(_PASDistilledString)
- (id)_pas_revivedString;
@end

@implementation NSData(_PASDistilledString)

- (id)_pas_revivedString
{
  v2 = (void *)MEMORY[0x1A62450A0]();
  v3 = [a1 base64EncodedStringWithOptions:0];

  return v3;
}

@end