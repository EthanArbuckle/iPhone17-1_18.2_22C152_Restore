@interface FCMultiSizeVideo
- (BOOL)isEqual:(id)a3;
- (FCMultiSizeVideo)init;
- (FCMultiSizeVideo)initWithConfigDictionary:(id)a3;
- (FCMultiSizeVideo)initWithSmallVideoURL:(id)a3 largeVideoURL:(id)a4;
- (NSURL)large;
- (NSURL)small;
- (unint64_t)hash;
@end

@implementation FCMultiSizeVideo

- (FCMultiSizeVideo)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationURLValue(v4, @"videoSmall");
  v6 = FCAppConfigurationURLValue(v4, @"videoLarge");

  v7 = [(FCMultiSizeVideo *)self initWithSmallVideoURL:v5 largeVideoURL:v6];
  return v7;
}

- (FCMultiSizeVideo)initWithSmallVideoURL:(id)a3 largeVideoURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCMultiSizeVideo;
  v9 = [(FCMultiSizeVideo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_small, a3);
    objc_storeStrong((id *)&v10->_large, a4);
  }

  return v10;
}

- (FCMultiSizeVideo)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCMultiSizeVideo init]";
    __int16 v9 = 2080;
    v10 = "FCMultiSizeVideo.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMultiSizeVideo init]"];
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
    id v7 = (void *)MEMORY[0x1E4FBA8A8];
    id v8 = [(FCMultiSizeVideo *)self small];
    __int16 v9 = [v6 small];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCMultiSizeVideo *)self large];
      int v12 = [v6 large];
      char v13 = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12);
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(FCMultiSizeVideo *)self small];
  uint64_t v4 = [v3 hash];
  v5 = [(FCMultiSizeVideo *)self large];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSURL)small
{
  return self->_small;
}

- (NSURL)large
{
  return self->_large;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_large, 0);
  objc_storeStrong((id *)&self->_small, 0);
}

@end