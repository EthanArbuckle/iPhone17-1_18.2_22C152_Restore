@interface MKPUTRouter
- (BOOL)isAllowedPath:(id)a3;
- (MKPUTRouter)init;
- (MKPUTRouterDelegate)delegate;
- (NSArray)supportedTransferEncodings;
- (NSMutableArray)supportedContentTypes;
- (void)_server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSupportedContentTypes:(id)a3;
- (void)setSupportedTransferEncodings:(id)a3;
@end

@implementation MKPUTRouter

- (MKPUTRouter)init
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)MKPUTRouter;
  v2 = [(MKPUTRouter *)&v32 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKDevice);
    uint64_t v4 = [(MKDevice *)v3 type];

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v4 == 1)
    {
      v6 = [NSNumber numberWithInteger:6];
      [v5 setObject:v6 forKey:@"application/vnd.com.apple.migrationkit.placeholder.v1.1+json"];

      v7 = [NSNumber numberWithInteger:8];
      [v5 setObject:v7 forKey:@"application/vnd.com.apple.migrationkit.call.history+json"];

      v8 = [NSNumber numberWithInteger:12];
      [v5 setObject:v8 forKey:@"application/vnd.com.apple.migrationkit.container.v1.1"];
    }
    v9 = [NSNumber numberWithInteger:0];
    [v5 setObject:v9 forKey:@"application/vnd.com.apple.migrationkit.account+json"];

    v10 = [NSNumber numberWithInteger:1];
    [v5 setObject:v10 forKey:@"application/vnd.com.apple.migrationkit.message+json"];

    v11 = [NSNumber numberWithInteger:2];
    [v5 setObject:v11 forKey:@"application/vnd.com.apple.migrationkit.bookmark+json"];

    v12 = [NSNumber numberWithInteger:3];
    [v5 setObject:v12 forKey:@"application/vnd.com.apple.migrationkit.application+json"];

    v13 = [NSNumber numberWithInteger:4];
    [v5 setObject:v13 forKey:@"application/vnd.com.apple.migrationkit.setting.accessibility+json"];

    v14 = [NSNumber numberWithInteger:5];
    [v5 setObject:v14 forKey:@"application/vnd.com.apple.migrationkit.setting.display+json"];

    if (+[MKSIMMigrator isSupported])
    {
      v15 = [NSNumber numberWithInteger:7];
      [v5 setObject:v15 forKey:@"application/vnd.com.apple.migrationkit.sim+json"];
    }
    v16 = [NSNumber numberWithInteger:13];
    [v5 setObject:v16 forKey:@"application/vnd.com.apple.migrationkit.diagnostics"];

    v17 = [NSNumber numberWithInteger:14];
    [v5 setObject:v17 forKey:@"application/vnd.com.apple.migrationkit.performance+json"];

    v18 = [NSNumber numberWithInteger:9];
    [v5 setObject:v18 forKey:@"text/vcard"];

    v19 = [NSNumber numberWithInteger:10];
    [v5 setObject:v19 forKey:@"text/calendar"];

    v20 = [NSNumber numberWithInteger:11];
    [v5 setObject:v20 forKey:@"application/octet-stream"];

    objc_storeStrong((id *)&v2->_routing, v5);
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(MKPUTRouter *)v2 setSupportedContentTypes:v21];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          [(NSMutableArray *)v2->_supportedContentTypes addObject:*(void *)(*((void *)&v28 + 1) + 8 * v26++)];
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v24);
    }

    [(NSMutableArray *)v2->_supportedContentTypes addObject:@"image/*"];
    [(NSMutableArray *)v2->_supportedContentTypes addObject:@"video/*"];
    [(NSMutableArray *)v2->_supportedContentTypes addObject:@"audio/*"];
    [(NSMutableArray *)v2->_supportedContentTypes addObject:@"application/*"];
    [(NSMutableArray *)v2->_supportedContentTypes addObject:@"multipart/mixed"];
    [(MKPUTRouter *)v2 setSupportedTransferEncodings:&unk_26DF7B010];
  }
  return v2;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v16 = objc_alloc_init(MKTime);
  [(MKPUTRouter *)self _server:v10 didReceiveRequest:v9 response:v8];

  v11 = [v8 headers];

  v12 = [v11 serverTiming];
  [(MKTime *)v16 elapsedTimeInSeconds];
  double v14 = v13;
  [v12 import];
  [v12 setImport:v14 + v15];
}

- (void)_server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [v6 body];
  id v8 = [v6 headers];
  id v9 = [v8 contentType];
  id v10 = +[MKLog log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v58 = self;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v9;
    _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "%@ received a data. content_type=%@", buf, 0x16u);
  }

  if (v9)
  {
    v11 = v9;
    v12 = v7;
    double v13 = [v8 contentDisposition];
    double v14 = [v8 contentRange];
    v49 = [v8 proxyAuthorization];
    v51 = [v8 contentPayload];
    double v15 = [v8 contentDate];
    v16 = [v8 path];
    v56 = (void *)[v16 copy];

    v17 = [v13 filename];
    v55 = (void *)[v17 copy];

    v18 = [v13 folder];
    v53 = (void *)[v18 copy];

    v50 = v13;
    v19 = [v13 originalFilename];
    v54 = (void *)[v19 copy];

    uint64_t v20 = [v14 offset];
    uint64_t v21 = [v14 length];
    v47 = v14;
    uint64_t v22 = [v14 total];
    v48 = v15;
    v52 = [v15 date];
    uint64_t v23 = [v6 chunk];
    char v44 = [v6 chunkedTransferCompleted];
    if (v23)
    {
      id v7 = v23;

      uint64_t v45 = [v6 chunkOffset];
      uint64_t v21 = [v7 length];
      uint64_t v46 = 0;
    }
    else
    {
      uint64_t v45 = v20;
      uint64_t v46 = v22;
      id v7 = v12;
    }
    uint64_t v24 = self;
    id v9 = v11;
    if ([(MKPUTRouter *)self isAllowedPath:v56]
      && [(MKPUTRouter *)self isAllowedPath:v55]
      && [(MKPUTRouter *)self isAllowedPath:v54])
    {
      uint64_t v25 = [(NSDictionary *)self->_routing objectForKey:v11];
      uint64_t v26 = v25;
      if (v25)
      {
        v27 = v49;
        switch([v25 integerValue])
        {
          case 0:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveAccountEncodedInJSON:v7];
            goto LABEL_30;
          case 1:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveMessageEncodedInJSON:v7];
            goto LABEL_30;
          case 2:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveBookmarkEncodedInJSON:v7];
            goto LABEL_30;
          case 3:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveApplicationEncodedInJSON:v7];
            goto LABEL_30;
          case 4:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveAccessibilitySettingEncodedInJSON:v7];
            goto LABEL_30;
          case 5:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveDisplaySettingEncodedInJSON:v7];
            goto LABEL_30;
          case 6:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceivePlaceholderEncodedInJSON:v7];
            goto LABEL_30;
          case 7:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveSIMEncodedInJSON:v7];
            goto LABEL_30;
          case 8:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveCallHistoryEncodedInJSON:v7];
            goto LABEL_30;
          case 9:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveVCard:v7];
            goto LABEL_30;
          case 10:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveICal:v7];
            goto LABEL_30;
          case 11:
            id v42 = v56;
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            LOBYTE(v33) = v44;
            [WeakRetained router:v24 didReceiveFileChunk:v7 filename:v42 offset:v45 length:v21 total:v46 complete:v33];

            goto LABEL_30;
          case 12:
            char v43 = [v51 isRequired];
            char v40 = [v51 isExcludedFromBackup];
            id v41 = v56;
            v38 = [v49 identifier];
            id WeakRetained = (id)[v38 copy];

            v36 = [v49 signature];
            v39 = (void *)[v36 copy];

            id v37 = objc_loadWeakRetained((id *)&v24->_delegate);
            BYTE2(v34) = v44;
            BYTE1(v34) = v40;
            LOBYTE(v34) = v43;
            objc_msgSend(v37, "router:didReceiveContainer:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:", v24, WeakRetained, v39, v7, v41, v45, v21, v46, v34);

            goto LABEL_30;
          case 13:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceiveDiagnosticsFile:v7 filename:v55];
            goto LABEL_30;
          case 14:
            id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            [WeakRetained router:v24 didReceivePerformanceMetrics:v7];
            goto LABEL_30;
          default:
            goto LABEL_16;
        }
      }
      if ([v11 hasPrefix:@"image/"])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        [WeakRetained router:self didReceiveImageChunk:v7 identifier:v56 offset:v45 length:v21 total:v46 filename:v55 collection:v53 originalFilename:v54 complete:v35];
LABEL_29:
        v27 = v49;
LABEL_30:
        long long v29 = v47;

        long long v30 = v48;
LABEL_17:

        goto LABEL_18;
      }
      if ([v11 hasPrefix:@"video/"])
      {
        long long v31 = +[MKLog log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          v58 = (MKPUTRouter *)v45;
          __int16 v59 = 2048;
          uint64_t v60 = v21;
          __int16 v61 = 2048;
          uint64_t v62 = v46;
          _os_log_impl(&dword_22BFAC000, v31, OS_LOG_TYPE_INFO, "offset=%lld, length=%lld, total=%lld", buf, 0x20u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        [WeakRetained router:self didReceiveVideoChunk:v7 identifier:v56 offset:v45 length:v21 total:v46 filename:v55 collection:v53 originalFilename:v54 complete:v35];
        goto LABEL_29;
      }
      if ([v11 hasPrefix:@"audio/"])
      {
        objc_super v32 = +[MKLog log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218754;
          v58 = (MKPUTRouter *)v45;
          __int16 v59 = 2048;
          uint64_t v60 = v21;
          __int16 v61 = 2048;
          uint64_t v62 = v46;
          __int16 v63 = 2112;
          v64 = v52;
          _os_log_impl(&dword_22BFAC000, v32, OS_LOG_TYPE_INFO, "offset=%lld, length=%lld, total=%lld, date_added=%@", buf, 0x2Au);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        [WeakRetained router:self didReceiveAudioChunk:v7 identifier:v56 offset:v45 length:v21 total:v46 filename:v55 originalFilename:v54 dateAdded:v52 complete:v35];
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v26 = +[MKLog log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v58 = self;
        __int16 v59 = 2112;
        uint64_t v60 = (uint64_t)v56;
        __int16 v61 = 2112;
        uint64_t v62 = (uint64_t)v55;
        _os_log_error_impl(&dword_22BFAC000, v26, OS_LOG_TYPE_ERROR, "%@ tried to access but access is denied. path=%@, filename=%@", buf, 0x20u);
      }
    }
    v27 = v49;
LABEL_16:
    long long v29 = v47;
    long long v30 = v48;
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)isAllowedPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    [v3 pathComponents];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", @"..", (void)v12) & 1) != 0
            || ([v9 isEqualToString:@"~"] & 1) != 0)
          {
            BOOL v10 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        BOOL v10 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
LABEL_15:
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (MKPUTRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKPUTRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(id)a3
{
}

- (NSArray)supportedTransferEncodings
{
  return self->_supportedTransferEncodings;
}

- (void)setSupportedTransferEncodings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransferEncodings, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routing, 0);
}

@end