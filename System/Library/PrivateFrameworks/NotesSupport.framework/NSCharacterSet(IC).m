@interface NSCharacterSet(IC)
+ (id)ic_animatableTokenCharacterSet;
+ (id)ic_attachmentCharacterSet;
+ (id)ic_hashtagAllowedCharacterSet;
+ (id)ic_uriIdentifierAllowedCharacterSet;
+ (uint64_t)ic_emojiCharacterSet;
+ (uint64_t)ic_hashtagTokenizingCharacterSet;
+ (uint64_t)ic_illegalFilenameCharacterSet;
@end

@implementation NSCharacterSet(IC)

+ (id)ic_uriIdentifierAllowedCharacterSet
{
  if (ic_uriIdentifierAllowedCharacterSet_token != -1) {
    dispatch_once(&ic_uriIdentifierAllowedCharacterSet_token, &__block_literal_global_8_0);
  }
  v0 = (void *)ic_uriIdentifierAllowedCharacterSet_characterSet;
  return v0;
}

+ (uint64_t)ic_illegalFilenameCharacterSet
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/\\?%*|\"<>:"];
}

+ (id)ic_attachmentCharacterSet
{
  v0 = (void *)MEMORY[0x263F08708];
  v1 = objc_msgSend(NSString, "ic_attachmentCharacterString");
  v2 = [v0 characterSetWithCharactersInString:v1];

  return v2;
}

+ (uint64_t)ic_emojiCharacterSet
{
  return MEMORY[0x270F18C58]();
}

+ (id)ic_hashtagAllowedCharacterSet
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NSCharacterSet_IC__ic_hashtagAllowedCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ic_hashtagAllowedCharacterSet_token != -1) {
    dispatch_once(&ic_hashtagAllowedCharacterSet_token, block);
  }
  v1 = (void *)ic_hashtagAllowedCharacterSet_characterSet;
  return v1;
}

+ (uint64_t)ic_hashtagTokenizingCharacterSet
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@", "];
}

+ (id)ic_animatableTokenCharacterSet
{
  if (ic_animatableTokenCharacterSet_token != -1) {
    dispatch_once(&ic_animatableTokenCharacterSet_token, &__block_literal_global_23);
  }
  v0 = (void *)ic_animatableTokenCharacterSet_characterSet;
  return v0;
}

@end