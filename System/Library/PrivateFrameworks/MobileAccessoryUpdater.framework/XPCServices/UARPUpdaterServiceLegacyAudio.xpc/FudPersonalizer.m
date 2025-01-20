@interface FudPersonalizer
- (BOOL)personalizeWithServer:(id)a3;
- (FudPersonalizer)initWithDelegate:(id)a3;
- (FudPersonalizerDelegate)delegate;
- (__CFDictionary)createPersonalizationManifestCFDict:(id)a3;
- (__CFDictionary)createPersonalizationObjectCFDict:(id)a3;
- (void)dealloc;
- (void)doPersonalization:(id)a3;
- (void)freePersonalizationData;
- (void)overrideSecurityDomain:(BOOL)a3;
- (void)overrideServerURL:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FudPersonalizer

- (FudPersonalizer)initWithDelegate:(id)a3
{
  if (a3
    && (v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0),
        v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.personalizer", v5),
        (self->_personalizationQueue = v6) != 0)
    && (v9.receiver = self,
        v9.super_class = (Class)FudPersonalizer,
        v7 = [(FudPersonalizer *)&v9 init],
        (self = v7) != 0))
  {
    v7->_delegate = (FudPersonalizerDelegate *)a3;
    *(_OWORD *)&v7->_manifestDict = 0u;
    *(_OWORD *)&v7->_serverRequestDict = 0u;
    *(_OWORD *)&v7->_responseData = 0u;
    *(_OWORD *)&v7->_amai = 0u;
    v7->_overrideSecurityDomain = 0;
  }
  else
  {
    FudLog();
  }
  return self;
}

- (void)freePersonalizationData
{
  manifestDict = self->_manifestDict;
  if (manifestDict)
  {
    CFRelease(manifestDict);
    self->_manifestDict = 0;
  }
  objectsDict = self->_objectsDict;
  if (objectsDict)
  {
    CFRelease(objectsDict);
    self->_objectsDict = 0;
  }
  serverRequestDict = self->_serverRequestDict;
  if (serverRequestDict)
  {
    CFRelease(serverRequestDict);
    self->_serverRequestDict = 0;
  }
  serverResponseDict = self->_serverResponseDict;
  if (serverResponseDict)
  {
    CFRelease(serverResponseDict);
    self->_serverResponseDict = 0;
  }
  responseData = self->_responseData;
  if (responseData)
  {
    CFRelease(responseData);
    self->_responseData = 0;
  }
  amai = self->_amai;
  if (amai)
  {
    CFRelease(amai);
    self->_amai = 0;
  }
  ticketName = self->_ticketName;
  if (ticketName)
  {
    CFRelease(ticketName);
    self->_ticketName = 0;
  }
}

- (void)dealloc
{
  personalizationQueue = self->_personalizationQueue;
  if (personalizationQueue) {
    dispatch_release((dispatch_object_t)personalizationQueue);
  }
  [(FudPersonalizer *)self freePersonalizationData];
  serverURL = self->_serverURL;
  if (serverURL)
  {
    CFRelease(serverURL);
    self->_serverURL = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FudPersonalizer;
  [(FudPersonalizer *)&v5 dealloc];
}

- (void)overrideServerURL:(id)a3
{
  serverURL = self->_serverURL;
  if (serverURL)
  {
    CFRelease(serverURL);
    self->_serverURL = 0;
  }
  if (a3) {
    v6 = (__CFString *)CFRetain(a3);
  }
  else {
    v6 = 0;
  }
  self->_serverURL = v6;
}

- (void)overrideSecurityDomain:(BOOL)a3
{
  self->_overrideSecurityDomain = a3;
}

- (void)doPersonalization:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = sub_1000055B8;
  v15 = sub_1000055C8;
  uint64_t v16 = 0;
  if (self->_delegate)
  {
    if (self->_personalizationQueue)
    {
      if (a3)
      {
        if ([a3 responseFormat] > 2)
        {
          CFStringRef v7 = @"Invalid response format";
        }
        else if ([a3 responseFormat] && !objc_msgSend(a3, "payload"))
        {
          CFStringRef v7 = @"Response format requires payload";
        }
        else
        {
          if ([a3 responseFormat] == 1
            || ![a3 responseAlignment])
          {
            [(FudPersonalizer *)self freePersonalizationData];
            id v5 = a3;
            v12[5] = (uint64_t)v5;
            personalizationQueue = self->_personalizationQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000055D4;
            block[3] = &unk_1000313E0;
            block[5] = a3;
            block[6] = &v11;
            block[4] = self;
            dispatch_async((dispatch_queue_t)personalizationQueue, block);
            goto LABEL_10;
          }
          CFStringRef v7 = @"Response format doesn't support alignment";
        }
      }
      else
      {
        CFStringRef v7 = @"Personalization request=nil";
      }
    }
    else
    {
      CFStringRef v7 = @"Personalization queue=nil";
    }
  }
  else
  {
    CFStringRef v7 = @"Personalization delegate=nil";
  }
  uint64_t v8 = FUDError();
  FudLog();
  delegate = self->_delegate;
  if (delegate) {
    -[FudPersonalizerDelegate personalizationDone:response:error:](delegate, "personalizationDone:response:error:", a3, 0, v8, "-[FudPersonalizer doPersonalization:]", v7);
  }
LABEL_10:
  _Block_object_dispose(&v11, 8);
}

- (__CFDictionary)createPersonalizationObjectCFDict:(id)a3
{
  if ([a3 objectTag]
    && [a3 digest]
    && ([a3 isEffectiveProductionModeSet] & 1) != 0)
  {
    if (([a3 isEffectiveSecurityModeSet] & 1) == 0)
    {
      objc_super v9 = "-[FudPersonalizer createPersonalizationObjectCFDict:]";
      FudLog();
    }
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      if ([a3 isEffectiveSecurityModeSet])
      {
        if ([a3 effectiveSecurityMode]) {
          id v5 = (const void **)&kCFBooleanTrue;
        }
        else {
          id v5 = (const void **)&kCFBooleanFalse;
        }
        CFDictionarySetValue(Mutable, @"ESEC", *v5);
      }
      if (objc_msgSend(a3, "isEffectiveProductionModeSet", v9))
      {
        if ([a3 effectiveProductionMode]) {
          v6 = (const void **)&kCFBooleanTrue;
        }
        else {
          v6 = (const void **)&kCFBooleanFalse;
        }
        CFDictionarySetValue(Mutable, @"EPRO", *v6);
      }
      if ([a3 isTrustedSet])
      {
        if ([a3 trusted]) {
          CFStringRef v7 = (const void **)&kCFBooleanTrue;
        }
        else {
          CFStringRef v7 = (const void **)&kCFBooleanFalse;
        }
        CFDictionarySetValue(Mutable, @"Trusted", *v7);
      }
      CFDictionarySetValue(Mutable, @"Digest", [a3 digest]);
    }
    else
    {
      FudLog();
    }
  }
  else
  {
    FudLog();
    return 0;
  }
  return Mutable;
}

- (__CFDictionary)createPersonalizationManifestCFDict:(id)a3
{
  if (![a3 requestName]
    || ![a3 chipID]
    || ![a3 ecID] && !objc_msgSend(a3, "extEcID") && !objc_msgSend(a3, "globalSigning")
    || ![a3 isProductionModeSet]
    || ![a3 nonceHash]
    || ![a3 objectList]
    || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) == 0)
  {
    FudLog();
    return 0;
  }
  v6 = Mutable;
  if ([a3 requestPrefix])
  {
    CFStringRef v7 = CFStringCreateMutable(kCFAllocatorDefault, 0);
    uint64_t v8 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryBuildKeySetTag(v8, @"ApBoardID", (const __CFString *)[a3 requestPrefix], @"BoardID");
    CFDictionaryBuildKeySetTag(v8, @"ApChipID", (const __CFString *)[a3 requestPrefix], @"ChipID");
    CFDictionaryBuildKeySetTag(v8, @"ApECID", (const __CFString *)[a3 requestPrefix], @"ECID");
    CFDictionaryBuildKeySetTag(v8, @"ApSecurityDomain", (const __CFString *)[a3 requestPrefix], @"SecurityDomain");
    CFDictionaryBuildKeySetTag(v8, @"ApProductionMode", (const __CFString *)[a3 requestPrefix], @"ProductionMode");
    CFDictionaryBuildKeySetTag(v8, @"ApManifestEpoch", (const __CFString *)[a3 requestPrefix], @"ManifestEpoch");
    if ([a3 isSecurityModeSet]) {
      CFDictionaryBuildKeySetTag(v8, @"ApSecurityMode", (const __CFString *)[a3 requestPrefix], @"SecurityMode");
    }
    CFDictionaryBuildKeySetTag(v8, @"ApNonce", (const __CFString *)[a3 requestPrefix], @"Nonce");
    objc_super v9 = CFStringCreateMutable(kCFAllocatorDefault, 0);
    CFStringAppendFormat(v9, 0, @"@%@", @"ApImg4Ticket");
    CFDictionaryBuildKeySetTicket(v8, v9, (const __CFString *)[a3 requestPrefix], @"Ticket");
    CFRelease(v9);
    CFStringAppendFormat(v7, 0, @"%@,%@", [a3 requestPrefix], @"Ticket");
    self->_ticketName = v7;
    FudLog();
    CFDictionarySetValue(v6, @"APTagOverrides", v8);
    CFRelease(v8);
  }
  else
  {
    self->_ticketName = (__CFString *)CFStringCreateCopy(kCFAllocatorDefault, @"ApImg4Ticket");
  }
  v10 = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(v10, 0, @"@%@", @"ApImg4Ticket");
  CFDictionarySetValue(v6, v10, kCFBooleanTrue);
  CFRelease(v10);
  CFDictionaryBuildKeySetInt32(v6, @"ApBoardID", (int)[a3 boardID]);
  CFDictionaryBuildKeySetInt32(v6, @"ApChipID", (int)[a3 chipID]);
  if ([a3 globalSigning])
  {
    CFStringRef v11 = @"UseGlobalSigning";
    v12 = v6;
    CFBooleanRef v13 = kCFBooleanTrue;
  }
  else
  {
    if (![a3 extEcID])
    {
      CFDictionaryBuildKeySetInt64(v6, @"ApECID", (uint64_t)[a3 ecID]);
      goto LABEL_20;
    }
    CFBooleanRef v13 = (CFBooleanRef)[a3 extEcID];
    CFStringRef v11 = @"ApECID";
    v12 = v6;
  }
  CFDictionarySetValue(v12, v11, v13);
LABEL_20:
  if (self->_overrideSecurityDomain) {
    int v14 = 1;
  }
  else {
    int v14 = [a3 securityDomain];
  }
  CFDictionaryBuildKeySetInt32(v6, @"ApSecurityDomain", v14);
  if ([a3 productionMode]) {
    CFBooleanRef v15 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v15 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v6, @"ApProductionMode", v15);
  if ([a3 isSecurityModeSet])
  {
    if ([a3 securityMode]) {
      CFBooleanRef v16 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v16 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v6, @"ApSecurityMode", v16);
  }
  CFDictionarySetValue(v6, @"ApNonce", [a3 nonceHash]);
  if ([a3 isChipEpochSet]) {
    CFDictionaryBuildKeySetInt32(v6, @"ApManifestEpoch", (int)[a3 chipEpoch]);
  }
  if ([a3 enableMixMatch])
  {
    if ([a3 enableMixMatch]) {
      CFBooleanRef v17 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v17 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v6, @"ApAllowMixAndMatch", v17);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = [a3 objectList];
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v24 = [(FudPersonalizer *)self createPersonalizationObjectCFDict:v23];
        if (v24) {
          CFDictionarySetValue(v6, [v23 objectTag], v24);
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }
  return v6;
}

- (BOOL)personalizeWithServer:(id)a3
{
  id v5 = -[FudPersonalizer createPersonalizationManifestCFDict:](self, "createPersonalizationManifestCFDict:");
  self->_manifestDict = v5;
  if (!v5)
  {
    CFStringRef v29 = @"Failed to build manifest dictionary";
    goto LABEL_36;
  }
  v36 = v5;
  FudLog();
  if (!self->_amai)
  {
    v6 = (__AMAuthInstall *)AMAuthInstallCreate();
    self->_amai = v6;
    if (!v6)
    {
      CFStringRef v29 = @"Failed to create Signing Request";
      goto LABEL_36;
    }
    if (objc_msgSend(a3, "useSSOCredentials", "-[FudPersonalizer personalizeWithServer:]", v36))
    {
      if (AMAuthInstallSsoInitialize())
      {
        FudLog();
      }
      else
      {
        if (AMAuthInstallSsoEnable())
        {
          CFStringRef v29 = @"Failed to enable SSO";
          goto LABEL_36;
        }
        if (self->_serverURL) {
          serverURL = self->_serverURL;
        }
        else {
          serverURL = @"https://gs.apple.com:443/";
        }
        CFURLCreateWithString(kCFAllocatorDefault, serverURL, 0);
        if (AMAuthInstallSetSigningServerURL())
        {
          CFStringRef v29 = @"Failed to set Signing Server URL";
          goto LABEL_36;
        }
      }
    }
    else
    {
      CFStringRef v7 = self->_serverURL;
      if (v7)
      {
        CFURLCreateWithString(kCFAllocatorDefault, v7, 0);
        AMAuthInstallSetSigningServerURL();
      }
    }
    AMAuthInstallLogSetHandler();
  }
  objc_super v9 = self->_serverURL;
  if (v9)
  {
    CFStringGetCStringPtr(v9, 0x8000100u);
    FudLog();
  }
  if (AMAuthInstallApSetParameters())
  {
    CFStringRef v29 = @"Failed to add manifest properties to Signing Request";
    goto LABEL_36;
  }
  CFIndex Count = CFDictionaryGetCount(self->_manifestDict);
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, Count, self->_manifestDict);
  self->_serverRequestDict = MutableCopy;
  CFDictionaryRemoveValue(MutableCopy, @"APTagOverrides");
  p_serverResponseDict = &self->_serverResponseDict;
  uint64_t PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
  int v14 = PersonalizedResponse;
  uint64_t v37 = PersonalizedResponse;
  FudLog();
  if (v14 == 3194
    && (objc_msgSend(a3, "useSSOCredentials", "-[FudPersonalizer personalizeWithServer:]", v37) & 1) == 0)
  {
    [a3 setUseSSOCredentials:1];
    return 0;
  }
  if (!*p_serverResponseDict)
  {
    CFStringRef v29 = @"Failed to generate signed manifest";
    goto LABEL_36;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*p_serverResponseDict, self->_ticketName);
  if (!Value)
  {
    CFStringRef v29 = @"Failed to retrieve signed manifest";
    goto LABEL_36;
  }
  CFDataRef v16 = Value;
  unsigned int v17 = [a3 responseFormat];
  if (v17)
  {
    if (v17 == 2)
    {
      id v40 = [a3 responseFormat];
      FudLog();
      CFGetAllocator(self->_amai);
      objc_msgSend(a3, "payload", "-[FudPersonalizer personalizeWithServer:]", v40);
      StitchTicket = (__CFData *)AMAuthInstallApImg4CreateStitchTicket();
      self->_responseData = StitchTicket;
      if (!StitchTicket)
      {
        CFStringRef v29 = @"Failed to stitch img4 response";
        goto LABEL_36;
      }
    }
    else
    {
      if (v17 != 1)
      {
        CFStringRef v29 = @"Invalid response format";
        goto LABEL_36;
      }
      CFDataRef v18 = (const __CFData *)[a3 payload];
      CFIndex Length = CFDataGetLength(v18);
      CFIndex v20 = CFDataGetLength(v16);
      uint64_t v21 = CFDataCreateMutableCopy(kCFAllocatorDefault, 0, v18);
      id v38 = [a3 responseFormat];
      FudLog();
      BytePtr = CFDataGetBytePtr(v16);
      CFDataAppendBytes(v21, BytePtr, v20);
      MutableBytePtr = CFDataGetMutableBytePtr(v21);
      *((_DWORD *)MutableBytePtr + 4) = Length;
      *((_DWORD *)MutableBytePtr + 5) = v20;
      if (objc_msgSend(a3, "chipID", "-[FudPersonalizer personalizeWithServer:]", v38) == 8194) {
        *((void *)MutableBytePtr + 1) = 0x1234567898765432;
      }
      if ([a3 responseAlignment])
      {
        unsigned int v24 = [a3 responseAlignment];
        unsigned int v25 = [a3 responseAlignment];
        CFDataIncreaseLength(v21, (int)(v24 + (v20 + Length) / v25 * v25 - (v20 + Length)) % (int)[a3 responseAlignment]);
      }
      long long v26 = CFDataGetBytePtr(v21);
      CFIndex v27 = CFDataGetLength(v21);
      StitchTicket = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v26, v27, kCFAllocatorDefault);
      self->_responseData = StitchTicket;
      if (!StitchTicket)
      {
        CFStringRef v29 = @"Failed to stitch ftab response";
LABEL_36:
        uint64_t v34 = FUDError();
        v35 = "-[FudPersonalizer personalizeWithServer:]";
        CFStringRef v39 = v29;
        FudLog();
        delegate = self->_delegate;
        id v32 = a3;
        StitchTicket = 0;
        uint64_t v33 = v34;
        goto LABEL_37;
      }
    }
  }
  else
  {
    v35 = "-[FudPersonalizer personalizeWithServer:]";
    CFStringRef v39 = (const __CFString *)[a3 responseFormat];
    FudLog();
    StitchTicket = (__CFData *)CFRetain(v16);
    self->_responseData = StitchTicket;
  }
  delegate = self->_delegate;
  id v32 = a3;
  uint64_t v33 = 0;
LABEL_37:
  -[FudPersonalizerDelegate personalizationDone:response:error:](delegate, "personalizationDone:response:error:", v32, StitchTicket, v33, v35, v39);
  return 1;
}

- (FudPersonalizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPersonalizerDelegate *)a3;
}

@end