@interface THEmptyNoteCardInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxBackDescription;
- (NSString)thaxBackHint;
- (NSString)thaxFrontDescription;
- (NSString)thaxFrontHint;
@end

@implementation THEmptyNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THEmptyNoteCardInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxFrontDescription
{
  return 0;
}

- (NSString)thaxFrontHint
{
  return 0;
}

- (NSString)thaxBackDescription
{
  return 0;
}

- (NSString)thaxBackHint
{
  return 0;
}

@end