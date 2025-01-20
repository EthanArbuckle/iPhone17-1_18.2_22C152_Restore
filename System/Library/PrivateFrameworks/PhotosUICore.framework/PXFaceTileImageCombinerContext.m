@interface PXFaceTileImageCombinerContext
- (BOOL)isAscending;
- (BOOL)isRTL;
- (PXFaceTileImageCombinerContext)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4 isAscending:(BOOL)a5 imageSize:(double)a6 imageOffset:(double)a7 backgroundColor:(id)a8 borderColor:(id)a9 borderWidth:(double)a10;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)displayScale;
- (double)imageOffset;
- (double)imageSize;
@end

@implementation PXFaceTileImageCombinerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)imageOffset
{
  return self->_imageOffset;
}

- (double)imageSize
{
  return self->_imageSize;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXFaceTileImageCombinerContext)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4 isAscending:(BOOL)a5 imageSize:(double)a6 imageOffset:(double)a7 backgroundColor:(id)a8 borderColor:(id)a9 borderWidth:(double)a10
{
  id v20 = a8;
  id v21 = a9;
  if (a3 <= 0.0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 23, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];
  }
  if (a6 <= 0.0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 24, @"Invalid parameter not satisfying: %@", @"imageSize > 0" object file lineNumber description];
  }
  if (a7 > 0.0)
  {
    if (v20) {
      goto LABEL_7;
    }
LABEL_16:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 26, @"Invalid parameter not satisfying: %@", @"backgroundColor" object file lineNumber description];

    if (v21) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 25, @"Invalid parameter not satisfying: %@", @"imageOffset > 0" object file lineNumber description];

  if (!v20) {
    goto LABEL_16;
  }
LABEL_7:
  if (v21) {
    goto LABEL_8;
  }
LABEL_17:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 27, @"Invalid parameter not satisfying: %@", @"borderColor" object file lineNumber description];

LABEL_8:
  if (a10 <= 0.0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 28, @"Invalid parameter not satisfying: %@", @"borderWidth > 0" object file lineNumber description];
  }
  if (a7 <= a10)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXFaceTileImageCombiner.m", 29, @"Invalid parameter not satisfying: %@", @"imageOffset > borderWidth" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)PXFaceTileImageCombinerContext;
  v22 = [(PXFaceTileImageCombinerContext *)&v32 init];
  v23 = v22;
  if (v22)
  {
    v22->_isRTL = a4;
    v22->_isAscending = a5;
    v22->_displayScale = a3;
    v22->_imageSize = a6;
    v22->_imageOffset = a7;
    objc_storeStrong((id *)&v22->_backgroundColor, a8);
    objc_storeStrong((id *)&v23->_borderColor, a9);
    v23->_borderWidth = a10;
  }

  return v23;
}

@end