@interface PLImageFormat
+ (PLImageFormat)formatWithID:(unsigned __int16)a3;
+ (id)_syncFormats;
- (BOOL)_canDegradeToFormat:(id)a3;
- (BOOL)_isAcceptableForViewSize:(CGSize)a3 contentMode:(int64_t)a4 sourceAspectRatio:(double)a5 desiredImageSize:(CGSize)a6 demoteFactor:(double)a7;
- (BOOL)dimensionsReferToShortSide;
- (BOOL)isAlwaysFullScreen;
- (BOOL)isCropped;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFormat:(id)a3;
- (BOOL)isSquare;
- (BOOL)isTable;
- (BOOL)isThumbnail;
- (BOOL)refersToLatestVersion;
- (BOOL)refersToOriginalVersion;
- (BOOL)refersToPenultimateVersion;
- (BOOL)refersToUnadjustedVersion;
- (CGSize)_shortSideFormatScaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4;
- (CGSize)scaledSizeForSourceSize:(CGSize)a3;
- (CGSize)scaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4;
- (CGSize)size;
- (Class)_tableClass;
- (NSString)name;
- (PLImageFormat)init;
- (PLImageFormat)initWithFormatID:(unsigned __int16)a3;
- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5;
- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7;
- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7 formatMode:(int64_t)a8 thumbnailKind:(int64_t)thumbnailKind;
- (__CFString)colorSpaceName;
- (double)dimension;
- (id)createTableWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5;
- (id)description;
- (id)shortDescription;
- (id)thumbnailSpecification;
- (int64_t)compare:(id)a3;
- (int64_t)formatMode;
- (int64_t)thumbnailKind;
- (int64_t)version;
- (unint64_t)fullSizeDesiredLongSide;
- (unint64_t)fullSizeMaxLongSide;
- (unint64_t)fullSizeMinShortSide;
- (unint64_t)hash;
- (unint64_t)metalPixelFormat;
- (unint64_t)tableFormatBytesPerPixel;
- (unint64_t)tableFormatBytesPerRowForWidth:(int)a3;
- (unsigned)formatID;
- (void)setFormatID:(unsigned __int16)a3;
@end

@implementation PLImageFormat

- (unsigned)formatID
{
  return self->_formatID;
}

- (unint64_t)metalPixelFormat
{
  return self->_metalPixelFormat;
}

- (__CFString)colorSpaceName
{
  return self->_colorSpaceName;
}

uint64_t __30__PLImageFormat_formatWithID___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.PLImageFormat", MEMORY[0x1E4F14430]);
  v1 = (void *)formatWithID__readerWriterQueue;
  formatWithID__readerWriterQueue = (uint64_t)v0;

  formatWithID__idsToFormats = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isThumbnail
{
  return self->_thumbnailKind > 0;
}

- (id)createTableWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_msgSend(objc_alloc(-[PLImageFormat _tableClass](self, "_tableClass")), "initWithPath:readOnly:format:", v9, v5, v8);

  return v10;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)tableFormatBytesPerRowForWidth:(int)a3
{
  unint64_t v4 = [(PLImageFormat *)self tableFormatBytesPerPixel];
  if (a3 + 7 <= 0) {
    int v5 = -(-(a3 + 7) & 7);
  }
  else {
    int v5 = (a3 + 7) & 7;
  }
  return v4 * (a3 + 7 - v5);
}

- (unint64_t)tableFormatBytesPerPixel
{
  int64_t v2 = [(PLImageFormat *)self thumbnailKind];
  if ((unint64_t)(v2 - 1) > 3) {
    return 0;
  }
  else {
    return qword_19BDC7380[v2 - 1];
  }
}

- (int64_t)thumbnailKind
{
  return self->_thumbnailKind;
}

- (BOOL)isTable
{
  return (self->_thumbnailKind < 5uLL) & (0x1Au >> self->_thumbnailKind);
}

- (BOOL)isCropped
{
  return self->_isCropped;
}

+ (PLImageFormat)formatWithID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  pl_dispatch_once(&formatWithID__onceToken, &__block_literal_global_265);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7030;
  v21 = __Block_byref_object_dispose__7031;
  id v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__PLImageFormat_formatWithID___block_invoke_267;
  v15[3] = &unk_1E58A0320;
  v15[4] = &v17;
  __int16 v16 = v3;
  pl_dispatch_sync(formatWithID__readerWriterQueue, v15);
  if (!v18[5])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__PLImageFormat_formatWithID___block_invoke_2;
    v13[3] = &unk_1E58A0320;
    v13[4] = &v17;
    __int16 v14 = v3;
    pl_dispatch_barrier_sync(formatWithID__readerWriterQueue, v13);
    if (!v18[5])
    {
      int v5 = [a1 _syncFormats];
      v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v3];
      uint64_t v7 = [v5 objectForKey:v6];
      id v8 = (void *)v18[5];
      v18[5] = v7;
    }
  }
  id v9 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(id)v18[5] shortDescription];
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEBUG, "PLImageFormat formatWithID returning: %@", buf, 0xCu);
  }
  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return (PLImageFormat *)v11;
}

- (BOOL)isSquare
{
  return self->_formatMode == 1;
}

- (BOOL)_isAcceptableForViewSize:(CGSize)a3 contentMode:(int64_t)a4 sourceAspectRatio:(double)a5 desiredImageSize:(CGSize)a6 demoteFactor:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double v11 = a3.height;
  double v12 = a3.width;
  double v14 = 1.0 / a5;
  if (a5 <= 1.0) {
    double v15 = a5;
  }
  else {
    double v15 = 1.0 / a5;
  }
  if (a5 > 1.0) {
    double v14 = a5;
  }
  if (a4 == 1) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  switch([(PLImageFormat *)self formatMode])
  {
    case 0:
      [(PLImageFormat *)self dimension];
      goto LABEL_26;
    case 1:
      [(PLImageFormat *)self dimension];
      BOOL result = 0;
      if (a4 != 1 || v12 != v11) {
        return result;
      }
      goto LABEL_26;
    case 2:
      [(PLImageFormat *)self dimension];
      double v19 = 1.0;
      if (a4 == 1) {
        double v19 = v15;
      }
      double v17 = v18 * v19;
      goto LABEL_26;
    case 3:
      [(PLImageFormat *)self dimension];
      if (a4 == 1) {
        goto LABEL_26;
      }
      double v20 = 5.0;
LABEL_24:
      double v21 = fmin(v16, v20);
      break;
    case 4:
      [(PLImageFormat *)self dimension];
      double v20 = 2.66666667;
      if (a4 != 1) {
        goto LABEL_24;
      }
      double v21 = v16 * 2.66666667;
      if (v16 * 2.66666667 > 1.0) {
        double v21 = 1.0;
      }
      break;
    default:
      double v17 = 0.0;
      goto LABEL_26;
  }
  double v17 = v21 * v17;
LABEL_26:
  if (width >= height) {
    double v23 = height;
  }
  else {
    double v23 = width;
  }
  if (width >= height) {
    double v24 = width;
  }
  else {
    double v24 = height;
  }
  if (a4 != 1) {
    double v23 = v24;
  }
  return v23 < (a7 + 1.0) * v17;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(PLImageFormat *)self dimension];
  double v6 = v5;
  [v4 dimension];
  if (v6 <= 0.0 || v7 <= 0.0)
  {
    unsigned int v10 = [(PLImageFormat *)self formatID];
    unsigned int v11 = [v4 formatID];
    if (v10 >= v11) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    if (v10 <= v11) {
      int64_t v9 = v12;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
    if (v6 >= v7) {
      uint64_t v8 = 0;
    }
    if (v6 <= v7) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 1;
    }
  }

  return v9;
}

- (double)dimension
{
  return self->_dimension;
}

- (int64_t)formatMode
{
  return self->_formatMode;
}

void __30__PLImageFormat_formatWithID___block_invoke_267(uint64_t a1)
{
  int64_t v2 = (void *)formatWithID__idsToFormats;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__PLImageFormat_formatWithID___block_invoke_2(uint64_t a1)
{
  int64_t v2 = (void *)formatWithID__idsToFormats;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    double v7 = [[PLImageFormat alloc] initWithFormatID:*(unsigned __int16 *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v10)
    {
      unsigned int v11 = (void *)formatWithID__idsToFormats;
      id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
  }
}

- (PLImageFormat)initWithFormatID:(unsigned __int16)a3
{
  uint64_t v4 = self;
  if ((int)a3 > 3600)
  {
    if ((int)a3 > 4199)
    {
      if ((int)a3 > 8001)
      {
        if ((int)a3 > 9987)
        {
          switch(a3)
          {
            case 0x270Du:
              double v6 = *MEMORY[0x1E4F1DB30];
              double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
              uint64_t v5 = @"FullResolutionPenultimate";
              uint64_t v13 = 0;
              uint64_t v14 = 3;
              goto LABEL_139;
            case 0x270Eu:
              double v6 = *MEMORY[0x1E4F1DB30];
              double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
              uint64_t v5 = @"FullResolutionCurrent";
              uint64_t v13 = 0;
              uint64_t v14 = 0;
              goto LABEL_139;
            case 0x270Fu:
              double v6 = *MEMORY[0x1E4F1DB30];
              double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
              uint64_t v5 = @"FullResolutionUnadjusted";
              uint64_t v13 = 0;
              uint64_t v14 = 1;
              goto LABEL_139;
            case 0x2710u:
              double v6 = *MEMORY[0x1E4F1DB30];
              double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
              uint64_t v5 = @"FullResolutionOriginal";
              uint64_t v13 = 0;
              uint64_t v14 = 2;
LABEL_139:
              uint64_t v19 = 1;
              goto LABEL_147;
            default:
              if (a3 != 9988) {
                goto LABEL_166;
              }
              double v9 = *MEMORY[0x1E4F1DB30];
              double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
              uint64_t v8 = @"SubstandardCurrent";
              break;
          }
          goto LABEL_162;
        }
        switch(a3)
        {
          case 0x1F42u:
            uint64_t v8 = @"VideoScrubber32Portrait";
            double v15 = 32.0;
            double v9 = 24.0;
LABEL_107:
            uint64_t v16 = 1;
LABEL_163:
            uint64_t v17 = 0;
LABEL_164:
            v28 = -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:", v8, v16, 0, v17, v9, v15);
            goto LABEL_165;
          case 0x1FA5u:
            uint64_t v8 = @"VideoScrubber64Landscape";
            double v9 = 86.0;
            break;
          case 0x1FA6u:
            uint64_t v8 = @"VideoScrubber64Portrait";
            double v9 = 48.0;
            break;
          default:
            goto LABEL_166;
        }
        uint64_t v21 = 0x4050000000000000;
        goto LABEL_106;
      }
      if ((int)a3 > 5000)
      {
        if ((int)a3 > 5004)
        {
          if (a3 != 5005)
          {
            if (a3 != 8001) {
              goto LABEL_166;
            }
            uint64_t v8 = @"VideoScrubber32Landscape";
            double v9 = 43.0;
            uint64_t v21 = 0x4040000000000000;
            goto LABEL_106;
          }
          uint64_t v5 = @"AspectShort360";
          double v6 = 360.0;
        }
        else
        {
          if (a3 == 5001)
          {
            uint64_t v5 = @"AspectShort128";
            uint64_t v12 = 0x4060000000000000;
          }
          else
          {
            if (a3 != 5003) {
              goto LABEL_166;
            }
            uint64_t v5 = @"AspectShort256";
            uint64_t v12 = 0x4070000000000000;
          }
          double v6 = *(double *)&v12;
        }
        double v7 = v6;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 3;
LABEL_127:
        uint64_t v26 = 2;
        goto LABEL_159;
      }
      if ((int)a3 <= 4530)
      {
        if (a3 == 4200)
        {
          uint64_t v8 = @"WildcatCachedStackedImageHiDPI";
          double v9 = 420.0;
        }
        else
        {
          if (a3 != 4300) {
            goto LABEL_166;
          }
          uint64_t v8 = @"PhotoStreamDerivedSize";
          double v9 = 1536.0;
        }
LABEL_161:
        double v15 = v9;
        goto LABEL_162;
      }
      if (a3 == 4531)
      {
        uint64_t v5 = @"AspectLong120_ASTC";
        uint64_t v24 = 0x405E000000000000;
LABEL_156:
        double v6 = *(double *)&v24;
LABEL_157:
        double v7 = v6;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 2;
        goto LABEL_158;
      }
      if (a3 != 4532) {
        goto LABEL_166;
      }
      uint64_t v5 = @"AspectLong120_BC7";
      uint64_t v11 = 0x405E000000000000;
    }
    else
    {
      if ((int)a3 > 4028)
      {
        switch(a3)
        {
          case 0xFBDu:
            uint64_t v5 = @"AspectLong180Table_ASTC";
            double v6 = 180.0;
            goto LABEL_157;
          case 0xFBEu:
            uint64_t v5 = @"AspectLong180Table";
            double v6 = 180.0;
            goto LABEL_63;
          case 0xFBFu:
            uint64_t v5 = @"AspectLong120";
            uint64_t v18 = 0x405E000000000000;
            goto LABEL_62;
          case 0xFC0u:
            uint64_t v5 = @"AspectLong32";
            uint64_t v18 = 0x4040000000000000;
            goto LABEL_62;
          case 0xFC1u:
          case 0xFC2u:
          case 0xFC6u:
          case 0xFC7u:
            goto LABEL_166;
          case 0xFC3u:
            uint64_t v5 = @"FullSize1536";
            uint64_t v27 = 0x4098000000000000;
            goto LABEL_146;
          case 0xFC4u:
            uint64_t v5 = @"FullSize768";
            uint64_t v27 = 0x4088000000000000;
            goto LABEL_146;
          case 0xFC5u:
            uint64_t v5 = @"FullSize3072";
            uint64_t v27 = 0x40A8000000000000;
LABEL_146:
            double v6 = *(double *)&v27;
            double v7 = *(double *)&v27;
            uint64_t v13 = 0;
            uint64_t v14 = 0;
            uint64_t v19 = 0;
            break;
          case 0xFC8u:
            uint64_t v8 = @"WildcatStack";
            double v9 = 166.0;
            goto LABEL_161;
          default:
            switch(a3)
            {
              case 0x1023u:
                uint64_t v5 = @"AspectLong240";
                double v6 = 240.0;
LABEL_85:
                double v7 = v6;
                uint64_t v13 = 0;
                uint64_t v14 = 0;
                uint64_t v19 = 0;
                uint64_t v20 = 2;
                goto LABEL_127;
              case 0x1024u:
                uint64_t v5 = @"AspectLong64";
                uint64_t v18 = 0x4050000000000000;
                goto LABEL_62;
              case 0x1025u:
                uint64_t v5 = @"AspectLong64_BC7";
                uint64_t v11 = 0x4050000000000000;
                goto LABEL_153;
              case 0x1026u:
                uint64_t v5 = @"AspectLong64_ASTC";
                uint64_t v24 = 0x4050000000000000;
                goto LABEL_156;
              case 0x1027u:
              case 0x1028u:
              case 0x1029u:
              case 0x102Au:
              case 0x102Bu:
                goto LABEL_166;
              case 0x102Cu:
                uint64_t v8 = @"WildcatStackHiDPI";
                double v9 = 332.0;
                goto LABEL_161;
              default:
                if (a3 != 4100) {
                  goto LABEL_166;
                }
                uint64_t v8 = @"WildcatCachedStackedImage";
                double v9 = 210.0;
                break;
            }
            goto LABEL_161;
        }
LABEL_147:
        uint64_t v20 = 4;
        uint64_t v26 = 0;
        goto LABEL_159;
      }
      if ((int)a3 > 4006)
      {
        switch(a3)
        {
          case 0xFA7u:
            uint64_t v8 = @"FullScreen";
            break;
          case 0xFA9u:
            uint64_t v8 = @"FilledScreen";
            break;
          case 0xFABu:
            uint64_t v8 = @"FilledHalfScreen";
            break;
          default:
            goto LABEL_166;
        }
        double v9 = -1.0;
        double v15 = -1.0;
        uint64_t v16 = 0;
        uint64_t v17 = 1;
        goto LABEL_164;
      }
      if (a3 == 3601)
      {
        uint64_t v5 = @"AspectLong160Table";
        uint64_t v18 = 0x4064000000000000;
LABEL_62:
        double v6 = *(double *)&v18;
LABEL_63:
        double v7 = v6;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 2;
LABEL_124:
        uint64_t v26 = 1;
        goto LABEL_159;
      }
      if (a3 != 3602) {
        goto LABEL_166;
      }
      uint64_t v5 = @"AspectLong160Table_BC7";
      uint64_t v11 = 0x4064000000000000;
    }
LABEL_153:
    double v6 = *(double *)&v11;
    double v7 = *(double *)&v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 2;
    goto LABEL_154;
  }
  if ((int)a3 > 3300)
  {
    if ((int)a3 <= 3354)
    {
      switch(a3)
      {
        case 0xCE5u:
          uint64_t v5 = @"Square16";
          double v6 = 16.0;
          double v7 = 16.0;
          goto LABEL_123;
        case 0xCE6u:
        case 0xCECu:
        case 0xCF0u:
        case 0xCF1u:
        case 0xCF5u:
        case 0xCF6u:
        case 0xCF8u:
        case 0xCF9u:
        case 0xCFAu:
        case 0xCFBu:
        case 0xCFDu:
        case 0xCFEu:
        case 0xCFFu:
        case 0xD00u:
        case 0xD01u:
        case 0xD02u:
        case 0xD03u:
        case 0xD04u:
        case 0xD05u:
        case 0xD07u:
        case 0xD08u:
        case 0xD09u:
        case 0xD0Au:
          goto LABEL_166;
        case 0xCE7u:
          uint64_t v5 = @"Square22";
          double v6 = 22.0;
          double v7 = 22.0;
          goto LABEL_123;
        case 0xCE8u:
          uint64_t v5 = @"Square25";
          double v6 = 25.0;
          double v7 = 25.0;
          goto LABEL_123;
        case 0xCE9u:
          uint64_t v5 = @"Square32";
          uint64_t v25 = 0x4040000000000000;
          goto LABEL_121;
        case 0xCEAu:
          uint64_t v5 = @"Square39";
          double v6 = 39.0;
          goto LABEL_122;
        case 0xCEBu:
          uint64_t v5 = @"Square40_ASTC";
          uint64_t v22 = 0x4044000000000000;
          break;
        case 0xCEDu:
          uint64_t v5 = @"Square64";
          uint64_t v25 = 0x4050000000000000;
          goto LABEL_121;
        case 0xCEEu:
          uint64_t v5 = @"Square75";
          double v6 = 75.0;
          goto LABEL_122;
        case 0xCEFu:
          uint64_t v5 = @"Square78";
          double v6 = 78.0;
          goto LABEL_122;
        case 0xCF2u:
          uint64_t v5 = @"Square125";
          double v6 = 125.0;
          goto LABEL_122;
        case 0xCF3u:
          uint64_t v5 = @"Square128";
          uint64_t v25 = 0x4060000000000000;
LABEL_121:
          double v6 = *(double *)&v25;
LABEL_122:
          double v7 = v6;
LABEL_123:
          uint64_t v13 = 1;
          uint64_t v14 = 0;
          uint64_t v19 = 0;
          uint64_t v20 = 1;
          goto LABEL_124;
        case 0xCF4u:
          uint64_t v5 = @"Square128_ASTC";
          uint64_t v22 = 0x4060000000000000;
          break;
        case 0xCF7u:
          uint64_t v5 = @"Square157";
          double v6 = 157.0;
          double v7 = 157.0;
          uint64_t v13 = 1;
          uint64_t v14 = 0;
          uint64_t v19 = 0;
          uint64_t v20 = 1;
          goto LABEL_127;
        case 0xCFCu:
          uint64_t v5 = @"Square124_ASTC";
          uint64_t v22 = 0x405F000000000000;
          break;
        case 0xD06u:
          uint64_t v5 = @"Square24_ASTC";
          double v6 = 24.0;
          double v7 = 24.0;
          goto LABEL_132;
        case 0xD0Bu:
          uint64_t v5 = @"Square64_ASTC";
          uint64_t v22 = 0x4050000000000000;
          break;
        default:
          if (a3 != 3350) {
            goto LABEL_166;
          }
          uint64_t v5 = @"Square76_ASTC";
          uint64_t v22 = 0x4053000000000000;
          break;
      }
LABEL_131:
      double v6 = *(double *)&v22;
      double v7 = *(double *)&v22;
LABEL_132:
      uint64_t v13 = 1;
      uint64_t v14 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 1;
LABEL_158:
      uint64_t v26 = 3;
      goto LABEL_159;
    }
    switch(a3)
    {
      case 0xDADu:
        uint64_t v5 = @"AspectLong132";
        double v6 = 132.0;
        goto LABEL_85;
      case 0xDAEu:
      case 0xDB0u:
      case 0xDB2u:
        goto LABEL_166;
      case 0xDAFu:
        uint64_t v5 = @"AspectLong180";
        double v6 = 180.0;
        goto LABEL_85;
      case 0xDB1u:
        uint64_t v5 = @"AspectLong264";
        double v6 = 264.0;
        goto LABEL_85;
      case 0xDB3u:
        uint64_t v5 = @"AspectLong360";
        double v6 = 360.0;
        goto LABEL_85;
      default:
        if (a3 == 3355)
        {
          uint64_t v5 = @"Square32_ASTC";
          uint64_t v22 = 0x4040000000000000;
          goto LABEL_131;
        }
        if (a3 != 3356) {
          goto LABEL_166;
        }
        uint64_t v5 = @"Square32_BC7";
        double v6 = 32.0;
        double v7 = 32.0;
        uint64_t v13 = 1;
        uint64_t v14 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 1;
        break;
    }
LABEL_154:
    uint64_t v26 = 4;
LABEL_159:
    v28 = -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:", v5, v13, v14, v19, v20, v26, v6, v7);
LABEL_165:
    uint64_t v4 = v28;
LABEL_166:
    if (v4) {
      v4->_formatID = a3;
    }
    return v4;
  }
  if ((int)a3 > 3033)
  {
    if ((int)a3 <= 3140)
    {
      switch(a3)
      {
        case 0xBDAu:
          uint64_t v8 = @"PosterThumbnail";
          double v9 = 55.0;
          break;
        case 0xBDFu:
          uint64_t v8 = @"LowResFullScreen";
          double v9 = 160.0;
          uint64_t v10 = 0x405E000000000000;
LABEL_100:
          double v15 = *(double *)&v10;
LABEL_162:
          uint64_t v16 = 0;
          goto LABEL_163;
        case 0xBE1u:
          uint64_t v8 = @"Square79Baked";
          double v9 = 79.0;
          break;
        default:
          goto LABEL_166;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 3211)
    {
      if (a3 == 3141)
      {
        uint64_t v8 = @"Square158Baked";
        double v9 = 158.0;
      }
      else
      {
        if (a3 != 3143) {
          goto LABEL_166;
        }
        uint64_t v8 = @"PosterThumbnailHiDPI";
        double v9 = 110.0;
      }
LABEL_103:
      double v15 = v9;
      goto LABEL_107;
    }
    if (a3 == 3212)
    {
      uint64_t v8 = @"VideoScrubberLandscapeHiDPI";
      double v9 = 78.0;
    }
    else
    {
      if (a3 != 3213) {
        goto LABEL_166;
      }
      uint64_t v8 = @"VideoScrubberPortraitHiDPI";
      double v9 = 44.0;
    }
    uint64_t v21 = 0x404D000000000000;
LABEL_106:
    double v15 = *(double *)&v21;
    goto LABEL_107;
  }
  if ((int)a3 > 1095)
  {
    if ((int)a3 > 3011)
    {
      if (a3 != 3012)
      {
        if (a3 != 3013) {
          goto LABEL_166;
        }
        uint64_t v8 = @"VideoScrubberPortrait";
        double v9 = 22.0;
        double v15 = 29.0;
        goto LABEL_107;
      }
      uint64_t v8 = @"VideoScrubberLandscape";
      double v9 = 39.0;
    }
    else
    {
      if (a3 != 1096)
      {
        if (a3 != 3010) {
          goto LABEL_166;
        }
        uint64_t v8 = @"LowResFullScreenPortrait";
        double v9 = 120.0;
        uint64_t v10 = 0x4064000000000000;
        goto LABEL_100;
      }
      uint64_t v8 = @"ThumbnailHiDPI";
      double v9 = 150.0;
    }
    goto LABEL_103;
  }
  if (a3)
  {
    if (a3 == 901)
    {
      uint64_t v8 = @"FaceThumbnail";
      double v9 = 132.0;
    }
    else
    {
      if (a3 != 1095) {
        goto LABEL_166;
      }
      uint64_t v8 = @"Thumbnail";
      double v9 = 75.0;
    }
    goto LABEL_103;
  }
  double v23 = PLImageManagerGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_19BCFB000, v23, OS_LOG_TYPE_DEBUG, "Creating an image format with an unknown type is an error", v30, 2u);
  }

  return 0;
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7 formatMode:(int64_t)a8 thumbnailKind:(int64_t)thumbnailKind
{
  double height = a4.height;
  double width = a4.width;
  id v18 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PLImageFormat;
  uint64_t v19 = [(PLImageFormat *)&v31 init];
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_formatID = 0;
    uint64_t v21 = [v18 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v20->_size.double width = width;
    v20->_size.double height = height;
    v20->_isCropped = a5;
    v20->_thumbnailKind = thumbnailKind;
    v20->_formatMode = a8;
    v20->_dimension = width;
    v20->_version = a6;
    v20->_isAlwaysFullScreen = a7;
    if (thumbnailKind && (unint64_t)(a8 - 1) >= 3)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v20, @"PLImageFormat.m", 155, @"Thumbnail image formats must be either square, aspect short, or aspect long" object file lineNumber description];

      thumbnailKind = v20->_thumbnailKind;
    }
    if ((unint64_t)(thumbnailKind - 3) <= 1)
    {
      int v24 = (int)width + 3;
      int v25 = v24 <= 0 ? -(-v24 & 3) : v24 & 3;
      if (width != (double)(v24 - v25)
        || ((int v26 = (int)height + 3, v26 <= 0) ? (v27 = -(-v26 & 3)) : (v27 = v26 & 3), height != (double)(v26 - v27)))
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2 object:v20 file:@"PLImageFormat.m" lineNumber:158 description:@"ASTC/BC7 format dimensions must be in even multiples of 4."];
      }
    }
    v28 = [(PLImageFormat *)v20 _tableClass];
    v20->_metalPixelFormat = [(objc_class *)v28 metalPixelFormat];
    v20->_colorSpaceName = (__CFString *)[(objc_class *)v28 colorSpaceName];
  }

  return v20;
}

- (Class)_tableClass
{
  int64_t thumbnailKind = self->_thumbnailKind;
  if (thumbnailKind == 1 || thumbnailKind == 4 || thumbnailKind == 3) {
    uint64_t v3 = objc_opt_class();
  }
  else {
    uint64_t v3 = 0;
  }
  return (Class)v3;
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7
{
  return -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:", a3, a5, a6, a7, 0, 0, a4.width, a4.height);
}

- (BOOL)_canDegradeToFormat:(id)a3
{
  id v4 = a3;
  if (-[PLImageFormat isSquare](self, "isSquare") && ([v4 isSquare] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if ([(PLImageFormat *)self isSquare])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = [v4 isSquare] ^ 1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isAlwaysFullScreen
{
  return self->_isAlwaysFullScreen;
}

- (NSString)name
{
  return self->_name;
}

- (void)setFormatID:(unsigned __int16)a3
{
  self->_formatID = a3;
}

- (id)thumbnailSpecification
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = @"cropMode";
  if (self->_isCropped) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3];
  v13[0] = v4;
  v12[1] = @"width";
  int v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_size.width];
  v13[1] = v5;
  v12[2] = @"height";
  double v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_size.height];
  v13[2] = v6;
  v12[3] = @"kind";
  double v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_thumbnailKind];
  v13[3] = v7;
  v12[4] = @"bpp";
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", -[PLImageFormat tableFormatBytesPerPixel](self, "tableFormatBytesPerPixel"));
  v13[4] = v8;
  v12[5] = @"formatID";
  double v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", -[PLImageFormat formatID](self, "formatID"));
  void v13[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

- (CGSize)scaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  if ([(PLImageFormat *)self dimensionsReferToShortSide])
  {
    -[PLImageFormat _shortSideFormatScaledSizeForSourceSize:capLength:](self, "_shortSideFormatScaledSizeForSourceSize:capLength:", v4, width, height);
  }
  else
  {
    -[PLImageFormat scaledSizeForSourceSize:](self, "scaledSizeForSourceSize:", width, height);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)scaledSizeForSourceSize:(CGSize)a3
{
  double v3 = PLScaledSizeWithinSizeCore(a3.width, a3.height, self->_size.width, self->_size.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)_shortSideFormatScaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4
{
  double width = self->_size.width;
  if (width < self->_size.height) {
    double width = self->_size.height;
  }
  if (a4) {
    uint64_t v5 = 5 * (int)width;
  }
  else {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  double v6 = PLScaleDimensionsForThumbnailCore((int)width, (int)width, v5, 2, (uint64_t)a3.width, (uint64_t)a3.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (unint64_t)fullSizeMaxLongSide
{
  return 2 * [(PLImageFormat *)self fullSizeDesiredLongSide];
}

- (unint64_t)fullSizeMinShortSide
{
  if (self->_formatID - 4035 >= 3)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLImageFormat.m" lineNumber:657 description:@"Passed a format that isn't a full size format"];
  }
  return (unint64_t)self->_size.width;
}

- (unint64_t)fullSizeDesiredLongSide
{
  if (self->_formatID - 4035 >= 3)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLImageFormat.m" lineNumber:643 description:@"Passed a format that isn't a full size format"];
  }
  return (unint64_t)(self->_size.width / 0.75);
}

- (BOOL)dimensionsReferToShortSide
{
  return (self->_formatMode & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)refersToOriginalVersion
{
  return self->_version == 2;
}

- (BOOL)refersToPenultimateVersion
{
  return self->_version == 3;
}

- (BOOL)refersToUnadjustedVersion
{
  return (unint64_t)(self->_version - 1) < 2;
}

- (BOOL)refersToLatestVersion
{
  return self->_version == 0;
}

- (unint64_t)hash
{
  return self->_formatID;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PLImageFormat *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PLImageFormat *)self isEqualToFormat:v4];
  }

  return v5;
}

- (BOOL)isEqualToFormat:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_formatID)
  {
    int formatID = self->_formatID;
    BOOL v7 = formatID == [v4 formatID];
  }
  else
  {
    [v4 size];
    BOOL v11 = self->_size.width == v10 && self->_size.height == v9;
    if (!v11
      || (double dimension = self->_dimension, [v5 dimension], dimension != v13)
      || (int isCropped = self->_isCropped, isCropped != [v5 isCropped])
      || (int64_t formatMode = self->_formatMode, formatMode != [v5 formatMode])
      || (int64_t thumbnailKind = self->_thumbnailKind, thumbnailKind != [v5 thumbnailKind])
      || (int isAlwaysFullScreen = self->_isAlwaysFullScreen,
          isAlwaysFullScreen != [v5 isAlwaysFullScreen]))
    {
      BOOL v8 = 0;
      goto LABEL_18;
    }
    int64_t version = self->_version;
    BOOL v7 = version == [v5 version];
  }
  BOOL v8 = v7;
LABEL_18:

  return v8;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLImageFormat;
  double v3 = [(PLImageFormat *)&v8 description];
  id v4 = [(PLImageFormat *)self shortDescription];
  [(PLImageFormat *)self dimension];
  double v6 = [v3 stringByAppendingFormat:@" - %@, %f", v4, v5];

  return v6;
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%04lu-%@", self->_formatID, self->_name];
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5
{
  return -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:", a3, a5, 0, 0, a4.width, a4.height);
}

- (PLImageFormat)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[PLAssetFormat init] unsupported" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)_syncFormats
{
  pl_dispatch_once(&_syncFormats_onceToken, &__block_literal_global_7035);
  id v2 = (void *)_syncFormats_syncFormats;
  return v2;
}

void __29__PLImageFormat__syncFormats__block_invoke()
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = dlopen("/usr/lib/libMobileCheckpoint.dylib", 1);
  id v2 = (uint64_t (*)(__CFString *))dlsym(v1, "MCCopyCheckpointValue");
  double v3 = (void *)v2(@"ImageSpecifications");
  if (v3
    || ([MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/System/Library/CoreServices/Checkpoint.xml"], id v4 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "objectForKey:", @"ImageSpecifications"), v3 = objc_claimAutoreleasedReturnValue(), v4, v3))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 1;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        int v23 = v8;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v5);
          }
          if ((v8 & 1) == 0)
          {
            BOOL v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
            uint64_t v12 = [v11 objectForKey:@"RenderWidth"];
            double v13 = (double)(int)[v12 intValue];
            uint64_t v14 = [v11 objectForKey:@"RenderHeight"];
            double v15 = (double)(int)[v14 intValue];

            uint64_t v16 = [v11 objectForKey:@"Crop"];
            BOOL v17 = (int)[v16 intValue] > 0;

            id v18 = [[PLImageFormat alloc] initWithName:@"?", v17, v13, v15 size isCropped];
            uint64_t v19 = [v11 objectForKey:@"FormatId"];
            -[PLImageFormat setFormatID:](v18, "setFormatID:", (unsigned __int16)[v19 intValue]);

            uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", -[PLImageFormat formatID](v18, "formatID"));
            [v0 setObject:v18 forKeyedSubscript:v20];
          }
          LOBYTE(v8) = v8 ^ 1;
          ++v10;
        }
        while (v7 != v10);
        int v8 = v23 ^ v7;
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
  }
  uint64_t v21 = [v0 copy];
  uint64_t v22 = (void *)_syncFormats_syncFormats;
  _syncFormats_syncFormats = v21;
}

@end