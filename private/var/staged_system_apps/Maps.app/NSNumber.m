@interface NSNumber
+ (BOOL)number:(id)a3 isEqualToNumber:(id)a4;
@end

@implementation NSNumber

+ (BOOL)number:(id)a3 isEqualToNumber:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [(id)v5 isEqualToNumber:v6];
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

@end