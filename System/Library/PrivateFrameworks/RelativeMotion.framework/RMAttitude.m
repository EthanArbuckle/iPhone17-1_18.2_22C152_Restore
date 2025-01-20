@interface RMAttitude
+ (BOOL)supportsSecureCoding;
- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternion;
- (RMAttitude)initWithCoder:(id)a3;
- (id)_initWithQuaternion:(id)a3 timestamp:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMAttitude

- (id)_initWithQuaternion:(id)a3 timestamp:(double)a4
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)RMAttitude;
  id result = [(RMLogItem *)&v9 _initWithTimestamp:a4];
  if (result)
  {
    *((double *)result + 2) = var0;
    *((double *)result + 3) = var1;
    *((double *)result + 4) = var2;
    *((double *)result + 5) = var3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMAttitude)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMAttitude;
  v5 = [(RMLogItem *)&v11 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"kRMAttitudeCodingKeyQuaternionX"];
    v5->_quaternion.x = v6;
    [v4 decodeDoubleForKey:@"kRMAttitudeCodingKeyQuaternionY"];
    v5->_quaternion.y = v7;
    [v4 decodeDoubleForKey:@"kRMAttitudeCodingKeyQuaternionZ"];
    v5->_quaternion.z = v8;
    [v4 decodeDoubleForKey:@"kRMAttitudeCodingKeyQuaternionW"];
    v5->_quaternion.w = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (double *)self;
  v5.receiver = self;
  v5.super_class = (Class)RMAttitude;
  id v4 = a3;
  [(RMLogItem *)&v5 encodeWithCoder:v4];
  v3 += 2;
  objc_msgSend(v4, "encodeDouble:forKey:", @"kRMAttitudeCodingKeyQuaternionX", *v3, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"kRMAttitudeCodingKeyQuaternionY" forKey:v3[1]];
  [v4 encodeDouble:@"kRMAttitudeCodingKeyQuaternionZ" forKey:v3[2]];
  [v4 encodeDouble:@"kRMAttitudeCodingKeyQuaternionW" forKey:v3[3]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(RMLogItem *)self timestamp];
  uint64_t v5 = objc_msgSend(v4, "_initWithTimestamp:");
  double v6 = (void *)v5;
  if (v5)
  {
    double v7 = (void *)(v5 + 16);
    [(RMAttitude *)self quaternion];
    *double v7 = v8;
    v6[3] = v9;
    v6[4] = v10;
    v6[5] = v11;
  }
  return v6;
}

- (id)description
{
  v2 = NSString;
  long long v7 = *(_OWORD *)&self->_quaternion.x;
  double z = self->_quaternion.z;
  double w = self->_quaternion.w;
  [(RMLogItem *)self timestamp];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"Quaternion: <%f,%f,%f,%f> Timestamp %f", v7, *(void *)&z, *(void *)&w, v5);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternion
{
  double x = self->_quaternion.x;
  double y = self->_quaternion.y;
  double z = self->_quaternion.z;
  double w = self->_quaternion.w;
  result.double var3 = w;
  result.double var2 = z;
  result.double var1 = y;
  result.double var0 = x;
  return result;
}

@end