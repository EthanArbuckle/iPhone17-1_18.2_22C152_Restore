@interface NSString(NSAttributedString_PhotosUICore)
- (id)px_stringConvertedToHTMLString;
@end

@implementation NSString(NSAttributedString_PhotosUICore)

- (id)px_stringConvertedToHTMLString
{
  return +[PXAttributedStringHTMLParser stringByConvertingToHTML:a1];
}

@end