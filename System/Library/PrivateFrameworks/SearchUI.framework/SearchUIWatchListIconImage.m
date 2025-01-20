@interface SearchUIWatchListIconImage
- (SearchUIWatchListIconImage)initWithArtwork:(id)a3;
- (WLKArtworkVariantListing)artwork;
- (int)defaultCornerRoundingStyle;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation SearchUIWatchListIconImage

- (SearchUIWatchListIconImage)initWithArtwork:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIWatchListIconImage;
  v6 = [(SearchUIWatchListIconImage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_artwork, a3);
  }

  return v7;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(SearchUIImage *)self size];
  double v10 = v9 * a3;
  [(SearchUIImage *)self size];
  double v12 = v11 * a3;
  v13 = [(SearchUIWatchListIconImage *)self artwork];
  v14 = objc_msgSend(v13, "bestArtworkVariantOfType:forSize:", 10, v10, v12);

  v15 = objc_opt_new();
  v16 = objc_msgSend(v14, "artworkURLForSize:format:", @"png", v10, v12);
  [v15 setUrlValue:v16];

  [(SearchUIImage *)self setSfImage:v15];
  v17.receiver = self;
  v17.super_class = (Class)SearchUIWatchListIconImage;
  [(SearchUIImage *)&v17 loadImageWithScale:v5 isDarkStyle:v8 completionHandler:a3];
}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (WLKArtworkVariantListing)artwork
{
  return (WLKArtworkVariantListing *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
}

@end