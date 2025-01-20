@interface MFExpandedMessageCell
+ (double)defaultSemiExpandedHeightWithDisplayMetrics:(id)a3;
- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3;
- (BOOL)expanded;
- (BOOL)hasVisibleContent;
- (BOOL)isConfiguredForSingleMessageDisplay;
- (BOOL)onlyMaskBottomCorners;
- (BOOL)shouldArchiveByDefault;
- (MFMessageViewController)messageViewController;
- (void)_displayMetricsDidChange;
- (void)prepareForQuickReplyAnimationWithContext:(id)a3;
- (void)prepareForReuse;
- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4;
- (void)setMessageViewController:(id)a3;
- (void)setOnlyMaskBottomCorners:(BOOL)a3;
- (void)setPredictedMailbox:(id)a3;
- (void)setShouldArchiveByDefault:(BOOL)a3;
@end

@implementation MFExpandedMessageCell

+ (double)defaultSemiExpandedHeightWithDisplayMetrics:(id)a3
{
  return 500.0;
}

- (void)setMessageViewController:(id)a3
{
  v5 = (MFMessageViewController *)a3;
  messageViewController = self->_messageViewController;
  v15 = v5;
  if (messageViewController != v5)
  {
    v7 = [(MFMessageViewController *)messageViewController view];
    [v7 removeFromSuperview];

    objc_storeStrong((id *)&self->_messageViewController, a3);
    v8 = [(MFExpandedMessageCell *)self messageViewController];
    v9 = [v8 view];

    v10 = [(MFExpandedMessageCell *)self contentView];
    [v10 bounds];
    [v9 setFrame:];

    [v9 setAutoresizingMask:18];
    v11 = [(MFExpandedMessageCell *)self contentView];
    [v11 addSubview:v9];

    v12 = [(MFConversationViewCell *)self displayMetrics];
    v13 = [(MFExpandedMessageCell *)self messageViewController];
    v14 = [v13 messageContentView];
    [v14 setDisplayMetrics:v12];

    [(MFExpandedMessageCell *)self setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewMessage];
  }
}

- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_configuredForSingleMessageDisplay = a3;
  v5 = [(MFExpandedMessageCell *)self messageViewController];
  [v5 setConfiguredForSingleMessageDisplay:v3];

  BOOL v6 = (+[UIDevice mf_isPad] & 1) != 0
    || !self->_configuredForSingleMessageDisplay
    || [(MFExpandedMessageCell *)self onlyMaskBottomCorners];

  [(MFMessageConversationViewCell *)self setRoundsCellCorners:v6];
}

- (void)setOnlyMaskBottomCorners:(BOOL)a3
{
  if (self->_onlyMaskBottomCorners != a3)
  {
    BOOL v3 = a3;
    self->_onlyMaskBottomCorners = a3;
    v5 = [(MFExpandedMessageCell *)self contentView];
    id v8 = [v5 layer];

    if (v3) {
      uint64_t v6 = 12;
    }
    else {
      uint64_t v6 = 15;
    }
    [v8 setMaskedCorners:v6];
    BOOL v7 = (+[UIDevice mf_isPad] & 1) != 0
      || !self->_configuredForSingleMessageDisplay
      || [(MFExpandedMessageCell *)self onlyMaskBottomCorners];
    [(MFMessageConversationViewCell *)self setRoundsCellCorners:v7];
  }
}

- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4
{
  id v8 = [(MFExpandedMessageCell *)self messageViewController];
  uint64_t v6 = [v8 messageContentView];
  BOOL v7 = [v6 headerView];
  [v7 setMessageFlags:a3 conversationFlags:a4];
}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  id v5 = a3;
  v4 = [(MFExpandedMessageCell *)self messageViewController];
  [v4 prepareForQuickReplyAnimationWithContext:v5];
}

- (void)_displayMetricsDidChange
{
  id v5 = [(MFConversationViewCell *)self displayMetrics];
  BOOL v3 = [(MFExpandedMessageCell *)self messageViewController];
  v4 = [v3 messageContentView];
  [v4 setDisplayMetrics:v5];
}

- (BOOL)expanded
{
  return 1;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFExpandedMessageCell;
  -[MFMessageConversationViewCell setInteractivelyResizing:](&v16, "setInteractivelyResizing:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(MFExpandedMessageCell *)self messageViewController];
  uint64_t v6 = [v5 messageContentView];
  BOOL v7 = [v6 headerView];
  id v8 = [v7 headerBlocks];

  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setInteractivelyResizing:v3];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldArchiveByDefault = a3;
  id v5 = [(MFExpandedMessageCell *)self messageViewController];
  v4 = [v5 messageContentView];
  [v4 setShouldArchiveByDefault:v3];
}

- (void)setPredictedMailbox:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFExpandedMessageCell;
  [(MFMessageConversationViewCell *)&v6 setPredictedMailbox:v4];
  id v5 = [(MFExpandedMessageCell *)self messageViewController];
  [v5 setPredictedMailbox:v4];
}

- (BOOL)hasVisibleContent
{
  v2 = [(MFExpandedMessageCell *)self messageViewController];
  BOOL v3 = [v2 messageContentView];
  unsigned __int8 v4 = [v3 hasVisibleContent];

  return v4;
}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(MFExpandedMessageCell *)self messageViewController];
  BOOL v7 = [v6 messageContentView];
  id v8 = [v7 headerView];

  -[MFExpandedMessageCell convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v8 draggableArea];
  v16.double x = v10;
  v16.double y = v12;
  if (CGRectContainsPoint(v17, v16))
  {
    long long v13 = -[MFExpandedMessageCell hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y);
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

- (void)prepareForReuse
{
  [(MFExpandedMessageCell *)self setOnlyMaskBottomCorners:0];
  v3.receiver = self;
  v3.super_class = (Class)MFExpandedMessageCell;
  [(MFMessageConversationViewCell *)&v3 prepareForReuse];
}

- (MFMessageViewController)messageViewController
{
  return self->_messageViewController;
}

- (BOOL)isConfiguredForSingleMessageDisplay
{
  return self->_configuredForSingleMessageDisplay;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (BOOL)onlyMaskBottomCorners
{
  return self->_onlyMaskBottomCorners;
}

- (void).cxx_destruct
{
}

@end