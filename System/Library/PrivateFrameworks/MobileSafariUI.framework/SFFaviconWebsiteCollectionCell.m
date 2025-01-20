@interface SFFaviconWebsiteCollectionCell
- (void)_requestFavicon;
- (void)_updateContentConfiguration;
- (void)setURL:(id)a3 withTitle:(id)a4;
@end

@implementation SFFaviconWebsiteCollectionCell

- (void)setURL:(id)a3 withTitle:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (![(NSURL *)self->_siteURL isEqual:v10]
    || ![(NSString *)self->_title isEqualToString:v7])
  {
    objc_storeStrong((id *)&self->_siteURL, a3);
    v8 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v8;

    [(SFFaviconWebsiteCollectionCell *)self _requestFavicon];
    [(SFFaviconWebsiteCollectionCell *)self _updateContentConfiguration];
  }
}

- (void)_updateContentConfiguration
{
  id v14 = [(SFFaviconWebsiteCollectionCell *)self defaultContentConfiguration];
  [v14 setText:self->_title];
  v3 = [v14 textProperties];
  [v3 setLineBreakMode:4];

  v4 = [v14 textProperties];
  [v4 setNumberOfLines:1];

  v5 = [v14 secondaryTextProperties];
  [v5 setLineBreakMode:4];

  v6 = [v14 secondaryTextProperties];
  [v6 setNumberOfLines:1];

  id v7 = [(NSURL *)self->_siteURL safari_stringForListDisplay];
  [v14 setSecondaryText:v7];

  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v9 = [v14 secondaryTextProperties];
  [v9 setColor:v8];

  if (self->_favicon)
  {
    objc_msgSend(v14, "setImage:");
  }
  else
  {
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"globe"];
    [v14 setImage:v10];
  }
  v11 = [v14 imageProperties];
  [v11 setCornerRadius:2.0];

  v12 = [v14 imageProperties];
  objc_msgSend(v12, "setReservedLayoutSize:", 24.0, 24.0);

  v13 = [v14 imageProperties];
  objc_msgSend(v13, "setMaximumSize:", 24.0, 24.0);

  [(SFFaviconWebsiteCollectionCell *)self setContentConfiguration:v14];
}

- (void)_requestFavicon
{
  favicon = self->_favicon;
  self->_favicon = 0;

  v4 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  [v4 cancelRequestWithToken:self->_faviconRequestToken];

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F98AE8]), "initWithURL:iconSize:fallbackType:", self->_siteURL, 0, 24.0, 24.0);
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SFFaviconWebsiteCollectionCell__requestFavicon__block_invoke;
  v9[3] = &unk_1E6D78D98;
  objc_copyWeak(&v10, &location);
  id v7 = [v6 registerRequest:v5 priority:2 responseHandler:v9];
  id faviconRequestToken = self->_faviconRequestToken;
  self->_id faviconRequestToken = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__SFFaviconWebsiteCollectionCell__requestFavicon__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v10;
    v5 = [v4 favicon];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F98BC8];
      id v7 = [v4 favicon];
      uint64_t v8 = objc_msgSend(v6, "resizedImage:withSize:", v7, 24.0, 24.0);
      id v9 = WeakRetained[111];
      WeakRetained[111] = (id)v8;

      objc_msgSend(WeakRetained[111], "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
      [WeakRetained _updateContentConfiguration];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favicon, 0);
  objc_storeStrong(&self->_faviconRequestToken, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_siteURL, 0);
}

@end