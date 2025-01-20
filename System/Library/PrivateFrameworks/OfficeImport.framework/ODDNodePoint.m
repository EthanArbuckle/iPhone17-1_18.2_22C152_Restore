@interface ODDNodePoint
- (id)children;
- (id)parent;
- (id)parentTransition;
- (id)siblingTransition;
- (void)addChild:(id)a3 order:(unint64_t)a4;
- (void)setParentTransition:(id)a3;
- (void)setSiblingTransition:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ODDNodePoint

- (void)setType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 >= 3) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Bad point type"];
  }
  v5.receiver = self;
  v5.super_class = (Class)ODDNodePoint;
  [(ODDPoint *)&v5 setType:v3];
}

- (void)addChild:(id)a3 order:(unint64_t)a4
{
  v6 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained(v6 + 6);

  if (WeakRetained) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Point already has a parent"];
  }
  objc_storeWeak(v6 + 6, self);
  v8 = self->mChildren;
  v11 = v8;
  [(id)objc_opt_class() addConnectionToPoint:v6 order:a4 array:&v11];
  v9 = v11;

  mChildren = self->mChildren;
  self->mChildren = v9;
}

- (void)setParentTransition:(id)a3
{
  v4 = (ODDTransitionPoint *)a3;
  if (self->mParentTransition) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Point already has a parent transition"];
  }
  if ([(ODDPoint *)v4 type] != 3) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Not a parent transition"];
  }
  mParentTransition = self->mParentTransition;
  self->mParentTransition = v4;
}

- (void)setSiblingTransition:(id)a3
{
  v4 = (ODDTransitionPoint *)a3;
  if (self->mSiblingTransition) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Point already has a sibling transition"];
  }
  if ([(ODDPoint *)v4 type] != 5) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Not a sibling transition"];
  }
  mSiblingTransition = self->mSiblingTransition;
  self->mSiblingTransition = v4;
}

- (id)children
{
  return self->mChildren;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return WeakRetained;
}

- (id)siblingTransition
{
  return self->mSiblingTransition;
}

- (id)parentTransition
{
  return self->mParentTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSiblingTransition, 0);
  objc_storeStrong((id *)&self->mParentTransition, 0);
  objc_storeStrong((id *)&self->mChildren, 0);
  objc_destroyWeak((id *)&self->mParent);
}

@end