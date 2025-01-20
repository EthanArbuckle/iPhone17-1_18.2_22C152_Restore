@interface PersonalizedImage
- (BOOL)initializeDeviceAttributes:(id *)a3;
- (BOOL)initializeImageProperties:(id *)a3;
- (BOOL)mountImage:(id *)a3;
- (BOOL)mountImage:(id)a3 serverTicket:(id)a4 imageDigest:(id)a5 trustCacheURL:(id)a6 error:(id *)a7;
- (BOOL)skipLoadingLaunchDaemons;
- (BOOL)useCredentials;
- (NSData)apNonce;
- (NSData)sepNonce;
- (NSDictionary)mountedVolumeEntry;
- (NSNumber)boardID;
- (NSNumber)certificateProductionStatus;
- (NSNumber)certificateSecurityMode;
- (NSNumber)chipID;
- (NSNumber)ecid;
- (NSNumber)effectiveProductionStatus;
- (NSNumber)effectiveSecurityMode;
- (NSNumber)image4Supported;
- (NSNumber)securityDomain;
- (NSNumber)sikaFuse;
- (NSString)deviceClass;
- (NSString)hardwareModel;
- (NSString)imageType;
- (NSString)imageVariant;
- (NSURL)bundlePathURL;
- (NSURL)imagePathURL;
- (NSURL)signingServerURL;
- (NSURL)trustCacheURL;
- (NSURL)userProvidedBundleMountPathURL;
- (NSURL)userProvidedImagePathURL;
- (OS_remote_device)remoteDevice;
- (PersonalizedImage)initWithBundleURL:(id)a3 imageVariant:(id)a4 remoteDevice:(id)a5 options:(id)a6;
- (id)digestFile:(id)a3 digestLength:(unsigned int)a4 error:(id *)a5;
- (id)digestFileSha1:(id)a3 error:(id *)a4;
- (id)digestFileSha384:(id)a3 error:(id *)a4;
- (unsigned)digestLength;
- (void)dealloc;
- (void)setApNonce:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setBundlePathURL:(id)a3;
- (void)setCertificateProductionStatus:(id)a3;
- (void)setCertificateSecurityMode:(id)a3;
- (void)setChipID:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDigestLength:(unsigned int)a3;
- (void)setEcid:(id)a3;
- (void)setEffectiveProductionStatus:(id)a3;
- (void)setEffectiveSecurityMode:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setImage4Supported:(id)a3;
- (void)setImagePathURL:(id)a3;
- (void)setImageType:(id)a3;
- (void)setImageVariant:(id)a3;
- (void)setMountedVolumeEntry:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSepNonce:(id)a3;
- (void)setSigningServerURL:(id)a3;
- (void)setSikaFuse:(id)a3;
- (void)setSkipLoadingLaunchDaemons:(BOOL)a3;
- (void)setTrustCacheURL:(id)a3;
- (void)setUseCredentials:(BOOL)a3;
- (void)setUserProvidedBundleMountPathURL:(id)a3;
- (void)setUserProvidedImagePathURL:(id)a3;
@end

@implementation PersonalizedImage

- (PersonalizedImage)initWithBundleURL:(id)a3 imageVariant:(id)a4 remoteDevice:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
LABEL_26:
    v41 = 0;
    goto LABEL_27;
  }
  v45.receiver = self;
  v45.super_class = (Class)PersonalizedImage;
  self = [(PersonalizedImage *)&v45 init];
  if (self)
  {
    v14 = (NSURL *)[v10 copy];
    bundlePathURL = self->_bundlePathURL;
    self->_bundlePathURL = v14;

    v16 = (NSString *)[v11 copy];
    imageVariant = self->_imageVariant;
    self->_imageVariant = v16;

    objc_storeStrong((id *)&self->_remoteDevice, a5);
    self->_digestLength = 48;
    self->_useCredentials = 1;
    v18 = (NSURL *)[objc_alloc(NSURL) initWithString:@"https://gs.apple.com:443"];
    signingServerURL = self->_signingServerURL;
    self->_signingServerURL = v18;

    objc_storeStrong((id *)&self->_imageType, @"Personalized");
    if (v13)
    {
      v20 = [v13 objectForKeyedSubscript:@"UseCredentials"];
      v21 = v20;
      if (v20)
      {
        v22 = isNSNumber(v20);

        if (v22) {
          self->_useCredentials = [v21 BOOLValue];
        }
      }
      v23 = [v13 objectForKeyedSubscript:@"SigningServerURL"];
      v24 = v23;
      if (v23)
      {
        v25 = isNSURL(v23);

        if (v25)
        {
          v26 = (NSURL *)[v24 copy];
          v27 = self->_signingServerURL;
          self->_signingServerURL = v26;
        }
      }
      v43 = v21;
      v28 = [v13 objectForKeyedSubscript:@"MountedBundlePath"];
      v29 = v28;
      if (v28)
      {
        v30 = isNSURL(v28);

        if (v30)
        {
          v31 = (NSURL *)[v29 copy];
          userProvidedBundleMountPathURL = self->_userProvidedBundleMountPathURL;
          self->_userProvidedBundleMountPathURL = v31;
        }
      }
      v33 = [v13 objectForKeyedSubscript:@"ImagePath"];
      v34 = v33;
      if (v33)
      {
        v35 = isNSURL(v33);

        if (v35)
        {
          v36 = (NSURL *)[v34 copy];
          userProvidedImagePathURL = self->_userProvidedImagePathURL;
          self->_userProvidedImagePathURL = v36;
        }
      }
      v38 = [v13 objectForKeyedSubscript:@"UseCryptexFlow"];
      v39 = v38;
      if (v38)
      {
        v40 = isNSNumber(v38);

        if (v40) {
          objc_storeStrong((id *)&self->_imageType, @"Cryptex");
        }
      }
    }
    if (!v10 && !self->_userProvidedBundleMountPathURL && !self->_userProvidedImagePathURL)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
      }
      goto LABEL_26;
    }
  }
  self = self;
  v41 = self;
LABEL_27:

  return v41;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PersonalizedImage;
  [(PersonalizedImage *)&v2 dealloc];
}

- (id)digestFileSha1:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 377, -2, 0, @"Invalid inputs.", v6, v7, v8, v26);
    id v12 = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_11;
  }
  id v10 = (void *)MEMORY[0x263F08840];
  id v11 = [v5 path];
  id v12 = [v10 fileHandleForReadingAtPath:v11];

  if (!v12)
  {
    v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 383, -2, 0, @"Failed to create file handle for %@.", v13, v14, v15, (uint64_t)v9);
    goto LABEL_9;
  }
  CC_SHA1_Init(&c);
  v19 = (unsigned __int8 *)malloc_type_malloc(0x14uLL, 0xE4C08B99uLL);
  if (v19)
  {
    do
    {
      v20 = (void *)MEMORY[0x223C0FE00]();
      id v21 = [v12 readDataOfLength:1024];
      CC_SHA1_Update(&c, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
      uint64_t v22 = [v21 length];
    }
    while (v22);
    CC_SHA1_Final(v19, &c);
    v23 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v19 length:20];
    v24 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 391, -2, 0, @"Failed to allocate digest memory.", v16, v17, v18, v26);
LABEL_11:
  v23 = 0;
  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v23) {
    *a4 = v24;
  }
LABEL_14:
  if (v19) {
    free(v19);
  }

  return v23;
}

- (id)digestFileSha384:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 428, -2, 0, @"Invalid inputs.", v6, v7, v8, v27);
    id v12 = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_11;
  }
  id v10 = (void *)MEMORY[0x263F08840];
  id v11 = [v5 path];
  id v12 = [v10 fileHandleForReadingAtPath:v11];

  if (!v12)
  {
    v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 434, -2, 0, @"Failed to create file handle for %@.", v13, v14, v15, (uint64_t)v9);
    goto LABEL_9;
  }
  CC_SHA384_Init(&c);
  v19 = (unsigned __int8 *)malloc_type_malloc(0x30uLL, 0xDA45BE47uLL);
  if (v19)
  {
    do
    {
      v20 = (void *)MEMORY[0x223C0FE00]();
      id v21 = [v12 readDataOfLength:1024];
      CC_SHA384_Update(&c, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
      uint64_t v22 = [v21 length];
    }
    while (v22);
    CC_SHA384_Final(v19, &c);
    v23 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v19 length:48];
    v24 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 442, -2, 0, @"Failed to allocate digest memory.", v16, v17, v18, v27);
LABEL_11:
  v23 = 0;
  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v23) {
    *a4 = v24;
  }
LABEL_14:
  if (v19) {
    free(v19);
  }
  id v25 = v23;

  return v25;
}

- (id)digestFile:(id)a3 digestLength:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  if (v6 == 48)
  {
    uint64_t v12 = [(PersonalizedImage *)self digestFileSha384:v11 error:a5];
    goto LABEL_5;
  }
  if (v6 == 20)
  {
    uint64_t v12 = [(PersonalizedImage *)self digestFileSha1:v11 error:a5];
LABEL_5:
    uint64_t v13 = (void *)v12;
    goto LABEL_9;
  }
  if (a5)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFile:digestLength:error:]", 481, -3, 0, @"Unsupported digest length: %d", v8, v9, v10, v6);
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_9:

  return v13;
}

- (BOOL)initializeImageProperties:(id *)a3
{
  v4 = self;
  uint64_t v200 = *MEMORY[0x263EF8340];
  id v5 = [(PersonalizedImage *)self userProvidedImagePathURL];

  if (v5)
  {
    uint64_t v6 = [(PersonalizedImage *)v4 userProvidedImagePathURL];
    uint64_t v7 = [v6 path];

    if (v7)
    {
      uint64_t v8 = [NSURL fileURLWithPath:v7];
      [(PersonalizedImage *)v4 setImagePathURL:v8];

      v177 = 0;
      v178 = 0;
      v181 = 0;
      v182 = 0;
      v187 = 0;
      id v9 = 0;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v16 = [(PersonalizedImage *)v4 userProvidedBundleMountPathURL];

    if (v16)
    {
      uint64_t v17 = [(PersonalizedImage *)v4 userProvidedBundleMountPathURL];
      uint64_t v18 = [v17 path];
      uint64_t v19 = [v18 copy];

      v20 = (void *)v19;
      goto LABEL_19;
    }
    uint64_t v7 = [(PersonalizedImage *)v4 mountedVolumeEntry];

    if (!v7)
    {
      v153 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 532, -2, 0, @"Bundle mounting not support on this platform.", v50, v51, v52, v173);
      v181 = 0;
      v177 = 0;
      v178 = 0;
LABEL_96:
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      id v11 = 0;
      id v9 = 0;
      v182 = 0;
      if (!a3) {
        goto LABEL_114;
      }
      goto LABEL_109;
    }
  }
  v20 = 0;
LABEL_19:
  v53 = NSDictionary;
  v178 = v20;
  v54 = [v20 stringByAppendingPathComponent:@"Restore/BuildManifest.plist"];
  uint64_t v7 = [v53 dictionaryWithContentsOfFile:v54];

  if (!v7)
  {
    v153 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 544, -2, 0, @"Failed to load build manifest.", v55, v56, v57, v173);
    v181 = 0;
    v177 = 0;
    goto LABEL_96;
  }
  v182 = v7;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v58 = [v7 objectForKeyedSubscript:@"ManifestVersion"];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v58;
    _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Manifest Version: %@", buf, 0xCu);

    uint64_t v7 = v182;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v59 = [v7 objectForKeyedSubscript:@"ProductVersion"];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v59;
    _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Product Version: %@", buf, 0xCu);

    uint64_t v7 = v182;
  }
  v180 = v4;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v60 = [v7 objectForKeyedSubscript:@"ProductBuildVersion"];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v60;
    _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Product Build Version: %@", buf, 0xCu);

    uint64_t v7 = v182;
  }
  id v9 = [v7 objectForKeyedSubscript:@"BuildIdentities"];
  uint64_t v7 = isNSArray(v9);

  if (!v7)
  {
    v153 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 556, -2, 0, @"Missing key 'BuildIdentities'.", v61, v62, v63, v173);
    v181 = 0;
    v177 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    id v11 = 0;
    if (!a3) {
      goto LABEL_114;
    }
    goto LABEL_109;
  }
  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  id v9 = v9;
  uint64_t v186 = [v9 countByEnumeratingWithState:&v194 objects:v198 count:16];
  if (!v186)
  {

    v154 = 0;
    v177 = 0;
    v181 = 0;
LABEL_99:
    v156 = [(PersonalizedImage *)v180 imageVariant];
    uint64_t v155 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 678, -2, v154, @"Failed to find image for variant %@.", v157, v158, v159, (uint64_t)v156);

    uint64_t v13 = 0;
    uint64_t v12 = 0;
    id v11 = 0;
    uint64_t v7 = 0;
    goto LABEL_100;
  }
  v176 = a3;
  v177 = 0;
  v181 = 0;
  v187 = 0;
  v174 = 0;
  id v184 = v9;
  uint64_t v185 = *(void *)v195;
  do
  {
    uint64_t v64 = 0;
    do
    {
      if (*(void *)v195 != v185) {
        objc_enumerationMutation(v9);
      }
      v65 = *(void **)(*((void *)&v194 + 1) + 8 * v64);
      *(void *)buf = 0;
      v66 = [v65 objectForKeyedSubscript:@"ApBoardID"];
      v67 = isNSString(v66);

      if (!v67)
      {
        uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 577, -3, 0, @"Missing expected key 'ApBoardID'", v68, v69, v70, v173);
        v188 = 0;
        v189 = 0;
        v72 = 0;
        v191 = 0;
        goto LABEL_50;
      }
      v71 = [v65 objectForKeyedSubscript:@"ApChipID"];
      v72 = isNSString(v71);

      v191 = v71;
      if (!v72)
      {
        uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 583, -3, 0, @"Missing expected key 'ApChipID'", v73, v74, v75, v173);
        v188 = 0;
        v189 = 0;
        v67 = 0;
        goto LABEL_50;
      }
      v76 = [v65 objectForKeyedSubscript:@"ApSecurityDomain"];
      v77 = isNSString(v76);

      if (!v77)
      {
        v67 = v76;
        uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 589, -3, 0, @"Missing expected key 'ApSecurityDomain'", v78, v79, v80, v173);
        v188 = 0;
        v189 = 0;
        v72 = 0;
        v99 = 0;
        goto LABEL_52;
      }
      v81 = [MEMORY[0x263F08B08] scannerWithString:v66];
      if ([v81 scanHexLongLong:buf]
        && (uint64_t v82 = *(void *)buf,
            [(PersonalizedImage *)v180 boardID],
            v83 = objc_claimAutoreleasedReturnValue(),
            uint64_t v84 = [v83 unsignedLongLongValue],
            v83,
            v82 == v84))
      {
        v85 = [MEMORY[0x263F08B08] scannerWithString:v71];

        if (![v85 scanHexLongLong:buf]
          || (uint64_t v86 = *(void *)buf,
              [(PersonalizedImage *)v180 chipID],
              v87 = objc_claimAutoreleasedReturnValue(),
              uint64_t v88 = [v87 unsignedLongLongValue],
              v87,
              v86 != v88))
        {
          v67 = v76;
          v188 = v85;
          v189 = 0;
          goto LABEL_62;
        }
        v89 = [MEMORY[0x263F08B08] scannerWithString:v76];

        v188 = v89;
        if (![v89 scanHexLongLong:buf])
        {
          v67 = v76;
          v189 = 0;
LABEL_62:
          v72 = 0;
          v99 = 0;
          v77 = 0;
          v118 = 0;
          v107 = 0;
          int v119 = 4;
LABEL_54:
          id v9 = v184;
          goto LABEL_55;
        }
        uint64_t v90 = *(void *)buf;
        v91 = [(PersonalizedImage *)v180 securityDomain];
        uint64_t v92 = [v91 unsignedLongLongValue];

        id v9 = v184;
        if (v90 == v92)
        {
          v93 = [v65 objectForKeyedSubscript:@"Info"];
          v94 = isNSDictionary(v93);

          v189 = v93;
          if (v94)
          {
            v98 = [v65 objectForKeyedSubscript:@"Manifest"];
            v99 = isNSDictionary(v98);

            if (v99)
            {
              v103 = [v98 objectForKeyedSubscript:@"LoadableTrustCache"];
              v77 = v103;
              if (v103)
              {
                v72 = v98;
                v99 = isNSDictionary(v103);

                if (v99)
                {
                  v107 = [v77 objectForKeyedSubscript:@"Info"];
                  v99 = isNSDictionary(v107);

                  if (v99)
                  {
                    v111 = [v107 objectForKeyedSubscript:@"Path"];

                    v112 = v111;
                    v99 = isNSString(v111);

                    if (v99)
                    {
                      v67 = v76;
                      v116 = v112;
                      v98 = v72;
                      goto LABEL_67;
                    }
                    v67 = v76;
                    uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 638, -3, 0, @"Missing expected key 'Path'", v113, v114, v115, v173);
                    v118 = 0;
                    v181 = v112;
                  }
                  else
                  {
                    v67 = v76;
                    uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 632, -3, 0, @"Missing expected key 'Info'", v108, v109, v110, v173);
                    v118 = 0;
                  }
                }
                else
                {
                  v67 = v76;
                  uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 625, -3, 0, @"Invalid value for key 'LoadableTrustCache'", v104, v105, v106, v173);
LABEL_52:
                  v118 = 0;
                  v107 = 0;
                }
LABEL_53:

                int v119 = 3;
                v187 = (void *)v117;
                goto LABEL_54;
              }
              v67 = v76;
              v107 = 0;
              v116 = v181;
LABEL_67:
              v181 = v116;
              v99 = [v98 objectForKeyedSubscript:@"PersonalizedDMG"];
              v118 = isNSDictionary(v99);

              if (v118)
              {
                v118 = [v99 objectForKeyedSubscript:@"Name"];
                v123 = isNSString(v118);

                if (v123)
                {
                  v124 = [(PersonalizedImage *)v180 imageVariant];
                  int v125 = [v118 isEqualToString:v124];

                  if (!v125)
                  {
                    v72 = v98;
                    int v119 = 0;
                    goto LABEL_54;
                  }
                  v126 = [v99 objectForKeyedSubscript:@"Info"];

                  v127 = isNSDictionary(v126);

                  v72 = v98;
                  if (v127)
                  {
                    v131 = [v126 objectForKeyedSubscript:@"HashMethod"];

                    v177 = v131;
                    uint64_t v132 = isNSString(v131);
                    v133 = v126;
                    if (v132)
                    {
                      v134 = (void *)v132;
                      int v135 = [v177 isEqualToString:@"sha1"];

                      if (v135) {
                        [(PersonalizedImage *)v180 setDigestLength:20];
                      }
                    }
                    v136 = [v133 objectForKeyedSubscript:@"Path"];

                    v137 = isNSString(v136);

                    if (v137)
                    {
                      v141 = v133;
                      int v119 = 3;
                      v174 = v136;
                      v107 = v141;
                      goto LABEL_54;
                    }
                    uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 669, -3, 0, @"Missing expected key 'Path'", v138, v139, v140, v173);
                    v174 = v136;
                    v107 = v133;
                    goto LABEL_53;
                  }
                  uint64_t v144 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 658, -3, 0, @"Missing expected key 'Info'", v128, v129, v130, v173);
                  v107 = v126;
                  goto LABEL_81;
                }
                v72 = v98;
                uint64_t v142 = 651;
                v143 = @"Missing expected key 'Name'";
              }
              else
              {
                v72 = v98;
                uint64_t v142 = 645;
                v143 = @"Missing expected key 'PersonalizedDMG'";
              }
              uint64_t v144 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", v142, -3, 0, v143, v120, v121, v122, v173);
LABEL_81:
              uint64_t v117 = v144;
              goto LABEL_53;
            }
            v72 = v98;
            v67 = v76;
            uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 619, -3, 0, @"Missing expected key 'Manifest'", v100, v101, v102, v173);
          }
          else
          {
            v67 = v76;
            uint64_t v117 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 613, -3, 0, @"Missing expected key 'Info'", v95, v96, v97, v173);
            v72 = 0;
LABEL_50:
            v99 = 0;
          }
          v77 = 0;
          goto LABEL_52;
        }
      }
      else
      {
        v188 = v81;
      }
      v67 = v76;
      v189 = 0;
      v72 = 0;
      v99 = 0;
      v77 = 0;
      v118 = 0;
      v107 = 0;
      int v119 = 4;
LABEL_55:

      if ((v119 | 4) != 4) {
        goto LABEL_87;
      }
      ++v64;
    }
    while (v186 != v64);
    uint64_t v145 = [v9 countByEnumeratingWithState:&v194 objects:v198 count:16];
    uint64_t v186 = v145;
  }
  while (v145);
LABEL_87:

  if (!v174)
  {
    a3 = v176;
    v154 = v187;
    goto LABEL_99;
  }
  uint64_t v7 = [@"Restore" stringByAppendingPathComponent:v174];

  v146 = NSURL;
  v147 = [v178 stringByAppendingPathComponent:v7];
  v148 = [v146 fileURLWithPath:v147];
  v4 = v180;
  [(PersonalizedImage *)v180 setImagePathURL:v148];

  a3 = v176;
  if (v181)
  {
    uint64_t v149 = [@"Restore" stringByAppendingPathComponent:v181];

    v150 = NSURL;
    v151 = [v178 stringByAppendingPathComponent:v149];
    v152 = [v150 fileURLWithPath:v151];
    [(PersonalizedImage *)v180 setTrustCacheURL:v152];

    v181 = (void *)v149;
  }
  else
  {
    v181 = 0;
  }
LABEL_4:
  uint64_t v10 = [(PersonalizedImage *)v4 remoteDevice];

  if (!v10)
  {
    v179 = v4;
    uint64_t v12 = copyWorkingDirectory();
    if (v12)
    {
      id v183 = v9;
      v175 = a3;
      v24 = [MEMORY[0x263F08C38] UUID];
      id v25 = [v24 UUIDString];
      uint64_t v13 = [v12 stringByAppendingPathComponent:v25];

      if (v13)
      {
        id v11 = [NSURL fileURLWithPath:v13];
        if (v11)
        {
          v32 = [MEMORY[0x263F08850] defaultManager];
          v33 = [(PersonalizedImage *)v179 imagePathURL];
          id v193 = v187;
          char v34 = [v32 copyItemAtURL:v33 toURL:v11 error:&v193];
          id v35 = v193;

          if (v34)
          {
            [(PersonalizedImage *)v179 setImagePathURL:v11];
            v36 = [(PersonalizedImage *)v179 trustCacheURL];

            if (!v36)
            {
              BOOL v14 = 1;
              id v15 = v35;
              goto LABEL_115;
            }
            v37 = [MEMORY[0x263F08C38] UUID];
            v38 = [v37 UUIDString];
            uint64_t v39 = [v12 stringByAppendingPathComponent:v38];

            v43 = v35;
            if (v39)
            {
              uint64_t v44 = [NSURL fileURLWithPath:v39];

              a3 = v175;
              if (v44)
              {
                v48 = [MEMORY[0x263F08850] defaultManager];
                v49 = [(PersonalizedImage *)v179 trustCacheURL];
                id v192 = v43;
                char v190 = [v48 copyItemAtURL:v49 toURL:v44 error:&v192];
                id v15 = v192;

                id v9 = v183;
                if (v190)
                {
                  [(PersonalizedImage *)v179 setTrustCacheURL:v44];
                  BOOL v14 = 1;
                  id v11 = (void *)v44;
                  uint64_t v13 = (void *)v39;
                  goto LABEL_115;
                }
                v167 = [(PersonalizedImage *)v179 trustCacheURL];
                uint64_t v171 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 756, -2, v15, @"Failed to copy %@ to %@.", v168, v169, v170, (uint64_t)v167);

                v153 = (void *)v171;
                uint64_t v13 = (void *)v39;
                id v11 = (void *)v44;
                if (!v175)
                {
LABEL_114:
                  BOOL v14 = 0;
                  id v15 = v153;
                  goto LABEL_115;
                }
LABEL_109:
                id v15 = v153;
                BOOL v14 = 0;
                *a3 = v15;
                goto LABEL_115;
              }
              uint64_t v166 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 751, -2, 0, @"Failed to create URL.", v45, v46, v47, v173);

              v153 = (void *)v166;
              id v11 = 0;
              uint64_t v13 = (void *)v39;
LABEL_108:
              id v9 = v183;
              if (!a3) {
                goto LABEL_114;
              }
              goto LABEL_109;
            }
            uint64_t v165 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 745, -2, 0, @"Failed to create path.", v40, v41, v42, v173);

            v153 = (void *)v165;
            uint64_t v13 = 0;
LABEL_107:
            a3 = v175;
            goto LABEL_108;
          }
          v161 = [(PersonalizedImage *)v179 imagePathURL];
          uint64_t v160 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 736, -2, v35, @"Failed to copy %@ to %@.", v162, v163, v164, (uint64_t)v161);
        }
        else
        {
          uint64_t v160 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 731, -2, 0, @"Failed to create URL.", v29, v30, v31, v173);
        }
      }
      else
      {
        uint64_t v160 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 725, -2, 0, @"Failed to create path.", v26, v27, v28, v173);

        id v11 = 0;
      }
      v153 = (void *)v160;
      goto LABEL_107;
    }
    uint64_t v155 = createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 719, -2, 0, @"Failed to query working directory path.", v21, v22, v23, v173);

    uint64_t v13 = 0;
    id v11 = 0;
LABEL_100:
    v153 = (void *)v155;
    if (!a3) {
      goto LABEL_114;
    }
    goto LABEL_109;
  }
  id v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  BOOL v14 = 1;
  id v15 = v187;
LABEL_115:

  return v14;
}

- (BOOL)initializeDeviceAttributes:(id *)a3
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  memset(v124, 0, sizeof(v124));
  uint64_t v122 = @"PersonalizedImageType";
  id v5 = [(PersonalizedImage *)self imageVariant];
  v123 = v5;
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];

  uint64_t v7 = [(PersonalizedImage *)self remoteDevice];

  if (v7)
  {
    uint64_t v8 = [(PersonalizedImage *)self remoteDevice];
    id v9 = MobileStorageRemoteCopyPersonalizationIdentifiersWithError(v8, v6, &cf);
  }
  else
  {
    id v9 = MobileStorageCopyPersonalizationIdentifiersWithError(v6, &cf);
  }
  uint64_t v115 = v9;
  if (!v9
    && (mobileStorageErrorHasDomainAndErrorCode((void *)cf, @"com.apple.MobileStorage.ErrorDomain", -5) & 1) == 0)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 816, -2, (void *)cf, @"Failed to query personalization identifiers.", v10, v11, v12, v111);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    int v119 = 0;
    v24 = 0;
    v116 = 0;
    uint64_t v120 = 0;
    id v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v16 = 0;
LABEL_19:
    char v34 = 0;
    id v35 = 0;
    uint64_t v117 = 0;
    if (!a3) {
      goto LABEL_40;
    }
LABEL_39:
    id v23 = v23;
    v53 = a3;
    LOBYTE(a3) = 0;
    id *v53 = v23;
    goto LABEL_40;
  }
  uint64_t v13 = [(PersonalizedImage *)self remoteDevice];

  if (v13)
  {
    BOOL v14 = [(PersonalizedImage *)self remoteDevice];
    id v15 = (void *)copy_remote_device_property();
  }
  else
  {
    id v15 = (void *)MGCopyAnswer();
  }
  uint64_t v16 = isNSString(v15);

  int v119 = v15;
  if (!v16)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 828, -2, 0, @"Failed to copy value: %@", v17, v18, v19, @"HWModelStr");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v24 = 0;
    v116 = 0;
    uint64_t v120 = 0;
    id v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    goto LABEL_19;
  }
  v20 = [(PersonalizedImage *)self remoteDevice];

  if (v20) {
    uint64_t v21 = @"Bridge";
  }
  else {
    uint64_t v21 = (__CFString *)MGCopyAnswer();
  }
  uint64_t v117 = v21;
  uint64_t v16 = isNSString(v21);

  if (!v16)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 838, -2, 0, @"Failed to copy value: %@", v28, v29, v30, @"DeviceClass");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v24 = 0;
    v116 = 0;
    uint64_t v120 = 0;
    id v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    goto LABEL_38;
  }
  uint64_t v31 = [v9 objectForKeyedSubscript:@"UniqueChipID"];
  uint64_t v32 = isNSNumber(v31);
  if (v32)
  {
    v33 = (void *)v32;
  }
  else
  {
    v36 = [(PersonalizedImage *)self remoteDevice];

    if (!v36) {
      goto LABEL_24;
    }
    v33 = [(PersonalizedImage *)self remoteDevice];
    v37 = a3;
    uint64_t v38 = copy_remote_device_property();

    uint64_t v31 = (void *)v38;
    a3 = v37;
  }

LABEL_24:
  uint64_t v26 = isNSNumber(v31);

  v118 = v31;
  if (!v26)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 849, -2, 0, @"Failed to copy value: %@", v39, v40, v41, @"UniqueChipID");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
LABEL_35:
    v116 = 0;
LABEL_36:
    uint64_t v120 = 0;
LABEL_37:
    id v25 = 0;
    uint64_t v27 = 0;
    uint64_t v16 = 0;
LABEL_38:
    char v34 = 0;
    id v35 = 0;
    if (!a3) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v24 = [v9 objectForKeyedSubscript:@"ChipID"];
  uint64_t v42 = isNSNumber(v24);
  if (v42)
  {
    v43 = (void *)v42;
  }
  else
  {
    uint64_t v44 = [(PersonalizedImage *)self remoteDevice];

    if (!v44) {
      goto LABEL_31;
    }
    v43 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v45 = a3;
    uint64_t v46 = copy_remote_device_property();

    v24 = (void *)v46;
    a3 = v45;
  }

LABEL_31:
  uint64_t v26 = isNSNumber(v24);

  if (!v26)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 858, -2, 0, @"Failed to copy value: %@", v47, v48, v49, @"ChipID");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  uint64_t v50 = [v9 objectForKeyedSubscript:@"BoardId"];
  uint64_t v51 = isNSNumber(v50);
  if (v51)
  {
    uint64_t v52 = (void *)v51;
  }
  else
  {
    uint64_t v55 = [(PersonalizedImage *)self remoteDevice];

    if (!v55) {
      goto LABEL_46;
    }
    uint64_t v52 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v56 = a3;
    uint64_t v57 = copy_remote_device_property();

    uint64_t v50 = (void *)v57;
    a3 = v56;
  }

LABEL_46:
  uint64_t v26 = isNSNumber(v50);

  v116 = v50;
  if (!v26)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 867, -2, 0, @"Failed to copy value: %@", v58, v59, v60, @"BoardId");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  uint64_t v120 = [v9 objectForKeyedSubscript:@"SecurityDomain"];
  uint64_t v61 = isNSNumber(v120);
  if (v61)
  {
    uint64_t v62 = (void *)v61;
  }
  else
  {
    uint64_t v63 = [(PersonalizedImage *)self remoteDevice];

    if (!v63) {
      goto LABEL_53;
    }
    uint64_t v62 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v64 = a3;
    uint64_t v65 = copy_remote_device_property();

    uint64_t v120 = (void *)v65;
    a3 = v64;
  }

LABEL_53:
  uint64_t v26 = isNSNumber(v120);

  if (!v26)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 876, -2, 0, @"Failed to copy value: %@", v66, v67, v68, @"SecurityDomain");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  uint64_t v27 = [v9 objectForKeyedSubscript:@"EffectiveSecurityModeAp"];
  uint64_t v69 = isNSNumber(v27);
  v112 = a3;
  if (v69)
  {
    uint64_t v70 = (void *)v69;
  }
  else
  {
    v71 = [(PersonalizedImage *)self remoteDevice];

    if (!v71) {
      goto LABEL_60;
    }
    uint64_t v70 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v72 = copy_remote_device_property();

    uint64_t v27 = (void *)v72;
  }

LABEL_60:
  uint64_t v26 = isNSNumber(v27);

  if (!v26)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 885, -2, 0, @"Failed to copy value: %@", v73, v74, v75, @"EffectiveSecurityModeAp");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = 0;
    uint64_t v16 = 0;
LABEL_79:
    char v34 = 0;
    id v35 = 0;
    goto LABEL_80;
  }
  uint64_t v16 = [v9 objectForKeyedSubscript:@"EffectiveProductionStatusAp"];
  uint64_t v76 = isNSNumber(v16);
  if (v76)
  {
    v77 = (void *)v76;
  }
  else
  {
    uint64_t v78 = [(PersonalizedImage *)self remoteDevice];

    if (!v78) {
      goto LABEL_67;
    }
    v77 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v79 = copy_remote_device_property();

    uint64_t v16 = (void *)v79;
  }

LABEL_67:
  uint64_t v80 = isNSNumber(v16);

  if (!v80)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 894, -2, 0, @"Failed to copy value: %@", v81, v82, v83, @"EffectiveProductionStatusAp");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = 0;
LABEL_78:
    uint64_t v26 = 0;
    goto LABEL_79;
  }
  id v25 = [v9 objectForKeyedSubscript:@"CertificateSecurityMode"];
  uint64_t v84 = isNSNumber(v25);
  if (v84)
  {
    v85 = (void *)v84;
  }
  else
  {
    uint64_t v86 = [(PersonalizedImage *)self remoteDevice];

    if (!v86) {
      goto LABEL_74;
    }
    v85 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v87 = copy_remote_device_property();

    id v25 = (void *)v87;
  }

LABEL_74:
  uint64_t v88 = isNSNumber(v25);

  if (!v88)
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 903, -2, 0, @"Failed to copy value: %@", v89, v90, v91, @"CertificateSecurityMode");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_78;
  }
  uint64_t v26 = [v9 objectForKeyedSubscript:@"CertificateProductionStatus"];
  uint64_t v92 = isNSNumber(v26);
  if (v92)
  {
    v93 = (void *)v92;
  }
  else
  {
    v94 = [(PersonalizedImage *)self remoteDevice];

    if (!v94) {
      goto LABEL_85;
    }
    v93 = [(PersonalizedImage *)self remoteDevice];
    id v95 = v9;
    CFDictionaryRef v96 = v6;
    uint64_t v97 = copy_remote_device_property();

    uint64_t v26 = (void *)v97;
    CFDictionaryRef v6 = v96;
    id v9 = v95;
  }

LABEL_85:
  id v35 = isNSNumber(v26);

  if (v35)
  {
    id v35 = [v9 objectForKeyedSubscript:@"Ap,SikaFuse"];
    uint64_t v101 = [(PersonalizedImage *)self remoteDevice];

    if (v101)
    {
      uint64_t v102 = [(PersonalizedImage *)self remoteDevice];
      CFDictionaryRef v22 = v6;
      char v34 = MobileStorageRemoteCopyPersonalizationNonceWithError(v102, v6, &cf);
    }
    else
    {
      CFDictionaryRef v22 = v6;
      char v34 = (void *)MobileStorageCopyPersonalizationNonceWithError(v6, &cf);
    }
    v103 = isNSData(v34);

    if (v103)
    {
      v107 = [(PersonalizedImage *)self remoteDevice];

      if (v107)
      {
        uint64_t v108 = [(PersonalizedImage *)self remoteDevice];
        uint64_t v113 = copy_remote_device_property();

        uint64_t v109 = (id *)v113;
      }
      else
      {
        uint64_t v109 = (id *)MGCopyAnswer();
      }
      uint64_t v114 = v109;
      uint64_t v110 = isNSData(v109);

      if (v110)
      {
        a3 = v114;
      }
      else
      {
        a3 = (id *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v124 length:160];
      }
      [(PersonalizedImage *)self setDeviceClass:v117];
      [(PersonalizedImage *)self setHardwareModel:v119];
      [(PersonalizedImage *)self setEcid:v118];
      [(PersonalizedImage *)self setChipID:v24];
      [(PersonalizedImage *)self setBoardID:v116];
      [(PersonalizedImage *)self setSecurityDomain:v120];
      [(PersonalizedImage *)self setEffectiveSecurityMode:v27];
      [(PersonalizedImage *)self setEffectiveProductionStatus:v16];
      [(PersonalizedImage *)self setCertificateSecurityMode:v25];
      [(PersonalizedImage *)self setCertificateProductionStatus:v26];
      [(PersonalizedImage *)self setImage4Supported:MEMORY[0x263EFFA88]];
      [(PersonalizedImage *)self setApNonce:v34];
      [(PersonalizedImage *)self setSepNonce:a3];
      [(PersonalizedImage *)self setSikaFuse:v35];

      id v23 = 0;
      LOBYTE(a3) = 1;
      goto LABEL_40;
    }
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 924, -2, (void *)cf, @"Failed to copy personalization nonce.", v104, v105, v106, v111);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFDictionaryRef v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 912, -2, 0, @"Failed to copy value: %@", v98, v99, v100, @"CertificateProductionStatus");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    char v34 = 0;
  }
LABEL_80:
  a3 = v112;
  if (v112) {
    goto LABEL_39;
  }
LABEL_40:
  if (cf) {
    CFRelease(cf);
  }

  return (char)a3;
}

- (BOOL)mountImage:(id)a3 serverTicket:(id)a4 imageDigest:(id)a5 trustCacheURL:(id)a6 error:(id *)a7
{
  v94[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v85 = v13;
  CFTypeRef cf = 0;
  uint64_t v81 = v12;
  uint64_t v83 = v14;
  if (!v11 || !v12 || !v13)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 981, -2, 0, @"Invalid input(s).", v15, v16, v17, v77);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v82 = 0;
    uint64_t v84 = 0;
    goto LABEL_42;
  }
  uint64_t v18 = (uint64_t)v14;
  id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
  v93[0] = @"DeviceType";
  v93[1] = @"DiskImageType";
  v94[0] = @"DiskImage";
  v94[1] = @"Personalized";
  v93[2] = @"ImageSignature";
  v94[2] = v12;
  v20 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
  uint64_t v84 = (void *)[v19 initWithDictionary:v20];

  if (v18)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v18];
    if (!v21)
    {
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 993, -2, 0, @"Failed to load %@.", v22, v23, v24, v18);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v82 = 0;
      goto LABEL_42;
    }
    id v25 = (void *)v21;
    [v84 setObject:v21 forKeyedSubscript:@"ImageTrustCache"];
  }
  else
  {
    id v25 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [(PersonalizedImage *)self hardwareModel];
    uint64_t v32 = [(PersonalizedImage *)self deviceClass];
    [(PersonalizedImage *)self ecid];
    v33 = self;
    v35 = char v34 = v25;
    *(_DWORD *)buf = 138413058;
    *(void *)uint64_t v88 = v11;
    *(_WORD *)&v88[8] = 2112;
    *(void *)uint64_t v89 = v31;
    *(_WORD *)&v89[8] = 2112;
    uint64_t v90 = v32;
    __int16 v91 = 2112;
    uint64_t v92 = v35;
    _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Preparing to mount %@ on %@ (deviceClass: %@ ecid: %@)", buf, 0x2Au);

    id v25 = v34;
    self = v33;
  }
  v36 = [(PersonalizedImage *)self remoteDevice];

  if (v36)
  {
    v37 = [(PersonalizedImage *)self remoteDevice];
    uint64_t v27 = (void *)MobileStorageRemoteCopyDevicesWithError(v37, 0, &cf);
  }
  else
  {
    uint64_t v27 = MobileStorageCopyDevicesWithError(0, &cf);
  }
  uint64_t v38 = isNSArray(v27);

  uint64_t v82 = v25;
  if (!v38)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1010, -2, (void *)cf, @"Failed to copy device list.", v39, v40, v41, v77);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    goto LABEL_42;
  }
  uint64_t v78 = self;
  uint64_t v79 = v11;
  if (![v27 count])
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
LABEL_36:
    v53 = [(PersonalizedImage *)v78 remoteDevice];

    if (v53)
    {
      v54 = [(PersonalizedImage *)v78 remoteDevice];
      id v11 = v79;
      uint64_t v55 = [v79 path];
      int v56 = MobileStorageRemoteMountWithError(v54, v55, v84, &cf);

      if (v56)
      {
        uint64_t v57 = (void *)cf;
        uint64_t v58 = [v79 path];
        createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1049, -2, v57, @"Failed to mount %@.", v59, v60, v61, (uint64_t)v58);
LABEL_41:
        id v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_42:
        if (a7)
        {
          id v26 = v26;
          BOOL v72 = 0;
          uint64_t v75 = 0;
          *a7 = v26;
        }
        else
        {
          BOOL v72 = 0;
          uint64_t v75 = 0;
        }
LABEL_49:
        uint64_t v48 = v30;
        uint64_t v46 = v29;
        goto LABEL_50;
      }
      uint64_t v75 = 0;
    }
    else
    {
      id v11 = v79;
      uint64_t v62 = [v79 path];
      uint64_t v75 = (void *)MobileStorageMountWithError(v62, (const __CFDictionary *)v84, &cf, v63, v64, v65, v66, v67);

      if (!v75)
      {
        uint64_t v68 = (void *)cf;
        uint64_t v58 = [v79 path];
        createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1055, -2, v68, @"Failed to mount %@.", v69, v70, v71, (uint64_t)v58);
        goto LABEL_41;
      }
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v73 = [v11 path];
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v88 = v73;
      _os_log_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%@ successfully mounted on device.", buf, 0xCu);
    }
    id v26 = 0;
    BOOL v72 = 1;
    goto LABEL_49;
  }
  uint64_t v42 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  v43 = MEMORY[0x263EF8438];
  while (1)
  {
    uint64_t v44 = v28;
    uint64_t v28 = [v27 objectAtIndexedSubscript:v42];

    uint64_t v45 = isNSDictionary(v28);

    if (!v45)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        int v50 = [v27 count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v88 = v42;
        *(_WORD *)&v88[4] = 1024;
        *(_DWORD *)&v88[6] = v50;
        _os_log_debug_impl(&dword_21DAAF000, v43, OS_LOG_TYPE_DEBUG, "Failed to retrieve entry %d of %d.", buf, 0xEu);
      }
      goto LABEL_31;
    }
    uint64_t v46 = [v28 objectForKeyedSubscript:@"DeviceType"];

    uint64_t v47 = isNSString(v46);

    if (!v47)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        int v51 = [v27 count];
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v88 = @"DeviceType";
        *(_WORD *)&v88[8] = 1024;
        *(_DWORD *)uint64_t v89 = v42 + 1;
        *(_WORD *)&v89[4] = 1024;
        *(_DWORD *)&v89[6] = v51;
        _os_log_debug_impl(&dword_21DAAF000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
      }
      goto LABEL_27;
    }
    if ([v46 isEqualToString:@"DiskImage"]) {
      break;
    }
LABEL_27:
    uint64_t v29 = v46;
LABEL_31:
    if (++v42 >= (unint64_t)[v27 count]) {
      goto LABEL_36;
    }
  }
  uint64_t v48 = [v28 objectForKeyedSubscript:@"ImageSignature"];

  uint64_t v49 = isNSData(v48);

  if (!v49)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      int v52 = [v27 count];
      *(_DWORD *)buf = 138412802;
      *(void *)uint64_t v88 = @"ImageSignature";
      *(_WORD *)&v88[8] = 1024;
      *(_DWORD *)uint64_t v89 = v42 + 1;
      *(_WORD *)&v89[4] = 1024;
      *(_DWORD *)&v89[6] = v52;
      _os_log_debug_impl(&dword_21DAAF000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
    }
    goto LABEL_30;
  }
  if (![v85 isEqualToData:v48])
  {
LABEL_30:
    uint64_t v29 = v46;
    uint64_t v30 = v48;
    goto LABEL_31;
  }
  uint64_t v75 = [v28 objectForKeyedSubscript:@"MountPath"];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    id v11 = v79;
    -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:](v79, (uint64_t)v75);
    id v26 = 0;
    BOOL v72 = 1;
  }
  else
  {
    id v26 = 0;
    BOOL v72 = 1;
    id v11 = v79;
  }
LABEL_50:
  if (cf) {
    CFRelease(cf);
  }

  return v72;
}

- (BOOL)mountImage:(id *)a3
{
  v101[5] = *MEMORY[0x263EF8340];
  id v94 = 0;
  CFTypeRef cf = 0;
  BOOL v4 = [(PersonalizedImage *)self initializeDeviceAttributes:&v94];
  id v5 = v94;
  CFDictionaryRef v6 = v5;
  if (!v4)
  {
    id v12 = 0;
    uint64_t v18 = 0;
    id v19 = 0;
    v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v90 = 0;
    uint64_t v23 = 0;
    id v8 = v5;
    goto LABEL_14;
  }
  id v93 = v5;
  BOOL v7 = [(PersonalizedImage *)self initializeImageProperties:&v93];
  id v8 = v93;

  if (!v7)
  {
    id v12 = 0;
    uint64_t v18 = 0;
    id v19 = 0;
    v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v90 = 0;
    uint64_t v23 = 0;
    goto LABEL_14;
  }
  if (mountImage__onceToken != -1) {
    dispatch_once(&mountImage__onceToken, &__block_literal_global_0);
  }
  id v12 = (const void *)AMAuthInstallCreate();
  if (!v12)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1115, -2, 0, @"AMAuthInstallCreate failed.", v9, v10, v11, v79);
    goto LABEL_11;
  }
  id v13 = [(PersonalizedImage *)self signingServerURL];
  uint64_t v14 = AMAuthInstallSetSigningServerURL();

  if (v14)
  {
    convertLibAuthInstallError(v14);
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1123, -2, 0, @"AMAuthInstallSetSigningServerURL failed: %d (%s)", v15, v16, v17, v14);
    uint64_t v24 = LABEL_11:;
    uint64_t v18 = 0;
    id v19 = 0;
    v20 = 0;
    uint64_t v21 = 0;
LABEL_12:
    uint64_t v22 = 0;
    uint64_t v90 = 0;
    uint64_t v23 = 0;
    goto LABEL_13;
  }
  if ([(PersonalizedImage *)self useCredentials])
  {
    uint64_t v28 = AMAuthInstallSsoEnable();
    if (v28)
    {
      uint64_t v29 = v28;
      convertLibAuthInstallError(v28);
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1132, -2, 0, @"AMAuthInstallSsoEnable failed: %d (%s)", v30, v31, v32, v29);
      goto LABEL_11;
    }
  }
  v33 = [(PersonalizedImage *)self imagePathURL];
  id v92 = v8;
  uint64_t v21 = [(PersonalizedImage *)self digestFile:v33 digestLength:[(PersonalizedImage *)self digestLength] error:&v92];
  id v34 = v92;

  if (!v21)
  {
    id v8 = [(PersonalizedImage *)self imagePathURL];
    uint64_t v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1141, -2, v34, @"Failed to digest %@.", v38, v39, v40, (uint64_t)v8);

    uint64_t v18 = 0;
    id v19 = 0;
    v20 = 0;
    goto LABEL_12;
  }
  id v35 = [(PersonalizedImage *)self trustCacheURL];

  uint64_t v90 = v21;
  if (v35)
  {
    v36 = [(PersonalizedImage *)self trustCacheURL];
    id v91 = v34;
    uint64_t v23 = [(PersonalizedImage *)self digestFile:v36 digestLength:[(PersonalizedImage *)self digestLength] error:&v91];
    id v37 = v91;

    if (!v23)
    {
      id v8 = [(PersonalizedImage *)self trustCacheURL];
      uint64_t v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1150, -2, v37, @"Failed to digest %@", v76, v77, v78, (uint64_t)v8);

      uint64_t v18 = 0;
      id v19 = 0;
      v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      goto LABEL_13;
    }
    uint64_t v80 = v37;
  }
  else
  {
    uint64_t v80 = v34;
    uint64_t v23 = 0;
  }
  uint64_t v41 = *MEMORY[0x263F8BFC8];
  uint64_t v42 = *MEMORY[0x263F8BFF0];
  v100[0] = *MEMORY[0x263F8BFC8];
  v100[1] = v42;
  uint64_t v86 = v42;
  v101[0] = v21;
  v101[1] = MEMORY[0x263EFFA88];
  uint64_t v43 = *MEMORY[0x263F8BFD0];
  v100[2] = *MEMORY[0x263F8BFD0];
  uint64_t v44 = [(PersonalizedImage *)self effectiveProductionStatus];
  v101[2] = v44;
  uint64_t v45 = *MEMORY[0x263F8BFD8];
  v100[3] = *MEMORY[0x263F8BFD8];
  uint64_t v46 = [(PersonalizedImage *)self effectiveSecurityMode];
  v101[3] = v46;
  v100[4] = *MEMORY[0x263F8BFE0];
  uint64_t v47 = [(PersonalizedImage *)self imageVariant];
  v101[4] = v47;
  v20 = [NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:5];

  if (v23)
  {
    v98[0] = v41;
    v98[1] = v86;
    v99[0] = v23;
    v99[1] = MEMORY[0x263EFFA88];
    v98[2] = v43;
    uint64_t v48 = [(PersonalizedImage *)self effectiveProductionStatus];
    v99[2] = v48;
    v98[3] = v45;
    uint64_t v49 = [(PersonalizedImage *)self effectiveSecurityMode];
    v99[3] = v49;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:4];
  }
  else
  {
    uint64_t v21 = 0;
  }
  int v50 = (void *)MEMORY[0x263EFF9A0];
  v96[0] = *MEMORY[0x263F8BF48];
  uint64_t v87 = [(PersonalizedImage *)self certificateSecurityMode];
  v97[0] = v87;
  v96[1] = *MEMORY[0x263F8BF30];
  uint64_t v84 = [(PersonalizedImage *)self certificateProductionStatus];
  v97[1] = v84;
  v96[2] = *MEMORY[0x263F8BF40];
  uint64_t v83 = [(PersonalizedImage *)self securityDomain];
  v97[2] = v83;
  v96[3] = *MEMORY[0x263F8BF00];
  uint64_t v82 = [(PersonalizedImage *)self boardID];
  v97[3] = v82;
  v96[4] = *MEMORY[0x263F8BF08];
  uint64_t v81 = [(PersonalizedImage *)self chipID];
  v97[4] = v81;
  v96[5] = *MEMORY[0x263F8BF10];
  int v51 = [(PersonalizedImage *)self ecid];
  v97[5] = v51;
  v96[6] = *MEMORY[0x263F8BF38];
  int v52 = [(PersonalizedImage *)self image4Supported];
  v97[6] = v52;
  v96[7] = *MEMORY[0x263F8BF20];
  v53 = [(PersonalizedImage *)self apNonce];
  uint64_t v54 = *MEMORY[0x263F8BFF8];
  v97[7] = v53;
  v97[8] = MEMORY[0x263EFFA80];
  uint64_t v55 = *MEMORY[0x263F8BEE0];
  v96[8] = v54;
  v96[9] = v55;
  v97[9] = v20;
  int v56 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:10];
  uint64_t v18 = [v50 dictionaryWithDictionary:v56];

  uint64_t v57 = [(PersonalizedImage *)self sepNonce];

  if (v57)
  {
    uint64_t v58 = [(PersonalizedImage *)self sepNonce];
    [v18 setObject:v58 forKeyedSubscript:*MEMORY[0x263F8BF50]];
  }
  uint64_t v59 = [(PersonalizedImage *)self sikaFuse];

  if (v59)
  {
    uint64_t v60 = [(PersonalizedImage *)self sikaFuse];
    [v18 setObject:v60 forKeyedSubscript:*MEMORY[0x263F8BF58]];
  }
  if (v21) {
    [v18 setObject:v21 forKeyedSubscript:@"LoadableTrustCache"];
  }
  uint64_t v61 = AMAuthInstallRequestSendSync();
  if (v61)
  {
    uint64_t v62 = v61;
    convertLibAuthInstallError(v61);
    uint64_t v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1204, -2, 0, @"AMAuthInstallRequestSendSync failed: %d (%s)", v63, v64, v65, v62);
    id v19 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    id v19 = (id)cf;
    uint64_t v22 = [v19 objectForKeyedSubscript:*MEMORY[0x263F8BF18]];
    uint64_t v66 = isNSData(v22);

    if (v66)
    {
      uint64_t v88 = [(PersonalizedImage *)self imagePathURL];
      uint64_t v70 = [(PersonalizedImage *)self trustCacheURL];
      uint64_t v71 = self;
      BOOL v72 = (void *)v70;
      BOOL v85 = -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:](v71, "mountImage:serverTicket:imageDigest:trustCacheURL:error:", v88, v22, v90);
      id v8 = v80;

      if (v85)
      {
        char v25 = 1;
LABEL_17:
        CFRelease(v12);
        BOOL v26 = v25;
        goto LABEL_18;
      }
      uint64_t v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1221, -2, v8, @"Failed to mount image.", v73, v74, v75, v79);
      goto LABEL_13;
    }
    uint64_t v24 = createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1214, -2, 0, @"Invalid server ticket in response: %@", v67, v68, v69, (uint64_t)v19);
  }
  id v8 = v80;
LABEL_13:

  id v8 = (id)v24;
LABEL_14:
  if (a3) {
    *a3 = v8;
  }
  char v25 = 0;
  BOOL v26 = 0;
  if (v12) {
    goto LABEL_17;
  }
LABEL_18:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;

  return v26;
}

uint64_t __32__PersonalizedImage_mountImage___block_invoke()
{
  AMAuthInstallLogSetHandler();
  return MEMORY[0x270F98128](0);
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSURL)bundlePathURL
{
  return self->_bundlePathURL;
}

- (void)setBundlePathURL:(id)a3
{
}

- (NSDictionary)mountedVolumeEntry
{
  return self->_mountedVolumeEntry;
}

- (void)setMountedVolumeEntry:(id)a3
{
}

- (NSURL)imagePathURL
{
  return self->_imagePathURL;
}

- (void)setImagePathURL:(id)a3
{
}

- (NSString)imageVariant
{
  return self->_imageVariant;
}

- (void)setImageVariant:(id)a3
{
}

- (NSURL)trustCacheURL
{
  return self->_trustCacheURL;
}

- (void)setTrustCacheURL:(id)a3
{
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSNumber)certificateSecurityMode
{
  return self->_certificateSecurityMode;
}

- (void)setCertificateSecurityMode:(id)a3
{
}

- (NSNumber)certificateProductionStatus
{
  return self->_certificateProductionStatus;
}

- (void)setCertificateProductionStatus:(id)a3
{
}

- (NSNumber)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(id)a3
{
}

- (NSNumber)effectiveProductionStatus
{
  return self->_effectiveProductionStatus;
}

- (void)setEffectiveProductionStatus:(id)a3
{
}

- (NSNumber)image4Supported
{
  return self->_image4Supported;
}

- (void)setImage4Supported:(id)a3
{
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (unsigned)digestLength
{
  return self->_digestLength;
}

- (void)setDigestLength:(unsigned int)a3
{
  self->_digestLength = a3;
}

- (BOOL)useCredentials
{
  return self->_useCredentials;
}

- (void)setUseCredentials:(BOOL)a3
{
  self->_useCredentials = a3;
}

- (NSURL)signingServerURL
{
  return self->_signingServerURL;
}

- (void)setSigningServerURL:(id)a3
{
}

- (NSURL)userProvidedBundleMountPathURL
{
  return self->_userProvidedBundleMountPathURL;
}

- (void)setUserProvidedBundleMountPathURL:(id)a3
{
}

- (NSURL)userProvidedImagePathURL
{
  return self->_userProvidedImagePathURL;
}

- (void)setUserProvidedImagePathURL:(id)a3
{
}

- (BOOL)skipLoadingLaunchDaemons
{
  return self->_skipLoadingLaunchDaemons;
}

- (void)setSkipLoadingLaunchDaemons:(BOOL)a3
{
  self->_skipLoadingLaunchDaemons = a3;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_userProvidedImagePathURL, 0);
  objc_storeStrong((id *)&self->_userProvidedBundleMountPathURL, 0);
  objc_storeStrong((id *)&self->_signingServerURL, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_image4Supported, 0);
  objc_storeStrong((id *)&self->_effectiveProductionStatus, 0);
  objc_storeStrong((id *)&self->_effectiveSecurityMode, 0);
  objc_storeStrong((id *)&self->_certificateProductionStatus, 0);
  objc_storeStrong((id *)&self->_certificateSecurityMode, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_trustCacheURL, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_imagePathURL, 0);
  objc_storeStrong((id *)&self->_mountedVolumeEntry, 0);
  objc_storeStrong((id *)&self->_bundlePathURL, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
}

- (void)mountImage:(void *)a1 serverTicket:(uint64_t)a2 imageDigest:trustCacheURL:error:.cold.1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [a1 path];
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_21DAAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%@ already mounted at %@.", (uint8_t *)&v4, 0x16u);
}

@end