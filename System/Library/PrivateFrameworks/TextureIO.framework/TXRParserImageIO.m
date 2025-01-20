@interface TXRParserImageIO
+ (BOOL)exportImage:(id)a3 url:(id)a4 uttype:(__CFString *)a5 colorSpace:(CGColorSpace *)a6 orientation:(unsigned __int8)a7 error:(id *)a8;
+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5;
+ (BOOL)handlesData:(id)a3;
+ (CGImage)newCGImageFromImage:(id)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5;
+ (id)decodeCGImage:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7;
+ (id)decodeCGImageNonIndexed:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7;
+ (int)determineColorSpaceClass:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5;
- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRTextureInfo)textureInfo;
- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5;
@end

@implementation TXRParserImageIO

+ (BOOL)handlesData:(id)a3
{
  return 1;
}

- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v12) {
    goto LABEL_11;
  }
  v13 = v12;
  CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
  if (!v14) {
    goto LABEL_11;
  }
  if (v11)
  {
    CFDictionaryRef v15 = v14;
    v16 = (const void *)*MEMORY[0x1E4F2FCA0];
    if (CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x1E4F2FCA0]))
    {
      v17 = CFDictionaryGetValue(v15, v16);
      uint64_t v18 = [v17 integerValue];
      if (([v11 originOperation] & 0xF) != 0)
      {
        v19 = (void *)[v11 copyWithZone:0];

        objc_msgSend(v19, "setOriginOperation:", objc_msgSend(v19, "originOperation") & 0xFFFFFFFFFFFFFFF0);
        objc_msgSend(v19, "setOriginOperation:", objc_msgSend(v19, "originOperation") | v18);
        id v11 = v19;
      }
    }
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
  if (ImageAtIndex)
  {
    v21 = +[TXRParserImageIO decodeCGImage:ImageAtIndex desiredPixelFormat:0 bufferAllocator:v10 options:v11 error:a6];
    BOOL v22 = v21 != 0;
    if (v21)
    {
      v23 = objc_alloc_init(TXRImageInfo);
      imageInfo = self->_imageInfo;
      self->_imageInfo = v23;

      -[TXRImageInfo setBytesPerRow:](self->_imageInfo, "setBytesPerRow:", [v21 bytesPerRow]);
      -[TXRImageInfo setBytesPerImage:](self->_imageInfo, "setBytesPerImage:", [v21 bytesPerImage]);
      v25 = [v21 buffer];
      [(TXRImageInfo *)self->_imageInfo setBuffer:v25];

      -[TXRImageInfo setOffset:](self->_imageInfo, "setOffset:", [v21 offset]);
      v26 = objc_alloc_init(TXRTextureInfo);
      textureInfo = self->_textureInfo;
      self->_textureInfo = v26;

      -[TXRTextureInfo setPixelFormat:](self->_textureInfo, "setPixelFormat:", [v21 pixelFormat]);
      -[TXRTextureInfo setAlphaInfo:](self->_textureInfo, "setAlphaInfo:", [v21 alphaInfo]);
      [v21 dimensions];
      -[TXRTextureInfo setDimensions:](self->_textureInfo, "setDimensions:");
      [(TXRTextureInfo *)self->_textureInfo setCubemap:0];
      [(TXRTextureInfo *)self->_textureInfo setMipmapLevelCount:1];
      [(TXRTextureInfo *)self->_textureInfo setArrayLength:1];
    }
    else if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, @"Image decoding failed");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_11:
    if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, @"Image decoding failed");
      BOOL v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

+ (int)determineColorSpaceClass:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (v7 && [v7 colorSpaceHandling])
  {
    uint64_t v9 = [v8 colorSpaceHandling];
    if ((unint64_t)(v9 - 1) >= 3) {
      +[TXRParserImageIO determineColorSpaceClass:displayGamut:options:]();
    }
    int v10 = 3 - v9;
  }
  else
  {
    CGColorSpaceRef ColorSpace = CGImageGetColorSpace(a3);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceGray();
    if (!ColorSpace || (CFDictionaryRef v14 = DeviceGray, CFEqual(DeviceRGB, ColorSpace)) || CFEqual(v14, ColorSpace))
    {
      int v10 = 0;
    }
    else
    {
      CGColorSpaceRelease(DeviceRGB);
      CGColorSpaceRelease(v14);
      v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      if (!CFEqual(ColorSpace, v16))
      {
        CGColorSpaceRelease(v16);
        CGColorSpaceRef v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC18]);
        if (CFEqual(ColorSpace, v17))
        {
          int v10 = 1;
          goto LABEL_9;
        }
        CGColorSpaceRelease(v17);
        if (a4 == 1 && CGColorSpaceIsWideGamutRGB(ColorSpace))
        {
          int v10 = 3;
          goto LABEL_9;
        }
      }
      int v10 = 2;
    }
  }
LABEL_9:

  return v10;
}

+ (id)decodeCGImage:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceRetain(ColorSpace);
  CFDictionaryRef v15 = [a1 decodeCGImageNonIndexed:a3 desiredPixelFormat:a4 bufferAllocator:v13 options:v12 error:a7];

  CGColorSpaceRelease(ColorSpace);
  return v15;
}

+ (id)decodeCGImageNonIndexed:(CGImage *)a3 desiredPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 options:(id)a6 error:(id *)a7
{
  v78[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  unsigned int Width = CGImageGetWidth(a3);
  unsigned int Height = CGImageGetHeight(a3);
  switch(+[TXRParserImageIO determineColorSpaceClass:a3 displayGamut:1 options:v11])
  {
    case 0:
      CGColorSpaceRef ColorSpace = CGImageGetColorSpace(a3);
      if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB) {
        CGColorSpaceRef ColorSpace = CGColorSpaceCreateDeviceRGB();
      }
      CGColorSpaceRetain(ColorSpace);
      if (v11) {
        goto LABEL_12;
      }
      goto LABEL_9;
    case 1:
      CFDictionaryRef v15 = (CFStringRef *)MEMORY[0x1E4F1DC18];
      goto LABEL_11;
    case 2:
      CFDictionaryRef v15 = (CFStringRef *)MEMORY[0x1E4F1DC88];
      goto LABEL_11;
    case 3:
      CFDictionaryRef v15 = (CFStringRef *)MEMORY[0x1E4F1DBE0];
LABEL_11:
      CGColorSpaceRef ColorSpace = CGColorSpaceCreateWithName(*v15);
      if (v11) {
        goto LABEL_12;
      }
      goto LABEL_9;
    default:
      CGColorSpaceRef ColorSpace = 0;
      if (!v11)
      {
LABEL_9:
        CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
        int v17 = 0;
        unsigned __int32 v18 = AlphaInfo - 1;
LABEL_18:
        uint64_t v20 = 2 * (v18 > 3);
        int v21 = 8451;
        goto LABEL_19;
      }
LABEL_12:
      int v19 = [v11 multiplyAlpha];
      unsigned __int32 v18 = CGImageGetAlphaInfo(a3) - 1;
      if (!v19)
      {
        int v17 = 0;
        goto LABEL_18;
      }
      int v17 = 1;
      if (v18 < 4) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = 2;
      }
      int v21 = 8449;
LABEL_19:
      uint64_t v22 = 0x8000000020;
      uint64_t v23 = 125;
      v67 = v11;
      if ((uint64_t)a4 <= 39)
      {
        if (a4 - 10 < 2)
        {
LABEL_58:
          if (v17) {
            int v21 = 1;
          }
          else {
            int v21 = 3;
          }
          uint64_t v22 = 0x800000008;
          uint64_t v23 = 11;
        }
        else if (a4 - 30 >= 2)
        {
          if (v17) {
            int v47 = 4353;
          }
          else {
            int v47 = 4355;
          }
          if (a4 == 25)
          {
            int v21 = v47;
            uint64_t v23 = 25;
            *(double *)&uint64_t v22 = COERCE_DOUBLE(0x1000000010);
          }
        }
        else
        {
LABEL_46:
          if (v17) {
            int v21 = 1;
          }
          else {
            int v21 = 3;
          }
          uint64_t v22 = 0x1000000008;
          uint64_t v23 = 31;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x37uLL:
          case 0x8DuLL:
          case 0xAAuLL:
          case 0xACuLL:
            if (v17) {
              int v21 = 8449;
            }
            else {
              int v21 = 8451;
            }
            uint64_t v22 = 0x2000000020;
            uint64_t v23 = 55;
            break;
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4DuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x62uLL:
          case 0x63uLL:
          case 0x64uLL:
          case 0x65uLL:
          case 0x66uLL:
          case 0x67uLL:
          case 0x68uLL:
          case 0x6AuLL:
          case 0x6BuLL:
          case 0x6CuLL:
          case 0x6DuLL:
          case 0x6EuLL:
          case 0x6FuLL:
          case 0x70uLL:
          case 0x71uLL:
          case 0x72uLL:
          case 0x74uLL:
          case 0x75uLL:
          case 0x76uLL:
          case 0x77uLL:
          case 0x78uLL:
          case 0x79uLL:
          case 0x7AuLL:
          case 0x7BuLL:
          case 0x7CuLL:
          case 0x7EuLL:
          case 0x7FuLL:
          case 0x80uLL:
          case 0x81uLL:
          case 0x88uLL:
          case 0x89uLL:
          case 0x8AuLL:
          case 0x8BuLL:
          case 0x90uLL:
          case 0x91uLL:
          case 0x92uLL:
          case 0x93uLL:
          case 0x94uLL:
          case 0x95uLL:
          case 0x9AuLL:
          case 0x9BuLL:
          case 0x9CuLL:
          case 0x9DuLL:
          case 0x9EuLL:
          case 0x9FuLL:
          case 0xA8uLL:
          case 0xA9uLL:
          case 0xABuLL:
          case 0xADuLL:
          case 0xAFuLL:
          case 0xB1uLL:
          case 0xB8uLL:
          case 0xB9uLL:
          case 0xBFuLL:
          case 0xC9uLL:
          case 0xCAuLL:
          case 0xCBuLL:
          case 0xD1uLL:
            break;
          case 0x41uLL:
            if (v17) {
              int v21 = 4353;
            }
            else {
              int v21 = 4355;
            }
            uint64_t v22 = 0x2000000010;
            uint64_t v23 = 65;
            break;
          case 0x46uLL:
          case 0x47uLL:
          case 0x82uLL:
          case 0x83uLL:
          case 0x84uLL:
          case 0x85uLL:
          case 0x86uLL:
          case 0x87uLL:
          case 0x98uLL:
          case 0x99uLL:
          case 0xA0uLL:
          case 0xA1uLL:
          case 0xA2uLL:
          case 0xA3uLL:
          case 0xA4uLL:
          case 0xA5uLL:
          case 0xA6uLL:
          case 0xA7uLL:
          case 0xB2uLL:
          case 0xB3uLL:
          case 0xB4uLL:
          case 0xB5uLL:
          case 0xB6uLL:
          case 0xB7uLL:
          case 0xBAuLL:
          case 0xBBuLL:
          case 0xBCuLL:
          case 0xBDuLL:
          case 0xBEuLL:
          case 0xC0uLL:
          case 0xC1uLL:
          case 0xC2uLL:
          case 0xC3uLL:
          case 0xC4uLL:
          case 0xC5uLL:
          case 0xC6uLL:
          case 0xC7uLL:
          case 0xC8uLL:
          case 0xCCuLL:
          case 0xCDuLL:
          case 0xCEuLL:
          case 0xCFuLL:
          case 0xD0uLL:
          case 0xD2uLL:
          case 0xD3uLL:
          case 0xD4uLL:
          case 0xD5uLL:
          case 0xD6uLL:
          case 0xD7uLL:
          case 0xD8uLL:
          case 0xD9uLL:
          case 0xDAuLL:
            if (v17) {
              int v21 = 1;
            }
            else {
              int v21 = 3;
            }
            uint64_t v22 = 0x2000000008;
            uint64_t v23 = 71;
            break;
          case 0x50uLL:
          case 0x51uLL:
            if (v17) {
              int v21 = 8194;
            }
            else {
              int v21 = 8196;
            }
            uint64_t v22 = 0x2000000008;
            uint64_t v23 = 81;
            break;
          case 0x69uLL:
          case 0xAEuLL:
          case 0xB0uLL:
            if (v17) {
              int v21 = 8449;
            }
            else {
              int v21 = 8451;
            }
            uint64_t v22 = 0x4000000020;
            uint64_t v23 = 105;
            break;
          case 0x73uLL:
            if (v17) {
              int v21 = 4353;
            }
            else {
              int v21 = 4355;
            }
            uint64_t v22 = 0x4000000010;
            uint64_t v23 = 115;
            break;
          case 0x7DuLL:
          case 0x8FuLL:
          case 0x96uLL:
          case 0x97uLL:
            if (v17) {
              int v21 = 8449;
            }
            else {
              int v21 = 8451;
            }
            uint64_t v23 = 125;
            break;
          case 0x8CuLL:
            goto LABEL_58;
          case 0x8EuLL:
            goto LABEL_46;
          default:
            if (a4 == 41)
            {
              if (v17) {
                int v21 = 4098;
              }
              else {
                int v21 = 4100;
              }
              uint64_t v22 = 0x1000000005;
              uint64_t v23 = 41;
            }
            else if (a4 == 40)
            {
              uint64_t v22 = 0x1000000005;
              int v21 = 5;
              uint64_t v23 = 40;
            }
            break;
        }
      }
      uint64_t v60 = v23;
      int v59 = pixelBytes(v23);
      size_t v24 = v59 * Width;
      unint64_t v65 = Height * (unint64_t)v24;
      v63 = objc_msgSend(v10, "newBufferWithLength:");
      v66 = [v63 map];
      uint64_t v25 = [v11 originOperation];
      v64 = v10;
      uint64_t v58 = v20;
      if (v25 > 255)
      {
        switch(v25)
        {
          case 256:
            goto LABEL_28;
          case 768:
            goto LABEL_30;
          case 512:
            goto LABEL_28;
        }
      }
      else
      {
        char v26 = v25 - 15;
        if ((unint64_t)(v25 - 15) <= 0x39)
        {
          if (((1 << v26) & 0x1540000000002A8) != 0)
          {
LABEL_28:
            v27 = ColorSpace;
            unsigned int v28 = Height;
            id v29 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v65];
            uint64_t v30 = [v29 mutableBytes];
LABEL_31:
            v31 = (void *)v30;
            goto LABEL_32;
          }
          if (((1 << v26) & 0x288000000000150) != 0)
          {
LABEL_30:
            v27 = ColorSpace;
            unsigned int v28 = Height;
            id v29 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v65];
            uint64_t v30 = [v66 bytes];
            goto LABEL_31;
          }
          if (((1 << v26) & 0x2000000000003) != 0) {
            goto LABEL_171;
          }
        }
        if ((unint64_t)(v25 - 1) < 8 || v25 == 240) {
LABEL_171:
        }
          +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]4();
      }
      v27 = ColorSpace;
      unsigned int v28 = Height;
      v31 = (void *)[v66 bytes];
      id v29 = 0;
LABEL_32:
      vImagePixelCount v32 = v28;
      v76[0] = v31;
      v76[1] = v28;
      vImagePixelCount v33 = Width;
      v76[2] = Width;
      v76[3] = v59 * Width;
      int v75 = 0;
      v71[0] = v22;
      v71[1] = v27;
      int v72 = v21;
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      if (MEMORY[0x1E01A4000](v76, v71, 0, a3, 512))
      {
        _newTXRErrorWithCodeAndErrorString(0, @"Could retrieve image data from CGImageRef");
        v34 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        v35 = v63;
        v36 = v29;
        v37 = v67;
        goto LABEL_151;
      }
      unsigned int v56 = v28;
      unsigned int v57 = Width;
      CGColorSpaceRelease(v27);
      v36 = v29;
      size_t v38 = v24;
      v37 = v67;
      if (v67)
      {
        uint64_t v39 = [v67 originOperation];
        int v40 = 0;
        int v41 = 1;
        if (v39 <= 63)
        {
          v42 = a7;
          int v43 = 0;
          switch(v39)
          {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 15:
            case 16:
LABEL_170:
              +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.5();
            case 18:
              goto LABEL_67;
            case 19:
              goto LABEL_66;
            case 20:
              goto LABEL_65;
            case 21:
LABEL_43:
              v44 = (void *)[v29 mutableBytes];
              char v53 = 0;
              int v55 = 0;
              v54 = 0;
              int v40 = 1;
              goto LABEL_82;
            case 22:
              goto LABEL_97;
            case 23:
LABEL_81:
              v44 = (void *)[v29 mutableBytes];
              char v53 = 0;
              int v40 = 0;
              v54 = 0;
              int v55 = 1;
              goto LABEL_82;
            case 24:
LABEL_96:
              int v41 = 0;
              int v40 = 1;
LABEL_97:
              [v66 bytes];
              int v43 = v40;
              int v40 = v41;
              break;
            default:
              break;
          }
        }
        else
        {
          v42 = a7;
          if (v39 <= 255)
          {
            int v43 = 0;
            switch(v39)
            {
              case '@':
                goto LABEL_170;
              case 'A':
                goto LABEL_65;
              case 'B':
                goto LABEL_66;
              case 'C':
                goto LABEL_67;
              case 'D':
                goto LABEL_98;
              case 'E':
                goto LABEL_96;
              case 'F':
                goto LABEL_81;
              case 'G':
                goto LABEL_97;
              case 'H':
                goto LABEL_43;
              default:
                if (v39 == 240) {
                  goto LABEL_170;
                }
                goto LABEL_98;
            }
          }
          if (v39 == 768)
          {
LABEL_66:
            v44 = (void *)[v29 mutableBytes];
            v54 = (void *)[v66 bytes];
            int v40 = 0;
            int v55 = 0;
            char v53 = 1;
            goto LABEL_82;
          }
          if (v39 == 512)
          {
LABEL_67:
            int v62 = componentsPerPixel(v60);
            vImage_Error v45 = 0;
            int v40 = 0;
            int v55 = 0;
            v54 = 0;
            v46 = v31;
LABEL_126:
            src.data = v46;
            src.height = v32;
            src.width = v33;
            src.rowBytes = v38;
            v31 = v54;
            dest.data = v54;
            dest.height = v32;
            dest.width = v33;
            dest.rowBytes = v38;
            switch(v62)
            {
              case 1:
                switch(v59)
                {
                  case 4:
                    vImage_Error v49 = vImageHorizontalReflect_PlanarF(&src, &dest, 0);
                    break;
                  case 2:
LABEL_133:
                    vImage_Error v49 = vImageHorizontalReflect_Planar16U(&src, &dest, 0);
                    break;
                  case 1:
                    vImage_Error v49 = vImageHorizontalReflect_Planar8(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.6();
                }
LABEL_141:
                vImage_Error v45 = v49;
LABEL_142:
                if (v42 && !v45)
                {
                  _newTXRErrorWithCodeAndErrorString(0, @"Unable to horizontally flip image");
                  id *v42 = (id)objc_claimAutoreleasedReturnValue();
                }
                break;
              case 2:
                if (v59 == 4) {
                  goto LABEL_138;
                }
                if (v59 != 2) {
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.7();
                }
                goto LABEL_133;
              case 3:
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.8();
              case 4:
                switch(v59)
                {
                  case 16:
                    vImage_Error v49 = vImageHorizontalReflect_ARGBFFFF(&src, &dest, 0);
                    break;
                  case 8:
LABEL_138:
                    vImage_Error v49 = vImageHorizontalReflect_ARGB16U(&src, &dest, 0);
                    break;
                  case 4:
                    vImage_Error v49 = vImageHorizontalReflect_ARGB8888(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.9();
                }
                goto LABEL_141;
              default:
                goto LABEL_142;
            }
            goto LABEL_145;
          }
          int v43 = 0;
          if (v39 == 256)
          {
LABEL_65:
            v44 = (void *)[v66 bytes];
            char v53 = 0;
            int v40 = 0;
            int v55 = 0;
            v54 = 0;
LABEL_82:
            src.data = v31;
            src.height = v32;
            src.width = v33;
            src.rowBytes = v38;
            v31 = v44;
            dest.data = v44;
            dest.height = v32;
            int v62 = componentsPerPixel(v60);
            dest.width = v33;
            dest.rowBytes = v38;
            switch(v62)
            {
              case 1:
                switch(v59)
                {
                  case 4:
                    vImage_Error v48 = vImageVerticalReflect_PlanarF(&src, &dest, 0);
                    break;
                  case 2:
LABEL_90:
                    vImage_Error v48 = vImageVerticalReflect_Planar16U(&src, &dest, 0);
                    break;
                  case 1:
                    vImage_Error v48 = vImageVerticalReflect_Planar8(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]0();
                }
LABEL_121:
                vImage_Error v45 = v48;
LABEL_122:
                if (v42 && !v45)
                {
                  _newTXRErrorWithCodeAndErrorString(0, @"Unable to vertically flip image");
                  id *v42 = (id)objc_claimAutoreleasedReturnValue();
                }
                v46 = v31;
                if (v53) {
                  goto LABEL_126;
                }
                goto LABEL_145;
              case 2:
                if (v59 == 4) {
                  goto LABEL_95;
                }
                if (v59 != 2) {
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]1();
                }
                goto LABEL_90;
              case 3:
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]2();
              case 4:
                switch(v59)
                {
                  case 16:
                    vImage_Error v48 = vImageVerticalReflect_ARGBFFFF(&src, &dest, 0);
                    break;
                  case 8:
LABEL_95:
                    vImage_Error v48 = vImageVerticalReflect_ARGB16U(&src, &dest, 0);
                    break;
                  case 4:
                    vImage_Error v48 = vImageVerticalReflect_ARGB8888(&src, &dest, 0);
                    break;
                  default:
                    +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]3();
                }
                goto LABEL_121;
              default:
                vImage_Error v45 = 0;
                goto LABEL_122;
            }
          }
        }
LABEL_98:
        int v55 = v43;
        int v62 = componentsPerPixel(v60);
LABEL_145:
        if (v40) {
          uint8_t v50 = 3;
        }
        else {
          uint8_t v50 = 1;
        }
        if ((v40 & 1) != 0 || v55)
        {
          src.data = v31;
          src.height = v32;
          src.width = v33;
          src.rowBytes = v38;
          dest.data = (void *)[v66 bytes];
          dest.height = v32;
          dest.width = v33;
          dest.rowBytes = v38;
          v78[0] = 0;
          v78[1] = 0;
          uint64_t v77 = 0;
          *(_DWORD *)backColor = 0;
          switch(v62)
          {
            case 1:
              switch(v59)
              {
                case 4:
                  vImageRotate90_PlanarF(&src, &dest, v50, 0.0, 0);
                  break;
                case 2:
LABEL_161:
                  vImageRotate90_Planar16U(&src, &dest, v50, 0, 0);
                  break;
                case 1:
                  vImageRotate90_Planar8(&src, &dest, v50, 0, 0);
                  break;
                default:
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]();
              }
              break;
            case 2:
              if (v59 == 4) {
                goto LABEL_166;
              }
              if (v59 != 2) {
                +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]();
              }
              goto LABEL_161;
            case 3:
              +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:]();
            case 4:
              switch(v59)
              {
                case 16:
                  vImageRotate90_ARGBFFFF(&src, &dest, v50, (const float *)v78, 0);
                  break;
                case 8:
LABEL_166:
                  vImageRotate90_ARGB16U(&src, &dest, v50, (const uint16_t *)&v77, 0);
                  break;
                case 4:
                  vImageRotate90_ARGB8888(&src, &dest, v50, backColor, 0);
                  break;
                default:
                  +[TXRParserImageIO decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:].cold.4();
              }
              break;
            default:
              break;
          }
        }
      }
      double v51 = COERCE_DOUBLE(__PAIR64__(v56, v57));
      v35 = v63;
      v34 = [[TXRImageIndependent alloc] initWithDimensions:v60 pixelFormat:v58 alphaInfo:v38 bytesPerRow:v65 bytesPerImage:v63 buffer:0 offset:v51];
LABEL_151:

      return v34;
  }
}

- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  return self->_imageInfo;
}

+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)exportImage:(id)a3 url:(id)a4 uttype:(__CFString *)a5 colorSpace:(CGColorSpace *)a6 orientation:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9 = a7;
  v32[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  if (a6)
  {
    CGColorSpaceRef v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
    CGColorSpaceRef v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
    CGColorSpaceRef v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBD0]);
    unsigned __int32 v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC78]);
    if (!CFEqual(v15, a6) && !CFEqual(v16, a6) && !CFEqual(v15, a6)) {
      CFEqual(v17, a6);
    }
    CGColorSpaceRelease(v15);
    CGColorSpaceRelease(v16);
    CGColorSpaceRelease(v17);
    CGColorSpaceRelease(v18);
    CGColorSpaceRetain(a6);
  }
  else
  {
    if (isSRGB([v13 pixelFormat])) {
      int v19 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
    }
    else {
      int v19 = (CFStringRef *)MEMORY[0x1E4F1DBE0];
    }
    a6 = CGColorSpaceCreateWithName(*v19);
  }
  uint64_t v20 = +[TXRParserImageIO newCGImageFromImage:v13 colorSpace:a6 error:a8];
  if (v20)
  {
    int v21 = v20;
    CFURLRef v22 = (const __CFURL *)v14;
    CGImageDestinationRef v23 = CGImageDestinationCreateWithURL(v22, a5, 1uLL, 0);
    if (v23)
    {
      size_t v24 = v23;
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedChar:v9];
      char v26 = CGColorSpaceCopyName(a6);
      uint64_t v27 = *MEMORY[0x1E4F2FD10];
      v31[0] = *MEMORY[0x1E4F2FCA0];
      v31[1] = v27;
      v32[0] = v25;
      v32[1] = v26;
      CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
      CGImageDestinationSetProperties(v24, v28);
      CGImageDestinationAddImage(v24, v21, 0);
      BOOL v29 = CGImageDestinationFinalize(v24);
      CGImageRelease(v21);
      CFRelease(v24);
      CFRelease(v22);
    }
    else
    {
      _newTXRErrorWithCodeAndErrorString(0, @"Could not create CG Destination Image with URL");
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v21);
      if (v22) {
        CFRelease(v22);
      }
      BOOL v29 = 0;
    }
  }
  else
  {
    _newTXRErrorWithCodeAndErrorString(0, @"Could not create CG Image with URL");
    BOOL v29 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

+ (CGImage)newCGImageFromImage:(id)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!a4)
  {
    if (isSRGB([v7 pixelFormat])) {
      uint64_t v9 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
    }
    else {
      uint64_t v9 = (CFStringRef *)MEMORY[0x1E4F1DBE0];
    }
    a4 = CGColorSpaceCreateWithName(*v9);
LABEL_10:
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(a4);
    if (NumberOfComponents == 2)
    {
      if ([v8 pixelFormat] == 30)
      {
        CGBitmapInfo v12 = 3;
        goto LABEL_35;
      }
      if ([v8 pixelFormat] != 65)
      {
        if ([v8 pixelFormat] != 105)
        {
          id v13 = objc_alloc_init(TXRDefaultBufferAllocator);
          CGColorSpaceRef v15 = v8;
          uint64_t v16 = 105;
LABEL_33:
          id v14 = +[TXRDataConverter newImageFromSourceImage:v15 newPixelFormat:v16 bufferAllocator:v13 gammaDegamma:0 error:a5];
          CGBitmapInfo v12 = 8451;
          goto LABEL_34;
        }
LABEL_27:
        CGBitmapInfo v12 = 8451;
        goto LABEL_35;
      }
    }
    else
    {
      if (NumberOfComponents == 1)
      {
        if ([v8 pixelFormat] == 10)
        {
          CGBitmapInfo v12 = 0;
LABEL_35:
          CGColorSpaceRef v17 = [v8 buffer];
          unsigned __int32 v18 = [v17 map];

          int v19 = CGDataProviderCreateWithData(0, (const void *)[v18 bytes], objc_msgSend(v8, "bytesPerImage"), 0);
          char v20 = pixelBytes([v8 pixelFormat]);
          size_t v21 = 8 * (v20 & 0x1Fu) / componentsPerPixel([v8 pixelFormat]);
          int v22 = pixelBytes([v8 pixelFormat]);
          [v8 dimensions];
          int v24 = v23 * v22;
          [v8 dimensions];
          size_t v26 = v25;
          [v8 dimensions];
          id v10 = CGImageCreate(v26, v27, v21, 8 * (v20 & 0x1F), v24, a4, v12, v19, 0, 0, kCGRenderingIntentDefault);
          CGColorSpaceRelease(a4);

          goto LABEL_36;
        }
        if ([v8 pixelFormat] == 25)
        {
          CGBitmapInfo v12 = 4352;
          goto LABEL_35;
        }
        if ([v8 pixelFormat] == 55)
        {
          CGBitmapInfo v12 = 8448;
          goto LABEL_35;
        }
        id v13 = objc_alloc_init(TXRDefaultBufferAllocator);
        id v14 = +[TXRDataConverter newImageFromSourceImage:v8 newPixelFormat:55 bufferAllocator:v13 gammaDegamma:0 error:a5];
        CGBitmapInfo v12 = 8448;
LABEL_34:

        v8 = v14;
        goto LABEL_35;
      }
      if ([v8 pixelFormat] == 80 || objc_msgSend(v8, "pixelFormat") == 81)
      {
        CGBitmapInfo v12 = 8196;
        goto LABEL_35;
      }
      if ([v8 pixelFormat] == 70 || objc_msgSend(v8, "pixelFormat") == 71)
      {
        CGBitmapInfo v12 = 16387;
        goto LABEL_35;
      }
      if ([v8 pixelFormat] != 115)
      {
        if ([v8 pixelFormat] != 125)
        {
          id v13 = objc_alloc_init(TXRDefaultBufferAllocator);
          CGColorSpaceRef v15 = v8;
          uint64_t v16 = 125;
          goto LABEL_33;
        }
        goto LABEL_27;
      }
    }
    CGBitmapInfo v12 = 4355;
    goto LABEL_35;
  }
  if (CGColorSpaceGetModel(a4) < kCGColorSpaceModelCMYK)
  {
    CGColorSpaceRetain(a4);
    goto LABEL_10;
  }
  if (a5)
  {
    _newTXRErrorWithCodeAndErrorString(13, @"Cannot create CGImage with given colorSpace.  ColorModel of colorSpace must be Monochrome or RGB ");
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_36:

  return v10;
}

- (TXRTextureInfo)textureInfo
{
  return self->_textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_textureInfo, 0);
}

+ (void)determineColorSpaceClass:displayGamut:options:.cold.1()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.1()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.2()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.3()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.4()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.5()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.6()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.7()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.8()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.9()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.10()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.11()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.12()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.13()
{
}

+ (void)decodeCGImageNonIndexed:desiredPixelFormat:bufferAllocator:options:error:.cold.14()
{
}

@end