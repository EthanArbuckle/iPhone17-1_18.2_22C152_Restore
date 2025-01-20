@interface VGFrameSelectorMarginRatio
- (float)bottomMarginHeadRatio;
- (float)leftMarginHeadRatio;
- (float)rightMarginHeadRatio;
- (float)topMarginHeadRatio;
- (id)description;
- (void)setBottomMarginHeadRatio:(float)a3;
- (void)setLeftMarginHeadRatio:(float)a3;
- (void)setRightMarginHeadRatio:(float)a3;
- (void)setTopMarginHeadRatio:(float)a3;
@end

@implementation VGFrameSelectorMarginRatio

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[top]%g [left]%g [bottom]%g [right]%g", self->_topMarginHeadRatio, self->_leftMarginHeadRatio, self->_bottomMarginHeadRatio, self->_rightMarginHeadRatio);
}

- (float)leftMarginHeadRatio
{
  return self->_leftMarginHeadRatio;
}

- (void)setLeftMarginHeadRatio:(float)a3
{
  self->_leftMarginHeadRatio = a3;
}

- (float)rightMarginHeadRatio
{
  return self->_rightMarginHeadRatio;
}

- (void)setRightMarginHeadRatio:(float)a3
{
  self->_rightMarginHeadRatio = a3;
}

- (float)topMarginHeadRatio
{
  return self->_topMarginHeadRatio;
}

- (void)setTopMarginHeadRatio:(float)a3
{
  self->_topMarginHeadRatio = a3;
}

- (float)bottomMarginHeadRatio
{
  return self->_bottomMarginHeadRatio;
}

- (void)setBottomMarginHeadRatio:(float)a3
{
  self->_bottomMarginHeadRatio = a3;
}

@end