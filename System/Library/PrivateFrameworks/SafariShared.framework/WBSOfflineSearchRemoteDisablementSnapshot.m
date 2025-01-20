@interface WBSOfflineSearchRemoteDisablementSnapshot
- (BOOL)_isCurrentSafariVersionDisabled:(id)a3;
- (BOOL)areOfflineSearchSuggestionsDisabledRemotelyForSearchProvider:(id)a3;
- (WBSOfflineSearchRemoteDisablementSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)snapshotData;
@end

@implementation WBSOfflineSearchRemoteDisablementSnapshot

- (BOOL)areOfflineSearchSuggestionsDisabledRemotelyForSearchProvider:(id)a3
{
  v4 = [(NSDictionary *)self->_disablementDictionary safari_dictionaryForKey:a3];
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "safari_BOOLForKey:", @"OfflineSearchDisabled"))
    {
      char v6 = 1;
    }
    else
    {
      v7 = objc_msgSend(v5, "safari_dictionaryForKey:", @"DisabledSafariVersions");
      if ([(WBSOfflineSearchRemoteDisablementSnapshot *)self _isCurrentSafariVersionDisabled:v7])
      {
        char v6 = 1;
      }
      else
      {
        v8 = objc_msgSend(v5, "safari_arrayForKey:", @"DisabledLocales");
        v9 = [MEMORY[0x1E4F1CA20] currentLocale];
        v10 = objc_msgSend(v9, "safari_localeStringInOfflineSearchModelFormat");
        char v6 = [v8 containsObject:v10];
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (WBSOfflineSearchRemoteDisablementSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSOfflineSearchRemoteDisablementSnapshot;
  v7 = [(WBSOfflineSearchRemoteDisablementSnapshot *)&v13 init];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:", v6);
  disablementDictionary = v7->_disablementDictionary;
  v7->_disablementDictionary = (NSDictionary *)v8;

  if (!v7->_disablementDictionary)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[WBSOfflineSearchRemoteDisablementSnapshot initWithSnapshotData:error:](v11);
      if (a4) {
        goto LABEL_6;
      }
    }
    else if (a4)
    {
LABEL_6:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = v7;
LABEL_9:

  return v10;
}

- (id)snapshotData
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_disablementDictionary format:200 options:0 error:0];
}

- (BOOL)_isCurrentSafariVersionDisabled:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = objc_msgSend(v4, "safari_normalizedVersion");

    id v6 = objc_msgSend(v3, "safari_arrayForKey:", @"DisallowedSafariVersionsList");
    if ([v6 containsObject:v5])
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v3, "safari_stringForKey:", @"DisabledBeforeVersionNumber");
      v9 = (void *)v8;
      v10 = @"0";
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v11 = v10;

      uint64_t v12 = objc_msgSend(v3, "safari_stringForKey:", @"DisabledAfterVersionNumber");
      objc_super v13 = (void *)v12;
      v14 = @"9999999999";
      if (v12) {
        v14 = (__CFString *)v12;
      }
      v15 = v14;

      char v16 = [(__CFString *)v11 safari_isVersionStringGreaterThanVersionString:v5];
      if (v16) {
        LOBYTE(v7) = 1;
      }
      else {
        int v7 = [(__CFString *)v15 safari_isVersionStringGreaterThanOrEqualToVersionString:v5] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to decode disablement dictionary", v1, 2u);
}

@end