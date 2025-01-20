@interface _TUIOverlayFadeRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGPoint)contentOrigin;
- (CGPoint)overlayOrigin;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSString)reuseIdentifier;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModel)submodel;
- (TUIRenderModelSubviews)content;
- (TUIRenderModelSubviews)overlay;
- (UIEdgeInsets)contentErasableInsets;
- (_TUIOverlayFadeRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12;
- (double)gradientWidth;
- (double)padding;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (unint64_t)kind;
- (unint64_t)layoutDirection;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)prepare;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)teardown;
@end

@implementation _TUIOverlayFadeRenderModel

- (NSString)reuseIdentifier
{
  return (NSString *)@"TUIReuseIdentifierOverlayFadeView";
}

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (void)prepare
{
  [(TUIRenderModelSubviews *)self->_content prepare];
  overlay = self->_overlay;

  [(TUIRenderModelSubviews *)overlay prepare];
}

- (void)teardown
{
  [(TUIRenderModelSubviews *)self->_content teardown];
  overlay = self->_overlay;

  [(TUIRenderModelSubviews *)overlay teardown];
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  v4 = self;
  id v5 = [(TUIRenderModelSubviews *)v4->_content copyForInitialAppearanceWithFlags:a3];
  id v6 = [(TUIRenderModelSubviews *)v4->_overlay copyForInitialAppearanceWithFlags:a3];
  v7 = v6;
  if (__PAIR128__((unint64_t)v6, (unint64_t)v5) != *(_OWORD *)&v4->_content)
  {
    v8 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v4->_identifier, v5, v6, v4->_layoutDirection, v4->_size.width, v4->_size.height, v4->_contentOrigin.x, v4->_contentOrigin.y, v4->_contentErasableInsets.top, v4->_contentErasableInsets.left, v4->_contentErasableInsets.bottom, v4->_contentErasableInsets.right, *(void *)&v4->_overlayOrigin.x, *(void *)&v4->_overlayOrigin.y, *(void *)&v4->_padding, *(void *)&v4->_gradientWidth);

    v4 = v8;
  }

  return v4;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  v4 = self;
  id v5 = [(TUIRenderModelSubviews *)v4->_content copyForFinalAppearanceWithFlags:a3];
  id v6 = [(TUIRenderModelSubviews *)v4->_overlay copyForFinalAppearanceWithFlags:a3];
  v7 = v6;
  if (__PAIR128__((unint64_t)v6, (unint64_t)v5) != *(_OWORD *)&v4->_content)
  {
    v8 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v4->_identifier, v5, v4->_overlay, v4->_layoutDirection, v4->_size.width, v4->_size.height, v4->_contentOrigin.x, v4->_contentOrigin.y, v4->_contentErasableInsets.top, v4->_contentErasableInsets.left, v4->_contentErasableInsets.bottom, v4->_contentErasableInsets.right, *(void *)&v4->_overlayOrigin.x, *(void *)&v4->_overlayOrigin.y, *(void *)&v4->_padding, *(void *)&v4->_gradientWidth);

    v4 = v8;
  }

  return v4;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  v4 = (float64x2_t *)a3;
  if (!v4)
  {
    unsigned __int8 v9 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  if (v5 == v6) {
    v7 = v4;
  }
  else {
    v7 = 0;
  }
  v8 = v7;
  if (v5 != v6
    || self->_padding != v4[2].f64[1]
    || self->_gradientWidth != v4[3].f64[0]
    || self->_layoutDirection != *(void *)&v4[3].f64[1])
  {
    goto LABEL_6;
  }
  if (self->_contentOrigin.x != v4[5].f64[0] || self->_contentOrigin.y != v4[5].f64[1]) {
    goto LABEL_6;
  }
  unsigned __int8 v9 = 0;
  if (self->_overlayOrigin.x != v4[6].f64[0] || self->_overlayOrigin.y != v4[6].f64[1]) {
    goto LABEL_7;
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentErasableInsets.top, v4[7]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentErasableInsets.bottom, v4[8]))), 0xFuLL))) & 1) != 0&& ((content = self->_content, content == *(TUIRenderModelSubviews **)&v4[1].f64[1])|| -[TUIRenderModelSubviews isEqualToRenderModel:](content, "isEqualToRenderModel:")))
  {
    overlay = self->_overlay;
    if (overlay == *(TUIRenderModelSubviews **)&v4[2].f64[0]) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = -[TUIRenderModelSubviews isEqualToRenderModel:](overlay, "isEqualToRenderModel:");
    }
  }
  else
  {
LABEL_6:
    unsigned __int8 v9 = 0;
  }
LABEL_7:

LABEL_9:
  return v9;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (_TUIOverlayFadeRenderModel)initWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12
{
  CGFloat x = a9.x;
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  CGFloat y = a6.y;
  CGFloat v19 = a6.x;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v25 = a3;
  id v26 = a5;
  id v27 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_TUIOverlayFadeRenderModel;
  v28 = [(_TUIOverlayFadeRenderModel *)&v31 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifier, a3);
    v29->_size.CGFloat width = width;
    v29->_size.CGFloat height = height;
    objc_storeStrong((id *)&v29->_content, a5);
    v29->_contentOrigin.CGFloat x = v19;
    v29->_contentOrigin.CGFloat y = y;
    v29->_contentErasableInsets.CGFloat top = top;
    v29->_contentErasableInsets.CGFloat left = left;
    v29->_contentErasableInsets.CGFloat bottom = bottom;
    v29->_contentErasableInsets.CGFloat right = right;
    objc_storeStrong((id *)&v29->_overlay, a8);
    v29->_overlayOrigin.CGFloat x = a10;
    v29->_overlayOrigin.CGFloat y = a11;
    v29->_padding = v32;
    v29->_gradientWidth = v33;
    *(CGFloat *)&v29->_layoutDirection = x;
  }

  return v29;
}

- (NSArray)debugContainedSubmodels
{
  overlaCGFloat y = self->_overlay;
  v5[0] = self->_content;
  v5[1] = overlay;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return (NSArray *)v3;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  content = self->_content;
  long long v7 = *(_OWORD *)&a4->c;
  long long v11 = *(_OWORD *)&a4->a;
  long long v12 = v7;
  long long v13 = *(_OWORD *)&a4->tx;
  id v8 = a3;
  [(TUIRenderModelSubviews *)content appendResourcesToCollector:v8 transform:&v11];
  overlaCGFloat y = self->_overlay;
  long long v10 = *(_OWORD *)&a4->c;
  long long v11 = *(_OWORD *)&a4->a;
  long long v12 = v10;
  long long v13 = *(_OWORD *)&a4->tx;
  [(TUIRenderModelSubviews *)overlay appendResourcesToCollector:v8 transform:&v11];
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  content = self->_content;
  long long v11 = *(_OWORD *)&a4->c;
  long long v17 = *(_OWORD *)&a4->a;
  long long v18 = v11;
  long long v19 = *(_OWORD *)&a4->tx;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  [(TUIRenderModelSubviews *)content appendReferencesToCollector:v14 transform:&v17 query:v13 liveTransformResolver:v12];
  overlaCGFloat y = self->_overlay;
  long long v16 = *(_OWORD *)&a4->c;
  long long v17 = *(_OWORD *)&a4->a;
  long long v18 = v16;
  long long v19 = *(_OWORD *)&a4->tx;
  [(TUIRenderModelSubviews *)overlay appendReferencesToCollector:v14 transform:&v17 query:v13 liveTransformResolver:v12];
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return 0;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIRenderModelSubviews)content
{
  return self->_content;
}

- (CGPoint)contentOrigin
{
  double x = self->_contentOrigin.x;
  double y = self->_contentOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)contentErasableInsets
{
  double top = self->_contentErasableInsets.top;
  double left = self->_contentErasableInsets.left;
  double bottom = self->_contentErasableInsets.bottom;
  double right = self->_contentErasableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (TUIRenderModelSubviews)overlay
{
  return self->_overlay;
}

- (CGPoint)overlayOrigin
{
  double x = self->_overlayOrigin.x;
  double y = self->_overlayOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)padding
{
  return self->_padding;
}

- (double)gradientWidth
{
  return self->_gradientWidth;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end