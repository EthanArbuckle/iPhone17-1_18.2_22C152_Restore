@interface NSData
- (NSData)bzip2CompressedData;
- (NSData)bzip2UncompressedData;
@end

@implementation NSData

- (NSData)bzip2CompressedData
{
  v2 = self;
  [(NSData *)v2 bytes];
  [(NSData *)v2 length];
  if (GEOBZ2Compress())
  {
    v3 = +[NSData dataWithBytesNoCopy:0 length:0 freeWhenDone:1];
  }
  else
  {
    free(0);
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSData)bzip2UncompressedData
{
  v2 = self;
  [(NSData *)v2 bytes];
  [(NSData *)v2 length];
  int v3 = GEOBZ2Uncompress();
  v4 = 0;
  if (v3)
  {
    v4 = +[NSData dataWithBytesNoCopy:0 length:0 freeWhenDone:1];
  }

  return (NSData *)v4;
}

@end