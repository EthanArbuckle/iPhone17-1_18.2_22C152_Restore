@interface OADTableCellProperties
- (BOOL)isBottomMarginOverridden;
- (BOOL)isLeftMarginOverridden;
- (BOOL)isRightMarginOverridden;
- (BOOL)isTextAnchorCenterOverridden;
- (BOOL)isTextAnchorOverridden;
- (BOOL)isTextFlowOverridden;
- (BOOL)isTextHorizontalOverflowOverridden;
- (BOOL)isTopMarginOverridden;
- (BOOL)textAnchorCenter;
- (float)bottomMargin;
- (float)leftMargin;
- (float)rightMargin;
- (float)topMargin;
- (id)bottomLeftToTopRightStroke;
- (id)bottomStroke;
- (id)description;
- (id)fill;
- (id)leftStroke;
- (id)rightStroke;
- (id)stroke:(int)a3;
- (id)strokeNormalToDir:(int)a3 bound:(int)a4;
- (id)threeDProperties;
- (id)topLeftToBottomRightStroke;
- (id)topStroke;
- (unsigned)textAnchor;
- (unsigned)textFlow;
- (unsigned)textHorizontalOverflow;
- (void)setBottomLeftToTopRightStroke:(id)a3;
- (void)setBottomMargin:(float)a3;
- (void)setBottomStroke:(id)a3;
- (void)setFill:(id)a3;
- (void)setLeftMargin:(float)a3;
- (void)setLeftStroke:(id)a3;
- (void)setRightMargin:(float)a3;
- (void)setRightStroke:(id)a3;
- (void)setStrokeOfType:(int)a3 toValue:(id)a4;
- (void)setTextAnchor:(unsigned __int8)a3;
- (void)setTextAnchorCenter:(BOOL)a3;
- (void)setTextFlow:(unsigned __int8)a3;
- (void)setTextHorizontalOverflow:(unsigned __int8)a3;
- (void)setThreeDProperties:(id)a3;
- (void)setTopLeftToBottomRightStroke:(id)a3;
- (void)setTopMargin:(float)a3;
- (void)setTopStroke:(id)a3;
@end

@implementation OADTableCellProperties

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
  self->mIsLeftMarginOverridden = 1;
}

- (void)setRightMargin:(float)a3
{
  self->mRightMargin = a3;
  self->mIsRightMarginOverridden = 1;
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
  self->mIsTopMarginOverridden = 1;
}

- (void)setBottomMargin:(float)a3
{
  self->mBottomMargin = a3;
  self->mIsBottomMarginOverridden = 1;
}

- (BOOL)isTextAnchorOverridden
{
  return self->mIsTextAnchorOverridden;
}

- (void)setLeftStroke:(id)a3
{
}

- (void)setRightStroke:(id)a3
{
}

- (void)setTopStroke:(id)a3
{
}

- (void)setBottomStroke:(id)a3
{
}

- (void)setTopLeftToBottomRightStroke:(id)a3
{
}

- (void)setBottomLeftToTopRightStroke:(id)a3
{
}

- (void)setFill:(id)a3
{
}

- (void)setTextHorizontalOverflow:(unsigned __int8)a3
{
  self->mTextHorizontalOverflow = a3;
  self->mIsTextHorizontalOverflowOverridden = 1;
}

- (id)topStroke
{
  return self->mTopStroke;
}

- (id)bottomStroke
{
  return self->mBottomStroke;
}

- (id)leftStroke
{
  return self->mLeftStroke;
}

- (id)rightStroke
{
  return self->mRightStroke;
}

- (id)fill
{
  return self->mFill;
}

- (void)setTextAnchor:(unsigned __int8)a3
{
  self->mTextAnchor = a3;
  self->mIsTextAnchorOverridden = 1;
}

- (unsigned)textAnchor
{
  return self->mTextAnchor;
}

- (void)setTextAnchorCenter:(BOOL)a3
{
  self->mTextAnchorCenter = a3;
  self->mIsTextAnchorCenterOverridden = 1;
}

- (id)stroke:(int)a3
{
  v4 = 0;
  switch(a3)
  {
    case 1:
      v4 = [(OADTableCellProperties *)self leftStroke];
      break;
    case 2:
      v4 = [(OADTableCellProperties *)self rightStroke];
      break;
    case 3:
      v4 = [(OADTableCellProperties *)self topStroke];
      break;
    case 4:
      v4 = [(OADTableCellProperties *)self bottomStroke];
      break;
    case 7:
      v4 = [(OADTableCellProperties *)self topLeftToBottomRightStroke];
      break;
    case 8:
      v4 = [(OADTableCellProperties *)self bottomLeftToTopRightStroke];
      break;
    default:
      break;
  }
  return v4;
}

- (void)setStrokeOfType:(int)a3 toValue:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
      [(OADTableCellProperties *)self setLeftStroke:v6];
      break;
    case 2:
      [(OADTableCellProperties *)self setRightStroke:v6];
      break;
    case 3:
      [(OADTableCellProperties *)self setTopStroke:v6];
      break;
    case 4:
      [(OADTableCellProperties *)self setBottomStroke:v6];
      break;
    case 7:
      [(OADTableCellProperties *)self setTopLeftToBottomRightStroke:v6];
      break;
    case 8:
      [(OADTableCellProperties *)self setBottomLeftToTopRightStroke:v6];
      break;
    default:
      break;
  }
}

- (id)topLeftToBottomRightStroke
{
  return self->mTopLeftToBottomRightStroke;
}

- (id)bottomLeftToTopRightStroke
{
  return self->mBottomLeftToTopRightStroke;
}

- (id)strokeNormalToDir:(int)a3 bound:(int)a4
{
  if (a3 == 1)
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v4 = [(OADTableCellProperties *)self leftStroke];
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    v4 = [(OADTableCellProperties *)self rightStroke];
  }
  else
  {
    if (a3)
    {
LABEL_9:
      v4 = 0;
      goto LABEL_10;
    }
    if (a4 != 1)
    {
      if (!a4)
      {
        v4 = [(OADTableCellProperties *)self topStroke];
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    v4 = [(OADTableCellProperties *)self bottomStroke];
  }
LABEL_10:
  return v4;
}

- (id)threeDProperties
{
  return self->mThreeDProperties;
}

- (void)setThreeDProperties:(id)a3
{
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (BOOL)isLeftMarginOverridden
{
  return self->mIsLeftMarginOverridden;
}

- (float)rightMargin
{
  return self->mRightMargin;
}

- (BOOL)isRightMarginOverridden
{
  return self->mIsRightMarginOverridden;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (BOOL)isTopMarginOverridden
{
  return self->mIsTopMarginOverridden;
}

- (float)bottomMargin
{
  return self->mBottomMargin;
}

- (BOOL)isBottomMarginOverridden
{
  return self->mIsBottomMarginOverridden;
}

- (unsigned)textFlow
{
  return self->mTextFlow;
}

- (void)setTextFlow:(unsigned __int8)a3
{
  self->mTextFlow = a3;
  self->mIsTextFlowOverridden = 0;
}

- (BOOL)isTextFlowOverridden
{
  return self->mIsTextFlowOverridden;
}

- (BOOL)textAnchorCenter
{
  return self->mTextAnchorCenter;
}

- (BOOL)isTextAnchorCenterOverridden
{
  return self->mIsTextAnchorCenterOverridden;
}

- (unsigned)textHorizontalOverflow
{
  return self->mTextHorizontalOverflow;
}

- (BOOL)isTextHorizontalOverflowOverridden
{
  return self->mIsTextHorizontalOverflowOverridden;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableCellProperties;
  v2 = [(OADTableCellProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mThreeDProperties, 0);
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, 0);
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, 0);
  objc_storeStrong((id *)&self->mBottomStroke, 0);
  objc_storeStrong((id *)&self->mTopStroke, 0);
  objc_storeStrong((id *)&self->mRightStroke, 0);
  objc_storeStrong((id *)&self->mLeftStroke, 0);
}

@end