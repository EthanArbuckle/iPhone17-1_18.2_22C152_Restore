@interface PLPhotoDCFFileGroup
- (BOOL)hasObsoleteFiles;
- (BOOL)hasPrebakedLandscapeScrubberThumbnails;
- (BOOL)hasPrebakedPortraitScrubberThumbnails;
- (BOOL)hasPrebakedThumbnail;
- (BOOL)hasPrebakedWildcatThumbnails;
- (BOOL)hasThumbnail;
- (BOOL)hasVideoFile;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)isWritePending;
- (PLPhotoDCFFileGroup)initWithName:(id)a3 number:(int)a4 directory:(id)a5;
- (id)date;
- (id)delegate;
- (id)description;
- (id)directory;
- (id)extensions;
- (id)imageSourceTypeHint;
- (id)lowResolutionFilename;
- (id)pathForContainingDirectory;
- (id)pathForFullSizeImage;
- (id)pathForGroupWithoutExtension;
- (id)pathForLowResolutionFile;
- (id)pathForMetadata;
- (id)pathForMetadataWithGroupName;
- (id)pathForPrebakedLandscapeScrubberThumbnails;
- (id)pathForPrebakedPortraitScrubberThumbnails;
- (id)pathForPrebakedThumbnail;
- (id)pathForPrebakedWildcatThumbnailsFile;
- (id)pathForThumbnailFile;
- (id)pathForTrimmedVideoFile;
- (id)pathForVideoFile;
- (id)pathForVideoPreviewFile;
- (id)prebakedLandscapeScrubberThumbnailsFilename;
- (id)prebakedPortraitScrubberThumbnailsFilename;
- (id)prebakedThumbnailFilename;
- (id)prebakedWildcatThumbnailsFilename;
- (id)thumbnailFilename;
- (id)videoPreviewFilename;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)addExtension:(id)a3;
- (void)addExtensionsFromMetadataDirectory;
- (void)createMetadataDirectoryIfNecessary;
- (void)deleteFiles;
- (void)deleteObsoleteFiles;
- (void)forceAddExtensionsFromMetadataDirectory;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWriteIsPending:(BOOL)a3;
@end

@implementation PLPhotoDCFFileGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredExtension, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_videoFileExtension, 0);
  objc_storeStrong((id *)&self->_prebakedThumbnailPath, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong(&self->_delegate, 0);
}

- (BOOL)isWritePending
{
  return (*((unsigned __int8 *)self + 96) >> 2) & 1;
}

- (void)setWriteIsPending:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 96) = *((unsigned char *)self + 96) & 0xFB | v3;
  -[PLPhotoDCFDirectory setWriteIsPending:](self->_directory, "setWriteIsPending:");
}

- (void)deleteFiles
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PLPhotoDCFFileGroup *)self pathForFullSizeImage];
  [v3 removeItemAtPath:v4 error:0];

  v5 = [(PLPhotoDCFFileGroup *)self pathForVideoFile];
  [v3 removeItemAtPath:v5 error:0];

  v6 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v7 = [v6 stringByAppendingPathComponent:self->super._name];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = _MetadataFileExtensions();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [v7 stringByAppendingPathExtension:*(void *)(*((void *)&v25 + 1) + 8 * v12)];
        [v3 removeItemAtPath:v13 error:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  v14 = [(PLPhotoDCFFileGroup *)self pathForGroupWithoutExtension];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = self->_extensions;
  uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(v14, "stringByAppendingPathExtension:", *(void *)(*((void *)&v21 + 1) + 8 * v19), (void)v21);
        [v3 removeItemAtPath:v20 error:0];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }
}

- (BOOL)hasPrebakedWildcatThumbnails
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return [(NSMutableSet *)extensions containsObject:@"WTH"];
}

- (BOOL)hasPrebakedPortraitScrubberThumbnails
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return [(NSMutableSet *)extensions containsObject:@"THP"];
}

- (BOOL)hasPrebakedLandscapeScrubberThumbnails
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return [(NSMutableSet *)extensions containsObject:@"THL"];
}

- (BOOL)hasPrebakedThumbnail
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return [(NSMutableSet *)extensions containsObject:@"BTH"];
}

- (BOOL)hasVideoFile
{
  return self->_videoFileExtension != 0;
}

- (BOOL)hasThumbnail
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return [(NSMutableSet *)extensions containsObject:@"THM"];
}

- (id)pathForVideoPreviewFile
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self videoPreviewFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathForLowResolutionFile
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self lowResolutionFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathForPrebakedWildcatThumbnailsFile
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self prebakedWildcatThumbnailsFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathForPrebakedPortraitScrubberThumbnails
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self prebakedPortraitScrubberThumbnailsFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathForPrebakedLandscapeScrubberThumbnails
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self prebakedLandscapeScrubberThumbnailsFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathForPrebakedThumbnail
{
  return self->_prebakedThumbnailPath;
}

- (id)pathForThumbnailFile
{
  char v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [(PLPhotoDCFFileGroup *)self thumbnailFilename];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)videoPreviewFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"JPG"];
}

- (id)lowResolutionFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"LRZ"];
}

- (id)prebakedWildcatThumbnailsFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"WTH"];
}

- (id)prebakedPortraitScrubberThumbnailsFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"THP"];
}

- (id)prebakedLandscapeScrubberThumbnailsFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"THL"];
}

- (id)prebakedThumbnailFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"BTH"];
}

- (id)thumbnailFilename
{
  return [(NSString *)self->super._name stringByAppendingPathExtension:@"THM"];
}

- (id)pathForTrimmedVideoFile
{
  v2 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:self->super._name];
  char v3 = [v2 stringByAppendingPathExtension:@"TRIM.MOV"];

  return v3;
}

- (id)pathForVideoFile
{
  videoFileExtension = self->_videoFileExtension;
  if (!videoFileExtension) {
    videoFileExtension = (NSString *)@"MOV";
  }
  directoryPath = self->_directoryPath;
  name = self->super._name;
  v5 = videoFileExtension;
  v6 = [(NSString *)directoryPath stringByAppendingPathComponent:name];
  v7 = [v6 stringByAppendingPathExtension:v5];

  return v7;
}

- (id)pathForFullSizeImage
{
  char v3 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:self->super._name];
  v4 = [v3 stringByAppendingPathExtension:self->_preferredExtension];

  return v4;
}

- (void)createMetadataDirectoryIfNecessary
{
  id v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v2 fileExistsAtPath:v3] & 1) == 0) {
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (id)pathForMetadataWithGroupName
{
  id v3 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
  v4 = [v3 stringByAppendingPathComponent:self->super._name];

  return v4;
}

- (id)pathForMetadata
{
  return [(NSString *)self->_directoryPath stringByAppendingPathComponent:@".MISC"];
}

- (id)pathForGroupWithoutExtension
{
  return [(NSString *)self->_directoryPath stringByAppendingPathComponent:self->super._name];
}

- (id)pathForContainingDirectory
{
  return self->_directoryPath;
}

- (id)extensions
{
  if ((*((unsigned char *)self + 96) & 2) == 0) {
    [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
  }
  extensions = self->_extensions;
  return extensions;
}

- (void)forceAddExtensionsFromMetadataDirectory
{
  *((unsigned char *)self + 96) &= ~2u;
  [(PLPhotoDCFFileGroup *)self addExtensionsFromMetadataDirectory];
}

- (void)addExtensionsFromMetadataDirectory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 96) & 2) == 0)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(PLPhotoDCFFileGroup *)self pathForMetadata];
    v5 = [v4 stringByAppendingPathComponent:self->super._name];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = _MetadataFileExtensions();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v5, "stringByAppendingPathExtension:", v11, (void)v13);
          if ([v3 fileExistsAtPath:v12]) {
            [(PLPhotoDCFFileGroup *)self addExtension:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    *((unsigned char *)self + 96) |= 2u;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: %@ (%d), extensions: %@>", objc_opt_class(), self, self->super._name, self->super._number, self->_extensions];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [v4 date];
  NSComparisonResult v6 = [(NSDate *)self->_date compare:v5];
  if (v6 == NSOrderedSame)
  {
    uint64_t v7 = [(PLPhotoDCFObject *)self name];
    uint64_t v8 = [v4 name];
    NSComparisonResult v6 = [v7 compare:v8];
  }
  return v6;
}

- (void)setDate:(id)a3
{
}

- (id)date
{
  date = self->_date;
  if (date)
  {
    id v3 = date;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  return v3;
}

- (void)addExtension:(id)a3
{
  id v5 = a3;
  extensions = self->_extensions;
  id v12 = v5;
  if (!extensions)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = self->_extensions;
    self->_extensions = v7;

    id v5 = v12;
    extensions = self->_extensions;
  }
  [(NSMutableSet *)extensions addObject:v5];
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_4242);
  if ([(id)__imageFileExtensions containsObject:v12])
  {
    p_preferredExtension = &self->_preferredExtension;
LABEL_5:
    objc_storeStrong((id *)p_preferredExtension, a3);
    goto LABEL_8;
  }
  p_preferredExtension = &self->_videoFileExtension;
  if (!*p_preferredExtension)
  {
    uint64_t v10 = _MetadataFileExtensions();
    char v11 = [v10 containsObject:v12];

    if ((v11 & 1) == 0) {
      goto LABEL_5;
    }
  }
LABEL_8:
}

- (BOOL)hasObsoleteFiles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:self->super._name];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = _ObsoleteFileExtensions();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(v4, "stringByAppendingPathExtension:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        char v10 = [v3 fileExistsAtPath:v9];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)deleteObsoleteFiles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:self->super._name];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = _ObsoleteFileExtensions();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = objc_msgSend(v4, "stringByAppendingPathExtension:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v3 removeItemAtPath:v10 error:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)isValid
{
  if ([(NSMutableSet *)self->_extensions containsObject:self->_preferredExtension]) {
    return 1;
  }
  return [(PLPhotoDCFFileGroup *)self hasVideoFile];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLPhotoDCFFileGroup *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PLPhotoDCFFileGroup *)self pathForGroupWithoutExtension];
      uint64_t v6 = [(PLPhotoDCFFileGroup *)v4 pathForGroupWithoutExtension];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*((unsigned char *)self + 96) & 1) == 0)
  {
    id v3 = [(PLPhotoDCFFileGroup *)self pathForGroupWithoutExtension];
    self->_hash = [v3 hash];

    *((unsigned char *)self + 96) |= 1u;
  }
  return self->_hash;
}

- (id)imageSourceTypeHint
{
  if ([(NSString *)self->_preferredExtension isEqualToString:@"TIF"]) {
    return @"public.tiff";
  }
  if ([(NSString *)self->_preferredExtension isEqualToString:@"PNG"]) {
    return @"public.png";
  }
  if ([(NSString *)self->_preferredExtension isEqualToString:@"GIF"]) {
    return @"com.compuserve.gif";
  }
  return @"public.jpeg";
}

- (id)directory
{
  return self->_directory;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (PLPhotoDCFFileGroup)initWithName:(id)a3 number:(int)a4 directory:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PLPhotoDCFFileGroup;
  char v10 = [(PLPhotoDCFObject *)&v20 initWithName:a3 number:v6];
  long long v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_directory, a5);
    uint64_t v12 = [(PLPhotoDCFDirectory *)v11->_directory fullPath];
    directoryPath = v11->_directoryPath;
    v11->_directoryPath = (NSString *)v12;

    preferredExtension = v11->_preferredExtension;
    v11->_preferredExtension = (NSString *)@"JPG";

    long long v15 = [(PLPhotoDCFFileGroup *)v11 pathForMetadata];
    uint64_t v16 = [(PLPhotoDCFFileGroup *)v11 prebakedThumbnailFilename];
    uint64_t v17 = [v15 stringByAppendingPathComponent:v16];
    prebakedThumbnailPath = v11->_prebakedThumbnailPath;
    v11->_prebakedThumbnailPath = (NSString *)v17;
  }
  return v11;
}

@end