@interface TUIRenderReferenceTransform
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)frame;
- (CGSize)size;
- (TUIRenderModel)renderModel;
- (id)description;
- (void)setCenter:(CGPoint)a3;
- (void)setRenderModel:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation TUIRenderReferenceTransform

- (CGRect)frame
{
  double width = self->_size.width;
  double height = self->_size.height;
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, width * -0.5, height * -0.5);
  CGAffineTransform t1 = v10;
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformConcat(&v9, &t1, &t2);
  CGAffineTransform v10 = v9;
  CGAffineTransformMakeTranslation(&v6, self->_center.x, self->_center.y);
  CGAffineTransform t1 = v10;
  CGAffineTransformConcat(&v9, &t1, &v6);
  CGAffineTransform v10 = v9;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.double width = width;
  v11.size.double height = height;
  return CGRectApplyAffineTransform(v11, &v9);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  long long v5 = NSStringFromCGSize(self->_size);
  CGAffineTransform v6 = NSStringFromCGPoint(self->_center);
  long long v7 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v7;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  v8 = NSStringFromCGAffineTransform(&transform);
  CGAffineTransform v9 = +[NSString stringWithFormat:@"<%@ size=%@ center=%@ transform=%@>", v4, v5, v6, v8];

  return v9;
}

- (TUIRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end