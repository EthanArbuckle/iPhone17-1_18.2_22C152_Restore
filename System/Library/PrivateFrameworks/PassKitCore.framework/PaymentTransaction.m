@interface PaymentTransaction
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4;
+ (BOOL)hasPaymentTransactionInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5;
+ (BOOL)hasTransactionsMissingWorldRegionEligibleForProcessingInDatabase:(id)a3;
+ (BOOL)setNeedsSyncWithFinanceForAllTransactionsInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)anyInDatabase:(id)a3 withPaymentHash:(id)a4 withTransactionSource:(unint64_t)a5 withNotificationServiceData:(unint64_t)a6 transactionSourceIdentifiers:(id)a7;
+ (id)anyInDatabase:(id)a3 withReferenceIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 accountIdentifier:(id)a5 accountType:(int64_t)a6;
+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forTransactionSourceIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withTransactionSourceIdentifier:(id)a4;
+ (id)approvedPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)closestPendingTransactionInDatabase:(id)a3 fromTransactionDate:(id)a4 withNotificationServiceData:(unint64_t)a5 forMerchantName:(id)a6 forTransactionSourceIdentifiers:(id)a7;
+ (id)closestTransactionInDatabase:(id)a3 fromTransaction:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)insertPaymentTransaction:(id)a3 withTransactionSource:(id)a4 inDatabase:(id)a5;
+ (id)installmentPlanTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4;
+ (id)installmentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 installmentPlan:(id)a5 redeemed:(BOOL)a6 withRedemptionType:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9;
+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4;
+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4 transactionPaymentHashes:(id)a5;
+ (id)mostRecentActiveTransactionInDatabase:(id)a3;
+ (id)paymentTransactionsForTokenizedTransactionsWithRegionsInDatabase:(id)a3;
+ (id)paymentTransactionsInDatabase:(id)a3 forPredicate:(id)a4 limit:(int64_t)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 forRequest:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withRedemptionType:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsBrandIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifierWithoutRegion:(unint64_t)a4 limit:(unint64_t)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMerchant:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 limit:(int64_t)a9;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8;
+ (id)paymentTransactionsInDatabase:(id)a3 missingWorldRegionWithLimit:(unint64_t)a4 onlyEligibleForProcessing:(BOOL)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 originatedOnDevice:(BOOL)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 withFullPaymentHashes:(id)a4 transactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 withIdentifiers:(id)a4 regions:(id *)a5 tags:(id *)a6;
+ (id)paymentTransactionsInDatabase:(id)a3 withMerchantCategory:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 withPIDs:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 withServiceIdentifier:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionTypes:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7;
+ (id)paymentTransactionsRequiringReviewInDatabase:(id)a3 forAccountIdentifier:(id)a4;
+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 excludingPaymentMode:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7;
+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6;
+ (id)pendingPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)predicateForRequest:(id)a3;
+ (id)regionIdentifiersInDatabase:(id)a3 matchingName:(id)a4 types:(id)a5 localeIdentifier:(id)a6 withRequest:(id)a7 limit:(unint64_t)a8;
+ (id)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7;
+ (id)rewardsValuesForUnit:(unint64_t)a3 inDatabase:(id)a4;
+ (id)transactionReceiptUniqueIDsInDatabase:(id)a3;
+ (id)transactionServiceIdentifiersInDatabase:(id)a3 withTransactionType:(int64_t)a4 withPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10;
+ (id)transactionsForAdjustmentType:(int64_t)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)transactionsInDatabase:(id)a3 forInstallmentPlanIdentifier:(id)a4;
+ (id)transactionsRequiringMerchantCleanupInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withLastReprocessingDateBeforeDate:(id)a5 transactionDateWithinWindow:(double)a6;
+ (id)transactionsThatNeedSyncToFinanceWithAccountIdentifiers:(id)a3 withLimit:(int64_t)a4 inDatabase:(id)a5;
+ (id)truncateEntitiesForTransactionSourceIdentifiers:(id)a3 withNotificationServiceData:(unint64_t)a4 suppressedFromUI:(unint64_t)a5 inDatabase:(id)a6 toCount:(int64_t)a7;
+ (int64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8;
+ (unint64_t)countInDatabase:(id)a3 forRequest:(id)a4;
+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 forPeerPaymentSubtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8;
+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (unint64_t)numberOfPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withNotificationServiceData:(unint64_t)a5 newerThanDate:(id)a6;
+ (unint64_t)numberOfPaymentTransactionsInDatabaseWithAssociatedReceipt:(id)a3;
+ (unint64_t)suppressionBehaviorForTransactionSourceIdentifier:(id)a3 serviceIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)allPassTransactionIdentifiersInDatabase:(id)a3 batchHandler:(id)a4;
+ (void)allPassTransactionIdentifiersWithAccountIdentifiers:(id)a3 inDatabase:(id)a4 batchHandler:(id)a5;
+ (void)deleteEntitiesForTransactionSource:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesWithPIDs:(id)a3 inDatabase:(id)a4;
+ (void)deleteIssuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4;
+ (void)resetNeedsSyncWithFinanceForTransactionWithPID:(id)a3 updateSequenceNumber:(int64_t)a4 inDatabase:(id)a5;
+ (void)setNeedsSyncWithFinanceForTransactionsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)totalAmount:(id *)a3 forTransactionsWithRequest:(id)a4 count:(unint64_t *)a5 inDatabase:(id)a6;
+ (void)updateTransactionsWithTransactionSource:(id)a3 toTransactionSource:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)dbPaymentTransactionArchive;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentApplication;
- (id)paymentTransaction;
- (id)serviceIdentifier;
- (id)transactionAuthenticationResult;
- (id)transactionDate;
- (id)transactionSourceIdentifier;
- (int64_t)accountType;
- (int64_t)transactionType;
- (void)removeMapsDataForIssueReportIdentifier:(id)a3;
- (void)replaceWithPaymentTransaction:(id)a3;
- (void)updateRedemptionType:(unint64_t)a3;
- (void)updateRequiresMerchantReprocessing:(BOOL)a3;
- (void)updateSuppressBehavior:(unint64_t)a3;
- (void)updateWithMerchant:(id)a3;
- (void)updateWithPaymentTransaction:(id)a3;
- (void)updateWithPaymentTransactionSource:(id)a3;
@end

@implementation PaymentTransaction

+ (id)databaseTable
{
  return @"payment_transaction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"source_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"archive_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"maps_merchant_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"u";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v148 = v7;
  if (v7 == @"transaction_source.pid") {
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_10;
  }
  unsigned __int8 v8 = [@"transaction_source.pid" isEqualToString:v7];

  if (v8) {
    goto LABEL_8;
  }
  v9 = v148;
  if (v9 == @"transaction_source.identifier"
    || (v10 = v9,
        unsigned __int8 v11 = [@"transaction_source.identifier" isEqualToString:v9],
        v10,
        (v11 & 1) != 0)
    || (v12 = v10, v12 == @"transaction_source.type")
    || (v13 = v12,
        unsigned __int8 v14 = [@"transaction_source.type" isEqualToString:v12],
        v13,
        (v14 & 1) != 0))
  {
LABEL_8:
    CFStringRef v15 = @"JOIN transaction_source ON transaction_source.pid = payment_transaction.source_pid";
LABEL_9:
    [v6 addObject:v15];
    goto LABEL_10;
  }
  v16 = v13;
  if (v16 == @"payment_transaction_archive.pid"
    || (v17 = v16,
        unsigned __int8 v18 = [@"payment_transaction_archive.pid" isEqualToString:v16],
        v17,
        (v18 & 1) != 0))
  {
    CFStringRef v15 = @"JOIN payment_transaction_archive ON payment_transaction_archive.pid = payment_transaction.archive_pid";
    goto LABEL_9;
  }
  v19 = v17;
  if (v19 == @"maps_merchant.c") {
    goto LABEL_22;
  }
  v20 = v19;
  unsigned __int8 v21 = [@"maps_merchant.c" isEqualToString:v19];

  if (v21) {
    goto LABEL_22;
  }
  v22 = v20;
  if (v22 == @"maps_merchant.identifier"
    || (v23 = v22,
        unsigned __int8 v24 = [@"maps_merchant.identifier" isEqualToString:v22],
        v23,
        (v24 & 1) != 0)
    || (v25 = v23, v25 == @"maps_merchant.name")
    || (v26 = v25,
        unsigned __int8 v27 = [@"maps_merchant.name" isEqualToString:v25],
        v26,
        (v27 & 1) != 0))
  {
LABEL_22:
    CFStringRef v15 = @"LEFT JOIN maps_merchant on maps_merchant.pid = payment_transaction.maps_merchant_pid";
    goto LABEL_9;
  }
  v28 = v26;
  if (v28 == @"plantains.a") {
    goto LABEL_29;
  }
  v29 = v28;
  unsigned __int8 v30 = [@"plantains.a" isEqualToString:v28];

  if (v30) {
    goto LABEL_29;
  }
  v31 = v29;
  if (v31 == @"plantains.c"
    || (v32 = v31,
        unsigned __int8 v33 = [@"plantains.c" isEqualToString:v31],
        v32,
        (v33 & 1) != 0)
    || (v34 = v32, v34 == @"plantains.g")
    || (v35 = v34,
        unsigned __int8 v36 = [@"plantains.g" isEqualToString:v34],
        v35,
        (v36 & 1) != 0))
  {
LABEL_29:
    CFStringRef v15 = @"LEFT JOIN plantains on plantains.pid = payment_transaction.u";
    goto LABEL_9;
  }
  v37 = v35;
  if (v37 == @"mangos.d"
    || (v38 = v37,
        unsigned __int8 v39 = [@"mangos.d" isEqualToString:v37],
        v38,
        (v39 & 1) != 0)
    || (v40 = v38, v40 == @"mangos.c")
    || (v41 = v40,
        unsigned __int8 v42 = [@"mangos.c" isEqualToString:v40],
        v41,
        (v42 & 1) != 0))
  {
    CFStringRef v15 = @"LEFT JOIN mangos on mangos.a = payment_transaction.pid";
    goto LABEL_9;
  }
  v43 = v41;
  if (v43 == @"grapes.d"
    || (v44 = v43,
        unsigned __int8 v45 = [@"grapes.d" isEqualToString:v43],
        v44,
        (v45 & 1) != 0))
  {
    CFStringRef v46 = @"JOIN grapes on avocados.a = grapes.pid";
    CFStringRef v47 = @"JOIN avocados on cantaloupes.a = avocados.pid";
    CFStringRef v48 = @"JOIN cantaloupes on cantaloupes.b = payment_transaction.service_identifier";
LABEL_38:
    [v6 addObject:v48];
    [v6 addObject:v47];
    CFStringRef v15 = v46;
    goto LABEL_9;
  }
  v49 = v44;
  if (v49 == @"tomatoes.g"
    || (v50 = v49,
        unsigned __int8 v51 = [@"tomatoes.g" isEqualToString:v49],
        v50,
        (v51 & 1) != 0))
  {
    CFStringRef v15 = @"LEFT JOIN tomatoes on (tomatoes.pid = (SELECT MIN(tomatoes_.pid) FROM tomatoes tomatoes_ WHERE (tomatoes_.f = payment_transaction.service_identifier) LIMIT 1))";
    goto LABEL_9;
  }
  v52 = v50;
  if (v52 == @"gooseberry.c"
    || (v53 = v52,
        unsigned __int8 v54 = [@"gooseberry.c" isEqualToString:v52],
        v53,
        (v54 & 1) != 0))
  {
    CFStringRef v15 = @"LEFT JOIN gooseberry on gooseberry.transaction_source_pid = payment_transaction.source_pid";
    goto LABEL_9;
  }
  v55 = v53;
  if (v55 == @"world_region_mapping_left.world_region_pid") {
    goto LABEL_53;
  }
  v56 = v55;
  unsigned __int8 v57 = [@"world_region_mapping_left.world_region_pid" isEqualToString:v55];

  if (v57) {
    goto LABEL_53;
  }
  v58 = v56;
  if (v58 == @"world_region_mapping_left.match_try_count") {
    goto LABEL_53;
  }
  v59 = v58;
  unsigned __int8 v60 = [@"world_region_mapping_left.match_try_count" isEqualToString:v58];

  if (v60) {
    goto LABEL_53;
  }
  v61 = v59;
  if (v61 == @"world_region_mapping_left.last_modified_date"
    || (v62 = v61,
        unsigned __int8 v63 = [@"world_region_mapping_left.last_modified_date" isEqualToString:v61], v62, (v63 & 1) != 0)|| (v64 = v62, v64 == @"world_region_left.identifier")|| (v65 = v64, v66 = objc_msgSend(@"world_region_left.identifier", "isEqualToString:", v64), v65, (v66 & 1) != 0))
  {
LABEL_53:
    CFStringRef v15 = @"LEFT JOIN world_region_mapping AS world_region_mapping_left ON world_region_mapping_left.payment_transaction_pid = payment_transaction.pid LEFT JOIN world_region AS world_region_left ON world_region_left.pid = world_region_mapping_left.world_region_pid";
    goto LABEL_9;
  }
  v67 = v65;
  if (v67 == @"world_region_mapping.world_region_pid") {
    goto LABEL_66;
  }
  v68 = v67;
  unsigned __int8 v69 = [@"world_region_mapping.world_region_pid" isEqualToString:v67];

  if (v69) {
    goto LABEL_66;
  }
  v70 = v68;
  if (v70 == @"world_region.identifier") {
    goto LABEL_66;
  }
  v71 = v70;
  unsigned __int8 v72 = [@"world_region.identifier" isEqualToString:v70];

  if (v72) {
    goto LABEL_66;
  }
  v73 = v71;
  if (v73 == @"world_region.type") {
    goto LABEL_66;
  }
  v74 = v73;
  unsigned __int8 v75 = [@"world_region.type" isEqualToString:v73];

  if (v75) {
    goto LABEL_66;
  }
  v76 = v74;
  if (v76 == @"world_region_localized_content.name") {
    goto LABEL_66;
  }
  v77 = v76;
  unsigned __int8 v78 = [@"world_region_localized_content.name" isEqualToString:v76];

  if (v78) {
    goto LABEL_66;
  }
  v79 = v77;
  if (v79 == @"world_region_localized_content.locale_identifier"
    || (v80 = v79,
        unsigned __int8 v81 = [@"world_region_localized_content.locale_identifier" isEqualToString:v79], v80, (v81 & 1) != 0)|| (v82 = v80, v82 == @"world_region_localized_content.status")|| (v83 = v82, v84 = objc_msgSend(@"world_region_localized_content.status", "isEqualToString:", v82), v83, (v84 & 1) != 0))
  {
LABEL_66:
    CFStringRef v46 = @"JOIN world_region_localized_content ON world_region_localized_content.world_region_pid = world_region.pid";
    CFStringRef v47 = @"JOIN world_region AS world_region ON world_region.pid = world_region_mapping.world_region_pid";
    CFStringRef v48 = @"JOIN world_region_mapping ON world_region_mapping.payment_transaction_pid = payment_transaction.pid";
    goto LABEL_38;
  }
  v85 = v83;
  if (v85 == @"payment_transaction_tag.payment_transaction_pid") {
    goto LABEL_75;
  }
  v86 = v85;
  unsigned __int8 v87 = [@"payment_transaction_tag.payment_transaction_pid" isEqualToString:v85];

  if (v87) {
    goto LABEL_75;
  }
  v88 = v86;
  if (v88 == @"payment_transaction_tag.type") {
    goto LABEL_75;
  }
  v89 = v88;
  unsigned __int8 v90 = [@"payment_transaction_tag.type" isEqualToString:v88];

  if (v90) {
    goto LABEL_75;
  }
  v91 = v89;
  if (v91 == @"payment_transaction_tag.localized_title"
    || (v92 = v91,
        unsigned __int8 v93 = [@"payment_transaction_tag.localized_title" isEqualToString:v91],
        v92,
        (v93 & 1) != 0)
    || (v94 = v92, v94 == @"payment_transaction_tag.locale_identifier")
    || (v95 = v94,
        unsigned __int8 v96 = [@"payment_transaction_tag.locale_identifier" isEqualToString:v94],
        v95,
        (v96 & 1) != 0))
  {
LABEL_75:
    CFStringRef v15 = @"JOIN payment_transaction_tag on payment_transaction_tag.payment_transaction_pid = payment_transaction.pid";
    goto LABEL_9;
  }
  v97 = v95;
  if (v97 == @"apples.c") {
    goto LABEL_90;
  }
  v98 = v97;
  unsigned __int8 v99 = [@"apples.c" isEqualToString:v97];

  if (v99) {
    goto LABEL_90;
  }
  v100 = v98;
  if (v100 == @"apples.d") {
    goto LABEL_90;
  }
  v101 = v100;
  unsigned __int8 v102 = [@"apples.d" isEqualToString:v100];

  if (v102) {
    goto LABEL_90;
  }
  v103 = v101;
  if (v103 == @"apples.e") {
    goto LABEL_90;
  }
  v104 = v103;
  unsigned __int8 v105 = [@"apples.e" isEqualToString:v103];

  if (v105) {
    goto LABEL_90;
  }
  v106 = v104;
  if (v106 == @"apples.g") {
    goto LABEL_90;
  }
  v107 = v106;
  unsigned __int8 v108 = [@"apples.g" isEqualToString:v106];

  if (v108) {
    goto LABEL_90;
  }
  v109 = v107;
  if (v109 == @"apples.h") {
    goto LABEL_90;
  }
  v110 = v109;
  unsigned __int8 v111 = [@"apples.h" isEqualToString:v109];

  if (v111) {
    goto LABEL_90;
  }
  v112 = v110;
  if (v112 == @"apples.k"
    || (v113 = v112,
        unsigned __int8 v114 = [@"apples.k" isEqualToString:v112],
        v113,
        (v114 & 1) != 0)
    || (v115 = v113, v115 == @"apples.m")
    || (v116 = v115,
        unsigned __int8 v117 = [@"apples.m" isEqualToString:v115],
        v116,
        (v117 & 1) != 0))
  {
LABEL_90:
    CFStringRef v15 = @"JOIN apples on apples.b = payment_transaction.pid";
    goto LABEL_9;
  }
  v118 = v116;
  if (v118 == @"pears.a"
    || (v119 = v118,
        unsigned __int8 v120 = [@"pears.a" isEqualToString:v118],
        v119,
        (v120 & 1) != 0)
    || (v121 = v119, v121 == @"pears.pid")
    || (v122 = v121,
        unsigned __int8 v123 = [@"pears.pid" isEqualToString:v121],
        v122,
        (v123 & 1) != 0))
  {
    CFStringRef v15 = @"JOIN pears on pears.a = payment_transaction.account_identifier";
    goto LABEL_9;
  }
  v124 = v122;
  if (v124 == @"payment_transaction_authentication.pid") {
    goto LABEL_110;
  }
  v125 = v124;
  unsigned __int8 v126 = [@"payment_transaction_authentication.pid" isEqualToString:v124];

  if (v126) {
    goto LABEL_110;
  }
  v127 = v125;
  if (v127 == @"payment_transaction_authentication.complete") {
    goto LABEL_110;
  }
  v128 = v127;
  unsigned __int8 v129 = [@"payment_transaction_authentication.complete" isEqualToString:v127];

  if (v129) {
    goto LABEL_110;
  }
  v130 = v128;
  if (v130 == @"payment_transaction_authentication.processed_auth_mechanisms") {
    goto LABEL_110;
  }
  v131 = v130;
  unsigned __int8 v132 = [@"payment_transaction_authentication.processed_auth_mechanisms" isEqualToString:v130];

  if (v132) {
    goto LABEL_110;
  }
  v133 = v131;
  if (v133 == @"payment_transaction_authentication.data_collected_auth_mechanisms") {
    goto LABEL_110;
  }
  v134 = v133;
  unsigned __int8 v135 = [@"payment_transaction_authentication.data_collected_auth_mechanisms" isEqualToString:v133];

  if (v135) {
    goto LABEL_110;
  }
  v136 = v134;
  if (v136 == @"payment_transaction_authentication.auth_data_payment_pin") {
    goto LABEL_110;
  }
  v137 = v136;
  unsigned __int8 v138 = [@"payment_transaction_authentication.auth_data_payment_pin" isEqualToString:v136];

  if (v138) {
    goto LABEL_110;
  }
  v139 = v137;
  if (v139 == @"payment_transaction_authentication.auth_data_user_confirmation"
    || (v140 = v139,
        unsigned __int8 v141 = [@"payment_transaction_authentication.auth_data_user_confirmation" isEqualToString:v139], v140, (v141 & 1) != 0)|| (v142 = v140, v142 == @"payment_transaction_authentication.auth_data_transaction_signature")|| (v143 = v142, v144 = objc_msgSend(@"payment_transaction_authentication.auth_data_transaction_signature", "isEqualToString:", v142), v143, (v144 & 1) != 0))
  {
LABEL_110:
    CFStringRef v15 = @"LEFT JOIN payment_transaction_authentication on payment_transaction_authentication.payment_transaction_pid = payment_transaction.pid";
    goto LABEL_9;
  }
  v145 = v143;
  if (v145 == @"zucchini.m"
    || (v146 = v145,
        unsigned __int8 v147 = [@"zucchini.m" isEqualToString:v145],
        v146,
        (v147 & 1) != 0))
  {
    CFStringRef v15 = @"JOIN zucchini on zucchini.e == payment_transaction.service_identifier";
    goto LABEL_9;
  }
LABEL_10:
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"count"
    || v4
    && ((unsigned __int8 v6 = [(__CFString *)v4 isEqualToString:@"count"],
         v5,
         (v6 & 1) != 0)
     || (v7 = v5, v7 == @"COUNT(*) as count")
     || (unsigned __int8 v8 = v7,
         unsigned int v9 = [(__CFString *)v7 isEqualToString:@"COUNT(*) as count"],
         v8,
         v9)))
  {
    v10 = v5;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___PaymentTransaction;
    objc_msgSendSuper2(&v13, "disambiguatedSQLForProperty:", v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unsigned __int8 v11 = v10;

  return v11;
}

+ (id)insertPaymentTransaction:(id)a3 withTransactionSource:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = sub_1004A2C18([PaymentTransaction alloc], v9, v8, v7);

  return v10;
}

+ (id)truncateEntitiesForTransactionSourceIdentifiers:(id)a3 withNotificationServiceData:(unint64_t)a4 suppressedFromUI:(unint64_t)a5 inDatabase:(id)a6 toCount:(int64_t)a7
{
  id v12 = a6;
  objc_super v13 = sub_1004A5C4C((uint64_t)a1, a3);
  unsigned __int8 v14 = sub_1004A5DD8((uint64_t)a1, a4);
  switch(a5)
  {
    case 2uLL:
      id v16 = a1;
      int v17 = 0;
LABEL_7:
      uint64_t v15 = sub_1004A5E78((uint64_t)v16, v17);
      goto LABEL_8;
    case 1uLL:
      id v16 = a1;
      int v17 = 1;
      goto LABEL_7;
    case 0uLL:
      uint64_t v15 = +[SQLiteBooleanPredicate truePredicate];
LABEL_8:
      unsigned __int8 v18 = (void *)v15;
      goto LABEL_10;
  }
  unsigned __int8 v18 = 0;
LABEL_10:
  v34[0] = v13;
  v34[1] = v14;
  v34[2] = v18;
  v19 = +[NSArray arrayWithObjects:v34 count:3];
  v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

  CFStringRef v33 = @"transaction_date";
  unsigned __int8 v21 = +[NSArray arrayWithObjects:&v33 count:1];
  CFStringRef v32 = @"DESC";
  v22 = +[NSArray arrayWithObjects:&v32 count:1];
  v23 = [a1 queryWithDatabase:v12 predicate:v20 orderingProperties:v21 orderingDirections:v22];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1004A5FC4;
  v28[3] = &unk_1007396C8;
  id v30 = objc_alloc_init((Class)NSMutableSet);
  int64_t v31 = a7;
  id v29 = v12;
  id v24 = v30;
  id v25 = v12;
  [v23 enumeratePersistentIDsUsingBlock:v28];
  id v26 = [v24 copy];

  return v26;
}

+ (void)deleteEntitiesForTransactionSource:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  sub_1004A6128((uint64_t)a1, (uint64_t)[a3 persistentID]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesWithPIDs:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v4 = [(SQLiteEntity *)self database];
  +[PaymentTransactionFee deleteEntitiesForPaymentTransaction:self inDatabase:v4];

  id v5 = [(SQLiteEntity *)self database];
  +[PaymentTransactionReward deleteEntitiesForPaymentTransaction:self inDatabase:v5];

  id v6 = [(SQLiteEntity *)self database];
  +[PaymentTransactionQuestion deleteEntitiesForPaymentTransaction:self inDatabase:v6];

  int64_t v7 = [(SQLiteEntity *)self persistentID];
  id v8 = [(SQLiteEntity *)self database];
  +[PaymentTransactionAmount deleteEntitiesForPaymentTransactionPID:v7 inDatabase:v8];

  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = [(SQLiteEntity *)self database];
  +[TransactionCommutePlanUnit deleteEntitiesForPaymentTransactionPID:v9 inDatabase:v10];

  int64_t v11 = [(SQLiteEntity *)self persistentID];
  id v12 = [(SQLiteEntity *)self database];
  +[PaymentTransactionTag deleteEntitiesForPaymentTransactionPID:v11 inDatabase:v12];

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = sub_100020E68;
  v71 = sub_100021228;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_100020E68;
  v65 = sub_100021228;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_100020E68;
  v59 = sub_100021228;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_100020E68;
  v53 = sub_100021228;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  CFStringRef v46 = sub_100020E68;
  CFStringRef v47 = sub_100021228;
  id v48 = 0;
  v74[0] = @"archive_pid";
  v74[1] = @"identifier";
  v74[2] = @"account_identifier";
  v74[3] = @"maps_merchant_pid";
  v74[4] = @"u";
  objc_super v13 = +[NSArray arrayWithObjects:v74 count:5];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1004A69DC;
  v42[3] = &unk_100754F00;
  v42[4] = &v67;
  v42[5] = &v61;
  v42[6] = &v55;
  v42[7] = &v49;
  v42[8] = &v43;
  [(SQLiteEntity *)self getValuesForProperties:v13 withApplier:v42];
  id v14 = [(id)v68[5] longValue];
  uint64_t v15 = [(SQLiteEntity *)self database];
  +[PaymentTransactionArchive deleteArchiveForPID:v14 inDatabase:v15];

  if (v62[5] && v56[5])
  {
    id v16 = objc_alloc_init((Class)PKPaymentTransactionToDeleteFromFinance);
    [v16 setTransactionIdentifier:v62[5]];
    [v16 setAccountIdentifier:v56[5]];
    int v17 = [(SQLiteEntity *)self database];
    +[PaymentTransactionToDeleteFromFinance insertPaymentTransactionToDeleteFromFinance:v16 inDatabase:v17];
  }
  int64_t v18 = [(SQLiteEntity *)self persistentID];
  v19 = [(SQLiteEntity *)self database];
  +[TransactionReleasedData deleteEntitiesForPaymentTransactionPID:v18 inDatabase:v19];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v20 = sub_1004A6A70(self);
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v73 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v39;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v23);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1004A6ADC;
        v37[3] = &unk_100749F60;
        v37[4] = self;
        [v24 enumerateKeysAndObjectsUsingBlock:v37];
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v20 countByEnumeratingWithState:&v38 objects:v73 count:16];
    }
    while (v21);
  }

  if (v50[5])
  {
    id v25 = [(SQLiteEntity *)self database];
    id v26 = sub_1004A6B68((uint64_t)PaymentTransaction, (void *)v50[5]);
    unsigned __int8 v27 = +[SQLiteEntity queryWithDatabase:v25 predicate:v26 orderingProperties:0 orderingDirections:0 limit:2];

    if ((uint64_t)[v27 countOfEntities] <= 1)
    {
      v28 = [(SQLiteEntity *)self database];
      id v29 = +[MapsMerchant anyInDatabase:v28 withPID:v50[5]];

      [v29 deleteFromDatabase];
    }
  }
  if (v44[5])
  {
    id v30 = [(SQLiteEntity *)self database];
    int64_t v31 = sub_1004A6BD0((uint64_t)PaymentTransaction, (void *)v44[5]);
    CFStringRef v32 = +[SQLiteEntity queryWithDatabase:v30 predicate:v31 orderingProperties:0 orderingDirections:0 limit:2];

    if ((uint64_t)[v32 countOfEntities] <= 1)
    {
      CFStringRef v33 = [(SQLiteEntity *)self database];
      v34 = +[MapsBrand anyInDatabase:v33 withPID:v44[5]];

      [v34 deleteFromDatabase];
    }
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  v36.receiver = self;
  v36.super_class = (Class)PaymentTransaction;
  return [(SQLiteEntity *)&v36 deleteFromDatabase];
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  int64_t v7 = sub_1004A6CB4((uint64_t)a1, a4);
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = sub_1004A6D98((uint64_t)a1, a4);
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 accountIdentifier:(id)a5 accountType:(int64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = sub_1004A6F64((uint64_t)a1, a5);
  objc_super v13 = sub_1004A6FCC((uint64_t)a1, a6);
  id v14 = sub_1004A7044((uint64_t)a1, v10);

  v19[0] = v12;
  v19[1] = v13;
  v19[2] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v19 count:3];
  id v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  int v17 = [a1 anyInDatabase:v11 predicate:v16];

  return v17;
}

+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forTransactionSourceIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = sub_1004A6D98((uint64_t)a1, a5);
  id v11 = sub_1004A7044((uint64_t)a1, v8);

  v16[0] = v10;
  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];
  objc_super v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = sub_1004A7254((uint64_t)a1, a4);
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withReferenceIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = sub_1004A7338((uint64_t)a1, a4);
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:1];

  LOBYTE(v5) = (uint64_t)[v6 countOfEntities] > 0;
  return (char)v5;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMerchantIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMerchantIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  id v17 = objc_alloc((Class)NSMutableArray);
  int64_t v18 = sub_1004A76C0((uint64_t)a1, v16);

  CFStringRef v32 = v18;
  v19 = +[NSArray arrayWithObjects:&v32 count:1];
  id v20 = [v17 initWithArray:v19];

  if ([v13 count])
  {
    id v21 = sub_1004A5C4C((uint64_t)a1, v13);
    [v20 addObject:v21];
  }
  if (v14)
  {
    uint64_t v22 = sub_1004A7728((uint64_t)a1, (void *)v14);
    [v20 addObject:v22];
  }
  if (v15)
  {
    v23 = sub_1004A77C8((uint64_t)a1, (void *)v15);
    [v20 addObject:v23];
  }
  id v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  if (v14 | v15)
  {
    CFStringRef v31 = @"transaction_date";
    id v25 = +[NSArray arrayWithObjects:&v31 count:1];
    CFStringRef v30 = @"DESC";
    id v26 = +[NSArray arrayWithObjects:&v30 count:1];
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:v25 orderingDirections:v26 limit:1];
  }
  else
  {
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:0 orderingDirections:0 limit:1];
  }
  BOOL v28 = (uint64_t)[v27 countOfEntities] > 0;

  return v28;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  id v17 = objc_alloc((Class)NSMutableArray);
  int64_t v18 = sub_1004A7AFC((uint64_t)a1, v16);

  CFStringRef v32 = v18;
  v19 = +[NSArray arrayWithObjects:&v32 count:1];
  id v20 = [v17 initWithArray:v19];

  if ([v13 count])
  {
    id v21 = sub_1004A5C4C((uint64_t)a1, v13);
    [v20 addObject:v21];
  }
  if (v14)
  {
    uint64_t v22 = sub_1004A7728((uint64_t)a1, (void *)v14);
    [v20 addObject:v22];
  }
  if (v15)
  {
    v23 = sub_1004A77C8((uint64_t)a1, (void *)v15);
    [v20 addObject:v23];
  }
  id v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  if (v14 | v15)
  {
    CFStringRef v31 = @"transaction_date";
    id v25 = +[NSArray arrayWithObjects:&v31 count:1];
    CFStringRef v30 = @"DESC";
    id v26 = +[NSArray arrayWithObjects:&v30 count:1];
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:v25 orderingDirections:v26 limit:1];
  }
  else
  {
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:0 orderingDirections:0 limit:1];
  }
  BOOL v28 = (uint64_t)[v27 countOfEntities] > 0;

  return v28;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsBrandIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsBrandIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  id v17 = objc_alloc((Class)NSMutableArray);
  int64_t v18 = sub_1004A7DF8((uint64_t)a1, v16);

  CFStringRef v32 = v18;
  v19 = +[NSArray arrayWithObjects:&v32 count:1];
  id v20 = [v17 initWithArray:v19];

  if ([v13 count])
  {
    id v21 = sub_1004A5C4C((uint64_t)a1, v13);
    [v20 addObject:v21];
  }
  if (v14)
  {
    uint64_t v22 = sub_1004A7728((uint64_t)a1, (void *)v14);
    [v20 addObject:v22];
  }
  if (v15)
  {
    v23 = sub_1004A77C8((uint64_t)a1, (void *)v15);
    [v20 addObject:v23];
  }
  id v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  if (v14 | v15)
  {
    CFStringRef v31 = @"transaction_date";
    id v25 = +[NSArray arrayWithObjects:&v31 count:1];
    CFStringRef v30 = @"DESC";
    id v26 = +[NSArray arrayWithObjects:&v30 count:1];
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:v25 orderingDirections:v26 limit:1];
  }
  else
  {
    unsigned __int8 v27 = [a1 queryWithDatabase:v12 predicate:v24 orderingProperties:0 orderingDirections:0 limit:1];
  }
  BOOL v28 = (uint64_t)[v27 countOfEntities] > 0;

  return v28;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = sub_1004A7EEC((uint64_t)a1, a4);
  id v8 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:0 orderingDirections:0 limit:1];

  LOBYTE(v7) = (uint64_t)[v8 countOfEntities] > 0;
  return (char)v7;
}

+ (id)mostRecentActiveTransactionInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_status" notEqualToValue:&off_10078BA78];
  id v6 = sub_1004A81E0((uint64_t)a1, 1);
  v26[0] = v5;
  v26[1] = v6;
  int64_t v7 = +[NSArray arrayWithObjects:v26 count:2];
  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  CFStringRef v25 = @"transaction_date";
  id v9 = +[NSArray arrayWithObjects:&v25 count:1];
  CFStringRef v24 = @"DESC";
  id v10 = +[NSArray arrayWithObjects:&v24 count:1];
  id v11 = +[SQLiteEntity queryWithDatabase:v4 predicate:v8 orderingProperties:v9 orderingDirections:v10 limit:1];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100020E68;
  uint64_t v22 = sub_100021228;
  id v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004A83C8;
  v15[3] = &unk_10074FD70;
  id v17 = &v18;
  id v12 = v4;
  id v16 = v12;
  [v11 enumeratePersistentIDsUsingBlock:v15];
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

+ (id)anyInDatabase:(id)a3 withPaymentHash:(id)a4 withTransactionSource:(unint64_t)a5 withNotificationServiceData:(unint64_t)a6 transactionSourceIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if ([v13 length])
  {
    unint64_t v15 = sub_1004A5C4C((uint64_t)a1, v14);
    v23[0] = v15;
    id v16 = sub_1004A85D4((uint64_t)a1, a5, 1);
    v23[1] = v16;
    id v17 = sub_1004A5DD8((uint64_t)a1, a6);
    v23[2] = v17;
    uint64_t v18 = sub_1004A8770((uint64_t)a1, v13);
    v23[3] = v18;
    v19 = +[NSArray arrayWithObjects:v23 count:4];

    uint64_t v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];
    id v21 = [a1 anyInDatabase:v12 predicate:v20];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (void)deleteIssuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = sub_1004A5C4C((uint64_t)a1, v7);
    v13[0] = v8;
    id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"iit" equalToValue:&__kCFBooleanTrue];
    v13[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v13 count:2];

    id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
    id v12 = [a1 queryWithDatabase:v6 predicate:v11];
    [v12 deleteAllEntities];
  }
}

+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = sub_1004A5C4C((uint64_t)a1, v7);
    v15[0] = v8;
    id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"iit" equalToValue:&__kCFBooleanTrue];
    v15[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v15 count:2];

    id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
    id v12 = [a1 queryWithDatabase:v6 predicate:v11];
    id v13 = sub_1004A8C0C((uint64_t)a1, v12);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4 transactionPaymentHashes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"iit" equalToValue:&__kCFBooleanTrue];
    id v12 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_hash", v10, v11 values];
    v19[1] = v12;
    id v13 = sub_1004A5C4C((uint64_t)a1, v9);
    v19[2] = v13;
    id v14 = +[NSArray arrayWithObjects:v19 count:3];

    unint64_t v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
    id v16 = [a1 queryWithDatabase:v8 predicate:v15];
    id v17 = sub_1004A8C0C((uint64_t)a1, v16);
  }
  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withIdentifiers:(id)a4 regions:(id *)a5 tags:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = sub_1004A7254((uint64_t)a1, *(void **)(*((void *)&v23 + 1) + 8 * i));
        objc_msgSend(v12, "addObject:", v18, (void)v23);
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  v19 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v12];
  uint64_t v20 = [a1 queryWithDatabase:v10 predicate:v19];

  id v21 = sub_1004A8FD8((uint64_t)a1, v20, a5, a6);

  return v21;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withFullPaymentHashes:(id)a4 transactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    id v11 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_hash" values:v9];
    v18[0] = v11;
    id v12 = sub_1004A5C4C((uint64_t)a1, v10);
    v18[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v18 count:2];
    id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

    id v15 = [a1 queryWithDatabase:v8 predicate:v14];
    uint64_t v16 = sub_1004A8C0C((uint64_t)a1, v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)closestTransactionInDatabase:(id)a3 fromTransaction:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = sub_1004A5DD8((uint64_t)a1, 2);
  [v11 addObject:v12];

  id v13 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"service_identifier"];
  [v11 addObject:v13];

  id v14 = sub_1004A5C4C((uint64_t)a1, v10);
  [v11 addObject:v14];

  id v66 = v9;
  uint64_t v67 = [v9 transactionDate];
  id v15 = sub_1004A99B0(600.0, (uint64_t)a1, v67);
  [v11 addObject:v15];

  v64 = v11;
  uint64_t v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  [a1 queryWithDatabase:v8 predicate:v16];
  uint64_t v63 = v61 = a1;
  id v17 = sub_1004A8C0C((uint64_t)a1, v63);
  uint64_t v18 = +[NSSet setWithArray:v17];

  v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v77 = COERCE_DOUBLE([v18 count]);
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found %lu close transactions", buf, 0xCu);
  }

  if ([v18 count])
  {
    oslog = v19;
    uint64_t v20 = [v66 amount];
    id v59 = v10;
    v56 = v20;
    if (v20)
    {
      +[NSDecimalNumber notANumber];
      v22 = id v21 = v18;
      LODWORD(v20) = [v20 compare:v22] != 0;

      uint64_t v18 = v21;
    }
    v58 = v16;
    id v60 = v8;
    id v65 = objc_alloc_init((Class)NSMutableSet);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v57 = v18;
    id v23 = v18;
    id v24 = [v23 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v24)
    {
      id v25 = v24;
      long long v26 = 0;
      uint64_t v27 = *(void *)v73;
      double v28 = 0.0;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v73 != v27) {
            objc_enumerationMutation(v23);
          }
          CFStringRef v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          if (v20)
          {
            CFStringRef v31 = [*(id *)(*((void *)&v72 + 1) + 8 * i) amount];
            CFStringRef v32 = [v66 amount];
            int v33 = PKEqualObjects();

            if (v33) {
              [v65 addObject:v30];
            }
          }
          v34 = objc_msgSend(v30, "transactionDate", v56);
          [v67 timeIntervalSinceDate:v34];
          double v36 = fabs(v35);

          if (!v26 || v36 < v28)
          {
            id v37 = v30;

            double v28 = v36;
            long long v26 = v37;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v25);
    }
    else
    {
      long long v26 = 0;
      double v28 = 0.0;
    }

    long long v39 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = [v65 count];
      *(_DWORD *)buf = 134217984;
      double v77 = *(double *)&v40;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Transactions matching on amount: %lu", buf, 0xCu);
    }

    id v10 = v59;
    id v8 = v60;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v77 = v28;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Shortest interval for matched transaction %.2f", buf, 0xCu);
    }

    if ([v65 containsObject:v26])
    {
      id v41 = v26;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Picked transaction with matching amount and shortest interval", buf, 2u);
      }
      CFStringRef v42 = @"YES";
    }
    else if ([v65 count])
    {

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v43 = v65;
      id v44 = [v43 countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (v44)
      {
        id v45 = v44;
        CFStringRef v46 = 0;
        uint64_t v47 = *(void *)v69;
        double v28 = 0.0;
        do
        {
          for (j = 0; j != v45; j = (char *)j + 1)
          {
            if (*(void *)v69 != v47) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
            v50 = objc_msgSend(v49, "transactionDate", v56);
            [v67 timeIntervalSinceDate:v50];
            double v52 = fabs(v51);

            if (!v46 || v52 < v28)
            {
              id v53 = v49;

              double v28 = v52;
              CFStringRef v46 = v53;
            }
          }
          id v45 = [v43 countByEnumeratingWithState:&v68 objects:v80 count:16];
        }
        while (v45);
      }
      else
      {
        CFStringRef v46 = 0;
        double v28 = 0.0;
      }

      id v41 = v46;
      long long v39 = oslog;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Picked closest transaction with matching amount", buf, 2u);
      }
      CFStringRef v42 = @"YES";
      id v10 = v59;
    }
    else
    {
      id v41 = v26;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Picked transaction with shortest interval", buf, 2u);
      }
      CFStringRef v42 = @"NO";
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v77 = v28;
      __int16 v78 = 2114;
      CFStringRef v79 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Matched transaction time interval %.2f, same amount %{public}@", buf, 0x16u);
    }

    if (v41)
    {
      id v54 = [v41 identifier];
      long long v38 = [v61 anyInDatabase:v60 withIdentifier:v54];
    }
    else
    {
      long long v38 = 0;
    }
    uint64_t v16 = v58;

    uint64_t v18 = v57;
  }
  else
  {
    long long v38 = 0;
  }

  return v38;
}

+ (id)closestPendingTransactionInDatabase:(id)a3 fromTransactionDate:(id)a4 withNotificationServiceData:(unint64_t)a5 forMerchantName:(id)a6 forTransactionSourceIdentifiers:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = sub_1004A5DD8((uint64_t)a1, a5);
  v22[0] = v16;
  id v17 = sub_1004A9C78((uint64_t)a1, 0);
  v22[1] = v17;
  uint64_t v18 = sub_1004A9CF0((uint64_t)a1, v13);

  v22[2] = v18;
  v19 = +[NSArray arrayWithObjects:v22 count:3];

  uint64_t v20 = sub_1004A9D58(7200.0, (uint64_t)a1, v15, v14, v12, v19);

  return v20;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withServiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1004A7044((uint64_t)a1, a4);
  id v8 = +[SQLiteEntity queryWithDatabase:v6 predicate:v7];

  id v9 = sub_1004A8C0C((uint64_t)a1, v8);
  id v10 = +[NSSet setWithArray:v9];

  return v10;
}

+ (id)transactionsForAdjustmentType:(int64_t)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = sub_1004AA1AC((uint64_t)a1, a3);
  id v10 = +[SQLiteEntity queryWithDatabase:v8 predicate:v9 orderingProperties:0 orderingDirections:0 limit:a4];

  id v11 = sub_1004A8C0C((uint64_t)a1, v10);

  return v11;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withPIDs:(id)a4
{
  id v6 = a3;
  id v7 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a4];
  CFStringRef v14 = @"transaction_date";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = +[SQLiteEntity queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = sub_1004A8C0C((uint64_t)a1, v10);

  return v11;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a3;
  id v17 = sub_1004AA224((uint64_t)a1, a4, a5, a6, a7, a8);
  CFStringRef v26 = @"transaction_date";
  uint64_t v18 = +[NSArray arrayWithObjects:&v26 count:1];
  v19 = SQLiteOrderAscending;
  if (a9 != -1) {
    v19 = &SQLiteOrderDescending;
  }
  id v25 = *v19;
  uint64_t v20 = +[NSArray arrayWithObjects:&v25 count:1];
  id v21 = +[SQLiteEntity queryWithDatabase:v16 predicate:v17 orderingProperties:v18 orderingDirections:v20 limit:a10];

  uint64_t v22 = sub_1004A8C0C((uint64_t)a1, v21);
  id v23 = +[NSSet setWithArray:v22];

  return v23;
}

+ (id)approvedPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v34 = a3;
  uint64_t v18 = sub_1004A5C4C((uint64_t)a1, a4);
  v37[0] = v18;
  v19 = sub_1004A85D4((uint64_t)a1, a5, 0);
  v37[1] = v19;
  uint64_t v20 = sub_1004A81E0((uint64_t)a1, a6);
  v37[2] = v20;
  id v21 = sub_1004A9C78((uint64_t)a1, 1);
  v37[3] = v21;
  uint64_t v22 = sub_1004AA920((uint64_t)a1, v17);

  v37[4] = v22;
  id v23 = sub_1004AA9C0((uint64_t)a1, v16);

  void v37[5] = v23;
  id v24 = sub_1004A5E78((uint64_t)a1, 0);
  v37[6] = v24;
  id v25 = +[NSArray arrayWithObjects:v37 count:7];

  CFStringRef v26 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v25];
  CFStringRef v36 = @"transaction_date";
  uint64_t v27 = +[NSArray arrayWithObjects:&v36 count:1];
  double v28 = SQLiteOrderAscending;
  if (a9 != -1) {
    double v28 = &SQLiteOrderDescending;
  }
  double v35 = *v28;
  id v29 = +[NSArray arrayWithObjects:&v35 count:1];
  CFStringRef v30 = +[SQLiteEntity queryWithDatabase:v34 predicate:v26 orderingProperties:v27 orderingDirections:v29 limit:a10];

  CFStringRef v31 = sub_1004A8C0C((uint64_t)a1, v30);
  CFStringRef v32 = +[NSSet setWithArray:v31];

  return v32;
}

+ (id)pendingPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v37 = a3;
  v19 = sub_1004A9C78((uint64_t)a1, 0);
  v42[0] = v19;
  uint64_t v20 = sub_1004A9C78((uint64_t)a1, 8);
  v42[1] = v20;
  id v21 = +[NSArray arrayWithObjects:v42 count:2];
  uint64_t v22 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v21];

  id v23 = sub_1004A5C4C((uint64_t)a1, v18);

  v41[0] = v23;
  id v24 = sub_1004A85D4((uint64_t)a1, a5, 0);
  v41[1] = v24;
  id v25 = sub_1004A81E0((uint64_t)a1, a6);
  v41[2] = v25;
  CFStringRef v26 = sub_1004A7728((uint64_t)a1, v17);

  v41[3] = v26;
  uint64_t v27 = sub_1004A77C8((uint64_t)a1, v16);

  v41[4] = v27;
  v41[5] = v22;
  double v28 = +[NSArray arrayWithObjects:v41 count:6];

  id v29 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v28];
  CFStringRef v40 = @"transaction_date";
  CFStringRef v30 = +[NSArray arrayWithObjects:&v40 count:1];
  CFStringRef v31 = SQLiteOrderAscending;
  if (a9 != -1) {
    CFStringRef v31 = &SQLiteOrderDescending;
  }
  long long v39 = *v31;
  CFStringRef v32 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1, v37);
  int v33 = +[SQLiteEntity queryWithDatabase:v38 predicate:v29 orderingProperties:v30 orderingDirections:v32 limit:a10];

  id v34 = sub_1004A8C0C((uint64_t)a1, v33);
  double v35 = +[NSSet setWithArray:v34];

  return v35;
}

+ (int64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a3;
  id v15 = sub_1004AA224((uint64_t)a1, a4, a5, a6, a7, a8);
  id v16 = [a1 countInDatabase:v14 predicate:v15];

  return (int64_t)v16;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = sub_1004AAF58((uint64_t)a1, a4, a5);
  CFStringRef v19 = @"transaction_date";
  id v12 = +[NSArray arrayWithObjects:&v19 count:1];
  CFStringRef v18 = @"DESC";
  CFStringRef v13 = +[NSArray arrayWithObjects:&v18 count:1];
  id v14 = +[SQLiteEntity queryWithDatabase:v10 predicate:v11 orderingProperties:v12 orderingDirections:v13 limit:a6];

  id v15 = sub_1004A8C0C((uint64_t)a1, v14);
  id v16 = +[NSSet setWithArray:v15];

  return v16;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionTypes:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7
{
  id v12 = a3;
  CFStringRef v13 = sub_1004AB210((uint64_t)a1, a4);
  v25[0] = v13;
  id v14 = sub_1004AAF58((uint64_t)a1, a5, a6);
  v25[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v25 count:2];

  id v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];
  id v17 = objc_opt_class();
  CFStringRef v24 = @"transaction_date";
  CFStringRef v18 = +[NSArray arrayWithObjects:&v24 count:1];
  CFStringRef v23 = @"DESC";
  CFStringRef v19 = +[NSArray arrayWithObjects:&v23 count:1];
  uint64_t v20 = [v17 queryWithDatabase:v12 predicate:v16 orderingProperties:v18 orderingDirections:v19 limit:a7];

  id v21 = sub_1004A8C0C((uint64_t)a1, v20);

  return v21;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8
{
  id v14 = a5;
  id v15 = a3;
  id v16 = sub_1004AB620((uint64_t)a1, a4);
  v32[0] = v16;
  id v17 = sub_1004A85D4((uint64_t)a1, a6, 0);
  v32[1] = v17;
  CFStringRef v18 = sub_1004A81E0((uint64_t)a1, a7);
  v32[2] = v18;
  CFStringRef v19 = sub_1004A5E78((uint64_t)a1, 0);
  v32[3] = v19;
  uint64_t v20 = +[NSArray arrayWithObjects:v32 count:4];

  if ([v14 count])
  {
    id v21 = sub_1004A5C4C((uint64_t)a1, v14);
    uint64_t v22 = [v20 arrayByAddingObject:v21];

    uint64_t v20 = (void *)v22;
  }
  CFStringRef v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  CFStringRef v31 = @"transaction_date";
  CFStringRef v24 = +[NSArray arrayWithObjects:&v31 count:1];
  CFStringRef v30 = @"DESC";
  id v25 = +[NSArray arrayWithObjects:&v30 count:1];
  CFStringRef v26 = +[SQLiteEntity queryWithDatabase:v15 predicate:v23 orderingProperties:v24 orderingDirections:v25 limit:a8];

  uint64_t v27 = sub_1004A8C0C((uint64_t)a1, v26);
  double v28 = +[NSSet setWithArray:v27];

  return v28;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 limit:(int64_t)a9
{
  id v15 = a6;
  id v16 = a3;
  id v17 = sub_1004AB620((uint64_t)a1, a4);
  v34[0] = v17;
  CFStringRef v18 = sub_1004ABA28((uint64_t)a1, a5);
  v34[1] = v18;
  CFStringRef v19 = sub_1004A85D4((uint64_t)a1, a7, 0);
  v34[2] = v19;
  uint64_t v20 = sub_1004A81E0((uint64_t)a1, a8);
  void v34[3] = v20;
  id v21 = sub_1004A5E78((uint64_t)a1, 0);
  v34[4] = v21;
  uint64_t v22 = +[NSArray arrayWithObjects:v34 count:5];

  if ([v15 count])
  {
    CFStringRef v23 = sub_1004A5C4C((uint64_t)a1, v15);
    uint64_t v24 = [v22 arrayByAddingObject:v23];

    uint64_t v22 = (void *)v24;
  }
  id v25 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];
  CFStringRef v33 = @"transaction_date";
  CFStringRef v26 = +[NSArray arrayWithObjects:&v33 count:1];
  CFStringRef v32 = @"DESC";
  uint64_t v27 = +[NSArray arrayWithObjects:&v32 count:1];
  double v28 = +[SQLiteEntity queryWithDatabase:v16 predicate:v25 orderingProperties:v26 orderingDirections:v27 limit:a9];

  id v29 = sub_1004A8C0C((uint64_t)a1, v28);
  CFStringRef v30 = +[NSSet setWithArray:v29];

  return v30;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsBrandIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = sub_1004A5C4C((uint64_t)a1, a5);
  v17[0] = v9;
  id v10 = sub_1004ABBF4((uint64_t)a1, a4);
  v17[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v17 count:2];

  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  CFStringRef v13 = +[SQLiteEntity queryWithDatabase:v8 predicate:v12];

  id v14 = sub_1004A8C0C((uint64_t)a1, v13);
  id v15 = +[NSSet setWithArray:v14];

  return v15;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = sub_1004A5C4C((uint64_t)a1, a5);
  v17[0] = v9;
  id v10 = sub_1004ABDC0((uint64_t)a1, a4);
  v17[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v17 count:2];

  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  CFStringRef v13 = +[SQLiteEntity queryWithDatabase:v8 predicate:v12];

  id v14 = sub_1004A8C0C((uint64_t)a1, v13);
  id v15 = +[NSSet setWithArray:v14];

  return v15;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifierWithoutRegion:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = sub_1004ABDC0((uint64_t)a1, a4);
  v17[0] = v9;
  self;
  id v10 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"world_region_mapping_left.world_region_pid"];
  v17[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v17 count:2];

  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  CFStringRef v13 = +[SQLiteEntity queryWithDatabase:v8 predicate:v12 orderingProperties:0 orderingDirections:0 limit:a5];

  id v14 = sub_1004A8C0C((uint64_t)a1, v13);
  id v15 = +[NSSet setWithArray:v14];

  return v15;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMerchant:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8
{
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  if ([v14 count])
  {
    CFStringRef v18 = sub_1004A5C4C((uint64_t)a1, v14);
    [v17 addObject:v18];
  }
  CFStringRef v19 = sub_1004A85D4((uint64_t)a1, a6, 0);
  [v17 addObject:v19];

  uint64_t v20 = sub_1004A81E0((uint64_t)a1, a7);
  [v17 addObject:v20];

  id v21 = sub_1004A5E78((uint64_t)a1, 0);
  [v17 addObject:v21];

  uint64_t v22 = sub_1004AC21C((uint64_t)a1, v15);

  [v17 addObject:v22];
  CFStringRef v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
  CFStringRef v31 = @"transaction_date";
  uint64_t v24 = +[NSArray arrayWithObjects:&v31 count:1];
  CFStringRef v30 = @"DESC";
  id v25 = +[NSArray arrayWithObjects:&v30 count:1];
  CFStringRef v26 = +[SQLiteEntity queryWithDatabase:v16 predicate:v23 orderingProperties:v24 orderingDirections:v25 limit:a8];

  uint64_t v27 = sub_1004A8C0C((uint64_t)a1, v26);
  double v28 = +[NSSet setWithArray:v27];

  return v28;
}

+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  if ([v12 count])
  {
    CFStringRef v18 = sub_1004A5C4C((uint64_t)a1, v12);
    [v17 addObject:v18];
  }
  CFStringRef v19 = sub_1004A5E78((uint64_t)a1, 0);
  [v17 addObject:v19];

  uint64_t v20 = sub_1004A81E0((uint64_t)a1, 1);
  [v17 addObject:v20];

  id v21 = sub_1004AB620((uint64_t)a1, v15);

  [v17 addObject:v21];
  uint64_t v22 = sub_1004A7728((uint64_t)a1, v14);

  [v17 addObject:v22];
  CFStringRef v23 = sub_1004A77C8((uint64_t)a1, v13);

  [v17 addObject:v23];
  uint64_t v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
  id v25 = +[SQLiteEntity queryWithDatabase:v16 predicate:v24];

  id v26 = [v25 countOfEntities];
  return (unint64_t)v26;
}

+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 forPeerPaymentSubtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  if ([v14 count])
  {
    uint64_t v20 = sub_1004A5C4C((uint64_t)a1, v14);
    [v19 addObject:v20];
  }
  id v21 = sub_1004A5E78((uint64_t)a1, 0);
  [v19 addObject:v21];

  uint64_t v22 = sub_1004A81E0((uint64_t)a1, 1);
  [v19 addObject:v22];

  CFStringRef v23 = sub_1004AB620((uint64_t)a1, v17);

  [v19 addObject:v23];
  uint64_t v24 = sub_1004A7728((uint64_t)a1, v16);

  [v19 addObject:v24];
  id v25 = sub_1004A77C8((uint64_t)a1, v15);

  [v19 addObject:v25];
  id v26 = sub_1004ABA28((uint64_t)a1, a6);
  [v19 addObject:v26];

  uint64_t v27 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];
  double v28 = +[SQLiteEntity queryWithDatabase:v18 predicate:v27];

  id v29 = [v28 countOfEntities];
  return (unint64_t)v29;
}

+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [a1 databaseTable];
  id v15 = +[NSString stringWithFormat:@"SELECT %@, MAX(%@) as total FROM %@ WHERE %@ IS NOT NULL AND %@ != '' ", @"peer_payment_counterpart_handle", @"transaction_date", v14, @"peer_payment_counterpart_handle", @"peer_payment_counterpart_handle"];

  if (v11)
  {
    uint64_t v16 = [v15 stringByAppendingString:@"AND transaction_date > ? "];

    id v15 = (void *)v16;
  }
  if (v12)
  {
    uint64_t v17 = [v15 stringByAppendingString:@"AND transaction_date < ? "];

    id v15 = (void *)v17;
  }
  if (v10)
  {
    uint64_t v18 = [v15 stringByAppendingString:@"AND source_pid = ? "];

    id v15 = (void *)v18;
  }
  id v19 = [v15 stringByAppendingFormat:@"GROUP BY %@ ORDER BY MAX(%@) DESC", @"peer_payment_counterpart_handle", @"transaction_date"];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  void v26[2] = sub_1004ACD28;
  v26[3] = &unk_10074FAC0;
  id v27 = v11;
  id v28 = v12;
  id v29 = v10;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v20 = v30;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  sub_100012DC8((uint64_t)v13, v19, v26);

  id v24 = [v20 copy];
  return v24;
}

+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 excludingPaymentMode:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [a1 databaseTable];
  uint64_t v17 = +[NSString stringWithFormat:@"SELECT %@, MAX(%@) as total FROM %@ WHERE %@ IS NOT NULL AND %@ != '' ", @"peer_payment_counterpart_handle", @"transaction_date", v16, @"peer_payment_counterpart_handle", @"peer_payment_counterpart_handle"];

  if (v13)
  {
    uint64_t v18 = [v17 stringByAppendingString:@"AND transaction_date > ? "];

    uint64_t v17 = (void *)v18;
  }
  if (v14)
  {
    uint64_t v19 = [v17 stringByAppendingString:@"AND transaction_date < ? "];

    uint64_t v17 = (void *)v19;
  }
  if (v12)
  {
    uint64_t v20 = [v17 stringByAppendingString:@"AND source_pid = ? "];

    uint64_t v17 = (void *)v20;
  }
  id v21 = [v17 stringByAppendingString:@"AND ca != ? "];

  id v22 = [v21 stringByAppendingFormat:@"GROUP BY %@ ORDER BY MAX(%@) DESC", @"peer_payment_counterpart_handle", @"transaction_date"];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1004AD058;
  v29[3] = &unk_100754F28;
  id v30 = v13;
  id v31 = v14;
  id v33 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v34 = a4;
  id v32 = v12;
  id v23 = v33;
  id v24 = v12;
  id v25 = v14;
  id v26 = v13;
  sub_100012DC8((uint64_t)v15, v22, v29);

  id v27 = [v23 copy];
  return v27;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withMerchantCategory:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v36 = a3;
  uint64_t v20 = sub_1004AD3E8((uint64_t)a1, a4);
  v39[0] = v20;
  id v21 = sub_1004A5C4C((uint64_t)a1, v19);

  v39[1] = v21;
  id v22 = sub_1004A85D4((uint64_t)a1, a6, 0);
  v39[2] = v22;
  id v23 = sub_1004A81E0((uint64_t)a1, a7);
  v39[3] = v23;
  id v24 = sub_1004A7728((uint64_t)a1, v18);

  v39[4] = v24;
  id v25 = sub_1004A77C8((uint64_t)a1, v17);

  v39[5] = v25;
  id v26 = sub_1004A5E78((uint64_t)a1, 0);
  v39[6] = v26;
  id v27 = +[NSArray arrayWithObjects:v39 count:7];

  id v28 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v27];
  id v29 = objc_opt_class();
  CFStringRef v38 = @"transaction_date";
  id v30 = +[NSArray arrayWithObjects:&v38 count:1];
  CFStringRef v37 = @"DESC";
  id v31 = +[NSArray arrayWithObjects:&v37 count:1];
  id v32 = [v29 queryWithDatabase:v36 predicate:v28 orderingProperties:v30 orderingDirections:v31 limit:a10];

  id v33 = sub_1004A8C0C((uint64_t)a1, v32);
  unint64_t v34 = +[NSSet setWithArray:v33];

  return v34;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v36 = a3;
  uint64_t v20 = sub_1004A7EEC((uint64_t)a1, a4);
  v39[0] = v20;
  id v21 = sub_1004A5C4C((uint64_t)a1, v19);

  v39[1] = v21;
  id v22 = sub_1004A85D4((uint64_t)a1, a6, 0);
  v39[2] = v22;
  id v23 = sub_1004A81E0((uint64_t)a1, a7);
  v39[3] = v23;
  id v24 = sub_1004A7728((uint64_t)a1, v18);

  v39[4] = v24;
  id v25 = sub_1004A77C8((uint64_t)a1, v17);

  v39[5] = v25;
  id v26 = sub_1004A5E78((uint64_t)a1, 0);
  v39[6] = v26;
  id v27 = +[NSArray arrayWithObjects:v39 count:7];

  id v28 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v27];
  id v29 = objc_opt_class();
  CFStringRef v38 = @"transaction_date";
  id v30 = +[NSArray arrayWithObjects:&v38 count:1];
  CFStringRef v37 = @"DESC";
  id v31 = +[NSArray arrayWithObjects:&v37 count:1];
  id v32 = [v29 queryWithDatabase:v36 predicate:v28 orderingProperties:v30 orderingDirections:v31 limit:a10];

  id v33 = sub_1004A8C0C((uint64_t)a1, v32);
  unint64_t v34 = +[NSSet setWithArray:v33];

  return v34;
}

+ (id)transactionServiceIdentifiersInDatabase:(id)a3 withTransactionType:(int64_t)a4 withPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a6;
  id v39 = a3;
  uint64_t v20 = sub_1004A7EEC((uint64_t)a1, a4);
  v45[0] = v20;
  id v21 = sub_1004ABA28((uint64_t)a1, a5);
  v45[1] = v21;
  id v22 = sub_1004A5C4C((uint64_t)a1, v19);

  v45[2] = v22;
  id v23 = sub_1004A85D4((uint64_t)a1, a7, 0);
  v45[3] = v23;
  id v24 = sub_1004A81E0((uint64_t)a1, a8);
  v45[4] = v24;
  id v25 = sub_1004A7728((uint64_t)a1, v18);

  v45[5] = v25;
  id v26 = sub_1004A77C8((uint64_t)a1, v17);

  v45[6] = v26;
  id v27 = sub_1004A5E78((uint64_t)a1, 0);
  v45[7] = v27;
  id v28 = +[NSArray arrayWithObjects:v45 count:8];

  id v29 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v28];
  id v30 = objc_opt_class();
  CFStringRef v44 = @"transaction_date";
  id v31 = +[NSArray arrayWithObjects:&v44 count:1];
  CFStringRef v43 = @"DESC";
  id v32 = +[NSArray arrayWithObjects:&v43 count:1];
  id v33 = [v30 queryWithDatabase:v39 predicate:v29 orderingProperties:v31 orderingDirections:v32];

  id v34 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v42 = @"service_identifier";
  double v35 = +[NSArray arrayWithObjects:&v42 count:1];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1004ADC24;
  v40[3] = &unk_100731258;
  id v41 = v34;
  id v36 = v34;
  [v33 enumeratePersistentIDsAndProperties:v35 usingBlock:v40];

  id v37 = [v36 copy];
  return v37;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withRedemptionType:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = sub_1004A5C4C((uint64_t)a1, a4);
  v30[0] = v15;
  uint64_t v16 = sub_1004ADF08((uint64_t)a1, v13);

  v30[1] = v16;
  id v17 = sub_1004ADFA8((uint64_t)a1, v12);

  v30[2] = v17;
  id v18 = sub_1004AE048((uint64_t)a1, a5);
  v30[3] = v18;
  id v19 = sub_1004A5E78((uint64_t)a1, 0);
  v30[4] = v19;
  uint64_t v20 = +[NSArray arrayWithObjects:v30 count:5];

  id v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];
  CFStringRef v29 = @"grapes.d";
  id v22 = +[NSArray arrayWithObjects:&v29 count:1];
  CFStringRef v28 = @"DESC";
  id v23 = +[NSArray arrayWithObjects:&v28 count:1];
  id v24 = +[SQLiteEntity queryWithDatabase:v14 predicate:v21 orderingProperties:v22 orderingDirections:v23 limit:0];

  id v25 = sub_1004A8C0C((uint64_t)a1, v24);
  id v26 = +[NSSet setWithArray:v25];

  return v26;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forRequest:(id)a4
{
  id v5 = sub_1004AE0C0((uint64_t)a1, a3, a4);
  id v6 = sub_1004A8C0C((uint64_t)a1, v5);

  return v6;
}

+ (unint64_t)countInDatabase:(id)a3 forRequest:(id)a4
{
  unint64_t v9 = 0;
  id v6 = a3;
  id v7 = [a1 predicateForRequest:a4];
  sub_1004AE2FC((uint64_t)a1, &v9, 0, 0, v7, v6);

  return v9;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forPredicate:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Searching for predicate: %@", buf, 0xCu);
  }

  id v11 = objc_msgSend(v9, "passd_sqlPredicateForSelect");
  CFStringRef v19 = @"transaction_date";
  id v12 = +[NSArray arrayWithObjects:&v19 count:1];
  CFStringRef v18 = @"DESC";
  id v13 = +[NSArray arrayWithObjects:&v18 count:1];
  id v14 = +[SQLiteEntity queryWithDatabase:v8 predicate:v11 orderingProperties:v12 orderingDirections:v13 limit:a5];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v14 description];
    *(_DWORD *)buf = 138412290;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SQL Query: %@", buf, 0xCu);
  }
  uint64_t v16 = sub_1004A8C0C((uint64_t)a1, v14);

  return v16;
}

+ (void)totalAmount:(id *)a3 forTransactionsWithRequest:(id)a4 count:(unint64_t *)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v13 = [v11 currencyCode];
  id v12 = [a1 predicateForRequest:v11];

  sub_1004AE2FC((uint64_t)a1, a5, a3, v13, v12, v10);
}

+ (id)predicateForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionSourceIdentifiers];
  id v6 = [v4 transactionTypes];
  v124 = [v4 transactionSources];
  unsigned __int8 v123 = [v4 transactionStatuses];
  id v109 = [v4 peerPaymentSubType];
  id v110 = [v4 topUpSubtype];
  id v111 = [v4 peerPaymentPaymentMode];
  unsigned __int8 v126 = [v4 merchant];
  id v106 = [v4 merchantCategory];
  v122 = [v4 regions];
  v121 = [v4 tags];
  id v7 = [v4 startDate];
  id v8 = [v4 endDate];
  unsigned __int8 v120 = [v4 startStatusChangeDate];
  uint64_t v125 = [v4 endStatusChangeDate];
  unsigned __int8 v114 = [v4 currencyCode];
  v116 = [v4 amount];
  id v105 = [v4 amountComparison];
  id v108 = [v4 rewardsValueUnit];
  v118 = [v4 rewardsValue];
  uint64_t v117 = [v4 panIdentifier];
  v119 = [v4 fundingSourceTypes];
  unsigned int v107 = [v4 disputesOnly];
  id v9 = objc_alloc((Class)NSMutableArray);
  id v10 = sub_1004A81E0((uint64_t)a1, 1);
  v113 = v7;
  id v11 = sub_1004A7728((uint64_t)a1, v7);
  v112 = v8;
  id v12 = sub_1004A77C8((uint64_t)a1, v8);
  id v13 = sub_1004A5E78((uint64_t)a1, 0);
  id v127 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, 0);

  v115 = v6;
  if ([v6 count])
  {
    v103 = v5;
    id v104 = v4;
    id v130 = objc_alloc_init((Class)NSMutableArray);
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id obj = v6;
    id v131 = [obj countByEnumeratingWithState:&v156 objects:v169 count:16];
    if (v131)
    {
      uint64_t v14 = *(void *)v157;
      p_superclass = &OBJC_METACLASS___PaymentTransactionTag.superclass;
      uint64_t v128 = *(void *)v157;
      do
      {
        for (i = 0; i != v131; i = (char *)i + 1)
        {
          if (*(void *)v157 != v14) {
            objc_enumerationMutation(obj);
          }
          id v17 = [*(id *)(*((void *)&v156 + 1) + 8 * i) integerValue];
          CFStringRef v18 = sub_1004A7EEC((uint64_t)a1, (uint64_t)v17);
          if (v17 == (id)5)
          {
            id v22 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_type" equalToValue:&off_10078BA90];
            self;
            id v23 = [p_superclass + 49 isNotNullPredicateWithProperty:@"ab"];
            id v24 = a1;
            id v25 = p_superclass;
            v167[0] = v22;
            v167[1] = v23;
            id v26 = +[NSArray arrayWithObjects:v167 count:2];
            id v27 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v26];

            v166[0] = v18;
            v166[1] = v27;
            CFStringRef v28 = +[NSArray arrayWithObjects:v166 count:2];
            CFStringRef v29 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v28];
            [v130 addObject:v29];

            p_superclass = v25;
            a1 = v24;
            uint64_t v14 = v128;
          }
          else if (v17)
          {
            [v130 addObject:v18];
          }
          else
          {
            self;
            CFStringRef v19 = [p_superclass + 49 isNullPredicateWithProperty:@"ab"];
            v168[0] = v18;
            v168[1] = v19;
            uint64_t v20 = +[NSArray arrayWithObjects:v168 count:2];
            id v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];

            [v130 addObject:v21];
          }
        }
        id v131 = [obj countByEnumeratingWithState:&v156 objects:v169 count:16];
      }
      while (v131);
    }

    id v30 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v130];
    [v127 addObject:v30];

    id v5 = v103;
    id v4 = v104;
  }
  if ([v124 count])
  {
    id v31 = objc_alloc_init((Class)NSMutableArray);
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v32 = v124;
    id v33 = [v32 countByEnumeratingWithState:&v152 objects:v165 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v153;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v153 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = sub_1004AF5A4((uint64_t)a1, (uint64_t)[*(id *)(*((void *)&v152 + 1) + 8 * (void)j) integerValue]);
          [v31 addObject:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v152 objects:v165 count:16];
      }
      while (v34);
    }

    CFStringRef v38 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v31];
    [v127 addObject:v38];
  }
  id v39 = v127;
  if ([v123 count])
  {
    id v40 = objc_alloc_init((Class)NSMutableArray);
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v41 = v123;
    id v42 = [v41 countByEnumeratingWithState:&v148 objects:v164 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v149;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v149 != v44) {
            objc_enumerationMutation(v41);
          }
          CFStringRef v46 = sub_1004A9C78((uint64_t)a1, (uint64_t)[*(id *)(*((void *)&v148 + 1) + 8 * (void)k) integerValue]);
          [v40 addObject:v46];
        }
        id v43 = [v41 countByEnumeratingWithState:&v148 objects:v164 count:16];
      }
      while (v43);
    }

    uint64_t v47 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v40];
    id v39 = v127;
    [v127 addObject:v47];
  }
  if ([v5 count])
  {
    id v48 = sub_1004A5C4C((uint64_t)a1, v5);
    [v39 addObject:v48];
  }
  v50 = (void *)v125;
  uint64_t v49 = v126;
  if (v126)
  {
    double v51 = sub_1004AC21C((uint64_t)a1, v126);
    [v39 addObject:v51];
  }
  if (v106)
  {
    double v52 = sub_1004AD3E8((uint64_t)a1, (uint64_t)v106);
    [v39 addObject:v52];
  }
  if ([v122 count])
  {
    id v53 = +[PKWorldRegion mostConstrainingTypeInRegions:v122];
    id v54 = objc_alloc_init((Class)NSMutableArray);
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v55 = v122;
    id v56 = [v55 countByEnumeratingWithState:&v144 objects:v163 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v145;
      do
      {
        for (m = 0; m != v57; m = (char *)m + 1)
        {
          if (*(void *)v145 != v58) {
            objc_enumerationMutation(v55);
          }
          id v60 = *(void **)(*((void *)&v144 + 1) + 8 * (void)m);
          if ([v60 type] == v53)
          {
            id v61 = [v60 identifier];
            [v54 addObject:v61];
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v144 objects:v163 count:16];
      }
      while (v57);
    }

    id v62 = [v54 count];
    if ((unint64_t)v62 < 2)
    {
      uint64_t v49 = v126;
      id v39 = v127;
      if (v62 != (id)1)
      {
LABEL_61:

        v50 = (void *)v125;
        goto LABEL_62;
      }
      id v63 = [v54 firstObject];
      long long v70 = sub_1004AF6EC((uint64_t)a1, v63);
    }
    else
    {
      id v63 = objc_alloc_init((Class)NSMutableArray);
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      id v64 = v54;
      id v65 = [v64 countByEnumeratingWithState:&v140 objects:v162 count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v141;
        do
        {
          for (n = 0; n != v66; n = (char *)n + 1)
          {
            if (*(void *)v141 != v67) {
              objc_enumerationMutation(v64);
            }
            long long v69 = sub_1004AF6EC((uint64_t)a1, *(void **)(*((void *)&v140 + 1) + 8 * (void)n));
            [v63 addObject:v69];
          }
          id v66 = [v64 countByEnumeratingWithState:&v140 objects:v162 count:16];
        }
        while (v66);
      }

      long long v70 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v63];
      uint64_t v49 = v126;
      id v39 = v127;
    }
    [v39 addObject:v70];

    goto LABEL_61;
  }
LABEL_62:
  if (v116)
  {
    long long v71 = [v116 currency];
    long long v72 = sub_1004AF754((uint64_t)a1, v71);
    [v39 addObject:v72];

    long long v73 = [v116 amount];
    long long v74 = sub_1004AF7BC((uint64_t)a1, v73, (uint64_t)v105);
    [v39 addObject:v74];

    long long v75 = (void *)v117;
  }
  else
  {
    long long v75 = (void *)v117;
    if (!v114) {
      goto LABEL_67;
    }
    long long v73 = sub_1004AF754((uint64_t)a1, v114);
    [v39 addObject:v73];
  }

LABEL_67:
  if ([v121 count])
  {
    id v76 = objc_alloc_init((Class)NSMutableArray);
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v77 = v121;
    id v78 = [v77 countByEnumeratingWithState:&v136 objects:v161 count:16];
    if (v78)
    {
      id v79 = v78;
      uint64_t v80 = *(void *)v137;
      do
      {
        for (ii = 0; ii != v79; ii = (char *)ii + 1)
        {
          if (*(void *)v137 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = sub_1004AFA10((uint64_t)a1, *(void **)(*((void *)&v136 + 1) + 8 * (void)ii));
          [v76 addObject:v82];
        }
        id v79 = [v77 countByEnumeratingWithState:&v136 objects:v161 count:16];
      }
      while (v79);
    }

    v83 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v76];
    id v39 = v127;
    [v127 addObject:v83];

    v50 = (void *)v125;
    uint64_t v49 = v126;
    long long v75 = (void *)v117;
  }
  if (v109)
  {
    unsigned __int8 v84 = sub_1004ABA28((uint64_t)a1, (uint64_t)v109);
    [v39 addObject:v84];
  }
  if (v110)
  {
    v85 = sub_1004AFC1C((uint64_t)a1, (uint64_t)v110);
    [v39 addObject:v85];
  }
  if (v111)
  {
    v86 = sub_1004AFC94((uint64_t)a1, (uint64_t)v111);
    [v39 addObject:v86];
  }
  id v87 = v108;
  if (v118 && v108)
  {
    v88 = sub_1004AFD0C((uint64_t)a1, v118, (uint64_t)v108);
    [v39 addObject:v88];
  }
  if (v107)
  {
    v89 = +[SQLiteComparisonPredicate predicateWithProperty:@"tomatoes.g" notEqualToValue:&off_10078BA90];
    [v39 addObject:v89];
  }
  if (v75)
  {
    unsigned __int8 v90 = sub_1004AFDE4((uint64_t)a1, v75);
    [v39 addObject:v90];
  }
  if (objc_msgSend(v119, "count", v87))
  {
    id v91 = objc_alloc_init((Class)NSMutableArray);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v92 = v119;
    id v93 = [v92 countByEnumeratingWithState:&v132 objects:v160 count:16];
    if (v93)
    {
      id v94 = v93;
      uint64_t v95 = *(void *)v133;
      do
      {
        for (jj = 0; jj != v94; jj = (char *)jj + 1)
        {
          if (*(void *)v133 != v95) {
            objc_enumerationMutation(v92);
          }
          v97 = sub_1004AFE4C((uint64_t)a1, (uint64_t)[*(id *)(*((void *)&v132 + 1) + 8 * (void)jj) integerValue]);
          [v91 addObject:v97];
        }
        id v94 = [v92 countByEnumeratingWithState:&v132 objects:v160 count:16];
      }
      while (v94);
    }

    v98 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v91];
    id v39 = v127;
    [v127 addObject:v98];

    v50 = (void *)v125;
    uint64_t v49 = v126;
    long long v75 = (void *)v117;
  }
  if (v120)
  {
    unsigned __int8 v99 = sub_1004AA920((uint64_t)a1, v120);
    [v39 addObject:v99];
  }
  if (v50)
  {
    v100 = sub_1004AA9C0((uint64_t)a1, v50);
    [v39 addObject:v100];
  }
  v101 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v39];

  return v101;
}

+ (id)installmentPlanTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = sub_1004A5C4C((uint64_t)a1, a4);
  v15[0] = v7;
  id v8 = sub_1004A7EEC((uint64_t)a1, 14);
  v15[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v15 count:2];

  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  id v11 = [a1 queryWithDatabase:v6 predicate:v10];

  id v12 = sub_1004A8C0C((uint64_t)a1, v11);
  id v13 = +[NSSet setWithArray:v12];

  return v13;
}

+ (id)installmentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 installmentPlan:(id)a5 redeemed:(BOOL)a6 withRedemptionType:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9
{
  id v40 = a3;
  id v39 = a4;
  id v13 = a5;
  id v37 = a8;
  id v36 = a9;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  CFStringRef v38 = v13;
  id v15 = [v13 lineItems];
  id v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v41 + 1) + 8 * i) identifier];
        if (v20)
        {
          id v21 = sub_1004B0314((uint64_t)a1, v20);
          [v14 addObject:v21];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    uint64_t v35 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v14];
    v45[0] = v35;
    id v22 = v39;
    id v23 = sub_1004A5C4C((uint64_t)a1, v39);
    v45[1] = v23;
    id v24 = v37;
    id v25 = sub_1004ADF08((uint64_t)a1, v37);
    v45[2] = v25;
    id v26 = v36;
    id v27 = sub_1004ADFA8((uint64_t)a1, v36);
    v45[3] = v27;
    CFStringRef v28 = sub_1004A7EEC((uint64_t)a1, 14);
    v45[4] = v28;
    CFStringRef v29 = +[NSArray arrayWithObjects:v45 count:5];

    id v30 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v29];
    id v31 = [a1 queryWithDatabase:v40 predicate:v30];
    id v32 = sub_1004A8C0C((uint64_t)a1, v31);
    id v33 = +[NSSet setWithArray:v32];
  }
  else
  {
    id v33 = 0;
    id v22 = v39;
    id v26 = v36;
    id v24 = v37;
  }

  return v33;
}

+ (id)paymentTransactionsRequiringReviewInDatabase:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1004A6F64((uint64_t)a1, a4);
  v16[0] = v7;
  id v8 = sub_1004B04E4();
  v16[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v16 count:2];

  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  id v11 = +[SQLiteEntity queryWithDatabase:v6 predicate:v10];

  id v12 = sub_1004A8C0C((uint64_t)a1, v11);
  id v13 = +[NSSet setWithArray:v12];

  id v14 = [v13 objectsPassingTest:&stru_100754F68];

  return v14;
}

+ (id)paymentTransactionsInDatabase:(id)a3 missingWorldRegionWithLimit:(unint64_t)a4 onlyEligibleForProcessing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = sub_1004B0784((uint64_t)a1, v5);
  id v10 = +[SQLiteEntity queryWithDatabase:v8 predicate:v9 orderingProperties:0 orderingDirections:0 limit:a4];

  id v11 = sub_1004A8C0C((uint64_t)a1, v10);
  id v12 = +[NSSet setWithArray:v11];

  return v12;
}

+ (BOOL)hasTransactionsMissingWorldRegionEligibleForProcessingInDatabase:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1004B0784((uint64_t)a1, 1);
  id v6 = +[SQLiteEntity queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:1];

  LOBYTE(v5) = (uint64_t)[v6 countOfEntities] > 0;
  return (char)v5;
}

+ (id)paymentTransactionsForTokenizedTransactionsWithRegionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = sub_1004AF5A4((uint64_t)a1, 7);
  v20[0] = v6;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source" notEqualToValue:&off_10078BAA8];
  v20[1] = v7;
  self;
  id v8 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"world_region_mapping.world_region_pid"];
  v20[2] = v8;
  id v9 = +[NSArray arrayWithObjects:v20 count:3];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = +[SQLiteEntity queryWithDatabase:v4 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_1004B0ED8;
  v17[3] = &unk_100730E38;
  id v12 = v5;
  id v18 = v12;
  id v19 = v4;
  id v13 = v4;
  [v11 enumeratePersistentIDsUsingBlock:v17];
  id v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)regionIdentifiersInDatabase:(id)a3 matchingName:(id)a4 types:(id)a5 localeIdentifier:(id)a6 withRequest:(id)a7 limit:(unint64_t)a8
{
  id v47 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc((Class)NSArray);
  self;
  id v18 = +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_localized_content.status" equalToValue:&off_10078BAD8];
  CFStringRef v46 = v13;
  id v19 = sub_1004B1598((uint64_t)a1, v13);
  id v45 = v15;
  uint64_t v20 = sub_1004B1718((uint64_t)a1, v15);
  long long v44 = v16;
  id v21 = [a1 predicateForRequest:v16];
  id v22 = objc_msgSend(v17, "initWithObjects:", v18, v19, v20, v21, 0);

  p_superclass = (__objc2_class **)(&OBJC_METACLASS___PaymentTransactionTag + 8);
  if ([v14 count])
  {
    id v24 = objc_alloc_init((Class)NSMutableArray);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v25 = v14;
    id v26 = [v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v51;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v51 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = sub_1004B1780((uint64_t)a1, (uint64_t)[*(id *)(*((void *)&v50 + 1) + 8 * i) integerValue]);
          [v24 addObject:v30];
        }
        id v27 = [v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v27);
    }

    p_superclass = &OBJC_METACLASS___PaymentTransactionTag.superclass;
    id v31 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v24];
    uint64_t v32 = [v22 arrayByAddingObject:v31];

    id v22 = (id)v32;
  }
  id v33 = [p_superclass + 69 predicateMatchingAllPredicates:v22];
  CFStringRef v57 = @"count";
  id v34 = +[NSArray arrayWithObjects:&v57 count:1];
  CFStringRef v56 = @"DESC";
  uint64_t v35 = +[NSArray arrayWithObjects:&v56 count:1];
  CFStringRef v55 = @"world_region.identifier";
  id v36 = +[NSArray arrayWithObjects:&v55 count:1];
  id v37 = [a1 queryWithDatabase:v47 predicate:v33 orderingProperties:v34 orderingDirections:v35 limit:a8 groupingProperties:v36];

  id v38 = objc_alloc_init((Class)NSMutableSet);
  v54[0] = @"world_region.identifier";
  v54[1] = @"COUNT(*) as count";
  id v39 = +[NSArray arrayWithObjects:v54 count:2];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1004B17F8;
  v48[3] = &unk_100731258;
  id v49 = v38;
  id v40 = v38;
  [v37 enumeratePersistentIDsAndProperties:v39 usingBlock:v48];

  id v41 = [v40 copy];
  return v41;
}

+ (id)paymentTransactionsInDatabase:(id)a3 originatedOnDevice:(BOOL)a4 forTransactionSourceIdentifiers:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc((Class)NSArray);
  id v11 = sub_1004B1948((uint64_t)a1, v5);
  id v12 = sub_1004A5C4C((uint64_t)a1, v8);

  id v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, 0);
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  id v15 = [a1 queryWithDatabase:v9 predicate:v14];

  id v16 = sub_1004A8C0C((uint64_t)a1, v15);
  id v17 = +[NSSet setWithArray:v16];

  return v17;
}

+ (unint64_t)numberOfPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withNotificationServiceData:(unint64_t)a5 newerThanDate:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)NSArray);
  id v14 = sub_1004A5DD8((uint64_t)a1, a5);
  id v15 = sub_1004A5C4C((uint64_t)a1, v11);

  id v16 = sub_1004B1AF4((uint64_t)a1, v10);

  id v17 = sub_1004A5E78((uint64_t)a1, 0);
  id v18 = objc_msgSend(v13, "initWithObjects:", v14, v15, v16, v17, 0);

  id v19 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v18];
  id v20 = [a1 countInDatabase:v12 predicate:v19];

  return (unint64_t)v20;
}

+ (unint64_t)numberOfPaymentTransactionsInDatabaseWithAssociatedReceipt:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1004B1BF4();
  id v6 = [a1 countInDatabase:v4 predicate:v5];

  return (unint64_t)v6;
}

+ (id)transactionReceiptUniqueIDsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = sub_1004B1BF4();
  id v7 = [a1 queryWithDatabase:v4 predicate:v6];

  v17[0] = @"receipt_provider_identifier";
  v17[1] = @"receipt_identifier";
  id v8 = +[NSArray arrayWithObjects:v17 count:2];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1004B1E60;
  id v15 = &unk_100731258;
  id v9 = v5;
  id v16 = v9;
  [v7 enumeratePersistentIDsAndProperties:v8 usingBlock:&v12];

  if (objc_msgSend(v9, "count", v12, v13, v14, v15)) {
    id v10 = [v9 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)hasPaymentTransactionInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5
{
  id v8 = a3;
  id v9 = sub_1004A5C4C((uint64_t)a1, a4);
  id v16 = v9;
  id v10 = sub_1004AF5A4((uint64_t)a1, a5);
  id v17 = v10;
  id v11 = sub_1004A5E78((uint64_t)a1, 0);
  id v18 = v11;
  id v12 = +[NSArray arrayWithObjects:&v16 count:3];

  uint64_t v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:](SQLiteCompoundPredicate, "predicateMatchingAllPredicates:", v12, v16, v17);
  id v14 = +[SQLiteEntity queryWithDatabase:v8 predicate:v13 orderingProperties:0 orderingDirections:0 limit:1];

  LOBYTE(v8) = (uint64_t)[v14 countOfEntities] > 0;
  return (char)v8;
}

+ (id)transactionsRequiringMerchantCleanupInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withLastReprocessingDateBeforeDate:(id)a5 transactionDateWithinWindow:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = sub_1004A5C4C((uint64_t)a1, v11);

  [v13 addObject:v14];
  id v15 = sub_1004B2318((uint64_t)a1, 1);
  [v13 addObject:v15];

  id v16 = sub_1004B2390();
  [v13 addObject:v16];

  if (v10)
  {
    id v17 = sub_1004B2480((uint64_t)a1, v10);
    [v13 addObject:v17];
  }
  if (a6 > 0.0)
  {
    id v18 = +[NSDate date];
    id v19 = sub_1004A99B0(a6, (uint64_t)a1, v18);

    id v20 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"last_merchant_reprocessing_date"];
    v28[0] = v19;
    v28[1] = v20;
    id v21 = +[NSArray arrayWithObjects:v28 count:2];
    id v22 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v21];
    [v13 addObject:v22];
  }
  id v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  id v24 = [a1 queryWithDatabase:v12 predicate:v23];

  id v25 = sub_1004A8C0C((uint64_t)a1, v24);
  id v26 = +[NSSet setWithArray:v25];

  return v26;
}

+ (id)transactionsInDatabase:(id)a3 forInstallmentPlanIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1004A7EEC((uint64_t)a1, 13);
  id v9 = sub_1004A7338((uint64_t)a1, v6);

  v16[0] = v8;
  v16[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v16 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v7 predicate:v11];

  id v13 = sub_1004A8C0C((uint64_t)a1, v12);
  id v14 = +[NSSet setWithArray:v13];

  return v14;
}

+ (void)allPassTransactionIdentifiersInDatabase:(id)a3 batchHandler:(id)a4
{
}

+ (void)allPassTransactionIdentifiersWithAccountIdentifiers:(id)a3 inDatabase:(id)a4 batchHandler:(id)a5
{
  if (a5) {
    sub_1004B272C((uint64_t)a1, a3, a4, 0x8000000000000000, a5);
  }
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = sub_1004A5C4C((uint64_t)a1, a4);
  id v8 = sub_1004B2F64((uint64_t)a1, v6, v7);

  return v8;
}

+ (void)updateTransactionsWithTransactionSource:(id)a3 toTransactionSource:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 identifier];
    id v13 = [v9 identifier];
    *(_DWORD *)buf = 138412546;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating transaction with old transaction source identifier %@ to new transaction source identifier %@", buf, 0x16u);
  }
  id v14 = [v9 persistentID];
  id v15 = sub_1004A6128((uint64_t)a1, (uint64_t)[v8 persistentID]);
  id v16 = [a1 queryWithDatabase:v10 predicate:v15 orderingProperties:&__NSArray0__struct orderingDirections:&__NSArray0__struct];

  CFStringRef v23 = @"identifier";
  id v17 = +[NSArray arrayWithObjects:&v23 count:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1004B3228;
  void v19[3] = &unk_100754FE0;
  id v20 = v10;
  id v21 = a1;
  id v22 = v14;
  id v18 = v10;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:v19];
}

+ (id)rewardsValuesForUnit:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    CFStringRef v7 = @"eligible_eligible_rewards_percent_aggregate";
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    CFStringRef v7 = @"eligible_rewards_cash_aggregate";
LABEL_5:
    id v8 = [a1 databaseTable];
    id v9 = +[NSString stringWithFormat:@"SELECT DISTINCT %@ FROM %@ WHERE %@ IS NOT NULL", v7, v8, v7];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_1004B3438;
    v13[3] = &unk_10074A7A0;
    id v10 = objc_alloc_init((Class)NSMutableSet);
    id v14 = v10;
    sub_100012DC8((uint64_t)v6, v9, v13);
    if ([v10 count]) {
      id v11 = [v10 copy];
    }
    else {
      id v11 = 0;
    }

    goto LABEL_10;
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (id)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7
{
  id v67 = a3;
  id v73 = a4;
  id v65 = a5;
  id v64 = a6;
  id v63 = a7;
  long long v74 = [a1 databaseTable];
  long long v72 = +[PaymentTransactionReward databaseTable];
  long long v71 = +[TransactionSource databaseTable];
  long long v69 = +[AccountEnhancedMerchant databaseTable];
  long long v68 = +[AccountEnhancedMerchantProgramIdentifier databaseTable];
  long long v70 = +[Account databaseTable];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     max(%@) NOT NULL AS %@ ", @"apples.e", @"rewardAmount", @"apples.c", @"rewardType", @"apples.g", @"rewardEligibleValue", @"apples.h", @"rewardEligibleUnit", @"apples.pid", @"rewardPid", @"apples.b", @"transactionPid", @"apples.k", @"promotionIdentifier", @"apples.m", @"programIdentifier",
    @"mirabelle.b",
  id v12 = @"hasEnhancedMerchantProgramIdentifier");
  id v13 = [v12 stringByAppendingFormat:@"FROM %@ ", v74];

  id v14 = [v13 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v72, @"apples.b", v74, @"pid"];

  id v15 = [v14 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v71, @"transaction_source.pid", v74, @"source_pid"];

  id v16 = [v15 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v70, @"pears.a", v74, @"account_identifier"];

  id v17 = [v16 stringByAppendingFormat:@"LEFT JOIN %@ ON %@ = %@ ", v69, @"quince.a", @"pears.pid"];

  id v18 = [v17 stringByAppendingFormat:@"LEFT JOIN %@ ON %@ = %@ AND %@ = %@ ", v68, @"mirabelle.a", @"quince.pid", @"mirabelle.b", @"apples.m"];

  id v19 = [v18 stringByAppendingString:@"WHERE "];

  if ((uint64_t)[v67 count] >= 1)
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v67, "count"));
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v21 = v67;
    id v22 = [v21 countByEnumeratingWithState:&v110 objects:v114 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v111;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v111 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = +[NSString stringWithFormat:@"'%@'", *(void *)(*((void *)&v110 + 1) + 8 * i)];
          [v20 addObject:v25];
        }
        id v22 = [v21 countByEnumeratingWithState:&v110 objects:v114 count:16];
      }
      while (v22);
    }

    __int16 v26 = [v20 componentsJoinedByString:@", "];
    id v27 = +[NSString stringWithFormat:@"(%@)", v26];

    uint64_t v28 = [v19 stringByAppendingFormat:@"%@ IN %@ AND ", @"transaction_source.identifier", v27];

    id v19 = (void *)v28;
  }
  CFStringRef v29 = [v19 stringByAppendingFormat:@"(%@.%@ = ? OR %@.%@ = ?) AND %@.%@ = ? AND %@ = ? AND %@.%@ = '%@' ", v74, @"transaction_type", v74, @"transaction_type", v74, @"transaction_status", @"apples.d", v74, @"currency_code", v73];

  if (v65)
  {
    uint64_t v30 = [v29 stringByAppendingFormat:@"AND %@.%@ >= ? ", v74, @"transaction_date"];

    CFStringRef v29 = (void *)v30;
  }
  if (v64)
  {
    uint64_t v31 = [v29 stringByAppendingFormat:@"AND %@.%@ <= ? ", v74, @"transaction_date"];

    CFStringRef v29 = (void *)v31;
  }
  id v62 = [v29 stringByAppendingFormat:@"GROUP BY %@ ", @"rewardPid"];

  id v59 = +[NSString stringWithFormat:@"%@ AS (%@)", @"AllRewardsVirtualTable", v62];
  uint64_t v32 = +[NSString stringWithFormat:@"SELECT     %@.%@ AS %@,     %@.%@ AS %@ ", @"AllRewardsTableA", @"rewardPid", @"enhancedMerchantRewardPidA", @"AllRewardsTableB", @"rewardPid", @"enhancedMerchantRewardPidB"];
  id v33 = [v32 stringByAppendingFormat:@"FROM     %@ AS %@     JOIN %@ AS %@ ON %@.%@ = %@.%@ ", @"AllRewardsVirtualTable", @"AllRewardsTableA", @"AllRewardsVirtualTable", @"AllRewardsTableB", @"AllRewardsTableA", @"transactionPid", @"AllRewardsTableB", @"transactionPid"];

  objc_msgSend(v33, "stringByAppendingFormat:", @"AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ IS NULL AND (%@.%@ IS NULL OR %@.%@ IS 1) ", @"AllRewardsTableA", @"rewardEligibleUnit", @"AllRewardsTableA", @"rewardEligibleValue", @"AllRewardsTableA", @"rewardType", @"AllRewardsTableB", @"rewardEligibleUnit", @"AllRewardsTableB", @"rewardEligibleValue", @"AllRewardsTableB", @"rewardType", @"AllRewardsTableA", @"promotionIdentifier", @"AllRewardsTableA", @"programIdentifier",
    @"AllRewardsTableA",
  id v34 = @"hasEnhancedMerchantProgramIdentifier");

  id v61 = [v34 stringByAppendingFormat:@"GROUP BY %@.%@ ", @"AllRewardsTableA", @"transactionPid"];

  uint64_t v58 = +[NSString stringWithFormat:@"%@ AS (%@)", @"EnhancedMerchantRewardsVirtualTable", v61];
  id v60 = +[NSString stringWithFormat:@"SELECT     %@ AS %@ FROM     %@ UNION SELECT     %@ FROM     %@ ", @"enhancedMerchantRewardPidA", @"enhancedMerchantRewardPid", @"EnhancedMerchantRewardsVirtualTable", @"enhancedMerchantRewardPidB", @"EnhancedMerchantRewardsVirtualTable"];
  CFStringRef v57 = +[NSString stringWithFormat:@"%@ AS (%@)", @"EnhancedMerchantRewardsPidsTable", v60];
  uint64_t v35 = +[NSString stringWithFormat:@"SELECT    sum(%@.%@),     %@.%@,     %@.%@,     %@.%@,     %@.%@ IS NOT NULL AS %@ ", @"AllRewardsTableFinal", @"rewardAmount", @"AllRewardsTableFinal", @"rewardType", @"AllRewardsTableFinal", @"rewardEligibleValue", @"AllRewardsTableFinal", @"rewardEligibleUnit", @"EnhancedMerchantRewardsPidsTableFinal", @"enhancedMerchantRewardPid", @"isEnhancedMerchantReward"];
  id v36 = [v35 stringByAppendingFormat:@"FROM %@ AS %@ ", @"AllRewardsVirtualTable", @"AllRewardsTableFinal"];

  id v37 = [v36 stringByAppendingFormat:@"LEFT JOIN %@ AS %@ ON %@.%@ = %@.%@ ", @"EnhancedMerchantRewardsPidsTable", @"EnhancedMerchantRewardsPidsTableFinal", @"AllRewardsTableFinal", @"rewardPid", @"EnhancedMerchantRewardsPidsTableFinal", @"enhancedMerchantRewardPid"];

  id v38 = [v37 stringByAppendingFormat:@"GROUP BY %@.%@, %@.%@, %@.%@, %@ ", @"AllRewardsTableFinal", @"rewardEligibleUnit", @"AllRewardsTableFinal", @"rewardEligibleValue", @"AllRewardsTableFinal", @"rewardType", @"isEnhancedMerchantReward"];

  uint64_t v39 = [v38 stringByAppendingFormat:@"ORDER BY %@, %@.%@, %@.%@, %@.%@ ASC", @"isEnhancedMerchantReward", @"AllRewardsTableFinal", @"rewardType", @"AllRewardsTableFinal", @"rewardEligibleUnit", @"AllRewardsTableFinal", @"rewardEligibleValue"];

  uint64_t v40 = +[NSString stringWithFormat:@"WITH %@, %@, %@ %@", v59, v58, v57, v39];
  id v41 = +[NSDecimalNumber zero];
  CFStringRef v56 = +[NSDecimalNumber one];
  id v42 = [objc_alloc((Class)NSDecimalNumber) initWithMantissa:2 exponent:0 isNegative:0];
  id v43 = [objc_alloc((Class)NSDecimalNumber) initWithMantissa:3 exponent:0 isNegative:0];
  long long v44 = +[NSNull null];
  CFStringRef v55 = (void *)v39;
  uint64_t v104 = 0;
  id v105 = &v104;
  uint64_t v106 = 0x3032000000;
  unsigned int v107 = sub_100020E68;
  id v108 = sub_100021228;
  id v109 = v41;
  id v45 = (void *)v40;
  uint64_t v98 = 0;
  unsigned __int8 v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = sub_100020E68;
  unsigned __int8 v102 = sub_100021228;
  id v103 = v109;
  uint64_t v92 = 0;
  id v93 = &v92;
  uint64_t v94 = 0x3032000000;
  uint64_t v95 = sub_100020E68;
  unsigned __int8 v96 = sub_100021228;
  id v97 = v103;
  uint64_t v86 = 0;
  id v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = sub_100020E68;
  unsigned __int8 v90 = sub_100021228;
  id v54 = v97;
  id v91 = v54;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1004B4150;
  v75[3] = &unk_100755008;
  id v46 = v65;
  id v76 = v46;
  id v47 = v64;
  id v77 = v47;
  id v66 = v56;
  id v78 = v66;
  id v48 = v42;
  id v79 = v48;
  id v49 = v44;
  id v80 = v49;
  id v50 = v43;
  id v81 = v50;
  v82 = &v92;
  v83 = &v86;
  unsigned __int8 v84 = &v104;
  v85 = &v98;
  sub_100012DC8((uint64_t)v63, v45, v75);
  id v51 = objc_alloc((Class)PKAccountRewardsTierSummary);
  id v52 = [v51 initWithStartDate:v46 endDate:v47 currencyCode:v73 onePercentTotal:v105[5] twoPercentTotal:v99[5] threePercentTotal:v93[5] specialTotal:v87[5]];

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v92, 8);

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v104, 8);

  return v52;
}

- (void)replaceWithPaymentTransaction:(id)a3
{
  id v13 = a3;
  id v4 = [v13 paymentHash];
  id v5 = [v4 uppercaseString];

  unsigned int v6 = [v13 hasNotificationServiceData];
  if (v5)
  {
    if (v6)
    {
      CFStringRef v7 = [(SQLiteEntity *)self valueForProperty:@"payment_hash"];

      if (!v7)
      {
        id v8 = +[NSMutableDictionary dictionary];
        [v8 setObjectOrNull:v5 forKey:@"payment_hash"];
        if ([v13 technologyType] == (id)1)
        {
          id v9 = [v13 paymentHash];
          id v10 = sub_1004A4478(v9);

          id v11 = [v13 paymentHash];
          id v12 = sub_1004A44DC(v11);

          if (v10
            && ([v10 isEqualToString:@"00000000000000000000000000000000"] & 1) == 0)
          {
            [v8 setObjectOrNull:v10 forKey:@"payment_hash_component_1"];
          }
          if (v12
            && ([v12 isEqualToString:@"00000000000000000000000000000000"] & 1) == 0)
          {
            [v8 setObjectOrNull:v12 forKey:@"payment_hash_component_2"];
          }
        }
        [(SQLiteEntity *)self setValuesWithDictionary:v8];
      }
    }
  }
  [(PaymentTransaction *)self updateWithPaymentTransaction:v13];
}

- (void)updateWithPaymentTransaction:(id)a3
{
  id v266 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [(SQLiteEntity *)self valueForProperty:@"transaction_source"];
  id v6 = [v5 integerValue];

  id v7 = [v266 transactionSource];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  id v9 = [(SQLiteEntity *)self valueForProperty:@"transaction_type"];
  id v10 = [v9 integerValue];

  id v11 = [v266 transactionType];
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = v10;
  }
  id v13 = [(SQLiteEntity *)self valueForProperty:@"requires_location"];
  unsigned int v256 = [v13 BOOLValue];

  unsigned int v253 = [v266 requiresLocation];
  id v14 = [(SQLiteEntity *)self valueForProperty:@"transaction_status"];
  id v15 = [v14 integerValue];

  id v16 = [v266 transactionStatus];
  if (v16) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  id v247 = v17;
  id v18 = [(SQLiteEntity *)self valueForProperty:@"transaction_declined_reason"];
  id v19 = [v18 integerValue];

  id v20 = [v266 transactionDeclinedReason];
  if (v20) {
    id v21 = v20;
  }
  else {
    id v21 = v19;
  }
  id v231 = v21;
  id v22 = [(SQLiteEntity *)self valueForProperty:@"has_notification_service_data"];
  unsigned int v237 = [v22 BOOLValue];

  unsigned int v235 = [v266 hasNotificationServiceData];
  uint64_t v23 = [(SQLiteEntity *)self valueForProperty:@"processed_for_location"];
  unsigned int v233 = [v23 BOOLValue];

  unsigned int v222 = [v266 processedForLocation];
  id v24 = [(SQLiteEntity *)self valueForProperty:@"processed_for_merchant_cleanup"];
  unsigned int v220 = [v24 BOOLValue];

  unsigned int v218 = [v266 processedForMerchantCleanup];
  id v25 = [(SQLiteEntity *)self valueForProperty:@"processed_for_stations"];
  unsigned int v26 = [v25 BOOLValue];

  unsigned int v27 = [v266 processedForStations];
  uint64_t v28 = [(SQLiteEntity *)self valueForProperty:@"should_suppress_date"];
  unsigned int v229 = [v28 BOOLValue];

  unsigned int v227 = [v266 shouldSuppressDate];
  unsigned int v225 = [v266 requiresMerchantReprocessing];
  CFStringRef v29 = [(SQLiteEntity *)self valueForProperty:@"n"];
  unsigned int v221 = [v29 BOOLValue];

  unsigned int v219 = [v266 originatedByDevice];
  uint64_t v30 = [(SQLiteEntity *)self valueForProperty:@"fuzzy_matched"];
  unsigned int v217 = [v30 BOOLValue];

  unsigned int v216 = [v266 isFuzzyMatched];
  uint64_t v31 = [(SQLiteEntity *)self valueForProperty:@"interest_reassessment"];
  unsigned int v215 = [v31 BOOLValue];

  unsigned int v32 = [v266 interestReassessment];
  uint64_t v33 = [(SQLiteEntity *)self valueForProperty:@"associated_statement_identifiers"];
  id v34 = [v266 associatedStatementIdentifiers];
  uint64_t v35 = [v34 componentsJoinedByString:@","];
  id v36 = (void *)v35;
  if (v35) {
    id v37 = (void *)v35;
  }
  else {
    id v37 = (void *)v33;
  }
  id v265 = v37;

  id v38 = [(SQLiteEntity *)self valueForProperty:@"technology_type"];
  id v39 = [v38 integerValue];

  id v40 = [v266 technologyType];
  if (v40) {
    id v41 = v40;
  }
  else {
    id v41 = v39;
  }
  id v224 = v41;
  id v42 = [(SQLiteEntity *)self valueForProperty:@"locality"];
  id v43 = [v266 locality];
  id v251 = v8;
  if ([v43 length])
  {
    id v264 = [v266 locality];
  }
  else
  {
    id v264 = v42;
  }

  long long v44 = [(SQLiteEntity *)self valueForProperty:@"administrative_area"];
  id v45 = [v266 administrativeArea];
  unsigned int v213 = v27;
  if ([v45 length])
  {
    id v263 = [v266 administrativeArea];
  }
  else
  {
    id v263 = v44;
  }

  id v46 = [(SQLiteEntity *)self valueForProperty:@"af"];
  id v47 = [v266 timeZone];
  v245 = v42;
  if (v47)
  {
    id v48 = [v266 timeZone];
    id v262 = [v48 name];
  }
  else
  {
    id v262 = v46;
  }

  id v49 = [(SQLiteEntity *)self valueForProperty:@"peer_payment_memo"];
  id v50 = [v266 peerPaymentMemo];
  unsigned int v214 = v26;
  if ([v50 length])
  {
    id v261 = [v266 peerPaymentMemo];
  }
  else
  {
    id v261 = v49;
  }

  id v51 = [(SQLiteEntity *)self valueForProperty:@"cb"];
  id v52 = [v266 peerPaymentCounterpartImageRecordIdentifier];
  v241 = v51;
  if ([v52 length])
  {
    id v260 = [v266 peerPaymentCounterpartImageRecordIdentifier];
  }
  else
  {
    id v260 = v51;
  }

  long long v53 = [(SQLiteEntity *)self valueForProperty:@"secondary_funding_source_fpan_identifier"];
  id v54 = [v266 secondaryFundingSourceFPANIdentifier];
  id v249 = v12;
  if ([v54 length])
  {
    id v259 = [v266 secondaryFundingSourceFPANIdentifier];
  }
  else
  {
    id v259 = v53;
  }

  CFStringRef v55 = [(SQLiteEntity *)self valueForProperty:@"secondary_funding_source_description"];
  CFStringRef v56 = [v266 secondaryFundingSourceDescription];
  v246 = (void *)v33;
  v243 = v46;
  v244 = v44;
  v242 = v49;
  v239 = v55;
  v240 = v53;
  if ([v56 length])
  {
    id v258 = [v266 secondaryFundingSourceDescription];
  }
  else
  {
    id v258 = v55;
  }
  uint64_t v57 = v253 | v256;
  int v58 = v235 | v237;
  uint64_t v59 = v222 | v233;

  id v60 = [(SQLiteEntity *)self valueForProperty:@"secondary_funding_source_type"];
  id v61 = [v60 integerValue];

  id v62 = [v266 secondaryFundingSourceType];
  if (v62) {
    id v63 = v62;
  }
  else {
    id v63 = v61;
  }
  id v223 = v63;
  id v64 = [(SQLiteEntity *)self valueForProperty:@"issue_report_identifier"];
  id v65 = [v266 issueReportIdentifier];
  v238 = v64;
  unsigned int v254 = v58;
  if ([v65 length])
  {
    id v257 = [v266 issueReportIdentifier];
  }
  else
  {
    id v257 = v64;
  }
  uint64_t v66 = v32 | v215;

  id v67 = [(SQLiteEntity *)self valueForProperty:@"transaction_date"];
  long long v68 = (void *)_DateForSQLValue();

  long long v69 = [v266 transactionDate];
  v236 = v68;
  if (v69)
  {
    id v70 = [v266 transactionDate];
  }
  else
  {
    id v70 = v68;
  }

  [v4 setObjectOrNull:v70 forKey:@"transaction_date"];
  long long v71 = [v266 transactionStatusChangedDate];
  [v4 setObjectOrNull:v71 forKey:@"transaction_status_changed_date"];

  long long v72 = [v266 expirationDate];
  [v4 setObjectOrNull:v72 forKey:@"expiration_date"];

  id v73 = [v266 cityCode];
  [v4 setObjectOrNull:v73 forKey:@"city_code"];

  [v4 setInteger:v224 forKey:@"technology_type"];
  [v4 setInteger:v251 forKey:@"transaction_source"];
  [v4 setInteger:v249 forKey:@"transaction_type"];
  [v4 setInteger:v247 forKey:@"transaction_status"];
  [v4 setInteger:v231 forKey:@"transaction_declined_reason"];
  [v4 setBool:v57 forKey:@"requires_location"];
  [v4 setBool:v254 forKey:@"has_notification_service_data"];
  [v4 setBool:v59 forKey:@"processed_for_location"];
  [v4 setBool:v218 | v220 forKey:@"processed_for_merchant_cleanup"];
  [v4 setBool:v225 forKey:@"requires_merchant_reprocessing"];
  long long v74 = [v266 lastMerchantReprocessingDate];

  if (v74)
  {
    long long v75 = [v266 lastMerchantReprocessingDate];
    id v76 = (void *)_SQLValueForDate();
    [v4 setObjectOrNull:v76 forKey:@"last_merchant_reprocessing_date"];
  }
  v234 = v70;
  [v4 setBool:v219 | v221 forKey:@"n"];
  [v4 setBool:v216 | v217 forKey:@"fuzzy_matched"];
  [v4 setObjectOrNull:v265 forKey:@"associated_statement_identifiers"];
  [v4 setBool:v66 forKey:@"interest_reassessment"];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "updateSequenceNumber"), @"update_sequence_number");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "needsSyncWithFinance"), @"needs_sync_to_finance");
  [v4 safelySetObject:v264 forKey:@"locality"];
  [v4 safelySetObject:v263 forKey:@"administrative_area"];
  [v4 safelySetObject:v262 forKey:@"af"];
  [v266 locationLatitude];
  if (v77 != 0.0 || ([v266 locationLongitude], v78 != 0.0))
  {
    [v266 locationHorizontalAccuracy];
    if (v79 > 0.0)
    {
      id v80 = [v266 locationDate];
      [v4 setObject:v80 forKey:@"location_date"];

      [v266 locationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_latitude");
      [v266 locationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_longitude");
      [v266 locationAltitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_altitude");
      [v266 locationHorizontalAccuracy];
      objc_msgSend(v4, "setDouble:forKey:", @"location_horizontal_accuracy");
      [v266 locationVerticalAccuracy];
      objc_msgSend(v4, "setDouble:forKey:", @"location_vertical_accuracy");
      objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "isCoarseLocation"), @"is_coarse_location");
    }
  }
  id v81 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v266 transitType]);
  [v4 setObject:v81 forKeyedSubscript:@"transit_type"];

  v82 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v266 transitModifiers]);
  [v4 setObject:v82 forKeyedSubscript:@"transit_modifiers"];

  v83 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v266 enRoute]);
  [v4 setObject:v83 forKeyedSubscript:@"en_route"];

  uint64_t v84 = [(SQLiteEntity *)self valueForProperty:@"station_code_provider"];
  uint64_t v85 = [v266 stationCodeProvider];
  uint64_t v86 = [(SQLiteEntity *)self valueForProperty:@"start_station_code"];
  uint64_t v87 = [v266 startStationCode];
  uint64_t v252 = [(SQLiteEntity *)self valueForProperty:@"end_station_code"];
  uint64_t v88 = [v266 endStationCode];
  [v4 setObjectOrNull:v85 forKey:@"station_code_provider"];
  v250 = (void *)v87;
  uint64_t v89 = v87;
  unsigned __int8 v90 = (void *)v86;
  [v4 setObjectOrNull:v89 forKey:@"start_station_code"];
  v248 = (void *)v88;
  uint64_t v91 = v88;
  uint64_t v92 = (void *)v84;
  [v4 setObjectOrNull:v91 forKey:@"end_station_code"];
  if (v84
    && v86 | v252
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects())
  {
    id v93 = [v266 startStation];
    if (v93)
    {
      [v4 setObject:v93 forKey:@"start_station"];
      [v266 startStationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"start_station_latitude");
      [v266 startStationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"start_station_longitude");
    }
    uint64_t v94 = v213 | v214;
    uint64_t v95 = [v266 endStation];
    unsigned int v96 = v254;
    if (v95)
    {
      [v4 setObject:v95 forKey:@"end_station"];
      [v266 endStationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"end_station_latitude");
      [v266 endStationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"end_station_longitude");
    }
  }
  else
  {
    id v97 = [v266 startStation];
    [v4 setObjectOrNull:v97 forKey:@"start_station"];

    [v266 startStationLatitude];
    objc_msgSend(v4, "setDouble:forKey:", @"start_station_latitude");
    [v266 startStationLongitude];
    objc_msgSend(v4, "setDouble:forKey:", @"start_station_longitude");
    uint64_t v98 = [v266 endStation];
    [v4 setObjectOrNull:v98 forKey:@"end_station"];

    [v266 endStationLatitude];
    objc_msgSend(v4, "setDouble:forKey:", @"end_station_latitude");
    [v266 endStationLongitude];
    objc_msgSend(v4, "setDouble:forKey:", @"end_station_longitude");
    if (v85) {
      uint64_t v94 = (uint64_t)[v266 processedForStations];
    }
    else {
      uint64_t v94 = 1;
    }
    unsigned int v96 = v254;
  }
  [v4 setBool:v94 forKey:@"processed_for_stations"];
  [v4 setBool:v227 | v229 forKey:@"should_suppress_date"];
  [v4 setObjectOrNull:v257 forKey:@"issue_report_identifier"];
  unsigned __int8 v99 = [v266 amount];
  uint64_t v100 = v99;
  if (v99) {
    char v101 = v96;
  }
  else {
    char v101 = 1;
  }
  if (v101)
  {

    unsigned __int8 v102 = v266;
    if (!v100) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  id v109 = [(SQLiteEntity *)self valueForProperty:@"amount"];

  unsigned __int8 v102 = v266;
  if (!v109)
  {
LABEL_74:
    id v103 = [v266 amount];
    uint64_t v104 = PKCurrencyDecimalToStorageNumber();
    [v4 setObjectOrNull:v104 forKey:@"amount"];

    unsigned __int8 v102 = v266;
  }
LABEL_75:
  id v105 = [v102 subtotalAmount];
  if (v105)
  {

LABEL_77:
    uint64_t v106 = [v266 subtotalAmount];
    unsigned int v107 = PKCurrencyDecimalToStorageNumber();
    [v4 setObjectOrNull:v107 forKey:@"subtotal_amount"];

    id v108 = v266;
    goto LABEL_81;
  }
  long long v110 = [(SQLiteEntity *)self valueForProperty:@"subtotal_amount"];

  id v108 = v266;
  if (!v110) {
    goto LABEL_77;
  }
LABEL_81:
  long long v111 = [v108 amountAddedToAuth];
  if (v111)
  {

LABEL_83:
    long long v112 = [v266 amountAddedToAuth];
    long long v113 = PKCurrencyDecimalToStorageNumber();
    [v4 setObjectOrNull:v113 forKey:@"amount_added_to_auth"];

    unsigned __int8 v114 = v266;
    goto LABEL_85;
  }
  v115 = [(SQLiteEntity *)self valueForProperty:@"amount_added_to_auth"];

  unsigned __int8 v114 = v266;
  if (!v115) {
    goto LABEL_83;
  }
LABEL_85:
  v116 = [v114 currencyCode];
  uint64_t v117 = v116;
  if (v116) {
    char v118 = v96;
  }
  else {
    char v118 = 1;
  }
  if (v118)
  {

    v119 = v266;
    if (!v117) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
  unsigned __int8 v123 = [(SQLiteEntity *)self valueForProperty:@"currency_code"];

  v119 = v266;
  if (!v123)
  {
LABEL_90:
    unsigned __int8 v120 = [v266 currencyCode];
    [v4 safelySetObject:v120 forKey:@"currency_code"];

    v119 = v266;
  }
LABEL_91:
  v121 = [v119 merchant];
  if ([v121 isValid])
  {
    if (v96)
    {

      v122 = v266;
    }
    else
    {
      BOOL v124 = sub_1004B65A4(self);

      v122 = v266;
      if (v124) {
        goto LABEL_99;
      }
    }
    v121 = [v122 merchant];
    [(PaymentTransaction *)self updateWithMerchant:v121];
  }

  v122 = v266;
LABEL_99:
  uint64_t v125 = [v122 serviceIdentifier];
  if (v125) {
    unsigned int v126 = v96;
  }
  else {
    unsigned int v126 = 0;
  }

  if (v126 == 1)
  {
    id v127 = [v266 serviceIdentifier];
    [v4 setObjectOrNull:v127 forKey:@"service_identifier"];
  }
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "peerPaymentType"), @"peer_payment_type");
  uint64_t v128 = [v266 peerPaymentCounterpartHandle];
  [v4 setObjectOrNull:v128 forKey:@"peer_payment_counterpart_handle"];

  [v4 setObjectOrNull:v261 forKey:@"peer_payment_memo"];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "peerPaymentPaymentMode"), @"ca");
  [v4 setObjectOrNull:v260 forKey:@"cb"];
  unsigned __int8 v129 = [(SQLiteEntity *)self valueForProperty:@"peer_payment_message_received_date"];
  id v130 = (void *)_DateForSQLValue();

  id v131 = [v266 peerPaymentMessageReceivedDate];
  v230 = v130;
  if (v131)
  {
    id v132 = [v266 peerPaymentMessageReceivedDate];
  }
  else
  {
    id v132 = v130;
  }

  v228 = v132;
  [v4 setObjectOrNull:v132 forKey:@"peer_payment_message_received_date"];
  long long v133 = [v266 amounts];
  sub_1004A463C(self, v133);

  long long v134 = [v266 plans];
  sub_1004A46E0(self, v134);

  long long v135 = [v266 fees];
  sub_1004A4784(self, v135);

  long long v136 = [v266 rewards];
  long long v137 = [v266 rewardsInProgress];
  sub_1004A4808(self, v136, v137);

  long long v138 = [v266 questions];
  sub_1004A48D0(self, v138);

  sub_1004A4954(self, v266);
  sub_1004A4A08(self, v266);
  long long v139 = [v266 foreignExchangeInformation];
  long long v140 = v139;
  if (v139)
  {
    long long v141 = [v139 destinationCurrencyAmount];
    long long v142 = [v141 amount];
    long long v143 = PKCurrencyDecimalToStorageNumber();

    [v4 setObjectOrNull:v143 forKey:@"foreign_exchange_information_destination_amount"];
    long long v144 = [v140 destinationCurrencyAmount];
    long long v145 = [v144 currency];
    [v4 setObjectOrNull:v145 forKey:@"foreign_exchange_information_destination_currency_code"];

    long long v146 = [v140 exchangeRate];
    long long v147 = [v146 stringValue];
    [v4 setObjectOrNull:v147 forKey:@"foreign_exchange_information_exchange_rate"];
  }
  long long v148 = [v266 primaryFundingSourceAmount];
  long long v149 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v149 forKey:@"primary_funding_source_amount"];

  long long v150 = [v266 primaryFundingSourceCurrencyCode];
  [v4 setObjectOrNull:v150 forKey:@"primary_funding_source_currency_code"];

  long long v151 = [v266 secondaryFundingSourceAmount];
  long long v152 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v152 forKey:@"secondary_funding_source_amount"];

  long long v153 = [v266 secondaryFundingSourceCurrencyCode];
  [v4 setObjectOrNull:v153 forKey:@"secondary_funding_source_currency_code"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "secondaryFundingSourceNetwork"), @"secondary_funding_source_network");
  long long v154 = [v266 secondaryFundingSourceDPANSuffix];
  [v4 setObjectOrNull:v154 forKey:@"secondary_funding_source_dpan_suffix"];

  [v4 setObjectOrNull:v259 forKey:@"secondary_funding_source_fpan_identifier"];
  [v4 setObjectOrNull:v258 forKey:@"secondary_funding_source_description"];
  [v4 setInteger:v223 forKey:@"secondary_funding_source_type"];
  long long v155 = [v266 requestDeviceScoreIdentifier];

  if (v155)
  {
    long long v156 = [v266 requestDeviceScoreIdentifier];
    long long v157 = (void *)_SQLValueForUUID();
    [v4 setObject:v157 forKey:@"request_device_score_identifier"];
  }
  long long v158 = [v266 sendDeviceScoreIdentifier];

  if (v158)
  {
    long long v159 = [v266 sendDeviceScoreIdentifier];
    v160 = (void *)_SQLValueForUUID();
    [v4 setObject:v160 forKey:@"send_device_score_identifier"];
  }
  v161 = [v266 rewardsTotalAmount];
  v162 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v162 forKey:@"c"];

  v163 = [v266 rewardsTotalCurrencyCode];
  [v4 setObjectOrNull:v163 forKey:@"d"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "rewardsEligibilityReason"), @"e");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "cardType"), @"a");
  v164 = [v266 accountIdentifier];
  [v4 setObjectOrNull:v164 forKey:@"account_identifier"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "accountType"), @"account_type");
  v165 = [v266 lifecycleIdentifier];
  [v4 setObjectOrNull:v165 forKey:@"o"];

  v166 = [v266 authNetworkData];

  if (v166)
  {
    v167 = [v266 authNetworkData];
    [v4 setObjectOrNull:v167 forKey:@"r"];
  }
  v168 = [v266 clearingNetworkData];

  if (v168)
  {
    v169 = [v266 clearingNetworkData];
    [v4 setObjectOrNull:v169 forKey:@"s"];
  }
  v170 = [v266 cardIdentifier];
  [v4 setObjectOrNull:v170 forKey:@"v"];

  v171 = [v266 dpanIdentifier];
  [v4 setObjectOrNull:v171 forKey:@"dpan_identifier"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "paymentNetworkIdentifier"), @"payment_network_identifier");
  v172 = [v266 panIdentifier];
  [v4 setObjectOrNull:v172 forKey:@"zm"];

  v173 = [v266 isMerchantTokenTransaction];
  [v4 setObjectOrNull:v173 forKey:@"is_merchant_token_transaction"];

  v174 = [v266 cardNumberSuffix];
  [v4 setObjectOrNull:v174 forKey:@"ae"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "adjustmentTypeReason"), @"w");
  v175 = [v266 referenceIdentifier];
  [v4 setObjectOrNull:v175 forKey:@"ab"];

  if ([v266 associatedFeatureIdentifier]) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "associatedFeatureIdentifier"), @"afi");
  }
  if ([v266 suppressBehavior]) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "suppressBehavior"), @"ac");
  }
  if ([v266 redemptionType]) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v266, "redemptionType"), @"ad");
  }
  v176 = [v266 receiptProviderURL];

  if (v176)
  {
    v177 = [v266 receiptProviderURL];
    v178 = (void *)_SQLValueForURL();
    [v4 setObjectOrNull:v178 forKey:@"receipt_provider_url"];
  }
  v179 = [v266 receiptProviderIdentifier];

  if (v179)
  {
    v180 = [v266 receiptProviderIdentifier];
    [v4 setObjectOrNull:v180 forKey:@"receipt_provider_identifier"];
  }
  v181 = [v266 receiptIdentifier];

  if (v181)
  {
    v182 = [v266 receiptIdentifier];
    [v4 setObjectOrNull:v182 forKey:@"receipt_identifier"];
  }
  v183 = [v266 barcodeIdentifier];

  if (v183)
  {
    v184 = [v266 barcodeIdentifier];
    [v4 setObjectOrNull:v184 forKey:@"barcode_identifier"];
  }
  v185 = [v266 authenticationContext];
  if ((uint64_t)[v185 paymentPINFormat] >= 1) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v185, "paymentPINFormat"), @"payment_pin_format");
  }
  if ([v185 requestedAuthenticationMechanisms]) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v185, "requestedAuthenticationMechanisms"), @"requested_auth_mechanisms");
  }
  v186 = [v185 nonce];

  if (v186)
  {
    v187 = [v185 nonce];
    [v4 setObjectOrNull:v187 forKey:@"nonce"];
  }
  v188 = [v185 signingKeyMaterial];

  if (v188)
  {
    v189 = [v185 signingKeyMaterial];
    [v4 setObjectOrNull:v189 forKey:@"signing_key_material"];
  }
  v190 = [v185 partialSignature];

  if (v190)
  {
    v191 = [v185 partialSignature];
    [v4 setObjectOrNull:v191 forKey:@"partial_signature"];
  }
  v232 = v90;
  v255 = (void *)v85;
  if (PKPaymentTransactionHasAuthenticationRequest()) {
    sub_1004A4ABC(self);
  }
  v192 = [v266 primaryFundingSourceDescription];
  [v4 setObjectOrNull:v192 forKey:@"primary_funding_source_description"];

  v193 = [v266 nominalAmount];
  v194 = PKCurrencyDecimalToStorageNumber();

  [v4 setObjectOrNull:v194 forKey:@"nominal_amount"];
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "hasAdditionalOffers"), @"has_additional_offers");
  v195 = [v266 awards];
  sub_1004A4B34(self, v195);

  v196 = [v266 amountModifiers];
  sub_1004A4BD8(self, v196);

  v197 = [v266 releasedData];
  sub_1004A4C7C(self, v197);

  v198 = [(SQLiteEntity *)self valueForProperty:@"iit"];
  unsigned int v199 = [v198 BOOLValue];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "isIssuerInstallmentTransaction") | v199, @"iit");
  v200 = [(SQLiteEntity *)self valueForProperty:@"iimu"];
  v201 = (void *)_URLForSQLValue();

  v202 = [v266 issuerInstallmentManagementURL];
  v226 = v92;
  if (v202)
  {
    id v203 = [v266 issuerInstallmentManagementURL];
  }
  else
  {
    id v203 = v201;
  }

  v204 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v204 forKey:@"iimu"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "suppressNotifications"), @"suppress_notifications");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "isRecurring"), @"recurring");
  v205 = [(SQLiteEntity *)self valueForProperty:@"device_score_identifiers_submitted"];
  unsigned int v206 = [v205 BOOLValue];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "deviceScoreIdentifiersSubmitted") | v206, @"device_score_identifiers_submitted");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v266, "deviceScoreIdentifiersRequired"), @"device_score_identifiers_required");
  v207 = [v266 merchantProvidedDescription];
  [v4 setObjectOrNull:v207 forKey:@"merchant_provided_description"];

  v208 = [v266 merchantProvidedTitle];
  [v4 setObjectOrNull:v208 forKey:@"merchant_provided_title"];

  v209 = [v266 metadata];

  if (v209)
  {
    v210 = [v266 metadata];
    v211 = +[NSJSONSerialization dataWithJSONObject:v210 options:0 error:0];

    id v212 = [objc_alloc((Class)NSString) initWithData:v211 encoding:4];
    [v4 setObjectOrNull:v212 forKey:@"metadata"];
  }
  sub_1004A4540((uint64_t)self, v4, v266);
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

- (void)updateWithPaymentTransactionSource:(id)a3
{
  id v4 = a3;
  id v5 = [(PaymentTransaction *)self transactionSourceIdentifier];
  id v6 = +[TransactionSource anyInDatabase:self->super._database withIdentifier:v5];
  uint64_t v7 = +[TransactionSource anyInDatabase:self->super._database withIdentifier:v4];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9 || [v6 type] != (id)3 || objc_msgSend(v8, "type") != 0;
  if ([v5 length] && objc_msgSend(v4, "length"))
  {
    id v11 = v5;
    id v12 = v4;
    id v13 = v12;
    if (v11 == v12)
    {

LABEL_19:
      goto LABEL_20;
    }
    if (v12 && v11) {
      v10 |= [v11 isEqualToString:v12];
    }

    if ((v10 & 1) == 0)
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(PaymentTransaction *)self identifier];
        int v16 = 138412802;
        id v17 = v11;
        __int16 v18 = 2112;
        id v19 = v13;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating transaction source identifier from %@ to %@ for transaction with identifier %@", (uint8_t *)&v16, 0x20u);
      }
      id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 persistentID]);
      [(SQLiteEntity *)self setValue:v13 forProperty:@"source_pid"];
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)updateSuppressBehavior:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"ac"];
}

- (void)updateRequiresMerchantReprocessing:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"requires_merchant_reprocessing"];
}

+ (unint64_t)suppressionBehaviorForTransactionSourceIdentifier:(id)a3 serviceIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1004A7044((uint64_t)a1, v9);
  v25[0] = v11;
  id v12 = sub_1004A6D98((uint64_t)a1, v8);
  v25[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v25 count:2];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  id v15 = [a1 queryWithDatabase:v10 predicate:v14 orderingProperties:0 orderingDirections:0 limit:1];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  CFStringRef v24 = @"ac";
  int v16 = +[NSArray arrayWithObjects:&v24 count:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1004B6B10;
  void v19[3] = &unk_1007339F8;
  void v19[4] = &v20;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:v19];

  unint64_t v17 = v21[3];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (void)updateRedemptionType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"ad"];
}

- (void)updateWithMerchant:(id)a3
{
  id v27 = a3;
  if ([v27 isValid])
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = [v27 name];
    [v4 safelySetObject:v5 forKey:@"merchant_name"];

    id v6 = [v27 rawName];
    [v4 safelySetObject:v6 forKey:@"merchant_raw_name"];

    uint64_t v7 = [v27 industryCategory];
    [v4 safelySetObject:v7 forKey:@"merchant_industry_category"];

    id v8 = [v27 rawCANL];
    [v4 safelySetObject:v8 forKey:@"f"];

    id v9 = [v27 rawCity];
    [v4 safelySetObject:v9 forKey:@"g"];

    id v10 = [v27 rawState];
    [v4 safelySetObject:v10 forKey:@"h"];

    id v11 = [v27 rawCountry];
    [v4 safelySetObject:v11 forKey:@"i"];

    id v12 = [v27 city];
    [v4 safelySetObject:v12 forKey:@"j"];

    id v13 = [v27 state];
    [v4 safelySetObject:v13 forKey:@"k"];

    id v14 = [v27 zip];
    [v4 safelySetObject:v14 forKey:@"l"];

    id v15 = [v27 merchantIdentifier];
    [v4 safelySetObject:v15 forKey:@"t"];

    int v16 = [v27 fallbackLogoImageURL];
    unint64_t v17 = (void *)_SQLValueForURL();
    [v4 safelySetObject:v17 forKey:@"merchant_fallback_logo_image_url"];

    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "cleanConfidenceLevel"), @"m");
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "industryCode"), @"merchant_industry_code");
    __int16 v18 = [v27 fallbackDetailedCategory];

    if (v18)
    {
      id v19 = [v27 fallbackDetailedCategory];
      [v4 safelySetObject:v19 forKey:@"y"];
    }
    if ([v27 fallbackcategory]) {
      objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "fallbackcategory"), @"x");
    }
    uint64_t v20 = [v27 originURL];

    if (v20)
    {
      id v21 = [v27 originURL];
      uint64_t v22 = (void *)_SQLValueForURL();
      [v4 setObject:v22 forKey:@"p"];
    }
    uint64_t v23 = [v27 webMerchantIdentifier];

    if (v23)
    {
      CFStringRef v24 = [v27 webMerchantIdentifier];
      [v4 safelySetObject:v24 forKey:@"ag"];
    }
    id v25 = [v27 webMerchantName];

    if (v25)
    {
      unsigned int v26 = [v27 webMerchantName];
      [v4 safelySetObject:v26 forKey:@"ah"];
    }
    if ([v27 adamIdentifier]) {
      objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "adamIdentifier"), @"q");
    }
    if ([v27 useRawMerchantData]) {
      objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v27, "useRawMerchantData"), @"use_raw_merchant_data");
    }
    [(SQLiteEntity *)self setValuesWithDictionary:v4];
  }
}

- (void)removeMapsDataForIssueReportIdentifier:(id)a3
{
  id v5 = a3;
  [(SQLiteEntity *)self setValue:&__kCFBooleanTrue forProperty:@"use_raw_merchant_data"];
  [(SQLiteEntity *)self setValue:&__kCFBooleanTrue forProperty:@"requires_merchant_reprocessing"];
  [(SQLiteEntity *)self setValue:0 forProperty:@"last_merchant_reprocessing_date"];
  id v4 = v5;
  if (v5)
  {
    [(SQLiteEntity *)self setValue:v5 forProperty:@"issue_report_identifier"];
    id v4 = v5;
  }
}

- (id)paymentTransaction
{
  id v4 = (id *)sub_1004B76BC([PaymentTransactionDeserializationContext alloc], 0);
  id v5 = sub_1004B79C0(v4, self);
  sub_1004B7B54((uint64_t)v4, self->super._database);

  return v5;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)serviceIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"service_identifier"];
}

- (id)transactionDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"transaction_date"];
  v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"account_identifier"];
}

- (id)paymentApplication
{
  v3 = sub_1004B7E40(self);
  id v4 = [(SQLiteEntity *)self database];
  id v5 = +[PaymentApplication anyInDatabase:withTransactionSourcePID:](PaymentApplication, "anyInDatabase:withTransactionSourcePID:", v4, [v3 persistentID]);

  return v5;
}

- (id)transactionSourceIdentifier
{
  v2 = sub_1004B7E40(self);
  v3 = [v2 identifier];

  return v3;
}

- (id)dbPaymentTransactionArchive
{
  return +[PaymentTransactionArchive anyInDatabase:forTransaction:](PaymentTransactionArchive, "anyInDatabase:forTransaction:", self->super._database);
}

- (int64_t)transactionType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"transaction_type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)passUniqueIdentifier
{
  id v3 = [(PaymentTransaction *)self paymentApplication];
  [(SQLiteEntity *)self database];
  if (v3) {
    id v4 = {;
  }
    id v5 = +[Pass anyInDatabase:withPersistentID:](Pass, "anyInDatabase:withPersistentID:", v4, [v3 passPID]);

    id v6 = [v5 uniqueID];
  }
  else {
    uint64_t v7 = {;
  }
    id v8 = [(PaymentTransaction *)self transactionSourceIdentifier];
    id v5 = +[TransactionSource anyInDatabase:v7 withIdentifier:v8];

    id v9 = [(SQLiteEntity *)self database];
    id v10 = +[Pass anyInDatabase:withTransactionSourcePID:](Pass, "anyInDatabase:withTransactionSourcePID:", v9, [v5 persistentID]);

    id v6 = [v10 uniqueID];
  }
  return v6;
}

- (int64_t)accountType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"account_type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)transactionAuthenticationResult
{
  id v3 = (void *)sub_1004B822C();
  id v4 = objc_alloc_init((Class)PKTransactionAuthenticationResult);
  id v5 = [v3 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004B82E4;
  v12[3] = &unk_10072DDD8;
  v12[4] = self;
  id v13 = v3;
  id v6 = v4;
  id v14 = v6;
  id v7 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v12];

  id v8 = sub_1004B8350(self);
  [v6 setAuthenticationContext:v8];

  id v9 = v14;
  id v10 = v6;

  return v10;
}

+ (void)resetNeedsSyncWithFinanceForTransactionWithPID:(id)a3 updateSequenceNumber:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004B8688;
  v10[3] = &unk_10073DBA0;
  id v11 = a5;
  id v12 = v7;
  int64_t v13 = a4;
  id v8 = v7;
  id v9 = v11;
  sub_10000817C((uint64_t)v9, v10);
}

+ (BOOL)setNeedsSyncWithFinanceForAllTransactionsInDatabase:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004B881C;
  v6[3] = &unk_100755030;
  id v9 = a1;
  id v3 = a3;
  id v7 = v3;
  id v8 = &v10;
  sub_10000817C((uint64_t)v3, v6);
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

+ (void)setNeedsSyncWithFinanceForTransactionsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004B89F4;
  v9[3] = &unk_10073DBA0;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_10000817C((uint64_t)v7, v9);
}

+ (id)transactionsThatNeedSyncToFinanceWithAccountIdentifiers:(id)a3 withLimit:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v27 = a5;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = sub_1004A6F64((uint64_t)a1, *(void **)(*((void *)&v28 + 1) + 8 * i));
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  id v25 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v8];
  CFStringRef v24 = +[SQLiteComparisonPredicate predicateWithProperty:@"needs_sync_to_finance" equalToValue:&off_10078BAF0];
  id v15 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_type" notEqualToValue:&off_10078BA90];
  int v16 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"currency_code"];
  unint64_t v17 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"identifier"];
  v32[0] = v24;
  v32[1] = v25;
  v32[2] = v15;
  v32[3] = v16;
  void v32[4] = v17;
  __int16 v18 = +[NSArray arrayWithObjects:v32 count:5];
  id v19 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v18];

  uint64_t v20 = +[SQLiteEntity queryWithDatabase:v27 predicate:v19 orderingProperties:0 orderingDirections:0 limit:a4];
  id v21 = sub_1004B76BC([PaymentTransactionDeserializationContext alloc], 0);
  uint64_t v22 = sub_1004B8E14(v21, v20);
  sub_1004B7B54((uint64_t)v21, v27);

  return v22;
}

@end