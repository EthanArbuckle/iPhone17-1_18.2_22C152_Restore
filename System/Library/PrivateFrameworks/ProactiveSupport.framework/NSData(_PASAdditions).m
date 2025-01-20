@interface NSData(_PASAdditions)
- (id)_pas_dataWithNonnullBytes;
@end

@implementation NSData(_PASAdditions)

- (id)_pas_dataWithNonnullBytes
{
  id v1 = a1;
  if (![v1 bytes] && !objc_msgSend(v1, "length")) {
    id v1 = &unk_1EC36FFC0;
  }

  return v1;
}

@end