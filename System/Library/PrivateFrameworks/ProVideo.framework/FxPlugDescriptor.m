@interface FxPlugDescriptor
+ (id)fxPlugDescriptorWithPROPlugIn:(void *)a3;
- (BOOL)canDoGPU;
- (BOOL)requiresCoreImage;
- (Class)plugInClass;
- (FxPlugDescriptor)initWithPROPlugIn:(void *)a3;
- (id)displayName;
- (id)flavor;
- (id)groupDescriptor;
- (id)plugInTypeUUID;
- (id)properties;
- (id)uuid;
- (id)version;
- (void)dealloc;
@end

@implementation FxPlugDescriptor

- (FxPlugDescriptor)initWithPROPlugIn:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FxPlugDescriptor;
  v4 = [(FxPlugDescriptor *)&v7 init];
  if (v4)
  {
    v5 = (FxPlugDescriptorPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v4->_priv = v5;
    if (v5) {
      v4->_priv->var0 = a3;
    }
  }
  return v4;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxPlugDescriptor;
  [(FxPlugDescriptor *)&v10 dealloc];
}

+ (id)fxPlugDescriptorWithPROPlugIn:(void *)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPROPlugIn:a3];

  return v3;
}

- (id)properties
{
  id var0 = self->_priv->var0;
  if (var0)
  {
    uint64_t v3 = (void *)[var0 infoDictionary];
    return (id)[v3 objectForKey:@"FxPlugProperties"];
  }
  else
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
}

- (Class)plugInClass
{
  id var0 = self->_priv->var0;
  if (var0)
  {
    return (Class)[var0 plugInClass];
  }
  else
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
}

- (id)flavor
{
  id v2 = [(FxPlugDescriptor *)self properties];

  return (id)[v2 objectForKey:@"Flavor"];
}

- (id)plugInTypeUUID
{
  return @"ACF57DAE-E1BB-11D8-BF80-000A95DF1816";
}

- (id)displayName
{
  id var0 = self->_priv->var0;
  if (var0)
  {
    return (id)[var0 displayName];
  }
  else
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
}

- (id)uuid
{
  id var0 = self->_priv->var0;
  if (var0)
  {
    uint64_t v3 = (__CFString *)CFUUIDCreateString(0, (CFUUIDRef)[var0 uuid]);
    return v3;
  }
  else
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
}

- (id)version
{
  id var0 = self->_priv->var0;
  if (var0)
  {
    return (id)[var0 version];
  }
  else
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
}

- (id)groupDescriptor
{
  id var0 = self->_priv->var0;
  if (!var0)
  {
    NSLog(&cfstr_FxplugIsNotNat.isa, a2);
    return 0;
  }
  uint64_t v3 = (void *)[var0 group];
  FxDebugAssert(v3 != 0, &cfstr_PluginGroupRet.isa, v4, v5, v6, v7, v8, v9, v13);
  if (!v3) {
    return 0;
  }
  uint64_t v10 = [v3 displayName];
  CFStringRef v11 = (id)CFUUIDCreateString(0, (CFUUIDRef)[v3 uuid]);

  return +[FxPlugGroupDescriptor fxPlugGroupDescriptorWithUUID:v11 andDisplayName:v10];
}

- (BOOL)canDoGPU
{
  id v2 = objc_msgSend(-[FxPlugDescriptor properties](self, "properties"), "objectForKey:", @"CanDoGPU");

  return [v2 BOOLValue];
}

- (BOOL)requiresCoreImage
{
  id v2 = objc_msgSend(-[FxPlugDescriptor properties](self, "properties"), "objectForKey:", @"RequiresCoreImage");

  return [v2 BOOLValue];
}

@end