@interface SBHIconShareSheetActivityItemProvider
- (LSiTunesMetadata)iTunesMetadata;
- (NSString)itemName;
- (NSURL)itemURL;
- (SBHIconShareSheetActivityItemProvider)initWithIconManager:(id)a3 icon:(id)a4;
- (UIImage)itemImage;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (void)setITunesMetadata:(id)a3;
- (void)setItemImage:(id)a3;
- (void)setItemName:(id)a3;
- (void)setItemURL:(id)a3;
@end

@implementation SBHIconShareSheetActivityItemProvider

- (SBHIconShareSheetActivityItemProvider)initWithIconManager:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9B8] data];
  v42.receiver = self;
  v42.super_class = (Class)SBHIconShareSheetActivityItemProvider;
  v9 = [(UIActivityItemProvider *)&v42 initWithPlaceholderItem:v8];
  if (v9)
  {
    v10 = [v7 applicationBundleID];
    if (!v10)
    {
      uint64_t v19 = objc_opt_class();
      id v20 = v7;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
      id v29 = v21;

      v11 = [v29 webClip];

      uint64_t v30 = [v11 pageURL];
      itemURL = v9->_itemURL;
      v9->_itemURL = (NSURL *)v30;

      uint64_t v28 = [v11 title];
      goto LABEL_15;
    }
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
    uint64_t v12 = [v11 iTunesMetadata];
    iTunesMetadata = v9->_iTunesMetadata;
    v9->_iTunesMetadata = (LSiTunesMetadata *)v12;

    v14 = [(LSiTunesMetadata *)v9->_iTunesMetadata distributorInfo];
    v15 = [v14 shareURL];

    v16 = [(LSiTunesMetadata *)v9->_iTunesMetadata distributorInfo];
    v17 = v16;
    if (v15)
    {
      uint64_t v18 = [v16 shareURL];
    }
    else
    {
      v22 = [v16 sourceURL];

      v23 = v9->_iTunesMetadata;
      if (!v22)
      {
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LSiTunesMetadata storeItemIdentifier](v23, "storeItemIdentifier"));
        v27 = [NSString stringWithFormat:@"https://apps.apple.com/app/id%@", v17];
        uint64_t v40 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
        v41 = v9->_itemURL;
        v9->_itemURL = (NSURL *)v40;

        goto LABEL_12;
      }
      v24 = (void *)MEMORY[0x1E4F29088];
      v25 = [(LSiTunesMetadata *)v23 distributorInfo];
      v26 = [v25 sourceURL];
      v17 = [v24 componentsWithURL:v26 resolvingAgainstBaseURL:0];

      [v17 setPath:0];
      uint64_t v18 = [v17 URL];
    }
    v27 = v9->_itemURL;
    v9->_itemURL = (NSURL *)v18;
LABEL_12:

    uint64_t v28 = [(LSiTunesMetadata *)v9->_iTunesMetadata itemName];
LABEL_15:
    itemName = v9->_itemName;
    v9->_itemName = (NSString *)v28;

    v33 = [v6 iconImageCache];
    v34 = [v6 rootViewController];
    v35 = [v34 traitCollection];
    v36 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v35);
    uint64_t v37 = [v33 imageForIcon:v7 imageAppearance:v36 options:0];
    itemImage = v9->_itemImage;
    v9->_itemImage = (UIImage *)v37;
  }
  return v9;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E4F444F8], "identifier", a3, a4);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  v5 = [(SBHIconShareSheetActivityItemProvider *)self itemURL];
  [v4 setOriginalURL:v5];
  [v4 setURL:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F30B20]);
  id v7 = [(SBHIconShareSheetActivityItemProvider *)self itemName];
  [v6 setName:v7];

  v8 = [(SBHIconShareSheetActivityItemProvider *)self iTunesMetadata];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 artistName];
    [v6 setSubtitle:v10];

    v11 = [v9 genre];
    [v6 setGenre:v11];
  }
  else
  {
    v11 = [v5 host];
    [v6 setSubtitle:v11];
  }

  id v12 = objc_alloc(MEMORY[0x1E4F30A38]);
  v13 = [(SBHIconShareSheetActivityItemProvider *)self itemImage];
  v14 = UIImagePNGRepresentation(v13);
  v15 = (void *)[v12 initWithData:v14 MIMEType:@"image/png"];

  [v6 setIcon:v15];
  [v4 setSpecialization:v6];

  return v4;
}

- (LSiTunesMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (void)setItemImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
}

@end