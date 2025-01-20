@interface PKPassImageSet
+ (Class)classForImageSetType:(int64_t)a3;
@end

@implementation PKPassImageSet

+ (Class)classForImageSetType:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

@end