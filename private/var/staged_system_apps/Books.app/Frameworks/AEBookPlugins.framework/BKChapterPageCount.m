@interface BKChapterPageCount
+ (id)newEmptyChapterPageNumber:(id)a3;
- (NSString)name;
@end

@implementation BKChapterPageCount

+ (id)newEmptyChapterPageNumber:(id)a3
{
  id v3 = a3;
  id v4 = [v3 newByClass:objc_opt_class()];

  return v4;
}

- (NSString)name
{
  v2 = [(BKChapterPageCount *)self primitiveValueForKey:@"name"];
  id v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return (NSString *)v4;
}

@end