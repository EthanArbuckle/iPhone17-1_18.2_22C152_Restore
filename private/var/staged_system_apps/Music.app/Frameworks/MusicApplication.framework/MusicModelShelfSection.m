@interface MusicModelShelfSection
+ (id)__featured_KEY;
+ (id)__hasHeadlineText_KEY;
+ (id)__hasSubtitleText_KEY;
+ (id)__heightClass_KEY;
+ (id)__rankedList_KEY;
+ (id)__title_KEY;
+ (id)__uniformCellType_KEY;
@end

@implementation MusicModelShelfSection

+ (id)__title_KEY
{
  return @"MusicModelPropertyShelfSectionTitle";
}

+ (id)__featured_KEY
{
  return @"MusicModelPropertyShelfSectionFeatured";
}

+ (id)__rankedList_KEY
{
  return @"MusicModelPropertyShelfSectionRankedList";
}

+ (id)__hasHeadlineText_KEY
{
  return @"MusicModelPropertyShelfSectionHasHeadlineText";
}

+ (id)__hasSubtitleText_KEY
{
  return @"MusicModelPropertyShelfSectionHasSubtitleText";
}

+ (id)__heightClass_KEY
{
  return @"MusicModelPropertyShelfSectionHeightClass";
}

+ (id)__uniformCellType_KEY
{
  return @"MusicModelPropertyShelfSectionUniformCellType";
}

@end