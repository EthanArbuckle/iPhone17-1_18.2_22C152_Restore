@interface NSURLResponse(MobileSafariFrameworkExtras)
- (BOOL)_sf_hasAttachmentWithFilename;
- (uint64_t)_sf_allowedToOverrideContentDispositionAttachment;
- (uint64_t)sf_hasXMLAttachment;
- (uint64_t)sf_shouldDownloadDueToContentDisposition:()MobileSafariFrameworkExtras;
@end

@implementation NSURLResponse(MobileSafariFrameworkExtras)

- (uint64_t)sf_hasXMLAttachment
{
  if (!objc_msgSend(a1, "safari_hasAttachment")) {
    return 0;
  }
  v2 = [a1 MIMEType];
  if ((objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", @"application/xml") & 1) != 0
    || (objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", @"text/xml") & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 suggestedFilename];
    v5 = objc_msgSend(v4, "safari_lastPathComponentWithoutZipExtension");

    v6 = [v5 pathExtension];
    uint64_t v3 = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", @"xml");
  }
  return v3;
}

- (uint64_t)sf_shouldDownloadDueToContentDisposition:()MobileSafariFrameworkExtras
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(a1, "sf_hasXMLAttachment") & 1) == 0)
  {
    if (!objc_msgSend(a1, "safari_hasAttachment")) {
      return 0;
    }
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v7 = v6;
    if ((a3 & 1) != 0 || ![v6 BOOLForKey:@"DebugEnableDownloadsInSubframes"])
    {
      int v13 = [v7 BOOLForKey:@"DebugContentDispositionHeaderStartsDownloads"];
      v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (!v13)
      {
        if (v15)
        {
          v16 = v14;
          v17 = [a1 URL];
          v18 = [a1 MIMEType];
          int v20 = 138740227;
          v21 = v17;
          __int16 v22 = 2117;
          v23 = v18;
          _os_log_impl(&dword_18C354000, v16, OS_LOG_TYPE_INFO, "Ignoring Content-Disposition header for %{sensitive}@, MIME Type: %{sensitive}@", (uint8_t *)&v20, 0x16u);
        }
        uint64_t v5 = 0;
        goto LABEL_17;
      }
      if (!v15)
      {
        uint64_t v5 = 1;
        goto LABEL_17;
      }
      v9 = v14;
      v10 = [a1 URL];
      v11 = [a1 MIMEType];
      int v20 = 138740227;
      v21 = v10;
      __int16 v22 = 2117;
      v23 = v11;
      v12 = "Starting download due to Content-Disposition header for %{sensitive}@, MIME Type: %{sensitive}@";
      uint64_t v5 = 1;
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      uint64_t v5 = 1;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        return v5;
      }
      v9 = v8;
      v10 = [a1 URL];
      v11 = [a1 MIMEType];
      int v20 = 138740227;
      v21 = v10;
      __int16 v22 = 2117;
      v23 = v11;
      v12 = "Starting download due to Content-Disposition header in subframe for %{sensitive}@, MIME Type: %{sensitive}@";
    }
    _os_log_impl(&dword_18C354000, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, 0x16u);

    goto LABEL_17;
  }
  return 1;
}

- (uint64_t)_sf_allowedToOverrideContentDispositionAttachment
{
  v2 = [a1 MIMEType];
  if ([v2 isEqualToString:@"application/x-webarchive"]) {
    goto LABEL_2;
  }
  objc_msgSend(v2, "safari_stringByTrimmingWhitespace");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 rangeOfString:@"/"];
  if (!v5 || (uint64_t v6 = v5, v5 == 0x7FFFFFFFFFFFFFFFLL) || v5 == [v4 length] - 1)
  {
LABEL_6:

    uint64_t v3 = objc_msgSend(a1, "sf_hasXMLAttachment") ^ 1;
    goto LABEL_7;
  }
  v8 = [v4 substringToIndex:v6];
  v9 = [v4 substringFromIndex:v6 + 1];

  uint64_t v10 = [v9 rangeOfString:@";"];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 substringToIndex:v10];

    v9 = (void *)v11;
  }
  id v4 = v9;
  if ((!objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", @"text")
     || (objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", @"html") & 1) == 0)
    && (objc_msgSend(v4, "safari_hasCaseInsensitiveSuffix:", @"+xml") & 1) == 0
    && (!objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", @"xml")
     || (objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", @"application") & 1) == 0
     && !objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", @"text")))
  {

    goto LABEL_6;
  }

LABEL_2:
  uint64_t v3 = 0;
LABEL_7:

  return v3;
}

- (BOOL)_sf_hasAttachmentWithFilename
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "safari_hasAttachment")) {
    return 0;
  }
  v2 = [a1 allHeaderFields];
  uint64_t v3 = objc_msgSend(v2, "safari_stringForKey:", @"Content-Disposition");

  if (v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [v3 componentsSeparatedByString:@";"];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v10 = [v9 rangeOfString:@"="];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v11 = v10;
            v12 = [v9 substringToIndex:v10];
            int v13 = objc_msgSend(v12, "safari_stringByTrimmingWhitespace");

            if (objc_msgSend(v13, "safari_isCaseInsensitiveEqualToString:", @"filename"))
            {
              BOOL v15 = [v9 substringFromIndex:v11 + 1];
              v16 = objc_msgSend(v15, "safari_stringByTrimmingWhitespace");

              LODWORD(v15) = [v16 hasPrefix:@"\""];
              unint64_t v17 = [v16 length];
              if (v15) {
                BOOL v14 = v17 > 2;
              }
              else {
                BOOL v14 = v17 != 0;
              }

              goto LABEL_21;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end