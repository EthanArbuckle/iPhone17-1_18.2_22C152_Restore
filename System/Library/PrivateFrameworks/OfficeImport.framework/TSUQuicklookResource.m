@interface TSUQuicklookResource
+ (id)imagePathForQuicklookResource:(id)a3;
@end

@implementation TSUQuicklookResource

+ (id)imagePathForQuicklookResource:(id)a3
{
  v4 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.iwork.iWorkImport"];
  id result = (id)[v4 pathForResource:a3 ofType:@"png"];
  if (!result)
  {
    id result = (id)objc_msgSend(v4, "pathForResource:ofType:", objc_msgSend(a3, "stringByAppendingString:", @"@2x"), @"png");
    if (!result)
    {
      uint64_t v6 = [a3 stringByAppendingString:@"@3x"];
      return (id)[v4 pathForResource:v6 ofType:@"png"];
    }
  }
  return result;
}

@end