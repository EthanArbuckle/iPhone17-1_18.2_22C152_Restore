@interface TUIImageBoxLayout
+ (const)_storageDataset;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified;
- (CGRect)computedErasableBounds;
- (TUIImageBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (TUIImageResource)intrinsicImageResource;
- (double)computeIntrinsicAspectRatio;
- (double)constrainComputedHeight:(double)a3;
- (double)constrainComputedWidth:(double)a3;
- (id)_newImageResourcesWithContext:(id)a3;
- (id)_newIntrinsicImageResource;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)_computeIntrinsicContentSize;
- (void)computeLayout;
- (void)dealloc;
- (void)imageResourceDidChangeIntrinsicSize:(id)a3;
- (void)onInvalidateIntrinsicSize;
- (void)setIntrinsicImageResource:(id)a3;
@end

@implementation TUIImageBoxLayout

+ (const)_storageDataset
{
  return (const Dataset *)TUIImageLayoutStorageDataset;
}

- (TUIImageBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TUIImageBoxLayout;
  result = [(TUILayout *)&v6 initWithModel:a3 parent:a4 controller:a5];
  if (result) {
    result->_intrinsicContentSize = CGSizeZero;
  }
  return result;
}

- (void)dealloc
{
  [(TUIImageResource *)self->_intrinsicImageResource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)TUIImageBoxLayout;
  [(TUIImageBoxLayout *)&v3 dealloc];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicWidth
{
  objc_super v3 = [(TUILayout *)self box];
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 intrinsicWidth];

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicHeight
{
  objc_super v3 = [(TUILayout *)self box];
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 intrinsicHeight];

  return v4;
}

- (void)imageResourceDidChangeIntrinsicSize:(id)a3
{
  v4 = +[TUITransaction currentOrImplicitTransaction];
  v5 = [(TUILayout *)self controller];
  objc_super v6 = [v5 transactionCoordinator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1797A0;
  v7[3] = &unk_257130;
  v7[4] = self;
  [v6 scheduleLayoutUpdateWithTransaction:v4 block:v7];
}

- (id)_newIntrinsicImageResource
{
  objc_super v3 = [(TUILayout *)self box];
  v4 = [v3 urlString];

  if (v4)
  {
    v5 = [(TUILayout *)self box];
    objc_super v6 = [v5 urlString];
    v7 = [(TUILayout *)self box];
    v8 = [v7 baseURL];
    v9 = +[NSURL URLWithString:v6 relativeToURL:v8];

    v10 = [(TUILayout *)self controller];
    v11 = [v10 manager];
    v12 = [v11 imageResourceCache];
    v13 = [(TUILayout *)self controller];
    [v13 contentsScale];
    v14 = [v12 imageResourceForURL:v9];
  }
  else
  {
    v15 = [(TUILayout *)self box];
    v16 = [v15 resourceKind];

    if (!v16)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v17 = [(TUILayout *)self controller];
    v10 = [(TUILayout *)self box];
    v11 = [v10 resourceKind];
    v12 = [(TUILayout *)self box];
    v13 = [v12 resourceInstance];
    v18 = [(TUILayout *)self box];
    v19 = [v18 resourceOptions];
    v14 = [v17 intrinsicImageResourceForKind:v11 instance:v13 options:v19];

    v9 = v17;
  }

LABEL_6:
  [v14 loadIntrinsicSize];
  return v14;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  id v43 = a3;
  [(TUILayout *)self computedNaturalSize];
  double v5 = v4;
  double v7 = v6;
  [v43 contentsScale];
  double v9 = v8;
  v10 = [(TUILayout *)self controller];
  v11 = [v10 manager];
  v12 = [v11 imageResourceCache];

  v13 = [(TUILayout *)self box];
  v14 = [v13 urlString];

  if (v14)
  {
    v15 = [(TUILayout *)self box];
    v16 = [v15 urlString];
    v17 = [(TUILayout *)self box];
    v18 = [v17 baseURL];
    v19 = [v12 imageResourceForTemplatedURL:v16 baseURL:v18 naturalSize:v5 contentsScale:v7];
LABEL_5:

    goto LABEL_6;
  }
  v20 = [(TUILayout *)self box];
  v21 = [v20 resourceKind];

  if (v21)
  {
    v15 = [(TUILayout *)self controller];
    v16 = [(TUILayout *)self box];
    v17 = [v16 resourceKind];
    v18 = [(TUILayout *)self box];
    v22 = [v18 resourceInstance];
    v23 = [(TUILayout *)self box];
    v24 = [v23 resourceOptions];
    v19 = [v15 imageResourceForKind:v17 naturalSize:v22 contentsScale:v24 instance:v5 options:v7, v9];

    goto LABEL_5;
  }
  v19 = 0;
LABEL_6:
  v25 = [(TUILayout *)self box];
  v26 = [v25 maskColor];

  if (v26)
  {
    v27 = [(TUILayout *)self box];
    v28 = [v27 maskColor];
    v29 = [v12 imageResource:v19 tintedWithColor:v28];
  }
  else
  {
    v29 = v19;
  }
  if (objc_opt_respondsToSelector())
  {
    v30 = [v29 filterOptions];
  }
  else
  {
    v30 = 0;
  }
  v31 = [(TUILayout *)self box];
  v32 = [v31 filter];

  if (v32)
  {
    [(TUILayout *)self computedNaturalSize];
    double v34 = v33;
    double v36 = v35;
    [v43 contentsScale];
    double v38 = v37;
    v39 = [(TUILayout *)self box];
    v40 = [v39 filter];
    uint64_t v41 = [v12 imageResource:v29 naturalSize:v40 contentsScale:v30 withFilter:v34 filterOptions:v36, v38];

    v29 = (void *)v41;
  }

  return v29;
}

- (void)onInvalidateIntrinsicSize
{
  v3.receiver = self;
  v3.super_class = (Class)TUIImageBoxLayout;
  [(TUILayout *)&v3 onInvalidateIntrinsicSize];
  self->_intrinsicContentSize = CGSizeZero;
}

- (void)_computeIntrinsicContentSize
{
  double height = CGSizeZero.height;
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
  {
    float v6 = COERCE_FLOAT([(TUIImageBoxLayout *)self specifiedIntrinsicWidth]);
    float v7 = COERCE_FLOAT([(TUIImageBoxLayout *)self specifiedIntrinsicHeight]);
    p_intrinsicContentSize->width = v6;
    p_intrinsicContentSize->double height = v7;
    self->_usingPlaceholderIntrinsicSize = 0;
  }
}

- (double)constrainComputedWidth:(double)a3
{
  double v5 = [(TUILayout *)self box];
  [v5 maxAspectRatio];
  double v7 = v6;

  [(TUIImageBoxLayout *)self computeIntrinsicAspectRatio];
  if (v8 > v7) {
    return v7 * (a3 / v8);
  }
  return a3;
}

- (double)constrainComputedHeight:(double)a3
{
  double v5 = [(TUILayout *)self box];
  [v5 maxAspectRatio];
  double v7 = v6;

  [(TUIImageBoxLayout *)self computeIntrinsicAspectRatio];
  if (v8 > v7) {
    return v8 * a3 / v7;
  }
  return a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  [(TUIImageBoxLayout *)self _computeIntrinsicContentSize];
  double width = self->_intrinsicContentSize.width;
  if (width <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&unsigned int v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  [(TUIImageBoxLayout *)self _computeIntrinsicContentSize];
  double height = self->_intrinsicContentSize.height;
  if (height <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&unsigned int v5 = height;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified
{
  unint64_t v4 = [(TUILayout *)self specifiedWidth];
  uint64_t v6 = v5;
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    [(TUILayout *)self computeDerivedWidth];
    if (v7 <= -3.40282347e38)
    {
      uint64_t v8 = 4286578687;
    }
    else
    {
      uint64_t v8 = 2139095039;
      BOOL v9 = v7 < 3.40282347e38;
      float v10 = v7;
      if (v9) {
        uint64_t v8 = LODWORD(v10);
      }
    }
    unint64_t v4 = v8 | v4 & 0xFFFFFFFF00000000;
    v6 &= 0xFFE8FFFFFFFFFFFFLL;
  }
  v12 = [(TUILayout *)self validatedIntrinsicWidth];

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic(v4, v6, (uint64_t)v12, v11);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified
{
  unint64_t v4 = [(TUILayout *)self specifiedWidth];
  uint64_t v6 = v5;
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    [(TUILayout *)self computeDerivedHeight];
    if (v7 <= -3.40282347e38)
    {
      uint64_t v8 = 4286578687;
    }
    else
    {
      uint64_t v8 = 2139095039;
      BOOL v9 = v7 < 3.40282347e38;
      float v10 = v7;
      if (v9) {
        uint64_t v8 = LODWORD(v10);
      }
    }
    unint64_t v4 = v8 | v4 & 0xFFFFFFFF00000000;
    v6 &= 0xFFE8FFFFFFFFFFFFLL;
  }
  v12 = [(TUILayout *)self validatedIntrinsicHeight];

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic(v4, v6, (uint64_t)v12, v11);
}

- (double)computeIntrinsicAspectRatio
{
  [(TUIImageBoxLayout *)self _computeIntrinsicContentSize];
  double width = self->_intrinsicContentSize.width;
  double result = 1.0;
  if (width > 0.0) {
    return self->_intrinsicContentSize.height / width;
  }
  return result;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self computeHeight];
  double v6 = fmax(v5, 1.0);
  double v7 = fmax(v4, 1.0);

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v7, v6);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v44 = a4;
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:");
  if (a3 - 1 >= 2)
  {
    double v9 = v6;
    double v10 = v7;
    if (self->_usingPlaceholderIntrinsicSize) {
      id v11 = 0;
    }
    else {
      id v11 = [(TUIImageBoxLayout *)self _newImageResourcesWithContext:v44];
    }
    uint64_t v41 = v11;
    v12 = [v11 url];
    v13 = [(TUILayout *)self box];
    uint64_t v14 = TUIResourceLoadForURL(v12, (uint64_t)[v13 load]);

    v15 = [(TUILayout *)self box];
    [v15 cornerRadius];
    double v17 = v16;

    v18 = [(TUILayout *)self box];
    id v43 = [v18 fallbackColor];

    v19 = [(TUILayout *)self box];
    v42 = [v19 contentsGravity];

    v20 = [(TUILayout *)self box];
    [v20 opacity];
    double v22 = v21;

    v23 = [(TUILayout *)self box];
    if ([v23 hflipForRTL]) {
      BOOL v40 = (char *)[(TUILayout *)self computedLayoutDirection] == (char *)&def_141F14 + 2;
    }
    else {
      BOOL v40 = 0;
    }

    v24 = [(TUILayout *)self box];
    id v25 = [v24 crossfadesContents];

    v26 = [TUIImageLayerConfig alloc];
    [v44 contentsScale];
    double v28 = v27;
    v29 = [(TUILayout *)self box];
    unsigned __int8 v30 = [v29 continuousCorners];
    v31 = [(TUILayout *)self box];
    unsigned __int8 v32 = [v31 shouldRasterize];
    double v33 = [(TUILayout *)self box];
    double v34 = [v33 blendMode];
    BYTE1(v39) = v32;
    LOBYTE(v39) = v30;
    double v35 = -[TUIImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v26, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v41, v14, v43, v42, v40, v25, v28, v17, v22, v39, v34);

    uint64_t v8 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v35, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v8, "setSize:", v9, v10);
    double v36 = [(TUILayout *)self box];
    double v37 = [v36 identifier];
    [(TUIRenderModelLayer *)v8 setIdentifier:v37];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CGRect)computedErasableBounds
{
  [(TUILayout *)self computedBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TUILayout *)self box];
  v12 = [v11 filter];

  if (v12)
  {
    v13 = [(TUILayout *)self controller];
    uint64_t v14 = [v13 manager];
    v15 = [v14 filterRegistry];
    double v16 = [v15 imageFilterWithIdentifier:v12];
  }
  else
  {
    double v16 = 0;
  }
  if ([v16 supportsOptions])
  {
    [(TUILayout *)self computedNaturalSize];
    double v18 = v17;
    double v20 = v19;
    double v21 = [(TUILayout *)self controller];
    [v21 contentsScale];
    double v23 = v22;

    v24 = [(TUILayout *)self box];
    id v25 = [v24 urlString];

    if (v25)
    {
      v26 = [(TUILayout *)self controller];
      double v27 = [v26 manager];
      double v28 = [v27 imageResourceCache];
      v29 = [(TUILayout *)self box];
      unsigned __int8 v30 = [v29 urlString];
      v31 = [(TUILayout *)self box];
      unsigned __int8 v32 = [v31 baseURL];
      uint64_t v33 = [v28 imageResourceForTemplatedURL:v30 baseURL:v32 naturalSize:v18 contentsScale:v20];
    }
    else
    {
      v45 = [(TUILayout *)self box];
      v46 = [v45 resourceKind];

      if (!v46)
      {
        v47 = 0;
        goto LABEL_12;
      }
      v26 = [(TUILayout *)self controller];
      double v27 = [(TUILayout *)self box];
      double v28 = [v27 resourceKind];
      v29 = [(TUILayout *)self box];
      unsigned __int8 v30 = [v29 resourceInstance];
      v31 = [(TUILayout *)self box];
      unsigned __int8 v32 = [v31 resourceOptions];
      uint64_t v33 = [v26 imageResourceForKind:v28 naturalSize:v30 contentsScale:v32 instance:v18 options:v20];
    }
    v47 = (void *)v33;

LABEL_12:
    if (objc_opt_respondsToSelector())
    {
      v48 = [v47 filterOptions];
    }
    else
    {
      v48 = 0;
    }
    [v16 insetsForSize:v48 contentsScale:v18 options:v20 v23];
    double v4 = v4 - v49;
    double v6 = v6 - v50;
    double v8 = v8 + v49 + v51;
    double v10 = v10 + v50 + v52;

    goto LABEL_16;
  }
  if (v16)
  {
    [(TUILayout *)self computedNaturalSize];
    double v35 = v34;
    double v37 = v36;
    double v38 = [(TUILayout *)self controller];
    [v38 contentsScale];
    double v40 = v39;

    [v16 insetsForSize:0 contentsScale:v35 options:v37 v40];
    double v4 = v4 - v41;
    double v6 = v6 - v42;
    double v8 = v8 + v41 + v43;
    double v10 = v10 + v42 + v44;
  }
LABEL_16:

  double v53 = v4;
  double v54 = v6;
  double v55 = v8;
  double v56 = v10;
  result.size.double height = v56;
  result.size.double width = v55;
  result.origin.y = v54;
  result.origin.x = v53;
  return result;
}

- (TUIImageResource)intrinsicImageResource
{
  return self->_intrinsicImageResource;
}

- (void)setIntrinsicImageResource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end