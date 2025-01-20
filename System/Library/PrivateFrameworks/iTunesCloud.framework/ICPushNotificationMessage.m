@interface ICPushNotificationMessage
- (ICPushNotificationMessage)initWithMessageUserInfo:(id)a3;
- (NSArray)jaliscoChangedMediaTypes;
- (NSArray)sagaUpdatedSubscribedPlaylistIDs;
- (NSDictionary)apsPayload;
- (NSDictionary)userInfo;
- (NSString)clientIdentifier;
- (int64_t)accountDSID;
- (int64_t)actionType;
- (int64_t)jaliscoServerRevision;
- (int64_t)moduleIdentifier;
- (int64_t)sagaServerRevision;
@end

@implementation ICPushNotificationMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsPayload, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (NSDictionary)apsPayload
{
  return self->_apsPayload;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)accountDSID
{
  return self->_accountDSID;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (ICPushNotificationMessage)initWithMessageUserInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(ICPushNotificationMessage *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userInfo, a3);
    v7->_accountDSID = objc_msgSend(v5, "ic_int64ValueForKey:", @"0");
    v7->_actionType = (int)objc_msgSend(v5, "ic_intValueForKey:", @"1");
    v8 = objc_msgSend(v5, "ic_stringValueForKey:", @"10");
    v9 = v8;
    if (v8 && ![v8 isEqualToString:@"application/json"])
    {
      if ([v9 isEqualToString:@"application/gzip"])
      {
        v10 = objc_msgSend(v5, "ic_stringValueForKey:", @"aps");
        if (v10)
        {
          v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
          if (v11)
          {
            v12 = MSVGzipDecompressData();
            if (v12)
            {
              id v22 = 0;
              uint64_t v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:&v22];
              v14 = v22;
              apsPayload = v7->_apsPayload;
              v7->_apsPayload = (NSDictionary *)v13;

              if (!v7->_apsPayload || (v16 = 0, v14))
              {
                v17 = _ICLogCategoryDefault();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v24 = v7;
                  __int16 v25 = 2114;
                  v26 = v14;
                  _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize aps payload data. err=%{public}@", buf, 0x16u);
                }

                v16 = v14;
              }
            }
            else
            {
              v16 = _ICLogCategoryDefault();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v24 = v7;
                _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to decompress aps payload data.", buf, 0xCu);
              }
            }
          }
          else
          {
            v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v24 = v7;
              _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to decode compressed aps payload data.", buf, 0xCu);
            }
          }
        }
        goto LABEL_17;
      }
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v7;
        __int16 v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ unknown APS format %{public}@. assuming dictionary", buf, 0x16u);
      }
    }
    uint64_t v19 = objc_msgSend(v5, "ic_dictionaryValueForKey:", @"aps");
    v20 = v7->_apsPayload;
    v7->_apsPayload = (NSDictionary *)v19;

LABEL_17:
  }

  return v7;
}

- (NSArray)sagaUpdatedSubscribedPlaylistIDs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSDictionary *)self->_userInfo ic_arrayValueForKey:@"3"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!_NSIsNSNumber())
        {

          id v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v7 = v2;
LABEL_11:

  return (NSArray *)v7;
}

- (int64_t)sagaServerRevision
{
  return [(NSDictionary *)self->_userInfo ic_int64ValueForKey:@"2"];
}

- (NSArray)jaliscoChangedMediaTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSDictionary *)self->_userInfo ic_arrayValueForKey:@"3"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!_NSIsNSString())
        {

          id v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v7 = v2;
LABEL_11:

  return (NSArray *)v7;
}

- (int64_t)jaliscoServerRevision
{
  return [(NSDictionary *)self->_userInfo ic_int64ValueForKey:@"2"];
}

- (int64_t)moduleIdentifier
{
  return [(NSDictionary *)self->_userInfo ic_intValueForKey:@"10"];
}

- (NSString)clientIdentifier
{
  return (NSString *)[(NSDictionary *)self->_userInfo ic_stringValueForKey:@"2"];
}

@end