@interface PLThumbFileManagerCore
+ ($2825F4736939C4A6D3AD43837233062D)maxMasterSizeFromSourceImageSize:(id)a3 format:(id)a4;
+ (id)_fileIdentifierForThumbnailIdentifierComponents:(id)a3 recipeID:(unsigned int)a4;
+ (id)thumbnailIdentifierURLComponentsForUBFWithAssetUUID:(id)a3 bundleScope:(unsigned __int16)a4;
+ (id)thumbnailPathForThumbIdentifier:(id)a3 withPathManager:(id)a4 recipeID:(unsigned int)a5 forDelete:(BOOL)a6;
- (BOOL)isReadOnly;
- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7;
- (BOOL)usesThumbIdentifiers;
- (BOOL)validateData:(id)a3 withToken:(id)a4;
- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4;
- (NSString)description;
- (NSString)path;
- (PLImageFormat)format;
- (PLThumbFileManagerCore)initWithImageFormat:(id)a3 pathManager:(id)a4;
- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3;
- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10;
- (id)thumbnailPathForThumbIdentifier:(id)a3;
- (void)deleteEntryWithIdentifier:(id)a3;
- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4;
@end

@implementation PLThumbFileManagerCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (PLImageFormat)format
{
  return (PLImageFormat *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)validateData:(id)a3 withToken:(id)a4
{
  return 1;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  return 0;
}

- (id)imageDataWithIdentifier:(id)a3 orIndex:(unint64_t)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 dataOffset:(int *)a10
{
  id v11 = a3;
  if ([v11 length])
  {
    v12 = (void *)MEMORY[0x1E4F1C9B8];
    v13 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v11];
    v14 = [v12 dataWithContentsOfFile:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7
{
  return 0;
}

- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    v9 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v7];
    v10 = [(PLThumbFileManagerCore *)self thumbnailPathForThumbIdentifier:v8];
    if (([v10 isEqualToString:v9] & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v12 = [v11 moveItemAtPath:v9 toPath:v10 error:0];

      if ((v12 & 1) == 0)
      {
        v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v14 = [v10 stringByDeletingLastPathComponent];
        [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];

        v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        LOBYTE(v14) = [v15 moveItemAtPath:v9 toPath:v10 error:0];

        if ((v14 & 1) == 0)
        {
          v16 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 138412546;
            v18 = v9;
            __int16 v19 = 2112;
            v20 = v10;
            _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEFAULT, "couldn't move thumbnail from %@ to %@", (uint8_t *)&v17, 0x16u);
          }
        }
      }
    }
  }
}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  return a3;
}

- (void)deleteEntryWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = __PLIsAssetsdProxyService == 0;
  }
  if (!v5)
  {
    id v6 = [(id)objc_opt_class() thumbnailPathForThumbIdentifier:v4 withPathManager:self->_pathManager recipeID:self->_recipeId forDelete:1];
    if (!v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    char v8 = [v7 removeItemAtPath:v6 error:&v12];
    id v9 = v12;
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      char v11 = PLIsErrorFileNotFound(v9);

      if (v11) {
        goto LABEL_9;
      }
      id v7 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v6;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Could not delete master thumb at path %@", buf, 0xCu);
      }
    }

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:
}

- (id)thumbnailPathForThumbIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() thumbnailPathForThumbIdentifier:v4 withPathManager:self->_pathManager recipeID:self->_recipeId forDelete:0];

  return v5;
}

- (BOOL)usesThumbIdentifiers
{
  return 1;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLThumbFileManagerCore;
  v3 = [(PLThumbFileManagerCore *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" _format %@", self->_format];
  objc_msgSend(v4, "appendFormat:", @" r/o %d", self->_readOnly);
  objc_msgSend(v4, "appendFormat:", @" _recipeId %d", self->_recipeId);
  return (NSString *)v4;
}

- (PLThumbFileManagerCore)initWithImageFormat:(id)a3 pathManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLThumbFileManagerCore.m", 41, @"Invalid parameter not satisfying: %@", @"format" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PLThumbFileManagerCore;
  v10 = [(PLThumbFileManagerCore *)&v14 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_format, a3);
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    v11->_readOnly = (PLIsReallyAssetsd_isAssetsd == 0) & (__PLIsAssetsdProxyService ^ 1);
    objc_storeStrong((id *)&v11->_pathManager, a4);
    v11->_recipeId = (2 * [v8 formatID]) | 0x40001;
  }

  return v11;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxMasterSizeFromSourceImageSize:(id)a3 format:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [v6 dimension];
  uint64_t v8 = (int)v7;
  [v6 dimension];
  unint64_t v10 = v8 | ((unint64_t)(int)v9 << 32);
  switch([v6 formatMode])
  {
    case 0:
      id v12 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = a1;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "Invalid format mode for ThumbFile (%@)", (uint8_t *)&v16, 0xCu);
      }

      break;
    case 1:
    case 3:
    case 4:
      [v6 dimension];
      unint64_t v10 = PLScaleDimensionsToShortSide(*(void *)&a3, (int)v11, 5 * (int)v11);
      break;
    case 2:
      objc_msgSend(v6, "scaledSizeForSourceSize:", (double)a3.var0, (double)a3.var1);
      unint64_t v10 = (int)v13 | ((unint64_t)(int)v14 << 32);
      break;
    default:
      break;
  }

  return ($2825F4736939C4A6D3AD43837233062D)v10;
}

+ (id)thumbnailPathForThumbIdentifier:(id)a3 withPathManager:(id)a4 recipeID:(unsigned int)a5 forDelete:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    __int16 v19 = 0;
    goto LABEL_14;
  }
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v11];
  double v14 = [v13 scheme];
  int v15 = [v14 isEqualToString:@"ubf"];

  if (v15)
  {
    int v16 = [(id)objc_opt_class() _fileIdentifierForThumbnailIdentifierComponents:v13 recipeID:v7];
    id v17 = [v12 readOnlyUrlWithIdentifier:v16];
    uint64_t v18 = [v17 path];
  }
  else
  {
    v20 = [v13 scheme];
    int v21 = [v20 isEqualToString:@"dcim"];

    if (!v21)
    {
      v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v11;
        _os_log_impl(&dword_19BCFB000, v23, OS_LOG_TYPE_ERROR, "Invalid thumbnail identifier scheme: %@", buf, 0xCu);
      }

      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:a1 file:@"PLThumbFileManagerCore.m" lineNumber:108 description:@"Invalid thumbnail identfier scheme"];

      __int16 v19 = 0;
      goto LABEL_13;
    }
    if (!v6)
    {
      v26 = NSString;
      int v16 = [v12 photoDirectoryWithType:12 createIfNeeded:1 error:0];
      v27 = [v13 path];
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%d.JPG", (unsigned __int16)v7 >> 1);
      __int16 v19 = [v26 stringWithFormat:@"%@/%@/%@", v16, v27, v28];

      goto LABEL_5;
    }
    v22 = NSString;
    int v16 = [v12 photoDirectoryWithType:12 createIfNeeded:1 error:0];
    id v17 = [v13 path];
    uint64_t v18 = [v22 stringWithFormat:@"%@/%@", v16, v17];
  }
  __int16 v19 = (void *)v18;

LABEL_5:
LABEL_13:

LABEL_14:
  return v19;
}

+ (id)_fileIdentifierForThumbnailIdentifierComponents:(id)a3 recipeID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 path];
  double v9 = [v8 pathComponents];

  if ([v9 count] == 2)
  {
    unint64_t v10 = [v9 objectAtIndexedSubscript:0];
    unsigned __int16 v11 = [v10 integerValue];

    id v12 = [v9 objectAtIndexedSubscript:1];
    double v13 = [PLPhotoLibraryFileIdentifier alloc];
    double v14 = [(id)*MEMORY[0x1E4F44410] identifier];
    int v15 = [(PLPhotoLibraryFileIdentifier *)v13 initWithAssetUuid:v12 bundleScope:v11 uti:v14 resourceVersion:3 recipeID:v4];
  }
  else
  {
    int v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v7 string];
      int v20 = 138412290;
      int v21 = v17;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Invalid thumbnail identifier for file identifier: %@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"PLThumbFileManagerCore.m" lineNumber:83 description:@"Invalid thumbnail identifier for file identifier"];

    int v15 = 0;
  }

  return v15;
}

+ (id)thumbnailIdentifierURLComponentsForUBFWithAssetUUID:(id)a3 bundleScope:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  BOOL v5 = (objc_class *)MEMORY[0x1E4F29088];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setScheme:@"ubf"];
  uint64_t v8 = [NSString stringWithFormat:@"%d/%@", v4, v6];

  [v7 setPath:v8];
  return v7;
}

@end