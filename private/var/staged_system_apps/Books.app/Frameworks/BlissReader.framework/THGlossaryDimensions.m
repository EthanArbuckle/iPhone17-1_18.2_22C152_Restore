@interface THGlossaryDimensions
+ (id)definitionBackgroundColor;
+ (id)definitionScrollViewBackgroundColor;
+ (id)definitionsViewBackgroundColor;
@end

@implementation THGlossaryDimensions

+ (id)definitionBackgroundColor
{
  return +[TSUColor whiteColor];
}

+ (id)definitionScrollViewBackgroundColor
{
  return +[TSUColor clearColor];
}

+ (id)definitionsViewBackgroundColor
{
  return +[TSUColor colorWithWhite:0.976470588 alpha:1.0];
}

@end