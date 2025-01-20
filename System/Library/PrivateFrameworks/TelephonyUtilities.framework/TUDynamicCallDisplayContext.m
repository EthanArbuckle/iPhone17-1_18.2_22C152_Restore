@interface TUDynamicCallDisplayContext
- (CXCallDirectoryManager)callDirectoryManager;
- (OS_dispatch_queue)serialQueue;
- (TUDynamicCallDisplayContext)init;
- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5;
- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6;
- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6;
- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6 cacheOnly:(BOOL)a7;
- (TUDynamicCallDisplayContext)initWithCoder:(id)a3;
- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5;
- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6;
- (TUDynamicCallDisplayContextDelegate)delegate;
- (id)description;
- (void)_initializeAsynchronousStateWithCall:(id)a3 cacheOnly:(BOOL)a4;
- (void)_initializeSynchronousStateWithCall:(id)a3 contactIdentifier:(id)a4 contactsDataProvider:(id)a5;
- (void)setCallDirectoryManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation TUDynamicCallDisplayContext

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5
{
  return [(TUDynamicCallDisplayContext *)self initWithCall:a3 contactIdentifier:a4 serialQueue:a5 cacheOnly:1];
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v12 contactsDataSourceCreationBlock];
  v14 = v13[2]();

  v15 = [(TUDynamicCallDisplayContext *)self initWithCall:v12 contactIdentifier:v11 serialQueue:v10 contactsDataSource:v14 cacheOnly:v6];
  return v15;
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6
{
  return [(TUDynamicCallDisplayContext *)self initWithCall:a3 contactIdentifier:a4 serialQueue:a5 contactsDataSource:a6 cacheOnly:1];
}

- (TUDynamicCallDisplayContext)initWithCall:(id)a3 contactIdentifier:(id)a4 serialQueue:(id)a5 contactsDataSource:(id)a6 cacheOnly:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)TUDynamicCallDisplayContext;
  v17 = [(TUCallDisplayContext *)&v25 init];
  if (!v17) {
    goto LABEL_12;
  }
  if (v13)
  {
    if (v15) {
      goto LABEL_4;
    }
LABEL_14:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, v17, @"TUDynamicCallDisplayContext.m", 71, @"Invalid parameter not satisfying: %@", @"serialQueue != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
LABEL_15:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, v17, @"TUDynamicCallDisplayContext.m", 72, @"Invalid parameter not satisfying: %@", @"contactsDataSource != nil" object file lineNumber description];

    goto LABEL_5;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, v17, @"TUDynamicCallDisplayContext.m", 70, @"Invalid parameter not satisfying: %@", @"call != nil" object file lineNumber description];

  if (!v15) {
    goto LABEL_14;
  }
LABEL_4:
  if (!v16) {
    goto LABEL_15;
  }
LABEL_5:
  v18 = TUDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:contactsDataSource:cacheOnly:]((uint64_t)v16, v18);
  }

  objc_storeStrong((id *)&v17->_serialQueue, a5);
  v19 = [[TUContactsDataProvider alloc] initWithContactsDataSource:v16];
  [(TUDynamicCallDisplayContext *)v17 _initializeSynchronousStateWithCall:v13 contactIdentifier:v14 contactsDataProvider:v19];
  if (([v13 isInternational] & 1) == 0) {
    [(TUDynamicCallDisplayContext *)v17 _initializeAsynchronousStateWithCall:v13 cacheOnly:v7];
  }
  v20 = TUDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Initialized dynamic display context: %@", buf, 0xCu);
  }

LABEL_12:
  return v17;
}

- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5
{
  return [(TUDynamicCallDisplayContext *)self initWithDisplayContext:a3 call:a4 serialQueue:a5 cacheOnly:1];
}

- (TUDynamicCallDisplayContext)initWithDisplayContext:(id)a3 call:(id)a4 serialQueue:(id)a5 cacheOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v35.receiver = self;
  v35.super_class = (Class)TUDynamicCallDisplayContext;
  id v14 = [(TUCallDisplayContext *)&v35 init];
  if (!v14) {
    goto LABEL_8;
  }
  if (v12)
  {
    if (v13) {
      goto LABEL_4;
    }
LABEL_10:
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, v14, @"TUDynamicCallDisplayContext.m", 99, @"Invalid parameter not satisfying: %@", @"serialQueue != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
LABEL_11:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, v14, @"TUDynamicCallDisplayContext.m", 100, @"Invalid parameter not satisfying: %@", @"displayContext != nil" object file lineNumber description];

    goto LABEL_5;
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, v14, @"TUDynamicCallDisplayContext.m", 98, @"Invalid parameter not satisfying: %@", @"call != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (!v11) {
    goto LABEL_11;
  }
LABEL_5:
  objc_storeStrong((id *)&v14->_serialQueue, a5);
  id v15 = [v11 name];
  [(TUCallDisplayContext *)v14 setName:v15];

  id v16 = [v11 personNameComponents];
  [(TUCallDisplayContext *)v14 setPersonNameComponents:v16];

  v17 = [v11 suggestedName];
  [(TUCallDisplayContext *)v14 setSuggestedName:v17];

  v18 = [v11 label];
  [(TUCallDisplayContext *)v14 setLabel:v18];

  v19 = [v11 mapName];
  [(TUCallDisplayContext *)v14 setMapName:v19];

  v20 = [v11 companyName];
  [(TUCallDisplayContext *)v14 setCompanyName:v20];

  v21 = [v11 companyDepartment];
  [(TUCallDisplayContext *)v14 setCompanyDepartment:v21];

  v22 = [v11 companyLogoURL];
  [(TUCallDisplayContext *)v14 setCompanyLogoURL:v22];

  v23 = [v11 location];
  [(TUCallDisplayContext *)v14 setLocation:v23];

  v24 = [v11 contactName];
  [(TUCallDisplayContext *)v14 setContactName:v24];

  objc_super v25 = [v11 contactLabel];
  [(TUCallDisplayContext *)v14 setContactLabel:v25];

  v26 = [v11 callDirectoryLabel];
  [(TUCallDisplayContext *)v14 setCallDirectoryLabel:v26];

  v27 = [v11 callDirectoryExtensionIdentifier];
  [(TUCallDisplayContext *)v14 setCallDirectoryExtensionIdentifier:v27];

  uint64_t v28 = [v11 callDirectoryLocalizedExtensionContainingAppName];
  [(TUCallDisplayContext *)v14 setCallDirectoryLocalizedExtensionContainingAppName:v28];

  -[TUCallDisplayContext setCallDirectoryIdentityType:](v14, "setCallDirectoryIdentityType:", [v11 callDirectoryIdentityType]);
  v29 = [v11 contactIdentifiers];
  [(TUCallDisplayContext *)v14 setContactIdentifiers:v29];

  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](v14, "setLegacyAddressBookIdentifier:", [v11 legacyAddressBookIdentifier]);
  [(TUDynamicCallDisplayContext *)v14 _initializeAsynchronousStateWithCall:v12 cacheOnly:v6];
  v30 = TUDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v14;
    _os_log_impl(&dword_19C496000, v30, OS_LOG_TYPE_DEFAULT, "Initialized dynamic display context: %@", buf, 0xCu);
  }

LABEL_8:
  return v14;
}

- (TUDynamicCallDisplayContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUDynamicCallDisplayContext.m", 137, @"%s is not available. Use another initializer instead.", "-[TUDynamicCallDisplayContext init]");

  return 0;
}

- (TUDynamicCallDisplayContext)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUDynamicCallDisplayContext.m", 142, @"%s is not available. Use another initializer instead.", "-[TUDynamicCallDisplayContext initWithCoder:]");

  return 0;
}

- (void)_initializeSynchronousStateWithCall:(id)a3 contactIdentifier:(id)a4 contactsDataProvider:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 isInternational];
  id v12 = [[TUContactsDataProviderFetchRequest alloc] initWithCall:v8];
  [(TUContactsDataProviderFetchRequest *)v12 setContactIdentifier:v9];
  v92 = v12;
  v93 = v10;
  id v13 = [v10 executeFetchRequest:v12];
  id v14 = v13;
  if (v11)
  {
    id v15 = [v8 remoteParticipantHandles];
    id v16 = [v15 anyObject];

    v17 = [v16 value];
    if ([v17 length])
    {
      v18 = [v8 isoCountryCode];
      v19 = TUFormattedPhoneNumber(v17, v18);
      [(TUCallDisplayContext *)self setName:v19];
    }
    v20 = [v14 contacts];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [v14 localizedName];
      [(TUCallDisplayContext *)self setSuggestedName:v22];
    }
  }
  else
  {
    v23 = [v13 localizedName];
    [(TUCallDisplayContext *)self setName:v23];

    v24 = [v14 contactLabel];
    [(TUCallDisplayContext *)self setLabel:v24];

    id v16 = [v14 companyName];
    [(TUCallDisplayContext *)self setCompanyName:v16];
  }

  objc_super v25 = [v8 handle];
  uint64_t v26 = [v25 siriDisplayName];
  if (v26)
  {
    v27 = (void *)v26;
    uint64_t v28 = [v8 handle];
    int v29 = [v28 shouldHideContact];

    if (!v29) {
      goto LABEL_12;
    }
    objc_super v25 = [v8 handle];
    v30 = [v25 siriDisplayName];
    [(TUCallDisplayContext *)self setName:v30];
  }
LABEL_12:
  if (v11) {
    goto LABEL_27;
  }
  v31 = [v14 contacts];
  if (![v31 count])
  {

    goto LABEL_27;
  }
  if ([v8 isConversation])
  {
    v32 = [v8 remoteParticipantHandles];
    uint64_t v33 = [v32 count];

    if (v33 != 1) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v89 = v9;
  v34 = [v14 contacts];
  v87 = [v34 firstObject];

  objc_super v35 = [(TUCallDisplayContext *)self name];
  [(TUCallDisplayContext *)self setContactName:v35];

  v36 = [(TUCallDisplayContext *)self label];
  [(TUCallDisplayContext *)self setContactLabel:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v38 = [v14 contacts];
  v39 = objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v40 = [v14 contacts];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v95 objects:v101 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v96 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [*(id *)(*((void *)&v95 + 1) + 8 * i) identifier];
        [v39 addObject:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v95 objects:v101 count:16];
    }
    while (v42);
  }

  [(TUCallDisplayContext *)self setContactIdentifiers:v39];
  v46 = [v87 personNameComponents];
  [(TUCallDisplayContext *)self setPersonNameComponents:v46];

  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](self, "setLegacyAddressBookIdentifier:", [v14 legacyAddressBookIdentifier]);
  id v9 = v89;
LABEL_27:
  v47 = [(TUCallDisplayContext *)self personNameComponents];
  if (v47)
  {
    v48 = (void *)MEMORY[0x1E4F28F38];
    v49 = [(TUCallDisplayContext *)self personNameComponents];
    v50 = [v48 localizedStringFromPersonNameComponents:v49 style:3 options:0];
  }
  else
  {
    v50 = 0;
  }

  v51 = [(TUCallDisplayContext *)self contactIdentifiers];
  if (![v51 count])
  {

    goto LABEL_35;
  }
  v52 = [(TUCallDisplayContext *)self contactIdentifiers];
  if (![v52 count]) {
    goto LABEL_66;
  }
  uint64_t v53 = [v50 length];

  if (!v53)
  {
LABEL_35:
    v51 = [v8 callerNameFromNetwork];
    if ([v51 length])
    {
      v54 = [v8 provider];
      int v55 = [v54 isTelephonyProvider];

      if (v55) {
        [(TUCallDisplayContext *)self setLabel:v51];
      }
      else {
        [(TUCallDisplayContext *)self setName:v51];
      }
    }
    if (![v51 length] && objc_msgSend(v8, "isVoicemail"))
    {
      v56 = TUBundle();
      v57 = [v56 localizedStringForKey:@"VOICEMAIL" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      [(TUCallDisplayContext *)self setName:v57];
    }
    if ([v51 length]) {
      goto LABEL_67;
    }
    v58 = [v8 handle];
    v59 = [v58 value];
    uint64_t v60 = [v59 length];

    if (!v60) {
      goto LABEL_67;
    }
    if ((v11 & 1) == 0)
    {
      v61 = [v8 handle];
      v62 = [v61 value];
      id v94 = 0;
      v63 = +[TUSuggestionsMetadataCacheDataProvider suggestedNamesForDestinationID:v62 onlySignificant:0 error:&v94];
      id v64 = v94;

      if (v64)
      {
        v65 = TUDefaultLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v100 = v64;
          _os_log_impl(&dword_19C496000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: Could not fetch suggested contact via namesForDetail: %@", buf, 0xCu);
        }
      }
      else
      {
        v90 = v63;
        uint64_t v66 = [v63 count];
        v65 = TUDefaultLog();
        BOOL v67 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v67)
          {
            v68 = [v90 firstObject];
            v88 = [v8 handle];
            v69 = [v88 value];
            *(_DWORD *)buf = 138412546;
            *(void *)v100 = v68;
            *(_WORD *)&v100[8] = 2112;
            *(void *)&v100[10] = v69;
            _os_log_impl(&dword_19C496000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: Found name '%@' for '%@'", buf, 0x16u);
          }
          v63 = v90;
          v65 = [v90 firstObject];
          [(TUCallDisplayContext *)self setSuggestedName:v65];
        }
        else
        {
          if (v67)
          {
            v70 = [v8 handle];
            v71 = [v70 value];
            *(_DWORD *)buf = 138412290;
            *(void *)v100 = v71;
            _os_log_impl(&dword_19C496000, v65, OS_LOG_TYPE_DEFAULT, "Suggestions: No suggested names found for '%@'", buf, 0xCu);
          }
          v63 = v90;
        }
      }
    }
    if ([v8 isDomestic]
      && ([v8 handle],
          v72 = objc_claimAutoreleasedReturnValue(),
          uint64_t v73 = [v72 type],
          v72,
          v73 != 3))
    {
      if ([v8 isIncoming])
      {
        v80 = +[TUNicknamesMetadataCacheDataProvider sharedInstance];
        v81 = [v8 handle];
        v82 = [v81 normalizedValue];
        v91 = v80;
        v83 = [v80 fetchNicknameForHandleValue:v82];

        if (v83)
        {
          [(TUCallDisplayContext *)self setSuggestedName:v83];
          v84 = TUDefaultLog();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v100 = v83;
            _os_log_impl(&dword_19C496000, v84, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: found suggestedNickname: %@", buf, 0xCu);
          }
        }
        else
        {
          v84 = TUDefaultLog();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            v85 = [v8 handle];
            v86 = [v85 value];
            *(_DWORD *)buf = 138412290;
            *(void *)v100 = v86;
            _os_log_impl(&dword_19C496000, v84, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: No nicknames found for '%@'", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      v74 = TUDefaultLog();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        int v75 = [v8 isDomestic];
        v76 = [v8 handle];
        uint64_t v77 = [v76 type];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v100 = v75;
        *(_WORD *)&v100[4] = 2048;
        *(void *)&v100[6] = v77;
        _os_log_impl(&dword_19C496000, v74, OS_LOG_TYPE_DEFAULT, "SNAP Suggestions: Hiding suggested nickname to prevent phishing. (isDomestic = %d, handleType = %ld)", buf, 0x12u);
      }
      [v8 isIncoming];
    }
    if (![v8 isIncoming]) {
      goto LABEL_67;
    }
    v52 = +[TUMetadataDestinationID metadataDestinationIDForCall:v8];
    if (v52)
    {
      v78 = objc_alloc_init(TUGeoLocationMetadataCacheDataProvider);
      v79 = [(TUGeoLocationMetadataCacheDataProvider *)v78 locationForMetadataIdentifier:v52];
      if (v79)
      {
        [(TUCallDisplayContext *)self setLabel:v79];
        [(TUCallDisplayContext *)self setLocation:v79];
      }
    }
LABEL_66:

LABEL_67:
  }
}

- (void)_initializeAsynchronousStateWithCall:(id)a3 cacheOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  BOOL v7 = [(TUCallDisplayContext *)self contactIdentifiers];
  if ([v7 count]
    || ([v6 handle], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
  }
  else
  {
    id v9 = [v6 handle];
    uint64_t v10 = [v9 type];

    if (v10 == 2)
    {
      int v11 = [v6 handle];
      id v12 = [v11 value];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke;
      v35[3] = &unk_1E58E7F38;
      v35[4] = self;
      id v13 = v6;
      id v36 = v13;
      TUMapItemForDestinationID(v12, v35);

      if ([v13 isIncoming]
        && [v13 verificationStatus] == 1
        && [v13 junkConfidence] <= 0)
      {
        id v14 = +[TUBusinessServicesMetadataDataProvider sharedInstance];
        id v15 = [v13 handle];
        id v16 = [v15 normalizedValue];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_42;
        v31[3] = &unk_1E58E7F60;
        v34 = v37;
        id v32 = v13;
        uint64_t v33 = self;
        [v14 fetchBusinessServiceInformationForHandleValue:v16 completion:v31];
      }
      id v17 = objc_alloc_init((Class)CUTWeakLinkClass());
      [(TUDynamicCallDisplayContext *)self setCallDirectoryManager:v17];

      v18 = [TUPhoneNumber alloc];
      v19 = [v13 handle];
      v20 = [v19 value];
      uint64_t v21 = [v13 isoCountryCode];
      v22 = [(TUPhoneNumber *)v18 initWithDigits:v20 countryCode:v21];

      v23 = [(TUPhoneNumber *)v22 unformattedInternationalRepresentation];
      v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        uint64_t v26 = [v13 handle];
        id v25 = [v26 value];
      }
      v27 = [(TUDynamicCallDisplayContext *)self callDirectoryManager];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_52;
      v28[3] = &unk_1E58E7F88;
      v28[4] = self;
      v30 = v37;
      id v29 = v13;
      [v27 firstIdentificationEntryForEnabledExtensionWithPhoneNumber:v25 cacheOnly:v4 completionHandler:v28];
    }
  }
  _Block_object_dispose(v37, 8);
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2;
    block[3] = &unk_1E58E6258;
    id v8 = v3;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = v6;
    dispatch_async(v4, block);
  }
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Found map item %@ for call: %@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 48) setName:v5];

  uint64_t v6 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 48) setMapName:v6];

  BOOL v7 = [*(id *)(a1 + 48) delegate];
  [v7 displayContextChanged:*(void *)(a1 + 48)];
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Already found call directory identification entry for call: %@, not populating business information.", buf, 0xCu);
    }
  }
  else if (v3)
  {
    BOOL v7 = [*(id *)(a1 + 40) serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_43;
    block[3] = &unk_1E58E6258;
    id v13 = v4;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    dispatch_async(v7, block);

    id v5 = v13;
  }
  else
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [*(id *)(a1 + 32) handle];
      uint64_t v11 = [v10 value];
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "No business information found for '%@'", buf, 0xCu);
    }
  }
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_43(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Found business item %@ for call: %@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 48) setLabel:v5];

  uint64_t v6 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 48) setCompanyName:v6];

  BOOL v7 = [*(id *)(a1 + 32) department];
  [*(id *)(a1 + 48) setCompanyDepartment:v7];

  id v8 = [*(id *)(a1 + 32) logoURL];
  [*(id *)(a1 + 48) setCompanyLogoURL:v8];

  uint64_t v9 = [*(id *)(a1 + 48) delegate];
  [v9 displayContextChanged:*(void *)(a1 + 48)];
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2_53;
    block[3] = &unk_1E58E74A0;
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v14 = v9;
    uint64_t v15 = v11;
    uint64_t v16 = v10;
    dispatch_async(v8, block);

    __int16 v12 = v14;
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    __int16 v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_52_cold_1(a1, (uint64_t)v7, v12);
    }
    goto LABEL_6;
  }
LABEL_7:
  [*(id *)(a1 + 32) setCallDirectoryManager:0];
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_2_53(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Found call directory identification entry %@", (uint8_t *)&v11, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v4 = [*(id *)(a1 + 32) localizedLabel];
  [*(id *)(a1 + 40) setCallDirectoryLabel:v4];

  id v5 = [*(id *)(a1 + 32) localizedExtensionContainingAppName];
  [*(id *)(a1 + 40) setCallDirectoryLocalizedExtensionContainingAppName:v5];

  id v6 = [*(id *)(a1 + 32) extensionIdentifier];
  [*(id *)(a1 + 40) setCallDirectoryExtensionIdentifier:v6];

  BOOL v7 = [*(id *)(a1 + 32) iconURL];
  [*(id *)(a1 + 40) setCompanyLogoURL:v7];

  uint64_t v8 = [*(id *)(a1 + 32) type];
  if (v8 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * (v8 == 2);
  }
  [*(id *)(a1 + 40) setCallDirectoryIdentityType:v9];
  uint64_t v10 = [*(id *)(a1 + 40) delegate];
  [v10 displayContextChanged:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(TUCallDisplayContext *)self name];
  [v3 appendFormat:@" name=%@", v4];

  id v5 = [(TUCallDisplayContext *)self personNameComponents];
  [v3 appendFormat:@" personNameComponents=%@", v5];

  id v6 = [(TUCallDisplayContext *)self suggestedName];
  [v3 appendFormat:@" suggestedName=%@", v6];

  BOOL v7 = [(TUCallDisplayContext *)self label];
  [v3 appendFormat:@" label=%@", v7];

  uint64_t v8 = [(TUCallDisplayContext *)self companyName];
  [v3 appendFormat:@" companyName=%@", v8];

  uint64_t v9 = [(TUCallDisplayContext *)self companyDepartment];
  [v3 appendFormat:@" companyDepartment=%@", v9];

  uint64_t v10 = [(TUCallDisplayContext *)self companyLogoURL];
  [v3 appendFormat:@" companyLogoURL=%@", v10];

  int v11 = [(TUCallDisplayContext *)self mapName];
  [v3 appendFormat:@" mapName=%@", v11];

  uint64_t v12 = [(TUCallDisplayContext *)self location];
  [v3 appendFormat:@" location=%@", v12];

  uint64_t v13 = [(TUCallDisplayContext *)self contactName];
  [v3 appendFormat:@" contactName=%@", v13];

  uint64_t v14 = [(TUCallDisplayContext *)self contactLabel];
  [v3 appendFormat:@" contactLabel=%@", v14];

  uint64_t v15 = [(TUCallDisplayContext *)self callDirectoryLabel];
  [v3 appendFormat:@" callDirectoryLabel=%@", v15];

  uint64_t v16 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  [v3 appendFormat:@" callDirectoryLocalizedExtensionContainingAppName=%@", v16];

  id v17 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
  [v3 appendFormat:@" callDirectoryExtensionIdentifier=%@", v17];

  objc_msgSend(v3, "appendFormat:", @" callDirectoryIdentityType=%ld", -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"));
  [v3 appendString:@">"];
  uint64_t v18 = (void *)[v3 copy];

  return v18;
}

- (TUDynamicCallDisplayContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUDynamicCallDisplayContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (CXCallDirectoryManager)callDirectoryManager
{
  return self->_callDirectoryManager;
}

- (void)setCallDirectoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDirectoryManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithCall:(uint64_t)a1 contactIdentifier:(NSObject *)a2 serialQueue:contactsDataSource:cacheOnly:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "TUCall contacts data source is a '%{public}@'", (uint8_t *)&v5, 0xCu);
}

void __78__TUDynamicCallDisplayContext__initializeAsynchronousStateWithCall_cacheOnly___block_invoke_52_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = [*(id *)(a1 + 40) handle];
  id v6 = [v5 value];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_19C496000, a3, OS_LOG_TYPE_ERROR, "Error retrieving call directory first identification entry for phone number %@: %@", (uint8_t *)&v7, 0x16u);
}

@end