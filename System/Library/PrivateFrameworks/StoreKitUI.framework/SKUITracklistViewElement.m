@interface SKUITracklistViewElement
- (NSArray)sections;
- (NSArray)tracks;
- (SKUIHeaderViewElement)header;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (void)enumerateTracksUsingBlock:(id)a3;
- (void)header;
- (void)pageComponentType;
- (void)sections;
- (void)tracks;
@end

@implementation SKUITracklistViewElement

- (void)enumerateTracksUsingBlock:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITracklistViewElement enumerateTracksUsingBlock:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SKUITracklistViewElement_enumerateTracksUsingBlock___block_invoke;
  v14[3] = &unk_1E6426440;
  id v13 = v4;
  id v15 = v13;
  v16 = v17;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v14];

  _Block_object_dispose(v17, 8);
}

void __54__SKUITracklistViewElement_enumerateTracksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1C8749310]();
  if ([v4 elementType] == 146)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (SKUIHeaderViewElement)header
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITracklistViewElement *)v3 header];
      }
    }
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__69;
  v19 = __Block_byref_object_dispose__69;
  id v20 = 0;
  uint64_t v11 = [(SKUITracklistViewElement *)self children];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__SKUITracklistViewElement_header__block_invoke;
  v14[3] = &unk_1E6428928;
  void v14[4] = &v15;
  [v11 enumerateObjectsUsingBlock:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SKUIHeaderViewElement *)v12;
}

void __34__SKUITracklistViewElement_header__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 elementType] == 48)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSArray)sections
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITracklistViewElement *)v3 sections];
      }
    }
  }
  sections = self->_sections;
  if (!sections)
  {
    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = self->_sections;
    self->_sections = v12;

    v14 = [(SKUITracklistViewElement *)self children];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__SKUITracklistViewElement_sections__block_invoke;
    v17[3] = &unk_1E6428950;
    void v17[4] = self;
    [v14 enumerateObjectsUsingBlock:v17];

    sections = self->_sections;
  }
  uint64_t v15 = (NSMutableArray *)[(NSMutableArray *)sections count];
  if (v15) {
    uint64_t v15 = self->_sections;
  }

  return (NSArray *)v15;
}

void __36__SKUITracklistViewElement_sections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 108) {
    [*(id *)(*(void *)(a1 + 32) + 280) addObject:v3];
  }
}

- (NSArray)tracks
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITracklistViewElement *)v3 tracks];
      }
    }
  }
  tracks = self->_tracks;
  if (!tracks)
  {
    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = self->_tracks;
    self->_tracks = v12;

    v14 = [(SKUITracklistViewElement *)self children];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __34__SKUITracklistViewElement_tracks__block_invoke;
    v17[3] = &unk_1E6428950;
    void v17[4] = self;
    [v14 enumerateObjectsUsingBlock:v17];

    tracks = self->_tracks;
  }
  uint64_t v15 = (NSMutableArray *)[(NSMutableArray *)tracks count];
  if (v15) {
    uint64_t v15 = self->_tracks;
  }

  return (NSArray *)v15;
}

void __34__SKUITracklistViewElement_tracks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 146) {
    [*(id *)(*(void *)(a1 + 32) + 288) addObject:v3];
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SKUITracklistViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITracklistViewElement applyUpdatesWithElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITracklistViewElement;
  id v13 = [(SKUIViewElement *)&v17 applyUpdatesWithElement:v4];

  if (v4 != self || [v13 updateType])
  {
    sections = self->_sections;
    self->_sections = 0;

    tracks = self->_tracks;
    self->_tracks = 0;
  }

  return v13;
}

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUITracklistViewElement *)v2 pageComponentType];
      }
    }
  }
  return 23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)enumerateTracksUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)header
{
}

- (void)sections
{
}

- (void)tracks
{
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pageComponentType
{
}

@end