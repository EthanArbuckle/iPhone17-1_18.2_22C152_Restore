@interface PKProvider
+ (void)createCatalogWithCompletion:(id)a3;
+ (void)createLibraryWithCompletion:(id)a3;
+ (void)createPlayerControllerWithCompletion:(id)a3;
- (PKProvider)init;
@end

@implementation PKProvider

+ (void)createLibraryWithCompletion:(id)a3
{
}

+ (void)createCatalogWithCompletion:(id)a3
{
}

+ (void)createPlayerControllerWithCompletion:(id)a3
{
}

- (PKProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Provider();
  return [(PKProvider *)&v3 init];
}

@end