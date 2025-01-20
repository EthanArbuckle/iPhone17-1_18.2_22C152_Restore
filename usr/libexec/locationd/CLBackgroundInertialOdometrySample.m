@interface CLBackgroundInertialOdometrySample
- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 sampleInterval:(double)a4 CMOdometry:(id)a5;
- (id)initWithCLPIOSample:(CLPIOSample *)a3;
@end

@implementation CLBackgroundInertialOdometrySample

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 sampleInterval:(double)a4 CMOdometry:(id)a5
{
  if ([a5 deltaPositionX] && objc_msgSend(a5, "deltaPositionY") && objc_msgSend(a5, "deltaPositionZ"))
  {
    id v8 = objc_alloc((Class)CLBIO_DeltaPosition);
    [objc_msgSend(a5, "deltaPositionX") doubleValue];
    double v10 = v9;
    [objc_msgSend(a5, "deltaPositionY") doubleValue];
    double v12 = v11;
    [objc_msgSend(a5, "deltaPositionZ") doubleValue];
    id v14 = [v8 initWithX:v10 Y:v12 Z:v13];
  }
  else
  {
    id v14 = 0;
  }
  if ([a5 deltaVelocityX] && objc_msgSend(a5, "deltaVelocityY") && objc_msgSend(a5, "deltaVelocityZ"))
  {
    id v15 = objc_alloc((Class)CLBIO_DeltaVelocity);
    [objc_msgSend(a5, "deltaVelocityX") doubleValue];
    double v17 = v16;
    [objc_msgSend(a5, "deltaVelocityY") doubleValue];
    double v19 = v18;
    [objc_msgSend(a5, "deltaVelocityZ") doubleValue];
    id v21 = [v15 initWithX:v17 Y:v19 Z:v20];
  }
  else
  {
    id v21 = 0;
  }
  if ([a5 quaternionX]
    && [a5 quaternionY]
    && [a5 quaternionZ]
    && [a5 quaternionW])
  {
    id v22 = objc_alloc((Class)CLBIO_Quaternion);
    [objc_msgSend(a5, "quaternionX") doubleValue];
    double v24 = v23;
    [objc_msgSend(a5, "quaternionY") doubleValue];
    double v26 = v25;
    [objc_msgSend(a5, "quaternionZ") doubleValue];
    double v28 = v27;
    [objc_msgSend(a5, "quaternionW") doubleValue];
    id v30 = [v22 initWithX:v24 Y:v26 Z:v28 W:v29];
  }
  else
  {
    id v30 = 0;
  }
  id v31 = [a5 referenceFrame];
  id v32 = [a5 staticFlag];
  if (v32 == (id)1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2 * (v32 == (id)2);
  }
  if (v31 == (id)1) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = 8;
  }
  [a5 timestamp];
  return -[CLBackgroundInertialOdometrySample initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:](self, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:", a3, v14, v21, v30, 0, v34, v33);
}

- (id)initWithCLPIOSample:(CLPIOSample *)a3
{
  if (a3->var16) {
    id v5 = [objc_alloc((Class)CLBIO_DeltaPosition) initWithX:a3->var3 Y:a3->var4 Z:a3->var5];
  }
  else {
    id v5 = 0;
  }
  if (a3->var17) {
    id v6 = [objc_alloc((Class)CLBIO_DeltaVelocity) initWithX:a3->var6 Y:a3->var7 Z:a3->var8];
  }
  else {
    id v6 = 0;
  }
  if (a3->var18) {
    id v7 = [objc_alloc((Class)CLBIO_Quaternion) initWithX:a3->var9 Y:a3->var10 Z:a3->var11 W:a3->var12];
  }
  else {
    id v7 = 0;
  }
  if (a3->var14 == 8) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 1;
  }
  int var15 = a3->var15;
  if (var15 == 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = var15 == 1;
  }
  return -[CLBackgroundInertialOdometrySample initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:](self, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:", [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3->var0], v5, v6, v7, a3->var13 == 1, v8, a3->var1, a3->var2, v10);
}

@end