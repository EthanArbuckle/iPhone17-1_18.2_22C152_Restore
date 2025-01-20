@interface NSMutableData(OCMutableDataAdditions)
- (uint64_t)appendLELong:()OCMutableDataAdditions;
- (uint64_t)appendLEShort:()OCMutableDataAdditions;
- (uint64_t)replaceBytesInRange:()OCMutableDataAdditions withLELong:;
- (void)appendString:()OCMutableDataAdditions encoding:;
@end

@implementation NSMutableData(OCMutableDataAdditions)

- (uint64_t)appendLELong:()OCMutableDataAdditions
{
  CsLeWriteUInt32(a3, &v5);
  return [a1 appendBytes:&v5 length:4];
}

- (uint64_t)replaceBytesInRange:()OCMutableDataAdditions withLELong:
{
  CsLeWriteUInt32(a5, &v9);
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", a3, a4, &v9, 4);
}

- (uint64_t)appendLEShort:()OCMutableDataAdditions
{
  CsLeWriteUInt16(a3, &v5);
  return [a1 appendBytes:&v5 length:2];
}

- (void)appendString:()OCMutableDataAdditions encoding:
{
  id v5 = [a3 dataUsingEncoding:a4 allowLossyConversion:1];
  objc_msgSend(a1, "appendData:");
}

@end