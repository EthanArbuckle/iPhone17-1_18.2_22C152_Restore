@interface PLManagedAssetID
- (NSString)directory;
- (NSString)filename;
- (NSString)uuid;
- (PLManagedAssetID)initWithManagedAsset:(id)a3;
- (PLManagedAssetID)initWithUUID:(id)a3 filename:(id)a4 directory:(id)a5 libraryID:(id)a6 bundleScope:(unsigned __int16)a7;
- (PLPhotoLibraryPathManagerIdentifier)libraryID;
- (unsigned)bundleScope;
- (void)setBundleScope:(unsigned __int16)a3;
- (void)setDirectory:(id)a3;
- (void)setFilename:(id)a3;
- (void)setLibraryID:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLManagedAssetID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setLibraryID:(id)a3
{
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setDirectory:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PLManagedAssetID)initWithUUID:(id)a3 filename:(id)a4 directory:(id)a5 libraryID:(id)a6 bundleScope:(unsigned __int16)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PLManagedAssetID;
  v17 = [(PLManagedAssetID *)&v24 init];
  if (v17)
  {
    if (v13)
    {
      if (v14) {
        goto LABEL_4;
      }
    }
    else
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v17, @"PLManagedAssetID.m", 63, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];

      if (v14)
      {
LABEL_4:
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_10;
      }
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v17, @"PLManagedAssetID.m", 64, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

    if (v15)
    {
LABEL_5:
      if (v16)
      {
LABEL_6:
        objc_storeStrong((id *)&v17->_uuid, a3);
        objc_storeStrong((id *)&v17->_filename, a4);
        objc_storeStrong((id *)&v17->_directory, a5);
        objc_storeStrong((id *)&v17->_libraryID, a6);
        v17->_bundleScope = a7;
        goto LABEL_7;
      }
LABEL_11:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v17, @"PLManagedAssetID.m", 66, @"Invalid parameter not satisfying: %@", @"libraryID" object file lineNumber description];

      goto LABEL_6;
    }
LABEL_10:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, v17, @"PLManagedAssetID.m", 65, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_7:

  return v17;
}

- (PLManagedAssetID)initWithManagedAsset:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLManagedAssetID;
  v6 = [(PLManagedAssetID *)&v20 init];
  if (v6)
  {
    if (!v5)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v6, @"PLManagedAssetID.m", 35, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
    }
    uint64_t v7 = [v5 uuid];
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    uint64_t v9 = [v5 filename];
    filename = v6->_filename;
    v6->_filename = (NSString *)v9;

    uint64_t v11 = [v5 directory];
    directory = v6->_directory;
    v6->_directory = (NSString *)v11;

    v6->_bundleScope = [v5 bundleScope];
    id v13 = [v5 photoLibrary];

    if (v13)
    {
      id v14 = [v5 photoLibrary];
      uint64_t v15 = [v14 libraryID];
    }
    else
    {
      id v16 = [v5 managedObjectContext];
      id v14 = [v16 pathManager];

      if (!v14)
      {
        id v14 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
      }
      uint64_t v15 = PLLibraryIDFromPathManager();
    }
    libraryID = v6->_libraryID;
    v6->_libraryID = (PLPhotoLibraryPathManagerIdentifier *)v15;
  }
  return v6;
}

@end