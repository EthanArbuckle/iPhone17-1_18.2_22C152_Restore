@interface UARPBundleIdentityChipEntry
- (NSArray)manifest;
- (NSString)chipName;
- (UARPBundleIdentityChipEntry)initWithChipName:(id)a3 boardID:(id)a4 chipID:(id)a5 securityDomain:(id)a6 manifest:(id)a7;
- (UARPPersonalizationNumberTuple32)boardID;
- (UARPPersonalizationNumberTuple32)chipID;
- (UARPPersonalizationNumberTuple32)manifestEpoch;
- (UARPPersonalizationNumberTuple32)securityDomain;
- (id)description;
- (id)descriptionWithTabDepth:(unint64_t)a3;
- (void)dealloc;
- (void)setManifestEpoch:(id)a3;
@end

@implementation UARPBundleIdentityChipEntry

- (UARPBundleIdentityChipEntry)initWithChipName:(id)a3 boardID:(id)a4 chipID:(id)a5 securityDomain:(id)a6 manifest:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)UARPBundleIdentityChipEntry;
  v12 = [(UARPBundleIdentityChipEntry *)&v14 init];
  if (v12)
  {
    v12->_chipName = (NSString *)[a3 copy];
    v12->_boardID = (UARPPersonalizationNumberTuple32 *)a4;
    v12->_chipID = (UARPPersonalizationNumberTuple32 *)a5;
    v12->_securityDomain = (UARPPersonalizationNumberTuple32 *)a6;
    v12->_manifest = (NSArray *)a7;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPBundleIdentityChipEntry;
  [(UARPBundleIdentityChipEntry *)&v3 dealloc];
}

- (id)description
{
  return [(UARPBundleIdentityChipEntry *)self descriptionWithTabDepth:0];
}

- (id)descriptionWithTabDepth:(unint64_t)a3
{
  id v5 = sub_1000346B4(a3);
  id v6 = sub_1000346B4(a3 + 1);
  id v7 = +[NSMutableString string];
  v8 = (objc_class *)objc_opt_class();
  [v7 appendFormat:@"%@%@\n", v5, NSStringFromClass(v8)];
  [v7 appendFormat:@"%@{\n", v5];
  [v7 appendFormat:@"%@Chip name: %@\n", v6, self->_chipName];
  [v7 appendFormat:@"%@%@\n", v6, self->_boardID];
  [v7 appendFormat:@"%@%@\n", v6, self->_chipID];
  [v7 appendFormat:@"%@%@\n", v6, self->_securityDomain];
  manifestEpoch = self->_manifestEpoch;
  if (manifestEpoch) {
    [v7 appendFormat:@"%@%@\n", v6, manifestEpoch];
  }
  [v7 appendFormat:@"%@Manifest\n", v6];
  [v7 appendFormat:@"%@{\n", v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  manifest = self->_manifest;
  id v11 = [(NSArray *)manifest countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    unint64_t v14 = a3 + 2;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(manifest);
        }
        [v7 appendFormat:@"%@\n", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v15), "descriptionWithTabDepth:", v14)];
        v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      id v12 = [(NSArray *)manifest countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  [v7 appendFormat:@"%@}\n", v6];
  [v7 appendFormat:@"%@}", v5];
  return +[NSString stringWithString:v7];
}

- (NSString)chipName
{
  return self->_chipName;
}

- (UARPPersonalizationNumberTuple32)boardID
{
  return self->_boardID;
}

- (UARPPersonalizationNumberTuple32)chipID
{
  return self->_chipID;
}

- (UARPPersonalizationNumberTuple32)securityDomain
{
  return self->_securityDomain;
}

- (UARPPersonalizationNumberTuple32)manifestEpoch
{
  return (UARPPersonalizationNumberTuple32 *)objc_getProperty(self, a2, 40, 1);
}

- (void)setManifestEpoch:(id)a3
{
}

- (NSArray)manifest
{
  return self->_manifest;
}

@end