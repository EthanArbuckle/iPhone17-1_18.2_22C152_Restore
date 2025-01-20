@interface PLFormatChooser
+ (CGSize)_desiredImageSizeForRequestedViewSizeInPixels:(CGSize)a3 isAspectFill:(BOOL)a4 srcAspectRatio:(double)a5;
+ (id)_suppportedFullSizeFormatIDs;
+ (id)defaultFormatChooser;
- (CGSize)posterThumbnailSize;
- (NSArray)supportedDerivativeFormats;
- (PLFormatChooser)initWithDeviceConfiguration:(id)a3;
- (PLImageFormat)fullScreenFormatForCurrentDevice;
- (PLImageFormat)indexSheetUnbakedFormat;
- (PLImageFormat)landscapeScrubberThumbnailFormat;
- (PLImageFormat)largestUncroppedNonJPEGThumbnailFormat;
- (PLImageFormat)masterThumbnailFormat;
- (PLImageFormat)portraitScrubberThumbnailFormat;
- (id)_bestFormatWithSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 hasAdjustmentsHandler:(id)a8 desiredImagePixelSize:(CGSize *)a9;
- (id)_fastestDegradedFormatFallingBackFromFormat:(id)a3;
- (id)_nextLargestAcceptableFormatForFormat:(id)a3;
- (id)_standardDegradedFormatFallingBackFromFormat:(id)a3;
- (id)derivativeFormatThatFitsSize:(CGSize)a3 contentMode:(int64_t)a4 demoteFactor:(double)a5 srcAspectRatio:(double)a6 desiredImagePixelSize:(CGSize *)a7;
- (void)chooseFormatsForSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 degradedFormatPolicy:(int64_t)a8 hasAdjustmentsHandler:(id)a9 desiredImagePixelSize:(CGSize *)a10 bestFormat:(id *)a11 degradedFormat:(id *)a12;
@end

@implementation PLFormatChooser

uint64_t __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (PLImageFormat)masterThumbnailFormat
{
  return self->_masterThumbnailFormat;
}

void __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isThumbnail] && (objc_msgSend(v7, "isTable") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    *a4 = 1;
  }
}

void __39__PLFormatChooser_defaultFormatChooser__block_invoke(uint64_t a1)
{
  id v4 = +[PLDeviceConfiguration defaultDeviceConfiguration];
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithDeviceConfiguration:v4];
  v3 = (void *)defaultFormatChooser_defaultChooser;
  defaultFormatChooser_defaultChooser = v2;
}

- (PLFormatChooser)initWithDeviceConfiguration:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PLFormatChooser;
  id v7 = [(PLFormatChooser *)&v60 init];
  if (v7)
  {
    id obj = a3;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = +[PLThumbnailManagerCore supportedThumbnailFormatIDsForDeviceConfiguration:v6];
    [v9 addObjectsFromArray:v10];

    v11 = [(id)objc_opt_class() _suppportedFullSizeFormatIDs];
    [v9 addObjectsFromArray:v11];

    p_indexSheetUnbakedFormat = (id *)&v7->_indexSheetUnbakedFormat;
    indexSheetUnbakedFormat = v7->_indexSheetUnbakedFormat;
    v7->_indexSheetUnbakedFormat = 0;

    v53 = v7;
    p_largestUncroppedNonJPEGThumbnailFormat = (id *)&v7->_largestUncroppedNonJPEGThumbnailFormat;
    largestUncroppedNonJPEGThumbnailFormat = v7->_largestUncroppedNonJPEGThumbnailFormat;
    v7->_largestUncroppedNonJPEGThumbnailFormat = 0;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)[*(id *)(*((void *)&v56 + 1) + 8 * i) unsignedIntegerValue]);
          if (v21)
          {
            objc_msgSend(v8, "insertObject:atIndex:", v21, objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v21, 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_3424));
            if ([v21 isSquare]
              && (!*p_indexSheetUnbakedFormat || objc_msgSend(v21, "compare:") == 1))
            {
              objc_storeStrong(p_indexSheetUnbakedFormat, v21);
            }
            if (([v21 isCropped] & 1) == 0
              && [v21 isTable]
              && (!*p_largestUncroppedNonJPEGThumbnailFormat || objc_msgSend(v21, "compare:") == 1))
            {
              objc_storeStrong(p_largestUncroppedNonJPEGThumbnailFormat, v21);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v18);
    }

    uint64_t v22 = [v8 copy];
    supportedDerivativeFormats = v53->_supportedDerivativeFormats;
    v53->_supportedDerivativeFormats = (NSArray *)v22;

    objc_storeStrong((id *)&v53->_deviceConfiguration, obj);
    [v6 logicalScreenSize];
    -[PLFormatChooser derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:](v53, "derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:", 0, 0);
    v24 = (PLImageFormat *)objc_claimAutoreleasedReturnValue();
    v25 = [(id)objc_opt_class() _suppportedFullSizeFormatIDs];
    v26 = [v25 lastObject];
    unsigned __int16 v27 = [v26 integerValue];

    if (!v27)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2 object:v53 file:@"PLFormatChooser.m" lineNumber:171 description:@"can't determine largest supported format."];
    }
    v28 = +[PLImageFormat formatWithID:v27];
    if (!v24 || [(PLImageFormat *)v24 compare:v28] == 1)
    {
      v29 = v28;

      v24 = v29;
    }
    v30 = [(id)objc_opt_class() _suppportedFullSizeFormatIDs];
    v31 = [v30 firstObject];
    unsigned __int16 v32 = [v31 integerValue];

    if (!v32)
    {
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:a2 object:v53 file:@"PLFormatChooser.m" lineNumber:181 description:@"can't determine smallest supported format."];
    }
    v33 = +[PLImageFormat formatWithID:v32];
    if ([(PLImageFormat *)v24 compare:v33] == -1)
    {
      v34 = v33;

      v24 = v34;
    }
    fullScreenFormatForCurrentDevice = v53->_fullScreenFormatForCurrentDevice;
    v53->_fullScreenFormatForCurrentDevice = v24;
    v36 = v24;

    id v7 = v53;
    masterThumbnailFormat = v53->_masterThumbnailFormat;
    v53->_masterThumbnailFormat = 0;

    v38 = v53->_supportedDerivativeFormats;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke_2;
    v54[3] = &unk_1E589F868;
    v39 = v53;
    v55 = v39;
    [(NSArray *)v38 enumerateObjectsWithOptions:2 usingBlock:v54];
    if ([(PLDeviceConfiguration *)v53->_deviceConfiguration isRetina]) {
      uint64_t v40 = 3143;
    }
    else {
      uint64_t v40 = 3034;
    }
    uint64_t v41 = +[PLImageFormat formatWithID:v40];
    posterThumbnailFormat = v39->_posterThumbnailFormat;
    v39->_posterThumbnailFormat = (PLImageFormat *)v41;

    if ([(PLDeviceConfiguration *)v53->_deviceConfiguration isRetina]) {
      uint64_t v43 = 8102;
    }
    else {
      uint64_t v43 = 8002;
    }
    uint64_t v44 = +[PLImageFormat formatWithID:v43];
    portraitScrubberThumbnailFormat = v39->_portraitScrubberThumbnailFormat;
    v39->_portraitScrubberThumbnailFormat = (PLImageFormat *)v44;

    if ([(PLDeviceConfiguration *)v53->_deviceConfiguration isRetina]) {
      uint64_t v46 = 8101;
    }
    else {
      uint64_t v46 = 8001;
    }
    uint64_t v47 = +[PLImageFormat formatWithID:v46];
    landscapeScrubberThumbnailFormat = v39->_landscapeScrubberThumbnailFormat;
    v39->_landscapeScrubberThumbnailFormat = (PLImageFormat *)v47;
  }
  return v7;
}

+ (id)_suppportedFullSizeFormatIDs
{
  return &unk_1EEC14F80;
}

- (id)derivativeFormatThatFitsSize:(CGSize)a3 contentMode:(int64_t)a4 demoteFactor:(double)a5 srcAspectRatio:(double)a6 desiredImagePixelSize:(CGSize *)a7
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_opt_class(), "_desiredImageSizeForRequestedViewSizeInPixels:isAspectFill:srcAspectRatio:", a4 == 1, a3.width, a3.height, a6);
  double v16 = v14;
  double v17 = v15;
  if (a7)
  {
    a7->double width = v14;
    a7->double height = v15;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = self->_supportedDerivativeFormats;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v23, "_isAcceptableForViewSize:contentMode:sourceAspectRatio:desiredImageSize:demoteFactor:", a4, width, height, a6, v16, v17, a5, (void)v26))
        {
          id v24 = v23;
          goto LABEL_13;
        }
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v24 = 0;
LABEL_13:

  return v24;
}

+ (CGSize)_desiredImageSizeForRequestedViewSizeInPixels:(CGSize)a3 isAspectFill:(BOOL)a4 srcAspectRatio:(double)a5
{
  double v5 = a3.width / a3.height;
  if (a3.height <= 0.0) {
    double v5 = 1.0;
  }
  if (!a4)
  {
    if (v5 <= a5) {
      goto LABEL_5;
    }
LABEL_7:
    a3.double width = a3.height * a5;
    goto LABEL_8;
  }
  if (v5 <= a5) {
    goto LABEL_7;
  }
LABEL_5:
  a3.double height = a3.width / a5;
LABEL_8:
  double v6 = round(a3.width);
  double v7 = round(a3.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (id)defaultFormatChooser
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLFormatChooser_defaultFormatChooser__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultFormatChooser_onceToken != -1) {
    dispatch_once(&defaultFormatChooser_onceToken, block);
  }
  uint64_t v2 = (void *)defaultFormatChooser_defaultChooser;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeScrubberThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_portraitScrubberThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_masterThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_largestUncroppedNonJPEGThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_indexSheetUnbakedFormat, 0);
  objc_storeStrong((id *)&self->_fullScreenFormatForCurrentDevice, 0);
  objc_storeStrong((id *)&self->_supportedDerivativeFormats, 0);
  objc_storeStrong((id *)&self->_posterThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
}

- (PLImageFormat)landscapeScrubberThumbnailFormat
{
  return self->_landscapeScrubberThumbnailFormat;
}

- (PLImageFormat)portraitScrubberThumbnailFormat
{
  return self->_portraitScrubberThumbnailFormat;
}

- (PLImageFormat)largestUncroppedNonJPEGThumbnailFormat
{
  return self->_largestUncroppedNonJPEGThumbnailFormat;
}

- (PLImageFormat)indexSheetUnbakedFormat
{
  return self->_indexSheetUnbakedFormat;
}

- (PLImageFormat)fullScreenFormatForCurrentDevice
{
  return self->_fullScreenFormatForCurrentDevice;
}

- (NSArray)supportedDerivativeFormats
{
  return self->_supportedDerivativeFormats;
}

- (CGSize)posterThumbnailSize
{
  [(PLImageFormat *)self->_posterThumbnailFormat size];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)chooseFormatsForSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 degradedFormatPolicy:(int64_t)a8 hasAdjustmentsHandler:(id)a9 desiredImagePixelSize:(CGSize *)a10 bestFormat:(id *)a11 degradedFormat:(id *)a12
{
  CGFloat v15 = -[PLFormatChooser _bestFormatWithSize:specificVersionType:contentMode:demoteFactor:srcAspectRatio:hasAdjustmentsHandler:desiredImagePixelSize:](self, "_bestFormatWithSize:specificVersionType:contentMode:demoteFactor:srcAspectRatio:hasAdjustmentsHandler:desiredImagePixelSize:", a4, a5, a9, a10, a3.width, a3.height, a6, a7);
  double v16 = v15;
  uint64_t v22 = v15;
  if (a11)
  {
    id v17 = v15;
    double v16 = v22;
    *a11 = v17;
  }
  if (a12)
  {
    uint64_t v18 = [(PLFormatChooser *)self _standardDegradedFormatFallingBackFromFormat:v16];
    uint64_t v19 = v18;
    if (a8 == 1)
    {
      id v20 = [(PLFormatChooser *)self _fastestDegradedFormatFallingBackFromFormat:v18];
    }
    else
    {
      id v20 = v18;
    }
    id v21 = v20;
    *a12 = v21;
  }
  MEMORY[0x1F41817F8]();
}

- (id)_fastestDegradedFormatFallingBackFromFormat:(id)a3
{
  id v4 = a3;
  if ([(PLDeviceConfiguration *)self->_deviceConfiguration shouldUseNanoThumbnailFormats])
  {
    id v5 = v4;
  }
  else
  {
    double v6 = [(PLFormatChooser *)self _nextLargestAcceptableFormatForFormat:v4];
    double v7 = v6;
    id v8 = v4;
    if (!v6) {
      goto LABEL_11;
    }
    char v9 = [v6 isTable];
    id v8 = v7;
    if (v9) {
      goto LABEL_11;
    }
    uint64_t v10 = [(NSArray *)self->_supportedDerivativeFormats indexOfObject:v7];
    id v8 = v7;
    if (v10 < 1) {
      goto LABEL_11;
    }
    uint64_t v11 = v10 + 1;
    while (1)
    {
      id v5 = [(NSArray *)self->_supportedDerivativeFormats objectAtIndexedSubscript:v11 - 2];
      if ([v4 _canDegradeToFormat:v5])
      {
        if ([v5 isTable]) {
          break;
        }
      }

      if ((unint64_t)--v11 <= 1)
      {
        id v8 = v7;
        goto LABEL_11;
      }
    }
    id v8 = v7;
    if (!v5) {
LABEL_11:
    }
      id v5 = v8;
  }
  return v5;
}

- (id)_standardDegradedFormatFallingBackFromFormat:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLDeviceConfiguration *)self->_deviceConfiguration shouldUseNanoThumbnailFormats];
  id v6 = v4;
  id v7 = v6;
  if (!v5)
  {
    id v8 = [(PLFormatChooser *)self _nextLargestAcceptableFormatForFormat:v6];
    char v9 = v8;
    id v7 = v6;
    if (v8)
    {
      id v7 = v8;
    }
  }

  return v7;
}

- (id)_nextLargestAcceptableFormatForFormat:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  CGFloat v15 = (id *)&v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__3416;
  uint64_t v18 = __Block_byref_object_dispose__3417;
  id v19 = 0;
  if ([v5 formatID] == 9998)
  {
    objc_storeStrong(v15 + 5, a3);
    supportedDerivativeFormats = self->_supportedDerivativeFormats;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PLFormatChooser__nextLargestAcceptableFormatForFormat___block_invoke;
    v13[3] = &unk_1E589F890;
    v13[4] = &v14;
    [(NSArray *)supportedDerivativeFormats enumerateObjectsWithOptions:2 usingBlock:v13];
  }
  else
  {
    uint64_t v7 = [(NSArray *)self->_supportedDerivativeFormats indexOfObject:v5];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_storeStrong(v15 + 5, a3);
      if (v7 >= 1)
      {
        uint64_t v8 = v7 + 1;
        while (1)
        {
          char v9 = [(NSArray *)self->_supportedDerivativeFormats objectAtIndexedSubscript:v8 - 2];
          if ([v5 _canDegradeToFormat:v9]) {
            break;
          }

          if ((unint64_t)--v8 <= 1) {
            goto LABEL_10;
          }
        }
        id v10 = v15[5];
        v15[5] = v9;
      }
    }
  }
LABEL_10:
  id v11 = v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __57__PLFormatChooser__nextLargestAcceptableFormatForFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isSquare] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_bestFormatWithSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 hasAdjustmentsHandler:(id)a8 desiredImagePixelSize:(CGSize *)a9
{
  double height = a3.height;
  double width = a3.width;
  id v17 = a8;
  uint64_t v18 = v17;
  BOOL v19 = height == -1.0 && width == -1.0;
  unint64_t v20 = a4 - 3;
  LOBYTE(v21) = 1;
  if (a4) {
    int v22 = 0;
  }
  else {
    int v22 = v19;
  }
  if (v20 > 0xFFFFFFFFFFFFFFFDLL) {
    int v22 = 1;
  }
  if (v17 && v22) {
    int v21 = (*((uint64_t (**)(id))v17 + 2))(v17) ^ 1;
  }
  if (((a4 == 0) & v21) != 0) {
    v23 = (void *)v19;
  }
  else {
    v23 = (void *)a4;
  }
  int v24 = a4 == 3 || v19;
  if (v20 < 0xFFFFFFFFFFFFFFFELL) {
    LOBYTE(v21) = 1;
  }
  if (v24 == 1 || (v21 & 1) == 0)
  {
    if (a9)
    {
      a9->double width = width;
      a9->double height = height;
    }
    long long v28 = __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(v23);
  }
  else
  {
    v25 = -[PLFormatChooser derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:](self, "derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:", a5, a9, width, height, a6, a7);
    long long v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(v23);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v28 = v27;
  }
  return v28;
}

id __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(void *a1)
{
  if ((unint64_t)a1 <= 3)
  {
    a1 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)(0x270D2710270F270EuLL >> (16 * a1)), v1);
  }
  return a1;
}

@end