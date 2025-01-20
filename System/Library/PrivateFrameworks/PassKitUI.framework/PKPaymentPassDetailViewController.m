@interface PKPaymentPassDetailViewController
- (BOOL)_accountInGoodStateForAMPEligbilityCheck;
- (BOOL)_accountServiceCreditDetailsRowIsEnabled:(unint64_t)a3;
- (BOOL)_accountServicePhysicalCardRowIsEnabled:(unint64_t)a3;
- (BOOL)_accountServiceRewardsRowIsEnabled:(unint64_t)a3;
- (BOOL)_canFetchFinancingPlans;
- (BOOL)_canSelectBalanceOrCommutePlanCellAtRowIndex:(int64_t)a3;
- (BOOL)_commutePlanIsSelectable:(id)a3 action:(id)a4;
- (BOOL)_hasActionOfType:(unint64_t)a3;
- (BOOL)_hasEligibleSpend;
- (BOOL)_isBankConnectLinked;
- (BOOL)_isBankConnectSupportedForPaymentPass:(id)a3;
- (BOOL)_isDeletingPass;
- (BOOL)_isJapaneseRegion;
- (BOOL)_isShowingLostModeInterface;
- (BOOL)_peerPaymentMoneyActionEnabled:(unint64_t)a3;
- (BOOL)_shouldDisplayPayLaterItems;
- (BOOL)_shouldShowAccessPersonInformation;
- (BOOL)_shouldShowAccountActions;
- (BOOL)_shouldShowActionWidgets;
- (BOOL)_shouldShowAutomaticPresentation;
- (BOOL)_shouldShowBankConnect;
- (BOOL)_shouldShowBillingAddressCell;
- (BOOL)_shouldShowCardNumbersSection;
- (BOOL)_shouldShowContactCell;
- (BOOL)_shouldShowDeleteCell;
- (BOOL)_shouldShowNetworkBenefitsCell;
- (BOOL)_shouldShowPrivacyPolicyCell;
- (BOOL)_shouldShowProductBenefitsCell;
- (BOOL)_shouldShowServiceMode;
- (BOOL)_shouldShowServicingSection;
- (BOOL)_shouldShowTermsCell;
- (BOOL)_shouldShowTransactions;
- (BOOL)_shouldShowTransactionsSection;
- (BOOL)_shouldShowTransferCell;
- (BOOL)_showExpressDetails;
- (BOOL)_showPeerPaymentBalanceFDICFooterView;
- (BOOL)_showsAddAccountUserButton;
- (BOOL)_showsTransactionHistorySwitch;
- (BOOL)_transactionCellEditActionsGenerateWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (BOOL)_transactionDeepLinkingEnabled;
- (BOOL)_transactionSectionsDataIsChangedForNewTransactions:(id)a3 oldTransactions:(id)a4 newtransactionCountByPeriod:(id)a5 oldtransactionCountByPeriod:(id)a6;
- (BOOL)_updateHeaderHeightDeterminingLayout:(BOOL)a3;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)canSelectAccountUserRowAtIndexPath:(id)a3;
- (BOOL)handleDeletePassWithUniqueID:(id)a3;
- (BOOL)isRemovingAccountUser;
- (BOOL)isTotalBalanceCellSelectable;
- (BOOL)loadingIdentityDetails;
- (BOOL)passSupportsDeviceAssessment;
- (BOOL)paymentApplicationShouldShowFullDPAN:(id)a3;
- (BOOL)shouldAllowRefresh;
- (BOOL)shouldDrawBottomSeparator:(unint64_t)a3;
- (BOOL)shouldDrawTopSeparator:(unint64_t)a3;
- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 section:(unint64_t)a4;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)shouldShowAccountUserStopSharingSection;
- (BOOL)shouldShowAccountUsersSection;
- (BOOL)shouldShowEligibleSpendSection;
- (BOOL)shouldShowFinancingPlanListSection;
- (BOOL)shouldShowIdentityDocumentSection;
- (BOOL)shouldShowPersonalInformationSection;
- (BOOL)shouldShowReplaceBiometricSection;
- (BOOL)shouldShowVerifySSNSection;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (CGPoint)_normalizedContentOffsetForTargetOffset:(CGPoint)a3;
- (FKAccount)bankConnectAccount;
- (FKBankConnectAccountsProvider)bankConnectAccountsProvider;
- (NSArray)accountUserInvitations;
- (NSArray)sortedFamilyMemberRowModels;
- (NSNumberFormatter)numberFormatter;
- (NSSet)physicalCards;
- (PKAccount)account;
- (PKAccountService)accountService;
- (PKAccountUserCollection)accountUserCollection;
- (PKApplyController)applyController;
- (PKBusinessChatController)businessChatController;
- (PKContactAvatarManager)contactAvatarManager;
- (PKContactResolver)contactResolver;
- (PKFamilyMemberCollection)familyCollection;
- (PKGroupsController)groupsController;
- (PKIdentityReplaceFingerprintHelper)fingeprintHelper;
- (PKPassDeleteHandler)deleteOverrider;
- (PKPassLibraryDataProvider)passLibraryDataProvider;
- (PKPayLaterBusinessChatTopicComposer)payLaterTopicsComposer;
- (PKPayLaterFinancingPlansFetcher)financingPlansFetcher;
- (PKPayLaterPaymentIntentController)paymentIntentController;
- (PKPayLaterSetupFlowController)payLaterSetupFlowController;
- (PKPaymentDataProvider)paymentServiceDataProvider;
- (PKPaymentPass)pass;
- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11;
- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11 rendererState:(id)a12 context:(id)a13 familyCollection:(id)a14 contactAvatarManager:(id)a15 account:(id)a16;
- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10;
- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10 rendererState:(id)a11 context:(id)a12;
- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 style:(int64_t)a7 dataProvider:(id)a8;
- (PKPaymentWebService)webService;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (UIColor)detailTextColor;
- (UIColor)highlightColor;
- (UIColor)linkTextColor;
- (UIColor)primaryTextColor;
- (UIColor)warningTextColor;
- (double)_footerViewHeightForPassStateSectionWithTableView:(id)a3;
- (double)_heightForPassStateSectionWithTableView:(id)a3;
- (double)_offscreenHeaderHeight;
- (double)estimatedHeightForRowAtIndexPath:(id)a3 section:(unint64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSectionCase:(unint64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSectionCase:(unint64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (id)_accountResolutionController;
- (id)_accountServiceBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountServiceCardNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountServiceCreditDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountServiceMakeDefaultCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_accountServicePhysicalCardCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountServiceRewardsDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_actionForCommutePlan:(id)a3;
- (id)_activationFooterView;
- (id)_activeOrderOfSectionIdentifiers;
- (id)_addAccounUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_automaticPresentationCellForTableView:(id)a3;
- (id)_availableActions;
- (id)_availableCommutePlanActions;
- (id)_balanceCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_balanceForRow:(unint64_t)a3;
- (id)_balanceOrCommutePlanCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_balanceReminderCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_barcodeCell;
- (id)_billingAddressCellShowingAddress:(BOOL)a3 forTableView:(id)a4;
- (id)_cardHolderPictureCellForTableView:(id)a3;
- (id)_cellForField:(id)a3 tableView:(id)a4;
- (id)_checkmarkCellWithText:(id)a3 forTableView:(id)a4;
- (id)_commuterRouteCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_configurableSectionForSectionType:(unint64_t)a3;
- (id)_configurableSections;
- (id)_contactInfoAttributedText:(id)a3 phoneNumber:(id)a4;
- (id)_contactKeysToFetch;
- (id)_createTabBarWithSelectedIndex:(int64_t)a3;
- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4;
- (id)_deleteCardCellForTableView:(id)a3;
- (id)_deleteContextualActionForTransaction:(id)a3;
- (id)_deviceAccountNumberCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_disabledCellWithText:(id)a3 forTableView:(id)a4;
- (id)_expressAccessCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_familyMemberCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_familyMemberCellWithRowModel:(id)a3 forTableView:(id)a4;
- (id)_footerTextForPassStateSection;
- (id)_footerViewForAccountUsersSection;
- (id)_footerViewForApplePayProductPrivacySection;
- (id)_footerViewForManualIdentityVerificationSection;
- (id)_footerViewForMerchantTokensSection;
- (id)_footerViewForPassOperationsSection;
- (id)_footerViewForPassStateSection;
- (id)_footerViewForPeerPaymentBalanceSectionWithTableView:(id)a3;
- (id)_footerViewForPendingPeerPaymentAssociatedAccount;
- (id)_headerTitleForPassStateSection;
- (id)_imageViewCellForImage:(id)a3 forTableView:(id)a4;
- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4;
- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6;
- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 reuseIdentifier:(id)a6 forTableView:(id)a7;
- (id)_installmentsPlanCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_legalNoticesFooterWithAttributedString:(id)a3 combineString:(id)a4 outputURL:(id *)a5;
- (id)_linkCellWithText:(id)a3 forTableView:(id)a4;
- (id)_linkedAppCellForTableView:(id)a3;
- (id)_linkedApplicationCellForTableView:(id)a3;
- (id)_manufacturerInfoCellForTableView:(id)a3;
- (id)_merchantTokensCellForTableView:(id)a3;
- (id)_messagesSwitchCellForTableView:(id)a3;
- (id)_moreTransactionsCellForTableView:(id)a3;
- (id)_nfcExpressAccessCellForTableView:(id)a3;
- (id)_passesInGroupCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_paymentApplicationsCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_peerPaymentAccountActionCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentBalanceCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentManualIdentityVerificationCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentMoneyActionCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_peerPaymentParticipantGraduationCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_peerPaymentStatementCellForTableView:(id)a3;
- (id)_privacyTermsSectionCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_recomputeMappedSections;
- (id)_removeCardTextColor;
- (id)_renewActionForRow:(unint64_t)a3 commutePlanIdentifier:(id)a4;
- (id)_settingsExpressTransitURL;
- (id)_settingsTableCellWithTitle:(id)a3 action:(SEL)a4 setOn:(BOOL)a5 enabled:(BOOL)a6;
- (id)_spinnerCellForTableView:(id)a3;
- (id)_stackedInfoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6;
- (id)_subtitleCellForTableView:(id)a3;
- (id)_switchCellWithText:(id)a3 forTableView:(id)a4;
- (id)_topUpActionForRow:(unint64_t)a3;
- (id)_transactionAtIndex:(int64_t)a3;
- (id)_transactionCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_transactionCountByPeriodCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_transactionCountFormatter;
- (id)_transactionDetailViewControllerForTransaction:(id)a3;
- (id)_transactionYearFormatter;
- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_transferCardCellForTableView:(id)a3;
- (id)_uwbExpressAccessCellForTableView:(id)a3;
- (id)_value1CellWithTextColor:(id)a3 forTableView:(id)a4;
- (id)_widgetCellForTableView:(id)a3;
- (id)accountUserStopSharingTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)cellForRow:(unint64_t)a3 inSection:(id)a4;
- (id)contactIssuerHelper;
- (id)contextMenuConfigurationForCopyingText:(id)a3;
- (id)contextMenuConfigurationForTransaction:(id)a3;
- (id)createFooterHyperlinkViewWithText:(id)a3 action:(id)a4;
- (id)createPrivacyFooterViewForContext:(unint64_t)a3 tintColor:(id)a4;
- (id)createPrivacyFooterViewWithText:(id)a3 tintColor:(id)a4 privacyContext:(unint64_t)a5;
- (id)financingPlanListTableVewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)footerForReplaceBiometricIdentityInTableView:(id)a3;
- (id)footerTextForPersonalInformationSection;
- (id)identityDocumentSectionFooter;
- (id)identityDocumentTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)payLaterEligibleSpendTableVewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)personalInformationTableVewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)presentationContext;
- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3;
- (id)privacyFooterAttributedStringWithText:(id)a3 privacyContext:(unint64_t)a4 outputURL:(id *)a5;
- (id)replaceBiometricTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (id)tableView:(id)a3 contextMenuConfigurationForCardInfoAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 section:(unint64_t)a6;
- (id)tableView:(id)a3 contextMenuConfigurationForTransactionAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (id)tableView:(id)a3 viewForFooterInSectionCase:(unint64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSectionCase:(unint64_t)a4;
- (id)titleForFooterInSection:(unint64_t)a3;
- (id)titleForHeaderInSection:(unint64_t)a3;
- (id)verifySSNTableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (int64_t)_numberOfAccountServiceCreditDetailsRowsEnabled;
- (int64_t)_numberOfAccountServicePhysicalCardRowsEnabled;
- (int64_t)_numberOfAccountServiceRewardsRowsEnabled;
- (int64_t)_rowIndexForExpressTransitSettingsCell;
- (int64_t)_transitCellGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (int64_t)activeFinancingPlansCount;
- (int64_t)completedFinancingPlansCount;
- (int64_t)detailViewStyle;
- (int64_t)editingStyleForRowAtIndexPath:(id)a3 section:(unint64_t)a4;
- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3;
- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3;
- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionCase:(unint64_t)a4;
- (unint64_t)_accessPersonInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_accountFeature;
- (unint64_t)_accountServiceCreditDetailsRowForRowIndex:(int64_t)a3;
- (unint64_t)_accountServicePhysicalCardRowForRowIndex:(int64_t)a3;
- (unint64_t)_accountServiceRewardsRowForRowIndex:(int64_t)a3;
- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_contactBankCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_numberOfPeerPaymentMoneyActionsEnabled;
- (unint64_t)_numberOfPrivacyTermsInfoRows;
- (unint64_t)_passOperationsCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_passStateSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_peerPaymentMoneyActionForRowIndex:(unint64_t)a3;
- (unint64_t)_privacyTermsInfoRowTypeForRowIndex:(int64_t)a3;
- (unint64_t)_removeUnsupportedContactIssuerOptions:(unint64_t)a3;
- (unint64_t)_rowIndexForAccountServicePhysicalCardRow:(unint64_t)a3;
- (unint64_t)_rowIndexForPeerPaymentActionRow:(unint64_t)a3;
- (unint64_t)_rowIndexForPrivacyTermsInfoRowType:(unint64_t)a3;
- (unint64_t)_transactionsCount;
- (unint64_t)numberOfAccountUserRowsInTableView:(id)a3;
- (unint64_t)numberOfIdentityDocumentRowsInTableView:(id)a3;
- (unint64_t)numberOfReplaceBiometricRowsInTableView:(id)a3;
- (void)_accountUsersForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_activationFooterPressed:(id)a3;
- (void)_ampEligbilityUpdated:(BOOL)a3;
- (void)_applyDefaultDynamicStylingToCell:(id)a3;
- (void)_applyDefaultStaticStylingToCell:(id)a3;
- (void)_applyIvarsFromCollectedPropertiesViewModel:(id)a3;
- (void)_applyStaticPassPropertiesForPass;
- (void)_automaticPresentationSwitchChanged:(id)a3;
- (void)_beginReportingForSubjectIfNecessary:(id)a3;
- (void)_buildSections;
- (void)_cancelPendingTransactionTimer;
- (void)_dailyCashSwitchChanged:(id)a3;
- (void)_decorateSections;
- (void)_didSelectAccountServiceBankAccountsAtIndexPath:(id)a3;
- (void)_didSelectAccountServiceCardNumbersAtIndexPath:(id)a3;
- (void)_didSelectAccountServiceMakeDefaultAtIndexPath:(id)a3;
- (void)_didSelectAccountServicePhysicalCardAtIndexPath:(id)a3;
- (void)_didSelectAccountServiceRewardsDetailsAtIndexPath:(id)a3;
- (void)_didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:(id)a3;
- (void)_didSelectBalanceAtRowIndex:(int64_t)a3;
- (void)_didSelectBalanceOrCommutePlanCellAtIndexPath:(id)a3;
- (void)_didSelectBillingAddress;
- (void)_didSelectCardInfoCellAtIndexPath:(id)a3;
- (void)_didSelectCommutePlanAtRowIndex:(int64_t)a3;
- (void)_didSelectContactBankSectionAtIndexPath:(int64_t)a3;
- (void)_didSelectCreditDetailsCell:(id)a3;
- (void)_didSelectDeleteCard;
- (void)_didSelectFamilySharingAtIndexPath:(id)a3;
- (void)_didSelectFixPeerPaymentAtIndexPath:(id)a3;
- (void)_didSelectInstallmentPlansAtIndexPath:(id)a3;
- (void)_didSelectMerchantTokensCell;
- (void)_didSelectNetworkBenefitsCell;
- (void)_didSelectPassInGroupAtIndexPath:(id)a3;
- (void)_didSelectPassOperationsSectionAtIndexPath:(id)a3;
- (void)_didSelectPassStateSection;
- (void)_didSelectPaymentApplicationSectionRowAtIndexPath:(id)a3;
- (void)_didSelectPeerPaymentAccountActionAtIndexPath:(id)a3;
- (void)_didSelectPeerPaymentBankAccountsAtIndexPath:(id)a3;
- (void)_didSelectPeerPaymentManualIdentityVerificationAtIndexPath:(id)a3;
- (void)_didSelectPeerPaymentMoneyActionAtRow:(int64_t)a3;
- (void)_didSelectPeerPaymentParticipantGradutionAtIndexPath:(id)a3;
- (void)_didSelectPeerPaymentStatementAtIndexPath:(id)a3;
- (void)_didSelectPrivacySectionAtRow:(int64_t)a3;
- (void)_didSelectProductBenefitsCell;
- (void)_didSelectRedeemAtIndexPath:(id)a3;
- (void)_didSelectServicingWalletLink;
- (void)_didSelectTransactionAtIndexPath:(id)a3;
- (void)_didSelectTransactionCountByPeriodAtIndexPath:(id)a3;
- (void)_didSelectTransactionTransactionsSwitchInTableView:(id)a3 atIndexPath:(id)a4;
- (void)_didSelectTransferCardAtIndexPath:(id)a3;
- (void)_didSelectTransferToBank;
- (void)_didSelectTransitTicketAtRow:(int64_t)a3;
- (void)_done:(id)a3;
- (void)_doneLoadingPeerPaymentAccountAction;
- (void)_endReportingIfNecessary;
- (void)_expressAccessSwitchChanged:(id)a3 isUWB:(BOOL)a4;
- (void)_expressPassDidChange;
- (void)_fetchBalanceRemindersWithActionForBalanceIdentifier:(id)a3 transitProperties:(id)a4 balances:(id)a5 pass:(id)a6 withCompletion:(id)a7;
- (void)_fetchMerchantTokens;
- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3;
- (void)_handlePeerPaymentPreferencestDidChangeNotification:(id)a3;
- (void)_handleProvisioningError:(id)a3;
- (void)_handleUpdatedBalanceReminder:(id)a3 forBalanceWithIdentifier:(id)a4;
- (void)_ingestPassFields;
- (void)_loadAdditionalAccountDataWithCompletion:(id)a3;
- (void)_loadBankConnectTransactions;
- (void)_loadFamilyCollectionIfNecessaryWithCompletion:(id)a3;
- (void)_messagesSwitchChanged:(id)a3;
- (void)_nfcExpressAccessSwitchChanged:(id)a3;
- (void)_normalizeContentOffset;
- (void)_notificationSwitchChanged:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)_passSettingsChanged:(id)a3;
- (void)_pendingInvitationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_preflightWatchForTransferWithCompletion:(id)a3;
- (void)_presentInvitation:(id)a3 completion:(id)a4;
- (void)_presentLegalDisclosureViewController;
- (void)_presentMerchantDetailsViewWithTransaction:(id)a3 forCell:(id)a4;
- (void)_presentPhysicalCardPasswordAuthorization:(id)a3;
- (void)_presentStopSharingAlertForTableView:(id)a3 indexPath:(id)a4;
- (void)_presentTermsAndConditionsWithRow:(unint64_t)a3;
- (void)_presentVerificationFlow;
- (void)_refreshDisplayWithBalances:(id)a3 plans:(id)a4 transitProperties:(id)a5;
- (void)_refreshFinished:(BOOL)a3;
- (void)_refreshPaymentApplicationsSelection;
- (void)_refreshStaleBalanceModelForPass:(id)a3 completion:(id)a4;
- (void)_reloadMerchantTokenRows;
- (void)_reloadPassAndView;
- (void)_reloadTitle;
- (void)_reloadTransactionSectionsAnimated:(BOOL)a3 forceReload:(BOOL)a4;
- (void)_reloadTransactionSourceCollectionIfNecessary;
- (void)_reloadTransactionsWithCompletion:(id)a3;
- (void)_reloadView;
- (void)_reportAddAccountUser;
- (void)_reportExpressModeDisable:(id)a3;
- (void)_reportExpressModeEnable:(id)a3;
- (void)_reportExpressModeEnableFailed:(id)a3;
- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4;
- (void)_reportPassDetailsAnalyticsForTappedButtonTag:(id)a3 additionalAnalytics:(id)a4;
- (void)_reportPassDetailsAnalyticsForTappedRowTag:(id)a3 additionalAnalytics:(id)a4;
- (void)_reportPassDetailsAnalyticsForToggleTag:(id)a3 toggleResult:(BOOL)a4 additionalAnalytics:(id)a5;
- (void)_setExpressAccessEnabled:(BOOL)a3 isUWB:(BOOL)a4 paymentSetupContext:(int64_t)a5 authenticationCredential:(id)a6;
- (void)_showPeerPaymentActionViewControllerForAction:(unint64_t)a3;
- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 detailText:(id)a5;
- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 overrideTextColor:(id)a5;
- (void)_startPendingTransactionTimer;
- (void)_tabBarSegmentChanged:(id)a3;
- (void)_transactionsSwitchChanged:(id)a3;
- (void)_updateAmpEligibility;
- (void)_updateBalanceIfNecessary;
- (void)_updateCashbackPeerPaymentResolutionSection;
- (void)_updateDisplayableBalances;
- (void)_updateDisplayableBalancesPlansAndTransitPropertiesForPass:(id)a3 balances:(id)a4 plans:(id)a5 transitProperties:(id)a6 withCompletion:(id)a7;
- (void)_updateExpressPassInformation;
- (void)_updateFamilyRows;
- (void)_updateHeaderActionView;
- (void)_updatePassPropertiesForPass:(id)a3;
- (void)_updatePassPropertiesForPass:(id)a3 completion:(id)a4;
- (void)_updatePassSnapshot;
- (void)_updatePassesInGroupSectionWithUpdatedGroup:(id)a3;
- (void)_updatePeerPaymentAccount;
- (void)_updatePeerPaymentFamilyMemberRows;
- (void)_updatePeerPaymentPreferences;
- (void)_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary;
- (void)_updatePeerPaymentPreferencesWithNewPreferences:(id)a3;
- (void)_updateSectionControllersWithSelectedSectionSegment;
- (void)_updateTabBar;
- (void)_updateTabBarWithSegments:(id)a3;
- (void)_uwbExpressAccessSwitchChanged:(id)a3;
- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)addMoney;
- (void)ampEnrollmentManager:(id)a3 didEnrollPaymentPass:(id)a4 success:(BOOL)a5;
- (void)appViewContentSizeChanged:(id)a3;
- (void)autoReloadSetupControllerDidComplete;
- (void)balanceDetailsViewController:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5;
- (void)callIssuer;
- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)contactSupportSectionControllerDidSelect:(id)a3;
- (void)contactsDidChangeForContactResolver:(id)a3;
- (void)contentIsLoaded;
- (void)dealloc;
- (void)deleteTransaction:(id)a3 completionHandler:(id)a4;
- (void)didChangeVerificationPresentation;
- (void)didEvaluatePolicyToOpenBankConnectAccountCredentials:(id)a3 accountCredentialsTitle:(id)a4;
- (void)didFindLinkableBankConnectInstitution;
- (void)didReloadBankConnectAccountCredentials;
- (void)didSelectAccountUserCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectDeleteReAddForSectionController:(id)a3 completion:(id)a4;
- (void)didSelectFinancingPlanListCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectIdentityDocumentCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectInDemoMode;
- (void)didSelectMakePayment;
- (void)didSelectPayLaterEligibleSpendCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectPayment:(id)a3;
- (void)didSelectPersonalInformationCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectPrecursorPassRequestForDescription:(id)a3 controller:(id)a4 completion:(id)a5;
- (void)didSelectReplaceBiometricCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didSelectVerifySSNCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)didStartBankConnectAuthorizationForInstitution:(id)a3 withCompletion:(id)a4;
- (void)didUpdateBankConnectAccount:(id)a3;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)didUpdateLatestTransactions:(id)a3 monthlyTransactionGroups:(id)a4 yearlyTransactionGroups:(id)a5;
- (void)dismissVerificationViewControllerAnimated:(BOOL)a3;
- (void)emailIssuer;
- (void)executeAfterContentIsLoaded:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)fetchFinancingPlansIfNecessary;
- (void)handleOpenBusinessChatForPayLater;
- (void)launchAppURL:(id)a3;
- (void)launchURL:(id)a3;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)loadAccountUsersWithCompletion:(id)a3;
- (void)loadPendingAccountUserInvitationsWithCompletion:(id)a3;
- (void)loadView;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4;
- (void)merchantTokensViewController:(id)a3 didDeleteMerchantToken:(id)a4;
- (void)openBusinessChat;
- (void)openIssuerWebsite;
- (void)passHeaderViewPassWasDeleted:(id)a3;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentSetupDidFinish:(id)a3;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)peerPaymentActionViewControllerDidCancel:(id)a3;
- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)performPaymentPassActionBundle:(id)a3;
- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)postServiceModeNotification;
- (void)presentAccountUserDetailsForAccountUserAltDSID:(id)a3;
- (void)presentAccountUserDetailsForRowModel:(id)a3;
- (void)presentAccountUserInvitationForRowModel:(id)a3;
- (void)presentAccountUserInvitationWithIdentifier:(id)a3;
- (void)presentActivatePhysicalCard;
- (void)presentAddAccountUser;
- (void)presentAddCard;
- (void)presentAuthRequestForPolicy:(int64_t)a3 completion:(id)a4;
- (void)presentAutoReload;
- (void)presentBalanceDetails;
- (void)presentBankAccounts;
- (void)presentBillPayment;
- (void)presentCardNumbers;
- (void)presentCombinedPassActionViewControllerFromBundle:(id)a3;
- (void)presentContactIssuerSheet;
- (void)presentDailyCashForDateComponents:(id)a3;
- (void)presentFinancingPlan:(id)a3;
- (void)presentISO18013Details;
- (void)presentIdentityVerification;
- (void)presentInstallmentPlanWithIdentifier:(id)a3;
- (void)presentInstallmentPlansForFeature:(unint64_t)a3;
- (void)presentMakeDefaultAtApple;
- (void)presentOrderPhysicalCard;
- (void)presentPassActionViewController:(id)a3;
- (void)presentPassDetailDrillInForField:(id)a3;
- (void)presentPayLaterAccountErrorsIfNecessary;
- (void)presentRecurringPaymentsWithIdentifier:(id)a3;
- (void)presentReplacePhysicalCard;
- (void)presentSchedulePayments;
- (void)presentShareAccount;
- (void)presentTermsAcceptance;
- (void)presentTermsAndConditions;
- (void)presentTopUp;
- (void)presentTrackPhysicalCard;
- (void)presentTransactionDetailsForTransaction:(id)a3 animated:(BOOL)a4;
- (void)presentTransferToBank;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)recomputeMappedSectionsAndReloadSections:(id)a3;
- (void)redeemGiftCard;
- (void)refreshControlValueChanged:(id)a3;
- (void)reloadData:(BOOL)a3;
- (void)reloadPassDetailSections:(id)a3;
- (void)reloadSection:(unint64_t)a3;
- (void)reloadSections:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAccount:(id)a3;
- (void)setAccountService:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setAccountUserInvitations:(id)a3;
- (void)setActiveFinancingPlansCount:(int64_t)a3;
- (void)setApplyController:(id)a3;
- (void)setBankConnectAccount:(id)a3;
- (void)setBankConnectAccountsProvider:(id)a3;
- (void)setBusinessChatController:(id)a3;
- (void)setCompletedFinancingPlansCount:(int64_t)a3;
- (void)setContactAvatarManager:(id)a3;
- (void)setContactResolver:(id)a3;
- (void)setDeleteOverrider:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setDetailViewStyle:(int64_t)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setFinancingPlansFetcher:(id)a3;
- (void)setFingeprintHelper:(id)a3;
- (void)setGroupsController:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setLoadingIdentityDetails:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPass:(id)a3;
- (void)setPassLibraryDataProvider:(id)a3;
- (void)setPayLaterSetupFlowController:(id)a3;
- (void)setPayLaterTopicsComposer:(id)a3;
- (void)setPaymentIntentController:(id)a3;
- (void)setPaymentServiceDataProvider:(id)a3;
- (void)setPeerPaymentWebService:(id)a3;
- (void)setPhysicalCards:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setRemovingAccountUser:(BOOL)a3;
- (void)setShowDoneButton:(BOOL)a3;
- (void)setSortedFamilyMemberRowModels:(id)a3;
- (void)setTransactionSourceCollection:(id)a3;
- (void)setWarningTextColor:(id)a3;
- (void)setWebService:(id)a3;
- (void)sharesSectionControllerDidSelectViewEntitlements:(id)a3;
- (void)showStatementDetailsWithIdentifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 section:(unint64_t)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)updateActivationFooterViewContents;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillMoveToWindow:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PKPaymentPassDetailViewController

- (BOOL)shouldShowAccountUsersSection
{
  v3 = [(PKPaymentPassDetailViewController *)self account];
  v4 = v3;
  if (v3 && ([v3 creditDetails], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [(PKPaymentPassDetailViewController *)self transactionSourceCollection];
    BOOL v7 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:v6 withAccount:v4];

    char v8 = !v7;
  }
  else
  {
    char v8 = 1;
  }
  v9 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  uint64_t v10 = [v9 count];

  char v11 = v8 ^ 1;
  if ((v8 & 1) == 0 && !v10) {
    char v11 = [(PKPaymentPassDetailViewController *)self _showsAddAccountUserButton];
  }

  return v11;
}

- (BOOL)canSelectAccountUserRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  unint64_t v6 = [v5 count];

  unint64_t v7 = [v4 row];
  if (v7 >= v6)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    char v8 = [(PKPaymentPassDetailViewController *)self account];
    [v8 state];
    int v9 = PKAccountStateIsTerminal() ^ 1;
  }
  return v9;
}

- (unint64_t)numberOfAccountUserRowsInTableView:(id)a3
{
  id v4 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  uint64_t v5 = [v4 count];
  unint64_t v6 = v5 + [(PKPaymentPassDetailViewController *)self _showsAddAccountUserButton];

  return v6;
}

- (id)accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  unint64_t v9 = [v8 count];

  if ([v6 row] >= v9) {
    [(PKPaymentPassDetailViewController *)self _addAccounUserTableViewCellForTableView:v7 atIndexPath:v6];
  }
  else {
  uint64_t v10 = [(PKPaymentPassDetailViewController *)self _accountUserTableViewCellForTableView:v7 atIndexPath:v6];
  }

  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F851A0]];

  return v10;
}

- (void)didSelectAccountUserCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  id v21 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  unint64_t v6 = [v21 count];
  unint64_t v7 = [v5 row];

  if (v7 >= v6)
  {
    [(PKPaymentPassDetailViewController *)self presentAddAccountUser];
  }
  else
  {
    char v8 = [v21 objectAtIndex:v7];
    unint64_t v9 = [v8 accountUser];
    uint64_t v10 = [v8 invitation];
    char v11 = (void *)v10;
    if (v9)
    {
      [(PKPaymentPassDetailViewController *)self presentAccountUserDetailsForRowModel:v8];
    }
    else if (v10)
    {
      v20 = [PKAccountUserDetailViewController alloc];
      v12 = [(PKPaymentPassDetailViewController *)self pass];
      int64_t v13 = [(PKPaymentPassDetailViewController *)self detailViewStyle];
      v14 = [(PKPaymentPassDetailViewController *)self account];
      v15 = [(PKPaymentPassDetailViewController *)self familyCollection];
      v16 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
      v17 = [(PKPaymentPassDetailViewController *)self contactResolver];
      v18 = [(PKAccountUserDetailViewController *)v20 initWithPaymentPass:v12 style:v13 account:v14 accountUserInvitation:v11 familyMemberCollection:v15 avatarManager:v16 contactResolver:v17];

      v19 = [(PKPaymentPassDetailViewController *)self navigationController];
      [v19 pushViewController:v18 animated:1];
    }
  }
}

- (BOOL)shouldShowAccountUserStopSharingSection
{
  v2 = [(PKPaymentPassDetailViewController *)self accountUserCollection];
  v3 = [v2 currentAccountUser];

  if (v3) {
    BOOL v4 = [v3 accessLevel] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)accountUserStopSharingTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [(PKPaymentPassDetailViewController *)self _removeCardTextColor];
  unint64_t v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v6 forTableView:v5];

  char v8 = [v7 textLabel];
  unint64_t v9 = PKLocalizedMadisonString(&cfstr_StopUsingShare.isa);
  [v8 setText:v9];

  [(PKPaymentPassDetailViewController *)self _showSpinner:[(PKPaymentPassDetailViewController *)self isRemovingAccountUser] inCell:v7 overrideTextColor:v6];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85310]];

  return v7;
}

- (void)loadAccountUsersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self account];
  unint64_t v6 = [v5 accountIdentifier];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__PKPaymentPassDetailViewController_PKAccountUser__loadAccountUsersWithCompletion___block_invoke;
    v7[3] = &unk_1E59CABE0;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentPassDetailViewController *)self _accountUsersForAccountIdentifier:v6 completion:v7];
  }
}

uint64_t __83__PKPaymentPassDetailViewController_PKAccountUser__loadAccountUsersWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAccountUserCollection:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)loadPendingAccountUserInvitationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self account];
  unint64_t v6 = [v5 accountIdentifier];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__PKPaymentPassDetailViewController_PKAccountUser__loadPendingAccountUserInvitationsWithCompletion___block_invoke;
    v7[3] = &unk_1E59CAD40;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentPassDetailViewController *)self _pendingInvitationsForAccountIdentifier:v6 completion:v7];
  }
}

uint64_t __100__PKPaymentPassDetailViewController_PKAccountUser__loadPendingAccountUserInvitationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAccountUserInvitations:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)presentAccountUserDetailsForRowModel:(id)a3
{
  id v4 = a3;
  id v5 = [PKAccountUserDetailViewController alloc];
  unint64_t v6 = [(PKPaymentPassDetailViewController *)self pass];
  int64_t v7 = [(PKPaymentPassDetailViewController *)self detailViewStyle];
  id v8 = [(PKPaymentPassDetailViewController *)self account];
  unint64_t v9 = [v4 accountUser];

  uint64_t v10 = [(PKPaymentPassDetailViewController *)self familyCollection];
  char v11 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
  v12 = [(PKPaymentPassDetailViewController *)self contactResolver];
  v14 = [(PKAccountUserDetailViewController *)v5 initWithPaymentPass:v6 style:v7 account:v8 accountUser:v9 familyMemberCollection:v10 avatarManager:v11 contactResolver:v12];

  int64_t v13 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v13 pushViewController:v14 animated:1];
}

- (void)presentAccountUserInvitationForRowModel:(id)a3
{
  id v4 = [a3 invitation];
  [(PKPaymentPassDetailViewController *)self _presentInvitation:v4 completion:0];
}

- (BOOL)shouldShowVerifySSNSection
{
  v2 = [(PKPaymentPassDetailViewController *)self accountUserCollection];
  v3 = [v2 currentAccountUser];

  LOBYTE(v2) = [v3 identityStatus] == 2;
  return (char)v2;
}

- (id)verifySSNTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  unint64_t v6 = PKLocalizedMadisonString(&cfstr_BuildCreditHis.isa);
  int64_t v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v6 forTableView:v5];

  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85310]];

  return v7;
}

- (void)didSelectVerifySSNCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [PKAccountVerifySSNPageViewController alloc];
  unint64_t v6 = [(PKPaymentPassDetailViewController *)self account];
  int64_t v7 = [(PKPaymentPassDetailViewController *)self detailViewStyle];
  uint64_t v8 = 3;
  if (v7 != 1) {
    uint64_t v8 = 0;
  }
  if (v7 == 2) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  char v11 = [(PKAccountVerifySSNPageViewController *)v5 initWithAccount:v6 context:v9];

  uint64_t v10 = [[PKNavigationController alloc] initWithRootViewController:v11];
  [(PKPaymentPassDetailViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)_presentInvitation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = (objc_class *)MEMORY[0x1E4F84BB8];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = [MEMORY[0x1E4F84D50] sharedService];
  char v11 = (void *)[v9 initWithWebService:v10];

  v12 = [PKApplyControllerConfiguration alloc];
  int64_t v13 = [(PKPaymentPassDetailViewController *)self detailViewStyle];
  uint64_t v14 = 3;
  if (v13 != 1) {
    uint64_t v14 = 0;
  }
  if (v13 == 2) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = v14;
  }
  v16 = [(PKApplyControllerConfiguration *)v12 initWithSetupDelegate:0 context:v15 provisioningController:v11];
  [(PKApplyControllerConfiguration *)v16 setFeatureApplication:v8];

  v17 = [[PKApplyController alloc] initWithApplyConfiguration:v16];
  v18 = (void *)MEMORY[0x1E4F841A8];
  v19 = [(PKPaymentPassDetailViewController *)self account];
  v20 = [v18 analyticsAccountTypeForAccount:v19];
  [(PKApplyController *)v17 setAnalyticsExistingAccountType:v20];

  [(PKPaymentPassDetailViewController *)self setApplyController:v17];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PKPaymentPassDetailViewController_PKAccountUser___presentInvitation_completion___block_invoke;
  v22[3] = &unk_1E59CAC08;
  v22[4] = self;
  id v23 = v6;
  id v21 = v6;
  [(PKApplyController *)v17 nextViewControllerWithCompletion:v22];
}

void __82__PKPaymentPassDetailViewController_PKAccountUser___presentInvitation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [[PKNavigationController alloc] initWithRootViewController:v9];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  int64_t v7 = v6;
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];

LABEL_6:
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (id)_removeCardTextColor
{
  v2 = [(PKPaymentPassDetailViewController *)self warningTextColor];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  id v5 = v4;

  return v5;
}

- (void)_presentStopSharingAlertForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PKPaymentPassDetailViewController *)self isRemovingAccountUser])
  {
    uint64_t v8 = PKLocalizedMadisonString(&cfstr_StopUsingShare_0.isa);
    id v9 = PKLocalizedMadisonString(&cfstr_StopUsingShare_1.isa);
    uint64_t v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v9 preferredStyle:0];
    char v11 = (void *)MEMORY[0x1E4FB1410];
    v12 = PKLocalizedMadisonString(&cfstr_StopUsingShare_2.isa);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke;
    v17[3] = &unk_1E59CAC80;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    int64_t v13 = [v11 actionWithTitle:v12 style:2 handler:v17];
    [v10 addAction:v13];

    uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v15 = PKLocalizedMadisonString(&cfstr_StopUsingShare_3.isa);
    v16 = [v14 actionWithTitle:v15 style:1 handler:0];
    [v10 addAction:v16];

    [(PKPaymentPassDetailViewController *)self presentViewController:v10 animated:1 completion:0];
  }
}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] account];
  [a1[4] setRemovingAccountUser:1];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = [a1[5] cellForRowAtIndexPath:a1[6]];
  id v5 = [a1[4] _removeCardTextColor];
  [a1[4] _showSpinner:1 inCell:v21[5] overrideTextColor:v5];
  id v6 = [a1[4] accountService];
  id v7 = [a1[4] accountUserCollection];
  uint64_t v8 = [v7 currentAccountUser];
  id v9 = [v8 altDSID];
  uint64_t v10 = [v4 accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_48;
  v14[3] = &unk_1E59CAC58;
  id v11 = a1[5];
  v14[4] = a1[4];
  id v19 = &v20;
  id v15 = v11;
  id v16 = a1[6];
  id v12 = v5;
  id v17 = v12;
  id v13 = v4;
  id v18 = v13;
  [v6 deleteAccountUserWithAltDSID:v9 forAccountWithIdentifier:v10 completion:v14];

  _Block_object_dispose(&v20, 8);
}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_2;
  block[3] = &unk_1E59CAC30;
  uint64_t v4 = *(void *)(a1 + 72);
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v13 = v4;
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = v3;
  id v12 = *(id *)(a1 + 64);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setRemovingAccountUser:0];
  uint64_t v2 = [*(id *)(a1 + 40) cellForRowAtIndexPath:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _showSpinner:0 inCell:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) overrideTextColor:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5)
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v5, [*(id *)(a1 + 72) feature], 0, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) pass];
    id v6 = [*(id *)(a1 + 32) deleteOverrider];
    id v7 = [*(id *)(a1 + 32) passLibraryDataProvider];
    +[PKPassDeleteHelper deletePaymentPass:v8 withDeleteHander:v6 passLibraryDataProvider:v7 presentingViewController:*(void *)(a1 + 32)];
  }
}

- (void)presentAddAccountUser
{
  uint64_t v3 = [(PKPaymentPassDetailViewController *)self account];
  uint64_t v4 = [(PKPaymentPassDetailViewController *)self accountUserCollection];
  uint64_t v5 = [(PKPaymentPassDetailViewController *)self familyCollection];
  int64_t v6 = [(PKPaymentPassDetailViewController *)self detailViewStyle];
  uint64_t v7 = 3;
  if (v6 != 1) {
    uint64_t v7 = 0;
  }
  if (v6 == 2) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:self account:v3 accountUserCollection:v4 familyMemberCollection:v5 context:v8 completion:0];

  [(PKPaymentPassDetailViewController *)self _reportAddAccountUser];
}

- (void)_accountUsersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  int64_t v6 = (void *)MEMORY[0x1E4F84270];
  id v7 = a3;
  uint64_t v8 = [v6 sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_1E59CACA8;
  id v11 = v5;
  id v9 = v5;
  [v8 accountUsersForAccountWithIdentifier:v7 completion:v10];
}

void __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F842C8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithAccountUsers:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E59CAD68;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_pendingInvitationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self paymentServiceDataProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_1E59CACF0;
  id v11 = v6;
  id v9 = v6;
  [v8 featureApplicationsForAccountIdentifier:v7 completion:v10];
}

void __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E59CAD18;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pk_objectsPassingTest:", &__block_literal_global_1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 applicationType] == 2)
  {
    [v2 applicationState];
    uint64_t IsPendingInvitation = PKFeatureApplicationStateIsPendingInvitation();
  }
  else
  {
    uint64_t IsPendingInvitation = 0;
  }

  return IsPendingInvitation;
}

- (id)_accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"AccountUserCellReuseIdentifier"];
  if (!v7) {
    id v7 = [[PKFamilyMemberTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"AccountUserCellReuseIdentifier"];
  }
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self sortedFamilyMemberRowModels];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  [(PKFamilyMemberTableViewCell *)v7 setRowModel:v9];
  BOOL v10 = [(PKPaymentPassDetailViewController *)self canSelectAccountUserRowAtIndexPath:v6];

  if (!v10) {
    [(PKFamilyMemberTableViewCell *)v7 setAccessoryType:0];
  }

  return v7;
}

- (id)_addAccounUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v4 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"AddAccountUserCellReuseIdentifier", a4);
  if (!v4) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"AddAccountUserCellReuseIdentifier"];
  }
  id v5 = [v4 defaultContentConfiguration];
  id v6 = PKLocalizedMadisonString(&cfstr_ShareMyCard.isa);
  [v5 setText:v6];

  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  [v5 setImage:v7];

  uint64_t v8 = [v5 textProperties];
  id v9 = [MEMORY[0x1E4FB1618] linkColor];
  [v8 setColor:v9];

  [v4 setContentConfiguration:v5];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F851E8]];

  return v4;
}

- (BOOL)_showsAddAccountUserButton
{
  id v2 = [(PKPaymentPassDetailViewController *)self account];
  BOOL v3 = +[PKAccountInvitationController canInviteAccountUserWithAccount:v2];

  return v3;
}

- (void)_reportAddAccountUser
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKPaymentPassDetailViewController *)self account];
  if (v4)
  {
    id v5 = [(PKPaymentPassDetailViewController *)self account];
    id v6 = [v5 analyticsEventAccountType];
  }
  else
  {
    id v6 = (id)*MEMORY[0x1E4F86320];
  }

  if (v6) {
    [v3 setObject:v6 forKey:*MEMORY[0x1E4F86310]];
  }
  [v3 setObject:*MEMORY[0x1E4F86C58] forKey:*MEMORY[0x1E4F86BB0]];
  [v3 setObject:*MEMORY[0x1E4F86468] forKey:*MEMORY[0x1E4F86308]];
  v30 = v3;
  [v3 setObject:*MEMORY[0x1E4F86768] forKey:*MEMORY[0x1E4F86730]];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [(PKPaymentPassDetailViewController *)self accountUserCollection];
  uint64_t v8 = [v7 accountUsers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  v29 = v6;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v31 = 0;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (([v15 isCurrentUser] & 1) == 0)
        {
          id v16 = [(PKPaymentPassDetailViewController *)self familyCollection];
          id v17 = [v15 altDSID];
          id v18 = [v16 familyMemberForAltDSID:v17];

          uint64_t v19 = [v18 memberType];
          switch(v19)
          {
            case 2:
              ++v31;
              break;
            case 1:
              ++v12;
              break;
            case 0:
              ++v11;
              break;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v31 = 0;
  }

  uint64_t v20 = [NSNumber numberWithInteger:v11];
  id v21 = [v20 stringValue];
  [v30 setObject:v21 forKey:*MEMORY[0x1E4F85FC8]];

  uint64_t v22 = [NSNumber numberWithInteger:v12];
  id v23 = [v22 stringValue];
  [v30 setObject:v23 forKey:*MEMORY[0x1E4F85FD8]];

  v24 = [NSNumber numberWithInteger:v31];
  id v25 = [v24 stringValue];
  [v30 setObject:v25 forKey:*MEMORY[0x1E4F85FD0]];

  v26 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v27 = *MEMORY[0x1E4F86FF0];
  v28 = (void *)[v30 copy];
  [v26 subject:v27 sendEvent:v28];
}

- (BOOL)_shouldDisplayPayLaterItems
{
  id v2 = [(PKPaymentPassDetailViewController *)self account];
  char v3 = PKCanShowPayLaterPassItemsForAccount();

  return v3;
}

- (BOOL)shouldShowPersonalInformationSection
{
  char v3 = [(PKPaymentPassDetailViewController *)self account];
  uint64_t v4 = [v3 payLaterDetails];
  id v5 = (void *)v4;
  char v6 = 0;
  if (v3 && v4)
  {
    if ([(PKPaymentPassDetailViewController *)self _shouldDisplayPayLaterItems])
    {
      id v7 = [v5 userInfo];
      char v6 = [v7 hasUserInfo];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)shouldShowFinancingPlanListSection
{
  BOOL v3 = [(PKPaymentPassDetailViewController *)self activeFinancingPlansCount] > 0
    || [(PKPaymentPassDetailViewController *)self completedFinancingPlansCount] > 0;
  BOOL v4 = [(PKPaymentPassDetailViewController *)self _shouldDisplayPayLaterItems];
  if (v4) {
    LOBYTE(v4) = [(PKPaymentPassDetailViewController *)self _canFetchFinancingPlans] && v3;
  }
  return v4;
}

- (BOOL)shouldShowEligibleSpendSection
{
  BOOL v3 = [(PKPaymentPassDetailViewController *)self account];
  if ([(PKPaymentPassDetailViewController *)self _shouldDisplayPayLaterItems]
    && [(PKPaymentPassDetailViewController *)self _canFetchFinancingPlans])
  {
    BOOL v4 = [v3 payLaterDetails];
    if ([v4 isPayLaterSupportedInCurrentRegion] && objc_msgSend(v3, "state") != 2) {
      int v5 = [v3 hidePayLaterSetupInWallet] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)footerTextForPersonalInformationSection
{
  return (id)PKLocalizedCocoonString(&cfstr_PersonalInform.isa);
}

- (id)personalInformationTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  char v6 = [(PKPaymentPassDetailViewController *)self primaryTextColor];
  if (v6)
  {
    id v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v6 forTableView:v5];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
    id v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v8 forTableView:v5];
  }
  uint64_t v9 = [v7 textLabel];
  uint64_t v10 = PKLocalizedCocoonString(&cfstr_PersonalInform_0.isa);
  [v9 setText:v10];

  [v7 setAccessoryType:1];

  return v7;
}

- (id)financingPlanListTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  char v6 = [(PKPaymentPassDetailViewController *)self primaryTextColor];
  if (v6)
  {
    id v7 = [(PKPaymentPassDetailViewController *)self _value1CellWithTextColor:v6 forTableView:v5];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
    id v7 = [(PKPaymentPassDetailViewController *)self _value1CellWithTextColor:v8 forTableView:v5];
  }
  int64_t v9 = [(PKPaymentPassDetailViewController *)self activeFinancingPlansCount];
  if (v9)
  {
    int64_t v10 = v9;
    uint64_t v11 = [(PKPaymentPassDetailViewController *)self numberFormatter];
    uint64_t v12 = [NSNumber numberWithInteger:v10];
    uint64_t v13 = [v11 stringFromNumber:v12];
    uint64_t v14 = PKLocalizedCocoonString(&cfstr_NumberActiveIn.isa, &stru_1EF1B4C70.isa, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = [v7 textLabel];
  id v16 = PKLocalizedCocoonString(&cfstr_AllPurchases.isa);
  [v15 setText:v16];

  id v17 = [v7 detailTextLabel];
  [v17 setText:v14];

  [v7 setAccessoryType:1];

  return v7;
}

- (id)payLaterEligibleSpendTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  if ([(PKPaymentPassDetailViewController *)self _hasEligibleSpend])
  {
    char v6 = [(PKPaymentPassDetailViewController *)self primaryTextColor];
    if (v6)
    {
      id v7 = [(PKPaymentPassDetailViewController *)self _value1CellWithTextColor:v6 forTableView:v5];
    }
    else
    {
      int64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
      id v7 = [(PKPaymentPassDetailViewController *)self _value1CellWithTextColor:v9 forTableView:v5];
    }
    int64_t v10 = [(PKPaymentPassDetailViewController *)self account];
    uint64_t v11 = [v10 payLaterDetails];
    uint64_t v8 = [v11 maximumEligibleSpendAmount];

    uint64_t v12 = [v7 textLabel];
    uint64_t v13 = PKLocalizedCocoonString(&cfstr_AvailableToSpe.isa);
    [v12 setText:v13];

    uint64_t v14 = [v7 detailTextLabel];
    id v15 = [v8 formattedStringValue];
    [v14 setText:v15];

    id v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v14 setTextColor:v16];

    [v7 setAccessoryType:1];
  }
  else
  {
    uint64_t v8 = PKLocalizedCocoonString(&cfstr_NewPurchaseBut.isa);
    id v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v8 forTableView:v5];
  }

  return v7;
}

- (void)didSelectPersonalInformationCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__PKPaymentPassDetailViewController_PayLater__didSelectPersonalInformationCellInTableView_atIndexPath___block_invoke;
  v8[3] = &unk_1E59CB100;
  objc_copyWeak(&v9, &location);
  [(PKPaymentPassDetailViewController *)self presentAuthRequestForPolicy:1 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __103__PKPaymentPassDetailViewController_PayLater__didSelectPersonalInformationCellInTableView_atIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    id v8 = WeakRetained;
    BOOL v4 = [PKPayLaterUserInfoViewController alloc];
    id v5 = [v8 account];
    id v6 = [(PKPayLaterUserInfoViewController *)v4 initWithPayLaterAccount:v5];

    id v7 = [v8 navigationController];
    [v7 pushViewController:v6 animated:1];

    id WeakRetained = v8;
  }
}

- (void)didSelectFinancingPlanListCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4F84280]);
  id v6 = [(PKPaymentPassDetailViewController *)self account];
  id v7 = [v6 accountIdentifier];
  id v8 = (void *)[v5 initWithAccountIdentifier:v7 queryItems:16];

  id v9 = [(PKPaymentPassDetailViewController *)self accountService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke;
  v10[3] = &unk_1E59CE7C0;
  void v10[4] = self;
  [v9 financingPlansWithQuery:v8 completion:v10];
}

void __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) account];
  id v3 = [*(id *)(a1 + 32) paymentIntentController];
  id v4 = [*(id *)(a1 + 40) activeFinancingPlans];
  +[PKPayLaterFinancingPlanListViewController activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:paymentIntentController:financingPlans:completedFinancingPlansCount:](PKPayLaterFinancingPlanListViewController, "activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:paymentIntentController:financingPlans:completedFinancingPlansCount:", v2, v3, v4, [*(id *)(a1 + 32) completedFinancingPlansCount]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [*(id *)(a1 + 32) navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)didSelectPayLaterEligibleSpendCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKPaymentPassDetailViewController *)self _hasEligibleSpend])
  {
    id v8 = [PKPayLaterEligibleSpendViewController alloc];
    id v9 = [(PKPaymentPassDetailViewController *)self account];
    int64_t v10 = [(PKPayLaterEligibleSpendViewController *)v8 initWithPayLaterAccount:v9];

    uint64_t v11 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
  else
  {
    uint64_t v12 = [(PKPaymentPassDetailViewController *)self tableView];
    uint64_t v13 = [v12 cellForRowAtIndexPath:v7];

    uint64_t v14 = [(PKPaymentPassDetailViewController *)self linkTextColor];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    id v17 = v16;

    [(PKPaymentPassDetailViewController *)self _showSpinner:1 inCell:v13 overrideTextColor:v17];
    id v18 = [(PKPaymentPassDetailViewController *)self account];
    uint64_t v19 = +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:v18 controllerContext:3 referrerIdentifier:0];
    [(PKPaymentPassDetailViewController *)self setPayLaterSetupFlowController:v19];

    objc_initWeak(&location, self);
    uint64_t v20 = [(PKPaymentPassDetailViewController *)self payLaterSetupFlowController];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke;
    v23[3] = &unk_1E59CE810;
    objc_copyWeak(&v26, &location);
    v23[4] = self;
    id v21 = v13;
    id v24 = v21;
    id v22 = v17;
    id v25 = v22;
    [v20 fetchPayLaterDynamicContentWithCompletion:v23];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_2;
  v9[3] = &unk_1E59CE7E8;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v7 = *(id *)(a1 + 48);
  char v14 = a2;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_3;
    id v13 = &unk_1E59CB378;
    objc_copyWeak(&v16, &location);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v3 = (void (**)(void))_Block_copy(&v10);
    if (!*(unsigned char *)(a1 + 72) || *(void *)(a1 + 56))
    {
      id v7 = PKDisplayableErrorForCommonType();
      id v5 = PKAccountDisplayableError();

      id v8 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      if (v8)
      {
        id v6 = v8;
        id v9 = objc_msgSend(WeakRetained, "navigationController", v10, v11, v12, v13, v14);
        [v9 presentViewController:v6 animated:1 completion:v3];
      }
      else
      {
        v3[2](v3);
        id v6 = 0;
      }
    }
    else
    {
      id v4 = objc_msgSend(WeakRetained, "payLaterSetupFlowController", v10, v11, v12, v13, v14);
      id v5 = [v4 firstViewController];

      id v6 = [WeakRetained navigationController];
      [v6 presentViewController:v5 animated:1 completion:v3];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _showSpinner:0 inCell:*(void *)(a1 + 32) overrideTextColor:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)handleOpenBusinessChatForPayLater
{
  objc_initWeak(&location, self);
  id v3 = [PKPayLaterBusinessChatTopicComposer alloc];
  id v4 = [(PKPaymentPassDetailViewController *)self account];
  id v5 = [(PKPaymentPassDetailViewController *)self pass];
  id v6 = [(PKPayLaterBusinessChatTopicComposer *)v3 initWithPayLaterAccount:v4 payLaterPass:v5 financingPlan:0 installment:0 payment:0];
  [(PKPaymentPassDetailViewController *)self setPayLaterTopicsComposer:v6];

  id v7 = [(PKPaymentPassDetailViewController *)self payLaterTopicsComposer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke;
  v8[3] = &unk_1E59CE860;
  objc_copyWeak(v9, &location);
  void v8[4] = self;
  v9[1] = (id)1;
  [v7 releventTopicsForContext:1 completion:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_2;
  v6[3] = &unk_1E59CE838;
  objc_copyWeak(v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  v9[1] = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v9);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v3 = [PKPayLaterBusinessChatTopicsViewController alloc];
      uint64_t v4 = [WeakRetained account];
      id v5 = [WeakRetained pass];
      id v6 = [(PKPayLaterBusinessChatTopicsViewController *)v3 initWithPayLaterAccount:v4 payLaterPass:v5 financingPlan:0 installment:0 payment:0 topics:*(void *)(a1 + 32) businessChatContext:*(void *)(a1 + 56)];

      id v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
      [WeakRetained presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      uint64_t v8 = [PKBusinessChatPayLaterContext alloc];
      id v9 = [WeakRetained account];
      uint64_t v10 = [WeakRetained pass];
      uint64_t v11 = [MEMORY[0x1E4F84960] genericBusinessChatTopicForContext:*(void *)(a1 + 56)];
      id v12 = [(PKBusinessChatPayLaterContext *)v8 initWithPayLaterAccount:v9 paymentPass:v10 topic:v11 financingPlan:0 installment:0 payment:0 dispute:0];

      id v13 = [WeakRetained businessChatController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_3;
      v14[3] = &unk_1E59CB240;
      objc_copyWeak(&v15, &location);
      [v13 openBusinessChatWithContext:v12 completion:v14];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_4;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v5 = WeakRetained;
    id v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4) {
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    [v5 presentViewController:v4 animated:1 completion:0];

    id WeakRetained = v5;
  }
}

- (void)fetchFinancingPlansIfNecessary
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentPassDetailViewController *)self _canFetchFinancingPlans])
  {
    id v3 = [(PKPaymentPassDetailViewController *)self account];

    if (v3)
    {
      id v4 = [(PKPaymentPassDetailViewController *)self financingPlansFetcher];

      if (!v4)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F849A8]);
        id v6 = [(PKPaymentPassDetailViewController *)self account];
        id v7 = (void *)[v5 initWithPayLaterAccount:v6];
        [(PKPaymentPassDetailViewController *)self setFinancingPlansFetcher:v7];
      }
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self paymentIntentController];

      if (!v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F849D0]);
        uint64_t v10 = [(PKPaymentPassDetailViewController *)self account];
        uint64_t v11 = [(PKPaymentPassDetailViewController *)self webService];
        id v12 = [MEMORY[0x1E4F84898] sharedInstance];
        id v13 = [(PKPaymentPassDetailViewController *)self peerPaymentWebService];
        id v14 = [(PKPaymentPassDetailViewController *)self accountService];
        id v15 = objc_alloc_init(MEMORY[0x1E4F84C38]);
        id v16 = [v15 defaultPaymentPassUniqueIdentifier];
        id v17 = (void *)[v9 initWithPayLaterAccount:v10 paymentWebService:v11 passLibrary:v12 peerPaymentWebService:v13 accountService:v14 defaultPassUniqueIdentifier:v16];

        [(PKPaymentPassDetailViewController *)self setPaymentIntentController:v17];
      }
      id v18 = [(PKPaymentPassDetailViewController *)self account];
      uint64_t v19 = [v18 accountIdentifier];

      objc_initWeak(&location, self);
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:v19 queryItems:64];
      id v21 = [MEMORY[0x1E4F84998] activeFinancingPlanStates];
      [v20 setCountFinancingPlanStates:v21];

      id v22 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:v19 queryItems:64];
      id v23 = [MEMORY[0x1E4F84998] completedFinancingPlanStates];
      [v22 setCountFinancingPlanStates:v23];

      id v24 = [(PKPaymentPassDetailViewController *)self financingPlansFetcher];
      v33[0] = v20;
      v33[1] = v22;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke;
      v28[3] = &unk_1E59CE8B0;
      objc_copyWeak(&v31, &location);
      id v26 = v20;
      id v29 = v26;
      id v27 = v22;
      id v30 = v27;
      [v24 financingPlansWithQueries:v25 completion:v28];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) queryIdentifier];
    id v5 = [v3 objectForKeyedSubscript:v4];

    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) queryIdentifier];
    id v8 = [v6 objectForKeyedSubscript:v7];

    uint64_t v9 = [v5 financingPlanCount];
    uint64_t v10 = [v8 financingPlanCount];
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Received %ld active financing plans and %ld completed financing plans.", (uint8_t *)&v12, 0x16u);
    }

    [WeakRetained setActiveFinancingPlansCount:v9];
    [WeakRetained setCompletedFinancingPlansCount:v10];
    [WeakRetained reloadPassDetailSections:&unk_1EF2B9F30];
  }
}

- (void)presentPayLaterAccountErrorsIfNecessary
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __86__PKPaymentPassDetailViewController_PayLater__presentPayLaterAccountErrorsIfNecessary__block_invoke;
    v3[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v4, &location);
    [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __86__PKPaymentPassDetailViewController_PayLater__presentPayLaterAccountErrorsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained account];
    PKPayLaterHandleFrontOfPassAlertsWithAccount(v2, v3);

    id WeakRetained = v3;
  }
}

- (void)presentFinancingPlan:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke;
    v5[3] = &unk_1E59CB378;
    objc_copyWeak(&v7, &location);
    void v5[4] = self;
    id v6 = v4;
    [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] account];
    char v4 = PKCanShowPayLaterPassItemsForAccount();

    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [a1[5] planIdentifier];
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Pass details presenting financing plan %@", buf, 0xCu);
      }
      id v7 = [PKPayLaterFinancingPlanViewController alloc];
      id v8 = a1[5];
      uint64_t v9 = [WeakRetained account];
      uint64_t v10 = [WeakRetained paymentIntentController];
      uint64_t v11 = [(PKPayLaterFinancingPlanViewController *)v7 initWithFinancingPlan:v8 payLaterAccount:v9 paymentIntentController:v10 merchantIcon:0 iconGenerator:0];

      objc_initWeak((id *)buf, a1[4]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke_71;
      v14[3] = &unk_1E59CB268;
      objc_copyWeak(&v16, (id *)buf);
      int v12 = v11;
      uint64_t v15 = v12;
      [v12 preflightWithCompletion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [a1[5] planIdentifier];
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: Cannot present loan details for %@ because of the account state.", buf, 0xCu);
      }
    }
  }
}

void __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke_71(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationController];
    [v3 pushViewController:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v4;
  }
}

- (BOOL)_canFetchFinancingPlans
{
  id v3 = [(PKPaymentPassDetailViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  id v5 = [(PKPaymentPassDetailViewController *)self account];
  id v6 = [v5 payLaterDetails];
  if (v6)
  {
    id v7 = [(PKPaymentPassDetailViewController *)self account];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_hasEligibleSpend
{
  id v2 = [(PKPaymentPassDetailViewController *)self account];
  id v3 = [v2 payLaterDetails];
  char v4 = [v3 hasEligibleSpend];

  return v4;
}

- (BOOL)shouldShowIdentityDocumentSection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentPassDetailViewController *)self pass];
  if ([v3 isIdentityPass]
    && [(PKPaymentPassDetailViewController *)self detailViewStyle] != 2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v3, "deviceContactlessPaymentApplications", 0);
    uint64_t v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v5);
          }
          BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v8 paymentType];
          if (PKPaymentMethodTypeIsIdentityDocument())
          {
            if ([v8 state] == 1)
            {
              uint64_t v9 = [v8 subcredentials];
              uint64_t v10 = [v9 count];

              if (v10)
              {
                LOBYTE(v4) = 1;
                goto LABEL_16;
              }
            }
          }
        }
        uint64_t v4 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (unint64_t)numberOfIdentityDocumentRowsInTableView:(id)a3
{
  return [(PKPaymentPassDetailViewController *)self shouldShowIdentityDocumentSection];
}

- (id)identityDocumentTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKPaymentPassDetailViewController *)self primaryTextColor];
  if (v6)
  {
    id v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v6 forTableView:v5];
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4FB1618] labelColor];
    id v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v8 forTableView:v5];
  }
  uint64_t v9 = [(PKPaymentPassDetailViewController *)self pass];
  unint64_t v10 = [v9 identityType];

  if (v10 > 3)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = PKLocalizedIdentityString(&off_1E59D0F20[v10]->isa);
  }
  long long v12 = [v7 textLabel];
  [v12 setText:v11];

  BOOL v13 = [(PKPaymentPassDetailViewController *)self loadingIdentityDetails];
  [(PKPaymentPassDetailViewController *)self _showSpinner:v13 inCell:v7 overrideTextColor:0];
  if (!v13) {
    [v7 setAccessoryType:1];
  }

  return v7;
}

- (id)identityDocumentSectionFooter
{
  id v2 = [(PKPaymentPassDetailViewController *)self pass];
  unint64_t v3 = [v2 identityType];

  if (v3 > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKLocalizedIdentityString(&off_1E59D0F40[v3]->isa);
  }

  return v4;
}

- (void)didSelectIdentityDocumentCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PKPaymentPassDetailViewController *)self loadingIdentityDetails])
  {
    [(PKPaymentPassDetailViewController *)self setLoadingIdentityDetails:1];
    BOOL v8 = [v6 cellForRowAtIndexPath:v7];
    [(PKPaymentPassDetailViewController *)self _showSpinner:1 inCell:v8 overrideTextColor:0];
    uint64_t v9 = [PKIdentityDocumentDetailsViewController alloc];
    unint64_t v10 = [(PKPaymentPassDetailViewController *)self pass];
    uint64_t v11 = [(PKPaymentPassDetailViewController *)self paymentServiceDataProvider];
    long long v12 = [(PKIdentityDocumentDetailsViewController *)v9 initWithPass:v10 dataProvider:v11 detailViewStyle:[(PKPaymentPassDetailViewController *)self detailViewStyle]];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke;
    v14[3] = &unk_1E59D0F00;
    void v14[4] = self;
    long long v15 = v12;
    id v16 = v6;
    id v17 = v7;
    BOOL v13 = v12;
    [(PKIdentityDocumentDetailsViewController *)v13 preflightWithCompletion:v14];
  }
}

void __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke_2;
  block[3] = &unk_1E59CB7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v7 = [*(id *)(a1 + 40) navigationController];
    [v7 pushViewController:*(void *)(a1 + 48) animated:1];
    goto LABEL_24;
  }
  id v3 = [v2 domain];
  uint64_t v4 = @"PKIdentityDocumentDetailsErrorDomain";
  if (v3 == v4)
  {
  }
  else
  {
    id v5 = v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {

      goto LABEL_19;
    }
    int v8 = [(__CFString *)v3 isEqualToString:v4];

    if (!v8) {
      goto LABEL_19;
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) code];
  if (v9 == 2)
  {
    int v12 = 0;
    goto LABEL_20;
  }
  if (v9 != 1) {
    goto LABEL_19;
  }
  if (PKPearlIsAvailable())
  {
    id v10 = PKLocalizedIdentityString(&cfstr_DriverLicenseF.isa);
    id v11 = @"DRIVER_LICENSE_FACEID_ERROR_MESSAGE";
  }
  else
  {
    id v10 = PKLocalizedIdentityString(&cfstr_DriverLicenseT.isa);
    id v11 = @"DRIVER_LICENSE_TOUCHID_ERROR_MESSAGE";
  }
  BOOL v13 = PKLocalizedIdentityString(&v11->isa);
  id v7 = PKDisplayableErrorCustom();

  if (!v7)
  {
LABEL_19:
    int v12 = 1;
LABEL_20:
    long long v14 = PKLocalizedIdentityString(&cfstr_DriverLicenseG.isa);
    long long v15 = PKLocalizedIdentityString(&cfstr_DriverLicenseG_0.isa);
    id v7 = PKDisplayableErrorCustom();

    if (!v12) {
      goto LABEL_24;
    }
  }
  id v16 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  if (v16)
  {
    id v17 = [*(id *)(a1 + 40) navigationController];
    [v17 presentViewController:v16 animated:1 completion:0];
  }
LABEL_24:

  [*(id *)(a1 + 40) setLoadingIdentityDetails:0];
  id v18 = [*(id *)(a1 + 56) cellForRowAtIndexPath:*(void *)(a1 + 64)];
  if (v18)
  {
    uint64_t v19 = v18;
    [*(id *)(a1 + 40) _showSpinner:0 inCell:v18 overrideTextColor:0];
    id v18 = v19;
  }
}

- (BOOL)shouldShowReplaceBiometricSection
{
  id v3 = [(PKPaymentPassDetailViewController *)self fingeprintHelper];

  if (!v3)
  {
    uint64_t v4 = [PKIdentityReplaceFingerprintHelper alloc];
    id v5 = [(PKPaymentPassDetailViewController *)self pass];
    BOOL v6 = [v5 secureElementPass];
    id v7 = [(PKIdentityReplaceFingerprintHelper *)v4 initWithPass:v6 isRemote:[(PKPaymentPassDetailViewController *)self detailViewStyle] == 2];
    [(PKPaymentPassDetailViewController *)self setFingeprintHelper:v7];
  }
  int v8 = [(PKPaymentPassDetailViewController *)self fingeprintHelper];
  if ([v8 hasCachedEligibility])
  {
    char v9 = [v8 isEligibile];
  }
  else
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke;
    v11[3] = &unk_1E59CB268;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    [v8 isEligibleWithCompletion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    char v9 = 0;
  }

  return v9;
}

void __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
}

void __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) reloadPassDetailSections:&unk_1EF2B9F78];
    id WeakRetained = v3;
  }
}

- (unint64_t)numberOfReplaceBiometricRowsInTableView:(id)a3
{
  return 1;
}

- (id)replaceBiometricTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  BOOL v6 = PKLocalizedIdentityString(&cfstr_ReplaceIdFinge.isa);
  id v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v6 forTableView:v5];

  return v7;
}

- (void)didSelectReplaceBiometricCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [(PKPaymentPassDetailViewController *)self fingeprintHelper];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectReplaceBiometricCellInTableView_atIndexPath___block_invoke;
  v6[3] = &unk_1E59CCCE8;
  void v6[4] = self;
  [v5 viewControllerWithCompletion:v6];
}

void __100__PKPaymentPassDetailViewController_Identity__didSelectReplaceBiometricCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = [v2 navigationController];
    [v4 presentViewController:v3 animated:1 completion:0];
  }
}

- (id)footerForReplaceBiometricIdentityInTableView:(id)a3
{
  return (id)PKLocalizedIdentityString(&cfstr_ReplaceIdFinge_0.isa);
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 style:(int64_t)a7 dataProvider:(id)a8
{
  long long v14 = (void *)MEMORY[0x1E4F84E10];
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [v14 sharedService];
  id v21 = [(PKPaymentPassDetailViewController *)self initWithPass:v19 group:v18 groupsController:v17 webService:v16 peerPaymentWebService:v20 style:a7 passLibraryDataProvider:v15 paymentServiceDataProvider:0];

  return v21;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10
{
  id v17 = (void *)MEMORY[0x1E4F84270];
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [v17 sharedInstance];
  id v26 = [(PKPaymentPassDetailViewController *)self initWithPass:v24 group:v23 groupsController:v22 webService:v21 peerPaymentWebService:v20 accountService:v25 style:a8 passLibraryDataProvider:v19 paymentServiceDataProvider:v18 rendererState:0 context:0 familyCollection:0 contactAvatarManager:0 account:0];

  return v26;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11
{
  return [(PKPaymentPassDetailViewController *)self initWithPass:a3 group:a4 groupsController:a5 webService:a6 peerPaymentWebService:a7 accountService:a8 style:a9 passLibraryDataProvider:a10 paymentServiceDataProvider:a11 rendererState:0 context:0 familyCollection:0 contactAvatarManager:0 account:0];
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10 rendererState:(id)a11 context:(id)a12
{
  id v17 = (void *)MEMORY[0x1E4F84270];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v17 sharedInstance];
  id v27 = [(PKPaymentPassDetailViewController *)self initWithPass:v25 group:v24 groupsController:v23 webService:v22 peerPaymentWebService:v21 accountService:v26 style:a8 passLibraryDataProvider:v20 paymentServiceDataProvider:v19 rendererState:v18 context:0 familyCollection:0 contactAvatarManager:0 account:0];

  return v27;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11 rendererState:(id)a12 context:(id)a13 familyCollection:(id)a14 contactAvatarManager:(id)a15 account:(id)a16
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v161 = a3;
  id v157 = a4;
  id v158 = a5;
  id v148 = a6;
  id v160 = a7;
  id v155 = a8;
  id v149 = a10;
  id v150 = a11;
  id v159 = a12;
  id v151 = a13;
  id v152 = a14;
  id v153 = a15;
  id v154 = a16;
  v204.receiver = self;
  v204.super_class = (Class)PKPaymentPassDetailViewController;
  v168 = [(PKDynamicTableViewController *)&v204 init];
  if (!v168) {
    goto LABEL_95;
  }
  v168->_expressPassesInformationToken = -1;
  v143 = [v161 uniqueID];
  p_pass = (id *)&v168->_pass;
  objc_storeStrong((id *)&v168->_pass, a3);
  [(PKPaymentPassDetailViewController *)v168 _applyStaticPassPropertiesForPass];
  p_account = (id *)&v168->_account;
  objc_storeStrong((id *)&v168->_account, a16);
  v168->_int64_t detailViewStyle = a9;
  objc_storeStrong((id *)&v168->_familyCollection, a14);
  objc_storeStrong((id *)&v168->_contactAvatarManager, a15);
  p_webService = (id *)&v168->_webService;
  objc_storeStrong((id *)&v168->_webService, a6);
  objc_storeStrong((id *)&v168->_passLibraryDataProvider, a10);
  p_paymentServiceDataProvider = (id *)&v168->_paymentServiceDataProvider;
  objc_storeStrong((id *)&v168->_paymentServiceDataProvider, a11);
  uint64_t v22 = [objc_alloc(MEMORY[0x1E4F846D8]) initWithPaymentDataProvider:v168->_paymentServiceDataProvider passLibraryDataProvider:v168->_passLibraryDataProvider isForWatch:a9 == 2];
  expressPassController = v168->_expressPassController;
  v168->_expressPassController = (PKExpressPassController *)v22;

  [(PKExpressPassController *)v168->_expressPassController setPresentingViewController:v168];
  id v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  startedAnalyticsSubjects = v168->_startedAnalyticsSubjects;
  v168->_startedAnalyticsSubjects = v24;

  id v26 = [[PKPassHeaderView alloc] initWithPass:v168->_pass rendererState:v159];
  passHeaderView = v168->_passHeaderView;
  v168->_passHeaderView = v26;

  [(PKPassHeaderView *)v168->_passHeaderView setDelegate:v168];
  [(PKPassHeaderView *)v168->_passHeaderView setPassLibraryOverride:v168->_passLibraryDataProvider];
  [(PKPassHeaderView *)v168->_passHeaderView setSmall:v168->_detailViewStyle == 0];
  [(PKPaymentPassDetailViewController *)v168 _buildSections];
  [(PKPaymentPassDetailViewController *)v168 _decorateSections];
  v28 = objc_alloc_init(PKBusinessChatController);
  businessChatController = v168->_businessChatController;
  v168->_businessChatController = v28;

  id v30 = [MEMORY[0x1E4F850F8] sharedInstance];
  v202[0] = MEMORY[0x1E4F143A8];
  v202[1] = 3221225472;
  v202[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke;
  v202[3] = &unk_1E59DF110;
  val = v168;
  v203 = val;
  [v30 authorizationStatusWithCompletion:v202];

  if (v158)
  {
    p_groupsController = (id *)&val->_groupsController;
    objc_storeStrong((id *)&val->_groupsController, a5);
    if (v157)
    {
      long long v32 = (PKGroup *)v157;
    }
    else
    {
      id v36 = *p_groupsController;
      uint64_t v37 = [*p_pass uniqueID];
      uint64_t v38 = [v36 groupIndexForPassUniqueID:v37];

      long long v32 = [*p_groupsController groupAtIndex:v38];
    }
    group = val->_group;
    val->_group = v32;

    -[PKGroup addGroupObserver:](val->_group, "addGroupObserver:");
  }
  else
  {
    long long v33 = (PKGroupsController *)objc_alloc_init(MEMORY[0x1E4F84740]);
    groupsController = val->_groupsController;
    val->_groupsController = v33;

    long long v35 = val->_groupsController;
    v199[0] = MEMORY[0x1E4F143A8];
    v199[1] = 3221225472;
    v199[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_3;
    v199[3] = &unk_1E59CA870;
    id v200 = v157;
    v201 = val;
    [(PKGroupsController *)v35 loadGroupsWithCompletion:v199];
  }
  v147 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:*p_pass];
  uint64_t v40 = [objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v147];
  transactionSourceCollection = val->_transactionSourceCollection;
  val->_transactionSourceCollection = (PKTransactionSourceCollection *)v40;

  if (([*p_pass isStoredValuePass] & 1) != 0 || objc_msgSend(*p_pass, "isAccessPass"))
  {
    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:*p_pass];
    transitBalanceModel = val->_transitBalanceModel;
    val->_transitBalanceModel = (PKTransitBalanceModel *)v42;
  }
  objc_storeStrong((id *)&val->_rendererState, a12);
  v44 = [[PKLinkedApplication alloc] initWithPass:*p_pass];
  linkedApplication = val->_linkedApplication;
  val->_linkedApplication = v44;

  [(PKLinkedApplication *)val->_linkedApplication addObserver:val];
  [(PKLinkedApplication *)val->_linkedApplication reloadApplicationStateIfNecessary];
  v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  contextualActionHandlers = val->_contextualActionHandlers;
  val->_contextualActionHandlers = v46;

  v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  executionBlocksContentIsLoaded = val->_executionBlocksContentIsLoaded;
  val->_executionBlocksContentIsLoaded = v48;

  if (objc_opt_respondsToSelector()) {
    [*p_paymentServiceDataProvider addDelegate:val];
  }
  v50 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  numberFormatter = val->_numberFormatter;
  val->_numberFormatter = v50;

  [(NSNumberFormatter *)val->_numberFormatter setNumberStyle:1];
  transactions = val->_transactions;
  val->_transactions = (NSArray *)MEMORY[0x1E4F1CBF0];

  uint64_t v53 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:val->_transactionSourceCollection paymentDataProvider:*p_paymentServiceDataProvider];
  transactionFetcher = val->_transactionFetcher;
  val->_transactionFetcher = (PKDashboardTransactionFetcher *)v53;

  int64_t detailViewStyle = v168->_detailViewStyle;
  v56 = val;
  val->_hasTabBar = detailViewStyle != 0;
  if (detailViewStyle)
  {
    v57 = [*p_pass associatedAccountServiceAccountIdentifier];
    if ([v57 length]) {
      BOOL v58 = v168->_detailViewStyle == 2;
    }
    else {
      BOOL v58 = 0;
    }
    val->_hasTabBar = !v58;

    v56 = val;
  }
  else
  {
    val->_hasTabBar = 0;
  }
  objc_storeStrong((id *)&v56->_context, a13);
  v59 = [*p_webService context];
  v60 = [v59 configuration];
  id v146 = [v60 contactFormatConfiguration];

  uint64_t v61 = [objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v146];
  contactFormatValidator = val->_contactFormatValidator;
  val->_contactFormatValidator = (PKContactFormatValidator *)v61;

  if ([*p_pass hasAssociatedPeerPaymentAccount])
  {
    id v63 = v160;
    v64 = v160;
    if (!v160)
    {
      v64 = [MEMORY[0x1E4F84E10] sharedService];
      id v63 = 0;
    }
    BOOL v65 = v63 == 0;
    p_peerPaymentWebService = (id *)&val->_peerPaymentWebService;
    objc_storeStrong((id *)&val->_peerPaymentWebService, v64);
    if (v65) {

    }
    v67 = [*p_peerPaymentWebService targetDevice];
    v68 = [v67 account];

    v69 = [v68 associatedPassUniqueID];
    int v70 = [v69 isEqualToString:v143];

    if (v70)
    {
      p_peerPaymentAccount = &val->_peerPaymentAccount;
      objc_storeStrong((id *)&val->_peerPaymentAccount, v68);
      v72 = [*p_peerPaymentWebService targetDevice];
      char v73 = objc_opt_respondsToSelector();

      if (v73)
      {
        v74 = [*p_peerPaymentWebService targetDevice];
        uint64_t v75 = [v74 preferences];
        peerPaymentPreferences = val->_peerPaymentPreferences;
        val->_peerPaymentPreferences = (PKPeerPaymentPreferences *)v75;
      }
      v77 = [PKPeerPaymentAccountResolutionController alloc];
      int64_t v78 = v168->_detailViewStyle;
      uint64_t v79 = 3;
      if (v78 != 1) {
        uint64_t v79 = 0;
      }
      if (v78 == 2) {
        uint64_t v80 = 4;
      }
      else {
        uint64_t v80 = v79;
      }
      uint64_t v81 = [(PKPeerPaymentAccountResolutionController *)v77 initWithAccount:*p_peerPaymentAccount webService:*p_peerPaymentWebService context:v80 delegate:val passLibraryDataProvider:v168->_passLibraryDataProvider];
      peerPaymentAccountResolutionController = val->_peerPaymentAccountResolutionController;
      val->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v81;

      [(PKPeerPaymentAccountResolutionController *)val->_peerPaymentAccountResolutionController setSetupDelegate:val];
      val->_peerPaymentAccountResolution = [(PKPeerPaymentAccountResolutionController *)val->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution];
      [(PKPassHeaderView *)v168->_passHeaderView setPeerPaymentAccount:*p_peerPaymentAccount];
    }
    v83 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v84 = [*p_peerPaymentWebService targetDevice];
    [v83 addObserver:val selector:sel__handlePeerPaymentAccountDidChangeNotification_ name:*MEMORY[0x1E4F87CC8] object:v84];

    v85 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v86 = [*p_peerPaymentWebService targetDevice];
    [v85 addObserver:val selector:sel__handlePeerPaymentPreferencestDidChangeNotification_ name:*MEMORY[0x1E4F87CD0] object:v86];

    v197[0] = MEMORY[0x1E4F143A8];
    v197[1] = 3221225472;
    v197[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_5;
    v197[3] = &unk_1E59CA7D0;
    v198 = val;
    [(PKPaymentPassDetailViewController *)v198 _loadFamilyCollectionIfNecessaryWithCompletion:v197];

    goto LABEL_59;
  }
  v87 = [*p_pass associatedAccountServiceAccountIdentifier];

  if (!v87)
  {
    v103 = [MEMORY[0x1E4F84B40] defaults];
    uint64_t v104 = [v103 defaultBillingAddressForPaymentPass:*p_pass];
    billingContact = val->_billingContact;
    val->_billingContact = (CNContact *)v104;

    val->_loadingBillingContact = 0;
    if (![(PKPaymentPassDetailViewController *)val _isBankConnectSupportedForPaymentPass:v161])[(PKPaymentPassDetailViewController *)val contentIsLoaded]; {
    goto LABEL_59;
    }
  }
  id v88 = v155;
  v89 = v155;
  if (!v155)
  {
    v89 = [MEMORY[0x1E4F84270] sharedInstance];
    id v88 = 0;
  }
  BOOL v90 = v88 == 0;
  p_accountService = (id *)&val->_accountService;
  objc_storeStrong((id *)&val->_accountService, v89);
  if (v90) {

  }
  id v92 = v160;
  v93 = v160;
  if (!v160)
  {
    v93 = [MEMORY[0x1E4F84E10] sharedService];
    id v92 = 0;
  }
  BOOL v94 = v92 == 0;
  objc_storeStrong((id *)&val->_peerPaymentWebService, v93);
  if (v94) {

  }
  [*p_accountService registerObserver:val];
  v95 = [*p_pass associatedAccountServiceAccountIdentifier];
  objc_initWeak(&location, val);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_6;
  aBlock[3] = &unk_1E59DF188;
  objc_copyWeak(&v195, &location);
  v96 = val;
  v192 = v96;
  id v193 = v155;
  id v97 = v95;
  id v194 = v97;
  v98 = _Block_copy(aBlock);
  if (!*p_account) {
    goto LABEL_54;
  }
  id v99 = [*p_account accountIdentifier];
  id v100 = v97;
  v101 = v100;
  if (v99 == v100)
  {
  }
  else
  {
    if (!v100 || !v99)
    {

      goto LABEL_54;
    }
    char v102 = [v99 isEqualToString:v100];

    if ((v102 & 1) == 0)
    {
LABEL_54:
      v188[0] = MEMORY[0x1E4F143A8];
      v188[1] = 3221225472;
      v188[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_15;
      v188[3] = &unk_1E59D4068;
      objc_copyWeak(&v190, &location);
      id v189 = v98;
      v106 = _Block_copy(v188);
      if (([*p_pass isAppleBalancePass] & 1) != 0 || PKPassbookIsCurrentlyDeletedByUser())
      {
        v107 = [*p_webService targetDevice];
        [v107 accountWithIdentifier:v97 completion:v106];
      }
      else
      {
        [*p_accountService accountWithIdentifier:v97 completion:v106];
      }

      objc_destroyWeak(&v190);
      goto LABEL_58;
    }
  }
  (*((void (**)(void *, id, void))v98 + 2))(v98, *p_account, 0);
LABEL_58:
  v108 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v108 addObserver:v96 selector:sel__handleAccountServiceAccountDidChangeNotification_ name:*MEMORY[0x1E4F85BF8] object:0];

  objc_destroyWeak(&v195);
  objc_destroyWeak(&location);

LABEL_59:
  val->_deepLinkingEnabled = +[PKPaymentNotificationAppURLHelper applicationExistsToHandleNotificationsForPaymentPass:v161];
  id obj = [(PKPaymentPassDetailViewController *)val contactResolver];
  v109 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:obj];
  transactionCellController = val->_transactionCellController;
  val->_transactionCellController = v109;

  v111 = [[PKPaymentTransactionDetailsFactory alloc] initWithContactResolver:obj peerPaymentWebService:val->_peerPaymentWebService paymentServiceDataProvider:*p_paymentServiceDataProvider detailViewStyle:v168->_detailViewStyle];
  transactionDetailsFactory = val->_transactionDetailsFactory;
  val->_transactionDetailsFactory = v111;

  uint64_t v113 = 3;
  if (a9 != 1) {
    uint64_t v113 = 0;
  }
  if (a9 == 2) {
    uint64_t v114 = 4;
  }
  else {
    uint64_t v114 = v113;
  }
  v115 = [PKPaymentVerificationController alloc];
  id v116 = *p_pass;
  v117 = [(PKPassHeaderView *)v168->_passHeaderView passView];
  uint64_t v118 = [(PKPaymentVerificationController *)v115 initWithPaymentPass:v116 passView:v117 webService:*p_webService context:v114 delegate:val setupDelegate:0 verificationContext:1];
  verificationController = val->_verificationController;
  val->_verificationController = (PKPaymentVerificationController *)v118;

  v145 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*p_webService];
  [(PKPaymentVerificationController *)val->_verificationController setProvisioningController:v145];
  if (v168->_detailViewStyle) {
    uint64_t v120 = 0;
  }
  else {
    uint64_t v120 = PKRunningInViewService();
  }
  [(PKPaymentPassDetailViewController *)val setShowDoneButton:v120];
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  v162 = val->_devicePaymentApplications;
  uint64_t v166 = [(NSArray *)v162 countByEnumeratingWithState:&v184 objects:v207 count:16];
  if (v166)
  {
    uint64_t v164 = *(void *)v185;
LABEL_69:
    uint64_t v121 = 0;
    while (1)
    {
      if (*(void *)v185 != v164) {
        objc_enumerationMutation(v162);
      }
      v122 = *(void **)(*((void *)&v184 + 1) + 8 * v121);
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      v123 = [v122 automaticSelectionCriteria];
      uint64_t v124 = [v123 countByEnumeratingWithState:&v180 objects:v206 count:16];
      if (v124)
      {
        uint64_t v125 = *(void *)v181;
LABEL_74:
        uint64_t v126 = 0;
        while (1)
        {
          if (*(void *)v181 != v125) {
            objc_enumerationMutation(v123);
          }
          v127 = [*(id *)(*((void *)&v180 + 1) + 8 * v126) type];
          val->_isAppleAccess = PKEqualObjects();

          if (val->_isAppleAccess) {
            break;
          }
          if (v124 == ++v126)
          {
            uint64_t v124 = [v123 countByEnumeratingWithState:&v180 objects:v206 count:16];
            if (v124) {
              goto LABEL_74;
            }
            break;
          }
        }
      }

      if (val->_isAppleAccess) {
        break;
      }
      if (++v121 == v166)
      {
        uint64_t v166 = [(NSArray *)v162 countByEnumeratingWithState:&v184 objects:v207 count:16];
        if (v166) {
          goto LABEL_69;
        }
        break;
      }
    }
  }

  v128 = val;
  val->_isCredentialedPass = [*p_pass areCredentialsStoredInKML];
  val->_radioTechnologyType = 0;
  if (val->_isCredentialedPass)
  {
    v129 = [*p_pass secureElementPass];
    val->_radioTechnologyType = [v129 supportedRadioTechnologies];

    v128 = val;
  }
  dispatch_group_t v130 = dispatch_group_create();
  objc_storeStrong((id *)&v128->_initialLoadGroup, v130);
  long long v179 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  long long v176 = 0u;
  v131 = val->_sectionControllers;
  uint64_t v132 = [(NSArray *)v131 countByEnumeratingWithState:&v176 objects:v205 count:16];
  if (v132)
  {
    uint64_t v133 = *(void *)v177;
    do
    {
      for (uint64_t i = 0; i != v132; ++i)
      {
        if (*(void *)v177 != v133) {
          objc_enumerationMutation(v131);
        }
        v135 = *(void **)(*((void *)&v176 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v136 = v135;
          dispatch_group_enter(v130);
          v174[0] = MEMORY[0x1E4F143A8];
          v174[1] = 3221225472;
          v174[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_16;
          v174[3] = &unk_1E59CA7D0;
          v175 = v130;
          [v136 preflight:v174];
        }
      }
      uint64_t v132 = [(NSArray *)v131 countByEnumeratingWithState:&v176 objects:v205 count:16];
    }
    while (v132);
  }

  objc_initWeak(&location, val);
  dispatch_group_enter(v130);
  [(PKPaymentPassDetailViewController *)val _updateHeaderActionView];
  [(PKPaymentPassDetailViewController *)val _updateExpressPassInformation];
  id v137 = *p_pass;
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v171[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_17;
  v171[3] = &unk_1E59CA7A8;
  v138 = v130;
  v172 = v138;
  objc_copyWeak(&v173, &location);
  [(PKPaymentPassDetailViewController *)val _updatePassPropertiesForPass:v137 completion:v171];
  PKObservePassSettingsChanged();
  v139 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v139 addObserver:val selector:sel__passSettingsChanged_ name:*MEMORY[0x1E4F87590] object:0];
  v140 = [(PKPaymentPassDetailViewController *)val navigationItem];
  [v140 setBackButtonDisplayMode:2];
  v141 = [*p_pass localizedDescription];
  [v140 setBackButtonTitle:v141];

  objc_msgSend(v140, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v140, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  objc_destroyWeak(&v173);
  objc_destroyWeak(&location);

LABEL_95:
  return v168;
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_2;
  v3[3] = &unk_1E59CB460;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1848) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) reloadSection:37];
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_4;
  v2[3] = &unk_1E59CA870;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void **)(v3 + 1080);
    *(void *)(v3 + 1080) = v4;
  }
  else
  {
    BOOL v6 = *(void **)(v3 + 2144);
    id v7 = [*(id *)(v3 + 1072) uniqueID];
    uint64_t v8 = [v6 groupIndexForPassUniqueID:v7];

    uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 2144) groupAtIndex:v8];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v10 + 1080);
    *(void *)(v10 + 1080) = v9;
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1080), "addGroupObserver:");
  id v11 = *(void **)(a1 + 40);

  return [v11 reloadSection:41];
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_5(uint64_t a1)
{
  id v2 = [PKPeerPaymentAssociatedAccountsController alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[283];
  uint64_t v5 = v3[271];
  uint64_t v6 = v3[281];
  uint64_t v7 = v3[269];
  uint64_t v8 = 3;
  if (v7 != 1) {
    uint64_t v8 = 0;
  }
  if (v7 == 2) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = [(PKPeerPaymentAssociatedAccountsController *)v2 initWithFamilyCollection:v4 avatarManager:v5 passLibraryDataProvider:v6 context:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 1832);
  *(void *)(v11 + 1832) = v10;

  [*(id *)(a1 + 32) _updateFamilyRows];
  BOOL v13 = *(void **)(a1 + 32);

  return [v13 contentIsLoaded];
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_7;
  block[3] = &unk_1E59CB838;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_7(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (!WeakRetained || !*(void *)(a1 + 32)) {
    goto LABEL_33;
  }
  if ([WeakRetained _accountFeature] == 4)
  {
    [v4 _updateBalanceIfNecessary];
    uint64_t v5 = [[PKAppleBalanceAddMoneyUIManager alloc] initWithAccount:*(void *)(a1 + 32)];
    id v6 = v4[252];
    v4[252] = v5;

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"PASS_DETAILS_BALANCE_FOOTER"];
    if (([v4[278] supportsInStorePayment] & 1) == 0) {
      [v7 appendString:@"_NO_IN_STORE_PAYMENT"];
    }
    id v8 = v4[236];
    id v9 = (NSString *)[v7 copy];
    id v10 = PKLocalizedLynxString(v9);
    [v8 setFooterText:v10];
  }
  else if ([v4 _accountFeature] == 3)
  {
    [v4 fetchFinancingPlansIfNecessary];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 1808) limitServerLoad]) {
    double v11 = 86400.0;
  }
  else {
    double v11 = 300.0;
  }
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    BOOL v12 = 0;
  }
  else
  {
    BOOL v13 = [*(id *)(a1 + 32) creditDetails];
    if (v13)
    {
      long long v14 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = [*(id *)(a1 + 32) lastUpdated];
      [v14 timeIntervalSinceDate:v15];
      BOOL v12 = v16 > v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  if ([v4 _accountFeature] == 2)
  {
    id v17 = *(void **)(a1 + 48);
    id v18 = [*(id *)(a1 + 32) accountIdentifier];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_8;
    v39[3] = &unk_1E59DF138;
    uint64_t v40 = v4;
    id v41 = *(id *)(a1 + 40);
    id v42 = *(id *)(a1 + 32);
    [v17 physicalCardsForAccountWithIdentifier:v18 completion:v39];
  }
  else if ([v4 _accountFeature] == 3)
  {
    id v19 = PKUIImageNamed(@"PayLater_MasterCard_Logo");
    if (v19)
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:0];
      double v21 = *MEMORY[0x1E4F1DAD8];
      double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v19 size];
      double v24 = v23;
      PKFloatRoundToPixel();
      objc_msgSend(v20, "setFrame:", v21, v22, 0.0, v24 + v25);
      id v26 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
      id v27 = [v20 contentView];
      [v27 addSubview:v26];

      objc_storeStrong(v4 + 188, v20);
      objc_storeStrong(v4 + 189, v26);
      if ([v4 isViewLoaded])
      {
        v28 = [v4 tableView];
        [v28 setTableFooterView:v4[188]];
      }
    }
    goto LABEL_26;
  }
  id v19 = 0;
LABEL_26:
  *((unsigned char *)v4 + 1776) = 1;
  [v4 _reloadView];
  if (v12)
  {
    id v29 = v4[273];
    uint64_t v30 = *(void *)(a1 + 56);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_10;
    v37[3] = &unk_1E59CFFF8;
    objc_copyWeak(&v38, v2);
    [v29 updateAccountWithIdentifier:v30 extended:0 completion:v37];
    objc_destroyWeak(&v38);
  }
  if ([v4 _accountFeature] == 2)
  {
    [v4 _updateCashbackPeerPaymentResolutionSection];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_12;
    v35[3] = &unk_1E59CA7D0;
    id v36 = v4;
    [v36 _loadAdditionalAccountDataWithCompletion:v35];
  }
  else if ([v4 _accountFeature] == 3)
  {
    [v4 contentIsLoaded];
  }
  id v31 = v4[273];
  uint64_t v32 = *(void *)(a1 + 56);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_13;
  void v33[3] = &unk_1E59DF160;
  objc_copyWeak(&v34, v2);
  [v31 userInfoForAccountIdentifier:v32 forceFetch:0 completion:v33];
  [v4 _updateAmpEligibility];
  objc_msgSend(v4[243], "setFeatureIdentifier:", objc_msgSend(*(id *)(a1 + 32), "feature"));
  objc_destroyWeak(&v34);

LABEL_33:
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_8(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_9;
  v5[3] = &unk_1E59CB8B0;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_9(void *a1)
{
  id v2 = [PKPhysicalCardController alloc];
  id v3 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v4 = [(PKPhysicalCardController *)v2 initWithAccountService:v3 paymentPass:*(void *)(a1[5] + 1072) account:a1[6] accountUser:0 physicalCards:a1[7]];
  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 1632);
  *(void *)(v5 + 1632) = v4;

  id v7 = [PKPhysicalCardActionController alloc];
  id v8 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v9 = [(PKPhysicalCardActionController *)v7 initWithAccountService:v8 account:a1[6] accountUser:0 delegate:a1[5]];
  uint64_t v10 = a1[4];
  double v11 = *(void **)(v10 + 1640);
  *(void *)(v10 + 1640) = v9;

  BOOL v12 = (void *)a1[4];

  return [v12 reloadSection:21];
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_11;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_11(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 278, *(id *)(a1 + 32));
    [v3 _reloadView];
    id WeakRetained = v3;
  }
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentIsLoaded];
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_14;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) creditPrimaryUser];
    id v3 = (void *)*((void *)WeakRetained + 221);
    *((void *)WeakRetained + 221) = v2;

    *((unsigned char *)WeakRetained + 1776) = 0;
    [*((id *)WeakRetained + 220) setShowSpinner:0];
    [WeakRetained reloadSection:42];
  }
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v8 && WeakRetained)
  {
    objc_storeStrong(WeakRetained + 278, a2);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_16(uint64_t a1)
{
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_17(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[217];
    WeakRetained[217] = 0;
    id v4 = WeakRetained;

    id WeakRetained = v4;
  }
}

- (BOOL)_shouldShowBankConnect
{
  int v3 = PKBankConnectEnabled();
  if (v3) {
    LOBYTE(v3) = self->_detailViewStyle <= 1uLL
  }
              && [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateActivated;
  return v3;
}

- (BOOL)_isBankConnectSupportedForPaymentPass:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPassDetailViewController *)self _shouldShowBankConnect]) {
    BOOL v5 = +[PKPassDetailBankConnectSectionController validForPaymentPass:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isBankConnectLinked
{
  if (![(PKPaymentPassDetailViewController *)self _shouldShowBankConnect]) {
    return 0;
  }
  int v3 = [(PKPaymentPassDetailViewController *)self bankConnectAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_buildSections
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v103 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  uint64_t v124 = __Block_byref_object_copy__65;
  uint64_t v125 = __Block_byref_object_dispose__65;
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke;
  aBlock[3] = &unk_1E59DF1B0;
  void aBlock[4] = &v121;
  uint64_t v2 = _Block_copy(aBlock);
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_2;
  v119[3] = &unk_1E59DF1D8;
  v119[4] = &v121;
  char v102 = (void (**)(void *, void *, __CFString *))_Block_copy(v119);
  int v3 = [[PKPaymentPassDetailWrapperSectionController alloc] initWithViewController:self];
  paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
  self->_paymentPassDetailSectionController = v3;

  BOOL v5 = [(PKPaymentPassDetailWrapperSectionController *)self->_paymentPassDetailSectionController sectionIdentifiers];
  uint64_t v6 = [v5 mutableCopy];
  id v7 = (void *)v122[5];
  v122[5] = v6;

  [v103 addObject:self->_paymentPassDetailSectionController];
  id v8 = [(PKPaymentPassDetailViewController *)self _configurableSections];
  v101 = objc_msgSend(v8, "pk_createSetByApplyingBlock:", &__block_literal_global_231);
  uint64_t v9 = [[PKConfigurablePassDetailSectionsController alloc] initWithPaymentPass:self->_pass clientReservedIdentifiers:v101];
  configurableSectionController = self->_configurableSectionController;
  self->_configurableSectionController = v9;

  [(PKConfigurablePassDetailSectionsController *)self->_configurableSectionController setDelegate:self];
  [(PKConfigurablePassDetailSectionsController *)self->_configurableSectionController setUseBridgeStyle:self->_detailViewStyle == 2];
  [v103 addObject:self->_configurableSectionController];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v12 = [(PKConfigurablePassDetailSectionsController *)self->_configurableSectionController sectionIdentifiers];
  [v11 addObjectsFromArray:v12];

  BOOL v13 = objc_msgSend(v101, "pk_arrayCopy");
  [v11 addObjectsFromArray:v13];

  long long v14 = [(PKPaymentPass *)self->_pass passDetailSections];
  uint64_t v15 = [v11 count];
  do
  {
    if (!v15) {
      break;
    }
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_4;
    v115[3] = &unk_1E59DF220;
    id v16 = v11;
    id v116 = v16;
    uint64_t v118 = &v121;
    id v117 = v2;
    [v14 enumerateObjectsWithOptions:2 usingBlock:v115];
    uint64_t v17 = [v16 count];
    BOOL v18 = v15 == v17;

    uint64_t v15 = v17;
  }
  while (!v18);
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_5;
  v112[3] = &unk_1E59DF248;
  v112[4] = self;
  uint64_t v114 = &v121;
  id v19 = v2;
  id v113 = v19;
  [v11 enumerateObjectsWithOptions:2 usingBlock:v112];

  id v20 = self;
  if (+[PKPaymentPassDetailBalanceSectionController validForPaymentPass:self->_pass])
  {
    double v21 = [[PKPaymentPassDetailBalanceSectionController alloc] initWithDelegate:self];
    balanceSectionController = self->_balanceSectionController;
    self->_balanceSectionController = v21;

    [v103 addObject:self->_balanceSectionController];
    double v23 = [(PKPaymentPassDetailBalanceSectionController *)self->_balanceSectionController allSectionIdentifiers];
    v102[2](v102, v23, @"LinkedApplication");

    id v20 = self;
  }
  if (+[PKPaymentPassDetailAutoReloadActionSectionController validForPaymentPass:v20->_pass])
  {
    double v24 = [[PKPaymentPassDetailAutoReloadActionSectionController alloc] initWithPass:v20->_pass paymentDataProvider:v20->_paymentServiceDataProvider viewStyle:v20->_detailViewStyle delegate:v20];
    p_autoReloadActionSectionController = &v20->_autoReloadActionSectionController;
    id v26 = *p_autoReloadActionSectionController;
    *p_autoReloadActionSectionController = v24;

    [v103 addObject:*p_autoReloadActionSectionController];
    [(PKPaymentPassDetailAutoReloadActionSectionController *)self->_autoReloadActionSectionController setSetupDelegate:self];
    id v27 = [(PKPaymentPassDetailAutoReloadActionSectionController *)self->_autoReloadActionSectionController allSectionIdentifiers];
    v102[2](v102, v27, @"BalancesAndCommutePlans");

    id v20 = self;
  }
  if (+[PKPaymentPassDetailPassActionSectionController validForPaymentPass:v20->_pass])
  {
    v28 = [[PKPaymentPassDetailPassActionSectionController alloc] initWithPass:v20->_pass viewStyle:v20->_detailViewStyle paymentDataProvider:v20->_paymentServiceDataProvider webService:v20->_webService transitBalanceModel:v20->_transitBalanceModel delegate:v20];
    p_passActionSectionController = &v20->_passActionSectionController;
    uint64_t v30 = *p_passActionSectionController;
    *p_passActionSectionController = v28;

    [v103 addObject:*p_passActionSectionController];
    id v31 = [(PKPaymentPassDetailPassActionSectionController *)self->_passActionSectionController allSectionIdentifiers];
    v102[2](v102, v31, @"BalancesAndCommutePlans");

    id v20 = self;
  }
  if (+[PKPassDetailSharesSectionController validForPaymentPass:v20->_pass])
  {
    id v32 = objc_alloc(MEMORY[0x1E4F85018]);
    pass = v20->_pass;
    id v34 = [(PKPaymentPassDetailViewController *)v20 contactResolver];
    webService = v20->_webService;
    paymentServiceDataProvider = v20->_paymentServiceDataProvider;
    uint64_t v37 = MEMORY[0x1E4F14428];
    id v38 = MEMORY[0x1E4F14428];
    v39 = (void *)[v32 initWithPass:pass contactResolver:v34 webService:webService paymentServiceProvider:paymentServiceDataProvider queue:v37];

    uint64_t v40 = [[PKPassDetailSharesSectionController alloc] initWithSharesController:v39 delegate:self];
    sharesSectionController = self->_sharesSectionController;
    self->_sharesSectionController = v40;

    [v103 addObject:self->_sharesSectionController];
    id v42 = [(PKPassDetailSharesSectionController *)self->_sharesSectionController allSectionIdentifiers];
    v102[2](v102, v42, @"TransactionsByYear");

    id v20 = self;
  }
  if (+[PKPassDetailScheduledPaymentsSectionController validForPaymentPass:v20->_pass])
  {
    v43 = [PKPassDetailScheduledPaymentsSectionController alloc];
    account = v20->_account;
    v45 = v20->_pass;
    v46 = [MEMORY[0x1E4F84270] sharedInstance];
    uint64_t v47 = [(PKPassDetailScheduledPaymentsSectionController *)v43 initWithAccount:account pass:v45 accountService:v46 delegate:v20];
    p_scheduledPaymentsSectionController = &v20->_scheduledPaymentsSectionController;
    v49 = (void *)*p_scheduledPaymentsSectionController;
    void *p_scheduledPaymentsSectionController = v47;

    [v103 addObject:*p_scheduledPaymentsSectionController];
    v50 = [(PKPassDetailScheduledPaymentsSectionController *)self->_scheduledPaymentsSectionController allSectionIdentifiers];
    v102[2](v102, v50, @"AccountUsers");

    id v20 = self;
  }
  if ([(PKPaymentPassDetailViewController *)v20 _shouldShowBankConnect]
    && +[PKPassDetailAccountCredentialsSectionController validForPaymentPass:v20->_pass])
  {
    objc_initWeak(&location, v20);
    v51 = [_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController alloc];
    v52 = self->_pass;
    id v110 = 0;
    uint64_t v53 = [(PKPassDetailAccountCredentialsSectionController *)v51 initWithPass:v52 delegate:self throwsError:&v110];
    id v54 = v110;
    accountCredentialsSectionController = self->_accountCredentialsSectionController;
    self->_accountCredentialsSectionController = v53;

    if (v54)
    {
      v56 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v128 = v54;
        _os_log_impl(&dword_19F450000, v56, OS_LOG_TYPE_DEFAULT, "Failed to make PKPassDetailAccountCredentialsSectionController: %@.", buf, 0xCu);
      }
    }
    else
    {
      v57 = self->_accountCredentialsSectionController;
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_6;
      v108[3] = &unk_1E59CB010;
      objc_copyWeak(&v109, &location);
      v108[4] = self;
      [(PKPassDetailAccountCredentialsSectionController *)v57 fetchPaymentInformationWithCompletion:v108];
      [v103 addObject:self->_accountCredentialsSectionController];
      BOOL v58 = [(PKPassDetailAccountCredentialsSectionController *)self->_accountCredentialsSectionController allSectionIdentifiers];
      v102[2](v102, v58, @"LinkedApplication");

      objc_destroyWeak(&v109);
    }

    objc_destroyWeak(&location);
    id v20 = self;
  }
  if ([(PKPaymentPassDetailViewController *)v20 _isBankConnectSupportedForPaymentPass:v20->_pass])
  {
    v59 = [_TtC9PassKitUI40PKPassDetailBankConnectSectionController alloc];
    v60 = v20->_pass;
    id v107 = 0;
    uint64_t v61 = [(PKPassDetailBankConnectSectionController *)v59 initWithPass:v60 delegate:v20 throwsError:&v107];
    id v62 = v107;
    bankConnectSectionController = v20->_bankConnectSectionController;
    v20->_bankConnectSectionController = (_TtC9PassKitUI40PKPassDetailBankConnectSectionController *)v61;

    if (v62)
    {
      v64 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v128 = v62;
        _os_log_impl(&dword_19F450000, v64, OS_LOG_TYPE_DEFAULT, "Failed to make PKPassDetailBankConnectSectionController: %@.", buf, 0xCu);
      }
    }
    else
    {
      [v103 addObject:self->_bankConnectSectionController];
      v64 = [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController allSectionIdentifiers];
      v102[2](v102, v64, @"LinkedApplication");
    }

    id v20 = self;
  }
  if (+[PKPeerPaymentAutoReloadSectionController validForPaymentPass:v20->_pass]&& v20->_detailViewStyle != 2)
  {
    BOOL v65 = [PKPeerPaymentAutoReloadSectionController alloc];
    int64_t detailViewStyle = v20->_detailViewStyle;
    uint64_t v67 = 3;
    if (detailViewStyle != 1) {
      uint64_t v67 = 0;
    }
    if (detailViewStyle == 2) {
      uint64_t v68 = 4;
    }
    else {
      uint64_t v68 = v67;
    }
    uint64_t v69 = [(PKPeerPaymentAutoReloadSectionController *)v65 initWithDelegate:v20 pass:v20->_pass context:v68 passLibraryDataProvider:v20->_passLibraryDataProvider];
    p_peerPaymentAutoReloadSectionController = &v20->_peerPaymentAutoReloadSectionController;
    v71 = (void *)*p_peerPaymentAutoReloadSectionController;
    void *p_peerPaymentAutoReloadSectionController = v69;

    [v103 addObject:*p_peerPaymentAutoReloadSectionController];
    v72 = [(PKPeerPaymentAutoReloadSectionController *)self->_peerPaymentAutoReloadSectionController allSectionIdentifiers];
    v102[2](v102, v72, @"PeerPaymentMoneyActions");

    id v20 = self;
  }
  if (+[PKPeerPaymentRecurringPaymentPassDetailsSectionController validForPaymentPass:v20->_pass]&& v20->_detailViewStyle == 1)
  {
    char v73 = [PKPeerPaymentRecurringPaymentPassDetailsSectionController alloc];
    int64_t v74 = v20->_detailViewStyle;
    uint64_t v75 = 3;
    if (v74 != 1) {
      uint64_t v75 = 0;
    }
    if (v74 == 2) {
      uint64_t v76 = 4;
    }
    else {
      uint64_t v76 = v75;
    }
    uint64_t v77 = [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)v73 initWithDelegate:v20 pass:v20->_pass context:v76 passLibraryDataProvider:v20->_passLibraryDataProvider];
    p_peerPaymentRecurringPaymentSectionController = &v20->_peerPaymentRecurringPaymentSectionController;
    uint64_t v79 = (void *)*p_peerPaymentRecurringPaymentSectionController;
    void *p_peerPaymentRecurringPaymentSectionController = v77;

    [v103 addObject:*p_peerPaymentRecurringPaymentSectionController];
    uint64_t v80 = [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self->_peerPaymentRecurringPaymentSectionController allSectionIdentifiers];
    v102[2](v102, v80, @"PeerPaymentMoneyActions");

    id v20 = self;
  }
  if (+[PKPassDetailsPrecursorPassUpgradeSectionController validForPaymentPass:v20->_pass])
  {
    uint64_t v81 = [[PKPassDetailsPrecursorPassUpgradeSectionController alloc] initWithPass:v20->_pass webService:v20->_webService delegate:v20];
    p_precursorSectionController = &v20->_precursorSectionController;
    v83 = *p_precursorSectionController;
    *p_precursorSectionController = v81;

    [v103 addObject:*p_precursorSectionController];
    v84 = [(PKPassDetailsPrecursorPassUpgradeSectionController *)self->_precursorSectionController allSectionIdentifiers];
    v102[2](v102, v84, @"LinkedApplication");

    id v20 = self;
  }
  if (+[PKPassDetailsIdentityBioBindingSectionController validForPaymentPass:v20->_pass])
  {
    v85 = [[PKPassDetailsIdentityBioBindingSectionController alloc] initWithPass:v20->_pass webService:v20->_webService delegate:v20];
    p_bioBindingSectionController = &v20->_bioBindingSectionController;
    v87 = *p_bioBindingSectionController;
    *p_bioBindingSectionController = v85;

    [v103 addObject:*p_bioBindingSectionController];
    id v88 = [(PKPassDetailsIdentityBioBindingSectionController *)self->_bioBindingSectionController allSectionIdentifiers];
    v102[2](v102, v88, @"LinkedApplication");

    id v20 = self;
  }
  if (+[PKPeerPaymentIdentityManagementSectionController validForPaymentPass:v20->_pass])
  {
    v89 = [[PKPeerPaymentIdentityManagementSectionController alloc] initWithDelegate:v20];
    p_peerPaymentIdentityManagementSectionController = &v20->_peerPaymentIdentityManagementSectionController;
    v91 = *p_peerPaymentIdentityManagementSectionController;
    *p_peerPaymentIdentityManagementSectionController = v89;

    [v103 addObject:*p_peerPaymentIdentityManagementSectionController];
    id v92 = [(PKPeerPaymentIdentityManagementSectionController *)self->_peerPaymentIdentityManagementSectionController allSectionIdentifiers];
    v102[2](v102, v92, @"PeerPaymentAutomaticallyAcceptPaymentsPreference");

    id v20 = self;
  }
  if (PKIsPhone()
    && PKBroadwayDiscoverability2024Enabled()
    && [(PKPaymentPass *)v20->_pass isAppleCardPass])
  {
    v93 = objc_alloc_init(PKAppleCardFeaturesAndBenefitsSectionController);
    broadwayFeaturesAndBenefitsSectionController = v20->_broadwayFeaturesAndBenefitsSectionController;
    v20->_broadwayFeaturesAndBenefitsSectionController = v93;

    objc_initWeak((id *)buf, self);
    v95 = v20->_broadwayFeaturesAndBenefitsSectionController;
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_347;
    v105[3] = &unk_1E59DF270;
    objc_copyWeak(&v106, (id *)buf);
    [(PKAppleCardFeaturesAndBenefitsSectionController *)v95 setSelectionHandler:v105];
    [v103 addObject:self->_broadwayFeaturesAndBenefitsSectionController];
    v96 = [(PKAppleCardFeaturesAndBenefitsSectionController *)self->_broadwayFeaturesAndBenefitsSectionController allSectionIdentifiers];
    v102[2](v102, v96, @"BillingAddress");

    objc_destroyWeak(&v106);
    objc_destroyWeak((id *)buf);
    id v20 = self;
  }
  uint64_t v97 = [v103 copy];
  sectionControllers = v20->_sectionControllers;
  v20->_sectionControllers = (NSArray *)v97;

  id v99 = (NSArray *)[(id)v122[5] copy];
  orderOfSectionIdentifiers = self->_orderOfSectionIdentifiers;
  self->_orderOfSectionIdentifiers = v99;

  _Block_object_dispose(&v121, 8);
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) indexOfObject:a3];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertObject:v6 atIndex:v5 + 1];
  }
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) indexOfObject:a3];
  if ([v9 count])
  {
    unint64_t v6 = 0;
    do
    {
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v8 = [v9 objectAtIndexedSubscript:v6];
        [v7 insertObject:v8 atIndex:v5 + 1 + v6];
      }
      ++v6;
    }
    while (v6 < [v9 count]);
  }
}

uint64_t __51__PKPaymentPassDetailViewController__buildSections__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [v6 identifier];
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    BOOL v4 = [v6 insertAfterSection];
    if (!v4 || ([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
    {
      [*(id *)(a1 + 32) removeObject:v3];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObject:v3];
      uint64_t v5 = sectionIdentifierForInsertAfter(v4, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_5(void *a1, void *a2)
{
  id v6 = a2;
  int v3 = objc_msgSend(*(id *)(a1[4] + 1928), "sectionForIdentifier:");
  if (v3)
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeObject:v6];
    BOOL v4 = [v3 insertAfterSection];
    uint64_t v5 = sectionIdentifierForInsertAfter(v4, *(void **)(*(void *)(a1[6] + 8) + 40));

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 2000) sectionIdentifiers];
  [WeakRetained reloadSections:v2];
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_347(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  uint64_t v2 = objc_alloc_init(PKAppleCardFeaturesAndBenefitsViewController);
  [v1 pushViewController:v2 animated:1];
}

- (void)_decorateSections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v3 = self->_sectionControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t detailViewStyle = self->_detailViewStyle;
          id v10 = v8;
          objc_msgSend(v10, "setDetailViewStyle:", detailViewStyle, (void)v11);
          [v10 setPrimaryTextColor:self->_primaryTextColor];
          [v10 setDetailTextColor:self->_detailTextColor];
          [v10 setLinkTextColor:self->_linkTextColor];
          [v10 setWarningTextColor:self->_warningTextColor];
          [v10 setHighlightColor:self->_highlightColor];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)_configurableSections
{
  uint64_t v2 = [(PKPaymentPass *)self->_pass passDetailSections];
  int v3 = objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_352_0);
  uint64_t v4 = v3;
  if (!v3) {
    int v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

BOOL __58__PKPaymentPassDetailViewController__configurableSections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 identifier];
  uint64_t v4 = PKPassDetailSectionTypeFromString(v3);

  if (v4 == 30)
  {
    id v5 = [v2 insertAfterSection];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_configurableSectionForSectionType:(unint64_t)a3
{
  if (a3 == 30)
  {
    int v3 = [(PKPaymentPass *)self->_pass passDetailSections];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PKPaymentPassDetailViewController__configurableSectionForSectionType___block_invoke;
    v6[3] = &__block_descriptor_40_e29_B16__0__PKPassDetailSection_8l;
    void v6[4] = 30;
    uint64_t v4 = objc_msgSend(v3, "pk_firstObjectPassingTest:", v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __72__PKPaymentPassDetailViewController__configurableSectionForSectionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [a2 identifier];
  BOOL v4 = v2 == PKPassDetailSectionTypeFromString(v3);

  return v4;
}

- (void)dealloc
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext)
  {
    [(LAContext *)authenticationContext invalidate];
    BOOL v4 = self->_authenticationContext;
    self->_authenticationContext = 0;
  }
  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    BOOL v6 = self->_refreshTimeout;
    self->_refreshTimeout = 0;
  }
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    id v8 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  PKUnregisterPassSettingsChangedObserver();
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self];

  id v10 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v10 removeObserver:self];

  int expressPassesInformationToken = self->_expressPassesInformationToken;
  if (expressPassesInformationToken != -1) {
    notify_cancel(expressPassesInformationToken);
  }
  [(PKPaymentVerificationController *)self->_verificationController setDelegate:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained setDeletionStatusHandler:0 forPass:self->_pass];
  }
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentDataProvider *)self->_paymentServiceDataProvider removeDelegate:self];
  }
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  [(PKGroup *)self->_group removeGroupObserver:self];
  long long v13 = [MEMORY[0x1E4F84188] sharedManager];
  [v13 unregisterObserver:self];

  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v14 dealloc];
}

- (void)executeAfterContentIsLoaded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__PKPaymentPassDetailViewController_executeAfterContentIsLoaded___block_invoke;
    v6[3] = &unk_1E59CAD18;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __65__PKPaymentPassDetailViewController_executeAfterContentIsLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 1792))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    int v3 = *(void **)(v1 + 1800);
    id v4 = _Block_copy(*(const void **)(a1 + 40));
    [v3 addObject:v4];
  }
}

- (void)contentIsLoaded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_allContentIsLoaded = 1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = (void *)[(NSMutableArray *)self->_executionBlocksContentIsLoaded copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_executionBlocksContentIsLoaded removeAllObjects];
}

- (void)setShowDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(PKPaymentPassDetailViewController *)self navigationItem];
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v6 = PKLocalizedString(&cfstr_Done.isa);
    uint64_t v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__done_];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v8 setRightBarButtonItem:v7];
}

- (void)viewWillMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (a3)
  {
    initialLoadGroup = self->_initialLoadGroup;
    if (initialLoadGroup)
    {
      self->_initialLoadGroup = 0;

      self->_initialLoadTimedout = 1;
    }
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v13 willMoveToParentViewController:v4];
  if (v4)
  {
    initialLoadGroup = self->_initialLoadGroup;
    if (initialLoadGroup)
    {
      objc_super v6 = initialLoadGroup;
      uint64_t v7 = self->_initialLoadGroup;
      self->_initialLoadGroup = 0;

      id v8 = [v4 viewIfLoaded];
      long long v9 = [v8 window];

      if (v9)
      {
        self->_initialLoadTimedout = 1;
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke;
        v12[3] = &unk_1E59CF6D0;
        v12[4] = self;
        [v4 _beginDelayingPresentation:v12 cancellationHandler:2.0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke_2;
        v10[3] = &unk_1E59CA7D0;
        id v11 = v4;
        dispatch_group_notify(v6, MEMORY[0x1E4F14428], v10);
      }
    }
  }
}

uint64_t __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1744) = 1;
  return 1;
}

uint64_t __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDelayingPresentation];
}

- (void)_refreshStaleBalanceModelForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isStoredValuePass] & 1) != 0 || (objc_msgSend(v6, "isAccessPass"))
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__65;
    void v37[4] = __Block_byref_object_dispose__65;
    id v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__65;
    void v35[4] = __Block_byref_object_dispose__65;
    id v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    void v33[3] = __Block_byref_object_copy__65;
    void v33[4] = __Block_byref_object_dispose__65;
    id v34 = 0;
    id v8 = [v6 uniqueID];
    long long v9 = [v6 devicePrimaryPaymentApplication];
    id v10 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke;
    v28[3] = &unk_1E59D5278;
    void v28[4] = self;
    id v11 = v8;
    id v29 = v11;
    id v12 = v9;
    id v30 = v12;
    id v32 = v37;
    id v31 = v6;
    [v10 addOperation:v28];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_4;
    v25[3] = &unk_1E59CC7D8;
    v25[4] = self;
    id v13 = v11;
    id v26 = v13;
    id v27 = v35;
    [v10 addOperation:v25];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_7;
    v22[3] = &unk_1E59CC7D8;
    v22[4] = self;
    id v14 = v13;
    id v23 = v14;
    double v24 = v33;
    [v10 addOperation:v22];
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_10;
    v17[3] = &unk_1E59DF300;
    id v18 = v7;
    id v19 = v35;
    id v20 = v33;
    double v21 = v37;
    id v16 = (id)[v10 evaluateWithInput:v15 completion:v17];

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);

    _Block_object_dispose(v37, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = *(void *)(a1 + 40);
    long long v9 = *(void **)(*(void *)(a1 + 32) + 2176);
    id v10 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_2;
    v11[3] = &unk_1E59CC800;
    uint64_t v16 = *(void *)(a1 + 64);
    id v12 = v10;
    id v13 = *(id *)(a1 + 56);
    id v15 = v7;
    id v14 = v6;
    [v9 transitStateWithPassUniqueIdentifier:v8 paymentApplication:v12 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_3;
  v5[3] = &unk_1E59DF2D8;
  uint64_t v11 = *(void *)(a1 + 64);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transitPassPropertiesWithPaymentApplication:*(void *)(a1 + 40) pass:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v5();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = a1[5];
    id v9 = *(void **)(a1[4] + 2176);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_5;
    v10[3] = &unk_1E59CC828;
    uint64_t v13 = a1[6];
    id v12 = v7;
    id v11 = v6;
    [v9 balancesForPaymentPassWithUniqueIdentifier:v8 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_6;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_7(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = a1[5];
    id v9 = *(void **)(a1[4] + 2176);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_8;
    v10[3] = &unk_1E59CC850;
    uint64_t v13 = a1[6];
    id v12 = v7;
    id v11 = v6;
    [v9 plansForPaymentPassWithUniqueIdentifier:v8 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_9;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_9(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_10(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_11;
  v2[3] = &unk_1E59D1840;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_11(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v21 loadView];
  id v3 = [(PKPaymentPassDetailViewController *)self tableView];
  if ([(PKPaymentPassDetailViewController *)self shouldAllowRefresh])
  {
    long long v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E4FB1B58]);
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    [(PKPaymentPassDetailViewController *)self setRefreshControl:self->_refreshControl];
    [(UIRefreshControl *)self->_refreshControl addTarget:self action:sel_refreshControlValueChanged_ forControlEvents:4096];
  }
  [v3 setEstimatedSectionHeaderHeight:0.0];
  PKFloatRoundToPixel();
  objc_msgSend(v3, "setEstimatedSectionFooterHeight:");
  if (self->_detailViewStyle == 2) {
    [v3 setIndicatorStyle:2];
  }
  id v6 = objc_alloc(MEMORY[0x1E4FB1D30]);
  id v7 = (UITableViewHeaderFooterView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v7;

  if (self->_pass)
  {
    if (self->_primaryTextColor) {
      -[PKPassHeaderView setPrimaryTextColor:](self->_passHeaderView, "setPrimaryTextColor:");
    }
    if (self->_detailTextColor) {
      -[PKPassHeaderView setSecondaryTextColor:](self->_passHeaderView, "setSecondaryTextColor:");
    }
    [(UITableViewHeaderFooterView *)self->_headerView addSubview:self->_passHeaderView];
    [(PKPaymentPassDetailViewController *)self _updatePassSnapshot];
  }
  NSUInteger v9 = [(NSArray *)self->_tabBarSegments count];
  if (self->_hasTabBar)
  {
    if (v9 < 2) {
      goto LABEL_22;
    }
    long long v10 = PKPassDetailsLastSelectedSegment();
    id v11 = PKSegmentStringToSegment(v10);
    if (!v11) {
      goto LABEL_18;
    }
    NSUInteger v12 = [(NSArray *)self->_tabBarSegments indexOfObject:v11];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v17 = v12;
      goto LABEL_20;
    }
    if (self->_hasTabBar)
    {
      uint64_t v13 = [(NSArray *)self->_tabBarSegments objectAtIndex:0];
      uint64_t v14 = [v13 unsignedIntegerValue];

      id v15 = [NSNumber numberWithUnsignedInteger:v14];
      uint64_t v16 = PKSegmentToSegmentString(v15);

      PKSetPassDetailsLastSelectedSegment();
      NSUInteger v17 = 0;
      long long v10 = (void *)v16;
    }
    else
    {
LABEL_18:
      NSUInteger v17 = 0;
    }
LABEL_20:
    id v18 = [(PKPaymentPassDetailViewController *)self _createTabBarWithSelectedIndex:v17];
    tabBar = self->_tabBar;
    self->_tabBar = v18;

    [(UITableViewHeaderFooterView *)self->_headerView addSubview:self->_tabBar];
    goto LABEL_21;
  }
  long long v10 = self->_tabBar;
  self->_tabBar = 0;
LABEL_21:

LABEL_22:
  [(PKPaymentPassDetailViewController *)self _updateHeaderHeightDeterminingLayout:0];
  -[UITableViewHeaderFooterView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.0, self->_headerHeight + self->_tabBarHeight);
  [v3 setTableHeaderView:self->_headerView];
  if (self->_footerView) {
    objc_msgSend(v3, "setTableFooterView:");
  }
  [v3 _setPinsTableHeaderView:1];
  if (self->_peerPaymentAccount && !self->_peerPaymentPreferences) {
    [(PKPaymentPassDetailViewController *)self _updatePeerPaymentPreferences];
  }
  [(PKPaymentPassDetailViewController *)self reloadData:0];
  id v20 = [(PKPaymentPassDetailViewController *)self view];
  [v20 setAccessibilityIdentifier:*MEMORY[0x1E4F85770]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v16 viewWillAppear:a3];
  [(PKPaymentPassDetailViewController *)self _updateHeaderHeightDeterminingLayout:1];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  NSUInteger v12 = __52__PKPaymentPassDetailViewController_viewWillAppear___block_invoke;
  uint64_t v13 = &unk_1E59CA7F8;
  objc_copyWeak(&v14, &location);
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:&v10];
  [(PKPaymentPassDetailViewController *)self _updateCashbackPeerPaymentResolutionSection];
  [(PKPaymentPassDetailViewController *)self _fetchMerchantTokens];
  if (!self->_titleIconView)
  {
    long long v4 = [(PKPaymentPassDetailViewController *)self navigationController];
    uint64_t v5 = [v4 navigationBar];

    [v5 frame];
    id v7 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v6 + v6, v6);
    titleIconView = self->_titleIconView;
    self->_titleIconView = v7;

    [(PKAnimatedNavigationBarTitleView *)self->_titleIconView setAlpha:0.0];
    NSUInteger v9 = [(PKPaymentPassDetailViewController *)self navigationItem];
    objc_msgSend(v9, "pkui_setCenterAlignedTitleView:", self->_titleIconView);

    self->_showingTitleIconView = 0;
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__PKPaymentPassDetailViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadTransactionSectionsAnimated:0 forceReload:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v16 viewDidAppear:a3];
  [(PKPaymentPassDetailViewController *)self _reloadTitle];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PKPDVCDidAppearNotification" object:self userInfo:0];

  [(PKPaymentPassDetailViewController *)self _beginReportingForSubjectIfNecessary:*MEMORY[0x1E4F87038]];
  if ([(PKPaymentPass *)self->_pass isPeerPaymentPass]) {
    [(PKPaymentPassDetailViewController *)self _beginReportingForSubjectIfNecessary:*MEMORY[0x1E4F87000]];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v17[0] = *MEMORY[0x1E4F86308];
  v17[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86768];
  v18[0] = *MEMORY[0x1E4F864A0];
  v18[1] = v8;
  NSUInteger v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v10 = (void *)[v6 initWithDictionary:v9];

  if ([(PKPaymentPass *)self->_pass isIdentityPass])
  {
    [MEMORY[0x1E4F843E0] updateIdentityEventToReportDashboardAnalytics:v10 forPass:self->_pass];
    int64_t detailViewStyle = self->_detailViewStyle;
    if (detailViewStyle == 1)
    {
      NSUInteger v12 = (void *)MEMORY[0x1E4F866A0];
    }
    else
    {
      if (detailViewStyle != 2) {
        goto LABEL_9;
      }
      NSUInteger v12 = (void *)MEMORY[0x1E4F86698];
    }
    [v10 setObject:*v12 forKeyedSubscript:*MEMORY[0x1E4F86B38]];
  }
LABEL_9:
  if ([(PKPaymentPass *)self->_pass isPeerPaymentPass]) {
    [v10 setObject:*MEMORY[0x1E4F869F0] forKeyedSubscript:*MEMORY[0x1E4F864C8]];
  }
  uint64_t v13 = self->_pass;
  if ([(PKPaymentPass *)v13 passType] == 1)
  {
    id v14 = [(PKPaymentPass *)v13 secureElementPass];
    unint64_t v15 = [v14 cardType];
    if (v15 <= 4) {
      id v3 = (__CFString *)**((id **)&unk_1E59DFBB0 + v15);
    }
  }
  else
  {
    id v3 = @"other";
  }

  [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
  [MEMORY[0x1E4F843E0] reportDashboardEventIfNecessary:v10 forPass:self->_pass];
  [(PKPaymentPassDetailViewController *)self presentPayLaterAccountErrorsIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v6 viewWillDisappear:a3];
  [(PKPaymentPassDetailViewController *)self _cancelPendingTransactionTimer];
  [(PKPaymentPassDetailViewController *)self _reloadTitle];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    uint64_t v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v11 viewDidDisappear:a3];
  id v4 = (id)*MEMORY[0x1E4F86768];
  if ([(PKPaymentPass *)self->_pass isIdentityPass])
  {
    id v5 = (id)*MEMORY[0x1E4F867D8];

    id v4 = v5;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = *MEMORY[0x1E4F864A8];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v8;
  v13[0] = v7;
  v13[1] = v4;
  NSUInteger v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = (void *)[v6 initWithDictionary:v9];

  if ([(PKPaymentPass *)self->_pass isPeerPaymentPass]) {
    [v10 setObject:*MEMORY[0x1E4F869F0] forKeyedSubscript:*MEMORY[0x1E4F864C8]];
  }
  [MEMORY[0x1E4F843E0] reportDashboardEventIfNecessary:v10 forPass:self->_pass];
  [(PKPaymentPassDetailViewController *)self _endReportingIfNecessary];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKPaymentPassDetailViewController *)self tableView];
  id v4 = [(PKPaymentPassDetailViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)viewDidLayoutSubviews
{
  v81.receiver = self;
  v81.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v81 viewDidLayoutSubviews];
  id v3 = [(PKPaymentPassDetailViewController *)self tableView];
  [v3 bounds];
  double v76 = v5;
  double v77 = v4;
  double v7 = v6;
  [v3 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;
  [v3 contentSize];
  double v75 = v12;
  double v14 = v13;
  [(PKPaymentPassDetailViewController *)self _offscreenHeaderHeight];
  double v16 = v15;
  [v3 contentInset];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = v7 - (v9 + v11);
  BOOL v25 = v14 <= v24;
  double v26 = v14 - v24;
  _NF = !v25 && v26 < v16;
  double v28 = v16 - v26;
  if (_NF) {
    double v29 = v28;
  }
  else {
    double v29 = v17;
  }
  [v3 contentInset];
  BOOL v33 = v32 == v21;
  if (v34 != v19) {
    BOOL v33 = 0;
  }
  if (v31 != v23) {
    BOOL v33 = 0;
  }
  BOOL v35 = v30 == v29 && v33;
  if (!v35) {
    objc_msgSend(v3, "setContentInset:", v19, v21, v29, v23);
  }
  double v36 = v16 + v19;
  BOOL v37 = [(UIRefreshControl *)self->_refreshControl isRefreshing];
  id v38 = [(UIRefreshControl *)self->_refreshControl superview];
  double v39 = 0.0;
  if (v38)
  {
    double v40 = -(v9 + v19);

    double v41 = v77;
    if (v77 < v40) {
      double v39 = v40 - v77;
    }
  }
  else
  {
    double v41 = v77;
  }
  double v42 = v36 + v39;
  memset(&slice, 0, sizeof(slice));
  [v3 layoutIfNeeded];
  [v3 _moveContentSubview:self->_headerView toBack:0];
  if (self->_previousLayoutContentSize.width != v75 || self->_previousLayoutContentSize.height != v14)
  {
    self->_previousLayoutContentSize.width = v75;
    self->_previousLayoutContentSize.height = v14;
    p_previousLayoutTableViewWidth = &self->_previousLayoutTableViewWidth;
    double v45 = v76;
    if (self->_previousLayoutTableViewWidth == v76) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  p_previousLayoutTableViewWidth = &self->_previousLayoutTableViewWidth;
  double v45 = v76;
  if (self->_previousLayoutTableViewWidth != v76)
  {
LABEL_27:
    [(PKPaymentPassDetailViewController *)self _updateHeaderHeightDeterminingLayout:0];
    double *p_previousLayoutTableViewWidth = v45;
LABEL_28:
    [(PKPaymentPassDetailViewController *)self _normalizeContentOffset];
    goto LABEL_29;
  }
  if (!v35 && !v37) {
    goto LABEL_28;
  }
LABEL_29:
  [v3 _rectForTableHeaderView];
  double v47 = v46;
  double v48 = v42 - (v9 + v19 + v39);
  double v49 = self->_headerHeight + self->_tabBarHeight;
  double v50 = v41 - v48;
  -[UITableViewHeaderFooterView setFrame:](self->_headerView, "setFrame:");
  if (v47 != v49) {
    [v3 _tableHeaderHeightDidChangeToHeight:v49];
  }
  [(PKPassHeaderView *)self->_passHeaderView updateShadow:fmin(fmax(v50 / (v48 + -20.0 - v48), 0.0), 1.0)];
  [(PKPassHeaderView *)self->_passHeaderView setAlpha:fmin(fmax((v41 - (v48 + 20.0)) / (v48 - (v48 + 20.0)), 0.0), 1.0)];
  [(UITableViewHeaderFooterView *)self->_headerView bounds];
  CGRect remainder = v82;
  CGRectDivide(v82, &slice, &remainder, self->_headerHeight, CGRectMinYEdge);
  CGRect v78 = remainder;
  -[PKPassHeaderView setFrame:](self->_passHeaderView, "setFrame:", slice.origin.x + self->_headerContentInset.left, slice.origin.y + self->_headerContentInset.top, slice.size.width - (self->_headerContentInset.left + self->_headerContentInset.right), slice.size.height - (self->_headerContentInset.top + self->_headerContentInset.bottom));
  CGRect remainder = v78;
  tabBar = self->_tabBar;
  if (tabBar)
  {
    [(UISegmentedControl *)tabBar frame];
    double left = self->_headerContentInset.left;
    CGFloat v53 = left + remainder.origin.x;
    double v54 = left + self->_headerContentInset.right;
    remainder.origin.x = v53;
    remainder.origin.y = remainder.origin.y + 15.0;
    __asm { FMOV            V5.2D, #-30.0 }
    float64x2_t v58 = vaddq_f64((float64x2_t)remainder.size, _Q5);
    _Q5.f64[0] = v54;
    *(void *)&v59.width = *(_OWORD *)&vsubq_f64((float64x2_t)remainder.size, _Q5);
    v59.height = v58.f64[1];
    remainder.size = v59;
    -[UISegmentedControl setFrame:](self->_tabBar, "setFrame:");
    [(UISegmentedControl *)self->_tabBar setAlpha:fmin(fmax(v50 / (v48 + -15.0 - v48), 0.0), 1.0)];
  }
  footerView = self->_footerView;
  if (footerView)
  {
    uint64_t v61 = [(UITableViewHeaderFooterView *)footerView contentView];
    int v62 = [v61 _shouldReverseLayoutDirection];
    [v61 layoutMargins];
    double v64 = v63;
    double v66 = v65;
    [v61 bounds];
    double v68 = v64 + v67;
    double v70 = v69 + 0.0;
    double v72 = v71 - (v64 + v66);
    [(UIImageView *)self->_logoView frame];
    double v74 = v68 + v72 - v73;
    if (!v62) {
      double v74 = v68;
    }
    -[UIImageView setFrame:](self->_logoView, "setFrame:", v74, v70);
  }
}

- (id)contactIssuerHelper
{
  contactIssuerHelper = self->_contactIssuerHelper;
  if (!contactIssuerHelper)
  {
    double v4 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    double v5 = self->_contactIssuerHelper;
    self->_contactIssuerHelper = v4;

    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setDelegate:self];
    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setPass:self->_pass];
    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setFeatureIdentifier:[(PKPaymentPassDetailViewController *)self _accountFeature]];
    objc_initWeak(&location, self);
    if (+[PKBusinessChatController deviceSupportsBusinessChat])
    {
      double v6 = self->_contactIssuerHelper;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__PKPaymentPassDetailViewController_contactIssuerHelper__block_invoke;
      v8[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v9, &location);
      [(PKSecureElementPassContactIssuerHelper *)v6 setOpenBusinessChatHandler:v8];
      objc_destroyWeak(&v9);
    }
    objc_destroyWeak(&location);
    contactIssuerHelper = self->_contactIssuerHelper;
  }

  return contactIssuerHelper;
}

void __56__PKPaymentPassDetailViewController_contactIssuerHelper__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained openBusinessChat];
    id WeakRetained = v2;
  }
}

- (void)presentTransactionDetailsForTransaction:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (self->_peerPaymentAccount) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EC0], 0);
  }
  double v6 = [(PKPaymentPassDetailViewController *)self _transactionDetailViewControllerForTransaction:v8];
  double v7 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];
}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 transactionType] == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    double v6 = [v4 identifier];
    double v7 = [(PKDashboardTransactionFetcher *)transactionFetcher cashbackGroupForTransactionWithIdentifier:v6 cashbackTransactionSourceCollection:0];

    id v8 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v7 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards fetcher:0 transactionHistory:0 detailViewStyle:self->_detailViewStyle];
  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    transactionSourceCollection = self->_transactionSourceCollection;
    familyCollection = self->_familyCollection;
    account = self->_account;
    accountUserCollection = self->_accountUserCollection;
    double v7 = [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController connectedInstitution];
    id v8 = [(PKPaymentTransactionDetailsFactory *)transactionDetailsFactory detailViewControllerForTransaction:v4 transactionSourceCollection:transactionSourceCollection familyCollection:familyCollection account:account accountUserCollection:accountUserCollection bankConnectInstitution:v7 physicalCards:self->_physicalCards];
  }
  double v14 = v8;

  return v14;
}

- (void)presentDailyCashForDateComponents:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke;
  v6[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke_2;
    v6[3] = &unk_1E59CC188;
    void v6[4] = WeakRetained;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 _reloadTransactionsWithCompletion:v6];
  }
}

void __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1264) cashbackGroupForDateComponents:*(void *)(a1 + 40) cashbackTransactionSourceCollection:0];
  if (v6)
  {
    id v2 = [PKTransactionHistoryViewController alloc];
    id v3 = *(void **)(a1 + 32);
    id v4 = [(PKTransactionHistoryViewController *)v2 initWithTransactionGroup:v6 transactionSourceCollection:v3[276] familyCollection:v3[283] account:v3[278] accountUserCollection:v3[265] physicalCards:v3[282] fetcher:0 transactionHistory:0 detailViewStyle:*(void *)(*(void *)(a1 + 48) + 2152)];
    uint64_t v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v4 animated:1];
  }
}

- (void)_updatePassSnapshot
{
  id v3 = [(PKPassHeaderView *)self->_passHeaderView passView];
  id v4 = v3;
  if (self->_rendererState)
  {
    uint64_t v5 = [[PKPassView alloc] initWithPass:self->_pass content:4 suppressedContent:1527 rendererState:self->_rendererState];
    [(PKPassView *)v5 setModallyPresented:1];
    [(PKPassView *)v5 setPaused:1];
    [(PKPassView *)v5 sizeOfFrontFace];
    CGFloat v7 = 52.0 / v6;
    uint64_t v8 = [(PKPassView *)v5 layer];
    CATransform3DMakeScale(&v13, v7, v7, 1.0);
    [v8 setTransform:&v13];

    passSnapshotView = self->_passSnapshotView;
    self->_passSnapshotView = &v5->super;
  }
  else
  {
    double v10 = objc_msgSend(v3, "snapshotOfFrontFaceWithRequestedSize:", 52.0, 33.0);
    double v11 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
    double v12 = self->_passSnapshotView;
    self->_passSnapshotView = v11;

    [(UIView *)self->_passSnapshotView setAccessibilityIgnoresInvertColors:1];
  }
}

- (void)_reloadPassAndView
{
  id v3 = [(PKPassHeaderView *)self->_passHeaderView pass];
  id v6 = v3;
  if (v3 && (v5 = [v3 passType], id v4 = v6, v5 == 1)) {
    [(PKPaymentPassDetailViewController *)self _updatePassPropertiesForPass:v6];
  }
  else {
    [(PKPaymentPassDetailViewController *)self _reloadView];
  }
}

- (void)_loadBankConnectTransactions
{
  id v3 = objc_alloc(MEMORY[0x1E4F26BE0]);
  id v4 = [(PKPaymentPass *)self->_pass primaryAccountIdentifier];
  uint64_t v5 = (FKBankConnectTransactionsAndGroupsProvider *)[v3 initWithPrimaryAccountIdentifier:v4];
  bankConnectTransactionsAndGroupsProvider = self->_bankConnectTransactionsAndGroupsProvider;
  self->_bankConnectTransactionsAndGroupsProvider = v5;

  [(FKBankConnectTransactionsAndGroupsProvider *)self->_bankConnectTransactionsAndGroupsProvider setDelegate:self];
  CGFloat v7 = self->_bankConnectTransactionsAndGroupsProvider;

  [(FKBankConnectTransactionsAndGroupsProvider *)v7 performFetchAndStartObservingNotifications];
}

- (void)_reloadTitle
{
  id v4 = [(PKPaymentPassDetailViewController *)self navigationItem];
  if (self->_detailViewStyle) {
    PKLocalizedPaymentString(&cfstr_Card_0.isa);
  }
  else {
  id v3 = [(PKPaymentPass *)self->_pass localizedDescription];
  }
  [v4 setTitle:v3];
}

- (void)_reloadView
{
  if ([(PKPaymentPassDetailViewController *)self shouldMapSection:39])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__PKPaymentPassDetailViewController__reloadView__block_invoke;
    v3[3] = &unk_1E59CB6D8;
    void v3[4] = self;
    [(PKPaymentPassDetailViewController *)self _reloadTransactionsWithCompletion:v3];
  }
  else
  {
    [(PKPaymentPassDetailViewController *)self reloadData:0];
  }
}

uint64_t __48__PKPaymentPassDetailViewController__reloadView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData:0];
}

- (void)_updateFamilyRows
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembers];
  id v4 = v3;
  if (self->_peerPaymentAccount && self->_familyCollection && [v3 count])
  {
    uint64_t v5 = +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:v4 peerPaymentAccount:self->_peerPaymentAccount];
    sortedFamilyMemberRowModels = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v5;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = self->_sortedFamilyMemberRowModels;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v58;
      v43 = v4;
      v44 = v56;
      do
      {
        uint64_t v10 = 0;
        uint64_t v47 = v8;
        do
        {
          if (*(void *)v58 != v9) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v57 + 1) + 8 * v10);
          double v12 = objc_msgSend(v11, "familyMember", v43, v44);
          CATransform3D v13 = [v11 account];
          double v14 = [v13 altDSID];
          double v15 = v14;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            double v17 = [v11 invitation];
            id v16 = [v17 altDSID];
          }
          double v18 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
          double v19 = [v18 cachedAvatarForAltDSID:v16];

          if (!v19)
          {
            double v20 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
            double v21 = [v11 account];
            [v11 invitation];
            double v23 = v22 = v9;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v56[0] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke;
            v56[1] = &unk_1E59CA910;
            v56[2] = v11;
            v56[3] = self;
            [v20 avatarForFamilyMember:v12 peerPaymentAccount:v21 invitation:v23 completion:v55];

            uint64_t v9 = v22;
            uint64_t v8 = v47;
          }
          [v11 setImage:v19];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v8);
LABEL_30:
      id v4 = v43;
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  account = self->_account;
  if (account)
  {
    BOOL v25 = +[PKAccountUserFamilyMemberRowModel sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:self->_familyCollection account:account accountUserCollection:self->_accountUserCollection invitations:self->_accountUserInvitations];
    double v26 = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v25;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = self->_sortedFamilyMemberRowModels;
    uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v48 = *(void *)v52;
      v43 = v4;
      double v45 = v50;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v52 != v48) {
            objc_enumerationMutation(obj);
          }
          double v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          double v31 = objc_msgSend(v30, "familyMember", v43, v45);
          double v32 = [v30 accountUser];
          BOOL v33 = [v32 altDSID];
          double v34 = v33;
          if (v33)
          {
            id v35 = v33;
          }
          else
          {
            double v36 = [v30 invitation];
            BOOL v37 = [v36 invitationDetails];
            id v35 = [v37 accountUserAltDSID];
          }
          id v38 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
          double v39 = [v38 cachedAvatarForAltDSID:v35];

          if (!v39)
          {
            double v40 = [(PKPaymentPassDetailViewController *)self contactAvatarManager];
            double v41 = [v30 accountUser];
            double v42 = [v30 invitation];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v50[0] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_3;
            v50[1] = &unk_1E59CA910;
            v50[2] = v30;
            v50[3] = self;
            [v40 avatarForFamilyMember:v31 accountUser:v41 invitation:v42 completion:v49];
          }
          [v30 setImage:v39];
        }
        uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v28);
      goto LABEL_30;
    }
LABEL_31:

    [(PKPaymentPassDetailViewController *)self reloadPassDetailSections:&unk_1EF2BA278];
  }
}

void __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);

  return [v2 reloadSection:36];
}

void __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_4;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);

  return [v2 reloadSection:12];
}

- (void)_loadFamilyCollectionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (self->_familyCollection || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke;
    v6[3] = &unk_1E59CAD40;
    void v6[4] = self;
    id v7 = v4;
    [(PKPaymentDataProvider *)paymentServiceDataProvider familyMembersWithCompletion:v6];
  }
}

void __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 2264);
  *(void *)(v3 + 2264) = v2;

  [*(id *)(a1 + 32) _updateFamilyRows];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_loadAdditionalAccountDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  id v6 = [(PKAccount *)self->_account accountIdentifier];
  if (PKStoreDemoModeEnabled() & 1) != 0 || (PKUIOnlyDemoModeEnabled())
  {
    char v7 = 1;
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke;
    v20[3] = &unk_1E59CFB08;
    v20[4] = self;
    [v5 addOperation:v20];
    char v7 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_3;
  v19[3] = &unk_1E59CFB08;
  v19[4] = self;
  [v5 addOperation:v19];
  if ((v7 & 1) == 0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_5;
    void v18[3] = &unk_1E59CFB08;
    v18[4] = self;
    [v5 addOperation:v18];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_7;
  v15[3] = &unk_1E59CE708;
  id v16 = v6;
  double v17 = self;
  id v8 = v6;
  [v5 addOperation:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_10;
  v14[3] = &unk_1E59CFB08;
  void v14[4] = self;
  [v5 addOperation:v14];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_12;
  v12[3] = &unk_1E59CEC00;
  id v13 = v4;
  id v10 = v4;
  id v11 = (id)[v5 evaluateWithInput:v9 completion:v12];
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  void block[4] = v8;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1880) updateWithAccount:*(void *)(*(void *)(a1 + 32) + 2224)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([*(id *)(*(void *)(a1 + 32) + 2224) isSharedAccount])
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_4;
    v9[3] = &unk_1E59CA938;
    v9[4] = v8;
    id v11 = v7;
    id v10 = v6;
    [v8 loadAccountUsersWithCompletion:v9];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadTransactionSourceCollectionIfNecessary];
  [*(id *)(a1 + 32) _updateCashbackPeerPaymentResolutionSection];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_6;
  v11[3] = &unk_1E59CAD68;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 loadPendingAccountUserInvitationsWithCompletion:v11];
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F84270] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_8;
  void v13[3] = &unk_1E59CEBB0;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v6;
  id v15 = v7;
  v13[4] = v9;
  id v11 = v6;
  id v12 = v7;
  [v8 physicalCardsForAccountWithIdentifier:v10 completion:v13];
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_9;
  v5[3] = &unk_1E59CE9B0;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 2256);
  *(void *)(v3 + 2256) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v5();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_11;
  v11[3] = &unk_1E59CA938;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = v8;
  id v9 = v6;
  id v10 = v7;
  [v8 _loadFamilyCollectionIfNecessaryWithCompletion:v11];
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFamilyRows];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_12(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_13;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_reloadTransactionSectionsAnimated:(BOOL)a3 forceReload:(BOOL)a4
{
  if ((a4 || [(PKPaymentPassDetailViewController *)self shouldMapSection:39])
    && self->_hasTabBar)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__PKPaymentPassDetailViewController__reloadTransactionSectionsAnimated_forceReload___block_invoke;
    v7[3] = &unk_1E59DF328;
    BOOL v8 = a4;
    BOOL v9 = a3;
    v7[4] = self;
    [(PKPaymentPassDetailViewController *)self _reloadTransactionsWithCompletion:v7];
  }
}

uint64_t __84__PKPaymentPassDetailViewController__reloadTransactionSectionsAnimated_forceReload___block_invoke(uint64_t result, int a2)
{
  if (*(unsigned char *)(result + 40)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2 == 0;
  }
  if (!v2)
  {
    int v3 = *(unsigned __int8 *)(result + 41);
    id v4 = *(void **)(result + 32);
    if (v3) {
      return [v4 reloadPassDetailSections:&unk_1EF2BA290];
    }
    else {
      return [v4 reloadData:0];
    }
  }
  return result;
}

- (void)_applyStaticPassPropertiesForPass
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [(PKPaymentPass *)self->_pass devicePaymentApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v9 supportsContactlessPayment]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  id v10 = (NSArray *)[v3 copy];
  contactlessPaymentApplications = self->_contactlessPaymentApplications;
  self->_contactlessPaymentApplications = v10;

  id v12 = [(PKPaymentPass *)self->_pass sortedPaymentApplications:self->_contactlessPaymentApplications ascending:1];
  id v13 = self->_contactlessPaymentApplications;
  self->_contactlessPaymentApplications = v12;

  id v14 = [(PKPaymentPass *)self->_pass devicePaymentApplications];
  id v15 = [v14 allObjects];
  devicePaymentApplications = self->_devicePaymentApplications;
  self->_devicePaymentApplications = v15;

  double v17 = [(PKPaymentPass *)self->_pass sortedPaymentApplications:self->_devicePaymentApplications ascending:1];
  double v18 = self->_devicePaymentApplications;
  self->_devicePaymentApplications = v17;

  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  double v20 = [(PKPaymentPass *)self->_pass uniqueID];
  double v21 = [(PKPaymentDataProvider *)paymentServiceDataProvider defaultPaymentApplicationForPassUniqueIdentifier:v20];
  defaultPaymentApplication = self->_defaultPaymentApplication;
  self->_defaultPaymentApplication = v21;

  if (!self->_defaultPaymentApplication)
  {
    double v23 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
    double v24 = self->_defaultPaymentApplication;
    self->_defaultPaymentApplication = v23;
  }
  BOOL v25 = [(PKPaymentPass *)self->_pass storeIdentifiers];
  double v26 = [(PKPaymentPass *)self->_pass appLaunchURL];
  uint64_t v27 = [(PKLinkedApplication *)self->_linkedApplication storeIDs];
  char v28 = PKEqualObjects();

  double v29 = [(PKLinkedApplication *)self->_linkedApplication defaultLaunchURL];
  char v30 = PKEqualObjects();

  if ((v28 & 1) == 0) {
    [(PKLinkedApplication *)self->_linkedApplication setStoreIDs:v25];
  }
  if ((v30 & 1) == 0) {
    [(PKLinkedApplication *)self->_linkedApplication setDefaultLaunchURL:v26];
  }
  [(PKPaymentPassDetailViewController *)self _reloadTitle];
}

- (void)_applyIvarsFromCollectedPropertiesViewModel:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 pass];
  pass = self->_pass;
  self->_pass = v5;

  [(PKPaymentPassDetailViewController *)self _applyStaticPassPropertiesForPass];
  uint64_t v7 = [v4 transitBalanceModel];
  uint64_t v35 = 1752;
  transitBalanceModel = self->_transitBalanceModel;
  self->_transitBalanceModel = v7;

  BOOL v9 = [v4 balances];
  balances = self->_balances;
  self->_balances = v9;

  id v11 = [v4 actionForBalanceIdentifier];
  actionForBalanceIdentifier = self->_actionForBalanceIdentifier;
  self->_actionForBalanceIdentifier = v11;

  id v13 = [v4 transitPropertiesBalanceReminder];
  transitPropertiesBalanceReminder = self->_transitPropertiesBalanceReminder;
  self->_transitPropertiesBalanceReminder = v13;

  id v15 = [v4 reminderForBalanceIdentifier];
  id v16 = (NSMutableDictionary *)[v15 mutableCopy];
  reminderForBalanceIdentifier = self->_reminderForBalanceIdentifier;
  self->_reminderForBalanceIdentifier = v16;

  double v18 = [v4 transitPassProperties];
  transitProperties = self->_transitProperties;
  self->_transitProperties = v18;

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v22 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableCommutePlans];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v22);
        }
        double v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v27 = objc_msgSend(v26, "title", v35);
        if (v27)
        {
          [v21 addObject:v26];
          [v20 addObject:v27];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v23);
  }

  char v28 = (NSArray *)[v20 copy];
  commutePlanFields = self->_commutePlanFields;
  self->_commutePlanFields = v28;

  char v30 = (NSArray *)[v21 copy];
  commutePlans = self->_commutePlans;
  self->_commutePlans = v30;

  [(PKPaymentPassDetailViewController *)self _ingestPassFields];
  [(PKPaymentPassDetailViewController *)self _updateExpressPassInformation];
  if (self->_expressPassesInformationToken == -1
    && [(PKPaymentPassDetailViewController *)self _showExpressDetails])
  {
    objc_initWeak(&location, self);
    long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:self selector:sel__expressPassDidChange name:@"PKExpressPassesViewControllerExpressPassChangedNotification" object:0];
    long long v33 = (const char *)[(id)*MEMORY[0x1E4F87160] UTF8String];
    id v34 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __81__PKPaymentPassDetailViewController__applyIvarsFromCollectedPropertiesViewModel___block_invoke;
    handler[3] = &unk_1E59CBA90;
    objc_copyWeak(&v38, &location);
    notify_register_dispatch(v33, &self->_expressPassesInformationToken, MEMORY[0x1E4F14428], handler);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  [(PKPaymentPassDetailViewController *)self _updateDisplayableBalances];
  [(PKPaymentPassDetailPassActionSectionController *)self->_passActionSectionController setTransitBalanceModel:*(Class *)((char *)&self->super.super.super.super.super.isa + v36)];
  [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController updatePass:self->_pass];
  [(PKPassDetailAccountCredentialsSectionController *)self->_accountCredentialsSectionController updatePass:self->_pass];
  [(PKPaymentPassDetailViewController *)self reloadData:0];
}

void __81__PKPaymentPassDetailViewController__applyIvarsFromCollectedPropertiesViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expressPassDidChange];
}

- (void)_updatePassPropertiesForPass:(id)a3
{
}

- (void)_updatePassPropertiesForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke;
  v10[3] = &unk_1E59DF378;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(PKPaymentPassDetailViewController *)self _refreshStaleBalanceModelForPass:v8 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke_2;
    void v13[3] = &unk_1E59DF350;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    id v14 = *(id *)(a1 + 40);
    [WeakRetained _updateDisplayableBalancesPlansAndTransitPropertiesForPass:v11 balances:v7 plans:v8 transitProperties:v9 withCompletion:v13];

    objc_destroyWeak(&v15);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _applyIvarsFromCollectedPropertiesViewModel:v6];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)_expressPassDidChange
{
  id v7 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:self->_pass];
  int v3 = [v7 isNFCExpressEnabled];
  int v4 = v3;
  int nfcExpressModeEnabled = self->_nfcExpressModeEnabled;
  if (nfcExpressModeEnabled != v3) {
    self->_int nfcExpressModeEnabled = v3;
  }
  int v6 = [v7 isUWBExpressEnabled];
  if (self->_uwbExpressModeEnabled != v6)
  {
    self->_uwbExpressModeEnabled = v6;
    goto LABEL_7;
  }
  if (nfcExpressModeEnabled != v4) {
LABEL_7:
  }
    [(PKPaymentPassDetailViewController *)self reloadSection:33];
}

- (void)_updateExpressPassInformation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((PKIsPad() & 1) == 0)
  {
    int v3 = self->_pass;
    int v4 = [(PKExpressPassController *)self->_expressPassController isExpressModeSupportedForPass:v3];
    if (v4)
    {
      if ([(PKPaymentPass *)v3 isHomeKeyPass])
      {
        unint64_t v5 = self->_radioTechnologyType & 1;
        unint64_t v6 = (self->_radioTechnologyType >> 1) & 1;
      }
      else if ([(PKPaymentPass *)v3 isCarKeyPass])
      {
        unint64_t v6 = (self->_radioTechnologyType & 2) >> 1;
        LOBYTE(v5) = (self->_radioTechnologyType & 2) == 0;
      }
      else
      {
        LOBYTE(v6) = 0;
        LOBYTE(v5) = 1;
      }
      id v7 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:self->_pass];
      self->_nfcExpressModeSupported = v5;
      self->_BOOL nfcExpressModeEnabled = [v7 isNFCExpressEnabled];
      self->_BOOL uwbExpressModeSupported = v6 & 1;
      self->_BOOL uwbExpressModeEnabled = [v7 isUWBExpressEnabled];
    }
    else
    {
      self->_nfcExpressModeSupported = [(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:self->_pass];
      self->_BOOL nfcExpressModeEnabled = 0;
      self->_BOOL uwbExpressModeSupported = 0;
      self->_BOOL uwbExpressModeEnabled = 0;
    }
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v3;
      if (self->_isCredentialedPass) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      uint64_t v10 = PKRadioTechnologiesToString();
      BOOL nfcExpressModeEnabled = self->_nfcExpressModeEnabled;
      BOOL uwbExpressModeSupported = self->_uwbExpressModeSupported;
      BOOL uwbExpressModeEnabled = self->_uwbExpressModeEnabled;
      if (v4) {
        id v14 = @"YES";
      }
      else {
        id v14 = @"NO";
      }
      if (self->_nfcExpressModeSupported) {
        id v15 = @"YES";
      }
      else {
        id v15 = @"NO";
      }
      *(_DWORD *)buf = 138413826;
      if (nfcExpressModeEnabled) {
        id v16 = @"YES";
      }
      else {
        id v16 = @"NO";
      }
      uint64_t v22 = v9;
      int v3 = v20;
      if (uwbExpressModeSupported) {
        double v17 = @"YES";
      }
      else {
        double v17 = @"NO";
      }
      __int16 v23 = 2112;
      if (uwbExpressModeEnabled) {
        double v18 = @"YES";
      }
      else {
        double v18 = @"NO";
      }
      uint64_t v24 = v10;
      double v19 = (void *)v10;
      __int16 v25 = 2112;
      double v26 = v14;
      __int16 v27 = 2112;
      char v28 = v15;
      __int16 v29 = 2112;
      char v30 = v16;
      __int16 v31 = 2112;
      long long v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: Updated for express info (credentialed: %@, radio technology supported: %@, express supported: %@, nfc supported: %@, nfc enabled: %@, uwb supported: %@, uwb enabled: %@)", buf, 0x48u);
    }
  }
}

- (void)_ingestPassFields
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(PKTransitBalanceModel *)self->_transitBalanceModel balanceFields];
  unint64_t v5 = (NSArray *)[v4 copy];
  balanceFields = self->_balanceFields;
  uint64_t v20 = 1360;
  self->_balanceFields = v5;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = self;
  id obj = [(PKPaymentPass *)self->_pass backFieldBuckets];
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              double v17 = objc_msgSend(v16, "key", v20);
              if ([v17 hasPrefix:@"balance_identifier_field_"]) {
                [v3 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v13);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  if (![*(id *)((char *)&v21->super.super.super.super.super.isa + v20) count])
  {
    uint64_t v18 = [v3 copy];
    double v19 = *(Class *)((char *)&v21->super.super.super.super.super.isa + v20);
    *(Class *)((char *)&v21->super.super.super.super.super.isa + v20) = (Class)v18;
  }
}

- (void)_updateDisplayableBalances
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = self;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_balanceFields;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v7 foreignReferenceType] == 1 || objc_msgSend(v7, "foreignReferenceType") == 2)
        {
          uint64_t v8 = [v7 foreignReferenceIdentifiers];
          if (v8)
          {
            id v9 = [(NSDictionary *)v27->_balances objectForKeyedSubscript:v8];
            uint64_t v10 = [v9 localizedTitle];
            id v11 = v10;
            if (v10)
            {
              id v12 = v10;
            }
            else
            {
              uint64_t v13 = [v7 label];
              uint64_t v14 = v13;
              if (v13)
              {
                id v15 = v13;
              }
              else
              {
                PKLocalizedPaymentString(&cfstr_PassDetailsDef.isa);
                id v15 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v12 = v15;
            }
            if (v9)
            {
              id v16 = [v9 formattedValue];
            }
            else
            {
              id v16 = 0;
            }
            double v17 = [v7 label];
            char v18 = PKEqualObjects();

            if ((v18 & 1) == 0) {
              [v7 setLabel:v12];
            }
            double v19 = [v7 value];
            char v20 = PKEqualObjects();

            if ((v20 & 1) == 0)
            {
              [v7 setUnformattedValue:v16];
              [v7 flushCachedValue];
            }
            uint64_t v21 = [v7 label];
            if (v21)
            {
              uint64_t v22 = (void *)v21;
              uint64_t v23 = [v7 value];

              if (v23) {
                [v26 addObject:v7];
              }
            }
          }
        }
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v4);
  }

  uint64_t v24 = [v26 copy];
  displayableBalanceFields = v27->_displayableBalanceFields;
  v27->_displayableBalanceFields = (NSArray *)v24;
}

- (void)_updateDisplayableBalancesPlansAndTransitPropertiesForPass:(id)a3 balances:(id)a4 plans:(id)a5 transitProperties:(id)a6 withCompletion:(id)a7
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v67 = a6;
  id v63 = a7;
  double v65 = self;
  transitBalanceModel = self->_transitBalanceModel;
  if (transitBalanceModel) {
    id v16 = transitBalanceModel;
  }
  else {
    id v16 = (PKTransitBalanceModel *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v12];
  }
  double v17 = v16;
  [(PKTransitBalanceModel *)v16 setTransitProperties:v67];
  [(PKTransitBalanceModel *)v17 updateWithDynamicBalances:v13];
  double v68 = v17;
  double v66 = v14;
  [(PKTransitBalanceModel *)v17 updateWithDynamicCommutePlans:v14];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v100 objects:v108 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v101 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        long long v25 = [v24 identifiers];
        if (v25) {
          [v18 setObject:v24 forKeyedSubscript:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v100 objects:v108 count:16];
    }
    while (v21);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v26 = [(PKTransitBalanceModel *)v68 displayableBalances];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v96 objects:v107 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v97 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        long long v32 = [v31 identifiers];
        if (v32) {
          [v18 setObject:v31 forKeyedSubscript:v32];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v96 objects:v107 count:16];
    }
    while (v28);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  __int16 v33 = [(PKTransitBalanceModel *)v68 displayableCommutePlanBalances];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v92 objects:v106 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v93;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v93 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v92 + 1) + 8 * k);
        double v39 = [v38 identifiers];
        if (v39) {
          [v18 setObject:v38 forKeyedSubscript:v39];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v92 objects:v106 count:16];
    }
    while (v35);
  }

  double v64 = v18;
  int v62 = (void *)[v18 copy];
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v19;
  uint64_t v72 = [obj countByEnumeratingWithState:&v88 objects:v105 count:16];
  if (v72)
  {
    uint64_t v70 = *(void *)v89;
    double v74 = (void *)*MEMORY[0x1E4F87980];
    id v71 = v12;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v89 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v40;
        long long v41 = [*(id *)(*((void *)&v88 + 1) + 8 * v40) identifiers];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v76 = [v12 availableActions];
        uint64_t v42 = [v76 countByEnumeratingWithState:&v84 objects:v104 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v85;
          do
          {
            for (uint64_t m = 0; m != v43; ++m)
            {
              if (*(void *)v85 != v44) {
                objc_enumerationMutation(v76);
              }
              double v46 = *(void **)(*((void *)&v84 + 1) + 8 * m);
              uint64_t v47 = [v46 associatedEnteredValueIdentifier];
              uint64_t v48 = (void *)[v47 copy];
              double v49 = v48;
              if (v48)
              {
                id v50 = v48;
              }
              else
              {
                long long v51 = [v46 relevantPropertyIdentifier];
                uint64_t v52 = [v51 copy];
                long long v53 = (void *)v52;
                long long v54 = v74;
                if (v52) {
                  long long v54 = (void *)v52;
                }
                id v50 = v54;
              }
              if ([v41 containsObject:v50]) {
                [v75 setObject:v46 forKeyedSubscript:v41];
              }
            }
            uint64_t v43 = [v76 countByEnumeratingWithState:&v84 objects:v104 count:16];
          }
          while (v43);
        }

        uint64_t v40 = v73 + 1;
        id v12 = v71;
      }
      while (v73 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v88 objects:v105 count:16];
    }
    while (v72);
  }

  v55 = (void *)[v75 copy];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __144__PKPaymentPassDetailViewController__updateDisplayableBalancesPlansAndTransitPropertiesForPass_balances_plans_transitProperties_withCompletion___block_invoke;
  v77[3] = &unk_1E59DF3A0;
  id v78 = v12;
  id v79 = v67;
  uint64_t v80 = v68;
  id v81 = v62;
  id v82 = v55;
  id v83 = v63;
  id v56 = v55;
  id v57 = v62;
  long long v58 = v68;
  id v59 = v67;
  id v60 = v12;
  id v61 = v63;
  [(PKPaymentPassDetailViewController *)v65 _fetchBalanceRemindersWithActionForBalanceIdentifier:v75 transitProperties:v59 balances:v57 pass:v60 withCompletion:v77];
}

void __144__PKPaymentPassDetailViewController__updateDisplayableBalancesPlansAndTransitPropertiesForPass_balances_plans_transitProperties_withCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  if (a1[9])
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = [[PKPaymentPassDetailCollectedProperties alloc] initWithPass:a1[4] transitPassProperties:a1[5] transitBalanceModel:a1[6] balances:a1[7] actionForBalanceIdentifier:a1[8] transitPropertiesBalanceReminder:v6 reminderForBalanceIdentifier:v5];

    (*(void (**)(void))(a1[9] + 16))();
  }
}

- (void)_refreshDisplayWithBalances:(id)a3 plans:(id)a4 transitProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_pass;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __89__PKPaymentPassDetailViewController__refreshDisplayWithBalances_plans_transitProperties___block_invoke;
  v12[3] = &unk_1E59DF3C8;
  objc_copyWeak(&v13, &location);
  [(PKPaymentPassDetailViewController *)self _updateDisplayableBalancesPlansAndTransitPropertiesForPass:v11 balances:v8 plans:v9 transitProperties:v10 withCompletion:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __89__PKPaymentPassDetailViewController__refreshDisplayWithBalances_plans_transitProperties___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _applyIvarsFromCollectedPropertiesViewModel:v5];
  }
}

- (void)_handleUpdatedBalanceReminder:(id)a3 forBalanceWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_reminderForBalanceIdentifier objectForKey:v8];

    if (v9)
    {
      reminderForBalanceIdentifier = self->_reminderForBalanceIdentifier;
      if (v7) {
        [(NSMutableDictionary *)reminderForBalanceIdentifier setObject:v7 forKeyedSubscript:v8];
      }
      else {
        [(NSMutableDictionary *)reminderForBalanceIdentifier removeObjectForKey:v8];
      }
      goto LABEL_10;
    }
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v12 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Received unknown balance reminder update.", v12, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!self->_transitProperties)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v12 = (uint8_t *)&v13;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_transitPropertiesBalanceReminder, a3);
LABEL_10:
  [(PKPaymentPassDetailViewController *)self reloadSection:30];
LABEL_15:
}

- (void)_fetchBalanceRemindersWithActionForBalanceIdentifier:(id)a3 transitProperties:(id)a4 balances:(id)a5 pass:(id)a6 withCompletion:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v30 = a5;
  id v29 = a6;
  id v12 = a7;
  if (v12)
  {
    id v25 = v12;
    __int16 v13 = dispatch_group_create();
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x3032000000;
    double v49 = __Block_byref_object_copy__65;
    id v50 = __Block_byref_object_dispose__65;
    id v51 = 0;
    if (objc_opt_respondsToSelector())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      __int16 v14 = [v27 allKeys];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v43 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            id v19 = [v30 objectForKeyedSubscript:v18];
            if (v18)
            {
              dispatch_group_enter(v13);
              paymentServiceDataProvider = self->_paymentServiceDataProvider;
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke;
              v38[3] = &unk_1E59DF3F0;
              uint64_t v21 = self;
              id v22 = v19;
              id v39 = v22;
              id v40 = v28;
              long long v41 = v13;
              id v23 = v22;
              self = v21;
              [(PKPaymentDataProvider *)paymentServiceDataProvider balanceReminderThresholdForBalance:v23 pass:v29 withCompletion:v38];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v15);
      }

      if (v26)
      {
        dispatch_group_enter(v13);
        uint64_t v24 = self->_paymentServiceDataProvider;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_3;
        v35[3] = &unk_1E59DF418;
        BOOL v37 = &v46;
        uint64_t v36 = v13;
        [(PKPaymentDataProvider *)v24 balanceReminderThresholdForBalance:0 pass:v29 withCompletion:v35];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_5;
      block[3] = &unk_1E59D8E98;
      id v33 = v25;
      uint64_t v34 = &v46;
      id v32 = v28;
      dispatch_group_notify(v13, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, uint64_t, id))v25 + 2))(v25, v47[5], v28);
    }
    _Block_object_dispose(&v46, 8);

    id v12 = v25;
  }
}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] identifiers];
  id v5 = [v4 anyObject];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_2;
  v8[3] = &unk_1E59CB8B0;
  id v9 = v3;
  id v10 = v5;
  id v11 = a1[5];
  id v12 = a1[6];
  id v6 = v5;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
  }
  BOOL v2 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v2);
}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_4;
  block[3] = &unk_1E59DD778;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_4(void *a1)
{
  BOOL v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v2);
  }
  id v3 = a1[5];

  dispatch_group_leave(v3);
}

uint64_t __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (unint64_t)_accountFeature
{
  unint64_t result = [(PKAccount *)self->_account feature];
  if (!result)
  {
    pass = self->_pass;
    return [(PKPaymentPass *)pass associatedAccountFeatureIdentifier];
  }
  return result;
}

- (void)_fetchMerchantTokens
{
  if ([(PKPaymentPass *)self->_pass hasMerchantTokens])
  {
    if (!self->_merchantTokensResponse)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F84F40]);
      [v3 setPass:self->_pass];
      objc_initWeak(&location, self);
      webService = self->_webService;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke;
      v5[3] = &unk_1E59DC0F0;
      objc_copyWeak(&v6, &location);
      [(PKPaymentWebService *)webService retrieveMerchantTokensWithRequest:v3 completion:v5];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      id v5 = (id *)(WeakRetained + 2008);
      if (!v3[251])
      {
        id v6 = v3;
        objc_storeStrong(v5, v4);
        [v6 _reloadMerchantTokenRows];
        id v3 = v6;
      }
    }
  }
}

- (void)_reloadMerchantTokenRows
{
  [(PKDynamicTableViewController *)self reloadRow:0 inSectionWithSectionIdentifier:@"MerchantTokens"];
  [(PKDynamicTableViewController *)self reloadRow:0 inSectionWithSectionIdentifier:@"AccountServiceMerchantTokens"];

  [(PKDynamicTableViewController *)self reloadRow:0 inSectionWithSectionIdentifier:@"PeerPaymentMerchantTokens"];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  tabBar = self->_tabBar;
  if (tabBar) {
    uint64_t v6 = [(UISegmentedControl *)tabBar selectedSegmentIndex];
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(PKPaymentPass *)self->_pass activationState]) {
    int v7 = [(PKPaymentPass *)self->_pass isShellPass];
  }
  else {
    int v7 = 1;
  }
  switch(a3)
  {
    case 0uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowActionWidgets];
    case 1uLL:
      if (v6) {
        goto LABEL_330;
      }
      id v10 = [(PKPaymentPass *)self->_pass storeIdentifiers];
      uint64_t v11 = [v10 count];
      goto LABEL_267;
    case 2uLL:
      if (v6 || !self->_peerPaymentAccount || !self->_peerPaymentAccountResolutionController) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowAccountActions];
    case 3uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowAccessPersonInformation];
    case 4uLL:
      if (v6 || ![(PKPaymentPass *)self->_pass isAccessPass]) {
        goto LABEL_330;
      }
      id v12 = [(PKPaymentPass *)self->_pass cardHolderPicture];
      if (!v12) {
        goto LABEL_187;
      }
      LODWORD(v13) = ![(PKConfigurablePassDetailSectionsController *)self->_configurableSectionController hasArbitraryInfoField:*MEMORY[0x1E4F874F0]];
      goto LABEL_188;
    case 5uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowIdentityDocumentSection];
    case 6uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowReplaceBiometricSection];
    case 7uLL:
      if (v6) {
        goto LABEL_330;
      }
      __int16 v14 = [(PKPaymentPass *)self->_pass barcode];
      goto LABEL_89;
    case 8uLL:
      if (v6) {
        int v15 = 0;
      }
      else {
        int v15 = v7;
      }
      if (v15 != 1) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowAutomaticPresentation];
    case 9uLL:
      if (v6) {
        goto LABEL_330;
      }
      pass = self->_pass;
      return [(PKPaymentPass *)pass isCarKeyPass];
    case 0xAuLL:
      if (([(PKPaymentPass *)self->_pass isAccessPass] & 1) != 0 || self->_isCredentialedPass) {
        BOOL v17 = self->_nfcExpressModeSupported || self->_uwbExpressModeSupported;
      }
      else {
        BOOL v17 = 0;
      }
      if (v6) {
        int v59 = 0;
      }
      else {
        int v59 = v7;
      }
      if (v59 != 1 || (PKRunningInViewService() & 1) != 0) {
        goto LABEL_330;
      }
      LODWORD(v13) = v17 & (PKRunningInLockScreenPlugin() ^ 1);
      return (char)v13;
    case 0xBuLL:
      if (v6) {
        goto LABEL_330;
      }
      id v12 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
      if (![v12 length]
        || [(PKPaymentPassDetailViewController *)self _shouldShowServicingSection])
      {
        goto LABEL_187;
      }
      LOBYTE(v13) = [(PKPaymentPassDetailViewController *)self _accountFeature] != 4;
      goto LABEL_188;
    case 0xCuLL:
      if (v6 || ![(PKPaymentPassDetailViewController *)self _shouldShowServicingSection]) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowAccountUsersSection];
    case 0xDuLL:
      if (v6) {
        goto LABEL_330;
      }
      id v12 = [(PKAccount *)self->_account creditDetails];
      uint64_t v18 = [v12 installmentPlans];
      LOBYTE(v13) = [v18 count]
                 && [(PKPaymentPassDetailViewController *)self _shouldShowServicingSection]&& ([(PKAccount *)self->_account blockAllAccountAccess] & 1) == 0&& [(PKAccount *)self->_account state] != 3;
      goto LABEL_69;
    case 0xEuLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowCardNumbersSection];
    case 0xFuLL:
      if (v6) {
        goto LABEL_330;
      }
      account = self->_account;
      if (!account) {
        goto LABEL_330;
      }
      id v12 = [(PKAccount *)account creditDetails];
      if (!v12 || ![(PKAccount *)self->_account supportsShowAccountSummary]) {
        goto LABEL_187;
      }
      goto LABEL_84;
    case 0x10uLL:
      if (v6) {
        goto LABEL_330;
      }
      uint64_t v20 = self->_account;
      if (!v20) {
        goto LABEL_330;
      }
      id v12 = [(PKAccount *)v20 creditDetails];
      if (!v12
        || ![(PKAccount *)self->_account supportsShowAccountSummary]
        || ![(PKPaymentPassDetailViewController *)self _shouldShowServicingSection])
      {
        goto LABEL_187;
      }
LABEL_84:
      BOOL v21 = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account];
      goto LABEL_117;
    case 0x11uLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass hasMerchantTokens] & 1) == 0
        && ![(PKPaymentPass *)self->_pass hadMerchantTokens])
      {
        goto LABEL_330;
      }
      __int16 v14 = [(PKAccount *)self->_account creditDetails];
LABEL_89:
      LOBYTE(v13) = v14 != 0;
      goto LABEL_350;
    case 0x12uLL:
      if (v6
        || !self->_account
        || ![(PKPaymentPassDetailViewController *)self _shouldShowProductBenefitsCell])
      {
        goto LABEL_330;
      }
      goto LABEL_253;
    case 0x13uLL:
      if (v6
        || ![(PKPaymentPassDetailViewController *)self _accountInGoodStateForAMPEligbilityCheck])
      {
        goto LABEL_330;
      }
      BOOL v8 = !self->_isAmpEligible;
      goto LABEL_97;
    case 0x14uLL:
      if (v6) {
        goto LABEL_330;
      }
      id v22 = self->_account;
      if (!v22
        || ![(PKAccount *)v22 supportsRedeemRewards]
        || !self->_allowStatementCreditRedemption && !self->_cashbackResolution)
      {
        goto LABEL_330;
      }
      if (!+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account]|| ![(PKPaymentPassDetailViewController *)self _shouldShowServicingSection])
      {
        goto LABEL_330;
      }
      if ([(PKAccount *)self->_account accessLevel] != 2 || self->_peerPaymentAccount) {
        goto LABEL_275;
      }
      id v10 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
      LOBYTE(v13) = [v10 memberType] == 0;
      goto LABEL_291;
    case 0x15uLL:
      if (v6) {
        goto LABEL_330;
      }
      id v23 = self->_account;
      if (!v23) {
        goto LABEL_330;
      }
      id v12 = [(PKAccount *)v23 creditDetails];
      if (!v12
        || !self->_physicalCardController
        || [(PKPaymentPassDetailViewController *)self _numberOfAccountServicePhysicalCardRowsEnabled] < 1|| !+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account])
      {
        goto LABEL_187;
      }
      BOOL v21 = [(PKPaymentPassDetailViewController *)self _shouldShowServicingSection];
LABEL_117:
      LOBYTE(v13) = v21;
      goto LABEL_188;
    case 0x16uLL:
      __int16 v13 = [(PKPaymentPassDetailViewController *)self traitCollection];
      uint64_t v24 = [v13 userInterfaceIdiom];

      LOBYTE(v13) = 0;
      if (v24 & 0xFFFFFFFFFFFFFFFBLL) != 0 || v6 || ((v7 ^ 1)) {
        return (char)v13;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![(PKPaymentDataProvider *)self->_paymentServiceDataProvider supportsMessagesForPass:self->_pass])
      {
        goto LABEL_330;
      }
      id v12 = [(PKPaymentPass *)self->_pass messageServiceURL];
      if (!v12) {
        goto LABEL_187;
      }
      id v25 = [(PKPaymentPass *)self->_pass messagePushTopic];
      LOBYTE(v13) = v25 != 0;

      goto LABEL_188;
    case 0x17uLL:
      id v26 = [(PKTransitPassProperties *)self->_transitProperties felicaProperties];
      id v10 = v26;
      if (v26) {
        BOOL v27 = v6 == 0;
      }
      else {
        BOOL v27 = 0;
      }
      if (v27) {
        LOBYTE(v13) = [v26 hasGreenCarTicket];
      }
      else {
        LOBYTE(v13) = 0;
      }
      goto LABEL_291;
    case 0x18uLL:
    case 0x1BuLL:
      if (v6) {
        goto LABEL_330;
      }
      BOOL v8 = self->_peerPaymentAccount == 0;
LABEL_97:
      if (v8) {
        LOBYTE(v13) = 0;
      }
      else {
        LOBYTE(v13) = v7;
      }
      return (char)v13;
    case 0x19uLL:
      if (v6) {
        goto LABEL_330;
      }
      int v28 = self->_peerPaymentAccount ? v7 : 0;
      if (v28 != 1) {
        goto LABEL_330;
      }
      BOOL v29 = self->_detailViewStyle == 2;
      goto LABEL_167;
    case 0x1AuLL:
      if (v6) {
        goto LABEL_330;
      }
      peerPaymentAccount = self->_peerPaymentAccount;
      if (!peerPaymentAccount) {
        goto LABEL_330;
      }
      if (self->_loadingPeerPaymentPreferences)
      {
        if (!v7)
        {
LABEL_330:
          LOBYTE(v13) = 0;
          return (char)v13;
        }
      }
      else
      {
        if (self->_peerPaymentPreferences) {
          char v62 = v7;
        }
        else {
          char v62 = 0;
        }
        if ((v62 & 1) == 0) {
          goto LABEL_330;
        }
      }
      if ([(PKPeerPaymentAccount *)peerPaymentAccount state] == 3) {
        goto LABEL_330;
      }
      BOOL v29 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 4;
LABEL_167:
      LOBYTE(v13) = !v29;
      return (char)v13;
    case 0x1CuLL:
      if (v6) {
        int v31 = 0;
      }
      else {
        int v31 = v7;
      }
      if (v31 != 1
        || [(PKPaymentPass *)self->_pass contactlessActivationGroupingType] != 2)
      {
        goto LABEL_330;
      }
      id v32 = self->_pass;
      return [(PKPaymentPass *)v32 hasContactlessDevicePaymentApplicationsAvailable];
    case 0x1DuLL:
      if (v6
        || ![(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface]
        && v7 == 1
        || !self->_detailViewStyle)
      {
        goto LABEL_330;
      }
      __int16 v13 = self->_pass;
      id v10 = [(PKPaymentWebService *)self->_webService targetDevice];
      id v33 = [v10 secureElementIdentifiers];
      LODWORD(v13) = [v13 isPrecursorPass:v33] ^ 1;

      goto LABEL_291;
    case 0x1EuLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass isStoredValuePass] & 1) == 0
        && ![(PKPaymentPass *)self->_pass isAccessPass]
        || [(PKPaymentPass *)self->_pass activationState])
      {
        goto LABEL_330;
      }
      if ([(NSArray *)self->_displayableBalanceFields count]) {
        goto LABEL_275;
      }
      unint64_t v34 = [(NSArray *)self->_commutePlanFields count];
LABEL_162:
      BOOL v29 = v34 == 0;
      goto LABEL_167;
    case 0x1FuLL:
      if (v6) {
        goto LABEL_330;
      }
      unint64_t v34 = [(PKPaymentPassDetailViewController *)self _contactBankCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_162;
    case 0x20uLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass hasMerchantTokens] & 1) == 0
        && ![(PKPaymentPass *)self->_pass hadMerchantTokens])
      {
        goto LABEL_330;
      }
      BOOL v29 = self->_peerPaymentAccount == 0;
      goto LABEL_167;
    case 0x21uLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass isAccessPass] & 1) != 0
        || self->_isCredentialedPass
        || ![(PKPaymentPassDetailViewController *)self _cardInfoSectionGenerateCellWithOutput:0 forRowIndex:0 tableView:0])
      {
        goto LABEL_330;
      }
      if (!self->_account) {
        goto LABEL_275;
      }
      goto LABEL_235;
    case 0x22uLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass isTransitPass] & 1) != 0
        || ([(PKPaymentPass *)self->_pass isAccessPass] & 1) != 0
        || ([(PKPaymentPass *)self->_pass isIdentityPass] & 1) != 0
        || ([(PKPaymentPass *)self->_pass supportsBarcodePayment] & 1) != 0
        || ([(PKPaymentPass *)self->_pass isEMoneyPass] & 1) != 0
        || self->_isCredentialedPass
        || self->_peerPaymentAccount)
      {
        goto LABEL_330;
      }
      id v12 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
      if (v12 && self->_detailViewStyle != 2
        || [(PKPaymentPassDetailViewController *)self _accountFeature] == 4)
      {
LABEL_187:
        LOBYTE(v13) = 0;
      }
      else
      {
        uint64_t v18 = [(PKPaymentPass *)self->_pass deviceAccountNumberSuffix];
        if ([v18 length])
        {
          LODWORD(v13) = ![(PKPaymentPassDetailViewController *)self _shouldShowCardNumbersSection];
        }
        else
        {
          double v64 = [(PKPaymentPass *)self->_pass sanitizedDeviceAccountNumber];
          if ([v64 length]) {
            LODWORD(v13) = ![(PKPaymentPassDetailViewController *)self _shouldShowCardNumbersSection];
          }
          else {
            LOBYTE(v13) = 0;
          }
        }
LABEL_69:
      }
LABEL_188:

      return (char)v13;
    case 0x23uLL:
      if (v6
        || ([(PKPaymentPass *)self->_pass hasMerchantTokens] & 1) == 0
        && ![(PKPaymentPass *)self->_pass hadMerchantTokens])
      {
        goto LABEL_330;
      }
      __int16 v14 = [(PKAccount *)self->_account creditDetails];
      if (v14) {
        LOBYTE(v13) = 0;
      }
      else {
        LOBYTE(v13) = self->_peerPaymentAccount == 0;
      }
LABEL_350:

      return (char)v13;
    case 0x24uLL:
      uint64_t v35 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      uint64_t v36 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount altDSID];
      BOOL v37 = [v35 objectForKey:v36];

      if ([v37 isOrganizer]) {
        char v38 = 1;
      }
      else {
        char v38 = [v37 isParent];
      }
      uint64_t v68 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];
      int v67 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing];
      int64_t detailViewStyle = self->_detailViewStyle;
      if (detailViewStyle != 2)
      {
        char v51 = 1;
        goto LABEL_336;
      }
      double v66 = v37;
      char v65 = v38;
      if (objc_opt_respondsToSelector())
      {
        double v49 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider deviceVersion];
      }
      else
      {
        double v49 = 0;
      }
      v55 = [MEMORY[0x1E4F84E00] sharedInstance];
      id v56 = [v55 account];
      id v57 = [v56 supportsFamilySharingFeatureDescriptor];
      long long v58 = [v57 osVersionRange];

      if (v49)
      {
        if (!v58 && (PKPeerPaymentSkipFamilySharingVersionCheck() & 1) == 0)
        {
          id v63 = PKLogFacilityTypeGetObject();
          BOOL v37 = v66;
          char v38 = v65;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v63, OS_LOG_TYPE_DEFAULT, "The server has not populated the minimum version requirement for familySharing. Assuming that the targetDevice is the correct version", buf, 2u);
          }

          char v51 = 1;
LABEL_335:

LABEL_336:
          if (v6)
          {
            LOBYTE(v13) = 0;
          }
          else
          {
            NSUInteger v60 = [(NSArray *)self->_sortedFamilyMemberRowModels count];
            LOBYTE(v13) = 0;
            if (detailViewStyle)
            {
              if (v60)
              {
                LOBYTE(v13) = 0;
                if (self->_peerPaymentAccount)
                {
                  if (((v7 ^ 1) & 1) == 0 && !v68 && ((v67 ^ 1) & 1) == 0)
                  {
                    if (self->_familyCollection) {
                      char v61 = v38;
                    }
                    else {
                      char v61 = 0;
                    }
                    LOBYTE(v13) = v61 & v51;
                  }
                }
              }
            }
          }

          return (char)v13;
        }
        char v51 = [v58 versionMeetsRequirements:v49 deviceClass:@"Watch"];
      }
      else
      {
        char v51 = 0;
      }
      BOOL v37 = v66;
      char v38 = v65;
      goto LABEL_335;
    case 0x25uLL:
      if (v6 == self->_hasTabBar) {
        int v39 = v7;
      }
      else {
        int v39 = 0;
      }
      if (v39 != 1
        || !self->_allContentIsLoaded
        || (objc_opt_respondsToSelector() & 1) == 0
        || ![(PKPaymentDataProvider *)self->_paymentServiceDataProvider supportsTransactionsForPass:self->_pass]|| !self->_detailViewStyle)
      {
        goto LABEL_330;
      }
      if (self->_peerPaymentAccount
        || ([(PKPaymentPass *)self->_pass supportsDPANNotifications] & 1) != 0
        || ([(PKPaymentPass *)self->_pass supportsFPANNotifications] & 1) != 0
        || ([(PKPaymentApplication *)self->_defaultPaymentApplication generatesLocalTransactions] & 1) != 0)
      {
        goto LABEL_275;
      }
      if (!self->_account) {
        goto LABEL_330;
      }
      goto LABEL_235;
    case 0x26uLL:
      if (v6 != 1
        || !self->_allContentIsLoaded
        || ![(PKPaymentDataProvider *)self->_paymentServiceDataProvider supportsTransactionsForPass:self->_pass]|| [(PKPaymentPassDetailViewController *)self shouldMapSection:39]|| ([(PKPaymentPass *)self->_pass supportsFPANNotifications] & 1) != 0)
      {
        goto LABEL_330;
      }
      char v40 = [(PKPaymentPass *)self->_pass supportsDPANNotifications];
      goto LABEL_289;
    case 0x27uLL:
      if (!self->_allContentIsLoaded) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self _shouldShowTransactionsSection];
    case 0x28uLL:
      if (v6 != 1 || ![(NSArray *)self->_transactionCountAndYear count]) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldMapSection:39];
    case 0x29uLL:
      if (v6) {
        goto LABEL_330;
      }
      group = self->_group;
      if (!group) {
        goto LABEL_330;
      }
      LOBYTE(v13) = (unint64_t)[(PKGroup *)group passCount] > 1;
      return (char)v13;
    case 0x2AuLL:
      if (v6
        || ![(PKPaymentPassDetailViewController *)self _shouldShowBillingAddressCell])
      {
        goto LABEL_330;
      }
      if (!self->_account) {
        goto LABEL_275;
      }
      if (!self->_loadingBillingContact && !self->_billingContact
        || ![(PKPaymentPassDetailViewController *)self _shouldShowServicingSection])
      {
        goto LABEL_330;
      }
      if (!self->_account)
      {
LABEL_275:
        LOBYTE(v13) = 1;
        return (char)v13;
      }
LABEL_235:
      transactionSourceCollection = self->_transactionSourceCollection;
      return +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", transactionSourceCollection);
    case 0x2BuLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowEligibleSpendSection];
    case 0x2CuLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowFinancingPlanListSection];
    case 0x2DuLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowPersonalInformationSection];
    case 0x2EuLL:
      if (v6
        || !self->_account
        || ![(PKPaymentPassDetailViewController *)self _shouldShowNetworkBenefitsCell])
      {
        goto LABEL_330;
      }
LABEL_253:
      if (!+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account])goto LABEL_330; {
      return [(PKPaymentPassDetailViewController *)self _shouldShowServicingSection];
      }
    case 0x2FuLL:
      long long v43 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      long long v44 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount altDSID];
      long long v45 = [v43 objectForKey:v44];

      BOOL v46 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 1
         && [(PKPeerPaymentAccount *)self->_peerPaymentAccount stage] == 3;
      if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isParticipantAccountLockedByOwner])char v50 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsGraduationWhileAssociatedAccountLocked]; {
      else
      }
        char v50 = 0;
      if (PKIsAltAccountPairedOrPairing()) {
        BOOL v52 = self->_detailViewStyle != 2;
      }
      else {
        BOOL v52 = 1;
      }
      if (v6) {
        goto LABEL_305;
      }
      uint64_t v53 = self->_peerPaymentAccount;
      if (!v53) {
        goto LABEL_305;
      }
      int v54 = self->_peerPaymentAccountResolutionController ? v7 : 0;
      if (v54 != 1 || [(PKPeerPaymentAccount *)v53 role] != 1) {
        goto LABEL_305;
      }
      LOBYTE(v13) = 0;
      if (self->_familyCollection && v45)
      {
        if ([v45 memberType]
          || ![(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing])
        {
LABEL_305:
          LOBYTE(v13) = 0;
        }
        else
        {
          LOBYTE(v13) = v52 & (v50 | v46);
        }
      }

      return (char)v13;
    case 0x30uLL:
      if (PKIsAltAccountPairedOrPairing() && self->_detailViewStyle == 2) {
        goto LABEL_330;
      }
      if (v6 != self->_hasTabBar) {
        goto LABEL_330;
      }
      int v47 = self->_peerPaymentAccount ? v7 : 0;
      if (v47 != 1) {
        goto LABEL_330;
      }
      id v10 = PKPrimaryAppleAccountEmail();
      uint64_t v11 = [v10 length];
LABEL_267:
      LOBYTE(v13) = v11 != 0;
LABEL_291:

      return (char)v13;
    case 0x31uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowVerifySSNSection];
    case 0x32uLL:
      if (v6) {
        goto LABEL_330;
      }
      if ([(PKPaymentPassDetailViewController *)self _shouldShowTermsCell]
        || [(PKPaymentPassDetailViewController *)self _shouldShowPrivacyPolicyCell])
      {
        goto LABEL_275;
      }
      return [(PKPaymentPassDetailViewController *)self passSupportsDeviceAssessment];
    case 0x33uLL:
      if (v6
        || !self->_peerPaymentAccount
        || !self->_peerPaymentAccountResolutionController
        || [(PKPaymentPassDetailViewController *)self _shouldShowAccountActions])
      {
        goto LABEL_330;
      }
      return PKPeerPaymentAccountCanPerformManualIdentityVerification();
    case 0x34uLL:
      if (v6) {
        goto LABEL_330;
      }
      return [(PKPaymentPassDetailViewController *)self shouldShowAccountUserStopSharingSection];
    case 0x35uLL:
      if (v6) {
        goto LABEL_330;
      }
      char v40 = [(PKPaymentPass *)self->_pass isHomeKeyPass];
LABEL_289:
      LOBYTE(v13) = v40 ^ 1;
      return (char)v13;
    default:
      goto LABEL_330;
  }
}

- (BOOL)_shouldShowTransactionsSection
{
  tabBar = self->_tabBar;
  if (!tabBar)
  {
    [(PKPaymentPassDetailViewController *)self _isBankConnectLinked];
    goto LABEL_18;
  }
  uint64_t v4 = [(UISegmentedControl *)tabBar selectedSegmentIndex];
  if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked])
  {
    if (v4 == 1)
    {
      LOBYTE(v5) = [(PKPaymentPassDetailViewController *)self _transactionsCount] != 0;
      return v5;
    }
LABEL_18:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (v4 != 1) {
    goto LABEL_18;
  }
  int v5 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider supportsTransactionsForPass:self->_pass];
  if (!v5) {
    return v5;
  }
  if (self->_peerPaymentAccount
    || (([(PKPaymentPass *)self->_pass supportsFPANNotifications] & 1) != 0
     || ([(PKPaymentPass *)self->_pass supportsDPANNotifications] & 1) != 0
     || ([(PKPaymentPass *)self->_pass isStoredValuePass] & 1) != 0
     || [(PKPaymentPass *)self->_pass isIdentityPass])
    && ([(PKPaymentPass *)self->_pass settings] & 8) != 0)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!self->_account) {
    goto LABEL_18;
  }
  transactionSourceCollection = self->_transactionSourceCollection;

  LOBYTE(v5) = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", transactionSourceCollection);
  return v5;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);

  [(PKPaymentPassDetailViewController *)self _decorateSections];
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);

  [(PKPaymentPassDetailViewController *)self _decorateSections];
}

- (void)setLinkTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkTextColor, a3);

  [(PKPaymentPassDetailViewController *)self _decorateSections];
}

- (void)setWarningTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_warningTextColor, a3);

  [(PKPaymentPassDetailViewController *)self _decorateSections];
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);

  [(PKPaymentPassDetailViewController *)self _decorateSections];
}

- (void)reloadData:(BOOL)a3
{
  uint64_t v4 = [(PKPaymentPassDetailViewController *)self viewIfLoaded];

  if (v4)
  {
    [(PKPaymentPassDetailViewController *)self _updateSectionControllersWithSelectedSectionSegment];
    paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self _recomputeMappedSections];
    [(PKPaymentPassDetailWrapperSectionController *)paymentPassDetailSectionController setSectionIdentifiers:v6];

    sectionControllers = self->_sectionControllers;
    id v8 = [(PKPaymentPassDetailViewController *)self _activeOrderOfSectionIdentifiers];
    [(PKDynamicTableViewController *)self setSectionControllers:sectionControllers sectionIdentifiers:v8];
  }
}

- (void)reloadSection:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(PKPaymentPassDetailViewController *)self viewIfLoaded];

  if (v5)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    v8[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(PKPaymentPassDetailViewController *)self reloadPassDetailSections:v7];
  }
}

- (void)reloadPassDetailSections:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PKPaymentPassDetailViewController *)self viewIfLoaded];

  if (v5)
  {
    if ([v4 containsObject:&unk_1EF2B9B28])
    {
      transactionsSwitch = self->_transactionsSwitch;
      self->_transactionsSwitch = 0;

      notificationsSwitch = self->_notificationsSwitch;
      self->_notificationsSwitch = 0;

      dailyCashSwitch = self->_dailyCashSwitch;
      self->_dailyCashSwitch = 0;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v25 = v4;
      char v13 = 0;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          unint64_t v16 = [*(id *)(*((void *)&v27 + 1) + 8 * i) unsignedIntegerValue];
          uint64_t v17 = PKPassDetailSectionTypeToString(v16);
          if (!v17) {
            __break(1u);
          }
          uint64_t v18 = (void *)v17;
          BOOL v19 = [(PKDynamicTableViewController *)self hasSectionForSectionIdentifier:v17];
          BOOL v20 = [(PKPaymentPassDetailViewController *)self shouldMapSection:v16];
          if (!v19 || !v20) {
            v13 |= v19 ^ v20;
          }
          else {
            [v9 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);

      id v4 = v25;
      if (v13)
      {
        paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
        id v23 = [(PKPaymentPassDetailViewController *)self _recomputeMappedSections];
        [(PKPaymentPassDetailWrapperSectionController *)paymentPassDetailSectionController setSectionIdentifiers:v23];

        uint64_t v24 = [(PKPaymentPassDetailViewController *)self _activeOrderOfSectionIdentifiers];
        [(PKDynamicTableViewController *)self recomputeMappedSectionsAndReloadSections:v9 sectionIdentifiers:v24];

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
    }
    if ([v9 count])
    {
      v26.receiver = self;
      v26.super_class = (Class)PKPaymentPassDetailViewController;
      [(PKDynamicTableViewController *)&v26 reloadSectionIdentifiers:v9];
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)reloadSections:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPaymentPassDetailViewController *)self viewIfLoaded];

  if (v4)
  {
    int v5 = [(PKPaymentPassDetailViewController *)self _activeOrderOfSectionIdentifiers];
    [(PKDynamicTableViewController *)self recomputeMappedSectionsAndReloadSections:v6 sectionIdentifiers:v5];
  }
}

- (id)_activeOrderOfSectionIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  tabBar = self->_tabBar;
  if (!tabBar)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_12;
  }
  uint64_t v4 = [(UISegmentedControl *)tabBar selectedSegmentIndex];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4 != 1)
  {
LABEL_12:
    [v5 addObjectsFromArray:self->_orderOfSectionIdentifiers];
    goto LABEL_13;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_sectionControllers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sectionIdentifiers", (void)v14);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

LABEL_13:
  uint64_t v12 = objc_msgSend(v5, "copy", (void)v14);

  return v12;
}

- (id)_recomputeMappedSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; i != 54; ++i)
  {
    if ([(PKPaymentPassDetailViewController *)self shouldMapSection:i])
    {
      id v5 = PKPassDetailSectionTypeToString(i);
      [v3 addObject:v5];
    }
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3
{
  return 0;
}

- (id)titleForHeaderInSection:(unint64_t)a3
{
  id v5 = 0;
  switch(a3)
  {
    case 3uLL:
      id v6 = [(PKPaymentPass *)self->_pass cardholderInfoSectionTitle];
      uint64_t v7 = v6;
      if (self->_isAppleAccess)
      {
        PKLocalizedPaymentString(&cfstr_EmployeeInfoHe.isa);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (v6)
      {
        id v8 = v6;
        goto LABEL_35;
      }
      long long v17 = [(PKPaymentPass *)self->_pass primaryFields];
      uint64_t v18 = [v17 firstObject];

      id v5 = [v18 label];

      goto LABEL_36;
    case 7uLL:
      uint64_t v7 = [(PKPaymentPass *)self->_pass barcode];
      id v8 = [v7 header];
      goto LABEL_35;
    case 0xAuLL:
      if (!self->_nfcExpressModeSupported || !self->_uwbExpressModeSupported) {
        goto LABEL_48;
      }
      id v10 = @"EXPRESS_ACCESS_TITLE";
      goto LABEL_51;
    case 0xCuLL:
      uint64_t v11 = PKLocalizedMadisonString(&cfstr_AccountUsersSe.isa);
      goto LABEL_52;
    case 0xFuLL:
    case 0x14uLL:
    case 0x15uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      goto LABEL_12;
    case 0x17uLL:
      id v10 = @"TICKET_SECTION_HEADER";
      goto LABEL_51;
    case 0x1AuLL:
      uint64_t v12 = @"PEER_PAYMENT_PASS_DETAILS_ACCEPT_PAYMENTS_HEADER_TITLE";
      goto LABEL_30;
    case 0x1CuLL:
      id v10 = @"PAYMENT_ACCOUNT";
      goto LABEL_51;
    case 0x1DuLL:
      uint64_t v11 = [(PKPaymentPassDetailViewController *)self _headerTitleForPassStateSection];
      goto LABEL_52;
    case 0x21uLL:
      if (self->_peerPaymentAccount) {
        goto LABEL_48;
      }
      char v13 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
      if ([v13 length])
      {

LABEL_48:
        id v5 = 0;
        goto LABEL_53;
      }
      BOOL v16 = [(PKPaymentPassDetailViewController *)self _shouldShowCardNumbersSection];

      if (v16) {
        goto LABEL_48;
      }
      id v5 = PKLocalizedPaymentString(&cfstr_CardInfoHeader.isa);
      if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
      {
        uint64_t v23 = PKLocalizedAquamanString(&cfstr_PassInfoHeader.isa);

        id v5 = (void *)v23;
      }
LABEL_53:
      uint64_t v19 = [(PKPaymentPassDetailViewController *)self _configurableSectionForSectionType:a3];
      BOOL v20 = [v19 header];

      if (v20)
      {
        id v21 = v20;

        id v5 = v21;
      }

      return v5;
    case 0x22uLL:
      if ([(PKDynamicTableViewController *)self hasSectionForSectionIdentifier:@"CardInfo"]|| self->_peerPaymentAccount)
      {
        goto LABEL_48;
      }
      id v10 = @"CARD_INFO_HEADER";
      goto LABEL_51;
    case 0x24uLL:
      uint64_t v11 = PKLocalizedPeerPaymentLexingtonString(&cfstr_BackOfPassFami_1.isa);
      goto LABEL_52;
    case 0x25uLL:
      if (self->_peerPaymentAccount)
      {
        uint64_t v12 = @"PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCHES_TITLE";
LABEL_30:
        uint64_t v11 = PKLocalizedPeerPaymentString(&v12->isa);
      }
      else
      {
        long long v14 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
        uint64_t v15 = [v14 length];

        if (!v15)
        {
          id v10 = @"TRANSACTIONS_HEADER";
          goto LABEL_51;
        }
        [(PKPaymentPassDetailViewController *)self _accountFeature];
LABEL_12:
        uint64_t v11 = PKLocalizedFeatureString();
      }
      goto LABEL_52;
    case 0x26uLL:
      uint64_t v7 = [(PKPaymentPass *)self->_pass organizationName];
      PKLocalizedPaymentString(&cfstr_TransactionsUn.isa, &stru_1EF1B4C70.isa, v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 0x27uLL:
      if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked])
      {
        uint64_t v11 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_11.isa);
      }
      else
      {
        if ([(PKPaymentPass *)self->_pass isIdentityPass]) {
          id v10 = @"TRANSACTIONS_LATEST_ACTIVITIES_HEADER";
        }
        else {
          id v10 = @"TRANSACTIONS_LATEST_HEADER";
        }
LABEL_51:
        uint64_t v11 = PKLocalizedPaymentString(&v10->isa);
      }
LABEL_52:
      id v5 = (void *)v11;
      goto LABEL_53;
    case 0x28uLL:
      uint64_t v12 = @"PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_BY_YEAR_SECTION_HEADER";
      goto LABEL_30;
    case 0x29uLL:
      uint64_t v11 = PKLocalizedShareableCredentialString(&cfstr_CardsInGroupTi.isa);
      goto LABEL_52;
    case 0x2AuLL:
      if (self->_account) {
        goto LABEL_48;
      }
      id v10 = @"SETTINGS_OPTIONS_BILLING_ADDRESS_VC_TITLE";
      goto LABEL_51;
    case 0x2EuLL:
      uint64_t v7 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
      [v7 paymentNetworkIdentifier];
      PKDisplayablePaymentNetworkNameForPaymentCredentialType();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
      id v5 = v8;
LABEL_36:

      goto LABEL_53;
    case 0x32uLL:
      if ([(PKPaymentPassDetailViewController *)self _numberOfPrivacyTermsInfoRows]
        || ![(PKPaymentPassDetailViewController *)self passSupportsDeviceAssessment])
      {
        goto LABEL_48;
      }
      id v10 = @"DEVICE_ASSESSMENT_SUPPORTED_PASS_DETAILS_PRIVACY_HEADER";
      goto LABEL_51;
    default:
      goto LABEL_53;
  }
}

- (id)titleForFooterInSection:(unint64_t)a3
{
  id v5 = 0;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  int64_t detailViewStyle = self->_detailViewStyle;
  switch(a3)
  {
    case 2uLL:
      unint64_t peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
      if (peerPaymentAccountResolution == 2)
      {
        long long v28 = @"PEER_PAYMENT_PASS_DETAILS_VERIFY_IDENTITY_FOOTER";
      }
      else
      {
        if (peerPaymentAccountResolution != 3) {
          goto LABEL_82;
        }
        if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 2)
        {
          PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_ACCOUNT_STATE_FOOTER_RESTRICTED_CONTACT_SUPPORT_BODY", detailViewStyle == 2);
          id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v9 = PKLocalizedPeerPaymentString(v8);
          goto LABEL_107;
        }
        long long v28 = @"PEER_PAYMENT_PASS_DETAILS_CONTACT_SUPPORT_FOOTER";
      }
LABEL_132:
      uint64_t v10 = PKLocalizedPeerPaymentString(&v28->isa);
      goto LABEL_139;
    case 5uLL:
      uint64_t v10 = [(PKPaymentPassDetailViewController *)self identityDocumentSectionFooter];
      goto LABEL_139;
    case 6uLL:
      id v8 = [(PKPaymentPassDetailViewController *)self tableView];
      uint64_t v9 = [(PKPaymentPassDetailViewController *)self footerForReplaceBiometricIdentityInTableView:v8];
      goto LABEL_107;
    case 8uLL:
      uint64_t v11 = @"AUTOMATIC_PRESENTATION_FOOTER";
      goto LABEL_52;
    case 0xAuLL:
      id v8 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
      if ([(PKPaymentPass *)self->_pass isAccessPass])
      {
        uint64_t v12 = [(PKPaymentPass *)self->_pass accessType];
        char v13 = (void (*)(NSString *))MEMORY[0x1E4F880B8];
        int v14 = 1;
        uint64_t v15 = @"EXPRESS_ACCESS_FOOTER";
        int v16 = 1;
        switch(v12)
        {
          case 0:
            goto LABEL_84;
          case 1:
          case 5:
          case 6:
            goto LABEL_11;
          case 2:
            char v13 = (void (*)(NSString *))MEMORY[0x1E4F880B8];
            uint64_t v15 = @"EXPRESS_ACCESS_BADGE_FOOTER";
            goto LABEL_84;
          case 3:
            if ((self->_radioTechnologyType & 2) == 0 || detailViewStyle != 2)
            {
LABEL_11:
              char v13 = (void (*)(NSString *))MEMORY[0x1E4F880B8];
              uint64_t v15 = @"EXPRESS_ACCESS_KEY_FOOTER";
              goto LABEL_84;
            }
            [(NSString *)v8 appendString:@"EXPRESS_ACCESS_KEY_PASSIVE_ENTRY_FOOTER"];
            char v13 = (void (*)(NSString *))MEMORY[0x1E4F880D8];
            goto LABEL_85;
          case 4:
            unint64_t radioTechnologyType = self->_radioTechnologyType;
            if (radioTechnologyType == 1)
            {
              char v13 = (void (*)(NSString *))MEMORY[0x1E4F880D0];
              int v14 = 0;
              uint64_t v15 = @"CAR_KEY_EXPRESS_MODE_FOOTER";
              goto LABEL_84;
            }
            if ((radioTechnologyType & 2) != 0)
            {
              char v13 = (void (*)(NSString *))MEMORY[0x1E4F880D0];
              int v14 = 0;
              int v16 = 0;
              uint64_t v15 = @"CAR_KEY_PASSIVE_ENTRY_FOOTER";
              goto LABEL_84;
            }
            char v13 = (void (*)(NSString *))MEMORY[0x1E4F880D0];
            if (detailViewStyle == 2) {
              goto LABEL_85;
            }
            break;
          default:
            char v13 = (void (*)(NSString *))MEMORY[0x1E4F880B8];
            if (detailViewStyle == 2) {
              goto LABEL_85;
            }
            int v16 = 1;
            goto LABEL_96;
        }
        goto LABEL_102;
      }
      char v13 = (void (*)(NSString *))MEMORY[0x1E4F880B8];
      int v14 = 1;
      uint64_t v15 = @"EXPRESS_ACCESS_FOOTER";
      int v16 = 1;
LABEL_84:
      [(NSString *)v8 appendString:v15];
      if (detailViewStyle == 2)
      {
LABEL_85:
        char v51 = @"_WATCH";
        goto LABEL_105;
      }
      if (!v14) {
        goto LABEL_101;
      }
LABEL_96:
      if (PKNearFieldLowPowerSupportIsAvailable())
      {
        [(NSString *)v8 appendString:@"_LPEM"];
        if ((v16 & 1) == 0) {
          goto LABEL_106;
        }
      }
      else
      {
LABEL_101:
        if (!v16) {
          goto LABEL_106;
        }
      }
LABEL_102:
      if (PKPearlIsAvailable()) {
        char v51 = @"_FACEID";
      }
      else {
        char v51 = @"_TOUCHID";
      }
LABEL_105:
      [(NSString *)v8 appendString:v51];
LABEL_106:
      uint64_t v9 = v13(v8);
      goto LABEL_107;
    case 0xDuLL:
      PKLocalizedBeekmanString(&cfstr_DetailsFooterT.isa);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_143;
    case 0xFuLL:
      uint64_t v18 = [(PKAccount *)self->_account creditDetails];
      uint64_t v19 = [v18 accountSummary];
      int v20 = [v19 requiresDebtCollectionNotices];

      if (v20
        || ([(PKAccount *)self->_account stateReason], !PKAccountStateReasonIsInMerge()))
      {
        [(PKPaymentPassDetailViewController *)self _accountFeature];
LABEL_138:
        uint64_t v10 = PKLocalizedFeatureString();
      }
      else
      {
        char v50 = @"ACCOUNT_MERGING_CREDIT_DETAILS_FOOTER";
LABEL_88:
        uint64_t v10 = PKLocalizedMadisonString(&v50->isa);
      }
      goto LABEL_139;
    case 0x13uLL:
      if (!self->_isAmpEligible) {
        goto LABEL_82;
      }
LABEL_137:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      goto LABEL_138;
    case 0x14uLL:
      switch(self->_cashbackResolution)
      {
        case 1uLL:
          unint64_t redemptionStatus = self->_redemptionStatus;
          if (redemptionStatus < 2 || redemptionStatus == 2) {
            goto LABEL_137;
          }
          goto LABEL_82;
        case 2uLL:
        case 3uLL:
        case 4uLL:
          goto LABEL_137;
        default:
          goto LABEL_82;
      }
    case 0x15uLL:
      id v22 = [(PKPhysicalCardController *)self->_physicalCardController unactivatedPhysicalCard];
      id v5 = v22;
      if (!v22) {
        goto LABEL_140;
      }
      uint64_t v23 = [v22 latestShippingActivity];
      uint64_t v24 = v23;
      if (v23 && [v23 shippingStatus])
      {
        switch([v24 shippingStatus])
        {
          case 1:
            id v25 = [v24 estimatedDeliveryDate];

            [(PKPaymentPassDetailViewController *)self _accountFeature];
            if (!v25) {
              goto LABEL_189;
            }
            objc_super v26 = [v24 formattedEstimatedDeliveryDate];
            uint64_t v27 = PKLocalizedFeatureString();
            goto LABEL_152;
          case 2:
          case 3:
            goto LABEL_174;
          case 4:
            id v17 = [v24 localizedDeliveryExceptionReason];
            if (!v17)
            {
LABEL_174:
              [(PKPaymentPassDetailViewController *)self _accountFeature];
LABEL_189:
              PKLocalizedFeatureString();
              id v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            break;
          default:
            id v17 = 0;
            break;
        }
      }
      else
      {
        objc_super v26 = [v5 latestOrderActivity];
        switch([v26 activity])
        {
          case 1:
          case 2:
          case 3:
            [(PKPaymentPassDetailViewController *)self _accountFeature];
            uint64_t v27 = PKLocalizedFeatureString();
LABEL_152:
            id v17 = (id)v27;
            break;
          case 4:
            double v69 = [v26 localizedReason];
            uint64_t v70 = v69;
            if (v69)
            {
              id v71 = v69;
            }
            else
            {
              [(PKPaymentPassDetailViewController *)self _accountFeature];
              PKLocalizedFeatureString();
              id v71 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v17 = v71;

            break;
          default:
            id v17 = 0;
            break;
        }
      }
      goto LABEL_143;
    case 0x16uLL:
      id v8 = [(PKPaymentPass *)self->_pass organizationName];
      PKLocalizedPaymentString(&cfstr_MessageService.isa, &stru_1EF1B4C70.isa, v8);
      goto LABEL_65;
    case 0x18uLL:
      if ([(PKPaymentPassDetailViewController *)self _showPeerPaymentBalanceFDICFooterView])
      {
        goto LABEL_82;
      }
      long long v28 = @"PEER_PAYMENT_PASS_DETAILS_ACTION_EDUCATION_FOOTER";
      goto LABEL_132;
    case 0x1AuLL:
      if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsDeviceTap]
        || !PKCashDeviceTapEnabled())
      {
        goto LABEL_82;
      }
      uint64_t v10 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentPas_18.isa);
      goto LABEL_139;
    case 0x1CuLL:
      uint64_t v11 = @"PAYMENT_ACCOUNT_FOOTER";
      goto LABEL_52;
    case 0x1DuLL:
      uint64_t v10 = [(PKPaymentPassDetailViewController *)self _footerTextForPassStateSection];
      goto LABEL_139;
    case 0x1EuLL:
      NSUInteger v29 = [(NSArray *)self->_displayableBalanceFields count];
      NSUInteger v30 = [(NSArray *)self->_commutePlanFields count];
      BOOL v31 = [(PKPaymentPassDetailViewController *)self _hasActionOfType:2];
      BOOL v32 = [(PKPaymentPassDetailViewController *)self _hasActionOfType:1];
      int v33 = v32;
      if (v30) {
        int v34 = !v31;
      }
      else {
        int v34 = 1;
      }
      if (v29) {
        int v35 = !v32;
      }
      else {
        int v35 = 1;
      }
      uint64_t v76 = PKLocalizedPaymentString(&cfstr_RemindersSecti_0.isa);
      if (([(PKPaymentPass *)self->_pass isAutoTopEnabled] & 1) != 0
        || !(v30 | v29) && ((v31 | v33) & 1) != 0)
      {
        goto LABEL_43;
      }
      char v57 = v34;
      if (v29) {
        int v58 = v34;
      }
      else {
        int v58 = 0;
      }
      if (v58 == 1)
      {
        int v59 = self->_transitProperties ? 1 : v33;
        if (v59 == 1)
        {
          if (detailViewStyle != 2)
          {
            uint64_t v60 = PKLocalizedPaymentString(&cfstr_BalanceAndPlan.isa);
LABEL_176:
            id v5 = (void *)v60;
            goto LABEL_44;
          }
LABEL_126:
          uint64_t v36 = (void *)v76;
          goto LABEL_127;
        }
      }
      if (v30) {
        int v61 = v35;
      }
      else {
        int v61 = 0;
      }
      if ((v61 & v31) == 1)
      {
        if (detailViewStyle != 2)
        {
          id v75 = 0;
          uint64_t v60 = PKPassLocalizedStringWithFormat();
          goto LABEL_176;
        }
        goto LABEL_126;
      }
      if (!v29)
      {
LABEL_43:
        id v5 = 0;
LABEL_44:
        uint64_t v36 = (void *)v76;
        goto LABEL_45;
      }
      if (!self->_transitProperties)
      {
        if (v30) {
          int v74 = v33;
        }
        else {
          int v74 = 0;
        }
        uint64_t v36 = (void *)v76;
        if ((v74 & v31 & 1) == 0) {
          goto LABEL_149;
        }
LABEL_187:
        if (detailViewStyle != 2)
        {
          id v75 = 0;
          PKPassLocalizedStringWithFormat();
          id v62 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_128;
        }
LABEL_127:
        id v62 = v36;
LABEL_128:
        id v5 = v62;
        goto LABEL_45;
      }
      uint64_t v36 = (void *)v76;
      if ((v57 & 1) == 0) {
        goto LABEL_187;
      }
LABEL_149:
      id v5 = 0;
LABEL_45:

LABEL_140:
      char v65 = -[PKPaymentPassDetailViewController _configurableSectionForSectionType:](self, "_configurableSectionForSectionType:", a3, v75);
      double v66 = [v65 footer];

      if (v66)
      {
        id v67 = v66;

        id v5 = v67;
      }
      id v17 = v5;

LABEL_143:
      return v17;
    case 0x1FuLL:
      if ([(PKPaymentPassDetailViewController *)self _shouldShowServiceMode])
      {
        if ([(PKPaymentPass *)self->_pass isEMoneyPass]) {
          BOOL v37 = @"SERVICE_MODE_NON_TRANSIT_SECTION_FOOTER";
        }
        else {
          BOOL v37 = @"SERVICE_MODE_SECTION_FOOTER";
        }
        id v5 = PKLocalizedPaymentString(&v37->isa);
      }
      else
      {
        id v5 = 0;
      }
      BOOL v52 = [(PKPaymentPassDetailViewController *)self traitCollection];
      unint64_t v53 = [v52 userInterfaceIdiom];

      if (v53 > 6 || ((1 << v53) & 0x62) == 0) {
        goto LABEL_140;
      }
      uint64_t v54 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
      id v8 = (NSString *)v54;
      if (v54)
      {
        v55 = PKLocalizedPaymentString(&cfstr_ContactIssuerB_0.isa, &stru_1EF1B4C70.isa, v54);
        if ([v5 length])
        {
          id v56 = [v5 stringByAppendingFormat:@"\n\n%@", v55];
        }
        else
        {
          id v56 = v55;
        }
        id v63 = v56;

        id v5 = v63;
      }
      goto LABEL_108;
    case 0x22uLL:
      uint64_t v11 = @"DPAN_FOOTER";
LABEL_52:
      uint64_t v10 = PKLocalizedPaymentString(&v11->isa);
      goto LABEL_139;
    case 0x24uLL:
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      char v38 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
      int v39 = [v38 associatedAccountInvitations];

      uint64_t v40 = [v39 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (!v40) {
        goto LABEL_61;
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v78;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v78 != v42) {
            objc_enumerationMutation(v39);
          }
          if ([*(id *)(*((void *)&v77 + 1) + 8 * i) status] == 1)
          {

LABEL_82:
            id v5 = 0;
            goto LABEL_140;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v77 objects:v81 count:16];
        if (v41) {
          continue;
        }
        break;
      }
LABEL_61:

      long long v44 = @"BACK_OF_PASS_FAMILY_SHARING_FOOTER";
LABEL_79:
      uint64_t v10 = PKLocalizedPeerPaymentLexingtonString(&v44->isa);
LABEL_139:
      id v5 = (void *)v10;
      goto LABEL_140;
    case 0x25uLL:
      if (![(PKPaymentPassDetailViewController *)self _showsTransactionHistorySwitch]) {
        goto LABEL_82;
      }
      id v8 = [(PKPaymentPass *)self->_pass organizationName];
      PKLocalizedPaymentString(&cfstr_TransactionsSe_0.isa, &stru_1EF1B4C70.isa, v8);
      goto LABEL_65;
    case 0x26uLL:
      id v8 = [(PKPaymentPass *)self->_pass organizationName];
      PKLocalizedPaymentString(&cfstr_TransactionsUn_0.isa, &stru_1EF1B4C70.isa, v8);
      goto LABEL_65;
    case 0x27uLL:
      if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked]
        || self->_peerPaymentAccount
        || self->_account)
      {
        goto LABEL_82;
      }
      if (![(PKPaymentPass *)self->_pass supportsFPANNotifications]
        || ![(PKPaymentPass *)self->_pass supportsDPANNotifications])
      {
        if (([(PKPaymentPass *)self->_pass isStoredValuePass] & 1) == 0
          && ([(PKPaymentPass *)self->_pass isIdentityPass] & 1) == 0)
        {
          PKDeviceSpecificLocalizedStringKeyForKey(@"TRANSACTIONS_FOOTER", self->_detailViewStyle == 2);
          id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          BOOL v46 = [(PKPaymentPass *)self->_pass organizationName];
          PKLocalizedPaymentString(v8, &stru_1EF1B4C70.isa, v46);
          double v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_134;
        }
        if ([(PKPaymentPass *)self->_pass isIdentityPass]) {
          BOOL v73 = detailViewStyle == 2;
        }
        else {
          BOOL v73 = 0;
        }
        if (v73 && [(PKPaymentPassDetailViewController *)self _transactionsCount])
        {
          uint64_t v10 = PKLocalizedIdentityString(&cfstr_ActivitiesComp.isa);
          goto LABEL_139;
        }
        goto LABEL_82;
      }
      id v8 = [(PKPaymentPass *)self->_pass organizationName];
      PKLocalizedPaymentString(&cfstr_TransactionsFo.isa, &stru_1EF1B4C70.isa, v8);
      uint64_t v9 = LABEL_65:;
LABEL_107:
      id v5 = (void *)v9;
LABEL_108:

      goto LABEL_140;
    case 0x29uLL:
      id v8 = [(PKLinkedApplication *)self->_linkedApplication displayName];
      if ([(NSString *)v8 length])
      {
        id v75 = v8;
        long long v45 = PKPassLocalizedStringWithFormat();
        BOOL v46 = v45;
        if (!v45
          || (int v47 = v45, v47 == @"ADDITIONAL_SHARING_INFO")
          || (uint64_t v48 = v47,
              char v49 = objc_msgSend(@"ADDITIONAL_SHARING_INFO", "isEqualToString:", v47, v8),
              v48,
              (v49 & 1) != 0))
        {
          id v5 = 0;
        }
        else
        {
          double v64 = v48;
LABEL_134:
          id v5 = v64;
        }
      }
      else
      {
        id v5 = 0;
      }
      goto LABEL_108;
    case 0x2DuLL:
      uint64_t v10 = [(PKPaymentPassDetailViewController *)self footerTextForPersonalInformationSection];
      goto LABEL_139;
    case 0x2FuLL:
      long long v44 = @"PEER_PAYMENT_PASS_DETAILS_GRADUATION_FOOTER";
      goto LABEL_79;
    case 0x31uLL:
      char v50 = @"BUILD_CREDIT_HISTORY_FOOTER";
      goto LABEL_88;
    default:
      goto LABEL_140;
  }
}

- (unint64_t)_transactionsCount
{
  return [(NSArray *)self->_transactions count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionCase:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x16uLL:
    case 0x18uLL:
    case 0x1BuLL:
    case 0x20uLL:
    case 0x23uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x33uLL:
    case 0x34uLL:
      goto LABEL_2;
    case 3uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _accessPersonInfoSectionGenerateCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_41;
    case 5uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self numberOfIdentityDocumentRowsInTableView:v6];
      goto LABEL_41;
    case 6uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self numberOfReplaceBiometricRowsInTableView:v6];
      goto LABEL_41;
    case 0xAuLL:
      int64_t isAmpEligible = self->_uwbExpressModeSupported + (unint64_t)self->_nfcExpressModeSupported;
      break;
    case 0xCuLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self numberOfAccountUserRowsInTableView:v6];
      goto LABEL_41;
    case 0xFuLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _numberOfAccountServiceCreditDetailsRowsEnabled];
      goto LABEL_41;
    case 0x12uLL:
      BOOL v9 = [(PKPaymentPassDetailViewController *)self _shouldShowProductBenefitsCell];
      goto LABEL_38;
    case 0x13uLL:
      int64_t isAmpEligible = self->_isAmpEligible;
      break;
    case 0x14uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _numberOfAccountServiceRewardsRowsEnabled];
      goto LABEL_41;
    case 0x15uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _numberOfAccountServicePhysicalCardRowsEnabled];
      goto LABEL_41;
    case 0x17uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _transitCellGenerateCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_41;
    case 0x19uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _numberOfPeerPaymentMoneyActionsEnabled];
      goto LABEL_41;
    case 0x1AuLL:
      int64_t isAmpEligible = 2 * !self->_loadingPeerPaymentPreferences;
      break;
    case 0x1CuLL:
      uint64_t v10 = 1280;
      goto LABEL_32;
    case 0x1DuLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _passStateSectionGenerateCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_41;
    case 0x1EuLL:
      NSUInteger v11 = [(NSArray *)self->_displayableBalanceFields count];
      int64_t isAmpEligible = [(NSArray *)self->_commutePlanFields count] + v11;
      break;
    case 0x1FuLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _contactBankCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_41;
    case 0x21uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _cardInfoSectionGenerateCellWithOutput:0 forRowIndex:0 tableView:0];
      goto LABEL_41;
    case 0x22uLL:
      uint64_t v10 = 1272;
      goto LABEL_32;
    case 0x24uLL:
      uint64_t v12 = [(NSArray *)self->_sortedFamilyMemberRowModels count];
      goto LABEL_34;
    case 0x25uLL:
      if ([(PKPaymentPassDetailViewController *)self _showsTransactionHistorySwitch])
      {
        if (([(PKPaymentPass *)self->_pass settings] & 8) != 0) {
          int64_t isAmpEligible = 2;
        }
        else {
          int64_t isAmpEligible = 1;
        }
      }
      else
      {
        peerPaymentAccount = self->_peerPaymentAccount;
        if (!peerPaymentAccount || [(PKPeerPaymentAccount *)peerPaymentAccount role]) {
LABEL_2:
        }
          int64_t isAmpEligible = 1;
        else {
          int64_t isAmpEligible = 2;
        }
      }
      break;
    case 0x26uLL:
      char v13 = [(PKPaymentPass *)self->_pass storeIdentifiers];
      int64_t isAmpEligible = [v13 count] != 0;

      break;
    case 0x27uLL:
      if (![(PKPaymentPassDetailViewController *)self _transactionsCount]) {
        goto LABEL_2;
      }
      unint64_t v14 = [(PKPaymentPassDetailViewController *)self _transactionsCount];
      int64_t isAmpEligible = v14
                    + [(PKPaymentPassDetailViewController *)self _transactionDeepLinkingEnabled];
      break;
    case 0x28uLL:
      uint64_t v10 = 1240;
LABEL_32:
      uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v10) count];
      goto LABEL_41;
    case 0x29uLL:
      uint64_t v12 = [(PKGroup *)self->_group passCount];
LABEL_34:
      int64_t isAmpEligible = v12 + 1;
      break;
    case 0x2AuLL:
      if (!self->_account) {
        goto LABEL_2;
      }
      int64_t isAmpEligible = !self->_loadingBillingContact;
      break;
    case 0x2EuLL:
      BOOL v9 = [(PKPaymentPassDetailViewController *)self _shouldShowNetworkBenefitsCell];
LABEL_38:
      int64_t isAmpEligible = v9;
      break;
    case 0x32uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _numberOfPrivacyTermsInfoRows];
      goto LABEL_41;
    case 0x35uLL:
      uint64_t v8 = [(PKPaymentPassDetailViewController *)self _passOperationsCellWithOutput:0 forRowIndex:0 tableView:0];
LABEL_41:
      int64_t isAmpEligible = v8;
      break;
    default:
      int64_t isAmpEligible = 0;
      break;
  }

  return isAmpEligible;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  id v23 = 0;
  switch(a5)
  {
    case 0uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _widgetCellForTableView:v8];
      goto LABEL_67;
    case 1uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _linkedAppCellForTableView:v8];
      goto LABEL_67;
    case 2uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentAccountActionCellForRowIndex:tableView:](self, "_peerPaymentAccountActionCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 3uLL:
      -[PKPaymentPassDetailViewController _accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    case 4uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _cardHolderPictureCellForTableView:v8];
      goto LABEL_67;
    case 5uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self identityDocumentTableViewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 6uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self replaceBiometricTableViewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 7uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _barcodeCell];
      goto LABEL_67;
    case 8uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _automaticPresentationCellForTableView:v8];
      goto LABEL_67;
    case 9uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _manufacturerInfoCellForTableView:v8];
      goto LABEL_67;
    case 0xAuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _expressAccessCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0xBuLL:
      uint64_t v12 = PKLocalizedPaymentString(&cfstr_LinkToWalletPa.isa);
      char v13 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v12 forTableView:v8];
      id v23 = v13;

      unint64_t v14 = (void **)MEMORY[0x1E4F85B70];
      goto LABEL_51;
    case 0xCuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self accountUserTableViewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0xDuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _installmentsPlanCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0xEuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServiceCardNumbersCellForRowIndex:tableView:](self, "_accountServiceCardNumbersCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0xFuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServiceCreditDetailsCellForRowIndex:tableView:](self, "_accountServiceCreditDetailsCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x10uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServiceBankAccountsCellForRowIndex:tableView:](self, "_accountServiceBankAccountsCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _merchantTokensCellForTableView:v8];
      goto LABEL_67;
    case 0x12uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      uint64_t v15 = PKLocalizedFeatureString();
      char v13 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v15 forTableView:v8];
      id v23 = v13;

      unint64_t v14 = (void **)MEMORY[0x1E4F85888];
      goto LABEL_51;
    case 0x13uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServiceMakeDefaultCellForRowIndex:tableView:](self, "_accountServiceMakeDefaultCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x14uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServiceRewardsDetailsCellForRowIndex:tableView:](self, "_accountServiceRewardsDetailsCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x15uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _accountServicePhysicalCardCellForRowIndex:tableView:](self, "_accountServicePhysicalCardCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x16uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _messagesSwitchCellForTableView:v8];
      goto LABEL_67;
    case 0x17uLL:
      -[PKPaymentPassDetailViewController _transitCellGenerateCellWithOutput:forRowIndex:tableView:](self, "_transitCellGenerateCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    case 0x18uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentBalanceCellForRowIndex:tableView:](self, "_peerPaymentBalanceCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x19uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentMoneyActionCellForRowIndex:tableView:](self, "_peerPaymentMoneyActionCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x1AuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:tableView:](self, "_peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x1BuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentBankAccountsCellForRowIndex:tableView:](self, "_peerPaymentBankAccountsCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x1CuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _paymentApplicationsCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0x1DuLL:
      -[PKPaymentPassDetailViewController _passStateSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_passStateSectionGenerateCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    case 0x1EuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _balanceOrCommutePlanCellForRowIndex:tableView:](self, "_balanceOrCommutePlanCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x1FuLL:
      -[PKPaymentPassDetailViewController _contactBankCellWithOutput:forRowIndex:tableView:](self, "_contactBankCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    case 0x21uLL:
      -[PKPaymentPassDetailViewController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    case 0x22uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _deviceAccountNumberCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0x24uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _familyMemberCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0x25uLL:
      if (self->_peerPaymentAccount)
      {
        NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _peerPaymentNotificationsSwitchCellForIndexPath:v9 tableView:v8];
        goto LABEL_67;
      }
      uint64_t v18 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
      uint64_t v19 = [v18 length];

      if (v19) {
        [(PKPaymentPassDetailViewController *)self _accountServiceNotificationsSwitchCellForIndexPath:v10 tableView:v8];
      }
      else {
        [(PKPaymentPassDetailViewController *)self _transactionsSwitchCellForIndexPath:v10 tableView:v8];
      }
      goto LABEL_43;
    case 0x26uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _linkedApplicationCellForTableView:v8];
      goto LABEL_67;
    case 0x27uLL:
      if ([(PKPaymentPassDetailViewController *)self _transactionsCount])
      {
        unint64_t v16 = [v10 row];
        if (v16 >= [(PKPaymentPassDetailViewController *)self _transactionsCount]) {
          [(PKPaymentPassDetailViewController *)self _moreTransactionsCellForTableView:v8];
        }
        else {
          [(PKPaymentPassDetailViewController *)self _transactionCellForIndexPath:v10 tableView:v8];
        }
        NSUInteger v11 = LABEL_43:;
LABEL_67:
        id v23 = v11;
      }
      else
      {
        if ([(PKPaymentPass *)self->_pass isIdentityPass]) {
          PKLocalizedIdentityString(&cfstr_ActivitiesNone.isa);
        }
        else {
        int v20 = PKLocalizedPaymentString(&cfstr_TransactionsNo.isa);
        }
        id v23 = [(PKPaymentPassDetailViewController *)self _infoCellWithDescription:v20 forTableView:v8];
      }
LABEL_68:
      id v21 = v23;

      return v21;
    case 0x28uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _transactionCountByPeriodCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0x29uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _passesInGroupCellForIndexPath:v9 tableView:v8];
      goto LABEL_67;
    case 0x2AuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _billingAddressCellShowingAddress:self->_account == 0 forTableView:v8];
      goto LABEL_67;
    case 0x2BuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self payLaterEligibleSpendTableVewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0x2CuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self financingPlanListTableVewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0x2DuLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self personalInformationTableVewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0x2EuLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v17 = PKLocalizedFeatureString();
      char v13 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v17 forTableView:v8];
      id v23 = v13;

      unint64_t v14 = (void **)MEMORY[0x1E4F85718];
LABEL_51:
      PKAccessibilityIDCellSet(v13, *v14);
      goto LABEL_68;
    case 0x2FuLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentParticipantGraduationCellForRowIndex:tableView:](self, "_peerPaymentParticipantGraduationCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x30uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self _peerPaymentStatementCellForTableView:v8];
      goto LABEL_67;
    case 0x31uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self verifySSNTableViewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0x32uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _privacyTermsSectionCellForRowIndex:tableView:](self, "_privacyTermsSectionCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x33uLL:
      NSUInteger v11 = -[PKPaymentPassDetailViewController _peerPaymentManualIdentityVerificationCellForRowIndex:tableView:](self, "_peerPaymentManualIdentityVerificationCellForRowIndex:tableView:", [v9 row], v8);
      goto LABEL_67;
    case 0x34uLL:
      NSUInteger v11 = [(PKPaymentPassDetailViewController *)self accountUserStopSharingTableViewCellForTableView:v8 atIndexPath:v9];
      goto LABEL_67;
    case 0x35uLL:
      -[PKPaymentPassDetailViewController _passOperationsCellWithOutput:forRowIndex:tableView:](self, "_passOperationsCellWithOutput:forRowIndex:tableView:", &v23, [v9 row], v8);
      goto LABEL_68;
    default:
      goto LABEL_68;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = a5 == 39
     && ![(PKPaymentPassDetailViewController *)self _isBankConnectLinked]
     && -[PKPaymentPassDetailViewController _transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:](self, "_transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:", 0, [v9 row], v8);

  return v10;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v6 = 0;
  id v12 = 0;
  if (a5 == 39)
  {
    id v9 = a3;
    -[PKPaymentPassDetailViewController _transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:](self, "_transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:", &v12, [a4 row], v9);

    id v6 = v12;
  }
  BOOL v10 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v6];
  [v10 setPerformsFirstActionWithFullSwipe:0];

  return v10;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self view];
  [v5 setNeedsLayout];

  id v6 = [(PKPassHeaderView *)self->_passHeaderView passView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  [v4 contentOffset];
  double v12 = v11;
  [v4 adjustedContentInset];
  double v14 = v13;

  double v15 = v8 + v10 - v14;
  self->_showingTitleIconView = v12 >= v15;
  titleIconView = self->_titleIconView;
  if (v12 < v15) {
    passSnapshotView = 0;
  }
  else {
    passSnapshotView = self->_passSnapshotView;
  }

  [(PKAnimatedNavigationBarTitleView *)titleIconView setTitleView:passSnapshotView animated:1];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[PKPaymentPassDetailViewController _normalizedContentOffsetForTargetOffset:](self, "_normalizedContentOffsetForTargetOffset:", a3, a5->x, a5->y);
  a5->x = v6;
  a5->y = v7;
}

- (void)_normalizeContentOffset
{
  id v10 = [(PKPaymentPassDetailViewController *)self tableView];
  if (([v10 isDragging] & 1) == 0 && (objc_msgSend(v10, "isDecelerating") & 1) == 0)
  {
    [v10 contentOffset];
    double v4 = v3;
    double v6 = v5;
    -[PKPaymentPassDetailViewController _normalizedContentOffsetForTargetOffset:](self, "_normalizedContentOffsetForTargetOffset:");
    if (v4 != v8 || v6 != v7) {
      objc_msgSend(v10, "setContentOffset:animated:", 1);
    }
  }
}

- (CGPoint)_normalizedContentOffsetForTargetOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(PKPaymentPassDetailViewController *)self tableView];
  [v6 adjustedContentInset];
  double v8 = v7;
  double v10 = v9;
  [v6 contentSize];
  double v12 = v11;
  [v6 bounds];
  double v14 = v13;
  [(PKPaymentPassDetailViewController *)self _offscreenHeaderHeight];
  double v16 = -v8;
  double v17 = v15 + v14 - (v10 + v8 + v12);
  if (v17 <= 0.0)
  {
    double v19 = v15 - v8;
    if (y < v16) {
      double v20 = -v8;
    }
    else {
      double v20 = y;
    }
    if ((y + v8) / (v8 + v19) <= 0.5) {
      double v21 = -v8;
    }
    else {
      double v21 = v19;
    }
    if (y > v16 && y < v19) {
      double v18 = v21;
    }
    else {
      double v18 = v20;
    }
  }
  else
  {
    double v18 = fmin(fmax(y, v16), fmax(v15 - v17, 0.0) - v8);
  }

  double v23 = x;
  double v24 = v18;
  result.double y = v24;
  result.CGFloat x = v23;
  return result;
}

- (BOOL)shouldDrawTopSeparator:(unint64_t)a3
{
  return a3 != 0;
}

- (BOOL)shouldDrawBottomSeparator:(unint64_t)a3
{
  return a3 != 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 section:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  if (a6 == 39)
  {
    uint64_t v13 = -[PKPaymentPassDetailViewController tableView:contextMenuConfigurationForTransactionAtIndexPath:point:](self, "tableView:contextMenuConfigurationForTransactionAtIndexPath:point:", v11, v12, x, y);
    goto LABEL_5;
  }
  if (a6 == 33)
  {
    uint64_t v13 = [(PKPaymentPassDetailViewController *)self tableView:v11 contextMenuConfigurationForCardInfoAtIndexPath:v12];
LABEL_5:
    double v14 = (void *)v13;
    goto LABEL_7;
  }
  double v14 = 0;
LABEL_7:

  return v14;
}

- (id)tableView:(id)a3 contextMenuConfigurationForCardInfoAtIndexPath:(id)a4
{
  double v5 = [a3 cellForRowAtIndexPath:a4];
  double v6 = [v5 reuseIdentifier];
  int v7 = [v6 isEqualToString:@"PKTableViewCellReuseIdentifierCustomerServiceIdentifier"];

  if (v7)
  {
    double v8 = [(PKPaymentPass *)self->_pass customerServiceIdentifier];
    double v9 = [(PKPaymentPassDetailViewController *)self contextMenuConfigurationForCopyingText:v8];
  }
  else
  {
    double v10 = [v5 reuseIdentifier];
    int v11 = [v10 isEqualToString:@"cardNumberCell"];

    if (!v11)
    {
      double v9 = 0;
      goto LABEL_11;
    }
    double v8 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    id v12 = [v8 sanitizedDPAN];
    if (v12
      && [(PKPaymentPassDetailViewController *)self paymentApplicationShouldShowFullDPAN:v8])
    {
      uint64_t v13 = PKFormattedSanitizedPAN();
      double v9 = [(PKPaymentPassDetailViewController *)self contextMenuConfigurationForCopyingText:v13];
    }
    else
    {
      double v9 = 0;
    }
  }
LABEL_11:

  return v9;
}

- (id)contextMenuConfigurationForCopyingText:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E59D5228;
  id v9 = v3;
  id v4 = v3;
  double v5 = _Block_copy(aBlock);
  double v6 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v5];

  return v6;
}

id __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    BOOL v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2;
    v9[3] = &unk_1E59D5200;
    id v10 = *(id *)(a1 + 32);
    id v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v9];

    double v5 = (void *)MEMORY[0x1E4FB1970];
    v11[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    int v7 = [v5 menuWithTitle:&stru_1EF1B5B50 children:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

void __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (id)tableView:(id)a3 contextMenuConfigurationForTransactionAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = [v10 row];
  if (v11 >= [(PKPaymentPassDetailViewController *)self _transactionsCount])
  {
    double v16 = 0;
  }
  else
  {
    id v12 = [v9 cellForRowAtIndexPath:v10];
    uint64_t v13 = [v12 transactionView];
    int v14 = objc_msgSend(v13, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y);

    if (v14)
    {
      double v15 = [(NSArray *)self->_transactions objectAtIndexedSubscript:v11];
      double v16 = [(PKPaymentPassDetailViewController *)self contextMenuConfigurationForTransaction:v15];
    }
    else
    {
      double v16 = 0;
    }
  }

  return v16;
}

- (id)contextMenuConfigurationForTransaction:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke;
  aBlock[3] = &unk_1E59DF440;
  void aBlock[4] = self;
  id v5 = v4;
  id v17 = v5;
  double v6 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  if ([v5 isDeletable] && objc_msgSend(v5, "transactionType") == 15)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_2;
    v12[3] = &unk_1E59DF468;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    int v7 = _Block_copy(v12);

    objc_destroyWeak(&v14);
  }
  else
  {
    int v7 = 0;
  }
  double v8 = (void *)MEMORY[0x1E4FB1678];
  id v9 = [v5 identifier];
  id v10 = [v8 configurationWithIdentifier:v9 previewProvider:v6 actionProvider:v7];

  objc_destroyWeak(&location);

  return v10;
}

uint64_t __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transactionDetailViewControllerForTransaction:*(void *)(a1 + 40)];
}

id __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_3;
  double v15 = &unk_1E59CE6B8;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v16 = *(id *)(a1 + 32);
  id v5 = [v4 actionWithHandler:&v12];
  objc_msgSend(v5, "setAttributes:", 2, v12, v13, v14, v15);
  double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  [v5 setImage:v6];

  int v7 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
  [v5 setTitle:v7];

  double v8 = (void *)MEMORY[0x1E4FB1970];
  v18[0] = v5;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v10 = [v8 menuWithChildren:v9];

  objc_destroyWeak(&v17);

  return v10;
}

void __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deleteTransaction:*(void *)(a1 + 32) completionHandler:0];
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  int v7 = [v6 previewViewController];
  double v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __105__PKPaymentPassDetailViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E59CA870;
    void v9[4] = self;
    id v10 = v7;
    [v6 addAnimations:v9];
  }
}

void __105__PKPaymentPassDetailViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSectionCase:(unint64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (a4 != 42)
  {
    if (a4 == 26)
    {
      uint64_t v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"spinner"];
      id v9 = &OBJC_IVAR___PKPaymentPassDetailViewController__loadingPeerPaymentPreferences;
      uint64_t v10 = 1592;
      goto LABEL_6;
    }
LABEL_9:
    id v17 = [(PKPaymentPassDetailViewController *)self titleForHeaderInSection:a4];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [v7 dequeueReusableHeaderFooterViewWithIdentifier:@"default"];
      if (!v16) {
        id v16 = (id)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"default"];
      }
    }
    goto LABEL_13;
  }
  if (self->_account) {
    goto LABEL_9;
  }
  uint64_t v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"spinner"];
  id v9 = &OBJC_IVAR___PKPaymentPassDetailViewController__loadingBillingContact;
  uint64_t v10 = 1760;
LABEL_6:
  unint64_t v11 = (id *)((char *)&self->super.super.super.super.super.isa + v10);
  uint64_t v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
  *unint64_t v11 = (id)v8;

  id v13 = *v11;
  if (!*v11)
  {
    id v14 = [[PKSpinnerHeaderView alloc] initWithReuseIdentifier:@"spinner"];
    id v15 = *v11;
    *unint64_t v11 = v14;

    id v13 = *v11;
  }
  [v13 setShowSpinner:*((unsigned __int8 *)&self->super.super.super.super.super.isa + *v9)];
  id v16 = *v11;
  if (!v16) {
    goto LABEL_9;
  }
LABEL_13:

  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSectionCase:(unint64_t)a4
{
  if (!a4) {
    return 0.0;
  }
  [a3 sectionHeaderHeight];
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSectionCase:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((uint64_t)a4 <= 28)
  {
    switch(a4)
    {
      case 0xCuLL:
        uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForAccountUsersSection];
        break;
      case 0x11uLL:
LABEL_13:
        uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForMerchantTokensSection];
        break;
      case 0x18uLL:
        uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForPeerPaymentBalanceSectionWithTableView:v6];
        break;
      default:
        goto LABEL_28;
    }
LABEL_27:
    id v14 = (void *)v7;
    if (v7) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if ((uint64_t)a4 <= 49)
  {
    switch(a4)
    {
      case 0x1DuLL:
        uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForPassStateSection];
        goto LABEL_27;
      case 0x20uLL:
      case 0x23uLL:
        goto LABEL_13;
      case 0x24uLL:
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
        id v9 = [v8 associatedAccountInvitations];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (!v10) {
          goto LABEL_22;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        break;
      default:
        goto LABEL_28;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) status] == 1)
        {

          uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForPendingPeerPaymentAssociatedAccount];
          goto LABEL_27;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_22:

    goto LABEL_28;
  }
  switch(a4)
  {
    case '2':
      uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForApplePayProductPrivacySection];
      goto LABEL_27;
    case '3':
      uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForManualIdentityVerificationSection];
      goto LABEL_27;
    case '5':
      uint64_t v7 = [(PKPaymentPassDetailViewController *)self _footerViewForPassOperationsSection];
      goto LABEL_27;
  }
LABEL_28:
  id v15 = [(PKPaymentPassDetailViewController *)self titleForFooterInSection:a4];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"default"];
    if (!v14) {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"default"];
    }
  }
LABEL_32:

  return v14;
}

- (double)tableView:(id)a3 heightForFooterInSectionCase:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_tableView_heightForFooterInSectionCase___block_invoke;
  aBlock[3] = &unk_1E59DF490;
  void aBlock[4] = self;
  unint64_t v24 = a4;
  id v7 = v6;
  id v23 = v7;
  uint64_t v8 = (double (**)(void))_Block_copy(aBlock);
  if ((uint64_t)a4 <= 23)
  {
    if (!a4)
    {
      double v10 = 0.0;
      goto LABEL_25;
    }
    if (a4 == 12 || a4 == 17)
    {
LABEL_24:
      double v10 = *MEMORY[0x1E4FB2F28];
      goto LABEL_25;
    }
  }
  else
  {
    switch(a4)
    {
      case 0x1DuLL:
        [(PKPaymentPassDetailViewController *)self _footerViewHeightForPassStateSectionWithTableView:v7];
        goto LABEL_22;
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x21uLL:
      case 0x22uLL:
        goto LABEL_21;
      case 0x20uLL:
      case 0x23uLL:
        goto LABEL_24;
      case 0x24uLL:
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v11 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
        uint64_t v12 = [v11 associatedAccountInvitations];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
        if (!v13) {
          goto LABEL_20;
        }
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        break;
      default:
        if (a4 != 24 && a4 != 50) {
          goto LABEL_21;
        }
        goto LABEL_24;
    }
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * v16) status] == 1)
        {

          goto LABEL_24;
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
LABEL_20:
  }
LABEL_21:
  double v9 = v8[2](v8);
LABEL_22:
  double v10 = v9;
LABEL_25:

  return v10;
}

uint64_t __76__PKPaymentPassDetailViewController_tableView_heightForFooterInSectionCase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) titleForFooterInSection:*(void *)(a1 + 48)];
  uint64_t v3 = [v2 length];

  if (v3) {
    goto LABEL_8;
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = PKPassDetailSectionTypeToString(*(void *)(a1 + 48));
  uint64_t v6 = [v4 indexOfSectionIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v7 = v6 + 1, v7 >= [*(id *)(a1 + 32) numberOfSections])
    || ([*(id *)(a1 + 32) tableView:*(void *)(a1 + 40) titleForHeaderInSection:v7],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        !v9))
  {
LABEL_8:
    uint64_t v11 = *(void **)(a1 + 40);
    return [v11 sectionFooterHeight];
  }
  else
  {
    return PKFloatRoundToPixel();
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 - 8 >= 0x2E)
  {
    switch(a5)
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
      case 5uLL:
      case 6uLL:
        goto LABEL_2;
      case 1uLL:
      case 7uLL:
        double v11 = *MEMORY[0x1E4FB2F28];
        break;
      case 4uLL:
        uint64_t v13 = [(PKPaymentPass *)self->_pass cardHolderPicture];
        [v13 size];
        double v11 = 184.0;
        if (v14 < 184.0)
        {
          uint64_t v15 = [(PKPaymentPass *)self->_pass cardHolderPicture];
          [v15 size];
          double v11 = v16;
        }
        break;
      default:
        double v11 = 0.0;
        break;
    }
  }
  else
  {
LABEL_2:
    [v8 rowHeight];
    double v11 = v10;
  }

  return v11;
}

- (double)estimatedHeightForRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  double result = *MEMORY[0x1E4FB2F28];
  if (a4 >= 0x36) {
    return 0.0;
  }
  return result;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  LOBYTE(v8) = 0;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
    case 0x18uLL:
    case 0x22uLL:
      break;
    case 0xCuLL:
      goto LABEL_34;
    case 0xEuLL:
      BOOL v10 = [(PKAccountCardNumbersPresenter *)self->_accountCardNumbersPresenter isLoadingVirtualCard];
      goto LABEL_25;
    case 0xFuLL:
      if (-[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowForRowIndex:](self, "_accountServiceCreditDetailsRowForRowIndex:", [v6 row]))
      {
        goto LABEL_23;
      }
      BOOL v11 = [(PKPaymentPassDetailViewController *)self isTotalBalanceCellSelectable];
      goto LABEL_35;
    case 0x10uLL:
      uint64_t v12 = 1656;
      goto LABEL_27;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      id v9 = [(PKRetrieveMerchantTokensResponse *)self->_merchantTokensResponse merchantTokens];
      LOBYTE(v8) = [v9 count] != 0;

      break;
    case 0x14uLL:
      unint64_t v13 = -[PKPaymentPassDetailViewController _accountServiceRewardsRowForRowIndex:](self, "_accountServiceRewardsRowForRowIndex:", [v6 row]);
      if (v13 == 1 && !self->_redeemingRewards) {
        goto LABEL_20;
      }
      BOOL v14 = v13 == 2;
      goto LABEL_28;
    case 0x15uLL:
      if ([(PKPhysicalCardActionController *)self->_physicalCardActionController state] == 1
        || self->_loadingOrderPhysicalCard)
      {
        goto LABEL_23;
      }
      uint64_t v12 = 1659;
      goto LABEL_27;
    case 0x1CuLL:
      -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", [v6 row]);
      uint64_t v15 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = !self->_changingDefaultPaymentApplication && self->_defaultPaymentApplication != v15;

      break;
    case 0x1EuLL:
      BOOL v11 = -[PKPaymentPassDetailViewController _canSelectBalanceOrCommutePlanCellAtRowIndex:](self, "_canSelectBalanceOrCommutePlanCellAtRowIndex:", [v6 row]);
      goto LABEL_35;
    case 0x21uLL:
      int64_t v16 = [(PKPaymentPassDetailViewController *)self _rowIndexForExpressTransitSettingsCell];
      BOOL v14 = v16 == [v7 row];
      goto LABEL_28;
    case 0x24uLL:
      unint64_t v17 = [v6 row];
      if (v17 >= [(NSArray *)self->_sortedFamilyMemberRowModels count]) {
        goto LABEL_20;
      }
      long long v18 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v17];
      unint64_t v19 = [v18 state];
      if (v19 > 4)
      {

LABEL_34:
        BOOL v11 = [(PKPaymentPassDetailViewController *)self canSelectAccountUserRowAtIndexPath:v7];
LABEL_35:
        LOBYTE(v8) = v11;
      }
      else
      {
        unsigned int v8 = (0xEu >> v19) & 1;
      }
      break;
    case 0x27uLL:
      LOBYTE(v8) = [(PKPaymentPassDetailViewController *)self _transactionsCount] != 0;
      break;
    case 0x30uLL:
      if (self->_requestingStatement)
      {
LABEL_23:
        LOBYTE(v8) = 0;
      }
      else
      {
        uint64_t v12 = 1729;
LABEL_27:
        BOOL v14 = *((unsigned char *)&self->super.super.super.super.super.isa + v12) == 0;
LABEL_28:
        LOBYTE(v8) = v14;
      }
      break;
    case 0x35uLL:
      BOOL v10 = [(PKPaymentPassDetailViewController *)self _isDeletingPass];
LABEL_25:
      LOBYTE(v8) = !v10;
      break;
    default:
LABEL_20:
      LOBYTE(v8) = 1;
      break;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  [v9 deselectRowAtIndexPath:v8 animated:1];
  switch(a5)
  {
    case 2uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentAccountActionAtIndexPath:v8];
      break;
    case 5uLL:
      [(PKPaymentPassDetailViewController *)self didSelectIdentityDocumentCellInTableView:v9 atIndexPath:v8];
      break;
    case 6uLL:
      [(PKPaymentPassDetailViewController *)self didSelectReplaceBiometricCellInTableView:v9 atIndexPath:v8];
      break;
    case 0xBuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectServicingWalletLink];
      break;
    case 0xCuLL:
      [(PKPaymentPassDetailViewController *)self didSelectAccountUserCellInTableView:v9 atIndexPath:v8];
      break;
    case 0xDuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectInstallmentPlansAtIndexPath:v8];
      break;
    case 0xEuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAccountServiceCardNumbersAtIndexPath:v8];
      break;
    case 0xFuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectCreditDetailsCell:v8];
      break;
    case 0x10uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAccountServiceBankAccountsAtIndexPath:v8];
      break;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectMerchantTokensCell];
      break;
    case 0x12uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectProductBenefitsCell];
      break;
    case 0x13uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAccountServiceMakeDefaultAtIndexPath:v8];
      break;
    case 0x14uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAccountServiceRewardsDetailsAtIndexPath:v8];
      break;
    case 0x15uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAccountServicePhysicalCardAtIndexPath:v8];
      break;
    case 0x17uLL:
      -[PKPaymentPassDetailViewController _didSelectTransitTicketAtRow:](self, "_didSelectTransitTicketAtRow:", [v8 row]);
      break;
    case 0x19uLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentMoneyActionAtRow:](self, "_didSelectPeerPaymentMoneyActionAtRow:", [v8 row]);
      break;
    case 0x1AuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:v8];
      break;
    case 0x1BuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentBankAccountsAtIndexPath:v8];
      break;
    case 0x1CuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPaymentApplicationSectionRowAtIndexPath:v8];
      break;
    case 0x1DuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPassStateSection];
      break;
    case 0x1EuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectBalanceOrCommutePlanCellAtIndexPath:v8];
      break;
    case 0x1FuLL:
      -[PKPaymentPassDetailViewController _didSelectContactBankSectionAtIndexPath:](self, "_didSelectContactBankSectionAtIndexPath:", [v8 row]);
      break;
    case 0x21uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectCardInfoCellAtIndexPath:v8];
      break;
    case 0x24uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectFamilySharingAtIndexPath:v8];
      break;
    case 0x25uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectTransactionTransactionsSwitchInTableView:v9 atIndexPath:v8];
      break;
    case 0x26uLL:
      [(PKLinkedApplication *)self->_linkedApplication openApplication:self];
      break;
    case 0x27uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectTransactionAtIndexPath:v8];
      break;
    case 0x28uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectTransactionCountByPeriodAtIndexPath:v8];
      break;
    case 0x29uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPassInGroupAtIndexPath:v8];
      break;
    case 0x2AuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectBillingAddress];
      break;
    case 0x2BuLL:
      [(PKPaymentPassDetailViewController *)self didSelectPayLaterEligibleSpendCellInTableView:v9 atIndexPath:v8];
      break;
    case 0x2CuLL:
      [(PKPaymentPassDetailViewController *)self didSelectFinancingPlanListCellInTableView:v9 atIndexPath:v8];
      break;
    case 0x2DuLL:
      [(PKPaymentPassDetailViewController *)self didSelectPersonalInformationCellInTableView:v9 atIndexPath:v8];
      break;
    case 0x2EuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectNetworkBenefitsCell];
      break;
    case 0x2FuLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentParticipantGradutionAtIndexPath:v8];
      break;
    case 0x30uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentStatementAtIndexPath:v8];
      break;
    case 0x31uLL:
      [(PKPaymentPassDetailViewController *)self didSelectVerifySSNCellInTableView:v9 atIndexPath:v8];
      break;
    case 0x32uLL:
      -[PKPaymentPassDetailViewController _didSelectPrivacySectionAtRow:](self, "_didSelectPrivacySectionAtRow:", [v8 row]);
      break;
    case 0x33uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentManualIdentityVerificationAtIndexPath:v8];
      break;
    case 0x34uLL:
      [(PKPaymentPassDetailViewController *)self didSelectAccountUserStopSharingCellInTableView:v9 atIndexPath:v8];
      break;
    case 0x35uLL:
      [(PKPaymentPassDetailViewController *)self _didSelectPassOperationsSectionAtIndexPath:v8];
      break;
    default:
      break;
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  if (PKEqualObjects())
  {
    char v2 = PKEqualObjects();

    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 48);
      [v3 _refreshDisplayWithBalances:0 plans:0 transitProperties:v4];
    }
  }
  else
  {
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentPassDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__PKPaymentPassDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasBackingData];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 40) + 1072) hasDeviceTransactionSourceIdentifier:*(void *)(a1 + 48)];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 40);
      return [v3 _startPendingTransactionTimer];
    }
  }
  return result;
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1072) hasDeviceTransactionSourceIdentifier:*(void *)(a1 + 40)])
  {
    char v2 = [*(id *)(*(void *)(a1 + 32) + 1488) objectForKey:*(void *)(a1 + 48)];
    if (v2)
    {
      [MEMORY[0x1E4F39CF8] begin];
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
      v3[3] = &unk_1E59CA7D0;
      void v3[4] = *(void *)(a1 + 32);
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v3];
      v2[2](v2, 1);
      [MEMORY[0x1E4F39CF8] commit];
      [*(id *)(*(void *)(a1 + 32) + 1488) removeObjectForKey:*(void *)(a1 + 48)];
    }
    else
    {
      [*(id *)(a1 + 32) _reloadTransactionSectionsAnimated:1 forceReload:0];
    }
  }
}

uint64_t __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTransactionSectionsAnimated:0 forceReload:0];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  if ([v3 isEqualToString:*(void *)(a1 + 40)])
  {
    char v2 = [*(id *)(*(void *)(a1 + 32) + 1144) settingSwitch];
    [v2 setEnabled:1];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  block[3] = &unk_1E59CD7B0;
  void block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  [*(id *)(a1 + 32) _cancelPendingTransactionTimer];
  if ([v2 isEqualToString:*(void *)(a1 + 40)])
  {
    id v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke_2;
      v5[3] = &unk_1E59CB6D8;
      void v5[4] = v3;
      [v3 _reloadTransactionsWithCompletion:v5];
    }
    else
    {
      [v3 reloadData:1];
      [*(id *)(a1 + 32) _reloadTransactionSectionsAnimated:1 forceReload:0];
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1152) settingSwitch];
      [v4 setEnabled:1];
    }
  }
}

void __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadPassDetailSections:&unk_1EF2BA2A8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1152) settingSwitch];
  [v2 setEnabled:1];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _refreshDisplayWithBalances:v5 plans:0 transitProperties:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _refreshDisplayWithBalances:0 plans:v5 transitProperties:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __119__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E59CB8B0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __119__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(a1 + 48), 0);
    [*(id *)(a1 + 32) _handleUpdatedBalanceReminder:*(void *)(a1 + 56) forBalanceWithIdentifier:v4];
  }
}

- (void)featureApplicationRemoved:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke_2;
  v3[3] = &unk_1E59CA7D0;
  void v3[4] = v1;
  return [v1 loadPendingAccountUserInvitationsWithCompletion:v3];
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFamilyRows];
}

- (void)featureApplicationChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke_2;
  v3[3] = &unk_1E59CA7D0;
  void v3[4] = v1;
  return [v1 loadPendingAccountUserInvitationsWithCompletion:v3];
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFamilyRows];
}

- (void)featureApplicationAdded:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke_2;
  v3[3] = &unk_1E59CA7D0;
  void v3[4] = v1;
  return [v1 loadPendingAccountUserInvitationsWithCompletion:v3];
}

uint64_t __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFamilyRows];
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKPaymentPassDetailViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __60__PKPaymentPassDetailViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 2264), obj);
    [*(id *)(a1 + 40) _updateFamilyRows];
  }
}

- (void)_reloadTransactionSourceCollectionIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:self->_pass];
  [v3 addObject:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(PKAccountUserCollection *)self->_accountUserCollection accountUsers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithAccountUser:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  id v11 = self->_transactionSourceCollection;
  id v12 = objc_alloc(MEMORY[0x1E4F850C8]);
  id v13 = (void *)[v3 copy];
  BOOL v14 = (void *)[v12 initWithTransactionSources:v13];

  if ((PKEqualObjects() & 1) == 0)
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v24 = v14;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Pass details transaction source manager has changed %@.", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_transactionSourceCollection, v14);
    resolutionController = self->_resolutionController;
    self->_resolutionController = 0;

    id v17 = (PKDashboardTransactionFetcher *)[objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:self->_transactionSourceCollection paymentDataProvider:self->_paymentServiceDataProvider];
    transactionFetcher = self->_transactionFetcher;
    self->_transactionFetcher = v17;

    [(PKPaymentPassDetailViewController *)self _reloadTransactionSectionsAnimated:1 forceReload:0];
  }
}

- (void)_reloadTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked])
  {
    [(FKBankConnectTransactionsAndGroupsProvider *)self->_bankConnectTransactionsAndGroupsProvider performFetchAndStartObservingNotifications];
  }
  else
  {
    id v5 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    [v5 paymentNetworkIdentifier];

    uint64_t v6 = PKMaxPaymentTransactionsForCredentialType();
    uint64_t v7 = dispatch_group_create();
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__65;
    v27[4] = __Block_byref_object_dispose__65;
    id v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__65;
    v25[4] = __Block_byref_object_dispose__65;
    id v26 = 0;
    dispatch_group_enter(v7);
    transactionFetcher = self->_transactionFetcher;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke;
    v22[3] = &unk_1E59CC5A8;
    unint64_t v24 = v27;
    id v9 = v7;
    id v23 = v9;
    [(PKDashboardTransactionFetcher *)transactionFetcher reloadTransactionsWithCompletion:v22];
    if (self->_peerPaymentAccount || self->_account) && (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(v9);
      id v10 = objc_alloc_init(MEMORY[0x1E4F84D28]);
      id v11 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
      [v10 setTransactionSourceIdentifiers:v11];

      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_2;
      void v18[3] = &unk_1E59DF4B8;
      long long v20 = v25;
      uint64_t v21 = v6;
      long long v19 = v9;
      [(PKPaymentDataProvider *)paymentServiceDataProvider transactionCountByPeriodForRequest:v10 calendar:v13 calendarUnit:4 includePurchaseTotal:0 completion:v18];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_3;
    block[3] = &unk_1E59D3DF0;
    void block[4] = self;
    id v16 = v27;
    id v17 = v25;
    id v15 = v4;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }
}

void __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a2;
  id v5 = [v3 sortDescriptorWithKey:@"transactionDate" ascending:0];
  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  id v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "transactionCount", (void)v12);
        if (v7 > *(void *)(a1 + 48))
        {

          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          id v11 = v3;
          id v5 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v11;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    id v5 = v3;
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _transactionSectionsDataIsChangedForNewTransactions:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) oldTransactions:*(void *)(*(void *)(a1 + 32) + 1232) newtransactionCountByPeriod:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) oldtransactionCountByPeriod:*(void *)(*(void *)(a1 + 32) + 1240)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1232), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  [*(id *)(a1 + 32) _cancelPendingTransactionTimer];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_transactionSectionsDataIsChangedForNewTransactions:(id)a3 oldTransactions:(id)a4 newtransactionCountByPeriod:(id)a5 oldtransactionCountByPeriod:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9 == v10) {
    LOBYTE(v13) = 0;
  }
  else {
    int v13 = [v9 isEqual:v10] ^ 1;
  }
  if (v11 != v12 && (v13 & 1) == 0) {
    int v13 = [v11 isEqual:v12] ^ 1;
  }

  return v13;
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentPassDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKPaymentPassDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 2224);
  if (!v2) {
    return;
  }
  id v3 = (void *)a1[5];
  uint64_t v4 = [v2 accountIdentifier];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

LABEL_8:
    [*(id *)(a1[4] + 1632) updateWithPhysicalCards:a1[6]];
    id v8 = (void *)a1[4];
    [v8 reloadSection:21];
    return;
  }
  id v9 = v6;
  if (v5 && v6)
  {
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0) {
      return;
    }
    goto LABEL_8;
  }
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKPaymentPassDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 2224);
  if (!v2) {
    return;
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v2 accountIdentifier];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

LABEL_8:
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 2120);
    *(void *)(v9 + 2120) = v8;

    [*(id *)(a1 + 32) _updateFamilyRows];
    [*(id *)(a1 + 32) _reloadTransactionSourceCollectionIfNecessary];
    id v11 = *(void **)(a1 + 32);
    [v11 _updateCashbackPeerPaymentResolutionSection];
    return;
  }
  id v12 = v6;
  if (v5 && v6)
  {
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0) {
      return;
    }
    goto LABEL_8;
  }
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__PKPaymentPassDetailViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchFinancingPlansIfNecessary];
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __100__PKPaymentPassDetailViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchFinancingPlansIfNecessary];
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentPassDetailViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__PKPaymentPassDetailViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchFinancingPlansIfNecessary];
}

- (void)_applyDefaultStaticStylingToCell:(id)a3
{
  if (self->_highlightColor)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4FB1EB0];
    id v5 = a3;
    id v6 = [v4 alloc];
    char v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v7 setBackgroundColor:self->_highlightColor];
    [v5 setSelectedBackgroundView:v7];
  }
  else
  {
    [a3 setSelectedBackgroundView:0];
  }
  PKAccessibilityIDDefaultCellSet(a3);
}

- (void)_applyDefaultDynamicStylingToCell:(id)a3
{
  id v3 = a3;
  [v3 setAccessoryType:0];
  [v3 setSelectionStyle:3];
  PKAccessibilityIDDefaultCellSet(v3);
}

- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  char v7 = [a4 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7)
  {
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"Cell"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v7];
  }
  [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v7];
  uint64_t v8 = [v7 textLabel];
  [v8 setText:0];
  [v8 setTextColor:v6];

  [v8 setNumberOfLines:0];
  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v7 setAccessoryView:0];

  return v7;
}

- (id)_value1CellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  char v7 = [a4 dequeueReusableCellWithIdentifier:@"Cell-Value1"];
  if (!v7)
  {
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"Cell-Value1"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v7];
  }
  [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v7];
  uint64_t v8 = [v7 textLabel];
  [v8 setText:0];
  [v8 setTextColor:v6];

  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v7 setAccessoryView:0];

  return v7;
}

- (id)_subtitleCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"SubtitleCell"];
  if (!v4)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"SubtitleCell"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v4];
    id v5 = [v4 textLabel];
    id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v5 setFont:v6];

    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  }
  [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v4];

  return v4;
}

- (id)_spinnerCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"spinnerCell"];
  if (!v4)
  {
    uint64_t v4 = [[PKLeftAlignedSpinnerCell alloc] initWithStyle:0 reuseIdentifier:@"spinnerCell"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v4];
    [(PKLeftAlignedSpinnerCell *)v4 setAccessoryType:0];
    [(PKLeftAlignedSpinnerCell *)v4 setUserInteractionEnabled:0];
  }

  return v4;
}

- (id)_imageViewCellForImage:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  char v7 = [a4 dequeueReusableCellWithIdentifier:@"imageViewCell"];
  if (!v7)
  {
    char v7 = [[PKImageViewCell alloc] initWithReuseIdentifier:@"imageViewCell"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v7];
    [(PKImageViewCell *)v7 setUserInteractionEnabled:0];
  }
  [(PKImageViewCell *)v7 setImage:v6];
  uint64_t v8 = objc_msgSend(v6, "pkui_firstPixelColor");

  [(PKImageViewCell *)v7 setBackgroundColor:v8];

  return v7;
}

- (id)_switchCellWithText:(id)a3 forTableView:(id)a4
{
  id v5 = a3;
  id v6 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKSettingTableCellReuseIdentifier"];
  [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v6];
  char v7 = [(PKSettingTableCell *)v6 textLabel];
  [v7 setText:v5];

  if (self->_primaryTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
    [v7 setTextColor:v8];
  }
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  return v6;
}

- (id)_disabledCellWithText:(id)a3 forTableView:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 placeholderTextColor];
  id v10 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v9 forTableView:v7];

  id v11 = [v10 textLabel];
  [v11 setText:v8];

  [v10 setSelectionStyle:0];

  return v10;
}

- (id)_linkCellWithText:(id)a3 forTableView:(id)a4
{
  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:linkTextColor forTableView:v7];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4FB1618];
    id v11 = a4;
    id v12 = a3;
    id v7 = [v10 systemBlueColor];
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v7 forTableView:v11];
  }
  int v13 = [v9 textLabel];
  [v13 setText:a3];

  return v9;
}

- (id)_checkmarkCellWithText:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:primaryTextColor forTableView:v7];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v10 forTableView:v7];
  }
  id v11 = [v9 textLabel];
  [v11 setText:v6];

  if (self->_linkTextColor) {
    objc_msgSend(v9, "setTintColor:");
  }

  return v9;
}

- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4
{
  detailTextColor = self->_detailTextColor;
  if (detailTextColor)
  {
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:detailTextColor forTableView:v7];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4FB1618];
    id v11 = a4;
    id v12 = a3;
    id v7 = [v10 secondaryLabelColor];
    uint64_t v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v7 forTableView:v11];
  }
  int v13 = [v9 textLabel];
  [v13 setText:a3];

  [v9 setSelectionStyle:0];

  return v9;
}

- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  id v10 = NSString;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  long long v14 = objc_msgSend(v10, "stringWithFormat:", @"CellStyle-%ld", a5);
  long long v15 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v13 detailText:v12 cellStyle:a5 reuseIdentifier:v14 forTableView:v11];

  return v15;
}

- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 reuseIdentifier:(id)a6 forTableView:(id)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  long long v15 = [a7 dequeueReusableCellWithIdentifier:v12];
  if (!v15)
  {
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:a5 reuseIdentifier:v12];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v15];
  }
  [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v15];
  id v16 = [v15 textLabel];
  [v16 setText:v14];

  if (self->_primaryTextColor)
  {
    objc_msgSend(v16, "setTextColor:");
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4FB1618] labelColor];
    [v16 setTextColor:v17];
  }
  [v16 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  long long v18 = [v15 detailTextLabel];
  [v18 setLineBreakMode:4];
  [v18 setText:v13];

  if (self->_detailTextColor)
  {
    objc_msgSend(v18, "setTextColor:");
  }
  else
  {
    long long v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v18 setTextColor:v19];
  }
  [v18 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  return v15;
}

- (id)_stackedInfoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [a6 dequeueReusableCellWithIdentifier:@"StackedInfoCellIdentifier"];
  if (!v12)
  {
    id v12 = [[PKStackedLabelCell alloc] initWithStyle:a5 reuseIdentifier:@"StackedInfoCellIdentifier"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v12];
    if (self->_primaryTextColor)
    {
      -[PKStackedLabelCell setTitleTextColor:](v12, "setTitleTextColor:");
    }
    else
    {
      id v13 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKStackedLabelCell *)v12 setTitleTextColor:v13];
    }
    if (self->_detailTextColor)
    {
      -[PKStackedLabelCell setDetailTextColor:](v12, "setDetailTextColor:");
    }
    else
    {
      id v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKStackedLabelCell *)v12 setDetailTextColor:v14];
    }
  }
  [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v12];
  [(PKStackedLabelCell *)v12 setTitleText:v11];

  [(PKStackedLabelCell *)v12 setDetailText:v10];

  return v12;
}

- (id)_familyMemberCellWithRowModel:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = [a4 dequeueReusableCellWithIdentifier:@"familyMemberCell"];
  if (!v7)
  {
    id v7 = [[PKFamilyMemberTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"familyMemberCell"];
    id v8 = [(PKFamilyMemberTableViewCell *)v7 textLabel];
    uint64_t v9 = v8;
    if (self->_primaryTextColor)
    {
      objc_msgSend(v8, "setTextColor:");
    }
    else
    {
      id v10 = [MEMORY[0x1E4FB1618] labelColor];
      [v9 setTextColor:v10];
    }
    id v11 = [(PKFamilyMemberTableViewCell *)v7 detailTextLabel];
    id v12 = v11;
    if (self->_detailTextColor)
    {
      objc_msgSend(v11, "setTextColor:");
    }
    else
    {
      id v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v12 setTextColor:v13];
    }
  }
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F85548]);
  [(PKFamilyMemberTableViewCell *)v7 setRowModel:v6];

  return v7;
}

- (id)_widgetCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"PassActionWidgetCell"];
  if (!v4)
  {
    uint64_t v4 = [[PKPassDetailButtonsCell alloc] initWithReuseIdentifier:@"PassActionWidgetCell" widgetViewStyle:self->_detailViewStyle != 0];
    [(PKPassDetailButtonsCell *)v4 setDelegate:self];
  }
  objc_storeStrong((id *)&self->_widgetCell, v4);
  [(PKPassDetailButtonsCell *)v4 setPaymentPass:self->_pass];
  if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked]) {
    [(PKPassDetailButtonsCell *)v4 setBankConnectAccount:self->_bankConnectAccount];
  }
  if (self->_account) {
    -[PKPassDetailButtonsCell setAccount:](v4, "setAccount:");
  }
  if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
  {
    id v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    id v6 = [v5 account];
    id v7 = [v6 associatedPassUniqueID];
    id v8 = [(PKPaymentPass *)self->_pass uniqueID];
    int v9 = [v7 isEqualToString:v8];

    if (v9) {
      [(PKPassDetailButtonsCell *)v4 setPeerPaymentAccount:self->_peerPaymentAccount];
    }
  }
  id v10 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
  [(PKPassDetailButtonsCell *)v4 setCurrentUser:v10];

  return v4;
}

- (id)_linkedAppCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"PKLinkedAppViewReuseIdentifier"];
  if (!v4)
  {
    uint64_t v4 = [[PKLinkedAppView alloc] initWithLinkedApplication:self->_linkedApplication reuseIdentifier:@"PKLinkedAppViewReuseIdentifier"];
    id v5 = [(PKLinkedAppView *)v4 linkedAppView];
    [v5 setDelegate:self];

    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v4];
  }
  if (self->_detailViewStyle == 2)
  {
    id v6 = PKBridgeTextColor();
    [(PKLinkedAppView *)v4 setMainLabelColor:v6];

    id v7 = PKBridgeAltTextColor();
    [(PKLinkedAppView *)v4 setSubTextLabelColor:v7];

    id v8 = BPSBridgeTintColor();
    [(PKLinkedAppView *)v4 setButtonTintColor:v8];
  }

  return v4;
}

- (id)_linkedApplicationCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"LinkedAppActionCell"];
  if (!v4)
  {
    uint64_t v4 = [[PKLinkedApplicationActionCell alloc] initWithLinkedApplication:self->_linkedApplication reuseIdentifier:@"LinkedAppActionCell"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v4];
    [(PKLinkedApplicationActionCell *)v4 setTextColor:self->_linkTextColor];
    id v5 = [MEMORY[0x1E4F92E40] appearance];
    id v6 = [v5 altTextColor];
    [(PKLinkedApplicationActionCell *)v4 setDisabledTextColor:v6];
  }
  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E4F85688]);

  return v4;
}

- (id)_moreTransactionsCellForTableView:(id)a3
{
  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    id v5 = a3;
    id v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:linkTextColor forTableView:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4FB1618];
    id v8 = a3;
    id v5 = [v7 systemBlueColor];
    id v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v5 forTableView:v8];
  }
  int v9 = [v6 textLabel];
  id v10 = PKLocalizedPaymentString(&cfstr_TransactionsMo.isa);
  [v9 setText:v10];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85AF0]];

  return v6;
}

- (id)_billingAddressCellShowingAddress:(BOOL)a3 forTableView:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_account)
  {
    id v7 = [MEMORY[0x1E4F84B40] defaults];
    id v8 = [v7 defaultBillingAddressForPaymentPass:self->_pass];
    billingContact = self->_billingContact;
    self->_billingContact = v8;
  }
  id v10 = self->_billingContact;
  if (v10) {
    BOOL v11 = !v4;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v13 = PKLocalizedPaymentString(&cfstr_SettingsTransa_6.isa);
    id v12 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v13 detailText:0 cellStyle:0 reuseIdentifier:@"BillingAddress" forTableView:v6];
  }
  else
  {
    id v12 = [(PKPaymentPassDetailViewController *)self _subtitleCellForTableView:v6];
    id v13 = [(CNContact *)v10 pkSingleLineFormattedContactAddress];
    id v14 = [(CNContact *)v10 pk_displayName];
    if (![v14 length])
    {
      uint64_t v15 = PKLocalizedPaymentString(&cfstr_SettingsTransa_5.isa);

      id v14 = (void *)v15;
    }
    id v16 = [v12 textLabel];
    [v16 setText:v14];

    if (self->_primaryTextColor)
    {
      uint64_t v17 = [v12 textLabel];
      [v17 setTextColor:self->_primaryTextColor];
    }
    long long v18 = [v12 detailTextLabel];
    [v18 setText:v13];

    long long v19 = [v12 detailTextLabel];
    long long v20 = v19;
    if (self->_detailTextColor)
    {
      objc_msgSend(v19, "setTextColor:");
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v20 setTextColor:v21];
    }
  }

  [v12 setAccessoryType:1];
  [v12 setAccessibilityIdentifier:*MEMORY[0x1E4F852F0]];

  return v12;
}

- (void)_didSelectBillingAddress
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke;
    aBlock[3] = &unk_1E59CE0A0;
    objc_copyWeak(&v34, &location);
    void aBlock[4] = self;
    id v5 = _Block_copy(aBlock);
    id v6 = [[PKAccountServiceBillingAddressViewController alloc] initWithBillingAddress:self->_billingContact account:self->_account accountService:self->_accountService detailViewStyle:self->_detailViewStyle handler:v5];
    id v7 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v7 pushViewController:v6 animated:1];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v9 = [MEMORY[0x1E4F84B40] defaults];
    id v10 = [v9 defaultBillingAddressForPaymentPass:self->_pass];
    [v8 safelyAddObject:v10];

    uint64_t v26 = PKLocalizedPaymentString(&cfstr_SettingsOption_2.isa);
    id v28 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_26.isa);
    id v11 = objc_alloc(MEMORY[0x1E4F84B88]);
    if ([v8 count]) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v13 = objc_msgSend(v11, "initWithTitle:preferences:selectedIndex:readOnly:", v28, v8, v12, 0, v26);
    id v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_27.isa);
    [v13 setAddNewTitle:v14];

    uint64_t v15 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_28.isa);
    [v13 setAddExistingTitle:v15];

    id v16 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_29.isa);
    [v13 setEditExistingTitle:v16];

    [v13 setContactKey:*MEMORY[0x1E4F1AF10]];
    [v13 mergeRecentsAndMeCard];
    [v13 setType:0];
    if (![v8 count] || self->_account) {
      [v13 setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    PKContactFormatAssignFormatErrorsToPreferenceContact();
    uint64_t v17 = self->_pass;
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_2;
    v29[3] = &unk_1E59D1C20;
    objc_copyWeak(&v32, &location);
    id v18 = v13;
    id v30 = v18;
    long long v19 = v17;
    BOOL v31 = v19;
    long long v20 = _Block_copy(v29);
    if (self->_detailViewStyle == 2) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
    long long v22 = [PKPaymentPreferencesListViewController alloc];
    v36[0] = v18;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    unint64_t v24 = [(PKPaymentPreferencesListViewController *)v22 initWithPreferences:v23 title:v27 style:v21 handler:v20 contactFormatValidator:self->_contactFormatValidator];

    id v25 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v25 pushViewController:v24 animated:1];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1768), a2);
    [WeakRetained _reloadPassAndView];
  }
}

void __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unint64_t v3 = [*(id *)(a1 + 32) selectedIndex];
    uint64_t v4 = [*(id *)(a1 + 32) preferences];
    unint64_t v5 = [v4 count];

    if (v3 >= v5)
    {
      id v7 = [MEMORY[0x1E4F84B40] defaults];
      id v8 = [MEMORY[0x1E4F84B40] defaults];
      int v9 = [v8 defaultBillingAddressForPaymentPass:*(void *)(a1 + 40)];
      [v7 deleteDefaultBillingAddress:v9];
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) preferences];
      id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));

      id v8 = [MEMORY[0x1E4F84B40] defaults];
      [v8 setDefaultBillingAddress:v7 forPaymentPass:*(void *)(a1 + 40)];
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_3;
    block[3] = &unk_1E59CA7D0;
    id v11 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPassAndView];
}

- (id)_privacyTermsSectionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v7 = a4;
  unint64_t v8 = [(PKPaymentPassDetailViewController *)self _privacyTermsInfoRowTypeForRowIndex:a3];
  if (v8)
  {
    if (v8 == 2)
    {
      id v11 = PKLocalizedPaymentString(&cfstr_TermsButtonTex.isa);
      account = self->_account;
      if (account && [(PKAccount *)account feature] == 3)
      {
        uint64_t v13 = PKLocalizedCocoonString(&cfstr_PrivacyAndTerm.isa);

        id v11 = (void *)v13;
      }
      uint64_t v4 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v11 forTableView:v7];
      if (self->_loadingAccountTermsAndConditions)
      {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [v14 startAnimating];
        [v4 setAccessoryView:v14];
      }
      PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E4F85AA0]);
    }
    else if (v8 == 1)
    {
      int v9 = PKLocalizedPaymentString(&cfstr_PrivacyButtonT.isa);
      uint64_t v4 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v9 forTableView:v7];

      PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E4F85880]);
    }
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_error_impl(&dword_19F450000, v10, OS_LOG_TYPE_ERROR, "Unknown privacy terms info row!", v16, 2u);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_numberOfPrivacyTermsInfoRows
{
  BOOL v3 = [(PKPaymentPassDetailViewController *)self _shouldShowPrivacyPolicyCell];
  BOOL v4 = [(PKPaymentPassDetailViewController *)self _shouldShowTermsCell];
  unint64_t v5 = 1;
  if (v3) {
    unint64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return v3;
  }
}

- (unint64_t)_privacyTermsInfoRowTypeForRowIndex:(int64_t)a3
{
  if ([(PKPaymentPassDetailViewController *)self _shouldShowPrivacyPolicyCell])
  {
    unint64_t v5 = 1;
    if (!a3) {
      return v5;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ([(PKPaymentPassDetailViewController *)self _shouldShowTermsCell] && v5 == a3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (unint64_t)_rowIndexForPrivacyTermsInfoRowType:(unint64_t)a3
{
  unint64_t v5 = [(PKPaymentPassDetailViewController *)self _numberOfPrivacyTermsInfoRows];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  while ([(PKPaymentPassDetailViewController *)self _privacyTermsInfoRowTypeForRowIndex:v7] != a3)
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (void)_didSelectPrivacySectionAtRow:(int64_t)a3
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPaymentPassDetailViewController *)self presentViewController:v10 animated:1 completion:0];

    return;
  }
  unint64_t v5 = [(PKPaymentPassDetailViewController *)self _privacyTermsInfoRowTypeForRowIndex:a3];
  if (!v5)
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19F450000, v9, OS_LOG_TYPE_ERROR, "Selected unknown privacy section row!", buf, 2u);
    }
    goto LABEL_18;
  }
  if (v5 == 2)
  {
    if (![(PKPaymentPassDetailViewController *)self _shouldShowTermsCell]) {
      return;
    }
    [(PKPaymentPassDetailViewController *)self _presentTermsAndConditionsWithRow:a3];
    int v9 = (id)*MEMORY[0x1E4F86D20];
    if (!v9) {
      return;
    }
    goto LABEL_17;
  }
  if (v5 == 1
    && [(PKPaymentPassDetailViewController *)self _shouldShowPrivacyPolicyCell])
  {
    unint64_t v6 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A70]];
    unint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    if (v7)
    {
      unint64_t v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v8 openURL:v7 configuration:0 completionHandler:0];
    }
    int v9 = (id)*MEMORY[0x1E4F86AF8];

    if (v9)
    {
LABEL_17:
      [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:v9 additionalAnalytics:0];
LABEL_18:
    }
  }
}

- (void)_presentLegalDisclosureViewController
{
  BOOL v4 = [[PKAccountLegalDisclosureViewController alloc] initWithFeature:[(PKPaymentPassDetailViewController *)self _accountFeature]];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [(PKPaymentPassDetailViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)presentTermsAndConditions
{
  unint64_t v3 = [(PKPaymentPassDetailViewController *)self _rowIndexForPrivacyTermsInfoRowType:2];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_error_impl(&dword_19F450000, v4, OS_LOG_TYPE_ERROR, "Attempted to present terms and conditions, but no terms row was found!", v5, 2u);
    }
  }
  else
  {
    [(PKPaymentPassDetailViewController *)self _presentTermsAndConditionsWithRow:v3];
  }
}

- (void)_presentTermsAndConditionsWithRow:(unint64_t)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  account = self->_account;
  if (account)
  {
    unint64_t v6 = [(PKAccount *)account creditDetails];
    unint64_t v7 = [v6 termsIdentifier];

    if (v7)
    {
      if (!self->_loadingAccountTermsAndConditions)
      {
        self->_loadingAccountTermsAndConditions = 1;
        unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", @"PrivacyTermsInfo"));
        int v9 = [(PKPaymentPassDetailViewController *)self tableView];
        id v10 = [v9 cellForRowAtIndexPath:v8];

        [(PKPaymentPassDetailViewController *)self _showSpinner:1 inCell:v10 overrideTextColor:0];
        id v11 = [PKAccountTermsAndConditionsController alloc];
        int64_t detailViewStyle = self->_detailViewStyle;
        uint64_t v13 = 3;
        if (detailViewStyle != 1) {
          uint64_t v13 = 0;
        }
        if (detailViewStyle == 2) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = v13;
        }
        uint64_t v15 = [(PKAccountTermsAndConditionsController *)v11 initWithAccount:self->_account webService:self->_webService context:v14 termsIdentifier:v7];
        termsController = self->_termsController;
        self->_termsController = v15;

        objc_initWeak(location, self);
        uint64_t v17 = self->_termsController;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke;
        v24[3] = &unk_1E59CB9C8;
        objc_copyWeak(&v25, location);
        [(PKAccountTermsAndConditionsController *)v17 termsViewControllerWithCompletion:v24];
        objc_destroyWeak(&v25);
        objc_destroyWeak(location);
      }
      return;
    }
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [(PKAccount *)self->_account accountIdentifier];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);
    }
    goto LABEL_18;
  }
  if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount termsAcceptanceRequired])
  {
LABEL_18:
    long long v20 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A80]];
    uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
    if (v21)
    {
      long long v22 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v22 openURL:v21 configuration:0 completionHandler:0];
    }
    return;
  }
  id v23 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  [v23 updateAccountWithCompletion:&__block_literal_global_857];
}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      unint64_t v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      if (!v9)
      {
LABEL_7:
        WeakRetained[1660] = 0;
        [WeakRetained reloadSection:50];
        goto LABEL_8;
      }
      id v7 = [WeakRetained navigationController];
      [v7 presentViewController:v9 animated:1 completion:0];
    }

    goto LABEL_7;
  }
LABEL_8:
}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke_854(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      unint64_t v3 = NSNumber;
      BOOL v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
    }
    else
    {
      id v5 = &unk_1EF2B9B40;
    }
    unint64_t v6 = [MEMORY[0x1E4F84E00] sharedInstance];
    [v6 presentPeerPaymentTermsAndConditionsWithAccount:v2 orientation:v5 completion:&__block_literal_global_864];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }
}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke_862()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }
}

- (void)_didSelectPassOperationsSectionAtIndexPath:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 row];
  if ([(PKPaymentPassDetailViewController *)self _shouldShowTransferCell])
  {
    if (!v4) {
      [(PKPaymentPassDetailViewController *)self _didSelectTransferCardAtIndexPath:v6];
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (v5 == v4) {
    [(PKPaymentPassDetailViewController *)self _didSelectDeleteCard];
  }
}

- (BOOL)_showExpressDetails
{
  return ([(PKPaymentPass *)self->_pass isAccessPass] & 1) == 0 && self->_nfcExpressModeSupported;
}

- (BOOL)paymentApplicationShouldShowFullDPAN:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sanitizedDPAN];
  if (v5)
  {
    id v6 = [v4 appletDataFormat];
    if (PKEqualObjects())
    {
      char v7 = 1;
    }
    else
    {
      unint64_t v8 = [v4 appletDataFormat];
      if (PKEqualObjects())
      {
        char v7 = 1;
      }
      else
      {
        id v9 = [v4 appletDataFormat];
        if (PKEqualObjects() & 1) != 0 || ([(PKPaymentPass *)self->_pass isEMoneyPass]) {
          char v7 = 1;
        }
        else {
          char v7 = [(PKPaymentPass *)self->_pass isSuicaPass];
        }
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if (self->_peerPaymentAccount)
  {
    unint64_t v9 = 0;
    goto LABEL_34;
  }
  id v10 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A28]];
  id v11 = [v10 value];
  if (v11)
  {
    uint64_t v12 = 1;
    if (a3 && !a4)
    {
      if (PKHandsOnDemoModeEnabled()
        && (PKFakeCardholderName(),
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 length],
            v13,
            v14))
      {
        PKFakeCardholderName();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = v11;
      }
      id v16 = v15;
      uint64_t v17 = PKLocalizedPaymentString(&cfstr_CardInfoName.isa);
      id v18 = -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v16, [v10 cellStyle], v8);
      id v19 = *a3;
      *a3 = v18;

      [*a3 setAccessibilityIdentifier:*MEMORY[0x1E4F85370]];
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v20 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  uint64_t v21 = PKLocalizedPaymentString(&cfstr_CardInfoNumber.isa);
  uint64_t v68 = v11;
  if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
  {
    [(PKPaymentPass *)self->_pass organizationName];
    id v22 = v8;
    id v23 = a3;
    unint64_t v24 = v20;
    int64_t v25 = a4;
    uint64_t v26 = v12;
    uint64_t v27 = v10;
    NSUInteger v29 = v28 = (void *)v21;
    uint64_t v30 = PKLocalizedAquamanString(&cfstr_PassInfoAccoun.isa, &stru_1EF1B4C70.isa, v29);

    id v10 = v27;
    uint64_t v12 = v26;
    a4 = v25;
    long long v20 = v24;
    a3 = v23;
    id v8 = v22;

    uint64_t v21 = v30;
  }
  id v71 = (void *)v21;
  if (![(PKPaymentPass *)self->_pass isSuicaPass])
  {
    if (![(PKPaymentPass *)self->_pass isOctopusPass]) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v37 = PKSanitizedDeviceAccountNumberForPaymentApplication();
    goto LABEL_21;
  }
  uint64_t v31 = [v20 sanitizedDPAN];
  if (!v31) {
    goto LABEL_20;
  }
  id v32 = (void *)v31;
  char v33 = [(PKPaymentPass *)self->_pass isOctopusPass];

  if (v33) {
    goto LABEL_20;
  }
LABEL_17:
  if (![(PKPaymentPassDetailViewController *)self paymentApplicationShouldShowFullDPAN:v20])
  {
    if ([(PKPaymentPassDetailViewController *)self _shouldShowCardNumbersSection])
    {
LABEL_52:
      int v35 = 0;
      goto LABEL_22;
    }
    char v65 = [(PKPaymentPass *)self->_pass primaryAccountNumberSuffix];
    if (v65
      || ([(PKPaymentPass *)self->_pass sanitizedPrimaryAccountNumber],
          (char v65 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      double v66 = [(PKPaymentPass *)self->_pass sanitizedPrimaryAccountName];

      if (!v66) {
        goto LABEL_52;
      }
    }
    uint64_t v37 = PKSanitizedPrimaryAccountRepresentationForPass();
LABEL_21:
    int v35 = (void *)v37;
    goto LABEL_22;
  }
  id v34 = [v20 sanitizedDPAN];
  int v35 = PKFormattedSanitizedPAN();

  uint64_t v36 = PKLocalizedPaymentString(&cfstr_CardInfoDigita.isa);

  id v71 = (void *)v36;
LABEL_22:
  id v67 = v10;
  uint64_t v38 = [v35 length];
  id v69 = v8;
  int64_t v70 = a4;
  if (v38)
  {
    uint64_t v39 = v12 + 1;
    if (a3 && v12 == a4)
    {
      uint64_t v40 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v71 detailText:v35 cellStyle:1 reuseIdentifier:@"cardNumberCell" forTableView:v8];
      uint64_t v41 = [v40 detailTextLabel];
      [v41 setAdjustsFontSizeToFitWidth:1];

      uint64_t v42 = v20;
      id v43 = *a3;
      *a3 = v40;
      id v44 = v40;

      long long v20 = v42;
      [*a3 setAccessibilityIdentifier:*MEMORY[0x1E4F85360]];
    }
  }
  else
  {
    uint64_t v39 = v12;
  }
  uint64_t v45 = [(PKPaymentPass *)self->_pass customerServiceIdentifier];
  BOOL v46 = (void *)v45;
  if (v38 || !v45)
  {
    int v47 = v20;
    unint64_t v9 = v39;
  }
  else
  {
    int v47 = v20;
    unint64_t v9 = v39 + 1;
    if (a3 && v39 == v70)
    {
      uint64_t v48 = PKPassLocalizedStringWithFormat();
      char v49 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v48, v46, 1, @"PKTableViewCellReuseIdentifierCustomerServiceIdentifier", v69, 0 detailText cellStyle reuseIdentifier forTableView];

      char v50 = [v49 detailTextLabel];
      [v50 setAdjustsFontSizeToFitWidth:1];

      id v51 = *a3;
      *a3 = v49;
      id v52 = v49;

      [*a3 setAccessibilityIdentifier:*MEMORY[0x1E4F859C0]];
    }
  }

  id v8 = v69;
  a4 = v70;
LABEL_34:
  if ([(PKPaymentPassDetailViewController *)self _showExpressDetails])
  {
    int64_t detailViewStyle = self->_detailViewStyle;
    if (a3)
    {
      if (v9 == a4)
      {
        uint64_t v54 = PKLocalizedPaymentString(&cfstr_ExpressTransit.isa);
        if (self->_nfcExpressModeEnabled) {
          v55 = @"EXPRESS_MODE_STATE_ON";
        }
        else {
          v55 = @"EXPRESS_MODE_STATE_OFF";
        }
        id v56 = PKLocalizedPaymentString(&v55->isa);
        char v57 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v54 detailText:v56 cellStyle:1 reuseIdentifier:@"expressState" forTableView:v8];
        id v58 = *a3;
        *a3 = v57;

        if (detailViewStyle) {
          [*a3 setAccessoryType:1];
        }
        [*a3 setAccessibilityIdentifier:*MEMORY[0x1E4F85538]];
      }
      unint64_t v59 = v9 + 1;
      if (!detailViewStyle)
      {
        unint64_t v59 = v9 + 2;
        if (v9 + 1 == a4)
        {
          uint64_t v60 = PKLocalizedPaymentString(&cfstr_ExpressTransit_0.isa);
          int v61 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v60 forTableView:v8];
          id v62 = *a3;
          *a3 = v61;

          [*a3 setAccessibilityIdentifier:*MEMORY[0x1E4F85540]];
        }
      }
    }
    else
    {
      uint64_t v63 = 1;
      if (!detailViewStyle) {
        uint64_t v63 = 2;
      }
      unint64_t v59 = v63 + v9;
    }
  }
  else
  {
    unint64_t v59 = v9;
  }

  return v59;
}

- (unint64_t)_accessPersonInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A28]];
  id v10 = [v9 value];
  if (!v10)
  {
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = 1;
  if (a3 && !a4)
  {
    if (PKHandsOnDemoModeEnabled()
      && (PKFakeCardholderName(),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 length],
          v12,
          v13))
    {
      PKFakeCardholderName();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v10;
    }
    id v15 = v14;
    if (self->_isAppleAccess)
    {
      id v16 = @"EMPLOYEE_INFO_CARDHOLDER_NAME";
    }
    else
    {
      id v18 = [v9 label];

      if (v18)
      {
        uint64_t v17 = [v9 label];
        goto LABEL_14;
      }
      id v16 = @"ACCESS_CARDHOLDER_NAME";
    }
    uint64_t v17 = PKLocalizedPaymentString(&v16->isa);
LABEL_14:
    id v19 = (void *)v17;
    long long v20 = -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v15, [v9 cellStyle], v8);
    id v21 = *a3;
    *a3 = v20;

    uint64_t v11 = 1;
  }
LABEL_15:
  id v22 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A38]];
  id v23 = [v22 value];
  uint64_t v38 = v10;
  uint64_t v40 = v9;
  unint64_t v24 = v8;
  if (v23)
  {
    unint64_t v25 = v11 + 1;
    if (a3 && v11 == a4)
    {
      uint64_t v26 = objc_msgSend(v22, "label", v38, v9);
      if (self->_isAppleAccess) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = [v22 cellStyle];
      }
      id v28 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v26 detailText:v23 cellStyle:v27 forTableView:v24];
      id v29 = *a3;
      *a3 = v28;
    }
  }
  else
  {
    unint64_t v25 = v11;
  }
  uint64_t v30 = -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E4F87A30], v38);
  uint64_t v31 = [v30 value];
  if (v31)
  {
    unint64_t v32 = v25 + 1;
    if (a3 && v25 == a4)
    {
      if (self->_isAppleAccess) {
        PKLocalizedPaymentString(&cfstr_EmployeeInfoCa_0.isa);
      }
      else {
      char v33 = [v30 label];
      }
      if (self->_isAppleAccess) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = [v30 cellStyle];
      }
      int v35 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v33 detailText:v31 cellStyle:v34 forTableView:v24];
      id v36 = *a3;
      *a3 = v35;
    }
  }
  else
  {
    unint64_t v32 = v25;
  }

  return v32;
}

- (id)_cardHolderPictureCellForTableView:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1818];
  pass = self->_pass;
  id v6 = a3;
  char v7 = [(PKPaymentPass *)pass cardHolderPicture];
  id v8 = [v4 imageWithPKImage:v7];
  unint64_t v9 = [(PKPaymentPassDetailViewController *)self _imageViewCellForImage:v8 forTableView:v6];

  return v9;
}

- (id)_cellForField:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 label];
  unint64_t v9 = [v7 value];
  id v10 = -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v8, v9, [v7 cellStyle], v6);

  LODWORD(self) = [v7 isDrillInField];
  if (self) {
    [v10 setAccessoryType:1];
  }
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F85378]);

  return v10;
}

- (id)_renewActionForRow:(unint64_t)a3 commutePlanIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(PKPaymentPassDetailViewController *)self _availableCommutePlanActions];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_33;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v27;
  id v10 = (id)*MEMORY[0x1E4F875C8];
  if (v5) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  char v12 = !v11;
  char v24 = v12;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
      if ([v14 type] == 2)
      {
        id v15 = v10;
        id v16 = v5;
        uint64_t v17 = v16;
        if (v10 != v5)
        {
          if (v24)
          {
            uint64_t v18 = [v15 caseInsensitiveCompare:v16];

            if (!v18) {
              goto LABEL_25;
            }
          }
          else
          {
          }
          id v19 = [v14 associatedPlanIdentifier];
          id v20 = v17;
          uint64_t v17 = v20;
          if (v19 != v20)
          {
            if (v5 && v19)
            {
              uint64_t v21 = [v19 caseInsensitiveCompare:v20];

              if (v21) {
                goto LABEL_27;
              }
LABEL_25:
              id v19 = v8;
              id v8 = v14;
            }
            else
            {
            }
            goto LABEL_27;
          }
        }
        goto LABEL_25;
      }
LABEL_27:
      ++v13;
    }
    while (v7 != v13);
    uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    uint64_t v7 = v22;
  }
  while (v22);
LABEL_33:

  return v8;
}

- (id)_topUpActionForRow:(unint64_t)a3
{
  id v4 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_displayableBalanceFields count] <= a3)
  {
    id v34 = 0;
    goto LABEL_56;
  }
  id v5 = [(NSArray *)v4->_displayableBalanceFields objectAtIndexedSubscript:a3];
  [v5 foreignReferenceIdentifiers];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v7)
  {
    id v34 = 0;
    goto LABEL_55;
  }
  uint64_t v8 = *(void *)v49;
  uint64_t v9 = (void *)*MEMORY[0x1E4F87980];
  id v40 = v6;
  uint64_t v41 = v5;
  uint64_t v36 = *(void *)v49;
  uint64_t v37 = v4;
  id v43 = (void *)*MEMORY[0x1E4F87980];
  do
  {
    uint64_t v10 = 0;
    uint64_t v39 = v7;
    do
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(v6);
      }
      BOOL v11 = *(void **)(*((void *)&v48 + 1) + 8 * v10);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      char v12 = [(PKPaymentPassDetailViewController *)v4 _availableActions];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (!v13) {
        goto LABEL_44;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      if (v9) {
        BOOL v16 = v11 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      char v17 = !v16;
      char v42 = v17;
      uint64_t v38 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          id v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v19 type] == 1)
          {
            id v20 = v11;
            uint64_t v21 = v43;
            if (v43 == v11) {
              goto LABEL_53;
            }
            if (v42)
            {
              uint64_t v22 = [v43 caseInsensitiveCompare:v20];

              if (!v22) {
                goto LABEL_54;
              }
            }
            else
            {
            }
          }
          if ([v19 featured])
          {
            id v23 = [v19 associatedEnteredValueIdentifier];

            if (!v23) {
              goto LABEL_54;
            }
          }
          id v24 = [v19 relevantPropertyIdentifier];
          id v25 = v11;
          long long v26 = v25;
          if (v24 == v25)
          {
            id v24 = v25;
            goto LABEL_51;
          }
          if (v11 && v24)
          {
            uint64_t v27 = [v24 caseInsensitiveCompare:v25];

            if (!v27) {
              goto LABEL_52;
            }
          }
          else
          {
          }
          id v28 = [v19 associatedEnteredValueIdentifier];
          id v29 = v26;
          uint64_t v30 = v29;
          if (v28 == v29)
          {

LABEL_51:
LABEL_52:
            uint64_t v21 = v24;
LABEL_53:

LABEL_54:
            id v34 = v19;

            id v6 = v40;
            id v5 = v41;
            goto LABEL_55;
          }
          if (v11 && v28)
          {
            uint64_t v31 = [v28 caseInsensitiveCompare:v29];

            if (!v31) {
              goto LABEL_54;
            }
          }
          else
          {
          }
          if ([v19 type] == 1)
          {
            unint64_t v32 = [v19 relevantPropertyIdentifier];
            if (v32)
            {
            }
            else
            {
              char v33 = [v19 associatedEnteredValueIdentifier];

              if (!v33) {
                goto LABEL_54;
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
        id v6 = v40;
        id v5 = v41;
        uint64_t v8 = v36;
        id v4 = v37;
        uint64_t v9 = v43;
        uint64_t v10 = v38;
        if (v14) {
          continue;
        }
        break;
      }
LABEL_44:

      ++v10;
    }
    while (v10 != v39);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    id v34 = 0;
  }
  while (v7);
LABEL_55:

LABEL_56:

  return v34;
}

- (id)_balanceForRow:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_displayableBalanceFields objectAtIndexedSubscript:a3];
  id v5 = [v4 foreignReferenceIdentifiers];
  if (v5)
  {
    id v6 = [(NSDictionary *)self->_balances objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_balanceOrCommutePlanCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  displayableBalanceFields = self->_displayableBalanceFields;
  id v7 = a4;
  uint64_t v8 = [(NSArray *)displayableBalanceFields count];
  if (a3 >= v8) {
    [(PKPaymentPassDetailViewController *)self _commuterRouteCellForRowIndex:a3 - v8 tableView:v7];
  }
  else {
  uint64_t v9 = [(PKPaymentPassDetailViewController *)self _balanceCellForRowIndex:a3 tableView:v7];
  }

  return v9;
}

- (id)_commuterRouteCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableCommutePlans];
  if ([v7 count] <= (unint64_t)a3)
  {
    char v17 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = [v7 objectAtIndex:a3];
  char v9 = [v8 properties];
  uint64_t v10 = [v8 title];
  BOOL v11 = [v10 label];
  char v12 = [v10 value];
  if (PKCommutePlanFieldEitherLabelOrValueIsEmpty())
  {
LABEL_14:
    if ((v9 & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  id v28 = v10;
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_14;
  }
  uint64_t v15 = v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    int v27 = [v13 isEqualToString:v14];

    uint64_t v10 = v28;
    if (!v27)
    {
      if ((v9 & 4) != 0) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }

  uint64_t v10 = v28;
  if ((v9 & 4) != 0)
  {
LABEL_15:
    uint64_t v18 = [v8 passFieldForKey:*MEMORY[0x1E4F87F20]];
    if ((unint64_t)([v18 foreignReferenceType] - 1) <= 1)
    {
      id v29 = v10;
      transitBalanceModel = self->_transitBalanceModel;
      id v20 = [v18 foreignReferenceIdentifiers];
      uint64_t v21 = [(PKTransitBalanceModel *)transitBalanceModel balanceForIdentifiers:v20];

      uint64_t v22 = [v21 formattedValue];

      uint64_t v10 = v29;
      char v12 = (void *)v22;
    }
  }
LABEL_18:
  PKCommutePlanFormatTitleFromLabelAndValue();
  id v23 = v11;

  id v24 = v12;
  char v17 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v24 detailText:v23 cellStyle:1 forTableView:v6];

  id v25 = [(PKPaymentPassDetailViewController *)self _actionForCommutePlan:v8];
  objc_msgSend(v17, "setAccessoryType:", -[PKPaymentPassDetailViewController _commutePlanIsSelectable:action:](self, "_commutePlanIsSelectable:action:", v8, v25));
  PKAccessibilityIDCellSet(v17, (void *)*MEMORY[0x1E4F853A8]);

LABEL_19:

  return v17;
}

- (id)_balanceCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  if ([(NSArray *)self->_displayableBalanceFields count] <= a3)
  {
    uint64_t v15 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_displayableBalanceFields objectAtIndexedSubscript:a3];
    uint64_t v8 = NSString;
    char v9 = [v7 label];
    uint64_t v10 = [v7 value];
    BOOL v11 = [v8 stringWithFormat:@"Balance-%@-%@", v9, v10];

    int64_t detailViewStyle = self->_detailViewStyle;
    id v13 = v11;
    id v14 = v7;
    uint64_t v15 = [v6 dequeueReusableCellWithIdentifier:v13];
    if (!v15) {
      uint64_t v15 = [[PKBackFieldTableCell alloc] initWithBridgeStyle:detailViewStyle == 2 reuseIdentifier:v13];
    }
    [(PKBackFieldTableCell *)v15 setShowLinks:0];
    [(PKBackFieldTableCell *)v15 setField:v14];

    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v15];
    [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v15];
    [(PKBackFieldTableCell *)v15 setAccessoryType:[(PKPaymentPassDetailViewController *)self _canSelectBalanceOrCommutePlanCellAtRowIndex:a3]];
  }
  PKAccessibilityIDCellSet(v15, (void *)*MEMORY[0x1E4F852A8]);

  return v15;
}

- (id)_balanceReminderCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!self->_transitProperties)
  {
    id v7 = 0;
    id v8 = 0;
    goto LABEL_5;
  }
  if (a3)
  {
    id v7 = 0;
    id v8 = 0;
    --a3;
    goto LABEL_5;
  }
  uint64_t v15 = PKLocalizedPaymentString(&cfstr_LowBalanceRemi.isa);
  BOOL v11 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v15 detailText:0 cellStyle:1 forTableView:v6];

  id v7 = self->_transitPropertiesBalanceReminder;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v16 = [(PKPaymentPassDetailViewController *)self _availableActions];
  id v8 = (id)[v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v17 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v16);
        }
        id v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v19 type] == 1)
        {
          id v8 = v19;
          goto LABEL_20;
        }
      }
      id v8 = (id)[v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  if (!v11)
  {
    a3 = -1;
LABEL_5:
    if (a3 >= [(NSArray *)self->_displayableBalanceFields count])
    {
      BOOL v11 = 0;
    }
    else
    {
      char v9 = [(NSArray *)self->_displayableBalanceFields objectAtIndexedSubscript:a3];
      uint64_t v10 = [v9 label];
      BOOL v11 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v10 detailText:0 cellStyle:1 forTableView:v6];

      char v12 = [v9 foreignReferenceIdentifiers];
      if ([v12 count])
      {
        uint64_t v13 = [(NSDictionary *)self->_actionForBalanceIdentifier objectForKeyedSubscript:v12];

        uint64_t v14 = [(NSMutableDictionary *)self->_reminderForBalanceIdentifier objectForKeyedSubscript:v12];

        id v8 = (id)v13;
        id v7 = (PKPaymentBalanceReminder *)v14;
      }
    }
  }
  if (v8)
  {
    if (v7 && [(PKPaymentBalanceReminder *)v7 isEnabled])
    {
      id v20 = [(PKPaymentBalanceReminder *)v7 threshold];
      uint64_t v21 = [v8 enteredValueItem];
      uint64_t v22 = [v21 currency];
      id v23 = PKCurrencyAmountCreate(v20, v22);
      id v24 = [v23 formattedStringValue];

      id v25 = PKLocalizedPaymentString(&cfstr_LowBalanceRemi_0.isa, &stru_1EF1B4C70.isa, v24);
      long long v26 = [v11 detailTextLabel];
      [v26 setText:v25];
    }
    else
    {
      id v24 = [v11 detailTextLabel];
      id v25 = PKLocalizedPaymentString(&cfstr_CommutePlanRen_2.isa);
      [v24 setText:v25];
    }

    [v11 setAccessoryType:1];
  }

  return v11;
}

- (id)_manufacturerInfoCellForTableView:(id)a3
{
  id v4 = a3;
  id v5 = PKLocalizedCredentialString(&cfstr_CarKeyIssuerNa.isa);
  id v6 = [(PKPaymentPass *)self->_pass organizationName];
  id v7 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v5 detailText:v6 cellStyle:1 reuseIdentifier:@"manufacturerInfo" forTableView:v4];

  [v7 setSelectionStyle:0];

  return v7;
}

- (unint64_t)_passOperationsCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if ([(PKPaymentPassDetailViewController *)self _shouldShowTransferCell])
  {
    uint64_t v9 = 1;
    if (a3 && !a4)
    {
      uint64_t v10 = [(PKPaymentPassDetailViewController *)self _transferCardCellForTableView:v8];
      id v11 = *a3;
      *a3 = v10;

      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([(PKPaymentPassDetailViewController *)self _shouldShowDeleteCell])
  {
    unint64_t v12 = v9 + 1;
    if (a3 && v9 == a4)
    {
      uint64_t v13 = [(PKPaymentPassDetailViewController *)self _deleteCardCellForTableView:v8];
      id v14 = *a3;
      *a3 = v13;
    }
  }
  else
  {
    unint64_t v12 = v9;
  }

  return v12;
}

- (unint64_t)_contactBankCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if (![(PKPaymentPassDetailViewController *)self _shouldShowContactCell])
  {
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = 1;
  if (a3 && !a4)
  {
    uint64_t v10 = [(PKPaymentPass *)self->_pass organizationName];
    if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
    {
      uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_11.isa);
    }
    else
    {
      if (!self->_account)
      {
        if (!self->_isAppleAccess || ![(PKPaymentPass *)self->_pass isAccessPass]) {
          goto LABEL_11;
        }
        uint64_t v21 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A50]];
        uint64_t v22 = [v21 value];
        id v23 = (void *)v22;
        if (v22) {
          id v24 = (void *)v22;
        }
        else {
          id v24 = v10;
        }
        id v12 = v24;

        uint64_t v10 = v21;
LABEL_10:

        uint64_t v10 = v12;
LABEL_11:
        uint64_t v13 = PKLocalizedPaymentString(&cfstr_ContactIssuer.isa, &stru_1EF1B4C70.isa, v10);
        id v14 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v13 forTableView:v8];
        id v15 = *a3;
        *a3 = v14;

        uint64_t v9 = 1;
        goto LABEL_12;
      }
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      uint64_t v11 = PKLocalizedFeatureString();
    }
    id v12 = (id)v11;
    goto LABEL_10;
  }
LABEL_12:
  if ([(PKPaymentPassDetailViewController *)self _shouldShowServiceMode])
  {
    unint64_t v16 = v9 + 1;
    if (a3 && v9 == a4)
    {
      uint64_t v17 = PKLocalizedPaymentString(&cfstr_ServiceModeCel.isa);
      uint64_t v18 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v17 forTableView:v8];
      id v19 = *a3;
      *a3 = v18;
    }
  }
  else
  {
    unint64_t v16 = v9;
  }

  return v16;
}

- (id)_automaticPresentationCellForTableView:(id)a3
{
  automaticPresentationSwitch = self->_automaticPresentationSwitch;
  if (!automaticPresentationSwitch)
  {
    id v5 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKSettingTableCellReuseIdentifier"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v5];
    primaryTextColor = self->_primaryTextColor;
    id v7 = [(PKSettingTableCell *)v5 textLabel];
    id v8 = v7;
    if (primaryTextColor)
    {
      [v7 setTextColor:self->_primaryTextColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
      [v8 setTextColor:v9];
    }
    uint64_t v10 = [(PKSettingTableCell *)v5 textLabel];
    uint64_t v11 = PKLocalizedString(&cfstr_SettingsAutoma_0.isa);
    [v10 setText:v11];

    [(PKSettingTableCell *)v5 setTarget:self action:sel__automaticPresentationSwitchChanged_];
    [(PKSettingTableCell *)v5 setOn:((unint64_t)[(PKPaymentPass *)self->_pass settings] >> 4) & 1];
    id v12 = self->_automaticPresentationSwitch;
    self->_automaticPresentationSwitch = v5;

    automaticPresentationSwitch = self->_automaticPresentationSwitch;
  }

  return automaticPresentationSwitch;
}

- (id)_expressAccessCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKPaymentPass *)self->_pass isHomeKeyPass])
  {
    BOOL uwbExpressModeSupported = self->_uwbExpressModeSupported;
    if (self->_nfcExpressModeSupported)
    {
      if (!self->_uwbExpressModeSupported || ![v6 row]) {
        goto LABEL_5;
      }
      goto LABEL_8;
    }
  }
  else
  {
    BOOL uwbExpressModeSupported = self->_uwbExpressModeSupported;
  }
  if (!uwbExpressModeSupported)
  {
LABEL_5:
    id result = [(PKPaymentPassDetailViewController *)self _nfcExpressAccessCellForTableView:v7];
    goto LABEL_9;
  }
LABEL_8:
  id result = [(PKPaymentPassDetailViewController *)self _uwbExpressAccessCellForTableView:v7];
LABEL_9:
  id v10 = result;
  if (result)
  {

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)_nfcExpressAccessCellForTableView:(id)a3
{
  nfcExpressAccessSwitch = self->_nfcExpressAccessSwitch;
  if (!nfcExpressAccessSwitch)
  {
    id v5 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKSettingTableCellReuseIdentifier"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v5];
    primaryTextColor = self->_primaryTextColor;
    id v7 = [(PKSettingTableCell *)v5 textLabel];
    id v8 = v7;
    if (primaryTextColor)
    {
      [v7 setTextColor:self->_primaryTextColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
      [v8 setTextColor:v9];
    }
    if ([(PKPaymentPass *)self->_pass isHomeKeyPass])
    {
      BOOL uwbExpressModeSupported = self->_uwbExpressModeSupported;
      uint64_t v11 = [(PKSettingTableCell *)v5 textLabel];
      if (uwbExpressModeSupported)
      {
        id v12 = @"HOME_KEY_EXPRESS_ACCESS_TITLE";
LABEL_10:
        uint64_t v13 = PKLocalizedPaymentString(&v12->isa);
        [v11 setText:v13];

        [(PKSettingTableCell *)v5 setTarget:self action:sel__nfcExpressAccessSwitchChanged_];
        [(PKSettingTableCell *)v5 setOn:self->_nfcExpressModeEnabled];
        PKAccessibilityIDCellSet(v5, (void *)*MEMORY[0x1E4F85538]);
        id v14 = self->_nfcExpressAccessSwitch;
        self->_nfcExpressAccessSwitch = v5;

        nfcExpressAccessSwitch = self->_nfcExpressAccessSwitch;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = [(PKSettingTableCell *)v5 textLabel];
    }
    id v12 = @"EXPRESS_ACCESS_TITLE";
    goto LABEL_10;
  }
LABEL_11:

  return nfcExpressAccessSwitch;
}

- (id)_uwbExpressAccessCellForTableView:(id)a3
{
  uwbExpressAccessSwitch = self->_uwbExpressAccessSwitch;
  if (!uwbExpressAccessSwitch)
  {
    id v5 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKSettingTableCellReuseIdentifier"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v5];
    primaryTextColor = self->_primaryTextColor;
    id v7 = [(PKSettingTableCell *)v5 textLabel];
    id v8 = v7;
    if (primaryTextColor)
    {
      [v7 setTextColor:self->_primaryTextColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
      [v8 setTextColor:v9];
    }
    int v10 = [(PKPaymentPass *)self->_pass isHomeKeyPass];
    uint64_t v11 = [(PKSettingTableCell *)v5 textLabel];
    if (v10) {
      PKLocalizedHomeKitUWBString(&cfstr_HomeKeyUnlockO.isa);
    }
    else {
    id v12 = PKLocalizedCredentialString(&cfstr_CarKeyPassiveE_0.isa);
    }
    [v11 setText:v12];

    [(PKSettingTableCell *)v5 setTarget:self action:sel__uwbExpressAccessSwitchChanged_];
    [(PKSettingTableCell *)v5 setOn:self->_uwbExpressModeEnabled];
    PKAccessibilityIDCellSet(v5, (void *)*MEMORY[0x1E4F85B18]);
    uint64_t v13 = self->_uwbExpressAccessSwitch;
    self->_uwbExpressAccessSwitch = v5;

    uwbExpressAccessSwitch = self->_uwbExpressAccessSwitch;
  }

  return uwbExpressAccessSwitch;
}

- (id)_passesInGroupCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 row];
  if (v8 != [(PKGroup *)self->_group passCount])
  {
    int v10 = [v7 dequeueReusableCellWithIdentifier:@"PKPassesInGroupTableCellReuseIdentifier"];
    if (!v10) {
      int v10 = [[PKTableViewCellWithDefaultStyle alloc] initWithStyle:0 reuseIdentifier:@"PKPassesInGroupTableCellReuseIdentifier"];
    }
    [(PKPaymentPassDetailViewController *)self _applyDefaultDynamicStylingToCell:v10];
    uint64_t v9 = -[PKGroup passAtIndex:](self->_group, "passAtIndex:", [v6 row]);
    uint64_t v11 = [(PKTableViewCellWithDefaultStyle *)v10 textLabel];
    uint64_t v21 = [(PKTableViewCellWithDefaultStyle *)v10 imageView];
    id v12 = [v9 uniqueID];
    uint64_t v13 = [(PKPaymentPass *)self->_pass uniqueID];
    if ([v12 isEqualToString:v13])
    {
      int v14 = [(PKPaymentPass *)self->_pass isImageSetLoaded:0];

      if (v14)
      {
        id v15 = [(PKPassHeaderView *)self->_passHeaderView passView];
LABEL_10:
        unint64_t v16 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v15, "snapshotOfFrontFaceWithRequestedSize:", 52.0, 33.0);
        [v21 setImage:v16];
        uint64_t v17 = [v9 fieldForKey:*MEMORY[0x1E4F87A28]];
        uint64_t v18 = [v17 value];
        [v11 setText:v18];

        if (self->_primaryTextColor)
        {
          objc_msgSend(v11, "setTextColor:");
        }
        else
        {
          id v19 = [MEMORY[0x1E4FB1618] labelColor];
          [v11 setTextColor:v19];
        }
        [(PKTableViewCellWithDefaultStyle *)v10 setUserInteractionEnabled:0];

        goto LABEL_14;
      }
    }
    else
    {
    }
    id v15 = [[PKPassView alloc] initWithPass:v9 content:4 suppressedContent:2039];
    [(PKPassView *)v15 setPaused:1];
    [(PKPassView *)v15 sizeToFit];
    goto LABEL_10;
  }
  uint64_t v9 = PKLocalizedShareableCredentialString(&cfstr_EditPassesInGr.isa);
  int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v9 forTableView:v7];
LABEL_14:

  return v10;
}

- (id)_barcodeCell
{
  unint64_t v3 = [[PKBarcodeTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"PKBarcodeTableViewCellReuseIdentifier"];
  [(PKBarcodeTableViewCell *)v3 setPass:self->_pass];

  return v3;
}

- (id)_settingsTableCellWithTitle:(id)a3 action:(SEL)a4 setOn:(BOOL)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKSettingTableCellReuseIdentifier"];
  [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v11];
  primaryTextColor = self->_primaryTextColor;
  uint64_t v13 = [(PKSettingTableCell *)v11 textLabel];
  int v14 = v13;
  if (primaryTextColor)
  {
    [v13 setTextColor:self->_primaryTextColor];
  }
  else
  {
    id v15 = [MEMORY[0x1E4FB1618] labelColor];
    [v14 setTextColor:v15];
  }
  unint64_t v16 = [(PKSettingTableCell *)v11 textLabel];
  [v16 setText:v10];

  [(PKSettingTableCell *)v11 setTarget:self action:a4];
  [(PKSettingTableCell *)v11 setOn:v7];
  [(PKSettingTableCell *)v11 setUserInteractionEnabled:v6];

  return v11;
}

- (id)_messagesSwitchCellForTableView:(id)a3
{
  messagesSwitch = self->_messagesSwitch;
  if (!messagesSwitch)
  {
    id v5 = PKLocalizedPaymentString(&cfstr_MessageService_0.isa);
    unint64_t v6 = [(PKPaymentPass *)self->_pass settings];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = PKUIOnlyDemoModeEnabled() ^ 1;
    }
    uint64_t v8 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v5 action:sel__messagesSwitchChanged_ setOn:(v6 >> 6) & 1 enabled:v7];
    uint64_t v9 = self->_messagesSwitch;
    self->_messagesSwitch = v8;

    PKAccessibilityIDCellSet(self->_messagesSwitch, (void *)*MEMORY[0x1E4F85A10]);
    messagesSwitch = self->_messagesSwitch;
  }

  return messagesSwitch;
}

- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  uint64_t v5 = [a3 row];
  if (v5 == 1)
  {
    p_dailyCashSwitch = (void **)&self->_dailyCashSwitch;
    dailyCashSwitch = self->_dailyCashSwitch;
    if (!dailyCashSwitch)
    {
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_2.isa);
      uint64_t v11 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v8 action:sel__dailyCashSwitchChanged_ setOn:([(PKPaymentPass *)self->_pass settings] & 0x400) == 0 enabled:1];
      id v12 = *p_dailyCashSwitch;
      *p_dailyCashSwitch = (void *)v11;
      uint64_t v13 = (void **)MEMORY[0x1E4F85418];
LABEL_11:

      PKAccessibilityIDCellSet(*p_dailyCashSwitch, *v13);
      dailyCashSwitch = (PKSettingTableCell *)*p_dailyCashSwitch;
    }
  }
  else
  {
    if (v5)
    {
      int v14 = 0;
      goto LABEL_13;
    }
    p_dailyCashSwitch = (void **)&self->_transactionsSwitch;
    dailyCashSwitch = self->_transactionsSwitch;
    if (!dailyCashSwitch)
    {
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_1.isa);
      unint64_t v9 = [(PKPaymentPass *)self->_pass settings];
      if (PKStoreDemoModeEnabled()) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = PKUIOnlyDemoModeEnabled() ^ 1;
      }
      uint64_t v15 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v8 action:sel__transactionsSwitchChanged_ setOn:(v9 >> 3) & 1 enabled:v10];
      id v12 = *p_dailyCashSwitch;
      *p_dailyCashSwitch = (void *)v15;
      uint64_t v13 = (void **)MEMORY[0x1E4F85AF0];
      goto LABEL_11;
    }
  }
  int v14 = dailyCashSwitch;
LABEL_13:

  return v14;
}

- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 row];
  if (v7 == 1)
  {
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2) {
        id v12 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH";
      }
      else {
        id v12 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE";
      }
      id v19 = PKLocalizedString(&v12->isa);
      id v20 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v19 forTableView:v6];
      allowNotificationCell = self->_allowNotificationCell;
      self->_allowNotificationCell = v20;

      p_allowNotificationCell = (void **)&self->_allowNotificationCell;
    }
    else
    {
      p_allowNotificationCell = (void **)&self->_notificationsSwitch;
      notificationsSwitch = self->_notificationsSwitch;
      if (notificationsSwitch)
      {
LABEL_15:
        uint64_t v13 = notificationsSwitch;
        PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E4F85218]);
        goto LABEL_19;
      }
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      unint64_t v16 = PKLocalizedFeatureString();
      uint64_t v17 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v16 action:sel__notificationSwitchChanged_ setOn:([(PKPaymentPass *)self->_pass settings] & 0x80) == 0 enabled:1];
      uint64_t v18 = *p_allowNotificationCell;
      *p_allowNotificationCell = (void *)v17;
    }
    notificationsSwitch = (PKSettingTableCell *)*p_allowNotificationCell;
    goto LABEL_15;
  }
  if (v7)
  {
    uint64_t v13 = 0;
  }
  else
  {
    transactionsSwitch = self->_transactionsSwitch;
    if (!transactionsSwitch)
    {
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      unint64_t v9 = PKLocalizedFeatureString();
      unint64_t v10 = [(PKPaymentPass *)self->_pass settings];
      if (PKStoreDemoModeEnabled()) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = PKUIOnlyDemoModeEnabled() ^ 1;
      }
      uint64_t v22 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v9 action:sel__transactionsSwitchChanged_ setOn:(v10 >> 3) & 1 enabled:v11];
      id v23 = self->_transactionsSwitch;
      self->_transactionsSwitch = v22;

      PKAccessibilityIDCellSet(self->_transactionsSwitch, (void *)*MEMORY[0x1E4F85AF0]);
      transactionsSwitch = self->_transactionsSwitch;
    }
    uint64_t v13 = transactionsSwitch;
  }
LABEL_19:

  return v13;
}

- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PKPaymentPassDetailViewController *)self _showsTransactionHistorySwitch])
  {
LABEL_4:
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2) {
        uint64_t v8 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH";
      }
      else {
        uint64_t v8 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE";
      }
      uint64_t v18 = PKLocalizedString(&v8->isa);
      id v19 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v18 forTableView:v7];
      allowNotificationCell = self->_allowNotificationCell;
      self->_allowNotificationCell = v19;

      p_allowNotificationCell = (void **)&self->_allowNotificationCell;
    }
    else
    {
      p_allowNotificationCell = (void **)&self->_notificationsSwitch;
      notificationsSwitch = self->_notificationsSwitch;
      if (notificationsSwitch)
      {
LABEL_15:
        uint64_t v21 = notificationsSwitch;
        PKAccessibilityIDCellSet(v21, (void *)*MEMORY[0x1E4F85218]);
        goto LABEL_20;
      }
      uint64_t v11 = PKLocalizedString(&cfstr_SettingsShowNo.isa);
      uint64_t v12 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v11 action:sel__notificationSwitchChanged_ setOn:([(PKPaymentPass *)self->_pass settings] & 0x80) == 0 enabled:1];
      uint64_t v13 = *p_allowNotificationCell;
      *p_allowNotificationCell = (void *)v12;
    }
    notificationsSwitch = (PKSettingTableCell *)*p_allowNotificationCell;
    goto LABEL_15;
  }
  if ([v6 row])
  {
    if ([v6 row] == 1) {
      goto LABEL_4;
    }
    uint64_t v21 = 0;
  }
  else
  {
    transactionsSwitch = self->_transactionsSwitch;
    if (!transactionsSwitch)
    {
      uint64_t v15 = PKLocalizedPaymentString(&cfstr_TransactionsSe_1.isa);
      unint64_t v16 = [(PKPaymentPass *)self->_pass settings];
      if (PKStoreDemoModeEnabled()) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = PKUIOnlyDemoModeEnabled() ^ 1;
      }
      uint64_t v22 = [(PKPaymentPassDetailViewController *)self _settingsTableCellWithTitle:v15 action:sel__transactionsSwitchChanged_ setOn:(v16 >> 3) & 1 enabled:v17];
      id v23 = self->_transactionsSwitch;
      self->_transactionsSwitch = v22;

      PKAccessibilityIDCellSet(self->_transactionsSwitch, (void *)*MEMORY[0x1E4F85AF0]);
      transactionsSwitch = self->_transactionsSwitch;
    }
    uint64_t v21 = transactionsSwitch;
  }
LABEL_20:

  return v21;
}

- (id)_transactionAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_transactions objectAtIndex:a3];
}

- (id)_transactionCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = [a4 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier"];
  uint64_t v8 = [v6 row];

  unint64_t v9 = [(PKPaymentPassDetailViewController *)self _transactionAtIndex:v8];
  if (!v7)
  {
    id v7 = [[PKPaymentTransactionTableCell alloc] initWithStyle:3 reuseIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier"];
    [(PKPaymentPassDetailViewController *)self _applyDefaultStaticStylingToCell:v7];
    unint64_t v10 = [(PKPaymentTransactionTableCell *)v7 textLabel];
    uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v10 setFont:v11];
  }
  transactionSourceCollection = self->_transactionSourceCollection;
  uint64_t v13 = [v9 transactionSourceIdentifier];
  int v14 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v13];

  uint64_t v15 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider deviceName];
  unint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    PKDeviceName();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v18 = v17;

  id v19 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForTransactionSource:v14];
  [(PKPaymentTransactionCellController *)self->_transactionCellController configureCell:v7 forTransaction:v9 transactionSource:v14 familyMember:v19 account:self->_account detailStyle:self->_detailViewStyle deviceName:v18 avatarViewDelegate:self];

  return v7;
}

- (id)_contactKeysToFetch
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[0] = v2;
  Class v3 = _MergedGlobals_31();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v11[1] = v5;
  id v6 = [(Class)off_1EC34A1F0() descriptorForRequiredKeys];
  void v11[2] = v6;
  id v7 = [(Class)off_1EC34A1F8() descriptorForRequiredKeys];
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v11[3] = v7;
  void v11[4] = v8;
  void v11[5] = *MEMORY[0x1E4F1AEE0];
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

- (id)_deleteContextualActionForTransaction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4FB1688];
  id v6 = PKLocalizedPaymentString(&cfstr_TransactionsSw.isa);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PKPaymentPassDetailViewController__deleteContextualActionForTransaction___block_invoke;
  v10[3] = &unk_1E59D7B90;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = [v5 contextualActionWithStyle:1 title:v6 handler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __75__PKPaymentPassDetailViewController__deleteContextualActionForTransaction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained deleteTransaction:*(void *)(a1 + 32) completionHandler:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (void)deleteTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 transactionType] == 15)
  {
    if (self->_detailViewStyle == 2) {
      id v8 = @"TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_WATCH";
    }
    else {
      id v8 = @"TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE";
    }
    unint64_t v9 = PKLocalizedIdentityString(&v8->isa);
    unint64_t v10 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
    uint64_t v11 = PKLocalizedIdentityString(&cfstr_TransactionDel_1.isa);
    id v12 = (void *)v11;
    if (v9) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13 && v11 != 0)
    {
      id v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:0 preferredStyle:0];
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke;
      aBlock[3] = &unk_1E59DF4E0;
      objc_copyWeak(&v26, &location);
      id v15 = v7;
      id v25 = v15;
      id v24 = v6;
      unint64_t v16 = _Block_copy(aBlock);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_3;
      v21[3] = &unk_1E59CB150;
      id v22 = v15;
      id v17 = _Block_copy(v21);
      uint64_t v18 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:2 handler:v16];
      id v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v12 style:1 handler:v17];
      [v20 addAction:v18];
      [v20 addAction:v19];
      [(PKPaymentPassDetailViewController *)self presentViewController:v20 animated:1 completion:0];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);

      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    id v12 = 0;
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_16:
}

void __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  Class v3 = WeakRetained;
  if (WeakRetained
    && (uint64_t v4 = [WeakRetained[154] indexOfObject:*(void *)(a1 + 32)], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v6 = v4;
    id v7 = [v3 tableView];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_2;
    v9[3] = &unk_1E59CC648;
    void v9[4] = v3;
    uint64_t v11 = v6;
    id v10 = *(id *)(a1 + 32);
    [v7 performBatchUpdates:v9 completion:0];

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

void __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 1232) mutableCopy];
  [v2 removeObjectAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1232);
  *(void *)(v4 + 1232) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) indexOfSectionIdentifier:@"Transactions"];
  if ([v2 count])
  {
    id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 48) inSection:v6];
    uint64_t v8 = [*(id *)(a1 + 32) tableView];
    v15[0] = v7;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v8 deleteRowsAtIndexPaths:v9 withRowAnimation:100];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) tableView];
    uint64_t v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
    [v10 reloadSections:v11 withRowAnimation:100];
  }
  id v12 = *(void **)(a1 + 40);
  BOOL v13 = *(void **)(*(void *)(a1 + 32) + 2176);
  int v14 = [v12 identifier];
  [v13 deletePaymentTransactionWithIdentifier:v14];
}

uint64_t __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (BOOL)_transactionCellEditActionsGenerateWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ([(PKPaymentPassDetailViewController *)self _transactionsCount] <= a4)
  {
    BOOL v12 = 0;
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v10 = [(PKPaymentPassDetailViewController *)self _transactionAtIndex:a4];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 isDeletable])
  {
    if (v9)
    {
      uint64_t v11 = [(PKPaymentPassDetailViewController *)self _deleteContextualActionForTransaction:v10];
      [v9 addObject:v11];
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }
  BOOL v13 = [v10 merchant];
  if (([v13 useRawMerchantData] & 1) == 0)
  {
    int v14 = [v13 mapsMerchant];
    uint64_t v15 = [v14 identifier];

    if (v15)
    {
      if (!v9)
      {
        PKTransactionDebugDetailsEnabled();
        goto LABEL_21;
      }
      unint64_t v16 = [v10 identifier];
      id v17 = (void *)MEMORY[0x1E4FB1688];
      uint64_t v18 = PKLocalizedPaymentString(&cfstr_TransactionsSw_0.isa);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke;
      v39[3] = &unk_1E59DF508;
      void v39[4] = self;
      id v40 = v16;
      id v41 = v8;
      id v42 = v10;
      id v19 = v16;
      id v20 = [v17 contextualActionWithStyle:0 title:v18 handler:v39];

      [v9 addObject:v20];
      BOOL v12 = 1;
    }
  }
  if ((PKTransactionDebugDetailsEnabled() & 1) == 0) {
    goto LABEL_22;
  }
  if (v9)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4FB1688];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    void v36[2] = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_2;
    v36[3] = &unk_1E59DF530;
    id v37 = v10;
    uint64_t v38 = self;
    id v22 = [v21 contextualActionWithStyle:0 title:@"Debug" handler:v36];
    [v9 addObject:v22];
  }
LABEL_21:
  BOOL v12 = 1;
LABEL_22:
  if ([(PKPaymentPassDetailViewController *)self _transactionDeepLinkingEnabled])
  {
    if (v9)
    {
      id v23 = (void *)MEMORY[0x1E4FB1688];
      id v24 = PKLocalizedPaymentString(&cfstr_TransactionsSw_1.isa);
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      unint64_t v32 = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_3;
      uint64_t v33 = &unk_1E59DF530;
      id v34 = v8;
      int v35 = self;
      id v25 = [v23 contextualActionWithStyle:0 title:v24 handler:&v30];

      id v26 = objc_msgSend(MEMORY[0x1E4FB1618], "systemBlueColor", v30, v31, v32, v33);
      [v25 setBackgroundColor:v26];

      [v9 addObject:v25];
    }
    BOOL v12 = 1;
  }

  if (a3)
  {
LABEL_27:
    int v27 = (void *)[v9 copy];
    id v28 = *a3;
    *a3 = v27;
  }
LABEL_28:

  return v12;
}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 1488);
  id v7 = a3;
  id v8 = (void *)[a4 copy];
  [v6 setObject:v8 forKey:*(void *)(a1 + 40)];

  unint64_t v9 = *(void **)(a1 + 48);
  [v7 center];
  objc_msgSend(v9, "convertPoint:fromView:", v7);
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v9, "indexPathForRowAtPoint:", v11, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  int v14 = [*(id *)(a1 + 48) cellForRowAtIndexPath:v15];
  [*(id *)(a1 + 32) _presentMerchantDetailsViewWithTransaction:*(void *)(a1 + 56) forCell:v14];
}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a4;
  id v7 = [[PKTransactionDebugDetailsTabBarController alloc] initWithTransaction:*(void *)(a1 + 32) transactionSourceCollection:*(void *)(*(void *)(a1 + 40) + 2208)];
  uint64_t v6 = [*(id *)(a1 + 40) navigationController];
  [v6 pushViewController:v7 animated:1];

  v5[2](v5, 1);
}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  [v8 center];
  objc_msgSend(v6, "convertPoint:fromView:", v8);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v6, "indexPathForRowAtPoint:", v10, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _didSelectTransactionAtIndexPath:v13];
  v7[2](v7, 1);
}

- (int64_t)_transitCellGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  double v9 = [(PKTransitPassProperties *)self->_transitProperties felicaProperties];
  if ([v9 hasGreenCarTicket])
  {
    int64_t v10 = 1;
    if (a3 && !a4)
    {
      double v11 = [(PKPaymentPassDetailViewController *)self _subtitleCellForTableView:v8];
      id v12 = *a3;
      *a3 = v11;

      id v13 = [v9 greenCarValidityStartDate];
      int v14 = [v13 calendar];
      id v15 = [v13 date];
      unint64_t v16 = [v14 dateByAddingUnit:16 value:1 toDate:v15 options:0];

      id v17 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v18 = [v17 compare:v16];

      id v19 = PKLocalizedPaymentString(&cfstr_TicketSectionG.isa);
      if (v18 == -1)
      {
        int v35 = v14;
        uint64_t v21 = [v9 greenCarOriginStation];
        uint64_t v22 = [v9 greenCarDestinationStation];
        id v23 = (void *)v22;
        if (v21 && v22)
        {
          id v24 = (id)PKLocalizedPaymentString(&cfstr_TransitTransac.isa, &cfstr_12.isa, v21, v22);
          id v20 = 0;
        }
        else
        {
          if (v21) {
            id v25 = v21;
          }
          else {
            id v25 = (void *)v22;
          }
          id v20 = v25;
        }

        int v14 = v35;
      }
      else
      {
        PKLocalizedPaymentString(&cfstr_TicketSectionE.isa);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }

      int64_t v10 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    int64_t v10 = 0;
  }
  if (!a3) {
    goto LABEL_25;
  }
  id v19 = 0;
  id v20 = 0;
LABEL_18:
  [*a3 setSelectionStyle:3];
  [*a3 setAccessoryType:1];
  id v26 = [*a3 textLabel];
  [v26 setText:v19];

  int v27 = [*a3 textLabel];
  id v28 = v27;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v27, "setTextColor:");
  }
  else
  {
    long long v29 = [MEMORY[0x1E4FB1618] labelColor];
    [v28 setTextColor:v29];
  }
  uint64_t v30 = [*a3 detailTextLabel];
  [v30 setText:v20];

  uint64_t v31 = [*a3 detailTextLabel];
  unint64_t v32 = v31;
  if (self->_detailTextColor)
  {
    objc_msgSend(v31, "setTextColor:");
  }
  else
  {
    uint64_t v33 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v32 setTextColor:v33];
  }
LABEL_25:

  return v10;
}

- (void)_didSelectTransitTicketAtRow:(int64_t)a3
{
  uint64_t v5 = [(PKTransitPassProperties *)self->_transitProperties felicaProperties];
  int v6 = [v5 hasGreenCarTicket];
  if (!a3
    && v6
    && (id v7 = [[PKGreenTicketDetailViewController alloc] initWithFelicaProperty:v5], PKLocalizedPaymentString(&cfstr_TicketSectionG.isa), v8 = objc_claimAutoreleasedReturnValue(), [(PKGreenTicketDetailViewController *)v7 setTitle:v8], v8, v7))
  {
    [(PKTransitTicketDetailViewController *)v7 setPrimaryTextColor:self->_primaryTextColor];
    [(PKTransitTicketDetailViewController *)v7 setSecondaryTextColor:self->_detailTextColor];
    double v9 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v9 pushViewController:v7 animated:1];
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v7 = (PKGreenTicketDetailViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v10 = 0;
      _os_log_impl(&dword_19F450000, &v7->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Selected an unexpected transit ticket type", v10, 2u);
    }
  }
}

- (id)_paymentApplicationsCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    double v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:primaryTextColor forTableView:v7];
  }
  else
  {
    int64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
    double v9 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v10 forTableView:v7];
  }
  double v11 = -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", [v6 row]);
  id v12 = [v11 displayName];
  id v13 = [v9 textLabel];
  [v13 setText:v12];

  int v14 = [(PKPaymentApplication *)self->_defaultPaymentApplication applicationIdentifier];
  id v15 = [v11 applicationIdentifier];
  int v16 = [v14 isEqual:v15];

  if (v16) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 0;
  }
  [v9 setAccessoryType:v17];
  if (self->_linkTextColor) {
    objc_msgSend(v9, "setTintColor:");
  }

  return v9;
}

- (void)_didSelectPaymentApplicationSectionRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_changingDefaultPaymentApplication)
  {
    self->_changingDefaultPaymentApplication = 1;
    uint64_t v5 = [(PKPaymentPassDetailViewController *)self tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    if (self->_detailViewStyle == 2)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      id v8 = [MEMORY[0x1E4FB1618] whiteColor];
      [v7 setColor:v8];

      [v7 startAnimating];
      [v6 setAccessoryView:v7];
    }
    else
    {
      id v7 = 0;
    }
    double v9 = -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", [v4 row]);
    objc_initWeak(&location, self);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    double v11 = [(PKPaymentPass *)self->_pass uniqueID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke;
    v15[3] = &unk_1E59DF558;
    objc_copyWeak(&v19, &location);
    id v12 = v7;
    id v16 = v12;
    id v13 = v6;
    id v17 = v13;
    id v14 = v9;
    id v18 = v14;
    [(PKPaymentDataProvider *)paymentServiceDataProvider setDefaultPaymentApplication:v14 forPassUniqueIdentifier:v11 completion:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke(id *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke_2;
  v2[3] = &unk_1E59CE888;
  objc_copyWeak(&v6, a1 + 7);
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v6);
}

void __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke_2(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [a1[4] stopAnimating];
    [a1[4] removeFromSuperview];
    [a1[5] setAccessoryView:0];
    objc_storeStrong(v3 + 137, a1[6]);
    [v3 _refreshPaymentApplicationsSelection];
    id WeakRetained = v3;
    *((unsigned char *)v3 + 1456) = 0;
  }
}

- (void)_refreshPaymentApplicationsSelection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_contactlessPaymentApplications;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v9 = [(PKPaymentPassDetailViewController *)self tableView];
        int64_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v5 + i, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", @"PaymentApplications"));
        double v11 = [v9 cellForRowAtIndexPath:v10];

        if (v11)
        {
          id v12 = [(PKPaymentApplication *)self->_defaultPaymentApplication applicationIdentifier];
          id v13 = [v8 applicationIdentifier];
          int v14 = [v12 isEqual:v13];

          if (v14) {
            uint64_t v15 = 3;
          }
          else {
            uint64_t v15 = 0;
          }
          [v11 setAccessoryType:v15];
        }
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      v5 += i;
    }
    while (v4);
  }
}

- (id)_deviceAccountNumberCellForIndexPath:(id)a3 tableView:(id)a4
{
  devicePaymentApplications = self->_devicePaymentApplications;
  id v7 = a4;
  id v8 = a3;
  if ([(NSArray *)devicePaymentApplications count] < 2)
  {
    int64_t v10 = PKLocalizedPaymentString(&cfstr_DpanTitle.isa);
  }
  else
  {
    double v9 = -[NSArray objectAtIndex:](self->_devicePaymentApplications, "objectAtIndex:", [v8 row]);
    int64_t v10 = [v9 displayName];
  }
  double v11 = self->_devicePaymentApplications;
  uint64_t v12 = [v8 row];

  id v13 = [(NSArray *)v11 objectAtIndex:v12];
  int v14 = PKSanitizedDeviceAccountNumberForPaymentApplication();

  uint64_t v15 = [(PKPaymentPassDetailViewController *)self _stackedInfoCellWithPrimaryText:v10 detailText:v14 cellStyle:1 forTableView:v7];

  return v15;
}

- (id)_merchantTokensCellForTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokens_1.isa);
  uint64_t v6 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v5 detailText:0 cellStyle:1 reuseIdentifier:@"merchantTokens" forTableView:v4];

  id v7 = [(PKRetrieveMerchantTokensResponse *)self->_merchantTokensResponse merchantTokens];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v6 setAccessoryView:0];
    [v6 setAccessoryType:1];
  }
  else
  {
    if (self->_merchantTokensResponse
      || ([(PKPaymentPass *)self->_pass hasMerchantTokens] & 1) == 0
      && [(PKPaymentPass *)self->_pass hadMerchantTokens])
    {
      [v6 setAccessoryView:0];
      [v6 setAccessoryType:0];
      double v9 = [v6 textLabel];
      int64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v9 setTextColor:v10];
    }
    else
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v9 startAnimating];
      [v6 setAccessoryView:v9];
    }
  }
  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E4F856D8]);

  return v6;
}

- (id)_footerViewForMerchantTokensSection
{
  uint64_t v3 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokens_2.isa);
  id v4 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokens_3.isa, &stru_1EF1B4C70.isa, v3);
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht212954?cid=mc-ols-applepay-article_ht212954-app-11122021"];
  uint64_t v6 = PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  id v7 = &__block_literal_global_47;
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v6 action:&__block_literal_global_47];

  return v8;
}

- (id)_transferCardCellForTableView:(id)a3
{
  id v4 = a3;
  warningTextColor = self->_warningTextColor;
  if (warningTextColor)
  {
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:warningTextColor forTableView:v4];
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v7 forTableView:v4];
  }
  uint64_t v8 = PKAssignedDeviceName();
  double v9 = PKLocalizedPaymentString(&cfstr_SettingsTransf_7.isa, &stru_1EF1B4C70.isa, v8);

  int64_t v10 = [v6 textLabel];
  [v10 setText:v9];

  BOOL v11 = [(PKPaymentPassDetailViewController *)self _isDeletingPass];
  if (self->_performingCardTransfer)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v12 startAnimating];
    [v6 setAccessoryView:v12];
  }
  else
  {
    [v6 setAccessoryView:0];
  }
  BOOL performingCardTransfer = self->_performingCardTransfer;
  int v14 = [v6 textLabel];
  uint64_t v15 = v14;
  BOOL v16 = !performingCardTransfer && !v11;
  [v14 setEnabled:v16];

  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E4F85AF8]);

  return v6;
}

- (id)_deleteCardCellForTableView:(id)a3
{
  id v4 = a3;
  warningTextColor = self->_warningTextColor;
  if (warningTextColor)
  {
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:warningTextColor forTableView:v4];
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v7 forTableView:v4];
  }
  if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
  {
    uint64_t v8 = PKLocalizedAquamanString(&cfstr_DeletePassAcco.isa);
  }
  else
  {
    int v9 = [(PKPaymentPass *)self->_pass isIdentityPass];
    pass = self->_pass;
    if (v9)
    {
      unint64_t v11 = [(PKPaymentPass *)pass identityType];
      if (v11 < 2)
      {
        uint64_t v12 = @"DELETE_PASS_DL";
      }
      else if (v11 == 3)
      {
        uint64_t v12 = @"DELETE_PASS_NID";
      }
      else
      {
        if (v11 != 2)
        {
LABEL_17:
          int v14 = 0;
          goto LABEL_21;
        }
        uint64_t v12 = @"DELETE_PASS_STATE_ID";
      }
      uint64_t v8 = PKLocalizedIdentityString(&v12->isa);
    }
    else
    {
      if ([(PKPaymentPass *)pass isAccessPass])
      {
        switch([(PKPaymentPass *)self->_pass accessType])
        {
          case 0:
            break;
          case 1:
          case 3:
          case 5:
          case 6:
            id v13 = @"DELETE_PASS_KEY";
            goto LABEL_15;
          case 2:
            id v13 = @"DELETE_PASS_BADGE";
            goto LABEL_15;
          case 4:
            uint64_t v8 = PKLocalizedCredentialString(&cfstr_RemoveCarKey.isa);
            goto LABEL_20;
          default:
            goto LABEL_17;
        }
      }
      id v13 = @"DELETE_PASS";
LABEL_15:
      uint64_t v8 = PKLocalizedPaymentString(&v13->isa);
    }
  }
LABEL_20:
  int v14 = (void *)v8;
LABEL_21:
  uint64_t v15 = [v6 textLabel];
  [v15 setText:v14];

  if ([(PKPaymentPassDetailViewController *)self _isDeletingPass])
  {
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v16 startAnimating];
    [v6 setAccessoryView:v16];

LABEL_24:
    long long v17 = [v6 textLabel];
    long long v18 = v17;
    uint64_t v19 = 0;
    goto LABEL_25;
  }
  [v6 setAccessoryView:0];
  if (self->_performingCardTransfer) {
    goto LABEL_24;
  }
  long long v17 = [v6 textLabel];
  long long v18 = v17;
  uint64_t v19 = 1;
LABEL_25:
  [v17 setEnabled:v19];

  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E4F858F0]);

  return v6;
}

- (id)_peerPaymentBalanceCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_20.isa);
  id v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
  uint64_t v8 = [v7 formattedStringValue];
  int v9 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v6 detailText:v8 cellStyle:1 forTableView:v5];

  PKAccessibilityIDCellSet(v9, (void *)*MEMORY[0x1E4F852A8]);

  return v9;
}

- (id)_peerPaymentMoneyActionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKPaymentPassDetailViewController *)self _peerPaymentMoneyActionForRowIndex:a3];
  if (!v7)
  {
    uint64_t v8 = (void **)MEMORY[0x1E4F851D0];
    int v9 = @"PEER_PAYMENT_PASS_DETAILS_ADD_MONEY";
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    uint64_t v8 = (void **)MEMORY[0x1E4F85B00];
    int v9 = @"PEER_PAYMENT_PASS_DETAILS_TRANSFER_TO_BANK";
LABEL_5:
    int64_t v10 = PKLocalizedPeerPaymentString(&v9->isa);
    unint64_t v11 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v10 forTableView:v6];
    PKAccessibilityIDCellSet(v11, *v8);
    goto LABEL_7;
  }
  int64_t v10 = 0;
  unint64_t v11 = 0;
LABEL_7:

  return v11;
}

- (id)_peerPaymentManualIdentityVerificationCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_23.isa);
  unint64_t v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v6 forTableView:v5];

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F855F0]);

  return v7;
}

- (id)_peerPaymentParticipantGraduationCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentPas_24.isa);
  unint64_t v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v6 forTableView:v5];

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F859E8]);

  return v7;
}

- (id)_peerPaymentAccountActionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  unint64_t v6 = self->_peerPaymentAccountResolution - 1;
  if (v6 > 2)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = PKLocalizedPeerPaymentString(&off_1E59DFAE8[v6]->isa);
  }
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v7 forTableView:v5];
  PKAccessibilityIDCellSet(v8, (void *)*MEMORY[0x1E4F851B0]);

  return v8;
}

- (id)_peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    unint64_t v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_28.isa);
    uint64_t v8 = [(PKPaymentPassDetailViewController *)self _checkmarkCellWithText:v7 forTableView:v6];
    int v11 = [(PKPeerPaymentPreferences *)self->_peerPaymentPreferences requiresConfirmation];
    int64_t v10 = (void **)MEMORY[0x1E4F856B0];
    if (!v11)
    {
LABEL_7:
      PKAccessibilityIDCellSet(v8, *v10);
      goto LABEL_9;
    }
LABEL_6:
    [v8 setAccessoryType:3];
    goto LABEL_7;
  }
  if (!a3)
  {
    unint64_t v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_27.isa);
    uint64_t v8 = [(PKPaymentPassDetailViewController *)self _checkmarkCellWithText:v7 forTableView:v6];
    char v9 = [(PKPeerPaymentPreferences *)self->_peerPaymentPreferences requiresConfirmation];
    int64_t v10 = (void **)MEMORY[0x1E4F85288];
    if (v9) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unint64_t v7 = 0;
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (id)_peerPaymentBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    unint64_t v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:primaryTextColor forTableView:v5];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
    unint64_t v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v8 forTableView:v5];
  }
  if (PKBankCredentialCenterEnabled()) {
    char v9 = @"PEER_PAYMENT_PASS_DETAILS_BANK_ACCOUNTS";
  }
  else {
    char v9 = @"PEER_PAYMENT_PASS_DETAILS_BANK_ACCOUNT";
  }
  int64_t v10 = PKLocalizedPeerPaymentString(&v9->isa);
  int v11 = [v7 textLabel];
  [v11 setText:v10];

  [v7 setAccessoryType:1];
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F852B0]);

  return v7;
}

- (id)_peerPaymentStatementCellForTableView:(id)a3
{
  id v4 = a3;
  id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_3.isa);
  id v6 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v5 forTableView:v4];

  if (self->_requestingStatement)
  {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [v6 setAccessoryView:v7];
    uint64_t v8 = [v6 textLabel];
    char v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v8 setTextColor:v9];

    int64_t v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_4.isa);
    [v8 setText:v10];

    int v11 = [v6 detailTextLabel];
    [v11 setText:0];
  }
  else
  {
    if (!self->_sentStatement) {
      goto LABEL_6;
    }
    [v6 setAccessoryView:0];
    [v6 setAccessoryType:3];
    unint64_t v7 = [v6 textLabel];
    uint64_t v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v7 setTextColor:v12];

    id v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_5.isa);
    [v7 setText:v13];

    uint64_t v8 = [v6 detailTextLabel];
    [v8 setText:0];
  }

LABEL_6:
  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E4F85A48]);

  return v6;
}

- (id)_familyMemberCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a3 row];
  if (v7 >= [(NSArray *)self->_sortedFamilyMemberRowModels count])
  {
    uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_BackOfPassFami_0.isa);
    [(PKPaymentPassDetailViewController *)self _linkCellWithText:v8 forTableView:v6];
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v7];
    [(PKPaymentPassDetailViewController *)self _familyMemberCellWithRowModel:v8 forTableView:v6];
  char v9 = };

  PKAccessibilityIDCellSet(v9, (void *)*MEMORY[0x1E4F85548]);

  return v9;
}

- (id)_accountServiceCreditDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKAccount *)self->_account creditDetails];
  uint64_t v8 = [v7 accountSummary];
  unint64_t v9 = [(PKPaymentPassDetailViewController *)self _accountServiceCreditDetailsRowForRowIndex:a3];
  int64_t v10 = [(PKAccount *)self->_account creditDetails];
  int v11 = [v10 currencyCode];

  id v12 = (id)*MEMORY[0x1E4F853F0];
  unint64_t v32 = v8;
  switch(v9)
  {
    case 0uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v13 = PKLocalizedFeatureString();
      int v14 = [v7 cardBalance];
      uint64_t v15 = [v14 amount];
      BOOL v16 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v17 = [v15 compare:v16];

      if (v17 == -1)
      {
        id v28 = [v14 negativeValue];

        long long v29 = [v28 formattedStringValue];
        long long v18 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v29, v32);

        int v14 = v28;
      }
      else
      {
        long long v18 = [v14 formattedStringValue];
      }
      uint64_t v19 = [(PKPaymentPassDetailViewController *)self isTotalBalanceCellSelectable];
      id v27 = (id)*MEMORY[0x1E4F852A8];

      id v12 = v14;
      goto LABEL_11;
    case 1uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v13 = PKLocalizedFeatureString();
      long long v20 = [v8 creditLimit];
      uint64_t v21 = PKCurrencyAmountCreate(v20, v11);
      long long v18 = [v21 formattedStringValue];

      uint64_t v22 = (id *)MEMORY[0x1E4F853F8];
      goto LABEL_8;
    case 2uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v13 = PKLocalizedFeatureString();
      id v23 = [v8 availableCredit];
      id v24 = PKCurrencyAmountCreate(v23, v11);
      long long v18 = [v24 formattedStringValue];

      uint64_t v22 = (id *)MEMORY[0x1E4F85298];
      goto LABEL_8;
    case 3uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v13 = PKLocalizedFeatureString();
      id v25 = [(PKAccount *)self->_account creditDetails];
      id v26 = [v25 rates];
      long long v18 = [v26 formattedAPRForPurchasesPercentageString];

      uint64_t v22 = (id *)MEMORY[0x1E4F85160];
LABEL_8:
      id v27 = *v22;
      uint64_t v19 = 0;
LABEL_11:

      id v12 = v27;
      break;
    default:
      uint64_t v19 = 0;
      long long v18 = 0;
      id v13 = 0;
      break;
  }
  uint64_t v30 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v13 detailText:v18 cellStyle:1 forTableView:v6];
  [v30 setAccessoryType:v19];
  PKAccessibilityIDCellSet(v30, v12);

  return v30;
}

- (int64_t)_numberOfAccountServiceCreditDetailsRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PKPaymentPassDetailViewController *)self _accountServiceCreditDetailsRowIsEnabled:v3++];
  while (v3 != 4);
  return v4;
}

- (BOOL)_accountServiceCreditDetailsRowIsEnabled:(unint64_t)a3
{
  id v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 accountSummary];

  switch(a3)
  {
    case 0uLL:
      uint64_t v7 = [v6 adjustedBalance];
      uint64_t v8 = (void *)v7;
      if (self->_detailViewStyle) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        goto LABEL_7;
      }
      goto LABEL_10;
    case 1uLL:
      uint64_t v8 = [v6 creditLimit];
      if (v8)
      {
LABEL_10:
        int v11 = [MEMORY[0x1E4F28C28] notANumber];
        int v10 = [v8 isEqualToNumber:v11] ^ 1;
LABEL_18:
      }
      else
      {
LABEL_7:
        LOBYTE(v10) = 0;
      }

LABEL_20:
      return v10;
    case 2uLL:
      uint64_t v8 = [v6 creditLimit];
      int v11 = [v6 availableCredit];
      id v12 = [MEMORY[0x1E4F28C28] notANumber];
      if (v8)
      {
        LOBYTE(v10) = 0;
        if (([v8 isEqualToNumber:v12] & 1) == 0 && v11) {
          int v10 = [v11 isEqualToNumber:v12] ^ 1;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      goto LABEL_18;
    case 3uLL:
      uint64_t v8 = [(PKAccount *)self->_account creditDetails];
      int v11 = [v8 rates];
      LOBYTE(v10) = v11 != 0;
      goto LABEL_18;
    default:
      LOBYTE(v10) = 0;
      goto LABEL_20;
  }
}

- (unint64_t)_accountServiceCreditDetailsRowForRowIndex:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKPaymentPassDetailViewController *)self _accountServiceCreditDetailsRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 4);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_accountServiceBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    uint64_t v8 = primaryTextColor;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
  }
  BOOL v9 = v8;
  int v10 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v8 forTableView:v6];
  if (a3)
  {
    int v11 = 0;
    id v12 = 0;
LABEL_6:
    uint64_t v13 = 1;
    goto LABEL_9;
  }
  [(PKPaymentPassDetailViewController *)self _accountFeature];
  id v12 = PKLocalizedFeatureString();
  if (!self->_loadingBankAccounts)
  {
    int v11 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

  int v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v11 startAnimating];
  uint64_t v13 = 0;
  BOOL v9 = (void *)v14;
LABEL_9:
  uint64_t v15 = [v10 textLabel];
  [v15 setText:v12];

  BOOL v16 = [v10 textLabel];
  [v16 setTextColor:v9];

  uint64_t v17 = [v10 detailTextLabel];
  [v17 setText:0];

  [v10 setAccessoryType:v13];
  [v10 setAccessoryView:v11];
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F852B0]);

  return v10;
}

- (id)_accountServiceMakeDefaultCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  [(PKPaymentPassDetailViewController *)self _accountFeature];
  id v6 = PKLocalizedFeatureString();
  uint64_t v7 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v6 forTableView:v5];

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F856A0]);

  return v7;
}

- (id)_accountServiceRewardsDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKPaymentPassDetailViewController *)self _accountServiceRewardsRowForRowIndex:a3];
  if (v7 == 2)
  {
    switch(self->_cashbackResolution)
    {
      case 1uLL:
      case 4uLL:
        long long v18 = @"PEER_PAYMENT_SETUP_APPLE_CASH_BUTTON";
        goto LABEL_18;
      case 2uLL:
        long long v18 = @"PEER_PAYMENT_ACCOUNT_STATE_FOOTER_IDENTITY_VERIFICATION_BUTTON";
LABEL_18:
        uint64_t v28 = PKLocalizedPeerPaymentString(&v18->isa);
        goto LABEL_20;
      case 3uLL:
        uint64_t v28 = PKLocalizedFeatureString();
LABEL_20:
        uint64_t v19 = (void *)v28;
        break;
      default:
        uint64_t v19 = 0;
        break;
    }
    long long v20 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v19 forTableView:v6];
  }
  else if (v7 == 1)
  {
    [(PKPaymentPassDetailViewController *)self _accountFeature];
    uint64_t v19 = PKLocalizedFeatureString();
    long long v20 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v19 forTableView:v6];
    if (self->_redeemingRewards)
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v21 startAnimating];
      [v20 setAccessoryView:v21];
      uint64_t v22 = [v20 textLabel];
      id v23 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v22 setTextColor:v23];

      id v24 = [v20 textLabel];
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v25 = PKLocalizedFeatureString();
      [v24 setText:v25];

      id v26 = [v20 detailTextLabel];
      [v26 setText:0];
    }
  }
  else
  {
    if (v7)
    {
      long long v20 = 0;
    }
    else
    {
      uint64_t v8 = [(PKAccount *)self->_account creditDetails];
      BOOL v9 = [v8 accountSummary];
      int v10 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      int v11 = v10;
      if (v10)
      {
        id v12 = [v10 altDSID];
        uint64_t v13 = [v9 accountUserActivityForAccountUserAltDSID:v12];
        uint64_t v14 = [v13 rewardsBalance];

        if (v14) {
          goto LABEL_7;
        }
      }
      uint64_t v14 = [v9 rewardsBalance];
      if (v14)
      {
LABEL_7:
        uint64_t v15 = [v8 currencyCode];
        BOOL v16 = PKCurrencyAmountCreate(v14, v15);
        uint64_t v17 = [v16 minimalFormattedStringValue];
      }
      else
      {
        uint64_t v17 = 0;
      }
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v27 = PKLocalizedFeatureString();
      long long v20 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v27 detailText:v17 cellStyle:1 forTableView:v6];
    }
    uint64_t v19 = 0;
  }

  return v20;
}

- (BOOL)_accountServiceRewardsRowIsEnabled:(unint64_t)a3
{
  int v5 = [(PKAccount *)self->_account supportsRedeemRewards];
  if (a3 >= 2)
  {
    if (a3 != 2)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    if (!v5) {
      return v5;
    }
    BOOL v6 = self->_cashbackResolution == 0;
  }
  else
  {
    if (!v5) {
      return v5;
    }
    BOOL v6 = !self->_allowStatementCreditRedemption;
  }
  LOBYTE(v5) = !v6;
  return v5;
}

- (int64_t)_numberOfAccountServiceRewardsRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PKPaymentPassDetailViewController *)self _accountServiceRewardsRowIsEnabled:v3++];
  while (v3 != 3);
  return v4;
}

- (unint64_t)_accountServiceRewardsRowForRowIndex:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKPaymentPassDetailViewController *)self _accountServiceRewardsRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 3);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_accountServicePhysicalCardRowIsEnabled:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCard];
      uint64_t v4 = [v3 state];

      return (v4 & 0xFFFFFFFFFFFFFFFELL) == 2;
    case 1uLL:
      physicalCardController = self->_physicalCardController;
      return [(PKPhysicalCardController *)physicalCardController canActivatePhysicalCard];
    case 2uLL:
      uint64_t v8 = self->_physicalCardController;
      return [(PKPhysicalCardController *)v8 canRequestNewPhysicalCard];
    case 3uLL:
      BOOL v9 = self->_physicalCardController;
      return [(PKPhysicalCardController *)v9 canReplacePhysicalCard];
    case 4uLL:
      int v10 = [(PKPhysicalCardController *)self->_physicalCardController unactivatedPhysicalCard];
      if (!v10) {
        goto LABEL_15;
      }
      int v11 = v10;
      id v12 = [v10 latestShippingActivity];
      uint64_t v13 = [v12 shipmentTrackingURL];
      if (v13)
      {
        BOOL v5 = 1;
      }
      else
      {
        uint64_t v14 = [v11 shipmentTrackingURL];
        BOOL v5 = v14 != 0;
      }
      break;
    default:
LABEL_15:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

- (int64_t)_numberOfAccountServicePhysicalCardRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PKPaymentPassDetailViewController *)self _accountServicePhysicalCardRowIsEnabled:v3++];
  while (v3 != 5);
  return v4;
}

- (unint64_t)_accountServicePhysicalCardRowForRowIndex:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKPaymentPassDetailViewController *)self _accountServicePhysicalCardRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 5);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_rowIndexForAccountServicePhysicalCardRow:(unint64_t)a3
{
  if (!-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowIsEnabled:](self, "_accountServicePhysicalCardRowIsEnabled:"))return 0x7FFFFFFFFFFFFFFFLL; {
  if (!a3)
  }
    return 0;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  do
    v6 += [(PKPaymentPassDetailViewController *)self _accountServicePhysicalCardRowIsEnabled:v5++];
  while (a3 != v5);
  return v6;
}

- (id)_accountServicePhysicalCardCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(PKPhysicalCardActionController *)self->_physicalCardActionController state];
  id v8 = (id)*MEMORY[0x1E4F85840];
  switch([(PKPaymentPassDetailViewController *)self _accountServicePhysicalCardRowForRowIndex:a3])
  {
    case 0uLL:
      [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCardEnabled];
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      BOOL v9 = PKLocalizedFeatureString();
      int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v9 forTableView:v6];
      if (self->_loadingEnableDisablePhysicalCard)
      {
        int v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [v11 startAnimating];
        [v10 setAccessoryView:v11];
      }
      goto LABEL_11;
    case 1uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      BOOL v9 = PKLocalizedFeatureString();
      int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v9 forTableView:v6];
      goto LABEL_11;
    case 2uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v12 = PKLocalizedFeatureString();
      int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v12 forTableView:v6];

      uint64_t v13 = 1657;
      goto LABEL_8;
    case 3uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      uint64_t v14 = PKLocalizedFeatureString();
      int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v14 forTableView:v6];

      uint64_t v13 = 1659;
LABEL_8:
      if (!*((unsigned char *)&self->super.super.super.super.super.isa + v13)) {
        goto LABEL_12;
      }
      BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v9 startAnimating];
      [v10 setAccessoryView:v9];
LABEL_11:

LABEL_12:
      if (v7 == 1 || self->_loadingOrderPhysicalCard)
      {
        BOOL v16 = [v10 textLabel];
        uint64_t v17 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
        [v16 setTextColor:v17];
      }
      PKAccessibilityIDCellSet(v10, v8);

      return v10;
    case 4uLL:
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      uint64_t v15 = PKLocalizedFeatureString();
      int v10 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v15 forTableView:v6];

      BOOL v9 = v8;
      id v8 = (id)*MEMORY[0x1E4F85848];
      goto LABEL_11;
    default:
      int v10 = 0;
      goto LABEL_12;
  }
}

- (id)_accountServiceCardNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    int64_t v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:primaryTextColor forTableView:v5];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] labelColor];
    int64_t v7 = [(PKPaymentPassDetailViewController *)self _defaultCellWithTextColor:v8 forTableView:v5];
  }
  BOOL v9 = [v7 textLabel];
  int v10 = PKLocalizedCardNumbersString(&cfstr_CardNumbersInf.isa);
  [v9 setText:v10];

  [(PKPaymentPassDetailViewController *)self _showSpinner:[(PKAccountCardNumbersPresenter *)self->_accountCardNumbersPresenter isLoadingVirtualCard] inCell:v7 overrideTextColor:0];
  if (!-[PKAccountCardNumbersPresenter isLoadingVirtualCard](self->_accountCardNumbersPresenter, "isLoadingVirtualCard"))[v7 setAccessoryType:1]; {
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F85358]);
  }

  return v7;
}

- (id)_transactionYearFormatter
{
  transactionYearFormatter = self->_transactionYearFormatter;
  if (!transactionYearFormatter)
  {
    int64_t v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = self->_transactionYearFormatter;
    self->_transactionYearFormatter = v4;

    id v6 = self->_transactionYearFormatter;
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v6 setCalendar:v8];

    [(NSDateFormatter *)self->_transactionYearFormatter setLocalizedDateFormatFromTemplate:@"y"];
    transactionYearFormatter = self->_transactionYearFormatter;
  }

  return transactionYearFormatter;
}

- (id)_transactionCountFormatter
{
  transactionCountFormatter = self->_transactionCountFormatter;
  if (!transactionCountFormatter)
  {
    int64_t v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v5 = self->_transactionCountFormatter;
    self->_transactionCountFormatter = v4;

    [(NSNumberFormatter *)self->_transactionCountFormatter setNumberStyle:1];
    transactionCountFormatter = self->_transactionCountFormatter;
  }

  return transactionCountFormatter;
}

- (id)_transactionCountByPeriodCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = -[NSArray objectAtIndexedSubscript:](self->_transactionCountAndYear, "objectAtIndexedSubscript:", [a3 row]);
  id v8 = [v7 startDate];
  uint64_t v9 = [v7 transactionCount];
  int v10 = [(PKPaymentPassDetailViewController *)self _transactionYearFormatter];
  int v11 = [v10 stringFromDate:v8];

  id v12 = [(PKPaymentPassDetailViewController *)self _transactionCountFormatter];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v9];
  uint64_t v14 = [v12 stringFromNumber:v13];

  uint64_t v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas.isa, &stru_1EF1B4C70.isa, v11);
  BOOL v16 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v15 detailText:v14 cellStyle:1 forTableView:v6];

  [v16 setAccessoryType:1];
  PKAccessibilityIDCellSet(v16, (void *)*MEMORY[0x1E4F85AF0]);

  return v16;
}

- (void)_didSelectTransactionCountByPeriodAtIndexPath:(id)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_transactionCountAndYear, "objectAtIndexedSubscript:", [a3 row]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v4 = [v14 startDate];
  id v5 = [PKPaymentTransactionsInYearTableViewController alloc];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  transactionSourceCollection = self->_transactionSourceCollection;
  familyCollection = self->_familyCollection;
  int64_t detailViewStyle = self->_detailViewStyle;
  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  int v11 = [(PKPaymentPassDetailViewController *)self contactResolver];
  id v12 = [(PKPaymentTransactionsInYearTableViewController *)v5 initWithDateFromYear:v4 calendar:v6 transactionSourceCollection:transactionSourceCollection familyCollection:familyCollection detailViewStyle:detailViewStyle paymentServiceDataProvider:paymentServiceDataProvider contactResolver:v11 peerPaymentWebService:self->_peerPaymentWebService account:self->_account];

  uint64_t v13 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v13 pushViewController:v12 animated:1];
}

- (void)_updatePeerPaymentPreferencesWithNewPreferences:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke;
  aBlock[3] = &unk_1E59DF580;
  void aBlock[4] = self;
  id v4 = a3;
  id v5 = _Block_copy(aBlock);
  id v6 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    [v8 setPreferences:v4 completion:v5];
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F84E08]) initWithPeerPaymentPreferences:v4];

    peerPaymentWebService = self->_peerPaymentWebService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_1202;
    v10[3] = &unk_1E59DF5A8;
    id v11 = v5;
    [(PKPeerPaymentWebService *)peerPaymentWebService peerPaymentUpdatePreferencesWithRequest:v8 completion:v10];
    id v4 = v11;
  }
}

void __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error updating peer payment preferences: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1576), *(id *)(a1 + 48));
  }
  return [*(id *)(a1 + 40) _updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary];
}

void __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_1202(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 peerPaymentPreferences];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  [(PKPaymentPassDetailViewController *)self dismissViewControllerAnimated:a4 completion:0];

  [(PKPaymentPassDetailViewController *)self _updateCashbackPeerPaymentResolutionSection];
}

- (void)_didSelectPeerPaymentMoneyActionAtRow:(int64_t)a3
{
  unint64_t v4 = [(PKPaymentPassDetailViewController *)self _peerPaymentMoneyActionForRowIndex:a3];
  if (v4 == 1)
  {
    [(PKPaymentPassDetailViewController *)self _didSelectTransferToBank];
  }
  else if (!v4)
  {
    [(PKPaymentPassDetailViewController *)self presentTopUp];
  }
}

- (void)_didSelectPeerPaymentBankAccountsAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!PKBankCredentialCenterEnabled()) {
    goto LABEL_3;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:0];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E59DF5D0;
  objc_copyWeak(&v23, &location);
  id v6 = v5;
  id v22 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke_2;
  uint64_t v19 = &unk_1E59CA7F8;
  objc_copyWeak(&v20, &location);
  id v8 = _Block_copy(&v16);
  id v9 = [PKACHBankCredentialPickerViewController alloc];
  int v10 = -[PKACHBankCredentialPickerViewController initWithCurrentBankInformation:selectAction:cancelAction:](v9, "initWithCurrentBankInformation:selectAction:cancelAction:", v6, v7, v8, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  if (!v10) {
LABEL_3:
  }
    int v10 = [[PKPeerPaymentBankAccountsViewController alloc] initWithPeerPaymentAccount:self->_peerPaymentAccount detailViewStyle:self->_detailViewStyle];
  id v11 = [[PKNavigationController alloc] initWithRootViewController:v10];
  int64_t detailViewStyle = self->_detailViewStyle;
  uint64_t v13 = 3;
  if (detailViewStyle != 1) {
    uint64_t v13 = 0;
  }
  if (detailViewStyle == 2) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = v13;
  }
  PKPaymentSetupApplyContextAppearance(v14, v11);
  uint64_t v15 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v15 pushViewController:v10 animated:1];
}

void __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v13 routingNumber];
    [v4 setRoutingNumber:v5];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v13 accountNumber];
    [v6 setAccountNumber:v7];

    id v8 = *(void **)(a1 + 32);
    id v9 = [v13 bankName];
    [v8 setBankName:v9];

    int v10 = *(void **)(a1 + 32);
    id v11 = [v13 identifier];
    [v10 setIdentifier:v11];

    uint64_t v12 = [WeakRetained navigationController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
}

void __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained navigationController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

- (void)_didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [(PKPeerPaymentPreferences *)self->_peerPaymentPreferences requiresConfirmation];
  uint64_t v7 = [(PKPaymentPassDetailViewController *)self tableView];
  id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v4, "section"));
  id v17 = [v7 cellForRowAtIndexPath:v8];

  id v9 = [(PKPaymentPassDetailViewController *)self tableView];
  int v10 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v11 = [v4 section];

  uint64_t v12 = [v10 indexPathForRow:1 inSection:v11];
  id v13 = [v9 cellForRowAtIndexPath:v12];

  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    uint64_t v14 = 0;
    uint64_t v6 = 1;
    uint64_t v15 = (void *)MEMORY[0x1E4F85EA0];
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v15 = (void *)MEMORY[0x1E4F85E98];
    uint64_t v14 = 3;
  }
  MEMORY[0x1A6220EC0](*v15, 0);
  [v17 setAccessoryType:v14];
  [v13 setAccessoryType:v5];
LABEL_6:
  uint64_t v16 = (void *)[(PKPeerPaymentPreferences *)self->_peerPaymentPreferences copy];
  [v16 setRequiresConfirmation:v6];
  [(PKPaymentPassDetailViewController *)self _updatePeerPaymentPreferencesWithNewPreferences:v16];
}

- (void)_didSelectPeerPaymentManualIdentityVerificationAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!self->_loadingPeerPaymentAccountActionIndexPath)
  {
    objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, a3);
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self tableView];
    uint64_t v7 = [v6 cellForRowAtIndexPath:self->_loadingPeerPaymentAccountActionIndexPath];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v8 startAnimating];
    [v7 setAccessoryView:v8];
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EE8], 0);
    id v9 = objc_alloc_init(MEMORY[0x1E4F84D60]);
    [v9 setVerificationContext:1];
    peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke;
    v11[3] = &unk_1E59CB6D8;
    void v11[4] = self;
    [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController presentFlowForAccountResolution:2 configuration:v9 completion:v11];
    [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:*MEMORY[0x1E4F86E10] additionalAnalytics:0];
  }
}

void __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doneLoadingPeerPaymentAccountAction];
}

- (void)_didSelectPeerPaymentParticipantGradutionAtIndexPath:(id)a3
{
  if (!self->_peerPaymentGraduationInProgress)
  {
    id v4 = a3;
    id v5 = [(PKPaymentPassDetailViewController *)self tableView];
    uint64_t v6 = [v5 cellForRowAtIndexPath:v4];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [v6 setAccessoryView:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4F84D60]);
    [v8 setGraduation:1];
    BOOL v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 1
      && [(PKPeerPaymentAccount *)self->_peerPaymentAccount stage] == 3;
    if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isParticipantAccountLockedByOwner])int v10 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsGraduationWhileAssociatedAccountLocked]; {
    else
    }
      int v10 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E59CA7D0;
    void aBlock[4] = self;
    uint64_t v11 = _Block_copy(aBlock);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_2;
    v43[3] = &unk_1E59CE110;
    v43[4] = self;
    id v12 = v8;
    id v44 = v12;
    id v13 = v11;
    id v45 = v13;
    uint64_t v14 = _Block_copy(v43);
    uint64_t v15 = v14;
    if (v9)
    {
      (*((void (**)(void *))v14 + 2))(v14);
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1E4FB1418];
      if (v10)
      {
        id v17 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentGra_0.isa);
        long long v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentGra_1.isa);
        uint64_t v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:0];

        id v20 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v21 = PKLocalizedPaymentString(&cfstr_Continue.isa);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_5;
        v41[3] = &unk_1E59CB150;
        id v42 = v15;
        id v22 = [v20 actionWithTitle:v21 style:0 handler:v41];
        [v19 addAction:v22];

        id v23 = (void *)MEMORY[0x1E4FB1410];
        id v24 = PKLocalizedString(&cfstr_Cancel.isa);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_6;
        v39[3] = &unk_1E59CB150;
        id v40 = v13;
        id v25 = [v23 actionWithTitle:v24 style:1 handler:v39];
        [v19 addAction:v25];

        id v26 = [(PKPaymentPassDetailViewController *)self navigationController];
        [v26 presentViewController:v19 animated:1 completion:0];

        id v27 = v42;
      }
      else
      {
        uint64_t v28 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea.isa);
        long long v29 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea_0.isa);
        uint64_t v19 = [v16 alertControllerWithTitle:v28 message:v29 preferredStyle:1];

        uint64_t v30 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v31 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        uint64_t v36 = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_7;
        id v37 = &unk_1E59CB150;
        id v38 = v13;
        unint64_t v32 = [v30 actionWithTitle:v31 style:0 handler:&v34];
        objc_msgSend(v19, "addAction:", v32, v34, v35, v36, v37);

        uint64_t v33 = [(PKPaymentPassDetailViewController *)self navigationController];
        [v33 presentViewController:v19 animated:1 completion:0];

        id v27 = v38;
      }
    }
  }
}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexOfSectionIdentifier:@"PeerPaymentParticipantGraduation"];
  id v3 = [*(id *)(a1 + 32) tableView];
  id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v2];
  id v5 = [v3 cellForRowAtIndexPath:v4];

  [v5 setAccessoryView:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1824) = 0;
}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1712);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_3;
  v3[3] = &unk_1E59CA9F8;
  id v4 = *(id *)(a1 + 48);
  [v2 presentFlowForAccountResolution:2 configuration:v1 completion:v3];
}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_4;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didSelectPeerPaymentAccountActionAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!self->_loadingPeerPaymentAccountActionIndexPath)
  {
    objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, a3);
    uint64_t v6 = [(PKPaymentPassDetailViewController *)self tableView];
    uint64_t v7 = [v6 cellForRowAtIndexPath:self->_loadingPeerPaymentAccountActionIndexPath];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v8 startAnimating];
    [v7 setAccessoryView:v8];
    unint64_t peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
    if (peerPaymentAccountResolution == 3)
    {
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EA8], 0);
      unint64_t peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
    }
    if (peerPaymentAccountResolution)
    {
      peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke;
      v11[3] = &unk_1E59CB6D8;
      void v11[4] = self;
      [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:v11];
    }
  }
}

void __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doneLoadingPeerPaymentAccountAction];
}

- (void)_didSelectPeerPaymentStatementAtIndexPath:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EB0], 0, a3);
  id v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_7.isa);
  id v5 = PKPrimaryAppleAccountFormattedUsername();
  uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_8.isa, &stru_1EF1B4C70.isa, v5);

  uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4FB1410];
  BOOL v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_9.isa);
  int v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
  id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_10.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke;
  v14[3] = &unk_1E59CB1F0;
  void v14[4] = self;
  id v13 = [v11 actionWithTitle:v12 style:0 handler:v14];

  [v7 addAction:v10];
  [v7 addAction:v13];
  [v7 setPreferredAction:v13];
  PKAccessibilityIDAlertSet(v7, (void *)*MEMORY[0x1E4F853B8]);
  [(PKPaymentPassDetailViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1728) = 1;
  [*(id *)(a1 + 32) reloadSectionIdentifier:@"PeerPaymentStatement"];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = *(void **)(*(void *)(a1 + 32) + 2200);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E59DC3B8;
  objc_copyWeak(&v6, &location);
  [v4 peerPaymentRequestStatementForAccountIdentifier:0 withCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v9 = WeakRetained;
    WeakRetained[1728] = 0;
    id v3 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      if (!v4)
      {
        v9[1729] = 1;
LABEL_8:
        [v9 reloadSectionIdentifier:@"PeerPaymentStatement"];

        id WeakRetained = v9;
        goto LABEL_9;
      }
    }
    else if (!v4)
    {
      id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma.isa);
      id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_0.isa);
      uint64_t v7 = PKDisplayableErrorCustom();

      id v3 = (void *)v7;
    }
    id v8 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    [v9 presentViewController:v8 animated:1 completion:0];

    goto LABEL_8;
  }
LABEL_9:
}

- (void)_didSelectFamilySharingAtIndexPath:(id)a3
{
  unint64_t v4 = [a3 row];
  if (v4 >= [(NSArray *)self->_sortedFamilyMemberRowModels count])
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Opening apple cash family sharing settings from back of pass", buf, 2u);
    }

    id v11 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
    id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v12 openSensitiveURL:v11 withOptions:0];
  }
  else
  {
    id v5 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v4];
    id v13 = [v5 familyMember];

    id v6 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v4];
    if ((unint64_t)([v6 state] - 1) <= 2)
    {
      uint64_t v7 = [[PKPeerPaymentAssociatedAccountPresentationContext alloc] initWithPKFamilyMember:v13 options:0];
      peerPaymentAssociatedAccountsController = self->_peerPaymentAssociatedAccountsController;
      BOOL v9 = [(PKPaymentPassDetailViewController *)self navigationController];
      [(PKPeerPaymentAssociatedAccountsController *)peerPaymentAssociatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:v7 fromNavigationController:v9];
    }
  }
}

- (void)_didSelectBalanceOrCommutePlanCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self tableView];
  [v5 deselectRowAtIndexPath:v4 animated:1];

  uint64_t v6 = [v4 row];
  int64_t v7 = [(NSArray *)self->_displayableBalanceFields count];
  if (v6 >= v7)
  {
    if (v6 - v7 >= 0)
    {
      [(PKPaymentPassDetailViewController *)self _didSelectCommutePlanAtRowIndex:v6 - v7];
    }
  }
  else
  {
    [(PKPaymentPassDetailViewController *)self _didSelectBalanceAtRowIndex:v6];
  }
}

- (void)_didSelectBalanceAtRowIndex:(int64_t)a3
{
  id v5 = -[PKPaymentPassDetailViewController _balanceForRow:](self, "_balanceForRow:");
  uint64_t v6 = [(PKPaymentPassDetailViewController *)self _topUpActionForRow:a3];
  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    pass = self->_pass;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke;
    v9[3] = &unk_1E59DF5F8;
    objc_copyWeak(&v13, &location);
    id v10 = v5;
    id v11 = self;
    id v12 = v6;
    [(PKPaymentDataProvider *)paymentServiceDataProvider balanceReminderThresholdForBalance:v10 pass:pass withCompletion:v9];

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke_2;
  block[3] = &unk_1E59CB838;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [PKBalanceDetailsViewController alloc];
    if (v3)
    {
      uint64_t v5 = [(PKBalanceDetailsViewController *)v4 initWithBalance:*(void *)(a1 + 32) forPass:*(void *)(*(void *)(a1 + 40) + 1072) balanceReminder:*(void *)(a1 + 48) associatedAction:*(void *)(a1 + 56) paymentDataProvider:*(void *)(*(void *)(a1 + 40) + 2176) webService:*(void *)(*(void *)(a1 + 40) + 2192) style:*(void *)(*(void *)(a1 + 40) + 2152) > 1uLL];
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v5 = [(PKBalanceDetailsViewController *)v4 initWithTransitPassProperties:v6[165] forPass:v6[134] balanceReminder:*(void *)(a1 + 48) associatedAction:*(void *)(a1 + 56) paymentDataProvider:v6[272] webService:v6[274] style:v6[269] > 1uLL];
    }
    id v7 = v5;
    [(PKBalanceDetailsViewController *)v5 setDelegate:*(void *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 40) navigationController];
    [v8 pushViewController:v7 animated:1];

    id WeakRetained = v9;
  }
}

- (id)_actionForCommutePlan:(id)a3
{
  uint64_t v3 = [a3 identifier];
  id v4 = PKRenewActionForPaymentPassAndIdentifier();

  return v4;
}

- (BOOL)_commutePlanIsSelectable:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6 || [v5 hasDisplayableInformation];

  return v7;
}

- (void)_didSelectCommutePlanAtRowIndex:(int64_t)a3
{
  id v4 = [(NSArray *)self->_commutePlans objectAtIndex:a3];
  id v5 = [(PKPaymentPassDetailViewController *)self _actionForCommutePlan:v4];
  if ([(PKPaymentPassDetailViewController *)self _commutePlanIsSelectable:v4 action:v5])
  {
    id v6 = [[PKCommutePlanDetailsViewController alloc] initWithCommutePlan:v4 associatedAction:v5 forPass:self->_pass paymentDataProvider:self->_paymentServiceDataProvider webService:self->_webService style:self->_detailViewStyle];
    if (v6)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __69__PKPaymentPassDetailViewController__didSelectCommutePlanAtRowIndex___block_invoke;
      v7[3] = &unk_1E59CB268;
      objc_copyWeak(&v9, &location);
      id v8 = v6;
      [(PKCommutePlanDetailsViewController *)v8 preflightWithCompletion:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __69__PKPaymentPassDetailViewController__didSelectCommutePlanAtRowIndex___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    id v6 = WeakRetained;
    id v5 = [WeakRetained navigationController];
    [v5 pushViewController:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v6;
  }
}

- (void)_didSelectPassInGroupAtIndexPath:(id)a3
{
  group = self->_group;
  id v5 = a3;
  uint64_t v6 = [(PKGroup *)group passCount];
  uint64_t v7 = [v5 row];

  if (v7 == v6)
  {
    id v8 = [[PKEditPassesNavigationController alloc] initWithExistingGroupsController:self->_groupsController specificGroup:self->_group isForWatch:self->_detailViewStyle == 2 delegate:0];
    [(PKPaymentPassDetailViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_didSelectCardInfoCellAtIndexPath:(id)a3
{
  id v9 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v4 = (PKExpressPassesViewController *)objc_claimAutoreleasedReturnValue();
    [(PKPaymentPassDetailViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    int64_t v5 = [(PKPaymentPassDetailViewController *)self _rowIndexForExpressTransitSettingsCell];
    if (v5 != [v9 row]) {
      goto LABEL_9;
    }
    int64_t detailViewStyle = self->_detailViewStyle;
    if (detailViewStyle)
    {
      id v4 = [[PKExpressPassesViewController alloc] initWithPaymentDataProvider:self->_paymentServiceDataProvider controller:self->_expressPassController style:detailViewStyle != 1];
      uint64_t v7 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider paymentPasses];
      [(PKExpressPassesViewController *)v4 setPasses:v7];

      id v8 = [(PKPaymentPassDetailViewController *)self navigationController];
      [v8 pushViewController:v4 animated:1];
    }
    else
    {
      id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v8 = [(PKPaymentPassDetailViewController *)self _settingsExpressTransitURL];
      [(PKExpressPassesViewController *)v4 openSensitiveURL:v8 withOptions:0];
    }
  }
LABEL_9:
}

- (void)_didSelectMerchantTokensCell
{
  uint64_t v3 = [(PKRetrieveMerchantTokensResponse *)self->_merchantTokensResponse merchantTokens];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v6 = [[PKMerchantTokensViewController alloc] initWithPass:self->_pass merchantTokensResponse:self->_merchantTokensResponse];
    [(PKMerchantTokensViewController *)v6 setDelegate:self];
    int64_t v5 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v5 pushViewController:v6 animated:1];
  }
}

- (id)_settingsExpressTransitURL
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"prefs:root=PASSBOOK&path="];
  [v3 appendString:*MEMORY[0x1E4F87F48]];
  [v3 appendString:@"&"];
  [v3 appendString:*MEMORY[0x1E4F88018]];
  [v3 appendString:@"="];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  int64_t v5 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  [v4 removeCharactersInString:@"="];
  uint64_t v6 = [(PKPaymentPass *)self->_pass uniqueID];
  uint64_t v7 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  [v3 appendString:v7];
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v8;
}

- (void)_didSelectInstallmentPlansAtIndexPath:(id)a3
{
  id v4 = [(PKAccount *)self->_account creditDetails];
  id v10 = [v4 installmentPlans];

  uint64_t v5 = [v10 count];
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v6 = [PKTransactionHistoryViewController alloc];
      uint64_t v7 = [v10 anyObject];
      id v8 = [(PKTransactionHistoryViewController *)v6 initWithInstallmentPlan:v7 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards];

      if (!v8) {
        goto LABEL_7;
      }
    }
    else
    {
      id v8 = [[PKInstallmentPlansViewController alloc] initWithAccount:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards accountService:self->_accountService transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection dataProvider:self->_paymentServiceDataProvider];
      if (!v8) {
        goto LABEL_7;
      }
    }
    id v9 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
LABEL_7:
}

- (id)_installmentsPlanCellForTableView:(id)a3 atIndexPath:(id)a4
{
  account = self->_account;
  id v6 = a3;
  uint64_t v7 = [(PKAccount *)account creditDetails];
  id v8 = [v7 installmentPlans];
  unint64_t v9 = [v8 count];

  id v10 = NSString;
  id v11 = [NSNumber numberWithUnsignedInteger:v9];
  id v12 = [v10 stringWithFormat:@"%@", v11];

  if (v9 >= 2) {
    id v13 = @"INSTALLMENTS";
  }
  else {
    id v13 = @"INSTALLMENT";
  }
  uint64_t v14 = PKLocalizedBeekmanString(&v13->isa);
  uint64_t v15 = [(PKPaymentPassDetailViewController *)self _infoCellWithPrimaryText:v14 detailText:v12 cellStyle:1 forTableView:v6];

  [v15 setAccessoryType:1];
  PKAccessibilityIDCellSet(v15, (void *)*MEMORY[0x1E4F85628]);

  return v15;
}

- (void)_didSelectAccountServiceBankAccountsAtIndexPath:(id)a3
{
  id v5 = a3;
  if (PKStoreDemoModeEnabled())
  {
    id v4 = PKUIStoreDemoGatewayViewController();
    [(PKPaymentPassDetailViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else if (![v5 row])
  {
    [(PKPaymentPassDetailViewController *)self presentBankAccounts];
  }
}

- (void)_didSelectAccountServiceMakeDefaultAtIndexPath:(id)a3
{
  [(PKPaymentPassDetailViewController *)self presentMakeDefaultAtApple];
  uint64_t v4 = *MEMORY[0x1E4F865E8];

  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:v4 additionalAnalytics:0];
}

- (void)_didSelectAccountServiceRewardsDetailsAtIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v4 = -[PKPaymentPassDetailViewController _accountServiceRewardsRowForRowIndex:](self, "_accountServiceRewardsRowForRowIndex:", [v5 row]);
  if (v4 == 2)
  {
    [(PKPaymentPassDetailViewController *)self _didSelectFixPeerPaymentAtIndexPath:v5];
  }
  else if (v4 == 1)
  {
    [(PKPaymentPassDetailViewController *)self _didSelectRedeemAtIndexPath:v5];
  }
}

- (void)_didSelectAccountServicePhysicalCardAtIndexPath:(id)a3
{
  id v4 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v5 = (PKReplacePhysicalCardReasonViewController *)objc_claimAutoreleasedReturnValue();
    [(PKPaymentPassDetailViewController *)self presentViewController:v5 animated:1 completion:0];
LABEL_3:
  }
  else
  {
    switch(-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowForRowIndex:](self, "_accountServicePhysicalCardRowForRowIndex:", [v4 row]))
    {
      case 0uLL:
        id v5 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCard];
        if (v5 && !self->_loadingEnableDisablePhysicalCard)
        {
          if (!self->_inUseAssertion)
          {
            id v6 = (void *)MEMORY[0x1E4F1E5E8];
            uint64_t v7 = PKPassKitCoreBundle();
            id v8 = (CLInUseAssertion *)[v6 newAssertionForBundle:v7 withReason:@"Enable/disable physical card"];
            inUseAssertion = self->_inUseAssertion;
            self->_inUseAssertion = v8;
          }
          self->_loadingEnableDisablePhysicalCard = 1;
          if ([(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCardEnabled])
          {
            [(PKPhysicalCardActionController *)self->_physicalCardActionController disablePhysicalCard:v5];
          }
          else
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            void v15[2] = __85__PKPaymentPassDetailViewController__didSelectAccountServicePhysicalCardAtIndexPath___block_invoke;
            v15[3] = &unk_1E59CDC80;
            void v15[4] = self;
            uint64_t v16 = v5;
            [(PKPaymentPassDetailViewController *)self _presentPhysicalCardPasswordAuthorization:v15];
          }
        }
        goto LABEL_3;
      case 1uLL:
        [(PKPaymentPassDetailViewController *)self presentActivatePhysicalCard];
        break;
      case 2uLL:
        [(PKPaymentPassDetailViewController *)self presentOrderPhysicalCard];
        break;
      case 3uLL:
        id v10 = [PKReplacePhysicalCardReasonViewController alloc];
        int64_t detailViewStyle = self->_detailViewStyle;
        uint64_t v12 = 3;
        if (detailViewStyle != 1) {
          uint64_t v12 = 0;
        }
        if (detailViewStyle == 2) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = v12;
        }
        id v5 = [(PKReplacePhysicalCardReasonViewController *)v10 initWithPhysicalCardController:self->_physicalCardController context:v13];
        uint64_t v14 = [[PKNavigationController alloc] initWithRootViewController:v5];
        [(PKPaymentPassDetailViewController *)self presentViewController:v14 animated:1 completion:0];

        goto LABEL_3;
      case 4uLL:
        [(PKPaymentPassDetailViewController *)self presentTrackPhysicalCard];
        break;
      default:
        break;
    }
  }
}

void __85__PKPaymentPassDetailViewController__didSelectAccountServicePhysicalCardAtIndexPath___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    id v8 = v5;
    [*(id *)(v6 + 1640) enablePhysicalCard:*(void *)(a1 + 40)];
  }
  else
  {
    *(unsigned char *)(v6 + 1658) = 0;
    if (!v5) {
      goto LABEL_6;
    }
    id v8 = v5;
    id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
  }
  id v5 = v8;
LABEL_6:
}

- (void)_presentPhysicalCardPasswordAuthorization:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v6 = [v5 _appleAccountInformation];

    id v7 = objc_alloc_init(MEMORY[0x1E4F4F100]);
    [v7 setPresentingViewController:self];
    id v8 = [v6 appleID];
    [v7 setUsername:v8];

    unint64_t v9 = [v6 aaAlternateDSID];
    [v7 setAltDSID:v9];

    [v7 setIsUsernameEditable:0];
    [v7 setShouldPromptForPasswordOnly:1];
    [v7 setAuthenticationType:2];
    [(PKAccount *)self->_account feature];
    id v10 = [v6 appleID];
    id v11 = PKLocalizedFeatureString();
    objc_msgSend(v7, "setReason:", v11, v10);

    id v12 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke;
    void v13[3] = &unk_1E59DC258;
    void v13[4] = self;
    id v14 = v4;
    [v12 authenticateWithContext:v7 completion:v13];
  }
}

void __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke_2;
  v10[3] = &unk_1E59CE9B0;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) allKeys];
    uint64_t v4 = *(void *)(a1 + 40);
    int v16 = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned result with keys: %@ error: %@", (uint8_t *)&v16, 0x16u);
  }
  id v5 = *(void **)(a1 + 40);
  if (!v5)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  id v6 = [v5 domain];
  uint64_t v7 = *MEMORY[0x1E4F4ED70];
  if ([v6 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v8 = [*(id *)(a1 + 40) code];

    if (v8 == -7003)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_8:
      v9();
      return;
    }
  }
  else
  {
  }
  id v10 = [*(id *)(a1 + 40) domain];
  if ([v10 isEqual:v7])
  {
    uint64_t v11 = [*(id *)(a1 + 40) code];

    if (v11 == -7005)
    {
      id v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      uint64_t v13 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      id v14 = PKDisplayableErrorCustom();

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
  }
  else
  {
  }
  uint64_t v15 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 40), [*(id *)(a1 + 48) _accountFeature], 0, 0);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_didSelectAccountServiceCardNumbersAtIndexPath:(id)a3
{
  [(PKPaymentPassDetailViewController *)self presentCardNumbers];
  uint64_t v4 = *MEMORY[0x1E4F86170];

  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:v4 additionalAnalytics:0];
}

- (void)_didSelectServicingWalletLink
{
  id v2 = [(PKPaymentPass *)self->_pass uniqueID];
  PKOpenPassDetails();
}

- (void)_doneLoadingPeerPaymentAccountAction
{
  uint64_t v3 = [(PKPaymentPassDetailViewController *)self tableView];
  id v5 = [v3 cellForRowAtIndexPath:self->_loadingPeerPaymentAccountActionIndexPath];

  [v5 setAccessoryView:0];
  loadingPeerPaymentAccountActionIndexPath = self->_loadingPeerPaymentAccountActionIndexPath;
  self->_loadingPeerPaymentAccountActionIndexPath = 0;
}

- (void)presentTopUp
{
}

- (void)presentTransferToBank
{
}

- (void)presentAutoReload
{
}

- (void)presentRecurringPaymentsWithIdentifier:(id)a3
{
}

- (void)presentAddCard
{
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:v3];
}

- (void)presentIdentityVerification
{
  if (PKDeviceSupportsPeerPaymentIdentityVerification())
  {
    peerPaymentAccount = self->_peerPaymentAccount;
    if (peerPaymentAccount && self->_pass)
    {
      id v4 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
      id v5 = [(PKPaymentPass *)self->_pass uniqueID];
      id v6 = v4;
      id v7 = v5;
      if (v6 == v7)
      {

        goto LABEL_17;
      }
      uint64_t v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
      }
      else
      {
        char v10 = [v6 isEqualToString:v7];

        if (v10)
        {
LABEL_17:
          if ([(PKPaymentPassDetailViewController *)self _shouldShowAccountActions])
          {
            if (self->_peerPaymentAccountResolution == 2)
            {
              unint64_t v11 = 2;
              goto LABEL_26;
            }
          }
          else if (PKPeerPaymentAccountCanPerformManualIdentityVerification())
          {
            unint64_t v11 = 51;
LABEL_26:
            uint64_t v15 = PKPassDetailSectionTypeToString(v11);
            BOOL v16 = [(PKDynamicTableViewController *)self hasSectionForSectionIdentifier:v15];

            if (v16)
            {
              id v17 = (void *)MEMORY[0x1E4F28D58];
              __int16 v18 = PKPassDetailSectionTypeToString(v11);
              objc_msgSend(v17, "indexPathForRow:inSection:", 0, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v18));
              id v19 = (id)objc_claimAutoreleasedReturnValue();

              [(PKPaymentPassDetailViewController *)self _didSelectPeerPaymentManualIdentityVerificationAtIndexPath:v19];
              goto LABEL_12;
            }
          }
          id v12 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          __int16 v21 = 0;
          uint64_t v13 = "Identity Verification not required";
          id v14 = (uint8_t *)&v21;
          goto LABEL_22;
        }
      }
    }
    id v12 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Will not present peer payment identity verification: peer payment pass is not being presented";
    id v14 = buf;
LABEL_22:
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_23;
  }
  PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentPassDetailViewController *)self presentViewController:v19 animated:1 completion:0];
LABEL_12:
}

- (void)presentISO18013Details
{
  objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", @"IdentityDocumentDetails"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(PKPaymentPassDetailViewController *)self tableView];
  [(PKPaymentPassDetailViewController *)self didSelectIdentityDocumentCellInTableView:v3 atIndexPath:v4];
}

- (void)presentTermsAcceptance
{
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount && self->_pass)
  {
    id v4 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
    id v5 = [(PKPaymentPass *)self->_pass uniqueID];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_12;
    }
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
    }
    else
    {
      char v10 = [v6 isEqualToString:v7];

      if (v10)
      {
LABEL_12:
        unint64_t v11 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsURL];
        id v12 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsIdentifier];
        uint64_t v13 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          uint64_t v15 = [PKPeerPaymentTermsController alloc];
          BOOL v16 = [MEMORY[0x1E4F84E10] sharedService];
          id v17 = [(PKPeerPaymentTermsController *)v15 initWithTermsURL:v11 termsIdentifier:v12 passUniqueID:v13 webService:v16];

          objc_initWeak(location, self);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          void v18[2] = __59__PKPaymentPassDetailViewController_presentTermsAcceptance__block_invoke;
          void v18[3] = &unk_1E59CC670;
          objc_copyWeak(&v19, location);
          [(PKPeerPaymentTermsController *)v17 presentTermsOverController:self showInterstitialViewController:0 withCompletionHandler:v18];
          objc_destroyWeak(&v19);
          objc_destroyWeak(location);
        }
        goto LABEL_20;
      }
    }
  }
  unint64_t v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Will not present peer payment terms for acceptance: peer payment pass is not being presented", (uint8_t *)location, 2u);
  }
LABEL_20:
}

void __59__PKPaymentPassDetailViewController_presentTermsAcceptance__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if ((unint64_t)(a2 - 1) >= 2)
    {
      if (!a2)
      {
        id v7 = [MEMORY[0x1E4F84D80] displayableErrorForError:v9];
        id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

        [v6 presentViewController:v8 animated:1 completion:0];
      }
    }
    else
    {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_didSelectTransferToBank
{
}

- (id)_accountResolutionController
{
  resolutionController = self->_resolutionController;
  if (!resolutionController)
  {
    id v4 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:self->_account accountUserCollection:self->_accountUserCollection transactionSourceCollection:self->_transactionSourceCollection];
    id v5 = self->_resolutionController;
    self->_resolutionController = v4;

    [(PKAccountServiceAccountResolutionController *)self->_resolutionController setDelegate:self];
    resolutionController = self->_resolutionController;
  }

  return resolutionController;
}

- (void)presentSchedulePayments
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) view];
    id v5 = [v4 window];
    id v6 = [v5 windowScene];
    id v7 = [v6 _sceneIdentifier];

    id v8 = (void *)WeakRetained[235];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke_2;
    v9[3] = &unk_1E59CBA68;
    objc_copyWeak(&v10, v2);
    [v8 presentSchedulePayments:v7 completion:v9];
    objc_destroyWeak(&v10);
  }
}

void __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained presentViewController:v5 animated:1 completion:0];
  }
}

- (void)presentCardNumbers
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to present virtual card and card numbers", (uint8_t *)buf, 2u);
  }

  if (PKStoreDemoModeEnabled())
  {
    id v4 = PKUIStoreDemoGatewayViewController();
    [(PKPaymentPassDetailViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    objc_initWeak(buf, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke;
    v5[3] = &unk_1E59CB010;
    objc_copyWeak(&v6, buf);
    void v5[4] = self;
    [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained[206] isLoadingVirtualCard] & 1) == 0)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v3, "indexOfSectionIdentifier:", @"AccountServiceCardNumbers"));
    id v5 = [v3 tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    [v3 _showSpinner:1 inCell:v6 overrideTextColor:0];
    id v7 = [v3[278] creditDetails];
    id v8 = [v7 virtualCards];
    id v9 = [v8 anyObject];

    id v10 = [MEMORY[0x1E4F84D50] sharedService];
    LODWORD(v8) = PKVirtualCardEnabledWithWebService();

    if (v8)
    {
      unint64_t v11 = [MEMORY[0x1E4F85108] cardsForPaymentPass:*(void *)(*(void *)(a1 + 32) + 1072)];
      uint64_t v12 = [v11 anyObject];

      id v9 = (void *)v12;
    }
    uint64_t v13 = [PKAccountCardNumbersPresenter alloc];
    int v14 = [v3[204] hasExpiredPhysicalCardOnly];
    id v15 = v3[204];
    if (v14) {
      [v15 expiredPhysicalCard];
    }
    else {
    BOOL v16 = [v15 primaryPhysicalCard];
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 2152);
    uint64_t v18 = 3;
    if (v17 != 1) {
      uint64_t v18 = 0;
    }
    if (v17 == 2) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v20 = [(PKAccountCardNumbersPresenter *)v13 initWithVirtualCard:v9 physicalCard:v16 account:v3[278] peerPaymentAccount:v3[196] pass:v3[134] context:v19];
    id v21 = v3[206];
    v3[206] = (id)v20;

    id v22 = v3[206];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke_2;
    v24[3] = &unk_1E59CDF60;
    void v24[4] = v3;
    id v25 = v4;
    id v23 = v4;
    [v22 presentCardNumbersWithCompletion:v24];
  }
}

void __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v3 = [*(id *)(a1 + 32) tableView];
  id v4 = [v3 cellForRowAtIndexPath:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _showSpinner:0 inCell:v4 overrideTextColor:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    [v6 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v7 = [v6 navigationController];
    [v7 pushViewController:v8 animated:1];
  }
}

- (void)presentBalanceDetails
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PKPaymentPassDetailViewController_presentBalanceDetails__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__PKPaymentPassDetailViewController_presentBalanceDetails__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [[PKCreditBalanceDetailsViewController alloc] initWithStyle:1 transactionSourceCollection:WeakRetained[276] familyCollection:WeakRetained[283] webService:WeakRetained[274] account:WeakRetained[278] accountUserCollection:WeakRetained[265] physicalCards:WeakRetained[282] statement:0 previousStatements:0];
    BOOL v3 = [*(id *)(a1 + 32) navigationController];
    [v3 pushViewController:v2 animated:1];
  }
}

- (void)presentBankAccounts
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[1656])
  {
    WeakRetained[1656] = 1;
    id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(WeakRetained, "indexOfSectionIdentifier:", @"AccountServiceBankAccounts"));
    id v5 = [v3 tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    [v3 _showSpinner:1 inCell:v6 overrideTextColor:0];
    id v7 = [PKAccountBankAccountsViewController alloc];
    uint64_t v8 = v3[269];
    uint64_t v9 = 3;
    if (v8 != 1) {
      uint64_t v9 = 0;
    }
    if (v8 == 2) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = v9;
    }
    unint64_t v11 = [(PKAccountBankAccountsViewController *)v7 initWithAccount:v3[278] paymentWebService:v3[274] context:v10];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_2;
    void v13[3] = &unk_1E59CBA18;
    objc_copyWeak(&v15, v1);
    uint64_t v12 = v11;
    int v14 = v12;
    [(PKAccountBankAccountsViewController *)v12 preflightWithCompletion:v13];

    objc_destroyWeak(&v15);
  }
}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_3;
  v7[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v11 = WeakRetained;
    BOOL v3 = objc_msgSend(WeakRetained[175], "objectAtIndex:", objc_msgSend(WeakRetained[191], "selectedSegmentIndex"));
    uint64_t v4 = [v3 unsignedIntegerValue];

    if (!v4)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v11, "indexOfSectionIdentifier:", @"AccountServiceBankAccounts"));
      id v6 = [v11 tableView];
      id v7 = [v6 cellForRowAtIndexPath:v5];

      [v11 _showSpinner:0 inCell:v7 overrideTextColor:0];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 56) || v8)
    {
      id v9 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v8, [v11[278] feature], 0, 0);
      id v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      [v11 presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      id v9 = [v11 navigationController];
      [v9 pushViewController:*(void *)(a1 + 40) animated:1];
    }

    id WeakRetained = v11;
    *((unsigned char *)v11 + 1656) = 0;
  }
}

- (void)presentAccountUserDetailsForAccountUserAltDSID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PKPaymentPassDetailViewController_presentAccountUserDetailsForAccountUserAltDSID___block_invoke;
  v6[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, &location);
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __84__PKPaymentPassDetailViewController_presentAccountUserDetailsForAccountUserAltDSID___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_23;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(*(void *)(v1 + 32) + 2272);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  id v19 = WeakRetained;
  uint64_t v6 = *(void *)v22;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v22 != v6) {
      objc_enumerationMutation(v3);
    }
    id v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    id v9 = v3;
    id v10 = [v8 accountUser];
    char v11 = [v10 altDSID];
    uint64_t v12 = v1;
    uint64_t v13 = *(void **)(v1 + 40);
    id v14 = v11;
    id v15 = v13;
    if (v14 == v15) {
      break;
    }
    BOOL v16 = v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {

      uint64_t v1 = v12;
      id v3 = v9;
    }
    else
    {
      char v20 = [v14 isEqualToString:v15];

      uint64_t v1 = v12;
      id v3 = v9;
      if (v20) {
        goto LABEL_20;
      }
    }
LABEL_16:
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        goto LABEL_4;
      }
      id WeakRetained = v19;
      goto LABEL_22;
    }
  }

  uint64_t v1 = v12;
  id v3 = v9;
LABEL_20:
  id v18 = v8;

  id WeakRetained = v19;
  if (!v18) {
    goto LABEL_23;
  }
  [*(id *)(v1 + 32) presentAccountUserDetailsForRowModel:v18];
  id v3 = v18;
LABEL_22:

LABEL_23:
}

- (void)presentAccountUserInvitationWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentPassDetailViewController_presentAccountUserInvitationWithIdentifier___block_invoke;
  v6[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, &location);
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __80__PKPaymentPassDetailViewController_presentAccountUserInvitationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_23;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(*(void *)(v1 + 32) + 2272);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  id v19 = WeakRetained;
  uint64_t v6 = *(void *)v22;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v22 != v6) {
      objc_enumerationMutation(v3);
    }
    id v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    id v9 = v3;
    id v10 = [v8 invitation];
    char v11 = [v10 applicationIdentifier];
    uint64_t v12 = v1;
    uint64_t v13 = *(void **)(v1 + 40);
    id v14 = v11;
    id v15 = v13;
    if (v14 == v15) {
      break;
    }
    BOOL v16 = v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {

      uint64_t v1 = v12;
      id v3 = v9;
    }
    else
    {
      char v20 = [v14 isEqualToString:v15];

      uint64_t v1 = v12;
      id v3 = v9;
      if (v20) {
        goto LABEL_20;
      }
    }
LABEL_16:
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        goto LABEL_4;
      }
      id WeakRetained = v19;
      goto LABEL_22;
    }
  }

  uint64_t v1 = v12;
  id v3 = v9;
LABEL_20:
  id v18 = v8;

  id WeakRetained = v19;
  if (!v18) {
    goto LABEL_23;
  }
  [*(id *)(v1 + 32) presentAccountUserInvitationForRowModel:v18];
  id v3 = v18;
LABEL_22:

LABEL_23:
}

- (void)presentShareAccount
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PKPaymentPassDetailViewController_presentShareAccount__block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PKPaymentPassDetailViewController_presentShareAccount__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained presentAddAccountUser];
    id WeakRetained = v2;
  }
}

- (void)presentMakeDefaultAtApple
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PKPaymentPassDetailViewController_presentMakeDefaultAtApple__block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__PKPaymentPassDetailViewController_presentMakeDefaultAtApple__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v13 = WeakRetained;
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:WeakRetained[274]];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:v13[278]];
    [v3 setPaymentPass:v13[134]];
    id v4 = [PKAccountFlowController alloc];
    uint64_t v5 = v13[269];
    uint64_t v6 = 3;
    if (v5 != 1) {
      uint64_t v6 = 0;
    }
    if (v5 == 2) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = v6;
    }
    id v8 = [(PKAccountFlowController *)v4 initWithAccountCredential:v3 provisioningController:v2 setupDelegate:0 context:v7 operations:24];
    id v9 = [(PKAccountFlowController *)v8 firstAccountViewController];
    id v10 = [[PKNavigationController alloc] initWithRootViewController:v9];
    if (v13[269] == 2)
    {
      char v11 = PKBridgeAppearanceGetAppearanceSpecifier();
      PKAppearanceApplyToContainer(v11, v10);
    }
    uint64_t v12 = [v13 navigationController];
    [v12 presentViewController:v10 animated:1 completion:0];

    id WeakRetained = v13;
  }
}

- (void)presentOrderPhysicalCard
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1657])
  {
    id v3 = [WeakRetained tableView];
    uint64_t v4 = [v2 indexOfSectionIdentifier:@"AccountServicePhysicalCard"];
    uint64_t v5 = [v2 _rowIndexForAccountServicePhysicalCardRow:2];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:v4];
      [v3 scrollToRowAtIndexPath:v6 atScrollPosition:1 animated:1];
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v2[1657] = 1;
      [v2 reloadSection:21];
      uint64_t v7 = (void *)*((void *)v2 + 204);
      uint64_t v8 = *((void *)v2 + 269);
      uint64_t v9 = 3;
      if (v8 != 1) {
        uint64_t v9 = 0;
      }
      if (v8 == 2) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = v9;
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_2;
      v11[3] = &unk_1E59D9FE0;
      void v11[4] = v2;
      [v7 orderFlowViewControllerForReason:0 content:v10 completion:v11];
    }
  }
}

void __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_3;
  aBlock[3] = &unk_1E59CA7D0;
  void aBlock[4] = *(void *)(a1 + 32);
  uint64_t v7 = _Block_copy(aBlock);
  if (v5)
  {
    uint64_t v8 = [[PKNavigationController alloc] initWithRootViewController:v5];
    [(PKNavigationController *)v8 setModalPresentationStyle:2];
LABEL_5:
    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:v7];

    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v8 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1657) = 0;
  return [*(id *)(a1 + 32) reloadSection:21];
}

- (void)presentReplacePhysicalCard
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[1659])
  {
    id v5 = [WeakRetained tableView];
    uint64_t v6 = [v4 indexOfSectionIdentifier:@"AccountServicePhysicalCard"];
    uint64_t v7 = [v4 _rowIndexForAccountServicePhysicalCardRow:3];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:v6];
      [v5 scrollToRowAtIndexPath:v8 atScrollPosition:1 animated:1];
    }
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4[1659] = 1;
      [v4 reloadSection:21];
      uint64_t v9 = (void *)*((void *)v4 + 204);
      uint64_t v10 = *((void *)v4 + 269);
      uint64_t v11 = 3;
      if (v10 != 1) {
        uint64_t v11 = 0;
      }
      if (v10 == 2) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v11;
      }
      uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 1632) primaryPhysicalCard];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_2;
      v14[3] = &unk_1E59DF620;
      objc_copyWeak(&v15, v2);
      [v9 replaceFlowViewControllerForReason:1 content:v12 currentPhysicalCard:v13 completion:v14];

      objc_destroyWeak(&v15);
    }
  }
}

void __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_3;
    aBlock[3] = &unk_1E59CA7D0;
    void aBlock[4] = WeakRetained;
    uint64_t v9 = _Block_copy(aBlock);
    if (v5)
    {
      uint64_t v10 = [[PKNavigationController alloc] initWithRootViewController:v5];
      [(PKNavigationController *)v10 setModalPresentationStyle:2];
    }
    else
    {
      if (!v6)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v10 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    }
    [v8 presentViewController:v10 animated:1 completion:v9];

    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1659) = 0;
  return [*(id *)(a1 + 32) reloadSection:21];
}

- (void)presentActivatePhysicalCard
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PKPaymentPassDetailViewController_presentActivatePhysicalCard__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __64__PKPaymentPassDetailViewController_presentActivatePhysicalCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [PKPhysicalCardManualActivationViewController alloc];
    id v3 = [MEMORY[0x1E4F84270] sharedInstance];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 2224);
    uint64_t v6 = *(void *)(v4 + 1072);
    uint64_t v7 = [*(id *)(v4 + 1632) unactivatedPhysicalCard];
    uint64_t v8 = [(PKPhysicalCardManualActivationViewController *)v2 initWithAccountService:v3 account:v5 accountUser:0 paymentPass:v6 physicalCard:v7 activationCode:0];

    uint64_t v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
    [WeakRetained presentViewController:v9 animated:1 completion:0];
  }
}

- (void)presentTrackPhysicalCard
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_presentTrackPhysicalCard__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PKPaymentPassDetailViewController_presentTrackPhysicalCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1632) unactivatedPhysicalCard];
    id v4 = [v3 shipmentTrackingURL];
    if (v4
      || ([v3 latestShippingActivity],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          [v5 shipmentTrackingURL],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4))
    {
      uint64_t v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v6 openURL:v4 configuration:0 completionHandler:0];
    }
    id WeakRetained = v7;
  }
}

- (void)showStatementDetailsWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke;
  v6[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, &location);
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 2184);
    id v5 = [*(id *)(v3 + 2224) accountIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E59DF648;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    id v11 = WeakRetained;
    [v4 creditStatementsForAccountIdentifier:v5 completion:v8];
  }
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    BOOL v16 = __Block_byref_object_copy__65;
    BOOL v17 = __Block_byref_object_dispose__65;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_3;
    v10[3] = &unk_1E59D4AB8;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = &v13;
    [v5 enumerateObjectsUsingBlock:v10];
    if (v14[5])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_4;
      block[3] = &unk_1E59D28A8;
      long long v8 = *(_OWORD *)(a1 + 40);
      id v9 = &v13;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  uint64_t v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_9;
  }
  int v8 = [v5 isEqualToString:v6];

  if (v8)
  {
LABEL_7:
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v11;
    id v5 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v10;
LABEL_9:
  }
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_4(uint64_t a1)
{
  id v2 = [PKCreditBalanceDetailsViewController alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [(PKCreditBalanceDetailsViewController *)v2 initWithStyle:1 transactionSourceCollection:v3[276] familyCollection:v3[283] webService:v3[274] account:v3[278] accountUserCollection:v3[265] physicalCards:v3[282] statement:0 previousStatements:0];
  id v4 = [*(id *)(a1 + 40) navigationController];
  [v4 pushViewController:v5 animated:0];

  [(PKCreditBalanceDetailsViewController *)v5 showStatement:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) style:1];
}

- (void)presentBillPayment
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PKPaymentPassDetailViewController_presentBillPayment__block_invoke;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __55__PKPaymentPassDetailViewController_presentBillPayment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) didSelectMakePayment];
    id WeakRetained = v3;
  }
}

- (void)presentInstallmentPlansForFeature:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PKPaymentPassDetailViewController_presentInstallmentPlansForFeature___block_invoke;
  v4[3] = &unk_1E59CB010;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__PKPaymentPassDetailViewController_presentInstallmentPlansForFeature___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[278];
    if (v4)
    {
      char v20 = v3;
      id v5 = [v4 creditDetails];
      id v6 = [v5 installmentPlans];
      uint64_t v7 = [v6 count];

      if (v7 == 1)
      {
        int v8 = [v20[278] creditDetails];
        uint64_t v9 = [v8 installmentPlans];
        id v10 = [v9 allObjects];
        id v11 = [v10 firstObject];

        if (!v11)
        {
LABEL_8:

          id v3 = v20;
          goto LABEL_9;
        }
        uint64_t v12 = *(void **)(a1 + 32);
        uint64_t v13 = [v11 identifier];
        [v12 presentInstallmentPlanWithIdentifier:v13];
      }
      else
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F84A88]);
        id v14 = [PKInstallmentPlansViewController alloc];
        id v15 = v20[278];
        id v16 = v20[265];
        id v17 = v20[282];
        id v18 = [MEMORY[0x1E4F84270] sharedInstance];
        uint64_t v13 = [(PKInstallmentPlansViewController *)v14 initWithAccount:v15 accountUserCollection:v16 physicalCards:v17 accountService:v18 transactionSourceCollection:v20[276] familyCollection:v20[283] dataProvider:v11];

        id v19 = [v20 navigationController];
        [v19 pushViewController:v13 animated:1];
      }
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)presentInstallmentPlanWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__PKPaymentPassDetailViewController_presentInstallmentPlanWithIdentifier___block_invoke;
    v5[3] = &unk_1E59CB010;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(PKPaymentPassDetailViewController *)self executeAfterContentIsLoaded:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __74__PKPaymentPassDetailViewController_presentInstallmentPlanWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[278];
    if (v4)
    {
      id v10 = v3;
      id v5 = [v4 creditDetails];

      id v3 = v10;
      if (v5)
      {
        id v6 = [v10[278] creditDetails];
        id v7 = [v6 installmentPlanWithIdentifier:*(void *)(a1 + 32)];

        if (v7)
        {
          int v8 = [[PKTransactionHistoryViewController alloc] initWithInstallmentPlan:v7 transactionSourceCollection:v10[276] familyCollection:v10[283] account:v10[278] accountUserCollection:v10[265] physicalCards:v10[282]];
          uint64_t v9 = [v10 navigationController];
          [v9 pushViewController:v8 animated:1];
        }
        id v3 = v10;
      }
    }
  }
}

- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 detailText:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  [(PKPaymentPassDetailViewController *)self _showSpinner:v6 inCell:v9 overrideTextColor:0];
  id v10 = [v9 detailTextLabel];

  [v10 setText:v8];
}

- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 overrideTextColor:(id)a5
{
  BOOL v6 = a3;
  id v15 = (UIColor *)a5;
  id v8 = a4;
  id v9 = [v8 textLabel];
  primaryTextColor = v15;
  if (v15 || (primaryTextColor = self->_primaryTextColor) != 0)
  {
    id v11 = primaryTextColor;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] labelColor];
  }
  uint64_t v12 = v11;
  if (v6)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v13 startAnimating];
    uint64_t v14 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

    uint64_t v12 = (void *)v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v9 setTextColor:v12];
  [v8 setAccessoryView:v13];
}

- (void)_didSelectFixPeerPaymentAtIndexPath:(id)a3
{
  id v4 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  id v18 = [v4 account];

  if (!self->_peerPaymentAccountResolutionControllerForAccountService)
  {
    id v5 = [PKPeerPaymentAccountResolutionController alloc];
    int64_t detailViewStyle = self->_detailViewStyle;
    uint64_t v7 = 3;
    if (detailViewStyle != 1) {
      uint64_t v7 = 0;
    }
    if (detailViewStyle == 2) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = v7;
    }
    id v9 = [(PKPeerPaymentAccountResolutionController *)v5 initWithAccount:v18 webService:self->_peerPaymentWebService context:v8 delegate:self passLibraryDataProvider:self->_passLibraryDataProvider];
    peerPaymentAccountResolutionControllerForAccountService = self->_peerPaymentAccountResolutionControllerForAccountService;
    self->_peerPaymentAccountResolutionControllerForAccountService = v9;
  }
  uint64_t v11 = [v18 pendingPaymentCount];
  uint64_t v12 = PKSharedCacheGetStringForKey();
  if (v18)
  {
    unint64_t cashbackResolution = self->_cashbackResolution;
    if (cashbackResolution == 1 && v11 == 1)
    {
      if ([v12 length])
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F84D60]);
        [v15 setRegistrationFlowState:2];
        [v15 setSenderAddress:v12];
        [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionControllerForAccountService presentFlowForAccountResolution:1 configuration:v15 completion:0];

        goto LABEL_19;
      }
      unint64_t cashbackResolution = self->_cashbackResolution;
    }
    [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionControllerForAccountService presentFlowForAccountResolution:cashbackResolution configuration:0 completion:0];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
    id v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v17 openSensitiveURL:v16 withOptions:0];
  }
LABEL_19:
}

- (void)_didSelectRedeemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_redeemingRewards)
  {
    id v5 = [(PKAccount *)self->_account creditDetails];
    BOOL v6 = [v5 accountSummary];
    if (v6)
    {
      self->_redeemingRewards = 1;
      uint64_t v7 = [(PKPaymentPassDetailViewController *)self tableView];
      id v47 = v4;
      uint64_t v8 = [v7 cellForRowAtIndexPath:v4];

      id v9 = [v8 textLabel];
      id v43 = [v9 text];

      id v10 = [v8 textLabel];
      id v42 = [v10 textColor];

      uint64_t v11 = [v8 detailTextLabel];
      id v41 = [v11 text];

      uint64_t v12 = [v8 detailTextLabel];
      id v40 = [v12 textColor];

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v13 startAnimating];
      id v44 = v13;
      [v8 setAccessoryView:v13];
      uint64_t v14 = [v8 textLabel];
      id v15 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v14 setTextColor:v15];

      id v16 = [v8 textLabel];
      [(PKPaymentPassDetailViewController *)self _accountFeature];
      id v17 = PKLocalizedFeatureString();
      [v16 setText:v17];

      id v45 = v8;
      id v18 = [v8 detailTextLabel];
      [v18 setText:0];

      id v19 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      char v20 = v19;
      if (!v19) {
        goto LABEL_5;
      }
      long long v21 = [v19 altDSID];
      long long v22 = [v6 accountUserActivityForAccountUserAltDSID:v21];
      uint64_t v23 = [v22 rewardsBalance];

      if (!v23)
      {
LABEL_5:
        uint64_t v23 = [v6 rewardsBalance];
      }
      uint64_t v39 = (void *)v23;
      id v24 = objc_alloc_init(MEMORY[0x1E4F841B0]);
      [v24 setActionType:0];
      [v24 setAmount:v23];
      id v25 = [v5 currencyCode];
      [v24 setCurrencyCode:v25];

      [v24 setRedemptionType:2];
      uint64_t v26 = [MEMORY[0x1E4F29128] UUID];
      id v27 = [v26 UUIDString];
      [v24 setIdentifier:v27];

      long long v46 = v5;
      accountService = self->_accountService;
      long long v29 = [(PKAccount *)self->_account accountIdentifier];
      uint64_t v30 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      uint64_t v31 = [v30 altDSID];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke;
      v48[3] = &unk_1E59DF670;
      id v38 = v20;
      v48[4] = self;
      id v49 = v43;
      id v50 = v41;
      id v51 = v42;
      id v52 = v40;
      id v32 = v40;
      id v33 = v42;
      id v34 = v41;
      uint64_t v35 = v6;
      id v36 = v43;
      id v37 = accountService;
      id v5 = v46;
      [(PKAccountService *)v37 performAccountAction:v24 withAccountIdentifier:v29 accountUserAltDSID:v31 completion:v48];

      BOOL v6 = v35;
      id v4 = v47;
    }
  }
}

void __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E59D9298;
  uint64_t v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1730) = 0;
  id v2 = *(void **)(a1 + 40);
  if (v2 && !*(void *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 2224), v2);
    *(unsigned char *)(*(void *)(a1 + 32) + 1672) = 0;
    [*(id *)(a1 + 32) reloadPassDetailSections:&unk_1EF2BA2C0];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 1880);
    uint64_t v18 = *(void *)(v16 + 2224);
    [v17 updateWithAccount:v18];
  }
  else
  {
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "objectAtIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1528), "selectedSegmentIndex"));
    uint64_t v4 = [v3 unsignedIntegerValue];

    if (!v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) indexOfSectionIdentifier:@"AccountServiceRewardsDetails"];
      uint64_t v6 = [*(id *)(a1 + 32) _accountServiceRewardsRowForRowIndex:1];
      uint64_t v7 = [*(id *)(a1 + 32) tableView];
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:v5];
      id v9 = [v7 cellForRowAtIndexPath:v8];

      if (v9)
      {
        [v9 setAccessoryView:0];
        id v10 = [v9 textLabel];
        [v10 setText:*(void *)(a1 + 56)];

        id v11 = [v9 detailTextLabel];
        [v11 setText:*(void *)(a1 + 64)];

        id v12 = [v9 textLabel];
        [v12 setTextColor:*(void *)(a1 + 72)];

        id v13 = [v9 detailTextLabel];
        [v13 setTextColor:*(void *)(a1 + 80)];
      }
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v14, [*(id *)(*(void *)(a1 + 32) + 2224) feature], 0, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = PKAlertForDisplayableErrorWithHandlers(v19, 0, 0, 0);
      [*(id *)(a1 + 32) presentViewController:v15 animated:1 completion:0];
    }
  }
}

- (BOOL)_shouldShowNetworkBenefitsCell
{
  if (!self->_account
    || [(PKPaymentPassDetailViewController *)self _shouldShowProductBenefitsCell])
  {
    return 0;
  }
  uint64_t v4 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A68]];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (void)_didSelectNetworkBenefitsCell
{
  id v5 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A68]];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v4 openURL:v3 configuration:0 completionHandler:0];
  }
  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:*MEMORY[0x1E4F86F08] additionalAnalytics:0];
}

- (BOOL)_shouldShowProductBenefitsCell
{
  if (!self->_account) {
    return 0;
  }
  id v2 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A78]];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)_didSelectProductBenefitsCell
{
  id v5 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A78]];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v4 openURL:v3 configuration:0 completionHandler:0];
  }
  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedRowTag:*MEMORY[0x1E4F86F30] additionalAnalytics:0];
}

- (void)_didSelectCreditDetailsCell:(id)a3
{
  if (!-[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowForRowIndex:](self, "_accountServiceCreditDetailsRowForRowIndex:", [a3 row])&& -[PKPaymentPassDetailViewController isTotalBalanceCellSelectable](self, "isTotalBalanceCellSelectable"))
  {
    id v5 = [[PKCreditBalanceDetailsViewController alloc] initWithStyle:1 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection webService:self->_webService account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards statement:0 previousStatements:0];
    uint64_t v4 = [(PKPaymentPassDetailViewController *)self navigationController];
    [v4 pushViewController:v5 animated:1];
  }
}

- (BOOL)isTotalBalanceCellSelectable
{
  return self->_detailViewStyle != 2;
}

- (void)_showPeerPaymentActionViewControllerForAction:(unint64_t)a3
{
  id v15 = 0;
  uint64_t v16 = 0;
  BOOL v5 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:a3 account:self->_peerPaymentAccount unableReason:&v16 displayableError:&v15];
  id v6 = v15;
  if (v5)
  {
    int64_t detailViewStyle = self->_detailViewStyle;
    uint64_t v8 = 3;
    if (detailViewStyle != 1) {
      uint64_t v8 = 0;
    }
    if (detailViewStyle == 2) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = v8;
    }
    id v10 = +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:a3 paymentPass:self->_pass webService:self->_peerPaymentWebService passLibraryDataProvider:self->_passLibraryDataProvider context:v9];
    [(PKPeerPaymentActionViewController *)v10 setDelegate:self];
    peerPaymentActionViewController = self->_peerPaymentActionViewController;
    self->_peerPaymentActionViewController = v10;
    id v12 = v10;

    id v13 = [[PKNavigationController alloc] initWithRootViewController:v12];
    [(PKNavigationController *)v13 setSupportedInterfaceOrientations:2];
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v13 setModalPresentationStyle:2];
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__PKPaymentPassDetailViewController__showPeerPaymentActionViewControllerForAction___block_invoke;
    v14[3] = &unk_1E59CA7D0;
    void v14[4] = self;
    id v13 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v16 displayableError:v6 addCardActionHandler:v14];
  }
  [(PKPaymentPassDetailViewController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __83__PKPaymentPassDetailViewController__showPeerPaymentActionViewControllerForAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 presentingViewController];

  if (v4) {
    [v7 presentingViewController];
  }
  else {
  BOOL v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];

  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;
}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 presentingViewController];

  if (v4) {
    [v7 presentingViewController];
  }
  else {
  BOOL v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];

  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;
}

- (void)_updatePeerPaymentAccount
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentPassDetailViewController__updatePeerPaymentAccount__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKPaymentPassDetailViewController__updatePeerPaymentAccount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 2200) targetDevice];
  id obj = [v2 account];

  BOOL v3 = [obj associatedPassUniqueID];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1072) uniqueID];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1568), obj);
    [*(id *)(*(void *)(a1 + 32) + 1712) setAccount:*(void *)(*(void *)(a1 + 32) + 1568)];
    [*(id *)(*(void *)(a1 + 32) + 1520) setPeerPaymentAccount:*(void *)(*(void *)(a1 + 32) + 1568)];
    [*(id *)(a1 + 32) _updateHeaderActionView];
    [*(id *)(*(void *)(a1 + 32) + 1600) setAccount:*(void *)(*(void *)(a1 + 32) + 1568)];
    *(void *)(*(void *)(a1 + 32) + 1720) = [*(id *)(*(void *)(a1 + 32) + 1712) currentPeerPaymentAccountResolution];
    [*(id *)(a1 + 32) _updateCashbackPeerPaymentResolutionSection];
    [*(id *)(a1 + 32) _updatePeerPaymentFamilyMemberRows];
    [*(id *)(a1 + 32) _reloadView];
  }
}

- (void)_updatePeerPaymentFamilyMemberRows
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = self->_sortedFamilyMemberRowModels;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "familyMember", (void)v13);
        id v10 = [v9 altDSID];

        id v11 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithAltDSID:v10];
        [v8 setAccount:v11];

        id v12 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount accountInvitationWithAltDSID:v10];
        [v8 setInvitation:v12];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_updatePeerPaymentPreferences
{
  peerPaymentWebService = self->_peerPaymentWebService;
  if (peerPaymentWebService)
  {
    uint64_t v4 = [(PKPeerPaymentWebService *)peerPaymentWebService targetDevice];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
      id v7 = [v6 preferences];
      peerPaymentPreferences = self->_peerPaymentPreferences;
      self->_peerPaymentPreferences = v7;

      [(PKPaymentPassDetailViewController *)self _updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary];
    }
    else
    {
      self->_loadingPeerPaymentPreferences = 1;
      [(PKSpinnerHeaderView *)self->_peerPaymentPreferencesHeaderView setShowSpinner:1];
      uint64_t v9 = self->_peerPaymentWebService;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke;
      v10[3] = &unk_1E59DF698;
      void v10[4] = self;
      [(PKPeerPaymentWebService *)v9 peerPaymentPreferencesWithCompletion:v10];
    }
  }
}

void __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 peerPaymentPreferences];
  if (v5)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching peer payment preferences: %@", buf, 0xCu);
    }

    uint64_t v6 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke_1322;
  v9[3] = &unk_1E59CA870;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke_1322(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1584) = 0;
  [*(id *)(*(void *)(a1 + 32) + 1592) setShowSpinner:0];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1576), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary];
}

- (void)_updateAmpEligibility
{
  if ([(PKPaymentPassDetailViewController *)self _accountInGoodStateForAMPEligbilityCheck])
  {
    if (!self->_loadingAMPEligibility)
    {
      self->_int64_t isAmpEligible = 0;
      self->_loadingAMPEligibilitdouble y = 1;
      [(PKPaymentPassDetailViewController *)self reloadSection:19];
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke;
      aBlock[3] = &unk_1E59CEAC0;
      objc_copyWeak(&v12, &location);
      BOOL v3 = _Block_copy(aBlock);
      uint64_t v4 = [MEMORY[0x1E4F84188] sharedManager];
      [v4 registerObserver:self];
      pass = self->_pass;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v9[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_3;
      v9[3] = &unk_1E59DF6C0;
      id v10 = v3;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_1324;
      v7[3] = &unk_1E59CE160;
      id v6 = v10;
      id v8 = v6;
      [v4 enrollmentStatusForPaymentPass:pass completion:v9 progress:v7];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_2;
    v5[3] = &unk_1E59CDA78;
    void v5[4] = WeakRetained;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ampEligbilityUpdated:*(unsigned __int8 *)(a1 + 40)];
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134349314;
    uint64_t v8 = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass completion status: %{public}lu error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1, v5);
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_1324(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (a2) {
      int v7 = @"YES";
    }
    int v8 = 138412546;
    __int16 v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass progress success: %@ error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ampEnrollmentManager:(id)a3 didEnrollPaymentPass:(id)a4 success:(BOOL)a5
{
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentPassDetailViewController_ampEnrollmentManager_didEnrollPaymentPass_success___block_invoke;
  block[3] = &unk_1E59CD7B0;
  id v10 = v7;
  id v11 = self;
  BOOL v12 = a5;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__PKPaymentPassDetailViewController_ampEnrollmentManager_didEnrollPaymentPass_success___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) uniqueID];
  BOOL v3 = [*(id *)(*(void *)(a1 + 40) + 1072) uniqueID];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        char v6 = @"YES";
      }
      else {
        char v6 = @"NO";
      }
      int v8 = 138412290;
      __int16 v9 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "ampEnrollmentManager didEnrollPaymentPass: success: %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      [v7 _ampEligbilityUpdated:0];
    }
    else {
      [v7 _updateAmpEligibility];
    }
  }
}

- (void)_ampEligbilityUpdated:(BOOL)a3
{
  self->_loadingAMPEligibilitdouble y = 0;
  self->_int64_t isAmpEligible = a3;
  [(PKPaymentPassDetailViewController *)self reloadData:0];
}

- (void)_handlePeerPaymentPreferencestDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentPassDetailViewController__handlePeerPaymentPreferencestDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKPaymentPassDetailViewController__handlePeerPaymentPreferencestDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePeerPaymentPreferences];
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke;
  aBlock[3] = &unk_1E59CB1C8;
  void aBlock[4] = self;
  int v4 = _Block_copy(aBlock);
  id v5 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
  if (v5)
  {
    char v6 = [MEMORY[0x1E4F84270] sharedInstance];
    [v6 accountWithIdentifier:v5 completion:v4];
  }
}

void __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  if (v1)
  {
    uint64_t v2 = result;
    objc_storeStrong((id *)(*(void *)(result + 40) + 2224), v1);
    objc_msgSend(*(id *)(*(void *)(v2 + 40) + 1944), "setFeatureIdentifier:", objc_msgSend(*(id *)(v2 + 32), "feature"));
    [*(id *)(*(void *)(v2 + 40) + 1632) updateWithAccount:*(void *)(v2 + 32)];
    [*(id *)(v2 + 40) _updateBalanceIfNecessary];
    [*(id *)(v2 + 40) fetchFinancingPlansIfNecessary];
    id v3 = *(void **)(v2 + 40);
    return [v3 _reloadView];
  }
  return result;
}

- (void)merchantTokensViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  merchantTokensResponse = self->_merchantTokensResponse;
  id v6 = a4;
  id v7 = [(PKRetrieveMerchantTokensResponse *)merchantTokensResponse merchantTokens];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    __int16 v9 = self->_merchantTokensResponse;
    self->_merchantTokensResponse = 0;

    [(PKPaymentPassDetailViewController *)self _reloadMerchantTokenRows];
    [(PKPaymentPassDetailViewController *)self _fetchMerchantTokens];
  }
}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  merchantTokensResponse = self->_merchantTokensResponse;
  id v6 = a4;
  id v7 = [(PKRetrieveMerchantTokensResponse *)merchantTokensResponse merchantTokens];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    __int16 v9 = self->_merchantTokensResponse;
    self->_merchantTokensResponse = 0;

    [(PKPaymentPassDetailViewController *)self _reloadMerchantTokenRows];
    [(PKPaymentPassDetailViewController *)self _fetchMerchantTokens];
  }
}

- (void)_startPendingTransactionTimer
{
  [(PKPaymentPassDetailViewController *)self _cancelPendingTransactionTimer];
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  transactionTimer = self->_transactionTimer;
  self->_transactionTimer = v3;

  id v5 = self->_transactionTimer;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  id v7 = self->_transactionTimer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __66__PKPaymentPassDetailViewController__startPendingTransactionTimer__block_invoke;
  v8[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_transactionTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__PKPaymentPassDetailViewController__startPendingTransactionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reloadTransactionSectionsAnimated:1 forceReload:0];
    uint64_t v2 = (void *)v3[132];
    v3[132] = 0;

    id WeakRetained = v3;
  }
}

- (void)_cancelPendingTransactionTimer
{
  transactionTimer = self->_transactionTimer;
  if (transactionTimer)
  {
    dispatch_source_cancel(transactionTimer);
    uint64_t v4 = self->_transactionTimer;
    self->_transactionTimer = 0;
  }
}

- (void)_updateHeaderActionView
{
  if (self->_hasTabBar) {
    [(PKPaymentPassDetailViewController *)self _updateTabBar];
  }
}

- (void)_updateTabBar
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  [v4 addObject:&unk_1EF2B9B70];
  if ([(PKPaymentPassDetailViewController *)self _shouldShowTransactions]) {
    [v4 addObject:&unk_1EF2B9B88];
  }
  if ([v4 count])
  {
    id v3 = v4;
  }
  else
  {

    id v3 = 0;
  }
  id v5 = v3;
  if ((PKEqualObjects() & 1) == 0) {
    [(PKPaymentPassDetailViewController *)self _updateTabBarWithSegments:v5];
  }
}

- (void)_updateSectionControllersWithSelectedSectionSegment
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_sectionControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          tabBar = self->_tabBar;
          id v10 = v8;
          objc_msgSend(v10, "setCurrentSegment:", -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex", (void)v11));
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_updateTabBarWithSegments:(id)a3
{
  id v22 = a3;
  unint64_t v5 = [v22 count];
  tabBar = self->_tabBar;
  if (tabBar)
  {
    uint64_t v4 = [(UISegmentedControl *)tabBar selectedSegmentIndex];
    p_tabBarSegments = &self->_tabBarSegments;
    tabBarSegments = self->_tabBarSegments;
    uint64_t v9 = -1;
    if (tabBarSegments && (v4 & 0x8000000000000000) == 0)
    {
      id v10 = -[NSArray objectAtIndexedSubscript:](tabBarSegments, "objectAtIndexedSubscript:");
      uint64_t v11 = [v22 indexOfObject:v10];

      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = v11;
      }
    }
  }
  else
  {
    p_tabBarSegments = &self->_tabBarSegments;
    uint64_t v9 = -1;
  }
  if (v5) {
    BOOL v12 = v9 <= -1;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v9;
  }
  uint64_t v14 = objc_msgSend(v22, "copy", v4);
  long long v15 = *p_tabBarSegments;
  *p_tabBarSegments = (NSArray *)v14;

  uint64_t v16 = [(PKPaymentPassDetailViewController *)self viewIfLoaded];
  if (v16)
  {
    id v17 = self->_tabBar;
    if (v17)
    {
      [(UISegmentedControl *)v17 removeTarget:self action:sel__tabBarSegmentChanged_ forControlEvents:4096];
      [(UISegmentedControl *)self->_tabBar removeFromSuperview];
      uint64_t v18 = self->_tabBar;
      self->_tabBar = 0;
    }
    if (self->_hasTabBar && v5 >= 2)
    {
      char v20 = [(PKPaymentPassDetailViewController *)self _createTabBarWithSelectedIndex:v13];
      long long v21 = self->_tabBar;
      self->_tabBar = v20;

      [(UITableViewHeaderFooterView *)self->_headerView addSubview:self->_tabBar];
    }
    if (v9 < 0) {
      [(PKPaymentPassDetailViewController *)self reloadData:0];
    }
    if ([(PKPaymentPassDetailViewController *)self _updateHeaderHeightDeterminingLayout:0])
    {
      [v16 setNeedsLayout];
    }
  }
}

- (BOOL)_updateHeaderHeightDeterminingLayout:(BOOL)a3
{
  uint64_t v4 = [(PKPaymentPassDetailViewController *)self tableView];
  [v4 separatorInset];
  double v6 = fmax(v5, 10.0);
  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  [v4 bounds];
  double v10 = v9 - v6 - v6;
  NSUInteger v11 = [(NSArray *)self->_tabBarSegments count];
  BOOL v12 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  double v13 = 80.0;
  if (!v12) {
    double v13 = 61.0;
  }
  -[PKPassHeaderView sizeThatFits:](self->_passHeaderView, "sizeThatFits:", v10, v13);
  double v15 = 0.0;
  if (v14 >= 0.0) {
    double v16 = v14;
  }
  else {
    double v16 = 0.0;
  }
  double headerHeight = self->_headerHeight;
  self->_double headerHeight = v16;
  tabBar = self->_tabBar;
  if (tabBar)
  {
    if (v11 >= 2)
    {
      [(UISegmentedControl *)tabBar frame];
      double v15 = v19 + 30.0;
    }
    if (headerHeight != v16)
    {
      self->_double tabBarHeight = v15;
LABEL_14:
      BOOL v21 = 1;
      goto LABEL_15;
    }
    double tabBarHeight = self->_tabBarHeight;
    self->_double tabBarHeight = v15;
    if (tabBarHeight != v15) {
      goto LABEL_14;
    }
  }
  else
  {
    if (headerHeight != v16)
    {
      self->_double tabBarHeight = 0.0;
      goto LABEL_14;
    }
    double v23 = self->_tabBarHeight;
    self->_double tabBarHeight = 0.0;
    if (v23 != 0.0) {
      goto LABEL_14;
    }
  }
  BOOL v24 = self->_headerContentInset.left != v6;
  if (self->_headerContentInset.top != v7) {
    BOOL v24 = 1;
  }
  if (self->_headerContentInset.right != v6) {
    BOOL v24 = 1;
  }
  BOOL v21 = self->_headerContentInset.bottom != v8 || v24;
LABEL_15:
  self->_headerContentInset.top = v7;
  self->_headerContentInset.double left = v6;
  self->_headerContentInset.bottouint64_t m = v8;
  self->_headerContentInset.right = v6;

  return v21;
}

- (double)_offscreenHeaderHeight
{
  return self->_headerHeight + self->_tabBarHeight;
}

- (id)_createTabBarWithSelectedIndex:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_tabBarSegments count]) {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_tabBarSegments, "count"));
  }
  else {
    uint64_t v4 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = self->_tabBarSegments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedIntegerValue];
        if (!v10)
        {
          NSUInteger v11 = @"PASS_DETAILS_INFO";
LABEL_15:
          PKLocalizedString(&v11->isa);
          BOOL v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (v10 == 1)
        {
          if ([(PKPaymentPass *)self->_pass isIdentityPass]) {
            NSUInteger v11 = @"PASS_DETAILS_ACTIVITY";
          }
          else {
            NSUInteger v11 = @"PASS_DETAILS_TRANSACTIONS";
          }
          goto LABEL_15;
        }
        BOOL v12 = 0;
LABEL_17:
        if (v12) {
          double v13 = v12;
        }
        else {
          double v13 = &stru_1EF1B5B50;
        }
        [v4 addObject:v13];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  double v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v4];
  [v14 setSelectedSegmentIndex:a3];
  [v14 addTarget:self action:sel__tabBarSegmentChanged_ forControlEvents:4096];
  [v14 sizeToFit];
  if (self->_linkTextColor) {
    objc_msgSend(v14, "setTintColor:");
  }

  return v14;
}

- (BOOL)_shouldShowTransactions
{
  int v3 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider supportsTransactionsForPass:self->_pass];
  if (v3)
  {
    uint64_t v4 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];

    if (v4
      && ([(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication],
          double v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 state],
          v5,
          v6 != 7))
    {
      if (!self->_account
        || (int v3 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayTransactionsForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection)) != 0)
      {
        if (![(PKPaymentPass *)self->_pass isTransitPass]
          || ([(PKPaymentPass *)self->_pass supportsFPANNotifications] & 1) != 0
          || ([(PKPaymentPass *)self->_pass supportsDPANNotifications] & 1) != 0)
        {
          LOBYTE(v3) = 1;
        }
        else
        {
          uint64_t v7 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
          char v8 = [v7 generatesLocalTransactions];

          LOBYTE(v3) = v8;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_showsTransactionHistorySwitch
{
  if (([(PKPaymentPass *)self->_pass supportsFPANNotifications] & 1) != 0
    || (int v3 = [(PKPaymentPass *)self->_pass supportsDPANNotifications]) != 0)
  {
    if (self->_peerPaymentAccount || self->_account) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PKPaymentPassDetailViewController *)self _isBankConnectLinked];
    }
  }
  return v3;
}

- (void)_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary
{
}

- (BOOL)_shouldShowTransferCell
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_detailViewStyle != 2
    || (PKIsAltAccountPairedOrPairing() & 1) != 0
    || self->_detailViewStyle != 2
    || [(PKPaymentPass *)self->_pass activationState])
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  int v3 = [(PKPaymentPass *)self->_pass requiresTransferSerialNumberBasedProvisioning];
  if (!v3) {
    return v3;
  }
  if ([(PKPaymentPass *)self->_pass isStoredValuePass])
  {
    uint64_t v4 = [MEMORY[0x1E4F84D50] sharedService];
    double v5 = [v4 targetDevice];

    if ([(PKPaymentPass *)self->_pass requiresFelicaSecureElement])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || ([v5 felicaSecureElementIsAvailable] & 1) == 0) {
        goto LABEL_30;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 || ![v5 secureElementIsAvailable])
    {
      goto LABEL_30;
    }
    uint64_t v6 = [v5 secureElementIdentifiers];
    uint64_t v7 = [v6 count];

    pass = self->_pass;
    if (v7 == 2)
    {
      if ([(PKPaymentPass *)pass isSuicaPass])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        double v9 = [(PKPaymentPass *)self->_pass paymentApplications];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          while (2)
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) supportedTransitNetworkIdentifiers];
              int v15 = [v14 containsObject:@"transit.felica.suica"];

              if (!v15)
              {
                int v16 = 0;
                goto LABEL_34;
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
        int v16 = 1;
LABEL_34:

        goto LABEL_31;
      }
    }
    else
    {
      if (![(PKPaymentPass *)pass isOctopusPass])
      {
        int v16 = 1;
        goto LABEL_31;
      }
      if (objc_opt_respondsToSelector())
      {
        int v16 = [v5 supportsExpressForAutomaticSelectionTechnologyType:6];
LABEL_31:

        LOBYTE(v3) = v16 != 0;
        return v3;
      }
    }
LABEL_30:
    int v16 = 0;
    goto LABEL_31;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_shouldShowDeleteCell
{
  return self->_peerPaymentAccount == 0;
}

- (BOOL)_shouldShowAccountActions
{
  return self->_peerPaymentAccountResolution - 1 < 3;
}

- (unint64_t)_numberOfPeerPaymentMoneyActionsEnabled
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    BOOL v7 = [(PKPaymentPassDetailViewController *)self _peerPaymentMoneyActionEnabled:v3];
    char v5 = 0;
    v4 += v7;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  return v4;
}

- (BOOL)_peerPaymentMoneyActionEnabled:(unint64_t)a3
{
  if (a3 == 1)
  {
    peerPaymentAccount = self->_peerPaymentAccount;
    unint64_t v4 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
    char v5 = [(PKPeerPaymentAccount *)peerPaymentAccount isEligibleToWithdrawForUser:v4];
  }
  else
  {
    if (a3) {
      return 0;
    }
    uint64_t v3 = self->_peerPaymentAccount;
    unint64_t v4 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
    char v5 = [(PKPeerPaymentAccount *)v3 isEligibleToAddMoneyForUser:v4];
  }
  BOOL v7 = v5;

  return v7;
}

- (unint64_t)_peerPaymentMoneyActionForRowIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if ([(PKPaymentPassDetailViewController *)self _peerPaymentMoneyActionEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    char v7 = 0;
    unint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_rowIndexForPeerPaymentActionRow:(unint64_t)a3
{
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if ([(PKPaymentPassDetailViewController *)self _peerPaymentMoneyActionEnabled:v5])
    {
      if (v5 == a3) {
        return v6;
      }
      ++v6;
    }
    char v7 = 0;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_shouldShowActionWidgets
{
  if (self->_detailViewStyle == 2) {
    return 0;
  }
  unint64_t v4 = [(PKPaymentPassDetailViewController *)self tableView];
  uint64_t v5 = [(PKPaymentPassDetailViewController *)self _widgetCellForTableView:v4];
  char v6 = [v5 hasEnabledWidgets];

  return v6;
}

- (BOOL)_shouldShowServicingSection
{
  if (self->_detailViewStyle == 2) {
    return 0;
  }
  uint64_t v3 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
  BOOL v2 = [v3 length] != 0;

  return v2;
}

- (BOOL)_shouldShowCardNumbersSection
{
  BOOL v3 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:self->_account andPass:self->_pass];
  unint64_t v4 = [MEMORY[0x1E4F84D50] sharedService];
  if (PKVirtualCardEnabledWithWebService() && [(PKPaymentPass *)self->_pass cardType] == 1)
  {
    uint64_t v5 = [(PKAccount *)self->_account creditDetails];
    if (v5) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = [(PKPaymentPass *)self->_pass isEMoneyPass] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  if ([(PKPaymentPassDetailViewController *)self _accountFeature] == 4) {
    LOBYTE(v7) = 0;
  }
  else {
    int v7 = [(PKPaymentPass *)self->_pass isAppleBalancePass] ^ 1;
  }
  char v8 = v3 | v6;
  if (self->_detailViewStyle == 2) {
    char v8 = 0;
  }
  return v8 & v7;
}

- (BOOL)_accountInGoodStateForAMPEligbilityCheck
{
  account = self->_account;
  if (account) {
    LOBYTE(account) = [(PKAccount *)account state] == 1
  }
                   && [(PKPaymentPassDetailViewController *)self _accountFeature] != 3
                   && [(PKPaymentPassDetailViewController *)self _accountFeature] != 4;
  return (char)account;
}

- (BOOL)_shouldShowAutomaticPresentation
{
  BOOL v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  int v4 = [v3 supportsAutomaticPassPresentation];

  if (v4)
  {
    if ([(PKPaymentPass *)self->_pass availableForAutomaticPresentationUsingBeaconContext])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = [(PKPaymentPass *)self->_pass availableForAutomaticPresentationUsingInAppOrWebContext];
      char v6 = v5;
      if (self->_detailViewStyle != 2)
      {
        LOBYTE(v5) = 1;
        if ((v6 & 1) == 0)
        {
          int v5 = PKValueAddedServicesEnabled();
          if (v5)
          {
            pass = self->_pass;
            LOBYTE(v5) = [(PKPaymentPass *)pass availableForAutomaticPresentationUsingVASContext];
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_shouldShowBillingAddressCell
{
  if ([(PKPaymentPass *)self->_pass supportsBarcodePayment]) {
    return 0;
  }
  if ([(PKAccount *)self->_account feature] == 2
    && ([(PKAccount *)self->_account isClosedAndChargedOff] & 1) != 0)
  {
    return 1;
  }
  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  pass = self->_pass;

  return [(PKPaymentDataProvider *)paymentServiceDataProvider supportsInAppPaymentsForPass:pass];
}

- (BOOL)_shouldShowTermsCell
{
  BOOL v3 = [(PKAccount *)self->_account creditDetails];
  int v4 = [v3 termsIdentifier];
  if ([v4 length])
  {
    BOOL v5 = 1;
  }
  else
  {
    char v6 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A80]];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)_shouldShowPrivacyPolicyCell
{
  BOOL v2 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A70]];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_shouldShowContactCell
{
  BOOL v3 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
  int v4 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  BOOL v5 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];
  char v6 = [(PKPaymentPass *)self->_pass businessChatIdentifier];
  if (([v3 length] || objc_msgSend(v4, "length") || objc_msgSend(v5, "length"))
    && ([(PKPaymentPassDetailViewController *)self _accountFeature] == 4 || self->_detailViewStyle == 2))
  {
    BOOL v7 = 1;
  }
  else if ([v6 length])
  {
    BOOL v7 = self->_detailViewStyle == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowAccessPersonInformation
{
  if (![(PKPaymentPass *)self->_pass isAccessPass]) {
    return 0;
  }
  BOOL isAppleAccess = self->_isAppleAccess;
  if (self->_isAppleAccess)
  {
    int v4 = [(PKPaymentPass *)self->_pass cardHolderPicture];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_11:

      return v5;
    }
  }
  char v6 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A28]];
  if (![v6 length])
  {
    BOOL v7 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A30]];
    if (![v7 length])
    {
      double v9 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A38]];
      BOOL v5 = [v9 length] != 0;

      if (!isAppleAccess) {
        return v5;
      }
      goto LABEL_10;
    }
  }
  BOOL v5 = 1;
  if (isAppleAccess)
  {
LABEL_10:
    int v4 = 0;
    goto LABEL_11;
  }
  return v5;
}

- (BOOL)_shouldShowServiceMode
{
  if ((!PKRunningInRemoteContext() || (unint64_t)(self->_detailViewStyle - 1) <= 1)
    && [(PKPaymentPass *)self->_pass isStoredValuePass])
  {
    BOOL v5 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    if (![v5 supportsServiceMode])
    {
      BOOL v8 = 0;
LABEL_14:

      return v8;
    }
    char v6 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    char v7 = [v6 supportsTransitHistory];
    if ((v7 & 1) != 0
      || ([(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication],
          BOOL v2 = objc_claimAutoreleasedReturnValue(),
          [v2 appletDataFormat],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          PKEqualObjects()))
    {
      [(PKPaymentPass *)self->_pass effectiveContactlessPaymentApplicationState];
      BOOL v8 = PKPaymentApplicationStateIsPersonalized() != 0;
      if (v7) {
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v8 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  return 0;
}

- (id)_activationFooterView
{
  activationFooter = self->_activationFooter;
  if (!activationFooter)
  {
    objc_initWeak(&location, self);
    int v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __58__PKPaymentPassDetailViewController__activationFooterView__block_invoke;
    uint64_t v13 = &unk_1E59CBEE0;
    objc_copyWeak(&v14, &location);
    BOOL v5 = [v4 actionWithHandler:&v10];
    char v6 = [PKPaymentPassDetailActivationFooterView alloc];
    char v7 = -[PKPaymentPassDetailActivationFooterView initWithFrame:activationAction:](v6, "initWithFrame:activationAction:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v10, v11, v12, v13);
    BOOL v8 = self->_activationFooter;
    self->_activationFooter = v7;

    [(PKPaymentPassDetailViewController *)self updateActivationFooterViewContents];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    activationFooter = self->_activationFooter;
  }

  return activationFooter;
}

void __58__PKPaymentPassDetailViewController__activationFooterView__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [v3 sender];

  [WeakRetained _activationFooterPressed:v4];
}

- (void)updateActivationFooterViewContents
{
  activationFooter = self->_activationFooter;
  int v4 = [(PKPaymentVerificationController *)self->_verificationController verificationBodyString];
  [(PKPaymentPassDetailActivationFooterView *)activationFooter setFooterText:v4];

  BOOL v5 = self->_activationFooter;
  id v6 = [(PKPaymentVerificationController *)self->_verificationController alternateMethodButtonTitle];
  [(PKPaymentPassDetailActivationFooterView *)v5 setActivationButtonText:v6];
}

- (BOOL)_transactionDeepLinkingEnabled
{
  if (self->_deepLinkingEnabled) {
    char v2 = objc_opt_respondsToSelector();
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (id)_availableActions
{
  return (id)[(PKPaymentPass *)self->_pass availableActions];
}

- (id)_availableCommutePlanActions
{
  char v2 = [(PKPaymentPass *)self->_pass availableActions];
  id v3 = objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_1355);

  return v3;
}

BOOL __65__PKPaymentPassDetailViewController__availableCommutePlanActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

- (BOOL)_hasActionOfType:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = [(PKPaymentPassDetailViewController *)self _availableActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) type] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  BOOL v8 = [MEMORY[0x1E4F84D50] sharedService];
  BOOL v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      int v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v8[3] = &unk_1E59CAEA8;
      id v9 = v3;
      id v10 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v8];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      [v3 _handleProvisioningError:v7];
    }
  }
}

uint64_t __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_didSelectTransactionAtIndexPath:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [v11 row];
  if (v4 < [(PKPaymentPassDetailViewController *)self _transactionsCount]
    && (-[PKPaymentPassDetailViewController _transactionAtIndex:](self, "_transactionAtIndex:", [v11 row]), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    [(PKPaymentPassDetailViewController *)self presentTransactionDetailsForTransaction:v5 animated:1];
  }
  else
  {
    if (![(PKPaymentPassDetailViewController *)self _transactionDeepLinkingEnabled]) {
      goto LABEL_9;
    }
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    BOOL v8 = [(PKPaymentPass *)self->_pass uniqueID];
    id v6 = [(PKPaymentDataProvider *)paymentServiceDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:v8];

    id v9 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:0 pass:self->_pass appLaunchToken:v6];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v10 openURL:v9 configuration:0 completionHandler:0];
    }
  }

LABEL_9:
}

- (void)_didSelectTransactionTransactionsSwitchInTableView:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = [a3 cellForRowAtIndexPath:a4];
  if (v5 == self->_allowNotificationCell && self->_notificationAuthorizationStatus == 1)
  {
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = v5;
    id v7 = [NSString stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", *MEMORY[0x1E4F87D30]];
    BOOL v8 = [v6 URLWithString:v7];

    id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v9 openSensitiveURL:v8 withOptions:0];

    uint64_t v5 = v10;
  }
}

- (void)_didSelectContactBankSectionAtIndexPath:(int64_t)a3
{
  if ([(PKPaymentPassDetailViewController *)self _shouldShowContactCell])
  {
    if (!a3)
    {
      unint64_t v5 = [(PKPaymentPassDetailViewController *)self _removeUnsupportedContactIssuerOptions:15];
      id v6 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
      [v6 presentContactViewController:v5];
    }
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(PKPaymentPassDetailViewController *)self _shouldShowServiceMode] && v7 == a3)
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E20], 0);
    if (objc_opt_respondsToSelector())
    {
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      id v17 = [(PKPaymentPass *)self->_pass uniqueID];
      [(PKPaymentDataProvider *)paymentServiceDataProvider startServiceModeForPassWithUniqueIdentifier:v17 visibleViewController:self];
LABEL_12:

      return;
    }
    if (PKRunningInRemoteContext())
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v17 setScheme:@"shoebox"];
      [v17 setHost:@"card"];
      id v9 = NSString;
      id v10 = [(PKPaymentPass *)self->_pass uniqueID];
      id v11 = [v9 stringWithFormat:@"/%@/%@", v10, *MEMORY[0x1E4F88060]];
      [v17 setPath:v11];

      char v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v13 = [v17 URL];
      [v12 openSensitiveURL:v13 withOptions:0];

      goto LABEL_12;
    }
    long long v14 = [(PKPaymentPassDetailViewController *)self navigationController];
    int v15 = [(PKPaymentPassDetailViewController *)self presentingViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [MEMORY[0x1E4F39CF8] begin];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __77__PKPaymentPassDetailViewController__didSelectContactBankSectionAtIndexPath___block_invoke;
      void v18[3] = &unk_1E59CA7D0;
      void v18[4] = self;
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v18];
      id v16 = (id)[v14 popToRootViewControllerAnimated:1];
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      [(PKPaymentPassDetailViewController *)self postServiceModeNotification];
      [v15 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

uint64_t __77__PKPaymentPassDetailViewController__didSelectContactBankSectionAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postServiceModeNotification];
}

- (void)postServiceModeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PKPDVCRequestedServiceMode" object:self userInfo:0];
}

- (void)contactSupportSectionControllerDidSelect:(id)a3
{
  unint64_t v4 = -[PKPaymentPassDetailViewController _removeUnsupportedContactIssuerOptions:](self, "_removeUnsupportedContactIssuerOptions:", [a3 contactOption]);
  id v5 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
  [v5 presentContactViewController:v4];
}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
}

- (unint64_t)_removeUnsupportedContactIssuerOptions:(unint64_t)a3
{
  if (([(PKAccount *)self->_account feature] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v4 = +[PKBusinessChatController deviceSupportsBusinessChat];
    uint64_t v5 = 7;
    if (v4) {
      uint64_t v5 = 15;
    }
  }
  else
  {
    uint64_t v5 = 7;
  }
  return v5 & a3;
}

- (void)_preflightWatchForTransferWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (v5)
    {
      webService = self->_webService;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v9[2] = __78__PKPaymentPassDetailViewController__preflightWatchForTransferWithCompletion___block_invoke;
      v9[3] = &unk_1E59CE160;
      id v10 = v4;
      [v5 paymentWebService:webService validateTransferPreconditionsWithCompletion:v9];
    }
    else
    {
      uint64_t v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error: Unable to validate transfer preconditions of target device", v8, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __78__PKPaymentPassDetailViewController__preflightWatchForTransferWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didSelectTransferCardAtIndexPath:(id)a3
{
  id v4 = a3;
  transitProperties = self->_transitProperties;
  if (transitProperties)
  {
    if ([(PKTransitPassProperties *)transitProperties isEnRoute])
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is in transit.", (uint8_t *)buf, 2u);
      }

      uint64_t v7 = (void *)MEMORY[0x1E4FB1418];
      BOOL v8 = PKLocalizedPaymentString(&cfstr_CardInTransit.isa);
      id v9 = @"CARD_IN_TRANSIT_MESSAGE_TRANSFER_CARD";
LABEL_11:
      uint64_t v12 = PKLocalizedPaymentString(&v9->isa);
LABEL_17:
      long long v14 = (void *)v12;
      int v15 = [v7 alertControllerWithTitle:v8 message:v12 preferredStyle:1];

      id v16 = (void *)MEMORY[0x1E4FB1410];
      id v17 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      long long v18 = [v16 actionWithTitle:v17 style:1 handler:0];
      [v15 addAction:v18];

      [(PKPaymentPassDetailViewController *)self presentViewController:v15 animated:1 completion:0];
      goto LABEL_18;
    }
    id v10 = self->_transitProperties;
    if (v10 && [(PKTransitPassProperties *)v10 isBlocked])
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is blocked.", (uint8_t *)buf, 2u);
      }

      uint64_t v7 = (void *)MEMORY[0x1E4FB1418];
      BOOL v8 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
      id v9 = @"COULD_NOT_ADD_CARD_MESSAGE";
      goto LABEL_11;
    }
  }
  if (([MEMORY[0x1E4F85128] isWalletVisible] & 1) == 0)
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Wallet app is not installed.", (uint8_t *)buf, 2u);
    }

    uint64_t v7 = (void *)MEMORY[0x1E4FB1418];
    BOOL v8 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
    uint64_t v12 = PKLocalizedDeletableString(&cfstr_WalletUninstal_0.isa);
    goto LABEL_17;
  }
  self->_BOOL performingCardTransfer = 1;
  [(PKPaymentPassDetailViewController *)self reloadData:0];
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke;
  v19[3] = &unk_1E59CBA18;
  objc_copyWeak(&v20, buf);
  v19[4] = self;
  [(PKPaymentPassDetailViewController *)self _preflightWatchForTransferWithCompletion:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
LABEL_18:
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_2;
  v8[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  char v12 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32))
    {
      id v6 = objc_alloc(MEMORY[0x1E4F84BB8]);
      id v7 = [MEMORY[0x1E4F84D50] sharedService];
      BOOL v8 = (void *)[v6 initWithWebService:v7];

      [v8 setPaymentDataProvider:*(void *)(*(void *)(a1 + 40) + 2176)];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_3;
      v10[3] = &unk_1E59CC710;
      objc_copyWeak(&v12, v2);
      void v10[4] = *(void *)(a1 + 40);
      id v9 = v8;
      id v11 = v9;
      [v9 validatePreconditionsAndRegister:v10];

      objc_destroyWeak(&v12);
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) description];
        *(_DWORD *)buf = 138412290;
        long long v14 = v5;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Transfer preflight failed for watch with error:%@", buf, 0xCu);
      }
      [WeakRetained _handleProvisioningError:*(void *)(a1 + 32)];
      WeakRetained[1312] = 0;
      [WeakRetained reloadData:0];
    }
  }
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_4;
  block[3] = &unk_1E59DF6E8;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  char v14 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_4(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  char v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32))
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84AF0]) initWithPaymentPass:*(void *)(*(void *)(a1 + 40) + 1072)];
      id v7 = *(void **)(a1 + 48);
      v14[0] = v6;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v9[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_5;
      v9[3] = &unk_1E59CBA18;
      objc_copyWeak(&v11, v2);
      id v10 = *(id *)(a1 + 48);
      [v7 associateCredentials:v8 withCompletionHandler:v9];

      objc_destroyWeak(&v11);
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) description];
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Transfer preflight failed for local device with error:%@", buf, 0xCu);
      }
      [WeakRetained _handleProvisioningError:*(void *)(a1 + 32)];
      WeakRetained[1312] = 0;
      [WeakRetained reloadData:0];
    }
  }
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_6;
  v7[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32))
    {
      id v6 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 40)];
      [v6 setAllowsManualEntry:0];
      [v6 setPaymentSetupMode:1];
      [v3 presentViewController:v6 animated:1 completion:0];
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) description];
        int v7 = 138412290;
        id v8 = v5;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Transfer associateCredential failed for local device with error:%@", (uint8_t *)&v7, 0xCu);
      }
      [v3 _handleProvisioningError:*(void *)(a1 + 32)];
    }
    v3[1312] = 0;
    [v3 reloadData:0];
  }
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  int64_t detailViewStyle = self->_detailViewStyle;
  uint64_t v5 = 3;
  if (detailViewStyle != 1) {
    uint64_t v5 = 0;
  }
  if (detailViewStyle == 2) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = a3;
  id v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v7 context:v6];

  [(PKPaymentSetupNavigationController *)v8 setGroupsController:self->_groupsController];
  [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v8 setShowsWelcomeViewController:0];

  return v8;
}

- (void)_handleProvisioningError:(id)a3
{
  id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:a3];
  [(PKPaymentPassDetailViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (BOOL)_isJapaneseRegion
{
  char v2 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v3 = [v2 deviceRegion];
  char v4 = [v3 isEqualToString:@"JP"];

  return v4;
}

- (void)_didSelectDeleteCard
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentPass *)self->_pass hasMerchantTokens])
  {
    id v3 = (void *)MEMORY[0x1E4F843E0];
    v27[0] = *MEMORY[0x1E4F87038];
    char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    uint64_t v5 = *MEMORY[0x1E4F86380];
    uint64_t v6 = *MEMORY[0x1E4F86120];
    v25[0] = *MEMORY[0x1E4F86308];
    v25[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F86B88];
    v26[0] = v5;
    v26[1] = v7;
    v25[2] = *MEMORY[0x1E4F86730];
    v26[2] = *MEMORY[0x1E4F86768];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    [v3 subjects:v4 sendEvent:v8];

    BOOL v9 = self->_detailViewStyle == 2;
    pass = self->_pass;
    account = self->_account;
    merchantTokensResponse = self->_merchantTokensResponse;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    passLibraryDataProvider = self->_passLibraryDataProvider;
    uint64_t v15 = [(PKPaymentPassDetailViewController *)self navigationController];
    LOBYTE(v23) = v9;
    +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:pass withAccount:account merchantTokensResponse:merchantTokensResponse deleteHander:WeakRetained passLibraryDataProvider:passLibraryDataProvider navigationController:v15 presentingViewController:self isBridge:v23];
  }
  else
  {
    id v16 = self->_pass;
    id v17 = self->_account;
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    transitBalanceModel = self->_transitBalanceModel;
    transitProperties = self->_transitProperties;
    id v24 = [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController connectedInstitution];
    int64_t detailViewStyle = self->_detailViewStyle;
    id v22 = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:v16 withAccount:v17 paymentServiceDataProvider:paymentServiceDataProvider transitBalanceModel:transitBalanceModel transitPassProperties:transitProperties fkInstitution:v24 detailViewStyle:detailViewStyle deleteHander:v22 passLibraryDataProvider:self->_passLibraryDataProvider presentingViewController:self];
  }
}

- (BOOL)_canSelectBalanceOrCommutePlanCellAtRowIndex:(int64_t)a3
{
  if ([(PKPaymentPass *)self->_pass isAutoTopEnabled]) {
    return 0;
  }
  int64_t v6 = [(NSArray *)self->_displayableBalanceFields count];
  unint64_t v7 = a3 - v6;
  if (a3 >= v6)
  {
    id v8 = [(NSArray *)self->_commutePlans objectAtIndex:v7];
    id v10 = [(PKPaymentPassDetailViewController *)self _actionForCommutePlan:v8];
    BOOL v5 = (v7 & 0x8000000000000000) == 0
      && v7 < [(NSArray *)self->_commutePlanFields count]
      && [(PKPaymentPassDetailViewController *)self _commutePlanIsSelectable:v8 action:v10];
  }
  else
  {
    id v8 = [(PKPaymentPassDetailViewController *)self _topUpActionForRow:a3];
    char v9 = [(PKPaymentPass *)self->_pass needsHardcodedReminderOptions];
    if (v8) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v9;
    }
  }

  return v5;
}

- (int64_t)_rowIndexForExpressTransitSettingsCell
{
  if (![(PKPaymentPassDetailViewController *)self _showExpressDetails]
    || ![(PKDynamicTableViewController *)self hasSectionForSectionIdentifier:@"CardInfo"])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [(PKPaymentPassDetailViewController *)self tableView];
  int64_t v4 = objc_msgSend(v3, "numberOfRowsInSection:", -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", @"CardInfo"))- 1;

  return v4;
}

- (PKContactResolver)contactResolver
{
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = objc_alloc(MEMORY[0x1E4F845E8]);
    int64_t v6 = [(PKPaymentPassDetailViewController *)self _contactKeysToFetch];
    unint64_t v7 = (PKContactResolver *)[v5 initWithContactStore:v4 keysToFetch:v6];
    id v8 = self->_contactResolver;
    self->_contactResolver = v7;

    [(PKContactResolver *)self->_contactResolver addDelegate:self];
    contactResolver = self->_contactResolver;
  }

  return contactResolver;
}

- (PKContactAvatarManager)contactAvatarManager
{
  contactAvatarManager = self->_contactAvatarManager;
  if (!contactAvatarManager)
  {
    id v4 = [PKContactAvatarManager alloc];
    id v5 = [(PKPaymentPassDetailViewController *)self contactResolver];
    int64_t v6 = [(PKContactAvatarManager *)v4 initWithContactResolver:v5 paymentDataProvider:self->_paymentServiceDataProvider];
    unint64_t v7 = self->_contactAvatarManager;
    self->_contactAvatarManager = v6;

    contactAvatarManager = self->_contactAvatarManager;
  }

  return contactAvatarManager;
}

- (id)_contactInfoAttributedText:(id)a3 phoneNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v9 = (void *)MEMORY[0x1E4FB06F8];
  id v10 = (void *)MEMORY[0x1E4FB0700];
  if (v5)
  {
    char v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D8], 4096, 0);
    [v8 setObject:v11 forKeyedSubscript:*v9];

    id v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v8 setObject:v12 forKeyedSubscript:*v10];

    if (v6) {
      id v13 = @"%@\n";
    }
    else {
      id v13 = @"%@";
    }
    char v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v5);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14 attributes:v8];
    [v7 appendAttributedString:v15];
  }
  if (v6)
  {
    id v16 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 4096, 0);
    [v8 setObject:v16 forKeyedSubscript:*v9];

    id v17 = [MEMORY[0x1E4FB1618] linkColor];
    [v8 setObject:v17 forKeyedSubscript:*v10];

    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v8];
    [v7 appendAttributedString:v18];
  }
  long long v19 = (void *)[v7 copy];

  return v19;
}

- (unint64_t)_passStateSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if (![(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface])
  {
    if ([(PKPaymentPass *)self->_pass activationState] != PKPaymentPassActivationStateRequiresActivation)
    {
      unint64_t v9 = 0;
      goto LABEL_13;
    }
    id v10 = [(PKPaymentVerificationController *)self->_verificationController continueVerificationButtonTitle];
    id v13 = [(PKPaymentPassDetailViewController *)self traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];

    uint64_t v15 = [(PKPaymentVerificationController *)self->_verificationController verificationRecord];
    id v16 = [v15 channel];
    if ([v16 type] == 4)
    {

      if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        unint64_t v9 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
    unint64_t v9 = 1;
    if (!a3 || a4) {
      goto LABEL_7;
    }
    if (!v10)
    {
      char v11 = [(PKPaymentPassDetailViewController *)self _spinnerCellForTableView:v8];
      goto LABEL_6;
    }
    if ([(PKPaymentVerificationController *)self->_verificationController shouldDisabledVerificationButton])
    {
      char v11 = [(PKPaymentPassDetailViewController *)self _disabledCellWithText:v10 forTableView:v8];
      goto LABEL_6;
    }
LABEL_5:
    char v11 = [(PKPaymentPassDetailViewController *)self _linkCellWithText:v10 forTableView:v8];
LABEL_6:
    id v12 = *a3;
    *a3 = v11;

    unint64_t v9 = 1;
LABEL_7:

    goto LABEL_13;
  }
  unint64_t v9 = 1;
  if (a3 && !a4)
  {
    id v10 = PKLocalizedPaymentString(&cfstr_LostmodeEnterP.isa);
    goto LABEL_5;
  }
LABEL_13:

  return v9;
}

- (id)_headerTitleForPassStateSection
{
  if ([(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface])
  {
    id v3 = @"LOSTMODE_HEADER";
LABEL_5:
    id v4 = PKLocalizedPaymentString(&v3->isa);
    goto LABEL_7;
  }
  if ([(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateRequiresActivation)
  {
    id v3 = @"ACTIVATION_HEADER";
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)_isShowingLostModeInterface
{
  id v3 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  if ([v3 state] == 7)
  {
    char v4 = 1;
  }
  else if (self->_detailViewStyle == 2)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = PKNeedsLostModeExitAuth();
  }

  return v4;
}

- (void)_didSelectPassStateSection
{
  if ([(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface])
  {
    if (self->_detailViewStyle == 2)
    {
      id v5 = objc_alloc_init(getNPKCompanionAgentConnectionClass_8());
      [v5 initiateLostModeExitAuthWithCompletion:0];
    }
    else
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Starting FMDFMIP lost mode exit.", buf, 2u);
      }

      char v4 = [MEMORY[0x1E4F61A48] sharedInstance];
      [v4 initiateLostModeExitAuthWithCompletion:&__block_literal_global_1414];
    }
  }
  else if ([(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateRequiresActivation)
  {
    [(PKPaymentPassDetailViewController *)self _presentVerificationFlow];
  }
}

void __63__PKPaymentPassDetailViewController__didSelectPassStateSection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [v2 localizedDescription];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error exiting lost mode: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Completed FMDFMIP lost mode exit.", (uint8_t *)&v6, 2u);
    }

    PKSetNeedsLostModeExitAuth();
  }
}

- (double)_footerViewHeightForPassStateSectionWithTableView:(id)a3
{
  id v4 = a3;
  if (![(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface]
    && [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateRequiresActivation
    && ([(PKPaymentVerificationController *)self->_verificationController verificationRecord],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [v4 bounds];
    double v7 = v6;
    uint64_t v8 = [(PKPaymentPassDetailViewController *)self _activationFooterView];
    objc_msgSend(v8, "sizeThatFits:", v7, 1.79769313e308);
    double v10 = v9;
  }
  else
  {
    [v4 sectionFooterHeight];
    double v10 = v11;
  }

  return v10;
}

- (id)_footerViewForPassStateSection
{
  if (![(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface]
    && [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateRequiresActivation
    && ([(PKPaymentVerificationController *)self->_verificationController verificationRecord],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(PKPaymentPassDetailViewController *)self _activationFooterView];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)createFooterHyperlinkViewWithText:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(PKFooterHyperlinkView);
  [(PKFooterHyperlinkView *)v8 setAttributedText:v7];

  [(PKFooterHyperlinkView *)v8 setLinkTextColor:self->_linkTextColor];
  [(PKFooterHyperlinkView *)v8 setAction:v6];

  return v8;
}

- (id)_footerViewForPendingPeerPaymentAssociatedAccount
{
  id v3 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_1.isa);
  id v4 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_2.isa, &stru_1EF1B4C70.isa, v3);
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT211324"];
  id v6 = PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  id v7 = &__block_literal_global_47;
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v6 action:&__block_literal_global_47];

  return v8;
}

- (id)_footerViewForAccountUsersSection
{
  id v3 = PKLocalizedMadisonString(&cfstr_AccountUsersSe_0.isa);
  id v4 = PKLocalizedMadisonString(&cfstr_AccountUsersSe_1.isa, &stru_1EF1B4C70.isa, v3);
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT212020"];
  id v6 = PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  id v7 = &__block_literal_global_47;
  uint64_t v8 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v6 action:&__block_literal_global_47];

  return v8;
}

- (BOOL)_showPeerPaymentBalanceFDICFooterView
{
  int v2 = PKPeerPaymentFDICSignageEnabled();
  if (v2)
  {
    LOBYTE(v2) = PKPeerPaymentAccountIsFDICInsured();
  }
  return v2;
}

- (id)_footerViewForPeerPaymentBalanceSectionWithTableView:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPassDetailViewController *)self _showPeerPaymentBalanceFDICFooterView])
  {
    id v5 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:@"PeerPaymentBalanceReuseIdentifier"];
    if (!v5)
    {
      id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_17.isa);
      id v5 = [[PKFDICTableViewFooterView alloc] initWithReuseIdentifier:@"PeerPaymentBalanceReuseIdentifier" feature:1 displayingBankName:1 footerText:v6];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)passSupportsDeviceAssessment
{
  return [(PKPaymentPass *)self->_pass supportsDeviceAssessmentAccordingToService:self->_webService];
}

- (id)_footerViewForApplePayProductPrivacySection
{
  if (self->_detailViewStyle == 2) {
    linkTextColor = self->_linkTextColor;
  }
  else {
    linkTextColor = 0;
  }
  id v4 = linkTextColor;
  if (self->_peerPaymentAccount)
  {
    id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_31.isa);
    id v29 = 0;
    id v6 = [(PKPaymentPassDetailViewController *)self privacyFooterAttributedStringWithText:v5 privacyContext:2 outputURL:&v29];
    id v7 = v29;

    if ([(PKPaymentPassDetailViewController *)self shouldMapSection:51])
    {
      id v8 = 0;
    }
    else
    {
      id v28 = 0;
      uint64_t v17 = [(PKPaymentPassDetailViewController *)self _legalNoticesFooterWithAttributedString:v6 combineString:@"\n\n" outputURL:&v28];
      id v8 = v28;

      id v6 = (void *)v17;
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PKPaymentPassDetailViewController__footerViewForApplePayProductPrivacySection__block_invoke;
    aBlock[3] = &unk_1E59DB680;
    objc_copyWeak(&v26, &location);
    id v18 = v7;
    id v23 = v18;
    id v24 = v4;
    id v19 = v8;
    id v25 = v19;
    id v20 = _Block_copy(aBlock);
    id v16 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v6 action:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    goto LABEL_12;
  }
  uint64_t v9 = [(PKAccount *)self->_account feature];
  uint64_t v10 = [(PKAccount *)self->_account feature];
  if (v9 == 2)
  {
    double v11 = PKLocalizedFeatureString();
    id v12 = self;
    id v13 = v11;
    uint64_t v14 = v4;
    uint64_t v15 = 4;
LABEL_9:
    id v16 = [(PKPaymentPassDetailViewController *)v12 createPrivacyFooterViewWithText:v13 tintColor:v14 privacyContext:v15];

    goto LABEL_12;
  }
  if (v10 == 3)
  {
    id v16 = [(PKPaymentPassDetailViewController *)self createPrivacyFooterViewForContext:32 tintColor:v4];
  }
  else
  {
    if ([(PKPaymentPassDetailViewController *)self passSupportsDeviceAssessment])
    {
      double v11 = PKLocalizedPaymentString(&cfstr_DeviceAssessme_3.isa);
      id v12 = self;
      id v13 = v11;
      uint64_t v14 = v4;
      uint64_t v15 = 1;
      goto LABEL_9;
    }
    id v16 = 0;
  }
LABEL_12:

  return v16;
}

void __80__PKPaymentPassDetailViewController__footerViewForApplePayProductPrivacySection__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([v6 isEqual:*(void *)(a1 + 32)])
    {
      id v4 = PKGenericOnboardingPresenter(WeakRetained, *(void **)(a1 + 40));
      PKOpenOnboardingHyperlinkAction(v4);
      id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v5)[2](v5, v6);
    }
    else if ([v6 isEqual:*(void *)(a1 + 48)])
    {
      [WeakRetained _presentLegalDisclosureViewController];
    }
  }
}

- (id)createPrivacyFooterViewForContext:(unint64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", a3);
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 localizedButtonCaption];
    uint64_t v10 = [v8 localizedButtonTitle];
    double v11 = v10;
    if (v9)
    {
      PKLocalizedPaymentString(&cfstr_PassDetailsPri.isa, &stru_1EF1B5770.isa, v9, v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v10;
    }
    uint64_t v14 = v12;
    uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
    id v16 = NSString;
    uint64_t v17 = [v8 identifier];
    id v18 = [v16 stringWithFormat:@"onboarding:%@", v17];
    id v19 = [v15 URLWithString:v18];

    id v20 = PKAttributedStringByAddingLinkToSubstring(v14, v11, v19);
    long long v21 = PKGenericOnboardingPresenter(self, v6);
    id v22 = PKOpenOnboardingHyperlinkAction(v21);
    id v13 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v20 action:v22];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)createPrivacyFooterViewWithText:(id)a3 tintColor:(id)a4 privacyContext:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v9 = [(PKPaymentPassDetailViewController *)self privacyFooterAttributedStringWithText:a3 privacyContext:a5 outputURL:&v14];
  if (v14)
  {
    uint64_t v10 = PKGenericOnboardingPresenter(self, v8);
    double v11 = PKOpenOnboardingHyperlinkAction(v10);
    id v12 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v9 action:v11];
  }
  else
  {
    id v12 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v9 action:&__block_literal_global_1462];
  }

  return v12;
}

- (id)privacyFooterAttributedStringWithText:(id)a3 privacyContext:(unint64_t)a4 outputURL:(id *)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", a4);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 localizedButtonTitle];
    double v11 = v10;
    if (v7)
    {
      PKLocalizedPaymentString(&cfstr_PassDetailsPri.isa, &stru_1EF1B5770.isa, v7, v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v10;
    }
    uint64_t v14 = v12;
    uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
    id v16 = NSString;
    uint64_t v17 = [v9 identifier];
    id v18 = [v16 stringWithFormat:@"onboarding:%@", v17];
    id v19 = [v15 URLWithString:v18];

    if (a5) {
      *a5 = v19;
    }
    id v13 = PKAttributedStringByAddingLinkToSubstring(v14, v11, v19);
  }
  else
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
  }

  return v13;
}

- (id)_footerViewForManualIdentityVerificationSection
{
  int v3 = PKPeerPaymentFDICSignageEnabled();
  id v4 = @"PEER_PAYMENT_PASS_DETAILS_MANUAL_VERIFY_IDENTITY_FOOTER";
  if (v3) {
    id v4 = @"PEER_PAYMENT_PASS_DETAILS_MANUAL_VERIFY_IDENTITY_FOOTER_FDIC";
  }
  id v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v7 = PKLocalizedPeerPaymentString(v5);
  id v8 = (void *)[v6 initWithString:v7];

  uint64_t v9 = [(PKPaymentPassDetailViewController *)self _legalNoticesFooterWithAttributedString:v8 combineString:@"\n\n" outputURL:0];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __84__PKPaymentPassDetailViewController__footerViewForManualIdentityVerificationSection__block_invoke;
  v12[3] = &unk_1E59DA350;
  objc_copyWeak(&v13, &location);
  uint64_t v10 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v9 action:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __84__PKPaymentPassDetailViewController__footerViewForManualIdentityVerificationSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentLegalDisclosureViewController];
}

- (id)_footerViewForPassOperationsSection
{
  if ([(PKPaymentPassDetailViewController *)self _accountFeature] == 2)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    id v4 = [(PKPaymentPassDetailViewController *)self _legalNoticesFooterWithAttributedString:v3 combineString:&stru_1EF1B5B50 outputURL:0];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__PKPaymentPassDetailViewController__footerViewForPassOperationsSection__block_invoke;
    v7[3] = &unk_1E59DA350;
    objc_copyWeak(&v8, &location);
    id v5 = [(PKPaymentPassDetailViewController *)self createFooterHyperlinkViewWithText:v4 action:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __72__PKPaymentPassDetailViewController__footerViewForPassOperationsSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentLegalDisclosureViewController];
}

- (id)_legalNoticesFooterWithAttributedString:(id)a3 combineString:(id)a4 outputURL:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PKPaymentPassDetailViewController *)self _accountFeature] - 1 > 1)
  {
    id v12 = 0;
    uint64_t v10 = 0;
LABEL_9:
    id v16 = v8;
    goto LABEL_12;
  }
  uint64_t v10 = PKDynamicLocalizedFeatureString();
  uint64_t v11 = PKDynamicLocalizedFeatureString();
  id v12 = (void *)v11;
  if (!v10 || !v11) {
    goto LABEL_9;
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", @"legalNotice", v10);
  uint64_t v14 = v13;
  if (a5) {
    *a5 = v13;
  }
  if (v8)
  {
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v9, v12];

    id v16 = (id)[v8 mutableCopy];
    uint64_t v17 = PKAttributedStringByAddingLinkToSubstring(v15, v10, v14);
    [v16 appendAttributedString:v17];

    id v12 = v15;
  }
  else
  {
    PKAttributedStringByAddingLinkToSubstring(v12, v10, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:

  return v16;
}

- (id)_footerTextForPassStateSection
{
  int v3 = PKPassLocalizedStringForStateWithFormat(&cfstr_PassDashboardT.isa, &self->_pass->super, 0);
  pass = self->_pass;
  id v5 = [(PKPaymentPass *)pass localizedDescription];
  id v6 = PKPassLocalizedStringForStateWithFormat(&cfstr_PassDashboardD.isa, &pass->super, &stru_1EF1B4C70.isa, v5);

  if (v3) {
    goto LABEL_14;
  }
  char v7 = [(PKPaymentPass *)self->_pass supportsBarcodePayment];
  id v8 = (void (*)(void *, __CFString *))MEMORY[0x1E4F880B0];
  if (v7)
  {
    id v9 = (void (*)(void))MEMORY[0x1E4F880A8];
    uint64_t v10 = @"_ACCOUNT";
  }
  else
  {
    uint64_t v11 = [(PKPaymentPass *)self->_pass cardType];
    id v8 = (void (*)(void *, __CFString *))MEMORY[0x1E4F880C0];
    id v12 = (void (*)(void))MEMORY[0x1E4F880B8];
    if (v11 == 3
      && (unint64_t v13 = [(PKPaymentPass *)self->_pass accessType] - 1,
          id v8 = (void (*)(void *, __CFString *))MEMORY[0x1E4F880C0],
          id v12 = (void (*)(void))MEMORY[0x1E4F880B8],
          v13 <= 5))
    {
      uint64_t v10 = off_1E59DFB00[v13];
      id v8 = (void (*)(void *, __CFString *))MEMORY[0x1E4F880C0];
      id v9 = (void (*)(void))MEMORY[0x1E4F880B8];
    }
    else
    {
      id v9 = v12;
      uint64_t v10 = &stru_1EF1B5B50;
    }
  }
  if ([(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface]) {
    goto LABEL_9;
  }
  id v36 = v8;
  PKPaymentPassActivationState v14 = [(PKPaymentPass *)self->_pass activationState];
  PKPaymentPassActivationState v15 = [(PKPaymentPass *)self->_pass activationState];
  PKPaymentPassActivationState v16 = [(PKPaymentPass *)self->_pass activationState];
  uint64_t v17 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  uint64_t v18 = [v17 state];

  if (v14 == PKPaymentPassActivationStateActivating)
  {
    int v3 = PKLocalizedPaymentString(&cfstr_ActivatingTitl.isa);
    id v19 = @"ACTIVATING_MESSAGE";
LABEL_12:
    id v20 = [(__CFString *)v19 stringByAppendingString:v10];
    uint64_t v21 = v9();

    id v6 = (void *)v21;
LABEL_13:

    goto LABEL_14;
  }
  if (v15 == PKPaymentPassActivationStateDeactivated)
  {
    id v26 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v10];
    int v3 = v9();

    if (v18 == 5)
    {
      id v19 = @"PAYMENT_APP_VERIFICATION_TERMINATED";
      goto LABEL_12;
    }
    id v29 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    uint64_t v30 = [v29 state];

    if (v30 == 10)
    {
      id v28 = @"PAYMENT_APP_REMOVED_BY_ISSUER";
      goto LABEL_28;
    }
  }
  else
  {
    if (v16 != PKPaymentPassActivationStateSuspended)
    {
LABEL_9:
      int v3 = 0;
      goto LABEL_14;
    }
    id v27 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v10];
    int v3 = v9();

    if (v18 == 6)
    {
      id v28 = @"PAYMENT_APP_SUSPENDED_BY_ISSUER";
LABEL_28:
      id v20 = [(__CFString *)v28 stringByAppendingString:v10];
      uint64_t v35 = [(PKPaymentPass *)self->_pass organizationName];
      uint64_t v31 = v36(v20, @"%@");

      id v6 = (void *)v31;
      goto LABEL_13;
    }
    id v32 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    uint64_t v33 = [v32 state];

    if (v33 != 9)
    {
      id v19 = @"PAYMENT_APP_ERROR_BODY";
      goto LABEL_12;
    }
    uint64_t v34 = [(PKPaymentPass *)self->_pass localizedSuspendedReason];

    if (!v34)
    {
      id v20 = [@"PAYMENT_APP_ERROR_BODY" stringByAppendingString:v10];
      id v6 = v9();
      goto LABEL_13;
    }
    id v6 = (void *)v34;
  }
LABEL_14:
  id v22 = objc_msgSend(v3, "pk_uppercaseStringForPreferredLocale");

  if (v6)
  {
    id v23 = [NSString stringWithFormat:@"\n%@", v6];
    id v24 = [v22 stringByAppendingString:v23];
  }
  else
  {
    id v24 = v22;
  }

  return v24;
}

- (double)_heightForPassStateSectionWithTableView:(id)a3
{
  id v4 = a3;
  if ([(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateRequiresActivation
    || [(PKPaymentPassDetailViewController *)self _isShowingLostModeInterface])
  {
    [v4 sectionHeaderHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.1;
  }

  return v6;
}

- (void)_updateBalanceIfNecessary
{
  if ([(PKPaymentPassDetailViewController *)self _accountFeature] == 4)
  {
    if ([(PKAccount *)self->_account state] == 1)
    {
      int v3 = [(PKAccount *)self->_account appleBalanceDetails];
      id v4 = [v3 accountSummary];
      double v5 = [v4 currentBalance];
      double v6 = [v3 currencyCode];
      PKCurrencyAmountMake();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
    [(PKPaymentPassDetailBalanceSectionController *)self->_balanceSectionController setBalance:v7];
  }
}

- (void)setDeleteOverrider:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 setDeletionStatusHandler:0 forPass:self->_pass];
    }
    objc_storeWeak((id *)&self->_deleteOverrider, v4);
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __56__PKPaymentPassDetailViewController_setDeleteOverrider___block_invoke;
      v7[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v8, &location);
      [v4 setDeletionStatusHandler:v7 forPass:self->_pass];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __56__PKPaymentPassDetailViewController_setDeleteOverrider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadData:0];
    id WeakRetained = v2;
  }
}

- (BOOL)_isDeletingPass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [WeakRetained isDeletionInProgressForPass:self->_pass];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_updateCashbackPeerPaymentResolutionSection
{
  account = self->_account;
  if (account)
  {
    if ([(PKAccount *)account feature] == 2)
    {
      char v4 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
      double v5 = [v4 account];

      objc_initWeak(&location, self);
      id v6 = self->_account;
      id v7 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke;
      v8[3] = &unk_1E59DF738;
      objc_copyWeak(&v9, &location);
      +[PKCreditAccountController resolutionToReceiveCashbackForAccount:v6 accountUser:v7 withPeerPaymentAccount:v5 completion:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke_2;
  v8[3] = &unk_1E59DF710;
  objc_copyWeak(v9, (id *)(a1 + 32));
  char v10 = a3;
  v9[1] = a2;
  id v9[2] = a5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
  objc_destroyWeak(v9);
}

void __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1672] = *(unsigned char *)(a1 + 56);
    *((void *)WeakRetained + 210) = *(void *)(a1 + 40);
    *((void *)WeakRetained + 211) = *(void *)(a1 + 48);
    int v3 = WeakRetained;
    [WeakRetained reloadSection:20];
    id WeakRetained = v3;
  }
}

- (void)_tabBarSegmentChanged:(id)a3
{
  char v4 = [(NSArray *)self->_tabBarSegments objectAtIndex:[(UISegmentedControl *)self->_tabBar selectedSegmentIndex]];
  double v5 = PKSegmentToSegmentString(v4);
  if (v5) {
    PKSetPassDetailsLastSelectedSegment();
  }
  uint64_t v6 = [v4 unsignedIntegerValue];
  if (self->_peerPaymentAccount) {
    BOOL v7 = v6 == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EE0], 0);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
LABEL_10:
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __59__PKPaymentPassDetailViewController__tabBarSegmentChanged___block_invoke;
    v8[3] = &unk_1E59D70D0;
    void v8[4] = self;
    void v8[5] = 1;
    [(PKPaymentPassDetailViewController *)self _reloadTransactionsWithCompletion:v8];
    goto LABEL_11;
  }
  [(PKPaymentPassDetailViewController *)self reloadData:0];
LABEL_11:
}

uint64_t __59__PKPaymentPassDetailViewController__tabBarSegmentChanged___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) == 1) {
    return [*(id *)(result + 32) reloadData:0];
  }
  return result;
}

- (void)_automaticPresentationSwitchChanged:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  uint64_t v6 = [(PKPaymentPass *)pass settings];
  int v7 = [v5 isOn];

  if (((v7 ^ ((v6 & 0x10) == 0)) & 1) == 0)
  {
    uint64_t v8 = 16;
    if (!v7) {
      uint64_t v8 = 0;
    }
    id v9 = self->_pass;
    [(PKPaymentPass *)v9 setSettings:v6 & 0xFFFFFFFFFFFFFFCFLL | v8 | 0x20];
  }
}

- (void)_nfcExpressAccessSwitchChanged:(id)a3
{
}

- (void)_uwbExpressAccessSwitchChanged:(id)a3
{
}

- (void)_expressAccessSwitchChanged:(id)a3 isUWB:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = 107;
  if (v4) {
    uint64_t v8 = 108;
  }
  int v9 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___PKPaymentPassDetailViewController__expressPassesInformationToken[v8]) != 0;
  int v10 = [v6 isOn];
  if (v9 != v10)
  {
    char v11 = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke;
    aBlock[3] = &unk_1E59CD7D8;
    void aBlock[4] = self;
    char v36 = v10;
    BOOL v37 = v4;
    id v12 = (void (**)(void))_Block_copy(aBlock);
    if ((v11 & 1) != 0
      || ([(PKPaymentPass *)self->_pass isCarKeyPass] ? (BOOL v13 = !v4) : (BOOL v13 = 1), v13))
    {
      v12[2](v12);
    }
    else
    {
      if (self->_radioTechnologyType == 2)
      {
        PKPaymentPassActivationState v14 = @"CAR_KEY_TURN_OFF_UWB_KEY";
      }
      else if (self->_detailViewStyle == 2)
      {
        PKPaymentPassActivationState v14 = @"CAR_KEY_TURN_OFF_UWB_PORTION_OF_KEY_WATCH";
      }
      else
      {
        PKPaymentPassActivationState v14 = @"CAR_KEY_TURN_OFF_UWB_PORTION_OF_KEY";
      }
      PKPaymentPassActivationState v15 = PKLocalizedCredentialString(&v14->isa);
      PKPaymentPassActivationState v16 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v17 = PKLocalizedCredentialString(&cfstr_CarKeyTurnOffP.isa);
      uint64_t v18 = [v16 alertControllerWithTitle:v17 message:v15 preferredStyle:1];

      id v19 = (void *)MEMORY[0x1E4FB1410];
      id v20 = PKLocalizedCredentialString(&cfstr_CarKeyTurnOffB.isa);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_3;
      void v33[3] = &unk_1E59CB150;
      uint64_t v34 = v12;
      uint64_t v21 = [v19 actionWithTitle:v20 style:0 handler:v33];
      [v18 addAction:v21];

      objc_initWeak(&location, self);
      id v22 = (void *)MEMORY[0x1E4FB1410];
      id v23 = PKLocalizedString(&cfstr_Cancel.isa);
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      id v28 = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_4;
      id v29 = &unk_1E59DF788;
      objc_copyWeak(&v30, &location);
      char v31 = v11;
      id v24 = [v22 actionWithTitle:v23 style:1 handler:&v26];
      objc_msgSend(v18, "addAction:", v24, v26, v27, v28, v29);

      id v25 = [(PKPaymentPassDetailViewController *)self navigationController];
      [v25 presentViewController:v18 animated:1 completion:0];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  uint64_t v4 = v2[269];
  uint64_t v5 = 3;
  if (v4 != 1) {
    uint64_t v5 = 0;
  }
  BOOL v6 = v4 == 2;
  if (v4 == 2) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v5;
  }
  uint64_t v8 = [v2 navigationController];
  int v9 = [v8 navigationBar];

  [*(id *)(*(void *)v3 + 1184) setUserInteractionEnabled:0];
  [*(id *)(*(void *)v3 + 1192) setUserInteractionEnabled:0];
  [v9 setUserInteractionEnabled:0];
  int v10 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    char v11 = v6;
  }
  else {
    char v11 = 1;
  }
  if (v11) {
    goto LABEL_12;
  }
  if (PKIsSimulator())
  {
    int v10 = *(unsigned __int8 *)(a1 + 40);
LABEL_12:
    [*(id *)(a1 + 32) _setExpressAccessEnabled:v10 != 0 isUWB:*(unsigned __int8 *)(a1 + 41) paymentSetupContext:v7 authenticationCredential:0];
    goto LABEL_13;
  }
  id v12 = *(id *)(*(void *)(a1 + 32) + 1072);
  BOOL v13 = v12;
  if (*(unsigned char *)(a1 + 41))
  {
    int v14 = [v12 isHomeKeyPass];
    uint64_t v15 = [v13 localizedDescription];
    PKPaymentPassActivationState v16 = (void *)v15;
    if (v14) {
      PKLocalizedPaymentString(&cfstr_UnlockOnApproa.isa, &stru_1EF1B4C70.isa, v15);
    }
    else {
    uint64_t v17 = PKLocalizedPaymentString(&cfstr_PassiveEntryAu.isa, &stru_1EF1B4C70.isa, v15);
    }
  }
  else
  {
    PKPaymentPassActivationState v16 = [*(id *)(*(void *)(a1 + 32) + 1072) localizedDescription];
    uint64_t v17 = PKLocalizedPaymentString(&cfstr_ExpressAccessA.isa, &stru_1EF1B4C70.isa, v16);
  }
  uint64_t v18 = (void *)v17;

  id v19 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 1288);
  *(void *)(v20 + 1288) = v19;

  v29[0] = &unk_1EF2B9BA0;
  v29[1] = &unk_1EF2B9BB8;
  v30[0] = v18;
  id v22 = PKLocalizedString(&cfstr_Wallet_0.isa);
  v30[1] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v24 = *(void **)(*(void *)(a1 + 32) + 1288);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_1540;
  void v25[3] = &unk_1E59DF760;
  objc_copyWeak(v26, &location);
  char v27 = *(unsigned char *)(a1 + 41);
  v26[1] = (id)v7;
  [v24 evaluatePolicy:2 options:v23 reply:v25];
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

LABEL_13:
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_1540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  char v13 = *(unsigned char *)(a1 + 48);
  v12[1] = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v3 = [WeakRetained[161] externalizedContext];
    id WeakRetained = v4;
  }
  else
  {
    uint64_t v3 = 0;
  }
  [WeakRetained _setExpressAccessEnabled:1 isUWB:*(unsigned __int8 *)(a1 + 64) paymentSetupContext:*(void *)(a1 + 56) authenticationCredential:v3];
}

uint64_t __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[149] setOn:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_setExpressAccessEnabled:(BOOL)a3 isUWB:(BOOL)a4 paymentSetupContext:(int64_t)a5 authenticationCredential:(id)a6
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v23 = a6;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke;
  aBlock[3] = &unk_1E59DF7B0;
  objc_copyWeak(&v31, &location);
  void aBlock[4] = self;
  int v9 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  id v10 = self->_pass;
  if ([(PKExpressPassController *)self->_expressPassController isExpressModeSupportedForPass:v10])
  {
    id v11 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:v10];
    uint64_t v12 = [v11 isNFCExpressEnabled];
    id v22 = v11;
    uint64_t v13 = [v11 isUWBExpressEnabled];
    uint64_t v14 = v13;
    if (v7)
    {
      if (!v23 && self->_detailViewStyle != 2)
      {
        v9[2](v9, v12, v13);
LABEL_22:

        goto LABEL_23;
      }
      if (v6)
      {
        if (!self->_nfcExpressModeSupported) {
          uint64_t v12 = self->_radioTechnologyType & 1;
        }
        uint64_t v14 = 1;
      }
      else
      {
        uint64_t v12 = 1;
      }
    }
    else if (v6)
    {
      uint64_t v14 = 0;
      if (self->_nfcExpressModeSupported) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if (self->_uwbExpressModeSupported) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    uint64_t v15 = [(PKExpressPassController *)self->_expressPassController expressModeSupportedForPass:v10];
    PKPaymentPassActivationState v16 = (void *)[objc_alloc(MEMORY[0x1E4F846D0]) initWithPassInformation:v15 isNFCExpressEnabled:v12 isUWBExpressEnabled:v14];
    expressPassController = self->_expressPassController;
    if (v16)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_3;
      v27[3] = &unk_1E59DF7D8;
      uint64_t v18 = &v29;
      objc_copyWeak(&v29, &location);
      v27[4] = v16;
      void v27[5] = v10;
      id v28 = v9;
      [(PKExpressPassController *)expressPassController setExpressModeWithPassConfiguration:v16 credential:v23 completion:v27];
      id v19 = (id *)&v28;
    }
    else
    {
      uint64_t v20 = [(PKPaymentPass *)self->_pass uniqueID];
      v33[0] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_4;
      v24[3] = &unk_1E59DF800;
      uint64_t v18 = &v26;
      objc_copyWeak(&v26, &location);
      void v24[4] = v10;
      id v25 = v9;
      [(PKExpressPassController *)expressPassController disableExpressModeForPassesWithUniqueIdentifiers:v21 withCompletion:v24];

      id v19 = (id *)&v25;
    }

    objc_destroyWeak(v18);
    goto LABEL_22;
  }
  v9[2](v9, 0, 0);
LABEL_23:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke(uint64_t a1, char a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v7 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_2;
    block[3] = &unk_1E59DB110;
    char v10 = a3;
    char v11 = a2;
    uint64_t v8 = *(void *)(a1 + 32);
    void block[4] = WeakRetained;
    void block[5] = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v6 = [v2 navigationBar];

  *(unsigned char *)(*(void *)(a1 + 32) + 1298) = *(unsigned char *)(a1 + 48);
  [*(id *)(*(void *)(a1 + 32) + 1192) setOn:*(unsigned __int8 *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1296) = *(unsigned char *)(a1 + 49);
  [*(id *)(*(void *)(a1 + 32) + 1184) setOn:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(*(void *)(a1 + 32) + 1184) setUserInteractionEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 1192) setUserInteractionEnabled:1];
  [v6 setUserInteractionEnabled:1];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1288);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 1288);
    *(void *)(v4 + 1288) = 0;
  }
}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = [v3 containsObject:*(void *)(a1 + 32)];
  uint64_t v6 = WeakRetained[134];
  if (v5)
  {
    [WeakRetained _reportExpressModeEnable:v6];
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) isNFCExpressEnabled], objc_msgSend(*(id *)(a1 + 32), "isUWBExpressEnabled"));
  }
  else
  {
    uint64_t v18 = WeakRetained;
    [WeakRetained _reportExpressModeEnableFailed:v6];
    BOOL v7 = [*(id *)(a1 + 40) uniqueID];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v3;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [v14 passUniqueIdentifier];
          int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            id v17 = v14;

            char v11 = v17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
    }

    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v11 isNFCExpressEnabled], objc_msgSend(v11, "isUWBExpressEnabled"));
    id WeakRetained = v18;
    id v3 = v19;
  }
}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _reportExpressModeDisable:WeakRetained[134]];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueID];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 passUniqueIdentifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;

          id v8 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v8 isNFCExpressEnabled], objc_msgSend(v8, "isUWBExpressEnabled"));
}

- (void)_messagesSwitchChanged:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  pass = self->_pass;
  id v5 = a3;
  uint64_t v6 = [(PKPaymentPass *)pass settings];
  uint64_t v7 = [v5 isOn];

  if (((v7 ^ ((v6 & 0x40) == 0)) & 1) == 0)
  {
    uint64_t v8 = 64;
    if (!v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = v8 | v6 & 0xFFFFFFFFFFFFFFBFLL;
    uint64_t v10 = *MEMORY[0x1E4F85E10];
    id v14 = @"messages";
    char v11 = [NSNumber numberWithBool:v7];
    v15[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    MEMORY[0x1A6220EC0](v10, v12);

    int v13 = [(PKSettingTableCell *)self->_messagesSwitch settingSwitch];
    [v13 setEnabled:0];

    [(PKPaymentPass *)self->_pass setSettings:v9];
  }
}

- (void)_transactionsSwitchChanged:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  pass = self->_pass;
  id v5 = a3;
  uint64_t v6 = [(PKPaymentPass *)pass settings];
  uint64_t v7 = [v5 isOn];

  if (((v7 ^ ((v6 & 8) == 0)) & 1) == 0)
  {
    uint64_t v8 = 8;
    if (!v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = v8 | v6 & 0xFFFFFFFFFFFFFFF7;
    uint64_t v10 = *MEMORY[0x1E4F85E10];
    uint64_t v15 = @"transactions";
    char v11 = [NSNumber numberWithBool:v7];
    v16[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    MEMORY[0x1A6220EC0](v10, v12);

    int v13 = [(PKPaymentPass *)self->_pass transactionServiceURL];

    if (v13)
    {
      id v14 = [(PKSettingTableCell *)self->_transactionsSwitch settingSwitch];
      [v14 setEnabled:0];
    }
    [(PKPaymentPass *)self->_pass setSettings:v9];
    [(PKPaymentPassDetailViewController *)self reloadData:1];
    [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForToggleTag:*MEMORY[0x1E4F86D60] toggleResult:v7 additionalAnalytics:0];
  }
}

- (void)_notificationSwitchChanged:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  unint64_t v6 = [(PKPaymentPass *)pass settings];
  int v7 = [v5 isOn];

  if (v7 == ((v6 >> 7) & 1))
  {
    uint64_t v8 = 128;
    if (v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = self->_pass;
    [(PKPaymentPass *)v9 setSettings:v8 | v6 & 0xFFFFFFFFFFFFFF7FLL];
  }
}

- (void)_dailyCashSwitchChanged:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  unint64_t v6 = [(PKPaymentPass *)pass settings];
  int v7 = [v5 isOn];

  if (v7 == ((v6 >> 10) & 1))
  {
    uint64_t v8 = 1024;
    if (v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = self->_pass;
    [(PKPaymentPass *)v9 setSettings:v8 | v6 & 0xFFFFFFFFFFFFFBFFLL];
  }
}

- (void)_activationFooterPressed:(id)a3
{
  [(PKPaymentVerificationController *)self->_verificationController clearSelectedChannel];

  [(PKPaymentPassDetailViewController *)self _presentVerificationFlow];
}

- (void)_presentVerificationFlow
{
  id v3 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:[(PKPaymentVerificationController *)self->_verificationController context]];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:self->_webService];
  id v5 = objc_alloc(MEMORY[0x1E4F84ED0]);
  int64_t detailViewStyle = self->_detailViewStyle;
  uint64_t v7 = 3;
  if (detailViewStyle != 1) {
    uint64_t v7 = 0;
  }
  if (detailViewStyle == 2) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  unint64_t v9 = (void *)[v5 initWithEnvironment:v8 provisioningController:v4 groupsController:self->_groupsController];
  [v9 setIsFollowupProvisioning:1];
  objc_initWeak(&location, self);
  pass = self->_pass;
  verificationController = self->_verificationController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentPassDetailViewController__presentVerificationFlow__block_invoke;
  void v13[3] = &unk_1E59CB010;
  objc_copyWeak(&v15, &location);
  uint64_t v12 = v3;
  id v14 = v12;
  +[PKProvisioningFlowBridge startVerificationFlowWithNavController:v12 context:v9 pass:pass verificationController:verificationController presentNavController:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __61__PKPaymentPassDetailViewController__presentVerificationFlow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationController];
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (void)_done:(id)a3
{
}

- (void)_passSettingsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F875C0]];
  uint64_t v7 = [(PKPaymentPass *)self->_pass uniqueID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    unint64_t v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F875B8]];

    if (v10)
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __58__PKPaymentPassDetailViewController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E59CB460;
      void v12[4] = self;
      void v12[5] = v11;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
}

void __58__PKPaymentPassDetailViewController__passSettingsChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setSettingsWithoutUpdatingDataAccessor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1152);
  if (v3)
  {
    char v4 = [v3 isOn] ^ ((*(unsigned char *)(a1 + 40) & 8) == 0);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    char v4 = 1;
  }
  id v5 = [*(id *)(v2 + 1144) settingSwitch];
  [v5 setOn:(*(void *)(a1 + 40) >> 6) & 1];

  unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1152) settingSwitch];
  [v6 setOn:(*(void *)(a1 + 40) >> 3) & 1];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1176) settingSwitch];
  [v7 setOn:(*(void *)(a1 + 40) >> 4) & 1];

  int v8 = [*(id *)(*(void *)(a1 + 32) + 1168) settingSwitch];
  [v8 setOn:(*(void *)(a1 + 40) & 0x80) == 0];

  if ((v4 & 1) == 0)
  {
    unint64_t v9 = *(void **)(a1 + 32);
    [v9 reloadPassDetailSections:&unk_1EF2BA2D8];
  }
}

- (void)contactsDidChangeForContactResolver:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentPassDetailViewController_contactsDidChangeForContactResolver___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PKPaymentPassDetailViewController_contactsDidChangeForContactResolver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTransactionSectionsAnimated:1 forceReload:1];
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v12 = a3;
  char v4 = [v12 provisioningController];
  id v5 = [v4 provisionedPasses];
  unint64_t v6 = [v5 lastObject];
  uint64_t v7 = [v6 secureElementPass];
  int v8 = [v7 paymentPass];

  if (self->_detailViewStyle == 2 && v8 != 0)
  {
    uint64_t v10 = [(PKPaymentPassDetailViewController *)self navigationController];
    id v11 = (id)[v10 popViewControllerAnimated:0];
  }
  [v12 dismissViewControllerAnimated:1 completion:0];
}

- (void)passHeaderViewPassWasDeleted:(id)a3
{
  id v8 = a3;
  group = self->_group;
  if (group && [(PKGroup *)group passCount])
  {
    id v5 = [(PKGroup *)self->_group passAtIndex:0];
    unint64_t v6 = [v5 paymentPass];
    pass = self->_pass;
    self->_pass = v6;

    [(PKPaymentPassDetailViewController *)self _applyStaticPassPropertiesForPass];
    [v8 setPass:self->_pass];
    [(PKPaymentPassDetailViewController *)self _updatePassSnapshot];
    if (self->_showingTitleIconView) {
      [(PKAnimatedNavigationBarTitleView *)self->_titleIconView setTitleView:self->_passSnapshotView animated:0];
    }
    [(PKPaymentPassDetailViewController *)self reloadData:0];
  }
}

- (void)callIssuer
{
  id v3 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
  [v3 callIssuer];

  uint64_t v4 = *MEMORY[0x1E4F86138];

  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedButtonTag:v4 additionalAnalytics:0];
}

- (void)openIssuerWebsite
{
  id v3 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
  [v3 openIssuerWebsite];

  uint64_t v4 = *MEMORY[0x1E4F86CF8];

  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedButtonTag:v4 additionalAnalytics:0];
}

- (void)emailIssuer
{
  id v2 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
  [v2 emailIssuer];
}

- (void)openBusinessChat
{
  if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked])
  {
    id v3 = [(PKPaymentPassDetailViewController *)self bankConnectAccount];
    uint64_t v4 = [v3 actions];
    id v10 = [v4 digitalServicingURL];

    if (v10)
    {
      id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v5 openURL:v10 withOptions:0];
    }
    goto LABEL_6;
  }
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPaymentPassDetailViewController *)self presentViewController:v10 animated:1 completion:0];
LABEL_6:

    return;
  }
  if ([(PKAccount *)self->_account feature] == 2)
  {
    unint64_t v6 = [[PKBusinessChatPassDetailsContext alloc] initWithPass:self->_pass];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84278]);
    [v7 setBusinessChatContext:v6];
    id v8 = [(PKPaymentPassDetailViewController *)self _accountResolutionController];
    [v8 presentFlowForAccountResolution:3 configuration:v7 completion:0];
  }
  else if ([(PKAccount *)self->_account feature] == 3)
  {
    [(PKPaymentPassDetailViewController *)self handleOpenBusinessChatForPayLater];
  }
  uint64_t v9 = *MEMORY[0x1E4F86658];

  [(PKPaymentPassDetailViewController *)self _reportPassDetailsAnalyticsForTappedButtonTag:v9 additionalAnalytics:0];
}

- (void)presentContactIssuerSheet
{
  id v2 = [(PKPaymentPassDetailViewController *)self contactIssuerHelper];
  [v2 presentContactViewController:3];
}

- (void)addMoney
{
  if ([(PKPaymentPass *)self->_pass isPeerPaymentPass])
  {
    [(PKPaymentPassDetailViewController *)self presentTopUp];
  }
  else if ([(PKPaymentPass *)self->_pass isAppleBalancePass])
  {
    appleBalanceAddMoneyUIManager = self->_appleBalanceAddMoneyUIManager;
    [(PKAppleBalanceAddMoneyUIManager *)appleBalanceAddMoneyUIManager presentAddMoneyFromViewController:self dtuConfiguration:0 inStoreToken:0];
  }
}

- (void)redeemGiftCard
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKPaymentPassDetailViewController *)&v4 traitCollectionDidChange:a3];
  [(PKPaymentPassDetailViewController *)self _updateHeaderHeightDeterminingLayout:0];
  [(PKPaymentPassDetailViewController *)self reloadData:0];
}

- (void)presentCombinedPassActionViewControllerFromBundle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionGroups];
  unint64_t v6 = [v4 actionsMatchingTypes:&unk_1EF2BA2F0];
  id v7 = [v4 actionsMatchingTypes:&unk_1EF2BA308];

  uint64_t v8 = [v5 count];
  uint64_t v9 = [v6 count];
  uint64_t v10 = [v7 count];
  if (!v8)
  {
    if (v9)
    {
      id v15 = [PKPaymentPassActionDataController alloc];
      pass = self->_pass;
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      webService = self->_webService;
      transitBalanceModel = self->_transitBalanceModel;
      long long v20 = v6;
      uint64_t v21 = 2;
    }
    else
    {
      if (!v10) {
        goto LABEL_8;
      }
      id v15 = [PKPaymentPassActionDataController alloc];
      pass = self->_pass;
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      webService = self->_webService;
      transitBalanceModel = self->_transitBalanceModel;
      long long v20 = v7;
      uint64_t v21 = 1;
    }
    long long v22 = [(PKPaymentPassActionDataController *)v15 initWithPass:pass actions:v20 paymentDataProvider:paymentServiceDataProvider webService:webService actionType:v21 balanceModel:transitBalanceModel];
    actionController = self->_actionController;
    self->_actionController = v22;

LABEL_8:
    int v13 = self->_actionController;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke_2;
    char v27 = &unk_1E59D1070;
    id v28 = self;
    id v14 = &v24;
    goto LABEL_9;
  }
  id v11 = [[PKPaymentPassCombinedActionDataController alloc] initWithPass:self->_pass actionGroups:v5 paymentDataProvider:self->_paymentServiceDataProvider webService:self->_webService balanceModel:self->_transitBalanceModel mode:0];
  combinedActionController = self->_combinedActionController;
  self->_combinedActionController = v11;

  int v13 = self->_combinedActionController;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  id v31 = __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke;
  id v32 = &unk_1E59D1070;
  uint64_t v33 = self;
  id v14 = &v29;
LABEL_9:
  objc_msgSend(v13, "fetchViewController:", v14, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33);
}

void __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  if (a3)
  {
    [v5 presentViewController:a3 animated:1 completion:0];
  }
  else
  {
    unint64_t v6 = [v5 navigationController];
    [v6 pushViewController:v7 animated:1];
  }
}

void __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  else if (v7)
  {
    unint64_t v6 = [*(id *)(a1 + 32) navigationController];
    [v6 pushViewController:v7 animated:1];
  }
}

- (void)performPaymentPassActionBundle:(id)a3
{
  id v4 = [a3 actionBundle];
  [(PKPaymentPassDetailViewController *)self presentCombinedPassActionViewControllerFromBundle:v4];
}

- (void)didChangeVerificationPresentation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentPassDetailViewController_didChangeVerificationPresentation__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKPaymentPassDetailViewController_didChangeVerificationPresentation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateActivationFooterViewContents];
  [*(id *)(a1 + 32) reloadSection:29];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1992) allSectionIdentifiers];
  [v6 addObjectsFromArray:v2];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 2000) allSectionIdentifiers];
  [v6 addObjectsFromArray:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v6 allObjects];
  [v4 reloadSections:v5];
}

- (void)dismissVerificationViewControllerAnimated:(BOOL)a3
{
}

- (id)presentationContext
{
  id v2 = [(PKPaymentPassDetailViewController *)self view];
  id v3 = [v2 window];

  return v3;
}

- (void)_presentMerchantDetailsViewWithTransaction:(id)a3 forCell:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 merchant];
  uint64_t v9 = [v8 mapsMerchant];

  id v10 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "identifier"));
  v32[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v10 _setMuids:v12];

  if ([v9 resultProviderIdentifier]) {
    objc_msgSend(v10, "_setResultProviderID:", objc_msgSend(v9, "resultProviderIdentifier"));
  }
  int v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke;
  handler[3] = &unk_1E59CA870;
  id v15 = v13;
  uint64_t v30 = v15;
  id v16 = v7;
  id v31 = v16;
  dispatch_source_set_event_handler(v15, handler);
  dispatch_resume(v15);
  [v16 setUserInteractionEnabled:0];
  objc_initWeak(&location, self);
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v10];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke_2;
  v22[3] = &unk_1E59DF828;
  long long v18 = v15;
  long long v23 = v18;
  objc_copyWeak(&v27, &location);
  id v19 = v6;
  id v24 = v19;
  id v20 = v16;
  id v25 = v20;
  id v21 = v9;
  id v26 = v21;
  [v17 startWithCompletionHandler:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

uint64_t __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id v3 = *(void **)(a1 + 40);

  return [v3 setShowsActionSpinner:1];
}

void __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_source_cancel(v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained isViewLoaded])
  {
    uint64_t v9 = (void *)WeakRetained[186];
    id v10 = [*(id *)(a1 + 40) identifier];
    id v11 = [v9 objectForKey:v10];

    id v12 = (void *)WeakRetained[186];
    int v13 = [*(id *)(a1 + 40) identifier];
    [v12 removeObjectForKey:v13];

    [*(id *)(a1 + 48) setShowsActionSpinner:0];
    [*(id *)(a1 + 48) setUserInteractionEnabled:1];
    if (v6
      || ([v5 mapItems],
          long long v17 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = [v17 count],
          v17,
          !v18))
    {
      dispatch_time_t v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 56) identifier];
        if (v6)
        {
          id v16 = [v6 localizedDescription];
        }
        else
        {
          id v16 = @"no map items.";
        }
        int v24 = 134218242;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        id v27 = v16;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v24, 0x16u);
        if (v6) {
      }
        }
      if (v11) {
        v11[2](v11, 0);
      }
    }
    else
    {
      id v19 = [PKMerchantMapViewController alloc];
      id v20 = [v5 mapItems];
      id v21 = [v20 firstObject];
      long long v22 = [(PKMerchantMapViewController *)v19 initWithMapItem:v21 configOptions:129];

      long long v23 = [WeakRetained navigationController];
      [v23 pushViewController:v22 animated:1];

      if (v11) {
        v11[2](v11, 1);
      }
    }
  }
}

- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPaymentPassDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E59CC648;
  id v10 = v7;
  int64_t v11 = a4;
  void block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__PKPaymentPassDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    BOOL v3 = v2 == 2;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1659) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 1658) = 0;
  }
  else if (v2 == 3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1659) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 1658) = 0;
    id v4 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 40), [*(id *)(a1 + 32) _accountFeature], 0, 0);
    id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 reloadSection:21];
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  BOOL v3 = [(PKPaymentPassDetailViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)refreshControlValueChanged:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isRefreshing])
  {
    objc_initWeak(&location, self);
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    char v39 = 1;
    id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    refreshTimeout = self->_refreshTimeout;
    self->_refreshTimeout = v5;

    id v7 = self->_refreshTimeout;
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    uint64_t v9 = self->_refreshTimeout;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke;
    handler[3] = &unk_1E59CFCB8;
    void handler[4] = v40;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v9, handler);
    id v10 = dispatch_group_create();
    int64_t v11 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    id v12 = [v11 appletDataFormat];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      dispatch_time_t v14 = [(PKPaymentWebService *)self->_webService context];
      id obj = [v14 TSMPushTopics];

      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v15)
      {
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            dispatch_group_enter(v10);
            uint64_t v18 = [(PKPaymentWebService *)self->_webService targetDevice];
            webService = self->_webService;
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            void v29[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_2;
            v29[3] = &unk_1E59DF850;
            id v31 = v38;
            uint64_t v30 = v10;
            [v18 paymentWebService:webService queueConnectionToTrustedServiceManagerForPushTopic:v17 withCompletion:v29];
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v43 count:16];
        }
        while (v15);
      }
    }
    dispatch_group_enter(v10);
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_3;
    block[3] = &unk_1E59CA7D0;
    uint64_t v28 = v10;
    id v21 = v10;
    long long v22 = MEMORY[0x1E4F14428];
    dispatch_after(v20, MEMORY[0x1E4F14428], block);

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_4;
    void v25[3] = &unk_1E59DF878;
    void v25[4] = v40;
    objc_copyWeak(&v26, &location);
    void v25[5] = v38;
    dispatch_group_notify(v21, v22, v25);

    dispatch_resume((dispatch_object_t)self->_refreshTimeout);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v37);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    objc_destroyWeak(&location);
  }
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _refreshFinished:1];
  }
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_3(uint64_t a1)
{
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _refreshFinished:*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0];
  }
}

- (void)_refreshFinished:(BOOL)a3
{
  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    id v5 = self->_refreshTimeout;
    self->_refreshTimeout = 0;
  }
  refreshControl = self->_refreshControl;

  [(UIRefreshControl *)refreshControl endRefreshing];
}

- (BOOL)shouldAllowRefresh
{
  char v3 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  id v4 = [v3 appletDataFormat];
  if (v4)
  {
    id v5 = [(PKPaymentWebService *)self->_webService context];
    id v6 = [v5 TSMPushTopics];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)balanceDetailsViewController:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  id v7 = a4;
  id v8 = [a5 identifiers];
  [(PKPaymentPassDetailViewController *)self _handleUpdatedBalanceReminder:v7 forBalanceWithIdentifier:v8];
}

- (void)_updatePassesInGroupSectionWithUpdatedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);

  [(PKPaymentPassDetailViewController *)self reloadSection:41];
}

- (void)_reportPassDetailsAnalyticsForTappedRowTag:(id)a3 additionalAnalytics:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F86760];
    uint64_t v9 = *MEMORY[0x1E4F86308];
    v15[0] = *MEMORY[0x1E4F86730];
    v15[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86468];
    v16[0] = v8;
    v16[1] = v10;
    void v15[2] = *MEMORY[0x1E4F86BB0];
    void v16[2] = v6;
    int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    id v12 = (void *)[v11 mutableCopy];

    if (v7) {
      [v12 addEntriesFromDictionary:v7];
    }
    BOOL v13 = (void *)MEMORY[0x1E4F843E0];
    dispatch_time_t v14 = (void *)[v12 copy];
    [v13 reportDashboardEventIfNecessary:v14 forPass:self->_pass];
  }
}

- (void)_reportPassDetailsAnalyticsForTappedButtonTag:(id)a3 additionalAnalytics:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F86760];
    uint64_t v9 = *MEMORY[0x1E4F86308];
    v15[0] = *MEMORY[0x1E4F86730];
    v15[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86380];
    v16[0] = v8;
    v16[1] = v10;
    void v15[2] = *MEMORY[0x1E4F86120];
    void v16[2] = v6;
    int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    id v12 = (void *)[v11 mutableCopy];

    if (v7) {
      [v12 addEntriesFromDictionary:v7];
    }
    BOOL v13 = (void *)MEMORY[0x1E4F843E0];
    dispatch_time_t v14 = (void *)[v12 copy];
    [v13 reportDashboardEventIfNecessary:v14 forPass:self->_pass];
  }
}

- (void)_reportPassDetailsAnalyticsForToggleTag:(id)a3 toggleResult:(BOOL)a4 additionalAnalytics:(id)a5
{
  BOOL v6 = a4;
  void v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F86760];
    uint64_t v11 = *MEMORY[0x1E4F86308];
    v20[0] = *MEMORY[0x1E4F86730];
    v20[1] = v11;
    uint64_t v12 = *MEMORY[0x1E4F86480];
    v21[0] = v10;
    v21[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F86D00];
    v20[2] = *MEMORY[0x1E4F86D30];
    v20[3] = v13;
    dispatch_time_t v14 = (uint64_t *)MEMORY[0x1E4F86D10];
    if (!v6) {
      dispatch_time_t v14 = (uint64_t *)MEMORY[0x1E4F86D08];
    }
    uint64_t v15 = *v14;
    v21[2] = v8;
    v21[3] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    uint64_t v17 = (void *)[v16 mutableCopy];

    if (v9) {
      [v17 addEntriesFromDictionary:v9];
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F843E0];
    id v19 = (void *)[v17 copy];
    [v18 reportDashboardEventIfNecessary:v19 forPass:self->_pass];
  }
}

- (void)_beginReportingForSubjectIfNecessary:(id)a3
{
  id v5 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F843E0], "reporterForSubject:");

  if (!v4)
  {
    [(NSMutableSet *)self->_startedAnalyticsSubjects addObject:v5];
    [MEMORY[0x1E4F843E0] beginSubjectReporting:v5];
  }
}

- (void)_endReportingIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)[(NSMutableSet *)self->_startedAnalyticsSubjects copy];
  [(NSMutableSet *)self->_startedAnalyticsSubjects removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v4);
        }
        objc_msgSend(MEMORY[0x1E4F843E0], "endSubjectReporting:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  uint64_t v6 = (PKLinkedApplication *)a3;
  BOOL v4 = [(PKDynamicTableViewController *)self hasSectionForSectionIdentifier:@"PassesInGroup"];
  uint64_t v5 = v6;
  if (v4 && self->_linkedApplication == v6)
  {
    [(PKPaymentPassDetailViewController *)self reloadSection:41];
    uint64_t v5 = v6;
  }
}

- (void)presentAuthRequestForPolicy:(int64_t)a3 completion:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3)
  {
    uint64_t v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    p_authenticationContext = &self->_authenticationContext;
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v8;

    v19[0] = &unk_1EF2B9BB8;
    long long v11 = PKLocalizedString(&cfstr_Wallet_0.isa);
    v19[1] = &unk_1EF2B9BE8;
    v20[0] = v11;
    v20[1] = MEMORY[0x1E4F1CC38];
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

    objc_initWeak(&location, self);
    if (a3 == 1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    uint64_t v14 = *p_authenticationContext;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke;
    void v15[3] = &unk_1E59DF8A0;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    [(LAContext *)v14 evaluatePolicy:v13 options:v12 reply:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke_2;
  v10[3] = &unk_1E59CFAE0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained[161] invalidate];
    id v3 = v5[161];
    v5[161] = 0;

    if (*(void *)(a1 + 32)) {
      BOOL v4 = *(void *)(a1 + 40) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4);
    id WeakRetained = v5;
  }
}

- (void)presentPassDetailDrillInForField:(id)a3
{
  id v4 = a3;
  id v6 = -[PKPassDetailSectionDrillInViewController initWithPass:field:useBridgeStyle:isShowingSecureInformation:]([PKPassDetailSectionDrillInViewController alloc], "initWithPass:field:useBridgeStyle:isShowingSecureInformation:", self->_pass, v4, self->_detailViewStyle == 2, [v4 authRequirement] != 0);

  id v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)sharesSectionControllerDidSelectViewEntitlements:(id)a3
{
  id v10 = [(PKPassDetailSharesSectionController *)self->_sharesSectionController sharesController];
  id v4 = objc_alloc(MEMORY[0x1E4F84870]);
  id v5 = [v10 myEntitlements];
  id v6 = [v10 possiblePredefinedEntitlements];
  id v7 = (void *)[v4 initWithMyEntitlements:v5 predefinedSharedEntitlements:v6];

  id v8 = [[PKPassShareEntitlementSelectionViewController alloc] initWithAccessType:[(PKPaymentPass *)self->_pass accessType] mode:2 entitlementComposer:v7];
  id v9 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  id v5 = [v4 presentingViewController];

  [v5 dismissViewControllerAnimated:1 completion:0];
  id v7 = [(PKPaymentPassDetailViewController *)self navigationController];
  id v6 = (id)[v7 popToRootViewControllerAnimated:1];
}

- (void)presentPassActionViewController:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PKPaymentPassDetailViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 setDelegate:self];
      [v6 setWebService:self->_webService];
      id v4 = [[PKNavigationController alloc] initWithRootViewController:v6];
      [(PKNavigationController *)v4 setSupportedInterfaceOrientations:2];
      [(PKPaymentPassDetailViewController *)self presentViewController:v4 animated:1 completion:0];
    }
    else if (v6)
    {
      id v5 = [(PKPaymentPassDetailViewController *)self navigationController];
      [v5 pushViewController:v6 animated:1];
    }
  }
}

- (void)autoReloadSetupControllerDidComplete
{
  id v3 = [(PKPaymentPassDetailViewController *)self navigationController];
  id v2 = (id)[v3 popToRootViewControllerAnimated:1];
}

- (void)launchAppURL:(id)a3
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F223E0] defaultWorkspace],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isApplicationAvailableToOpenURL:v4 error:0],
        v5,
        v6))
  {
    id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v7 openURL:v4 configuration:0 completionHandler:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PKPaymentPassDetailViewController_launchAppURL___block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __50__PKPaymentPassDetailViewController_launchAppURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "openApplication:");
}

- (void)launchURL:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F590F0]) initWithURL:v4];
    [v5 setShouldReturnErrorOnUserCancellation:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PKPaymentPassDetailViewController_launchURL___block_invoke;
    v7[3] = &unk_1E59CDC80;
    void v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [v5 requestClipWithCompletion:v7];
  }
  else
  {
    -[PKPaymentPassDetailViewController launchAppURL:](self, "launchAppURL:");
  }
}

void __47__PKPaymentPassDetailViewController_launchURL___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailAutoReloadMerchantSectionControllerDelegate launches app clip", v8, 2u);
    }
  }
  else if ([v5 code] != 8)
  {
    [*(id *)(a1 + 32) launchAppURL:*(void *)(a1 + 40)];
  }
}

- (void)didSelectInDemoMode
{
  PKUIStoreDemoGatewayViewController();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentPassDetailViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)didSelectMakePayment
{
  id v2 = [(PKPaymentPassDetailViewController *)self _accountResolutionController];
  [v2 presentFlowForAccountResolution:1 configuration:0 completion:0];
}

- (void)didSelectPayment:(id)a3
{
  id v4 = a3;
  id v6 = [[PKCreditAccountPaymentDetailsViewController alloc] initWithAccount:self->_account payment:v4 paymentWebService:self->_webService detailViewStyle:self->_detailViewStyle];

  id v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailViewController *)self _activeOrderOfSectionIdentifiers];
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  [(PKDynamicTableViewController *)&v6 recomputeMappedSectionsAndReloadSections:v4 sectionIdentifiers:v5];
}

- (id)cellForRow:(unint64_t)a3 inSection:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", a4));
  objc_super v6 = [(PKPaymentPassDetailViewController *)self tableView];
  id v7 = [v6 cellForRowAtIndexPath:v5];

  return v7;
}

- (void)didUpdateLatestTransactions:(id)a3 monthlyTransactionGroups:(id)a4 yearlyTransactionGroups:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([(PKPaymentPassDetailViewController *)self _isBankConnectLinked])
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v31 = self;
    id v10 = [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController connectedInstitution];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)[objc_alloc(MEMORY[0x1E4F84CF8]) initFromFKTransaction:*(void *)(*((void *)&v40 + 1) + 8 * v15) institution:v10];
          [v9 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v13);
    }

    id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v8;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F84D10]) initFromFKTransactionGroup:*(void *)(*((void *)&v36 + 1) + 8 * v22)];
          [v17 addObject:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v20);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__PKPaymentPassDetailViewController_didUpdateLatestTransactions_monthlyTransactionGroups_yearlyTransactionGroups___block_invoke;
    aBlock[3] = &unk_1E59DF8C8;
    void aBlock[4] = v31;
    id v35 = v17;
    id v24 = v17;
    uint64_t v25 = _Block_copy(aBlock);
    id v26 = (void *)MEMORY[0x1E4F84CF8];
    id v27 = [(PKPaymentPassDetailViewController *)v31 transactionSourceCollection];
    uint64_t v28 = [v27 transactionSourceIdentifiers];
    uint64_t v29 = [(PKPaymentPassDetailViewController *)v31 pass];
    uint64_t v30 = [v29 uniqueID];
    [v26 augmentTransactionsIfNeeded:v9 transactionSourceIdentifiers:v28 passUniqueID:v30 usingDataProvider:0 completion:v25];

    id v8 = v32;
    id v7 = v33;
  }
}

void __114__PKPaymentPassDetailViewController_didUpdateLatestTransactions_monthlyTransactionGroups_yearlyTransactionGroups___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1232), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), *(id *)(a1 + 40));
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "objectAtIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1528), "selectedSegmentIndex"));
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 == 1) {
    [*(id *)(a1 + 32) reloadData:0];
  }
}

- (void)didEvaluatePolicyToOpenBankConnectAccountCredentials:(id)a3 accountCredentialsTitle:(id)a4
{
  id v6 = +[BankConnectAccountCredentialsViewControllerProvider makeViewControllerWithAccountCredentials:a3 title:a4];
  uint64_t v5 = [(PKPaymentPassDetailViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)didReloadBankConnectAccountCredentials
{
  if (![(UISegmentedControl *)self->_tabBar selectedSegmentIndex])
  {
    [(PKPaymentPassDetailViewController *)self reloadData:0];
  }
}

- (void)didFindLinkableBankConnectInstitution
{
  id v3 = [(PKPassDetailBankConnectSectionController *)self->_bankConnectSectionController allSectionIdentifiers];
  [(PKPaymentPassDetailViewController *)self reloadSections:v3];
}

- (void)didStartBankConnectAuthorizationForInstitution:(id)a3 withCompletion:(id)a4
{
  v34[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F87038];
  id v8 = a3;
  [(PKPaymentPassDetailViewController *)self _beginReportingForSubjectIfNecessary:v7];
  id v9 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v10 = *MEMORY[0x1E4F86380];
  uint64_t v11 = *MEMORY[0x1E4F86730];
  v33[0] = *MEMORY[0x1E4F86308];
  v33[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F86760];
  v34[0] = v10;
  v34[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F86120];
  v34[2] = *MEMORY[0x1E4F865D0];
  uint64_t v14 = *MEMORY[0x1E4F865A0];
  v33[2] = v13;
  void v33[3] = v14;
  uint64_t v15 = [v8 name];
  v34[3] = v15;
  void v33[4] = *MEMORY[0x1E4F867B8];
  id v16 = [(PKPaymentPassDetailViewController *)self pass];
  id v17 = [v16 issuerCountryCode];
  v34[4] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
  [v9 subject:v7 sendEvent:v18];

  uint64_t v19 = +[PKDismissalPreventionAssertionManager sharedInstance];
  uint64_t v20 = [v19 acquireAssertion];

  Class FKBankConnectAuthorizationViewControllerProviderClass_1 = getFKBankConnectAuthorizationViewControllerProviderClass_1();
  uint64_t v22 = [(PKPaymentPassDetailViewController *)self pass];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __99__PKPaymentPassDetailViewController_didStartBankConnectAuthorizationForInstitution_withCompletion___block_invoke;
  uint64_t v29 = &unk_1E59D1180;
  id v31 = v20;
  id v32 = v6;
  uint64_t v30 = self;
  id v23 = v20;
  id v24 = v6;
  uint64_t v25 = [(objc_class *)FKBankConnectAuthorizationViewControllerProviderClass_1 makeAuthorizationViewControllerWithPaymentPass:v22 institution:v8 completion:&v26];

  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0, v26, v27, v28, v29, v30);
}

uint64_t __99__PKPaymentPassDetailViewController_didStartBankConnectAuthorizationForInstitution_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

- (void)didUpdateBankConnectAccount:(id)a3
{
  -[PKPaymentPassDetailViewController setBankConnectAccount:](self, "setBankConnectAccount:");
  if (a3)
  {
    [(PKPaymentPassDetailViewController *)self _loadBankConnectTransactions];
  }
  else if ([(PKPaymentPassDetailViewController *)self _shouldShowTransactionsSection])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__PKPaymentPassDetailViewController_didUpdateBankConnectAccount___block_invoke;
    v5[3] = &unk_1E59CB6D8;
    void v5[4] = self;
    [(PKPaymentPassDetailViewController *)self _reloadTransactionsWithCompletion:v5];
    return;
  }
  [(PKPaymentPassDetailViewController *)self contentIsLoaded];

  [(PKPaymentPassDetailViewController *)self reloadData:0];
}

uint64_t __65__PKPaymentPassDetailViewController_didUpdateBankConnectAccount___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) contentIsLoaded];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadData:0];
}

- (void)didSelectPrecursorPassRequestForDescription:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke;
  aBlock[3] = &unk_1E59CAA98;
  id v11 = v10;
  id v37 = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  switch([v8 actionType])
  {
    case 0:
      goto LABEL_3;
    case 1:
      uint64_t v15 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
      if (self->_detailViewStyle == 2) {
        [MEMORY[0x1E4F84BB8] watchWebServiceForIssuerProvisioning];
      }
      else {
      id v16 = [MEMORY[0x1E4F84D50] sharedService];
      }
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v16];
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v22 groupsController:0];
      [v17 setIsFollowupProvisioning:1];
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      char v35 = 0;
      id v18 = [(PKPaymentPassDetailViewController *)self navigationController];
      pass = self->_pass;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_2;
      v29[3] = &unk_1E59DF8F0;
      id v20 = v18;
      id v30 = v20;
      id v31 = v15;
      id v33 = v34;
      id v32 = v12;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_4;
      void v25[3] = &unk_1E59D14F8;
      uint64_t v28 = v34;
      uint64_t v27 = v32;
      uint64_t v21 = v31;
      uint64_t v26 = v21;
      +[PKProvisioningFlowBridge startPrecursorPassFlowWithNavController:v21 context:v17 pass:pass precursorController:v9 parentNavController:v20 presentNavController:v29 completion:v25];

      _Block_object_dispose(v34, 8);
      break;
    case 2:
    case 3:
      [(PKPaymentPassDetailViewController *)self _didSelectDeleteCard];
LABEL_3:
      v12[2](v12);
      break;
    case 4:
      uint64_t v13 = [v8 actionURL];
      if (v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_5;
        v23[3] = &unk_1E59CEA50;
        id v24 = v12;
        [v14 openURL:v13 configuration:0 completionHandler:v23];
      }
      else
      {
        v12[2](v12);
      }

      break;
    default:
      break;
  }
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_3;
  v5[3] = &unk_1E59CD8C8;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 presentViewController:v2 animated:1 completion:v5];
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_4(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  uint64_t v2 = (void *)a1[4];

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didSelectDeleteReAddForSectionController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_webService;
  id v9 = self->_pass;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke;
  aBlock[3] = &unk_1E59DD730;
  id v10 = v7;
  id v22 = v10;
  objc_copyWeak(&v23, &location);
  id v11 = _Block_copy(aBlock);
  uint64_t v12 = [(PKPaymentWebService *)v8 targetDevice];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_2;
  v16[3] = &unk_1E59D65A8;
  objc_copyWeak(&v20, &location);
  id v13 = v11;
  id v19 = v13;
  uint64_t v14 = v8;
  id v17 = v14;
  uint64_t v15 = v9;
  id v18 = v15;
  [v12 paymentWebService:v14 removePass:v15 withCompletionHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke(uint64_t a1, int a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    long long v4 = [WeakRetained navigationController];
    id v5 = (id)[v4 popViewControllerAnimated:1];
  }
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v9 = PKDisplayableErrorForCommonType();
      id v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      [WeakRetained presentViewController:v10 animated:1 completion:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*(void *)(a1 + 32)];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_3;
      v11[3] = &unk_1E59D65A8;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      id v14 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 40);
      id v8 = v7;
      id v13 = v8;
      [v8 preflightWithRequirements:45 completionRequirements:45 completion:v11];

      objc_destroyWeak(&v15);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      if (v5)
      {
        id v16 = v5;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v17 = v16;
      id v18 = PKAlertForDisplayableErrorWithHandlers(v16, 0, 0, 0);
      [WeakRetained presentViewController:v18 animated:1 completion:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F84AF0]);
      id v8 = [*(id *)(a1 + 32) paymentPass];
      id v9 = (void *)[v7 initWithPaymentPass:v8];

      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:4 provisioningController:*(void *)(a1 + 40) groupsController:0];
      id v11 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:4];
      [(PKPaymentSetupDismissibleNavigationController *)v11 setModalPresentationStyle:0];
      id v12 = [WeakRetained navigationController];
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      char v29 = 0;
      v30[0] = v9;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_4;
      v23[3] = &unk_1E59DF8F0;
      id v24 = v12;
      id v14 = v11;
      uint64_t v25 = v14;
      uint64_t v27 = v28;
      id v26 = *(id *)(a1 + 48);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_6;
      v19[3] = &unk_1E59DF918;
      id v22 = v28;
      id v15 = v24;
      id v20 = v15;
      id v21 = *(id *)(a1 + 48);
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:v14 context:v10 credentials:v13 parentNavController:v15 presentNavController:v23 completion:v19];

      _Block_object_dispose(v28, 8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_5;
  v5[3] = &unk_1E59CD8C8;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 presentViewController:v2 animated:1 completion:v5];
}

uint64_t __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_reportExpressModeEnable:(id)a3
{
}

- (void)_reportExpressModeEnableFailed:(id)a3
{
}

- (void)_reportExpressModeDisable:(id)a3
{
}

- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F87070];
  id v8 = (void *)MEMORY[0x1E4F843E0];
  id v9 = a3;
  [v8 beginSubjectReporting:v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 safelySetObject:v9 forKey:*MEMORY[0x1E4F86308]];

  [v10 setObject:*MEMORY[0x1E4F86768] forKey:*MEMORY[0x1E4F86730]];
  if (self->_detailViewStyle == 2) {
    id v11 = (void *)MEMORY[0x1E4F86B28];
  }
  else {
    id v11 = (void *)MEMORY[0x1E4F86B48];
  }
  [v10 setObject:*v11 forKey:*MEMORY[0x1E4F86B38]];
  id v12 = v10;
  id v35 = v6;
  if (!v35 || !v12) {
    goto LABEL_30;
  }
  uint64_t v13 = [v35 passType];
  id v14 = (id *)MEMORY[0x1E4F86D78];
  if ((unint64_t)(v13 + 1) >= 3) {
    id v15 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
  }
  else {
    id v15 = off_1E59DFB30[v13 + 1];
  }
  [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

  unint64_t v16 = [v35 style];
  if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0) {
    id v17 = off_1E59DFB48[v16];
  }
  else {
    id v17 = (__CFString *)*v14;
  }
  [v12 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

  id v18 = [v35 nfcPayload];
  PKAnalyticsReportSwitchToggleResultValue();
  id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

  id v20 = v35;
  if ([v20 passType] == 1)
  {
    id v21 = [v20 secureElementPass];
    unint64_t v22 = [v21 cardType];
    if (v22 <= 4) {
      id v19 = (__CFString *)**((id **)&unk_1E59DFBB0 + v22);
    }
  }
  else
  {
    id v19 = @"other";
  }

  [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
  id v23 = [v20 secureElementPass];
  if ([v23 isIdentityPass])
  {
    uint64_t v24 = [v23 identityType];
    if ((unint64_t)(v24 - 1) < 3)
    {
      uint64_t v25 = off_1E59DFBD8[v24 - 1];
      goto LABEL_25;
    }
  }
  else if ([v23 isAccessPass])
  {
    unint64_t v26 = [v23 accessType];
    if (v26 < 7)
    {
      uint64_t v25 = off_1E59DFBF0[v26];
      goto LABEL_25;
    }
  }
  uint64_t v25 = (__CFString *)*v14;
LABEL_25:

  [v12 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
  uint64_t v27 = [v20 secureElementPass];
  uint64_t v28 = [v27 devicePaymentApplications];
  [v28 count];

  char v29 = PKAnalyticsReportSwitchToggleResultValue();

  [v12 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
  id v30 = [v20 secureElementPass];
  id v31 = *v14;
  id v32 = [v30 organizationName];
  if ([v32 length])
  {
    unint64_t v33 = [v30 cardType];
    if (v33 <= 4 && ((1 << v33) & 0x16) != 0)
    {
      id v34 = v32;

      id v31 = v34;
    }
  }

  [v12 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
LABEL_30:

  [MEMORY[0x1E4F843E0] subject:v7 sendEvent:v12];
  [MEMORY[0x1E4F843E0] endSubjectReporting:v7];
}

- (void)appViewContentSizeChanged:(id)a3
{
  long long v4 = [(PKPaymentPassDetailViewController *)self tableView];
  [v4 beginUpdates];

  id v5 = [(PKPaymentPassDetailViewController *)self tableView];
  [v5 endUpdates];
}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  id v6 = [(PKPaymentPass *)pass uniqueID];
  int v7 = PKEqualObjects();

  if (v7) {
    [(PKPaymentPassDetailViewController *)self _didSelectDeleteCard];
  }
  return v7;
}

- (PKPassDeleteHandler)deleteOverrider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);

  return (PKPassDeleteHandler *)WeakRetained;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIColor)warningTextColor
{
  return self->_warningTextColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)loadingIdentityDetails
{
  return self->_loadingIdentityDetails;
}

- (void)setLoadingIdentityDetails:(BOOL)a3
{
  self->_loadingIdentityDetails = a3;
}

- (PKIdentityReplaceFingerprintHelper)fingeprintHelper
{
  return self->_fingeprintHelper;
}

- (void)setFingeprintHelper:(id)a3
{
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
}

- (NSArray)accountUserInvitations
{
  return self->_accountUserInvitations;
}

- (void)setAccountUserInvitations:(id)a3
{
}

- (BOOL)isRemovingAccountUser
{
  return self->_removingAccountUser;
}

- (void)setRemovingAccountUser:(BOOL)a3
{
  self->_removingAccountUser = a3;
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (void)setApplyController:(id)a3
{
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)setGroupsController:(id)a3
{
}

- (int64_t)detailViewStyle
{
  return self->_detailViewStyle;
}

- (void)setDetailViewStyle:(int64_t)a3
{
  self->_int64_t detailViewStyle = a3;
}

- (void)setContactResolver:(id)a3
{
}

- (void)setContactAvatarManager:(id)a3
{
}

- (PKPaymentDataProvider)paymentServiceDataProvider
{
  return self->_paymentServiceDataProvider;
}

- (void)setPaymentServiceDataProvider:(id)a3
{
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (void)setAccountService:(id)a3
{
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
}

- (PKBusinessChatController)businessChatController
{
  return self->_businessChatController;
}

- (void)setBusinessChatController:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FKBankConnectAccountsProvider)bankConnectAccountsProvider
{
  return self->_bankConnectAccountsProvider;
}

- (void)setBankConnectAccountsProvider:(id)a3
{
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (void)setBankConnectAccount:(id)a3
{
}

- (PKPassLibraryDataProvider)passLibraryDataProvider
{
  return self->_passLibraryDataProvider;
}

- (void)setPassLibraryDataProvider:(id)a3
{
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
}

- (NSArray)sortedFamilyMemberRowModels
{
  return self->_sortedFamilyMemberRowModels;
}

- (void)setSortedFamilyMemberRowModels:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (PKPayLaterFinancingPlansFetcher)financingPlansFetcher
{
  return self->_financingPlansFetcher;
}

- (void)setFinancingPlansFetcher:(id)a3
{
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void)setPaymentIntentController:(id)a3
{
}

- (int64_t)activeFinancingPlansCount
{
  return self->_activeFinancingPlansCount;
}

- (void)setActiveFinancingPlansCount:(int64_t)a3
{
  self->_activeFinancingPlansCount = a3;
}

- (int64_t)completedFinancingPlansCount
{
  return self->_completedFinancingPlansCount;
}

- (void)setCompletedFinancingPlansCount:(int64_t)a3
{
  self->_completedFinancingPlansCount = a3;
}

- (PKPayLaterSetupFlowController)payLaterSetupFlowController
{
  return self->_payLaterSetupFlowController;
}

- (void)setPayLaterSetupFlowController:(id)a3
{
}

- (PKPayLaterBusinessChatTopicComposer)payLaterTopicsComposer
{
  return self->_payLaterTopicsComposer;
}

- (void)setPayLaterTopicsComposer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterTopicsComposer, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlansFetcher, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_sortedFamilyMemberRowModels, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_accountUserInvitations, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_fingeprintHelper, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_warningTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_destroyWeak((id *)&self->_deleteOverrider);
  objc_storeStrong((id *)&self->_broadwayFeaturesAndBenefitsSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentIdentityManagementSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentRecurringPaymentSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAutoReloadSectionController, 0);
  objc_storeStrong((id *)&self->_appleBalanceAddMoneyUIManager, 0);
  objc_storeStrong((id *)&self->_merchantTokensResponse, 0);
  objc_storeStrong((id *)&self->_accountCredentialsSectionController, 0);
  objc_storeStrong((id *)&self->_bankConnectSectionController, 0);
  objc_storeStrong((id *)&self->_bioBindingSectionController, 0);
  objc_storeStrong((id *)&self->_precursorSectionController, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_actionGroupController, 0);
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_configurableSectionController, 0);
  objc_storeStrong((id *)&self->_paymentPassDetailSectionController, 0);
  objc_storeStrong((id *)&self->_autoReloadMerchantSectionController, 0);
  objc_storeStrong((id *)&self->_autoReloadActionSectionController, 0);
  objc_storeStrong((id *)&self->_passActionSectionController, 0);
  objc_storeStrong((id *)&self->_balanceSectionController, 0);
  objc_storeStrong((id *)&self->_scheduledPaymentsSectionController, 0);
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_startedAnalyticsSubjects, 0);
  objc_storeStrong((id *)&self->_peerPaymentAssociatedAccountsController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_executionBlocksContentIsLoaded, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_billingAddressHeaderView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_initialLoadGroup, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionControllerForAccountService, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_accountCardNumbersPresenter, 0);
  objc_storeStrong((id *)&self->_physicalCardActionController, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_peerPaymentActionViewController, 0);
  objc_storeStrong((id *)&self->_peerPaymentPreferencesHeaderView, 0);
  objc_storeStrong((id *)&self->_peerPaymentPreferences, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_passSnapshotView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_passHeaderView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contextualActionHandlers, 0);
  objc_storeStrong((id *)&self->_tabBarSegments, 0);
  objc_storeStrong((id *)&self->_displayableBalanceFields, 0);
  objc_storeStrong((id *)&self->_reminderForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_actionForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_commuterFields, 0);
  objc_storeStrong((id *)&self->_transitPropertiesBalanceReminder, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_contactlessPaymentApplications, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_transactionCountFormatter, 0);
  objc_storeStrong((id *)&self->_transactionYearFormatter, 0);
  objc_storeStrong((id *)&self->_transactionCountAndYear, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsAndGroupsProvider, 0);
  objc_storeStrong((id *)&self->_allowNotificationCell, 0);
  objc_storeStrong((id *)&self->_widgetCell, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_uwbExpressAccessSwitch, 0);
  objc_storeStrong((id *)&self->_nfcExpressAccessSwitch, 0);
  objc_storeStrong((id *)&self->_automaticPresentationSwitch, 0);
  objc_storeStrong((id *)&self->_notificationsSwitch, 0);
  objc_storeStrong((id *)&self->_dailyCashSwitch, 0);
  objc_storeStrong((id *)&self->_transactionsSwitch, 0);
  objc_storeStrong((id *)&self->_messagesSwitch, 0);
  objc_storeStrong((id *)&self->_refreshTimeout, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_associatedAccountPendingFooterView, 0);
  objc_storeStrong((id *)&self->_activationFooter, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_defaultPaymentApplication, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_transactionTimer, 0);
}

@end