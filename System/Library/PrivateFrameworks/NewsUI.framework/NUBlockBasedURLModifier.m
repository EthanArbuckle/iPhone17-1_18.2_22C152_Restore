@interface NUBlockBasedURLModifier
+ (id)modifierWithBlock:(id)a3;
- (NUBlockBasedURLModifier)initWithBlock:(id)a3;
- (id)block;
- (id)modifyURL:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation NUBlockBasedURLModifier

+ (id)modifierWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

- (NUBlockBasedURLModifier)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUBlockBasedURLModifier;
  v5 = [(NUBlockBasedURLModifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (id)modifyURL:(id)a3
{
  id v4 = a3;
  v5 = [(NUBlockBasedURLModifier *)self block];

  uint64_t v6 = v4;
  if (v5)
  {
    v7 = [(NUBlockBasedURLModifier *)self block];
    uint64_t v6 = ((void (**)(void, id))v7)[2](v7, v4);
  }

  return v6;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end