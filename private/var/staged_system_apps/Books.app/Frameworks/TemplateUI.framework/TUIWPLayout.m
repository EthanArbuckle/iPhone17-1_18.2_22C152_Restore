@interface TUIWPLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (BOOL)_isEmptyLine:(unint64_t)a3 column:(unint64_t)a4;
- (BOOL)_isTruncatedLine:(unint64_t)a3 column:(unint64_t)a4;
- (BOOL)_isWhitespaceLine:(unint64_t)a3 column:(unint64_t)a4;
- (BOOL)expandableContentIsTruncated;
- (BOOL)shouldAppendChildRenderModels;
- (CGRect)computedErasableBoundsPrimitive;
- (CGSize)_contentSizeForColumns:(id)a3;
- (CGSize)_layoutSizeForColumns:(id)a3 withInsets:(UIEdgeInsets *)a4;
- (NSArray)wpColumns;
- (NSString)description;
- (TUIWPLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (TUIWPStorage)storage;
- (double)_bottomBaselineForColumns:(id)a3;
- (double)_maxHeight;
- (double)_topAligmentOffsetForColumns:(id)a3;
- (double)computedScale;
- (double)expandableMoreWidth;
- (double)expandableMoreXOffset;
- (id)_columnStyle;
- (id)_newWPTextForIntrinsic:(BOOL)a3;
- (id)computedBoundsChildrenWithFlags:(unint64_t)a3;
- (id)debugContentDescription;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)_computeIntrinsicContentSize;
- (void)_wpText:(id)a3 scaleFactorDidChange:(double)a4;
- (void)computeLayout;
- (void)onComputedScaleDidChange;
- (void)onInvalidateIntrinsicSize;
- (void)setExpandableMoreWidth:(double)a3;
- (void)setWpColumns:(id)a3;
@end

@implementation TUIWPLayout

- (TUIWPLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TUIWPLayout;
  v5 = [(TUILayout *)&v12 initWithModel:a3 parent:a4 controller:a5];
  v6 = v5;
  if (v5)
  {
    [(TUILayout *)v5 specifiedWidth];
    if ((v7 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v6 setSpecifiedWidthComputeInherited:1];
    }
    v6->_scale = 1.0;
    v6->_cachedSingleLineTypographicMax = NAN;
    v8 = [(TUILayout *)v6 box];
    v9 = [v8 storage];
    v10 = [v9 paragraphStyleAtParIndex:0 effectiveRange:0];

    v6->_flags.isFirstParagraphCentered = [v10 intValueForProperty:86] == 2;
  }
  return v6;
}

- (TUIWPStorage)storage
{
  v2 = [(TUILayout *)self box];
  v3 = [v2 storage];

  return (TUIWPStorage *)v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  [(TUIWPLayout *)self _computeIntrinsicContentSize];
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
  [(TUIWPLayout *)self _computeIntrinsicContentSize];
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

- (void)_wpText:(id)a3 scaleFactorDidChange:(double)a4
{
  self->_scale = a4;
  [(TUILayout *)self notifyChildrenScaleDidChange];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v5 = [(TUILayout *)self children];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) validateLayout];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)computedScale
{
  v5.receiver = self;
  v5.super_class = (Class)TUIWPLayout;
  [(TUILayout *)&v5 computedScale];
  return v3 * self->_scale;
}

- (void)computeLayout
{
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  double v3 = [(TUILayout *)self children];
  id v4 = [v3 countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v77;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v77 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        [(TUILayout *)self containingWidth];
        [v8 setContainingWidth:];
        [(TUILayout *)self containingHeight];
        [v8 setContainingHeight:];
        [v8 validateLayout];
      }
      id v5 = [v3 countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v5);
  }

  self->_scale = 1.0;
  id v9 = [(TUIWPLayout *)self _newWPTextForIntrinsic:0];
  [(TUILayout *)self computeWidth];
  double v11 = fmax(v10, 1.0);
  [(TUIWPLayout *)self _maxHeight];
  double v13 = v12;
  if (v12 == 1.79769313e308) {
    double v14 = 4294967300.0;
  }
  else {
    double v14 = v12;
  }
  if (v12 != 1.79769313e308)
  {
    v15 = [(TUIWPLayout *)self storage];
    v16 = [v9 layoutMultiColumnTextStorage:v15 minSize:0x7FFFFFFFFFFFFFFFLL maxSize:0x7FFFFFFFFFFFFFFFLL anchor:4099 pageNumber:CGSizeZero.width pageCount:CGSizeZero.height flags:4294967300.0 anchor:CGPointZero.x pageCount:CGPointZero.y];

    long long v17 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    v75[0] = *(_OWORD *)&UIEdgeInsetsZero.top;
    v75[1] = v17;
    [(TUIWPLayout *)self _layoutSizeForColumns:v16 withInsets:v75];
    double v14 = v14 - fmin(*(double *)v75, 0.0);
  }
  if (!self->_wpColumns || v13 != 1.79769313e308 || self->_cachedSingleLineTypographicMax >= v11)
  {
    v19 = [(TUIWPLayout *)self storage];
    [v9 layoutMultiColumnTextStorage:v19 minSize:0x7FFFFFFFFFFFFFFFLL maxSize:0x7FFFFFFFFFFFFFFFLL anchor:4099 pageNumber:0 pageCount:v14 flags:v11 CGSizeZero.width CGSizeZero.height CGPointZero.x CGPointZero.y];
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    wpColumns = self->_wpColumns;
    self->_wpColumns = v20;

    v22 = [(NSArray *)self->_wpColumns lastObject];
    v23 = (char *)[v22 logicalLineCount];
    v24 = [(TUILayout *)self controller];
    v25 = [v24 instantiateContext];
    v26 = [v25 environment];
    v27 = (char *)[v26 layoutDirection];

    if (v23 == (unsigned char *)&def_141F14 + 1)
    {
      id v28 = [v22 lineFragmentRangeForLogicalLineIndex:0];
      CGFloat MaxX = NAN;
      if (v29 && v28 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = (uint64_t)v28 + v29 - 1;
        if (objc_msgSend(v22, "isTruncatedLineFragmentAtIndex:", v31, NAN))
        {
          CGFloat MaxX = NAN;
        }
        else
        {
          CGFloat MaxX = NAN;
          if (!self->_flags.isFirstParagraphCentered && v27 != (unsigned char *)&def_141F14 + 2)
          {
            [v22 typographicBoundsOfLineFragmentAtIndex:v31];
            CGFloat MaxX = CGRectGetMaxX(v81);
            if (v11 < MaxX) {
              CGFloat MaxX = NAN;
            }
          }
        }
      }
    }
    else
    {
      CGFloat MaxX = NAN;
    }
    self->_cachedSingleLineTypographicMax = MaxX;
  }
  v32 = [(TUIWPLayout *)self _columnStyle];
  v33 = (char *)[v32 columnCount];

  id v34 = [v9 maxLineCount];
  uint64_t v35 = (uint64_t)v34;
  if (v34 >= 2)
  {
    v36 = v33 - 1;
    if ([(TUIWPLayout *)self _isTruncatedLine:(v34 - 1) column:v36])
    {
      uint64_t v35 = v35;
      while (1)
      {
        int v37 = v35 - 1;
        if (![(TUIWPLayout *)self _isEmptyLine:(v35 - 1) column:v36]
          && ![(TUIWPLayout *)self _isWhitespaceLine:(v35 - 1) column:v36])
        {
          break;
        }
        --v35;
        if ((v37 & 0xFFFFFFFE) == 0)
        {
          uint64_t v35 = 1;
          break;
        }
      }
    }
  }
  if (v35 != [v9 maxLineCount])
  {
    [v9 setMaxLineCount:v35];
    v39 = [(TUIWPLayout *)self storage];
    [v9 layoutMultiColumnTextStorage:v39 minSize:0x7FFFFFFFFFFFFFFFLL maxSize:0x7FFFFFFFFFFFFFFFLL anchor:4099 pageNumber:CGSizeZero.width pageCount:CGSizeZero.height flags:v11, v14, CGPointZero.x, CGPointZero.y];
    v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v41 = self->_wpColumns;
    self->_wpColumns = v40;

    self->_cachedSingleLineTypographicMax = NAN;
  }
  [(TUIWPLayout *)self _layoutSizeForColumns:self->_wpColumns withInsets:&self->_layoutFrameInsets];
  double v43 = v42;
  [(TUIWPLayout *)self _topAligmentOffsetForColumns:self->_wpColumns];
  double v45 = v44;
  v46 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:0];
  [v46 erasableBounds:0];
  uint64_t v48 = v47;
  double v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;

  double v55 = v50 - v45;
  long long v56 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_renderingInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_renderingInsets.bottom = v56;
  self->_renderingInsets.top = fmin(v50 - v45, 0.0);
  uint64_t v57 = v48;
  *(void *)&long long v56 = v52;
  uint64_t v58 = v54;
  self->_renderingInsets.bottom = fmin(v43 - CGRectGetMaxY(*(CGRect *)(&v55 - 1)), 0.0);
  LODWORD(v59) = [(TUILayout *)self specifiedHeight];
  self->_renderingInsets.bottom = fmin(self->_renderingInsets.bottom- (v43- COERCE_FLOAT([(TUILayout *)self specifiedHeight])), 0.0);
  double v60 = COERCE_FLOAT([(TUILayout *)self specifiedHeight]);
  v61 = [(TUILayout *)self box];
  unsigned int v62 = [v61 allowHangingPunctuation];

  if (v62)
  {
    v63 = [(TUIWPLayout *)self storage];
    v64 = [v63 fontMetricsAtCharacterIndex:0];

    [v64 pointSize];
    self->_renderingInsets.left = -v65;
    [v64 pointSize];
    self->_renderingInsets.right = -v66;
  }
  v67 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:0];
  v68 = (char *)[v67 logicalLineCount];
  uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  if (v68)
  {
    uint64_t v70 = (uint64_t)[v67 lineFragmentRangeForLogicalLineIndex:v68 - 1];
  }
  else
  {
    uint64_t v71 = 0;
    uint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v70 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v71)
    {
      uint64_t v72 = v71 + v70 - 1;
      if (v71 + v70 != 0x8000000000000000)
      {
        uint64_t v69 = (uint64_t)[v67 truncatedCharIndexForLineFragmentAtIndex:v72];
        if (v69 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v73 = [v67 rangeOfLineFragmentAtIndex:v72];
          if (v73 == (id)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v69 = (uint64_t)v73 + v74;
          }
        }
      }
    }
  }
  [v9 positionAttachmentLayoutsWithOffset:v69 truncatedCharIndex:0.0 -v45];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v11, v60);
}

- (BOOL)shouldAppendChildRenderModels
{
  return 1;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  [v5 contentsScale];
  double v7 = v6;
  v8.i64[0] = *(void *)&self->_renderingInsets.top;
  double v10 = TUIInsetsExtendedForScale(v8, self->_renderingInsets.left, self->_renderingInsets.bottom, self->_renderingInsets.right, v7, v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = TUIFloatRoundedForScale(v10 - self->_layoutFrameInsets.top, v7);
  v18 = [_TUIWPDraw alloc];
  wpColumns = self->_wpColumns;
  v20 = [(TUILayout *)self box];
  v21 = [v20 blendMode];
  v22 = [(_TUIWPDraw *)v18 initWithColumns:wpColumns yOffset:v21 compositingFilterType:v17];

  v23 = -[TUIRenderModelDraw initWithDraw:erasableInsets:]([TUIRenderModelDraw alloc], "initWithDraw:erasableInsets:", v22, v10, v12, v14, v16);
  [(TUILayout *)self renderModelSizeWithContext:v5];
  double v25 = v24;
  double v27 = v26;

  -[TUIRenderModelDraw setSize:](v23, "setSize:", v25, v27);
  id v28 = [(TUILayout *)self box];
  uint64_t v29 = [v28 identifier];
  [(TUIRenderModelDraw *)v23 setIdentifier:v29];

  return v23;
}

- (CGRect)computedErasableBoundsPrimitive
{
  v13.receiver = self;
  v13.super_class = (Class)TUIWPLayout;
  [(TUILayout *)&v13 computedErasableBoundsPrimitive];
  double top = self->_renderingInsets.top;
  double left = self->_renderingInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_renderingInsets.right);
  double v12 = v11 - (top + self->_renderingInsets.bottom);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (id)_newWPTextForIntrinsic:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TUIWPLayout *)self _columnStyle];
  double v6 = [(TUILayout *)self controller];
  double v7 = [v6 instantiateContext];
  double v8 = [v7 environment];
  BOOL v9 = [v8 layoutDirection] == (char *)&def_141F14 + 2;

  double v10 = [[_TUIWPText alloc] initWithParagraphStyle:0 columnStyle:v5 alignmentForNaturalAlignment:v9 naturalDirection:v9];
  [(_TUIWPText *)v10 setComputingIntrinsic:v3];
  double v11 = [(TUILayout *)self children];
  [(_TUIWPText *)v10 updateWithAttachmentLayouts:v11];

  double v12 = [(TUILayout *)self box];
  -[_TUIWPText setMaxLineCount:](v10, "setMaxLineCount:", [v12 maxLines]);

  objc_super v13 = [(TUILayout *)self box];
  -[_TUIWPText setAllowsLastLineTruncation:](v10, "setAllowsLastLineTruncation:", [v13 hideEllipses] ^ 1);

  [(TUIWPLayout *)self expandableMoreWidth];
  -[_TUIWPText setReservedWidthWhenTruncating:](v10, "setReservedWidthWhenTruncating:");
  double v14 = [(TUILayout *)self box];
  -[_TUIWPText setUseShrinkToFit:](v10, "setUseShrinkToFit:", [v14 allowShrinkToFit]);

  double v15 = [(TUILayout *)self box];
  unsigned __int8 v16 = [v15 allowShrinkToFit];
  double v17 = 1.0;
  if ((v16 & 1) == 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)TUIWPLayout;
    [(TUILayout *)&v19 computedScale];
  }
  [(_TUIWPText *)v10 setTextScaleFactor:v17];

  [(_TUIWPText *)v10 setLayout:self];
  return v10;
}

- (id)_columnStyle
{
  id v3 = [objc_alloc((Class)TSWPColumns) initWithEqualColumnCount:1 gapFraction:0.0500000007];
  id v4 = +[TSSPropertyMap propertyMapWithPropertiesAndValues:](TSSPropertyMap, "propertyMapWithPropertiesAndValues:", 148, v3, 0);
  double v5 = [(TUIWPLayout *)self storage];
  double v6 = [v5 stylesheet];
  double v7 = [(TUIWPLayout *)self storage];
  double v8 = [v7 stylesheet];
  BOOL v9 = [v8 defaultColumnStyle];
  double v10 = [v6 variationOfStyle:v9 propertyMap:v4];

  return v10;
}

- (double)_maxHeight
{
  [(TUILayout *)self specifiedHeight];
  [(TUILayout *)self flexedHeight];

  [(TUILayout *)self flexedHeight];
  return result;
}

- (double)_topAligmentOffsetForColumns:(id)a3
{
  id v3 = [a3 firstObject];
  if ([v3 logicalLineCount])
  {
    [v3 topOfCapForLogicalLineIndex:0];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)_bottomBaselineForColumns:(id)a3
{
  id v3 = [a3 firstObject];
  double v4 = (char *)[v3 logicalLineCount];
  double v5 = 0.0;
  if (v4)
  {
    double v6 = (char *)[v3 lineFragmentRangeForLogicalLineIndex:v4 - 1];
    if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL && v7 != 0)
    {
      [v3 baselineOfLineFragmentAtIndex:&v6[v7 - 1]];
      double v5 = v9;
    }
  }

  return v5;
}

- (CGSize)_contentSizeForColumns:(id)a3
{
  id v3 = a3;
  double v4 = [v3 firstObject];
  [v4 frameBounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = [v3 lastObject];

  [v9 frameBounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.double width = v15;
  v21.size.double height = v17;
  double v18 = CGRectGetMaxX(v21) - v6;
  double v19 = v8;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)_layoutSizeForColumns:(id)a3 withInsets:(UIEdgeInsets *)a4
{
  id v6 = a3;
  [(TUIWPLayout *)self _topAligmentOffsetForColumns:v6];
  double v8 = v7;
  [(TUIWPLayout *)self _bottomBaselineForColumns:v6];
  double v10 = v9;
  [(TUIWPLayout *)self _contentSizeForColumns:v6];
  double v12 = v11;
  double v14 = v13;

  double v15 = fmin(-v8, 0.0);
  double v16 = fmin(v10 - v14, 0.0);
  if (a4)
  {
    a4->double top = v15;
    a4->double left = 0.0;
    a4->bottom = v16;
    a4->right = 0.0;
  }
  double v17 = v15 + v14 + v16;
  double v18 = v12;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (void)_computeIntrinsicContentSize
{
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  double height = CGSizeZero.height;
  if (self->_intrinsicContentSize.width == CGSizeZero.width && self->_intrinsicContentSize.height == height)
  {
    id v10 = [(TUIWPLayout *)self _newWPTextForIntrinsic:1];
    id v6 = [(TUIWPLayout *)self storage];
    double v7 = [v10 layoutMultiColumnTextStorage:v6 minSize:0x7FFFFFFFFFFFFFFFLL maxSize:0x7FFFFFFFFFFFFFFFLL anchor:4111 pageNumber:CGSizeZero.width pageCount:height flags:4294967300.0];

    [(TUIWPLayout *)self _layoutSizeForColumns:v7 withInsets:0];
    p_intrinsicContentSize->double width = v8;
    p_intrinsicContentSize->double height = v9;
  }
}

- (BOOL)_isTruncatedLine:(unint64_t)a3 column:(unint64_t)a4
{
  if ([(NSArray *)self->_wpColumns count] <= a4) {
    return 0;
  }
  double v7 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:a4];
  CGFloat v8 = (char *)[v7 lineFragmentRangeForLogicalLineIndex:a3];
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = [v7 isTruncatedLineFragmentAtIndex:&v8[v9 - 1]];
  }

  return v11;
}

- (BOOL)_isEmptyLine:(unint64_t)a3 column:(unint64_t)a4
{
  if ([(NSArray *)self->_wpColumns count] <= a4) {
    return 0;
  }
  double v7 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:a4];
  CGFloat v8 = (char *)[v7 lineFragmentRangeForLogicalLineIndex:a3];
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = [v7 isEmptyLineFragmentAtIndex:&v8[v9 - 1]];
  }

  return v11;
}

- (BOOL)_isWhitespaceLine:(unint64_t)a3 column:(unint64_t)a4
{
  if ([(NSArray *)self->_wpColumns count] <= a4) {
    return 0;
  }
  double v7 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:a4];
  CGFloat v8 = (char *)[v7 lineFragmentRangeForLogicalLineIndex:a3];
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || v9 == 0)
  {
    BOOL v11 = 0;
  }
  else
  {
    double v12 = v8;
    unint64_t v13 = v9;
    unint64_t v14 = 1;
    do
    {
      id v15 = [v7 rangeOfLineFragmentAtIndex:&v12[v14 - 1]];
      uint64_t v17 = v16;
      double v18 = [(TUIWPLayout *)self storage];
      double v19 = [v18 substringWithRange:v15, v17];

      v20 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      CGRect v21 = [v19 stringByTrimmingCharactersInSet:v20];

      id v22 = [v21 length];
      BOOL v11 = v22 == 0;

      if (v22) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v14 >= v13;
      }
      ++v14;
    }
    while (!v23);
  }

  return v11;
}

- (void)onComputedScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TUIWPLayout;
  [(TUILayout *)&v3 onComputedScaleDidChange];
  [(TUILayout *)self invalidateLayout];
  [(TUILayout *)self invalidateIntrinsicSize];
}

- (void)onInvalidateIntrinsicSize
{
  v3.receiver = self;
  v3.super_class = (Class)TUIWPLayout;
  [(TUILayout *)&v3 onInvalidateIntrinsicSize];
  self->_intrinsicContentSize = CGSizeZero;
}

- (id)computedBoundsChildrenWithFlags:(unint64_t)a3
{
  return 0;
}

- (double)expandableMoreXOffset
{
  double MaxX = 0.0;
  if ([(NSArray *)self->_wpColumns count])
  {
    double v4 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:0];
    id v5 = [v4 countLines];

    if (v5)
    {
      id v6 = [(NSArray *)self->_wpColumns objectAtIndexedSubscript:(char *)[(NSArray *)self->_wpColumns count] - 1];
      if ([v6 countLines])
      {
        double v7 = (char *)[v6 countLines] - 1;
        CGFloat v8 = (char *)[v6 rangeOfLineFragmentAtIndex:v7];
        uint64_t v10 = v9;
        BOOL v11 = [(TUIWPLayout *)self storage];
        LODWORD(v8) = [v11 writingDirectionForParagraphAtCharIndex:&v8[v10]];

        [v6 typographicBoundsOfLineFragmentAtIndex:v7];
        if (v8 == 1)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v12);
          [(TUIWPLayout *)self expandableMoreWidth];
          double MaxX = MinX - v17;
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v12);
        }
      }
    }
  }
  return MaxX;
}

- (BOOL)expandableContentIsTruncated
{
  v2 = self;
  objc_super v3 = [(NSArray *)self->_wpColumns lastObject];
  LOBYTE(v2) = -[TUIWPLayout _isTruncatedLine:column:](v2, "_isTruncatedLine:column:", (char *)[v3 countLines] - 1, (char *)-[NSArray count](v2->_wpColumns, "count") - 1);

  return (char)v2;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)TUIWPLayout;
  objc_super v3 = [(TUILayout *)&v10 description];
  id v4 = [v3 mutableCopy];

  id v5 = (char *)[v4 length] - 1;
  id v6 = [(TUILayout *)self box];
  double v7 = [v6 string];
  CGFloat v8 = +[NSString stringWithFormat:@" string='%@'>", v7];
  [v4 replaceCharactersInRange:v5 withString:1, v8];

  return (NSString *)v4;
}

- (id)debugContentDescription
{
  v2 = [(TUILayout *)self box];
  objc_super v3 = [v2 storage];
  id v4 = [v3 string];
  id v5 = +[NSString stringWithFormat:@"'%@'", v4];

  return v5;
}

- (double)expandableMoreWidth
{
  return self->_expandableMoreWidth;
}

- (void)setExpandableMoreWidth:(double)a3
{
  self->_expandableMoreWidth = a3;
}

- (NSArray)wpColumns
{
  return self->_wpColumns;
}

- (void)setWpColumns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end