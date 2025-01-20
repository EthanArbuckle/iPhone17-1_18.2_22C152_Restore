@interface _TUIHoverRegionBuilder
- (NSMutableArray)bounds;
- (_TUIHoverRegionBuilder)init;
- (void)addRegionWithRect:(CGRect)a3;
@end

@implementation _TUIHoverRegionBuilder

- (_TUIHoverRegionBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TUIHoverRegionBuilder;
  v2 = [(_TUIHoverRegionBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bounds = v2->_bounds;
    v2->_bounds = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRegionWithRect:(CGRect)a3
{
  bounds = self->_bounds;
  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)bounds addObject:v4];
}

- (NSMutableArray)bounds
{
  return self->_bounds;
}

- (void).cxx_destruct
{
}

@end