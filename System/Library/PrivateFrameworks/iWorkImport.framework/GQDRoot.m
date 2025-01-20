@interface GQDRoot
+ (_xmlNs)appNamespace;
- (BOOL)addObject:(id)a3 withOwnedXmlUid:(const char *)a4;
- (BOOL)appBundleCanProcessCurrentDocVersion;
- (BOOL)includeStyleWithIdentifier:(const char *)a3 parentIdentifier:(const char *)a4 uid:(const char *)a5;
- (BOOL)readDocumentVersion:(_xmlTextReader *)a3;
- (BOOL)readDocumentVersion:(_xmlTextReader *)a3 isTooNew:(BOOL *)a4;
- (Class)classForName:(const char *)a3;
- (GQDRoot)init;
- (__CFURL)appBundleResourcesUrl:(__CFURL *)a3;
- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileExists:(BOOL *)a5 fileUrl:(__CFURL *)a6;
- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5;
- (const)addIdentifiedObject:(id)a3 fromCurrentNode:(_xmlTextReader *)a4;
- (id)colorForMissingAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4;
- (id)objectWithXmlUid:(const char *)a3;
- (id)uuid;
- (unint64_t)documentReleaseVersion;
- (void)dealloc;
- (void)forgetAboutObject:(id)a3 withXmlUid:(const char *)a4;
@end

@implementation GQDRoot

+ (_xmlNs)appNamespace
{
  return 0;
}

- (GQDRoot)init
{
  v4.receiver = self;
  v4.super_class = (Class)GQDRoot;
  v2 = [(GQDRoot *)&v4 init];
  if (v2)
  {
    v2->mUidToObjectMap = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_85110, &kCFTypeDictionaryValueCallBacks);
    v2->mAppBundleResourcesUrlInitialized = 0;
    v2->mIsOldAssetNameMapInitialized = 0;
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->mUidToObjectMap);
  mAppBundleResourceToColorMap = self->mAppBundleResourceToColorMap;
  if (mAppBundleResourceToColorMap) {
    CFRelease(mAppBundleResourceToColorMap);
  }
  mAppBundleResourcesUrl = self->mAppBundleResourcesUrl;
  if (mAppBundleResourcesUrl) {
    CFRelease(mAppBundleResourcesUrl);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDRoot;
  [(GQDRoot *)&v5 dealloc];
}

- (Class)classForName:(const char *)a3
{
  uint64_t v4 = objc_opt_class();
  return +[GQDClassNameMap classForName:a3 inRootType:v4];
}

- (BOOL)addObject:(id)a3 withOwnedXmlUid:(const char *)a4
{
  int v7 = CFDictionaryContainsKey(self->mUidToObjectMap, a4);
  if (!v7) {
    CFDictionaryAddValue(self->mUidToObjectMap, a4, a3);
  }
  return v7 == 0;
}

- (id)uuid
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return v3;
}

- (const)addIdentifiedObject:(id)a3 fromCurrentNode:(_xmlTextReader *)a4
{
  AttributeNs = xmlTextReaderGetAttributeNs(a4, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
  if (AttributeNs)
  {
    do
    {
      unsigned __int8 v7 = [(GQDRoot *)self addObject:a3 withOwnedXmlUid:AttributeNs];
      if (v7) {
        break;
      }
      unsigned __int8 v8 = v7;
      AttributeNs = xmlStrdup((const xmlChar *)objc_msgSend(-[GQDRoot uuid](self, "uuid"), "UTF8String"));
      char v9 = v8 ^ 1;
      if (!AttributeNs) {
        char v9 = 0;
      }
    }
    while ((v9 & 1) != 0);
  }
  return (const char *)AttributeNs;
}

- (id)objectWithXmlUid:(const char *)a3
{
  return (id)CFDictionaryGetValue(self->mUidToObjectMap, a3);
}

- (void)forgetAboutObject:(id)a3 withXmlUid:(const char *)a4
{
  if ([(GQDRoot *)self objectWithXmlUid:a4] == a3)
  {
    mUidToObjectMap = self->mUidToObjectMap;
    CFDictionaryRemoveValue(mUidToObjectMap, a4);
  }
}

- (BOOL)includeStyleWithIdentifier:(const char *)a3 parentIdentifier:(const char *)a4 uid:(const char *)a5
{
  CFSetRef v7 = (const __CFSet *)qword_A40B8;
  if (!qword_A40B8)
  {
    CFSetRef v7 = CFSetCreate(0, &qword_A40C0, 0, (const CFSetCallBacks *)&unk_85140);
    qword_A40B8 = (uint64_t)v7;
  }
  if (a3) {
    unsigned __int8 v8 = a3;
  }
  else {
    unsigned __int8 v8 = a4;
  }
  return !v8 || CFSetContainsValue(v7, v8) == 0;
}

- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileExists:(BOOL *)a5 fileUrl:(__CFURL *)a6
{
  CFSetRef v7 = [(GQDRoot *)self createUrlToAppBundleResource:a3 processorBundle:a4 fileUrl:a6];
  unsigned __int8 v8 = v7;
  if (a5)
  {
    if (v7) {
      BOOL v9 = +[GQUCommon fileExistsAtUrl:v7];
    }
    else {
      BOOL v9 = 0;
    }
    *a5 = v9;
  }
  return v8;
}

- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 fileUrl:(__CFURL *)a5
{
  return 0;
}

- (id)colorForMissingAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4
{
  if (!self->mAppBundleColorMapLoaded) {
    [(GQDRoot *)self loadAppBundleResourceToColorMap];
  }
  id result = self->mAppBundleResourceToColorMap;
  if (result)
  {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
  }
  return result;
}

- (__CFURL)appBundleResourcesUrl:(__CFURL *)a3
{
  if (a3 && !self->mAppBundleResourcesUrlInitialized) {
    -[GQDRoot initializeAppBundleResourcesUrl:](self, "initializeAppBundleResourcesUrl:");
  }
  return self->mAppBundleResourcesUrl;
}

- (BOOL)readDocumentVersion:(_xmlTextReader *)a3
{
  return [(GQDRoot *)self readDocumentVersion:a3 isTooNew:0];
}

- (BOOL)readDocumentVersion:(_xmlTextReader *)a3 isTooNew:(BOOL *)a4
{
  self->mDocVersion = 0;
  p_mDocVersion = &self->mDocVersion;
  id v7 = [(id)objc_opt_class() appNamespace];
  int v8 = sub_43074(a3, (uint64_t)v7, (xmlChar *)"version", p_mDocVersion);
  unint64_t v9 = 0;
  if (v8) {
    unint64_t v9 = sub_43B40(*p_mDocVersion);
  }
  unint64_t *p_mDocVersion = v9;
  if (a4)
  {
    unint64_t v13 = 0;
    id v10 = [(id)objc_opt_class() appNamespace];
    if (sub_43074(a3, (uint64_t)v10, (xmlChar *)"compatible-version", &v13)) {
      unint64_t v11 = sub_43B40(v13);
    }
    else {
      unint64_t v11 = *p_mDocVersion;
    }
    *a4 = v11 > 0x156C1C3A00;
    if (v11 > 0x156C1C3A00) {
      return 0;
    }
    unint64_t v9 = *p_mDocVersion;
  }
  if (v9 >= 0x104C533C00) {
    return v9 > 0x10C3F48F97;
  }
  else {
    return v9 > 0xE6FCB5C77;
  }
}

- (unint64_t)documentReleaseVersion
{
  return self->mDocVersion / 0x2540BE400;
}

- (BOOL)appBundleCanProcessCurrentDocVersion
{
  unint64_t v3 = [(GQDRoot *)self documentReleaseVersion];
  int mAppBundleVersion = self->mAppBundleVersion;
  switch(mAppBundleVersion)
  {
    case 6:
      unint64_t v5 = qword_9CAA8;
      return v3 <= v5;
    case 8:
      unint64_t v5 = qword_9CAA0;
      return v3 <= v5;
    case 9:
      unint64_t v5 = qword_9CA98;
      return v3 <= v5;
  }
  return 0;
}

@end