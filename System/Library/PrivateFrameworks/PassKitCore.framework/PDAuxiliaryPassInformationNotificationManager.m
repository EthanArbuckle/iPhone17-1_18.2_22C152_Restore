@interface PDAuxiliaryPassInformationNotificationManager
- (PDAuxiliaryPassInformationNotificationManager)initWithUserNotificationManager:(id)a3;
- (id)_itemIdentifiersPropertyNameAndRoomNumbersForInformation:(id)a3;
- (void)_didInsertOrUpdateHospitalityPass:(id)a3 oldPass:(id)a4;
- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4;
@end

@implementation PDAuxiliaryPassInformationNotificationManager

- (PDAuxiliaryPassInformationNotificationManager)initWithUserNotificationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAuxiliaryPassInformationNotificationManager;
  v6 = [(PDAuxiliaryPassInformationNotificationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userNotificationManager, a3);
  }

  return v7;
}

- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isAccessPass] && objc_msgSend(v7, "accessType") == (id)1) {
    [(PDAuxiliaryPassInformationNotificationManager *)self _didInsertOrUpdateHospitalityPass:v7 oldPass:v6];
  }
}

- (void)_didInsertOrUpdateHospitalityPass:(id)a3 oldPass:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    CFStringRef v84 = v5;
    __int16 v85 = 2113;
    CFStringRef v86 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_didInsertOrUpdateHospitalityPass: %{private}@, oldPass: %{private}@", buf, 0x16u);
  }

  v55 = v5;
  v8 = [(__CFString *)v5 auxiliaryPassInformation];
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v54 = v6;
  v10 = [(__CFString *)v6 auxiliaryPassInformation];
  id v11 = [v10 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v16 = [v15 identifier];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v12);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v17 = v8;
  id v58 = [v17 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v58)
  {
    id obj = v17;
    v18 = 0;
    LOBYTE(v17) = 0;
    int v64 = 0;
    uint64_t v57 = *(void *)v73;
LABEL_12:
    v19 = 0;
    v20 = v18;
    while (1)
    {
      if (*(void *)v73 != v57) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v19);
      v22 = [v21 identifier];
      v23 = [v9 objectForKey:v22];

      v24 = [(PDAuxiliaryPassInformationNotificationManager *)self _itemIdentifiersPropertyNameAndRoomNumbersForInformation:v21];
      v25 = [(PDAuxiliaryPassInformationNotificationManager *)self _itemIdentifiersPropertyNameAndRoomNumbersForInformation:v23];
      id v26 = objc_alloc((Class)NSSet);
      v67 = v24;
      v27 = [v24 allKeys];
      id v28 = [v26 initWithArray:v27];

      id v29 = objc_alloc((Class)NSSet);
      v65 = v25;
      v30 = [v25 allKeys];
      id v66 = [v29 initWithArray:v30];

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v63 = v28;
      id v31 = [v63 countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (v31)
      {
        id v32 = v31;
        v60 = v20;
        v61 = v19;
        v62 = v23;
        uint64_t v33 = *(void *)v69;
        while (2)
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v69 != v33) {
              objc_enumerationMutation(v63);
            }
            uint64_t v35 = *(void *)(*((void *)&v68 + 1) + 8 * (void)j);
            v36 = [v67 objectForKey:v35];
            v18 = [v36 objectAtIndexedSubscript:0];
            if (![v66 containsObject:v35])
            {
              int v64 = 1;
LABEL_34:

              goto LABEL_35;
            }
            unsigned int v37 = 1;
            v38 = [v36 objectAtIndexedSubscript:1];
            v39 = [v65 objectForKey:v35];
            v40 = [v39 objectAtIndexedSubscript:1];

            id v41 = v38;
            id v42 = v40;
            v43 = v42;
            if (v41 != v42)
            {
              if (v41) {
                BOOL v44 = v42 == 0;
              }
              else {
                BOOL v44 = 1;
              }
              if (v44) {
                unsigned int v37 = 0;
              }
              else {
                unsigned int v37 = [v41 isEqualToString:v42];
              }
            }

            LODWORD(v17) = v37 ^ 1;
            if ((v64 | v17)) {
              goto LABEL_34;
            }

            LOBYTE(v17) = 0;
          }
          id v32 = [v63 countByEnumeratingWithState:&v68 objects:v80 count:16];
          LOBYTE(v17) = 0;
          if (v32) {
            continue;
          }
          break;
        }
        v18 = v60;
        int v64 = 0;
LABEL_35:
        v19 = v61;
        v23 = v62;
      }
      else
      {
        v18 = v20;
      }

      if (v64 & 1) != 0 || (v17) {
        break;
      }

      v19 = (char *)v19 + 1;
      v20 = v18;
      if (v19 == v58)
      {
        id v58 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
        if (v58) {
          goto LABEL_12;
        }
        id v17 = obj;
        goto LABEL_51;
      }
    }
    v45 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v46 = @"NO";
      if (v64) {
        CFStringRef v47 = @"YES";
      }
      else {
        CFStringRef v47 = @"NO";
      }
      if (v17) {
        CFStringRef v46 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v84 = v47;
      __int16 v85 = 2112;
      CFStringRef v86 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "hasNewCheckIn: %@, hasChangedCheckIn: %@", buf, 0x16u);
    }

    id v17 = obj;
    if (v18)
    {
      v48 = PKLocalizedPaymentString(@"HOSPITALITY_PASS_UPDATE_TAP_TO_UNLOCK_UNAVAILABLE_TITLE");
      v49 = PKLocalizedPaymentString(@"HOSPITALITY_PASS_UPDATE_TAP_TO_UNLOCK_UNAVAILABLE_FORMAT");
      v50 = PKStringWithValidatedFormat();
      v51 = [PDGenericUserNotification alloc];
      v52 = [(__CFString *)v55 uniqueID];
      v53 = [(PDGenericUserNotification *)v51 initWithTitle:v48 message:v50 forPassUniqueIdentifier:v52];

      id v17 = obj;
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v53];

      goto LABEL_52;
    }
  }
  else
  {
    v18 = 0;
LABEL_51:
    v48 = v17;
LABEL_52:
  }
}

- (id)_itemIdentifiersPropertyNameAndRoomNumbersForInformation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKArbitrarySupplementaryFieldPrefix;
  v36 = +[NSString stringWithFormat:@"%@room", PKArbitrarySupplementaryFieldPrefix];
  id v5 = +[NSString stringWithFormat:@"%@tap_to_unlock_unavailable", v4];
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  id v28 = v3;
  [v3 items];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v32 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v6;
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        uint64_t v35 = [v7 identifier];
        v34 = [v7 title];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v8 = [v7 fields];
        id v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v9)
        {
          id v10 = v9;
          int v11 = 0;
          id v12 = 0;
          uint64_t v13 = *(void *)v38;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v8);
              }
              v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v16 = [v15 key];
              id v17 = v16;
              if (v16)
              {
                id v18 = [v16 length];

                if (v18)
                {
                  v19 = [v15 value];
                  if ([v17 hasPrefix:v36])
                  {
                    if (PKIsStringRoomNumber(v19))
                    {
                      id v20 = v19;

                      id v12 = v20;
                    }
                  }
                  else
                  {
                    unsigned int v21 = v17 == v5;
                    if (v17 != v5 && v5 != 0) {
                      unsigned int v21 = [v17 isEqualToString:v5];
                    }
                    v11 |= v21;
                  }
                  id v23 = v12;
                  id v12 = v23;
                  if (v23)
                  {
                    BOOL v24 = [v23 length] != 0;

                    if (v24 & v11)
                    {
                      v45[0] = v34;
                      v45[1] = v12;
                      v25 = +[NSArray arrayWithObjects:v45 count:2];
                      [v30 setObject:v25 forKey:v35];

                      goto LABEL_30;
                    }
                  }
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v12 = 0;
        }
LABEL_30:

        uint64_t v6 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v32);
  }
  id v26 = [v30 copy];

  return v26;
}

- (void).cxx_destruct
{
}

@end