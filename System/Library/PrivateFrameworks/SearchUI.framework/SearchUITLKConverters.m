@interface SearchUITLKConverters
+ (int64_t)colorForSFColor:(int)a3;
@end

@implementation SearchUITLKConverters

+ (int64_t)colorForSFColor:(int)a3
{
  if ((a3 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1E46B65B8[a3 - 1];
  }
}

@end