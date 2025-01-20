@interface TSWPStorageStyleProvider
+ (id)styleProviderForStorage:(id)a3;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
@end

@implementation TSWPStorageStyleProvider

+ (id)styleProviderForStorage:(id)a3
{
  return a3;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPStorageStyleProvider paragraphStyleAtParIndex:effectiveRange:]"];
  [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorageStyleProvider.mm"), 26, @"Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation." file lineNumber description];
  return 0;
}

@end