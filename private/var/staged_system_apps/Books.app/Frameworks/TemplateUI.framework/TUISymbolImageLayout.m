@interface TUISymbolImageLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (double)computedHeightAbovePivot;
- (id)_image;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
- (void)onComputedScaleDidChange;
@end

@implementation TUISymbolImageLayout

- (id)_image
{
  v3 = [(TUILayout *)self box];
  v4 = [(TUILayout *)self controller];
  v5 = [v4 instantiateContext];
  v6 = [v5 environment];
  v7 = (char *)[v6 style];

  uint64_t v8 = v7 == (unsigned char *)&def_141F14 + 1;
  if (v7 == (unsigned char *)&def_141F14 + 2) {
    uint64_t v8 = 2;
  }
  uint64_t v36 = v8;
  v38 = [(TUILayout *)self controller];
  v37 = [v38 manager];
  v9 = [v37 imageResourceCache];
  v10 = [v3 name];
  [v3 fontSize];
  double v12 = v11;
  [(TUILayout *)self computedScale];
  double v14 = v12 * v13;
  id v15 = [v3 weight];
  id v16 = [v3 scale];
  id v17 = [v3 renderingMode];
  v18 = [v3 colors];
  v19 = [(TUILayout *)self controller];
  [v19 contentsScale];
  double v21 = v20;
  unint64_t v22 = [(TUILayout *)self computedLayoutDirection];
  [v3 insets];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  LOBYTE(v35) = [v3 baseline];
  [v9 symbolImageWithName:v10 compatibleWithFontSize:v15 weight:v16 scale:v17 renderingMode:v18 colors:v36 style:v14 contentsScale:v21 layoutDirection:v24 insets:v26 baseline:v28];
  v31 = (TUISymbolImage *)objc_claimAutoreleasedReturnValue();
  cachedImage = self->_cachedImage;
  self->_cachedImage = v31;

  v33 = self->_cachedImage;
  return v33;
}

- (void)onComputedScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TUISymbolImageLayout;
  [(TUILayout *)&v3 onComputedScaleDidChange];
  [(TUILayout *)self invalidateLayout];
  [(TUILayout *)self invalidateIntrinsicSize];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  objc_super v3 = [(TUISymbolImageLayout *)self _image];
  [v3 alignmentInsets];
  double v5 = v4;
  double v7 = v6;
  [v3 size];
  double v9 = v8 - v5 - v7;
  if (v9 <= -3.40282347e38)
  {
    uint64_t v12 = 4286578687;
LABEL_6:
    double v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_7;
  }
  if (v9 >= 3.40282347e38)
  {
    uint64_t v12 = 2139095039;
    goto LABEL_6;
  }
  *(float *)&unsigned int v10 = v9;
  double v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v10 | 0x7FC0000000000000);
LABEL_7:

  return v11;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  objc_super v3 = [(TUISymbolImageLayout *)self _image];
  [v3 alignmentInsets];
  double v5 = v4;
  double v7 = v6;
  [v3 size];
  double v9 = v8 - v5 - v7;
  if (v9 <= -3.40282347e38)
  {
    uint64_t v12 = 4286578687;
LABEL_6:
    double v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_7;
  }
  if (v9 >= 3.40282347e38)
  {
    uint64_t v12 = 2139095039;
    goto LABEL_6;
  }
  *(float *)&unsigned int v10 = v9;
  double v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v10 | 0x7FC0000000000000);
LABEL_7:

  return v11;
}

- (void)computeLayout
{
  id v16 = [(TUISymbolImageLayout *)self _image];
  [v16 alignmentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v16 size];
  double v12 = v11 - v6 - v10;
  [v16 size];
  double v14 = v13 - v4 - v8;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v12, v14);
  self->_heightAbovePivot = v14;
  if ([v16 hasBaseline])
  {
    [v16 baselineOffsetFromBottom];
    self->_heightAbovePivot = self->_heightAbovePivot - (v15 - v8);
  }
}

- (double)computedHeightAbovePivot
{
  return self->_heightAbovePivot;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  [(TUILayout *)self renderModelSizeWithContext:v6];
  if (a3 < 3)
  {
    double v13 = 0;
  }
  else
  {
    double v9 = v7;
    double v10 = v8;
    double v11 = [(TUILayout *)self box];
    if ([v11 hflipForRTL]) {
      BOOL v12 = (char *)[(TUILayout *)self computedLayoutDirection] == (char *)&def_141F14 + 2;
    }
    else {
      BOOL v12 = 0;
    }

    double v14 = [_TUISymbolImageLayerConfig alloc];
    [v6 contentsScale];
    double v16 = v15;
    id v17 = [(TUISymbolImageLayout *)self _image];
    v18 = [(TUILayout *)self box];
    v19 = [v18 colors];
    double v20 = [v19 firstObject];
    double v21 = [(TUILayout *)self box];
    unint64_t v22 = [v21 blendMode];
    double v23 = [(_TUISymbolImageLayerConfig *)v14 initWithContentsScale:v17 image:v20 color:v12 hflip:v22 blendMode:v16];

    double v13 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v23, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v13, "setSize:", v9, v10);
    double v24 = [(TUILayout *)self box];
    double v25 = [v24 identifier];
    [(TUIRenderModelLayer *)v13 setIdentifier:v25];
  }
  return v13;
}

- (void).cxx_destruct
{
}

@end