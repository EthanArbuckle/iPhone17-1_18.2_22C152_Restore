@interface MTPodcastCell
+ (BOOL)showsArtwork;
- (MTCountChevronView)countView;
- (MTPodcastCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_subtitleForPodcast:(id)a3;
- (void)configureSubviews;
- (void)setCountView:(id)a3;
- (void)updateColors;
- (void)updateFonts;
- (void)updateWithObject:(id)a3;
@end

@implementation MTPodcastCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (MTPodcastCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTPodcastCell;
  v4 = [(MTGenericCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MTPodcastCell *)v4 configureSubviews];
  }
  return v5;
}

- (void)updateWithObject:(id)a3
{
  id v11 = a3;
  v4 = [v11 title];
  [(MTGenericCell *)self setTitle:v4];

  v5 = [(MTPodcastCell *)self _subtitleForPodcast:v11];
  [(MTGenericCell *)self setSubtitle:v5];

  unsigned __int8 v6 = [v11 isDark];
  if (v6)
  {
    objc_super v7 = &off_100579860;
  }
  else
  {
    objc_super v7 = [v11 countOfUnplayedEpisodes];
  }
  v8 = [(MTPodcastCell *)self countView];
  [v8 setCount:v7];

  if ((v6 & 1) == 0) {
  v9 = [(MTPodcastCell *)self countView];
  }
  [v9 sizeToFit];

  v10 = [v11 uuid];
  [(MTGenericCell *)self setArtworkKey:v10];

  [(MTPodcastCell *)self setNeedsLayout];
}

- (id)_subtitleForPodcast:(id)a3
{
  uint64_t v3 = kPodcastFeedChangedDate;
  id v4 = a3;
  v5 = [v4 valueForKey:v3];
  unsigned __int8 v6 = [v5 friendlyDisplayString];
  objc_super v7 = [v4 countOfNewEpisodes];

  id v8 = [v7 unsignedIntegerValue];
  if (v8)
  {
    id v8 = +[MTCountUtil stringForNewEpisodeCount:v8 titleCase:0];
  }
  if ([v5 isToday] && objc_msgSend(v8, "isNotEmpty"))
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"UPDATED_DATE_AT_TIME_AND_NEW_EPISODE_COUNT_FORMAT" value:&stru_10056A8A0 table:0];

    id v11 = [v5 timeString];
    +[NSString stringWithValidatedFormat:v10, @"%@ %@ %@", 0, v6, v11, v8 validFormatSpecifiers error];
    v13 = LABEL_8:;

LABEL_9:
    goto LABEL_19;
  }
  if ([v5 isToday])
  {
    v12 = +[NSBundle mainBundle];
    v10 = [v12 localizedStringForKey:@"DATE_AT_TIME" value:&stru_10056A8A0 table:0];

    id v11 = [v5 timeString];
    +[NSString stringWithValidatedFormat:v10, @"%@ %@", 0, v6, v11, v17 validFormatSpecifiers error];
    goto LABEL_8;
  }
  if ([v6 isNotEmpty] && objc_msgSend(v8, "isNotEmpty"))
  {
    v14 = +[NSBundle mainBundle];
    v10 = [v14 localizedStringForKey:@"UPDATED_DATE_AND_NEW_EPISODE_COUNT_FORMAT" value:&stru_10056A8A0 table:0];

    v13 = +[NSString stringWithValidatedFormat:v10, @"%@ %@", 0, v6, v8 validFormatSpecifiers error];
    goto LABEL_9;
  }
  if ([v6 isNotEmpty])
  {
    id v15 = v6;
LABEL_17:
    v13 = v15;
    goto LABEL_19;
  }
  if ([v8 isNotEmpty])
  {
    id v15 = v8;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void)configureSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTPodcastCell;
  [(MTGenericCell *)&v4 configureSubviews];
  uint64_t v3 = [(MTPodcastCell *)self countView];
  [(MTGenericCell *)self setSideView:v3];
}

- (void)updateFonts
{
  v8.receiver = self;
  v8.super_class = (Class)MTPodcastCell;
  [(MTGenericCell *)&v8 updateFonts];
  uint64_t v3 = [(MTGenericCell *)self textStackView];
  objc_super v4 = [v3 titleTextStyle];
  v5 = +[UIFont mt_preferredFontForTextStyle:v4];
  unsigned __int8 v6 = [(MTPodcastCell *)self countView];
  [v6 setFont:v5];

  objc_super v7 = [(MTPodcastCell *)self countView];
  [v7 sizeToFit];

  [(MTPodcastCell *)self setNeedsLayout];
}

- (void)updateColors
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastCell;
  [(MTGenericCell *)&v6 updateColors];
  uint64_t v3 = [(MTGenericCell *)self textStackView];
  objc_super v4 = [v3 subtitleTextColor];
  v5 = [(MTPodcastCell *)self countView];
  [v5 setTextColor:v4];
}

- (MTCountChevronView)countView
{
  countView = self->_countView;
  if (!countView)
  {
    objc_super v4 = (MTCountChevronView *)objc_opt_new();
    v5 = self->_countView;
    self->_countView = v4;

    objc_super v6 = +[UIColor orangeColor];
    [(MTCountChevronView *)self->_countView setTintColor:v6];

    countView = self->_countView;
  }

  return countView;
}

- (void)setCountView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end