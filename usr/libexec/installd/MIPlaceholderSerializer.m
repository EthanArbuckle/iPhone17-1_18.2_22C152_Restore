@interface MIPlaceholderSerializer
+ (BOOL)serializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 onBehalfOf:(id *)a7 withError:(id *)a8;
@end

@implementation MIPlaceholderSerializer

+ (BOOL)serializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 onBehalfOf:(id *)a7 withError:(id *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v12 = a3;
  id v78 = a4;
  id v13 = a5;
  v14 = +[MIFileManager defaultManager];
  uint64_t v98 = 0;
  v15 = +[MIDaemonConfiguration sharedInstance];
  id v97 = 0;
  v16 = [v15 stagingRootForDevice:v9 url:v13 identifier:&v98 error:&v97];
  id v17 = v97;

  v74 = v13;
  v76 = v14;
  if (!v16)
  {
    v75 = 0;
    v19 = 0;
LABEL_13:
    v73 = 0;
    v77 = 0;
    id v71 = 0;
    id v34 = 0;
    v22 = 0;
LABEL_14:
    v35 = 0;
    v72 = 0;
    v36 = 0;
    v23 = 0;
    goto LABEL_32;
  }
  id v96 = v17;
  v19 = +[MIBundleContainer appBundleContainerWithIdentifier:v12 createIfNeeded:0 created:0 error:&v96];
  id v20 = v96;

  if (!v19)
  {
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v77 = 0;
    id v71 = 0;
    id v34 = 0;
    v22 = 0;
    v35 = 0;
    v36 = 0;
    v23 = 0;
LABEL_31:
    id v17 = v20;
    goto LABEL_32;
  }
  v68 = a7;
  v77 = [v19 bundle];
  if (!v77)
  {
    sub_100014A08((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 59, MIInstallerErrorDomain, 4, 0, 0, @"Failed to locate app bundle in container for %@", v21, (uint64_t)v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v75 = 0;
    goto LABEL_13;
  }
  id v95 = v20;
  v22 = [v14 createTemporaryDirectoryInDirectoryURL:v16 error:&v95];
  id v17 = v95;

  if (!v22)
  {
    v75 = 0;
    v73 = 0;
    id v71 = 0;
    id v34 = 0;
    goto LABEL_14;
  }
  id v94 = v17;
  v23 = [v14 createTemporaryDirectoryInDirectoryURL:v22 error:&v94];
  id v20 = v94;

  if (!v23)
  {
    v36 = 0;
    id v71 = 0;
    v72 = 0;
    v73 = 0;
    v75 = 0;
    id v34 = 0;
LABEL_30:
    [v76 removeItemAtURL:v22 error:0];
    v35 = 0;
    goto LABEL_31;
  }
  id v66 = v23;
  v24 = [v23 URLByAppendingPathComponent:@"Payload" isDirectory:1];
  id v93 = v20;
  unsigned int v25 = [v14 createDirectoryAtURL:v24 withIntermediateDirectories:0 mode:493 error:&v93];
  id v26 = v93;

  if (!v25)
  {
    id v71 = 0;
    v72 = 0;
    v73 = 0;
    v75 = 0;
    id v20 = v26;
    v23 = 0;
    id v34 = v66;
    v36 = v24;
    goto LABEL_30;
  }
  v63 = v22;
  v27 = [v77 bundleName];
  v62 = v24;
  uint64_t v28 = [v24 URLByAppendingPathComponent:v27 isDirectory:1];

  v65 = (void *)v28;
  if ([v77 isPlaceholder])
  {
    v29 = [v77 bundleURL];
    id v92 = v26;
    unsigned __int8 v30 = [v14 copyItemAtURL:v29 toURL:v28 error:&v92];
    v31 = v14;
    unsigned __int8 v32 = v30;
    id v33 = v92;

    v75 = 0;
    v22 = v63;
    if ((v32 & 1) == 0)
    {
      id v71 = 0;
      v72 = 0;
      id v20 = v33;
      v73 = 0;
LABEL_29:
      v23 = v65;
      id v34 = v66;
      v36 = v24;
      goto LABEL_30;
    }
  }
  else
  {
    id v37 = objc_alloc((Class)MIPlaceholderConstructor);
    v38 = [v77 bundleURL];
    id v91 = v26;
    id v39 = [v37 initWithSource:v38 byPreservingFullInfoPlist:1 error:&v91];
    id v20 = v91;

    if (!v39)
    {
      id v71 = 0;
      v72 = 0;
      v73 = 0;
      v75 = 0;
      v22 = v63;
      goto LABEL_29;
    }
    id v90 = v20;
    v75 = v39;
    unsigned int v40 = [v39 materializeIntoBundleDirectory:v65 error:&v90];
    id v33 = v90;

    v22 = v63;
    if (!v40)
    {
      id v71 = 0;
      v72 = 0;
      v73 = 0;
      id v20 = v33;
      goto LABEL_29;
    }
    v31 = v14;
  }
  v41 = [v19 containerURL];
  uint64_t v42 = [v41 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];

  v43 = [v66 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];
  id v89 = v33;
  v72 = (void *)v42;
  LODWORD(v42) = [v31 copyItemIfExistsAtURL:v42 toURL:v43 error:&v89];
  id v20 = v89;

  if (!v42)
  {
    id v71 = 0;
    v73 = 0;
    goto LABEL_29;
  }
  v64 = v20;
  v44 = [v13 lastPathComponent];
  v45 = [v22 URLByAppendingPathComponent:v44 isDirectory:0];

  v46 = [v22 lastPathComponent];
  v47 = [v13 lastPathComponent];
  v73 = +[NSString stringWithFormat:@"%@/%@", v46, v47];

  id v48 = v45;
  v49 = fopen((const char *)[v48 fileSystemRepresentation], "wx");
  if (!v49)
  {
    int v54 = *__error();
    id v71 = v48;
    id v55 = [v71 fileSystemRepresentation];
    strerror(v54);
    sub_100014A08((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 108, NSPOSIXErrorDomain, v54, 0, 0, @"Failed to create output file %s: %s", v56, (uint64_t)v55);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  id v71 = v48;
  uint64_t v88 = 0;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v83 = 0;
  long long v85 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v61 = v49;
  v84 = v49;
  v99[0] = kSZArchiverOptionCompressionOptions;
  v99[1] = kSZArchiverOptionNoCache;
  v99[2] = kSZArchiverOptionZlibCompressionLevel;
  v99[3] = kSZArchiverOptionSkipPrescan;
  v100[2] = &off_100096FD0;
  v100[3] = &__kCFBooleanFalse;
  v100[0] = kSZArchiverCompressionOptionTryRecompress;
  v100[1] = &__kCFBooleanTrue;
  v99[4] = kSZArchiverOptionUncompressBloatedFiles;
  v100[4] = &__kCFBooleanTrue;
  v50 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
  v35 = +[NSMutableDictionary dictionaryWithDictionary:v50];

  id v34 = v66;
  [v34 fileSystemRepresentation];
  v36 = v62;
  if (SZArchiverCreateStreamableZip())
  {
    v51 = +[MIHelperServiceClient sharedInstance];
    id v80 = v64;
    long long v52 = *(_OWORD *)&v68->var0[4];
    v79[0] = *(_OWORD *)v68->var0;
    v79[1] = v52;
    v69 = v51;
    unsigned __int8 v53 = [v51 moveItemInStagingDirectory:v98 atRelativePath:v73 toDestinationURL:v74 onBehalfOf:v79 withError:&v80];
    id v17 = v80;

    v23 = v65;
  }
  else
  {
    v59 = (void *)MIInstallerErrorDomain;
    v23 = v65;
    v69 = [v65 path];
    sub_100014A08((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 124, v59, 4, 0, 0, @"Failed to archive contents of %@", v60, (uint64_t)v69);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    unsigned __int8 v53 = 0;
  }

  [v76 removeItemAtURL:v22 error:0];
  fclose(v61);
  if (v53)
  {
    BOOL v70 = 1;
    goto LABEL_35;
  }
LABEL_32:
  v57 = v17;
  sub_100014A08((uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]", 146, MIInstallerErrorDomain, 175, v17, 0, @"Failed to create a serialized placeholder for %@/%@", v18, (uint64_t)v12);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (a8)
  {
    id v17 = v17;
    BOOL v70 = 0;
    *a8 = v17;
  }
  else
  {
    BOOL v70 = 0;
  }
LABEL_35:

  return v70;
}

@end