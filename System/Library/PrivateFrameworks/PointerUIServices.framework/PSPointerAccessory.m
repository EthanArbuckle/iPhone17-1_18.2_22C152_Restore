@interface PSPointerAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)orientationMatchesAngle;
- (PSPointerAccessory)initWithCoder:(id)a3;
- (PSPointerShape)shape;
- (double)angle;
- (double)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAngle:(double)a3;
- (void)setOffset:(double)a3;
- (void)setOrientationMatchesAngle:(BOOL)a3;
- (void)setShape:(id)a3;
@end

@implementation PSPointerAccessory

- (unint64_t)hash
{
  return [(PSPointerShape *)self->_shape hash] ^ (unint64_t)self->_offset ^ (unint64_t)self->_angle ^ self->_orientationMatchesAngle;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSPointerAccessory *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && BSEqualObjects()
      && BSFloatEqualToFloat()
      && BSFloatEqualToFloat()
      && v4->_orientationMatchesAngle == self->_orientationMatchesAngle;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [v3 activeMultilinePrefix];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __33__PSPointerAccessory_description__block_invoke;
  v11 = &unk_1E5667900;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"PSPointerAccessory" multilinePrefix:v4 block:&v8];

  v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

id __33__PSPointerAccessory_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"_shape"];
  id v3 = (id)[*(id *)(a1 + 32) appendFloat:@"_offset" withName:*(double *)(*(void *)(a1 + 40) + 24)];
  id v4 = (id)[*(id *)(a1 + 32) appendFloat:@"_angle" withName:*(double *)(*(void *)(a1 + 40) + 32)];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"_orientationMatchesAngle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_shape);
  *(double *)(v4 + 24) = self->_offset;
  *(double *)(v4 + 32) = self->_angle;
  *(unsigned char *)(v4 + 8) = self->_orientationMatchesAngle;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPointerAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSPointerAccessory;
  id v5 = [(PSPointerAccessory *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shape"];
    shape = v5->_shape;
    v5->_shape = (PSPointerShape *)v6;

    [v4 decodeDoubleForKey:@"offset"];
    v5->_offset = v8;
    [v4 decodeDoubleForKey:@"angle"];
    v5->_angle = v9;
    v5->_orientationMatchesAngle = [v4 decodeBoolForKey:@"orientationMatchesAngle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  shape = self->_shape;
  id v5 = a3;
  [v5 encodeObject:shape forKey:@"shape"];
  [v5 encodeDouble:@"offset" forKey:self->_offset];
  [v5 encodeDouble:@"angle" forKey:self->_angle];
  [v5 encodeBool:self->_orientationMatchesAngle forKey:@"orientationMatchesAngle"];
}

- (PSPointerShape)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (BOOL)orientationMatchesAngle
{
  return self->_orientationMatchesAngle;
}

- (void)setOrientationMatchesAngle:(BOOL)a3
{
  self->_orientationMatchesAngle = a3;
}

- (void).cxx_destruct
{
}

@end