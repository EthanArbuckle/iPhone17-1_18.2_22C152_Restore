@interface job_spool_client_t
- (BOOL)AppleImagePDFAnnotations;
- (BOOL)AttributeFidelity;
- (BOOL)FitToPage;
- (BOOL)hasAppleImagePDFAnnotations;
- (BOOL)hasAppleThumbnailPosition;
- (BOOL)hasAttributeFidelity;
- (BOOL)hasCopies;
- (BOOL)hasDocumentFormat;
- (BOOL)hasDocumentPassword;
- (BOOL)hasFinishings;
- (BOOL)hasFinishingsCol;
- (BOOL)hasFitToPage;
- (BOOL)hasJobAccountID;
- (BOOL)hasJobName;
- (BOOL)hasMedia;
- (BOOL)hasMediaCol;
- (BOOL)hasOrientationRequested;
- (BOOL)hasOutputBin;
- (BOOL)hasOutputMode;
- (BOOL)hasPageRanges;
- (BOOL)hasPresetName;
- (BOOL)hasPrintColorMode;
- (BOOL)hasPrintQuality;
- (BOOL)hasPrintScaling;
- (BOOL)hasRasterFeedOrientation;
- (BOOL)hasSides;
- (BOOL)peekFirstEightBytes:(char *)a3;
- (BOOL)validateJobRequestAgainstPrinter:(id)a3;
- (NSArray)Finishings;
- (NSArray)PageRanges;
- (NSData)DocumentPassword;
- (NSString)AppleThumbnailPosition;
- (NSString)DocumentFormat;
- (NSString)JobAccountID;
- (NSString)JobName;
- (NSString)Media;
- (NSString)OutputBin;
- (NSString)OutputMode;
- (NSString)PresetName;
- (NSString)PrintColorMode;
- (NSString)PrintScaling;
- (NSString)Sides;
- (PKMediaCol)MediaCol;
- (id)fileHandleForStreaming;
- (id)finalizeFilePosition:(int64_t *)a3 forJobID:(int)a4 session:(id)a5;
- (id)getLogCategory;
- (id)getLogLeader;
- (int)Copies;
- (int)OrientationRequested;
- (int)PrintQuality;
- (int)RasterFeedOrientation;
- (int)clientID;
- (int64_t)moveStreamingFileTo:(id)a3;
- (ipp_collection_t)FinishingsCol;
- (job_spool_client_t)initWithClientID:(int)a3 printer:(id)a4 printSettings:(id)a5;
- (void)figureOutputOrPrintColorMode:(OutputOrPrintColorMode *)a3;
- (void)invalidate;
- (void)startStreamingCompletionHandler:(id)a3;
- (void)submitRequestWithSession:(id)a3 completionHandler:(id)a4;
@end

@implementation job_spool_client_t

- (job_spool_client_t)initWithClientID:(int)a3 printer:(id)a4 printSettings:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)job_spool_client_t;
  v11 = [(job_spool_client_t *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_clientID = a3;
    objc_storeStrong((id *)&v11->_printer, a4);
    objc_storeStrong((id *)&v12->_printSettings, a5);
    v13 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Job Init: Client ID %d", buf, 8u);
    }

    v14 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v9 debugDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Job Init: Printer %@", buf, 0xCu);
    }
    v16 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 userCodableDictionary];
      v18 = [v17 debugDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Job Init: Settings: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (id)getLogLeader
{
  return +[NSString stringWithFormat:@"%@<%p - client id %d>", objc_opt_class(), self, self->_clientID];
}

- (id)getLogCategory
{
  return PKLogCategoryProgress[0];
}

- (void)invalidate
{
  v3 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    filePathForStreaming = self->_filePathForStreaming;
    fileHandleForStreaming = self->_fileHandleForStreaming;
    *(_DWORD *)buf = 134218242;
    v16 = fileHandleForStreaming;
    __int16 v17 = 2114;
    v18 = filePathForStreaming;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidate file handle %p path %{public}@", buf, 0x16u);
  }

  v6 = self->_fileHandleForStreaming;
  if (v6)
  {
    id v14 = 0;
    [(NSFileHandle *)v6 closeAndReturnError:&v14];
    id v7 = v14;
    v8 = self->_fileHandleForStreaming;
    self->_fileHandleForStreaming = 0;
  }
  else
  {
    id v7 = 0;
  }
  if (self->_filePathForStreaming)
  {
    id v9 = +[NSFileManager defaultManager];
    id v10 = self->_filePathForStreaming;
    id v13 = v7;
    [v9 removeItemAtURL:v10 error:&v13];
    id v11 = v13;

    v12 = self->_filePathForStreaming;
    self->_filePathForStreaming = 0;

    id v7 = v11;
  }
}

- (void)startStreamingCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startStreamingCompletionHandler", v7, 2u);
  }

  v6 = [(job_spool_client_t *)self fileHandleForStreaming];
  v4[2](v4, v6);
}

- (BOOL)peekFirstEightBytes:(char *)a3
{
  filePathForStreaming = self->_filePathForStreaming;
  if (!filePathForStreaming) {
    return 0;
  }
  int v6 = open([(NSURL *)filePathForStreaming fileSystemRepresentation], 256);
  if (v6 == -1)
  {
    id v9 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = self->_filePathForStreaming;
      int v11 = *__error();
      int v13 = 138543618;
      id v14 = v10;
      __int16 v15 = 1024;
      int v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't open temp file %{public}@ for reading: %d", (uint8_t *)&v13, 0x12u);
    }

    return 0;
  }
  int v7 = v6;
  BOOL v8 = read(v6, a3, 8uLL) == 8;
  close(v7);
  return v8;
}

- (id)fileHandleForStreaming
{
  if (!self->_fileHandleForStreaming)
  {
    v3 = +[NSFileManager defaultManager];
    v4 = [v3 temporaryDirectory];

    uint64_t v5 = getpid();
    int v6 = +[NSProcessInfo processInfo];
    int v7 = [v6 globallyUniqueString];
    BOOL v8 = +[NSString stringWithFormat:@"%d-%@.tmp", v5, v7];

    id v9 = [v4 URLByAppendingPathComponent:v8];
    filePathForStreaming = self->_filePathForStreaming;
    self->_filePathForStreaming = v9;

    int v11 = +[NSFileManager defaultManager];
    v12 = [(NSURL *)self->_filePathForStreaming path];
    int v13 = +[NSData data];
    [v11 createFileAtPath:v12 contents:v13 attributes:0];

    id v14 = self->_filePathForStreaming;
    id v23 = 0;
    __int16 v15 = +[NSFileHandle fileHandleForWritingToURL:v14 error:&v23];
    int v16 = (NSFileHandle *)v23;
    fileHandleForStreaming = self->_fileHandleForStreaming;
    self->_fileHandleForStreaming = v15;

    if (v16)
    {
      v18 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Couldn't create temp file for streaming: %{public}@", buf, 0xCu);
      }
    }
  }
  v19 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v20 = self->_fileHandleForStreaming;
    *(_DWORD *)buf = 138543362;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "fileHandleForStreaming %{public}@", buf, 0xCu);
  }

  v21 = self->_fileHandleForStreaming;

  return v21;
}

- (int64_t)moveStreamingFileTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    fileHandleForStreaming = self->_fileHandleForStreaming;
    *(_DWORD *)buf = 138543618;
    id v25 = fileHandleForStreaming;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "moveStreamingFileTo %{public}@ to %{public}@", buf, 0x16u);
  }

  int v7 = self->_fileHandleForStreaming;
  if (v7)
  {
    id v23 = 0;
    [(NSFileHandle *)v7 closeAndReturnError:&v23];
    id v8 = v23;
    id v9 = self->_fileHandleForStreaming;
    self->_fileHandleForStreaming = 0;

    if (v8)
    {
      id v10 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        filePathForStreaming = self->_filePathForStreaming;
        *(_DWORD *)buf = 138543618;
        id v25 = filePathForStreaming;
        __int16 v26 = 2114;
        id v27 = v8;
        v12 = "Couldn't close file handle for path %{public}@: %{public}@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else
    {
      id v14 = +[NSFileManager defaultManager];
      __int16 v15 = self->_filePathForStreaming;
      id v22 = 0;
      [v14 moveItemAtURL:v15 toURL:v4 error:&v22];
      id v8 = v22;

      int v16 = self->_filePathForStreaming;
      self->_filePathForStreaming = 0;

      if (v8)
      {
        id v10 = _PKLogCategory(PKLogCategoryDefault[0]);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v4;
          __int16 v26 = 2114;
          id v27 = v8;
          v12 = "Couldn't move temp file to new location %{public}@: %{public}@";
          goto LABEL_11;
        }
      }
      else
      {
        id v21 = 0;
        id v20 = 0;
        unsigned __int8 v18 = [v4 getResourceValue:&v21 forKey:NSURLFileSizeKey error:&v20];
        id v10 = v21;
        id v8 = v20;
        if (v18)
        {
          int64_t v13 = (int64_t)[v10 integerValue];
          goto LABEL_13;
        }
        v19 = _PKLogCategory(PKLogCategoryDefault[0]);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v4;
          __int16 v26 = 2114;
          id v27 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't get file length for new locaton %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
    int64_t v13 = -1;
LABEL_13:

    goto LABEL_14;
  }
  int64_t v13 = -1;
LABEL_14:

  return v13;
}

- (id)finalizeFilePosition:(int64_t *)a3 forJobID:(int)a4 session:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = [v8 clientBundleIdentifier];
  id v10 = (void *)v9;
  int v11 = @"unknown_bundle";
  if (v9) {
    int v11 = (__CFString *)v9;
  }
  v12 = v11;

  int64_t v13 = [(job_spool_client_t *)self DocumentFormat];
  if ([v13 caseInsensitiveCompare:@"image/jpeg"])
  {
    if ([v13 caseInsensitiveCompare:@"image/png"])
    {
      if ([v13 caseInsensitiveCompare:@"application/pdf"])
      {
        if ([v13 caseInsensitiveCompare:@"application/urf"]) {
          CFStringRef v14 = @"prn";
        }
        else {
          CFStringRef v14 = @"urf";
        }
      }
      else
      {
        CFStringRef v14 = @"pdf";
      }
    }
    else
    {
      CFStringRef v14 = @"png";
    }
  }
  else
  {
    CFStringRef v14 = @"jpg";
  }
  __int16 v15 = +[NSString stringWithFormat:@"%@_%d_%d.%@", v12, getpid(), v5, v14];
  int v16 = +[NSFileManager defaultManager];
  __int16 v17 = [v16 temporaryDirectory];
  unsigned __int8 v18 = [v17 URLByAppendingPathComponent:v15];

  v19 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v38 = [(job_spool_client_t *)self clientID];
    __int16 v39 = 2114;
    v40 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Client %d] Saving print job to \"%{public}@\".", buf, 0x12u);
  }

  int64_t v20 = [(job_spool_client_t *)self moveStreamingFileTo:v18];
  *a3 = v20;
  if (v20 < 0)
  {
    id v21 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = [(job_spool_client_t *)self clientID];
      *(_DWORD *)buf = 67109378;
      unsigned int v38 = v22;
      __int16 v39 = 2114;
      v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Client %d] Unable to move print file to %{public}@", buf, 0x12u);
    }
  }
  if (PreserveControlFiles)
  {
    id v23 = [(PKPrintSettings *)self->_printSettings copyWithZone:0];
    v24 = self->_printer;
    id v25 = dispatch_get_global_queue(-2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016D14;
    block[3] = &unk_1000A0430;
    id v30 = v18;
    int v36 = v5;
    v31 = v12;
    id v32 = v23;
    id v33 = v13;
    id v34 = v8;
    v35 = v24;
    __int16 v26 = v24;
    id v27 = v23;
    dispatch_async(v25, block);
  }

  return v18;
}

- (void)submitRequestWithSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "submitRequestWithSession %p", buf, 0xCu);
  }

  if (self->_printer)
  {
    if (-[job_spool_client_t validateJobRequestAgainstPrinter:](self, "validateJobRequestAgainstPrinter:"))
    {
      uint64_t v9 = [[lite_job_t alloc] initWithRequestParams:self session:v6 printer:self->_printer printSettings:self->_printSettings];
      uint64_t v30 = 0;
      id v10 = [(job_spool_client_t *)self finalizeFilePosition:&v30 forJobID:[(lite_job_t *)v9 printd_job_id] session:v6];
      if (v10)
      {
        [(lite_job_t *)v9 setPayloadTotal:v30];
        int v11 = [v10 path];
        [(lite_job_t *)v9 setSpoolDocumentFilename:v11];

        v12 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = [(lite_job_t *)v9 printd_job_id];
          if (v9) {
            unsigned int v14 = [(lite_job_t *)v9 destination_job_id];
          }
          else {
            unsigned int v14 = -1;
          }
          uint64_t v21 = v30;
          unsigned int v22 = [v10 absoluteURL];
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)id v32 = v13;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v14;
          *(_WORD *)id v33 = 2048;
          *(void *)&v33[2] = v21;
          __int16 v34 = 2114;
          v35 = v22;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Copied %lld bytes to \"%{public}@\".", buf, 0x22u);
        }
        if (liteUpdateJobAttrs(v9) <= 1)
        {
          if ([(lite_job_t *)v9 is_canceled])
          {
            int64_t v20 = @"Job was canceled before it began";
          }
          else if ((id)[(lite_job_t *)v9 localJobState] == (id)4)
          {
            int64_t v20 = [(lite_job_t *)v9 addJobAndAllowToProceed];
            if (!v20)
            {
              id v23 = _PKLogCategory(PKLogCategoryProgress[0]);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v24 = [(job_spool_client_t *)self clientID];
                unsigned int v25 = [(lite_job_t *)v9 printd_job_id];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)id v32 = v24;
                *(_WORD *)&v32[4] = 1024;
                *(_DWORD *)&v32[6] = v25;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Client %d] Job id %d ready and sent for processing", buf, 0xEu);
              }

              __int16 v26 = +[NSNumber numberWithInt:[(lite_job_t *)v9 printd_job_id]];
              v7[2](v7, v26);

              int64_t v20 = 0;
              goto LABEL_29;
            }
          }
          else
          {
            int64_t v20 = @"Job is not in the held state";
          }
        }
        else
        {
          int64_t v20 = @"Job attributes did not match print document.";
        }
      }
      else
      {
        printer = self->_printer;
        unsigned int v18 = [(lite_printer_t *)printer reasons];
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[job_spool_client_t submitRequestWithSession:completionHandler:]");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        liteNotifyPrinter(printer, v18 | 0x40000, v19);

        int64_t v20 = @"No space for spool file";
      }
      id v27 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v28 = [(job_spool_client_t *)self clientID];
        unsigned int v29 = [(lite_job_t *)v9 printd_job_id];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v32 = v28;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v29;
        *(_WORD *)id v33 = 2112;
        *(void *)&v33[2] = v20;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Client %d] Job id %d failed to prepare and will be aborted: %@", buf, 0x18u);
      }

      [(lite_job_t *)v9 finishJob:8];
      v7[2](v7, 0);
LABEL_29:

      goto LABEL_30;
    }
    __int16 v15 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = self->_printer;
      *(_DWORD *)buf = 134218242;
      *(void *)id v32 = self;
      *(_WORD *)&v32[8] = 2114;
      *(void *)id v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't validate job request %p against printer %{public}@", buf, 0x16u);
    }
  }
  v7[2](v7, 0);
LABEL_30:
}

- (BOOL)validateJobRequestAgainstPrinter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(job_spool_client_t *)self DocumentFormat];
  if (!v5)
  {
    id v10 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v11 = "Unsupported (nil) document-format";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v6 = objc_msgSend(v4, "attrs_document_format_supported");
  unsigned __int8 v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    id v10 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v11 = "Unsupported document-format";
      goto LABEL_12;
    }
    goto LABEL_13;
  }

  if (![(job_spool_client_t *)self hasCopies]) {
    goto LABEL_18;
  }
  unsigned int v8 = [(job_spool_client_t *)self Copies];
  if (v8 >> 4 < 0x271)
  {
    if (v8 != 1)
    {
      unsigned int v14 = [(job_spool_client_t *)self DocumentFormat];
      unsigned int v15 = [v14 caseInsensitiveCompare:@"image/urf"];

      if (!v15)
      {
        uint64_t v9 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unsupported copies", buf, 2u);
        }
        goto LABEL_7;
      }
    }
LABEL_18:
    [(job_spool_client_t *)self hasFinishings];
    if (![(job_spool_client_t *)self hasMediaCol])
    {
LABEL_24:
      [(job_spool_client_t *)self hasOutputBin];
      if ([(job_spool_client_t *)self hasOrientationRequested]
        && (unsigned int v17 = [(job_spool_client_t *)self OrientationRequested], v17 - 3 >= 5))
      {
        uint64_t v21 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unsupported orientation-requested %d.", buf, 8u);
        }
      }
      else
      {
        [(job_spool_client_t *)self hasPageRanges];
        if (![(job_spool_client_t *)self hasPrintQuality]
          || (unsigned int v18 = [(job_spool_client_t *)self PrintQuality], v18 - 3 < 3))
        {
          if (![(job_spool_client_t *)self hasSides])
          {
LABEL_31:
            BOOL v12 = 1;
            goto LABEL_15;
          }
          v19 = [(job_spool_client_t *)self Sides];
          if ([v19 isEqualToString:@"one-sided"])
          {
LABEL_30:

            goto LABEL_31;
          }
          if (objc_msgSend(v4, "printer_type_from_cups"))
          {
            if ([v19 isEqualToString:@"two-sided-long-edge"]) {
              goto LABEL_30;
            }
            if ([v19 isEqualToString:@"two-sided-short-edge"]) {
              goto LABEL_30;
            }
            id v23 = +[NSString stringWithFormat:@"Unknown Sides attribute '%@'", v19];
            if (!v23) {
              goto LABEL_30;
            }
          }
          else
          {
            id v23 = @"Printer doesn't support specifying sides";
          }
          unsigned int v24 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unsupported sides \"%@\".", buf, 0xCu);
          }

          goto LABEL_14;
        }
        uint64_t v21 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unsupported print-quality %d.", buf, 8u);
        }
      }

      goto LABEL_14;
    }
    id v27 = off_1000A0480;
    unsigned int v28 = self;
    unsigned int v26 = 0;
    if (pwgInitSize((uint64_t)buf, (uint64_t)&v27, &v26))
    {
      if (!v26 || v32 + HIDWORD(v30) < *(int *)buf && v33 + v31 < (int)v30)
      {
        int v16 = v28;
        id v27 = off_1000A0480;
        unsigned int v28 = 0;

        goto LABEL_24;
      }
      int64_t v20 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v25 = 0;
        goto LABEL_39;
      }
    }
    else
    {
      int64_t v20 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v25 = 0;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unsupported MediaCol value.", v25, 2u);
      }
    }

    unsigned int v22 = v28;
    id v27 = off_1000A0480;
    unsigned int v28 = 0;

    goto LABEL_14;
  }
  uint64_t v9 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unsupported copies", buf, 2u);
  }
LABEL_7:

LABEL_14:
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (BOOL)hasAppleImagePDFAnnotations
{
  return 1;
}

- (BOOL)AppleImagePDFAnnotations
{
  return [(PKPrintSettings *)self->_printSettings annotationsImaged];
}

- (BOOL)hasAppleThumbnailPosition
{
  return 1;
}

- (NSString)AppleThumbnailPosition
{
  return (NSString *)[(PKPrintSettings *)self->_printSettings thumbnailPosition];
}

- (BOOL)hasAttributeFidelity
{
  return 1;
}

- (BOOL)AttributeFidelity
{
  v2 = [(PKPrintSettings *)self->_printSettings pageScale];
  v3 = v2;
  BOOL v4 = v2
    && (([v2 isEqualToString:PKPageScaleUpAndDown] & 1) != 0
     || [v3 isEqualToString:PKPageScaleOff]);

  return v4;
}

- (BOOL)hasCopies
{
  return 1;
}

- (int)Copies
{
  return [(PKPrintSettings *)self->_printSettings copies];
}

- (BOOL)hasDocumentFormat
{
  return 1;
}

- (NSString)DocumentFormat
{
  v3 = [(PKPrintSettings *)self->_printSettings fileType];
  BOOL v4 = v3;
  if (!v3
    || ![(__CFString *)v3 caseInsensitiveCompare:@"application/octet-stream"])
  {
    uint64_t v27 = 0;
    if (![(job_spool_client_t *)self peekFirstEightBytes:&v27]) {
      uint64_t v27 = 0;
    }
    uint64_t v5 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67111168;
      unsigned int v12 = [(job_spool_client_t *)self clientID];
      __int16 v13 = 1024;
      *(_DWORD *)unsigned int v14 = v27;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = BYTE1(v27);
      __int16 v15 = 1024;
      int v16 = BYTE2(v27);
      __int16 v17 = 1024;
      int v18 = BYTE3(v27);
      __int16 v19 = 1024;
      int v20 = BYTE4(v27);
      __int16 v21 = 1024;
      int v22 = BYTE5(v27);
      __int16 v23 = 1024;
      int v24 = BYTE6(v27);
      __int16 v25 = 1024;
      int v26 = HIBYTE(v27);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Client %d] Auto-typing with header: %02X %02X %02X %02X %02X %02X %02X %02X", (uint8_t *)&v11, 0x38u);
    }

    if (v27 == 1178882085)
    {

      BOOL v4 = @"application/pdf";
    }
    else
    {
      BOOL v6 = (unsigned __int16)v27 == 55551 && BYTE2(v27) == 255;
      if (v6 && (v27 & 0xF0000000) == 0xE0000000)
      {

        BOOL v4 = @"image/jpeg";
      }
      else if (v27 == 1196314761)
      {

        BOOL v4 = @"image/png";
      }
      else
      {
        BOOL v7 = v27 == 0x54534152494E55;

        if (v7) {
          BOOL v4 = @"image/urf";
        }
        else {
          BOOL v4 = @"application/octet-stream";
        }
      }
    }
    unsigned int v8 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(job_spool_client_t *)self clientID];
      int v11 = 67109378;
      unsigned int v12 = v9;
      __int16 v13 = 2112;
      *(void *)unsigned int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Client %d] Auto-typed format is \"%@\".", (uint8_t *)&v11, 0x12u);
    }

    [(PKPrintSettings *)self->_printSettings setFileType:v4];
  }

  return (NSString *)v4;
}

- (BOOL)hasDocumentPassword
{
  v2 = [(PKPrintSettings *)self->_printSettings documentPassword];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSData)DocumentPassword
{
  v2 = [(PKPrintSettings *)self->_printSettings documentPassword];
  BOOL v3 = [v2 precomposedStringWithCanonicalMapping];

  if (v3)
  {
    BOOL v4 = (const char *)[v3 UTF8String];
    uint64_t v5 = +[NSData dataWithBytes:v4 length:strlen(v4)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSData *)v5;
}

- (BOOL)hasFinishings
{
  BOOL v3 = [(PKPrintSettings *)self->_printSettings finishingTemplate];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(PKPrintSettings *)self->_printSettings finishings];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (NSArray)Finishings
{
  BOOL v3 = [(PKPrintSettings *)self->_printSettings finishingTemplate];
  if (v3)
  {
    BOOL v4 = 0;
    goto LABEL_29;
  }
  uint64_t v5 = [(PKPrintSettings *)self->_printSettings finishings];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSArray array];
  }
  unsigned int v8 = v7;

  unsigned int v9 = [(lite_printer_t *)self->_printer printerDescription];
  id v10 = [v9 finishings];

  if ((int)[(PKPrintSettings *)self->_printSettings copies] >= 2
    && [v10 containsObject:&off_1000B9108]
    && ([v8 containsObject:&off_1000B9108] & 1) == 0)
  {
    uint64_t v11 = [v8 arrayByAddingObject:&off_1000B9108];

    unsigned int v8 = (void *)v11;
  }
  if ([v8 count])
  {
    unsigned int v12 = (unsigned int *)malloc_type_calloc((size_t)[v8 count], 4uLL, 0x100004052888210uLL);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      LODWORD(v15) = 0;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsObject:", v18, (void)v23))
          {
            v12[(int)v15] = [v18 intValue];
            LODWORD(v15) = v15 + 1;
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);

      if ((int)v15 >= 1)
      {
        BOOL v4 = objc_opt_new();
        uint64_t v15 = v15;
        __int16 v19 = v12;
        do
        {
          unsigned int v20 = *v19++;
          __int16 v21 = +[NSNumber numberWithInt:v20];
          [v4 addObject:v21];

          --v15;
        }
        while (v15);
        goto LABEL_27;
      }
    }
    else
    {
    }
    BOOL v4 = 0;
LABEL_27:
    free(v12);
    goto LABEL_28;
  }
  BOOL v4 = 0;
LABEL_28:

LABEL_29:

  return (NSArray *)v4;
}

- (BOOL)hasFinishingsCol
{
  v2 = [(PKPrintSettings *)self->_printSettings finishingTemplate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (ipp_collection_t)FinishingsCol
{
  v2 = [(PKPrintSettings *)self->_printSettings finishingTemplate];
  if (v2)
  {
    BOOL v3 = objc_opt_new();
    [v3 _addString:2 valueTag:68 name:@"finishing-template" lang:0 value:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (ipp_collection_t *)v3;
}

- (BOOL)hasFitToPage
{
  v2 = [(PKPrintSettings *)self->_printSettings pageScale];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)FitToPage
{
  v2 = [(PKPrintSettings *)self->_printSettings pageScale];
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:PKPageScaleDown]) {
      unsigned __int8 v4 = 1;
    }
    else {
      unsigned __int8 v4 = [v3 isEqualToString:PKPageScaleUpAndDown];
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)hasJobAccountID
{
  v2 = [(PKPrintSettings *)self->_printSettings jobAccountID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)JobAccountID
{
  v2 = [(PKPrintSettings *)self->_printSettings jobAccountID];
  BOOL v3 = [v2 precomposedStringWithCanonicalMapping];

  return (NSString *)v3;
}

- (BOOL)hasJobName
{
  return 1;
}

- (NSString)JobName
{
  v2 = [(PKPrintSettings *)self->_printSettings jobName];
  BOOL v3 = [v2 precomposedStringWithCanonicalMapping];

  return (NSString *)v3;
}

- (BOOL)hasMediaCol
{
  v2 = [(PKPrintSettings *)self->_printSettings paper];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PKMediaCol)MediaCol
{
  BOOL v3 = [(PKPrintSettings *)self->_printSettings paper];
  if (v3)
  {
    unsigned __int8 v4 = [(lite_printer_t *)self->_printer printerDescription];
    uint64_t v5 = [v4 mediaColSupportedArray];

    if ([v5 containsObject:@"media-bottom-margin"]
      && [v5 containsObject:@"media-top-margin"]
      && [v5 containsObject:@"media-left-margin"])
    {
      id v6 = [v5 containsObject:@"media-right-margin"];
    }
    else
    {
      id v6 = 0;
    }
    id v7 = [v3 createMediaColAndDoMargins:v6];
    if (v7)
    {
      unsigned int v8 = [(PKPrintSettings *)self->_printSettings inputSlot];
      unsigned int v9 = v8;
      if (v8 && ([v8 isEqualToString:@"auto"] & 1) == 0) {
        [v7 setMediaSource:v9];
      }
      id v10 = [(PKPrintSettings *)self->_printSettings mediaType];
      uint64_t v11 = v10;
      if (v10 && ([v10 isEqualToString:@"auto"] & 1) == 0) {
        [v7 setMediaType:v11];
      }
      unsigned int v12 = [v7 makeMediaCol];
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }

  return (PKMediaCol *)v12;
}

- (BOOL)hasOrientationRequested
{
  v2 = [(PKPrintSettings *)self->_printSettings orientation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)OrientationRequested
{
  v2 = [(PKPrintSettings *)self->_printSettings orientation];
  if (v2)
  {
    v7[0] = PKOrientationPortrait;
    v7[1] = PKOrientationLandscape;
    v8[0] = &off_1000B9120;
    v8[1] = &off_1000B9138;
    v7[2] = PKOrientationReverseLandscape;
    v8[2] = &off_1000B9150;
    BOOL v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    unsigned __int8 v4 = [v3 objectForKeyedSubscript:v2];
    int v5 = validate_enum<ipp_orient_e,unsigned char>((char)[v4 integerValue]);
  }
  else
  {
    int v5 = 3;
  }

  return v5;
}

- (BOOL)hasOutputBin
{
  v2 = [(PKPrintSettings *)self->_printSettings outputBin];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)OutputBin
{
  return (NSString *)[(PKPrintSettings *)self->_printSettings outputBin];
}

- (void)figureOutputOrPrintColorMode:(OutputOrPrintColorMode *)a3
{
  id var0 = a3->var0;
  a3->id var0 = 0;

  id var1 = a3->var1;
  a3->id var1 = 0;

  id v7 = [(lite_printer_t *)self->_printer printerDescription];
  unsigned int v8 = [v7 supportsPrintColorMode];

  if (v8)
  {
    unsigned int v9 = (void ***)v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    id v10 = sub_100019274;
  }
  else
  {
    unsigned int v9 = &v18;
    int v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v10 = sub_100019280;
  }
  v9[2] = (void **)v10;
  v9[3] = (void **)&unk_1000A0450;
  v9[4] = &a3->var0;
  uint64_t v11 = objc_retainBlock(v9);
  unsigned int v12 = [(PKPrintSettings *)self->_printSettings outputMode];
  id v13 = [(lite_printer_t *)self->_printer printerDescription];
  id v14 = [v13 outputModes];

  if (v14 && v12)
  {
    unsigned int v15 = [(job_spool_client_t *)self PrintQuality];
    uint64_t v16 = PKOutputModeGray;
    if (v15 == 5)
    {
      if ([v12 isEqualToString:PKOutputModeGray])
      {
        __int16 v17 = (void *)PKOutputModeProcessGray;
        if ([v14 containsObject:PKOutputModeProcessGray]) {
          goto LABEL_16;
        }
      }
    }
    if (objc_msgSend(v12, "isEqualToString:", v16, v18, v19))
    {
      if (([v14 containsObject:v16] & 1) == 0)
      {
        __int16 v17 = (void *)PKOutputModeAutoGray;
        if ([v14 containsObject:PKOutputModeAutoGray]) {
          goto LABEL_16;
        }
      }
    }
    if (([v12 isEqualToString:PKOutputModeColor] & 1) == 0)
    {
      if ([v14 containsObject:v12]) {
        __int16 v17 = v12;
      }
      else {
        __int16 v17 = (void *)PKOutputModeAutoGray;
      }
LABEL_16:
      ((void (*)(void ***, void *))v11[2])(v11, v17);
    }
  }
}

- (BOOL)hasPrintColorMode
{
  return 1;
}

- (NSString)PrintColorMode
{
  id v4 = 0;
  id v5 = 0;
  [(job_spool_client_t *)self figureOutputOrPrintColorMode:&v4];
  id v2 = v5;

  return (NSString *)v2;
}

- (BOOL)hasOutputMode
{
  return 1;
}

- (NSString)OutputMode
{
  id v4 = 0;
  id v5 = 0;
  [(job_spool_client_t *)self figureOutputOrPrintColorMode:&v4];
  id v2 = v4;

  return (NSString *)v2;
}

- (BOOL)hasPageRanges
{
  id v2 = [(PKPrintSettings *)self->_printSettings pageRanges];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)PageRanges
{
  id v2 = [(PKPrintSettings *)self->_printSettings pageRanges];
  if ([v2 count] == (id)2)
  {
    BOOL v3 = [v2 firstObject];
    id v4 = [v2 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v5 = [v3 intValue];
        signed int v6 = [v4 intValue];
        if (v5 >= 1 && v6 >= v5)
        {
          id v7 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", (v5 - 1), v6 - v5 + 1);
          id v10 = v7;
          uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];

          id v2 = (void *)v8;
        }
      }
    }
  }

  return (NSArray *)v2;
}

- (BOOL)hasPresetName
{
  id v2 = [(PKPrintSettings *)self->_printSettings jobPresetName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)PresetName
{
  return (NSString *)[(PKPrintSettings *)self->_printSettings jobPresetName];
}

- (BOOL)hasPrintQuality
{
  id v2 = [(PKPrintSettings *)self->_printSettings printQuality];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)PrintQuality
{
  id v2 = [(PKPrintSettings *)self->_printSettings printQuality];
  if (v2)
  {
    v7[0] = PKQualityHigh;
    v7[1] = PKQualityDraft;
    v8[0] = &off_1000B9150;
    v8[1] = &off_1000B9120;
    v7[2] = PKQualityNormal;
    v8[2] = &off_1000B9138;
    BOOL v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    id v4 = [v3 objectForKeyedSubscript:v2];
    int v5 = validate_enum<ipp_quality_e,unsigned char>([v4 integerValue]);
  }
  else
  {
    int v5 = 3;
  }

  return v5;
}

- (BOOL)hasPrintScaling
{
  return 1;
}

- (NSString)PrintScaling
{
  if ([(job_spool_client_t *)self PrintQuality] == 5) {
    return 0;
  }
  result = [(PKPrintSettings *)self->_printSettings fileType];
  if (result)
  {
    id v4 = result;
    int v5 = [(PKPrintSettings *)self->_printSettings fileType];
    id v6 = [v5 caseInsensitiveCompare:@"application/pdf"];

    if (v6) {
      return 0;
    }
    else {
      return (NSString *)@"auto-fit";
    }
  }
  return result;
}

- (BOOL)hasRasterFeedOrientation
{
  return 1;
}

- (int)RasterFeedOrientation
{
  BOOL v3 = [(PKPrintSettings *)self->_printSettings paper];
  if (v3)
  {
    id v4 = [(lite_printer_t *)self->_printer printerDescription];
    int v5 = [v4 specialFeedOrientation];

    if (!v5) {
      goto LABEL_6;
    }
    id v6 = [v3 baseName];
    if (!v6) {
      goto LABEL_6;
    }
    id v7 = [v3 baseName];
    uint64_t v8 = [v5 objectForKey:v7];

    if (v8)
    {
      unsigned int v9 = [v3 baseName];
      id v10 = [v5 objectForKey:v9];
      int v11 = [v10 intValue];
    }
    else
    {
LABEL_6:
      int v11 = 3;
    }
  }
  else
  {
    int v11 = 3;
  }

  return v11;
}

- (BOOL)hasSides
{
  id v2 = [(PKPrintSettings *)self->_printSettings duplex];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)Sides
{
  BOOL v3 = [(PKPrintSettings *)self->_printSettings duplex];
  if (v3
    && ([(lite_printer_t *)self->_printer printerDescription],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 sides],
        int v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 containsObject:v3],
        v5,
        v4,
        v6))
  {
    id v7 = v3;
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)hasMedia
{
  return 1;
}

- (NSString)Media
{
  id v2 = [(PKPrintSettings *)self->_printSettings paper];
  BOOL v3 = [v2 baseName];

  return (NSString *)v3;
}

- (int)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_fileHandleForStreaming, 0);

  objc_storeStrong((id *)&self->_filePathForStreaming, 0);
}

@end