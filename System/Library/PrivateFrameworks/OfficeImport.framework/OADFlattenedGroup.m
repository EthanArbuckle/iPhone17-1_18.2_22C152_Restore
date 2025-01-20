@interface OADFlattenedGroup
- (OADFlattenedGroup)init;
- (id)drawables;
- (void)addDrawable:(id)a3;
@end

@implementation OADFlattenedGroup

- (OADFlattenedGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADFlattenedGroup;
  v2 = [(OADDrawable *)&v6 initWithPropertiesClass:0];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDrawables = v2->mDrawables;
    v2->mDrawables = v3;
  }
  return v2;
}

- (id)drawables
{
  return self->mDrawables;
}

- (void)addDrawable:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->mDrawables addObject:v4];
  }
}

- (void).cxx_destruct
{
}

@end