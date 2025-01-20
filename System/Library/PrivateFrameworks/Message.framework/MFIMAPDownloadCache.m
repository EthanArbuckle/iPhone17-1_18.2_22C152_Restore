@interface MFIMAPDownloadCache
- (id)downloadForMessage:(id)a3;
- (id)downloadForUid:(unsigned int)a3 section:(id)a4 expectedLength:(unint64_t)a5 consumer:(id)a6;
- (id)downloadForUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6;
- (id)downloadForUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6;
- (void)addCommandsForDownload:(id)a3 toPipeline:(id)a4;
- (void)cleanUpDownloadsForUid:(unsigned int)a3;
- (void)handleFetchResponse:(id)a3 forUid:(unsigned int)a4;
- (void)handleFetchResponses:(id)a3;
- (void)processResultsForUid:(unsigned int)a3;
@end

@implementation MFIMAPDownloadCache

- (id)downloadForMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [v4 uid];
  [(MFIMAPDownloadCache *)self mf_lock];
  unint64_t RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, v5);
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [(NSMutableArray *)self->_downloads objectAtIndex:RangeOfDownloadsWithUid];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_13;
    }
LABEL_4:
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }

  if (!v5)
  {
LABEL_7:
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v4, "ef_publicDescription");
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "uid of message %{public}@ is 0", (uint8_t *)&v14, 0xCu);
    }
  }
LABEL_10:
  v11 = [[MFIMAPMessageDownload alloc] initWithMessage:v4];
  v12 = v11;
  if (v11)
  {
    [(MFIMAPMessageDownload *)v11 setAllowsPartialDownloads:1];
    v8 = v12;
    [(NSMutableArray *)self->_downloads insertObject:v12 atIndex:RangeOfDownloadsWithUid];
  }
  else
  {
    v8 = 0;
  }
LABEL_13:
  [(MFIMAPDownloadCache *)self mf_unlock];

  return v8;
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6
{
  v6 = _getDownload(self, *(uint64_t *)&a3, a4, a5, a5, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
  return v6;
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 expectedLength:(unint64_t)a5 consumer:(id)a6
{
  v6 = _getDownload(self, *(uint64_t *)&a3, a4, 0xFFFFFFFFLL, a5, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
  return v6;
}

- (id)downloadForUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6
{
  v6 = _getDownload(self, *(uint64_t *)&a3, a4, 0xFFFFFFFFLL, 0xFFFFFFFFLL, a5.location, a5.length, a6);
  return v6;
}

- (void)handleFetchResponse:(id)a3 forUid:(unsigned int)a4
{
  id v10 = a3;
  [(MFIMAPDownloadCache *)self mf_lock];
  unint64_t RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a4);
  uint64_t v8 = v7;
  v9 = [v10 fetchResults];
  _lockedUpdateDownloadsInRange(self, RangeOfDownloadsWithUid, v8, v9);

  [(MFIMAPDownloadCache *)self mf_unlock];
}

- (void)handleFetchResponses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  if ([v15 count])
  {
    [(MFIMAPDownloadCache *)self mf_lock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v15;
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      unsigned int v5 = 0;
      uint64_t v6 = 0;
      unint64_t RangeOfDownloadsWithUid = 0;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = [v10 fetchResultWithType:8];
          unsigned int v12 = [v11 uid];

          if (v12)
          {
            if (v12 != v5)
            {
              unint64_t RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, v12);
              uint64_t v6 = v13;
              unsigned int v5 = v12;
            }
            int v14 = [v10 fetchResults];
            _lockedUpdateDownloadsInRange(self, RangeOfDownloadsWithUid, v6, v14);
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v4);
    }

    [(MFIMAPDownloadCache *)self mf_unlock];
  }
}

- (void)processResultsForUid:(unsigned int)a3
{
  [(MFIMAPDownloadCache *)self mf_lock];
  unint64_t RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a3);
  if (RangeOfDownloadsWithUid < RangeOfDownloadsWithUid + v6)
  {
    unint64_t v7 = RangeOfDownloadsWithUid;
    uint64_t v8 = v6;
    do
    {
      v9 = [(NSMutableArray *)self->_downloads objectAtIndex:v7];
      [v9 processResults];

      ++v7;
      --v8;
    }
    while (v8);
  }
  [(MFIMAPDownloadCache *)self mf_unlock];
}

- (void)cleanUpDownloadsForUid:(unsigned int)a3
{
  [(MFIMAPDownloadCache *)self mf_lock];
  unint64_t RangeOfDownloadsWithUid = _lockedFindRangeOfDownloadsWithUid(self, a3);
  unint64_t v7 = RangeOfDownloadsWithUid + v6;
  if (RangeOfDownloadsWithUid + v6 > RangeOfDownloadsWithUid)
  {
    unint64_t v8 = RangeOfDownloadsWithUid;
    do
    {
      v9 = [(NSMutableArray *)self->_downloads objectAtIndex:--v7];
      if ([v9 isComplete]) {
        [(NSMutableArray *)self->_downloads removeObjectAtIndex:v7];
      }
    }
    while (v7 > v8);
  }
  [(MFIMAPDownloadCache *)self mf_unlock];
}

- (void)addCommandsForDownload:(id)a3 toPipeline:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MFIMAPDownloadCache *)self mf_lock];
  [v7 addCommandsToPipeline:v6 withCache:self];
  [(MFIMAPDownloadCache *)self mf_unlock];
}

- (void).cxx_destruct
{
}

@end