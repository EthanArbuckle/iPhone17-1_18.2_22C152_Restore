@interface NSString(SSLoggable)
- (id)shorterLoggableString;
@end

@implementation NSString(SSLoggable)

- (id)shorterLoggableString
{
  if ((unint64_t)[a1 length] < 6)
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 substringToIndex:5];
  }
  return v2;
}

@end