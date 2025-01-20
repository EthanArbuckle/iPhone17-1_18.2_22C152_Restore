@interface OZFxPlugHostPropertiesAPI
+ (id)sharedHostPropertiesAPI;
+ (void)releaseSharedHostPropertiesAPI;
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (id)hostProperties;
@end

@implementation OZFxPlugHostPropertiesAPI

+ (id)sharedHostPropertiesAPI
{
  id result = (id)gHostProps;
  if (!gHostProps)
  {
    id result = objc_alloc_init(OZFxPlugHostPropertiesAPI);
    gHostProps = (uint64_t)result;
  }
  return result;
}

+ (void)releaseSharedHostPropertiesAPI
{
}

- (id)hostProperties
{
  uint64_t v2 = *(unsigned __int8 *)(theApp + 81);
  v14 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v13 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithBool:1];
  uint64_t v9 = [NSNumber numberWithBool:1];
  uint64_t v10 = [NSNumber numberWithBool:1];
  uint64_t v11 = [NSNumber numberWithUnsignedLong:v2];
  return (id)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v13, @"FormatsFloatRGBABitmapsAsARGB", v3, @"SupportsHiddenParameters", v4, @"SupportsDisabledParameters", v5, @"SupportsGroupParameters", v6, @"NotifiesParameterChangedForGenerators", v7, @"ParameterChangedUsableForAllParameters", v8, @"UpscalesFields", v9, @"UsingMotionRendering", v10,
               @"SupportsTemporalBitmaps",
               v11,
               @"TimeBase",
               [NSNumber numberWithUnsignedLong:87064576],
               @"HostVersion",
               0);
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F121E168 == a3;
}

@end