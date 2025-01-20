@interface PSPointerAccessory
- (CGAffineTransform)_transformWithOffset:(SEL)a3;
- (CGAffineTransform)finalTransform;
- (CGAffineTransform)initialTransform;
- (NSString)positionRecordKey;
@end

@implementation PSPointerAccessory

- (CGAffineTransform)initialTransform
{
  return [(PSPointerAccessory *)self _transformWithOffset:0.0];
}

- (CGAffineTransform)finalTransform
{
  [(PSPointerAccessory *)self offset];
  return -[PSPointerAccessory _transformWithOffset:](self, "_transformWithOffset:");
}

- (CGAffineTransform)_transformWithOffset:(SEL)a3
{
  v7 = [(PSPointerAccessory *)self shape];
  [v7 bounds];
  double v8 = CGRectGetHeight(v17) * 0.5 + a4;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  if ([(PSPointerAccessory *)self orientationMatchesAngle])
  {
    [(PSPointerAccessory *)self angle];
    CGAffineTransformMakeRotation(retstr, v9);
    long long v10 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v16, &v15, 0.0, -v8);
    long long v12 = *(_OWORD *)&v16.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  }
  else
  {
    [(PSPointerAccessory *)self angle];
    CGAffineTransformMakeRotation(&v14, v13);
    return CGAffineTransformMakeTranslation(retstr, v14.tx + v14.a * 0.0 - v8 * v14.c, v14.ty + v14.b * 0.0 - v8 * v14.d);
  }
  return result;
}

- (NSString)positionRecordKey
{
  [(PSPointerAccessory *)self offset];
  uint64_t v4 = v3;
  [(PSPointerAccessory *)self angle];
  return +[NSString stringWithFormat:@"%.3f_%.3f_%i", v4, v5, [(PSPointerAccessory *)self orientationMatchesAngle]];
}

@end