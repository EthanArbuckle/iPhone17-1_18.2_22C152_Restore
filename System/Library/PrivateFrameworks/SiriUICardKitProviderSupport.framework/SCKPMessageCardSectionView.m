@interface SCKPMessageCardSectionView
- (BOOL)keyboardIsVisible;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SCKPMessageCardSectionView)initWithMessageCardSection:(id)a3 delegate:(id)a4;
- (id)displayedText;
- (int64_t)playButtonState;
- (void)_sendButtonPressed:(id)a3;
- (void)audioMessagePlayButtonTapped:(id)a3;
- (void)dismissKeyboard;
- (void)layoutSubviews;
- (void)setMessageContents:(id)a3;
- (void)setPlayButtonState:(int64_t)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)userDidTapAttachmentView:(id)a3;
@end

@implementation SCKPMessageCardSectionView

- (SCKPMessageCardSectionView)initWithMessageCardSection:(id)a3 delegate:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id obj = a4;
  v73.receiver = self;
  v73.super_class = (Class)SCKPMessageCardSectionView;
  v7 = [(SCKPMessageCardSectionView *)&v73 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, obj);
    int v9 = [v6 messageStatus];
    v8->_messageStatus = v9;
    if (v9 == 2
      && ([v6 audioMessageURL],
          v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = v10 == 0,
          v10,
          v11))
    {
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2050000000;
      v57 = (void *)getCKTextBalloonViewClass_softClass;
      uint64_t v77 = getCKTextBalloonViewClass_softClass;
      if (!getCKTextBalloonViewClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCKTextBalloonViewClass_block_invoke;
        v83 = &unk_26484DE68;
        v84 = &v74;
        __getCKTextBalloonViewClass_block_invoke((uint64_t)buf);
        v57 = (void *)v75[3];
      }
      v58 = v57;
      _Block_object_dispose(&v74, 8);
      id v59 = [v58 alloc];
      uint64_t v60 = objc_msgSend(v59, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      sentBalloonView = v8->_sentBalloonView;
      v8->_sentBalloonView = (CKTextBalloonView *)v60;

      [(CKTextBalloonView *)v8->_sentBalloonView setCanUseOpaqueMask:0];
      [(CKTextBalloonView *)v8->_sentBalloonView setOrientation:1];
      v62 = v8->_sentBalloonView;
      id v63 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v64 = [v6 messageText];
      v65 = (void *)v64;
      if (v64) {
        v66 = (__CFString *)v64;
      }
      else {
        v66 = &stru_26DD15188;
      }
      v80[0] = *MEMORY[0x263F814F0];
      v67 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
      v81[0] = v67;
      v80[1] = *MEMORY[0x263F81500];
      v68 = [MEMORY[0x263F1C550] whiteColor];
      v81[1] = v68;
      v69 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
      v70 = (void *)[v63 initWithString:v66 attributes:v69];
      [(CKTextBalloonView *)v62 setAttributedText:v70];
    }
    else
    {
      v12 = (UITextView *)objc_alloc_init(MEMORY[0x263F1CAC8]);
      textView = v8->_textView;
      v8->_textView = v12;

      v14 = [(UITextView *)v8->_textView layer];
      [v14 setCornerRadius:8.0];

      v15 = v8->_textView;
      uint64_t v71 = *MEMORY[0x263F1D260];
      v16 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:");
      [(UITextView *)v15 setFont:v16];

      v17 = v8->_textView;
      v18 = [v6 messageText];
      [(UITextView *)v17 setText:v18];

      v19 = v8->_textView;
      v20 = [MEMORY[0x263F1C550] clearColor];
      [(UITextView *)v19 setBackgroundColor:v20];

      -[UITextView setTextContainerInset:](v8->_textView, "setTextContainerInset:", 8.0, 4.0, 8.0, 4.0);
      [(UITextView *)v8->_textView setDelegate:v8];
    }
    v21 = [v6 audioMessageURL];

    if (v21)
    {
      v22 = [SCKPAudioMessageView alloc];
      v23 = [v6 audioMessageURL];
      uint64_t v24 = [(SCKPAudioMessageView *)v22 initWithAudioMessageURL:v23 delegate:v8];
      audioMessageView = v8->_audioMessageView;
      v8->_audioMessageView = (SCKPAudioMessageView *)v24;

      [(SCKPMessageCardSectionView *)v8 addSubview:v8->_audioMessageView];
      [(UITextView *)v8->_textView setHidden:1];
    }
    else if (v8->_messageStatus != 2)
    {
      v26 = (void *)MEMORY[0x263F1CB58];
      v27 = [MEMORY[0x263F1C480] effectWithStyle:18];
      v28 = [v26 effectForBlurEffect:v27 style:6];

      uint64_t v29 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v28];
      messageBackgroundView = v8->_messageBackgroundView;
      v8->_messageBackgroundView = (UIVisualEffectView *)v29;

      v31 = [(UIVisualEffectView *)v8->_messageBackgroundView contentView];
      v32 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
      [v31 setBackgroundColor:v32];

      v33 = [(UIVisualEffectView *)v8->_messageBackgroundView contentView];
      v34 = [v33 layer];
      [v34 setCornerRadius:8.0];

      [(SCKPMessageCardSectionView *)v8 addSubview:v8->_messageBackgroundView];
    }
    char v35 = _os_feature_enabled_impl();
    if (v8->_messageStatus == 2) {
      char v36 = 1;
    }
    else {
      char v36 = v35;
    }
    if ((v36 & 1) == 0)
    {
      v37 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
      sendButton = v8->_sendButton;
      v8->_sendButton = v37;

      v39 = v8->_sendButton;
      v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v41 = [v40 assistantUILocalizedStringForKey:@"SCKP_MESSAGE_SEND" table:0];
      [(UIButton *)v39 setTitle:v41 forState:0];

      v42 = v8->_sendButton;
      v43 = [MEMORY[0x263F1C550] colorWithRed:0.176470588 green:0.490196078 blue:0.964705882 alpha:1.0];
      [(UIButton *)v42 setTitleColor:v43 forState:0];

      v44 = [(UIButton *)v8->_sendButton titleLabel];
      v45 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
      [v44 setFont:v45];

      v46 = [(UIButton *)v8->_sendButton titleLabel];
      [v46 setAdjustsFontSizeToFitWidth:1];

      [(UIButton *)v8->_sendButton addTarget:v8 action:sel__sendButtonPressed_ forControlEvents:64];
      [(SCKPMessageCardSectionView *)v8 addSubview:v8->_sendButton];
    }
    [(SCKPMessageCardSectionView *)v8 addSubview:v8->_sentBalloonView];
    [(SCKPMessageCardSectionView *)v8 addSubview:v8->_textView];
    -[CKTextBalloonView setColor:](v8->_sentBalloonView, "setColor:", [v6 messageServiceType] == 1);
    [(CKTextBalloonView *)v8->_sentBalloonView prepareForDisplayIfNeeded];
    v47 = [v6 messageAttachment];
    if (v47)
    {
      v48 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SCKPMessageCardSectionView initWithMessageCardSection:delegate:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        _os_log_impl(&dword_228A19000, v48, OS_LOG_TYPE_DEFAULT, "%s #messages: Attempting to build attachment view with attachment:%@", buf, 0x16u);
      }
      v49 = [[SCKPMessageCardSectionAttachmentView alloc] initWithAttachment:v47];
      attachmentView = v8->_attachmentView;
      v8->_attachmentView = v49;

      [(SCKPMessageCardSectionAttachmentView *)v8->_attachmentView setDelegate:v8];
      if (v8->_messageStatus == 2) {
        [(SCKPMessageCardSectionAttachmentView *)v8->_attachmentView setAlignmentStyle:1];
      }
      [(SCKPMessageCardSectionView *)v8 addSubview:v8->_attachmentView];
      v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v52 = [v51 assistantUILocalizedStringForKey:@"SCKP_ATTACHMENT_PLACEHOLDER_TEXT" table:0];

      uint64_t v78 = *MEMORY[0x263F814F0];
      v53 = [MEMORY[0x263F81708] preferredFontForTextStyle:v71];
      v79 = v53;
      v54 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];

      v55 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v52 attributes:v54];
      [(UITextView *)v8->_textView setAttributedPlaceholder:v55];
    }
  }

  return v8;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)SCKPMessageCardSectionView;
  [(SCKPMessageCardSectionView *)&v33 layoutSubviews];
  [(SCKPMessageCardSectionView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  attachmentView = self->_attachmentView;
  if (attachmentView)
  {
    -[SCKPMessageCardSectionAttachmentView sizeThatFits:](attachmentView, "sizeThatFits:", v3 + -24.0, v4);
    double v13 = v12;
    double v14 = 12.0;
    double v16 = v15 + 12.0;
    if (self->_messageStatus == 2) {
      double v14 = v9 + -12.0 - v13;
    }
    -[SCKPMessageCardSectionAttachmentView setFrame:](self->_attachmentView, "setFrame:", v14, 12.0);
  }
  else
  {
    double v16 = 0.0;
  }
  if (self->_messageStatus == 2)
  {
    double v17 = v6 + 12.0;
    double v18 = v9 + -24.0;
    double v19 = v10 - (v16 + 12.0 + 12.0);
    double v32 = v8 + v16 + 12.0;
    [(SCKPAudioMessageView *)self->_audioMessageView setFrame:v6 + 12.0];
    double v20 = *MEMORY[0x263F001A8];
    double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
    -[UIVisualEffectView setFrame:](self->_messageBackgroundView, "setFrame:", *MEMORY[0x263F001A8], v21, v23, v22);
    p_sentBalloonView = (id *)&self->_sentBalloonView;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:](self->_sentBalloonView, "sizeThatFits:textAlignmentInsets:", 0, v18, v19);
    double v26 = v25;
    v27 = [(CKTextBalloonView *)self->_sentBalloonView attributedText];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      double v23 = v26 + 4.0;
      double v20 = v17 + v18 - (v26 + 4.0);
      double v21 = v32;
      double v22 = v19;
    }
  }
  else
  {
    double v22 = v10 - v16 + -24.0;
    sendButton = self->_sendButton;
    if (sendButton)
    {
      -[UIButton sizeThatFits:](sendButton, "sizeThatFits:", v9, v10);
      sendButton = self->_sendButton;
    }
    else
    {
      double v30 = *MEMORY[0x263F001B0];
    }
    if (v30 >= v9 * 0.5) {
      double v31 = v9 * 0.5;
    }
    else {
      double v31 = v30;
    }
    double v21 = v8 + 12.0 + v16;
    -[UIButton setFrame:](sendButton, "setFrame:", v6 + v9 - (v31 + 12.0), v21, v31, v22);
    double v23 = v9 - (v31 + 36.0);
    double v20 = v6 + 12.0;
    -[UITextView setFrame:](self->_textView, "setFrame:", v20, v21, v23, v22);
    -[SCKPAudioMessageView setFrame:](self->_audioMessageView, "setFrame:", v20, v21, v23, v22);
    p_sentBalloonView = (id *)&self->_messageBackgroundView;
  }
  objc_msgSend(*p_sentBalloonView, "setFrame:", v20, v21, v23, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIButton sizeThatFits:](self->_sendButton, "sizeThatFits:");
  if (v6 >= width * 0.5) {
    double v6 = width * 0.5;
  }
  double v7 = v6 + 36.0;
  double v8 = width - (v6 + 36.0);
  double v9 = height + -24.0;
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  audioMessageView = self->_audioMessageView;
  if (audioMessageView
    || (audioMessageView = self->_textView) != 0
    || (audioMessageView = self->_sentBalloonView,
        double v13 = *(double *)(MEMORY[0x263F001B0] + 8),
        double v14 = *MEMORY[0x263F001B0],
        audioMessageView))
  {
    objc_msgSend(audioMessageView, "sizeThatFits:", v8, v9);
    double v14 = v15;
    double v13 = v9;
  }
  sentBalloonView = self->_sentBalloonView;
  double v17 = 24.0;
  if (sentBalloonView && !self->_sendButton)
  {
    double v18 = [(CKTextBalloonView *)sentBalloonView attributedText];
    uint64_t v19 = [v18 length];

    if (!v19) {
      double v13 = v11;
    }
    double v17 = 24.0;
    if (!v19)
    {
      double v17 = 12.0;
      double v14 = v10;
    }
  }
  double v20 = v13 + v17;
  attachmentView = self->_attachmentView;
  if (attachmentView)
  {
    -[SCKPMessageCardSectionAttachmentView sizeThatFits:](attachmentView, "sizeThatFits:", width, height);
    double v20 = v20 + v22 + 12.0;
  }
  double v23 = v7 + v14;
  double v24 = v20;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (id)displayedText
{
  return [(UITextView *)self->_textView text];
}

- (void)textViewDidBeginEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageCardSectionViewBeganEditing:self];
}

- (void)textViewDidEndEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageCardSectionViewFinishedEditing:self];
}

- (void)_sendButtonPressed:(id)a3
{
  [(UIButton *)self->_sendButton setEnabled:0];
  [(UITextView *)self->_textView resignFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageCardSectionSendButtonTapped:self];
}

- (void)audioMessagePlayButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageCardSectionPlayButtonTapped:self];
}

- (void)setMessageContents:(id)a3
{
  [(UITextView *)self->_textView setText:a3];
  double v4 = [(UITextView *)self->_textView text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    double v6 = [(UITextView *)self->_textView text];
    uint64_t v7 = [v6 length] - 1;

    textView = self->_textView;
    -[UITextView scrollRangeToVisible:](textView, "scrollRangeToVisible:", v7, 1);
  }
}

- (void)dismissKeyboard
{
}

- (BOOL)keyboardIsVisible
{
  return [(UITextView *)self->_textView isFirstResponder];
}

- (int64_t)playButtonState
{
  return [(SCKPAudioMessageView *)self->_audioMessageView playButtonState];
}

- (void)setPlayButtonState:(int64_t)a3
{
}

- (void)userDidTapAttachmentView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageCardSectionAttachmentTapped:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBackgroundView, 0);
  objc_storeStrong((id *)&self->_audioMessageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachmentView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_sentBalloonView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end