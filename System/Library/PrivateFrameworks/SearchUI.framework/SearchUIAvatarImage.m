@interface SearchUIAvatarImage
+ (id)avatarImageRenderer;
- (BOOL)requiresImageDataToLoad;
- (CNCancelable)renderingToken;
- (NSArray)contactIdentifiers;
- (NSString)letters;
- (SearchUIAvatarImage)initWithContactImage:(id)a3;
- (SearchUIAvatarImage)initWithMonogramImage:(id)a3;
- (int)defaultCornerRoundingStyle;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setContactIdentifiers:(id)a3;
- (void)setDefaultSizeIfNecessary;
- (void)setLetters:(id)a3;
- (void)setRenderingToken:(id)a3;
- (void)setRequiresImageDataToLoad:(BOOL)a3;
@end

@implementation SearchUIAvatarImage

- (SearchUIAvatarImage)initWithMonogramImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIAvatarImage;
  v5 = [(SearchUIImage *)&v8 initWithSFImage:v4];
  if (v5)
  {
    v6 = [v4 monogramLetters];
    [(SearchUIAvatarImage *)v5 setLetters:v6];

    [(SearchUIImage *)v5 setSupportsFastPathShadow:1];
    [(SearchUIAvatarImage *)v5 setDefaultSizeIfNecessary];
  }

  return v5;
}

- (SearchUIAvatarImage)initWithContactImage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIAvatarImage;
  v5 = [(SearchUIImage *)&v14 initWithSFImage:v4];
  if (v5)
  {
    v6 = [v4 contactIdentifiers];
    [(SearchUIAvatarImage *)v5 setContactIdentifiers:v6];

    v7 = [v4 contactIdentifiers];
    -[SearchUIImage setSupportsFastPathShadow:](v5, "setSupportsFastPathShadow:", [v7 count] == 1);

    [(SearchUIAvatarImage *)v5 setDefaultSizeIfNecessary];
    uint64_t v8 = [v4 appIconBadgeBundleIdentifier];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v4 badgingImage];

      if (!v10)
      {
        v11 = objc_opt_new();
        v12 = [v4 appIconBadgeBundleIdentifier];
        [v11 setBundleIdentifier:v12];

        [(SearchUIAvatarImage *)v5 setBadgingImage:v11];
      }
    }
  }

  return v5;
}

- (int)defaultCornerRoundingStyle
{
  v2 = [(SearchUIAvatarImage *)self contactIdentifiers];
  if ((unint64_t)[v2 count] > 1) {
    int v3 = 1;
  }
  else {
    int v3 = 4;
  }

  return v3;
}

+ (id)avatarImageRenderer
{
  if (avatarImageRenderer_onceToken != -1) {
    dispatch_once(&avatarImageRenderer_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)avatarImageRenderer_avatarImageRenderer;
  return v2;
}

void __42__SearchUIAvatarImage_avatarImageRenderer__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1BB20]);
  v1 = (void *)MEMORY[0x1E4F1BB28];
  id v6 = +[SearchUIContactCache sharedCache];
  v2 = [v6 contactStore];
  int v3 = [v1 settingsWithContactStore:v2];
  uint64_t v4 = [v0 initWithSettings:v3];
  v5 = (void *)avatarImageRenderer_avatarImageRenderer;
  avatarImageRenderer_avatarImageRenderer = v4;
}

- (void)setDefaultSizeIfNecessary
{
  [(SearchUIImage *)self size];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [MEMORY[0x1E4FAE100] maxThumbnailSize];
    -[SearchUIAvatarImage setSize:](self, "setSize:", v6, v6);
  }
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  char v9 = [MEMORY[0x1E4FAE100] isLTR] ^ 1;
  [(SearchUIImage *)self size];
  v11 = v10;
  v13 = v12;
  objc_super v14 = [(SearchUIAvatarImage *)self letters];
  v15 = [(SearchUIAvatarImage *)self contactIdentifiers];
  BOOL v16 = [(SearchUIAvatarImage *)self requiresImageDataToLoad];
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
  v20[3] = &unk_1E6E72F58;
  v24[1] = v11;
  v24[2] = v13;
  v24[3] = *(id *)&a3;
  char v25 = v9;
  BOOL v26 = a4;
  id v17 = v14;
  id v21 = v17;
  objc_copyWeak(v24, &location);
  id v18 = v8;
  id v23 = v18;
  id v19 = v15;
  id v22 = v19;
  BOOL v27 = v16;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v20];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

void __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", *(unsigned __int8 *)(a1 + 88), 0, *(unsigned __int8 *)(a1 + 89), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if ([*(id *)(a1 + 32) length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    double v4 = [(id)objc_opt_class() avatarImageRenderer];
    uint64_t v5 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6E72D58;
    id v14 = *(id *)(a1 + 48);
    double v6 = [v4 renderMonogramForString:v5 scope:v2 imageHandler:v13];
    [WeakRetained setRenderingToken:v6];
  }
  else
  {
    v7 = +[SearchUIContactCache sharedCache];
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3;
    v9[3] = &unk_1E6E72F30;
    char v12 = *(unsigned char *)(a1 + 90);
    id v10 = v2;
    id v11 = *(id *)(a1 + 48);
    [v7 fetchContactsForIdentifiers:v8 completionHandler:v9];

    id WeakRetained = v10;
  }
}

uint64_t __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__SearchUIAvatarImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(unsigned char *)(a1 + 48)
    && (unint64_t)[v7 count] <= 1
    && ([v7 firstObject],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 imageDataAvailable],
        v3,
        !v4))
  {
    double v6 = 0;
  }
  else
  {
    uint64_t v5 = +[SearchUIAvatarImage avatarImageRenderer];
    double v6 = [v5 avatarImageForContacts:v7 scope:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)requiresImageDataToLoad
{
  return self->_requiresImageDataToLoad;
}

- (void)setRequiresImageDataToLoad:(BOOL)a3
{
  self->_requiresImageDataToLoad = a3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (NSString)letters
{
  return self->_letters;
}

- (void)setLetters:(id)a3
{
}

- (CNCancelable)renderingToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRenderingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingToken, 0);
  objc_storeStrong((id *)&self->_letters, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end