@interface IMBlockActivityItemPlusThumbnailProvider
- (IMBlockActivityItemPlusThumbnailProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4 thumbnailResolutionBlock:(id)a5;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)thumbnailResolutionBlock;
- (void)setThumbnailResolutionBlock:(id)a3;
@end

@implementation IMBlockActivityItemPlusThumbnailProvider

- (IMBlockActivityItemPlusThumbnailProvider)initWithUTI:(id)a3 resolutionBlock:(id)a4 thumbnailResolutionBlock:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMBlockActivityItemPlusThumbnailProvider;
  v9 = [(IMBlockActivityItemProvider *)&v13 initWithUTI:a3 resolutionBlock:a4];
  if (v9)
  {
    id v10 = [v8 copy];
    id thumbnailResolutionBlock = v9->_thumbnailResolutionBlock;
    v9->_id thumbnailResolutionBlock = v10;
  }
  return v9;
}

- (id)thumbnailResolutionBlock
{
  return self->_thumbnailResolutionBlock;
}

- (void)setThumbnailResolutionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  v9 = [(IMBlockActivityItemPlusThumbnailProvider *)self thumbnailResolutionBlock];
  id v10 = ((void (**)(void, id, double, double))v9)[2](v9, v8, width, height);

  return v10;
}

@end