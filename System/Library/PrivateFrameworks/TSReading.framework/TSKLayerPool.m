@interface TSKLayerPool
- (Class)layerClass;
- (TSKLayerPool)init;
- (id)layerDelegate;
- (id)requestLayerFromPool;
- (void)dealloc;
- (void)returnLayerToPool:(id)a3;
- (void)setLayerClass:(Class)a3;
- (void)setLayerDelegate:(id)a3;
@end

@implementation TSKLayerPool

- (TSKLayerPool)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSKLayerPool;
  v2 = [(TSKLayerPool *)&v4 init];
  if (v2)
  {
    v2->mLayerClass = (Class)objc_opt_class();
    v2->mLayerDelegate = +[TSKNullActionLayerDelegate layerDelegate];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKLayerPool;
  [(TSKLayerPool *)&v3 dealloc];
}

- (id)requestLayerFromPool
{
  mLayerPool = self->mLayerPool;
  if (!mLayerPool)
  {
    mLayerPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->mLayerPool = mLayerPool;
  }
  if (![(NSMutableArray *)mLayerPool count]
    || (id v4 = (id)[(NSMutableArray *)self->mLayerPool lastObject],
        [(NSMutableArray *)self->mLayerPool removeLastObject],
        !v4))
  {
    id v4 = (id)[(objc_class *)self->mLayerClass layer];
  }
  [v4 setDelegate:self->mLayerDelegate];
  return v4;
}

- (void)returnLayerToPool:(id)a3
{
  mLayerPool = self->mLayerPool;
  if (mLayerPool)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    mLayerPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->mLayerPool = mLayerPool;
    if (!a3) {
      return;
    }
  }
  [(NSMutableArray *)mLayerPool addObject:a3];
  [a3 removeFromSuperlayer];
  [a3 setContents:0];

  [a3 setDelegate:0];
}

- (Class)layerClass
{
  return self->mLayerClass;
}

- (void)setLayerClass:(Class)a3
{
  self->mLayerClass = a3;
}

- (id)layerDelegate
{
  return self->mLayerDelegate;
}

- (void)setLayerDelegate:(id)a3
{
  self->mLayerDelegate = a3;
}

@end