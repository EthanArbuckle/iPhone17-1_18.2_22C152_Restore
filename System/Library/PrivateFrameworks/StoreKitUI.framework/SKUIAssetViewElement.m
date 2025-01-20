@interface SKUIAssetViewElement
- (BOOL)isITunesStream;
- (NSString)secureKeyDeliveryType;
- (NSURL)URL;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (SKUIAssetViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (double)initialPlaybackTime;
- (double)playbackDuration;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
- (void)setInitialPlaybackTime:(double)a3;
@end

@implementation SKUIAssetViewElement

- (SKUIAssetViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAssetViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIAssetViewElement;
  v11 = [(SKUIViewElement *)&v31 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"offset"];
    v29 = v12;
    id v30 = v9;
    if ([v12 length]) {
      [v12 doubleValue];
    }
    else {
      uint64_t v13 = 0x7FF8000000000000;
    }
    *(void *)&v11->_initialPlaybackTime = v13;
    v14 = [v8 getAttribute:@"duration"];
    if ([v14 length]) {
      [v14 doubleValue];
    }
    else {
      uint64_t v15 = 0x7FF8000000000000;
    }
    *(void *)&v11->_playbackDuration = v15;
    v16 = [v8 getAttribute:@"data-content-id"];
    if ([v16 length]) {
      v11->_itemIdentifier = [v16 longLongValue];
    }
    v17 = [v8 getAttribute:*MEMORY[0x1E4F6EE80]];
    if ([v17 length]) {
      objc_storeStrong((id *)&v11->_secureKeyDeliveryType, v17);
    }
    v18 = [v8 getAttribute:@"key-cert-url"];
    if ([v18 length])
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v18];
      keyCertificateURL = v11->_keyCertificateURL;
      v11->_keyCertificateURL = (NSURL *)v19;
    }
    v21 = [v8 getAttribute:@"key-server-url"];
    if ([v21 length])
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v21];
      keyServerURL = v11->_keyServerURL;
      v11->_keyServerURL = (NSURL *)v22;
    }
    v24 = [v8 getAttribute:@"is-itunes-stream"];
    v11->_ITunesStream = [v24 BOOLValue];
    v25 = [v8 getAttribute:@"src"];
    if ([v25 length])
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v25];
      url = v11->_url;
      v11->_url = (NSURL *)v26;
    }
    id v9 = v30;
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIAssetViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUIAssetViewElement;
  v5 = [(SKUIViewElement *)&v18 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    [(SKUIAssetViewElement *)v4 initialPlaybackTime];
    self->_initialPlaybackTime = v7;
    self->_itemIdentifier = [(SKUIAssetViewElement *)v4 itemIdentifier];
    [(SKUIAssetViewElement *)v4 playbackDuration];
    self->_playbackDuration = v8;
    id v9 = [(SKUIAssetViewElement *)v4 keyCertificateURL];
    keyCertificateURL = self->_keyCertificateURL;
    self->_keyCertificateURL = v9;

    v11 = [(SKUIAssetViewElement *)v4 keyServerURL];
    keyServerURL = self->_keyServerURL;
    self->_keyServerURL = v11;

    uint64_t v13 = [(SKUIAssetViewElement *)v4 secureKeyDeliveryType];
    secureKeyDeliveryType = self->_secureKeyDeliveryType;
    self->_secureKeyDeliveryType = v13;

    self->_ITunesStream = [(SKUIAssetViewElement *)v4 isITunesStream];
    uint64_t v15 = [(SKUIAssetViewElement *)v4 URL];
    url = self->_url;
    self->_url = v15;
  }

  return v6;
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (NSString)secureKeyDeliveryType
{
  return self->_secureKeyDeliveryType;
}

- (NSURL)URL
{
  return self->_url;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_secureKeyDeliveryType, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAssetViewElement initWithDOMElement:parent:elementFactory:]";
}

@end