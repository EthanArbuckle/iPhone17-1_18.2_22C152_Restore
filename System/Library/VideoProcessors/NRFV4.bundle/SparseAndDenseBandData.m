@interface SparseAndDenseBandData
@end

@implementation SparseAndDenseBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dense, 0);
  objc_storeStrong((id *)&self->sparse_static_scene, 0);

  objc_storeStrong((id *)&self->sparse, 0);
}

@end