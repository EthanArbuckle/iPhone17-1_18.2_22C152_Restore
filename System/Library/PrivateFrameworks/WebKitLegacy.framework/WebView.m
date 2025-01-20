@interface WebView
+ (BOOL)_HTTPPipeliningEnabled;
+ (BOOL)_canHandleRequest:(id)a3;
+ (BOOL)_canHandleRequest:(id)a3 forMainFrame:(BOOL)a4;
+ (BOOL)_canShowMIMEType:(id)a3 allowingPlugins:(BOOL)a4;
+ (BOOL)_didSetCacheModel;
+ (BOOL)_hasRemoteInspectorSession;
+ (BOOL)_isIconLoadingEnabled;
+ (BOOL)_isRemoteInspectorEnabled;
+ (BOOL)_isUnderMemoryPressure;
+ (BOOL)_representationExistsForURLScheme:(id)a3;
+ (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5 allowingPlugins:(BOOL)a6;
+ (BOOL)canCloseAllWebViews;
+ (BOOL)canShowFile:(id)a3;
+ (BOOL)canShowMIMEType:(NSString *)MIMEType;
+ (BOOL)canShowMIMETypeAsHTML:(NSString *)MIMEType;
+ (BOOL)isCharacterSmartReplaceExempt:(unsigned __int16)a3 isPreviousCharacter:(BOOL)a4;
+ (BOOL)shouldIncludeInWebKitStatistics;
+ (Class)_getPDFRepresentationClass;
+ (Class)_getPDFViewClass;
+ (NSArray)MIMETypesShownAsHTML;
+ (id)_MIMETypeForFile:(id)a3;
+ (id)_decodeData:(id)a3;
+ (id)_generatedMIMETypeForURLScheme:(id)a3;
+ (id)_productivityDocumentMIMETypes;
+ (id)_standardUserAgentWithApplicationName:(id)a3;
+ (id)_supportedMIMETypes;
+ (unint64_t)_cacheModel;
+ (unint64_t)_maxCacheModelInAnyInstance;
+ (void)_addOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6;
+ (void)_addUserScriptToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectionTime:(int)a9 injectedFrames:(int)a10;
+ (void)_addUserStyleSheetToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectedFrames:(int)a9;
+ (void)_cacheModelChangedNotification:(id)a3;
+ (void)_disableAutoStartRemoteInspector;
+ (void)_disableRemoteInspector;
+ (void)_doNotStartObservingNetworkReachability;
+ (void)_enableRemoteInspector;
+ (void)_makeAllWebViewsPerformSelector:(SEL)a3;
+ (void)_preferencesRemovedNotification:(id)a3;
+ (void)_registerPluginMIMEType:(id)a3;
+ (void)_registerURLSchemeAsAllowingDatabaseAccessInPrivateBrowsing:(id)a3;
+ (void)_registerURLSchemeAsSecure:(id)a3;
+ (void)_registerViewClass:(Class)a3 representationClass:(Class)a4 forURLScheme:(id)a5;
+ (void)_releaseMemoryNow;
+ (void)_removeAllUserContentFromGroup:(id)a3;
+ (void)_removeOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6;
+ (void)_removeUserScriptFromGroup:(id)a3 world:(id)a4 url:(id)a5;
+ (void)_removeUserScriptsFromGroup:(id)a3 world:(id)a4;
+ (void)_removeUserStyleSheetFromGroup:(id)a3 world:(id)a4 url:(id)a5;
+ (void)_removeUserStyleSheetsFromGroup:(id)a3 world:(id)a4;
+ (void)_reportException:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4;
+ (void)_resetOriginAccessAllowLists;
+ (void)_setAlwaysUsesComplexTextCodePath:(BOOL)a3;
+ (void)_setCacheModel:(unint64_t)a3;
+ (void)_setDomainRelaxationForbidden:(BOOL)a3 forURLScheme:(id)a4;
+ (void)_setHTTPPipeliningEnabled:(BOOL)a3;
+ (void)_setIconLoadingEnabled:(BOOL)a3;
+ (void)_setLoadResourcesSerially:(BOOL)a3;
+ (void)_setPDFRepresentationClass:(Class)a3;
+ (void)_setPDFViewClass:(Class)a3;
+ (void)_setTileCacheLayerPoolCapacity:(unsigned int)a3;
+ (void)_unregisterPluginMIMEType:(id)a3;
+ (void)_unregisterViewClassAndRepresentationClassForMIMEType:(id)a3;
+ (void)closeAllWebViews;
+ (void)enableWebThread;
+ (void)initialize;
+ (void)registerURLSchemeAsLocal:(NSString *)scheme;
+ (void)registerViewClass:(Class)viewClass representationClass:(Class)representationClass forMIMEType:(NSString *)MIMEType;
+ (void)setMIMETypesShownAsHTML:(NSArray *)MIMETypes;
+ (void)willEnterBackgroundWithCompletionHandler:(id)a3;
- (BOOL)_allowsMessaging;
- (BOOL)_becomingFirstResponderFromOutside;
- (BOOL)_canResetZoom:(BOOL)a3;
- (BOOL)_canShowMIMEType:(id)a3;
- (BOOL)_canZoomIn:(BOOL)a3;
- (BOOL)_canZoomOut:(BOOL)a3;
- (BOOL)_continuousCheckingAllowed;
- (BOOL)_cookieEnabled;
- (BOOL)_fetchCustomFixedPositionLayoutRect:(CGRect *)a3;
- (BOOL)_flushCompositingChanges;
- (BOOL)_inFastImageScalingMode;
- (BOOL)_isClosed;
- (BOOL)_isClosing;
- (BOOL)_isLoading;
- (BOOL)_isMIMETypeRegisteredAsPlugin:(id)a3;
- (BOOL)_isPerformingProgrammaticFocus;
- (BOOL)_isProcessingUserGesture;
- (BOOL)_isSoftwareRenderable;
- (BOOL)_isStopping;
- (BOOL)_isUsingAcceleratedCompositing;
- (BOOL)_isViewVisible;
- (BOOL)_locked_plugInsAreRunningInFrame:(id)a3;
- (BOOL)_needsOneShotDrawingSynchronization;
- (BOOL)_paginationBehavesLikeColumns;
- (BOOL)_paginationLineGridEnabled;
- (BOOL)_pluginsAreRunning;
- (BOOL)_postsAcceleratedCompositingNotifications;
- (BOOL)_realZoomMultiplierIsTextOnly;
- (BOOL)_requestStartDataInteraction:(CGPoint)a3 globalPosition:(CGPoint)a4;
- (BOOL)_selectionIsAll;
- (BOOL)_selectionIsCaret;
- (BOOL)_setMediaLayer:(id)a3 forPluginView:(id)a4;
- (BOOL)_shouldChangeSelectedDOMRange:(id)a3 toDOMRange:(id)a4 affinity:(unint64_t)a5 stillSelecting:(BOOL)a6;
- (BOOL)_tryToPerformDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6;
- (BOOL)_useDarkAppearance;
- (BOOL)_useElevatedUserInterfaceLevel;
- (BOOL)_useFixedLayout;
- (BOOL)_useSystemAppearance;
- (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5;
- (BOOL)_wantsTelephoneNumberParsing;
- (BOOL)_webGLEnabled;
- (BOOL)acceptsFirstResponder;
- (BOOL)allowsRemoteInspection;
- (BOOL)allowsUndo;
- (BOOL)areMemoryCacheDelegateCallsEnabled;
- (BOOL)becomeFirstResponder;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)canMakeTextLarger;
- (BOOL)canMakeTextSmaller;
- (BOOL)canMakeTextStandardSize;
- (BOOL)canMarkAllTextMatches;
- (BOOL)canResetPageZoom;
- (BOOL)canZoomPageIn;
- (BOOL)canZoomPageOut;
- (BOOL)defersCallbacks;
- (BOOL)drawsBackground;
- (BOOL)findString:(id)a3 options:(unint64_t)a4;
- (BOOL)goBack;
- (BOOL)goForward;
- (BOOL)goToBackForwardItem:(WebHistoryItem *)item;
- (BOOL)interactiveFormValidationEnabled;
- (BOOL)isAutomaticDashSubstitutionEnabled;
- (BOOL)isAutomaticLinkDetectionEnabled;
- (BOOL)isAutomaticQuoteSubstitutionEnabled;
- (BOOL)isAutomaticSpellingCorrectionEnabled;
- (BOOL)isAutomaticTextReplacementEnabled;
- (BOOL)isContinuousSpellCheckingEnabled;
- (BOOL)isEditable;
- (BOOL)isSelectTrailingWhitespaceEnabled;
- (BOOL)isTrackingRepaints;
- (BOOL)maintainsInactiveSelection;
- (BOOL)searchFor:(NSString *)string direction:(BOOL)forward caseSensitive:(BOOL)caseFlag wrap:(BOOL)wrapFlag;
- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7;
- (BOOL)shouldClose;
- (BOOL)shouldCloseWithWindow;
- (BOOL)shouldRequestCandidates;
- (BOOL)shouldUpdateWhileOffscreen;
- (BOOL)smartInsertDeleteEnabled;
- (BOOL)supportsTextEncoding;
- (BOOL)tabKeyCyclesThroughElements;
- (BOOL)usesPageCache;
- (CGColor)backgroundColor;
- (CGPoint)_convertPointFromRootView:(CGPoint)a3;
- (CGRect)_convertRectFromRootView:(CGRect)a3;
- (CGRect)_dataInteractionCaretRect;
- (CGRect)_draggedElementBounds;
- (CGSize)_fixedLayoutSize;
- (DOMCSSStyleDeclaration)computedStyleForElement:(DOMElement *)element pseudoElement:(NSString *)pseudoElement;
- (DOMCSSStyleDeclaration)styleDeclarationWithText:(NSString *)text;
- (DOMCSSStyleDeclaration)typingStyle;
- (DOMDocument)mainFrameDocument;
- (DOMRange)editableDOMRangeForPoint:(NSPoint)point;
- (DOMRange)selectedDOMRange;
- (DragData)dragDataForSession:(SEL)a3 client:(id)a4 global:(CGPoint)a5 operation:(CGPoint)a6;
- (NSData)_sourceApplicationAuditData;
- (NSDictionary)elementAtPoint:(NSPoint)point;
- (NSSelectionAffinity)selectionAffinity;
- (NSString)_draggedLinkTitle;
- (NSString)applicationNameForUserAgent;
- (NSString)customUserAgent;
- (NSString)groupName;
- (NSString)mainFrameTitle;
- (NSString)mainFrameURL;
- (NSString)mediaStyle;
- (NSString)preferencesIdentifier;
- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script;
- (NSString)userAgentForURL:(NSURL *)URL;
- (NSURL)_draggedLinkURL;
- (NSUndoManager)undoManager;
- (NSWindow)hostWindow;
- (NakedPtr<WebCore::Page>)page;
- (String)_userAgentString;
- (Vector<WTF::String,)_dictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType;
- (WebBackForwardList)backForwardList;
- (WebEdgeInsets)_unobscuredSafeAreaInsets;
- (WebFrame)mainFrame;
- (WebFrame)selectedFrame;
- (WebPreferences)preferences;
- (WebScriptObject)windowScriptObject;
- (WebUITextIndicatorData)_dataOperationTextIndicator;
- (WebView)initWithFrame:(CGRect)a3;
- (double)_gapBetweenPages;
- (double)_pageLength;
- (double)estimatedProgress;
- (float)_realZoomMultiplier;
- (float)_viewScaleFactor;
- (float)_zoomMultiplier:(BOOL)a3;
- (float)mediaVolume;
- (float)pageSizeMultiplier;
- (float)textSizeMultiplier;
- (id)DOMRangeOfString:(id)a3 relativeTo:(id)a4 options:(unint64_t)a5;
- (id)UIDelegate;
- (id)_UIDelegateForSelector:(SEL)a3;
- (id)_UIDelegateForwarder;
- (id)_UIKitDelegate;
- (id)_UIKitDelegateForwarder;
- (id)_contentsOfUserInterfaceItem:(id)a3;
- (id)_deviceOrientationProvider;
- (id)_displayURL;
- (id)_downloadURL:(id)a3;
- (id)_editableElementsInRect:(CGRect)a3;
- (id)_editingDelegateForwarder;
- (id)_elementAtWindowPoint:(CGPoint)a3;
- (id)_fixedPositionContent;
- (id)_focusedFrame;
- (id)_formDelegate;
- (id)_formDelegateForSelector:(SEL)a3;
- (id)_formDelegateForwarder;
- (id)_frameLoadDelegateForwarder;
- (id)_frameViewAtWindowPoint:(CGPoint)a3;
- (id)_geolocationProvider;
- (id)_getDataInteractionData;
- (id)_initWithArguments:(id)a3;
- (id)_initWithFrame:(CGRect)a3 frameName:(id)a4 groupName:(id)a5;
- (id)_mainFrameOverrideEncoding;
- (id)_notificationIDForTesting:(OpaqueJSValue *)a3;
- (id)_notificationProvider;
- (id)_objectForIdentifier:(unint64_t)a3;
- (id)_openNewWindowWithRequest:(id)a3;
- (id)_pluginForExtension:(id)a3;
- (id)_pluginForMIMEType:(id)a3;
- (id)_policyDelegateForwarder;
- (id)_resourceLoadDelegateForwarder;
- (id)_responderForResponderOperations;
- (id)_selectedOrMainFrame;
- (id)_touchEventRegions;
- (id)_webMailDelegate;
- (id)_webcore_effectiveFirstResponder;
- (id)candidateList;
- (id)caretChangeListener;
- (id)caretChangeListeners;
- (id)currentNodeHighlight;
- (id)documentViewAtWindowPoint:(CGPoint)a3;
- (id)downloadDelegate;
- (id)editingDelegate;
- (id)frameLoadDelegate;
- (id)fullScreenPlaceholderView;
- (id)historyDelegate;
- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6;
- (id)inspector;
- (id)mainFrameIconURL;
- (id)policyDelegate;
- (id)previousValidKeyView;
- (id)quickLookContentForURL:(id)a3;
- (id)rectsForTextMatches;
- (id)resourceLoadDelegate;
- (id)scriptDebugDelegate;
- (id)styleAtSelectionStart;
- (id)textIteratorForRect:(CGRect)a3;
- (id)trackedRepaintRects;
- (id)typingAttributes;
- (int)_keyboardUIMode;
- (int)_paginationMode;
- (int)_visibilityState;
- (int)validationMessageTimerMagnification;
- (unint64_t)_deviceOrientation;
- (unint64_t)_dragSourceAction;
- (unint64_t)_enteredDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6;
- (unint64_t)_layoutMilestones;
- (unint64_t)_pageCount;
- (unint64_t)_renderTreeSize;
- (unint64_t)_updatedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6;
- (unint64_t)countMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7;
- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 highlight:(BOOL)a6 limit:(unint64_t)a7 markMatches:(BOOL)a8;
- (unint64_t)countMatchesForText:(id)a3 options:(unint64_t)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7;
- (unint64_t)dragDestinationActionMaskForSession:(id)a3;
- (unint64_t)markAllMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6;
- (void)_addObject:(id)a3 forIdentifier:(unint64_t)a4;
- (void)_addToAllWebViewsSet;
- (void)_attachScriptDebuggerToAllFrames;
- (void)_cacheFrameLoadDelegateImplementations;
- (void)_cacheHistoryDelegateImplementations;
- (void)_cacheResourceLoadDelegateImplementations;
- (void)_cacheScriptDebugDelegateImplementations;
- (void)_clearCredentials;
- (void)_clearDelegates;
- (void)_clearMainFrameName;
- (void)_clearNotificationPermissionState;
- (void)_close;
- (void)_closePluginDatabases;
- (void)_closeWindow;
- (void)_closeWithFastTeardown;
- (void)_commonInitializationWithFrameName:(id)a3 groupName:(id)a4;
- (void)_destroyAllPlugIns;
- (void)_detachScriptDebuggerFromAllFrames;
- (void)_didCommitLoadForFrame:(id)a3;
- (void)_didCompleteRenderingFrame;
- (void)_didCompleteRenderingUpdateDisplay;
- (void)_didConcludeEditDrag;
- (void)_didFinishScrollingOrZooming;
- (void)_didScrollDocumentInFrameView:(id)a3;
- (void)_dispatchPendingLoadRequests;
- (void)_dispatchTileDidDraw:(id)a3;
- (void)_dispatchUnloadEvent;
- (void)_documentScaleChanged;
- (void)_endedDataInteraction:(CGPoint)a3 global:(CGPoint)a4;
- (void)_enterVideoFullscreenForVideoElement:(NakedPtr<WebCore:(unsigned int)a4 :HTMLVideoElement>)a3 mode:;
- (void)_executeCoreCommandByName:(id)a3 value:(id)a4;
- (void)_exitVideoFullscreen;
- (void)_exitedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6;
- (void)_forceRepaintForTesting;
- (void)_geolocationDidChangePosition:(id)a3;
- (void)_geolocationDidFailWithMessage:(id)a3;
- (void)_getWebCoreDictationAlternatives:(void *)a3 fromTextAlternatives:(const void *)a4;
- (void)_injectLaBanquePostaleQuirks;
- (void)_insertNewlineInQuotedContent;
- (void)_installVisualIdentificationOverlayForViewIfNeeded:(id)a3 kind:(id)a4;
- (void)_invalidateUserAgentCache;
- (void)_listenForLayoutMilestones:(unint64_t)a3;
- (void)_loadBackForwardListFromOtherView:(id)a3;
- (void)_locked_recursivelyPerformPlugInSelector:(SEL)a3 inFrame:(id)a4;
- (void)_mainCoreFrame;
- (void)_mouseDidMoveOverElement:(id)a3 modifierFlags:(unint64_t)a4;
- (void)_notificationDidClick:(id)a3;
- (void)_notificationDidShow:(id)a3;
- (void)_notificationsDidClose:(id)a3;
- (void)_overflowScrollPositionChangedTo:(CGPoint)a3 forNode:(id)a4 isUserScroll:(BOOL)a5;
- (void)_performResponderOperation:(SEL)a3 with:(id)a4;
- (void)_popPerformingProgrammaticFocus;
- (void)_preferencesChanged:(id)a3;
- (void)_preferencesChangedGenerated:(id)a3;
- (void)_preferencesChangedNotification:(id)a3;
- (void)_pushPerformingProgrammaticFocus;
- (void)_removeDictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType;
- (void)_removeFromAllWebViewsSet;
- (void)_removeObjectForIdentifier:(unint64_t)a3;
- (void)_replaceCurrentHistoryItem:(id)a3;
- (void)_replaceSelectionWithNode:(id)a3 matchStyle:(BOOL)a4;
- (void)_resetAllGeolocationPermission;
- (void)_resetZoom:(id)a3 isTextOnly:(BOOL)a4;
- (void)_restorePlugInsFromCache;
- (void)_retrieveKeyboardUIModeFromPreferences:(id)a3;
- (void)_scaleWebView:(float)a3 atOrigin:(CGPoint)a4;
- (void)_scheduleRenderingUpdateForPendingTileCacheRepaint;
- (void)_scheduleUpdateRendering;
- (void)_setAllowsMessaging:(BOOL)a3;
- (void)_setBaseCTM:(CGAffineTransform *)a3 forContext:(CGContext *)a4;
- (void)_setBrowserUserAgentProductVersion:(id)a3 buildVersion:(id)a4 bundleVersion:(id)a5;
- (void)_setCookieEnabled:(BOOL)a3;
- (void)_setCustomFixedPositionLayoutRect:(CGRect)a3;
- (void)_setCustomFixedPositionLayoutRectInWebThread:(CGRect)a3 synchronize:(BOOL)a4;
- (void)_setDeviceOrientation:(unint64_t)a3;
- (void)_setDeviceOrientationProvider:(id)a3;
- (void)_setFixedLayoutSize:(CGSize)a3;
- (void)_setFontFallbackPrefersPictographs:(BOOL)a3;
- (void)_setFormDelegate:(id)a3;
- (void)_setGapBetweenPages:(double)a3;
- (void)_setGeolocationProvider:(id)a3;
- (void)_setHostApplicationProcessIdentifier:(int)a3 auditToken:(id *)a4;
- (void)_setIsVisible:(BOOL)a3;
- (void)_setMaintainsInactiveSelection:(BOOL)a3;
- (void)_setNeedsOneShotDrawingSynchronization:(BOOL)a3;
- (void)_setNeedsUnrestrictedGetMatchedCSSRules:(BOOL)a3;
- (void)_setNotificationProvider:(id)a3;
- (void)_setPageLength:(double)a3;
- (void)_setPaginationBehavesLikeColumns:(BOOL)a3;
- (void)_setPaginationMode:(int)a3;
- (void)_setPortsForUpgradingInsecureSchemeForTesting:(unsigned __int16)a3 withSecurePort:(unsigned __int16)a4;
- (void)_setPostsAcceleratedCompositingNotifications:(BOOL)a3;
- (void)_setResourceLoadSchedulerSuspended:(BOOL)a3;
- (void)_setSourceApplicationAuditData:(id)a3;
- (void)_setTopContentInsetForTesting:(float)a3;
- (void)_setUIKitDelegate:(id)a3;
- (void)_setUIWebViewUserAgentWithBuildVersion:(id)a3;
- (void)_setUnobscuredSafeAreaInsets:(WebEdgeInsets)a3;
- (void)_setUseDarkAppearance:(BOOL)a3;
- (void)_setUseDarkAppearance:(BOOL)a3 useElevatedUserInterfaceLevel:(BOOL)a4;
- (void)_setUseDarkAppearance:(BOOL)a3 useInactiveAppearance:(BOOL)a4;
- (void)_setUseElevatedUserInterfaceLevel:(BOOL)a3;
- (void)_setUseFastImageScalingMode:(BOOL)a3;
- (void)_setUseFixedLayout:(BOOL)a3;
- (void)_setUseSystemAppearance:(BOOL)a3;
- (void)_setVisibilityState:(int)a3 isInitialState:(BOOL)a4;
- (void)_setWantsTelephoneNumberParsing:(BOOL)a3;
- (void)_setWebGLEnabled:(BOOL)a3;
- (void)_setZoomMultiplier:(float)a3 isTextOnly:(BOOL)a4;
- (void)_simplifyMarkup:(id)a3 endNode:(id)a4;
- (void)_startAllPlugIns;
- (void)_startDrag:(const void *)a3;
- (void)_stopAllPlugIns;
- (void)_stopAllPlugInsForPageCache;
- (void)_synchronizeCustomFixedPositionLayoutRect;
- (void)_updateActiveState;
- (void)_updateRendering;
- (void)_updateScreenScaleFromWindow;
- (void)_updateVisibilityState;
- (void)_viewGeometryDidChange;
- (void)_wakWindowVisibilityChanged:(id)a3;
- (void)_willStartRenderingUpdateDisplay;
- (void)_willStartScrollingOrZooming;
- (void)_zoomIn:(id)a3 isTextOnly:(BOOL)a4;
- (void)_zoomOut:(id)a3 isTextOnly:(BOOL)a4;
- (void)addCaretChangeListener:(id)a3;
- (void)addVisitedLinks:(id)a3;
- (void)alignCenter:(id)sender;
- (void)alignJustified:(id)sender;
- (void)alignLeft:(id)sender;
- (void)alignRight:(id)sender;
- (void)applyStyle:(DOMCSSStyleDeclaration *)style;
- (void)capitalizeWord:(id)a3;
- (void)caretChanged;
- (void)centerSelectionInVisibleArea:(id)a3;
- (void)changeAttributes:(id)sender;
- (void)changeBaseWritingDirection:(id)a3;
- (void)changeBaseWritingDirectionToLTR:(id)a3;
- (void)changeBaseWritingDirectionToRTL:(id)a3;
- (void)changeColor:(id)sender;
- (void)changeDocumentBackgroundColor:(id)sender;
- (void)changeFont:(id)sender;
- (void)changeSpelling:(id)a3;
- (void)checkSpelling:(id)sender;
- (void)clearText:(id)a3;
- (void)close;
- (void)complete:(id)a3;
- (void)copy:(id)sender;
- (void)copyFont:(id)sender;
- (void)cut:(id)sender;
- (void)dealloc;
- (void)delete:(id)sender;
- (void)deleteBackward:(id)a3;
- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3;
- (void)deleteForward:(id)a3;
- (void)deleteSelection;
- (void)deleteToBeginningOfLine:(id)a3;
- (void)deleteToBeginningOfParagraph:(id)a3;
- (void)deleteToEndOfLine:(id)a3;
- (void)deleteToEndOfParagraph:(id)a3;
- (void)deleteToMark:(id)a3;
- (void)deleteWordBackward:(id)a3;
- (void)deleteWordForward:(id)a3;
- (void)hideFormValidationMessage;
- (void)ignoreSpelling:(id)a3;
- (void)indent:(id)a3;
- (void)insertBacktab:(id)a3;
- (void)insertDictationPhrases:(id)a3 metadata:(id)a4;
- (void)insertLineBreak:(id)a3;
- (void)insertNewline:(id)a3;
- (void)insertNewlineIgnoringFieldEditor:(id)a3;
- (void)insertParagraphSeparator:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertTabIgnoringFieldEditor:(id)a3;
- (void)insertText:(id)a3;
- (void)lowercaseWord:(id)a3;
- (void)makeBaseWritingDirectionLeftToRight:(id)a3;
- (void)makeBaseWritingDirectionRightToLeft:(id)a3;
- (void)makeTextLarger:(id)sender;
- (void)makeTextSmaller:(id)sender;
- (void)makeTextStandardSize:(id)sender;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)moveBackward:(id)a3;
- (void)moveBackwardAndModifySelection:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveDownAndModifySelection:(id)a3;
- (void)moveForward:(id)a3;
- (void)moveForwardAndModifySelection:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftAndModifySelection:(id)a3;
- (void)moveParagraphBackwardAndModifySelection:(id)a3;
- (void)moveParagraphForwardAndModifySelection:(id)a3;
- (void)moveRight:(id)a3;
- (void)moveRightAndModifySelection:(id)a3;
- (void)moveToBeginningOfDocument:(id)a3;
- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3;
- (void)moveToBeginningOfLine:(id)a3;
- (void)moveToBeginningOfLineAndModifySelection:(id)a3;
- (void)moveToBeginningOfParagraph:(id)a3;
- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3;
- (void)moveToBeginningOfSentence:(id)sender;
- (void)moveToBeginningOfSentenceAndModifySelection:(id)sender;
- (void)moveToEndOfDocument:(id)a3;
- (void)moveToEndOfDocumentAndModifySelection:(id)a3;
- (void)moveToEndOfLine:(id)a3;
- (void)moveToEndOfLineAndModifySelection:(id)a3;
- (void)moveToEndOfParagraph:(id)a3;
- (void)moveToEndOfParagraphAndModifySelection:(id)a3;
- (void)moveToEndOfSentence:(id)sender;
- (void)moveToEndOfSentenceAndModifySelection:(id)sender;
- (void)moveToLeftEndOfLine:(id)a3;
- (void)moveToLeftEndOfLineAndModifySelection:(id)a3;
- (void)moveToRightEndOfLine:(id)a3;
- (void)moveToRightEndOfLineAndModifySelection:(id)a3;
- (void)moveUp:(id)a3;
- (void)moveUpAndModifySelection:(id)a3;
- (void)moveWordBackward:(id)a3;
- (void)moveWordBackwardAndModifySelection:(id)a3;
- (void)moveWordForward:(id)a3;
- (void)moveWordForwardAndModifySelection:(id)a3;
- (void)moveWordLeft:(id)a3;
- (void)moveWordLeftAndModifySelection:(id)a3;
- (void)moveWordRight:(id)a3;
- (void)moveWordRightAndModifySelection:(id)a3;
- (void)orderFrontSubstitutionsPanel:(id)a3;
- (void)outdent:(id)a3;
- (void)overWrite:(id)sender;
- (void)pageDown:(id)a3;
- (void)pageDownAndModifySelection:(id)a3;
- (void)pageUp:(id)a3;
- (void)pageUpAndModifySelection:(id)a3;
- (void)paste:(id)sender;
- (void)pasteAsPlainText:(id)sender;
- (void)pasteAsRichText:(id)sender;
- (void)pasteFont:(id)sender;
- (void)performFindPanelAction:(id)sender;
- (void)registerForEditingDelegateNotification:(id)a3 selector:(SEL)a4;
- (void)reload:(id)sender;
- (void)reloadFromOrigin:(id)sender;
- (void)removeAllCaretChangeListeners;
- (void)removeCaretChangeListener:(id)a3;
- (void)removeVisitedLink:(id)a3;
- (void)replaceSelectionWithArchive:(WebArchive *)archive;
- (void)replaceSelectionWithMarkupString:(NSString *)markupString;
- (void)replaceSelectionWithNode:(DOMNode *)node;
- (void)replaceSelectionWithText:(NSString *)text;
- (void)resetPageZoom:(id)a3;
- (void)resetTrackedRepaints;
- (void)resumeAllMediaPlayback;
- (void)revealCurrentSelection;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)scrollDOMRangeToVisible:(id)a3;
- (void)scrollDOMRangeToVisible:(id)a3 withInset:(double)a4;
- (void)scrollLineDown:(id)a3;
- (void)scrollLineUp:(id)a3;
- (void)scrollPageDown:(id)a3;
- (void)scrollPageUp:(id)a3;
- (void)scrollToBeginningOfDocument:(id)a3;
- (void)scrollToEndOfDocument:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectLine:(id)a3;
- (void)selectParagraph:(id)a3;
- (void)selectSentence:(id)sender;
- (void)selectToMark:(id)a3;
- (void)selectWord:(id)a3;
- (void)setAllowsRemoteInspection:(BOOL)a3;
- (void)setAllowsUndo:(BOOL)a3;
- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCaretChangeListener:(id)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)continuousSpellCheckingEnabled;
- (void)setCurrentNodeHighlight:(id)a3;
- (void)setCustomTextEncodingName:(NSString *)customTextEncodingName;
- (void)setCustomUserAgent:(NSString *)customUserAgent;
- (void)setDefersCallbacks:(BOOL)a3;
- (void)setDownloadDelegate:(id)downloadDelegate;
- (void)setDrawsBackground:(BOOL)drawsBackground;
- (void)setEditable:(BOOL)editable;
- (void)setEditingDelegate:(id)editingDelegate;
- (void)setFrameLoadDelegate:(id)frameLoadDelegate;
- (void)setGroupName:(NSString *)groupName;
- (void)setHistoryDelegate:(id)a3;
- (void)setHostWindow:(NSWindow *)hostWindow;
- (void)setInteractiveFormValidationEnabled:(BOOL)a3;
- (void)setMainFrameURL:(NSString *)mainFrameURL;
- (void)setMaintainsBackForwardList:(BOOL)flag;
- (void)setMark:(id)a3;
- (void)setMediaStyle:(NSString *)mediaStyle;
- (void)setMediaVolume:(float)a3;
- (void)setMemoryCacheDelegateCallsEnabled:(BOOL)a3;
- (void)setNextKeyView:(id)a3;
- (void)setPageSizeMultiplier:(float)a3;
- (void)setPolicyDelegate:(id)policyDelegate;
- (void)setPreferences:(WebPreferences *)preferences;
- (void)setPreferencesIdentifier:(NSString *)preferencesIdentifier;
- (void)setResourceLoadDelegate:(id)resourceLoadDelegate;
- (void)setScriptDebugDelegate:(id)a3;
- (void)setSelectTrailingWhitespaceEnabled:(BOOL)a3;
- (void)setSelectedDOMRange:(DOMRange *)range affinity:(NSSelectionAffinity)selectionAffinity;
- (void)setShouldCloseWithWindow:(BOOL)shouldCloseWithWindow;
- (void)setShouldUpdateWhileOffscreen:(BOOL)shouldUpdateWhileOffscreen;
- (void)setShowingInspectorIndication:(BOOL)a3;
- (void)setSmartInsertDeleteEnabled:(BOOL)smartInsertDeleteEnabled;
- (void)setTabKeyCyclesThroughElements:(BOOL)a3;
- (void)setTextSizeMultiplier:(float)textSizeMultiplier;
- (void)setTracksRepaints:(BOOL)a3;
- (void)setTypingStyle:(DOMCSSStyleDeclaration *)typingStyle;
- (void)setUIDelegate:(id)UIDelegate;
- (void)setUsesPageCache:(BOOL)a3;
- (void)setValidationMessageTimerMagnification:(int)a3;
- (void)setWebMailDelegate:(id)a3;
- (void)showGuessPanel:(id)sender;
- (void)startSpeaking:(id)sender;
- (void)stopLoading:(id)sender;
- (void)stopLoadingAndClear;
- (void)stopSpeaking:(id)sender;
- (void)subscript:(id)a3;
- (void)superscript:(id)a3;
- (void)suspendAllMediaPlayback;
- (void)swapWithMark:(id)a3;
- (void)takeFindStringFromSelection:(id)a3;
- (void)takeStringURLFrom:(id)sender;
- (void)toggleBaseWritingDirection:(id)a3;
- (void)toggleBold:(id)a3;
- (void)toggleContinuousSpellChecking:(id)sender;
- (void)toggleItalic:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)transpose:(id)a3;
- (void)underline:(id)a3;
- (void)unmarkAllTextMatches;
- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4;
- (void)unscript:(id)a3;
- (void)updateLayoutIgnorePendingStyleSheets;
- (void)uppercaseWord:(id)a3;
- (void)viewDidMoveToWindow;
- (void)yank:(id)a3;
- (void)yankAndSelect:(id)a3;
- (void)zoomPageIn:(id)a3;
- (void)zoomPageOut:(id)a3;
@end

@implementation WebView

+ (void)_makeAllWebViewsPerformSelector:(SEL)a3
{
  if (byte_1EB3A96CE)
  {
    if (qword_1EB3A9700) {
      [(id)qword_1EB3A9700 makeObjectsPerformSelector:a3];
    }
  }
  else
  {
    qword_1EB3A9700 = 0;
    byte_1EB3A96CE = 1;
  }
}

- (void)_removeFromAllWebViewsSet
{
  if (byte_1EB3A96CE)
  {
    if (qword_1EB3A9700) {
      CFSetRemoveValue((CFMutableSetRef)qword_1EB3A9700, self);
    }
  }
  else
  {
    qword_1EB3A9700 = 0;
    byte_1EB3A96CE = 1;
  }
}

- (void)_addToAllWebViewsSet
{
  if (byte_1EB3A96CE)
  {
    Mutable = (__CFSet *)qword_1EB3A9700;
    if (qword_1EB3A9700) {
      goto LABEL_3;
    }
  }
  else
  {
    qword_1EB3A9700 = 0;
    byte_1EB3A96CE = 1;
  }
  Mutable = CFSetCreateMutable(0, 0, &NonRetainingSetCallbacks);
  if (byte_1EB3A96CE)
  {
    v5 = (const void *)qword_1EB3A9700;
    qword_1EB3A9700 = (uint64_t)Mutable;
    if (!v5)
    {
LABEL_3:
      v4 = self;
      goto LABEL_5;
    }
    CFRelease(v5);
    if (byte_1EB3A96CE == 1)
    {
      Mutable = (__CFSet *)qword_1EB3A9700;
      v4 = self;
    }
    else
    {
      Mutable = 0;
      qword_1EB3A9700 = 0;
      byte_1EB3A96CE = 1;
      v4 = self;
    }
  }
  else
  {
    byte_1EB3A96CE = 1;
    qword_1EB3A9700 = (uint64_t)Mutable;
    v4 = self;
  }
LABEL_5:
  CFSetSetValue(Mutable, v4);
}

+ (id)_standardUserAgentWithApplicationName:(id)a3
{
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::standardUserAgentWithApplicationName();
  if (v9)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v3);
        v6 = v8;
        v8 = 0;
        if (!v6) {
          return v4;
        }
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        v6 = v8;
        v8 = 0;
        if (!v6) {
          return v4;
        }
      }
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    v4 = &stru_1F3C7DA90;
  }
  v6 = v8;
  v8 = 0;
  if (!v6) {
    return v4;
  }
LABEL_8:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

- (void)_setBrowserUserAgentProductVersion:(id)a3 buildVersion:(id)a4 bundleVersion:(id)a5
{
  uint64_t v6 = [NSString stringWithFormat:@"Version/%@ Mobile/15E148 Safari/%@", a4, a3, a5];
  [(WebView *)self setApplicationNameForUserAgent:v6];
}

- (void)_setUIWebViewUserAgentWithBuildVersion:(id)a3
{
}

+ (void)_reportException:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  if (a3 && a4)
  {
    JSC::JSLockHolder::JSLockHolder();
    uint64_t v5 = *(unsigned int *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C);
    BOOL v6 = *(_DWORD *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C) != 0;
    uint64_t v7 = 16 * v5;
    if (v5) {
      BOOL v8 = v7 == MEMORY[0x1E4FB64A0];
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      do
      {
        uint64_t v7 = *(void *)(v7 + 16);
        BOOL v6 = v7 != 0;
      }
      while (v7 != MEMORY[0x1E4FB64A0] && v7 != 0);
    }
    if (v6) {
      WebCore::reportException();
    }
    MEMORY[0x1E4E43B10](v10);
  }
}

- (void)_dispatchPendingLoadRequests
{
  v2 = (void *)WebCore::platformStrategies((WebCore *)self);
  uint64_t v3 = v2[1];
  if (v3)
  {
  }
  else
  {
    uint64_t v3 = (*(uint64_t (**)(void *))(*v2 + 16))(v2);
    v2[1] = v3;
  }
  WebResourceLoadScheduler::servePendingRequests(v3, 0);
}

- (void)_injectLaBanquePostaleQuirks
{
  if (_MergedGlobals_11 == 1)
  {
    v2 = (WTF::StringImpl *)qword_1EB3A96E0;
  }
  else
  {
    createLaBanquePostaleQuirksScript(v23);
    v2 = v23[0];
    qword_1EB3A96E0 = (uint64_t)v23[0];
    _MergedGlobals_11 = 1;
  }
  v23[0] = 0;
  WTF::URL::invalidate((WTF::URL *)v23);
  v21 = 0;
  uint64_t v22 = 0;
  v19 = 0;
  uint64_t v20 = 0;
  uint64_t v3 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x58);
  MEMORY[0x1E4E442D0](&v25, v2);
  MEMORY[0x1E4E44710](v3, &v25, v23, &v21, &v19, 1, 0, 0);
  uint64_t v5 = v25;
  v24 = v3;
  v25 = 0;
  if (!v5)
  {
LABEL_6:
    uint64_t v6 = HIDWORD(v20);
    if (!HIDWORD(v20)) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_6;
  }
  WTF::StringImpl::destroy(v5, v4);
  uint64_t v6 = HIDWORD(v20);
  if (!HIDWORD(v20)) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v7 = v19;
  uint64_t v8 = 8 * v6;
  do
  {
    v9 = *(WTF::StringImpl **)v7;
    *(void *)uint64_t v7 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v4);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    uint64_t v7 = (WTF *)((char *)v7 + 8);
    v8 -= 8;
  }
  while (v8);
LABEL_15:
  v10 = v19;
  if (v19)
  {
    v19 = 0;
    LODWORD(v20) = 0;
    WTF::fastFree(v10, v4);
  }
  if (HIDWORD(v22))
  {
    v11 = v21;
    uint64_t v12 = 8 * HIDWORD(v22);
    do
    {
      v13 = *(WTF::StringImpl **)v11;
      *(void *)v11 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v4);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
      }
      v11 = (WTF *)((char *)v11 + 8);
      v12 -= 8;
    }
    while (v12);
  }
  v14 = v21;
  if (v21)
  {
    v21 = 0;
    LODWORD(v22) = 0;
    WTF::fastFree(v14, v4);
  }
  v15 = v23[0];
  v23[0] = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v4);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  +[WebScriptWorld world];
  v24 = 0;
  WebCore::UserContentController::addUserScript();
  if (v3)
  {
    WebCore::UserScript::~UserScript(v3, v16);
    WTF::fastFree(v17, v18);
  }
}

- (void)_commonInitializationWithFrameName:(id)a3 groupName:(id)a4
{
  uint64_t v7 = +[WebPreferences standardPreferences];
  [(WebPreferences *)v7 willAddToWebView];
  uint64_t v8 = self->_private;
  if (v7) {
    CFRetain(v7);
  }
  m_ptr = v8->preferences.m_ptr;
  v8->preferences.m_ptr = v7;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_private->mainFrameDocumentReady = 0;
  self->_private->drawsBackground = 1;
  v195 = (WTF::StringImpl *)0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  v11 = self->_private;
  uint64_t v12 = (void *)cf[0];
  cf[0] = 0;
  v13 = v11->backgroundColor.m_ptr;
  v11->backgroundColor.m_ptr = v12;
  if (v13)
  {
    CFRelease(v13);
    CFTypeRef v14 = cf[0];
    cf[0] = 0;
    if (v14) {
      CFRelease(v14);
    }
  }
  if (((unint64_t)v195 & 0x8000000000000) != 0)
  {
    v15 = (unsigned int *)((unint64_t)v195 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)((unint64_t)v195 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v15);
      WTF::fastFree((WTF *)v15, v10);
    }
  }
  [(WebView *)self frame];
  v178 = -[WebFrameView initWithFrame:]([WebFrameView alloc], "initWithFrame:", 0.0, 0.0, v16, v17);
  [(WebFrameView *)v178 setAutoresizingMask:18];
  [(WebView *)self addSubview:v178];
  v18 = (WTF *)[(WebView *)self updateTouchBar];
  if ((byte_1EB3A96C9 & 1) == 0)
  {
    WTF::logChannels(v18);
    LOBYTE(v220) = 0;
    char v221 = 0;
    v19 = (WebCore *)WTF::LogChannels::initializeLogChannelsIfNecessary();
    WebCore::logChannels(v19);
    LOBYTE(v218) = 0;
    char v219 = 0;
    WTF::LogChannels::initializeLogChannelsIfNecessary();
    {
      WTF::NeverDestroyed<WebKit::LogChannels,WTF::AnyThreadsAccessTraits>::NeverDestroyed<>((uint64_t)&WebKit::logChannels(void)::logChannels);
    }
    LOBYTE(v216) = 0;
    char v217 = 0;
    uint64_t v20 = (WebPlatformStrategies *)WTF::LogChannels::initializeLogChannelsIfNecessary();
    WebPlatformStrategies::initializeIfNecessary(v20);
    v21 = (WebCore::WebSQLiteDatabaseTrackerClient *)initializeDOMWrapperHooks();
    WebCore::WebSQLiteDatabaseTrackerClient::sharedWebSQLiteDatabaseTrackerClient(v21);
    WebCore::SQLiteDatabaseTracker::setClient();
    if ([(WebPreferences *)v7 databasesEnabled]) {
      +[WebDatabaseManager sharedWebDatabaseManager];
    }
    uint64_t v22 = (WebCore::GamepadProvider *)[(WebPreferences *)v7 storageTrackerEnabled];
    if (v22) {
      WebKitInitializeStorageIfNecessary();
    }
    if ((byte_1EB3A96CF & 1) == 0)
    {
      v23 = (WebCore::GameControllerGamepadProvider *)WebCore::GamepadProvider::singleton(v22);
      WebCore::GameControllerGamepadProvider::singleton(v23);
      uint64_t v22 = (WebCore::GamepadProvider *)WebCore::GamepadProvider::setSharedProvider();
      byte_1EB3A96CF = 1;
    }
    if (WebCore::IOSApplication::isMobileSafari(v22)) {
      WebCore::DeprecatedGlobalSettings::setShouldManageAudioSessionCategory((WebCore::DeprecatedGlobalSettings *)1);
    }
    v24 = NSTemporaryDirectory();
    MEMORY[0x1E4E442D0](&v195, v24);
    WTF::FileSystemImpl::pathByAppendingComponent();
    WebCore::HTMLMediaElement::setMediaCacheDirectory((WebCore::HTMLMediaElement *)cf, v25);
    v27 = (WTF::StringImpl *)cf[0];
    cf[0] = 0;
    if (v27)
    {
      if (*(_DWORD *)v27 == 2)
      {
        WTF::StringImpl::destroy(v27, v26);
        v28 = v195;
        v195 = 0;
        if (!v28)
        {
LABEL_31:
          byte_1EB3A96C9 = 1;
          goto LABEL_32;
        }
LABEL_28:
        if (*(_DWORD *)v28 == 2) {
          WTF::StringImpl::destroy(v28, v26);
        }
        else {
          *(_DWORD *)v28 -= 2;
        }
        goto LABEL_31;
      }
      *(_DWORD *)v27 -= 2;
    }
    v28 = v195;
    v195 = 0;
    if (!v28) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_32:
  MEMORY[0x1E4E442D0](&v195, a4);
  MEMORY[0x1E4E442D0](v222, [self->_private->preferences.m_ptr _localStorageDatabasePath]);
  WebViewGroup::getOrCreate((WebViewGroup *)&v195, (const WTF::String *)v222, (WebViewGroup **)cf);
  v30 = self->_private;
  v31 = (WebViewGroup *)cf[0];
  cf[0] = 0;
  v32 = v30->group.m_ptr;
  v30->group.m_ptr = v31;
  if (v32)
  {
    if (*(_DWORD *)v32 == 1)
    {
      WebViewGroup::~WebViewGroup(v32, v29);
      WTF::fastFree(v34, v35);
      v33 = (WTF::StringImpl *)v222[0];
      v222[0] = 0;
      if (!v33) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    --*(_DWORD *)v32;
  }
  v33 = (WTF::StringImpl *)v222[0];
  v222[0] = 0;
  if (!v33)
  {
LABEL_40:
    v36 = v195;
    v195 = 0;
    if (!v36) {
      goto LABEL_46;
    }
    goto LABEL_43;
  }
LABEL_38:
  if (*(_DWORD *)v33 != 2)
  {
    *(_DWORD *)v33 -= 2;
    goto LABEL_40;
  }
  WTF::StringImpl::destroy(v33, v29);
  v36 = v195;
  v195 = 0;
  if (!v36) {
    goto LABEL_46;
  }
LABEL_43:
  if (*(_DWORD *)v36 == 2) {
    WTF::StringImpl::destroy(v36, v29);
  }
  else {
    *(_DWORD *)v36 -= 2;
  }
LABEL_46:
  v37 = self->_private->group.m_ptr;
  v195 = (WTF::StringImpl *)self;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v37 + 2, (uint64_t *)&v195, (uint64_t)cf);
  uint64_t v38 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v38 + 8) = 1;
  *(void *)uint64_t v38 = &unk_1F3C7AD00;
  *(void *)(v38 + 16) = 0;
  WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  [(WebPreferences *)[(WebView *)self preferences] privateBrowsingEnabled];
  v39 = (WebEditorClient *)WTF::fastMalloc((WTF *)0xB8);
  WebEditorClient::WebEditorClient(v39, self);
  v205 = 0;
  v206 = v39;
  v40 = (WebCore::WebRTCProvider *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v40 + 2) = 1;
  *(void *)v40 = &unk_1F3C79B90;
  v204 = (atomic_uint *)v40;
  WebCore::WebRTCProvider::create(&v203, v40);
  uint64_t v41 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)(v41 + 8) = 1;
  *(void *)uint64_t v41 = &unk_1F3C7AD28;
  v42 = (_DWORD *)*((void *)self->_private->group.m_ptr + 5);
  ++v42[2];
  v201 = v42;
  v202 = (_DWORD *)v41;
  v43 = (BackForwardList *)WTF::fastMalloc((WTF *)0x48);
  BackForwardList::BackForwardList(v43, self);
  v200 = v44;
  atomic_fetch_add((atomic_uint *volatile)(v38 + 8), 1u);
  v198 = (unsigned int *)v38;
  WebCore::CookieJar::create();
  v45 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v45 = &unk_1F3C7D750;
  v45[1] = self;
  v197 = v45;
  v46 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)v46 = &unk_1F3C7B400;
  v195 = v46;
  int v196 = 0;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::m_generationProtected)
  {
    __break(0xC471u);
    JUMPOUT(0x1E13F64CCLL);
  }
  IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  uint64_t v48 = WebCore::Process::identifier(IdentifierInternal);
  uint64_t v194 = 0;
  v49 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v49 = &unk_1F3C7B428;
  v49[1] = 0;
  v193 = 0;
  v222[0] = v49;
  v50 = (void *)WTF::fastMalloc((WTF *)8);
  void *v50 = MEMORY[0x1E4FB6B78] + 16;
  v192 = v50;
  WebBroadcastChannelRegistry::getOrCreate([(WebPreferences *)[(WebView *)self preferences] privateBrowsingEnabled], (uint64_t *)&v190);
  uint64_t v51 = (uint64_t)v190;
  v190 = 0;
  v191 = (_DWORD *)v51;
  v52 = (void *)WTF::fastMalloc((WTF *)0x18);
  v52[1] = 0;
  v52[2] = 0;
  void *v52 = &unk_1F3C7B4A0;
  v188 = 0;
  v189 = v52;
  v53 = (WebCore::DummyModelPlayerProvider *)WTF::fastMalloc((WTF *)8);
  WebCore::DummyModelPlayerProvider::DummyModelPlayerProvider(v53);
  v186 = 0;
  v187 = v53;
  v54 = (LegacyHistoryItemClient *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v54 + 2) = 1;
  *(void *)v54 = &unk_1F3C7B338;
  v185 = v54;
  uint64_t v55 = LegacyHistoryItemClient::singleton(v54);
  ++*(_DWORD *)(v55 + 8);
  v184 = (_DWORD *)v55;
  v56 = (void *)WTF::fastMalloc((WTF *)8);
  void *v56 = &unk_1F3C7D298;
  v183 = v56;
  uint64_t v57 = WTF::fastMalloc((WTF *)0x20);
  WebCore::ChromeClient::ChromeClient((WebCore::ChromeClient *)v57);
  *(void *)uint64_t v57 = &unk_1F3C7B630;
  *(unsigned char *)(v57 + 8) = 0;
  objc_initWeak((id *)(v57 + 16), self);
  *(void *)uint64_t v57 = &unk_1F3C7BDD0;
  *(_DWORD *)(v57 + 24) = 0;
  v181 = 0;
  uint64_t v182 = v57;
  v58 = (id *)WTF::fastMalloc((WTF *)0x10);
  id *v58 = &unk_1F3C7C598;
  objc_initWeak(v58 + 1, self);
  v176 = v222;
  v177 = &v192;
  uint64_t v174 = v48;
  v175 = &v194;
  v172 = &v195;
  v173 = IdentifierInternal;
  v170 = &v199;
  v171 = &v197;
  v168 = &v201;
  v169 = &v200;
  WebCore::PageConfiguration::PageConfiguration();
  uint64_t v180 = 0;
  v60 = v178;
  if (v58) {
    (*((void (**)(id *))*v58 + 1))(v58);
  }
  uint64_t v61 = v182;
  uint64_t v182 = 0;
  if (v61) {
    (*(void (**)(uint64_t))(*(void *)v61 + 1928))(v61);
  }
  v62 = v181;
  v181 = 0;
  if (v62)
  {
    objc_destroyWeak(v62 + 2);
    WebCore::ChromeClient::~ChromeClient((WebCore::ChromeClient *)v62);
    WTF::fastFree(v63, v64);
  }
  v65 = v183;
  v183 = 0;
  if (v65) {
    (*(void (**)(void *))(*v65 + 152))(v65);
  }
  v66 = v184;
  v184 = 0;
  if (v66)
  {
    if (v66[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v66 + 8))(v66);
      v67 = v185;
      v185 = 0;
      if (!v67) {
        goto LABEL_64;
      }
      goto LABEL_59;
    }
    --v66[2];
  }
  v67 = v185;
  v185 = 0;
  if (!v67) {
    goto LABEL_64;
  }
LABEL_59:
  if (*((_DWORD *)v67 + 2) == 1) {
    (*(void (**)(LegacyHistoryItemClient *))(*(void *)v67 + 8))(v67);
  }
  else {
    --*((_DWORD *)v67 + 2);
  }
LABEL_64:
  v68 = v187;
  v187 = 0;
  if (v68) {
    (*(void (**)(WebCore::DummyModelPlayerProvider *))(*(void *)v68 + 8))(v68);
  }
  v69 = v186;
  v186 = 0;
  if (v69)
  {
    WebCore::DummyModelPlayerProvider::~DummyModelPlayerProvider(v69);
    WTF::fastFree(v70, v71);
  }
  v72 = v189;
  v189 = 0;
  if (v72) {
    (*(void (**)(void *))(*v72 + 8))(v72);
  }
  v73 = v188;
  v188 = 0;
  if (v73)
  {
    v74 = (WTF::StringImpl *)*((void *)v73 + 2);
    *((void *)v73 + 2) = 0;
    if (v74)
    {
      if (*(_DWORD *)v74 == 2)
      {
        WTF::StringImpl::destroy(v74, v59);
        v75 = (unsigned int *)*((void *)v73 + 1);
        *((void *)v73 + 1) = 0;
        if (!v75)
        {
LABEL_79:
          WTF::fastFree(v73, v59);
          goto LABEL_80;
        }
LABEL_77:
        if (atomic_fetch_add((atomic_uint *volatile)v75 + 2, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v75 + 2);
          (*(void (**)(unsigned int *))(*(void *)v75 + 8))(v75);
        }
        goto LABEL_79;
      }
      *(_DWORD *)v74 -= 2;
    }
    v75 = (unsigned int *)*((void *)v73 + 1);
    *((void *)v73 + 1) = 0;
    if (!v75) {
      goto LABEL_79;
    }
    goto LABEL_77;
  }
LABEL_80:
  v76 = v191;
  v191 = 0;
  if (v76)
  {
    if (v76[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v76 + 8))(v76);
      v77 = v190;
      if (!v190) {
        goto LABEL_89;
      }
      goto LABEL_84;
    }
    --v76[2];
  }
  v77 = v190;
  if (!v190) {
    goto LABEL_89;
  }
LABEL_84:
  if (v77[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v77 + 8))(v77);
  }
  else {
    --v77[2];
  }
LABEL_89:
  v78 = v192;
  v192 = 0;
  if (v78) {
    (*(void (**)(void *))(*v78 + 8))(v78);
  }
  uint64_t v79 = v222[0];
  v222[0] = 0;
  if (v79) {
    (*(void (**)(uint64_t))(*(void *)v79 + 8))(v79);
  }
  v80 = v193;
  v193 = 0;
  if (v80)
  {
    v81 = (_DWORD *)*((void *)v80 + 1);
    *((void *)v80 + 1) = 0;
    if (v81)
    {
      if (v81[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v81 + 8))(v81);
      }
      else {
        --v81[2];
      }
    }
    WTF::fastFree(v80, v59);
  }
  uint64_t v82 = v194;
  uint64_t v194 = 0;
  if (v82)
  {
    v83 = (unsigned int *)(v82 + 8);
    if (atomic_fetch_add((atomic_uint *volatile)(v82 + 8), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v83);
      v164 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v164 = &unk_1F3C797F0;
      v164[1] = v83;
      v222[0] = v164;
      WTF::ensureOnMainThread();
      uint64_t v165 = v222[0];
      v222[0] = 0;
      if (v165) {
        (*(void (**)(uint64_t))(*(void *)v165 + 8))(v165);
      }
    }
  }
  if (v196 != -1) {
    ((void (*)(void *, WTF::StringImpl **))off_1F3C7B358[v196])(v222, &v195);
  }
  v84 = v197;
  v197 = 0;
  if (v84) {
    (*(void (**)(void *))(*v84 + 8))(v84);
  }
  v85 = v199;
  v199 = 0;
  if (v85)
  {
    if (v85[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v85 + 120))(v85);
      v86 = v198;
      v198 = 0;
      if (!v86) {
        goto LABEL_111;
      }
      goto LABEL_109;
    }
    --v85[2];
  }
  v86 = v198;
  v198 = 0;
  if (!v86) {
    goto LABEL_111;
  }
LABEL_109:
  if (atomic_fetch_add((atomic_uint *volatile)v86 + 2, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v86 + 2);
    (*(void (**)(unsigned int *))(*(void *)v86 + 16))(v86);
  }
LABEL_111:
  v87 = v200;
  v200 = 0;
  if (!v87) {
    goto LABEL_114;
  }
  if (v87[2] != 1)
  {
    --v87[2];
LABEL_114:
    v88 = v201;
    v201 = 0;
    if (v88) {
      goto LABEL_115;
    }
LABEL_121:
    v89 = v202;
    v202 = 0;
    if (!v89) {
      goto LABEL_124;
    }
    goto LABEL_122;
  }
  (*(void (**)(_DWORD *))(*(void *)v87 + 8))(v87);
  v88 = v201;
  v201 = 0;
  if (!v88) {
    goto LABEL_121;
  }
LABEL_115:
  if (v88[2] == 1)
  {
    (*(void (**)(_DWORD *))(*(void *)v88 + 8))(v88);
    v89 = v202;
    v202 = 0;
    if (!v89) {
      goto LABEL_124;
    }
  }
  else
  {
    --v88[2];
    v89 = v202;
    v202 = 0;
    if (!v89) {
      goto LABEL_124;
    }
  }
LABEL_122:
  if (v89[2] == 1)
  {
    (*(void (**)(_DWORD *))(*(void *)v89 + 16))(v89);
    uint64_t v90 = v203;
    uint64_t v203 = 0;
    if (!v90) {
      goto LABEL_126;
    }
    goto LABEL_125;
  }
  --v89[2];
LABEL_124:
  uint64_t v90 = v203;
  uint64_t v203 = 0;
  if (v90) {
LABEL_125:
  }
    (*(void (**)(uint64_t))(*(void *)v90 + 8))(v90);
LABEL_126:
  v91 = v204;
  v204 = 0;
  if (!v91 || atomic_fetch_add(v91 + 2, 0xFFFFFFFF) != 1)
  {
    v92 = v206;
    v206 = 0;
    if (!v92) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
  atomic_store(1u, (unsigned int *)v91 + 2);
  (*(void (**)(atomic_uint *))(*(void *)v91 + 24))(v91);
  v92 = v206;
  v206 = 0;
  if (v92) {
LABEL_129:
  }
    (*(void (**)(WebEditorClient *))(*(void *)v92 + 8))(v92);
LABEL_130:
  if (v205)
  {
    WebEditorClient::~WebEditorClient(v205);
    WTF::fastFree(v93, v94);
  }
  v95 = (WebInspectorClient *)WTF::fastMalloc((WTF *)0x30);
  WebInspectorClient::WebInspectorClient(v95, self);
  v96 = v210;
  v210 = v95;
  if (v96) {
    (*(void (**)(WebInspectorClient *))(*(void *)v96 + 8))(v96);
  }
  v97 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v97 = &unk_1F3C7C9A8;
  v97[1] = self;
  v98 = v209;
  v209 = v97;
  if (v98) {
    (*(void (**)(void *))(*v98 + 80))(v98);
  }
  uint64_t v99 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v99 + 8) = 0;
  *(void *)uint64_t v99 = &unk_1F3C7B5D8;
  *(void *)(v99 + 16) = self;
  uint64_t v102 = v208;
  uint64_t v208 = v99;
  if (v102) {
    (*(void (**)(uint64_t))(*(void *)v102 + 8))(v102);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&qword_1EB3A9708, memory_order_acquire) != -1)
  {
    v195 = (WTF::StringImpl *)&v206;
    v222[0] = &v195;
    std::__call_once(&qword_1EB3A9708, v222, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<webApplicationCacheStorage(void)::$_0 &&>>);
  }
  if (byte_1EB3A96D0 == 1)
  {
    v103 = (WTF::StringImpl *)qword_1EB3A9710;
    if (!qword_1EB3A9710) {
      goto LABEL_143;
    }
    goto LABEL_142;
  }
  WebCore::ApplicationCacheStorage::create((WebCore::ApplicationCacheStorage *)&v195, v100, v101);
  v103 = v195;
  v195 = 0;
  WTF::Ref<WebCore::ApplicationCacheStorage,WTF::RawPtrTraits<WebCore::ApplicationCacheStorage>,WTF::DefaultRefDerefTraits<WebCore::ApplicationCacheStorage>>::~Ref(&v195, v166);
  qword_1EB3A9710 = (uint64_t)v103;
  byte_1EB3A96D0 = 1;
  if (v103) {
LABEL_142:
  }
    ++*(_DWORD *)v103;
LABEL_143:
  v104 = v211;
  v211 = v103;
  if (!v104) {
    goto LABEL_146;
  }
  if (*(_DWORD *)v104 != 1)
  {
    --*(_DWORD *)v104;
LABEL_146:
      goto LABEL_147;
LABEL_151:
    uint64_t v109 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v109 + 8) = 1;
    *(void *)uint64_t v109 = &unk_1F3C7C678;
    *(void *)(v109 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v109;
    *(_DWORD *)(v109 + 8) = 2;
    v106 = v212;
    v212 = (_DWORD *)v109;
    if (!v106) {
      goto LABEL_154;
    }
    goto LABEL_148;
  }
  WebCore::ApplicationCacheStorage::~ApplicationCacheStorage(v104, (StringImpl *)v100);
  WTF::fastFree(v107, v108);
    goto LABEL_151;
LABEL_147:
  uint64_t v105 = WebDatabaseProvider::singleton(void)::databaseProvider;
  ++*(_DWORD *)(WebDatabaseProvider::singleton(void)::databaseProvider + 8);
  v106 = v212;
  v212 = (_DWORD *)v105;
  if (!v106) {
    goto LABEL_154;
  }
LABEL_148:
  if (v106[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v106 + 8))(v106);
  }
  else {
    --v106[2];
  }
LABEL_154:
  {
    uint64_t v110 = WebPluginInfoProvider::singleton(void)::pluginInfoProvider;
    ++*(_DWORD *)(WebPluginInfoProvider::singleton(void)::pluginInfoProvider + 8);
    v111 = v213;
    v213 = (_DWORD *)v110;
    if (!v111) {
      goto LABEL_159;
    }
  }
  else
  {
    uint64_t v167 = WTF::fastMalloc((WTF *)0x28);
    *(_DWORD *)(v167 + 8) = 1;
    *(void *)(v167 + 24) = 0;
    *(void *)(v167 + 32) = 0;
    *(void *)(v167 + 16) = 0;
    *(void *)uint64_t v167 = &unk_1F3C7D6D0;
    WebPluginInfoProvider::singleton(void)::pluginInfoProvider = v167;
    *(_DWORD *)(v167 + 8) = 2;
    v111 = v213;
    v213 = (_DWORD *)v167;
    if (!v111) {
      goto LABEL_159;
    }
  }
  if (v111[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v111 + 8))(v111);
  }
  else {
    --v111[2];
  }
LABEL_159:
  v112 = WebViewGroup::storageNamespaceProvider(self->_private->group.m_ptr);
  ++*((_DWORD *)v112 + 2);
  v113 = v214;
  v214 = v112;
  if (!v113) {
    goto LABEL_162;
  }
  if (*((_DWORD *)v113 + 2) != 1)
  {
    --*((_DWORD *)v113 + 2);
LABEL_162:
    v114 = (_DWORD *)*((void *)self->_private->group.m_ptr + 6);
    if (!v114) {
      goto LABEL_164;
    }
    goto LABEL_163;
  }
  (*(void (**)(WebKit::WebStorageNamespaceProvider *))(*(void *)v113 + 8))(v113);
  v114 = (_DWORD *)*((void *)self->_private->group.m_ptr + 6);
  if (v114) {
LABEL_163:
  }
    ++v114[2];
LABEL_164:
  v115 = v215;
  v215 = v114;
  if (v115)
  {
    if (v115[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v115 + 8))(v115);
    }
    else {
      --v115[2];
    }
  }
  WebCore::Page::create();
  v123 = self->_private;
  v124 = v195;
  v195 = 0;
  v125 = (WTF::StringImpl *)v123->page.m_ptr;
  v123->page.m_ptr = (Page *)v124;
  if (!v125) {
    goto LABEL_173;
  }
  int v126 = *(_DWORD *)v125 - 1;
  if (*(_DWORD *)v125 != 1) {
    goto LABEL_172;
  }
  v134 = (WTF *)MEMORY[0x1E4E47DB0](v125, v116, v117, v118, v119, v120, v121, v122, &v201, &v200, &v199, &v197, &v195, IdentifierInternal, v174, &v194, v222, &v192);
  WTF::fastFree(v134, v135);
  v125 = v195;
  v195 = 0;
  if (v125)
  {
    int v126 = *(_DWORD *)v125 - 1;
    if (*(_DWORD *)v125 != 1)
    {
LABEL_172:
      *(_DWORD *)v125 = v126;
      goto LABEL_173;
    }
    v136 = (WTF *)MEMORY[0x1E4E47DB0]();
    WTF::fastFree(v136, v137);
  }
LABEL_173:
  v127 = self->_private->page.m_ptr;
  uint64_t v128 = *((void *)v127 + 2);
  if (v128) {
    goto LABEL_177;
  }
  uint64_t v128 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v128 = 1;
  *(void *)(v128 + 8) = v127;
  v129 = (unsigned int *)*((void *)v127 + 2);
  *((void *)v127 + 2) = v128;
  if (!v129) {
    goto LABEL_177;
  }
  if (atomic_fetch_add((atomic_uint *volatile)v129, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v129);
    WTF::fastFree((WTF *)v129, v116);
    uint64_t v128 = *((void *)v127 + 2);
    if (!v128) {
      goto LABEL_178;
    }
    goto LABEL_177;
  }
  uint64_t v128 = *((void *)v127 + 2);
  if (v128) {
LABEL_177:
  }
    atomic_fetch_add((atomic_uint *volatile)v128, 1u);
LABEL_178:
  v130 = *(unsigned int **)(v38 + 16);
  *(void *)(v38 + 16) = v128;
  if (v130 && atomic_fetch_add((atomic_uint *volatile)v130, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v130);
    WTF::fastFree((WTF *)v130, v116);
  }
  v131 = self->_private->page.m_ptr;
  MEMORY[0x1E4E442D0](&v195, a4);
  WebCore::Page::setGroupName((WebCore::Page *)v131, (const WTF::String *)&v195);
  v133 = v195;
  v195 = 0;
  if (v133)
  {
    if (*(_DWORD *)v133 == 2) {
      WTF::StringImpl::destroy(v133, v132);
    }
    else {
      *(_DWORD *)v133 -= 2;
    }
  }
  v138 = self->_private->page.m_ptr;
  uint64_t v139 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v139 = &unk_1F3C7CDF0;
  *(void *)(v139 + 8) = self;
  WebCore::provideGeolocationTo((WebCore *)v138, (Page *)v139, v140);
  uint64_t v141 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v141 = &unk_1F3C7D208;
  *(void *)(v141 + 8) = self;
  *(void *)(v141 + 16) = 0;
  *(void *)(v141 + 24) = 0;
  *(unsigned char *)(v141 + 32) = 0;
  WebCore::provideNotification();
  {
    WebMediaKeySystemClient::singleton(void)::client = (uint64_t)&unk_1F3C7D108;
    *(void *)algn_1EAD80058 = 0;
  }
  WebCore::provideMediaKeySystemTo();
  WebCore::Page::setInspectable((WebCore::Page *)self->_private->page.m_ptr);
  v142 = self->_private->page.m_ptr;
  [(WebView *)self window];
  WebCore::Page::setCanStartMedia((WebCore::Page *)v142);
  uint64_t v143 = *((void *)self->_private->page.m_ptr + 14);
  MEMORY[0x1E4E442D0](&v195, [(WebPreferences *)[(WebView *)self preferences] _localStorageDatabasePath]);
  v145 = v195;
  if (v195) {
    *(_DWORD *)v195 += 2;
  }
  v146 = *(WTF::StringImpl **)(v143 + 440);
  *(void *)(v143 + 440) = v145;
  if (v146)
  {
    if (*(_DWORD *)v146 == 2)
    {
      WTF::StringImpl::destroy(v146, v144);
      v145 = v195;
      v195 = 0;
      if (!v145) {
        goto LABEL_200;
      }
      goto LABEL_198;
    }
    *(_DWORD *)v146 -= 2;
  }
  v195 = 0;
  if (!v145)
  {
LABEL_200:
    if (HIBYTE(word_1EB3A96D1) == 1) {
      goto LABEL_201;
    }
    goto LABEL_211;
  }
LABEL_198:
  if (*(_DWORD *)v145 != 2)
  {
    *(_DWORD *)v145 -= 2;
    goto LABEL_200;
  }
  v145 = (WTF::StringImpl *)WTF::StringImpl::destroy(v145, v144);
  if (HIBYTE(word_1EB3A96D1) == 1)
  {
LABEL_201:
    if (!(_BYTE)word_1EB3A96D1) {
      goto LABEL_203;
    }
    goto LABEL_202;
  }
LABEL_211:
  if (WebCore::IOSApplication::isLaBanquePostale(v145))
  {
    v60 = v178;
    char v156 = WTF::linkedOnOrAfterSDKWithBehavior();
    LOBYTE(word_1EB3A96D1) = v156 ^ 1;
    HIBYTE(word_1EB3A96D1) = 1;
    if ((v156 & 1) == 0) {
LABEL_202:
    }
      -[WebView _injectLaBanquePostaleQuirks](self, "_injectLaBanquePostaleQuirks", v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, &v191, &v189, &v187, &v185, &v184, &v183, &v182,
        &v180);
  }
  else
  {
    word_1EB3A96D1 = 256;
    v60 = v178;
  }
LABEL_203:
  *(_DWORD *)(*((void *)self->_private->page.m_ptr + 14) + 544) = 5242880;
  [(WebView *)self _updateScreenScaleFromWindow];
  v147 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v147 addObserver:self selector:sel__wakWindowScreenScaleChanged_ name:*MEMORY[0x1E4FB6220] object:0];
  v148 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v148 addObserver:self selector:sel__wakWindowVisibilityChanged_ name:*MEMORY[0x1E4FB6228] object:0];
  v149 = [[WebFixedPositionContent alloc] initWithWebView:self];
  v150 = self->_private;
  v151 = v150->_fixedPositionContent.m_ptr;
  v150->_fixedPositionContent.m_ptr = v149;
  if (v151) {
    CFRelease(v151);
  }
  self->_private->deviceOrientation = (int)objc_msgSend(-[WebView _UIKitDelegateForwarder](self, "_UIKitDelegateForwarder"), "deviceOrientation");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"WebSmartInsertDeleteEnabled"))
  {
    -[WebView setSmartInsertDeleteEnabled:](self, "setSmartInsertDeleteEnabled:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebSmartInsertDeleteEnabled"));
  }
  v153 = self->_private->page.m_ptr;
  WTF::AtomStringImpl::add((uint64_t *)&v195, (WTF::AtomStringImpl *)a3, v152);
  v222[0] = v195;
  +[WebFrame _createMainFrameWithPage:v153 frameName:v222 frameView:v60];
  v155 = (WTF::StringImpl *)v222[0];
  v222[0] = 0;
  if (v155)
  {
    if (*(_DWORD *)v155 == 2) {
      WTF::StringImpl::destroy(v155, v154);
    }
    else {
      *(_DWORD *)v155 -= 2;
    }
  }
  uint64_t v157 = WebThreadNSRunLoop();
  unsigned int v158 = overriddenWebKitLinkTimeVersion;
  if (!overriddenWebKitLinkTimeVersion) {
    unsigned int v158 = NSVersionOfLinkTimeLibrary("UIKit");
  }
  v159 = (void *)MEMORY[0x1E4F1D410];
  if (HIWORD(v158) <= 0xA68u) {
    v159 = (void *)MEMORY[0x1E4F1C3A0];
  }
  [(WebView *)self scheduleInRunLoop:v157 forMode:*v159];
  [(WebView *)self _addToAllWebViewsSet];
  uint64_t v160 = [(WebView *)self nextKeyView];
  if (v160 && v60 != (WebFrameView *)v160) {
    [(WebFrameView *)v60 setNextKeyView:v160];
  }
  v179.receiver = self;
  v179.super_class = (Class)WebView;
  [(WebView *)&v179 setNextKeyView:v60];
  if ([(id)objc_opt_class() shouldIncludeInWebKitStatistics]) {
    ++WebViewCount;
  }
  [(WebView *)self _setIsVisible:[(WebView *)self _isViewVisible]];
  v161 = [(WebView *)self preferences];
  v162 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v162 addObserver:self selector:sel__preferencesChangedNotification_ name:WebPreferencesChangedInternalNotification[0] object:v161];
  [(WebView *)self _preferencesChanged:v161];
  WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)self->_private->page.m_ptr + 14));
  v163 = (WebCore *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitSuppressMemoryPressureHandler");
  if ((v163 & 1) == 0)
  {
    WebCore::registerMemoryReleaseNotifyCallbacks(v163);
    if (atomic_load_explicit((atomic_ullong *volatile)&qword_1EB3A96F8, memory_order_acquire) != -1)
    {
      v195 = (WTF::StringImpl *)&v206;
      v222[0] = &v195;
      std::__call_once(&qword_1EB3A96F8, v222, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebInstallMemoryPressureHandler::$_0 &&>>);
    }
  }
  MEMORY[0x1E4E46960](cf);
  if (atomic_fetch_add((atomic_uint *volatile)(v38 + 8), 0xFFFFFFFF) != 1)
  {
    if (!v60) {
      return;
    }
    goto LABEL_229;
  }
  atomic_store(1u, (unsigned int *)(v38 + 8));
  (*(void (**)(uint64_t))(*(void *)v38 + 16))(v38);
  if (v60) {
LABEL_229:
  }
    CFRelease(v60);
}

- (id)_initWithFrame:(CGRect)a3 frameName:(id)a4 groupName:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)WebView;
  uint64_t v7 = -[WebView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v7->_private = objc_alloc_init(WebViewPrivate);
    [(WebView *)v7 _commonInitializationWithFrameName:a4 groupName:a5];
    [(WebView *)v7 setMaintainsBackForwardList:1];
  }
  return v7;
}

+ (id)_supportedMIMETypes
{
  +[WebPluginDatabase sharedDatabase];
  id v2 = +[WebFrameView _viewTypesAllowImageTypeOmission:0];
  return (id)[v2 allKeys];
}

+ (void)enableWebThread
{
  if ((+[WebView(WebPrivate) enableWebThread]::isWebThreadEnabled & 1) == 0)
  {
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    WebThreadEnable();
    +[WebView(WebPrivate) enableWebThread]::isWebThreadEnabled = 1;
  }
}

- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  v195.receiver = self;
  v195.super_class = (Class)WebView;
  v11 = -[WebView initWithFrame:](&v195, sel_initWithFrame_, a4.origin.x, a4.origin.y);
  if (!v11) {
    return v11;
  }
  v11->_private = objc_alloc_init(WebViewPrivate);
  if (a5)
  {
    [a5 willAddToWebView];
    p_m_ptr = (const void **)&v11->_private->preferences.m_ptr;
  }
  else
  {
    a5 = +[WebPreferences standardPreferences];
    [a5 willAddToWebView];
    p_m_ptr = (const void **)&v11->_private->preferences.m_ptr;
    if (!a5) {
      goto LABEL_6;
    }
  }
  CFRetain(a5);
LABEL_6:
  v13 = *p_m_ptr;
  *p_m_ptr = a5;
  if (v13) {
    CFRelease(v13);
  }
  v11->_private->mainFrameDocumentReady = 0;
  v11->_private->drawsBackground = 1;
  v175 = (WTF::StringImpl *)0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  v15 = v11->_private;
  double v16 = (void *)cf[0];
  cf[0] = 0;
  m_ptr = v15->backgroundColor.m_ptr;
  v15->backgroundColor.m_ptr = v16;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    CFTypeRef v18 = cf[0];
    cf[0] = 0;
    if (v18) {
      CFRelease(v18);
    }
  }
  if (((unint64_t)v175 & 0x8000000000000) != 0)
  {
    v19 = (unsigned int *)((unint64_t)v175 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)((unint64_t)v175 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v19);
      WTF::fastFree((WTF *)v19, v14);
    }
  }
  v159 = -[WebFrameView initWithFrame:]([WebFrameView alloc], "initWithFrame:", 0.0, 0.0, width, height);
  [(WebFrameView *)v159 setAutoresizingMask:18];
  [(WebView *)v11 addSubview:v159];
  MEMORY[0x1E4E442D0](&v175, a6);
  MEMORY[0x1E4E442D0](v196, [v11->_private->preferences.m_ptr _localStorageDatabasePath]);
  WebViewGroup::getOrCreate((WebViewGroup *)&v175, (const WTF::String *)v196, (WebViewGroup **)cf);
  v21 = v11->_private;
  uint64_t v22 = (WebViewGroup *)cf[0];
  cf[0] = 0;
  v23 = v21->group.m_ptr;
  v21->group.m_ptr = v22;
  if (v23)
  {
    if (*(_DWORD *)v23 == 1)
    {
      WebViewGroup::~WebViewGroup(v23, v20);
      WTF::fastFree(v25, v26);
      v24 = (WTF::StringImpl *)v196[0];
      v196[0] = 0;
      if (!v24) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    --*(_DWORD *)v23;
  }
  v24 = (WTF::StringImpl *)v196[0];
  v196[0] = 0;
  if (!v24)
  {
LABEL_22:
    v27 = v175;
    v175 = 0;
    if (!v27) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
LABEL_20:
  if (*(_DWORD *)v24 != 2)
  {
    *(_DWORD *)v24 -= 2;
    goto LABEL_22;
  }
  WTF::StringImpl::destroy(v24, v20);
  v27 = v175;
  v175 = 0;
  if (!v27) {
    goto LABEL_28;
  }
LABEL_25:
  if (*(_DWORD *)v27 == 2) {
    WTF::StringImpl::destroy(v27, v20);
  }
  else {
    *(_DWORD *)v27 -= 2;
  }
LABEL_28:
  v28 = v11->_private->group.m_ptr;
  v175 = (WTF::StringImpl *)v11;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v28 + 2, (uint64_t *)&v175, (uint64_t)cf);
  uint64_t v29 = WTF::fastMalloc((WTF *)0x18);
  id v158 = a3;
  *(_DWORD *)(v29 + 8) = 1;
  *(void *)uint64_t v29 = &unk_1F3C7AD00;
  *(void *)(v29 + 16) = 0;
  WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  [(WebPreferences *)[(WebView *)v11 preferences] privateBrowsingEnabled];
  v30 = (WebEditorClient *)WTF::fastMalloc((WTF *)0xB8);
  WebEditorClient::WebEditorClient(v30, v11);
  v185 = 0;
  v186 = v30;
  v31 = (WebCore::WebRTCProvider *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v31 + 2) = 1;
  *(void *)v31 = &unk_1F3C79B90;
  v184 = (atomic_uint *)v31;
  WebCore::WebRTCProvider::create(&v183, v31);
  uint64_t v32 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)(v32 + 8) = 1;
  *(void *)uint64_t v32 = &unk_1F3C7AD28;
  uint64_t v182 = (_DWORD *)v32;
  v33 = (_DWORD *)*((void *)v11->_private->group.m_ptr + 5);
  ++v33[2];
  v181 = v33;
  v34 = (BackForwardList *)WTF::fastMalloc((WTF *)0x48);
  BackForwardList::BackForwardList(v34, v11);
  uint64_t v180 = v35;
  atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 1u);
  v178 = (unsigned int *)v29;
  WebCore::CookieJar::create();
  v36 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v36 = &unk_1F3C7D750;
  v36[1] = v11;
  v177 = v36;
  v37 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)v37 = &unk_1F3C7B538;
  v175 = v37;
  int v176 = 0;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::m_generationProtected)
  {
    __break(0xC471u);
    JUMPOUT(0x1E13F8958);
  }
  IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  uint64_t v39 = WebCore::Process::identifier(IdentifierInternal);
  uint64_t v174 = 0;
  v40 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v40 = &unk_1F3C7B428;
  v40[1] = 0;
  v173 = 0;
  v196[0] = v40;
  uint64_t v41 = (void *)WTF::fastMalloc((WTF *)8);
  *uint64_t v41 = MEMORY[0x1E4FB6B78] + 16;
  v172 = v41;
  WebBroadcastChannelRegistry::getOrCreate([(WebPreferences *)[(WebView *)v11 preferences] privateBrowsingEnabled], (uint64_t *)&v170);
  uint64_t v42 = (uint64_t)v170;
  v170 = 0;
  v171 = (_DWORD *)v42;
  v43 = (void *)WTF::fastMalloc((WTF *)0x18);
  v43[1] = 0;
  v43[2] = 0;
  void *v43 = &unk_1F3C7B4A0;
  v168 = 0;
  v169 = v43;
  v44 = (WebCore::DummyModelPlayerProvider *)WTF::fastMalloc((WTF *)8);
  WebCore::DummyModelPlayerProvider::DummyModelPlayerProvider(v44);
  v166 = 0;
  uint64_t v167 = v44;
  v45 = (LegacyHistoryItemClient *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v45 + 2) = 1;
  *(void *)v45 = &unk_1F3C7B338;
  uint64_t v165 = v45;
  uint64_t v46 = LegacyHistoryItemClient::singleton(v45);
  ++*(_DWORD *)(v46 + 8);
  v164 = (_DWORD *)v46;
  v47 = (void *)WTF::fastMalloc((WTF *)8);
  void *v47 = &unk_1F3C7D298;
  v163 = v47;
  uint64_t v48 = WTF::fastMalloc((WTF *)0x20);
  WebCore::ChromeClient::ChromeClient((WebCore::ChromeClient *)v48);
  *(void *)uint64_t v48 = &unk_1F3C7B630;
  *(unsigned char *)(v48 + 8) = 0;
  objc_initWeak((id *)(v48 + 16), v11);
  *(void *)uint64_t v48 = &unk_1F3C7BDD0;
  *(_DWORD *)(v48 + 24) = 0;
  v161 = 0;
  uint64_t v162 = v48;
  v49 = (id *)WTF::fastMalloc((WTF *)0x10);
  id *v49 = &unk_1F3C7C598;
  objc_initWeak(v49 + 1, v11);
  char v156 = v196;
  uint64_t v157 = &v172;
  uint64_t v154 = v39;
  v155 = &v174;
  CFStringRef v152 = &v175;
  v153 = IdentifierInternal;
  v150 = &v179;
  v151 = &v177;
  v148 = &v181;
  v149 = &v180;
  WebCore::PageConfiguration::PageConfiguration();
  uint64_t v160 = 0;
  if (v49) {
    (*((void (**)(id *))*v49 + 1))(v49);
  }
  uint64_t v51 = v162;
  uint64_t v162 = 0;
  if (v51) {
    (*(void (**)(uint64_t))(*(void *)v51 + 1928))(v51);
  }
  v52 = v161;
  v161 = 0;
  if (v52)
  {
    objc_destroyWeak(v52 + 2);
    WebCore::ChromeClient::~ChromeClient((WebCore::ChromeClient *)v52);
    WTF::fastFree(v53, v54);
  }
  uint64_t v55 = v163;
  v163 = 0;
  if (v55) {
    (*(void (**)(void *))(*v55 + 152))(v55);
  }
  v56 = v164;
  v164 = 0;
  if (v56)
  {
    if (v56[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v56 + 8))(v56);
      uint64_t v57 = v165;
      uint64_t v165 = 0;
      if (!v57) {
        goto LABEL_46;
      }
      goto LABEL_41;
    }
    --v56[2];
  }
  uint64_t v57 = v165;
  uint64_t v165 = 0;
  if (!v57) {
    goto LABEL_46;
  }
LABEL_41:
  if (*((_DWORD *)v57 + 2) == 1) {
    (*(void (**)(LegacyHistoryItemClient *))(*(void *)v57 + 8))(v57);
  }
  else {
    --*((_DWORD *)v57 + 2);
  }
LABEL_46:
  v58 = v167;
  uint64_t v167 = 0;
  if (v58) {
    (*(void (**)(WebCore::DummyModelPlayerProvider *))(*(void *)v58 + 8))(v58);
  }
  v59 = v166;
  v166 = 0;
  if (v59)
  {
    WebCore::DummyModelPlayerProvider::~DummyModelPlayerProvider(v59);
    WTF::fastFree(v60, v61);
  }
  v62 = v169;
  v169 = 0;
  if (v62) {
    (*(void (**)(void *))(*v62 + 8))(v62);
  }
  v63 = v168;
  v168 = 0;
  if (v63)
  {
    v64 = (WTF::StringImpl *)*((void *)v63 + 2);
    *((void *)v63 + 2) = 0;
    if (v64)
    {
      if (*(_DWORD *)v64 == 2)
      {
        WTF::StringImpl::destroy(v64, v50);
        v65 = (unsigned int *)*((void *)v63 + 1);
        *((void *)v63 + 1) = 0;
        if (!v65)
        {
LABEL_61:
          WTF::fastFree(v63, v50);
          goto LABEL_62;
        }
LABEL_59:
        if (atomic_fetch_add((atomic_uint *volatile)v65 + 2, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v65 + 2);
          (*(void (**)(unsigned int *))(*(void *)v65 + 8))(v65);
        }
        goto LABEL_61;
      }
      *(_DWORD *)v64 -= 2;
    }
    v65 = (unsigned int *)*((void *)v63 + 1);
    *((void *)v63 + 1) = 0;
    if (!v65) {
      goto LABEL_61;
    }
    goto LABEL_59;
  }
LABEL_62:
  v66 = v171;
  v171 = 0;
  if (v66)
  {
    if (v66[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v66 + 8))(v66);
      v67 = v170;
      if (!v170) {
        goto LABEL_71;
      }
      goto LABEL_66;
    }
    --v66[2];
  }
  v67 = v170;
  if (!v170) {
    goto LABEL_71;
  }
LABEL_66:
  if (v67[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v67 + 8))(v67);
  }
  else {
    --v67[2];
  }
LABEL_71:
  v68 = v172;
  v172 = 0;
  if (v68) {
    (*(void (**)(void *))(*v68 + 8))(v68);
  }
  uint64_t v69 = v196[0];
  v196[0] = 0;
  if (v69) {
    (*(void (**)(uint64_t))(*(void *)v69 + 8))(v69);
  }
  v70 = v173;
  v173 = 0;
  if (v70)
  {
    v71 = (_DWORD *)*((void *)v70 + 1);
    *((void *)v70 + 1) = 0;
    if (v71)
    {
      if (v71[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v71 + 8))(v71);
      }
      else {
        --v71[2];
      }
    }
    WTF::fastFree(v70, v50);
  }
  uint64_t v72 = v174;
  uint64_t v174 = 0;
  if (v72)
  {
    v73 = (unsigned int *)(v72 + 8);
    if (atomic_fetch_add((atomic_uint *volatile)(v72 + 8), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v73);
      v145 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v145 = &unk_1F3C797F0;
      v145[1] = v73;
      v196[0] = v145;
      WTF::ensureOnMainThread();
      uint64_t v146 = v196[0];
      v196[0] = 0;
      if (v146) {
        (*(void (**)(uint64_t))(*(void *)v146 + 8))(v146);
      }
    }
  }
  if (v176 != -1) {
    ((void (*)(void *, WTF::StringImpl **))off_1F3C7B358[v176])(v196, &v175);
  }
  v74 = v177;
  v177 = 0;
  if (v74) {
    (*(void (**)(void *))(*v74 + 8))(v74);
  }
  v75 = v179;
  objc_super v179 = 0;
  if (v75)
  {
    if (v75[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v75 + 120))(v75);
      v76 = v178;
      v178 = 0;
      if (!v76) {
        goto LABEL_93;
      }
      goto LABEL_91;
    }
    --v75[2];
  }
  v76 = v178;
  v178 = 0;
  if (!v76) {
    goto LABEL_93;
  }
LABEL_91:
  if (atomic_fetch_add((atomic_uint *volatile)v76 + 2, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v76 + 2);
    (*(void (**)(unsigned int *))(*(void *)v76 + 16))(v76);
  }
LABEL_93:
  v77 = v180;
  uint64_t v180 = 0;
  if (v77)
  {
    if (v77[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v77 + 8))(v77);
      v78 = v181;
      v181 = 0;
      if (!v78) {
        goto LABEL_104;
      }
      goto LABEL_97;
    }
    --v77[2];
  }
  v78 = v181;
  v181 = 0;
  if (!v78) {
    goto LABEL_104;
  }
LABEL_97:
  if (v78[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v78 + 8))(v78);
  }
  else {
    --v78[2];
  }
LABEL_104:
  uint64_t v79 = v182;
  uint64_t v182 = 0;
  if (v79)
  {
    if (v79[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v79 + 16))(v79);
      uint64_t v80 = v183;
      uint64_t v183 = 0;
      if (!v80) {
        goto LABEL_109;
      }
      goto LABEL_108;
    }
    --v79[2];
  }
  uint64_t v80 = v183;
  uint64_t v183 = 0;
  if (v80) {
LABEL_108:
  }
    (*(void (**)(uint64_t))(*(void *)v80 + 8))(v80);
LABEL_109:
  v81 = v184;
  v184 = 0;
  if (!v81 || atomic_fetch_add(v81 + 2, 0xFFFFFFFF) != 1)
  {
    uint64_t v82 = v186;
    v186 = 0;
    if (!v82) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
  atomic_store(1u, (unsigned int *)v81 + 2);
  (*(void (**)(atomic_uint *))(*(void *)v81 + 24))(v81);
  uint64_t v82 = v186;
  v186 = 0;
  if (v82) {
LABEL_112:
  }
    (*(void (**)(WebEditorClient *))(*(void *)v82 + 8))(v82);
LABEL_113:
  if (v185)
  {
    WebEditorClient::~WebEditorClient(v185);
    WTF::fastFree(v83, v84);
  }
  v85 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v85 = &unk_1F3C7C9A8;
  v85[1] = v11;
  v86 = v188;
  v188 = v85;
  if (v86) {
    (*(void (**)(void *))(*v86 + 80))(v86);
  }
  v87 = (WebInspectorClient *)WTF::fastMalloc((WTF *)0x30);
  WebInspectorClient::WebInspectorClient(v87, v11);
  uint64_t v90 = v189;
  v189 = v87;
  if (v90) {
    (*(void (**)(WebInspectorClient *))(*(void *)v90 + 8))(v90);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&qword_1EB3A9708, memory_order_acquire) != -1)
  {
    v175 = (WTF::StringImpl *)&v186;
    v196[0] = &v175;
    std::__call_once(&qword_1EB3A9708, v196, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<webApplicationCacheStorage(void)::$_0 &&>>);
  }
  if (byte_1EB3A96D0 == 1)
  {
    v91 = (WTF::StringImpl *)qword_1EB3A9710;
    if (!qword_1EB3A9710) {
      goto LABEL_124;
    }
    goto LABEL_123;
  }
  WebCore::ApplicationCacheStorage::create((WebCore::ApplicationCacheStorage *)&v175, v88, v89);
  v91 = v175;
  v175 = 0;
  WTF::Ref<WebCore::ApplicationCacheStorage,WTF::RawPtrTraits<WebCore::ApplicationCacheStorage>,WTF::DefaultRefDerefTraits<WebCore::ApplicationCacheStorage>>::~Ref(&v175, v147);
  qword_1EB3A9710 = (uint64_t)v91;
  byte_1EB3A96D0 = 1;
  if (v91) {
LABEL_123:
  }
    ++*(_DWORD *)v91;
LABEL_124:
  v92 = v190;
  v190 = v91;
  if (!v92) {
    goto LABEL_127;
  }
  if (*(_DWORD *)v92 != 1)
  {
    --*(_DWORD *)v92;
LABEL_127:
      goto LABEL_128;
LABEL_132:
    uint64_t v97 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v97 + 8) = 1;
    *(void *)uint64_t v97 = &unk_1F3C7C678;
    *(void *)(v97 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v97;
    *(_DWORD *)(v97 + 8) = 2;
    v94 = v191;
    v191 = (_DWORD *)v97;
    if (!v94) {
      goto LABEL_135;
    }
    goto LABEL_129;
  }
  WebCore::ApplicationCacheStorage::~ApplicationCacheStorage(v92, (StringImpl *)v88);
  WTF::fastFree(v95, v96);
    goto LABEL_132;
LABEL_128:
  uint64_t v93 = WebDatabaseProvider::singleton(void)::databaseProvider;
  ++*(_DWORD *)(WebDatabaseProvider::singleton(void)::databaseProvider + 8);
  v94 = v191;
  v191 = (_DWORD *)v93;
  if (!v94) {
    goto LABEL_135;
  }
LABEL_129:
  if (v94[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v94 + 8))(v94);
  }
  else {
    --v94[2];
  }
LABEL_135:
  v98 = WebViewGroup::storageNamespaceProvider(v11->_private->group.m_ptr);
  ++*((_DWORD *)v98 + 2);
  uint64_t v99 = v193;
  v193 = v98;
  if (!v99) {
    goto LABEL_138;
  }
  if (*((_DWORD *)v99 + 2) != 1)
  {
    --*((_DWORD *)v99 + 2);
LABEL_138:
    v100 = (_DWORD *)*((void *)v11->_private->group.m_ptr + 6);
    if (!v100) {
      goto LABEL_140;
    }
    goto LABEL_139;
  }
  (*(void (**)(WebKit::WebStorageNamespaceProvider *))(*(void *)v99 + 8))(v99);
  v100 = (_DWORD *)*((void *)v11->_private->group.m_ptr + 6);
  if (v100) {
LABEL_139:
  }
    ++v100[2];
LABEL_140:
  v101 = v194;
  uint64_t v194 = v100;
  if (!v101) {
    goto LABEL_143;
  }
  if (v101[2] != 1)
  {
    --v101[2];
LABEL_143:
      goto LABEL_144;
LABEL_150:
    uint64_t v104 = WTF::fastMalloc((WTF *)0x28);
    *(_DWORD *)(v104 + 8) = 1;
    *(void *)(v104 + 24) = 0;
    *(void *)(v104 + 32) = 0;
    *(void *)(v104 + 16) = 0;
    *(void *)uint64_t v104 = &unk_1F3C7D6D0;
    WebPluginInfoProvider::singleton(void)::pluginInfoProvider = v104;
    *(_DWORD *)(v104 + 8) = 2;
    v103 = v192;
    v192 = (_DWORD *)v104;
    if (!v103) {
      goto LABEL_153;
    }
    goto LABEL_145;
  }
  (*(void (**)(_DWORD *))(*(void *)v101 + 8))(v101);
    goto LABEL_150;
LABEL_144:
  uint64_t v102 = WebPluginInfoProvider::singleton(void)::pluginInfoProvider;
  ++*(_DWORD *)(WebPluginInfoProvider::singleton(void)::pluginInfoProvider + 8);
  v103 = v192;
  v192 = (_DWORD *)v102;
  if (!v103) {
    goto LABEL_153;
  }
LABEL_145:
  if (v103[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v103 + 8))(v103);
  }
  else {
    --v103[2];
  }
LABEL_153:
  WebCore::Page::create();
  v112 = v11->_private;
  v113 = v175;
  v175 = 0;
  v114 = (WTF::StringImpl *)v112->page.m_ptr;
  v112->page.m_ptr = (Page *)v113;
  if (!v114) {
    goto LABEL_156;
  }
  int v115 = *(_DWORD *)v114 - 1;
  if (*(_DWORD *)v114 != 1) {
    goto LABEL_155;
  }
  v125 = (WTF *)MEMORY[0x1E4E47DB0](v114, v105, v106, v107, v108, v109, v110, v111, &v181, &v180, &v179, &v177, &v175, IdentifierInternal, v39, &v174, v196, &v172);
  WTF::fastFree(v125, v126);
  v114 = v175;
  v175 = 0;
  if (v114)
  {
    int v115 = *(_DWORD *)v114 - 1;
    if (*(_DWORD *)v114 != 1)
    {
LABEL_155:
      *(_DWORD *)v114 = v115;
      goto LABEL_156;
    }
    v127 = (WTF *)MEMORY[0x1E4E47DB0]();
    WTF::fastFree(v127, v128);
  }
LABEL_156:
  v116 = v11->_private->page.m_ptr;
  uint64_t v117 = *((void *)v116 + 2);
  if (v117) {
    goto LABEL_160;
  }
  uint64_t v117 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v117 = 1;
  *(void *)(v117 + 8) = v116;
  uint64_t v118 = (unsigned int *)*((void *)v116 + 2);
  *((void *)v116 + 2) = v117;
  if (!v118) {
    goto LABEL_160;
  }
  if (atomic_fetch_add((atomic_uint *volatile)v118, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v118);
    WTF::fastFree((WTF *)v118, v105);
    uint64_t v117 = *((void *)v116 + 2);
    if (!v117) {
      goto LABEL_161;
    }
    goto LABEL_160;
  }
  uint64_t v117 = *((void *)v116 + 2);
  if (v117) {
LABEL_160:
  }
    atomic_fetch_add((atomic_uint *volatile)v117, 1u);
LABEL_161:
  uint64_t v119 = *(unsigned int **)(v29 + 16);
  *(void *)(v29 + 16) = v117;
  if (v119 && atomic_fetch_add((atomic_uint *volatile)v119, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v119);
    WTF::fastFree((WTF *)v119, v105);
  }
  -[WebView setSmartInsertDeleteEnabled:](v11, "setSmartInsertDeleteEnabled:", 1, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, &v171, &v169, &v167, &v165, &v164, &v163,
    &v162,
    &v160);
  WebCore::Settings::setMinimumLogicalFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), 9.0);
  WebCore::Settings::setDefaultFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), (double)(int)[v11->_private->preferences.m_ptr defaultFontSize]);
  WebCore::Settings::setDefaultFixedFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), 13.0);
  uint64_t v120 = *((void *)v11->_private->page.m_ptr + 14);
  int v121 = [a5 acceleratedDrawingEnabled];
  uint64_t v122 = 64;
  if (!v121) {
    uint64_t v122 = 0;
  }
  *(void *)(v120 + 664) = *(void *)(v120 + 664) & 0xFFFFFFFFFFFFFFBFLL | v122;
  WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)v11->_private->page.m_ptr + 14));
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v196[0] = v175;
  WebCore::SettingsBase::setPictographFontFamily();
  v124 = (WTF::StringImpl *)v196[0];
  v196[0] = 0;
  if (v124)
  {
    if (*(_DWORD *)v124 == 2) {
      WTF::StringImpl::destroy(v124, v123);
    }
    else {
      *(_DWORD *)v124 -= 2;
    }
  }
  uint64_t v129 = *((void *)v11->_private->page.m_ptr + 14);
  *(void *)(v129 + 696) &= ~0x400uLL;
  uint64_t v130 = *((void *)v11->_private->page.m_ptr + 14);
  *(void *)(v130 + 696) |= 0x200uLL;
  MEMORY[0x1E4E442D0](&v175, [v11->_private->preferences.m_ptr standardFontFamily]);
  WebCore::SettingsBase::setStandardFontFamily();
  v132 = v175;
  v175 = 0;
  if (v132)
  {
    if (*(_DWORD *)v132 == 2) {
      WTF::StringImpl::destroy(v132, v131);
    }
    else {
      *(_DWORD *)v132 -= 2;
    }
  }
  WebCore::Settings::setMinimumFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), (double)(int)[v11->_private->preferences.m_ptr minimumFontSize]);
  v133 = v11->_private;
  uint64_t v134 = *((void *)v133->page.m_ptr + 14);
  int v135 = [v133->preferences.m_ptr httpEquivEnabled];
  uint64_t v136 = 0x800000000;
  if (!v135) {
    uint64_t v136 = 0;
  }
  *(void *)(v134 + 680) = *(void *)(v134 + 680) & 0xFFFFFFF7FFFFFFFFLL | v136;
  v137 = (WebCore::Page *)v11->_private->page.m_ptr;
  MEMORY[0x1E4E442D0](&v175, a6);
  WebCore::Page::setGroupName(v137, (const WTF::String *)&v175);
  uint64_t v139 = v175;
  v175 = 0;
  if (v139)
  {
    if (*(_DWORD *)v139 == 2)
    {
      WTF::StringImpl::destroy(v139, v138);
      v140 = (WebCore::Page *)v11->_private->page.m_ptr;
      if (byte_1EB3A96D4 == 1) {
        goto LABEL_183;
      }
LABEL_188:
      byte_1EB3A96D3 = MGGetBoolAnswer();
      byte_1EB3A96D4 = 1;
      goto LABEL_183;
    }
    *(_DWORD *)v139 -= 2;
  }
  v140 = (WebCore::Page *)v11->_private->page.m_ptr;
  if (byte_1EB3A96D4 != 1) {
    goto LABEL_188;
  }
LABEL_183:
  WebCore::Page::setInspectable(v140);
  [(WebView *)v11 _updateScreenScaleFromWindow];
  uint64_t v141 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v141 addObserver:v11 selector:sel__wakWindowScreenScaleChanged_ name:*MEMORY[0x1E4FB6220] object:0];
  v142 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v142 addObserver:v11 selector:sel__wakWindowVisibilityChanged_ name:*MEMORY[0x1E4FB6228] object:0];
  +[WebFrame _createMainFrameWithSimpleHTMLDocumentWithPage:v11->_private->page.m_ptr frameView:v159 style:v158];
  [(WebView *)v11 _addToAllWebViewsSet];
  ++WebViewCount;
  WebCore::SecurityPolicy::setLocalLoadPolicy();
  uint64_t v143 = (WebCore::DeprecatedGlobalSettings *)[(WebPreferences *)[(WebView *)v11 preferences] attachmentElementEnabled];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v143) + 25) = (_BYTE)v143;
  MEMORY[0x1E4E46960](cf);
  if (atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)(v29 + 8));
    (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
    if (!v159) {
      return v11;
    }
    goto LABEL_185;
  }
  if (v159) {
LABEL_185:
  }
    CFRelease(v159);
  return v11;
}

+ (void)_releaseMemoryNow
{
}

uint64_t __40__WebView_WebPrivate___releaseMemoryNow__block_invoke()
{
  return MEMORY[0x1F416D6A0](1, 1, 0, 0);
}

- (void)_replaceCurrentHistoryItem:(id)a3
{
  if ([(WebView *)self _mainCoreFrame])
  {
    if (a3)
    {
      v4 = *(_DWORD **)(*((void *)a3 + 1) + 8);
      if (v4) {
        ++*v4;
      }
    }
    else
    {
      v4 = 0;
    }
    uint64_t v7 = v4;
    WebCore::HistoryController::replaceCurrentItem();
    if (v7)
    {
      if (*v7 == 1)
      {
        uint64_t v5 = (WTF *)MEMORY[0x1E4E44A30]();
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*v7;
      }
    }
  }
}

+ (void)willEnterBackgroundWithCompletionHandler:(id)a3
{
}

void __64__WebView_WebPrivate__willEnterBackgroundWithCompletionHandler___block_invoke(uint64_t a1)
{
  WTF::RunLoop::main((WTF::RunLoop *)+[WebView _releaseMemoryNow]);
  id v2 = _Block_copy(*(const void **)(a1 + 32));
  uint64_t v3 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v3 = &unk_1F3C7B560;
  v3[1] = v2;
  v4 = v3;
  WTF::RunLoop::dispatch();
  if (v4) {
    (*(void (**)(void *))(*v4 + 8))(v4);
  }
  _Block_release(0);
}

+ (BOOL)isCharacterSmartReplaceExempt:(unsigned __int16)a3 isPreviousCharacter:(BOOL)a4
{
  return MEMORY[0x1F4171DB8](a3, a4);
}

- (void)updateLayoutIgnorePendingStyleSheets
{
}

uint64_t __59__WebView_WebPrivate__updateLayoutIgnorePendingStyleSheets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _mainCoreFrame];
  if (result)
  {
    uint64_t v2 = result;
    do
    {
      if (!*(unsigned char *)(v2 + 144))
      {
        if (*(void *)(v2 + 296)) {
          WebCore::Document::updateLayout();
        }
      }
      uint64_t result = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v2 + 48), 0);
      uint64_t v2 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_requestStartDataInteraction:(CGPoint)a3 globalPosition:(CGPoint)a4
{
  CGPoint v12 = a3;
  CGPoint v11 = a4;
  WebThreadLock();
  uint64_t v5 = *((void *)self->_private->page.m_ptr + 20);
  if (v5) {
    BOOL v6 = *(unsigned char *)(v5 + 144) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    return 0;
  }
  uint64_t v8 = *(WebCore::EventHandler **)(v5 + 624);
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v10, &v12);
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v9, &v11);
  return WebCore::EventHandler::tryToBeginDragAtPoint(v8, &v10, &v9);
}

- (void)_startDrag:(const void *)a3
{
  CFTypeRef v5 = *(CFTypeRef *)a3;
  if (*(void *)a3)
  {
    CFRetain(*(CFTypeRef *)a3);
    CFRelease(v5);
  }
  v37[0] = 0;
  char v44 = 0;
  if (*((unsigned char *)a3 + 120))
  {
    WebCore::TextIndicatorData::TextIndicatorData((uint64_t)v37, (long long *)((char *)a3 + 8));
    char v44 = 1;
    BOOL v6 = [WebUITextIndicatorData alloc];
    if (!v44)
    {
      std::__throw_bad_optional_access[abi:sn180100]();
      __break(1u);
      return;
    }
    uint64_t v7 = [(WebUITextIndicatorData *)v6 initWithImage:v5 textIndicatorData:v37 scale:*((float *)self->_private->page.m_ptr + 91)];
    uint64_t v8 = self->_private;
    m_ptr = v8->textIndicatorData.m_ptr;
    v8->textIndicatorData.m_ptr = (void *)v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v10 = *((void *)a3 + 32);
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    CGPoint v11 = [[WebUITextIndicatorData alloc] initWithImage:v5 scale:*((float *)self->_private->page.m_ptr + 91)];
    CGPoint v12 = self->_private;
    v13 = v12->textIndicatorData.m_ptr;
    v12->textIndicatorData.m_ptr = v11;
    if (v13) {
      CFRelease(v13);
    }
    uint64_t v10 = *((void *)a3 + 32);
    if (!v10) {
      goto LABEL_15;
    }
  }
  if (!*(_DWORD *)(v10 + 4))
  {
LABEL_15:
    v15 = 0;
    p_private = &self->_private;
    p_draggedLinkURL = &self->_private->draggedLinkURL;
    goto LABEL_16;
  }
  CFTypeRef v14 = (void *)WTF::URL::operator NSURL *();
  v15 = v14;
  p_private = &self->_private;
  p_draggedLinkURL = &self->_private->draggedLinkURL;
  if (v14) {
    CFRetain(v14);
  }
LABEL_16:
  CFTypeRef v18 = p_draggedLinkURL->m_ptr;
  p_draggedLinkURL->m_ptr = v15;
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v19 = *((void *)a3 + 31);
  if (v19 && *(_DWORD *)(v19 + 4))
  {
    uint64_t v20 = (const void *)WTF::StringImpl::operator NSString *();
    v21 = v20;
    p_m_ptr = (const void **)&(*p_private)->draggedLinkTitle.m_ptr;
    if (v20) {
      CFRetain(v20);
    }
  }
  else
  {
    v21 = 0;
    p_m_ptr = (const void **)&(*p_private)->draggedLinkTitle.m_ptr;
  }
  v23 = *p_m_ptr;
  *p_m_ptr = v21;
  if (v23) {
    CFRelease(v23);
  }
  WebCore::IntRect::operator CGRect();
  v25 = *p_private;
  v25->dragPreviewFrameInRootViewCoordinates.origin.x = v26;
  v25->dragPreviewFrameInRootViewCoordinates.origin.y = v27;
  v25->dragPreviewFrameInRootViewCoordinates.size.double width = v28;
  v25->dragPreviewFrameInRootViewCoordinates.size.double height = v29;
  unsigned int v30 = *((unsigned __int16 *)a3 + 108);
  if (v30 < 0x100 || (unsigned __int8 v31 = v30 - 1, v31 > 7u))
  {
    (*p_private)->dragSourceAction = 0;
    if (!v44) {
      return;
    }
  }
  else
  {
    (*p_private)->dragSourceAction = qword_1E149DDC0[(char)v31];
    if (!v44) {
      return;
    }
  }
  if ((v43 & 0x8000000000000) != 0
    && (uint64_t v32 = (unsigned int *)(v43 & 0xFFFFFFFFFFFFLL),
        atomic_fetch_add((atomic_uint *volatile)(v43 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1))
  {
    atomic_store(1u, v32);
    WTF::fastFree((WTF *)v32, v24);
    v33 = v42;
    uint64_t v42 = 0;
    if (!v33) {
      goto LABEL_36;
    }
  }
  else
  {
    v33 = v42;
    uint64_t v42 = 0;
    if (!v33) {
      goto LABEL_36;
    }
  }
  if (v33[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v33 + 8))(v33);
  }
  else {
    --v33[2];
  }
LABEL_36:
  v34 = v41;
  uint64_t v41 = 0;
  if (!v34) {
    goto LABEL_39;
  }
  if (v34[2] != 1)
  {
    --v34[2];
LABEL_39:
    v35 = v40;
    v40 = 0;
    if (!v35) {
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  (*(void (**)(_DWORD *))(*(void *)v34 + 8))(v34);
  v35 = v40;
  v40 = 0;
  if (!v35) {
    goto LABEL_44;
  }
LABEL_42:
  if (v35[2] == 1)
  {
    (*(void (**)(_DWORD *))(*(void *)v35 + 8))(v35);
    v36 = v38;
    if (v38) {
      goto LABEL_45;
    }
    return;
  }
  --v35[2];
LABEL_44:
  v36 = v38;
  if (v38)
  {
LABEL_45:
    uint64_t v38 = 0;
    int v39 = 0;
    WTF::fastFree(v36, v24);
  }
}

- (CGRect)_dataInteractionCaretRect
{
  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::DragCaretController::caretRectInRootViewCoordinates(*((WebCore::DragCaretController **)m_ptr + 7));
    WebCore::IntRect::operator CGRect();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    if (*(_DWORD *)m_ptr == 1)
    {
      CGPoint v12 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
      WTF::fastFree(v12, v13);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
  else
  {
    double v11 = 0.0;
    double v9 = 0.0;
    double v7 = 0.0;
    double v5 = 0.0;
  }
  double v14 = v5;
  double v15 = v7;
  double v16 = v9;
  double v17 = v11;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (WebUITextIndicatorData)_dataOperationTextIndicator
{
  return (WebUITextIndicatorData *)self->_private->dataOperationTextIndicator.m_ptr;
}

- (unint64_t)_dragSourceAction
{
  return self->_private->dragSourceAction;
}

- (NSString)_draggedLinkTitle
{
  return (NSString *)self->_private->draggedLinkTitle.m_ptr;
}

- (NSURL)_draggedLinkURL
{
  return (NSURL *)self->_private->draggedLinkURL.m_ptr;
}

- (CGRect)_draggedElementBounds
{
  uint64_t v2 = self->_private;
  double x = v2->dragPreviewFrameInRootViewCoordinates.origin.x;
  double y = v2->dragPreviewFrameInRootViewCoordinates.origin.y;
  double width = v2->dragPreviewFrameInRootViewCoordinates.size.width;
  double height = v2->dragPreviewFrameInRootViewCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_getDataInteractionData
{
  return self->_private->textIndicatorData.m_ptr;
}

- (unint64_t)dragDestinationActionMaskForSession:(id)a3
{
  id v5 = [(WebView *)self _UIDelegateForwarder];
  return [v5 webView:self dragDestinationActionMaskForSession:a3];
}

- (DragData)dragDataForSession:(SEL)a3 client:(id)a4 global:(CGPoint)a5 operation:(CGPoint)a6
{
  CGPoint v24 = a5;
  CGPoint v23 = a6;
  -[WebView dragDestinationActionMaskForSession:](self, "dragDestinationActionMaskForSession:");
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v24);
  float v7 = roundf(v21[0]);
  uint64_t v8 = 0x7FFFFFFFLL;
  uint64_t v9 = (int)v7;
  if (v7 <= -2147500000.0) {
    uint64_t v9 = 0x80000000;
  }
  if (v7 < 2147500000.0) {
    uint64_t v8 = v9;
  }
  float v10 = roundf(v21[1]);
  uint64_t v11 = 0x7FFFFFFF00000000;
  unint64_t v12 = 0x8000000000000000;
  if (v10 > -2147500000.0) {
    unint64_t v12 = (unint64_t)(int)v10 << 32;
  }
  if (v10 < 2147500000.0) {
    uint64_t v11 = v12;
  }
  uint64_t v22 = v11 | v8;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v23);
  float v13 = roundf(v19[0]);
  uint64_t v14 = 0x7FFFFFFFLL;
  uint64_t v15 = 0x80000000;
  if (v13 > -2147500000.0) {
    uint64_t v15 = (int)v13;
  }
  if (v13 < 2147500000.0) {
    uint64_t v14 = v15;
  }
  float v16 = roundf(v19[1]);
  if (v16 >= 2147500000.0)
  {
    unint64_t v17 = 0x7FFFFFFF00000000;
  }
  else if (v16 <= -2147500000.0)
  {
    unint64_t v17 = 0x8000000000000000;
  }
  else
  {
    unint64_t v17 = (unint64_t)(int)v16 << 32;
  }
  unint64_t v20 = v17 | v14;
  return (DragData *)WebCore::DragData::DragData();
}

- (unint64_t)_enteredDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  float v13 = [(WebView *)self _mainCoreFrame];
  unint64_t v14 = (unint64_t)v13;
  if (!v13) {
    return v14;
  }
  uint64_t v15 = (unsigned int *)(v13 + 2);
  atomic_fetch_add(v13 + 2, 1u);
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v25 = 0u;
    *(_OWORD *)CGPoint v24 = 0u;
  }
  WebCore::DragController::dragEnteredOrUpdated();
  if (!v27)
  {
    if (v26 < 0x100u)
    {
LABEL_8:
      unint64_t v14 = 0;
LABEL_9:
      unint64_t v17 = v25[1];
      if (v25[1])
      {
LABEL_10:
        if (*(_DWORD *)v17 == 2) {
          WTF::StringImpl::destroy(v17, v16);
        }
        else {
          *(_DWORD *)v17 -= 2;
        }
      }
    }
    else
    {
      unint64_t v14 = v26;
      switch((char)v26)
      {
        case 1:
          goto LABEL_9;
        case 4:
        case 16:
          unint64_t v14 = 16;
          unint64_t v17 = v25[1];
          if (v25[1]) {
            goto LABEL_10;
          }
          break;
        default:
          goto LABEL_8;
      }
    }
    if (HIDWORD(v24[1]))
    {
      CFTypeRef v18 = (WTF::StringImpl **)v24[0];
      uint64_t v19 = 8 * HIDWORD(v24[1]);
      do
      {
        unint64_t v20 = *v18;
        void *v18 = 0;
        if (v20)
        {
          if (*(_DWORD *)v20 == 2) {
            WTF::StringImpl::destroy(v20, v16);
          }
          else {
            *(_DWORD *)v20 -= 2;
          }
        }
        ++v18;
        v19 -= 8;
      }
      while (v19);
    }
    if (v24[0]) {
      WTF::fastFree(v24[0], v16);
    }
    if (atomic_fetch_add((atomic_uint *volatile)v15, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v15);
      uint64_t v22 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v22 = &unk_1F3C797F0;
      v22[1] = v15;
      CGPoint v23 = v22;
      WTF::ensureOnMainThread();
      if (v23) {
        (*(void (**)(void *))(*v23 + 8))(v23);
      }
    }
    return v14;
  }
  unint64_t result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (unint64_t)_updatedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  float v13 = [(WebView *)self _mainCoreFrame];
  unint64_t v14 = (unint64_t)v13;
  if (!v13) {
    return v14;
  }
  uint64_t v15 = (unsigned int *)(v13 + 2);
  atomic_fetch_add(v13 + 2, 1u);
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v25 = 0u;
    *(_OWORD *)CGPoint v24 = 0u;
  }
  WebCore::DragController::dragEnteredOrUpdated();
  if (!v27)
  {
    if (v26 < 0x100u)
    {
LABEL_8:
      unint64_t v14 = 0;
LABEL_9:
      unint64_t v17 = v25[1];
      if (v25[1])
      {
LABEL_10:
        if (*(_DWORD *)v17 == 2) {
          WTF::StringImpl::destroy(v17, v16);
        }
        else {
          *(_DWORD *)v17 -= 2;
        }
      }
    }
    else
    {
      unint64_t v14 = v26;
      switch((char)v26)
      {
        case 1:
          goto LABEL_9;
        case 4:
        case 16:
          unint64_t v14 = 16;
          unint64_t v17 = v25[1];
          if (v25[1]) {
            goto LABEL_10;
          }
          break;
        default:
          goto LABEL_8;
      }
    }
    if (HIDWORD(v24[1]))
    {
      CFTypeRef v18 = (WTF::StringImpl **)v24[0];
      uint64_t v19 = 8 * HIDWORD(v24[1]);
      do
      {
        unint64_t v20 = *v18;
        void *v18 = 0;
        if (v20)
        {
          if (*(_DWORD *)v20 == 2) {
            WTF::StringImpl::destroy(v20, v16);
          }
          else {
            *(_DWORD *)v20 -= 2;
          }
        }
        ++v18;
        v19 -= 8;
      }
      while (v19);
    }
    if (v24[0]) {
      WTF::fastFree(v24[0], v16);
    }
    if (atomic_fetch_add((atomic_uint *volatile)v15, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v15);
      uint64_t v22 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v22 = &unk_1F3C797F0;
      v22[1] = v15;
      CGPoint v23 = v22;
      WTF::ensureOnMainThread();
      if (v23) {
        (*(void (**)(void *))(*v23 + 8))(v23);
      }
    }
    return v14;
  }
  unint64_t result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)_exitedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  float v13 = [(WebView *)self _mainCoreFrame];
  if (!v13) {
    return;
  }
  unint64_t v14 = (unsigned int *)(v13 + 2);
  atomic_fetch_add(v13 + 2, 1u);
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)CGPoint v23 = 0u;
    *(_OWORD *)uint64_t v22 = 0u;
  }
  WebCore::DragController::dragExited();
  if (!v23[1])
  {
LABEL_8:
    uint64_t v16 = HIDWORD(v22[1]);
    if (!HIDWORD(v22[1])) {
      goto LABEL_17;
    }
LABEL_11:
    unint64_t v17 = (WTF::StringImpl **)v22[0];
    uint64_t v18 = 8 * v16;
    do
    {
      uint64_t v19 = *v17;
      WTF::StringImpl *v17 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2) {
          WTF::StringImpl::destroy(v19, v15);
        }
        else {
          *(_DWORD *)v19 -= 2;
        }
      }
      ++v17;
      v18 -= 8;
    }
    while (v18);
    goto LABEL_17;
  }
  if (*(_DWORD *)v23[1] != 2)
  {
    *(_DWORD *)v23[1] -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v23[1], v15);
  uint64_t v16 = HIDWORD(v22[1]);
  if (HIDWORD(v22[1])) {
    goto LABEL_11;
  }
LABEL_17:
  if (v22[0]) {
    WTF::fastFree(v22[0], v15);
  }
  if (atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v14);
    unint64_t v20 = (void *)WTF::fastMalloc((WTF *)0x10);
    *unint64_t v20 = &unk_1F3C797F0;
    v20[1] = v14;
    v21 = v20;
    WTF::ensureOnMainThread();
    if (v21) {
      (*(void (**)(void *))(*v21 + 8))(v21);
    }
  }
}

- (BOOL)_tryToPerformDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v21 = 0u;
    *(_OWORD *)unint64_t v20 = 0u;
  }
  char v14 = WebCore::DragController::performDragOperation();
  if (!v21[1])
  {
LABEL_7:
    uint64_t v15 = HIDWORD(v20[1]);
    if (!HIDWORD(v20[1])) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (*(_DWORD *)v21[1] != 2)
  {
    *(_DWORD *)v21[1] -= 2;
    goto LABEL_7;
  }
  WTF::StringImpl::destroy(v21[1], v13);
  uint64_t v15 = HIDWORD(v20[1]);
  if (!HIDWORD(v20[1])) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v16 = (WTF::StringImpl **)v20[0];
  uint64_t v17 = 8 * v15;
  do
  {
    uint64_t v18 = *v16;
    StringImpl *v16 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v13);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
    ++v16;
    v17 -= 8;
  }
  while (v17);
LABEL_16:
  if (v20[0]) {
    WTF::fastFree(v20[0], v13);
  }
  return v14;
}

- (void)_endedDataInteraction:(CGPoint)a3 global:(CGPoint)a4
{
  WebThreadLock();
  WebCore::DragController::dragEnded(*((WebCore::DragController **)self->_private->page.m_ptr + 8));
  id v5 = self->_private;
  m_ptr = v5->dataOperationTextIndicator.m_ptr;
  v5->dataOperationTextIndicator.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  p_dragPreviewFrameInRootViewCoordinates = &self->_private->dragPreviewFrameInRootViewCoordinates;
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  p_dragPreviewFrameInRootViewCoordinates->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  p_dragPreviewFrameInRootViewCoordinates->size = v8;
  self->_private->dragSourceAction = 0;
  double v9 = self->_private;
  double v10 = v9->draggedLinkTitle.m_ptr;
  v9->draggedLinkTitle.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = self->_private;
  unint64_t v12 = v11->draggedLinkURL.m_ptr;
  v11->draggedLinkURL.m_ptr = 0;
  if (v12)
  {
    CFRelease(v12);
  }
}

- (void)_didConcludeEditDrag
{
  uint64_t v3 = self->_private;
  m_ptr = v3->dataOperationTextIndicator.m_ptr;
  v3->dataOperationTextIndicator.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v5 = self->_private->page.m_ptr;
  if (v5)
  {
    ++*(_DWORD *)v5;
    uint64_t v6 = WebCore::FocusController::focusedOrMainFrame(*((WebCore::FocusController **)v5 + 9));
    if (!v6)
    {
LABEL_44:
      if (*(_DWORD *)v5 == 1)
      {
        CGPoint v23 = (WTF *)MEMORY[0x1E4E47DB0](v5);
        WTF::fastFree(v23, v24);
      }
      else
      {
        --*(_DWORD *)v5;
      }
      return;
    }
    float v7 = (unsigned int *)(v6 + 8);
    atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 1u);
    WebCore::VisibleSelection::toNormalizedRange(&v35, (WebCore::VisibleSelection *)(*(void *)(*(void *)(v6 + 296) + 3096) + 56));
    if (!v37) {
      goto LABEL_43;
    }
    WebCore::TextIndicator::createWithRange();
    if (!v34) {
      goto LABEL_28;
    }
    CGSize v8 = [WebUITextIndicatorData alloc];
    WebCore::TextIndicatorData::TextIndicatorData((uint64_t)v27, (long long *)(v34 + 8));
    uint64_t v9 = [(WebUITextIndicatorData *)v8 initWithImage:0 textIndicatorData:v27 scale:*((float *)v5 + 91)];
    uint64_t v11 = self->_private;
    unint64_t v12 = v11->dataOperationTextIndicator.m_ptr;
    v11->dataOperationTextIndicator.m_ptr = (void *)v9;
    if (v12) {
      CFRelease(v12);
    }
    if ((v33 & 0x8000000000000) != 0
      && (float v13 = (unsigned int *)(v33 & 0xFFFFFFFFFFFFLL),
          atomic_fetch_add((atomic_uint *volatile)(v33 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1))
    {
      atomic_store(1u, v13);
      WTF::fastFree((WTF *)v13, v10);
      char v14 = v32;
      uint64_t v32 = 0;
      if (!v14) {
        goto LABEL_15;
      }
    }
    else
    {
      char v14 = v32;
      uint64_t v32 = 0;
      if (!v14) {
        goto LABEL_15;
      }
    }
    if (v14[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v14 + 8))(v14);
    }
    else {
      --v14[2];
    }
LABEL_15:
    uint64_t v15 = v31;
    unsigned __int8 v31 = 0;
    if (v15)
    {
      if (v15[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(void *)v15 + 8))(v15);
        uint64_t v16 = v30;
        unsigned int v30 = 0;
        if (!v16) {
          goto LABEL_23;
        }
LABEL_21:
        if (v16[2] == 1)
        {
          (*(void (**)(_DWORD *))(*(void *)v16 + 8))(v16);
          uint64_t v17 = v28;
          if (!v28)
          {
LABEL_25:
            uint64_t v18 = (WebCore::TextIndicator *)v34;
            uint64_t v34 = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 1)
              {
                WebCore::TextIndicator::~TextIndicator(v18);
                WTF::fastFree(v20, v21);
                if (v37) {
                  goto LABEL_29;
                }
                goto LABEL_43;
              }
              --*(_DWORD *)v18;
            }
LABEL_28:
            if (v37)
            {
LABEL_29:
              uint64_t v19 = v36;
              uint64_t v36 = 0;
              if (v19)
              {
                if (*(_DWORD *)(v19 + 28) == 2)
                {
                  if ((*(_WORD *)(v19 + 34) & 0x400) == 0) {
                    WebCore::Node::removedLastRef((WebCore::Node *)v19);
                  }
                }
                else
                {
                  *(_DWORD *)(v19 + 28) -= 2;
                }
              }
              uint64_t v22 = v35;
              uint64_t v35 = 0;
              if (v22)
              {
                if (*(_DWORD *)(v22 + 28) == 2)
                {
                  if ((*(_WORD *)(v22 + 34) & 0x400) == 0) {
                    WebCore::Node::removedLastRef((WebCore::Node *)v22);
                  }
                }
                else
                {
                  *(_DWORD *)(v22 + 28) -= 2;
                }
              }
            }
LABEL_43:
            if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v7);
              v25 = (void *)WTF::fastMalloc((WTF *)0x10);
              void *v25 = &unk_1F3C797F0;
              v25[1] = v7;
              v27[0] = v25;
              WTF::ensureOnMainThread();
              uint64_t v26 = v27[0];
              v27[0] = 0;
              if (v26) {
                (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
              }
            }
            goto LABEL_44;
          }
LABEL_24:
          CGFloat v28 = 0;
          int v29 = 0;
          WTF::fastFree(v17, v10);
          goto LABEL_25;
        }
        --v16[2];
LABEL_23:
        uint64_t v17 = v28;
        if (!v28) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      --v15[2];
    }
    uint64_t v16 = v30;
    unsigned int v30 = 0;
    if (!v16) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
}

+ (void)_registerPluginMIMEType:(id)a3
{
  uint64_t v4 = objc_opt_class();
  +[WebView registerViewClass:v4 representationClass:objc_opt_class() forMIMEType:a3];
  if (byte_1EB3A96D5 == 1)
  {
    id v5 = (id)qword_1EB3A9718;
    id v6 = a3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    qword_1EB3A9718 = (uint64_t)v5;
    byte_1EB3A96D5 = 1;
    id v6 = a3;
  }
  [v5 addObject:v6];
}

+ (void)_unregisterPluginMIMEType:(id)a3
{
  objc_msgSend(a1, "_unregisterViewClassAndRepresentationClassForMIMEType:");
  if (byte_1EB3A96D5 == 1)
  {
    id v4 = (id)qword_1EB3A9718;
    id v5 = a3;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    qword_1EB3A9718 = (uint64_t)v4;
    byte_1EB3A96D5 = 1;
    id v5 = a3;
  }
  [v4 removeObject:v5];
}

+ (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5 allowingPlugins:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = [a5 lowercaseString];
  double v10 = (objc_class *)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", v9);
  uint64_t v11 = objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", v9);
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12
    || (float v13 = (objc_class *)v11,
        objc_msgSend((id)-[objc_class supportedMIMETypes](+[WebView _getPDFViewClass](WebView, "_getPDFViewClass"), "supportedMIMETypes"), "containsObject:", v9)))
  {
    if (v6) {
      +[WebPluginDatabase sharedDatabase];
    }
    double v10 = (objc_class *)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "_webkit_objectForMIMEType:", v9);
    float v13 = (objc_class *)objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 0), "_webkit_objectForMIMEType:", v9);
  }
  LOBYTE(v14) = 0;
  if (v10 && v13)
  {
    if (v10 == (objc_class *)objc_opt_class() && v13 == (objc_class *)objc_opt_class())
    {
      if (objc_msgSend(+[WebHTMLView unsupportedTextMIMETypes](WebHTMLView, "unsupportedTextMIMETypes"), "containsObject:", v9))
      {
        LOBYTE(v14) = 0;
        return v14;
      }
      if (!v6)
      {
        if (byte_1EB3A96D5 == 1)
        {
          if ([(id)qword_1EB3A9718 containsObject:v9])
          {
LABEL_24:
            if ((objc_msgSend(+[WebHTMLView supportedNonImageMIMETypes](WebHTMLView, "supportedNonImageMIMETypes"), "containsObject:", v9) & 1) == 0)
            {
              int v14 = objc_msgSend(+[WebHTMLView supportedMIMETypes](WebHTMLView, "supportedMIMETypes"), "containsObject:", v9);
              if (!v14) {
                return v14;
              }
            }
          }
        }
        else
        {
          qword_1EB3A9718 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          byte_1EB3A96D5 = 1;
          if ([(id)qword_1EB3A9718 containsObject:v9]) {
            goto LABEL_24;
          }
        }
      }
    }
    if (a3) {
      *a3 = v10;
    }
    if (a4) {
      *a4 = v13;
    }
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5
{
  CGSize v8 = objc_opt_class();
  return [v8 _viewClass:a3 andRepresentationClass:a4 forMIMEType:a5 allowingPlugins:0];
}

+ (void)_setAlwaysUsesComplexTextCodePath:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  MEMORY[0x1F416C578](v3, a2);
}

+ (BOOL)canCloseAllWebViews
{
  return MEMORY[0x1F416DA10](a1, a2);
}

+ (void)closeAllWebViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WebCore::LocalDOMWindow::dispatchAllPendingUnloadEvents((WebCore::LocalDOMWindow *)a1);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  if (byte_1EB3A96CE == 1)
  {
    uint64_t v2 = (void *)qword_1EB3A9700;
  }
  else
  {
    uint64_t v2 = 0;
    qword_1EB3A9700 = 0;
    byte_1EB3A96CE = 1;
  }
  uint64_t v3 = objc_msgSend(v2, "allObjects", (void)v8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) close];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (BOOL)canShowFile:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = +[WebView _MIMETypeForFile:a3];
  return [v4 canShowMIMEType:v5];
}

- (BOOL)_isClosed
{
  uint64_t v2 = self->_private;
  return !v2 || v2->closed;
}

- (void)_dispatchUnloadEvent
{
}

WebCore *__43__WebView_WebPrivate___dispatchUnloadEvent__block_invoke(uint64_t a1)
{
  unint64_t result = (WebCore *)[*(id *)(a1 + 32) mainFrame];
  if (result)
  {
    uint64_t v2 = *(void *)(*((void *)result + 1) + 8);
    if (v2)
    {
      if (*(void *)(v2 + 296))
      {
        uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
        if (!v3 || (unint64_t result = *(WebCore **)(v3 + 96)) == 0) {
          unint64_t result = (WebCore *)WebCore::threadGlobalDataSlow(result);
        }
        if (!*((void *)result + 5)) {
          WebCore::ThreadGlobalData::initializeEventNames(result);
        }
        WebCore::Event::create();
        WebCore::Document::dispatchWindowEvent();
        unint64_t result = v4;
        if (v4)
        {
          if (*((_DWORD *)v4 + 4) == 1) {
            return (WebCore *)(*(uint64_t (**)())(*(void *)v4 + 8))();
          }
          else {
            --*((_DWORD *)v4 + 4);
          }
        }
      }
    }
  }
  return result;
}

- (id)styleAtSelectionStart
{
  if (![(WebView *)self _mainCoreFrame]) {
    return 0;
  }
  WebCore::EditingStyle::styleAtSelectionStart();
  uint64_t v2 = v9;
  if (!v9) {
    return 0;
  }
  if (*((void *)v9 + 1))
  {
    uint64_t v3 = (DOMObjectInternal *)WebCore::MutableStyleProperties::ensureCSSStyleDeclaration(*((WebCore::MutableStyleProperties **)v9
                                                                                         + 1));
    uint64_t v4 = kit(v3);
    uint64_t v2 = v9;
    int v5 = *(_DWORD *)v9 - 1;
    if (*(_DWORD *)v9 != 1) {
      goto LABEL_6;
    }
LABEL_10:
    WebCore::EditingStyle::~EditingStyle(v2);
    WTF::fastFree(v7, v8);
    return v4;
  }
  uint64_t v4 = 0;
  int v5 = *(_DWORD *)v9 - 1;
  if (*(_DWORD *)v9 == 1) {
    goto LABEL_10;
  }
LABEL_6:
  *(_DWORD *)uint64_t v2 = v5;
  return v4;
}

- (unint64_t)_renderTreeSize
{
  unint64_t result = (unint64_t)self->_private->page.m_ptr;
  if (result) {
    return MEMORY[0x1F4175D60](result, a2);
  }
  return result;
}

- (void)_dispatchTileDidDraw:(id)a3
{
  id v5 = [(WebView *)self _webMailDelegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v5, "_webthread_webView:tileDidDraw:", self, a3);
  }
  else
  {
    char v6 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_private->didDrawTiles, (unsigned __int8 *)&v6, 1u);
    if (v6)
    {
      WebThreadLock();
      float v7 = objc_msgSend(-[WebView _UIKitDelegateForwarder](self, "_UIKitDelegateForwarder"), "asyncForwarder");
      [v7 webViewDidDrawTiles:self];
    }
  }
}

- (void)_willStartScrollingOrZooming
{
  uint64_t v2 = self->_private;
  if (!v2->mainViewIsScrollingOrZooming)
  {
    v2->mainViewIsScrollingOrZooming = 1;
    [(WebView *)self hideFormValidationMessage];
    [(WebFrame *)[(WebView *)self mainFrame] setTimeoutsPaused:1];
    [(WebView *)self setDefersCallbacks:1];
  }
}

- (void)_didFinishScrollingOrZooming
{
  uint64_t v2 = self->_private;
  if (v2->mainViewIsScrollingOrZooming)
  {
    v2->mainViewIsScrollingOrZooming = 0;
    [(WebView *)self setDefersCallbacks:0];
    [(WebFrame *)[(WebView *)self mainFrame] setTimeoutsPaused:0];
    if (*(void *)([(WebView *)self _mainCoreFrame] + 288))
    {
      MEMORY[0x1F416DBC8]();
    }
  }
}

- (void)_setResourceLoadSchedulerSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)WebCore::platformStrategies((WebCore *)self);
  uint64_t v5 = v4[1];
  if (v5)
  {
    int v6 = *(_DWORD *)(v5 + 80);
    if (v3)
    {
LABEL_3:
      *(_DWORD *)(v5 + 80) = v6 + 1;
      return;
    }
  }
  else
  {
    uint64_t v5 = (*(uint64_t (**)(void *))(*v4 + 16))(v4);
    v4[1] = v5;
    int v6 = *(_DWORD *)(v5 + 80);
    if (v3) {
      goto LABEL_3;
    }
  }
  int v7 = v6 - 1;
  *(_DWORD *)(v5 + 80) = v7;
  if (!v7)
  {
    if ((uint64_t v8 = *(void *)(v5 + 8)) != 0 && *(_DWORD *)(v8 - 12)
      || (long long v9 = *(void **)(v5 + 16), (v10 = v9[22]) != 0) && *(_DWORD *)(v10 - 12)
      || v9[2] != v9[3]
      || v9[6] != v9[7]
      || v9[10] != v9[11]
      || v9[14] != v9[15]
      || v9[18] != v9[19])
    {
      if ((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFLL) == 0
        || *(double *)((*(void *)(v5 + 56) & 0xFFFFFFFFFFFFLL) + 8) == 0.0)
      {
        WebCore::TimerBase::start();
      }
    }
  }
}

+ (BOOL)_isUnderMemoryPressure
{
  uint64_t v2 = WTF::MemoryPressureHandler::singleton((WTF::MemoryPressureHandler *)a1);
  int v3 = atomic_load((unsigned __int8 *)(v2 + 4));
  return v3 == 2 || *(unsigned char *)(v2 + 7) != 0;
}

- (void)_closePluginDatabases
{
  if (--pluginDatabaseClientCount) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = applicationIsTerminating == 0;
  }
  if (!v2) {
    +[WebPluginDatabase closeSharedDatabase];
  }
}

- (void)_closeWithFastTeardown
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [(WebView *)self _closePluginDatabases];
}

- (void)_close
{
}

void __29__WebView_WebPrivate___close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 80);
  if (!v1 || *(unsigned char *)(v1 + 736)) {
    return;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"WebViewWillCloseNotification", *(void *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 80) + 736) = 1;
  [*(id *)(a1 + 32) _removeFromAllWebViewsSet];
  if (applicationIsTerminating)
  {
    if (byte_1EB3A96D7 == 1)
    {
      if (byte_1EB3A96D6)
      {
LABEL_7:
        int v3 = *(void **)(a1 + 32);
        [v3 _closeWithFastTeardown];
        return;
      }
    }
    else
    {
      char v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitEnableFullDocumentTeardown");
      byte_1EB3A96D6 = v4 ^ 1;
      byte_1EB3A96D7 = 1;
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 80) + 737) = 1;
  uint64_t v5 = [*(id *)(a1 + 32) _mainCoreFrame];
  if (v5) {
    WebCore::FrameLoader::detachFromParent(*(WebCore::FrameLoader **)(v5 + 280));
  }
  [*(id *)(a1 + 32) setHostWindow:0];
  WebViewGroup::removeWebView(*(WebViewGroup **)(*(void *)(*(void *)(a1 + 32) + 80) + 16), *(WebView **)(a1 + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v8 = *(_DWORD **)(v7 + 8);
  *(void *)(v7 + 8) = 0;
  if (v8)
  {
    if (*v8 == 1)
    {
      uint64_t v10 = (WTF *)MEMORY[0x1E4E47DB0]();
      WTF::fastFree(v10, v11);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 1000);
      if (!v9) {
        goto LABEL_21;
      }
LABEL_19:
      *(void *)(v9 + 16) = 0;
      WebCore::RunLoopObserver::invalidate(*(WebCore::RunLoopObserver **)(v9 + 24));
      WebCore::RunLoopObserver::invalidate(*(WebCore::RunLoopObserver **)(v9 + 32));
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 80);
      int v14 = *(WTF **)(v13 + 1000);
      *(void *)(v13 + 1000) = 0;
      if (v14) {
        double v6 = WebViewRenderingUpdateScheduler::operator delete(v14, v12);
      }
      goto LABEL_21;
    }
    --*v8;
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 1000);
  if (v9) {
    goto LABEL_19;
  }
LABEL_21:
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_notificationProvider", v6), "unregisterWebView:", *(void *)(a1 + 32));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(a1 + 32));
  +[WebPreferences _removeReferenceForIdentifier:](WebPreferences, "_removeReferenceForIdentifier:", [*(id *)(a1 + 32) preferencesIdentifier]);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v16 = *(void **)(v15 + 208);
  *(void *)(v15 + 208) = 0;
  [v16 didRemoveFromWebView];
  [*(id *)(a1 + 32) _closePluginDatabases];
  if (v16)
  {
    CFRelease(v16);
  }
}

- (BOOL)_isProcessingUserGesture
{
  return MEMORY[0x1F416FD18](0, a2);
}

+ (id)_MIMETypeForFile:(id)a3
{
  if (![0 length]
    || (v4 = [0 isEqualToString:@"application/octet-stream"], id result = 0, v4))
  {
    double v6 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:a3];
    uint64_t v7 = (void *)[v6 readDataOfLength:1024];
    [v6 closeFile];
    if ([v7 length]) {
      uint64_t v8 = objc_msgSend(v7, "_webkit_guessedMIMEType");
    }
    else {
      uint64_t v8 = 0;
    }
    if ([v8 length]) {
      return v8;
    }
    else {
      return @"application/octet-stream";
    }
  }
  return result;
}

- (id)_downloadURL:(id)a3
{
  int v4 = (const void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:a3];
  id v5 = +[NSURLDownload _downloadWithRequest:v4 delegate:self->_private->downloadDelegate directory:0];
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (id)_openNewWindowWithRequest:(id)a3
{
  id v4 = [(WebView *)self _UIDelegateForwarder];
  id v5 = (WebView *)[v4 webView:self createWebViewWithRequest:0 windowFeatures:MEMORY[0x1E4F1CC08]];
  double v6 = v5;
  if (v5) {
    CallUIDelegate(v5, (objc_selector *)sel_webViewShow_);
  }
  return v6;
}

- (BOOL)_useDarkAppearance
{
  BOOL v2 = self->_private;
  if (v2 && (m_ptr = (WebCore::Page *)v2->page.m_ptr) != 0) {
    return WebCore::Page::useDarkAppearance(m_ptr);
  }
  else {
    return 0;
  }
}

- (void)_setUseDarkAppearance:(BOOL)a3
{
  int v3 = self->_private;
  if (v3)
  {
    m_ptr = v3->page.m_ptr;
    if (m_ptr) {
      [(WebView *)self _setUseDarkAppearance:a3 useElevatedUserInterfaceLevel:*((unsigned __int8 *)m_ptr + 451)];
    }
  }
}

- (BOOL)_useElevatedUserInterfaceLevel
{
  BOOL v2 = self->_private;
  return v2 && (m_ptr = v2->page.m_ptr) != 0 && *((unsigned char *)m_ptr + 451) != 0;
}

- (void)_setUseElevatedUserInterfaceLevel:(BOOL)a3
{
  int v3 = self->_private;
  if (v3)
  {
    m_ptr = (WebCore::Page *)v3->page.m_ptr;
    if (m_ptr)
    {
      BOOL v6 = a3;
      uint64_t v7 = WebCore::Page::useDarkAppearance(m_ptr);
      [(WebView *)self _setUseDarkAppearance:v7 useElevatedUserInterfaceLevel:v6];
    }
  }
}

- (void)_setUseDarkAppearance:(BOOL)a3 useInactiveAppearance:(BOOL)a4
{
}

- (void)_setUseDarkAppearance:(BOOL)a3 useElevatedUserInterfaceLevel:(BOOL)a4
{
  id v4 = self->_private;
  if (v4)
  {
    if (v4->page.m_ptr) {
      MEMORY[0x1F4172800]();
    }
  }
}

+ (void)_setIconLoadingEnabled:(BOOL)a3
{
  iconLoadingEnabled = a3;
}

+ (BOOL)_isIconLoadingEnabled
{
  return iconLoadingEnabled;
}

- (id)inspector
{
  if (self->_private->inspector.m_ptr) {
    return self->_private->inspector.m_ptr;
  }
  id v4 = [[WebInspector alloc] initWithInspectedWebView:self];
  id v5 = self->_private;
  m_ptr = v5->inspector.m_ptr;
  v5->inspector.m_ptr = v4;
  if (!m_ptr) {
    return self->_private->inspector.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->inspector.m_ptr;
}

+ (void)_enableRemoteInspector
{
  uint64_t v2 = Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1);
  MEMORY[0x1F40EBE98](v2);
}

+ (void)_disableRemoteInspector
{
  uint64_t v2 = Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1);
  MEMORY[0x1F40EBE90](v2);
}

+ (void)_disableAutoStartRemoteInspector
{
}

+ (BOOL)_isRemoteInspectorEnabled
{
  return *(unsigned char *)(Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1) + 112);
}

+ (BOOL)_hasRemoteInspectorSession
{
  return *(unsigned char *)(Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1) + 113);
}

- (BOOL)allowsRemoteInspection
{
  return MEMORY[0x1F4175D58](self->_private->page.m_ptr, a2);
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
}

- (void)setShowingInspectorIndication:(BOOL)a3
{
  m_ptr = self->_private->indicateLayer.m_ptr;
  if (a3)
  {
    if (!m_ptr)
    {
      id v5 = [[WebIndicateLayer alloc] initWithWebView:self];
      BOOL v6 = self->_private;
      uint64_t v7 = v6->indicateLayer.m_ptr;
      v6->indicateLayer.m_ptr = v5;
      if (v7) {
        CFRelease(v7);
      }
      [self->_private->indicateLayer.m_ptr setNeedsLayout];
      uint64_t v8 = objc_msgSend((id)-[WebView window](self, "window"), "hostLayer");
      uint64_t v9 = self->_private->indicateLayer.m_ptr;
      [v8 addSublayer:v9];
    }
  }
  else
  {
    [m_ptr removeFromSuperlayer];
    uint64_t v10 = self->_private;
    long long v11 = v10->indicateLayer.m_ptr;
    v10->indicateLayer.m_ptr = 0;
    if (v11)
    {
      CFRelease(v11);
    }
  }
}

- (void)_setHostApplicationProcessIdentifier:(int)a3 auditToken:(id *)a4
{
  id v4 = CFDataCreate(0, (const UInt8 *)a4, 32);
  Inspector::RemoteInspector::singleton(v4);
  if (v4) {
    CFRetain(v4);
  }
  Inspector::RemoteInspector::setParentProcessInformation();
  if (v4)
  {
    CFRelease(v4);
    CFRelease(v4);
  }
}

- (NakedPtr<WebCore::Page>)page
{
  WebViewPrivate *v2 = self->_private->page.m_ptr;
  return (NakedPtr<WebCore::Page>)self;
}

- (void)_mouseDidMoveOverElement:(id)a3 modifierFlags:(unint64_t)a4
{
  if (a3) {
    CallUIDelegate(self, (objc_selector *)sel_webView_mouseDidMoveOverElement_modifierFlags_, (objc_object *)a3, a4);
  }
}

- (void)_loadBackForwardListFromOtherView:(id)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr && *(void *)(*((void *)a3 + 10) + 8))
  {
    uint64_t v6 = *((void *)m_ptr + 17);
    ++*(_DWORD *)v6;
    uint64_t v7 = *(WebCore::BackForwardController **)(*(void *)(*((void *)a3 + 10) + 8) + 136);
    ++*(_DWORD *)v7;
    WebCore::BackForwardController::currentItem((uint64_t *)&v29, v7);
    uint64_t v8 = v29;
    int v29 = 0;
    if (v8)
    {
      if (*v8 == 1)
      {
        uint64_t v9 = (WTF *)MEMORY[0x1E4E44A30]();
        WTF::fastFree(v9, v10);
      }
      else
      {
        --*v8;
      }
      int v11 = WebCore::BackForwardController::forwardCount(v7);
      int v12 = -(int)WebCore::BackForwardController::backCount(v7);
      if (v11 >= v12)
      {
        int v16 = v11 + 1;
        do
        {
          if (!v12)
          {
            uint64_t v19 = *(void *)(*(void *)(*((void *)a3 + 10) + 8) + 160);
            if (v19 && *(unsigned char *)(v19 + 144) == 0) {
              WebCore::HistoryController::saveDocumentAndScrollState(*(WebCore::HistoryController **)(v19 + 184));
            }
          }
          WebCore::BackForwardController::itemAtIndex(v7);
          WebCore::HistoryItem::copy((uint64_t *)&v29, v28);
          v21 = v28;
          CGFloat v28 = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 1)
            {
              uint64_t v22 = (WTF *)MEMORY[0x1E4E44A30]();
              WTF::fastFree(v22, v23);
            }
            else
            {
              --*(_DWORD *)v21;
            }
          }
          uint64_t v24 = *((void *)self->_private->page.m_ptr + 20);
          (*(void (**)(void, void, void, _DWORD **))(**(void **)(v6 + 16) + 16))(*(void *)(v6 + 16), *(void *)(v24 + 32), *(void *)(v24 + 40), &v29);
          v25 = v29;
          int v29 = 0;
          if (v25)
          {
            if (*v25 == 1)
            {
              uint64_t v17 = (WTF *)MEMORY[0x1E4E44A30]();
              WTF::fastFree(v17, v18);
            }
            else
            {
              --*v25;
            }
          }
          ++v12;
        }
        while (v16 != v12);
      }
      uint64_t v13 = *((void *)self->_private->page.m_ptr + 20);
      if (v13) {
        BOOL v14 = *(unsigned char *)(v13 + 144) == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14)
      {
        uint64_t v15 = (unsigned int *)(v13 + 8);
        atomic_fetch_add((atomic_uint *volatile)(v13 + 8), 1u);
        WebCore::Page::goToItem();
        if (atomic_fetch_add((atomic_uint *volatile)v15, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v15);
          uint64_t v26 = (void *)WTF::fastMalloc((WTF *)0x10);
          void *v26 = &unk_1F3C797F0;
          v26[1] = v15;
          int v29 = v26;
          WTF::ensureOnMainThread();
          uint64_t v27 = (uint64_t)v29;
          int v29 = 0;
          if (v27) {
            (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
          }
        }
      }
    }
    if (!*(_DWORD *)v7)
    {
      __break(0xC471u);
      JUMPOUT(0x1E13FC478);
    }
    --*(_DWORD *)v7;
    if (!*(_DWORD *)v6)
    {
      __break(0xC471u);
      JUMPOUT(0x1E13FC498);
    }
    --*(_DWORD *)v6;
  }
}

- (void)_setFormDelegate:(id)a3
{
  self->_private->formDelegate = (WebFormDelegate *)a3;
  [self->_private->formDelegateForwarder.m_ptr clearTarget];
  id v4 = self->_private;
  m_ptr = v4->formDelegateForwarder.m_ptr;
  v4->formDelegateForwarder.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)_formDelegate
{
  return self->_private->formDelegate;
}

- (id)_formDelegateForwarder
{
  uint64_t v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->formDelegateForwarder.m_ptr) {
    return self->_private->formDelegateForwarder.m_ptr;
  }
  id v5 = [[_WebSafeForwarder alloc] initWithTarget:[(WebView *)self _formDelegate] defaultTarget:+[WebDefaultFormDelegate sharedFormDelegate]];
  uint64_t v6 = self->_private;
  m_ptr = v6->formDelegateForwarder.m_ptr;
  v6->formDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->formDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->formDelegateForwarder.m_ptr;
}

- (id)_formDelegateForSelector:(SEL)a3
{
  formDelegate = self->_private->formDelegate;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    formDelegate = +[WebDefaultFormDelegate sharedFormDelegate];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
  }
  return formDelegate;
}

- (void)_preferencesChangedNotification:(id)a3
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  if ([(WebFrame *)[(WebView *)self mainFrame] _loadsSynchronously])
  {
    uint64_t v5 = [a3 object];
    [(WebView *)self _preferencesChanged:v5];
  }
  else
  {
    WebThreadRun();
  }
}

uint64_t __55__WebView_WebPrivate___preferencesChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  uint64_t result = [*(id *)(a1 + 40) preferences];
  if (v2 == result)
  {
    id v4 = *(void **)(a1 + 40);
    return [v4 _preferencesChanged:v2];
  }
  return result;
}

- (void)_preferencesChanged:(id)a3
{
  uint64_t v5 = self->_private;
  if (v5->userAgentOverridden)
  {
    if (!v5->page.m_ptr) {
      return;
    }
  }
  else
  {
    [(WebView *)self _invalidateUserAgentCache];
    if (!self->_private->page.m_ptr) {
      return;
    }
  }
  if (byte_1EB3A96C9 == 1)
  {
    if ([a3 databasesEnabled]) {
      +[WebDatabaseManager sharedWebDatabaseManager];
    }
    if ([a3 storageTrackerEnabled]) {
      WebKitInitializeStorageIfNecessary();
    }
  }
  WTF::makeVector<WTF::String>((void *)[a3 additionalSupportedImageTypes], (uint64_t)&v58);
  WebCore::setAdditionalSupportedImageTypes();
  if (v60)
  {
    uint64_t v7 = v58;
    uint64_t v8 = 8 * v60;
    do
    {
      uint64_t v9 = *(WTF::StringImpl **)v7;
      *(void *)uint64_t v7 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v6);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
      uint64_t v7 = (WTF::StringImpl *)((char *)v7 + 8);
      v8 -= 8;
    }
    while (v8);
  }
  uint64_t v10 = v58;
  if (v58)
  {
    v58 = 0;
    int v59 = 0;
    WTF::fastFree(v10, v6);
  }
  [(WebView *)self _preferencesChangedGenerated:a3];
  uint64_t v11 = *((void *)self->_private->page.m_ptr + 14);
  BOOL v12 = [(WebView *)self interactiveFormValidationEnabled];
  uint64_t v13 = (uint64_t *)(v11 + 664);
  uint64_t v14 = 0x800000000000;
  if (!v12) {
    uint64_t v14 = 0;
  }
  *(void *)(v11 + 680) = *(void *)(v11 + 680) & 0xFFFF7FFFFFFFFFFFLL | v14;
  *(_DWORD *)(v11 + 608) = [(WebView *)self validationMessageTimerMagnification];
  [a3 storageBlockingPolicy];
  WebCore::Settings::setStorageBlockingPolicy();
  unsigned int v15 = [a3 editableLinkBehavior];
  if (v15 >= 5) {
    char v16 = 0;
  }
  else {
    char v16 = v15;
  }
  *(unsigned char *)(v11 + 369) = v16;
  *(_DWORD *)(v11 + 424) = [a3 javaScriptRuntimeFlags];
  int v17 = [a3 textDirectionSubmenuInclusionBehavior];
  if (v17 == 2) {
    char v18 = 2;
  }
  else {
    char v18 = v17 == 1;
  }
  *(unsigned char *)(v11 + 550) = v18;
  [a3 _backForwardCacheExpirationInterval];
  *(void *)(v11 + 312) = v19;
  *(unsigned char *)(v11 + 520) = [a3 _pitchCorrectionAlgorithm];
  int v20 = [a3 developerExtrasEnabled];
  uint64_t v21 = 0x1000000000000000;
  if (!v20) {
    uint64_t v21 = 0;
  }
  *(void *)(v11 + 672) = *(void *)(v11 + 672) & 0xEFFFFFFFFFFFFFFFLL | v21;
  if ([a3 mediaPlaybackRequiresUserGesture])
  {
    uint64_t v23 = *(void *)(v11 + 712);
    uint64_t v22 = *(void *)(v11 + 720);
    uint64_t v25 = *(void *)(v11 + 680);
    uint64_t v24 = *(void *)(v11 + 688);
    uint64_t v27 = *v13;
    uint64_t v26 = *(void *)(v11 + 672);
    uint64_t v28 = *(void *)(v11 + 704);
    uint64_t v29 = *(void *)(v11 + 696) | 4;
    *(void *)(v11 + 696) = v29;
LABEL_34:
    uint64_t v33 = 2;
    goto LABEL_36;
  }
  int v30 = [a3 videoPlaybackRequiresUserGesture];
  uint64_t v31 = 4;
  if (!v30) {
    uint64_t v31 = 0;
  }
  *(void *)(v11 + 696) = *(void *)(v11 + 696) & 0xFFFFFFFFFFFFFFFBLL | v31;
  int v32 = [a3 audioPlaybackRequiresUserGesture];
  uint64_t v23 = *(void *)(v11 + 712);
  uint64_t v22 = *(void *)(v11 + 720);
  uint64_t v29 = *(void *)(v11 + 696);
  uint64_t v28 = *(void *)(v11 + 704);
  uint64_t v25 = *(void *)(v11 + 680);
  uint64_t v24 = *(void *)(v11 + 688);
  uint64_t v27 = *v13;
  uint64_t v26 = *(void *)(v11 + 672);
  if (v32) {
    goto LABEL_34;
  }
  uint64_t v33 = 0;
LABEL_36:
  uint64_t *v13 = v27;
  *(void *)(v11 + 672) = v26;
  *(void *)(v11 + 680) = v25;
  *(void *)(v11 + 688) = v24;
  *(void *)(v11 + 696) = v29 & 0xFFFFFFFFFFFFFFFDLL | v33;
  *(void *)(v11 + 704) = v28;
  *(void *)(v11 + 712) = v23;
  *(void *)(v11 + 720) = v22;
  uint64_t v34 = (WebCore::DeprecatedGlobalSettings *)[a3 webSQLEnabled];
  char v35 = (char)v34;
  uint64_t v36 = (WebCore::DatabaseManager *)WebCore::DeprecatedGlobalSettings::shared(v34);
  *((unsigned char *)v36 + 24) = v35;
  char v37 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton(v36);
  [a3 databasesEnabled];
  WebCore::DatabaseManager::setIsAvailable(v37);
  MEMORY[0x1E4E442D0](&v58, [a3 _localStorageDatabasePath]);
  int v39 = v58;
  if (v58) {
    *(_DWORD *)v58 += 2;
  }
  v40 = *(WTF::StringImpl **)(v11 + 440);
  *(void *)(v11 + 440) = v39;
  if (v40)
  {
    if (*(_DWORD *)v40 == 2)
    {
      WTF::StringImpl::destroy(v40, v38);
      int v39 = v58;
      v58 = 0;
      if (!v39) {
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    *(_DWORD *)v40 -= 2;
  }
  v58 = 0;
  if (!v39) {
    goto LABEL_47;
  }
LABEL_44:
  if (*(_DWORD *)v39 == 2) {
    WTF::StringImpl::destroy(v39, v38);
  }
  else {
    *(_DWORD *)v39 -= 2;
  }
LABEL_47:
  m_ptr = self->_private->page.m_ptr;
  if ([a3 privateBrowsingEnabled]) {
    v42.m_identifier = 0x8000000000000001;
  }
  else {
    v42.m_identifier = 1;
  }
  WebCore::Page::setSessionID((WebCore::Page *)m_ptr, v42);
  WebBroadcastChannelRegistry::getOrCreate([a3 privateBrowsingEnabled], (uint64_t *)&v57);
  v58 = v57;
  WebCore::Page::setBroadcastChannelRegistry();
  uint64_t v43 = v58;
  v58 = 0;
  if (v43)
  {
    if (*((_DWORD *)v43 + 2) == 1) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v43 + 8))(v43);
    }
    else {
      --*((_DWORD *)v43 + 2);
    }
  }
  char v44 = WebViewGroup::storageNamespaceProvider(self->_private->group.m_ptr);
  if ([a3 privateBrowsingEnabled]) {
    v45.m_identifier = 0x8000000000000001;
  }
  else {
    v45.m_identifier = 1;
  }
  WebCore::StorageNamespaceProvider::setSessionIDForTesting(v44, v45);
  WebCore::DeprecatedGlobalSettings::setAudioSessionCategoryOverride((WebCore::DeprecatedGlobalSettings *)[a3 audioSessionCategoryOverride]);
  WebCore::DeprecatedGlobalSettings::setNetworkDataUsageTrackingEnabled((WebCore::DeprecatedGlobalSettings *)[a3 networkDataUsageTrackingEnabled]);
  MEMORY[0x1E4E442D0](&v58, [a3 networkInterfaceName]);
  WebCore::DeprecatedGlobalSettings::setNetworkInterfaceName((WebCore::DeprecatedGlobalSettings *)&v58, v46);
  uint64_t v48 = v58;
  v58 = 0;
  if (v48)
  {
    if (*(_DWORD *)v48 == 2) {
      WTF::StringImpl::destroy(v48, v47);
    }
    else {
      *(_DWORD *)v48 -= 2;
    }
  }
  v49 = self->_private->page.m_ptr;
  MEMORY[0x1E4E442D0](&v58, [a3 mediaKeysStorageDirectory]);
  WebCore::Page::setMediaKeysStorageDirectory((WebCore::Page *)v49, (const WTF::String *)&v58);
  uint64_t v51 = v58;
  v58 = 0;
  if (v51)
  {
    if (*(_DWORD *)v51 == 2) {
      WTF::StringImpl::destroy(v51, v50);
    }
    else {
      *(_DWORD *)v51 -= 2;
    }
  }
  WebCore::DeprecatedGlobalSettings::setTrackingPreventionEnabled((WebCore::DeprecatedGlobalSettings *)[a3 resourceLoadStatisticsEnabled]);
  uint64_t v52 = [a3 zoomsTextOnly];
  v54 = self->_private;
  if (v54->zoomsTextOnly != v52)
  {
    *(float *)&double v53 = v54->zoomMultiplier;
    [(WebView *)self _setZoomMultiplier:v52 isTextOnly:v53];
  }
  uint64_t v55 = objc_msgSend((id)-[WebView window](self, "window"), "tileCache");
  if (v55)
  {
    v56 = (WebCore::LegacyTileCache *)v55;
    [a3 showDebugBorders];
    WebCore::LegacyTileCache::setTileBordersVisible(v56);
    [a3 showRepaintCounter];
    WebCore::LegacyTileCache::setTilePaintCountersVisible(v56);
    *((unsigned char *)v56 + 66) = [a3 acceleratedDrawingEnabled];
  }
  objc_msgSend(MEMORY[0x1E4FB61B8], "_setInterpolationQuality:", objc_msgSend(a3, "_interpolationQuality"));
  WebCore::Page::settingsDidChange((WebCore::Page *)self->_private->page.m_ptr);
}

- (id)_UIKitDelegateForwarder
{
  uint64_t v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->UIKitDelegateForwarder.m_ptr) {
    return self->_private->UIKitDelegateForwarder.m_ptr;
  }
  uint64_t v5 = [[_WebSafeForwarder alloc] initWithTarget:self->_private->UIKitDelegate defaultTarget:+[WebDefaultUIKitDelegate sharedUIKitDelegate]];
  uint64_t v6 = self->_private;
  m_ptr = v6->UIKitDelegateForwarder.m_ptr;
  v6->UIKitDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->UIKitDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->UIKitDelegateForwarder.m_ptr;
}

- (void)_cacheResourceLoadDelegateImplementations
{
  uint64_t v2 = self->_private;
  id resourceProgressDelegate = v2->resourceProgressDelegate;
  if (resourceProgressDelegate)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [resourceProgressDelegate methodForSelector:sel_webView_resource_didFailLoadingWithError_fromDataSource_];
    }
    else {
      uint64_t v4 = 0;
    }
    v2->resourceLoadDelegateImplementations.didFailLoadingWithErrorFromDataSourceFunc = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [resourceProgressDelegate methodForSelector:sel_webView_resource_didFinishLoadingFromDataSource_];
    }
    else {
      uint64_t v5 = 0;
    }
    v2->resourceLoadDelegateImplementations.didFinishLoadingFromDataSourceFunc = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [resourceProgressDelegate methodForSelector:sel_webView_didLoadResourceFromMemoryCache_response_length_fromDataSource_];
    }
    else {
      uint64_t v6 = 0;
    }
    v2->resourceLoadDelegateImplementations.didLoadResourceFromMemoryCacheFunc = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [resourceProgressDelegate methodForSelector:sel_webView_resource_didReceiveAuthenticationChallenge_fromDataSource_];
    }
    else {
      uint64_t v7 = 0;
    }
    v2->resourceLoadDelegateImplementations.didReceiveAuthenticationChallengeFunc = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [resourceProgressDelegate methodForSelector:sel_webView_resource_canAuthenticateAgainstProtectionSpace_forDataSource_];
    }
    else {
      uint64_t v8 = 0;
    }
    v2->resourceLoadDelegateImplementations.canAuthenticateAgainstProtectionSpaceFunc = (void *)v8;
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [resourceProgressDelegate methodForSelector:sel_webView_connectionPropertiesForResource_dataSource_];
    }
    else {
      uint64_t v9 = 0;
    }
    v2->resourceLoadDelegateImplementations.connectionPropertiesFunc = (void *)v9;
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_didFinishLoadingFromDataSource_];
    }
    else {
      uint64_t v10 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadDidFinishLoadingFromDataSourceFunc = (void *)v10;
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_didFailLoadingWithError_fromDataSource_];
    }
    else {
      uint64_t v11 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadDidFailLoadingWithErrorFromDataSourceFunc = (void *)v11;
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_identifierForInitialRequest_fromDataSource_];
    }
    else {
      uint64_t v12 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadIdentifierForRequestFunc = (void *)v12;
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_didLoadResourceFromMemoryCache_response_length_fromDataSource_];
    }
    else {
      uint64_t v13 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadDidLoadResourceFromMemoryCacheFunc = (void *)v13;
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource_];
    }
    else {
      uint64_t v14 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadWillSendRequestFunc = (void *)v14;
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_didReceiveResponse_fromDataSource_];
    }
    else {
      uint64_t v15 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadDidReceiveResponseFunc = (void *)v15;
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_didReceiveContentLength_fromDataSource_];
    }
    else {
      uint64_t v16 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadDidReceiveContentLengthFunc = (void *)v16;
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = [resourceProgressDelegate methodForSelector:sel_webThreadWebView_resource_willCacheResponse_fromDataSource_];
    }
    else {
      uint64_t v17 = 0;
    }
    v2->resourceLoadDelegateImplementations.webThreadWillCacheResponseFunc = (void *)v17;
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = [resourceProgressDelegate methodForSelector:sel_webView_resource_didReceiveContentLength_fromDataSource_];
    }
    else {
      uint64_t v18 = 0;
    }
    v2->resourceLoadDelegateImplementations.didReceiveContentLengthFunc = (void *)v18;
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = [resourceProgressDelegate methodForSelector:sel_webView_resource_didReceiveResponse_fromDataSource_];
    }
    else {
      uint64_t v19 = 0;
    }
    v2->resourceLoadDelegateImplementations.didReceiveResponseFunc = (void *)v19;
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = [resourceProgressDelegate methodForSelector:sel_webView_identifierForInitialRequest_fromDataSource_];
    }
    else {
      uint64_t v20 = 0;
    }
    v2->resourceLoadDelegateImplementations.identifierForRequestFunc = (void *)v20;
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = [resourceProgressDelegate methodForSelector:sel_webView_plugInFailedWithError_dataSource_];
    }
    else {
      uint64_t v21 = 0;
    }
    v2->resourceLoadDelegateImplementations.plugInFailedWithErrorFunc = (void *)v21;
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = [resourceProgressDelegate methodForSelector:sel_webView_resource_willCacheResponse_fromDataSource_];
    }
    else {
      uint64_t v22 = 0;
    }
    v2->resourceLoadDelegateImplementations.willCacheResponseFunc = (void *)v22;
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = [resourceProgressDelegate methodForSelector:sel_webView_resource_willSendRequest_redirectResponse_fromDataSource_];
    }
    else {
      uint64_t v23 = 0;
    }
    v2->resourceLoadDelegateImplementations.willSendRequestFunc = (void *)v23;
    if (objc_opt_respondsToSelector()) {
      uint64_t v24 = [resourceProgressDelegate methodForSelector:sel_webView_resource_shouldUseCredentialStorageForDataSource_];
    }
    else {
      uint64_t v24 = 0;
    }
    v2->resourceLoadDelegateImplementations.shouldUseCredentialStorageFunc = (void *)v24;
    if (objc_opt_respondsToSelector()) {
      v2->resourceLoadDelegateImplementations.shouldPaintBrokenImageForURLFunc = (void *)[resourceProgressDelegate methodForSelector:sel_webView_shouldPaintBrokenImageForURL_];
    }
    else {
      v2->resourceLoadDelegateImplementations.shouldPaintBrokenImageForURLFunc = 0;
    }
  }
  else
  {
    bzero(&v2->resourceLoadDelegateImplementations, 0xB0uLL);
  }
}

- (void)_cacheFrameLoadDelegateImplementations
{
  uint64_t v2 = self->_private;
  id frameLoadDelegate = v2->frameLoadDelegate;
  if (frameLoadDelegate)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [frameLoadDelegate methodForSelector:sel_webView_didCancelClientRedirectForFrame_];
    }
    else {
      uint64_t v5 = 0;
    }
    v2->frameLoadDelegateImplementations.didCancelClientRedirectForFrameFunc = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [frameLoadDelegate methodForSelector:sel_webView_didChangeLocationWithinPageForFrame_];
    }
    else {
      uint64_t v6 = 0;
    }
    v2->frameLoadDelegateImplementations.didChangeLocationWithinPageForFrameFunc = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [frameLoadDelegate methodForSelector:sel_webView_didPushStateWithinPageForFrame_];
    }
    else {
      uint64_t v7 = 0;
    }
    v2->frameLoadDelegateImplementations.didPushStateWithinPageForFrameFunc = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [frameLoadDelegate methodForSelector:sel_webView_didReplaceStateWithinPageForFrame_];
    }
    else {
      uint64_t v8 = 0;
    }
    v2->frameLoadDelegateImplementations.didReplaceStateWithinPageForFrameFunc = (void *)v8;
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [frameLoadDelegate methodForSelector:sel_webView_didPopStateWithinPageForFrame_];
    }
    else {
      uint64_t v9 = 0;
    }
    v2->frameLoadDelegateImplementations.didPopStateWithinPageForFrameFunc = (void *)v9;
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = [frameLoadDelegate methodForSelector:sel_webView_didCreateJavaScriptContext_forFrame_];
    }
    else {
      uint64_t v10 = 0;
    }
    v2->frameLoadDelegateImplementations.didCreateJavaScriptContextForFrameFunc = (void *)v10;
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = [frameLoadDelegate methodForSelector:sel_webView_didClearWindowObject_forFrame_];
    }
    else {
      uint64_t v11 = 0;
    }
    v2->frameLoadDelegateImplementations.didClearWindowObjectForFrameFunc = (void *)v11;
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = [frameLoadDelegate methodForSelector:sel_webView_didClearWindowObjectForFrame_inScriptWorld_];
    }
    else {
      uint64_t v12 = 0;
    }
    v2->frameLoadDelegateImplementations.didClearWindowObjectForFrameInScriptWorldFunc = (void *)v12;
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = [frameLoadDelegate methodForSelector:sel_webView_didClearInspectorWindowObject_forFrame_];
    }
    else {
      uint64_t v13 = 0;
    }
    v2->frameLoadDelegateImplementations.didClearInspectorWindowObjectForFrameFunc = (void *)v13;
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = [frameLoadDelegate methodForSelector:sel_webView_didCommitLoadForFrame_];
    }
    else {
      uint64_t v14 = 0;
    }
    v2->frameLoadDelegateImplementations.didCommitLoadForFrameFunc = (void *)v14;
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [frameLoadDelegate methodForSelector:sel_webView_didFailLoadWithError_forFrame_];
    }
    else {
      uint64_t v15 = 0;
    }
    v2->frameLoadDelegateImplementations.didFailLoadWithErrorForFrameFunc = (void *)v15;
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = [frameLoadDelegate methodForSelector:sel_webView_didFailProvisionalLoadWithError_forFrame_];
    }
    else {
      uint64_t v16 = 0;
    }
    v2->frameLoadDelegateImplementations.didFailProvisionalLoadWithErrorForFrameFunc = (void *)v16;
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = [frameLoadDelegate methodForSelector:sel_webView_didFinishDocumentLoadForFrame_];
    }
    else {
      uint64_t v17 = 0;
    }
    v2->frameLoadDelegateImplementations.didFinishDocumentLoadForFrameFunc = (void *)v17;
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = [frameLoadDelegate methodForSelector:sel_webView_didFinishLoadForFrame_];
    }
    else {
      uint64_t v18 = 0;
    }
    v2->frameLoadDelegateImplementations.didFinishLoadForFrameFunc = (void *)v18;
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = [frameLoadDelegate methodForSelector:sel_webView_didFirstLayoutInFrame_];
    }
    else {
      uint64_t v19 = 0;
    }
    v2->frameLoadDelegateImplementations.didFirstLayoutInFrameFunc = (void *)v19;
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = [frameLoadDelegate methodForSelector:sel_webView_didFirstVisuallyNonEmptyLayoutInFrame_];
    }
    else {
      uint64_t v20 = 0;
    }
    v2->frameLoadDelegateImplementations.didFirstVisuallyNonEmptyLayoutInFrameFunc = (void *)v20;
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = [frameLoadDelegate methodForSelector:sel_webView_didLayout_];
    }
    else {
      uint64_t v21 = 0;
    }
    v2->frameLoadDelegateImplementations.didLayoutFunc = (void *)v21;
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = [frameLoadDelegate methodForSelector:sel_webView_didHandleOnloadEventsForFrame_];
    }
    else {
      uint64_t v22 = 0;
    }
    v2->frameLoadDelegateImplementations.didHandleOnloadEventsForFrameFunc = (void *)v22;
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = [frameLoadDelegate methodForSelector:sel_webView_didReceiveServerRedirectForProvisionalLoadForFrame_];
    }
    else {
      uint64_t v23 = 0;
    }
    v2->frameLoadDelegateImplementations.didReceiveServerRedirectForProvisionalLoadForFrameFunc = (void *)v23;
    if (objc_opt_respondsToSelector()) {
      uint64_t v24 = [frameLoadDelegate methodForSelector:sel_webView_didReceiveTitle_forFrame_];
    }
    else {
      uint64_t v24 = 0;
    }
    v2->frameLoadDelegateImplementations.didReceiveTitleForFrameFunc = (void *)v24;
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = [frameLoadDelegate methodForSelector:sel_webView_didStartProvisionalLoadForFrame_];
    }
    else {
      uint64_t v25 = 0;
    }
    v2->frameLoadDelegateImplementations.didStartProvisionalLoadForFrameFunc = (void *)v25;
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = [frameLoadDelegate methodForSelector:sel_webView_willCloseFrame_];
    }
    else {
      uint64_t v26 = 0;
    }
    v2->frameLoadDelegateImplementations.willCloseFrameFunc = (void *)v26;
    if (objc_opt_respondsToSelector()) {
      uint64_t v27 = [frameLoadDelegate methodForSelector:sel_webView_willPerformClientRedirectToURL_delay_fireDate_forFrame_];
    }
    else {
      uint64_t v27 = 0;
    }
    v2->frameLoadDelegateImplementations.willPerformClientRedirectToURLDelayFireDateForFrameFunc = (void *)v27;
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = [frameLoadDelegate methodForSelector:sel_webView_windowScriptObjectAvailable_];
    }
    else {
      uint64_t v28 = 0;
    }
    v2->frameLoadDelegateImplementations.windowScriptObjectAvailableFunc = (void *)v28;
    if (objc_opt_respondsToSelector()) {
      uint64_t v29 = [frameLoadDelegate methodForSelector:sel_webViewDidDisplayInsecureContent_];
    }
    else {
      uint64_t v29 = 0;
    }
    v2->frameLoadDelegateImplementations.didDisplayInsecureContentFunc = (void *)v29;
    if (objc_opt_respondsToSelector()) {
      uint64_t v30 = [frameLoadDelegate methodForSelector:sel_webView_didRunInsecureContent_];
    }
    else {
      uint64_t v30 = 0;
    }
    v2->frameLoadDelegateImplementations.didRunInsecureContentFunc = (void *)v30;
    if (objc_opt_respondsToSelector()) {
      uint64_t v31 = [frameLoadDelegate methodForSelector:sel_webView_didDetectXSS_];
    }
    else {
      uint64_t v31 = 0;
    }
    v2->frameLoadDelegateImplementations.didDetectXSSFunc = (void *)v31;
    if (objc_opt_respondsToSelector()) {
      uint64_t v32 = [frameLoadDelegate methodForSelector:sel_webView_didRemoveFrameFromHierarchy_];
    }
    else {
      uint64_t v32 = 0;
    }
    v2->frameLoadDelegateImplementations.didRemoveFrameFromHierarchyFunc = (void *)v32;
    if (objc_opt_respondsToSelector())
    {
      v2->frameLoadDelegateImplementations.webThreadDidLayoutFunc = (void *)[frameLoadDelegate methodForSelector:sel_webThreadWebView_didLayout_];
      [(WebView *)self page];
      if (!v33) {
        return;
      }
    }
    else
    {
      v2->frameLoadDelegateImplementations.webThreadDidLayoutFunc = 0;
      [(WebView *)self page];
      if (!v33) {
        return;
      }
    }
    WebCore::Page::addLayoutMilestones();
    return;
  }
  bzero(&v2->frameLoadDelegateImplementations, 0xF0uLL);
}

- (void)_cacheScriptDebugDelegateImplementations
{
  uint64_t v2 = self->_private;
  p_scriptDebugDelegateImplementations = &v2->scriptDebugDelegateImplementations;
  id scriptDebugDelegate = v2->scriptDebugDelegate;
  if (!scriptDebugDelegate)
  {
    bzero(&v2->scriptDebugDelegateImplementations, 0x20uLL);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    p_didParseSourceFunc = &v2->scriptDebugDelegateImplementations.didParseSourceFunc;
    v2->scriptDebugDelegateImplementations.didParseSourceFunc = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [scriptDebugDelegate methodForSelector:sel_webView_didParseSource_baseLineNumber_fromURL_sourceId_forWebFrame_];
  v2->scriptDebugDelegateImplementations.didParseSourceFunc = (void *)v5;
  if (!v5)
  {
    p_didParseSourceFunc = &v2->scriptDebugDelegateImplementations.didParseSourceFunc;
LABEL_11:
    p_scriptDebugDelegateImplementations->didParseSourceExpectsBaseLineNumber = 0;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [scriptDebugDelegate methodForSelector:sel_webView_didParseSource_fromURL_sourceId_forWebFrame_];
    }
    else {
      uint64_t v8 = 0;
    }
    void *p_didParseSourceFunc = v8;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    uint64_t v6 = [scriptDebugDelegate methodForSelector:sel_webView_failedToParseSource_baseLineNumber_fromURL_withError_forWebFrame_];
    goto LABEL_16;
  }
  p_scriptDebugDelegateImplementations->didParseSourceExpectsBaseLineNumber = 1;
  if (objc_opt_respondsToSelector()) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v6 = 0;
LABEL_16:
  v2->scriptDebugDelegateImplementations.failedToParseSourceFunc = (void *)v6;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [scriptDebugDelegate methodForSelector:sel_webView_exceptionWasRaised_hasHandler_sourceId_line_forWebFrame_];
    v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc = (void *)v9;
    if (v9)
    {
      v2->scriptDebugDelegateImplementations.exceptionWasRaisedExpectsHasHandlerFlag = 1;
      return;
    }
    p_exceptionWasRaisedFunc = &v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc;
  }
  else
  {
    p_exceptionWasRaisedFunc = &v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc;
    v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc = 0;
  }
  v2->scriptDebugDelegateImplementations.exceptionWasRaisedExpectsHasHandlerFlag = 0;
  if (objc_opt_respondsToSelector()) {
    *p_exceptionWasRaisedFunc = (void *)[scriptDebugDelegate methodForSelector:sel_webView_exceptionWasRaised_sourceId_line_forWebFrame_];
  }
  else {
    *p_exceptionWasRaisedFunc = 0;
  }
}

- (void)_cacheHistoryDelegateImplementations
{
  uint64_t v2 = self->_private;
  id historyDelegate = v2->historyDelegate;
  if (historyDelegate)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [historyDelegate methodForSelector:sel_webView_didNavigateWithNavigationData_inFrame_];
    }
    else {
      uint64_t v4 = 0;
    }
    v2->historyDelegateImplementations.navigatedFunc = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [historyDelegate methodForSelector:sel_webView_didPerformClientRedirectFromURL_toURL_inFrame_];
    }
    else {
      uint64_t v5 = 0;
    }
    v2->historyDelegateImplementations.clientRedirectFunc = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [historyDelegate methodForSelector:sel_webView_didPerformServerRedirectFromURL_toURL_inFrame_];
    }
    else {
      uint64_t v6 = 0;
    }
    v2->historyDelegateImplementations.serverRedirectFunc = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [historyDelegate methodForSelector:sel_webView_updateHistoryTitle_forURL_];
    }
    else {
      uint64_t v7 = 0;
    }
    v2->historyDelegateImplementations.deprecatedSetTitleFunc = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [historyDelegate methodForSelector:sel_webView_updateHistoryTitle_forURL_inFrame_];
    }
    else {
      uint64_t v8 = 0;
    }
    v2->historyDelegateImplementations.setTitleFunc = (void *)v8;
    if (objc_opt_respondsToSelector()) {
      v2->historyDelegateImplementations.populateVisitedLinksFunc = (void *)[historyDelegate methodForSelector:sel_populateVisitedLinksForWebView_];
    }
    else {
      v2->historyDelegateImplementations.populateVisitedLinksFunc = 0;
    }
  }
  else
  {
    bzero(&v2->historyDelegateImplementations, 0x30uLL);
  }
}

- (id)_policyDelegateForwarder
{
  uint64_t v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->policyDelegateForwarder.m_ptr) {
    return self->_private->policyDelegateForwarder.m_ptr;
  }
  uint64_t v5 = [[_WebSafeForwarder alloc] initWithTarget:self->_private->policyDelegate defaultTarget:+[WebDefaultPolicyDelegate sharedPolicyDelegate]];
  uint64_t v6 = self->_private;
  m_ptr = v6->policyDelegateForwarder.m_ptr;
  v6->policyDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->policyDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->policyDelegateForwarder.m_ptr;
}

- (id)_UIDelegateForwarder
{
  uint64_t v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->UIDelegateForwarder.m_ptr) {
    return self->_private->UIDelegateForwarder.m_ptr;
  }
  uint64_t v5 = [[_WebSafeForwarder alloc] initWithTarget:self->_private->UIDelegate defaultTarget:+[WebDefaultUIDelegate sharedUIDelegate]];
  uint64_t v6 = self->_private;
  m_ptr = v6->UIDelegateForwarder.m_ptr;
  v6->UIDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->UIDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->UIDelegateForwarder.m_ptr;
}

- (id)_UIDelegateForSelector:(SEL)a3
{
  id UIDelegate = self->_private->UIDelegate;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id UIDelegate = +[WebDefaultUIDelegate sharedUIDelegate];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
  }
  return UIDelegate;
}

- (id)_editingDelegateForwarder
{
  uint64_t v2 = self->_private;
  if (v2) {
    BOOL v3 = !v2->closing;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3) {
    return 0;
  }
  if (v2->editingDelegateForwarder.m_ptr) {
    return self->_private->editingDelegateForwarder.m_ptr;
  }
  uint64_t v6 = [[_WebSafeForwarder alloc] initWithTarget:self->_private->editingDelegate defaultTarget:+[WebDefaultEditingDelegate sharedEditingDelegate]];
  uint64_t v7 = self->_private;
  m_ptr = v7->editingDelegateForwarder.m_ptr;
  v7->editingDelegateForwarder.m_ptr = v6;
  if (!m_ptr) {
    return self->_private->editingDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->editingDelegateForwarder.m_ptr;
}

+ (void)_unregisterViewClassAndRepresentationClassForMIMEType:(id)a3
{
  objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "removeObjectForKey:", a3);
  uint64_t v4 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes((WebCore::MIMETypeRegistry *)objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 0), "removeObjectForKey:", a3));
  MEMORY[0x1E4E442D0](&v18, a3);
  uint64_t v6 = v18;
  uint64_t v7 = *v4;
  if (*v4)
  {
    unsigned int v8 = *(_DWORD *)(v7 - 8);
    int v9 = WTF::ASCIICaseInsensitiveHash::hash(v18, v5);
    for (i = 0; ; int v9 = i + v11)
    {
      uint64_t v11 = v9 & v8;
      uint64_t v12 = *(WTF::StringImpl **)(v7 + 8 * v11);
      if (v12 != (WTF::StringImpl *)-1)
      {
        if (!v12) {
          goto LABEL_20;
        }
        if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>(*(void *)(v7 + 8 * v11), (uint64_t)v6))
        {
          break;
        }
      }
      ++i;
    }
    if (v11 == *(_DWORD *)(v7 - 4)) {
      goto LABEL_20;
    }
    *(void *)(v7 + 8 * v11) = -1;
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::destroy(v12, v5);
      ++*(_DWORD *)(*v4 - 16);
      uint64_t v13 = *v4;
      if (*v4)
      {
LABEL_10:
        --*(_DWORD *)(v13 - 12);
        uint64_t v14 = *v4;
        if (!*v4) {
          goto LABEL_20;
        }
        goto LABEL_14;
      }
    }
    else
    {
      *(_DWORD *)v12 -= 2;
      ++*(_DWORD *)(*v4 - 16);
      uint64_t v13 = *v4;
      if (*v4) {
        goto LABEL_10;
      }
    }
    *(_DWORD *)(v13 - 12) = -1;
    uint64_t v14 = *v4;
    if (!*v4)
    {
LABEL_20:
      uint64_t v6 = v18;
      goto LABEL_21;
    }
LABEL_14:
    unsigned int v15 = 6 * *(_DWORD *)(v14 - 12);
    unsigned int v16 = *(_DWORD *)(v14 - 4);
    if (v15 < v16 && v16 >= 9) {
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::rehash(v4, v16 >> 1, 0);
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v18 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

+ (void)_registerViewClass:(Class)a3 representationClass:(Class)a4 forURLScheme:(id)a5
{
  uint64_t v9 = [a1 _generatedMIMETypeForURLScheme:a5];
  [a1 registerViewClass:a3 representationClass:a4 forMIMEType:v9];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = (WebCore::MIMETypeRegistry *)objc_opt_class();
  if ((WebCore::MIMETypeRegistry *)v10 != v11
    || (uint64_t v12 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes(v11),
        MEMORY[0x1E4E442D0](&v20, v9),
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t)&v19, v12, &v20), v14 = v20, uint64_t v20 = 0, !v14))
  {
LABEL_5:
    p_superclass = WebDatabaseManager.superclass;
    if (byte_1EB3A96D8) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  if (*(_DWORD *)v14 != 2)
  {
    *(_DWORD *)v14 -= 2;
    goto LABEL_5;
  }
  WTF::StringImpl::destroy(v14, v13);
  p_superclass = (__objc2_class **)(WebDatabaseManager + 8);
  if (byte_1EB3A96D8)
  {
LABEL_6:
    unsigned int v16 = p_superclass[228];
    if (v16) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_13:
  qword_1EB3A9720 = 0;
  byte_1EB3A96D8 = 1;
LABEL_7:
  unsigned int v16 = (__objc2_class *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v17 = p_superclass[228];
  p_superclass[228] = v16;
  if (v17)
  {
    CFRelease(v17);
    unsigned int v16 = p_superclass[228];
  }
LABEL_9:
  uint64_t v18 = (const void *)objc_msgSend((id)objc_msgSend(a5, "lowercaseString"), "copy");
  [(__objc2_class *)v16 addObject:v18];
  if (v18) {
    CFRelease(v18);
  }
}

+ (id)_generatedMIMETypeForURLScheme:(id)a3
{
  uint64_t v3 = [a3 lowercaseString];
  return (id)[@"x-apple-web-kit/" stringByAppendingString:v3];
}

+ (BOOL)_representationExistsForURLScheme:(id)a3
{
  if (byte_1EB3A96D8 == 1)
  {
    uint64_t v3 = (void *)qword_1EB3A9720;
  }
  else
  {
    uint64_t v3 = 0;
    qword_1EB3A9720 = 0;
    byte_1EB3A96D8 = 1;
  }
  uint64_t v4 = [a3 lowercaseString];
  return [v3 containsObject:v4];
}

+ (BOOL)_canHandleRequest:(id)a3 forMainFrame:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  if (objc_msgSend(MEMORY[0x1E4F18D80], "canHandleRequest:")) {
    return 1;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "URL"), "scheme");
  if (v4 && ([a1 _representationExistsForURLScheme:v7] & 1) != 0) {
    return 1;
  }
  if (objc_msgSend(v7, "_webkit_isCaseInsensitiveEqualToString:", @"applewebdata")) {
    return 1;
  }
  return objc_msgSend(v7, "_webkit_isCaseInsensitiveEqualToString:", @"blob");
}

+ (BOOL)_canHandleRequest:(id)a3
{
  return [a1 _canHandleRequest:a3 forMainFrame:1];
}

+ (id)_decodeData:(id)a3
{
  WebCore::HTMLNames::init((WebCore::HTMLNames *)a1);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12[0] = &unk_1F3C7B378;
  memset(&v12[1], 0, 24);
  WebCore::TextResourceDecoder::create((WebCore::TextResourceDecoder *)&v13, (const WTF::String *)v12, 0);
  if (a3)
  {
    [a3 bytes];
    [a3 length];
  }
  WebCore::TextResourceDecoder::decodeAndFlush();
  if (!v15)
  {
    unsigned int v15 = 0;
    uint64_t v5 = &stru_1F3C7DA90;
LABEL_9:
    uint64_t v7 = v14;
    uint64_t v14 = 0;
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  uint64_t v6 = v15;
  unsigned int v15 = 0;
  if (!v6) {
    goto LABEL_9;
  }
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v4);
    uint64_t v7 = v14;
    uint64_t v14 = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    uint64_t v7 = v14;
    uint64_t v14 = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
LABEL_10:
  if (*(_DWORD *)v7 == 1)
  {
    WebCore::TextResourceDecoder::~TextResourceDecoder(v7);
    WTF::fastFree(v8, v9);
  }
  else
  {
    --*(_DWORD *)v7;
  }
LABEL_14:
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (!v10) {
    return v5;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v10, v4);
  return v5;
}

- (void)_pushPerformingProgrammaticFocus
{
}

- (void)_popPerformingProgrammaticFocus
{
}

- (BOOL)_isPerformingProgrammaticFocus
{
  return self->_private->programmaticFocusCount != 0;
}

- (void)_didCommitLoadForFrame:(id)a3
{
  if ([(WebView *)self mainFrame] == a3) {
    atomic_store(0, (unsigned __int8 *)&self->_private->didDrawTiles);
  }
}

- (void)_setUIKitDelegate:(id)a3
{
  self->_private->UIKitDelegate = a3;
  [self->_private->UIKitDelegateForwarder.m_ptr clearTarget];
  BOOL v4 = self->_private;
  m_ptr = v4->UIKitDelegateForwarder.m_ptr;
  v4->UIKitDelegateForwarder.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)_UIKitDelegate
{
  return self->_private->UIKitDelegate;
}

- (void)setWebMailDelegate:(id)a3
{
  self->_private->WebMailDelegate = a3;
}

- (id)_webMailDelegate
{
  return self->_private->WebMailDelegate;
}

- (id)caretChangeListener
{
  return self->_private->_caretChangeListener;
}

- (void)setCaretChangeListener:(id)a3
{
  self->_private->_caretChangeListener = (WebCaretChangeListener *)a3;
}

- (id)caretChangeListeners
{
  return self->_private->_caretChangeListeners.m_ptr;
}

- (void)addCaretChangeListener:(id)a3
{
  if (!self->_private->_caretChangeListeners.m_ptr)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = self->_private;
    m_ptr = v6->_caretChangeListeners.m_ptr;
    v6->_caretChangeListeners.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  unsigned int v8 = self->_private->_caretChangeListeners.m_ptr;
  [v8 addObject:a3];
}

- (void)removeCaretChangeListener:(id)a3
{
}

- (void)removeAllCaretChangeListeners
{
}

- (void)caretChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(WebCaretChangeListener *)self->_private->_caretChangeListener caretChanged];
  uint64_t v3 = (void *)[self->_private->_caretChangeListeners.m_ptr copy];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) caretChanged];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)_clearDelegates
{
  [(WebView *)self _setFormDelegate:0];
  [(WebView *)self _setUIKitDelegate:0];
  [(WebView *)self setCaretChangeListener:0];
  [(WebView *)self removeAllCaretChangeListeners];
  [(WebView *)self setWebMailDelegate:0];
  [(WebView *)self setDownloadDelegate:0];
  [(WebView *)self setEditingDelegate:0];
  [(WebView *)self setFrameLoadDelegate:0];
  [(WebView *)self setPolicyDelegate:0];
  [(WebView *)self setResourceLoadDelegate:0];
  [(WebView *)self setScriptDebugDelegate:0];
  [(WebView *)self setUIDelegate:0];
}

- (id)_displayURL
{
  WebThreadLock();
  uint64_t v3 = [(WebView *)self mainFrame];
  uint64_t v4 = [(WebFrame *)v3 provisionalDataSource];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(WebDataSource *)v4 unreachableURL];
    if (v6)
    {
LABEL_3:
      CFRetain(v6);
      CFRetain(v6);
      long long v7 = v6;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = [(WebFrame *)v3 dataSource];
    uint64_t v6 = [(WebDataSource *)v5 unreachableURL];
    if (v6) {
      goto LABEL_3;
    }
  }
  long long v8 = [(NSMutableURLRequest *)[(WebDataSource *)v5 request] URL];
  long long v7 = v8;
  if (v8) {
    CFRetain(v8);
  }
LABEL_7:
  CFTypeRef v9 = (id)CFMakeCollectable(v7);
  if (v6) {
    CFRelease(v6);
  }
  return (id)v9;
}

- (void)_setUseFastImageScalingMode:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr && WebCore::Page::inLowQualityImageInterpolationMode((WebCore::Page *)m_ptr) != a3)
  {
    WebCore::Page::setInLowQualityImageInterpolationMode((WebCore::Page *)self->_private->page.m_ptr);
    [(WebView *)self setNeedsDisplay:1];
  }
}

- (BOOL)_inFastImageScalingMode
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    LOBYTE(m_ptr) = WebCore::Page::inLowQualityImageInterpolationMode((WebCore::Page *)m_ptr);
  }
  return (char)m_ptr;
}

- (BOOL)_cookieEnabled
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    return (*(unsigned __int8 *)(*((void *)m_ptr + 14) + 672) >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_setCookieEnabled:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 14);
    uint64_t v5 = 2;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFFDLL | v5;
  }
}

- (BOOL)_locked_plugInsAreRunningInFrame:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v6, "_pluginController"), "plugInsAreRunning") & 1) != 0)
    {
      return 1;
    }
  }
  long long v8 = (void *)[a3 childFrames];
  uint64_t v9 = [v8 count];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = v9 - 1;
  do
  {
    BOOL result = -[WebView _locked_plugInsAreRunningInFrame:](self, "_locked_plugInsAreRunningInFrame:", [v8 objectAtIndex:v10]);
    if (result) {
      break;
    }
  }
  while (v11 != v10++);
  return result;
}

- (BOOL)_pluginsAreRunning
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  return [(WebView *)self _locked_plugInsAreRunningInFrame:v3];
}

- (void)_locked_recursivelyPerformPlugInSelector:(SEL)a3 inFrame:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
  if (v7)
  {
    long long v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend((id)objc_msgSend(v8, "_pluginController"), "performSelector:", a3);
    }
  }
  uint64_t v9 = (void *)[a4 childFrames];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
      -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", a3, [v9 objectAtIndex:i]);
  }
}

- (void)_destroyAllPlugIns
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  [(WebView *)self _locked_recursivelyPerformPlugInSelector:sel_destroyAllPlugins inFrame:v3];
}

- (void)_startAllPlugIns
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  [(WebView *)self _locked_recursivelyPerformPlugInSelector:sel_startAllPlugins inFrame:v3];
}

- (void)_stopAllPlugIns
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  [(WebView *)self _locked_recursivelyPerformPlugInSelector:sel_stopAllPlugins inFrame:v3];
}

- (void)_stopAllPlugInsForPageCache
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  [(WebView *)self _locked_recursivelyPerformPlugInSelector:sel_stopPluginsForPageCache inFrame:v3];
}

- (void)_restorePlugInsFromCache
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self mainFrame];
  [(WebView *)self _locked_recursivelyPerformPlugInSelector:sel_restorePluginsFromCache inFrame:v3];
}

- (BOOL)_setMediaLayer:(id)a3 forPluginView:(id)a4
{
  WebThreadLock();
  uint64_t v7 = [(WebView *)self _mainCoreFrame];
  if (v7)
  {
    long long v8 = v7;
    uint64_t v9 = v7;
    while (1)
    {
      uint64_t v10 = (WebCore::LocalFrameView *)*((void *)v9 + 36);
      if (v10)
      {
        uint64_t v11 = WebCore::LocalFrameView::graphicsLayerForPlatformWidget(v10, (WAKView *)a4);
        if (v11)
        {
          uint64_t v12 = v11;
          if ((id)(*(uint64_t (**)(uint64_t))(*(void *)v11 + 496))(v11) != a3) {
            break;
          }
        }
      }
      uint64_t v7 = (unsigned char *)WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v9 + 48), 0);
      if (!v7) {
        return (char)v7;
      }
      uint64_t v9 = v7;
      if (v7[144])
      {
        LOBYTE(v7) = 0;
        return (char)v7;
      }
    }
    (*(void (**)(uint64_t, id, uint64_t))(*(void *)v12 + 512))(v12, a3, 2);
    uint64_t v13 = (WebCore::LocalFrameView *)*((void *)v8 + 36);
    if (v13) {
      WebCore::LocalFrameView::flushCompositingStateIncludingSubframes(v13);
    }
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (void)_setNeedsUnrestrictedGetMatchedCSSRules:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 14);
    uint64_t v5 = 128;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFF7FLL | v5;
  }
}

- (void)_attachScriptDebuggerToAllFrames
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    do
    {
      if (!*(unsigned char *)(v3 + 144))
      {
        uint64_t v5 = *(void **)(*(void *)(v3 + 280) + 16);
        if ((*(uint64_t (**)(void *))(*v5 + 1072))(v5)) {
          uint64_t v4 = 0;
        }
        else {
          uint64_t v4 = (void *)v5[2];
        }
        [v4 _attachScriptDebugger];
      }
      uint64_t v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), 0);
    }
    while (v3);
  }
}

- (void)_detachScriptDebuggerFromAllFrames
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    do
    {
      if (!*(unsigned char *)(v3 + 144))
      {
        uint64_t v5 = *(void **)(*(void *)(v3 + 280) + 16);
        if ((*(uint64_t (**)(void *))(*v5 + 1072))(v5)) {
          uint64_t v4 = 0;
        }
        else {
          uint64_t v4 = (void *)v5[2];
        }
        [v4 _detachScriptDebugger];
      }
      uint64_t v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), 0);
    }
    while (v3);
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  if (a3 && !CFEqual(self->_private->backgroundColor.m_ptr, a3))
  {
    uint64_t v5 = self->_private;
    CFRetain(a3);
    m_ptr = v5->backgroundColor.m_ptr;
    v5->backgroundColor.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v7 = [(WebView *)self mainFrame];
    [(WebFrame *)v7 _updateBackgroundAndUpdatesWhileOffscreen];
  }
}

- (CGColor)backgroundColor
{
  return (CGColor *)self->_private->backgroundColor.m_ptr;
}

- (BOOL)defersCallbacks
{
  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((unsigned char *)m_ptr + 339) != 0;
}

- (void)setDefersCallbacks:(BOOL)a3
{
  if (self->_private->page.m_ptr) {
    MEMORY[0x1F41725F0]();
  }
}

- (id)quickLookContentForURL:(id)a3
{
  return 0;
}

- (BOOL)_isStopping
{
  return self->_private->isStopping;
}

- (BOOL)_isClosing
{
  return self->_private->closing;
}

- (void)_setDeviceOrientation:(unint64_t)a3
{
  self->_private->deviceOrientation = a3;
}

- (unint64_t)_deviceOrientation
{
  return self->_private->deviceOrientation;
}

+ (id)_productivityDocumentMIMETypes
{
  SupportedMIMETypesSet = (void *)WebCore::QLPreviewGetSupportedMIMETypesSet((WebCore *)a1);
  return (id)[SupportedMIMETypesSet allObjects];
}

- (void)_setAllowsMessaging:(BOOL)a3
{
  self->_private->allowsMessaging = a3;
}

- (BOOL)_allowsMessaging
{
  return self->_private->allowsMessaging;
}

- (void)_setFixedLayoutSize:(CGSize)a3
{
  CGSize v7 = a3;
  self->_private->fixedLayoutSize = a3;
  uint64_t v4 = [(WebView *)self mainFrame];
  if (v4)
  {
    m_ptr = v4->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      WebCore::IntSize::IntSize((WebCore::IntSize *)&v6, &v7);
      WebCore::ScrollView::setFixedLayoutSize();
      WebCore::ScrollView::setUseFixedLayout(*((WebCore::ScrollView **)m_ptr + 36));
      [(WebView *)self setNeedsDisplay:1];
    }
  }
}

- (CGSize)_fixedLayoutSize
{
  uint64_t v2 = self->_private;
  double width = v2->fixedLayoutSize.width;
  double height = v2->fixedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_synchronizeCustomFixedPositionLayoutRect
{
  char v3 = 0;
  p_pendingFixedPositionLayoutRectMutedouble x = &self->_private->pendingFixedPositionLayoutRectMutex;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v3, 1u, memory_order_acquire, memory_order_acquire);
  if (v3) {
    MEMORY[0x1E4E44220](p_pendingFixedPositionLayoutRectMutex, a2);
  }
  if (CGRectIsNull(self->_private->pendingFixedPositionLayoutRect))
  {
    int v6 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v6, 0, memory_order_release, memory_order_relaxed);
    if (v6 != 1)
    {
      WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
    }
  }
  else
  {
    uint64_t v11 = WebCore::enclosingIntRect((WebCore *)&self->_private->pendingFixedPositionLayoutRect, v5);
    uint64_t v12 = v7;
    p_pendingFixedPositionLayoutRect = &self->_private->pendingFixedPositionLayoutRect;
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    p_pendingFixedPositionLayoutRect->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    p_pendingFixedPositionLayoutRect->size = v9;
    LODWORD(p_pendingFixedPositionLayoutRect) = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&p_pendingFixedPositionLayoutRect, 0, memory_order_release, memory_order_relaxed);
    if (p_pendingFixedPositionLayoutRect == 1)
    {
      uint64_t v10 = [(WebView *)self mainFrame];
      if (!v10) {
        return;
      }
    }
    else
    {
      WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
      uint64_t v10 = [(WebView *)self mainFrame];
      if (!v10) {
        return;
      }
    }
    if (v10->_private->coreFrame.m_ptr) {
      WebCore::LocalFrameView::setCustomFixedPositionLayoutRect();
    }
  }
}

- (void)_setCustomFixedPositionLayoutRectInWebThread:(CGRect)a3 synchronize:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v10 = 0;
  p_pendingFixedPositionLayoutRectMuteCGFloat x = &self->_private->pendingFixedPositionLayoutRectMutex;
  int v12 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v10, 1u, memory_order_acquire, memory_order_acquire);
  if (v10) {
    MEMORY[0x1E4E44220](p_pendingFixedPositionLayoutRectMutex, a2);
  }
  uint64_t v13 = self->_private;
  v13->pendingFixedPositionLayoutRect.origin.CGFloat x = x;
  v13->pendingFixedPositionLayoutRect.origin.CGFloat y = y;
  v13->pendingFixedPositionLayoutRect.size.CGFloat width = width;
  v13->pendingFixedPositionLayoutRect.size.CGFloat height = height;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v12, 0, memory_order_release, memory_order_relaxed);
  if (v12 == 1)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
    if (!v4) {
      return;
    }
  }
  WebThreadRun();
}

uint64_t __80__WebView_WebPrivate___setCustomFixedPositionLayoutRectInWebThread_synchronize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeCustomFixedPositionLayoutRect];
}

- (void)_setCustomFixedPositionLayoutRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v8 = 0;
  p_pendingFixedPositionLayoutRectMuteCGFloat x = &self->_private->pendingFixedPositionLayoutRectMutex;
  int v10 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v8, 1u, memory_order_acquire, memory_order_acquire);
  if (v8) {
    MEMORY[0x1E4E44220](p_pendingFixedPositionLayoutRectMutex, a2);
  }
  uint64_t v11 = self->_private;
  v11->pendingFixedPositionLayoutRect.origin.CGFloat x = x;
  v11->pendingFixedPositionLayoutRect.origin.CGFloat y = y;
  v11->pendingFixedPositionLayoutRect.size.CGFloat width = width;
  v11->pendingFixedPositionLayoutRect.size.CGFloat height = height;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v10, 0, memory_order_release, memory_order_relaxed);
  if (v10 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
  }
  [(WebView *)self _synchronizeCustomFixedPositionLayoutRect];
}

- (BOOL)_fetchCustomFixedPositionLayoutRect:(CGRect *)a3
{
  char v5 = 0;
  p_pendingFixedPositionLayoutRectMuteCGFloat x = &self->_private->pendingFixedPositionLayoutRectMutex;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v5, 1u, memory_order_acquire, memory_order_acquire);
  if (v5) {
    MEMORY[0x1E4E44220](p_pendingFixedPositionLayoutRectMutex, a2);
  }
  BOOL IsNull = CGRectIsNull(self->_private->pendingFixedPositionLayoutRect);
  BOOL v8 = IsNull;
  if (IsNull)
  {
    int v9 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&v9, 0, memory_order_release, memory_order_relaxed);
    if (v9 == 1) {
      return !IsNull;
    }
  }
  else
  {
    CGSize size = self->_private->pendingFixedPositionLayoutRect.size;
    a3->origin = self->_private->pendingFixedPositionLayoutRect.origin;
    a3->CGSize size = size;
    p_pendingFixedPositionLayoutRect = &self->_private->pendingFixedPositionLayoutRect;
    CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    p_pendingFixedPositionLayoutRect->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    p_pendingFixedPositionLayoutRect->CGSize size = v13;
    LODWORD(p_pendingFixedPositionLayoutRect) = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_pendingFixedPositionLayoutRectMutex, (unsigned __int8 *)&p_pendingFixedPositionLayoutRect, 0, memory_order_release, memory_order_relaxed);
    if (p_pendingFixedPositionLayoutRect == 1) {
      return !IsNull;
    }
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
  return !v8;
}

- (void)_viewGeometryDidChange
{
  if ([(WebView *)self _mainCoreFrame])
  {
    MEMORY[0x1F416C198]();
  }
}

- (void)_overflowScrollPositionChangedTo:(CGPoint)a3 forNode:(id)a4 isUserScroll:(BOOL)a5
{
  CGPoint v16 = a3;
  uint64_t v5 = *((void *)a4 + 2);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 544);
  if (v6)
  {
    uint64_t v7 = *(WebCore::LocalFrame **)(v6 + 8);
    if (v7)
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, &v16);
      float v8 = roundf(v14[0]);
      uint64_t v9 = 0x7FFFFFFFLL;
      uint64_t v10 = (int)v8;
      if (v8 <= -2147500000.0) {
        uint64_t v10 = 0x80000000;
      }
      if (v8 < 2147500000.0) {
        uint64_t v9 = v10;
      }
      float v11 = roundf(v14[1]);
      uint64_t v12 = 0x7FFFFFFF00000000;
      unint64_t v13 = 0x8000000000000000;
      if (v11 > -2147500000.0) {
        unint64_t v13 = (unint64_t)(int)v11 << 32;
      }
      if (v11 < 2147500000.0) {
        uint64_t v12 = v13;
      }
      IntPoint v15 = (IntPoint)(v12 | v9);
      WebCore::LocalFrame::overflowScrollPositionChangedForNode(v7, &v15, (Node *)v5);
    }
  }
}

+ (void)_doNotStartObservingNetworkReachability
{
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared((WebCore::DeprecatedGlobalSettings *)a1) + 16) = 1;
}

- (id)_touchEventRegions
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (v2 && v2[37]) {
    WebCore::Document::getTouchRects();
  }
  return 0;
}

- (BOOL)usesPageCache
{
  if (!self->_private->usesPageCache) {
    return 0;
  }
  uint64_t v2 = [(WebView *)self preferences];
  return [(WebPreferences *)v2 usesPageCache];
}

- (void)setUsesPageCache:(BOOL)a3
{
  self->_private->usesPageCache = a3;
  [(WebView *)self _preferencesChanged:[(WebView *)self preferences]];
  BOOL v4 = [(WebView *)self preferences];
  [(WebPreferences *)v4 _postPreferencesChangedAPINotification];
}

- (id)textIteratorForRect:(CGRect)a3
{
  CGRect v22 = a3;
  BOOL v4 = [(WebView *)self _mainCoreFrame];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = WebCore::enclosingIntRect((WebCore *)&v22, v3);
  uint64_t v7 = v6;
  uint64_t v16 = v5;
  WebCore::LocalFrame::visiblePositionForPoint((uint64_t *)&v17, (WebCore::LocalFrame *)v4, (const WebCore::IntPoint *)&v16);
  unint64_t v14 = ((v7 & 0xFFFFFFFF00000000) + v5) & 0xFFFFFFFF00000000 | (v7 + v5);
  WebCore::LocalFrame::visiblePositionForPoint((uint64_t *)&v15, (WebCore::LocalFrame *)v4, (const WebCore::IntPoint *)&v14);
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v18, &v17, &v15);
  WebCore::VisibleSelection::toNormalizedRange(&v19, (WebCore::VisibleSelection *)v18);
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v18);
  var0 = v15.var0.var0.var0;
  v15.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  uint64_t v9 = v17.var0.var0.var0;
  v17.var0.var0.var0 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 7) == 2)
    {
      if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v9);
      }
    }
    else
    {
      *((_DWORD *)v9 + 7) -= 2;
    }
  }
  uint64_t v10 = [[WebTextIterator alloc] initWithRange:kit()];
  BOOL v4 = (id)CFMakeCollectable(v10);
  if (!v21) {
    return v4;
  }
  uint64_t v11 = v20;
  uint64_t v20 = 0;
  if (v11)
  {
    if (*(_DWORD *)(v11 + 28) == 2)
    {
      if ((*(_WORD *)(v11 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v11);
      }
    }
    else
    {
      *(_DWORD *)(v11 + 28) -= 2;
    }
  }
  uint64_t v12 = v19;
  uint64_t v19 = 0;
  if (!v12) {
    return v4;
  }
  if (*(_DWORD *)(v12 + 28) != 2)
  {
    *(_DWORD *)(v12 + 28) -= 2;
    return v4;
  }
  if ((*(_WORD *)(v12 + 34) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)v12);
  return v4;
}

- (void)_executeCoreCommandByName:(id)a3 value:(id)a4
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    uint64_t v7 = WebCore::FocusController::focusedOrMainFrame(*((WebCore::FocusController **)m_ptr + 9));
    if (!v7) {
      goto LABEL_21;
    }
    float v8 = (atomic_uint *)(v7 + 8);
    atomic_fetch_add((atomic_uint *volatile)(v7 + 8), 1u);
    uint64_t v9 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
    MEMORY[0x1E4E442D0](&v23, a3);
    WebCore::Editor::command((uint64_t *)&v24, v9, (const WTF::String *)&v23);
    MEMORY[0x1E4E442D0](&v27, a4);
    WebCore::Editor::Command::execute();
    uint64_t v11 = v27;
    uint64_t v27 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v10);
        uint64_t v12 = v26;
        uint64_t v26 = 0;
        if (!v12) {
          goto LABEL_10;
        }
LABEL_9:
        unint64_t v13 = (unsigned int *)(v12 + 8);
        if (atomic_fetch_add((atomic_uint *volatile)(v12 + 8), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v13);
          char v21 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
          *(void *)char v21 = &unk_1F3C797F0;
          *((void *)v21 + 1) = v13;
          uint64_t v27 = v21;
          WTF::ensureOnMainThread();
          CGRect v22 = v27;
          uint64_t v27 = 0;
          if (v22) {
            (*(void (**)(WTF::StringImpl *))(*(void *)v22 + 8))(v22);
          }
        }
LABEL_10:
        unint64_t v14 = v25;
        uint64_t v25 = 0;
        if (v14)
        {
          if (*((_DWORD *)v14 + 7) == 2)
          {
            if ((*((_WORD *)v14 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v14);
            }
          }
          else
          {
            *((_DWORD *)v14 + 7) -= 2;
          }
        }
        VisiblePosition v15 = v23;
        uint64_t v23 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2)
          {
            WTF::StringImpl::destroy(v15, v10);
            unsigned int add = atomic_fetch_add(v8, 0xFFFFFFFF);
            if (add == 1) {
              goto LABEL_25;
            }
            goto LABEL_21;
          }
          *(_DWORD *)v15 -= 2;
        }
        unsigned int add = atomic_fetch_add(v8, 0xFFFFFFFF);
        if (add == 1)
        {
LABEL_25:
          atomic_store(add, (unsigned int *)v8);
          uint64_t v19 = (void *)WTF::fastMalloc((WTF *)0x10);
          void *v19 = &unk_1F3C797F0;
          v19[1] = v8;
          uint64_t v24 = v19;
          WTF::ensureOnMainThread();
          uint64_t v20 = (uint64_t)v24;
          uint64_t v24 = 0;
          if (v20) {
            (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          }
        }
LABEL_21:
        if (*(_DWORD *)m_ptr == 1)
        {
          VisiblePosition v17 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
          WTF::fastFree(v17, v18);
        }
        else
        {
          --*(_DWORD *)m_ptr;
        }
        return;
      }
      *(_DWORD *)v11 -= 2;
    }
    uint64_t v12 = v26;
    uint64_t v26 = 0;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
}

- (void)_clearMainFrameName
{
  uint64_t v2 = *((void *)self->_private->page.m_ptr + 20);
  if (v2) {
    BOOL v3 = *(unsigned char *)(v2 + 144) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    MEMORY[0x1F41737E0](v2 + 48, a2);
  }
}

- (void)setSelectTrailingWhitespaceEnabled:(BOOL)a3
{
  BOOL v3 = (void *)*((void *)self->_private->page.m_ptr + 14);
  unint64_t v4 = v3[87];
  if (((v4 >> 23) & 1) != a3)
  {
    uint64_t v5 = v3 + 83;
    uint64_t v6 = v3[90];
    uint64_t v7 = v3[89];
    uint64_t v8 = v3[88];
    uint64_t v9 = v3[86];
    uint64_t v10 = v3[85];
    uint64_t v11 = v3[84];
    uint64_t v12 = v3[83];
    uint64_t v13 = 0x800000;
    if (!a3) {
      uint64_t v13 = 0;
    }
    void *v5 = v12;
    v5[1] = v11;
    v5[2] = v10;
    v5[3] = v9;
    v5[4] = v4 & 0xFFFFFFFFFF7FFFFFLL | v13;
    v5[5] = v8;
    v5[6] = v7;
    v5[7] = v6;
    [(WebView *)self setSmartInsertDeleteEnabled:!a3];
  }
}

- (BOOL)isSelectTrailingWhitespaceEnabled
{
  return *(unsigned __int8 *)(*((void *)self->_private->page.m_ptr + 14) + 698) >> 7;
}

- (void)setMemoryCacheDelegateCallsEnabled:(BOOL)a3
{
}

- (BOOL)areMemoryCacheDelegateCallsEnabled
{
  return *((unsigned char *)self->_private->page.m_ptr + 345);
}

- (BOOL)_postsAcceleratedCompositingNotifications
{
  return self->_private->postsAcceleratedCompositingNotifications;
}

- (void)_setPostsAcceleratedCompositingNotifications:(BOOL)a3
{
  self->_private->postsAcceleratedCompositingNotifications = a3;
}

- (BOOL)_isUsingAcceleratedCompositing
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (v2)
  {
    BOOL v3 = v2;
    unint64_t v4 = v2;
    while (1)
    {
      if (!*((unsigned char *)v4 + 144))
      {
        uint64_t v5 = *(void **)(*((void *)v4 + 35) + 16);
        uint64_t v6 = ((*(uint64_t (**)(void *))(*v5 + 1072))(v5) & 1) != 0 ? 0 : (void *)v5[2];
        uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 _isUsingAcceleratedCompositing]) {
          break;
        }
      }
      uint64_t v2 = (const WebCore::Frame *)WebCore::FrameTree::traverseNext((const WebCore::Frame *)((char *)v4 + 48), v3);
      unint64_t v4 = v2;
      if (!v2) {
        return (char)v2;
      }
    }
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

- (void)_setBaseCTM:(CGAffineTransform *)a3 forContext:(CGContext *)a4
{
}

- (BOOL)interactiveFormValidationEnabled
{
  return self->_private->interactiveFormValidationEnabled;
}

- (void)setInteractiveFormValidationEnabled:(BOOL)a3
{
  self->_private->interactiveFormValidationEnabled = a3;
}

- (int)validationMessageTimerMagnification
{
  return self->_private->validationMessageTimerMagnification;
}

- (void)setValidationMessageTimerMagnification:(int)a3
{
  self->_private->validationMessageTimerMagnification = a3;
}

- (id)_contentsOfUserInterfaceItem:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (![a3 isEqualToString:@"validationBubble"]) {
    return 0;
  }
  m_ptr = self->_private->formValidationBubble.m_ptr;
  uint64_t v6 = (WTF::StringImpl **)((char *)m_ptr + 16);
  if (!m_ptr) {
    uint64_t v6 = (WTF::StringImpl **)MEMORY[0x1E4F30980];
  }
  uint64_t v7 = *v6;
  if (*v6) {
    *(_DWORD *)v7 += 2;
  }
  if (m_ptr)
  {
    double v8 = *((double *)m_ptr + 3);
    id v15 = a3;
    v13[0] = @"message";
    if (v7)
    {
LABEL_8:
      uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
      goto LABEL_12;
    }
  }
  else
  {
    double v8 = 0.0;
    id v15 = a3;
    v13[0] = @"message";
    if (v7) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = &stru_1F3C7DA90;
LABEL_12:
  v13[1] = @"fontSize";
  v14[0] = v9;
  v14[1] = [NSNumber numberWithDouble:v8];
  v16[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v11);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v10;
}

- (void)_setTopContentInsetForTesting:(float)a3
{
  BOOL v3 = self->_private;
  if (v3)
  {
    m_ptr = v3->page.m_ptr;
    if (m_ptr) {
      MEMORY[0x1F4172648](m_ptr, a2, a3);
    }
  }
}

- (BOOL)_isSoftwareRenderable
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (v2)
  {
    BOOL v3 = v2;
    uint64_t v4 = (uint64_t)v2;
    while (1)
    {
      if (!*(unsigned char *)(v4 + 144))
      {
        uint64_t v5 = *(WebCore::LocalFrameView **)(v4 + 288);
        if (v5)
        {
          int isSoftwareRenderable = WebCore::LocalFrameView::isSoftwareRenderable(v5);
          if (!isSoftwareRenderable) {
            break;
          }
        }
      }
      uint64_t v4 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v4 + 48), v3);
      if (!v4) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    LOBYTE(isSoftwareRenderable) = 1;
  }
  return isSoftwareRenderable;
}

- (void)setTracksRepaints:(BOOL)a3
{
  if (*(void *)([(WebView *)self _mainCoreFrame] + 288))
  {
    MEMORY[0x1F416DA70]();
  }
}

- (BOOL)isTrackingRepaints
{
  uint64_t v2 = *(void *)([(WebView *)self _mainCoreFrame] + 288);
  return v2 && v2 != 0 && *(unsigned char *)(v2 + 1400) != 0;
}

- (void)resetTrackedRepaints
{
  if (*(void *)([(WebView *)self _mainCoreFrame] + 288))
  {
    MEMORY[0x1F416DAA8]();
  }
}

- (id)trackedRepaintRects
{
  uint64_t v2 = *(void *)([(WebView *)self _mainCoreFrame] + 288);
  if (!v2 || !*(unsigned char *)(v2 + 1400)) {
    return 0;
  }
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v2 + 1068)];
  uint64_t v4 = *(unsigned int *)(v2 + 1068);
  if (v4)
  {
    uint64_t v5 = *(const FloatRect **)(v2 + 1056);
    uint64_t v6 = 16 * v4;
    do
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F29238];
      WebCore::LayoutRect::LayoutRect((WebCore::LayoutRect *)&v23, v5);
      unsigned int v9 = v23 - (v8 & 0xFFFFFFC0);
      int v10 = (int)(v9 + 32) >> 6;
      unsigned int v12 = v24 - (v11 & 0xFFFFFFC0);
      int v13 = (int)(v12 + 32) >> 6;
      unint64_t v14 = (v10 + v23 / 64) | ((unint64_t)(v13 + v24 / 64) << 32);
      BOOL v15 = __OFADD__(v9, v25);
      int v16 = v9 + v25;
      int v17 = (v9 >> 31) + 0x7FFFFFFF;
      if (!v15) {
        int v17 = v16;
      }
      uint64_t v18 = (v17 / 64 - v10 + ((int)(v17 - (v16 & 0xFFFFFFC0) + 32) >> 6));
      BOOL v15 = __OFADD__(v12, v26);
      int v19 = v12 + v26;
      int v20 = (v12 >> 31) + 0x7FFFFFFF;
      if (!v15) {
        int v20 = v19;
      }
      unint64_t v27 = v14;
      unint64_t v28 = v18 | ((unint64_t)(v20 / 64 - v13 + ((int)(v20 - (v19 & 0xFFFFFFC0) + 32) >> 6)) << 32);
      WebCore::IntRect::operator CGRect();
      uint64_t v21 = objc_msgSend(v7, "valueWithRect:");
      if (v21) {
        [v3 addObject:v21];
      }
      ++v5;
      v6 -= 16;
    }
    while (v6);
  }
  return (id)(id)CFMakeCollectable(v3);
}

+ (void)_addOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6
{
  BOOL v6 = a6;
  MEMORY[0x1E4E442D0](&v21, a3);
  WebCore::SecurityOrigin::createFromString((uint64_t *)&v22, (WebCore::SecurityOrigin *)&v21, v9);
  int v10 = v22;
  MEMORY[0x1E4E442D0](&v20, a4);
  MEMORY[0x1E4E442D0](&v19, a5);
  WebCore::SecurityPolicy::addOriginAccessAllowlistEntry(v10, (const WebCore::SecurityOrigin *)&v20, (const WTF::String *)&v19, (const WTF::String *)v6);
  unsigned int v12 = v19;
  int v19 = 0;
  if (!v12)
  {
LABEL_4:
    int v13 = v20;
    int v20 = 0;
    if (!v13) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v11);
  int v13 = v20;
  int v20 = 0;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_7:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v11);
    unint64_t v14 = v22;
    CGRect v22 = 0;
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *(_DWORD *)v13 -= 2;
LABEL_9:
  unint64_t v14 = v22;
  CGRect v22 = 0;
  if (!v14)
  {
LABEL_13:
    BOOL v15 = v21;
    uint64_t v21 = 0;
    if (!v15) {
      return;
    }
    goto LABEL_14;
  }
LABEL_12:
  if (atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) != 1) {
    goto LABEL_13;
  }
  atomic_store(1u, (unsigned int *)v14);
  int v16 = (WTF::StringImpl *)*((void *)v14 + 6);
  *((void *)v14 + 6) = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v11);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  int v17 = (WTF::StringImpl *)*((void *)v14 + 5);
  *((void *)v14 + 5) = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v11);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = *((unsigned int *)v14 + 8);
  if (v18 != -1) {
    ((void (*)(WTF::StringImpl **, char *))off_1F3C7B3E0[v18])(&v20, (char *)v14 + 8);
  }
  *((_DWORD *)v14 + 8) = -1;
  WTF::fastFree(v14, v11);
  BOOL v15 = v21;
  uint64_t v21 = 0;
  if (v15)
  {
LABEL_14:
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v11);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
}

+ (void)_removeOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6
{
  BOOL v6 = a6;
  MEMORY[0x1E4E442D0](&v21, a3);
  WebCore::SecurityOrigin::createFromString((uint64_t *)&v22, (WebCore::SecurityOrigin *)&v21, v9);
  int v10 = v22;
  MEMORY[0x1E4E442D0](&v20, a4);
  MEMORY[0x1E4E442D0](&v19, a5);
  WebCore::SecurityPolicy::removeOriginAccessAllowlistEntry(v10, (const WebCore::SecurityOrigin *)&v20, (const WTF::String *)&v19, (const WTF::String *)v6);
  unsigned int v12 = v19;
  int v19 = 0;
  if (!v12)
  {
LABEL_4:
    int v13 = v20;
    int v20 = 0;
    if (!v13) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v11);
  int v13 = v20;
  int v20 = 0;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_7:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v11);
    unint64_t v14 = v22;
    CGRect v22 = 0;
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *(_DWORD *)v13 -= 2;
LABEL_9:
  unint64_t v14 = v22;
  CGRect v22 = 0;
  if (!v14)
  {
LABEL_13:
    BOOL v15 = v21;
    uint64_t v21 = 0;
    if (!v15) {
      return;
    }
    goto LABEL_14;
  }
LABEL_12:
  if (atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) != 1) {
    goto LABEL_13;
  }
  atomic_store(1u, (unsigned int *)v14);
  int v16 = (WTF::StringImpl *)*((void *)v14 + 6);
  *((void *)v14 + 6) = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v11);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  int v17 = (WTF::StringImpl *)*((void *)v14 + 5);
  *((void *)v14 + 5) = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v11);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = *((unsigned int *)v14 + 8);
  if (v18 != -1) {
    ((void (*)(WTF::StringImpl **, char *))off_1F3C7B3E0[v18])(&v20, (char *)v14 + 8);
  }
  *((_DWORD *)v14 + 8) = -1;
  WTF::fastFree(v14, v11);
  BOOL v15 = v21;
  uint64_t v21 = 0;
  if (v15)
  {
LABEL_14:
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v11);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
}

+ (void)_resetOriginAccessAllowLists
{
}

- (BOOL)_isViewVisible
{
  BOOL v3 = (void *)[(WebView *)self window];
  if (v3)
  {
    LODWORD(v3) = [v3 isVisible];
    if (v3) {
      LOBYTE(v3) = [(WebView *)self isHiddenOrHasHiddenAncestor] ^ 1;
    }
  }
  return (char)v3;
}

- (void)_updateVisibilityState
{
  uint64_t v2 = self->_private;
  if (v2 && v2->page.m_ptr)
  {
    BOOL v4 = [(WebView *)self _isViewVisible];
    [(WebView *)self _setIsVisible:v4];
  }
}

- (void)_updateActiveState
{
  uint64_t v2 = self->_private;
  if (v2)
  {
    m_ptr = v2->page.m_ptr;
    if (m_ptr)
    {
      uint64_t v4 = *((void *)m_ptr + 9);
      uint64_t v5 = objc_msgSend((id)-[WebView window](self, "window"), "isKeyWindow");
      MEMORY[0x1F416E0F8](v4, v5);
    }
  }
}

+ (void)_addUserScriptToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectionTime:(int)a9 injectedFrames:(int)a10
{
  MEMORY[0x1E4E442D0](&v45, a3);
  int v17 = v45;
  if (v45)
  {
    if (!*((_DWORD *)v45 + 1))
    {
      SessionID v45 = 0;
LABEL_46:
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
      return;
    }
    MEMORY[0x1E4E442D0](v46, a3);
    v40 = 0;
    WebViewGroup::getOrCreate((WebViewGroup *)v46, (const WTF::String *)&v40, &v44);
    uint64_t v18 = v46[0];
    v46[0] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
      {
        WTF::StringImpl::destroy(v18, v16);
        if (a4)
        {
LABEL_7:
          WTF::makeVector<WTF::String>(a7, (uint64_t)&v40);
          WTF::makeVector<WTF::String>(a8, (uint64_t)&v37);
          int v19 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x58);
          MEMORY[0x1E4E442D0](&v47, a5);
          MEMORY[0x1E4E441F0](v46, a6);
          MEMORY[0x1E4E44710](v19, &v47, v46, &v40, &v37, a9 != 0, a10 != 0, 0);
          uint64_t v43 = v19;
          uint64_t v21 = v46[0];
          v46[0] = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 2)
            {
              WTF::StringImpl::destroy(v21, v20);
              CGRect v22 = v47;
              v47 = 0;
              if (!v22) {
                goto LABEL_19;
              }
LABEL_17:
              if (*(_DWORD *)v22 == 2)
              {
                WTF::StringImpl::destroy(v22, v20);
                uint64_t v24 = v39;
                if (!v39)
                {
LABEL_28:
                  unint64_t v28 = v37;
                  if (v37)
                  {
                    char v37 = 0;
                    int v38 = 0;
                    WTF::fastFree(v28, v20);
                  }
                  if (v42)
                  {
                    uint64_t v29 = v40;
                    uint64_t v30 = 8 * v42;
                    do
                    {
                      uint64_t v31 = *(WTF::StringImpl **)v29;
                      *(void *)uint64_t v29 = 0;
                      if (v31)
                      {
                        if (*(_DWORD *)v31 == 2) {
                          WTF::StringImpl::destroy(v31, v20);
                        }
                        else {
                          *(_DWORD *)v31 -= 2;
                        }
                      }
                      uint64_t v29 = (WTF *)((char *)v29 + 8);
                      v30 -= 8;
                    }
                    while (v30);
                  }
                  uint64_t v32 = v40;
                  if (v40)
                  {
                    v40 = 0;
                    int v41 = 0;
                    WTF::fastFree(v32, v20);
                  }
                  int v23 = v44;
                  uint64_t v43 = 0;
                  WebCore::UserContentController::addUserScript();
                  if (v19)
                  {
                    WebCore::UserScript::~UserScript(v19, v16);
                    WTF::fastFree(v33, v34);
                  }
                  goto LABEL_41;
                }
LABEL_22:
                int v25 = v37;
                uint64_t v26 = 8 * v24;
                do
                {
                  unint64_t v27 = *(WTF::StringImpl **)v25;
                  *(void *)int v25 = 0;
                  if (v27)
                  {
                    if (*(_DWORD *)v27 == 2) {
                      WTF::StringImpl::destroy(v27, v20);
                    }
                    else {
                      *(_DWORD *)v27 -= 2;
                    }
                  }
                  int v25 = (WTF *)((char *)v25 + 8);
                  v26 -= 8;
                }
                while (v26);
                goto LABEL_28;
              }
              *(_DWORD *)v22 -= 2;
LABEL_19:
              uint64_t v24 = v39;
              if (!v39) {
                goto LABEL_28;
              }
              goto LABEL_22;
            }
            *(_DWORD *)v21 -= 2;
          }
          CGRect v22 = v47;
          v47 = 0;
          if (!v22) {
            goto LABEL_19;
          }
          goto LABEL_17;
        }
LABEL_14:
        int v23 = v44;
        if (!v44)
        {
LABEL_43:
          int v17 = v45;
          SessionID v45 = 0;
          if (!v17) {
            return;
          }
          goto LABEL_46;
        }
LABEL_41:
        if (*(_DWORD *)v23 == 1)
        {
          WebViewGroup::~WebViewGroup(v23, v16);
          WTF::fastFree(v35, v36);
          int v17 = v45;
          SessionID v45 = 0;
          if (!v17) {
            return;
          }
          goto LABEL_46;
        }
        --*(_DWORD *)v23;
        goto LABEL_43;
      }
      *(_DWORD *)v18 -= 2;
    }
    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
}

+ (void)_addUserStyleSheetToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectedFrames:(int)a9
{
  MEMORY[0x1E4E442D0](&v44, a3);
  int v16 = v44;
  if (v44)
  {
    if (!*((_DWORD *)v44 + 1))
    {
      char v44 = 0;
LABEL_46:
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
      return;
    }
    MEMORY[0x1E4E442D0](v45, a3);
    unsigned int v39 = 0;
    WebViewGroup::getOrCreate((WebViewGroup *)v45, (const WTF::String *)&v39, &v43);
    int v17 = v45[0];
    v45[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
      {
        WTF::StringImpl::destroy(v17, v15);
        if (a4)
        {
LABEL_7:
          WTF::makeVector<WTF::String>(a7, (uint64_t)&v39);
          WTF::makeVector<WTF::String>(a8, (uint64_t)&v36);
          uint64_t v18 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x68);
          MEMORY[0x1E4E442D0](&v46, a5);
          MEMORY[0x1E4E441F0](v45, a6);
          WebCore::UserStyleSheet::UserStyleSheet();
          unsigned int v42 = v18;
          int v20 = v45[0];
          v45[0] = 0;
          if (v20)
          {
            if (*(_DWORD *)v20 == 2)
            {
              WTF::StringImpl::destroy(v20, v19);
              uint64_t v21 = v46;
              uint64_t v46 = 0;
              if (!v21) {
                goto LABEL_19;
              }
LABEL_17:
              if (*(_DWORD *)v21 == 2)
              {
                WTF::StringImpl::destroy(v21, v19);
                uint64_t v23 = v38;
                if (!v38)
                {
LABEL_28:
                  unint64_t v27 = v36;
                  if (v36)
                  {
                    uint64_t v36 = 0;
                    int v37 = 0;
                    WTF::fastFree(v27, v19);
                  }
                  if (v41)
                  {
                    unint64_t v28 = v39;
                    uint64_t v29 = 8 * v41;
                    do
                    {
                      uint64_t v30 = *(WTF::StringImpl **)v28;
                      *(void *)unint64_t v28 = 0;
                      if (v30)
                      {
                        if (*(_DWORD *)v30 == 2) {
                          WTF::StringImpl::destroy(v30, v19);
                        }
                        else {
                          *(_DWORD *)v30 -= 2;
                        }
                      }
                      unint64_t v28 = (WTF *)((char *)v28 + 8);
                      v29 -= 8;
                    }
                    while (v29);
                  }
                  uint64_t v31 = v39;
                  if (v39)
                  {
                    unsigned int v39 = 0;
                    int v40 = 0;
                    WTF::fastFree(v31, v19);
                  }
                  CGRect v22 = v43;
                  unsigned int v42 = 0;
                  WebCore::UserContentController::addUserStyleSheet();
                  if (v18)
                  {
                    WebCore::UserScript::~UserScript(v18, v15);
                    WTF::fastFree(v32, v33);
                  }
                  goto LABEL_41;
                }
LABEL_22:
                uint64_t v24 = v36;
                uint64_t v25 = 8 * v23;
                do
                {
                  uint64_t v26 = *(WTF::StringImpl **)v24;
                  *(void *)uint64_t v24 = 0;
                  if (v26)
                  {
                    if (*(_DWORD *)v26 == 2) {
                      WTF::StringImpl::destroy(v26, v19);
                    }
                    else {
                      *(_DWORD *)v26 -= 2;
                    }
                  }
                  uint64_t v24 = (WTF *)((char *)v24 + 8);
                  v25 -= 8;
                }
                while (v25);
                goto LABEL_28;
              }
              *(_DWORD *)v21 -= 2;
LABEL_19:
              uint64_t v23 = v38;
              if (!v38) {
                goto LABEL_28;
              }
              goto LABEL_22;
            }
            *(_DWORD *)v20 -= 2;
          }
          uint64_t v21 = v46;
          uint64_t v46 = 0;
          if (!v21) {
            goto LABEL_19;
          }
          goto LABEL_17;
        }
LABEL_14:
        CGRect v22 = v43;
        if (!v43)
        {
LABEL_43:
          int v16 = v44;
          char v44 = 0;
          if (!v16) {
            return;
          }
          goto LABEL_46;
        }
LABEL_41:
        if (*(_DWORD *)v22 == 1)
        {
          WebViewGroup::~WebViewGroup(v22, v15);
          WTF::fastFree(v34, v35);
          int v16 = v44;
          char v44 = 0;
          if (!v16) {
            return;
          }
          goto LABEL_46;
        }
        --*(_DWORD *)v22;
        goto LABEL_43;
      }
      *(_DWORD *)v17 -= 2;
    }
    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
}

+ (void)_removeUserScriptFromGroup:(id)a3 world:(id)a4 url:(id)a5
{
  MEMORY[0x1E4E442D0](&v22, a3);
  if (v22)
  {
    if (*((_DWORD *)v22 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        int v20 = v22;
        CGRect v22 = 0;
LABEL_21:
        if (*(_DWORD *)v20 == 2) {
          WTF::StringImpl::destroy(v20, v7);
        }
        else {
          *(_DWORD *)v20 -= 2;
        }
        return;
      }
      uint64_t v9 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        unsigned int v10 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        unsigned int v11 = *((_DWORD *)v22 + 4);
        int v12 = v11 < 0x100 ? WTF::StringImpl::hashSlowCase(v22) : v11 >> 8;
        for (i = 0; ; int v12 = i + v14)
        {
          uint64_t v14 = v12 & v10;
          BOOL v15 = *(WTF **)(v9 + 16 * v14);
          if (v15 != (WTF *)-1)
          {
            if (!v15) {
              goto LABEL_20;
            }
            if (WTF::equal(v15, v22, v8)) {
              break;
            }
          }
          ++i;
        }
        if (a4)
        {
          uint64_t v16 = *(void *)(v9 + 16 * v14 + 8);
          if (v16)
          {
            int v17 = *(WebCore::UserContentController **)(v16 + 40);
            uint64_t v18 = *(WebCore::DOMWrapperWorld **)(*((void *)a4 + 1) + 8);
            MEMORY[0x1E4E441F0](v21, a5);
            WebCore::UserContentController::removeUserScript(v17, v18, (const WTF::URL *)v21);
            int v19 = v21[0];
            v21[0] = 0;
            if (v19)
            {
              if (*(_DWORD *)v19 != 2)
              {
                *(_DWORD *)v19 -= 2;
                int v20 = v22;
                CGRect v22 = 0;
                if (!v20) {
                  return;
                }
                goto LABEL_21;
              }
              WTF::StringImpl::destroy(v19, v7);
            }
          }
        }
      }
    }
LABEL_20:
    int v20 = v22;
    CGRect v22 = 0;
    if (!v20) {
      return;
    }
    goto LABEL_21;
  }
}

+ (void)_removeUserStyleSheetFromGroup:(id)a3 world:(id)a4 url:(id)a5
{
  MEMORY[0x1E4E442D0](&v22, a3);
  if (v22)
  {
    if (*((_DWORD *)v22 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        int v20 = v22;
        CGRect v22 = 0;
LABEL_21:
        if (*(_DWORD *)v20 == 2) {
          WTF::StringImpl::destroy(v20, v7);
        }
        else {
          *(_DWORD *)v20 -= 2;
        }
        return;
      }
      uint64_t v9 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        unsigned int v10 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        unsigned int v11 = *((_DWORD *)v22 + 4);
        int v12 = v11 < 0x100 ? WTF::StringImpl::hashSlowCase(v22) : v11 >> 8;
        for (i = 0; ; int v12 = i + v14)
        {
          uint64_t v14 = v12 & v10;
          BOOL v15 = *(WTF **)(v9 + 16 * v14);
          if (v15 != (WTF *)-1)
          {
            if (!v15) {
              goto LABEL_20;
            }
            if (WTF::equal(v15, v22, v8)) {
              break;
            }
          }
          ++i;
        }
        if (a4)
        {
          uint64_t v16 = *(void *)(v9 + 16 * v14 + 8);
          if (v16)
          {
            int v17 = *(WebCore::UserContentController **)(v16 + 40);
            uint64_t v18 = *(WebCore::DOMWrapperWorld **)(*((void *)a4 + 1) + 8);
            MEMORY[0x1E4E441F0](v21, a5);
            WebCore::UserContentController::removeUserStyleSheet(v17, v18, (const WTF::URL *)v21);
            int v19 = v21[0];
            v21[0] = 0;
            if (v19)
            {
              if (*(_DWORD *)v19 != 2)
              {
                *(_DWORD *)v19 -= 2;
                int v20 = v22;
                CGRect v22 = 0;
                if (!v20) {
                  return;
                }
                goto LABEL_21;
              }
              WTF::StringImpl::destroy(v19, v7);
            }
          }
        }
      }
    }
LABEL_20:
    int v20 = v22;
    CGRect v22 = 0;
    if (!v20) {
      return;
    }
    goto LABEL_21;
  }
}

+ (void)_removeUserScriptsFromGroup:(id)a3 world:(id)a4
{
  MEMORY[0x1E4E442D0](&v16, a3);
  if (v16)
  {
    if (*((_DWORD *)v16 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        BOOL v15 = v16;
        uint64_t v16 = 0;
LABEL_17:
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v5);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
        return;
      }
      uint64_t v7 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        int v8 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        unsigned int v9 = *((_DWORD *)v16 + 4);
        if (v9 < 0x100) {
          unsigned int v10 = WTF::StringImpl::hashSlowCase(v16);
        }
        else {
          unsigned int v10 = v9 >> 8;
        }
        for (i = 0; ; unsigned int v10 = i + v12)
        {
          uint64_t v12 = v10 & v8;
          int v13 = *(WTF **)(v7 + 16 * v12);
          if (v13 != (WTF *)-1)
          {
            if (!v13) {
              goto LABEL_16;
            }
            if (WTF::equal(v13, v16, v6)) {
              break;
            }
          }
          ++i;
        }
        if (a4)
        {
          uint64_t v14 = *(void *)(v7 + 16 * v12 + 8);
          if (v14) {
            WebCore::UserContentController::removeUserScripts(*(WebCore::UserContentController **)(v14 + 40), *(WebCore::DOMWrapperWorld **)(*((void *)a4 + 1) + 8));
          }
        }
      }
    }
LABEL_16:
    BOOL v15 = v16;
    uint64_t v16 = 0;
    if (!v15) {
      return;
    }
    goto LABEL_17;
  }
}

+ (void)_removeUserStyleSheetsFromGroup:(id)a3 world:(id)a4
{
  MEMORY[0x1E4E442D0](&v16, a3);
  if (v16)
  {
    if (*((_DWORD *)v16 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        BOOL v15 = v16;
        uint64_t v16 = 0;
LABEL_17:
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v5);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
        return;
      }
      uint64_t v7 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        int v8 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        unsigned int v9 = *((_DWORD *)v16 + 4);
        if (v9 < 0x100) {
          unsigned int v10 = WTF::StringImpl::hashSlowCase(v16);
        }
        else {
          unsigned int v10 = v9 >> 8;
        }
        for (i = 0; ; unsigned int v10 = i + v12)
        {
          uint64_t v12 = v10 & v8;
          int v13 = *(WTF **)(v7 + 16 * v12);
          if (v13 != (WTF *)-1)
          {
            if (!v13) {
              goto LABEL_16;
            }
            if (WTF::equal(v13, v16, v6)) {
              break;
            }
          }
          ++i;
        }
        if (a4)
        {
          uint64_t v14 = *(void *)(v7 + 16 * v12 + 8);
          if (v14) {
            WebCore::UserContentController::removeUserStyleSheets(*(WebCore::UserContentController **)(v14 + 40), *(WebCore::DOMWrapperWorld **)(*((void *)a4 + 1) + 8));
          }
        }
      }
    }
LABEL_16:
    BOOL v15 = v16;
    uint64_t v16 = 0;
    if (!v15) {
      return;
    }
    goto LABEL_17;
  }
}

+ (void)_removeAllUserContentFromGroup:(id)a3
{
  MEMORY[0x1E4E442D0](&v14, a3);
  if (v14)
  {
    if (*((_DWORD *)v14 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        int v13 = v14;
        uint64_t v14 = 0;
LABEL_16:
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v3);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
        return;
      }
      uint64_t v5 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        int v6 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        unsigned int v7 = *((_DWORD *)v14 + 4);
        if (v7 < 0x100) {
          unsigned int v8 = WTF::StringImpl::hashSlowCase(v14);
        }
        else {
          unsigned int v8 = v7 >> 8;
        }
        for (i = 0; ; unsigned int v8 = i + v10)
        {
          uint64_t v10 = v8 & v6;
          unsigned int v11 = *(WTF **)(v5 + 16 * v10);
          if (v11 != (WTF *)-1)
          {
            if (!v11) {
              goto LABEL_15;
            }
            if (WTF::equal(v11, v14, v4)) {
              break;
            }
          }
          ++i;
        }
        uint64_t v12 = *(void *)(v5 + 16 * v10 + 8);
        if (v12) {
          WebCore::UserContentController::removeAllUserContent(*(WebCore::UserContentController **)(v12 + 40));
        }
      }
    }
LABEL_15:
    int v13 = v14;
    uint64_t v14 = 0;
    if (!v13) {
      return;
    }
    goto LABEL_16;
  }
}

- (void)_forceRepaintForTesting
{
  [(WebView *)self _updateRendering];
  [MEMORY[0x1E4F39CF8] flush];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
  [v2 synchronize];
}

+ (void)_setDomainRelaxationForbidden:(BOOL)a3 forURLScheme:(id)a4
{
  BOOL v4 = a3;
  MEMORY[0x1E4E442D0](&v8, a4);
  WebCore::LegacySchemeRegistry::setDomainRelaxationForbiddenForURLScheme((WebCore::LegacySchemeRegistry *)v4, (uint64_t)&v8, v5);
  unsigned int v7 = v8;
  unsigned int v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

+ (void)_registerURLSchemeAsSecure:(id)a3
{
  MEMORY[0x1E4E442D0](&v6, a3);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsSecure((WebCore::LegacySchemeRegistry *)&v6, v3);
  uint64_t v5 = v6;
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

+ (void)_registerURLSchemeAsAllowingDatabaseAccessInPrivateBrowsing:(id)a3
{
  MEMORY[0x1E4E442D0](&v6, a3);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsAllowingDatabaseAccessInPrivateBrowsing((WebCore::LegacySchemeRegistry *)&v6, v3);
  uint64_t v5 = v6;
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

- (void)_scaleWebView:(float)a3 atOrigin:(CGPoint)a4
{
  CGPoint v8 = a4;
  [(WebView *)self hideFormValidationMessage];
  m_ptr = self->_private->page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v7, &v8);
  WebCore::Page::setPageScaleFactor((WebCore::Page *)m_ptr, a3, &v7);
}

- (float)_viewScaleFactor
{
  return *((float *)self->_private->page.m_ptr + 89);
}

- (void)_setUseFixedLayout:(BOOL)a3
{
  BOOL v4 = [(WebView *)self _mainCoreFrame];
  if (v4 && v4[36])
  {
    WebCore::ScrollView::setUseFixedLayout(v4[36]);
    if (!a3) {
      WebCore::ScrollView::setFixedLayoutSize();
    }
  }
}

- (BOOL)_useFixedLayout
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (!v2) {
    return 0;
  }
  BOOL v3 = (WebCore::ScrollView *)v2[36];
  if (!v3) {
    return 0;
  }
  return WebCore::ScrollView::useFixedLayout(v3);
}

- (void)_setPaginationMode:(int)a3
{
  if (self)
  {
    [(WebView *)self page];
    if (v4)
    {
      switch(a3)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
          WebCore::Page::setPagination();
          break;
        default:
          return;
      }
    }
  }
}

- (int)_paginationMode
{
  if (self)
  {
    [(WebView *)self page];
    if (v4 && (unsigned int v2 = (*(unsigned char *)(v4 + 468) - 1), v2 <= 3)) {
      LODWORD(self) = v2 + 1;
    }
    else {
      LODWORD(self) = 0;
    }
  }
  return (int)self;
}

- (void)_listenForLayoutMilestones:(unint64_t)a3
{
  if (self)
  {
    [(WebView *)self page];
    if (v3)
    {
      WebCore::Page::addLayoutMilestones();
    }
  }
}

- (unint64_t)_layoutMilestones
{
  if (self)
  {
    [self page];
    if (v2) {
      return *(_WORD *)(v2 + 660) & 7;
    }
    else {
      return 0;
    }
  }
  return self;
}

- (int)_visibilityState
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    LODWORD(m_ptr) = WebCore::Page::visibilityState((WebCore::Page *)m_ptr) ^ 1;
  }
  return (int)m_ptr;
}

- (void)_setIsVisible:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    WebCore::Page::setIsVisible((WebCore::Page *)m_ptr);
  }
}

- (void)_setVisibilityState:(int)a3 isInitialState:(BOOL)a4
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::setIsVisible((WebCore::Page *)m_ptr);
    if (a3 == 2)
    {
      IntPoint v7 = self->_private->page.m_ptr;
      MEMORY[0x1F41725A0](v7);
    }
  }
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
  if (self)
  {
    [(WebView *)self page];
    uint64_t v4 = v5;
    if (v5)
    {
      uint64_t v5 = *(void *)(v5 + 468);
      int v6 = *(_DWORD *)(v4 + 476);
      BYTE1(v5) = a3;
      WebCore::Page::setPagination();
    }
  }
}

- (BOOL)_paginationBehavesLikeColumns
{
  if (self)
  {
    [(WebView *)self page];
    if (v3) {
      LOBYTE(self) = *(unsigned char *)(v3 + 469) != 0;
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (void)_setPageLength:(double)a3
{
  if (self)
  {
    [(WebView *)self page];
    if (v3) {
      WebCore::Page::setPagination();
    }
  }
}

- (double)_pageLength
{
  if (!self) {
    return 1.0;
  }
  [(WebView *)self page];
  if (!v4) {
    return 1.0;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 472);
  return (double)v2;
}

- (void)_setGapBetweenPages:(double)a3
{
  if (self)
  {
    [(WebView *)self page];
    if (v3) {
      WebCore::Page::setPagination();
    }
  }
}

- (double)_gapBetweenPages
{
  if (!self) {
    return 0.0;
  }
  [(WebView *)self page];
  if (!v4) {
    return 0.0;
  }
  LODWORD(v2) = *(_DWORD *)(v4 + 476);
  return (double)v2;
}

- (BOOL)_paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)_pageCount
{
  if (self)
  {
    [self page];
    self = (unint64_t)v2;
    if (v2) {
      return WebCore::Page::pageCount(v2);
    }
  }
  return self;
}

- (unint64_t)markAllMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6
{
  return [(WebView *)self countMatchesForText:a3 options:!a4 highlight:a5 limit:a6 markMatches:1];
}

- (unint64_t)countMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  return [(WebView *)self countMatchesForText:a3 options:!a4 highlight:a5 limit:a6 markMatches:a7];
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7
{
  uint64_t v7 = 8;
  if (a4) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 16;
  if (!a6) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v7 | v8 | !a5;
  uint64_t v10 = 32;
  if (!a7) {
    uint64_t v10 = 0;
  }
  return [(WebView *)self findString:a3 options:v9 | v10];
}

+ (void)_setLoadResourcesSerially:(BOOL)a3
{
  uint64_t v4 = (WebCore *)WebThreadLock();
  if (!WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies) {
    operator new();
  }
  uint64_t v5 = (void *)WebCore::platformStrategies(v4);
  uint64_t v6 = v5[1];
  if (!v6)
  {
    uint64_t v6 = (*(uint64_t (**)(void *))(*v5 + 16))(v5);
    v5[1] = v6;
  }
  *(unsigned char *)(v6 + 84) = a3;
}

+ (BOOL)_HTTPPipeliningEnabled
{
  return MEMORY[0x1F416E270](a1, a2);
}

+ (void)_setHTTPPipeliningEnabled:(BOOL)a3
{
}

- (void)_setPortsForUpgradingInsecureSchemeForTesting:(unsigned __int16)a3 withSecurePort:(unsigned __int16)a4
{
  if (self)
  {
    [(WebView *)self page];
    if (v4)
    {
      MEMORY[0x1F4172910]();
    }
  }
}

- (void)_didScrollDocumentInFrameView:(id)a3
{
  [(WebView *)self hideFormValidationMessage];
  id v5 = [(WebView *)self _UIDelegateForwarder];
  [v5 webView:self didScrollDocumentInFrameView:a3];
}

- (id)_fixedPositionContent
{
  unint64_t v2 = self->_private;
  if (v2) {
    return v2->_fixedPositionContent.m_ptr;
  }
  else {
    return 0;
  }
}

- (void)_documentScaleChanged
{
  id v3 = [(WebView *)self currentNodeHighlight];
  if (v3) {
    [v3 setNeedsDisplay];
  }
  m_ptr = self->_private->indicateLayer.m_ptr;
  if (m_ptr)
  {
    [m_ptr setNeedsLayout];
    id v5 = self->_private->indicateLayer.m_ptr;
    [v5 setNeedsDisplay];
  }
}

- (BOOL)_wantsTelephoneNumberParsing
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    return (*(unsigned __int8 *)(*((void *)m_ptr + 14) + 704) >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_setWantsTelephoneNumberParsing:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 14);
    uint64_t v5 = 64;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFBFLL | v5;
  }
}

- (BOOL)_webGLEnabled
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    return (*(unsigned __int8 *)(*((void *)m_ptr + 14) + 709) >> 4) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_setWebGLEnabled:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 14);
    uint64_t v5 = 0x100000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFEFFFFFFFFFFFLL | v5;
  }
}

+ (void)_setTileCacheLayerPoolCapacity:(unsigned int)a3
{
}

- (void)_setUnobscuredSafeAreaInsets:(WebEdgeInsets)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::Page::setUnobscuredSafeAreaInsets();
    if (*(_DWORD *)m_ptr == 1)
    {
      uint64_t v4 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (WebEdgeInsets)_unobscuredSafeAreaInsets
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    int v3 = (*(_DWORD *)m_ptr)++;
    double v4 = *((float *)m_ptr + 102);
    double v5 = *((float *)m_ptr + 105);
    double v6 = *((float *)m_ptr + 104);
    double v7 = *((float *)m_ptr + 103);
    if (v3)
    {
      *(_DWORD *)m_ptr = v3;
    }
    else
    {
      uint64_t v8 = (WTF *)MEMORY[0x1E4E47DB0]();
      WTF::fastFree(v8, v9);
    }
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  double v10 = v4;
  double v11 = v5;
  double v12 = v6;
  double v13 = v7;
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)_setUseSystemAppearance:(BOOL)a3
{
  int v3 = self->_private;
  if (v3)
  {
    if (v3->page.m_ptr) {
      MEMORY[0x1F4172700]();
    }
  }
}

- (BOOL)_useSystemAppearance
{
  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((unsigned char *)m_ptr + 450) != 0;
}

- (void)_setSourceApplicationAuditData:(id)a3
{
  if (self->_private->sourceApplicationAuditData.m_ptr != a3)
  {
    uint64_t v4 = [a3 copy];
    double v5 = self->_private;
    m_ptr = v5->sourceApplicationAuditData.m_ptr;
    v5->sourceApplicationAuditData.m_ptr = (void *)v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

- (NSData)_sourceApplicationAuditData
{
  return (NSData *)self->_private->sourceApplicationAuditData.m_ptr;
}

- (void)_setFontFallbackPrefersPictographs:(BOOL)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)m_ptr + 14));
  }
}

- (BOOL)shouldRequestCandidates
{
  return 0;
}

+ (void)initialize
{
  if ((byte_1EB3A96CA & 1) == 0)
  {
    byte_1EB3A96CA = 1;
    WTF::allPrivileges((WTF *)a1);
    WTF::setProcessPrivileges();
    WebCore::NetworkStorageSession::permitProcessToUseCookieAPI((WebCore::NetworkStorageSession *)1);
    int v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel__cacheModelChangedNotification_ name:WebPreferencesCacheModelChangedInternalNotification object:0];
    uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:a1 selector:sel__preferencesRemovedNotification_ name:WebPreferencesRemovedNotification[0] object:0];
    byte_1EB3A96CB = 0;
  }
}

+ (BOOL)_canShowMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  return [a1 _viewClass:0 andRepresentationClass:0 forMIMEType:a3 allowingPlugins:a4];
}

+ (BOOL)canShowMIMEType:(NSString *)MIMEType
{
  return [a1 _canShowMIMEType:MIMEType allowingPlugins:1];
}

- (BOOL)_canShowMIMEType:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return [v4 _canShowMIMEType:a3 allowingPlugins:0];
}

- (id)_pluginForMIMEType:(id)a3
{
  return 0;
}

- (id)_pluginForExtension:(id)a3
{
  return 0;
}

- (BOOL)_isMIMETypeRegisteredAsPlugin:(id)a3
{
  return 0;
}

+ (BOOL)canShowMIMETypeAsHTML:(NSString *)MIMEType
{
  if ([(NSString *)MIMEType isEqualToString:@"text/html"]) {
    return 1;
  }
  return +[WebFrameView _canShowMIMETypeAsHTML:MIMEType];
}

+ (NSArray)MIMETypesShownAsHTML
{
  id v2 = +[WebFrameView _viewTypesAllowImageTypeOmission:1];
  int v3 = (void *)[v2 keyEnumerator];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (1)
  {
    uint64_t v5 = [v3 nextObject];
    if (!v5) {
      break;
    }
    uint64_t v6 = [v2 objectForKey:v5];
    if (v6 == objc_opt_class()) {
      [v4 addObject:v5];
    }
  }
  double v7 = (void *)CFMakeCollectable(v4);
  return (NSArray *)v7;
}

+ (void)setMIMETypesShownAsHTML:(NSArray *)MIMETypes
{
  id v4 = objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "copy");
  uint64_t v5 = (void *)[v4 keyEnumerator];
  while (1)
  {
    uint64_t v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    uint64_t v7 = [v4 objectForKey:v6];
    if (v7 == objc_opt_class()) {
      +[WebView _unregisterViewClassAndRepresentationClassForMIMEType:v6];
    }
  }
  int v8 = [(NSArray *)MIMETypes count];
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = objc_opt_class();
      +[WebView registerViewClass:v11 representationClass:objc_opt_class() forMIMEType:[(NSArray *)MIMETypes objectAtIndex:v9++]];
    }
    while (v10 != v9);
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

+ (void)registerURLSchemeAsLocal:(NSString *)scheme
{
  MEMORY[0x1E4E442D0](&v6, scheme);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsLocal((WebCore::LegacySchemeRegistry *)&v6, v3);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
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

- (id)_initWithArguments:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:@"frame"];
  if (v5)
  {
    [v5 rectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F28AD8];
    double v9 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  uint64_t v14 = [a3 objectForKey:@"frameName"];
  uint64_t v15 = [a3 objectForKey:@"groupName"];
  return -[WebView initWithFrame:frameName:groupName:](self, "initWithFrame:frameName:groupName:", v14, v15, v7, v9, v11, v13);
}

- (WebView)initWithFrame:(CGRect)a3
{
  return -[WebView initWithFrame:frameName:groupName:](self, "initWithFrame:frameName:groupName:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  int v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1E4E4B3F0]();
    uint64_t v5 = self->_private;
    if (v5) {
      [(WebGeolocationProvider *)v5->_geolocationProvider stopTrackingWebView:self];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
    [(WebView *)self close];
    if ([(id)objc_opt_class() shouldIncludeInWebKitStatistics]) {
      --WebViewCount;
    }

    self->_private = 0;
    v6.receiver = self;
    v6.super_class = (Class)WebView;
    [(WebView *)&v6 dealloc];
  }
}

- (void)close
{
  [(WebView *)self _close];
  value = self->_private->renderingUpdateScheduler.__ptr_.__value_;
  if (value)
  {
    *((void *)value + 2) = 0;
    WebCore::RunLoopObserver::invalidate(*((WebCore::RunLoopObserver **)value + 3));
    WebCore::RunLoopObserver::invalidate(*((WebCore::RunLoopObserver **)value + 4));
    uint64_t v5 = self->_private;
    objc_super v6 = (WTF *)v5->renderingUpdateScheduler.__ptr_.__value_;
    v5->renderingUpdateScheduler.__ptr_.__value_ = 0;
    if (v6)
    {
      WebViewRenderingUpdateScheduler::operator delete(v6, v4);
    }
  }
}

- (void)setShouldCloseWithWindow:(BOOL)shouldCloseWithWindow
{
  self->_private->shouldCloseWithWindow = shouldCloseWithWindow;
}

- (BOOL)shouldCloseWithWindow
{
  return self->_private->shouldCloseWithWindow;
}

- (void)viewDidMoveToWindow
{
  id v2 = self->_private;
  if (v2 && !v2->closed)
  {
    uint64_t v4 = [(WebView *)self window];
    uint64_t v5 = self->_private;
    if (v4)
    {
      WebCore::Page::setCanStartMedia((WebCore::Page *)v5->page.m_ptr);
      WebCore::Page::setIsInWindow((WebCore::Page *)self->_private->page.m_ptr);
      objc_super v6 = [(WebView *)self preferences];
      uint64_t v7 = objc_msgSend((id)-[WebView window](self, "window"), "tileCache");
      if (v7)
      {
        double v8 = (WebCore::LegacyTileCache *)v7;
        [(WebPreferences *)v6 showDebugBorders];
        WebCore::LegacyTileCache::setTileBordersVisible(v8);
        [(WebPreferences *)v6 showRepaintCounter];
        WebCore::LegacyTileCache::setTilePaintCountersVisible(v8);
        *((unsigned char *)v8 + 66) = [(WebPreferences *)v6 acceleratedDrawingEnabled];
      }
    }
    else
    {
      [v5->fullscreenController.m_ptr requestHideAndExitFullscreen];
    }
    [(WebView *)self _updateActiveState];
    [(WebView *)self _updateVisibilityState];
  }
}

- (void)_wakWindowVisibilityChanged:(id)a3
{
  uint64_t v4 = [a3 object];
  if (v4 == [(WebView *)self window])
  {
    [(WebView *)self _updateVisibilityState];
  }
}

- (void)_updateScreenScaleFromWindow
{
  int v3 = (void *)[(WebView *)self window];
  if (v3)
  {
    [v3 screenScale];
    v5.n128_f32[0] = v5.n128_f64[0];
  }
  else
  {
    WebCore::screenScaleFactor(0, v4);
  }
  m_ptr = self->_private->page.m_ptr;
  MEMORY[0x1F41726A0](m_ptr, v5);
}

- (void)setPreferences:(WebPreferences *)preferences
{
  int v3 = preferences;
  if (preferences)
  {
    if (self->_private->preferences.m_ptr == preferences) {
      return;
    }
  }
  else
  {
    int v3 = +[WebPreferences standardPreferences];
    if (self->_private->preferences.m_ptr == v3) {
      return;
    }
  }
  [(WebPreferences *)v3 willAddToWebView];
  __n128 v5 = self->_private;
  m_ptr = v5->preferences.m_ptr;
  v5->preferences.m_ptr = 0;
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v7, "removeObserver:name:object:", self, WebPreferencesChangedInternalNotification[0], -[WebView preferences](self, "preferences"));
  +[WebPreferences _removeReferenceForIdentifier:](WebPreferences, "_removeReferenceForIdentifier:", [m_ptr identifier]);
  double v8 = self->_private;
  if (v3) {
    CFRetain(v3);
  }
  double v9 = v8->preferences.m_ptr;
  v8->preferences.m_ptr = v3;
  if (v9) {
    CFRelease(v9);
  }
  double v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__preferencesChangedNotification_, WebPreferencesChangedInternalNotification[0], -[WebView preferences](self, "preferences"));
  [(WebView *)self _preferencesChanged:[(WebView *)self preferences]];
  [(WebPreferences *)[(WebView *)self preferences] _postPreferencesChangedAPINotification];
  [m_ptr didRemoveFromWebView];
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (WebPreferences)preferences
{
  return (WebPreferences *)self->_private->preferences.m_ptr;
}

- (void)setPreferencesIdentifier:(NSString *)preferencesIdentifier
{
  if (!self->_private->closed
    && ([(NSString *)preferencesIdentifier isEqual:[(WebPreferences *)[(WebView *)self preferences] identifier]] & 1) == 0)
  {
    __n128 v5 = [[WebPreferences alloc] initWithIdentifier:preferencesIdentifier];
    [(WebView *)self setPreferences:v5];
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

- (NSString)preferencesIdentifier
{
  id v2 = [(WebView *)self preferences];
  return [(WebPreferences *)v2 identifier];
}

- (void)setUIDelegate:(id)UIDelegate
{
  self->_private->id UIDelegate = UIDelegate;
  [self->_private->UIDelegateForwarder.m_ptr clearTarget];
  uint64_t v4 = self->_private;
  m_ptr = v4->UIDelegateForwarder.m_ptr;
  v4->UIDelegateForwarder.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)UIDelegate
{
  return self->_private->UIDelegate;
}

- (id)_resourceLoadDelegateForwarder
{
  id v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->resourceProgressDelegateForwarder.m_ptr) {
    return self->_private->resourceProgressDelegateForwarder.m_ptr;
  }
  __n128 v5 = [[_WebSafeForwarder alloc] initWithTarget:[(WebView *)self resourceLoadDelegate] defaultTarget:+[WebDefaultResourceLoadDelegate sharedResourceLoadDelegate]];
  objc_super v6 = self->_private;
  m_ptr = v6->resourceProgressDelegateForwarder.m_ptr;
  v6->resourceProgressDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->resourceProgressDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->resourceProgressDelegateForwarder.m_ptr;
}

- (void)setResourceLoadDelegate:(id)resourceLoadDelegate
{
  [self->_private->resourceProgressDelegateForwarder.m_ptr clearTarget];
  __n128 v5 = self->_private;
  m_ptr = v5->resourceProgressDelegateForwarder.m_ptr;
  v5->resourceProgressDelegateForwarder.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_private->id resourceProgressDelegate = resourceLoadDelegate;
  [(WebView *)self _cacheResourceLoadDelegateImplementations];
}

- (id)resourceLoadDelegate
{
  return self->_private->resourceProgressDelegate;
}

- (void)setDownloadDelegate:(id)downloadDelegate
{
  self->_private->downloadDelegate = downloadDelegate;
}

- (id)downloadDelegate
{
  return self->_private->downloadDelegate;
}

- (void)setPolicyDelegate:(id)policyDelegate
{
  self->_private->policyDelegate = policyDelegate;
  [self->_private->policyDelegateForwarder.m_ptr clearTarget];
  uint64_t v4 = self->_private;
  m_ptr = v4->policyDelegateForwarder.m_ptr;
  v4->policyDelegateForwarder.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)policyDelegate
{
  return self->_private->policyDelegate;
}

- (id)_frameLoadDelegateForwarder
{
  id v2 = self->_private;
  if (v2->closing) {
    return 0;
  }
  if (v2->frameLoadDelegateForwarder.m_ptr) {
    return self->_private->frameLoadDelegateForwarder.m_ptr;
  }
  __n128 v5 = [[_WebSafeForwarder alloc] initWithTarget:[(WebView *)self frameLoadDelegate] defaultTarget:+[WebDefaultFrameLoadDelegate sharedFrameLoadDelegate]];
  objc_super v6 = self->_private;
  m_ptr = v6->frameLoadDelegateForwarder.m_ptr;
  v6->frameLoadDelegateForwarder.m_ptr = v5;
  if (!m_ptr) {
    return self->_private->frameLoadDelegateForwarder.m_ptr;
  }
  CFRelease(m_ptr);
  return self->_private->frameLoadDelegateForwarder.m_ptr;
}

- (void)setFrameLoadDelegate:(id)frameLoadDelegate
{
  [self->_private->frameLoadDelegateForwarder.m_ptr clearTarget];
  __n128 v5 = self->_private;
  m_ptr = v5->frameLoadDelegateForwarder.m_ptr;
  v5->frameLoadDelegateForwarder.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_private->id frameLoadDelegate = frameLoadDelegate;
  [(WebView *)self _cacheFrameLoadDelegateImplementations];
}

- (id)frameLoadDelegate
{
  return self->_private->frameLoadDelegate;
}

- (WebFrame)mainFrame
{
  id v2 = self->_private;
  if (v2
    && (m_ptr = v2->page.m_ptr) != 0
    && ((v4 = *((void *)m_ptr + 20)) != 0 ? (BOOL v5 = *(unsigned char *)(v4 + 144) == 0) : (BOOL v5 = 0),
        v5
     && (objc_super v6 = *(WebFrame ***)(*(void *)(v4 + 280) + 16),
         (((uint64_t (*)(WebFrame **, SEL))(*v6)[67].super.isa)(v6, a2) & 1) == 0)))
  {
    return v6[2];
  }
  else
  {
    return 0;
  }
}

- (WebFrame)selectedFrame
{
  WebEdgeInsets result = [(WebView *)self _focusedFrame];
  if (!result)
  {
    uint64_t v4 = [(WebView *)self mainFrame];
    return (WebFrame *)[(WebFrame *)v4 _findFrameWithSelection];
  }
  return result;
}

- (WebBackForwardList)backForwardList
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr && (int v3 = *(BackForwardList **)(*((void *)m_ptr + 17) + 16), *((unsigned char *)v3 + 65))) {
    return (WebBackForwardList *)kit(v3);
  }
  else {
    return 0;
  }
}

- (void)setMaintainsBackForwardList:(BOOL)flag
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *(void *)(*((void *)m_ptr + 17) + 16);
    *(unsigned char *)(v4 + 65) = flag;
    if (!flag)
    {
      int v5 = *(_DWORD *)(v4 + 60);
      BackForwardList::setCapacity(v4, 0);
      BackForwardList::setCapacity(v4, v5);
    }
  }
}

- (BOOL)goBack
{
  if (!self->_private->page.m_ptr) {
    return 0;
  }
  if ((WebThreadIsCurrent() & 1) != 0 || (WebThreadIsEnabled() & 1) == 0)
  {
    uint64_t v4 = *((void *)self->_private->page.m_ptr + 17);
    return MEMORY[0x1F416FDC8](v4);
  }
  else
  {
    WebThreadRun();
    return 1;
  }
}

uint64_t __17__WebView_goBack__block_invoke(uint64_t a1)
{
  return MEMORY[0x1F416FDC8](*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 8) + 136));
}

- (BOOL)goForward
{
  if (!self->_private->page.m_ptr) {
    return 0;
  }
  if ((WebThreadIsCurrent() & 1) != 0 || (WebThreadIsEnabled() & 1) == 0)
  {
    uint64_t v4 = *((void *)self->_private->page.m_ptr + 17);
    return MEMORY[0x1F416FDD0](v4);
  }
  else
  {
    WebThreadRun();
    return 1;
  }
}

uint64_t __20__WebView_goForward__block_invoke(uint64_t a1)
{
  return MEMORY[0x1F416FDD0](*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 8) + 136));
}

- (BOOL)goToBackForwardItem:(WebHistoryItem *)item
{
  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr) {
    return m_ptr != 0;
  }
  uint64_t v4 = *((void *)m_ptr + 20);
  if (!v4 || *(unsigned char *)(v4 + 144) != 0) {
    return m_ptr != 0;
  }
  objc_super v6 = (atomic_uint *)(v4 + 8);
  atomic_fetch_add((atomic_uint *volatile)(v4 + 8), 1u);
  WebCore::Page::goToItem();
  if (atomic_fetch_add(v6, 0xFFFFFFFF) != 1) {
    return m_ptr != 0;
  }
  atomic_store(1u, (unsigned int *)v6);
  double v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v8 = &unk_1F3C797F0;
  v8[1] = v6;
  double v9 = v8;
  WTF::ensureOnMainThread();
  if (!v9) {
    return m_ptr != 0;
  }
  (*(void (**)(void *))(*v9 + 8))(v9);
  return m_ptr != 0;
}

- (void)setTextSizeMultiplier:(float)textSizeMultiplier
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  *(float *)&double v6 = textSizeMultiplier;
  [(WebView *)self _setZoomMultiplier:v5 isTextOnly:v6];
}

- (float)textSizeMultiplier
{
  BOOL v3 = [(WebView *)self _realZoomMultiplierIsTextOnly];
  float result = 1.0;
  if (v3) {
    return self->_private->zoomMultiplier;
  }
  return result;
}

- (void)_setZoomMultiplier:(float)a3 isTextOnly:(BOOL)a4
{
  self->_private->zoomMultiplier = a3;
  self->_private->zoomsTextOnlCGFloat y = a4;
  [(WebView *)self hideFormValidationMessage];
  if ([(WebView *)self _mainCoreFrame])
  {
    if (self->_private->zoomsTextOnly)
    {
      v6.n128_u32[0] = 1.0;
      v7.n128_f32[0] = a3;
    }
    else
    {
      v7.n128_u32[0] = 1.0;
      v6.n128_f32[0] = a3;
    }
    MEMORY[0x1F416C1B8](v6, v7);
  }
}

- (float)_zoomMultiplier:(BOOL)a3
{
  int v3 = a3;
  int v5 = [(WebView *)self _realZoomMultiplierIsTextOnly];
  float result = 1.0;
  if (v5 == v3) {
    return self->_private->zoomMultiplier;
  }
  return result;
}

- (float)_realZoomMultiplier
{
  return self->_private->zoomMultiplier;
}

- (BOOL)_realZoomMultiplierIsTextOnly
{
  id v2 = self->_private;
  return v2->page.m_ptr && v2->zoomsTextOnly;
}

- (BOOL)_canZoomOut:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v5 conformsToProtocol:&unk_1F3CC3BA8])
  {
    return [(NSView *)v5 _canZoomOut];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v3];
    return (float)(v7 / 1.2) > 0.5;
  }
}

- (BOOL)_canZoomIn:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v5 conformsToProtocol:&unk_1F3CC3BA8])
  {
    return [(NSView *)v5 _canZoomIn];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v3];
    return (float)(v7 * 1.2) < 3.0;
  }
}

- (void)_zoomOut:(id)a3 isTextOnly:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v7 conformsToProtocol:&unk_1F3CC3BA8])
  {
    [(NSView *)v7 _zoomOut:a3];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v4];
    if ((float)(v8 / 1.2) > 0.5)
    {
      -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v4);
    }
  }
}

- (void)_zoomIn:(id)a3 isTextOnly:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v7 conformsToProtocol:&unk_1F3CC3BA8])
  {
    [(NSView *)v7 _zoomIn:a3];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v4];
    if ((float)(v8 * 1.2) < 3.0)
    {
      -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v4);
    }
  }
}

- (BOOL)_canResetZoom:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v5 conformsToProtocol:&unk_1F3CC3BA8])
  {
    return [(NSView *)v5 _canResetZoom];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v3];
    return v7 != 1.0;
  }
}

- (void)_resetZoom:(id)a3 isTextOnly:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  if ([(NSView *)v7 conformsToProtocol:&unk_1F3CC3BA8])
  {
    [(NSView *)v7 _resetZoom:a3];
  }
  else
  {
    [(WebView *)self _zoomMultiplier:v4];
    if (*(float *)&v8 != 1.0)
    {
      LODWORD(v8) = 1.0;
      [(WebView *)self _setZoomMultiplier:v4 isTextOnly:v8];
    }
  }
}

- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent
{
  uint64_t v4 = [(NSString *)applicationNameForUserAgent copy];
  int v5 = self->_private;
  m_ptr = v5->applicationNameForUserAgent.m_ptr;
  v5->applicationNameForUserAgent.m_ptr = (void *)v4;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (!self->_private->userAgentOverridden)
  {
    [(WebView *)self _invalidateUserAgentCache];
  }
}

- (void)_invalidateUserAgentCache
{
  BOOL v3 = self->_private;
  m_ptr = (WTF::StringImpl *)v3->userAgent.m_impl.m_ptr;
  if (m_ptr)
  {
    v3->userAgent.m_impl.m_ptr = 0;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, (StringImpl *)a2);
      if (!self->_private->page.m_ptr) {
        return;
      }
    }
    else
    {
      *(_DWORD *)m_ptr -= 2;
      if (!self->_private->page.m_ptr) {
        return;
      }
    }
    MEMORY[0x1F4172600]();
  }
}

- (NSString)applicationNameForUserAgent
{
  id v2 = self->_private;
  m_ptr = v2->applicationNameForUserAgent.m_ptr;
  if (m_ptr) {
    CFRetain(v2->applicationNameForUserAgent.m_ptr);
  }
  uint64_t v4 = (void *)CFMakeCollectable(m_ptr);
  return (NSString *)v4;
}

- (void)setCustomUserAgent:(NSString *)customUserAgent
{
  [(WebView *)self _invalidateUserAgentCache];
  MEMORY[0x1E4E442D0](&v11, customUserAgent);
  __n128 v6 = self->_private;
  float v7 = v11;
  double v11 = 0;
  m_ptr = (WTF::StringImpl *)v6->userAgent.m_impl.m_ptr;
  v6->userAgent.m_impl.m_ptr = (StringImpl *)v7;
  if (m_ptr)
  {
    int v9 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr != 2)
    {
LABEL_5:
      *(_DWORD *)m_ptr = v9;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(m_ptr, v5);
    m_ptr = v11;
    double v11 = 0;
    if (m_ptr)
    {
      int v9 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v10);
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  self->_private->userAgentOverridden = customUserAgent != 0;
}

- (NSString)customUserAgent
{
  id v2 = self->_private;
  if (!v2->userAgentOverridden) {
    return 0;
  }
  if (v2->userAgent.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return (NSString *)&stru_1F3C7DA90;
}

- (void)setMediaStyle:(NSString *)mediaStyle
{
  if (self->_private->mediaStyle.m_ptr != mediaStyle)
  {
    uint64_t v4 = [(NSString *)mediaStyle copy];
    int v5 = self->_private;
    m_ptr = v5->mediaStyle.m_ptr;
    v5->mediaStyle.m_ptr = (void *)v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

- (NSString)mediaStyle
{
  return (NSString *)self->_private->mediaStyle.m_ptr;
}

- (BOOL)supportsTextEncoding
{
  id v2 = [(WebFrameView *)[(WebFrame *)[(WebView *)self mainFrame] frameView] documentView];
  int v3 = [(NSView *)v2 conformsToProtocol:&unk_1F3CAAAF8];
  if (v3)
  {
    LOBYTE(v3) = [(NSView *)v2 supportsTextEncoding];
  }
  return v3;
}

- (void)setCustomTextEncodingName:(NSString *)customTextEncodingName
{
  int v5 = [(WebView *)self customTextEncodingName];
  if (v5 != customTextEncodingName && ![(NSString *)customTextEncodingName isEqualToString:v5])
  {
    __n128 v6 = [(WebView *)self _mainCoreFrame];
    if (v6)
    {
      float v7 = (WebCore::FrameLoader *)v6[35];
      MEMORY[0x1E4E442D0](&v10, customTextEncodingName);
      WebCore::FrameLoader::reloadWithOverrideEncoding(v7, (const WTF::String *)&v10);
      int v9 = v10;
      double v10 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v8);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
    }
  }
}

- (id)_mainFrameOverrideEncoding
{
  id result = [(WebFrame *)[(WebView *)self mainFrame] provisionalDataSource];
  if (result || (id result = [(WebFrame *)[(WebView *)self mainFrame] _dataSource]) != 0)
  {
    [result _documentLoader];
    id result = *(id *)(v4 + 1624);
    if (result)
    {
      if (*((_DWORD *)result + 1)) {
        return (id)WTF::StringImpl::operator NSString *();
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
  uint64_t v4 = [(WebView *)self mainFrame];
  return (NSString *)[(WebFrame *)v4 _stringByEvaluatingJavaScriptFromString:script];
}

- (WebScriptObject)windowScriptObject
{
  id result = [(WebView *)self _mainCoreFrame];
  if (result)
  {
    isa = result[19].super.isa;
    return (WebScriptObject *)WebCore::ScriptController::windowScriptObject(isa);
  }
  return result;
}

- (String)_userAgentString
{
  int v3 = v2;
  m_ptr = self->_private->userAgent.m_impl.m_ptr;
  if (m_ptr) {
    goto LABEL_8;
  }
  int v5 = self;
  uint64_t v6 = [(id)objc_opt_class() _standardUserAgentWithApplicationName:self->_private->applicationNameForUserAgent.m_ptr];
  MEMORY[0x1E4E442D0](&v12, v6);
  double v8 = v5->_private;
  int v9 = v12;
  double v12 = 0;
  self = (WebView *)v8->userAgent.m_impl.m_ptr;
  v8->userAgent.m_impl.m_ptr = (StringImpl *)v9;
  if (!self) {
    goto LABEL_7;
  }
  int v10 = LODWORD(self->super.super.super.isa) - 2;
  if (LODWORD(self->super.super.super.isa) == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)self, v7);
    self = (WebView *)v12;
    double v12 = 0;
    if (!self) {
      goto LABEL_7;
    }
    int v10 = LODWORD(self->super.super.super.isa) - 2;
    if (LODWORD(self->super.super.super.isa) == 2)
    {
      self = (WebView *)WTF::StringImpl::destroy((WTF::StringImpl *)self, v11);
      m_ptr = v5->_private->userAgent.m_impl.m_ptr;
      if (!m_ptr) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  LODWORD(self->super.super.super.isa) = v10;
LABEL_7:
  m_ptr = v5->_private->userAgent.m_impl.m_ptr;
  if (m_ptr) {
LABEL_8:
  }
    *(_DWORD *)m_ptr += 2;
LABEL_9:
  WebViewPrivate *v3 = m_ptr;
  return (String)self;
}

- (NSString)userAgentForURL:(NSURL *)URL
{
  if (!self) {
    return (NSString *)&stru_1F3C7DA90;
  }
  [(WebView *)self _userAgentString];
  if (!v6) {
    return (NSString *)&stru_1F3C7DA90;
  }
  uint64_t v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2) {
    WTF::StringImpl::destroy(v6, v3);
  }
  else {
    *(_DWORD *)v6 -= 2;
  }
  return v4;
}

- (void)setHostWindow:(NSWindow *)hostWindow
{
  int v5 = self->_private;
  if ((!hostWindow || !v5->closed) && v5->hostWindow.m_ptr != hostWindow)
  {
    uint64_t v6 = [(WebView *)self _mainCoreFrame];
    float v7 = self->_private;
    if (hostWindow) {
      CFRetain(hostWindow);
    }
    m_ptr = v7->hostWindow.m_ptr;
    v7->hostWindow.m_ptr = hostWindow;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (v6)
    {
      uint64_t v9 = (uint64_t)v6;
      do
      {
        if (!*(unsigned char *)(v9 + 144))
        {
          double v11 = *(void **)(*(void *)(v9 + 280) + 16);
          if ((*(uint64_t (**)(void *))(*v11 + 1072))(v11)) {
            int v10 = 0;
          }
          else {
            int v10 = (void *)v11[2];
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView"), "viewDidMoveToHostWindow");
        }
        uint64_t v9 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v9 + 48), v6);
      }
      while (v9);
    }
  }
}

- (NSWindow)hostWindow
{
  id v2 = self->_private;
  if (v2) {
    return (NSWindow *)v2->hostWindow.m_ptr;
  }
  else {
    return 0;
  }
}

- (id)documentViewAtWindowPoint:(CGPoint)a3
{
  id v3 = -[WebView _frameViewAtWindowPoint:](self, "_frameViewAtWindowPoint:", a3.x, a3.y);
  return (id)[v3 documentView];
}

- (id)_elementAtWindowPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9[1] = *MEMORY[0x1E4F143B8];
  id result = -[WebView _frameViewAtWindowPoint:](self, "_frameViewAtWindowPoint:");
  if (result)
  {
    id v6 = result;
    float v7 = (void *)[result documentView];
    if ([v7 conformsToProtocol:&unk_1F3CAA800])
    {
      objc_msgSend(v7, "convertPoint:fromView:", 0, x, y);
      return (id)objc_msgSend(v7, "elementAtPoint:");
    }
    else
    {
      double v8 = WebElementFrameKey;
      v9[0] = [v6 webFrame];
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    }
  }
  return result;
}

- (NSDictionary)elementAtPoint:(NSPoint)point
{
  -[WebView convertPoint:toView:](self, "convertPoint:toView:", 0, point.x, point.y);
  return (NSDictionary *)-[WebView _elementAtWindowPoint:](self, "_elementAtWindowPoint:");
}

- (BOOL)acceptsFirstResponder
{
  id v2 = [(WebFrame *)[(WebView *)self mainFrame] frameView];
  return [(WebFrameView *)v2 acceptsFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  if (self->_private->becomingFirstResponder) {
    return 0;
  }
  id v3 = [(WebFrame *)[(WebView *)self mainFrame] frameView];
  return [(WebFrameView *)v3 acceptsFirstResponder];
}

- (id)_webcore_effectiveFirstResponder
{
  id v3 = [(WebFrame *)[(WebView *)self mainFrame] frameView];
  if (v3)
  {
    return [(WebFrameView *)v3 _webcore_effectiveFirstResponder];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WebView;
    return [(WebView *)&v5 _webcore_effectiveFirstResponder];
  }
}

- (void)setNextKeyView:(id)a3
{
  objc_super v5 = [(WebFrame *)[(WebView *)self mainFrame] frameView];
  if (v5)
  {
    [(WebFrameView *)v5 setNextKeyView:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebView;
    [(WebView *)&v6 setNextKeyView:a3];
  }
}

- (BOOL)searchFor:(NSString *)string direction:(BOOL)forward caseSensitive:(BOOL)caseFlag wrap:(BOOL)wrapFlag
{
  return [(WebView *)self searchFor:string direction:forward caseSensitive:caseFlag wrap:wrapFlag startInSelection:0];
}

+ (void)registerViewClass:(Class)viewClass representationClass:(Class)representationClass forMIMEType:(NSString *)MIMEType
{
  objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "setObject:forKey:", viewClass, MIMEType);
  objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 1), "setObject:forKey:", representationClass, MIMEType);
  uint64_t v7 = objc_opt_class();
  double v8 = (WebCore::MIMETypeRegistry *)objc_opt_class();
  if ((WebCore::MIMETypeRegistry *)v7 == v8)
  {
    uint64_t v9 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes(v8);
    MEMORY[0x1E4E442D0](&v13, MIMEType);
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t)&v12, v9, &v13);
    double v11 = v13;
    double v13 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v10);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
}

- (void)setGroupName:(NSString *)groupName
{
  m_ptr = self->_private->group.m_ptr;
  if (m_ptr) {
    WebViewGroup::removeWebView(m_ptr, self);
  }
  MEMORY[0x1E4E442D0](&v24, groupName);
  MEMORY[0x1E4E442D0](&v22, [self->_private->preferences.m_ptr _localStorageDatabasePath]);
  WebViewGroup::getOrCreate((WebViewGroup *)&v24, (const WTF::String *)&v22, (WebViewGroup **)v23);
  uint64_t v7 = self->_private;
  double v8 = v7->group.m_ptr;
  v7->group.m_ptr = (WebViewGroup *)v23[0];
  if (v8)
  {
    if (*(_DWORD *)v8 == 1)
    {
      WebViewGroup::~WebViewGroup(v8, v6);
      WTF::fastFree(v10, v11);
      uint64_t v9 = v22;
      CGRect v22 = 0;
      if (!v9) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    --*(_DWORD *)v8;
  }
  uint64_t v9 = v22;
  CGRect v22 = 0;
  if (!v9)
  {
LABEL_11:
    uint64_t v12 = v24;
    uint64_t v24 = 0;
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_9:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    goto LABEL_11;
  }
  WTF::StringImpl::destroy(v9, v6);
  uint64_t v12 = v24;
  uint64_t v24 = 0;
  if (!v12) {
    goto LABEL_17;
  }
LABEL_14:
  if (*(_DWORD *)v12 == 2) {
    WTF::StringImpl::destroy(v12, v6);
  }
  else {
    *(_DWORD *)v12 -= 2;
  }
LABEL_17:
  double v13 = self->_private->group.m_ptr;
  uint64_t v24 = (WTF::StringImpl *)self;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v13 + 2, (uint64_t *)&v24, (uint64_t)v23);
  uint64_t v14 = self->_private;
  if (v14->page.m_ptr)
  {
    uint64_t v15 = (WTF::StringImpl *)*((void *)v14->group.m_ptr + 5);
    ++*((_DWORD *)v15 + 2);
    v23[0] = v15;
    WebCore::Page::setUserContentProvider();
    uint64_t v16 = v23[0];
    v23[0] = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 2) == 1) {
        (*(void (**)(WTF::StringImpl *))(*(void *)v16 + 8))(v16);
      }
      else {
        --*((_DWORD *)v16 + 2);
      }
    }
    int v17 = (WTF::StringImpl *)*((void *)self->_private->group.m_ptr + 6);
    ++*((_DWORD *)v17 + 2);
    v23[0] = v17;
    WebCore::Page::setVisitedLinkStore();
    uint64_t v18 = v23[0];
    v23[0] = 0;
    if (v18)
    {
      if (*((_DWORD *)v18 + 2) == 1) {
        (*(void (**)(WTF::StringImpl *))(*(void *)v18 + 8))(v18);
      }
      else {
        --*((_DWORD *)v18 + 2);
      }
    }
    int v19 = self->_private->page.m_ptr;
    MEMORY[0x1E4E442D0](v23, groupName);
    WebCore::Page::setGroupName((WebCore::Page *)v19, (const WTF::String *)v23);
    uint64_t v21 = v23[0];
    v23[0] = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2) {
        WTF::StringImpl::destroy(v21, v20);
      }
      else {
        *(_DWORD *)v21 -= 2;
      }
    }
  }
}

- (NSString)groupName
{
  id result = (NSString *)self->_private->page.m_ptr;
  if (result)
  {
    if (*(void *)WebCore::Page::groupName((WebCore::Page *)result))
    {
      return (NSString *)WTF::StringImpl::operator NSString *();
    }
    else
    {
      return (NSString *)&stru_1F3C7DA90;
    }
  }
  return result;
}

- (double)estimatedProgress
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    return *(double *)(*((void *)m_ptr + 16) + 128);
  }
  else {
    return 0.0;
  }
}

- (void)setMainFrameURL:(NSString *)mainFrameURL
{
  if ([(NSString *)mainFrameURL hasPrefix:@"/"]) {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:mainFrameURL isDirectory:0];
  }
  else {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", mainFrameURL);
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(WebView *)self mainFrame];
  uint64_t v8 = [MEMORY[0x1E4F18DA8] requestWithURL:v6];
  [(WebFrame *)v7 loadRequest:v8];
}

- (NSString)mainFrameURL
{
  id v3 = [(WebFrame *)[(WebView *)self mainFrame] provisionalDataSource];
  if (v3)
  {
    uint64_t v4 = [(NSMutableURLRequest *)[(WebDataSource *)v3 request] URL];
  }
  else
  {
    uint64_t v4 = (NSURL *)objc_msgSend((id)objc_msgSend(-[WebFrame _dataSource](-[WebView mainFrame](self, "mainFrame"), "_dataSource"), "request"), "URL");
  }
  return (NSString *)[(NSURL *)v4 _web_originalDataAsString];
}

- (NSString)mainFrameTitle
{
  id result = (NSString *)objc_msgSend(-[WebFrame _dataSource](-[WebView mainFrame](self, "mainFrame"), "_dataSource"), "pageTitle");
  if (!result) {
    return (NSString *)&stru_1F3C7DA90;
  }
  return result;
}

- (id)mainFrameIconURL
{
  id v2 = [(WebView *)self mainFrame];
  if (!v2) {
    return 0;
  }
  m_ptr = v2->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = *(void *)(*((void *)m_ptr + 35) + 88);
  if (!v4 || !*(_DWORD *)(v4 + 2828)) {
    return 0;
  }
  return (id)WTF::URL::operator NSURL *();
}

- (DOMDocument)mainFrameDocument
{
  if (!self->_private->mainFrameDocumentReady) {
    return 0;
  }
  id v2 = [(WebView *)self mainFrame];
  return [(WebFrame *)v2 DOMDocument];
}

- (void)setDrawsBackground:(BOOL)drawsBackground
{
  id v3 = self->_private;
  if (v3->drawsBackground != drawsBackground)
  {
    v3->drawsBackground = drawsBackground;
    uint64_t v4 = [(WebView *)self mainFrame];
    [(WebFrame *)v4 _updateBackgroundAndUpdatesWhileOffscreen];
  }
}

- (BOOL)drawsBackground
{
  id v2 = self->_private;
  return !v2 || v2->drawsBackground;
}

- (void)setShouldUpdateWhileOffscreen:(BOOL)shouldUpdateWhileOffscreen
{
  id v3 = self->_private;
  if (v3->shouldUpdateWhileOffscreen != shouldUpdateWhileOffscreen)
  {
    v3->shouldUpdateWhileOffscreen = shouldUpdateWhileOffscreen;
    uint64_t v4 = [(WebView *)self mainFrame];
    [(WebFrame *)v4 _updateBackgroundAndUpdatesWhileOffscreen];
  }
}

- (BOOL)shouldUpdateWhileOffscreen
{
  return self->_private->shouldUpdateWhileOffscreen;
}

- (void)setCurrentNodeHighlight:(id)a3
{
  uint64_t v4 = self->_private;
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = v4->currentNodeHighlight.m_ptr;
  v4->currentNodeHighlight.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)currentNodeHighlight
{
  return self->_private->currentNodeHighlight.m_ptr;
}

- (id)previousValidKeyView
{
  id v2 = self;
  v6.receiver = self;
  v6.super_class = (Class)WebView;
  id v3 = [(WebView *)&v6 previousValidKeyView];
  if ([v3 isDescendantOf:v2])
  {
    Mutable = CFSetCreateMutable(0, 0, 0);
    CFSetAddValue(Mutable, v3);
    while (1)
    {
      CFSetAddValue(Mutable, v2);
      id v2 = (WebView *)[(WebView *)v2 previousKeyView];
      if (!v2 || CFSetGetValue(Mutable, v2)) {
        break;
      }
      if (([v3 isDescendantOf:v2] & 1) == 0)
      {
        id v3 = [(WebView *)v2 previousValidKeyView];
        break;
      }
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  return v3;
}

+ (BOOL)_didSetCacheModel
{
  return byte_1EB3A96CC;
}

+ (unint64_t)_maxCacheModelInAnyInstance
{
  if (byte_1EB3A96CE == 1)
  {
    id v2 = (void *)[(id)qword_1EB3A9700 objectEnumerator];
    id v3 = objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
    unint64_t v4 = 0;
    if (!v3) {
      return v4;
    }
  }
  else
  {
    qword_1EB3A9700 = 0;
    byte_1EB3A96CE = 1;
    id v2 = (void *)[0 objectEnumerator];
    id v3 = objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
    unint64_t v4 = 0;
    if (!v3) {
      return v4;
    }
  }
  do
  {
    unint64_t v5 = [v3 cacheModel];
    if (v4 <= v5) {
      unint64_t v4 = v5;
    }
    id v3 = objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
  }
  while (v3);
  return v4;
}

+ (void)_cacheModelChangedNotification:(id)a3
{
}

unint64_t __42__WebView__cacheModelChangedNotification___block_invoke(uint64_t a1)
{
  unint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "cacheModel");
  if (![*(id *)(a1 + 40) _didSetCacheModel]
    || v2 > [*(id *)(a1 + 40) _cacheModel])
  {
    id v3 = *(void **)(a1 + 40);
    unint64_t v4 = v2;
    return [v3 _setCacheModel:v4];
  }
  unint64_t result = [*(id *)(a1 + 40) _cacheModel];
  if (v2 < result)
  {
    objc_super v6 = *(void **)(a1 + 40);
    WebCacheModel v7 = [+[WebPreferences standardPreferences] cacheModel];
    unint64_t v8 = [*(id *)(a1 + 40) _maxCacheModelInAnyInstance];
    if (v7 <= v8) {
      unint64_t v4 = v8;
    }
    else {
      unint64_t v4 = v7;
    }
    id v3 = v6;
    return [v3 _setCacheModel:v4];
  }
  return result;
}

+ (void)_preferencesRemovedNotification:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "object"), "cacheModel");
  if (v4 == [a1 _cacheModel])
  {
    WebCacheModel v5 = [+[WebPreferences standardPreferences] cacheModel];
    unint64_t v6 = [a1 _maxCacheModelInAnyInstance];
    if (v5 <= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v5;
    }
    [a1 _setCacheModel:v7];
  }
}

- (id)_focusedFrame
{
  uint64_t v3 = objc_msgSend((id)-[WebView window](self, "window"), "firstResponder");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend(v4, "isDescendantOf:", -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView")))
  {
    return 0;
  }
  do
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v4 = (void *)[v4 superview];
  }
  while (v4);
  return (id)[v4 webFrame];
}

- (BOOL)_isLoading
{
  unint64_t v2 = [(WebView *)self mainFrame];
  if (objc_msgSend(-[WebFrame _dataSource](v2, "_dataSource"), "isLoading")) {
    return 1;
  }
  uint64_t v4 = [(WebFrame *)v2 provisionalDataSource];
  return [(WebDataSource *)v4 isLoading];
}

- (id)_frameViewAtWindowPoint:(CGPoint)a3
{
  if (self->_private->closed) {
    return 0;
  }
  id v5 = (id)-[WebView hitTest:](self, "hitTest:", a3.x, a3.y);
  int v6 = objc_msgSend(v5, "isDescendantOf:", -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"));
  id result = 0;
  if (v6 && v5)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id result = (id)[v5 superview];
      id v5 = result;
      if (!result) {
        return result;
      }
    }
    return v5;
  }
  return result;
}

- (BOOL)_continuousCheckingAllowed
{
  if ((-[WebView _continuousCheckingAllowed]::readAllowContinuousSpellCheckingDefault & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSAllowContinuousSpellChecking"))
    {
      -[WebView _continuousCheckingAllowed]::allowContinuousSpellChecking = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSAllowContinuousSpellChecking");
    }
    -[WebView _continuousCheckingAllowed]::readAllowContinuousSpellCheckingDefault = 1;
  }
  return -[WebView _continuousCheckingAllowed]::allowContinuousSpellChecking;
}

- (id)_responderForResponderOperations
{
  unint64_t v2 = self;
  uint64_t v3 = objc_msgSend((id)-[WebView window](self, "window"), "firstResponder");
  uint64_t v4 = [(WebFrame *)[(WebView *)v2 mainFrame] frameView];
  if ((WebView *)v3 != v2)
  {
    id v5 = v4;
    unint64_t v2 = (WebView *)v3;
    if (![(WAKView *)v4 _web_firstResponderIsSelfOrDescendantView])
    {
      int v6 = [(WebFrameView *)v5 documentView];
      if (v6) {
        return v6;
      }
      else {
        return v5;
      }
    }
  }
  return v2;
}

- (void)takeStringURLFrom:(id)sender
{
  uint64_t v4 = [sender stringValue];
  id v5 = [(WebView *)self mainFrame];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F18DA8], "requestWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", v4));
  [(WebFrame *)v5 loadRequest:v6];
}

- (BOOL)canGoBack
{
  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = *((void *)m_ptr + 17);
  return MEMORY[0x1F4175730](v4, 0xFFFFFFFFLL);
}

- (BOOL)canGoForward
{
  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = *((void *)m_ptr + 17);
  return MEMORY[0x1F4175730](v4, 1);
}

- (void)stopLoading:(id)sender
{
  if (WebThreadNotCurrent())
  {
    self->_private->isStopping = 1;
    *MEMORY[0x1E4FB6BC0] = 1;
  }
  WebThreadRun();
}

uint64_t __37__WebView_WebIBActions__stopLoading___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 80) + 792) = 0;
  uint64_t v1 = (void *)[*(id *)(a1 + 32) mainFrame];
  return [v1 stopLoading];
}

- (void)stopLoadingAndClear
{
  if (WebThreadNotCurrent() && (WebThreadIsLocked() & 1) == 0)
  {
    self->_private->isStopping = 1;
    *MEMORY[0x1E4FB6BC0] = 1;
  }
  WebThreadRun();
}

void __44__WebView_WebIBActions__stopLoadingAndClear__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 80) + 792) = 0;
  uint64_t v1 = (void *)[*(id *)(a1 + 32) mainFrame];
  [v1 stopLoading];
  uint64_t v2 = WebCore::Document::loader(*(WebCore::Document **)(*(void *)(v1[1] + 8) + 296));
  WebCore::DocumentWriter::end((WebCore::DocumentWriter *)(v2 + 112));
  uint64_t v3 = (void *)[v1 frameView];
  objc_msgSend((id)objc_msgSend(v3, "documentView"), "scale");
  int v5 = v4;
  uint64_t v6 = [WebPlainWhiteView alloc];
  unint64_t v7 = -[WebPlainWhiteView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
  LODWORD(v8) = v5;
  [(WebPlainWhiteView *)v7 setScale:v8];
  [v3 bounds];
  -[WebPlainWhiteView setFrame:](v7, "setFrame:");
  [v3 _setDocumentView:v7];
  [(WebPlainWhiteView *)v7 setNeedsDisplay:1];
  if (v7)
  {
    CFRelease(v7);
  }
}

- (void)reload:(id)sender
{
}

uint64_t __32__WebView_WebIBActions__reload___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) mainFrame];
  return [v1 reload];
}

- (void)reloadFromOrigin:(id)sender
{
  uint64_t v3 = [(WebView *)self mainFrame];
  [(WebFrame *)v3 reloadFromOrigin];
}

- (BOOL)canMakeTextSmaller
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  return [(WebView *)self _canZoomOut:v3];
}

- (void)makeTextSmaller:(id)sender
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  [(WebView *)self _zoomOut:sender isTextOnly:v5];
}

- (BOOL)canMakeTextLarger
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  return [(WebView *)self _canZoomIn:v3];
}

- (void)makeTextLarger:(id)sender
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  [(WebView *)self _zoomIn:sender isTextOnly:v5];
}

- (BOOL)canMakeTextStandardSize
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  return [(WebView *)self _canResetZoom:v3];
}

- (void)makeTextStandardSize:(id)sender
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitDebugFullPageZoomPreferenceKey") ^ 1;
  [(WebView *)self _resetZoom:sender isTextOnly:v5];
}

- (void)toggleContinuousSpellChecking:(id)sender
{
  uint64_t v4 = [(WebView *)self isContinuousSpellCheckingEnabled] ^ 1;
  [(WebView *)self setContinuousSpellCheckingEnabled:v4];
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3 && a4)
  {
    if (self) {
      [(WebView *)self page];
    }
    uint64_t v6 = WTF::fastMalloc((WTF *)0x20);
    MEMORY[0x1E4E43E10](v6, a3, a4);
    WebCore::Page::addSchedulePair();
    if (v6 && atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, (unsigned int *)v6);
      double v8 = *(const void **)(v6 + 24);
      *(void *)(v6 + 24) = 0;
      if (v8) {
        CFRelease(v8);
      }
      uint64_t v9 = *(const void **)(v6 + 16);
      *(void *)(v6 + 16) = 0;
      if (v9) {
        CFRelease(v9);
      }
      int v10 = *(const void **)(v6 + 8);
      *(void *)(v6 + 8) = 0;
      if (v10) {
        CFRelease(v10);
      }
      WTF::fastFree((WTF *)v6, v7);
    }
  }
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3 && a4)
  {
    if (self) {
      [(WebView *)self page];
    }
    uint64_t v6 = WTF::fastMalloc((WTF *)0x20);
    MEMORY[0x1E4E43E10](v6, a3, a4);
    WebCore::Page::removeSchedulePair();
    if (v6 && atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, (unsigned int *)v6);
      double v8 = *(const void **)(v6 + 24);
      *(void *)(v6 + 24) = 0;
      if (v8) {
        CFRelease(v8);
      }
      uint64_t v9 = *(const void **)(v6 + 16);
      *(void *)(v6 + 16) = 0;
      if (v9) {
        CFRelease(v9);
      }
      int v10 = *(const void **)(v6 + 8);
      *(void *)(v6 + 8) = 0;
      if (v10) {
        CFRelease(v10);
      }
      WTF::fastFree((WTF *)v6, v7);
    }
  }
}

- (BOOL)findString:(id)a3 options:(unint64_t)a4
{
  if (self->_private->closed)
  {
LABEL_2:
    LOBYTE(v4) = 0;
    return v4;
  }
  id v6 = [(WebView *)self _selectedOrMainFrame];
  unint64_t v7 = 0;
  id v8 = v6;
  do
  {
    if (v8)
    {
      if ((a4 & 8) == 0) {
        goto LABEL_7;
      }
    }
    else if ((a4 & 8) == 0)
    {
LABEL_7:
      uint64_t v9 = WebCore::FrameTree::traverseNext();
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    uint64_t v9 = WebCore::FrameTree::traversePrevious();
    if (!v9) {
      goto LABEL_13;
    }
LABEL_11:
    if (*(unsigned char *)(v9 + 144)
      || (int v10 = *(void **)(*(void *)(v9 + 280) + 16),
          ((*(uint64_t (**)(void *))(*v10 + 1072))(v10) & 1) != 0))
    {
LABEL_13:
      id v11 = 0;
      goto LABEL_14;
    }
    id v11 = (id)v10[2];
LABEL_14:
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "frameView"), "documentView");
    if ([v12 conformsToProtocol:&unk_1F3CAADB8])
    {
      if (v8 == v6) {
        unint64_t v7 = v12;
      }
      if (v8 == v11) {
        unint64_t v13 = a4;
      }
      else {
        unint64_t v13 = a4 & 0xFFFFFFFFFFFFFFEFLL;
      }
      if ([v12 conformsToProtocol:&unk_1F3CAA990])
      {
        if ([v12 _findString:a3 options:v13]) {
          goto LABEL_37;
        }
      }
      else
      {
        int v14 = [v12 conformsToProtocol:&unk_1F3CAAC68];
        uint64_t v15 = (v13 >> 4) & 1;
        BOOL v16 = (v13 & 1) == 0;
        if (v14)
        {
          if ([v12 searchFor:a3 direction:(v13 & 8) == 0 caseSensitive:v16 wrap:v15 startInSelection:(v13 >> 5) & 1])goto LABEL_37; {
        }
          }
        else if ([v12 searchFor:a3 direction:(v13 & 8) == 0 caseSensitive:v16 wrap:v15])
        {
LABEL_37:
          if (v8 != v6) {
            [v6 _clearSelection];
          }
          int v17 = (void *)[(WebView *)self window];
          uint64_t v18 = v12;
LABEL_45:
          [v17 makeFirstResponder:v18];
          LOBYTE(v4) = 1;
          return v4;
        }
      }
      if (v8 == v11) {
        goto LABEL_2;
      }
    }
    if (!v11) {
      break;
    }
    id v8 = v11;
  }
  while (v11 != v6);
  LOBYTE(v4) = 0;
  if ((a4 & 0x10) != 0 && v7)
  {
    if ([v7 conformsToProtocol:&unk_1F3CAA990])
    {
      if (([v7 _findString:a3 options:a4] & 1) == 0) {
        goto LABEL_2;
      }
    }
    else
    {
      int v19 = [v7 conformsToProtocol:&unk_1F3CAAC68];
      BOOL v20 = (a4 & 1) == 0;
      if (v19)
      {
        if (([v7 searchFor:a3 direction:(a4 & 8) == 0 caseSensitive:v20 wrap:1 startInSelection:(a4 >> 5) & 1] & 1) == 0)goto LABEL_2; {
      }
        }
      else
      {
        int v4 = [v7 searchFor:a3 direction:(a4 & 8) == 0 caseSensitive:v20 wrap:1];
        if (!v4) {
          return v4;
        }
      }
    }
    int v17 = (void *)[(WebView *)self window];
    uint64_t v18 = v7;
    goto LABEL_45;
  }
  return v4;
}

- (id)DOMRangeOfString:(id)a3 relativeTo:(id)a4 options:(unint64_t)a5
{
  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr) {
    return m_ptr;
  }
  MEMORY[0x1E4E442D0](&v14, a3);
  WebCore::makeSimpleRange();
  WebCore::Page::rangeOfString();
  m_ptr = kit();
  if (v17)
  {
    unint64_t v7 = v16;
    BOOL v16 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    id v8 = v15;
    uint64_t v15 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
  }
  if (v13)
  {
    if (v12)
    {
      if (*((_DWORD *)v12 + 7) == 2)
      {
        if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v12);
        }
      }
      else
      {
        *((_DWORD *)v12 + 7) -= 2;
      }
    }
    if (v11)
    {
      if (*((_DWORD *)v11 + 7) == 2)
      {
        if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v11);
        }
      }
      else
      {
        *((_DWORD *)v11 + 7) -= 2;
      }
    }
  }
  uint64_t v9 = v14;
  int v14 = 0;
  if (!v9) {
    return m_ptr;
  }
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return m_ptr;
  }
  WTF::StringImpl::destroy(v9, v6);
  return m_ptr;
}

- (void)setTabKeyCyclesThroughElements:(BOOL)a3
{
  self->_private->tabKeyCyclesThroughElementsChanged = 1;
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    *((unsigned char *)m_ptr + 338) = a3;
  }
}

- (BOOL)tabKeyCyclesThroughElements
{
  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((unsigned char *)m_ptr + 338) != 0;
}

- (void)setScriptDebugDelegate:(id)a3
{
  self->_private->id scriptDebugDelegate = a3;
  [(WebView *)self _cacheScriptDebugDelegateImplementations];
  if (a3)
  {
    [(WebView *)self _attachScriptDebuggerToAllFrames];
  }
  else
  {
    [(WebView *)self _detachScriptDebuggerFromAllFrames];
  }
}

- (id)scriptDebugDelegate
{
  return self->_private->scriptDebugDelegate;
}

- (void)setHistoryDelegate:(id)a3
{
  self->_private->id historyDelegate = a3;
  [(WebView *)self _cacheHistoryDelegateImplementations];
}

- (id)historyDelegate
{
  return self->_private->historyDelegate;
}

- (BOOL)shouldClose
{
  uint64_t v2 = [(WebView *)self _mainCoreFrame];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2[35];
  return MEMORY[0x1F416C598](v3);
}

- (BOOL)canMarkAllTextMatches
{
  if (self->_private->closed)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    uint64_t v3 = [(WebView *)self mainFrame];
    while (1)
    {
      int v4 = [(WebFrameView *)[(WebFrame *)v3 frameView] documentView];
      if (v4)
      {
        int v2 = [(NSView *)v4 conformsToProtocol:&unk_1F3CAA918];
        if (!v2) {
          break;
        }
      }
      if (v3)
      {
        uint64_t v5 = WebCore::FrameTree::traverseNext();
        if (!v5) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v5 = WebCore::FrameTree::traverseNext();
        if (!v5) {
          goto LABEL_14;
        }
      }
      if (!*(unsigned char *)(v5 + 144))
      {
        id v6 = *(void **)(*(void *)(v5 + 280) + 16);
        if (((*(uint64_t (**)(void *))(*v6 + 1072))(v6) & 1) == 0)
        {
          uint64_t v3 = (WebFrame *)v6[2];
          if (v3) {
            continue;
          }
        }
      }
LABEL_14:
      LOBYTE(v2) = 1;
      return v2;
    }
  }
  return v2;
}

- (unint64_t)countMatchesForText:(id)a3 options:(unint64_t)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  return [(WebView *)self countMatchesForText:a3 inDOMRange:0 options:a4 highlight:a5 limit:a6 markMatches:a7];
}

- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 highlight:(BOOL)a6 limit:(unint64_t)a7 markMatches:(BOOL)a8
{
  if (self->_private->closed) {
    return 0;
  }
  BOOL v9 = a8;
  BOOL v11 = a6;
  uint64_t v15 = [(WebView *)self mainFrame];
  unint64_t v16 = a7 - 1;
  unsigned int v17 = 0;
  if (v9)
  {
    if (a7)
    {
      do
      {
        uint64_t v18 = [(WebFrameView *)[(WebFrame *)v15 frameView] documentView];
        if ([(NSView *)v18 conformsToProtocol:&unk_1F3CAA918])
        {
          [(NSView *)v18 setMarkedTextMatchesAreHighlighted:v11];
          v17 += [(NSView *)v18 countMatchesForText:a3 inDOMRange:a4 options:a5 limit:a7 - v17 markMatches:1];
          if (v16 < v17) {
            break;
          }
        }
        if (v15)
        {
          uint64_t v19 = WebCore::FrameTree::traverseNext();
          if (!v19) {
            return v17;
          }
        }
        else
        {
          uint64_t v19 = WebCore::FrameTree::traverseNext();
          if (!v19) {
            return v17;
          }
        }
        if (*(unsigned char *)(v19 + 144)) {
          break;
        }
        BOOL v20 = *(void **)(*(void *)(v19 + 280) + 16);
        if ((*(uint64_t (**)(void *))(*v20 + 1072))(v20)) {
          break;
        }
        uint64_t v15 = (WebFrame *)v20[2];
      }
      while (v15);
    }
    else
    {
      do
      {
        uint64_t v24 = [(WebFrameView *)[(WebFrame *)v15 frameView] documentView];
        if ([(NSView *)v24 conformsToProtocol:&unk_1F3CAA918])
        {
          [(NSView *)v24 setMarkedTextMatchesAreHighlighted:v11];
          v17 += [(NSView *)v24 countMatchesForText:a3 inDOMRange:a4 options:a5 limit:0 markMatches:1];
          if (v16 < v17) {
            break;
          }
        }
        if (v15)
        {
          uint64_t v25 = WebCore::FrameTree::traverseNext();
          if (!v25) {
            return v17;
          }
        }
        else
        {
          uint64_t v25 = WebCore::FrameTree::traverseNext();
          if (!v25) {
            return v17;
          }
        }
        if (*(unsigned char *)(v25 + 144)) {
          break;
        }
        uint64_t v26 = *(void **)(*(void *)(v25 + 280) + 16);
        if ((*(uint64_t (**)(void *))(*v26 + 1072))(v26)) {
          break;
        }
        uint64_t v15 = (WebFrame *)v26[2];
      }
      while (v15);
    }
  }
  else if (a7)
  {
    do
    {
      uint64_t v21 = [(WebFrameView *)[(WebFrame *)v15 frameView] documentView];
      if ([(NSView *)v21 conformsToProtocol:&unk_1F3CAA918])
      {
        v17 += [(NSView *)v21 countMatchesForText:a3 inDOMRange:a4 options:a5 limit:a7 - v17 markMatches:0];
        if (v16 < v17) {
          break;
        }
      }
      if (v15)
      {
        uint64_t v22 = WebCore::FrameTree::traverseNext();
        if (!v22) {
          return v17;
        }
      }
      else
      {
        uint64_t v22 = WebCore::FrameTree::traverseNext();
        if (!v22) {
          return v17;
        }
      }
      if (*(unsigned char *)(v22 + 144)) {
        break;
      }
      uint64_t v23 = *(void **)(*(void *)(v22 + 280) + 16);
      if ((*(uint64_t (**)(void *))(*v23 + 1072))(v23)) {
        break;
      }
      uint64_t v15 = (WebFrame *)v23[2];
    }
    while (v15);
  }
  else
  {
    do
    {
      unint64_t v27 = [(WebFrameView *)[(WebFrame *)v15 frameView] documentView];
      if ([(NSView *)v27 conformsToProtocol:&unk_1F3CAA918])
      {
        v17 += [(NSView *)v27 countMatchesForText:a3 inDOMRange:a4 options:a5 limit:0 markMatches:0];
        if (v16 < v17) {
          break;
        }
      }
      if (v15)
      {
        uint64_t v28 = WebCore::FrameTree::traverseNext();
        if (!v28) {
          return v17;
        }
      }
      else
      {
        uint64_t v28 = WebCore::FrameTree::traverseNext();
        if (!v28) {
          return v17;
        }
      }
      if (*(unsigned char *)(v28 + 144)) {
        break;
      }
      uint64_t v29 = *(void **)(*(void *)(v28 + 280) + 16);
      if ((*(uint64_t (**)(void *))(*v29 + 1072))(v29)) {
        break;
      }
      uint64_t v15 = (WebFrame *)v29[2];
    }
    while (v15);
  }
  return v17;
}

- (void)unmarkAllTextMatches
{
  if (!self->_private->closed)
  {
    int v2 = [(WebView *)self mainFrame];
    do
    {
      uint64_t v3 = [(WebFrameView *)[(WebFrame *)v2 frameView] documentView];
      if ([(NSView *)v3 conformsToProtocol:&unk_1F3CAA918]) {
        [(NSView *)v3 unmarkAllTextMatches];
      }
      if (v2)
      {
        uint64_t v4 = WebCore::FrameTree::traverseNext();
        if (!v4) {
          return;
        }
      }
      else
      {
        uint64_t v4 = WebCore::FrameTree::traverseNext();
        if (!v4) {
          return;
        }
      }
      if (*(unsigned char *)(v4 + 144)) {
        break;
      }
      uint64_t v5 = *(void **)(*(void *)(v4 + 280) + 16);
      if ((*(uint64_t (**)(void *))(*v5 + 1072))(v5)) {
        break;
      }
      int v2 = (WebFrame *)v5[2];
    }
    while (v2);
  }
}

- (id)rectsForTextMatches
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_private->closed) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  int v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(WebView *)self mainFrame];
  do
  {
    id v6 = [(WebFrameView *)[(WebFrame *)v5 frameView] documentView];
    if ([(NSView *)v6 conformsToProtocol:&unk_1F3CAA918])
    {
      [(NSView *)v6 visibleRect];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v15 = (void *)[(NSView *)v6 rectsForTextMatches];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) rectValue];
            v35.origin.double x = v8;
            v35.origin.double y = v10;
            v35.size.double width = v12;
            v35.size.double height = v14;
            NSRect v34 = NSIntersectionRect(v33, v35);
            double x = v34.origin.x;
            double y = v34.origin.y;
            double width = v34.size.width;
            double height = v34.size.height;
            if (!NSIsEmptyRect(v34))
            {
              uint64_t v24 = (void *)MEMORY[0x1E4E4B3F0]();
              -[NSView convertRect:toView:](v6, "convertRect:toView:", self, x, y, width, height);
              objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:"));
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v17);
      }
    }
    if (v5)
    {
      uint64_t v25 = WebCore::FrameTree::traverseNext();
      if (!v25) {
        return v2;
      }
    }
    else
    {
      uint64_t v25 = WebCore::FrameTree::traverseNext();
      if (!v25) {
        return v2;
      }
    }
    if (*(unsigned char *)(v25 + 144)) {
      break;
    }
    uint64_t v26 = *(void **)(*(void *)(v25 + 280) + 16);
    if ((*(uint64_t (**)(void *))(*v26 + 1072))(v26)) {
      break;
    }
    uint64_t v5 = (WebFrame *)v26[2];
  }
  while (v5);
  return v2;
}

- (void)scrollDOMRangeToVisible:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame");
  [v4 _scrollDOMRangeToVisible:a3];
}

- (void)scrollDOMRangeToVisible:(id)a3 withInset:(double)a4
{
  id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame");
  [v6 _scrollDOMRangeToVisible:a3 withInset:a4];
}

- (BOOL)allowsUndo
{
  return self->_private->allowsUndo;
}

- (void)setAllowsUndo:(BOOL)a3
{
  self->_private->allowsUndo = a3;
}

- (void)setPageSizeMultiplier:(float)a3
{
}

- (float)pageSizeMultiplier
{
  BOOL v3 = [(WebView *)self _realZoomMultiplierIsTextOnly];
  float result = 1.0;
  if (!v3) {
    return self->_private->zoomMultiplier;
  }
  return result;
}

- (BOOL)canZoomPageIn
{
  return [(WebView *)self _canZoomIn:0];
}

- (void)zoomPageIn:(id)a3
{
}

- (BOOL)canZoomPageOut
{
  return [(WebView *)self _canZoomOut:0];
}

- (void)zoomPageOut:(id)a3
{
}

- (BOOL)canResetPageZoom
{
  return [(WebView *)self _canResetZoom:0];
}

- (void)resetPageZoom:(id)a3
{
}

- (void)setMediaVolume:(float)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F41725A8](m_ptr, a2, a3);
  }
}

- (float)mediaVolume
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    return *((float *)m_ptr + 87);
  }
  else {
    return 0.0;
  }
}

- (void)suspendAllMediaPlayback
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F4172738](m_ptr, a2);
  }
}

- (void)resumeAllMediaPlayback
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F41726F0](m_ptr, a2);
  }
}

- (void)addVisitedLinks:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (WTF *)*((void *)self->_private->group.m_ptr + 6);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        WebVisitedLinkStore::addVisitedLink(v4, *(__CFString **)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeVisitedLink:(id)a3
{
  BOOL v3 = (WebVisitedLinkStore *)*((void *)self->_private->group.m_ptr + 6);
  MEMORY[0x1E4E441F0](&v7, a3);
  if (v7) {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebVisitedLinkStore::removeVisitedLink(v3, &v4->isa);
  uint64_t v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (DOMCSSStyleDeclaration)computedStyleForElement:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  if (pseudoElement) {
    uint64_t v5 = (__CFString *)pseudoElement;
  }
  else {
    uint64_t v5 = &stru_1F3C7DA90;
  }
  uint64_t v6 = [(DOMNode *)element ownerDocument];
  return [(DOMDocument *)v6 getComputedStyle:element pseudoElement:v5];
}

- (DOMRange)editableDOMRangeForPoint:(NSPoint)point
{
  BOOL v3 = (DOMRange *)self;
  if (!self) {
    return v3;
  }
  double y = point.y;
  double x = point.x;
  [(WebView *)self page];
  if (!v16) {
    return 0;
  }
  uint64_t v6 = *((void *)v16 + 20);
  if (v6) {
    BOOL v7 = *(unsigned char *)(v6 + 144) == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    return 0;
  }
  long long v9 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
  -[DOMRange convertPoint:toView:](v3, "convertPoint:toView:", 0, x, y);
  v14.double x = v10;
  v14.double y = v11;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v15, &v14);
  WebCore::Editor::rangeForPoint((uint64_t *)&v16, v9, &v15);
  BOOL v3 = (DOMRange *)kit();
  if (!v18) {
    return v3;
  }
  long long v12 = v17;
  uint64_t v17 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  double v13 = v16;
  uint64_t v16 = 0;
  if (!v13) {
    return v3;
  }
  if (*((_DWORD *)v13 + 7) == 2)
  {
    if ((*((_WORD *)v13 + 17) & 0x400) != 0) {
      return v3;
    }
    WebCore::Node::removedLastRef(v13);
    return v3;
  }
  else
  {
    *((_DWORD *)v13 + 7) -= 2;
    return v3;
  }
}

- (BOOL)_shouldChangeSelectedDOMRange:(id)a3 toDOMRange:(id)a4 affinity:(unint64_t)a5 stillSelecting:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = [(WebView *)self _editingDelegateForwarder];
  return [v11 webView:self shouldChangeSelectedDOMRange:a3 toDOMRange:a4 affinity:a5 stillSelecting:v6];
}

- (void)_setMaintainsInactiveSelection:(BOOL)a3
{
  self->_private->shouldMaintainInactiveSelection = a3;
}

- (BOOL)maintainsInactiveSelection
{
  return self->_private->shouldMaintainInactiveSelection;
}

- (void)setSelectedDOMRange:(DOMRange *)range affinity:(NSSelectionAffinity)selectionAffinity
{
  uint64_t v5 = [(WebView *)self _selectedOrMainFrame];
  if (v5)
  {
    uint64_t v6 = *(void *)(v5[1] + 8);
    if (v6)
    {
      if (range)
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)((void)[(DOMRange *)range startContainer][16] + 48)
                                   + 8)
                       + 544);
        if (v7 && *(void *)(v7 + 8))
        {
          WebCore::makeSimpleRange();
          WebCore::FrameSelection::setSelectedRange();
          if (v10)
          {
            if (*((_DWORD *)v10 + 7) == 2)
            {
              if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v10);
              }
            }
            else
            {
              *((_DWORD *)v10 + 7) -= 2;
            }
          }
          if (v9)
          {
            if (*((_DWORD *)v9 + 7) == 2)
            {
              if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v9);
              }
            }
            else
            {
              *((_DWORD *)v9 + 7) -= 2;
            }
          }
        }
      }
      else
      {
        uint64_t v8 = *(void *)(*(void *)(v6 + 296) + 3096);
        MEMORY[0x1F416D880](v8);
      }
    }
  }
}

- (DOMRange)selectedDOMRange
{
  int v2 = [(WebView *)self _selectedOrMainFrame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)&v8, (WebCore::VisibleSelection *)(*(void *)(*(void *)(v3 + 296) + 3096) + 56));
  uint64_t v4 = kit();
  if (!v10) {
    return (DOMRange *)v4;
  }
  uint64_t v5 = v9;
  long long v9 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (!v7) {
    return (DOMRange *)v4;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
    return (DOMRange *)v4;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    return (DOMRange *)v4;
  }
  WebCore::Node::removedLastRef(v7);
  return (DOMRange *)v4;
}

- (NSSelectionAffinity)selectionAffinity
{
  int v2 = [(WebView *)self _selectedOrMainFrame];
  if (v2 && (uint64_t v3 = *(void *)(v2[1] + 8)) != 0) {
    return (unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v3 + 296) + 3096) + 152);
  }
  else {
    return 1;
  }
}

- (void)setEditable:(BOOL)editable
{
  BOOL v3 = editable;
  if ([(WebView *)self isEditable] != editable)
  {
    m_ptr = self->_private->page.m_ptr;
    if (m_ptr)
    {
      *((unsigned char *)m_ptr + 656) = v3;
      uint64_t v6 = self->_private;
      if (v6->tabKeyCyclesThroughElementsChanged)
      {
        uint64_t v7 = [(WebView *)self _mainCoreFrame];
        if (!v7) {
          return;
        }
      }
      else
      {
        *((unsigned char *)v6->page.m_ptr + 338) = !v3;
        uint64_t v7 = [(WebView *)self _mainCoreFrame];
        if (!v7) {
          return;
        }
      }
      if (v3)
      {
        uint64_t v8 = v7;
        long long v9 = (WebCore::Editor *)WebCore::Document::editor(v7[37]);
        WebCore::Editor::applyEditingStyleToBodyElement(v9);
        if (![(WebView *)self selectedDOMRange])
        {
          uint64_t v11 = *((void *)v8[37] + 387);
          MEMORY[0x1F416D840](v11, v10);
        }
      }
    }
  }
}

- (BOOL)isEditable
{
  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((unsigned char *)m_ptr + 656) != 0;
}

- (void)setTypingStyle:(DOMCSSStyleDeclaration *)typingStyle
{
  id v4 = [(WebView *)self _selectedOrMainFrame];
  [v4 _setTypingStyle:typingStyle withUndoAction:59];
}

- (DOMCSSStyleDeclaration)typingStyle
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  return (DOMCSSStyleDeclaration *)[v2 _typingStyle];
}

- (void)setSmartInsertDeleteEnabled:(BOOL)smartInsertDeleteEnabled
{
  BOOL v3 = (void *)*((void *)self->_private->page.m_ptr + 14);
  uint64_t v4 = v3[87];
  if (((v4 & 0x400000000000000) != 0) != smartInsertDeleteEnabled)
  {
    BOOL v5 = smartInsertDeleteEnabled;
    uint64_t v7 = v3 + 83;
    uint64_t v8 = v3[90];
    uint64_t v9 = v3[89];
    uint64_t v10 = v3[88];
    uint64_t v11 = v3[86];
    uint64_t v12 = v3[85];
    uint64_t v13 = v3[84];
    uint64_t v14 = v3[83];
    uint64_t v15 = 0x400000000000000;
    if (!smartInsertDeleteEnabled) {
      uint64_t v15 = 0;
    }
    *uint64_t v7 = v14;
    v7[1] = v13;
    v7[2] = v12;
    v7[3] = v11;
    v7[4] = v4 & 0xFBFFFFFFFFFFFFFFLL | v15;
    v7[5] = v10;
    v7[6] = v9;
    v7[7] = v8;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setBool:forKey:", (*(void *)(*((void *)self->_private->page.m_ptr + 14) + 696) >> 58) & 1, @"WebSmartInsertDeleteEnabled");
    [(WebView *)self setSelectTrailingWhitespaceEnabled:!v5];
  }
}

- (BOOL)smartInsertDeleteEnabled
{
  return (*(unsigned __int8 *)(*((void *)self->_private->page.m_ptr + 14) + 703) >> 2) & 1;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)continuousSpellCheckingEnabled
{
  if (byte_1EB3A96CB != continuousSpellCheckingEnabled)
  {
    byte_1EB3A96CB = continuousSpellCheckingEnabled;
    if ([(WebView *)self isContinuousSpellCheckingEnabled])
    {
      uint64_t v4 = objc_opt_class();
      [v4 _preflightSpellChecker];
    }
    else
    {
      BOOL v5 = [(WebView *)self mainFrame];
      [(WebFrame *)v5 _unmarkAllMisspellings];
    }
  }
}

- (BOOL)isContinuousSpellCheckingEnabled
{
  return byte_1EB3A96CB && [(WebView *)self _continuousCheckingAllowed];
}

- (NSUndoManager)undoManager
{
  if (!self->_private->allowsUndo) {
    return 0;
  }
  id v3 = [(WebView *)self _editingDelegateForwarder];
  return (NSUndoManager *)[v3 undoManagerForWebView:self];
}

- (void)registerForEditingDelegateNotification:(id)a3 selector:(SEL)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  if (objc_opt_respondsToSelector())
  {
    id editingDelegate = self->_private->editingDelegate;
    [v7 addObserver:editingDelegate selector:a4 name:a3 object:self];
  }
}

- (void)setEditingDelegate:(id)editingDelegate
{
  if (self->_private->editingDelegate != editingDelegate)
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_private->editingDelegate name:@"WebViewDidBeginEditingNotification" object:self];
    [v5 removeObserver:self->_private->editingDelegate name:@"WebViewDidChangeNotification" object:self];
    [v5 removeObserver:self->_private->editingDelegate name:@"WebViewDidEndEditingNotification" object:self];
    [v5 removeObserver:self->_private->editingDelegate name:@"WebViewDidChangeTypingStyleNotification" object:self];
    [v5 removeObserver:self->_private->editingDelegate name:@"WebViewDidChangeSelectionNotification" object:self];
    self->_private->id editingDelegate = editingDelegate;
    uint64_t v6 = self->_private;
    m_ptr = v6->editingDelegateForwarder.m_ptr;
    v6->editingDelegateForwarder.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [(WebView *)self registerForEditingDelegateNotification:@"WebViewDidBeginEditingNotification" selector:sel_webViewDidBeginEditing_];
    [(WebView *)self registerForEditingDelegateNotification:@"WebViewDidChangeNotification" selector:sel_webViewDidChange_];
    [(WebView *)self registerForEditingDelegateNotification:@"WebViewDidEndEditingNotification" selector:sel_webViewDidEndEditing_];
    [(WebView *)self registerForEditingDelegateNotification:@"WebViewDidChangeTypingStyleNotification" selector:sel_webViewDidChangeTypingStyle_];
    [(WebView *)self registerForEditingDelegateNotification:@"WebViewDidChangeSelectionNotification" selector:sel_webViewDidChangeSelection_];
  }
}

- (id)editingDelegate
{
  return self->_private->editingDelegate;
}

- (DOMCSSStyleDeclaration)styleDeclarationWithText:(NSString *)text
{
  uint64_t v4 = (DOMCSSStyleDeclaration *)objc_msgSend((id)objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "DOMDocument"), "createCSSStyleDeclaration");
  [(DOMCSSStyleDeclaration *)v4 setCssText:text];
  return v4;
}

- (BOOL)isAutomaticQuoteSubstitutionEnabled
{
  return 0;
}

- (BOOL)isAutomaticLinkDetectionEnabled
{
  return 0;
}

- (BOOL)isAutomaticDashSubstitutionEnabled
{
  return 0;
}

- (BOOL)isAutomaticTextReplacementEnabled
{
  return 0;
}

- (BOOL)isAutomaticSpellingCorrectionEnabled
{
  return 0;
}

- (void)replaceSelectionWithNode:(DOMNode *)node
{
  id v4 = [(WebView *)self _selectedOrMainFrame];
  [v4 _replaceSelectionWithNode:node selectReplacement:1 smartReplace:0 matchStyle:0];
}

- (void)replaceSelectionWithText:(NSString *)text
{
  id v4 = [(WebView *)self _selectedOrMainFrame];
  [v4 _replaceSelectionWithText:text selectReplacement:1 smartReplace:0];
}

- (void)replaceSelectionWithMarkupString:(NSString *)markupString
{
  id v4 = [(WebView *)self _selectedOrMainFrame];
  [v4 _replaceSelectionWithMarkupString:markupString baseURLString:0 selectReplacement:1 smartReplace:0];
}

- (void)replaceSelectionWithArchive:(WebArchive *)archive
{
  id v4 = objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_dataSource");
  [v4 _replaceSelectionWithArchive:archive selectReplacement:1];
}

- (void)deleteSelection
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)(v2[1] + 8);
    if (v4)
    {
      uint64_t v5 = WebCore::Document::editor(*(WebCore::Document **)(v4 + 296));
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "frameView"), "documentView"), "_canSmartCopyOrDelete");
      MEMORY[0x1F4172C90](v5, v6, 9);
    }
  }
}

- (void)applyStyle:(DOMCSSStyleDeclaration *)style
{
  uint64_t v4 = [(WebView *)self _selectedOrMainFrame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      (*(void (**)(WebCore::MutableStyleProperties **__return_ptr))(*(void *)style->super._internal + 160))(&v9);
      WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      WebCore::Editor::applyStyle();
      uint64_t v6 = v9;
      uint64_t v9 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 1)
        {
          WebCore::MutableStyleProperties::~MutableStyleProperties(v6);
          WTF::fastFree(v7, v8);
        }
        else
        {
          --*(_DWORD *)v6;
        }
      }
    }
  }
}

- (void)_performResponderOperation:(SEL)a3 with:(id)a4
{
  if (-[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered == 1)
  {
    id v6 = [(WAKResponder *)self nextResponder];
    [v6 tryToPerform:a3 with:a4];
  }
  else
  {
    id v7 = [(WebView *)self _responderForResponderOperations];
    -[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered = 1;
    [v7 tryToPerform:a3 with:a4];
    -[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered = 0;
  }
}

- (void)alignCenter:(id)sender
{
}

- (void)alignJustified:(id)sender
{
}

- (void)alignLeft:(id)sender
{
}

- (void)alignRight:(id)sender
{
}

- (void)capitalizeWord:(id)a3
{
}

- (void)centerSelectionInVisibleArea:(id)a3
{
}

- (void)changeAttributes:(id)sender
{
}

- (void)changeBaseWritingDirection:(id)a3
{
}

- (void)changeBaseWritingDirectionToLTR:(id)a3
{
}

- (void)changeBaseWritingDirectionToRTL:(id)a3
{
}

- (void)changeColor:(id)sender
{
}

- (void)changeDocumentBackgroundColor:(id)sender
{
}

- (void)changeFont:(id)sender
{
}

- (void)changeSpelling:(id)a3
{
}

- (void)checkSpelling:(id)sender
{
}

- (void)complete:(id)a3
{
}

- (void)copy:(id)sender
{
}

- (void)copyFont:(id)sender
{
}

- (void)cut:(id)sender
{
}

- (void)delete:(id)sender
{
}

- (void)deleteBackward:(id)a3
{
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
}

- (void)deleteForward:(id)a3
{
}

- (void)deleteToBeginningOfLine:(id)a3
{
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
}

- (void)deleteToEndOfLine:(id)a3
{
}

- (void)deleteToEndOfParagraph:(id)a3
{
}

- (void)deleteToMark:(id)a3
{
}

- (void)deleteWordBackward:(id)a3
{
}

- (void)deleteWordForward:(id)a3
{
}

- (void)ignoreSpelling:(id)a3
{
}

- (void)indent:(id)a3
{
}

- (void)insertBacktab:(id)a3
{
}

- (void)insertLineBreak:(id)a3
{
}

- (void)insertNewline:(id)a3
{
}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
}

- (void)insertParagraphSeparator:(id)a3
{
}

- (void)insertTab:(id)a3
{
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
}

- (void)lowercaseWord:(id)a3
{
}

- (void)makeBaseWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeBaseWritingDirectionRightToLeft:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)moveBackward:(id)a3
{
}

- (void)moveBackwardAndModifySelection:(id)a3
{
}

- (void)moveDown:(id)a3
{
}

- (void)moveDownAndModifySelection:(id)a3
{
}

- (void)moveForward:(id)a3
{
}

- (void)moveForwardAndModifySelection:(id)a3
{
}

- (void)moveLeft:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
}

- (void)moveRight:(id)a3
{
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfDocument:(id)a3
{
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfLine:(id)a3
{
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfParagraph:(id)a3
{
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfSentence:(id)sender
{
}

- (void)moveToBeginningOfSentenceAndModifySelection:(id)sender
{
}

- (void)moveToEndOfDocument:(id)a3
{
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveToEndOfLine:(id)a3
{
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToEndOfParagraph:(id)a3
{
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToEndOfSentence:(id)sender
{
}

- (void)moveToEndOfSentenceAndModifySelection:(id)sender
{
}

- (void)moveToLeftEndOfLine:(id)a3
{
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToRightEndOfLine:(id)a3
{
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveUp:(id)a3
{
}

- (void)moveUpAndModifySelection:(id)a3
{
}

- (void)moveWordBackward:(id)a3
{
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
}

- (void)moveWordForward:(id)a3
{
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
}

- (void)moveWordLeft:(id)a3
{
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
}

- (void)moveWordRight:(id)a3
{
}

- (void)moveWordRightAndModifySelection:(id)a3
{
}

- (void)orderFrontSubstitutionsPanel:(id)a3
{
}

- (void)outdent:(id)a3
{
}

- (void)overWrite:(id)sender
{
}

- (void)pageDown:(id)a3
{
}

- (void)pageDownAndModifySelection:(id)a3
{
}

- (void)pageUp:(id)a3
{
}

- (void)pageUpAndModifySelection:(id)a3
{
}

- (void)paste:(id)sender
{
}

- (void)pasteAsPlainText:(id)sender
{
}

- (void)pasteAsRichText:(id)sender
{
}

- (void)pasteFont:(id)sender
{
}

- (void)performFindPanelAction:(id)sender
{
}

- (void)scrollLineDown:(id)a3
{
}

- (void)scrollLineUp:(id)a3
{
}

- (void)scrollPageDown:(id)a3
{
}

- (void)scrollPageUp:(id)a3
{
}

- (void)scrollToBeginningOfDocument:(id)a3
{
}

- (void)scrollToEndOfDocument:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)selectLine:(id)a3
{
}

- (void)selectParagraph:(id)a3
{
}

- (void)selectSentence:(id)sender
{
}

- (void)selectToMark:(id)a3
{
}

- (void)selectWord:(id)a3
{
}

- (void)setMark:(id)a3
{
}

- (void)showGuessPanel:(id)sender
{
}

- (void)startSpeaking:(id)sender
{
}

- (void)stopSpeaking:(id)sender
{
}

- (void)subscript:(id)a3
{
}

- (void)superscript:(id)a3
{
}

- (void)swapWithMark:(id)a3
{
}

- (void)takeFindStringFromSelection:(id)a3
{
}

- (void)toggleBaseWritingDirection:(id)a3
{
}

- (void)transpose:(id)a3
{
}

- (void)underline:(id)a3
{
}

- (void)unscript:(id)a3
{
}

- (void)uppercaseWord:(id)a3
{
}

- (void)yank:(id)a3
{
}

- (void)yankAndSelect:(id)a3
{
}

- (void)clearText:(id)a3
{
}

- (void)toggleBold:(id)a3
{
}

- (void)toggleItalic:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (void)insertDictationPhrases:(id)a3 metadata:(id)a4
{
  uint64_t v5 = [(WebView *)self _selectedOrMainFrame];
  if (v5)
  {
    uint64_t v6 = *(void *)(v5[1] + 8);
    if (v6)
    {
      WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
      vectorForDictationPhrasesArray((NSArray *)a3, (unsigned int *)&v15);
      WebCore::Editor::insertDictationPhrases();
      uint64_t v8 = v15;
      if (v17)
      {
        uint64_t v9 = (WTF *)((char *)v15 + 16 * v17);
        do
        {
          uint64_t v10 = *((unsigned int *)v8 + 3);
          if (v10)
          {
            uint64_t v11 = *(WTF::StringImpl ***)v8;
            uint64_t v12 = 8 * v10;
            do
            {
              uint64_t v13 = *v11;
              WebCore::Node *v11 = 0;
              if (v13)
              {
                if (*(_DWORD *)v13 == 2) {
                  WTF::StringImpl::destroy(v13, v7);
                }
                else {
                  *(_DWORD *)v13 -= 2;
                }
              }
              ++v11;
              v12 -= 8;
            }
            while (v12);
          }
          uint64_t v14 = *(WTF **)v8;
          if (*(void *)v8)
          {
            *(void *)uint64_t v8 = 0;
            *((_DWORD *)v8 + 2) = 0;
            WTF::fastFree(v14, v7);
          }
          uint64_t v8 = (WTF *)((char *)v8 + 16);
        }
        while (v8 != v9);
        uint64_t v8 = v15;
      }
      if (v8)
      {
        uint64_t v15 = 0;
        int v16 = 0;
        WTF::fastFree(v8, v7);
      }
    }
  }
}

- (void)insertText:(id)a3
{
}

- (id)typingAttributes
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::fontAttributesAtSelectionStart(v10, v4);
  WebCore::FontAttributes::createDictionary((uint64_t *)&v11, (WebCore::FontAttributes *)v10);
  uint64_t v5 = v11;
  uint64_t v11 = 0;
  CFTypeRef v7 = (id)CFMakeCollectable(v5);
  uint64_t v8 = v11;
  uint64_t v11 = 0;
  if (v8) {
    CFRelease(v8);
  }
  WebCore::FontAttributes::~FontAttributes((WebCore::FontAttributes *)v10, v6);
  return (id)v7;
}

- (void)_insertNewlineInQuotedContent
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  [v2 _insertParagraphSeparatorInQuotedContent];
}

- (void)_replaceSelectionWithNode:(id)a3 matchStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WebView *)self _selectedOrMainFrame];
  [v6 _replaceSelectionWithNode:a3 selectReplacement:1 smartReplace:0 matchStyle:v4];
}

- (BOOL)_selectionIsCaret
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3) {
      LOBYTE(v2) = *(unsigned char *)(*(void *)(*(void *)(v3 + 296) + 3096) + 153) == 1;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (BOOL)_selectionIsAll
{
  id v2 = [(WebView *)self _selectedOrMainFrame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(*(void *)(v3 + 296) + 3096) + 56;
  return MEMORY[0x1F4175118](v4, 0);
}

- (void)_simplifyMarkup:(id)a3 endNode:(id)a4
{
  id v6 = [(WebView *)self mainFrame];
  if (v6)
  {
    if (a3)
    {
      m_ptr = v6->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        uint64_t v8 = *((void *)a3 + 2);
        uint64_t v9 = *(WebCore::Document **)(*(void *)(v8 + 48) + 8);
        if (v9 == *((WebCore::Document **)m_ptr + 37))
        {
          uint64_t v10 = WebCore::Document::editor(v9);
          if (a4)
          {
            uint64_t v11 = *((void *)a4 + 2);
            uint64_t v12 = v8;
          }
          else
          {
            uint64_t v11 = 0;
            uint64_t v12 = v8;
          }
          MEMORY[0x1F4172B80](v10, v12, v11);
        }
      }
    }
  }
}

+ (void)_setCacheModel:(unint64_t)a3
{
  if (byte_1EB3A96CC == 1 && qword_1EB3A96E8 == a3) {
    return;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F18D78], "sharedURLCache"), "_CFURLCache");
  uint64_t v5 = (void *)_CFURLCacheCopyCacheDirectory();
  if (!v5)
  {
    uint64_t v5 = NSHomeDirectory();
    if (v5)
    {
      id v6 = v5;
      CFRetain(v5);
      uint64_t v5 = v6;
    }
  }
  CFTypeRef cf = v5;
  if ((byte_1EB3A96CD & 1) == 0)
  {
    qword_1EB3A96F0 = (unint64_t)WTF::ramSize((WTF *)v5) >> 20;
    byte_1EB3A96CD = 1;
  }
  CFTypeRef v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfFileSystemForPath:error:", cf, 0);
  unint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F283A0]), "unsignedLongLongValue");
  uint64_t v9 = (void *)[MEMORY[0x1E4F18D78] sharedURLCache];
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        if ((unint64_t)qword_1EB3A96F0 <= 0x3FF) {
          unint64_t v17 = 0x800000;
        }
        else {
          unint64_t v17 = 0x1000000;
        }
        if (v8 >> 27 <= 0x7C)
        {
          if (v8 >> 26 <= 0x7C)
          {
            if (v8 >> 25 <= 0x7C)
            {
              if (v8 >> 24 <= 0x7C)
              {
                if (v8 >> 23 <= 0x7C) {
                  unint64_t v16 = 52428800;
                }
                else {
                  unint64_t v16 = 78643200;
                }
              }
              else
              {
                unint64_t v16 = 104857600;
              }
            }
            else
            {
              unint64_t v16 = 131072000;
            }
          }
          else
          {
            unint64_t v16 = 157286400;
          }
        }
        else
        {
          unint64_t v16 = 183500800;
        }
        if ((unint64_t)qword_1EB3A96F0 <= 0x3FF) {
          uint64_t v13 = 25165824;
        }
        else {
          uint64_t v13 = 50331648;
        }
        uint64_t v11 = 0x404E000000000000;
      }
      else
      {
        unint64_t v17 = 0;
        unint64_t v16 = 0;
        uint64_t v13 = 0;
      }
      goto LABEL_53;
    }
    unint64_t v12 = qword_1EB3A96F0;
    if ((unint64_t)qword_1EB3A96F0 <= 0xFFF && (unint64_t)qword_1EB3A96F0 <= 0x7FF)
    {
      if ((unint64_t)qword_1EB3A96F0 <= 0x3FF)
      {
        if ((unint64_t)qword_1EB3A96F0 <= 0x1FF) {
          unint64_t v17 = 0x80000;
        }
        else {
          unint64_t v17 = 0x100000;
        }
      }
      else
      {
        unint64_t v17 = 0x200000;
      }
    }
    else
    {
      unint64_t v17 = 0x400000;
    }
    uint64_t v14 = 41943040;
    uint64_t v15 = 20971520;
    if (v8 >> 25 > 0x7C) {
      uint64_t v15 = 31457280;
    }
    if (v8 >> 26 <= 0x7C) {
      uint64_t v14 = v15;
    }
    if (v8 >> 27 <= 0x7C) {
      unint64_t v16 = v14;
    }
    else {
      unint64_t v16 = 52428800;
    }
  }
  else
  {
    unint64_t v16 = [v9 diskCapacity];
    unint64_t v17 = 0;
    unint64_t v12 = qword_1EB3A96F0;
  }
  if (v12 <= 0x3FF) {
    uint64_t v13 = 12582912;
  }
  else {
    uint64_t v13 = 25165824;
  }
LABEL_53:
  char v18 = (WebCore::MemoryCache *)[v10 diskCapacity];
  if (v16 <= (unint64_t)v18) {
    unint64_t v16 = (unint64_t)v18;
  }
  uint64_t v19 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton(v18);
  BOOL v20 = (WebCore::BackForwardCache *)WebCore::MemoryCache::setCapacities(v19);
  *((void *)v19 + 2) = v11;
  uint64_t v21 = (WebCore::BackForwardCache *)WebCore::BackForwardCache::singleton(v20);
  WebCore::BackForwardCache::setMaxSize(v21);
  unint64_t v22 = [v10 memoryCapacity];
  if (v17 <= v22) {
    unint64_t v17 = v22;
  }
  if ([v10 _CFURLCache]) {
    CFURLCacheSetMemoryCapacity();
  }
  else {
    [v10 setMemoryCapacity:v17];
  }
  [v10 setDiskCapacity:v16];
  +[WebView _setTileCacheLayerPoolCapacity:v13];
  qword_1EB3A96E8 = a3;
  byte_1EB3A96CC = 1;
  if (cf)
  {
    CFRelease(cf);
  }
}

+ (unint64_t)_cacheModel
{
  return qword_1EB3A96E8;
}

+ (BOOL)shouldIncludeInWebKitStatistics
{
  return 0;
}

- (BOOL)_becomingFirstResponderFromOutside
{
  return self->_private->becomingFirstResponderFromOutside;
}

- (void)_addObject:(id)a3 forIdentifier:(unint64_t)a4
{
  CFTypeRef v7 = self->_private;
  uint64_t m_table = (uint64_t)v7->identifierMap.m_impl.var0.m_table;
  if (m_table && *(_DWORD *)(m_table - 12))
  {
    p_identifierMap = (uint64_t *)&v7->identifierMap;
LABEL_6:
    int v10 = *(_DWORD *)(m_table - 8);
    goto LABEL_7;
  }
  CFRetain(self);
  p_identifierMap = (uint64_t *)&self->_private->identifierMap;
  uint64_t m_table = *p_identifierMap;
  if (*p_identifierMap) {
    goto LABEL_6;
  }
  WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, 8u);
  uint64_t m_table = *p_identifierMap;
  if (*p_identifierMap) {
    goto LABEL_6;
  }
  int v10 = 0;
LABEL_7:
  unint64_t v11 = (~(a4 << 32) + a4) ^ ((~(a4 << 32) + a4) >> 22);
  unint64_t v12 = 9 * ((v11 + ~(v11 << 13)) ^ ((v11 + ~(v11 << 13)) >> 8));
  unint64_t v13 = (v12 ^ (v12 >> 15)) + ~((v12 ^ (v12 >> 15)) << 27);
  unsigned int v14 = v10 & ((v13 >> 31) ^ v13);
  uint64_t v15 = (unint64_t *)(m_table + 16 * v14);
  unint64_t v16 = *v15;
  if (!*v15)
  {
LABEL_15:
    unint64_t *v15 = a4;
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v19 = (const void *)v15[1];
    v15[1] = (unint64_t)a3;
    if (v19) {
      CFRelease(v19);
    }
    if (*p_identifierMap)
    {
      ++*(_DWORD *)(*p_identifierMap - 12);
      uint64_t v20 = *p_identifierMap;
      if (*p_identifierMap) {
        goto LABEL_21;
      }
    }
    else
    {
      MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
      uint64_t v20 = *p_identifierMap;
      if (*p_identifierMap)
      {
LABEL_21:
        uint64_t v21 = (*(_DWORD *)(v20 - 16) + *(_DWORD *)(v20 - 12));
        unint64_t v22 = *(unsigned int *)(v20 - 4);
        if (v22 <= 0x400) {
          goto LABEL_22;
        }
        goto LABEL_33;
      }
    }
    uint64_t v21 = *(unsigned int *)(v20 - 16);
    unint64_t v22 = *(unsigned int *)(v20 - 4);
    if (v22 <= 0x400)
    {
LABEL_22:
      if (3 * v22 > 4 * v21) {
        return;
      }
      if (!v22)
      {
        unsigned int v23 = 8;
LABEL_36:
        WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, v23);
        return;
      }
LABEL_35:
      unsigned int v23 = v22 << (6 * *(_DWORD *)(v20 - 12) >= (2 * v22));
      goto LABEL_36;
    }
LABEL_33:
    if (v22 > 2 * v21) {
      return;
    }
    goto LABEL_35;
  }
  unint64_t v17 = 0;
  int v18 = 1;
  while (v16 != a4)
  {
    if (v16 == -1) {
      unint64_t v17 = v15;
    }
    unsigned int v14 = (v14 + v18) & v10;
    uint64_t v15 = (unint64_t *)(m_table + 16 * v14);
    unint64_t v16 = *v15;
    ++v18;
    if (!*v15)
    {
      if (v17)
      {
        unint64_t *v17 = 0;
        v17[1] = 0;
        --*(_DWORD *)(*p_identifierMap - 16);
        uint64_t v15 = v17;
      }
      goto LABEL_15;
    }
  }
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v24 = (const void *)v15[1];
  v15[1] = (unint64_t)a3;
  if (v24)
  {
    CFRelease(v24);
  }
}

- (id)_objectForIdentifier:(unint64_t)a3
{
  m_tableForLLDB = self->_private->identifierMap.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB) {
    return 0;
  }
  unsigned int v4 = *(m_tableForLLDB - 2);
  unint64_t v5 = (~(a3 << 32) + a3) ^ ((~(a3 << 32) + a3) >> 22);
  unint64_t v6 = 9 * ((v5 + ~(v5 << 13)) ^ ((v5 + ~(v5 << 13)) >> 8));
  unint64_t v7 = (v6 ^ (v6 >> 15)) + ~((v6 ^ (v6 >> 15)) << 27);
  uint64_t v8 = v4 & ((v7 >> 31) ^ v7);
  uint64_t v9 = *(void *)&m_tableForLLDB[4 * v8];
  if (v9 != a3)
  {
    int v10 = 1;
    while (v9)
    {
      uint64_t v8 = (v8 + v10) & v4;
      uint64_t v9 = *(void *)&m_tableForLLDB[4 * v8];
      ++v10;
      if (v9 == a3) {
        goto LABEL_6;
      }
    }
    return 0;
  }
LABEL_6:
  unint64_t v11 = (char *)&m_tableForLLDB[4 * v8];
  unint64_t v12 = (const void *)*((void *)v11 + 1);
  if (v12)
  {
    CFRetain(*((CFTypeRef *)v11 + 1));
    CFRelease(v12);
  }
  return (id)v12;
}

- (void)_removeObjectForIdentifier:(unint64_t)a3
{
  unsigned int v4 = self->_private;
  m_tableForLLDB = v4->identifierMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    unsigned int v6 = *(m_tableForLLDB - 2);
    unint64_t v7 = (~(a3 << 32) + a3) ^ ((~(a3 << 32) + a3) >> 22);
    unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    uint64_t v10 = v6 & ((v9 >> 31) ^ v9);
    uint64_t v11 = *(void *)&m_tableForLLDB[4 * v10];
    if (v11 == a3)
    {
LABEL_6:
      if (v10 != *(m_tableForLLDB - 1))
      {
        p_identifierMap = (uint64_t *)&v4->identifierMap;
        unsigned int v14 = &m_tableForLLDB[4 * v10];
        uint64_t v15 = (const void *)*((void *)v14 + 1);
        *(void *)unsigned int v14 = -1;
        *((void *)v14 + 1) = 0;
        if (v15) {
          CFRelease(v15);
        }
        ++*(_DWORD *)(*p_identifierMap - 16);
        if (*p_identifierMap)
        {
          --*(_DWORD *)(*p_identifierMap - 12);
          uint64_t v16 = *p_identifierMap;
          if (!*p_identifierMap) {
            goto LABEL_20;
          }
        }
        else
        {
          MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
          uint64_t v16 = *p_identifierMap;
          if (!*p_identifierMap) {
            goto LABEL_20;
          }
        }
        unsigned int v17 = 6 * *(_DWORD *)(v16 - 12);
        unsigned int v18 = *(_DWORD *)(v16 - 4);
        if (v17 < v18 && v18 >= 9) {
          WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, v18 >> 1);
        }
      }
    }
    else
    {
      int v12 = 1;
      while (v11)
      {
        uint64_t v10 = (v10 + v12) & v6;
        uint64_t v11 = *(void *)&m_tableForLLDB[4 * v10];
        ++v12;
        if (v11 == a3) {
          goto LABEL_6;
        }
      }
    }
  }
LABEL_20:
  uint64_t v20 = self->_private->identifierMap.m_impl.var0.m_tableForLLDB;
  if (!v20 || !*(v20 - 3))
  {
    uint64_t v21 = self;
  }
}

- (void)_retrieveKeyboardUIModeFromPreferences:(id)a3
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  Boolean keyExistsAndHasValidFormat = 0;
  self->_private->_keyboardUIMode = (CFPreferencesGetAppIntegerValue(@"AppleKeyboardUIMode", v4, &keyExistsAndHasValidFormat) >> 1) & 1;
}

- (int)_keyboardUIMode
{
  id v2 = self->_private;
  if (v2->_keyboardUIModeAccessed) {
    return v2->_keyboardUIMode;
  }
  v2->_keyboardUIModeAccessed = 1;
  [(WebView *)self _retrieveKeyboardUIModeFromPreferences:0];
  unint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__retrieveKeyboardUIModeFromPreferences_ name:WebPreferencesChangedInternalNotification[0] object:0];
  return self->_private->_keyboardUIMode;
}

- (void)_mainCoreFrame
{
  id v2 = self->_private;
  if (!v2) {
    return 0;
  }
  m_ptr = v2->page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  CFStringRef v4 = (unsigned char *)*((void *)m_ptr + 20);
  if (v4[144]) {
    return 0;
  }
  else {
    return v4;
  }
}

- (id)_selectedOrMainFrame
{
  id result = [(WebView *)self selectedFrame];
  if (!result)
  {
    return [(WebView *)self mainFrame];
  }
  return result;
}

- (void)_clearCredentials
{
  id v2 = [(WebView *)self _mainCoreFrame];
  if (v2)
  {
    uint64_t v3 = (uint64_t (***)(void))WebCore::FrameLoader::networkingContext(v2[35]);
    if (v3)
    {
      uint64_t v4 = (**v3)(v3) + 96;
      MEMORY[0x1F416ED10](v4);
    }
  }
}

- (BOOL)_needsOneShotDrawingSynchronization
{
  return self->_private->needsOneShotDrawingSynchronization;
}

- (void)_setNeedsOneShotDrawingSynchronization:(BOOL)a3
{
  self->_private->needsOneShotDrawingSynchronization = a3;
}

- (void)_scheduleUpdateRendering
{
  id v2 = self->_private;
  if (v2->closing) {
    return;
  }
  if (!v2->renderingUpdateScheduler.__ptr_.__value_)
  {
    uint64_t v4 = WTF::fastMalloc((WTF *)0x30);
    *(void *)uint64_t v4 = 0;
    *(_DWORD *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = self;
    *(void *)(v4 + 24) = 0;
    unint64_t v5 = (WebCore::RunLoopObserver **)(v4 + 24);
    *(void *)(v4 + 32) = 0;
    unsigned int v6 = (WebCore::RunLoopObserver **)(v4 + 32);
    *(_DWORD *)(v4 + 39) = 0;
    uint64_t v8 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v8 = 1;
    *(void *)(v8 + 8) = v4;
    unint64_t v9 = *(unsigned int **)v4;
    *(void *)uint64_t v4 = v8;
    if (v9)
    {
      if (atomic_fetch_add((atomic_uint *volatile)v9, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v9);
        WTF::fastFree((WTF *)v9, v7);
        uint64_t v8 = *(void *)v4;
        if (!*(void *)v4)
        {
LABEL_7:
          uint64_t v10 = WTF::fastMalloc((WTF *)0x18);
          uint64_t v11 = (void *)WTF::fastMalloc((WTF *)0x10);
          void *v11 = &unk_1F3C7B3A0;
          v11[1] = v8;
          *(void *)uint64_t v10 = v11;
          *(_WORD *)(v10 + 8) = 256;
          *(void *)(v10 + 16) = 0;
          int v12 = *v5;
          void *v5 = (WebCore::RunLoopObserver *)v10;
          if (v12)
          {
            WebCore::RunLoopObserver::~RunLoopObserver(v12);
            WTF::fastFree(v13, v14);
          }
          uint64_t v15 = *(void *)v4;
          if (!*(void *)v4)
          {
            uint64_t v15 = WTF::fastCompactMalloc((WTF *)0x10);
            *(_DWORD *)uint64_t v15 = 1;
            *(void *)(v15 + 8) = v4;
            unsigned int v17 = *(unsigned int **)v4;
            *(void *)uint64_t v4 = v15;
            if (v17)
            {
              if (atomic_fetch_add((atomic_uint *volatile)v17, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, v17);
                WTF::fastFree((WTF *)v17, v16);
                uint64_t v15 = *(void *)v4;
                if (!*(void *)v4) {
                  goto LABEL_14;
                }
              }
              else
              {
                uint64_t v15 = *(void *)v4;
                if (!*(void *)v4)
                {
LABEL_14:
                  uint64_t v18 = WTF::fastMalloc((WTF *)0x18);
                  uint64_t v19 = (void *)WTF::fastMalloc((WTF *)0x10);
                  void *v19 = &unk_1F3C7B3C8;
                  v19[1] = v15;
                  *(void *)uint64_t v18 = v19;
                  *(_WORD *)(v18 + 8) = 1280;
                  *(void *)(v18 + 16) = 0;
                  uint64_t v21 = *v6;
                  void *v6 = (WebCore::RunLoopObserver *)v18;
                  if (v21)
                  {
                    WebCore::RunLoopObserver::~RunLoopObserver(v21);
                    WTF::fastFree(v22, v23);
                  }
                  uint64_t v24 = self->_private;
                  value = (WTF *)v24->renderingUpdateScheduler.__ptr_.__value_;
                  v24->renderingUpdateScheduler.__ptr_.__value_ = (WebViewRenderingUpdateScheduler *)v4;
                  if (value) {
                    WebViewRenderingUpdateScheduler::operator delete(value, v20);
                  }
                  goto LABEL_18;
                }
              }
            }
          }
          atomic_fetch_add((atomic_uint *volatile)v15, 1u);
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v8 = *(void *)v4;
        if (!*(void *)v4) {
          goto LABEL_7;
        }
      }
    }
    atomic_fetch_add((atomic_uint *volatile)v8, 1u);
    goto LABEL_7;
  }
LABEL_18:
  uint64_t v26 = self->_private->renderingUpdateScheduler.__ptr_.__value_;
  if (*((unsigned char *)v26 + 40)) {
    *((unsigned char *)v26 + 41) = 1;
  }
  uint64_t v27 = *((void *)v26 + 3);
  MEMORY[0x1F416E2A0](v27, 0, 5);
}

- (void)_updateRendering
{
  [(WebView *)self _synchronizeCustomFixedPositionLayoutRect];
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::updateRendering((WebCore::Page *)m_ptr);
    uint64_t v4 = self->_private->page.m_ptr;
    MEMORY[0x1F4172718](v4, 0);
  }
}

- (void)_willStartRenderingUpdateDisplay
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F4172860](m_ptr, a2);
  }
}

- (void)_didCompleteRenderingUpdateDisplay
{
  uint64_t v3 = self->_private;
  m_ptr = (WebCore::Page *)v3->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::didCompleteRenderingUpdateDisplay(m_ptr);
    uint64_t v3 = self->_private;
  }
  value = v3->renderingUpdateScheduler.__ptr_.__value_;
  if (value)
  {
    *((unsigned char *)value + 42) = 0;
    uint64_t v6 = *((void *)value + 4);
    MEMORY[0x1F416E2A0](v6, 0, 5);
  }
}

- (void)_didCompleteRenderingFrame
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F4172770](m_ptr, a2);
  }
}

- (BOOL)_flushCompositingChanges
{
  id v2 = [(WebView *)self _mainCoreFrame];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (WebCore::LocalFrameView *)v2[36];
  if (!v3) {
    return 1;
  }
  return WebCore::LocalFrameView::flushCompositingStateIncludingSubframes(v3);
}

- (void)_scheduleRenderingUpdateForPendingTileCacheRepaint
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::Page::scheduleRenderingUpdate();
    if (*(_DWORD *)m_ptr == 1)
    {
      uint64_t v3 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
      WTF::fastFree(v3, v4);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (void)_enterVideoFullscreenForVideoElement:(NakedPtr<WebCore:(unsigned int)a4 :HTMLVideoElement>)a3 mode:
{
  uint64_t v4 = *(void *)&a4;
  m_ptr = self->_private->fullscreenController.m_ptr;
  if (m_ptr)
  {
    [m_ptr videoElement];
    if (cf == *(CFTypeRef *)a3.var0)
    {
      unint64_t v9 = self->_private->fullscreenController.m_ptr;
      CFTypeRef v25 = cf;
      uint64_t v10 = &v25;
LABEL_12:
      objc_msgSend(v9, "setVideoElement:", v10, v23);
      return;
    }
    uint64_t v8 = self->_private->fullscreenController.m_ptr;
    if (v8)
    {
      [v8 videoElement];
      uint64_t v8 = (void *)cf;
    }
    else
    {
      CFTypeRef cf = 0;
    }
    WebCore::HTMLMediaElement::exitFullscreen((WebCore::HTMLMediaElement *)v8);
    uint64_t v11 = self->_private;
    int v12 = v11->fullscreenController.m_ptr;
    CFTypeRef cf = v12;
    v11->fullscreenController.m_ptr = 0;
    m_CGSize size = v11->fullscreenControllersExiting.m_size;
    if (m_size == v11->fullscreenControllersExiting.m_capacity)
    {
      unsigned int v14 = WTF::Vector<WTF::RetainPtr<WebVideoFullscreenController>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v11->fullscreenControllersExiting, m_size + 1, (unint64_t)&cf);
      uint64_t v15 = v11->fullscreenControllersExiting.m_size;
      m_buffer = v11->fullscreenControllersExiting.m_buffer;
      uint64_t v17 = *(void *)v14;
      *(void *)unsigned int v14 = 0;
      m_buffer[v15] = v17;
      CFTypeRef v18 = cf;
      v11->fullscreenControllersExiting.m_CGSize size = v15 + 1;
      CFTypeRef cf = 0;
      if (v18) {
        CFRelease(v18);
      }
      unint64_t v9 = self->_private->fullscreenController.m_ptr;
      if (v9) {
        goto LABEL_11;
      }
    }
    else
    {
      *((void *)v11->fullscreenControllersExiting.m_buffer + m_size) = v12;
      v11->fullscreenControllersExiting.m_CGSize size = m_size + 1;
      unint64_t v9 = self->_private->fullscreenController.m_ptr;
      if (v9)
      {
LABEL_11:
        uint64_t v23 = *(void *)a3.var0;
        uint64_t v10 = (CFTypeRef *)&v23;
        goto LABEL_12;
      }
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4FB6200]);
  uint64_t v20 = self->_private;
  uint64_t v21 = v20->fullscreenController.m_ptr;
  v20->fullscreenController.m_ptr = v19;
  if (v21) {
    CFRelease(v21);
  }
  unint64_t v22 = self->_private->fullscreenController.m_ptr;
  uint64_t v24 = *(void *)a3.var0;
  [v22 setVideoElement:&v24];
  objc_msgSend(self->_private->fullscreenController.m_ptr, "enterFullscreen:mode:", objc_msgSend((id)objc_msgSend((id)-[WebView window](self, "window"), "hostLayer"), "delegate"), v4);
}

- (void)_exitVideoFullscreen
{
  uint64_t v3 = self->_private;
  m_ptr = v3->fullscreenController.m_ptr;
  m_CGSize size = v3->fullscreenControllersExiting.m_size;
  if (!m_ptr)
  {
    if (!m_size) {
      return;
    }
LABEL_7:
    m_buffer = (CFTypeRef *)v3->fullscreenControllersExiting.m_buffer;
    m_ptr = (void *)*m_buffer;
    if (*m_buffer)
    {
      CFRetain(*m_buffer);
      uint64_t v3 = self->_private;
      m_buffer = (CFTypeRef *)v3->fullscreenControllersExiting.m_buffer;
      CFTypeRef v9 = *m_buffer;
      CFTypeRef *m_buffer = 0;
      if (v9)
      {
        CFRelease(v9);
        uint64_t v10 = m_buffer + 1;
        uint64_t v11 = v3->fullscreenControllersExiting.m_size;
        uint64_t v12 = (uint64_t)v3->fullscreenControllersExiting.m_buffer + 8 * v11;
        if (m_buffer + 1 == (CFTypeRef *)v12) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {
      CFTypeRef *m_buffer = 0;
    }
    uint64_t v10 = m_buffer + 1;
    uint64_t v11 = v3->fullscreenControllersExiting.m_size;
    uint64_t v12 = (uint64_t)v3->fullscreenControllersExiting.m_buffer + 8 * v11;
    if (m_buffer + 1 == (CFTypeRef *)v12) {
      goto LABEL_14;
    }
    do
    {
LABEL_13:
      *(v10 - 1) = *v10;
      *v10++ = 0;
    }
    while (v10 != (void *)v12);
LABEL_14:
    v3->fullscreenControllersExiting.m_CGSize size = v11 - 1;
    [m_ptr exitFullscreen];
    if (!m_ptr) {
      return;
    }
    goto LABEL_15;
  }
  if (m_size) {
    goto LABEL_7;
  }
  CFRetain(v3->fullscreenController.m_ptr);
  uint64_t v6 = self->_private;
  unint64_t v7 = v6->fullscreenController.m_ptr;
  v6->fullscreenController.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  [m_ptr exitFullscreen];
LABEL_15:
  CFRelease(m_ptr);
}

- (void)_getWebCoreDictationAlternatives:(void *)a3 fromTextAlternatives:(const void *)a4
{
  uint64_t v4 = *((unsigned int *)a4 + 3);
  if (v4)
  {
    uint64_t v6 = *(void *)a4 + 16;
    uint64_t v7 = 24 * v4;
    do
    {
      uint64_t v12 = WebCore::AlternativeTextUIController::addAlternatives();
      if (v12)
      {
        long long v14 = *(_OWORD *)(v6 - 16);
        uint64_t v15 = v12;
        uint64_t v13 = *((unsigned int *)a3 + 3);
        if (v13 == *((_DWORD *)a3 + 2))
        {
          uint64_t v8 = WTF::Vector<WebCore::DictationAlternative,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a3, v13 + 1, (unint64_t)&v14);
          uint64_t v9 = *(void *)a3 + 24 * *((unsigned int *)a3 + 3);
          long long v10 = *(_OWORD *)v8;
          uint64_t v11 = *((void *)v8 + 2);
        }
        else
        {
          uint64_t v9 = *(void *)a3 + 24 * v13;
          long long v10 = v14;
          uint64_t v11 = v15;
        }
        *(void *)(v9 + 16) = v11;
        *(_OWORD *)uint64_t v9 = v10;
        ++*((_DWORD *)a3 + 3);
      }
      v6 += 24;
      v7 -= 24;
    }
    while (v7);
  }
}

- (void)_removeDictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType
{
}

- (Vector<WTF::String,)_dictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType
{
  uint64_t v4 = v3;
  unint64_t v5 = (void *)[(id)WebCore::AlternativeTextUIController::alternativesForContext() alternativeStrings];
  uint64_t v6 = WTF::makeVector<WTF::String>(v5, v4);
  result.var1 = v7;
  result.var2 = HIDWORD(v7);
  result.var0 = (String *)v6;
  return result;
}

- (CGPoint)_convertPointFromRootView:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(WebView *)self bounds];
  double v6 = v5 - y;
  double v7 = x;
  result.double y = v6;
  result.CGFloat x = v7;
  return result;
}

- (CGRect)_convertRectFromRootView:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(WebView *)self bounds];
  double v8 = v7 - y - height;
  double v9 = x;
  double v10 = width;
  double v11 = height;
  result.size.double height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = v8;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)hideFormValidationMessage
{
  id v2 = self->_private;
  m_ptr = v2->formValidationBubble.m_ptr;
  v2->formValidationBubble.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      uint64_t v4 = (WTF *)MEMORY[0x1E4E465F0]();
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id)candidateList
{
  return 0;
}

- (void)_closeWindow
{
  id v3 = [(WebView *)self _UIDelegateForwarder];
  [v3 webViewClose:self];
}

- (void)_setDeviceOrientationProvider:(id)a3
{
  id v3 = self->_private;
  if (v3) {
    v3->m_deviceOrientationProvider = (WebDeviceOrientationProvider *)a3;
  }
}

- (id)_deviceOrientationProvider
{
  id v2 = self->_private;
  if (v2) {
    return v2->m_deviceOrientationProvider;
  }
  else {
    return 0;
  }
}

- (void)_setGeolocationProvider:(id)a3
{
  id v3 = self->_private;
  if (v3) {
    v3->_geolocationProvider = (WebGeolocationProvider *)a3;
  }
}

- (id)_geolocationProvider
{
  id v2 = self->_private;
  if (v2) {
    return v2->_geolocationProvider;
  }
  else {
    return 0;
  }
}

- (void)_geolocationDidChangePosition:(id)a3
{
  id v3 = self->_private;
  if (v3)
  {
    m_ptr = v3->page.m_ptr;
    if (m_ptr)
    {
      *(void *)&v14[0] = WebCore::GeolocationController::supplementName((WebCore::GeolocationController *)self);
      *((void *)&v14[0] + 1) = v6;
      WTF::HashTable<WTF::ASCIILiteral,WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::ASCIILiteral>>::lookup<WTF::HashMapTranslatorAdapter<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>>,WTF::ASCIILiteral>(*((const char ***)m_ptr + 1), (const char **)v14);
      if (a3)
      {
        uint64_t v7 = *((void *)a3 + 1);
        long long v8 = *(_OWORD *)(v7 + 40);
        long long v9 = *(_OWORD *)(v7 + 24);
        v14[0] = *(_OWORD *)(v7 + 8);
        v14[1] = v9;
        void v14[2] = v8;
        long long v10 = *(_OWORD *)(v7 + 72);
        long long v11 = *(_OWORD *)(v7 + 104);
        long long v12 = *(_OWORD *)(v7 + 56);
        v14[5] = *(_OWORD *)(v7 + 88);
        v14[6] = v11;
        v14[3] = v12;
        v14[4] = v10;
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        LOBYTE(v14[0]) = 0;
      }
      char v15 = v13;
      WebCore::GeolocationController::positionChanged();
    }
  }
}

- (void)_geolocationDidFailWithMessage:(id)a3
{
  id v3 = self->_private;
  if (v3 && v3->page.m_ptr)
  {
    MEMORY[0x1E4E442D0](v15, a3);
    uint64_t v6 = (WTF *)WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v6 = 0x100000001;
    uint64_t v7 = v15[0];
    if (v15[0])
    {
      int v8 = *(_DWORD *)v15[0];
      *(_DWORD *)v15[0] += 2;
      *((void *)v6 + 1) = v7;
      long long v14 = v6;
      v15[0] = 0;
      if (v8) {
        *(_DWORD *)uint64_t v7 = v8;
      }
      else {
        uint64_t v7 = (WTF::StringImpl *)WTF::StringImpl::destroy(v7, v5);
      }
    }
    else
    {
      *((void *)v6 + 1) = 0;
      long long v14 = v6;
    }
    m_ptr = self->_private->page.m_ptr;
    long long v10 = (WTF::StringImpl *)WebCore::GeolocationController::supplementName(v7);
    if (m_ptr)
    {
      v15[0] = v10;
      v15[1] = v11;
      WTF::HashTable<WTF::ASCIILiteral,WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::ASCIILiteral>>::lookup<WTF::HashMapTranslatorAdapter<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>>,WTF::ASCIILiteral>(*((const char ***)m_ptr + 1), (const char **)v15);
    }
    WebCore::GeolocationController::errorOccurred();
    if (v14)
    {
      if (*(_DWORD *)v14 == 1)
      {
        char v13 = (WTF::StringImpl *)*((void *)v14 + 1);
        *((void *)v14 + 1) = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2) {
            WTF::StringImpl::destroy(v13, v12);
          }
          else {
            *(_DWORD *)v13 -= 2;
          }
        }
        WTF::fastFree(v14, v12);
      }
      else
      {
        --*(_DWORD *)v14;
      }
    }
  }
}

- (void)_resetAllGeolocationPermission
{
  if ([(WebView *)self _mainCoreFrame])
  {
    MEMORY[0x1F416C1E8]();
  }
}

- (void)_setNotificationProvider:(id)a3
{
  id v3 = self->_private;
  if (v3)
  {
    if (!v3->_notificationProvider)
    {
      v3->_notificationProvider = (WebNotificationProvider *)a3;
      [(WebNotificationProvider *)self->_private->_notificationProvider registerWebView:self];
    }
  }
}

- (id)_notificationProvider
{
  id v2 = self->_private;
  if (v2) {
    return v2->_notificationProvider;
  }
  else {
    return 0;
  }
}

- (void)_notificationDidShow:(id)a3
{
  id v5 = [(WebView *)self _notificationProvider];
  [v5 webView:self didShowNotification:a3];
}

- (void)_notificationDidClick:(id)a3
{
  id v5 = [(WebView *)self _notificationProvider];
  [v5 webView:self didClickNotification:a3];
}

- (void)_notificationsDidClose:(id)a3
{
  id v5 = [(WebView *)self _notificationProvider];
  [v5 webView:self didCloseNotifications:a3];
}

- (id)_notificationIDForTesting:(OpaqueJSValue *)a3
{
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    [(WebFrame *)[(WebView *)self mainFrame] globalContext];
    uint64_t v4 = WebCore::JSNotification::toWrapped();
    uint64_t v5 = *(void *)(v4 + 72);
    v13[0] = *(void *)(v4 + 64);
    v13[1] = v5;
    WTF::UUID::toString((uint64_t *)&v14, (WTF::UUID *)v13);
    if (v14)
    {
      uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      int v8 = v14;
      long long v14 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 != 2)
        {
          *(_DWORD *)v8 -= 2;
          int v9 = *(_DWORD *)m_ptr - 1;
          if (*(_DWORD *)m_ptr == 1) {
            goto LABEL_11;
          }
LABEL_9:
          *(_DWORD *)m_ptr = v9;
          return v7;
        }
        WTF::StringImpl::destroy(v8, v6);
        int v9 = *(_DWORD *)m_ptr - 1;
        if (*(_DWORD *)m_ptr != 1) {
          goto LABEL_9;
        }
LABEL_11:
        long long v11 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
        WTF::fastFree(v11, v12);
        return v7;
      }
    }
    else
    {
      uint64_t v7 = &stru_1F3C7DA90;
    }
    int v9 = *(_DWORD *)m_ptr - 1;
    if (*(_DWORD *)m_ptr != 1) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
  return 0;
}

- (void)_clearNotificationPermissionState
{
  m_ptr = (WebCore::NotificationController *)self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    uint64_t v3 = WebCore::NotificationController::clientFrom(m_ptr, (Page *)a2);
    uint64_t v5 = *(void *)(v3 + 24);
    if (v5)
    {
      *(void *)(v3 + 24) = 0;
      uint64_t v6 = *(unsigned int *)(v5 - 4);
      if (v6)
      {
        uint64_t v7 = v5;
        do
        {
          uint64_t v8 = *(unsigned int *)(v7 + 24);
          if (v8)
          {
            if (v8 != 1)
            {
              std::__throw_bad_variant_access[abi:sn180100]();
              __break(1u);
              return;
            }
          }
          else if (*(void *)v7 == -1)
          {
            goto LABEL_7;
          }
          ((void (*)(char *, uint64_t))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJN7WebCore18SecurityOriginData5TupleENS6_16ProcessQualifiedIN3WTF23ObjectIdentifierGenericINS6_26OpaqueOriginIdentifierTypeENSA_38ObjectIdentifierThreadSafeAccessTraitsIyEEyLNSA_33SupportsObjectIdentifierNullStateE1EEEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSK_EEEDcOSL_DpOT0____fmatrix_0[v8])(&v11, v7);
          *(_DWORD *)(v7 + 24) = -1;
LABEL_7:
          v7 += 32;
          --v6;
        }
        while (v6);
      }
      WTF::fastFree((WTF *)(v5 - 16), v4);
    }
    if (*(_DWORD *)m_ptr == 1)
    {
      int v9 = (WTF *)MEMORY[0x1E4E47DB0](m_ptr);
      WTF::fastFree(v9, v10);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

+ (Class)_getPDFRepresentationClass
{
  Class result = (Class)s_pdfRepresentationClass;
  if (!s_pdfRepresentationClass) {
    return (Class)objc_opt_class();
  }
  return result;
}

+ (void)_setPDFRepresentationClass:(Class)a3
{
  s_pdfRepresentationClass = (uint64_t)a3;
}

+ (Class)_getPDFViewClass
{
  Class result = (Class)s_pdfViewClass;
  if (!s_pdfViewClass) {
    return (Class)objc_opt_class();
  }
  return result;
}

+ (void)_setPDFViewClass:(Class)a3
{
  s_pdfViewClass = (uint64_t)a3;
}

- (id)_editableElementsInRect:(CGRect)a3
{
  CGRect v20 = a3;
  if (!self) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  [(WebView *)self page];
  uint64_t v3 = v17;
  if (!v17) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v16, &v20);
  WebCore::Page::editableElementsInRect((uint64_t *)&v17, v3, (const WebCore::FloatRect *)v16);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = (void *)[v4 initWithCapacity:v19];
  if (v19)
  {
    uint64_t v6 = (WebCore::Node **)v17;
    uint64_t v7 = 8 * v19;
    do
    {
      uint64_t v8 = kit(*v6);
      if (v8) {
        [v5 addObject:v8];
      }
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  CFTypeRef v9 = (id)CFMakeCollectable(v5);
  if (v19)
  {
    long long v12 = v17;
    uint64_t v13 = 8 * v19;
    do
    {
      uint64_t v14 = *(void *)v12;
      *(void *)long long v12 = 0;
      if (v14)
      {
        if (*(_DWORD *)(v14 + 28) == 2)
        {
          if ((*(_WORD *)(v14 + 34) & 0x400) == 0) {
            WebCore::Node::removedLastRef((WebCore::Node *)v14);
          }
        }
        else
        {
          *(_DWORD *)(v14 + 28) -= 2;
        }
      }
      long long v12 = (WTF *)((char *)v12 + 8);
      v13 -= 8;
    }
    while (v13);
  }
  char v15 = v17;
  if (!v17) {
    return (id)v9;
  }
  uint64_t v17 = 0;
  int v18 = 0;
  WTF::fastFree(v15, v11);
  return (id)v9;
}

- (void)revealCurrentSelection
{
  if (self)
  {
    [(WebView *)self page];
    if (v2)
    {
      MEMORY[0x1F41726F8]();
    }
  }
}

- (void)_installVisualIdentificationOverlayForViewIfNeeded:(id)a3 kind:(id)a4
{
}

- (id)fullScreenPlaceholderView
{
  return 0;
}

- (void)_preferencesChangedGenerated:(id)a3
{
  uint64_t v4 = *((void *)self->_private->page.m_ptr + 14);
  int v5 = [a3 _BOOLValueForKey:@"WebKitIncompleteImageBorderEnabled"];
  uint64_t v6 = 0x100000000000;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFEFFFFFFFFFFFLL | v6;
  int v7 = [a3 _BOOLValueForKey:@"WebKitMediaEnabled"];
  uint64_t v8 = 0x8000;
  if (!v7) {
    uint64_t v8 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFF7FFFLL | v8;
  int v9 = [a3 _BOOLValueForKey:@"WebKitMediaDataLoadsAutomatically"];
  uint64_t v10 = 0x8000000;
  if (!v9) {
    uint64_t v10 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFF7FFFFFFLL | v10;
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitDisabledAdaptationsMetaTagEnabled"] != 0);
  int v11 = [a3 _BOOLValueForKey:@"WebKitMediaControlsScaleWithPageZoom"];
  uint64_t v12 = 0x4000000;
  if (!v11) {
    uint64_t v12 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFBFFFFFFLL | v12;
  int v13 = [a3 _BOOLValueForKey:@"WebKitDownloadAttributeEnabled"];
  uint64_t v14 = 128;
  if (!v13) {
    uint64_t v14 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFF7FLL | v14;
  *(unsigned char *)(v4 + 369) = [a3 _integerValueForKey:@"WebKitEditableLinkBehavior"];
  int v15 = [a3 _BOOLValueForKey:@"WebKitMediaControlsContextMenusEnabled"];
  uint64_t v16 = 0x400000000;
  if (!v15) {
    uint64_t v16 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFBFFFFFFFFLL | v16;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitMediaContentTypesRequiringHardwareSupport"]);
  WebCore::SettingsBase::setMediaContentTypesRequiringHardwareSupport((WebCore::SettingsBase *)v4, (const WTF::String *)&v735);
  int v18 = (unint64_t *)(v4 + 664);
  unsigned int v19 = v735;
  v735 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v17);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  int v20 = [a3 _BOOLValueForKey:@"WebKitEnableInheritURIQueryComponent"];
  uint64_t v21 = 1024;
  if (!v20) {
    uint64_t v21 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFBFFLL | v21;
  int v22 = [a3 _BOOLValueForKey:@"WebKitEncryptedMediaAPIEnabled"];
  uint64_t v23 = 4096;
  if (!v22) {
    uint64_t v23 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFEFFFLL | v23;
  int v24 = [a3 _BOOLValueForKey:@"WebKitMediaCapabilitiesEnabled"];
  uint64_t v25 = 0x1000000;
  if (!v24) {
    uint64_t v25 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFEFFFFFFLL | v25;
  [a3 _floatValueForKey:@"WebKitMaxParseDurationPreferenceKey"];
  *(double *)(v4 + 448) = v26;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitFTPDirectoryTemplatePath"]);
  long long v28 = v735;
  if (v735) {
    *(_DWORD *)v735 += 2;
  }
  long long v29 = *(WTF::StringImpl **)(v4 + 384);
  *(void *)(v4 + 384) = v28;
  if (!v29)
  {
LABEL_28:
    v735 = 0;
    if (!v28) {
      goto LABEL_34;
    }
    goto LABEL_31;
  }
  if (*(_DWORD *)v29 != 2)
  {
    *(_DWORD *)v29 -= 2;
    goto LABEL_28;
  }
  WTF::StringImpl::destroy(v29, v27);
  long long v28 = v735;
  v735 = 0;
  if (!v28) {
    goto LABEL_34;
  }
LABEL_31:
  if (*(_DWORD *)v28 == 2) {
    WTF::StringImpl::destroy(v28, v27);
  }
  else {
    *(_DWORD *)v28 -= 2;
  }
LABEL_34:
  int v30 = [a3 _BOOLValueForKey:@"WebKitMathMLEnabled"];
  uint64_t v31 = 0x200000000;
  if (!v30) {
    uint64_t v31 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFDFFFFFFFFLL | v31;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitFantasyFont"]);
  WebCore::SettingsBase::setFantasyFontFamily();
  NSRect v33 = v735;
  v735 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2) {
      WTF::StringImpl::destroy(v33, v32);
    }
    else {
      *(_DWORD *)v33 -= 2;
    }
  }
  [a3 _BOOLValueForKey:@"WebKitDisplayImagesKey"];
  WebCore::Settings::setLoadsImagesAutomatically((WebCore::Settings *)v4);
  int v34 = [a3 _BOOLValueForKey:@"WebKitLoadDeferringEnabled"];
  uint64_t v35 = 0x4000;
  if (!v34) {
    uint64_t v35 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFBFFFLL | v35;
  int v36 = [a3 _BOOLValueForKey:@"WebKitLinkPreloadEnabled"];
  uint64_t v37 = 1024;
  if (!v36) {
    uint64_t v37 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFBFFLL | v37;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitFixedFont"]);
  WebCore::SettingsBase::setFixedFontFamily();
  unsigned int v39 = v735;
  v735 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2) {
      WTF::StringImpl::destroy(v39, v38);
    }
    else {
      *(_DWORD *)v39 -= 2;
    }
  }
  int v40 = [a3 _BOOLValueForKey:@"WebKitLinkPreconnect"];
  uint64_t v41 = 256;
  if (!v40) {
    uint64_t v41 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFEFFLL | v41;
  if ([a3 _BOOLValueForKey:@"WebKitForceFTPDirectoryListings"]) {
    uint64_t v42 = 0x400000;
  }
  else {
    uint64_t v42 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFBFFFFFLL | v42;
  if ([a3 _BOOLValueForKey:@"WebKitForceWebGLUsesLowPower"]) {
    uint64_t v43 = 0x800000;
  }
  else {
    uint64_t v43 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFF7FFFFFLL | v43;
  [a3 _floatValueForKey:@"WebKitLayoutViewportHeightExpansionFactor"];
  WebCore::Settings::setLayoutViewportHeightExpansionFactor((WebCore::Settings *)v4, v44);
  *(_DWORD *)(v4 + 428) = [a3 _integerValueForKey:@"WebKitLayoutFallbackWidth"];
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitLargeImageAsyncDecodingEnabled"] != 0);
  *(_DWORD *)(v4 + 424) = [a3 _integerValueForKey:@"WebKitJavaScriptRuntimeFlagsPreferenceKey"];
  if ([a3 _BOOLValueForKey:@"WebKitJavaScriptMarkupEnabled"]) {
    uint64_t v45 = 1024;
  }
  else {
    uint64_t v45 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFBFFLL | v45;
  if ([a3 _BOOLValueForKey:@"WebKitJavaScriptCanOpenWindowsAutomatically"]) {
    uint64_t v46 = 0x4000000000000000;
  }
  else {
    uint64_t v46 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xBFFFFFFFFFFFFFFFLL | v46;
  if ([a3 _BOOLValueForKey:@"WebKitJavaScriptCanAccessClipboard"]) {
    uint64_t v47 = 0x2000000000000000;
  }
  else {
    uint64_t v47 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xDFFFFFFFFFFFFFFFLL | v47;
  int v48 = [a3 _BOOLValueForKey:@"InvisibleAutoplayNotPermitted"];
  uint64_t v49 = 0x1000000000000;
  if (!v48) {
    uint64_t v49 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFEFFFFFFFFFFFFLL | v49;
  int v50 = [a3 _BOOLValueForKey:@"WebKitInterruptVideoOnPageVisibilityChangeEnabled"];
  uint64_t v51 = 0x200000000000;
  if (!v50) {
    uint64_t v51 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFDFFFFFFFFFFFLL | v51;
  int v52 = [a3 _BOOLValueForKey:@"WebKitInterruptAudioOnPageVisibilityChangeEnabled"];
  uint64_t v53 = 0x100000000000;
  if (!v52) {
    uint64_t v53 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFEFFFFFFFFFFFLL | v53;
  [a3 _floatValueForKey:@"WebKitInteractionRegionMinimumCornerRadius"];
  *(double *)(v4 + 416) = v54;
  [a3 _floatValueForKey:@"WebKitInteractionRegionInlinePadding"];
  *(double *)(v4 + 408) = v55;
  int v56 = [a3 _BOOLValueForKey:@"WebKitInlineMediaPlaybackRequiresPlaysInlineAttribute"];
  uint64_t v57 = 0x400000000000;
  if (!v56) {
    uint64_t v57 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFBFFFFFFFFFFFLL | v57;
  [a3 _floatValueForKey:@"WebKitIncrementalRenderingSuppressionTimeoutInSeconds"];
  *(double *)(v4 + 400) = v58;
  [a3 _BOOLValueForKey:@"WebKitHiddenPageCSSAnimationSuspensionEnabled"];
  WebCore::Settings::setHiddenPageCSSAnimationSuspensionEnabled((WebCore::Settings *)v4);
  [a3 _BOOLValueForKey:@"WebKitAcceleratedCompositingEnabled"];
  WebCore::Settings::setAcceleratedCompositingEnabled((WebCore::Settings *)v4);
  int v59 = [a3 _BOOLValueForKey:@"WebKitAcceleratedCompositingForFixedPositionEnabled"];
  uint64_t v60 = 32;
  if (!v59) {
    uint64_t v60 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFFDFLL | v60;
  if ([a3 _BOOLValueForKey:@"WebKitWirelessPlaybackTargetAPIEnabled"]) {
    uint64_t v61 = 0x2000000000000000;
  }
  else {
    uint64_t v61 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xDFFFFFFFFFFFFFFFLL | v61;
  int v62 = [a3 _BOOLValueForKey:@"WebKitWindowFocusRestricted"];
  uint64_t v63 = 0x1000000000000000;
  if (!v62) {
    uint64_t v63 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xEFFFFFFFFFFFFFFFLL | v63;
  int v64 = [a3 _BOOLValueForKey:@"WebKitWebSocketEnabled"];
  uint64_t v65 = 0x80000000000000;
  if (!v64) {
    uint64_t v65 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFF7FFFFFFFFFFFFFLL | v65;
  if ([a3 _BOOLValueForKey:@"WebKitAggressiveTileRetentionEnabled"]) {
    uint64_t v66 = 1024;
  }
  else {
    uint64_t v66 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFBFFLL | v66;
  int v67 = [a3 _BOOLValueForKey:@"WebKitWebSecurityEnabled"];
  uint64_t v68 = 0x10000000000000;
  if (!v67) {
    uint64_t v68 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFEFFFFFFFFFFFFFLL | v68;
  if ([a3 _BOOLValueForKey:@"WebKitAllowContentSecurityPolicySourceStarToMatchAnyProtocol"])uint64_t v69 = 0x2000; {
  else
  }
    uint64_t v69 = 0;
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFDFFFLL | v69;
  int v70 = [a3 _BOOLValueForKey:@"WebKitAllowDisplayOfInsecureContent"];
  uint64_t v71 = 0x4000;
  if (!v70) {
    uint64_t v71 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFBFFFLL | v71;
  int v72 = [a3 _BOOLValueForKey:@"WebKitAllowFileAccessFromFileURLs"];
  uint64_t v73 = 0x8000;
  if (!v72) {
    uint64_t v73 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFF7FFFLL | v73;
  int v74 = [a3 _BOOLValueForKey:@"WebKitAllowMultiElementImplicitFormSubmissionPreferenceKey"];
  uint64_t v75 = 0x20000;
  if (!v74) {
    uint64_t v75 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFDFFFFLL | v75;
  int v76 = [a3 _BOOLValueForKey:@"WebKitAllowRunningOfInsecureContent"];
  uint64_t v77 = 0x80000;
  if (!v76) {
    uint64_t v77 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFF7FFFFLL | v77;
  if ([a3 _BOOLValueForKey:@"WebKitAllowSettingAnyXHRHeaderFromFileURLs"]) {
    uint64_t v78 = 0x100000;
  }
  else {
    uint64_t v78 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFEFFFFFLL | v78;
  int v79 = [a3 _BOOLValueForKey:@"WebKitMediaPlaybackAllowsAirPlay"];
  uint64_t v80 = 0x800000000000;
  if (!v79) {
    uint64_t v80 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFF7FFFFFFFFFFFLL | v80;
  if ([a3 _BOOLValueForKey:@"WebKitMediaPlaybackAllowsInline"]) {
    uint64_t v81 = 0x800000;
  }
  else {
    uint64_t v81 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFF7FFFFFLL | v81;
  int v82 = [a3 _BOOLValueForKey:@"WebKitAllowsInlineMediaPlaybackAfterFullscreen"];
  uint64_t v83 = 0x1000000;
  if (!v82) {
    uint64_t v83 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFEFFFFFFLL | v83;
  int v84 = [a3 _BOOLValueForKey:@"WebKitAllowsPictureInPictureMediaPlayback"];
  uint64_t v85 = 0x2000000;
  if (!v84) {
    uint64_t v85 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFDFFFFFFLL | v85;
  int v86 = [a3 _BOOLValueForKey:@"WebKitAlternateFormControlDesignEnabled"];
  uint64_t v87 = 0x100000000000000;
  if (!v86) {
    uint64_t v87 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFEFFFFFFFFFFFFFFLL | v87;
  int v88 = [a3 _BOOLValueForKey:@"WebKitAlternateFullScreenControlDesignEnabled"];
  uint64_t v89 = 0x200000000000000;
  if (!v88) {
    uint64_t v89 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFDFFFFFFFFFFFFFFLL | v89;
  if ([a3 _BOOLValueForKey:@"WebKitAnimatedImageAsyncDecodingEnabled"]) {
    uint64_t v90 = 0x8000000;
  }
  else {
    uint64_t v90 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFF7FFFFFFLL | v90;
  if ([a3 _BOOLValueForKey:@"WebKitAppleMailPaginationQuirkEnabled"]) {
    uint64_t v91 = 0x40000000;
  }
  else {
    uint64_t v91 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFBFFFFFFFLL | v91;
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitApplePayCapabilityDisclosureAllowed"] != 0);
  int v92 = [a3 _BOOLValueForKey:@"WebKitApplePayEnabled"];
  uint64_t v93 = 2;
  if (!v92) {
    uint64_t v93 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFFDLL | v93;
  int v94 = [a3 _BOOLValueForKey:@"WebKitAsynchronousSpellCheckingEnabled"];
  uint64_t v95 = 0x400000000;
  if (!v94) {
    uint64_t v95 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFBFFFFFFFFLL | v95;
  int v96 = [a3 _BOOLValueForKey:@"WebKitAudioControlsScaleWithPageZoom"];
  uint64_t v97 = 0x800000000;
  if (!v96) {
    uint64_t v97 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFF7FFFFFFFFLL | v97;
  [a3 _BOOLValueForKey:@"WebKitAuthorAndUserStylesEnabledPreferenceKey"];
  WebCore::Settings::setAuthorAndUserStylesEnabled((WebCore::Settings *)v4);
  int v98 = [a3 _BOOLValueForKey:@"WebKitWebAudioEnabled"];
  uint64_t v99 = 0x10000000;
  if (!v98) {
    uint64_t v99 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFEFFFFFFFLL | v99;
  int v100 = [a3 _BOOLValueForKey:@"WebKitWantsBalancedSetDefersLoadingBehavior"];
  uint64_t v101 = 0x1000000000;
  if (!v100) {
    uint64_t v101 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFEFFFFFFFFFLL | v101;
  [a3 _BOOLValueForKey:@"WebKitVisualViewportEnabled"];
  WebCore::Settings::setVisualViewportEnabled((WebCore::Settings *)v4);
  int v102 = [a3 _BOOLValueForKey:@"WebKitBackspaceKeyNavigationEnabled"];
  uint64_t v103 = 0x80000000000;
  if (!v102) {
    uint64_t v103 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFF7FFFFFFFFFFLL | v103;
  *(_DWORD *)(v4 + 612) = [a3 _integerValueForKey:@"WebKitVisibleDebugOverlayRegions"];
  if ([a3 _BOOLValueForKey:@"WebKitVideoQualityIncludesDisplayCompositingEnabled"]) {
    uint64_t v104 = 0x100000;
  }
  else {
    uint64_t v104 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFEFFFFFLL | v104;
  if ([a3 _BOOLValueForKey:@"WebKitVideoPresentationModeAPIEnabled"]) {
    uint64_t v105 = 0x40000000;
  }
  else {
    uint64_t v105 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFBFFFFFFFLL | v105;
  int v106 = [a3 _BOOLValueForKey:@"WebKitVideoFullscreenRequiresElementFullscreen"];
  uint64_t v107 = 0x10000;
  if (!v106) {
    uint64_t v107 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFEFFFFLL | v107;
  int v108 = [a3 _BOOLValueForKey:@"WebKitVP9DecoderEnabled"];
  uint64_t v109 = 0x200000;
  if (!v108) {
    uint64_t v109 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFDFFFFFLL | v109;
  if ([a3 _BOOLValueForKey:@"WebKitUsesEncodingDetector"]) {
    uint64_t v110 = 0x8000000;
  }
  else {
    uint64_t v110 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFF7FFFFFFLL | v110;
  [a3 _BOOLValueForKey:@"WebKitUsesPageCachePreferenceKey"];
  WebCore::Settings::setUsesBackForwardCache((WebCore::Settings *)v4);
  *(unsigned char *)(v4 + 560) = [a3 _integerValueForKey:@"WebKitUserInterfaceDirectionPolicy"] != 0;
  if ([a3 _BOOLValueForKey:@"WebKitUsePreHTML5ParserQuirks"]) {
    uint64_t v111 = 0x800000;
  }
  else {
    uint64_t v111 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFF7FFFFFLL | v111;
  if ([a3 _BOOLValueForKey:@"WebKitUseImageDocumentForSubframePDF"]) {
    uint64_t v112 = 0x400000;
  }
  else {
    uint64_t v112 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFBFFFFFLL | v112;
  if ([a3 _BOOLValueForKey:@"WebKitTreatsAnyTextCSSLinkAsStylesheet"]) {
    uint64_t v113 = 0x2000;
  }
  else {
    uint64_t v113 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFDFFFLL | v113;
  int v114 = [a3 _BOOLValueForKey:@"WebKitTextInteractionEnabled"];
  uint64_t v115 = 512;
  if (!v114) {
    uint64_t v115 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFDFFLL | v115;
  [a3 _BOOLValueForKey:@"WebKitTextAutosizingEnabled"];
  WebCore::Settings::setTextAutosizingEnabled((WebCore::Settings *)v4);
  [a3 _BOOLValueForKey:@"WebKitTextAreasAreResizable"];
  WebCore::Settings::setTextAreasAreResizable((WebCore::Settings *)v4);
  int v116 = [a3 _BOOLValueForKey:@"WebKitTemporaryTileCohortRetentionEnabled"];
  uint64_t v117 = 128;
  if (!v116) {
    uint64_t v117 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFF7FLL | v117;
  int v118 = [a3 _BOOLValueForKey:@"WebKitTelephoneParsingEnabledPreferenceKey"];
  uint64_t v119 = 64;
  if (!v118) {
    uint64_t v119 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFBFLL | v119;
  if ([a3 _BOOLValueForKey:@"WebKitSystemPreviewEnabled"]) {
    uint64_t v120 = 0x4000000000000000;
  }
  else {
    uint64_t v120 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xBFFFFFFFFFFFFFFFLL | v120;
  *(unsigned char *)(v4 + 549) = [a3 _integerValueForKey:@"WebKitSystemLayoutDirection"] != 0;
  int v121 = [a3 _BOOLValueForKey:@"WebKitSuppressesIncrementalRendering"];
  uint64_t v122 = 8;
  if (!v121) {
    uint64_t v122 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFF7 | v122;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitStandardFont"]);
  WebCore::SettingsBase::setStandardFontFamily();
  v124 = v735;
  v735 = 0;
  if (v124)
  {
    if (*(_DWORD *)v124 == 2) {
      WTF::StringImpl::destroy(v124, v123);
    }
    else {
      *(_DWORD *)v124 -= 2;
    }
  }
  int v125 = [a3 _BOOLValueForKey:@"WebKitStandalonePreferenceKey"];
  unint64_t v126 = 0x8000000000000000;
  if (!v125) {
    unint64_t v126 = 0;
  }
  *(void *)(v4 + 696) = v126 & 0x8000000000000000 | *(void *)(v4 + 696) & 0x7FFFFFFFFFFFFFFFLL;
  int v127 = [a3 _BOOLValueForKey:@"WebKitSpatialNavigationEnabled"];
  uint64_t v128 = 0x800000000000000;
  if (!v127) {
    uint64_t v128 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xF7FFFFFFFFFFFFFFLL | v128;
  int v129 = [a3 _BOOLValueForKey:@"WebKitSourceBufferChangeTypeEnabled"];
  uint64_t v130 = 0x4000000000;
  if (!v129) {
    uint64_t v130 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFBFFFFFFFFFLL | v130;
  int v131 = [a3 _BOOLValueForKey:@"WebKitShrinksStandaloneImagesToFit"];
  uint64_t v132 = 0x80000000000000;
  if (!v131) {
    uint64_t v132 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFF7FFFFFFFFFFFFFLL | v132;
  int v133 = [a3 _BOOLValueForKey:@"WebKitShowsURLsInToolTips"];
  uint64_t v134 = 0x40000000000000;
  if (!v133) {
    uint64_t v134 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFBFFFFFFFFFFFFFLL | v134;
  int v135 = [a3 _BOOLValueForKey:@"WebKitShowsToolTipOverTruncatedText"];
  uint64_t v136 = 0x20000000000000;
  if (!v135) {
    uint64_t v136 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFDFFFFFFFFFFFFFLL | v136;
  int v137 = [a3 _BOOLValueForKey:@"WebKitShouldUseServiceWorkerShortTimeout"];
  uint64_t v138 = 0x800000000000;
  if (!v137) {
    uint64_t v138 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFF7FFFFFFFFFFFLL | v138;
  int v139 = [a3 _BOOLValueForKey:@"WebKitShouldSuppressTextInputFromEditingDuringProvisionalNavigation"];
  uint64_t v140 = 0x200000000000;
  if (!v139) {
    uint64_t v140 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFDFFFFFFFFFFFLL | v140;
  int v141 = [a3 _BOOLValueForKey:@"WebKitShouldRestrictBaseURLSchemes"];
  uint64_t v142 = 0x100000000000;
  if (!v141) {
    uint64_t v142 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFEFFFFFFFFFFFLL | v142;
  int v143 = [a3 _BOOLValueForKey:@"WebKitShouldRespectImageOrientation"];
  uint64_t v144 = 0x80000000000;
  if (!v143) {
    uint64_t v144 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFF7FFFFFFFFFFLL | v144;
  int v145 = [a3 _BOOLValueForKey:@"WebKitShouldPrintBackgroundsPreferenceKey"];
  uint64_t v146 = 0x40000000000;
  if (!v145) {
    uint64_t v146 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFBFFFFFFFFFFLL | v146;
  int v147 = [a3 _BOOLValueForKey:@"WebKitShouldIgnoreMetaViewport"];
  uint64_t v148 = 0x10000000000;
  if (!v147) {
    uint64_t v148 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFEFFFFFFFFFFLL | v148;
  [a3 _BOOLValueForKey:@"WebKitShouldEnableTextAutosizingBoost"];
  WebCore::Settings::setShouldEnableTextAutosizingBoost((WebCore::Settings *)v4);
  int v149 = [a3 _BOOLValueForKey:@"WebKitShouldDisplayTextDescriptions"];
  uint64_t v150 = 0x80000;
  if (!v149) {
    uint64_t v150 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFF7FFFFLL | v150;
  int v151 = [a3 _BOOLValueForKey:@"WebKitShouldDisplaySubtitles"];
  uint64_t v152 = 0x40000;
  if (!v151) {
    uint64_t v152 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFBFFFFLL | v152;
  int v153 = [a3 _BOOLValueForKey:@"WebKitShouldDisplayCaptions"];
  uint64_t v154 = 0x20000;
  if (!v153) {
    uint64_t v154 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFDFFFFLL | v154;
  int v155 = [a3 _BOOLValueForKey:@"WebKitShouldDecidePolicyBeforeLoadingQuickLookPreview"];
  uint64_t v156 = 0x400000000;
  if (!v155) {
    uint64_t v156 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFBFFFFFFFFLL | v156;
  int v157 = [a3 _BOOLValueForKey:@"WebKitShouldConvertPositionStyleOnCopy"];
  uint64_t v158 = 0x200000000;
  if (!v157) {
    uint64_t v158 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFDFFFFFFFFLL | v158;
  int v159 = [a3 _BOOLValueForKey:@"WebKitShouldConvertInvalidURLsToBlank"];
  uint64_t v160 = 0x100000000;
  if (!v159) {
    uint64_t v160 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFEFFFFFFFFLL | v160;
  [a3 _BOOLValueForKey:@"WebKitShouldAllowUserInstalledFonts"];
  WebCore::Settings::setShouldAllowUserInstalledFonts((WebCore::Settings *)v4);
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitSerifFont"]);
  WebCore::SettingsBase::setSerifFontFamily();
  uint64_t v162 = v735;
  v735 = 0;
  if (v162)
  {
    if (*(_DWORD *)v162 == 2) {
      WTF::StringImpl::destroy(v162, v161);
    }
    else {
      *(_DWORD *)v162 -= 2;
    }
  }
  int v163 = [a3 _BOOLValueForKey:@"WebKitCaretBrowsingEnabled"];
  uint64_t v164 = 0x80000000000000;
  if (!v163) {
    uint64_t v164 = 0;
  }
  unint64_t *v18 = *v18 & 0xFF7FFFFFFFFFFFFFLL | v164;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitSansSerifFont"]);
  WebCore::SettingsBase::setSansSerifFontFamily();
  v166 = v735;
  v735 = 0;
  if (v166)
  {
    if (*(_DWORD *)v166 == 2) {
      WTF::StringImpl::destroy(v166, v165);
    }
    else {
      *(_DWORD *)v166 -= 2;
    }
  }
  [a3 _floatValueForKey:@"WebKitSampledPageTopColorMinHeight"];
  *(double *)(v4 + 536) = v167;
  [a3 _floatValueForKey:@"WebKitSampledPageTopColorMaxDifference"];
  *(double *)(v4 + 528) = v168;
  [a3 _BOOLValueForKey:@"WebKitColorFilterEnabled"];
  WebCore::Settings::setColorFilterEnabled((WebCore::Settings *)v4);
  int v169 = [a3 _BOOLValueForKey:@"WebKitRequiresUserGestureToLoadVideo"];
  uint64_t v170 = 8;
  if (!v169) {
    uint64_t v170 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFF7 | v170;
  int v171 = [a3 _BOOLValueForKey:@"WebKitVideoPlaybackRequiresUserGesture"];
  uint64_t v172 = 4;
  if (!v171) {
    uint64_t v172 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFFBLL | v172;
  int v173 = [a3 _BOOLValueForKey:@"WebKitContentChangeObserverEnabled"];
  uint64_t v174 = 16;
  if (!v173) {
    uint64_t v174 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFEFLL | v174;
  int v175 = [a3 _BOOLValueForKey:@"WebKitContentDispositionAttachmentSandboxEnabled"];
  unint64_t v176 = 0x8000000000000000;
  if (!v175) {
    unint64_t v176 = 0;
  }
  unint64_t *v18 = v176 & 0x8000000000000000 | *v18 & 0x7FFFFFFFFFFFFFFFLL;
  int v177 = [a3 _BOOLValueForKey:@"WebKitAudioPlaybackRequiresUserGesture"];
  uint64_t v178 = 2;
  if (!v177) {
    uint64_t v178 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFFDLL | v178;
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitRequiresPageVisibilityToPlayAudio"] != 0);
  [a3 _BOOLValueForKey:@"WebKitPunchOutWhiteBackgroundsInDarkMode"];
  WebCore::Settings::setPunchOutWhiteBackgroundsInDarkMode((WebCore::Settings *)v4);
  *(unsigned char *)(v4 + 520) = [a3 _integerValueForKey:@"WebKitPitchCorrectionAlgorithm"];
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitPictureInPictureAPIEnabled"] != 0);
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitPictographFont"]);
  WebCore::SettingsBase::setPictographFontFamily();
  uint64_t v180 = v735;
  v735 = 0;
  if (v180)
  {
    if (*(_DWORD *)v180 == 2) {
      WTF::StringImpl::destroy(v180, v179);
    }
    else {
      *(_DWORD *)v180 -= 2;
    }
  }
  int v181 = [a3 _BOOLValueForKey:@"WebKitEnablePasswordEchoPreferenceKey"];
  uint64_t v182 = 0x1000000000000;
  if (!v181) {
    uint64_t v182 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFEFFFFFFFFFFFFLL | v182;
  [a3 _floatValueForKey:@"WebKitPasswordEchoDurationPreferenceKey"];
  *(double *)(v4 + 512) = v183;
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitCursiveFont"]);
  WebCore::SettingsBase::setCursiveFontFamily();
  v185 = v735;
  v735 = 0;
  if (v185)
  {
    if (*(_DWORD *)v185 == 2) {
      WTF::StringImpl::destroy(v185, v184);
    }
    else {
      *(_DWORD *)v185 -= 2;
    }
  }
  int v186 = [a3 _BOOLValueForKey:@"WebKitPassiveTouchListenersAsDefaultOnDocument"];
  uint64_t v187 = 0x400000000000;
  if (!v186) {
    uint64_t v187 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFBFFFFFFFFFFFLL | v187;
  [a3 _BOOLValueForKey:@"WebKitDNSPrefetchingEnabled"];
  WebCore::Settings::setDNSPrefetchingEnabled((WebCore::Settings *)v4);
  int v188 = [a3 _BOOLValueForKey:@"WebKitPDFPluginHUDEnabled"];
  uint64_t v189 = 0x20000000000000;
  if (!v188) {
    uint64_t v189 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFDFFFFFFFFFFFFFLL | v189;
  int v190 = [a3 _BOOLValueForKey:@"WebKitDOMPasteAllowedPreferenceKey"];
  uint64_t v191 = 16;
  if (!v190) {
    uint64_t v191 = 0;
  }
  unint64_t v192 = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFEFLL | v191;
  *(void *)(v4 + 720) &= ~0x10000000000000uLL;
  *(void *)(v4 + 680) = v192;
  *(unsigned char *)(v4 + 616) = [a3 _integerValueForKey:@"WebKitDataDetectorTypes"];
  int v193 = [a3 _BOOLValueForKey:@"WebKitNeedsKeyboardEventDisambiguationQuirks"];
  uint64_t v194 = 0x4000000000;
  if (!v193) {
    uint64_t v194 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFBFFFFFFFFFLL | v194;
  int v195 = [a3 _BOOLValueForKey:@"WebKitNeedsFrameNameFallbackToIdQuirk"];
  uint64_t v196 = 0x2000000000;
  if (!v195) {
    uint64_t v196 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFDFFFFFFFFFLL | v196;
  int v197 = [a3 _BOOLValueForKey:@"WebKitNeedsAdobeFrameReloadingQuirk"];
  uint64_t v198 = 0x800000000;
  if (!v197) {
    uint64_t v198 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFF7FFFFFFFFLL | v198;
  int v199 = [a3 _BOOLValueForKey:@"WebKitMockScrollbarsControllerEnabled"];
  uint64_t v200 = 0x100000000;
  if (!v199) {
    uint64_t v200 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFEFFFFFFFFLL | v200;
  [a3 _floatValueForKey:@"WebKitMinimumZoomFontSizePreferenceKey"];
  *(double *)(v4 + 648) = v201;
  [a3 _floatValueForKey:@"WebKitDefaultFixedFontSize"];
  WebCore::Settings::setDefaultFixedFontSize((WebCore::Settings *)v4, v202);
  [a3 _floatValueForKey:@"WebKitDefaultFontSize"];
  WebCore::Settings::setDefaultFontSize((WebCore::Settings *)v4, v203);
  MEMORY[0x1E4E442D0](&v735, [a3 _stringValueForKey:@"WebKitDefaultTextEncodingName"]);
  v205 = v735;
  if (v735) {
    *(_DWORD *)v735 += 2;
  }
  v206 = *(WTF::StringImpl **)(v4 + 344);
  *(void *)(v4 + 344) = v205;
  if (!v206)
  {
LABEL_254:
    v735 = 0;
    if (!v205) {
      goto LABEL_260;
    }
    goto LABEL_257;
  }
  if (*(_DWORD *)v206 != 2)
  {
    *(_DWORD *)v206 -= 2;
    goto LABEL_254;
  }
  WTF::StringImpl::destroy(v206, v204);
  v205 = v735;
  v735 = 0;
  if (!v205) {
    goto LABEL_260;
  }
LABEL_257:
  if (*(_DWORD *)v205 == 2) {
    WTF::StringImpl::destroy(v205, v204);
  }
  else {
    *(_DWORD *)v205 -= 2;
  }
LABEL_260:
  [a3 _floatValueForKey:@"WebKitMinimumLogicalFontSize"];
  WebCore::Settings::setMinimumLogicalFontSize((WebCore::Settings *)v4, v207);
  [a3 _floatValueForKey:@"WebKitMinimumFontSize"];
  WebCore::Settings::setMinimumFontSize((WebCore::Settings *)v4, v208);
  int v209 = [a3 _BOOLValueForKey:@"WebKitMediaUserGestureInheritsFromDocument"];
  uint64_t v210 = 0x80000000;
  if (!v209) {
    uint64_t v210 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFF7FFFFFFFLL | v210;
  int v211 = [a3 _BOOLValueForKey:@"WebKitMediaStreamEnabled"];
  uint64_t v212 = 0x1000000000000;
  if (!v211) {
    uint64_t v212 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFEFFFFFFFFFFFFLL | v212;
  *(_DWORD *)(v4 + 360) = [a3 _integerValueForKey:@"WebKitDeviceHeight"];
  int v213 = [a3 _BOOLValueForKey:@"WebKitDeviceOrientationEventEnabled"];
  uint64_t v214 = 256;
  if (!v213) {
    uint64_t v214 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFEFFLL | v214;
  int v215 = [a3 _BOOLValueForKey:@"WebKitDeviceOrientationPermissionAPIEnabled"];
  uint64_t v216 = 512;
  if (!v215) {
    uint64_t v216 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFDFFLL | v216;
  *(_DWORD *)(v4 + 364) = [a3 _integerValueForKey:@"WebKitDeviceWidth"];
  int v217 = [a3 _BOOLValueForKey:@"WebKitMediaPreloadingEnabled"];
  uint64_t v218 = 0x10000000;
  if (!v217) {
    uint64_t v218 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFEFFFFFFFLL | v218;
  [a3 _floatValueForKey:@"WebKitMediaPreferredFullscreenWidth"];
  *(double *)(v4 + 472) = v219;
  int v220 = [a3 _BOOLValueForKey:@"WebKitGrammarAndSpellingPseudoElementsEnabled"];
  uint64_t v221 = 0x40000000;
  if (!v220) {
    uint64_t v221 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFBFFFFFFFLL | v221;
  int v222 = [a3 _BOOLValueForKey:@"WebKitTargetTextPseudoElementEnabled"];
  uint64_t v223 = 32;
  if (!v222) {
    uint64_t v223 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFDFLL | v223;
  if ([a3 _BOOLValueForKey:@"WebKitThumbAndTrackPseudoElementsEnabled"]) {
    uint64_t v224 = 1024;
  }
  else {
    uint64_t v224 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFBFFLL | v224;
  int v225 = [a3 _BOOLValueForKey:@"WebKitSelectShowPickerEnabled"];
  uint64_t v226 = 0x400000;
  if (!v225) {
    uint64_t v226 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFBFFFFFLL | v226;
  int v227 = [a3 _BOOLValueForKey:@"WebKitPageAtRuleMarginDescriptorsEnabled"];
  uint64_t v228 = 0x200000000000;
  if (!v227) {
    uint64_t v228 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFDFFFFFFFFFFFLL | v228;
  int v229 = [a3 _BOOLValueForKey:@"WebKitAbortSignalAnyOperationEnabled"];
  uint64_t v230 = 4;
  if (!v229) {
    uint64_t v230 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFFFBLL | v230;
  [a3 _BOOLValueForKey:@"WebKitAcceleratedFiltersEnabled"];
  WebCore::Settings::setAcceleratedFiltersEnabled((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitAccessHandleEnabled"]) {
    uint64_t v231 = 256;
  }
  else {
    uint64_t v231 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFEFFLL | v231;
  if ([a3 _BOOLValueForKey:@"WebKitDOMTestingAPIsEnabled"]) {
    uint64_t v232 = 32;
  }
  else {
    uint64_t v232 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFDFLL | v232;
  int v233 = [a3 _BOOLValueForKey:@"WebKitAllowMediaContentTypesRequiringHardwareSupportAsFallback"];
  uint64_t v234 = 0x10000;
  if (!v233) {
    uint64_t v234 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFEFFFFLL | v234;
  int v235 = [a3 _BOOLValueForKey:@"WebKitAllowPrivacySensitiveOperationsInNonPersistentDataStores"];
  uint64_t v236 = 0x40000;
  if (!v235) {
    uint64_t v236 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFBFFFFLL | v236;
  int v237 = [a3 _BOOLValueForKey:@"WebKitAllowViewportShrinkToFitContent"];
  uint64_t v238 = 0x80000000000000;
  if (!v237) {
    uint64_t v238 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFF7FFFFFFFFFFFFFLL | v238;
  if ([a3 _BOOLValueForKey:@"WebKitAllowWebGLInWorkers"]) {
    uint64_t v239 = 0x800000;
  }
  else {
    uint64_t v239 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFF7FFFFFLL | v239;
  int v240 = [a3 _BOOLValueForKey:@"WebKitPerElementSpeakerSelectionEnabled"];
  uint64_t v241 = 0x10000000000000;
  if (!v240) {
    uint64_t v241 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFEFFFFFFFFFFFFFLL | v241;
  int v242 = [a3 _BOOLValueForKey:@"WebKitExposeSpeakersEnabled"];
  uint64_t v243 = 0x20000000000;
  if (!v242) {
    uint64_t v243 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFDFFFFFFFFFFLL | v243;
  int v244 = [a3 _BOOLValueForKey:@"WebKitAllowTopNavigationToDataURLs"];
  uint64_t v245 = 0x200000;
  if (!v244) {
    uint64_t v245 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFDFFFFFLL | v245;
  if ([a3 _BOOLValueForKey:@"WebKitAllowUniversalAccessFromFileURLs"]) {
    uint64_t v246 = 0x400000;
  }
  else {
    uint64_t v246 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFBFFFFFLL | v246;
  int v247 = [a3 _BOOLValueForKey:@"WebKitAlternateWebMPlayerEnabled"];
  unint64_t v248 = 0x8000000000000000;
  if (!v247) {
    unint64_t v248 = 0;
  }
  *(void *)(v4 + 704) = v248 & 0x8000000000000000 | *(void *)(v4 + 704) & 0x7FFFFFFFFFFFFFFFLL;
  int v249 = [a3 _BOOLValueForKey:@"WebKitAlwaysAllowLocalWebarchive"];
  uint64_t v250 = 0x1000000;
  if (!v249) {
    uint64_t v250 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFEFFFFFFLL | v250;
  int v251 = [a3 _BOOLValueForKey:@"WebKitAppBadgeEnabled"];
  uint64_t v252 = 0x20000000;
  if (!v251) {
    uint64_t v252 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFDFFFFFFFLL | v252;
  if ([a3 _BOOLValueForKey:@"WebKitAppHighlightsEnabled"]) {
    uint64_t v253 = 4;
  }
  else {
    uint64_t v253 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFFBLL | v253;
  WebCore::Settings::setAsyncFrameScrollingEnabled((WebCore::Settings *)v4);
  WebCore::Settings::setAsyncOverflowScrollingEnabled((WebCore::Settings *)v4);
  int v254 = [a3 _BOOLValueForKey:@"WebKitUseAsyncUIKitInteractions"];
  uint64_t v255 = 0x400000000000000;
  if (!v254) {
    uint64_t v255 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFBFFFFFFFFFFFFFFLL | v255;
  int v256 = [a3 _BOOLValueForKey:@"WebKitAsyncClipboardAPIEnabled"];
  uint64_t v257 = 0x80000000;
  if (!v256) {
    uint64_t v257 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFF7FFFFFFFLL | v257;
  int v258 = [a3 _BOOLValueForKey:@"WebKitAttachmentWideLayoutEnabled"];
  uint64_t v259 = 8;
  if (!v258) {
    uint64_t v259 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFF7 | v259;
  int v260 = [a3 _BOOLValueForKey:@"WebKitExtendedAudioDescriptionsEnabled"];
  uint64_t v261 = 0x2000;
  if (!v260) {
    uint64_t v261 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFDFFFLL | v261;
  int v262 = [a3 _BOOLValueForKey:@"WebKitAudioDescriptionsEnabled"];
  uint64_t v263 = 4096;
  if (!v262) {
    uint64_t v263 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFEFFFLL | v263;
  if ([a3 _BOOLValueForKey:@"WebKitDOMAudioSessionEnabled"]) {
    uint64_t v264 = 1024;
  }
  else {
    uint64_t v264 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFBFFLL | v264;
  int v265 = [a3 _BOOLValueForKey:@"WebKitDOMAudioSessionFullEnabled"];
  uint64_t v266 = 2048;
  if (!v265) {
    uint64_t v266 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFF7FFLL | v266;
  int v267 = [a3 _BOOLValueForKey:@"WebKitAutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth"];
  uint64_t v268 = 0x2000000000;
  if (!v267) {
    uint64_t v268 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFDFFFFFFFFFLL | v268;
  int v269 = [a3 _BOOLValueForKey:@"WebKitBeaconAPIEnabled"];
  uint64_t v270 = 0x100000000000;
  if (!v269) {
    uint64_t v270 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFEFFFFFFFFFFFLL | v270;
  int v271 = [a3 _BOOLValueForKey:@"WebKitBroadcastChannelEnabled"];
  uint64_t v272 = 0x800000000000;
  if (!v271) {
    uint64_t v272 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFF7FFFFFFFFFFFLL | v272;
  int v273 = [a3 _BOOLValueForKey:@"WebKitBroadcastChannelOriginPartitioningEnabled"];
  uint64_t v274 = 0x1000000000000;
  if (!v273) {
    uint64_t v274 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFEFFFFFFFFFFFFLL | v274;
  if ([a3 _BOOLValueForKey:@"WebKitCSS3DTransformBackfaceVisibilityInteroperabilityEnabled"])uint64_t v275 = 1024; {
  else
  }
    uint64_t v275 = 0;
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFBFFLL | v275;
  if ([a3 _BOOLValueForKey:@"WebKitCSSCounterStyleAtRuleImageSymbolsEnabled"]) {
    uint64_t v276 = 0x10000;
  }
  else {
    uint64_t v276 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFEFFFFLL | v276;
  int v277 = [a3 _BOOLValueForKey:@"WebKitCSSCounterStyleAtRulesEnabled"];
  uint64_t v278 = 0x20000;
  if (!v277) {
    uint64_t v278 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFDFFFFLL | v278;
  int v279 = [a3 _BOOLValueForKey:@"WebKitCSSFontFaceSizeAdjustEnabled"];
  uint64_t v280 = 0x100000;
  if (!v279) {
    uint64_t v280 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFEFFFFFLL | v280;
  int v281 = [a3 _BOOLValueForKey:@"WebKitCSSStartingStyleAtRuleEnabled"];
  uint64_t v282 = 0x8000000000;
  if (!v281) {
    uint64_t v282 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFF7FFFFFFFFFLL | v282;
  int v283 = [a3 _BOOLValueForKey:@"WebKitAccentColorEnabled"];
  uint64_t v284 = 128;
  if (!v283) {
    uint64_t v284 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFF7FLL | v284;
  if ([a3 _BOOLValueForKey:@"WebKitCSSAnchorPositioningEnabled"]) {
    uint64_t v285 = 2048;
  }
  else {
    uint64_t v285 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFF7FFLL | v285;
  int v286 = [a3 _BOOLValueForKey:@"WebKitCSSContentVisibilityEnabled"];
  uint64_t v287 = 0x8000;
  if (!v286) {
    uint64_t v287 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFF7FFFLL | v287;
  if ([a3 _BOOLValueForKey:@"WebKitCSSInputSecurityEnabled"]) {
    uint64_t v288 = 0x400000;
  }
  else {
    uint64_t v288 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFBFFFFFLL | v288;
  if ([a3 _BOOLValueForKey:@"WebKitMasonryEnabled"]) {
    uint64_t v289 = 0x800000;
  }
  else {
    uint64_t v289 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFF7FFFFFLL | v289;
  int v290 = [a3 _BOOLValueForKey:@"WebKitCSSMotionPathEnabled"];
  uint64_t v291 = 0x8000000;
  if (!v290) {
    uint64_t v291 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFF7FFFFFFLL | v291;
  int v292 = [a3 _BOOLValueForKey:@"WebKitCSSNestingEnabled"];
  uint64_t v293 = 0x10000000;
  if (!v292) {
    uint64_t v293 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFEFFFFFFFLL | v293;
  if ([a3 _BOOLValueForKey:@"WebKitOverscrollBehaviorEnabled"]) {
    uint64_t v294 = 0x100000000000;
  }
  else {
    uint64_t v294 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFEFFFFFFFFFFFLL | v294;
  int v295 = [a3 _BOOLValueForKey:@"WebKitCSSPaintingAPIEnabled"];
  uint64_t v296 = 0x20000000;
  if (!v295) {
    uint64_t v296 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFDFFFFFFFLL | v296;
  int v297 = [a3 _BOOLValueForKey:@"WebKitCSSRhythmicSizingEnabled"];
  uint64_t v298 = 0x40000000;
  if (!v297) {
    uint64_t v298 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFBFFFFFFFLL | v298;
  int v299 = [a3 _BOOLValueForKey:@"WebKitCSSScopeAtRuleEnabled"];
  uint64_t v300 = 0x200000000;
  if (!v299) {
    uint64_t v300 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFDFFFFFFFFLL | v300;
  int v301 = [a3 _BOOLValueForKey:@"WebKitCSSScrollAnchoringEnabled"];
  uint64_t v302 = 0x400000000;
  if (!v301) {
    uint64_t v302 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFBFFFFFFFFLL | v302;
  int v303 = [a3 _BOOLValueForKey:@"WebKitSpringTimingFunctionEnabled"];
  uint64_t v304 = 0x4000000000000000;
  if (!v303) {
    uint64_t v304 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xBFFFFFFFFFFFFFFFLL | v304;
  int v305 = [a3 _BOOLValueForKey:@"WebKitCSSTypedOMColorEnabled"];
  uint64_t v306 = 0x2000000000000;
  if (!v305) {
    uint64_t v306 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFDFFFFFFFFFFFFLL | v306;
  int v307 = [a3 _BOOLValueForKey:@"WebKitCSSUnprefixedBackdropFilterEnabled"];
  uint64_t v308 = 0x4000000000000;
  if (!v307) {
    uint64_t v308 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFBFFFFFFFFFFFFLL | v308;
  if ([a3 _BOOLValueForKey:@"WebKitCSSAppearanceBaseEnabled"]) {
    uint64_t v309 = 4096;
  }
  else {
    uint64_t v309 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFEFFFLL | v309;
  int v310 = [a3 _BOOLValueForKey:@"WebKitCSSBackgroundClipBorderAreaEnabled"];
  uint64_t v311 = 0x2000;
  if (!v310) {
    uint64_t v311 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFDFFFLL | v311;
  int v312 = [a3 _BOOLValueForKey:@"WebKitCSSColorLayersEnabled"];
  uint64_t v313 = 0x4000;
  if (!v312) {
    uint64_t v313 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFBFFFLL | v313;
  int v314 = [a3 _BOOLValueForKey:@"WebKitCSSDPropertyEnabled"];
  uint64_t v315 = 0x40000;
  if (!v314) {
    uint64_t v315 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFBFFFFLL | v315;
  int v316 = [a3 _BOOLValueForKey:@"WebKitCSSFieldSizingEnabled"];
  uint64_t v317 = 0x80000;
  if (!v316) {
    uint64_t v317 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFF7FFFFLL | v317;
  int v318 = [a3 _BOOLValueForKey:@"WebKitCSSFontVariantEmojiEnabled"];
  uint64_t v319 = 0x200000;
  if (!v318) {
    uint64_t v319 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFDFFFFFLL | v319;
  if ([a3 _BOOLValueForKey:@"WebKitCSSLightDarkEnabled"]) {
    uint64_t v320 = 0x800000;
  }
  else {
    uint64_t v320 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFF7FFFFFLL | v320;
  int v321 = [a3 _BOOLValueForKey:@"WebKitCSSLineClampEnabled"];
  uint64_t v322 = 0x1000000;
  if (!v321) {
    uint64_t v322 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFEFFFFFFLL | v322;
  int v323 = [a3 _BOOLValueForKey:@"WebKitCSSLineFitEdgeEnabled"];
  uint64_t v324 = 0x2000000;
  if (!v323) {
    uint64_t v324 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFDFFFFFFLL | v324;
  int v325 = [a3 _BOOLValueForKey:@"WebKitCSSMarginTrimEnabled"];
  uint64_t v326 = 0x4000000;
  if (!v325) {
    uint64_t v326 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFBFFFFFFLL | v326;
  int v327 = [a3 _BOOLValueForKey:@"WebKitCSSRubyAlignEnabled"];
  uint64_t v328 = 0x80000000;
  if (!v327) {
    uint64_t v328 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFF7FFFFFFFLL | v328;
  int v329 = [a3 _BOOLValueForKey:@"WebKitCSSRubyOverhangEnabled"];
  uint64_t v330 = 0x100000000;
  if (!v329) {
    uint64_t v330 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFEFFFFFFFFLL | v330;
  int v331 = [a3 _BOOLValueForKey:@"WebKitCSSScrollbarColorEnabled"];
  uint64_t v332 = 0x800000000;
  if (!v331) {
    uint64_t v332 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFF7FFFFFFFFLL | v332;
  int v333 = [a3 _BOOLValueForKey:@"WebKitCSSScrollbarGutterEnabled"];
  uint64_t v334 = 0x1000000000;
  if (!v333) {
    uint64_t v334 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFEFFFFFFFFFLL | v334;
  int v335 = [a3 _BOOLValueForKey:@"WebKitCSSScrollbarWidthEnabled"];
  uint64_t v336 = 0x2000000000;
  if (!v335) {
    uint64_t v336 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFDFFFFFFFFFLL | v336;
  int v337 = [a3 _BOOLValueForKey:@"WebKitCSSShapeFunctionEnabled"];
  uint64_t v338 = 0x4000000000;
  if (!v337) {
    uint64_t v338 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFBFFFFFFFFFLL | v338;
  int v339 = [a3 _BOOLValueForKey:@"WebKitCSSStyleQueriesEnabled"];
  uint64_t v340 = 0x10000000000;
  if (!v339) {
    uint64_t v340 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFEFFFFFFFFFFLL | v340;
  int v341 = [a3 _BOOLValueForKey:@"WebKitCSSTextAutospaceEnabled"];
  uint64_t v342 = 0x20000000000;
  if (!v341) {
    uint64_t v342 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFDFFFFFFFFFFLL | v342;
  int v343 = [a3 _BOOLValueForKey:@"WebKitCSSTextBoxTrimEnabled"];
  uint64_t v344 = 0x40000000000;
  if (!v343) {
    uint64_t v344 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFBFFFFFFFFFFLL | v344;
  int v345 = [a3 _BOOLValueForKey:@"WebKitCSSTextGroupAlignEnabled"];
  uint64_t v346 = 0x80000000000;
  if (!v345) {
    uint64_t v346 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFF7FFFFFFFFFFLL | v346;
  if ([a3 _BOOLValueForKey:@"WebKitCSSTextJustifyEnabled"]) {
    uint64_t v347 = 0x100000000000;
  }
  else {
    uint64_t v347 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFEFFFFFFFFFFFLL | v347;
  int v348 = [a3 _BOOLValueForKey:@"WebKitCSSTextSpacingEnabled"];
  uint64_t v349 = 0x200000000000;
  if (!v348) {
    uint64_t v349 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFDFFFFFFFFFFFLL | v349;
  int v350 = [a3 _BOOLValueForKey:@"WebKitCSSTextUnderlinePositionLeftRightEnabled"];
  uint64_t v351 = 0x400000000000;
  if (!v350) {
    uint64_t v351 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFBFFFFFFFFFFFLL | v351;
  int v352 = [a3 _BOOLValueForKey:@"WebKitCSSTextWrapStyleEnabled"];
  uint64_t v353 = 0x1000000000000;
  if (!v352) {
    uint64_t v353 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFEFFFFFFFFFFFFLL | v353;
  int v354 = [a3 _BOOLValueForKey:@"WebKitCSSTextWrapPrettyEnabled"];
  uint64_t v355 = 0x800000000000;
  if (!v354) {
    uint64_t v355 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFF7FFFFFFFFFFFLL | v355;
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFFFELL | [a3 _BOOLValueForKey:@"WebKitCSSOMViewScrollingAPIEnabled"];
  int v356 = [a3 _BOOLValueForKey:@"WebKitCSSOMViewSmoothScrollingEnabled"];
  uint64_t v357 = 2;
  if (!v356) {
    uint64_t v357 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFFFDLL | v357;
  if ([a3 _BOOLValueForKey:@"WebKitCacheAPIEnabled"]) {
    uint64_t v358 = 0x2000000000000;
  }
  else {
    uint64_t v358 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFDFFFFFFFFFFFFLL | v358;
  if ([a3 _BOOLValueForKey:@"WebKitCanvasColorSpaceEnabled"]) {
    uint64_t v359 = 0x4000000000000;
  }
  else {
    uint64_t v359 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFBFFFFFFFFFFFFLL | v359;
  [a3 _BOOLValueForKey:@"WebKitCanvasFiltersEnabled"];
  WebCore::Settings::setCanvasFiltersEnabled((WebCore::Settings *)v4);
  int v360 = [a3 _BOOLValueForKey:@"WebKitCanvasLayersEnabled"];
  uint64_t v361 = 0x20000000000000;
  if (!v360) {
    uint64_t v361 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFDFFFFFFFFFFFFFLL | v361;
  int v362 = [a3 _BOOLValueForKey:@"WebKitCanvasUsesAcceleratedDrawing"];
  uint64_t v363 = 0x40000000000000;
  if (!v362) {
    uint64_t v363 = 0;
  }
  unint64_t *v18 = *v18 & 0xFEBFFFFFFFFFFFFFLL | v363;
  int v364 = [a3 _BOOLValueForKey:@"WebKitClearSiteDataHTTPHeaderEnabled"];
  uint64_t v365 = 0x200000000000000;
  if (!v364) {
    uint64_t v365 = 0;
  }
  unint64_t *v18 = *v18 & 0xFDFFFFFFFFFFFFFFLL | v365;
  if ([a3 _BOOLValueForKey:@"WebKitClientBadgeEnabled"]) {
    uint64_t v366 = 0x400000000000000;
  }
  else {
    uint64_t v366 = 0;
  }
  unint64_t *v18 = *v18 & 0xFBFFFFFFFFFFFFFFLL | v366;
  if ([a3 _BOOLValueForKey:@"WebKitInputTypeColorEnabled"]) {
    uint64_t v367 = 0x4000000;
  }
  else {
    uint64_t v367 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFBFFFFFFLL | v367;
  [a3 _BOOLValueForKey:@"WebKitShowDebugBorders"];
  WebCore::Settings::setShowDebugBorders((WebCore::Settings *)v4);
  [a3 _BOOLValueForKey:@"WebKitShowRepaintCounter"];
  WebCore::Settings::setShowRepaintCounter((WebCore::Settings *)v4);
  int v368 = [a3 _BOOLValueForKey:@"WebKitCompressionStreamEnabled"];
  uint64_t v369 = 0x2000000000000000;
  if (!v368) {
    uint64_t v369 = 0;
  }
  unint64_t *v18 = *v18 & 0xDFFFFFFFFFFFFFFFLL | v369;
  if ([a3 _BOOLValueForKey:@"WebKitContactPickerAPIEnabled"]) {
    uint64_t v370 = 0x4000000000000000;
  }
  else {
    uint64_t v370 = 0;
  }
  unint64_t v371 = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFFELL;
  unint64_t *v18 = *v18 & 0xBFFFFFFFFFFFFFFFLL | v370;
  *(void *)(v4 + 672) = v371;
  int v372 = [a3 _BOOLValueForKey:@"WebKitCookieStoreManagerEnabled"];
  uint64_t v373 = 16;
  if (!v372) {
    uint64_t v373 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFEFLL | v373;
  if ([a3 _BOOLValueForKey:@"WebKitCookieStoreAPIExtendedAttributesEnabled"]) {
    uint64_t v374 = 8;
  }
  else {
    uint64_t v374 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFF7 | v374;
  int v375 = [a3 _BOOLValueForKey:@"WebKitCookieStoreAPIEnabled"];
  uint64_t v376 = 4;
  if (!v375) {
    uint64_t v376 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFFBLL | v376;
  int v377 = [a3 _BOOLValueForKey:@"WebKitCrossDocumentViewTransitionsEnabled"];
  uint64_t v378 = 64;
  if (!v377) {
    uint64_t v378 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFFBFLL | v378;
  int v379 = [a3 _BOOLValueForKey:@"WebKitCrossOriginEmbedderPolicyEnabled"];
  uint64_t v380 = 256;
  if (!v379) {
    uint64_t v380 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFEFFLL | v380;
  if ([a3 _BOOLValueForKey:@"WebKitCrossOriginOpenerPolicyEnabled"]) {
    uint64_t v381 = 512;
  }
  else {
    uint64_t v381 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFFFFFFFFFFFFDFFLL | v381;
  if ([a3 _BOOLValueForKey:@"WebKitCustomStateSetEnabled"]) {
    uint64_t v382 = 0x10000000000000;
  }
  else {
    uint64_t v382 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFEFFFFFFFFFFFFFLL | v382;
  if ([a3 _BOOLValueForKey:@"WebKitDOMPasteAccessRequestsEnabled"]) {
    uint64_t v383 = 8;
  }
  else {
    uint64_t v383 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFF7 | v383;
  if ([a3 _BOOLValueForKey:@"WebKitDOMTimersThrottlingEnabledPreferenceKey"]) {
    uint64_t v384 = 64;
  }
  else {
    uint64_t v384 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFBFLL | v384;
  if ([a3 _BOOLValueForKey:@"WebKitDataTransferItemsEnabled"]) {
    uint64_t v385 = 0x20000000000000;
  }
  else {
    uint64_t v385 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFDFFFFFFFFFFFFFLL | v385;
  int v386 = [a3 _BOOLValueForKey:@"WebKitDataListElementEnabled"];
  uint64_t v387 = 32;
  if (!v386) {
    uint64_t v387 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFDFLL | v387;
  int v388 = [a3 _BOOLValueForKey:@"WebKitInputTypeDateEnabled"];
  uint64_t v389 = 0x8000000;
  if (!v388) {
    uint64_t v389 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFF7FFFFFFLL | v389;
  if ([a3 _BOOLValueForKey:@"WebKitDateTimeInputsEditableComponentsEnabled"]) {
    uint64_t v390 = 64;
  }
  else {
    uint64_t v390 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFFBFLL | v390;
  int v391 = [a3 _BOOLValueForKey:@"WebKitDeclarativeShadowRootsParserAPIsEnabled"];
  uint64_t v392 = 0x40000000000000;
  if (!v391) {
    uint64_t v392 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFFBFFFFFFFFFFFFFLL | v392;
  if ([a3 _BOOLValueForKey:@"WebKitDeclarativeShadowRootsSerializerAPIsEnabled"]) {
    uint64_t v393 = 0x80000000000000;
  }
  else {
    uint64_t v393 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFF7FFFFFFFFFFFFFLL | v393;
  int v394 = [a3 _BOOLValueForKey:@"WebKitDeclarativeWebPush"];
  uint64_t v395 = 128;
  if (!v394) {
    uint64_t v395 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFFF7FLL | v395;
  int v396 = [a3 _BOOLValueForKey:@"WebKitShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint"];
  uint64_t v397 = 0x800000000;
  if (!v396) {
    uint64_t v397 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFF7FFFFFFFFLL | v397;
  int v398 = [a3 _BOOLValueForKey:@"WebKitDeprecateAESCFBWebCryptoEnabled"];
  uint64_t v399 = 0x100000000000000;
  if (!v398) {
    uint64_t v399 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFEFFFFFFFFFFFFFFLL | v399;
  int v400 = [a3 _BOOLValueForKey:@"WebKitDeprecateRSAESPKCSWebCryptoEnabled"];
  uint64_t v401 = 0x200000000000000;
  if (!v400) {
    uint64_t v401 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFDFFFFFFFFFFFFFFLL | v401;
  if ([a3 _BOOLValueForKey:@"WebKitDeprecationReportingEnabled"]) {
    uint64_t v402 = 0x400000000000000;
  }
  else {
    uint64_t v402 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xFBFFFFFFFFFFFFFFLL | v402;
  int v403 = [a3 _BOOLValueForKey:@"WebKitUAVisualTransitionDetectionEnabled"];
  uint64_t v404 = 0x8000;
  if (!v403) {
    uint64_t v404 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFF7FFFLL | v404;
  int v405 = [a3 _BOOLValueForKey:@"WebKitDiagnosticLoggingEnabled"];
  uint64_t v406 = 0x2000000000000000;
  if (!v405) {
    uint64_t v406 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xDFFFFFFFFFFFFFFFLL | v406;
  if ([a3 _BOOLValueForKey:@"WebKitDigitalCredentialsEnabled"]) {
    uint64_t v407 = 0x4000000000000000;
  }
  else {
    uint64_t v407 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xBFFFFFFFFFFFFFFFLL | v407;
  int v408 = [a3 _BOOLValueForKey:@"WebKitDirectoryUploadEnabled"];
  unint64_t v409 = 0x8000000000000000;
  if (!v408) {
    unint64_t v409 = 0;
  }
  *(void *)(v4 + 672) = v409 & 0x8000000000000000 | *(void *)(v4 + 672) & 0x7FFFFFFFFFFFFFFFLL;
  int v410 = [a3 _BOOLValueForKey:@"WebKitIsThirdPartyCookieBlockingDisabled"];
  uint64_t v411 = 0x800000000000000;
  if (!v410) {
    uint64_t v411 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xF7FFFFFFFFFFFFFFLL | v411;
  int v412 = [a3 _BOOLValueForKey:@"WebKitIsFirstPartyWebsiteDataRemovalDisabled"];
  uint64_t v413 = 0x4000000000000;
  if (!v412) {
    uint64_t v413 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFBFFFFFFFFFFFFLL | v413;
  int v414 = [a3 _BOOLValueForKey:@"WebKitDisallowSyncXHRDuringPageDismissalEnabled"];
  uint64_t v415 = 2;
  if (!v414) {
    uint64_t v415 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFFFDLL | v415;
  int v416 = [a3 _BOOLValueForKey:@"WebKitShouldDropNearSuspendedAssertionAfterDelay"];
  uint64_t v417 = 0x4000000000;
  if (!v416) {
    uint64_t v417 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFBFFFFFFFFFLL | v417;
  if ([a3 _BOOLValueForKey:@"WebKitEmbedElementEnabled"]) {
    uint64_t v418 = 512;
  }
  else {
    uint64_t v418 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFDFFLL | v418;
  if ([a3 _BOOLValueForKey:@"WebKitCanvasFingerprintingQuirkEnabled"]) {
    uint64_t v419 = 0x10000000000000;
  }
  else {
    uint64_t v419 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFEFFFFFFFFFFFFFLL | v419;
  [a3 _BOOLValueForKey:@"WebKitICECandidateFilteringEnabled"];
  WebCore::Settings::setICECandidateFilteringEnabled((WebCore::Settings *)v4);
  int v420 = [a3 _BOOLValueForKey:@"WebKitLegacyEncryptedMediaAPIEnabled"];
  uint64_t v421 = 0x100000000;
  if (!v420) {
    uint64_t v421 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFEFFFFFFFFLL | v421;
  [a3 _BOOLValueForKey:@"WebKitMockCaptureDevicesEnabled"];
  WebCore::Settings::setMockCaptureDevicesEnabled((WebCore::Settings *)v4);
  int v422 = [a3 _BOOLValueForKey:@"WebKitAuxclickEventEnabled"];
  uint64_t v423 = 0x8000000000;
  if (!v422) {
    uint64_t v423 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFF7FFFFFFFFFLL | v423;
  int v424 = [a3 _BOOLValueForKey:@"WebKitBlobFileAccessEnforcementEnabled"];
  uint64_t v425 = 0x200000000000;
  if (!v424) {
    uint64_t v425 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFDFFFFFFFFFFFLL | v425;
  int v426 = [a3 _BOOLValueForKey:@"WebKitEnterKeyHintEnabled"];
  uint64_t v427 = 2048;
  if (!v426) {
    uint64_t v427 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFF7FFLL | v427;
  int v428 = [a3 _BOOLValueForKey:@"WebKitEventHandlerDrivenSmoothKeyboardScrollingEnabled"];
  uint64_t v429 = 4096;
  if (!v428) {
    uint64_t v429 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFEFFFLL | v429;
  int v430 = [a3 _BOOLValueForKey:@"WebKitFTPEnabled"];
  uint64_t v431 = 0x1000000;
  if (!v430) {
    uint64_t v431 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFEFFFFFFLL | v431;
  int v432 = [a3 _BOOLValueForKey:@"WebKitFetchPriorityEnabled"];
  uint64_t v433 = 0x2000;
  if (!v432) {
    uint64_t v433 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFDFFFLL | v433;
  if ([a3 _BOOLValueForKey:@"WebKitFileSystemAccessEnabled"]) {
    uint64_t v434 = 0x8000;
  }
  else {
    uint64_t v434 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFF7FFFLL | v434;
  if ([a3 _BOOLValueForKey:@"WebKitFileReaderAPIEnabled"]) {
    uint64_t v435 = 0x4000;
  }
  else {
    uint64_t v435 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFBFFFLL | v435;
  int v436 = [a3 _BOOLValueForKey:@"WebKitFilterLinkDecorationByDefaultEnabled"];
  uint64_t v437 = 0x10000;
  if (!v436) {
    uint64_t v437 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFEFFFFLL | v437;
  if ([a3 _BOOLValueForKey:@"WebKitFullScreenKeyboardLock"]) {
    uint64_t v438 = 0x8000;
  }
  else {
    uint64_t v438 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFF7FFFLL | v438;
  if ([a3 _BOOLValueForKey:@"WebKitFullScreenEnabled"]) {
    uint64_t v439 = 0x4000;
  }
  else {
    uint64_t v439 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFBFFFLL | v439;
  int v440 = [a3 _BOOLValueForKey:@"WebKitBlockMediaLayerRehostingInWebContentProcess"];
  uint64_t v441 = 0x100000;
  if (!v440) {
    uint64_t v441 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFEFFFFFLL | v441;
  if ([a3 _BOOLValueForKey:@"WebKitManageCaptureStatusBarInGPUProcessEnabled"]) {
    uint64_t v442 = 0x80000000000000;
  }
  else {
    uint64_t v442 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFF7FFFFFFFFFFFFFLL | v442;
  int v443 = [a3 _BOOLValueForKey:@"WebKitUseGPUProcessForWebGLEnabled"];
  uint64_t v444 = 0x200000;
  if (!v443) {
    uint64_t v444 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFDFFFFFLL | v444;
  int v445 = [a3 _BOOLValueForKey:@"WebKitWebRTCPlatformCodecsInGPUProcessEnabled"];
  uint64_t v446 = 0x20000000000;
  if (!v445) {
    uint64_t v446 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFDFFFFFFFFFFLL | v446;
  int v447 = [a3 _BOOLValueForKey:@"WebKitGamepadTriggerRumbleEnabled"];
  uint64_t v448 = 0x20000;
  if (!v447) {
    uint64_t v448 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFDFFFFLL | v448;
  int v449 = [a3 _BOOLValueForKey:@"WebKitGamepadVibrationActuatorEnabled"];
  uint64_t v450 = 0x40000;
  if (!v449) {
    uint64_t v450 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFBFFFFLL | v450;
  int v451 = [a3 _BOOLValueForKey:@"WebKitGamepadsEnabled"];
  uint64_t v452 = 0x80000;
  if (!v451) {
    uint64_t v452 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFF7FFFFLL | v452;
  if ([a3 _BOOLValueForKey:@"WebKitGenericCueAPIEnabled"]) {
    uint64_t v453 = 0x4000;
  }
  else {
    uint64_t v453 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFBFFFLL | v453;
  [a3 _BOOLValueForKey:@"WebKitGraphicsContextFiltersEnabled"];
  WebCore::Settings::setGraphicsContextFiltersEnabled((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitAcceleratedDrawingEnabled"]) {
    uint64_t v454 = 64;
  }
  else {
    uint64_t v454 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFFBFLL | v454;
  if ([a3 _BOOLValueForKey:@"WebKitDetailsNameAttributeEnabled"]) {
    uint64_t v455 = 0x800000000000000;
  }
  else {
    uint64_t v455 = 0;
  }
  *(void *)(v4 + 672) = *(void *)(v4 + 672) & 0xF7FFFFFFFFFFFFFFLL | v455;
  int v456 = [a3 _BOOLValueForKey:@"WebKitModelElementEnabled"];
  uint64_t v457 = 0x100000000000000;
  if (!v456) {
    uint64_t v457 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFEFFFFFFFFFFFFFFLL | v457;
  int v458 = [a3 _BOOLValueForKey:@"WebKitInvokerAttributesEnabled"];
  uint64_t v459 = 0x2000000000000;
  if (!v458) {
    uint64_t v459 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFDFFFFFFFFFFFFLL | v459;
  if ([a3 _BOOLValueForKey:@"WebKitPopoverAttributeEnabled"]) {
    uint64_t v460 = 0x4000000000000;
  }
  else {
    uint64_t v460 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFBFFFFFFFFFFFFLL | v460;
  int v461 = [a3 _BOOLValueForKey:@"WebKitSwitchControlEnabled"];
  uint64_t v462 = 16;
  if (!v461) {
    uint64_t v462 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFEFLL | v462;
  if ([a3 _BOOLValueForKey:@"WebKitHTTPSByDefaultEnabled"]) {
    uint64_t v463 = 0x1000000000;
  }
  else {
    uint64_t v463 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFEFFFFFFFFFLL | v463;
  [a3 _BOOLValueForKey:@"WebKitHiddenPageDOMTimerThrottlingAutoIncreases"];
  WebCore::Settings::setHiddenPageDOMTimerThrottlingAutoIncreases((WebCore::Settings *)v4);
  [a3 _BOOLValueForKey:@"WebKitHiddenPageDOMTimerThrottlingEnabled"];
  WebCore::Settings::setHiddenPageDOMTimerThrottlingEnabled((WebCore::Settings *)v4);
  int v464 = [a3 _BOOLValueForKey:@"WebKitHighlightAPIEnabled"];
  uint64_t v465 = 0x400000000;
  if (!v464) {
    uint64_t v465 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFBFFFFFFFFLL | v465;
  if ([a3 _BOOLValueForKey:@"WebKitHyperlinkAuditingEnabled"]) {
    uint64_t v466 = 0x2000000000;
  }
  else {
    uint64_t v466 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFDFFFFFFFFFLL | v466;
  int v467 = [a3 _BOOLValueForKey:@"WebKitItpDebugModeEnabled"];
  uint64_t v468 = 0x1000000000000000;
  if (!v467) {
    uint64_t v468 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xEFFFFFFFFFFFFFFFLL | v468;
  [a3 _BOOLValueForKey:@"WebKitTextAutosizingUsesIdempotentMode"];
  WebCore::Settings::setTextAutosizingUsesIdempotentMode((WebCore::Settings *)v4);
  int v469 = [a3 _BOOLValueForKey:@"WebKitIgnoreIframeEmbeddingProtectionsEnabled"];
  uint64_t v470 = 0x10000000000;
  if (!v469) {
    uint64_t v470 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFEFFFFFFFFFFLL | v470;
  if ([a3 _BOOLValueForKey:@"WebKitImageAnalysisDuringFindInPageEnabled"]) {
    uint64_t v471 = 0x400000;
  }
  else {
    uint64_t v471 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFBFFFFFLL | v471;
  int v472 = [a3 _BOOLValueForKey:@"WebKitImageAnimationControlEnabled"];
  uint64_t v473 = 0x4000000000000000;
  if (!v472) {
    uint64_t v473 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xBFFFFFFFFFFFFFFFLL | v473;
  if ([a3 _BOOLValueForKey:@"WebKitImageCaptureEnabled"]) {
    uint64_t v474 = 0x80000000000;
  }
  else {
    uint64_t v474 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFF7FFFFFFFFFFLL | v474;
  if ([a3 _BOOLValueForKey:@"WebKitInWindowFullscreenEnabled"]) {
    uint64_t v475 = 0x80000000000;
  }
  else {
    uint64_t v475 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFF7FFFFFFFFFFLL | v475;
  if ([a3 _BOOLValueForKey:@"WebKitIndexedDBAPIEnabled"]) {
    uint64_t v476 = 0x200000000000;
  }
  else {
    uint64_t v476 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFDFFFFFFFFFFFLL | v476;
  if ([a3 _BOOLValueForKey:@"WebKitJavaScriptEnabled"]) {
    uint64_t v477 = 512;
  }
  else {
    uint64_t v477 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFDFFLL | v477;
  [a3 _BOOLValueForKey:@"WebKitLayerBasedSVGEngineEnabled"];
  WebCore::Settings::setLayerBasedSVGEngineEnabled((WebCore::Settings *)v4);
  int v478 = [a3 _BOOLValueForKey:@"WebKitLazyIframeLoadingEnabled"];
  uint64_t v479 = 4;
  if (!v478) {
    uint64_t v479 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFFFBLL | v479;
  int v480 = [a3 _BOOLValueForKey:@"WebKitLazyImageLoadingEnabled"];
  uint64_t v481 = 8;
  if (!v480) {
    uint64_t v481 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFFF7 | v481;
  [a3 _BOOLValueForKey:@"WebKitLegacyOverflowScrollingTouchEnabled"];
  WebCore::Settings::setLegacyOverflowScrollingTouchEnabled((WebCore::Settings *)v4);
  [a3 _BOOLValueForKey:@"WebKitLegacyLineLayoutVisualCoverageEnabled"];
  WebCore::Settings::setLegacyLineLayoutVisualCoverageEnabled((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitShowModalDialogEnabled"]) {
    uint64_t v482 = 0x4000000000000;
  }
  else {
    uint64_t v482 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFBFFFFFFFFFFFFLL | v482;
  int v483 = [a3 _BOOLValueForKey:@"WebKitMediaCaptureRequiresSecureConnection"];
  uint64_t v484 = 0x400000000000;
  if (!v483) {
    uint64_t v484 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFBFFFFFFFFFFFLL | v484;
  int v485 = [a3 _BOOLValueForKey:@"WebKitLinkSanitizerEnabled"];
  uint64_t v486 = 4096;
  if (!v485) {
    uint64_t v486 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFEFFFLL | v486;
  int v487 = [a3 _BOOLValueForKey:@"WebKitLinkPreloadResponsiveImagesEnabled"];
  uint64_t v488 = 2048;
  if (!v487) {
    uint64_t v488 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFF7FFLL | v488;
  if ([a3 _BOOLValueForKey:@"WebKitLinkModulePreloadEnabled"]) {
    uint64_t v489 = 64;
  }
  else {
    uint64_t v489 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFFBFLL | v489;
  int v490 = [a3 _BOOLValueForKey:@"WebKitLinkPreconnectEarlyHintsEnabled"];
  uint64_t v491 = 128;
  if (!v490) {
    uint64_t v491 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFF7FLL | v491;
  if ([a3 _BOOLValueForKey:@"WebKitLinkPrefetchEnabled"]) {
    uint64_t v492 = 512;
  }
  else {
    uint64_t v492 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFDFFLL | v492;
  if ([a3 _BOOLValueForKey:@"WebKitLiveRangeSelectionEnabled"]) {
    uint64_t v493 = 0x2000;
  }
  else {
    uint64_t v493 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFDFFFLL | v493;
  if ([a3 _BOOLValueForKey:@"WebKitLoadWebArchiveWithEphemeralStorageEnabled"]) {
    uint64_t v494 = 0x2000000;
  }
  else {
    uint64_t v494 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFDFFFFFFLL | v494;
  int v495 = [a3 _BOOLValueForKey:@"WebKitLocalFileContentSniffingEnabledPreferenceKey"];
  uint64_t v496 = 0x10000;
  if (!v495) {
    uint64_t v496 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFEFFFFLL | v496;
  int v497 = [a3 _BOOLValueForKey:@"WebKitLocalStorageEnabledPreferenceKey"];
  uint64_t v498 = 0x20000;
  if (!v497) {
    uint64_t v498 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFF9FFFFLL | v498;
  int v499 = [a3 _BOOLValueForKey:@"WebKitLogsPageMessagesToSystemConsoleEnabled"];
  uint64_t v500 = 0x200000;
  if (!v499) {
    uint64_t v500 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFDFFFFFLL | v500;
  if ([a3 _BOOLValueForKey:@"WebKitLoginStatusAPIEnabled"]) {
    uint64_t v501 = 0x80000;
  }
  else {
    uint64_t v501 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFF7FFFFLL | v501;
  if ([a3 _BOOLValueForKey:@"WebKitMainContentUserGestureOverrideEnabled"]) {
    uint64_t v502 = 0x400000;
  }
  else {
    uint64_t v502 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFBFFFFFLL | v502;
  if ([a3 _BOOLValueForKey:@"WebKitManagedMediaSourceEnabled"]) {
    uint64_t v503 = 0x2000000000;
  }
  else {
    uint64_t v503 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFDFFFFFFFFFLL | v503;
  if ([a3 _BOOLValueForKey:@"WebKitManagedMediaSourceNeedsAirPlay"]) {
    uint64_t v504 = 0x8000000000;
  }
  else {
    uint64_t v504 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFF7FFFFFFFFFLL | v504;
  [a3 _BOOLValueForKey:@"WebKitCoreMathMLEnabled"];
  WebCore::Settings::setCoreMathMLEnabled((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitMediaCapabilitiesExtensionsEnabled"]) {
    uint64_t v505 = 0x2000000;
  }
  else {
    uint64_t v505 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFDFFFFFFLL | v505;
  if ([a3 _BOOLValueForKey:@"WebKitMediaCapabilityGrantsEnabled"]) {
    uint64_t v506 = 0x2000;
  }
  else {
    uint64_t v506 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFFFFFDFFFLL | v506;
  if ([a3 _BOOLValueForKey:@"WebKitMediaSessionEnabled"]) {
    uint64_t v507 = 0x1000000000;
  }
  else {
    uint64_t v507 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFEFFFFFFFFFLL | v507;
  int v508 = [a3 _BOOLValueForKey:@"WebKitMediaSourceEnabled"];
  uint64_t v509 = 0x40000000;
  if (!v508) {
    uint64_t v509 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFBFFFFFFFLL | v509;
  int v510 = [a3 _BOOLValueForKey:@"WebKitMediaDevicesEnabled"];
  uint64_t v511 = 0x800000000000;
  if (!v510) {
    uint64_t v511 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFF7FFFFFFFFFFFLL | v511;
  int v512 = [a3 _BOOLValueForKey:@"WebKitMediaRecorderEnabled"];
  uint64_t v513 = 0x800000000;
  if (!v512) {
    uint64_t v513 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFF7FFFFFFFFLL | v513;
  if ([a3 _BOOLValueForKey:@"WebKitMediaSessionCaptureToggleAPIEnabled"]) {
    uint64_t v514 = 0x20000000;
  }
  else {
    uint64_t v514 = 0;
  }
  unint64_t v515 = *(void *)(v4 + 688) & 0xFFFFFFFFDFFFFFFFLL | v514;
  *(void *)(v4 + 712) &= ~0x10000000000uLL;
  *(void *)(v4 + 688) = v515;
  int v516 = [a3 _BOOLValueForKey:@"WebKitMediaStreamTrackProcessingEnabled"];
  uint64_t v517 = 0x2000000000000;
  if (!v516) {
    uint64_t v517 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFDFFFFFFFFFFFFLL | v517;
  [a3 _BOOLValueForKey:@"WebKitShouldUseModernAVContentKeySession"];
  WebCore::Settings::setShouldUseModernAVContentKeySession((WebCore::Settings *)v4);
  int v518 = [a3 _BOOLValueForKey:@"WebKitMomentumScrollingAnimatorEnabled"];
  uint64_t v519 = 0x200000000;
  if (!v518) {
    uint64_t v519 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFDFFFFFFFFLL | v519;
  if ([a3 _BOOLValueForKey:@"WebKitInputTypeMonthEnabled"]) {
    uint64_t v520 = 0x20000000;
  }
  else {
    uint64_t v520 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFDFFFFFFFLL | v520;
  int v521 = [a3 _BOOLValueForKey:@"WebKitMouseEventsSimulationEnabled"];
  uint64_t v522 = 256;
  if (!v521) {
    uint64_t v522 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFFEFFLL | v522;
  int v523 = [a3 _BOOLValueForKey:@"WebKitMuteCameraOnMicrophoneInterruptionEnabled"];
  uint64_t v524 = 0x8000000000000;
  if (!v523) {
    uint64_t v524 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFF7FFFFFFFFFFFFLL | v524;
  int v525 = [a3 _BOOLValueForKey:@"WebKitNavigationAPIEnabled"];
  uint64_t v526 = 0x400000000;
  if (!v525) {
    uint64_t v526 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFBFFFFFFFFLL | v526;
  if ([a3 _BOOLValueForKey:@"WebKitUseSiteSpecificSpoofing"]) {
    uint64_t v527 = 0x8000000000;
  }
  else {
    uint64_t v527 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFF7FFFFFFFFFLL | v527;
  int v528 = [a3 _BOOLValueForKey:@"WebKitNeedsStorageAccessFromFileURLsQuirk"];
  uint64_t v529 = 0x10000000000;
  if (!v528) {
    uint64_t v529 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFEFFFFFFFFFFLL | v529;
  if ([a3 _BOOLValueForKey:@"WebKitFlexFormattingContextIntegrationEnabled"]) {
    uint64_t v530 = 0x80000;
  }
  else {
    uint64_t v530 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFF7FFFFLL | v530;
  if ([a3 _BOOLValueForKey:@"WebKitNotificationsEnabled"]) {
    uint64_t v531 = 0x200000000000000;
  }
  else {
    uint64_t v531 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFDFFFFFFFFFFFFFFLL | v531;
  int v532 = [a3 _BOOLValueForKey:@"WebKitObservableEnabled"];
  uint64_t v533 = 0x20000000000;
  if (!v532) {
    uint64_t v533 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFDFFFFFFFFFFLL | v533;
  int v534 = [a3 _BOOLValueForKey:@"WebKitAccessibilityThreadTextApisEnabled"];
  uint64_t v535 = 512;
  if (!v534) {
    uint64_t v535 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFFDFFLL | v535;
  int v536 = [a3 _BOOLValueForKey:@"WebKitOffscreenCanvasInWorkersEnabled"];
  uint64_t v537 = 0x2000000000000000;
  if (!v536) {
    uint64_t v537 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xDFFFFFFFFFFFFFFFLL | v537;
  if ([a3 _BOOLValueForKey:@"WebKitOffscreenCanvasEnabled"]) {
    uint64_t v538 = 0x1000000000000000;
  }
  else {
    uint64_t v538 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xEFFFFFFFFFFFFFFFLL | v538;
  if ([a3 _BOOLValueForKey:@"WebKitOffscreenCanvasDeprecatedCommitEnabled"]) {
    uint64_t v539 = 0x800000000000000;
  }
  else {
    uint64_t v539 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xF7FFFFFFFFFFFFFFLL | v539;
  if ([a3 _BOOLValueForKey:@"WebKitOpportunisticSweepingAndGarbageCollectionEnabled"])uint64_t v540 = 0x40000000000; {
  else
  }
    uint64_t v540 = 0;
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFBFFFFFFFFFFLL | v540;
  int v541 = [a3 _BOOLValueForKey:@"WebKitOverlappingBackingStoreProvidersEnabled"];
  uint64_t v542 = 0x80000000000;
  if (!v541) {
    uint64_t v542 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFF7FFFFFFFFFFLL | v542;
  int v543 = [a3 _BOOLValueForKey:@"WebKitBlobRegistryTopOriginPartitioningEnabled"];
  uint64_t v544 = 0x400000000000;
  if (!v543) {
    uint64_t v544 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFBFFFFFFFFFFFLL | v544;
  int v545 = [a3 _BOOLValueForKey:@"WebKitPermissionsAPIEnabled"];
  uint64_t v546 = 0x2000000000000;
  if (!v545) {
    uint64_t v546 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFDFFFFFFFFFFFFLL | v546;
  int v547 = [a3 _BOOLValueForKey:@"WebKitGetCoalescedEventsEnabled"];
  uint64_t v548 = 0x8000000;
  if (!v547) {
    uint64_t v548 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFF7FFFFFFLL | v548;
  int v549 = [a3 _BOOLValueForKey:@"WebKitGetPredictedEventsEnabled"];
  uint64_t v550 = 0x10000000;
  if (!v549) {
    uint64_t v550 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFEFFFFFFFLL | v550;
  int v551 = [a3 _BOOLValueForKey:@"WebKitPreferPageRenderingUpdatesNear60FPSEnabled"];
  uint64_t v552 = 0x10000000000000;
  if (!v551) {
    uint64_t v552 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFEFFFFFFFFFFFFFLL | v552;
  if ([a3 _BOOLValueForKey:@"WebKitPreferSandboxedMediaParsing"]) {
    uint64_t v553 = 0x10000;
  }
  else {
    uint64_t v553 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFEFFFFLL | v553;
  if ([a3 _BOOLValueForKey:@"WebKitPrivateClickMeasurementDebugModeEnabled"]) {
    uint64_t v554 = 0x40000000000000;
  }
  else {
    uint64_t v554 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFBFFFFFFFFFFFFFLL | v554;
  int v555 = [a3 _BOOLValueForKey:@"WebKitPrivateClickMeasurementEnabled"];
  uint64_t v556 = 0x80000000000000;
  if (!v555) {
    uint64_t v556 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFF7FFFFFFFFFFFFFLL | v556;
  if ([a3 _BOOLValueForKey:@"WebKitPrivateTokenUsageByThirdPartyEnabled"]) {
    uint64_t v557 = 0x200000000000000;
  }
  else {
    uint64_t v557 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFDFFFFFFFFFFFFFFLL | v557;
  if ([a3 _BOOLValueForKey:@"WebKitPushAPIEnabled"]) {
    uint64_t v558 = 0x800000000000000;
  }
  else {
    uint64_t v558 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xF7FFFFFFFFFFFFFFLL | v558;
  if ([a3 _BOOLValueForKey:@"WebKitLegacyPluginQuirkForMailSignaturesEnabled"]) {
    uint64_t v559 = 32;
  }
  else {
    uint64_t v559 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFFFFFDFLL | v559;
  if ([a3 _BOOLValueForKey:@"WebKitGoogleAntiFlickerOptimizationQuirkEnabled"]) {
    uint64_t v560 = 0x20000000;
  }
  else {
    uint64_t v560 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFDFFFFFFFLL | v560;
  int v561 = [a3 _BOOLValueForKey:@"WebKitRemotePlaybackEnabled"];
  uint64_t v562 = 0x1000000000000;
  if (!v561) {
    uint64_t v562 = 0;
  }
  unint64_t v563 = *(void *)(v4 + 720) & 0xFFFEFFFFFFFFFFFFLL | v562;
  *(void *)(v4 + 712) &= ~0x2000000uLL;
  *(void *)(v4 + 720) = v563;
  if ([a3 _BOOLValueForKey:@"WebKitReportingEnabled"]) {
    uint64_t v564 = 0x1000000000000000;
  }
  else {
    uint64_t v564 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xEFFFFFFFFFFFFFFFLL | v564;
  int v565 = [a3 _BOOLValueForKey:@"WebKitRequestVideoFrameCallbackEnabled"];
  unint64_t v566 = 0x8000000000000000;
  if (!v565) {
    unint64_t v566 = 0;
  }
  *(void *)(v4 + 688) = v566 & 0x8000000000000000 | *(void *)(v4 + 688) & 0x7FFFFFFFFFFFFFFFLL;
  int v567 = [a3 _BOOLValueForKey:@"WebKitLoginStatusAPIRequiresWebAuthnEnabled"];
  uint64_t v568 = 0x100000;
  if (!v567) {
    uint64_t v568 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFFFFFFFFEFFFFFLL | v568;
  if ([a3 _BOOLValueForKey:@"WebKitSpeakerSelectionRequiresUserGesture"]) {
    uint64_t v569 = 0x40000000000000;
  }
  else {
    uint64_t v569 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFBFFFFFFFFFFFFFLL | v569;
  if ([a3 _BOOLValueForKey:@"WebKitFullscreenRequirementForScreenOrientationLockingEnabled"])uint64_t v570 = 0x2000000; {
  else
  }
    uint64_t v570 = 0;
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFDFFFFFFLL | v570;
  if ([a3 _BOOLValueForKey:@"WebKitGetUserMediaRequiresFocus"]) {
    uint64_t v571 = 0x40000000000;
  }
  else {
    uint64_t v571 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFBFFFFFFFFFFLL | v571;
  int v572 = [a3 _BOOLValueForKey:@"WebKitResourceLoadSchedulingEnabled"];
  uint64_t v573 = 16;
  if (!v572) {
    uint64_t v573 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFEFLL | v573;
  [a3 _BOOLValueForKey:@"WebKitResourceUsageOverlayVisible"];
  WebCore::Settings::setResourceUsageOverlayVisible((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitSKAttributionEnabled"]) {
    uint64_t v574 = 32;
  }
  else {
    uint64_t v574 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFDFLL | v574;
  int v575 = [a3 _BOOLValueForKey:@"WebKitIsSameSiteStrictEnforcementEnabled"];
  uint64_t v576 = 0x400000000000000;
  if (!v575) {
    uint64_t v576 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFBFFFFFFFFFFFFFFLL | v576;
  if ([a3 _BOOLValueForKey:@"WebKitScreenOrientationLockingAPIEnabled"]) {
    uint64_t v577 = 128;
  }
  else {
    uint64_t v577 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFF7FLL | v577;
  int v578 = [a3 _BOOLValueForKey:@"WebKitScreenOrientationAPIEnabled"];
  uint64_t v579 = 64;
  if (!v578) {
    uint64_t v579 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFFBFLL | v579;
  int v580 = [a3 _BOOLValueForKey:@"WebKitScreenWakeLockAPIEnabled"];
  uint64_t v581 = 256;
  if (!v580) {
    uint64_t v581 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFFEFFLL | v581;
  int v582 = [a3 _BOOLValueForKey:@"WebKitScreenCaptureEnabled"];
  uint64_t v583 = 0x20000000000000;
  if (!v582) {
    uint64_t v583 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFDFFFFFFFFFFFFFLL | v583;
  WebCore::Settings::setScrollingPerformanceTestingEnabled((WebCore::Settings *)v4);
  if ([a3 _BOOLValueForKey:@"WebKitScrollToTextFragmentFeatureDetectionEnabled"]) {
    uint64_t v584 = 0x4000;
  }
  else {
    uint64_t v584 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFBFFFLL | v584;
  int v585 = [a3 _BOOLValueForKey:@"WebKitScrollToTextFragmentGenerationEnabled"];
  uint64_t v586 = 0x8000;
  if (!v585) {
    uint64_t v586 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFF7FFFLL | v586;
  if ([a3 _BOOLValueForKey:@"WebKitScrollToTextFragmentIndicatorEnabled"]) {
    uint64_t v587 = 0x10000;
  }
  else {
    uint64_t v587 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFEFFFFLL | v587;
  int v588 = [a3 _BOOLValueForKey:@"WebKitScrollToTextFragmentMarkingEnabled"];
  uint64_t v589 = 0x20000;
  if (!v588) {
    uint64_t v589 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFDFFFFLL | v589;
  int v590 = [a3 _BOOLValueForKey:@"WebKitScrollToTextFragmentEnabled"];
  uint64_t v591 = 0x2000;
  if (!v590) {
    uint64_t v591 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFDFFFLL | v591;
  if ([a3 _BOOLValueForKey:@"WebKitScrollAnimatorEnabled"]) {
    uint64_t v592 = 2048;
  }
  else {
    uint64_t v592 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFF7FFLL | v592;
  int v593 = [a3 _BOOLValueForKey:@"WebKitScrollDrivenAnimationsEnabled"];
  uint64_t v594 = 4096;
  if (!v593) {
    uint64_t v594 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFFFEFFFLL | v594;
  if ([a3 _BOOLValueForKey:@"WebKitSecureContextChecksEnabled"]) {
    uint64_t v595 = 0x200000;
  }
  else {
    uint64_t v595 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFFDFFFFFLL | v595;
  if ([a3 _BOOLValueForKey:@"WebKitSelectionAPIForShadowDOMEnabled"]) {
    uint64_t v596 = 0x1000000;
  }
  else {
    uint64_t v596 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFEFFFFFFLL | v596;
  if ([a3 _BOOLValueForKey:@"WebKitSendMouseEventsToDisabledFormControlsEnabled"]) {
    uint64_t v597 = 0x2000000;
  }
  else {
    uint64_t v597 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFFDFFFFFFLL | v597;
  int v598 = [a3 _BOOLValueForKey:@"WebKitServiceWorkerNavigationPreloadEnabled"];
  uint64_t v599 = 0x4000000;
  if (!v598) {
    uint64_t v599 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFF3FFFFFFLL | v599;
  int v600 = [a3 _BOOLValueForKey:@"WebKitShapeDetection"];
  uint64_t v601 = 0x20000000;
  if (!v600) {
    uint64_t v601 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFDFFFFFFFLL | v601;
  if ([a3 _BOOLValueForKey:@"WebKitSharedWorkerEnabled"]) {
    uint64_t v602 = 0x40000000;
  }
  else {
    uint64_t v602 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFBFFFFFFFLL | v602;
  int v603 = [a3 _BOOLValueForKey:@"WebKitShowMediaStatsContextMenuItemEnabled"];
  uint64_t v604 = 0x2000000000000;
  if (!v603) {
    uint64_t v604 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFDFFFFFFFFFFFFLL | v604;
  int v605 = [a3 _BOOLValueForKey:@"WebKitSidewaysWritingModesEnabled"];
  uint64_t v606 = 0x100000000000000;
  if (!v605) {
    uint64_t v606 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFEFFFFFFFFFFFFFFLL | v606;
  int v607 = [a3 _BOOLValueForKey:@"WebKitSiteIsolationEnabled"];
  uint64_t v608 = 0x200000000000000;
  if (!v607) {
    uint64_t v608 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFDFFFFFFFFFFFFFFLL | v608;
  int v609 = [a3 _BOOLValueForKey:@"WebKitSpeechRecognitionEnabled"];
  uint64_t v610 = 0x1000000000000000;
  if (!v609) {
    uint64_t v610 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xEFFFFFFFFFFFFFFFLL | v610;
  int v611 = [a3 _BOOLValueForKey:@"WebKitSpeechSynthesisAPIEnabled"];
  uint64_t v612 = 0x2000000000000000;
  if (!v611) {
    uint64_t v612 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xDFFFFFFFFFFFFFFFLL | v612;
  int v613 = [a3 _BOOLValueForKey:@"WebKitStorageAPIEstimateEnabled"];
  uint64_t v614 = 2;
  if (!v613) {
    uint64_t v614 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFFDLL | v614;
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFFFFELL | ([a3 _BOOLValueForKey:@"WebKitStorageAPIEnabled"] != 0);
  [a3 _integerValueForKey:@"WebKitStorageBlockingPolicy"];
  WebCore::Settings::setStorageBlockingPolicy();
  *(void *)(v4 + 696) |= 0x400000000000uLL;
  int v615 = [a3 _BOOLValueForKey:@"WebKitTextAnimationsEnabled"];
  uint64_t v616 = 0x4000000000000;
  if (!v615) {
    uint64_t v616 = 0;
  }
  unint64_t v617 = *(void *)(v4 + 720) & 0xFFFBFFFFFFFFFFFFLL | v616;
  *(void *)(v4 + 712) &= ~0x1000000uLL;
  *(void *)(v4 + 720) = v617;
  if ([a3 _BOOLValueForKey:@"WebKitThreadedAnimationResolutionEnabled"]) {
    uint64_t v618 = 128;
  }
  else {
    uint64_t v618 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFFF7FLL | v618;
  int v619 = [a3 _BOOLValueForKey:@"WebKitTiledScrollingIndicatorVisible"];
  uint64_t v620 = 0x10000000000000;
  if (!v619) {
    uint64_t v620 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFEFFFFFFFFFFFFFLL | v620;
  if ([a3 _BOOLValueForKey:@"WebKitInputTypeTimeEnabled"]) {
    uint64_t v621 = 0x40000000;
  }
  else {
    uint64_t v621 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFBFFFFFFFLL | v621;
  if ([a3 _BOOLValueForKey:@"WebKitTrackConfigurationEnabled"]) {
    uint64_t v622 = 2048;
  }
  else {
    uint64_t v622 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFF7FFLL | v622;
  if ([a3 _BOOLValueForKey:@"WebKitTrustedTypesEnabled"]) {
    uint64_t v623 = 0x4000;
  }
  else {
    uint64_t v623 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFFBFFFLL | v623;
  int v624 = [a3 _BOOLValueForKey:@"WebKitUndoManagerAPIEnabled"];
  uint64_t v625 = 0x10000;
  if (!v624) {
    uint64_t v625 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFFEFFFFLL | v625;
  if ([a3 _BOOLValueForKey:@"WebKitUnifiedPDFEnabled"]) {
    uint64_t v626 = 2048;
  }
  else {
    uint64_t v626 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFFFF7FFLL | v626;
  if ([a3 _BOOLValueForKey:@"WebKitIPAddressAndLocalhostMixedContentUpgradeTestingEnabled"])uint64_t v627 = 0x4000000000; {
  else
  }
    uint64_t v627 = 0;
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFBFFFFFFFFFLL | v627;
  int v628 = [a3 _BOOLValueForKey:@"WebKitUpgradeMixedContentEnabled"];
  uint64_t v629 = 0x80000;
  if (!v628) {
    uint64_t v629 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFF7FFFFLL | v629;
  if ([a3 _BOOLValueForKey:@"WebKitUseGiantTiles"]) {
    uint64_t v630 = 0x200000;
  }
  else {
    uint64_t v630 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFFDFFFFFLL | v630;
  if ([a3 _BOOLValueForKey:@"WebKitUserActivationAPIEnabled"]) {
    uint64_t v631 = 0x1000000;
  }
  else {
    uint64_t v631 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFEFFFFFFLL | v631;
  if ([a3 _BOOLValueForKey:@"WebKitUserGesturePromisePropagationEnabled"]) {
    uint64_t v632 = 0x2000000;
  }
  else {
    uint64_t v632 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFFDFFFFFFLL | v632;
  if ([a3 _BOOLValueForKey:@"WebKitServiceWorkersUserGestureEnabled"]) {
    uint64_t v633 = 0x10000000;
  }
  else {
    uint64_t v633 = 0;
  }
  *(void *)(v4 + 696) = *(void *)(v4 + 696) & 0xFFFFFFFFEFFFFFFFLL | v633;
  if ([a3 _BOOLValueForKey:@"WebKitVerifyWindowOpenUserGestureFromUIProcess"]) {
    uint64_t v634 = 0x10000000;
  }
  else {
    uint64_t v634 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFEFFFFFFFLL | v634;
  if ([a3 _BOOLValueForKey:@"WebKitVerticalFormControlsEnabled"]) {
    uint64_t v635 = 0x20000000;
  }
  else {
    uint64_t v635 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFFDFFFFFFFLL | v635;
  if ([a3 _BOOLValueForKey:@"WebKitViewTransitionClassesEnabled"]) {
    uint64_t v636 = 0x80000000;
  }
  else {
    uint64_t v636 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFF7FFFFFFFLL | v636;
  if ([a3 _BOOLValueForKey:@"WebKitViewTransitionTypesEnabled"]) {
    uint64_t v637 = 0x100000000;
  }
  else {
    uint64_t v637 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFEFFFFFFFFLL | v637;
  if ([a3 _BOOLValueForKey:@"WebKitViewTransitionsEnabled"]) {
    uint64_t v638 = 0x200000000;
  }
  else {
    uint64_t v638 = 0;
  }
  unint64_t v639 = *(void *)(v4 + 712) & 0xFFFFFFFFFF7FFFFFLL;
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFDFFFFFFFFLL | v638;
  *(void *)(v4 + 712) = v639;
  int v640 = [a3 _BOOLValueForKey:@"WebKitVisualViewportAPIEnabled"];
  uint64_t v641 = 0x400000000;
  if (!v640) {
    uint64_t v641 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFFBFFFFFFFFLL | v641;
  int v642 = [a3 _BOOLValueForKey:@"WebKitWebAPIStatisticsEnabled"];
  uint64_t v643 = 0x2000000000;
  if (!v642) {
    uint64_t v643 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFDFFFFFFFFFLL | v643;
  if ([a3 _BOOLValueForKey:@"WebKitWebAPIsInShadowRealmEnabled"]) {
    uint64_t v644 = 0x4000000000;
  }
  else {
    uint64_t v644 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFFBFFFFFFFFFLL | v644;
  if ([a3 _BOOLValueForKey:@"WebKitWebAnimationsCustomEffectsEnabled"]) {
    uint64_t v645 = 0x8000000000;
  }
  else {
    uint64_t v645 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFF7FFFFFFFFFLL | v645;
  int v646 = [a3 _BOOLValueForKey:@"WebKitWebAnimationsCustomFrameRateEnabled"];
  uint64_t v647 = 0x10000000000;
  if (!v646) {
    uint64_t v647 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFEFFFFFFFFFFLL | v647;
  int v648 = [a3 _BOOLValueForKey:@"WebKitWebArchiveDebugModeEnabledPreferenceKey"];
  uint64_t v649 = 0x4000000;
  if (!v648) {
    uint64_t v649 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFBFFFFFFLL | v649;
  int v650 = [a3 _BOOLValueForKey:@"WebKitWebArchiveTestingModeEnabled"];
  uint64_t v651 = 0x8000000;
  if (!v650) {
    uint64_t v651 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFF7FFFFFFLL | v651;
  if ([a3 _BOOLValueForKey:@"WebKitWebAuthenticationASEnabled"]) {
    uint64_t v652 = 0x8000000000000;
  }
  else {
    uint64_t v652 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFF7FFFFFFFFFFFFLL | v652;
  if ([a3 _BOOLValueForKey:@"WebKitWebAuthenticationEnabled"]) {
    uint64_t v653 = 0x20000000;
  }
  else {
    uint64_t v653 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFDFFFFFFFLL | v653;
  int v654 = [a3 _BOOLValueForKey:@"WebKitWebCryptoSafeCurvesEnabled"];
  uint64_t v655 = 0x20000000000;
  if (!v654) {
    uint64_t v655 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFDFFFFFFFFFFLL | v655;
  if ([a3 _BOOLValueForKey:@"WebKitWebCryptoX25519Enabled"]) {
    uint64_t v656 = 0x40000000000;
  }
  else {
    uint64_t v656 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFFBFFFFFFFFFFLL | v656;
  int v657 = [a3 _BOOLValueForKey:@"WebKitWebLocksAPIEnabled"];
  uint64_t v658 = 0x2000000000000;
  if (!v657) {
    uint64_t v658 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFDFFFFFFFFFFFFLL | v658;
  int v659 = [a3 _BOOLValueForKey:@"WebKitWebShareFileAPIEnabled"];
  uint64_t v660 = 0x40000000000000;
  if (!v659) {
    uint64_t v660 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFBFFFFFFFFFFFFFLL | v660;
  int v661 = [a3 _BOOLValueForKey:@"WebKitWebShareEnabled"];
  uint64_t v662 = 0x20000000000000;
  if (!v661) {
    uint64_t v662 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFDFFFFFFFFFFFFFLL | v662;
  int v663 = [a3 _BOOLValueForKey:@"WebKitWebAssemblyESMIntegrationEnabled"];
  uint64_t v664 = 0x400000;
  if (!v663) {
    uint64_t v664 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFFFBFFFFFLL | v664;
  int v665 = [a3 _BOOLValueForKey:@"WebKitWebCodecsAV1Enabled"];
  uint64_t v666 = 0x40000000;
  if (!v665) {
    uint64_t v666 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFFBFFFFFFFLL | v666;
  if ([a3 _BOOLValueForKey:@"WebKitWebCodecsAudioEnabled"]) {
    uint64_t v667 = 0x80000000;
  }
  else {
    uint64_t v667 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFF7FFFFFFFLL | v667;
  if ([a3 _BOOLValueForKey:@"WebKitWebCodecsHEVCEnabled"]) {
    uint64_t v668 = 0x100000000;
  }
  else {
    uint64_t v668 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFEFFFFFFFFLL | v668;
  if ([a3 _BOOLValueForKey:@"WebKitWebCodecsVideoEnabled"]) {
    uint64_t v669 = 0x200000000;
  }
  else {
    uint64_t v669 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFDFFFFFFFFLL | v669;
  if ([a3 _BOOLValueForKey:@"WebKitWebGLDraftExtensionsEnabled"]) {
    uint64_t v670 = 0x80000000000;
  }
  else {
    uint64_t v670 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFF7FFFFFFFFFFLL | v670;
  if ([a3 _BOOLValueForKey:@"WebKitWebGLTimerQueriesEnabled"]) {
    uint64_t v671 = 0x400000000000;
  }
  else {
    uint64_t v671 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFBFFFFFFFFFFFLL | v671;
  if ([a3 _BOOLValueForKey:@"WebKitWebGLEnabled"]) {
    uint64_t v672 = 0x100000000000;
  }
  else {
    uint64_t v672 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFFEFFFFFFFFFFFLL | v672;
  int v673 = [a3 _BOOLValueForKey:@"WebKitWebXRWebGPUBindingsEnabled"];
  uint64_t v674 = 0x200000000000000;
  if (!v673) {
    uint64_t v674 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFDFFFFFFFFFFFFFFLL | v674;
  if ([a3 _BOOLValueForKey:@"WebKitWebGPUEnabled"]) {
    uint64_t v675 = 0x800000000000;
  }
  else {
    uint64_t v675 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFF7FFFFFFFFFFFLL | v675;
  int v676 = [a3 _BOOLValueForKey:@"WebKitWebInspectorEngineeringSettingsAllowed"];
  uint64_t v677 = 0x1000000000000;
  if (!v676) {
    uint64_t v677 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFFEFFFFFFFFFFFFLL | v677;
  int v678 = [a3 _BOOLValueForKey:@"WebKitWebRTCAV1CodecEnabled"];
  uint64_t v679 = 0x2000000000;
  if (!v678) {
    uint64_t v679 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFDFFFFFFFFFLL | v679;
  int v680 = [a3 _BOOLValueForKey:@"WebKitWebRTCDTMFEnabled"];
  uint64_t v681 = 0x4000000000;
  if (!v680) {
    uint64_t v681 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFBFFFFFFFFFLL | v681;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCEncodedTransformEnabled"]) {
    uint64_t v682 = 0x8000000000;
  }
  else {
    uint64_t v682 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFF7FFFFFFFFFLL | v682;
  int v683 = [a3 _BOOLValueForKey:@"WebKitWebRTCH265CodecEnabled"];
  uint64_t v684 = 0x10000000000;
  if (!v683) {
    uint64_t v684 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFEFFFFFFFFFFLL | v684;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCMediaPipelineAdditionalLoggingEnabled"]) {
    uint64_t v685 = 0x8000000000000;
  }
  else {
    uint64_t v685 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFFF7FFFFFFFFFFFFLL | v685;
  int v686 = [a3 _BOOLValueForKey:@"WebKitLegacyWebRTCOfferOptionsEnabled"];
  uint64_t v687 = 0x400000000;
  if (!v686) {
    uint64_t v687 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFFBFFFFFFFFLL | v687;
  int v688 = [a3 _BOOLValueForKey:@"WebKitPeerConnectionVideoScalingAdaptationDisabled"];
  uint64_t v689 = 0x1000000000;
  if (!v688) {
    uint64_t v689 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFEFFFFFFFFFLL | v689;
  if ([a3 _BOOLValueForKey:@"WebKitPeerConnectionEnabled"]) {
    uint64_t v690 = 0x800000000;
  }
  else {
    uint64_t v690 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFFF7FFFFFFFFLL | v690;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCRemoteVideoFrameEnabled"]) {
    uint64_t v691 = 0x40000000000;
  }
  else {
    uint64_t v691 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFFBFFFFFFFFFFLL | v691;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCSFrameTransformEnabled"]) {
    uint64_t v692 = 0x80000000000;
  }
  else {
    uint64_t v692 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFF7FFFFFFFFFFLL | v692;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCSocketsProxyingEnabled"]) {
    uint64_t v693 = 0x100000000000;
  }
  else {
    uint64_t v693 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFEFFFFFFFFFFFLL | v693;
  int v694 = [a3 _BOOLValueForKey:@"WebKitWebRTCVP9Profile0CodecEnabled"];
  uint64_t v695 = 0x200000000000;
  if (!v694) {
    uint64_t v695 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFDFFFFFFFFFFFLL | v695;
  if ([a3 _BOOLValueForKey:@"WebKitWebRTCVP9Profile2CodecEnabled"]) {
    uint64_t v696 = 0x400000000000;
  }
  else {
    uint64_t v696 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFFBFFFFFFFFFFFLL | v696;
  int v697 = [a3 _BOOLValueForKey:@"WebKitWebTransportEnabled"];
  uint64_t v698 = 0x100000000000000;
  if (!v697) {
    uint64_t v698 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xFEFFFFFFFFFFFFFFLL | v698;
  int v699 = [a3 _BOOLValueForKey:@"WebKitInputTypeWeekEnabled"];
  uint64_t v700 = 0x80000000;
  if (!v699) {
    uint64_t v700 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFF7FFFFFFFLL | v700;
  int v701 = [a3 _BOOLValueForKey:@"WebKitWheelEventGesturesBecomeNonBlocking"];
  uint64_t v702 = 0x800000000000000;
  if (!v701) {
    uint64_t v702 = 0;
  }
  *(void *)(v4 + 704) = *(void *)(v4 + 704) & 0xF7FFFFFFFFFFFFFFLL | v702;
  if ([a3 _BOOLValueForKey:@"WebKitPassiveWheelListenersAsDefaultOnDocument"]) {
    uint64_t v703 = 0x800000000000;
  }
  else {
    uint64_t v703 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xFFFF7FFFFFFFFFFFLL | v703;
  int v704 = [a3 _BOOLValueForKey:@"WebKitWriteRichTextDataWhenCopyingOrDragging"];
  uint64_t v705 = 0x40000000000000;
  if (!v704) {
    uint64_t v705 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFBFFFFFFFFFFFFFLL | v705;
  int v706 = [a3 _BOOLValueForKey:@"WebKitWritingSuggestionsAttributeEnabled"];
  uint64_t v707 = 0x2000000000000;
  if (!v706) {
    uint64_t v707 = 0;
  }
  *(void *)(v4 + 720) = *(void *)(v4 + 720) & 0xFFFDFFFFFFFFFFFFLL | v707;
  if ([a3 _BOOLValueForKey:@"WebKitIsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled"])uint64_t v708 = 0x8000000000000; {
  else
  }
    uint64_t v708 = 0;
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFF7FFFFFFFFFFFFLL | v708;
  int v709 = [a3 _BOOLValueForKey:@"WebKitIsFirstPartyWebsiteDataRemovalReproTestingEnabled"];
  uint64_t v710 = 0x10000000000000;
  if (!v709) {
    uint64_t v710 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFEFFFFFFFFFFFFFLL | v710;
  int v711 = [a3 _BOOLValueForKey:@"WebKitAlignContentOnBlocksEnabled"];
  uint64_t v712 = 2048;
  if (!v711) {
    uint64_t v712 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFFFFF7FFLL | v712;
  int v713 = [a3 _BOOLValueForKey:@"WebKitAltitudeAngleEnabled"];
  uint64_t v714 = 0x4000000;
  if (!v713) {
    uint64_t v714 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFFFFFBFFFFFFLL | v714;
  int v715 = [a3 _BOOLValueForKey:@"WebKitAzimuthAngleEnabled"];
  uint64_t v716 = 0x10000000000;
  if (!v715) {
    uint64_t v716 = 0;
  }
  unint64_t *v18 = *v18 & 0xFFFFFEFFFFFFFFFFLL | v716;
  int v717 = [a3 _BOOLValueForKey:@"WebKitInputTypeDateTimeLocalEnabled"];
  uint64_t v718 = 0x10000000;
  if (!v717) {
    uint64_t v718 = 0;
  }
  *(void *)(v4 + 712) = *(void *)(v4 + 712) & 0xFFFFFFFFEFFFFFFFLL | v718;
  int v719 = [a3 _BOOLValueForKey:@"WebKitElementCheckVisibilityEnabled"];
  uint64_t v720 = 256;
  if (!v719) {
    uint64_t v720 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFFFFFFFFEFFLL | v720;
  if ([a3 _BOOLValueForKey:@"WebKitHTTPEquivEnabled"]) {
    uint64_t v721 = 0x800000000;
  }
  else {
    uint64_t v721 = 0;
  }
  *(void *)(v4 + 680) = *(void *)(v4 + 680) & 0xFFFFFFF7FFFFFFFFLL | v721;
  int v722 = [a3 _BOOLValueForKey:@"WebKitRequestIdleCallbackEnabled"];
  uint64_t v723 = 0x2000000000000000;
  if (!v722) {
    uint64_t v723 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xDFFFFFFFFFFFFFFFLL | v723;
  int v724 = [a3 _BOOLValueForKey:@"WebKitRequestStorageAccessThrowsExceptionUntilReload"];
  uint64_t v725 = 0x4000000000000000;
  if (!v724) {
    uint64_t v725 = 0;
  }
  *(void *)(v4 + 688) = *(void *)(v4 + 688) & 0xBFFFFFFFFFFFFFFFLL | v725;
  [a3 _BOOLValueForKey:@"WebKitCSSWordBreakAutoPhraseEnabled"];
  WebCore::Settings::setCSSWordBreakAutoPhraseEnabled((WebCore::Settings *)v4);
  v726 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitLowPowerVideoAudioBufferSizeEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v726) + 18) = (_BYTE)v726;
  v727 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitWebMParserEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v727) + 29) = (_BYTE)v727;
  WebCore::DeprecatedGlobalSettings::setMockScrollbarsEnabled((WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitMockScrollbarsEnabled"]);
  WebCore::DeprecatedGlobalSettings::setAVFoundationEnabled((WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitAVFoundationEnabled"]);
  v728 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitAttachmentElementEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v728) + 25) = (_BYTE)v728;
  v729 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitCustomPasteboardDataEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v729) + 21) = (_BYTE)v729;
  v730 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitDisableScreenSizeOverride"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v730) + 17) = (_BYTE)v730;
  WebCore::DeprecatedGlobalSettings::setMediaSourceInlinePaintingEnabled((WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitMediaSourceInlinePaintingEnabled"]);
  v731 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitRestrictedHTTPResponseAccess"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v731) + 22) = (_BYTE)v731;
  v732 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitModelDocumentEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v732) + 34) = (_BYTE)v732;
  WebCore::DeprecatedGlobalSettings::setOpusDecoderEnabled((WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitOpusDecoderEnabled"]);
  v733 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitReadableByteStreamAPIEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v733) + 27) = (_BYTE)v733;
  WebCore::DeprecatedGlobalSettings::setVorbisDecoderEnabled((WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitVorbisDecoderEnabled"]);
  v734 = (WebCore::DeprecatedGlobalSettings *)[a3 _BOOLValueForKey:@"WebKitWebRTCAudioLatencyAdaptationEnabled"];
  *(unsigned char *)(WebCore::DeprecatedGlobalSettings::shared(v734) + 26) = (_BYTE)v734;
}

@end