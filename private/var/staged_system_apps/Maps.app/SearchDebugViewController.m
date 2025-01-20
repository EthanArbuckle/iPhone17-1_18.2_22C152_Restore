@interface SearchDebugViewController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation SearchDebugViewController

+ (id)navigationDestinationTitle
{
  return @"Search Completions";
}

- (void)prepareContent
{
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Address Book" content:&stru_101300490];
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Recents" content:&stru_1013004B0];
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"History & Bookmarks" content:&stru_1013004D0];
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Search Requests" content:&stru_1013004F0];
  id v7 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_101300510];
}

@end