@interface NSBundle
+ (id)internalExtrasBundle;
@end

@implementation NSBundle

+ (id)internalExtrasBundle
{
  if (qword_100B22E10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100B75BF0;

  return v2;
}

@end