@interface PlaceCardDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation PlaceCardDebugController

+ (id)navigationDestinationTitle
{
  return @"Place Card";
}

- (void)prepareContent
{
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_10131C6B0];
  if (MapsFeature_IsEnabled_PlaceCardShowcase()) {
    id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Place Enrichment" content:&stru_10131C810];
  }
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Override" content:&stru_10131C830];
}

@end