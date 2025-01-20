@interface TUIStyledBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- (BOOL)_needsRenderModel;
- (BOOL)_needsSubviewsRenderModelWithContext:(id)a3;
- (BOOL)groupedContainingIsGrouped;
- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3;
- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4;
- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3;
- (CGRect)computedErasableBounds;
- (TUILayout)contentChild;
- (UIEdgeInsets)groupedContainingInsets;
- (double)computedHeightAbovePivot;
- (id)effectiveGuideBottom;
- (id)effectiveGuideLeading;
- (id)effectiveGuideTop;
- (id)effectiveGuideTrailing;
- (id)groupedContainingLayouts;
- (id)guideProviderForLayout:(id)a3;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (unint64_t)groupedContainingContentMode;
- (unint64_t)groupedContainingInsetsMode;
- (void)_updateSpecifiedWidth;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)computeLayout;
- (void)groupedContainingValidateWithSize:(CGSize)a3;
- (void)layoutNonContentChildrenWithSize:(CGSize)a3;
- (void)onChildrenUpdated;
- (void)setContentChild:(id)a3;
@end

@implementation TUIStyledBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  v4 = [(TUILayout *)self box];
  [v4 insets];
  double v6 = v5;
  double v8 = v7;

  v9 = [(TUIStyledBoxLayout *)self contentChild];
  id v10 = [v9 validatedIntrinsicWidthConsideringSpecified];
  uint64_t v12 = v11;

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v10, v12, v6 + v8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  v4 = [(TUILayout *)self box];
  [v4 insets];
  double v6 = v5;
  double v8 = v7;

  v9 = [(TUIStyledBoxLayout *)self contentChild];
  id v10 = [v9 validatedIntrinsicHeightConsideringSpecified];
  uint64_t v12 = v11;

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v10, v12, v6 + v8);
}

- (double)computedHeightAbovePivot
{
  v3 = [(TUILayout *)self box];
  [v3 insets];
  double v5 = v4;

  double v6 = [(TUIStyledBoxLayout *)self contentChild];
  [v6 computedHeightAbovePivot];
  double v8 = v5 + v7;

  return v8;
}

- (void)computeLayout
{
  id v19 = [(TUILayout *)self box];
  [v19 insets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v20 = [(TUIStyledBoxLayout *)self contentChild];
  [(TUILayout *)self flexedWidth];
  [(TUILayout *)self flexedWidth];
  [v20 setFlexedWidth:v11 - v6 - v10];
  [(TUILayout *)self flexedHeight];
  [(TUILayout *)self flexedHeight];
  [v20 setFlexedHeight:v12 - v4 - v8];
  [(TUILayout *)self computeWidth];
  [v20 setContainingWidth:v13 - v6 - v10];
  [(TUILayout *)self containingHeight];
  [(TUILayout *)self containingHeight];
  [v20 setContainingHeight:v14 - v4 - v8];
  [v20 validateLayout];
  [v20 setComputedOrigin:v6, v4];
  [v20 computedTransformedSize];
  double v16 = v6 + v10 + v15;
  double v18 = v4 + v8 + v17;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v16, v18);
  -[TUIStyledBoxLayout layoutNonContentChildrenWithSize:](self, "layoutNonContentChildrenWithSize:", v16, v18);
}

- (void)layoutNonContentChildrenWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = [(TUILayout *)self children];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v10 = [v9 box];
        BOOL v11 = [v10 role] == 0;

        if (!v11)
        {
          [v9 setContainingWidth:width];
          [v9 setContainingHeight:height];
          [v9 computedWidth];
          double v13 = NAN;
          if ((v12 & 0x8000000000000) != 0) {
            double v13 = width;
          }
          [v9 setFlexedWidth:v13];
          [v9 computedHeight];
          double v15 = NAN;
          if ((v14 & 0x8000000000000) != 0) {
            double v15 = height;
          }
          [v9 setFlexedHeight:v15];
          [v9 validateLayout];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  double v4 = [(TUIStyledBoxLayout *)self contentChild];
  id v5 = [v4 computedWidth];
  uint64_t v7 = v6;
  double v8 = [(TUILayout *)self box];
  [v8 insets];
  double v10 = v9;
  double v12 = v11;

  double v13 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v5, v7, v10 + v12);
  return v13;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  double v4 = [(TUIStyledBoxLayout *)self contentChild];
  id v5 = [v4 computedHeight];
  uint64_t v7 = v6;
  double v8 = [(TUILayout *)self box];
  [v8 insets];
  double v10 = v9;
  double v12 = v11;

  double v13 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v5, v7, v10 + v12);
  return v13;
}

- (void)onChildrenUpdated
{
  v3.receiver = self;
  v3.super_class = (Class)TUIStyledBoxLayout;
  [(TUILayout *)&v3 onChildrenUpdated];
  [(TUILayout *)self invalidateIntrinsicSize];
  [(TUIStyledBoxLayout *)self _updateSpecifiedWidth];
  objc_storeWeak((id *)&self->_contentChild, 0);
}

- (void)_updateSpecifiedWidth
{
  id v9 = [(TUIStyledBoxLayout *)self contentChild];
  objc_super v3 = [(TUILayout *)self box];
  [v3 width];
  if ((v4 & 0x6000000000000) == 0x2000000000000)
  {
    [v9 specifiedWidth];
    uint64_t v6 = HIWORD(v5) & 7;
    BOOL v8 = v6 == 4 || v6 == 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  [(TUILayout *)self setSpecifiedWidthComputeInherited:v8];
}

- (BOOL)_needsRenderModel
{
  objc_super v3 = [(TUILayout *)self box];
  uint64_t v4 = [v3 backgroundColor];
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(TUILayout *)self box];
    uint64_t v7 = [v6 shadowColor];
    if (v7)
    {
      char v5 = 1;
    }
    else
    {
      BOOL v8 = [(TUILayout *)self box];
      id v9 = [v8 borderColor];
      if (v9)
      {
        char v5 = 1;
      }
      else
      {
        double v10 = [(TUILayout *)self box];
        if ([v10 clipsToBounds])
        {
          char v5 = 1;
        }
        else
        {
          double v11 = [(TUILayout *)self box];
          double v12 = [v11 blendMode];
          char v5 = v12 != 0;
        }
      }
    }
  }

  return v5;
}

- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3
{
  return 0;
}

- (BOOL)_needsSubviewsRenderModelWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(TUILayout *)self box];
  if ([v5 clipsToBounds])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(TUILayout *)self box];
    BOOL v8 = [v7 blendMode];
    if (v8)
    {
      BOOL v6 = 1;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)TUIStyledBoxLayout;
      BOOL v6 = [(TUILayout *)&v10 shouldUseSubviewRenderModelWithContext:v4];
    }
  }
  return v6;
}

- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3
{
  return ![(TUIStyledBoxLayout *)self _needsSubviewsRenderModelWithContext:a3];
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if ([(TUIStyledBoxLayout *)self _needsRenderModel]
    && ![(TUIStyledBoxLayout *)self _needsSubviewsRenderModelWithContext:v10])
  {
    double v12 = [_TUIStyledBoxStyler alloc];
    [v10 contentsScale];
    v54 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v12, "initWithLayout:contentsScale:", self);
    double v13 = [[_TUIStyledLayerConfig alloc] initWithStyler:v54];
    uint64_t v14 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(TUILayout *)self renderModelSizeWithContext:v10];
    -[TUIRenderModelLayer setSize:](v14, "setSize:");
    double v15 = [(TUILayout *)self box];
    long long v16 = [v15 identifier];
    long long v17 = [v16 tui_identifierByAppendingString:@"background"];
    [(TUIRenderModelLayer *)v14 setIdentifier:v17];

    if (v14)
    {
      long long v18 = [v10 convertRenderModel:v14 toKind:4];

      double y = CGPointZero.y;
      double a = a5->a;
      double b = a5->b;
      double tx = a5->tx;
      double c = a5->c;
      double ty = a5->ty;
      double d = a5->d;
      [v18 size];
      double v20 = v19;
      [v18 size];
      double v22 = v21;
      double v24 = a5->a;
      double v23 = a5->b;
      double v25 = a5->c;
      double v26 = a5->d;
      double v27 = a5->tx;
      double v28 = a5->ty;
      [v10 contentsScale];
      double v29 = v20 * -0.5;
      double v30 = v27 + v22 * -0.5 * v25 + v24 * (v20 * -0.5);
      double v31 = v28 + v22 * -0.5 * v26 + v23 * v29;
      double v33 = tx + y * c + a * CGPointZero.x + TUIPointRoundedForScale(v30, v31, v32) - v30;
      double v35 = ty + y * d + b * CGPointZero.x + v34 - v31;
      memset(&v60, 0, sizeof(v60));
      long long v36 = *(_OWORD *)&a5->c;
      *(_OWORD *)&t1.double a = *(_OWORD *)&a5->a;
      *(_OWORD *)&t1.double c = v36;
      *(_OWORD *)&t1.double tx = *(_OWORD *)&a5->tx;
      CGAffineTransformMakeTranslation(&t2, -v33, -v35);
      CGAffineTransformConcat(&v60, &t1, &t2);
      double v37 = v60.tx;
      [v10 contentsScale];
      v60.double tx = TUIFloatRoundedForScale(v37, v38);
      double v39 = v60.ty;
      [v10 contentsScale];
      v60.double ty = TUIFloatRoundedForScale(v39, v40);
      v41 = [[TUIRenderModelTransform alloc] initWithSubmodel:v18];
      -[TUIRenderModelTransform setCenter:](v41, "setCenter:", v33, v35);
      CGAffineTransform v57 = v60;
      [(TUIRenderModelTransform *)v41 setTransform:&v57];
      v42 = [v10 currentLiveTransform];
      [(TUIRenderModelTransform *)v41 setLiveTransform:v42];

      v43 = [(TUILayout *)self box];
      [v43 renderOutsets];
      -[TUIRenderModelTransform setOutsets:](v41, "setOutsets:");

      [(TUIRenderModelTransform *)v41 setZIndex:(char *)[(TUILayout *)self computeZIndexWithDefault:-999] - 1];
      v44 = [(TUILayout *)self computedRefIdWithContext:v10];
      [(TUIRenderModelTransform *)v41 setRefId:v44];

      v45 = [(TUILayout *)self computedRefInstanceWithContext:v10];
      [(TUIRenderModelTransform *)v41 setRefInstance:v45];

      [v11 addObject:v41];
    }
  }
  long long v46 = *(_OWORD *)&a5->c;
  v56[0] = *(_OWORD *)&a5->a;
  v56[1] = v46;
  v56[2] = *(_OWORD *)&a5->tx;
  v55.receiver = self;
  v55.super_class = (Class)TUIStyledBoxLayout;
  [(TUILayout *)&v55 appendChildRenderModelCompatibleWithKind:a3 context:v10 transform:v56 toModels:v11];
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (![(TUIStyledBoxLayout *)self _needsRenderModel]) {
    goto LABEL_8;
  }
  if (a3 < 4)
  {
    if (a3 == 3)
    {
      uint64_t v7 = objc_opt_new();
      [(TUILayout *)self computedNaturalSize];
      memset(&v24, 0, sizeof(v24));
      CGAffineTransformMakeTranslation(&v24, v13 * 0.5, v14 * 0.5);
      CGAffineTransform v23 = v24;
      v22.receiver = self;
      v22.super_class = (Class)TUIStyledBoxLayout;
      [(TUILayout *)&v22 appendChildRenderModelCompatibleWithKind:3 context:v6 transform:&v23 toModels:v7];
      double v15 = [v6 renderModelConvertModels:v7 toKind:3];
      long long v16 = [_TUIStyledBoxStyler alloc];
      [v6 contentsScale];
      long long v17 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v16, "initWithLayout:contentsScale:", self);
      long long v18 = [[_TUIStyledLayerConfig alloc] initWithStyler:v17];
      double v12 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v15, v18, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      [(TUILayout *)self renderModelSizeWithContext:v6];
      -[TUIRenderModelLayer setSize:](v12, "setSize:");
      double v19 = [(TUILayout *)self box];
      double v20 = [v19 identifier];
      [(TUIRenderModelLayer *)v12 setIdentifier:v20];

      goto LABEL_7;
    }
LABEL_8:
    double v12 = 0;
    goto LABEL_9;
  }
  if (![(TUIStyledBoxLayout *)self _needsSubviewsRenderModelWithContext:v6]) {
    goto LABEL_8;
  }
  uint64_t v7 = [v6 renderModelForContainerLayout:self kind:6];
  BOOL v8 = [_TUIStyledBoxStyler alloc];
  [v6 contentsScale];
  id v9 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v8, "initWithLayout:contentsScale:", self);
  id v10 = [(TUILayout *)self box];
  id v11 = [v10 identifier];
  double v12 = +[TUIContainerView renderModelWithSubviewsModel:v7 style:v9 identifier:v11];

  [(TUILayout *)self renderModelSizeWithContext:v6];
  -[TUIRenderModelLayer setSize:](v12, "setSize:");
LABEL_7:

LABEL_9:
  return v12;
}

- (CGRect)computedErasableBounds
{
  objc_super v3 = [(TUILayout *)self box];
  if ([v3 clipsToBounds])
  {
    [(TUILayout *)self computedErasableBoundsPrimitive];
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)TUIStyledBoxLayout;
    [(TUILayout *)&v28 computedErasableBounds];
  }
  double x = v4;
  double y = v5;
  double width = v6;
  double height = v7;

  double v12 = [(TUILayout *)self box];
  [v12 shadowOpacity];
  double v14 = v13;

  if (v14 != 0.0)
  {
    double v15 = [(TUILayout *)self box];
    [v15 shadowRadius];
    double v17 = v16;

    long long v18 = [(TUILayout *)self box];
    [v18 shadowOffset];
    double v20 = v19;
    double v22 = v21;
    double v23 = v17 + v17;

    v32.origin.double x = x - (v23 - v20);
    v32.origin.double y = y - (v23 - v22);
    v32.size.double width = width - (-(v23 + v20) - (v23 - v20));
    v32.size.double height = height - (-(v23 + v22) - (v23 - v22));
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    CGRect v30 = CGRectUnion(v29, v32);
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (TUILayout)contentChild
{
  p_contentChildouble d = &self->_contentChild;
  WeakRetainedouble d = objc_loadWeakRetained((id *)&self->_contentChild);

  if (!WeakRetained)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v5 = [(TUILayout *)self children];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v9 box];
          BOOL v11 = [v10 role] == 0;

          if (v11)
          {
            objc_storeWeak((id *)p_contentChild, v9);
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  id v12 = objc_loadWeakRetained((id *)p_contentChild);

  return (TUILayout *)v12;
}

- (id)guideProviderForLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(TUILayout *)self layoutAncestor];
  id v6 = [v5 guideProviderForLayout:v4];

  return v6;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 layoutAncestor];
  if (v7 == self)
  {
    id v9 = [v6 box];
    if ([v9 role])
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      id v10 = [(TUILayout *)self layoutAncestor];
      unsigned __int8 v8 = [v10 shouldUseDefaultGuideForLayout:self edge:a4];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)effectiveGuideTop
{
  v2 = [(TUIStyledBoxLayout *)self contentChild];
  objc_super v3 = [v2 effectiveGuideTop];

  return v3;
}

- (id)effectiveGuideBottom
{
  v2 = [(TUIStyledBoxLayout *)self contentChild];
  objc_super v3 = [v2 effectiveGuideBottom];

  return v3;
}

- (id)effectiveGuideLeading
{
  v2 = [(TUIStyledBoxLayout *)self contentChild];
  objc_super v3 = [v2 effectiveGuideLeading];

  return v3;
}

- (id)effectiveGuideTrailing
{
  v2 = [(TUIStyledBoxLayout *)self contentChild];
  objc_super v3 = [v2 effectiveGuideTrailing];

  return v3;
}

- (BOOL)groupedContainingIsGrouped
{
  v2 = [(TUILayout *)self box];
  unsigned __int8 v3 = [v2 grouped];

  return v3;
}

- (id)groupedContainingLayouts
{
  uint64_t v2 = [(TUIStyledBoxLayout *)self contentChild];
  unsigned __int8 v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)groupedContainingValidateWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

  -[TUIStyledBoxLayout layoutNonContentChildrenWithSize:](self, "layoutNonContentChildrenWithSize:", width, height);
}

- (UIEdgeInsets)groupedContainingInsets
{
  uint64_t v2 = [(TUILayout *)self box];
  [v2 insets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (void)setContentChild:(id)a3
{
}

- (void).cxx_destruct
{
}

@end