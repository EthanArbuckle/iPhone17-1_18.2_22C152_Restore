@interface ICURLBagEnhancedAudioConfiguration
- (ICURLBagEnhancedAudioConfiguration)initWithBagEnhancedAudioDictionary:(id)a3;
- (NSArray)prefetchSKDs;
- (NSDictionary)bagEnhancedAudioDictionary;
- (NSURL)certificateURL;
- (NSURL)keyServerURL;
- (id)_urlForBagEnhancedAudioKey:(id)a3;
- (void)setBagEnhancedAudioDictionary:(id)a3;
@end

@implementation ICURLBagEnhancedAudioConfiguration

- (id)_urlForBagEnhancedAudioKey:(id)a3
{
  v3 = [(NSDictionary *)self->_bagEnhancedAudioDictionary objectForKey:a3];
  if (_NSIsNSString())
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)prefetchSKDs
{
  v2 = [(NSDictionary *)self->_bagEnhancedAudioDictionary objectForKey:@"hls-prefetch-skd-urls"];
  if (_NSIsNSArray()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSURL)keyServerURL
{
  return (NSURL *)[(ICURLBagEnhancedAudioConfiguration *)self _urlForBagEnhancedAudioKey:@"hls-key-server-url"];
}

- (NSURL)certificateURL
{
  return (NSURL *)[(ICURLBagEnhancedAudioConfiguration *)self _urlForBagEnhancedAudioKey:@"hls-cert"];
}

- (void).cxx_destruct
{
}

- (ICURLBagEnhancedAudioConfiguration)initWithBagEnhancedAudioDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICURLBagEnhancedAudioConfiguration;
  v6 = [(ICURLBagEnhancedAudioConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bagEnhancedAudioDictionary, a3);
  }

  return v7;
}

- (void)setBagEnhancedAudioDictionary:(id)a3
{
}

- (NSDictionary)bagEnhancedAudioDictionary
{
  return self->_bagEnhancedAudioDictionary;
}

@end