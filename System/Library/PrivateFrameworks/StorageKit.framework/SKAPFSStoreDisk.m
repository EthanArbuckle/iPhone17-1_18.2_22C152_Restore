@interface SKAPFSStoreDisk
- (BOOL)canResize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOurContainerWithDisk:(id)a3;
- (NSString)apfsContainerIdentifier;
- (NSString)apfsContainerUUID;
- (id)container;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (void)setApfsContainerIdentifier:(id)a3;
- (void)setApfsContainerUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSStoreDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)SKAPFSStoreDisk;
  [(SKDisk *)&v8 updateWithDictionary:v4];
  v6 = [v4 objectForKey:@"apfsContainerUUID"];
  [(SKAPFSStoreDisk *)v5 setApfsContainerUUID:v6];

  v7 = [v4 objectForKey:@"apfsContainerIdentifier"];
  [(SKAPFSStoreDisk *)v5 setApfsContainerIdentifier:v7];

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSStoreDisk;
  v3 = [(SKDisk *)&v7 minimalDictionaryRepresentation];
  id v4 = [(SKAPFSStoreDisk *)v2 apfsContainerUUID];
  [v3 setValue:v4 forKey:@"apfsContainerUUID"];

  v5 = [(SKAPFSStoreDisk *)v2 apfsContainerIdentifier];
  [v3 setValue:v5 forKey:@"apfsContainerIdentifier"];

  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKAPFSStoreDisk;
  if ([(SKDisk *)&v11 isEqual:v4])
  {
    v5 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
    v6 = [v4 apfsContainerUUID];
    if ([v5 isEqualToString:v6])
    {
      objc_super v7 = [(SKAPFSStoreDisk *)self apfsContainerIdentifier];
      objc_super v8 = [v4 apfsContainerIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  id v4 = NSString;
  v5 = [(SKAPFSStoreDisk *)self apfsUUID];
  if (v5)
  {
    v6 = [(SKAPFSStoreDisk *)self apfsUUID];
  }
  else
  {
    v6 = @"--";
  }
  objc_super v7 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
  if (v7)
  {
    objc_super v8 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
    char v9 = [v4 stringWithFormat:@"APFS UUID: %@, Container UUID: %@", v6, v8];
  }
  else
  {
    char v9 = [v4 stringWithFormat:@"APFS UUID: %@, Container UUID: %@", v6, @"--"];
  }

  if (v5) {

  }
  return v9;
}

- (BOOL)canResize
{
  return 1;
}

- (BOOL)isOurContainerWithDisk:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
    if (!v6) {
      goto LABEL_4;
    }
    objc_super v7 = (void *)v6;
    objc_super v8 = [(SKAPFSStoreDisk *)self apfsContainerUUID];
    char v9 = [v5 apfsUUID];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
      char v13 = 0;
    }
    else
    {
LABEL_4:
      objc_super v11 = [v5 diskIdentifier];
      v12 = [(SKAPFSStoreDisk *)self apfsContainerIdentifier];
      char v13 = [v11 isEqualToString:v12];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)container
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = +[SKBaseManager sharedManager];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "allDisks", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(SKAPFSStoreDisk *)self isOurContainerWithDisk:v9])
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)apfsContainerUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setApfsContainerUUID:(id)a3
{
}

- (NSString)apfsContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setApfsContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apfsContainerIdentifier, 0);

  objc_storeStrong((id *)&self->_apfsContainerUUID, 0);
}

@end