@interface SKUIPlayableAsset
- (BOOL)isITunesStream;
- (BOOL)shouldUseITunesStoreSecureKeyDelivery;
- (NSURL)contentURL;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (SKUIPlayableAsset)init;
- (SKUIPlayableAsset)initWithContentURL:(id)a3;
- (SKUIPlayableAsset)initWithVideo:(id)a3;
- (SKUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4;
- (double)initialPlaybackTime;
- (double)playbackDuration;
- (int64_t)storeItemIdentifier;
- (void)init;
- (void)setContentURL:(id)a3;
- (void)setInitialPlaybackTime:(double)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setShouldUseITunesStoreSecureKeyDelivery:(BOOL)a3;
- (void)setStoreItemIdentifier:(int64_t)a3;
@end

@implementation SKUIPlayableAsset

- (SKUIPlayableAsset)init
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIPlayableAsset *)v3 init];
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIPlayableAsset;
  result = [(SKUIPlayableAsset *)&v12 init];
  if (result)
  {
    result->_initialPlaybackTime = NAN;
    result->_playbackDuration = NAN;
  }
  return result;
}

- (SKUIPlayableAsset)initWithContentURL:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIPlayableAsset initWithContentURL:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = [(SKUIPlayableAsset *)self init];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_contentURL, a3);
  }

  return v15;
}

- (SKUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIPlayableAsset initWithVideoViewElement:assetViewElement:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [(SKUIPlayableAsset *)self init];
  v17 = v16;
  if (v7 && v16)
  {
    uint64_t v18 = [v7 URL];
    contentURL = v17->_contentURL;
    v17->_contentURL = (NSURL *)v18;

    [v7 initialPlaybackTime];
    v17->_initialPlaybackTime = v20;
    uint64_t v21 = [v7 itemIdentifier];
    v17->_storeItemIdentifier = v21;
    if (!v21) {
      v17->_storeItemIdentifier = [v6 itemIdentifier];
    }
    v22 = [v7 secureKeyDeliveryType];
    v17->_shouldUseITunesStoreSecureKeyDelivery = [v22 isEqualToString:0x1F1C9BCA8];

    v17->_ITunesStream = [v7 isITunesStream];
    uint64_t v23 = [v7 keyCertificateURL];
    keyCertificateURL = v17->_keyCertificateURL;
    v17->_keyCertificateURL = (NSURL *)v23;

    uint64_t v25 = [v7 keyServerURL];
    keyServerURL = v17->_keyServerURL;
    v17->_keyServerURL = (NSURL *)v25;

    [v7 playbackDuration];
    v17->_playbackDuration = v27;
  }

  return v17;
}

- (SKUIPlayableAsset)initWithVideo:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPlayableAsset initWithVideo:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIPlayableAsset *)self init];
  uint64_t v14 = v13;
  if (v4 && v13)
  {
    uint64_t v15 = [v4 URL];
    contentURL = v14->_contentURL;
    v14->_contentURL = (NSURL *)v15;
  }
  return v14;
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

- (void)init
{
}

- (void)initWithContentURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithVideoViewElement:(uint64_t)a3 assetViewElement:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithVideo:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end