@interface MTPlaylistSettingsPodcastGroupCell
- (MTArtworkView)artworkView;
- (MTPlaylistSettingsPodcastGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
@end

@implementation MTPlaylistSettingsPodcastGroupCell

- (MTPlaylistSettingsPodcastGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTPlaylistSettingsPodcastGroupCell;
  v4 = [(MTTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(MTArtworkView);
    [(MTPlaylistSettingsPodcastGroupCell *)v4 setArtworkView:v5];

    v6 = [(MTPlaylistSettingsPodcastGroupCell *)v4 contentView];
    v7 = [(MTPlaylistSettingsPodcastGroupCell *)v4 artworkView];
    [v6 addSubview:v7];
  }
  return v4;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)MTPlaylistSettingsPodcastGroupCell;
  [(MTTableViewCell *)&v44 layoutSubviews];
  v3 = [(MTPlaylistSettingsPodcastGroupCell *)self contentView];
  [v3 bounds];
  CGFloat v38 = v5;
  CGFloat v39 = v4;
  CGFloat v37 = v6;
  CGFloat rect = v7;

  id v8 = [(MTPlaylistSettingsPodcastGroupCell *)self effectiveUserInterfaceLayoutDirection];
  [(MTPlaylistSettingsPodcastGroupCell *)self layoutMargins];
  +[MTPlaylistSettingsViewController podcastImageSize];
  [(MTPlaylistSettingsPodcastGroupCell *)self bounds];
  IMRectCenteredYInRectScale();
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  v17 = [(MTPlaylistSettingsPodcastGroupCell *)self textLabel];
  [v17 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v45.origin.x = v10;
  double v42 = v14;
  double v43 = v12;
  v45.origin.y = v12;
  v45.size.width = v14;
  v45.size.height = v16;
  double v24 = CGRectGetMaxX(v45) + 14.0;
  v25 = [(MTPlaylistSettingsPodcastGroupCell *)self textLabel];
  [v25 frame];
  double v27 = v21 - (v24 - v26);

  v46.origin.x = v24;
  v46.origin.y = v19;
  v46.size.width = v27;
  v46.size.height = v23;
  double MinX = CGRectGetMinX(v46);
  double v29 = MinX;
  if (v8 == (id)1)
  {
    double v36 = MinX;
    v47.origin.x = v39;
    v47.origin.y = v38;
    v47.size.width = v37;
    v47.size.height = rect;
    CGFloat v41 = v16;
    double MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v10;
    v48.origin.y = v43;
    v48.size.width = v42;
    v48.size.height = v41;
    double v31 = MaxX - CGRectGetWidth(v48);
    v49.origin.x = v10;
    v49.origin.y = v43;
    v49.size.width = v42;
    v49.size.height = v41;
    double v10 = v31 - CGRectGetMinX(v49);
    v50.origin.x = v39;
    v50.origin.y = v38;
    double v29 = v36;
    v50.size.width = v37;
    v50.size.height = rect;
    double v32 = CGRectGetMaxX(v50);
    v51.origin.x = v24;
    v51.origin.y = v19;
    v51.size.height = v23;
    v51.size.width = v27;
    double v33 = v32 - CGRectGetWidth(v51);
    v52.origin.x = v24;
    v52.origin.y = v19;
    v52.size.height = v23;
    v52.size.width = v27;
    double v24 = v33 - CGRectGetMinX(v52);
    double v16 = v41;
  }
  v34 = [(MTPlaylistSettingsPodcastGroupCell *)self textLabel];
  [v34 setFrame:v24, v19, v27, v23];

  v35 = [(MTPlaylistSettingsPodcastGroupCell *)self artworkView];
  [v35 setFrame:v10, v43, v42, v16];

  -[MTPlaylistSettingsPodcastGroupCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v29, 0.0, 0.0);
}

- (MTArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end