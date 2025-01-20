@interface BKFont
+ (id)_fontDescriptorLookupQueue;
+ (void)_lookupLocalizedNameForAttrs:(id)a3 withCompletion:(id)a4;
- (BOOL)continueDownloading;
- (BOOL)isAvailable;
- (BOOL)isDownloadable;
- (BOOL)isDownloading;
- (BOOL)isInstalled;
- (BOOL)isOriginalFont;
- (BOOL)isUnavailable;
- (NSString)description;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)fileExtension;
- (NSString)fileNamePrefix;
- (NSString)postscriptBoldName;
- (NSString)postscriptName;
- (NSString)systemName;
- (float)downloadProgress;
- (id)localizedName;
- (int)state;
- (unint64_t)kind;
- (unsigned)lastKnownState;
- (void)cancelDownload;
- (void)checkStateSynchronously:(BOOL)a3;
- (void)checkStateSynchronously:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)download;
- (void)downloadWithAllowCellular:(BOOL)a3;
- (void)registerFiles;
- (void)setContinueDownloading:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setFamilyName:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setFileNamePrefix:(id)a3;
- (void)setKind:(unint64_t)a3;
- (void)setLastKnownState:(unsigned int)a3;
- (void)setPostscriptBoldName:(id)a3;
- (void)setPostscriptName:(id)a3;
- (void)setState:(int)a3;
- (void)setSystemName:(id)a3;
- (void)unregisterFiles;
@end

@implementation BKFont

- (void)dealloc
{
  [(BKFont *)self unregisterFiles];
  v3.receiver = self;
  v3.super_class = (Class)BKFont;
  [(BKFont *)&v3 dealloc];
}

+ (id)_fontDescriptorLookupQueue
{
  if (qword_22B7E0 != -1) {
    dispatch_once(&qword_22B7E0, &stru_1DDE10);
  }
  v2 = (void *)qword_22B7D8;

  return v2;
}

- (NSString)displayName
{
  p_displayName = &self->_displayName;
  v4 = self->_displayName;
  if (v4) {
    goto LABEL_12;
  }
  unint64_t kind = self->_kind;
  if (kind == 3)
  {
    v6 = +[UIFont systemFontOfSize:17.0];
    goto LABEL_6;
  }
  if (kind == 4)
  {
    v6 = +[UIFont systemFontOfSize:kCTFontUIFontDesignSerif weight:17.0 design:UIFontWeightRegular];
LABEL_6:
    v7 = v6;
    if (v6)
    {
      v8 = (__CFString *)CTFontCopyName(v6, kCTFontMarketingNameKey);
      if (v8)
      {
        v9 = v8;
        objc_storeStrong((id *)p_displayName, v8);
        v4 = v9;
        CFRelease(v4);

        goto LABEL_12;
      }
    }
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  v4 = [(BKFont *)self localizedName];
  if (!v4)
  {
    v4 = [(BKFont *)self familyName];
  }
LABEL_12:

  return v4;
}

- (BOOL)isOriginalFont
{
  v2 = [(BKFont *)self familyName];
  unsigned __int8 v3 = [v2 isEqualToString:&stru_1DF0D8];

  return v3;
}

+ (void)_lookupLocalizedNameForAttrs:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() _fontDescriptorLookupQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_FFA34;
  v10[3] = &unk_1DB3F0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (id)localizedName
{
  localizedName = self->_localizedName;
  if (!localizedName)
  {
    v4 = [(BKFont *)self postscriptName];

    if (v4)
    {
      id v5 = [(BKFont *)self postscriptName];
      id v6 = &kCTFontNameAttribute;
    }
    else
    {
      id v5 = [(BKFont *)self familyName];
      id v6 = &kCTFontFamilyNameAttribute;
    }
    v7 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, *v6, 0);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_FFC80;
    v9[3] = &unk_1DDE38;
    v9[4] = self;
    [(id)objc_opt_class() _lookupLocalizedNameForAttrs:v7 withCompletion:v9];

    localizedName = self->_localizedName;
  }

  return localizedName;
}

- (NSString)postscriptBoldName
{
  postscriptBoldName = self->_postscriptBoldName;
  if (!postscriptBoldName)
  {
    v4 = [(BKFont *)self familyName];
    id v5 = +[NSMutableDictionary dictionaryWithObject:v4 forKey:kCTFontFamilyNameAttribute];

    id v6 = +[NSNumber numberWithInteger:2];
    v7 = +[NSDictionary dictionaryWithObject:v6 forKey:kCTFontSymbolicTrait];
    [v5 setObject:v7 forKey:kCTFontTraitsAttribute];

    id v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v5);
    if (!v8)
    {
LABEL_10:

      postscriptBoldName = self->_postscriptBoldName;
      goto LABEL_11;
    }
    id v9 = v8;
    v10 = CTFontCreateWithFontDescriptor(v8, 1.0, 0);
    if (v10)
    {
      id v11 = v10;
      CFStringRef v12 = CTFontCopyFamilyName(v10);
      v13 = [(BKFont *)self familyName];
      unsigned __int8 v14 = [v13 isEqualToString:v12];

      CFRelease(v12);
      if (v14)
      {
LABEL_8:
        v19 = (__CFString *)CTFontCopyName(v11, kCTFontPostScriptNameKey);
        v20 = self->_postscriptBoldName;
        self->_postscriptBoldName = &v19->isa;

        CFRelease(v11);
LABEL_9:
        CFRelease(v9);
        goto LABEL_10;
      }
      CFRelease(v11);
    }
    v15 = +[NSNumber numberWithFloat:0.0];
    v16 = +[NSDictionary dictionaryWithObject:v15 forKey:kCTFontSlantTrait];
    [v5 setObject:v16 forKey:kCTFontTraitsAttribute];

    v17 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v5);
    if (!v17) {
      goto LABEL_9;
    }
    v18 = v17;
    id v11 = CTFontCreateWithFontDescriptor(v17, 1.0, 0);
    CFRelease(v18);
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_11:

  return postscriptBoldName;
}

- (void)registerFiles
{
  if (!self->_registeredFiles)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = +[NSBundle mainBundle];
    id v5 = [(BKFont *)self fileExtension];
    id v6 = [v4 URLsForResourcesWithExtension:v5 subdirectory:0];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v22;
      *(void *)&long long v9 = 138543362;
      long long v20 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned __int8 v14 = [v13 lastPathComponent:v20];
          v15 = [(BKFont *)self fileNamePrefix];
          unsigned int v16 = [v14 hasPrefix:v15];

          if (v16)
          {
            if (CTFontManagerRegisterFontsForURL((CFURLRef)v13, kCTFontManagerScopeProcess, 0))
            {
              [v3 addObject:v13];
            }
            else
            {
              v17 = _AEBookPluginsFontCacheLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                v26 = v13;
                _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "-[BKFont registerFiles:] could not register %{public}@", buf, 0xCu);
              }
            }
          }
        }
        id v10 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }

    v18 = (NSArray *)[v3 copy];
    registeredFiles = self->_registeredFiles;
    self->_registeredFiles = v18;
  }
}

- (void)unregisterFiles
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_registeredFiles;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CTFontManagerUnregisterFontsForURL(*(CFURLRef *)(*((void *)&v9 + 1) + 8 * (void)v7), kCTFontManagerScopeProcess, 0);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  registeredFiles = self->_registeredFiles;
  self->_registeredFiles = 0;
}

- (BOOL)isInstalled
{
  unint64_t v3 = [(BKFont *)self kind];
  if (v3 - 1 < 4) {
    return 1;
  }
  if (v3) {
    return 0;
  }
  uint64_t v6 = [(BKFont *)self familyName];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, kCTFontNameAttribute, 0);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  id v8 = CTFontDescriptorCreateWithAttributes(v7);
  if (v8)
  {
    long long v9 = v8;
    CTFontDescriptorRef MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v8, 0);
    BOOL v4 = MatchingFontDescriptor != 0;
    if (MatchingFontDescriptor) {
      CFRelease(MatchingFontDescriptor);
    }
    CFRelease(v9);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isAvailable
{
  return [(BKFont *)self state] == 1;
}

- (BOOL)isUnavailable
{
  return [(BKFont *)self state] == 4;
}

- (BOOL)isDownloading
{
  return [(BKFont *)self state] == 3;
}

- (BOOL)isDownloadable
{
  return [(BKFont *)self state] == 2;
}

- (void)checkStateSynchronously:(BOOL)a3
{
}

- (void)checkStateSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if ((char *)[(BKFont *)self kind] - 1 > (unsigned char *)&dword_0 + 3)
  {
    long long v9 = [(BKFont *)self familyName];
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, kCTFontFamilyNameAttribute, 0);
    CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CTFontDescriptorRef v10 = CTFontDescriptorCreateWithAttributes(v8);
    if (v10)
    {
      CTFontDescriptorRef v11 = v10;
      long long v12 = +[NSMutableArray arrayWithObject:v10];
      [v12 addObject:v11];
      CFRelease(v11);
      if (v6 || v4)
      {
        v13 = dispatch_group_create();
        dispatch_group_enter(v13);
        if (v6)
        {
          unsigned __int8 v14 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1006DC;
          block[3] = &unk_1DADC0;
          long long v22 = v6;
          dispatch_group_notify(v13, v14, block);
        }
      }
      else
      {
        v13 = 0;
      }
      v15 = [(__CFDictionary *)v8 allKeys];
      CFSetRef v16 = +[NSSet setWithArray:v15];
      progressBlock[0] = _NSConcreteStackBlock;
      progressBlock[1] = 3221225472;
      progressBlock[2] = sub_1006EC;
      progressBlock[3] = &unk_1DDE60;
      progressBlock[4] = self;
      v17 = v13;
      long long v20 = v17;
      CTFontDescriptorMatchFontDescriptorsWithProgressHandler((CFArrayRef)v12, v16, progressBlock);

      if (v4)
      {
        dispatch_time_t v18 = dispatch_time(0, 2000000000);
        if (dispatch_group_wait(v17, v18)) {
          dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, &stru_1DDE80);
        }
      }
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
  else
  {
    [(BKFont *)self setState:1];
    CFDictionaryRef v7 = objc_retainBlock(v6);
    CFDictionaryRef v8 = v7;
    if (v7) {
      (*((void (**)(const __CFDictionary *))v7 + 2))(v7);
    }
  }
}

- (void)download
{
}

- (void)downloadWithAllowCellular:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKFont *)self familyName];
  uint64_t v6 = +[NSNumber numberWithBool:v3];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kCTFontFamilyNameAttribute, v6, kCTFontAllowCellularDownloadAttribute, 0);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFDictionaryRef v8 = +[NSMutableArray arrayWithCapacity:0];
  CTFontDescriptorRef v9 = CTFontDescriptorCreateWithAttributes(v7);
  if (v9)
  {
    CTFontDescriptorRef v10 = v9;
    [v8 addObject:v9];
    CFRelease(v10);
    unsigned int v11 = [(BKFont *)self state];
    [(BKFont *)self setState:3];
    [(BKFont *)self setContinueDownloading:1];
    if ([(BKFont *)self state] != v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100C6C;
      v17[3] = &unk_1DAB88;
      v17[4] = self;
      long long v12 = objc_retainBlock(v17);
      if (v12)
      {
        if (+[NSThread isMainThread])
        {
          ((void (*)(void *))v12[2])(v12);
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100CD0;
          block[3] = &unk_1DADC0;
          CFSetRef v16 = v12;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
    progressBlock[0] = _NSConcreteStackBlock;
    progressBlock[1] = 3221225472;
    progressBlock[2] = sub_100CE0;
    progressBlock[3] = &unk_1DDEA8;
    progressBlock[4] = self;
    unsigned int v14 = v11;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((CFArrayRef)v8, 0, progressBlock);
  }
}

- (void)cancelDownload
{
  [(BKFont *)self setContinueDownloading:0];
  if ([(BKFont *)self state] == 3)
  {
    [(BKFont *)self setState:2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_101400;
    v6[3] = &unk_1DAB88;
    v6[4] = self;
    BOOL v3 = objc_retainBlock(v6);
    if (v3)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v3[2])(v3);
      }
      else
      {
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 3221225472;
        v4[2] = sub_101464;
        v4[3] = &unk_1DADC0;
        id v5 = v3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
      }
    }
  }
}

- (NSString)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  id v5 = NSStringFromBKFontKind([(BKFont *)self kind]);
  unsigned int v6 = [(BKFont *)self state] - 1;
  if (v6 > 3) {
    CFStringRef v7 = @"Unknown";
  }
  else {
    CFStringRef v7 = off_1DDF30[v6];
  }
  CFDictionaryRef v8 = [(BKFont *)self systemName];
  CTFontDescriptorRef v9 = [(BKFont *)self familyName];
  CTFontDescriptorRef v10 = [(BKFont *)self displayName];
  unsigned int v11 = [(BKFont *)self postscriptName];
  long long v12 = [(BKFont *)self postscriptBoldName];
  v13 = +[NSString stringWithFormat:@"<%@: %p> kind: %@, state: %@, systemName: %@, familyName: %@, displayName: %@, postscriptName: %@, postscriptBoldName: %@", v4, self, v5, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)postscriptName
{
  return self->_postscriptName;
}

- (void)setPostscriptName:(id)a3
{
}

- (void)setPostscriptBoldName:(id)a3
{
}

- (NSString)fileNamePrefix
{
  return self->_fileNamePrefix;
}

- (void)setFileNamePrefix:(id)a3
{
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)continueDownloading
{
  return self->_continueDownloading;
}

- (void)setContinueDownloading:(BOOL)a3
{
  self->_continueDownloading = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_unint64_t kind = a3;
}

- (unsigned)lastKnownState
{
  return self->_lastKnownState;
}

- (void)setLastKnownState:(unsigned int)a3
{
  self->_lastKnownState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredFiles, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_fileNamePrefix, 0);
  objc_storeStrong((id *)&self->_postscriptBoldName, 0);
  objc_storeStrong((id *)&self->_postscriptName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);

  objc_storeStrong((id *)&self->_systemName, 0);
}

@end