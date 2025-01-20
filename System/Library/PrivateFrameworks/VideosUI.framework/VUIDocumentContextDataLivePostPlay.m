@interface VUIDocumentContextDataLivePostPlay
- (BOOL)isEqual:(id)a3;
- (NSString)broadcastLocale;
- (NSString)canonicalId;
- (NSString)playablePassthrough;
- (VUIDocumentContextDataLivePostPlay)initWithCanonicalId:(id)a3 playablePassthrough:(id)a4 broadcastLocale:(id)a5;
- (id)jsonData;
@end

@implementation VUIDocumentContextDataLivePostPlay

- (VUIDocumentContextDataLivePostPlay)initWithCanonicalId:(id)a3 playablePassthrough:(id)a4 broadcastLocale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VUIDocumentContextDataLivePostPlay;
  v12 = [(VUIDocumentContextDataLivePostPlay *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_canonicalId, a3);
    objc_storeStrong((id *)&v13->_playablePassthrough, a4);
    objc_storeStrong((id *)&v13->_broadcastLocale, a5);
  }

  return v13;
}

- (id)jsonData
{
  v8[3] = *MEMORY[0x1E4F143B8];
  canonicalId = (__CFString *)self->_canonicalId;
  if (!canonicalId) {
    canonicalId = &stru_1F3E921E0;
  }
  v7[0] = @"id";
  v7[1] = @"playablePassthrough";
  playablePassthrough = (__CFString *)self->_playablePassthrough;
  if (!playablePassthrough) {
    playablePassthrough = &stru_1F3E921E0;
  }
  v8[0] = canonicalId;
  v8[1] = playablePassthrough;
  broadcastLocale = (__CFString *)self->_broadcastLocale;
  v7[2] = @"locale";
  if (!broadcastLocale) {
    broadcastLocale = &stru_1F3E921E0;
  }
  v8[2] = broadcastLocale;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(VUIDocumentContextDataLivePostPlay *)self canonicalId];
    v7 = [v5 canonicalId];
    if ([v6 isEqual:v7])
    {
      v8 = [(VUIDocumentContextDataLivePostPlay *)self playablePassthrough];
      id v9 = [v5 playablePassthrough];
      if ([v8 isEqual:v9])
      {
        id v10 = [(VUIDocumentContextDataLivePostPlay *)self broadcastLocale];
        id v11 = [v5 broadcastLocale];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (NSString)playablePassthrough
{
  return self->_playablePassthrough;
}

- (NSString)broadcastLocale
{
  return self->_broadcastLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastLocale, 0);
  objc_storeStrong((id *)&self->_playablePassthrough, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end