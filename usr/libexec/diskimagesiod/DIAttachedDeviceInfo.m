@interface DIAttachedDeviceInfo
+ (id)DI1URLWithData:(id)a3 error:(id *)a4;
+ (id)copyAllMountPoints;
+ (id)newDI1DevicesArrayWithError:(id *)a3;
+ (id)newDI2DevicesArrayWithError:(id *)a3;
+ (id)newDevicesArrayWithError:(id *)a3;
+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4;
- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4;
- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4;
- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4;
- (DIIOMedia)ioMedia;
- (NSNumber)blockSize;
- (NSNumber)mediaSize;
- (NSNumber)pid;
- (NSString)BSDName;
- (NSString)instanceId;
- (NSURL)cacheURL;
- (NSURL)imageURL;
- (NSURL)shadowURL;
- (id)copyEntitiesList;
- (id)description;
- (id)toDictionary;
- (int64_t)frameworkNum;
- (void)setIoMedia:(id)a3;
@end

@implementation DIAttachedDeviceInfo

- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIAttachedDeviceInfo;
  v7 = [(DIAttachedDeviceInfo *)&v20 init];
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (DIIOMedia *)[v6 copyIOMediaWithError:a4];
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = v8;

  v10 = v7->_ioMedia;
  if (!v10)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v11 = [(DIIOObject *)v10 copyPropertyWithClass:objc_opt_class() key:@"Size"];
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = v11;

  v13 = [(DIIOObject *)v7->_ioMedia copyPropertyWithClass:objc_opt_class() key:@"Preferred Block Size"];
  blockSize = v7->_blockSize;
  v7->_blockSize = v13;

  uint64_t v15 = [(DIIOMedia *)v7->_ioMedia BSDName];
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v15;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    v17 = +[DIError nilWithEnumValue:153 verboseInfo:@"Basic information about the IOMedia device is missing" error:a4];
    goto LABEL_10;
  }
  if (![v6 diskImageDevice])
  {
    if (!IOObjectConformsTo((io_object_t)[v6 ioObj], "IOHDIXHDDriveNub"))
    {
      v17 = +[DIError nilWithEnumValue:157 description:@"Device is not a disk image" error:a4];
      goto LABEL_10;
    }
    if ([(DIAttachedDeviceInfo *)v7 fillDI1InfoWithDevice:v6 error:a4]) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (![(DIAttachedDeviceInfo *)v7 fillDI2InfoWithDevice:v6 error:a4]) {
    goto LABEL_13;
  }
LABEL_8:
  v17 = v7;
LABEL_10:
  v18 = v17;
LABEL_14:

  return v18;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 copyPropertyWithClass:objc_opt_class() key:@"DiskImageURL"];
  if (v7)
  {
    v8 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v7];
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v8;
  }
  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0;
  }

  if (*p_imageURL)
  {
    id v11 = [v6 copyPropertyWithClass:objc_opt_class() key:@"ShadowURL"];
    if (v11)
    {
      v12 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v11];
      shadowURL = self->_shadowURL;
      self->_shadowURL = v12;
    }
    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0;
    }

    id v15 = [v6 copyPropertyWithClass:objc_opt_class() key:@"CacheURL"];
    if (v15)
    {
      v16 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v15];
      cacheURL = self->_cacheURL;
      self->_cacheURL = v16;
    }
    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0;
    }

    v18 = (NSString *)[v6 copyPropertyWithClass:objc_opt_class() key:@"InstanceID"];
    instanceId = self->_instanceId;
    self->_instanceId = v18;

    self->_frameworkNum = 2;
    if ([(DIAttachedDeviceInfo *)self setDI2PIDWithDevice:v6 error:a4]) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = +[DIError failWithEnumValue:153 verboseInfo:@"Failed to get Daemon PID" error:a4];
    }
  }
  else
  {
    BOOL v14 = +[DIError failWithEnumValue:153 verboseInfo:@"Invalid or missing image URL key" error:a4];
  }

  return v14;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v18 = -1;
  id v5 = [a3 newIteratorWithOptions:0 error:a4];
  id v6 = [[DIIOObject alloc] initWithIteratorNext:v5];
  if (v6)
  {
    id v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo([(DIIOObject *)v7 ioObj], "DIDeviceIOUserClient"))
      {
        id v8 = [(DIIOObject *)v7 copyPropertyWithClass:objc_opt_class() key:@"IOUserClientCreator"];
        if (v8) {
          break;
        }
      }
      v9 = [[DIIOObject alloc] initWithIteratorNext:v5];

      id v7 = v9;
      if (!v9) {
        goto LABEL_6;
      }
    }
    id v11 = v8;
    v12 = +[NSScanner scannerWithString:v8];
    v13 = +[NSCharacterSet decimalDigitCharacterSet];
    unsigned int v14 = [v12 scanUpToCharactersFromSet:v13 intoString:0];

    if (v14 && [v12 scanInteger:&v18])
    {
      id v15 = +[NSNumber numberWithInteger:v18];
      pid = self->_pid;
      self->_pid = v15;

      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];

  if (v6)
  {
    id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
    id v8 = v7;
    if (v7)
    {
      v9 = [v7 scheme];

      if (v9) {
        goto LABEL_8;
      }
    }
    id v10 = [objc_alloc((Class)NSURL) initFileURLWithPath:v6];

    id v8 = v10;
    if (v10) {
      goto LABEL_8;
    }
    CFStringRef v11 = @"Invalid path property (not a path or URL)";
  }
  else
  {
    CFStringRef v11 = @"Invalid path property (not UTF8)";
  }
  id v8 = +[DIError nilWithEnumValue:153 verboseInfo:v11 error:a4];
LABEL_8:

  return v8;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6 = [a3 copyParentWithError:a4];
  if (v6)
  {
    id v7 = [v6 copyPropertyWithClass:objc_opt_class() key:@"image-path"];
    if (v7)
    {
      id v8 = +[DIAttachedDeviceInfo DI1URLWithData:v7 error:a4];
      imageURL = self->_imageURL;
      self->_imageURL = v8;

      if (self->_imageURL)
      {
        id v10 = [v6 copyPropertyWithClass:objc_opt_class() key:@"shadow-path"];
        if (v10
          && (+[DIAttachedDeviceInfo DI1URLWithData:v10 error:a4], CFStringRef v11 = (NSURL *)objc_claimAutoreleasedReturnValue(), shadowURL = self->_shadowURL, self->_shadowURL = v11, shadowURL, !self->_shadowURL))
        {
          BOOL v13 = 0;
        }
        else
        {
          BOOL v13 = 1;
          self->_frameworkNum = 1;
          unsigned int v14 = (NSNumber *)[v6 copyPropertyWithClass:objc_opt_class() key:@"hdid-pid"];
          pid = self->_pid;
          self->_pid = v14;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&off_1001BB110;

            BOOL v13 = 1;
          }
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = +[DIError failWithEnumValue:153 verboseInfo:@"Missing image path property" error:a4];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[DIIOMedia alloc] initWithDevName:v6 error:a4];

  if (v7)
  {
    id v8 = [(DIIOMedia *)v7 copyBlockDeviceWithError:a4];
    if (v8)
    {
      self = [(DIAttachedDeviceInfo *)self initWithDevice:v8 error:a4];
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  v4 = +[NSMutableArray array];
  id v5 = [[DIIOObject alloc] initWithClassName:@"IOHDIXController" error:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(DIIOObject *)v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = [[DIIOObject alloc] initWithIteratorNext:v7];
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }
          id v10 = [(DIIOObject *)v9 ioObjectWithClassName:@"IOHDIXHDDriveNub" iterateParent:0 error:a3];
          if (v10)
          {
            CFStringRef v11 = [(DIIOObject *)[DIBlockDevice alloc] initWithDIIOObject:v10];
            v12 = [[DIAttachedDeviceInfo alloc] initWithDevice:v11 error:0];
            if (v12) {
              [v4 addObject:v12];
            }
          }
          BOOL v13 = [[DIIOObject alloc] initWithIteratorNext:v7];

          v9 = v13;
        }
        while (v13);
      }
      id v14 = v4;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = v4;
  }

  return v14;
}

+ (id)newDI2DevicesArrayWithError:(id *)a3
{
  v4 = +[NSMutableArray array];
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 newIteratorWithOptions:0 error:a3];
    if (v7)
    {
      id v8 = [(DIIOObject *)[DIBlockDevice alloc] initWithIteratorNext:v7];
      if (v8)
      {
        v9 = v8;
        do
        {
          if ([v7 startedOver])
          {
            [v4 removeAllObjects];
            [v7 setStartedOver:0];
          }
          if ([(DIBlockDevice *)v9 diskImageDevice])
          {
            id v10 = [[DIAttachedDeviceInfo alloc] initWithDevice:v9 error:0];
            if (v10) {
              [v4 addObject:v10];
            }
          }
          CFStringRef v11 = [(DIIOObject *)[DIBlockDevice alloc] initWithIteratorNext:v7];

          v9 = v11;
        }
        while (v11);
      }
      id v12 = v4;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)newDevicesArrayWithError:(id *)a3
{
  id v5 = [a1 newDI2DevicesArrayWithError:];
  if (v5)
  {
    id v6 = [a1 newDI1DevicesArrayWithError:a3];
    if (v6)
    {
      id v7 = +[NSMutableArray arrayWithArray:v5];
      [v7 addObjectsFromArray:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = [(DIAttachedDeviceInfo *)self BSDName];
  v4 = [(DIAttachedDeviceInfo *)self imageURL];
  id v5 = +[NSString stringWithFormat:@"Attached disk image device info: BSD Name [%@], image URL [%@]", v3, v4];

  return v5;
}

+ (id)copyAllMountPoints
{
  v2 = +[NSMutableDictionary dictionary];
  id v15 = 0;
  int v3 = getmntinfo_r_np(&v15, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 2168 * v3;
      do
      {
        id v6 = +[DIHelpers copyDevicePathWithStatfs:&v15[v4 / 0x878]];
        id v7 = +[NSString stringWithUTF8String:v15[v4 / 0x878].f_mntonname];
        if (v6)
        {
          if ([v6 hasPrefix:@"/dev/disk"]) {
            BOOL v8 = v7 == 0;
          }
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            v9 = [v6 lastPathComponent];
            [v2 setObject:v7 forKeyedSubscript:v9];
          }
        }

        v4 += 2168;
      }
      while (v5 != v4);
    }
    free(v15);
  }
  else
  {
    int v10 = *__error();
    if (sub_1000D29A0())
    {
      CFStringRef v11 = sub_1000D2920();
      os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v17 = 42;
      __int16 v18 = 2080;
      v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      BOOL v13 = sub_1000D2920();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v17 = 42;
        __int16 v18 = 2080;
        v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%.*s: Failed getting mounts list", buf, 0x12u);
      }
    }
    *__error() = v10;
  }
  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 BSDName];
  BOOL v8 = (void *)v7;
  if (v7)
  {
    CFStringRef v14 = @"BSD Name";
    uint64_t v15 = v7;
    v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    int v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

    CFStringRef v11 = [v6 objectForKeyedSubscript:v8];
    [v10 setObject:v11 forKeyedSubscript:@"Mount Point"];

    id v12 = [v5 copyPropertyWithClass:objc_opt_class() key:@"Content"];
    [v10 setObject:v12 forKeyedSubscript:@"Content"];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)copyEntitiesList
{
  int v3 = +[NSMutableArray array];
  id v4 = +[DIAttachedDeviceInfo copyAllMountPoints];
  id v5 = [(DIAttachedDeviceInfo *)self ioMedia];
  id v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:v5 mountPoints:v4];

  if (v6) {
    [v3 addObject:v6];
  }
  uint64_t v7 = [(DIAttachedDeviceInfo *)self ioMedia];
  id v8 = [v7 newIteratorWithOptions:1 error:0];

  if (v8)
  {
    v9 = [(DIIOObject *)[DIIOMedia alloc] initWithIteratorNext:v8];
    if (v9)
    {
      int v10 = v9;
      do
      {
        if ([v8 startedOver])
        {
          [v3 removeAllObjects];
          [v8 setStartedOver:0];
        }
        if (IOObjectConformsTo([(DIIOObject *)v10 ioObj], "IOMedia"))
        {
          id v11 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:v10 mountPoints:v4];
          if (v11) {
            [v3 addObject:v11];
          }
        }
        id v12 = [(DIIOObject *)[DIIOMedia alloc] initWithIteratorNext:v8];

        int v10 = v12;
      }
      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  v22[0] = @"BSD Name";
  v21 = [(DIAttachedDeviceInfo *)self BSDName];
  v23[0] = v21;
  v22[1] = @"DiskImages Framework";
  int v3 = +[NSNumber numberWithInteger:[(DIAttachedDeviceInfo *)self frameworkNum]];
  v23[1] = v3;
  v22[2] = @"DiskImageURL";
  id v4 = [(DIAttachedDeviceInfo *)self imageURL];
  id v5 = [v4 description];
  v23[2] = v5;
  v22[3] = @"Size";
  id v6 = [(DIAttachedDeviceInfo *)self mediaSize];
  v23[3] = v6;
  v22[4] = @"Preferred Block Size";
  uint64_t v7 = [(DIAttachedDeviceInfo *)self blockSize];
  v23[4] = v7;
  v22[5] = @"System Entities";
  id v8 = [(DIAttachedDeviceInfo *)self copyEntitiesList];
  v23[5] = v8;
  v22[6] = @"Daemon PID";
  v9 = [(DIAttachedDeviceInfo *)self pid];
  v23[6] = v9;
  int v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
  id v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  id v12 = [(DIAttachedDeviceInfo *)self shadowURL];

  if (v12)
  {
    BOOL v13 = [(DIAttachedDeviceInfo *)self shadowURL];
    CFStringRef v14 = [v13 description];
    [v11 setObject:v14 forKeyedSubscript:@"ShadowURL"];
  }
  uint64_t v15 = [(DIAttachedDeviceInfo *)self cacheURL];

  if (v15)
  {
    v16 = [(DIAttachedDeviceInfo *)self cacheURL];
    int v17 = [v16 description];
    [v11 setObject:v17 forKeyedSubscript:@"CacheURL"];
  }
  __int16 v18 = [(DIAttachedDeviceInfo *)self instanceId];

  if (v18)
  {
    v19 = [(DIAttachedDeviceInfo *)self instanceId];
    [v11 setObject:v19 forKeyedSubscript:@"InstanceID"];
  }

  return v11;
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)shadowURL
{
  return self->_shadowURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)frameworkNum
{
  return self->_frameworkNum;
}

- (NSNumber)mediaSize
{
  return self->_mediaSize;
}

- (NSNumber)blockSize
{
  return self->_blockSize;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (DIIOMedia)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioMedia, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_blockSize, 0);
  objc_storeStrong((id *)&self->_mediaSize, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_shadowURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);

  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end