@interface PBFDataStoreArchiveMetadata
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)archiveName;
- (NSURL)archiveURL;
- (PBFDataStoreArchiveMetadata)initWithURL:(id)a3;
- (unint64_t)hash;
- (unint64_t)version;
@end

@implementation PBFDataStoreArchiveMetadata

- (PBFDataStoreArchiveMetadata)initWithURL:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PBFDataStoreArchiveMetadata;
  v5 = [(PBFDataStoreArchiveMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    archiveURL = v5->_archiveURL;
    v5->_archiveURL = (NSURL *)v6;

    v8 = [v4 lastPathComponent];
    id v19 = 0;
    unint64_t v20 = 0;
    id v18 = 0;
    int v9 = _PBFDistillFileNameIntoArchiveComponents(v8, &v20, &v19, &v18);
    v10 = (NSDate *)v19;
    id v11 = v18;
    if (!v9)
    {

      v16 = 0;
      goto LABEL_6;
    }
    archiveName = v5->_archiveName;
    v5->_archiveName = (NSString *)v11;
    id v13 = v11;

    v5->_version = v20;
    creationDate = v5->_creationDate;
    v5->_creationDate = v10;
    v15 = v10;
  }
  v16 = v5;
LABEL_6:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBFDataStoreArchiveMetadata *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      char v7 = [(NSURL *)v4->_archiveURL isEqual:self->_archiveURL];
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_archiveURL hash];
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)archiveName
{
  return self->_archiveName;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
}

@end