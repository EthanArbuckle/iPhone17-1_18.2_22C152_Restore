@interface SiriSharedUISuggestionsHostView
- (CGSize)intrinsicContentSize;
- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate;
- (SiriSharedUIStackableContentDelegate)stackContainerDelegate;
- (SiriSharedUISuggestionsHostView)initWithSuggestionsView:(id)a3;
- (SiriSharedUIViewStackConstraints)stackConstraints;
- (UIView)suggestionsView;
- (double)attachmentYOffset;
- (id)preferredAccessibilityElementToFocus;
- (int64_t)attachmentType;
- (void)_configureConstraints;
- (void)invalidateIntrinsicContentSize;
- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setAttachmentYOffset:(double)a3;
- (void)setStackConstraints:(id)a3;
- (void)setStackContainerDelegate:(id)a3;
- (void)setSuggestionsView:(id)a3;
@end

@implementation SiriSharedUISuggestionsHostView

- (SiriSharedUISuggestionsHostView)initWithSuggestionsView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUISuggestionsHostView;
  v5 = -[SiriSharedUISuggestionsHostView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x263F825C8] clearColor];
    [v4 setBackgroundColor:v6];

    [(SiriSharedUISuggestionsHostView *)v5 setSuggestionsView:v4];
    [(SiriSharedUISuggestionsHostView *)v5 addSubview:v4];
    [(SiriSharedUISuggestionsHostView *)v5 _configureConstraints];
  }

  return v5;
}

- (void)_configureConstraints
{
  v21[4] = *MEMORY[0x263EF8340];
  v13 = (void *)MEMORY[0x263F08938];
  v19 = [(SiriSharedUISuggestionsHostView *)self leadingAnchor];
  v20 = [(SiriSharedUISuggestionsHostView *)self suggestionsView];
  v18 = [v20 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v21[0] = v17;
  v15 = [(SiriSharedUISuggestionsHostView *)self trailingAnchor];
  v16 = [(SiriSharedUISuggestionsHostView *)self suggestionsView];
  v14 = [v16 trailingAnchor];
  v3 = [v15 constraintEqualToAnchor:v14];
  v21[1] = v3;
  id v4 = [(SiriSharedUISuggestionsHostView *)self topAnchor];
  v5 = [(SiriSharedUISuggestionsHostView *)self suggestionsView];
  v6 = [v5 topAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v21[2] = v7;
  objc_super v8 = [(SiriSharedUISuggestionsHostView *)self bottomAnchor];
  v9 = [(SiriSharedUISuggestionsHostView *)self suggestionsView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v21[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  [v13 activateConstraints:v12];
}

- (id)preferredAccessibilityElementToFocus
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SiriSharedUISuggestionsHostView *)self suggestionsView];
  [v3 intrinsicContentSize];
  double v5 = v4;

  v6 = [(SiriSharedUISuggestionsHostView *)self stackContainerDelegate];
  [v6 stackableContentMaximumContainerWidth];
  double v8 = v7;

  double v9 = v8;
  double v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUISuggestionsHostView;
  [(SiriSharedUISuggestionsHostView *)&v4 invalidateIntrinsicContentSize];
  v3 = [(SiriSharedUISuggestionsHostView *)self stackContainerDelegate];
  [(SiriSharedUISuggestionsHostView *)self intrinsicContentSize];
  objc_msgSend(v3, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 1);
}

- (int64_t)attachmentType
{
  return self->attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->attachmentType = a3;
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stackContainerDelegate);
  return (SiriSharedUIStackableContentDelegate *)WeakRetained;
}

- (void)setStackContainerDelegate:(id)a3
{
}

- (double)attachmentYOffset
{
  return self->attachmentYOffset;
}

- (void)setAttachmentYOffset:(double)a3
{
  self->attachmentYOffset = a3;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
}

- (UIView)suggestionsView
{
  return self->_suggestionsView;
}

- (void)setSuggestionsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->stackConstraints, 0);
}

@end