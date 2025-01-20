@interface SKIOMedia
- (NSString)BSDName;
- (SKIOMedia)initWithDADisk:(id)a3;
- (SKIOMedia)initWithDevName:(id)a3;
- (id)copyBlockDevice;
@end

@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  CFDictionaryRef v6 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v5 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);

  if (MatchingService)
  {
    v11.receiver = self;
    v11.super_class = (Class)SKIOMedia;
    self = [(SKIOObject *)&v11 initWithIOObject:MatchingService];
    v8 = self;
  }
  else
  {
    v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find IO media entry for %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  id v4 = (__DADisk *)a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = DADiskCopyIOMedia(v4);
  if (!v6)
  {
    v8 = sub_10000DD48();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get IO media object for DA disk %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)SKIOMedia;
  self = [(SKIOObject *)&v10 initWithIOObject:v6];
  v7 = self;
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