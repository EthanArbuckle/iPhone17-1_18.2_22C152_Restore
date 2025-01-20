@interface MCDTableViewCell
+ (id)cellForTableView:(id)a3 indexPath:(id)a4;
- (BOOL)isContentUnavailable;
- (BOOL)isCurrentlyPlaying;
- (BOOL)isExplicitContent;
- (BOOL)isFavorite;
- (BOOL)isLoading;
- (MCDTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSMutableArray)artworkImages;
- (UIActivityIndicatorView)activityIndicator;
- (UIImage)artworkImage;
- (UIImage)placeholderImage;
- (id)accessibilityUserInputLabels;
- (void)_updateNowPlayingView;
- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5;
- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6;
- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 contentAvailable:(BOOL)a7;
- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5;
- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6;
- (void)configureWithAttributionArtwork:(id)a3 artworkScale:(double)a4;
- (void)configureWithComposer:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5;
- (void)configureWithGenre:(id)a3 artworkScale:(double)a4;
- (void)configureWithMovie:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6;
- (void)configureWithPlaylist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 showCurator:(BOOL)a6;
- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7;
- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7 contentAvailable:(BOOL)a8;
- (void)configureWithRadioStation:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5;
- (void)configureWithRadioStation:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6;
- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6;
- (void)configureWithTVEpisode:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArtworkCatalog:(id)a3 andScale:(double)a4 fallbackImage:(id)a5;
- (void)setArtworkCatalogs:(id)a3 andScale:(double)a4 fallbackImage:(id)a5;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkImages:(id)a3;
- (void)setContentUnavailable:(BOOL)a3;
- (void)setCurrentlyPlaying:(BOOL)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLoading:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
@end

@implementation MCDTableViewCell

- (MCDTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MCDTableViewCell;
  v4 = [(_MCDReusableCell *)&v20 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIFont systemFontOfSize:15.0];
    v6 = [(MCDTableViewCell *)v4 textLabel];
    [v6 setFont:v5];

    v7 = +[UIColor _labelColor];
    v8 = [(MCDTableViewCell *)v4 textLabel];
    [v8 setTextColor:v7];

    v9 = +[UIColor _carSystemFocusLabelColor];
    v10 = [(MCDTableViewCell *)v4 textLabel];
    [v10 setHighlightedTextColor:v9];

    v11 = +[UIFont systemFontOfSize:12.0];
    v12 = [(MCDTableViewCell *)v4 detailTextLabel];
    [v12 setFont:v11];

    v13 = +[UIColor _carSystemSecondaryColor];
    v14 = [(MCDTableViewCell *)v4 detailTextLabel];
    [v14 setTextColor:v13];

    v15 = +[UIColor _carSystemFocusSecondaryColor];
    v16 = [(MCDTableViewCell *)v4 detailTextLabel];
    [v16 setHighlightedTextColor:v15];

    v17 = +[NSNotificationCenter defaultCenter];
    v18 = sub_1000B5FC0();
    [v17 addObserver:v4 selector:"_updateNowPlayingView" name:v18 object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDTableViewCell;
  [(MCDTableViewCell *)&v4 dealloc];
}

+ (id)cellForTableView:(id)a3 indexPath:(id)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MCDTableViewCell;
  objc_super v4 = [super cellForTableView:a3 indexPath:a4];
  v5 = [v4 artworkImageView];
  [v5 removeFromSuperview];

  return v4;
}

- (void)setPlaceholderImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    artworkImage = self->_artworkImage;
    self->_artworkImage = 0;
    objc_super v7 = v5;

    objc_storeStrong((id *)&self->_placeholderImage, a3);
    v5 = v7;
  }
}

- (void)setArtworkImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_artworkImage != v5)
  {
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = 0;
    objc_super v7 = v5;

    objc_storeStrong((id *)&self->_artworkImage, a3);
    v5 = v7;
  }
}

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    objc_super v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:21];
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    activityIndicator = self->_activityIndicator;
  }

  return activityIndicator;
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    objc_super v4 = [(MCDTableViewCell *)self activityIndicator];
    [(MCDTableViewCell *)self setAccessoryView:v4];

    id v5 = [(MCDTableViewCell *)self activityIndicator];
    [v5 startAnimating];
  }
  else
  {
    [(MCDTableViewCell *)self setAccessoryView:0];
    id v5 = [(MCDTableViewCell *)self activityIndicator];
    [v5 stopAnimating];
  }
}

- (void)setArtworkCatalog:(id)a3 andScale:(double)a4 fallbackImage:(id)a5
{
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    id v12 = v8;
    id v10 = a5;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    -[MCDTableViewCell setArtworkCatalogs:andScale:fallbackImage:](self, "setArtworkCatalogs:andScale:fallbackImage:", v11, v10, a4, v12);
  }
  else
  {
    id v11 = a5;
    [(MCDTableViewCell *)self setArtworkCatalogs:0 andScale:v11 fallbackImage:a4];
  }
}

- (void)setArtworkCatalogs:(id)a3 andScale:(double)a4 fallbackImage:(id)a5
{
  v9 = (NSArray *)a3;
  id v10 = a5;
  id v11 = v10;
  if (v9 || !v10)
  {
    if (!v9) {
      [(MCDTableViewCell *)self setArtworkImage:0];
    }
  }
  else
  {
    [(MCDTableViewCell *)self setPlaceholderImage:v10];
  }
  if (self->_artworkCatalogs != v9)
  {
    objc_storeStrong((id *)&self->_artworkCatalogs, a3);
    id v12 = [(NSArray *)v9 count];
    if (v12 == (id)1) {
      v13 = 0;
    }
    else {
      v13 = objc_opt_new();
    }
    objc_storeStrong((id *)&self->_artworkImages, v13);
    if (v12 != (id)1) {

    }
    [(_MCDReusableCell *)self sizeForArtwork];
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    [(MCDTableViewCell *)self setPlaceholderImage:v11];
    artworkCatalogs = self->_artworkCatalogs;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1000B6634;
    v22 = &unk_100FC4220;
    uint64_t v25 = v15;
    uint64_t v26 = v17;
    double v27 = a4;
    v23 = self;
    BOOL v28 = v12 == (id)1;
    id v24 = v11;
    [(NSArray *)artworkCatalogs enumerateObjectsUsingBlock:&v19];
  }
  [(MCDTableViewCell *)self setNeedsLayout];
}

- (void)_updateNowPlayingView
{
  if ([(MCDTableViewCell *)self isCurrentlyPlaying])
  {
    id v6 = [(MCDTableViewCell *)self viewWithTag:1002];
    v3 = +[MusicCarPlayManager sharedManager];
    objc_super v4 = [v3 nowPlayingContentManager];
    id v5 = [v4 playerState];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setIsPlaying:v5 == (id)2];
    }
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCDTableViewCell;
  [(_MCDReusableCell *)&v10 setHighlighted:a3 animated:a4];
  if ([(MCDTableViewCell *)self selectionStyle])
  {
    id v6 = [(_MCDReusableCell *)self artworkImageView];
    [v6 setHighlighted:v4];
  }
  objc_super v7 = [(MCDTableViewCell *)self viewWithTag:1002];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setIsHighlighted:v4];
  }
  favoriteIcon = self->_favoriteIcon;
  if (v4) {
    +[UIColor systemGray3Color];
  }
  else {
  v9 = +[UIColor secondaryLabelColor];
  }
  [(UIImageView *)favoriteIcon setTintColor:v9];
}

- (void)setContentUnavailable:(BOOL)a3
{
  self->_contentUnavailable = a3;
  [(MCDTableViewCell *)self setSelectionStyle:3];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)MCDTableViewCell;
  [(MCDTableViewCell *)&v27 layoutSubviews];
  if ([(MCDTableViewCell *)self isContentUnavailable])
  {
    UIInterfaceGetContentDisabledAlpha();
    double v4 = v3;
    id v5 = [(MCDTableViewCell *)self contentView];
    id v6 = v5;
    double v7 = v4;
  }
  else
  {
    id v5 = [(MCDTableViewCell *)self contentView];
    id v6 = v5;
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v9 = [(MCDTableViewCell *)self isExplicitContent];
  explicitLabel = self->_explicitLabel;
  if (v9)
  {
    if (!explicitLabel)
    {
      sub_1000B6CC4();
      id v11 = (UILabel *)objc_claimAutoreleasedReturnValue();
      id v12 = self->_explicitLabel;
      self->_explicitLabel = v11;

      v13 = [(MCDTableViewCell *)self contentView];
      [v13 addSubview:self->_explicitLabel];

      explicitLabel = self->_explicitLabel;
    }
    [v8 addObject:explicitLabel];
  }
  else
  {
    [(UILabel *)self->_explicitLabel setHidden:1];
  }
  unsigned int v14 = [(MCDTableViewCell *)self isFavorite];
  favoriteIcon = self->_favoriteIcon;
  if (v14)
  {
    if (!favoriteIcon)
    {
      sub_1000B6E74();
      uint64_t v16 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = self->_favoriteIcon;
      self->_favoriteIcon = v16;

      v18 = [(MCDTableViewCell *)self contentView];
      [v18 addSubview:self->_favoriteIcon];

      favoriteIcon = self->_favoriteIcon;
    }
    [v8 addObject:favoriteIcon];
  }
  else
  {
    [(UIImageView *)self->_favoriteIcon setHidden:1];
  }
  [(_MCDReusableCell *)self layoutBadges:v8];
  v19 = [(MCDTableViewCell *)self viewWithTag:1002];
  if (![(MCDTableViewCell *)self isCurrentlyPlaying])
  {
    [(CarPlayNowPlayingIndicatorView *)v19 removeFromSuperview];
    uint64_t v20 = [(MCDTableViewCell *)self artworkImage];

    if (v20)
    {
      v21 = [(MCDTableViewCell *)self artworkImage];

      if (!v21) {
        goto LABEL_26;
      }
      v22 = [(MCDTableViewCell *)self artworkImage];
      id v23 = +[MCDTableViewController addAlbumArtViewWithImage:v22 radiusKind:[(_MCDReusableCell *)self artworkRadiusKind] toCell:self];
    }
    else
    {
      id v24 = [(MCDTableViewCell *)self placeholderImage];

      if (!v24)
      {
        +[MCDTableViewController removeImageFromCell:self];
        goto LABEL_26;
      }
      v22 = [(MCDTableViewCell *)self placeholderImage];
      uint64_t v25 = +[UIColor _carSystemFocusColor];
      uint64_t v26 = +[UIColor _carSystemFocusLabelColor];
      +[MCDTableViewController setPlaceholderImage:v22 tintColor:v25 highlightedTintColor:v26 toCell:self];
    }
    goto LABEL_26;
  }
  if (!v19) {
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(CarPlayNowPlayingIndicatorView *)v19 removeFromSuperview];

LABEL_18:
    v19 = objc_alloc_init(_TtC5Music30CarPlayNowPlayingIndicatorView);
    [(CarPlayNowPlayingIndicatorView *)v19 setTag:1002];
  }
  +[MCDTableViewController addLeadingView:v19 toCell:self];
  [(MCDTableViewCell *)self _updateNowPlayingView];
LABEL_26:
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

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (NSMutableArray)artworkImages
{
  return self->_artworkImages;
}

- (void)setArtworkImages:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_artworkImages, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);

  objc_storeStrong((id *)&self->_explicitLabel, 0);
}

- (void)configureWithPlaylist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 showCurator:(BOOL)a6
{
}

- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7
{
}

- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7 contentAvailable:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v32 = a3;
  id v14 = a4;
  uint64_t v15 = v14;
  if (v14 && [v14 length])
  {
    uint64_t v16 = [(MCDTableViewCell *)self textLabel];
    [v16 setText:v15];

    uint64_t v17 = [(MCDTableViewCell *)self textLabel];
    [v17 setNumberOfLines:2];

    v18 = [(MCDTableViewCell *)self detailTextLabel];
    [v18 setText:0];
LABEL_7:

    goto LABEL_8;
  }
  v19 = [v32 name];
  uint64_t v20 = [(MCDTableViewCell *)self textLabel];
  [v20 setText:v19];

  v18 = [(MCDTableViewCell *)self textLabel];
  [v18 setNumberOfLines:1];

  if ([v32 type] == (id)7 || objc_msgSend(v32, "type") == (id)8)
  {
    v18 = [v32 lastModifiedDateComponents];
    v21 = [v18 lastUpdatedDateString];
    v22 = [(MCDTableViewCell *)self detailTextLabel];
    [v22 setText:v21];

    goto LABEL_7;
  }
  if (v9)
  {
    v18 = [v32 curator];
    v29 = [v18 name];
  }
  else
  {
    v29 = 0;
  }
  v31 = [(MCDTableViewCell *)self detailTextLabel];
  [v31 setText:v29];

  if (v9)
  {

    goto LABEL_7;
  }
LABEL_8:
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", [v32 isFavorite]);
  [(MCDTableViewCell *)self setCurrentlyPlaying:v11];
  [(MCDTableViewCell *)self setContentUnavailable:!v8];
  id v23 = [v32 type];
  if (v23 == (id)1)
  {
    id v24 = [v32 artworkCatalog];
    uint64_t v25 = +[UIImage smartPlaylistPlaceholder];
  }
  else if (v23 == (id)2)
  {
    id v24 = [v32 artworkCatalog];
    uint64_t v25 = +[UIImage geniusPlaylistPlaceholder];
  }
  else
  {
    if (v23 == (id)3)
    {
      id v24 = +[UIImage playlistFolderPlaceholder];
      [(MCDTableViewCell *)self setPlaceholderImage:v24];
      goto LABEL_21;
    }
    uint64_t v26 = [v32 artworkCatalog];
    objc_super v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v32 tracksTiledArtworkCatalogWithRows:2 columns:2];
    }
    id v24 = v28;

    uint64_t v25 = +[UIImage playlistPlaceholder];
  }
  v30 = (void *)v25;
  [(MCDTableViewCell *)self setArtworkCatalog:v24 andScale:v25 fallbackImage:a6];

LABEL_21:
  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
}

- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v17 = a3;
  BOOL v11 = [v17 name];
  id v12 = [v11 length];
  if (v12)
  {
    [v17 name];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"UNKNOWN_ALBUM_ARTIST" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v13 = };
  id v14 = [(MCDTableViewCell *)self textLabel];
  [v14 setText:v13];

  if (!v12)
  {

    v13 = v6;
  }

  -[MCDTableViewCell setFavorite:](self, "setFavorite:", [v17 isFavorite]);
  [(MCDTableViewCell *)self setCurrentlyPlaying:v9];
  [(MCDTableViewCell *)self setContentUnavailable:!v7];
  uint64_t v15 = [v17 artworkCatalog];
  uint64_t v16 = +[UIImage artistPlaceholder];
  [(MCDTableViewCell *)self setArtworkCatalog:v15 andScale:v16 fallbackImage:a5];

  [(_MCDReusableCell *)self setArtworkRadiusKind:1];
}

- (void)configureWithComposer:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  BOOL v5 = a4;
  BOOL v7 = [a3 name];
  BOOL v8 = [(MCDTableViewCell *)self textLabel];
  [v8 setText:v7];

  [(MCDTableViewCell *)self setCurrentlyPlaying:v5];

  [(MCDTableViewCell *)self setNeedsLayout];
}

- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
}

- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6
{
}

- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 contentAvailable:(BOOL)a7
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  id v27 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13 && [v13 length])
  {
    uint64_t v15 = [(MCDTableViewCell *)self textLabel];
    [v15 setText:v14];

    uint64_t v16 = [(MCDTableViewCell *)self textLabel];
    [v16 setNumberOfLines:2];

    id v17 = [(MCDTableViewCell *)self detailTextLabel];
    [v17 setText:0];
  }
  else
  {
    v18 = [v27 title];
    id v19 = [v18 length];
    if (v19)
    {
      [v27 title];
    }
    else
    {
      BOOL v7 = sub_1000BDDCC();
      [v7 localizedStringForKey:@"Unknown Album" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    uint64_t v20 = };
    v21 = [(MCDTableViewCell *)self textLabel];
    [v21 setText:v20];

    if (!v19)
    {

      uint64_t v20 = v7;
    }

    v22 = [(MCDTableViewCell *)self textLabel];
    [v22 setNumberOfLines:1];

    if ([v27 isCompilation])
    {
      id v17 = +[NSBundle mainBundle];
      [v17 localizedStringForKey:@"Various Artists" value:&stru_101023248 table:0];
    }
    else
    {
      id v17 = [v27 artist];
      [v17 name];
    id v23 = };
    id v24 = [(MCDTableViewCell *)self detailTextLabel];
    [v24 setText:v23];
  }
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", [v27 isFavorite]);
  [(MCDTableViewCell *)self setCurrentlyPlaying:v10];
  [(MCDTableViewCell *)self setContentUnavailable:!v8];
  uint64_t v25 = [v27 artworkCatalog];
  uint64_t v26 = +[UIImage _systemImageNamed:@"music.square.stack"];
  [(MCDTableViewCell *)self setArtworkCatalog:v25 andScale:v26 fallbackImage:a6];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v20 = a3;
  BOOL v11 = [v20 title];
  id v12 = [v11 length];
  if (v12)
  {
    [v20 title];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  id v13 = };
  id v14 = [(MCDTableViewCell *)self textLabel];
  [v14 setText:v13];

  if (!v12)
  {

    id v13 = v6;
  }

  uint64_t v15 = [v20 artist];
  uint64_t v16 = [v15 name];

  id v17 = [(MCDTableViewCell *)self detailTextLabel];
  [v17 setText:v16];

  -[MCDTableViewCell setExplicitContent:](self, "setExplicitContent:", [v20 isExplicitSong]);
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", [v20 isFavorite]);
  [(MCDTableViewCell *)self setCurrentlyPlaying:v9];
  [(MCDTableViewCell *)self setContentUnavailable:!v7];
  v18 = [v20 artworkCatalog];
  id v19 = +[UIImage _systemImageNamed:@"music.note"];
  [(MCDTableViewCell *)self setArtworkCatalog:v18 andScale:v19 fallbackImage:a5];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithGenre:(id)a3 artworkScale:(double)a4
{
  BOOL v5 = [a3 name:a4];
  id v6 = [(MCDTableViewCell *)self textLabel];
  [v6 setText:v5];

  [(MCDTableViewCell *)self setNeedsLayout];
}

- (void)configureWithMovie:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v18 = a3;
  BOOL v11 = [v18 title];
  id v12 = [v11 length];
  if (v12)
  {
    [v18 title];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  id v13 = };
  id v14 = [(MCDTableViewCell *)self textLabel];
  [v14 setText:v13];

  if (!v12)
  {

    id v13 = v6;
  }

  uint64_t v15 = [(MCDTableViewCell *)self detailTextLabel];
  [v15 setText:0];

  [(MCDTableViewCell *)self setExplicitContent:MPModelMovieIsRestricted()];
  [(MCDTableViewCell *)self setCurrentlyPlaying:v9];
  [(MCDTableViewCell *)self setContentUnavailable:!v7];
  uint64_t v16 = [v18 artworkCatalog];
  id v17 = +[UIImage _systemImageNamed:@"music.note"];
  [(MCDTableViewCell *)self setArtworkCatalog:v16 andScale:v17 fallbackImage:a5];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithTVEpisode:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v20 = a3;
  BOOL v11 = [v20 title];
  id v12 = [v11 length];
  if (v12)
  {
    [v20 title];
  }
  else
  {
    id v6 = sub_1000BDDCC();
    [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  id v13 = };
  id v14 = [(MCDTableViewCell *)self textLabel];
  [v14 setText:v13];

  if (!v12)
  {

    id v13 = v6;
  }

  uint64_t v15 = [v20 show];
  uint64_t v16 = [v15 title];

  id v17 = [(MCDTableViewCell *)self detailTextLabel];
  [v17 setText:v16];

  [(MCDTableViewCell *)self setExplicitContent:MPModelTVEpisodeIsRestricted()];
  [(MCDTableViewCell *)self setCurrentlyPlaying:v9];
  [(MCDTableViewCell *)self setContentUnavailable:!v7];
  id v18 = [v20 artworkCatalog];
  id v19 = +[UIImage _systemImageNamed:@"music.note"];
  [(MCDTableViewCell *)self setArtworkCatalog:v18 andScale:v19 fallbackImage:a5];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithRadioStation:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  [(MCDTableViewCell *)self configureWithRadioStation:a3 utterance:0 currentlyPlaying:a4 artworkScale:a5];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithRadioStation:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6
{
  BOOL v8 = a5;
  id v25 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v11 && [v11 length])
  {
    id v13 = [(MCDTableViewCell *)self textLabel];
    [v13 setText:v12];

    id v14 = [(MCDTableViewCell *)self textLabel];
    [v14 setNumberOfLines:2];

    uint64_t v15 = [(MCDTableViewCell *)self detailTextLabel];
    [v15 setText:0];
  }
  else
  {
    uint64_t v16 = [v25 name];
    id v17 = [v16 length];
    if (v17)
    {
      [v25 name];
    }
    else
    {
      id v6 = sub_1000BDDCC();
      [v6 localizedStringForKey:@"Unknown Title" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    id v18 = };
    id v19 = [(MCDTableViewCell *)self textLabel];
    [v19 setText:v18];

    if (!v17)
    {

      id v18 = v6;
    }

    id v20 = [(MCDTableViewCell *)self textLabel];
    [v20 setNumberOfLines:1];

    uint64_t v15 = [v25 shortEditorNotes];
    v21 = v15;
    if (!v15)
    {
      v21 = [v25 editorNotes];
    }
    v22 = [(MCDTableViewCell *)self detailTextLabel];
    [v22 setText:v21];

    if (!v15) {
  }
    }

  [(MCDTableViewCell *)self setCurrentlyPlaying:v8];
  [(MCDTableViewCell *)self setContentUnavailable:0];
  id v23 = [v25 artworkCatalog];
  id v24 = +[UIImage _systemImageNamed:@"music.note"];
  [(MCDTableViewCell *)self setArtworkCatalog:v23 andScale:v24 fallbackImage:a6];

  [(_MCDReusableCell *)self setArtworkRadiusKind:0];
}

- (void)configureWithAttributionArtwork:(id)a3 artworkScale:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(MCDTableViewCell *)self accessoryView];
    if (v7
      && (BOOL v8 = (void *)v7,
          [(MCDTableViewCell *)self accessoryView],
          BOOL v9 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          v8,
          (isKindOfClass & 1) != 0))
    {
      id v11 = [(MCDTableViewCell *)self accessoryView];
    }
    else
    {
      id v11 = objc_opt_new();
      [v11 setFrame:0.0, 0.0, 30.0, 30.0];
      id v12 = [v11 layer];
      [v12 setCornerRadius:15.0];

      [v11 setClipsToBounds:1];
      [(MCDTableViewCell *)self setAccessoryView:v11];
    }
    [v11 frame];
    [v6 setFittingSize:v13, v14];
    [v6 setDestinationScale:a4];
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    [v6 setCacheIdentifier:v16 forRequestingContext:self];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000BF304;
    v18[3] = &unk_100FC4550;
    id v19 = v11;
    id v17 = v11;
    [v6 setDestination:v17 configurationBlock:v18];
  }
  else
  {
    [(MCDTableViewCell *)self setAccessoryView:0];
  }
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  double v4 = [(MCDTableViewCell *)self textLabel];
  BOOL v5 = [v4 text];

  if (v5)
  {
    id v6 = [(MCDTableViewCell *)self textLabel];
    uint64_t v7 = [v6 text];
    [v3 addObject:v7];
  }
  BOOL v8 = [(MCDTableViewCell *)self detailTextLabel];
  BOOL v9 = [v8 text];

  if (v9)
  {
    BOOL v10 = [(MCDTableViewCell *)self detailTextLabel];
    id v11 = [v10 text];
    [v3 addObject:v11];
  }
  id v12 = [v3 copy];

  return v12;
}

@end