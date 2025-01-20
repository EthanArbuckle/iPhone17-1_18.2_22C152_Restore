@interface UIFontDescriptor(NewsFeed)
+ (id)ts_fontLegibilityWeightAttributeName;
+ (id)ts_fontSystemFontDesignTraitKey;
+ (id)ts_fontSystemFontGradeTraitKey;
@end

@implementation UIFontDescriptor(NewsFeed)

+ (id)ts_fontSystemFontGradeTraitKey
{
  return (id)*MEMORY[0x1E4FB09A0];
}

+ (id)ts_fontSystemFontDesignTraitKey
{
  return (id)*MEMORY[0x1E4FB0998];
}

+ (id)ts_fontLegibilityWeightAttributeName
{
  return (id)*MEMORY[0x1E4F24590];
}

@end