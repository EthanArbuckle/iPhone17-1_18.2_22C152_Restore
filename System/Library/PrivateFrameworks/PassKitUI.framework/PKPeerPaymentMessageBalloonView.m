@interface PKPeerPaymentMessageBalloonView
- (CKTranscriptPluginBalloonView)balloonView;
- (PKPeerPaymentBubbleView)bubbleView;
- (PKPeerPaymentMessageBalloonView)initWithBubbleView:(id)a3 peerPaymentType:(int64_t)a4;
- (int64_t)peerPaymentType;
- (void)_updateTailOrientation;
- (void)layoutSubviews;
- (void)setBalloonView:(id)a3;
- (void)setHasTail:(BOOL)a3;
@end

@implementation PKPeerPaymentMessageBalloonView

- (PKPeerPaymentMessageBalloonView)initWithBubbleView:(id)a3 peerPaymentType:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentMessageBalloonView;
  v8 = [(PKPeerPaymentMessageBalloonView *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bubbleView, a3);
    v9->_peerPaymentType = a4;
    id v10 = objc_alloc_init(getCKTranscriptPluginBalloonViewClass());
    [v10 setCanUseOpaqueMask:0];
    objc_msgSend(v10, "setTextAlignmentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v10 setPluginView:v7];
    [v10 setIsInteractive:1];
    balloonView = v9->_balloonView;
    v9->_balloonView = (CKTranscriptPluginBalloonView *)v10;
    id v12 = v10;

    [(PKPeerPaymentMessageBalloonView *)v9 _updateTailOrientation];
    [(CKTranscriptPluginBalloonView *)v9->_balloonView prepareForDisplay];
    [(PKPeerPaymentMessageBalloonView *)v9 addSubview:v9->_balloonView];
  }
  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessageBalloonView;
  [(PKPeerPaymentMessageBalloonView *)&v3 layoutSubviews];
  [(PKPeerPaymentMessageBalloonView *)self bounds];
  -[CKTranscriptPluginBalloonView setFrame:](self->_balloonView, "setFrame:");
}

- (void)setHasTail:(BOOL)a3
{
}

- (void)_updateTailOrientation
{
  id v12 = [(objc_class *)getCKUIBehaviorClass() sharedBehaviors];
  int64_t peerPaymentType = self->_peerPaymentType;
  if (peerPaymentType == 2)
  {
    [(CKTranscriptPluginBalloonView *)self->_balloonView setHasTail:1];
    [(CKTranscriptPluginBalloonView *)self->_balloonView setOrientation:0];
    v5 = v12;
    bubbleView = self->_bubbleView;
    if (v12)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
LABEL_9:
    double v7 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    goto LABEL_10;
  }
  if (peerPaymentType != 1)
  {
    [(CKTranscriptPluginBalloonView *)self->_balloonView setHasTail:0];
    v11 = self->_bubbleView;
    double v7 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    goto LABEL_11;
  }
  [(CKTranscriptPluginBalloonView *)self->_balloonView setHasTail:1];
  [(CKTranscriptPluginBalloonView *)self->_balloonView setOrientation:1];
  bubbleView = self->_bubbleView;
  v5 = v12;
  if (!v12) {
    goto LABEL_9;
  }
  uint64_t v6 = 1;
LABEL_7:
  [v5 pluginBalloonInsetsForMessageFromMe:v6];
LABEL_10:
  v11 = bubbleView;
LABEL_11:
  -[PKPeerPaymentBubbleView setContentInset:](v11, "setContentInset:", v7, v8, v9, v10);
}

- (PKPeerPaymentBubbleView)bubbleView
{
  return self->_bubbleView;
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (CKTranscriptPluginBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);

  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end