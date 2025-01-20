@interface PFXGradient
- (PFXGradient)initWithDocument:(id)a3 name:(id)a4;
- (void)addStop:(id)a3;
- (void)dealloc;
@end

@implementation PFXGradient

- (PFXGradient)initWithDocument:(id)a3 name:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PFXGradient;
  v4 = [(PFXSvgElement *)&v6 initWithDocument:a3 name:a4];
  if (v4) {
    v4->mStops = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXGradient;
  [(PFXSvgElement *)&v3 dealloc];
}

- (void)addStop:(id)a3
{
}

@end