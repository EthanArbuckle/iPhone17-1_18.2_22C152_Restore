@interface MTImageActivityItemProvider
- (MTImageActivityItemProvider)initWithDataSource:(id)a3;
- (MTShareUtilDataSource)dataSource;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTImageActivityItemProvider

- (MTImageActivityItemProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTImageActivityItemProvider;
  v6 = [(MTImageActivityItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(MTImageActivityItemProvider *)self dataSource];
  v4 = [v3 shareImage];

  if (!v4)
  {
    v4 = +[UIImage defaultPodcastArtwork];
  }

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:UIActivityTypeSaveToNotes])
  {
    v6 = [(MTImageActivityItemProvider *)self dataSource];
    uint64_t v7 = [(MTInstagramShareModel *)v6 shareImage];
LABEL_6:
    v16 = (void *)v7;

    goto LABEL_8;
  }
  if (os_feature_enabled_story_sharing()
    && [v5 isEqualToString:@"com.burbn.instagram.shareextension"])
  {
    v18 = [MTInstagramShareModel alloc];
    v20 = [(MTImageActivityItemProvider *)self dataSource];
    v8 = [v20 sharePodcastTitle];
    v19 = [(MTImageActivityItemProvider *)self dataSource];
    objc_super v9 = [v19 shareEpisodeTitle];
    v10 = [(MTImageActivityItemProvider *)self dataSource];
    v11 = [v10 shareProvider];
    v12 = [(MTImageActivityItemProvider *)self dataSource];
    v13 = [v12 pubDate];
    v14 = [(MTImageActivityItemProvider *)self dataSource];
    v15 = [v14 shareImage];
    v6 = [(MTInstagramShareModel *)v18 initWithShowName:v8 episodeName:v9 creatorName:v11 publishDate:v13 artwork:v15];

    uint64_t v7 = +[MTInstagramShareUtil createSocialPostUIImageWithShareModel:v6];
    goto LABEL_6;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end