@interface QLCacheIndexDatabaseFileInfoEnumerator
- (BOOL)nextFileWithCacheId:(unint64_t *)a3 versionedFileIdentifier:(id *)a4 thumbnailCount:(unsigned int *)a5 minSize:(float *)a6 maxSize:(float *)a7 totalDataLength:(unint64_t *)a8;
- (QLCacheIndexDatabaseFileInfoEnumerator)initWithSqliteDatabase:(id)a3 toEnumerateUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5;
@end

@implementation QLCacheIndexDatabaseFileInfoEnumerator

- (QLCacheIndexDatabaseFileInfoEnumerator)initWithSqliteDatabase:(id)a3 toEnumerateUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)QLCacheIndexDatabaseFileInfoEnumerator;
  result = [(QLCacheIndexDatabaseGenericEnumerator *)&v8 initWithSqliteDatabase:a3];
  if (result)
  {
    result->_extraInfo = a5;
    result->_ubiquitous = a4;
  }
  return result;
}

- (BOOL)nextFileWithCacheId:(unint64_t *)a3 versionedFileIdentifier:(id *)a4 thumbnailCount:(unsigned int *)a5 minSize:(float *)a6 maxSize:(float *)a7 totalDataLength:(unint64_t *)a8
{
  p_stmt = &self->super._stmt;
  if (!self->super._stmt)
  {
    BOOL extraInfo = self->_extraInfo;
    v17 = "SELECT files.rowid, files.fileProviderId, files.itemId, files.version, count(thumbnails.file_id), min(thumbnai"
          "ls.size), max(thumbnails.size), sum(thumbnails.bitmapdata_length + thumbnails.plistbuffer_length) FROM provide"
          "r_files AS files, thumbnails WHERE files.rowid = thumbnails.file_id GROUP BY thumbnails.file_id";
    sqliteDatabase = self->super._sqliteDatabase;
    v19 = "SELECT rowid, fileProviderId, itemId, version FROM provider_files";
    if (!self->_ubiquitous)
    {
      v17 = "SELECT files.rowid, files.fileId, files.fsid, files.version, count(thumbnails.file_id), min(thumbnails.size)"
            ", max(thumbnails.size), sum(thumbnails.bitmapdata_length + thumbnails.plistbuffer_length) FROM basic_files A"
            "S files, thumbnails WHERE (files.rowid | (1<<63)) = thumbnails.file_id GROUP BY thumbnails.file_id";
      v19 = "SELECT rowid, fileId, fsid, version FROM basic_files";
    }
    if (extraInfo) {
      v20 = v17;
    }
    else {
      v20 = v19;
    }
    self->super._stmt = [(QLSqliteDatabase *)sqliteDatabase prepareStatement:v20];
  }
  fileIdentifier = self->_fileIdentifier;
  self->_fileIdentifier = 0;

  char v34 = 0;
  stmt = self->super._stmt;
  if (!stmt) {
    goto LABEL_16;
  }
  if ([(QLSqliteDatabase *)self->super._sqliteDatabase stepStatement:stmt didReturnData:&v34])
  {
    BOOL v23 = v34 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  if (v23)
  {
    if (*p_stmt) {
      [(QLSqliteDatabase *)self->super._sqliteDatabase finalizeStatement:p_stmt];
    }
LABEL_16:
    BOOL v24 = 0;
    goto LABEL_23;
  }
  unint64_t v25 = [(QLSqliteDatabase *)self->super._sqliteDatabase unsignedLongLongFromColumn:0 inStatement:self->super._stmt];
  BOOL ubiquitous = self->_ubiquitous;
  *a3 = v25;
  if (ubiquitous) {
    v27 = (Class *)0x1E4F3A680;
  }
  else {
    v27 = (Class *)0x1E4F3A670;
  }
  v28 = (QLCacheVersionedFileIdentifier *)[objc_alloc(*v27) initWithSteppedStatement:self->super._stmt database:self->super._sqliteDatabase];
  v29 = self->_fileIdentifier;
  self->_fileIdentifier = v28;

  if (self->_extraInfo)
  {
    *a5 = [(QLSqliteDatabase *)self->super._sqliteDatabase intFromColumn:4 inStatement:self->super._stmt];
    [(QLSqliteDatabase *)self->super._sqliteDatabase floatFromColumn:5 inStatement:self->super._stmt];
    *(_DWORD *)a6 = v30;
    [(QLSqliteDatabase *)self->super._sqliteDatabase floatFromColumn:6 inStatement:self->super._stmt];
    *(_DWORD *)a7 = v31;
    [(QLSqliteDatabase *)self->super._sqliteDatabase floatFromColumn:7 inStatement:self->super._stmt];
    *a8 = (unint64_t)v32;
  }
  BOOL v24 = 1;
LABEL_23:
  *a4 = self->_fileIdentifier;
  return v24;
}

- (void).cxx_destruct
{
}

@end