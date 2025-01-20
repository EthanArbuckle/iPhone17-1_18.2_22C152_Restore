@interface UGCFontManager
+ (id)poiEnrichmentHeaderViewSecondaryTitleFont;
+ (id)poiEnrichmentHeaderViewTitleFont;
+ (id)poiEnrichmentSectionHeaderTitleFont;
+ (id)ratingCategoryLabelFont;
+ (id)ratingGlyphButtonFont;
+ (id)userInfoPrimaryLabelFont;
+ (id)userInfoPrimaryLabelFontCommunityID;
+ (id)userInfoSecondaryLabelFont;
@end

@implementation UGCFontManager

+ (id)ratingCategoryLabelFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightMedium];
}

+ (id)ratingGlyphButtonFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightSemibold];
}

+ (id)poiEnrichmentHeaderViewTitleFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
}

+ (id)poiEnrichmentHeaderViewSecondaryTitleFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

+ (id)poiEnrichmentSectionHeaderTitleFont
{
  return +[UIFont system20Bold];
}

+ (id)userInfoPrimaryLabelFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

+ (id)userInfoSecondaryLabelFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

+ (id)userInfoPrimaryLabelFontCommunityID
{
  return +[UIFont _maps_boldSystemFontWithSize:13.0];
}

@end