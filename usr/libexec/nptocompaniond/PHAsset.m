@interface PHAsset
+ (void)_npto_archiveLivePhotoAssetResourceFiles:(id)a3 completionHandler:(id)a4;
- (double)_npto_maxPixelSizeForDevice:(id)a3;
- (id)_npto_findInterestingAssetResourcesFrom:(id)a3;
- (void)_npto_processAssetResourceFiles:(id)a3 isLegacyDevice:(BOOL)a4 maxPixelSize:(double)a5 completionHandler:(id)a6;
- (void)_npto_processPairedVideoAssetResource:(id)a3 maxPixelSize:(double)a4 completionHandler:(id)a5;
- (void)_npto_processPhotoAssetResource:(id)a3 isLegacyDevice:(BOOL)a4 maxPixelSize:(double)a5 completionHandler:(id)a6;
- (void)_npto_requestLivePhotoAssetResourceFilesWithMaxPixelSize:(double)a3 isLegacyDevice:(BOOL)a4 isUserInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)_npto_requestPhotoAssetResourceFilesWithMaxPixelSize:(double)a3 isLegacyDevice:(BOOL)a4 isUserInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)npto_exportForDevice:(id)a3 isUserInitiated:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation PHAsset

- (void)npto_exportForDevice:(id)a3 isUserInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100055EB0;
  v31[3] = &unk_100093220;
  v31[4] = self;
  id v9 = a3;
  v10 = objc_retainBlock(v31);
  [(PHAsset *)self _npto_maxPixelSizeForDevice:v9];
  double v12 = v11;
  id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"EF9E8C3A-6B59-47E0-BA2F-212213F1A30D"];
  unsigned int v14 = [v9 supportsCapability:v13];

  if ((id)[(PHAsset *)self mediaType] == (id)1)
  {
    uint64_t v15 = v14 ^ 1;
    if (([(PHAsset *)self mediaSubtypes] & 8) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100056208;
      v25[3] = &unk_100093298;
      v25[4] = self;
      double v28 = v12;
      char v29 = v15;
      BOOL v30 = v5;
      id v26 = v8;
      v27 = v10;
      [(PHAsset *)self _npto_requestLivePhotoAssetResourceFilesWithMaxPixelSize:v15 isLegacyDevice:v5 isUserInitiated:v25 completionHandler:v12];

      v16 = v26;
    }
    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100056918;
      v22[3] = &unk_100093248;
      v22[4] = self;
      id v23 = v8;
      v24 = v10;
      [(PHAsset *)self _npto_requestPhotoAssetResourceFilesWithMaxPixelSize:v15 isLegacyDevice:v5 isUserInitiated:v22 completionHandler:v12];

      v16 = v23;
    }
  }
  else
  {
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithFormat:@"Unsupported asset media type %ld %@", [(PHAsset *)self mediaType], self];
    v35 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v19 = +[NSError errorWithDomain:@"NanoPhotosErrorDomain" code:0 userInfo:v18];

    v20 = sub_10005CDAC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [v19 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v19);
    }
  }
}

- (void)_npto_requestPhotoAssetResourceFilesWithMaxPixelSize:(double)a3 isLegacyDevice:(BOOL)a4 isUserInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  double v11 = [(PHAsset *)self localIdentifier];
  double v12 = sub_10005CDAC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will request image for asset %@", buf, 0xCu);
  }

  id v13 = objc_alloc_init((Class)PHImageRequestOptions);
  unsigned int v14 = v13;
  if (!a5) {
    [v13 setDownloadIntent:7];
  }
  if ((id)[(PHAsset *)self playbackStyle] == (id)2) {
    [v14 setVersion:2];
  }
  [v14 setDeliveryMode:1];
  [v14 setNetworkAccessAllowed:1];
  [v14 setLoadingMode:0x10000];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100056CE4;
  v25[3] = &unk_1000932C0;
  id v15 = v11;
  id v26 = v15;
  [v14 setProgressHandler:v25];
  v16 = +[PHImageManager defaultManager];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100056E34;
  v19[3] = &unk_1000932E8;
  v21 = self;
  id v22 = v10;
  id v20 = v15;
  BOOL v24 = a4;
  double v23 = a3;
  id v17 = v10;
  id v18 = v15;
  [v16 requestImageForAsset:self targetSize:0 contentMode:v14 options:v19 resultHandler:a3];
}

- (void)_npto_requestLivePhotoAssetResourceFilesWithMaxPixelSize:(double)a3 isLegacyDevice:(BOOL)a4 isUserInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = [(PHAsset *)self localIdentifier];
  double v11 = +[PHAssetResource assetResourcesForAsset:self];
  double v12 = [(PHAsset *)self _npto_findInterestingAssetResourcesFrom:v11];

  if ([v12 count])
  {
    id v13 = sub_10005CDAC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v77 = v10;
      __int16 v78 = 2112;
      id v79 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Done requesting live photo resources for asset %@, resources: %@", buf, 0x16u);
    }

    unsigned int v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100057A80;
    v66[3] = &unk_100093310;
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    id v67 = v45;
    id v48 = v9;
    id v71 = v9;
    id v46 = v14;
    v47 = v12;
    id v68 = v46;
    id v15 = v12;
    id v69 = v15;
    v70 = self;
    BOOL v73 = a4;
    double v72 = a3;
    v52 = objc_retainBlock(v66);
    v16 = sub_10005CDAC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Will request asset resources for live photo %@", buf, 0xCu);
    }
    v53 = v10;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v15;
    id v17 = [obj countByEnumeratingWithState:&v62 objects:v82 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v50 = *(void *)v63;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          id v21 = [v20 type];
          id v22 = sub_10005CDAC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v77 = v53;
            __int16 v78 = 2048;
            id v79 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will request live photo for asset %@ resource type %ld", buf, 0x16u);
          }

          double v23 = [v20 originalFilename];
          BOOL v24 = [v23 pathExtension];

          if (!v24)
          {
            v25 = [v20 uniformTypeIdentifier];
            id v26 = +[PFUniformTypeUtilities typeWithIdentifier:v25];

            v27 = sub_10005CDAC();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v53;
              __int16 v78 = 2048;
              id v79 = v21;
              __int16 v80 = 2112;
              v81 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No originalFilename for asset %@ resource type %ld, trying to get extension from type %@", buf, 0x20u);
            }

            uint64_t v28 = +[PFUniformTypeUtilities preferredOrFallbackFilenameExtensionForType:v26];
            if (!v28)
            {
              v41 = sub_10005CDAC();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v77 = v53;
                __int16 v78 = 2048;
                id v79 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to get file extension for asset %@ resource type %ld", buf, 0x16u);
              }

              NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
              v42 = +[NSString stringWithFormat:@"No valid file extension for asset %@ resource type %ld", v53, v21, v45];
              v75 = v42;
              v43 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
              v44 = +[NSError errorWithDomain:@"NanoPhotosErrorDomain" code:6 userInfo:v43];

              ((void (*)(void *, id, void, void *))v52[2])(v52, v21, 0, v44);
              goto LABEL_30;
            }
            BOOL v24 = (void *)v28;
          }
          id v29 = objc_alloc_init((Class)PHAssetResourceRequestOptions);
          BOOL v30 = v29;
          if (!a5) {
            [v29 setDownloadIntent:7];
          }
          [v30 setNetworkAccessAllowed:1];
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_100057BE4;
          v59[3] = &unk_100093338;
          id v31 = v53;
          id v60 = v31;
          id v61 = v21;
          [v30 setProgressHandler:v59];
          v32 = [[NPTOTemporaryFile alloc] initWithPathExtension:v24];
          v33 = +[PHAssetResourceManager defaultManager];
          NSErrorUserInfoKey v34 = [(NPTOTemporaryFile *)v32 URL];
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100057CB8;
          v54[3] = &unk_100093360;
          id v55 = v31;
          id v58 = v21;
          v35 = v52;
          v56 = v32;
          id v57 = v35;
          v36 = v32;
          [v33 writeDataForAssetResource:v20 toFile:v34 options:v30 completionHandler:v54];
        }
        id v18 = [obj countByEnumeratingWithState:&v62 objects:v82 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_30:

    double v12 = v47;
    id v9 = v48;
    id v10 = v53;
    v39 = v46;
  }
  else
  {
    NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
    v37 = +[NSString stringWithFormat:@"No asset resources returned for asset %@", v10];
    v84 = v37;
    v38 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    v39 = +[NSError errorWithDomain:@"NanoPhotosErrorDomain" code:2 userInfo:v38];

    v40 = sub_10005CDAC();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v77 = v10;
      __int16 v78 = 2112;
      id v79 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to request live photo resources for asset %@, error %@", buf, 0x16u);
    }

    if (v9) {
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v39);
    }
  }
}

- (void)_npto_processAssetResourceFiles:(id)a3 isLegacyDevice:(BOOL)a4 maxPixelSize:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  double v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100057FFC;
  v22[3] = &unk_100093388;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v12;
  id v25 = v10;
  id v26 = v11;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  id v16 = v23;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100058164;
  v18[3] = &unk_1000933D8;
  BOOL v21 = a4;
  double v20 = a5;
  v18[4] = self;
  v19 = objc_retainBlock(v22);
  id v17 = v19;
  [v13 enumerateKeysAndObjectsUsingBlock:v18];
}

- (void)_npto_processPhotoAssetResource:(id)a3 isLegacyDevice:(BOOL)a4 maxPixelSize:(double)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = v10;
  CFURLRef v13 = [v12 URL];
  id v14 = CGImageSourceCreateWithURL(v13, 0);

  if (v14)
  {
    ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v14, 0, 0);
    id v16 = ImageAtIndex;
    if (ImageAtIndex)
    {
      size_t Width = CGImageGetWidth(ImageAtIndex);
      size_t Height = CGImageGetHeight(v16);
      CFRelease(v16);
      id v16 = 0;
      if (Width)
      {
        if (Height)
        {
          size_t Count = CGImageSourceGetCount(v14);
          double v20 = sub_10005CDAC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = CGImageSourceGetType(v14);
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = a5;
            *(_WORD *)&buf[22] = 2048;
            v166 = (void *)Width;
            *(_WORD *)v167 = 2048;
            *(void *)&v167[2] = Height;
            *(_WORD *)&v167[10] = 2048;
            *(void *)&v167[12] = Count;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[DoResize] Resizing image with type: (%@), maxPixelSize: (%f), original image size: (%zu x %zu), image count: (%ld)", buf, 0x34u);
          }

          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_10005A21C;
          v166 = &unk_100093448;
          *(void *)v167 = Width;
          *(double *)&v167[8] = a5;
          *(void *)&v167[16] = Height;
          BOOL v21 = objc_retainBlock(buf);
          id v22 = [NPTOTemporaryFile alloc];
          id v23 = v22;
          if (v8)
          {
            v153 = [(NPTOTemporaryFile *)v22 initWithPathExtension:@"jpg"];
          }
          else
          {
            id v25 = [v12 URL];
            [v25 pathExtension];
            v27 = id v26 = v12;
            v153 = [(NPTOTemporaryFile *)v23 initWithPathExtension:v27];

            id v12 = v26;
          }
          v141 = v11;
          uint64_t v28 = sub_10005CDAC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v12 URL];
            LODWORD(v168) = 138412290;
            *(void *)((char *)&v168 + 4) = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[ImageFile] Original File: %@", (uint8_t *)&v168, 0xCu);
          }
          id v143 = v12;
          BOOL v30 = [v12 URL];
          id v31 = [v30 pathExtension];
          v32 = +[PFUniformTypeUtilities typeWithFilenameExtension:v31];

          CFArrayRef v33 = CGImageDestinationCopyTypeIdentifiers();
          v155 = v32;
          NSErrorUserInfoKey v34 = [(UTType *)v32 identifier];
          CFArrayRef v151 = v33;
          unsigned int v35 = [(__CFArray *)v33 containsObject:v34];

          v36 = sub_10005CDAC();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v168) = 67109120;
            DWORD1(v168) = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[ImageFile] Is original image file supported %d", (uint8_t *)&v168, 8u);
          }

          v37 = v153;
          CFURLRef v38 = [(NPTOTemporaryFile *)v153 URL];
          if (v8 | v35 ^ 1) {
            v39 = UTTypeJPEG;
          }
          else {
            v39 = v155;
          }
          v40 = [(UTType *)v39 identifier];
          v41 = CGImageDestinationCreateWithURL(v38, v40, Count, 0);

          if (v41)
          {
            CFDictionaryRef v42 = CGImageSourceCopyProperties(v14, 0);
            CGImageDestinationSetProperties(v41, v42);
            if (v42) {
              CFRelease(v42);
            }
            if (Count)
            {
              for (size_t i = 0; i != Count; ++i)
              {
                CFDictionaryRef v44 = (const __CFDictionary *)(*((uint64_t (**)(unsigned char *, void))v21 + 2))(v21, 0);
                id v45 = CGImageSourceCreateImageAtIndex(v14, i, v44);
                CFDictionaryRef v46 = CGImageSourceCopyPropertiesAtIndex(v14, i, 0);
                (*((void (**)(unsigned char *, CFDictionaryRef))v21 + 2))(v21, v46);
                CFDictionaryRef v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                CGImageDestinationAddImage(v41, v45, v47);
                if (v45) {
                  CGImageRelease(v45);
                }
                if (v46) {
                  CFRelease(v46);
                }
              }
            }
            CGImageDestinationFinalize(v41);
            CFRelease(v41);
            v37 = v153;
            id v16 = v153;
            id v11 = v141;
            id v12 = v143;
          }
          else
          {
            id v48 = sub_10005CDAC();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v168) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Could not create imageDestination", (uint8_t *)&v168, 2u);
            }

            id v16 = 0;
            id v11 = v141;
            id v12 = v143;
          }
        }
      }
    }
    CFRelease(v14);
  }
  else
  {
    id v24 = sub_10005CDAC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not create imageSource", buf, 2u);
    }

    id v16 = 0;
  }

  v49 = v16;
  uint64_t v50 = self;
  v51 = v50;
  if (v49)
  {
    if ((id)[(PHAsset *)v50 playbackStyle] == (id)2)
    {
      v52 = sub_10005CDAC();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [(PHAsset *)v51 localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@ processedFileWithFaceMetadata: the asset is an animated image; do nothing",
          buf,
          0xCu);
      }
      v54 = v49;
      goto LABEL_100;
    }
    v56 = +[PHFace fetchFacesInAsset:v51 options:0];
    if ([v56 count])
    {
      CFURLRef v57 = [(CGImage *)v49 URL];
      id v58 = CGImageSourceCreateWithURL(v57, 0);

      v59 = sub_10005CDAC();
      id v60 = v59;
      if (v58)
      {
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          id v61 = [(PHAsset *)v51 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v61;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%@ processedFileWithFaceMetadata: adding face region metadata from PHFaces", buf, 0xCu);
        }
        long long v62 = CGImageSourceCreateImageAtIndex(v58, 0, 0);
        id v144 = v12;
        if (v62)
        {
          long long v63 = v62;
          size_t v64 = CGImageGetWidth(v62);
          size_t v65 = CGImageGetHeight(v63);
          CFRelease(v63);
        }
        else
        {
          id v67 = sub_10005CDAC();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "getImageDimensions: cannot create image source", buf, 2u);
          }

          size_t v64 = 1;
          size_t v65 = 1;
        }
        CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
        if (Mutable)
        {
          id v69 = Mutable;
          v139 = v49;
          +[NSString stringWithFormat:@"%ld", v64];
          v70 = isrdouble c = v58;
          sub_100055A9C(v69, @"mwg-rs:Regions", @"AppliedToDimensions.w", v70);

          id v71 = +[NSString stringWithFormat:@"%ld", v65];
          sub_100055A9C(v69, @"mwg-rs:Regions", @"AppliedToDimensions.h", v71);

          sub_100055A9C(v69, @"mwg-rs:Regions", @"AppliedToDimensions.unit", @"pixel");
          *(_DWORD *)buf = 1;
          CFDictionaryRef v72 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, 0);
          v142 = v11;
          if (v72)
          {
            CFDictionaryRef v73 = v72;
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v72, kCGImagePropertyTIFFDictionary);
            if (Value)
            {
              CFNumberRef v75 = (const __CFNumber *)CFDictionaryGetValue(Value, kCGImagePropertyTIFFOrientation);
              if (v75) {
                CFNumberGetValue(v75, kCFNumberSInt32Type, buf);
              }
            }
            CFRelease(v73);
            double b = 0.0;
            double d = 1.0;
            double c = 0.0;
            double a = 1.0;
            double v148 = 0.0;
            tCGFloat x = 0.0;
            switch(*(_DWORD *)buf)
            {
              case 1:
                break;
              case 2:
                tCGFloat x = (double)v64;
                CGFloat ty = 0.0;
                double c = 0.0;
                double a = -1.0;
                goto LABEL_70;
              case 3:
                double v148 = (double)v65;
                tCGFloat x = (double)v64;
                double c = 0.0;
                double a = -1.0;
                double d = -1.0;
                break;
              case 4:
                double v134 = (double)v65;
                double a = 1.0;
                double d = -1.0;
                double c = 0.0;
                goto LABEL_114;
              case 5:
                double a = 0.0;
                double c = 1.0;
                CGFloat ty = 0.0;
                double b = 1.0;
                double d = 0.0;
                goto LABEL_69;
              case 6:
                tCGFloat x = (double)v65;
                double b = 1.0;
                CGFloat ty = 0.0;
                double c = -1.0;
                double a = 0.0;
                double d = 0.0;
                goto LABEL_70;
              case 7:
                double v148 = (double)v64;
                tCGFloat x = (double)v65;
                double a = 0.0;
                double c = -1.0;
                double b = -1.0;
                double d = 0.0;
                break;
              case 8:
                double v134 = (double)v64;
                double c = 1.0;
                double a = 0.0;
                double b = -1.0;
                double d = 0.0;
LABEL_114:
                double v148 = v134;
                tCGFloat x = 0.0;
                break;
              default:
                double c = CGAffineTransformIdentity.c;
                double a = CGAffineTransformIdentity.a;
                double b = CGAffineTransformIdentity.b;
                double d = CGAffineTransformIdentity.d;
                tCGFloat x = CGAffineTransformIdentity.tx;
                CGFloat ty = CGAffineTransformIdentity.ty;
                goto LABEL_70;
            }
          }
          else
          {
            double b = 0.0;
            double c = 0.0;
            double a = 1.0;
            double d = 1.0;
            CGFloat ty = 0.0;
LABEL_69:
            tCGFloat x = 0.0;
LABEL_70:
            double v148 = ty;
          }
          long long v170 = 0u;
          long long v171 = 0u;
          long long v168 = 0u;
          long long v169 = 0u;
          v138 = v56;
          id obj = v56;
          id v78 = [obj countByEnumeratingWithState:&v168 objects:buf count:16];
          if (v78)
          {
            id v79 = v78;
            uint64_t v80 = 0;
            double v81 = fabs(c * (double)v65 + a * (double)v64);
            double v82 = fabs(d * (double)v65 + b * (double)v64);
            uint64_t v147 = *(void *)v169;
            if (v82 >= v81) {
              double v83 = v82;
            }
            else {
              double v83 = v81;
            }
            double v146 = v83;
            double v84 = 1.0 / (double)v65;
            do
            {
              for (j = 0; j != v79; j = (char *)j + 1)
              {
                if (*(void *)v169 != v147) {
                  objc_enumerationMutation(obj);
                }
                v86 = *(void **)(*((void *)&v168 + 1) + 8 * (void)j);
                [v86 size];
                double v88 = v146 * v87;
                [v86 centerX];
                double v90 = fmax(v88 * -0.5 + v89 * v81, 0.0);
                [v86 centerY];
                double v92 = fmax(v88 * -0.5 + v91 * v82, 0.0);
                if (v88 >= v81 - v90) {
                  double v93 = v81 - v90;
                }
                else {
                  double v93 = v88;
                }
                v164.double a = 1.0;
                v164.double b = 0.0;
                v164.double c = 0.0;
                if (v88 >= v82 - v92) {
                  double v94 = v82 - v92;
                }
                else {
                  double v94 = v88;
                }
                *(_OWORD *)&v164.double d = xmmword_10007B950;
                v164.CGFloat ty = v82;
                double v95 = v90;
                CGRect v172 = CGRectApplyAffineTransform(*(CGRect *)(&v92 - 1), &v164);
                CGFloat x = v172.origin.x;
                CGFloat y = v172.origin.y;
                CGFloat v98 = v172.size.width;
                CGFloat v99 = v172.size.height;
                v164.double a = a;
                v164.double b = b;
                v164.double c = c;
                v164.double d = d;
                v164.tCGFloat x = tx;
                v164.CGFloat ty = v148;
                CGAffineTransformInvert(&v159, &v164);
                v173.origin.CGFloat x = x;
                v173.origin.CGFloat y = y;
                v173.size.width = v98;
                v173.size.height = v99;
                CGRect v174 = CGRectApplyAffineTransform(v173, &v159);
                CGFloat v100 = v174.origin.x;
                CGFloat v101 = v174.origin.y;
                CGFloat v102 = v174.size.width;
                CGFloat v103 = v174.size.height;
                CGAffineTransformMakeScale(&v158, 1.0 / (double)v64, v84);
                v175.origin.CGFloat x = v100;
                v175.origin.CGFloat y = v101;
                v175.size.width = v102;
                v175.size.height = v103;
                CGRect v176 = CGRectApplyAffineTransform(v175, &v158);
                CGFloat v104 = v176.origin.x;
                CGFloat v105 = v176.origin.y;
                CGFloat v106 = v176.size.width;
                CGFloat v107 = v176.size.height;
                v108 = sub_10005CDAC();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                {
                  v109 = [(PHAsset *)v51 localIdentifier];
                  v177.origin.CGFloat x = v104;
                  v177.origin.CGFloat y = v105;
                  v177.size.width = v106;
                  v177.size.height = v107;
                  v110 = NSStringFromRect(v177);
                  LODWORD(v164.a) = 138412546;
                  *(void *)((char *)&v164.a + 4) = v109;
                  WORD2(v164.b) = 2112;
                  *(void *)((char *)&v164.b + 6) = v110;
                  _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%@ processedFileWithFaceMetadata: face rect %@", (uint8_t *)&v164, 0x16u);
                }
                v111 = +[NSString stringWithFormat:@"mwg-rs:Regions.RegionList[%d]", (char *)j + v80];
                sub_100055A9C(v69, v111, @"Type", @"Face");
                v178.origin.CGFloat x = v104;
                v178.origin.CGFloat y = v105;
                v178.size.width = v106;
                v178.size.height = v107;
                v112 = +[NSString stringWithFormat:@"%f", CGRectGetMidX(v178)];
                sub_100055A9C(v69, v111, @"Area.x", v112);

                v179.origin.CGFloat x = v104;
                v179.origin.CGFloat y = v105;
                v179.size.width = v106;
                v179.size.height = v107;
                v113 = +[NSString stringWithFormat:@"%f", CGRectGetMidY(v179)];
                sub_100055A9C(v69, v111, @"Area.y", v113);

                v114 = +[NSString stringWithFormat:@"%f", *(void *)&v106];
                sub_100055A9C(v69, v111, @"Area.w", v114);

                v115 = +[NSString stringWithFormat:@"%f", *(void *)&v107];
                sub_100055A9C(v69, v111, @"Area.h", v115);

                sub_100055A9C(v69, v111, @"Area.unit", @"normalized");
              }
              id v79 = [obj countByEnumeratingWithState:&v168 objects:buf count:16];
              uint64_t v80 = (v80 + j);
            }
            while (v79);
          }

          v162[0] = kCGImageDestinationMergeMetadata;
          v162[1] = kCGImageDestinationMetadata;
          v163[0] = &__kCFBooleanTrue;
          v163[1] = v69;
          CFDictionaryRef v116 = +[NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:2];
          v117 = [NPTOTemporaryFile alloc];
          v49 = v139;
          v118 = [(CGImage *)v139 URL];
          v119 = [v118 pathExtension];
          v120 = [(NPTOTemporaryFile *)v117 initWithPathExtension:v119];

          CFURLRef v121 = [(NPTOTemporaryFile *)v120 URL];
          CFStringRef Type = CGImageSourceGetType(isrc);
          v123 = CGImageDestinationCreateWithURL(v121, Type, 1uLL, 0);

          if (v123)
          {
            CFErrorRef err = 0;
            BOOL v124 = CGImageDestinationCopyImageSource(v123, isrc, v116, &err);
            CFRelease(v123);
            CFRelease(v69);
            CFRelease(isrc);
            v125 = v120;
            id v11 = v142;
            id v12 = v144;
            if (!v124)
            {
              v126 = sub_10005CDAC();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                v137 = [(PHAsset *)v51 localIdentifier];
                LODWORD(v164.a) = 138412546;
                *(void *)((char *)&v164.a + 4) = v137;
                WORD2(v164.b) = 2112;
                *(void *)((char *)&v164.b + 6) = err;
                _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%@ processedFileWithFaceMetadata: Error in CGImageDestinationCopyImageSource: %@; do nothing",
                  (uint8_t *)&v164,
                  0x16u);
              }
              v125 = (NPTOTemporaryFile *)v139;
            }
            v54 = v125;
          }
          else
          {
            v127 = sub_10005CDAC();
            id v11 = v142;
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            {
              v136 = [(PHAsset *)v51 localIdentifier];
              LODWORD(v164.a) = 138412290;
              *(void *)((char *)&v164.a + 4) = v136;
              _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%@ processedFileWithFaceMetadata: could not create imageDestination; do nothing",
                (uint8_t *)&v164,
                0xCu);
            }
            CFRelease(v69);
            CFRelease(isrc);
            v54 = v139;
            id v12 = v144;
          }
          v56 = v138;
        }
        else
        {
          v77 = sub_10005CDAC();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v135 = [(PHAsset *)v51 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v135;
            _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%@ processedFileWithFaceMetadata: could not create new metadata; do nothing",
              buf,
              0xCu);
          }
          CFRelease(v58);
          v54 = v49;
        }
        goto LABEL_99;
      }
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
LABEL_54:

        v54 = v49;
LABEL_99:

        goto LABEL_100;
      }
      v66 = [(PHAsset *)v51 localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v66;
      _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%@ processedFileWithFaceMetadata: could not create image source; do nothing",
        buf,
        0xCu);
    }
    else
    {
      id v60 = sub_10005CDAC();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      v66 = [(PHAsset *)v51 localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v66;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%@ processedFileWithFaceMetadata: no extra face data in the asset; do nothing",
        buf,
        0xCu);
    }

    goto LABEL_54;
  }
  id v55 = sub_10005CDAC();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    v133 = [(PHAsset *)v51 localIdentifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v133;
    _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@ processedFileWithFaceMetadata: input asset data is nil", buf, 0xCu);
  }
  v54 = 0;
LABEL_100:

  if (v11)
  {
    if (v54)
    {
      v11[2](v11, v54, 0);
    }
    else
    {
      v128 = [(PHAsset *)v51 localIdentifier];
      NSErrorUserInfoKey v160 = NSLocalizedDescriptionKey;
      v129 = +[NSString stringWithFormat:@"Failed to add face metadata for asset %@", v128];
      v161 = v129;
      v130 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
      v131 = +[NSError errorWithDomain:@"NanoPhotosErrorDomain" code:1 userInfo:v130];

      v132 = sub_10005CDAC();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v128;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v131;
        _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "Failed to add face metadata for asset %@, error %@", buf, 0x16u);
      }

      ((void (**)(id, id, void *))v11)[2](v11, 0, v131);
    }
  }
}

- (void)_npto_processPairedVideoAssetResource:(id)a3 maxPixelSize:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [NPTOTemporaryFile alloc];
  id v10 = [v7 URL];
  id v11 = [v10 pathExtension];
  id v12 = [(NPTOTemporaryFile *)v9 initWithPathExtension:v11];

  CFURLRef v13 = [v7 URL];
  id v14 = +[AVURLAsset URLAssetWithURL:v13 options:0];
  id v15 = +[AVAssetExportSession exportSessionWithAsset:v14 presetName:AVAssetExportPresetAuxSmall];

  id v16 = [(NPTOTemporaryFile *)v12 URL];
  [v15 setOutputURL:v16];

  id v17 = sub_10005CDAC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v15 supportedFileTypes];
    *(_DWORD *)buf = 138412290;
    NSErrorUserInfoKey v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Valid file types are %@", buf, 0xCu);
  }
  v19 = [v15 supportedFileTypes];
  if ([v19 containsObject:AVFileTypeMPEG4])
  {
    [v15 setOutputFileType:AVFileTypeMPEG4];
  }
  else
  {
    double v20 = [v15 supportedFileTypes];
    if ([v20 containsObject:AVFileTypeQuickTimeMovie])
    {
      [v15 setOutputFileType:AVFileTypeQuickTimeMovie];
    }
    else
    {
      BOOL v21 = [v15 supportedFileTypes];
      id v22 = [v21 firstObject];
      [v15 setOutputFileType:v22];
    }
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100059AA0;
  v27[3] = &unk_100093400;
  id v28 = v15;
  id v29 = self;
  id v31 = v7;
  id v32 = v8;
  BOOL v30 = v12;
  id v23 = v7;
  id v24 = v12;
  id v25 = v8;
  id v26 = v15;
  [v26 exportAsynchronouslyWithCompletionHandler:v27];
}

+ (void)_npto_archiveLivePhotoAssetResourceFiles:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void, id))a4;
  id v6 = a3;
  +[NSMutableDictionary dictionary];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100059EF4;
  v20[3] = &unk_100093428;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v20];

  id v8 = [[NPTOTemporaryFile alloc] initWithPathExtension:@"nlp"];
  id v19 = 0;
  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v19];
  id v10 = v19;
  if (v10)
  {
    id v11 = sub_10005CDAC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(NPTOTemporaryFile *)v8 URL];
      *(_DWORD *)buf = 138412546;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to archive live photo to URL %@: %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, 0, v10);
    }
  }
  else
  {
    id v12 = [(NPTOTemporaryFile *)v8 URL];
    id v18 = 0;
    unsigned __int8 v13 = [v9 writeToURL:v12 options:0 error:&v18];
    id v14 = v18;

    if (v13)
    {
      if (v5) {
        ((void (**)(id, NPTOTemporaryFile *, id))v5)[2](v5, v8, 0);
      }
    }
    else
    {
      id v15 = sub_10005CDAC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v17 = [(NPTOTemporaryFile *)v8 URL];
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to write archived live photo to URL %@: %@", buf, 0x16u);
      }
      if (v5) {
        v5[2](v5, 0, v14);
      }
    }
  }
}

- (double)_npto_maxPixelSizeForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 valueForProperty:NRDevicePropertyMainScreenClass];
  unsigned int v6 = [v5 intValue];

  double v7 = 384.0;
  if (v4)
  {
    if (v6 != 12 && v6 != 13)
    {
      id v9 = [v4 valueForProperty:NRDevicePropertyMainScreenHeight];
      [v9 floatValue];
      double v7 = v10;
    }
  }
  if ((id)[(PHAsset *)self playbackStyle] != (id)2) {
    double v7 = v7 + v7;
  }
  if ([(PHAsset *)self mediaSubtypes]) {
    double v7 = v7 + v7;
  }

  return v7;
}

- (id)_npto_findInterestingAssetResourcesFrom:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (size_t i = 0; i != v8; size_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = (char *)[v11 type:v17] - 1;
        unsigned __int8 v13 = v4;
        switch((unint64_t)v12)
        {
          case 0uLL:
          case 8uLL:
            goto LABEL_8;
          case 4uLL:
          case 9uLL:
            unsigned __int8 v13 = v5;
LABEL_8:
            [v13 addObject:v11];
            break;
          default:
            continue;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v14 = v5;
  }
  else {
    id v14 = v4;
  }
  id v15 = v14;

  return v15;
}

@end