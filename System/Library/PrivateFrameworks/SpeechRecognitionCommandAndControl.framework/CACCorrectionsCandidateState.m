@interface CACCorrectionsCandidateState
- (BOOL)candidateNumberEnabled;
- (BOOL)hasBackdrop;
- (CGPoint)arrowButtonOffset;
- (TUICandidateViewStyle)disambiguationStyle;
- (TUICandidateViewStyle)style;
- (double)additionalHeight;
- (double)yOffset;
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

@implementation CACCorrectionsCandidateState

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (TUICandidateViewStyle)disambiguationStyle
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
  self->_candidateNumberEnabled = a3;
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
  self->_arrowButtonOffset = a3;
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