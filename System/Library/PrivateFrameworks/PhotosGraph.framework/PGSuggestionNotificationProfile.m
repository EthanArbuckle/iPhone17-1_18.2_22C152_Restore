@interface PGSuggestionNotificationProfile
+ (double)_requiredTimeIntervalFromLastNotificationForUserType:(unsigned __int8)a3;
+ (unsigned)_requiredNotificationQualityForUserType:(unsigned __int8)a3;
- (BOOL)eligibleForNotification;
- (BOOL)shouldNotifyForSuggestion:(id)a3 withOptions:(id)a4;
- (NSDate)dateOfLastNotification;
- (OS_os_log)loggingConnection;
- (PGSuggestionNotificationProfile)initWithExistingSuggestions:(id)a3 serviceManager:(id)a4;
- (id)shareParticipantContactIdentifiers;
- (unsigned)notificationQualityForEnrichableEvent:(id)a3;
- (unsigned)notificationQualityForHighlightNode:(id)a3;
- (unsigned)userType;
- (void)_determineUserTypeAndEligibility;
- (void)setLoggingConnection:(id)a3;
@end

@implementation PGSuggestionNotificationProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastNotification, 0);
  objc_storeStrong((id *)&self->_shareParticipantContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
}

- (void)setLoggingConnection:(id)a3
{
  self->_loggingConnection = (OS_os_log *)a3;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (unsigned)notificationQualityForEnrichableEvent:(id)a3
{
  return 4;
}

- (unsigned)notificationQualityForHighlightNode:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 meaningLabels];
  v6 = [v4 personNodes];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__PGSuggestionNotificationProfile_notificationQualityForHighlightNode___block_invoke;
  v34[3] = &unk_1E68E5360;
  v34[4] = self;
  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v34];
  v8 = [v6 filteredSetUsingPredicate:v7];

  uint64_t v9 = [v8 count];
  if ([v5 count])
  {
    v10 = +[PGGraph mostSignificantMeaningLabels];
    if ([v5 intersectsSet:v10])
    {

LABEL_9:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v5;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality must see: %@", buf, 0xCu);
      }
      unsigned __int8 v13 = 4;
      goto LABEL_36;
    }
    uint64_t v29 = v9;
    char v14 = [v4 isPartOfTrip];

    if (v14) {
      goto LABEL_9;
    }
    v27 = v8;
    v28 = v6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v16);
          }
          v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (([v23 isMeNode] & 1) == 0)
          {
            v19 += [v23 isFavorite];
            v20 += [v23 belongsToBestSocialGroups];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
    }

    v24 = self->_loggingConnection;
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v29 || v19 || v20)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v36 = (uint64_t)v5;
        __int16 v37 = 2048;
        uint64_t v38 = v29;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        __int16 v41 = 2048;
        uint64_t v42 = v20;
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality stellar: it has a meaning %@ and important people (previous sharing recipients %lu, favorites %lu, best social group %lu)", buf, 0x2Au);
      }
      unsigned __int8 v13 = 3;
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v5;
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality great: it has a meaning %@", buf, 0xCu);
      }
      unsigned __int8 v13 = 2;
    }
    v8 = v27;
    v6 = v28;
  }
  else
  {
    v11 = self->_loggingConnection;
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v36 = v9;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality great: it contains %lu previous sharing recipients", buf, 0xCu);
      }
      unsigned __int8 v13 = 2;
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality other", buf, 2u);
      }
      unsigned __int8 v13 = 1;
    }
  }
LABEL_36:

  return v13;
}

uint64_t __71__PGSuggestionNotificationProfile_notificationQualityForHighlightNode___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 shareParticipantContactIdentifiers];
  v5 = [v3 contactIdentifier];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)_determineUserTypeAndEligibility
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  id v54 = (id)objc_opt_new();
  v48 = (void *)v4;
  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:7 subtype:0x7FFFFFFFFFFFFFFFLL options:v4];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [obj countByEnumeratingWithState:&v63 objects:v82 count:16];
  id v5 = 0;
  if (v49)
  {
    unint64_t v45 = 0;
    uint64_t v47 = *(void *)v64;
    do
    {
      uint64_t v6 = 0;
      do
      {
        v52 = v5;
        if (*(void *)v64 != v47) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v63 + 1) + 8 * v6);
        uint64_t v51 = v6;
        v7 = objc_msgSend(MEMORY[0x1E4F392E8], "fetchParticipantsInShare:options:", v45);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v59 objects:v81 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v60;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v60 != v10) {
                objc_enumerationMutation(v7);
              }
              BOOL v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
              unsigned __int8 v13 = [v12 emailAddress];
              if (v13 || ([v12 phoneNumber], (unsigned __int8 v13 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                char v14 = [(CLSServiceManager *)self->_serviceManager personForPersonHandle:v13];
                v15 = [v14 CNIdentifier];
                if ([v15 length])
                {
                  [v54 addObject:v15];
                }
                else
                {
                  loggingConnection = self->_loggingConnection;
                  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v68 = v12;
                    *(_WORD *)&v68[8] = 2112;
                    *(void *)v69 = v13;
                    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No person node found for share participant: %@, identifier: %@", buf, 0x16u);
                  }
                }
              }
              else
              {
                uint64_t v17 = self->_loggingConnection;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v68 = v12;
                  _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No identifier available for share participant: %@", buf, 0xCu);
                }
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v18 = [v7 countByEnumeratingWithState:&v59 objects:v81 count:16];
            uint64_t v9 = v18;
          }
          while (v18);
        }
        uint64_t v19 = [v50 creationDate];
        uint64_t v20 = v19;
        if (v52)
        {
          uint64_t v21 = [v19 laterDate:v52];

          id v5 = (id)v21;
        }
        else
        {
          id v5 = v19;
        }

        uint64_t v6 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v45 += v49;
      uint64_t v49 = [obj countByEnumeratingWithState:&v63 objects:v82 count:16];
    }
    while (v49);
  }
  else
  {
    unint64_t v45 = 0;
  }
  objc_storeStrong((id *)&self->_shareParticipantContactIdentifiers, v54);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v22 = self->_existingSuggestions;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    unint64_t v25 = 0;
    uint64_t v53 = 0;
    uint64_t v26 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v28, "notificationState", v45))
        {
          dateOfLastNotification = self->_dateOfLastNotification;
          long long v30 = [v28 creationDate];
          long long v31 = v30;
          if (dateOfLastNotification)
          {
            long long v32 = [(NSDate *)dateOfLastNotification laterDate:v30];
            long long v33 = self->_dateOfLastNotification;
            self->_dateOfLastNotification = v32;
          }
          else
          {
            v34 = self->_dateOfLastNotification;
            self->_dateOfLastNotification = v30;
            long long v31 = v34;
          }

          if ([v28 state] == 3)
          {
            ++v53;
          }
          else if ([v28 state] == 4)
          {
            ++v25;
          }
        }
        v35 = [v28 creationDate];
        if ([v28 state] == 3 && v35 != 0)
        {
          if (v5)
          {
            uint64_t v37 = [v35 laterDate:v5];

            id v5 = (id)v37;
          }
          else
          {
            id v5 = v35;
          }
        }
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v55 objects:v80 count:16];
    }
    while (v24);
  }
  else
  {
    unint64_t v25 = 0;
    uint64_t v53 = 0;
  }

  uint64_t v38 = v5;
  if (v5) {
    BOOL v39 = v45 == 0;
  }
  else {
    BOOL v39 = 1;
  }
  int v40 = v39;
  if (v39 && v25 < 2)
  {
    int v41 = 1;
  }
  else if (v45 >= 3 && v53)
  {
    int v41 = 2;
  }
  else if (v25 > 1 || v38 && ([v38 timeIntervalSinceNow], v42 > 2592000.0))
  {
    int v41 = 3;
  }
  else
  {
    int v41 = 4;
  }
  self->_userType = v41;
  self->_eligibleForNotification = v25 < 4;
  v43 = self->_loggingConnection;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    shareParticipantContactIdentifiers = self->_shareParticipantContactIdentifiers;
    *(_DWORD *)buf = 67110914;
    *(_DWORD *)v68 = v25 < 4;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v41;
    *(_WORD *)v69 = 2112;
    *(void *)&v69[2] = shareParticipantContactIdentifiers;
    __int16 v70 = 1024;
    int v71 = v40;
    __int16 v72 = 2048;
    unint64_t v73 = v45;
    __int16 v74 = 2112;
    v75 = v38;
    __int16 v76 = 2048;
    uint64_t v77 = v53;
    __int16 v78 = 2048;
    unint64_t v79 = v25;
    _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Summary for Notification Profile:\n\teligibleForNotification: %d\n\tuserType: %d\n\tshareParticipantContactIdentifiers: %@\n\tuserNeverShared: %d\n\tnumberOfMomentShare: %lu\n\tlastMomentShare: %@\n\tnumberOfSuccessfulNotifications: %lu\n\tnumberOfUnsuccessfulNotifications: %lu\n\t", buf, 0x46u);
  }
}

- (BOOL)shouldNotifyForSuggestion:(id)a3 withOptions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F76C68];
  uint64_t v8 = [a4 localToday];
  uint64_t v9 = [v7 universalDateFromLocalDate:v8];

  uint64_t v10 = [v6 universalEndDate];
  [v9 timeIntervalSinceDate:v10];
  if (v11 < 0.0) {
    double v11 = -v11;
  }
  if (v11 <= 604800.0)
  {
    uint64_t v14 = [(PGSuggestionNotificationProfile *)self userType];
    unsigned int v15 = [v6 notificationQuality];
    if (v15 >= [(id)objc_opt_class() _requiredNotificationQualityForUserType:v14])
    {
      id v16 = [(PGSuggestionNotificationProfile *)self dateOfLastNotification];
      if (v16)
      {
        [(id)objc_opt_class() _requiredTimeIntervalFromLastNotificationForUserType:v14];
        double v18 = v17;
        [v9 timeIntervalSinceDate:v16];
        if (v19 >= 0.0) {
          double v20 = v19;
        }
        else {
          double v20 = -v19;
        }
        BOOL v13 = v20 > v18;
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 67109634;
          *(_DWORD *)uint64_t v29 = v20 > v18;
          *(_WORD *)&v29[4] = 2048;
          *(double *)&v29[6] = v18 / 86400.0;
          *(_WORD *)&v29[14] = 2112;
          *(void *)&v29[16] = v9;
          _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Should notify for suggestion: %d (requiredTimeIntervalFromLastNotification %.0f - queryDate %@)", (uint8_t *)&v28, 0x1Cu);
        }
      }
      else
      {
        BOOL v13 = 1;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    v22 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v15 > 4) {
        uint64_t v23 = @"Unknown";
      }
      else {
        uint64_t v23 = off_1E68EA2A8[v15];
      }
      uint64_t v24 = v23;
      unint64_t v25 = v24;
      if (v14 > 4) {
        uint64_t v26 = @"Unknown";
      }
      else {
        uint64_t v26 = off_1E68E5380[v14];
      }
      int v28 = 67109634;
      *(_DWORD *)uint64_t v29 = v13;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v24;
      *(_WORD *)&v29[14] = 2112;
      *(void *)&v29[16] = v26;
      _os_log_impl(&dword_1D1805000, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Should notify for suggestion: %d (notification quality %@ - user type %@)", (uint8_t *)&v28, 0x1Cu);
    }
  }
  else
  {
    BOOL v12 = self->_loggingConnection;
    LOBYTE(v13) = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134218498;
      *(void *)uint64_t v29 = 7;
      *(_WORD *)&v29[8] = 2112;
      *(void *)&v29[10] = v9;
      *(_WORD *)&v29[18] = 2112;
      *(void *)&v29[20] = v10;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Cannot notify suggestion: above time window limit of %lu days (query date %@, suggestion date %@)", (uint8_t *)&v28, 0x20u);
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (NSDate)dateOfLastNotification
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType) {
    [(PGSuggestionNotificationProfile *)v2 _determineUserTypeAndEligibility];
  }
  objc_sync_exit(v2);

  dateOfLastNotification = v2->_dateOfLastNotification;
  return dateOfLastNotification;
}

- (id)shareParticipantContactIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType) {
    [(PGSuggestionNotificationProfile *)v2 _determineUserTypeAndEligibility];
  }
  objc_sync_exit(v2);

  shareParticipantContactIdentifiers = v2->_shareParticipantContactIdentifiers;
  return shareParticipantContactIdentifiers;
}

- (unsigned)userType
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType) {
    [(PGSuggestionNotificationProfile *)v2 _determineUserTypeAndEligibility];
  }
  objc_sync_exit(v2);

  return v2->_userType;
}

- (BOOL)eligibleForNotification
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType) {
    [(PGSuggestionNotificationProfile *)v2 _determineUserTypeAndEligibility];
  }
  objc_sync_exit(v2);

  return v2->_eligibleForNotification;
}

- (PGSuggestionNotificationProfile)initWithExistingSuggestions:(id)a3 serviceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSuggestionNotificationProfile;
  uint64_t v9 = [(PGSuggestionNotificationProfile *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_existingSuggestions, a3);
    objc_storeStrong((id *)&v10->_serviceManager, a4);
  }

  return v10;
}

+ (double)_requiredTimeIntervalFromLastNotificationForUserType:(unsigned __int8)a3
{
  if ((a3 - 1) > 3u) {
    return 978307200.0;
  }
  else {
    return dbl_1D1F4F3A8[(a3 - 1)];
  }
}

+ (unsigned)_requiredNotificationQualityForUserType:(unsigned __int8)a3
{
  unint64_t v3 = 0x304020300uLL >> (8 * a3);
  if (a3 >= 5u) {
    LOBYTE(v3) = 0;
  }
  return v3 & 7;
}

@end