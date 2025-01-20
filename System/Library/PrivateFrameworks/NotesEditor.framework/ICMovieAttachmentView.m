@interface ICMovieAttachmentView
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)allowsPictureInPicture;
- (BOOL)icaxIsShowingPlayer;
- (CALayer)playButtonLayer;
- (CGRect)playButtonFrame;
- (UIImage)playButtonImage;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)icaxHintString;
- (id)placeholderImageSystemName;
- (void)didChangeAttachment;
- (void)didChangeMedia;
- (void)didTapAttachment:(id)a3;
- (void)setIcaxIsShowingPlayer:(BOOL)a3;
- (void)setPlayButtonFrame:(CGRect)a3;
- (void)setPlayButtonImage:(id)a3;
- (void)setPlayButtonLayer:(id)a3;
- (void)setShowLoadingImage:(BOOL)a3;
- (void)sharedInit:(BOOL)a3;
- (void)updateImageSize;
- (void)willDeleteAttachment;
@end

@implementation ICMovieAttachmentView

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 localizedStringForKey:@"movie attachment" value:&stru_26C10E100 table:0];

  v7 = [(ICAttachmentView *)self icaxAttachmentViewTypeDescription];
  v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (id)icaxHintString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Double tap to play movie" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityUserInputLabels
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 localizedStringForKey:@"Movie" value:&stru_26C10E100 table:0];
  v8[0] = v4;
  v5 = [(ICMovieAttachmentView *)self accessibilityLabel];
  v8[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v6;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)sharedInit:(BOOL)a3
{
  v37.receiver = self;
  v37.super_class = (Class)ICMovieAttachmentView;
  [(ICImageAttachmentView *)&v37 sharedInit:a3];
  v4 = [MEMORY[0x263F827E8] imageNamed:@"attachment_video_play"];
  [(ICMovieAttachmentView *)self setPlayButtonImage:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(ICMovieAttachmentView *)self setPlayButtonLayer:v5];

  [(ICMovieAttachmentView *)self bounds];
  double v7 = v6;
  [(ICMovieAttachmentView *)self bounds];
  double v9 = v8;
  v10 = [(ICMovieAttachmentView *)self playButtonImage];
  [v10 size];
  double v12 = v7 + (v9 - v11) * 0.5;

  double v13 = fmax(v12, 0.0);
  [(ICMovieAttachmentView *)self bounds];
  double v15 = v14;
  [(ICMovieAttachmentView *)self bounds];
  double v17 = v16;
  v18 = [(ICMovieAttachmentView *)self playButtonImage];
  [v18 size];
  double v20 = v15 + (v17 - v19) * 0.5;

  double v21 = fmax(v20, 0.0);
  v22 = [(ICMovieAttachmentView *)self playButtonImage];
  [v22 size];
  double v24 = v23;
  double v26 = v25;

  -[ICMovieAttachmentView setPlayButtonFrame:](self, "setPlayButtonFrame:", v13, v21, v24, v26);
  v27 = [(ICMovieAttachmentView *)self playButtonLayer];
  objc_msgSend(v27, "setFrame:", v13, v21, v24, v26);

  uint64_t v28 = *MEMORY[0x263F15E10];
  v29 = [(ICMovieAttachmentView *)self playButtonLayer];
  [v29 setContentsGravity:v28];

  [(ICMovieAttachmentView *)self setClipsToBounds:1];
  v30 = [(ICMovieAttachmentView *)self playButtonImage];
  uint64_t v31 = objc_msgSend(v30, "ic_CGImage");
  v32 = [(ICMovieAttachmentView *)self playButtonLayer];
  [v32 setContents:v31];

  v33 = [(ICMovieAttachmentView *)self playButtonLayer];
  [v33 setOpacity:0.0];

  v34 = [(ICMovieAttachmentView *)self layer];
  v35 = [(ICMovieAttachmentView *)self playButtonLayer];
  v36 = [(ICImageAttachmentView *)self imageLayer];
  [v34 insertSublayer:v35 above:v36];
}

- (BOOL)allowsPictureInPicture
{
  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(ICMovieAttachmentView *)v2 nextResponder];

      v2 = (ICMovieAttachmentView *)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    v2 = v2;
  }
LABEL_6:
  char v4 = [(ICMovieAttachmentView *)v2 isEditingOnSystemPaper] ^ 1;

  return v4;
}

- (void)updateImageSize
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  uint64_t v3 = [(ICImageAttachmentView *)self imageLayer];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(ICImageAttachmentView *)self imageSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(ICImageAttachmentView *)self imageLayer];
  [v12 frame];
  if (TSDNearlyEqualSizes())
  {
    double v13 = [(ICImageAttachmentView *)self imageLayer];
    [v13 frame];
    BOOL v16 = v15 == *(double *)(MEMORY[0x263F001B0] + 8) && v14 == *MEMORY[0x263F001B0];
  }
  else
  {
    BOOL v16 = 1;
  }

  double v17 = [(ICImageAttachmentView *)self imageLayer];
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  [(ICMovieAttachmentView *)self bounds];
  double v19 = v18;
  [(ICMovieAttachmentView *)self bounds];
  double v21 = v20;
  v22 = [(ICMovieAttachmentView *)self playButtonImage];
  [v22 size];
  double v24 = v19 + (v21 - v23) * 0.5;

  double v25 = fmax(v24, 0.0);
  [(ICMovieAttachmentView *)self bounds];
  double v27 = v26;
  [(ICMovieAttachmentView *)self bounds];
  double v29 = v28;
  v30 = [(ICMovieAttachmentView *)self playButtonImage];
  [v30 size];
  double v32 = v27 + (v29 - v31) * 0.5;

  double v33 = fmax(v32, 0.0);
  v34 = [(ICMovieAttachmentView *)self playButtonImage];
  [v34 size];
  double v36 = v35;
  double v38 = v37;

  -[ICMovieAttachmentView setPlayButtonFrame:](self, "setPlayButtonFrame:", v25, v33, v36, v38);
  v39 = [(ICMovieAttachmentView *)self playButtonLayer];
  objc_msgSend(v39, "setFrame:", v25, v33, v36, v38);

  v40 = [(ICMovieAttachmentView *)self playButtonLayer];
  LODWORD(v41) = 1.0;
  [v40 setOpacity:v41];

  [MEMORY[0x263F158F8] commit];
  if (v16)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__ICMovieAttachmentView_updateImageSize__block_invoke;
    block[3] = &unk_2640B8140;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __40__ICMovieAttachmentView_updateImageSize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeSize];
}

- (void)willDeleteAttachment
{
}

- (void)didChangeAttachment
{
  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  [(ICImageAttachmentView *)&v6 didChangeAttachment];
  uint64_t v3 = +[ICMovieController sharedController];
  double v4 = [v3 activeMovieAttachmentView];

  if (v4 == self)
  {
    double v5 = +[ICMovieController sharedController];
    [v5 updatePlayer];
  }
}

- (void)didChangeMedia
{
  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  [(ICImageAttachmentView *)&v6 didChangeMedia];
  uint64_t v3 = +[ICMovieController sharedController];
  double v4 = [v3 activeMovieAttachmentView];

  if (v4 == self)
  {
    double v5 = +[ICMovieController sharedController];
    [v5 updatePlayer];
  }
}

- (void)didTapAttachment:(id)a3
{
  id v4 = a3;
  if ([(ICMovieAttachmentView *)self ic_isInSecureWindow])
  {
    v9.receiver = self;
    v9.super_class = (Class)ICMovieAttachmentView;
    [(ICAttachmentView *)&v9 didTapAttachment:v4];
  }
  else
  {
    double v5 = [(ICAttachmentView *)self textView];
    [v5 resignFirstResponder];

    objc_super v6 = +[ICMovieController sharedController];
    [v6 setActiveMovieAttachmentView:self];

    double v7 = +[ICMovieController sharedController];
    [v7 updatePlayer];

    double v8 = +[ICMovieController sharedController];
    [v8 moviePlayerTapped];
  }
}

- (void)setShowLoadingImage:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICMovieAttachmentView;
  -[ICImageAttachmentView setShowLoadingImage:](&v6, sel_setShowLoadingImage_);
  double v5 = [(ICMovieAttachmentView *)self playButtonLayer];
  [v5 setHidden:v3];
}

- (id)placeholderImageSystemName
{
  return @"photo.tv";
}

- (CALayer)playButtonLayer
{
  return self->playButtonLayer;
}

- (void)setPlayButtonLayer:(id)a3
{
}

- (UIImage)playButtonImage
{
  return self->playButtonImage;
}

- (void)setPlayButtonImage:(id)a3
{
}

- (CGRect)playButtonFrame
{
  double x = self->_playButtonFrame.origin.x;
  double y = self->_playButtonFrame.origin.y;
  double width = self->_playButtonFrame.size.width;
  double height = self->_playButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPlayButtonFrame:(CGRect)a3
{
  self->_playButtonFrame = a3;
}

- (BOOL)icaxIsShowingPlayer
{
  return self->_icaxIsShowingPlayer;
}

- (void)setIcaxIsShowingPlayer:(BOOL)a3
{
  self->_icaxIsShowingPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->playButtonImage, 0);

  objc_storeStrong((id *)&self->playButtonLayer, 0);
}

@end