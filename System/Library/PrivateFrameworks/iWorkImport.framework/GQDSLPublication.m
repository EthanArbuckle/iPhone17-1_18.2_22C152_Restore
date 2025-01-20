@interface GQDSLPublication
+ (_xmlNs)appNamespace;
- (BOOL)hasBody;
- (BOOL)hasFooters;
- (BOOL)hasHeaders;
- (BOOL)showOutliner;
- (CGSize)pageSize;
- (GQDSLPublication)init;
- (__CFArray)createUpgradedPathComponentsFromOldTemplatePathComponents:(__CFArray *)a3;
- (__CFString)createFixedPathForOldAppBundleResourcePath:(__CFString *)a3;
- (__CFString)createUpgradedPathForOldAssetPath:(__CFString *)a3;
- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5;
- (id)pageMargins;
- (id)stylesheet;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
- (void)initializeAppBundleResourcesUrl:(__CFURL *)a3;
- (void)setPageMargins:(id)a3;
- (void)setStylesheet:(id)a3;
@end

@implementation GQDSLPublication

+ (_xmlNs)appNamespace
{
  return (_xmlNs *)qword_A3608;
}

- (GQDSLPublication)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQDSLPublication;
  result = [(GQDRoot *)&v3 init];
  if (result) {
    result->mHasBody = 1;
  }
  return result;
}

- (void)dealloc
{
  mOldAssetNameMap = self->super.mOldAssetNameMap;
  if (mOldAssetNameMap) {
    CFRelease(mOldAssetNameMap);
  }
  mOldTemplateNameMap = self->mOldTemplateNameMap;
  if (mOldTemplateNameMap) {
    CFRelease(mOldTemplateNameMap);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDSLPublication;
  [(GQDRoot *)&v5 dealloc];
}

- (CGSize)pageSize
{
  double width = self->mPageSize.width;
  double height = self->mPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)pageMargins
{
  return self->mPageMargins;
}

- (void)setPageMargins:(id)a3
{
  id v5 = a3;

  self->mPageMargins = (GQDSLPageMargins *)a3;
}

- (id)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  id v5 = a3;

  self->mStylesheet = (GQDSStylesheet *)a3;
}

- (BOOL)hasBody
{
  return self->mHasBody;
}

- (void)initializeAppBundleResourcesUrl:(__CFURL *)a3
{
  if (!self->super.mAppBundleResourcesUrlInitialized) {
    self->super.mAppBundleResourcesUrl = 0;
  }
  self->super.mAppBundleResourcesUrlInitialized = 1;
}

- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5
{
  v7 = -[GQDRoot appBundleResourcesUrl:](self, "appBundleResourcesUrl:", a5, a4);
  if (v7)
  {
    if ([(GQDRoot *)self appBundleCanProcessCurrentDocVersion]
      && (v8 = [(GQDSLPublication *)self createFixedPathForOldAppBundleResourcePath:a3]) != 0)
    {
      CFStringRef v9 = v8;
      if (CFStringHasPrefix(v8, @"Charts/"))
      {
        v7 = 0;
      }
      else
      {
        CFURLRef v10 = CFURLCreateCopyAppendingPathComponent(0, v7, v9, 0);
        v7 = CFURLCopyAbsoluteURL(v10);
        CFRelease(v10);
      }
      CFRelease(v9);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)showOutliner
{
  return self->mShowOutliner;
}

- (BOOL)hasHeaders
{
  return self->mHasHeaders;
}

- (BOOL)hasFooters
{
  return self->mHasFooters;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A3608, (xmlChar *)"page-width");
  float v6 = v5;
  sub_433CC(a3, qword_A3608, (xmlChar *)"page-height");
  *(float *)&double v7 = v7;
  self->mPageSize.double width = v6;
  self->mPageSize.double height = *(float *)&v7;
  return 1;
}

- (__CFString)createFixedPathForOldAppBundleResourcePath:(__CFString *)a3
{
  objc_super v3 = a3;
  if (!a3) {
    return v3;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a3, @"/");
  unsigned int Count = CFArrayGetCount(ArrayBySeparatingStrings);
  unsigned int v7 = Count;
  if (self->super.mAppBundleVersion >= 8 && Count >= 6)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
    if (CFStringHasSuffix(ValueAtIndex, @".lproj"))
    {
      CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
      if (CFEqual(v11, @"Templates"))
      {
        v18 = [(GQDSLPublication *)self createUpgradedPathComponentsFromOldTemplatePathComponents:ArrayBySeparatingStrings];
        MutableCopy = CFArrayCreateMutableCopy(0, 0, v18);
        CFRelease(v18);
        goto LABEL_24;
      }
    }
  }
  else if (Count < 3)
  {
LABEL_7:
    MutableCopy = 0;
    goto LABEL_24;
  }
  CFStringRef v12 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  if (CFEqual(v12, @"English.lproj"))
  {
    CFStringRef v13 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
    if (CFEqual(v13, @"Starting Points"))
    {
      MutableCopy = CFArrayCreateMutableCopy(0, 0, ArrayBySeparatingStrings);
      newValues = @"Templates";
      v26.location = 1;
      v26.length = 1;
      CFArrayReplaceValues(MutableCopy, v26, (const void **)&newValues, 1);
      if (v7 < 4) {
        goto LABEL_24;
      }
      v19 = (void *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 2);
      if (([v19 isEqualToString:@"Traditional"] & 1) == 0
        && ![v19 isEqualToString:@"ISO"])
      {
        goto LABEL_24;
      }
      v16 = MutableCopy;
      CFIndex v17 = 3;
      goto LABEL_23;
    }
  }
  if (self->super.mAppBundleVersion < 8)
  {
    CFRelease(ArrayBySeparatingStrings);
LABEL_38:
    CFStringRef v23 = 0;
    goto LABEL_39;
  }
  CFStringRef v14 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  MutableCopy = 0;
  if (CFEqual(v14, @"Templates"))
  {
    v15 = (void *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
    if (([v15 isEqualToString:@"Traditional"] & 1) == 0
      && ![v15 isEqualToString:@"ISO"])
    {
      goto LABEL_7;
    }
    v16 = CFArrayCreateMutableCopy(0, 0, ArrayBySeparatingStrings);
    MutableCopy = v16;
    CFIndex v17 = 1;
LABEL_23:
    CFArrayRemoveValueAtIndex(v16, v17);
  }
LABEL_24:
  if (self->super.mAppBundleVersion > 8)
  {
    if (MutableCopy)
    {
      CFIndex v20 = CFArrayGetCount(MutableCopy);
      CFArrayRef v21 = MutableCopy;
    }
    else
    {
      CFIndex v20 = v7;
      CFArrayRef v21 = ArrayBySeparatingStrings;
    }
    if (v20 >= 2)
    {
      CFStringRef v22 = (const __CFString *)CFArrayGetValueAtIndex(v21, 1);
      if (CFStringCompare(v22, @"Shared", 0))
      {
        if (CFStringCompare(v22, @"Pages06", 0)
          && CFStringCompare(v22, @"Pages08", 0)
          && CFStringFind(v22, @".", 0).location == -1)
        {
          if (!MutableCopy) {
            MutableCopy = CFArrayCreateMutableCopy(0, 0, ArrayBySeparatingStrings);
          }
          CFArrayRemoveValueAtIndex(MutableCopy, 1);
        }
      }
    }
  }
  CFRelease(ArrayBySeparatingStrings);
  if (!MutableCopy) {
    goto LABEL_38;
  }
  CFStringRef v23 = CFStringCreateByCombiningStrings(0, MutableCopy, @"/");
  CFRelease(MutableCopy);
LABEL_39:
  if (v23) {
    objc_super v3 = (__CFString *)v23;
  }
  if (self->super.mAppBundleVersion >= 8)
  {
    objc_super v3 = [(GQDSLPublication *)self createUpgradedPathForOldAssetPath:v3];
    if (!v23) {
      return v3;
    }
    goto LABEL_45;
  }
  CFRetain(v3);
  if (v23) {
LABEL_45:
  }
    CFRelease(v23);
  return v3;
}

- (__CFArray)createUpgradedPathComponentsFromOldTemplatePathComponents:(__CFArray *)a3
{
  if (!self->mIsOldTemplateNameMapInitialized)
  {
    CFStringRef v9 = [(GQDRoot *)self appBundleResourcesUrl:0];
    if (v9)
    {
      CFURLRef v10 = v9;
      if ([(GQDRoot *)self appBundleCanProcessCurrentDocVersion])
      {
        CFURLRef v11 = CFURLCreateCopyAppendingPathComponent(0, v10, @"Templates/OldTemplateNameMap.plist", 0);
        id v12 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v11];
        CFRelease(v11);
        if (v12)
        {
          self->mOldTemplateNameMap = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v13 = [v12 keyEnumerator];
          CFStringRef v14 = (__CFString *)[v13 nextObject];
          if (v14)
          {
            v15 = v14;
            do
            {
              v16 = sub_F890(v15);
              -[__CFDictionary setObject:forKey:](self->mOldTemplateNameMap, "setObject:forKey:", sub_F890((__CFString *)[v12 objectForKey:v15]), v16);
              v15 = (__CFString *)[v13 nextObject];
            }
            while (v15);
          }
        }
        self->mIsOldTemplateNameMapInitialized = 1;
      }
    }
  }
  if (self->mOldTemplateNameMap)
  {
    id v5 = objc_alloc_init((Class)NSAutoreleasePool);
    int Count = CFArrayGetCount(a3);
    id v7 = -[__CFDictionary objectForKey:](self->mOldTemplateNameMap, "objectForKey:", sub_F890((__CFString *)+[NSString pathWithComponents:](NSString, "pathWithComponents:", -[__CFArray subarrayWithRange:](a3, "subarrayWithRange:", 0, 5))));
    if (v7)
    {
      MutableCopy = (__CFArray *)objc_msgSend(objc_msgSend(v7, "stringByAppendingPathComponent:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", -[__CFArray subarrayWithRange:](a3, "subarrayWithRange:", 5, (Count - 5)))), "pathComponents");
    }
    else
    {
      MutableCopy = CFArrayCreateMutableCopy(0, 0, a3);
      CFArrayRemoveValueAtIndex(MutableCopy, 0);
      CFArrayRemoveValueAtIndex(MutableCopy, 1);
    }

    if (MutableCopy) {
      return MutableCopy;
    }
  }
  return (__CFArray *)CFRetain(a3);
}

- (__CFString)createUpgradedPathForOldAssetPath:(__CFString *)a3
{
  if (!self->super.mIsOldAssetNameMapInitialized)
  {
    CFStringRef v9 = [(GQDRoot *)self appBundleResourcesUrl:0];
    if (v9)
    {
      CFURLRef v10 = v9;
      if ([(GQDRoot *)self appBundleCanProcessCurrentDocVersion])
      {
        CFURLRef v11 = CFURLCreateCopyAppendingPathComponent(0, v10, @"Templates/OldAssetNameMap.plist", 0);
        self->super.mOldAssetNameMap = (__CFDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfURL:v11];
        CFRelease(v11);
        self->super.mIsOldAssetNameMapInitialized = 1;
      }
    }
  }
  mOldAssetNameMap = self->super.mOldAssetNameMap;
  if (mOldAssetNameMap && (Value = (__CFString *)CFDictionaryGetValue(mOldAssetNameMap, a3)) != 0)
  {
    id v7 = Value;
    CFRetain(Value);
    return v7;
  }
  else
  {
    CFRetain(a3);
  }
  return a3;
}

@end