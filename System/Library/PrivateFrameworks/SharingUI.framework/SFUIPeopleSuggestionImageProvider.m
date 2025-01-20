@interface SFUIPeopleSuggestionImageProvider
- (BOOL)_fetchNoAppTransportImageForIdentifier:(id)a3;
- (CGSize)targetSize;
- (OS_dispatch_queue)placeholderImageQueue;
- (SFUIAvatarImageRenderer)imageRenderer;
- (SFUIPeopleSuggestionImageProvider)initWithTargetSize:(CGSize)a3 layoutDirection:(unint64_t)a4;
- (SFUIPeopleSuggestionImageProvider)initWithTargetSize:(CGSize)a3 layoutDirection:(unint64_t)a4 userInterfaceStyle:(int64_t)a5;
- (UIImage)placeholderImage;
- (UIImage)processedPlaceholderImage;
- (int)requestAvatarImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4;
- (int)requestTransportImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4;
- (int64_t)userInterfaceStyle;
- (unint64_t)layoutDirection;
- (void)_deliverIconImage:(id)a3 identifier:(id)a4 isUTI:(BOOL)a5 error:(id)a6;
- (void)_fetchAvatarImageForPeopleSuggestion:(id)a3;
- (void)_fetchTransportImageForPeopleSuggestion:(id)a3;
- (void)_processPlaceholderImage;
- (void)performImageRequest:(id)a3;
- (void)updateTargetSize:(CGSize)a3;
- (void)updateUserInterfaceStyle:(int64_t)a3;
@end

@implementation SFUIPeopleSuggestionImageProvider

- (SFUIPeopleSuggestionImageProvider)initWithTargetSize:(CGSize)a3 layoutDirection:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [MEMORY[0x263F82B60] mainScreen];
  v9 = [v8 traitCollection];
  v10 = -[SFUIPeopleSuggestionImageProvider initWithTargetSize:layoutDirection:userInterfaceStyle:](self, "initWithTargetSize:layoutDirection:userInterfaceStyle:", a4, [v9 userInterfaceStyle], width, height);

  return v10;
}

- (SFUIPeopleSuggestionImageProvider)initWithTargetSize:(CGSize)a3 layoutDirection:(unint64_t)a4 userInterfaceStyle:(int64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)SFUIPeopleSuggestionImageProvider;
  v9 = [(SFUIImageProvider *)&v20 init];
  v10 = v9;
  if (v9)
  {
    v9->_targetSize.CGFloat width = width;
    v9->_targetSize.CGFloat height = height;
    v9->_layoutDirection = a4;
    v9->_userInterfaceStyle = a5;
    uint64_t v11 = +[SFUIAvatarImageRenderer avatarImageRender];
    imageRenderer = v10->_imageRenderer;
    v10->_imageRenderer = (SFUIAvatarImageRenderer *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SharingUI.SFUIPeopleSuggestionImageProvider.placeholderImageQueue", v13);
    placeholderImageQueue = v10->_placeholderImageQueue;
    v10->_placeholderImageQueue = (OS_dispatch_queue *)v14;

    v16 = v10->_placeholderImageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__SFUIPeopleSuggestionImageProvider_initWithTargetSize_layoutDirection_userInterfaceStyle___block_invoke;
    block[3] = &unk_264471EE0;
    v19 = v10;
    dispatch_async(v16, block);
  }
  return v10;
}

uint64_t __91__SFUIPeopleSuggestionImageProvider_initWithTargetSize_layoutDirection_userInterfaceStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPlaceholderImage];
}

- (void)_processPlaceholderImage
{
  v3 = [(SFUIPeopleSuggestionImageProvider *)self placeholderImageQueue];
  dispatch_assert_queue_V2(v3);

  avatarImageScale();
  id v6 = [(SFUIPeopleSuggestionImageProvider *)self imageRenderer];
  [(SFUIPeopleSuggestionImageProvider *)self targetSize];
  objc_msgSend(v6, "placeholderImageForSize:scale:");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  processedPlaceholderImage = self->_processedPlaceholderImage;
  self->_processedPlaceholderImage = v4;
}

- (UIImage)placeholderImage
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  dispatch_queue_t v14 = 0;
  p_placeholderImage = &self->_placeholderImage;
  dispatch_queue_t v14 = self->_placeholderImage;
  v4 = (void *)v10[5];
  if (!v4)
  {
    v5 = [(SFUIPeopleSuggestionImageProvider *)self placeholderImageQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__SFUIPeopleSuggestionImageProvider_placeholderImage__block_invoke;
    v8[3] = &unk_264472D28;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);

    objc_storeStrong((id *)p_placeholderImage, (id)v10[5]);
    v4 = (void *)v10[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v9, 8);

  return (UIImage *)v6;
}

void __53__SFUIPeopleSuggestionImageProvider_placeholderImage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) processedPlaceholderImage];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int)requestAvatarImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v8 = people_ui_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:]();
  }

  uint64_t v9 = [v6 identifier];
  v10 = [(SFUIImageProvider *)self imageCache];
  uint64_t v11 = [v10 objectForKey:v9];

  if (v11)
  {
    v12 = people_ui_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:]();
    }

    if (v7) {
      (*((void (**)(id, void *, void, void))v7 + 2))(v7, v11, 0, 0);
    }
    LODWORD(v13) = 0;
  }
  else
  {
    if (v7)
    {
      dispatch_queue_t v14 = [(SFUIPeopleSuggestionImageProvider *)self placeholderImage];
      (*((void (**)(id, void *, uint64_t, void))v7 + 2))(v7, v14, 1, 0);
    }
    uint64_t v13 = [(SFUIImageProvider *)self nextRequestID];
    v15 = [[SFUIPeopleSuggestionImageRequest alloc] initWithRequestID:v13 peopleSuggestion:v6 type:0 resultHandler:v7];
    [(SFUIImageProvider *)self scheduleImageRequest:v15];
  }
  return v13;
}

- (int)requestTransportImageForPeopleSuggestion:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v8 = people_ui_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SFUIPeopleSuggestionImageProvider requestTransportImageForPeopleSuggestion:resultHandler:]();
  }

  uint64_t v9 = [v6 transportBundleIdentifier];
  v10 = [(SFUIImageProvider *)self imageCache];
  uint64_t v11 = [v10 objectForKey:v9];

  if (v11)
  {
    v12 = people_ui_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SFUIPeopleSuggestionImageProvider requestAvatarImageForPeopleSuggestion:resultHandler:]();
    }

    if (v7) {
      (*((void (**)(id, void *, void, void))v7 + 2))(v7, v11, 0, 0);
    }
    LODWORD(v13) = 0;
  }
  else
  {
    uint64_t v13 = [(SFUIImageProvider *)self nextRequestID];
    dispatch_queue_t v14 = [[SFUIPeopleSuggestionImageRequest alloc] initWithRequestID:v13 peopleSuggestion:v6 type:1 resultHandler:v7];
    [(SFUIImageProvider *)self scheduleImageRequest:v14];
  }
  return v13;
}

- (void)updateTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SFUIPeopleSuggestionImageProvider *)self targetSize];
  if (v7 != width || v6 != height)
  {
    self->_targetSize.double width = width;
    self->_targetSize.double height = height;
    id v9 = [(SFUIImageProvider *)self imageCache];
    [v9 removeAllObjects];
  }
}

- (void)updateUserInterfaceStyle:(int64_t)a3
{
  if ([(SFUIPeopleSuggestionImageProvider *)self userInterfaceStyle] != a3)
  {
    self->_userInterfaceStyle = a3;
    id v5 = [(SFUIImageProvider *)self imageCache];
    [v5 removeAllObjects];
  }
}

- (void)performImageRequest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SFUIPeopleSuggestionImageProvider.m" lineNumber:211 description:@"request is not a SFUIPeopleSuggestionImageRequest type."];
  }
  id v9 = v5;
  double v6 = [v9 peopleSuggestion];
  uint64_t v7 = [v9 type];
  if (v7 == 1)
  {
    [(SFUIPeopleSuggestionImageProvider *)self _fetchTransportImageForPeopleSuggestion:v6];
  }
  else if (!v7)
  {
    [(SFUIPeopleSuggestionImageProvider *)self _fetchAvatarImageForPeopleSuggestion:v6];
  }
}

- (void)_fetchAvatarImageForPeopleSuggestion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  id v5 = [v4 donatedImage];

  if (v5)
  {
    double v6 = [v4 donatedImage];
    uint64_t v7 = sharing_ui_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:]();
    }

    uint64_t v8 = [v6 _imageData];
    if (!v8)
    {
      v15 = [getINImageServiceConnectionClass() sharedConnection];
      id v33 = 0;
      uint64_t v11 = [v15 loadDataImageFromImage:v6 scaledSize:&v33 error:getINImageDefaultScaledSize()];
      id v10 = v33;

      if (v10)
      {
        v16 = people_ui_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:]();
        }

        id v9 = 0;
        goto LABEL_12;
      }
      uint64_t v8 = [v11 _imageData];

      if (!v8)
      {
        id v10 = 0;
        id v9 = 0;
        goto LABEL_13;
      }
    }
    id v9 = [MEMORY[0x263F827E8] imageWithData:v8];
    id v10 = 0;
    uint64_t v11 = (void *)v8;
LABEL_12:

LABEL_13:
    goto LABEL_18;
  }
  v12 = [v4 deviceModelIdentifier];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    dispatch_queue_t v14 = [v4 deviceModelIdentifier];
    id v9 = SFDeviceImageFromDeviceModel(60.0, 60.0);
  }
  else
  {
    v17 = people_ui_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SFUIPeopleSuggestionImageProvider _fetchAvatarImageForPeopleSuggestion:]();
    }

    BOOL v18 = [(SFUIPeopleSuggestionImageProvider *)self layoutDirection] == 1;
    v19 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v20 = 4 * ([v19 userInterfaceIdiom] == 4);

    avatarImageScale();
    [(SFUIPeopleSuggestionImageProvider *)self targetSize];
    dispatch_queue_t v14 = +[SFUIAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:](SFUIAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", v18, 1, v20);
    v21 = [(SFUIPeopleSuggestionImageProvider *)self imageRenderer];
    v22 = [v4 contacts];
    id v9 = [v21 avatarImageForContacts:v22 scope:v14];
  }
  id v10 = 0;
LABEL_18:
  id location = 0;
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__SFUIPeopleSuggestionImageProvider__fetchAvatarImageForPeopleSuggestion___block_invoke;
  v27[3] = &unk_264472D50;
  objc_copyWeak(&v31, &location);
  id v28 = v9;
  id v29 = v4;
  id v30 = v10;
  id v23 = v10;
  id v24 = v4;
  id v25 = v9;
  v26 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __74__SFUIPeopleSuggestionImageProvider__fetchAvatarImageForPeopleSuggestion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [WeakRetained deliverImage:v2 identifier:v3 placeholder:0 error:*(void *)(a1 + 48)];
}

- (void)_fetchTransportImageForPeopleSuggestion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  double v6 = [v5 transportBundleIdentifier];

  if ([(SFUIPeopleSuggestionImageProvider *)self _fetchNoAppTransportImageForIdentifier:v6])
  {
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  int v8 = [(__CFString *)v7 hasPrefix:@"com.apple.InCallService"];
  if (v8)
  {
    id v9 = @"com.apple.facetime";
    id v10 = v7;
  }
  else
  {
    if (![(__CFString *)v7 isEqualToString:*MEMORY[0x263F6BCD8]])
    {
      uint64_t v11 = 0;
      id v9 = v7;
      goto LABEL_8;
    }
    id v10 = (__CFString *)objc_alloc_init(MEMORY[0x263F6BCA0]);
    id v9 = [(__CFString *)v10 _activityImageUTI];
  }
  uint64_t v11 = v8 ^ 1u;

LABEL_8:
  v12 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B578]];
  uint64_t v13 = +[SFUIActivityImageProvider tintImageDescriptor:v12 withUserInterfaceStyle:[(SFUIPeopleSuggestionImageProvider *)self userInterfaceStyle] forGraphicIcon:v11];

  id v14 = objc_alloc(MEMORY[0x263F4B540]);
  if (v11) {
    uint64_t v15 = [v14 initWithType:v9];
  }
  else {
    uint64_t v15 = [v14 initWithBundleIdentifier:v9];
  }
  v16 = (void *)v15;
  v17 = people_ui_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v21 = @"NO";
    *(_DWORD *)id v23 = 138412802;
    *(void *)&v23[4] = v13;
    *(_WORD *)&v23[12] = 2112;
    if (v11) {
      v21 = @"YES";
    }
    *(void *)&v23[14] = v9;
    __int16 v24 = 2112;
    id v25 = v21;
    _os_log_debug_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEBUG, "fetching fast image with descriptor:%@ identifier:%@ isUTI:%@", v23, 0x20u);
  }

  BOOL v18 = [v16 imageForDescriptor:v13];
  if (v18
    && (-[SFUIPeopleSuggestionImageProvider _deliverIconImage:identifier:isUTI:error:](self, "_deliverIconImage:identifier:isUTI:error:", v18, v7, v11, 0), ![v18 placeholder]))
  {
    uint64_t v20 = v18;
  }
  else
  {
    v19 = people_ui_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[SFUIPeopleSuggestionImageProvider _fetchTransportImageForPeopleSuggestion:]();
    }

    uint64_t v20 = [v16 prepareImageForDescriptor:v13];

    if ([v20 placeholder])
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"SFUIPeopleSuggestionImageProvider.m" lineNumber:331 description:@"final icon image is still a placeholder."];
    }
    -[SFUIPeopleSuggestionImageProvider _deliverIconImage:identifier:isUTI:error:](self, "_deliverIconImage:identifier:isUTI:error:", v20, v7, v11, 0, *(_OWORD *)v23);
  }

LABEL_21:
}

- (BOOL)_fetchNoAppTransportImageForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.telephonyutilities.callservicesd"])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F6BCB8]);
    objc_msgSend(v5, "setUserInterfaceStyle:", -[SFUIPeopleSuggestionImageProvider userInterfaceStyle](self, "userInterfaceStyle"));
    double v6 = [v5 activityImage];
  }
  else
  {
    double v6 = 0;
  }
  uint64_t v7 = +[SFUIActivityImageProvider tintImage:v6 withDescriptorName:*MEMORY[0x263F4B578] userInterfaceStyle:[(SFUIPeopleSuggestionImageProvider *)self userInterfaceStyle]];

  if (v7)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __76__SFUIPeopleSuggestionImageProvider__fetchNoAppTransportImageForIdentifier___block_invoke;
    v9[3] = &unk_264472BA8;
    objc_copyWeak(&v12, &location);
    id v10 = v7;
    id v11 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7 != 0;
}

void __76__SFUIPeopleSuggestionImageProvider__fetchNoAppTransportImageForIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deliverImage:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) placeholder:0 error:0];
}

- (void)_deliverIconImage:(id)a3 identifier:(id)a4 isUTI:(BOOL)a5 error:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F827E8];
  uint64_t v11 = [v8 CGImage];
  [v8 scale];
  id v12 = objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v11, 0);
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SFUIPeopleSuggestionImageProvider__deliverIconImage_identifier_isUTI_error___block_invoke;
  block[3] = &unk_264472D50;
  objc_copyWeak(&v20, &location);
  id v17 = v12;
  id v18 = v9;
  id v19 = v8;
  id v13 = v8;
  id v14 = v9;
  id v15 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __78__SFUIPeopleSuggestionImageProvider__deliverIconImage_identifier_isUTI_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "deliverImage:identifier:placeholder:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "placeholder"), 0);
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (SFUIAvatarImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (OS_dispatch_queue)placeholderImageQueue
{
  return self->_placeholderImageQueue;
}

- (UIImage)processedPlaceholderImage
{
  return self->_processedPlaceholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderImageQueue, 0);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
}

- (void)requestAvatarImageForPeopleSuggestion:resultHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "cached image found for people suggestion:%@", v2, v3, v4, v5, v6);
}

- (void)requestAvatarImageForPeopleSuggestion:resultHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "request avatar image for people suggestion:%@", v2, v3, v4, v5, v6);
}

- (void)requestTransportImageForPeopleSuggestion:resultHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "request transport image for people suggestion:%@", v2, v3, v4, v5, v6);
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "rendering avatar image for people suggestion:%@", v2, v3, v4, v5, v6);
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, v0, OS_LOG_TYPE_ERROR, "Could not fetch donated image: %@", v1, 0xCu);
}

- (void)_fetchAvatarImageForPeopleSuggestion:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "fetching donated image for people suggestion:%@", v2, v3, v4, v5, v6);
}

- (void)_fetchTransportImageForPeopleSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_21DB23000, v0, v1, "fetching final image with descriptor:%@", v2, v3, v4, v5, v6);
}

@end