@interface BICDescribedImage
+ (BICDescribedImage)describedImageWithIdentifier:(id)a3 size:(CGSize)a4 processingOptions:(unsigned __int16)a5;
+ (BICDescribedImage)describedImageWithPriority:(unint64_t)a3;
+ (id)describedImageFromEntryLocation:(id)a3;
+ (id)describedImageFromImageEntry:(id)a3;
+ (id)describedImagesToDictionaryOfSets:(id)a3;
+ (id)entryLocationWithIdentifier:(id)a3 level:(signed __int16)a4 size:(CGSize)a5 options:(unsigned __int16)a6 quality:(unsigned __int16)a7;
+ (id)groupDescribedImagesByIdentifier:(id)a3;
+ (id)identifierFromEntryLocation:(id)a3;
+ (id)stringForImageQuality:(unsigned __int16)a3;
+ (unsigned)transformedQualityFrom:(unsigned __int16)a3;
- (BICDescribedImage)alternateRequest;
- (BICDescribedImage)initWithIdentifier:(id)a3;
- (BICDescribedImage)primaryRequest;
- (BICDescribedImage)stackRequest;
- (BICImage)image;
- (BOOL)isAlternateGeneric;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescribedImage:(id)a3;
- (BOOL)isExpired;
- (BOOL)isGeneric;
- (BOOL)isGenericSeriesStack;
- (BOOL)isLowQuality;
- (BOOL)isOldVersion;
- (BOOL)isSeriesStackWithGenerics;
- (BOOL)requiresNetwork;
- (BOOL)seriesStack;
- (BOOL)unknownAspectRatio;
- (CGPath)stackOutline;
- (CGRect)nonShadowArea;
- (CGSize)imageSize;
- (NSDate)expiry;
- (NSDate)lastUsed;
- (NSMutableString)operationsLog;
- (NSString)adamID;
- (NSString)author;
- (NSString)description;
- (NSString)filePath;
- (NSString)identifier;
- (NSString)title;
- (NSString)urlString;
- (id)_computeDescriptionIsFull:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entryLocationForLevelID:(signed __int16)a3;
- (id)shortDescription;
- (id)shortDescriptionOfProcessingOptions;
- (int64_t)costFor:(signed __int16)a3;
- (signed)persistanceOptions;
- (unint64_t)generation;
- (unint64_t)matchScore;
- (unint64_t)priority;
- (unsigned)location;
- (unsigned)processingOptions;
- (unsigned)quality;
- (unsigned)requestOptions;
- (void)dealloc;
- (void)setAdamID:(id)a3;
- (void)setAlternateRequest:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLastUsed:(id)a3;
- (void)setLocation:(unsigned __int16)a3;
- (void)setMatchScore:(unint64_t)a3;
- (void)setNonShadowArea:(CGRect)a3;
- (void)setOperationsLog:(id)a3;
- (void)setPersistanceOptions:(signed __int16)a3;
- (void)setPrimaryRequest:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setProcessingOptions:(unsigned __int16)a3;
- (void)setQuality:(unsigned __int16)a3;
- (void)setRequestOptions:(unsigned __int16)a3;
- (void)setStackOutline:(CGPath *)a3;
- (void)setStackRequest:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnknownAspectRatio:(BOOL)a3;
- (void)setUrlString:(id)a3;
@end

@implementation BICDescribedImage

+ (id)groupDescribedImagesByIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 count];
  v5 = v4;
  if ((unint64_t)v4 < 2)
  {
    if (v4 == (unsigned char *)&def_7D91C + 1)
    {
      id v22 = v3;
      v15 = +[NSArray arrayWithObjects:&v22 count:1];
    }
    else
    {
      v15 = &__NSArray0__struct;
    }
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v3;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 identifier];
          id v14 = [v6 objectForKeyedSubscript:v13];
          if (!v14)
          {
            id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
            [v6 setObject:v14 forKeyedSubscript:v13];
          }
          [v14 addObject:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }

    v15 = [v6 allValues];

    id v3 = v17;
  }

  return v15;
}

+ (BICDescribedImage)describedImageWithIdentifier:(id)a3 size:(CGSize)a4 processingOptions:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  CGSize v13 = a4;
  id v6 = a3;
  id v12 = 0;
  int v7 = ClampImageSize((uint64_t)&v13, 1, &v12);
  id v8 = v12;
  if (v7)
  {
    id v9 = BCImageCacheLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1F04FC((uint64_t)v6, (uint64_t)v8, v9);
    }
  }
  uint64_t v10 = [[BICDescribedImage alloc] initWithIdentifier:v6];
  -[BICDescribedImage setImageSize:](v10, "setImageSize:", v13.width, v13.height);
  [(BICDescribedImage *)v10 setProcessingOptions:v5];

  return v10;
}

+ (id)describedImagesToDictionaryOfSets:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 identifier:v14];
        id v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = +[NSMutableArray array];
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)describedImageFromImageEntry:(id)a3
{
  id v3 = a3;
  v4 = [BICDescribedImage alloc];
  id v5 = [v3 imageSet];
  id v6 = [v5 identifier];
  id v7 = [(BICDescribedImage *)v4 initWithIdentifier:v6];

  [v3 imageSize];
  -[BICDescribedImage setImageSize:](v7, "setImageSize:");
  -[BICDescribedImage setProcessingOptions:](v7, "setProcessingOptions:", [v3 processingOptions]);
  -[BICDescribedImage setQuality:](v7, "setQuality:", [v3 quality]);
  uint64_t v8 = [v3 lastUsed];
  [(BICDescribedImage *)v7 setLastUsed:v8];

  id v9 = [v3 expiry];
  [(BICDescribedImage *)v7 setExpiry:v9];

  double v10 = (double)[v3 shadowLeft];
  double v11 = (double)[v3 shadowTop];
  double v12 = (double)[v3 shadowWidth];
  LODWORD(v9) = [v3 shadowHeight];

  -[BICDescribedImage setNonShadowArea:](v7, "setNonShadowArea:", v10, v11, v12, (double)v9);

  return v7;
}

+ (id)describedImageFromEntryLocation:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"|"];
  v4 = [BICDescribedImage alloc];
  id v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [(BICDescribedImage *)v4 initWithIdentifier:v5];

  id v7 = [v3 objectAtIndexedSubscript:2];
  double v8 = (double)(uint64_t)[v7 integerValue];
  id v9 = [v3 objectAtIndexedSubscript:3];
  -[BICDescribedImage setImageSize:](v6, "setImageSize:", v8, (double)(uint64_t)[v9 integerValue]);

  double v10 = [v3 objectAtIndexedSubscript:4];
  -[BICDescribedImage setProcessingOptions:](v6, "setProcessingOptions:", (unsigned __int16)[v10 integerValue]);

  if ((unint64_t)[v3 count] >= 6)
  {
    double v11 = [v3 objectAtIndexedSubscript:5];
    -[BICDescribedImage setQuality:](v6, "setQuality:", (unsigned __int16)[v11 integerValue]);
  }

  return v6;
}

+ (BICDescribedImage)describedImageWithPriority:(unint64_t)a3
{
  v4 = [[BICDescribedImage alloc] initWithIdentifier:@"Prioritizer"];
  [(BICDescribedImage *)v4 setPriority:a3];

  return v4;
}

+ (id)stringForImageQuality:(unsigned __int16)a3
{
  if (!v4 & v3)
  {
    switch(a3)
    {
      case 0xC8u:
        id result = @"not transformed";
        break;
      case 0xC9u:
        id result = @"download";
        break;
      case 0xCAu:
        id result = @"cloud";
        break;
      case 0xCBu:
        id result = @"profile";
        break;
      case 0xCCu:
        id result = @"book sample";
        break;
      case 0xCDu:
        id result = @"book sample stashed";
        break;
      case 0xCEu:
        id result = @"book";
        break;
      case 0xCFu:
        id result = @"user";
        break;
      case 0xD0u:
        id result = @"max";
        break;
      default:
        switch(a3)
        {
          case 0u:
            id result = @"unknown";
            break;
          case 1u:
            id result = @"blank";
            break;
          case 2u:
            id result = @"generic";
            break;
          case 3u:
            id result = @"old";
            break;
          default:
            id result = 0;
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        id result = @"transformed";
        break;
      case 'e':
        id result = @"transformed smaller";
        break;
      case 'f':
        id result = @"transformed downloading";
        break;
      case 'g':
        id result = @"transformed cloud";
        break;
      case 'h':
        id result = @"transformed profile";
        break;
      case 'i':
        id result = @"transformed book";
        break;
      case 'j':
        id result = @"transformed book sample";
        break;
      case 'k':
        id result = @"transformed book sample stashed";
        break;
      case 'l':
        id result = @"transformed user";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

+ (unsigned)transformedQualityFrom:(unsigned __int16)a3
{
  unsigned __int16 result = a3;
  if ((a3 - 100) >= 9)
  {
    switch(a3)
    {
      case 0xC8u:
      case 0xD0u:
        return result;
      case 0xC9u:
        unsigned __int16 result = 102;
        break;
      case 0xCAu:
        unsigned __int16 result = 103;
        break;
      case 0xCBu:
        unsigned __int16 result = 104;
        break;
      case 0xCCu:
        unsigned __int16 result = 106;
        break;
      case 0xCDu:
        unsigned __int16 result = 107;
        break;
      case 0xCEu:
        unsigned __int16 result = 105;
        break;
      case 0xCFu:
        unsigned __int16 result = 108;
        break;
      default:
        if (a3 >= 4u) {
          unsigned __int16 result = 0;
        }
        break;
    }
  }
  return result;
}

- (BICDescribedImage)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BICDescribedImage;
  id v5 = [(BICDescribedImage *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    ++qword_349470;
    -[BICDescribedImage setGeneration:](v5, "setGeneration:");
    id v7 = +[NSMutableString string];
    [(BICDescribedImage *)v6 setOperationsLog:v7];
  }
  [(BICDescribedImage *)v6 setIdentifier:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BICDescribedImage alloc];
  id v5 = [(BICDescribedImage *)self identifier];
  id v6 = [(BICDescribedImage *)v4 initWithIdentifier:v5];

  [(BICDescribedImage *)v6 setPriority:[(BICDescribedImage *)self priority]];
  id v7 = [(BICDescribedImage *)self filePath];
  [(BICDescribedImage *)v6 setFilePath:v7];

  double v8 = [(BICDescribedImage *)self urlString];
  [(BICDescribedImage *)v6 setUrlString:v8];

  objc_super v9 = [(BICDescribedImage *)self adamID];
  [(BICDescribedImage *)v6 setAdamID:v9];

  double v10 = [(BICDescribedImage *)self image];
  [(BICDescribedImage *)v6 setImage:v10];

  [(BICDescribedImage *)v6 setProcessingOptions:[(BICDescribedImage *)self processingOptions]];
  [(BICDescribedImage *)v6 setRequestOptions:[(BICDescribedImage *)self requestOptions]];
  [(BICDescribedImage *)v6 setQuality:[(BICDescribedImage *)self quality]];
  [(BICDescribedImage *)self imageSize];
  -[BICDescribedImage setImageSize:](v6, "setImageSize:");
  [(BICDescribedImage *)v6 setMatchScore:[(BICDescribedImage *)self matchScore]];
  double v11 = [(BICDescribedImage *)self title];
  [(BICDescribedImage *)v6 setTitle:v11];

  double v12 = [(BICDescribedImage *)self author];
  [(BICDescribedImage *)v6 setAuthor:v12];

  [(BICDescribedImage *)self nonShadowArea];
  -[BICDescribedImage setNonShadowArea:](v6, "setNonShadowArea:");
  [(BICDescribedImage *)v6 setStackOutline:[(BICDescribedImage *)self stackOutline]];
  CGSize v13 = [(BICDescribedImage *)self lastUsed];
  [(BICDescribedImage *)v6 setLastUsed:v13];

  long long v14 = [(BICDescribedImage *)self expiry];
  [(BICDescribedImage *)v6 setExpiry:v14];

  [(BICDescribedImage *)v6 setUnknownAspectRatio:[(BICDescribedImage *)self unknownAspectRatio]];
  long long v15 = +[NSMutableString string];
  [(BICDescribedImage *)v6 setOperationsLog:v15];

  return v6;
}

- (void)dealloc
{
  [(BICDescribedImage *)self setStackOutline:0];
  v3.receiver = self;
  v3.super_class = (Class)BICDescribedImage;
  [(BICDescribedImage *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BICDescribedImage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BICDescribedImage *)self isEqualToDescribedImage:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDescribedImage:(id)a3
{
  id v4 = a3;
  [(BICDescribedImage *)self imageSize];
  double v6 = v5;
  double v8 = v7;
  [v4 imageSize];
  BOOL v11 = v6 == v10 && v8 == v9;
  if (v11
    && (unsigned int v12 = [v4 processingOptions],
        v12 == [(BICDescribedImage *)self processingOptions])
    && (unsigned int v13 = [v4 quality], v13 == -[BICDescribedImage quality](self, "quality")))
  {
    long long v14 = [v4 identifier];
    long long v15 = [(BICDescribedImage *)self identifier];
    unsigned __int8 v16 = [v14 isEqualToString:v15];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (void)setStackOutline:(CGPath *)a3
{
  stackOutline = self->_stackOutline;
  if (stackOutline)
  {
    CFRelease(stackOutline);
    self->_stackOutline = 0;
  }
  if (a3) {
    self->_stackOutline = CGPathCreateCopy(a3);
  }
}

- (void)setAlternateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_alternateRequest, a3);
  id v5 = a3;
  [v5 setPrimaryRequest:self];
}

+ (id)identifierFromEntryLocation:(id)a3
{
  objc_super v3 = [a3 componentsSeparatedByString:@"|"];
  id v4 = [v3 firstObject];

  return v4;
}

+ (id)entryLocationWithIdentifier:(id)a3 level:(signed __int16)a4 size:(CGSize)a5 options:(unsigned __int16)a6 quality:(unsigned __int16)a7
{
  if (CGSizeZero.width == a5.width && CGSizeZero.height == a5.height) {
    +[NSString stringWithFormat:@"%@|%d|%d|%d|%hd|%d", a4, a6, a7, a3, a4, (int)a5.width, (int)a5.height, a6, a7];
  }
  else {
  double v8 = +[NSString stringWithFormat:@"%@|%d|%d|%d|%hd", a4, a6, a7, a3, a4, (int)a5.width, (int)a5.height, a6, v10];
  }

  return v8;
}

- (id)entryLocationForLevelID:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(BICDescribedImage *)self identifier];
  [(BICDescribedImage *)self imageSize];
  double v8 = +[BICDescribedImage entryLocationWithIdentifier:level:size:options:quality:](BICDescribedImage, "entryLocationWithIdentifier:level:size:options:quality:", v5, v3, [(BICDescribedImage *)self processingOptions], [(BICDescribedImage *)self quality], v6, v7);

  return v8;
}

- (NSString)description
{
  return (NSString *)[(BICDescribedImage *)self _computeDescriptionIsFull:1];
}

- (id)shortDescription
{
  return [(BICDescribedImage *)self _computeDescriptionIsFull:0];
}

- (id)_computeDescriptionIsFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_new();
  [v5 addObject:@"<image:"];
  double v6 = [(BICDescribedImage *)self identifier];
  [v5 addObject:v6];

  [(BICDescribedImage *)self imageSize];
  if (v8 != CGSizeZero.width || v7 != CGSizeZero.height)
  {
    [(BICDescribedImage *)self imageSize];
    uint64_t v11 = (int)v10;
    [(BICDescribedImage *)self imageSize];
    unsigned int v13 = +[NSString stringWithFormat:@",xy:%d,%d", v11, (int)v12];
    [v5 addObject:v13];
  }
  if ([(BICDescribedImage *)self processingOptions])
  {
    long long v14 = [(BICDescribedImage *)self shortDescriptionOfProcessingOptions];
    long long v15 = +[NSString stringWithFormat:@",o:%@", v14];
    [v5 addObject:v15];
  }
  if ([(BICDescribedImage *)self quality])
  {
    unsigned __int8 v16 = [objc_opt_class() stringForImageQuality:[self quality]];
    long long v17 = +[NSString stringWithFormat:@",q:%@", v16];
    [v5 addObject:v17];
  }
  if (v3)
  {
    long long v18 = [(BICDescribedImage *)self urlString];

    if (v18)
    {
      CFStringRef v19 = @",url";
    }
    else
    {
      long long v20 = [(BICDescribedImage *)self adamID];

      if (v20)
      {
        long long v21 = [(BICDescribedImage *)self adamID];
        id v22 = +[NSString stringWithFormat:@",adamID:%@", v21];
        [v5 addObject:v22];

        goto LABEL_16;
      }
      v30 = [(BICDescribedImage *)self image];

      if (!v30) {
        goto LABEL_16;
      }
      CFStringRef v19 = @",cgImage";
    }
    [v5 addObject:v19];
LABEL_16:
    if ([(BICDescribedImage *)self matchScore])
    {
      v23 = +[NSString stringWithFormat:@",rank:%lu", [(BICDescribedImage *)self matchScore]];
      [v5 addObject:v23];
    }
    v24 = [(BICDescribedImage *)self operationsLog];
    id v25 = [v24 length];

    if (v25)
    {
      v26 = [(BICDescribedImage *)self operationsLog];
      v27 = +[NSString stringWithFormat:@",ops:%@", v26];
      [v5 addObject:v27];
    }
  }
  [v5 addObject:@">"];
  v28 = [v5 componentsJoinedByString:&stru_2CE418];

  return v28;
}

- (id)shortDescriptionOfProcessingOptions
{
  BOOL v3 = +[NSMutableString string];
  if (![(BICDescribedImage *)self processingOptions])
  {
    CFStringRef v5 = @"none";
LABEL_26:
    [v3 appendString:v5];
    goto LABEL_27;
  }
  if (([(BICDescribedImage *)self processingOptions] & 2) != 0)
  {
    CFStringRef v4 = @"book";
  }
  else if (([(BICDescribedImage *)self processingOptions] & 4) != 0)
  {
    CFStringRef v4 = @"PDF";
  }
  else if (([(BICDescribedImage *)self processingOptions] & 8) != 0)
  {
    CFStringRef v4 = @"audio";
  }
  else if (([(BICDescribedImage *)self processingOptions] & 0x10) != 0)
  {
    CFStringRef v4 = @"shadow";
  }
  else
  {
    if (([(BICDescribedImage *)self processingOptions] & 0x20) == 0) {
      goto LABEL_14;
    }
    CFStringRef v4 = @"stack";
  }
  [v3 appendString:v4];
LABEL_14:
  if (([(BICDescribedImage *)self processingOptions] & 0x40) != 0) {
    [v3 appendString:@"-night"];
  }
  if (([(BICDescribedImage *)self processingOptions] & 0x80) != 0) {
    [v3 appendString:@"-rtl"];
  }
  if (([(BICDescribedImage *)self processingOptions] & 0x100) != 0) {
    [v3 appendString:@"-binding"];
  }
  if (([(BICDescribedImage *)self processingOptions] & 0x200) != 0) {
    [v3 appendString:@"-generic"];
  }
  if (([(BICDescribedImage *)self processingOptions] & 0x400) != 0) {
    [v3 appendString:@"-restricted"];
  }
  if (([(BICDescribedImage *)self processingOptions] & 0x10) != 0)
  {
    CFStringRef v5 = @"-shadow";
    goto LABEL_26;
  }
LABEL_27:

  return v3;
}

- (BOOL)seriesStack
{
  return ([(BICDescribedImage *)self processingOptions] >> 5) & 1;
}

- (BOOL)isExpired
{
  BOOL v3 = [(BICDescribedImage *)self expiry];
  if (v3)
  {
    CFStringRef v4 = [(BICDescribedImage *)self expiry];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isGeneric
{
  return ([(BICDescribedImage *)self processingOptions] & 0x200) != 0
      || [(BICDescribedImage *)self quality] == 2;
}

- (BOOL)isAlternateGeneric
{
  BOOL v3 = [(BICDescribedImage *)self alternateRequest];
  if (v3)
  {
    CFStringRef v4 = [(BICDescribedImage *)self alternateRequest];
    unsigned __int8 v5 = [v4 isGeneric];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isGenericSeriesStack
{
  BOOL v3 = [(BICDescribedImage *)self seriesStack];
  if (v3) {
    LOBYTE(v3) = ([(BICDescribedImage *)self processingOptions] & 0x200) != 0
  }
              && [(BICDescribedImage *)self quality] == 2;
  return v3;
}

- (BOOL)isSeriesStackWithGenerics
{
  BOOL v3 = [(BICDescribedImage *)self seriesStack];
  if (v3) {
    LOBYTE(v3) = ([(BICDescribedImage *)self processingOptions] & 0x200) == 0
  }
              && [(BICDescribedImage *)self quality] == 2;
  return v3;
}

- (BOOL)isLowQuality
{
  return [(BICDescribedImage *)self quality] == 3 || [(BICDescribedImage *)self quality] == 101;
}

- (BOOL)isOldVersion
{
  return [(BICDescribedImage *)self quality] == 3;
}

- (int64_t)costFor:(signed __int16)a3
{
  if (a3) {
    return 0;
  }
  CFStringRef v4 = [(BICDescribedImage *)self image];
  unsigned __int8 v5 = (CGImage *)[v4 CGImage];

  if (!v5) {
    return 0;
  }
  size_t BytesPerRow = CGImageGetBytesPerRow(v5);
  CGImageGetWidth(v5);
  return (uint64_t)((double)BytesPerRow * (double)CGImageGetHeight(v5));
}

- (BOOL)requiresNetwork
{
  [(BICDescribedImage *)self imageSize];
  BOOL v6 = CGSizeZero.width == v4 && CGSizeZero.height == v3 && [(BICDescribedImage *)self quality] == 203;
  if ([(BICDescribedImage *)self quality] == 203)
  {
    double v7 = [(BICDescribedImage *)self urlString];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v9 = [(BICDescribedImage *)self location] == 4 || v8;
  return v6 || v9;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)generation
{
  return self->generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->generation = a3;
}

- (unint64_t)matchScore
{
  return self->matchScore;
}

- (void)setMatchScore:(unint64_t)a3
{
  self->matchScore = a3;
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSString)filePath
{
  return self->filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)urlString
{
  return self->urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)adamID
{
  return self->adamID;
}

- (void)setAdamID:(id)a3
{
}

- (BICImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (unsigned)requestOptions
{
  return self->requestOptions;
}

- (void)setRequestOptions:(unsigned __int16)a3
{
  self->requestOptions = a3;
}

- (CGSize)imageSize
{
  double width = self->imageSize.width;
  double height = self->imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->imageSize = a3;
}

- (signed)persistanceOptions
{
  return self->persistanceOptions;
}

- (void)setPersistanceOptions:(signed __int16)a3
{
  self->persistanceOptions = a3;
}

- (unint64_t)priority
{
  return self->priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->priority = a3;
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (CGRect)nonShadowArea
{
  double x = self->nonShadowArea.origin.x;
  double y = self->nonShadowArea.origin.y;
  double width = self->nonShadowArea.size.width;
  double height = self->nonShadowArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNonShadowArea:(CGRect)a3
{
  self->nonShadowArea = a3;
}

- (BOOL)unknownAspectRatio
{
  return self->unknownAspectRatio;
}

- (void)setUnknownAspectRatio:(BOOL)a3
{
  self->unknownAspectRatio = a3;
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
}

- (NSMutableString)operationsLog
{
  return self->operationsLog;
}

- (void)setOperationsLog:(id)a3
{
}

- (CGPath)stackOutline
{
  return self->_stackOutline;
}

- (unsigned)location
{
  return self->location;
}

- (void)setLocation:(unsigned __int16)a3
{
  self->location = a3;
}

- (BICDescribedImage)alternateRequest
{
  return self->_alternateRequest;
}

- (BICDescribedImage)primaryRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->primaryRequest);

  return (BICDescribedImage *)WeakRetained;
}

- (void)setPrimaryRequest:(id)a3
{
}

- (BICDescribedImage)stackRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stackRequest);

  return (BICDescribedImage *)WeakRetained;
}

- (void)setStackRequest:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_destroyWeak((id *)&self->stackRequest);
  objc_destroyWeak((id *)&self->primaryRequest);
  objc_storeStrong((id *)&self->_alternateRequest, 0);
  objc_storeStrong((id *)&self->operationsLog, 0);
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->adamID, 0);
  objc_storeStrong((id *)&self->urlString, 0);
  objc_storeStrong((id *)&self->filePath, 0);
  objc_storeStrong((id *)&self->lastUsed, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end