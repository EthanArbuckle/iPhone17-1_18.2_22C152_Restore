@interface PXFeedViewLayoutSpecManager
- (PXFeedViewLayoutSpec)spec;
- (void)setSpec:(id)a3;
@end

@implementation PXFeedViewLayoutSpecManager

- (void).cxx_destruct
{
}

- (void)setSpec:(id)a3
{
  v7 = (PXFeedViewLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXFeedViewLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXFeedViewLayoutSpecManager *)self signalChange:1];
    }
  }
}

- (PXFeedViewLayoutSpec)spec
{
  spec = self->_spec;
  if (!spec)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXFeedViewLayoutSpecManager.m", 20, @"Invalid parameter not satisfying: %@", @"_spec != nil" object file lineNumber description];

    spec = self->_spec;
  }
  return spec;
}

@end