@interface PXGTextureManagerPreheatingStrategy
+ (id)defaultPreheatingStrategy;
+ (id)lowMemoryPreheatingStrategy;
+ (id)noPreheatingStrategy;
- (CGRect)preheatingRectForLayout:(id)a3 interactionState:(id *)a4;
- (double)fastOffset;
- (double)mediumOffset;
- (double)slowOffset;
- (double)stoppedOffset;
- (void)setFastOffset:(double)a3;
- (void)setMediumOffset:(double)a3;
- (void)setSlowOffset:(double)a3;
- (void)setStoppedOffset:(double)a3;
@end

@implementation PXGTextureManagerPreheatingStrategy

- (CGRect)preheatingRectForLayout:(id)a3 interactionState:(id *)a4
{
  id v6 = a3;
  [v6 visibleRect];
  [v6 contentSize];

  int64_t var0 = a4->var0;
  double v8 = 0.0;
  switch(a4->var0)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
      goto LABEL_4;
    case 1:
      if (self->_previousRegime >= 2) {
        goto LABEL_3;
      }
LABEL_4:
      [(PXGTextureManagerPreheatingStrategy *)self stoppedOffset];
      break;
    case 2:
LABEL_3:
      [(PXGTextureManagerPreheatingStrategy *)self mediumOffset];
      break;
    case 3:
      [(PXGTextureManagerPreheatingStrategy *)self fastOffset];
      break;
    default:
      break;
  }
  self->_previousRegime = var0;
  if (!a4->var6 && a4->var4 - 2 < 2)
  {
    [(PXGTextureManagerPreheatingStrategy *)self maxPreheatingDistance];
    [(PXGTextureManagerPreheatingStrategy *)self maxPreheatingDistance];
  }
  PXEdgeInsetsMake();
}

- (double)stoppedOffset
{
  return self->_stoppedOffset;
}

+ (id)defaultPreheatingStrategy
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setStoppedOffset:400.0];
  [v2 setSlowOffset:300.0];
  [v2 setMediumOffset:200.0];
  [v2 setFastOffset:100.0];
  return v2;
}

- (void)setStoppedOffset:(double)a3
{
  self->_stoppedOffset = a3;
}

- (void)setSlowOffset:(double)a3
{
  self->_slowOffset = a3;
}

- (void)setMediumOffset:(double)a3
{
  self->_mediumOffset = a3;
}

- (void)setFastOffset:(double)a3
{
  self->_fastOffset = a3;
}

+ (id)noPreheatingStrategy
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)lowMemoryPreheatingStrategy
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setStoppedOffset:100.0];
  [v2 setSlowOffset:100.0];
  [v2 setMediumOffset:100.0];
  [v2 setFastOffset:100.0];
  return v2;
}

- (double)fastOffset
{
  return self->_fastOffset;
}

- (double)mediumOffset
{
  return self->_mediumOffset;
}

- (double)slowOffset
{
  return self->_slowOffset;
}

@end