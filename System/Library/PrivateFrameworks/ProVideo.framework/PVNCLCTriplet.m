@interface PVNCLCTriplet
- (BOOL)isInvalid;
- (PVNCLCTriplet)initWithColorPrimaryStr:(__CFString *)a3 hgColorPrimary:(int)a4 transferFunctionStr:(__CFString *)a5 hgTransformFunction:(int)a6 ycbcrMatrixStr:(__CFString *)a7 hgYCbCrMatrix:(int)a8;
- (__CFString)colorPrimary;
- (__CFString)transferFunction;
- (__CFString)ycbcrMatrix;
- (int)hgColorPrimary;
- (int)hgTransferFunction;
- (int)hgYCbCrMatrix;
@end

@implementation PVNCLCTriplet

- (PVNCLCTriplet)initWithColorPrimaryStr:(__CFString *)a3 hgColorPrimary:(int)a4 transferFunctionStr:(__CFString *)a5 hgTransformFunction:(int)a6 ycbcrMatrixStr:(__CFString *)a7 hgYCbCrMatrix:(int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)PVNCLCTriplet;
  result = [(PVNCLCTriplet *)&v15 init];
  if (result)
  {
    result->_colorPrimary = a3;
    result->_transferFunction = a5;
    result->_hgColorPrimary = a4;
    result->_hgTransferFunction = a6;
    result->_ycbcrMatrix = a7;
    result->_hgYCbCrMatrix = a8;
  }
  return result;
}

- (BOOL)isInvalid
{
  return !self->_colorPrimary && !self->_transferFunction && self->_ycbcrMatrix == 0;
}

- (__CFString)colorPrimary
{
  return self->_colorPrimary;
}

- (__CFString)transferFunction
{
  return self->_transferFunction;
}

- (__CFString)ycbcrMatrix
{
  return self->_ycbcrMatrix;
}

- (int)hgColorPrimary
{
  return self->_hgColorPrimary;
}

- (int)hgTransferFunction
{
  return self->_hgTransferFunction;
}

- (int)hgYCbCrMatrix
{
  return self->_hgYCbCrMatrix;
}

@end