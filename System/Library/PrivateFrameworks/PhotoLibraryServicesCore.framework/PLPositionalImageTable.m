@interface PLPositionalImageTable
+ (__CFString)colorSpaceName;
+ (unint64_t)metalPixelFormat;
- (BOOL)formatIsCropped;
- (BOOL)readImageDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5 imageWidth:(int *)a6 imageHeight:(int *)a7 imageDataWidth:(int *)a8 imageDataHeight:(int *)a9 startingOffset:(int64_t *)a10 bytesPerRow:(unint64_t *)a11 uuidBytes:(id *)a12;
- (BOOL)usesThumbIdentifiers;
- (BOOL)validateData:(id)a3 withToken:(id)a4;
- (BOOL)writeDebugImageAtIndex:(unint64_t)a3 toFileURL:(id)a4;
- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4;
- (Class)entriesClass;
- (PLImageFormat)format;
- (PLImageTableEntryFooter_s)tableFooterForIndex:(unint64_t)a3;
- (PLPositionalImageTable)initWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5;
- (id)_debugDescription;
- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3;
- (id)debugImageDataAtIndex:(unint64_t)a3;
- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10;
- (int)formatSideLen;
- (unint64_t)formatBytesPerPixel;
- (unint64_t)formatMaxBytesPerRow;
- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6;
- (void)preheatDataForThumbnailIndexes:(id)a3;
- (void)setFormatIsCropped:(BOOL)a3;
- (void)setFormatSideLen:(int)a3;
@end

@implementation PLPositionalImageTable

- (BOOL)usesThumbIdentifiers
{
  return 0;
}

void __115__PLPositionalImageTable_imageDataWithIdentifier_orIndex_width_height_bytesPerRow_dataWidth_dataHeight_dataOffset___block_invoke(uint64_t a1)
{
  PLPositionalTableMemoryPool_Free(*(void ***)(a1 + 32));
  v2 = *(void ***)(a1 + 40);
  v3 = *v2;
  *v2 = 0;

  v4 = *(void **)(a1 + 40);
  free(v4);
}

- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10
{
  if (self->super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
  }
  else if (self->super._entryCapacity <= a4)
  {
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v16 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  if (!v16) {
    goto LABEL_11;
  }
  v17 = v16;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  int v26 = 0;
  int v25 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  if (![(PLPositionalImageTable *)self readImageDataAtIndex:a4 intoPoolNode:v16 bytesRead:&v28 imageWidth:&v26 imageHeight:&v25 imageDataWidth:(char *)&v24 + 4 imageDataHeight:&v24 startingOffset:&v27 bytesPerRow:&v23 uuidBytes:0])
  {
    PLPositionalTableMemoryPool_Free(v17);
    goto LABEL_10;
  }
  v18 = (id *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  objc_storeStrong(v18, self);
  id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v20 = *v17;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __115__PLPositionalImageTable_imageDataWithIdentifier_orIndex_width_height_bytesPerRow_dataWidth_dataHeight_dataOffset___block_invoke;
  v22[3] = &__block_descriptor_48_e12_v24__0_v8Q16l;
  v22[4] = v17;
  v22[5] = v18;
  v16 = (void **)[v19 initWithBytesNoCopy:v20 length:v28 deallocator:v22];
  if (v16)
  {
    *a5 = v26;
    *a6 = v25;
    *a8 = HIDWORD(v24);
    *a9 = v24;
    *a10 = v27;
    *a7 = v23;
  }
LABEL_11:
  return v16;
}

- (BOOL)readImageDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5 imageWidth:(int *)a6 imageHeight:(int *)a7 imageDataWidth:(int *)a8 imageDataHeight:(int *)a9 startingOffset:(int64_t *)a10 bytesPerRow:(unint64_t *)a11 uuidBytes:(id *)a12
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v38 = 0;
  BOOL v19 = [(PLPositionalTable *)self readDataAtIndex:a3 intoPoolNode:a4 bytesRead:&v38];
  if (v19)
  {
    v20 = (char *)a4->var0 + [(PLPositionalTable *)self entryLength];
    v21 = v20 - 28;
    unsigned int v22 = *((_DWORD *)v20 - 2);
    if (v22
      && (unsigned int v23 = *((_DWORD *)v21 + 4)) != 0
      && ((unsigned int v24 = self->_formatSideLen, v22 <= v24) ? (v25 = v23 > v24) : (v25 = 1), !v25))
    {
      uint64_t v37 = 0;
      *(_OWORD *)buf = *MEMORY[0x1E4F1DB30];
      unint64_t v36 = 0;
      [(PLPositionalImageTable *)self getImageDataOffset:&v37 size:buf bytesPerRow:&v36 fromEntryFooter:v21];
      if (self->_formatIsCropped)
      {
        double formatSideLen = (double)self->_formatSideLen;
        double v33 = formatSideLen;
      }
      else
      {
        LODWORD(v30) = *((_DWORD *)v21 + 4);
        LODWORD(v31) = *((_DWORD *)v21 + 5);
        double formatSideLen = (double)v30;
        double v33 = (double)v31;
      }
      *a5 = v38;
      *a6 = (int)formatSideLen;
      *a7 = (int)v33;
      int v34 = (int)*(double *)&buf[8];
      *a8 = (int)*(double *)buf;
      *a9 = v34;
      *a10 = (int)v37;
      *a11 = v36;
      if (a12) {
        *a12 = *($DCF20CAD073027CB89FDEFA7A9A33809 *)v21;
      }
      LOBYTE(v19) = 1;
    }
    else
    {
      int v26 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v27 = self->_formatSideLen;
        int v28 = *((_DWORD *)v21 + 4);
        int v29 = *((_DWORD *)v21 + 5);
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v28;
        __int16 v40 = 1024;
        int v41 = v29;
        __int16 v42 = 1024;
        int v43 = v27;
        _os_log_impl(&dword_19BCFB000, v26, OS_LOG_TYPE_DEBUG, "Footer data invalid at index: %lu (imageHeight: %d, imageWidth: %d), format side len: %d", buf, 0x1Eu);
      }

      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (PLPositionalImageTable)initWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLPositionalImageTable.m", 74, @"Invalid parameter not satisfying: %@", @"format" object file lineNumber description];
  }
  if (([v10 isTable] & 1) == 0)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLPositionalImageTable.m", 75, @"Invalid parameter not satisfying: %@", @"format.isTable" object file lineNumber description];
  }
  [v10 dimension];
  uint64_t v12 = (int)v11;
  if ((int)v12 <= 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PLPositionalImageTable.m" lineNumber:78 description:@"format must have non-zero dimension."];
  }
  uint64_t v13 = [v10 tableFormatBytesPerRowForWidth:v12];
  [v10 size];
  v21.receiver = self;
  v21.super_class = (Class)PLPositionalImageTable;
  v15 = [(PLPositionalTable *)&v21 initWithPath:v9 readOnly:v6 entryLength:v13 * (unint64_t)v14 + 28];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_format, a5);
    v16->_formatIsCropped = [v10 isCropped];
    v16->_double formatSideLen = v12;
    v16->_formatBytesPerPixel = [v10 tableFormatBytesPerPixel];
    v16->_formatMaxBytesPerRow = [v10 tableFormatBytesPerRowForWidth:v12];
  }

  return v16;
}

- (void).cxx_destruct
{
}

- (PLImageFormat)format
{
  return self->_format;
}

- (unint64_t)formatMaxBytesPerRow
{
  return self->_formatMaxBytesPerRow;
}

- (unint64_t)formatBytesPerPixel
{
  return self->_formatBytesPerPixel;
}

- (void)setFormatSideLen:(int)a3
{
  self->_double formatSideLen = a3;
}

- (int)formatSideLen
{
  return self->_formatSideLen;
}

- (void)setFormatIsCropped:(BOOL)a3
{
  self->_formatIsCropped = a3;
}

- (BOOL)formatIsCropped
{
  return self->_formatIsCropped;
}

- (PLImageTableEntryFooter_s)tableFooterForIndex:(unint64_t)a3
{
  if (self->super._readOnly)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else if (self->super._entryCapacity <= a3)
  {
    return 0;
  }
  v5 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5;
  uint64_t v13 = 0;
  BOOL v7 = [(PLPositionalTable *)self readDataAtIndex:a3 intoPoolNode:v5 bytesRead:&v13];
  v8 = 0;
  if (v7)
  {
    v8 = (char *)malloc_type_calloc(1uLL, 0x1CuLL, 0x100004027586B93uLL);
    id v9 = (char *)*v6;
    unint64_t v10 = [(PLPositionalTable *)self entryLength];
    long long v11 = *(_OWORD *)&v9[v10 - 16];
    *(_OWORD *)v8 = *(_OWORD *)&v9[v10 - 28];
    *(_OWORD *)(v8 + 12) = v11;
  }
  PLPositionalTableMemoryPool_Free(v6);
  return (PLImageTableEntryFooter_s *)v8;
}

- (BOOL)writeDebugImageAtIndex:(unint64_t)a3 toFileURL:(id)a4
{
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [(PLPositionalImageTable *)self debugImageDataAtIndex:a3];
  if (v8)
  {
    id v9 = [v6 path];
    int v10 = [v7 fileExistsAtPath:v9];

    if (v10) {
      [v7 removeItemAtURL:v6 error:0];
    }
    char v11 = [v8 writeToURL:v6 atomically:0];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"PLPositionalImageTable.m" lineNumber:257 description:@"must be overriden by subclass."];
}

- (id)debugImageDataAtIndex:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLPositionalImageTable.m" lineNumber:252 description:@"must be overriden by subclass."];

  return 0;
}

- (Class)entriesClass
{
  return (Class)objc_opt_class();
}

- (id)_debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  context = (void *)MEMORY[0x19F38F510]();
  uint64_t v4 = [(PLPositionalTable *)self entryCapacity];
  v5 = [(PLPositionalImageTable *)self format];
  id v6 = [(PLPositionalTable *)self path];
  [v3 appendFormat:@"\n%p %@ %@, capacity: %ld entries\n", self, v5, v6, v4];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v8 = (void *)MEMORY[0x19F38F510]();
      objc_msgSend(v3, "appendFormat:", @"\t [%u] ", i);
      if ([(PLPositionalTable *)self isEmptyAtIndex:i])
      {
        [v3 appendString:@"(Empty)\n"];
      }
      else
      {
        id v9 = (void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
        if (v9)
        {
          int v10 = v9;
          unint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          uint64_t v17 = 0;
          if ([(PLPositionalImageTable *)self readImageDataAtIndex:i intoPoolNode:v9 bytesRead:&v22 imageWidth:(char *)&v21 + 4 imageHeight:&v21 imageDataWidth:(char *)&v20 + 4 imageDataHeight:&v20 startingOffset:&v23 bytesPerRow:&v19 uuidBytes:&v17])
          {
            char v11 = [PLUUIDString alloc];
            uint64_t v12 = -[PLUUIDString initWithCFUUIDBytes:](v11, "initWithCFUUIDBytes:", v17, v18);
            [v3 appendFormat:@"%@, (%u x %u) { ", v12, HIDWORD(v21), v21];
            if (v22)
            {
              unint64_t v13 = 0;
              double v14 = (char *)*v10;
              do
              {
                objc_msgSend(v3, "appendFormat:", @"%hhd ", v14[v13]);
                if (v13 > 8) {
                  break;
                }
                ++v13;
              }
              while (v22 > v13);
            }
            [v3 appendString:@"}\n"];
          }
          else
          {
            [v3 appendString:@"Read failed\n"];
          }
          PLPositionalTableMemoryPool_Free(v10);
        }
      }
    }
  }
  return v3;
}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  return 0;
}

- (void)preheatDataForThumbnailIndexes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PLPositionalImageTable_preheatDataForThumbnailIndexes___block_invoke;
  v3[3] = &unk_1E589F458;
  v3[4] = self;
  [a3 enumerateRangesUsingBlock:v3];
}

uint64_t __57__PLPositionalImageTable_preheatDataForThumbnailIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchEntriesInRange:", a2, a3);
}

- (BOOL)validateData:(id)a3 withToken:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];

  uint64_t v10 = v9 + v8;
  uint64_t v11 = PLUUIDBytesFromString(v6);
  uint64_t v13 = v12;

  *(void *)uu2 = v11;
  uint64_t v17 = v13;
  long long v15 = *(_OWORD *)(v10 - 28);
  return uuid_compare((const unsigned __int8 *)&v15, uu2) == 0;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLPositionalImageTable.m" lineNumber:146 description:@"must be overriden by subclass."];

  return 0;
}

+ (__CFString)colorSpaceName
{
  return 0;
}

+ (unint64_t)metalPixelFormat
{
  return 0;
}

@end