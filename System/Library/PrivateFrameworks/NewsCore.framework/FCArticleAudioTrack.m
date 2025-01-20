@interface FCArticleAudioTrack
- (BOOL)isEqual:(id)a3;
- (FCAVAsset)asset;
- (FCArticleAudioTrack)init;
- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5;
- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5 embeddedUpsellStartTime:(double)a6 embeddedUpsellEndTime:(double)a7;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (double)duration;
- (double)embeddedUpsellEndTime;
- (double)embeddedUpsellStartTime;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation FCArticleAudioTrack

- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5 embeddedUpsellStartTime:(double)a6 embeddedUpsellEndTime:(double)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FCArticleAudioTrack;
  v14 = [(FCArticleAudioTrack *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_asset, a4);
    v15->_duration = a5;
    v15->_embeddedUpsellStartTime = a6;
    v15->_embeddedUpsellEndTime = a7;
  }

  return v15;
}

- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5
{
  return [(FCArticleAudioTrack *)self initWithType:a3 asset:a4 duration:a5 embeddedUpsellStartTime:0.0 embeddedUpsellEndTime:0.0];
}

- (double)duration
{
  return self->_duration;
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
    v7 = [(FCArticleAudioTrack *)self asset];
    v8 = [v6 asset];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (FCAVAsset)asset
{
  return self->_asset;
}

- (FCArticleAudioTrack)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleAudioTrack init]";
    __int16 v9 = 2080;
    v10 = "FCArticleAudioTrack.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleAudioTrack init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)hash
{
  v2 = [(FCArticleAudioTrack *)self asset];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (FCContentArchive)contentArchive
{
  v2 = [(FCArticleAudioTrack *)self asset];
  unint64_t v3 = [v2 contentArchive];

  return (FCContentArchive *)v3;
}

- (FCContentManifest)contentManifest
{
  v2 = [(FCArticleAudioTrack *)self asset];
  unint64_t v3 = [v2 contentManifest];

  return (FCContentManifest *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (double)embeddedUpsellStartTime
{
  return self->_embeddedUpsellStartTime;
}

- (double)embeddedUpsellEndTime
{
  return self->_embeddedUpsellEndTime;
}

- (void).cxx_destruct
{
}

@end