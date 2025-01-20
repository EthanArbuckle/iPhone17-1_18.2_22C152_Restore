@interface TopBannerItem
- (MKArtworkImageSource)artwork;
- (NSAttributedString)attributedText;
- (NSString)buttonText;
- (NSURL)artworkURL;
- (NSURLSessionTask)urlSessionTask;
- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 icon:(id)a7 buttonText:(id)a8 buttonAction:(id)a9;
- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 iconURL:(id)a7 buttonText:(id)a8 buttonAction:(id)a9 iconProcessingHandler:(id)a10;
- (id)buttonAction;
- (id)iconProcessingHandler;
- (id)userInfo;
- (int64_t)layout;
- (int64_t)maxNumberOfLines;
- (unint64_t)itemType;
- (void)downloadImage;
- (void)setArtwork:(id)a3;
- (void)setIconProcessingHandler:(id)a3;
- (void)setMaxNumberOfLines:(int64_t)a3;
- (void)setUrlSessionTask:(id)a3;
@end

@implementation TopBannerItem

- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 icon:(id)a7 buttonText:(id)a8 buttonAction:(id)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TopBannerItem;
  v21 = [(TopBannerItem *)&v30 init];
  v22 = v21;
  if (v21)
  {
    v21->_itemType = a3;
    v21->_layout = a4;
    objc_storeStrong(&v21->_userInfo, a5);
    v22->_maxNumberOfLines = 2;
    v23 = (NSAttributedString *)[v17 copy];
    attributedText = v22->_attributedText;
    v22->_attributedText = v23;

    objc_storeStrong((id *)&v22->_artwork, a7);
    v25 = (NSString *)[v19 copy];
    buttonText = v22->_buttonText;
    v22->_buttonText = v25;

    id v27 = [v20 copy];
    id buttonAction = v22->_buttonAction;
    v22->_id buttonAction = v27;
  }
  return v22;
}

- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 iconURL:(id)a7 buttonText:(id)a8 buttonAction:(id)a9 iconProcessingHandler:(id)a10
{
  id v16 = a7;
  id v17 = a10;
  id v18 = [(TopBannerItem *)self initWithType:a3 layout:a4 userInfo:a5 attributedString:a6 icon:0 buttonText:a8 buttonAction:a9];
  if (v18)
  {
    id v19 = (NSURL *)[v16 copy];
    artworkURL = v18->_artworkURL;
    v18->_artworkURL = v19;

    id v21 = [v17 copy];
    id iconProcessingHandler = v18->_iconProcessingHandler;
    v18->_id iconProcessingHandler = v21;

    [(TopBannerItem *)v18 downloadImage];
  }

  return v18;
}

- (void)downloadImage
{
  v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v4 = +[NSURLSession sessionWithConfiguration:v3];

  objc_initWeak(&location, self);
  v5 = [(TopBannerItem *)self artworkURL];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10089A700;
  v8[3] = &unk_1012F9BD0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v6 = [v4 dataTaskWithURL:v5 completionHandler:v8];
  [(TopBannerItem *)self setUrlSessionTask:v6];

  v7 = [(TopBannerItem *)self urlSessionTask];
  [v7 resume];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)maxNumberOfLines
{
  return self->_maxNumberOfLines;
}

- (void)setMaxNumberOfLines:(int64_t)a3
{
  self->_maxNumberOfLines = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (int64_t)layout
{
  return self->_layout;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (MKArtworkImageSource)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (NSURLSessionTask)urlSessionTask
{
  return self->_urlSessionTask;
}

- (void)setUrlSessionTask:(id)a3
{
}

- (id)iconProcessingHandler
{
  return self->_iconProcessingHandler;
}

- (void)setIconProcessingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconProcessingHandler, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong(&self->_userInfo, 0);
}

@end