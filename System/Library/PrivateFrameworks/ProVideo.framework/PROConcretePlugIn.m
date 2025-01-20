@interface PROConcretePlugIn
- (BOOL)is3rdParty;
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlugIn:(id)a3;
- (Class)plugInClass;
- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5;
- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5 pluginKitPlug:(id)a6;
- (__CFUUID)uuid;
- (id)apiUsedByPlugInForProtocol:(id)a3;
- (id)blockedLookupKey;
- (id)bundle;
- (id)className;
- (id)delegate;
- (id)description;
- (id)displayName;
- (id)group;
- (id)helpURL;
- (id)implementedProtocols;
- (id)infoDictionary;
- (id)infoString;
- (id)plugInInstance;
- (id)pluginKitPlug;
- (id)sharedPlugInInstance;
- (id)uuidString;
- (id)vendorName;
- (id)version;
- (unint64_t)hash;
- (void)dealloc;
- (void)reportError:(id)a3;
- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setIsBlocked:(BOOL)a3;
@end

@implementation PROConcretePlugIn

- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  return [(PROConcretePlugIn *)self initWithDictionary:a3 bundle:a4 delegate:a5 pluginKitPlug:0];
}

- (PROConcretePlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5 pluginKitPlug:(id)a6
{
  v42.receiver = self;
  v42.super_class = (Class)PROConcretePlugIn;
  v10 = [(PROConcretePlugIn *)&v42 init];
  if (!v10) {
    return v10;
  }
  v10->infoDictionary = (NSDictionary *)[a3 copy];
  v10->bundle = (NSBundle *)a4;
  v10->delegate = (PROPlugInDelegate *)a5;
  v10->pluginKitPlug = (PKPlugIn *)a6;
  v10->entirelyOutOfProcess = [(NSBundle *)v10->bundle objectForInfoDictionaryKey:@"PlugInKit"] != 0;
  v10->_isBlocked = 0;
  CFStringRef v11 = [(NSDictionary *)v10->infoDictionary objectForKey:@"uuid"];
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!v11)
  {
    v10->uuidRef = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    delegate = v10->delegate;
    v38 = (objc_class *)objc_opt_class();
    uint64_t v36 = MalformedKeyError((uint64_t)v10, @"uuid", v38, (uint64_t)v10->infoDictionary);
    v35 = delegate;
    goto LABEL_26;
  }
  v10->uuidRef = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11);
  uint64_t v41 = 0;
  v13 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, @"uuid", v13, a3, &v41)) {
    goto LABEL_24;
  }
  v14 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, @"displayName", v14, a3, &v41)) {
    goto LABEL_24;
  }
  v15 = (objc_class *)objc_opt_class();
  if (!RequiredKeyIsPresent((uint64_t)v10, @"className", v15, a3, &v41)) {
    goto LABEL_24;
  }
  v16 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"group", v16, a3, &v41)) {
    goto LABEL_24;
  }
  v17 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"protocolNames", v17, a3, &v41)) {
    goto LABEL_24;
  }
  v18 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"infoString", v18, a3, &v41)) {
    goto LABEL_24;
  }
  v19 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"iconFileName", v19, a3, &v41)) {
    goto LABEL_24;
  }
  v20 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"helpURL", v20, a3, &v41)) {
    goto LABEL_24;
  }
  v21 = (objc_class *)objc_opt_class();
  if (!OptionalKeyIsWellFormed((uint64_t)v10, @"vendorName", v21, a3, &v41)) {
    goto LABEL_24;
  }
  v22 = (objc_class *)objc_opt_class();
  if ((OptionalKeyIsWellFormed((uint64_t)v10, @"version", v22, a3, &v41) & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    if (!OptionalKeyIsWellFormed((uint64_t)v10, @"version", v23, a3, &v41)) {
      goto LABEL_24;
    }
  }
  v24 = (objc_class *)objc_opt_class();
  if ((OptionalKeyIsWellFormed((uint64_t)v10, @"stringsFileName", v24, a3, &v41) & 1) == 0)
  {
LABEL_24:
    v35 = v10->delegate;
    uint64_t v36 = v41;
    goto LABEL_26;
  }
  uint64_t v25 = [a3 objectForKey:@"group"];
  if (v25)
  {
    CFStringRef v26 = (const __CFString *)v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFUUIDRef v27 = CFUUIDCreateFromString(v12, v26);
      if (v27)
      {
        CFUUIDRef v28 = v27;
        v29 = (PROPlugInGroup *)[(PROPlugInDelegate *)v10->delegate plugInGroupWithUUID:v27];
        v10->group = v29;
        [(PROPlugInGroup *)v29 addPlugIn:v10];
        CFRelease(v28);
        goto LABEL_19;
      }
    }
    v32 = v10->delegate;
    v33 = (objc_class *)objc_opt_class();
    v34 = @"group";
LABEL_29:
    uint64_t v36 = MalformedKeyError((uint64_t)v10, (uint64_t)v34, v33, (uint64_t)a3);
    v35 = v32;
LABEL_26:
    [(PROPlugInDelegate *)v35 plugInCouldNotInitialize:v36];
    v39 = v10;
    return 0;
  }
LABEL_19:
  v30 = (void *)[a3 objectForKey:@"protocolNames"];
  if (v30)
  {
    v31 = (void *)[v30 objectEnumerator];
    while ([v31 nextObject])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = v10->delegate;
        v33 = (objc_class *)objc_opt_class();
        v34 = @"protocolNames";
        goto LABEL_29;
      }
    }
  }
  v10->localizationTableName = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](v10->infoDictionary, "objectForKey:", @"stringsFileName"), "copy");
  return v10;
}

- (void)dealloc
{
  uuidRef = self->uuidRef;
  if (uuidRef) {
    CFRelease(uuidRef);
  }

  v4.receiver = self;
  v4.super_class = (Class)PROConcretePlugIn;
  [(PROConcretePlugIn *)&v4 dealloc];
}

- (id)bundle
{
  return self->bundle;
}

- (BOOL)isEqualToPlugIn:(id)a3
{
  uuidRef = self->uuidRef;
  return uuidRef == (__CFUUID *)[a3 uuid];
}

- (BOOL)isEqual:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    return [(PROConcretePlugIn *)self isEqualToPlugIn:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PROConcretePlugIn;
    return [(PROConcretePlugIn *)&v6 isEqual:a3];
  }
}

- (unint64_t)hash
{
  return (unint64_t)self->uuidRef >> 2;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PROPlugInDelegate *)a3;
}

- (id)pluginKitPlug
{
  return self->pluginKitPlug;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (id)blockedLookupKey
{
  return self->_blockedLookupKey;
}

- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5
{
  self->_blockedLookupKey = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingString:", a4), "stringByAppendingString:", a5);
}

- (__CFUUID)uuid
{
  return self->uuidRef;
}

- (id)uuidString
{
  return [(NSDictionary *)self->infoDictionary objectForKey:@"uuid"];
}

- (void)reportError:(id)a3
{
}

- (id)sharedPlugInInstance
{
  id result = self->sharedInstance;
  if (!result)
  {
    id result = [(PROConcretePlugIn *)self plugInInstance];
    self->sharedInstance = result;
  }
  return result;
}

- (id)className
{
  return [(NSDictionary *)self->infoDictionary objectForKey:@"className"];
}

- (Class)plugInClass
{
  char plugInFlags = (char)self->plugInFlags;
  if ((plugInFlags & 1) == 0)
  {
    if (![(PROPlugInDelegate *)self->delegate plugInShouldLoadPlugInInstanceForTheFirstTime:self])return 0; {
    char plugInFlags = (char)self->plugInFlags;
    }
  }
  *(unsigned char *)&self->char plugInFlags = plugInFlags | 1;
  objc_super v4 = [(PROConcretePlugIn *)self className];
  uint64_t v11 = 0;
  if ([(NSBundle *)self->bundle loadAndReturnError:&v11])
  {
    Class result = NSClassFromString(v4);
    if (result) {
      return result;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self, @"PROPlugIn", v4, @"ClassName", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Plug-In failed to find the plug-in's class.", &stru_1F119C770, @"PROPlug"), *MEMORY[0x1E4F28568], 0);
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = -601;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Plug-In failed to load bundle.", &stru_1F119C770, @"PROPlug");
    uint64_t v6 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", self, @"PROPlugIn", v10, *MEMORY[0x1E4F28568], v11, *MEMORY[0x1E4F28A50], 0);
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = -600;
  }
  -[PROConcretePlugIn reportError:](self, "reportError:", [v7 errorWithDomain:@"PROPlug" code:v8 userInfo:v6]);
  return 0;
}

- (id)plugInInstance
{
  char plugInFlags = (char)self->plugInFlags;
  if ((plugInFlags & 1) == 0)
  {
    if (![(PROPlugInDelegate *)self->delegate plugInShouldLoadPlugInInstanceForTheFirstTime:self])return 0; {
    char plugInFlags = (char)self->plugInFlags;
    }
  }
  *(unsigned char *)&self->char plugInFlags = plugInFlags | 1;
  id result = [(PROConcretePlugIn *)self plugInClass];
  if (result)
  {
    v5 = (objc_class *)result;
    id v6 = [result instancesRespondToSelector:sel_initWithAPIManager_]
       ? (id)objc_msgSend([v5 alloc], "initWithAPIManager:", -[PROPlugInDelegate apiManagerForPlugInInstances](self->delegate, "apiManagerForPlugInInstances")): objc_alloc_init(v5);
    id result = v6;
    if (!result)
    {
      v7 = (void *)MEMORY[0x1E4F1C9E8];
      id v8 = [(NSDictionary *)self->infoDictionary objectForKey:@"className"];
      -[PROConcretePlugIn reportError:](self, "reportError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"PROPlug", -602, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", self, @"PROPlugIn", v8, @"ClassName", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Plug-In failed create instance of its class.", &stru_1F119C770,
              @"PROPlug"),
            *MEMORY[0x1E4F28568],
            0)));
      return 0;
    }
  }
  return result;
}

- (id)group
{
  return self->group;
}

- (id)displayName
{
  BOOL entirelyOutOfProcess = self->entirelyOutOfProcess;
  bundle = self->bundle;
  id v5 = [(NSDictionary *)self->infoDictionary objectForKey:@"displayName"];
  if (entirelyOutOfProcess) {
    localizationTableName = @"InfoPlist";
  }
  else {
    localizationTableName = (__CFString *)self->localizationTableName;
  }

  return [(NSBundle *)bundle localizedStringForKey:v5 value:0 table:localizationTableName];
}

- (id)helpURL
{
  id result = self->helpURL;
  if (!result)
  {
    if ((*(unsigned char *)&self->plugInFlags & 4) != 0) {
      return 0;
    }
    *(unsigned char *)&self->plugInFlags |= 4u;
    id v4 = [(NSDictionary *)self->infoDictionary objectForKey:@"helpURL"];
    if (!v4)
    {
      id v5 = [(PROConcretePlugIn *)self displayName];
      goto LABEL_10;
    }
    id v5 = v4;
    if ([v4 rangeOfString:@"://"] == 0x7FFFFFFFFFFFFFFFLL
      || (id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "allocWithZone:", -[PROConcretePlugIn zone](self, "zone")), "initWithString:", v5), (self->helpURL = (NSURL *)result) == 0))
    {
      id v6 = (__CFString *)[v5 pathExtension];
      if ([(__CFString *)v6 length])
      {
        id v5 = (id)[v5 stringByDeletingPathExtension];
        goto LABEL_11;
      }
LABEL_10:
      id v6 = @"html";
LABEL_11:
      v7 = [(NSBundle *)self->bundle pathForResource:v5 ofType:v6];
      if (v7)
      {
        id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "allocWithZone:", -[PROConcretePlugIn zone](self, "zone")), "initFileURLWithPath:", v7);
        self->helpURL = (NSURL *)result;
      }
      else
      {
        return self->helpURL;
      }
    }
  }
  return result;
}

- (id)version
{
  bundle = self->bundle;
  id v4 = [(NSDictionary *)self->infoDictionary objectForKey:@"version"];
  localizationTableName = self->localizationTableName;

  return [(NSBundle *)bundle localizedStringForKey:v4 value:0 table:localizationTableName];
}

- (id)infoString
{
  bundle = self->bundle;
  id v4 = [(NSDictionary *)self->infoDictionary objectForKey:@"infoString"];
  localizationTableName = self->localizationTableName;

  return [(NSBundle *)bundle localizedStringForKey:v4 value:0 table:localizationTableName];
}

- (id)vendorName
{
  bundle = self->bundle;
  id v4 = [(NSDictionary *)self->infoDictionary objectForKey:@"vendorName"];
  localizationTableName = self->localizationTableName;

  return [(NSBundle *)bundle localizedStringForKey:v4 value:0 table:localizationTableName];
}

- (id)description
{
  id result = [(PROConcretePlugIn *)self displayName];
  if (!result)
  {
    v3 = (objc_class *)objc_opt_class();
    return NSStringFromClass(v3);
  }
  return result;
}

- (id)implementedProtocols
{
  return [(NSDictionary *)self->infoDictionary objectForKey:@"protocolNames"];
}

- (id)infoDictionary
{
  return self->infoDictionary;
}

- (id)apiUsedByPlugInForProtocol:(id)a3
{
  return (id)[(PROPlugInDelegate *)self->delegate apiForProtocol:a3];
}

- (BOOL)is3rdParty
{
  return ![(NSString *)[(NSBundle *)self->bundle bundleIdentifier] hasPrefix:@"com.apple."];
}

@end