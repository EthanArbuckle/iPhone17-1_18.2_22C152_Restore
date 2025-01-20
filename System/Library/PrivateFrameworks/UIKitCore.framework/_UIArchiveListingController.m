@interface _UIArchiveListingController
- (BOOL)_shouldVisitItem:(id)a3;
- (BOOL)determineIsReadableArchive;
- (BOOL)enumerateLogicalItemsWithBlock:(id)a3 error:(id *)a4;
- (BOOL)excludeDotFilesFromResults;
- (NSString)archivePath;
- (_UIArchiveListingController)initWithArchivePath:(id)a3;
- (int64_t)appleDoubleIdentificationType;
- (void)dealloc;
- (void)setAppleDoubleIdentificationType:(int64_t)a3;
- (void)setExcludeDotFilesFromResults:(BOOL)a3;
@end

@implementation _UIArchiveListingController

- (_UIArchiveListingController)initWithArchivePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIArchiveListingController;
  v6 = [(_UIArchiveListingController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivePath, a3);
    v7->_appleDoubleIdentificationType = 1;
    v7->_excludeDotFilesFromResults = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(_UILibArchiveStreamingReader *)self->_archiveReader close];
  v3.receiver = self;
  v3.super_class = (Class)_UIArchiveListingController;
  [(_UIArchiveListingController *)&v3 dealloc];
}

- (BOOL)determineIsReadableArchive
{
  if (self->_archiveReader) {
    return self->_isValidArchive;
  }
  v4 = [[_UILibArchiveStreamingReader alloc] initForReadingArchivePath:self->_archivePath];
  archiveReader = self->_archiveReader;
  self->_archiveReader = v4;

  BOOL result = [(_UILibArchiveStreamingReader *)self->_archiveReader open];
  self->_isValidArchive = result;
  return result;
}

- (BOOL)enumerateLogicalItemsWithBlock:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(_UIArchiveListingController *)self determineIsReadableArchive])
  {
    [(_UILibArchiveStreamingReader *)self->_archiveReader setAppleDoubleIdentificationType:[(_UIArchiveListingController *)self appleDoubleIdentificationType]];
    archiveReader = self->_archiveReader;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68___UIArchiveListingController_enumerateLogicalItemsWithBlock_error___block_invoke;
    v15[3] = &unk_1E52EB758;
    v15[4] = self;
    id v16 = v6;
    id v14 = 0;
    [(_UILibArchiveStreamingReader *)archiveReader readLogicalItemsWithBlock:v15 error:&v14];
    id v8 = v14;
    [(_UILibArchiveStreamingReader *)self->_archiveReader close];

    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_super v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v10 = [NSString stringWithFormat:@"Unable to open %@ for reading", self->_archivePath];
  v18[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v8 = [v9 errorWithDomain:@"_UIArchiveReaderErrorDomain" code:-1 userInfo:v11];

  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:
  v12 = self->_archiveReader;
  self->_archiveReader = 0;

  return v8 == 0;
}

- (BOOL)_shouldVisitItem:(id)a3
{
  id v4 = a3;
  if ([(_UIArchiveListingController *)self excludeDotFilesFromResults])
  {
    id v5 = [v4 pathInArchive];
    id v6 = [v5 lastPathComponent];
    char v7 = [v6 hasPrefix:@"."];

    if (v7 & 1) != 0 || ([v5 hasPrefix:@"."]) {
      LOBYTE(v8) = 0;
    }
    else {
      int v8 = [v5 containsString:@"/."] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (int64_t)appleDoubleIdentificationType
{
  return self->_appleDoubleIdentificationType;
}

- (void)setAppleDoubleIdentificationType:(int64_t)a3
{
  self->_appleDoubleIdentificationType = a3;
}

- (BOOL)excludeDotFilesFromResults
{
  return self->_excludeDotFilesFromResults;
}

- (void)setExcludeDotFilesFromResults:(BOOL)a3
{
  self->_excludeDotFilesFromResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_archiveReader, 0);
}

@end