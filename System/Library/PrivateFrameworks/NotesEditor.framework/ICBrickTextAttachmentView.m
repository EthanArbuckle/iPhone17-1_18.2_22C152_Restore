@interface ICBrickTextAttachmentView
- (BOOL)shouldForceLightContent;
- (CGSize)attachmentSizeForTextContainer:(id)a3;
- (ICAttachmentBrickView)attachmentBrickView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)imageForPrinting;
- (id)quickLookTransitionView;
- (void)dealloc;
- (void)didChangeAttachment;
- (void)didChangeAttachmentTitle;
- (void)requestAttachmentContentUpdate;
- (void)setAttachmentBrickView:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setupConstraints;
- (void)sharedInit:(BOOL)a3;
- (void)updateCornerRadius;
@end

@implementation ICBrickTextAttachmentView

- (id)accessibilityLabel
{
  v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  v3 = [v2 accessibilityHint];

  return v3;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  v3 = [v2 accessibilityUserInputLabels];

  return v3;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  id v4 = a3;
  [v4 size];
  if (v5 <= 0.0)
  {
    double v15 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    [v4 size];
    double v7 = v6;
    v8 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
    [v8 computedSize];
    double v10 = v9;
    double v12 = v11;

    [v4 lineFragmentPadding];
    double v14 = v7 + v13 * -2.0;
    if (v14 >= v10) {
      double v15 = v10;
    }
    else {
      double v15 = v14;
    }
  }

  double v16 = v15;
  double v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)sharedInit:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICBrickTextAttachmentView;
  [(ICAttachmentView *)&v9 sharedInit:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F5B220]) initWithType:2];
  [(ICBrickTextAttachmentView *)self setAttachmentBrickView:v4];

  double v5 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v6 = [(ICAttachmentView *)self insideSystemPaper];
  double v7 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v7 setInsideSystemPaper:v6];

  v8 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [(ICBrickTextAttachmentView *)self addSubview:v8];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICBrickTextAttachmentView;
  [(ICAttachmentView *)&v4 dealloc];
}

- (void)setupConstraints
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v4 = (void *)MEMORY[0x263F08938];
  double v11 = @"brick";
  double v5 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  v12[0] = v5;
  BOOL v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v7 = [v4 constraintsWithVisualFormat:@"H:|-0-[brick]-0-|" options:0 metrics:0 views:v6];
  [v3 addObjectsFromArray:v7];

  v8 = (void *)MEMORY[0x263F08938];
  objc_super v9 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  double v10 = [v8 constraintWithItem:v9 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v10];

  [MEMORY[0x263F08938] activateConstraints:v3];
}

- (void)requestAttachmentContentUpdate
{
  id v3 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v3 reloadData];

  [(ICBrickTextAttachmentView *)self updateCornerRadius];
}

- (void)didChangeAttachment
{
  id v3 = [(ICBrickTextAttachmentView *)self attachment];
  objc_super v4 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v4 setAttachment:v3];

  v5.receiver = self;
  v5.super_class = (Class)ICBrickTextAttachmentView;
  [(ICBrickTextAttachmentView *)&v5 didChangeAttachment];
  [(ICBrickTextAttachmentView *)self updateCornerRadius];
}

- (void)didChangeAttachmentTitle
{
  id v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v2 updateTitle];
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICBrickTextAttachmentView;
  id v4 = a3;
  [(ICBrickTextAttachmentView *)&v6 setHighlightPatternRegexFinder:v4];
  objc_super v5 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v5 setHighlightPatternRegexFinder:v4];
}

- (void)setHighlightColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICBrickTextAttachmentView;
  id v4 = a3;
  [(ICBrickTextAttachmentView *)&v6 setHighlightColor:v4];
  objc_super v5 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v5 setHighlightColor:v4];
}

- (id)quickLookTransitionView
{
  id v2 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  id v3 = [v2 quickLookTransitionView];

  return v3;
}

- (id)imageForPrinting
{
  id v3 = [(ICBrickTextAttachmentView *)self attachment];
  int v4 = [v3 usesLinkPresentation];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F5B390]);
    objc_super v6 = [(ICBrickTextAttachmentView *)self attachment];
    double v7 = (void *)[v5 initWithAttachment:v6];

    objc_msgSend(v7, "setForcesLightMode:", -[ICBrickTextAttachmentView shouldForceLightContent](self, "shouldForceLightContent"));
    v8 = [v7 snapshot];
  }
  else
  {
    [(ICBrickTextAttachmentView *)self layoutIfNeeded];
    id v9 = (id)[(ICBrickTextAttachmentView *)self snapshotViewAfterScreenUpdates:1];
    v8 = [(ICBrickTextAttachmentView *)self ic_imageRenderedFromLayer];
  }

  return v8;
}

- (void)updateCornerRadius
{
  id v6 = [(ICBrickTextAttachmentView *)self attachmentBrickView];
  [v6 effectiveLayoutCornerRadius];
  double v4 = v3;
  id v5 = [(ICBrickTextAttachmentView *)self layer];
  [v5 setCornerRadius:v4];
}

- (BOOL)shouldForceLightContent
{
  double v3 = [(ICAttachmentView *)self textContainer];
  double v4 = [v3 tk2TextView];

  objc_opt_class();
  if (v4)
  {
    id v5 = [v4 textStorage];
    id v6 = ICDynamicCast();

    double v7 = [v6 styler];
    char v8 = [v7 isForPrint];
  }
  else
  {
    id v9 = [(ICAttachmentView *)self textContainer];
    double v10 = [v9 layoutManager];
    id v6 = ICDynamicCast();

    char v8 = [v6 isRenderingImageForPrint];
  }

  return v8;
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end