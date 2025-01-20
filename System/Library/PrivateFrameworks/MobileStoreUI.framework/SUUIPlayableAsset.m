@interface SUUIPlayableAsset
- (BOOL)isITunesStream;
- (BOOL)shouldUseITunesStoreSecureKeyDelivery;
- (NSURL)contentURL;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (SUUIPlayableAsset)init;
- (SUUIPlayableAsset)initWithContentURL:(id)a3;
- (SUUIPlayableAsset)initWithVideo:(id)a3;
- (SUUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4;
- (double)initialPlaybackTime;
- (double)playbackDuration;
- (int64_t)storeItemIdentifier;
- (void)setContentURL:(id)a3;
- (void)setInitialPlaybackTime:(double)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setShouldUseITunesStoreSecureKeyDelivery:(BOOL)a3;
- (void)setStoreItemIdentifier:(int64_t)a3;
@end

@implementation SUUIPlayableAsset

- (SUUIPlayableAsset)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIPlayableAsset;
  result = [(SUUIPlayableAsset *)&v3 init];
  if (result)
  {
    result->_initialPlaybackTime = NAN;
    result->_playbackDuration = NAN;
  }
  return result;
}

- (SUUIPlayableAsset)initWithContentURL:(id)a3
{
  id v5 = a3;
  v6 = [(SUUIPlayableAsset *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentURL, a3);
  }

  return v7;
}

- (SUUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUUIPlayableAsset *)self init];
  v9 = v8;
  if (v7 && v8)
  {
    uint64_t v10 = [v7 URL];
    contentURL = v9->_contentURL;
    v9->_contentURL = (NSURL *)v10;

    [v7 initialPlaybackTime];
    v9->_initialPlaybackTime = v12;
    uint64_t v13 = [v7 itemIdentifier];
    v9->_storeItemIdentifier = v13;
    if (!v13) {
      v9->_storeItemIdentifier = [v6 itemIdentifier];
    }
    v14 = [v7 secureKeyDeliveryType];
    v9->_shouldUseITunesStoreSecureKeyDelivery = [v14 isEqualToString:0x2704F7F90];

    v9->_ITunesStream = [v7 isITunesStream];
    uint64_t v15 = [v7 keyCertificateURL];
    keyCertificateURL = v9->_keyCertificateURL;
    v9->_keyCertificateURL = (NSURL *)v15;

    uint64_t v17 = [v7 keyServerURL];
    keyServerURL = v9->_keyServerURL;
    v9->_keyServerURL = (NSURL *)v17;

    [v7 playbackDuration];
    v9->_playbackDuration = v19;
  }

  return v9;
}

- (SUUIPlayableAsset)initWithVideo:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIPlayableAsset *)self init];
  id v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 URL];
    contentURL = v6->_contentURL;
    v6->_contentURL = (NSURL *)v7;
  }
  return v6;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (BOOL)isITunesStream
{
  return self->_ITunesStream;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (BOOL)shouldUseITunesStoreSecureKeyDelivery
{
  return self->_shouldUseITunesStoreSecureKeyDelivery;
}

- (void)setShouldUseITunesStoreSecureKeyDelivery:(BOOL)a3
{
  self->_shouldUseITunesStoreSecureKeyDelivery = a3;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

@end