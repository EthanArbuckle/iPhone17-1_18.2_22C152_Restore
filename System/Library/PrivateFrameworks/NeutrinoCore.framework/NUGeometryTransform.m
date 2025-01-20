@interface NUGeometryTransform
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)transformRect:(CGRect)a3;
- (__n128)transformMatrix:(uint64_t)a1@<X2>;
- (id)description;
- (unint64_t)hash;
@end

@implementation NUGeometryTransform

- (CGRect)transformRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v8 = CGRectGetMinY(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v9 = CGRectGetMinX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v11 = CGRectGetMaxX(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v12 = CGRectGetMaxY(v43);
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", MinX, MinY);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", MaxX, v8);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", v9, MaxY);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  -[NUGeometryTransform transformPoint:](self, "transformPoint:", v11, v12);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  v44.size.CGFloat width = 0.0;
  v44.size.CGFloat height = 0.0;
  v48.size.CGFloat width = 0.0;
  v48.size.CGFloat height = 0.0;
  v44.origin.CGFloat x = v14;
  v44.origin.CGFloat y = v16;
  v48.origin.CGFloat x = v18;
  v48.origin.CGFloat y = v20;
  CGRect v45 = CGRectUnion(v44, v48);
  v49.size.CGFloat width = 0.0;
  v49.size.CGFloat height = 0.0;
  v49.origin.CGFloat x = v22;
  v49.origin.CGFloat y = v24;
  CGRect v46 = CGRectUnion(v45, v49);
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = v26;
  uint64_t v32 = v28;

  return CGRectUnion(v46, *(CGRect *)&v31);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 0xF9475A206469BLL;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"NUGeometryTransform:Identity"];
}

- (__n128)transformMatrix:(uint64_t)a1@<X2>
{
  long long v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  *retstr = *a4;
  return self;
}

@end