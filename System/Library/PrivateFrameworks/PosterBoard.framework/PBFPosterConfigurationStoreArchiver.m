@interface PBFPosterConfigurationStoreArchiver
+ (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5;
+ (id)archiveConfigurationStoreWithCoordinator:(id)a3 error:(id *)a4;
+ (id)unarchiveConfigurationStoreArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5;
+ (id)unarchiveConfigurationStoreArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5;
+ (int64_t)minSupportedArchiveVersion;
@end

@implementation PBFPosterConfigurationStoreArchiver

+ (int64_t)minSupportedArchiveVersion
{
  return 1;
}

+ (id)archiveConfigurationStoreWithCoordinator:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identityOfLatestVersion];
  v6 = [v5 provider];

  v7 = [[PBFPosterConfigurationStoreArchiveManifest alloc] initWithConfigurationStoreCoordinator:v4];
  v8 = [v4 posterUUID];
  v9 = [v8 UUIDString];
  v10 = [(PBFPosterConfigurationStoreArchiveManifest *)v7 buildVersion];
  v11 = [v6 stringByAppendingFormat:@"-%@-%@", v9, v10];

  v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = PFTemporaryDirectory();
  v14 = [v12 fileURLWithPath:v13 isDirectory:1];
  uint64_t v15 = [v14 URLByAppendingPathComponent:@"PosterConfigurations" isDirectory:1];
  v16 = [(id)v15 URLByAppendingPathComponent:v11];

  id v17 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v17 removeItemAtURL:v16 error:0];
  v18 = PFFileProtectionNoneAttributes();
  id v37 = 0;
  LOBYTE(v15) = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:v18 error:&v37];
  id v19 = v37;

  if (v15)
  {
    v32 = v6;
    id v36 = 0;
    v20 = [(PBFPosterConfigurationStoreArchiveManifest *)v7 dataRepresentationWithError:&v36];
    id v21 = v36;

    if (v20)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_manifestURLInContainerURL:", v16);
      id v35 = v21;
      int v23 = [v20 writeToURL:v22 options:0 error:&v35];
      id v24 = v35;

      if (!v23)
      {
        v27 = 0;
        id v21 = v24;
LABEL_9:
        v28 = a4;

        [v17 removeItemAtURL:v16 error:0];
        id v19 = v21;
        v6 = v32;
        if (v27) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      v25 = [v4 identifierURL];
      v26 = [v16 URLByAppendingPathComponent:@"configuration"];
      id v34 = v24;
      int v31 = [v17 copyItemAtURL:v25 toURL:v26 error:&v34];
      id v21 = v34;

      if (v31)
      {
        v27 = [v16 URLByAppendingPathExtension:@"aa"];
        PBFAppleArchiveCompressDirectory(v16, v27);
        goto LABEL_9;
      }
    }
    v27 = 0;
    goto LABEL_9;
  }
  [v17 removeItemAtURL:v16 error:0];
  v28 = a4;
LABEL_10:
  if (v19)
  {
    uint64_t v38 = *MEMORY[0x1E4F28A50];
    v39[0] = v19;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  }
  else
  {
    v29 = 0;
  }
  id v21 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PBFArchiverErrorDomain" code:2 userInfo:v29];

  v27 = 0;
LABEL_14:
  if (v28) {
    id *v28 = v21;
  }

  return v27;
}

+ (id)unarchiveConfigurationStoreArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E6983A48;
  id v13 = v8;
  id v9 = v8;
  v10 = [a1 _unarchiveWithHandler:v12 manifest:a4 error:a5];

  return v10;
}

BOOL __94__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveAtURL_manifest_error___block_invoke(uint64_t a1, void *a2)
{
  return PBFAppleArchiveDecompress(*(void **)(a1 + 32), a2);
}

+ (id)unarchiveConfigurationStoreArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F28F48] pipe];
  v10 = [v9 fileHandleForWriting];
  v11 = [v9 fileHandleForReading];
  Serial = BSDispatchQueueCreateSerial();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke;
  block[3] = &unk_1E69808E8;
  id v21 = v10;
  id v22 = v8;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(Serial, block);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke_2;
  v18[3] = &unk_1E6983A48;
  id v19 = v11;
  id v15 = v11;
  v16 = [a1 _unarchiveWithHandler:v18 manifest:a4 error:a5];
  [v15 closeFile];

  return v16;
}

uint64_t __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) writeData:*(void *)(a1 + 40) error:0];
  v2 = *(void **)(a1 + 32);
  return [v2 closeFile];
}

BOOL __93__PBFPosterConfigurationStoreArchiver_unarchiveConfigurationStoreArchiveData_manifest_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = AAFileStreamOpenWithFD([v2 fileDescriptor], 0);
  BOOL v5 = PBFAppleArchiveDecompressStream(v4, v3);

  return v5;
}

+ (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  v83[1] = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, void *))a3;
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = PFTemporaryDirectory();
  v10 = [v8 fileURLWithPath:v9 isDirectory:1];
  v11 = [v10 URLByAppendingPathComponent:@"PosterConfigurations" isDirectory:1];
  v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  id v14 = [v11 URLByAppendingPathComponent:v13];

  [v7 removeItemAtURL:v14 error:0];
  id v15 = PFFileProtectionNoneAttributes();
  id v77 = 0;
  LODWORD(v10) = [v7 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:v15 error:&v77];
  id v16 = v77;

  if (!v10)
  {
    v30 = 0;
    int v31 = a5;
    id v19 = v70;
    goto LABEL_12;
  }
  if (v6[2](v6, v14))
  {
    uint64_t v17 = [v14 URLByAppendingPathComponent:@"configuration"];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_manifestURLInContainerURL:", v14);
    id v19 = v70;
    v67 = (void *)v17;
    [v70 addObject:v17];
    [v70 addObject:v18];
    id v76 = v16;
    v66 = (void *)v18;
    uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v18 options:0 error:&v76];
    id v21 = v76;

    v65 = (void *)v20;
    id v22 = [[PBFPosterConfigurationStoreArchiveManifest alloc] initWithDataRepresentation:v20];
    int v23 = v22;
    if (v22)
    {
      v63 = v21;
      uint64_t v24 = [(PBFPosterConfigurationStoreArchiveManifest *)v22 archiveVersion];
      if (v24 >= [a1 minSupportedArchiveVersion])
      {
        v61 = v6;
        v39 = [(PBFPosterConfigurationStoreArchiveManifest *)v23 extensionIdentifier];
        v26 = [v14 URLByAppendingPathComponent:v39];

        v40 = (void *)MEMORY[0x1E4F1CB10];
        v62 = v23;
        v41 = [(PBFPosterConfigurationStoreArchiveManifest *)v23 configurationUUID];
        v42 = objc_msgSend(v40, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v26, 3, v41);

        v43 = [v42 URLByDeletingLastPathComponent];
        v44 = PFFileProtectionNoneAttributes();
        id v75 = v63;
        int v45 = [v7 createDirectoryAtURL:v43 withIntermediateDirectories:1 attributes:v44 error:&v75];
        id v16 = v75;

        if (v45)
        {
          id v74 = v16;
          v64 = v42;
          int v46 = [v7 copyItemAtURL:v67 toURL:v42 error:&v74];
          id v47 = v74;

          if (v46)
          {
            [v26 URLByAppendingPathComponent:@"/"];
            uint64_t v48 = v59 = v47;

            int v23 = v62;
            uint64_t v49 = [(PBFPosterConfigurationStoreArchiveManifest *)v62 configurationUUID];
            v50 = (void *)MEMORY[0x1E4F924C8];
            v51 = [(PBFPosterConfigurationStoreArchiveManifest *)v62 extensionIdentifier];
            v52 = [MEMORY[0x1E4F926B0] loadPosterDescriptorIdentifierForPathAtURL:v48 type:3 posterUUID:v49];
            v53 = [(PBFPosterConfigurationStoreArchiveManifest *)v62 role];
            v58 = (void *)v49;
            uint64_t v54 = objc_msgSend(v50, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v51, v52, v53, v49, -[PBFPosterConfigurationStoreArchiveManifest latestConfigurationVersion](v62, "latestConfigurationVersion"), -[PBFPosterConfigurationStoreArchiveManifest latestConfigurationSupplement](v62, "latestConfigurationSupplement"));

            v60 = (void *)v48;
            v55 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v48 identity:v54];
            id v73 = 0;
            v56 = [MEMORY[0x1E4F926B0] loadConfiguredPropertiesForPath:v55 error:&v73];
            id v16 = v73;

            if (v56)
            {
              v57 = (void *)v54;
              v30 = (void *)[objc_alloc(MEMORY[0x1E4F925C0]) initWithNewPath:v55 destinationPosterUUID:0 sourceIdentity:v54 configuredProperties:v56 attributes:0];
              v29 = v64;
              if (a4) {
                *a4 = v62;
              }
              int v31 = a5;
            }
            else
            {
              v57 = (void *)v54;
              v30 = 0;
              int v31 = a5;
              v29 = v64;
            }

            v26 = v60;
            v6 = v61;
            id v19 = v70;
          }
          else
          {
            v30 = 0;
            id v16 = v47;
            int v23 = v62;
            int v31 = a5;
            id v19 = v70;
            v29 = v64;
          }
        }
        else
        {
          v30 = 0;
          int v31 = a5;
          id v19 = v70;
          v29 = v42;
          int v23 = v62;
        }
        goto LABEL_10;
      }
      id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v80 = *MEMORY[0x1E4F28568];
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Archive version %lu is older than min supported %lu", -[PBFPosterConfigurationStoreArchiveManifest archiveVersion](v23, "archiveVersion"), objc_msgSend(a1, "minSupportedArchiveVersion"));
      v81 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      v28 = v25;
      v29 = (void *)v27;
      id v16 = (id)[v28 initWithDomain:@"PBFArchiverErrorDomain" code:5 userInfo:v27];
    }
    else
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v82 = *MEMORY[0x1E4F28568];
      v83[0] = @"Archive is unsupported";
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
      id v16 = (id)[v34 initWithDomain:@"PBFArchiverErrorDomain" code:4 userInfo:v26];
      v29 = v21;
    }
    v30 = 0;
    int v31 = a5;
LABEL_10:

    v33 = v67;
    goto LABEL_11;
  }
  uint64_t v32 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PBFArchiverErrorDomain" code:3 userInfo:0];
  v30 = 0;
  v33 = v16;
  id v16 = (id)v32;
  int v31 = a5;
  id v19 = v70;
LABEL_11:

LABEL_12:
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __76__PBFPosterConfigurationStoreArchiver__unarchiveWithHandler_manifest_error___block_invoke;
  v71[3] = &unk_1E6983A70;
  id v35 = v7;
  id v72 = v35;
  [v19 enumerateObjectsUsingBlock:v71];
  if (!v30)
  {
    if (v16)
    {
      uint64_t v78 = *MEMORY[0x1E4F28A50];
      id v79 = v16;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    }
    else
    {
      id v36 = 0;
    }
    uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PBFArchiverErrorDomain" code:3 userInfo:v36];

    id v16 = (id)v37;
  }
  if (v31) {
    *int v31 = v16;
  }

  return v30;
}

uint64_t __76__PBFPosterConfigurationStoreArchiver__unarchiveWithHandler_manifest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

@end