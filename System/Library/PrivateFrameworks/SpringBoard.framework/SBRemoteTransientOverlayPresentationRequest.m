@interface SBRemoteTransientOverlayPresentationRequest
- (BOOL)isAnimated;
- (BOOL)isSceneBacked;
- (BOOL)isScreenshotMarkup;
- (BOOL)shouldDismissPresentedBanners;
- (BOOL)shouldDismissSiri;
- (BOOL)shouldPresentEmbeddedInTargetScene;
- (BOOL)shouldStashPictureInPictureIfNeeded;
- (SBRemoteTransientOverlayPresentationRequest)initWithViewController:(id)a3;
- (SBSRemoteAlertPresentationTarget)presentationTarget;
- (SBTransientOverlayViewController)viewController;
- (SBWindowScene)windowScene;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setIsSceneBacked:(BOOL)a3;
- (void)setIsScreenshotMarkup:(BOOL)a3;
- (void)setPresentationTarget:(id)a3;
- (void)setShouldDismissPresentedBanners:(BOOL)a3;
- (void)setShouldDismissSiri:(BOOL)a3;
- (void)setShouldPresentEmbeddedInTargetScene:(BOOL)a3;
- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBRemoteTransientOverlayPresentationRequest

- (SBRemoteTransientOverlayPresentationRequest)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayPresentationRequest;
  v6 = [(SBRemoteTransientOverlayPresentationRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    v6->_shouldDismissSiri = 1;
    v6->_shouldPresentEmbeddedInTargetScene = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithViewController:self->_viewController];
  uint64_t v5 = v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_animated;
    objc_storeStrong((id *)(v4 + 24), self->_presentationTarget);
    *(unsigned char *)(v5 + 10) = self->_shouldDismissSiri;
    *(unsigned char *)(v5 + 11) = self->_shouldDismissPresentedBanners;
    *(unsigned char *)(v5 + 12) = self->_shouldStashPictureInPictureIfNeeded;
    *(unsigned char *)(v5 + 13) = self->_shouldPresentEmbeddedInTargetScene;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 32), WeakRetained);
  }
  return (id)v5;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (BOOL)isScreenshotMarkup
{
  return self->_isScreenshotMarkup;
}

- (void)setIsScreenshotMarkup:(BOOL)a3
{
  self->_isScreenshotMarkup = a3;
}

- (BOOL)shouldDismissSiri
{
  return self->_shouldDismissSiri;
}

- (void)setShouldDismissSiri:(BOOL)a3
{
  self->_shouldDismissSiri = a3;
}

- (BOOL)shouldDismissPresentedBanners
{
  return self->_shouldDismissPresentedBanners;
}

- (void)setShouldDismissPresentedBanners:(BOOL)a3
{
  self->_shouldDismissPresentedBanners = a3;
}

- (BOOL)shouldStashPictureInPictureIfNeeded
{
  return self->_shouldStashPictureInPictureIfNeeded;
}

- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3
{
  self->_shouldStashPictureInPictureIfNeeded = a3;
}

- (BOOL)shouldPresentEmbeddedInTargetScene
{
  return self->_shouldPresentEmbeddedInTargetScene;
}

- (void)setShouldPresentEmbeddedInTargetScene:(BOOL)a3
{
  self->_shouldPresentEmbeddedInTargetScene = a3;
}

- (BOOL)isSceneBacked
{
  return self->_isSceneBacked;
}

- (void)setIsSceneBacked:(BOOL)a3
{
  self->_isSceneBacked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end