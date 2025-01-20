@interface NMBUIMediaTableCellConfiguration
- (MPArtworkCatalog)artworkCatalog;
- (NMBUIMediaTableCellDownloadState)downloadState;
- (NSString)placeholderSystemImageName;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)placeholderIconColor;
- (UIImage)placeholderImage;
- (id)downloadIndicatorTapAction;
- (id)modelObject;
- (void)setArtworkCatalog:(id)a3;
- (void)setDownloadIndicatorTapAction:(id)a3;
- (void)setDownloadState:(id)a3;
- (void)setModelObject:(id)a3;
- (void)setPlaceholderIconColor:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderSystemImageName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NMBUIMediaTableCellConfiguration

- (UIImage)placeholderImage
{
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    if (self->_placeholderSystemImageName)
    {
      v4 = objc_msgSend(MEMORY[0x263F1C6B0], "_systemImageNamed:");
      v5 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
      v6 = [v4 imageWithSymbolConfiguration:v5];
      v7 = [v6 imageWithRenderingMode:2];

      +[NMBUIMediaTableCell artworkSize];
      UIGraphicsBeginImageContextWithOptions(v33, 1, 0.0);
      v8 = [MEMORY[0x263F1C550] colorWithRed:0.247058824 green:0.247058824 blue:0.254901961 alpha:1.0];
      [v8 set];

      +[NMBUIMediaTableCell artworkSize];
      CGFloat v10 = v9;
      +[NMBUIMediaTableCell artworkSize];
      v34.size.height = v11;
      v34.origin.x = 0.0;
      v34.origin.y = 0.0;
      v34.size.width = v10;
      UIRectFill(v34);
      [v7 size];
      __asm { FMOV            V4.2D, #24.0 }
      _UIScaleTransformForAspectFitOfSizeInTargetSize();
      [v7 size];
      +[NMBUIMediaTableCell artworkSize];
      UIRectCenteredIntegralRectScale();
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      v25 = [(NMBUIMediaTableCellConfiguration *)self placeholderIconColor];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        id v27 = [MEMORY[0x263F1C550] systemGrayColor];
      }
      v28 = v27;

      [v28 set];
      objc_msgSend(v7, "drawInRect:", v18, v20, v22, v24);
      UIGraphicsGetImageFromCurrentImageContext();
      v29 = (UIImage *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      v30 = self->_placeholderImage;
      self->_placeholderImage = v29;

      placeholderImage = self->_placeholderImage;
    }
    else
    {
      placeholderImage = 0;
    }
  }
  return placeholderImage;
}

- (id)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (NSString)placeholderSystemImageName
{
  return self->_placeholderSystemImageName;
}

- (void)setPlaceholderSystemImageName:(id)a3
{
}

- (UIColor)placeholderIconColor
{
  return self->_placeholderIconColor;
}

- (void)setPlaceholderIconColor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NMBUIMediaTableCellDownloadState)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
}

- (id)downloadIndicatorTapAction
{
  return self->_downloadIndicatorTapAction;
}

- (void)setDownloadIndicatorTapAction:(id)a3
{
}

- (void)setPlaceholderImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong(&self->_downloadIndicatorTapAction, 0);
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_placeholderIconColor, 0);
  objc_storeStrong((id *)&self->_placeholderSystemImageName, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong(&self->_modelObject, 0);
}

@end