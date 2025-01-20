@interface UIPDFFreeTextAnnotation
- (BOOL)hasPopUp;
- (int)annotationType;
@end

@implementation UIPDFFreeTextAnnotation

- (BOOL)hasPopUp
{
  return 0;
}

- (int)annotationType
{
  return 7;
}

@end