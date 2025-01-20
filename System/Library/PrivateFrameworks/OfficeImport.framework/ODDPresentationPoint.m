@interface ODDPresentationPoint
- (id)children;
- (id)parent;
- (void)addChild:(id)a3 order:(unint64_t)a4;
- (void)setType:(int)a3;
@end

@implementation ODDPresentationPoint

- (void)setType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 != 4) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Bad point type"];
  }
  v5.receiver = self;
  v5.super_class = (Class)ODDPresentationPoint;
  [(ODDPoint *)&v5 setType:v3];
}

- (void)addChild:(id)a3 order:(unint64_t)a4
{
  v6 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained(v6 + 5);

  if (WeakRetained) {
    [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Point already has a parent"];
  }
  objc_storeWeak(v6 + 5, self);
  v8 = self->mChildren;
  v11 = v8;
  [(id)objc_opt_class() addConnectionToPoint:v6 order:a4 array:&v11];
  v9 = v11;

  mChildren = self->mChildren;
  self->mChildren = v9;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return WeakRetained;
}

- (id)children
{
  return self->mChildren;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
  objc_destroyWeak((id *)&self->mParent);
}

@end