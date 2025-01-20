@interface NSCharacterSet
+ (id)pauseCharacterSet;
+ (id)starAndOctothorpeCharacterSet;
@end

@implementation NSCharacterSet

+ (id)pauseCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:@";,"];
}

+ (id)starAndOctothorpeCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:@"*#"];
}

@end