@interface NSAttributedString(_UIAnimatedTextSpacer_Factory)
+ (__CFString)_animatedTextSpacerAttributeKey;
+ (id)attributedStringWithAnimatedTextSpacer:()_UIAnimatedTextSpacer_Factory attributes:;
@end

@implementation NSAttributedString(_UIAnimatedTextSpacer_Factory)

+ (__CFString)_animatedTextSpacerAttributeKey
{
  return @"_UIAnimatedTextSpacer";
}

+ (id)attributedStringWithAnimatedTextSpacer:()_UIAnimatedTextSpacer_Factory attributes:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _animatedTextSpacerAttributeKey];
  v14 = v8;
  v15[0] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  if ([v7 count])
  {
    id v10 = (id)[v7 mutableCopy];
    v11 = [a1 _animatedTextSpacerAttributeKey];
    [v10 setObject:v6 forKeyedSubscript:v11];
  }
  else
  {
    id v10 = v9;
  }

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\uFFFC\n" attributes:v10];
  return v12;
}

@end