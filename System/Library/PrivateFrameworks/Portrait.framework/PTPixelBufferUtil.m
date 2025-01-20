@interface PTPixelBufferUtil
+ (BOOL)isCompressed:(__CVBuffer *)a3;
+ (BOOL)isPixelBuffer10Bit:(__CVBuffer *)a3;
+ (BOOL)isPixelBufferFullRange:(__CVBuffer *)a3;
+ (BOOL)isRGB:(__CVBuffer *)a3;
+ (YUVPixelFormats)_getPixelFormatsForType:(unsigned int)a3;
+ (YUVPixelFormats)getPixelFormatsForPixelBuffer:(__CVBuffer *)a3;
+ (id)createTextureFromCache:(__CVMetalTextureCache *)a3 pixelBuffer:(__CVBuffer *)a4 descriptor:(id)a5 plane:(unint64_t)a6;
+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4;
+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 sRGB:(BOOL)a6;
+ (id)getAttachmentString:(__CVBuffer *)a3 forKey:(__CFString *)a4;
+ (id)getMTLTextureDescriptor:(__CVBuffer *)a3 device:(id)a4;
+ (int)readRawPixelBufferFromFile:(id)a3 pixelBuffer:(__CVBuffer *)a4;
+ (unint64_t)getNoConcurrentAccessHint:(__CVBuffer *)a3;
+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8;
+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 outLuma:(id *)a6 outChroma:(id *)a7 read:(BOOL)a8 write:(BOOL)a9;
+ (unsigned)getCVPixelBufferGetPixelFormatType:(unint64_t)a3;
+ (unsigned)pixelBufferToLumaChroma:(id)a3 pixelBuffer:(__CVBuffer *)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8;
+ (void)logPixelbufferMetadataForPixelBuffer:(__CVBuffer *)a3 name:(id)a4;
- (void)dealloc;
@end

@implementation PTPixelBufferUtil

+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 sRGB:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  v11 = [a1 getMTLTextureDescriptor:a3 device:v10];
  v12 = v11;
  if (!v6)
  {
LABEL_7:
    if (a5)
    {
      uint64_t v15 = [a1 createTextureFromCache:a5 pixelBuffer:a3 descriptor:v12 plane:0];
    }
    else
    {
      uint64_t v15 = [v10 newTextureWithDescriptor:v12 iosurface:CVPixelBufferGetIOSurface(a3) plane:0];
    }
    v16 = (void *)v15;
    goto LABEL_11;
  }
  uint64_t v13 = [v11 pixelFormat];
  if (v13 == 80)
  {
    uint64_t v14 = 81;
    goto LABEL_6;
  }
  if (v13 == 10)
  {
    uint64_t v14 = 11;
LABEL_6:
    [v12 setPixelFormat:v14];
    goto LABEL_7;
  }
  v18 = _PTLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:textureCache:sRGB:](v12);
  }

  v16 = 0;
LABEL_11:

  return v16;
}

+ (id)createTextureFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4
{
  return (id)[a1 createTextureFromPixelBuffer:a3 device:a4 textureCache:0 sRGB:0];
}

+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 outLuma:(id *)a6 outChroma:(id *)a7 read:(BOOL)a8 write:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  unint64_t v16 = v9;
  if (a9) {
    unint64_t v16 = +[PTPixelBufferUtil getNoConcurrentAccessHint:a3] | v9 | 2;
  }
  uint64_t v17 = [a1 getPixelFormatsForPixelBuffer:a3];
  if (v17)
  {
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = v17;
      v42 = a6;
      v43 = a7;
      v21 = (void *)MEMORY[0x1E4F35330];
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      v23 = objc_msgSend(v21, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v20, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 0), 0);
      [v23 setUsage:v16];
      v24 = (void *)MEMORY[0x1E4F35330];
      size_t v25 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
      v26 = objc_msgSend(v24, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v19, v25, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
      [v26 setUsage:v16];
      if (v23 && v26)
      {
        v27 = v15;
        v28 = v15;
        if (a5)
        {
          uint64_t v29 = [a1 createTextureFromCache:a5 pixelBuffer:a3 descriptor:v23 plane:0];
          v30 = v42;
          id v31 = *v42;
          id *v42 = (id)v29;

          uint64_t v32 = [a1 createTextureFromCache:a5 pixelBuffer:a3 descriptor:v26 plane:1];
        }
        else
        {
          IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
          uint64_t v36 = [v28 newTextureWithDescriptor:v23 iosurface:IOSurface plane:0];
          v30 = v42;
          id v37 = *v42;
          id *v42 = (id)v36;

          uint64_t v32 = [v28 newTextureWithDescriptor:v26 iosurface:IOSurface plane:1];
        }
        id v38 = *v43;
        id *v43 = (id)v32;

        if (*v30 && *v43)
        {
          unsigned int v34 = 0;
LABEL_22:

          goto LABEL_23;
        }
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        v40 = _PTLogSystem();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:](PixelFormatType);
        }
      }
      else
      {
        v28 = _PTLogSystem();
        v27 = v15;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:]();
        }
      }
      unsigned int v34 = -1;
      goto LABEL_22;
    }
  }
  OSType v33 = CVPixelBufferGetPixelFormatType(a3);
  v23 = _PTLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:](v33);
  }
  unsigned int v34 = -10;
  v27 = v15;
LABEL_23:

  return v34;
}

+ (id)createTextureFromCache:(__CVMetalTextureCache *)a3 pixelBuffer:(__CVBuffer *)a4 descriptor:(id)a5 plane:(unint64_t)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  CVMetalTextureRef image = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v19[0] = *MEMORY[0x1E4F24C88];
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "usage"));
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E4F24C80];
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "storageMode"));
  v20[1] = v12;
  CVReturn v13 = CVMetalTextureCacheCreateTextureFromImage(v10, a3, a4, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2], (MTLPixelFormat)objc_msgSend(v9, "pixelFormat"), objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), a6, &image);

  if (!image || v13)
  {
    id v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[PTPixelBufferUtil createTextureFromCache:pixelBuffer:descriptor:plane:](v9, v13, v15);
    }
  }
  else
  {
    uint64_t v14 = CVMetalTextureGetTexture(image);
    CFRelease(image);
    if (v14) {
      goto LABEL_11;
    }
  }
  unint64_t v16 = _PTLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[PTPixelBufferUtil createTextureFromCache:pixelBuffer:descriptor:plane:](v9);
  }

  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

+ (id)getMTLTextureDescriptor:(__CVBuffer *)a3 device:(id)a4
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 1380410944)
  {
    if (PixelFormatType <= 1717856626)
    {
      if (PixelFormatType == 1380410945)
      {
        uint64_t v6 = 125;
        goto LABEL_30;
      }
      if (PixelFormatType == 1380411457)
      {
        uint64_t v6 = 115;
        goto LABEL_30;
      }
      if (PixelFormatType != 1717855600) {
        goto LABEL_34;
      }
      goto LABEL_22;
    }
    if (PixelFormatType <= 1751411058)
    {
      if (PixelFormatType != 1717856627)
      {
        int v7 = 1751410032;
        goto LABEL_20;
      }
LABEL_22:
      uint64_t v6 = 55;
      goto LABEL_30;
    }
    if (PixelFormatType == 1751411059) {
      goto LABEL_27;
    }
    int v8 = 2084718401;
LABEL_25:
    if (PixelFormatType != v8) {
      goto LABEL_34;
    }
LABEL_26:
    uint64_t v6 = 80;
    goto LABEL_30;
  }
  if (PixelFormatType <= 1111970368)
  {
    if (PixelFormatType == 641877825 || PixelFormatType == 759318337) {
      goto LABEL_26;
    }
    int v8 = 792872769;
    goto LABEL_25;
  }
  if (PixelFormatType > 1278226533)
  {
    if (PixelFormatType != 1278226534)
    {
      int v7 = 1278226536;
LABEL_20:
      if (PixelFormatType != v7) {
        goto LABEL_34;
      }
LABEL_27:
      uint64_t v6 = 25;
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (PixelFormatType == 1111970369) {
    goto LABEL_26;
  }
  if (PixelFormatType == 1278226488)
  {
    uint64_t v6 = 10;
LABEL_30:
    id v9 = (void *)MEMORY[0x1E4F35330];
    size_t Width = CVPixelBufferGetWidth(a3);
    v11 = [v9 texture2DDescriptorWithPixelFormat:v6 width:Width height:CVPixelBufferGetHeight(a3) mipmapped:0];
    objc_msgSend(v11, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", a3) | 3);
    [v11 setResourceOptions:0];
    goto LABEL_31;
  }
LABEL_34:
  CVReturn v13 = _PTLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[PTPixelBufferUtil getMTLTextureDescriptor:device:](a3);
  }

  v11 = 0;
LABEL_31:

  return v11;
}

+ (unint64_t)getNoConcurrentAccessHint:(__CVBuffer *)a3
{
  if ([a1 isCompressed:a3]) {
    return 0x4000;
  }
  else {
    return 0;
  }
}

+ (BOOL)isCompressed:(__CVBuffer *)a3
{
  unsigned int v3 = (int)CVPixelBufferGetPixelFormatType(a3) >> 24;
  BOOL result = 1;
  if (v3 > 0x2F || ((1 << v3) & 0xA04000000000) == 0) {
    return v3 == 124;
  }
  return result;
}

+ (YUVPixelFormats)getPixelFormatsForPixelBuffer:(__CVBuffer *)a3
{
  if (a3)
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    uint64_t v6 = [a1 _getPixelFormatsForType:PixelFormatType];
    unint64_t v7 = v5;
    if (!v6 || !v5)
    {
      int v8 = CVPixelBufferGetAttributes();
      id v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 objectForKeyedSubscript:@"PixelFormatDescription"];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = [v9 objectForKeyedSubscript:@"PixelFormatDescription"];
          CVReturn v13 = [v12 objectForKeyedSubscript:@"EquivalentUncompressedPixelFormat"];

          if (v13)
          {
            uint64_t v14 = [v9 objectForKeyedSubscript:@"PixelFormatDescription"];
            id v15 = [v14 objectForKeyedSubscript:@"EquivalentUncompressedPixelFormat"];
            uint64_t v16 = [v15 unsignedIntValue];

            if (v16)
            {
              if (v16 != PixelFormatType)
              {
                uint64_t v6 = [a1 _getPixelFormatsForType:v16];
                unint64_t v7 = v17;
              }
            }
          }
        }
      }
    }
    if (!v6 || !v7)
    {
      uint64_t v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[PTPixelBufferUtil getPixelFormatsForPixelBuffer:](PixelFormatType, v18);
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  unint64_t v19 = v6;
  unint64_t v20 = v7;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

+ (YUVPixelFormats)_getPixelFormatsForType:(unsigned int)a3
{
  unint64_t v3 = 0;
  if ((int)a3 > 875704421)
  {
    if ((int)a3 <= 2016686641)
    {
      if ((int)a3 <= 1882468911)
      {
        if ((int)a3 > 875704933)
        {
          if (a3 == 875704934) {
            goto LABEL_62;
          }
          unsigned __int16 v9 = 12918;
        }
        else
        {
          if (a3 == 875704422) {
            goto LABEL_62;
          }
          unsigned __int16 v9 = 12406;
        }
        int v8 = v9 | 0x34320000;
        goto LABEL_61;
      }
      if ((int)a3 <= 1885745711)
      {
        if (a3 != 1882468912)
        {
          int v10 = 1882468914;
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (a3 == 1885745712 || a3 == 1885745714) {
        goto LABEL_53;
      }
      int v5 = 2016686640;
      goto LABEL_37;
    }
    if ((int)a3 > 2084075055)
    {
      if ((int)a3 <= 2088265265)
      {
        if (a3 == 2084075056) {
          goto LABEL_62;
        }
        unsigned __int16 v7 = 26160;
      }
      else
      {
        if (a3 == 2088265266 || a3 == 2088269360) {
          goto LABEL_53;
        }
        unsigned __int16 v7 = 30258;
      }
      int v10 = v7 | 0x7C780000;
      goto LABEL_52;
    }
    if ((int)a3 > 2019963441)
    {
      if (a3 != 2019963442)
      {
        int v8 = 2084070960;
        goto LABEL_61;
      }
    }
    else if (a3 != 2016686642)
    {
      int v5 = 2019963440;
LABEL_37:
      unint64_t v11 = 0;
      if (a3 != v5) {
        goto LABEL_65;
      }
    }
    unint64_t v11 = 576;
    unint64_t v3 = 578;
    goto LABEL_65;
  }
  if ((int)a3 > 762865201)
  {
    if ((int)a3 > 792229423)
    {
      if ((int)a3 <= 796419633)
      {
        if (a3 == 792229424) {
          goto LABEL_62;
        }
        unsigned __int16 v6 = 26160;
      }
      else
      {
        if (a3 == 796419634 || a3 == 796423728) {
          goto LABEL_53;
        }
        unsigned __int16 v6 = 30258;
      }
      int v10 = v6 | 0x2F780000;
      goto LABEL_52;
    }
    if ((int)a3 <= 762869297)
    {
      if (a3 != 762865202)
      {
        unsigned __int16 v4 = 30256;
        goto LABEL_33;
      }
      goto LABEL_53;
    }
    if (a3 == 762869298) {
      goto LABEL_53;
    }
    int v8 = 792225328;
LABEL_61:
    unint64_t v11 = 0;
    if (a3 != v8) {
      goto LABEL_65;
    }
    goto LABEL_62;
  }
  if ((int)a3 > 645428783)
  {
    if ((int)a3 > 758670895)
    {
      if (a3 != 758670896 && a3 != 758674992)
      {
        unsigned __int16 v4 = 26160;
LABEL_33:
        int v10 = v4 | 0x2D780000;
        goto LABEL_52;
      }
LABEL_62:
      unint64_t v11 = 10;
      unint64_t v3 = 30;
      goto LABEL_65;
    }
    if (a3 != 645428784)
    {
      unsigned __int16 v12 = 30258;
LABEL_51:
      int v10 = v12 | 0x26780000;
LABEL_52:
      unint64_t v11 = 0;
      if (a3 != v10) {
        goto LABEL_65;
      }
      goto LABEL_53;
    }
    goto LABEL_53;
  }
  if ((int)a3 <= 645424687)
  {
    if (a3 == 641230384) {
      goto LABEL_62;
    }
    int v8 = 641234480;
    goto LABEL_61;
  }
  if (a3 != 645424688)
  {
    unsigned __int16 v12 = 26162;
    goto LABEL_51;
  }
LABEL_53:
  unint64_t v11 = 588;
  unint64_t v3 = 589;
LABEL_65:
  result.var1 = v3;
  result.var0 = v11;
  return result;
}

+ (id)getAttachmentString:(__CVBuffer *)a3 forKey:(__CFString *)a4
{
  unsigned __int16 v4 = (void *)CVBufferCopyAttachment(a3, a4, 0);

  return v4;
}

+ (BOOL)isRGB:(__CVBuffer *)a3
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  BOOL v4 = PixelFormatType == 1380401729 || PixelFormatType == 1380411457;
  return PixelFormatType == 1111970369 || v4;
}

+ (BOOL)isPixelBufferFullRange:(__CVBuffer *)a3
{
  CVPixelBufferGetPixelFormatType(a3);
  DescriptionWithOSType PixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E4F24E50]);
  return CFEqual(Value, (CFStringRef)*MEMORY[0x1E4F24E58]);
}

+ (BOOL)isPixelBuffer10Bit:(__CVBuffer *)a3
{
  CVPixelBufferGetPixelFormatType(a3);
  DescriptionWithOSType PixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  BOOL v4 = CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E4F24E20]);
  BOOL v5 = [v4 integerValue] == 10;

  return v5;
}

- (void)dealloc
{
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession) {
    CFRelease(pixelTransferSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTPixelBufferUtil;
  [(PTPixelBufferUtil *)&v4 dealloc];
}

+ (unsigned)createTexturesFromPixelBuffer:(__CVBuffer *)a3 device:(id)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [a1 createTexturesFromPixelBuffer:a3 device:a4 textureCache:0 outLuma:a5 outChroma:a6 read:a7 write:v9];
}

+ (unsigned)getCVPixelBufferGetPixelFormatType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 54)
  {
    if (a3 == 10) {
      return 1278226488;
    }
    if (a3 == 25) {
      return 1278226536;
    }
  }
  else
  {
    switch(a3)
    {
      case '7':
        return 1278226534;
      case '}':
        return 1380410945;
      case 'P':
        return 1111970369;
    }
  }
  objc_super v4 = _PTLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[PTPixelBufferUtil getCVPixelBufferGetPixelFormatType:]();
  }

  return 0;
}

+ (void)logPixelbufferMetadataForPixelBuffer:(__CVBuffer *)a3 name:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unsigned __int16 v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"PixelBuffer %@: ", v5];
  unsigned __int16 v7 = v6;
  if (a3)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    uint64_t v9 = NSStringFromFourCharCode(PixelFormatType);
    size_t Width = CVPixelBufferGetWidth(a3);
    [(__CFString *)v7 appendFormat:@" f: %@ s: %zu x %zu", v9, Width, CVPixelBufferGetHeight(a3)];

    unint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v49 = v7;
      _os_log_impl(&dword_1D0778000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
    if (IOSurface)
    {
      CVReturn v13 = IOSurface;
      uint64_t v14 = IOSurfaceCopyAllValues(IOSurface);
      CFTypeRef v15 = IOSurfaceCopyValue(v13, (CFStringRef)*MEMORY[0x1E4F2F068]);
      if (v15)
      {
        uint64_t v16 = v15;
        CGColorSpaceRef v17 = CGColorSpaceCreateWithPropertyList(v15);
        if (v17)
        {
          uint64_t v18 = v17;
          unint64_t v19 = _PTLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            CFStringRef Name = CGColorSpaceGetName(v18);
            CGColorSpaceModel Model = CGColorSpaceGetModel(v18);
            int NumberOfComponents = CGColorSpaceGetNumberOfComponents(v18);
            v21 = v14;
            BOOL v22 = CGColorSpaceUsesExtendedRange(v18);
            BOOL IsWideGamutRGB = CGColorSpaceIsWideGamutRGB(v18);
            BOOL IsHLGBased = CGColorSpaceIsHLGBased(v18);
            BOOL IsPQBased = CGColorSpaceIsPQBased(v18);
            *(_DWORD *)buf = 138413826;
            CFStringRef v49 = Name;
            __int16 v50 = 1024;
            *(_DWORD *)v51 = Model;
            *(_WORD *)&v51[4] = 1024;
            *(_DWORD *)&v51[6] = NumberOfComponents;
            __int16 v52 = 1024;
            BOOL v53 = v22;
            uint64_t v14 = v21;
            __int16 v54 = 1024;
            BOOL v55 = IsWideGamutRGB;
            __int16 v56 = 1024;
            BOOL v57 = IsHLGBased;
            __int16 v58 = 1024;
            BOOL v59 = IsPQBased;
            _os_log_impl(&dword_1D0778000, v19, OS_LOG_TYPE_INFO, "colorSpaceName: %@ Model: %u NumberOfComponents: %i extendedRange: %i WideGamutRGB: %i HLG: %i PQ: %i", buf, 0x30u);
          }

          CGColorSpaceRelease(v18);
        }
        CFRelease(v16);
        if (v14)
        {
LABEL_11:
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v26 = [v14 allKeys];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            v39 = v7;
            id v41 = v5;
            uint64_t v29 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v44 != v29) {
                  objc_enumerationMutation(v26);
                }
                CFStringRef v31 = *(const __CFString **)(*((void *)&v43 + 1) + 8 * i);
                uint64_t v32 = _PTLogSystem();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  [v14 objectForKeyedSubscript:v31];
                  v34 = OSType v33 = v14;
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v49 = v31;
                  __int16 v50 = 2112;
                  *(void *)v51 = v34;
                  _os_log_impl(&dword_1D0778000, v32, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);

                  uint64_t v14 = v33;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
            }
            while (v28);
            unsigned __int16 v7 = v39;
            id v5 = v41;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      else
      {
        id v38 = _PTLogSystem();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0778000, v38, OS_LOG_TYPE_INFO, "No kIOSurfaceColorSpace available", buf, 2u);
        }

        if (v14) {
          goto LABEL_11;
        }
      }
      v26 = _PTLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0778000, v26, OS_LOG_TYPE_INFO, "metadata: nil", buf, 2u);
      }
      goto LABEL_31;
    }
    uint64_t v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v35 = "IOSurface is NULL";
      uint64_t v36 = v14;
      uint32_t v37 = 2;
      goto LABEL_25;
    }
  }
  else
  {
    [(__CFString *)v6 appendString:@"NULL"];
    uint64_t v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v49 = v7;
      v35 = "%@";
      uint64_t v36 = v14;
      uint32_t v37 = 12;
LABEL_25:
      _os_log_impl(&dword_1D0778000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);
    }
  }
LABEL_32:
}

+ (int)readRawPixelBufferFromFile:(id)a3 pixelBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  if ([v5 hasSuffix:@"LZMA"])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5];
    id v18 = 0;
    int v10 = [v9 decompressedDataUsingAlgorithm:2 error:&v18];
    id v11 = v18;

    if (v11)
    {
      unsigned __int16 v12 = _PTLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[PTPixelBufferUtil readRawPixelBufferFromFile:pixelBuffer:]();
      }

      goto LABEL_13;
    }
    id v15 = v10;
    memcpy(BaseAddress, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  }
  else
  {
    CVReturn v13 = fopen((const char *)[v5 UTF8String], "r");
    if (!v13)
    {
      fclose(0);
LABEL_13:
      int v16 = -1;
      goto LABEL_14;
    }
    for (uint64_t i = v13; Height; --Height)
    {
      fread(BaseAddress, 1uLL, BytesPerRow, i);
      BaseAddress += BytesPerRow;
    }
    fclose(i);
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  int v16 = 0;
LABEL_14:

  return v16;
}

+ (unsigned)pixelBufferToLumaChroma:(id)a3 pixelBuffer:(__CVBuffer *)a4 outLuma:(id *)a5 outChroma:(id *)a6 read:(BOOL)a7 write:(BOOL)a8
{
  return [a1 createTexturesFromPixelBuffer:a4 device:a3 outLuma:a5 outChroma:a6 read:a7 write:a8];
}

- (void).cxx_destruct
{
}

+ (void)createTexturesFromPixelBuffer:(unsigned int)a1 device:textureCache:outLuma:outChroma:read:write:.cold.1(unsigned int a1)
{
  v1 = NSStringFromFourCharCode(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0778000, v2, v3, "pixelBufferToLumaChroma: Issue with pixelformat %@ %i for pixelbuffer %p", v4, v5, v6, v7, v8);
}

+ (void)createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0778000, v1, OS_LOG_TYPE_ERROR, "Error allocating texture desc %@ %@", v2, 0x16u);
}

+ (void)createTexturesFromPixelBuffer:(unsigned int)a1 device:textureCache:outLuma:outChroma:read:write:.cold.3(unsigned int a1)
{
  os_log_t v1 = NSStringFromFourCharCode(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0778000, v2, v3, "pixelBufferToLumaChroma: Cannot allocate textures for pixel format %@ %i for pixelbuffer %p", v4, v5, v6, v7, v8);
}

+ (void)createTextureFromPixelBuffer:(void *)a1 device:textureCache:sRGB:.cold.1(void *a1)
{
  [a1 pixelFormat];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "getMTLTextureFromPixelBuffer: sRGB unsupported for %lu", v3, v4, v5, v6, v7);
}

+ (void)createTextureFromCache:(void *)a1 pixelBuffer:descriptor:plane:.cold.1(void *a1)
{
  [a1 pixelFormat];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "Cannot get texture from cache %lu", v3, v4, v5, v6, v7);
}

+ (void)createTextureFromCache:(NSObject *)a3 pixelBuffer:descriptor:plane:.cold.2(void *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 pixelFormat];
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "Cannot get texture from cache. PixelFormat: %lu status: %ul", (uint8_t *)&v5, 0x12u);
}

+ (void)getPixelFormatsForPixelBuffer:(unsigned int)a1 .cold.1(unsigned int a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromFourCharCode(a1);
  v5[0] = 67109378;
  v5[1] = a1;
  __int16 v6 = 2112;
  __int16 v7 = v4;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "getPixelFormatsForPixelBuffer: Unable to determine appropriate metal pixel format for CVPixelBuffer of pixel format type = %x %@\n", (uint8_t *)v5, 0x12u);
}

+ (void)getMTLTextureDescriptor:(__CVBuffer *)a1 device:.cold.1(__CVBuffer *a1)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v2 = NSStringFromFourCharCode(PixelFormatType);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "getMTLTextureDescriptor: No support for CVPixelBufferGetPixelFormatType %@ ", v5, v6, v7, v8, v9);
}

+ (void)getCVPixelBufferGetPixelFormatType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D0778000, v0, OS_LOG_TYPE_ERROR, "getCVPixelBufferGetPixelFormatType: No support for MTLPixelFormat %lu", v1, 0xCu);
}

+ (void)readRawPixelBufferFromFile:pixelBuffer:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D0778000, v0, OS_LOG_TYPE_ERROR, "Error loading LZMA %@", v1, 0xCu);
}

@end