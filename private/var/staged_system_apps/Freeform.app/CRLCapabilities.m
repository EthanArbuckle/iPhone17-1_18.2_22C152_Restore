@interface CRLCapabilities
+ (CRLCapabilities)currentCapabilities;
- (BOOL)hasHEVCHardwareEncoding;
- (BOOL)hasLightningPort;
- (BOOL)isMetalCapable;
- (BOOL)isRendererH3OrBelow;
- (BOOL)isRendererH4OrBelow;
- (BOOL)isRendererH5OrBelow;
- (BOOL)p_isMetalCapable;
- (CGSize)maximumHardcodedTextureSize;
- (CGSize)maximumImageSize;
- (CGSize)maximumMetalTextureSizeForDevice:(id)a3;
- (CRLCapabilities)init;
- (id)metalCapabilitiesForDevice:(id)a3;
- (int64_t)device;
- (int64_t)deviceType;
- (int64_t)platform;
- (int64_t)renderer;
- (unint64_t)physicalMemory;
- (void)p_setupDevice;
- (void)p_setupPlatform;
@end

@implementation CRLCapabilities

- (void)p_setupPlatform
{
  self->_platform = 1;
}

- (void)p_setupDevice
{
  id v19 = +[UIDevice crl_platformString];
  if ([v19 hasPrefix:@"iPod3,"])
  {
    unint64_t v3 = 1;
LABEL_5:
    int64x2_t v4 = vdupq_n_s64(v3);
LABEL_6:
    *(int64x2_t *)&self->_device = v4;
    goto LABEL_7;
  }
  if ([v19 hasPrefix:@"iPod4,"])
  {
    unint64_t v3 = 2;
    goto LABEL_5;
  }
  if ([v19 hasPrefix:@"iPod5,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_1011786D0;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone2,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_1011786E0;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone3,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_1011786F0;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone4,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178700;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone5,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178710;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone7,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178720;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone8,4"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178730;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone8,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178740;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone9,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178750;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone10,6"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178760;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPhone10,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178770;
    goto LABEL_6;
  }
  if ([v19 hasPrefix:@"iPad1,"])
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178780;
    goto LABEL_6;
  }
  if (![v19 hasPrefix:@"iPad2,"])
  {
    if ([v19 hasPrefix:@"iPad3,"])
    {
      long long v17 = xmmword_101178840;
      if (([v19 hasPrefix:@"iPad3,1"] & 1) == 0
        && ([v19 hasPrefix:@"iPad3,2"] & 1) == 0)
      {
        unsigned __int8 v6 = [v19 hasPrefix:@"iPad3,3"];
        int64x2_t v4 = (int64x2_t)xmmword_101178840;
        if (v6) {
          goto LABEL_6;
        }
        long long v17 = xmmword_101178850;
        if ((objc_msgSend(v19, "hasPrefix:", @"iPad3,4", COERCE_DOUBLE(16)) & 1) == 0
          && ([v19 hasPrefix:@"iPad3,5"] & 1) == 0)
        {
          CFStringRef v7 = @"iPad3,6";
          goto LABEL_72;
        }
      }
    }
    else if ([v19 hasPrefix:@"iPad4,"])
    {
      long long v17 = xmmword_101178810;
      if (([v19 hasPrefix:@"iPad4,4"] & 1) == 0
        && ([v19 hasPrefix:@"iPad4,5"] & 1) == 0)
      {
        unsigned __int8 v8 = [v19 hasPrefix:@"iPad4,6"];
        int64x2_t v4 = (int64x2_t)xmmword_101178810;
        if (v8) {
          goto LABEL_6;
        }
        long long v17 = xmmword_101178820;
        if ((objc_msgSend(v19, "hasPrefix:", @"iPad4,7", COERCE_DOUBLE(19)) & 1) == 0
          && ([v19 hasPrefix:@"iPad4,8"] & 1) == 0)
        {
          unsigned __int8 v9 = [v19 hasPrefix:@"iPad4,9"];
          int64x2_t v4 = (int64x2_t)xmmword_101178820;
          if (v9) {
            goto LABEL_6;
          }
          long long v17 = xmmword_101178830;
          if ((objc_msgSend(v19, "hasPrefix:", @"iPad4,1", COERCE_DOUBLE(21)) & 1) == 0
            && ([v19 hasPrefix:@"iPad4,2"] & 1) == 0)
          {
            CFStringRef v7 = @"iPad4,3";
            goto LABEL_72;
          }
        }
      }
    }
    else if ([v19 hasPrefix:@"iPad5,"])
    {
      long long v17 = xmmword_1011787F0;
      if (([v19 hasPrefix:@"iPad5,3"] & 1) == 0)
      {
        unsigned __int8 v10 = [v19 hasPrefix:@"iPad5,4"];
        int64x2_t v4 = (int64x2_t)xmmword_1011787F0;
        if (v10) {
          goto LABEL_6;
        }
        long long v17 = xmmword_101178800;
        if ((objc_msgSend(v19, "hasPrefix:", @"iPad5,1", COERCE_DOUBLE(22)) & 1) == 0)
        {
          CFStringRef v7 = @"iPad5,2";
          goto LABEL_72;
        }
      }
    }
    else if ([v19 hasPrefix:@"iPad6,"])
    {
      long long v17 = xmmword_1011787C0;
      if (([v19 hasPrefix:@"iPad6,3"] & 1) == 0)
      {
        unsigned __int8 v11 = [v19 hasPrefix:@"iPad6,4"];
        int64x2_t v4 = (int64x2_t)xmmword_1011787C0;
        if (v11) {
          goto LABEL_6;
        }
        long long v17 = xmmword_1011787D0;
        if ((objc_msgSend(v19, "hasPrefix:", @"iPad6,7", COERCE_DOUBLE(24)) & 1) == 0)
        {
          unsigned __int8 v12 = [v19 hasPrefix:@"iPad6,8"];
          int64x2_t v4 = (int64x2_t)xmmword_1011787D0;
          if (v12) {
            goto LABEL_6;
          }
          long long v17 = xmmword_1011787E0;
          if ((objc_msgSend(v19, "hasPrefix:", @"iPad6,11", COERCE_DOUBLE(25)) & 1) == 0)
          {
            CFStringRef v7 = @"iPad6,12";
            goto LABEL_72;
          }
        }
      }
    }
    else
    {
      if (![v19 hasPrefix:@"iPad7,"]) {
        goto LABEL_7;
      }
      long long v17 = xmmword_101178790;
      if (([v19 hasPrefix:@"iPad7,1"] & 1) == 0)
      {
        unsigned __int8 v14 = [v19 hasPrefix:@"iPad7,2"];
        int64x2_t v4 = (int64x2_t)xmmword_101178790;
        if (v14) {
          goto LABEL_6;
        }
        long long v17 = xmmword_1011787A0;
        if ((objc_msgSend(v19, "hasPrefix:", @"iPad7,3", COERCE_DOUBLE(28)) & 1) == 0)
        {
          unsigned __int8 v15 = [v19 hasPrefix:@"iPad7,4"];
          int64x2_t v4 = (int64x2_t)xmmword_1011787A0;
          if (v15) {
            goto LABEL_6;
          }
          long long v17 = xmmword_1011787B0;
          if ((objc_msgSend(v19, "hasPrefix:", @"iPad7,5", COERCE_DOUBLE(27)) & 1) == 0)
          {
            unsigned int v16 = [v19 hasPrefix:@"iPad7,6"];
            int64x2_t v4 = (int64x2_t)xmmword_1011787B0;
            if (v16) {
              goto LABEL_6;
            }
            goto LABEL_7;
          }
        }
      }
    }
LABEL_80:
    int64x2_t v4 = (int64x2_t)v17;
    goto LABEL_6;
  }
  long long v17 = xmmword_101178860;
  if (([v19 hasPrefix:@"iPad2,1"] & 1) != 0
    || ([v19 hasPrefix:@"iPad2,2"] & 1) != 0)
  {
    goto LABEL_80;
  }
  unsigned __int8 v5 = [v19 hasPrefix:@"iPad2,3"];
  int64x2_t v4 = (int64x2_t)xmmword_101178860;
  if (v5) {
    goto LABEL_6;
  }
  if (objc_msgSend(v19, "hasPrefix:", @"iPad2,4", COERCE_DOUBLE(15)))
  {
    int64x2_t v4 = (int64x2_t)xmmword_101178870;
    goto LABEL_6;
  }
  long long v17 = xmmword_101178880;
  if (([v19 hasPrefix:@"iPad2,5"] & 1) != 0
    || ([v19 hasPrefix:@"iPad2,6"] & 1) != 0)
  {
    goto LABEL_80;
  }
  CFStringRef v7 = @"iPad2,7";
LABEL_72:
  unsigned __int8 v13 = [v19 hasPrefix:v7, v17];
  int64x2_t v4 = v18;
  if (v13) {
    goto LABEL_6;
  }
LABEL_7:
  self->_deviceType = sub_1004391F0(v19);
}

- (CRLCapabilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCapabilities;
  v2 = [(CRLCapabilities *)&v8 init];
  unint64_t v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100439AC0;
    block[3] = &unk_1014CBBB0;
    int64x2_t v4 = v2;
    CFStringRef v7 = v4;
    if (qword_1016A9AE8 != -1) {
      dispatch_once(&qword_1016A9AE8, block);
    }
    [(CRLCapabilities *)v4 p_setupPlatform];
    [(CRLCapabilities *)v4 p_setupDevice];
  }
  return v3;
}

+ (CRLCapabilities)currentCapabilities
{
  if (qword_1016A9AF8 != -1) {
    dispatch_once(&qword_1016A9AF8, &stru_1014F9A00);
  }
  v2 = (void *)qword_1016A9B00;

  return (CRLCapabilities *)v2;
}

- (BOOL)isRendererH3OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 2;
}

- (BOOL)isRendererH4OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 5;
}

- (BOOL)isRendererH5OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 7;
}

- (BOOL)hasLightningPort
{
  int64_t device = self->_device;
  return ((unint64_t)(device - 4) > 0x3F || ((1 << (device - 4)) & 0x8000000000001C07) == 0)
      && device != 0;
}

- (CGSize)maximumHardcodedTextureSize
{
  int64_t platform = self->_platform;
  if ((unint64_t)(platform - 2) < 2)
  {
    uint64_t v5 = 0x40C0000000000000;
    goto LABEL_6;
  }
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  if (platform)
  {
    if (platform == 1)
    {
      uint64_t v5 = 0x40B0000000000000;
LABEL_6:
      CGFloat height = *(double *)&v5;
      CGFloat width = *(double *)&v5;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9A20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2874();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9A40);
    }
    unsigned __int8 v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CFStringRef v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumHardcodedTextureSize]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:386 isFatal:0 description:"Unknown platform!"];
  }
  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)maximumImageSize
{
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  switch(self->_platform)
  {
    case 0:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9A60);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B28FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9A80);
      }
      uint64_t v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      unsigned __int8 v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumImageSize]");
      CFStringRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:406 isFatal:0 description:"Unknown platform!"];

      break;
    case 1:
    case 3:
      uint64_t v4 = 0x40C0000000000000;
      goto LABEL_13;
    case 2:
      uint64_t v4 = 0x40D0000000000000;
LABEL_13:
      CGFloat height = *(double *)&v4;
      CGFloat width = *(double *)&v4;
      break;
    default:
      break;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)maximumMetalTextureSizeForDevice:(id)a3
{
  if ([(CRLCapabilities *)self isMetalCapable])
  {
    double v4 = 8192.0;
    double v5 = 8192.0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9AA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2984();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9AC0);
    }
    unsigned __int8 v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CFStringRef v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumMetalTextureSizeForDevice:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:424 isFatal:0 description:"Shouldn't be asking for the maximum Metal texture size on a device that doesn't support Metal."];

    [(CRLCapabilities *)self maximumHardcodedTextureSize];
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (id)metalCapabilitiesForDevice:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9AE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2A0C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9B00);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities metalCapabilitiesForDevice:]");
    unsigned __int8 v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 438, 0, "invalid nil value for '%{public}s'", "device");
  }
  if (qword_1016A9B10 != -1) {
    dispatch_once(&qword_1016A9B10, &stru_1014F9B20);
  }
  CFStringRef v7 = [(id)qword_1016A9B08 objectForKey:v3];
  if (!v7)
  {
    CFStringRef v7 = [[CRLMetalDeviceCapabilities alloc] initWithDevice:v3];
    [(id)qword_1016A9B08 setObject:v7 forKey:v3];
  }

  return v7;
}

- (BOOL)p_isMetalCapable
{
  id v2 = MTLCreateSystemDefaultDevice();
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isMetalCapable
{
  return byte_1016A9AF0;
}

- (unint64_t)physicalMemory
{
  id v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 physicalMemory];

  return (unint64_t)v3;
}

- (BOOL)hasHEVCHardwareEncoding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10043A5CC;
  block[3] = &unk_1014CBBB0;
  void block[4] = self;
  if (qword_1016A9B20 != -1) {
    dispatch_once(&qword_1016A9B20, block);
  }
  return byte_1016A9B18;
}

- (int64_t)platform
{
  return self->_platform;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)renderer
{
  return self->_renderer;
}

@end