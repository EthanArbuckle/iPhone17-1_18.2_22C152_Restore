@interface MTPodcastGroupCell
+ (BOOL)showsArtwork;
- (BOOL)isCurrentEpisodeDownloaded;
- (BOOL)networkIsReachable;
- (MTCountInfoButton)countInfoButton;
- (MTPodcastGroupCellDelegate)delegate;
- (NSArray)episodeUUIDs;
- (id)_currentEpisodeForPodcastGroup:(id)a3;
- (id)_subtitleForPodcastGroup:(id)a3 currentEpisode:(id)a4;
- (id)_titleForPodcastGroup:(id)a3 currentEpisode:(id)a4;
- (unint64_t)_indexOfEpisodeUUID:(id)a3;
- (void)configureSubviews;
- (void)infoButtonTapped:(id)a3;
- (void)setCountInfoButton:(id)a3;
- (void)setCurrentEpisodeDownloaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEpisodeUUIDs:(id)a3;
- (void)setNetworkIsReachable:(BOOL)a3;
- (void)updateColors;
- (void)updateEnabled;
- (void)updateFonts;
- (void)updateWithObject:(id)a3;
@end

@implementation MTPodcastGroupCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 episodes];
  v6 = [v5 valueForKey:kEpisodeUuid];
  [(MTPodcastGroupCell *)self setEpisodeUUIDs:v6];

  id v17 = [(MTPodcastGroupCell *)self _currentEpisodeForPodcastGroup:v4];
  v7 = [v4 podcast];
  v8 = [v7 uuid];
  [(MTGenericCell *)self setArtworkKey:v8];

  v9 = [(MTPodcastGroupCell *)self _titleForPodcastGroup:v4 currentEpisode:v17];
  [(MTGenericCell *)self setTitle:v9];

  v10 = [(MTPodcastGroupCell *)self _subtitleForPodcastGroup:v4 currentEpisode:v17];

  [(MTGenericCell *)self setSubtitle:v10];
  v11 = [v17 uuid];
  unint64_t v12 = [(MTPodcastGroupCell *)self _indexOfEpisodeUUID:v11];

  v13 = [(MTPodcastGroupCell *)self episodeUUIDs];
  id v14 = [v13 count];

  v15 = [(MTPodcastGroupCell *)self countInfoButton];
  [v15 setIndex:v12 forCount:v14];

  v16 = [(MTPodcastGroupCell *)self countInfoButton];
  [v16 sizeToFit];

  -[MTPodcastGroupCell setCurrentEpisodeDownloaded:](self, "setCurrentEpisodeDownloaded:", [v17 isDownloaded]);
  [(MTPodcastGroupCell *)self updateEnabled];
  [(MTPodcastGroupCell *)self setNeedsLayout];
}

- (void)updateEnabled
{
  v3 = [(MTPodcastGroupCell *)self episodeUUIDs];
  id v4 = [v3 count];

  if (v4) {
    BOOL v5 = [(MTPodcastGroupCell *)self networkIsReachable]
  }
      || [(MTPodcastGroupCell *)self isCurrentEpisodeDownloaded];
  else {
    BOOL v5 = 0;
  }

  [(MTGenericCell *)self setEnabled:v5];
}

- (void)configureSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTPodcastGroupCell;
  [(MTGenericCell *)&v4 configureSubviews];
  v3 = [(MTPodcastGroupCell *)self countInfoButton];
  [(MTGenericCell *)self setSideView:v3];

  [(MTTableViewCell *)self setShowsSeparator:0];
}

- (void)updateFonts
{
  v8.receiver = self;
  v8.super_class = (Class)MTPodcastGroupCell;
  [(MTGenericCell *)&v8 updateFonts];
  v3 = [(MTGenericCell *)self textStackView];
  objc_super v4 = [v3 subtitleTextStyle];
  BOOL v5 = +[UIFont mt_preferredFontForTextStyle:v4];
  v6 = [(MTPodcastGroupCell *)self countInfoButton];
  [v6 setFont:v5];

  v7 = [(MTPodcastGroupCell *)self countInfoButton];
  [v7 sizeToFit];

  [(MTPodcastGroupCell *)self setNeedsLayout];
}

- (void)updateColors
{
  v5.receiver = self;
  v5.super_class = (Class)MTPodcastGroupCell;
  [(MTGenericCell *)&v5 updateColors];
  v3 = +[UIColor appTintColor];
  objc_super v4 = [(MTPodcastGroupCell *)self countInfoButton];
  [v4 setTextColor:v3];
}

- (id)_titleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTPodcastGroupCell *)self isEditing])
  {
    objc_super v8 = [v6 podcast];
    v9 = [v8 title];
  }
  else if (v7)
  {
    v9 = [v7 bestTitle];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_subtitleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v5 = a4;
  if ([(MTPodcastGroupCell *)self isEditing])
  {
    id v6 = [(MTPodcastGroupCell *)self episodeUUIDs];
    uint64_t v7 = +[MTCountUtil stringForUnplayedEpisodeCount:](MTCountUtil, "stringForUnplayedEpisodeCount:", [v6 count]);
LABEL_10:
    v13 = (void *)v7;
    goto LABEL_11;
  }
  if (!v5)
  {
    id v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"No New Episodes" value:&stru_10056A8A0 table:0];
    goto LABEL_10;
  }
  id v6 = +[NSMutableArray array];
  objc_super v8 = [v5 valueForKey:kEpisodePubDate];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 friendlyDisplayString];
    [v6 addObject:v10];
  }
  [v5 duration];
  if (v11 > 0.0)
  {
    unint64_t v12 = +[NSString prettyStringWithDuration:](NSString, "prettyStringWithDuration:");
    [v6 addObject:v12];
  }
  v13 = [v6 componentsJoinedByString:@" • "];

LABEL_11:

  return v13;
}

- (unint64_t)_indexOfEpisodeUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastGroupCell *)self episodeUUIDs];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return (unint64_t)v6;
  }
}

- (id)_currentEpisodeForPodcastGroup:(id)a3
{
  id v4 = a3;
  id v5 = +[MTPlayerController defaultInstance];
  id v6 = [v5 currentItem];
  uint64_t v7 = [v6 episodeUuid];

  objc_super v8 = [(MTPodcastGroupCell *)self episodeUUIDs];
  LODWORD(v5) = [v8 containsObject:v7];

  if (v5)
  {
    v9 = +[MTDB sharedInstance];
    v10 = [v9 mainQueueContext];

    [v10 episodeForUuid:v7];
  }
  else
  {
    v10 = [v4 episodes];
    [v10 firstObject];
  double v11 = };

  return v11;
}

- (MTCountInfoButton)countInfoButton
{
  countInfoButton = self->_countInfoButton;
  if (!countInfoButton)
  {
    id v4 = (MTCountInfoButton *)objc_opt_new();
    id v5 = self->_countInfoButton;
    self->_countInfoButton = v4;

    [(MTCountInfoButton *)self->_countInfoButton addTarget:self action:"infoButtonTapped:" forControlEvents:64];
    countInfoButton = self->_countInfoButton;
  }

  return countInfoButton;
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = [(MTPodcastGroupCell *)self delegate];
  [v4 podcastGroupCellDidTapInfoButton:self];
}

- (MTPodcastGroupCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTPodcastGroupCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)networkIsReachable
{
  return self->_networkIsReachable;
}

- (void)setNetworkIsReachable:(BOOL)a3
{
  self->_networkIsReachable = a3;
}

- (NSArray)episodeUUIDs
{
  return self->_episodeUUIDs;
}

- (void)setEpisodeUUIDs:(id)a3
{
}

- (BOOL)isCurrentEpisodeDownloaded
{
  return self->_currentEpisodeDownloaded;
}

- (void)setCurrentEpisodeDownloaded:(BOOL)a3
{
  self->_currentEpisodeDownloaded = a3;
}

- (void)setCountInfoButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countInfoButton, 0);
  objc_storeStrong((id *)&self->_episodeUUIDs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end