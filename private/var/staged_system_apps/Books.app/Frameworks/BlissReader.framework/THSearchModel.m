@interface THSearchModel
- (void)dealloc;
@end

@implementation THSearchModel

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THSearchModel;
  [(THSearchModel *)&v2 dealloc];
}

@end