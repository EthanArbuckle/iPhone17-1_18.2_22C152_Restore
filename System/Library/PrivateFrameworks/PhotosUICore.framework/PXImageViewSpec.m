@interface PXImageViewSpec
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldEnableFocus;
- (CGPoint)floatingContentMotionRotation;
- (CGPoint)floatingContentMotionTranslation;
- (CGSize)floatingUnfocusedShadowExpansion;
- (NSArray)overlaySpecs;
- (PXImageViewSpec)init;
- (double)floatingShadowOpacity;
- (double)floatingShadowRadius;
- (double)floatingUnfocusedShadowOpacity;
- (double)floatingUnfocusedShadowRadius;
- (double)floatingUnfocusedShadowVerticalOffset;
- (double)focusedSizeIncrease;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)roundedCornersMode;
- (unint64_t)hash;
- (void)setOverlaySpecs:(id)a3;
- (void)setRoundedCornersMode:(int64_t)a3;
- (void)setShouldEnableFocus:(BOOL)a3;
@end

@implementation PXImageViewSpec

- (void).cxx_destruct
{
}

- (void)setRoundedCornersMode:(int64_t)a3
{
  self->_roundedCornersMode = a3;
}

- (int64_t)roundedCornersMode
{
  return self->_roundedCornersMode;
}

- (void)setShouldEnableFocus:(BOOL)a3
{
  self->_shouldEnableFocus = a3;
}

- (BOOL)shouldEnableFocus
{
  return self->_shouldEnableFocus;
}

- (void)setOverlaySpecs:(id)a3
{
}

- (NSArray)overlaySpecs
{
  return self->_overlaySpecs;
}

- (double)focusedSizeIncrease
{
  return 70.0;
}

- (CGSize)floatingUnfocusedShadowExpansion
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)floatingUnfocusedShadowVerticalOffset
{
  return 10.0;
}

- (double)floatingShadowRadius
{
  return 20.0;
}

- (double)floatingUnfocusedShadowRadius
{
  return 2.0;
}

- (double)floatingShadowOpacity
{
  return 0.5;
}

- (double)floatingUnfocusedShadowOpacity
{
  return 0.200000003;
}

- (CGPoint)floatingContentMotionTranslation
{
  double v2 = 10.0;
  double v3 = 10.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)floatingContentMotionRotation
{
  double v2 = 0.100000001;
  double v3 = 0.100000001;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXImageViewSpec;
  v5 = -[PXViewSpec copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (self->_overlaySpecs)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_overlaySpecs, 1);
    v8 = (void *)v6[13];
    v6[13] = v7;
  }
  else
  {
    v8 = (void *)v5[13];
    v5[13] = 0;
  }

  *((unsigned char *)v6 + 96) = self->_shouldEnableFocus;
  v6[14] = self->_roundedCornersMode;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXImageViewSpec;
  unsigned int v5 = [(PXViewSpec *)&v15 isEqual:v4];
  id v6 = v4;
  if (!v5) {
    goto LABEL_7;
  }
  id v7 = [(PXImageViewSpec *)self overlaySpecs];
  id v8 = [v6 overlaySpecs];
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    char v10 = [v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  int v11 = [(PXImageViewSpec *)self shouldEnableFocus];
  if (v11 == [v6 shouldEnableFocus])
  {
    int64_t v14 = [(PXImageViewSpec *)self roundedCornersMode];
    BOOL v12 = v14 == [v6 roundedCornersMode];
    goto LABEL_8;
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXImageViewSpec;
  unint64_t v3 = [(PXViewSpec *)&v7 hash];
  id v4 = [(PXImageViewSpec *)self overlaySpecs];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (PXImageViewSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageViewSpec;
  CGPoint result = [(PXViewSpec *)&v3 init];
  if (result) {
    result->_roundedCornersMode = 1;
  }
  return result;
}

@end