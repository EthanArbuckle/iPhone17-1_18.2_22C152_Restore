@interface SUUIVideoViewElement
- (BOOL)isEnabled;
- (NSArray)assets;
- (SUUIImageViewElement)thumbnailImage;
- (SUUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
- (int64_t)kind;
- (int64_t)playbackStyle;
@end

@implementation SUUIVideoViewElement

- (SUUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SUUIVideoViewElement;
  v10 = [(SUUIViewElement *)&v37 initWithDOMElement:v8 parent:a4 elementFactory:v9];
  if (!v10) {
    goto LABEL_31;
  }
  v11 = [v8 getAttribute:@"playback"];
  if ([v11 isEqualToString:@"inline"]) {
    v10->_playbackStyle = 1;
  }
  v35 = [(SUUIViewElement *)v10 firstChildForElementType:49];
  if (!v35)
  {
    v12 = objc_opt_class();
    [v12 registerClass:objc_opt_class() forElementName:@"video" elementType:49];
    v13 = [[SUUIImageViewElement alloc] initWithDOMElement:v8 parent:v10 elementFactory:v9];
    thumbnailImage = v10->_thumbnailImage;
    v10->_thumbnailImage = v13;

    v15 = [(SUUIImageViewElement *)v10->_thumbnailImage URL];

    if (!v15)
    {
      v16 = v10->_thumbnailImage;
      v10->_thumbnailImage = 0;
    }
    v17 = objc_opt_class();
    [v17 registerClass:objc_opt_class() forElementName:@"video" elementType:152];
  }
  v18 = [v8 getAttribute:@"disabled"];
  if ([v18 length]) {
    char v19 = [v18 BOOLValue] ^ 1;
  }
  else {
    char v19 = -1;
  }
  v34 = v18;
  v10->_enabled = v19;
  v20 = [v8 getAttribute:@"data-content-id"];
  if ([v20 length]) {
    v10->_itemIdentifier = [v20 longLongValue];
  }
  v21 = [v8 getAttribute:@"data-metrics"];
  objc_opt_class();
  v36 = v11;
  if (objc_opt_isKindOfClass())
  {
    id v22 = v21;
    v23 = v22;
    if (v22)
    {
      v24 = (void *)MEMORY[0x263F08900];
      v25 = [v22 dataUsingEncoding:4];
      v26 = [v24 JSONObjectWithData:v25 options:0 error:0];

      goto LABEL_18;
    }
  }
  else
  {
    v23 = 0;
  }
  v26 = 0;
LABEL_18:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = 0;
    goto LABEL_22;
  }
  id v27 = v26;
  v28 = v27;
  if (!v27)
  {
LABEL_22:
    v29 = 0;
    goto LABEL_23;
  }
  v29 = [v27 objectForKey:@"kind"];
LABEL_23:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }
  if ([v30 isEqualToString:@"movie"])
  {
    uint64_t v31 = 1;
  }
  else
  {
    int v32 = [v30 isEqualToString:@"tvEpisode"];
    uint64_t v31 = 2;
    if (!v32) {
      uint64_t v31 = 0;
    }
  }
  v10->_kind = v31;

LABEL_31:
  return v10;
}

- (NSArray)assets
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SUUIVideoViewElement_assets__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __30__SUUIVideoViewElement_assets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 5) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUIImageViewElement)thumbnailImage
{
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
  {
    id v3 = thumbnailImage;
  }
  else
  {
    id v3 = [(SUUIViewElement *)self firstChildForElementType:49];
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SUUIVideoViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIVideoViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = [(SUUIVideoViewElement *)v4 itemIdentifier];
    self->_playbackStyle = [(SUUIVideoViewElement *)v4 playbackStyle];
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
  v4.super_class = (Class)SUUIVideoViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
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

@end