@interface VSOnscreenCodeViewModel
- (BOOL)logoFinishedLoading;
- (BOOL)showButtonLockup;
- (CGSize)preferredLogoSize;
- (NSItemProvider)logoProvider;
- (NSString)buttonLockupTitle;
- (NSString)logoAccessibilityLabel;
- (NSString)onscreenCode;
- (NSString)webPageLabel;
- (NSURL)webPageURL;
- (UIImage)logo;
- (UIImage)qrCode;
- (VSOnscreenCodeViewModelDelegate)delegate;
- (id)formattedWebsiteURL;
- (id)websiteURLWithQueryParameters;
- (void)configureWithRequest:(id)a3;
- (void)setButtonLockupTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogo:(id)a3;
- (void)setLogoAccessibilityLabel:(id)a3;
- (void)setLogoFinishedLoading:(BOOL)a3;
- (void)setLogoProvider:(id)a3;
- (void)setOnscreenCode:(id)a3;
- (void)setPreferredLogoSize:(CGSize)a3;
- (void)setQrCode:(id)a3;
- (void)setShowButtonLockup:(BOOL)a3;
- (void)setWebPageLabel:(id)a3;
- (void)setWebPageURL:(id)a3;
@end

@implementation VSOnscreenCodeViewModel

- (void)configureWithRequest:(id)a3
{
  id v4 = a3;
  [(VSOnscreenCodeViewModel *)self generateQRCode];
  v5.receiver = self;
  v5.super_class = (Class)VSOnscreenCodeViewModel;
  [(VSViewModel *)&v5 configureWithRequest:v4];
}

- (id)websiteURLWithQueryParameters
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [(VSOnscreenCodeViewModel *)self webPageURL];

  if (!v3) {
    goto LABEL_10;
  }
  id v4 = [(VSOnscreenCodeViewModel *)self webPageURL];

  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self webPageURL] parameter must not be nil."];
  }
  objc_super v5 = [(VSOnscreenCodeViewModel *)self webPageURL];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v5 resolvingAgainstBaseURL:0];
  if (!v6)
  {

LABEL_10:
    v13 = 0;
    goto LABEL_24;
  }
  id v7 = v6;
  v8 = [v7 queryItems];
  v31 = v7;
  v32 = v5;
  if (v8)
  {
    v9 = [v7 queryItems];
    v10 = (void *)[v9 mutableCopy];

    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[urlComponents queryItems] mutableCopy] parameter must not be nil."];
    }
    v11 = objc_msgSend(v7, "queryItems", v7, v5);
    id v12 = (id)[v11 mutableCopy];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "name", v31);
        char v21 = [v20 isEqualToString:@"code"];

        v22 = [v19 value];
        v23 = [(VSOnscreenCodeViewModel *)self onscreenCode];
        char v24 = [v22 isEqualToString:v23];

        if (v21 & 1) != 0 || (v24)
        {
          v27 = v14;
          v29 = v31;
          goto LABEL_23;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v25 = objc_alloc(MEMORY[0x263F08BD0]);
  v26 = [(VSOnscreenCodeViewModel *)self onscreenCode];
  v27 = (void *)[v25 initWithName:@"code" value:v26];

  [v14 addObject:v27];
  v28 = (void *)[v14 copy];
  v29 = v31;
  [v31 setQueryItems:v28];

LABEL_23:
  v13 = [v29 URL];

LABEL_24:
  return v13;
}

- (id)formattedWebsiteURL
{
  v3 = [(VSOnscreenCodeViewModel *)self webPageLabel];

  if (!v3)
  {
    v6 = [(VSOnscreenCodeViewModel *)self webPageURL];

    if (!v6)
    {
      objc_super v5 = &stru_26F361E90;
      goto LABEL_31;
    }
    id v7 = [(VSOnscreenCodeViewModel *)self webPageURL];

    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self webPageURL] parameter must not be nil."];
    }
    v8 = [(VSOnscreenCodeViewModel *)self webPageURL];
    v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v8 resolvingAgainstBaseURL:0];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
      id v12 = [v11 host];
      if (v12)
      {
        objc_super v5 = [&stru_26F361E90 stringByAppendingString:v12];
      }
      else
      {
        objc_super v5 = &stru_26F361E90;
      }
      uint64_t v15 = [v11 port];
      uint64_t v16 = (void *)v15;
      if (v15)
      {
        uint64_t v17 = [(__CFString *)v5 stringByAppendingFormat:@":%@", v15];

        objc_super v5 = (__CFString *)v17;
      }
      v18 = [v11 path];
      if (!v18) {
        goto LABEL_28;
      }
      v19 = [(__CFString *)v5 stringByAppendingString:v18];
    }
    else
    {
      v13 = [v8 resourceSpecifier];
      id v11 = v13;
      if (!v13)
      {
        objc_super v5 = &stru_26F361E90;
LABEL_30:

        goto LABEL_31;
      }
      id v12 = v13;
      if ([v12 hasPrefix:@"//"])
      {
        id v14 = [v12 substringFromIndex:2];
      }
      else
      {
        id v14 = (__CFString *)v12;
      }
      objc_super v5 = v14;
      uint64_t v16 = [(__CFString *)v14 componentsSeparatedByString:@"?"];
      if ((unint64_t)[v16 count] < 2)
      {
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v20 = [v16 firstObject];
      v18 = (void *)v20;
      if (v20) {
        char v21 = (void *)v20;
      }
      else {
        char v21 = v5;
      }
      v19 = v21;
    }
    v22 = v19;

    objc_super v5 = v22;
LABEL_28:

    goto LABEL_29;
  }
  id v4 = [(VSOnscreenCodeViewModel *)self webPageLabel];

  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self webPageLabel] parameter must not be nil."];
  }
  objc_super v5 = [(VSOnscreenCodeViewModel *)self webPageLabel];
LABEL_31:
  return v5;
}

- (NSItemProvider)logoProvider
{
  return self->_logoProvider;
}

- (void)setLogoProvider:(id)a3
{
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (CGSize)preferredLogoSize
{
  double width = self->preferredLogoSize.width;
  double height = self->preferredLogoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredLogoSize:(CGSize)a3
{
  self->preferredLogoSize = a3;
}

- (BOOL)logoFinishedLoading
{
  return self->logoFinishedLoading;
}

- (void)setLogoFinishedLoading:(BOOL)a3
{
  self->logoFinishedLoading = a3;
}

- (NSString)logoAccessibilityLabel
{
  return self->_logoAccessibilityLabel;
}

- (void)setLogoAccessibilityLabel:(id)a3
{
}

- (VSOnscreenCodeViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSOnscreenCodeViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)qrCode
{
  return self->_qrCode;
}

- (void)setQrCode:(id)a3
{
}

- (NSString)onscreenCode
{
  return self->_onscreenCode;
}

- (void)setOnscreenCode:(id)a3
{
}

- (NSString)webPageLabel
{
  return self->_webPageLabel;
}

- (void)setWebPageLabel:(id)a3
{
}

- (NSURL)webPageURL
{
  return self->_webPageURL;
}

- (void)setWebPageURL:(id)a3
{
}

- (BOOL)showButtonLockup
{
  return self->_showButtonLockup;
}

- (void)setShowButtonLockup:(BOOL)a3
{
  self->_showButtonLockup = a3;
}

- (NSString)buttonLockupTitle
{
  return self->_buttonLockupTitle;
}

- (void)setButtonLockupTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLockupTitle, 0);
  objc_storeStrong((id *)&self->_webPageURL, 0);
  objc_storeStrong((id *)&self->_webPageLabel, 0);
  objc_storeStrong((id *)&self->_onscreenCode, 0);
  objc_storeStrong((id *)&self->_qrCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logoAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoProvider, 0);
}

@end