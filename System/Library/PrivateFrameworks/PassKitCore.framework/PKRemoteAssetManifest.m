@interface PKRemoteAssetManifest
+ (Class)_remoteAssestManifestItemClassWithValues:(id)a3;
- (NSArray)encryptedDeviceSpecificRemoteAssetFilenames;
- (NSDictionary)remoteAssets;
- (NSURL)fileURL;
- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 deviceSEIDs:(id)a5 error:(id *)a6;
- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 error:(id *)a5;
- (id)deviceSpecificAsset;
- (id)deviceSpecificAssetForScreenScale:(double)a3 suffix:(id)a4;
@end

@implementation PKRemoteAssetManifest

+ (Class)_remoteAssestManifestItemClassWithValues:(id)a3
{
  v3 = [a3 valueForKey:@"url"];
  v4 = objc_opt_class();
  v5 = [v3 lowercaseString];
  int v6 = [v5 containsString:@"cloudkit:"];

  if (v6) {
    v4 = objc_opt_class();
  }
  v7 = v4;

  return v7;
}

- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 error:(id *)a5
{
  return [(PKRemoteAssetManifest *)self initWithFileURL:a3 passURL:a4 deviceSEIDs:0 error:a5];
}

- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 deviceSEIDs:(id)a5 error:(id *)a6
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v102.receiver = self;
  v102.super_class = (Class)PKRemoteAssetManifest;
  v14 = [(PKRemoteAssetManifest *)&v102 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
    v23 = (void *)v15;
    if (v15)
    {
      v89 = (void *)v15;
      uint64_t v24 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:a6];
      v85 = (PKRemoteAssetManifest *)v24;
      if (v24)
      {
        v32 = (void *)v24;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v90 = v12;
          objc_storeStrong((id *)&v14->_fileURL, a3);
          objc_storeStrong((id *)&v14->_passURL, a4);
          uint64_t v40 = [MEMORY[0x1E4F1CA60] dictionary];
          remoteAssets = v14->_remoteAssets;
          v14->_remoteAssets = (NSMutableDictionary *)v40;

          v86 = (PKRemoteAssetManifest *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v42 = v32;
          uint64_t v92 = [v42 countByEnumeratingWithState:&v98 objects:v108 count:16];
          if (!v92)
          {

            goto LABEL_58;
          }
          uint64_t v43 = *(void *)v99;
          v91 = a6;
          uint64_t v87 = *(void *)v99;
          id v88 = v42;
          id v82 = v11;
LABEL_7:
          uint64_t v44 = 0;
          while (1)
          {
            if (*(void *)v99 != v43) {
              objc_enumerationMutation(v42);
            }
            uint64_t v45 = *(void *)(*((void *)&v98 + 1) + 8 * v44);
            v46 = [v42 objectForKey:v45];
            objc_opt_class();
            v93 = v46;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a6)
              {
                PKValidationErrorWithReason(@"%@ is not a dictionary for key %@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)v46);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
                v54 = v14;
                v14 = 0;
LABEL_55:

                v64 = v93;
LABEL_56:

                goto LABEL_57;
              }
              v64 = v46;
              goto LABEL_41;
            }
            v54 = v46;
            v55 = [(PKRemoteAssetManifest *)v54 PKArrayContaining:objc_opt_class() forKey:@"urls"];
            if ([v13 count])
            {
              long long v96 = 0u;
              long long v97 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              id v56 = v55;
              uint64_t v57 = [v56 countByEnumeratingWithState:&v94 objects:v107 count:16];
              if (v57)
              {
                uint64_t v58 = v57;
                v83 = v55;
                v84 = v14;
                uint64_t v59 = *(void *)v95;
                while (2)
                {
                  for (uint64_t i = 0; i != v58; ++i)
                  {
                    if (*(void *)v95 != v59) {
                      objc_enumerationMutation(v56);
                    }
                    v61 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                    v62 = [v61 PKStringForKey:@"seid"];
                    if ([v13 containsObject:v62])
                    {
                      v65 = v61;

                      char v63 = 0;
                      v54 = v65;
                      goto LABEL_24;
                    }
                  }
                  uint64_t v58 = [v56 countByEnumeratingWithState:&v94 objects:v107 count:16];
                  if (v58) {
                    continue;
                  }
                  break;
                }
                char v63 = 1;
LABEL_24:
                id v11 = v82;
                v55 = v83;
                v14 = v84;
              }
              else
              {
                char v63 = 1;
              }

              a6 = v91;
              if (!v55) {
                goto LABEL_32;
              }
            }
            else
            {
              char v63 = 1;
              if (!v55) {
                goto LABEL_32;
              }
            }
            [(PKRemoteAssetManifest *)v86 addObject:v45];
            char v66 = v63 ^ 1;
            if (!v13) {
              char v66 = 0;
            }
            if ((v66 & 1) == 0)
            {

              id v42 = v88;
              goto LABEL_55;
            }
LABEL_32:
            v67 = [v11 URLByDeletingLastPathComponent];
            v68 = [v67 URLByAppendingPathComponent:v45];

            v69 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_remoteAssestManifestItemClassWithValues:", v54), "itemWithLocalURL:passURL:dictionary:error:", v68, v90, v54, a6);
            v70 = v69;
            if (v69)
            {
              uint64_t v71 = [v69 seid];
              v72 = (void *)v71;
              if (!v13 || !v71 || ([v13 containsObject:v71] & 1) != 0)
              {
                [(NSMutableDictionary *)v14->_remoteAssets setObject:v70 forKey:v45];
                char v73 = 1;
                goto LABEL_40;
              }

              char v73 = 0;
            }
            else
            {
              char v73 = 0;
              v72 = v14;
            }
            v14 = 0;
LABEL_40:

            a6 = v91;
            uint64_t v43 = v87;
            id v42 = v88;
            v64 = v93;
            if ((v73 & 1) == 0) {
              goto LABEL_56;
            }
LABEL_41:

            if (++v44 == v92)
            {
              uint64_t v92 = [v42 countByEnumeratingWithState:&v98 objects:v108 count:16];
              if (v92) {
                goto LABEL_7;
              }
LABEL_57:

              if (v14)
              {
LABEL_58:
                v75 = v86;
                uint64_t v76 = [(PKRemoteAssetManifest *)v86 copy];
                encryptedDeviceSpecificRemoteAssetFilenames = v14->_encryptedDeviceSpecificRemoteAssetFilenames;
                v14->_encryptedDeviceSpecificRemoteAssetFilenames = (NSArray *)v76;

                uint64_t v78 = [(NSMutableDictionary *)v14->_remoteAssets count];
              }
              else
              {
                uint64_t v78 = 0;
                v75 = v86;
              }
              v79 = PKLogFacilityTypeGetObject(0);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v104 = v78;
                __int16 v105 = 2112;
                id v106 = v42;
                _os_log_impl(&dword_190E10000, v79, OS_LOG_TYPE_DEFAULT, "Remote Asset Manifest found %lu assets from %@", buf, 0x16u);
              }

              id v12 = v90;
LABEL_63:

LABEL_64:
              v74 = v85;
LABEL_65:

              v23 = v89;
              goto LABEL_66;
            }
          }
        }
        if (!a6) {
          goto LABEL_64;
        }
        PKValidationErrorWithReason(@"%@ is not a JSON dictionary", v33, v34, v35, v36, v37, v38, v39, (uint64_t)v11);
      }
      else
      {
        if (!a6)
        {
LABEL_51:
          v75 = v14;
          v14 = 0;
          goto LABEL_63;
        }
        PKValidationErrorWithReason(@"Could not read JSON at %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v11);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    if (a6)
    {
      v89 = 0;
      PKValidationErrorWithReason(@"Could not read file at %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v74 = v14;
      v14 = 0;
      goto LABEL_65;
    }
LABEL_66:
  }
  v80 = v14;

  return v80;
}

- (id)deviceSpecificAsset
{
  double v3 = PKScreenScale();
  return [(PKRemoteAssetManifest *)self deviceSpecificAssetForScreenScale:0 suffix:v3];
}

- (id)deviceSpecificAssetForScreenScale:(double)a3 suffix:(id)a4
{
  id v6 = a4;
  v7 = [(NSURL *)self->_fileURL URLByDeletingPathExtension];
  v8 = [v7 pathExtension];
  v9 = [v7 URLByDeletingPathExtension];
  v10 = [v9 lastPathComponent];

  int v11 = [v8 isEqualToString:@"pdf"];
  int v12 = v11;
  if (v6)
  {
    if (v11)
    {
      id v13 = [v10 stringByAppendingString:v6];
      v14 = [v13 stringByAppendingPathExtension:v8];

      id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v14];

      if (v15) {
        id v15 = v14;
      }
    }
    else
    {
      id v15 = 0;
    }
    if (a3 >= 3.0 && !v15)
    {
      uint64_t v16 = [v10 stringByAppendingString:v6];
      uint64_t v17 = [v16 stringByAppendingString:@"@3x"];
      uint64_t v18 = [v17 stringByAppendingPathExtension:v8];

      id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v18];

      if (v15) {
        id v15 = v18;
      }
    }
    if (a3 >= 2.0 && !v15)
    {
      uint64_t v19 = [v10 stringByAppendingString:v6];
      uint64_t v20 = [v19 stringByAppendingString:@"@2x"];
      uint64_t v21 = [v20 stringByAppendingPathExtension:v8];

      id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v21];

      if (v15) {
        id v15 = v21;
      }
    }
    if (v15) {
      goto LABEL_45;
    }
    uint64_t v22 = [v10 stringByAppendingString:v6];
    v23 = [v22 stringByAppendingString:@"@1x"];
    uint64_t v24 = [v23 stringByAppendingPathExtension:v8];

    id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v24];

    if (v15) {
      id v15 = v24;
    }
  }
  else
  {
    id v15 = 0;
  }
  if (v15) {
    int v25 = 0;
  }
  else {
    int v25 = v12;
  }
  if (v25 == 1)
  {
    uint64_t v26 = [v10 stringByAppendingPathExtension:v8];
    id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v26];

    if (v15) {
      id v15 = v26;
    }
  }
  if (a3 >= 3.0 && !v15)
  {
    uint64_t v27 = [v10 stringByAppendingString:@"@3x"];
    uint64_t v28 = [v27 stringByAppendingPathExtension:v8];

    id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v28];

    if (v15) {
      id v15 = v28;
    }
  }
  if (a3 >= 2.0 && !v15)
  {
    uint64_t v29 = [v10 stringByAppendingString:@"@2x"];
    uint64_t v30 = [v29 stringByAppendingPathExtension:v8];

    id v15 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v30];

    if (v15) {
      id v15 = v30;
    }
  }
  if (!v15)
  {
    uint64_t v31 = [v10 stringByAppendingString:@"@1x"];
    id v15 = [v31 stringByAppendingPathExtension:v8];

    v32 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v15];

    if (v32)
    {
      if (v15) {
        goto LABEL_45;
      }
    }
    else
    {
    }
    id v15 = [v7 lastPathComponent];
  }
LABEL_45:
  uint64_t v33 = [(NSMutableDictionary *)self->_remoteAssets objectForKey:v15];

  return v33;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDictionary)remoteAssets
{
  return &self->_remoteAssets->super;
}

- (NSArray)encryptedDeviceSpecificRemoteAssetFilenames
{
  return self->_encryptedDeviceSpecificRemoteAssetFilenames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedDeviceSpecificRemoteAssetFilenames, 0);
  objc_storeStrong((id *)&self->_remoteAssets, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end