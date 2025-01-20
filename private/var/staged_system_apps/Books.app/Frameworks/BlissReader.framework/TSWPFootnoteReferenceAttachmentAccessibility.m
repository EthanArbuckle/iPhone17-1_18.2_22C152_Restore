@interface TSWPFootnoteReferenceAttachmentAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (unint64_t)tsaxFootnoteIndex;
- (void)tsaxSetFootnoteIndex:(unint64_t)a3;
@end

@implementation TSWPFootnoteReferenceAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPFootnoteReferenceAttachment";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)tsaxFootnoteIndex
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_5739F3);
}

- (void)tsaxSetFootnoteIndex:(unint64_t)a3
{
}

@end