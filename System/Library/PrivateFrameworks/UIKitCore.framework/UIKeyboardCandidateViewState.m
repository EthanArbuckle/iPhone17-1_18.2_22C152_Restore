@interface UIKeyboardCandidateViewState
+ (BOOL)resolveInstanceMethod:(SEL)a3;
- (BOOL)candidateNumberEnabled;
- (BOOL)hasBackdrop;
- (BOOL)isEqual:(id)a3;
- (CGPoint)arrowButtonOffset;
- (UIKeyboardCandidateViewStyle)disambiguationStyle;
- (UIKeyboardCandidateViewStyle)style;
- (double)additionalHeight;
- (double)yOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)arrowButtonDirection;
- (int64_t)arrowButtonPosition;
- (int64_t)disambiguationGridPosition;
- (int64_t)disambiguationGridRowType;
- (int64_t)inlineTextViewPosition;
- (int64_t)primaryGridRowType;
- (int64_t)sortControlPosition;
- (unint64_t)borders;
- (void)setAdditionalHeight:(double)a3;
- (void)setArrowButtonDirection:(int64_t)a3;
- (void)setArrowButtonOffset:(CGPoint)a3;
- (void)setArrowButtonPosition:(int64_t)a3;
- (void)setBorders:(unint64_t)a3;
- (void)setCandidateNumberEnabled:(BOOL)a3;
- (void)setDisambiguationGridPosition:(int64_t)a3;
- (void)setDisambiguationGridRowType:(int64_t)a3;
- (void)setDisambiguationStyle:(id)a3;
- (void)setHasBackdrop:(BOOL)a3;
- (void)setInlineTextViewPosition:(int64_t)a3;
- (void)setPrimaryGridRowType:(int64_t)a3;
- (void)setSortControlPosition:(int64_t)a3;
- (void)setStyle:(id)a3;
- (void)setYOffset:(double)a3;
@end

@implementation UIKeyboardCandidateViewState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(UIKeyboardCandidateViewStyle *)self->_style copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(UIKeyboardCandidateViewStyle *)self->_disambiguationStyle copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  v4[4] = self->_primaryGridRowType;
  v4[5] = self->_disambiguationGridRowType;
  v4[6] = self->_disambiguationGridPosition;
  v4[7] = self->_sortControlPosition;
  v4[8] = self->_inlineTextViewPosition;
  v4[9] = self->_arrowButtonPosition;
  v4[10] = self->_arrowButtonDirection;
  *((unsigned char *)v4 + 8) = self->_hasBackdrop;
  *((unsigned char *)v4 + 9) = self->_candidateNumberEnabled;
  v4[11] = *(void *)&self->_yOffset;
  v4[12] = *(void *)&self->_additionalHeight;
  *((_OWORD *)v4 + 7) = self->_arrowButtonOffset;
  v4[13] = self->_borders;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIKeyboardCandidateViewState *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v18 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    style = self->_style;
    uint64_t v7 = v5->_style;
    v8 = v5;
    BOOL v9 = [(UIKeyboardCandidateViewStyle *)style isEqual:v7];
    BOOL v10 = [(UIKeyboardCandidateViewStyle *)self->_disambiguationStyle isEqual:v8->_disambiguationStyle];
    int64x2_t v31 = *(int64x2_t *)&self->_primaryGridRowType;
    int64x2_t v26 = *(int64x2_t *)&v8->_primaryGridRowType;
    int64x2_t v27 = *(int64x2_t *)&self->_disambiguationGridPosition;
    int64x2_t v24 = *(int64x2_t *)&v8->_disambiguationGridPosition;
    int64x2_t v29 = *(int64x2_t *)&self->_inlineTextViewPosition;
    int64x2_t v25 = *(int64x2_t *)&v8->_inlineTextViewPosition;
    BOOL v11 = self->_hasBackdrop == v8->_hasBackdrop;
    int candidateNumberEnabled = self->_candidateNumberEnabled;
    int v13 = v8->_candidateNumberEnabled;
    float64x2_t v30 = *(float64x2_t *)&self->_yOffset;
    float64x2_t v28 = *(float64x2_t *)&v8->_yOffset;
    int8x16_t arrowButtonOffset = (int8x16_t)v8->_arrowButtonOffset;
    CGPoint v23 = self->_arrowButtonOffset;
    v14.i64[0] = self->_arrowButtonDirection;
    v14.i64[1] = self->_borders;
    int64x2_t v21 = v14;
    v14.i64[0] = v8->_arrowButtonDirection;
    v14.i64[1] = v8->_borders;
    int64x2_t v20 = v14;

    unsigned __int8 v15 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v31, v26), (int32x4_t)vceqq_s64(v27, v24)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v29, v25), (int32x4_t)vceqq_s64(v21, v20))))));
    char v16 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)v23, (int8x16_t)v23, 8uLL), (float64x2_t)vextq_s8(arrowButtonOffset, arrowButtonOffset, 8uLL)), (int32x4_t)vceqq_f64(v30, v28)))));
    BOOL v17 = candidateNumberEnabled == v13 && v9;
    char v18 = ~v15 & ~v16 & (v11 && v17 && v10);
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___UIKeyboardCandidateViewState;
  if ((objc_msgSendSuper2(&v6, sel_resolveInstanceMethod_) & 1) == 0)
  {
    v4 = (objc_class *)objc_opt_class();
    class_addMethod(v4, a3, (IMP)nullMethodIMP, "v@:");
  }
  return 1;
}

- (UIKeyboardCandidateViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (UIKeyboardCandidateViewStyle)disambiguationStyle
{
  return self->_disambiguationStyle;
}

- (void)setDisambiguationStyle:(id)a3
{
}

- (int64_t)primaryGridRowType
{
  return self->_primaryGridRowType;
}

- (void)setPrimaryGridRowType:(int64_t)a3
{
  self->_primaryGridRowType = a3;
}

- (int64_t)disambiguationGridRowType
{
  return self->_disambiguationGridRowType;
}

- (void)setDisambiguationGridRowType:(int64_t)a3
{
  self->_disambiguationGridRowType = a3;
}

- (int64_t)disambiguationGridPosition
{
  return self->_disambiguationGridPosition;
}

- (void)setDisambiguationGridPosition:(int64_t)a3
{
  self->_disambiguationGridPosition = a3;
}

- (int64_t)sortControlPosition
{
  return self->_sortControlPosition;
}

- (void)setSortControlPosition:(int64_t)a3
{
  self->_sortControlPosition = a3;
}

- (int64_t)inlineTextViewPosition
{
  return self->_inlineTextViewPosition;
}

- (void)setInlineTextViewPosition:(int64_t)a3
{
  self->_inlineTextViewPosition = a3;
}

- (int64_t)arrowButtonPosition
{
  return self->_arrowButtonPosition;
}

- (void)setArrowButtonPosition:(int64_t)a3
{
  self->_arrowButtonPosition = a3;
}

- (int64_t)arrowButtonDirection
{
  return self->_arrowButtonDirection;
}

- (void)setArrowButtonDirection:(int64_t)a3
{
  self->_arrowButtonDirection = a3;
}

- (BOOL)hasBackdrop
{
  return self->_hasBackdrop;
}

- (void)setHasBackdrop:(BOOL)a3
{
  self->_hasBackdrop = a3;
}

- (BOOL)candidateNumberEnabled
{
  return self->_candidateNumberEnabled;
}

- (void)setCandidateNumberEnabled:(BOOL)a3
{
  self->_int candidateNumberEnabled = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (double)additionalHeight
{
  return self->_additionalHeight;
}

- (void)setAdditionalHeight:(double)a3
{
  self->_additionalHeight = a3;
}

- (CGPoint)arrowButtonOffset
{
  double x = self->_arrowButtonOffset.x;
  double y = self->_arrowButtonOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setArrowButtonOffset:(CGPoint)a3
{
  self->_int8x16_t arrowButtonOffset = a3;
}

- (unint64_t)borders
{
  return self->_borders;
}

- (void)setBorders:(unint64_t)a3
{
  self->_borders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end