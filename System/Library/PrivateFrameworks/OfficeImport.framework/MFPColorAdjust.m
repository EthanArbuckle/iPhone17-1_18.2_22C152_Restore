@interface MFPColorAdjust
- (BOOL)isEnabled;
- (MFPColorAdjust)init;
- (MFPColorMatrix)colorMatrix;
- (MFPColorMatrix)grayMatrix;
- (float)gamma;
- (float)threshold;
- (id)recolorMap;
- (id)transparentHigh;
- (id)transparentLow;
- (int)colorMatrixFlags;
- (void)dealloc;
- (void)setColorMatrix:(MFPColorMatrix *)a3;
- (void)setColorMatrixFlags:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGamma:(float)a3;
- (void)setGrayMatrix:(MFPColorMatrix *)a3;
- (void)setRecolorMap:(id)a3;
- (void)setThreshold:(float)a3;
- (void)setTransparentLow:(id)a3 high:(id)a4;
@end

@implementation MFPColorAdjust

- (MFPColorAdjust)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFPColorAdjust;
  result = [(MFPColorAdjust *)&v3 init];
  if (result)
  {
    result->mColorMatrixFlags = -1;
    result->mGamma = -1.0;
    result->mThreshold = -1.0;
    result->mEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  mColorMatrix = self->mColorMatrix;
  if (mColorMatrix) {
    MEMORY[0x23EC997B0](mColorMatrix, 0x1000C4093FC706DLL);
  }
  mGrayMatrix = self->mGrayMatrix;
  if (mGrayMatrix) {
    MEMORY[0x23EC997B0](mGrayMatrix, 0x1000C4093FC706DLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFPColorAdjust;
  [(MFPColorAdjust *)&v5 dealloc];
}

- (MFPColorMatrix)colorMatrix
{
  return self->mColorMatrix;
}

- (void)setColorMatrix:(MFPColorMatrix *)a3
{
  mColorMatrix = self->mColorMatrix;
  if (mColorMatrix) {
    MEMORY[0x23EC997B0](mColorMatrix, 0x1000C4093FC706DLL, a3);
  }
  operator new();
}

- (MFPColorMatrix)grayMatrix
{
  return self->mGrayMatrix;
}

- (void)setGrayMatrix:(MFPColorMatrix *)a3
{
  mGrayMatrix = self->mGrayMatrix;
  if (mGrayMatrix) {
    MEMORY[0x23EC997B0](mGrayMatrix, 0x1000C4093FC706DLL, a3);
  }
  operator new();
}

- (int)colorMatrixFlags
{
  return self->mColorMatrixFlags;
}

- (void)setColorMatrixFlags:(int)a3
{
  self->mColorMatrixFlags = a3;
}

- (id)transparentLow
{
  return self->mTransparentRangeLow;
}

- (id)transparentHigh
{
  return self->mTransparentRangeHigh;
}

- (void)setTransparentLow:(id)a3 high:(id)a4
{
  v6 = (OITSUColor *)a3;
  v7 = (OITSUColor *)a4;
  mTransparentRangeLow = self->mTransparentRangeLow;
  self->mTransparentRangeLow = v6;
  v10 = v6;

  mTransparentRangeHigh = self->mTransparentRangeHigh;
  self->mTransparentRangeHigh = v7;
}

- (float)gamma
{
  return self->mGamma;
}

- (void)setGamma:(float)a3
{
  self->mGamma = a3;
}

- (id)recolorMap
{
  return self->mRecolorMap;
}

- (void)setRecolorMap:(id)a3
{
}

- (float)threshold
{
  return self->mThreshold;
}

- (void)setThreshold:(float)a3
{
  self->mThreshold = a3;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->mEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRecolorMap, 0);
  objc_storeStrong((id *)&self->mTransparentRangeHigh, 0);
  objc_storeStrong((id *)&self->mTransparentRangeLow, 0);
}

@end