@interface NTKGalleryCollection
+ (id)_astronomyFacesForDevice:(id)a3;
+ (id)_blackcombFacesForDevice:(id)a3;
+ (id)_kaleidoscopeFacesForDevice:(id)a3;
+ (id)_newFacesExcludingRestrictedForDevice:(id)a3;
+ (id)_newFacesForDevice:(id)a3;
+ (id)_photoFacesForDevice:(id)a3;
+ (id)_upNextFacesForDevice:(id)a3;
+ (id)_whistlerSubdialsFacesForDevice:(id)a3;
+ (id)galleryCollectionsForDevice:(id)a3;
- (NSString)descriptionText;
- (NSString)title;
- (NTKGalleryCollectionDelegate)delegate;
- (id)calloutName;
- (id)faceAtIndex:(unint64_t)a3;
- (unint64_t)indexOfFace:(id)a3;
- (unint64_t)numberOfFaces;
- (void)enumerateFaceNamesUsingBlock:(id)a3;
- (void)setCalloutName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NTKGalleryCollection

+ (id)galleryCollectionsForDevice:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 nrDeviceUUID];
    *(_DWORD *)buf = 138412290;
    v87 = v7;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Adding galleryCollectionsForDevice with uuid:%@", buf, 0xCu);
  }
  v73 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  char v8 = [v73 BOOLForKey:@"ShowInternalFaces"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke;
  aBlock[3] = &unk_1E62C6220;
  id v9 = v4;
  id v83 = v9;
  char v84 = v8;
  v10 = _Block_copy(aBlock);
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = +[NTKFaceBundleManager sharedManager];
  uint64_t v13 = [v12 faceBundleForBundleIdentifier:@"com.apple.NTKAegirFaceBundle" onDevice:v9];

  v71 = (void *)v13;
  if (!v13)
  {
    v14 = [a1 _astronomyFacesForDevice:v9];
    [v11 addObject:v14];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  char v16 = [v9 supportsCapability:v15];

  if ((v16 & 1) == 0)
  {
    v17 = [a1 _upNextFacesForDevice:v9];
    [v11 addObject:v17];
  }
  v18 = [a1 _kaleidoscopeFacesForDevice:v9];
  [v11 addObject:v18];

  [v5 addObjectsFromArray:v11];
  if ([v9 isRunningGraceOrLater] && objc_msgSend(v9, "deviceCategory") != 1)
  {
    v19 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "Adding Subdials/California/FullScreen faces collection", buf, 2u);
    }

    v20 = [a1 _whistlerSubdialsFacesForDevice:v9];
    [v5 addObject:v20];

    v21 = [a1 _blackcombFacesForDevice:v9];
    [v5 addObject:v21];
  }
  v22 = +[NTKFaceBundleManager sharedManager];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_13;
  v78[3] = &unk_1E62C6248;
  id v23 = v9;
  id v79 = v23;
  id v24 = v10;
  id v81 = v24;
  id v25 = v5;
  id v80 = v25;
  [v22 enumerateFaceBundlesOnDevice:v23 includingLegacy:1 withBlock:v78];

  v26 = [v23 nrDeviceUUID];

  if (v26)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F27862F8-5179-4DB0-9F89-179EA7CB4011"];
    int v28 = [v23 supportsCapability:v27];

    char v29 = _os_feature_enabled_impl();
    if (!v28 || (v29 & 1) == 0)
    {
      v30 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_DEFAULT, "Adding Photos faces collection", buf, 2u);
      }

      v31 = [a1 _photoFacesForDevice:v23];
      [v25 addObject:v31];
    }
  }
  [v25 sortUsingComparator:&__block_literal_global_112];
  v72 = v11;
  if ([v23 collectionType] == 5 || NTKShowHardwareSpecificFaces())
  {
    v32 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Adding Zeus faces collection", buf, 2u);
    }

    v33 = +[NTKFaceBundleManager sharedManager];
    v34 = [v33 faceBundleForFaceStyle:14 onDevice:v23];

    if (v34)
    {
      v35 = (*((void (**)(id, void *))v24 + 2))(v24, v34);
      if (v35) {
        [v25 insertObject:v35 atIndex:0];
      }
    }
    if ((([v23 isZeusBlack] & 1) != 0 || NTKShowHardwareSpecificFaces())
      && [v23 isRunningGraceOrLater])
    {
      v36 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v36, OS_LOG_TYPE_DEFAULT, "Adding SpectrumZeus faces collection", buf, 2u);
      }

      v37 = +[NTKFaceBundleManager sharedManager];
      v38 = [v37 faceBundleForFaceStyle:42 onDevice:v23];

      if (v38)
      {
        v39 = (*((void (**)(id, void *))v24 + 2))(v24, v38);
        if (v39) {
          [v25 insertObject:v39 atIndex:0];
        }
      }
    }
    id v70 = a1;
    v40 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v40, OS_LOG_TYPE_DEFAULT, "Adding Poodle faces collection", buf, 2u);
    }

    v41 = +[NTKFaceBundleManager sharedManager];
    v42 = [v41 faceBundleForBundleIdentifier:@"com.apple.NTKPoodleFaceBundle" onDevice:v23];

    if (v42)
    {
      v43 = (*((void (**)(id, void *))v24 + 2))(v24, v42);
      if (v43) {
        [v25 insertObject:v43 atIndex:0];
      }
    }
    v44 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v44, OS_LOG_TYPE_DEFAULT, "Adding Hades faces collection", buf, 2u);
    }

    v45 = +[NTKFaceBundleManager sharedManager];
    v46 = [v45 faceBundleForBundleIdentifier:@"com.apple.NTKHadesFaceBundle" onDevice:v23];

    if (v46)
    {
      v47 = (*((void (**)(id, void *))v24 + 2))(v24, v46);
      if (v47) {
        [v25 insertObject:v47 atIndex:0];
      }
    }
    v48 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v48, OS_LOG_TYPE_DEFAULT, "Adding Secretariat faces collection", buf, 2u);
    }

    v49 = +[NTKFaceBundleManager sharedManager];
    v50 = [v49 faceBundleForBundleIdentifier:@"com.apple.NTKSecretariatFaceBundle" onDevice:v23];

    if (v50)
    {
      v51 = (*((void (**)(id, void *))v24 + 2))(v24, v50);
      if (v51) {
        [v25 insertObject:v51 atIndex:0];
      }
    }
    v52 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v52, OS_LOG_TYPE_DEFAULT, "Adding Bellona faces collection", buf, 2u);
    }

    v53 = +[NTKFaceBundleManager sharedManager];
    v54 = [v53 faceBundleForBundleIdentifier:@"com.apple.NTKBellonaFaceBundle" onDevice:v23];

    if (v54)
    {
      v55 = (*((void (**)(id, void *))v24 + 2))(v24, v54);
      if (v55) {
        [v25 insertObject:v55 atIndex:0];
      }
    }
    v56 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v56, OS_LOG_TYPE_DEFAULT, "Adding Squall faces collection", buf, 2u);
    }

    v57 = +[NTKFaceBundleManager sharedManager];
    v58 = [v57 faceBundleForBundleIdentifier:@"com.apple.NTKSquallFaceBundle" onDevice:v23];

    if (v58)
    {
      v59 = (*((void (**)(id, void *))v24 + 2))(v24, v58);
      if (v59) {
        [v25 insertObject:v59 atIndex:0];
      }
    }
    a1 = v70;
  }
  if (NTKGizmoOrCompanionAreRussian(v23)) {
    v60 = (void *)[a1 _newFacesExcludingRestrictedForDevice:v23];
  }
  else {
    v60 = (void *)[a1 _newFacesForDevice:v23];
  }
  v61 = v60;
  if (objc_msgSend(v60, "hasNewFaces", v70)) {
    [v25 insertObject:v61 atIndex:0];
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v62 = v25;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v75 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v67 loadFaces];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v67 loadFacesWithCompletion:0];
          }
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v64);
  }

  id v68 = v62;
  return v68;
}

+ (id)_whistlerSubdialsFacesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == 1) {
    id v4 = 0;
  }
  else {
    id v4 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)[NTKCWhistlerSubdialsFacesGalleryCollection alloc] initWithDevice:v3];
  }

  return v4;
}

+ (id)_kaleidoscopeFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)[NTKCKaleidoscopeFacesGalleryCollection alloc] initWithDevice:v3];

  return v4;
}

+ (id)_blackcombFacesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == 1) {
    id v4 = 0;
  }
  else {
    id v4 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)[NTKCBlackcombFacesGalleryCollection alloc] initWithDevice:v3];
  }

  return v4;
}

NTKCFacesBundleArrayGalleryCollection *__52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 galleryTitleForDevice:*(void *)(a1 + 32)];
  if ([v4 length])
  {
    v5 = (void *)[v3 faceClass];
    if (*(unsigned char *)(a1 + 40) || ![v5 _isInternalOnlyForDevice:*(void *)(a1 + 32)])
    {
      v10 = [[NTKCFacesBundleArrayGalleryCollection alloc] initWithDevice:*(void *)(a1 + 32) faceBundle:v3];
      goto LABEL_11;
    }
    v6 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      int v13 = 138412290;
      v14 = v8;
      id v9 = "Skipping internal bundle: %@";
LABEL_9:
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v6 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v11);
      int v13 = 138412290;
      v14 = v8;
      id v9 = "Skipping bundle: %@";
      goto LABEL_9;
    }
  }

  v10 = 0;
LABEL_11:

  return v10;
}

void __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isHardwareSpecific] & 1) == 0)
  {
    id v4 = [v3 galleryTitleForDevice:*(void *)(a1 + 32)];
    v5 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      char v8 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Adding bundled faces collection \"%@\"", (uint8_t *)&v7, 0xCu);
    }

    v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v6) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

uint64_t __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 title];
  v6 = [v4 title];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

+ (id)_newFacesExcludingRestrictedForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWhatsNewFacesGalleryCollectionExcludingRestricted alloc] initWithDevice:v3];

  return v4;
}

+ (id)_newFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWhatsNewFacesGalleryCollection alloc] initWithDevice:v3];

  return v4;
}

+ (id)_astronomyFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)[NTKCAstronomyFacesGalleryCollection alloc] initWithDevice:v3];

  return v4;
}

+ (id)_upNextFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)[NTKCUpNextFacesGalleryCollection alloc] initWithDevice:v3];

  return v4;
}

+ (id)_photoFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKCPhotoFaceCollectionGalleryCollection alloc] initForDevice:v3];

  return v4;
}

- (void)enumerateFaceNamesUsingBlock:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  if ([(NTKGalleryCollection *)self numberOfFaces])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NTKGalleryCollection *)self calloutName];

      if (v5)
      {
        v6 = [(NTKGalleryCollection *)self calloutName];
        uint64_t v7 = [(NTKGalleryCollection *)self faceAtIndex:v4];
        char v8 = ((void (**)(void, void *))v6)[2](v6, v7);
        v9[2](v9, v8);
      }
      ++v4;
    }
    while (v4 < [(NTKGalleryCollection *)self numberOfFaces]);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NTKGalleryCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKGalleryCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)calloutName
{
  return self->_calloutName;
}

- (void)setCalloutName:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong(&self->_calloutName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
}

- (unint64_t)numberOfFaces
{
  return 0;
}

- (id)faceAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexOfFace:(id)a3
{
  return 0;
}

@end