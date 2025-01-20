@interface MBManifest
+ (id)manifestWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)containsFileWithID:(id)a3;
- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4;
- (MBDatabase)database;
- (MBDatabaseIndex)databaseIndex;
- (MBManifest)initWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5;
- (MBProperties)properties;
- (id)enumerateFiles:(id)a3;
- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4;
- (id)fetchFileWithID:(id)a3 error:(id *)a4;
- (id)fileEnumerator;
- (id)fileWithID:(id)a3;
- (void)buildIndexFromDatabaseIfNeeded;
- (void)dealloc;
@end

@implementation MBManifest

+ (id)manifestWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5
{
  v5 = [[MBManifest alloc] initWithProperties:a3 database:a4 databaseIndex:a5];
  return v5;
}

- (MBManifest)initWithProperties:(id)a3 database:(id)a4 databaseIndex:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBManifest.m" lineNumber:25 description:@"Null manifest properties"];
    if (a4) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBManifest.m" lineNumber:26 description:@"Null manifest database"];
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)MBManifest;
  v10 = [(MBManifest *)&v12 init];
  if (v10)
  {
    v10->_properties = (MBProperties *)a3;
    v10->_database = (MBDatabase *)a4;
    v10->_databaseIndex = (MBDatabaseIndex *)a5;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBManifest;
  [(MBManifest *)&v3 dealloc];
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (MBDatabaseIndex)databaseIndex
{
  result = self->_databaseIndex;
  if (!result)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBManifest.m" lineNumber:47 description:@"Database index not set"];
    return self->_databaseIndex;
  }
  return result;
}

- (BOOL)containsFileWithID:(id)a3
{
  return [(MBDatabaseIndex *)self->_databaseIndex containsFileID:a3];
}

- (id)fileWithID:(id)a3
{
  databaseIndex = self->_databaseIndex;
  if (!databaseIndex)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBManifest.m" lineNumber:56 description:@"Database index not set"];
    databaseIndex = self->_databaseIndex;
  }
  int64_t v6 = [(MBDatabaseIndex *)databaseIndex offsetForFileID:a3];
  if (v6 < 0) {
    return 0;
  }
  id v7 = [(MBDatabase *)self->_database fileAtOffset:v6];
  if ((objc_msgSend(objc_msgSend(v7, "fileID"), "isEqualToFileID:", a3) & 1) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"File ID doesn't match index: %@-%@ (%@ vs %@)", objc_msgSend(objc_msgSend(v7, "domain"), "name"), objc_msgSend(v7, "relativePath"), objc_msgSend(v7, "fileID"), a3 format]);
  }
  return v7;
}

- (id)fetchFileWithID:(id)a3 error:(id *)a4
{
  return -[MBManifest fileWithID:](self, "fileWithID:", a3, a4);
}

- (id)fileEnumerator
{
  return [(MBDatabase *)self->_database fileEnumerator];
}

- (id)enumerateFiles:(id)a3
{
  return [(MBManifest *)self enumerateFiles:a3 includeUninstalled:0];
}

- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4
{
  return -[MBDatabase enumerateFiles:](self->_database, "enumerateFiles:", a3, a4);
}

- (void)buildIndexFromDatabaseIfNeeded
{
  if (!self->_databaseIndex)
  {
    objc_super v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Building index from database", v4, 2u);
      _MBLog();
    }
    self->_databaseIndex = (MBDatabaseIndex *)[(MBDatabase *)self->_database indexFromDatabaseIgnoringTruncation:0];
  }
}

- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4
{
  return 1;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBDatabase)database
{
  return self->_database;
}

@end