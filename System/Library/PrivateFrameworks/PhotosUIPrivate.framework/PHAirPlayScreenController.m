@interface PHAirPlayScreenController
+ (PHAirPlayScreenController)sharedInstance;
- (AVOutputContext)outputContext;
- (BOOL)_shouldHideRoutesForExternalDisplay;
- (BOOL)_shouldIgnoreScreen:(id)a3;
- (BOOL)_shouldUpdateSecondDisplayModeWithCurrentContent;
- (BOOL)isContentProviderRegistered:(id)a3;
- (BOOL)isDisplayingContent;
- (BOOL)pu_hasAvailableRoute;
- (NSDate)_lastScreenRequestDate;
- (NSString)debugDescription;
- (PHAirPlayScreenController)init;
- (PUAirPlayContentRegistry)_contentRegistry;
- (PUAirPlayRootViewController)_rootViewController;
- (PUAirPlayRouteObserverRegistry)_routeObserverRegistry;
- (PUAirPlayScreen)_currentScreen;
- (PUAirPlayScreenDetector)_screenDetector;
- (UIViewController)_lastDisplayedContent;
- (id)_currentContent;
- (id)_findAvailableScreen;
- (id)_screenAvailabilityName;
- (id)secondDisplayModeToken;
- (int64_t)_lastScreenRequestOrigin;
- (int64_t)airPlaySessionSignpost;
- (int64_t)routeUnavailableReason;
- (unint64_t)routeAvailability;
- (unint64_t)screenAvailability;
- (void)_cacheDisplayedContentIfNeededForUnregisteringProvider:(id)a3;
- (void)_handleSettingHighResolutionContent:(BOOL)a3 forRootController:(id)a4 content:(id)a5;
- (void)_notifyWillRequestAirPlayScreenFromSource:(int64_t)a3;
- (void)_outputDeviceDidChange:(id)a3;
- (void)_recordSessionBeganWithScreen:(id)a3;
- (void)_recordSessionEnded;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_setContentRegistry:(id)a3;
- (void)_setCurrentScreen:(id)a3;
- (void)_setLastDisplayedContent:(id)a3;
- (void)_setLastScreenRequestDate:(id)a3;
- (void)_setLastScreenRequestOrigin:(int64_t)a3;
- (void)_setRootViewController:(id)a3;
- (void)_setRouteObserverRegistry:(id)a3;
- (void)_setScreenDetector:(id)a3;
- (void)_switchModeForHighResolutionContent:(BOOL)a3 completionHandler:(id)a4;
- (void)_updateScreenContentWithShouldTryToFindAvailableScreen:(BOOL)a3;
- (void)_updateSecondDisplayModeWithCurrentContent;
- (void)airPlayRouteObserverRegistryRouteAvailabilityChanged:(id)a3 forRouteObserver:(id)a4;
- (void)notifyDidPresentAirPlayRoutesFromShareSheet;
- (void)notifyDidPresentAirPlayRoutesFromSlideshow;
- (void)registerContentProvider:(id)a3;
- (void)registerRouteObserver:(id)a3;
- (void)screenDetector:(id)a3 didDetectScreen:(id)a4;
- (void)screenDetector:(id)a3 didLoseScreen:(id)a4;
- (void)setAirPlaySessionSignpost:(int64_t)a3;
- (void)setOutputContext:(id)a3;
- (void)setSecondDisplayModeToken:(id)a3;
- (void)unregisterContentProvider:(id)a3;
- (void)unregisterRouteObserver:(id)a3;
@end

@implementation PHAirPlayScreenController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong(&self->_secondDisplayModeToken, 0);
  objc_storeStrong((id *)&self->__lastScreenRequestDate, 0);
  objc_storeStrong((id *)&self->__lastDisplayedContent, 0);
  objc_storeStrong((id *)&self->__routeObserverRegistry, 0);
  objc_storeStrong((id *)&self->__contentRegistry, 0);
  objc_storeStrong((id *)&self->__rootViewController, 0);
  objc_storeStrong((id *)&self->__screenDetector, 0);
  objc_storeStrong((id *)&self->__currentScreen, 0);
}

- (void)setOutputContext:(id)a3
{
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setSecondDisplayModeToken:(id)a3
{
}

- (id)secondDisplayModeToken
{
  return self->_secondDisplayModeToken;
}

- (void)setAirPlaySessionSignpost:(int64_t)a3
{
  self->_airPlaySessionSignpost = a3;
}

- (int64_t)airPlaySessionSignpost
{
  return self->_airPlaySessionSignpost;
}

- (void)_setLastScreenRequestOrigin:(int64_t)a3
{
  self->__lastScreenRequestOrigin = a3;
}

- (int64_t)_lastScreenRequestOrigin
{
  return self->__lastScreenRequestOrigin;
}

- (void)_setLastScreenRequestDate:(id)a3
{
}

- (NSDate)_lastScreenRequestDate
{
  return self->__lastScreenRequestDate;
}

- (void)_setLastDisplayedContent:(id)a3
{
}

- (UIViewController)_lastDisplayedContent
{
  return self->__lastDisplayedContent;
}

- (void)_setRouteObserverRegistry:(id)a3
{
}

- (PUAirPlayRouteObserverRegistry)_routeObserverRegistry
{
  return self->__routeObserverRegistry;
}

- (void)_setContentRegistry:(id)a3
{
}

- (PUAirPlayContentRegistry)_contentRegistry
{
  return self->__contentRegistry;
}

- (void)_setRootViewController:(id)a3
{
}

- (PUAirPlayRootViewController)_rootViewController
{
  return self->__rootViewController;
}

- (void)_setScreenDetector:(id)a3
{
}

- (PUAirPlayScreenDetector)_screenDetector
{
  return self->__screenDetector;
}

- (void)_setCurrentScreen:(id)a3
{
}

- (PUAirPlayScreen)_currentScreen
{
  return self->__currentScreen;
}

- (NSString)debugDescription
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(PHAirPlayScreenController *)self description];
  v5 = [v3 stringWithString:v4];

  v6 = [(PHAirPlayScreenController *)self _screenAvailabilityName];
  [v5 appendFormat:@"\n\tScreen availability: %@", v6];

  BOOL v7 = [(PHAirPlayScreenController *)self isDisplayingContent];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  [v5 appendFormat:@"\n\tDisplaying content: %@", v8];
  v9 = [(PHAirPlayScreenController *)self _currentScreen];
  v10 = [(PHAirPlayScreenController *)self _screenDetector];
  v11 = [v10 availableScreens];

  v12 = [(PHAirPlayScreenController *)self _rootViewController];
  v13 = [(PHAirPlayScreenController *)self _currentContent];
  v14 = [(PHAirPlayScreenController *)self _contentRegistry];
  v32 = [v14 currentContentProvider];

  v31 = +[PUAirPlaySettings sharedInstance];
  [v5 appendString:@"\n\nScreens"];
  v15 = [v9 debugDescription];
  [v5 appendFormat:@"\nCurrent screen: %@", v15];

  [v5 appendFormat:@"\nOther screens:"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        if (*(void **)(*((void *)&v33 + 1) + 8 * i) != v9) {
          [v5 appendFormat:@"\n\t%@", *(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  [v5 appendString:@"\n\nRoot view controller"];
  [v5 appendFormat:@"\n\tSystem: %@", v12];
  v21 = [v9 rootViewController];
  [v5 appendFormat:@"\n\tScreen root: %@", v21];

  v22 = [v9 rootViewController];
  if (v12 == v22) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  [v5 appendFormat:@"\n\tScreen and system roots match: %@", v23];

  [v5 appendString:@"\n\nContent"];
  [v5 appendFormat:@"\n\tCached: %@", v13];
  [v5 appendFormat:@"\n\tProvider: %@", v32];
  v24 = [v12 childViewController];
  [v5 appendFormat:@"\n\tRoot content: %@", v24];

  v25 = [v12 childViewController];
  if (v13 == v25) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  [v5 appendFormat:@"\n\tCached and root contents match: %@", v26];

  v27 = [v32 contentViewControllerForAirPlayController:self];
  if (v13 == v27) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  [v5 appendFormat:@"\n\tCached and provider contents match: %@", v28];

  v29 = [v31 debugDescription];
  [v5 appendFormat:@"\n\nSettings: %@", v29];

  return (NSString *)v5;
}

- (id)_screenAvailabilityName
{
  unint64_t v2 = [(PHAirPlayScreenController *)self screenAvailability];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1E5F22268[v2];
  }
}

- (void)_sceneDidActivate:(id)a3
{
  id v7 = [a3 object];
  v4 = [v7 session];
  v5 = [v4 role];
  if ([v5 isEqualToString:*MEMORY[0x1E4FB3130]])
  {
    BOOL v6 = [(PHAirPlayScreenController *)self _shouldUpdateSecondDisplayModeWithCurrentContent];

    if (!v6) {
      goto LABEL_6;
    }
    v4 = [(PHAirPlayScreenController *)self _currentContent];
    [(PHAirPlayScreenController *)self _switchModeForHighResolutionContent:v4 != 0 completionHandler:0];
  }
  else
  {
  }
LABEL_6:
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v7 = [a3 object];
  v4 = [v7 session];
  v5 = [v4 role];
  if ([v5 isEqualToString:*MEMORY[0x1E4FB3130]])
  {
    BOOL v6 = [(PHAirPlayScreenController *)self _shouldUpdateSecondDisplayModeWithCurrentContent];

    if (v6) {
      [(PHAirPlayScreenController *)self _switchModeForHighResolutionContent:0 completionHandler:0];
    }
  }
  else
  {
  }
}

- (void)_outputDeviceDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = PLAirPlayGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PHAirPlayScreenController *)self outputContext];
    BOOL v6 = [v5 outputDevice];
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "AVOutputDevice did change: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PHAirPlayScreenController__outputDeviceDidChange___block_invoke;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __52__PHAirPlayScreenController__outputDeviceDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSecondDisplayModeWithCurrentContent];
}

- (void)_recordSessionEnded
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PHAirPlayScreenController *)self _lastScreenRequestOrigin];
  id v4 = [NSString alloc];
  if (v3 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E5F22250[v3];
  }
  BOOL v6 = (void *)[v4 initWithFormat:@"com.apple.photos.CPAnalytics.airPlayedFrom%@", v5];
  id v7 = (void *)MEMORY[0x1E4F56658];
  int64_t v8 = [(PHAirPlayScreenController *)self airPlaySessionSignpost];
  uint64_t v9 = *MEMORY[0x1E4F56440];
  uint64_t v11 = *MEMORY[0x1E4F56580];
  v12[0] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v7 endSignpost:v8 forEventName:v9 withPayload:v10];

  [(PHAirPlayScreenController *)self setAirPlaySessionSignpost:0];
}

- (void)_recordSessionBeganWithScreen:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [(PHAirPlayScreenController *)self _lastScreenRequestDate];
  if (!v6 || [v4 type] == 2 || (objc_msgSend(v5, "timeIntervalSinceDate:", v6), v7 >= 30.0)) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = [(PHAirPlayScreenController *)self _lastScreenRequestOrigin];
  }
  [(PHAirPlayScreenController *)self _setLastScreenRequestDate:0];
  [(PHAirPlayScreenController *)self _setLastScreenRequestOrigin:v8];
  if ([(PHAirPlayScreenController *)self airPlaySessionSignpost])
  {
    uint64_t v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "AirPlay session started twice", v10, 2u);
    }
  }
  -[PHAirPlayScreenController setAirPlaySessionSignpost:](self, "setAirPlaySessionSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
}

- (void)_notifyWillRequestAirPlayScreenFromSource:(int64_t)a3
{
  if (![(PHAirPlayScreenController *)self screenAvailability])
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [(PHAirPlayScreenController *)self _setLastScreenRequestDate:v5];
    [(PHAirPlayScreenController *)self _setLastScreenRequestOrigin:a3];
  }
}

- (void)notifyDidPresentAirPlayRoutesFromSlideshow
{
}

- (void)notifyDidPresentAirPlayRoutesFromShareSheet
{
}

- (void)screenDetector:(id)a3 didLoseScreen:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = PLAirPlayGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "AirPlay screen disappeared: %@", (uint8_t *)&v16, 0xCu);
  }

  id v7 = [(PHAirPlayScreenController *)self _currentScreen];

  if (v7 == v5)
  {
    [(PHAirPlayScreenController *)self _setCurrentScreen:0];
    [(PHAirPlayScreenController *)self _setLastDisplayedContent:0];
    [(PHAirPlayScreenController *)self _updateScreenContentWithShouldTryToFindAvailableScreen:0];
    v10 = +[PUAirPlaySettings sharedInstance];
    int v11 = [v10 switchToMediaPresentationMode];

    if (v11)
    {
      v12 = PLAirPlayGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(PHAirPlayScreenController *)self secondDisplayModeToken];
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "\tReleasing second display mode token %@", (uint8_t *)&v16, 0xCu);
      }
      [(PHAirPlayScreenController *)self setSecondDisplayModeToken:0];
    }
    [(PHAirPlayScreenController *)self _updateSecondDisplayModeWithCurrentContent];
    [(PHAirPlayScreenController *)self _recordSessionEnded];
    v14 = [(PHAirPlayScreenController *)self _contentRegistry];
    int64_t v8 = [v14 currentContentProvider];

    if (objc_opt_respondsToSelector()) {
      [v8 airPlayControllerScreenAvailabilityChanged:self];
    }
    v15 = [(PHAirPlayScreenController *)self _contentRegistry];
    [v15 clearContent];

    [(PHAirPlayScreenController *)self _setLastDisplayedContent:0];
  }
  else
  {
    int64_t v8 = PLAirPlayGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PHAirPlayScreenController *)self _currentScreen];
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "\tIgnoring disconnected screen, doesn't match current screen %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)screenDetector:(id)a3 didDetectScreen:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = PLAirPlayGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Detected new AirPlay screen to use: %@", (uint8_t *)&v15, 0xCu);
  }

  id v7 = [(PHAirPlayScreenController *)self _currentScreen];
  int64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 isValid];
    v10 = PLAirPlayGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = [(PHAirPlayScreenController *)self _currentScreen];
        int v15 = 138412290;
        id v16 = v12;
        v13 = "\tIgnoring connected screen, using current screen %@";
LABEL_13:
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if (v11)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "\tCurrent screen connected but is invalid, replacing with the new screen", (uint8_t *)&v15, 2u);
    }
  }
  if ([(PHAirPlayScreenController *)self _shouldIgnoreScreen:v5])
  {
    v10 = PLAirPlayGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(PHAirPlayScreenController *)self _currentScreen];
      int v15 = 138412290;
      id v16 = v12;
      v13 = "\tIgnoring screen: %@";
      goto LABEL_13;
    }
  }
  else
  {
    [(PHAirPlayScreenController *)self _recordSessionBeganWithScreen:v5];
    [(PHAirPlayScreenController *)self _setCurrentScreen:v5];
    [(PHAirPlayScreenController *)self _updateScreenContentWithShouldTryToFindAvailableScreen:1];
    [(PHAirPlayScreenController *)self _updateSecondDisplayModeWithCurrentContent];
    v14 = [(PHAirPlayScreenController *)self _contentRegistry];
    v10 = [v14 currentContentProvider];

    if (objc_opt_respondsToSelector()) {
      [v10 airPlayControllerScreenAvailabilityChanged:self];
    }
  }
LABEL_16:
}

- (BOOL)_shouldHideRoutesForExternalDisplay
{
  char HasSceneOnExternalDisplay = PXApplicationHasSceneOnExternalDisplay();
  return HasSceneOnExternalDisplay & ![(PHAirPlayScreenController *)self isDisplayingContent];
}

- (int64_t)routeUnavailableReason
{
  if ([(PHAirPlayScreenController *)self routeAvailability] != 2) {
    return 0;
  }
  if ([(PHAirPlayScreenController *)self _shouldHideRoutesForExternalDisplay]) {
    return 2;
  }
  return 1;
}

- (unint64_t)routeAvailability
{
  unint64_t v3 = [(PHAirPlayScreenController *)self _routeObserverRegistry];
  unint64_t v4 = [v3 routeAvailability];

  if ([(PHAirPlayScreenController *)self _shouldHideRoutesForExternalDisplay]) {
    return 2;
  }
  else {
    return v4;
  }
}

- (void)airPlayRouteObserverRegistryRouteAvailabilityChanged:(id)a3 forRouteObserver:(id)a4
{
}

- (void)unregisterRouteObserver:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Unregistering route observer: %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = [(PHAirPlayScreenController *)self _routeObserverRegistry];
  [v6 removeRouteObserver:v4];
}

- (void)registerRouteObserver:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Registering route observer: %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = [(PHAirPlayScreenController *)self _routeObserverRegistry];
  [v6 addRouteObserver:v4];
}

- (BOOL)isContentProviderRegistered:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAirPlayScreenController *)self _contentRegistry];
  char v6 = [v5 isContentProviderRegistered:v4];

  return v6;
}

- (void)unregisterContentProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Unregistering content provider: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PHAirPlayScreenController *)self _cacheDisplayedContentIfNeededForUnregisteringProvider:v4];
  char v6 = [(PHAirPlayScreenController *)self _contentRegistry];
  [v6 removeContentProvider:v4];

  [(PHAirPlayScreenController *)self _updateScreenContentWithShouldTryToFindAvailableScreen:0];
  [(PHAirPlayScreenController *)self _updateSecondDisplayModeWithCurrentContent];
}

- (void)registerContentProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Registering content provider: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PHAirPlayScreenController *)self _setLastDisplayedContent:0];
  char v6 = [(PHAirPlayScreenController *)self _contentRegistry];
  [v6 addContentProvider:v4];

  [(PHAirPlayScreenController *)self _updateScreenContentWithShouldTryToFindAvailableScreen:1];
  [(PHAirPlayScreenController *)self _updateSecondDisplayModeWithCurrentContent];
}

- (BOOL)_shouldIgnoreScreen:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PUAirPlaySettings sharedInstance];
  if ([v3 type] != 2) {
    goto LABEL_11;
  }
  if ([v4 ignoreMirroredScreens])
  {
    id v5 = PLAirPlayGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      char v6 = "Ignoring mirrored screen per AirPlay settings: %@";
LABEL_9:
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (![v4 ignoreScreenRecordingScreens]) {
    goto LABEL_11;
  }
  [v3 size];
  PXSizeGetAspectRatio();
  int v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  PXSizeGetAspectRatio();
  int v8 = PXFloatEqualToFloatWithTolerance();

  if (!v8)
  {
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  id v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    char v6 = "Ignoring screen recording screen per AirPlay settings: %@";
    goto LABEL_9;
  }
LABEL_10:

  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (id)_findAvailableScreen
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHAirPlayScreenController *)self _screenDetector];
  id v4 = [v3 availableScreens];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!-[PHAirPlayScreenController _shouldIgnoreScreen:](self, "_shouldIgnoreScreen:", v11, (void)v14))
        {
          id v12 = v11;

          int v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)_handleSettingHighResolutionContent:(BOOL)a3 forRootController:(id)a4 content:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = PLAirPlayGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Set up content for presentation with root controller %@, content %@", (uint8_t *)&v14, 0x16u);
  }

  [(PHAirPlayScreenController *)self _updateScreenContentWithShouldTryToFindAvailableScreen:1];
  int v11 = [(PHAirPlayScreenController *)self _currentScreen];
  id v12 = v11;
  if (v6) {
    id v13 = v8;
  }
  else {
    id v13 = 0;
  }
  [v11 setRootViewController:v13];

  [v8 setChildViewController:v9 animated:0];
}

- (void)_switchModeForHighResolutionContent:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(void))a4;
  uint64_t v7 = [(PHAirPlayScreenController *)self outputContext];
  id v8 = [v7 outputDevice];

  if (v8)
  {
    id v9 = (id *)MEMORY[0x1E4F15F70];
    if (!v4) {
      id v9 = (id *)MEMORY[0x1E4F15F68];
    }
    id v10 = *v9;
    int v11 = PLAirPlayGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "Switch AirPlay mode to %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__PHAirPlayScreenController__switchModeForHighResolutionContent_completionHandler___block_invoke;
    v14[3] = &unk_1E5F22230;
    id v12 = v10;
    id v15 = v12;
    BOOL v18 = v4;
    objc_copyWeak(&v17, (id *)buf);
    __int16 v16 = v6;
    [v8 setSecondDisplayMode:v12 completionHandler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v13 = PLAirPlayGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "Skip switching AirPlay mode as output device is nil", buf, 2u);
    }

    if (v6) {
      v6[2](v6);
    }
  }
}

void __83__PHAirPlayScreenController__switchModeForHighResolutionContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLAirPlayGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Switched AirPlay mode to %@ with token %@, error %@", (uint8_t *)&v12, 0x20u);
  }

  if (v5 && *(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setSecondDisplayModeToken:v5];

    id v10 = PLAirPlayGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Storing second display mode token %@", (uint8_t *)&v12, 0xCu);
    }
  }
  int v11 = *(void **)(a1 + 40);
  if (v11) {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

- (void)_updateSecondDisplayModeWithCurrentContent
{
  if ([(PHAirPlayScreenController *)self _shouldUpdateSecondDisplayModeWithCurrentContent])
  {
    objc_initWeak(&location, self);
    id v3 = [(PHAirPlayScreenController *)self _rootViewController];
    BOOL v4 = [(PHAirPlayScreenController *)self _currentContent];
    BOOL v5 = v4 != 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__PHAirPlayScreenController__updateSecondDisplayModeWithCurrentContent__block_invoke;
    v8[3] = &unk_1E5F2AA68;
    objc_copyWeak(&v11, &location);
    BOOL v12 = v4 != 0;
    id v6 = v3;
    id v9 = v6;
    id v7 = v4;
    id v10 = v7;
    [(PHAirPlayScreenController *)self _switchModeForHighResolutionContent:v5 completionHandler:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __71__PHAirPlayScreenController__updateSecondDisplayModeWithCurrentContent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleSettingHighResolutionContent:*(unsigned __int8 *)(a1 + 56) forRootController:*(void *)(a1 + 32) content:*(void *)(a1 + 40)];
}

- (BOOL)_shouldUpdateSecondDisplayModeWithCurrentContent
{
  id v3 = +[PUAirPlaySettings sharedInstance];
  char v4 = [v3 switchToMediaPresentationMode];

  BOOL v5 = [(PHAirPlayScreenController *)self _currentScreen];

  id v6 = [(PHAirPlayScreenController *)self _currentScreen];
  uint64_t v7 = [v6 type];

  if (v5) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 0;
  }
  return v7 != 1 && v8;
}

- (void)_updateScreenContentWithShouldTryToFindAvailableScreen:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Updating PHAirPlayScreenController", (uint8_t *)&v29, 2u);
  }

  id v6 = [(PHAirPlayScreenController *)self _currentScreen];
  uint64_t v7 = [(PHAirPlayScreenController *)self _rootViewController];
  if (!v6 && v3)
  {
    BOOL v8 = PLAirPlayGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "\tNo screen currently in use; searching for screens",
        (uint8_t *)&v29,
        2u);
    }

    id v6 = [(PHAirPlayScreenController *)self _findAvailableScreen];
    [(PHAirPlayScreenController *)self _setCurrentScreen:v6];
  }
  id v9 = PLAirPlayGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      int v29 = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "\tUsing AirPlay screen: %@", (uint8_t *)&v29, 0xCu);
    }

    id v11 = [(PHAirPlayScreenController *)self _currentContent];
    BOOL v12 = PLAirPlayGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "\tFetched content: %@", (uint8_t *)&v29, 0xCu);
    }

    id v13 = PLAirPlayGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [(PHAirPlayScreenController *)self _contentRegistry];
      id v15 = [v14 currentContentProvider];
      int v29 = 138412290;
      v30 = v15;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "\tContent provider: %@", (uint8_t *)&v29, 0xCu);
    }
    uint64_t v16 = [(__CFString *)v6 placeholderType];
    if (v11 || v16 == 1)
    {
      if (!v7)
      {
        uint64_t v19 = PLAirPlayGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "\tCreating system root view controller", (uint8_t *)&v29, 2u);
        }

        uint64_t v7 = objc_alloc_init(PUAirPlayRootViewController);
      }
      id v20 = PLAirPlayGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_DEFAULT, "\tProviding system root view controller to AirPlay screen", (uint8_t *)&v29, 2u);
      }

      uint64_t v18 = v7;
      uint64_t v7 = v18;
    }
    else
    {
      id v17 = PLAirPlayGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "\tRemoving AirPlay screen's view controller because there is no content to display and placeholders are disabled for the current screen in AirPlay settings", (uint8_t *)&v29, 2u);
      }

      id v11 = 0;
      uint64_t v18 = 0;
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "\tNo available screen; ignoring any registered content and discarding root view controller",
        (uint8_t *)&v29,
        2u);
    }

    id v11 = 0;
    uint64_t v18 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v21 = [(__CFString *)v6 rootViewController];

  if (v18 == v21) {
    id v22 = 0;
  }
  else {
    id v22 = objc_alloc_init(MEMORY[0x1E4FB2278]);
  }
  [(PHAirPlayScreenController *)self _setRootViewController:v7];
  v23 = +[PUAirPlaySettings sharedInstance];
  int v24 = [v23 switchToMediaPresentationMode];

  v25 = [(PHAirPlayScreenController *)self _currentScreen];
  uint64_t v26 = [v25 type];

  if (!v24 || v26 == 1)
  {
    [(__CFString *)v6 setRootViewController:v18];
    [(PUAirPlayRootViewController *)v7 setChildViewController:v11 animated:v18 == v21];
  }
  if (v22)
  {
    [v22 setCurrentOutputDeviceEnabled:v18 != 0];
    v27 = PLAirPlayGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = @"NO";
      if (v18) {
        v28 = @"YES";
      }
      int v29 = 138412546;
      v30 = v28;
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEFAULT, "\tSetting enabled %@ on screen picker %@", (uint8_t *)&v29, 0x16u);
    }
  }
}

- (void)_cacheDisplayedContentIfNeededForUnregisteringProvider:(id)a3
{
  id v7 = a3;
  char v4 = [(PHAirPlayScreenController *)self _currentScreen];
  BOOL v5 = [(PHAirPlayScreenController *)self _contentRegistry];
  if ([v5 isCurrentContentProvider:v7]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v7 wantsContentVisibleAfterUnregisteringWithAirPlayController:self]
    && [v4 placeholderType] == 2
    && [(PHAirPlayScreenController *)self isDisplayingContent])
  {
    id v6 = [v5 contentForController:self];
    [(PHAirPlayScreenController *)self _setLastDisplayedContent:v6];
  }
}

- (id)_currentContent
{
  BOOL v3 = [(PHAirPlayScreenController *)self _contentRegistry];
  char v4 = [v3 contentForController:self];

  if (!v4)
  {
    char v4 = [(PHAirPlayScreenController *)self _lastDisplayedContent];
  }
  return v4;
}

- (BOOL)isDisplayingContent
{
  BOOL v3 = [(PHAirPlayScreenController *)self _currentScreen];
  char v4 = [v3 rootViewController];
  unint64_t v5 = [(PHAirPlayScreenController *)self screenAvailability];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [v4 childViewController];
    if (!v8) {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)screenAvailability
{
  unint64_t v2 = [(PHAirPlayScreenController *)self _currentScreen];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 type];
    if (v4 == 1) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = v4 == 2;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (PHAirPlayScreenController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHAirPlayScreenController;
  unint64_t v2 = [(PHAirPlayScreenController *)&v10 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(PUAirPlayScreenDetector);
    [(PUAirPlayScreenDetector *)v3 setReceiver:v2];
    [(PHAirPlayScreenController *)v2 _setScreenDetector:v3];
    uint64_t v4 = objc_alloc_init(PUAirPlayContentRegistry);
    [(PHAirPlayScreenController *)v2 _setContentRegistry:v4];

    unint64_t v5 = objc_alloc_init(PUAirPlayRouteObserverRegistry);
    [(PUAirPlayRouteObserverRegistry *)v5 setDelegate:v2];
    [(PHAirPlayScreenController *)v2 _setRouteObserverRegistry:v5];
    uint64_t v6 = [MEMORY[0x1E4F165D0] sharedSystemScreenContext];
    BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__outputDeviceDidChange_ name:*MEMORY[0x1E4F15F08] object:v6];
    [v7 addObserver:v2 selector:sel__sceneWillDeactivate_ name:*MEMORY[0x1E4FB2EA8] object:0];
    [v7 addObserver:v2 selector:sel__sceneDidActivate_ name:*MEMORY[0x1E4FB2E80] object:0];
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v6;
  }
  return v2;
}

+ (PHAirPlayScreenController)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_481);
  }
  unint64_t v2 = (void *)sharedInstance_sharedController;
  return (PHAirPlayScreenController *)v2;
}

void __43__PHAirPlayScreenController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PHAirPlayScreenController);
  v1 = (void *)sharedInstance_sharedController;
  sharedInstance_sharedController = (uint64_t)v0;
}

- (BOOL)pu_hasAvailableRoute
{
  return [(PHAirPlayScreenController *)self routeAvailability] == 1;
}

@end