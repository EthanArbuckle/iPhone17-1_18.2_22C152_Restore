@interface _UIShareServiceActivityProxy
+ (id)activityProxyForServiceActivityDataRequest:(id)a3;
+ (void)forwardInvocation:(id)a3;
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_isExecutedInProcess;
- (BOOL)_managesOwnPresentation;
- (BOOL)_needsResolvedActivityItems;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_wantsAttachmentURLItemData;
- (BOOL)_wantsInitialSocialText;
- (BOOL)_wantsThumbnailItemData;
- (BOOL)allowsEmbedding;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (CGSize)_thumbnailSize;
- (_UIShareServiceActivityProxy)initWithUnderlyingActivityItemDataRequest:(id)a3;
- (id)_embeddedActivityViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityUUID;
- (id)activityViewController;
- (id)didFinishPerformingActivityHandler;
- (id)didFinishPreparingForExecution;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)activityDidFinish:(BOOL)a3;
- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)setDidFinishPerformingActivityHandler:(id)a3;
- (void)setDidFinishPreparingForExecution:(id)a3;
@end

@implementation _UIShareServiceActivityProxy

+ (id)activityProxyForServiceActivityDataRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 activityCategory];
  if (!v4)
  {
    v5 = off_1E5A211D8;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = &off_1E5A211E0;
LABEL_5:
    v6 = (void *)[objc_alloc(*v5) initWithUnderlyingActivityItemDataRequest:v3];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (_UIShareServiceActivityProxy)initWithUnderlyingActivityItemDataRequest:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIShareServiceActivityProxy;
  v6 = [(_UIShareServiceActivityProxy *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 activityUUID];
    activityUUID = v6->_activityUUID;
    v6->_activityUUID = (NSUUID *)v7;

    uint64_t v9 = [v5 activityType];
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_underlyingActivityItemDataRequest, a3);
    [v5 isAirDropActivity];
    v6->_remoteClass = (Class)objc_opt_class();
    [v5 thumbnailSize];
    v6->_thumbnailSize.width = v11;
    v6->_thumbnailSize.height = v12;
  }

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIShareServiceActivityProxy;
  if (-[_UIShareServiceActivityProxy isKindOfClass:](&v6, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)self->_remoteClass isSubclassOfClass:a3];
  }
}

- (BOOL)_isExecutedInProcess
{
  return 0;
}

- (id)activityUUID
{
  return self->_activityUUID;
}

- (id)activityType
{
  return self->_activityType;
}

+ (void)forwardInvocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = (const char *)[v3 selector];

  objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3A8];
  NSStringFromSelector(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v6 raise:v7, @"Attempt to invoke +%@ on %@, which is not supported for proxies to out-of-process activities.", v8, v4 format];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIShareServiceActivityProxy;
  id v5 = -[_UIShareServiceActivityProxy methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5) {
    _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(self, a3);
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v4 = (const char *)[a3 selector];
  _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(self, v4);
}

- (BOOL)_wantsThumbnailItemData
{
  return [(UISUIActivityExtensionItemDataRequest *)self->_underlyingActivityItemDataRequest wantsThumbnailItemData];
}

- (BOOL)_wantsAttachmentURLItemData
{
  return [(UISUIActivityExtensionItemDataRequest *)self->_underlyingActivityItemDataRequest wantsAttachmentURLItemData];
}

- (BOOL)_wantsInitialSocialText
{
  return 0;
}

- (BOOL)allowsEmbedding
{
  return 0;
}

- (id)activityTitle
{
  return 0;
}

- (id)activityImage
{
  return 0;
}

- (id)activityViewController
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(void))a4;
  [(_UIShareServiceActivityProxy *)self prepareWithActivityItems:a3];
  v6[2]();
}

- (void)activityDidFinish:(BOOL)a3
{
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v12 = a4;
  id v8 = a5;
  if (self->_representationCacheURL)
  {
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 removeItemAtURL:self->_representationCacheURL error:0];
  }
  v10 = (void (**)(void, void, void, void))MEMORY[0x1A6229A90](self->_didFinishPerformingActivityHandler);
  id didFinishPerformingActivityHandler = self->_didFinishPerformingActivityHandler;
  self->_id didFinishPerformingActivityHandler = 0;

  if (v10) {
    ((void (**)(void, BOOL, id, id))v10)[2](v10, v6, v12, v8);
  }
}

- (id)_embeddedActivityViewController
{
  return 0;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  didFinishPreparingForExecution = (void (**)(id, SEL, id, BOOL, id))self->_didFinishPreparingForExecution;
  if (didFinishPreparingForExecution) {
    didFinishPreparingForExecution[2](didFinishPreparingForExecution, a2, a3, a4, a5);
  }
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_needsResolvedActivityItems
{
  return 1;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 1;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return [(UISUIActivityExtensionItemDataRequest *)self->_underlyingActivityItemDataRequest activitySupportsPromiseURLs];
}

- (CGSize)_thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  representationCacheURL = self->_representationCacheURL;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79___UIShareServiceActivityProxy__loadItemProvidersFromActivityItems_completion___block_invoke;
  v9[3] = &unk_1E5A23020;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  +[UIActivity _loadItemProvidersFromActivityItems:a3 withCacheURL:representationCacheURL completion:v9];
}

- (id)didFinishPreparingForExecution
{
  return self->_didFinishPreparingForExecution;
}

- (void)setDidFinishPreparingForExecution:(id)a3
{
}

- (id)didFinishPerformingActivityHandler
{
  return self->_didFinishPerformingActivityHandler;
}

- (void)setDidFinishPerformingActivityHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishPerformingActivityHandler, 0);
  objc_storeStrong(&self->_didFinishPreparingForExecution, 0);
  objc_storeStrong((id *)&self->_representationCacheURL, 0);
  objc_storeStrong((id *)&self->_underlyingActivityItemDataRequest, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end