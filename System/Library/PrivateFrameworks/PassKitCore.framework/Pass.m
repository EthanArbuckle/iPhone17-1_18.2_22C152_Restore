@interface Pass
+ (id)_copyPropertiesForPass;
+ (id)_dynamicStateInDatabase:(id)a3 forPassPID:(int64_t)a4;
+ (id)_insertionDictionaryWithPass:(id)a3 passType:(id)a4;
+ (id)_predicateForPassAnnotationState:(int64_t)a3;
+ (id)_propertySettersForDisplayProfile;
+ (id)_propertySettersForGroupingProfile;
+ (id)_propertySettersForPass;
+ (id)_propertySettersForUpdateContext;
+ (id)_realPassInDatabase:(id)a3 withProperties:(id)a4 values:(const void *)a5 fromPass:(id)a6;
+ (id)_realPassPredicateForPredicate:(id)a3;
+ (id)_realPassesInDatabase:(id)a3 states:(id *)a4 predicate:(id)a5 orderedBy:(id)a6;
+ (id)_updateDictionaryWithDisplayProfile:(id)a3;
+ (id)_updateDictionaryWithPass:(id)a3;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)anyInDatabase:(id)a3 withAssociatedAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withGroup:(id)a4;
+ (id)anyInDatabase:(id)a3 withNotificationService:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serialNumber:(id)a5;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withPrimaryAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withProvisioningCredentialHash:(id)a4;
+ (id)anyInDatabase:(id)a3 withReaderIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4;
+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4;
+ (id)anyInDatabase:(id)a3 withWebService:(id)a4;
+ (id)anyInDatabase:(id)a3 withWebService:(id)a4 serialNumber:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)candidatePassesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)databaseTable;
+ (id)dynamicStateInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (id)dynamicStatesInDatabase:(id)a3 forPassUniqueIDs:(id)a4;
+ (id)insertPass:(id)a3 withPassType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9;
+ (id)passStylesInDatabase:(id)a3;
+ (id)passUniqueIDsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)passesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)passesInDatabase:(id)a3 states:(id *)a4 matchingPredicate:(id)a5;
+ (id)predicateForAssociatedAccountIdentifier:(id)a3;
+ (id)predicateForAssociatedPassTypeIdentifierHash:(id)a3;
+ (id)predicateForExpired;
+ (id)predicateForGroup:(id)a3;
+ (id)predicateForHasAnyWebService;
+ (id)predicateForHasVPANID;
+ (id)predicateForHasValidNFCPayload;
+ (id)predicateForInMainStack;
+ (id)predicateForIsCloudKitArchived:(BOOL)a3;
+ (id)predicateForIsCloudKitSecurelyArchived:(BOOL)a3;
+ (id)predicateForIsRevoked:(BOOL)a3;
+ (id)predicateForIssuerCountryCodes:(id)a3;
+ (id)predicateForManuallyRecovered;
+ (id)predicateForNFCPayloadState:(unint64_t)a3;
+ (id)predicateForNotificationService:(id)a3;
+ (id)predicateForPassType:(id)a3;
+ (id)predicateForPassTypeIdentifier:(id)a3;
+ (id)predicateForPassTypeIdentifierHash:(id)a3;
+ (id)predicateForPaymentApplicationAppletDataFormatPrefix:(id)a3;
+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifier:(id)a4;
+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifiers:(id)a4;
+ (id)predicateForPaymentApplicationNetworks:(id)a3;
+ (id)predicateForPaymentApplicationSecureElementIdentifier:(id)a3;
+ (id)predicateForPaymentApplicationSecureElementIdentifiers:(id)a3;
+ (id)predicateForPaymentApplicationState:(int64_t)a3;
+ (id)predicateForPaymentApplicationStates:(id)a3;
+ (id)predicateForPaymentApplicationSupportsContactlessPayment:(BOOL)a3;
+ (id)predicateForPaymentApplicationSupportsInAppPayment:(BOOL)a3;
+ (id)predicateForPaymentCardType:(int64_t)a3;
+ (id)predicateForPaymentType:(unint64_t)a3;
+ (id)predicateForPersistentID:(int64_t)a3;
+ (id)predicateForPrimaryAccountIdentifier:(id)a3;
+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3;
+ (id)predicateForProvisioningCredentialHash:(id)a3;
+ (id)predicateForReaderIds:(id)a3;
+ (id)predicateForSerialNumber:(id)a3;
+ (id)predicateForStagedForExpiration;
+ (id)predicateForStyle:(int64_t)a3;
+ (id)predicateForSupportsDefaultCardSelection:(BOOL)a3;
+ (id)predicateForSupportsIssuerBinding:(BOOL)a3;
+ (id)predicateForTCIs:(id)a3;
+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3;
+ (id)predicateForUniqueID:(id)a3;
+ (id)predicateForUniqueIDs:(id)a3;
+ (id)predicateForValidStyle;
+ (id)predicateForWebService:(id)a3;
+ (id)queryWithDatabase:(id)a3 group:(id)a4;
+ (id)queryWithDatabase:(id)a3 passType:(id)a4;
+ (id)secureElementCardTypesInDatabase:(id)a3;
+ (id)unexpiredPassStylesInDatabase:(id)a3;
+ (id)unexpiredSecureElementCardTypesInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)enumerateOrganizationNamesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassSyncabilityPropertiesInDatabase:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassUniqueIDsAndTypesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassesAndGroupingProfilesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumerateUpdateContextsForQuery:(id)a3 withHandler:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)revoked;
- (BOOL)supportsIssuerBinding;
- (BOOL)voided;
- (Pass)initWithPass:(id)a3 passType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9;
- (id)_realPass;
- (id)_updatePassTileDescriptor:(id)a3 groupDescriptor:(id)a4 idx:(unint64_t)a5 previousStates:(id)a6 visitedIdentifiers:(id)a7;
- (id)associatedAccountIdentifier;
- (id)associatedApplicationIdentifiers;
- (id)associatedPassTypeIdentifiers;
- (id)authenticationToken;
- (id)defaultPaymentApplication;
- (id)displayProfile;
- (id)expirationDate;
- (id)group;
- (id)groupingProfile;
- (id)messageService;
- (id)pass;
- (id)passMessageService;
- (id)passNotificationServiceForType:(unint64_t)a3;
- (id)passTransactionService;
- (id)passType;
- (id)primaryAccountIdentifier;
- (id)serialNumber;
- (id)signingDate;
- (id)transactionService;
- (id)transactionSourceIdentifier;
- (id)uniqueID;
- (id)updateContext;
- (id)webService;
- (int64_t)passStyle;
- (int64_t)sortingState;
- (unint64_t)associatedAccountFeatureIdentifier;
- (unint64_t)passFlavor;
- (void)_updateSortingStateIfNecessary;
- (void)_updateWithMessageService:(id)a3;
- (void)_updateWithPassMessageService:(id)a3;
- (void)_updateWithPassTransactionService:(id)a3;
- (void)_updateWithTransactionService:(id)a3;
- (void)_updateWithWebService:(id)a3;
- (void)getPushRegistrationStatus:(unint64_t *)a3 date:(id *)a4;
- (void)udpateWithCloudKitMetadata:(id)a3;
- (void)udpateWithCloudKitSecureMetadata:(id)a3;
- (void)udpateWithIsCloudKitArchived:(BOOL)a3;
- (void)udpateWithIsCloudKitSecurelyArchived:(BOOL)a3;
- (void)updateBackgroundColorWithPass:(id)a3;
- (void)updateLocationsWithPass:(id)a3;
- (void)updateTallCodeValueWithPass:(id)a3;
- (void)updateWithAssociatedAccountIdentifier:(id)a3;
- (void)updateWithAssociatedApplicationIdentifiers:(id)a3;
- (void)updateWithAssociatedPassTypeIdentifiers:(id)a3;
- (void)updateWithAssociatedWebDomains:(id)a3;
- (void)updateWithBeacons:(id)a3;
- (void)updateWithContactlessActivationGroupingType:(unint64_t)a3;
- (void)updateWithDaemonPassData:(id)a3;
- (void)updateWithDefaultPaymentApplication:(id)a3;
- (void)updateWithGroup:(id)a3;
- (void)updateWithIngestedDate:(id)a3;
- (void)updateWithLastModifiedSource:(int64_t)a3;
- (void)updateWithLastModifiedTag:(id)a3;
- (void)updateWithNFCPayload:(id)a3;
- (void)updateWithPass:(id)a3 webService:(id)a4 transactionSevice:(id)a5 messageService:(id)a6 daemonPassData:(id)a7;
- (void)updateWithPassDisplayProfile:(id)a3;
- (void)updateWithPassTileDescriptors:(id)a3;
- (void)updateWithPaymentApplications:(id)a3;
- (void)updateWithProvisioningMetadata:(id)a3;
- (void)updateWithPushRegistrationStatus:(int64_t)a3 date:(id)a4;
- (void)updateWithRelevantDates:(id)a3;
- (void)updateWithRevocationStatus:(BOOL)a3;
- (void)updateWithSecureElementPassFields:(id)a3;
- (void)updateWithShareBundle:(id)a3;
- (void)updateWithSortingState:(int64_t)a3 forSortingReason:(int64_t)a4;
- (void)updateWithSupportsIssuerBinding:(BOOL)a3;
- (void)updateWithTransactionSourcePID:(int64_t)a3;
@end

@implementation Pass

+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3
{
  v3 = +[NSNumber numberWithInt:!a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.auxiliary_application" equalToValue:v3];

  return v4;
}

+ (void)enumeratePassesForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _propertySettersForGroupingProfile];
  v9 = [v8 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017894;
  v12[3] = &unk_100735068;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v11 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];
}

+ (id)predicateForPaymentApplicationStates:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.state", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13 equalToValue];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];

  return v11;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (([v11 isEqualToString:@"pass_type.identifier"] & 1) != 0
    || ([v11 isEqualToString:@"pass_type.team_identifier"] & 1) != 0
    || [v11 isEqualToString:@"pass_type.identifier_hash"])
  {
    [v5 addObject:@"JOIN pass_type ON pass_type.pid = pass.pass_type_pid"];
  }
  if ([v11 isEqualToString:@"web_service.service_url"]) {
    [v5 addObject:@"LEFT OUTER JOIN web_service ON web_service.pid = pass.web_service_pid"];
  }
  if (([v11 isEqualToString:@"pass_group.group_order"] & 1) != 0
    || [v11 isEqualToString:@"pass_group.pass_style"])
  {
    [v5 addObject:@"JOIN pass_group ON pass_group.pid = pass.group_pid"];
  }
  if (([v11 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.seid"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.state"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.auxiliary_application"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.payment_network_identifier"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.supports_contactless_payment"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.supports_in_app_payment"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.payment_type"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.applet_data_format"] & 1) != 0
    || [v11 isEqualToString:@"payment_application.i"])
  {
    [v5 addObject:@"JOIN payment_application ON payment_application.pass_pid = pass.pid"];
  }
  if (([v11 isEqualToString:@"payment_automatic_selection_criterion_tci.tci"] & 1) != 0
    || ([v11 isEqualToString:@"payment_automatic_selection_criterion_reader_id.reader_id"] & 1) != 0|| objc_msgSend(v11, "isEqualToString:", @"associated_reader_id.reader_id"))
  {
    [v5 addObject:@"JOIN payment_automatic_selection_criterion ON payment_automatic_selection_criterion.payment_application_pid = payment_application.pid JOIN payment_automatic_selection_criterion_tci ON payment_automatic_selection_criterion_tci.payment_automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid LEFT JOIN payment_automatic_selection_criterion_reader_id ON payment_automatic_selection_criterion_reader_id.payment_automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid LEFT JOIN associated_reader_id ON associated_reader_id.automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid"];
  }
  if ([v11 isEqualToString:@"pass_notification_service.notification_service_pid"]) {
    [v5 addObject:@"JOIN pass_notification_service ON (pass_notification_service.pid = pass_transaction_service_pid OR pass_notification_service.pid = pass_message_service_pid)"];
  }
  if (([v11 isEqualToString:@"nfc.message"] & 1) != 0
    || ([v11 isEqualToString:@"nfc.encryption_public_key"] & 1) != 0
    || [v11 isEqualToString:@"nfc.a"])
  {
    [v5 addObject:@"LEFT OUTER JOIN nfc ON nfc.pass_pid = pass.pid"];
  }
  if ([v11 isEqualToString:@"associated_pass_type_identifier.identifier_hash"]) {
    [v5 addObject:@"JOIN associated_pass_type_identifier ON associated_pass_type_identifier.pass_pid = pass.pid"];
  }
  if ([v11 isEqualToString:@"transaction_source.identifier"]) {
    [v5 addObject:@"LEFT JOIN transaction_source ON transaction_source.pid = pass.transaction_source_pid"];
  }
  id v6 = +[PassAnnotations databaseTable];
  id v7 = [v11 rangeOfString:v6];
  if (v8)
  {
    if (!v7)
    {
      unint64_t v9 = v8;
      if ((unint64_t)[v11 length] > v8
        && [v11 characterAtIndex:v9] == 46)
      {
        id v10 = +[NSString stringWithFormat:@"JOIN %@ ON %@.%@ = pass.pid", v6, v6, @"pass_pid"];
        [v5 addObject:v10];
      }
    }
  }
}

+ (id)databaseTable
{
  return @"pass";
}

- (BOOL)voided
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"voided"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)sortingState
{
  unsigned __int8 v3 = +[PassAnnotations databaseTable];
  v4 = +[NSString stringWithFormat:@"%@.%@", v3, @"sorting_state"];

  id v5 = [(SQLiteEntity *)self valueForProperty:v4];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (id)signingDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"signing_date"];
  unsigned __int8 v3 = (void *)_DateForSQLValue();

  return v3;
}

- (int64_t)passStyle
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"pass_group.pass_style"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)expirationDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"expiration_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

+ (id)_dynamicStateInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithPersistentID:a4 inDatabase:v6];
  unint64_t v8 = objc_alloc_init(PassDynamicState);
  unint64_t v9 = +[PassLiveRender passLiveRenderInDatabase:v6 forPass:v7];
  id v10 = [v9 passLiveRender];
  [(PassDynamicState *)v8 setLiveRender:v10];

  id v11 = objc_alloc((Class)PKPassBalanceModel);
  v12 = +[PaymentBalance paymentBalancesInDatabase:v6 forPass:v7];
  id v13 = [v11 initWithBalances:v12];
  [(PassDynamicState *)v8 setBalanceModel:v13];

  long long v14 = +[PassRelevancyModel passRelevancyModelInDatabase:v6 forPass:v7];

  long long v15 = [v14 passRelevancyModel];
  [(PassDynamicState *)v8 setRelevancyModel:v15];

  return v8;
}

+ (id)_realPassInDatabase:(id)a3 withProperties:(id)a4 values:(const void *)a5 fromPass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (!v12)
  {
    id v17 = 0;
    goto LABEL_19;
  }
  id v14 = [v12 persistentID];
  id v15 = +[NSNull null];
  id v16 = [v11 indexOfObject:@"pass_flavor"];
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v15) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v18 = (id)a5[(void)v16];
  if (v18 == v15)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v19 = v18;
  if (!v18)
  {
LABEL_10:
    id v21 = [v11 indexOfObject:@"pass_type.identifier"];
    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL) {
      v22 = 0;
    }
    else {
      v22 = (void *)a5[(void)v21];
    }
    id v19 = v22;
    if (v19 == v15)
    {

      id v19 = 0;
    }
    id v20 = (id)PKPassTypeForPassTypeIdentifier();
    goto LABEL_16;
  }
  id v20 = [v18 integerValue];
LABEL_16:
  id v23 = v20;

  id v17 = objc_alloc_init((Class)+[PKPass classForPassType:v23]);
  [v17 setPassType:v23];
  v24 = [a1 _propertySettersForPass];
  [a1 applyPropertySetters:v24 toObject:v17 withProperties:v11 values:a5];

  id v25 = objc_alloc_init((Class)PKPassDisplayProfile);
  v26 = [a1 _propertySettersForDisplayProfile];
  [a1 applyPropertySetters:v26 toObject:v25 withProperties:v11 values:a5];

  [v17 setDisplayProfile:v25];
  v28 = +[Location locationsInDatabase:v10 forPassPID:v14 withSourceType:0];
  [v17 setEmbeddedLocationsArray:v28];

  v29 = +[Beacon beaconsInDatabase:v10 forPassPID:v14];
  [v17 setEmbeddedBeacons:v29];

  v30 = +[NFC anyInDatabase:v10 forPassPID:v14];
  v31 = [v30 nfcPayload];
  [v17 setNFCPayload:v31];

  v32 = +[AssociatedPassTypeIdentifier associatedPassTypeIdentifiersInDatabase:v10 forPassPID:v14];
  [v17 setAssociatedPassTypeIdentifiers:v32];

  v33 = +[PassRelevancyDates relevancyDatesForPassPID:v14 inDatabase:v10];
  [v17 setRelevantDates:v33];

  if (v23 == (id)1)
  {
    v34 = +[PaymentApplication paymentApplicationsInDatabase:v10 forPassPID:v14];
    [v17 setPaymentApplications:v34];

    v35 = +[AssociatedApplicationIdentifier associatedApplicationIdentifiersInDatabase:v10 forPassPID:v14];
    [v17 setAssociatedApplicationIdentifiers:v35];

    v36 = +[AssociatedWebDomain associatedWebDomainsInDatabase:v10 forPassPID:v14];
    [v17 setAssociatedWebDomains:v36];

    objc_msgSend(v17, "setAssociatedAccountFeatureIdentifier:", objc_msgSend(v13, "associatedAccountFeatureIdentifier"));
    v37 = +[PassProvisioningMetadata provisioningMetadataForPassPID:v14 inDatabase:v10];
    [v17 setProvisioningMetadata:v37];
  }
LABEL_19:

  return v17;
}

+ (id)_propertySettersForPass
{
  v4[0] = @"unique_id";
  v4[1] = @"transaction_source.identifier";
  v5[0] = &stru_1007350D0;
  v5[1] = &stru_1007350F0;
  v4[2] = @"pass_type.identifier";
  v4[3] = @"pass_type.team_identifier";
  v5[2] = &stru_100735110;
  v5[3] = &stru_100735130;
  v4[4] = @"serial_number";
  v4[5] = @"sequence_counter";
  v5[4] = &stru_100735150;
  v5[5] = &stru_100735170;
  v4[6] = @"authentication_token";
  v4[7] = @"organization_name";
  v5[6] = &stru_100735190;
  v5[7] = &stru_1007351B0;
  v4[8] = @"expiration_date";
  v4[9] = @"voided";
  v5[8] = &stru_1007351D0;
  v5[9] = &stru_1007351F0;
  v4[10] = @"web_service.service_url";
  v4[11] = @"user_info";
  v5[10] = &stru_100735210;
  v5[11] = &stru_100735230;
  v4[12] = @"provisioning_credential_hash";
  v4[13] = @"manifest_hash";
  v5[12] = &stru_100735250;
  v5[13] = &stru_100735270;
  v4[14] = @"share_count";
  v4[15] = @"sharing_method";
  v5[14] = &stru_100735290;
  v5[15] = &stru_1007352B0;
  v4[16] = @"sharing_url";
  v4[17] = @"sharing_text";
  v5[16] = &stru_1007352D0;
  v5[17] = &stru_1007352F0;
  v4[18] = @"ingested_date";
  v4[19] = @"signing_date";
  v5[18] = &stru_100735310;
  v5[19] = &stru_100735330;
  v4[20] = @"modified_date";
  v4[21] = @"revoked";
  v5[20] = &stru_100735350;
  v5[21] = &stru_100735370;
  v4[22] = @"has_stored_value";
  v4[23] = @"live_render_background_type";
  v5[22] = &stru_100735390;
  v5[23] = &stru_1007353B0;
  v4[24] = @"f";
  v4[25] = @"b";
  v5[24] = &stru_1007353D0;
  v5[25] = &stru_1007353F0;
  v4[26] = @"live_rendering_requires_enablement";
  v4[27] = @"mute_ready_for_use_notification";
  v5[26] = &stru_100735410;
  v5[27] = &stru_100735430;
  v4[28] = @"pass_flavor";
  v4[29] = @"card_type";
  v5[28] = &stru_100735450;
  v5[29] = &stru_100735470;
  v4[30] = @"primary_account_identifier";
  v4[31] = @"primary_account_suffix";
  v5[30] = &stru_100735490;
  v5[31] = &stru_1007354B0;
  v4[32] = @"sanitized_pan";
  v4[33] = @"c";
  v5[32] = &stru_1007354D0;
  v5[33] = &stru_1007354F0;
  v4[34] = @"supports_dpan_notifications";
  v4[35] = @"supports_fpan_notifications";
  v5[34] = &stru_100735510;
  v5[35] = &stru_100735530;
  v4[36] = @"supports_default_card_selection";
  v4[37] = @"is_shell_pass";
  v5[36] = &stru_100735550;
  v5[37] = &stru_100735570;
  v4[38] = @"supports_serial_number_based_provisioning";
  v4[39] = @"requires_transfer_serial_number_based_provisioning";
  v5[38] = &stru_100735590;
  v5[39] = &stru_1007355B0;
  v4[40] = @"has_associated_peer_payment_account";
  v4[41] = @"a";
  v5[40] = &stru_1007355D0;
  v5[41] = &stru_1007355F0;
  v4[42] = @"contactless_activation_grouping_type";
  v4[43] = @"cobranded";
  v5[42] = &stru_100735610;
  v5[43] = &stru_100735630;
  v4[44] = @"issuer_country_code";
  v4[45] = @"d";
  v5[44] = &stru_100735650;
  v5[45] = &stru_100735670;
  v4[46] = @"g";
  v4[47] = @"e";
  v5[46] = &stru_100735690;
  v5[47] = &stru_1007356B0;
  v4[48] = @"is_cloud_kit_archived";
  v4[49] = @"cloud_kit_metadata";
  v5[48] = &stru_1007356D0;
  v5[49] = &stru_1007356F0;
  v4[50] = @"is_cloud_kit_securely_archived";
  v4[51] = @"cloud_kit_secure_metadata";
  v5[50] = &stru_100735710;
  v5[51] = &stru_100735730;
  v4[52] = @"shipping_address_seed";
  v4[53] = @"original_provisioning_date";
  v5[52] = &stru_100735750;
  v5[53] = &stru_100735770;
  v4[54] = @"transfer_url";
  v4[55] = @"sell_url";
  v5[54] = &stru_100735790;
  v5[55] = &stru_1007357B0;
  v4[56] = @"bag_policy_url";
  v4[57] = @"order_food_url";
  v5[56] = &stru_1007357D0;
  v5[57] = &stru_1007357F0;
  v4[58] = @"transit_information_url";
  v4[59] = @"parking_information_url";
  v5[58] = &stru_100735810;
  v5[59] = &stru_100735830;
  v4[60] = @"directions_information_url";
  v4[61] = @"merchandise_url";
  v5[60] = &stru_100735850;
  v5[61] = &stru_100735870;
  v4[62] = @"accessibility_url";
  v4[63] = @"purchase_parking_url";
  v5[62] = &stru_100735890;
  v5[63] = &stru_1007358B0;
  v4[64] = @"add_on_url";
  v5[64] = &stru_1007358D0;
  v4[65] = @"contact_venue_phone_number";
  v5[65] = &stru_1007358F0;
  v4[66] = @"contact_venue_email";
  v5[66] = &stru_100735910;
  v4[67] = @"contact_venue_website";
  v5[67] = &stru_100735930;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:68];
  return v2;
}

+ (id)_propertySettersForDisplayProfile
{
  v4[0] = @"template";
  v4[1] = @"background_color";
  v5[0] = &stru_100735970;
  v5[1] = &stru_100735990;
  v4[2] = @"secondary_background_color";
  v4[3] = @"foreground_color";
  v5[2] = &stru_1007359B0;
  v5[3] = &stru_1007359D0;
  v4[4] = @"label_color";
  v4[5] = @"strip_color";
  v5[4] = &stru_1007359F0;
  v5[5] = &stru_100735A10;
  v4[6] = @"manifest_hash";
  v4[7] = @"tall_code";
  v5[6] = &stru_100735A30;
  v5[7] = &stru_100735A50;
  v4[8] = @"has_background_image";
  v4[9] = @"has_strip_image";
  v5[8] = &stru_100735A70;
  v5[9] = &stru_100735A90;
  v4[10] = @"supports_automatic_foreground_vibrancy";
  v4[11] = @"supports_automatic_label_vibrancy";
  v5[10] = &stru_100735AB0;
  v5[11] = &stru_100735AD0;
  v4[12] = @"suppress_header_darkening";
  v4[13] = @"footer_background_color";
  v5[12] = &stru_100735AF0;
  v5[13] = &stru_100735B10;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];
  return v2;
}

- (unint64_t)associatedAccountFeatureIdentifier
{
  if ([(Pass *)self hasAssociatedPeerPaymentAccount]) {
    return 1;
  }
  v4 = [(Pass *)self associatedAccountIdentifier];
  if (v4)
  {
    id v5 = [(SQLiteEntity *)self database];
    id v6 = +[Account anyInDatabase:v5 withIdentifier:v4];

    if (v6) {
      id v3 = [v6 feature];
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return (unint64_t)v3;
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"has_associated_peer_payment_account"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)associatedAccountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"a"];
}

+ (id)predicateForInMainStack
{
  return _[a1 _predicateForPassAnnotationState:0];
}

+ (id)_predicateForPassAnnotationState:(int64_t)a3
{
  v4 = +[PassAnnotations databaseTable];
  id v5 = +[NSString stringWithFormat:@"%@.%@", v4, @"sorting_state"];

  id v6 = +[NSNumber numberWithInteger:a3];
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:v5 equalToValue:v6];

  return v7;
}

+ (id)passesInDatabase:(id)a3 states:(id *)a4 matchingPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v11 = objc_alloc((Class)NSSet);
  id v12 = [a1 _realPassesInDatabase:v8 states:a4 predicate:v9 orderedBy:0];
  id v13 = [v11 initWithArray:v12];

  return v13;
}

+ (id)_realPassesInDatabase:(id)a3 states:(id *)a4 predicate:(id)a5 orderedBy:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = [a1 _realPassPredicateForPredicate:v12];

  v29 = v11;
  id v15 = [a1 queryWithDatabase:v10 predicate:v14 orderingProperties:v11];
  unsigned __int8 v16 = +[PKSecureElement isInFailForward];
  id v17 = objc_alloc_init((Class)NSMutableSet);
  if (a4) {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
  }
  else {
    id v18 = 0;
  }
  id v19 = [a1 _copyPropertiesForPass];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001A98C;
  v30[3] = &unk_100734F78;
  id v20 = v17;
  id v31 = v20;
  id v35 = a1;
  id v21 = v10;
  id v32 = v21;
  unsigned __int8 v36 = v16;
  id v22 = v13;
  id v33 = v22;
  id v23 = v18;
  id v34 = v23;
  [v15 enumeratePersistentIDsAndProperties:v19 usingBlock:v30];

  if (a4)
  {
    id v24 = [v23 copy];
    id v25 = *a4;
    *a4 = v24;
  }
  id v26 = [v22 copy];

  return v26;
}

+ (id)passUniqueIDsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v8 = [a1 _realPassPredicateForPredicate:a4];
  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v10 = [a1 queryWithDatabase:v6 predicate:v8];
  CFStringRef v17 = @"unique_id";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017488;
  v15[3] = &unk_100731258;
  id v16 = v9;
  id v12 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = [v12 copy];

  return v13;
}

+ (id)_realPassPredicateForPredicate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    id v6 = [a1 predicateForValidStyle];
    v10[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v10 count:2];
    id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];
  }
  else
  {
    id v8 = [a1 predicateForValidStyle];
  }

  return v8;
}

+ (id)predicateForValidStyle
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"template" lessThanValue:&off_10078AAE8];
}

+ (id)_copyPropertiesForPass
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = [a1 _propertySettersForPass];
  id v6 = [v5 allKeys];
  [v4 addObjectsFromArray:v6];

  id v7 = [a1 _propertySettersForDisplayProfile];
  id v8 = [v7 allKeys];
  [v4 addObjectsFromArray:v8];

  id v9 = objc_msgSend(v4, "pk_arrayCopy");
  return v9;
}

+ (id)predicateForStagedForExpiration
{
  return _[a1 _predicateForPassAnnotationState:3];
}

+ (id)predicateForPaymentApplicationSecureElementIdentifiers:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"payment_application.seid" equalToValues:a3];
}

+ (id)passesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  return [a1 passesInDatabase:a3 states:0 matchingPredicate:a4];
}

+ (id)_propertySettersForGroupingProfile
{
  v4[0] = @"pass_type.identifier";
  v4[1] = @"grouping_id";
  v5[0] = &stru_100735C50;
  v5[1] = &stru_100735C70;
  v4[2] = @"template";
  v4[3] = @"ingested_date";
  v5[2] = &stru_100735C90;
  v5[3] = &stru_100735CB0;
  v4[4] = @"nfc.message";
  v5[4] = &stru_100735CD0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3
    || (Class)objc_opt_class() == a3)
  {
    return @"pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"web_service_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transaction_source_pid";
  }
  return 0;
}

+ (id)_insertionDictionaryWithPass:(id)a3 passType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [v6 uniqueID];
  [v7 setObjectOrNull:v8 forKey:@"unique_id"];

  id v9 = [v6 serialNumber];
  [v7 setObjectOrNull:v9 forKey:@"serial_number"];

  id v10 = [v5 persistentID];
  [v7 setLongLong:v10 forKey:@"pass_type_pid"];
  id v11 = [v6 groupingID];
  [v7 setObjectOrNull:v11 forKey:@"grouping_id"];

  id v12 = [v6 provisioningCredentialHash];
  [v7 setObjectOrNull:v12 forKey:@"provisioning_credential_hash"];

  id v13 = +[NSDate date];
  [v7 setObject:v13 forKey:@"ingested_date"];

  id v14 = [v6 signingDate];

  [v7 setObjectOrNull:v14 forKey:@"signing_date"];
  return v7;
}

+ (id)_updateDictionaryWithPass:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 organizationName];
  [v4 setObjectOrNull:v5 forKey:@"organization_name"];

  id v6 = [v3 expirationDate];
  [v4 setObjectOrNull:v6 forKey:@"expiration_date"];

  id v7 = [v3 sequenceCounter];
  [v4 setObjectOrNull:v7 forKey:@"sequence_counter"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isVoided"), @"voided");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasStoredValue"), @"has_stored_value");
  [v3 liveRenderType];
  id v8 = PKPassLiveRenderTypeToString();
  [v4 setObjectOrNull:v8 forKey:@"live_render_background_type"];

  [v3 homeKeyLiveRenderType];
  id v9 = PKPassHomeKeyLiveRenderTypeToString();
  [v4 setObjectOrNull:v9 forKey:@"f"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsCategoryVisualization"), @"b");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "liveRenderingRequiresEnablement"), @"live_rendering_requires_enablement");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "muteReadyForUseNotification"), @"mute_ready_for_use_notification");
  id v10 = [v3 userInfo];
  if (+[NSJSONSerialization isValidJSONObject:v10])
  {
    id v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:0];
    [v4 setObjectOrNull:v11 forKey:@"user_info"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"user_info"];
  }
  id v12 = [v3 manifestHash];
  [v4 setObjectOrNull:v12 forKey:@"manifest_hash"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "sharingMethod"), @"sharing_method");
  id v13 = [v3 sharingURL];
  id v14 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v14 forKey:@"sharing_url"];

  id v15 = [v3 sharingText];
  [v4 setObjectOrNull:v15 forKey:@"sharing_text"];

  id v16 = [v3 authenticationToken];
  [v4 setObjectOrNull:v16 forKey:@"authentication_token"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "passType"), @"pass_flavor");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isCloudKitArchived"), @"is_cloud_kit_archived");
  CFStringRef v17 = [v3 cloudKitMetadata];
  [v4 setObjectOrNull:v17 forKey:@"cloud_kit_metadata"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isCloudKitSecurelyArchived"), @"is_cloud_kit_securely_archived");
  id v18 = [v3 cloudKitSecureMetadata];
  [v4 setObjectOrNull:v18 forKey:@"cloud_kit_secure_metadata"];

  id v19 = [v3 provisioningCredentialHash];
  [v4 setObjectOrNull:v19 forKey:@"provisioning_credential_hash"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsIssuerBinding"), @"supports_issuer_binding");
  id v20 = [v3 transferURL];
  id v21 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v21 forKey:@"transfer_url"];

  id v22 = [v3 sellURL];
  id v23 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v23 forKey:@"sell_url"];

  id v24 = [v3 bagPolicyURL];
  id v25 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v25 forKey:@"bag_policy_url"];

  id v26 = [v3 orderFoodURL];
  v27 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v27 forKey:@"order_food_url"];

  v28 = [v3 transitInformationURL];
  v29 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v29 forKey:@"transit_information_url"];

  v30 = [v3 parkingInformationURL];
  id v31 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v31 forKey:@"parking_information_url"];

  id v32 = [v3 directionsInformationURL];
  id v33 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v33 forKey:@"directions_information_url"];

  id v34 = [v3 merchandiseURL];
  id v35 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v35 forKey:@"merchandise_url"];

  unsigned __int8 v36 = [v3 accessibilityURL];
  v37 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v37 forKey:@"accessibility_url"];

  v38 = [v3 purchaseParkingURL];
  v39 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v39 forKey:@"purchase_parking_url"];

  v40 = [v3 partnerAddOnURL];
  v41 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v41 forKey:@"add_on_url"];

  v42 = [v3 contactVenuePhoneNumber];
  v43 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v43 forKey:@"contact_venue_phone_number"];

  v44 = [v3 contactVenueEmail];
  v45 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v45 forKey:@"contact_venue_email"];

  v46 = [v3 contactVenueWebsite];
  v47 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v47 forKey:@"contact_venue_website"];

  if ([v3 passType] == (id)1)
  {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "cardType"), @"card_type");
    v48 = [v3 primaryAccountIdentifier];
    [v4 setObjectOrNull:v48 forKey:@"primary_account_identifier"];

    v49 = [v3 primaryAccountNumberSuffix];
    [v4 setObjectOrNull:v49 forKey:@"primary_account_suffix"];

    v50 = [v3 sanitizedPrimaryAccountNumber];
    [v4 setObjectOrNull:v50 forKey:@"sanitized_pan"];

    v51 = [v3 sanitizedPrimaryAccountName];
    [v4 setObjectOrNull:v51 forKey:@"c"];

    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsDPANNotifications"), @"supports_dpan_notifications");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsFPANNotifications"), @"supports_fpan_notifications");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsDefaultCardSelection"), @"supports_default_card_selection");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isShellPass"), @"is_shell_pass");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsSerialNumberBasedProvisioning"), @"supports_serial_number_based_provisioning");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "requiresTransferSerialNumberBasedProvisioning"), @"requires_transfer_serial_number_based_provisioning");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasAssociatedPeerPaymentAccount"), @"has_associated_peer_payment_account");
    v52 = [v3 associatedAccountServiceAccountIdentifier];
    [v4 setObjectOrNull:v52 forKey:@"a"];

    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "contactlessActivationGroupingType"), @"contactless_activation_grouping_type");
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isCobranded"), @"cobranded");
    v53 = [v3 issuerCountryCode];
    [v4 setObjectOrNull:v53 forKey:@"issuer_country_code"];

    v54 = [v3 issuerAdministrativeAreaCode];
    [v4 setObjectOrNull:v54 forKey:@"d"];

    v55 = [v3 identityAccountKeyIdentifier];
    [v4 setObjectOrNull:v55 forKey:@"g"];

    v56 = [v3 partnerAccountIdentifier];
    [v4 setObjectOrNull:v56 forKey:@"e"];

    v57 = [v3 shippingAddressSeed];
    [v4 setObjectOrNull:v57 forKey:@"shipping_address_seed"];

    v58 = [v3 originalProvisioningDate];
    v59 = (void *)_SQLValueForDate();
    [v4 setObjectOrNull:v59 forKey:@"original_provisioning_date"];
  }
  return v4;
}

+ (id)_updateDictionaryWithDisplayProfile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 backgroundColor];
  id v6 = [v5 string];
  [v4 setObjectOrNull:v6 forKey:@"background_color"];

  id v7 = [v3 secondaryBackgroundColor];
  id v8 = [v7 string];
  [v4 setObjectOrNull:v8 forKey:@"secondary_background_color"];

  id v9 = [v3 foregroundColor];
  id v10 = [v9 string];
  [v4 setObjectOrNull:v10 forKey:@"foreground_color"];

  id v11 = [v3 labelColor];
  id v12 = [v11 string];
  [v4 setObjectOrNull:v12 forKey:@"label_color"];

  id v13 = [v3 stripColor];
  id v14 = [v13 string];
  [v4 setObjectOrNull:v14 forKey:@"strip_color"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "passStyle"), @"template");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "tallCode"), @"tall_code");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasBackgroundImage"), @"has_background_image");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasStripImage"), @"has_strip_image");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsAutomaticForegroundVibrancy"), @"supports_automatic_foreground_vibrancy");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportsAutomaticLabelVibrancy"), @"supports_automatic_label_vibrancy");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "suppressesHeaderDarkening"), @"suppress_header_darkening");
  id v15 = [v3 footerBackgroundColor];

  id v16 = [v15 string];
  [v4 setObjectOrNull:v16 forKey:@"footer_background_color"];

  return v4;
}

- (Pass)initWithPass:(id)a3 passType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = +[Pass _insertionDictionaryWithPass:v15 passType:a4];
  v24.receiver = self;
  v24.super_class = (Class)Pass;
  id v22 = [(SQLiteEntity *)&v24 initWithPropertyValues:v21 inDatabase:v20];

  if (v22) {
    [(Pass *)v22 updateWithPass:v15 webService:v16 transactionSevice:v17 messageService:v18 daemonPassData:v19];
  }

  return v22;
}

+ (id)insertPass:(id)a3 withPassType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [objc_alloc((Class)a1) initWithPass:v22 passType:v21 webService:v20 transactionService:v19 messageService:v18 daemonPassData:v17 inDatabase:v16];

  return v23;
}

- (void)updateWithPass:(id)a3 webService:(id)a4 transactionSevice:(id)a5 messageService:(id)a6 daemonPassData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[Pass _updateDictionaryWithPass:v12];
  [(SQLiteEntity *)self setValuesWithDictionary:v17];

  id v18 = [v12 displayProfile];
  id v19 = +[Pass _updateDictionaryWithDisplayProfile:v18];
  [(SQLiteEntity *)self setValuesWithDictionary:v19];

  [(Pass *)self _updateWithWebService:v13];
  [(Pass *)self _updateWithTransactionService:v14];
  [(Pass *)self _updateWithMessageService:v15];
  [(Pass *)self updateLocationsWithPass:v12];
  id v21 = [v12 embeddedBeacons];
  [(Pass *)self updateWithBeacons:v21];

  id v22 = [v12 nfcPayload];
  [(Pass *)self updateWithNFCPayload:v22];

  id v23 = [v12 relevantDates];
  [(Pass *)self updateWithRelevantDates:v23];

  [(Pass *)self _updateSortingStateIfNecessary];
  objc_super v24 = [v12 associatedPassTypeIdentifiers];
  [(Pass *)self updateWithAssociatedPassTypeIdentifiers:v24];

  [(Pass *)self updateWithDaemonPassData:v16];
  if ([v12 passType] == (id)1)
  {
    id v25 = [v12 paymentApplications];
    [(Pass *)self updateWithPaymentApplications:v25];

    id v26 = [v12 associatedApplicationIdentifiers];
    [(Pass *)self updateWithAssociatedApplicationIdentifiers:v26];

    v27 = [v12 associatedWebDomains];
    [(Pass *)self updateWithAssociatedWebDomains:v27];

    v28 = [v12 provisioningMetadata];
    [(Pass *)self updateWithProvisioningMetadata:v28];

    v29 = [v12 auxiliaryRegistrationRequirements];
    v30 = [v29 allRequirements];
    +[PassAuxiliaryRegistrationRequirement insertOrUpdateAuxiliaryRegistrationRequirements:v30 passPID:self->super._persistentID inDatabase:self->super._database];

    id v31 = [(Pass *)self transactionSourceIdentifier];
    unsigned int v32 = [v12 supportsFPANNotifications];
    if (!v31 && v32)
    {
      id v33 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v12 uniqueID];
        int v36 = 138412290;
        v37 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Pass %@ did not have a transaction source, adding one now", (uint8_t *)&v36, 0xCu);
      }
      id v35 = +[TransactionSource insertTransactionSourceWithType:0 inDatabase:self->super._database];
      -[Pass updateWithTransactionSourcePID:](self, "updateWithTransactionSourcePID:", [v35 persistentID]);
    }
  }
}

- (void)updateWithPushRegistrationStatus:(int64_t)a3 date:(id)a4
{
  v10[0] = @"push_registration_status";
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  v10[1] = @"push_registration_date";
  v11[0] = v7;
  id v8 = (void *)_SQLValueForDate();

  v11[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(SQLiteEntity *)self setValuesWithDictionary:v9];
}

- (void)updateWithLastModifiedTag:(id)a3
{
}

- (void)updateWithLastModifiedSource:(int64_t)a3
{
  id v5 = +[NSDate date];
  id v7 = (id)_SQLValueForDate();

  [(SQLiteEntity *)self setValue:v7 forProperty:@"modified_date"];
  id v6 = +[NSNumber numberWithInteger:a3];
  [(SQLiteEntity *)self setValue:v6 forProperty:@"modified_source"];
}

- (void)updateLocationsWithPass:(id)a3
{
  id v17 = a3;
  id v4 = [(SQLiteEntity *)self database];
  id v5 = [v17 localLocationsURL];
  id v6 = +[LocationSource anyInDatabase:v4 withURL:v5];

  id v7 = [(SQLiteEntity *)self database];
  id v8 = +[PassLocationSource queryWithDatabase:passPID:locationSourcePID:](PassLocationSource, "queryWithDatabase:passPID:locationSourcePID:", v7, -[SQLiteEntity persistentID](self, "persistentID"), [v6 persistentID]);

  [v8 deleteAllEntities];
  if (v6) {
    [v6 deleteFromDatabase];
  }
  id v9 = [v17 localLocationsURL];

  if (v9)
  {
    id v10 = [v17 localLocationsURL];
    id v11 = [(SQLiteEntity *)self database];
    id v12 = +[LocationSource insertLocationSourceWithURL:v10 forPass:self type:0 inDatabase:v11];

    id v13 = objc_alloc((Class)NSSet);
    id v14 = [v17 embeddedLocationsArray];
    id v15 = [v13 initWithArray:v14];

    id v16 = [(SQLiteEntity *)self database];
    +[Location insertLocations:v15 forSource:v12 inDatabase:v16];
  }
}

- (void)updateBackgroundColorWithPass:(id)a3
{
  id v8 = [a3 displayProfile];
  id v4 = [v8 backgroundColor];
  id v5 = [v4 string];
  [(SQLiteEntity *)self setValue:v5 forProperty:@"background_color"];

  id v6 = [v8 secondaryBackgroundColor];
  id v7 = [v6 string];
  [(SQLiteEntity *)self setValue:v7 forProperty:@"secondary_background_color"];
}

- (void)updateTallCodeValueWithPass:(id)a3
{
  id v5 = [a3 displayProfile];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 tallCode]);
  [(SQLiteEntity *)self setValue:v4 forProperty:@"tall_code"];
}

- (void)updateWithNFCPayload:(id)a3
{
  id v11 = a3;
  id v4 = [(SQLiteEntity *)self database];
  id v5 = +[NFC anyInDatabase:v4 forPassPID:[(SQLiteEntity *)self persistentID]];

  unsigned int v6 = [(Pass *)self supportsIssuerBinding];
  if (((v5 == 0) & v6) != 0) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  if (((v5 == 0) & v6) == 0 && v6)
  {
    id v8 = [v5 nfcPayload];
    uint64_t v7 = (uint64_t)[v8 payloadState];
  }
  id v9 = [(SQLiteEntity *)self database];
  +[NFC deleteEntitiesForPass:self inDatabase:v9];

  if (v11)
  {
    id v10 = [(SQLiteEntity *)self database];
    +[NFC insertOrUpdateNFCPayload:v11 forPass:self computedPayloadState:v7 inDatabase:v10];
  }
}

- (void)updateWithRelevantDates:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  unsigned int v6 = [(SQLiteEntity *)self database];
  +[PassRelevancyDates deleteEntitiesForPassPID:v5 inDatabase:v6];

  id v7 = [(SQLiteEntity *)self database];
  +[PassRelevancyDates insertPassRelevancyDates:v4 forPassPID:v5 inDatabase:v7];
}

- (void)updateWithBeacons:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self database];
  +[Beacon deleteEntitiesForPass:self inDatabase:v5];

  id v6 = [(SQLiteEntity *)self database];
  +[Beacon insertBeacons:v4 forPass:self inDatabase:v6];
}

- (void)_updateWithWebService:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"web_service_pid"];
}

- (void)updateWithPaymentApplications:(id)a3
{
  id v4 = a3;
  id v5 = [(SQLiteEntity *)self database];
  +[PaymentApplication updatePaymentApplications:v4 forPass:self inDatabase:v5];
}

- (id)_updatePassTileDescriptor:(id)a3 groupDescriptor:(id)a4 idx:(unint64_t)a5 previousStates:(id)a6 visitedIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 metadata];
  id v17 = [v16 identifier];
  if (!v17
    || ([v15 containsObject:v17] & 1) != 0
    || (unsigned __int8 v18 = [v16 isGroupType], v13) && (v18 & 1) != 0)
  {
    id v19 = 0;
  }
  else
  {
    [v15 addObject:v17];
    id v21 = [v14 objectForKeyedSubscript:v17];
    id v22 = [v16 type];
    if (!v21 || [v21 type] != v22)
    {
      id v23 = [objc_alloc((Class)PKPassTileDescriptorState) initForType:v22];

      id v21 = v23;
    }
    id v19 = +[TileDescriptor insertDescriptor:v12 groupDescriptor:v13 withState:v21 order:a5 forPass:self inDatabase:self->super._database];
  }
  return v19;
}

- (void)updateWithPassTileDescriptors:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = +[TileDescriptorState statesInDatabase:self->super._database forPassPID:v5];
  +[TileDescriptor deleteEntitiesForPassPID:v5 inDatabase:self->super._database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DCA34;
  v9[3] = &unk_100734F28;
  v9[4] = self;
  id v10 = v6;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  id v7 = v11;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v9];
}

- (void)updateWithSecureElementPassFields:(id)a3
{
  id v4 = a3;
  +[SecureElementPassField deleteSecureElementPassFieldsInDatabase:self->super._database forPassPID:[(SQLiteEntity *)self persistentID]];
  id v14 = v4;
  int64_t v5 = [v4 fieldsDictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v15 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v15) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v5 objectForKeyedSubscript:v9];
        if ([v10 count])
        {
          unint64_t v11 = 0;
          do
          {
            id v12 = [v10 objectAtIndexedSubscript:v11];
            id v13 = +[SecureElementPassField insertBalanceFieldUnit:v12 forPass:self passDictionaryKey:v9 order:v11 inDatabase:self->super._database];

            ++v11;
          }
          while (v11 < (unint64_t)[v10 count]);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)updateWithShareBundle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = [(SQLiteEntity *)self persistentID];
    id v6 = [v4 shares];
    +[PassShare mergeInShares:v6 forPassPID:v5 inDatabase:self->super._database];

    id v7 = [v4 entitlements];

    +[PassEntitlement insertOrUpdatePassEntitlements:v7 forPassPID:v5 inDatabase:self->super._database];
  }
}

- (void)udpateWithIsCloudKitArchived:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"is_cloud_kit_archived"];
}

- (void)udpateWithCloudKitMetadata:(id)a3
{
}

- (void)udpateWithIsCloudKitSecurelyArchived:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"is_cloud_kit_securely_archived"];
}

- (void)udpateWithCloudKitSecureMetadata:(id)a3
{
}

- (void)updateWithDefaultPaymentApplication:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"pass_default_payment_application_pid"];
}

- (void)updateWithTransactionSourcePID:(int64_t)a3
{
  id v4 = +[NSNumber numberWithLongLong:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"transaction_source_pid"];
}

- (void)updateWithAssociatedAccountIdentifier:(id)a3
{
}

- (void)_updateWithTransactionService:(id)a3
{
  id v8 = a3;
  id v4 = [(Pass *)self passTransactionService];
  if (v4)
  {
    int64_t v5 = v4;
    [v4 updateWithNotificationService:v8];
  }
  else
  {
    id v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    id v7 = [(SQLiteEntity *)self database];
    int64_t v5 = +[PassNotificationService insertPassNotificationServiceWithNotificationService:v8 inDatabase:v7];

    [(Pass *)self _updateWithPassTransactionService:v5];
  }

  id v6 = v8;
LABEL_6:
}

- (void)_updateWithMessageService:(id)a3
{
  id v8 = a3;
  id v4 = [(Pass *)self passMessageService];
  if (v4)
  {
    int64_t v5 = v4;
    [v4 updateWithNotificationService:v8];
  }
  else
  {
    id v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    id v7 = [(SQLiteEntity *)self database];
    int64_t v5 = +[PassNotificationService insertPassNotificationServiceWithNotificationService:v8 inDatabase:v7];

    [(Pass *)self _updateWithPassMessageService:v5];
  }

  id v6 = v8;
LABEL_6:
}

- (void)_updateWithPassTransactionService:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"pass_transaction_service_pid"];
}

- (void)_updateWithPassMessageService:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"pass_message_service_pid"];
}

- (void)_updateSortingStateIfNecessary
{
  id v3 = [(Pass *)self uniqueID];
  id v4 = [(SQLiteEntity *)self database];
  int64_t v5 = +[PassAnnotations anyInDatabase:v4 withPassID:v3];

  if (v5 && [v5 sortingState] == (id)1)
  {
    id v6 = [(Pass *)self pass];
    id v7 = [v6 expirationDate];

    if (v7) {
      unsigned int v8 = [v6 isExpired];
    }
    else {
      unsigned int v8 = [v6 isPastRelevancy];
    }
    unsigned int v9 = v8;
    if ([v6 isExpired] && objc_msgSend(v6, "passType") == (id)1)
    {
      id v10 = [v6 secureElementPass];
      [v10 passActivationState];
    }
    if ((([v6 isVoided] | v9) & 1) == 0
      && ([v6 isExpiredBasedOnSigningDate] & 1) == 0)
    {
      unint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Un-archiving updated pass with unique id:%@ since it no longer qualifies for the expired section", (uint8_t *)&v12, 0xCu);
      }

      [v5 updateSortingState:0];
    }
  }
}

- (void)updateWithSortingState:(int64_t)a3 forSortingReason:(int64_t)a4
{
  id v7 = [(SQLiteEntity *)self database];
  unsigned int v8 = [(Pass *)self uniqueID];
  unsigned int v9 = +[PassAnnotations anyInDatabase:v7 withPassID:v8];

  if (PKExpiredPassesDisabledByUser())
  {
    if (a3 == 1) {
      a3 = 3;
    }
    id v10 = PKLogFacilityTypeGetObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        if ((unint64_t)(a4 - 1) > 6) {
          CFStringRef v12 = @"PKPassSortingReasonUnknown";
        }
        else {
          CFStringRef v12 = off_100735CF0[a4 - 1];
        }
        int v22 = 134218498;
        int64_t v23 = a3;
        __int16 v24 = 2112;
        int64_t v25 = (int64_t)v12;
        __int16 v26 = 2048;
        uint64_t v27 = 1;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating sorting state to: %ld with existing annotations for sorting reason: %@ (PKExpiredPassesDisabledByUser:%ld)", (uint8_t *)&v22, 0x20u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (v11)
    {
      uint64_t v15 = [(Pass *)self uniqueID];
      long long v16 = (void *)v15;
      if ((unint64_t)(a4 - 1) > 6) {
        CFStringRef v17 = @"PKPassSortingReasonUnknown";
      }
      else {
        CFStringRef v17 = off_100735CF0[a4 - 1];
      }
      int v22 = 138413058;
      int64_t v23 = v15;
      __int16 v24 = 2048;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v17;
      __int16 v28 = 2048;
      uint64_t v29 = 1;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No annotations found for pass with id:%@ creating new annotations with sorting state: %ld for sorting reason: %@ (PKExpiredPassesDisabledByUser:%ld)", (uint8_t *)&v22, 0x2Au);

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  id v10 = PKLogFacilityTypeGetObject();
  BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v13)
    {
      uint64_t v18 = [(Pass *)self uniqueID];
      long long v16 = (void *)v18;
      if ((unint64_t)(a4 - 1) > 6) {
        CFStringRef v19 = @"PKPassSortingReasonUnknown";
      }
      else {
        CFStringRef v19 = off_100735CF0[a4 - 1];
      }
      int v22 = 138413058;
      int64_t v23 = v18;
      __int16 v24 = 2048;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v19;
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      goto LABEL_28;
    }
LABEL_29:

    id v20 = [(SQLiteEntity *)self database];
    id v21 = +[PassAnnotations insertPassAnnotationsForSortingState:a3 forPass:self inDatabase:v20];

    goto LABEL_30;
  }
  if (v13)
  {
    if ((unint64_t)(a4 - 1) > 6) {
      CFStringRef v14 = @"PKPassSortingReasonUnknown";
    }
    else {
      CFStringRef v14 = off_100735CF0[a4 - 1];
    }
    int v22 = 134218498;
    int64_t v23 = a3;
    __int16 v24 = 2112;
    int64_t v25 = (int64_t)v14;
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    goto LABEL_22;
  }
LABEL_23:

  [v9 updateSortingState:a3];
LABEL_30:
}

- (void)updateWithAssociatedApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self database];
  +[AssociatedApplicationIdentifier deleteEntitiesForPass:self inDatabase:v5];

  id v6 = [(SQLiteEntity *)self database];
  +[AssociatedApplicationIdentifier insertAssociatedApplicationIdentifiers:v4 forPass:self inDatabase:v6];
}

- (void)updateWithAssociatedPassTypeIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self database];
  +[AssociatedPassTypeIdentifier deleteEntitiesForPass:self inDatabase:v5];

  id v6 = [(SQLiteEntity *)self database];
  +[AssociatedPassTypeIdentifier insertAssociatedPassTypeIdentifiers:v4 forPass:self inDatabase:v6];
}

- (void)updateWithAssociatedWebDomains:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self database];
  +[AssociatedWebDomain deleteEntitiesForPass:self inDatabase:v5];

  id v6 = [(SQLiteEntity *)self database];
  +[AssociatedWebDomain insertAssociatedWebDomains:v4 forPass:self inDatabase:v6];
}

- (void)updateWithGroup:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"group_pid"];
}

- (void)updateWithRevocationStatus:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"revoked"];
}

- (void)updateWithIngestedDate:(id)a3
{
}

- (void)updateWithDaemonPassData:(id)a3
{
  id v7 = a3;
  if ((id)[(Pass *)self passFlavor] == (id)1)
  {
    id v4 = sub_100011FDC((uint64_t)v7);
    [(Pass *)self updateWithPassTileDescriptors:v4];

    int64_t v5 = sub_1000215A0((uint64_t)v7);
    [(Pass *)self updateWithSecureElementPassFields:v5];

    id v6 = sub_100035604((uint64_t)v7);
    [(Pass *)self updateWithShareBundle:v6];
  }
}

- (void)updateWithSupportsIssuerBinding:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"supports_issuer_binding"];
}

- (void)updateWithProvisioningMetadata:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = [(SQLiteEntity *)self persistentID];
    id v6 = [(SQLiteEntity *)self database];
    +[PassProvisioningMetadata insertOrUpdateProvisioningMetadata:v4 forPassPID:v5 inDatabase:v6];
  }
}

- (void)updateWithPassDisplayProfile:(id)a3
{
  if (a3)
  {
    +[Pass _updateDictionaryWithDisplayProfile:](Pass, "_updateDictionaryWithDisplayProfile:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SQLiteEntity *)self setValuesWithDictionary:v4];
  }
}

- (void)updateWithContactlessActivationGroupingType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"contactless_activation_grouping_type"];
}

+ (id)dynamicStateInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v9 = [a1 predicateForUniqueID:v7];
  id v10 = [a1 _realPassPredicateForPredicate:v9];

  BOOL v11 = [a1 queryWithDatabase:v6 predicate:v10];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_10002084C;
  int64_t v23 = sub_100020F18;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DDDD8;
  v15[3] = &unk_100734F50;
  CFStringRef v17 = &v19;
  id v18 = a1;
  id v12 = v6;
  id v16 = v12;
  [v11 enumeratePersistentIDsAndProperties:&__NSArray0__struct usingBlock:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

+ (id)dynamicStatesInDatabase:(id)a3 forPassUniqueIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v9 = [a1 predicateForUniqueIDs:v7];
  id v10 = [a1 _realPassPredicateForPredicate:v9];

  BOOL v11 = [a1 queryWithDatabase:v6 predicate:v10];
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v22 = @"unique_id";
  id v13 = +[NSArray arrayWithObjects:&v22 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DDFF0;
  v18[3] = &unk_10072EAD8;
  id v19 = v12;
  id v21 = a1;
  id v14 = v6;
  id v20 = v14;
  id v15 = v12;
  [v11 enumeratePersistentIDsAndProperties:v13 usingBlock:v18];

  id v16 = [v15 copy];

  return v16;
}

- (id)_realPass
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002084C;
  id v13 = sub_100020F18;
  id v14 = 0;
  id v3 = [(SQLiteEntity *)self valueForProperty:@"template"];
  uint64_t v4 = (uint64_t)[v3 integerValue];

  if (v4 <= 11)
  {
    id v5 = +[Pass _copyPropertiesForPass];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE1EC;
    v8[3] = &unk_100734FA0;
    v8[4] = self;
    v8[5] = &v9;
    [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)passStylesInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = [a1 predicateForValidStyle];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v8 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v8 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v8 setPredicate:v6];
  [(SQLiteQueryDescriptor *)v8 setReturnsDistinctEntities:1];
  uint64_t v9 = [[SQLiteQuery alloc] initWithDatabase:v4 descriptor:v8];
  CFStringRef v16 = @"template";
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DE410;
  v14[3] = &unk_1007329C0;
  id v15 = v7;
  id v11 = v7;
  [(SQLiteQuery *)v9 enumerateProperties:v10 usingBlock:v14];

  id v12 = [v11 copy];

  return v12;
}

+ (id)unexpiredPassStylesInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = [a1 predicateForValidStyle];
  v20[0] = v6;
  id v7 = [a1 predicateForInMainStack];
  v20[1] = v7;
  unsigned int v8 = +[NSArray arrayWithObjects:v20 count:2];
  uint64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  id v10 = objc_alloc_init((Class)NSMutableSet);
  id v11 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v11 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v11 setPredicate:v9];
  [(SQLiteQueryDescriptor *)v11 setReturnsDistinctEntities:1];
  id v12 = [[SQLiteQuery alloc] initWithDatabase:v4 descriptor:v11];
  CFStringRef v19 = @"template";
  id v13 = +[NSArray arrayWithObjects:&v19 count:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DE634;
  v17[3] = &unk_1007329C0;
  id v18 = v10;
  id v14 = v10;
  [(SQLiteQuery *)v12 enumerateProperties:v13 usingBlock:v17];

  id v15 = [v14 copy];

  return v15;
}

+ (id)secureElementCardTypesInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = +[SQLiteBooleanPredicate truePredicate];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v8 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v8 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v8 setPredicate:v6];
  [(SQLiteQueryDescriptor *)v8 setReturnsDistinctEntities:1];
  uint64_t v9 = [[SQLiteQuery alloc] initWithDatabase:v4 descriptor:v8];
  CFStringRef v16 = @"card_type";
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DE804;
  v14[3] = &unk_1007329C0;
  id v15 = v7;
  id v11 = v7;
  [(SQLiteQuery *)v9 enumerateProperties:v10 usingBlock:v14];

  id v12 = [v11 copy];

  return v12;
}

+ (id)unexpiredSecureElementCardTypesInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = [a1 predicateForInMainStack];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v8 = objc_alloc_init(SQLiteQueryDescriptor);
  [(SQLiteQueryDescriptor *)v8 setEntityClass:a1];
  [(SQLiteQueryDescriptor *)v8 setPredicate:v6];
  [(SQLiteQueryDescriptor *)v8 setReturnsDistinctEntities:1];
  uint64_t v9 = [[SQLiteQuery alloc] initWithDatabase:v4 descriptor:v8];
  CFStringRef v16 = @"card_type";
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DE9D0;
  v14[3] = &unk_1007329C0;
  id v15 = v7;
  id v11 = v7;
  [(SQLiteQuery *)v9 enumerateProperties:v10 usingBlock:v14];

  id v12 = [v11 copy];

  return v12;
}

+ (id)candidatePassesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  unsigned int v8 = [a1 _realPassPredicateForPredicate:a4];
  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  CFStringRef v17 = sub_1000DEB14;
  id v18 = &unk_100734FC8;
  id v22 = a1;
  id v10 = v6;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  id v21 = v9;
  id v12 = v9;
  sub_10000817C((uint64_t)v10, &v15);
  id v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

- (id)pass
{
  return [(Pass *)self _realPass];
}

- (id)updateContext
{
  id v3 = objc_alloc_init(PDPassUpdateContext);
  id v4 = +[Pass _propertySettersForUpdateContext];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1000DEF40;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  unsigned int v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)groupingProfile
{
  id v3 = objc_alloc_init(PDPassGroupingProfile);
  id v4 = +[Pass _propertySettersForGroupingProfile];
  id v5 = [v4 allKeys];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  CFStringRef v17 = sub_1000DF0C4;
  id v18 = &unk_10072EDD0;
  id v19 = v4;
  id v6 = v3;
  id v20 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v15];

  unsigned int v8 = [(SQLiteEntity *)self valueForProperty:@"pid", v15, v16, v17, v18];
  id v9 = [v8 longLongValue];
  id v10 = [(SQLiteEntity *)self database];
  id v11 = +[PassRelevancyDates relevancyDatesForPassPID:v9 inDatabase:v10];
  [(PDPassGroupingProfile *)v6 setRelevantDates:v11];

  id v12 = v20;
  id v13 = v6;

  return v13;
}

- (id)passType
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"pass_type_pid"];
  if (v3)
  {
    id v4 = [PassType alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (unint64_t)passFlavor
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"pass_flavor"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)webService
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"web_service_pid"];
  if (v3)
  {
    id v4 = [WebService alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)transactionService
{
  v2 = [(Pass *)self passTransactionService];
  id v3 = [v2 notificationService];

  return v3;
}

- (id)messageService
{
  v2 = [(Pass *)self passMessageService];
  id v3 = [v2 notificationService];

  return v3;
}

- (id)passTransactionService
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"pass_transaction_service_pid"];
  if (v3)
  {
    id v4 = [PassNotificationService alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)passMessageService
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"pass_message_service_pid"];
  if (v3)
  {
    id v4 = [PassNotificationService alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)passNotificationServiceForType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(Pass *)self passMessageService];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(Pass *)self passTransactionService];
  }
  return v3;
}

- (id)group
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"group_pid"];
  if (v3)
  {
    id v4 = [Group alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)defaultPaymentApplication
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"pass_default_payment_application_pid"];
  if (v3)
  {
    id v4 = [PaymentApplication alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)revoked
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"revoked"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)uniqueID
{
  return [(SQLiteEntity *)self valueForProperty:@"unique_id"];
}

- (id)serialNumber
{
  return [(SQLiteEntity *)self valueForProperty:@"serial_number"];
}

- (id)authenticationToken
{
  return [(SQLiteEntity *)self valueForProperty:@"authentication_token"];
}

- (id)primaryAccountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"primary_account_identifier"];
}

- (id)associatedPassTypeIdentifiers
{
  return +[AssociatedPassTypeIdentifier associatedPassTypeIdentifiersInDatabase:forPass:](AssociatedPassTypeIdentifier, "associatedPassTypeIdentifiersInDatabase:forPass:", self->super._database);
}

- (id)associatedApplicationIdentifiers
{
  return +[AssociatedApplicationIdentifier associatedApplicationIdentifiersInDatabase:forPass:](AssociatedApplicationIdentifier, "associatedApplicationIdentifiersInDatabase:forPass:", self->super._database);
}

- (BOOL)supportsIssuerBinding
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"supports_issuer_binding"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)displayProfile
{
  id v3 = objc_alloc_init((Class)PKPassDisplayProfile);
  id v4 = +[Pass _propertySettersForDisplayProfile];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1000DF83C;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  unsigned int v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)getPushRegistrationStatus:(unint64_t *)a3 date:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002084C;
  id v13 = sub_100020F18;
  id v14 = 0;
  v19[0] = @"push_registration_status";
  v19[1] = @"push_registration_date";
  id v7 = +[NSArray arrayWithObjects:v19 count:2];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DFA14;
  v8[3] = &unk_100734FF0;
  v8[4] = &v15;
  v8[5] = &v9;
  [(SQLiteEntity *)self getValuesForProperties:v7 withApplier:v8];

  if (a3) {
    *a3 = v16[3];
  }
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (id)transactionSourceIdentifier
{
  id v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"transaction_source_pid"];
  id v5 = +[TransactionSource anyInDatabase:withPersistentID:](TransactionSource, "anyInDatabase:withPersistentID:", v3, [v4 longLongValue]);
  id v6 = [v5 identifier];

  return v6;
}

+ (void)enumerateUpdateContextsForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [a1 _propertySettersForUpdateContext];
  uint64_t v9 = [v8 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DFC58;
  v12[3] = &unk_100735018;
  id v14 = v6;
  id v15 = a1;
  id v13 = v8;
  id v10 = v6;
  id v11 = v8;
  [v7 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];
}

+ (void)enumerateOrganizationNamesForQuery:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  CFStringRef v11 = @"organization_name";
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DFE08;
  v9[3] = &unk_100733958;
  id v10 = v5;
  id v8 = v5;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v9];
}

+ (void)enumeratePassesAndGroupingProfilesForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _propertySettersForGroupingProfile];
  uint64_t v9 = [v8 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DFF20;
  v13[3] = &unk_100735040;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v17 = a1;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [v12 enumeratePersistentIDsAndProperties:v9 usingBlock:v13];
}

+ (void)enumeratePassUniqueIDsAndTypesForQuery:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  v11[0] = @"unique_id";
  v11[1] = @"pass_flavor";
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E0124;
  v9[3] = &unk_100735090;
  id v10 = v5;
  id v8 = v5;
  [v6 enumerateProperties:v7 usingBlock:v9];
}

+ (void)enumeratePassSyncabilityPropertiesInDatabase:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a1 queryWithDatabase:a3 predicate:0];
  v12[0] = @"unique_id";
  v12[1] = @"pass_flavor";
  v12[2] = @"template";
  v12[3] = @"pass_type.identifier";
  id v8 = +[NSArray arrayWithObjects:v12 count:4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_1000E02B8;
  v10[3] = &unk_100735090;
  id v11 = v6;
  id v9 = v6;
  [v7 enumerateProperties:v8 usingBlock:v10];
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForPersistentID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForTransactionSourceWithPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForUniqueID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withReaderIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v13 = v7;
    id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [a1 predicateForReaderIds:v9];
  id v11 = [a1 anyInDatabase:v6 predicate:v10];

  if (v8) {
  return v11;
  }
}

+ (id)anyInDatabase:(id)a3 withProvisioningCredentialHash:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForProvisioningCredentialHash:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForPassType:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withWebService:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForWebService:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForGroup:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serialNumber:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 predicateForPassType:a4];
  id v11 = [a1 predicateForSerialNumber:v8];

  id v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v11, 0);

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  id v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)anyInDatabase:(id)a3 withWebService:(id)a4 serialNumber:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 predicateForWebService:a4];
  id v11 = [a1 predicateForSerialNumber:v8];

  id v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v11, 0);

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  id v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)anyInDatabase:(id)a3 withNotificationService:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForNotificationService:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = [a1 predicateForPaymentApplicationIdentifier:a4 withSecureElementIdentifier:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = [a1 predicateForPaymentApplicationIdentifier:a4 withSecureElementIdentifiers:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 withPrimaryAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForPrimaryAccountIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withAssociatedAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 predicateForAssociatedAccountIdentifier:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = +[Account anyInDatabase:v6 withPreviousAccountIdentifier:v7];
    uint64_t v12 = [v11 accountIdentifier];

    id v13 = [a1 predicateForAssociatedAccountIdentifier:v12];
    id v14 = [a1 anyInDatabase:v6 predicate:v13];

    id v10 = v14;
    id v7 = (id)v12;
  }

  return v10;
}

+ (id)queryWithDatabase:(id)a3 passType:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForPassType:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

+ (id)queryWithDatabase:(id)a3 group:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForGroup:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)v2 valueForProperty:@"unique_id"];
  id v5 = +[PassLocationSource queryWithDatabase:v2->super._database passPID:v3];
  [v5 deleteAllEntities];
  +[Beacon deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[NFC deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PaymentApplication deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PaymentMessage deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PaymentBalance deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PassAnnotations deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PassLiveRender deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[PassRelevancyModel deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[AssociatedApplicationIdentifier deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[AssociatedPassTypeIdentifier deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[AssociatedWebDomain deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[ValueAddedServiceTransaction deleteEntitiesForPass:v2 inDatabase:v2->super._database];
  +[CategoryVisualizationMagnitude deleteAnyInDatabase:v2->super._database forPassUniqueID:v4];
  +[BalanceReminder deleteAnyInDatabase:v2->super._database forPassIdentifier:v4];
  +[CommutePlanReminder deleteAnyInDatabase:v2->super._database forPassIdentifier:v4];
  +[TileDescriptor deleteEntitiesForPassPID:v3 inDatabase:v2->super._database];
  +[PassShare deletePassShareForPassPID:v3 inDatabase:v2->super._database];
  +[PassEntitlement deletePassEntitlementForPassPID:v3 inDatabase:v2->super._database];
  +[SecureElementPassField deleteSecureElementPassFieldsInDatabase:v2->super._database forPassPID:v3];
  +[PassAuxiliaryRegistrationRequirement deleteAuxiliaryRegistrationRequirementsForPassPID:v3 inDatabase:v2->super._database];
  +[PaymentApplicationUsageSummary deleteUsageSummariesForPassUniqueIdentifier:v4 inDatabase:v2->super._database];
  +[PassProvisioningMetadata deleteProvisioningMetadataForPassPID:v3 inDatabase:v2->super._database];
  +[PassRelevancyDates deleteEntitiesForPassPID:v3 inDatabase:v2->super._database];
  +[PaymentRewardsBalance deleteRewardsBalanceForPass:v2 inDatabase:v2->super._database];
  +[PaymentRewardsRedemption deleteRewardsRedemptionsForPass:v2 inDatabase:v2->super._database];
  +[PassEndpointMetadata deleteEntitiesForPassPID:v3 inDatabase:v2->super._database];
  id v6 = [(Pass *)v2 passTransactionService];
  [v6 deleteFromDatabase];

  id v7 = [(Pass *)v2 passMessageService];
  [v7 deleteFromDatabase];

  v9.receiver = v2;
  v9.super_class = (Class)Pass;
  LOBYTE(v2) = [(SQLiteEntity *)&v9 deleteFromDatabase];

  return (char)v2;
}

+ (id)predicateForPersistentID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3
{
  int64_t v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForHasAnyWebService
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"web_service_pid"];
}

+ (id)predicateForHasValidNFCPayload
{
  v2 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"nfc.message"];
  if (PKNFCPassKeyOptional())
  {
    id v3 = v2;
  }
  else
  {
    v7[0] = v2;
    id v4 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"nfc.encryption_public_key"];
    v7[1] = v4;
    id v5 = +[NSArray arrayWithObjects:v7 count:2];
    id v3 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];
  }
  return v3;
}

+ (id)predicateForNFCPayloadState:(unint64_t)a3
{
  id v4 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"nfc.message"];
  v10[0] = v4;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"nfc.a" equalToValue:v5];
  v10[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)predicateForWebService:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"web_service_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentCardType:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"card_type" equalToValue:v3];

  return v4;
}

+ (id)predicateForPassTypeIdentifierHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass_type.identifier_hash" equalToValue:a3];
}

+ (id)predicateForAssociatedPassTypeIdentifierHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"associated_pass_type_identifier.identifier_hash" equalToValue:a3];
}

+ (id)predicateForNotificationService:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_notification_service.notification_service_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentApplicationSecureElementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.seid" equalToValue:a3];
}

+ (id)predicateForPaymentApplicationState:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.state" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentApplicationSupportsContactlessPayment:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.supports_contactless_payment" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentApplicationSupportsInAppPayment:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.supports_in_app_payment" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentApplicationNetworks:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_application.payment_network_identifier" values:a3];
}

+ (id)predicateForPaymentApplicationAppletDataFormatPrefix:(id)a3
{
  return +[SQLiteStringGlobPredicate predicateWithProperty:@"payment_application.applet_data_format" havingPrefix:a3];
}

+ (id)predicateForPaymentType:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.payment_type" equalToValue:v3];

  return v4;
}

+ (id)predicateForTCIs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"payment_automatic_selection_criterion_tci.tci" equalToValues:a3];
}

+ (id)predicateForReaderIds:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SQLiteCompoundPredicate predicateWithProperty:@"payment_automatic_selection_criterion_reader_id.reader_id" equalToValues:v3];
    id v5 = +[SQLiteCompoundPredicate predicateWithProperty:@"associated_reader_id.reader_id" equalToValues:v3];
    v9[0] = v4;
    v9[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v9 count:2];
    id v7 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];
  }
  else
  {
    id v7 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v7;
}

+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.aid" equalToValue:a3];
  v11[0] = v6;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.seid" equalToValue:v5];

  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];

  objc_super v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.aid" equalToValue:a3];
  v11[0] = v6;
  id v7 = +[SQLiteCompoundPredicate predicateWithProperty:@"payment_application.seid" equalToValues:v5];

  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];

  objc_super v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)predicateForPrimaryAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"primary_account_identifier" equalToValue:a3];
}

+ (id)predicateForPassType:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_type_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForGroup:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"group_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"unique_id" equalToValue:a3];
}

+ (id)predicateForUniqueIDs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"unique_id" equalToValues:a3];
}

+ (id)predicateForProvisioningCredentialHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"provisioning_credential_hash" equalToValue:a3];
}

+ (id)predicateForStyle:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"template" equalToValue:v3];

  return v4;
}

+ (id)predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass_type.identifier" equalToValue:a3];
}

+ (id)predicateForSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"serial_number" equalToValue:a3];
}

+ (id)predicateForIssuerCountryCodes:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"issuer_country_code" values:a3];
}

+ (id)predicateForIsCloudKitArchived:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_cloud_kit_archived" equalToValue:&__kCFBooleanTrue];
  }
  else
  {
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_cloud_kit_archived" equalToValue:&__kCFBooleanFalse];
    v8[0] = v4;
    id v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"is_cloud_kit_archived"];
    v8[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v8 count:2];
    id v3 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];
  }
  return v3;
}

+ (id)predicateForIsCloudKitSecurelyArchived:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_cloud_kit_securely_archived" equalToValue:&__kCFBooleanTrue];
  }
  else
  {
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_cloud_kit_securely_archived" equalToValue:&__kCFBooleanFalse];
    v8[0] = v4;
    id v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"is_cloud_kit_securely_archived"];
    v8[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v8 count:2];
    id v3 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];
  }
  return v3;
}

+ (id)predicateForIsRevoked:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"revoked" equalToValue:&__kCFBooleanTrue];
  }
  else
  {
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"revoked" equalToValue:&__kCFBooleanFalse];
    v8[0] = v4;
    id v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"revoked"];
    v8[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v8 count:2];
    id v3 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];
  }
  return v3;
}

+ (id)predicateForSupportsIssuerBinding:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"supports_issuer_binding" equalToValue:v3];

  return v4;
}

+ (id)predicateForAssociatedAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)predicateForExpired
{
  return _[a1 _predicateForPassAnnotationState:1];
}

+ (id)predicateForManuallyRecovered
{
  return _[a1 _predicateForPassAnnotationState:2];
}

+ (id)predicateForSupportsDefaultCardSelection:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"supports_default_card_selection" equalToValue:v3];

  return v4;
}

+ (id)predicateForHasVPANID
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"payment_application.i"];
}

+ (id)_propertySettersForUpdateContext
{
  v4[0] = @"unique_id";
  v4[1] = @"serial_number";
  v5[0] = &stru_100735B50;
  v5[1] = &stru_100735B70;
  v4[2] = @"authentication_token";
  v4[3] = @"last_modified_tag";
  v5[2] = &stru_100735B90;
  v5[3] = &stru_100735BB0;
  v4[4] = @"modified_date";
  void v4[5] = @"modified_source";
  v5[4] = &stru_100735BD0;
  void v5[5] = &stru_100735BF0;
  v4[6] = @"manifest_hash";
  v5[6] = &stru_100735C10;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end