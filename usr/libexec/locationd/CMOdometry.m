@interface CMOdometry
+ (BOOL)supportsSecureCoding;
- (CMOdometry)initWithCoder:(id)a3;
- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15;
- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13;
- (NSNumber)deltaPositionX;
- (NSNumber)deltaPositionY;
- (NSNumber)deltaPositionZ;
- (NSNumber)deltaVelocityX;
- (NSNumber)deltaVelocityY;
- (NSNumber)deltaVelocityZ;
- (NSNumber)quaternionW;
- (NSNumber)quaternionX;
- (NSNumber)quaternionY;
- (NSNumber)quaternionZ;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)staticFlag;
- (unint64_t)referenceFrame;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rotateArbitraryToTrueNorth;
@end

@implementation CMOdometry

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15
{
  v24.receiver = self;
  v24.super_class = (Class)CMOdometry;
  v22 = [(CMLogItem *)&v24 initWithTimestamp:a15];
  if (v22)
  {
    v22->_deltaPositionX = (NSNumber *)a3;
    v22->_deltaPositionY = (NSNumber *)a4;
    v22->_deltaPositionZ = (NSNumber *)a5;
    v22->_deltaVelocityX = (NSNumber *)a6;
    v22->_deltaVelocityY = (NSNumber *)a7;
    v22->_deltaVelocityZ = (NSNumber *)a8;
    v22->_quaternionX = (NSNumber *)a9;
    v22->_quaternionY = (NSNumber *)a10;
    v22->_quaternionZ = (NSNumber *)a11;
    v22->_quaternionW = (NSNumber *)a12;
    v22->_referenceFrame = 1;
    v22->_rotationArbitraryToTrueNorth = a13;
    v22->_staticFlag = a14;
  }
  return v22;
}

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13
{
  return [(CMOdometry *)self initWithDeltaPositionX:a3 deltaPositionY:a4 deltaPositionZ:a5 deltaVelocityX:a6 deltaVelocityY:a7 deltaVelocityZ:a8 quaternionX:0.0 quaternionY:a13 quaternionZ:a9 quaternionW:a10 rotationArbitraryToTrueNorth:a11 staticFlag:a12 timestamp:0];
}

- (void)rotateArbitraryToTrueNorth
{
  if (self->_referenceFrame == 1)
  {
    if (self->_quaternionX)
    {
      if (self->_quaternionY)
      {
        if (self->_quaternionZ)
        {
          if (self->_quaternionW)
          {
            float rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
            if (rotationArbitraryToTrueNorth != 0.0)
            {
              uint64_t v39 = 0;
              float v40 = rotationArbitraryToTrueNorth;
              [(NSNumber *)self->_quaternionX floatValue];
              unsigned int v5 = v4;
              [(NSNumber *)self->_quaternionY floatValue];
              unsigned int v7 = v6;
              [(NSNumber *)self->_quaternionZ floatValue];
              unsigned int v9 = v8;
              [(NSNumber *)self->_quaternionW floatValue];
              v37.i64[0] = __PAIR64__(v7, v5);
              v37.i64[1] = __PAIR64__(v10.u32[0], v9);
              float32x4_t v11 = sub_100B9BEAC(&v37, v10);
              sub_100B9BB80((uint64_t)&v37, v38.f32, &v36, v11);
              float32x4_t v37 = v36;

              id v12 = objc_alloc((Class)NSNumber);
              LODWORD(v13) = v37.i32[0];
              self->_quaternionX = (NSNumber *)[v12 initWithFloat:v13];
              id v14 = objc_alloc((Class)NSNumber);
              LODWORD(v15) = v37.i32[1];
              self->_quaternionY = (NSNumber *)[v14 initWithFloat:v15];
              id v16 = objc_alloc((Class)NSNumber);
              LODWORD(v17) = v37.i32[2];
              self->_quaternionZ = (NSNumber *)[v16 initWithFloat:v17];
              id v18 = objc_alloc((Class)NSNumber);
              LODWORD(v19) = v37.i32[3];
              self->_quaternionW = (NSNumber *)[v18 initWithFloat:v19];
              deltaPositionX = self->_deltaPositionX;
              if (deltaPositionX && self->_deltaPositionY)
              {
                [(NSNumber *)deltaPositionX floatValue];
                __int32 v22 = v21;
                [(NSNumber *)self->_deltaPositionY floatValue];
                v36.i32[0] = v22;
                *(uint64_t *)((char *)v36.i64 + 4) = v23;
                sub_100B9BD68(v38.f32, (uint64_t)&v36);

                id v24 = objc_alloc((Class)NSNumber);
                LODWORD(v25) = v36.i32[0];
                self->_deltaPositionX = (NSNumber *)[v24 initWithFloat:v25];
                id v26 = objc_alloc((Class)NSNumber);
                LODWORD(v27) = v36.i32[1];
                self->_deltaPositionY = (NSNumber *)[v26 initWithFloat:v27];
              }
              else
              {

                self->_deltaPositionX = 0;
                self->_deltaPositionY = 0;
              }
              deltaVelocityX = self->_deltaVelocityX;
              if (deltaVelocityX && self->_deltaVelocityY)
              {
                [(NSNumber *)deltaVelocityX floatValue];
                __int32 v30 = v29;
                [(NSNumber *)self->_deltaVelocityY floatValue];
                v36.i32[0] = v30;
                *(uint64_t *)((char *)v36.i64 + 4) = v31;
                sub_100B9BD68(v38.f32, (uint64_t)&v36);

                id v32 = objc_alloc((Class)NSNumber);
                LODWORD(v33) = v36.i32[0];
                self->_deltaVelocityX = (NSNumber *)[v32 initWithFloat:v33];
                id v34 = objc_alloc((Class)NSNumber);
                LODWORD(v35) = v36.i32[1];
                self->_deltaVelocityY = (NSNumber *)[v34 initWithFloat:v35];
              }
              else
              {

                self->_deltaVelocityX = 0;
                self->_deltaVelocityY = 0;
              }
              self->_referenceFrame = 8;
            }
          }
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMOdometry;
  unsigned int v4 = -[CMLogItem initWithCoder:](&v8, "initWithCoder:");
  if (v4)
  {
    v4->_deltaPositionX = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaPositionX"];
    v4->_deltaPositionY = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaPositionY"];
    v4->_deltaPositionZ = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaPositionZ"];
    v4->_deltaVelocityX = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaVelocityX"];
    v4->_deltaVelocityY = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaVelocityY"];
    v4->_deltaVelocityZ = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyDeltaVelocityZ"];
    v4->_quaternionX = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyQuaternionX"];
    v4->_quaternionY = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyQuaternionY"];
    v4->_quaternionZ = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyQuaternionZ"];
    v4->_quaternionW = (NSNumber *)[a3 decodeObjectForKey:@"kCMOdometryCodingKeyQuaternionW"];
    [a3 decodeFloatForKey:@"kCMOdometryCodingKeyReferenceFrame"];
    v4->_referenceFrame = (unint64_t)v5;
    [a3 decodeFloatForKey:@"kCMOdometryCodingKeyRotationArbitraryToTrueNort"];
    v4->_float rotationArbitraryToTrueNorth = v6;
    v4->_staticFlag = (int64_t)[[objc_msgSend(a3, "decodeObjectForKey:", @"kCMOdometryCodingKeyStaticFlag") integerValue];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMOdometry;
  -[CMLogItem encodeWithCoder:](&v7, "encodeWithCoder:");
  [a3 encodeObject:self->_deltaPositionX forKey:@"kCMOdometryCodingKeyDeltaPositionX"];
  [a3 encodeObject:self->_deltaPositionY forKey:@"kCMOdometryCodingKeyDeltaPositionY"];
  [a3 encodeObject:self->_deltaPositionZ forKey:@"kCMOdometryCodingKeyDeltaPositionZ"];
  [a3 encodeObject:self->_deltaVelocityX forKey:@"kCMOdometryCodingKeyDeltaVelocityX"];
  [a3 encodeObject:self->_deltaVelocityY forKey:@"kCMOdometryCodingKeyDeltaVelocityY"];
  [a3 encodeObject:self->_deltaVelocityZ forKey:@"kCMOdometryCodingKeyDeltaVelocityZ"];
  [a3 encodeObject:self->_quaternionX forKey:@"kCMOdometryCodingKeyQuaternionX"];
  [a3 encodeObject:self->_quaternionY forKey:@"kCMOdometryCodingKeyQuaternionY"];
  [a3 encodeObject:self->_quaternionZ forKey:@"kCMOdometryCodingKeyQuaternionZ"];
  [a3 encodeObject:self->_quaternionW forKey:@"kCMOdometryCodingKeyQuaternionW"];
  *(float *)&double v5 = (float)self->_referenceFrame;
  [a3 encodeFloat:@"kCMOdometryCodingKeyReferenceFrame" forKey:v5];
  *(float *)&double v6 = self->_rotationArbitraryToTrueNorth;
  [a3 encodeFloat:@"kCMOdometryCodingKeyRotationArbitraryToTrueNort" forKey:v6];
  [a3 encodeObject:[NSNumber numberWithInteger:self->_staticFlag] forKey:@"kCMOdometryCodingKeyStaticFlag"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometry;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMOdometry;
  double v5 = -[CMLogItem copyWithZone:](&v7, "copyWithZone:");
  if (v5)
  {
    v5[3] = [(NSNumber *)self->_deltaPositionX copyWithZone:a3];
    v5[4] = [(NSNumber *)self->_deltaPositionY copyWithZone:a3];
    v5[5] = [(NSNumber *)self->_deltaPositionZ copyWithZone:a3];
    v5[6] = [(NSNumber *)self->_deltaVelocityX copyWithZone:a3];
    v5[7] = [(NSNumber *)self->_deltaVelocityY copyWithZone:a3];
    v5[8] = [(NSNumber *)self->_deltaVelocityZ copyWithZone:a3];
    v5[9] = [(NSNumber *)self->_quaternionX copyWithZone:a3];
    v5[10] = [(NSNumber *)self->_quaternionY copyWithZone:a3];
    v5[11] = [(NSNumber *)self->_quaternionZ copyWithZone:a3];
    v5[12] = [(NSNumber *)self->_quaternionW copyWithZone:a3];
    v5[13] = self->_referenceFrame;
    *((_DWORD *)v5 + 4) = LODWORD(self->_rotationArbitraryToTrueNorth);
    v5[14] = self->_staticFlag;
  }
  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CMOdometry;
  [(CMLogItem *)&v4 timestamp];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Timestamp, %@, DeltaPositionXYZ, %@, %@, %@, DeltaVelocityXYZ, %@, %@, %@, QuaternionXYZW, %@, %@, %@, %@, ReferenceFrame, %d, StaticFlag, %d", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), self->_deltaPositionX, self->_deltaPositionY, self->_deltaPositionZ, self->_deltaVelocityX, self->_deltaVelocityY, self->_deltaVelocityZ, self->_quaternionX, self->_quaternionY, self->_quaternionZ, self->_quaternionW, self->_referenceFrame, self->_staticFlag);
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (NSNumber)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (NSNumber)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (NSNumber)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

- (NSNumber)quaternionX
{
  return self->_quaternionX;
}

- (NSNumber)quaternionY
{
  return self->_quaternionY;
}

- (NSNumber)quaternionZ
{
  return self->_quaternionZ;
}

- (NSNumber)quaternionW
{
  return self->_quaternionW;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (int64_t)staticFlag
{
  return self->_staticFlag;
}

@end