@interface SWConfiguration
+ (id)configurationWithContainerConfiguration:(id)a3;
- (BOOL)is24HourTime;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)isTransitioning;
- (BOOL)supportsLiveActivities;
- (CGRect)contentFrame;
- (CGSize)canvasSize;
- (NSDictionary)dataSources;
- (NSLocale)locale;
- (NSString)appVersion;
- (NSString)contentEnvironment;
- (NSString)contentSizeCategory;
- (NSString)identifier;
- (NSString)storeFront;
- (NSString)systemVersion;
- (NSURL)activePictureInPictureURL;
- (NSURL)sourceURL;
- (SWConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14 keyboardConfiguration:(id)a15 networkStatus:(int64_t)a16 isTransitioning:(BOOL)a17;
- (SWFeedConfiguration)feedConfiguration;
- (SWKeyboardConfiguration)keyboardConfiguration;
- (SWLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)networkStatus;
- (void)setActivePictureInPictureURL:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContentEnvironment:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setFeedConfiguration:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIs24HourTime:(BOOL)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setKeyboardConfiguration:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setSourceURL:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setSupportsLiveActivities:(BOOL)a3;
- (void)setSystemVersion:(id)a3;
@end

@implementation SWConfiguration

+ (id)configurationWithContainerConfiguration:(id)a3
{
  id v3 = a3;
  v30 = [SWConfiguration alloc];
  v29 = [v3 storeFront];
  v4 = [v3 locale];
  v5 = [v3 contentEnvironment];
  v6 = [v3 contentSizeCategory];
  [v3 canvasSize];
  double v8 = v7;
  double v10 = v9;
  [v3 contentFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [v3 dataSources];
  v20 = [v3 location];
  v21 = [v3 sourceURL];
  v22 = [v3 activePictureInPictureURL];
  v23 = [v3 feedConfiguration];
  char v24 = [v3 supportsLiveActivities];

  LOBYTE(v28) = 0;
  LOBYTE(v27) = v24;
  v25 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v30, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v29, v4, v5, v6, v19, v20, v8, v10, v12, v14, v16, v18, v21, v22, v23,
          v27,
          0,
          0,
          v28);

  return v25;
}

- (SWConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14 keyboardConfiguration:(id)a15 networkStatus:(int64_t)a16 isTransitioning:(BOOL)a17
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  double v26 = a7.height;
  double v27 = a7.width;
  id v56 = a3;
  id v29 = a4;
  id v57 = a5;
  id v30 = a6;
  id v31 = a9;
  id v32 = a10;
  id v33 = a11;
  id v34 = a12;
  id v35 = a13;
  id v36 = a15;
  v58.receiver = self;
  v58.super_class = (Class)SWConfiguration;
  v37 = [(SWConfiguration *)&v58 init];
  if (v37)
  {
    id v54 = v36;
    v38 = [MEMORY[0x263F08C38] UUID];
    [v38 UUIDString];
    v39 = id v55 = v30;
    [(SWConfiguration *)v37 setIdentifier:v39];

    [(SWConfiguration *)v37 setStoreFront:v56];
    [(SWConfiguration *)v37 setLocale:v29];
    [(SWConfiguration *)v37 setContentEnvironment:v57];
    [(SWConfiguration *)v37 setContentSizeCategory:v55];
    -[SWConfiguration setCanvasSize:](v37, "setCanvasSize:", v27, v26);
    -[SWConfiguration setContentFrame:](v37, "setContentFrame:", x, y, width, height);
    id v53 = v31;
    [(SWConfiguration *)v37 setDataSources:v31];
    [(SWConfiguration *)v37 setLocation:v32];
    [(SWConfiguration *)v37 setSourceURL:v33];
    [(SWConfiguration *)v37 setActivePictureInPictureURL:v34];
    [(SWConfiguration *)v37 setFeedConfiguration:v35];
    [(SWConfiguration *)v37 setSupportsLiveActivities:a14];
    v40 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"j" options:0 locale:v29];
    id v52 = v29;
    id v41 = v32;
    if ([v40 containsString:@"H"]) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = [v40 containsString:@"k"];
    }

    [(SWConfiguration *)v37 setIs24HourTime:v42];
    [(SWConfiguration *)v37 setKeyboardConfiguration:v36];
    [(SWConfiguration *)v37 setNetworkStatus:a16];
    [(SWConfiguration *)v37 setIsTransitioning:a17];
    v43 = NSString;
    v44 = [MEMORY[0x263F1C5C0] currentDevice];
    v45 = [v44 systemName];
    v46 = [MEMORY[0x263F1C5C0] currentDevice];
    v47 = [v46 systemVersion];
    v48 = [v43 stringWithFormat:@"%@ %@", v45, v47];
    [(SWConfiguration *)v37 setSystemVersion:v48];

    id v36 = v54;
    v49 = [MEMORY[0x263F086E0] mainBundle];
    v50 = [v49 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [(SWConfiguration *)v37 setAppVersion:v50];

    id v30 = v55;
    id v32 = v41;
    id v29 = v52;
    id v31 = v53;
  }

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v30 = [SWConfiguration alloc];
  v4 = [(SWConfiguration *)self storeFront];
  v5 = [(SWConfiguration *)self locale];
  v6 = [(SWConfiguration *)self contentEnvironment];
  id v33 = [(SWConfiguration *)self contentSizeCategory];
  [(SWConfiguration *)self canvasSize];
  double v8 = v7;
  double v10 = v9;
  [(SWConfiguration *)self contentFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v32 = [(SWConfiguration *)self dataSources];
  id v29 = [(SWConfiguration *)self location];
  uint64_t v28 = [(SWConfiguration *)self sourceURL];
  v19 = [(SWConfiguration *)self activePictureInPictureURL];
  v20 = [(SWConfiguration *)self feedConfiguration];
  BOOL v21 = [(SWConfiguration *)self supportsLiveActivities];
  v22 = [(SWConfiguration *)self keyboardConfiguration];
  int64_t v23 = [(SWConfiguration *)self networkStatus];
  LOBYTE(v27) = [(SWConfiguration *)self isTransitioning];
  LOBYTE(v26) = v21;
  id v31 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v30, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v4, v5, v6, v33, v32, v29, v8, v10, v12, v14, v16, v18, v28, v19, v20,
          v26,
          v22,
          v23,
          v27);

  char v24 = [(SWConfiguration *)self identifier];
  [(SWConfiguration *)v31 setIdentifier:v24];

  return v31;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SWMutableConfiguration alloc];
  v5 = [(SWConfiguration *)self storeFront];
  id v32 = [(SWConfiguration *)self locale];
  v6 = [(SWConfiguration *)self contentEnvironment];
  id v31 = [(SWConfiguration *)self contentSizeCategory];
  [(SWConfiguration *)self canvasSize];
  double v8 = v7;
  double v10 = v9;
  [(SWConfiguration *)self contentFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v30 = [(SWConfiguration *)self dataSources];
  id v29 = [(SWConfiguration *)self location];
  v19 = [(SWConfiguration *)self sourceURL];
  v20 = [(SWConfiguration *)self activePictureInPictureURL];
  BOOL v21 = [(SWConfiguration *)self feedConfiguration];
  BOOL v22 = [(SWConfiguration *)self supportsLiveActivities];
  int64_t v23 = [(SWConfiguration *)self keyboardConfiguration];
  int64_t v24 = [(SWConfiguration *)self networkStatus];
  LOBYTE(v27) = [(SWConfiguration *)self isTransitioning];
  LOBYTE(v26) = v22;
  uint64_t v28 = -[SWConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:](v4, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v5, v32, v6, v31, v30, v29, v8, v10, v12, v14, v16, v18, v19, v20, v21,
          v26,
          v23,
          v24,
          v27);

  return v28;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SWConfiguration *)self storeFront];
  id v6 = [v4 storeFront];
  if (v5 == v6)
  {

LABEL_5:
    id v9 = [(SWConfiguration *)self locale];
    id v10 = [v4 locale];
    if (v9 == v10)
    {
    }
    else
    {
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        LOBYTE(v8) = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    id v12 = [(SWConfiguration *)self contentEnvironment];
    id v13 = [v4 contentEnvironment];
    if (v12 == v13)
    {
    }
    else
    {
      int v8 = [v12 isEqualToString:v13];

      if (!v8) {
        goto LABEL_60;
      }
    }
    id v14 = [(SWConfiguration *)self contentSizeCategory];
    id v15 = [v4 contentSizeCategory];
    v89 = v14;
    if (v14 == v15)
    {
    }
    else
    {
      int v8 = [v14 isEqualToString:v15];

      if (!v8) {
        goto LABEL_59;
      }
    }
    [(SWConfiguration *)self canvasSize];
    double v17 = v16;
    double v19 = v18;
    [v4 canvasSize];
    LOBYTE(v8) = 0;
    if (v17 != v21 || v19 != v20) {
      goto LABEL_59;
    }
    [(SWConfiguration *)self contentFrame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    [v4 contentFrame];
    v91.origin.double x = v30;
    v91.origin.double y = v31;
    v91.size.double width = v32;
    v91.size.double height = v33;
    v90.origin.double x = v23;
    v90.origin.double y = v25;
    v90.size.double width = v27;
    v90.size.double height = v29;
    if (!CGRectEqualToRect(v90, v91))
    {
      LOBYTE(v8) = 0;
LABEL_59:

LABEL_60:
      goto LABEL_61;
    }
    id v34 = [(SWConfiguration *)self dataSources];
    id v35 = [v4 dataSources];
    v87 = v35;
    v88 = v34;
    if (v34 == v35)
    {
    }
    else
    {
      id v36 = v35;
      v37 = v34;
      v38 = v36;
      int v85 = [v37 isEqualToDictionary:v36];

      if (!v85)
      {
        LOBYTE(v8) = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    id v39 = [(SWConfiguration *)self location];
    id v40 = [v4 location];
    v84 = v40;
    v86 = v39;
    if (v39 == v40)
    {
    }
    else
    {
      id v41 = v40;
      uint64_t v42 = v39;
      v43 = v41;
      int v82 = [v42 isEqual:v41];

      if (!v82)
      {
        LOBYTE(v8) = 0;
LABEL_57:

        goto LABEL_58;
      }
    }
    id v44 = [(SWConfiguration *)self sourceURL];
    id v45 = [v4 sourceURL];
    v81 = v45;
    v83 = v44;
    if (v44 == v45)
    {
    }
    else
    {
      id v46 = v45;
      v47 = v44;
      v48 = v46;
      int v79 = [v47 isEqual:v46];

      if (!v79)
      {
        LOBYTE(v8) = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    v49 = [(SWConfiguration *)self systemVersion];
    [v4 systemVersion];
    v80 = v78 = v49;
    if (!objc_msgSend(v49, "isEqualToString:"))
    {
      LOBYTE(v8) = 0;
      id v56 = v78;
LABEL_55:

      goto LABEL_56;
    }
    v50 = [(SWConfiguration *)self appVersion];
    v76 = [v4 appVersion];
    v77 = v50;
    if (!objc_msgSend(v50, "isEqualToString:"))
    {
      LOBYTE(v8) = 0;
      id v56 = v78;
LABEL_54:

      goto LABEL_55;
    }
    id v51 = [(SWConfiguration *)self activePictureInPictureURL];
    id v52 = [v4 activePictureInPictureURL];
    v74 = v52;
    v75 = v51;
    if (v51 == v52)
    {
    }
    else
    {
      id v53 = v52;
      id v54 = v51;
      id v55 = v53;
      int v72 = [v54 isEqual:v53];

      if (!v72)
      {
        LOBYTE(v8) = 0;
        id v56 = v78;
LABEL_53:

        goto LABEL_54;
      }
    }
    id v57 = [(SWConfiguration *)self feedConfiguration];
    id v58 = [v4 feedConfiguration];
    v71 = v58;
    v73 = v57;
    if (v57 == v58)
    {
    }
    else
    {
      id v59 = v58;
      v60 = v57;
      v61 = v59;
      int v69 = [v60 isEqual:v59];

      if (!v69) {
        goto LABEL_46;
      }
    }
    int v62 = [(SWConfiguration *)self supportsLiveActivities];
    if (v62 == [v4 supportsLiveActivities])
    {
      v63 = [(SWConfiguration *)self keyboardConfiguration];
      v68 = [v4 keyboardConfiguration];
      v70 = v63;
      if (objc_msgSend(v63, "isEqual:")
        && (int64_t v64 = -[SWConfiguration networkStatus](self, "networkStatus"), v64 == [v4 networkStatus])
        && (int v65 = [(SWConfiguration *)self is24HourTime],
            v65 == [v4 is24HourTime]))
      {
        BOOL v67 = [(SWConfiguration *)self isTransitioning];
        int v8 = v67 ^ [v4 isTransitioning] ^ 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }

      goto LABEL_52;
    }
LABEL_46:
    LOBYTE(v8) = 0;
LABEL_52:
    id v56 = v78;

    goto LABEL_53;
  }
  int v7 = [v5 isEqualToString:v6];

  if (v7) {
    goto LABEL_5;
  }
  LOBYTE(v8) = 0;
LABEL_62:

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  uint64_t v4 = [(SWConfiguration *)self storeFront];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26D81E068;
  }
  [v3 appendFormat:@"; storeFront: %@", v6];

  int v7 = [(SWConfiguration *)self locale];
  [v3 appendFormat:@"; locale: %@", v7];

  uint64_t v8 = [(SWConfiguration *)self contentEnvironment];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26D81E068;
  }
  [v3 appendFormat:@"; contentEnvironment: %@", v10];

  int v11 = [(SWConfiguration *)self contentSizeCategory];
  [v3 appendFormat:@"; contentSizeCategory: %@", v11];

  [(SWConfiguration *)self canvasSize];
  id v12 = NSStringFromCGSize(v24);
  [v3 appendFormat:@"; canvasSize: %@", v12];

  [(SWConfiguration *)self contentFrame];
  id v13 = NSStringFromCGRect(v25);
  [v3 appendFormat:@"; contentFrame: %@", v13];

  id v14 = [(SWConfiguration *)self dataSources];
  [v3 appendFormat:@"; dataSources: %@", v14];

  id v15 = [(SWConfiguration *)self location];
  [v3 appendFormat:@"; location: %@", v15];

  double v16 = [(SWConfiguration *)self sourceURL];
  [v3 appendFormat:@"; sourceURL: %@", v16];

  double v17 = [(SWConfiguration *)self systemVersion];
  [v3 appendFormat:@"; systemVersion: %@", v17];

  double v18 = [(SWConfiguration *)self appVersion];
  [v3 appendFormat:@"; appVersion: %@", v18];

  double v19 = [(SWConfiguration *)self activePictureInPictureURL];
  [v3 appendFormat:@"; activePictureInPictureURL: %@", v19];

  double v20 = [(SWConfiguration *)self feedConfiguration];
  [v3 appendFormat:@"; feedConfiguration: %@", v20];

  objc_msgSend(v3, "appendFormat:", @"; supportsLiveActivities: %d",
    [(SWConfiguration *)self supportsLiveActivities]);
  double v21 = [(SWConfiguration *)self keyboardConfiguration];
  [v3 appendFormat:@"; keyboardConfiguration: %@", v21];

  objc_msgSend(v3, "appendFormat:", @"; networkStatus: %d",
    [(SWConfiguration *)self networkStatus]);
  objc_msgSend(v3, "appendFormat:", @"; is24HourTime: %d", -[SWConfiguration is24HourTime](self, "is24HourTime"));
  objc_msgSend(v3, "appendFormat:", @"; isTransitioning: %d",
    [(SWConfiguration *)self isTransitioning]);
  [v3 appendString:@">"];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
}

- (BOOL)is24HourTime
{
  return self->_is24HourTime;
}

- (void)setIs24HourTime:(BOOL)a3
{
  self->_is24HourTime = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (SWLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSURL)activePictureInPictureURL
{
  return self->_activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
}

- (BOOL)supportsLiveActivities
{
  return self->_supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->_supportsLiveActivities = a3;
}

- (SWKeyboardConfiguration)keyboardConfiguration
{
  return self->_keyboardConfiguration;
}

- (void)setKeyboardConfiguration:(id)a3
{
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end