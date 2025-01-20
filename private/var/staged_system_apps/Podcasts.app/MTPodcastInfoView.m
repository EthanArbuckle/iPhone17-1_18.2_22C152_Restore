@interface MTPodcastInfoView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (IMExpandingLabel)descriptionView;
- (MTPodcastInfoView)initWithPodcastUuid:(id)a3;
- (MTPodcastInfoViewDelegate)delegate;
- (NSString)podcastUuid;
- (UIButton)settingsButton;
- (UIButton)shareButton;
- (UIImageView)imageView;
- (UILabel)authorLabel;
- (UILabel)titleLabel;
- (UIView)bottomSeparator;
- (UIView)separatorBelowAuthor;
- (id)metricsContentIdentifier;
- (id)metricsName;
- (void)_updateFonts;
- (void)addSubviews;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)descriptionViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)setAuthorLabel:(id)a3;
- (void)setBottomSeparator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setSeparatorBelowAuthor:(id)a3;
- (void)setSettingsButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)update;
@end

@implementation MTPodcastInfoView

- (MTPodcastInfoView)initWithPodcastUuid:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTPodcastInfoView;
  v6 = [(MTPodcastInfoView *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    [(MTPodcastInfoView *)v7 addSubviews];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v9 = +[UIColor whiteColor];
    [(MTPodcastInfoView *)v7 setBackgroundColor:v9];

    [(MTPodcastInfoView *)v7 setLayoutMarginsFollowReadableWidth:1];
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTPodcastInfoView;
  [(MTPodcastInfoView *)&v4 dealloc];
}

- (void)addSubviews
{
  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  id v5 = +[UIColor blackColor];
  id v6 = [v5 CGColor];
  v7 = [(UIImageView *)self->_imageView layer];
  [v7 setShadowColor:v6];

  v8 = [(UIImageView *)self->_imageView layer];
  [v8 setShadowRadius:23.0];

  v9 = [(UIImageView *)self->_imageView layer];
  [v9 setShadowOffset:0.0, 5.0];

  v10 = [(UIImageView *)self->_imageView layer];
  LODWORD(v11) = 1045220557;
  [v10 setShadowOpacity:v11];

  v12 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v14 = self->_titleLabel;
  v15 = +[UIColor blackColor];
  [(UILabel *)v14 setTextColor:v15];

  v16 = self->_titleLabel;
  v17 = +[UIColor clearColor];
  [(UILabel *)v16 setBackgroundColor:v17];

  [(UILabel *)self->_titleLabel setLineBreakMode:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v18 = (UILabel *)objc_alloc_init((Class)UILabel);
  authorLabel = self->_authorLabel;
  self->_authorLabel = v18;

  [(UILabel *)self->_authorLabel setTextAlignment:1];
  v20 = self->_authorLabel;
  v21 = +[UIColor blackColor];
  [(UILabel *)v20 setTextColor:v21];

  v22 = self->_authorLabel;
  v23 = +[UIColor clearColor];
  [(UILabel *)v22 setBackgroundColor:v23];

  [(UILabel *)self->_authorLabel setLineBreakMode:0];
  [(UILabel *)self->_authorLabel setNumberOfLines:0];
  v24 = (UIView *)objc_alloc_init((Class)UIView);
  separatorBelowAuthor = self->_separatorBelowAuthor;
  self->_separatorBelowAuthor = v24;

  v26 = self->_separatorBelowAuthor;
  v27 = +[UIColor cellSeparatorColor];
  [(UIView *)v26 setBackgroundColor:v27];

  v28 = (IMExpandingLabel *)objc_alloc_init((Class)IMExpandingLabel);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v28;

  [(IMExpandingLabel *)self->_descriptionView setScrollEnabled:0];
  [(IMExpandingLabel *)self->_descriptionView setNumberOfLines:4];
  [(IMExpandingLabel *)self->_descriptionView setExpanded:0];
  id v33 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"descriptionViewTapped:"];
  [v33 setDelegate:self];
  [(IMExpandingLabel *)self->_descriptionView addGestureRecognizer:v33];
  v30 = (UIView *)objc_alloc_init((Class)UIView);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v30;

  v32 = +[UIColor cellSeparatorColor];
  [(UIView *)self->_bottomSeparator setBackgroundColor:v32];

  [(MTPodcastInfoView *)self _updateFonts];
  [(MTPodcastInfoView *)self addSubview:self->_imageView];
  [(MTPodcastInfoView *)self addSubview:self->_titleLabel];
  [(MTPodcastInfoView *)self addSubview:self->_authorLabel];
  [(MTPodcastInfoView *)self addSubview:self->_separatorBelowAuthor];
  [(MTPodcastInfoView *)self addSubview:self->_descriptionView];
  [(MTPodcastInfoView *)self addSubview:self->_bottomSeparator];
  [(MTPodcastInfoView *)self update];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)MTPodcastInfoView;
  [(MTPodcastInfoView *)&v47 layoutSubviews];
  [(MTPodcastInfoView *)self bounds];
  double Width = CGRectGetWidth(v48);
  double v4 = Width + -30.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  double v6 = v5;
  double v8 = v7;
  IMRoundToPixel();
  double v10 = v9;
  double v11 = [(UILabel *)self->_titleLabel font];
  [v11 mt_offsetFromCapHeightToAscent];
  IMRoundToPixel();
  double v13 = v12;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v10, v13, v6, v8);
  -[UILabel sizeThatFits:](self->_authorLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  double v15 = v14;
  double v17 = v16;
  IMRoundToPixel();
  double v19 = v18;
  [(UILabel *)self->_titleLabel frame];
  double MaxY = CGRectGetMaxY(v49);
  v21 = +[UIScreen mainScreen];
  [v21 scale];
  double v23 = v22;

  -[UILabel setFrame:](self->_authorLabel, "setFrame:", v19, MaxY + 1.0 / v23, v15, v17);
  [(UILabel *)self->_authorLabel frame];
  CGRectGetMaxY(v50);
  v24 = [(UILabel *)self->_authorLabel font];
  [v24 mt_offsetFromCapHeightToAscent];
  IMRoundToPixel();
  double v26 = v25;

  CGFloat v27 = Width + -15.0 + -15.0;
  v28 = +[UIScreen mainScreen];
  [v28 scale];
  double v30 = v29;

  CGFloat v31 = 1.0 / v30;
  -[UIView setFrame:](self->_separatorBelowAuthor, "setFrame:", 15.0, v26, v27, v31);
  [(MTPodcastInfoView *)self layoutMargins];
  double v33 = v32;
  [(MTPodcastInfoView *)self layoutMargins];
  double v35 = v4 - (v33 + v34);
  [(IMExpandingLabel *)self->_descriptionView heightForWidth:v35];
  double v37 = v36;
  [(MTPodcastInfoView *)self layoutMargins];
  v51.origin.x = 15.0;
  double v39 = v38 + 15.0;
  v51.origin.y = v26;
  v51.size.width = v27;
  v51.size.height = v31;
  -[IMExpandingLabel setFrame:](self->_descriptionView, "setFrame:", v39, CGRectGetMaxY(v51) + 14.0, v35, v37);
  [(IMExpandingLabel *)self->_descriptionView frame];
  CGFloat v40 = CGRectGetMaxY(v52) + 14.0;
  [(MTPodcastInfoView *)self frame];
  double v42 = v41;
  v43 = +[UIScreen mainScreen];
  [v43 scale];
  double v45 = v44;

  -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, v40, v42, 1.0 / v45);
  [(MTPodcastInfoView *)self frame];
  -[MTPodcastInfoView setFrame:](self, "setFrame:", 0.0, 0.0);
  v46 = [(MTPodcastInfoView *)self delegate];
  [v46 podcastInfoViewDidExpand:self];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(MTPodcastInfoView *)self _updateFonts];
  [(MTPodcastInfoView *)self setNeedsLayout];

  [(MTPodcastInfoView *)self layoutIfNeeded];
}

- (void)_updateFonts
{
  v3 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_titleLabel setFont:v3];

  double v4 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleCaption1];
  [(UILabel *)self->_authorLabel setFont:v4];

  double v5 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleSubheadline];
  double v6 = [(UIButton *)self->_settingsButton titleLabel];
  [v6 setFont:v5];

  double v7 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleSubheadline];
  double v8 = [(UIButton *)self->_shareButton titleLabel];
  [v8 setFont:v7];

  id v9 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [(IMExpandingLabel *)self->_descriptionView setFont:v9];
}

- (void)update
{
  v3 = +[MTDB sharedInstance];
  double v4 = [v3 mainQueueContext];
  double v5 = [(MTPodcastInfoView *)self podcastUuid];
  id v10 = [v4 podcastForUuid:v5];

  double v6 = [v10 title];
  [(UILabel *)self->_titleLabel setText:v6];

  double v7 = [v10 author];
  [(UILabel *)self->_authorLabel setText:v7];

  double v8 = [v10 itemDescription];
  [(IMExpandingLabel *)self->_descriptionView setText:v8];

  id v9 = [v10 artworkWithSize:240.0, 240.0];
  [(UIImageView *)self->_imageView setImage:v9];

  [(MTPodcastInfoView *)self setNeedsLayout];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)descriptionViewTapped:(id)a3
{
  if (([(IMExpandingLabel *)self->_descriptionView isExpanded] & 1) == 0)
  {
    [(IMExpandingLabel *)self->_descriptionView setExpanded:1];
    [(MTPodcastInfoView *)self setNeedsLayout];
    [(MTPodcastInfoView *)self layoutIfNeeded];
    id v4 = [(MTPodcastInfoView *)self delegate];
    [v4 podcastInfoViewWasTapped:self];
  }
}

- (id)metricsName
{
  return @"PodcastDetails";
}

- (id)metricsContentIdentifier
{
  v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  double v5 = [(MTPodcastInfoView *)self podcastUuid];
  double v6 = [v4 podcastForUuid:v5];

  double v7 = [v6 metricsContentIdentifier];

  return v7;
}

- (MTPodcastInfoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTPodcastInfoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
}

- (UIView)separatorBelowAuthor
{
  return self->_separatorBelowAuthor;
}

- (void)setSeparatorBelowAuthor:(id)a3
{
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
}

- (UIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (IMExpandingLabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_separatorBelowAuthor, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end