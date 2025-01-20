@interface Account
+ (BOOL)hasAnyAccountInDatabase:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)_propertySettersForAccount;
+ (id)accountWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountWithPhysicalCardIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountsInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPreviousAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withType:(id)a4;
+ (id)databaseTable;
+ (id)deleteVirtualCardEncryptedDataForAccount:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateAccount:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllAccountsInDatabase:(id)a3;
- (Account)initWithAccount:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)account;
- (id)accountIdentifier;
- (id)previousAccountIdentifiers;
- (id)transactionSourceIdentifier;
- (unint64_t)feature;
- (unint64_t)state;
- (unint64_t)type;
- (void)_updateForAccount:(id)a3 persistentID:(int64_t)a4 database:(id)a5 deleteOnFailedMatch:(BOOL)a6;
- (void)updateWithAccount:(id)a3;
@end

@implementation Account

+ (id)accountsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  v6 = [a1 queryWithDatabase:v4 predicate:v5];

  v7 = +[NSMutableSet set];
  CFStringRef v19 = @"pid";
  v8 = +[NSArray arrayWithObjects:&v19 count:1];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100213374;
  v16 = &unk_10072ED00;
  id v17 = v4;
  id v18 = v7;
  id v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)databaseTable
{
  return @"pears";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v16 = v7;
  if (v7 == @"raspberries.b") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned int v8 = [(__CFString *)v7 isEqualToString:@"raspberries.b"];

  if (v8)
  {
LABEL_4:
    [v6 addObject:@"JOIN clementines ON clementines.a = pears.pid"];
    CFStringRef v9 = @"JOIN raspberries ON raspberries.a = clementines.pid";
LABEL_5:
    [v6 addObject:v9];
    goto LABEL_6;
  }
  id v10 = v16;
  if (v10 == @"blackberries.b"
    || (id v11 = v10,
        unsigned __int8 v12 = [(__CFString *)v10 isEqualToString:@"blackberries.b"],
        v11,
        (v12 & 1) != 0))
  {
    CFStringRef v9 = @"JOIN blackberries ON blackberries.a = pears.pid";
    goto LABEL_5;
  }
  v13 = v11;
  if (v13 == @"transaction_source.identifier"
    || (uint64_t v14 = v13,
        unsigned int v15 = [(__CFString *)v13 isEqualToString:@"transaction_source.identifier"], v14, v15))
  {
    CFStringRef v9 = @"LEFT OUTER JOIN transaction_source ON transaction_source.pid = pears.transaction_source_pid";
    goto LABEL_5;
  }
LABEL_6:
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a4];
  unsigned int v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)accountWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  unsigned int v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 accountIdentifier];
  id v9 = [a1 accountWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithAccount:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithAccount:v6 inDatabase:v7];
  }

  return v9;
}

- (Account)initWithAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "type"), @"c");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "state"), @"d");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "stateReason"), @"i");
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "blockAllAccountAccess"), @"block_all_account_access");
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "blockNotifications"), @"j");
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isCloudAccount"), @"p");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "accessLevel"), @"e");
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "accountStateDirty"), @"f");
  id v9 = [v7 lastUpdated];
  id v10 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v7 accountIdentifier];
  [v8 setObjectOrNull:v11 forKey:@"a"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "feature"), @"b");
  unsigned __int8 v12 = [v7 accountBaseURL];
  v13 = (void *)_SQLValueForURL();
  [v8 setObjectOrNull:v13 forKey:@"h"];

  uint64_t v14 = [v7 cloudStoreZoneNames];
  unsigned int v15 = [v14 componentsJoinedByString:@","];
  [v8 setObjectOrNull:v15 forKey:@"cloud_store_zone_names"];

  v16 = [v7 applyServiceURL];
  id v17 = (void *)_SQLValueForURL();
  [v8 setObjectOrNull:v17 forKey:@"k"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isSharedAccount"), @"l");
  id v18 = [v7 altDSID];
  [v8 setObjectOrNull:v18 forKey:@"m"];

  CFStringRef v19 = [v7 previousAccountIdentifiers];
  v20 = [v19 allObjects];
  v21 = [v20 componentsJoinedByString:@","];
  [v8 setObjectOrNull:v21 forKey:@"n"];

  v22 = [v7 paymentServicesBaseURL];
  v23 = (void *)_SQLValueForURL();
  [v8 setObjectOrNull:v23 forKey:@"o"];

  v24 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  v25 = [v7 additionalPushTopics];
  id v26 = +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:v25 forAccountPID:[(SQLiteEntity *)v24 persistentID] inDatabase:v6];

  v27 = [v7 fetchPeriods];
  id v28 = +[AccountFetchPeriods insertOrUpdateAccountFetchPeriods:v27 forAccountPID:[(SQLiteEntity *)v24 persistentID] inDatabase:v6];

  [(Account *)v24 _updateForAccount:v7 persistentID:[(SQLiteEntity *)v24 persistentID] database:v6 deleteOnFailedMatch:0];
  v29 = +[TransactionSource insertTransactionSourceWithType:3 inDatabase:v6];

  v30 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v29 persistentID]);
  [(SQLiteEntity *)v24 setValue:v30 forProperty:@"transaction_source_pid"];

  return v24;
}

+ (id)accountWithVirtualCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForVirtualCardIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 account];

  return v9;
}

+ (id)accountWithPhysicalCardIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPhysicalCardIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 account];

  return v9;
}

+ (BOOL)hasAnyAccountInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 anyInDatabase:v4 predicate:v5];

  return v6 != 0;
}

+ (id)anyInDatabase:(id)a3 withPreviousAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = +[SQLiteStringLikePredicate predicateWithProperty:@"n" matchingPattern:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withType:(id)a4
{
  id v6 = a3;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (void)updateWithAccount:(id)a3
{
  id v4 = a3;
  id v26 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v26, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
  objc_msgSend(v26, "setInteger:forKey:", objc_msgSend(v4, "state"), @"d");
  objc_msgSend(v26, "setInteger:forKey:", objc_msgSend(v4, "stateReason"), @"i");
  objc_msgSend(v26, "setBool:forKey:", objc_msgSend(v4, "blockAllAccountAccess"), @"block_all_account_access");
  objc_msgSend(v26, "setBool:forKey:", objc_msgSend(v4, "blockNotifications"), @"j");
  objc_msgSend(v26, "setBool:forKey:", objc_msgSend(v4, "isCloudAccount"), @"p");
  objc_msgSend(v26, "setInteger:forKey:", objc_msgSend(v4, "accessLevel"), @"e");
  objc_msgSend(v26, "setBool:forKey:", objc_msgSend(v4, "accountStateDirty"), @"f");
  id v5 = [v4 lastUpdated];
  id v6 = (void *)_SQLValueForDate();
  [v26 setObjectOrNull:v6 forKey:@"g"];

  id v7 = [v4 accountIdentifier];
  [v26 setObjectOrNull:v7 forKey:@"a"];

  objc_msgSend(v26, "setInteger:forKey:", objc_msgSend(v4, "feature"), @"b");
  id v8 = [v4 accountBaseURL];
  id v9 = (void *)_SQLValueForURL();
  [v26 setObjectOrNull:v9 forKey:@"h"];

  id v10 = [v4 cloudStoreZoneNames];
  id v11 = [v10 componentsJoinedByString:@","];
  [v26 setObjectOrNull:v11 forKey:@"cloud_store_zone_names"];

  unsigned __int8 v12 = [v4 applyServiceURL];
  v13 = (void *)_SQLValueForURL();
  [v26 setObjectOrNull:v13 forKey:@"k"];

  objc_msgSend(v26, "setBool:forKey:", objc_msgSend(v4, "isSharedAccount"), @"l");
  uint64_t v14 = [v4 altDSID];
  [v26 setObjectOrNull:v14 forKey:@"m"];

  unsigned int v15 = [v4 previousAccountIdentifiers];
  v16 = [v15 allObjects];
  id v17 = [v16 componentsJoinedByString:@","];
  [v26 setObjectOrNull:v17 forKey:@"n"];

  id v18 = [v4 paymentServicesBaseURL];
  CFStringRef v19 = (void *)_SQLValueForURL();
  [v26 setObjectOrNull:v19 forKey:@"o"];

  [(SQLiteEntity *)self setValuesWithDictionary:v26];
  int64_t v20 = [(SQLiteEntity *)self persistentID];
  v21 = [(SQLiteEntity *)self database];
  +[AccountAdditionalPushTopics deleteAccountAdditionalPushTopicsForAccountPID:v20 inDatabase:v21];
  v22 = [v4 additionalPushTopics];
  id v23 = +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:v22 forAccountPID:v20 inDatabase:v21];

  v24 = [v4 fetchPeriods];
  id v25 = +[AccountFetchPeriods insertOrUpdateAccountFetchPeriods:v24 forAccountPID:v20 inDatabase:v21];

  [(Account *)self _updateForAccount:v4 persistentID:v20 database:v21 deleteOnFailedMatch:1];
}

- (void)_updateForAccount:(id)a3 persistentID:(int64_t)a4 database:(id)a5 deleteOnFailedMatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  BOOL v57 = v6;
  switch((unint64_t)[v9 type])
  {
    case 1uLL:
      id v11 = [v9 details];
      v58 = [v11 creditDetails];
      if (v58)
      {
        +[CreditAccountDetails updateCreditAccountDetails:v11 forAccountPID:a4 inDatabase:v10];
      }
      else
      {
        unsigned int v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (objc_class *)objc_opt_class();
          id v17 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138543362;
          v80 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Details are not of class credit:%{public}@ , deleting exsiting details", buf, 0xCu);
        }
        if (v6) {
          +[CreditAccountDetails deleteCreditAccountDetailsForAccountPID:a4 inDatabase:v10];
        }
      }
      int64_t v18 = a4;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      CFStringRef v19 = [v9 supportedFeatures];
      id v20 = [v19 countByEnumeratingWithState:&v71 objects:v78 count:16];
      if (!v20) {
        goto LABEL_22;
      }
      id v21 = v20;
      uint64_t v22 = *(void *)v72;
LABEL_16:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v21 == (id)++v23)
        {
          id v21 = [v19 countByEnumeratingWithState:&v71 objects:v78 count:16];
          if (!v21)
          {
LABEL_22:

            v24 = [v9 supportedFeatures];
            +[CreditAccountFeatureDescriptor updateCreditAccountFeatureDescriptors:v24 forAccountPID:v18 inDatabase:v10];
            goto LABEL_74;
          }
          goto LABEL_16;
        }
      }

      id v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Descriptors did not match PKCreditAccountFeatureDescriptor class.", buf, 2u);
      }

      if (v57) {
        +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountPID:v18 inDatabase:v10];
      }
      goto LABEL_75;
    case 2uLL:
      id v11 = [v9 details];
      v58 = [v11 payLaterDetails];
      if (v58)
      {
        id v12 = +[PayLaterAccountDetails insertOrUpdateAccountDetails:v11 forAccountPID:a4 inDatabase:v10];
      }
      else
      {
        id v26 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (objc_class *)objc_opt_class();
          id v28 = NSStringFromClass(v27);
          *(_DWORD *)buf = 138543362;
          v80 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Details are not of class payLater:%{public}@", buf, 0xCu);
        }
        if (v6) {
          +[PayLaterAccountDetails deleteAccountDetailsForAccountPID:a4 inDatabase:v10];
        }
      }
      int64_t v29 = a4;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v30 = [v9 supportedFeatures];
      v31 = (char *)[v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (!v31) {
        goto LABEL_39;
      }
      v32 = v31;
      uint64_t v33 = *(void *)v68;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(void *)v68 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v35 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Descriptors did not match PKPayLaterAccountFeatureDescriptor class.", buf, 2u);
            }

            if (v57) {
              +[PayLaterAccountFeatureDescriptor deletePayLaterAccountFeatureDescriptorsForAccountPID:v29 inDatabase:v10];
            }
            goto LABEL_75;
          }
        }
        v32 = (char *)[v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
        if (v32) {
          continue;
        }
        break;
      }
LABEL_39:

      v24 = [v9 supportedFeatures];
      +[PayLaterAccountFeatureDescriptor insertOrUpdatePayLaterAccountFeatureDescriptors:v24 forAccountPID:v29 inDatabase:v10];
      goto LABEL_74;
    case 3uLL:
      id v11 = [v9 details];
      v58 = [v11 appleBalanceDetails];
      if (v58)
      {
        id v13 = +[AppleBalanceAccountDetails insertOrUpdateAccountDetails:v11 forAccountPID:a4 inDatabase:v10];
      }
      else
      {
        v36 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543362;
          v80 = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Details are not of class appleBalance:%{public}@", buf, 0xCu);
        }
        if (v6) {
          +[AppleBalanceAccountDetails deleteAccountDetailsForAccountPID:a4 inDatabase:v10];
        }
      }
      int64_t v39 = a4;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v40 = [v9 supportedFeatures];
      v41 = (char *)[v40 countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (!v41) {
        goto LABEL_56;
      }
      v42 = v41;
      uint64_t v43 = *(void *)v64;
      while (2)
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(void *)v64 != v43) {
            objc_enumerationMutation(v40);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v45 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Descriptors did not match PKAppleAccountFeatureDescriptor class.", buf, 2u);
            }

            if (v57) {
              +[AppleBalanceAccountFeatureDescriptor deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:v39 inDatabase:v10];
            }
            goto LABEL_75;
          }
        }
        v42 = (char *)[v40 countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v42) {
          continue;
        }
        break;
      }
LABEL_56:

      v24 = [v9 supportedFeatures];
      +[AppleBalanceAccountFeatureDescriptor insertOrUpdateAppleBalanceAccountFeatureDescriptors:v24 forAccountPID:v39 inDatabase:v10];
      goto LABEL_74;
    case 4uLL:
      id v11 = [v9 details];
      v58 = [v11 savingsDetails];
      if (v58)
      {
        id v14 = +[SavingsAccountDetails insertOrUpdateSavingsAccountDetails:v11 forAccountPID:a4 inDatabase:v10];
      }
      else
      {
        v46 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = (objc_class *)objc_opt_class();
          v48 = NSStringFromClass(v47);
          *(_DWORD *)buf = 138543362;
          v80 = v48;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Details are not of class savings: %{public}@", buf, 0xCu);
        }
        if (v6)
        {
          +[SavingsAccountDetails deleteSavingsAccountDetailsForAccountPID:a4 inDatabase:v10];
          v49 = [v9 accountIdentifier];
          +[SavingsAccountStatement deleteSavingsAccountStatementsForAccount:v49 inDatabase:v10];
        }
      }
      int64_t v50 = a4;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v51 = [v9 supportedFeatures];
      v52 = (char *)[v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
      if (!v52) {
        goto LABEL_73;
      }
      v53 = v52;
      uint64_t v54 = *(void *)v60;
      break;
    default:
      goto LABEL_76;
  }
  while (2)
  {
    for (k = 0; k != v53; ++k)
    {
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(v51);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v56 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Descriptors did not match PKSavingsAccountFeatureDescriptor class.", buf, 2u);
        }

        if (v57) {
          +[SavingsAccountFeatureDescriptor deleteSavingsAccountFeatureDescriptorsForAccountPID:v50 inDatabase:v10];
        }
        goto LABEL_75;
      }
    }
    v53 = (char *)[v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
    if (v53) {
      continue;
    }
    break;
  }
LABEL_73:

  v24 = [v9 supportedFeatures];
  +[SavingsAccountFeatureDescriptor updateSavingsAccountFeatureDescriptors:v24 forAccountPID:v50 inDatabase:v10];
LABEL_74:

LABEL_75:
LABEL_76:
}

- (id)account
{
  id v3 = objc_alloc_init((Class)PKAccount);
  id v4 = +[Account _propertySettersForAccount];
  id v5 = [v4 allKeys];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100214E90;
  v34[3] = &unk_10072EDD0;
  id v6 = v4;
  id v35 = v6;
  id v7 = v3;
  id v36 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v34];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[AccountAdditionalPushTopics accountAdditionalPushTopicsForAccountPID:v8 inDatabase:v9];
  [v7 setAdditionalPushTopics:v10];
  id v11 = +[AccountFetchPeriods accountFetchPeriodsForAccountPID:v8 inDatabase:v9];
  [v7 setFetchPeriods:v11];
  switch((unint64_t)[v7 type])
  {
    case 1uLL:
      id v12 = +[CreditAccountDetails creditAccountDetailsForAccountPID:v8 inDatabase:v9];
      [v7 setDetails:v12];

      int64_t v13 = [(SQLiteEntity *)self persistentID];
      id v14 = [(SQLiteEntity *)self database];
      unsigned int v15 = +[CreditAccountFeatureDescriptor creditAccountFeatureDescriptorsForAccountPID:v13 inDatabase:v14];

      [v7 setSupportedFeatures:v15];
      v16 = [(SQLiteEntity *)self valueForProperty:@"e"];
      id v17 = [v16 integerValue];

      if (v17 == (id)1)
      {
        int64_t v18 = [(SQLiteEntity *)self persistentID];
        CFStringRef v19 = [(SQLiteEntity *)self database];
        int64_t v20 = +[AccountUser countOfActivePrimaryUsersForAccountPID:v18 inDatabase:v19];

        [v7 setCoOwner:v20 > 1];
      }
      goto LABEL_8;
    case 2uLL:
      v27 = +[PayLaterAccountDetails accountDetailsForAccountPID:v8 inDatabase:v9];
      [v7 setDetails:v27];

      int64_t v28 = [(SQLiteEntity *)self persistentID];
      uint64_t v23 = [(SQLiteEntity *)self database];
      uint64_t v24 = +[PayLaterAccountFeatureDescriptor payLaterAccountFeatureDescriptorsForAccountPID:v28 inDatabase:v23];
      goto LABEL_7;
    case 3uLL:
      id v21 = +[AppleBalanceAccountDetails accountDetailsForAccountPID:v8 inDatabase:v9];
      [v7 setDetails:v21];

      int64_t v22 = [(SQLiteEntity *)self persistentID];
      uint64_t v23 = [(SQLiteEntity *)self database];
      uint64_t v24 = +[AppleBalanceAccountFeatureDescriptor appleBalanceAccountFeatureDescriptorsForAccountPID:v22 inDatabase:v23];
      goto LABEL_7;
    case 4uLL:
      id v25 = +[SavingsAccountDetails accountDetailsForAccountPID:v8 inDatabase:v9];
      [v7 setDetails:v25];

      int64_t v26 = [(SQLiteEntity *)self persistentID];
      uint64_t v23 = [(SQLiteEntity *)self database];
      uint64_t v24 = +[SavingsAccountFeatureDescriptor savingsAccountFeatureDescriptorsForAccountPID:v26 inDatabase:v23];
LABEL_7:
      unsigned int v15 = (void *)v24;

      [v7 setSupportedFeatures:v15];
LABEL_8:

      break;
    default:
      break;
  }
  int64_t v29 = [v7 accountIdentifier];

  if (v29)
  {
    id v30 = v7;
  }
  else
  {
    v31 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Account does not have an account identifier", v33, 2u);
    }

    id v30 = 0;
  }

  return v30;
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"a"];
}

- (id)previousAccountIdentifiers
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"n"];
  id v3 = [v2 componentsSeparatedByString:@","];

  if ([v3 count]) {
    id v4 = [objc_alloc((Class)NSSet) initWithArray:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)state
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)feature
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)transactionSourceIdentifier
{
  id v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"transaction_source_pid"];
  id v5 = +[TransactionSource anyInDatabase:withPersistentID:](TransactionSource, "anyInDatabase:withPersistentID:", v3, [v4 longLongValue]);
  id v6 = [v5 identifier];

  return v6;
}

+ (void)deleteAccountsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllAccountsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (void)deleteAccountWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 accountWithIdentifier:a3 inDatabase:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (id)deleteVirtualCardEncryptedDataForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  int64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int64_t v20 = sub_1000209FC;
  id v21 = sub_100020FF0;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100215364;
  v12[3] = &unk_1007325B8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  unsigned int v15 = &v17;
  sub_10000817C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  id v5 = [(Account *)self accountIdentifier];
  +[CreditAccountDetails deleteCreditAccountDetailsForAccountPID:v3 inDatabase:v4];
  +[PayLaterAccountDetails deleteAccountDetailsForAccountPID:v3 inDatabase:v4];
  +[AppleBalanceAccountDetails deleteAccountDetailsForAccountPID:v3 inDatabase:v4];
  +[SavingsAccountDetails deleteSavingsAccountDetailsForAccountPID:v3 inDatabase:v4];
  +[SavingsAccountStatement deleteSavingsAccountStatementsForAccount:v5 inDatabase:v4];
  +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountPID:v3 inDatabase:v4];
  +[AccountEvent deleteAccountEventsForAccountPID:v3 inDatabase:v4];
  +[AccountAdditionalPushTopics deleteAccountAdditionalPushTopicsForAccountPID:v3 inDatabase:v4];
  +[AccountFetchPeriods deleteAccountFetchPeriodsForAccountPID:v3 inDatabase:v4];
  id v6 = [(SQLiteEntity *)self valueForProperty:@"a"];
  +[AccountPayment deleteScheduledPaymentsWithAccountIdentifier:v6 inDatabase:v4];

  id v7 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[AccountUser deleteAccountUsersForAccountPID:v7 inDatabase:v4];

  +[SharedAccountCloudStore deleteEntitiesForAccountPID:v3 inDatabase:v4];
  id v8 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[AccountPendingFamilyMember deleteAccountPendingFamilyMembersForAccountPID:v8 inDatabase:v4];

  +[PhysicalCard deletePhysicalCardsForAccountPID:v3 inDatabase:v4];
  +[AccountWebServiceEndpointMetadata deleteEntitiesForAccountPID:v3 inDatabase:v4];
  id v9 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[AccountPaymentFundingSource deletePaymentFundingSourcesForAccountPID:v9 inDatabase:v4];

  +[TransactionSource deleteEntitiesInDatabase:v4 forAccount:self];
  +[AccountPromotion deleteAccountPromotionsForAccountPID:v3 inDatabase:v4];
  +[AccountPromotionBehavior deleteAccountPromotionBehaviorForAccountPID:v3 inDatabase:v4];
  +[AccountEnhancedMerchant deleteAccountEnhancedMerchantsForAccountPID:v3 inDatabase:v4];
  +[AccountEnhancedMerchantBehavior deleteAccountEnhancedMerchantBehaviorForAccountPID:v3 inDatabase:v4];
  +[CreditRecoveryPaymentPlan deleteCreditRecoveryPaymentPlansForAccountIdentifier:v5 inDatabase:v4];
  +[AccountEntityOrdering deleteAccountEntityOrderingsForAccountPID:v3 inDatabase:v4];
  unint64_t v10 = [(Account *)self feature];
  switch(v10)
  {
    case 4uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:4 accountPID:v3 inDatabase:v4];
      +[AppleBalanceAccountFeatureDescriptor deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:v3 inDatabase:v4];
      break;
    case 3uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:3 accountPID:v3 inDatabase:v4];
      +[PayLaterAccountFeatureDescriptor deletePayLaterAccountFeatureDescriptorsForAccountPID:v3 inDatabase:v4];
      +[PayLaterCardMagnitudes deleteMagnitudesForAccountIdentifier:v5 inDatabase:v4];
      break;
    case 2uLL:
      +[AccountEndpointBackOff deleteEntriesForAccountType:2 accountPID:v3 inDatabase:v4];
      break;
  }
  v13.receiver = self;
  v13.super_class = (Class)Account;
  BOOL v11 = [(SQLiteEntity *)&v13 deleteFromDatabase];

  return v11;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"blackberries.b" equalToValue:a3];
}

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"raspberries.b" equalToValue:a3];
}

+ (id)_propertySettersForAccount
{
  v4[0] = @"d";
  v4[1] = @"i";
  v5[0] = &stru_100740798;
  v5[1] = &stru_1007407B8;
  v4[2] = @"block_all_account_access";
  v4[3] = @"j";
  v5[2] = &stru_1007407D8;
  v5[3] = &stru_1007407F8;
  v4[4] = @"p";
  v4[5] = @"c";
  v5[4] = &stru_100740818;
  v5[5] = &stru_100740838;
  v4[6] = @"e";
  v4[7] = @"a";
  v5[6] = &stru_100740858;
  v5[7] = &stru_100740878;
  v4[8] = @"b";
  v4[9] = @"f";
  v5[8] = &stru_100740898;
  v5[9] = &stru_1007408B8;
  v4[10] = @"g";
  v4[11] = @"h";
  v5[10] = &stru_1007408D8;
  v5[11] = &stru_1007408F8;
  v4[12] = @"cloud_store_zone_names";
  v4[13] = @"k";
  v5[12] = &stru_100740918;
  v5[13] = &stru_100740938;
  v4[14] = @"l";
  v4[15] = @"m";
  v5[14] = &stru_100740958;
  v5[15] = &stru_100740978;
  v4[16] = @"n";
  v4[17] = @"o";
  v5[16] = &stru_100740998;
  v5[17] = &stru_1007409B8;
  v4[18] = @"transaction_source.identifier";
  v5[18] = &stru_1007409D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:19];
  return v2;
}

@end