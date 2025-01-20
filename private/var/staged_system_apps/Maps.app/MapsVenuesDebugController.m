@interface MapsVenuesDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MapsVenuesDebugController

+ (id)navigationDestinationTitle
{
  return @"Venues";
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsVenuesDebugController;
  [(MapsDebugValuesViewController *)&v4 viewWillAppear:a3];
  [(MapsVenuesDebugController *)self _viewWillAppear];
}

- (void)prepareContent
{
  id v2 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1012E6F38];
}

@end