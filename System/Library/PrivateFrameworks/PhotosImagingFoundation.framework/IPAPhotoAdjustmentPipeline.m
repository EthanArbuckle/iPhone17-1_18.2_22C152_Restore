@interface IPAPhotoAdjustmentPipeline
+ (id)current;
+ (id)pipelineForPlatform:(id)a3 version:(unint64_t)a4;
+ (id)pipelineForVersion:(unint64_t)a3;
+ (id)pipelineFromString:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjustmentPipeline:(id)a3;
- (IPAPhotoAdjustmentPipeline)initWithPlatform:(id)a3 version:(unint64_t)a4;
- (NSString)platform;
- (id)string;
- (unint64_t)hash;
- (unint64_t)version;
@end

@implementation IPAPhotoAdjustmentPipeline

- (void).cxx_destruct
{
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)platform
{
  return self->_platform;
}

- (BOOL)isEqualToAdjustmentPipeline:(id)a3
{
  id v4 = a3;
  v5 = [(IPAPhotoAdjustmentPipeline *)self string];
  v6 = [v4 string];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAPhotoAdjustmentPipeline *)self isEqualToAdjustmentPipeline:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(IPAPhotoAdjustmentPipeline *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)string
{
  return (id)[NSString stringWithFormat:@"%@.%lu", self->_platform, self->_version];
}

- (IPAPhotoAdjustmentPipeline)initWithPlatform:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAPhotoAdjustmentPipeline;
  v7 = [(IPAPhotoAdjustmentPipeline *)&v11 init];
  if (v7)
  {
    uint64_t v8 = +[IPAAdjustmentVersion validatePlatformString:v6];
    platform = v7->_platform;
    v7->_platform = (NSString *)v8;

    v7->_version = a4;
  }

  return v7;
}

+ (id)current
{
  return +[IPAPhotoAdjustmentPipeline pipelineForVersion:4];
}

+ (id)pipelineFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 lowercaseString];

    uint64_t v6 = [v5 length];
    v7 = objc_msgSend((id)s_pipelineRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 rangeAtIndex:1];
      id v4 = objc_msgSend(v5, "substringWithRange:", v9, v10);
      uint64_t v11 = [v8 rangeAtIndex:2];
      v13 = objc_msgSend(v5, "substringWithRange:", v11, v12);
      uint64_t v14 = [v13 integerValue];

      uint64_t v8 = +[IPAPhotoAdjustmentPipeline pipelineForPlatform:v4 version:v14];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)pipelineForVersion:(unint64_t)a3
{
  return (id)[a1 pipelineForPlatform:@"iOS" version:a3];
}

+ (id)pipelineForPlatform:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithPlatform:v6 version:a4];

  return v7;
}

+ (void)initialize
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!s_pipelineRegex)
  {
    id v6 = 0;
    uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(osx|ios)\\.([0-9]+)$" options:0 error:&v6];
    id v3 = v6;
    id v4 = (void *)s_pipelineRegex;
    s_pipelineRegex = v2;

    if (!s_pipelineRegex)
    {
      BOOL v5 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = @"^(osx|ios)\\.([0-9]+)$";
        _os_log_impl(&dword_1DD3FD000, v5, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }
    }
  }
}

@end