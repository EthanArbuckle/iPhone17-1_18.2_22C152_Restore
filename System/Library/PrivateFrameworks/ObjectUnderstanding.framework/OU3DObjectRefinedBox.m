@interface OU3DObjectRefinedBox
- (BOOL)isOutlier;
- (NSArray)preRefinedBox;
- (NSArray)refinedBox;
- (OU3DObjectRefinedBox)init;
- (int)frameIndex;
- (void)setFrameIndex:(int)a3;
- (void)setIsOutlier:(BOOL)a3;
- (void)setPreRefinedBox:(id)a3;
- (void)setRefinedBox:(id)a3;
@end

@implementation OU3DObjectRefinedBox

- (OU3DObjectRefinedBox)init
{
  v8.receiver = self;
  v8.super_class = (Class)OU3DObjectRefinedBox;
  v2 = [(OU3DObjectRefinedBox *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    preRefinedBox = v2->_preRefinedBox;
    v2->_preRefinedBox = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    refinedBox = v2->_refinedBox;
    v2->_refinedBox = (NSArray *)v5;
  }
  v2->isOutlier = 0;
  v2->frameIndex = 0;
  return v2;
}

- (BOOL)isOutlier
{
  return self->isOutlier;
}

- (void)setIsOutlier:(BOOL)a3
{
  self->isOutlier = a3;
}

- (int)frameIndex
{
  return self->frameIndex;
}

- (void)setFrameIndex:(int)a3
{
  self->frameIndex = a3;
}

- (NSArray)preRefinedBox
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreRefinedBox:(id)a3
{
}

- (NSArray)refinedBox
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRefinedBox:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedBox, 0);
  objc_storeStrong((id *)&self->_preRefinedBox, 0);
}

@end