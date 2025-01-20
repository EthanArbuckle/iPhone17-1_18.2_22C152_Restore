@interface PUVideoComplementItemSource
- (PUVideoComplementItemSource)initWithVideoComplement:(id)a3;
- (PUVideoComplementItemSource)initWithVideoComplementBundleAtURL:(id)a3;
- (id)_initWithVideoComplement:(id)a3 bundleAtURL:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)activityViewControllerSubject:(id)a3;
- (id)activityViewControllerSuggestionFileURL:(id)a3;
@end

@implementation PUVideoComplementItemSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

- (id)activityViewControllerSuggestionFileURL:(id)a3
{
  return self->_bundleURL;
}

- (id)activityViewControllerSubject:(id)a3
{
  v3 = [(PFVideoComplement *)self->_videoComplement imagePath];
  v4 = [v3 lastPathComponent];

  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  v7 = [(PFVideoComplement *)self->_videoComplement imagePath];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithContentsOfFile:v7];
  [v8 size];
  v18.origin.x = PURectWithAspectRatioFillingRect(v9 / v10, 0.0, 0.0, width, height);
  CGRect v19 = CGRectIntegral(v18);
  double v11 = v19.size.width;
  double v12 = v19.size.height;
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v19.origin.x = v19.size.width;
  v19.origin.y = v19.size.height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v19.origin, 1, 0.0);
  objc_msgSend(v8, "drawInRect:", v13, v14, v11, v12);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![v5 isEqualToString:@"com.apple.Photos.activity.saveToCameraRoll"]
    || (v6 = self->_videoComplement) == 0)
  {
    if (+[PUActivityItemSourceConfiguration isLivePhotoBundleSupportedByActivityType:v5])
    {
      v6 = self->_bundleURL;
    }
    else
    {
      v6 = 0;
    }
  }
  v7 = [(PFVideoComplement *)self->_videoComplement imagePath];
  if (!v6)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F9F360]])
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:1 error:0];
      if (!v8) {
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7];
      }
      double v9 = (void *)MEMORY[0x1E4F8CDF8];
      double v10 = [v7 pathExtension];
      double v11 = [v9 typeWithFilenameExtension:v10 conformingToType:*MEMORY[0x1E4F44400]];

      v6 = 0;
      if (v8 && v11)
      {
        double v12 = [v11 identifier];
        double v14 = v12;
        v15[0] = v8;
        v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      }
      if (v6) {
        goto LABEL_18;
      }
    }
    else
    {
      v6 = 0;
    }
    if (v7)
    {
      v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
    }
  }
LABEL_18:

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E4F44400], "identifier", a3, a4);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (PUVideoComplementItemSource)initWithVideoComplement:(id)a3
{
  return (PUVideoComplementItemSource *)[(PUVideoComplementItemSource *)self _initWithVideoComplement:a3 bundleAtURL:0];
}

- (PUVideoComplementItemSource)initWithVideoComplementBundleAtURL:(id)a3
{
  return (PUVideoComplementItemSource *)[(PUVideoComplementItemSource *)self _initWithVideoComplement:0 bundleAtURL:a3];
}

- (id)_initWithVideoComplement:(id)a3 bundleAtURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PUVideoComplementItemSource;
  v8 = [(PUVideoComplementItemSource *)&v21 init];
  double v9 = v8;
  if (v8)
  {
    p_bundleURL = (void **)&v8->_bundleURL;
    objc_storeStrong((id *)&v8->_bundleURL, a4);
    double v11 = v6
        ? (PFVideoComplement *)v6
        : (PFVideoComplement *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v7];
    p_videoComplement = (id *)&v9->_videoComplement;
    videoComplement = v9->_videoComplement;
    v9->_videoComplement = v11;

    if (!*p_bundleURL)
    {
      if (*p_videoComplement)
      {
        double v14 = [*p_videoComplement imagePath];
        v15 = [v14 stringByDeletingLastPathComponent];
        v16 = [v15 pathExtension];
        int v17 = [v16 isEqualToString:*MEMORY[0x1E4F8CED8]];

        if (v17)
        {
          uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:1];
          CGRect v19 = *p_bundleURL;
          *p_bundleURL = (void *)v18;
        }
      }
    }
  }

  return v9;
}

@end