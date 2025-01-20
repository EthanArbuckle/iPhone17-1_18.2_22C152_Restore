@interface SUUITracklistViewElement
- (NSArray)sections;
- (NSArray)tracks;
- (SUUIHeaderViewElement)header;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (void)enumerateTracksUsingBlock:(id)a3;
@end

@implementation SUUITracklistViewElement

- (void)enumerateTracksUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SUUITracklistViewElement_enumerateTracksUsingBlock___block_invoke;
  v6[3] = &unk_265403F40;
  id v5 = v4;
  id v7 = v5;
  v8 = v9;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __54__SUUITracklistViewElement_enumerateTracksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x25A2A9B80]();
  if ([v4 elementType] == 146)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (SUUIHeaderViewElement)header
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__58;
  v10 = __Block_byref_object_dispose__58;
  id v11 = 0;
  v2 = [(SUUITracklistViewElement *)self children];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SUUITracklistViewElement_header__block_invoke;
  v5[3] = &unk_265406390;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIHeaderViewElement *)v3;
}

void __34__SUUITracklistViewElement_header__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  sections = self->_sections;
  if (!sections)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_sections;
    self->_sections = v4;

    uint64_t v6 = [(SUUITracklistViewElement *)self children];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__SUUITracklistViewElement_sections__block_invoke;
    v9[3] = &unk_2654063B8;
    void v9[4] = self;
    [v6 enumerateObjectsUsingBlock:v9];

    sections = self->_sections;
  }
  id v7 = (NSMutableArray *)[(NSMutableArray *)sections count];
  if (v7) {
    id v7 = self->_sections;
  }
  return (NSArray *)v7;
}

void __36__SUUITracklistViewElement_sections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 108) {
    [*(id *)(*(void *)(a1 + 32) + 280) addObject:v3];
  }
}

- (NSArray)tracks
{
  tracks = self->_tracks;
  if (!tracks)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_tracks;
    self->_tracks = v4;

    uint64_t v6 = [(SUUITracklistViewElement *)self children];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__SUUITracklistViewElement_tracks__block_invoke;
    v9[3] = &unk_2654063B8;
    void v9[4] = self;
    [v6 enumerateObjectsUsingBlock:v9];

    tracks = self->_tracks;
  }
  id v7 = (NSMutableArray *)[(NSMutableArray *)tracks count];
  if (v7) {
    id v7 = self->_tracks;
  }
  return (NSArray *)v7;
}

void __34__SUUITracklistViewElement_tracks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 146) {
    [*(id *)(*(void *)(a1 + 32) + 288) addObject:v3];
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUITracklistViewElement;
  id v4 = (SUUITracklistViewElement *)a3;
  id v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];

  if (v4 != self || objc_msgSend(v5, "updateType", v9.receiver, v9.super_class))
  {
    sections = self->_sections;
    self->_sections = 0;

    tracks = self->_tracks;
    self->_tracks = 0;
  }
  return v5;
}

- (int64_t)pageComponentType
{
  return 23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end