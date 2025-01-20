@interface TUIRenderModelTransform
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)frame;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSString)description;
- (NSString)refId;
- (NSString)refInstance;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIAnimationGroupRenderModelCollection)animationRenderModels;
- (TUIIdentifier)identifier;
- (TUILiveTransform)liveTransform;
- (TUIRenderModelTransform)initWithSubmodel:(id)a3;
- (UIEdgeInsets)outsets;
- (double)alpha;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (id)copyWithAlpha:(double)a3;
- (id)copyWithAlpha:(double)a3 submodel:(id)a4;
- (id)copyWithItemIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (id)submodel;
- (int64_t)zIndex;
- (unint64_t)hash;
- (unint64_t)itemIndex;
- (unint64_t)kind;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)prepare;
- (void)setAlpha:(double)a3;
- (void)setAnimationGroups:(id)a3;
- (void)setAnimationRenderModels:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setIdentifier:(id)a3;
- (void)setLiveTransform:(id)a3;
- (void)setOutsets:(UIEdgeInsets)a3;
- (void)setRefId:(id)a3;
- (void)setRefInstance:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setZIndex:(int64_t)a3;
- (void)teardown;
@end

@implementation TUIRenderModelTransform

- (CGRect)frame
{
  if (CGRectIsNull(self->_frame))
  {
    [(TUIRenderModel *)self->_submodel size];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeTranslation(&v12, v3 * -0.5, v5 * -0.5);
    CGAffineTransform t1 = v12;
    long long v7 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v11, &t1, &t2);
    CGAffineTransform v12 = v11;
    CGAffineTransformMakeTranslation(&v8, self->_center.x, self->_center.y);
    CGAffineTransform t1 = v12;
    CGAffineTransformConcat(&v11, &t1, &v8);
    CGAffineTransform v12 = v11;
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    v13.size.width = v4;
    v13.size.height = v6;
    CGRect result = CGRectApplyAffineTransform(v13, &v11);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
  }
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_transform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_transform.tx = v8;
    *(_OWORD *)&self->_transform.a = v7;
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (TUIRenderModelTransform)initWithSubmodel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIRenderModelTransform;
  long long v6 = [(TUIRenderModelTransform *)&v12 init];
  long long v7 = v6;
  if (v6)
  {
    CGSize size = CGRectNull.size;
    v6->_frame.origin = CGRectNull.origin;
    v6->_frame.CGSize size = size;
    objc_storeStrong((id *)&v6->_submodel, a3);
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v7->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v7->_transform.c = v9;
    *(_OWORD *)&v7->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v7->_alpha = 1.0;
    liveTransform = v7->_liveTransform;
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_liveTransform = 0;
  }
  return v7;
}

- (NSArray)debugContainedSubmodels
{
  if (self->_submodel)
  {
    submodel = self->_submodel;
    v2 = +[NSArray arrayWithObjects:&submodel count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (id)copyWithItemIndex:(unint64_t)a3
{
  if (self->_itemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_itemIndex = a3;
    return self;
  }
  else
  {
    id v5 = [[TUIRenderModelTransform alloc] initWithSubmodel:self->_submodel];
    long long v6 = *(_OWORD *)&self->_transform.tx;
    long long v7 = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v5->_transform.c = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v5->_transform.tx = v6;
    *(_OWORD *)&v5->_transform.a = v7;
    v5->_center = self->_center;
    int64_t zIndex = self->_zIndex;
    v5->_alpha = self->_alpha;
    v5->_int64_t zIndex = zIndex;
    v5->_itemIndex = a3;
    long long v9 = (TUIAnimationGroupCollection *)[(TUIAnimationGroupCollection *)self->_animationGroups copy];
    animationGroups = v5->_animationGroups;
    v5->_animationGroups = v9;

    CGAffineTransform v11 = (TUIAnimationGroupRenderModelCollection *)[(TUIAnimationGroupRenderModelCollection *)self->_animationRenderModels copy];
    animationRenderModels = v5->_animationRenderModels;
    v5->_animationRenderModels = v11;

    objc_storeStrong((id *)&v5->_liveTransform, self->_liveTransform);
    objc_storeStrong((id *)&v5->_refId, self->_refId);
    objc_storeStrong((id *)&v5->_refInstance, self->_refInstance);
    long long v13 = *(_OWORD *)&self->_outsets.bottom;
    *(_OWORD *)&v5->_outsets.top = *(_OWORD *)&self->_outsets.top;
    *(_OWORD *)&v5->_outsets.bottom = v13;
    return v5;
  }
}

- (id)copyWithAlpha:(double)a3
{
  if (self->_alpha == a3)
  {
    return self;
  }
  else
  {
    id v5 = [[TUIRenderModelTransform alloc] initWithSubmodel:self->_submodel];
    long long v6 = *(_OWORD *)&self->_transform.a;
    long long v7 = *(_OWORD *)&self->_transform.tx;
    *(_OWORD *)&v5->_transform.c = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v5->_transform.tx = v7;
    *(_OWORD *)&v5->_transform.a = v6;
    v5->_center = self->_center;
    int64_t zIndex = self->_zIndex;
    v5->_alpha = a3;
    v5->_int64_t zIndex = zIndex;
    v5->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    long long v9 = (TUIAnimationGroupCollection *)[(TUIAnimationGroupCollection *)self->_animationGroups copy];
    animationGroups = v5->_animationGroups;
    v5->_animationGroups = v9;

    CGAffineTransform v11 = (TUIAnimationGroupRenderModelCollection *)[(TUIAnimationGroupRenderModelCollection *)self->_animationRenderModels copy];
    animationRenderModels = v5->_animationRenderModels;
    v5->_animationRenderModels = v11;

    objc_storeStrong((id *)&v5->_liveTransform, self->_liveTransform);
    objc_storeStrong((id *)&v5->_refId, self->_refId);
    objc_storeStrong((id *)&v5->_refInstance, self->_refInstance);
    long long v13 = *(_OWORD *)&self->_outsets.bottom;
    *(_OWORD *)&v5->_outsets.top = *(_OWORD *)&self->_outsets.top;
    *(_OWORD *)&v5->_outsets.bottom = v13;
    return v5;
  }
}

- (id)copyWithAlpha:(double)a3 submodel:(id)a4
{
  long long v6 = (TUIRenderModel *)a4;
  if (self->_alpha == a3
    && ((submodel = self->_submodel, submodel == v6)
     || [(TUIRenderModel *)submodel isEqual:v6]))
  {
    long long v8 = self;
  }
  else
  {
    long long v8 = [[TUIRenderModelTransform alloc] initWithSubmodel:v6];
    long long v9 = *(_OWORD *)&self->_transform.a;
    long long v10 = *(_OWORD *)&self->_transform.tx;
    *(_OWORD *)&v8->_transform.c = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v8->_transform.tx = v10;
    *(_OWORD *)&v8->_transform.a = v9;
    v8->_center = self->_center;
    int64_t zIndex = self->_zIndex;
    v8->_alpha = a3;
    v8->_int64_t zIndex = zIndex;
    v8->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_super v12 = (TUIAnimationGroupCollection *)[(TUIAnimationGroupCollection *)self->_animationGroups copy];
    animationGroups = v8->_animationGroups;
    v8->_animationGroups = v12;

    v14 = (TUIAnimationGroupRenderModelCollection *)[(TUIAnimationGroupRenderModelCollection *)self->_animationRenderModels copy];
    animationRenderModels = v8->_animationRenderModels;
    v8->_animationRenderModels = v14;

    objc_storeStrong((id *)&v8->_liveTransform, self->_liveTransform);
    objc_storeStrong((id *)&v8->_refId, self->_refId);
    objc_storeStrong((id *)&v8->_refInstance, self->_refInstance);
    long long v16 = *(_OWORD *)&self->_outsets.bottom;
    *(_OWORD *)&v8->_outsets.top = *(_OWORD *)&self->_outsets.top;
    *(_OWORD *)&v8->_outsets.bottom = v16;
  }

  return v8;
}

- (unint64_t)kind
{
  return (unint64_t)[(TUIRenderModel *)self->_submodel kind];
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TUIRenderModel *)self->_submodel size];
  if (width != v7 || height != v6)
  {
    -[TUIRenderModel setSize:](self->_submodel, "setSize:", width, height);
    CGSize size = CGRectNull.size;
    self->_frame.origin = CGRectNull.origin;
    self->_frame.CGSize size = size;
  }
}

- (CGSize)size
{
  [(TUIRenderModel *)self->_submodel size];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setIdentifier:(id)a3
{
}

- (TUIIdentifier)identifier
{
  return (TUIIdentifier *)[(TUIRenderModel *)self->_submodel identifier];
}

- (void)prepare
{
}

- (void)teardown
{
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  [(TUIRenderModelTransform *)self size];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, v7 * -0.5, v8 * -0.5);
  CGAffineTransform t1 = v15;
  long long v9 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform v15 = v14;
  CGAffineTransformMakeTranslation(&v11, self->_center.x, self->_center.y);
  CGAffineTransform t1 = v15;
  CGAffineTransformConcat(&v14, &t1, &v11);
  CGAffineTransform v15 = v14;
  CGAffineTransform t1 = v14;
  long long v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform v15 = v14;
  [(TUIRenderModel *)self->_submodel appendResourcesToCollector:v6 transform:&v14];
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(TUIRenderModelTransform *)self size];
  double v14 = v13;
  double v16 = v15;
  if (v11
    && (refICGFloat d = self->_refId,
        refInstance = self->_refInstance,
        [(TUIRenderModelTransform *)self identifier],
        v19 = objc_claimAutoreleasedReturnValue(),
        LODWORD(refId) = [v11 matchesRefId:refId refInstance:refInstance identifier:v19], v19, !refId))
  {
    memset(&v65, 0, sizeof(v65));
    CGAffineTransformMakeTranslation(&v65, v14 * -0.5, v16 * -0.5);
    CGAffineTransform t1 = v65;
    long long v30 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.CGFloat c = v30;
    *(_OWORD *)&t2.CGFloat tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v64, &t1, &t2);
    CGAffineTransform v65 = v64;
    CGAffineTransformMakeTranslation(&v57, self->_center.x, self->_center.y);
    CGAffineTransform t1 = v65;
    CGAffineTransformConcat(&v64, &t1, &v57);
    CGAffineTransform v65 = v64;
    CGAffineTransform t1 = v64;
    long long v31 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.CGFloat c = v31;
    *(_OWORD *)&t2.CGFloat tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v64, &t1, &t2);
    CGAffineTransform v65 = v64;
    [(TUIRenderModel *)self->_submodel appendReferencesToCollector:v10 transform:&v64 query:v11 liveTransformResolver:v12];
  }
  else
  {
    v20 = [(TUIRenderModelTransform *)self liveTransform];

    if (v20)
    {
      v21 = [v12 liveLayoutAttributesForRenderModel:self];
      [v21 center];
      CGFloat v23 = v22;
      [v21 center];
      CGAffineTransformMakeTranslation(&v65, v23, v24);
      long long v51 = *(_OWORD *)&v65.c;
      long long v53 = *(_OWORD *)&v65.a;
      long long v50 = *(_OWORD *)&v65.tx;
      [v21 size];
      double v55 = v25;
      double v56 = v26;

      long long v28 = v50;
      long long v27 = v51;
      long long v29 = v53;
    }
    else
    {
      CGAffineTransformMakeTranslation(&v65, self->_center.x, self->_center.y);
      long long v29 = *(_OWORD *)&v65.a;
      long long v27 = *(_OWORD *)&v65.c;
      long long v28 = *(_OWORD *)&v65.tx;
      double v55 = v14;
      double v56 = v16;
    }
    *(_OWORD *)&v64.CGFloat a = v29;
    *(_OWORD *)&v64.CGFloat c = v27;
    *(_OWORD *)&v64.CGFloat tx = v28;
    long long v32 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.CGFloat c = v32;
    *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v65, &v64, &t1);
    long long v33 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v64.CGFloat a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v64.CGFloat c = v33;
    *(_OWORD *)&v64.CGFloat tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransform t1 = v65;
    CGAffineTransformConcat(&v65, &v64, &t1);
    CGFloat a = v65.a;
    CGFloat b = v65.b;
    CGFloat c = v65.c;
    CGFloat d = v65.d;
    CGFloat tx = v65.tx;
    CGFloat ty = v65.ty;
    double y = CGPointZero.y;
    CGFloat v41 = v65.tx + v65.c * y + v65.a * CGPointZero.x;
    CGFloat v42 = v65.ty + v65.d * y + v65.b * CGPointZero.x;
    CGAffineTransformMakeTranslation(&v62, -v41, -v42);
    v64.CGFloat a = a;
    v64.CGFloat b = b;
    v64.CGFloat c = c;
    v64.CGFloat d = d;
    v64.CGFloat tx = tx;
    v64.CGFloat ty = ty;
    CGAffineTransformConcat(&v65, &v64, &v62);
    long long v52 = *(_OWORD *)&v65.c;
    long long v54 = *(_OWORD *)&v65.a;
    CGFloat v43 = v65.tx;
    CGFloat v44 = v65.ty;
    v45 = objc_alloc_init(TUIRenderReferenceTransform);
    [(TUIRenderReferenceTransform *)v45 setRenderModel:self->_submodel];
    -[TUIRenderReferenceTransform setSize:](v45, "setSize:", v55, v56);
    v59[0] = v54;
    v59[1] = v52;
    CGFloat v60 = v43;
    CGFloat v61 = v44;
    [(TUIRenderReferenceTransform *)v45 setTransform:v59];
    -[TUIRenderReferenceTransform setCenter:](v45, "setCenter:", v41, v42);
    v46 = [TUIRenderReferenceIdentifier alloc];
    v47 = [v11 UUID];
    v48 = [v11 uid];
    v49 = [(TUIRenderReferenceIdentifier *)v46 initWithUUID:v47 uid:v48 refId:self->_refId refInstance:self->_refInstance];
    [v10 appendReference:v45 withIdentifier:v49];
  }
}

- (void)setCenter:(CGPoint)a3
{
  if (a3.x != self->_center.x || a3.y != self->_center.y)
  {
    float64_t x = a3.x;
    float64_t y = a3.y;
    if (!CGRectIsNull(self->_frame))
    {
      v5.f64[0] = x;
      v5.f64[1] = y;
      self->_frame.origin = (CGPoint)vaddq_f64((float64x2_t)self->_frame.origin, vsubq_f64(v5, (float64x2_t)self->_center));
    }
    self->_center.float64_t x = x;
    self->_center.float64_t y = y;
  }
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      id v8 = v5;
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      TUIDynamicCast(v7, v5);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v8;
    if (TUIRenderModelIsEqualToRenderModel(self, v8))
    {
      [(TUIRenderModelTransform *)self transform];
      if (v10) {
        [v10 transform];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        [(TUIRenderModelTransform *)self center];
        double v12 = v11;
        double v14 = v13;
        [v10 center];
        unsigned __int8 v9 = 0;
        if (v12 != v16 || v14 != v15) {
          goto LABEL_32;
        }
        id v17 = [(TUIRenderModelTransform *)self zIndex];
        if (v17 == [v10 zIndex])
        {
          [(TUIRenderModelTransform *)self alpha];
          double v19 = v18;
          [v10 alpha];
          if (v19 == v20)
          {
            id v21 = [(TUIRenderModelTransform *)self itemIndex];
            if (v21 == [v10 itemIndex])
            {
              double v22 = [(TUIRenderModelTransform *)self refId];
              CGFloat v23 = [v10 refId];
              if (v22 != v23)
              {
                CGFloat v24 = [(TUIRenderModelTransform *)self refId];
                double v3 = [v10 refId];
                if (![v24 isEqualToString:v3])
                {

                  unsigned __int8 v9 = 0;
                  goto LABEL_30;
                }
                v34 = v24;
              }
              double v25 = [(TUIRenderModelTransform *)self refInstance];
              uint64_t v26 = [v10 refInstance];
              if (v25 == (void *)v26)
              {

                long long v30 = v22;
                if (v22 != v23)
                {

                  long long v30 = v23;
                }

                goto LABEL_28;
              }
              long long v27 = (void *)v26;
              long long v28 = [(TUIRenderModelTransform *)self refInstance];
              long long v29 = [v10 refInstance];
              unsigned __int8 v36 = [v28 isEqualToString:v29];

              if (v22 == v23)
              {
              }
              else
              {
              }
              if (v36)
              {
LABEL_28:
                submodel = self->_submodel;
                double v22 = [v10 submodel];
                if (submodel == v22)
                {
                  unsigned __int8 v9 = 1;
                  goto LABEL_35;
                }
                long long v32 = self->_submodel;
                CGFloat v23 = [v10 submodel];
                unsigned __int8 v9 = [(TUIRenderModel *)v32 isEqualToRenderModel:v23];
LABEL_30:

LABEL_35:
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
    unsigned __int8 v9 = 0;
LABEL_32:

    goto LABEL_33;
  }
  unsigned __int8 v9 = 0;
LABEL_33:

  return v9;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  unsigned int v5 = [(TUIRenderModel *)self->_submodel handlesAlphaForInitialAppearance];
  if ((a3 & 1) != 0 || (alphCGFloat a = 0.0, v5)) {
    alphCGFloat a = self->_alpha;
  }
  id v7 = [(TUIRenderModel *)self->_submodel copyForInitialAppearanceWithFlags:v5 ^ 1 | a3];
  id v8 = [(TUIRenderModelTransform *)self copyWithAlpha:v7 submodel:alpha];

  return v8;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  unsigned int v5 = [(TUIRenderModel *)self->_submodel handlesAlphaForFinalAppearance];
  if ((a3 & 1) != 0 || (alphCGFloat a = 0.0, v5)) {
    alphCGFloat a = self->_alpha;
  }
  id v7 = [(TUIRenderModel *)self->_submodel copyForFinalAppearanceWithFlags:v5 ^ 1 | a3];
  id v8 = [(TUIRenderModelTransform *)self copyWithAlpha:v7 submodel:alpha];

  return v8;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_class();
  double v14 = [v11 submodel];
  if (v13 != objc_opt_class())
  {
    double v15 = 0;
LABEL_5:

    goto LABEL_7;
  }
  unsigned int v16 = [(TUIRenderModel *)self->_submodel conformsToProtocol:&OBJC_PROTOCOL___TUIRenderModelContaining];

  if (v16)
  {
    submodel = self->_submodel;
    double v14 = [v10 submodel];
    double v18 = [v11 submodel];
    double v15 = [(TUIRenderModel *)submodel computeContainerUpdateCurrent:v14 from:v18 tracker:v12 flags:a6];

    goto LABEL_5;
  }
  double v15 = 0;
LABEL_7:

  return v15;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5 = [(TUIRenderModel *)self->_submodel newToContainerPlusDeletesWithUpdate:a3 interests:a4];
  id v6 = [(TUIRenderModelTransform *)self copyWithAlpha:v5 submodel:self->_alpha];

  return v6;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  submodel = self->_submodel;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 submodel];
  id v9 = [(TUIRenderModel *)submodel newCurrentContainerPlusInsertsWithCurrent:v8 update:v6];

  [v7 alpha];
  id v10 = [v7 copyWithAlpha:v9];

  return v10;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (unint64_t)hash
{
  double v2 = [(TUIRenderModelTransform *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  CGFloat v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  if (self->_refId) {
    [v6 appendFormat:@" refid=%@", self->_refId];
  }
  if (self->_refInstance) {
    [v6 appendFormat:@" refinst=%@", self->_refInstance];
  }
  id v7 = +[NSNumber numberWithInteger:self->_zIndex];
  [v6 appendFormat:@" zIndex=%@", v7];

  id v8 = +[NSNumber numberWithDouble:self->_alpha];
  [v6 appendFormat:@" alpha=%@", v8];

  id v9 = NSStringFromCGPoint(self->_center);
  [v6 appendFormat:@" center=%@", v9];

  long long v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.CGFloat a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.CGFloat c = v10;
  *(_OWORD *)&transform.CGFloat tx = *(_OWORD *)&self->_transform.tx;
  id v11 = NSStringFromCGAffineTransform(&transform);
  [v6 appendFormat:@" transform=%@", v11];

  [v6 appendFormat:@" submodel=%@", self->_submodel];
  [v6 appendFormat:@">"];
  id v12 = [v6 copy];

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSubmodel:", self->_submodel);
  long long v5 = *(_OWORD *)&self->_transform.tx;
  long long v6 = *(_OWORD *)&self->_transform.a;
  *((_OWORD *)v4 + 11) = *(_OWORD *)&self->_transform.c;
  *((_OWORD *)v4 + 12) = v5;
  *((_OWORD *)v4 + 10) = v6;
  *((_OWORD *)v4 + 7) = self->_center;
  *((void *)v4 + 9) = self->_zIndex;
  *((void *)v4 + 7) = *(void *)&self->_alpha;
  *((void *)v4 + 10) = self->_itemIndex;
  id v7 = [(TUIAnimationGroupCollection *)self->_animationGroups copy];
  id v8 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v7;

  id v9 = [(TUIAnimationGroupRenderModelCollection *)self->_animationRenderModels copy];
  long long v10 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v9;

  objc_storeStrong((id *)v4 + 11, self->_liveTransform);
  objc_storeStrong((id *)v4 + 12, self->_refId);
  objc_storeStrong((id *)v4 + 13, self->_refInstance);
  long long v11 = *(_OWORD *)&self->_outsets.bottom;
  *((_OWORD *)v4 + 8) = *(_OWORD *)&self->_outsets.top;
  *((_OWORD *)v4 + 9) = v11;
  return v4;
}

- (id)submodel
{
  return self->_submodel;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->CGFloat a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->CGFloat c = v3;
  *(_OWORD *)&retstr->CGFloat tx = *(_OWORD *)&self[4].a;
  return self;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alphCGFloat a = a3;
}

- (TUIAnimationGroupRenderModelCollection)animationRenderModels
{
  return self->_animationRenderModels;
}

- (void)setAnimationRenderModels:(id)a3
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

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_int64_t zIndex = a3;
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

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (TUILiveTransform)liveTransform
{
  return self->_liveTransform;
}

- (void)setLiveTransform:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refInstance, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_liveTransform, 0);
  objc_storeStrong((id *)&self->_animationRenderModels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_submodel, 0);
}

@end