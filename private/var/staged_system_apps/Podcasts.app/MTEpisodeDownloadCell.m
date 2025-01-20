@interface MTEpisodeDownloadCell
+ (BOOL)showsArtwork;
- (BOOL)_isDownloadButtonEnabledForDownloadPhase:(int64_t)a3;
- (BOOL)_isPausedForDownloadPhase:(int64_t)a3;
- (BOOL)isPausable;
- (BOOL)isPaused;
- (MTDownloadOfferButton)downloadButton;
- (UITapGestureRecognizer)tapGesture;
- (void)cellTapped;
- (void)configureSubviews;
- (void)downloadButtonTapped:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)setPausable:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTapGesture:(id)a3;
- (void)updateWithObject:(id)a3;
@end

@implementation MTEpisodeDownloadCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (void)configureSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MTEpisodeDownloadCell;
  [(MTGenericCollectionCell *)&v10 configureSubviews];
  v3 = [(MTEpisodeDownloadCell *)self downloadButton];
  [(MTGenericCollectionCell *)self setSideView:v3];

  v4 = [(MTCollectionViewCell *)self deleteButton];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"DOWNLOAD_CANCEL" value:&stru_10056A8A0 table:0];
  [v4 setTitle:v6 forState:0];

  v7 = [(MTCollectionViewCell *)self actionButtonsContainer];
  [v7 setNeedsLayout];

  [(MTEpisodeDownloadCell *)self setNeedsLayout];
  id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"cellTapped"];
  [(MTEpisodeDownloadCell *)self setTapGesture:v8];

  v9 = [(MTEpisodeDownloadCell *)self tapGesture];
  [(MTEpisodeDownloadCell *)self addGestureRecognizer:v9];
}

- (void)updateWithObject:(id)a3
{
  id v18 = a3;
  if (!v18) {
    goto LABEL_4;
  }
  v4 = +[MTDB sharedInstance];
  v5 = [v4 mainQueueContext];

  v6 = [v18 episodeUuid];
  v7 = [v5 episodeForUuid:v6];

  if (v7)
  {
    id v8 = [(MTCollectionViewCell *)self contentView];
    [v8 setHidden:0];

    v9 = [v7 podcastUuid];
    [(MTGenericCollectionCell *)self setArtworkKey:v9];

    [v18 downloadProgress];
    double v11 = v10;
    v12 = [(MTEpisodeDownloadCell *)self downloadButton];
    [v12 setProgress:v11];

    v13 = [v7 bestTitle];
    [(MTGenericCollectionCell *)self setTitle:v13];

    v14 = +[MTEpisode dateLabelDescriptionForEpisode:v7 download:v18];
    [(MTGenericCollectionCell *)self setSubtitle:v14];

    -[MTEpisodeDownloadCell setPausable:](self, "setPausable:", [v18 isPausable]);
    id v15 = [v18 downloadPhase];
    [(MTEpisodeDownloadCell *)self setPaused:[(MTEpisodeDownloadCell *)self _isPausedForDownloadPhase:v15]];
    BOOL v16 = [(MTEpisodeDownloadCell *)self _isDownloadButtonEnabledForDownloadPhase:v15];
    v17 = [(MTEpisodeDownloadCell *)self downloadButton];
    [v17 setEnabled:v16];

    [(MTEpisodeDownloadCell *)self setNeedsLayout];
  }
  else
  {
LABEL_4:
    v7 = [(MTCollectionViewCell *)self contentView];
    [v7 setHidden:1];
  }
}

- (void)setPausable:(BOOL)a3
{
  self->_pausable = a3;
  BOOL v3 = !a3;
  id v4 = [(MTEpisodeDownloadCell *)self downloadButton];
  [v4 setHidden:v3];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  self->_paused = a3;
  v5 = [(MTEpisodeDownloadCell *)self downloadButton];
  v6 = v5;
  if (v3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  [v5 setProgressType:v7 animated:0];

  [(MTEpisodeDownloadCell *)self setNeedsLayout];
}

- (BOOL)_isPausedForDownloadPhase:(int64_t)a3
{
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)_isDownloadButtonEnabledForDownloadPhase:(int64_t)a3
{
  return a3 != 4;
}

- (MTDownloadOfferButton)downloadButton
{
  downloadButton = self->_downloadButton;
  if (!downloadButton)
  {
    id v4 = objc_alloc_init(MTDownloadOfferButton);
    v5 = self->_downloadButton;
    self->_downloadButton = v4;

    [(MTDownloadOfferButton *)self->_downloadButton addTarget:self action:"downloadButtonTapped:" forControlEvents:64];
    downloadButton = self->_downloadButton;
  }

  return downloadButton;
}

- (void)downloadButtonTapped:(id)a3
{
  id v4 = [(MTCollectionViewCell *)self scrollView];
  [v4 contentOffset];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    id v7 = [(MTCollectionViewCell *)self delegate];
    [v7 cellDidPressToggleDownload:self];
  }
}

- (void)cellTapped
{
  id v5 = [(MTCollectionViewCell *)self collectionView];
  BOOL v3 = [v5 indexPathForCell:self];
  if (v3)
  {
    id v4 = [v5 delegate];
    [v4 collectionView:v5 didSelectItemAtIndexPath:v3];
  }
}

- (BOOL)isPausable
{
  return self->_pausable;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setDownloadButton:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);

  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end