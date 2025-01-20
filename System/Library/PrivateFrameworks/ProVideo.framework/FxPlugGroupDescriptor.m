@interface FxPlugGroupDescriptor
+ (id)fxPlugGroupDescriptorWithUUID:(id)a3 andDisplayName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FxPlugGroupDescriptor)initWithUUID:(id)a3 andDisplayName:(id)a4;
- (id)displayName;
- (id)uuid;
- (void)dealloc;
@end

@implementation FxPlugGroupDescriptor

- (FxPlugGroupDescriptor)initWithUUID:(id)a3 andDisplayName:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FxPlugGroupDescriptor;
  v6 = [(FxPlugGroupDescriptor *)&v9 init];
  if (v6)
  {
    v7 = (FxPlugGroupDescriptorPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v6->_priv = v7;
    if (v7) {
      v6->_priv->var0 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"UUID", a4, @"DisplayName", 0);
    }
  }
  return v6;
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
  v10.super_class = (Class)FxPlugGroupDescriptor;
  [(FxPlugGroupDescriptor *)&v10 dealloc];
}

+ (id)fxPlugGroupDescriptorWithUUID:(id)a3 andDisplayName:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUUID:a3 andDisplayName:a4];

  return v4;
}

- (id)displayName
{
  return (id)[self->_priv->var0 objectForKey:@"DisplayName"];
}

- (id)uuid
{
  return (id)[self->_priv->var0 objectForKey:@"UUID"];
}

- (BOOL)isEqual:(id)a3
{
  int v5 = objc_msgSend(-[FxPlugGroupDescriptor uuid](self, "uuid"), "isEqualToString:", objc_msgSend(a3, "uuid"));
  if (v5)
  {
    id v6 = [(FxPlugGroupDescriptor *)self displayName];
    uint64_t v7 = [a3 displayName];
    LOBYTE(v5) = [v6 isEqualToString:v7];
  }
  return v5;
}

@end