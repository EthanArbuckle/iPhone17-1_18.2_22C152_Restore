@interface IPAImageGeometry
+ (id)inputGeometryWithImageSize:(CGSize)a3;
- (CGRect)domain;
- (CGRect)extent;
- (IPAImageGeometry)init;
- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4;
- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 domain:(CGRect)a5;
- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 imageQuad:(const Quad2d *)a5;
- (NSString)description;
- (Quad2d)imageQuad;
- (id)identifier;
@end

@implementation IPAImageGeometry

- (void).cxx_destruct
{
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p\n", v5, self];

  [v6 appendFormat:@" identifier:%@\n", self->_identifier];
  v7 = NSStringFromRect(self->_extent);
  [v6 appendFormat:@" extent:%@\n", v7];

  v8 = NSStringFromRect(self->_domain);
  [v6 appendFormat:@" domain: %@\n", v8];

  v9 = NSString;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"<%0.4f %0.4f>", *(void *)&self->_imageQuad.V0.X, *(void *)&self->_imageQuad.V0.Y);
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"<%0.4f %0.4f>", *(void *)&self->_imageQuad.V1.X, *(void *)&self->_imageQuad.V1.Y);
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"<%0.4f %0.4f>", *(void *)&self->_imageQuad.V2.X, *(void *)&self->_imageQuad.V2.Y);
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"<%0.4f %0.4f>", *(void *)&self->_imageQuad.V3.X, *(void *)&self->_imageQuad.V3.Y);
  v14 = [v9 stringWithFormat:@"<Quad2 %@ %@ %@ %@>", v10, v11, v12, v13];

  [v6 appendFormat:@" quad:%@\n", v14];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (Quad2d)imageQuad
{
  Vector2d V2 = self[1].V2;
  retstr->Vector2d V0 = self[1].V1;
  retstr->V1 = V2;
  Vector2d V0 = self[2].V0;
  retstr->Vector2d V2 = self[1].V3;
  retstr->V3 = V0;
  return self;
}

- (CGRect)extent
{
  double x = self->_extent.origin.x;
  double y = self->_extent.origin.y;
  double width = self->_extent.size.width;
  double height = self->_extent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)domain
{
  double x = self->_domain.origin.x;
  double y = self->_domain.origin.y;
  double width = self->_domain.size.width;
  double height = self->_domain.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)identifier
{
  return self->_identifier;
}

- (IPAImageGeometry)init
{
  CGRect result = (IPAImageGeometry *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4
{
  v5[0] = *(void *)&a4.origin.x;
  v5[1] = *(void *)&a4.origin.y;
  *(double *)&v5[2] = a4.origin.x + a4.size.width;
  v5[3] = *(void *)&a4.origin.y;
  v5[4] = *(void *)&a4.origin.x;
  *(double *)&v5[5] = a4.origin.y + a4.size.height;
  *(double *)&v5[6] = a4.origin.x + a4.size.width;
  *(double *)&v5[7] = a4.origin.y + a4.size.height;
  return -[IPAImageGeometry initWithIdentifier:extent:imageQuad:](self, "initWithIdentifier:extent:imageQuad:", a3, v5);
}

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 domain:(CGRect)a5
{
  v6[0] = *(void *)&a5.origin.x;
  v6[1] = *(void *)&a5.origin.y;
  *(double *)&v6[2] = a5.origin.x + a5.size.width;
  v6[3] = *(void *)&a5.origin.y;
  v6[4] = *(void *)&a5.origin.x;
  *(double *)&v6[5] = a5.origin.y + a5.size.height;
  *(double *)&v6[6] = a5.origin.x + a5.size.width;
  *(double *)&v6[7] = a5.origin.y + a5.size.height;
  return -[IPAImageGeometry initWithIdentifier:extent:imageQuad:](self, "initWithIdentifier:extent:imageQuad:", a3, v6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (IPAImageGeometry)initWithIdentifier:(id)a3 extent:(CGRect)a4 imageQuad:(const Quad2d *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  if (v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)IPAImageGeometry;
    v12 = [(IPAImageGeometry *)&v22 init];
    if (v12)
    {
      uint64_t v13 = [v11 copy];
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v13;

      v12->_extent.origin.CGFloat x = x;
      v12->_extent.origin.CGFloat y = y;
      v12->_extent.size.CGFloat width = width;
      v12->_extent.size.CGFloat height = height;
      Vector2d V0 = a5->V0;
      Vector2d V1 = a5->V1;
      Vector2d V3 = a5->V3;
      v12->_imageQuad.Vector2d V2 = a5->V2;
      v12->_imageQuad.Vector2d V3 = V3;
      v12->_imageQuad.Vector2d V0 = V0;
      v12->_imageQuad.Vector2d V1 = V1;
      v12->_domain.origin.CGFloat x = PA::Quad2d::boundingRect((float64x2_t *)a5);
      v12->_domain.origin.CGFloat y = v18;
      v12->_domain.size.CGFloat width = v19;
      v12->_domain.size.CGFloat height = v20;
    }

    return v12;
  }
  else
  {
    CGRect result = (IPAImageGeometry *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

+ (id)inputGeometryWithImageSize:(CGSize)a3
{
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    _PFAssertFailHandler();
    JUMPOUT(0x1DD416320);
  }
  v4 = [[IPAImageGeometry alloc] initWithIdentifier:@"input", 0.0, 0.0, a3.width, a3.height extent];
  return v4;
}

@end