@interface MFMessageContentView
+ (OS_os_log)signpostLog;
+ (id)log;
- (BOOL)_allAttachmentsArePhotosOrVideos;
- (BOOL)_firstResponderIsInWebView;
- (BOOL)_lastCrashDateExceedsThreshhold;
- (BOOL)_objectContainsNonEmptyString:(id)a3;
- (BOOL)allowLoadOfBlockedMessageContent;
- (BOOL)allowNotAuthenticatedBanner;
- (BOOL)automaticallyCollapseQuotedContent;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)contentPaddingFollowsLayoutMargins;
- (BOOL)hasCompletedMoveMessageBodyAnimation;
- (BOOL)hasVisibleContent;
- (BOOL)hideSenderSpecificBanners;
- (BOOL)initiallyZoomsToShowAllContent;
- (BOOL)isLoadingIndicatorVisible;
- (BOOL)isZoomEnabled;
- (BOOL)mayShareToUnmanaged;
- (BOOL)shouldArchiveByDefault;
- (BOOL)shouldHideStickyFooterView;
- (BOOL)showMessageFooter;
- (BOOL)showingError;
- (BOOL)showsBanners;
- (BOOL)sourceIsManaged;
- (BOOL)suppressScrolling;
- (CGPoint)initialContentOffset;
- (CGRect)_adjustedRectForWebRect:(CGRect)a3;
- (CGRect)contentItemRectForSaveMenu;
- (EFCancelable)loadingIndicatorCancelable;
- (EFCancelable)loadingSpinnerTailspinToken;
- (EFScheduler)trustConfigurationScheduler;
- (EMCachingContactStore)contactStore;
- (EMContentItem)contentItemForSaveMenu;
- (EMContentRepresentation)contentRepresentation;
- (EMContentRepresentation)contentRepresentationIfAvailable;
- (EMDaemonInterface)daemonInterface;
- (MFAddressAtomStatusManager)atomManager;
- (MFConversationItemFooterView)footerView;
- (MFMailboxProvider)mailboxProvider;
- (MFMessageContentLoadingView)loadingView;
- (MFMessageContentView)initWithFrame:(CGRect)a3;
- (MFMessageContentViewDataSource)dataSource;
- (MFMessageContentViewDelegate)delegate;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFMessageHeaderView)headerView;
- (MFQuickReplyAnimationContext)quickReplyAnimationContext;
- (MFWebViewDictionary)webViewConstants;
- (MFWebViewLoadingController)webViewLoadingController;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MessageContentRepresentationRequest)contentRequest;
- (NSArray)attachments;
- (NSArray)contentItems;
- (NSDictionary)attachmentDragPreviews;
- (NSError)contentRepresentationError;
- (NSString)selectedHTML;
- (UIScrollView)scrollView;
- (UIView)headerViewSubjectBlock;
- (UIView)previousContentSnapshot;
- (UIViewPropertyAnimator)moveMessageBodyPropertyAnimator;
- (WKWebView)webView;
- (double)_adjustWebViewInsetsToAccomodateHeaderAndFooter;
- (double)_viewportWidth;
- (double)initialScale;
- (id)_attachmentPreviewsFromData:(id)a3;
- (id)_bodyFont;
- (id)_contentItemForElement:(id)a3;
- (id)_contextMenuConfigurationForAttachment:(id)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_dataDetectionContextForWebView:(id)a3;
- (id)_mailboxForBanner:(id)a3;
- (id)_styleSheetWithPadding:(UIEdgeInsets)a3 useWideLayout:(BOOL)a4;
- (id)_updatedHeaderViewModelForMessage:(id)a3 replyToList:(id)a4;
- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6;
- (id)_webView:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)_webView:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)_webView:(id)a3 previewItem:(id)a4;
- (id)_webView:(id)a3 willUpdateDropProposalToProposal:(id)a4 forSession:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)downloadFutureForContentItem:(id)a3;
- (id)presentedControllerDoneButtonItem;
- (id)viewForZoomingInScrollView:(id)a3;
- (id)viewPrintFormatter;
- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4;
- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4;
- (int64_t)messageBlockingReason;
- (unint64_t)blockedContentTypes;
- (unint64_t)signpostID;
- (void)_addBlockedSenderBannerIfNeeded;
- (void)_addHasMoreContentBannerWithRemainingBytes:(unint64_t)a3;
- (void)_addHideMyEmailBannerIfNeeded;
- (void)_addLoadingSubview:(id)a3;
- (void)_addNotAuthenticatedBannerIfNeeded;
- (void)_adjustHeaderOffsetForZoom;
- (void)_alertMailDropDownloadIsTooLargeForCell:(BOOL)a3;
- (void)_beginObservingContentHeight;
- (void)_clearAllBannersAnimated:(BOOL)a3;
- (void)_clearBlockedSenderBannerAnimated:(BOOL)a3;
- (void)_clearHasMoreContentBannerAnimated:(BOOL)a3;
- (void)_clearLoadFailedProxyContentBannerAnimated:(BOOL)a3;
- (void)_clearLoadRemoteImagesBannerAnimated:(BOOL)a3;
- (void)_clearNotAuthenticatedBannerAnimated:(BOOL)a3;
- (void)_commonInit;
- (void)_configureTrustEvaluationsForSignersInSecurityInformation:(id)a3;
- (void)_displayDismissibleAttachmentErrorWithTitle:(id)a3 message:(id)a4;
- (void)_downloadAllMailDropAttachments;
- (void)_expandQuoteWithCollapsedBlockquoteOffset:(double)a3 expandedOffset:(double)a4;
- (void)_fontSizeDidChange:(id)a3;
- (void)_foundImageCIDAttachments:(id)a3;
- (void)_handleAttachmentSaveMessage:(id)a3;
- (void)_handleAttachmentTapMessage:(id)a3;
- (void)_handleBlockSenderListChanged:(id)a3;
- (void)_layoutFooterView;
- (void)_layoutLoadingView;
- (void)_loadBlockedMessageContactWarning;
- (void)_loadBlockedMessageContactWarningWithRepresentation:(id)a3;
- (void)_logRequestFinishWithSuccess:(BOOL)a3;
- (void)_notifyDelegateScrollViewSizeChanged:(CGSize)a3;
- (void)_observeBlockedSenderListChangedNotification;
- (void)_performQuickReplyMoveMessageBodyAnimationIfNeeded;
- (void)_performQuickReplySnapshotFadeOutAnimationIfNecessary;
- (void)_processDataDetectionMetricsFromResults:(id)a3;
- (void)_reevaluateTrustWithNetworkAccessAllowed;
- (void)_reloadUserStyleSheets;
- (void)_reloadWithPartiallyEncryptedMessageAllowed;
- (void)_reloadWithRemoteContentAllowed;
- (void)_removeLoadingSubview:(id)a3;
- (void)_requestWebViewLoadWithRepresentation:(id)a3;
- (void)_resetHeaderOffsetForZoom;
- (void)_revealActionsButtonTapped;
- (void)_saveContentItemToPicker:(id)a3;
- (void)_seeMoreButtonTapped;
- (void)_setNeedsPaddingConstantsUpdate;
- (void)_setRemoteContentToLoadWithoutProxy;
- (void)_setupWebProcessLocalizedStrings;
- (void)_showDelayedProgressUIIfNeeded;
- (void)_showLoadFailedProxyContentBannerIfNeeded;
- (void)_showModalViewController:(id)a3 presentationSource:(id)a4;
- (void)_showModalViewController:(id)a3 presentationSource:(id)a4 forceNavigationController:(BOOL)a5;
- (void)_stopObservingContentHeight;
- (void)_triggerWebViewLoad;
- (void)_triggerWebViewLoadWithoutShowingContentRepresentation;
- (void)_undoSendButtonTapped;
- (void)_updateFileWrapperForAttachment:(id)a3 contentID:(id)a4;
- (void)_updateHasMoreContentBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4;
- (void)_updateMinimumFontSize;
- (void)_updateWebViewPaddingConstants;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6;
- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5;
- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4;
- (void)_webViewWebProcessDidBecomeUnresponsive:(id)a3;
- (void)clearAllDecoratedFoundText;
- (void)clearMessage;
- (void)clearSelectedHTML;
- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didBeginTextSearch;
- (void)didDismissBlockedSenderBannerView:(id)a3;
- (void)didDismissHideMyEmailBannerView:(id)a3;
- (void)didDismissNotAuthenticatedBannerView:(id)a3;
- (void)didEndTextSearch;
- (void)didTapBlockedSenderBannerView:(id)a3;
- (void)didTapHasMoreContentBannerView:(id)a3;
- (void)didTapHideMyEmailBannerView:(id)a3;
- (void)dismissPresentedViewController:(id)a3;
- (void)footerViewDidChangeHeight:(id)a3;
- (void)generateSnapshotImageWithCompletion:(id)a3;
- (void)headerViewDidChangeHeight:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)loadBlockedContent;
- (void)loadFailedProxyContentBannerDidTriggerLoad:(id)a3;
- (void)loadFailedProxyContentBannerWasDismissed:(id)a3;
- (void)loadHasMoreContentBannerIfNecessary;
- (void)mailDropBannerDidTriggerDownload:(id)a3;
- (void)mui_setAsSourceForPopoverPresentationController:(id)a3;
- (void)mui_setAsTargetedSourceOnSceneConfiguration:(id)a3;
- (void)prepareForQuickReplyAnimationWithContext:(id)a3;
- (void)prepareForReuse;
- (void)presentViewController:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)reload;
- (void)removeQuickReplyAnimationContextIfNecessary;
- (void)requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4;
- (void)sceneMovedToForeground;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)selectAll:(id)a3;
- (void)setAllowLoadOfBlockedMessageContent:(BOOL)a3;
- (void)setAllowNotAuthenticatedBanner:(BOOL)a3;
- (void)setAtomManager:(id)a3;
- (void)setAttachmentDragPreviews:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3;
- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4;
- (void)setAvatarGenerator:(id)a3;
- (void)setBlockedContentTypes:(unint64_t)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContentItemForSaveMenu:(id)a3;
- (void)setContentItemRectForSaveMenu:(CGRect)a3;
- (void)setContentPaddingFollowsLayoutMargins:(BOOL)a3;
- (void)setContentRepresentationError:(id)a3;
- (void)setContentRequest:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasCompletedMoveMessageBodyAnimation:(BOOL)a3;
- (void)setHasVisibleContent:(BOOL)a3;
- (void)setHeaderViewSubjectBlock:(id)a3;
- (void)setHideSenderSpecificBanners:(BOOL)a3;
- (void)setInitialContentOffset:(CGPoint)a3;
- (void)setInitialScale:(double)a3;
- (void)setInitiallyZoomsToShowAllContent:(BOOL)a3;
- (void)setLoadingIndicatorCancelable:(id)a3;
- (void)setLoadingIndicatorVisible:(BOOL)a3;
- (void)setLoadingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setLoadingSpinnerTailspinToken:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setMailboxProvider:(id)a3;
- (void)setMessageBlockingReason:(int64_t)a3;
- (void)setMoveMessageBodyPropertyAnimator:(id)a3;
- (void)setPreviousContentSnapshot:(id)a3;
- (void)setQuickReplyAnimationContext:(id)a3;
- (void)setSelectedHTML:(id)a3;
- (void)setShouldArchiveByDefault:(BOOL)a3;
- (void)setShowMessageFooter:(BOOL)a3;
- (void)setShowingError:(BOOL)a3;
- (void)setShowsBanners:(BOOL)a3;
- (void)setSuppressScrolling:(BOOL)a3;
- (void)setWebViewLoadingController:(id)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)showSearchResultsAtRange:(id)a3 usingStyle:(unint64_t)a4;
- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3;
- (void)webProcessDidCreateBrowserContextControllerLoadDelegate;
- (void)webProcessDidFailLoadingResourceWithURL:(id)a3;
- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4;
- (void)webProcessDidFinishLoadForURL:(id)a3;
- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4;
- (void)webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 showLockdownModeFirstUseMessage:(id)a4 completionHandler:(id)a5;
@end

@implementation MFMessageContentView

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MFMessageContentView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  v2 = (void *)log_log_5;
  return v2;
}

void __27__MFMessageContentView_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFMessageContentView_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;
  return (OS_os_log *)v2;
}

void __35__MFMessageContentView_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)dealloc
{
  [(MFMessageContentView *)self _stopObservingContentHeight];
  [(MFMessageHeaderView *)self->_headerView setDelegate:0];
  [(MFWebViewLoadingController *)self->_webViewLoadingController setWebProcessDelegate:0];
  [(EFCancelationToken *)self->_loadingCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentView;
  [(MFMessageContentView *)&v3 dealloc];
}

- (MFMessageContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFMessageContentView;
  objc_super v3 = -[MFMessageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  os_signpost_id_t v4 = v3;
  if (v3) {
    [(MFMessageContentView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(MFMessageContentView *)self setPreservesSuperviewLayoutMargins:1];
  [(MFMessageContentView *)self setContentPaddingFollowsLayoutMargins:1];
  [(MFMessageContentView *)self setInsetsLayoutMarginsFromSafeArea:0];
  [(MFMessageContentView *)self setAllowLoadOfBlockedMessageContent:0];
  objc_super v3 = [MEMORY[0x1E4FB1618] mailConversationViewExpandedCellBackgroundColor];
  [(MFMessageContentView *)self setBackgroundColor:v3];

  os_signpost_id_t v4 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.messageViewTrustConfiguration" qualityOfService:25];
  trustConfigurationScheduler = self->_trustConfigurationScheduler;
  self->_trustConfigurationScheduler = v4;

  objc_super v6 = objc_alloc_init(MFWebViewLoadingController);
  webViewLoadingController = self->_webViewLoadingController;
  self->_webViewLoadingController = v6;

  self->_suppressContentSizeNotificationsUntilFirstPaint = 1;
  id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v9 = (UIViewPropertyAnimator *)[v8 initWithDuration:0 curve:&__block_literal_global_6 animations:*MEMORY[0x1E4F35140]];
  moveMessageBodyPropertyAnimator = self->_moveMessageBodyPropertyAnimator;
  self->_moveMessageBodyPropertyAnimator = v9;

  v11 = [(MFWebViewLoadingController *)self->_webViewLoadingController webView];
  [v11 setNavigationDelegate:self];
  [v11 _setInputDelegate:self];
  [v11 setUIDelegate:self];
  v12 = [v11 scrollView];
  [v12 setDelegate:self];

  v13 = [v11 scrollView];
  [v13 setAlwaysBounceVertical:0];

  [(MFMessageContentView *)self addSubview:v11];
  [(MFMessageContentView *)self _reloadUserStyleSheets];
  [(MFMessageContentView *)self _updateMinimumFontSize];
  v14 = [v11 configuration];
  v15 = [v14 userContentController];
  [v15 removeAllScriptMessageHandlers];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v16 = (void *)MEMORY[0x1E4F60528];
  v17 = [(MFMessageContentView *)self webView];
  [v16 addScriptHandlerForWebView:v17 key:@"MCVLog" handler:&__block_literal_global_101];

  v18 = (void *)MEMORY[0x1E4F60528];
  v19 = [(MFMessageContentView *)self webView];
  [v18 addScriptHandlerForWebView:v19 key:@"MCVError" handler:&__block_literal_global_111];

  v20 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  v21 = [(MFMessageContentView *)self webViewConstants];
  [v21 setObject:v20 forKeyedSubscript:@"isInlineGenmojiEnabled"];

  v22 = (void *)MEMORY[0x1E4F60528];
  v23 = [(MFMessageContentView *)self webView];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __35__MFMessageContentView__commonInit__block_invoke_130;
  v73[3] = &unk_1E6D1B108;
  objc_copyWeak(&v74, location);
  [v22 addScriptHandlerForWebView:v23 key:@"AttachmentNodeWasTapped" handler:v73];

  v24 = (void *)MEMORY[0x1E4F60528];
  v25 = [(MFMessageContentView *)self webView];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __35__MFMessageContentView__commonInit__block_invoke_2_134;
  v71[3] = &unk_1E6D1B108;
  objc_copyWeak(&v72, location);
  [v24 addScriptHandlerForWebView:v25 key:@"AttachmentSaveWasTapped" handler:v71];

  v26 = (void *)MEMORY[0x1E4F60528];
  v27 = [(MFMessageContentView *)self webView];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __35__MFMessageContentView__commonInit__block_invoke_3;
  v69[3] = &unk_1E6D1B130;
  objc_copyWeak(&v70, location);
  [v26 addScriptHandlerForWebView:v27 key:@"ExpandQuoteButtonTappedWithYOffset" handler:v69];

  v28 = (void *)MEMORY[0x1E4F60528];
  v29 = [(MFMessageContentView *)self webView];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __35__MFMessageContentView__commonInit__block_invoke_148;
  v67[3] = &unk_1E6D1B158;
  objc_copyWeak(&v68, location);
  [v28 addScriptHandlerForWebView:v29 key:@"HasBlockquotesToExpand" handler:v67];

  v30 = (void *)MEMORY[0x1E4F60528];
  v31 = [(MFMessageContentView *)self webView];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __35__MFMessageContentView__commonInit__block_invoke_2_155;
  v65[3] = &unk_1E6D1B158;
  objc_copyWeak(&v66, location);
  [v30 addScriptHandlerForWebView:v31 key:@"FinishedReformattingMessage" handler:v65];

  v32 = (void *)MEMORY[0x1E4F60528];
  v33 = [(MFMessageContentView *)self webView];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __35__MFMessageContentView__commonInit__block_invoke_4;
  v63[3] = &unk_1E6D1B1A8;
  objc_copyWeak(&v64, location);
  [v32 addScriptHandlerForWebView:v33 key:@"FoundImageCIDAttachments" handler:v63];

  v34 = (void *)MEMORY[0x1E4F60528];
  v35 = [(MFMessageContentView *)self webView];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __35__MFMessageContentView__commonInit__block_invoke_5;
  v61[3] = &unk_1E6D1B1D0;
  objc_copyWeak(&v62, location);
  [v34 addScriptHandlerForWebView:v35 key:@"TextSelected" handler:v61];

  v36 = (void *)MEMORY[0x1E4F60528];
  v37 = [(MFMessageContentView *)self webView];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __35__MFMessageContentView__commonInit__block_invoke_6;
  v59[3] = &unk_1E6D1B1D0;
  objc_copyWeak(&v60, location);
  [v36 addScriptHandlerForWebView:v37 key:@"ImageError" handler:v59];

  [(MFMessageContentView *)self setMessageBlockingReason:0];
  [(MFMessageContentView *)self setInitialScale:-1.0];
  [(MFMessageContentView *)self setInitiallyZoomsToShowAllContent:1];
  [(MFMessageContentView *)self setShowsBanners:1];
  [(MFMessageContentView *)self setZoomEnabled:1];
  v38 = [MFMessageHeaderView alloc];
  [(MFMessageContentView *)self frame];
  v39 = -[MFMessageHeaderView initWithFrame:](v38, "initWithFrame:", 0.0, 0.0);
  headerView = self->_headerView;
  self->_headerView = v39;

  [(MFMessageHeaderView *)self->_headerView setDelegate:self];
  [(MFMessageContentView *)self addSubview:self->_headerView];
  v41 = [(MFMessageHeaderView *)self->_headerView topAnchor];
  v42 = [(MFMessageContentView *)self topAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [(MFMessageHeaderView *)self->_headerView leadingAnchor];
  v45 = [(MFMessageContentView *)self leadingAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(MFMessageHeaderView *)self->_headerView trailingAnchor];
  v48 = [(MFMessageContentView *)self trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v50 addObserver:self selector:sel__fontSizeDidChange_ name:*MEMORY[0x1E4F35020] object:0];
  [v50 addObserver:self selector:sel__darkerSystemColorsStatusDidChange_ name:*MEMORY[0x1E4FB2438] object:0];
  id v51 = objc_alloc(MEMORY[0x1E4F35100]);
  v52 = (MFMessageContentLoadingView *)objc_msgSend(v51, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v52;

  [(MFMessageContentLoadingView *)self->_loadingView setAlpha:0.0];
  [(MFMessageContentView *)self _addLoadingSubview:self->_loadingView];
  v54 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  inFlightURLs = self->_inFlightURLs;
  self->_inFlightURLs = v54;

  v56 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  failedProxyURLs = self->_failedProxyURLs;
  self->_failedProxyURLs = v56;

  [(MFWebViewLoadingController *)self->_webViewLoadingController setWebProcessDelegate:self];
  [(MFMessageContentView *)self _setupWebProcessLocalizedStrings];
  v58 = objc_alloc_init(_MFTapPreventingRecognizer);
  [(_MFTapPreventingRecognizer *)v58 setNumberOfTapsRequired:2];
  [(MFMessageContentView *)self addGestureRecognizer:v58];
  [(MFMessageContentView *)self _observeBlockedSenderListChangedNotification];

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
}

void __35__MFMessageContentView__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v4 = @"«empty»";
    if (v2) {
      os_signpost_id_t v4 = v2;
    }
    int v5 = 138543362;
    objc_super v6 = v4;
    _os_log_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEFAULT, "#Warning [MCVLog] %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void __35__MFMessageContentView__commonInit__block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    os_signpost_id_t v4 = [v2 objectForKeyedSubscript:@"name"];
    int v5 = [v2 objectForKeyedSubscript:@"message"];
    objc_super v6 = [v2 objectForKeyedSubscript:@"stack"];
    int v7 = 138543874;
    id v8 = v4;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_error_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_ERROR, "[MCVError] Unhandled JS Exception: %{public}@ \"%@\" - callstack: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __35__MFMessageContentView__commonInit__block_invoke_130(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAttachmentTapMessage:v3];
}

void __35__MFMessageContentView__commonInit__block_invoke_2_134(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAttachmentSaveMessage:v3];
}

void __35__MFMessageContentView__commonInit__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    objc_super v6 = [v5 objectForKeyedSubscript:@"currentOffsetTop"];
    [v6 floatValue];
    float v8 = v7;

    __int16 v9 = [v5 objectForKeyedSubscript:@"preOffsetTop"];
    [v9 floatValue];
    double v10 = v8;
    double v12 = v11;
  }
  else
  {
    uint64_t v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __35__MFMessageContentView__commonInit__block_invoke_3_cold_1(v13);
    }

    double v10 = 0.0;
    double v12 = 0.0;
  }
  [WeakRetained _expandQuoteWithCollapsedBlockquoteOffset:v10 expandedOffset:v12];
}

void __35__MFMessageContentView__commonInit__block_invoke_148(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v6 BOOLValue];
    id v5 = [WeakRetained footerView];
    [v5 setMessageContainsBlockQuotes:v4];
  }
}

void __35__MFMessageContentView__commonInit__block_invoke_2_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained contentRequest];
    id v6 = [v5 contentRepresentationFuture];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__MFMessageContentView__commonInit__block_invoke_3_156;
    v7[3] = &unk_1E6D1B180;
    id v8 = v3;
    [v6 addSuccessBlock:v7];
  }
}

void __35__MFMessageContentView__commonInit__block_invoke_3_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setSkipMessageReformatting:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);
}

void __35__MFMessageContentView__commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _foundImageCIDAttachments:v3];
}

void __35__MFMessageContentView__commonInit__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSelectedHTML:v3];

  uint64_t v4 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained selectedHTML];
    [v4 messageContentView:WeakRetained didChangeSelectedHTML:v5];
  }
}

void __35__MFMessageContentView__commonInit__block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  if (v4) {
    [WeakRetained webProcessDidFailLoadingResourceWithURL:v4];
  }
}

- (WKWebView)webView
{
  id v3 = [(MFMessageContentView *)self webViewLoadingController];
  uint64_t v4 = [v3 webView];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F73C08]];

  id v5 = [(MFMessageContentView *)self webViewLoadingController];
  id v6 = [v5 webView];

  return (WKWebView *)v6;
}

- (MFWebViewDictionary)webViewConstants
{
  id v2 = [(MFMessageContentView *)self webViewLoadingController];
  id v3 = [v2 webViewConstants];

  return (MFWebViewDictionary *)v3;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 16;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 256;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 512;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 1024;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 2048;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v16;
    id v5 = obj;
  }
}

- (id)_updatedHeaderViewModelForMessage:(id)a3 replyToList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(MFMessageContentView *)self _mailboxForBanner:v6];
  __int16 v9 = [MessageHeaderViewModel alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MFMessageContentView__updatedHeaderViewModelForMessage_replyToList___block_invoke;
  v15[3] = &unk_1E6D1B1F8;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  v18 = self;
  id v12 = v8;
  id v19 = v12;
  __int16 v13 = [(MessageHeaderViewModel *)v9 initWithBuilder:v15];

  return v13;
}

void __70__MFMessageContentView__updatedHeaderViewModelForMessage_replyToList___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  id v3 = [*(id *)(a1 + 32) itemID];
  [v28 setItemID:v3];

  uint64_t v4 = [*(id *)(a1 + 32) flags];
  objc_msgSend(v28, "setRead:", objc_msgSend(v4, "read"));
  objc_msgSend(v28, "setFlagged:", objc_msgSend(v4, "flagged"));
  id v5 = [*(id *)(a1 + 32) flagColors];
  [v28 setFlagColors:v5];

  objc_msgSend(v28, "setReplied:", objc_msgSend(v4, "replied"));
  objc_msgSend(v28, "setForwarded:", objc_msgSend(v4, "forwarded"));
  objc_msgSend(v28, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v28, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 2);
  objc_msgSend(v28, "setMute:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 1);
  objc_msgSend(v28, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v28, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v28, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  id v6 = [*(id *)(a1 + 32) date];
  [v28 setDateSent:v6];

  id v7 = [*(id *)(a1 + 32) date];
  [v28 setDate:v7];

  __int16 v8 = [*(id *)(a1 + 32) subject];
  [v28 setSubject:v8];

  __int16 v9 = [*(id *)(a1 + 32) senderList];
  [v28 setSenderList:v9];

  [v28 setReplyToList:*(void *)(a1 + 40)];
  id v10 = [*(id *)(a1 + 32) toList];
  [v28 setToList:v10];

  id v11 = [*(id *)(a1 + 32) ccList];
  [v28 setCcList:v11];

  id v12 = [*(id *)(a1 + 32) bccList];
  [v28 setBccList:v12];

  __int16 v13 = [*(id *)(a1 + 48) mailboxProvider];
  __int16 v14 = [*(id *)(a1 + 56) objectID];
  __int16 v15 = [v13 legacyMailboxForObjectID:v14];
  [v28 setMailbox:v15];

  id v16 = [*(id *)(a1 + 48) atomManager];
  [v28 setAtomManager:v16];

  id v17 = [*(id *)(a1 + 32) readLater];
  v18 = [v17 date];
  [v28 setReadLaterDate:v18];

  id v19 = [*(id *)(a1 + 32) sendLaterDate];
  [v28 setSendLaterDate:v19];

  v20 = [*(id *)(a1 + 32) followUp];
  [v28 setFollowUp:v20];

  v21 = [*(id *)(a1 + 32) displayDate];
  [v28 setDisplayDate:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F73E98]);
  uint64_t v23 = *(void *)(a1 + 32);
  v24 = [*(id *)(a1 + 48) contactStore];
  v25 = [*(id *)(a1 + 48) brandIndicatorProvider];
  v26 = (void *)[v22 initWithMessageListItem:v23 contactStore:v24 brandIndicatorProvider:v25];
  [v28 setAvatarContext:v26];

  v27 = [*(id *)(a1 + 48) avatarGenerator];
  [v28 setAvatarGenerator:v27];
}

- (void)setContentRequest:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = (MessageContentRepresentationRequest *)a3;
  p_contentRequest = &self->_contentRequest;
  if (self->_contentRequest != v5)
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    v39 = _os_activity_create(&dword_1DDF5A000, "message content view loading", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v39, &state);
    [(EFCancelationToken *)self->_loadingCancelable cancel];
    loadingCancelable = self->_loadingCancelable;
    self->_loadingCancelable = 0;

    objc_storeStrong((id *)&self->_contentRequest, a3);
    __int16 v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    __int16 v9 = self->_loadingCancelable;
    self->_loadingCancelable = v8;

    id v10 = [(MFMessageContentView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v10 contentItemHandlingDelegateForMessageContentView:self];
      id v12 = [MessageContentItemsHelper alloc];
      __int16 v13 = [(MFMessageContentView *)self webView];
      __int16 v14 = [(MessageContentItemsHelper *)v12 initWithWebView:v13 contentItemHandler:v11];
      relatedItemsHelper = self->_relatedItemsHelper;
      self->_relatedItemsHelper = v14;
    }
    id v16 = [(MessageContentRepresentationRequest *)v5 message];
    id v17 = [MFAddressAtomStatusManager alloc];
    v18 = [v16 mailboxes];
    id v19 = [v18 firstObject];
    v20 = [v19 account];
    v21 = [(MFAddressAtomStatusManager *)v17 initWithAccount:v20];
    [(MFMessageContentView *)self setAtomManager:v21];

    [(MFMessageContentView *)self setHasVisibleContent:0];
    [(MFMessageContentView *)self setBlockedContentTypes:0];
    [(MFMessageContentView *)self _clearAllBannersAnimated:0];
    [(MFMessageContentView *)self _stopObservingContentHeight];
    [(MFConversationItemFooterView *)self->_footerView showAttribution];
    [(MFMessageContentView *)self setSelectedHTML:0];
    if (v5)
    {
      id v22 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        v25 = objc_msgSend(v16, "ef_publicDescription");
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = v24;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 2114;
        v50 = v5;
        __int16 v51 = 2114;
        v52 = v25;
        _os_log_impl(&dword_1DDF5A000, v22, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: set message content request: %{public}@ for message: %{public}@", buf, 0x2Au);
      }
      [(MFMessageContentView *)self _showDelayedProgressUIIfNeeded];
      v26 = +[MFMessageContentView signpostLog];
      os_signpost_id_t v27 = [(MessageContentRepresentationRequest *)*p_contentRequest signpostID];
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MFMessageContentView", (const char *)&unk_1DDFC0BEE, buf, 2u);
      }

      id v28 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __42__MFMessageContentView_setContentRequest___block_invoke;
      v43[3] = &unk_1E6D1AB90;
      v43[4] = self;
      id v29 = v16;
      id v44 = v29;
      v30 = [v28 afterDelay:v43 performBlock:3.0];
      [(MFMessageContentView *)self setLoadingSpinnerTailspinToken:v30];

      v31 = [(MFMessageContentView *)self _updatedHeaderViewModelForMessage:v29 replyToList:0];
      [(MFMessageHeaderView *)self->_headerView displayMessageUsingViewModel:v31];
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v32 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      v33 = self->_loadingCancelable;
      v34 = *p_contentRequest;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __42__MFMessageContentView_setContentRequest___block_invoke_219;
      v40[3] = &unk_1E6D1B220;
      objc_copyWeak(&v42, (id *)buf);
      id v41 = v29;
      v35 = [(MessageContentRepresentationRequest *)v34 onScheduler:v32 addLoadObserver:v40];
      [(EFCancelationToken *)v33 addCancelable:v35];

      [(MessageContentRepresentationRequest *)*p_contentRequest start];
      objc_destroyWeak(&v42);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(MFMessageContentView *)self clearMessage];
      v36 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v38;
        __int16 v47 = 2048;
        v48 = self;
        _os_log_impl(&dword_1DDF5A000, v36, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: set nil content request, removing loading indicator", buf, 0x16u);
      }
      [(MFMessageContentView *)self setLoadingIndicatorVisible:0];
    }

    os_activity_scope_leave(&state);
  }
}

void __42__MFMessageContentView_setContentRequest___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"Loading spinner displayed for %fl seconds", 0x4008000000000000);
  EFSaveTailspin();
  id v3 = +[MFMessageContentView log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    *(_DWORD *)buf = 138544130;
    __int16 v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 2114;
    __int16 v15 = v7;
    _os_log_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ for message: %{public}@", buf, 0x2Au);
  }
}

void __42__MFMessageContentView_setContentRequest___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v8 = [WeakRetained loadingSpinnerTailspinToken];
  [v8 cancel];

  [WeakRetained setContentRepresentationError:v6];
  if (v5 && WeakRetained)
  {
    id v9 = WeakRetained[75];
    __int16 v10 = [v5 contentURL];
    [v9 addObject:v10];

    uint64_t v11 = [WeakRetained delegate];
    [v11 messageContentView:WeakRetained handleContentRepresentation:v5];

    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = [v5 replyToList];
    __int16 v14 = [WeakRetained _updatedHeaderViewModelForMessage:v12 replyToList:v13];

    __int16 v15 = +[MFMessageContentView log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      v18 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = WeakRetained;
      __int16 v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1DDF5A000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Updating header for message: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    [WeakRetained[53] displayMessageUsingViewModel:v14];
  }
  else
  {
    __int16 v14 = +[MFMessageContentView log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      objc_claimAutoreleasedReturnValue();
      __42__MFMessageContentView_setContentRequest___block_invoke_219_cold_1();
    }
  }

  [WeakRetained contentRequestDidReceiveContentRepresentation:v5 error:v6];
}

- (id)_mailboxForBanner:(id)a3
{
  id v3 = [a3 mailboxes];
  uint64_t v4 = objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_223);
  if (!v4)
  {
    uint64_t v4 = objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_225);
    if (!v4)
    {
      uint64_t v4 = objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_227);
      if (!v4)
      {
        uint64_t v4 = [v3 firstObject];
      }
    }
  }

  return v4;
}

uint64_t __42__MFMessageContentView__mailboxForBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInboxMailbox];
}

uint64_t __42__MFMessageContentView__mailboxForBanner___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canArchive];
}

BOOL __42__MFMessageContentView__mailboxForBanner___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

- (void)setPreviousContentSnapshot:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = (UIView *)a3;
  id v6 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    __int16 v8 = NSStringFromClass(v7);
    previousContentSnapshot = self->_previousContentSnapshot;
    int v32 = 138544130;
    v33 = v8;
    __int16 v34 = 2048;
    v35 = self;
    __int16 v36 = 2048;
    v37 = v5;
    __int16 v38 = 2048;
    v39 = previousContentSnapshot;
    _os_log_impl(&dword_1DDF5A000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: setPreviousContentSnapshot:%p (was %p)", (uint8_t *)&v32, 0x2Au);
  }
  p_previousContentSnapshot = &self->_previousContentSnapshot;
  uint64_t v11 = self->_previousContentSnapshot;
  if (v11 != v5)
  {
    [(UIView *)v11 removeFromSuperview];
    objc_storeStrong((id *)p_previousContentSnapshot, a3);
    if (*p_previousContentSnapshot)
    {
      [(UIView *)*p_previousContentSnapshot frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [(MFMessageContentView *)self layoutMargins];
      -[UIView setFrame:](*p_previousContentSnapshot, "setFrame:", v18, v13, v15, v17);
      if (!self->_previousContentSnapshotWrapperView)
      {
        id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        [(MFMessageContentView *)self bounds];
        int v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
        previousContentSnapshotWrapperView = self->_previousContentSnapshotWrapperView;
        self->_previousContentSnapshotWrapperView = v20;

        __int16 v22 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        [(UIView *)self->_previousContentSnapshotWrapperView setBackgroundColor:v22];

        [(UIView *)self->_previousContentSnapshotWrapperView setAutoresizingMask:18];
      }
      [(MFMessageContentView *)self bounds];
      -[UIView setFrame:](self->_previousContentSnapshotWrapperView, "setFrame:");
      [(UIView *)self->_previousContentSnapshotWrapperView addSubview:*p_previousContentSnapshot];
      [(UIView *)self->_previousContentSnapshotWrapperView setAlpha:1.0];
      uint64_t v23 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        uint64_t v26 = self->_previousContentSnapshotWrapperView;
        int v32 = 138543874;
        v33 = v25;
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 2048;
        v37 = v26;
        _os_log_impl(&dword_1DDF5A000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: adding previousContentSnapshotWrapperView: %p", (uint8_t *)&v32, 0x20u);
      }
      os_signpost_id_t v27 = [(MFMessageContentView *)self scrollView];
      [v27 addSubview:self->_previousContentSnapshotWrapperView];
    }
    else
    {
      id v28 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = self->_previousContentSnapshotWrapperView;
        int v32 = 138543874;
        v33 = v30;
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 2048;
        v37 = v31;
        _os_log_impl(&dword_1DDF5A000, v28, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: removing previousContentSnapshotWrapperView: %p", (uint8_t *)&v32, 0x20u);
      }
      [(UIView *)self->_previousContentSnapshotWrapperView removeFromSuperview];
    }
  }
}

- (BOOL)sourceIsManaged
{
  id v2 = [(MFMessageContentView *)self contentRequest];
  id v3 = [v2 message];
  uint64_t v4 = [v3 mailboxes];
  char v5 = objc_msgSend(v4, "ef_all:", &__block_literal_global_230);

  return v5;
}

uint64_t __39__MFMessageContentView_sourceIsManaged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 account];
  uint64_t v3 = [v2 sourceIsManaged];

  return v3;
}

- (EMContentRepresentation)contentRepresentationIfAvailable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFMessageContentView *)self contentRequest];
  uint64_t v4 = [v3 resultIfAvailable];

  if (!v4)
  {
    char v5 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      id v9 = [(MFMessageContentView *)self contentRequest];
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      double v13 = self;
      __int16 v14 = 2114;
      double v15 = v9;
      _os_log_error_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: contentRepresentation requested before it finished loading: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (EMContentRepresentation *)v4;
}

- (EMContentRepresentation)contentRepresentation
{
  id v2 = [(MFMessageContentView *)self contentRequest];
  uint64_t v3 = [v2 waitForResult];

  return (EMContentRepresentation *)v3;
}

- (void)sceneMovedToForeground
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_backgroundWebProcessCrashCount)
  {
    [(NSMutableSet *)self->_inFlightURLs removeAllObjects];
    uint64_t v3 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      char v5 = NSStringFromClass(v4);
      unint64_t backgroundWebProcessCrashCount = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138543874;
      int v10 = v5;
      __int16 v11 = 2048;
      __int16 v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = backgroundWebProcessCrashCount;
      _os_log_impl(&dword_1DDF5A000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Reloading web view (background crash count: %ld)", buf, 0x20u);
    }
    self->_unint64_t backgroundWebProcessCrashCount = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__MFMessageContentView_sceneMovedToForeground__block_invoke;
    v8[3] = &unk_1E6D1AB40;
    v8[4] = self;
    id v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v7 performBlock:v8];
  }
}

void __46__MFMessageContentView_sceneMovedToForeground__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webViewLoadingController];
  [v1 slapWebView];
}

- (void)_setupWebProcessLocalizedStrings
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MFMessageContentView__setupWebProcessLocalizedStrings__block_invoke;
  v6[3] = &unk_1E6D1B268;
  v6[4] = self;
  uint64_t v3 = objc_msgSend(&unk_1F39EEE98, "ef_map:", v6);
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&unk_1F39EEE98];
  char v5 = [(MFMessageContentView *)self webViewConstants];
  [v5 setObject:v4 forKeyedSubscript:@"localizedStrings"];
}

id __56__MFMessageContentView__setupWebProcessLocalizedStrings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_1F39E2A88 table:@"Main"];

  return v4;
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MFMessageContentView;
  [(MFMessageContentView *)&v19 layoutSubviews];
  if ([(MFMessageContentView *)self showMessageFooter])
  {
    [(MFMessageContentView *)self _layoutFooterView];
    [(MFMessageContentView *)self bringSubviewToFront:self->_footerView];
  }
  uint64_t v3 = [(MFMessageContentView *)self loadingView];
  uint64_t v4 = [v3 superview];

  if (v4)
  {
    char v5 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      __int16 v8 = [(MFMessageContentView *)self loadingView];
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      __int16 v24 = 2048;
      v25 = v8;
      _os_log_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: bringing loading view to front: %p", buf, 0x20u);
    }
    [(MFMessageContentView *)self _layoutLoadingView];
    id v9 = [(MFMessageContentView *)self loadingView];
    int v10 = [v9 superview];
    __int16 v11 = [(MFMessageContentView *)self loadingView];
    [v10 bringSubviewToFront:v11];

    __int16 v12 = [(MFMessageContentView *)self scrollView];
    [v12 setZoomEnabled:0];

    __int16 v13 = [(MFMessageContentView *)self scrollView];
    [v13 setScrollEnabled:0];
  }
  if (self->_previousContentSnapshotWrapperView)
  {
    unint64_t v14 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      previousContentSnapshotWrapperView = self->_previousContentSnapshotWrapperView;
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      __int16 v24 = 2048;
      v25 = previousContentSnapshotWrapperView;
      _os_log_impl(&dword_1DDF5A000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: bringing previous content snapshot wrapper view to front: %p", buf, 0x20u);
    }
    double v18 = [(UIView *)self->_previousContentSnapshotWrapperView superview];
    [v18 bringSubviewToFront:self->_previousContentSnapshotWrapperView];
  }
  [(UIView *)self mf_activateDebugModeIfEnabled];
}

- (void)_layoutFooterView
{
  id v29 = [(MFMessageContentView *)self footerView];
  [v29 bounds];
  double Height = CGRectGetHeight(v31);
  if (Height > 0.0)
  {
    [v29 layoutMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(MFMessageContentView *)self layoutMargins];
    if (v7 != v15 || v5 != v12 || v11 != v14 || v9 != v13)
    {
      [(MFMessageContentView *)self layoutMargins];
      objc_msgSend(v29, "setLayoutMargins:");
    }
    [(MFMessageContentView *)self bounds];
    double Width = CGRectGetWidth(v32);
    [v29 bounds];
    if (v18 != Width || v17 != Height)
    {
      id v19 = v29;
      [v19 frame];
      objc_msgSend(v19, "setFrame:");
    }
    if ([(MFMessageContentView *)self shouldHideStickyFooterView])
    {
      [v29 frame];
      double v21 = v20;
      CGFloat v23 = v22;
      double v25 = v24;
      double v27 = v26;
      [(MFMessageContentView *)self frame];
      CGRectGetHeight(v33);
      v34.origin.x = v21;
      v34.origin.y = v23;
      v34.size.width = v25;
      v34.size.height = v27;
      CGRectGetHeight(v34);
      UIRoundToViewScale();
      objc_msgSend(v29, "setFrame:", v21, v28, v25, v27);
    }
  }
}

- (BOOL)shouldHideStickyFooterView
{
  id v2 = [(MFMessageContentView *)self traitCollection];
  char v3 = objc_msgSend(v2, "mf_hasCompactDimension");

  return v3;
}

- (void)_layoutLoadingView
{
  id v15 = [(MFMessageContentView *)self scrollView];
  [v15 contentInset];
  double v4 = v3;
  double v6 = v5;

  [(MFMessageContentView *)self bounds];
  double v8 = v7;
  double v10 = v9 + 0.0;
  double v12 = v4 + v11;
  double v14 = v13 - (v4 + v6);
  id v16 = [(MFMessageContentView *)self loadingView];
  objc_msgSend(v16, "setFrame:", v10, v12, v8, v14);
}

- (double)_viewportWidth
{
  [(MFMessageContentView *)self frame];
  return floor(CGRectGetWidth(v3));
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageContentView;
  -[MFMessageContentView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__MFMessageContentView_setFrame___block_invoke;
  v4[3] = &unk_1E6D1AB40;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __33__MFMessageContentView_setFrame___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webView];
  [v2 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)(a1 + 32) bounds];
  v28.origin.x = v11;
  v28.origin.y = v12;
  v28.size.width = v13;
  v28.size.height = v14;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  BOOL v15 = CGRectEqualToRect(v27, v28);

  if (!v15)
  {
    [*(id *)(a1 + 32) bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v24 = [*(id *)(a1 + 32) webView];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    if ([*(id *)(a1 + 32) contentPaddingFollowsLayoutMargins])
    {
      double v25 = *(void **)(a1 + 32);
      [v25 _setNeedsPaddingConstantsUpdate];
    }
  }
}

- (BOOL)_firstResponderIsInWebView
{
  double v3 = [(MFMessageContentView *)self firstResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v4 = [(MFMessageContentView *)self webView];
    char v5 = [v3 isDescendantOfView:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_selectAll_ == a3)
  {
    unsigned __int8 v7 = [(MFMessageContentView *)self _firstResponderIsInWebView];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFMessageContentView;
    unsigned __int8 v7 = [(MFMessageContentView *)&v10 canPerformAction:a3 withSender:v6];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)selectAll:(id)a3
{
  id v5 = a3;
  if ([(MFMessageContentView *)self _firstResponderIsInWebView])
  {
    CGFloat v4 = [(MFMessageContentView *)self firstResponder];
    [v4 selectAll:v5];
  }
}

- (void)setDisplayMetrics:(id)a3
{
  id v6 = a3;
  if (!-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    id v5 = [(MFMessageContentView *)self headerView];
    [v5 setDisplayMetrics:v6];

    [(MFConversationItemFooterView *)self->_footerView setDisplayMetrics:v6];
    if ([(MFMessageContentView *)self contentPaddingFollowsLayoutMargins]) {
      [(MFMessageContentView *)self _setNeedsPaddingConstantsUpdate];
    }
  }
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4
{
  if (self->_automaticallyCollapseQuotedContent != a3)
  {
    BOOL v4 = a4;
    objc_msgSend(NSNumber, "numberWithBool:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v7 = [(MFMessageContentView *)self webViewLoadingController];
    BOOL v8 = [v7 webViewConstants];
    [v8 setObject:v13 forKeyedSubscript:@"collapseQuotedContent"];

    self->_automaticallyCollapseQuotedContent = a3;
    if (v4)
    {
      id v14 = [(MFMessageContentView *)self webViewLoadingController];
      [v14 reload];
    }
    if ([(MFMessageContentView *)self shouldHideStickyFooterView])
    {
      BOOL v9 = [(MFMessageContentView *)self automaticallyCollapseQuotedContent];
      id v15 = [(MFMessageContentView *)self footerView];
      objc_super v10 = [v15 seeMoreButton];
      CGFloat v11 = v10;
      double v12 = 0.0;
      if (v9) {
        double v12 = 1.0;
      }
      [v10 setAlpha:v12];
    }
  }
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3
{
}

- (void)setShowMessageFooter:(BOOL)a3
{
  if (self->_showMessageFooter != a3)
  {
    BOOL v3 = a3;
    self->_showMessageFooter = a3;
    id v5 = [(MFMessageContentView *)self footerView];
    id v6 = v5;
    if (v3) {
      [(MFMessageContentView *)self addSubview:v5];
    }
    else {
      [v5 removeFromSuperview];
    }
  }
}

- (MFConversationItemFooterView)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    BOOL v4 = objc_alloc_init(MFConversationItemFooterView);
    id v5 = self->_footerView;
    self->_footerView = v4;

    [(MFConversationItemFooterView *)self->_footerView setDelegate:self];
    [(MFConversationItemFooterView *)self->_footerView addTarget:self action:sel__revealActionsButtonTapped toButton:1];
    [(MFConversationItemFooterView *)self->_footerView addTarget:self action:sel__seeMoreButtonTapped toButton:0];
    [(MFConversationItemFooterView *)self->_footerView addTarget:self action:sel__undoSendButtonTapped toButton:2];
    id v6 = [(MFMessageContentView *)self displayMetrics];
    [(MFConversationItemFooterView *)self->_footerView setDisplayMetrics:v6];

    [(MFConversationItemFooterView *)self->_footerView setAlpha:0.0];
    footerView = self->_footerView;
  }
  return footerView;
}

- (void)setMessageBlockingReason:(int64_t)a3
{
  self->_messageBlockingReason = a3;
  [NSNumber numberWithInt:a3 == 0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(MFMessageContentView *)self webViewConstants];
  [v4 setObject:v5 forKeyedSubscript:@"showRemoteImages"];
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(MFMessageContentView *)self webViewConstants];
  [v4 setObject:v5 forKeyedSubscript:@"initial-scale"];
}

- (void)_updateMinimumFontSize
{
  v18[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = *MEMORY[0x1E4FB2790];
  v18[0] = *MEMORY[0x1E4FB2798];
  v18[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB2780];
  v18[2] = *MEMORY[0x1E4FB2788];
  v18[3] = v5;
  v18[4] = *MEMORY[0x1E4FB2778];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  unsigned __int8 v7 = [v3 setWithArray:v6];

  BOOL v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v9 = [v8 preferredContentSizeCategory];
  int v10 = [v7 containsObject:v9];

  double v11 = 0.0;
  if (v10)
  {
    double v12 = [(MFMessageContentView *)self _bodyFont];
    [v12 pointSize];
    double v11 = v13;
  }
  id v14 = [(MFMessageContentView *)self webView];
  id v15 = [v14 configuration];
  double v16 = [v15 preferences];

  [v16 minimumFontSize];
  if (vabdd_f64(v17, v11) > 0.00000011920929)
  {
    [v16 setMinimumFontSize:v11];
    [(MFMessageContentView *)self _reloadUserStyleSheets];
  }
}

- (void)layoutMarginsDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)MFMessageContentView;
  [(MFMessageContentView *)&v10 layoutMarginsDidChange];
  [(UIView *)self->_previousContentSnapshot frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(MFMessageContentView *)self layoutMargins];
  -[UIView setFrame:](self->_previousContentSnapshot, "setFrame:", v9, v4, v6, v8);
  [(MFMessageContentView *)self _layoutFooterView];
}

- (void)_fontSizeDidChange:(id)a3
{
  [(MFMessageContentView *)self _updateMinimumFontSize];
  [(MFMessageContentView *)self frame];
  double Width = CGRectGetWidth(v11);
  [(MFMessageContentView *)self safeAreaInsets];
  +[MFReadableContentMarginCalculator readableContentMarginsForWidth:minMargins:safeAreaInsets:](MFReadableContentMarginCalculator, "readableContentMarginsForWidth:minMargins:safeAreaInsets:", Width, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24), v5, v6, v7, v8);
  [(MFMessageContentView *)self setLayoutMargins:"setLayoutMargins:"];
  id v9 = [(MFMessageContentView *)self webViewLoadingController];
  [v9 reload];
}

- (id)_bodyFont
{
  id v2 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  double v3 = [v2 cachedPreferredFontForStyle:*MEMORY[0x1E4FB28C8]];

  return v3;
}

- (void)_setNeedsPaddingConstantsUpdate
{
  if (!self->_paddingConstantsNeedUpdate)
  {
    self->_paddingConstantsNeedUpdate = 1;
    [(MFMessageContentView *)self performSelectorOnMainThread:sel__updateWebViewPaddingConstants withObject:0 waitUntilDone:0];
  }
}

- (void)_updateWebViewPaddingConstants
{
  v64[4] = *MEMORY[0x1E4F143B8];
  [(MFMessageContentView *)self _viewportWidth];
  double v5 = v4;
  uint64_t v6 = [(MFMessageContentView *)self quickReplyAnimationContext];
  double v7 = 0.0;
  if (v6)
  {
    uint64_t v8 = [(MFMessageContentView *)self quickReplyAnimationContext];
    [v8 insets];
    double v7 = v9;
  }
  [(MFMessageContentView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(MFMessageContentView *)self showMessageFooter];
  id v14 = [(MFMessageContentView *)self _bodyFont];
  id v15 = [(MFMessageContentView *)self displayMetrics];
  if ([v15 hasCompactLayout]) {
    double v16 = 29.0;
  }
  else {
    double v16 = 32.0;
  }

  [v14 _scaledValueForValue:v16];
  [v14 lineHeight];
  [v14 leading];
  double v17 = [(MFMessageContentView *)self displayMetrics];
  int v18 = [v17 hasGenerousMargins];
  double v19 = v7 + v13 + -7.0;
  double v20 = v11 + -7.0;

  double v21 = (double *)MEMORY[0x1E4FB2848];
  if (v18) {
    double v22 = v11 + -7.0;
  }
  else {
    double v22 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  if (v18) {
    double v23 = v19;
  }
  else {
    double v23 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (v18) {
    double v24 = v20 + v19;
  }
  else {
    double v24 = 0.0;
  }
  double v25 = [(MFMessageContentView *)self webView];
  objc_msgSend(v25, "_setObscuredInsets:", *v21, v22);

  double v26 = [(MFMessageContentView *)self webView];
  double v49 = v5 - v24;
  objc_msgSend(v26, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:");

  CGRect v27 = [(MFMessageContentView *)self webView];
  CGRect v28 = [v27 scrollView];
  [v28 contentInset];
  double v30 = v29;
  double v32 = v31;

  CGRect v33 = [(MFMessageContentView *)self webView];
  CGRect v34 = [v33 scrollView];
  objc_msgSend(v34, "setContentInset:", v30, v22, v32, v23);

  UIEdgeInsetsSubtract();
  v35 = MFFloatToCSSPixelString();
  v64[0] = v35;
  __int16 v36 = MFFloatToCSSPixelString();
  v64[1] = v36;
  v37 = MFFloatToCSSPixelString();
  v64[2] = v37;
  __int16 v38 = MFFloatToCSSPixelString();
  v64[3] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];

  uint64_t v40 = [v39 componentsJoinedByString:@" "];
  id v41 = +[MFMessageContentView log];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    id v44 = NSStringFromSelector(a2);
    v45 = [(MFMessageContentView *)self webView];
    *(_DWORD *)buf = 138544642;
    id v53 = v43;
    __int16 v54 = 2048;
    v55 = self;
    __int16 v56 = 2114;
    v57 = v44;
    __int16 v58 = 2048;
    v59 = v45;
    __int16 v60 = 2114;
    v61 = v40;
    __int16 v62 = 2048;
    double v63 = v49;
    _os_log_impl(&dword_1DDF5A000, v41, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ webView = %p padding:%{public}@ viewport-width:%f", buf, 0x3Eu);
  }
  v46 = [(MFMessageContentView *)self webViewConstants];
  v50[0] = @"padding";
  v50[1] = @"viewport-width";
  v51[0] = v40;
  __int16 v47 = [NSNumber numberWithDouble:v49];
  v51[1] = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  [v46 setValuesForKeysWithDictionary:v48];

  self->_paddingConstantsNeedUpdate = 0;
}

- (id)_styleSheetWithPadding:(UIEdgeInsets)a3 useWideLayout:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = CSSString(v4);
  [v5 setObject:v6 forKeyedSubscript:@"padding-left"];

  double v7 = CSSString(v4);
  [v5 setObject:v7 forKeyedSubscript:@"padding-right"];

  uint64_t v8 = MFFloatToCSSPixelString();
  [v5 setObject:v8 forKeyedSubscript:@"padding-top"];

  double v9 = MFFloatToCSSPixelString();
  [v5 setObject:v9 forKeyedSubscript:@"padding-bottom"];

  double v13 = @"BODY";
  v14[0] = v5;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  double v11 = MFCSSStringFromDictionary();

  return v11;
}

- (void)_reloadUserStyleSheets
{
  double v3 = [(MFMessageContentView *)self webView];
  BOOL v4 = [v3 configuration];
  id v9 = [v4 userContentController];

  [v9 _removeAllUserStyleSheets];
  double v5 = MFUserStyleSheetCSS();
  uint64_t v6 = _styleSheetWithSource(v5);
  [v9 _addUserStyleSheet:v6];

  if (_reloadUserStyleSheets_onceToken != -1) {
    dispatch_once(&_reloadUserStyleSheets_onceToken, &__block_literal_global_309);
  }
  [v9 _addUserStyleSheet:_reloadUserStyleSheets_attachmentStyleSheet];
  double v7 = -[MFMessageContentView _styleSheetWithPadding:useWideLayout:](self, "_styleSheetWithPadding:useWideLayout:", 0, 0.0, 16.0, 0.0, 16.0);
  uint64_t v8 = _styleSheetWithSource(v7);
  [v9 _addUserStyleSheet:v8];
}

void __46__MFMessageContentView__reloadUserStyleSheets__block_invoke()
{
  v0 = NSString;
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v1 pathForResource:@"attachments" ofType:@"css"];
  double v3 = [v0 stringWithContentsOfFile:v2 encoding:4 error:0];

  uint64_t v4 = _styleSheetWithSource(v3);

  double v5 = (void *)_reloadUserStyleSheets_attachmentStyleSheet;
  _reloadUserStyleSheets_attachmentStyleSheet = v4;
}

- (void)clearMessage
{
  double v3 = [(MFMessageContentView *)self webViewLoadingController];
  [v3 stopLoading];

  [(UIView *)self->_previousContentSnapshotWrapperView removeFromSuperview];
  uint64_t v4 = [(MFMessageContentView *)self previousContentSnapshot];
  [v4 removeFromSuperview];

  [(MFMessageContentView *)self setPreviousContentSnapshot:0];
  [(MFMessageContentView *)self _stopObservingContentHeight];
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_mailDropBanner animated:0];
  [(MFMessageContentView *)self _clearAllBannersAnimated:0];
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  [(MFMessageContentView *)self setAttachments:v5];
}

- (void)_clearAllBannersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[MFMessageContentView _clearLoadRemoteImagesBannerAnimated:](self, "_clearLoadRemoteImagesBannerAnimated:");
  [(MFMessageContentView *)self _clearHasMoreContentBannerAnimated:v3];
  [(MFMessageContentView *)self _clearBlockedSenderBannerAnimated:v3];
  [(MFMessageContentView *)self _clearLoadFailedProxyContentBannerAnimated:v3];
  id v5 = [(MFMessageContentView *)self delegate];
  [v5 messageContentView:self clearSuggestionsBannerAnimated:v3];
}

- (void)_addLoadingSubview:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MFMessageContentView *)self scrollView];
  [(MFMessageContentView *)self insertSubview:v5 above:v4];
  [v4 setZoomEnabled:0];
  [v4 setScrollEnabled:0];
}

- (void)_removeLoadingSubview:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 superview];

  if (v4)
  {
    id v5 = [(MFMessageContentView *)self scrollView];
    [v6 removeFromSuperview];
    [v5 setZoomEnabled:1];
    [v5 setScrollEnabled:1];
  }
}

- (void)_showDelayedProgressUIIfNeeded
{
  BOOL v3 = [(MFMessageContentView *)self loadingView];
  [v3 alpha];
  if (v4 != 1.0)
  {
    [v3 setAlpha:1.0];
    [(MFMessageContentView *)self _addLoadingSubview:v3];
    id v5 = [(MFMessageContentView *)self loadingIndicatorCancelable];
    [v5 cancel];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v6 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __54__MFMessageContentView__showDelayedProgressUIIfNeeded__block_invoke;
    double v11 = &unk_1E6D1A8F8;
    objc_copyWeak(&v12, &location);
    double v7 = [v6 afterDelay:&v8 performBlock:0.85];

    -[MFMessageContentView setLoadingIndicatorCancelable:](self, "setLoadingIndicatorCancelable:", v7, v8, v9, v10, v11);
    [(EFCancelationToken *)self->_loadingCancelable addCancelable:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __54__MFMessageContentView__showDelayedProgressUIIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    int v5 = 138543618;
    id v6 = v4;
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1DDF5A000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: showing delayed progress indicator", (uint8_t *)&v5, 0x16u);
  }
  [WeakRetained setLoadingIndicatorVisible:1];
}

- (BOOL)isLoadingIndicatorVisible
{
  id v2 = [(MFMessageContentView *)self loadingView];
  char v3 = [v2 isLoadingIndicatorVisible];

  return v3;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
}

- (void)setLoadingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  __int16 v7 = [(MFMessageContentView *)self loadingIndicatorCancelable];
  [v7 cancel];

  id v8 = [(MFMessageContentView *)self loadingView];
  uint64_t v9 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v8 isLoadingIndicatorVisible];
    double v13 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544386;
    id v23 = v11;
    __int16 v24 = 2048;
    double v25 = self;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2048;
    double v29 = v8;
    __int16 v30 = 2112;
    double v31 = v13;
    _os_log_impl(&dword_1DDF5A000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: loadingIndicatorVisible=%@ (view: %p wasVisible %@)", buf, 0x34u);
  }
  [v8 setAlpha:1.0];
  if (v5)
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    [(MFMessageContentView *)self _addLoadingSubview:v8];
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke;
    aBlock[3] = &unk_1E6D1AB40;
    id v16 = v8;
    id v21 = v16;
    unint64_t v14 = (unint64_t)_Block_copy(aBlock);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke_2;
    v18[3] = &unk_1E6D1B290;
    v18[4] = self;
    id v19 = v16;
    unint64_t v15 = (unint64_t)_Block_copy(v18);
  }
  [v8 setLoadingIndicatorVisible:v5 animated:v4];
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    double v17 = [(MFMessageContentView *)self delegate];
    objc_msgSend(v17, "messageContentView:loadingIndicatorDidChangeVisibility:", self, -[MFMessageContentView isLoadingIndicatorVisible](self, "isLoadingIndicatorVisible"));
  }
  if (v14 | v15)
  {
    if (v4)
    {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v14 animations:v15 completion:*MEMORY[0x1E4F35138]];
    }
    else
    {
      if (v14) {
        (*(void (**)(unint64_t))(v14 + 16))(v14);
      }
      if (v15) {
        (*(void (**)(unint64_t, uint64_t))(v15 + 16))(v15, 1);
      }
    }
  }
}

uint64_t __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLoadingSubview:*(void *)(a1 + 40)];
}

- (void)reload
{
  id v2 = [(MFMessageContentView *)self webViewLoadingController];
  [v2 reload];
}

- (void)clearSelectedHTML
{
}

- (UIScrollView)scrollView
{
  id v2 = [(MFMessageContentView *)self webView];
  char v3 = [v2 scrollView];

  return (UIScrollView *)v3;
}

- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1DDF5A000, "-[MFMessageContentView contentRequestDidReceiveContentRepresentation:error:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  self->_showingError = 0;
  if (v6)
  {
    uint64_t v9 = [v6 relatedContentItems];
    [(MessageContentItemsHelper *)self->_relatedItemsHelper setContentItems:v9];

    [(MFMessageContentView *)self _requestWebViewLoadWithRepresentation:v6];
    if ([v6 hasMoreContent])
    {
      double v10 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(MFMessageContentView *)self contentRequest];
        id v12 = [v11 message];
        double v13 = objc_msgSend(v12, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        id v31 = v13;
        _os_log_impl(&dword_1DDF5A000, v10, OS_LOG_TYPE_DEFAULT, "Add hasMoreContent banner for message: %{public}@", buf, 0xCu);
      }
      -[MFMessageContentView _addHasMoreContentBannerWithRemainingBytes:](self, "_addHasMoreContentBannerWithRemainingBytes:", [v6 remainingByteCount]);
    }
    else
    {
      [(MFMessageContentView *)self _clearHasMoreContentBannerAnimated:1];
    }
    [(MFMessageContentView *)self _addBlockedSenderBannerIfNeeded];
    [(MFMessageContentView *)self _addHideMyEmailBannerIfNeeded];
    [(MFMessageContentView *)self _addNotAuthenticatedBannerIfNeeded];
    unint64_t v15 = [(MessageContentItemsHelper *)self->_relatedItemsHelper mailDropBannerMetadata];
    if (v15)
    {
      mailDropBanner = self->_mailDropBanner;
      if (!mailDropBanner)
      {
        double v17 = objc_alloc_init(MFMailDropBannerView);
        int v18 = self->_mailDropBanner;
        self->_mailDropBanner = v17;

        [(MFMailDropBannerView *)self->_mailDropBanner setDelegate:self];
        mailDropBanner = self->_mailDropBanner;
      }
      [(MFMailDropBannerView *)mailDropBanner setMetaData:v15];
      if ([(MessageContentItemsHelper *)self->_relatedItemsHelper allMailDropsDownloaded]) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 1;
      }
      [(MFMailDropBannerView *)self->_mailDropBanner setBannerState:v19];
      double v20 = self->_mailDropBanner;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__MFMessageContentView_contentRequestDidReceiveContentRepresentation_error___block_invoke;
      v27[3] = &unk_1E6D1B2B8;
      id v21 = v20;
      __int16 v28 = v21;
      [(MessageContentItemsHelper *)self->_relatedItemsHelper setMaildropProgressHandler:v27];
      [(MFMessageHeaderView *)self->_headerView addHeaderBlock:self->_mailDropBanner animated:0];
    }
  }
  else
  {
    self->_showingError = 1;
    unint64_t v14 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v24 = [(MFMessageContentView *)self contentRequest];
      double v25 = [v24 message];
      __int16 v26 = objc_msgSend(v7, "ef_publicDescription");
      *(_DWORD *)buf = 138544130;
      id v31 = v23;
      __int16 v32 = 2048;
      CGRect v33 = self;
      __int16 v34 = 2112;
      v35 = v25;
      __int16 v36 = 2114;
      v37 = v26;
      _os_log_error_impl(&dword_1DDF5A000, v14, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Error loading content represenation for message %@ : %{public}@", buf, 0x2Au);
    }
    unint64_t v15 = [(MFMessageContentView *)self webViewLoadingController];
    [v15 requestWebViewLoadWithError:v7];
  }

  os_activity_scope_leave(&state);
}

uint64_t __76__MFMessageContentView_contentRequestDidReceiveContentRepresentation_error___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  uint64_t v3 = result;
  if (a2 == 3)
  {
    [*(id *)(result + 32) setBannerState:2];
    id v7 = *(void **)(v3 + 32);
    return [v7 setDownloadProgress:a3];
  }
  else
  {
    if (a2 == 2)
    {
      BOOL v4 = *(void **)(result + 32);
      uint64_t v5 = 1;
    }
    else
    {
      if (a2 != 1) {
        return result;
      }
      BOOL v4 = *(void **)(result + 32);
      uint64_t v5 = 3;
    }
    return [v4 setBannerState:v5];
  }
}

- (void)_requestWebViewLoadWithRepresentation:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v4 contentMessage];
    uint64_t v9 = [v8 itemID];
    double v10 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138544130;
    id v43 = v7;
    __int16 v44 = 2048;
    v45 = self;
    __int16 v46 = 2114;
    __int16 v47 = v9;
    __int16 v48 = 2114;
    double v49 = v10;
    _os_log_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Request webView load for message-id: %{public}@, representation: %{public}@", buf, 0x2Au);
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v12 = [v11 BOOLForKey:@"DisableDisplayInfoCache"];

  if (v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = [v4 skipMessageReformatting];
  }
  unint64_t v14 = [NSNumber numberWithBool:v13];
  unint64_t v15 = [(MFMessageContentView *)self webViewConstants];
  [v15 setObject:v14 forKeyedSubscript:@"shouldSkipReformatting"];

  id v16 = [v4 securityInformation];
  [(MFMessageContentView *)self _configureTrustEvaluationsForSignersInSecurityInformation:v16];
  double v17 = [(MFMessageContentView *)self atomManager];
  [v17 updateWithSecurityInformation:v16];

  int v18 = [(MFMessageContentView *)self contentRequest];
  uint64_t v19 = [v18 message];
  id v41 = [v19 senderList];

  uint64_t v40 = [v4 replyToList];
  if (+[MFAddressAtomStatusManager shouldDecorateAtomListForSender:v41 replyTo:v40])
  {
    double v20 = [(MFMessageContentView *)self atomManager];
    [v20 updateWithReplyToInformation:v40];
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    id v21 = [(MFMessageContentView *)self delegate];
    [v21 messageContentView:self didLoadSecurityInformation:v16];
  }
  if ([v16 hasEncryptedDescendantPart])
  {
    uint64_t v22 = 2;
  }
  else
  {
    id v23 = [v16 signers];
    BOOL v24 = (unint64_t)[v23 count] > 1;

    if (!v24) {
      goto LABEL_15;
    }
    uint64_t v22 = 3;
  }
  [(MFMessageContentView *)self setMessageBlockingReason:v22];
  if (![(MFMessageContentView *)self allowLoadOfBlockedMessageContent])
  {
    [(MFMessageContentView *)self _loadBlockedMessageContactWarningWithRepresentation:v4];
    goto LABEL_32;
  }
LABEL_15:
  int v25 = [v16 isEncrypted];
  if ((v25 & [v16 isSigned]) != 1)
  {
    if (v25) {
      goto LABEL_17;
    }
LABEL_20:
    __int16 v30 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    char v31 = objc_msgSend(v30, "mf_blockRemoteContent");

    if (v31)
    {
      char v28 = 0;
      uint64_t v29 = 4;
    }
    else
    {
      int v32 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_lockdownModeEnabled");
      char v28 = v32 ^ 1;
      if (v32) {
        uint64_t v29 = 5;
      }
      else {
        uint64_t v29 = 0;
      }
    }
    goto LABEL_25;
  }
  __int16 v26 = [v16 smimeError];
  BOOL v27 = v26 == 0;

  if (v27) {
    goto LABEL_20;
  }
LABEL_17:
  char v28 = 0;
  uint64_t v29 = 1;
LABEL_25:
  CGRect v33 = [v16 signers];
  __int16 v34 = [v33 firstObject];
  v35 = [v34 signingCertificateTrustInfo];
  __int16 v36 = [v35 trustEvaluation];
  int v37 = [v36 requiresReevaluationWithNetworkAccess];

  if (v37) {
    [(MFMessageContentView *)self setBlockedContentTypes:[(MFMessageContentView *)self blockedContentTypes] | 2];
  }
  if ((v28 & 1) != 0
    || [(MFMessageContentView *)self allowLoadOfBlockedMessageContent]
    || [v4 showRemoteImages])
  {
    uint64_t v29 = 0;
  }
  [(MFMessageContentView *)self setMessageBlockingReason:v29];
  [(MFMessageContentView *)self _setRemoteContentToLoadWithoutProxy];
  self->_webProcessCrashCount = 0;
  self->_unint64_t backgroundWebProcessCrashCount = 0;
  lastCrashDate = self->_lastCrashDate;
  self->_lastCrashDate = 0;

  v39 = [(MFMessageContentView *)self webViewLoadingController];
  [v39 requestWebViewLoadWithContentRepresentation:v4];

  [(MFMessageContentView *)self _performQuickReplyMoveMessageBodyAnimationIfNeeded];
LABEL_32:
}

- (void)_setRemoteContentToLoadWithoutProxy
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_allRemoteURLs)
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_failedProxyURLs allKeys];
    if ([v3 count])
    {
      id v4 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = objc_msgSend(v3, "ef_map:", &__block_literal_global_1534);
        id v8 = [v7 componentsJoinedByString:@", "];

        int v10 = 138543874;
        id v11 = v6;
        __int16 v12 = 2048;
        uint64_t v13 = self;
        __int16 v14 = 2114;
        unint64_t v15 = v8;
        _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: URLs to load without proxy: %{public}@", (uint8_t *)&v10, 0x20u);
      }
    }
    uint64_t v9 = [(MFMessageContentView *)self webViewConstants];
    [v9 setObject:v3 forKeyedSubscript:@"remoteContentToLoadWithoutProxy"];
  }
}

- (void)_triggerWebViewLoad
{
  id v4 = [(MFMessageContentView *)self webViewLoadingController];
  uint64_t v3 = [(MFMessageContentView *)self contentRepresentation];
  [v4 requestWebViewLoadWithContentRepresentation:v3];
}

- (void)_triggerWebViewLoadWithoutShowingContentRepresentation
{
  id v4 = [(MFMessageContentView *)self webViewLoadingController];
  uint64_t v3 = [(MFMessageContentView *)self contentRepresentation];
  [v4 requestWebViewLoadWithoutShowingMessageWithRepresentation:v3];
}

- (void)_loadBlockedMessageContactWarningWithRepresentation:(id)a3
{
  [(MFMessageContentView *)self setBlockedContentTypes:[(MFMessageContentView *)self blockedContentTypes] | 4];
  [(MFMessageContentView *)self _triggerWebViewLoadWithoutShowingContentRepresentation];
}

- (void)_loadBlockedMessageContactWarning
{
  [(MFMessageContentView *)self setBlockedContentTypes:[(MFMessageContentView *)self blockedContentTypes] | 4];
  [(MFMessageContentView *)self _triggerWebViewLoadWithoutShowingContentRepresentation];
}

- (void)generateSnapshotImageWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = [(MFMessageContentView *)self headerView];
  id v4 = objc_alloc(MEMORY[0x1E4FB1C40]);
  [v23 frame];
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
  [v5 captureSnapshotOfView:v23 withSnapshotType:0];
  [v5 bounds];
  v35.width = v6;
  v35.height = v7;
  UIGraphicsBeginImageContextWithOptions(v35, 1, 0.0);
  id v8 = [v5 layer];
  [v8 renderInContext:UIGraphicsGetCurrentContext()];

  uint64_t v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  int v10 = [(MFMessageContentView *)self webView];
  id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  uint64_t v13 = v12;
  __int16 v14 = [(MFMessageContentView *)self contentRequest];
  unint64_t v15 = [v14 itemID];

  uint64_t v16 = +[MFMessageContentView log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CGRect v33 = v15;
    _os_log_impl(&dword_1DDF5A000, v16, OS_LOG_TYPE_DEFAULT, "Waiting for a WebKit presentation update for message - itemID=%{public}@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke;
  v24[3] = &unk_1E6D1B330;
  id v17 = v10;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  id v19 = v15;
  id v27 = v19;
  char v28 = self;
  uint64_t v31 = v13;
  id v20 = v9;
  id v29 = v20;
  id v21 = v22;
  id v30 = v21;
  [v17 _doAfterNextPresentationUpdate:v24];
}

void __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 40) bounds];
  if (v9 > v10 + v10) {
    double v9 = v10 + v10;
  }
  id v11 = +[MFMessageContentView log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DDF5A000, v11, OS_LOG_TYPE_DEFAULT, "ask webkit to take a snapshot - itemID=%{public}@", buf, 0xCu);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  [*(id *)(a1 + 56) bounds];
  double v14 = *(double *)(a1 + 80);
  double v16 = v14 * v15;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_328;
  v17[3] = &unk_1E6D1B308;
  double v21 = v14;
  id v18 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 72);
  objc_msgSend(v13, "_snapshotRect:intoImageOfWidth:completionHandler:", v17, v3, v5, v7, v9, v16);
}

void __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_328(uint64_t a1, uint64_t a2)
{
  double v3 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2 scale:0 orientation:*(double *)(a1 + 56)];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [*(id *)(a1 + 32) size];
  uint64_t v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 40) scrollView];
  [v12 contentSize];
  double v14 = v13;
  double v16 = v15;

  id v17 = objc_alloc(MEMORY[0x1E4FB17D8]);
  double v18 = v11 + v16;
  if (v11 + v16 <= v7) {
    double v19 = v14;
  }
  else {
    double v19 = v5;
  }
  if (v11 + v16 > v7) {
    double v18 = v7;
  }
  id v20 = objc_msgSend(v17, "initWithSize:", v19, v18);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_2;
  v25[3] = &unk_1E6D1B2E0;
  id v21 = v3;
  id v26 = v21;
  double v28 = v5;
  double v29 = v7;
  id v27 = *(id *)(a1 + 32);
  uint64_t v30 = v9;
  double v31 = v11;
  id v22 = [v20 imageWithActions:v25];
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v22, v23, v24);
}

uint64_t __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v3, v4);
}

- (void)_foundImageCIDAttachments:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = [v7 objectForKeyedSubscript:@"elementID"];
        uint64_t v9 = [v7 objectForKeyedSubscript:@"contentID"];
        [(MessageContentItemsHelper *)self->_relatedItemsHelper associateElementID:v8 withContentID:v9];
        double v10 = [(MFMessageContentView *)self webView];
        double v11 = [v7 objectForKeyedSubscript:@"wkIdentifier"];
        uint64_t v12 = [v10 _attachmentForIdentifier:v11];

        [(MFMessageContentView *)self _updateFileWrapperForAttachment:v12 contentID:v9];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (NSArray)contentItems
{
  return [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItems];
}

- (void)_displayDismissibleAttachmentErrorWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MFMessageContentView__displayDismissibleAttachmentErrorWithTitle_message___block_invoke;
  v11[3] = &unk_1E6D1AAF0;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  long long v14 = self;
  double v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v10 performBlock:v11];
}

void __76__MFMessageContentView__displayDismissibleAttachmentErrorWithTitle_message___block_invoke(void *a1)
{
  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a1[4] message:a1[5] preferredStyle:1];
  double v2 = (void *)MEMORY[0x1E4FB1410];
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"OK" value:&stru_1F39E2A88 table:@"Main"];
  uint64_t v5 = [v2 actionWithTitle:v4 style:0 handler:0];
  [v8 addAction:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 672));
  id v7 = [WeakRetained presentingViewControllerForMessageContentView:a1[6]];
  [v7 presentViewController:v8 animated:1 completion:0];
}

- (void)_alertMailDropDownloadIsTooLargeForCell:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v4 localizedStringForKey:@"MULTI_MAILDROP_ATTACHMENT_LARGE_TITLE" value:&stru_1F39E2A88 table:@"Main"];

    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v6 = [(id)CPGetDeviceRegionCode() isEqualToString:@"CH"];
    char v7 = v6;
    id v8 = @"MULTI_MAILDROP_ATTACHMENT_LARGE_MESSAGE";
    if (v6)
    {
      id v8 = [NSString stringWithFormat:@"%@_CH", @"MULTI_MAILDROP_ATTACHMENT_LARGE_MESSAGE"];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v9 localizedStringForKey:@"SINGLE_MAILDROP_ATTACHMENT_LARGE_TITLE" value:&stru_1F39E2A88 table:@"Main"];

    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v10 = [(id)CPGetDeviceRegionCode() isEqualToString:@"CH"];
    char v7 = v10;
    id v8 = @"SINGLE_MAILDROP_ATTACHMENT_LARGE_MESSAGE";
    if (v10)
    {
      id v8 = [NSString stringWithFormat:@"%@_CH", @"SINGLE_MAILDROP_ATTACHMENT_LARGE_MESSAGE"];
    }
  }
  double v11 = [v5 localizedStringForKey:v8 value:&stru_1F39E2A88 table:@"Main"];
  if (v7) {

  }
  [(MFMessageContentView *)self _displayDismissibleAttachmentErrorWithTitle:v12 message:v11];
}

- (void)_handleAttachmentTapMessage:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 objectForKeyedSubscript:@"element_id"];
  uint64_t v5 = [v6 objectForKeyedSubscript:@"rect"];
  MUICGRectFromNSDictionary();
  -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:");
  -[MessageContentItemsHelper attachmentWasTappedWithElementID:rect:view:](self->_relatedItemsHelper, "attachmentWasTappedWithElementID:rect:view:", v4, self);
}

- (void)_handleAttachmentSaveMessage:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(MFMessageContentView *)self contentItemForSaveMenu];

  if (!v4)
  {
    uint64_t v5 = [v18 objectForKeyedSubscript:@"element_id"];
    id v6 = [(MFMessageContentView *)self _contentItemForElement:v5];
    if (v6)
    {
      if ([(MFMessageContentView *)self sourceIsManaged])
      {
        [(MFMessageContentView *)self _saveContentItemToPicker:v6];
      }
      else
      {
        char v7 = [v18 objectForKeyedSubscript:@"rect"];
        MUICGRectFromNSDictionary();
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;

        [(MFMessageContentView *)self setContentItemForSaveMenu:v6];
        -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:", v9, v11, v13, v15);
        -[MFMessageContentView setContentItemRectForSaveMenu:](self, "setContentItemRectForSaveMenu:");
        long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
        long long v17 = [(MFMessageContentView *)self webView];
        [v17 addInteraction:v16];

        objc_msgSend(v16, "_presentMenuAtLocation:", v9, v11);
      }
    }
  }
}

- (CGRect)_adjustedRectForWebRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(MFMessageContentView *)self webView];
  double v9 = [v8 scrollView];
  [v9 zoomScale];
  CGFloat v11 = v10;

  *(void *)&long long v12 = -1;
  *((void *)&v12 + 1) = -1;
  *(_OWORD *)&v34.c = v12;
  *(_OWORD *)&v34.tCGFloat x = v12;
  *(_OWORD *)&v34.a = v12;
  CGAffineTransformMakeScale(&v34, v11, v11);
  CGAffineTransform v33 = v34;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
  CGFloat v13 = v36.origin.x;
  CGFloat v14 = v36.origin.y;
  CGFloat v15 = v36.size.width;
  CGFloat v16 = v36.size.height;
  long long v17 = [(MFMessageContentView *)self webView];
  id v18 = [v17 scrollView];
  [v18 contentOffset];
  double v20 = v19;
  id v21 = [(MFMessageContentView *)self webView];
  id v22 = [v21 scrollView];
  [v22 contentOffset];
  CGFloat v24 = -v23;
  v37.origin.CGFloat x = v13;
  v37.origin.CGFloat y = v14;
  v37.size.CGFloat width = v15;
  v37.size.CGFloat height = v16;
  CGRect v38 = CGRectOffset(v37, -v20, v24);
  CGFloat v25 = v38.origin.x;
  CGFloat v26 = v38.origin.y;
  CGFloat v27 = v38.size.width;
  CGFloat v28 = v38.size.height;

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)_expandQuoteWithCollapsedBlockquoteOffset:(double)a3 expandedOffset:(double)a4
{
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    [(MFMessageHeaderView *)self->_headerView frame];
    double v7 = a3 - CGRectGetHeight(v11);
    [(MFMessageHeaderView *)self->_headerView frame];
    double v8 = a4 - CGRectGetHeight(v12);
    id v9 = [(MFMessageContentView *)self delegate];
    objc_msgSend(v9, "messageContentView:expandQuoteAtCollapsedOffset:expandedOffset:", self, 0.0, v7, 0.0, v8);
  }
}

- (void)_seeMoreButtonTapped
{
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    id v3 = [(MFMessageContentView *)self delegate];
    objc_msgSend(v3, "messageContentView:expandQuoteAtCollapsedOffset:expandedOffset:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (void)_revealActionsButtonTapped
{
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    id v4 = [(MFMessageContentView *)self delegate];
    id v3 = [(MFConversationItemFooterView *)self->_footerView revealActionsButton];
    [v4 messageContentView:self didTapRevealActionsButton:v3];
  }
}

- (void)_undoSendButtonTapped
{
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    id v4 = [(MFMessageContentView *)self delegate];
    id v3 = [(MFConversationItemFooterView *)self->_footerView undoSendButton];
    [v4 messageContentView:self didTapUndoSendButton:v3];
  }
}

- (void)webProcessDidFailLoadingResourceWithURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    double v8 = (void *)MEMORY[0x1E4F60E00];
    id v9 = [v4 absoluteString];
    id v10 = [v8 fullyRedactedStringForString:v9];
    CGRect v11 = [(MFMessageContentView *)self contentRequest];
    CGRect v12 = [(MFMessageContentView *)self contentRequest];
    CGFloat v13 = [v12 message];
    int v14 = 138544386;
    id v15 = v7;
    __int16 v16 = 2048;
    long long v17 = self;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    double v23 = v13;
    _os_log_error_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Web process did fail to load resource URL: %{public}@ for content request: %{public}@, message: %{public}@", (uint8_t *)&v14, 0x34u);
  }
  [(MessageContentItemsHelper *)self->_relatedItemsHelper noteDidFailLoadingResourceWithURL:v4];
}

- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = _os_activity_create(&dword_1DDF5A000, "-[MFMessageContentView webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  [(MessageContentItemsHelper *)self->_relatedItemsHelper noteDidFinishDocumentLoadForURL:v7];

  id v9 = [(MFMessageContentView *)self delegate];
  id v10 = v9;
  if (*(_WORD *)&self->_flags) {
    [v9 messageContentViewDidFinishLoadingMessage:self];
  }
  [(MFMessageContentView *)self _beginObservingContentHeight];
  if ([(id)*MEMORY[0x1E4FB2608] launchedToTest]) {
    [v10 messageContentViewContentLayerFinished:self];
  }
  CGRect v11 = objc_msgSend(v6, "ef_mapSelector:", sel_absoluteString);
  CGRect v12 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
  allRemoteURLs = self->_allRemoteURLs;
  self->_allRemoteURLs = v12;

  failedProxyURLs = self->_failedProxyURLs;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__MFMessageContentView_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs___block_invoke;
  v15[3] = &unk_1E6D1B358;
  void v15[4] = self;
  [(NSMutableDictionary *)failedProxyURLs ef_removeObjectsPassingTest:v15];
  [(MFMessageContentView *)self _showLoadFailedProxyContentBannerIfNeeded];
  [v10 messageContentView:self viewedRemoteURLs:v6];

  os_activity_scope_leave(&state);
}

uint64_t __85__MFMessageContentView_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) containsObject:a2] ^ 1;
}

- (void)webProcessDidFinishLoadForURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [(MFMessageContentView *)self contentRequest];
    double v8 = objc_msgSend(v7, "ef_publicDescription");
    id v9 = [(MFMessageContentView *)self contentRequest];
    id v10 = [v9 message];
    CGRect v11 = objc_msgSend(v10, "ef_publicDescription");
    int v16 = 138544130;
    id v17 = v6;
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    double v23 = v11;
    _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Web process did finish load for content request: %{public}@ message: %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  CGRect v12 = [(MFMessageContentView *)self webView];
  CGFloat v13 = [v12 _dataDetectionResults];

  int v14 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  id v15 = [(MFMessageContentView *)self ef_onScheduler:v14];
  [v15 _processDataDetectionMetricsFromResults:v13];
}

- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(MFMessageContentView *)self setBlockedContentTypes:[(MFMessageContentView *)self blockedContentTypes] | 1];
  id v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [(MFMessageContentView *)self contentRequest];
    double v8 = objc_msgSend(v7, "ef_publicDescription");
    id v9 = [(MFMessageContentView *)self contentRequest];
    id v10 = [v9 message];
    CGRect v11 = objc_msgSend(v10, "ef_publicDescription");
    int v12 = 138544130;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Web process did block loading resource for content request: %{public}@ message: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    CGRect v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [(MFMessageContentView *)self contentRequest];
    __int16 v14 = objc_msgSend(v13, "ef_publicDescription");
    id v15 = [(MFMessageContentView *)self contentRequest];
    __int16 v16 = [v15 message];
    id v17 = objc_msgSend(v16, "ef_publicDescription");
    int v18 = 138544130;
    id v19 = v12;
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2114;
    double v23 = v14;
    __int16 v24 = 2114;
    CGFloat v25 = v17;
    _os_log_error_impl(&dword_1DDF5A000, v7, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Web process did fail to load content request: %{public}@ message: %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  double v8 = [v6 absoluteString];
  allRemoteURLs = self->_allRemoteURLs;
  if (!allRemoteURLs || [(NSSet *)allRemoteURLs containsObject:v8])
  {
    id v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)self->_failedProxyURLs setObject:v10 forKeyedSubscript:v8];
  }
  [(MFMessageContentView *)self _showLoadFailedProxyContentBannerIfNeeded];
}

- (void)_showLoadFailedProxyContentBannerIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(MFMessageContentView *)self showsBanners]
    && self->_allRemoteURLs
    && [(NSMutableDictionary *)self->_failedProxyURLs count]
    && !self->_loadFailedProxyContentBanner)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 2;
    failedProxyURLs = self->_failedProxyURLs;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__MFMessageContentView__showLoadFailedProxyContentBannerIfNeeded__block_invoke;
    v15[3] = &unk_1E6D1B380;
    void v15[4] = &v16;
    [(NSMutableDictionary *)failedProxyURLs enumerateKeysAndObjectsUsingBlock:v15];
    if (v17[3] != 2
      || (objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults"),
          id v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = [v4 BOOLForKey:*MEMORY[0x1E4F60168]],
          v4,
          (v5 & 1) == 0))
    {
      id v6 = [MFLoadFailedProxyContentBannerView alloc];
      id v7 = -[MFLoadFailedProxyContentBannerView initWithFrame:failureReason:](v6, "initWithFrame:failureReason:", v17[3], *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      loadFailedProxyContentBanner = self->_loadFailedProxyContentBanner;
      self->_loadFailedProxyContentBanner = v7;

      [(MFLoadFailedProxyContentBannerView *)self->_loadFailedProxyContentBanner setDelegate:self];
      [(MFMessageHeaderView *)self->_headerView insertHeaderBlock:self->_loadFailedProxyContentBanner atIndex:0 animated:1];
      id v9 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [(NSMutableDictionary *)self->_failedProxyURLs allKeys];
        id v13 = objc_msgSend(v12, "ef_map:", &__block_literal_global_1534);
        __int16 v14 = [v13 componentsJoinedByString:@", "];

        *(_DWORD *)buf = 138543874;
        id v21 = v11;
        __int16 v22 = 2048;
        double v23 = self;
        __int16 v24 = 2114;
        CGFloat v25 = v14;
        _os_log_impl(&dword_1DDF5A000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Displaying failed proxy load banner due to: %{public}@", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __65__MFMessageContentView__showLoadFailedProxyContentBannerIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v6 = [v9 integerValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v6 < v8)
  {
    *(void *)(v7 + 24) = v6;
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (!v8) {
    *a4 = 1;
  }
}

- (void)setBlockedContentTypes:(unint64_t)a3
{
  if (self->_blockedContentTypes != a3)
  {
    self->_unint64_t blockedContentTypes = a3;
    if ([(MFMessageContentView *)self showsBanners])
    {
      if (self->_blockedContentTypes)
      {
        loadImagesHeaderBlock = self->_loadImagesHeaderBlock;
        if (loadImagesHeaderBlock)
        {
          -[MFLoadBlockedContentBannerView setBlockedContentTypes:](loadImagesHeaderBlock, "setBlockedContentTypes:");
        }
        else
        {
          char v5 = [MFLoadBlockedContentBannerView alloc];
          unint64_t blockedContentTypes = self->_blockedContentTypes;
          int64_t v7 = [(MFMessageContentView *)self messageBlockingReason];
          uint64_t v8 = -[MFLoadBlockedContentBannerView initWithFrame:blockedContentTypes:blockingReason:](v5, "initWithFrame:blockedContentTypes:blockingReason:", blockedContentTypes, v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          id v9 = self->_loadImagesHeaderBlock;
          self->_loadImagesHeaderBlock = v8;

          [(MFLoadBlockedContentBannerView *)self->_loadImagesHeaderBlock setDelegate:self];
          headerView = self->_headerView;
          id v11 = self->_loadImagesHeaderBlock;
          [(MFMessageHeaderView *)headerView insertHeaderBlock:v11 atIndex:0 animated:1];
        }
      }
      else
      {
        [(MFMessageContentView *)self _clearLoadRemoteImagesBannerAnimated:1];
      }
    }
  }
}

- (void)_configureTrustEvaluationsForSignersInSecurityInformation:(id)a3
{
  id v4 = a3;
  char v5 = [v4 signers];
  uint64_t v6 = [v5 firstObject];

  int64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v8 = objc_msgSend(v7, "mf_blockRemoteContent");

  id v9 = [(MFMessageContentView *)self trustConfigurationScheduler];
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 3;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke;
  v13[3] = &unk_1E6D1AE58;
  id v11 = v6;
  uint64_t v17 = v10;
  id v14 = v11;
  id v15 = self;
  id v12 = v4;
  id v16 = v12;
  [v9 performBlock:v13];
}

void __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) evaluateTrustsWithOptions:*(void *)(a1 + 56)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2;
  v4[3] = &unk_1E6D1AB90;
  double v2 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = v2;
  id v3 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v4[0], 3221225472, __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2, &unk_1E6D1AB90, v5);
  [v3 performBlock:v4];
}

void __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) atomManager];
  [v2 updateWithSecurityInformation:*(void *)(a1 + 40)];
}

- (void)webProcessDidCreateBrowserContextControllerLoadDelegate
{
  id v2 = [(MFMessageContentView *)self webViewLoadingController];
  [v2 webProcessBrowserContextControllerDidBecomeAvailable];
}

- (void)_processDataDetectionMetricsFromResults:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __64__MFMessageContentView__processDataDetectionMetricsFromResults___block_invoke;
  id v13 = &unk_1E6D1B3A8;
  id v6 = v4;
  id v14 = v6;
  id v7 = v5;
  id v15 = v7;
  unint64_t v8 = objc_msgSend(v3, "ef_countObjectsPassingTest:", &v10);
  if (v8 >= 5) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = v8;
  }
  for (; v9; --v9)
    objc_msgSend(MEMORY[0x1E4F5DAB8], "shownViaDataDetectorsLinkInApp:", 3, v10, v11, v12, v13, v14);
}

BOOL __64__MFMessageContentView__processDataDetectionMetricsFromResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 coreResult];
  if (DDResultGetCategory() == 4
    && ([v2 coreResult], DDResultHasProperties()))
  {
    [v2 coreResult];
    BOOL v3 = DDResultIsPastDate() == 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  if (objc_msgSend(a4, "isUserInitiated", a3)) {
    return 0;
  }
  else {
    return 2;
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = [v8 request];
  uint64_t v11 = [v10 URL];

  id v12 = [v11 scheme];
  id v13 = [(MFMessageContentView *)self contentRepresentationIfAvailable];
  id v14 = [v13 contentURL];

  id v15 = [v14 scheme];
  if ([v12 isEqualToString:v15])
  {
    id v16 = [v11 path];
    uint64_t v17 = [v14 path];
    int v18 = [v16 hasPrefix:v17];
  }
  else
  {
    int v18 = 0;
  }

  uint64_t v19 = [v8 targetFrame];
  int v20 = [v19 isMainFrame];

  int v21 = [&unk_1F39EEEB0 containsObject:v12];
  if (v18)
  {
    __int16 v22 = [v11 fragment];
    if (v22)
    {
      double v23 = [(MFMessageContentView *)self webView];
      v74[0] = v22;
      __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
      CGFloat v25 = objc_msgSend(v23, "mcv_dictionaryFromJavaScriptMethod:arguments:", @"rectForAnchor", v24);

      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __80__MFMessageContentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v67[3] = &unk_1E6D1B3D0;
      void v67[4] = self;
      [v25 addSuccessBlock:v67];
    }
    else if ([v8 navigationType] == -1 || objc_msgSend(v8, "navigationType") == 3)
    {
      uint64_t v26 = 1;
      goto LABEL_16;
    }
    uint64_t v26 = 0;
LABEL_16:
    [(NSMutableSet *)self->_inFlightURLs removeAllObjects];
    v9[2](v9, v26);

    goto LABEL_17;
  }
  int v27 = v21;
  if (![(NSMutableSet *)self->_inFlightURLs containsObject:v11])
  {
    if (v27)
    {
      v9[2](v9, 0);
      if (!v20) {
        goto LABEL_17;
      }
      CGFloat v28 = [MEMORY[0x1E4F5F248] sharedController];
      double v29 = [v66 _dataDetectionResults];
      double v30 = [(MFMessageContentView *)self _dataDetectionContextForWebView:v66];
      double v31 = [v28 defaultActionForURL:v11 results:v29 context:v30];

      [v28 performAction:v31 inView:v66 interactionDelegate:0];
LABEL_22:

      goto LABEL_17;
    }
    if (v20 && [v11 isFaceTimeMultiwayURL])
    {
      v9[2](v9, 0);
      double v32 = (void *)[objc_alloc(MEMORY[0x1E4FADBE8]) initWithURL:v11];
      CGFloat v28 = v32;
      if (v32)
      {
        [v32 setWantsStagingArea:1];
        CGAffineTransform v33 = [MEMORY[0x1E4FADA90] sharedInstance];
        [v33 launchAppForJoinRequest:v28];
      }
      goto LABEL_22;
    }
    CGAffineTransform v34 = v9[2];
    if (self->_showingError)
    {
      v34(v9, 1);
      goto LABEL_17;
    }
    v34(v9, 0);
    CGRect v35 = [(MFMessageContentView *)self delegate];
    CGRect v36 = [(MFMessageContentView *)self contentRepresentationIfAvailable];

    if (v36)
    {
      CGRect v37 = [(MFMessageContentView *)self contentRequest];
      CGRect v38 = [v37 message];
      [v35 messageContentView:self clickedLinkInMessage:v38 scheme:v12];
    }
    if ([v12 isEqualToString:@"file"])
    {
      v39 = [v11 path];
      int v40 = [v39 containsString:@"Library/Mail"];

      if (v40)
      {
        id v41 = EMLogCategoryMessageLoading();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          id v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          objc_claimAutoreleasedReturnValue();
          -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:]();
        }
      }
      else
      {
        id v41 = EMLogCategoryMessageLoading();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          __int16 v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          objc_claimAutoreleasedReturnValue();
          -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:]();
        }
      }
    }
    else if ([v12 isEqualToString:@"prefs"])
    {
      id v41 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        objc_claimAutoreleasedReturnValue();
        -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:]();
      }
    }
    else
    {
      __int16 v44 = [v8 targetFrame];
      if (v44) {
        int v45 = v20;
      }
      else {
        int v45 = 1;
      }

      if (v45 == 1)
      {
        if ([v12 isEqualToString:*MEMORY[0x1E4F5FD88]])
        {
          __int16 v46 = [(MFMessageContentView *)self contentRequest];
          __int16 v47 = [v46 resultIfAvailable];
          __int16 v48 = [v47 requestedHeaders];
          v65 = [v48 headersForKey:*MEMORY[0x1E4F606B0]];

          double v49 = [MEMORY[0x1E4F29088] componentsWithURL:v11 resolvingAgainstBaseURL:1];
          uint64_t v50 = v65;
          if ([v65 count])
          {
            double v63 = v49;
            __int16 v62 = [v65 firstObject];
            id v64 = [MEMORY[0x1E4F608F8] tagValueListFromString:v62 error:0];
            id v51 = objc_alloc(MEMORY[0x1E4F1CA48]);
            v52 = [v49 queryItems];
            v61 = (void *)[v51 initWithArray:v52 copyItems:1];

            id v53 = objc_alloc(MEMORY[0x1E4F290C8]);
            __int16 v54 = objc_msgSend(MEMORY[0x1E4F1CB10], "em_mailToFromQueryItemKey");
            v55 = [v64 objectForKeyedSubscript:*MEMORY[0x1E4F5FD00]];
            __int16 v56 = (void *)[v53 initWithName:v54 value:v55];

            double v49 = v63;
            [v61 addObject:v56];
            [v63 setQueryItems:v61];

            uint64_t v50 = v65;
          }
          uint64_t v57 = [v49 URL];

          uint64_t v11 = (void *)v57;
        }
        [v35 messageContentView:self openPossibleStoreURL:v11];
        goto LABEL_48;
      }
      id v41 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        __int16 v60 = NSStringFromClass(v59);
        *(_DWORD *)buf = 138543874;
        v69 = v60;
        __int16 v70 = 2048;
        v71 = self;
        __int16 v72 = 2112;
        v73 = v11;
        _os_log_error_impl(&dword_1DDF5A000, v41, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Blocking navigation action for request whose target frame is not the main frame (iframe, probably): %@", buf, 0x20u);
      }
    }

LABEL_48:
    goto LABEL_17;
  }
  v9[2](v9, 0);
  [(NSMutableSet *)self->_inFlightURLs removeObject:v11];
LABEL_17:
}

void __80__MFMessageContentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v14 = v3;
    MUICGRectFromNSDictionary();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [*(id *)(a1 + 32) delegate];
    v16.origin.CGFloat x = v5;
    v16.origin.CGFloat y = v7;
    v16.size.CGFloat width = v9;
    v16.size.CGFloat height = v11;
    if (!CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28]) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "_adjustedRectForWebRect:", v5, v7, v9, v11);
      objc_msgSend(v12, "messageContentView:scrollToRect:", v13);
    }

    id v3 = v14;
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((v4 & 0x40) != 0)
  {
    [(MFMessageContentView *)self initialContentOffset];
    if (v7 > 0.0 || ([(MFMessageContentView *)self initialContentOffset], v8 > 0.0))
    {
      double v9 = [(MFMessageContentView *)self scrollView];
      [(MFMessageContentView *)self initialContentOffset];
      objc_msgSend(v9, "setContentOffset:");
    }
    self->_suppressContentSizeNotificationsUntilFirstPaint = 0;
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      double v10 = [(MFMessageContentView *)self delegate];
      [v10 messageContentViewDidFinishFirstPaint:self];

      double v11 = [v6 scrollView];
      [v11 contentSize];
      -[MFMessageContentView _notifyDelegateScrollViewSizeChanged:](self, "_notifyDelegateScrollViewSizeChanged:");

      id v12 = [(MFMessageContentView *)self scrollView];
      [v12 contentOffset];
      double v14 = v13;
      id v15 = [(MFMessageContentView *)self scrollView];
      [v15 contentInset];
      double v17 = v16;
      int v18 = [v6 scrollView];
      objc_msgSend(v18, "setContentOffset:", v14, -v17);

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke;
      v35[3] = &unk_1E6D1AB40;
      v35[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v35 animations:0.2];
    }
    uint64_t v19 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = (objc_class *)objc_opt_class();
      int v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543618;
      CGRect v37 = v21;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1DDF5A000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: rendering progress did first paint, removing loading indicator", buf, 0x16u);
    }
    [(MFMessageContentView *)self setLoadingIndicatorVisible:0];
    [(MFMessageContentView *)self _performQuickReplySnapshotFadeOutAnimationIfNecessary];
    if ([(MFMessageContentView *)self initiallyZoomsToShowAllContent])
    {
      __int16 v22 = [(MFMessageContentView *)self scrollView];
      [v22 minimumZoomScale];
      double v24 = v23;
      CGFloat v25 = [(MFMessageContentView *)self scrollView];
      [v25 setZoomScale:v24];
    }
    uint64_t v26 = [(MFMessageContentView *)self previousContentSnapshot];
    BOOL v27 = v26 == 0;

    if (!v27)
    {
      CGFloat v28 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        double v29 = (objc_class *)objc_opt_class();
        double v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138543618;
        CGRect v37 = v30;
        __int16 v38 = 2048;
        v39 = self;
        _os_log_impl(&dword_1DDF5A000, v28, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: removing previous content snapshot", buf, 0x16u);
      }
      v33[4] = self;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_419;
      v34[3] = &unk_1E6D1AB40;
      v34[4] = self;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_2;
      v33[3] = &unk_1E6D1B3F8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v34 animations:v33 completion:0.100000001];
    }
    double v31 = [(MFMessageContentView *)self contentRepresentationIfAvailable];
    BOOL v32 = v31 != 0;

    [(MFMessageContentView *)self _logRequestFinishWithSuccess:v32];
    [(MFMessageContentView *)self setHasVisibleContent:1];
  }
}

void __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) footerView];
  [v1 setAlpha:1.0];
}

uint64_t __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_419(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
}

uint64_t __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreviousContentSnapshot:0];
}

- (void)setHasVisibleContent:(BOOL)a3
{
  if (self->_hasVisibleContent != a3)
  {
    self->_hasVisibleContent = a3;
    if (a3 && (*(_WORD *)&self->_flags & 4) != 0)
    {
      id v5 = [(MFMessageContentView *)self delegate];
      char v4 = [(MFMessageContentView *)self contentRepresentationIfAvailable];
      [v5 messageContentViewDidDisplayContent:self success:v4 != 0];
    }
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:MFMessageContentViewDidAppear object:self];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  double v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    double v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = objc_msgSend(v6, "ef_publicDescription");
    int v11 = 138543874;
    id v12 = v9;
    __int16 v13 = 2048;
    double v14 = self;
    __int16 v15 = 2114;
    double v16 = v10;
    _os_log_error_impl(&dword_1DDF5A000, v7, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Message Content View did fail navigation: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)_webViewWebProcessDidBecomeUnresponsive:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    double v10 = NSStringFromSelector(a2);
    int v11 = 138544386;
    id v12 = v9;
    __int16 v13 = 2048;
    double v14 = self;
    __int16 v15 = 2114;
    double v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = [v5 _webProcessIdentifier];
    _os_log_error_impl(&dword_1DDF5A000, v6, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d)", (uint8_t *)&v11, 0x30u);
  }
  double v7 = [(MFMessageContentView *)self webView];
  [v7 _killWebContentProcess];
}

- (BOOL)_lastCrashDateExceedsThreshhold
{
  lastCrashDate = self->_lastCrashDate;
  if (lastCrashDate)
  {
    [(NSDate *)lastCrashDate timeIntervalSinceNow];
    LOBYTE(lastCrashDate) = v3 > 300.0;
  }
  return (char)lastCrashDate;
}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(MFMessageContentView *)self _lastCrashDateExceedsThreshhold])
  {
    double v8 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      int v11 = NSStringFromSelector(a2);
      unint64_t webProcessCrashCount = self->_webProcessCrashCount;
      unint64_t backgroundWebProcessCrashCount = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138544386;
      id v42 = v10;
      __int16 v43 = 2048;
      __int16 v44 = self;
      __int16 v45 = 2114;
      __int16 v46 = v11;
      __int16 v47 = 2048;
      unint64_t v48 = webProcessCrashCount;
      __int16 v49 = 2048;
      *(void *)uint64_t v50 = backgroundWebProcessCrashCount;
      _os_log_impl(&dword_1DDF5A000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ resetting crash count: %ld and background crash count: %ld to 0 due to exceeded time threshold", buf, 0x34u);
    }
    self->_unint64_t webProcessCrashCount = 0;
    self->_unint64_t backgroundWebProcessCrashCount = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke;
  aBlock[3] = &unk_1E6D1B040;
  void aBlock[4] = self;
  aBlock[5] = a4;
  double v14 = (void (**)(void))_Block_copy(aBlock);
  __int16 v15 = [(MFMessageContentView *)self window];
  double v16 = [v15 windowScene];
  uint64_t v17 = [v16 activationState];

  if (v17 == 2)
  {
    ++self->_backgroundWebProcessCrashCount;
    id v18 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = NSStringFromSelector(a2);
      int v27 = [v7 _webProcessIdentifier];
      unint64_t v28 = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138544898;
      id v42 = v25;
      __int16 v43 = 2048;
      __int16 v44 = self;
      __int16 v45 = 2114;
      __int16 v46 = v26;
      __int16 v47 = 2112;
      unint64_t v48 = (unint64_t)v7;
      __int16 v49 = 1024;
      *(_DWORD *)uint64_t v50 = v27;
      *(_WORD *)&v50[4] = 2048;
      *(void *)&v50[6] = a4;
      __int16 v51 = 2048;
      unint64_t v52 = v28;
      _os_log_error_impl(&dword_1DDF5A000, v18, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d; reason: %ld; background crash count: %ld)",
        buf,
        0x44u);
    }
  }
  else
  {
    [(NSMutableSet *)self->_inFlightURLs removeAllObjects];
    ++self->_webProcessCrashCount;
    __int16 v19 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      double v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      CGAffineTransform v33 = NSStringFromSelector(a2);
      int v30 = [v7 _webProcessIdentifier];
      unint64_t v31 = self->_webProcessCrashCount;
      lastCrashDate = self->_lastCrashDate;
      *(_DWORD *)buf = 138545410;
      id v42 = v34;
      __int16 v43 = 2048;
      __int16 v44 = self;
      __int16 v45 = 2114;
      __int16 v46 = v33;
      __int16 v47 = 2112;
      unint64_t v48 = (unint64_t)v7;
      __int16 v49 = 1024;
      *(_DWORD *)uint64_t v50 = v30;
      *(_WORD *)&v50[4] = 2048;
      *(void *)&v50[6] = a4;
      __int16 v51 = 2048;
      unint64_t v52 = v31;
      __int16 v53 = 2048;
      uint64_t v54 = v17;
      __int16 v55 = 2114;
      __int16 v56 = lastCrashDate;
      _os_log_error_impl(&dword_1DDF5A000, v19, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d; reason: %ld; crash count: %ld; activation state: %ld lastCrashDate:%{public}@)",
        buf,
        0x58u);
    }
    unint64_t v20 = self->_webProcessCrashCount;
    if (v20 > 2)
    {
      if (v20 == 3)
      {
        uint64_t v21 = [(MFMessageContentView *)self webView];
        __int16 v22 = [v21 URL];

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_2;
        v35[3] = &unk_1E6D1AE58;
        v35[4] = self;
        SEL v38 = a2;
        id v36 = v7;
        id v37 = v22;
        id v23 = v22;
        dispatch_async(MEMORY[0x1E4F14428], v35);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_420;
      block[3] = &unk_1E6D1AB40;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v14[2](v14);
}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke(uint64_t a1)
{
  id v2 = *(_WORD **)(a1 + 32);
  if ((v2[324] & 0x800) != 0)
  {
    double v3 = [v2 delegate];
    [v3 messageContentView:*(void *)(a1 + 32) webViewDidTerminateWithReason:*(void *)(a1 + 40)];
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 640);
  *(void *)(v5 + 640) = v4;
}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_420(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webViewLoadingController];
  [v1 slapWebView];
}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    __int16 v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_error_impl(&dword_1DDF5A000, v2, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ setting error message to web view %@", buf, 0x2Au);
  }
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"MESSAGE_CAUSED_PROBLEM_REPEATEDLY" value:&stru_1F39E2A88 table:@"Main"];

  uint64_t v5 = [*(id *)(a1 + 32) webView];
  id v6 = NSString;
  id v7 = objc_msgSend(v4, "mf_stringByEscapingHTMLCodes");
  double v8 = [v6 localizedStringWithFormat:@"<html dir=auto><body><i><font color=#888>%@</font></i></body></html>", v7];
  [v5 _loadAlternateHTMLString:v8 baseURL:0 forUnreachableURL:*(void *)(a1 + 48)];
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained contentItemHandlingDelegateForMessageContentView:self];
    [v6 hideMenuForSelectedContentRepresentation];
  }
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [a6 objectForKey:*MEMORY[0x1E4F350B0]];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    [(MessageContentItemsHelper *)self->_relatedItemsHelper updateDragItemProvider:v8 forElementID:v10];
    uint64_t v11 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForElementID:v10];
    if ([(MessageContentItemsHelper *)self->_relatedItemsHelper displayStateForContentItem:v11] == 1)
    {
      v15[0] = v8;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v14 = v8;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  }

  return v12;
}

- (id)_webView:(id)a3 willUpdateDropProposalToProposal:(id)a4 forSession:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  return v5;
}

- (BOOL)_objectContainsNonEmptyString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
    [v5 addCharactersInString:@"\uFFFC"];
    id v6 = [v4 string];
    id v7 = [v5 invertedSet];
    BOOL v8 = [v6 rangeOfCharacterFromSet:v7] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_attachmentPreviewsFromData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:0];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  BOOL v8 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F284E8]];

  return v8;
}

- (id)_webView:(id)a3 previewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString alloc];
  id v9 = [v7 itemProvider];
  double v10 = [v9 teamData];
  uint64_t v11 = (void *)[v8 initWithData:v10 encoding:4];

  id v12 = [(MFMessageContentView *)self attachmentDragPreviews];
  uint64_t v13 = [v12 objectForKeyedSubscript:v11];

  id v14 = [v6 scrollView];
  [v14 contentInset];
  double v16 = v15;
  [(MFMessageHeaderView *)self->_headerView frame];
  double MaxY = CGRectGetMaxY(v21);

  __int16 v18 = objc_msgSend(v13, "targetedDragPreviewInContainer:centerOffset:", v6, v16, MaxY);

  return v18;
}

- (id)_webView:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t v5 = -[MFMessageContentView _webView:previewItem:](self, "_webView:previewItem:", a3, a4, a5);
  return v5;
}

- (id)_webView:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v5 = -[MFMessageContentView _webView:previewItem:](self, "_webView:previewItem:", a3, a4, a5);
  return v5;
}

- (id)_dataDetectionContextForWebView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  uint64_t v5 = [(MFMessageContentView *)self contentRequest];
  id v6 = [v5 messageFuture];
  id v7 = [v6 resultIfAvailable];

  uint64_t v8 = [(MFMessageContentView *)self contentRepresentationIfAvailable];
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    double v10 = [v7 subject];
    uint64_t v11 = [v10 subjectWithoutPrefix];

    if ([v11 length]) {
      [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F5F250]];
    }
    id v12 = [v7 date];
    [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F5F258]];

    uint64_t v13 = [v9 publicMessageURL];
    if (v13) {
      [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F5F260]];
    }
  }
  return v4;
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  if ([(MFMessageContentView *)self sourceIsManaged]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [(MFMessageContentView *)self _updateFileWrapperForAttachment:v10 contentID:v7];
  uint64_t v8 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForContentID:v7];
  if (v8)
  {
    id v9 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForElementID:v7];

    if (!v9) {
      [(MessageContentItemsHelper *)self->_relatedItemsHelper associateElementID:v7 withContentID:v7];
    }
  }
}

- (void)_updateFileWrapperForAttachment:(id)a3 contentID:(id)a4
{
  id v12 = a3;
  id v6 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForContentID:a4];
  id v7 = v6;
  if (v6)
  {
    relatedItemsHelper = self->_relatedItemsHelper;
    id v9 = [v6 contentID];
    id v10 = [v12 uniqueIdentifier];
    [(MessageContentItemsHelper *)relatedItemsHelper associateElementID:v9 withWKAttachmentID:v10];

    id v11 = [(MessageContentItemsHelper *)self->_relatedItemsHelper startDownloadForContentItem:v7 userInitiated:0];
  }
}

- (BOOL)mayShareToUnmanaged
{
  if (![(MFMessageContentView *)self sourceIsManaged]) {
    return 1;
  }
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 mayOpenFromManagedToUnmanaged];

  return v3;
}

- (BOOL)_allAttachmentsArePhotosOrVideos
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItems];
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v10 = 0;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      uint64_t v6 = *MEMORY[0x1E4F44448];
      uint64_t v7 = *MEMORY[0x1E4F44400];
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12);
          if (([v9 conformsToType:v6] & 1) == 0 && (objc_msgSend(v9, "conformsToType:", v7) & 1) == 0)
          {

            BOOL v10 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_14:
  }
  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  uint64_t v5 = [(MFMessageContentView *)self contentItemForSaveMenu];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1678];
    uint64_t v7 = [(MFMessageContentView *)self contentItemForSaveMenu];
    uint64_t v8 = [v7 contentID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v11[3] = &unk_1E6D1B498;
    void v11[4] = self;
    id v9 = [v6 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v11];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

id __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v16[3] = &unk_1E6D1B470;
  v16[4] = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB16B8] elementWithUncachedProvider:v16];
  v17[0] = v2;
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v4 = _EFLocalizedString();
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35030]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
  v15[3] = &unk_1E6D1A968;
  void v15[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:@"com.apple.documentmanager.downloads" handler:v15];
  v17[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = _EFLocalizedString();
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F350A0]];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
  v14[3] = &unk_1E6D1A968;
  v14[4] = *(void *)(a1 + 32);
  BOOL v10 = [v7 actionWithTitle:v8 image:v9 identifier:@"com.apple.documentmanager.browse" handler:v14];
  v17[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  long long v12 = [MEMORY[0x1E4FB1970] menuWithChildren:v11];

  return v12;
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v9[3] = &unk_1E6D1B420;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v8 = v3;
  id v12 = v8;
  [v5 performBlock:v9];
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = objc_msgSend(v2, "_doc_destinationLocationExists:", 2);

  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v14[3] = &unk_1E6D1B420;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    v15[0] = v4;
    v15[1] = v5;
    id v16 = v6;
    uint64_t v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v7 performBlock:v14];
    id v8 = (id *)v15;

    id v9 = v16;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
    v11[3] = &unk_1E6D1B448;
    id v13 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 32);
    id v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v10 performBlock:v11];
    id v8 = &v13;

    id v9 = v12;
  }
}

uint64_t __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(void *a1)
{
  id v2 = (void *)a1[4];
  int v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = _EFLocalizedString();
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35028]];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
  v8[3] = &unk_1E6D1A968;
  v8[4] = a1[5];
  id v6 = [v3 actionWithTitle:v4 image:v5 identifier:@"com.apple.documentmanager.cats" handler:v8];
  [v2 addObject:v6];

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[52];
  id v3 = [v1 contentItemForSaveMenu];
  objc_msgSend(v2, "saveContentItem:toDestination:");
}

uint64_t __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[52];
  id v3 = [v1 contentItemForSaveMenu];
  objc_msgSend(v2, "saveContentItem:toDestination:");
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 contentItemForSaveMenu];
  objc_msgSend(v1, "_saveContentItemToPicker:");
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  id v9 = [(MFMessageContentView *)self contentItemForSaveMenu];
  id v10 = [v9 contentID];

  if (v8 == v10)
  {
    [(MFMessageContentView *)self setContentItemForSaveMenu:0];
    -[MFMessageContentView setContentItemRectForSaveMenu:](self, "setContentItemRectForSaveMenu:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v11 = [(MFMessageContentView *)self webView];
    [v11 removeInteraction:v12];
  }
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  [(MFMessageContentView *)self contentItemRectForSaveMenu];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
  uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
  [v10 setBackgroundColor:v11];

  UIRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  id v16 = objc_alloc(MEMORY[0x1E4FB1B38]);
  uint64_t v17 = [(MFMessageContentView *)self webView];
  __int16 v18 = objc_msgSend(v16, "initWithContainer:center:", v17, v13, v15 + 5.0);

  id v19 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10 parameters:v19 target:v18];

  return v20;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "identifier", a3);
  double v6 = [(MFMessageContentView *)self contentItemForSaveMenu];
  double v7 = [v6 contentID];

  if (v5 == v7)
  {
    double v8 = [MEMORY[0x1E4FB2080] defaultStyle];
    [v8 setPreferredLayout:3];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (void)_saveContentItemToPicker:(id)a3
{
  id v4 = [(MessageContentItemsHelper *)self->_relatedItemsHelper futureForContentItem:a3 download:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MFMessageContentView__saveContentItemToPicker___block_invoke;
  v6[3] = &unk_1E6D1ACB8;
  objc_copyWeak(&v7, &location);
  [v4 onScheduler:v5 addSuccessBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__MFMessageContentView__saveContentItemToPicker___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc(MEMORY[0x1E4FB16F0]);
  double v6 = [v3 contentURL];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  double v8 = (void *)[v5 initForExportingURLs:v7 asCopy:1];

  objc_msgSend(v8, "_setIsContentManaged:", objc_msgSend(WeakRetained, "sourceIsManaged"));
  [WeakRetained presentViewController:v8];
}

- (id)_contextMenuConfigurationForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ID];
  double v6 = [(MFMessageContentView *)self _contentItemForElement:v5];

  if (v6)
  {
    int64_t v7 = [(MessageContentItemsHelper *)self->_relatedItemsHelper displayStateForContentItem:v6];
    if (v7 == 1)
    {
      double v8 = [(MessageContentItemsHelper *)self->_relatedItemsHelper futureForContentItem:v6 download:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v10 = [WeakRetained contentItemHandlingDelegateForMessageContentView:self];

      uint64_t v11 = [v6 type];
      double v12 = [v8 result];
      double v13 = [v12 contentURL];

      if (v13) {
        char v14 = [(objc_class *)getQLPreviewControllerClass() canPreviewItem:v13];
      }
      else {
        char v14 = 0;
      }
      double v24 = (void *)MEMORY[0x1E4FB1678];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_3;
      v34[3] = &unk_1E6D1B4E8;
      id v35 = v6;
      char v39 = v14;
      id v36 = v11;
      id v23 = v11;
      id v37 = v13;
      SEL v38 = self;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_4;
      v25[3] = &unk_1E6D1B5A8;
      id v26 = v35;
      int v27 = self;
      char v33 = v14;
      uint64_t v22 = v13;
      id v17 = v37;
      id v28 = v17;
      id v18 = v10;
      id v29 = v18;
      id v19 = v36;
      id v30 = v19;
      id v20 = v8;
      id v31 = v20;
      id v32 = v4;
      double v15 = objc_msgSend(v24, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v34, v25, v22, v23);
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4FB1678];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke;
      v40[3] = &unk_1E6D1B4C0;
      int64_t v42 = v7;
      void v40[4] = self;
      id v41 = v6;
      double v15 = [v16 configurationWithIdentifier:0 previewProvider:0 actionProvider:v40];
    }
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 2)
  {
    id v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"DOWNLOAD" value:&stru_1F39E2A88 table:@"Main"];
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35090]];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_2;
    id v16 = &unk_1E6D1A990;
    double v6 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = v6;
    int64_t v7 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:&v13];

    double v8 = (void *)MEMORY[0x1E4FB1970];
    double v9 = objc_msgSend(*(id *)(a1 + 40), "displayName", v13, v14, v15, v16, v17);
    v19[0] = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v11 = [v8 menuWithTitle:v9 children:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 416) startDownloadForContentItem:*(void *)(a1 + 40) userInitiated:1];
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) exchangeEventUID])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F25550]);
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F256C8]), "initWithEventUID:eventStore:", objc_msgSend(*(id *)(a1 + 32), "exchangeEventUID"), v2);
    id v4 = [v3 viewController];
  }
  else if (*(unsigned char *)(a1 + 64) || [*(id *)(a1 + 32) exchangeEventUID])
  {
    id v5 = [*(id *)(a1 + 40) preferredMIMEType];
    double v6 = (void *)[objc_alloc(getQLItemClass()) initWithURL:*(void *)(a1 + 48) MIMEType:v5];
    id v7 = objc_alloc(getQLPreviewControllerClass());
    v10[0] = v6;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v4 = (void *)[v7 initWithPreviewItems:v8];

    objc_msgSend(v4, "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 56), "sourceIsManaged"));
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v57 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 32) exchangeEventUID])
  {
    id v4 = 0;
    goto LABEL_18;
  }
  uint64_t v54 = v3;
  id v5 = [*(id *)(a1 + 40) contentRequest];
  double v6 = [v5 message];

  __int16 v53 = v6;
  id v7 = [*(id *)(a1 + 40) dataSource];
  __int16 v56 = [v7 messageSourceMailboxObjectIDForMessageContentView:*(void *)(a1 + 40)];

  double v8 = [*(id *)(a1 + 40) contactStore];
  __int16 v55 = [v6 senderDisplayNameUsingContactStore:v8];

  uint64_t v9 = [v6 shouldShowReplyAll];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [v6 objectID];
    double v12 = [v6 subject];
    uint64_t v13 = [v12 subjectString];
    uint64_t v14 = [*(id *)(a1 + 40) webView];
    double v15 = *(void **)(a1 + 56);
    id v16 = [v15 assetViewerManager];
    LOBYTE(v51) = 0;
    uint64_t v17 = +[MessageAttachmentActionGenerator quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:](MessageAttachmentActionGenerator, "quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:", v10, v11, v56, v13, v55, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v14, v51, v15, v16);
    [v57 addObject:v17];

    double v6 = v53;
  }
  id v18 = [*(id *)(a1 + 64) identifier];
  int v19 = objc_msgSend(v18, "ef_conformsToMarkupUTType");

  if (v19)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    CGRect v21 = [v6 objectID];
    uint64_t v22 = [v6 subject];
    id v23 = [v22 subjectString];
    double v24 = [*(id *)(a1 + 40) webView];
    id v25 = *(void **)(a1 + 56);
    id v26 = [v25 assetViewerManager];
    LOBYTE(v51) = 0;
    int v27 = +[MessageAttachmentActionGenerator markupDocumentActionForURL:v20 messageObjectID:v21 mailboxObjectID:v56 subject:v23 senderDisplayName:v55 shouldShowReplyAll:v9 originView:v24 useFullScreenPresentation:v51 contentRepresentationHandlingDelegate:v25 assetViewerManager:v26];
    objc_msgSend(v57, "ef_addOptionalObject:", v27);
  }
  if ([*(id *)(a1 + 40) mayShareToUnmanaged])
  {
    if ([*(id *)(a1 + 64) conformsToType:*MEMORY[0x1E4F44448]])
    {
      id v28 = +[MessageAttachmentActionGenerator saveVideoActionForFutureRepresentation:*(void *)(a1 + 72)];
      [v57 addObject:v28];
    }
    else
    {
      if (![*(id *)(a1 + 64) conformsToType:*MEMORY[0x1E4F44400]]) {
        goto LABEL_13;
      }
      id v28 = +[MessageAttachmentActionGenerator saveImageActionForFutureRepresentation:*(void *)(a1 + 72)];
      [v57 addObject:v28];
    }

LABEL_13:
    if ([*(id *)(a1 + 40) _allAttachmentsArePhotosOrVideos])
    {
      id v29 = [*(id *)(a1 + 56) localizedTitleForSaveAllAttachmentsAction];
      id v30 = [*(id *)(*(void *)(a1 + 40) + 416) contentItems];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_5;
      v68[3] = &unk_1E6D1B510;
      v68[4] = *(void *)(a1 + 40);
      id v31 = objc_msgSend(v30, "ef_map:", v68);
      id v32 = +[MessageAttachmentActionGenerator saveAllAttachmentsActionWithTitle:v29 futureRepresentations:v31];
      [v57 addObject:v32];
    }
  }
  char v33 = (void *)MEMORY[0x1E4FB13F0];
  id v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v35 = [v34 localizedStringForKey:@"SAVE_TO_FILES" value:&stru_1F39E2A88 table:@"Main"];
  id v36 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F350A0]];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_6;
  v64[3] = &unk_1E6D1B538;
  id v37 = *(id *)(a1 + 48);
  uint64_t v38 = *(void *)(a1 + 40);
  id v65 = v37;
  uint64_t v66 = v38;
  id v67 = *(id *)(a1 + 80);
  char v39 = [v33 actionWithTitle:v35 image:v36 identifier:0 handler:v64];
  [v57 addObject:v39];

  uint64_t v40 = (void *)MEMORY[0x1E4FB13F0];
  id v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v42 = [v41 localizedStringForKey:@"SHARE" value:&stru_1F39E2A88 table:@"Main"];
  __int16 v43 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F350A8]];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_7;
  v61[3] = &unk_1E6D1B538;
  int8x16_t v52 = *(int8x16_t *)(a1 + 32);
  id v44 = (id)v52.i64[0];
  int8x16_t v62 = vextq_s8(v52, v52, 8uLL);
  id v63 = *(id *)(a1 + 80);
  __int16 v45 = [v40 actionWithTitle:v42 image:v43 identifier:0 handler:v61];
  [v57 addObject:v45];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_8;
  aBlock[3] = &unk_1E6D1B580;
  id v59 = v54;
  id v46 = v57;
  id v60 = v46;
  __int16 v47 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([*(id *)(a1 + 40) mayShareToUnmanaged]) {
    v47[2](v47, 2);
  }
  v47[2](v47, 12);
  v47[2](v47, 13);
  unint64_t v48 = (void *)MEMORY[0x1E4FB1970];
  __int16 v49 = [*(id *)(a1 + 32) displayName];
  id v4 = [v48 menuWithTitle:v49 children:v46];

  id v3 = v54;
LABEL_18:

  return v4;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 416) futureForContentItem:a2 download:1];
  return v2;
}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_6(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4FB16F0]);
  v10[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v4 = (void *)[v2 initForExportingURLs:v3 asCopy:1];

  objc_msgSend(v4, "_setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "sourceIsManaged"));
  id v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) boundingRect];
  objc_msgSend(v5, "_adjustedRectForWebRect:");
  v5[63] = v6;
  v5[64] = v7;
  v5[65] = v8;
  v5[66] = v9;
  [*(id *)(a1 + 40) presentViewController:v4];
}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 416);
  [*(id *)(a1 + 48) boundingRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) webView];
  objc_msgSend(v3, "showMenuForContentItem:rect:view:", v2, v5, v7, v9, v11);
}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_9;
  v5[3] = &__block_descriptor_40_e23_B16__0__UIMenuElement_8l;
  v5[4] = a2;
  double v4 = objc_msgSend(v3, "ef_firstObjectPassingTest:", v5);
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

BOOL __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = (void *)MEMORY[0x1E4F46770];
    double v6 = [v3 identifier];
    BOOL v7 = v4 == [v5 elementActionTypeForUIActionIdentifier:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  double v10 = (void (**)(id, void *))a5;
  BOOL v7 = [a4 _activatedElementInfo];
  double v8 = v7;
  if (v7)
  {
    if ((unint64_t)([v7 type] - 1) >= 2)
    {
      double v9 = 0;
    }
    else
    {
      double v9 = [(MFMessageContentView *)self _contextMenuConfigurationForAttachment:v8];
    }
    v10[2](v10, v9);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [v7 _activatedElementInfo];
  double v10 = v9;
  if (v9)
  {
    [v9 boundingRect];
    -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:");
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __77__MFMessageContentView_webView_contextMenuForElement_willCommitWithAnimator___block_invoke;
    v19[3] = &unk_1E6D1B5D0;
    v19[4] = self;
    id v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    uint64_t v23 = v16;
    uint64_t v24 = v18;
    [v8 addCompletion:v19];
  }
}

void __77__MFMessageContentView_webView_contextMenuForElement_willCommitWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  id v3 = [*(id *)(a1 + 40) ID];
  objc_msgSend(v2, "attachmentWasTappedWithElementID:rect:view:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_contentItemForElement:(id)a3
{
  id v4 = a3;
  double v5 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForElementID:v4];
  if (!v5)
  {
    double v5 = [(MessageContentItemsHelper *)self->_relatedItemsHelper contentItemForContentID:v4];
  }

  return v5;
}

- (id)downloadFutureForContentItem:(id)a3
{
  id v3 = [(MessageContentItemsHelper *)self->_relatedItemsHelper futureForContentItem:a3 download:1];
  return v3;
}

- (void)webView:(id)a3 showLockdownModeFirstUseMessage:(id)a4 completionHandler:(id)a5
{
  double v5 = (void (**)(id, uint64_t))a5;
  double v6 = +[MFMessageContentView log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1DDF5A000, v6, OS_LOG_TYPE_DEFAULT, "Skipping lockdown first use message", v7, 2u);
  }

  v5[2](v5, 3);
}

- (void)headerViewDidChangeHeight:(id)a3
{
  [(MFMessageContentView *)self _adjustWebViewInsetsToAccomodateHeaderAndFooter];
  if (v4 != 0.0)
  {
    [(MFMessageContentView *)self layoutIfNeeded];
  }
}

- (void)footerViewDidChangeHeight:(id)a3
{
  [(MFMessageContentView *)self _adjustWebViewInsetsToAccomodateHeaderAndFooter];
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0)
  {
    [(MFMessageContentView *)self layoutIfNeeded];
  }
}

- (double)_adjustWebViewInsetsToAccomodateHeaderAndFooter
{
  id v3 = [(MFMessageContentView *)self webView];
  double v4 = [v3 scrollView];

  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  [(MFMessageHeaderView *)self->_headerView bounds];
  double Height = CGRectGetHeight(v22);
  if (self->_showMessageFooter)
  {
    [(MFConversationItemFooterView *)self->_footerView bounds];
    double v10 = ceil(CGRectGetHeight(v23));
  }
  else
  {
    double v10 = 0.0;
  }
  [v4 contentInset];
  double v12 = v11;
  [v4 contentInset];
  double v14 = ceil(Height);
  double v15 = v10 + v14 - v12 - v13;
  double v16 = -v15;
  if (v15 >= 0.0) {
    double v16 = v10 + v14 - v12 - v13;
  }
  if (v16 > 0.00000011920929 && !self->_suppressContentSizeNotifications)
  {
    [v4 contentOffset];
    double v18 = v17;
    double v20 = v19;
    objc_msgSend(v4, "setContentInset:", v14, v6, v10, v8);
    objc_msgSend(v4, "setContentOffset:", v18, v20 - v15);
  }

  return v15;
}

- (void)_adjustHeaderOffsetForZoom
{
  id v3 = [(MFMessageContentView *)self webView];
  double v4 = [v3 scrollView];
  [v4 contentOffset];
  double v6 = v5;

  [(MFMessageHeaderView *)self->_headerView bounds];
  double Height = CGRectGetHeight(v11);
  CGAffineTransformMakeTranslation(&v10, 0.0, -fmax(v6 + ceil(Height), 0.0));
  headerView = self->_headerView;
  CGAffineTransform v9 = v10;
  [(MFMessageHeaderView *)headerView setTransform:&v9];
}

- (void)_resetHeaderOffsetForZoom
{
  headerView = self->_headerView;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(MFMessageHeaderView *)headerView setTransform:v4];
}

- (void)_beginObservingContentHeight
{
  if (!self->_contentSizeObservation)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    long long v3 = [(MFMessageContentView *)self webView];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__MFMessageContentView__beginObservingContentHeight__block_invoke;
    v6[3] = &unk_1E6D1B108;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "ef_observeKeyPath:options:usingBlock:", @"scrollView.contentSize", 1, v6);
    double v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    contentSizeObservation = self->_contentSizeObservation;
    self->_contentSizeObservation = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__MFMessageContentView__beginObservingContentHeight__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  [v4 CGSizeValue];
  objc_msgSend(WeakRetained, "_notifyDelegateScrollViewSizeChanged:");

  if ([WeakRetained suppressScrolling])
  {
    double v5 = [WeakRetained webView];
    double v6 = [v5 scrollView];
    [v6 setScrollEnabled:0];
  }
  if (WeakRetained && !WeakRetained[544] && !WeakRetained[545])
  {
    id v7 = [WeakRetained scrollView];
    [v7 contentOffset];
    double v9 = v8;
    CGAffineTransform v10 = [WeakRetained scrollView];
    [v10 contentInset];
    double v12 = v11;
    double v13 = [WeakRetained webView];
    double v14 = [v13 scrollView];
    objc_msgSend(v14, "setContentOffset:", v9, -v12);
  }
}

- (void)_notifyDelegateScrollViewSizeChanged:(CGSize)a3
{
  if ((*(_WORD *)&self->_flags & 8) != 0
    && !self->_suppressContentSizeNotifications
    && !self->_suppressContentSizeNotificationsUntilFirstPaint)
  {
    double height = a3.height;
    [(MFMessageHeaderView *)self->_headerView bounds];
    double v5 = height + CGRectGetHeight(v9);
    [(MFConversationItemFooterView *)self->_footerView bounds];
    double v6 = v5 + CGRectGetHeight(v10);
    id v7 = [(MFMessageContentView *)self delegate];
    [v7 messageContentView:self didFinishRenderingWithHeight:v6];
  }
}

- (void)_stopObservingContentHeight
{
  [(EFCancelable *)self->_contentSizeObservation cancel];
  contentSizeObservation = self->_contentSizeObservation;
  self->_contentSizeObservation = 0;
}

- (void)mailDropBannerDidTriggerDownload:(id)a3
{
  id v7 = a3;
  double v4 = [MEMORY[0x1E4F77C08] sharedInstance];
  char v5 = [v4 isFatPipe];

  if ([(MessageContentItemsHelper *)self->_relatedItemsHelper totalMailDropDownloadSize] < 0x6400001) {
    char v6 = 1;
  }
  else {
    char v6 = v5;
  }
  if (v6)
  {
    [(MFMessageContentView *)self _downloadAllMailDropAttachments];
  }
  else
  {
    [(MFMessageContentView *)self _alertMailDropDownloadIsTooLargeForCell:1];
    [v7 setBannerState:1];
  }
}

- (void)_downloadAllMailDropAttachments
{
}

- (id)viewPrintFormatter
{
  uint64_t v2 = [(MFMessageContentView *)self webView];
  long long v3 = [v2 viewPrintFormatter];

  return v3;
}

- (void)loadHasMoreContentBannerIfNecessary
{
}

- (void)_addHasMoreContentBannerWithRemainingBytes:(unint64_t)a3
{
  loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  if (!loadHasMoreContentBanner)
  {
    +[MFHasMoreContentBannerView bannerWithFrame:isPlainText:remainingBytes:](MFHasMoreContentBannerView, "bannerWithFrame:isPlainText:remainingBytes:", a3 == 0, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    char v5 = (MFHasMoreContentBannerView *)objc_claimAutoreleasedReturnValue();
    char v6 = self->_loadHasMoreContentBanner;
    self->_loadHasMoreContentBanner = v5;

    [(MFHasMoreContentBannerView *)self->_loadHasMoreContentBanner setDelegate:self];
    [(MFMessageHeaderView *)self->_headerView insertHeaderBlock:self->_loadHasMoreContentBanner atIndex:0 animated:1];
    loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  }
  [(MFHasMoreContentBannerView *)loadHasMoreContentBanner reloadData];
}

- (void)_updateHasMoreContentBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4
{
}

- (void)didTapHasMoreContentBannerView:(id)a3
{
  double v4 = [(MFMessageContentView *)self contentRepresentation];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke;
  v6[3] = &unk_1E6D1B5F8;
  void v6[4] = self;
  id v5 = (id)[v4 requestAdditionalContentWithCompletion:v6];
}

void __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke_2;
  v7[3] = &unk_1E6D1AB90;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 performBlock:v7];
}

void __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void *)(a1 + 32) == 0;
  id v3 = +[MFMessageContentView log];
  double v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) contentRepresentation];
      id v8 = objc_msgSend(v7, "ef_publicDescription");
      int v13 = 138543362;
      double v14 = v8;
      _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "Finished requesting additional content for content representation: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v6 = [v9 contentRepresentation];
    [v9 contentRequestDidReceiveContentRepresentation:v6 error:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      CGRect v10 = [*(id *)(a1 + 40) contentRepresentation];
      double v11 = objc_msgSend(v10, "ef_publicDescription");
      double v12 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int v13 = 138543618;
      double v14 = v11;
      __int16 v15 = 2114;
      double v16 = v12;
      _os_log_error_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_ERROR, "Failed to request additional content for content representation: %{public}@ due to error: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 contentRepresentation];
    objc_msgSend(v5, "_updateHasMoreContentBannerWithRemainingBytes:error:", objc_msgSend(v6, "remainingByteCount"), *(void *)(a1 + 32));
  }
}

- (void)_clearHasMoreContentBannerAnimated:(BOOL)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_loadHasMoreContentBanner animated:a3];
  loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  self->_loadHasMoreContentBanner = 0;
}

- (void)_addHideMyEmailBannerIfNeeded
{
  if (EMBlackPearlIsFeatureEnabled())
  {
    id v3 = [(MFMessageContentView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v4 = [v3 isShowingGroupedSenderMessageListForMessageContentView:self];

      if (v4) {
        return;
      }
    }
    else
    {
    }
  }
  if (!self->_hideMyEmailBanner)
  {
    id v5 = [(MFMessageContentView *)self contentRequest];
    uint64_t v6 = [v5 resultIfAvailable];
    id v7 = [v6 requestedHeaders];
    id v8 = [v7 headersForKey:*MEMORY[0x1E4F606B0]];

    if (v8)
    {
      uint64_t v9 = [MFHideMyEmailBannerView alloc];
      CGRect v10 = -[MFHideMyEmailBannerView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      hideMyEmailBanner = self->_hideMyEmailBanner;
      self->_hideMyEmailBanner = v10;

      [(MFHideMyEmailBannerView *)self->_hideMyEmailBanner setDelegate:self];
      headerView = self->_headerView;
      int v13 = self->_hideMyEmailBanner;
      [(MFMessageHeaderView *)headerView insertHeaderBlock:v13 atIndex:0 animated:1];
    }
  }
}

- (void)didTapHideMyEmailBannerView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F35110] hideMyEmailURL];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)didDismissHideMyEmailBannerView:(id)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_hideMyEmailBanner animated:1];
  hideMyEmailBanner = self->_hideMyEmailBanner;
  self->_hideMyEmailBanner = 0;
}

- (void)_clearLoadRemoteImagesBannerAnimated:(BOOL)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_loadImagesHeaderBlock animated:a3];
  loadImagesHeaderBlock = self->_loadImagesHeaderBlock;
  self->_loadImagesHeaderBlock = 0;
}

- (void)presentViewController:(id)a3
{
  id v6 = a3;
  id v4 = [(MFMessageContentView *)self delegate];
  id v5 = [v4 presentingViewControllerForMessageContentView:self];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)loadBlockedContent
{
  [(MFMessageContentView *)self setMessageBlockingReason:0];
  char v3 = [(MFMessageContentView *)self blockedContentTypes];
  [(MFMessageContentView *)self setBlockedContentTypes:0];
  if ((v3 & 4) == 0)
  {
    if ((v3 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    [(MFMessageContentView *)self _reloadWithRemoteContentAllowed];
    if ((v3 & 2) == 0) {
      return;
    }
    goto LABEL_7;
  }
  [(MFMessageContentView *)self _reloadWithPartiallyEncryptedMessageAllowed];
  if (v3) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v3 & 2) == 0) {
    return;
  }
LABEL_7:
  [(MFMessageContentView *)self _reevaluateTrustWithNetworkAccessAllowed];
}

- (void)_reloadWithPartiallyEncryptedMessageAllowed
{
  [(MFMessageContentView *)self setAllowLoadOfBlockedMessageContent:1];
  [(MFMessageContentView *)self _triggerWebViewLoad];
}

- (void)_reloadWithRemoteContentAllowed
{
  [(MFMessageContentView *)self setAllowLoadOfBlockedMessageContent:1];
  char v3 = [(MFMessageContentView *)self contentRepresentation];
  [v3 setShowRemoteImages:1];

  [(MFMessageContentView *)self reload];
}

- (void)_reevaluateTrustWithNetworkAccessAllowed
{
  id v3 = [(MFMessageContentView *)self contentRepresentation];
  BOOL v2 = [v3 securityInformation];
  [v2 reevaluateTrustWithNetworkAccessAllowed];
}

- (void)dismissPresentedViewController:(id)a3
{
  id v5 = [(MFMessageContentView *)self delegate];
  id v4 = [v5 presentingViewControllerForMessageContentView:self];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_clearLoadFailedProxyContentBannerAnimated:(BOOL)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_loadFailedProxyContentBanner animated:a3];
  loadFailedProxyContentBanner = self->_loadFailedProxyContentBanner;
  self->_loadFailedProxyContentBanner = 0;
}

- (void)loadFailedProxyContentBannerDidTriggerLoad:(id)a3
{
  [(MFMessageContentView *)self _clearLoadFailedProxyContentBannerAnimated:1];
  [(MFMessageContentView *)self _setRemoteContentToLoadWithoutProxy];
  [(MFMessageContentView *)self reload];
  [(NSMutableDictionary *)self->_failedProxyURLs removeAllObjects];
  allRemoteURLs = self->_allRemoteURLs;
  self->_allRemoteURLs = 0;
}

- (void)loadFailedProxyContentBannerWasDismissed:(id)a3
{
  [(MFMessageContentView *)self _clearLoadFailedProxyContentBannerAnimated:1];
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setBool:1 forKey:*MEMORY[0x1E4F60168]];
}

- (void)_showModalViewController:(id)a3 presentationSource:(id)a4
{
}

- (void)_showModalViewController:(id)a3 presentationSource:(id)a4 forceNavigationController:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v14];

        uint64_t v9 = (void *)v10;
      }
      else
      {
        uint64_t v9 = v14;
      }
      id v14 = v9;
      [v9 setModalPresentationStyle:7];
    }
  }
  double v11 = [v14 popoverPresentationController];
  [v11 setDelegate:self];
  objc_msgSend(v8, "mui_setAsSourceForPopoverPresentationController:", v11);
  double v12 = [(MFMessageContentView *)self delegate];
  int v13 = [v12 presentingViewControllerForMessageContentView:self];

  [v13 presentViewController:v14 animated:1 completion:0];
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v15 = [a3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v15 topViewController];

    id v15 = (id)v7;
  }
  if (a4 == -1 || a4 == 7)
  {
    id v8 = [v15 navigationItem];
    uint64_t v9 = [v8 rightBarButtonItem];
    uint64_t v10 = [(MFMessageContentView *)self presentedControllerDoneButtonItem];

    if (v9 != v10) {
      goto LABEL_10;
    }
    double v11 = [v15 navigationItem];
    [v11 setRightBarButtonItem:0];
  }
  else
  {
    double v12 = [v15 navigationItem];
    int v13 = [v12 rightBarButtonItem];

    if (v13) {
      goto LABEL_10;
    }
    double v11 = [(MFMessageContentView *)self presentedControllerDoneButtonItem];
    id v14 = [v15 navigationItem];
    [v14 setRightBarButtonItem:v11];
  }
LABEL_10:
}

- (void)mui_setAsSourceForPopoverPresentationController:(id)a3
{
  id v4 = a3;
  [v4 setSourceView:self];
  objc_msgSend(v4, "setSourceRect:", self->_activatedAttachmentRect.origin.x, self->_activatedAttachmentRect.origin.y, self->_activatedAttachmentRect.size.width, self->_activatedAttachmentRect.size.height);
}

- (void)mui_setAsTargetedSourceOnSceneConfiguration:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  [v5 setPreview:v4];
}

- (id)presentedControllerDoneButtonItem
{
  presentedControllerDoneButtonItem = self->_presentedControllerDoneButtonItem;
  if (!presentedControllerDoneButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissPresentedViewController_];
    id v5 = self->_presentedControllerDoneButtonItem;
    self->_presentedControllerDoneButtonItem = v4;

    presentedControllerDoneButtonItem = self->_presentedControllerDoneButtonItem;
  }
  return presentedControllerDoneButtonItem;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMessageContentView *)self loadingView];
  id v6 = [v5 superview];
  if (v6)
  {
  }
  else
  {
    BOOL v7 = [(MFMessageContentView *)self isZoomEnabled];

    if (v7)
    {
      id v8 = [v4 subviews];
      uint64_t v9 = [v8 firstObject];

      goto LABEL_6;
    }
  }
  [v4 setZoomEnabled:0];
  uint64_t v9 = 0;
LABEL_6:

  return v9;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5 = a3;
  self->_suppressContentSizeNotifications = 1;
  id v20 = v5;
  [v5 contentSize];
  double v7 = v6;
  [v20 minimumZoomScale];
  double v9 = v8;
  [v20 contentInset];
  uint64_t v10 = [(MFMessageContentView *)self webView];
  [v10 _obscuredInsets];
  UIEdgeInsetsSubtract();
  self->_originalZoomInsets.top = v11;
  self->_originalZoomInsets.left = v12;
  self->_originalZoomInsets.bottom = v13;
  self->_originalZoomInsets.right = v14;

  [v20 contentInset];
  double v16 = v15;
  [v20 contentInset];
  double v17 = fabs(v7 + v7 / (v9 / -3.0));
  objc_msgSend(v20, "setContentInset:", v17 + v16, *(double *)(MEMORY[0x1E4FB2848] + 8), v17 + v18, *(double *)(MEMORY[0x1E4FB2848] + 24));
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained messageContentViewWillBeginZoomingMessage:self];
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v21 = a3;
  id v7 = a4;
  double v8 = v21;
  p_originalZoomInsets = &self->_originalZoomInsets;
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_originalZoomInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_originalZoomInsets.bottom))))))
  {
    [v21 contentOffset];
    double v11 = v10;
    double left = self->_originalZoomInsets.left;
    [v21 contentOffset];
    double v14 = v13;
    double top = p_originalZoomInsets->top;
    double v16 = [(MFMessageContentView *)self webView];
    [v16 _obscuredInsets];
    UIEdgeInsetsAdd();
    objc_msgSend(v21, "setContentInset:");
    double v17 = v11 - left;
    double v18 = v14 + top;

    long long v19 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&p_originalZoomInsets->double top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&self->_originalZoomInsets.bottom = v19;
    double v8 = v21;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  self->_suppressContentSizeNotifications = 0;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "messageContentView:didEndZoomingMessageWithOffset:", self, v17, v18);

    double v8 = v21;
  }
  [v8 contentSize];
  -[MFMessageContentView _notifyDelegateScrollViewSizeChanged:](self, "_notifyDelegateScrollViewSizeChanged:");
  [(MFMessageContentView *)self _resetHeaderOffsetForZoom];
}

- (void)setSuppressScrolling:(BOOL)a3
{
  self->_suppressScrolling = a3;
  if (!a3)
  {
    id v4 = [(MFMessageContentView *)self webView];
    id v3 = [v4 scrollView];
    [v3 setScrollEnabled:1];
  }
}

- (void)setContentPaddingFollowsLayoutMargins:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_contentPaddingFollowsLayoutMargins != a3)
  {
    self->_contentPaddingFollowsLayoutMargins = a3;
    if (a3)
    {
      id v5 = +[MFMessageContentView log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        double v8 = NSStringFromSelector(a2);
        double v9 = [(MFMessageContentView *)self webView];
        int v10 = 138544130;
        id v11 = v7;
        __int16 v12 = 2048;
        double v13 = self;
        __int16 v14 = 2114;
        double v15 = v8;
        __int16 v16 = 2048;
        double v17 = v9;
        _os_log_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ webView = %p", (uint8_t *)&v10, 0x2Au);
      }
      [(MFMessageContentView *)self _setNeedsPaddingConstantsUpdate];
    }
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  id v9 = a3;
  id v4 = [(MFMessageContentView *)self webView];
  id v5 = [v4 scrollView];

  if (v5 == v9)
  {
    if ([(MFMessageContentView *)self suppressScrolling])
    {
      [v9 zoomScale];
      BOOL v7 = fabs(v6 + -1.0) > 0.00000011920929;
    }
    else
    {
      BOOL v7 = 1;
    }
    [v9 setScrollEnabled:v7];
    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v8];

    if (([v9 isZooming] & 1) != 0 || objc_msgSend(v9, "isZoomBouncing")) {
      [(MFMessageContentView *)self _adjustHeaderOffsetForZoom];
    }
  }
}

- (void)_logRequestFinishWithSuccess:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = [(MFMessageContentView *)self contentRepresentationIfAvailable];
    uint64_t v5 = [v4 transportType];
    uint64_t v6 = 0;
    uint64_t v24 = 0;
LABEL_5:

    goto LABEL_6;
  }
  BOOL v7 = [(MFMessageContentView *)self contentRepresentationError];
  if (v7)
  {
    double v8 = v7;
    uint64_t v6 = [v7 code];
    id v4 = [v8 userInfo];
    uint64_t v24 = v8;
    id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5FC90]];
    uint64_t v5 = [v9 integerValue];

    goto LABEL_5;
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Rendering progress failed without error");
  uint64_t v5 = 0;
  uint64_t v6 = -1;
LABEL_6:
  int v10 = [(MFMessageContentView *)self contentRequest];
  id v11 = [v10 message];
  __int16 v12 = [v11 mailboxesIfAvailable];
  double v13 = [v12 firstObject];
  __int16 v14 = [v13 account];
  double v15 = [v14 statisticsKind];

  if (v15) {
    uint64_t v16 = [MEMORY[0x1E4F73E38] accountStatisticsKindToIdentifier:v15];
  }
  else {
    uint64_t v16 = 0;
  }
  double v17 = +[MFMessageContentView signpostLog];
  os_signpost_id_t v18 = [(MessageContentRepresentationRequest *)self->_contentRequest signpostID];
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    long long v19 = [(MFMessageContentView *)self webView];
    id v20 = [(MessageContentRepresentationRequest *)self->_contentRequest itemID];
    *(_DWORD *)buf = 134349826;
    id v26 = v19;
    __int16 v27 = 2114;
    id v28 = v20;
    __int16 v29 = 2050;
    uint64_t v30 = v16 | (v5 << 8);
    __int16 v31 = 2050;
    uint64_t v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DDF5A000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MFMessageContentView", "WebView=%{signpost.description:attribute,public}p itemID=%{signpost.description:attribute,public}@ AccountType=%{public, signpost.telemetry:number1}lu Status=%{public, signpost.telemetry:number2}ld enableTelemetry=YES ", buf, 0x2Au);
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CGRect v22 = [(MessageContentRepresentationRequest *)self->_contentRequest message];
  [v21 setObject:v22 forKeyedSubscript:@"MFMessageContentViewDidFinishFirstPaintMessageKey"];

  if (v24) {
    [v21 setObject:v24 forKeyedSubscript:@"MFMessageContentViewDidFinishFirstPaintErrorKey"];
  }
  CGRect v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 postNotificationName:MFMessageContentViewDidFinishFirstPaint object:self userInfo:v21];
}

- (void)prepareForReuse
{
  [(EFCancelationToken *)self->_loadingCancelable cancel];
  loadingCancelable = self->_loadingCancelable;
  self->_loadingCancelable = 0;

  [(MFMessageContentView *)self _showDelayedProgressUIIfNeeded];
  [(NSMutableSet *)self->_inFlightURLs removeAllObjects];
  [(MFMessageContentView *)self removeQuickReplyAnimationContextIfNecessary];
  [(MFMessageContentView *)self didEndTextSearch];
  id v4 = [(MFMessageContentView *)self headerView];
  [v4 prepareForReuse];
}

- (void)_addBlockedSenderBannerIfNeeded
{
  if ([MEMORY[0x1E4F60210] shouldPromptForBlockedSender]
    && ![(MFMessageContentView *)self hideSenderSpecificBanners]
    && ([(MFMessageContentView *)self contentRequest],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 message],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isBlocked],
        v4,
        v3,
        v5))
  {
    if (!self->_blockedSenderBanner)
    {
      uint64_t v6 = [MFBlockedSenderBannerView alloc];
      BOOL v7 = -[MFBlockedSenderBannerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      blockedSenderBanner = self->_blockedSenderBanner;
      self->_blockedSenderBanner = v7;

      [(MFBlockedSenderBannerView *)self->_blockedSenderBanner setDelegate:self];
      headerView = self->_headerView;
      int v10 = self->_blockedSenderBanner;
      [(MFMessageHeaderView *)headerView insertHeaderBlock:v10 atIndex:0 animated:1];
    }
  }
  else
  {
    [(MFMessageContentView *)self _clearBlockedSenderBannerAnimated:1];
  }
}

- (void)_clearBlockedSenderBannerAnimated:(BOOL)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_blockedSenderBanner animated:a3];
  blockedSenderBanner = self->_blockedSenderBanner;
  self->_blockedSenderBanner = 0;
}

- (void)didTapBlockedSenderBannerView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F35110] blockedSenderURL];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)didDismissBlockedSenderBannerView:(id)a3
{
  [(MFMessageContentView *)self _clearBlockedSenderBannerAnimated:1];
  id v3 = (void *)MEMORY[0x1E4F60210];
  [v3 setPromptForBlockedSender:0];
}

- (void)_addNotAuthenticatedBannerIfNeeded
{
  id v3 = [(MFMessageContentView *)self contentRequest];
  id v13 = [v3 message];

  BOOL v4 = [(MFMessageContentView *)self allowNotAuthenticatedBanner];
  if (v13) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 && [v13 allowAuthenticationWarning])
  {
    if (!self->_notAuthenticatedBanner)
    {
      uint64_t v6 = [_TtC12MobileMailUI28MFNotAuthenticatedBannerView alloc];
      BOOL v7 = [v13 senderList];
      double v8 = [v7 firstObject];
      id v9 = [v8 emailAddressValue];
      int v10 = [v9 simpleAddress];
      id v11 = -[MFNotAuthenticatedBannerView initWithFrame:sender:](v6, "initWithFrame:sender:", v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      notAuthenticatedBanner = self->_notAuthenticatedBanner;
      self->_notAuthenticatedBanner = v11;

      [(MFNotAuthenticatedBannerView *)self->_notAuthenticatedBanner setDelegate:self];
      [(MFMessageHeaderView *)self->_headerView insertHeaderBlock:self->_notAuthenticatedBanner atIndex:0 animated:1];
    }
  }
  else
  {
    [(MFMessageContentView *)self _clearNotAuthenticatedBannerAnimated:1];
  }
}

- (void)_clearNotAuthenticatedBannerAnimated:(BOOL)a3
{
  [(MFMessageHeaderView *)self->_headerView removeHeaderBlock:self->_notAuthenticatedBanner animated:a3];
  notAuthenticatedBanner = self->_notAuthenticatedBanner;
  self->_notAuthenticatedBanner = 0;
}

- (void)didDismissNotAuthenticatedBannerView:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  [(MFMessageContentView *)self _clearNotAuthenticatedBannerAnimated:1];
  BOOL v5 = [(MFMessageContentView *)self contentRequest];
  uint64_t v6 = [v5 message];

  BOOL v7 = [(MFMessageContentView *)self contentRequest];
  double v8 = [v7 message];
  id v9 = [v8 repository];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MFMessageContentView.m" lineNumber:2893 description:@"Cannot clear Not Authenticated Banner - Message Repository not found."];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F604D0]);
  v14[0] = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  __int16 v12 = (void *)[v10 initWithMessageListItems:v11 origin:3 actor:2];

  [v9 performMessageChangeAction:v12];
}

- (void)_observeBlockedSenderListChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleBlockSenderListChanged_ name:*MEMORY[0x1E4F5FC78] object:0];
}

- (void)_handleBlockSenderListChanged:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__MFMessageContentView__handleBlockSenderListChanged___block_invoke;
  _OWORD v4[3] = &unk_1E6D1AB40;
  void v4[4] = self;
  id v3 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", a3);
  [v3 performBlock:v4];
}

uint64_t __54__MFMessageContentView__handleBlockSenderListChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addBlockedSenderBannerIfNeeded];
}

- (void)didBeginTextSearch
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    int v3 = 1;
    if (self->_isTextSearchActive) {
      goto LABEL_5;
    }
    self->_BOOL isTextSearchActive = 1;
  }
  BOOL v4 = [(MFMessageContentView *)self webView];
  [v4 didBeginTextSearchOperation];

  BOOL v5 = [(MFMessageContentView *)self headerView];
  [v5 addConversationSearchOverlay];

  uint64_t v6 = [(MFMessageContentView *)self footerView];
  [v6 addConversationSearchOverlay];

  int v3 = 0;
LABEL_5:
  BOOL v7 = +[MFMessageContentView log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(MFMessageContentView *)self webView];
    id v9 = (void *)v8;
    if (self) {
      BOOL isTextSearchActive = self->_isTextSearchActive;
    }
    else {
      BOOL isTextSearchActive = 0;
    }
    int v11 = 134218752;
    __int16 v12 = self;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 1024;
    int v16 = v3;
    __int16 v17 = 1024;
    BOOL v18 = isTextSearchActive;
    _os_log_impl(&dword_1DDF5A000, v7, OS_LOG_TYPE_DEFAULT, "didBeginTextSearch: self = %p, webView = %p, searchWasActive = %{BOOL}d, searchIsActive = %{BOOL}d", (uint8_t *)&v11, 0x22u);
  }
}

- (void)didEndTextSearch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self && self->_isTextSearchActive)
  {
    self->_BOOL isTextSearchActive = 0;
    int v3 = [(MFMessageContentView *)self webView];
    [v3 clearAllDecoratedFoundText];

    BOOL v4 = [(MFMessageContentView *)self webView];
    [v4 didEndTextSearchOperation];

    BOOL v5 = [(MFMessageContentView *)self headerView];
    [v5 removeConversationSearchOverlay];

    uint64_t v6 = [(MFMessageContentView *)self footerView];
    [v6 removeConversationSearchOverlay];

    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = +[MFMessageContentView log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MFMessageContentView *)self webView];
    id v10 = (void *)v9;
    if (self) {
      BOOL isTextSearchActive = self->_isTextSearchActive;
    }
    else {
      BOOL isTextSearchActive = 0;
    }
    int v12 = 134218752;
    __int16 v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = isTextSearchActive;
    _os_log_impl(&dword_1DDF5A000, v8, OS_LOG_TYPE_DEFAULT, "didEndTextSearch: self = %p, webView = %p, searchWasActive = %{BOOL}d, searchIsActive = %{BOOL}d", (uint8_t *)&v12, 0x22u);
  }
}

- (void)clearAllDecoratedFoundText
{
  id v2 = [(MFMessageContentView *)self webView];
  [v2 clearAllDecoratedFoundText];
}

- (void)showSearchResultsAtRange:(id)a3 usingStyle:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(MFMessageContentView *)self webView];
  uint64_t v8 = +[MFMessageContentView log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MFMessageContentView *)self contentRequest];
    id v10 = [v9 itemID];
    int v11 = 136316162;
    int v12 = "-[MFMessageContentView showSearchResultsAtRange:usingStyle:]";
    __int16 v13 = 2112;
    __int16 v14 = v7;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl(&dword_1DDF5A000, v8, OS_LOG_TYPE_DEFAULT, "%s: webview %@ returned rect for range: %@, item: %@, style: %lu", (uint8_t *)&v11, 0x34u);
  }
  [v7 decorateFoundTextRange:v6 inDocument:0 usingStyle:a4];
}

- (void)requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MFMessageContentView *)self webView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __71__MFMessageContentView_requestRectForFoundTextRange_completionHandler___block_invoke;
  v10[3] = &unk_1E6D1B620;
  v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  [v8 _requestRectForFoundTextRange:v6 completionHandler:v10];
}

uint64_t __71__MFMessageContentView_requestRectForFoundTextRange_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_adjustedRectForWebRect:");
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl() && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F60CF0] + 16))() & 1) == 0)
  {
    [(MFMessageContentView *)self setQuickReplyAnimationContext:v4];
    BOOL v5 = [(MFMessageContentView *)self headerView];
    [v5 setHidden:1];
    [v5 setAlpha:0.0];
    id v6 = [(MFMessageContentView *)self webView];
    [v6 setAlpha:0.0];
    id v7 = [(MFMessageContentView *)self scrollView];
    [v7 contentInset];
    [v4 insets];
    objc_msgSend(v7, "setContentInset:");
    uint64_t v8 = [v4 backgroundSnapshot];
    [(MFMessageContentView *)self addSubview:v8];
    [(MFMessageContentView *)self bringSubviewToFront:v8];
    [v8 setHidden:1];
    id v9 = [v4 buttonsSnapshot];
    [(MFMessageContentView *)self insertSubview:v9 aboveSubview:v8];
    id v10 = [v4 compositionSnapshot];
    [(MFMessageContentView *)self insertSubview:v10 aboveSubview:v8];
    id v11 = +[MFMessageContentView log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v14 = 138543618;
      __int16 v15 = v13;
      __int16 v16 = 2048;
      __int16 v17 = self;
      _os_log_impl(&dword_1DDF5A000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply][Send Animation] Did apply quick-reply snapshots", (uint8_t *)&v14, 0x16u);
    }
    [(MFMessageContentView *)self _updateWebViewPaddingConstants];
  }
}

- (void)_performQuickReplyMoveMessageBodyAnimationIfNeeded
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    int v3 = [(MFMessageContentView *)self quickReplyAnimationContext];

    if (v3)
    {
      id v4 = +[MFMessageContentView log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        __int16 v62 = 2048;
        id v63 = self;
        _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply][Send Animation] Will perform quick-reply move-message-body animation", buf, 0x16u);
      }
      id v7 = [(MFMessageContentView *)self quickReplyAnimationContext];
      __int16 v49 = [v7 backgroundSnapshot];

      uint64_t v8 = [(MFMessageContentView *)self quickReplyAnimationContext];
      id v9 = [v8 compositionSnapshot];

      id v10 = [(MFMessageContentView *)self quickReplyAnimationContext];
      id v11 = [v10 buttonsSnapshot];

      int v12 = [(MFMessageContentView *)self headerView];
      [v12 frame];
      int v14 = v13;
      __int16 v15 = [(MFMessageContentView *)self quickReplyAnimationContext];
      [v15 cornerRadius];
      unint64_t v48 = v16;

      [v9 frame];
      id v46 = v18;
      __int16 v47 = v17;
      unint64_t v20 = v19;
      double v22 = v21;
      [v11 frame];
      id v44 = v24;
      __int16 v45 = v23;
      __int16 v43 = v25;
      double v27 = v26;
      [v49 frame];
      int64_t v42 = v28;
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      [(MFMessageContentView *)self frame];
      id v34 = v33;
      id v35 = [(MFMessageContentView *)self moveMessageBodyPropertyAnimator];
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke;
      v56[3] = &unk_1E6D1B648;
      objc_copyWeak(v60, (id *)buf);
      id v36 = v11;
      id v57 = v36;
      v60[1] = v14;
      id v37 = v9;
      id v58 = v37;
      v60[2] = v20;
      *(double *)&v60[3] = *(double *)&v14 + -15.0 + v22;
      v60[4] = v47;
      v60[5] = v46;
      v60[6] = v45;
      *(double *)&v60[7] = *(double *)&v14 + -15.0 + v27;
      v60[8] = v44;
      v60[9] = v43;
      id v38 = v49;
      id v59 = v38;
      v60[10] = v42;
      v60[11] = v30;
      v60[12] = v32;
      v60[13] = v34;
      v60[14] = v48;
      [v35 addAnimations:v56];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_2;
      v53[3] = &unk_1E6D1AB90;
      id v39 = v12;
      id v54 = v39;
      id v40 = v38;
      id v55 = v40;
      [v35 addAnimations:v53 delayFactor:0.5];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      void v50[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_3;
      v50[3] = &unk_1E6D1B670;
      objc_copyWeak(&v52, (id *)buf);
      id v41 = v40;
      id v51 = v41;
      [v35 addCompletion:v50];
      [v35 startAnimation];

      objc_destroyWeak(&v52);
      objc_destroyWeak(v60);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [*(id *)(a1 + 32) setAlpha:0.0];
    int v3 = [v7 scrollView];
    [v3 contentInset];
    [v3 setContentInset:*(double *)(a1 + 64)];
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 CGPath];
    id v6 = [*(id *)(a1 + 48) layer];
    [v6 setShadowPath:v5];

    id WeakRetained = v7;
  }
}

uint64_t __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    [WeakRetained _updateWebViewPaddingConstants];
    [WeakRetained setHasCompletedMoveMessageBodyAnimation:1];
  }
}

- (void)_performQuickReplySnapshotFadeOutAnimationIfNecessary
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v3 = [(MFMessageContentView *)self quickReplyAnimationContext];
  int v4 = _os_feature_enabled_impl();
  if (v3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    id v6 = +[MFMessageContentView log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v31 = 2048;
      uint64_t v32 = self;
      _os_log_impl(&dword_1DDF5A000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply] Will perform quick-reply snapshot-fade-out animation", buf, 0x16u);
    }
    id v9 = [v3 compositionSnapshot];
    id v10 = objc_msgSend(v3, "buttonsSnapshot", v9);
    id v11 = [(MFMessageContentView *)self webView];
    int v12 = [(MFMessageContentView *)self moveMessageBodyPropertyAnimator];
    id v13 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    double v14 = *MEMORY[0x1E4F35148];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke;
    v27[3] = &unk_1E6D1AB90;
    id v15 = v9;
    id v28 = v15;
    id v16 = v11;
    id v29 = v16;
    __int16 v17 = (void *)[v13 initWithDuration:0 curve:v27 animations:v14];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_2;
    v22[3] = &unk_1E6D1B698;
    objc_copyWeak(&v26, (id *)buf);
    id v18 = v15;
    id v23 = v18;
    id v19 = v10;
    id v24 = v19;
    id v25 = v3;
    [v17 addCompletion:v22];
    if ([(MFMessageContentView *)self hasCompletedMoveMessageBodyAnimation])
    {
      [v17 startAnimation];
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_3;
      v20[3] = &unk_1E6D1B6C0;
      id v21 = v17;
      [v12 addCompletion:v20];
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

void __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    [a1[4] removeFromSuperview];
    [a1[5] removeFromSuperview];
    id v2 = [a1[6] completionBlock];
    v2[2]();

    [WeakRetained setQuickReplyAnimationContext:0];
  }
}

uint64_t __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAnimation];
}

- (void)removeQuickReplyAnimationContextIfNecessary
{
  int v3 = [(MFMessageContentView *)self quickReplyAnimationContext];
  if (v3)
  {
    id v13 = v3;
    int v4 = [v3 backgroundSnapshot];
    [v4 removeFromSuperview];

    int v5 = [v13 compositionSnapshot];
    [v5 removeFromSuperview];

    id v6 = [v13 buttonsSnapshot];
    [v6 removeFromSuperview];

    id v7 = [(MFMessageContentView *)self headerView];
    [v7 setAlpha:1.0];
    [v7 setHidden:0];
    uint64_t v8 = [(MFMessageContentView *)self webView];
    [v8 setAlpha:1.0];

    [v7 frame];
    double v10 = v9;
    id v11 = [(MFMessageContentView *)self scrollView];
    [v11 contentInset];
    [v11 setContentInset:v10];
    int v12 = [v13 completionBlock];
    v12[2]();

    [(MFMessageContentView *)self setQuickReplyAnimationContext:0];
    int v3 = v13;
  }
}

- (MFMessageContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMessageContentViewDelegate *)WeakRetained;
}

- (MFMessageContentViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (MFMessageContentViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (CGPoint)initialContentOffset
{
  double x = self->_initialContentOffset.x;
  double y = self->_initialContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialContentOffset:(CGPoint)a3
{
  self->_initialContentOffset = a3;
}

- (NSString)selectedHTML
{
  return self->_selectedHTML;
}

- (void)setSelectedHTML:(id)a3
{
}

- (MFMessageHeaderView)headerView
{
  return self->_headerView;
}

- (UIView)headerViewSubjectBlock
{
  return self->_headerViewSubjectBlock;
}

- (void)setHeaderViewSubjectBlock:(id)a3
{
}

- (BOOL)automaticallyCollapseQuotedContent
{
  return self->_automaticallyCollapseQuotedContent;
}

- (BOOL)showMessageFooter
{
  return self->_showMessageFooter;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  self->_shouldArchiveByDefault = a3;
}

- (int64_t)messageBlockingReason
{
  return self->_messageBlockingReason;
}

- (unint64_t)blockedContentTypes
{
  return self->_blockedContentTypes;
}

- (UIView)previousContentSnapshot
{
  return self->_previousContentSnapshot;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)initiallyZoomsToShowAllContent
{
  return self->_initiallyZoomsToShowAllContent;
}

- (void)setInitiallyZoomsToShowAllContent:(BOOL)a3
{
  self->_initiallyZoomsToShowAllContent = a3;
}

- (BOOL)suppressScrolling
{
  return self->_suppressScrolling;
}

- (BOOL)contentPaddingFollowsLayoutMargins
{
  return self->_contentPaddingFollowsLayoutMargins;
}

- (BOOL)hasVisibleContent
{
  return self->_hasVisibleContent;
}

- (BOOL)showsBanners
{
  return self->_showsBanners;
}

- (void)setShowsBanners:(BOOL)a3
{
  self->_showsBanners = a3;
}

- (BOOL)allowNotAuthenticatedBanner
{
  return self->_allowNotAuthenticatedBanner;
}

- (void)setAllowNotAuthenticatedBanner:(BOOL)a3
{
  self->_allowNotAuthenticatedBanner = a3;
}

- (BOOL)hideSenderSpecificBanners
{
  return self->_hideSenderSpecificBanners;
}

- (void)setHideSenderSpecificBanners:(BOOL)a3
{
  self->_hideSenderSpecificBanners = a3;
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabled = a3;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setMailboxProvider:(id)a3
{
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (MFAddressAtomStatusManager)atomManager
{
  return self->_atomManager;
}

- (void)setAtomManager:(id)a3
{
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 792, 1);
}

- (void)setAttachments:(id)a3
{
}

- (EFCancelable)loadingIndicatorCancelable
{
  return self->_loadingIndicatorCancelable;
}

- (void)setLoadingIndicatorCancelable:(id)a3
{
}

- (MFMessageContentLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (double)initialScale
{
  return self->_initialScale;
}

- (MFWebViewLoadingController)webViewLoadingController
{
  return self->_webViewLoadingController;
}

- (void)setWebViewLoadingController:(id)a3
{
}

- (NSDictionary)attachmentDragPreviews
{
  return self->_attachmentDragPreviews;
}

- (void)setAttachmentDragPreviews:(id)a3
{
}

- (BOOL)allowLoadOfBlockedMessageContent
{
  return self->_allowLoadOfBlockedMessageContent;
}

- (void)setAllowLoadOfBlockedMessageContent:(BOOL)a3
{
  self->_allowLoadOfBlockedMessageContent = a3;
}

- (NSError)contentRepresentationError
{
  return self->_contentRepresentationError;
}

- (void)setContentRepresentationError:(id)a3
{
}

- (BOOL)showingError
{
  return self->_showingError;
}

- (void)setShowingError:(BOOL)a3
{
  self->_showingError = a3;
}

- (EFCancelable)loadingSpinnerTailspinToken
{
  return self->_loadingSpinnerTailspinToken;
}

- (void)setLoadingSpinnerTailspinToken:(id)a3
{
}

- (EFScheduler)trustConfigurationScheduler
{
  return self->_trustConfigurationScheduler;
}

- (EMContentItem)contentItemForSaveMenu
{
  return self->_contentItemForSaveMenu;
}

- (void)setContentItemForSaveMenu:(id)a3
{
}

- (CGRect)contentItemRectForSaveMenu
{
  double x = self->_contentItemRectForSaveMenu.origin.x;
  double y = self->_contentItemRectForSaveMenu.origin.y;
  double width = self->_contentItemRectForSaveMenu.size.width;
  double height = self->_contentItemRectForSaveMenu.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentItemRectForSaveMenu:(CGRect)a3
{
  self->_contentItemRectForSaveMenu = a3;
}

- (MFQuickReplyAnimationContext)quickReplyAnimationContext
{
  return self->_quickReplyAnimationContext;
}

- (void)setQuickReplyAnimationContext:(id)a3
{
}

- (UIViewPropertyAnimator)moveMessageBodyPropertyAnimator
{
  return self->_moveMessageBodyPropertyAnimator;
}

- (void)setMoveMessageBodyPropertyAnimator:(id)a3
{
}

- (BOOL)hasCompletedMoveMessageBodyAnimation
{
  return self->_hasCompletedMoveMessageBodyAnimation;
}

- (void)setHasCompletedMoveMessageBodyAnimation:(BOOL)a3
{
  self->_hasCompletedMoveMessageBodyAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveMessageBodyPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_quickReplyAnimationContext, 0);
  objc_storeStrong((id *)&self->_contentItemForSaveMenu, 0);
  objc_storeStrong((id *)&self->_trustConfigurationScheduler, 0);
  objc_storeStrong((id *)&self->_loadingSpinnerTailspinToken, 0);
  objc_storeStrong((id *)&self->_contentRepresentationError, 0);
  objc_storeStrong((id *)&self->_attachmentDragPreviews, 0);
  objc_storeStrong((id *)&self->_webViewLoadingController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorCancelable, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_atomManager, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_previousContentSnapshot, 0);
  objc_storeStrong((id *)&self->_headerViewSubjectBlock, 0);
  objc_storeStrong((id *)&self->_selectedHTML, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastCrashDate, 0);
  objc_storeStrong((id *)&self->_failedProxyURLs, 0);
  objc_storeStrong((id *)&self->_allRemoteURLs, 0);
  objc_storeStrong((id *)&self->_inFlightURLs, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentSizeObservation, 0);
  objc_storeStrong((id *)&self->_presentedControllerDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_previousContentSnapshotWrapperView, 0);
  objc_storeStrong((id *)&self->_notAuthenticatedBanner, 0);
  objc_storeStrong((id *)&self->_loadFailedProxyContentBanner, 0);
  objc_storeStrong((id *)&self->_blockedSenderBanner, 0);
  objc_storeStrong((id *)&self->_loadImagesHeaderBlock, 0);
  objc_storeStrong((id *)&self->_hideMyEmailBanner, 0);
  objc_storeStrong((id *)&self->_loadHasMoreContentBanner, 0);
  objc_storeStrong((id *)&self->_mailDropBanner, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_relatedItemsHelper, 0);
  objc_storeStrong((id *)&self->_loadingCancelable, 0);
}

void __35__MFMessageContentView__commonInit__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "Got NULL value for SeeMoreButtonTappedWithYOffset", v1, 2u);
}

void __42__MFMessageContentView_setContentRequest___block_invoke_219_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DDF5A000, "<%{public}@: %p>: Skipping content request. Content representation is nil", v4, v5);
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  _os_log_fault_impl(&dword_1DDF5A000, v5, OS_LOG_TYPE_FAULT, "<%{public}@: %p>: Blocking file:// URL from web view.", v4, 0x16u);
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DDF5A000, "<%{public}@: %p>: Blocking file:// URL from web view.", v4, v5);
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DDF5A000, "<%{public}@: %p>: Blocking prefs: URL from web view.", v4, v5);
}

- (void)_attachmentPreviewsFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDF5A000, a2, OS_LOG_TYPE_ERROR, "Failed to decode attachment previews: %@", (uint8_t *)&v2, 0xCu);
}

@end