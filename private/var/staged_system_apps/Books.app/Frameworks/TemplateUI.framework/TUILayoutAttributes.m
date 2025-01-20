@interface TUILayoutAttributes
+ (id)newLayoutAttributesWithIndexPath:(id)a3;
- (BOOL)forceVisibleOnHover;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)size;
- (NSIndexPath)indexPath;
- (NSString)refId;
- (NSString)refInstance;
- (TUILayoutAttributes)init;
- (TUILayoutAttributes)initWithOther:(id)a3;
- (TUIRenderModel)renderModel;
- (UIEdgeInsets)outsets;
- (double)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)generic;
- (int64_t)zIndex;
- (void)setAlpha:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setForceVisibleOnHover:(BOOL)a3;
- (void)setGeneric:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIndexPath:(id)a3;
- (void)setOutsets:(UIEdgeInsets)a3;
- (void)setRefId:(id)a3;
- (void)setRefInstance:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setZIndex:(int64_t)a3;
@end

@implementation TUILayoutAttributes

+ (id)newLayoutAttributesWithIndexPath:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TUILayoutAttributes);
  [(TUILayoutAttributes *)v4 setIndexPath:v3];

  return v4;
}

- (TUILayoutAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUILayoutAttributes;
  result = [(TUILayoutAttributes *)&v6 init];
  if (result)
  {
    CGSize size = CGRectNull.size;
    result->_frame.origin = CGRectNull.origin;
    result->_frame.CGSize size = size;
    CGSize v4 = CGRectZero.size;
    result->_bounds.origin = CGRectZero.origin;
    result->_bounds.CGSize size = v4;
    result->_center = CGPointZero;
    long long v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&result->_outsets.bottom = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    result->_alpha = 1.0;
    result->_zIndex = 0;
    *(_OWORD *)&result->_outsets.top = v5;
  }
  return result;
}

- (TUILayoutAttributes)initWithOther:(id)a3
{
  CGSize v4 = (char *)a3;
  v13.receiver = self;
  v13.super_class = (Class)TUILayoutAttributes;
  long long v5 = [(TUILayoutAttributes *)&v13 init];
  objc_super v6 = v5;
  if (v5)
  {
    long long v7 = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 8) = v7;
    long long v8 = *(_OWORD *)(v4 + 120);
    *(_OWORD *)(v5 + 136) = *(_OWORD *)(v4 + 136);
    *(_OWORD *)(v5 + 120) = v8;
    *((void *)v5 + 7) = *((void *)v4 + 7);
    *((void *)v5 + 6) = *((void *)v4 + 6);
    long long v9 = *(_OWORD *)(v4 + 184);
    long long v10 = *(_OWORD *)(v4 + 200);
    *(_OWORD *)(v5 + 216) = *(_OWORD *)(v4 + 216);
    *(_OWORD *)(v5 + 200) = v10;
    *(_OWORD *)(v5 + 184) = v9;
    *(_OWORD *)(v5 + 104) = *(_OWORD *)(v4 + 104);
    v5[40] = v4[40];
    objc_storeStrong((id *)v5 + 8, *((id *)v4 + 8));
    objc_storeStrong((id *)v6 + 9, *((id *)v4 + 9));
    objc_storeStrong((id *)v6 + 10, *((id *)v4 + 10));
    objc_storeStrong((id *)v6 + 11, *((id *)v4 + 11));
    objc_storeStrong((id *)v6 + 12, *((id *)v4 + 12));
    long long v11 = *(_OWORD *)(v4 + 152);
    *(_OWORD *)(v6 + 168) = *(_OWORD *)(v4 + 168);
    *(_OWORD *)(v6 + 152) = v11;
    v6[41] = v4[41];
  }

  return (TUILayoutAttributes *)v6;
}

- (void)setSize:(CGSize)a3
{
  if (self->_bounds.size.width != a3.width || self->_bounds.size.height != a3.height)
  {
    self->_bounds.CGSize size = a3;
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (CGSize)size
{
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_bounds, a3))
  {
    self->_bounds.origin.CGFloat x = x;
    self->_bounds.origin.CGFloat y = y;
    self->_bounds.size.CGFloat width = width;
    self->_bounds.size.CGFloat height = height;
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (void)setCenter:(CGPoint)a3
{
  if (self->_center.x != a3.x || self->_center.y != a3.y)
  {
    self->_center = a3;
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tCGFloat x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_transform.tCGFloat x = v8;
    *(_OWORD *)&self->_transform.a = v7;
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (CGRect)frame
{
  if (CGRectIsNull(self->_frame))
  {
    CGFloat y = CGPointZero.y;
    double width = self->_bounds.size.width;
    double height = self->_bounds.size.height;
    memset(&v11, 0, sizeof(v11));
    CGAffineTransformMakeTranslation(&v11, width * -0.5, height * -0.5);
    CGAffineTransform t1 = v11;
    long long v6 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v6;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v10, &t1, &t2);
    CGAffineTransform v11 = v10;
    CGAffineTransformMakeTranslation(&v7, self->_center.x, self->_center.y);
    CGAffineTransform t1 = v11;
    CGAffineTransformConcat(&v10, &t1, &v7);
    CGAffineTransform v11 = v10;
    v12.origin.CGFloat x = CGPointZero.x;
    v12.origin.CGFloat y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    CGRect result = CGRectApplyAffineTransform(v12, &v10);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CGSize v4 = +[TUILayoutAttributes allocWithZone:a3];

  return [(TUILayoutAttributes *)v4 initWithOther:self];
}

- (BOOL)isEqual:(id)a3
{
  CGSize v4 = (char *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  if (!CGRectEqualToRect(self->_bounds, *(CGRect *)(v4 + 120))) {
    goto LABEL_12;
  }
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  long long v6 = *(_OWORD *)(v4 + 200);
  *(_OWORD *)&v12.a = *(_OWORD *)(v4 + 184);
  *(_OWORD *)&v12.c = v6;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(v4 + 216);
  if (!CGAffineTransformEqualToTransform(&t1, &v12)) {
    goto LABEL_12;
  }
  unsigned __int8 v7 = 0;
  if (self->_center.x == *((double *)v4 + 13) && self->_center.y == *((double *)v4 + 14))
  {
    if (self->_alpha == *((double *)v4 + 6)
      && self->_zIndex == *((void *)v4 + 7)
      && self->_hidden == v4[40]
      && self->_forceVisibleOnHover == v4[41])
    {
      if ([(NSIndexPath *)self->_indexPath isEqual:*((void *)v4 + 8)])
      {
        if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_outsets.top, *(float64x2_t *)(v4 + 152)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_outsets.bottom, *(float64x2_t *)(v4 + 168)))), 0xFuLL))))
        {
          renderModel = self->_renderModel;
          if (renderModel == *((TUIRenderModel **)v4 + 9)
            || -[TUIRenderModel isEqualToRenderModel:](renderModel, "isEqualToRenderModel:"))
          {
            refId = self->_refId;
            if (refId == *((NSString **)v4 + 11) || -[NSString isEqualToString:](refId, "isEqualToString:"))
            {
              refInstance = self->_refInstance;
              if (refInstance == *((NSString **)v4 + 12)) {
                unsigned __int8 v7 = 1;
              }
              else {
                unsigned __int8 v7 = -[NSString isEqualToString:](refInstance, "isEqualToString:");
              }
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_12:
    unsigned __int8 v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"<"];
  CGSize v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [v3 addObject:v5];

  long long v6 = +[NSString stringWithFormat:@" %p", self];
  [v3 addObject:v6];

  v42.origin.CGFloat x = CGRectNull.origin.x;
  v42.origin.double y = CGRectNull.origin.y;
  v42.size.double width = CGRectNull.size.width;
  v42.size.double height = CGRectNull.size.height;
  if (!CGRectEqualToRect(self->_frame, v42))
  {
    unsigned __int8 v7 = NSStringFromCGRect(self->_frame);
    long long v8 = +[NSString stringWithFormat:@" frame: (%@)", v7];
    [v3 addObject:v8];
  }
  v43.origin.CGFloat x = CGRectZero.origin.x;
  v43.origin.double y = CGRectZero.origin.y;
  v43.size.double width = CGRectZero.size.width;
  v43.size.double height = CGRectZero.size.height;
  if (!CGRectEqualToRect(self->_bounds, v43))
  {
    long long v9 = NSStringFromCGRect(self->_bounds);
    CGAffineTransform v10 = +[NSString stringWithFormat:@" bounds: (%@)", v9];
    [v3 addObject:v10];
  }
  if (self->_zIndex)
  {
    CGAffineTransform v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    CGAffineTransform v12 = +[NSString stringWithFormat:@" zIndex: (%@)", v11];
    [v3 addObject:v12];
  }
  if (fabs(self->_alpha + -1.0) >= 2.22044605e-16)
  {
    objc_super v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v14 = +[NSString stringWithFormat:@" alpha: (%@)", v13];
    [v3 addObject:v14];
  }
  long long v15 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v15;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  if (!CGAffineTransformIsIdentity(&transform))
  {
    long long v16 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&transform.c = v16;
    *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    v17 = NSStringFromCGAffineTransform(&transform);
    v18 = +[NSString stringWithFormat:@" transform: (%@)", v17];
    [v3 addObject:v18];
  }
  CGFloat x = self->_center.x;
  double y = self->_center.y;
  if (x != CGPointZero.x || y != CGPointZero.y)
  {
    v21 = NSStringFromCGPoint(*(CGPoint *)&x);
    v22 = +[NSString stringWithFormat:@" center: (%@)", v21];
    [v3 addObject:v22];
  }
  if (self->_hidden)
  {
    v23 = +[NSNumber numberWithBool:1];
    v24 = +[NSString stringWithFormat:@" hidden: (%@)", v23];
    [v3 addObject:v24];
  }
  if (self->_forceVisibleOnHover)
  {
    v25 = +[NSNumber numberWithBool:1];
    v26 = +[NSString stringWithFormat:@" forceVisibleOnHover: (%@)", v25];
    [v3 addObject:v26];
  }
  v27 = +[NSString stringWithFormat:@" index path: (%@)", self->_indexPath];
  [v3 addObject:v27];

  v28 = +[NSString stringWithFormat:@" render model: (%p)", self->_renderModel];
  [v3 addObject:v28];

  if (self->_generic)
  {
    v29 = +[NSString stringWithFormat:@" generic: (%p)", self->_generic];
    [v3 addObject:v29];
  }
  if ([(NSString *)self->_refId length])
  {
    v30 = +[NSString stringWithFormat:@" ref id: (%@)", self->_refId];
    [v3 addObject:v30];
  }
  if ([(NSString *)self->_refInstance length])
  {
    v31 = +[NSString stringWithFormat:@" ref instance: (%@)", self->_refInstance];
    [v3 addObject:v31];
  }
  float64x2_t v32 = *(float64x2_t *)&self->_outsets.top;
  float64x2_t v33 = *(float64x2_t *)&self->_outsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v32, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v33, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) == 0)
  {
    CGFloat left = self->_outsets.left;
    CGFloat right = self->_outsets.right;
    v36 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)v32.f64);
    v37 = +[NSString stringWithFormat:@" outsets: (%@)", v36];
    [v3 addObject:v37];
  }
  [v3 addObject:@">"];
  v38 = [v3 componentsJoinedByString:&stru_257BF0];

  return v38;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].d;
  return self;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_zIndedouble x = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (BOOL)forceVisibleOnHover
{
  return self->_forceVisibleOnHover;
}

- (void)setForceVisibleOnHover:(BOOL)a3
{
  self->_forceVisibleOnHover = a3;
}

- (TUIRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (id)generic
{
  return self->_generic;
}

- (void)setGeneric:(id)a3
{
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
}

- (NSString)refInstance
{
  return self->_refInstance;
}

- (void)setRefInstance:(id)a3
{
}

- (UIEdgeInsets)outsets
{
  double top = self->_outsets.top;
  double left = self->_outsets.left;
  double bottom = self->_outsets.bottom;
  double right = self->_outsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOutsets:(UIEdgeInsets)a3
{
  self->_outsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong(&self->_generic, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end