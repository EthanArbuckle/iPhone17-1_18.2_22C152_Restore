@interface SKIOMedia
- (NSString)BSDName;
- (SKIOMedia)initWithDADisk:(id)a3;
- (SKIOMedia)initWithDevName:(id)a3;
- (id)copyBlockDevice;
@end

@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  mach_port_t v5 = *MEMORY[0x263F0EC88];
  id v6 = [v4 lastPathComponent];
  CFDictionaryRef v7 = IOBSDNameMatching(v5, 0, (const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v7);

  if (MatchingService)
  {
    v12.receiver = self;
    v12.super_class = (Class)SKIOMedia;
    self = [(SKIOObject *)&v12 initWithIOObject:MatchingService];
    v9 = self;
  }
  else
  {
    v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "Failed to find IO media entry for %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (__DADisk *)a3;
  mach_port_t v5 = v4;
  if (!v4)
  {
LABEL_7:
    CFDictionaryRef v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = DADiskCopyIOMedia(v4);
  if (!v6)
  {
    v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v12 = v5;
      _os_log_impl(&dword_23F40C000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get IO media object for DA disk %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)SKIOMedia;
  self = [(SKIOObject *)&v10 initWithIOObject:v6];
  CFDictionaryRef v7 = self;
LABEL_8:

  return v7;
}

- (NSString)BSDName
{
  id v2 = [(SKIOObject *)self copyPropertyWithClass:objc_opt_class() key:@"BSD Name"];

  return (NSString *)v2;
}

- (id)copyBlockDevice
{
  id v2 = [(SKIOObject *)self ioObjectWithClassName:@"IOBlockStorageDevice" iterateParents:1];
  v3 = [(SKIOObject *)[SKBlockDevice alloc] initWithSKIOObject:v2];

  return v3;
}

@end