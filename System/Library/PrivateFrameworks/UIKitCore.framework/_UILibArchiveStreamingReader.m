@interface _UILibArchiveStreamingReader
- (BOOL)_openArchive;
- (BOOL)_readItemsWithShouldVisitBlock:(id)a3 visitorBlock:(id)a4 error:(id *)a5;
- (BOOL)_shouldReportAsAppleDoubleItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4;
- (BOOL)_shouldReportAsLogicalItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4;
- (BOOL)readAllItemsWithBlock:(id)a3 error:(id *)a4;
- (BOOL)readLogicalItemsWithBlock:(id)a3 error:(id *)a4;
- (NSString)archivePath;
- (NSString)openedArchiveUnderlyingFormatName;
- (id)_debugLoadAndPrintAllRemainingItems;
- (id)_loadItemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3;
- (id)_nextSimpleItemFromPendingQueueOrLibArchiveRead;
- (id)initForReadingArchivePath:(id)a3;
- (int64_t)appleDoubleIdentificationType;
- (ui_archive)underlyingArchive;
- (void)_closeArchive;
- (void)setAppleDoubleIdentificationType:(int64_t)a3;
@end

@implementation _UILibArchiveStreamingReader

- (id)initForReadingArchivePath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UILibArchiveStreamingReader;
  v6 = [(_UILibArchiveStreamingReader *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivePath, a3);
    v7->_state = 0;
    v7->_laProcessingState = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    readableLoadedItemEntryQueue = v7->_readableLoadedItemEntryQueue;
    v7->_readableLoadedItemEntryQueue = (NSMutableArray *)v8;

    v7->_appleDoubleIdentificationType = 1;
    v7->_laArchiveType = -1;
    laArchiveTypeName = v7->_laArchiveTypeName;
    v7->_laArchiveTypeName = (NSString *)@"** Unknown **";
  }
  return v7;
}

- (BOOL)readAllItemsWithBlock:(id)a3 error:(id *)a4
{
  return [(_UILibArchiveStreamingReader *)self _readItemsWithShouldVisitBlock:&__block_literal_global_160 visitorBlock:a3 error:a4];
}

- (BOOL)readLogicalItemsWithBlock:(id)a3 error:(id *)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___UILibArchiveStreamingReader_readLogicalItemsWithBlock_error___block_invoke;
  v5[3] = &unk_1E52EB730;
  v5[4] = self;
  return [(_UILibArchiveStreamingReader *)self _readItemsWithShouldVisitBlock:v5 visitorBlock:a3 error:a4];
}

- (BOOL)_readItemsWithShouldVisitBlock:(id)a3 visitorBlock:(id)a4 error:(id *)a5
{
  v9 = (unsigned int (**)(id, void *, void *))a3;
  v10 = (void (**)(id, void *, unsigned char *))a4;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UILibArchiveStreamingReader.m" lineNumber:94 description:@"Invalid parameter"];
  }
  readError = self->_readError;
  self->_readError = 0;

  objc_super v12 = objc_opt_new();
  v13 = v12;
  if (self->_appleDoubleIdentificationType == 1) {
    [v12 confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath:self->_archivePath];
  }
  v14 = self->_readError;
  if (!v14)
  {
    v15 = 0;
    do
    {
      v16 = v15;
      v15 = [(_UILibArchiveStreamingReader *)self _nextSimpleItemFromPendingQueueOrLibArchiveRead];

      if (!v15) {
        break;
      }
      if (self->_appleDoubleIdentificationType == 1) {
        [v13 confirmExactAppleDoubleFilesForItem:v15];
      }
      v17 = [v13 pathToRealFileIfConfirmedAppleDoubleItem:v15];
      [v15 setPathToAppleDoubleRealFileCounterpart:v17];

      v18 = [v15 pathToAppleDoubleRealFileCounterpart];
      objc_msgSend(v15, "setIsAppleDoubleFile:", objc_msgSend(v18, "length") != 0);

      if (v9[2](v9, v15, v13))
      {
        char v21 = 0;
        v10[2](v10, v15, &v21);
        if (v21) {
          break;
        }
      }
    }
    while (!self->_readError);
    v14 = self->_readError;
  }
  if (a5)
  {
    *a5 = v14;
    v14 = self->_readError;
  }

  return v14 == 0;
}

- (NSString)openedArchiveUnderlyingFormatName
{
  return self->_laArchiveTypeName;
}

- (BOOL)_shouldReportAsLogicalItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4
{
  id v6 = a3;
  if ([(_UILibArchiveStreamingReader *)self _shouldReportAsAppleDoubleItem:v6 withConfirmedAppleDoubleFiles:a4])
  {
    char v7 = 0;
  }
  else
  {
    if (qword_1EB2602C8 != -1) {
      dispatch_once(&qword_1EB2602C8, &__block_literal_global_26_0);
    }
    uint64_t v8 = _MergedGlobals_1019;
    v9 = [v6 pathInArchive];
    LOBYTE(v8) = [(id)v8 containsObject:v9];

    char v7 = v8 ^ 1;
  }

  return v7;
}

- (BOOL)_shouldReportAsAppleDoubleItem:(id)a3 withConfirmedAppleDoubleFiles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  int64_t appleDoubleIdentificationType = self->_appleDoubleIdentificationType;
  if (appleDoubleIdentificationType == 2)
  {
    char v10 = +[_UILibArchiveAppleDoublePathSet isPossibleAppleDoubleByApplyingMatchingHeuristicToItem:v6];
  }
  else
  {
    if (appleDoubleIdentificationType != 1)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    char v10 = [v7 isConfirmedExactAppleDoubleItem:v6];
  }
  BOOL v11 = v10;
LABEL_7:

  return v11;
}

- (BOOL)_openArchive
{
  if (self->_state < 1)
  {
    ui_archive_read_new();
    self->_laArchive = v5;
    p_laArchive = (uint64_t *)&self->_laArchive;
    self->_laProcessingState = 0;
    self->_state = 1;
    if (v5)
    {
      ui_archive_read_support_compression_all((uint64_t)v5);
      if (v6 || (ui_archive_read_support_format_all(*p_laArchive), v7)) {
        [(_UILibArchiveStreamingReader *)self _closeArchive];
      }
      if (*p_laArchive)
      {
        ui_archive_read_open_filename(*p_laArchive, self->_archivePath, 0x2000);
        if (v8) {
          [(_UILibArchiveStreamingReader *)self _closeArchive];
        }
        if (*p_laArchive)
        {
          v9 = [(_UILibArchiveStreamingReader *)self _nextSimpleItemFromPendingQueueOrLibArchiveRead];
          if (v9)
          {
            char v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
            readableLoadedItemEntryQueue = self->_readableLoadedItemEntryQueue;
            self->_readableLoadedItemEntryQueue = v10;
          }
          if (self->_readError)
          {
            self->_laArchiveType = -1;
            laArchiveTypeName = self->_laArchiveTypeName;
            self->_laArchiveTypeName = (NSString *)@"** Invalid **";

            [(_UILibArchiveStreamingReader *)self _closeArchive];
          }
          else
          {
            ui_archive_format((uint64_t)self->_laArchive);
            self->_laArchiveType = v13;
            ui_archive_format_name((uint64_t)self->_laArchive);
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            v15 = self->_laArchiveTypeName;
            self->_laArchiveTypeName = v14;
          }
        }
      }
    }
  }
  else
  {
    p_laArchive = (uint64_t *)&self->_laArchive;
  }
  return *p_laArchive != 0;
}

- (void)_closeArchive
{
  laArchive = self->_laArchive;
  if (laArchive)
  {
    ui_archive_read_close((uint64_t)laArchive);
    ui_archive_read_finish((uint64_t)self->_laArchive);
    self->_laProcessingState = 1;
    self->_state = 2;
    self->_laArchive = 0;
  }
}

- (id)_nextSimpleItemFromPendingQueueOrLibArchiveRead
{
  v3 = [(NSMutableArray *)self->_readableLoadedItemEntryQueue firstObject];
  if (v3)
  {
    [(NSMutableArray *)self->_readableLoadedItemEntryQueue removeObjectAtIndex:0];
    id v4 = v3;
LABEL_3:
    id v5 = v4;
    goto LABEL_6;
  }
  if (!self->_laProcessingState)
  {
    uint64_t v10 = 0;
    ui_archive_read_next_header((uint64_t)self->_laArchive, (uint64_t)&v10);
    self->_laProcessingState = v7;
    if (!v7)
    {
      id v4 = [(_UILibArchiveStreamingReader *)self _loadItemByReadingAttributesFromUnderlyingArchiveEntry:v10];
      goto LABEL_3;
    }
    if (v7 != 1)
    {
      ui_archive_error((uint64_t)self->_laArchive, @"_UIArchiveExtractorErrorDomain", v7, @"Unable to read archive header");
      int v8 = (NSError *)objc_claimAutoreleasedReturnValue();
      readError = self->_readError;
      self->_readError = v8;
    }
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

- (id)_loadItemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3
{
  id v4 = +[_UILibArchiveItem itemByReadingAttributesFromUnderlyingArchiveEntry:a3 archive:self->_laArchive];
  [v4 setSequenceIndex:self->_nextLoadedItemEntrySequenceIndex++];
  return v4;
}

- (id)_debugLoadAndPrintAllRemainingItems
{
  id v3 = [[_UILibArchiveStreamingReader alloc] initForReadingArchivePath:self->_archivePath];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v3 open];
  uint64_t v5 = [v3 _nextSimpleItemFromPendingQueueOrLibArchiveRead];
  if (v5)
  {
    int v6 = (void *)v5;
    do
    {
      if ([v6 sequenceIndex] >= self->_nextLoadedItemEntrySequenceIndex) {
        [v4 addObject:v6];
      }
      uint64_t v7 = [v3 _nextSimpleItemFromPendingQueueOrLibArchiveRead];

      int v6 = (void *)v7;
    }
    while (v7);
  }
  [v3 close];
  NSLog(&cfstr_Remainingitems.isa, 0);

  return v4;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (ui_archive)underlyingArchive
{
  return self->_underlyingArchive;
}

- (int64_t)appleDoubleIdentificationType
{
  return self->_appleDoubleIdentificationType;
}

- (void)setAppleDoubleIdentificationType:(int64_t)a3
{
  self->_int64_t appleDoubleIdentificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_readError, 0);
  objc_storeStrong((id *)&self->_readableLoadedItemEntryQueue, 0);
  objc_storeStrong((id *)&self->_laArchiveTypeName, 0);
}

@end