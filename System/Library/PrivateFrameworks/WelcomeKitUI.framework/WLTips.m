@interface WLTips
+ (BOOL)download;
+ (id)tips;
- (NSString)desc;
- (NSString)title;
- (WLInterfaceStyleAsset)image;
- (WLInterfaceStyleAsset)thumbnail;
- (WLInterfaceStyleAsset)video;
- (WLTips)initWithTitle:(id)a3 desc:(id)a4 thumbnail:(id)a5 image:(id)a6 video:(id)a7;
- (void)setDesc:(id)a3;
- (void)setImage:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVideo:(id)a3;
@end

@implementation WLTips

- (WLTips)initWithTitle:(id)a3 desc:(id)a4 thumbnail:(id)a5 image:(id)a6 video:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)WLTips;
  v17 = [(WLTips *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(WLTips *)v17 setTitle:v12];
    [(WLTips *)v18 setDesc:v13];
    [(WLTips *)v18 setThumbnail:v14];
    [(WLTips *)v18 setImage:v15];
    [(WLTips *)v18 setVideo:v16];
  }

  return v18;
}

+ (id)tips
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  BOOL v4 = +[WLDeviceCapability hasHomeButton];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = v5;
  if (v3)
  {
    if (v4) {
      v7 = @"IPAD_HOME_BUTTON";
    }
    else {
      v7 = @"IPAD_NO_HOME_BUTTON";
    }
    v8 = @"3Z";
    if (v4) {
      v8 = @"4Z";
    }
    v37 = v8;
    v38 = v7;
    [v5 addObject:@"GoHome"];
    [v6 addObject:@"AppSwitcher"];
    [v6 addObject:@"ControlCenter"];
    [v6 addObject:@"TouchAndHold"];
    [v6 addObject:@"NotificationCenter"];
  }
  else
  {
    if (v4) {
      v9 = @"IPHONE_HOME_BUTTON";
    }
    else {
      v9 = @"IPHONE_NO_HOME_BUTTON";
    }
    v10 = @"1V";
    if (v4) {
      v10 = @"2Y";
    }
    v37 = v10;
    v38 = v9;
    if (!+[WLDeviceCapability hasHomeButton]) {
      [v6 addObject:@"GoHome"];
    }
    if (+[WLDeviceCapability hasDynamicIsland]) {
      [v6 addObject:@"DynamicIsland"];
    }
    [v6 addObject:@"AppSwitcher"];
    [v6 addObject:@"ControlCenter"];
    [v6 addObject:@"TouchAndHold"];
    [v6 addObject:@"NotificationCenter"];
    if (+[WLDeviceCapability hasActionButton])
    {
      v11 = @"SilentModeActionButton";
      goto LABEL_20;
    }
  }
  v11 = @"SilentMode";
LABEL_20:
  [v6 addObject:v11];
  [v6 addObject:@"Screenshot"];
  v39 = +[WLTipAssetRemoteDocumentIdentifier documentIDs];
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v6;
  uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v41)
  {
    uint64_t v36 = *(void *)v62;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v62 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v12;
        id v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
        id v14 = NSString;
        id v15 = [v13 uppercaseString];
        id v16 = [v14 stringWithFormat:@"TIPS_%@_TITLE", v15];
        v59 = WLLocalizedString();

        v17 = NSString;
        v18 = [v13 uppercaseString];
        v19 = [v17 stringWithFormat:@"TIPS_%@_DESCRIPTION_%@", v18, v38];
        v52 = WLLocalizedString();

        v58 = [NSString stringWithFormat:@"%@-%@~%@_T.png", v13, v37, @"L"];
        v54 = [NSString stringWithFormat:@"%@-%@~%@.jpg", v13, v37, @"L"];
        v53 = [NSString stringWithFormat:@"%@-%@~%@.mp4", v13, v37, @"L"];
        uint64_t v20 = [NSString stringWithFormat:@"%@-%@~%@_T.png", v13, v37, @"D"];
        v57 = [NSString stringWithFormat:@"%@-%@~%@.jpg", v13, v37, @"D"];
        uint64_t v21 = [NSString stringWithFormat:@"%@-%@~%@.mp4", v13, v37, @"D"];
        v22 = [v39 objectForKeyedSubscript:v58];
        v50 = +[WLTipAssetRemoteDocumentIdentifier url:v22];

        v51 = (void *)v20;
        v23 = [v39 objectForKeyedSubscript:v20];
        v49 = +[WLTipAssetRemoteDocumentIdentifier url:v23];

        v24 = [v39 objectForKeyedSubscript:v54];
        v56 = +[WLTipAssetRemoteDocumentIdentifier url:v24];

        v25 = [v39 objectForKeyedSubscript:v57];
        v55 = +[WLTipAssetRemoteDocumentIdentifier url:v25];

        v26 = [v39 objectForKeyedSubscript:v53];
        v46 = +[WLTipAssetRemoteDocumentIdentifier url:v26];

        v44 = (void *)v21;
        v27 = [v39 objectForKeyedSubscript:v21];
        v45 = +[WLTipAssetRemoteDocumentIdentifier url:v27];

        v48 = [[WLAsset alloc] initWithName:v58 remoteURL:v50];
        v47 = [[WLAsset alloc] initWithName:v20 remoteURL:v49];
        v42 = [[WLInterfaceStyleAsset alloc] initWithLight:v48 dark:v47];
        v43 = [[WLAsset alloc] initWithName:v54 remoteURL:v56];
        v28 = [[WLAsset alloc] initWithName:v57 remoteURL:v55];
        v29 = [[WLInterfaceStyleAsset alloc] initWithLight:v43 dark:v28];
        v30 = [[WLAsset alloc] initWithName:v53 remoteURL:v46];
        v31 = [[WLAsset alloc] initWithName:v21 remoteURL:v45];
        v32 = [[WLInterfaceStyleAsset alloc] initWithLight:v30 dark:v31];
        v33 = [[WLTips alloc] initWithTitle:v59 desc:v52 thumbnail:v42 image:v29 video:v32];
        [v40 addObject:v33];

        uint64_t v12 = v60 + 1;
      }
      while (v41 != v60 + 1);
      uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v41);
  }

  return v40;
}

+ (BOOL)download
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  +[WLTips tips];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v3)
  {
    BOOL v4 = 0;
    uint64_t v5 = *(void *)v54;
    unint64_t v6 = 0x263EFF000uLL;
    do
    {
      uint64_t v7 = 0;
      uint64_t v40 = v3;
      do
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v42 = v7;
        v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v9 = [v8 thumbnail];
        v59[0] = v9;
        v10 = [v8 image];
        v59[1] = v10;
        v11 = [v8 video];
        v59[2] = v11;
        uint64_t v12 = [*(id *)(v6 + 2240) arrayWithObjects:v59 count:3];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v50;
          id v41 = v2;
          uint64_t v37 = *(void *)v50;
          uint64_t v38 = v5;
          v44 = v12;
          while (2)
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v43 = v16;
              v17 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              v18 = [v17 light];
              v57[0] = v18;
              v19 = [v17 dark];
              v57[1] = v19;
              uint64_t v20 = [*(id *)(v6 + 2240) arrayWithObjects:v57 count:2];

              uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v58 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v39 = v14;
                uint64_t v23 = *(void *)v46;
                while (2)
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v46 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    v26 = objc_msgSend(v25, "name", v32, v33, v34, v36);
                    v27 = [v25 remoteURL];
                    v35 = [v25 localFile];
                    _WLLog();

                    unsigned int v28 = objc_msgSend(v25, "download", v26, v27, v35);
                    v29 = [v25 name];
                    v30 = [v25 remoteURL];
                    v34 = [v25 localFile];
                    uint64_t v36 = v28;
                    v32 = v29;
                    v33 = v30;
                    _WLLog();

                    if ((v28 & 1) == 0)
                    {

                      id v2 = v41;
                      goto LABEL_29;
                    }
                  }
                  uint64_t v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v58, 16, v29, v30, v34, v28);
                  if (v22) {
                    continue;
                  }
                  break;
                }

                id v2 = v41;
                uint64_t v15 = v37;
                uint64_t v5 = v38;
                unint64_t v6 = 0x263EFF000;
                uint64_t v14 = v39;
              }
              else
              {

                if (!v4)
                {
LABEL_29:

                  goto LABEL_30;
                }
              }
              uint64_t v12 = v44;
              uint64_t v16 = v43 + 1;
              BOOL v4 = 1;
            }
            while (v43 + 1 != v14);
            uint64_t v14 = [v44 countByEnumeratingWithState:&v49 objects:v60 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
        else
        {

          if (!v4) {
            goto LABEL_30;
          }
        }
        uint64_t v7 = v42 + 1;
        BOOL v4 = 1;
      }
      while (v42 + 1 != v40);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v3);
  }
  else
  {
LABEL_30:
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
}

- (WLInterfaceStyleAsset)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (WLInterfaceStyleAsset)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (WLInterfaceStyleAsset)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end