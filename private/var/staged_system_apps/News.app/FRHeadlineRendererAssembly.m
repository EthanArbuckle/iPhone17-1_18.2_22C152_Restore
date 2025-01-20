@interface FRHeadlineRendererAssembly
- (FRHeadlineRendererAssembly)init;
- (double)scale;
- (void)loadInRegistry:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation FRHeadlineRendererAssembly

- (void)loadInRegistry:(id)a3
{
  id v4 = [a3 publicContainer];
  id v3 = [v4 registerClass:objc_opt_class() factory:&stru_1000CA830];
}

- (FRHeadlineRendererAssembly)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRHeadlineRendererAssembly;
  return [(FRHeadlineRendererAssembly *)&v3 init];
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end