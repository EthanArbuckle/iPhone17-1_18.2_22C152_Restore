@interface UIKBTutorialConversationBubble
- (CAShapeLayer)backdropMaskShapeLayer;
- (CGPoint)originationPoint;
- (CGPoint)tailAnchorPoint;
- (CGPoint)tailAttachmentPoint;
- (CGRect)pillRect;
- (CGSize)intrinsicContentSize;
- (CGSize)parentAvatarViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)contentViewPadding;
- (UIKBTutorialConversationBubble)initWithText:(id)a3 originationDirection:(int64_t)a4;
- (UIKBTutorialConversationBubbleBackdropLayer)backdropLayer;
- (UIKBTutorialConversationBubbleShadowLayer)broadShadowLayer;
- (UIKBTutorialConversationBubbleShadowLayer)tightShadowLayer;
- (UILabel)summaryLabel;
- (UIView)contentView;
- (double)activityItemToContactItemVerticalOverlap;
- (double)balloonCornerRadius;
- (double)balloonTailHeight;
- (double)balloonTailRadius;
- (double)balloonTailWidth;
- (double)pillCornerRadius;
- (double)preferredTailAttachmentPointXCoordinate;
- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationDirection:(int64_t)a6;
- (int64_t)originationDirection;
- (void)_updateUserInterfaceStyles;
- (void)layoutSubviews;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBroadShadowLayer:(id)a3;
- (void)setOriginationDirection:(int64_t)a3;
- (void)setOriginationPoint:(CGPoint)a3;
- (void)setParentAvatarViewSize:(CGSize)a3;
- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setTightShadowLayer:(id)a3;
@end

@implementation UIKBTutorialConversationBubble

- (UIKBTutorialConversationBubble)initWithText:(id)a3 originationDirection:(int64_t)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIKBTutorialConversationBubble;
  v7 = [(UIView *)&v26 init];
  v8 = v7;
  if (v7)
  {
    v7->_originationDirection = a4;
    v9 = objc_alloc_init(UILabel);
    summaryLabel = v8->_summaryLabel;
    v8->_summaryLabel = v9;

    [(UILabel *)v8->_summaryLabel setTextAlignment:1];
    [(UILabel *)v8->_summaryLabel setLineBreakMode:0];
    [(UILabel *)v8->_summaryLabel setNumberOfLines:2];
    v11 = [off_1E52D39B8 systemFontOfSize:12.0];
    [(UILabel *)v8->_summaryLabel setFont:v11];

    [(UILabel *)v8->_summaryLabel setText:v6];
    [(UIView *)v8 addSubview:v8->_summaryLabel];
    objc_storeStrong((id *)&v8->_contentView, v8->_summaryLabel);
    v12 = [[UIKBTutorialConversationBubbleShadowLayer alloc] initWithShadowType:0];
    broadShadowLayer = v8->_broadShadowLayer;
    v8->_broadShadowLayer = v12;

    v14 = [[UIKBTutorialConversationBubbleShadowLayer alloc] initWithShadowType:1];
    tightShadowLayer = v8->_tightShadowLayer;
    v8->_tightShadowLayer = v14;

    v16 = objc_alloc_init(UIKBTutorialConversationBubbleBackdropLayer);
    backdropLayer = v8->_backdropLayer;
    v8->_backdropLayer = v16;

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backdropMaskShapeLayer = v8->_backdropMaskShapeLayer;
    v8->_backdropMaskShapeLayer = v18;

    [(UIKBTutorialConversationBubbleBackdropLayer *)v8->_backdropLayer setMask:v8->_backdropMaskShapeLayer];
    [(UIKBTutorialConversationBubble *)v8 _updateUserInterfaceStyles];
    v20 = [(UIView *)v8 layer];
    [v20 addSublayer:v8->_broadShadowLayer];

    v21 = [(UIView *)v8 layer];
    [v21 addSublayer:v8->_tightShadowLayer];

    v22 = v8->_backdropLayer;
    v23 = [(UIView *)v8->_contentView layer];
    [(UIKBTutorialConversationBubbleBackdropLayer *)v22 addSublayer:v23];

    v24 = [(UIView *)v8 layer];
    [v24 addSublayer:v8->_backdropLayer];
  }
  return v8;
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)UIKBTutorialConversationBubble;
  [(UIView *)&v50 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIKBTutorialConversationBubbleShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:");
  -[UIKBTutorialConversationBubbleShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[UIKBTutorialConversationBubbleBackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v4, v6, v8, v10);
  [(UIKBTutorialConversationBubble *)self contentViewPadding];
  double v43 = v11;
  double v45 = v12;
  double v39 = v13;
  double v41 = v14;
  [(UIKBTutorialConversationBubble *)self balloonTailHeight];
  [(UIKBTutorialConversationBubble *)self pillCornerRadius];
  double v38 = v15;
  int64_t originationDirection = self->_originationDirection;
  [(UIKBTutorialConversationBubble *)self pillRect];
  double v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [(UIKBTutorialConversationBubble *)self tailAnchorPoint];
  v51.origin.x = v4 + v39;
  double v47 = v4 + v39;
  CGFloat v25 = v6 + v43;
  CGFloat v26 = v8 - v39 - v41;
  CGFloat v27 = v10 - v43 - v45;
  v51.origin.y = v25;
  v51.size.width = v26;
  v51.size.height = v27;
  double Width = CGRectGetWidth(v51);
  v29 = [(UIKBTutorialConversationBubble *)self summaryLabel];
  [v29 setPreferredMaxLayoutWidth:Width];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __48__UIKBTutorialConversationBubble_layoutSubviews__block_invoke;
  v49[3] = &unk_1E52DA520;
  v49[4] = self;
  *(double *)&v49[5] = v47;
  *(CGFloat *)&v49[6] = v25;
  *(CGFloat *)&v49[7] = v26;
  *(CGFloat *)&v49[8] = v27;
  +[UIView performWithoutAnimation:v49];
  v52.origin.x = v18;
  v52.origin.y = v20;
  v52.size.width = v22;
  v52.size.height = v24;
  CGRectGetMaxX(v52);
  v53.origin.x = v18;
  v53.origin.y = v20;
  v53.size.width = v22;
  v53.size.height = v24;
  CGRectGetMaxX(v53);
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v24;
  CGRectGetMaxY(v54);
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  double MaxX = CGRectGetMaxX(v55);
  v56.origin.x = v18;
  v56.origin.y = v20;
  v56.size.width = v22;
  v56.size.height = v24;
  double MinY = CGRectGetMinY(v56);
  v57.origin.x = v18;
  v57.origin.y = v20;
  v57.size.width = v22;
  v57.size.height = v24;
  double v44 = CGRectGetMaxX(v57);
  v58.origin.x = v18;
  v58.origin.y = v20;
  v58.size.width = v22;
  v58.size.height = v24;
  double MaxY = CGRectGetMaxY(v58);
  v59.origin.x = v18;
  v59.origin.y = v20;
  v59.size.width = v22;
  v59.size.height = v24;
  double MinX = CGRectGetMinX(v59);
  v60.origin.x = v18;
  v60.origin.y = v20;
  v60.size.width = v22;
  v60.size.height = v24;
  double v42 = CGRectGetMaxY(v60);
  v61.origin.x = v18;
  v61.origin.y = v20;
  v61.size.width = v22;
  v61.size.height = v24;
  double v48 = CGRectGetMinX(v61);
  v62.origin.x = v18;
  v62.origin.y = v20;
  v62.size.width = v22;
  v62.size.height = v24;
  double v32 = CGRectGetMinY(v62);
  v33 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v33, "moveToPoint:", v38 + v18, v20);
  -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, MinY, v38, v38);
  if (originationDirection == 1)
  {
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v44, MaxY, v38, v38);
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v42, v38, v38);
    [(UIBezierPath *)v33 currentPoint];
    v34 = -[UIKBTutorialConversationBubble _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:", self->_originationDirection);
    [(UIBezierPath *)v33 appendPath:v34];
  }
  else
  {
    [(UIBezierPath *)v33 currentPoint];
    v35 = -[UIKBTutorialConversationBubble _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:", self->_originationDirection);
    [(UIBezierPath *)v33 appendPath:v35];

    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v44, MaxY, v38, v38);
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v42, v38, v38);
  }
  -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v48, v32, v38, v38);
  -[UIBezierPath addLineToPoint:](v33, "addLineToPoint:", v38 + v18, v20);
  v36 = v33;
  uint64_t v37 = [(UIBezierPath *)v36 CGPath];
  [(CAShapeLayer *)self->_backdropMaskShapeLayer setPath:v37];
  [(UIKBTutorialConversationBubbleShadowLayer *)self->_broadShadowLayer setShadowPath:v37];
  [(UIKBTutorialConversationBubbleShadowLayer *)self->_tightShadowLayer setShadowPath:v37];
}

void __48__UIKBTutorialConversationBubble_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIKBTutorialConversationBubble *)self contentViewPadding];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIKBTutorialConversationBubble *)self balloonTailWidth];
  [(UIKBTutorialConversationBubble *)self balloonTailHeight];
  double v14 = v13;
  [(UIKBTutorialConversationBubble *)self pillCornerRadius];
  double v15 = [(UIKBTutorialConversationBubble *)self contentView];
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", width - v8 - v12 - v14, height - v6 - v10);

  v16 = [(UIKBTutorialConversationBubble *)self summaryLabel];
  [v16 numberOfLines];

  UICeilToViewScale(self);
  double v18 = v17;
  UICeilToViewScale(self);
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self bounds];
  -[UIKBTutorialConversationBubble sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)_updateUserInterfaceStyles
{
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  [(UIKBTutorialConversationBubbleBackdropLayer *)self->_backdropLayer setUserInterfaceStyle:v4];
  [(UIKBTutorialConversationBubbleShadowLayer *)self->_broadShadowLayer setUserInterfaceStyle:v4];
  tightShadowLayer = self->_tightShadowLayer;
  [(UIKBTutorialConversationBubbleShadowLayer *)tightShadowLayer setUserInterfaceStyle:v4];
}

- (CGPoint)tailAnchorPoint
{
  [(UIView *)self bounds];
  v24.origin.x = v3;
  v24.origin.y = v4;
  v24.size.double width = v5;
  v24.size.double height = v6;
  [(UIKBTutorialConversationBubble *)self pillRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  int64_t originationDirection = self->_originationDirection;
  [(UIKBTutorialConversationBubble *)self balloonTailWidth];
  double v17 = v16;
  [(UIKBTutorialConversationBubble *)self pillCornerRadius];
  double v19 = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.double width = v12;
  v26.size.double height = v14;
  double MinY = CGRectGetMinY(v26);
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.double width = v12;
  v27.size.double height = v14;
  CGRectGetMinY(v27);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.double width = v12;
  v28.size.double height = v14;
  double MaxY = CGRectGetMaxY(v28);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.double width = v12;
  v29.size.double height = v14;
  CGRectGetMaxY(v29);
  if (originationDirection == 1) {
    double MinX = CGRectGetMinX(v24);
  }
  else {
    double MinX = CGRectGetMaxX(v24);
  }
  double v23 = v17 * 0.354320161 + v19 + MinY;
  if (v23 < MaxY - v19 + v17 * -0.645679839) {
    double v23 = MaxY - v19 + v17 * -0.645679839;
  }
  result.y = v23;
  result.x = MinX;
  return result;
}

- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationDirection:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  double v13 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v13, "moveToPoint:", v12, v11);
  if (a6 == 1)
  {
    -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", x, y);
    double y = v9 + (y - v9) * 0.5;
    double x = v10;
  }
  else
  {
    -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", v12, v11 + (y - v11) * 0.5);
  }
  -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", x, y);
  -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", v10, v9);
  return v13;
}

- (CGRect)pillRect
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIKBTutorialConversationBubble *)self balloonTailWidth];
  double v12 = 0.0;
  if (self->_originationDirection == 1) {
    double v12 = v11;
  }
  double v13 = v8 - v11;
  double v14 = v4 + v12;
  double v15 = v6;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v13;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (double)pillCornerRadius
{
  return 10.0;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2 = 21.0;
  if (self->_originationDirection == 1)
  {
    double v3 = 7.0;
  }
  else
  {
    double v2 = 7.0;
    double v3 = 14.0;
  }
  double v4 = 5.0;
  double v5 = 5.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (double)balloonTailHeight
{
  [(UIKBTutorialConversationBubble *)self balloonTailWidth];
  return v2 * 2.41;
}

- (double)balloonTailWidth
{
  [(UIKBTutorialConversationBubble *)self pillCornerRadius];
  UIRoundToViewScale(self);
  return result;
}

- (double)balloonTailRadius
{
  return 3.0;
}

- (double)balloonCornerRadius
{
  return 10.0;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
}

- (UIKBTutorialConversationBubbleShadowLayer)broadShadowLayer
{
  return self->_broadShadowLayer;
}

- (void)setBroadShadowLayer:(id)a3
{
}

- (UIKBTutorialConversationBubbleShadowLayer)tightShadowLayer
{
  return self->_tightShadowLayer;
}

- (void)setTightShadowLayer:(id)a3
{
}

- (UIKBTutorialConversationBubbleBackdropLayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)originationDirection
{
  return self->_originationDirection;
}

- (void)setOriginationDirection:(int64_t)a3
{
  self->_int64_t originationDirection = a3;
}

- (CGPoint)originationPoint
{
  double x = self->_originationPoint.x;
  double y = self->_originationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginationPoint:(CGPoint)a3
{
  self->_originationPoint = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  self->_preferredTailAttachmentPointXCoordinate = a3;
}

- (CGPoint)tailAttachmentPoint
{
  double x = self->_tailAttachmentPoint.x;
  double y = self->_tailAttachmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)parentAvatarViewSize
{
  double width = self->_parentAvatarViewSize.width;
  double height = self->_parentAvatarViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  self->_parentAvatarViewSize = a3;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
}

@end