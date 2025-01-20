@interface FxHostCapabilities
+ (id)getRemoteHostCapabilities;
+ (void)setRemoteHostCapabilities:(id)a3;
- (BOOL)formatsFloatRGBABitmapsAsARGB;
- (BOOL)hostIsFCE;
- (BOOL)hostIsFCP;
- (BOOL)hostIsMotion;
- (BOOL)notifiesParameterChangedForGenerators;
- (BOOL)parameterChangedUsableForAllParameters;
- (BOOL)supportsDisabledParameters;
- (BOOL)supportsGroupParameters;
- (BOOL)supportsHiddenParameters;
- (BOOL)supportsTemporalBitmaps;
- (BOOL)upscalesFields;
- (FxHostCapabilities)initWithAPIManager:(id)a3;
- (id)glContextPixelFormatAttributes;
- (id)hostID;
- (unint64_t)timeBase;
- (unsigned)hostVersionNumber;
- (void)dealloc;
@end

@implementation FxHostCapabilities

- (FxHostCapabilities)initWithAPIManager:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FxHostCapabilities;
  v4 = [(FxHostCapabilities *)&v15 init];
  if (v4)
  {
    v5 = (FxHostCapabilitiesPriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800402D5EB2C2uLL);
    v4->_hostCapPriv = v5;
    if (v5)
    {
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        v7 = MainBundle;
        if (![(__CFString *)(id)CFBundleGetIdentifier(MainBundle) hasPrefix:@"com.apple."])
        {
          hostCapPriv = v4->_hostCapPriv;
          long long v10 = *(_OWORD *)&qword_1E9EE58D0;
          *(_OWORD *)&hostCapPriv->var0 = gRemoteCapabilities;
          *(_OWORD *)&hostCapPriv->var2 = v10;
          id v11 = v4->_hostCapPriv->var0;
          id v12 = v4->_hostCapPriv->var2;
          id v13 = v4->_hostCapPriv->var3;
          return v4;
        }
        LODWORD(MainBundle) = CFBundleGetVersionNumber(v7);
      }
      v4->_hostCapPriv->var1 = MainBundle;
      v4->_hostCapPriv->var0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
      v8 = (void *)[a3 apiForProtocol:&unk_1F121E168];
      if (v8) {
        v4->_hostCapPriv->var2 = (id)[v8 hostProperties];
      }
      else {
        v4->_hostCapPriv->var2 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  hostCapPriv = self->_hostCapPriv;
  if (hostCapPriv)
  {
    if (hostCapPriv->var0)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    id var2 = hostCapPriv->var2;
    if (var2)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    id var3 = hostCapPriv->var3;
    if (var3)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    free(hostCapPriv);
  }
  v6.receiver = self;
  v6.super_class = (Class)FxHostCapabilities;
  [(FxHostCapabilities *)&v6 dealloc];
}

+ (void)setRemoteHostCapabilities:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __48__FxHostCapabilities_setRemoteHostCapabilities___block_invoke;
  block[3] = &unk_1E616BC38;
  block[4] = a3;
  if (setRemoteHostCapabilities__onceToken != -1) {
    dispatch_once(&setRemoteHostCapabilities__onceToken, block);
  }
}

id __48__FxHostCapabilities_setRemoteHostCapabilities___block_invoke(uint64_t a1)
{
  *(void *)&gRemoteCapabilities = (id)[*(id *)(a1 + 32) objectForKey:@"HostID"];
  DWORD2(gRemoteCapabilities) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"HostVersion"), "unsignedIntValue");
  qword_1E9EE58D0 = (uint64_t)(id)[*(id *)(a1 + 32) objectForKey:@"HostProperties"];
  id result = objc_alloc_init(MEMORY[0x1E4F1C978]);
  qword_1E9EE58D8 = (uint64_t)result;
  gRemoteCapsSet = 1;
  return result;
}

+ (id)getRemoteHostCapabilities
{
  v4[4] = *MEMORY[0x1E4F143B8];
  if (gRemoteCapsSet != 1) {
    return 0;
  }
  v4[0] = gRemoteCapabilities;
  v3[0] = @"HostID";
  v3[1] = @"HostVersion";
  v4[1] = [NSNumber numberWithUnsignedInt:DWORD2(gRemoteCapabilities)];
  v4[2] = qword_1E9EE58D0;
  v3[2] = @"HostProperties";
  v3[3] = @"kFxHostPropertiesKey_GLContextPixelFormatAttributes";
  v4[3] = [MEMORY[0x1E4F1C978] array];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
}

- (id)hostID
{
  hostCapPriv = self->_hostCapPriv;
  id var2 = hostCapPriv->var2;
  if (var2)
  {
    if ([var2 valueForKey:@"UsingMotionRendering"]) {
      return @"com.apple.Motion";
    }
    hostCapPriv = self->_hostCapPriv;
  }
  return hostCapPriv->var0;
}

- (BOOL)hostIsMotion
{
  hostCapPriv = self->_hostCapPriv;
  id var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)[var2 valueForKey:@"UsingMotionRendering"];
    if (v5)
    {
      return [v5 BOOLValue];
    }
    hostCapPriv = self->_hostCapPriv;
  }
  id var0 = hostCapPriv->var0;

  return [var0 isEqualToString:@"com.apple.motion"];
}

- (BOOL)hostIsFCP
{
  hostCapPriv = self->_hostCapPriv;
  id var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)[var2 valueForKey:@"UsingMotionRendering"];
    if (v5) {
      return [v5 BOOLValue] ^ 1;
    }
    hostCapPriv = self->_hostCapPriv;
  }
  id var0 = hostCapPriv->var0;

  return [var0 hasPrefix:@"com.apple.FinalCut"];
}

- (BOOL)hostIsFCE
{
  hostCapPriv = self->_hostCapPriv;
  id var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)[var2 valueForKey:@"UsingMotionRendering"];
    if (v5) {
      return [v5 BOOLValue] ^ 1;
    }
    hostCapPriv = self->_hostCapPriv;
  }
  id var0 = hostCapPriv->var0;

  return [var0 isEqualToString:@"com.apple.FinalCutExpress"];
}

- (unsigned)hostVersionNumber
{
  hostCapPriv = self->_hostCapPriv;
  id var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)[var2 valueForKey:@"HostVersion"];
    if (v5)
    {
      unsigned int v6 = [v5 intValue];
      hostCapPriv = self->_hostCapPriv;
      hostCapPriv->var1 = v6;
    }
    else
    {
      hostCapPriv = self->_hostCapPriv;
    }
  }
  return hostCapPriv->var1;
}

- (BOOL)formatsFloatRGBABitmapsAsARGB
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"FormatsFloatRGBABitmapsAsARGB"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else
  {
    return [(FxHostCapabilities *)self hostIsMotion];
  }
}

- (BOOL)supportsHiddenParameters
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"SupportsHiddenParameters"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else if ([(FxHostCapabilities *)self hostIsFCE])
  {
    return 0;
  }
  else
  {
    return ![(FxHostCapabilities *)self hostIsFCP];
  }
}

- (BOOL)supportsDisabledParameters
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"SupportsDisabledParameters"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else if ([(FxHostCapabilities *)self hostIsFCE])
  {
    return 0;
  }
  else
  {
    return ![(FxHostCapabilities *)self hostIsFCP];
  }
}

- (BOOL)supportsGroupParameters
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"SupportsGroupParameters"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else
  {
    return [(FxHostCapabilities *)self hostIsMotion];
  }
}

- (BOOL)notifiesParameterChangedForGenerators
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"NotifiesParameterChangedForGenerators"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else if ([(FxHostCapabilities *)self hostIsFCE])
  {
    return 0;
  }
  else
  {
    return ![(FxHostCapabilities *)self hostIsFCP];
  }
}

- (BOOL)parameterChangedUsableForAllParameters
{
  id var2 = self->_hostCapPriv->var2;
  if (!var2) {
    return ![(FxHostCapabilities *)self hostIsMotion];
  }
  v4 = (void *)[var2 valueForKey:@"ParameterChangedUsableForAllParameters"];
  if (!v4) {
    return ![(FxHostCapabilities *)self hostIsMotion];
  }

  return [v4 BOOLValue];
}

- (BOOL)upscalesFields
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"UpscalesFields"]) != 0)
  {
    return [v4 BOOLValue];
  }
  else
  {
    return [(FxHostCapabilities *)self hostIsMotion];
  }
}

- (BOOL)supportsTemporalBitmaps
{
  id var2 = self->_hostCapPriv->var2;
  if (!var2) {
    return ![(FxHostCapabilities *)self hostIsMotion];
  }
  v4 = (void *)[var2 valueForKey:@"SupportsTemporalBitmaps"];
  if (!v4) {
    return ![(FxHostCapabilities *)self hostIsMotion];
  }

  return [v4 BOOLValue];
}

- (unint64_t)timeBase
{
  id var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)[var2 valueForKey:@"TimeBase"]) != 0) {
    return (int)[v4 intValue];
  }
  else {
    return [(FxHostCapabilities *)self hostIsMotion] ^ 1;
  }
}

- (id)glContextPixelFormatAttributes
{
  hostCapPriv = self->_hostCapPriv;
  if (!hostCapPriv->var3)
  {
    id var2 = hostCapPriv->var2;
    if (var2)
    {
      self->_hostCapPriv->id var3 = (id)[var2 valueForKey:@"kFxHostPropertiesKey_GLContextPixelFormatAttributes"];
    }
    else if ([(FxHostCapabilities *)self hostIsMotion])
    {
      [(FxHostCapabilities *)self hostVersionNumber];
    }
  }
  return self->_hostCapPriv->var3;
}

@end