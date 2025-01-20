@interface PFParallaxAssetResource
+ (BOOL)saveImage:(CGImage *)a3 toURL:(id)a4 error:(id *)a5;
+ (CGImage)newImageWithContentsOfURL:(id)a3 error:(id *)a4;
- (BOOL)isProxyOnly;
- (BOOL)loadContentsFromDictionary:(id)a3 proxyPath:(id *)a4 imagePath:(id *)a5 adjustmentPath:(id *)a6 error:(id *)a7;
- (BOOL)loadFromArchiveURL:(id)a3 error:(id *)a4;
- (BOOL)saveToArchiveURL:(id)a3 error:(id *)a4;
- (CGImage)proxyImage;
- (NSData)adjustmentData;
- (NSString)adjustmentFormat;
- (NSString)adjustmentVersion;
- (NSString)fileType;
- (NSURL)archiveURL;
- (NSURL)imageFileURL;
- (NSURL)videoFileURL;
- (PFParallaxAssetResource)init;
- (id)contentsDictionary;
- (int64_t)type;
- (unsigned)orientation;
- (void)dealloc;
- (void)setAdjustmentData:(id)a3;
- (void)setAdjustmentFormat:(id)a3;
- (void)setAdjustmentVersion:(id)a3;
- (void)setFileType:(id)a3;
- (void)setImageFileURL:(id)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setProxyImage:(CGImage *)a3;
- (void)setType:(int64_t)a3;
- (void)setVideoFileURL:(id)a3;
@end

@implementation PFParallaxAssetResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_adjustmentFormat, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_storeStrong((id *)&self->_fileType, 0);

  objc_storeStrong((id *)&self->_imageFileURL, 0);
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)setAdjustmentData:(id)a3
{
}

- (NSData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentVersion:(id)a3
{
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentFormat:(id)a3
{
}

- (NSString)adjustmentFormat
{
  return self->_adjustmentFormat;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setVideoFileURL:(id)a3
{
}

- (NSURL)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setFileType:(id)a3
{
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setImageFileURL:(id)a3
{
}

- (NSURL)imageFileURL
{
  return self->_imageFileURL;
}

- (void)setProxyImage:(CGImage *)a3
{
}

- (CGImage)proxyImage
{
  return self->_proxyImage;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)loadContentsFromDictionary:(id)a3 proxyPath:(id *)a4 imagePath:(id *)a5 adjustmentPath:(id *)a6 error:(id *)a7
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if (!v17)
  {
    _PFAssertFailHandler();
    goto LABEL_100;
  }
  v7 = v17;
  v18 = [v17 objectForKeyedSubscript:@"version"];
  v8 = v18;
  if (v18)
  {
    if ([v18 isEqual:&unk_1EF7CA3E8])
    {
      v9 = [v7 objectForKeyedSubscript:@"type"];
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v9;
          if ([v19 isEqualToString:@"Adjusted"])
          {
            v20 = &unk_1EF7CA400;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"AdjustedProxy"])
          {
            v20 = &unk_1EF7CA418;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"Original"])
          {
            v20 = &unk_1EF7CA430;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"OriginalProxy"])
          {
            v20 = &unk_1EF7CA448;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"EditingInput"])
          {
            v20 = &unk_1EF7CA460;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"LegacyMigration"])
          {
            v20 = &unk_1EF7CA478;
            goto LABEL_33;
          }
          if ([v19 isEqualToString:@"LivePhotoOriginal"])
          {
            v20 = &unk_1EF7CA490;
LABEL_33:

            -[PFParallaxAssetResource setType:](self, "setType:", [v20 integerValue]);
            v10 = [v7 objectForKeyedSubscript:@"proxyImage"];
            if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (a4) {
                *a4 = v10;
              }
              a4 = [v7 objectForKeyedSubscript:@"imageFile"];
              if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (a5) {
                  *a5 = a4;
                }
                if (a4)
                {
                  v30 = [v7 objectForKeyedSubscript:@"fileType"];
                  if (!v30)
                  {
                    if (a7)
                    {
                      v44 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v88 = *MEMORY[0x1E4F28228];
                      v32 = [NSString stringWithFormat:@"Missing file type"];
                      v89 = v32;
                      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
                      id v34 = [v44 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v33];
                      a5 = 0;
                      goto LABEL_59;
                    }
                    a5 = 0;
                    goto LABEL_79;
                  }
                  a5 = v30;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a7)
                    {
                      v31 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v86 = *MEMORY[0x1E4F28228];
                      v32 = [NSString stringWithFormat:@"Invalid file type: '%@'", a5];
                      v87 = v32;
                      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                      id v34 = [v31 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v33];
LABEL_59:
                      BOOL v25 = 0;
                      *a7 = v34;
LABEL_66:

                      goto LABEL_82;
                    }
LABEL_79:
                    BOOL v25 = 0;
                    goto LABEL_83;
                  }
                }
                else
                {
                  a5 = 0;
                }
                [(PFParallaxAssetResource *)self setFileType:a5];
                uint64_t v37 = [v7 objectForKeyedSubscript:@"orientation"];
                if (!v37)
                {
                  if (a7)
                  {
                    v45 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v84 = *MEMORY[0x1E4F28228];
                    v33 = [NSString stringWithFormat:@"Missing orientation value"];
                    v85 = v33;
                    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
                    *a7 = [v45 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v46];

                    v32 = 0;
LABEL_65:
                    BOOL v25 = 0;
                    goto LABEL_66;
                  }
                  v32 = 0;
                  goto LABEL_81;
                }
                v32 = (void *)v37;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a7)
                  {
                    v39 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v82 = *MEMORY[0x1E4F28228];
                    [NSString stringWithFormat:@"Invalid orientation value: '%@'", v32];
                    uint64_t v40 = v69 = v32;
                    uint64_t v83 = v40;
                    v41 = (void *)MEMORY[0x1E4F1C9E8];
                    v42 = &v83;
                    v43 = &v82;
                    goto LABEL_64;
                  }
LABEL_81:
                  BOOL v25 = 0;
                  goto LABEL_82;
                }
                uint64_t v38 = [v32 intValue];
                if ((v38 - 9) <= 0xFFFFFFF7)
                {
                  if (a7)
                  {
                    v39 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v80 = *MEMORY[0x1E4F28228];
                    [NSString stringWithFormat:@"Invalid orientation value: '%@'", v32];
                    uint64_t v40 = v69 = v32;
                    uint64_t v81 = v40;
                    v41 = (void *)MEMORY[0x1E4F1C9E8];
                    v42 = &v81;
                    v43 = &v80;
LABEL_64:
                    v47 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
                    *a7 = [v39 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v47];

                    v33 = (void *)v40;
                    v32 = v69;
                    goto LABEL_65;
                  }
                  goto LABEL_81;
                }
                v68 = v32;
                [(PFParallaxAssetResource *)self setOrientation:v38];
                v11 = [v7 objectForKeyedSubscript:@"adjustmentData"];
                if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (a6) {
                    *a6 = v11;
                  }
                  v66 = v11;
                  if (v11)
                  {
                    v48 = [v7 objectForKeyedSubscript:@"adjustmentFormat"];
                    if (v48)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v64 = v48;
                        [(PFParallaxAssetResource *)self setAdjustmentFormat:v48];
                        v49 = [v7 objectForKeyedSubscript:@"adjustmentVersion"];
                        v32 = v68;
                        if (v49)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [(PFParallaxAssetResource *)self setAdjustmentVersion:v49];

                            BOOL v25 = 1;
LABEL_110:
                            v33 = v66;
                            goto LABEL_66;
                          }
                          if (!a7) {
                            goto LABEL_108;
                          }
                          v61 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v70 = *MEMORY[0x1E4F28228];
                          v63 = [NSString stringWithFormat:@"Invalid adjustment version: '%@'", v49];
                          v71 = v63;
                          v57 = (void *)MEMORY[0x1E4F1C9E8];
                          v58 = &v71;
                          v59 = &v70;
                        }
                        else
                        {
                          if (!a7)
                          {
LABEL_108:

                            goto LABEL_109;
                          }
                          v61 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v72 = *MEMORY[0x1E4F28228];
                          v63 = [NSString stringWithFormat:@"Missing adjustment version"];
                          v73 = v63;
                          v57 = (void *)MEMORY[0x1E4F1C9E8];
                          v58 = &v73;
                          v59 = &v72;
                        }
                        v60 = [v57 dictionaryWithObjects:v58 forKeys:v59 count:1];
                        *a7 = [v61 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v60];

                        goto LABEL_108;
                      }
                      v32 = v68;
                      if (a7)
                      {
                        v62 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v74 = *MEMORY[0x1E4F28228];
                        v65 = [NSString stringWithFormat:@"Invalid adjustment format: '%@'", v48];
                        v75 = v65;
                        v53 = (void *)MEMORY[0x1E4F1C9E8];
                        v54 = &v75;
                        v55 = &v74;
                        goto LABEL_97;
                      }
                    }
                    else
                    {
                      v32 = v68;
                      if (a7)
                      {
                        v62 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v76 = *MEMORY[0x1E4F28228];
                        v65 = [NSString stringWithFormat:@"Missing adjustment format"];
                        v77 = v65;
                        v53 = (void *)MEMORY[0x1E4F1C9E8];
                        v54 = &v77;
                        v55 = &v76;
LABEL_97:
                        v56 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:1];
                        *a7 = [v62 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v56];
                      }
                    }

LABEL_109:
                    BOOL v25 = 0;
                    goto LABEL_110;
                  }
                  v33 = 0;
                  BOOL v25 = 1;
LABEL_101:
                  v32 = v68;
                  goto LABEL_66;
                }
                if (a7)
                {
                  v67 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v78 = *MEMORY[0x1E4F28228];
                  v51 = [NSString stringWithFormat:@"Invalid adjustment data path: '%@'", v11];
                  v79 = v51;
                  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
                  *a7 = [v67 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v52];

                  v33 = v11;
                  BOOL v25 = 0;
                  goto LABEL_101;
                }
LABEL_100:
                BOOL v25 = 0;
                v33 = v11;
                goto LABEL_101;
              }
              if (a7)
              {
                v36 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v90 = *MEMORY[0x1E4F28228];
                a5 = [NSString stringWithFormat:@"Invalid image path: '%@'", a4];
                v91 = a5;
                v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
                [v36 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v32];
                BOOL v25 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

                goto LABEL_83;
              }
              BOOL v25 = 0;
LABEL_84:

              goto LABEL_85;
            }
            if (a7)
            {
              v35 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v92 = *MEMORY[0x1E4F28228];
              a4 = [NSString stringWithFormat:@"Invalid proxy image path: '%@'", v10];
              v93 = a4;
              a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
              [v35 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:a5];
              BOOL v25 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_83:

              goto LABEL_84;
            }
            BOOL v25 = 0;
            v9 = v19;
LABEL_85:

            goto LABEL_86;
          }

          if (!a7)
          {
            BOOL v25 = 0;
            v9 = v19;
            goto LABEL_86;
          }
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v94 = *MEMORY[0x1E4F28228];
          v10 = [NSString stringWithFormat:@"Invalid type: '%@'", v19];
          v95 = v10;
          v27 = (void *)MEMORY[0x1E4F1C9E8];
          v28 = &v95;
          v29 = &v94;
LABEL_18:
          a4 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
          [v26 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:a4];
          BOOL v25 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_84;
        }
        if (a7)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v96 = *MEMORY[0x1E4F28228];
          v10 = [NSString stringWithFormat:@"Invalid type: '%@'", v9];
          v97 = v10;
          v27 = (void *)MEMORY[0x1E4F1C9E8];
          v28 = &v97;
          v29 = &v96;
          goto LABEL_18;
        }
      }
      else
      {
        if (a7)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v98 = *MEMORY[0x1E4F28228];
          v10 = [NSString stringWithFormat:@"Missing type info"];
          v99 = v10;
          v27 = (void *)MEMORY[0x1E4F1C9E8];
          v28 = &v99;
          v29 = &v98;
          goto LABEL_18;
        }
        v9 = 0;
      }
      BOOL v25 = 0;
LABEL_86:

      goto LABEL_87;
    }
    if (a7)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v100 = *MEMORY[0x1E4F28228];
      v9 = [NSString stringWithFormat:@"Unsupported version: '%@'", v8];
      v101 = v9;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = &v101;
      v24 = &v100;
      goto LABEL_12;
    }
  }
  else if (a7)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v102 = *MEMORY[0x1E4F28228];
    v9 = [NSString stringWithFormat:@"Missing version info"];
    v103[0] = v9;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = (void **)v103;
    v24 = &v102;
LABEL_12:
    v10 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    [v21 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v10];
    BOOL v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  BOOL v25 = 0;
LABEL_87:

  return v25;
}

- (id)contentsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:&unk_1EF7CA3E8 forKeyedSubscript:@"version"];
  unint64_t v4 = [(PFParallaxAssetResource *)self type];
  if (v4 > 6) {
    v5 = @"???";
  }
  else {
    v5 = off_1E5B2D100[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  if ([(PFParallaxAssetResource *)self proxyImage]) {
    [v3 setObject:@"proxy.heic" forKeyedSubscript:@"proxyImage"];
  }
  v6 = [(PFParallaxAssetResource *)self imageFileURL];

  if (v6)
  {
    v7 = [(PFParallaxAssetResource *)self imageFileURL];
    v8 = [v7 pathExtension];

    unint64_t v9 = [(PFParallaxAssetResource *)self type];
    if (v9 > 6) {
      v10 = @"???";
    }
    else {
      v10 = off_1E5B2D100[v9];
    }
    v11 = [(__CFString *)v10 stringByAppendingPathExtension:v8];
    [v3 setObject:v11 forKeyedSubscript:@"imageFile"];
  }
  v12 = [(PFParallaxAssetResource *)self fileType];
  [v3 setObject:v12 forKeyedSubscript:@"fileType"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFParallaxAssetResource orientation](self, "orientation"));
  [v3 setObject:v13 forKeyedSubscript:@"orientation"];

  v14 = [(PFParallaxAssetResource *)self adjustmentFormat];
  [v3 setObject:v14 forKeyedSubscript:@"adjustmentFormat"];

  v15 = [(PFParallaxAssetResource *)self adjustmentVersion];
  [v3 setObject:v15 forKeyedSubscript:@"adjustmentVersion"];

  v16 = [(PFParallaxAssetResource *)self adjustmentData];

  if (v16) {
    [v3 setObject:@"adjustment.data" forKeyedSubscript:@"adjustmentData"];
  }

  return v3;
}

- (BOOL)loadFromArchiveURL:(id)a3 error:(id *)a4
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    _PFAssertFailHandler();
  }
  v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  unint64_t v9 = [v7 URLByAppendingPathComponent:@"contents.plist"];
  id v96 = 0;
  v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:1 error:&v96];
  id v11 = v96;
  if (v10)
  {
    id v95 = 0;
    v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:&v95];
    id v13 = v95;

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v83 = v8;
        uint64_t v84 = v9;
        id v93 = 0;
        id v94 = 0;
        id v91 = v13;
        id v92 = 0;
        BOOL v14 = [(PFParallaxAssetResource *)self loadContentsFromDictionary:v12 proxyPath:&v94 imagePath:&v93 adjustmentPath:&v92 error:&v91];
        id v15 = v94;
        id v82 = v93;
        id v81 = v92;
        id v11 = v91;

        if (v14)
        {
          id v80 = v15;
          if (v15)
          {
            v16 = [v7 URLByAppendingPathComponent:v15];
            id v90 = v11;
            id v17 = (const void *)[(id)objc_opt_class() newImageWithContentsOfURL:v16 error:&v90];
            id v18 = v90;

            if (!v17)
            {
              id v47 = v18;
              unint64_t v9 = v84;
              if (a4)
              {
                v48 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v107 = *MEMORY[0x1E4F28228];
                [NSString stringWithFormat:@"Failed to load proxy image from file: '%@', error: %@", v16, v47];
                v50 = v49 = v16;
                v108 = v50;
                v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
                *a4 = [v48 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v51];

                archiveURL = v49;
                BOOL v27 = 0;
                id v11 = v47;
              }
              else
              {
                BOOL v27 = 0;
                id v11 = v47;
                archiveURL = v16;
              }
              id v19 = v82;
              id v8 = v83;
              v26 = v80;
              goto LABEL_66;
            }
            [(PFParallaxAssetResource *)self setProxyImage:v17];
            CFRelease(v17);

            id v11 = v18;
LABEL_9:
            id v8 = v83;
            unint64_t v9 = v84;
            id v19 = v82;
            if (v82)
            {
              v20 = [v7 URLByAppendingPathComponent:v82];
              v21 = [(NSURL *)v20 path];
              char v85 = [v83 isReadableFileAtPath:v21];

              if ((v85 & 1) == 0)
              {
                archiveURL = v20;
                v26 = v80;
                if (a4)
                {
                  v87 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v103 = *MEMORY[0x1E4F28228];
                  v54 = NSString;
                  v79 = v20;
                  v55 = [(NSURL *)v20 path];
                  v56 = [v54 stringWithFormat:@"Cannot read image file '%@'", v55];
                  v104 = v56;
                  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
                  *a4 = [v87 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v57];

                  archiveURL = v79;
                }
                goto LABEL_65;
              }
              [(PFParallaxAssetResource *)self setImageFileURL:v20];

              id v19 = v82;
              id v8 = v83;
            }
            else if ([(PFParallaxAssetResource *)self type] == 2 {
                   || ![(PFParallaxAssetResource *)self type])
            }
            {
              if (a4)
              {
                v58 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v101 = *MEMORY[0x1E4F28228];
                v59 = NSString;
                unint64_t v60 = [(PFParallaxAssetResource *)self type];
                v26 = v80;
                uint64_t v88 = v58;
                if (v60 > 6) {
                  v61 = @"???";
                }
                else {
                  v61 = off_1E5B2D100[v60];
                }
                uint64_t v62 = [v59 stringWithFormat:@"Expected image file for type '%@'", v61];
                uint64_t v102 = v62;
                v73 = (void *)MEMORY[0x1E4F1C9E8];
                uint64_t v74 = &v102;
                v75 = &v101;
                goto LABEL_63;
              }
              BOOL v27 = 0;
              v26 = v80;
LABEL_67:

              goto LABEL_68;
            }
            if (v81)
            {
              objc_msgSend(v7, "URLByAppendingPathComponent:");
              uint64_t v78 = (NSURL *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:");
              id v53 = v11;

              if (v52)
              {
                [(PFParallaxAssetResource *)self setAdjustmentData:v52];

                id v11 = v53;
                v26 = v80;
                id v19 = v82;
LABEL_53:
                v68 = v7;
                archiveURL = self->_archiveURL;
                self->_archiveURL = v68;
                BOOL v27 = 1;
                goto LABEL_66;
              }
              id v11 = v53;
              archiveURL = v78;
              v26 = v80;
              if (a4)
              {
                v89 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v99 = *MEMORY[0x1E4F28228];
                v69 = NSString;
                uint64_t v70 = [(NSURL *)v78 path];
                v71 = [v69 stringWithFormat:@"Failed to read adjustment data from file: \"%@\", error: %@", v70, v11];
                uint64_t v100 = v71;
                uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                *a4 = [v89 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v72];

                id v8 = v83;
                archiveURL = v78;
              }
              BOOL v27 = 0;
LABEL_22:
              id v19 = v82;
LABEL_66:

              goto LABEL_67;
            }
            v26 = v80;
            if ([(PFParallaxAssetResource *)self type] != 4) {
              goto LABEL_53;
            }
            if (a4)
            {
              uint64_t v88 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v97 = *MEMORY[0x1E4F28228];
              v65 = NSString;
              unint64_t v66 = [(PFParallaxAssetResource *)self type];
              if (v66 > 6) {
                v67 = @"???";
              }
              else {
                v67 = off_1E5B2D100[v66];
              }
              uint64_t v62 = [v65 stringWithFormat:@"Expected adjustment data for type '%@'", v67];
              uint64_t v98 = v62;
              v73 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v74 = &v98;
              v75 = &v97;
LABEL_63:
              v63 = [v73 dictionaryWithObjects:v74 forKeys:v75 count:1];
              v64 = v88;
LABEL_64:
              *a4 = [v64 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v63];

              archiveURL = (NSURL *)v62;
LABEL_65:
              BOOL v27 = 0;
              id v19 = v82;
              id v8 = v83;
              goto LABEL_66;
            }
            BOOL v27 = 0;
            goto LABEL_67;
          }
          if ([(PFParallaxAssetResource *)self type] != 3 && [(PFParallaxAssetResource *)self type] != 1) {
            goto LABEL_9;
          }
          id v8 = v83;
          unint64_t v9 = v84;
          if (a4)
          {
            v77 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v105 = *MEMORY[0x1E4F28228];
            v44 = NSString;
            unint64_t v45 = [(PFParallaxAssetResource *)self type];
            v26 = 0;
            if (v45 > 6) {
              v46 = @"???";
            }
            else {
              v46 = off_1E5B2D100[v45];
            }
            uint64_t v62 = [v44 stringWithFormat:@"Expected proxy image for type '%@'", v46];
            uint64_t v106 = v62;
            v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
            v64 = v77;
            goto LABEL_64;
          }
          BOOL v27 = 0;
          v26 = 0;
        }
        else
        {
          v26 = v15;
          if (a4)
          {
            uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v109 = *MEMORY[0x1E4F28228];
            uint64_t v41 = [NSString stringWithFormat:@"Failed to load contents dictionary: \"%@\", error: %@", v12, v11];
            uint64_t v110 = v41;
            v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            *a4 = [v40 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v42];

            archiveURL = (NSURL *)v41;
            BOOL v27 = 0;
            id v8 = v83;
            unint64_t v9 = v84;
            goto LABEL_22;
          }
          BOOL v27 = 0;
          id v8 = v83;
          unint64_t v9 = v84;
        }
        id v19 = v82;
        goto LABEL_67;
      }
      if (a4)
      {
        id v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v111 = *MEMORY[0x1E4F28228];
        [NSString stringWithFormat:@"Expected contents dictionary but got '%@'", v12];
        uint64_t v86 = v9;
        v35 = v12;
        v36 = v7;
        v38 = uint64_t v37 = v10;
        uint64_t v112 = v38;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        uint64_t v33 = v39 = a4;
        [v34 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v33];
        BOOL v27 = 0;
        id *v39 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v38;
        v10 = v37;
        v7 = v36;
        v12 = v35;
        unint64_t v9 = v86;
        goto LABEL_18;
      }
    }
    else
    {
      if (a4)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v113 = *MEMORY[0x1E4F28228];
        [NSString stringWithFormat:@"Failed to deserialize contents plist from data: \"%@\", error: %@", v10, v13];
        v29 = v7;
        uint64_t v31 = v30 = v10;
        uint64_t v114 = v31;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        uint64_t v33 = v32 = a4;
        [v28 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v33];
        BOOL v27 = 0;
        id *v32 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v31;
        v10 = v30;
        v7 = v29;
        v12 = 0;
LABEL_18:
        id v11 = v13;
        id v19 = (void *)v33;
        goto LABEL_68;
      }
      v12 = 0;
    }
    BOOL v27 = 0;
LABEL_69:

    id v11 = v13;
    goto LABEL_70;
  }
  if (a4)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v115 = *MEMORY[0x1E4F28228];
    id v23 = v8;
    v24 = NSString;
    v12 = [v9 path];
    BOOL v25 = v24;
    id v8 = v23;
    v26 = [v25 stringWithFormat:@"Failed to read contents plist data from file: \"%@\", error: %@", v12, v11];
    v116[0] = v26;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
    [v22 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v19];
    BOOL v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

    id v13 = v11;
    goto LABEL_69;
  }
  BOOL v27 = 0;
LABEL_70:

  return v27;
}

- (BOOL)saveToArchiveURL:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    _PFAssertFailHandler();
  }
  v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v60 = 0;
  char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:0 attributes:0 error:&v60];
  id v10 = v60;
  if (v9)
  {
    id v11 = [(PFParallaxAssetResource *)self contentsDictionary];
    id v59 = 0;
    v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:&v59];
    id v13 = v59;

    if (!v12)
    {
      if (!a4)
      {
        v12 = 0;
        BOOL v21 = 0;
        id v10 = v13;
LABEL_38:

        goto LABEL_39;
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28228];
      BOOL v14 = [NSString stringWithFormat:@"Failed to serialize contents plist: \"%@\", error: %@", v11, v13];
      uint64_t v70 = v14;
      archiveURL = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      [v22 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:archiveURL];
      BOOL v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    BOOL v14 = [v7 URLByAppendingPathComponent:@"contents.plist"];
    id v58 = v13;
    char v15 = [v12 writeToURL:v14 options:2 error:&v58];
    id v10 = v58;

    if (v15)
    {
      v54 = v14;
      if ([(PFParallaxAssetResource *)self proxyImage])
      {
        v16 = [v11 objectForKeyedSubscript:@"proxyImage"];
        id v17 = [v7 URLByAppendingPathComponent:v16];

        id v57 = v10;
        char v18 = objc_msgSend((id)objc_opt_class(), "saveImage:toURL:error:", -[PFParallaxAssetResource proxyImage](self, "proxyImage"), v17, &v57);
        id v13 = v57;

        if ((v18 & 1) == 0)
        {
          if (a4)
          {
            id v53 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v65 = *MEMORY[0x1E4F28228];
            uint64_t v37 = NSString;
            uint64_t v38 = [v17 path];
            v39 = [v37 stringWithFormat:@"Failed to write proxy image file: \"%@\", error: %@", v38, v13];
            unint64_t v66 = v39;
            uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
            uint64_t v41 = v53;
LABEL_31:
            *a4 = [v41 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v40];

            archiveURL = v17;
            BOOL v21 = 0;
LABEL_35:
            BOOL v14 = v54;
            goto LABEL_36;
          }
          goto LABEL_32;
        }

        BOOL v14 = v54;
      }
      else
      {
        id v13 = v10;
      }
      v26 = [(PFParallaxAssetResource *)self imageFileURL];

      if (v26)
      {
        BOOL v27 = [v11 objectForKeyedSubscript:@"imageFile"];
        id v17 = [v7 URLByAppendingPathComponent:v27];

        v28 = [(PFParallaxAssetResource *)self imageFileURL];
        id v56 = v13;
        char v29 = [v8 copyItemAtURL:v28 toURL:v17 error:&v56];
        id v51 = v56;

        if ((v29 & 1) == 0)
        {
          if (a4)
          {
            v42 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v63 = *MEMORY[0x1E4F28228];
            v43 = NSString;
            v44 = [(PFParallaxAssetResource *)self imageFileURL];
            unint64_t v45 = [v43 stringWithFormat:@"Failed to copy image file from \"%@\" to \"%@\", error: %@", v44, v17, v51];
            v64 = v45;
            v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
            id v47 = v42;
            archiveURL = v17;
            *a4 = [v47 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v46];

            BOOL v21 = 0;
            id v13 = v51;
            BOOL v14 = v54;
            goto LABEL_36;
          }
          BOOL v21 = 0;
          id v13 = v51;
          goto LABEL_34;
        }

        id v13 = v51;
        BOOL v14 = v54;
      }
      v30 = [(PFParallaxAssetResource *)self adjustmentData];

      if (!v30)
      {
LABEL_23:
        v36 = v7;
        archiveURL = self->_archiveURL;
        self->_archiveURL = v36;
        BOOL v21 = 1;
        goto LABEL_36;
      }
      uint64_t v31 = [v11 objectForKeyedSubscript:@"adjustmentData"];
      uint64_t v32 = [v7 URLByAppendingPathComponent:v31];

      uint64_t v33 = [(PFParallaxAssetResource *)self adjustmentData];
      id v55 = v13;
      v52 = (void *)v32;
      LOBYTE(v32) = [v33 writeToURL:v32 options:2 error:&v55];
      id v34 = v55;
      v35 = v13;
      id v13 = v34;

      if (v32)
      {

        goto LABEL_23;
      }
      id v17 = v52;
      if (a4)
      {
        v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v61 = *MEMORY[0x1E4F28228];
        v48 = NSString;
        uint64_t v38 = [v52 path];
        v39 = [v48 stringWithFormat:@"Failed to write adjustment data file: \"%@\", error: %@", v38, v13];
        uint64_t v62 = v39;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        uint64_t v41 = v50;
        goto LABEL_31;
      }
LABEL_32:
      BOOL v21 = 0;
LABEL_34:
      archiveURL = v17;
      goto LABEL_35;
    }
    if (a4)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v67 = *MEMORY[0x1E4F28228];
      archiveURL = [NSString stringWithFormat:@"Failed to archive contents plist: \"%@\", error: %@", v12, v10];
      v68 = archiveURL;
      BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      *a4 = [v24 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v25];

      BOOL v21 = 0;
      id v13 = v10;
LABEL_36:

      id v10 = v13;
      goto LABEL_37;
    }
    BOOL v21 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if (a4)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v71 = *MEMORY[0x1E4F28228];
    v20 = NSString;
    id v11 = [v7 path];
    v12 = [v20 stringWithFormat:@"Failed to create archive directory: \"%@\", error: %@", v11, v10];
    v72[0] = v12;
    BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    [v19 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v14];
    BOOL v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  BOOL v21 = 0;
LABEL_39:

  return v21;
}

- (BOOL)isProxyOnly
{
  return (([(PFParallaxAssetResource *)self type] - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)dealloc
{
  CGImageRelease(self->_proxyImage);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxAssetResource;
  [(PFParallaxAssetResource *)&v3 dealloc];
}

- (PFParallaxAssetResource)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxAssetResource;
  result = [(PFParallaxAssetResource *)&v3 init];
  result->_orientation = 1;
  return result;
}

+ (CGImage)newImageWithContentsOfURL:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v5 = (const __CFURL *)a3;
  if (!v5) {
    _PFAssertFailHandler();
  }
  CFURLRef v6 = v5;
  v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    if (!a4)
    {
LABEL_9:
      ImageAtIndex = 0;
      goto LABEL_10;
    }
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    id v11 = [NSString stringWithFormat:@"%@", @"Failed to create image source"];
    v20[0] = v11;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = (void **)v20;
    BOOL v14 = &v19;
LABEL_8:
    char v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v15];

    goto LABEL_9;
  }
  id v8 = v7;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v8);
  if (a4 && !ImageAtIndex)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [NSString stringWithFormat:@"%@", @"Failed to load image", *MEMORY[0x1E4F28228]];
    char v18 = v11;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = &v18;
    BOOL v14 = &v17;
    goto LABEL_8;
  }
LABEL_10:

  return ImageAtIndex;
}

+ (BOOL)saveImage:(CGImage *)a3 toURL:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a4;
  if (!a3)
  {
    _PFAssertFailHandler();
LABEL_13:
    _PFAssertFailHandler();
  }
  CFURLRef v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  char v9 = [(id)*MEMORY[0x1E4F443E0] identifier];
  id v10 = CGImageDestinationCreateWithURL(v8, v9, 1uLL, 0);
  if (!v10)
  {
    if (!a5)
    {
LABEL_10:
      BOOL v12 = 0;
      goto LABEL_11;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    BOOL v14 = [NSString stringWithFormat:@"%@", @"Failed to create image destination"];
    v23[0] = v14;
    char v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (void **)v23;
    uint64_t v17 = &v22;
LABEL_9:
    char v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v18];

    goto LABEL_10;
  }
  id v11 = v10;
  CGImageDestinationAddImage(v10, a3, 0);
  BOOL v12 = CGImageDestinationFinalize(v11);
  CFRelease(v11);
  if (a5 && !v12)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    BOOL v14 = [NSString stringWithFormat:@"%@", @"Failed to finalize image destination", *MEMORY[0x1E4F28228]];
    BOOL v21 = v14;
    char v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v21;
    uint64_t v17 = &v20;
    goto LABEL_9;
  }
LABEL_11:

  return v12;
}

@end