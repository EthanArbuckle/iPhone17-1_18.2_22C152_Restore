@interface ODDLayoutObjectList
- (ODDLayoutObjectList)init;
- (id)children;
- (void)addChild:(id)a3;
@end

@implementation ODDLayoutObjectList

- (ODDLayoutObjectList)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDLayoutObjectList;
  v2 = [(ODDLayoutObjectList *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChildren = v2->mChildren;
    v2->mChildren = v3;
  }
  return v2;
}

- (id)children
{
  return self->mChildren;
}

- (void)addChild:(id)a3
{
}

- (void).cxx_destruct
{
}

@end