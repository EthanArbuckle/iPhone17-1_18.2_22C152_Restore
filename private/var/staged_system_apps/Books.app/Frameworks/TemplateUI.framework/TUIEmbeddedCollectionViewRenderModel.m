@interface TUIEmbeddedCollectionViewRenderModel
- (BOOL)acceptsDrop;
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSString)uid;
- (NSUUID)UUID;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIElementActionTriggerHandler)dropHandler;
- (TUIEmbeddedCollectionViewRenderModel)initWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5;
- (TUIIdentifier)ancestorScrollIdentifier;
- (TUIIdentifier)identifier;
- (TUIIdentifier)scrollIdentifier;
- (TUIRenderUpdateCollectionController)updateController;
- (TUIScrollablePolicy)scrollPolicy;
- (UIEdgeInsets)_computedContentInsetsWithRenderModel:(id)a3;
- (UIEdgeInsets)gradientFraction;
- (UIEdgeInsets)gradientInsets;
- (double)decelerationRate;
- (double)pageGap;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAcceptsDrop:(BOOL)a3;
- (void)setAncestorScrollIdentifier:(id)a3;
- (void)setAnimationGroups:(id)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDropHandler:(id)a3;
- (void)setGradientFraction:(UIEdgeInsets)a3;
- (void)setGradientInsets:(UIEdgeInsets)a3;
- (void)setIdentifier:(id)a3;
- (void)setPageGap:(double)a3;
- (void)setScrollIdentifier:(id)a3;
- (void)setScrollPolicy:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setUpdateController:(id)a3;
@end

@implementation TUIEmbeddedCollectionViewRenderModel

- (TUIEmbeddedCollectionViewRenderModel)initWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TUIEmbeddedCollectionViewRenderModel;
  v12 = [(TUIEmbeddedCollectionViewRenderModel *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updateController, a3);
    v14 = (NSString *)[v10 copy];
    uid = v13->_uid;
    v13->_uid = v14;

    v16 = (NSUUID *)[v11 copy];
    UUID = v13->_UUID;
    v13->_UUID = v16;
  }
  return v13;
}

- (unint64_t)kind
{
  return 10;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  v7 = [(TUIEmbeddedCollectionViewRenderModel *)self identifier];
  unsigned int v8 = [v6 resourceCollectorShouldIncludeEmbeddedForIdentifier:v7];

  if (v8)
  {
    id v9 = [(TUIEmbeddedCollectionViewRenderModel *)self identifier];
    id v10 = [v6 resourceCollectorViewStateForIdentifier:v9];

    if (v10)
    {
      [v10 contentOffset];
    }
    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeTranslation(&t1, -x, -y);
    long long v13 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tdouble x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v17, &t1, &v15);
    v14 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
    CGAffineTransform v15 = v17;
    [v14 appendResourcesToCollector:v6 transform:&v15];
  }
}

- (UIEdgeInsets)_computedContentInsetsWithRenderModel:(id)a3
{
  if (a3)
  {
    [a3 insets];
  }
  else
  {
    v3.i64[0] = *(void *)&UIEdgeInsetsZero.top;
    v4.i64[0] = *(void *)&UIEdgeInsetsZero.left;
    v5.i64[0] = *(void *)&UIEdgeInsetsZero.bottom;
    v6.i64[0] = *(void *)&UIEdgeInsetsZero.right;
  }
  if (self->_gradientInsets.left < 0.0) {
    v4.i64[0] = *(void *)&self->_gradientInsets.left;
  }
  if (self->_gradientInsets.right < 0.0) {
    v6.i64[0] = *(void *)&self->_gradientInsets.right;
  }
  *(double *)v7.i64 = ceil(fabs(*(double *)v3.i64));
  *(double *)v8.i64 = ceil(fabs(*(double *)v4.i64));
  *(double *)v9.i64 = ceil(fabs(*(double *)v5.i64));
  *(double *)v10.i64 = ceil(fabs(*(double *)v6.i64));
  *(double *)v3.i64 = -*(double *)v3.i64;
  v12.f64[0] = NAN;
  v12.f64[1] = NAN;
  int8x16_t v13 = (int8x16_t)vnegq_f64(v12);
  v3.i64[0] = vbslq_s8(v13, v7, v3).u64[0];
  *(double *)v4.i64 = -*(double *)v4.i64;
  v4.i64[0] = vbslq_s8(v13, v8, v4).u64[0];
  *(double *)v5.i64 = -*(double *)v5.i64;
  v5.i64[0] = vbslq_s8(v13, v9, v5).u64[0];
  *(double *)v6.i64 = -*(double *)v6.i64;
  v6.i64[0] = vbslq_s8(v13, v10, v6).u64[0];
  result.right = *(double *)v6.i64;
  result.bottom = *(double *)v5.i64;
  result.left = *(double *)v4.i64;
  result.top = *(double *)v3.i64;
  return result;
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  int8x16_t v13 = [(TUIEmbeddedCollectionViewRenderModel *)self identifier];
  v14 = [v10 viewStateForIdentifier:v13];

  if (v14)
  {
    [v14 contentOffset];
    double x = v15;
    double y = v17;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  objc_super v19 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
  long long v20 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v35.c = v20;
  *(_OWORD *)&v35.tdouble x = *(_OWORD *)&a4->tx;
  [(TUIEmbeddedCollectionViewRenderModel *)self _computedContentInsetsWithRenderModel:v19];
  double v22 = v21;
  double v24 = v23;
  if ([v19 layoutDirection] == (char *)&def_141F14 + 2)
  {
    [(TUIEmbeddedCollectionViewRenderModel *)self size];
    double v26 = v25;
    v27 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
    [v27 size];
    double v29 = v28;

    CGAffineTransformMakeTranslation(&v32, x + v24 + v26 - v29, -(y + v22));
    CGAffineTransform t1 = v35;
    p_CGAffineTransform t2 = &v32;
  }
  else
  {
    CGAffineTransformMakeTranslation(&t2, -(x + v24), -(y + v22));
    CGAffineTransform t1 = v35;
    p_CGAffineTransform t2 = &t2;
  }
  CGAffineTransformConcat(&v35, &t1, p_t2);
  v31 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
  CGAffineTransform t1 = v35;
  [v31 appendReferencesToCollector:v10 transform:&t1 query:v12 liveTransformResolver:v11];
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  int8x16_t v7 = TUIDynamicCast(v6, v5);

  if (TUIRenderModelIsEqualToRenderModel(self, v7))
  {
    [v7 gradientInsets];
    BOOL v12 = self->_gradientInsets.left == v11 && self->_gradientInsets.top == v8;
    BOOL v13 = v12 && self->_gradientInsets.right == v10;
    if (v13 && self->_gradientInsets.bottom == v9)
    {
      scrollPolicdouble y = self->_scrollPolicy;
      double v17 = [v7 scrollPolicy];
      if (scrollPolicy != v17
        || (int acceptsDrop = self->_acceptsDrop, acceptsDrop != [v7 acceptsDrop])
        || (double decelerationRate = self->_decelerationRate, [v7 decelerationRate], decelerationRate != v20))
      {
        BOOL v15 = 0;
LABEL_20:

        goto LABEL_21;
      }
      dropHandler = self->_dropHandler;
      double v22 = [v7 dropHandler];
      if (dropHandler == v22
        || (double v23 = self->_dropHandler,
            [v7 dropHandler],
            int8x16_t v3 = objc_claimAutoreleasedReturnValue(),
            [(TUIElementActionTriggerHandler *)v23 isEqual:v3]))
      {
        updateController = self->_updateController;
        double v26 = [v7 updateController];
        BOOL v15 = updateController == v26;

        if (dropHandler == v22)
        {
          double v22 = dropHandler;
          goto LABEL_25;
        }
      }
      else
      {
        BOOL v15 = 0;
      }

LABEL_25:
      goto LABEL_20;
    }
  }
  BOOL v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  uint64_t v2 = [(TUIRenderUpdateCollectionController *)self->_updateController renderModel];
  int8x16_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    int8x16_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    int8x16_t v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (unint64_t)hash
{
  uint64_t v2 = [(TUIEmbeddedCollectionViewRenderModel *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
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

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (void)setUpdateController:(id)a3
{
}

- (TUIScrollablePolicy)scrollPolicy
{
  return self->_scrollPolicy;
}

- (void)setScrollPolicy:(id)a3
{
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_int acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_double decelerationRate = a3;
}

- (double)pageGap
{
  return self->_pageGap;
}

- (void)setPageGap:(double)a3
{
  self->_pageGap = a3;
}

- (UIEdgeInsets)gradientInsets
{
  double top = self->_gradientInsets.top;
  double left = self->_gradientInsets.left;
  double bottom = self->_gradientInsets.bottom;
  double right = self->_gradientInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientInsets:(UIEdgeInsets)a3
{
  self->_gradientInsets = a3;
}

- (UIEdgeInsets)gradientFraction
{
  double top = self->_gradientFraction.top;
  double left = self->_gradientFraction.left;
  double bottom = self->_gradientFraction.bottom;
  double right = self->_gradientFraction.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientFraction:(UIEdgeInsets)a3
{
  self->_gradientFraction = a3;
}

- (TUIIdentifier)scrollIdentifier
{
  return self->_scrollIdentifier;
}

- (void)setScrollIdentifier:(id)a3
{
}

- (TUIIdentifier)ancestorScrollIdentifier
{
  return self->_ancestorScrollIdentifier;
}

- (void)setAncestorScrollIdentifier:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_ancestorScrollIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollIdentifier, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end