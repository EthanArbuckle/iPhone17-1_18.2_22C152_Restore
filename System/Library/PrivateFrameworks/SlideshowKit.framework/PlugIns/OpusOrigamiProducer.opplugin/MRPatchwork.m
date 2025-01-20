@interface MRPatchwork
- (MRPatchwork)init;
- (MRPatchwork)patchworkWithPatch:(id)a3;
- (void)addPatch:(id)a3;
- (void)dealloc;
- (void)removeAllPatches;
@end

@implementation MRPatchwork

- (MRPatchwork)init
{
  v4.receiver = self;
  v4.super_class = (Class)MRPatchwork;
  v2 = [(MRPatchwork *)&v4 init];
  if (v2) {
    v2->_patches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  self->_patches = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRPatchwork;
  [(MRPatchwork *)&v3 dealloc];
}

- (MRPatchwork)patchworkWithPatch:(id)a3
{
  objc_super v4 = objc_alloc_init(MRPatchwork);
  [(MRPatchwork *)v4 addPatch:a3];
  return v4;
}

- (void)addPatch:(id)a3
{
}

- (void)removeAllPatches
{
}

@end