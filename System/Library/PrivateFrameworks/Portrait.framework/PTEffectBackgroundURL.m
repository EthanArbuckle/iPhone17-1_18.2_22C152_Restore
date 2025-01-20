@interface PTEffectBackgroundURL
- (BOOL)isEqual:(id)a3;
- (NSString)inputBufferChecksum;
- (NSURL)fullsizeURL;
- (NSURL)thumbnailURL;
- (PTEffectBackgroundURL)initWithFullsize:(id)a3 thumbnail:(id)a4 inputBufferChecksum:(id)a5;
- (id)URLs;
- (unint64_t)hash;
@end

@implementation PTEffectBackgroundURL

- (PTEffectBackgroundURL)initWithFullsize:(id)a3 thumbnail:(id)a4 inputBufferChecksum:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PTEffectBackgroundURL;
  v12 = [(PTEffectBackgroundURL *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullsizeURL, a3);
    objc_storeStrong((id *)&v13->_thumbnailURL, a4);
    objc_storeStrong((id *)&v13->_inputBufferChecksum, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTEffectBackgroundURL *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PTEffectBackgroundURL *)v5 fullsizeURL];
      v7 = [(PTEffectBackgroundURL *)self fullsizeURL];
      if ([v6 isEqual:v7])
      {
        v8 = [(PTEffectBackgroundURL *)v5 thumbnailURL];
        id v9 = [(PTEffectBackgroundURL *)self thumbnailURL];
        if ([v8 isEqual:v9])
        {
          id v10 = [(PTEffectBackgroundURL *)v5 inputBufferChecksum];
          id v11 = [(PTEffectBackgroundURL *)self inputBufferChecksum];
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
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_fullsizeURL hash];
  uint64_t v4 = [(NSURL *)self->_thumbnailURL hash] ^ v3;
  return v4 ^ [(NSString *)self->_inputBufferChecksum hash];
}

- (id)URLs
{
  v5[2] = *MEMORY[0x1E4F143B8];
  thumbnailURL = self->_thumbnailURL;
  v5[0] = self->_fullsizeURL;
  v5[1] = thumbnailURL;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (NSURL)fullsizeURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)thumbnailURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)inputBufferChecksum
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBufferChecksum, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);

  objc_storeStrong((id *)&self->_fullsizeURL, 0);
}

@end