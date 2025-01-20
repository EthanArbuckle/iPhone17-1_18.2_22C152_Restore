@interface SKUIVideoViewElement
- (BOOL)isEnabled;
- (NSArray)assets;
- (SKUIImageViewElement)thumbnailImage;
- (SKUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
- (int64_t)kind;
- (int64_t)playbackStyle;
@end

@implementation SKUIVideoViewElement

- (SKUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIVideoViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v40.receiver = self;
  v40.super_class = (Class)SKUIVideoViewElement;
  v11 = [(SKUIViewElement *)&v40 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"playback"];
    if ([v12 isEqualToString:@"inline"]) {
      v11->_playbackStyle = 1;
    }
    uint64_t v35 = [(SKUIViewElement *)v11 firstChildForElementType:49];
    if (!v35)
    {
      v13 = objc_opt_class();
      objc_msgSend(v13, "registerClass:forElementName:elementType:", objc_opt_class(), @"video", 49, 0);
      v14 = [[SKUIImageViewElement alloc] initWithDOMElement:v8 parent:v11 elementFactory:v10];
      thumbnailImage = v11->_thumbnailImage;
      v11->_thumbnailImage = v14;

      v16 = [(SKUIImageViewElement *)v11->_thumbnailImage URL];

      if (!v16)
      {
        v17 = v11->_thumbnailImage;
        v11->_thumbnailImage = 0;
      }
      v18 = objc_opt_class();
      [v18 registerClass:objc_opt_class() forElementName:@"video" elementType:152];
    }
    v19 = objc_msgSend(v8, "getAttribute:", @"disabled", v35);
    v37 = v12;
    id v38 = v10;
    if ([v19 length]) {
      char v20 = [v19 BOOLValue] ^ 1;
    }
    else {
      char v20 = -1;
    }
    v11->_enabled = v20;
    v21 = [v8 getAttribute:@"data-content-id"];
    if ([v21 length]) {
      v11->_itemIdentifier = [v21 longLongValue];
    }
    v22 = [v8 getAttribute:@"data-metrics"];
    objc_opt_class();
    id v39 = v9;
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      v24 = v23;
      if (v23)
      {
        v25 = (void *)MEMORY[0x1E4F28D90];
        v26 = [v23 dataUsingEncoding:4];
        v27 = [v25 JSONObjectWithData:v26 options:0 error:0];

        goto LABEL_22;
      }
    }
    else
    {
      v24 = 0;
    }
    v27 = 0;
LABEL_22:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v27;
      v29 = v28;
      if (v28)
      {
        v30 = [v28 objectForKey:@"kind"];
LABEL_27:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v31 = v30;
        }
        else {
          id v31 = 0;
        }
        if ([v31 isEqualToString:@"movie"])
        {
          uint64_t v32 = 1;
        }
        else
        {
          int v33 = [v31 isEqualToString:@"tvEpisode"];
          uint64_t v32 = 2;
          if (!v33) {
            uint64_t v32 = 0;
          }
        }
        v11->_kind = v32;

        id v10 = v38;
        id v9 = v39;
        goto LABEL_35;
      }
    }
    else
    {
      v29 = 0;
    }
    v30 = 0;
    goto LABEL_27;
  }
LABEL_35:

  return v11;
}

- (NSArray)assets
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SKUIVideoViewElement_assets__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __30__SKUIVideoViewElement_assets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 5) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SKUIImageViewElement)thumbnailImage
{
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
  {
    id v3 = thumbnailImage;
  }
  else
  {
    id v3 = [(SKUIViewElement *)self firstChildForElementType:49];
  }

  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SKUIVideoViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIVideoViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = [(SKUIVideoViewElement *)v4 itemIdentifier];
    self->_playbackStyle = [(SKUIVideoViewElement *)v4 playbackStyle];
    objc_storeStrong((id *)&self->_thumbnailImage, v4->_thumbnailImage);
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIVideoViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVideoViewElement initWithDOMElement:parent:elementFactory:]";
}

@end