@interface COSWatchView
+ (id)_screenCache;
- (NRDevice)associatedDevice;
- (NSString)watchFaceFilePath;
- (NTKLibrarySelectedFaceSnapshotProvider)snapshotProvider;
- (UIImage)staticSnapShot;
- (unint64_t)deviceSize;
- (unint64_t)screenStyle;
- (void)applyScreenStyle;
- (void)setAssociatedDevice:(id)a3;
- (void)setScreenStyle:(unint64_t)a3;
- (void)setSnapshotProvider:(id)a3;
- (void)setStaticSnapShot:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setWatchFaceFilePath:(id)a3;
- (void)updateWatchFace;
@end

@implementation COSWatchView

+ (id)_screenCache
{
  if (qword_10029B1E0 != -1) {
    dispatch_once(&qword_10029B1E0, &stru_1002466B0);
  }
  v2 = (void *)qword_10029B1D8;

  return v2;
}

- (void)applyScreenStyle
{
  v3 = [(COSWatchView *)self watchScreenImageView];

  if (v3)
  {
    unint64_t screenStyle = self->_screenStyle;
    id v8 = [(COSWatchView *)self watchScreenImageView];
    v5 = [v8 layer];
    v6 = v5;
    if (screenStyle == 1)
    {
      v7 = +[CAFilter filterWithType:kCAFilterMultiplyBlendMode];
      [v6 setCompositingFilter:v7];
    }
    else
    {
      [v5 setCompositingFilter:0];
    }
  }
}

- (void)setScreenStyle:(unint64_t)a3
{
  unint64_t screenStyle = self->_screenStyle;
  self->_unint64_t screenStyle = a3;
  if (screenStyle != a3) {
    [(COSWatchView *)self applyScreenStyle];
  }
}

- (void)setAssociatedDevice:(id)a3
{
  id v5 = a3;
  v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = pbb_bridge_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v14 = 136315138;
      v15 = "-[COSWatchView setAssociatedDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: tinker device, using static screen image", (uint8_t *)&v14, 0xCu);
    }

    v10 = sub_1000328FC(@"Screen-Carousel-v10");
    [(COSWatchView *)self setScreenImageName:v10];
  }
  else
  {
    if (v9)
    {
      int v14 = 136315138;
      v15 = "-[COSWatchView setAssociatedDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)&self->_associatedDevice, a3);
    if (self->_associatedDevice && BPSDeviceHasCapabilityForString())
    {
      v11 = [(NRDevice *)self->_associatedDevice valueForProperty:NRDevicePropertyPairingID];
      v12 = (NTKLibrarySelectedFaceSnapshotProvider *)[objc_alloc((Class)NTKLibrarySelectedFaceSnapshotProvider) initWithDeviceUUID:v11];
      snapshotProvider = self->_snapshotProvider;
      self->_snapshotProvider = v12;

      [(NTKLibrarySelectedFaceSnapshotProvider *)self->_snapshotProvider setDelegate:self];
    }
    [(COSWatchView *)self updateWatchFace];
  }
}

- (void)setWatchFaceFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_watchFaceFilePath, a3);

  [(COSWatchView *)self updateWatchFace];
}

- (void)setStaticSnapShot:(id)a3
{
  self->_staticSnapShot = (UIImage *)a3;
  [(COSWatchView *)self updateWatchFace];
}

- (unint64_t)deviceSize
{
  associatedDevice = self->_associatedDevice;
  if (associatedDevice)
  {
    v4 = [(NRDevice *)associatedDevice valueForProperty:NRDevicePropertyProductType];
    if (v4)
    {
      id v5 = [(NRDevice *)self->_associatedDevice valueForProperty:NRDevicePropertyArtworkTraits];
      int v6 = MGGetBoolAnswer();
      unsigned int v7 = pbb_bridge_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 && v5)
      {
        if (v8)
        {
          *(_DWORD *)buf = 136315138;
          v16 = "-[COSWatchView deviceSize]";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyArtworkTraits to get PBBDeviceSize", buf, 0xCu);
        }

        BOOL v9 = [v5 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
        [v9 unsignedIntegerValue];

        uint64_t v10 = BPSVariantSizeForArtworkDeviceSubType();
      }
      else
      {
        if (v8)
        {
          *(_DWORD *)buf = 136315138;
          v16 = "-[COSWatchView deviceSize]";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyProductType to get PBBDeviceSize", buf, 0xCu);
        }

        uint64_t v10 = BPSVariantSizeForProductType();
      }
      unint64_t v11 = v10;
    }
    else
    {
      id v5 = pbb_bridge_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_associatedDevice;
        *(_DWORD *)buf = 136315394;
        v16 = "-[COSWatchView deviceSize]";
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: ERROR: product type for %@ is nil, setting size to generic which will break layout", buf, 0x16u);
      }
      unint64_t v11 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)COSWatchView;
    return [(COSWatchView *)&v14 deviceSize];
  }
  return v11;
}

- (void)updateWatchFace
{
  if (self->_associatedDevice && BPSDeviceHasCapabilityForString())
  {
    v3 = [(NRDevice *)self->_associatedDevice valueForProperty:NRDevicePropertyPairingID];
    v4 = v3;
    if (v3)
    {
      id v5 = [(NSString *)v3 UUIDString];
      int v6 = +[NSNumber numberWithUnsignedInteger:[(COSWatchView *)self style]];
      unsigned int v7 = +[NSString stringWithFormat:@"%@.%@", v5, v6];
    }
    else
    {
      unsigned int v7 = 0;
    }
    v26 = [(NTKLibrarySelectedFaceSnapshotProvider *)self->_snapshotProvider snapshotImage];
    [(COSWatchView *)self screenImageSize];
    if (v26)
    {
      uint64_t v29 = v27;
      uint64_t v30 = v28;
      v18 = [v26 imageByPreparingThumbnailOfSize:];

      v31 = pbb_bridge_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v63 = v18;
        __int16 v64 = 2048;
        uint64_t v65 = v29;
        __int16 v66 = 2048;
        uint64_t v67 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "COSWatchView: generated %@ with size: (%f,%f)", buf, 0x20u);
      }

      if (!v4 || !v18) {
        goto LABEL_22;
      }
      v32 = +[COSWatchView _screenCache];
      [v32 setObject:v18 forKey:v7];
    }
    else
    {
      v32 = +[COSWatchView _screenCache];
      v18 = [v32 objectForKey:v7];
    }

LABEL_22:
    goto LABEL_40;
  }
  watchFaceFilePath = self->_watchFaceFilePath;
  if (watchFaceFilePath)
  {
    v4 = watchFaceFilePath;
    goto LABEL_7;
  }
  if (self->_staticSnapShot)
  {
    [(COSWatchView *)self screenImageSize];
    double v20 = v19;
    double v22 = v21;
    staticSnapShot = self->_staticSnapShot;
    v24 = +[UIScreen mainScreen];
    [v24 scale];
    v18 = +[BPSThumbnailGenerator scaledImageForImage:desiredSize:scale:](BPSThumbnailGenerator, "scaledImageForImage:desiredSize:scale:", staticSnapShot, v20, v22, v25);

    goto LABEL_12;
  }
  associatedDevice = self->_associatedDevice;
  if (!associatedDevice)
  {
    v4 = 0;
LABEL_39:
    v18 = 0;
    goto LABEL_40;
  }
  v18 = [(NRDevice *)associatedDevice valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (!v18)
  {
LABEL_12:
    v4 = 0;
    goto LABEL_40;
  }
  v34 = +[NSFileManager defaultManager];
  id v60 = 0;
  v35 = [v34 contentsOfDirectoryAtPath:v18 error:&v60];
  id v36 = v60;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v37 = v35;
  id v38 = [v37 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v57;
LABEL_27:
    uint64_t v41 = 0;
    while (1)
    {
      if (*(void *)v57 != v40) {
        objc_enumerationMutation(v37);
      }
      v42 = *(void **)(*((void *)&v56 + 1) + 8 * v41);
      [v42 rangeOfString:@"ActiveWatchFace" options:8];
      if (v43) {
        break;
      }
      if (v39 == (id)++v41)
      {
        id v39 = [v37 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v39) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
    id v44 = v42;

    if (!v44) {
      goto LABEL_37;
    }
    v4 = [v18 stringByAppendingPathComponent:v44];
  }
  else
  {
LABEL_33:

    id v44 = 0;
LABEL_37:
    v4 = 0;
  }

  if (!v4) {
    goto LABEL_39;
  }
LABEL_7:
  BOOL v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v4];

  if (!v10) {
    goto LABEL_39;
  }
  unint64_t v11 = +[UIImage imageWithContentsOfFile:v4];
  [(COSWatchView *)self screenImageSize];
  if (!v11) {
    goto LABEL_39;
  }
  double v14 = v12;
  double v15 = v13;
  v16 = +[UIScreen mainScreen];
  [v16 scale];
  v18 = +[BPSThumbnailGenerator scaledImageForImage:desiredSize:scale:](BPSThumbnailGenerator, "scaledImageForImage:desiredSize:scale:", v11, v14, v15, v17);

LABEL_40:
  v45 = [(COSWatchView *)self watchScreenImageView];
  [v45 setImage:v18];

  [(COSWatchView *)self layoutWatchScreenImageView];
  unint64_t v46 = [(COSWatchView *)self deviceSize];
  if (v46 <= 0x15 && ((1 << v46) & 0x386000) != 0)
  {
    if ((v46 & 0xFFFFFFFFFFFFFFFELL) == 0x14 || v46 == 19) {
      double v48 = 18.0;
    }
    else {
      double v48 = 12.0;
    }
    v49 = [(COSWatchView *)self watchScreenImageView];
    v50 = [v49 layer];
    [v50 setCornerRadius:v48];

    v51 = [(COSWatchView *)self watchScreenImageView];
    v52 = v51;
    uint64_t v53 = 1;
  }
  else
  {
    v54 = [(COSWatchView *)self watchScreenImageView];
    v55 = [v54 layer];
    [v55 setCornerRadius:0.0];

    v51 = [(COSWatchView *)self watchScreenImageView];
    v52 = v51;
    uint64_t v53 = 0;
  }
  [v51 setClipsToBounds:v53];

  [(COSWatchView *)self setNeedsLayout];
  [(COSWatchView *)self applyScreenStyle];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COSWatchView;
  -[COSWatchView setUserInteractionEnabled:](&v6, "setUserInteractionEnabled:");
  double v5 = 0.5;
  if (v3) {
    double v5 = 1.0;
  }
  [(COSWatchView *)self setAlpha:v5];
}

- (NRDevice)associatedDevice
{
  return self->_associatedDevice;
}

- (unint64_t)screenStyle
{
  return self->_screenStyle;
}

- (UIImage)staticSnapShot
{
  return self->_staticSnapShot;
}

- (NSString)watchFaceFilePath
{
  return self->_watchFaceFilePath;
}

- (NTKLibrarySelectedFaceSnapshotProvider)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_watchFaceFilePath, 0);

  objc_storeStrong((id *)&self->_associatedDevice, 0);
}

@end