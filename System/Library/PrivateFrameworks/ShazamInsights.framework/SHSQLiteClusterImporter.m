@interface SHSQLiteClusterImporter
- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6;
@end

@implementation SHSQLiteClusterImporter

- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 dataFilePathURL];
  id v25 = 0;
  v13 = +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:v12 error:&v25];
  id v14 = v25;

  if (!v13)
  {
    if (a6)
    {
      id v22 = v14;
LABEL_9:
      LOBYTE(v17) = 0;
      *a6 = v22;
      goto LABEL_11;
    }
LABEL_10:
    LOBYTE(v17) = 0;
    goto LABEL_11;
  }
  uint64_t v15 = [v10 clusterType];
  if (v15 != [v13 clusterType])
  {
    if (a6)
    {
      id v22 = +[SHInsightsError errorWithCode:201 underlyingError:0];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v16 = [v9 dataFilePathURL];
  LODWORD(v17) = +[SHClusterImporterUtils copyDatabaseFromURL:v16 toDatabaseDestinationURL:v11 error:a6];

  if (v17)
  {
    v24 = [SHClusterMetadata alloc];
    uint64_t v18 = [v13 clusterType];
    v19 = [v13 storefront];
    v20 = [v10 uniqueHash];
    v17 = [v13 creationDate];
    v21 = [(SHClusterMetadata *)v24 initWithType:v18 storefront:v19 uniqueHash:v20 creationDate:v17];

    LOBYTE(v17) = +[SHClusterMetadataQuery writeMetadata:v21 toDatabaseAtLocation:v11 error:a6];
  }
LABEL_11:

  return (char)v17;
}

@end