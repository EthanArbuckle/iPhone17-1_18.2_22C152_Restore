@interface FCMultiResolutionImage
- (BOOL)isEqual:(id)a3;
- (FCMultiResolutionImage)init;
- (FCMultiResolutionImage)initWithConfigDictionary:(id)a3;
- (FCMultiResolutionImage)initWithImageURL1X:(id)a3 imageURL2X:(id)a4 imageURL3X:(id)a5;
- (NSURL)imageURL1x;
- (NSURL)imageURL2x;
- (NSURL)imageURL3x;
- (unint64_t)hash;
- (void)setImageURL1x:(id)a3;
- (void)setImageURL2x:(id)a3;
- (void)setImageURL3x:(id)a3;
@end

@implementation FCMultiResolutionImage

- (FCMultiResolutionImage)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationURLValue(v4, @"image1x");
  v6 = FCAppConfigurationURLValue(v4, @"image2x");
  v7 = FCAppConfigurationURLValue(v4, @"image3x");

  v8 = [(FCMultiResolutionImage *)self initWithImageURL1X:v5 imageURL2X:v6 imageURL3X:v7];
  return v8;
}

- (FCMultiResolutionImage)initWithImageURL1X:(id)a3 imageURL2X:(id)a4 imageURL3X:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCMultiResolutionImage;
  v12 = [(FCMultiResolutionImage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageURL1x, a3);
    objc_storeStrong((id *)&v13->_imageURL2x, a4);
    objc_storeStrong((id *)&v13->_imageURL3x, a5);
  }

  return v13;
}

- (FCMultiResolutionImage)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMultiResolutionImage init]";
    __int16 v9 = 2080;
    id v10 = "FCMultiResolutionImage.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMultiResolutionImage init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCMultiResolutionImage *)self imageURL1x];
    __int16 v9 = [v6 imageURL1x];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      id v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCMultiResolutionImage *)self imageURL2x];
      int v12 = [v6 imageURL2x];
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        __int16 v13 = (void *)MEMORY[0x1E4FBA8A8];
        v14 = [(FCMultiResolutionImage *)self imageURL3x];
        uint64_t v15 = [v6 imageURL3x];
        char v16 = objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15);
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = [(FCMultiResolutionImage *)self imageURL1x];
  uint64_t v4 = [v3 hash];
  v5 = [(FCMultiResolutionImage *)self imageURL2x];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FCMultiResolutionImage *)self imageURL3x];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSURL)imageURL1x
{
  return self->_imageURL1x;
}

- (void)setImageURL1x:(id)a3
{
}

- (NSURL)imageURL2x
{
  return self->_imageURL2x;
}

- (void)setImageURL2x:(id)a3
{
}

- (NSURL)imageURL3x
{
  return self->_imageURL3x;
}

- (void)setImageURL3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL3x, 0);
  objc_storeStrong((id *)&self->_imageURL2x, 0);
  objc_storeStrong((id *)&self->_imageURL1x, 0);
}

@end