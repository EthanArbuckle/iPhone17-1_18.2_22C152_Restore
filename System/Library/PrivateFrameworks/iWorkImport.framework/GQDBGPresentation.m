@interface GQDBGPresentation
+ (_xmlNs)appNamespace;
+ (id)parseNumberOutOfBasename:(id)a3 returningNumber:(int *)a4;
+ (void)initialize;
- (CGSize)slideSize;
- (GQDBGPresentation)init;
- (__CFArray)themes;
- (__CFString)createUpgradedAppBundleResourcePath:(__CFString *)a3 processorBundle:(__CFBundle *)a4;
- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5;
- (id)colorForMissingAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4;
- (void)addTheme:(id)a3;
- (void)dealloc;
- (void)initializeAppBundleResourcesUrl:(__CFURL *)a3;
- (void)loadAppBundleResourceToColorMap;
@end

@implementation GQDBGPresentation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_class();
    +[GQDClassNameMap registerClass:objc_opt_class() forName:"title-placeholder" inRootType:v2];
    +[GQDClassNameMap registerClass:objc_opt_class() forName:"body-placeholder" inRootType:v2];
    +[GQDClassNameMap registerClass:objc_opt_class() forName:"object-placeholder" inRootType:v2];
    +[GQDClassNameMap registerClass:objc_opt_class() forName:"slide-number-placeholder" inRootType:v2];
    uint64_t v3 = objc_opt_class();
    +[GQDClassNameMap registerClass:v3 forName:"gizmo" inRootType:v2];
  }
}

- (GQDBGPresentation)init
{
  v4.receiver = self;
  v4.super_class = (Class)GQDBGPresentation;
  uint64_t v2 = [(GQDRoot *)&v4 init];
  if (v2) {
    v2->mThemes = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  }
  return v2;
}

+ (_xmlNs)appNamespace
{
  return (_xmlNs *)qword_A35F8;
}

- (void)dealloc
{
  mThemes = self->mThemes;
  if (mThemes) {
    CFRelease(mThemes);
  }
  mOldAssetNameMap = self->super.mOldAssetNameMap;
  if (mOldAssetNameMap) {
    CFRelease(mOldAssetNameMap);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDBGPresentation;
  [(GQDRoot *)&v5 dealloc];
}

- (__CFArray)themes
{
  return self->mThemes;
}

- (void)addTheme:(id)a3
{
}

- (CGSize)slideSize
{
  double width = self->mSlideSize.width;
  double height = self->mSlideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)loadAppBundleResourceToColorMap
{
  if (!self->super.mAppBundleColorMapLoaded)
  {
    id v15 = objc_alloc_init((Class)NSAutoreleasePool);
    self->super.mAppBundleResourceToColorMap = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v5 = [(NSBundle *)v4 pathForResource:@"KeySharedAssetColors" ofType:@"plist"];
    if (v5)
    {
      id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v5];
      [(__CFDictionary *)Mutable addEntriesFromDictionary:v6];
    }
    v7 = [(NSBundle *)v4 pathForResource:@"KeyLegacyAssetColors" ofType:@"plist"];
    if (v7)
    {
      id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v7];
      [(__CFDictionary *)Mutable addEntriesFromDictionary:v8];
    }
    v9 = [(NSBundle *)v4 pathForResource:@"ChartFillAssetColors" ofType:@"plist"];
    if (v9)
    {
      id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v9];
      [(__CFDictionary *)Mutable addEntriesFromDictionary:v10];
    }
    id v11 = [(__CFDictionary *)Mutable keyEnumerator];
    id v12 = [v11 nextObject];
    if (v12)
    {
      id v13 = v12;
      do
      {
        id v14 = [(__CFDictionary *)Mutable objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CFDictionarySetValue(self->super.mAppBundleResourceToColorMap, v13, +[GQDColor colorWithCalibratedRed:green:blue:](GQDColor, "colorWithCalibratedRed:green:blue:", (float)((float)(int)objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 0), "intValue") / 255.0), (float)((float)(int)objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 1), "intValue") / 255.0), (float)((float)(int)objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 2), "intValue") / 255.0)));
        }
        id v13 = [v11 nextObject];
      }
      while (v13);
    }
    CFRelease(Mutable);
    [v15 drain];
    self->super.mAppBundleColorMapLoaded = 1;
  }
}

+ (id)parseNumberOutOfBasename:(id)a3 returningNumber:(int *)a4
{
  id v4 = a3;
  if (a3)
  {
    unsigned int v6 = [a3 length];
    if ((int)(v6 - 1) >= 1)
    {
      unsigned int v7 = objc_msgSend(v4, "characterAtIndex:");
      if (v7 <= 0xFF && (_DefaultRuneLocale.__runetype[v7] & 0x400) != 0)
      {
        uint64_t v8 = v6 - 2;
        while (1)
        {
          unsigned int v9 = [v4 characterAtIndex:v8];
          if (v9 > 0xFF || (_DefaultRuneLocale.__runetype[v9] & 0x400) == 0) {
            break;
          }
          if (v8-- <= 0) {
            return v4;
          }
        }
        if (v8)
        {
          if ([v4 characterAtIndex:v8] == 45)
          {
            id v11 = [v4 substringToIndex:v8];
            unsigned int v12 = objc_msgSend(objc_msgSend(v4, "substringFromIndex:", (v8 + 1)), "intValue");
            if (v11)
            {
              int v13 = v12;
              id v14 = [v11 length];
              if (a4)
              {
                if (v14 && v13 != 0x7FFFFFFF && v13 >= 1)
                {
                  *a4 = v13;
                  return v11;
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (id)colorForMissingAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4
{
  if (!self->super.mAppBundleColorMapLoaded) {
    [(GQDBGPresentation *)self loadAppBundleResourceToColorMap];
  }
  if (!self->super.mAppBundleResourceToColorMap) {
    return 0;
  }
  unsigned int v7 = [(GQDBGPresentation *)self createUpgradedAppBundleResourcePath:a3 processorBundle:a4];
  Value = (void *)CFDictionaryGetValue(self->super.mAppBundleResourceToColorMap, v7);
  if (!Value)
  {
    id v10 = [(__CFString *)v7 pathExtension];
    id v11 = v7;
    if (v10) {
      id v11 = (__CFString *)[(__CFString *)v7 stringByDeletingPathExtension];
    }
    int v20 = 0;
    id v12 = [(id)objc_opt_class() parseNumberOutOfBasename:v11 returningNumber:&v20];
    id v13 = v12;
    if (v20 < 1) {
      goto LABEL_11;
    }
    id v14 = v12;
    if (v10) {
      id v14 = [v12 stringByAppendingPathExtension:v10];
    }
    Value = (void *)CFDictionaryGetValue(self->super.mAppBundleResourceToColorMap, v14);
    if (!Value)
    {
LABEL_11:
      uint64_t v15 = 1;
      do
      {
        if (v15 == v20)
        {
          Value = 0;
        }
        else
        {
          v16 = +[NSString stringWithFormat:@"%@-%d", v13, v15];
          v17 = v16;
          if (v10) {
            v17 = [(NSString *)v16 stringByAppendingPathExtension:v10];
          }
          Value = (void *)CFDictionaryGetValue(self->super.mAppBundleResourceToColorMap, v17);
          if (Value) {
            break;
          }
        }
        BOOL v18 = v15 >= 5;
        uint64_t v15 = (v15 + 1);
      }
      while (!v18);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return Value;
}

- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5
{
  uint64_t v8 = [(GQDRoot *)self appBundleResourcesUrl:a5];
  if (!v8) {
    return v8;
  }
  if (![(GQDRoot *)self appBundleCanProcessCurrentDocVersion]) {
    return 0;
  }
  if (self->super.mAppBundleVersion >= 8)
  {
    a3 = [(GQDBGPresentation *)self createUpgradedAppBundleResourcePath:a3 processorBundle:a4];
    if (a3) {
      goto LABEL_5;
    }
    return 0;
  }
  CFRetain(a3);
  if (!a3) {
    return 0;
  }
LABEL_5:
  if (self->super.mAppBundleVersion >= 8 && CFStringHasPrefix(a3, @"Charts/"))
  {
    uint64_t v8 = 0;
  }
  else
  {
    CFURLRef v9 = CFURLCreateCopyAppendingPathComponent(0, v8, @"Themes", 1u);
    CFURLRef v10 = CFURLCreateCopyAppendingPathComponent(0, v9, a3, 0);
    CFRelease(v9);
    uint64_t v8 = CFURLCopyAbsoluteURL(v10);
    CFRelease(v10);
  }
  CFRelease(a3);
  return v8;
}

- (void)initializeAppBundleResourcesUrl:(__CFURL *)a3
{
  if (!self->super.mAppBundleResourcesUrlInitialized) {
    self->super.mAppBundleResourcesUrl = 0;
  }
  self->super.mAppBundleResourcesUrlInitialized = 1;
}

- (__CFString)createUpgradedAppBundleResourcePath:(__CFString *)a3 processorBundle:(__CFBundle *)a4
{
  unsigned int v7 = [(GQDRoot *)self appBundleResourcesUrl:0];
  if (!self->super.mIsOldAssetNameMapInitialized)
  {
    if (v7 && (self->super.mAppBundleVersion & 0xFFFFFFFE) == 8) {
      CFURLRef v8 = CFURLCreateCopyAppendingPathComponent(0, v7, @"Themes/OldAssetNameMap.plist", 0);
    }
    else {
      CFURLRef v8 = CFBundleCopyResourceURL(a4, @"KeyOldAssetNameMap", @"plist", 0);
    }
    CFURLRef v9 = v8;
    self->super.mOldAssetNameMap = (__CFDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfURL:v8];
    if (v9) {
      CFRelease(v9);
    }
    self->super.mIsOldAssetNameMapInitialized = 1;
  }
  if (!self->super.mOldAssetNameMap) {
    return 0;
  }
  CFURLRef v10 = (__CFString *)CFRetain(a3);
  int v11 = 101;
  while (1)
  {
    id v12 = (__CFString *)[(__CFDictionary *)self->super.mOldAssetNameMap objectForKey:v10];
    if (!v12) {
      break;
    }
    id v13 = v12;
    CFRetain(v12);
    if (v10) {
      CFRelease(v10);
    }
    CFURLRef v10 = v13;
    if (!--v11) {
      return v13;
    }
  }
  return v10;
}

@end