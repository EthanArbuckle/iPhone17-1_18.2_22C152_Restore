@interface PeerPaymentAccount
+ (id)_predicateForAssociatedPeerPaymentAccountIdentifier:(id)a3;
+ (id)_predicateForAssociatedPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccount;
+ (id)anyInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)associatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePeerPaymentAccount:(id)a3 inDatabase:(id)a4;
+ (void)_deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)_insertOrUpdateAssociatedPeerPaymentAccounts:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4;
- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4 associatedPeerPaymentAccountPID:(int64_t)a5;
- (id)_commonInitForPeerPaymentAccount:(id)a3 dictionary:(id)a4 inDatabase:(id)a5;
- (id)_dictionaryForPeerPaymentAccount:(id)a3;
- (id)_passForPeerPaymentAccount:(id)a3 database:(id)a4;
- (id)associatedAccountInformation;
- (id)associatedPassSerialNumber;
- (id)associatedPassTypeIdentifier;
- (id)associatedPassUniqueID;
- (id)currentBalance;
- (id)identifier;
- (id)peerPaymentAccount;
- (id)transactionSourceIdentifier;
- (unint64_t)state;
- (void)updateWithPeerPaymentAccount:(id)a3;
@end

@implementation PeerPaymentAccount

- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PeerPaymentAccount *)self _dictionaryForPeerPaymentAccount:v7];
  v9 = [(PeerPaymentAccount *)self _commonInitForPeerPaymentAccount:v7 dictionary:v8 inDatabase:v6];

  return v9;
}

- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4 associatedPeerPaymentAccountPID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(PeerPaymentAccount *)self _dictionaryForPeerPaymentAccount:v9];
  [v10 setLongLong:a5 forKey:@"associated_account_pid"];
  v11 = [(PeerPaymentAccount *)self _commonInitForPeerPaymentAccount:v9 dictionary:v10 inDatabase:v8];

  return v11;
}

- (id)_commonInitForPeerPaymentAccount:(id)a3 dictionary:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = self;
  id v10 = a3;
  v11 = [(SQLiteEntity *)v9 initWithPropertyValues:a4 inDatabase:v8];
  id v12 = [(SQLiteEntity *)v11 persistentID];
  v13 = [v10 associatedAccountInformation];
  v14 = [v10 additionalPushTopics];
  id v15 = +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:v14 forPeerPaymentAccountPID:[(SQLiteEntity *)v11 persistentID] inDatabase:v8];

  v16 = [v10 supportedFeatureDescriptors];
  id v17 = +[PeerPaymentAccountFeatureDescriptor insertFeatureDescriptors:v16 forPeerPaymentAccountPID:v12 inDatabase:v8];

  v18 = [v13 associatedAccountInvitations];
  id v19 = +[PeerPaymentAccountInvitation insertInvitations:v18 forPeerPaymentAccountPID:v12 inDatabase:v8];

  v20 = [v13 associatedAccountRemovalRecords];
  id v21 = +[PeerPaymentAssociatedAccountRemovalRecord insertAssociatedAccountRemovalRecords:v20 forPeerPaymentAccountPID:v12 inDatabase:v8];

  v22 = [v13 associatedAccounts];
  v23 = [v10 identifier];
  +[PeerPaymentAccount _insertOrUpdateAssociatedPeerPaymentAccounts:v22 forPeerPaymentAccountPID:v12 accountIdentifier:v23 inDatabase:v8];

  v24 = [v10 paymentModeIdentifiers];
  id v25 = +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:v24 forPeerPaymentAccountPID:[(SQLiteEntity *)v11 persistentID] inDatabase:v8];

  v26 = [v10 encryptionCertificatesVersions];

  id v27 = +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:v26 forPeerPaymentAccountPID:[(SQLiteEntity *)v11 persistentID] inDatabase:v8];
  return v11;
}

+ (void)_insertOrUpdateAssociatedPeerPaymentAccounts:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v30 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    uint64_t v31 = *(void *)v38;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v18 = [v17 identifier];
        id v19 = [a1 anyInDatabase:v10 withIdentifier:v18];

        v20 = [v17 identifier];
        if (v20)
        {
          if (v19)
          {
            [v19 updateWithPeerPaymentAccount:v17];
          }
          else
          {
            id v21 = v11;
            id v22 = v12;
            v23 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v20;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Inserting New Assocaited Peer Payment Account %@", buf, 0xCu);
            }

            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_1002254D8;
            v33[3] = &unk_100737418;
            id v35 = a1;
            v33[4] = v17;
            id v34 = v10;
            int64_t v36 = a4;
            sub_10000817C((uint64_t)v34, v33);

            id v12 = v22;
            id v11 = v21;
            uint64_t v15 = v31;
          }
          [v11 addObject:v20];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v14);
  }

  v24 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:v11];
  id v25 = [a1 _predicateForAssociatedPeerPaymentAccountPID:a4];
  v41[0] = v24;
  v41[1] = v25;
  v26 = +[NSArray arrayWithObjects:v41 count:2];
  id v27 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v26];

  v28 = [a1 queryWithDatabase:v10 predicate:v27];
  if (([v28 deleteAllEntities] & 1) == 0)
  {
    v29 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to delete obsolete peer payment accounts for %@", buf, 0xCu);
    }
  }
}

- (void)updateWithPeerPaymentAccount:(id)a3
{
  id v4 = a3;
  id v46 = [(PeerPaymentAccount *)self _dictionaryForPeerPaymentAccount:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v46];
  v5 = [v4 associatedAccountInformation];
  int64_t v6 = [(SQLiteEntity *)self persistentID];
  id v7 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountAdditionalPushTopics deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:v6 inDatabase:v7];

  id v8 = [v4 additionalPushTopics];
  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = [(SQLiteEntity *)self database];
  id v11 = +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:v8 forPeerPaymentAccountPID:v9 inDatabase:v10];

  int64_t v12 = [(SQLiteEntity *)self persistentID];
  id v13 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountFeatureDescriptor deleteFeatureDescriptorsForPeerPaymentAccountPID:v12 inDatabase:v13];

  id v14 = [v4 supportedFeatureDescriptors];
  int64_t v15 = [(SQLiteEntity *)self persistentID];
  v16 = [(SQLiteEntity *)self database];
  id v17 = +[PeerPaymentAccountFeatureDescriptor insertFeatureDescriptors:v14 forPeerPaymentAccountPID:v15 inDatabase:v16];

  int64_t v18 = [(SQLiteEntity *)self persistentID];
  id v19 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountInvitation deleteInvitationsForPeerPaymentAccountPID:v18 inDatabase:v19];

  v20 = [v5 associatedAccountInvitations];
  int64_t v21 = [(SQLiteEntity *)self persistentID];
  id v22 = [(SQLiteEntity *)self database];
  id v23 = +[PeerPaymentAccountInvitation insertInvitations:v20 forPeerPaymentAccountPID:v21 inDatabase:v22];

  int64_t v24 = [(SQLiteEntity *)self persistentID];
  id v25 = [(SQLiteEntity *)self database];
  +[PeerPaymentAssociatedAccountRemovalRecord deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:v24 inDatabase:v25];

  v26 = [v5 associatedAccountRemovalRecords];
  int64_t v27 = [(SQLiteEntity *)self persistentID];
  v28 = [(SQLiteEntity *)self database];
  id v29 = +[PeerPaymentAssociatedAccountRemovalRecord insertAssociatedAccountRemovalRecords:v26 forPeerPaymentAccountPID:v27 inDatabase:v28];

  id v30 = [v5 associatedAccounts];
  int64_t v31 = [(SQLiteEntity *)self persistentID];
  v32 = [v4 identifier];
  v33 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccount _insertOrUpdateAssociatedPeerPaymentAccounts:v30 forPeerPaymentAccountPID:v31 accountIdentifier:v32 inDatabase:v33];

  int64_t v34 = [(SQLiteEntity *)self persistentID];
  id v35 = [(SQLiteEntity *)self database];
  +[PeerPaymentPaymentModeIdentifiers deletePeerPaymentPaymentModeIdentifiersForAccountPID:v34 inDatabase:v35];

  int64_t v36 = [v4 paymentModeIdentifiers];
  int64_t v37 = [(SQLiteEntity *)self persistentID];
  long long v38 = [(SQLiteEntity *)self database];
  id v39 = +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:v36 forPeerPaymentAccountPID:v37 inDatabase:v38];

  int64_t v40 = [(SQLiteEntity *)self persistentID];
  v41 = [(SQLiteEntity *)self database];
  +[PeerPaymentEncryptionCertificatesVersions deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:v40 inDatabase:v41];

  v42 = [v4 encryptionCertificatesVersions];

  int64_t v43 = [(SQLiteEntity *)self persistentID];
  v44 = [(SQLiteEntity *)self database];
  id v45 = +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:v42 forPeerPaymentAccountPID:v43 inDatabase:v44];
}

+ (id)_predicateForAssociatedPeerPaymentAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"associated_account_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAssociatedPeerPaymentAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

- (id)peerPaymentAccount
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentAccount);
  id v4 = +[PeerPaymentAccount _propertySettersForPeerPaymentAccount];
  v5 = [v4 allKeys];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  void v41[2] = sub_100225E40;
  v41[3] = &unk_10072EDD0;
  id v36 = v4;
  id v42 = v36;
  id v6 = v3;
  id v43 = v6;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v41];

  id v7 = [(PeerPaymentAccount *)self currentBalance];
  [v6 setCurrentBalance:v7];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  int64_t v9 = [(SQLiteEntity *)self database];
  uint64_t v10 = +[PeerPaymentAccountAdditionalPushTopics peerPaymentAccountAdditionalPushTopicsForAccountPID:v8 inDatabase:v9];

  id v35 = (void *)v10;
  [v6 setAdditionalPushTopics:v10];
  int64_t v11 = [(SQLiteEntity *)self persistentID];
  int64_t v12 = [(SQLiteEntity *)self database];
  id v13 = +[PeerPaymentAccountFeatureDescriptor featureDescriptorsForPeerPaymentAccountPID:v11 inDatabase:v12];

  [v6 setSupportedFeatureDescriptors:v13];
  id v14 = [(PeerPaymentAccount *)self associatedAccountInformation];
  [v6 setAssociatedAccountInformation:v14];

  int64_t v15 = [(SQLiteEntity *)self persistentID];
  v16 = [(SQLiteEntity *)self database];
  uint64_t v17 = +[PeerPaymentPaymentModeIdentifiers peerPaymentPaymentModeIdentifiersForAccountPID:v15 inDatabase:v16];

  int64_t v34 = (void *)v17;
  [v6 setPaymentModeIdentifiers:v17];
  int64_t v18 = [(SQLiteEntity *)self persistentID];
  id v19 = [(SQLiteEntity *)self database];
  uint64_t v20 = +[PeerPaymentEncryptionCertificatesVersions peerPaymentEncryptionCertificatesVersionsForAccountPID:v18 inDatabase:v19];

  v33 = (void *)v20;
  [v6 setEncryptionCertificatesVersions:v20];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v13;
  id v22 = [v21 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int64_t v27 = [v26 osVersionRange];
        if ([v26 isSupported]) {
          int v28 = 0;
        }
        else {
          int v28 = PKDeviceVersionMeetsRequiredVersion();
        }
        if ([v26 isSupported])
        {
          id v29 = [v27 maximum];
          if (v29) {
            int v30 = PKDeviceVersionMeetsRequiredVersion() ^ 1;
          }
          else {
            int v30 = 0;
          }
        }
        else
        {
          int v30 = 0;
        }
        if ((v28 | v30) == 1)
        {
          [v6 setAccountStateDirty:1];
          [(PeerPaymentAccount *)self updateWithPeerPaymentAccount:v6];

          goto LABEL_20;
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  id v31 = v6;
  return v31;
}

- (id)currentBalance
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"current_balance_amount"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  v5 = [(SQLiteEntity *)self valueForProperty:@"current_balance_currency"];
  if (v4)
  {
    id v6 = +[NSDecimalNumber notANumber];
    unsigned __int8 v7 = [v4 isEqualToNumber:v6];

    id v8 = 0;
    if ((v7 & 1) == 0 && v5) {
      id v8 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v4 currency:v5 exponent:0];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)associatedAccountInformation
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"associated_account_last_updated_date"];
  id v4 = (void *)_DateForSQLValue();

  v5 = [(SQLiteEntity *)self valueForProperty:@"associated_account_proactive_fetch_period"];
  id v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  int64_t v9 = [(SQLiteEntity *)self valueForProperty:@"associated_account_state_dirty"];

  id v10 = [v9 BOOLValue];
  id v11 = objc_alloc_init((Class)PKPeerPaymentAssociatedAccountInformation);
  [v11 setLastUpdated:v4];
  [v11 setProactiveAssociatedAccountFetchPeriod:v8];
  [v11 setAssociatedAccountStateDirty:v10];
  int64_t v12 = [(SQLiteEntity *)self persistentID];
  id v13 = [(SQLiteEntity *)self database];
  id v14 = +[PeerPaymentAccountInvitation invitationsForPeerPaymentAccountPID:v12 inDatabase:v13];

  [v11 setAssociatedAccountInvitations:v14];
  int64_t v15 = [(SQLiteEntity *)self persistentID];
  v16 = [(SQLiteEntity *)self database];
  uint64_t v17 = +[PeerPaymentAssociatedAccountRemovalRecord associatedAccountRemovalRecordsForPeerPaymentAccountPID:v15 inDatabase:v16];

  [v11 setAssociatedAccountRemovalRecords:v17];
  int64_t v18 = [(SQLiteEntity *)self persistentID];
  id v19 = [(SQLiteEntity *)self database];
  uint64_t v20 = +[PeerPaymentAccount associatedPeerPaymentAccountForPeerPaymentAccountPID:v18 inDatabase:v19];

  [v11 setAssociatedAccounts:v20];
  return v11;
}

- (unint64_t)state
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"state"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)associatedPassTypeIdentifier
{
  if (PKUseMockSURFServer()) {
    PKMockPeerPaymentPassPassTypeID();
  }
  else {
  id v3 = [(SQLiteEntity *)self valueForProperty:@"associated_pass_type_identifier"];
  }
  return v3;
}

- (id)associatedPassSerialNumber
{
  if (PKUseMockSURFServer()) {
    PKMockPeerPaymentPassSerialNumber();
  }
  else {
  id v3 = [(SQLiteEntity *)self valueForProperty:@"associated_pass_serial_number"];
  }
  return v3;
}

- (id)associatedPassUniqueID
{
  id v3 = [(PeerPaymentAccount *)self associatedPassTypeIdentifier];
  id v4 = [(PeerPaymentAccount *)self associatedPassSerialNumber];
  v5 = PKGeneratePassUniqueID();

  return v5;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)transactionSourceIdentifier
{
  id v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"transaction_source_pid"];
  v5 = +[TransactionSource anyInDatabase:withPersistentID:](TransactionSource, "anyInDatabase:withPersistentID:", v3, [v4 longLongValue]);
  id v6 = [v5 identifier];

  return v6;
}

+ (id)associatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  double v7 = [a1 _predicateForAssociatedPeerPaymentAccountPID:a3];
  double v8 = [a1 queryWithDatabase:v6 predicate:v7];
  int64_t v9 = [a1 _propertySettersForPeerPaymentAccount];
  id v10 = +[NSMutableSet set];
  id v11 = [v9 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  int64_t v18 = sub_100226490;
  id v19 = &unk_10072ED00;
  id v20 = v6;
  id v21 = v10;
  id v12 = v10;
  id v13 = v6;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:&v16];

  id v14 = objc_msgSend(v12, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)databaseTable
{
  return @"peer_payment_account";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transaction_source_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v10 = @"pass.unique_id";
  double v7 = +[NSArray arrayWithObjects:&v10 count:1];
  CFStringRef v9 = @"transaction_source.identifier";
  double v8 = +[NSArray arrayWithObjects:&v9 count:1];
  if ([v7 containsObject:v5]) {
    [v6 addObject:@"JOIN pass ON pass.pid = peer_payment_account.pass_pid"];
  }
  if ([v8 containsObject:v5]) {
    [v6 addObject:@"LEFT OUTER JOIN transaction_source ON transaction_source.pid = peer_payment_account.transaction_source_pid"];
  }
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountAdditionalPushTopics deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:v3 inDatabase:v4];

  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountFeatureDescriptor deleteFeatureDescriptorsForPeerPaymentAccountPID:v5 inDatabase:v6];

  int64_t v7 = [(SQLiteEntity *)self persistentID];
  double v8 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccountInvitation deleteInvitationsForPeerPaymentAccountPID:v7 inDatabase:v8];

  int64_t v9 = [(SQLiteEntity *)self persistentID];
  CFStringRef v10 = [(SQLiteEntity *)self database];
  +[PeerPaymentAssociatedAccountRemovalRecord deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:v9 inDatabase:v10];

  int64_t v11 = [(SQLiteEntity *)self persistentID];
  id v12 = [(SQLiteEntity *)self database];
  +[PeerPaymentAccount _deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:v11 inDatabase:v12];

  id v13 = [(SQLiteEntity *)self database];
  +[TransactionSource deleteEntitiesInDatabase:v13 forPeerPaymentAccount:self];

  int64_t v14 = [(SQLiteEntity *)self persistentID];
  int64_t v15 = [(SQLiteEntity *)self database];
  +[AccountEndpointBackOff deleteEntriesForAccountType:1 accountPID:v14 inDatabase:v15];

  int64_t v16 = [(SQLiteEntity *)self persistentID];
  uint64_t v17 = [(SQLiteEntity *)self database];
  +[PeerPaymentRecurringPayment deleteEntitiesForPeerPaymentAccountPID:v16 inDatabase:v17];

  int64_t v18 = [(SQLiteEntity *)self persistentID];
  id v19 = [(SQLiteEntity *)self database];
  +[PeerPaymentPaymentModeIdentifiers deletePeerPaymentPaymentModeIdentifiersForAccountPID:v18 inDatabase:v19];

  int64_t v20 = [(SQLiteEntity *)self persistentID];
  id v21 = [(SQLiteEntity *)self database];
  +[PeerPaymentEncryptionCertificate deleteEncryptionCertificatesForPeerPaymentAccountPID:v20 inDatabase:v21];

  int64_t v22 = [(SQLiteEntity *)self persistentID];
  id v23 = [(SQLiteEntity *)self database];
  +[PeerPaymentEncryptionCertificatesVersions deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:v22 inDatabase:v23];

  v25.receiver = self;
  v25.super_class = (Class)PeerPaymentAccount;
  return [(SQLiteEntity *)&v25 deleteFromDatabase];
}

+ (id)insertOrUpdatePeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [a1 anyInDatabase:v7];
  if (v8)
  {
    id v9 = v8;
    [v8 updateWithPeerPaymentAccount:v6];
  }
  else
  {
    CFStringRef v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Could Not Match Peer Payment Account. Inserting New Peer Payment Account", v12, 2u);
    }

    id v9 = [objc_alloc((Class)a1) initWithPeerPaymentAccount:v6 inDatabase:v7];
  }

  return v9;
}

+ (void)_deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAssociatedPeerPaymentAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"associated_account_pid"];
  id v6 = [a1 anyInDatabase:v4 predicate:v5];

  return v6;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForAssociatedPeerPaymentAccountIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)_passForPeerPaymentAccount:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 associatedPassTypeIdentifier];
  id v8 = +[PassType anyInDatabase:v5 withPassTypeID:v7];

  id v9 = [v6 associatedPassSerialNumber];

  CFStringRef v10 = +[Pass anyInDatabase:v5 withPassType:v8 serialNumber:v9];

  return v10;
}

- (id)_dictionaryForPeerPaymentAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 associatedAccountInformation];
  id v7 = [v4 currentBalance];
  id v8 = [v7 amount];
  id v9 = PKCurrencyDecimalToStorageNumber();

  CFStringRef v10 = [v4 maximumBalance];
  int64_t v11 = PKCurrencyDecimalToStorageNumber();

  id v12 = [v4 amountRemainingUntilIdentityVerification];
  id v13 = PKCurrencyDecimalToStorageNumber();

  int64_t v14 = [(SQLiteEntity *)self database];
  int64_t v15 = [(PeerPaymentAccount *)self _passForPeerPaymentAccount:v4 database:v14];

  if (v15) {
    objc_msgSend(v5, "setLongLong:forKey:", objc_msgSend(v15, "persistentID"), @"pass_pid");
  }
  int64_t v16 = [v4 identifier];
  [v5 setObjectOrNull:v16 forKey:@"identifier"];

  uint64_t v17 = [v4 createdDate];
  int64_t v18 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v18 forKey:@"created_date"];

  id v19 = [v4 identifiedDate];
  int64_t v20 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v20 forKey:@"identified_date"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "role"), @"role");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "state"), @"state");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "stateReason"), @"state_reason");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "sendRestrictionType"), @"person_to_person_restriction_type");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "receiveRestrictionType"), @"b");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "stage"), @"stage");
  id v21 = [v4 countryCode];
  [v5 setObjectOrNull:v21 forKey:@"country_code"];

  [v5 setObjectOrNull:v9 forKey:@"current_balance_amount"];
  [v5 setObjectOrNull:v11 forKey:@"maximum_balance_amount"];
  int64_t v22 = [v4 currentBalance];
  id v23 = [v22 currency];
  [v5 setObjectOrNull:v23 forKey:@"current_balance_currency"];

  uint64_t v24 = [v4 altDSID];
  [v5 setObjectOrNull:v24 forKey:@"alt_dsid"];

  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "identityVerificationRequired"), @"identity_verification_required");
  [v5 setObjectOrNull:v13 forKey:@"amount_remaining_until_identity_verification"];
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "isAccountStateDirty"), @"account_state_dirty");
  objc_super v25 = [v4 lastUpdated];
  v26 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v26 forKey:@"last_updated_date"];

  [v4 proactiveFetchPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"proactive_fetch_period");
  [v4 accountFetchAfterTransactionWaitPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"account_fetch_after_transaction_wait_period");
  [v4 accountFetchAfterTransactionWaitTolerance];
  objc_msgSend(v5, "setDouble:forKey:", @"account_fetch_after_transaction_wait_tolerance");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "termsAcceptanceRequired"), @"terms_acceptance_required");
  int64_t v27 = [v4 termsIdentifier];
  [v5 setObjectOrNull:v27 forKey:@"terms_identifier"];

  int v28 = [v4 termsURL];
  id v29 = [v28 absoluteString];
  [v5 setObjectOrNull:v29 forKey:@"terms_url"];

  int v30 = [v4 associatedPassURL];
  id v31 = [v30 absoluteString];
  [v5 setObjectOrNull:v31 forKey:@"associated_pass_url"];

  v32 = [v4 associatedPassSerialNumber];
  [v5 setObjectOrNull:v32 forKey:@"associated_pass_serial_number"];

  v33 = [v4 associatedPassTypeIdentifier];
  [v5 setObjectOrNull:v33 forKey:@"associated_pass_type_identifier"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "pendingPaymentCount"), @"pending_payment_count");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "identityVerificationForDisbursementsRequired"), @"identity_verification_for_disbursements_required");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "hasDisplayedAssociatedAccountActiveNotification"), @"displayed_associated_account_active_notification");
  int64_t v34 = [v4 cloudStoreZoneNames];
  id v35 = [v34 allObjects];
  id v36 = [v35 componentsJoinedByString:@","];
  [v5 setObjectOrNull:v36 forKey:@"cloud_store_zone_names"];

  [v6 proactiveAssociatedAccountFetchPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"associated_account_proactive_fetch_period");
  long long v37 = [v6 lastUpdated];
  long long v38 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v38 forKey:@"associated_account_last_updated_date"];

  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v6, "isAssociatedAccountStateDirty"), @"associated_account_state_dirty");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "deviceScoreEncryptedPayloadVersion"), @"device_score_encrypted_payload_version");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "hasRecurringPayments"), @"a");

  return v5;
}

+ (id)_propertySettersForPeerPaymentAccount
{
  v4[0] = @"identifier";
  v4[1] = @"created_date";
  v5[0] = &stru_100741620;
  v5[1] = &stru_100741640;
  v4[2] = @"identified_date";
  v4[3] = @"role";
  v5[2] = &stru_100741660;
  v5[3] = &stru_100741680;
  v4[4] = @"state";
  v4[5] = @"state_reason";
  v5[4] = &stru_1007416A0;
  v5[5] = &stru_1007416C0;
  v4[6] = @"person_to_person_restriction_type";
  v4[7] = @"b";
  v5[6] = &stru_1007416E0;
  v5[7] = &stru_100741700;
  v4[8] = @"stage";
  v4[9] = @"country_code";
  v5[8] = &stru_100741720;
  v5[9] = &stru_100741740;
  v4[10] = @"alt_dsid";
  v4[11] = @"maximum_balance_amount";
  v5[10] = &stru_100741760;
  v5[11] = &stru_100741780;
  v4[12] = @"identity_verification_required";
  v4[13] = @"amount_remaining_until_identity_verification";
  v5[12] = &stru_1007417A0;
  v5[13] = &stru_1007417C0;
  v4[14] = @"terms_acceptance_required";
  v4[15] = @"account_state_dirty";
  v5[14] = &stru_1007417E0;
  v5[15] = &stru_100741800;
  v4[16] = @"last_updated_date";
  v4[17] = @"proactive_fetch_period";
  v5[16] = &stru_100741820;
  v5[17] = &stru_100741840;
  v4[18] = @"account_fetch_after_transaction_wait_period";
  v4[19] = @"account_fetch_after_transaction_wait_tolerance";
  v5[18] = &stru_100741860;
  v5[19] = &stru_100741880;
  v4[20] = @"terms_identifier";
  v4[21] = @"terms_url";
  v5[20] = &stru_1007418A0;
  v5[21] = &stru_1007418C0;
  v4[22] = @"associated_pass_url";
  v4[23] = @"associated_pass_serial_number";
  v5[22] = &stru_1007418E0;
  v5[23] = &stru_100741900;
  v4[24] = @"associated_pass_type_identifier";
  v4[25] = @"pending_payment_count";
  v5[24] = &stru_100741920;
  v5[25] = &stru_100741940;
  v4[26] = @"identity_verification_for_disbursements_required";
  v4[27] = @"displayed_associated_account_active_notification";
  v5[26] = &stru_100741960;
  v5[27] = &stru_100741980;
  v4[28] = @"cloud_store_zone_names";
  v4[29] = @"transaction_source.identifier";
  v5[28] = &stru_1007419A0;
  v5[29] = &stru_1007419C0;
  v4[30] = @"device_score_encrypted_payload_version";
  v4[31] = @"a";
  v5[30] = &stru_1007419E0;
  v5[31] = &stru_100741A00;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:32];
  return v2;
}

@end