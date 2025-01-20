@interface VKCMRCMADWrappedDataDetectorElement
+ (BOOL)supportsSecureCoding;
- (CGRect)boundingBox;
- (DDScannerResult)scannerResult;
- (VKCMRCMADWrappedDataDetectorElement)initWithCoder:(id)a3;
- (VKCMRCMADWrappedDataDetectorElement)initWithMADMRCResultItem:(id)a3 scannerResult:(id)a4;
- (VKCMRCMADWrappedDataDetectorElement)initWithScannerResult:(id)a3 quad:(id)a4;
- (VKQuad)quad;
- (id)boundingQuads;
- (unint64_t)dataDetectorTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBox:(CGRect)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setQuad:(id)a3;
- (void)setScannerResult:(id)a3;
@end

@implementation VKCMRCMADWrappedDataDetectorElement

- (VKCMRCMADWrappedDataDetectorElement)initWithMADMRCResultItem:(id)a3 scannerResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [VKQuad alloc];
  [v7 bottomLeft];
  double v10 = v9;
  double v12 = v11;
  [v7 bottomRight];
  double v14 = v13;
  double v16 = v15;
  [v7 topLeft];
  double v18 = v17;
  double v20 = v19;
  [v7 topRight];
  double v22 = v21;
  double v24 = v23;

  v25 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v8, "initWithBottomLeft:bottomRight:topLeft:topRight:", v10, v12, v14, v16, v18, v20, v22, v24);
  v26 = -[VKQuad quadByFlippingPointsWithSourceFrame:](v25, "quadByFlippingPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);

  v27 = [(VKCMRCMADWrappedDataDetectorElement *)self initWithScannerResult:v6 quad:v26];
  return v27;
}

- (VKCMRCMADWrappedDataDetectorElement)initWithScannerResult:(id)a3 quad:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKCMRCMADWrappedDataDetectorElement;
  double v9 = [(VKCBaseDataDetectorElement *)&v17 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerResult, a3);
    v10->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:v7];
    objc_storeStrong((id *)&v10->_quad, a4);
    double v11 = [(VKCMRCMADWrappedDataDetectorElement *)v10 quad];
    [v11 boundingBox];
    v10->_boundingBox.origin.x = v12;
    v10->_boundingBox.origin.y = v13;
    v10->_boundingBox.size.width = v14;
    v10->_boundingBox.size.height = v15;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VKCMRCMADWrappedDataDetectorElement *)self scannerResult];
  [v4 encodeObject:v5 forKey:@"scanner"];

  id v6 = [(VKCMRCMADWrappedDataDetectorElement *)self quad];
  [v4 encodeObject:v6 forKey:@"quad"];
}

- (VKCMRCMADWrappedDataDetectorElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quad"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanner"];

  id v7 = [(VKCMRCMADWrappedDataDetectorElement *)self initWithScannerResult:v6 quad:v5];
  return v7;
}

- (id)boundingQuads
{
  return self->_boundingQuads;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (void)setScannerResult:(id)a3
{
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end