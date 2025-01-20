@interface FxHost
+ (id)_createPathArrayFromURLArray:(id)a3;
+ (id)fxPlugsFolderURLs;
+ (id)host;
+ (id)internalPlugInsFolderURL;
+ (id)plugInsFolderURLs;
- (BOOL)allowBuiltInEffectsForPlugInTypeUUID:(id)a3;
- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4;
- (BOOL)isSamplePredetermined:(id)a3;
- (BOOL)isStreamPremultiplied:(id)a3;
- (BOOL)supportsParameterClass:(Class)a3;
- (FxHost)init;
- (double)durationForStream:(id)a3;
- (double)frameDurationForStream:(id)a3;
- (double)globalFrameDuration;
- (double)pixelAspectForStream:(id)a3;
- (double)startTimeForStream:(id)a3;
- (id)_createDefaultSearchableURLsDict;
- (id)_createDefaultSupportBuiltInsDict;
- (id)_findGroupInList:(id)a3 withIdenticalDescriptor:(id)a4;
- (id)defaultSupportedPlugInTypeUUIDs;
- (id)domainOfDefinitionForSample:(id)a3;
- (id)evaluateSample:(id)a3 withOptions:(id)a4;
- (id)hostName;
- (id)requiredSamplesForSample:(id)a3;
- (id)supportedPlugInTypeUUIDs;
- (id)uniqueID;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)fieldOrderForSample:(id)a3;
- (unsigned)globalTimeScale;
- (unsigned)timeScaleForStream:(id)a3;
- (void)dealloc;
- (void)invalidateFxPlugDescriptorArray;
- (void)setAllowBuiltInEffects:(BOOL)a3 forPlugInTypeUUID:(id)a4;
- (void)setSupportedPlugInTypeUUIDs:(id)a3;
@end

@implementation FxHost

+ (id)_createPathArrayFromURLArray:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v5 = (void *)[a3 objectEnumerator];
  for (i = v5; ; v5 = i)
  {
    v7 = (void *)[v5 nextObject];
    if (!v7) {
      break;
    }
    objc_msgSend(v4, "addObject:", objc_msgSend(v7, "path"));
  }
  return v4;
}

- (id)_createDefaultSearchableURLsDict
{
  id var2 = self->_priv->var2;
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = (void *)[var2 objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if ([v6 isEqual:@"ACF57DAE-E1BB-11D8-BF80-000A95DF1816"])
      {
        uint64_t v7 = [(id)objc_opt_class() fxPlugsFolderURLs];
        if (v7) {
          [v3 setObject:v7 forKey:v6];
        }
      }
      v6 = (void *)[v4 nextObject];
    }
    while (v6);
  }
  return v3;
}

- (id)_createDefaultSupportBuiltInsDict
{
  id var2 = self->_priv->var2;
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = (void *)[var2 objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), v6);
      uint64_t v6 = [v4 nextObject];
    }
    while (v6);
  }
  return v3;
}

- (FxHost)init
{
  v9.receiver = self;
  v9.super_class = (Class)FxHost;
  v2 = [(FxHost *)&v9 init];
  if (v2)
  {
    v3 = (FxHostPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x80040C96DFCA5uLL);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->var0 = +[PROPlugInManager sharedPlugInManager];
      id v4 = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      v2->_priv->id var2 = v4;
      [v4 addObject:@"ACF57DAE-E1BB-11D8-BF80-000A95DF1816"];
      v2->_priv->var1 = v2->_priv->var2;
      id v5 = [(FxHost *)v2 _createDefaultSearchableURLsDict];
      v2->_priv->var4 = v5;
      id v6 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
      priv = v2->_priv;
      priv->var3 = v6;
      priv->var6 = 0;
      v2->_priv->var5 = [(FxHost *)v2 _createDefaultSupportBuiltInsDict];
    }
  }
  return v2;
}

+ (id)host
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v16.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    id var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    id var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    id var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    id var4 = priv->var4;
    if (var4)
    {

      priv = self->_priv;
    }
    id var5 = priv->var5;
    if (var5)
    {

      priv = self->_priv;
    }
    id var6 = priv->var6;
    if (var6)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v16.receiver = self;
  v16.super_class = (Class)FxHost;
  [(FxHost *)&v16 dealloc];
}

+ (id)internalPlugInsFolderURL
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/Library/Application Support/ProApps/Internal Plug-Ins"];
}

+ (id)plugInsFolderURLs
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = +[FxHost internalPlugInsFolderURL];
  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/Library/Plug-Ins"];
  return (id)[v2 arrayWithObjects:v3, v4, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(@"~/Library/Plug-Ins", "stringByExpandingTildeInPath")), 0];
}

+ (id)fxPlugsFolderURLs
{
  id v2 = +[FxHost plugInsFolderURLs];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = (void *)[v2 objectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:relativeToURL:", @"FxPlug/", v6));
      uint64_t v6 = [v4 nextObject];
    }
    while (v6);
  }
  return v3;
}

- (void)invalidateFxPlugDescriptorArray
{
  priv = self->_priv;
  id var6 = priv->var6;
  if (var6)
  {
    priv->id var6 = 0;
  }
}

- (id)defaultSupportedPlugInTypeUUIDs
{
  return self->_priv->var2;
}

- (id)supportedPlugInTypeUUIDs
{
  return self->_priv->var1;
}

- (void)setSupportedPlugInTypeUUIDs:(id)a3
{
  if (([a3 isEqualToArray:self->_priv->var1] & 1) == 0)
  {
    id var1 = self->_priv->var1;
    self->_priv->id var1 = a3;
    if (var1)
    {
    }
  }
}

- (BOOL)allowBuiltInEffectsForPlugInTypeUUID:(id)a3
{
  id v3 = (void *)[self->_priv->var5 objectForKey:a3];

  return [v3 BOOLValue];
}

- (void)setAllowBuiltInEffects:(BOOL)a3 forPlugInTypeUUID:(id)a4
{
  BOOL v5 = a3;
  uint64_t v7 = (void *)[self->_priv->var5 objectForKey:a4];
  if (!v7 || [v7 BOOLValue] != v5)
  {
    objc_msgSend(self->_priv->var5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v5), a4);
    [(FxHost *)self invalidateFxPlugDescriptorArray];
  }
}

- (id)_findGroupInList:(id)a3 withIdenticalDescriptor:(id)a4
{
  BOOL v5 = (void *)[a3 objectEnumerator];
  do
  {
    uint64_t v6 = (void *)[v5 nextObject];
    uint64_t v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "descriptor"), "isEqual:", a4));
  return v7;
}

- (unsigned)timeScaleForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_11.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)startTimeForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_12.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)durationForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_13.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)frameDurationForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_14.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4
{
  FxDebugLog(&cfstr_Fxstreamprovid_15.isa, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)isStreamPremultiplied:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_16.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)pixelAspectForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_17.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isSamplePredetermined:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_18.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)requiredSamplesForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_19.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)evaluateSample:(id)a3 withOptions:(id)a4
{
  FxDebugLog(&cfstr_Fxstreamprovid_20.isa, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)fieldOrderForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxhostenvironm.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)domainOfDefinitionForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_21.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (unsigned)globalTimeScale
{
  FxDebugLog(&cfstr_Fxhostenvironm_0.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)globalFrameDuration
{
  FxDebugLog(&cfstr_Fxhostenvironm_1.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (id)uniqueID
{
  FxDebugLog(&cfstr_Fxhostenvironm_2.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return &stru_1F119C770;
}

- (id)hostName
{
  FxDebugLog(&cfstr_Fxhostenvironm_3.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return &stru_1F119C770;
}

- (int)majorVersion
{
  FxDebugLog(&cfstr_Fxhostenvironm_4.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (int)minorVersion
{
  FxDebugLog(&cfstr_Fxhostenvironm_5.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)supportsParameterClass:(Class)a3
{
  FxDebugLog(&cfstr_Fxhostenvironm_6.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end