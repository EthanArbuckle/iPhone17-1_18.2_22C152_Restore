@interface PVCameraFrameMetadata
+ (id)frameMetadata:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(int64_t)a7;
+ (id)frameMetadataWithAngle:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(double)a7;
- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation;
- (double)captureHorizonAngle;
- (double)rollRadians;
- (id)description;
- (int64_t)cameraPosition;
- (int64_t)captureVideoOrientation;
- (int64_t)interfaceOrientation;
@end

@implementation PVCameraFrameMetadata

+ (id)frameMetadata:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(int64_t)a7
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  v15 = objc_alloc_init(PVCameraFrameMetadata);
  v15->_cameraPosition = a3;
  v15->_orientation.x = var0;
  v15->_orientation.y = var1;
  v15->_orientation.z = var2;
  v15->_orientation.w = var3;
  v15->_rollRadians = a5;
  v15->_interfaceOrientation = a6;
  v15->_captureVideoOrientation = a7;

  return v15;
}

+ (id)frameMetadataWithAngle:(int64_t)a3 :(id)a4 :(double)a5 :(int64_t)a6 :(double)a7
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  v15 = objc_alloc_init(PVCameraFrameMetadata);
  v15->_cameraPosition = a3;
  v15->_orientation.y = var1;
  v15->_orientation.z = var2;
  v15->_orientation.w = var3;
  v15->_rollRadians = a5;
  v15->_interfaceOrientation = a6;
  v15->_captureHorizonAngle = a7;
  v15->_orientation.x = var0;

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PVCameraFrameMetadata *)self cameraPosition];
  [(PVCameraFrameMetadata *)self orientation];
  uint64_t v7 = v6;
  [(PVCameraFrameMetadata *)self orientation];
  uint64_t v9 = v8;
  [(PVCameraFrameMetadata *)self orientation];
  uint64_t v11 = v10;
  [(PVCameraFrameMetadata *)self orientation];
  uint64_t v13 = v12;
  [(PVCameraFrameMetadata *)self rollRadians];
  uint64_t v15 = v14;
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[PVCameraFrameMetadata captureVideoOrientation](self, "captureVideoOrientation"));
  v17 = [v3 stringWithFormat:@"<%@ %p> camPos: %ld | orientation: <%f %f %f %f> | rollRad: %f | AVCaptureVideoOrientation: %@ | interfaceOrientation: %ld", v4, self, v5, v7, v9, v11, v13, v15, v16, -[PVCameraFrameMetadata interfaceOrientation](self, "interfaceOrientation")];

  return v17;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation
{
  double x = self->_orientation.x;
  double y = self->_orientation.y;
  double z = self->_orientation.z;
  double w = self->_orientation.w;
  result.double var3 = w;
  result.double var2 = z;
  result.double var1 = y;
  result.double var0 = x;
  return result;
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (int64_t)captureVideoOrientation
{
  return self->_captureVideoOrientation;
}

- (double)captureHorizonAngle
{
  return self->_captureHorizonAngle;
}

@end