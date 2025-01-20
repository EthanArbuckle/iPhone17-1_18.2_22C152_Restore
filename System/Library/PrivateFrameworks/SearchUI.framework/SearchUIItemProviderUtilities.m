@interface SearchUIItemProviderUtilities
+ (id)itemProviderForItem:(id)a3;
+ (void)copy:(id)a3;
- (SearchUIItemProviderUtilities)init;
@end

@implementation SearchUIItemProviderUtilities

+ (id)itemProviderForItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)sub_1E469B7F8(a3);

  return v5;
}

+ (void)copy:(id)a3
{
  id v4 = a3;
  sub_1E469B904(a3);
}

- (SearchUIItemProviderUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIItemProviderUtilities;
  return [(SearchUIItemProviderUtilities *)&v3 init];
}

@end