@interface NTPBEventObject
- (BOOL)hasAdCtaEngagement;
- (BOOL)hasAdEngagement;
- (BOOL)hasAdExposureIneligible;
- (BOOL)hasAdExposureOpportunity;
- (BOOL)hasAdImpression;
- (BOOL)hasAlreadySubscriberSignIn;
- (BOOL)hasAnfComponentExposure;
- (BOOL)hasAppSessionEnd;
- (BOOL)hasAppSessionEndWatch;
- (BOOL)hasAppSessionResign;
- (BOOL)hasAppSessionResume;
- (BOOL)hasAppSessionStart;
- (BOOL)hasAppSessionStartWatch;
- (BOOL)hasAppleidSignInResult;
- (BOOL)hasArticleEngagement;
- (BOOL)hasArticleFeedback;
- (BOOL)hasArticleHostViewExposure;
- (BOOL)hasArticleLikeDislike;
- (BOOL)hasArticleScroll;
- (BOOL)hasArticleScrollNotw;
- (BOOL)hasArticleSessionResign;
- (BOOL)hasArticleSessionResume;
- (BOOL)hasArticleViewNotw;
- (BOOL)hasArticleViewWatch;
- (BOOL)hasAudioEngage;
- (BOOL)hasAudioEngagementCompleted;
- (BOOL)hasBackgroundSubscriptionValidation;
- (BOOL)hasBundleIdMappingMiss;
- (BOOL)hasBundleSubscriberInfo;
- (BOOL)hasChannelMuteUnmute;
- (BOOL)hasComscoreEventSend;
- (BOOL)hasCoverArticleWidgetExposure;
- (BOOL)hasCoverArticleWidgetView;
- (BOOL)hasDiscoverMoreInterstitialExposure;
- (BOOL)hasEmailOptInInvite;
- (BOOL)hasEndOfArticleExposure;
- (BOOL)hasExternalAnalyticsEventSend;
- (BOOL)hasFeedCellExposure;
- (BOOL)hasFeedCellHostViewExposure;
- (BOOL)hasFeedEngagementMenuExposure;
- (BOOL)hasFeedLoad;
- (BOOL)hasFeedSubscribeUnsubscribe;
- (BOOL)hasFeedViewExposure;
- (BOOL)hasGroupViewExposure;
- (BOOL)hasInAppWebEmbedExposure;
- (BOOL)hasIssueDownload;
- (BOOL)hasIssueExposure;
- (BOOL)hasIssueTocView;
- (BOOL)hasLinkTap;
- (BOOL)hasLinkTapArticle;
- (BOOL)hasLocalNotificationReceived;
- (BOOL)hasLocalNotificationReturn;
- (BOOL)hasMediaEngage;
- (BOOL)hasMediaEngageComplete;
- (BOOL)hasMediaExposure;
- (BOOL)hasMediaView;
- (BOOL)hasNoUserAction;
- (BOOL)hasNotificationSettingsScreenView;
- (BOOL)hasNotificationSubscribeUnsubscribe;
- (BOOL)hasOptInButtonExposure;
- (BOOL)hasPaidSubscriptionConversionPointExposure;
- (BOOL)hasPaidSubscriptionResult;
- (BOOL)hasPaidSubscriptionSheetIapFail;
- (BOOL)hasPaidSubscriptionSheetView;
- (BOOL)hasPaywallButtonTap;
- (BOOL)hasPdfPageView;
- (BOOL)hasPullToRefresh;
- (BOOL)hasPurchaseOffersItem;
- (BOOL)hasReadingListAddRemove;
- (BOOL)hasReadingListShow;
- (BOOL)hasRecommendationBrickExposure;
- (BOOL)hasReportConcernSubmission;
- (BOOL)hasRestorePaidSubscription;
- (BOOL)hasSearchBegin;
- (BOOL)hasSearchExecute;
- (BOOL)hasSearchResultSelect;
- (BOOL)hasSearchViewExposure;
- (BOOL)hasShareInformationScreenView;
- (BOOL)hasShareResult;
- (BOOL)hasShareSheetExposure;
- (BOOL)hasShareSheetIapFail;
- (BOOL)hasSubscriptionDetectionScreenView;
- (BOOL)hasSuggestionsFeedback;
- (BOOL)hasTocCardDrag;
- (BOOL)hasTocCellExposure;
- (BOOL)hasTocExposure;
- (BOOL)hasTocHandleTap;
- (BOOL)hasTocReorder;
- (BOOL)hasTocToggleTap;
- (BOOL)hasTodayWidgetExposure;
- (BOOL)hasTodayWidgetHeadlineExposure;
- (BOOL)hasTodayWidgetSession;
- (BOOL)hasTopOfFeedModuleExposure;
- (BOOL)hasUrlMappingMiss;
- (BOOL)hasUserIgnoreFavoritesSuggestion;
- (BOOL)hasUserOnboardingBegin;
- (BOOL)hasUserOnboardingChannelPickerComplete;
- (BOOL)hasUserOnboardingResult;
- (BOOL)hasUserOnboardingResume;
- (BOOL)hasUserOnboardingScreenView;
- (BOOL)hasWebAccessScreenView;
- (BOOL)hasWidgetEngagement;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBAdCtaEngagement)adCtaEngagement;
- (NTPBAdEngagement)adEngagement;
- (NTPBAdExposureIneligible)adExposureIneligible;
- (NTPBAdExposureOpportunity)adExposureOpportunity;
- (NTPBAdImpression)adImpression;
- (NTPBAlreadySubscriberSignIn)alreadySubscriberSignIn;
- (NTPBAnfComponentExposure)anfComponentExposure;
- (NTPBAppSessionEnd)appSessionEnd;
- (NTPBAppSessionEndWatch)appSessionEndWatch;
- (NTPBAppSessionResign)appSessionResign;
- (NTPBAppSessionResume)appSessionResume;
- (NTPBAppSessionStart)appSessionStart;
- (NTPBAppSessionStartWatch)appSessionStartWatch;
- (NTPBAppleIdSignInResult)appleidSignInResult;
- (NTPBArticleEngagement)articleEngagement;
- (NTPBArticleFeedback)articleFeedback;
- (NTPBArticleHostViewExposure)articleHostViewExposure;
- (NTPBArticleLikeDislike)articleLikeDislike;
- (NTPBArticleScroll)articleScroll;
- (NTPBArticleScrollNotw)articleScrollNotw;
- (NTPBArticleSessionResign)articleSessionResign;
- (NTPBArticleSessionResume)articleSessionResume;
- (NTPBArticleViewNotw)articleViewNotw;
- (NTPBArticleViewWatch)articleViewWatch;
- (NTPBAudioEngage)audioEngage;
- (NTPBAudioEngagementCompleted)audioEngagementCompleted;
- (NTPBBackgroundSubscriptionValidation)backgroundSubscriptionValidation;
- (NTPBBundleIdMappingMiss)bundleIdMappingMiss;
- (NTPBBundleSubscriberInfo)bundleSubscriberInfo;
- (NTPBChannelMuteUnmute)channelMuteUnmute;
- (NTPBComscoreEventSend)comscoreEventSend;
- (NTPBCoverArticleWidgetExposure)coverArticleWidgetExposure;
- (NTPBCoverArticleWidgetView)coverArticleWidgetView;
- (NTPBDiscoverMoreInterstitialExposure)discoverMoreInterstitialExposure;
- (NTPBEmailOptInInvite)emailOptInInvite;
- (NTPBEndOfArticleExposure)endOfArticleExposure;
- (NTPBExternalAnalyticsEventSend)externalAnalyticsEventSend;
- (NTPBFeedCellExposure)feedCellExposure;
- (NTPBFeedCellHostViewExposure)feedCellHostViewExposure;
- (NTPBFeedEngagementMenuExposure)feedEngagementMenuExposure;
- (NTPBFeedLoad)feedLoad;
- (NTPBFeedSubscribeUnsubscribe)feedSubscribeUnsubscribe;
- (NTPBFeedViewExposure)feedViewExposure;
- (NTPBGroupViewExposure)groupViewExposure;
- (NTPBInAppWebEmbedExposure)inAppWebEmbedExposure;
- (NTPBIssueDownload)issueDownload;
- (NTPBIssueExposure)issueExposure;
- (NTPBIssueTocView)issueTocView;
- (NTPBLinkTap)linkTap;
- (NTPBLinkTapArticle)linkTapArticle;
- (NTPBLocalNotificationReceived)localNotificationReceived;
- (NTPBLocalNotificationReturn)localNotificationReturn;
- (NTPBMediaEngage)mediaEngage;
- (NTPBMediaEngageComplete)mediaEngageComplete;
- (NTPBMediaExposure)mediaExposure;
- (NTPBMediaView)mediaView;
- (NTPBNoUserAction)noUserAction;
- (NTPBNotificationSettingsScreenView)notificationSettingsScreenView;
- (NTPBNotificationSubscribeUnsubscribe)notificationSubscribeUnsubscribe;
- (NTPBOptInButtonExposure)optInButtonExposure;
- (NTPBPDFPageView)pdfPageView;
- (NTPBPaidSubscriptionConversionPointExposure)paidSubscriptionConversionPointExposure;
- (NTPBPaidSubscriptionResult)paidSubscriptionResult;
- (NTPBPaidSubscriptionSheetIapFail)paidSubscriptionSheetIapFail;
- (NTPBPaidSubscriptionSheetView)paidSubscriptionSheetView;
- (NTPBPaywallButtonTap)paywallButtonTap;
- (NTPBPullToRefresh)pullToRefresh;
- (NTPBPurchaseOffersItem)purchaseOffersItem;
- (NTPBReadingListAddRemove)readingListAddRemove;
- (NTPBReadingListShow)readingListShow;
- (NTPBRecommendationBrickExposure)recommendationBrickExposure;
- (NTPBReportConcernSubmission)reportConcernSubmission;
- (NTPBRestorePaidSubscription)restorePaidSubscription;
- (NTPBSearchBegin)searchBegin;
- (NTPBSearchExecute)searchExecute;
- (NTPBSearchResultSelect)searchResultSelect;
- (NTPBSearchViewExposure)searchViewExposure;
- (NTPBShareInformationScreenView)shareInformationScreenView;
- (NTPBShareResult)shareResult;
- (NTPBShareSheetExposure)shareSheetExposure;
- (NTPBShareSheetIapFail)shareSheetIapFail;
- (NTPBSubscriptionDetectionScreenView)subscriptionDetectionScreenView;
- (NTPBSuggestionsFeedback)suggestionsFeedback;
- (NTPBTocCardDrag)tocCardDrag;
- (NTPBTocCellExposure)tocCellExposure;
- (NTPBTocExposure)tocExposure;
- (NTPBTocHandleTap)tocHandleTap;
- (NTPBTocReorder)tocReorder;
- (NTPBTocToggleTap)tocToggleTap;
- (NTPBTodayWidgetExposure)todayWidgetExposure;
- (NTPBTodayWidgetHeadlineExposure)todayWidgetHeadlineExposure;
- (NTPBTodayWidgetSession)todayWidgetSession;
- (NTPBTopOfFeedModuleExposure)topOfFeedModuleExposure;
- (NTPBUrlMappingMiss)urlMappingMiss;
- (NTPBUserIgnoreFavoritesSuggestion)userIgnoreFavoritesSuggestion;
- (NTPBUserOnboardingBegin)userOnboardingBegin;
- (NTPBUserOnboardingChannelPickerComplete)userOnboardingChannelPickerComplete;
- (NTPBUserOnboardingResult)userOnboardingResult;
- (NTPBUserOnboardingResume)userOnboardingResume;
- (NTPBUserOnboardingScreenView)userOnboardingScreenView;
- (NTPBWebAccessScreenView)webAccessScreenView;
- (NTPBWidgetEngagement)widgetEngagement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdCtaEngagement:(id)a3;
- (void)setAdEngagement:(id)a3;
- (void)setAdExposureIneligible:(id)a3;
- (void)setAdExposureOpportunity:(id)a3;
- (void)setAdImpression:(id)a3;
- (void)setAlreadySubscriberSignIn:(id)a3;
- (void)setAnfComponentExposure:(id)a3;
- (void)setAppSessionEnd:(id)a3;
- (void)setAppSessionEndWatch:(id)a3;
- (void)setAppSessionResign:(id)a3;
- (void)setAppSessionResume:(id)a3;
- (void)setAppSessionStart:(id)a3;
- (void)setAppSessionStartWatch:(id)a3;
- (void)setAppleidSignInResult:(id)a3;
- (void)setArticleEngagement:(id)a3;
- (void)setArticleFeedback:(id)a3;
- (void)setArticleHostViewExposure:(id)a3;
- (void)setArticleLikeDislike:(id)a3;
- (void)setArticleScroll:(id)a3;
- (void)setArticleScrollNotw:(id)a3;
- (void)setArticleSessionResign:(id)a3;
- (void)setArticleSessionResume:(id)a3;
- (void)setArticleViewNotw:(id)a3;
- (void)setArticleViewWatch:(id)a3;
- (void)setAudioEngage:(id)a3;
- (void)setAudioEngagementCompleted:(id)a3;
- (void)setBackgroundSubscriptionValidation:(id)a3;
- (void)setBundleIdMappingMiss:(id)a3;
- (void)setBundleSubscriberInfo:(id)a3;
- (void)setChannelMuteUnmute:(id)a3;
- (void)setComscoreEventSend:(id)a3;
- (void)setCoverArticleWidgetExposure:(id)a3;
- (void)setCoverArticleWidgetView:(id)a3;
- (void)setDiscoverMoreInterstitialExposure:(id)a3;
- (void)setEmailOptInInvite:(id)a3;
- (void)setEndOfArticleExposure:(id)a3;
- (void)setExternalAnalyticsEventSend:(id)a3;
- (void)setFeedCellExposure:(id)a3;
- (void)setFeedCellHostViewExposure:(id)a3;
- (void)setFeedEngagementMenuExposure:(id)a3;
- (void)setFeedLoad:(id)a3;
- (void)setFeedSubscribeUnsubscribe:(id)a3;
- (void)setFeedViewExposure:(id)a3;
- (void)setGroupViewExposure:(id)a3;
- (void)setInAppWebEmbedExposure:(id)a3;
- (void)setIssueDownload:(id)a3;
- (void)setIssueExposure:(id)a3;
- (void)setIssueTocView:(id)a3;
- (void)setLinkTap:(id)a3;
- (void)setLinkTapArticle:(id)a3;
- (void)setLocalNotificationReceived:(id)a3;
- (void)setLocalNotificationReturn:(id)a3;
- (void)setMediaEngage:(id)a3;
- (void)setMediaEngageComplete:(id)a3;
- (void)setMediaExposure:(id)a3;
- (void)setMediaView:(id)a3;
- (void)setNoUserAction:(id)a3;
- (void)setNotificationSettingsScreenView:(id)a3;
- (void)setNotificationSubscribeUnsubscribe:(id)a3;
- (void)setOptInButtonExposure:(id)a3;
- (void)setPaidSubscriptionConversionPointExposure:(id)a3;
- (void)setPaidSubscriptionResult:(id)a3;
- (void)setPaidSubscriptionSheetIapFail:(id)a3;
- (void)setPaidSubscriptionSheetView:(id)a3;
- (void)setPaywallButtonTap:(id)a3;
- (void)setPdfPageView:(id)a3;
- (void)setPullToRefresh:(id)a3;
- (void)setPurchaseOffersItem:(id)a3;
- (void)setReadingListAddRemove:(id)a3;
- (void)setReadingListShow:(id)a3;
- (void)setRecommendationBrickExposure:(id)a3;
- (void)setReportConcernSubmission:(id)a3;
- (void)setRestorePaidSubscription:(id)a3;
- (void)setSearchBegin:(id)a3;
- (void)setSearchExecute:(id)a3;
- (void)setSearchResultSelect:(id)a3;
- (void)setSearchViewExposure:(id)a3;
- (void)setShareInformationScreenView:(id)a3;
- (void)setShareResult:(id)a3;
- (void)setShareSheetExposure:(id)a3;
- (void)setShareSheetIapFail:(id)a3;
- (void)setSubscriptionDetectionScreenView:(id)a3;
- (void)setSuggestionsFeedback:(id)a3;
- (void)setTocCardDrag:(id)a3;
- (void)setTocCellExposure:(id)a3;
- (void)setTocExposure:(id)a3;
- (void)setTocHandleTap:(id)a3;
- (void)setTocReorder:(id)a3;
- (void)setTocToggleTap:(id)a3;
- (void)setTodayWidgetExposure:(id)a3;
- (void)setTodayWidgetHeadlineExposure:(id)a3;
- (void)setTodayWidgetSession:(id)a3;
- (void)setTopOfFeedModuleExposure:(id)a3;
- (void)setUrlMappingMiss:(id)a3;
- (void)setUserIgnoreFavoritesSuggestion:(id)a3;
- (void)setUserOnboardingBegin:(id)a3;
- (void)setUserOnboardingChannelPickerComplete:(id)a3;
- (void)setUserOnboardingResult:(id)a3;
- (void)setUserOnboardingResume:(id)a3;
- (void)setUserOnboardingScreenView:(id)a3;
- (void)setWebAccessScreenView:(id)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEventObject

- (BOOL)hasUserOnboardingBegin
{
  return self->_userOnboardingBegin != 0;
}

- (BOOL)hasUserOnboardingResume
{
  return self->_userOnboardingResume != 0;
}

- (BOOL)hasUserOnboardingResult
{
  return self->_userOnboardingResult != 0;
}

- (BOOL)hasAppSessionStart
{
  return self->_appSessionStart != 0;
}

- (BOOL)hasAppSessionEnd
{
  return self->_appSessionEnd != 0;
}

- (BOOL)hasArticleScroll
{
  return self->_articleScroll != 0;
}

- (BOOL)hasArticleHostViewExposure
{
  return self->_articleHostViewExposure != 0;
}

- (BOOL)hasArticleLikeDislike
{
  return self->_articleLikeDislike != 0;
}

- (BOOL)hasFeedCellExposure
{
  return self->_feedCellExposure != 0;
}

- (BOOL)hasFeedViewExposure
{
  return self->_feedViewExposure != 0;
}

- (BOOL)hasFeedCellHostViewExposure
{
  return self->_feedCellHostViewExposure != 0;
}

- (BOOL)hasFeedSubscribeUnsubscribe
{
  return self->_feedSubscribeUnsubscribe != 0;
}

- (BOOL)hasMediaExposure
{
  return self->_mediaExposure != 0;
}

- (BOOL)hasMediaView
{
  return self->_mediaView != 0;
}

- (BOOL)hasMediaEngage
{
  return self->_mediaEngage != 0;
}

- (BOOL)hasMediaEngageComplete
{
  return self->_mediaEngageComplete != 0;
}

- (BOOL)hasSearchBegin
{
  return self->_searchBegin != 0;
}

- (BOOL)hasSearchExecute
{
  return self->_searchExecute != 0;
}

- (BOOL)hasSearchResultSelect
{
  return self->_searchResultSelect != 0;
}

- (BOOL)hasShareResult
{
  return self->_shareResult != 0;
}

- (BOOL)hasNoUserAction
{
  return self->_noUserAction != 0;
}

- (BOOL)hasReadingListAddRemove
{
  return self->_readingListAddRemove != 0;
}

- (BOOL)hasReadingListShow
{
  return self->_readingListShow != 0;
}

- (BOOL)hasRecommendationBrickExposure
{
  return self->_recommendationBrickExposure != 0;
}

- (BOOL)hasEndOfArticleExposure
{
  return self->_endOfArticleExposure != 0;
}

- (BOOL)hasReportConcernSubmission
{
  return self->_reportConcernSubmission != 0;
}

- (BOOL)hasLocalNotificationReturn
{
  return self->_localNotificationReturn != 0;
}

- (BOOL)hasPullToRefresh
{
  return self->_pullToRefresh != 0;
}

- (BOOL)hasLinkTapArticle
{
  return self->_linkTapArticle != 0;
}

- (BOOL)hasLocalNotificationReceived
{
  return self->_localNotificationReceived != 0;
}

- (BOOL)hasUserOnboardingScreenView
{
  return self->_userOnboardingScreenView != 0;
}

- (BOOL)hasUserOnboardingChannelPickerComplete
{
  return self->_userOnboardingChannelPickerComplete != 0;
}

- (BOOL)hasAdExposureOpportunity
{
  return self->_adExposureOpportunity != 0;
}

- (BOOL)hasChannelMuteUnmute
{
  return self->_channelMuteUnmute != 0;
}

- (BOOL)hasShareSheetExposure
{
  return self->_shareSheetExposure != 0;
}

- (BOOL)hasFeedEngagementMenuExposure
{
  return self->_feedEngagementMenuExposure != 0;
}

- (BOOL)hasSearchViewExposure
{
  return self->_searchViewExposure != 0;
}

- (BOOL)hasGroupViewExposure
{
  return self->_groupViewExposure != 0;
}

- (BOOL)hasPaidSubscriptionConversionPointExposure
{
  return self->_paidSubscriptionConversionPointExposure != 0;
}

- (BOOL)hasPaidSubscriptionSheetView
{
  return self->_paidSubscriptionSheetView != 0;
}

- (BOOL)hasShareSheetIapFail
{
  return self->_shareSheetIapFail != 0;
}

- (BOOL)hasPaidSubscriptionResult
{
  return self->_paidSubscriptionResult != 0;
}

- (BOOL)hasShareInformationScreenView
{
  return self->_shareInformationScreenView != 0;
}

- (BOOL)hasWebAccessScreenView
{
  return self->_webAccessScreenView != 0;
}

- (BOOL)hasAlreadySubscriberSignIn
{
  return self->_alreadySubscriberSignIn != 0;
}

- (BOOL)hasBackgroundSubscriptionValidation
{
  return self->_backgroundSubscriptionValidation != 0;
}

- (BOOL)hasSubscriptionDetectionScreenView
{
  return self->_subscriptionDetectionScreenView != 0;
}

- (BOOL)hasCoverArticleWidgetView
{
  return self->_coverArticleWidgetView != 0;
}

- (BOOL)hasNotificationSubscribeUnsubscribe
{
  return self->_notificationSubscribeUnsubscribe != 0;
}

- (BOOL)hasNotificationSettingsScreenView
{
  return self->_notificationSettingsScreenView != 0;
}

- (BOOL)hasEmailOptInInvite
{
  return self->_emailOptInInvite != 0;
}

- (BOOL)hasCoverArticleWidgetExposure
{
  return self->_coverArticleWidgetExposure != 0;
}

- (BOOL)hasRestorePaidSubscription
{
  return self->_restorePaidSubscription != 0;
}

- (BOOL)hasPaidSubscriptionSheetIapFail
{
  return self->_paidSubscriptionSheetIapFail != 0;
}

- (BOOL)hasComscoreEventSend
{
  return self->_comscoreEventSend != 0;
}

- (BOOL)hasDiscoverMoreInterstitialExposure
{
  return self->_discoverMoreInterstitialExposure != 0;
}

- (BOOL)hasArticleViewNotw
{
  return self->_articleViewNotw != 0;
}

- (BOOL)hasArticleScrollNotw
{
  return self->_articleScrollNotw != 0;
}

- (BOOL)hasUrlMappingMiss
{
  return self->_urlMappingMiss != 0;
}

- (BOOL)hasBundleIdMappingMiss
{
  return self->_bundleIdMappingMiss != 0;
}

- (BOOL)hasExternalAnalyticsEventSend
{
  return self->_externalAnalyticsEventSend != 0;
}

- (BOOL)hasAppSessionStartWatch
{
  return self->_appSessionStartWatch != 0;
}

- (BOOL)hasArticleViewWatch
{
  return self->_articleViewWatch != 0;
}

- (BOOL)hasAppSessionEndWatch
{
  return self->_appSessionEndWatch != 0;
}

- (BOOL)hasAnfComponentExposure
{
  return self->_anfComponentExposure != 0;
}

- (BOOL)hasTodayWidgetSession
{
  return self->_todayWidgetSession != 0;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (BOOL)hasTodayWidgetHeadlineExposure
{
  return self->_todayWidgetHeadlineExposure != 0;
}

- (BOOL)hasTodayWidgetExposure
{
  return self->_todayWidgetExposure != 0;
}

- (BOOL)hasAdExposureIneligible
{
  return self->_adExposureIneligible != 0;
}

- (BOOL)hasOptInButtonExposure
{
  return self->_optInButtonExposure != 0;
}

- (BOOL)hasSuggestionsFeedback
{
  return self->_suggestionsFeedback != 0;
}

- (BOOL)hasUserIgnoreFavoritesSuggestion
{
  return self->_userIgnoreFavoritesSuggestion != 0;
}

- (BOOL)hasArticleEngagement
{
  return self->_articleEngagement != 0;
}

- (BOOL)hasAdImpression
{
  return self->_adImpression != 0;
}

- (BOOL)hasAdEngagement
{
  return self->_adEngagement != 0;
}

- (BOOL)hasAdCtaEngagement
{
  return self->_adCtaEngagement != 0;
}

- (BOOL)hasLinkTap
{
  return self->_linkTap != 0;
}

- (BOOL)hasTopOfFeedModuleExposure
{
  return self->_topOfFeedModuleExposure != 0;
}

- (BOOL)hasInAppWebEmbedExposure
{
  return self->_inAppWebEmbedExposure != 0;
}

- (BOOL)hasTocExposure
{
  return self->_tocExposure != 0;
}

- (BOOL)hasTocReorder
{
  return self->_tocReorder != 0;
}

- (BOOL)hasTocHandleTap
{
  return self->_tocHandleTap != 0;
}

- (BOOL)hasTocCardDrag
{
  return self->_tocCardDrag != 0;
}

- (BOOL)hasTocToggleTap
{
  return self->_tocToggleTap != 0;
}

- (BOOL)hasTocCellExposure
{
  return self->_tocCellExposure != 0;
}

- (BOOL)hasAppSessionResign
{
  return self->_appSessionResign != 0;
}

- (BOOL)hasAppSessionResume
{
  return self->_appSessionResume != 0;
}

- (BOOL)hasArticleSessionResign
{
  return self->_articleSessionResign != 0;
}

- (BOOL)hasArticleSessionResume
{
  return self->_articleSessionResume != 0;
}

- (BOOL)hasBundleSubscriberInfo
{
  return self->_bundleSubscriberInfo != 0;
}

- (BOOL)hasIssueDownload
{
  return self->_issueDownload != 0;
}

- (BOOL)hasPaywallButtonTap
{
  return self->_paywallButtonTap != 0;
}

- (BOOL)hasPdfPageView
{
  return self->_pdfPageView != 0;
}

- (BOOL)hasIssueTocView
{
  return self->_issueTocView != 0;
}

- (BOOL)hasIssueExposure
{
  return self->_issueExposure != 0;
}

- (BOOL)hasAppleidSignInResult
{
  return self->_appleidSignInResult != 0;
}

- (BOOL)hasArticleFeedback
{
  return self->_articleFeedback != 0;
}

- (BOOL)hasAudioEngage
{
  return self->_audioEngage != 0;
}

- (BOOL)hasAudioEngagementCompleted
{
  return self->_audioEngagementCompleted != 0;
}

- (BOOL)hasPurchaseOffersItem
{
  return self->_purchaseOffersItem != 0;
}

- (BOOL)hasFeedLoad
{
  return self->_feedLoad != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEventObject;
  v4 = [(NTPBEventObject *)&v8 description];
  v5 = [(NTPBEventObject *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  userOnboardingBegin = self->_userOnboardingBegin;
  if (userOnboardingBegin)
  {
    v5 = [(NTPBUserOnboardingBegin *)userOnboardingBegin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"user_onboarding_begin"];
  }
  userOnboardingResume = self->_userOnboardingResume;
  if (userOnboardingResume)
  {
    v7 = [(NTPBUserOnboardingResume *)userOnboardingResume dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"user_onboarding_resume"];
  }
  userOnboardingResult = self->_userOnboardingResult;
  if (userOnboardingResult)
  {
    v9 = [(NTPBUserOnboardingResult *)userOnboardingResult dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"user_onboarding_result"];
  }
  appSessionStart = self->_appSessionStart;
  if (appSessionStart)
  {
    v11 = [(NTPBAppSessionStart *)appSessionStart dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"app_session_start"];
  }
  appSessionEnd = self->_appSessionEnd;
  if (appSessionEnd)
  {
    v13 = [(NTPBAppSessionEnd *)appSessionEnd dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"app_session_end"];
  }
  articleScroll = self->_articleScroll;
  if (articleScroll)
  {
    v15 = [(NTPBArticleScroll *)articleScroll dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"article_scroll"];
  }
  articleHostViewExposure = self->_articleHostViewExposure;
  if (articleHostViewExposure)
  {
    v17 = [(NTPBArticleHostViewExposure *)articleHostViewExposure dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"article_host_view_exposure"];
  }
  articleLikeDislike = self->_articleLikeDislike;
  if (articleLikeDislike)
  {
    v19 = [(NTPBArticleLikeDislike *)articleLikeDislike dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"article_like_dislike"];
  }
  feedCellExposure = self->_feedCellExposure;
  if (feedCellExposure)
  {
    v21 = [(NTPBFeedCellExposure *)feedCellExposure dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"feed_cell_exposure"];
  }
  feedViewExposure = self->_feedViewExposure;
  if (feedViewExposure)
  {
    v23 = [(NTPBFeedViewExposure *)feedViewExposure dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"feed_view_exposure"];
  }
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  if (feedCellHostViewExposure)
  {
    v25 = [(NTPBFeedCellHostViewExposure *)feedCellHostViewExposure dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"feed_cell_host_view_exposure"];
  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  if (feedSubscribeUnsubscribe)
  {
    v27 = [(NTPBFeedSubscribeUnsubscribe *)feedSubscribeUnsubscribe dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"feed_subscribe_unsubscribe"];
  }
  mediaExposure = self->_mediaExposure;
  if (mediaExposure)
  {
    v29 = [(NTPBMediaExposure *)mediaExposure dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"media_exposure"];
  }
  mediaView = self->_mediaView;
  if (mediaView)
  {
    v31 = [(NTPBMediaView *)mediaView dictionaryRepresentation];
    [v3 setObject:v31 forKey:@"media_view"];
  }
  mediaEngage = self->_mediaEngage;
  if (mediaEngage)
  {
    v33 = [(NTPBMediaEngage *)mediaEngage dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"media_engage"];
  }
  mediaEngageComplete = self->_mediaEngageComplete;
  if (mediaEngageComplete)
  {
    v35 = [(NTPBMediaEngageComplete *)mediaEngageComplete dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"media_engage_complete"];
  }
  searchBegin = self->_searchBegin;
  if (searchBegin)
  {
    v37 = [(NTPBSearchBegin *)searchBegin dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"search_begin"];
  }
  searchExecute = self->_searchExecute;
  if (searchExecute)
  {
    v39 = [(NTPBSearchExecute *)searchExecute dictionaryRepresentation];
    [v3 setObject:v39 forKey:@"search_execute"];
  }
  searchResultSelect = self->_searchResultSelect;
  if (searchResultSelect)
  {
    v41 = [(NTPBSearchResultSelect *)searchResultSelect dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"search_result_select"];
  }
  shareResult = self->_shareResult;
  if (shareResult)
  {
    v43 = [(NTPBShareResult *)shareResult dictionaryRepresentation];
    [v3 setObject:v43 forKey:@"share_result"];
  }
  noUserAction = self->_noUserAction;
  if (noUserAction)
  {
    v45 = [(NTPBNoUserAction *)noUserAction dictionaryRepresentation];
    [v3 setObject:v45 forKey:@"no_user_action"];
  }
  readingListAddRemove = self->_readingListAddRemove;
  if (readingListAddRemove)
  {
    v47 = [(NTPBReadingListAddRemove *)readingListAddRemove dictionaryRepresentation];
    [v3 setObject:v47 forKey:@"reading_list_add_remove"];
  }
  readingListShow = self->_readingListShow;
  if (readingListShow)
  {
    v49 = [(NTPBReadingListShow *)readingListShow dictionaryRepresentation];
    [v3 setObject:v49 forKey:@"reading_list_show"];
  }
  recommendationBrickExposure = self->_recommendationBrickExposure;
  if (recommendationBrickExposure)
  {
    v51 = [(NTPBRecommendationBrickExposure *)recommendationBrickExposure dictionaryRepresentation];
    [v3 setObject:v51 forKey:@"recommendation_brick_exposure"];
  }
  endOfArticleExposure = self->_endOfArticleExposure;
  if (endOfArticleExposure)
  {
    v53 = [(NTPBEndOfArticleExposure *)endOfArticleExposure dictionaryRepresentation];
    [v3 setObject:v53 forKey:@"end_of_article_exposure"];
  }
  reportConcernSubmission = self->_reportConcernSubmission;
  if (reportConcernSubmission)
  {
    v55 = [(NTPBReportConcernSubmission *)reportConcernSubmission dictionaryRepresentation];
    [v3 setObject:v55 forKey:@"report_concern_submission"];
  }
  localNotificationReturn = self->_localNotificationReturn;
  if (localNotificationReturn)
  {
    v57 = [(NTPBLocalNotificationReturn *)localNotificationReturn dictionaryRepresentation];
    [v3 setObject:v57 forKey:@"local_notification_return"];
  }
  pullToRefresh = self->_pullToRefresh;
  if (pullToRefresh)
  {
    v59 = [(NTPBPullToRefresh *)pullToRefresh dictionaryRepresentation];
    [v3 setObject:v59 forKey:@"pull_to_refresh"];
  }
  linkTapArticle = self->_linkTapArticle;
  if (linkTapArticle)
  {
    v61 = [(NTPBLinkTapArticle *)linkTapArticle dictionaryRepresentation];
    [v3 setObject:v61 forKey:@"link_tap_article"];
  }
  localNotificationReceived = self->_localNotificationReceived;
  if (localNotificationReceived)
  {
    v63 = [(NTPBLocalNotificationReceived *)localNotificationReceived dictionaryRepresentation];
    [v3 setObject:v63 forKey:@"local_notification_received"];
  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  if (userOnboardingScreenView)
  {
    v65 = [(NTPBUserOnboardingScreenView *)userOnboardingScreenView dictionaryRepresentation];
    [v3 setObject:v65 forKey:@"user_onboarding_screen_view"];
  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  if (userOnboardingChannelPickerComplete)
  {
    v67 = [(NTPBUserOnboardingChannelPickerComplete *)userOnboardingChannelPickerComplete dictionaryRepresentation];
    [v3 setObject:v67 forKey:@"user_onboarding_channel_picker_complete"];
  }
  adExposureOpportunity = self->_adExposureOpportunity;
  if (adExposureOpportunity)
  {
    v69 = [(NTPBAdExposureOpportunity *)adExposureOpportunity dictionaryRepresentation];
    [v3 setObject:v69 forKey:@"ad_exposure_opportunity"];
  }
  channelMuteUnmute = self->_channelMuteUnmute;
  if (channelMuteUnmute)
  {
    v71 = [(NTPBChannelMuteUnmute *)channelMuteUnmute dictionaryRepresentation];
    [v3 setObject:v71 forKey:@"channel_mute_unmute"];
  }
  shareSheetExposure = self->_shareSheetExposure;
  if (shareSheetExposure)
  {
    v73 = [(NTPBShareSheetExposure *)shareSheetExposure dictionaryRepresentation];
    [v3 setObject:v73 forKey:@"share_sheet_exposure"];
  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  if (feedEngagementMenuExposure)
  {
    v75 = [(NTPBFeedEngagementMenuExposure *)feedEngagementMenuExposure dictionaryRepresentation];
    [v3 setObject:v75 forKey:@"feed_engagement_menu_exposure"];
  }
  searchViewExposure = self->_searchViewExposure;
  if (searchViewExposure)
  {
    v77 = [(NTPBSearchViewExposure *)searchViewExposure dictionaryRepresentation];
    [v3 setObject:v77 forKey:@"search_view_exposure"];
  }
  groupViewExposure = self->_groupViewExposure;
  if (groupViewExposure)
  {
    v79 = [(NTPBGroupViewExposure *)groupViewExposure dictionaryRepresentation];
    [v3 setObject:v79 forKey:@"group_view_exposure"];
  }
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  if (paidSubscriptionConversionPointExposure)
  {
    v81 = [(NTPBPaidSubscriptionConversionPointExposure *)paidSubscriptionConversionPointExposure dictionaryRepresentation];
    [v3 setObject:v81 forKey:@"paid_subscription_conversion_point_exposure"];
  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  if (paidSubscriptionSheetView)
  {
    v83 = [(NTPBPaidSubscriptionSheetView *)paidSubscriptionSheetView dictionaryRepresentation];
    [v3 setObject:v83 forKey:@"paid_subscription_sheet_view"];
  }
  shareSheetIapFail = self->_shareSheetIapFail;
  if (shareSheetIapFail)
  {
    v85 = [(NTPBShareSheetIapFail *)shareSheetIapFail dictionaryRepresentation];
    [v3 setObject:v85 forKey:@"share_sheet_iap_fail"];
  }
  paidSubscriptionResult = self->_paidSubscriptionResult;
  if (paidSubscriptionResult)
  {
    v87 = [(NTPBPaidSubscriptionResult *)paidSubscriptionResult dictionaryRepresentation];
    [v3 setObject:v87 forKey:@"paid_subscription_result"];
  }
  shareInformationScreenView = self->_shareInformationScreenView;
  if (shareInformationScreenView)
  {
    v89 = [(NTPBShareInformationScreenView *)shareInformationScreenView dictionaryRepresentation];
    [v3 setObject:v89 forKey:@"share_information_screen_view"];
  }
  webAccessScreenView = self->_webAccessScreenView;
  if (webAccessScreenView)
  {
    v91 = [(NTPBWebAccessScreenView *)webAccessScreenView dictionaryRepresentation];
    [v3 setObject:v91 forKey:@"web_access_screen_view"];
  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  if (alreadySubscriberSignIn)
  {
    v93 = [(NTPBAlreadySubscriberSignIn *)alreadySubscriberSignIn dictionaryRepresentation];
    [v3 setObject:v93 forKey:@"already_subscriber_sign_in"];
  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  if (backgroundSubscriptionValidation)
  {
    v95 = [(NTPBBackgroundSubscriptionValidation *)backgroundSubscriptionValidation dictionaryRepresentation];
    [v3 setObject:v95 forKey:@"background_subscription_validation"];
  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  if (subscriptionDetectionScreenView)
  {
    v97 = [(NTPBSubscriptionDetectionScreenView *)subscriptionDetectionScreenView dictionaryRepresentation];
    [v3 setObject:v97 forKey:@"subscription_detection_screen_view"];
  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  if (coverArticleWidgetView)
  {
    v99 = [(NTPBCoverArticleWidgetView *)coverArticleWidgetView dictionaryRepresentation];
    [v3 setObject:v99 forKey:@"cover_article_widget_view"];
  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  if (notificationSubscribeUnsubscribe)
  {
    v101 = [(NTPBNotificationSubscribeUnsubscribe *)notificationSubscribeUnsubscribe dictionaryRepresentation];
    [v3 setObject:v101 forKey:@"notification_subscribe_unsubscribe"];
  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  if (notificationSettingsScreenView)
  {
    v103 = [(NTPBNotificationSettingsScreenView *)notificationSettingsScreenView dictionaryRepresentation];
    [v3 setObject:v103 forKey:@"notification_settings_screen_view"];
  }
  emailOptInInvite = self->_emailOptInInvite;
  if (emailOptInInvite)
  {
    v105 = [(NTPBEmailOptInInvite *)emailOptInInvite dictionaryRepresentation];
    [v3 setObject:v105 forKey:@"email_opt_in_invite"];
  }
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  if (coverArticleWidgetExposure)
  {
    v107 = [(NTPBCoverArticleWidgetExposure *)coverArticleWidgetExposure dictionaryRepresentation];
    [v3 setObject:v107 forKey:@"cover_article_widget_exposure"];
  }
  restorePaidSubscription = self->_restorePaidSubscription;
  if (restorePaidSubscription)
  {
    v109 = [(NTPBRestorePaidSubscription *)restorePaidSubscription dictionaryRepresentation];
    [v3 setObject:v109 forKey:@"restore_paid_subscription"];
  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  if (paidSubscriptionSheetIapFail)
  {
    v111 = [(NTPBPaidSubscriptionSheetIapFail *)paidSubscriptionSheetIapFail dictionaryRepresentation];
    [v3 setObject:v111 forKey:@"paid_subscription_sheet_iap_fail"];
  }
  comscoreEventSend = self->_comscoreEventSend;
  if (comscoreEventSend)
  {
    v113 = [(NTPBComscoreEventSend *)comscoreEventSend dictionaryRepresentation];
    [v3 setObject:v113 forKey:@"comscore_event_send"];
  }
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  if (discoverMoreInterstitialExposure)
  {
    v115 = [(NTPBDiscoverMoreInterstitialExposure *)discoverMoreInterstitialExposure dictionaryRepresentation];
    [v3 setObject:v115 forKey:@"discover_more_interstitial_exposure"];
  }
  articleViewNotw = self->_articleViewNotw;
  if (articleViewNotw)
  {
    v117 = [(NTPBArticleViewNotw *)articleViewNotw dictionaryRepresentation];
    [v3 setObject:v117 forKey:@"article_view_notw"];
  }
  articleScrollNotw = self->_articleScrollNotw;
  if (articleScrollNotw)
  {
    v119 = [(NTPBArticleScrollNotw *)articleScrollNotw dictionaryRepresentation];
    [v3 setObject:v119 forKey:@"article_scroll_notw"];
  }
  urlMappingMiss = self->_urlMappingMiss;
  if (urlMappingMiss)
  {
    v121 = [(NTPBUrlMappingMiss *)urlMappingMiss dictionaryRepresentation];
    [v3 setObject:v121 forKey:@"url_mapping_miss"];
  }
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  if (bundleIdMappingMiss)
  {
    v123 = [(NTPBBundleIdMappingMiss *)bundleIdMappingMiss dictionaryRepresentation];
    [v3 setObject:v123 forKey:@"bundle_id_mapping_miss"];
  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  if (externalAnalyticsEventSend)
  {
    v125 = [(NTPBExternalAnalyticsEventSend *)externalAnalyticsEventSend dictionaryRepresentation];
    [v3 setObject:v125 forKey:@"external_analytics_event_send"];
  }
  appSessionStartWatch = self->_appSessionStartWatch;
  if (appSessionStartWatch)
  {
    v127 = [(NTPBAppSessionStartWatch *)appSessionStartWatch dictionaryRepresentation];
    [v3 setObject:v127 forKey:@"app_session_start_watch"];
  }
  articleViewWatch = self->_articleViewWatch;
  if (articleViewWatch)
  {
    v129 = [(NTPBArticleViewWatch *)articleViewWatch dictionaryRepresentation];
    [v3 setObject:v129 forKey:@"article_view_watch"];
  }
  appSessionEndWatch = self->_appSessionEndWatch;
  if (appSessionEndWatch)
  {
    v131 = [(NTPBAppSessionEndWatch *)appSessionEndWatch dictionaryRepresentation];
    [v3 setObject:v131 forKey:@"app_session_end_watch"];
  }
  anfComponentExposure = self->_anfComponentExposure;
  if (anfComponentExposure)
  {
    v133 = [(NTPBAnfComponentExposure *)anfComponentExposure dictionaryRepresentation];
    [v3 setObject:v133 forKey:@"anf_component_exposure"];
  }
  todayWidgetSession = self->_todayWidgetSession;
  if (todayWidgetSession)
  {
    v135 = [(NTPBTodayWidgetSession *)todayWidgetSession dictionaryRepresentation];
    [v3 setObject:v135 forKey:@"today_widget_session"];
  }
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    v137 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v137 forKey:@"widget_engagement"];
  }
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  if (todayWidgetHeadlineExposure)
  {
    v139 = [(NTPBTodayWidgetHeadlineExposure *)todayWidgetHeadlineExposure dictionaryRepresentation];
    [v3 setObject:v139 forKey:@"today_widget_headline_exposure"];
  }
  todayWidgetExposure = self->_todayWidgetExposure;
  if (todayWidgetExposure)
  {
    v141 = [(NTPBTodayWidgetExposure *)todayWidgetExposure dictionaryRepresentation];
    [v3 setObject:v141 forKey:@"today_widget_exposure"];
  }
  adExposureIneligible = self->_adExposureIneligible;
  if (adExposureIneligible)
  {
    v143 = [(NTPBAdExposureIneligible *)adExposureIneligible dictionaryRepresentation];
    [v3 setObject:v143 forKey:@"ad_exposure_ineligible"];
  }
  optInButtonExposure = self->_optInButtonExposure;
  if (optInButtonExposure)
  {
    v145 = [(NTPBOptInButtonExposure *)optInButtonExposure dictionaryRepresentation];
    [v3 setObject:v145 forKey:@"opt_in_button_exposure"];
  }
  suggestionsFeedback = self->_suggestionsFeedback;
  if (suggestionsFeedback)
  {
    v147 = [(NTPBSuggestionsFeedback *)suggestionsFeedback dictionaryRepresentation];
    [v3 setObject:v147 forKey:@"suggestions_feedback"];
  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  if (userIgnoreFavoritesSuggestion)
  {
    v149 = [(NTPBUserIgnoreFavoritesSuggestion *)userIgnoreFavoritesSuggestion dictionaryRepresentation];
    [v3 setObject:v149 forKey:@"user_ignore_favorites_suggestion"];
  }
  articleEngagement = self->_articleEngagement;
  if (articleEngagement)
  {
    v151 = [(NTPBArticleEngagement *)articleEngagement dictionaryRepresentation];
    [v3 setObject:v151 forKey:@"article_engagement"];
  }
  adImpression = self->_adImpression;
  if (adImpression)
  {
    v153 = [(NTPBAdImpression *)adImpression dictionaryRepresentation];
    [v3 setObject:v153 forKey:@"ad_impression"];
  }
  adEngagement = self->_adEngagement;
  if (adEngagement)
  {
    v155 = [(NTPBAdEngagement *)adEngagement dictionaryRepresentation];
    [v3 setObject:v155 forKey:@"ad_engagement"];
  }
  adCtaEngagement = self->_adCtaEngagement;
  if (adCtaEngagement)
  {
    v157 = [(NTPBAdCtaEngagement *)adCtaEngagement dictionaryRepresentation];
    [v3 setObject:v157 forKey:@"ad_cta_engagement"];
  }
  linkTap = self->_linkTap;
  if (linkTap)
  {
    v159 = [(NTPBLinkTap *)linkTap dictionaryRepresentation];
    [v3 setObject:v159 forKey:@"link_tap"];
  }
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  if (topOfFeedModuleExposure)
  {
    v161 = [(NTPBTopOfFeedModuleExposure *)topOfFeedModuleExposure dictionaryRepresentation];
    [v3 setObject:v161 forKey:@"top_of_feed_module_exposure"];
  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  if (inAppWebEmbedExposure)
  {
    v163 = [(NTPBInAppWebEmbedExposure *)inAppWebEmbedExposure dictionaryRepresentation];
    [v3 setObject:v163 forKey:@"in_app_web_embed_exposure"];
  }
  tocExposure = self->_tocExposure;
  if (tocExposure)
  {
    v165 = [(NTPBTocExposure *)tocExposure dictionaryRepresentation];
    [v3 setObject:v165 forKey:@"toc_exposure"];
  }
  tocReorder = self->_tocReorder;
  if (tocReorder)
  {
    v167 = [(NTPBTocReorder *)tocReorder dictionaryRepresentation];
    [v3 setObject:v167 forKey:@"toc_reorder"];
  }
  tocHandleTap = self->_tocHandleTap;
  if (tocHandleTap)
  {
    v169 = [(NTPBTocHandleTap *)tocHandleTap dictionaryRepresentation];
    [v3 setObject:v169 forKey:@"toc_handle_tap"];
  }
  tocCardDrag = self->_tocCardDrag;
  if (tocCardDrag)
  {
    v171 = [(NTPBTocCardDrag *)tocCardDrag dictionaryRepresentation];
    [v3 setObject:v171 forKey:@"toc_card_drag"];
  }
  tocToggleTap = self->_tocToggleTap;
  if (tocToggleTap)
  {
    v173 = [(NTPBTocToggleTap *)tocToggleTap dictionaryRepresentation];
    [v3 setObject:v173 forKey:@"toc_toggle_tap"];
  }
  tocCellExposure = self->_tocCellExposure;
  if (tocCellExposure)
  {
    v175 = [(NTPBTocCellExposure *)tocCellExposure dictionaryRepresentation];
    [v3 setObject:v175 forKey:@"toc_cell_exposure"];
  }
  appSessionResign = self->_appSessionResign;
  if (appSessionResign)
  {
    v177 = [(NTPBAppSessionResign *)appSessionResign dictionaryRepresentation];
    [v3 setObject:v177 forKey:@"app_session_resign"];
  }
  appSessionResume = self->_appSessionResume;
  if (appSessionResume)
  {
    v179 = [(NTPBAppSessionResume *)appSessionResume dictionaryRepresentation];
    [v3 setObject:v179 forKey:@"app_session_resume"];
  }
  articleSessionResign = self->_articleSessionResign;
  if (articleSessionResign)
  {
    v181 = [(NTPBArticleSessionResign *)articleSessionResign dictionaryRepresentation];
    [v3 setObject:v181 forKey:@"article_session_resign"];
  }
  articleSessionResume = self->_articleSessionResume;
  if (articleSessionResume)
  {
    v183 = [(NTPBArticleSessionResume *)articleSessionResume dictionaryRepresentation];
    [v3 setObject:v183 forKey:@"article_session_resume"];
  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  if (bundleSubscriberInfo)
  {
    v185 = [(NTPBBundleSubscriberInfo *)bundleSubscriberInfo dictionaryRepresentation];
    [v3 setObject:v185 forKey:@"bundle_subscriber_info"];
  }
  issueDownload = self->_issueDownload;
  if (issueDownload)
  {
    v187 = [(NTPBIssueDownload *)issueDownload dictionaryRepresentation];
    [v3 setObject:v187 forKey:@"issue_download"];
  }
  paywallButtonTap = self->_paywallButtonTap;
  if (paywallButtonTap)
  {
    v189 = [(NTPBPaywallButtonTap *)paywallButtonTap dictionaryRepresentation];
    [v3 setObject:v189 forKey:@"paywall_button_tap"];
  }
  pdfPageView = self->_pdfPageView;
  if (pdfPageView)
  {
    v191 = [(NTPBPDFPageView *)pdfPageView dictionaryRepresentation];
    [v3 setObject:v191 forKey:@"pdf_page_view"];
  }
  issueTocView = self->_issueTocView;
  if (issueTocView)
  {
    v193 = [(NTPBIssueTocView *)issueTocView dictionaryRepresentation];
    [v3 setObject:v193 forKey:@"issue_toc_view"];
  }
  issueExposure = self->_issueExposure;
  if (issueExposure)
  {
    v195 = [(NTPBIssueExposure *)issueExposure dictionaryRepresentation];
    [v3 setObject:v195 forKey:@"issue_exposure"];
  }
  appleidSignInResult = self->_appleidSignInResult;
  if (appleidSignInResult)
  {
    v197 = [(NTPBAppleIdSignInResult *)appleidSignInResult dictionaryRepresentation];
    [v3 setObject:v197 forKey:@"appleid_sign_in_result"];
  }
  articleFeedback = self->_articleFeedback;
  if (articleFeedback)
  {
    v199 = [(NTPBArticleFeedback *)articleFeedback dictionaryRepresentation];
    [v3 setObject:v199 forKey:@"article_feedback"];
  }
  audioEngage = self->_audioEngage;
  if (audioEngage)
  {
    v201 = [(NTPBAudioEngage *)audioEngage dictionaryRepresentation];
    [v3 setObject:v201 forKey:@"audio_engage"];
  }
  audioEngagementCompleted = self->_audioEngagementCompleted;
  if (audioEngagementCompleted)
  {
    v203 = [(NTPBAudioEngagementCompleted *)audioEngagementCompleted dictionaryRepresentation];
    [v3 setObject:v203 forKey:@"audio_engagement_completed"];
  }
  purchaseOffersItem = self->_purchaseOffersItem;
  if (purchaseOffersItem)
  {
    v205 = [(NTPBPurchaseOffersItem *)purchaseOffersItem dictionaryRepresentation];
    [v3 setObject:v205 forKey:@"purchase_offers_item"];
  }
  feedLoad = self->_feedLoad;
  if (feedLoad)
  {
    v207 = [(NTPBFeedLoad *)feedLoad dictionaryRepresentation];
    [v3 setObject:v207 forKey:@"feed_load"];
  }
  id v208 = v3;

  return v208;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEventObjectReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userOnboardingBegin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userOnboardingResume)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userOnboardingResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionStart)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionEnd)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleScroll)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleHostViewExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleLikeDislike)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedCellExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedViewExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedCellHostViewExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedSubscribeUnsubscribe)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaEngage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mediaEngageComplete)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchBegin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchExecute)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchResultSelect)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_noUserAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_readingListAddRemove)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_readingListShow)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recommendationBrickExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_endOfArticleExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reportConcernSubmission)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_localNotificationReturn)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pullToRefresh)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_linkTapArticle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_localNotificationReceived)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userOnboardingScreenView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userOnboardingChannelPickerComplete)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adExposureOpportunity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_channelMuteUnmute)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareSheetExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedEngagementMenuExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchViewExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_groupViewExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paidSubscriptionConversionPointExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paidSubscriptionSheetView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareSheetIapFail)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paidSubscriptionResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareInformationScreenView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_webAccessScreenView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_alreadySubscriberSignIn)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_backgroundSubscriptionValidation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionDetectionScreenView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_coverArticleWidgetView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationSubscribeUnsubscribe)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationSettingsScreenView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_emailOptInInvite)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_coverArticleWidgetExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_restorePaidSubscription)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paidSubscriptionSheetIapFail)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_comscoreEventSend)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_discoverMoreInterstitialExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleViewNotw)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleScrollNotw)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_urlMappingMiss)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bundleIdMappingMiss)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_externalAnalyticsEventSend)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionStartWatch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleViewWatch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionEndWatch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_anfComponentExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_todayWidgetSession)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_widgetEngagement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_todayWidgetHeadlineExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_todayWidgetExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adExposureIneligible)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_optInButtonExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_suggestionsFeedback)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userIgnoreFavoritesSuggestion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleEngagement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adImpression)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adEngagement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adCtaEngagement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_linkTap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_topOfFeedModuleExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inAppWebEmbedExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocReorder)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocHandleTap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocCardDrag)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocToggleTap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tocCellExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionResign)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appSessionResume)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleSessionResign)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleSessionResume)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bundleSubscriberInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_issueDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_paywallButtonTap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pdfPageView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_issueTocView)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_issueExposure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleidSignInResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_articleFeedback)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_audioEngage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_audioEngagementCompleted)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_purchaseOffersItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_feedLoad)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBUserOnboardingBegin *)self->_userOnboardingBegin copyWithZone:a3];
  v7 = (void *)v5[96];
  v5[96] = v6;

  id v8 = [(NTPBUserOnboardingResume *)self->_userOnboardingResume copyWithZone:a3];
  v9 = (void *)v5[99];
  v5[99] = v8;

  id v10 = [(NTPBUserOnboardingResult *)self->_userOnboardingResult copyWithZone:a3];
  v11 = (void *)v5[98];
  v5[98] = v10;

  id v12 = [(NTPBAppSessionStart *)self->_appSessionStart copyWithZone:a3];
  v13 = (void *)v5[12];
  v5[12] = v12;

  id v14 = [(NTPBAppSessionEnd *)self->_appSessionEnd copyWithZone:a3];
  v15 = (void *)v5[8];
  v5[8] = v14;

  id v16 = [(NTPBArticleScroll *)self->_articleScroll copyWithZone:a3];
  v17 = (void *)v5[19];
  v5[19] = v16;

  id v18 = [(NTPBArticleHostViewExposure *)self->_articleHostViewExposure copyWithZone:a3];
  v19 = (void *)v5[17];
  v5[17] = v18;

  id v20 = [(NTPBArticleLikeDislike *)self->_articleLikeDislike copyWithZone:a3];
  v21 = (void *)v5[18];
  v5[18] = v20;

  id v22 = [(NTPBFeedCellExposure *)self->_feedCellExposure copyWithZone:a3];
  v23 = (void *)v5[38];
  v5[38] = v22;

  id v24 = [(NTPBFeedViewExposure *)self->_feedViewExposure copyWithZone:a3];
  v25 = (void *)v5[43];
  v5[43] = v24;

  id v26 = [(NTPBFeedCellHostViewExposure *)self->_feedCellHostViewExposure copyWithZone:a3];
  v27 = (void *)v5[39];
  v5[39] = v26;

  id v28 = [(NTPBFeedSubscribeUnsubscribe *)self->_feedSubscribeUnsubscribe copyWithZone:a3];
  v29 = (void *)v5[42];
  v5[42] = v28;

  id v30 = [(NTPBMediaExposure *)self->_mediaExposure copyWithZone:a3];
  v31 = (void *)v5[55];
  v5[55] = v30;

  id v32 = [(NTPBMediaView *)self->_mediaView copyWithZone:a3];
  v33 = (void *)v5[56];
  v5[56] = v32;

  id v34 = [(NTPBMediaEngage *)self->_mediaEngage copyWithZone:a3];
  v35 = (void *)v5[53];
  v5[53] = v34;

  id v36 = [(NTPBMediaEngageComplete *)self->_mediaEngageComplete copyWithZone:a3];
  v37 = (void *)v5[54];
  v5[54] = v36;

  id v38 = [(NTPBSearchBegin *)self->_searchBegin copyWithZone:a3];
  v39 = (void *)v5[74];
  v5[74] = v38;

  id v40 = [(NTPBSearchExecute *)self->_searchExecute copyWithZone:a3];
  v41 = (void *)v5[75];
  v5[75] = v40;

  id v42 = [(NTPBSearchResultSelect *)self->_searchResultSelect copyWithZone:a3];
  v43 = (void *)v5[76];
  v5[76] = v42;

  id v44 = [(NTPBShareResult *)self->_shareResult copyWithZone:a3];
  v45 = (void *)v5[79];
  v5[79] = v44;

  id v46 = [(NTPBNoUserAction *)self->_noUserAction copyWithZone:a3];
  v47 = (void *)v5[57];
  v5[57] = v46;

  id v48 = [(NTPBReadingListAddRemove *)self->_readingListAddRemove copyWithZone:a3];
  v49 = (void *)v5[69];
  v5[69] = v48;

  id v50 = [(NTPBReadingListShow *)self->_readingListShow copyWithZone:a3];
  v51 = (void *)v5[70];
  v5[70] = v50;

  id v52 = [(NTPBRecommendationBrickExposure *)self->_recommendationBrickExposure copyWithZone:a3];
  v53 = (void *)v5[71];
  v5[71] = v52;

  id v54 = [(NTPBEndOfArticleExposure *)self->_endOfArticleExposure copyWithZone:a3];
  v55 = (void *)v5[36];
  v5[36] = v54;

  id v56 = [(NTPBReportConcernSubmission *)self->_reportConcernSubmission copyWithZone:a3];
  v57 = (void *)v5[72];
  v5[72] = v56;

  id v58 = [(NTPBLocalNotificationReturn *)self->_localNotificationReturn copyWithZone:a3];
  v59 = (void *)v5[52];
  v5[52] = v58;

  id v60 = [(NTPBPullToRefresh *)self->_pullToRefresh copyWithZone:a3];
  v61 = (void *)v5[67];
  v5[67] = v60;

  id v62 = [(NTPBLinkTapArticle *)self->_linkTapArticle copyWithZone:a3];
  v63 = (void *)v5[50];
  v5[50] = v62;

  id v64 = [(NTPBLocalNotificationReceived *)self->_localNotificationReceived copyWithZone:a3];
  v65 = (void *)v5[51];
  v5[51] = v64;

  id v66 = [(NTPBUserOnboardingScreenView *)self->_userOnboardingScreenView copyWithZone:a3];
  v67 = (void *)v5[100];
  v5[100] = v66;

  id v68 = [(NTPBUserOnboardingChannelPickerComplete *)self->_userOnboardingChannelPickerComplete copyWithZone:a3];
  v69 = (void *)v5[97];
  v5[97] = v68;

  id v70 = [(NTPBAdExposureOpportunity *)self->_adExposureOpportunity copyWithZone:a3];
  v71 = (void *)v5[4];
  v5[4] = v70;

  id v72 = [(NTPBChannelMuteUnmute *)self->_channelMuteUnmute copyWithZone:a3];
  v73 = (void *)v5[30];
  v5[30] = v72;

  id v74 = [(NTPBShareSheetExposure *)self->_shareSheetExposure copyWithZone:a3];
  v75 = (void *)v5[80];
  v5[80] = v74;

  id v76 = [(NTPBFeedEngagementMenuExposure *)self->_feedEngagementMenuExposure copyWithZone:a3];
  v77 = (void *)v5[40];
  v5[40] = v76;

  id v78 = [(NTPBSearchViewExposure *)self->_searchViewExposure copyWithZone:a3];
  v79 = (void *)v5[77];
  v5[77] = v78;

  id v80 = [(NTPBGroupViewExposure *)self->_groupViewExposure copyWithZone:a3];
  v81 = (void *)v5[44];
  v5[44] = v80;

  id v82 = [(NTPBPaidSubscriptionConversionPointExposure *)self->_paidSubscriptionConversionPointExposure copyWithZone:a3];
  v83 = (void *)v5[61];
  v5[61] = v82;

  id v84 = [(NTPBPaidSubscriptionSheetView *)self->_paidSubscriptionSheetView copyWithZone:a3];
  v85 = (void *)v5[64];
  v5[64] = v84;

  id v86 = [(NTPBShareSheetIapFail *)self->_shareSheetIapFail copyWithZone:a3];
  v87 = (void *)v5[81];
  v5[81] = v86;

  id v88 = [(NTPBPaidSubscriptionResult *)self->_paidSubscriptionResult copyWithZone:a3];
  v89 = (void *)v5[62];
  v5[62] = v88;

  id v90 = [(NTPBShareInformationScreenView *)self->_shareInformationScreenView copyWithZone:a3];
  v91 = (void *)v5[78];
  v5[78] = v90;

  id v92 = [(NTPBWebAccessScreenView *)self->_webAccessScreenView copyWithZone:a3];
  v93 = (void *)v5[101];
  v5[101] = v92;

  id v94 = [(NTPBAlreadySubscriberSignIn *)self->_alreadySubscriberSignIn copyWithZone:a3];
  v95 = (void *)v5[6];
  v5[6] = v94;

  id v96 = [(NTPBBackgroundSubscriptionValidation *)self->_backgroundSubscriptionValidation copyWithZone:a3];
  v97 = (void *)v5[27];
  v5[27] = v96;

  id v98 = [(NTPBSubscriptionDetectionScreenView *)self->_subscriptionDetectionScreenView copyWithZone:a3];
  v99 = (void *)v5[82];
  v5[82] = v98;

  id v100 = [(NTPBCoverArticleWidgetView *)self->_coverArticleWidgetView copyWithZone:a3];
  v101 = (void *)v5[33];
  v5[33] = v100;

  id v102 = [(NTPBNotificationSubscribeUnsubscribe *)self->_notificationSubscribeUnsubscribe copyWithZone:a3];
  v103 = (void *)v5[59];
  v5[59] = v102;

  id v104 = [(NTPBNotificationSettingsScreenView *)self->_notificationSettingsScreenView copyWithZone:a3];
  v105 = (void *)v5[58];
  v5[58] = v104;

  id v106 = [(NTPBEmailOptInInvite *)self->_emailOptInInvite copyWithZone:a3];
  v107 = (void *)v5[35];
  v5[35] = v106;

  id v108 = [(NTPBCoverArticleWidgetExposure *)self->_coverArticleWidgetExposure copyWithZone:a3];
  v109 = (void *)v5[32];
  v5[32] = v108;

  id v110 = [(NTPBRestorePaidSubscription *)self->_restorePaidSubscription copyWithZone:a3];
  v111 = (void *)v5[73];
  v5[73] = v110;

  id v112 = [(NTPBPaidSubscriptionSheetIapFail *)self->_paidSubscriptionSheetIapFail copyWithZone:a3];
  v113 = (void *)v5[63];
  v5[63] = v112;

  id v114 = [(NTPBComscoreEventSend *)self->_comscoreEventSend copyWithZone:a3];
  v115 = (void *)v5[31];
  v5[31] = v114;

  id v116 = [(NTPBDiscoverMoreInterstitialExposure *)self->_discoverMoreInterstitialExposure copyWithZone:a3];
  v117 = (void *)v5[34];
  v5[34] = v116;

  id v118 = [(NTPBArticleViewNotw *)self->_articleViewNotw copyWithZone:a3];
  v119 = (void *)v5[23];
  v5[23] = v118;

  id v120 = [(NTPBArticleScrollNotw *)self->_articleScrollNotw copyWithZone:a3];
  v121 = (void *)v5[20];
  v5[20] = v120;

  id v122 = [(NTPBUrlMappingMiss *)self->_urlMappingMiss copyWithZone:a3];
  v123 = (void *)v5[94];
  v5[94] = v122;

  id v124 = [(NTPBBundleIdMappingMiss *)self->_bundleIdMappingMiss copyWithZone:a3];
  v125 = (void *)v5[28];
  v5[28] = v124;

  id v126 = [(NTPBExternalAnalyticsEventSend *)self->_externalAnalyticsEventSend copyWithZone:a3];
  v127 = (void *)v5[37];
  v5[37] = v126;

  id v128 = [(NTPBAppSessionStartWatch *)self->_appSessionStartWatch copyWithZone:a3];
  v129 = (void *)v5[13];
  v5[13] = v128;

  id v130 = [(NTPBArticleViewWatch *)self->_articleViewWatch copyWithZone:a3];
  v131 = (void *)v5[24];
  v5[24] = v130;

  id v132 = [(NTPBAppSessionEndWatch *)self->_appSessionEndWatch copyWithZone:a3];
  v133 = (void *)v5[9];
  v5[9] = v132;

  id v134 = [(NTPBAnfComponentExposure *)self->_anfComponentExposure copyWithZone:a3];
  v135 = (void *)v5[7];
  v5[7] = v134;

  id v136 = [(NTPBTodayWidgetSession *)self->_todayWidgetSession copyWithZone:a3];
  v137 = (void *)v5[92];
  v5[92] = v136;

  id v138 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v139 = (void *)v5[102];
  v5[102] = v138;

  id v140 = [(NTPBTodayWidgetHeadlineExposure *)self->_todayWidgetHeadlineExposure copyWithZone:a3];
  v141 = (void *)v5[91];
  v5[91] = v140;

  id v142 = [(NTPBTodayWidgetExposure *)self->_todayWidgetExposure copyWithZone:a3];
  v143 = (void *)v5[90];
  v5[90] = v142;

  id v144 = [(NTPBAdExposureIneligible *)self->_adExposureIneligible copyWithZone:a3];
  v145 = (void *)v5[3];
  v5[3] = v144;

  id v146 = [(NTPBOptInButtonExposure *)self->_optInButtonExposure copyWithZone:a3];
  v147 = (void *)v5[60];
  v5[60] = v146;

  id v148 = [(NTPBSuggestionsFeedback *)self->_suggestionsFeedback copyWithZone:a3];
  v149 = (void *)v5[83];
  v5[83] = v148;

  id v150 = [(NTPBUserIgnoreFavoritesSuggestion *)self->_userIgnoreFavoritesSuggestion copyWithZone:a3];
  v151 = (void *)v5[95];
  v5[95] = v150;

  id v152 = [(NTPBArticleEngagement *)self->_articleEngagement copyWithZone:a3];
  v153 = (void *)v5[15];
  v5[15] = v152;

  id v154 = [(NTPBAdImpression *)self->_adImpression copyWithZone:a3];
  v155 = (void *)v5[5];
  v5[5] = v154;

  id v156 = [(NTPBAdEngagement *)self->_adEngagement copyWithZone:a3];
  v157 = (void *)v5[2];
  v5[2] = v156;

  id v158 = [(NTPBAdCtaEngagement *)self->_adCtaEngagement copyWithZone:a3];
  v159 = (void *)v5[1];
  v5[1] = v158;

  id v160 = [(NTPBLinkTap *)self->_linkTap copyWithZone:a3];
  v161 = (void *)v5[49];
  v5[49] = v160;

  id v162 = [(NTPBTopOfFeedModuleExposure *)self->_topOfFeedModuleExposure copyWithZone:a3];
  v163 = (void *)v5[93];
  v5[93] = v162;

  id v164 = [(NTPBInAppWebEmbedExposure *)self->_inAppWebEmbedExposure copyWithZone:a3];
  v165 = (void *)v5[45];
  v5[45] = v164;

  id v166 = [(NTPBTocExposure *)self->_tocExposure copyWithZone:a3];
  v167 = (void *)v5[86];
  v5[86] = v166;

  id v168 = [(NTPBTocReorder *)self->_tocReorder copyWithZone:a3];
  v169 = (void *)v5[88];
  v5[88] = v168;

  id v170 = [(NTPBTocHandleTap *)self->_tocHandleTap copyWithZone:a3];
  v171 = (void *)v5[87];
  v5[87] = v170;

  id v172 = [(NTPBTocCardDrag *)self->_tocCardDrag copyWithZone:a3];
  v173 = (void *)v5[84];
  v5[84] = v172;

  id v174 = [(NTPBTocToggleTap *)self->_tocToggleTap copyWithZone:a3];
  v175 = (void *)v5[89];
  v5[89] = v174;

  id v176 = [(NTPBTocCellExposure *)self->_tocCellExposure copyWithZone:a3];
  v177 = (void *)v5[85];
  v5[85] = v176;

  id v178 = [(NTPBAppSessionResign *)self->_appSessionResign copyWithZone:a3];
  v179 = (void *)v5[10];
  v5[10] = v178;

  id v180 = [(NTPBAppSessionResume *)self->_appSessionResume copyWithZone:a3];
  v181 = (void *)v5[11];
  v5[11] = v180;

  id v182 = [(NTPBArticleSessionResign *)self->_articleSessionResign copyWithZone:a3];
  v183 = (void *)v5[21];
  v5[21] = v182;

  id v184 = [(NTPBArticleSessionResume *)self->_articleSessionResume copyWithZone:a3];
  v185 = (void *)v5[22];
  v5[22] = v184;

  id v186 = [(NTPBBundleSubscriberInfo *)self->_bundleSubscriberInfo copyWithZone:a3];
  v187 = (void *)v5[29];
  v5[29] = v186;

  id v188 = [(NTPBIssueDownload *)self->_issueDownload copyWithZone:a3];
  v189 = (void *)v5[46];
  v5[46] = v188;

  id v190 = [(NTPBPaywallButtonTap *)self->_paywallButtonTap copyWithZone:a3];
  v191 = (void *)v5[65];
  v5[65] = v190;

  id v192 = [(NTPBPDFPageView *)self->_pdfPageView copyWithZone:a3];
  v193 = (void *)v5[66];
  v5[66] = v192;

  id v194 = [(NTPBIssueTocView *)self->_issueTocView copyWithZone:a3];
  v195 = (void *)v5[48];
  v5[48] = v194;

  id v196 = [(NTPBIssueExposure *)self->_issueExposure copyWithZone:a3];
  v197 = (void *)v5[47];
  v5[47] = v196;

  id v198 = [(NTPBAppleIdSignInResult *)self->_appleidSignInResult copyWithZone:a3];
  v199 = (void *)v5[14];
  v5[14] = v198;

  id v200 = [(NTPBArticleFeedback *)self->_articleFeedback copyWithZone:a3];
  v201 = (void *)v5[16];
  v5[16] = v200;

  id v202 = [(NTPBAudioEngage *)self->_audioEngage copyWithZone:a3];
  v203 = (void *)v5[25];
  v5[25] = v202;

  id v204 = [(NTPBAudioEngagementCompleted *)self->_audioEngagementCompleted copyWithZone:a3];
  v205 = (void *)v5[26];
  v5[26] = v204;

  id v206 = [(NTPBPurchaseOffersItem *)self->_purchaseOffersItem copyWithZone:a3];
  v207 = (void *)v5[68];
  v5[68] = v206;

  id v208 = [(NTPBFeedLoad *)self->_feedLoad copyWithZone:a3];
  v209 = (void *)v5[41];
  v5[41] = v208;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_206;
  }
  userOnboardingBegin = self->_userOnboardingBegin;
  if ((unint64_t)userOnboardingBegin | v4[96])
  {
    if (!-[NTPBUserOnboardingBegin isEqual:](userOnboardingBegin, "isEqual:")) {
      goto LABEL_206;
    }
  }
  userOnboardingResume = self->_userOnboardingResume;
  if ((unint64_t)userOnboardingResume | v4[99]
    && !-[NTPBUserOnboardingResume isEqual:](userOnboardingResume, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingResult = self->_userOnboardingResult;
  if ((unint64_t)userOnboardingResult | v4[98]
    && !-[NTPBUserOnboardingResult isEqual:](userOnboardingResult, "isEqual:"))
  {
    goto LABEL_206;
  }
  appSessionStart = self->_appSessionStart;
  if ((unint64_t)appSessionStart | v4[12] && !-[NTPBAppSessionStart isEqual:](appSessionStart, "isEqual:")) {
    goto LABEL_206;
  }
  appSessionEnd = self->_appSessionEnd;
  if ((unint64_t)appSessionEnd | v4[8] && !-[NTPBAppSessionEnd isEqual:](appSessionEnd, "isEqual:")) {
    goto LABEL_206;
  }
  articleScroll = self->_articleScroll;
  if ((unint64_t)articleScroll | v4[19] && !-[NTPBArticleScroll isEqual:](articleScroll, "isEqual:")) {
    goto LABEL_206;
  }
  articleHostViewExposure = self->_articleHostViewExposure;
  if ((unint64_t)articleHostViewExposure | v4[17]
    && !-[NTPBArticleHostViewExposure isEqual:](articleHostViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleLikeDislike = self->_articleLikeDislike;
  if ((unint64_t)articleLikeDislike | v4[18]
    && !-[NTPBArticleLikeDislike isEqual:](articleLikeDislike, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedCellExposure = self->_feedCellExposure;
  if ((unint64_t)feedCellExposure | v4[38] && !-[NTPBFeedCellExposure isEqual:](feedCellExposure, "isEqual:")) {
    goto LABEL_206;
  }
  feedViewExposure = self->_feedViewExposure;
  if ((unint64_t)feedViewExposure | v4[43] && !-[NTPBFeedViewExposure isEqual:](feedViewExposure, "isEqual:")) {
    goto LABEL_206;
  }
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  if ((unint64_t)feedCellHostViewExposure | v4[39]
    && !-[NTPBFeedCellHostViewExposure isEqual:](feedCellHostViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  if ((unint64_t)feedSubscribeUnsubscribe | v4[42]
    && !-[NTPBFeedSubscribeUnsubscribe isEqual:](feedSubscribeUnsubscribe, "isEqual:"))
  {
    goto LABEL_206;
  }
  mediaExposure = self->_mediaExposure;
  if ((unint64_t)mediaExposure | v4[55] && !-[NTPBMediaExposure isEqual:](mediaExposure, "isEqual:")) {
    goto LABEL_206;
  }
  mediaView = self->_mediaView;
  if ((unint64_t)mediaView | v4[56] && !-[NTPBMediaView isEqual:](mediaView, "isEqual:")) {
    goto LABEL_206;
  }
  mediaEngage = self->_mediaEngage;
  if ((unint64_t)mediaEngage | v4[53] && !-[NTPBMediaEngage isEqual:](mediaEngage, "isEqual:")) {
    goto LABEL_206;
  }
  mediaEngageComplete = self->_mediaEngageComplete;
  if ((unint64_t)mediaEngageComplete | v4[54]
    && !-[NTPBMediaEngageComplete isEqual:](mediaEngageComplete, "isEqual:"))
  {
    goto LABEL_206;
  }
  searchBegin = self->_searchBegin;
  if ((unint64_t)searchBegin | v4[74] && !-[NTPBSearchBegin isEqual:](searchBegin, "isEqual:")) {
    goto LABEL_206;
  }
  searchExecute = self->_searchExecute;
  if ((unint64_t)searchExecute | v4[75] && !-[NTPBSearchExecute isEqual:](searchExecute, "isEqual:")) {
    goto LABEL_206;
  }
  searchResultSelect = self->_searchResultSelect;
  if ((unint64_t)searchResultSelect | v4[76]
    && !-[NTPBSearchResultSelect isEqual:](searchResultSelect, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareResult = self->_shareResult;
  if ((unint64_t)shareResult | v4[79] && !-[NTPBShareResult isEqual:](shareResult, "isEqual:")) {
    goto LABEL_206;
  }
  noUserAction = self->_noUserAction;
  if ((unint64_t)noUserAction | v4[57] && !-[NTPBNoUserAction isEqual:](noUserAction, "isEqual:")) {
    goto LABEL_206;
  }
  readingListAddRemove = self->_readingListAddRemove;
  if ((unint64_t)readingListAddRemove | v4[69]
    && !-[NTPBReadingListAddRemove isEqual:](readingListAddRemove, "isEqual:"))
  {
    goto LABEL_206;
  }
  readingListShow = self->_readingListShow;
  if ((unint64_t)readingListShow | v4[70] && !-[NTPBReadingListShow isEqual:](readingListShow, "isEqual:")) {
    goto LABEL_206;
  }
  recommendationBrickExposure = self->_recommendationBrickExposure;
  if ((unint64_t)recommendationBrickExposure | v4[71]
    && !-[NTPBRecommendationBrickExposure isEqual:](recommendationBrickExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  endOfArticleExposure = self->_endOfArticleExposure;
  if ((unint64_t)endOfArticleExposure | v4[36]
    && !-[NTPBEndOfArticleExposure isEqual:](endOfArticleExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  reportConcernSubmission = self->_reportConcernSubmission;
  if ((unint64_t)reportConcernSubmission | v4[72]
    && !-[NTPBReportConcernSubmission isEqual:](reportConcernSubmission, "isEqual:"))
  {
    goto LABEL_206;
  }
  localNotificationReturn = self->_localNotificationReturn;
  if ((unint64_t)localNotificationReturn | v4[52]
    && !-[NTPBLocalNotificationReturn isEqual:](localNotificationReturn, "isEqual:"))
  {
    goto LABEL_206;
  }
  pullToRefresh = self->_pullToRefresh;
  if ((unint64_t)pullToRefresh | v4[67] && !-[NTPBPullToRefresh isEqual:](pullToRefresh, "isEqual:")) {
    goto LABEL_206;
  }
  linkTapArticle = self->_linkTapArticle;
  if ((unint64_t)linkTapArticle | v4[50] && !-[NTPBLinkTapArticle isEqual:](linkTapArticle, "isEqual:")) {
    goto LABEL_206;
  }
  localNotificationReceived = self->_localNotificationReceived;
  if ((unint64_t)localNotificationReceived | v4[51]
    && !-[NTPBLocalNotificationReceived isEqual:](localNotificationReceived, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  if ((unint64_t)userOnboardingScreenView | v4[100]
    && !-[NTPBUserOnboardingScreenView isEqual:](userOnboardingScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  if ((unint64_t)userOnboardingChannelPickerComplete | v4[97]
    && !-[NTPBUserOnboardingChannelPickerComplete isEqual:](userOnboardingChannelPickerComplete, "isEqual:"))
  {
    goto LABEL_206;
  }
  adExposureOpportunity = self->_adExposureOpportunity;
  if ((unint64_t)adExposureOpportunity | v4[4]
    && !-[NTPBAdExposureOpportunity isEqual:](adExposureOpportunity, "isEqual:"))
  {
    goto LABEL_206;
  }
  channelMuteUnmute = self->_channelMuteUnmute;
  if ((unint64_t)channelMuteUnmute | v4[30] && !-[NTPBChannelMuteUnmute isEqual:](channelMuteUnmute, "isEqual:")) {
    goto LABEL_206;
  }
  shareSheetExposure = self->_shareSheetExposure;
  if ((unint64_t)shareSheetExposure | v4[80]
    && !-[NTPBShareSheetExposure isEqual:](shareSheetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  if ((unint64_t)feedEngagementMenuExposure | v4[40]
    && !-[NTPBFeedEngagementMenuExposure isEqual:](feedEngagementMenuExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  searchViewExposure = self->_searchViewExposure;
  if ((unint64_t)searchViewExposure | v4[77]
    && !-[NTPBSearchViewExposure isEqual:](searchViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  groupViewExposure = self->_groupViewExposure;
  if ((unint64_t)groupViewExposure | v4[44] && !-[NTPBGroupViewExposure isEqual:](groupViewExposure, "isEqual:")) {
    goto LABEL_206;
  }
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  if ((unint64_t)paidSubscriptionConversionPointExposure | v4[61]
    && !-[NTPBPaidSubscriptionConversionPointExposure isEqual:](paidSubscriptionConversionPointExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  if ((unint64_t)paidSubscriptionSheetView | v4[64]
    && !-[NTPBPaidSubscriptionSheetView isEqual:](paidSubscriptionSheetView, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareSheetIapFail = self->_shareSheetIapFail;
  if ((unint64_t)shareSheetIapFail | v4[81] && !-[NTPBShareSheetIapFail isEqual:](shareSheetIapFail, "isEqual:")) {
    goto LABEL_206;
  }
  paidSubscriptionResult = self->_paidSubscriptionResult;
  if ((unint64_t)paidSubscriptionResult | v4[62]
    && !-[NTPBPaidSubscriptionResult isEqual:](paidSubscriptionResult, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareInformationScreenView = self->_shareInformationScreenView;
  if ((unint64_t)shareInformationScreenView | v4[78]
    && !-[NTPBShareInformationScreenView isEqual:](shareInformationScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  webAccessScreenView = self->_webAccessScreenView;
  if ((unint64_t)webAccessScreenView | v4[101]
    && !-[NTPBWebAccessScreenView isEqual:](webAccessScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  if ((unint64_t)alreadySubscriberSignIn | v4[6]
    && !-[NTPBAlreadySubscriberSignIn isEqual:](alreadySubscriberSignIn, "isEqual:"))
  {
    goto LABEL_206;
  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  if ((unint64_t)backgroundSubscriptionValidation | v4[27]
    && !-[NTPBBackgroundSubscriptionValidation isEqual:](backgroundSubscriptionValidation, "isEqual:"))
  {
    goto LABEL_206;
  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  if ((unint64_t)subscriptionDetectionScreenView | v4[82]
    && !-[NTPBSubscriptionDetectionScreenView isEqual:](subscriptionDetectionScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  if ((unint64_t)coverArticleWidgetView | v4[33]
    && !-[NTPBCoverArticleWidgetView isEqual:](coverArticleWidgetView, "isEqual:"))
  {
    goto LABEL_206;
  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  if ((unint64_t)notificationSubscribeUnsubscribe | v4[59]
    && !-[NTPBNotificationSubscribeUnsubscribe isEqual:](notificationSubscribeUnsubscribe, "isEqual:"))
  {
    goto LABEL_206;
  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  if ((unint64_t)notificationSettingsScreenView | v4[58]
    && !-[NTPBNotificationSettingsScreenView isEqual:](notificationSettingsScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  emailOptInInvite = self->_emailOptInInvite;
  if ((unint64_t)emailOptInInvite | v4[35] && !-[NTPBEmailOptInInvite isEqual:](emailOptInInvite, "isEqual:")) {
    goto LABEL_206;
  }
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  if ((unint64_t)coverArticleWidgetExposure | v4[32]
    && !-[NTPBCoverArticleWidgetExposure isEqual:](coverArticleWidgetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  restorePaidSubscription = self->_restorePaidSubscription;
  if ((unint64_t)restorePaidSubscription | v4[73]
    && !-[NTPBRestorePaidSubscription isEqual:](restorePaidSubscription, "isEqual:"))
  {
    goto LABEL_206;
  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  if ((unint64_t)paidSubscriptionSheetIapFail | v4[63]
    && !-[NTPBPaidSubscriptionSheetIapFail isEqual:](paidSubscriptionSheetIapFail, "isEqual:"))
  {
    goto LABEL_206;
  }
  comscoreEventSend = self->_comscoreEventSend;
  if ((unint64_t)comscoreEventSend | v4[31] && !-[NTPBComscoreEventSend isEqual:](comscoreEventSend, "isEqual:")) {
    goto LABEL_206;
  }
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  if ((unint64_t)discoverMoreInterstitialExposure | v4[34]
    && !-[NTPBDiscoverMoreInterstitialExposure isEqual:](discoverMoreInterstitialExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleViewNotw = self->_articleViewNotw;
  if ((unint64_t)articleViewNotw | v4[23] && !-[NTPBArticleViewNotw isEqual:](articleViewNotw, "isEqual:")) {
    goto LABEL_206;
  }
  articleScrollNotw = self->_articleScrollNotw;
  if ((unint64_t)articleScrollNotw | v4[20] && !-[NTPBArticleScrollNotw isEqual:](articleScrollNotw, "isEqual:")) {
    goto LABEL_206;
  }
  urlMappingMiss = self->_urlMappingMiss;
  if ((unint64_t)urlMappingMiss | v4[94] && !-[NTPBUrlMappingMiss isEqual:](urlMappingMiss, "isEqual:")) {
    goto LABEL_206;
  }
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  if ((unint64_t)bundleIdMappingMiss | v4[28]
    && !-[NTPBBundleIdMappingMiss isEqual:](bundleIdMappingMiss, "isEqual:"))
  {
    goto LABEL_206;
  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  if ((unint64_t)externalAnalyticsEventSend | v4[37]
    && !-[NTPBExternalAnalyticsEventSend isEqual:](externalAnalyticsEventSend, "isEqual:"))
  {
    goto LABEL_206;
  }
  appSessionStartWatch = self->_appSessionStartWatch;
  if ((unint64_t)appSessionStartWatch | v4[13]
    && !-[NTPBAppSessionStartWatch isEqual:](appSessionStartWatch, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleViewWatch = self->_articleViewWatch;
  if ((unint64_t)articleViewWatch | v4[24] && !-[NTPBArticleViewWatch isEqual:](articleViewWatch, "isEqual:")) {
    goto LABEL_206;
  }
  appSessionEndWatch = self->_appSessionEndWatch;
  if ((unint64_t)appSessionEndWatch | v4[9]
    && !-[NTPBAppSessionEndWatch isEqual:](appSessionEndWatch, "isEqual:"))
  {
    goto LABEL_206;
  }
  anfComponentExposure = self->_anfComponentExposure;
  if ((unint64_t)anfComponentExposure | v4[7]
    && !-[NTPBAnfComponentExposure isEqual:](anfComponentExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  todayWidgetSession = self->_todayWidgetSession;
  if ((unint64_t)todayWidgetSession | v4[92]
    && !-[NTPBTodayWidgetSession isEqual:](todayWidgetSession, "isEqual:"))
  {
    goto LABEL_206;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | v4[102] && !-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
    goto LABEL_206;
  }
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  if ((unint64_t)todayWidgetHeadlineExposure | v4[91]
    && !-[NTPBTodayWidgetHeadlineExposure isEqual:](todayWidgetHeadlineExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  todayWidgetExposure = self->_todayWidgetExposure;
  if ((unint64_t)todayWidgetExposure | v4[90]
    && !-[NTPBTodayWidgetExposure isEqual:](todayWidgetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  adExposureIneligible = self->_adExposureIneligible;
  if ((unint64_t)adExposureIneligible | v4[3]
    && !-[NTPBAdExposureIneligible isEqual:](adExposureIneligible, "isEqual:"))
  {
    goto LABEL_206;
  }
  optInButtonExposure = self->_optInButtonExposure;
  if ((unint64_t)optInButtonExposure | v4[60]
    && !-[NTPBOptInButtonExposure isEqual:](optInButtonExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  suggestionsFeedback = self->_suggestionsFeedback;
  if ((unint64_t)suggestionsFeedback | v4[83]
    && !-[NTPBSuggestionsFeedback isEqual:](suggestionsFeedback, "isEqual:"))
  {
    goto LABEL_206;
  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  if ((unint64_t)userIgnoreFavoritesSuggestion | v4[95]
    && !-[NTPBUserIgnoreFavoritesSuggestion isEqual:](userIgnoreFavoritesSuggestion, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleEngagement = self->_articleEngagement;
  if ((unint64_t)articleEngagement | v4[15] && !-[NTPBArticleEngagement isEqual:](articleEngagement, "isEqual:")) {
    goto LABEL_206;
  }
  adImpression = self->_adImpression;
  if ((unint64_t)adImpression | v4[5] && !-[NTPBAdImpression isEqual:](adImpression, "isEqual:")) {
    goto LABEL_206;
  }
  adEngagement = self->_adEngagement;
  if ((unint64_t)adEngagement | v4[2] && !-[NTPBAdEngagement isEqual:](adEngagement, "isEqual:")) {
    goto LABEL_206;
  }
  adCtaEngagement = self->_adCtaEngagement;
  if ((unint64_t)adCtaEngagement | v4[1] && !-[NTPBAdCtaEngagement isEqual:](adCtaEngagement, "isEqual:")) {
    goto LABEL_206;
  }
  linkTap = self->_linkTap;
  if ((unint64_t)linkTap | v4[49] && !-[NTPBLinkTap isEqual:](linkTap, "isEqual:")) {
    goto LABEL_206;
  }
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  if ((unint64_t)topOfFeedModuleExposure | v4[93]
    && !-[NTPBTopOfFeedModuleExposure isEqual:](topOfFeedModuleExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  if ((unint64_t)inAppWebEmbedExposure | v4[45]
    && !-[NTPBInAppWebEmbedExposure isEqual:](inAppWebEmbedExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  tocExposure = self->_tocExposure;
  if ((unint64_t)tocExposure | v4[86] && !-[NTPBTocExposure isEqual:](tocExposure, "isEqual:")) {
    goto LABEL_206;
  }
  tocReorder = self->_tocReorder;
  if ((unint64_t)tocReorder | v4[88] && !-[NTPBTocReorder isEqual:](tocReorder, "isEqual:")) {
    goto LABEL_206;
  }
  tocHandleTap = self->_tocHandleTap;
  if ((unint64_t)tocHandleTap | v4[87] && !-[NTPBTocHandleTap isEqual:](tocHandleTap, "isEqual:")) {
    goto LABEL_206;
  }
  tocCardDrag = self->_tocCardDrag;
  if ((unint64_t)tocCardDrag | v4[84] && !-[NTPBTocCardDrag isEqual:](tocCardDrag, "isEqual:")) {
    goto LABEL_206;
  }
  tocToggleTap = self->_tocToggleTap;
  if ((unint64_t)tocToggleTap | v4[89] && !-[NTPBTocToggleTap isEqual:](tocToggleTap, "isEqual:")) {
    goto LABEL_206;
  }
  tocCellExposure = self->_tocCellExposure;
  if ((unint64_t)tocCellExposure | v4[85] && !-[NTPBTocCellExposure isEqual:](tocCellExposure, "isEqual:")) {
    goto LABEL_206;
  }
  appSessionResign = self->_appSessionResign;
  if ((unint64_t)appSessionResign | v4[10] && !-[NTPBAppSessionResign isEqual:](appSessionResign, "isEqual:")) {
    goto LABEL_206;
  }
  appSessionResume = self->_appSessionResume;
  if ((unint64_t)appSessionResume | v4[11] && !-[NTPBAppSessionResume isEqual:](appSessionResume, "isEqual:")) {
    goto LABEL_206;
  }
  articleSessionResign = self->_articleSessionResign;
  if ((unint64_t)articleSessionResign | v4[21]
    && !-[NTPBArticleSessionResign isEqual:](articleSessionResign, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleSessionResume = self->_articleSessionResume;
  if ((unint64_t)articleSessionResume | v4[22]
    && !-[NTPBArticleSessionResume isEqual:](articleSessionResume, "isEqual:"))
  {
    goto LABEL_206;
  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  if ((unint64_t)bundleSubscriberInfo | v4[29]
    && !-[NTPBBundleSubscriberInfo isEqual:](bundleSubscriberInfo, "isEqual:"))
  {
    goto LABEL_206;
  }
  issueDownload = self->_issueDownload;
  if ((unint64_t)issueDownload | v4[46] && !-[NTPBIssueDownload isEqual:](issueDownload, "isEqual:")) {
    goto LABEL_206;
  }
  paywallButtonTap = self->_paywallButtonTap;
  if ((unint64_t)paywallButtonTap | v4[65] && !-[NTPBPaywallButtonTap isEqual:](paywallButtonTap, "isEqual:")) {
    goto LABEL_206;
  }
  pdfPageView = self->_pdfPageView;
  if ((unint64_t)pdfPageView | v4[66] && !-[NTPBPDFPageView isEqual:](pdfPageView, "isEqual:")) {
    goto LABEL_206;
  }
  if (((issueTocView = self->_issueTocView, !((unint64_t)issueTocView | v4[48]))
     || -[NTPBIssueTocView isEqual:](issueTocView, "isEqual:"))
    && ((issueExposure = self->_issueExposure, !((unint64_t)issueExposure | v4[47]))
     || -[NTPBIssueExposure isEqual:](issueExposure, "isEqual:"))
    && ((appleidSignInResult = self->_appleidSignInResult, !((unint64_t)appleidSignInResult | v4[14]))
     || -[NTPBAppleIdSignInResult isEqual:](appleidSignInResult, "isEqual:"))
    && ((articleFeedback = self->_articleFeedback, !((unint64_t)articleFeedback | v4[16]))
     || -[NTPBArticleFeedback isEqual:](articleFeedback, "isEqual:"))
    && ((audioEngage = self->_audioEngage, !((unint64_t)audioEngage | v4[25]))
     || -[NTPBAudioEngage isEqual:](audioEngage, "isEqual:"))
    && ((audioEngagementCompleted = self->_audioEngagementCompleted,
         !((unint64_t)audioEngagementCompleted | v4[26]))
     || -[NTPBAudioEngagementCompleted isEqual:](audioEngagementCompleted, "isEqual:"))
    && ((purchaseOffersItem = self->_purchaseOffersItem, !((unint64_t)purchaseOffersItem | v4[68]))
     || -[NTPBPurchaseOffersItem isEqual:](purchaseOffersItem, "isEqual:")))
  {
    feedLoad = self->_feedLoad;
    if ((unint64_t)feedLoad | v4[41]) {
      char v107 = -[NTPBFeedLoad isEqual:](feedLoad, "isEqual:");
    }
    else {
      char v107 = 1;
    }
  }
  else
  {
LABEL_206:
    char v107 = 0;
  }

  return v107;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBUserOnboardingBegin *)self->_userOnboardingBegin hash];
  unint64_t v4 = [(NTPBUserOnboardingResume *)self->_userOnboardingResume hash] ^ v3;
  unint64_t v5 = [(NTPBUserOnboardingResult *)self->_userOnboardingResult hash];
  unint64_t v6 = v4 ^ v5 ^ [(NTPBAppSessionStart *)self->_appSessionStart hash];
  unint64_t v7 = [(NTPBAppSessionEnd *)self->_appSessionEnd hash];
  unint64_t v8 = v7 ^ [(NTPBArticleScroll *)self->_articleScroll hash];
  unint64_t v9 = v6 ^ v8 ^ [(NTPBArticleHostViewExposure *)self->_articleHostViewExposure hash];
  unint64_t v10 = [(NTPBArticleLikeDislike *)self->_articleLikeDislike hash];
  unint64_t v11 = v10 ^ [(NTPBFeedCellExposure *)self->_feedCellExposure hash];
  unint64_t v12 = v11 ^ [(NTPBFeedViewExposure *)self->_feedViewExposure hash];
  unint64_t v13 = v9 ^ v12 ^ [(NTPBFeedCellHostViewExposure *)self->_feedCellHostViewExposure hash];
  unint64_t v14 = [(NTPBFeedSubscribeUnsubscribe *)self->_feedSubscribeUnsubscribe hash];
  unint64_t v15 = v14 ^ [(NTPBMediaExposure *)self->_mediaExposure hash];
  unint64_t v16 = v15 ^ [(NTPBMediaView *)self->_mediaView hash];
  unint64_t v17 = v16 ^ [(NTPBMediaEngage *)self->_mediaEngage hash];
  unint64_t v18 = v13 ^ v17 ^ [(NTPBMediaEngageComplete *)self->_mediaEngageComplete hash];
  unint64_t v19 = [(NTPBSearchBegin *)self->_searchBegin hash];
  unint64_t v20 = v19 ^ [(NTPBSearchExecute *)self->_searchExecute hash];
  unint64_t v21 = v20 ^ [(NTPBSearchResultSelect *)self->_searchResultSelect hash];
  unint64_t v22 = v21 ^ [(NTPBShareResult *)self->_shareResult hash];
  unint64_t v23 = v22 ^ [(NTPBNoUserAction *)self->_noUserAction hash];
  unint64_t v24 = v18 ^ v23 ^ [(NTPBReadingListAddRemove *)self->_readingListAddRemove hash];
  unint64_t v25 = [(NTPBReadingListShow *)self->_readingListShow hash];
  unint64_t v26 = v25 ^ [(NTPBRecommendationBrickExposure *)self->_recommendationBrickExposure hash];
  unint64_t v27 = v26 ^ [(NTPBEndOfArticleExposure *)self->_endOfArticleExposure hash];
  unint64_t v28 = v27 ^ [(NTPBReportConcernSubmission *)self->_reportConcernSubmission hash];
  unint64_t v29 = v28 ^ [(NTPBLocalNotificationReturn *)self->_localNotificationReturn hash];
  unint64_t v30 = v29 ^ [(NTPBPullToRefresh *)self->_pullToRefresh hash];
  unint64_t v31 = v24 ^ v30 ^ [(NTPBLinkTapArticle *)self->_linkTapArticle hash];
  unint64_t v32 = [(NTPBLocalNotificationReceived *)self->_localNotificationReceived hash];
  unint64_t v33 = v32 ^ [(NTPBUserOnboardingScreenView *)self->_userOnboardingScreenView hash];
  unint64_t v34 = v33 ^ [(NTPBUserOnboardingChannelPickerComplete *)self->_userOnboardingChannelPickerComplete hash];
  unint64_t v35 = v34 ^ [(NTPBAdExposureOpportunity *)self->_adExposureOpportunity hash];
  unint64_t v36 = v35 ^ [(NTPBChannelMuteUnmute *)self->_channelMuteUnmute hash];
  unint64_t v37 = v36 ^ [(NTPBShareSheetExposure *)self->_shareSheetExposure hash];
  unint64_t v38 = v37 ^ [(NTPBFeedEngagementMenuExposure *)self->_feedEngagementMenuExposure hash];
  unint64_t v39 = v31 ^ v38 ^ [(NTPBSearchViewExposure *)self->_searchViewExposure hash];
  unint64_t v40 = [(NTPBGroupViewExposure *)self->_groupViewExposure hash];
  unint64_t v41 = v40 ^ [(NTPBPaidSubscriptionConversionPointExposure *)self->_paidSubscriptionConversionPointExposure hash];
  unint64_t v42 = v41 ^ [(NTPBPaidSubscriptionSheetView *)self->_paidSubscriptionSheetView hash];
  unint64_t v43 = v42 ^ [(NTPBShareSheetIapFail *)self->_shareSheetIapFail hash];
  unint64_t v44 = v43 ^ [(NTPBPaidSubscriptionResult *)self->_paidSubscriptionResult hash];
  unint64_t v45 = v44 ^ [(NTPBShareInformationScreenView *)self->_shareInformationScreenView hash];
  unint64_t v46 = v45 ^ [(NTPBWebAccessScreenView *)self->_webAccessScreenView hash];
  unint64_t v47 = v46 ^ [(NTPBAlreadySubscriberSignIn *)self->_alreadySubscriberSignIn hash];
  unint64_t v48 = v39 ^ v47 ^ [(NTPBBackgroundSubscriptionValidation *)self->_backgroundSubscriptionValidation hash];
  unint64_t v49 = [(NTPBSubscriptionDetectionScreenView *)self->_subscriptionDetectionScreenView hash];
  unint64_t v50 = v49 ^ [(NTPBCoverArticleWidgetView *)self->_coverArticleWidgetView hash];
  unint64_t v51 = v50 ^ [(NTPBNotificationSubscribeUnsubscribe *)self->_notificationSubscribeUnsubscribe hash];
  unint64_t v52 = v51 ^ [(NTPBNotificationSettingsScreenView *)self->_notificationSettingsScreenView hash];
  unint64_t v53 = v52 ^ [(NTPBEmailOptInInvite *)self->_emailOptInInvite hash];
  unint64_t v54 = v53 ^ [(NTPBCoverArticleWidgetExposure *)self->_coverArticleWidgetExposure hash];
  unint64_t v55 = v54 ^ [(NTPBRestorePaidSubscription *)self->_restorePaidSubscription hash];
  unint64_t v56 = v55 ^ [(NTPBPaidSubscriptionSheetIapFail *)self->_paidSubscriptionSheetIapFail hash];
  unint64_t v57 = v56 ^ [(NTPBComscoreEventSend *)self->_comscoreEventSend hash];
  unint64_t v58 = v48 ^ v57 ^ [(NTPBDiscoverMoreInterstitialExposure *)self->_discoverMoreInterstitialExposure hash];
  unint64_t v59 = [(NTPBArticleViewNotw *)self->_articleViewNotw hash];
  unint64_t v60 = v59 ^ [(NTPBArticleScrollNotw *)self->_articleScrollNotw hash];
  unint64_t v61 = v60 ^ [(NTPBUrlMappingMiss *)self->_urlMappingMiss hash];
  unint64_t v62 = v61 ^ [(NTPBBundleIdMappingMiss *)self->_bundleIdMappingMiss hash];
  unint64_t v63 = v62 ^ [(NTPBExternalAnalyticsEventSend *)self->_externalAnalyticsEventSend hash];
  unint64_t v64 = v63 ^ [(NTPBAppSessionStartWatch *)self->_appSessionStartWatch hash];
  unint64_t v65 = v64 ^ [(NTPBArticleViewWatch *)self->_articleViewWatch hash];
  unint64_t v66 = v65 ^ [(NTPBAppSessionEndWatch *)self->_appSessionEndWatch hash];
  unint64_t v67 = v66 ^ [(NTPBAnfComponentExposure *)self->_anfComponentExposure hash];
  unint64_t v68 = v67 ^ [(NTPBTodayWidgetSession *)self->_todayWidgetSession hash];
  unint64_t v69 = v58 ^ v68 ^ [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  unint64_t v70 = [(NTPBTodayWidgetHeadlineExposure *)self->_todayWidgetHeadlineExposure hash];
  unint64_t v71 = v70 ^ [(NTPBTodayWidgetExposure *)self->_todayWidgetExposure hash];
  unint64_t v72 = v71 ^ [(NTPBAdExposureIneligible *)self->_adExposureIneligible hash];
  unint64_t v73 = v72 ^ [(NTPBOptInButtonExposure *)self->_optInButtonExposure hash];
  unint64_t v74 = v73 ^ [(NTPBSuggestionsFeedback *)self->_suggestionsFeedback hash];
  unint64_t v75 = v74 ^ [(NTPBUserIgnoreFavoritesSuggestion *)self->_userIgnoreFavoritesSuggestion hash];
  unint64_t v76 = v75 ^ [(NTPBArticleEngagement *)self->_articleEngagement hash];
  unint64_t v77 = v76 ^ [(NTPBAdImpression *)self->_adImpression hash];
  unint64_t v78 = v77 ^ [(NTPBAdEngagement *)self->_adEngagement hash];
  unint64_t v79 = v78 ^ [(NTPBAdCtaEngagement *)self->_adCtaEngagement hash];
  unint64_t v80 = v79 ^ [(NTPBLinkTap *)self->_linkTap hash];
  unint64_t v81 = v69 ^ v80 ^ [(NTPBTopOfFeedModuleExposure *)self->_topOfFeedModuleExposure hash];
  unint64_t v82 = [(NTPBInAppWebEmbedExposure *)self->_inAppWebEmbedExposure hash];
  unint64_t v83 = v82 ^ [(NTPBTocExposure *)self->_tocExposure hash];
  unint64_t v84 = v83 ^ [(NTPBTocReorder *)self->_tocReorder hash];
  unint64_t v85 = v84 ^ [(NTPBTocHandleTap *)self->_tocHandleTap hash];
  unint64_t v86 = v85 ^ [(NTPBTocCardDrag *)self->_tocCardDrag hash];
  unint64_t v87 = v86 ^ [(NTPBTocToggleTap *)self->_tocToggleTap hash];
  unint64_t v88 = v87 ^ [(NTPBTocCellExposure *)self->_tocCellExposure hash];
  unint64_t v89 = v88 ^ [(NTPBAppSessionResign *)self->_appSessionResign hash];
  unint64_t v90 = v89 ^ [(NTPBAppSessionResume *)self->_appSessionResume hash];
  unint64_t v91 = v90 ^ [(NTPBArticleSessionResign *)self->_articleSessionResign hash];
  unint64_t v92 = v91 ^ [(NTPBArticleSessionResume *)self->_articleSessionResume hash];
  unint64_t v93 = v92 ^ [(NTPBBundleSubscriberInfo *)self->_bundleSubscriberInfo hash];
  unint64_t v94 = v81 ^ v93 ^ [(NTPBIssueDownload *)self->_issueDownload hash];
  unint64_t v95 = [(NTPBPaywallButtonTap *)self->_paywallButtonTap hash];
  unint64_t v96 = v95 ^ [(NTPBPDFPageView *)self->_pdfPageView hash];
  unint64_t v97 = v96 ^ [(NTPBIssueTocView *)self->_issueTocView hash];
  unint64_t v98 = v97 ^ [(NTPBIssueExposure *)self->_issueExposure hash];
  unint64_t v99 = v98 ^ [(NTPBAppleIdSignInResult *)self->_appleidSignInResult hash];
  unint64_t v100 = v99 ^ [(NTPBArticleFeedback *)self->_articleFeedback hash];
  unint64_t v101 = v100 ^ [(NTPBAudioEngage *)self->_audioEngage hash];
  unint64_t v102 = v101 ^ [(NTPBAudioEngagementCompleted *)self->_audioEngagementCompleted hash];
  unint64_t v103 = v102 ^ [(NTPBPurchaseOffersItem *)self->_purchaseOffersItem hash];
  return v94 ^ v103 ^ [(NTPBFeedLoad *)self->_feedLoad hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  userOnboardingBegin = self->_userOnboardingBegin;
  v209 = v4;
  uint64_t v6 = v4[96];
  if (userOnboardingBegin)
  {
    if (v6) {
      -[NTPBUserOnboardingBegin mergeFrom:](userOnboardingBegin, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBEventObject setUserOnboardingBegin:](self, "setUserOnboardingBegin:");
  }
  userOnboardingResume = self->_userOnboardingResume;
  uint64_t v8 = v209[99];
  if (userOnboardingResume)
  {
    if (v8) {
      -[NTPBUserOnboardingResume mergeFrom:](userOnboardingResume, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBEventObject setUserOnboardingResume:](self, "setUserOnboardingResume:");
  }
  userOnboardingResult = self->_userOnboardingResult;
  uint64_t v10 = v209[98];
  if (userOnboardingResult)
  {
    if (v10) {
      -[NTPBUserOnboardingResult mergeFrom:](userOnboardingResult, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[NTPBEventObject setUserOnboardingResult:](self, "setUserOnboardingResult:");
  }
  appSessionStart = self->_appSessionStart;
  uint64_t v12 = v209[12];
  if (appSessionStart)
  {
    if (v12) {
      -[NTPBAppSessionStart mergeFrom:](appSessionStart, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBEventObject setAppSessionStart:](self, "setAppSessionStart:");
  }
  appSessionEnd = self->_appSessionEnd;
  uint64_t v14 = v209[8];
  if (appSessionEnd)
  {
    if (v14) {
      -[NTPBAppSessionEnd mergeFrom:](appSessionEnd, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBEventObject setAppSessionEnd:](self, "setAppSessionEnd:");
  }
  articleScroll = self->_articleScroll;
  uint64_t v16 = v209[19];
  if (articleScroll)
  {
    if (v16) {
      -[NTPBArticleScroll mergeFrom:](articleScroll, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBEventObject setArticleScroll:](self, "setArticleScroll:");
  }
  articleHostViewExposure = self->_articleHostViewExposure;
  uint64_t v18 = v209[17];
  if (articleHostViewExposure)
  {
    if (v18) {
      -[NTPBArticleHostViewExposure mergeFrom:](articleHostViewExposure, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBEventObject setArticleHostViewExposure:](self, "setArticleHostViewExposure:");
  }
  articleLikeDislike = self->_articleLikeDislike;
  uint64_t v20 = v209[18];
  if (articleLikeDislike)
  {
    if (v20) {
      -[NTPBArticleLikeDislike mergeFrom:](articleLikeDislike, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[NTPBEventObject setArticleLikeDislike:](self, "setArticleLikeDislike:");
  }
  feedCellExposure = self->_feedCellExposure;
  uint64_t v22 = v209[38];
  if (feedCellExposure)
  {
    if (v22) {
      -[NTPBFeedCellExposure mergeFrom:](feedCellExposure, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NTPBEventObject setFeedCellExposure:](self, "setFeedCellExposure:");
  }
  feedViewExposure = self->_feedViewExposure;
  uint64_t v24 = v209[43];
  if (feedViewExposure)
  {
    if (v24) {
      -[NTPBFeedViewExposure mergeFrom:](feedViewExposure, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBEventObject setFeedViewExposure:](self, "setFeedViewExposure:");
  }
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  uint64_t v26 = v209[39];
  if (feedCellHostViewExposure)
  {
    if (v26) {
      -[NTPBFeedCellHostViewExposure mergeFrom:](feedCellHostViewExposure, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBEventObject setFeedCellHostViewExposure:](self, "setFeedCellHostViewExposure:");
  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  uint64_t v28 = v209[42];
  if (feedSubscribeUnsubscribe)
  {
    if (v28) {
      -[NTPBFeedSubscribeUnsubscribe mergeFrom:](feedSubscribeUnsubscribe, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[NTPBEventObject setFeedSubscribeUnsubscribe:](self, "setFeedSubscribeUnsubscribe:");
  }
  mediaExposure = self->_mediaExposure;
  uint64_t v30 = v209[55];
  if (mediaExposure)
  {
    if (v30) {
      -[NTPBMediaExposure mergeFrom:](mediaExposure, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[NTPBEventObject setMediaExposure:](self, "setMediaExposure:");
  }
  mediaView = self->_mediaView;
  uint64_t v32 = v209[56];
  if (mediaView)
  {
    if (v32) {
      -[NTPBMediaView mergeFrom:](mediaView, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[NTPBEventObject setMediaView:](self, "setMediaView:");
  }
  mediaEngage = self->_mediaEngage;
  uint64_t v34 = v209[53];
  if (mediaEngage)
  {
    if (v34) {
      -[NTPBMediaEngage mergeFrom:](mediaEngage, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[NTPBEventObject setMediaEngage:](self, "setMediaEngage:");
  }
  mediaEngageComplete = self->_mediaEngageComplete;
  uint64_t v36 = v209[54];
  if (mediaEngageComplete)
  {
    if (v36) {
      -[NTPBMediaEngageComplete mergeFrom:](mediaEngageComplete, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[NTPBEventObject setMediaEngageComplete:](self, "setMediaEngageComplete:");
  }
  searchBegin = self->_searchBegin;
  uint64_t v38 = v209[74];
  if (searchBegin)
  {
    if (v38) {
      -[NTPBSearchBegin mergeFrom:](searchBegin, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[NTPBEventObject setSearchBegin:](self, "setSearchBegin:");
  }
  searchExecute = self->_searchExecute;
  uint64_t v40 = v209[75];
  if (searchExecute)
  {
    if (v40) {
      -[NTPBSearchExecute mergeFrom:](searchExecute, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[NTPBEventObject setSearchExecute:](self, "setSearchExecute:");
  }
  searchResultSelect = self->_searchResultSelect;
  uint64_t v42 = v209[76];
  if (searchResultSelect)
  {
    if (v42) {
      -[NTPBSearchResultSelect mergeFrom:](searchResultSelect, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[NTPBEventObject setSearchResultSelect:](self, "setSearchResultSelect:");
  }
  shareResult = self->_shareResult;
  uint64_t v44 = v209[79];
  if (shareResult)
  {
    if (v44) {
      -[NTPBShareResult mergeFrom:](shareResult, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[NTPBEventObject setShareResult:](self, "setShareResult:");
  }
  noUserAction = self->_noUserAction;
  uint64_t v46 = v209[57];
  if (noUserAction)
  {
    if (v46) {
      -[NTPBNoUserAction mergeFrom:](noUserAction, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[NTPBEventObject setNoUserAction:](self, "setNoUserAction:");
  }
  readingListAddRemove = self->_readingListAddRemove;
  uint64_t v48 = v209[69];
  if (readingListAddRemove)
  {
    if (v48) {
      -[NTPBReadingListAddRemove mergeFrom:](readingListAddRemove, "mergeFrom:");
    }
  }
  else if (v48)
  {
    -[NTPBEventObject setReadingListAddRemove:](self, "setReadingListAddRemove:");
  }
  readingListShow = self->_readingListShow;
  uint64_t v50 = v209[70];
  if (readingListShow)
  {
    if (v50) {
      -[NTPBReadingListShow mergeFrom:](readingListShow, "mergeFrom:");
    }
  }
  else if (v50)
  {
    -[NTPBEventObject setReadingListShow:](self, "setReadingListShow:");
  }
  recommendationBrickExposure = self->_recommendationBrickExposure;
  uint64_t v52 = v209[71];
  if (recommendationBrickExposure)
  {
    if (v52) {
      -[NTPBRecommendationBrickExposure mergeFrom:](recommendationBrickExposure, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[NTPBEventObject setRecommendationBrickExposure:](self, "setRecommendationBrickExposure:");
  }
  endOfArticleExposure = self->_endOfArticleExposure;
  uint64_t v54 = v209[36];
  if (endOfArticleExposure)
  {
    if (v54) {
      -[NTPBEndOfArticleExposure mergeFrom:](endOfArticleExposure, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[NTPBEventObject setEndOfArticleExposure:](self, "setEndOfArticleExposure:");
  }
  reportConcernSubmission = self->_reportConcernSubmission;
  uint64_t v56 = v209[72];
  if (reportConcernSubmission)
  {
    if (v56) {
      -[NTPBReportConcernSubmission mergeFrom:](reportConcernSubmission, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[NTPBEventObject setReportConcernSubmission:](self, "setReportConcernSubmission:");
  }
  localNotificationReturn = self->_localNotificationReturn;
  uint64_t v58 = v209[52];
  if (localNotificationReturn)
  {
    if (v58) {
      -[NTPBLocalNotificationReturn mergeFrom:](localNotificationReturn, "mergeFrom:");
    }
  }
  else if (v58)
  {
    -[NTPBEventObject setLocalNotificationReturn:](self, "setLocalNotificationReturn:");
  }
  pullToRefresh = self->_pullToRefresh;
  uint64_t v60 = v209[67];
  if (pullToRefresh)
  {
    if (v60) {
      -[NTPBPullToRefresh mergeFrom:](pullToRefresh, "mergeFrom:");
    }
  }
  else if (v60)
  {
    -[NTPBEventObject setPullToRefresh:](self, "setPullToRefresh:");
  }
  linkTapArticle = self->_linkTapArticle;
  uint64_t v62 = v209[50];
  if (linkTapArticle)
  {
    if (v62) {
      -[NTPBLinkTapArticle mergeFrom:](linkTapArticle, "mergeFrom:");
    }
  }
  else if (v62)
  {
    -[NTPBEventObject setLinkTapArticle:](self, "setLinkTapArticle:");
  }
  localNotificationReceived = self->_localNotificationReceived;
  uint64_t v64 = v209[51];
  if (localNotificationReceived)
  {
    if (v64) {
      -[NTPBLocalNotificationReceived mergeFrom:](localNotificationReceived, "mergeFrom:");
    }
  }
  else if (v64)
  {
    -[NTPBEventObject setLocalNotificationReceived:](self, "setLocalNotificationReceived:");
  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  uint64_t v66 = v209[100];
  if (userOnboardingScreenView)
  {
    if (v66) {
      -[NTPBUserOnboardingScreenView mergeFrom:](userOnboardingScreenView, "mergeFrom:");
    }
  }
  else if (v66)
  {
    -[NTPBEventObject setUserOnboardingScreenView:](self, "setUserOnboardingScreenView:");
  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  uint64_t v68 = v209[97];
  if (userOnboardingChannelPickerComplete)
  {
    if (v68) {
      -[NTPBUserOnboardingChannelPickerComplete mergeFrom:](userOnboardingChannelPickerComplete, "mergeFrom:");
    }
  }
  else if (v68)
  {
    -[NTPBEventObject setUserOnboardingChannelPickerComplete:](self, "setUserOnboardingChannelPickerComplete:");
  }
  adExposureOpportunity = self->_adExposureOpportunity;
  uint64_t v70 = v209[4];
  if (adExposureOpportunity)
  {
    if (v70) {
      -[NTPBAdExposureOpportunity mergeFrom:](adExposureOpportunity, "mergeFrom:");
    }
  }
  else if (v70)
  {
    -[NTPBEventObject setAdExposureOpportunity:](self, "setAdExposureOpportunity:");
  }
  channelMuteUnmute = self->_channelMuteUnmute;
  uint64_t v72 = v209[30];
  if (channelMuteUnmute)
  {
    if (v72) {
      -[NTPBChannelMuteUnmute mergeFrom:](channelMuteUnmute, "mergeFrom:");
    }
  }
  else if (v72)
  {
    -[NTPBEventObject setChannelMuteUnmute:](self, "setChannelMuteUnmute:");
  }
  shareSheetExposure = self->_shareSheetExposure;
  uint64_t v74 = v209[80];
  if (shareSheetExposure)
  {
    if (v74) {
      -[NTPBShareSheetExposure mergeFrom:](shareSheetExposure, "mergeFrom:");
    }
  }
  else if (v74)
  {
    -[NTPBEventObject setShareSheetExposure:](self, "setShareSheetExposure:");
  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  uint64_t v76 = v209[40];
  if (feedEngagementMenuExposure)
  {
    if (v76) {
      -[NTPBFeedEngagementMenuExposure mergeFrom:](feedEngagementMenuExposure, "mergeFrom:");
    }
  }
  else if (v76)
  {
    -[NTPBEventObject setFeedEngagementMenuExposure:](self, "setFeedEngagementMenuExposure:");
  }
  searchViewExposure = self->_searchViewExposure;
  uint64_t v78 = v209[77];
  if (searchViewExposure)
  {
    if (v78) {
      -[NTPBSearchViewExposure mergeFrom:](searchViewExposure, "mergeFrom:");
    }
  }
  else if (v78)
  {
    -[NTPBEventObject setSearchViewExposure:](self, "setSearchViewExposure:");
  }
  groupViewExposure = self->_groupViewExposure;
  uint64_t v80 = v209[44];
  if (groupViewExposure)
  {
    if (v80) {
      -[NTPBGroupViewExposure mergeFrom:](groupViewExposure, "mergeFrom:");
    }
  }
  else if (v80)
  {
    -[NTPBEventObject setGroupViewExposure:](self, "setGroupViewExposure:");
  }
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  uint64_t v82 = v209[61];
  if (paidSubscriptionConversionPointExposure)
  {
    if (v82) {
      -[NTPBPaidSubscriptionConversionPointExposure mergeFrom:](paidSubscriptionConversionPointExposure, "mergeFrom:");
    }
  }
  else if (v82)
  {
    -[NTPBEventObject setPaidSubscriptionConversionPointExposure:](self, "setPaidSubscriptionConversionPointExposure:");
  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  uint64_t v84 = v209[64];
  if (paidSubscriptionSheetView)
  {
    if (v84) {
      -[NTPBPaidSubscriptionSheetView mergeFrom:](paidSubscriptionSheetView, "mergeFrom:");
    }
  }
  else if (v84)
  {
    -[NTPBEventObject setPaidSubscriptionSheetView:](self, "setPaidSubscriptionSheetView:");
  }
  shareSheetIapFail = self->_shareSheetIapFail;
  uint64_t v86 = v209[81];
  if (shareSheetIapFail)
  {
    if (v86) {
      -[NTPBShareSheetIapFail mergeFrom:](shareSheetIapFail, "mergeFrom:");
    }
  }
  else if (v86)
  {
    -[NTPBEventObject setShareSheetIapFail:](self, "setShareSheetIapFail:");
  }
  paidSubscriptionResult = self->_paidSubscriptionResult;
  uint64_t v88 = v209[62];
  if (paidSubscriptionResult)
  {
    if (v88) {
      -[NTPBPaidSubscriptionResult mergeFrom:](paidSubscriptionResult, "mergeFrom:");
    }
  }
  else if (v88)
  {
    -[NTPBEventObject setPaidSubscriptionResult:](self, "setPaidSubscriptionResult:");
  }
  shareInformationScreenView = self->_shareInformationScreenView;
  uint64_t v90 = v209[78];
  if (shareInformationScreenView)
  {
    if (v90) {
      -[NTPBShareInformationScreenView mergeFrom:](shareInformationScreenView, "mergeFrom:");
    }
  }
  else if (v90)
  {
    -[NTPBEventObject setShareInformationScreenView:](self, "setShareInformationScreenView:");
  }
  webAccessScreenView = self->_webAccessScreenView;
  uint64_t v92 = v209[101];
  if (webAccessScreenView)
  {
    if (v92) {
      -[NTPBWebAccessScreenView mergeFrom:](webAccessScreenView, "mergeFrom:");
    }
  }
  else if (v92)
  {
    -[NTPBEventObject setWebAccessScreenView:](self, "setWebAccessScreenView:");
  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  uint64_t v94 = v209[6];
  if (alreadySubscriberSignIn)
  {
    if (v94) {
      -[NTPBAlreadySubscriberSignIn mergeFrom:](alreadySubscriberSignIn, "mergeFrom:");
    }
  }
  else if (v94)
  {
    -[NTPBEventObject setAlreadySubscriberSignIn:](self, "setAlreadySubscriberSignIn:");
  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  uint64_t v96 = v209[27];
  if (backgroundSubscriptionValidation)
  {
    if (v96) {
      -[NTPBBackgroundSubscriptionValidation mergeFrom:](backgroundSubscriptionValidation, "mergeFrom:");
    }
  }
  else if (v96)
  {
    -[NTPBEventObject setBackgroundSubscriptionValidation:](self, "setBackgroundSubscriptionValidation:");
  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  uint64_t v98 = v209[82];
  if (subscriptionDetectionScreenView)
  {
    if (v98) {
      -[NTPBSubscriptionDetectionScreenView mergeFrom:](subscriptionDetectionScreenView, "mergeFrom:");
    }
  }
  else if (v98)
  {
    -[NTPBEventObject setSubscriptionDetectionScreenView:](self, "setSubscriptionDetectionScreenView:");
  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  uint64_t v100 = v209[33];
  if (coverArticleWidgetView)
  {
    if (v100) {
      -[NTPBCoverArticleWidgetView mergeFrom:](coverArticleWidgetView, "mergeFrom:");
    }
  }
  else if (v100)
  {
    -[NTPBEventObject setCoverArticleWidgetView:](self, "setCoverArticleWidgetView:");
  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  uint64_t v102 = v209[59];
  if (notificationSubscribeUnsubscribe)
  {
    if (v102) {
      -[NTPBNotificationSubscribeUnsubscribe mergeFrom:](notificationSubscribeUnsubscribe, "mergeFrom:");
    }
  }
  else if (v102)
  {
    -[NTPBEventObject setNotificationSubscribeUnsubscribe:](self, "setNotificationSubscribeUnsubscribe:");
  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  uint64_t v104 = v209[58];
  if (notificationSettingsScreenView)
  {
    if (v104) {
      -[NTPBNotificationSettingsScreenView mergeFrom:](notificationSettingsScreenView, "mergeFrom:");
    }
  }
  else if (v104)
  {
    -[NTPBEventObject setNotificationSettingsScreenView:](self, "setNotificationSettingsScreenView:");
  }
  emailOptInInvite = self->_emailOptInInvite;
  uint64_t v106 = v209[35];
  if (emailOptInInvite)
  {
    if (v106) {
      -[NTPBEmailOptInInvite mergeFrom:](emailOptInInvite, "mergeFrom:");
    }
  }
  else if (v106)
  {
    -[NTPBEventObject setEmailOptInInvite:](self, "setEmailOptInInvite:");
  }
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  uint64_t v108 = v209[32];
  if (coverArticleWidgetExposure)
  {
    if (v108) {
      -[NTPBCoverArticleWidgetExposure mergeFrom:](coverArticleWidgetExposure, "mergeFrom:");
    }
  }
  else if (v108)
  {
    -[NTPBEventObject setCoverArticleWidgetExposure:](self, "setCoverArticleWidgetExposure:");
  }
  restorePaidSubscription = self->_restorePaidSubscription;
  uint64_t v110 = v209[73];
  if (restorePaidSubscription)
  {
    if (v110) {
      -[NTPBRestorePaidSubscription mergeFrom:](restorePaidSubscription, "mergeFrom:");
    }
  }
  else if (v110)
  {
    -[NTPBEventObject setRestorePaidSubscription:](self, "setRestorePaidSubscription:");
  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  uint64_t v112 = v209[63];
  if (paidSubscriptionSheetIapFail)
  {
    if (v112) {
      -[NTPBPaidSubscriptionSheetIapFail mergeFrom:](paidSubscriptionSheetIapFail, "mergeFrom:");
    }
  }
  else if (v112)
  {
    -[NTPBEventObject setPaidSubscriptionSheetIapFail:](self, "setPaidSubscriptionSheetIapFail:");
  }
  comscoreEventSend = self->_comscoreEventSend;
  uint64_t v114 = v209[31];
  if (comscoreEventSend)
  {
    if (v114) {
      -[NTPBComscoreEventSend mergeFrom:](comscoreEventSend, "mergeFrom:");
    }
  }
  else if (v114)
  {
    -[NTPBEventObject setComscoreEventSend:](self, "setComscoreEventSend:");
  }
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  uint64_t v116 = v209[34];
  if (discoverMoreInterstitialExposure)
  {
    if (v116) {
      -[NTPBDiscoverMoreInterstitialExposure mergeFrom:](discoverMoreInterstitialExposure, "mergeFrom:");
    }
  }
  else if (v116)
  {
    -[NTPBEventObject setDiscoverMoreInterstitialExposure:](self, "setDiscoverMoreInterstitialExposure:");
  }
  articleViewNotw = self->_articleViewNotw;
  uint64_t v118 = v209[23];
  if (articleViewNotw)
  {
    if (v118) {
      -[NTPBArticleViewNotw mergeFrom:](articleViewNotw, "mergeFrom:");
    }
  }
  else if (v118)
  {
    -[NTPBEventObject setArticleViewNotw:](self, "setArticleViewNotw:");
  }
  articleScrollNotw = self->_articleScrollNotw;
  uint64_t v120 = v209[20];
  if (articleScrollNotw)
  {
    if (v120) {
      -[NTPBArticleScrollNotw mergeFrom:](articleScrollNotw, "mergeFrom:");
    }
  }
  else if (v120)
  {
    -[NTPBEventObject setArticleScrollNotw:](self, "setArticleScrollNotw:");
  }
  urlMappingMiss = self->_urlMappingMiss;
  uint64_t v122 = v209[94];
  if (urlMappingMiss)
  {
    if (v122) {
      -[NTPBUrlMappingMiss mergeFrom:](urlMappingMiss, "mergeFrom:");
    }
  }
  else if (v122)
  {
    -[NTPBEventObject setUrlMappingMiss:](self, "setUrlMappingMiss:");
  }
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  uint64_t v124 = v209[28];
  if (bundleIdMappingMiss)
  {
    if (v124) {
      -[NTPBBundleIdMappingMiss mergeFrom:](bundleIdMappingMiss, "mergeFrom:");
    }
  }
  else if (v124)
  {
    -[NTPBEventObject setBundleIdMappingMiss:](self, "setBundleIdMappingMiss:");
  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  uint64_t v126 = v209[37];
  if (externalAnalyticsEventSend)
  {
    if (v126) {
      -[NTPBExternalAnalyticsEventSend mergeFrom:](externalAnalyticsEventSend, "mergeFrom:");
    }
  }
  else if (v126)
  {
    -[NTPBEventObject setExternalAnalyticsEventSend:](self, "setExternalAnalyticsEventSend:");
  }
  appSessionStartWatch = self->_appSessionStartWatch;
  uint64_t v128 = v209[13];
  if (appSessionStartWatch)
  {
    if (v128) {
      -[NTPBAppSessionStartWatch mergeFrom:](appSessionStartWatch, "mergeFrom:");
    }
  }
  else if (v128)
  {
    -[NTPBEventObject setAppSessionStartWatch:](self, "setAppSessionStartWatch:");
  }
  articleViewWatch = self->_articleViewWatch;
  uint64_t v130 = v209[24];
  if (articleViewWatch)
  {
    if (v130) {
      -[NTPBArticleViewWatch mergeFrom:](articleViewWatch, "mergeFrom:");
    }
  }
  else if (v130)
  {
    -[NTPBEventObject setArticleViewWatch:](self, "setArticleViewWatch:");
  }
  appSessionEndWatch = self->_appSessionEndWatch;
  uint64_t v132 = v209[9];
  if (appSessionEndWatch)
  {
    if (v132) {
      -[NTPBAppSessionEndWatch mergeFrom:](appSessionEndWatch, "mergeFrom:");
    }
  }
  else if (v132)
  {
    -[NTPBEventObject setAppSessionEndWatch:](self, "setAppSessionEndWatch:");
  }
  anfComponentExposure = self->_anfComponentExposure;
  uint64_t v134 = v209[7];
  if (anfComponentExposure)
  {
    if (v134) {
      -[NTPBAnfComponentExposure mergeFrom:](anfComponentExposure, "mergeFrom:");
    }
  }
  else if (v134)
  {
    -[NTPBEventObject setAnfComponentExposure:](self, "setAnfComponentExposure:");
  }
  todayWidgetSession = self->_todayWidgetSession;
  uint64_t v136 = v209[92];
  if (todayWidgetSession)
  {
    if (v136) {
      -[NTPBTodayWidgetSession mergeFrom:](todayWidgetSession, "mergeFrom:");
    }
  }
  else if (v136)
  {
    -[NTPBEventObject setTodayWidgetSession:](self, "setTodayWidgetSession:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v138 = v209[102];
  if (widgetEngagement)
  {
    if (v138) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v138)
  {
    -[NTPBEventObject setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  uint64_t v140 = v209[91];
  if (todayWidgetHeadlineExposure)
  {
    if (v140) {
      -[NTPBTodayWidgetHeadlineExposure mergeFrom:](todayWidgetHeadlineExposure, "mergeFrom:");
    }
  }
  else if (v140)
  {
    -[NTPBEventObject setTodayWidgetHeadlineExposure:](self, "setTodayWidgetHeadlineExposure:");
  }
  todayWidgetExposure = self->_todayWidgetExposure;
  uint64_t v142 = v209[90];
  if (todayWidgetExposure)
  {
    if (v142) {
      -[NTPBTodayWidgetExposure mergeFrom:](todayWidgetExposure, "mergeFrom:");
    }
  }
  else if (v142)
  {
    -[NTPBEventObject setTodayWidgetExposure:](self, "setTodayWidgetExposure:");
  }
  adExposureIneligible = self->_adExposureIneligible;
  uint64_t v144 = v209[3];
  if (adExposureIneligible)
  {
    if (v144) {
      -[NTPBAdExposureIneligible mergeFrom:](adExposureIneligible, "mergeFrom:");
    }
  }
  else if (v144)
  {
    -[NTPBEventObject setAdExposureIneligible:](self, "setAdExposureIneligible:");
  }
  optInButtonExposure = self->_optInButtonExposure;
  uint64_t v146 = v209[60];
  if (optInButtonExposure)
  {
    if (v146) {
      -[NTPBOptInButtonExposure mergeFrom:](optInButtonExposure, "mergeFrom:");
    }
  }
  else if (v146)
  {
    -[NTPBEventObject setOptInButtonExposure:](self, "setOptInButtonExposure:");
  }
  suggestionsFeedback = self->_suggestionsFeedback;
  uint64_t v148 = v209[83];
  if (suggestionsFeedback)
  {
    if (v148) {
      -[NTPBSuggestionsFeedback mergeFrom:](suggestionsFeedback, "mergeFrom:");
    }
  }
  else if (v148)
  {
    -[NTPBEventObject setSuggestionsFeedback:](self, "setSuggestionsFeedback:");
  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  uint64_t v150 = v209[95];
  if (userIgnoreFavoritesSuggestion)
  {
    if (v150) {
      -[NTPBUserIgnoreFavoritesSuggestion mergeFrom:](userIgnoreFavoritesSuggestion, "mergeFrom:");
    }
  }
  else if (v150)
  {
    -[NTPBEventObject setUserIgnoreFavoritesSuggestion:](self, "setUserIgnoreFavoritesSuggestion:");
  }
  articleEngagement = self->_articleEngagement;
  uint64_t v152 = v209[15];
  if (articleEngagement)
  {
    if (v152) {
      -[NTPBArticleEngagement mergeFrom:](articleEngagement, "mergeFrom:");
    }
  }
  else if (v152)
  {
    -[NTPBEventObject setArticleEngagement:](self, "setArticleEngagement:");
  }
  adImpression = self->_adImpression;
  uint64_t v154 = v209[5];
  if (adImpression)
  {
    if (v154) {
      -[NTPBAdImpression mergeFrom:](adImpression, "mergeFrom:");
    }
  }
  else if (v154)
  {
    -[NTPBEventObject setAdImpression:](self, "setAdImpression:");
  }
  adEngagement = self->_adEngagement;
  uint64_t v156 = v209[2];
  if (adEngagement)
  {
    if (v156) {
      -[NTPBAdEngagement mergeFrom:](adEngagement, "mergeFrom:");
    }
  }
  else if (v156)
  {
    -[NTPBEventObject setAdEngagement:](self, "setAdEngagement:");
  }
  adCtaEngagement = self->_adCtaEngagement;
  uint64_t v158 = v209[1];
  if (adCtaEngagement)
  {
    if (v158) {
      -[NTPBAdCtaEngagement mergeFrom:](adCtaEngagement, "mergeFrom:");
    }
  }
  else if (v158)
  {
    -[NTPBEventObject setAdCtaEngagement:](self, "setAdCtaEngagement:");
  }
  linkTap = self->_linkTap;
  uint64_t v160 = v209[49];
  if (linkTap)
  {
    if (v160) {
      -[NTPBLinkTap mergeFrom:](linkTap, "mergeFrom:");
    }
  }
  else if (v160)
  {
    -[NTPBEventObject setLinkTap:](self, "setLinkTap:");
  }
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  uint64_t v162 = v209[93];
  if (topOfFeedModuleExposure)
  {
    if (v162) {
      -[NTPBTopOfFeedModuleExposure mergeFrom:](topOfFeedModuleExposure, "mergeFrom:");
    }
  }
  else if (v162)
  {
    -[NTPBEventObject setTopOfFeedModuleExposure:](self, "setTopOfFeedModuleExposure:");
  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  uint64_t v164 = v209[45];
  if (inAppWebEmbedExposure)
  {
    if (v164) {
      -[NTPBInAppWebEmbedExposure mergeFrom:](inAppWebEmbedExposure, "mergeFrom:");
    }
  }
  else if (v164)
  {
    -[NTPBEventObject setInAppWebEmbedExposure:](self, "setInAppWebEmbedExposure:");
  }
  tocExposure = self->_tocExposure;
  uint64_t v166 = v209[86];
  if (tocExposure)
  {
    if (v166) {
      -[NTPBTocExposure mergeFrom:](tocExposure, "mergeFrom:");
    }
  }
  else if (v166)
  {
    -[NTPBEventObject setTocExposure:](self, "setTocExposure:");
  }
  tocReorder = self->_tocReorder;
  uint64_t v168 = v209[88];
  if (tocReorder)
  {
    if (v168) {
      -[NTPBTocReorder mergeFrom:](tocReorder, "mergeFrom:");
    }
  }
  else if (v168)
  {
    -[NTPBEventObject setTocReorder:](self, "setTocReorder:");
  }
  tocHandleTap = self->_tocHandleTap;
  uint64_t v170 = v209[87];
  if (tocHandleTap)
  {
    if (v170) {
      -[NTPBTocHandleTap mergeFrom:](tocHandleTap, "mergeFrom:");
    }
  }
  else if (v170)
  {
    -[NTPBEventObject setTocHandleTap:](self, "setTocHandleTap:");
  }
  tocCardDrag = self->_tocCardDrag;
  uint64_t v172 = v209[84];
  if (tocCardDrag)
  {
    if (v172) {
      -[NTPBTocCardDrag mergeFrom:](tocCardDrag, "mergeFrom:");
    }
  }
  else if (v172)
  {
    -[NTPBEventObject setTocCardDrag:](self, "setTocCardDrag:");
  }
  tocToggleTap = self->_tocToggleTap;
  uint64_t v174 = v209[89];
  if (tocToggleTap)
  {
    if (v174) {
      -[NTPBTocToggleTap mergeFrom:](tocToggleTap, "mergeFrom:");
    }
  }
  else if (v174)
  {
    -[NTPBEventObject setTocToggleTap:](self, "setTocToggleTap:");
  }
  tocCellExposure = self->_tocCellExposure;
  uint64_t v176 = v209[85];
  if (tocCellExposure)
  {
    if (v176) {
      -[NTPBTocCellExposure mergeFrom:](tocCellExposure, "mergeFrom:");
    }
  }
  else if (v176)
  {
    -[NTPBEventObject setTocCellExposure:](self, "setTocCellExposure:");
  }
  appSessionResign = self->_appSessionResign;
  uint64_t v178 = v209[10];
  if (appSessionResign)
  {
    if (v178) {
      -[NTPBAppSessionResign mergeFrom:](appSessionResign, "mergeFrom:");
    }
  }
  else if (v178)
  {
    -[NTPBEventObject setAppSessionResign:](self, "setAppSessionResign:");
  }
  appSessionResume = self->_appSessionResume;
  uint64_t v180 = v209[11];
  if (appSessionResume)
  {
    if (v180) {
      -[NTPBAppSessionResume mergeFrom:](appSessionResume, "mergeFrom:");
    }
  }
  else if (v180)
  {
    -[NTPBEventObject setAppSessionResume:](self, "setAppSessionResume:");
  }
  articleSessionResign = self->_articleSessionResign;
  uint64_t v182 = v209[21];
  if (articleSessionResign)
  {
    if (v182) {
      -[NTPBArticleSessionResign mergeFrom:](articleSessionResign, "mergeFrom:");
    }
  }
  else if (v182)
  {
    -[NTPBEventObject setArticleSessionResign:](self, "setArticleSessionResign:");
  }
  articleSessionResume = self->_articleSessionResume;
  uint64_t v184 = v209[22];
  if (articleSessionResume)
  {
    if (v184) {
      -[NTPBArticleSessionResume mergeFrom:](articleSessionResume, "mergeFrom:");
    }
  }
  else if (v184)
  {
    -[NTPBEventObject setArticleSessionResume:](self, "setArticleSessionResume:");
  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  uint64_t v186 = v209[29];
  if (bundleSubscriberInfo)
  {
    if (v186) {
      -[NTPBBundleSubscriberInfo mergeFrom:](bundleSubscriberInfo, "mergeFrom:");
    }
  }
  else if (v186)
  {
    -[NTPBEventObject setBundleSubscriberInfo:](self, "setBundleSubscriberInfo:");
  }
  issueDownload = self->_issueDownload;
  uint64_t v188 = v209[46];
  if (issueDownload)
  {
    if (v188) {
      -[NTPBIssueDownload mergeFrom:](issueDownload, "mergeFrom:");
    }
  }
  else if (v188)
  {
    -[NTPBEventObject setIssueDownload:](self, "setIssueDownload:");
  }
  paywallButtonTap = self->_paywallButtonTap;
  uint64_t v190 = v209[65];
  if (paywallButtonTap)
  {
    if (v190) {
      -[NTPBPaywallButtonTap mergeFrom:](paywallButtonTap, "mergeFrom:");
    }
  }
  else if (v190)
  {
    -[NTPBEventObject setPaywallButtonTap:](self, "setPaywallButtonTap:");
  }
  pdfPageView = self->_pdfPageView;
  uint64_t v192 = v209[66];
  if (pdfPageView)
  {
    if (v192) {
      -[NTPBPDFPageView mergeFrom:](pdfPageView, "mergeFrom:");
    }
  }
  else if (v192)
  {
    -[NTPBEventObject setPdfPageView:](self, "setPdfPageView:");
  }
  issueTocView = self->_issueTocView;
  uint64_t v194 = v209[48];
  if (issueTocView)
  {
    if (v194) {
      -[NTPBIssueTocView mergeFrom:](issueTocView, "mergeFrom:");
    }
  }
  else if (v194)
  {
    -[NTPBEventObject setIssueTocView:](self, "setIssueTocView:");
  }
  issueExposure = self->_issueExposure;
  uint64_t v196 = v209[47];
  if (issueExposure)
  {
    if (v196) {
      -[NTPBIssueExposure mergeFrom:](issueExposure, "mergeFrom:");
    }
  }
  else if (v196)
  {
    -[NTPBEventObject setIssueExposure:](self, "setIssueExposure:");
  }
  appleidSignInResult = self->_appleidSignInResult;
  uint64_t v198 = v209[14];
  if (appleidSignInResult)
  {
    if (v198) {
      -[NTPBAppleIdSignInResult mergeFrom:](appleidSignInResult, "mergeFrom:");
    }
  }
  else if (v198)
  {
    -[NTPBEventObject setAppleidSignInResult:](self, "setAppleidSignInResult:");
  }
  articleFeedback = self->_articleFeedback;
  uint64_t v200 = v209[16];
  if (articleFeedback)
  {
    if (v200) {
      -[NTPBArticleFeedback mergeFrom:](articleFeedback, "mergeFrom:");
    }
  }
  else if (v200)
  {
    -[NTPBEventObject setArticleFeedback:](self, "setArticleFeedback:");
  }
  audioEngage = self->_audioEngage;
  uint64_t v202 = v209[25];
  if (audioEngage)
  {
    if (v202) {
      -[NTPBAudioEngage mergeFrom:](audioEngage, "mergeFrom:");
    }
  }
  else if (v202)
  {
    -[NTPBEventObject setAudioEngage:](self, "setAudioEngage:");
  }
  audioEngagementCompleted = self->_audioEngagementCompleted;
  uint64_t v204 = v209[26];
  if (audioEngagementCompleted)
  {
    if (v204) {
      -[NTPBAudioEngagementCompleted mergeFrom:](audioEngagementCompleted, "mergeFrom:");
    }
  }
  else if (v204)
  {
    -[NTPBEventObject setAudioEngagementCompleted:](self, "setAudioEngagementCompleted:");
  }
  purchaseOffersItem = self->_purchaseOffersItem;
  uint64_t v206 = v209[68];
  if (purchaseOffersItem)
  {
    if (v206) {
      -[NTPBPurchaseOffersItem mergeFrom:](purchaseOffersItem, "mergeFrom:");
    }
  }
  else if (v206)
  {
    -[NTPBEventObject setPurchaseOffersItem:](self, "setPurchaseOffersItem:");
  }
  feedLoad = self->_feedLoad;
  uint64_t v208 = v209[41];
  if (feedLoad)
  {
    if (v208) {
      -[NTPBFeedLoad mergeFrom:](feedLoad, "mergeFrom:");
    }
  }
  else if (v208)
  {
    -[NTPBEventObject setFeedLoad:](self, "setFeedLoad:");
  }
}

- (NTPBUserOnboardingBegin)userOnboardingBegin
{
  return self->_userOnboardingBegin;
}

- (void)setUserOnboardingBegin:(id)a3
{
}

- (NTPBUserOnboardingResume)userOnboardingResume
{
  return self->_userOnboardingResume;
}

- (void)setUserOnboardingResume:(id)a3
{
}

- (NTPBUserOnboardingResult)userOnboardingResult
{
  return self->_userOnboardingResult;
}

- (void)setUserOnboardingResult:(id)a3
{
}

- (NTPBAppSessionStart)appSessionStart
{
  return self->_appSessionStart;
}

- (void)setAppSessionStart:(id)a3
{
}

- (NTPBAppSessionEnd)appSessionEnd
{
  return self->_appSessionEnd;
}

- (void)setAppSessionEnd:(id)a3
{
}

- (NTPBArticleScroll)articleScroll
{
  return self->_articleScroll;
}

- (void)setArticleScroll:(id)a3
{
}

- (NTPBArticleHostViewExposure)articleHostViewExposure
{
  return self->_articleHostViewExposure;
}

- (void)setArticleHostViewExposure:(id)a3
{
}

- (NTPBArticleLikeDislike)articleLikeDislike
{
  return self->_articleLikeDislike;
}

- (void)setArticleLikeDislike:(id)a3
{
}

- (NTPBFeedCellExposure)feedCellExposure
{
  return self->_feedCellExposure;
}

- (void)setFeedCellExposure:(id)a3
{
}

- (NTPBFeedViewExposure)feedViewExposure
{
  return self->_feedViewExposure;
}

- (void)setFeedViewExposure:(id)a3
{
}

- (NTPBFeedCellHostViewExposure)feedCellHostViewExposure
{
  return self->_feedCellHostViewExposure;
}

- (void)setFeedCellHostViewExposure:(id)a3
{
}

- (NTPBFeedSubscribeUnsubscribe)feedSubscribeUnsubscribe
{
  return self->_feedSubscribeUnsubscribe;
}

- (void)setFeedSubscribeUnsubscribe:(id)a3
{
}

- (NTPBMediaExposure)mediaExposure
{
  return self->_mediaExposure;
}

- (void)setMediaExposure:(id)a3
{
}

- (NTPBMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setMediaView:(id)a3
{
}

- (NTPBMediaEngage)mediaEngage
{
  return self->_mediaEngage;
}

- (void)setMediaEngage:(id)a3
{
}

- (NTPBMediaEngageComplete)mediaEngageComplete
{
  return self->_mediaEngageComplete;
}

- (void)setMediaEngageComplete:(id)a3
{
}

- (NTPBSearchBegin)searchBegin
{
  return self->_searchBegin;
}

- (void)setSearchBegin:(id)a3
{
}

- (NTPBSearchExecute)searchExecute
{
  return self->_searchExecute;
}

- (void)setSearchExecute:(id)a3
{
}

- (NTPBSearchResultSelect)searchResultSelect
{
  return self->_searchResultSelect;
}

- (void)setSearchResultSelect:(id)a3
{
}

- (NTPBShareResult)shareResult
{
  return self->_shareResult;
}

- (void)setShareResult:(id)a3
{
}

- (NTPBNoUserAction)noUserAction
{
  return self->_noUserAction;
}

- (void)setNoUserAction:(id)a3
{
}

- (NTPBReadingListAddRemove)readingListAddRemove
{
  return self->_readingListAddRemove;
}

- (void)setReadingListAddRemove:(id)a3
{
}

- (NTPBReadingListShow)readingListShow
{
  return self->_readingListShow;
}

- (void)setReadingListShow:(id)a3
{
}

- (NTPBRecommendationBrickExposure)recommendationBrickExposure
{
  return self->_recommendationBrickExposure;
}

- (void)setRecommendationBrickExposure:(id)a3
{
}

- (NTPBEndOfArticleExposure)endOfArticleExposure
{
  return self->_endOfArticleExposure;
}

- (void)setEndOfArticleExposure:(id)a3
{
}

- (NTPBReportConcernSubmission)reportConcernSubmission
{
  return self->_reportConcernSubmission;
}

- (void)setReportConcernSubmission:(id)a3
{
}

- (NTPBLocalNotificationReturn)localNotificationReturn
{
  return self->_localNotificationReturn;
}

- (void)setLocalNotificationReturn:(id)a3
{
}

- (NTPBPullToRefresh)pullToRefresh
{
  return self->_pullToRefresh;
}

- (void)setPullToRefresh:(id)a3
{
}

- (NTPBLinkTapArticle)linkTapArticle
{
  return self->_linkTapArticle;
}

- (void)setLinkTapArticle:(id)a3
{
}

- (NTPBLocalNotificationReceived)localNotificationReceived
{
  return self->_localNotificationReceived;
}

- (void)setLocalNotificationReceived:(id)a3
{
}

- (NTPBUserOnboardingScreenView)userOnboardingScreenView
{
  return self->_userOnboardingScreenView;
}

- (void)setUserOnboardingScreenView:(id)a3
{
}

- (NTPBUserOnboardingChannelPickerComplete)userOnboardingChannelPickerComplete
{
  return self->_userOnboardingChannelPickerComplete;
}

- (void)setUserOnboardingChannelPickerComplete:(id)a3
{
}

- (NTPBAdExposureOpportunity)adExposureOpportunity
{
  return self->_adExposureOpportunity;
}

- (void)setAdExposureOpportunity:(id)a3
{
}

- (NTPBChannelMuteUnmute)channelMuteUnmute
{
  return self->_channelMuteUnmute;
}

- (void)setChannelMuteUnmute:(id)a3
{
}

- (NTPBShareSheetExposure)shareSheetExposure
{
  return self->_shareSheetExposure;
}

- (void)setShareSheetExposure:(id)a3
{
}

- (NTPBFeedEngagementMenuExposure)feedEngagementMenuExposure
{
  return self->_feedEngagementMenuExposure;
}

- (void)setFeedEngagementMenuExposure:(id)a3
{
}

- (NTPBSearchViewExposure)searchViewExposure
{
  return self->_searchViewExposure;
}

- (void)setSearchViewExposure:(id)a3
{
}

- (NTPBGroupViewExposure)groupViewExposure
{
  return self->_groupViewExposure;
}

- (void)setGroupViewExposure:(id)a3
{
}

- (NTPBPaidSubscriptionConversionPointExposure)paidSubscriptionConversionPointExposure
{
  return self->_paidSubscriptionConversionPointExposure;
}

- (void)setPaidSubscriptionConversionPointExposure:(id)a3
{
}

- (NTPBPaidSubscriptionSheetView)paidSubscriptionSheetView
{
  return self->_paidSubscriptionSheetView;
}

- (void)setPaidSubscriptionSheetView:(id)a3
{
}

- (NTPBShareSheetIapFail)shareSheetIapFail
{
  return self->_shareSheetIapFail;
}

- (void)setShareSheetIapFail:(id)a3
{
}

- (NTPBPaidSubscriptionResult)paidSubscriptionResult
{
  return self->_paidSubscriptionResult;
}

- (void)setPaidSubscriptionResult:(id)a3
{
}

- (NTPBShareInformationScreenView)shareInformationScreenView
{
  return self->_shareInformationScreenView;
}

- (void)setShareInformationScreenView:(id)a3
{
}

- (NTPBWebAccessScreenView)webAccessScreenView
{
  return self->_webAccessScreenView;
}

- (void)setWebAccessScreenView:(id)a3
{
}

- (NTPBAlreadySubscriberSignIn)alreadySubscriberSignIn
{
  return self->_alreadySubscriberSignIn;
}

- (void)setAlreadySubscriberSignIn:(id)a3
{
}

- (NTPBBackgroundSubscriptionValidation)backgroundSubscriptionValidation
{
  return self->_backgroundSubscriptionValidation;
}

- (void)setBackgroundSubscriptionValidation:(id)a3
{
}

- (NTPBSubscriptionDetectionScreenView)subscriptionDetectionScreenView
{
  return self->_subscriptionDetectionScreenView;
}

- (void)setSubscriptionDetectionScreenView:(id)a3
{
}

- (NTPBCoverArticleWidgetView)coverArticleWidgetView
{
  return self->_coverArticleWidgetView;
}

- (void)setCoverArticleWidgetView:(id)a3
{
}

- (NTPBNotificationSubscribeUnsubscribe)notificationSubscribeUnsubscribe
{
  return self->_notificationSubscribeUnsubscribe;
}

- (void)setNotificationSubscribeUnsubscribe:(id)a3
{
}

- (NTPBNotificationSettingsScreenView)notificationSettingsScreenView
{
  return self->_notificationSettingsScreenView;
}

- (void)setNotificationSettingsScreenView:(id)a3
{
}

- (NTPBEmailOptInInvite)emailOptInInvite
{
  return self->_emailOptInInvite;
}

- (void)setEmailOptInInvite:(id)a3
{
}

- (NTPBCoverArticleWidgetExposure)coverArticleWidgetExposure
{
  return self->_coverArticleWidgetExposure;
}

- (void)setCoverArticleWidgetExposure:(id)a3
{
}

- (NTPBRestorePaidSubscription)restorePaidSubscription
{
  return self->_restorePaidSubscription;
}

- (void)setRestorePaidSubscription:(id)a3
{
}

- (NTPBPaidSubscriptionSheetIapFail)paidSubscriptionSheetIapFail
{
  return self->_paidSubscriptionSheetIapFail;
}

- (void)setPaidSubscriptionSheetIapFail:(id)a3
{
}

- (NTPBComscoreEventSend)comscoreEventSend
{
  return self->_comscoreEventSend;
}

- (void)setComscoreEventSend:(id)a3
{
}

- (NTPBDiscoverMoreInterstitialExposure)discoverMoreInterstitialExposure
{
  return self->_discoverMoreInterstitialExposure;
}

- (void)setDiscoverMoreInterstitialExposure:(id)a3
{
}

- (NTPBArticleViewNotw)articleViewNotw
{
  return self->_articleViewNotw;
}

- (void)setArticleViewNotw:(id)a3
{
}

- (NTPBArticleScrollNotw)articleScrollNotw
{
  return self->_articleScrollNotw;
}

- (void)setArticleScrollNotw:(id)a3
{
}

- (NTPBUrlMappingMiss)urlMappingMiss
{
  return self->_urlMappingMiss;
}

- (void)setUrlMappingMiss:(id)a3
{
}

- (NTPBBundleIdMappingMiss)bundleIdMappingMiss
{
  return self->_bundleIdMappingMiss;
}

- (void)setBundleIdMappingMiss:(id)a3
{
}

- (NTPBExternalAnalyticsEventSend)externalAnalyticsEventSend
{
  return self->_externalAnalyticsEventSend;
}

- (void)setExternalAnalyticsEventSend:(id)a3
{
}

- (NTPBAppSessionStartWatch)appSessionStartWatch
{
  return self->_appSessionStartWatch;
}

- (void)setAppSessionStartWatch:(id)a3
{
}

- (NTPBArticleViewWatch)articleViewWatch
{
  return self->_articleViewWatch;
}

- (void)setArticleViewWatch:(id)a3
{
}

- (NTPBAppSessionEndWatch)appSessionEndWatch
{
  return self->_appSessionEndWatch;
}

- (void)setAppSessionEndWatch:(id)a3
{
}

- (NTPBAnfComponentExposure)anfComponentExposure
{
  return self->_anfComponentExposure;
}

- (void)setAnfComponentExposure:(id)a3
{
}

- (NTPBTodayWidgetSession)todayWidgetSession
{
  return self->_todayWidgetSession;
}

- (void)setTodayWidgetSession:(id)a3
{
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
}

- (NTPBTodayWidgetHeadlineExposure)todayWidgetHeadlineExposure
{
  return self->_todayWidgetHeadlineExposure;
}

- (void)setTodayWidgetHeadlineExposure:(id)a3
{
}

- (NTPBTodayWidgetExposure)todayWidgetExposure
{
  return self->_todayWidgetExposure;
}

- (void)setTodayWidgetExposure:(id)a3
{
}

- (NTPBAdExposureIneligible)adExposureIneligible
{
  return self->_adExposureIneligible;
}

- (void)setAdExposureIneligible:(id)a3
{
}

- (NTPBOptInButtonExposure)optInButtonExposure
{
  return self->_optInButtonExposure;
}

- (void)setOptInButtonExposure:(id)a3
{
}

- (NTPBSuggestionsFeedback)suggestionsFeedback
{
  return self->_suggestionsFeedback;
}

- (void)setSuggestionsFeedback:(id)a3
{
}

- (NTPBUserIgnoreFavoritesSuggestion)userIgnoreFavoritesSuggestion
{
  return self->_userIgnoreFavoritesSuggestion;
}

- (void)setUserIgnoreFavoritesSuggestion:(id)a3
{
}

- (NTPBArticleEngagement)articleEngagement
{
  return self->_articleEngagement;
}

- (void)setArticleEngagement:(id)a3
{
}

- (NTPBAdImpression)adImpression
{
  return self->_adImpression;
}

- (void)setAdImpression:(id)a3
{
}

- (NTPBAdEngagement)adEngagement
{
  return self->_adEngagement;
}

- (void)setAdEngagement:(id)a3
{
}

- (NTPBAdCtaEngagement)adCtaEngagement
{
  return self->_adCtaEngagement;
}

- (void)setAdCtaEngagement:(id)a3
{
}

- (NTPBLinkTap)linkTap
{
  return self->_linkTap;
}

- (void)setLinkTap:(id)a3
{
}

- (NTPBTopOfFeedModuleExposure)topOfFeedModuleExposure
{
  return self->_topOfFeedModuleExposure;
}

- (void)setTopOfFeedModuleExposure:(id)a3
{
}

- (NTPBInAppWebEmbedExposure)inAppWebEmbedExposure
{
  return self->_inAppWebEmbedExposure;
}

- (void)setInAppWebEmbedExposure:(id)a3
{
}

- (NTPBTocExposure)tocExposure
{
  return self->_tocExposure;
}

- (void)setTocExposure:(id)a3
{
}

- (NTPBTocReorder)tocReorder
{
  return self->_tocReorder;
}

- (void)setTocReorder:(id)a3
{
}

- (NTPBTocHandleTap)tocHandleTap
{
  return self->_tocHandleTap;
}

- (void)setTocHandleTap:(id)a3
{
}

- (NTPBTocCardDrag)tocCardDrag
{
  return self->_tocCardDrag;
}

- (void)setTocCardDrag:(id)a3
{
}

- (NTPBTocToggleTap)tocToggleTap
{
  return self->_tocToggleTap;
}

- (void)setTocToggleTap:(id)a3
{
}

- (NTPBTocCellExposure)tocCellExposure
{
  return self->_tocCellExposure;
}

- (void)setTocCellExposure:(id)a3
{
}

- (NTPBAppSessionResign)appSessionResign
{
  return self->_appSessionResign;
}

- (void)setAppSessionResign:(id)a3
{
}

- (NTPBAppSessionResume)appSessionResume
{
  return self->_appSessionResume;
}

- (void)setAppSessionResume:(id)a3
{
}

- (NTPBArticleSessionResign)articleSessionResign
{
  return self->_articleSessionResign;
}

- (void)setArticleSessionResign:(id)a3
{
}

- (NTPBArticleSessionResume)articleSessionResume
{
  return self->_articleSessionResume;
}

- (void)setArticleSessionResume:(id)a3
{
}

- (NTPBBundleSubscriberInfo)bundleSubscriberInfo
{
  return self->_bundleSubscriberInfo;
}

- (void)setBundleSubscriberInfo:(id)a3
{
}

- (NTPBIssueDownload)issueDownload
{
  return self->_issueDownload;
}

- (void)setIssueDownload:(id)a3
{
}

- (NTPBPaywallButtonTap)paywallButtonTap
{
  return self->_paywallButtonTap;
}

- (void)setPaywallButtonTap:(id)a3
{
}

- (NTPBPDFPageView)pdfPageView
{
  return self->_pdfPageView;
}

- (void)setPdfPageView:(id)a3
{
}

- (NTPBIssueTocView)issueTocView
{
  return self->_issueTocView;
}

- (void)setIssueTocView:(id)a3
{
}

- (NTPBIssueExposure)issueExposure
{
  return self->_issueExposure;
}

- (void)setIssueExposure:(id)a3
{
}

- (NTPBAppleIdSignInResult)appleidSignInResult
{
  return self->_appleidSignInResult;
}

- (void)setAppleidSignInResult:(id)a3
{
}

- (NTPBArticleFeedback)articleFeedback
{
  return self->_articleFeedback;
}

- (void)setArticleFeedback:(id)a3
{
}

- (NTPBAudioEngage)audioEngage
{
  return self->_audioEngage;
}

- (void)setAudioEngage:(id)a3
{
}

- (NTPBAudioEngagementCompleted)audioEngagementCompleted
{
  return self->_audioEngagementCompleted;
}

- (void)setAudioEngagementCompleted:(id)a3
{
}

- (NTPBPurchaseOffersItem)purchaseOffersItem
{
  return self->_purchaseOffersItem;
}

- (void)setPurchaseOffersItem:(id)a3
{
}

- (NTPBFeedLoad)feedLoad
{
  return self->_feedLoad;
}

- (void)setFeedLoad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_webAccessScreenView, 0);
  objc_storeStrong((id *)&self->_userOnboardingScreenView, 0);
  objc_storeStrong((id *)&self->_userOnboardingResume, 0);
  objc_storeStrong((id *)&self->_userOnboardingResult, 0);
  objc_storeStrong((id *)&self->_userOnboardingChannelPickerComplete, 0);
  objc_storeStrong((id *)&self->_userOnboardingBegin, 0);
  objc_storeStrong((id *)&self->_userIgnoreFavoritesSuggestion, 0);
  objc_storeStrong((id *)&self->_urlMappingMiss, 0);
  objc_storeStrong((id *)&self->_topOfFeedModuleExposure, 0);
  objc_storeStrong((id *)&self->_todayWidgetSession, 0);
  objc_storeStrong((id *)&self->_todayWidgetHeadlineExposure, 0);
  objc_storeStrong((id *)&self->_todayWidgetExposure, 0);
  objc_storeStrong((id *)&self->_tocToggleTap, 0);
  objc_storeStrong((id *)&self->_tocReorder, 0);
  objc_storeStrong((id *)&self->_tocHandleTap, 0);
  objc_storeStrong((id *)&self->_tocExposure, 0);
  objc_storeStrong((id *)&self->_tocCellExposure, 0);
  objc_storeStrong((id *)&self->_tocCardDrag, 0);
  objc_storeStrong((id *)&self->_suggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_subscriptionDetectionScreenView, 0);
  objc_storeStrong((id *)&self->_shareSheetIapFail, 0);
  objc_storeStrong((id *)&self->_shareSheetExposure, 0);
  objc_storeStrong((id *)&self->_shareResult, 0);
  objc_storeStrong((id *)&self->_shareInformationScreenView, 0);
  objc_storeStrong((id *)&self->_searchViewExposure, 0);
  objc_storeStrong((id *)&self->_searchResultSelect, 0);
  objc_storeStrong((id *)&self->_searchExecute, 0);
  objc_storeStrong((id *)&self->_searchBegin, 0);
  objc_storeStrong((id *)&self->_restorePaidSubscription, 0);
  objc_storeStrong((id *)&self->_reportConcernSubmission, 0);
  objc_storeStrong((id *)&self->_recommendationBrickExposure, 0);
  objc_storeStrong((id *)&self->_readingListShow, 0);
  objc_storeStrong((id *)&self->_readingListAddRemove, 0);
  objc_storeStrong((id *)&self->_purchaseOffersItem, 0);
  objc_storeStrong((id *)&self->_pullToRefresh, 0);
  objc_storeStrong((id *)&self->_pdfPageView, 0);
  objc_storeStrong((id *)&self->_paywallButtonTap, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionSheetView, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionSheetIapFail, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionResult, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionConversionPointExposure, 0);
  objc_storeStrong((id *)&self->_optInButtonExposure, 0);
  objc_storeStrong((id *)&self->_notificationSubscribeUnsubscribe, 0);
  objc_storeStrong((id *)&self->_notificationSettingsScreenView, 0);
  objc_storeStrong((id *)&self->_noUserAction, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_mediaExposure, 0);
  objc_storeStrong((id *)&self->_mediaEngageComplete, 0);
  objc_storeStrong((id *)&self->_mediaEngage, 0);
  objc_storeStrong((id *)&self->_localNotificationReturn, 0);
  objc_storeStrong((id *)&self->_localNotificationReceived, 0);
  objc_storeStrong((id *)&self->_linkTapArticle, 0);
  objc_storeStrong((id *)&self->_linkTap, 0);
  objc_storeStrong((id *)&self->_issueTocView, 0);
  objc_storeStrong((id *)&self->_issueExposure, 0);
  objc_storeStrong((id *)&self->_issueDownload, 0);
  objc_storeStrong((id *)&self->_inAppWebEmbedExposure, 0);
  objc_storeStrong((id *)&self->_groupViewExposure, 0);
  objc_storeStrong((id *)&self->_feedViewExposure, 0);
  objc_storeStrong((id *)&self->_feedSubscribeUnsubscribe, 0);
  objc_storeStrong((id *)&self->_feedLoad, 0);
  objc_storeStrong((id *)&self->_feedEngagementMenuExposure, 0);
  objc_storeStrong((id *)&self->_feedCellHostViewExposure, 0);
  objc_storeStrong((id *)&self->_feedCellExposure, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsEventSend, 0);
  objc_storeStrong((id *)&self->_endOfArticleExposure, 0);
  objc_storeStrong((id *)&self->_emailOptInInvite, 0);
  objc_storeStrong((id *)&self->_discoverMoreInterstitialExposure, 0);
  objc_storeStrong((id *)&self->_coverArticleWidgetView, 0);
  objc_storeStrong((id *)&self->_coverArticleWidgetExposure, 0);
  objc_storeStrong((id *)&self->_comscoreEventSend, 0);
  objc_storeStrong((id *)&self->_channelMuteUnmute, 0);
  objc_storeStrong((id *)&self->_bundleSubscriberInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdMappingMiss, 0);
  objc_storeStrong((id *)&self->_backgroundSubscriptionValidation, 0);
  objc_storeStrong((id *)&self->_audioEngagementCompleted, 0);
  objc_storeStrong((id *)&self->_audioEngage, 0);
  objc_storeStrong((id *)&self->_articleViewWatch, 0);
  objc_storeStrong((id *)&self->_articleViewNotw, 0);
  objc_storeStrong((id *)&self->_articleSessionResume, 0);
  objc_storeStrong((id *)&self->_articleSessionResign, 0);
  objc_storeStrong((id *)&self->_articleScrollNotw, 0);
  objc_storeStrong((id *)&self->_articleScroll, 0);
  objc_storeStrong((id *)&self->_articleLikeDislike, 0);
  objc_storeStrong((id *)&self->_articleHostViewExposure, 0);
  objc_storeStrong((id *)&self->_articleFeedback, 0);
  objc_storeStrong((id *)&self->_articleEngagement, 0);
  objc_storeStrong((id *)&self->_appleidSignInResult, 0);
  objc_storeStrong((id *)&self->_appSessionStartWatch, 0);
  objc_storeStrong((id *)&self->_appSessionStart, 0);
  objc_storeStrong((id *)&self->_appSessionResume, 0);
  objc_storeStrong((id *)&self->_appSessionResign, 0);
  objc_storeStrong((id *)&self->_appSessionEndWatch, 0);
  objc_storeStrong((id *)&self->_appSessionEnd, 0);
  objc_storeStrong((id *)&self->_anfComponentExposure, 0);
  objc_storeStrong((id *)&self->_alreadySubscriberSignIn, 0);
  objc_storeStrong((id *)&self->_adImpression, 0);
  objc_storeStrong((id *)&self->_adExposureOpportunity, 0);
  objc_storeStrong((id *)&self->_adExposureIneligible, 0);
  objc_storeStrong((id *)&self->_adEngagement, 0);

  objc_storeStrong((id *)&self->_adCtaEngagement, 0);
}

@end