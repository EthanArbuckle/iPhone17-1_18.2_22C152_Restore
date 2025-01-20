@interface SBUIImageDataProvider
- (SBUIImageDataProvider)initWithImage:(id)a3 context:(id)a4 scaleFactor:(double)a5;
- (XBSnapshotDataProviderContext)context;
- (id)fetchImageForFormat:(int64_t)a3;
@end

@implementation SBUIImageDataProvider

- (SBUIImageDataProvider)initWithImage:(id)a3 context:(id)a4 scaleFactor:(double)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSnapshotDataProvider.m", 177, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBUIImageDataProvider;
  v12 = [(SBUIImageDataProvider *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v13->_scaleFactor = a5;
  }

  return v13;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  v4 = self->_image;
  if ((BSFloatIsOne() & 1) == 0)
  {
    uint64_t v5 = [(UIImage *)v4 sbf_scaleImage:0 canUseIOSurface:self->_scaleFactor];

    v4 = (UIImage *)v5;
  }
  return v4;
}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end