@interface SUStockLinkPresentationSource
- (LPImage)linkPresentationImage;
- (NSString)stockName;
- (NSString)stockSymbol;
- (NSURL)stockURL;
- (SUStockLinkPresentationSource)initWithStockSymbol:(id)a3 name:(id)a4 url:(id)a5;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
@end

@implementation SUStockLinkPresentationSource

- (SUStockLinkPresentationSource)initWithStockSymbol:(id)a3 name:(id)a4 url:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SUStockLinkPresentationSource;
  v12 = [(SUStockLinkPresentationSource *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stockSymbol, a3);
    objc_storeStrong((id *)&v13->_stockName, a4);
    objc_storeStrong((id *)&v13->_stockURL, a5);
    v14 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:@"com.apple.stocks"];
    id v15 = objc_alloc(MEMORY[0x263F4B558]);
    v16 = [MEMORY[0x263F82B60] mainScreen];
    [v16 scale];
    v18 = objc_msgSend(v15, "initWithSize:scale:", 60.0, 60.0, v17);

    id v19 = (id)[v14 prepareImageForDescriptor:v18];
    v20 = [v14 imageForDescriptor:v18];
    objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:", objc_msgSend(v20, "CGImage"));
    v21 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v22 = objc_alloc(MEMORY[0x263F103C0]);
    v23 = UIImagePNGRepresentation(v21);
    uint64_t v24 = [v22 initWithData:v23 MIMEType:@"image/png"];
    linkPresentationImage = v13->_linkPresentationImage;
    v13->_linkPresentationImage = (LPImage *)v24;
  }
  return v13;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F103D8]);
  v5 = [(SUStockLinkPresentationSource *)self stockURL];
  [v4 setOriginalURL:v5];

  v6 = [(SUStockLinkPresentationSource *)self stockURL];
  [v4 setURL:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F10400]);
  v8 = NSString;
  id v9 = [(SUStockLinkPresentationSource *)self stockSymbol];
  id v10 = [(SUStockLinkPresentationSource *)self stockName];
  id v11 = [v8 stringWithFormat:@"%@ · %@", v9, v10];
  [v7 setCombinedTitle:v11];

  v12 = [(SUStockLinkPresentationSource *)self stockSymbol];
  [v7 setTitle:v12];

  v13 = [(SUStockLinkPresentationSource *)self stockName];
  [v7 setSubtitle:v13];

  [v7 setFootnote:@"Stocks"];
  v14 = [(SUStockLinkPresentationSource *)self linkPresentationImage];
  [v7 setIcon:v14];

  [v4 setSpecialization:v7];

  return v4;
}

- (NSString)stockSymbol
{
  return self->_stockSymbol;
}

- (NSString)stockName
{
  return self->_stockName;
}

- (NSURL)stockURL
{
  return self->_stockURL;
}

- (LPImage)linkPresentationImage
{
  return self->_linkPresentationImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationImage, 0);
  objc_storeStrong((id *)&self->_stockURL, 0);
  objc_storeStrong((id *)&self->_stockName, 0);

  objc_storeStrong((id *)&self->_stockSymbol, 0);
}

@end