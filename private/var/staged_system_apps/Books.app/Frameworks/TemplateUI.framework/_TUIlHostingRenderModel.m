@interface _TUIlHostingRenderModel
- (BOOL)isEqualToRenderModel:(id)a3;
- (BOOL)usingGeometry;
- (CGPoint)anchorPoint;
- (CGSize)requestedSize;
- (TUIHostingIdentifier)hostingIdentifier;
- (TUIHostingProperties)hostingProperties;
- (UIEdgeInsets)insets;
- (_TUIlHostingRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10;
@end

@implementation _TUIlHostingRenderModel

- (_TUIlHostingRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 requestedSize:(CGSize)a5 usingGeometry:(BOOL)a6 insets:(UIEdgeInsets)a7 hostingIdentifier:(id)a8 hostingProperties:(id)a9 anchorPoint:(CGPoint)a10
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v18 = a4.height;
  double v19 = a4.width;
  id v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_TUIlHostingRenderModel;
  v23 = [(TUIRenderModelView *)&v26 initWithReuseIdentifier:@"TUIReuseIdentifierHostingView" identifier:a3 submodel:0];
  v24 = v23;
  if (v23)
  {
    v23->_requestedSize.CGFloat width = width;
    v23->_requestedSize.CGFloat height = height;
    v23->_usingGeometry = a6;
    objc_storeStrong((id *)&v23->_hostingIdentifier, a8);
    v24->_anchorPoint.x = v27;
    v24->_anchorPoint.y = v28;
    v24->_insets.CGFloat top = top;
    v24->_insets.CGFloat left = left;
    v24->_insets.CGFloat bottom = bottom;
    v24->_insets.CGFloat right = right;
    -[TUIRenderModelView setSize:](v24, "setSize:", v19, v18);
  }

  return v24;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (v5 == v6) {
      v7 = v4;
    }
    else {
      v7 = 0;
    }
    v8 = v7;
    if (v5 == v6
      && (v14.receiver = self,
          v14.super_class = (Class)_TUIlHostingRenderModel,
          [(TUIRenderModelView *)&v14 isEqualToRenderModel:v4])
      && (self->_requestedSize.width == *((double *)v4 + 11)
        ? (BOOL v9 = self->_requestedSize.height == *((double *)v4 + 12))
        : (BOOL v9 = 0),
          v9
       && self->_usingGeometry == v4[64]
       && (self->_anchorPoint.x == *((double *)v4 + 13)
         ? (BOOL v10 = self->_anchorPoint.y == *((double *)v4 + 14))
         : (BOOL v10 = 0),
           v10
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)(v4 + 120)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)(v4 + 136)))), 0xFuLL))) & 1) != 0)))
    {
      hostingIdentifier = self->_hostingIdentifier;
      if (hostingIdentifier == *((TUIHostingIdentifier **)v4 + 9)) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[TUIHostingIdentifier isEqual:](hostingIdentifier, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (CGSize)requestedSize
{
  double width = self->_requestedSize.width;
  double height = self->_requestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)usingGeometry
{
  return self->_usingGeometry;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);

  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end