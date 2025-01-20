@interface MCDAlbumTracksCell
- (BOOL)isContentUnavailable;
- (BOOL)isCurrentlyPlaying;
- (BOOL)isExplicitContent;
- (BOOL)isFavorite;
- (MCDAlbumTracksCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)title;
- (NSString)trackNumberText;
- (double)horizontalMargin;
- (void)_updateNowPlayingView;
- (void)configureWithAlbumTrack:(id)a3 currentlyPlaying:(BOOL)a4 album:(id)a5 contentAvailable:(BOOL)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setContentUnavailable:(BOOL)a3;
- (void)setCurrentlyPlaying:(BOOL)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)setTrackNumberText:(id)a3;
@end

@implementation MCDAlbumTracksCell

- (MCDAlbumTracksCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)MCDAlbumTracksCell;
  v4 = [(_MCDReusableCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIFont systemFontOfSize:15.0];
    v6 = [(MCDAlbumTracksCell *)v4 textLabel];
    [v6 setFont:v5];

    v7 = +[UIColor labelColor];
    v8 = [(MCDAlbumTracksCell *)v4 textLabel];
    [v8 setTextColor:v7];

    v9 = +[UIColor _carSystemFocusLabelColor];
    v10 = [(MCDAlbumTracksCell *)v4 textLabel];
    [v10 setHighlightedTextColor:v9];

    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    trackNumberLabel = v4->_trackNumberLabel;
    v4->_trackNumberLabel = v11;

    v13 = +[UIFont systemFontOfSize:15.0];
    [(UILabel *)v4->_trackNumberLabel setFont:v13];

    v14 = +[UIColor _carSystemSecondaryColor];
    [(UILabel *)v4->_trackNumberLabel setTextColor:v14];

    v15 = +[UIColor _carSystemFocusSecondaryColor];
    [(UILabel *)v4->_trackNumberLabel setHighlightedTextColor:v15];

    [(UILabel *)v4->_trackNumberLabel setTextAlignment:1];
    v16 = [(MCDAlbumTracksCell *)v4 contentView];
    [v16 addSubview:v4->_trackNumberLabel];

    uint64_t v17 = sub_1000B6CC4();
    explicitLabel = v4->_explicitLabel;
    v4->_explicitLabel = (UILabel *)v17;

    v19 = [(MCDAlbumTracksCell *)v4 contentView];
    [v19 addSubview:v4->_explicitLabel];

    uint64_t v20 = sub_1000B6E74();
    favoriteIcon = v4->_favoriteIcon;
    v4->_favoriteIcon = (UIImageView *)v20;

    v22 = [(MCDAlbumTracksCell *)v4 contentView];
    [v22 addSubview:v4->_favoriteIcon];

    v23 = objc_alloc_init(_TtC5Music30CarPlayNowPlayingIndicatorView);
    currentlyPlayingView = v4->_currentlyPlayingView;
    v4->_currentlyPlayingView = &v23->super;

    [(UIView *)v4->_currentlyPlayingView setTag:1002];
    [(MCDAlbumTracksCell *)v4 addSubview:v4->_currentlyPlayingView];
    v25 = +[NSNotificationCenter defaultCenter];
    v26 = sub_1000B5FC0();
    [v25 addObserver:v4 selector:"_updateNowPlayingView" name:v26 object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDAlbumTracksCell;
  [(MCDAlbumTracksCell *)&v4 dealloc];
}

- (void)_updateNowPlayingView
{
  id v8 = [(MCDAlbumTracksCell *)self viewWithTag:1002];
  v3 = +[MusicCarPlayManager sharedManager];
  objc_super v4 = [v3 nowPlayingContentManager];
  id v5 = [v4 playerState];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v6 = [(MCDAlbumTracksCell *)self isCurrentlyPlaying];
    if (v5 == (id)2) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    [v8 setIsPlaying:v7];
  }
}

- (void)configureWithAlbumTrack:(id)a3 currentlyPlaying:(BOOL)a4 album:(id)a5 contentAvailable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = [v11 title];
  v14 = v13;
  if (!v13)
  {
    unsigned int v6 = sub_1000B5B74();
    v14 = [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  v15 = [(MCDAlbumTracksCell *)self textLabel];
  [v15 setText:v14];

  if (!v13)
  {
  }
  if ([v11 trackNumber])
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 trackNumber]);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v17 = (void (*)(id))off_1010D70C0;
    v24 = off_1010D70C0;
    if (!off_1010D70C0)
    {
      v18 = (void *)sub_10002A470();
      v22[3] = (uint64_t)dlsym(v18, "MCDFormattedNumberString");
      off_1010D70C0 = (_UNKNOWN *)v22[3];
      uint64_t v17 = (void (*)(id))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v17)
    {
      uint64_t v20 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v21, 8);
      _Unwind_Resume(v20);
    }
    v19 = v17(v16);

    [(UILabel *)self->_trackNumberLabel setText:v19];
  }
  [(MCDAlbumTracksCell *)self setContentUnavailable:!v7];
  [(MCDAlbumTracksCell *)self setCurrentlyPlaying:v9];
  -[MCDAlbumTracksCell setExplicitContent:](self, "setExplicitContent:", [v11 isExplicitSong]);
  -[MCDAlbumTracksCell setFavorite:](self, "setFavorite:", [v11 isFavorite]);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDAlbumTracksCell;
  [(_MCDReusableCell *)&v9 setHighlighted:a3 animated:a4];
  currentlyPlayingView = self->_currentlyPlayingView;
  if (currentlyPlayingView)
  {
    BOOL v7 = currentlyPlayingView;
  }
  else
  {
    BOOL v7 = [(MCDAlbumTracksCell *)self viewWithTag:1002];
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)v8 setIsHighlighted:v4];
  }
}

- (double)horizontalMargin
{
  return 12.0;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)MCDAlbumTracksCell;
  [(MCDAlbumTracksCell *)&v67 layoutSubviews];
  if ([(MCDAlbumTracksCell *)self isContentUnavailable])
  {
    UIInterfaceGetContentDisabledAlpha();
    double v4 = v3;
    id v5 = [(MCDAlbumTracksCell *)self contentView];
    unsigned int v6 = v5;
    double v7 = v4;
  }
  else
  {
    id v5 = [(MCDAlbumTracksCell *)self contentView];
    unsigned int v6 = v5;
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  id v8 = [(MCDAlbumTracksCell *)self contentView];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  BOOL v17 = [(MCDAlbumTracksCell *)self isCurrentlyPlaying];
  [(UIView *)self->_currentlyPlayingView setHidden:v17 ^ 1];
  [(UILabel *)self->_trackNumberLabel setHidden:v17];
  CGFloat y = CGRectZero.origin.y;
  v19 = [(UILabel *)self->_trackNumberLabel font];
  [v19 lineHeight];
  CGFloat v21 = v20;

  id v22 = [(MCDAlbumTracksCell *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v23 = [(MCDAlbumTracksCell *)self textLabel];
  [v23 frame];
  sub_1000B4DA0((uint64_t)v22, v24, v25, v26, v27, v10, v12, v14, v16);

  v68.origin.x = 12.0;
  v68.size.width = 21.0;
  v68.origin.CGFloat y = y;
  v68.size.height = v21;
  float v28 = CGRectGetMaxX(v68) + 12.0;
  CGFloat v29 = floorf(v28);
  float v30 = v14 - (v29 + 12.0);
  CGFloat v31 = floorf(v30);
  v32 = [(MCDAlbumTracksCell *)self textLabel];
  v33 = [v32 font];
  [v33 lineHeight];
  double v35 = v34;

  float v36 = (v16 - v35) * 0.5;
  CGFloat v37 = floorf(v36);
  v38 = [(MCDAlbumTracksCell *)self contentView];
  double v39 = sub_1000B4E80(v38, v29, v37, v31, v35);
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v46 = [(MCDAlbumTracksCell *)self textLabel];
  [v46 setFrame:v39, v41, v43, v45];

  v47 = [(MCDAlbumTracksCell *)self textLabel];
  v48 = [v47 font];
  [v48 ascender];
  double v50 = v49 + v37;

  v51 = [(UILabel *)self->_trackNumberLabel font];
  [v51 ascender];
  *(float *)&double v52 = v50 - v52;
  CGFloat v53 = floorf(*(float *)&v52);

  v54 = [(MCDAlbumTracksCell *)self contentView];
  [(UILabel *)self->_trackNumberLabel setFrame:sub_1000B4E80(v54, 12.0, v53, 21.0, v21)];

  id v55 = objc_alloc_init((Class)NSMutableArray);
  if ([(MCDAlbumTracksCell *)self isExplicitContent]) {
    [v55 addObject:self->_explicitLabel];
  }
  else {
    [(UILabel *)self->_explicitLabel setHidden:1];
  }
  if ([(MCDAlbumTracksCell *)self isFavorite]) {
    [v55 addObject:self->_favoriteIcon];
  }
  else {
    [(UIImageView *)self->_favoriteIcon setHidden:1];
  }
  [(_MCDReusableCell *)self layoutBadges:v55];
  [(UIView *)self->_currentlyPlayingView frame];
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  double v61 = v60;
  double v63 = v62;
  [(UILabel *)self->_trackNumberLabel frame];
  double MidX = CGRectGetMidX(v69);
  v70.origin.x = v57;
  v70.origin.CGFloat y = v59;
  v70.size.width = v61;
  v70.size.height = v63;
  CGFloat v65 = MidX - CGRectGetWidth(v70) * 0.5;
  [(MCDAlbumTracksCell *)self bounds];
  double MidY = CGRectGetMidY(v71);
  v72.origin.x = v65;
  v72.origin.CGFloat y = v59;
  v72.size.width = v61;
  v72.size.height = v63;
  -[UIView setFrame:](self->_currentlyPlayingView, "setFrame:", v65, MidY - CGRectGetHeight(v72) * 0.5, v61, v63);
  [(MCDAlbumTracksCell *)self _updateNowPlayingView];
}

- (NSString)title
{
  v2 = [(MCDAlbumTracksCell *)self textLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  double v4 = [(MCDAlbumTracksCell *)self title];
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = [(MCDAlbumTracksCell *)self textLabel];
    [v6 setText:v7];

    [(MCDAlbumTracksCell *)self setNeedsLayout];
  }
}

- (NSString)trackNumberText
{
  return [(UILabel *)self->_trackNumberLabel text];
}

- (void)setTrackNumberText:(id)a3
{
  id v6 = a3;
  double v4 = [(MCDAlbumTracksCell *)self trackNumberText];
  unsigned __int8 v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_trackNumberLabel setText:v6];
    [(MCDAlbumTracksCell *)self setNeedsLayout];
  }
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_currentlyPlaying;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
}

- (BOOL)isContentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailable:(BOOL)a3
{
  self->_contentUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPlayingView, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_explicitLabel, 0);

  objc_storeStrong((id *)&self->_trackNumberLabel, 0);
}

@end