@interface NSObject(PhotoLibraryServices)
- (uint64_t)_pl_prettyDescription;
@end

@implementation NSObject(PhotoLibraryServices)

- (uint64_t)_pl_prettyDescription
{
  return objc_msgSend(a1, "_pl_prettyDescriptionWithIndent:", 0);
}

@end