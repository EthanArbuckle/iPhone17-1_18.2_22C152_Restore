@interface SFAccessControlEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)canRead;
- (BOOL)canWrite;
- (BOOL)isOwner;
- (NSString)bundleID;
- (SFAccessControlEntry)initWithBundleID:(id)a3 owner:(BOOL)a4 canRead:(BOOL)a5 canWrite:(BOOL)a6;
- (SFAccessControlEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBundleID:(id)a3;
- (void)setCanRead:(BOOL)a3;
- (void)setCanWrite:(BOOL)a3;
- (void)setOwner:(BOOL)a3;
@end

@implementation SFAccessControlEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAccessControlEntry)initWithBundleID:(id)a3 owner:(BOOL)a4 canRead:(BOOL)a5 canWrite:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAccessControlEntry;
  v11 = [(SFAccessControlEntry *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    accessControlEntryInternal = v11->_accessControlEntryInternal;
    v14 = (void *)accessControlEntryInternal[1];
    accessControlEntryInternal[1] = v12;

    *((unsigned char *)v11->_accessControlEntryInternal + 16) = *((unsigned char *)v11->_accessControlEntryInternal + 16) & 0xFE | a4;
    if (v7) {
      char v15 = 2;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)v11->_accessControlEntryInternal + 16) = *((unsigned char *)v11->_accessControlEntryInternal + 16) & 0xFD | v15;
    if (v6) {
      char v16 = 4;
    }
    else {
      char v16 = 0;
    }
    *((unsigned char *)v11->_accessControlEntryInternal + 16) = *((unsigned char *)v11->_accessControlEntryInternal + 16) & 0xFB | v16;
  }

  return v11;
}

- (SFAccessControlEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAccessControlEntry;
  return [(SFAccessControlEntry *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  accessControlEntryInternal = self->_accessControlEntryInternal;
  uint64_t v6 = accessControlEntryInternal[1];
  unsigned int v7 = *((unsigned __int8 *)accessControlEntryInternal + 16);
  return (id)[v4 initWithBundleID:v6 owner:v7 & 1 canRead:(v7 >> 1) & 1 canWrite:(v7 >> 2) & 1];
}

- (BOOL)isOwner
{
  return *((unsigned char *)self->_accessControlEntryInternal + 16) & 1;
}

- (void)setOwner:(BOOL)a3
{
  *((unsigned char *)self->_accessControlEntryInternal + 16) = *((unsigned char *)self->_accessControlEntryInternal + 16) & 0xFE | a3;
}

- (BOOL)canRead
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 1) & 1;
}

- (void)setCanRead:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self->_accessControlEntryInternal + 16) = *((unsigned char *)self->_accessControlEntryInternal + 16) & 0xFD | v3;
}

- (BOOL)canWrite
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 2) & 1;
}

- (void)setCanWrite:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self->_accessControlEntryInternal + 16) = *((unsigned char *)self->_accessControlEntryInternal + 16) & 0xFB | v3;
}

- (NSString)bundleID
{
  v2 = (void *)[*((id *)self->_accessControlEntryInternal + 1) copy];
  return (NSString *)v2;
}

- (void)setBundleID:(id)a3
{
  *((void *)self->_accessControlEntryInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end