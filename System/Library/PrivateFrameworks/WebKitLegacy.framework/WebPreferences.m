@interface WebPreferences
+ (WebPreferences)standardPreferences;
+ (id)_IBCreatorID;
+ (id)_concatenateKeyWithIBCreatorID:(id)a3;
+ (id)_experimentalFeatures;
+ (id)_getInstanceForIdentifier:(id)a3;
+ (id)_internalFeatures;
+ (unsigned)_systemCFStringEncoding;
+ (void)_checkLastReferenceForIdentifier:(id)a3;
+ (void)_clearNetworkLoaderSession:(id)a3;
+ (void)_removeReferenceForIdentifier:(id)a3;
+ (void)_setCurrentNetworkLoaderSessionCookieAcceptPolicy:(unint64_t)a3;
+ (void)_setIBCreatorID:(id)a3;
+ (void)_setInitialDefaultTextEncodingToSystemEncoding;
+ (void)_setInstance:(id)a3 forIdentifier:(id)a4;
+ (void)_switchNetworkLoaderToNewTestingSession;
+ (void)initialize;
+ (void)setWebKitLinkTimeVersion:(int)a3;
- (BOOL)CSSCustomPropertiesAndValuesEnabled;
- (BOOL)CSSIndividualTransformPropertiesEnabled;
- (BOOL)CSSOMViewScrollingAPIEnabled;
- (BOOL)CSSOMViewSmoothScrollingEnabled;
- (BOOL)_BOOLValueForKey:(id)a3;
- (BOOL)_allowMultiElementImplicitFormSubmission;
- (BOOL)_allowPasswordEcho;
- (BOOL)_alwaysRequestGeolocationPermission;
- (BOOL)_forceFTPDirectoryListings;
- (BOOL)_isEnabledForFeature:(id)a3;
- (BOOL)_mediaRecorderEnabled;
- (BOOL)_speechRecognitionEnabled;
- (BOOL)_standalone;
- (BOOL)_telephoneNumberParsingEnabled;
- (BOOL)_textAutosizingEnabled;
- (BOOL)_useSiteSpecificSpoofing;
- (BOOL)accelerated2dCanvasEnabled;
- (BOOL)acceleratedCompositingEnabled;
- (BOOL)acceleratedDrawingEnabled;
- (BOOL)allowCrossOriginSubresourcesToAskForCredentials;
- (BOOL)allowFileAccessFromFileURLs;
- (BOOL)allowMediaContentTypesRequiringHardwareSupportAsFallback;
- (BOOL)allowTopNavigationToDataURLs;
- (BOOL)allowUniversalAccessFromFileURLs;
- (BOOL)allowsAirPlayForMediaPlayback;
- (BOOL)allowsAnimatedImageLooping;
- (BOOL)allowsAnimatedImages;
- (BOOL)allowsInlineMediaPlaybackAfterFullscreen;
- (BOOL)allowsPictureInPictureMediaPlayback;
- (BOOL)animatedImageAsyncDecodingEnabled;
- (BOOL)applicationChromeModeEnabled;
- (BOOL)arePlugInsEnabled;
- (BOOL)aspectRatioOfImgFromWidthAndHeightEnabled;
- (BOOL)asyncClipboardAPIEnabled;
- (BOOL)asyncFrameScrollingEnabled;
- (BOOL)asynchronousSpellCheckingEnabled;
- (BOOL)attachmentElementEnabled;
- (BOOL)audioPlaybackRequiresUserGesture;
- (BOOL)authorAndUserStylesEnabled;
- (BOOL)automaticallyDetectsCacheModel;
- (BOOL)autosaves;
- (BOOL)backspaceKeyNavigationEnabled;
- (BOOL)cacheAPIEnabled;
- (BOOL)canvasUsesAcceleratedDrawing;
- (BOOL)colorFilterEnabled;
- (BOOL)constantPropertiesEnabled;
- (BOOL)contactPickerAPIEnabled;
- (BOOL)contentChangeObserverEnabled;
- (BOOL)coreMathMLEnabled;
- (BOOL)cssShadowPartsEnabled;
- (BOOL)customElementsEnabled;
- (BOOL)customPasteboardDataEnabled;
- (BOOL)dataTransferItemsEnabled;
- (BOOL)databasesEnabled;
- (BOOL)developerExtrasEnabled;
- (BOOL)diagnosticLoggingEnabled;
- (BOOL)directoryUploadEnabled;
- (BOOL)displayListDrawingEnabled;
- (BOOL)domTimersThrottlingEnabled;
- (BOOL)downloadAttributeEnabled;
- (BOOL)encryptedMediaAPIEnabled;
- (BOOL)enumeratingAllNetworkInterfacesEnabled;
- (BOOL)experimentalNotificationsEnabled;
- (BOOL)fetchAPIEnabled;
- (BOOL)fetchAPIKeepAliveEnabled;
- (BOOL)forceLowPowerGPUForWebGL;
- (BOOL)fullScreenEnabled;
- (BOOL)gamepadsEnabled;
- (BOOL)genericCueAPIEnabled;
- (BOOL)hiddenPageCSSAnimationSuspensionEnabled;
- (BOOL)hiddenPageDOMTimerThrottlingEnabled;
- (BOOL)highlightAPIEnabled;
- (BOOL)httpEquivEnabled;
- (BOOL)hyperlinkAuditingEnabled;
- (BOOL)iceCandidateFilteringEnabled;
- (BOOL)imageControlsEnabled;
- (BOOL)inlineMediaPlaybackRequiresPlaysInlineAttribute;
- (BOOL)intersectionObserverEnabled;
- (BOOL)invisibleAutoplayNotPermitted;
- (BOOL)isAVFoundationEnabled;
- (BOOL)isAVFoundationNSURLSessionEnabled;
- (BOOL)isDNSPrefetchingEnabled;
- (BOOL)isDOMPasteAllowed;
- (BOOL)isHixie76WebSocketProtocolEnabled;
- (BOOL)isInAppBrowserPrivacyEnabled;
- (BOOL)isInheritURIQueryComponentEnabled;
- (BOOL)isJavaEnabled;
- (BOOL)isJavaScriptEnabled;
- (BOOL)isSecureContextAttributeEnabled;
- (BOOL)isSpatialNavigationEnabled;
- (BOOL)isVideoPluginProxyEnabled;
- (BOOL)isWebSecurityEnabled;
- (BOOL)isXSSAuditorEnabled;
- (BOOL)javaScriptCanAccessClipboard;
- (BOOL)javaScriptCanOpenWindowsAutomatically;
- (BOOL)javaScriptMarkupEnabled;
- (BOOL)keygenElementEnabled;
- (BOOL)largeImageAsyncDecodingEnabled;
- (BOOL)layoutFormattingContextIntegrationEnabled;
- (BOOL)legacyEncryptedMediaAPIEnabled;
- (BOOL)legacyLineLayoutVisualCoverageEnabled;
- (BOOL)lineHeightUnitsEnabled;
- (BOOL)linkPreloadEnabled;
- (BOOL)linkPreloadResponsiveImagesEnabled;
- (BOOL)loadsImagesAutomatically;
- (BOOL)loadsSiteIconsIgnoringImageLoadingPreference;
- (BOOL)localFileContentSniffingEnabled;
- (BOOL)localStorageEnabled;
- (BOOL)lowPowerVideoAudioBufferSizeEnabled;
- (BOOL)maskWebGLStringsEnabled;
- (BOOL)mediaCapabilitiesEnabled;
- (BOOL)mediaCaptureRequiresSecureConnection;
- (BOOL)mediaControlsScaleWithPageZoom;
- (BOOL)mediaDataLoadsAutomatically;
- (BOOL)mediaDevicesEnabled;
- (BOOL)mediaPlaybackAllowsAirPlay;
- (BOOL)mediaPlaybackAllowsInline;
- (BOOL)mediaPlaybackRequiresUserGesture;
- (BOOL)mediaPreloadingEnabled;
- (BOOL)mediaRecorderEnabled;
- (BOOL)mediaSourceEnabled;
- (BOOL)mediaStreamEnabled;
- (BOOL)mediaUserGestureInheritsFromDocument;
- (BOOL)mockCaptureDevicesEnabled;
- (BOOL)mockCaptureDevicesPromptEnabled;
- (BOOL)mockScrollbarsEnabled;
- (BOOL)needsStorageAccessFromFileURLsQuirk;
- (BOOL)networkDataUsageTrackingEnabled;
- (BOOL)notificationsEnabled;
- (BOOL)offlineWebApplicationCacheEnabled;
- (BOOL)overrideUserGestureRequirementForMainContent;
- (BOOL)pageCacheSupportsPlugins;
- (BOOL)peerConnectionEnabled;
- (BOOL)pictureInPictureAPIEnabled;
- (BOOL)plugInSnapshottingEnabled;
- (BOOL)privateBrowsingEnabled;
- (BOOL)privateClickMeasurementEnabled;
- (BOOL)punchOutWhiteBackgroundsInDarkMode;
- (BOOL)quickLookDocumentSavingEnabled;
- (BOOL)readableByteStreamAPIEnabled;
- (BOOL)remotePlaybackEnabled;
- (BOOL)requestAnimationFrameEnabled;
- (BOOL)requestIdleCallbackEnabled;
- (BOOL)resizeObserverEnabled;
- (BOOL)resourceLoadStatisticsEnabled;
- (BOOL)resourceTimingEnabled;
- (BOOL)selectionAcrossShadowBoundariesEnabled;
- (BOOL)serverTimingEnabled;
- (BOOL)serviceControlsEnabled;
- (BOOL)shadowDOMEnabled;
- (BOOL)shouldConvertPositionStyleOnCopy;
- (BOOL)shouldDisplayCaptions;
- (BOOL)shouldDisplaySubtitles;
- (BOOL)shouldDisplayTextDescriptions;
- (BOOL)shouldPrintBackgrounds;
- (BOOL)shouldRespectImageOrientation;
- (BOOL)showDebugBorders;
- (BOOL)showRepaintCounter;
- (BOOL)shrinksStandaloneImagesToFit;
- (BOOL)sourceBufferChangeTypeEnabled;
- (BOOL)storageTrackerEnabled;
- (BOOL)subpixelAntialiasedLayerTextEnabled;
- (BOOL)subpixelCSSOMElementMetricsEnabled;
- (BOOL)suppressesIncrementalRendering;
- (BOOL)syntheticEditingCommandsEnabled;
- (BOOL)transformStreamAPIEnabled;
- (BOOL)usePreHTML5ParserQuirks;
- (BOOL)userGesturePromisePropagationEnabled;
- (BOOL)userStyleSheetEnabled;
- (BOOL)userTimingEnabled;
- (BOOL)usesEncodingDetector;
- (BOOL)usesPageCache;
- (BOOL)videoPlaybackRequiresUserGesture;
- (BOOL)visualViewportAPIEnabled;
- (BOOL)wantsBalancedSetDefersLoadingBehavior;
- (BOOL)webAnimationsCompositeOperationsEnabled;
- (BOOL)webAnimationsMutableTimelinesEnabled;
- (BOOL)webArchiveDebugModeEnabled;
- (BOOL)webAudioEnabled;
- (BOOL)webGL2Enabled;
- (BOOL)webGLEnabled;
- (BOOL)webSQLEnabled;
- (BOOL)zoomsTextOnly;
- (NSArray)additionalSupportedImageTypes;
- (NSString)_ftpDirectoryTemplatePath;
- (NSString)_localStorageDatabasePath;
- (NSString)cursiveFontFamily;
- (NSString)defaultTextEncodingName;
- (NSString)fantasyFontFamily;
- (NSString)fixedFontFamily;
- (NSString)identifier;
- (NSString)mediaContentTypesRequiringHardwareSupport;
- (NSString)mediaKeysStorageDirectory;
- (NSString)networkInterfaceName;
- (NSString)pictographFontFamily;
- (NSString)sansSerifFontFamily;
- (NSString)serifFontFamily;
- (NSString)standardFontFamily;
- (NSURL)userStyleSheetLocation;
- (WebCacheModel)cacheModel;
- (WebPreferences)init;
- (WebPreferences)initWithCoder:(id)a3;
- (WebPreferences)initWithIdentifier:(NSString *)anIdentifier;
- (WebPreferences)initWithIdentifier:(id)a3 sendChangeNotification:(BOOL)a4;
- (double)_backForwardCacheExpirationInterval;
- (double)incrementalRenderingSuppressionTimeoutInSeconds;
- (float)_floatValueForKey:(id)a3;
- (float)_maxParseDuration;
- (float)_minimumZoomFontSize;
- (float)_passwordEchoDuration;
- (id)_stringArrayValueForKey:(id)a3;
- (id)_stringValueForKey:(id)a3;
- (id)_valueForKey:(id)a3;
- (int)_integerValueForKey:(id)a3;
- (int)_interpolationQuality;
- (int)_pitchCorrectionAlgorithm;
- (int)defaultFixedFontSize;
- (int)defaultFontSize;
- (int)editableLinkBehavior;
- (int)javaScriptRuntimeFlags;
- (int)minimumFontSize;
- (int)minimumLogicalFontSize;
- (int)storageBlockingPolicy;
- (int)textDirectionSubmenuInclusionBehavior;
- (int64_t)_longLongValueForKey:(id)a3;
- (int64_t)applicationCacheDefaultOriginQuota;
- (int64_t)applicationCacheTotalQuota;
- (unint64_t)_unsignedLongLongValueForKey:(id)a3;
- (unsigned)_unsignedIntValueForKey:(id)a3;
- (unsigned)audioSessionCategoryOverride;
- (void)_batchUpdatePreferencesInBlock:(id)a3;
- (void)_invalidateCachedPreferences;
- (void)_postCacheModelChangedNotification;
- (void)_postPreferencesChangedAPINotification;
- (void)_postPreferencesChangedNotification;
- (void)_resetForTesting;
- (void)_setAllowMultiElementImplicitFormSubmission:(BOOL)a3;
- (void)_setAlwaysRequestGeolocationPermission:(BOOL)a3;
- (void)_setBoolValue:(BOOL)a3 forKey:(id)a4;
- (void)_setDoublePreferenceForTestingWithValue:(double)a3 forKey:(id)a4;
- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4;
- (void)_setFTPDirectoryTemplatePath:(id)a3;
- (void)_setFloatValue:(float)a3 forKey:(id)a4;
- (void)_setForceFTPDirectoryListings:(BOOL)a3;
- (void)_setIntegerValue:(int)a3 forKey:(id)a4;
- (void)_setInterpolationQuality:(int)a3;
- (void)_setLocalStorageDatabasePath:(id)a3;
- (void)_setLongLongValue:(int64_t)a3 forKey:(id)a4;
- (void)_setMaxParseDuration:(float)a3;
- (void)_setMediaRecorderEnabled:(BOOL)a3;
- (void)_setMinimumZoomFontSize:(float)a3;
- (void)_setPitchCorrectionAlgorithm:(int)a3;
- (void)_setSpeechRecognitionEnabled:(BOOL)a3;
- (void)_setStandalone:(BOOL)a3;
- (void)_setStringArrayValueForKey:(id)a3 forKey:(id)a4;
- (void)_setStringValue:(id)a3 forKey:(id)a4;
- (void)_setTelephoneNumberParsingEnabled:(BOOL)a3;
- (void)_setTextAutosizingEnabled:(BOOL)a3;
- (void)_setUnsignedIntValue:(unsigned int)a3 forKey:(id)a4;
- (void)_setUnsignedLongLongValue:(unint64_t)a3 forKey:(id)a4;
- (void)_setUseSiteSpecificSpoofing:(BOOL)a3;
- (void)_startBatchingUpdates;
- (void)_stopBatchingUpdates;
- (void)_synchronizeWebStoragePolicyWithCookiePolicy;
- (void)_updatePrivateBrowsingStateTo:(BOOL)a3;
- (void)dealloc;
- (void)didRemoveFromWebView;
- (void)encodeWithCoder:(id)a3;
- (void)setAVFoundationEnabled:(BOOL)a3;
- (void)setAcceleratedCompositingEnabled:(BOOL)a3;
- (void)setAcceleratedDrawingEnabled:(BOOL)a3;
- (void)setAdditionalSupportedImageTypes:(id)a3;
- (void)setAllowFileAccessFromFileURLs:(BOOL)a3;
- (void)setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3;
- (void)setAllowTopNavigationToDataURLs:(BOOL)a3;
- (void)setAllowUniversalAccessFromFileURLs:(BOOL)a3;
- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback;
- (void)setAllowsAnimatedImageLooping:(BOOL)allowsAnimatedImageLooping;
- (void)setAllowsAnimatedImages:(BOOL)allowsAnimatedImages;
- (void)setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3;
- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)a3;
- (void)setAnimatedImageAsyncDecodingEnabled:(BOOL)a3;
- (void)setAsyncClipboardAPIEnabled:(BOOL)a3;
- (void)setAsyncFrameScrollingEnabled:(BOOL)a3;
- (void)setAsynchronousSpellCheckingEnabled:(BOOL)a3;
- (void)setAttachmentElementEnabled:(BOOL)a3;
- (void)setAudioPlaybackRequiresUserGesture:(BOOL)a3;
- (void)setAudioSessionCategoryOverride:(unsigned int)a3;
- (void)setAuthorAndUserStylesEnabled:(BOOL)a3;
- (void)setAutomaticallyDetectsCacheModel:(BOOL)a3;
- (void)setAutosaves:(BOOL)autosaves;
- (void)setBackspaceKeyNavigationEnabled:(BOOL)a3;
- (void)setCSSOMViewScrollingAPIEnabled:(BOOL)a3;
- (void)setCSSOMViewSmoothScrollingEnabled:(BOOL)a3;
- (void)setCacheAPIEnabled:(BOOL)a3;
- (void)setCacheModel:(WebCacheModel)cacheModel;
- (void)setCanvasUsesAcceleratedDrawing:(BOOL)a3;
- (void)setColorFilterEnabled:(BOOL)a3;
- (void)setContactPickerAPIEnabled:(BOOL)a3;
- (void)setContentChangeObserverEnabled:(BOOL)a3;
- (void)setCoreMathMLEnabled:(BOOL)a3;
- (void)setCursiveFontFamily:(NSString *)cursiveFontFamily;
- (void)setCustomPasteboardDataEnabled:(BOOL)a3;
- (void)setDNSPrefetchingEnabled:(BOOL)a3;
- (void)setDOMPasteAllowed:(BOOL)a3;
- (void)setDOMTimersThrottlingEnabled:(BOOL)a3;
- (void)setDataTransferItemsEnabled:(BOOL)a3;
- (void)setDatabasesEnabled:(BOOL)a3;
- (void)setDefaultFixedFontSize:(int)defaultFixedFontSize;
- (void)setDefaultFontSize:(int)defaultFontSize;
- (void)setDefaultTextEncodingName:(NSString *)defaultTextEncodingName;
- (void)setDeveloperExtrasEnabled:(BOOL)a3;
- (void)setDiagnosticLoggingEnabled:(BOOL)a3;
- (void)setDirectoryUploadEnabled:(BOOL)a3;
- (void)setDownloadAttributeEnabled:(BOOL)a3;
- (void)setEditableLinkBehavior:(int)a3;
- (void)setEnableInheritURIQueryComponent:(BOOL)a3;
- (void)setEncryptedMediaAPIEnabled:(BOOL)a3;
- (void)setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3;
- (void)setFantasyFontFamily:(NSString *)fantasyFontFamily;
- (void)setFixedFontFamily:(NSString *)fixedFontFamily;
- (void)setForceWebGLUsesLowPower:(BOOL)a3;
- (void)setFullScreenEnabled:(BOOL)a3;
- (void)setGamepadsEnabled:(BOOL)a3;
- (void)setGenericCueAPIEnabled:(BOOL)a3;
- (void)setHTTPEquivEnabled:(BOOL)a3;
- (void)setHiddenPageCSSAnimationSuspensionEnabled:(BOOL)a3;
- (void)setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3;
- (void)setHighlightAPIEnabled:(BOOL)a3;
- (void)setHyperlinkAuditingEnabled:(BOOL)a3;
- (void)setIceCandidateFilteringEnabled:(BOOL)a3;
- (void)setInAppBrowserPrivacyEnabled:(BOOL)a3;
- (void)setIncrementalRenderingSuppressionTimeoutInSeconds:(double)a3;
- (void)setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3;
- (void)setInvisibleAutoplayNotPermitted:(BOOL)a3;
- (void)setJavaScriptCanAccessClipboard:(BOOL)a3;
- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically;
- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled;
- (void)setJavaScriptMarkupEnabled:(BOOL)a3;
- (void)setJavaScriptRuntimeFlags:(int)a3;
- (void)setLargeImageAsyncDecodingEnabled:(BOOL)a3;
- (void)setLayoutFormattingContextIntegrationEnabled:(BOOL)a3;
- (void)setLegacyEncryptedMediaAPIEnabled:(BOOL)a3;
- (void)setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3;
- (void)setLinkPreloadEnabled:(BOOL)a3;
- (void)setLinkPreloadResponsiveImagesEnabled:(BOOL)a3;
- (void)setLoadsImagesAutomatically:(BOOL)loadsImagesAutomatically;
- (void)setLocalFileContentSniffingEnabled:(BOOL)a3;
- (void)setLocalStorageEnabled:(BOOL)a3;
- (void)setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3;
- (void)setMediaCapabilitiesEnabled:(BOOL)a3;
- (void)setMediaCaptureRequiresSecureConnection:(BOOL)a3;
- (void)setMediaContentTypesRequiringHardwareSupport:(id)a3;
- (void)setMediaControlsScaleWithPageZoom:(BOOL)a3;
- (void)setMediaDataLoadsAutomatically:(BOOL)a3;
- (void)setMediaDevicesEnabled:(BOOL)a3;
- (void)setMediaKeysStorageDirectory:(id)a3;
- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3;
- (void)setMediaPlaybackAllowsInline:(BOOL)a3;
- (void)setMediaPlaybackRequiresUserGesture:(BOOL)a3;
- (void)setMediaPreloadingEnabled:(BOOL)a3;
- (void)setMediaRecorderEnabled:(BOOL)a3;
- (void)setMediaSourceEnabled:(BOOL)a3;
- (void)setMediaStreamEnabled:(BOOL)a3;
- (void)setMediaUserGestureInheritsFromDocument:(BOOL)a3;
- (void)setMinimumFontSize:(int)minimumFontSize;
- (void)setMinimumLogicalFontSize:(int)minimumLogicalFontSize;
- (void)setMockCaptureDevicesEnabled:(BOOL)a3;
- (void)setMockCaptureDevicesPromptEnabled:(BOOL)a3;
- (void)setMockScrollbarsEnabled:(BOOL)a3;
- (void)setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3;
- (void)setNetworkDataUsageTrackingEnabled:(BOOL)a3;
- (void)setNetworkInterfaceName:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setOverrideUserGestureRequirementForMainContent:(BOOL)a3;
- (void)setPageCacheSupportsPlugins:(BOOL)a3;
- (void)setPeerConnectionEnabled:(BOOL)a3;
- (void)setPictographFontFamily:(id)a3;
- (void)setPictureInPictureAPIEnabled:(BOOL)a3;
- (void)setPlugInsEnabled:(BOOL)plugInsEnabled;
- (void)setPrivateBrowsingEnabled:(BOOL)privateBrowsingEnabled;
- (void)setPrivateClickMeasurementEnabled:(BOOL)a3;
- (void)setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3;
- (void)setQuickLookDocumentSavingEnabled:(BOOL)a3;
- (void)setReadableByteStreamAPIEnabled:(BOOL)a3;
- (void)setRemotePlaybackEnabled:(BOOL)a3;
- (void)setRequestIdleCallbackEnabled:(BOOL)a3;
- (void)setResourceLoadStatisticsEnabled:(BOOL)a3;
- (void)setSansSerifFontFamily:(NSString *)sansSerifFontFamily;
- (void)setSerifFontFamily:(NSString *)serifFontFamily;
- (void)setServiceControlsEnabled:(BOOL)a3;
- (void)setShouldConvertPositionStyleOnCopy:(BOOL)a3;
- (void)setShouldDisplayCaptions:(BOOL)a3;
- (void)setShouldDisplaySubtitles:(BOOL)a3;
- (void)setShouldDisplayTextDescriptions:(BOOL)a3;
- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds;
- (void)setShouldRespectImageOrientation:(BOOL)a3;
- (void)setShowDebugBorders:(BOOL)a3;
- (void)setShowRepaintCounter:(BOOL)a3;
- (void)setShrinksStandaloneImagesToFit:(BOOL)a3;
- (void)setSourceBufferChangeTypeEnabled:(BOOL)a3;
- (void)setSpatialNavigationEnabled:(BOOL)a3;
- (void)setStandardFontFamily:(NSString *)standardFontFamily;
- (void)setStorageBlockingPolicy:(int)a3;
- (void)setStorageTrackerEnabled:(BOOL)a3;
- (void)setSubpixelCSSOMElementMetricsEnabled:(BOOL)a3;
- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering;
- (void)setTextDirectionSubmenuInclusionBehavior:(int)a3;
- (void)setUsePreHTML5ParserQuirks:(BOOL)a3;
- (void)setUserGesturePromisePropagationEnabled:(BOOL)a3;
- (void)setUsesEncodingDetector:(BOOL)a3;
- (void)setUsesPageCache:(BOOL)usesPageCache;
- (void)setVideoPlaybackRequiresUserGesture:(BOOL)a3;
- (void)setVisualViewportAPIEnabled:(BOOL)a3;
- (void)setWantsBalancedSetDefersLoadingBehavior:(BOOL)a3;
- (void)setWebAnimationsCompositeOperationsEnabled:(BOOL)a3;
- (void)setWebAnimationsMutableTimelinesEnabled:(BOOL)a3;
- (void)setWebArchiveDebugModeEnabled:(BOOL)a3;
- (void)setWebAudioEnabled:(BOOL)a3;
- (void)setWebGLEnabled:(BOOL)a3;
- (void)setWebSQLEnabled:(BOOL)a3;
- (void)setWebSecurityEnabled:(BOOL)a3;
- (void)setZoomsTextOnly:(BOOL)a3;
- (void)willAddToWebView;
@end

@implementation WebPreferences

- (WebPreferences)init
{
  uint64_t v3 = -[WebPreferences init]::instanceCount++;
  for (uint64_t i = objc_msgSend(NSString, "stringWithFormat:", @"WebPreferences%d", v3);
        [(id)objc_opt_class() _getInstanceForIdentifier:i];
        uint64_t i = objc_msgSend(NSString, "stringWithFormat:", @"WebPreferences%d", v5))
  {
    uint64_t v5 = -[WebPreferences init]::instanceCount++;
  }
  return [(WebPreferences *)self initWithIdentifier:i];
}

- (WebPreferences)initWithIdentifier:(NSString *)anIdentifier
{
  return [(WebPreferences *)self initWithIdentifier:anIdentifier sendChangeNotification:1];
}

- (WebPreferences)initWithIdentifier:(id)a3 sendChangeNotification:(BOOL)a4
{
  uint64_t v5 = [(id)objc_opt_class() _getInstanceForIdentifier:a3];
  if (v5)
  {
    id v7 = (id)v5;

    return (WebPreferences *)v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WebPreferences;
    if ([(WebPreferences *)&v8 init]) {
      operator new();
    }
    return 0;
  }
}

- (WebPreferences)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WebPreferences;
  if ([(WebPreferences *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:*((void *)self->_private + 2) forKey:@"Identifier"];
    uint64_t v5 = *(NSObject **)self->_private;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__WebPreferences_encodeWithCoder___block_invoke;
    block[3] = &unk_1E6D97DC8;
    block[4] = a3;
    block[5] = self;
    dispatch_sync(v5, block);
  }
  else
  {
    int v8 = 1;
    [a3 encodeValueOfObjCType:"i" at:&v8];
    [a3 encodeObject:*((void *)self->_private + 2)];
    v6 = *(NSObject **)self->_private;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__WebPreferences_encodeWithCoder___block_invoke_2;
    v7[3] = &unk_1E6D97DC8;
    v7[4] = a3;
    v7[5] = self;
    dispatch_sync(v6, v7);
  }
}

uint64_t __34__WebPreferences_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 8) forKey:@"Values"];
}

uint64_t __34__WebPreferences_encodeWithCoder___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 8)];
}

+ (WebPreferences)standardPreferences
{
  if (qword_1EB3A9820 == -1)
  {
    if (_MergedGlobals_22 == 1) {
      return (WebPreferences *)qword_1EB3A9828;
    }
  }
  else
  {
    dispatch_once(&qword_1EB3A9820, &__block_literal_global_4);
    if (_MergedGlobals_22 == 1) {
      return (WebPreferences *)qword_1EB3A9828;
    }
  }
  result = 0;
  qword_1EB3A9828 = 0;
  _MergedGlobals_22 = 1;
  return result;
}

uint64_t __37__WebPreferences_standardPreferences__block_invoke()
{
  v0 = [[WebPreferences alloc] initWithIdentifier:0 sendChangeNotification:0];
  if (_MergedGlobals_22)
  {
    v1 = (const void *)qword_1EB3A9828;
    qword_1EB3A9828 = (uint64_t)v0;
    if (v1)
    {
      CFRelease(v1);
      if (_MergedGlobals_22 == 1)
      {
        v0 = (WebPreferences *)qword_1EB3A9828;
      }
      else
      {
        v0 = 0;
        qword_1EB3A9828 = 0;
        _MergedGlobals_22 = 1;
      }
    }
  }
  else
  {
    _MergedGlobals_22 = 1;
    qword_1EB3A9828 = (uint64_t)v0;
  }
  [(WebPreferences *)v0 _postPreferencesChangedNotification];
  if (_MergedGlobals_22 == 1)
  {
    v2 = (void *)qword_1EB3A9828;
  }
  else
  {
    v2 = 0;
    qword_1EB3A9828 = 0;
    _MergedGlobals_22 = 1;
  }
  return [v2 setAutosaves:1];
}

+ (void)initialize
{
  MEMORY[0x1F4188790](a1, a2);
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
  *MEMORY[0x1E4F30960] += 2;
  uint64_t v4 = WTF::StringImpl::operator NSString *();
  *(_DWORD *)v3 += 2;
  uint64_t v5 = WTF::StringImpl::operator NSString *();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v107) {
    v6 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v6 = &stru_1F3C7DA90;
  }
  v106 = v6;
  id v7 = (WebCore::IOSApplication *)WTF::StringImpl::createWithoutCopyingNonEmpty();
  int v8 = v107;
  uint64_t v105 = v5;
  if (v107)
  {
    id v7 = (WebCore::IOSApplication *)WTF::StringImpl::operator NSString *();
    v103 = (__CFString *)v7;
    v9 = NSNumber;
    {
LABEL_6:
      uint64_t v10 = WebKit::defaultJavaScriptCanOpenWindowsAutomatically(void)::shouldAllowWindowOpenWithoutUserGesture != 0;
      goto LABEL_7;
    }
  }
  else
  {
    v103 = &stru_1F3C7DA90;
    v9 = NSNumber;
      goto LABEL_6;
  }
  if (WebCore::IOSApplication::isTheSecretSocietyHiddenMystery(v7)) {
    uint64_t v10 = WTF::linkedOnOrAfterSDKWithBehavior() ^ 1;
  }
  else {
    uint64_t v10 = 0;
  }
  WebKit::defaultJavaScriptCanOpenWindowsAutomatically(void)::shouldAllowWindowOpenWithoutUserGesture = v10;
LABEL_7:
  v104 = (PAL *)[v9 numberWithBool:v10];
  [NSNumber numberWithBool:PAL::deviceClassIsSmallScreen(v104)];
  v11 = NSNumber;
  {
    BOOL v12 = WebKit::defaultAllowContentSecurityPolicySourceStarToMatchAnyProtocol(void)::shouldAllowContentSecurityPolicySourceStarToMatchAnyProtocol != 0;
  }
  else
  {
    unsigned int v95 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion) {
      unsigned int v95 = NSVersionOfLinkTimeLibrary("UIKit");
    }
    BOOL v12 = HIWORD(v95) < 0xDE3u;
    WebKit::defaultAllowContentSecurityPolicySourceStarToMatchAnyProtocol(void)::shouldAllowContentSecurityPolicySourceStarToMatchAnyProtocol = HIWORD(v95) < 0xDE3u;
  }
  [v11 numberWithBool:v12];
  v13 = NSNumber;
  {
    BOOL v14 = WebKit::defaultAllowDisplayOfInsecureContent(void)::shouldAllowDisplayOfInsecureContent != 0;
  }
  else
  {
    unsigned int v96 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion) {
      unsigned int v96 = NSVersionOfLinkTimeLibrary("UIKit");
    }
    BOOL v14 = v96 >> 17 < 0x6BF;
    WebKit::defaultAllowDisplayOfInsecureContent(void)::shouldAllowDisplayOfInsecureContent = v96 >> 17 < 0x6BF;
  }
  [v13 numberWithBool:v14];
  v15 = NSNumber;
  {
    BOOL v16 = WebKit::defaultAllowRunningOfInsecureContent(void)::shouldAllowRunningOfInsecureContent != 0;
  }
  else
  {
    unsigned int v97 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion) {
      unsigned int v97 = NSVersionOfLinkTimeLibrary("UIKit");
    }
    BOOL v16 = v97 >> 17 < 0x6BF;
    WebKit::defaultAllowRunningOfInsecureContent(void)::shouldAllowRunningOfInsecureContent = v97 >> 17 < 0x6BF;
  }
  v17 = (PAL *)[v15 numberWithBool:v16];
  v18 = (PAL *)[NSNumber numberWithBool:PAL::deviceClassIsSmallScreen(v17) ^ 1];
  [NSNumber numberWithBool:PAL::deviceClassIsSmallScreen(v18)];
  v19 = NSNumber;
  {
    uint64_t v20 = WebKit::defaultAllowsPictureInPictureMediaPlayback(void)::shouldAllowPictureInPictureMediaPlayback != 0;
  }
  else
  {
    uint64_t v20 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultAllowsPictureInPictureMediaPlayback(void)::shouldAllowPictureInPictureMediaPlayback = v20;
  }
  [v19 numberWithBool:v20];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v107) {
    WTF::StringImpl::operator NSString *();
  }
  v21 = NSNumber;
  {
    uint64_t v22 = WebKit::defaultShouldRestrictBaseURLSchemes(void)::shouldRestrictBaseURLSchemes != 0;
  }
  else
  {
    uint64_t v22 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultShouldRestrictBaseURLSchemes(void)::shouldRestrictBaseURLSchemes = v22;
  }
  [v21 numberWithBool:v22];
  v23 = NSNumber;
  {
    uint64_t v24 = WebKit::defaultShouldConvertInvalidURLsToBlank(void)::shouldConvertInvalidURLsToBlank != 0;
  }
  else
  {
    uint64_t v24 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultShouldConvertInvalidURLsToBlank(void)::shouldConvertInvalidURLsToBlank = v24;
  }
  [v23 numberWithBool:v24];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = v107;
  if (v107) {
    WTF::StringImpl::operator NSString *();
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (!v107)
  {
    v26 = NSNumber;
      goto LABEL_28;
LABEL_32:
    uint64_t v27 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultRequiresUserGestureToLoadVideo(void)::shouldRequireUserGestureToLoadVideo = v27;
    goto LABEL_29;
  }
  WTF::StringImpl::operator NSString *();
  v26 = NSNumber;
    goto LABEL_32;
LABEL_28:
  uint64_t v27 = WebKit::defaultRequiresUserGestureToLoadVideo(void)::shouldRequireUserGestureToLoadVideo != 0;
LABEL_29:
  [v26 numberWithBool:v27];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v107) {
    WTF::StringImpl::operator NSString *();
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v107) {
    WTF::StringImpl::operator NSString *();
  }
  v28 = NSNumber;
  {
    uint64_t v29 = WebKit::defaultPassiveTouchListenersAsDefaultOnDocument(void)::result != 0;
  }
  else
  {
    uint64_t v29 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultPassiveTouchListenersAsDefaultOnDocument(void)::result = v29;
  }
  [v28 numberWithBool:v29];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = v107;
  if (v107) {
    v30 = (WebCore::IOSApplication *)WTF::StringImpl::operator NSString *();
  }
  [NSNumber numberWithBool:WebCore::IOSApplication::isMobileMail(v30)];
  v31 = NSNumber;
  {
    uint64_t v32 = WebKit::defaultWebSQLEnabled(void)::webSQLEnabled != 0;
  }
  else
  {
    int v98 = WTF::linkedOnOrAfterSDKWithBehavior();
    uint64_t v32 = v98 ^ 1u;
    WebKit::defaultWebSQLEnabled(void)::webSQLEnabled = v98 ^ 1;
  }
  [v31 numberWithBool:v32];
  v33 = NSNumber;
  {
    uint64_t v34 = WebKit::defaultPopoverAttributeEnabled(void)::newSDK != 0;
  }
  else
  {
    uint64_t v34 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultPopoverAttributeEnabled(void)::newSDK = v34;
  }
  [v33 numberWithBool:v34];
  v35 = NSNumber;
  {
    int v36 = WebKit::defaultShowModalDialogEnabled(void)::newSDK;
  }
  else
  {
    int v36 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultShowModalDialogEnabled(void)::newSDK = v36;
  }
  v102 = (PAL *)[v35 numberWithBool:v36 == 0];
  [NSNumber numberWithBool:PAL::deviceClassIsSmallScreen(v102) ^ 1];
  v37 = NSNumber;
  v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  context = (void *)MEMORY[0x1E4E4B3F0]();
  v39 = (const char *)[v38 UTF8String];
  if (!v39)
  {
LABEL_205:
    if (overriddenWebKitLinkTimeVersion)
    {
      size_t v42 = 0;
LABEL_207:
      v53 = v107;
      v54 = v107;
    }
    else
    {
      v53 = v107;
      v54 = v107;
      NSVersionOfLinkTimeLibrary("UIKit");
      size_t v42 = 0;
    }
    goto LABEL_209;
  }
  v99 = v37;
  uint64_t v100 = v4;
  v40 = cacheModelForMainBundle(NSString *)::documentViewerIDs;
  while (1)
  {
    v41 = *v40;
    if (*v40) {
      break;
    }
    if (!*v39) {
      goto LABEL_57;
    }
LABEL_48:
    if (++v40 == cacheModelForMainBundle(NSString *)::documentBrowserIDs)
    {
      v47 = (const char **)cacheModelForMainBundle(NSString *)::documentBrowserIDs;
      size_t v42 = 1;
      do
      {
        v48 = *v47;
        if (*v47)
        {
          size_t v49 = strlen(*v47);
          if (v49 == strlen(v39))
          {
            if (!v49) {
              goto LABEL_70;
            }
            if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + *(unsigned __int8 *)v48) == *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *(unsigned __int8 *)v39))
            {
              size_t v50 = 0;
              while (v49 - 1 != v50)
              {
                int v51 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + v48[v50 + 1]);
                int v52 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + v39[++v50]);
                if (v51 != v52)
                {
                  if (v50 < v49) {
                    goto LABEL_61;
                  }
                  break;
                }
              }
LABEL_70:
              uint64_t v3 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
              goto LABEL_71;
            }
          }
        }
        else if (!*v39)
        {
          goto LABEL_70;
        }
LABEL_61:
        ++v47;
      }
      while (v47 != (const char **)WebStorageDirectoryDefaultsKey);
      uint64_t v3 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
      int v8 = v107;
      uint64_t v4 = v100;
      v25 = v107;
      v37 = v99;
      switch(strlen(v39))
      {
        case 0x12uLL:
          int v55 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 99);
          if (v55 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *(unsigned __int8 *)v39)) {
            goto LABEL_205;
          }
          int v56 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 111);
          if (v56 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 1))) {
            goto LABEL_205;
          }
          int v57 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 109);
          if (v57 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 2))) {
            goto LABEL_205;
          }
          int v58 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 46);
          if (v58 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 3))) {
            goto LABEL_205;
          }
          int v59 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 97);
          if (v59 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 4))) {
            goto LABEL_205;
          }
          int v60 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 112);
          if (v60 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 5))
            || v60 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 6))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 52) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 7))
            || v57 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 8))
            || v59 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 9))
            || v55 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))
            || v58 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 11))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 119) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 12))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 75) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 13))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 105) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 14))
            || v56 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 15))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 115) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 16))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 107) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 17)))
          {
            goto LABEL_205;
          }
          break;
        case 0x13uLL:
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 110) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *(unsigned __int8 *)v39))
            goto LABEL_205;
          int v61 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 101);
          if (v61 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 1))) {
            goto LABEL_205;
          }
          int v62 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 116);
          if (v62 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 2))) {
            goto LABEL_205;
          }
          int v63 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 46);
          if (v63 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 3))) {
            goto LABEL_205;
          }
          int v64 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 104);
          if (v64 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 4))) {
            goto LABEL_205;
          }
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 109) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 5)))
            goto LABEL_205;
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 100) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 6)))
            goto LABEL_205;
          if (v62 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 7))) {
            goto LABEL_205;
          }
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 45) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 8)))
            goto LABEL_205;
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 119) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 9)))
            goto LABEL_205;
          if (v61 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))) {
            goto LABEL_205;
          }
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 98) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 11)))
            goto LABEL_205;
          if (v63 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 12))) {
            goto LABEL_205;
          }
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 83) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 13)))
            goto LABEL_205;
          if (v64 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 14))) {
            goto LABEL_205;
          }
          int v65 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 105);
          if (v65 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 15))
            || v65 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 16))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 114) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 17))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 97) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 18)))
          {
            goto LABEL_205;
          }
          break;
        case 0x16uLL:
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 99) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *(unsigned __int8 *)v39))
            goto LABEL_205;
          int v66 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 111);
          if (v66 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 1))) {
            goto LABEL_205;
          }
          int v67 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 109);
          if (v67 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 2))) {
            goto LABEL_205;
          }
          int v68 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 46);
          if (v68 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 3))) {
            goto LABEL_205;
          }
          if (v66 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 4))) {
            goto LABEL_205;
          }
          if (v67 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 5))) {
            goto LABEL_205;
          }
          int v69 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 110);
          if (v69 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 6))) {
            goto LABEL_205;
          }
          int v70 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 105);
          if (v70 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 7))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 103) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 8))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 114) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 9))
            || v66 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 117) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 11))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 112) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 12))
            || v68 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 13))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 79) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 14))
            || v67 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 15))
            || v69 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 16))
            || v70 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 17))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 87) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 18))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 101) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 19))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 98) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 20))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 53) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 21)))
          {
            goto LABEL_205;
          }
          break;
        case 0x17uLL:
          int v71 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 99);
          if (v71 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *(unsigned __int8 *)v39)) {
            goto LABEL_205;
          }
          int v72 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 111);
          if (v72 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 1))) {
            goto LABEL_205;
          }
          int v73 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 109);
          if (v73 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 2))) {
            goto LABEL_205;
          }
          int v74 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 46);
          if (v74 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 3))) {
            goto LABEL_205;
          }
          int v75 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 97);
          if (v75 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 4))
            || (int v76 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 112),
                v76 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 5)))
            || v76 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 6))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 52) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 7))
            || v73 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 8))
            || v75 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 9))
            || v71 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))
            || v74 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 11))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 75) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 12))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 105) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 13))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 100) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 14))
            || (int v77 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 115),
                v77 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 15)))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 66) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 16))
            || (int v78 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 114),
                v78 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 17)))
            || v72 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 18))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 119) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 19))
            || v77 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 20))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 101) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 21))
            || v78 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 22)))
          {
            if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 102) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                         + *((unsigned __int8 *)v39 + 4)))
              goto LABEL_205;
            int v79 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 114);
            if (v79 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 5))) {
              goto LABEL_205;
            }
            int v80 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 101);
            if (v80 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 6))
              || v80 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 7))
              || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 118) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                         + *((unsigned __int8 *)v39 + 8))
              || v80 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 9))
              || v79 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))
              || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 115) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                         + *((unsigned __int8 *)v39 + 11))
              || v80 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 12))
              || v74 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 13))
              || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 98) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                        + *((unsigned __int8 *)v39 + 14))
              || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 117) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                         + *((unsigned __int8 *)v39 + 15))
              || v73 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 16))
              || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 112) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                         + *((unsigned __int8 *)v39 + 17))
              || v80 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 18))
              || v79 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 19))
              || v71 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 20))
              || v75 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 21))
              || v79 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 22)))
            {
              goto LABEL_205;
            }
          }
          break;
        case 0x1AuLL:
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 99) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *(unsigned __int8 *)v39))
            goto LABEL_205;
          int v81 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 111);
          if (v81 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 1))) {
            goto LABEL_205;
          }
          if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + 109) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 2)))
            goto LABEL_205;
          int v82 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 46);
          if (v82 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 3))) {
            goto LABEL_205;
          }
          int v83 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 115);
          if (v83 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 4))) {
            goto LABEL_205;
          }
          int v84 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 117);
          if (v84 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 5))) {
            goto LABEL_205;
          }
          int v85 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 110);
          if (v85 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 6))) {
            goto LABEL_205;
          }
          int v86 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 114);
          if (v86 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 7))) {
            goto LABEL_205;
          }
          int v87 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 105);
          if (v87 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 8))) {
            goto LABEL_205;
          }
          if (v83 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 9))) {
            goto LABEL_205;
          }
          int v88 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 101);
          if (v88 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 10))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 98) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 11))
            || v86 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 12))
            || v81 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 13))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 119) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                       + *((unsigned __int8 *)v39 + 14))
            || v83 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 15))
            || v88 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 16))
            || v86 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 17))
            || v82 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 18))
            || *(unsigned __int8 *)(MEMORY[0x1E4F30990] + 83) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                      + *((unsigned __int8 *)v39 + 19))
            || v84 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 20))
            || v85 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 21))
            || v86 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 22))
            || v87 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 23))
            || v83 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 24))
            || v88 != *(unsigned __int8 *)(MEMORY[0x1E4F30990] + *((unsigned __int8 *)v39 + 25)))
          {
            goto LABEL_205;
          }
          break;
        default:
          goto LABEL_205;
      }
      size_t v42 = 2;
      goto LABEL_207;
    }
  }
  size_t v42 = strlen(*v40);
  if (v42 != strlen(v39)) {
    goto LABEL_48;
  }
  if (!v42) {
    goto LABEL_71;
  }
  if (*(unsigned __int8 *)(MEMORY[0x1E4F30990] + *v41) != *(unsigned __int8 *)(MEMORY[0x1E4F30990]
                                                                                               + *(unsigned __int8 *)v39))
    goto LABEL_48;
  size_t v43 = 0;
  v44 = v41 + 1;
  int v8 = v107;
  do
  {
    if (v42 - 1 == v43)
    {
      size_t v42 = 0;
      goto LABEL_72;
    }
    int v45 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + v44[v43]);
    int v46 = *(unsigned __int8 *)(MEMORY[0x1E4F30990] + v39[++v43]);
  }
  while (v45 == v46);
  if (v43 < v42) {
    goto LABEL_48;
  }
LABEL_57:
  size_t v42 = 0;
LABEL_71:
  int v8 = v107;
LABEL_72:
  uint64_t v4 = v100;
  v25 = v107;
  v53 = v107;
  v54 = v107;
  v37 = v99;
LABEL_209:
  [v37 numberWithUnsignedInteger:v42];
  [NSNumber numberWithLongLong:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v90 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", @"WebKitIncompleteImageBorderEnabled", MEMORY[0x1E4F1CC38], @"WebKitMediaEnabled", MEMORY[0x1E4F1CC28], @"WebKitMediaDataLoadsAutomatically", MEMORY[0x1E4F1CC28], @"WebKitDisabledAdaptationsMetaTagEnabled", MEMORY[0x1E4F1CC28], @"WebKitMediaControlsScaleWithPageZoom", MEMORY[0x1E4F1CC28], @"WebKitDownloadAttributeEnabled", &unk_1F3C9C918, @"WebKitEditableLinkBehavior", MEMORY[0x1E4F1CC28], @"WebKitMediaControlsContextMenusEnabled", v4, @"WebKitMediaContentTypesRequiringHardwareSupport",
          MEMORY[0x1E4F1CC28],
          @"WebKitEnableInheritURIQueryComponent",
          MEMORY[0x1E4F1CC28],
          @"WebKitEncryptedMediaAPIEnabled",
          MEMORY[0x1E4F1CC28],
          @"WebKitMediaCapabilitiesEnabled",
          &unk_1F3C9C930,
          @"WebKitMaxParseDurationPreferenceKey",
          v105,
          @"WebKitFTPDirectoryTemplatePath",
          MEMORY[0x1E4F1CC38],
          @"WebKitMathMLEnabled",
          v106,
          @"WebKitFantasyFont",
          MEMORY[0x1E4F1CC28],
          @"WebKitLowPowerVideoAudioBufferSizeEnabled",
          MEMORY[0x1E4F1CC38],
          @"WebKitDisplayImagesKey",
          MEMORY[0x1E4F1CC38],
          @"WebKitLoadDeferringEnabled",
          MEMORY[0x1E4F1CC28],
          @"WebKitLinkPreloadEnabled",
          v103,
          @"WebKitFixedFont",
          MEMORY[0x1E4F1CC28],
          @"WebKitLinkPreconnect",
          MEMORY[0x1E4F1CC28],
          @"WebKitForceFTPDirectoryListings",
          MEMORY[0x1E4F1CC38],
          @"WebKitForceWebGLUsesLowPower",
          &unk_1F3C9C948,
          @"WebKitLayoutViewportHeightExpansionFactor",
          &unk_1F3C9C960,
          @"WebKitLayoutFallbackWidth",
          MEMORY[0x1E4F1CC38],
          @"WebKitLargeImageAsyncDecodingEnabled",
          &unk_1F3C9C918,
          @"WebKitJavaScriptRuntimeFlagsPreferenceKey",
          MEMORY[0x1E4F1CC38],
          @"WebKitJavaScriptMarkupEnabled",
          v104,
          @"WebKitJavaScriptCanOpenWindowsAutomatically",
          MEMORY[0x1E4F1CC28],
          @"WebKitJavaScriptCanAccessClipboard");
  if (!v107)
  {
LABEL_212:
    v91 = v107;
    if (v107) {
      goto LABEL_215;
    }
LABEL_217:
    if (v54) {
      goto LABEL_220;
    }
LABEL_222:
    if (v53) {
      goto LABEL_225;
    }
LABEL_227:
    if (v25) {
      goto LABEL_230;
    }
LABEL_232:
    if (v107) {
      goto LABEL_235;
    }
LABEL_237:
    if (v8) {
      goto LABEL_240;
    }
LABEL_242:
    v92 = v107;
    if (v107) {
      goto LABEL_245;
    }
LABEL_247:
    int v93 = *(_DWORD *)v3 - 2;
    if (*(_DWORD *)v3 == 2) {
      goto LABEL_251;
    }
LABEL_248:
    *(_DWORD *)uint64_t v3 = v93;
    int v94 = v93 - 2;
    if (!v94) {
      goto LABEL_252;
    }
    goto LABEL_249;
  }
  if (*(_DWORD *)v107 != 2)
  {
    *(_DWORD *)v107 -= 2;
    goto LABEL_212;
  }
  WTF::StringImpl::destroy(v107, v89);
  v91 = v107;
LABEL_215:
  if (*(_DWORD *)v91 != 2)
  {
    *(_DWORD *)v91 -= 2;
    goto LABEL_217;
  }
  WTF::StringImpl::destroy(v91, v89);
  if (!v54) {
    goto LABEL_222;
  }
LABEL_220:
  if (*(_DWORD *)v54 != 2)
  {
    *(_DWORD *)v54 -= 2;
    goto LABEL_222;
  }
  WTF::StringImpl::destroy(v54, v89);
  if (!v53) {
    goto LABEL_227;
  }
LABEL_225:
  if (*(_DWORD *)v53 != 2)
  {
    *(_DWORD *)v53 -= 2;
    goto LABEL_227;
  }
  WTF::StringImpl::destroy(v53, v89);
  if (!v25) {
    goto LABEL_232;
  }
LABEL_230:
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
    goto LABEL_232;
  }
  WTF::StringImpl::destroy(v25, v89);
  if (!v107) {
    goto LABEL_237;
  }
LABEL_235:
  if (*(_DWORD *)v107 != 2)
  {
    *(_DWORD *)v107 -= 2;
    goto LABEL_237;
  }
  WTF::StringImpl::destroy(v107, v89);
  if (!v8) {
    goto LABEL_242;
  }
LABEL_240:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_242;
  }
  WTF::StringImpl::destroy(v8, v89);
  v92 = v107;
  if (!v107) {
    goto LABEL_247;
  }
LABEL_245:
  if (*(_DWORD *)v92 != 2)
  {
    *(_DWORD *)v92 -= 2;
    goto LABEL_247;
  }
  WTF::StringImpl::destroy(v92, v89);
  int v93 = *(_DWORD *)v3 - 2;
  if (*(_DWORD *)v3 != 2) {
    goto LABEL_248;
  }
LABEL_251:
  WTF::StringImpl::destroy(v3, v89);
  int v94 = *(_DWORD *)v3 - 2;
  if (*(_DWORD *)v3 == 2)
  {
LABEL_252:
    WTF::StringImpl::destroy(MEMORY[0x1E4F30960], v89);
    goto LABEL_253;
  }
LABEL_249:
  *(_DWORD *)uint64_t v3 = v94;
LABEL_253:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "registerDefaults:", v90);
}

- (void)dealloc
{
  [(WebPreferences *)self _updatePrivateBrowsingStateTo:0];
  uint64_t v3 = (const void **)self->_private;
  if (v3)
  {
    uint64_t v4 = v3[2];
    v3[2] = 0;
    if (v4) {
      CFRelease(v4);
    }
    uint64_t v5 = v3[1];
    v3[1] = 0;
    if (v5) {
      CFRelease(v5);
    }
    v6 = *v3;
    *uint64_t v3 = 0;
    if (v6) {
      CFRelease(v6);
    }
    MEMORY[0x1E4E4B240](v3, 0x10C0C4046973748);
  }
  v7.receiver = self;
  v7.super_class = (Class)WebPreferences;
  [(WebPreferences *)&v7 dealloc];
}

- (NSString)identifier
{
  return (NSString *)*((void *)self->_private + 2);
}

- (id)_valueForKey:(id)a3
{
  uint64_t v5 = (NSObject **)self->_private;
  v6 = v5[2];
  if (v6)
  {
    id v7 = (id)[v6 stringByAppendingString:a3];
    uint64_t v5 = (NSObject **)self->_private;
  }
  else
  {
    id v7 = a3;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy_;
  BOOL v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  int v8 = *v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__WebPreferences__valueForKey___block_invoke;
  block[3] = &unk_1E6D97F30;
  block[5] = v7;
  void block[6] = &v12;
  block[4] = self;
  dispatch_sync(v8, block);
  v9 = (void *)v13[5];
  if (!v9)
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", v7);
    v13[5] = (uint64_t)v9;
    if (!v9 && v7 != a3)
    {
      v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", a3);
      v13[5] = (uint64_t)v9;
    }
  }
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __31__WebPreferences__valueForKey___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(*(void *)(a1[4] + 8) + 8) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)_stringValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)_setStringValue:(id)a3 forKey:(id)a4
{
  id v4 = a4;
  if ((objc_msgSend(-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", a4), "isEqualToString:", a3) & 1) == 0)
  {
    id v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      id v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__WebPreferences__setStringValue_forKey___block_invoke;
    block[3] = &unk_1E6D97F58;
    block[4] = self;
    block[5] = a3;
    void block[6] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setObject:forKey:", a3, v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __41__WebPreferences__setStringValue_forKey___block_invoke(void *a1)
{
  return [*(id *)(*(void *)(a1[4] + 8) + 8) setObject:a1[5] forKey:a1[6]];
}

- (id)_stringArrayValueForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)_setStringArrayValueForKey:(id)a3 forKey:(id)a4
{
  id v4 = a4;
  id v7 = (NSObject **)self->_private;
  int v8 = v7[2];
  if (v8)
  {
    id v4 = (id)[v8 stringByAppendingString:a4];
    id v7 = (NSObject **)self->_private;
  }
  long long v9 = *v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WebPreferences__setStringArrayValueForKey_forKey___block_invoke;
  block[3] = &unk_1E6D97F58;
  block[4] = self;
  block[5] = a3;
  void block[6] = v4;
  dispatch_barrier_sync(v9, block);
  if (*((unsigned char *)self->_private + 25)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setObject:forKey:", a3, v4);
  }
  [(WebPreferences *)self _postPreferencesChangedNotification];
}

uint64_t __52__WebPreferences__setStringArrayValueForKey_forKey___block_invoke(void *a1)
{
  return [*(id *)(*(void *)(a1[4] + 8) + 8) setObject:a1[5] forKey:a1[6]];
}

- (int)_integerValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 intValue];
}

- (void)_setIntegerValue:(int)a3 forKey:(id)a4
{
  id v4 = a4;
  if ([(WebPreferences *)self _integerValueForKey:a4] != a3)
  {
    id v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      id v7 = (NSObject **)self->_private;
    }
    long long v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__WebPreferences__setIntegerValue_forKey___block_invoke;
    block[3] = &unk_1E6D97F80;
    int v11 = a3;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setInteger:forKey:", a3, v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __42__WebPreferences__setIntegerValue_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 setObject:v3 forKey:v4];
}

- (unsigned)_unsignedIntValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 unsignedIntValue];
}

- (void)_setUnsignedIntValue:(unsigned int)a3 forKey:(id)a4
{
  id v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ([(WebPreferences *)self _unsignedIntValueForKey:a4] != a3)
  {
    id v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      id v7 = (NSObject **)self->_private;
    }
    long long v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__WebPreferences__setUnsignedIntValue_forKey___block_invoke;
    block[3] = &unk_1E6D97F80;
    int v12 = v5;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25))
    {
      long long v10 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5), v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __46__WebPreferences__setUnsignedIntValue_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 setObject:v3 forKey:v4];
}

- (float)_floatValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  [v3 floatValue];
  return result;
}

- (void)_setFloatValue:(float)a3 forKey:(id)a4
{
  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:");
  if (v7 != a3)
  {
    int v8 = (NSObject **)self->_private;
    long long v9 = v8[2];
    if (v9)
    {
      a4 = (id)[v9 stringByAppendingString:a4];
      int v8 = (NSObject **)self->_private;
    }
    long long v10 = *v8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WebPreferences__setFloatValue_forKey___block_invoke;
    block[3] = &unk_1E6D97F80;
    float v14 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_barrier_sync(v10, block);
    if (*((unsigned char *)self->_private + 25))
    {
      int v11 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      *(float *)&double v12 = a3;
      [v11 setFloat:a4 forKey:v12];
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __40__WebPreferences__setFloatValue_forKey___block_invoke(uint64_t a1, double a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  uint64_t v4 = [NSNumber numberWithFloat:a2];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v3 setObject:v4 forKey:v5];
}

- (BOOL)_BOOLValueForKey:(id)a3
{
  return [(WebPreferences *)self _integerValueForKey:a3] != 0;
}

- (void)_setBoolValue:(BOOL)a3 forKey:(id)a4
{
  id v4 = a4;
  BOOL v5 = a3;
  if ([(WebPreferences *)self _BOOLValueForKey:a4] != a3)
  {
    float v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      float v7 = (NSObject **)self->_private;
    }
    long long v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__WebPreferences__setBoolValue_forKey___block_invoke;
    block[3] = &unk_1E6D97FA8;
    BOOL v11 = v5;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setBool:forKey:", v5, v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __39__WebPreferences__setBoolValue_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 setObject:v3 forKey:v4];
}

- (int64_t)_longLongValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 longLongValue];
}

- (void)_setLongLongValue:(int64_t)a3 forKey:(id)a4
{
  id v4 = a4;
  if ([(WebPreferences *)self _longLongValueForKey:a4] != a3)
  {
    float v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      float v7 = (NSObject **)self->_private;
    }
    long long v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__WebPreferences__setLongLongValue_forKey___block_invoke;
    block[3] = &unk_1E6D97FD0;
    block[5] = v4;
    void block[6] = a3;
    block[4] = self;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25))
    {
      long long v10 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", a3), v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __43__WebPreferences__setLongLongValue_forKey___block_invoke(void *a1)
{
  v2 = *(void **)(*(void *)(a1[4] + 8) + 8);
  uint64_t v3 = [NSNumber numberWithLongLong:a1[6]];
  uint64_t v4 = a1[5];
  return [v2 setObject:v3 forKey:v4];
}

- (unint64_t)_unsignedLongLongValueForKey:(id)a3
{
  id v3 = [(WebPreferences *)self _valueForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 unsignedLongLongValue];
}

- (void)_setUnsignedLongLongValue:(unint64_t)a3 forKey:(id)a4
{
  id v4 = a4;
  if ([(WebPreferences *)self _unsignedLongLongValueForKey:a4] != a3)
  {
    float v7 = (NSObject **)self->_private;
    int v8 = v7[2];
    if (v8)
    {
      id v4 = (id)[v8 stringByAppendingString:v4];
      float v7 = (NSObject **)self->_private;
    }
    long long v9 = *v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__WebPreferences__setUnsignedLongLongValue_forKey___block_invoke;
    block[3] = &unk_1E6D97FD0;
    block[5] = v4;
    void block[6] = a3;
    block[4] = self;
    dispatch_barrier_sync(v9, block);
    if (*((unsigned char *)self->_private + 25))
    {
      long long v10 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3), v4);
    }
    [(WebPreferences *)self _postPreferencesChangedNotification];
  }
}

uint64_t __51__WebPreferences__setUnsignedLongLongValue_forKey___block_invoke(void *a1)
{
  v2 = *(void **)(*(void *)(a1[4] + 8) + 8);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v4 = a1[5];
  return [v2 setObject:v3 forKey:v4];
}

- (NSString)standardFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitStandardFont"];
}

- (void)setStandardFontFamily:(NSString *)standardFontFamily
{
}

- (NSString)fixedFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitFixedFont"];
}

- (void)setFixedFontFamily:(NSString *)fixedFontFamily
{
}

- (NSString)serifFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitSerifFont"];
}

- (void)setSerifFontFamily:(NSString *)serifFontFamily
{
}

- (NSString)sansSerifFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitSansSerifFont"];
}

- (void)setSansSerifFontFamily:(NSString *)sansSerifFontFamily
{
}

- (NSString)cursiveFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitCursiveFont"];
}

- (void)setCursiveFontFamily:(NSString *)cursiveFontFamily
{
}

- (NSString)fantasyFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitFantasyFont"];
}

- (void)setFantasyFontFamily:(NSString *)fantasyFontFamily
{
}

- (int)defaultFontSize
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitDefaultFontSize"];
}

- (void)setDefaultFontSize:(int)defaultFontSize
{
}

- (int)defaultFixedFontSize
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitDefaultFixedFontSize"];
}

- (void)setDefaultFixedFontSize:(int)defaultFixedFontSize
{
}

- (int)minimumFontSize
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitMinimumFontSize"];
}

- (void)setMinimumFontSize:(int)minimumFontSize
{
}

- (int)minimumLogicalFontSize
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitMinimumLogicalFontSize"];
}

- (void)setMinimumLogicalFontSize:(int)minimumLogicalFontSize
{
}

- (NSString)defaultTextEncodingName
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitDefaultTextEncodingName"];
}

- (void)setDefaultTextEncodingName:(NSString *)defaultTextEncodingName
{
}

- (BOOL)userStyleSheetEnabled
{
  return 0;
}

- (NSURL)userStyleSheetLocation
{
  return 0;
}

- (BOOL)shouldPrintBackgrounds
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldPrintBackgroundsPreferenceKey"];
}

- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds
{
}

- (BOOL)isJavaScriptEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitJavaScriptEnabled"];
}

- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled
{
}

- (BOOL)javaScriptCanOpenWindowsAutomatically
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitJavaScriptCanOpenWindowsAutomatically"];
}

- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically
{
}

- (BOOL)arePlugInsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLegacyPluginQuirkForMailSignaturesEnabled"];
}

- (void)setPlugInsEnabled:(BOOL)plugInsEnabled
{
}

- (BOOL)allowsAnimatedImages
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowAnimatedImagesPreferenceKey"];
}

- (void)setAllowsAnimatedImages:(BOOL)allowsAnimatedImages
{
}

- (BOOL)allowsAnimatedImageLooping
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowAnimatedImageLoopingPreferenceKey"];
}

- (void)setAllowsAnimatedImageLooping:(BOOL)allowsAnimatedImageLooping
{
}

- (void)setLoadsImagesAutomatically:(BOOL)loadsImagesAutomatically
{
}

- (BOOL)loadsImagesAutomatically
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDisplayImagesKey"];
}

- (void)setAdditionalSupportedImageTypes:(id)a3
{
}

- (NSArray)additionalSupportedImageTypes
{
  return (NSArray *)[(WebPreferences *)self _stringArrayValueForKey:@"WebKitAdditionalSupportedImageTypesKey"];
}

- (void)setAutosaves:(BOOL)autosaves
{
  *((unsigned char *)self->_private + 25) = autosaves;
}

- (BOOL)autosaves
{
  return *((unsigned char *)self->_private + 25);
}

- (void)setPrivateBrowsingEnabled:(BOOL)privateBrowsingEnabled
{
  BOOL v3 = privateBrowsingEnabled;
  -[WebPreferences _updatePrivateBrowsingStateTo:](self, "_updatePrivateBrowsingStateTo:");
  [(WebPreferences *)self _setBoolValue:v3 forKey:@"WebKitPrivateBrowsingEnabled"];
}

- (BOOL)privateBrowsingEnabled
{
  return *((unsigned char *)self->_private + 24);
}

- (void)_updatePrivateBrowsingStateTo:(BOOL)a3
{
  BOOL v3 = (unsigned __int8 *)self->_private;
  if (v3)
  {
    unsigned int v5 = v3[24];
    if (a3 != v5)
    {
      if (a3 <= v5)
      {
        if (!--webPreferencesInstanceCountWithPrivateBrowsingEnabled)
        {
          unint64_t v7 = 0x8000000000000001;
          {
            globalSessionMap(void)::map = 0;
          }
          WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::remove(&globalSessionMap(void)::map, &v7);
        }
      }
      else
      {
        WebFrameNetworkingContext::ensurePrivateBrowsingSession((WebFrameNetworkingContext *)self);
        ++webPreferencesInstanceCountWithPrivateBrowsingEnabled;
      }
      *((unsigned char *)self->_private + 24) = a3;
    }
  }
}

- (void)setUsesPageCache:(BOOL)usesPageCache
{
}

- (BOOL)usesPageCache
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitUsesPageCachePreferenceKey"];
}

- (void)_postCacheModelChangedNotification
{
  BOOL v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = WebPreferencesCacheModelChangedInternalNotification;
  [v3 postNotificationName:v4 object:self userInfo:0];
}

- (void)setCacheModel:(WebCacheModel)cacheModel
{
  [(WebPreferences *)self _setIntegerValue:cacheModel forKey:@"WebKitCacheModelPreferenceKey"];
  [(WebPreferences *)self setAutomaticallyDetectsCacheModel:0];
  [(WebPreferences *)self _postCacheModelChangedNotification];
}

- (WebCacheModel)cacheModel
{
  return (uint64_t)[(WebPreferences *)self _integerValueForKey:@"WebKitCacheModelPreferenceKey"];
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
}

- (BOOL)suppressesIncrementalRendering
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitSuppressesIncrementalRendering"];
}

- (BOOL)allowsAirPlayForMediaPlayback
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaPlaybackAllowsAirPlay"];
}

- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback
{
}

- (BOOL)isJavaEnabled
{
  return 0;
}

- (BOOL)isDNSPrefetchingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDNSPrefetchingEnabled"];
}

- (void)setDNSPrefetchingEnabled:(BOOL)a3
{
}

- (BOOL)developerExtrasEnabled
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 BOOLForKey:@"DisableWebKitDeveloperExtras"]) {
    return 0;
  }
  if (([v3 BOOLForKey:@"WebKitDeveloperExtras"] & 1) != 0
    || ([v3 BOOLForKey:@"IncludeDebugMenu"] & 1) != 0)
  {
    return 1;
  }
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDeveloperExtrasEnabledPreferenceKey"];
}

- (int)javaScriptRuntimeFlags
{
  return [(WebPreferences *)self _unsignedIntValueForKey:@"WebKitJavaScriptRuntimeFlagsPreferenceKey"];
}

- (void)setJavaScriptRuntimeFlags:(int)a3
{
}

- (void)setDeveloperExtrasEnabled:(BOOL)a3
{
}

- (BOOL)authorAndUserStylesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAuthorAndUserStylesEnabledPreferenceKey"];
}

- (void)setAuthorAndUserStylesEnabled:(BOOL)a3
{
}

- (BOOL)applicationChromeModeEnabled
{
  return 0;
}

- (BOOL)domTimersThrottlingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDOMTimersThrottlingEnabledPreferenceKey"];
}

- (void)setDOMTimersThrottlingEnabled:(BOOL)a3
{
}

- (BOOL)webArchiveDebugModeEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebArchiveDebugModeEnabledPreferenceKey"];
}

- (void)setWebArchiveDebugModeEnabled:(BOOL)a3
{
}

- (BOOL)localFileContentSniffingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLocalFileContentSniffingEnabledPreferenceKey"];
}

- (void)setLocalFileContentSniffingEnabled:(BOOL)a3
{
}

- (BOOL)zoomsTextOnly
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitZoomsTextOnly"];
}

- (void)setZoomsTextOnly:(BOOL)a3
{
}

- (BOOL)javaScriptCanAccessClipboard
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitJavaScriptCanAccessClipboard"];
}

- (void)setJavaScriptCanAccessClipboard:(BOOL)a3
{
}

- (BOOL)shrinksStandaloneImagesToFit
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShrinksStandaloneImagesToFit"];
}

- (void)setShrinksStandaloneImagesToFit:(BOOL)a3
{
}

- (BOOL)automaticallyDetectsCacheModel
{
  return *((unsigned char *)self->_private + 26);
}

- (void)setAutomaticallyDetectsCacheModel:(BOOL)a3
{
  *((unsigned char *)self->_private + 26) = a3;
}

- (BOOL)usesEncodingDetector
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitUsesEncodingDetector"];
}

- (void)setUsesEncodingDetector:(BOOL)a3
{
}

- (BOOL)isWebSecurityEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebSecurityEnabled"];
}

- (void)setWebSecurityEnabled:(BOOL)a3
{
}

- (BOOL)allowUniversalAccessFromFileURLs
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowUniversalAccessFromFileURLs"];
}

- (void)setAllowUniversalAccessFromFileURLs:(BOOL)a3
{
}

- (BOOL)allowFileAccessFromFileURLs
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowFileAccessFromFileURLs"];
}

- (void)setAllowFileAccessFromFileURLs:(BOOL)a3
{
}

- (BOOL)allowTopNavigationToDataURLs
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowTopNavigationToDataURLs"];
}

- (void)setAllowTopNavigationToDataURLs:(BOOL)a3
{
}

- (BOOL)needsStorageAccessFromFileURLsQuirk
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitNeedsStorageAccessFromFileURLsQuirk"];
}

- (void)setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3
{
}

- (double)_backForwardCacheExpirationInterval
{
  [(WebPreferences *)self _floatValueForKey:@"WebKitBackForwardCacheExpirationIntervalKey"];
  return v2;
}

- (BOOL)_standalone
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitStandalonePreferenceKey"];
}

- (void)_setStandalone:(BOOL)a3
{
}

- (void)_setTelephoneNumberParsingEnabled:(BOOL)a3
{
}

- (BOOL)_telephoneNumberParsingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitTelephoneParsingEnabledPreferenceKey"];
}

- (BOOL)contentChangeObserverEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitContentChangeObserverEnabled"];
}

- (void)setContentChangeObserverEnabled:(BOOL)a3
{
}

- (void)_setMinimumZoomFontSize:(float)a3
{
}

- (float)_minimumZoomFontSize
{
  [(WebPreferences *)self _floatValueForKey:@"WebKitMinimumZoomFontSizePreferenceKey"];
  return result;
}

- (void)_setTextAutosizingEnabled:(BOOL)a3
{
}

- (BOOL)_textAutosizingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitTextAutosizingEnabled"];
}

- (void)_setMaxParseDuration:(float)a3
{
}

- (float)_maxParseDuration
{
  [(WebPreferences *)self _floatValueForKey:@"WebKitMaxParseDurationPreferenceKey"];
  return result;
}

- (void)_setAllowMultiElementImplicitFormSubmission:(BOOL)a3
{
}

- (BOOL)_allowMultiElementImplicitFormSubmission
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowMultiElementImplicitFormSubmissionPreferenceKey"];
}

- (void)_setAlwaysRequestGeolocationPermission:(BOOL)a3
{
}

- (BOOL)_alwaysRequestGeolocationPermission
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAlwaysRequestGeolocationPermission"];
}

- (void)_setInterpolationQuality:(int)a3
{
}

- (int)_interpolationQuality
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitInterpolationQualityPreferenceKey"];
}

- (BOOL)_allowPasswordEcho
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitEnablePasswordEchoPreferenceKey"];
}

- (float)_passwordEchoDuration
{
  [(WebPreferences *)self _floatValueForKey:@"WebKitPasswordEchoDurationPreferenceKey"];
  return result;
}

- (int)editableLinkBehavior
{
  int result = [(WebPreferences *)self _integerValueForKey:@"WebKitEditableLinkBehavior"];
  if (result > 4) {
    return 0;
  }
  return result;
}

- (void)setEditableLinkBehavior:(int)a3
{
}

- (int)textDirectionSubmenuInclusionBehavior
{
  int result = [(WebPreferences *)self _integerValueForKey:@"WebKitTextDirectionSubmenuInclusionBehaviorPreferenceKey"];
  if (result > 2) {
    return 0;
  }
  return result;
}

- (void)setTextDirectionSubmenuInclusionBehavior:(int)a3
{
}

- (BOOL)_useSiteSpecificSpoofing
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitUseSiteSpecificSpoofing"];
}

- (void)_setUseSiteSpecificSpoofing:(BOOL)a3
{
}

- (BOOL)databasesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDatabasesEnabledPreferenceKey"];
}

- (void)setDatabasesEnabled:(BOOL)a3
{
}

- (BOOL)storageTrackerEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitStorageTrackerEnabledPreferenceKey"];
}

- (void)setStorageTrackerEnabled:(BOOL)a3
{
}

- (BOOL)localStorageEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLocalStorageEnabledPreferenceKey"];
}

- (void)setLocalStorageEnabled:(BOOL)a3
{
}

+ (id)_getInstanceForIdentifier:(id)a3
{
  if (a3)
  {
    if (byte_1EB3A9819 == 1)
    {
      BOOL v3 = (void *)qword_1EB3A9830;
    }
    else
    {
      BOOL v3 = 0;
      qword_1EB3A9830 = 0;
      byte_1EB3A9819 = 1;
    }
    uint64_t v4 = objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:");
    return (id)[v3 objectForKey:v4];
  }
  else if (_MergedGlobals_22 == 1)
  {
    return (id)qword_1EB3A9828;
  }
  else
  {
    id result = 0;
    qword_1EB3A9828 = 0;
    _MergedGlobals_22 = 1;
  }
  return result;
}

+ (void)_setInstance:(id)a3 forIdentifier:(id)a4
{
  if (!a4) {
    return;
  }
  if ((byte_1EB3A9819 & 1) == 0)
  {
    qword_1EB3A9830 = 0;
    byte_1EB3A9819 = 1;
LABEL_4:
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v8 = (const void *)qword_1EB3A9830;
    qword_1EB3A9830 = (uint64_t)v7;
    if (v8)
    {
      CFRelease(v8);
      id v7 = (id)qword_1EB3A9830;
    }
    goto LABEL_6;
  }
  id v7 = (id)qword_1EB3A9830;
  if (!qword_1EB3A9830) {
    goto LABEL_4;
  }
LABEL_6:
  uint64_t v9 = [a1 _concatenateKeyWithIBCreatorID:a4];
  [v7 setObject:a3 forKey:v9];
}

+ (void)_checkLastReferenceForIdentifier:(id)a3
{
  if (byte_1EB3A9819 == 1)
  {
    if (objc_msgSend((id)objc_msgSend((id)qword_1EB3A9830, "objectForKey:", a3), "retainCount") != 1) {
      return;
    }
  }
  else
  {
    qword_1EB3A9830 = 0;
    byte_1EB3A9819 = 1;
    if (objc_msgSend((id)objc_msgSend(0, "objectForKey:", a3), "retainCount") != 1) {
      return;
    }
  }
  if (byte_1EB3A9819 == 1)
  {
    uint64_t v4 = (void *)qword_1EB3A9830;
    id v5 = a3;
  }
  else
  {
    uint64_t v4 = 0;
    qword_1EB3A9830 = 0;
    byte_1EB3A9819 = 1;
    id v5 = a3;
  }
  [v4 removeObjectForKey:v5];
}

+ (void)_removeReferenceForIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:");
    [a1 performSelector:sel__checkLastReferenceForIdentifier_ withObject:v4 afterDelay:0.1];
  }
}

- (void)_startBatchingUpdates
{
  float v2 = self->_private;
  int v3 = v2[8];
  if (v3)
  {
    int v4 = v3 + 1;
  }
  else
  {
    *((unsigned char *)v2 + 36) = 0;
    float v2 = self->_private;
    int v4 = v2[8] + 1;
  }
  v2[8] = v4;
}

- (void)_stopBatchingUpdates
{
  int v3 = self->_private;
  int v4 = v3[8];
  if (v4)
  {
    int v5 = v4 - 1;
    v3[8] = v5;
    if (v5) {
      return;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorUnbalance.isa, a2);
    int v3 = self->_private;
    int v6 = v3[8] - 1;
    v3[8] = v6;
    if (v6) {
      return;
    }
  }
  char v7 = *((unsigned char *)v3 + 36);
  if ((v7 & 2) != 0)
  {
    if (v7)
    {
      [(WebPreferences *)self _postPreferencesChangedNotification];
    }
    else
    {
      [(WebPreferences *)self _postPreferencesChangedAPINotification];
    }
  }
}

- (void)_batchUpdatePreferencesInBlock:(id)a3
{
  [(WebPreferences *)self _startBatchingUpdates];
  (*((void (**)(id, WebPreferences *))a3 + 2))(a3, self);
  [(WebPreferences *)self _stopBatchingUpdates];
}

- (void)_resetForTesting
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = self->_private;
  int v5 = (const void *)v4[1];
  v4[1] = v3;
  if (v5) {
    CFRelease(v5);
  }
  [(WebPreferences *)self _postPreferencesChangedNotification];
}

- (void)_postPreferencesChangedNotification
{
  float v2 = self->_private;
  if (*((_DWORD *)v2 + 8))
  {
    v2[36] |= 3u;
  }
  else
  {
    int v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:WebPreferencesChangedInternalNotification[0] object:self userInfo:0];
    int v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    int v6 = WebPreferencesChangedNotification;
    [v5 postNotificationName:v6 object:self userInfo:0];
  }
}

- (void)_postPreferencesChangedAPINotification
{
  if (pthread_main_np())
  {
    int v4 = self->_private;
    if (*((_DWORD *)v4 + 8))
    {
      v4[36] |= 2u;
    }
    else
    {
      int v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      int v6 = WebPreferencesChangedNotification;
      [v5 postNotificationName:v6 object:self userInfo:0];
    }
  }
  else
  {
    [(WebPreferences *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

+ (unsigned)_systemCFStringEncoding
{
  return MEMORY[0x1F416BCC0](a1, a2);
}

+ (void)_setInitialDefaultTextEncodingToSystemEncoding
{
  v8[1] = *MEMORY[0x1E4F143B8];
  float v2 = (PAL *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v7 = @"WebKitDefaultTextEncodingName";
  PAL::defaultTextEncodingNameForSystemLanguage((uint64_t *)&v6, v2);
  if (v6) {
    id v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    id v3 = &stru_1F3C7DA90;
  }
  v8[0] = v3;
  -[PAL registerDefaults:](v2, "registerDefaults:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1]);
  int v5 = v6;
  int v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

+ (void)_setIBCreatorID:(id)a3
{
  uint64_t v3 = [a3 copy];
  if (byte_1EB3A981A)
  {
    int v4 = (const void *)qword_1EB3A9838;
    qword_1EB3A9838 = v3;
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    byte_1EB3A981A = 1;
    qword_1EB3A9838 = v3;
  }
}

- (BOOL)isDOMPasteAllowed
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDOMPasteAllowedPreferenceKey"];
}

- (void)setDOMPasteAllowed:(BOOL)a3
{
}

- (NSString)_localStorageDatabasePath
{
  id v2 = [(WebPreferences *)self _stringValueForKey:@"WebKitLocalStorageDatabasePathPreferenceKey"];
  return (NSString *)[v2 stringByStandardizingPath];
}

- (void)_setLocalStorageDatabasePath:(id)a3
{
  uint64_t v4 = [a3 stringByStandardizingPath];
  [(WebPreferences *)self _setStringValue:v4 forKey:@"WebKitLocalStorageDatabasePathPreferenceKey"];
}

- (NSString)_ftpDirectoryTemplatePath
{
  id v2 = [(WebPreferences *)self _stringValueForKey:@"WebKitFTPDirectoryTemplatePath"];
  return (NSString *)[v2 stringByStandardizingPath];
}

- (void)_setFTPDirectoryTemplatePath:(id)a3
{
  uint64_t v4 = [a3 stringByStandardizingPath];
  [(WebPreferences *)self _setStringValue:v4 forKey:@"WebKitFTPDirectoryTemplatePath"];
}

- (BOOL)_forceFTPDirectoryListings
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitForceFTPDirectoryListings"];
}

- (void)_setForceFTPDirectoryListings:(BOOL)a3
{
}

- (BOOL)acceleratedDrawingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAcceleratedDrawingEnabled"];
}

- (void)setAcceleratedDrawingEnabled:(BOOL)a3
{
}

- (BOOL)resourceLoadStatisticsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitResourceLoadStatisticsEnabled"];
}

- (void)setResourceLoadStatisticsEnabled:(BOOL)a3
{
}

- (BOOL)largeImageAsyncDecodingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLargeImageAsyncDecodingEnabled"];
}

- (void)setLargeImageAsyncDecodingEnabled:(BOOL)a3
{
}

- (BOOL)animatedImageAsyncDecodingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAnimatedImageAsyncDecodingEnabled"];
}

- (void)setAnimatedImageAsyncDecodingEnabled:(BOOL)a3
{
}

- (BOOL)canvasUsesAcceleratedDrawing
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCanvasUsesAcceleratedDrawing"];
}

- (void)setCanvasUsesAcceleratedDrawing:(BOOL)a3
{
}

- (BOOL)acceleratedCompositingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAcceleratedCompositingEnabled"];
}

- (void)setAcceleratedCompositingEnabled:(BOOL)a3
{
}

- (BOOL)showDebugBorders
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShowDebugBorders"];
}

- (void)setShowDebugBorders:(BOOL)a3
{
}

- (BOOL)legacyLineLayoutVisualCoverageEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLegacyLineLayoutVisualCoverageEnabled"];
}

- (void)setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3
{
}

- (BOOL)showRepaintCounter
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShowRepaintCounter"];
}

- (void)setShowRepaintCounter:(BOOL)a3
{
}

- (BOOL)webAudioEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebAudioEnabled"];
}

- (void)setWebAudioEnabled:(BOOL)a3
{
}

- (BOOL)webGLEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebGLEnabled"];
}

- (void)setWebGLEnabled:(BOOL)a3
{
}

- (BOOL)forceLowPowerGPUForWebGL
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitForceWebGLUsesLowPower"];
}

- (void)setForceWebGLUsesLowPower:(BOOL)a3
{
}

- (BOOL)asyncFrameScrollingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAsyncFrameScrollingEnabled"];
}

- (void)setAsyncFrameScrollingEnabled:(BOOL)a3
{
}

- (BOOL)isSpatialNavigationEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitSpatialNavigationEnabled"];
}

- (void)setSpatialNavigationEnabled:(BOOL)a3
{
}

- (BOOL)hyperlinkAuditingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitHyperlinkAuditingEnabled"];
}

- (void)setHyperlinkAuditingEnabled:(BOOL)a3
{
}

- (BOOL)usePreHTML5ParserQuirks
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitUsePreHTML5ParserQuirks"];
}

- (void)setUsePreHTML5ParserQuirks:(BOOL)a3
{
}

- (void)didRemoveFromWebView
{
  id v2 = self->_private;
  int v3 = v2[7] - 1;
  v2[7] = v3;
  if (!v3)
  {
    int v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    int v6 = WebPreferencesRemovedNotification[0];
    [v5 postNotificationName:v6 object:self userInfo:0];
  }
}

- (void)willAddToWebView
{
}

- (void)setFullScreenEnabled:(BOOL)a3
{
}

- (BOOL)fullScreenEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitFullScreenEnabled"];
}

- (void)setAsynchronousSpellCheckingEnabled:(BOOL)a3
{
}

- (BOOL)asynchronousSpellCheckingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAsynchronousSpellCheckingEnabled"];
}

+ (void)setWebKitLinkTimeVersion:(int)a3
{
  overriddenWebKitLinkTimeVersion = a3;
}

- (void)setAVFoundationEnabled:(BOOL)a3
{
}

- (BOOL)isAVFoundationEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAVFoundationEnabled"];
}

- (BOOL)isAVFoundationNSURLSessionEnabled
{
  return 1;
}

- (BOOL)isInheritURIQueryComponentEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitEnableInheritURIQueryComponent"];
}

- (void)setEnableInheritURIQueryComponent:(BOOL)a3
{
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaPlaybackAllowsAirPlay"];
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3
{
}

- (unsigned)audioSessionCategoryOverride
{
  return [(WebPreferences *)self _unsignedIntValueForKey:@"WebKitAudioSessionCategoryOverride"];
}

- (void)setAudioSessionCategoryOverride:(unsigned int)a3
{
  if (a3 >= 7)
  {
    if ((int)a3 > 1886547810)
    {
      switch(a3)
      {
        case 0x70726F63u:
          *(void *)&a3 = 6;
          goto LABEL_7;
        case 0x72656361u:
          *(void *)&a3 = 4;
          goto LABEL_7;
        case 0x736F6C6Fu:
          *(void *)&a3 = 2;
          goto LABEL_7;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x616D6269u:
          *(void *)&a3 = 1;
          goto LABEL_7;
        case 0x6D656469u:
          *(void *)&a3 = 3;
          goto LABEL_7;
        case 0x706C6172u:
          *(void *)&a3 = 5;
          goto LABEL_7;
      }
    }
    *(void *)&a3 = 0;
  }
LABEL_7:
  [(WebPreferences *)self _setUnsignedIntValue:*(void *)&a3 forKey:@"WebKitAudioSessionCategoryOverride"];
}

- (BOOL)networkDataUsageTrackingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitNetworkDataUsageTrackingEnabledPreferenceKey"];
}

- (void)setNetworkDataUsageTrackingEnabled:(BOOL)a3
{
}

- (NSString)networkInterfaceName
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitNetworkInterfaceNamePreferenceKey"];
}

- (void)setNetworkInterfaceName:(id)a3
{
}

- (BOOL)mediaPlaybackRequiresUserGesture
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaPlaybackRequiresUserGesture"];
}

- (void)setMediaPlaybackRequiresUserGesture:(BOOL)a3
{
}

- (BOOL)videoPlaybackRequiresUserGesture
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitVideoPlaybackRequiresUserGesture"];
}

- (void)setVideoPlaybackRequiresUserGesture:(BOOL)a3
{
}

- (BOOL)audioPlaybackRequiresUserGesture
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAudioPlaybackRequiresUserGesture"];
}

- (void)setAudioPlaybackRequiresUserGesture:(BOOL)a3
{
}

- (BOOL)overrideUserGestureRequirementForMainContent
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMainContentUserGestureOverrideEnabled"];
}

- (void)setOverrideUserGestureRequirementForMainContent:(BOOL)a3
{
}

- (BOOL)mediaPlaybackAllowsInline
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaPlaybackAllowsInline"];
}

- (void)setMediaPlaybackAllowsInline:(BOOL)a3
{
}

- (BOOL)inlineMediaPlaybackRequiresPlaysInlineAttribute
{
  return [(WebPreferences *)self _BOOLValueForKey:@"InlineMediaPlaybackRequiresPlaysInlineAttribute"];
}

- (void)setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3
{
}

- (BOOL)invisibleAutoplayNotPermitted
{
  return [(WebPreferences *)self _BOOLValueForKey:@"InvisibleAutoplayNotPermitted"];
}

- (void)setInvisibleAutoplayNotPermitted:(BOOL)a3
{
}

- (BOOL)mediaControlsScaleWithPageZoom
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaControlsScaleWithPageZoom"];
}

- (void)setMediaControlsScaleWithPageZoom:(BOOL)a3
{
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowsPictureInPictureMediaPlayback"];
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)a3
{
}

- (BOOL)mockScrollbarsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMockScrollbarsEnabled"];
}

- (void)setMockScrollbarsEnabled:(BOOL)a3
{
}

- (NSString)pictographFontFamily
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitPictographFont"];
}

- (void)setPictographFontFamily:(id)a3
{
}

- (BOOL)pageCacheSupportsPlugins
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitPageCacheSupportsPluginsPreferenceKey"];
}

- (void)setPageCacheSupportsPlugins:(BOOL)a3
{
}

- (void)_invalidateCachedPreferences
{
  int v3 = *(NSObject **)self->_private;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WebPreferences_WebPrivate___invalidateCachedPreferences__block_invoke;
  block[3] = &unk_1E6D97D30;
  block[4] = self;
  dispatch_barrier_sync(v3, block);
  [(WebPreferences *)self _updatePrivateBrowsingStateTo:[(WebPreferences *)self privateBrowsingEnabled]];
  [(WebPreferences *)self _postPreferencesChangedNotification];
}

void __58__WebPreferences_WebPrivate___invalidateCachedPreferences__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(const void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (void)_synchronizeWebStoragePolicyWithCookiePolicy
{
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F18D30], "sharedHTTPCookieStorage"), "cookieAcceptPolicy");
  if ((v3 & 0xFFFFFFFC) != 0)
  {
    uint64_t v4 = 2;
    int v5 = self;
  }
  else
  {
    uint64_t v4 = dword_1E149DE30[v3];
    int v5 = self;
  }
  [(WebPreferences *)v5 setStorageBlockingPolicy:v4];
}

- (void)setBackspaceKeyNavigationEnabled:(BOOL)a3
{
}

- (BOOL)backspaceKeyNavigationEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitBackspaceKeyNavigationEnabled"];
}

- (void)setWantsBalancedSetDefersLoadingBehavior:(BOOL)a3
{
}

- (BOOL)wantsBalancedSetDefersLoadingBehavior
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWantsBalancedSetDefersLoadingBehavior"];
}

- (void)setShouldDisplaySubtitles:(BOOL)a3
{
}

- (BOOL)shouldDisplaySubtitles
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldDisplaySubtitles"];
}

- (void)setShouldDisplayCaptions:(BOOL)a3
{
}

- (BOOL)shouldDisplayCaptions
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldDisplayCaptions"];
}

- (void)setShouldDisplayTextDescriptions:(BOOL)a3
{
}

- (BOOL)shouldDisplayTextDescriptions
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldDisplayTextDescriptions"];
}

- (void)setNotificationsEnabled:(BOOL)a3
{
}

- (BOOL)notificationsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitNotificationsEnabled"];
}

- (void)setShouldRespectImageOrientation:(BOOL)a3
{
}

- (BOOL)shouldRespectImageOrientation
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldRespectImageOrientation"];
}

- (void)setIncrementalRenderingSuppressionTimeoutInSeconds:(double)a3
{
  *(float *)&a3 = a3;
  [(WebPreferences *)self _setFloatValue:@"WebKitIncrementalRenderingSuppressionTimeoutInSeconds" forKey:a3];
}

- (double)incrementalRenderingSuppressionTimeoutInSeconds
{
  [(WebPreferences *)self _floatValueForKey:@"WebKitIncrementalRenderingSuppressionTimeoutInSeconds"];
  return v2;
}

- (BOOL)diagnosticLoggingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDiagnosticLoggingEnabled"];
}

- (void)setDiagnosticLoggingEnabled:(BOOL)a3
{
}

- (void)setStorageBlockingPolicy:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = @"WebKitStorageBlockingPolicy";
  v6[0] = [NSNumber numberWithUnsignedInt:v3];
  objc_msgSend(v4, "registerDefaults:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (int)storageBlockingPolicy
{
  return [(WebPreferences *)self _integerValueForKey:@"WebKitStorageBlockingPolicy"];
}

- (BOOL)plugInSnapshottingEnabled
{
  return 0;
}

- (BOOL)hiddenPageDOMTimerThrottlingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitHiddenPageDOMTimerThrottlingEnabled"];
}

- (void)setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3
{
}

- (BOOL)hiddenPageCSSAnimationSuspensionEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitHiddenPageCSSAnimationSuspensionEnabled"];
}

- (void)setHiddenPageCSSAnimationSuspensionEnabled:(BOOL)a3
{
}

- (BOOL)lowPowerVideoAudioBufferSizeEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLowPowerVideoAudioBufferSizeEnabled"];
}

- (void)setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3
{
}

- (BOOL)mediaSourceEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaSourceEnabled"];
}

- (void)setMediaSourceEnabled:(BOOL)a3
{
}

- (BOOL)sourceBufferChangeTypeEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitSourceBufferChangeTypeEnabled"];
}

- (void)setSourceBufferChangeTypeEnabled:(BOOL)a3
{
}

- (BOOL)imageControlsEnabled
{
  return 0;
}

- (BOOL)serviceControlsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitServiceControlsEnabled"];
}

- (void)setServiceControlsEnabled:(BOOL)a3
{
}

- (BOOL)gamepadsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitGamepadsEnabled"];
}

- (void)setGamepadsEnabled:(BOOL)a3
{
}

- (BOOL)shouldConvertPositionStyleOnCopy
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitShouldConvertPositionStyleOnCopy"];
}

- (void)setShouldConvertPositionStyleOnCopy:(BOOL)a3
{
}

- (NSString)mediaKeysStorageDirectory
{
  id v2 = [(WebPreferences *)self _stringValueForKey:@"WebKitMediaKeysStorageDirectory"];
  return (NSString *)[v2 stringByStandardizingPath];
}

- (void)setMediaKeysStorageDirectory:(id)a3
{
}

- (BOOL)mediaDevicesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaDevicesEnabled"];
}

- (void)setMediaDevicesEnabled:(BOOL)a3
{
}

- (BOOL)mediaStreamEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaStreamEnabled"];
}

- (void)setMediaStreamEnabled:(BOOL)a3
{
}

- (BOOL)peerConnectionEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitPeerConnectionEnabled"];
}

- (void)setPeerConnectionEnabled:(BOOL)a3
{
}

- (BOOL)linkPreloadEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLinkPreloadEnabled"];
}

- (void)setLinkPreloadEnabled:(BOOL)a3
{
}

- (BOOL)mediaPreloadingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaPreloadingEnabled"];
}

- (void)setMediaPreloadingEnabled:(BOOL)a3
{
}

- (void)setHTTPEquivEnabled:(BOOL)a3
{
}

- (BOOL)httpEquivEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitHTTPEquivEnabled"];
}

- (BOOL)javaScriptMarkupEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitJavaScriptMarkupEnabled"];
}

- (void)setJavaScriptMarkupEnabled:(BOOL)a3
{
}

- (BOOL)mediaDataLoadsAutomatically
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaDataLoadsAutomatically"];
}

- (void)setMediaDataLoadsAutomatically:(BOOL)a3
{
}

- (BOOL)attachmentElementEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAttachmentElementEnabled"];
}

- (void)setAttachmentElementEnabled:(BOOL)a3
{
}

- (BOOL)allowsInlineMediaPlaybackAfterFullscreen
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowsInlineMediaPlaybackAfterFullscreen"];
}

- (void)setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3
{
}

- (BOOL)mockCaptureDevicesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMockCaptureDevicesEnabled"];
}

- (void)setMockCaptureDevicesEnabled:(BOOL)a3
{
}

- (BOOL)mockCaptureDevicesPromptEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMockCaptureDevicesPromptEnabled"];
}

- (void)setMockCaptureDevicesPromptEnabled:(BOOL)a3
{
}

- (BOOL)enumeratingAllNetworkInterfacesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitEnumeratingAllNetworkInterfacesEnabled"];
}

- (void)setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3
{
}

- (BOOL)iceCandidateFilteringEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitICECandidateFilteringEnabled"];
}

- (void)setIceCandidateFilteringEnabled:(BOOL)a3
{
}

- (BOOL)mediaCaptureRequiresSecureConnection
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaCaptureRequiresSecureConnection"];
}

- (void)setMediaCaptureRequiresSecureConnection:(BOOL)a3
{
}

- (BOOL)dataTransferItemsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDataTransferItemsEnabled"];
}

- (void)setDataTransferItemsEnabled:(BOOL)a3
{
}

- (BOOL)customPasteboardDataEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCustomPasteboardDataEnabled"];
}

- (void)setCustomPasteboardDataEnabled:(BOOL)a3
{
}

- (BOOL)cacheAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCacheAPIEnabled"];
}

- (void)setCacheAPIEnabled:(BOOL)a3
{
}

- (BOOL)downloadAttributeEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDownloadAttributeEnabled"];
}

- (void)setDownloadAttributeEnabled:(BOOL)a3
{
}

- (void)setDirectoryUploadEnabled:(BOOL)a3
{
}

- (BOOL)directoryUploadEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDirectoryUploadEnabled"];
}

- (BOOL)CSSOMViewScrollingAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCSSOMViewScrollingAPIEnabled"];
}

- (void)setCSSOMViewScrollingAPIEnabled:(BOOL)a3
{
}

- (BOOL)mediaUserGestureInheritsFromDocument
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaUserGestureInheritsFromDocument"];
}

- (void)setMediaUserGestureInheritsFromDocument:(BOOL)a3
{
}

- (BOOL)quickLookDocumentSavingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitQuickLookDocumentSavingPreferenceKey"];
}

- (void)setQuickLookDocumentSavingEnabled:(BOOL)a3
{
}

- (NSString)mediaContentTypesRequiringHardwareSupport
{
  return (NSString *)[(WebPreferences *)self _stringValueForKey:@"WebKitMediaContentTypesRequiringHardwareSupport"];
}

- (void)setMediaContentTypesRequiringHardwareSupport:(id)a3
{
}

- (BOOL)legacyEncryptedMediaAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLegacyEncryptedMediaAPIEnabled"];
}

- (void)setLegacyEncryptedMediaAPIEnabled:(BOOL)a3
{
}

- (BOOL)encryptedMediaAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitEncryptedMediaAPIEnabled"];
}

- (void)setEncryptedMediaAPIEnabled:(BOOL)a3
{
}

- (BOOL)pictureInPictureAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitPictureInPictureAPIEnabled"];
}

- (void)setPictureInPictureAPIEnabled:(BOOL)a3
{
}

- (BOOL)colorFilterEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitColorFilterEnabled"];
}

- (void)setColorFilterEnabled:(BOOL)a3
{
}

- (BOOL)punchOutWhiteBackgroundsInDarkMode
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitPunchOutWhiteBackgroundsInDarkMode"];
}

- (void)setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3
{
}

- (BOOL)allowMediaContentTypesRequiringHardwareSupportAsFallback
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAllowMediaContentTypesRequiringHardwareSupportAsFallback"];
}

- (void)setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3
{
}

- (BOOL)mediaCapabilitiesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaCapabilitiesEnabled"];
}

- (void)setMediaCapabilitiesEnabled:(BOOL)a3
{
}

- (BOOL)layoutFormattingContextIntegrationEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLayoutFormattingContextIntegrationEnabled"];
}

- (void)setLayoutFormattingContextIntegrationEnabled:(BOOL)a3
{
}

- (BOOL)isInAppBrowserPrivacyEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitDebugInAppBrowserPrivacyEnabled"];
}

- (void)setInAppBrowserPrivacyEnabled:(BOOL)a3
{
}

- (BOOL)webSQLEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebSQLEnabled"];
}

- (void)setWebSQLEnabled:(BOOL)a3
{
}

+ (id)_IBCreatorID
{
  if (byte_1EB3A981A == 1) {
    return (id)qword_1EB3A9838;
  }
  id result = 0;
  qword_1EB3A9838 = 0;
  byte_1EB3A981A = 1;
  return result;
}

+ (id)_concatenateKeyWithIBCreatorID:(id)a3
{
  id v4 = +[WebPreferences _IBCreatorID];
  if (!v4) {
    return a3;
  }
  return (id)[v4 stringByAppendingString:a3];
}

- (BOOL)_isEnabledForFeature:(id)a3
{
  uint64_t v4 = [a3 preferenceKey];
  return [(WebPreferences *)self _BOOLValueForKey:v4];
}

- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [a4 preferenceKey];
  [(WebPreferences *)self _setBoolValue:v4 forKey:v6];
}

+ (void)_switchNetworkLoaderToNewTestingSession
{
  id v2 = (NetworkStorageSessionMap *)WebThreadLock();
  NetworkStorageSessionMap::switchToNewTestingSession(v2);
}

+ (void)_setCurrentNetworkLoaderSessionCookieAcceptPolicy:(unint64_t)a3
{
  {
    uint64_t v3 = (WebCore::NetworkStorageSession *)defaultNetworkStorageSession(void)::session;
    if (defaultNetworkStorageSession(void)::session) {
      goto LABEL_8;
    }
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  BOOL v4 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v5.m_identifier = 1;
  uint64_t v3 = (WebCore::NetworkStorageSession *)WebCore::NetworkStorageSession::NetworkStorageSession(v4, v5);
  {
    uint64_t v6 = defaultNetworkStorageSession(void)::session;
    defaultNetworkStorageSession(void)::session = (uint64_t)v3;
    if (v6)
    {
      MEMORY[0x1E4E470D0](v6);
      if (*(_DWORD *)(v6 + 8))
      {
        *(void *)(v6 + 288) = 0;
        *(_OWORD *)(v6 + 256) = 0u;
        *(_OWORD *)(v6 + 272) = 0u;
        *(_OWORD *)(v6 + 224) = 0u;
        *(_OWORD *)(v6 + 240) = 0u;
        *(_OWORD *)(v6 + 192) = 0u;
        *(_OWORD *)(v6 + 208) = 0u;
        *(_OWORD *)(v6 + 160) = 0u;
        *(_OWORD *)(v6 + 176) = 0u;
        *(_OWORD *)(v6 + 128) = 0u;
        *(_OWORD *)(v6 + 144) = 0u;
        *(_OWORD *)(v6 + 96) = 0u;
        *(_OWORD *)(v6 + 112) = 0u;
        *(_OWORD *)(v6 + 64) = 0u;
        *(_OWORD *)(v6 + 80) = 0u;
        *(_OWORD *)(v6 + 32) = 0u;
        *(_OWORD *)(v6 + 48) = 0u;
        *(_OWORD *)uint64_t v6 = 0u;
        *(_OWORD *)(v6 + 16) = 0u;
      }
      else
      {
        WTF::fastFree((WTF *)v6, v7);
      }
      uint64_t v3 = (WebCore::NetworkStorageSession *)defaultNetworkStorageSession(void)::session;
    }
LABEL_8:
    WebCore::NetworkStorageSession::cookieStorage((uint64_t *)&cf, v3);
    if (cf) {
      goto LABEL_9;
    }
LABEL_15:
    __break(0xC471u);
    return;
  }
  defaultNetworkStorageSession(void)::session = (uint64_t)v3;
  WebCore::NetworkStorageSession::cookieStorage((uint64_t *)&cf, v3);
  if (!cf) {
    goto LABEL_15;
  }
LABEL_9:
  CFHTTPCookieStorageSetCookieAcceptPolicy();
  CFTypeRef v8 = cf;
  CFTypeRef cf = 0;
  if (v8) {
    CFRelease(v8);
  }
}

+ (void)_clearNetworkLoaderSession:(id)a3
{
  {
    if (defaultNetworkStorageSession(void)::session) {
      goto LABEL_7;
    }
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  BOOL v4 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v5.m_identifier = 1;
  WebCore::NetworkStorageSession::NetworkStorageSession(v4, v5);
  {
    uint64_t v6 = defaultNetworkStorageSession(void)::session;
    defaultNetworkStorageSession(void)::session = (uint64_t)v4;
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = MEMORY[0x1E4E470D0]();
    if (*(_DWORD *)(v7 + 8))
    {
      *(void *)(v7 + 288) = 0;
      *(_OWORD *)(v7 + 256) = 0u;
      *(_OWORD *)(v7 + 272) = 0u;
      *(_OWORD *)(v7 + 224) = 0u;
      *(_OWORD *)(v7 + 240) = 0u;
      *(_OWORD *)(v7 + 192) = 0u;
      *(_OWORD *)(v7 + 208) = 0u;
      *(_OWORD *)(v7 + 160) = 0u;
      *(_OWORD *)(v7 + 176) = 0u;
      *(_OWORD *)(v7 + 128) = 0u;
      *(_OWORD *)(v7 + 144) = 0u;
      *(_OWORD *)(v7 + 96) = 0u;
      *(_OWORD *)(v7 + 112) = 0u;
      *(_OWORD *)(v7 + 64) = 0u;
      *(_OWORD *)(v7 + 80) = 0u;
      *(_OWORD *)(v7 + 32) = 0u;
      *(_OWORD *)(v7 + 48) = 0u;
      *(_OWORD *)uint64_t v7 = 0u;
      *(_OWORD *)(v7 + 16) = 0u;
        goto LABEL_7;
    }
    else
    {
      WTF::fastFree((WTF *)v7, v8);
        goto LABEL_7;
    }
    defaultNetworkStorageSession(void)::session = 0;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = (uint64_t)v4;
  }
LABEL_7:
  uint64_t v9 = _Block_copy(a3);
  long long v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *long long v10 = &unk_1F3C7D728;
  v10[1] = v9;
  BOOL v11 = v10;
  WebCore::NetworkStorageSession::deleteAllCookies();
  if (v11) {
    (*(void (**)(void *))(*v11 + 8))(v11);
  }
  _Block_release(0);
}

- (void)_setDoublePreferenceForTestingWithValue:(double)a3 forKey:(id)a4
{
  *(float *)&a3 = a3;
  [(WebPreferences *)self _setFloatValue:a4 forKey:a3];
}

- (BOOL)userGesturePromisePropagationEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitUserGesturePromisePropagationEnabled"];
}

- (void)setUserGesturePromisePropagationEnabled:(BOOL)a3
{
}

- (BOOL)requestIdleCallbackEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitRequestIdleCallbackEnabled"];
}

- (void)setRequestIdleCallbackEnabled:(BOOL)a3
{
}

- (BOOL)highlightAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitHighlightAPIEnabled"];
}

- (void)setHighlightAPIEnabled:(BOOL)a3
{
}

- (BOOL)asyncClipboardAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitAsyncClipboardAPIEnabled"];
}

- (void)setAsyncClipboardAPIEnabled:(BOOL)a3
{
}

- (BOOL)contactPickerAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitContactPickerAPIEnabled"];
}

- (void)setContactPickerAPIEnabled:(BOOL)a3
{
}

- (BOOL)visualViewportAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitVisualViewportAPIEnabled"];
}

- (void)setVisualViewportAPIEnabled:(BOOL)a3
{
}

- (BOOL)CSSOMViewSmoothScrollingEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCSSOMViewSmoothScrollingEnabled"];
}

- (void)setCSSOMViewSmoothScrollingEnabled:(BOOL)a3
{
}

- (BOOL)webAnimationsCompositeOperationsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebAnimationsCompositeOperationsEnabled"];
}

- (void)setWebAnimationsCompositeOperationsEnabled:(BOOL)a3
{
}

- (BOOL)webAnimationsMutableTimelinesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebAnimationsMutableTimelinesEnabled"];
}

- (void)setWebAnimationsMutableTimelinesEnabled:(BOOL)a3
{
}

- (BOOL)privateClickMeasurementEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitPrivateClickMeasurementEnabled"];
}

- (void)setPrivateClickMeasurementEnabled:(BOOL)a3
{
}

- (BOOL)genericCueAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitGenericCueAPIEnabled"];
}

- (void)setGenericCueAPIEnabled:(BOOL)a3
{
}

- (BOOL)coreMathMLEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitCoreMathMLEnabled"];
}

- (void)setCoreMathMLEnabled:(BOOL)a3
{
}

- (BOOL)linkPreloadResponsiveImagesEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitLinkPreloadResponsiveImagesEnabled"];
}

- (void)setLinkPreloadResponsiveImagesEnabled:(BOOL)a3
{
}

- (BOOL)remotePlaybackEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitRemotePlaybackEnabled"];
}

- (void)setRemotePlaybackEnabled:(BOOL)a3
{
}

- (BOOL)readableByteStreamAPIEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitReadableByteStreamAPIEnabled"];
}

- (void)setReadableByteStreamAPIEnabled:(BOOL)a3
{
}

- (BOOL)_mediaRecorderEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaRecorderEnabled"];
}

- (void)_setMediaRecorderEnabled:(BOOL)a3
{
}

- (BOOL)mediaRecorderEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitMediaRecorderEnabled"];
}

- (void)setMediaRecorderEnabled:(BOOL)a3
{
}

- (BOOL)_speechRecognitionEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitSpeechRecognitionEnabled"];
}

- (void)_setSpeechRecognitionEnabled:(BOOL)a3
{
}

- (int)_pitchCorrectionAlgorithm
{
  return [(WebPreferences *)self _unsignedIntValueForKey:@"WebKitPitchCorrectionAlgorithm"];
}

- (void)_setPitchCorrectionAlgorithm:(int)a3
{
}

- (BOOL)constantPropertiesEnabled
{
  return 1;
}

- (BOOL)maskWebGLStringsEnabled
{
  return 1;
}

- (BOOL)CSSCustomPropertiesAndValuesEnabled
{
  return 1;
}

- (BOOL)syntheticEditingCommandsEnabled
{
  return 1;
}

- (BOOL)allowCrossOriginSubresourcesToAskForCredentials
{
  return 0;
}

- (BOOL)aspectRatioOfImgFromWidthAndHeightEnabled
{
  return 1;
}

- (BOOL)resizeObserverEnabled
{
  return 1;
}

- (void)setSubpixelCSSOMElementMetricsEnabled:(BOOL)a3
{
}

- (BOOL)subpixelCSSOMElementMetricsEnabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitSubpixelCSSOMElementMetricsEnabled"];
}

- (BOOL)userTimingEnabled
{
  return 1;
}

- (BOOL)requestAnimationFrameEnabled
{
  return 1;
}

- (BOOL)resourceTimingEnabled
{
  return 1;
}

- (BOOL)cssShadowPartsEnabled
{
  return 1;
}

- (BOOL)isSecureContextAttributeEnabled
{
  return 1;
}

- (BOOL)fetchAPIEnabled
{
  return 1;
}

- (BOOL)fetchAPIKeepAliveEnabled
{
  return 1;
}

- (BOOL)intersectionObserverEnabled
{
  return 1;
}

- (BOOL)shadowDOMEnabled
{
  return 1;
}

- (BOOL)customElementsEnabled
{
  return 1;
}

- (BOOL)keygenElementEnabled
{
  return 0;
}

- (BOOL)isVideoPluginProxyEnabled
{
  return 0;
}

- (BOOL)isHixie76WebSocketProtocolEnabled
{
  return 0;
}

- (BOOL)accelerated2dCanvasEnabled
{
  return 0;
}

- (BOOL)experimentalNotificationsEnabled
{
  return 0;
}

- (BOOL)selectionAcrossShadowBoundariesEnabled
{
  return 1;
}

- (BOOL)isXSSAuditorEnabled
{
  return 0;
}

- (BOOL)subpixelAntialiasedLayerTextEnabled
{
  return 0;
}

- (BOOL)webGL2Enabled
{
  return [(WebPreferences *)self _BOOLValueForKey:@"WebKitWebGLEnabled"];
}

- (BOOL)loadsSiteIconsIgnoringImageLoadingPreference
{
  return 0;
}

- (BOOL)displayListDrawingEnabled
{
  return 0;
}

- (BOOL)transformStreamAPIEnabled
{
  return 1;
}

- (BOOL)lineHeightUnitsEnabled
{
  return 1;
}

- (BOOL)CSSIndividualTransformPropertiesEnabled
{
  return 1;
}

- (BOOL)serverTimingEnabled
{
  return 1;
}

- (BOOL)offlineWebApplicationCacheEnabled
{
  return 0;
}

- (int64_t)applicationCacheTotalQuota
{
  return 0;
}

- (int64_t)applicationCacheDefaultOriginQuota
{
  return 0;
}

+ (id)_experimentalFeatures
{
  v400[196] = *MEMORY[0x1E4F143B8];
  if ((_MergedGlobals_23 & 1) == 0)
  {
    LOWORD(v16) = 1;
    v212 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"GrammarAndSpellingPseudoElementsEnabled", @"WebKitGrammarAndSpellingPseudoElementsEnabled", @"::grammar-error and ::spelling-error pseudo-elements", 6, 2, @"Enable the ::grammar-error and ::spelling-error CSS pseudo-elements", v16);
    v400[0] = v212;
    LOWORD(v17) = 0;
    v399 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"TargetTextPseudoElementEnabled", @"WebKitTargetTextPseudoElementEnabled", @"::target-text pseudo-element", 6, 2, @"Enable the ::target-text CSS pseudo-element", v17);
    v400[1] = v399;
    LOWORD(v18) = 0;
    v398 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ThumbAndTrackPseudoElementsEnabled", @"WebKitThumbAndTrackPseudoElementsEnabled", @"::thumb and ::track pseudo-elements", 4, 2, @"Enable support for CSS ::thumb and ::track pseudo-elements", v18);
    v400[2] = v398;
    LOWORD(v19) = 0;
    v397 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SelectShowPickerEnabled", @"WebKitSelectShowPickerEnabled", @"<select> showPicker() method", 4, 3, @"Enable showPicker() method on <select>", v19);
    v400[3] = v397;
    LOWORD(v20) = 1;
    v396 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PageAtRuleMarginDescriptorsEnabled", @"WebKitPageAtRuleMarginDescriptorsEnabled", @"@page CSS at-rule margin descriptors", 6, 2, @"Enable support for @page margin descriptors", v20);
    v400[4] = v396;
    LOWORD(v21) = 1;
    v395 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AbortSignalAnyOperationEnabled", @"WebKitAbortSignalAnyOperationEnabled", @"AbortSignal.any() API", 6, 3, @"Enable AbortSignal.any() API", v21);
    v400[5] = v395;
    LOWORD(v22) = 0;
    v394 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AccessHandleEnabled", @"WebKitAccessHandleEnabled", @"AccessHandle API", 6, 3, @"Enable AccessHandle API", v22);
    v400[6] = v394;
    LOWORD(v23) = 1;
    v393 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AllowWebGLInWorkers", @"WebKitAllowWebGLInWorkers", @"Allow WebGL in Web Workers", 6, 3, &stru_1F3C7DA90, v23);
    v400[7] = v393;
    LOWORD(v24) = 0;
    v392 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PerElementSpeakerSelectionEnabled", @"WebKitPerElementSpeakerSelectionEnabled", @"Allow per media element speaker device selection", 4, 5, @"Allow per media element speaker device selection", v24);
    v400[8] = v392;
    LOWORD(v25) = 0;
    v391 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ExposeSpeakersEnabled", @"WebKitExposeSpeakersEnabled", @"Allow speaker device selection", 4, 5, @"Allow speaker device selection", v25);
    v400[9] = v391;
    LOWORD(v26) = 1;
    v390 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AllowUniversalAccessFromFileURLs", @"WebKitAllowUniversalAccessFromFileURLs", @"Allow universal access from file: URLs", 3, 8, &stru_1F3C7DA90, v26);
    v400[10] = v390;
    LOWORD(v27) = 1;
    v389 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AlternateWebMPlayerEnabled", @"WebKitAlternateWebMPlayerEnabled", @"Alternate WebM Player", 6, 5, @"Enable Alternate WebM Player", v27);
    v400[11] = v389;
    LOWORD(v28) = 0;
    v388 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ExtendedAudioDescriptionsEnabled", @"WebKitExtendedAudioDescriptionsEnabled", @"Audio descriptions for video - Extended", 5, 5, @"Enable extended audio descriptions for video", v28);
    v400[12] = v388;
    LOWORD(v29) = 0;
    v387 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AudioDescriptionsEnabled", @"WebKitAudioDescriptionsEnabled", @"Audio descriptions for video - Standard", 5, 5, @"Enable standard audio descriptions for video", v29);
    v400[13] = v387;
    LOWORD(v30) = 0;
    v386 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DOMAudioSessionEnabled", @"WebKitDOMAudioSessionEnabled", @"AudioSession API", 6, 5, @"Enable AudioSession API", v30);
    v400[14] = v386;
    LOWORD(v31) = 0;
    v385 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DOMAudioSessionFullEnabled", @"WebKitDOMAudioSessionFullEnabled", @"AudioSession full API", 4, 5, @"Enable AudioSession full API", v31);
    v400[15] = v385;
    LOWORD(v32) = 0;
    v384 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"BroadcastChannelEnabled", @"WebKitBroadcastChannelEnabled", @"BroadcastChannel API", 6, 3, @"BroadcastChannel API", v32);
    v400[16] = v384;
    LOWORD(v33) = 1;
    v383 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"BroadcastChannelOriginPartitioningEnabled", @"WebKitBroadcastChannelOriginPartitioningEnabled", @"BroadcastChannel Origin Partitioning", 6, 3, @"BroadcastChannel Origin Partitioning", v33);
    v400[17] = v383;
    LOWORD(v34) = 0;
    v382 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSS3DTransformBackfaceVisibilityInteroperabilityEnabled", @"WebKitCSS3DTransformBackfaceVisibilityInteroperabilityEnabled", @"CSS 3D Transform Interoperability for backface-visibility", 5, 2, @"Enable 3D transform behavior for backface-visibility that is specification-compliant but backwards incompatible", v34);
    v400[18] = v382;
    LOWORD(v35) = 0;
    v381 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSCounterStyleAtRuleImageSymbolsEnabled", @"WebKitCSSCounterStyleAtRuleImageSymbolsEnabled", @"CSS @counter-style <image> symbols", 4, 2, @"Enable support for <image> symbols in CSS @counter-style rules", v35);
    v400[19] = v381;
    LOWORD(v36) = 1;
    v380 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSCounterStyleAtRulesEnabled", @"WebKitCSSCounterStyleAtRulesEnabled", @"CSS @counter-style", 6, 2, @"Enable support for CSS @counter-style rules", v36);
    v400[20] = v380;
    LOWORD(v37) = 1;
    v379 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSFontFaceSizeAdjustEnabled", @"WebKitCSSFontFaceSizeAdjustEnabled", @"CSS @font-face size-adjust", 6, 2, @"Enable size-adjust descriptor in @font-face", v37);
    v400[21] = v379;
    LOWORD(v38) = 1;
    v378 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSStartingStyleAtRuleEnabled", @"WebKitCSSStartingStyleAtRuleEnabled", @"CSS @starting-style rule", 6, 2, @"Enable CSS @starting-style rule", v38);
    v400[22] = v378;
    LOWORD(v39) = 1;
    v377 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AccentColorEnabled", @"WebKitAccentColorEnabled", @"CSS Accent Color", 6, 2, @"Enable accent-color CSS property", v39);
    v400[23] = v377;
    LOWORD(v40) = 0;
    v376 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSAnchorPositioningEnabled", @"WebKitCSSAnchorPositioningEnabled", @"CSS Anchor Positioning", 4, 2, @"Enable CSS Anchor Positioning", v40);
    v400[24] = v376;
    LOWORD(v41) = 1;
    v375 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSContentVisibilityEnabled", @"WebKitCSSContentVisibilityEnabled", @"CSS Content Visibility", 6, 2, @"Enable CSS content-visibility", v41);
    v400[25] = v375;
    LOWORD(v42) = 0;
    v374 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSInputSecurityEnabled", @"WebKitCSSInputSecurityEnabled", @"CSS Input Security", 4, 2, @"Enable input-security CSS property", v42);
    v400[26] = v374;
    LOWORD(v43) = 0;
    v373 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MasonryEnabled", @"WebKitMasonryEnabled", @"CSS Masonry Layout", 5, 2, @"Enable Masonry Layout for CSS Grid", v43);
    v400[27] = v373;
    LOWORD(v44) = 1;
    v372 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSMotionPathEnabled", @"WebKitCSSMotionPathEnabled", @"CSS Motion Path", 6, 2, @"Enable CSS Motion Path support", v44);
    v400[28] = v372;
    LOWORD(v45) = 1;
    v371 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSNestingEnabled", @"WebKitCSSNestingEnabled", @"CSS Nesting", 6, 2, @"Enable support for CSS nesting https://www.w3.org/TR/css-nesting-1/", v45);
    v400[29] = v371;
    LOWORD(v46) = 0;
    v370 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OverscrollBehaviorEnabled", @"WebKitOverscrollBehaviorEnabled", @"CSS Overscroll Behavior", 6, 2, @"Enable CSS overscroll-behavior", v46);
    v400[30] = v370;
    LOWORD(v47) = 0;
    v369 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSPaintingAPIEnabled", @"WebKitCSSPaintingAPIEnabled", @"CSS Painting API", 4, 2, @"Enable the CSS Painting API", v47);
    v400[31] = v369;
    LOWORD(v48) = 0;
    v368 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSRhythmicSizingEnabled", @"WebKitCSSRhythmicSizingEnabled", @"CSS Rhythmic Sizing", 4, 2, @"Enable CSS Rhythmic Sizing properties", v48);
    v400[32] = v368;
    LOWORD(v49) = 1;
    v367 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSScopeAtRuleEnabled", @"WebKitCSSScopeAtRuleEnabled", @"CSS Scoping (@scope)", 6, 2, @"Enable the CSS Scoping feature with @scope rule", v49);
    v400[33] = v367;
    LOWORD(v50) = 0;
    v366 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSScrollAnchoringEnabled", @"WebKitCSSScrollAnchoringEnabled", @"CSS Scroll Anchoring", 4, 2, @"Enable CSS Scroll Anchoring", v50);
    v400[34] = v366;
    LOWORD(v51) = 0;
    v365 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTypedOMColorEnabled", @"WebKitCSSTypedOMColorEnabled", @"CSS Typed OM: Color Support", 4, 2, @"Enable the CSS Typed OM Color support", v51);
    v400[35] = v365;
    LOWORD(v52) = 0;
    v364 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSAppearanceBaseEnabled", @"WebKitCSSAppearanceBaseEnabled", @"CSS appearance: base", 4, 2, @"Enable base value for CSS appearance", v52);
    v400[36] = v364;
    LOWORD(v53) = 1;
    v363 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSBackgroundClipBorderAreaEnabled", @"WebKitCSSBackgroundClipBorderAreaEnabled", @"CSS background-clip: border-area", 6, 2, @"Enable the border-area value for background-clip", v53);
    v400[37] = v363;
    LOWORD(v54) = 0;
    v362 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSColorLayersEnabled", @"WebKitCSSColorLayersEnabled", @"CSS color-layers()", 5, 2, @"Enable support for CSS color-layers()", v54);
    v400[38] = v362;
    LOWORD(v55) = 0;
    v361 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSDPropertyEnabled", @"WebKitCSSDPropertyEnabled", @"CSS d property", 4, 2, @"Enable support for the CSS d property and SVG d presentation attribute", v55);
    v400[39] = v361;
    LOWORD(v56) = 0;
    v360 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSFieldSizingEnabled", @"WebKitCSSFieldSizingEnabled", @"CSS field-sizing property", 4, 2, @"Enable field-sizing CSS property", v56);
    v400[40] = v360;
    LOWORD(v57) = 0;
    v359 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSFontVariantEmojiEnabled", @"WebKitCSSFontVariantEmojiEnabled", @"CSS font-variant-emoji property", 4, 2, @"Enable the font-variant-emoji CSS property", v57);
    v400[41] = v359;
    LOWORD(v58) = 1;
    v358 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSLightDarkEnabled", @"WebKitCSSLightDarkEnabled", @"CSS light-dark()", 6, 2, @"Enable support for CSS light-dark() defined in CSS Color 5", v58);
    v400[42] = v358;
    LOWORD(v59) = 0;
    v357 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSLineClampEnabled", @"WebKitCSSLineClampEnabled", @"CSS line-clamp", 5, 2, @"Enable CSS line-clamp", v59);
    v400[43] = v357;
    LOWORD(v60) = 1;
    v356 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSMarginTrimEnabled", @"WebKitCSSMarginTrimEnabled", @"CSS margin-trim property", 6, 2, @"Enable margin-trim CSS property", v60);
    v400[44] = v356;
    LOWORD(v61) = 1;
    v355 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSRubyAlignEnabled", @"WebKitCSSRubyAlignEnabled", @"CSS ruby-align property", 6, 2, @"Enable ruby-align", v61);
    v400[45] = v355;
    LOWORD(v62) = 1;
    v354 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSRubyOverhangEnabled", @"WebKitCSSRubyOverhangEnabled", @"CSS ruby-overhang property", 6, 2, @"Enable ruby-overhang", v62);
    v400[46] = v354;
    LOWORD(v63) = 0;
    v353 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSScrollbarColorEnabled", @"WebKitCSSScrollbarColorEnabled", @"CSS scrollbar-color property", 4, 2, @"Enable scrollbar-color CSS property", v63);
    v400[47] = v353;
    LOWORD(v64) = 0;
    v352 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSScrollbarGutterEnabled", @"WebKitCSSScrollbarGutterEnabled", @"CSS scrollbar-gutter property", 6, 2, @"Enable scrollbar-gutter CSS property", v64);
    v400[48] = v352;
    LOWORD(v65) = 0;
    v351 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSScrollbarWidthEnabled", @"WebKitCSSScrollbarWidthEnabled", @"CSS scrollbar-width property", 6, 2, @"Enable scrollbar-width CSS property", v65);
    v400[49] = v351;
    LOWORD(v66) = 0;
    v350 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSShapeFunctionEnabled", @"WebKitCSSShapeFunctionEnabled", @"CSS shape() function", 5, 2, @"Enable the CSS shape() function", v66);
    v400[50] = v350;
    LOWORD(v67) = 1;
    v349 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSStyleQueriesEnabled", @"WebKitCSSStyleQueriesEnabled", @"CSS style queries", 6, 2, @"Enable CSS style queries for custom properties", v67);
    v400[51] = v349;
    LOWORD(v68) = 0;
    v348 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextAutospaceEnabled", @"WebKitCSSTextAutospaceEnabled", @"CSS text-autospace property", 4, 2, @"Enable the property text-autospace, defined in CSS Text 4", v68);
    v400[52] = v348;
    LOWORD(v69) = 1;
    v347 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextBoxTrimEnabled", @"WebKitCSSTextBoxTrimEnabled", @"CSS text-box-trim property", 6, 2, @"Enable text-box-trim", v69);
    v400[53] = v347;
    LOWORD(v70) = 0;
    v346 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextGroupAlignEnabled", @"WebKitCSSTextGroupAlignEnabled", @"CSS text-group-align property", 4, 2, @"Enable text-group-align CSS property", v70);
    v400[54] = v346;
    LOWORD(v71) = 0;
    v345 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextJustifyEnabled", @"WebKitCSSTextJustifyEnabled", @"CSS text-justify property", 4, 2, @"Enable the property text-justify, defined in CSS Text 3", v71);
    v400[55] = v345;
    LOWORD(v72) = 0;
    v344 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextSpacingEnabled", @"WebKitCSSTextSpacingEnabled", @"CSS text-spacing property", 4, 2, @"Enable the property text-spacing, defined in CSS Text 4", v72);
    v400[56] = v344;
    LOWORD(v73) = 1;
    v343 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextUnderlinePositionLeftRightEnabled", @"WebKitCSSTextUnderlinePositionLeftRightEnabled", @"CSS text-underline-position: left right", 6, 2, @"Enable the property text-underline-position left and right value support", v73);
    v400[57] = v343;
    LOWORD(v74) = 1;
    v342 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextWrapStyleEnabled", @"WebKitCSSTextWrapStyleEnabled", @"CSS text-wrap-style property", 6, 2, @"Enable the property text-wrap-style, defined in CSS Text 4", v74);
    v400[58] = v342;
    LOWORD(v75) = 0;
    v341 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSTextWrapPrettyEnabled", @"WebKitCSSTextWrapPrettyEnabled", @"CSS text-wrap: pretty", 4, 2, @"Enable the pretty value for text-wrap-style", v75);
    v400[59] = v341;
    LOWORD(v76) = 1;
    v340 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSOMViewScrollingAPIEnabled", @"WebKitCSSOMViewScrollingAPIEnabled", @"CSSOM View Scrolling API", 6, 2, @"Implement standard behavior for scrollLeft, scrollTop, scrollWidth, scrollHeight, scrollTo, scrollBy and scrollingElement.", v76);
    v400[60] = v340;
    LOWORD(v77) = 1;
    v339 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSOMViewSmoothScrollingEnabled", @"WebKitCSSOMViewSmoothScrollingEnabled", @"CSSOM View Smooth Scrolling", 6, 2, @"Enable DOM API and CSS property for 'smooth' scroll behavior", v77);
    v400[61] = v339;
    LOWORD(v78) = 1;
    v338 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CanvasColorSpaceEnabled", @"WebKitCanvasColorSpaceEnabled", @"Canvas Color Spaces", 6, 3, @"Enable use of predefined canvas color spaces", v78);
    v400[62] = v338;
    LOWORD(v79) = 0;
    v337 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CanvasFiltersEnabled", @"WebKitCanvasFiltersEnabled", @"Canvas Filters", 4, 3, @"Canvas Filters", v79);
    v400[63] = v337;
    LOWORD(v80) = 0;
    v336 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CanvasLayersEnabled", @"WebKitCanvasLayersEnabled", @"Canvas Layers", 4, 3, @"Enable Canvas Layers", v80);
    v400[64] = v336;
    LOWORD(v81) = 0;
    v335 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ClearSiteDataHTTPHeaderEnabled", @"WebKitClearSiteDataHTTPHeaderEnabled", @"Clear-Site-Data HTTP Header", 6, 6, @"Enable Clear-Site-Data HTTP Header support", v81);
    v400[65] = v335;
    LOWORD(v82) = 0;
    v334 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CompressionStreamEnabled", @"WebKitCompressionStreamEnabled", @"Compression Stream API", 6, 3, @"Enable Compression Stream API", v82);
    v400[66] = v334;
    LOWORD(v83) = 0;
    v333 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ContactPickerAPIEnabled", @"WebKitContactPickerAPIEnabled", @"Contact Picker API", 4, 3, @"Enable the Contact Picker API", v83);
    v400[67] = v333;
    LOWORD(v84) = 0;
    v332 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CookieStoreManagerEnabled", @"WebKitCookieStoreManagerEnabled", @"Cookie Store API CookieStoreManager", 4, 3, @"Enable Cookie Store API CookieStoreManager which controls cookie change subscriptions for Service Workers", v84);
    v400[68] = v332;
    LOWORD(v85) = 0;
    v331 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CookieStoreAPIExtendedAttributesEnabled", @"WebKitCookieStoreAPIExtendedAttributesEnabled", @"Cookie Store API Extended Attributes", 4, 3, @"Enable Extended Attributes of the Cookie Store API", v85);
    v400[69] = v331;
    LOWORD(v86) = 0;
    v330 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CookieStoreAPIEnabled", @"WebKitCookieStoreAPIEnabled", @"Cookie Store API", 4, 3, @"Enable Cookie Store API", v86);
    v400[70] = v330;
    LOWORD(v87) = 1;
    v329 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CrossDocumentViewTransitionsEnabled", @"WebKitCrossDocumentViewTransitionsEnabled", @"Cross document view-transitions", 6, 2, @"Enable support for view-transitions cross-document", v87);
    v400[71] = v329;
    LOWORD(v88) = 0;
    v328 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CrossOriginEmbedderPolicyEnabled", @"WebKitCrossOriginEmbedderPolicyEnabled", @"Cross-Origin-Embedder-Policy (COEP) header", 6, 8, @"Support for Cross-Origin-Embedder-Policy (COEP) header", v88);
    v400[72] = v328;
    LOWORD(v89) = 0;
    v327 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CrossOriginOpenerPolicyEnabled", @"WebKitCrossOriginOpenerPolicyEnabled", @"Cross-Origin-Opener-Policy (COOP) header", 6, 8, @"Support for Cross-Origin-Opener-Policy (COOP) header", v89);
    v400[73] = v327;
    LOWORD(v90) = 1;
    v326 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CustomStateSetEnabled", @"WebKitCustomStateSetEnabled", @"CustomStateSet and :state() pseudo class", 6, 3, @"Support for CustomStateSet in custom elements", v90);
    v400[74] = v326;
    LOWORD(v91) = 1;
    v325 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeclarativeShadowRootsParserAPIsEnabled", @"WebKitDeclarativeShadowRootsParserAPIsEnabled", @"Declarative Shadow Roots Parser APIs", 6, 3, @"Declarative Shadow Roots Parser APIs (Element/ShadowRoot's setHTMLUnsafe() and Document.parseHTMLUnsafe())", v91);
    v400[75] = v325;
    LOWORD(v92) = 1;
    v324 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeclarativeShadowRootsSerializerAPIsEnabled", @"WebKitDeclarativeShadowRootsSerializerAPIsEnabled", @"Declarative Shadow Roots Serializer APIs", 6, 3, @"Declarative Shadow Roots Serializer APIs (Element/ShadowRoot's getHTML() and ShadowRoot's serializable)", v92);
    v400[76] = v324;
    LOWORD(v93) = 1;
    v323 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint", @"WebKitShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint", @"Defer async scripts until DOMContentLoaded or first-paint", 6, 3, @"Defer async scripts until DOMContentLoaded or first-paint", v93);
    v400[77] = v323;
    LOWORD(v94) = 1;
    v322 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeprecateAESCFBWebCryptoEnabled", @"WebKitDeprecateAESCFBWebCryptoEnabled", @"Deprecate AES-CFB Web Crypto", 6, 3, @"Enable Deprecation of AES-CFB from Web Crypto", v94);
    v400[78] = v322;
    LOWORD(v95) = 1;
    v321 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeprecateRSAESPKCSWebCryptoEnabled", @"WebKitDeprecateRSAESPKCSWebCryptoEnabled", @"Deprecate RSAES-PKCS1-v1_5 Web Crypto", 6, 3, @"Enable Deprecation of RSAES-PKCS1-v1_5 Web Crypto", v95);
    v400[79] = v321;
    LOWORD(v96) = 0;
    v320 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeprecationReportingEnabled", @"WebKitDeprecationReportingEnabled", @"Deprecation Reporting", 4, 3, @"Enable Deprecation Reporting", v96);
    v400[80] = v320;
    LOWORD(v97) = 1;
    v319 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UAVisualTransitionDetectionEnabled", @"WebKitUAVisualTransitionDetectionEnabled", @"Detect UA visual transitions", 6, 3, @"Enable detection of UA visual transitions", v97);
    v400[81] = v319;
    LOWORD(v98) = 0;
    v318 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DigitalCredentialsEnabled", @"WebKitDigitalCredentialsEnabled", @"Digital Credentials API", 4, 3, @"Enable the experimental Digital Credentials API", v98);
    v400[82] = v318;
    LOWORD(v99) = 0;
    v317 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IsThirdPartyCookieBlockingDisabled", @"WebKitIsThirdPartyCookieBlockingDisabled", @"Disable Full 3rd-Party Cookie Blocking (ITP)", 3, 7, @"Disable full third-party cookie blocking when Intelligent Tracking Prevention is enabled", v99);
    v400[83] = v317;
    LOWORD(v100) = 0;
    v316 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IsFirstPartyWebsiteDataRemovalDisabled", @"WebKitIsFirstPartyWebsiteDataRemovalDisabled", @"Disable Removal of Non-Cookie Data After 7 Days of No User Interaction (ITP)", 3, 7, @"Disable removal of all non-cookie website data after seven days of no user interaction when Intelligent Tracking Prevention is enabled", v100);
    v400[84] = v316;
    LOWORD(v101) = 1;
    v315 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DisallowSyncXHRDuringPageDismissalEnabled", @"WebKitDisallowSyncXHRDuringPageDismissalEnabled", @"Disallow sync XHR during page dismissal", 6, 8, @"Disallow synchronous XMLHttpRequest during page dismissal", v101);
    v400[85] = v315;
    LOWORD(v102) = 0;
    v314 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CanvasFingerprintingQuirkEnabled", @"WebKitCanvasFingerprintingQuirkEnabled", @"Enable Canvas fingerprinting-related quirk", 6, 3, &stru_1F3C7DA90, v102);
    v400[86] = v314;
    LOWORD(v103) = 1;
    v400[87] = v313;
    LOWORD(v104) = 0;
    v312 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"BlobFileAccessEnforcementEnabled", @"WebKitBlobFileAccessEnforcementEnabled", @"Enforce blob backed file access valid for web process", 4, 8, @"Validate file backed blobs were created by the correct web process", v104);
    v400[88] = v312;
    LOWORD(v105) = 0;
    v311 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FTPEnabled", @"WebKitFTPEnabled", @"FTP support enabled", 3, 6, @"FTP support enabled", v105);
    v400[89] = v311;
    LOWORD(v106) = 1;
    v310 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FetchPriorityEnabled", @"WebKitFetchPriorityEnabled", @"Fetch Priority", 6, 6, @"Enable Fetch Priority support", v106);
    v400[90] = v310;
    LOWORD(v107) = 0;
    v309 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FileSystemAccessEnabled", @"WebKitFileSystemAccessEnabled", @"File System Access API", 6, 3, @"Enable File System Access API", v107);
    v400[91] = v309;
    LOWORD(v108) = 0;
    v308 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FilterLinkDecorationByDefaultEnabled", @"WebKitFilterLinkDecorationByDefaultEnabled", @"Filter Link Decoration", 4, 6, @"Enable Filtering Link Decoration", v108);
    v400[92] = v308;
    LOWORD(v109) = 0;
    v307 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FullScreenKeyboardLock", @"WebKitFullScreenKeyboardLock", @"Fullscreen API based Keyboard Lock", 4, 3, @"Fullscreen API based Keyboard Lock", v109);
    v400[93] = v307;
    LOWORD(v110) = 0;
    v306 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"GamepadTriggerRumbleEnabled", @"WebKitGamepadTriggerRumbleEnabled", @"Gamepad trigger vibration support", 4, 3, @"Support for Gamepad trigger vibration", v110);
    v400[94] = v306;
    LOWORD(v111) = 0;
    v305 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"GamepadVibrationActuatorEnabled", @"WebKitGamepadVibrationActuatorEnabled", @"Gamepad.vibrationActuator support", 6, 3, @"Support for Gamepad.vibrationActuator", v111);
    v400[95] = v305;
    LOWORD(v112) = 1;
    v304 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"GraphicsContextFiltersEnabled", @"WebKitGraphicsContextFiltersEnabled", @"GraphicsContext Filter Rendering", 6, 5, @"GraphicsContext Filter Rendering", v112);
    v400[96] = v304;
    LOWORD(v113) = 1;
    v303 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DetailsNameAttributeEnabled", @"WebKitDetailsNameAttributeEnabled", @"HTML <details name> attribute", 6, 9, @"Enable HTML <details name> attribute", v113);
    v400[97] = v303;
    LOWORD(v114) = 0;
    v302 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ModelElementEnabled", @"WebKitModelElementEnabled", @"HTML <model> element", 4, 9, @"Enable HTML <model> element", v114);
    v400[98] = v302;
    LOWORD(v115) = 0;
    v301 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ModelDocumentEnabled", @"WebKitModelDocumentEnabled", @"HTML <model> elements for stand-alone document", 4, 9, @"Enable HTML <model> element for model documents", v115);
    v400[99] = v301;
    LOWORD(v116) = 0;
    v300 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"InvokerAttributesEnabled", @"WebKitInvokerAttributesEnabled", @"HTML command & commandfor attributes", 4, 9, @"Enable HTML command & commandfor attribute support", v116);
    v400[100] = v300;
    uint64_t v3 = [WebFeature alloc];
    {
      unsigned __int8 v4 = WebKit::defaultPopoverAttributeEnabled(void)::newSDK != 0;
    }
    else
    {
      unsigned __int8 v4 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultPopoverAttributeEnabled(void)::newSDK = v4;
    }
    LOWORD(v117) = v4;
    v299 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:](v3, "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PopoverAttributeEnabled", @"WebKitPopoverAttributeEnabled", @"HTML popover attribute", 6, 9, @"Enable HTML popover attribute support", v117);
    v400[101] = v299;
    LOWORD(v118) = 1;
    v298 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SwitchControlEnabled", @"WebKitSwitchControlEnabled", @"HTML switch control", 6, 9, @"Enable HTML switch control", v118);
    v400[102] = v298;
    LOWORD(v119) = 0;
    v297 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"HTTPSByDefaultEnabled", @"WebKitHTTPSByDefaultEnabled", @"HTTPS-by-default (HTTPS-First)", 4, 8, @"Enable HTTPS-by-default (HTTPS-First)", v119);
    v400[103] = v297;
    LOWORD(v120) = 0;
    v296 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"HighlightAPIEnabled", @"WebKitHighlightAPIEnabled", @"Highlight API", 6, 2, @"Highlight API support", v120);
    v400[104] = v296;
    LOWORD(v121) = 0;
    v295 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ItpDebugModeEnabled", @"WebKitItpDebugModeEnabled", @"ITP Debug Mode", 3, 7, @"Intelligent Tracking Prevention Debug Mode", v121);
    v400[105] = v295;
    LOWORD(v122) = 1;
    v294 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ImageAnimationControlEnabled", @"WebKitImageAnimationControlEnabled", @"Image Animation Control", 6, 1, @"Enable controls for image animations", v122);
    v400[106] = v294;
    LOWORD(v123) = 0;
    v293 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ImageCaptureEnabled", @"WebKitImageCaptureEnabled", @"Image Capture API", 4, 5, @"Enable Image Capture API", v123);
    v400[107] = v293;
    LOWORD(v124) = 1;
    v292 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LazyIframeLoadingEnabled", @"WebKitLazyIframeLoadingEnabled", @"Lazy iframe loading", 6, 9, @"Enable lazy iframe loading support", v124);
    v400[108] = v292;
    LOWORD(v125) = 0;
    v291 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LazyImageLoadingEnabled", @"WebKitLazyImageLoadingEnabled", @"Lazy image loading", 6, 9, @"Enable lazy image loading support", v125);
    v400[109] = v291;
    SessionID v5 = [WebFeature alloc];
    {
      int v6 = WebKit::defaultShowModalDialogEnabled(void)::newSDK;
    }
    else
    {
      int v6 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultShowModalDialogEnabled(void)::newSDK = v6;
    }
    LOWORD(v126) = v6 == 0;
    v290 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:](v5, "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShowModalDialogEnabled", @"WebKitShowModalDialogEnabled", @"Legacy showModalDialog() API", 3, 3, @"Legacy showModalDialog() API", v126);
    v400[110] = v290;
    LOWORD(v127) = 1;
    v289 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LinkPreloadResponsiveImagesEnabled", @"WebKitLinkPreloadResponsiveImagesEnabled", @"Link preload responsive images", 6, 6, @"Enable link preload responsive images", v127);
    v400[111] = v289;
    LOWORD(v128) = 1;
    v288 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LinkModulePreloadEnabled", @"WebKitLinkModulePreloadEnabled", @"Link rel=modulepreload", 6, 6, @"Enable Link rel=modulepreload", v128);
    v400[112] = v288;
    LOWORD(v129) = 0;
    v287 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LinkPreconnectEarlyHintsEnabled", @"WebKitLinkPreconnectEarlyHintsEnabled", @"Link rel=preconnect via HTTP early hints", 6, 6, @"Enable link rel=preconnect via early hints", v129);
    v400[113] = v287;
    LOWORD(v130) = 0;
    v286 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LinkPrefetchEnabled", @"WebKitLinkPrefetchEnabled", @"LinkPrefetch", 4, 6, @"Enable LinkedPrefetch", v130);
    v400[114] = v286;
    LOWORD(v131) = 1;
    v285 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LiveRangeSelectionEnabled", @"WebKitLiveRangeSelectionEnabled", @"Live Ranges in Selection", 6, 3, @"Live range behavior for ranges in the Selection object", v131);
    v400[115] = v285;
    LOWORD(v132) = 1;
    v284 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LoadWebArchiveWithEphemeralStorageEnabled", @"WebKitLoadWebArchiveWithEphemeralStorageEnabled", @"Load Web Archive with ephemeral storage", 6, 3, @"Enable loading web archive with ephemeral storage", v132);
    v400[116] = v284;
    LOWORD(v133) = 0;
    v283 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LoginStatusAPIEnabled", @"WebKitLoginStatusAPIEnabled", @"Login Status API", 4, 3, @"Enable the proposed Login Status API", v133);
    v400[117] = v283;
    LOWORD(v134) = 0;
    v282 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ManagedMediaSourceEnabled", @"WebKitManagedMediaSourceEnabled", @"Managed Media Source API", 6, 5, @"Managed Media Source API", v134);
    v400[118] = v282;
    LOWORD(v135) = 0;
    v281 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ManagedMediaSourceNeedsAirPlay", @"WebKitManagedMediaSourceNeedsAirPlay", @"Managed Media Source Requires AirPlay source", 6, 5, @"Managed Media Source Requires AirPlay source", v135);
    v400[119] = v281;
    LOWORD(v136) = 0;
    v280 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MediaCapabilitiesExtensionsEnabled", @"WebKitMediaCapabilitiesExtensionsEnabled", @"Media Capabilities Extensions", 6, 5, @"Media Capabilities Extensions", v136);
    v400[120] = v280;
    LOWORD(v137) = 0;
    v279 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MediaRecorderEnabled", @"WebKitMediaRecorderEnabled", @"MediaRecorder", 6, 5, @"MediaRecorder", v137);
    v400[121] = v279;
    LOWORD(v138) = 0;
    v278 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MediaSessionCaptureToggleAPIEnabled", @"WebKitMediaSessionCaptureToggleAPIEnabled", @"MediaSession capture related API", 4, 5, @"Enable MediaSession capture related API", v138);
    v400[122] = v278;
    LOWORD(v139) = 0;
    v277 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MediaStreamTrackProcessingEnabled", @"WebKitMediaStreamTrackProcessingEnabled", @"MediaStreamTrack Processing", 6, 5, @"Enable MediaStreamTrack Processing", v139);
    v400[123] = v277;
    LOWORD(v140) = 0;
    v276 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"NavigationAPIEnabled", @"WebKitNavigationAPIEnabled", @"Navigation API", 4, 3, @"Enable Navigation API", v140);
    v400[124] = v276;
    LOWORD(v141) = 0;
    v275 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"NotificationsEnabled", @"WebKitNotificationsEnabled", @"Notifications", 6, 3, @"Enable the Notifications API", v141);
    v400[125] = v275;
    LOWORD(v142) = 0;
    v274 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ObservableEnabled", @"WebKitObservableEnabled", @"Observable API", 4, 3, @"Support for the Observable API", v142);
    v400[126] = v274;
    LOWORD(v143) = 1;
    v273 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OffscreenCanvasInWorkersEnabled", @"WebKitOffscreenCanvasInWorkersEnabled", @"OffscreenCanvas in Workers", 6, 3, @"Support for the OffscreenCanvas APIs in Workers", v143);
    v400[127] = v273;
    LOWORD(v144) = 1;
    v272 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OffscreenCanvasEnabled", @"WebKitOffscreenCanvasEnabled", @"OffscreenCanvas", 6, 3, @"Support for the OffscreenCanvas APIs", v144);
    v400[128] = v272;
    LOWORD(v145) = 0;
    v271 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OffscreenCanvasDeprecatedCommitEnabled", @"WebKitOffscreenCanvasDeprecatedCommitEnabled", @"OffscreenCanvasRenderingContext2D's deprecated commit() method", 4, 3, @"Support for OffscreenCanvasRenderingContext2D's deprecated commit() method", v145);
    v400[129] = v271;
    LOWORD(v146) = 1;
    v270 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OverlappingBackingStoreProvidersEnabled", @"WebKitOverlappingBackingStoreProvidersEnabled", @"Overlapping backing stores", 6, 2, @"Enable overlapping backing stores compositor optimization", v146);
    v400[130] = v270;
    LOWORD(v147) = 0;
    v269 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"BlobRegistryTopOriginPartitioningEnabled", @"WebKitBlobRegistryTopOriginPartitioningEnabled", @"Partition Blob URL Registry", 6, 8, @"Partition Blob URL Registry by Top-Level Origin", v147);
    v400[131] = v269;
    LOWORD(v148) = 0;
    v268 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PermissionsAPIEnabled", @"WebKitPermissionsAPIEnabled", @"Permissions API", 6, 3, @"Enable Permissions API", v148);
    v400[132] = v268;
    LOWORD(v149) = 1;
    v400[133] = v267;
    LOWORD(v150) = 1;
    v400[134] = v266;
    LOWORD(v151) = 1;
    v265 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PreferPageRenderingUpdatesNear60FPSEnabled", @"WebKitPreferPageRenderingUpdatesNear60FPSEnabled", @"Prefer Page Rendering Updates near 60fps", 6, 3, @"Prefer page rendering updates near 60 frames per second rather than using the display's refresh rate", v151);
    v400[135] = v265;
    LOWORD(v152) = 0;
    v264 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PrivateClickMeasurementDebugModeEnabled", @"WebKitPrivateClickMeasurementDebugModeEnabled", @"Private Click Measurement Debug Mode", 3, 7, @"Enable Private Click Measurement Debug Mode", v152);
    v400[136] = v264;
    LOWORD(v153) = 0;
    v263 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PrivateTokenUsageByThirdPartyEnabled", @"WebKitPrivateTokenUsageByThirdPartyEnabled", @"Private Token usage by third party", 6, 7, @"Enable private token usage by third party", v153);
    v400[137] = v263;
    LOWORD(v154) = 0;
    v262 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ReadableByteStreamAPIEnabled", @"WebKitReadableByteStreamAPIEnabled", @"ReadableByteStream", 4, 3, @"Enable Readable Byte Streams", v154);
    v400[138] = v262;
    LOWORD(v155) = 1;
    v261 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ReportingEnabled", @"WebKitReportingEnabled", @"Reporting API", 6, 3, @"Enable Reporting API", v155);
    v400[139] = v261;
    LOWORD(v156) = 1;
    v260 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"RequestVideoFrameCallbackEnabled", @"WebKitRequestVideoFrameCallbackEnabled", @"RequestVideoFrameCallback", 6, 5, @"Enable RequestVideoFrameCallback API", v156);
    v400[140] = v260;
    LOWORD(v157) = 0;
    v259 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScreenOrientationLockingAPIEnabled", @"WebKitScreenOrientationLockingAPIEnabled", @"Screen Orientation API (Locking / Unlocking)", 4, 3, @"Enable Screen Orientation API (Locking / Unlocking)", v157);
    v400[141] = v259;
    LOWORD(v158) = 0;
    v258 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScreenOrientationAPIEnabled", @"WebKitScreenOrientationAPIEnabled", @"Screen Orientation API", 6, 3, @"Enable Screen Orientation API", v158);
    v400[142] = v258;
    LOWORD(v159) = 0;
    v257 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScreenWakeLockAPIEnabled", @"WebKitScreenWakeLockAPIEnabled", @"Screen Wake Lock API", 6, 3, @"Enable Screen Wake Lock API", v159);
    v400[143] = v257;
    LOWORD(v160) = 0;
    v256 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScreenCaptureEnabled", @"WebKitScreenCaptureEnabled", @"ScreenCapture", 6, 5, @"Enable ScreenCapture", v160);
    v400[144] = v256;
    LOWORD(v161) = 0;
    v255 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScrollToTextFragmentFeatureDetectionEnabled", @"WebKitScrollToTextFragmentFeatureDetectionEnabled", @"Scroll To Text Fragment Feature Detection", 5, 3, @"Enable Scroll To Text Fragment Feature Detection", v161);
    v400[145] = v255;
    LOWORD(v162) = 0;
    v254 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScrollToTextFragmentGenerationEnabled", @"WebKitScrollToTextFragmentGenerationEnabled", @"Scroll To Text Fragment Generation", 6, 3, @"Enable Scroll To Text Fragment Generation Menu", v162);
    v400[146] = v254;
    LOWORD(v163) = 0;
    v253 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScrollToTextFragmentEnabled", @"WebKitScrollToTextFragmentEnabled", @"Scroll To Text Fragment", 6, 3, @"Enable Scroll To Text Fragment", v163);
    v400[147] = v253;
    LOWORD(v164) = 0;
    v252 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ScrollDrivenAnimationsEnabled", @"WebKitScrollDrivenAnimationsEnabled", @"Scroll-driven Animations", 4, 1, @"Enable Scroll-driven Animations", v164);
    v400[148] = v252;
    LOWORD(v165) = 1;
    v251 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SelectionAPIForShadowDOMEnabled", @"WebKitSelectionAPIForShadowDOMEnabled", @"Selection API for shadow DOM", 6, 3, @"Enable selection API for shadow DOM", v165);
    v400[149] = v251;
    LOWORD(v166) = 1;
    v250 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SendMouseEventsToDisabledFormControlsEnabled", @"WebKitSendMouseEventsToDisabledFormControlsEnabled", @"Send mouse events to disabled form controls", 6, 9, @"Send mouse events to disabled form controls", v166);
    v400[150] = v250;
    LOWORD(v167) = 0;
    v249 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ServiceWorkerNavigationPreloadEnabled", @"WebKitServiceWorkerNavigationPreloadEnabled", @"Service Worker Navigation Preload", 6, 6, @"Enable Service Worker Navigation Preload API", v167);
    v400[151] = v249;
    LOWORD(v168) = 0;
    v248 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShapeDetection", @"WebKitShapeDetection", @"Shape Detection API", 4, 5, @"Enable the Shape Detection API", v168);
    v400[152] = v248;
    LOWORD(v169) = 0;
    v247 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SharedWorkerEnabled", @"WebKitSharedWorkerEnabled", @"SharedWorker", 6, 3, @"Enabled SharedWorker API", v169);
    v400[153] = v247;
    LOWORD(v170) = 0;
    v246 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShowMediaStatsContextMenuItemEnabled", @"WebKitShowMediaStatsContextMenuItemEnabled", @"Show Media Stats", 3, 5, @"Adds a 'Media Stats' context menu item to <video> when the Develop menu is enabled", v170);
    v400[154] = v246;
    LOWORD(v171) = 0;
    v245 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SidewaysWritingModesEnabled", @"WebKitSidewaysWritingModesEnabled", @"Sideways writing modes", 4, 2, @"Enable support for sideways writing modes", v171);
    v400[155] = v245;
    LOWORD(v172) = 0;
    v244 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"StorageAPIEstimateEnabled", @"WebKitStorageAPIEstimateEnabled", @"Storage API Estimate", 6, 3, @"Enable Storage API Estimate", v172);
    v400[156] = v244;
    LOWORD(v173) = 0;
    v243 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"StorageAPIEnabled", @"WebKitStorageAPIEnabled", @"Storage API", 6, 3, @"Enable Storage API", v173);
    v400[157] = v243;
    LOWORD(v174) = 0;
    v242 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"TrackConfigurationEnabled", @"WebKitTrackConfigurationEnabled", @"Track Configuration API", 4, 5, @"Track Configuration API", v174);
    v400[158] = v242;
    LOWORD(v175) = 0;
    v241 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"TrustedTypesEnabled", @"WebKitTrustedTypesEnabled", @"Trusted Types", 4, 3, @"Enable Trusted Types", v175);
    v400[159] = v241;
    LOWORD(v176) = 0;
    v240 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IPAddressAndLocalhostMixedContentUpgradeTestingEnabled", @"WebKitIPAddressAndLocalhostMixedContentUpgradeTestingEnabled", @"Upgrade IP addresses and localhost in mixed content", 4, 8, @"Enable Upgrading IP addresses and localhost in mixed content", v176);
    v400[160] = v240;
    LOWORD(v177) = 1;
    v239 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UpgradeMixedContentEnabled", @"WebKitUpgradeMixedContentEnabled", @"Upgrade upgradable mixed content", 6, 6, @"Upgrade upgradable mixed content", v177);
    v400[161] = v239;
    LOWORD(v178) = 0;
    v238 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UserActivationAPIEnabled", @"WebKitUserActivationAPIEnabled", @"User Activation API", 6, 3, @"Enable User Activation API", v178);
    v400[162] = v238;
    LOWORD(v179) = 0;
    v237 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"VerifyWindowOpenUserGestureFromUIProcess", @"WebKitVerifyWindowOpenUserGestureFromUIProcess", @"Verify window.open user gesture", 4, 8, @"Verifies that the user gesture for window.open came from the UI process", v179);
    v400[163] = v237;
    LOWORD(v180) = 1;
    v236 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"VerticalFormControlsEnabled", @"WebKitVerticalFormControlsEnabled", @"Vertical form control support", 6, 9, @"Enable support for form controls in vertical writing mode", v180);
    v400[164] = v236;
    LOWORD(v181) = 1;
    v235 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ViewTransitionClassesEnabled", @"WebKitViewTransitionClassesEnabled", @"View Transition Classes", 6, 1, @"Support specifying classes for view transitions", v181);
    v400[165] = v235;
    LOWORD(v182) = 1;
    v234 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ViewTransitionTypesEnabled", @"WebKitViewTransitionTypesEnabled", @"View Transition Types", 6, 1, @"Support specifying types for view transitions", v182);
    v400[166] = v234;
    LOWORD(v183) = 1;
    v233 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ViewTransitionsEnabled", @"WebKitViewTransitionsEnabled", @"View Transitions", 6, 1, @"Enable the View Transitions API", v183);
    v400[167] = v233;
    LOWORD(v184) = 0;
    v232 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebAnimationsCustomEffectsEnabled", @"WebKitWebAnimationsCustomEffectsEnabled", @"Web Animations custom effects", 4, 1, @"Support for the CustomEffect interface", v184);
    v400[168] = v232;
    LOWORD(v185) = 0;
    v231 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebAnimationsCustomFrameRateEnabled", @"WebKitWebAnimationsCustomFrameRateEnabled", @"Web Animations custom frame rate", 4, 1, @"Support for specifying a custom frame rate for Web Animations", v185);
    v400[169] = v231;
    LOWORD(v186) = 1;
    v230 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCryptoSafeCurvesEnabled", @"WebKitWebCryptoSafeCurvesEnabled", @"Web Crypto Safe Curves", 6, 3, @"Enable Web Crypto Safe Curves", v186);
    v400[170] = v230;
    LOWORD(v187) = 0;
    v229 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCryptoX25519Enabled", @"WebKitWebCryptoX25519Enabled", @"Web Crypto X25519 algorithm", 5, 3, @"Enable Web Crypto X25519 algorithm", v187);
    v400[171] = v229;
    LOWORD(v188) = 0;
    v228 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebLocksAPIEnabled", @"WebKitWebLocksAPIEnabled", @"Web Locks API", 6, 3, @"Web Locks API", v188);
    v400[172] = v228;
    LOWORD(v189) = 0;
    v227 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebShareFileAPIEnabled", @"WebKitWebShareFileAPIEnabled", @"Web Share API Level 2", 6, 3, @"Enable level 2 of Web Share API", v189);
    v400[173] = v227;
    LOWORD(v190) = 0;
    v226 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebAssemblyESMIntegrationEnabled", @"WebKitWebAssemblyESMIntegrationEnabled", @"WebAssembly ES module integration support", 4, 4, @"Support for allowing WebAssembly modules to integrate as ES modules", v190);
    v400[174] = v226;
    LOWORD(v191) = 0;
    v225 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCodecsAV1Enabled", @"WebKitWebCodecsAV1Enabled", @"WebCodecs AV1 codec", 5, 5, @"Enable WebCodecs AV1 codec", v191);
    v400[175] = v225;
    LOWORD(v192) = 0;
    v224 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCodecsAudioEnabled", @"WebKitWebCodecsAudioEnabled", @"WebCodecs Audio API", 5, 5, @"Enable WebCodecs Audio API", v192);
    v400[176] = v224;
    LOWORD(v193) = 0;
    v223 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCodecsHEVCEnabled", @"WebKitWebCodecsHEVCEnabled", @"WebCodecs HEVC codec", 6, 5, @"Enable WebCodecs HEVC codec", v193);
    v400[177] = v223;
    LOWORD(v194) = 0;
    v222 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebCodecsVideoEnabled", @"WebKitWebCodecsVideoEnabled", @"WebCodecs Video API", 6, 5, @"Enable WebCodecs Video API", v194);
    v400[178] = v222;
    LOWORD(v195) = 0;
    v221 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebGLDraftExtensionsEnabled", @"WebKitWebGLDraftExtensionsEnabled", @"WebGL Draft Extensions", 4, 3, @"Enable WebGL extensions that are still in draft status", v195);
    v400[179] = v221;
    LOWORD(v196) = 0;
    v220 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebGLTimerQueriesEnabled", @"WebKitWebGLTimerQueriesEnabled", @"WebGL Timer Queries", 3, 3, @"Enable WebGL extensions that provide GPU timer queries", v196);
    v400[180] = v220;
    LOWORD(v197) = 0;
    v219 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCAV1CodecEnabled", @"WebKitWebRTCAV1CodecEnabled", @"WebRTC AV1 codec", 5, 5, @"Enable WebRTC AV1 codec", v197);
    v400[181] = v219;
    LOWORD(v198) = 0;
    v218 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCEncodedTransformEnabled", @"WebKitWebRTCEncodedTransformEnabled", @"WebRTC Encoded Transform API", 6, 5, @"Enable WebRTC Encoded Transform API", v198);
    v400[182] = v218;
    LOWORD(v199) = 0;
    v217 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCH265CodecEnabled", @"WebKitWebRTCH265CodecEnabled", @"WebRTC HEVC codec", 6, 5, @"Enable WebRTC HEVC codec", v199);
    v400[183] = v217;
    LOWORD(v200) = 0;
    v216 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCSFrameTransformEnabled", @"WebKitWebRTCSFrameTransformEnabled", @"WebRTC SFrame Transform API", 4, 5, @"Enable WebRTC SFrame Transform API", v200);
    v400[184] = v216;
    LOWORD(v201) = 0;
    v215 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCVP9Profile2CodecEnabled", @"WebKitWebRTCVP9Profile2CodecEnabled", @"WebRTC VP9 profile 2 codec", 6, 5, @"Enable WebRTC VP9 profile 2 codec", v201);
    v400[185] = v215;
    LOWORD(v202) = 0;
    v214 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebTransportEnabled", @"WebKitWebTransportEnabled", @"WebTransport", 4, 6, @"Enable WebTransport", v202);
    v400[186] = v214;
    LOWORD(v203) = 1;
    CFTypeRef cf = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WritingSuggestionsAttributeEnabled", @"WebKitWritingSuggestionsAttributeEnabled", @"Writing Suggestions", 6, 3, @"Enable the writingsuggestions attribute", v203);
    v400[187] = cf;
    LOWORD(v204) = 0;
    uint64_t v7 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled", @"WebKitIsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled", @"[ITP Live-On] 1 Hour Timeout For Non-Cookie Data Removal", 3, 7, @"Remove all non-cookie website data after just one hour of no user interaction when Intelligent Tracking Prevention is enabled", v204);
    v400[188] = v7;
    LOWORD(v205) = 0;
    CFTypeRef v8 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IsFirstPartyWebsiteDataRemovalReproTestingEnabled", @"WebKitIsFirstPartyWebsiteDataRemovalReproTestingEnabled", @"[ITP Repro] 30 Second Timeout For Non-Cookie Data Removal", 3, 7, @"Remove all non-cookie website data after just 30 seconds of no user interaction when Intelligent Tracking Prevention is enabled", v205);
    v400[189] = v8;
    LOWORD(v206) = 1;
    uint64_t v9 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AlignContentOnBlocksEnabled", @"WebKitAlignContentOnBlocksEnabled", @"align-content on blocks", 6, 2, @"Enable align-content for block containers", v206);
    v400[190] = v9;
    LOWORD(v207) = 0;
    v400[191] = v10;
    LOWORD(v208) = 0;
    v400[192] = v11;
    LOWORD(v209) = 1;
    double v12 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ElementCheckVisibilityEnabled", @"WebKitElementCheckVisibilityEnabled", @"element.checkVisibility() API", 6, 3, @"Enable element.checkVisibility() API", v209);
    v400[193] = v12;
    LOWORD(v210) = 0;
    v13 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"RequestIdleCallbackEnabled", @"WebKitRequestIdleCallbackEnabled", @"requestIdleCallback", 4, 3, @"Enable requestIdleCallback support", v210);
    v400[194] = v13;
    LOWORD(v211) = 0;
    float v14 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSWordBreakAutoPhraseEnabled", @"WebKitCSSWordBreakAutoPhraseEnabled", @"word-break: auto-phrase enabled", 4, 2, @"Enables the auto-phrase value of the word-break CSS property", v211);
    v400[195] = v14;
    v15 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v400 count:196];
    qword_1EB3A9848 = (uint64_t)v15;
    if (v15) {
      CFRetain(v15);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (v12) {
      CFRelease(v12);
    }
    if (v11) {
      CFRelease(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v214) {
      CFRelease(v214);
    }
    if (v215) {
      CFRelease(v215);
    }
    if (v216) {
      CFRelease(v216);
    }
    if (v217) {
      CFRelease(v217);
    }
    if (v218) {
      CFRelease(v218);
    }
    if (v219) {
      CFRelease(v219);
    }
    if (v220) {
      CFRelease(v220);
    }
    if (v221) {
      CFRelease(v221);
    }
    if (v222) {
      CFRelease(v222);
    }
    if (v223) {
      CFRelease(v223);
    }
    if (v224) {
      CFRelease(v224);
    }
    if (v225) {
      CFRelease(v225);
    }
    if (v226) {
      CFRelease(v226);
    }
    if (v227) {
      CFRelease(v227);
    }
    if (v228) {
      CFRelease(v228);
    }
    if (v229) {
      CFRelease(v229);
    }
    if (v230) {
      CFRelease(v230);
    }
    if (v231) {
      CFRelease(v231);
    }
    if (v232) {
      CFRelease(v232);
    }
    if (v233) {
      CFRelease(v233);
    }
    if (v234) {
      CFRelease(v234);
    }
    if (v235) {
      CFRelease(v235);
    }
    if (v236) {
      CFRelease(v236);
    }
    if (v237) {
      CFRelease(v237);
    }
    if (v238) {
      CFRelease(v238);
    }
    if (v239) {
      CFRelease(v239);
    }
    if (v240) {
      CFRelease(v240);
    }
    if (v241) {
      CFRelease(v241);
    }
    if (v242) {
      CFRelease(v242);
    }
    if (v243) {
      CFRelease(v243);
    }
    if (v244) {
      CFRelease(v244);
    }
    if (v245) {
      CFRelease(v245);
    }
    if (v246) {
      CFRelease(v246);
    }
    if (v247) {
      CFRelease(v247);
    }
    if (v248) {
      CFRelease(v248);
    }
    if (v249) {
      CFRelease(v249);
    }
    if (v250) {
      CFRelease(v250);
    }
    if (v251) {
      CFRelease(v251);
    }
    if (v252) {
      CFRelease(v252);
    }
    if (v253) {
      CFRelease(v253);
    }
    if (v254) {
      CFRelease(v254);
    }
    if (v255) {
      CFRelease(v255);
    }
    if (v256) {
      CFRelease(v256);
    }
    if (v257) {
      CFRelease(v257);
    }
    if (v258) {
      CFRelease(v258);
    }
    if (v259) {
      CFRelease(v259);
    }
    if (v260) {
      CFRelease(v260);
    }
    if (v261) {
      CFRelease(v261);
    }
    if (v262) {
      CFRelease(v262);
    }
    if (v263) {
      CFRelease(v263);
    }
    if (v264) {
      CFRelease(v264);
    }
    if (v265) {
      CFRelease(v265);
    }
    if (v266) {
      CFRelease(v266);
    }
    if (v267) {
      CFRelease(v267);
    }
    if (v268) {
      CFRelease(v268);
    }
    if (v269) {
      CFRelease(v269);
    }
    if (v270) {
      CFRelease(v270);
    }
    if (v271) {
      CFRelease(v271);
    }
    if (v272) {
      CFRelease(v272);
    }
    if (v273) {
      CFRelease(v273);
    }
    if (v274) {
      CFRelease(v274);
    }
    if (v275) {
      CFRelease(v275);
    }
    if (v276) {
      CFRelease(v276);
    }
    if (v277) {
      CFRelease(v277);
    }
    if (v278) {
      CFRelease(v278);
    }
    if (v279) {
      CFRelease(v279);
    }
    if (v280) {
      CFRelease(v280);
    }
    if (v281) {
      CFRelease(v281);
    }
    if (v282) {
      CFRelease(v282);
    }
    if (v283) {
      CFRelease(v283);
    }
    if (v284) {
      CFRelease(v284);
    }
    if (v285) {
      CFRelease(v285);
    }
    if (v286) {
      CFRelease(v286);
    }
    if (v287) {
      CFRelease(v287);
    }
    if (v288) {
      CFRelease(v288);
    }
    if (v289) {
      CFRelease(v289);
    }
    if (v290) {
      CFRelease(v290);
    }
    if (v291) {
      CFRelease(v291);
    }
    if (v292) {
      CFRelease(v292);
    }
    if (v293) {
      CFRelease(v293);
    }
    if (v294) {
      CFRelease(v294);
    }
    if (v295) {
      CFRelease(v295);
    }
    if (v296) {
      CFRelease(v296);
    }
    if (v297) {
      CFRelease(v297);
    }
    if (v298) {
      CFRelease(v298);
    }
    if (v299) {
      CFRelease(v299);
    }
    if (v300) {
      CFRelease(v300);
    }
    if (v301) {
      CFRelease(v301);
    }
    if (v302) {
      CFRelease(v302);
    }
    if (v303) {
      CFRelease(v303);
    }
    if (v304) {
      CFRelease(v304);
    }
    if (v305) {
      CFRelease(v305);
    }
    if (v306) {
      CFRelease(v306);
    }
    if (v307) {
      CFRelease(v307);
    }
    if (v308) {
      CFRelease(v308);
    }
    if (v309) {
      CFRelease(v309);
    }
    if (v310) {
      CFRelease(v310);
    }
    if (v311) {
      CFRelease(v311);
    }
    if (v312) {
      CFRelease(v312);
    }
    if (v313) {
      CFRelease(v313);
    }
    if (v314) {
      CFRelease(v314);
    }
    if (v315) {
      CFRelease(v315);
    }
    if (v316) {
      CFRelease(v316);
    }
    if (v317) {
      CFRelease(v317);
    }
    if (v318) {
      CFRelease(v318);
    }
    if (v319) {
      CFRelease(v319);
    }
    if (v320) {
      CFRelease(v320);
    }
    if (v321) {
      CFRelease(v321);
    }
    if (v322) {
      CFRelease(v322);
    }
    if (v323) {
      CFRelease(v323);
    }
    if (v324) {
      CFRelease(v324);
    }
    if (v325) {
      CFRelease(v325);
    }
    if (v326) {
      CFRelease(v326);
    }
    if (v327) {
      CFRelease(v327);
    }
    if (v328) {
      CFRelease(v328);
    }
    if (v329) {
      CFRelease(v329);
    }
    if (v330) {
      CFRelease(v330);
    }
    if (v331) {
      CFRelease(v331);
    }
    if (v332) {
      CFRelease(v332);
    }
    if (v333) {
      CFRelease(v333);
    }
    if (v334) {
      CFRelease(v334);
    }
    if (v335) {
      CFRelease(v335);
    }
    if (v336) {
      CFRelease(v336);
    }
    if (v337) {
      CFRelease(v337);
    }
    if (v338) {
      CFRelease(v338);
    }
    if (v339) {
      CFRelease(v339);
    }
    if (v340) {
      CFRelease(v340);
    }
    if (v341) {
      CFRelease(v341);
    }
    if (v342) {
      CFRelease(v342);
    }
    if (v343) {
      CFRelease(v343);
    }
    if (v344) {
      CFRelease(v344);
    }
    if (v345) {
      CFRelease(v345);
    }
    if (v346) {
      CFRelease(v346);
    }
    if (v347) {
      CFRelease(v347);
    }
    if (v348) {
      CFRelease(v348);
    }
    if (v349) {
      CFRelease(v349);
    }
    if (v350) {
      CFRelease(v350);
    }
    if (v351) {
      CFRelease(v351);
    }
    if (v352) {
      CFRelease(v352);
    }
    if (v353) {
      CFRelease(v353);
    }
    if (v354) {
      CFRelease(v354);
    }
    if (v355) {
      CFRelease(v355);
    }
    if (v356) {
      CFRelease(v356);
    }
    if (v357) {
      CFRelease(v357);
    }
    if (v358) {
      CFRelease(v358);
    }
    if (v359) {
      CFRelease(v359);
    }
    if (v360) {
      CFRelease(v360);
    }
    if (v361) {
      CFRelease(v361);
    }
    if (v362) {
      CFRelease(v362);
    }
    if (v363) {
      CFRelease(v363);
    }
    if (v364) {
      CFRelease(v364);
    }
    if (v365) {
      CFRelease(v365);
    }
    if (v366) {
      CFRelease(v366);
    }
    if (v367) {
      CFRelease(v367);
    }
    if (v368) {
      CFRelease(v368);
    }
    if (v369) {
      CFRelease(v369);
    }
    if (v370) {
      CFRelease(v370);
    }
    if (v371) {
      CFRelease(v371);
    }
    if (v372) {
      CFRelease(v372);
    }
    if (v373) {
      CFRelease(v373);
    }
    if (v374) {
      CFRelease(v374);
    }
    if (v375) {
      CFRelease(v375);
    }
    if (v376) {
      CFRelease(v376);
    }
    if (v377) {
      CFRelease(v377);
    }
    if (v378) {
      CFRelease(v378);
    }
    if (v379) {
      CFRelease(v379);
    }
    if (v380) {
      CFRelease(v380);
    }
    if (v381) {
      CFRelease(v381);
    }
    if (v382) {
      CFRelease(v382);
    }
    if (v383) {
      CFRelease(v383);
    }
    if (v384) {
      CFRelease(v384);
    }
    if (v385) {
      CFRelease(v385);
    }
    if (v386) {
      CFRelease(v386);
    }
    if (v387) {
      CFRelease(v387);
    }
    if (v388) {
      CFRelease(v388);
    }
    if (v389) {
      CFRelease(v389);
    }
    if (v390) {
      CFRelease(v390);
    }
    if (v391) {
      CFRelease(v391);
    }
    if (v392) {
      CFRelease(v392);
    }
    if (v393) {
      CFRelease(v393);
    }
    if (v394) {
      CFRelease(v394);
    }
    if (v395) {
      CFRelease(v395);
    }
    if (v396) {
      CFRelease(v396);
    }
    if (v397) {
      CFRelease(v397);
    }
    if (v398) {
      CFRelease(v398);
    }
    if (v399) {
      CFRelease(v399);
    }
    if (v212) {
      CFRelease(v212);
    }
    _MergedGlobals_23 = 1;
  }
  return (id)qword_1EB3A9848;
}

+ (id)_internalFeatures
{
  v148[72] = *MEMORY[0x1E4F143B8];
  if ((_MergedGlobals_24 & 1) == 0)
  {
    LOWORD(v12) = 0;
    uint64_t v84 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AcceleratedFiltersEnabled", @"WebKitAcceleratedFiltersEnabled", @"Accelerated Filter Rendering", 1, 0, @"Accelerated CSS and SVG filter rendering", v12);
    v148[0] = v84;
    LOWORD(v13) = 0;
    uint64_t v147 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DOMTestingAPIsEnabled", @"WebKitDOMTestingAPIsEnabled", @"Additional Testing APIs for DOM Objects", 2, 3, @"Enable additional testing APIs for DOM objects", v13);
    v148[1] = v147;
    LOWORD(v14) = 0;
    uint64_t v146 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AllowViewportShrinkToFitContent", @"WebKitAllowViewportShrinkToFitContent", @"Allow Viewport Shrink to Fit Content", 2, 0, @"Allow the viewport shrink to fit content heuristic when appropriate", v14);
    v148[2] = v146;
    LOWORD(v15) = 0;
    uint64_t v145 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AlwaysAllowLocalWebarchive", @"WebKitAlwaysAllowLocalWebarchive", @"Always allow loading local Web Archive", 2, 3, @"Enable always allowing loading local Web Archive", v15);
    v148[3] = v145;
    LOWORD(v16) = 0;
    uint64_t v144 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AppBadgeEnabled", @"WebKitAppBadgeEnabled", @"App Badge", 1, 3, @"Enable App Badge", v16);
    v148[4] = v144;
    LOWORD(v17) = 0;
    uint64_t v143 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AppHighlightsEnabled", @"WebKitAppHighlightsEnabled", @"App Highlights", 1, 2, @"Enable App Highlights", v17);
    v148[5] = v143;
    LOWORD(v18) = 0;
    uint64_t v142 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UseAsyncUIKitInteractions", @"WebKitUseAsyncUIKitInteractions", @"Async UIKit Interactions", 2, 0, @"Use Async UIKit Interactions", v18);
    v148[6] = v142;
    LOWORD(v19) = 0;
    uint64_t v141 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth", @"WebKitAutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth", @"Automatically Adjust View Scale", 2, 0, @"Automatically Adjust View Scale to Fit Min. Effective Device Width", v19);
    v148[7] = v141;
    LOWORD(v20) = 0;
    uint64_t v140 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SpringTimingFunctionEnabled", @"WebKitSpringTimingFunctionEnabled", @"CSS Spring Animations", 1, 2, @"CSS Spring Animation prototype", v20);
    v148[8] = v140;
    LOWORD(v21) = 0;
    uint64_t v139 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CSSLineFitEdgeEnabled", @"WebKitCSSLineFitEdgeEnabled", @"CSS line-fit-edge", 1, 2, @"Enable CSS line-fit-edge", v21);
    v148[9] = v139;
    LOWORD(v22) = 0;
    uint64_t v138 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ClientBadgeEnabled", @"WebKitClientBadgeEnabled", @"Client Badge", 1, 3, @"Enable Client Badge", v22);
    v148[10] = v138;
    LOWORD(v23) = 0;
    uint64_t v137 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CompositingBordersVisible", @"WebKitShowDebugBorders", @"Compositing borders visible", 2, 0, &stru_1F3C7DA90, v23);
    v148[11] = v137;
    LOWORD(v24) = 0;
    uint64_t v136 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CompositingRepaintCountersVisible", @"WebKitShowRepaintCounter", @"Compositing repaint counters visible", 2, 0, &stru_1F3C7DA90, v24);
    v148[12] = v136;
    LOWORD(v25) = 0;
    uint64_t v135 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DOMPasteAccessRequestsEnabled", @"WebKitDOMPasteAccessRequestsEnabled", @"DOM Paste Access Requests", 2, 3, @"Enable DOM Paste Access Requests", v25);
    v148[13] = v135;
    LOWORD(v26) = 0;
    uint64_t v134 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DeclarativeWebPush", @"WebKitDeclarativeWebPush", @"Declarative Web Push", 1, 3, @"Enable Declarative Web Push", v26);
    v148[14] = v134;
    LOWORD(v27) = 0;
    uint64_t v133 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"DisableScreenSizeOverride", @"WebKitDisableScreenSizeOverride", @"Disable screen size override", 2, 0, &stru_1F3C7DA90, v27);
    v148[15] = v133;
    LOWORD(v28) = 0;
    uint64_t v132 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShouldDropNearSuspendedAssertionAfterDelay", @"WebKitShouldDropNearSuspendedAssertionAfterDelay", @"Drop Near-Suspended Assertion After Delay", 2, 0, @"Causes processes to fully suspend after a delay", v28);
    v148[16] = v132;
    LOWORD(v29) = 1;
    uint64_t v131 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ICECandidateFilteringEnabled", @"WebKitICECandidateFilteringEnabled", @"Enable ICE Candidate Filtering", 2, 3, @"Enable ICE Candidate Filtering", v29);
    v148[17] = v131;
    LOWORD(v30) = 0;
    uint64_t v130 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MockCaptureDevicesEnabled", @"WebKitMockCaptureDevicesEnabled", @"Enable Mock Capture Devices", 2, 5, @"Enable Mock Capture Devices", v30);
    v148[18] = v130;
    LOWORD(v31) = 0;
    uint64_t v129 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"EnterKeyHintEnabled", @"WebKitEnterKeyHintEnabled", @"Enter Key Hint", 2, 3, @"Enable the enterKeyHint HTML attribute", v31);
    v148[19] = v129;
    LOWORD(v32) = 0;
    uint64_t v128 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"EventHandlerDrivenSmoothKeyboardScrollingEnabled", @"WebKitEventHandlerDrivenSmoothKeyboardScrollingEnabled", @"EventHandler driven smooth keyboard scrolling", 2, 3, @"Enable EventHandler driven smooth keyboard scrolling", v32);
    v148[20] = v128;
    LOWORD(v33) = 1;
    uint64_t v127 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"RestrictedHTTPResponseAccess", @"WebKitRestrictedHTTPResponseAccess", @"Filter HTTP Response for Web Processes", 2, 6, @"Enable HTTP Response filtering for Web Processes", v33);
    v148[21] = v127;
    LOWORD(v34) = 0;
    uint64_t v126 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"BlockMediaLayerRehostingInWebContentProcess", @"WebKitBlockMediaLayerRehostingInWebContentProcess", @"GPU Process: Block Media Layer Re-hosting", 2, 5, @"GPU Process: Block Media Layer Re-hosting in WebContent process", v34);
    v148[22] = v126;
    LOWORD(v35) = 0;
    uint64_t v125 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ManageCaptureStatusBarInGPUProcessEnabled", @"WebKitManageCaptureStatusBarInGPUProcessEnabled", @"GPU Process: Capture Status Bar management", 2, 5, @"Enable Capture Status Bar management in GPU Process", v35);
    v148[23] = v125;
    LOWORD(v36) = 0;
    uint64_t v124 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UseGPUProcessForWebGLEnabled", @"WebKitUseGPUProcessForWebGLEnabled", @"GPU Process: WebGL", 2, 0, @"Process all WebGL operations in GPU Process", v36);
    v148[24] = v124;
    LOWORD(v37) = 1;
    uint64_t v123 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"AcceleratedDrawingEnabled", @"WebKitAcceleratedDrawingEnabled", @"GraphicsLayer accelerated drawing", 2, 0, @"Enable GraphicsLayer accelerated drawing", v37);
    v148[25] = v123;
    LOWORD(v38) = 0;
    uint64_t v122 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IgnoreIframeEmbeddingProtectionsEnabled", @"WebKitIgnoreIframeEmbeddingProtectionsEnabled", @"Ignore iframe Embedding Protections", 2, 8, @"Ignores X-Frame-Options and CSP ancestors", v38);
    v148[26] = v122;
    LOWORD(v39) = 0;
    uint64_t v121 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ImageAnalysisDuringFindInPageEnabled", @"WebKitImageAnalysisDuringFindInPageEnabled", @"Image Analysis for Find-in-Page", 1, 0, @"Trigger image analysis when performing Find-in-Page", v39);
    v148[27] = v121;
    LOWORD(v40) = 0;
    uint64_t v120 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"InWindowFullscreenEnabled", @"WebKitInWindowFullscreenEnabled", @"In-Window Fullscreen", 2, 5, @"Enable In-Window Fullscreen", v40);
    v148[28] = v120;
    LOWORD(v41) = 0;
    uint64_t v119 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LayerBasedSVGEngineEnabled", @"WebKitLayerBasedSVGEngineEnabled", @"Layer-based SVG Engine (LBSE)", 1, 0, @"Enable next-generation layer-based SVG Engine (LBSE)", v41);
    v148[29] = v119;
    LOWORD(v42) = 1;
    uint64_t v118 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LegacyOverflowScrollingTouchEnabled", @"WebKitLegacyOverflowScrollingTouchEnabled", @"Legacy -webkit-overflow-scrolling property", 2, 0, @"Support the legacy -webkit-overflow-scrolling CSS property", v42);
    v148[30] = v118;
    LOWORD(v43) = 0;
    uint64_t v117 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LegacyLineLayoutVisualCoverageEnabled", @"WebKitLegacyLineLayoutVisualCoverageEnabled", @"Legacy line layout visual coverage", 2, 3, @"Enable legacy line layout visual coverage", v43);
    v148[31] = v117;
    LOWORD(v44) = 1;
    uint64_t v116 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MediaCaptureRequiresSecureConnection", @"WebKitMediaCaptureRequiresSecureConnection", @"Limit Media Capture to Secure Sites", 2, 5, @"Limit Media Capture to Secure Sites", v44);
    v148[32] = v116;
    LOWORD(v45) = 0;
    uint64_t v115 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LinkSanitizerEnabled", @"WebKitLinkSanitizerEnabled", @"Link Sanitizer", 1, 6, @"Enable link sanitizer", v45);
    v148[33] = v115;
    LOWORD(v46) = 0;
    uint64_t v114 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LocalFileContentSniffingEnabled", @"WebKitLocalFileContentSniffingEnabledPreferenceKey", @"Local File Content Sniffing", 2, 6, @"Enable Local File Content Sniffing", v46);
    v148[34] = v114;
    LOWORD(v47) = 0;
    uint64_t v113 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LogsPageMessagesToSystemConsoleEnabled", @"WebKitLogsPageMessagesToSystemConsoleEnabled", @"Log page messages to system console", 2, 3, @"Enable logging page messages to system console", v47);
    v148[35] = v113;
    LOWORD(v48) = 0;
    uint64_t v112 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"CoreMathMLEnabled", @"WebKitCoreMathMLEnabled", @"MathML Core", 1, 3, @"Disable features removed from the MathML Core spec.", v48);
    v148[36] = v112;
    LOWORD(v49) = 1;
    uint64_t v111 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ShouldUseModernAVContentKeySession", @"WebKitShouldUseModernAVContentKeySession", @"Modern AVContentKeySession", 2, 5, @"Use modern AVContentKeySession", v49);
    v148[37] = v111;
    LOWORD(v50) = 0;
    uint64_t v110 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MomentumScrollingAnimatorEnabled", @"WebKitMomentumScrollingAnimatorEnabled", @"Momentum Scrolling Animator", 2, 0, @"Generate momentum events in WebKit instead of using those delivered by the system", v50);
    v148[38] = v110;
    LOWORD(v51) = 0;
    uint64_t v109 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MouseEventsSimulationEnabled", @"WebKitMouseEventsSimulationEnabled", @"Mouse events simulation", 2, 3, @"Enable mouse events dispatch along with touch events on iOS", v51);
    v148[39] = v109;
    LOWORD(v52) = 0;
    uint64_t v108 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"MuteCameraOnMicrophoneInterruptionEnabled", @"WebKitMuteCameraOnMicrophoneInterruptionEnabled", @"Mute Camera on Microphone Interruption", 2, 5, @"Mute Camera on Microphone Interruption", v52);
    v148[40] = v108;
    LOWORD(v53) = 0;
    uint64_t v107 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"FlexFormattingContextIntegrationEnabled", @"WebKitFlexFormattingContextIntegrationEnabled", @"Next-generation flex layout integration (FFC)", 1, 3, @"Enable next-generation flex layout integration (FFC)", v53);
    v148[41] = v107;
    LOWORD(v54) = 0;
    uint64_t v106 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"OpportunisticSweepingAndGarbageCollectionEnabled", @"WebKitOpportunisticSweepingAndGarbageCollectionEnabled", @"Opportunistic Sweeping and GC", 2, 4, @"Enable Opportunistic Sweeping and GC", v54);
    v148[42] = v106;
    LOWORD(v55) = 1;
    uint64_t v105 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"PreferSandboxedMediaParsing", @"WebKitPreferSandboxedMediaParsing", @"Prefer Sandboxed Parsing of Media", 2, 5, @"Prefer parsing media out-of-process in a sandboxed service", v55);
    v148[43] = v105;
    LOWORD(v56) = 0;
    uint64_t v104 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LegacyPluginQuirkForMailSignaturesEnabled", @"WebKitLegacyPluginQuirkForMailSignaturesEnabled", @"Quirk to get Mail to load signatures correctly with WebKitLegacy", 2, 0, @"Quirk to get Mail to load signatures correctly with WebKitLegacy", v56);
    v148[44] = v104;
    LOWORD(v57) = 0;
    uint64_t v103 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"LoginStatusAPIRequiresWebAuthnEnabled", @"WebKitLoginStatusAPIRequiresWebAuthnEnabled", @"Require WebAuthn with the Login Status API", 2, 3, @"Require a recent WebAuthn authentication to set login status", v57);
    v148[45] = v103;
    LOWORD(v58) = 1;
    uint64_t v102 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SpeakerSelectionRequiresUserGesture", @"WebKitSpeakerSelectionRequiresUserGesture", @"Require a user gesture for speaker selection", 2, 5, @"Require a user gesture for speaker selection", v58);
    v148[46] = v102;
    LOWORD(v59) = 1;
    uint64_t v101 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"GetUserMediaRequiresFocus", @"WebKitGetUserMediaRequiresFocus", @"Require focus to start getUserMedia", 2, 5, @"Require focus to start getUserMedia", v59);
    v148[47] = v101;
    LOWORD(v60) = 0;
    uint64_t v100 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ResourceLoadSchedulingEnabled", @"WebKitResourceLoadSchedulingEnabled", @"Resource Load Scheduling", 2, 6, @"Network process side priority and visibility based resource load scheduling", v60);
    v148[48] = v100;
    LOWORD(v61) = 0;
    uint64_t v99 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ResourceUsageOverlayVisible", @"WebKitResourceUsageOverlayVisible", @"Resource usage overlay", 2, 6, @"Make resource usage overlay visible", v61);
    v148[49] = v99;
    LOWORD(v62) = 0;
    uint64_t v98 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"IsSameSiteStrictEnforcementEnabled", @"WebKitIsSameSiteStrictEnforcementEnabled", @"SameSite strict enforcement (ITP)", 1, 7, @"Enable SameSite strict enforcement to mitigate bounce tracking", v62);
    v148[50] = v98;
    LOWORD(v63) = 1;
    uint64_t v97 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SecureContextChecksEnabled", @"WebKitSecureContextChecksEnabled", @"Secure Context Checks", 2, 8, @"Allow access to HTTPS-only Web APIs over HTTP", v63);
    v148[51] = v97;
    LOWORD(v64) = 0;
    uint64_t v96 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"SiteIsolationEnabled", @"WebKitSiteIsolationEnabled", @"Site Isolation", 1, 8, @"Put cross-origin iframes in a different process", v64);
    v148[52] = v96;
    LOWORD(v65) = 1;
    uint64_t v95 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"TextAnimationsEnabled", @"WebKitTextAnimationsEnabled", @"Text Animations", 2, 0, @"Text Animations", v65);
    v148[53] = v95;
    LOWORD(v66) = 0;
    uint64_t v94 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ThreadedAnimationResolutionEnabled", @"WebKitThreadedAnimationResolutionEnabled", @"Threaded animation resolution", 1, 1, @"Run accelerated animations on a separate thread", v66);
    v148[54] = v94;
    LOWORD(v67) = 0;
    uint64_t v93 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"TiledScrollingIndicatorVisible", @"WebKitTiledScrollingIndicatorVisible", @"Tiled scrolling indicator", 2, 0, @"Make tiled scrolling indicator visible", v67);
    v148[55] = v93;
    LOWORD(v68) = 0;
    uint64_t v92 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UndoManagerAPIEnabled", @"WebKitUndoManagerAPIEnabled", @"UndoManager DOM API", 1, 3, @"Enable the UndoManager DOM API", v68);
    v148[56] = v92;
    LOWORD(v69) = 1;
    uint64_t v91 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"UserGesturePromisePropagationEnabled", @"WebKitUserGesturePromisePropagationEnabled", @"UserGesture Promise Propagation", 2, 3, @"UserGesture Promise Propagation", v69);
    v148[57] = v91;
    LOWORD(v70) = 0;
    uint64_t v90 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"ServiceWorkersUserGestureEnabled", @"WebKitServiceWorkersUserGestureEnabled", @"Validate UserGesture requirements in Service Workers", 2, 3, @"Validate UserGesture requirements in Service Workers", v70);
    v148[58] = v90;
    LOWORD(v71) = 0;
    uint64_t v89 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebAPIStatisticsEnabled", @"WebKitWebAPIStatisticsEnabled", @"Web API Statistics", 1, 3, @"Enable Web API Statistics", v71);
    v148[59] = v89;
    LOWORD(v72) = 0;
    uint64_t v88 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebAPIsInShadowRealmEnabled", @"WebKitWebAPIsInShadowRealmEnabled", @"Web APIs in ShadowRealm", 1, 3, @"Enable Web APIs to be exposed in ShadowRealm", v72);
    v148[60] = v88;
    LOWORD(v73) = 0;
    uint64_t v87 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebArchiveTestingModeEnabled", @"WebKitWebArchiveTestingModeEnabled", @"Web Archive testing mode", 2, 3, @"Enable web archive testing mode", v73);
    v148[61] = v87;
    LOWORD(v74) = 0;
    uint64_t v86 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebInspectorEngineeringSettingsAllowed", @"WebKitWebInspectorEngineeringSettingsAllowed", @"WebInspector engineering settings allowed", 2, 3, &stru_1F3C7DA90, v74);
    v148[62] = v86;
    LOWORD(v75) = 1;
    CFTypeRef cf = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCAudioLatencyAdaptationEnabled", @"WebKitWebRTCAudioLatencyAdaptationEnabled", @"WebRTC Audio Latency Adaptation", 2, 5, @"Enable WebRTC Audio Latency Adaptation", v75);
    v148[63] = cf;
    LOWORD(v76) = 1;
    uint64_t v3 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCDTMFEnabled", @"WebKitWebRTCDTMFEnabled", @"WebRTC DTMF", 2, 5, @"Enable WebRTC DTMF", v76);
    v148[64] = v3;
    LOWORD(v77) = 1;
    unsigned __int8 v4 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCH264HardwareEncoderEnabled", @"WebKitWebRTCH264HardwareEncoderEnabled", @"WebRTC H264 Hardware encoder", 2, 5, @"Enable H264 Hardware encoder", v77);
    v148[65] = v4;
    LOWORD(v78) = 0;
    SessionID v5 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCMediaPipelineAdditionalLoggingEnabled", @"WebKitWebRTCMediaPipelineAdditionalLoggingEnabled", @"WebRTC Media Pipeline Additional Logging", 2, 5, @"Enable WebRTC Media Pipeline Additional Logging", v78);
    v148[66] = v5;
    LOWORD(v79) = 0;
    int v6 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCRemoteVideoFrameEnabled", @"WebKitWebRTCRemoteVideoFrameEnabled", @"WebRTC Remote Video Frame", 2, 5, @"Enable WebRTC Remote Video Frame", v79);
    v148[67] = v6;
    LOWORD(v80) = 0;
    uint64_t v7 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCSocketsProxyingEnabled", @"WebKitWebRTCSocketsProxyingEnabled", @"WebRTC Sockets Proxying", 2, 5, @"Enable WebRTC Sockets Proxying", v80);
    v148[68] = v7;
    LOWORD(v81) = 1;
    CFTypeRef v8 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WebRTCVP9Profile0CodecEnabled", @"WebKitWebRTCVP9Profile0CodecEnabled", @"WebRTC VP9 profile 0 codec", 2, 5, @"Enable WebRTC VP9 profile 0 codec", v81);
    v148[69] = v8;
    LOWORD(v82) = 1;
    uint64_t v9 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"WriteRichTextDataWhenCopyingOrDragging", @"WebKitWriteRichTextDataWhenCopyingOrDragging", @"Write RTF on Copy", 2, 0, @"Write RTF, RTFD and attributed strings to the pasteboard when copying or dragging", v82);
    v148[70] = v9;
    LOWORD(v83) = 0;
    long long v10 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", @"RequestStorageAccessThrowsExceptionUntilReload", @"WebKitRequestStorageAccessThrowsExceptionUntilReload", @"requestStorageAccess throws execption until reload", 1, 3, @"requestStorageAccess throws execption until reload", v83);
    v148[71] = v10;
    BOOL v11 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:72];
    qword_1EB3A9858 = (uint64_t)v11;
    if (v11) {
      CFRetain(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (v6) {
      CFRelease(v6);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (v3) {
      CFRelease(v3);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v86) {
      CFRelease(v86);
    }
    if (v87) {
      CFRelease(v87);
    }
    if (v88) {
      CFRelease(v88);
    }
    if (v89) {
      CFRelease(v89);
    }
    if (v90) {
      CFRelease(v90);
    }
    if (v91) {
      CFRelease(v91);
    }
    if (v92) {
      CFRelease(v92);
    }
    if (v93) {
      CFRelease(v93);
    }
    if (v94) {
      CFRelease(v94);
    }
    if (v95) {
      CFRelease(v95);
    }
    if (v96) {
      CFRelease(v96);
    }
    if (v97) {
      CFRelease(v97);
    }
    if (v98) {
      CFRelease(v98);
    }
    if (v99) {
      CFRelease(v99);
    }
    if (v100) {
      CFRelease(v100);
    }
    if (v101) {
      CFRelease(v101);
    }
    if (v102) {
      CFRelease(v102);
    }
    if (v103) {
      CFRelease(v103);
    }
    if (v104) {
      CFRelease(v104);
    }
    if (v105) {
      CFRelease(v105);
    }
    if (v106) {
      CFRelease(v106);
    }
    if (v107) {
      CFRelease(v107);
    }
    if (v108) {
      CFRelease(v108);
    }
    if (v109) {
      CFRelease(v109);
    }
    if (v110) {
      CFRelease(v110);
    }
    if (v111) {
      CFRelease(v111);
    }
    if (v112) {
      CFRelease(v112);
    }
    if (v113) {
      CFRelease(v113);
    }
    if (v114) {
      CFRelease(v114);
    }
    if (v115) {
      CFRelease(v115);
    }
    if (v116) {
      CFRelease(v116);
    }
    if (v117) {
      CFRelease(v117);
    }
    if (v118) {
      CFRelease(v118);
    }
    if (v119) {
      CFRelease(v119);
    }
    if (v120) {
      CFRelease(v120);
    }
    if (v121) {
      CFRelease(v121);
    }
    if (v122) {
      CFRelease(v122);
    }
    if (v123) {
      CFRelease(v123);
    }
    if (v124) {
      CFRelease(v124);
    }
    if (v125) {
      CFRelease(v125);
    }
    if (v126) {
      CFRelease(v126);
    }
    if (v127) {
      CFRelease(v127);
    }
    if (v128) {
      CFRelease(v128);
    }
    if (v129) {
      CFRelease(v129);
    }
    if (v130) {
      CFRelease(v130);
    }
    if (v131) {
      CFRelease(v131);
    }
    if (v132) {
      CFRelease(v132);
    }
    if (v133) {
      CFRelease(v133);
    }
    if (v134) {
      CFRelease(v134);
    }
    if (v135) {
      CFRelease(v135);
    }
    if (v136) {
      CFRelease(v136);
    }
    if (v137) {
      CFRelease(v137);
    }
    if (v138) {
      CFRelease(v138);
    }
    if (v139) {
      CFRelease(v139);
    }
    if (v140) {
      CFRelease(v140);
    }
    if (v141) {
      CFRelease(v141);
    }
    if (v142) {
      CFRelease(v142);
    }
    if (v143) {
      CFRelease(v143);
    }
    if (v144) {
      CFRelease(v144);
    }
    if (v145) {
      CFRelease(v145);
    }
    if (v146) {
      CFRelease(v146);
    }
    if (v147) {
      CFRelease(v147);
    }
    if (v84) {
      CFRelease(v84);
    }
    _MergedGlobals_24 = 1;
  }
  return (id)qword_1EB3A9858;
}

@end