@interface MTSwitchCell
+ (id)titleFont;
- (BOOL)_loadArtworkFromMemoryCache;
- (BOOL)_showsArtwork;
- (BOOL)customiseLabelAndSeparatorInsets;
- (BOOL)isPlaceholder;
- (NSString)artworkKey;
- (UISwitch)toggle;
- (id)imageProvider;
- (id)toggleChanged;
- (unint64_t)maximumNumberOfTextLines;
- (void)_asyncFetchArtworkDidLoadImage:(id)a3 forArtworkKey:(id)a4;
- (void)_clearAndHideArtworkView;
- (void)_fetchArtwork;
- (void)_fetchArtworkInBackground;
- (void)_layoutContentViewSubviews;
- (void)_updateSeparatorInsets;
- (void)layoutSubviews;
- (void)setArtworkKey:(id)a3;
- (void)setCellEmphasis:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTextLines:(unint64_t)a3;
- (void)setToggle:(id)a3;
- (void)setToggleChanged:(id)a3;
- (void)setupCell;
- (void)toggleChanged:(id)a3;
- (void)toggleOn:(BOOL)a3;
- (void)toggleOn:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MTSwitchCell

- (void)toggleOn:(BOOL)a3
{
}

- (void)toggleOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(MTSwitchCell *)self toggle];
  [v6 setOn:v5 animated:v4];
}

- (void)setArtworkKey:(id)a3
{
  p_artworkKey = &self->_artworkKey;
  id v6 = a3;
  if ((-[NSString isEqual:](*p_artworkKey, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_artworkKey, a3);
    if ([(NSString *)*p_artworkKey length]) {
      [(MTSwitchCell *)self _fetchArtwork];
    }
    else {
      [(MTSwitchCell *)self _clearAndHideArtworkView];
    }
  }
}

- (void)setMaximumNumberOfTextLines:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  if (self->_maximumNumberOfTextLines != v3)
  {
    self->_maximumNumberOfTextLines = v3;
    BOOL v5 = [(MTSwitchCell *)self textLabel];
    [v5 setNumberOfLines:self->_maximumNumberOfTextLines];

    [(MTSwitchCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(MTSwitchCell *)self _updateSeparatorInsets];
  v3.receiver = self;
  v3.super_class = (Class)MTSwitchCell;
  [(MTTableViewCell *)&v3 layoutSubviews];
  [(MTSwitchCell *)self _layoutContentViewSubviews];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTSwitchCell;
  -[MTTableViewCell setEnabled:](&v6, "setEnabled:");
  BOOL v5 = [(MTSwitchCell *)self toggle];
  [v5 setEnabled:v3];
}

- (void)setupCell
{
  v8.receiver = self;
  v8.super_class = (Class)MTSwitchCell;
  [(MTTableViewCell *)&v8 setupCell];
  BOOL v3 = objc_opt_new();
  [(MTSwitchCell *)self setToggle:v3];
  [v3 addTarget:self action:"toggleChanged:" forControlEvents:4096];
  [(MTSwitchCell *)self setAccessoryView:v3];
  BOOL v4 = [(MTSwitchCell *)self textLabel];
  BOOL v5 = +[UIColor cellTextColor];
  [v4 setTextColor:v5];

  objc_super v6 = [(MTSwitchCell *)self textLabel];
  v7 = [(id)objc_opt_class() titleFont];
  [v6 setFont:v7];
}

- (void)setCellEmphasis:(int64_t)a3
{
  if ([(MTTableViewCell *)self cellEmphasis] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTSwitchCell;
    [(MTTableViewCell *)&v6 setCellEmphasis:a3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10008433C;
    v5[3] = &unk_10054EB68;
    v5[4] = self;
    v5[5] = a3;
    +[UIView performWithoutAnimation:v5];
  }
}

- (BOOL)customiseLabelAndSeparatorInsets
{
  return 1;
}

- (void)_updateSeparatorInsets
{
  if ([(MTSwitchCell *)self customiseLabelAndSeparatorInsets])
  {
    unsigned int v3 = [(MTSwitchCell *)self mt_isRTL];
    BOOL v4 = [(MTSwitchCell *)self contentView];
    [v4 layoutMargins];
    double v6 = v5;
    double v8 = v7;

    if (v3) {
      double v6 = v8;
    }
    unsigned int v9 = [(MTSwitchCell *)self _showsArtwork];
    double v10 = 64.0;
    if (!v9) {
      double v10 = 0.0;
    }
    -[MTSwitchCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v6 + v10, 0.0, 0.0);
  }
}

- (void)_layoutContentViewSubviews
{
  id v3 = [(MTSwitchCell *)self effectiveUserInterfaceLayoutDirection];
  id v32 = [(MTSwitchCell *)self contentView];
  [v32 bounds];
  [v32 layoutMargins];
  [v32 layoutMargins];
  UIRectInset();
  UIRectInset();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(MTSwitchCell *)self artworkKey];
  id v13 = [v12 length];

  if (v13)
  {
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    CGFloat Height = CGRectGetHeight(v34);
    double v15 = sub_10014D0C4(v3 == (id)1, 1, 1, 0.0, (Height + -48.0) * 0.5, 48.0, 48.0, v5, v7, v9, v11);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(MTSwitchCell *)self imageView];
    [v22 setFrame:v15, v17, v19, v21];

    v23 = [(MTSwitchCell *)self imageView];
    v24 = [v23 superview];

    if (!v24)
    {
      v25 = [(MTSwitchCell *)self imageView];
      [v32 addSubview:v25];

      v26 = [(MTSwitchCell *)self imageView];
      [v26 setClipsToBounds:1];
    }
    UIRectInset();
    CGFloat v5 = v27;
    CGFloat v7 = v28;
    CGFloat v9 = v29;
    CGFloat v11 = v30;
  }
  if ([(MTSwitchCell *)self customiseLabelAndSeparatorInsets])
  {
    v31 = [(MTSwitchCell *)self textLabel];
    [v31 setFrame:v5, v7, v9, v11];
  }
}

- (BOOL)_showsArtwork
{
  return [(NSString *)self->_artworkKey length] != 0;
}

- (void)_clearAndHideArtworkView
{
  id v2 = [(MTSwitchCell *)self _artworkView];
  [v2 setImage:0];
  [v2 setHidden:1];
}

- (void)_fetchArtwork
{
  id v3 = [(MTSwitchCell *)self artworkKey];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = [(MTSwitchCell *)self _artworkView];
    [v5 mt_configureForDisplayingArtworkWithRadius:3.0];
    [v5 setHidden:0];
    if (![(MTSwitchCell *)self _loadArtworkFromMemoryCache])
    {
      [v5 setImage:0];
      [(MTSwitchCell *)self _fetchArtworkInBackground];
    }
  }
}

- (void)_fetchArtworkInBackground
{
  id v3 = [(MTSwitchCell *)self artworkKey];
  objc_initWeak(&location, self);
  id v4 = +[UIImage defaultPodcastArtwork];
  [(MTSwitchCell *)self _asyncFetchArtworkDidLoadImage:v4 forArtworkKey:v3];

  if ([(MTSwitchCell *)self isPlaceholder])
  {
    id v5 = [(MTSwitchCell *)self imageProvider];
    double v6 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100084ADC;
    v8[3] = &unk_10054EB90;
    CGFloat v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = v3;
    [v5 placeholderWithSize:v8 completionHandler:48.0, 48.0];
  }
  else
  {
    id v5 = [(MTSwitchCell *)self imageProvider];
    double v6 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100084A38;
    v10[3] = &unk_10054EB90;
    CGFloat v7 = &v12;
    objc_copyWeak(&v12, &location);
    id v11 = v3;
    [v5 artworkForShow:v11 size:v10 completionHandler:48.0, 48.0];
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_asyncFetchArtworkDidLoadImage:(id)a3 forArtworkKey:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100084C4C;
  v9[3] = &unk_10054E708;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  +[NSThread mainThread:v9];
}

- (BOOL)_loadArtworkFromMemoryCache
{
  id v3 = [(MTSwitchCell *)self artworkKey];
  if (v3
    && ![(MTSwitchCell *)self isPlaceholder]
    && ([(MTSwitchCell *)self imageProvider],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "legacyUICachedArtworkForPodcastUuid:withSize:", v3, 48.0, 48.0),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = [(MTSwitchCell *)self imageView];
    [v6 setImage:v5];

    [(MTSwitchCell *)self setNeedsLayout];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isPlaceholder
{
  id v2 = [(MTSwitchCell *)self artworkKey];
  unsigned __int8 v3 = [v2 isEqualToString:kMTLibraryDefaultImageKey];

  return v3;
}

+ (id)titleFont
{
  return +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)toggleChanged:(id)a3
{
  toggleChanged = self->_toggleChanged;
  if (toggleChanged)
  {
    id v4 = [a3 isOn];
    id v5 = (void (*)(void *, id))toggleChanged[2];
    v5(toggleChanged, v4);
  }
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    id v4 = +[PUIObjCArtworkProvider uiShared];
    id v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }
  id v6 = imageProvider;

  return v6;
}

- (id)toggleChanged
{
  return self->_toggleChanged;
}

- (void)setToggleChanged:(id)a3
{
}

- (NSString)artworkKey
{
  return self->_artworkKey;
}

- (unint64_t)maximumNumberOfTextLines
{
  return self->_maximumNumberOfTextLines;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_artworkKey, 0);
  objc_storeStrong(&self->_toggleChanged, 0);

  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end