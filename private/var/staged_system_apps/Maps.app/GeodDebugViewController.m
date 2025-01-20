@interface GeodDebugViewController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation GeodDebugViewController

+ (id)navigationDestinationTitle
{
  return @"Debug Table MUID Entries";
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003EA2E4;
  v4[3] = &unk_1012E7EF8;
  objc_copyWeak(&v5, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"MUIDs" content:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end