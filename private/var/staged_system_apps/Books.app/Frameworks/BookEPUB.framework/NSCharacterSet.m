@interface NSCharacterSet
+ (id)be_allowedURLPathCharacterSet;
@end

@implementation NSCharacterSet

+ (id)be_allowedURLPathCharacterSet
{
  if (qword_409BB8 != -1) {
    dispatch_once(&qword_409BB8, &stru_3C0D38);
  }
  v2 = (void *)qword_409BB0;

  return v2;
}

@end