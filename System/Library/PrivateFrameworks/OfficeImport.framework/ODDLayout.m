@interface ODDLayout
- (ODDLayout)init;
- (id)description;
- (id)rootNode;
@end

@implementation ODDLayout

- (ODDLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDLayout;
  v2 = [(ODDLayout *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ODDLayoutNode);
    mRootNode = v2->mRootNode;
    v2->mRootNode = v3;
  }
  return v2;
}

- (id)rootNode
{
  return self->mRootNode;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDLayout;
  v2 = [(ODDLayout *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end