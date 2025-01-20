@interface EPNullResourceManager
+ (Class)resourceClass;
- (void)createResource;
@end

@implementation EPNullResourceManager

- (void)createResource
{
  v3.receiver = self;
  v3.super_class = (Class)EPNullResourceManager;
  [(EPResourceManager *)&v3 createResource];
  [(EPResourceManager *)self setAvailability:1 withError:0];
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

@end