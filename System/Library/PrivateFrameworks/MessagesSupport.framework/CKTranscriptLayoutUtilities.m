@interface CKTranscriptLayoutUtilities
+ (id)dynamicWidthLayoutGroupWithLayoutItem:(id)a3;
+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3;
+ (id)layoutSizeWithSize:(CGSize)a3;
@end

@implementation CKTranscriptLayoutUtilities

+ (id)layoutSizeWithSize:(CGSize)a3
{
  return +[CKTranscriptLayoutUtilitiesSwift layoutSizeWithSize:](CKTranscriptLayoutUtilitiesSwift, "layoutSizeWithSize:", a3.width, a3.height);
}

+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3
{
  return +[CKTranscriptLayoutUtilitiesSwift dynamicWidthLayoutSizeWithHeight:a3];
}

+ (id)dynamicWidthLayoutGroupWithLayoutItem:(id)a3
{
  return +[CKTranscriptLayoutUtilitiesSwift dynamicWidthLayoutGroupWithLayoutItem:a3];
}

@end