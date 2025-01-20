@interface PlaceholderCollectionHandler
+ (id)sharedInstance;
- (BOOL)containsItem:(id)a3;
- (PlaceholderCollectionHandler)init;
- (id)glyphImage;
- (id)identifier;
- (int64_t)handlerType;
@end

@implementation PlaceholderCollectionHandler

+ (id)sharedInstance
{
  if (qword_1016105A0 != -1) {
    dispatch_once(&qword_1016105A0, &stru_101315188);
  }
  v2 = (void *)qword_101610598;

  return v2;
}

- (PlaceholderCollectionHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)PlaceholderCollectionHandler;
  v2 = [(CollectionHandler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CollectionHandler *)v2 loadDefaultImage];
  }
  return v3;
}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)identifier
{
  return @"__internal_CollectionPlaceholderIdentifier";
}

- (id)glyphImage
{
  return +[UIImage systemImageNamed:@"plus"];
}

- (int64_t)handlerType
{
  return 1;
}

@end