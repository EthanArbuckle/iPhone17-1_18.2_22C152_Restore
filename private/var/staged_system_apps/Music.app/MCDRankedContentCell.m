@interface MCDRankedContentCell
- (BOOL)isCurrentlyPlaying;
- (BOOL)isExplicitContent;
- (BOOL)isFavorite;
- (MCDRankedContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MPArtworkCatalog)artworkCatalog;
- (id)accessibilityUserInputLabels;
- (int64_t)ranking;
- (void)_updateNowPlayingView;
- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6;
- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArtworkCatalog:(id)a3;
- (void)setCurrentlyPlaying:(BOOL)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setRanking:(int64_t)a3;
@end

@implementation MCDRankedContentCell

- (MCDRankedContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCDRankedContentCell;
  v4 = [(_MCDReusableCell *)&v8 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    v6 = sub_1000B5FC0();
    [v5 addObserver:v4 selector:"_updateNowPlayingView" name:v6 object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDRankedContentCell;
  [(MCDRankedContentCell *)&v4 dealloc];
}

- (void)_updateNowPlayingView
{
  if ([(MCDRankedContentCell *)self isCurrentlyPlaying])
  {
    id v6 = [(MCDRankedContentCell *)self viewWithTag:1002];
    v3 = +[MusicCarPlayManager sharedManager];
    objc_super v4 = [v3 nowPlayingContentManager];
    id v5 = [v4 playerState];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setIsPlaying:v5 == (id)2];
    }
  }
}

- (void)layoutSubviews
{
  v65.receiver = self;
  v65.super_class = (Class)MCDRankedContentCell;
  [(MCDRankedContentCell *)&v65 layoutSubviews];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(MCDRankedContentCell *)self isExplicitContent];
  explicitLabel = self->_explicitLabel;
  if (v4)
  {
    if (!explicitLabel)
    {
      sub_1000B6CC4();
      id v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v7 = self->_explicitLabel;
      self->_explicitLabel = v6;

      objc_super v8 = [(MCDRankedContentCell *)self contentView];
      [v8 addSubview:self->_explicitLabel];

      explicitLabel = self->_explicitLabel;
    }
    [(UILabel *)explicitLabel setHidden:0];
    [v3 addObject:self->_explicitLabel];
  }
  else
  {
    [(UILabel *)explicitLabel setHidden:1];
  }
  unsigned int v9 = [(MCDRankedContentCell *)self isFavorite];
  favoriteIcon = self->_favoriteIcon;
  if (v9)
  {
    if (!favoriteIcon)
    {
      sub_1000B6E74();
      v11 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_favoriteIcon;
      self->_favoriteIcon = v11;

      v13 = [(MCDRankedContentCell *)self contentView];
      [v13 addSubview:self->_favoriteIcon];

      favoriteIcon = self->_favoriteIcon;
    }
    [(UIImageView *)favoriteIcon setHidden:0];
    [v3 addObject:self->_favoriteIcon];
  }
  else
  {
    [(UIImageView *)favoriteIcon setHidden:1];
  }
  [(_MCDReusableCell *)self layoutBadges:v3];
  id v14 = [(MCDRankedContentCell *)self viewWithTag:1001];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = sub_1000B8678;
  v63 = sub_1000B8688;
  id v64 = [(_MCDReusableCell *)self artworkImageView];
  v15 = [(MCDRankedContentCell *)self viewWithTag:1002];
  v16 = [(MCDRankedContentCell *)self contentView];
  [v16 bounds];
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if ([(MCDRankedContentCell *)self isCurrentlyPlaying])
  {
    [v14 removeFromSuperview];
    if (!v15)
    {
      v15 = objc_alloc_init(_TtC5Music30CarPlayNowPlayingIndicatorView);
      [(CarPlayNowPlayingIndicatorView *)v15 setTag:1002];
    }
    [(CarPlayNowPlayingIndicatorView *)v15 frame];
    CGRectGetWidth(v66);
    UIRectCenteredYInRect();
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    v33 = [(MCDRankedContentCell *)self contentView];
    [(CarPlayNowPlayingIndicatorView *)v15 setFrame:sub_1000B4E80(v33, v26, v28, v30, v32)];

    [(MCDRankedContentCell *)self addSubview:v15];
    [(MCDRankedContentCell *)self _updateNowPlayingView];
  }
  else
  {
    [(CarPlayNowPlayingIndicatorView *)v15 removeFromSuperview];
    if (!v14)
    {
      id v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      v34 = +[UIFont systemFontOfSize:15.0];
      [v14 setFont:v34];

      v35 = +[UIColor _labelColor];
      [v14 setTextColor:v35];

      v36 = +[UIColor _carSystemFocusLabelColor];
      [v14 setHighlightedTextColor:v36];

      [v14 setTag:1001];
    }
    id v37 = objc_alloc_init((Class)NSNumberFormatter);
    [v37 setNumberStyle:1];
    v38 = +[NSNumber numberWithInteger:[(MCDRankedContentCell *)self ranking]];
    v39 = [v37 stringFromNumber:v38];
    [v14 setText:v39];

    [v14 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
    UIRectCenteredYInRect();
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    v48 = [(MCDRankedContentCell *)self contentView];
    [v14 setFrame:sub_1000B4E80(v48, v41, v43, v45, v47)];

    [(MCDRankedContentCell *)self addSubview:v14];
  }
  if ([(MCDRankedContentCell *)self isCurrentlyPlaying]
    || ([(MCDRankedContentCell *)self artworkCatalog],
        v49 = objc_claimAutoreleasedReturnValue(),
        v49,
        v49))
  {
    -[MCDRankedContentCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 87.0, 0.0, 0.0);
    v50 = [(MCDRankedContentCell *)self artworkCatalog];

    if (v50)
    {
      v51 = [(MCDRankedContentCell *)self artworkCatalog];
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      [v51 setCacheIdentifier:v53 forRequestingContext:self];

      objc_initWeak(&location, self);
      v54 = [(MCDRankedContentCell *)self artworkCatalog];
      id v55 = objc_loadWeakRetained(&location);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000B8690;
      v56[3] = &unk_100FC4248;
      objc_copyWeak(v57, &location);
      v57[1] = v18;
      v57[2] = v20;
      v57[3] = v22;
      v57[4] = v24;
      v56[4] = self;
      v56[5] = &v59;
      [v54 setDestination:v55 configurationBlock:v56];

      objc_destroyWeak(v57);
      objc_destroyWeak(&location);
    }
    else
    {
      [(CarPlayNowPlayingIndicatorView *)v15 removeFromSuperview];
      [(id)v60[5] removeFromSuperview];
    }
  }

  _Block_object_dispose(&v59, 8);
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

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (int64_t)ranking
{
  return self->_ranking;
}

- (void)setRanking:(int64_t)a3
{
  self->_ranking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingImageView, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);

  objc_storeStrong((id *)&self->_explicitLabel, 0);
}

- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6
{
  BOOL v8 = a4;
  id v22 = a3;
  v10 = [v22 title];
  id v11 = [v10 length];
  if (v11)
  {
    [v22 title];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v12 = };
  v13 = [(MCDRankedContentCell *)self textLabel];
  [v13 setText:v12];

  if (!v11)
  {

    v12 = v6;
  }

  id v14 = [v22 artist];
  v15 = [v14 name];

  if ([v22 shouldShowComposer])
  {
    v16 = [v22 composer];
    v17 = [v16 name];

    if (v17)
    {
      v18 = [v22 composer];
      uint64_t v19 = [v18 name];

      v15 = (void *)v19;
    }
  }
  v20 = [(MCDRankedContentCell *)self detailTextLabel];
  [v20 setText:v15];

  -[MCDRankedContentCell setExplicitContent:](self, "setExplicitContent:", [v22 isExplicitSong]);
  -[MCDRankedContentCell setFavorite:](self, "setFavorite:", [v22 isFavorite]);
  [(MCDRankedContentCell *)self setCurrentlyPlaying:v8];
  [(MCDRankedContentCell *)self setRanking:a6];
  v21 = [v22 artworkCatalog];
  [(MCDRankedContentCell *)self setArtworkCatalog:v21];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6
{
  BOOL v8 = a4;
  id v18 = a3;
  v10 = [v18 title];
  id v11 = [v10 length];
  if (v11)
  {
    [v18 title];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"Unknown Album" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v12 = };
  v13 = [(MCDRankedContentCell *)self textLabel];
  [v13 setText:v12];

  if (!v11)
  {

    v12 = v6;
  }

  id v14 = [v18 artist];
  v15 = [v14 name];
  v16 = [(MCDRankedContentCell *)self detailTextLabel];
  [v16 setText:v15];

  -[MCDRankedContentCell setFavorite:](self, "setFavorite:", [v18 isFavorite]);
  [(MCDRankedContentCell *)self setCurrentlyPlaying:v8];
  [(MCDRankedContentCell *)self setRanking:a6];
  v17 = [v18 artworkCatalog];
  [(MCDRankedContentCell *)self setArtworkCatalog:v17];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(MCDRankedContentCell *)self textLabel];
  id v5 = [v4 text];

  if (v5)
  {
    id v6 = [(MCDRankedContentCell *)self textLabel];
    v7 = [v6 text];
    [v3 addObject:v7];
  }
  BOOL v8 = [(MCDRankedContentCell *)self detailTextLabel];
  unsigned int v9 = [v8 text];

  if (v9)
  {
    v10 = [(MCDRankedContentCell *)self detailTextLabel];
    id v11 = [v10 text];
    [v3 addObject:v11];
  }
  id v12 = [v3 copy];

  return v12;
}

@end