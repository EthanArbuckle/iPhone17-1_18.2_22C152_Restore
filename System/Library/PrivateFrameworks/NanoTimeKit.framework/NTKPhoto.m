@interface NTKPhoto
+ (id)decodeFromDictionary:(id)a3 forResourceDirectory:(id)a4;
- (BOOL)isEqualToAsset:(id)a3;
- (BOOL)isEqualToPhoto:(id)a3;
- (BOOL)isIris;
- (BOOL)isMissingAnalysis;
- (CGRect)crop;
- (CGRect)originalCrop;
- (NSDate)modificationDate;
- (NSString)localIdentifier;
- (NSString)uuidFromLocalIdentifierAndModificationDate;
- (NSURL)imageURL;
- (NSURL)irisVideoURL;
- (NTKPhoto)initWithLegacySidecar:(id)a3;
- (double)irisDuration;
- (double)irisStillDisplayTime;
- (id)analysisForAlignment:(unint64_t)a3 deviceSizeClass:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsDictionary;
- (void)setAnalysis:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5;
- (void)setCrop:(CGRect)a3;
- (void)setImageURL:(id)a3;
- (void)setIrisDuration:(double)a3;
- (void)setIrisStillDisplayTime:(double)a3;
- (void)setIrisVideoURL:(id)a3;
- (void)setIsIris:(BOOL)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalCrop:(CGRect)a3;
@end

@implementation NTKPhoto

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSString *)self->_localIdentifier copyWithZone:a3];
  [v5 setLocalIdentifier:v6];

  v7 = (void *)[(NSDate *)self->_modificationDate copyWithZone:a3];
  [v5 setModificationDate:v7];

  objc_msgSend(v5, "setOriginalCrop:", self->_originalCrop.origin.x, self->_originalCrop.origin.y, self->_originalCrop.size.width, self->_originalCrop.size.height);
  v8 = (void *)[(NSURL *)self->_imageURL copyWithZone:a3];
  [v5 setImageURL:v8];

  objc_msgSend(v5, "setCrop:", self->_crop.origin.x, self->_crop.origin.y, self->_crop.size.width, self->_crop.size.height);
  for (uint64_t i = 8; i != 88; i += 8)
  {
    uint64_t v10 = [*(id *)((char *)&self->super.isa + i) copyWithZone:a3];
    v11 = *(void **)&v5[i];
    *(void *)&v5[i] = v10;
  }
  [v5 setIsIris:self->_isIris];
  v12 = (void *)[(NSURL *)self->_irisVideoURL copyWithZone:a3];
  [v5 setIrisVideoURL:v12];

  [v5 setIrisDuration:self->_irisDuration];
  [v5 setIrisStillDisplayTime:self->_irisStillDisplayTime];
  return v5;
}

+ (id)decodeFromDictionary:(id)a3 forResourceDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"localIdentifier"];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [v5 objectForKeyedSubscript:@"imageURL"];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = [v5 objectForKeyedSubscript:@"isIris"];

      if (v11)
      {
        v12 = objc_opt_new();
        v13 = [v5 objectForKeyedSubscript:@"localIdentifier"];
        [v12 setLocalIdentifier:v13];

        v14 = [v5 objectForKeyedSubscript:@"modificationDate"];
        [v12 setModificationDate:v14];

        v15 = [v5 objectForKeyedSubscript:@"originalCropX"];
        [v15 doubleValue];
        double v17 = v16;

        v18 = [v5 objectForKeyedSubscript:@"originalCropY"];
        [v18 doubleValue];
        double v20 = v19;

        v21 = [v5 objectForKeyedSubscript:@"originalCropW"];
        [v21 doubleValue];
        double v23 = v22;

        v24 = [v5 objectForKeyedSubscript:@"originalCropH"];
        [v24 doubleValue];
        double v26 = v25;

        objc_msgSend(v12, "setOriginalCrop:", v17, v20, v23, v26);
        v27 = [v5 objectForKeyedSubscript:@"imageURL"];
        v28 = [v6 stringByAppendingPathComponent:v27];

        v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v28 isDirectory:0];
        [v12 setImageURL:v29];

        v30 = [v5 objectForKeyedSubscript:@"cropX"];
        [v30 doubleValue];
        double v32 = v31;

        v33 = [v5 objectForKeyedSubscript:@"cropY"];
        [v33 doubleValue];
        double v35 = v34;

        v36 = [v5 objectForKeyedSubscript:@"cropW"];
        [v36 doubleValue];
        double v38 = v37;

        v39 = [v5 objectForKeyedSubscript:@"cropH"];
        [v39 doubleValue];
        double v41 = v40;

        objc_msgSend(v12, "setCrop:", v32, v35, v38, v41);
        v42 = [v5 objectForKeyedSubscript:@"topAnalysis"];

        if (v42)
        {
          v43 = [NTKPhotoAnalysis alloc];
          v44 = [v5 objectForKeyedSubscript:@"topAnalysis"];
          uint64_t v45 = [(NTKPhotoAnalysis *)v43 initFromDictionary:v44];
          v46 = (void *)v12[1];
          v12[1] = v45;
        }
        v47 = [v5 objectForKeyedSubscript:@"bottomAnalysis"];

        if (v47)
        {
          v48 = [NTKPhotoAnalysis alloc];
          v49 = [v5 objectForKeyedSubscript:@"bottomAnalysis"];
          uint64_t v50 = [(NTKPhotoAnalysis *)v48 initFromDictionary:v49];
          v51 = (void *)v12[2];
          v12[2] = v50;
        }
        v52 = [v5 objectForKeyedSubscript:@"leftAnalysis"];

        if (v52)
        {
          v53 = [NTKPhotoAnalysis alloc];
          v54 = [v5 objectForKeyedSubscript:@"leftAnalysis"];
          uint64_t v55 = [(NTKPhotoAnalysis *)v53 initFromDictionary:v54];
          v56 = (void *)v12[3];
          v12[3] = v55;
        }
        v57 = [v5 objectForKeyedSubscript:@"rightAnalysis"];

        if (v57)
        {
          v58 = [NTKPhotoAnalysis alloc];
          v59 = [v5 objectForKeyedSubscript:@"rightAnalysis"];
          uint64_t v60 = [(NTKPhotoAnalysis *)v58 initFromDictionary:v59];
          v61 = (void *)v12[4];
          v12[4] = v60;
        }
        v62 = [v5 objectForKeyedSubscript:@"fastAnalysis"];

        if (v62)
        {
          v63 = [NTKPhotoAnalysis alloc];
          v64 = [v5 objectForKeyedSubscript:@"fastAnalysis"];
          uint64_t v65 = [(NTKPhotoAnalysis *)v63 initFromDictionary:v64];
          v66 = (void *)v12[5];
          v12[5] = v65;
        }
        v67 = [v5 objectForKeyedSubscript:@"slowAnalysis"];

        if (v67)
        {
          v68 = [NTKPhotoAnalysis alloc];
          v69 = [v5 objectForKeyedSubscript:@"slowAnalysis"];
          uint64_t v70 = [(NTKPhotoAnalysis *)v68 initFromDictionary:v69];
          v71 = (void *)v12[6];
          v12[6] = v70;
        }
        v72 = [v5 objectForKeyedSubscript:@"insideAnalysis"];

        if (v72)
        {
          v73 = [NTKPhotoAnalysis alloc];
          v74 = [v5 objectForKeyedSubscript:@"insideAnalysis"];
          uint64_t v75 = [(NTKPhotoAnalysis *)v73 initFromDictionary:v74];
          v76 = (void *)v12[7];
          v12[7] = v75;
        }
        v77 = [v5 objectForKeyedSubscript:@"outsideAnalysis"];

        if (v77)
        {
          v78 = [NTKPhotoAnalysis alloc];
          v79 = [v5 objectForKeyedSubscript:@"outsideAnalysis"];
          uint64_t v80 = [(NTKPhotoAnalysis *)v78 initFromDictionary:v79];
          v81 = (void *)v12[8];
          v12[8] = v80;
        }
        v82 = [v5 objectForKeyedSubscript:@"upAnalysis"];

        if (v82)
        {
          v83 = [NTKPhotoAnalysis alloc];
          v84 = [v5 objectForKeyedSubscript:@"upAnalysis"];
          uint64_t v85 = [(NTKPhotoAnalysis *)v83 initFromDictionary:v84];
          v86 = (void *)v12[9];
          v12[9] = v85;
        }
        v87 = [v5 objectForKeyedSubscript:@"downAnalysis"];

        if (v87)
        {
          v88 = [NTKPhotoAnalysis alloc];
          v89 = [v5 objectForKeyedSubscript:@"downAnalysis"];
          uint64_t v90 = [(NTKPhotoAnalysis *)v88 initFromDictionary:v89];
          v91 = (void *)v12[10];
          v12[10] = v90;
        }
        v92 = [v5 objectForKeyedSubscript:@"isIris"];
        objc_msgSend(v12, "setIsIris:", objc_msgSend(v92, "BOOLValue"));

        if ([v12 isIris])
        {
          v93 = [v5 objectForKeyedSubscript:@"irisVideoURL"];
          v94 = [v6 stringByAppendingPathComponent:v93];

          v95 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v94 isDirectory:0];
          [v12 setIrisVideoURL:v95];

          v96 = [v5 objectForKeyedSubscript:@"irisDuration"];
          [v96 doubleValue];
          objc_msgSend(v12, "setIrisDuration:");

          v97 = [v5 objectForKeyedSubscript:@"irisStillDisplayTime"];
          [v97 doubleValue];
          objc_msgSend(v12, "setIrisStillDisplayTime:");
        }
        else
        {
          [v12 setIrisVideoURL:0];
          [v12 setIrisDuration:0.0];
          [v12 setIrisStillDisplayTime:0.0];
        }

        goto LABEL_32;
      }
    }
    else
    {
    }
  }
  v98 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
    +[NTKPhoto decodeFromDictionary:forResourceDirectory:]();
  }

  v12 = 0;
LABEL_32:

  return v12;
}

- (id)encodeAsDictionary
{
  v3 = objc_opt_new();
  [v3 setObject:self->_localIdentifier forKeyedSubscript:@"localIdentifier"];
  [v3 setObject:self->_modificationDate forKeyedSubscript:@"modificationDate"];
  v4 = [NSNumber numberWithDouble:self->_originalCrop.origin.x];
  [v3 setObject:v4 forKeyedSubscript:@"originalCropX"];

  id v5 = [NSNumber numberWithDouble:self->_originalCrop.origin.y];
  [v3 setObject:v5 forKeyedSubscript:@"originalCropY"];

  id v6 = [NSNumber numberWithDouble:self->_originalCrop.size.width];
  [v3 setObject:v6 forKeyedSubscript:@"originalCropW"];

  uint64_t v7 = [NSNumber numberWithDouble:self->_originalCrop.size.height];
  [v3 setObject:v7 forKeyedSubscript:@"originalCropH"];

  v8 = objc_msgSend([NSString alloc], "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_imageURL, "fileSystemRepresentation"));
  uint64_t v9 = [v8 lastPathComponent];
  [v3 setObject:v9 forKeyedSubscript:@"imageURL"];

  uint64_t v10 = [NSNumber numberWithDouble:self->_crop.origin.x];
  [v3 setObject:v10 forKeyedSubscript:@"cropX"];

  v11 = [NSNumber numberWithDouble:self->_crop.origin.y];
  [v3 setObject:v11 forKeyedSubscript:@"cropY"];

  v12 = [NSNumber numberWithDouble:self->_crop.size.width];
  [v3 setObject:v12 forKeyedSubscript:@"cropW"];

  v13 = [NSNumber numberWithDouble:self->_crop.size.height];
  [v3 setObject:v13 forKeyedSubscript:@"cropH"];

  v14 = self->_analyses[0];
  if (v14)
  {
    v15 = [(NTKPhotoAnalysis *)v14 encodeAsDictionary];
    [v3 setObject:v15 forKeyedSubscript:@"topAnalysis"];
  }
  double v16 = self->_analyses[1];
  if (v16)
  {
    double v17 = [(NTKPhotoAnalysis *)v16 encodeAsDictionary];
    [v3 setObject:v17 forKeyedSubscript:@"bottomAnalysis"];
  }
  v18 = self->_analyses[2];
  if (v18)
  {
    double v19 = [(NTKPhotoAnalysis *)v18 encodeAsDictionary];
    [v3 setObject:v19 forKeyedSubscript:@"leftAnalysis"];
  }
  double v20 = self->_analyses[3];
  if (v20)
  {
    v21 = [(NTKPhotoAnalysis *)v20 encodeAsDictionary];
    [v3 setObject:v21 forKeyedSubscript:@"rightAnalysis"];
  }
  double v22 = self->_analyses[4];
  if (v22)
  {
    double v23 = [(NTKPhotoAnalysis *)v22 encodeAsDictionary];
    [v3 setObject:v23 forKeyedSubscript:@"fastAnalysis"];
  }
  v24 = self->_analyses[5];
  if (v24)
  {
    double v25 = [(NTKPhotoAnalysis *)v24 encodeAsDictionary];
    [v3 setObject:v25 forKeyedSubscript:@"slowAnalysis"];
  }
  double v26 = self->_analyses[6];
  if (v26)
  {
    v27 = [(NTKPhotoAnalysis *)v26 encodeAsDictionary];
    [v3 setObject:v27 forKeyedSubscript:@"insideAnalysis"];
  }
  v28 = self->_analyses[7];
  if (v28)
  {
    v29 = [(NTKPhotoAnalysis *)v28 encodeAsDictionary];
    [v3 setObject:v29 forKeyedSubscript:@"outsideAnalysis"];
  }
  v30 = self->_analyses[8];
  if (v30)
  {
    double v31 = [(NTKPhotoAnalysis *)v30 encodeAsDictionary];
    [v3 setObject:v31 forKeyedSubscript:@"upAnalysis"];
  }
  double v32 = self->_analyses[9];
  if (v32)
  {
    v33 = [(NTKPhotoAnalysis *)v32 encodeAsDictionary];
    [v3 setObject:v33 forKeyedSubscript:@"downAnalysis"];
  }
  double v34 = [NSNumber numberWithBool:self->_isIris];
  [v3 setObject:v34 forKeyedSubscript:@"isIris"];

  if (self->_isIris)
  {
    double v35 = objc_msgSend([NSString alloc], "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_irisVideoURL, "fileSystemRepresentation"));
    v36 = [v35 lastPathComponent];
    [v3 setObject:v36 forKeyedSubscript:@"irisVideoURL"];

    double v37 = [NSNumber numberWithDouble:self->_irisDuration];
    [v3 setObject:v37 forKeyedSubscript:@"irisDuration"];

    double v38 = [NSNumber numberWithDouble:self->_irisStillDisplayTime];
    [v3 setObject:v38 forKeyedSubscript:@"irisStillDisplayTime"];
  }
  else
  {
    [v3 setObject:&stru_1F1635E90 forKeyedSubscript:@"irisVideoURL"];
    [v3 setObject:&unk_1F16E08E8 forKeyedSubscript:@"irisDuration"];
    [v3 setObject:&unk_1F16E08E8 forKeyedSubscript:@"irisStillDisplayTime"];
  }

  return v3;
}

- (BOOL)isEqualToPhoto:(id)a3
{
  v4 = (NTKPhoto *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else if (v4)
  {
    id v6 = [(NTKPhoto *)self localIdentifier];
    uint64_t v7 = [(NTKPhoto *)v5 localIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(NTKPhoto *)self modificationDate];
      uint64_t v9 = [(NTKPhoto *)v5 modificationDate];
      if ([v8 isEqualToDate:v9])
      {
        [(NTKPhoto *)self crop];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [(NTKPhoto *)v5 crop];
        v25.origin.x = v18;
        v25.origin.y = v19;
        v25.size.width = v20;
        v25.size.height = v21;
        v24.origin.x = v11;
        v24.origin.y = v13;
        v24.size.width = v15;
        v24.size.height = v17;
        BOOL v22 = CGRectEqualToRect(v24, v25);
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKPhoto *)self localIdentifier];
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [v4 localIdentifier];
  v8 = [(NTKPhoto *)self localIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = [(NTKPhoto *)self modificationDate];
  if (!v10) {
    goto LABEL_8;
  }
  CGFloat v11 = (void *)v10;
  uint64_t v12 = [v4 modificationDate];
  if (!v12)
  {

    goto LABEL_8;
  }
  CGFloat v13 = (void *)v12;
  double v14 = [v4 modificationDate];
  CGFloat v15 = [(NTKPhoto *)self modificationDate];
  [v14 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v17 > 1.0)
  {
LABEL_8:
    LOBYTE(v19) = 0;
    goto LABEL_9;
  }
  BOOL v18 = [(NTKPhoto *)self isIris];
  int v19 = v18 ^ [v4 isPhotoIris] ^ 1;
LABEL_9:

  return v19;
}

- (NSString)uuidFromLocalIdentifierAndModificationDate
{
  v3 = (void *)MEMORY[0x1E4F391D0];
  id v4 = [(NTKPhoto *)self localIdentifier];
  uint64_t v5 = [v3 uuidFromLocalIdentifier:v4];
  id v6 = [(NTKPhoto *)self modificationDate];
  [v6 timeIntervalSince1970];
  v8 = objc_msgSend(v5, "stringByAppendingFormat:", @"~%ld", (uint64_t)v7);

  return (NSString *)v8;
}

- (BOOL)isMissingAnalysis
{
  if (!self->_analyses[0]) {
    return 1;
  }
  unint64_t v2 = 0;
  do
  {
    unint64_t v3 = v2;
    if (v2 == 9) {
      break;
    }
  }
  while (self->_analyses[++v2]);
  return v3 < 9;
}

- (id)analysisForAlignment:(unint64_t)a3 deviceSizeClass:(unint64_t)a4
{
  unint64_t v5 = _NTKPhotoAnalysisIndex(a3);
  if (v5 > 9) {
    id v6 = 0;
  }
  else {
    id v6 = self->_analyses[v5];
  }

  return v6;
}

- (void)setAnalysis:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5
{
  id v9 = a3;
  unint64_t v8 = _NTKPhotoAnalysisIndex(a4);
  if (v8 <= 9) {
    objc_storeStrong((id *)&self->_analyses[v8], a3);
  }
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (CGRect)originalCrop
{
  double x = self->_originalCrop.origin.x;
  double y = self->_originalCrop.origin.y;
  double width = self->_originalCrop.size.width;
  double height = self->_originalCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  self->_crop = a3;
}

- (BOOL)isIris
{
  return self->_isIris;
}

- (void)setIsIris:(BOOL)a3
{
  self->_isIris = a3;
}

- (NSURL)irisVideoURL
{
  return self->_irisVideoURL;
}

- (void)setIrisVideoURL:(id)a3
{
}

- (double)irisDuration
{
  return self->_irisDuration;
}

- (void)setIrisDuration:(double)a3
{
  self->_irisDuration = a3;
}

- (double)irisStillDisplayTime
{
  return self->_irisStillDisplayTime;
}

- (void)setIrisStillDisplayTime:(double)a3
{
  self->_irisStillDisplayTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisVideoURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  uint64_t v3 = 80;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (NTKPhoto)initWithLegacySidecar:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)NTKPhoto;
  unint64_t v5 = [(NTKPhoto *)&v86 init];
  if (v5)
  {
    id v6 = [v4 stringByAppendingPathComponent:@"Info.plist"];
    unint64_t v7 = 0x1E4F1C000uLL;
    unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    id v9 = v8;
    if (!v8)
    {
      v30 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        [(NTKPhoto(Legacy) *)(uint64_t)v5 initWithLegacySidecar:v30];
      }
      goto LABEL_39;
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:@"identifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v10;

    uint64_t v12 = [v9 objectForKeyedSubscript:@"modificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v12;

    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_originalCrop.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_originalCrop.size = v14;
    CGFloat v15 = (void *)MEMORY[0x1E4F1CB10];
    double v16 = [v4 stringByAppendingPathComponent:@"Image.jpg"];
    uint64_t v17 = [v15 fileURLWithPath:v16 isDirectory:0];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v17;

    int v19 = [MEMORY[0x1E4F19A30] currentDevice];
    [v19 screenScale];
    double v21 = v20;

    CFURLRef v22 = v5->_imageURL;
    *(_OWORD *)buf = *MEMORY[0x1E4F1DB30];
    double v23 = CGImageSourceCreateWithURL(v22, 0);
    if (v23)
    {
      CGRect v24 = v23;
      CFDictionaryRef v25 = CGImageSourceCopyPropertiesAtIndex(v23, 0, 0);
      CFRelease(v24);
      if (v25)
      {
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E4F2FD00]);
        CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E4F2FCE8]);
        CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E4F2FCA0]);
        LODWORD(valuePtr.a) = 1;
        if (v28)
        {
          CFNumberGetValue(v28, kCFNumberIntType, &valuePtr);
          if ((LODWORD(valuePtr.a) - 5) >= 4) {
            CFNumberRef v29 = Value;
          }
          else {
            CFNumberRef v29 = v27;
          }
          if ((LODWORD(valuePtr.a) - 5) < 4) {
            CFNumberRef v27 = Value;
          }
          CFNumberRef Value = v29;
        }
        if (Value && v27)
        {
          CFNumberGetValue(Value, kCFNumberCGFloatType, buf);
          unint64_t v7 = 0x1E4F1C000;
          CFNumberGetValue(v27, kCFNumberCGFloatType, &buf[8]);
        }
        CFRelease(v25);
LABEL_23:

        double v33 = *(double *)buf;
        double v32 = *(double *)&buf[8];
        double v34 = [v9 objectForKeyedSubscript:@"contentOffsetX"];
        [v34 floatValue];
        double v36 = v21 * v35;
        double v37 = [v9 objectForKeyedSubscript:@"contentOffsetY"];
        [v37 floatValue];
        double v39 = v21 * v38;
        double v40 = [v9 objectForKeyedSubscript:@"zoomScale"];
        [v40 floatValue];
        double v42 = v41;
        v43 = [MEMORY[0x1E4F19A30] currentDevice];
        [v43 screenBounds];
        double v45 = v44;
        double v47 = v46;

        v48 = [MEMORY[0x1E4F19A30] currentDevice];
        [v48 screenScale];
        CGFloat v50 = v49;

        CGAffineTransformMakeScale(&valuePtr, v50, v50);
        double v51 = v47 * valuePtr.c + valuePtr.a * v45;
        double v52 = v47 * valuePtr.d + valuePtr.b * v45;
        double v53 = v51 / v33;
        if (v51 / v33 < v52 / v32) {
          double v53 = v52 / v32;
        }
        double v85 = v42;
        double v54 = v53 * v42;
        double v55 = v36;
        double v56 = v51 / v54;
        double v57 = v52 / v54;
        double v58 = v33 - v51 / v54;
        if (v36 / v54 < v58) {
          double v58 = v36 / v54;
        }
        double v59 = fmax(v58, 0.0);
        double v60 = v32 - v57;
        if (v39 / v54 < v32 - v57) {
          double v60 = v39 / v54;
        }
        double v61 = fmax(v60, 0.0);
        v62 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134220032;
          *(double *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v32;
          __int16 v89 = 2048;
          double v90 = v55;
          __int16 v91 = 2048;
          double v92 = v39;
          __int16 v93 = 2048;
          double v94 = v85;
          __int16 v95 = 2048;
          double v96 = v59;
          __int16 v97 = 2048;
          double v98 = v61;
          __int16 v99 = 2048;
          double v100 = v56;
          __int16 v101 = 2048;
          double v102 = v57;
          _os_log_impl(&dword_1BC5A9000, v62, OS_LOG_TYPE_DEFAULT, "_findCropOfLegacyImage: { sz: (%.2f, %.2f), off: (%.2f %.2f), scale: %.2f } ==> (%.2f, %.2f, %.2f, %.2f)", buf, 0x5Cu);
        }

        v5->_crop.origin.double x = v59;
        v5->_crop.origin.double y = v61;
        v5->_crop.size.double width = v56;
        v5->_crop.size.double height = v57;

        v30 = [v4 stringByAppendingPathComponent:@"Supplement.plist"];
        v63 = [*(id *)(v7 + 2536) dictionaryWithContentsOfFile:v30];
        if (v63)
        {
          v64 = [NTKPhotoAnalysis alloc];
          uint64_t v65 = [v63 objectForKeyedSubscript:@"analysis-top"];
          uint64_t v66 = [(NTKPhotoAnalysis *)v64 initFromDictionary:v65];
          v67 = v5->_analyses[0];
          v5->_analyses[0] = (NTKPhotoAnalysis *)v66;

          v68 = [NTKPhotoAnalysis alloc];
          v69 = [v63 objectForKeyedSubscript:@"analysis-bottom"];
          uint64_t v70 = [(NTKPhotoAnalysis *)v68 initFromDictionary:v69];
          v71 = v5->_analyses[1];
          v5->_analyses[1] = (NTKPhotoAnalysis *)v70;
        }
        v72 = objc_msgSend(v9, "objectForKeyedSubscript:", @"iris", *(void *)&v85, *(void *)&v39);
        if ([v72 BOOLValue])
        {
          v73 = [v9 objectForKeyedSubscript:@"irisVideoHidden"];
          char v74 = [v73 BOOLValue];

          if ((v74 & 1) == 0)
          {
            v5->_isIris = 1;
            uint64_t v75 = (void *)MEMORY[0x1E4F1CB10];
            v76 = [v4 stringByAppendingPathComponent:@"Iris.mov"];
            uint64_t v77 = [v75 fileURLWithPath:v76 isDirectory:0];
            irisVideoURL = v5->_irisVideoURL;
            v5->_irisVideoURL = (NSURL *)v77;

            v79 = [v9 objectForKeyedSubscript:@"irisDuration"];
            [v79 floatValue];
            v5->_irisDuration = v80;

            v81 = [v9 objectForKeyedSubscript:@"irisStillDisplayTime"];
            [v81 floatValue];
            v5->_irisStillDisplayTime = v82;

LABEL_38:
LABEL_39:

            goto LABEL_40;
          }
        }
        else
        {
        }
        v5->_isIris = 0;
        v83 = v5->_irisVideoURL;
        v5->_irisVideoURL = 0;

        v5->_irisDuration = 0.0;
        v5->_irisStillDisplayTime = 0.0;
        goto LABEL_38;
      }
      double v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[NTKPhoto(Legacy) initWithLegacySidecar:]();
      }
    }
    else
    {
      double v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[NTKPhoto(Legacy) initWithLegacySidecar:]();
      }
    }

    goto LABEL_23;
  }
LABEL_40:

  return v5;
}

+ (void)decodeFromDictionary:forResourceDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "NTKPhoto decodeFromDictionary: bad dictionary: %@", v2, v3, v4, v5, v6);
}

@end