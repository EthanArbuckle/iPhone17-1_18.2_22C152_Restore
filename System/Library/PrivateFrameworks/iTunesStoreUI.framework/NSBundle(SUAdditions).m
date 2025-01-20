@interface NSBundle(SUAdditions)
+ (uint64_t)pathForITunesResource:()SUAdditions ofType:;
- (uint64_t)newDataURLForResource:()SUAdditions ofType:withMIMEType:;
@end

@implementation NSBundle(SUAdditions)

- (uint64_t)newDataURLForResource:()SUAdditions ofType:withMIMEType:
{
  if (![a5 hasPrefix:@"image"]
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale"), v9 != 2.0)
    || (uint64_t v10 = objc_msgSend(a1, "pathForResource:ofType:", objc_msgSend(a3, "stringByAppendingString:", @"@2x"), a4)) == 0)
  {
    uint64_t v10 = [a1 pathForResource:a3 ofType:a4];
    if (!v10) {
      return 0;
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v10];
  if (!v11) {
    return 0;
  }
  v12 = v11;
  uint64_t v13 = [v11 base64EncodedStringWithOptions:0];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = objc_alloc(NSURL);
    uint64_t v16 = [v15 initWithString:objc_msgSend(NSString, "stringWithFormat:", @"data:%@;base64,%@", a5, v14)];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (uint64_t)pathForITunesResource:()SUAdditions ofType:
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "pathForResource:ofType:", a3, a4);
  if (!result)
  {
    v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    return [v7 pathForResource:a3 ofType:a4];
  }
  return result;
}

@end