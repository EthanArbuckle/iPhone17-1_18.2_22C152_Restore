@interface PXPlacesMapLayoutResultImpl
- (NSMutableOrderedSet)items;
- (NSString)description;
- (PXPlacesMapLayoutResultImpl)init;
- (PXPlacesMapViewPort)viewPort;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)removeItem:(id)a3;
- (void)setItems:(id)a3;
- (void)setViewPort:(id)a3;
@end

@implementation PXPlacesMapLayoutResultImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_viewPort, 0);
}

- (void)setItems:(id)a3
{
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setViewPort:(id)a3
{
}

- (PXPlacesMapViewPort)viewPort
{
  return self->_viewPort;
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapLayoutResultImpl *)self items];
  [v5 removeObject:v4];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapLayoutResultImpl *)self items];
  [v5 unionOrderedSet:v4];
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapLayoutResultImpl *)self items];
  [v5 addObject:v4];
}

- (NSString)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PXPlacesMapLayoutResultImpl *)self viewPort];
  [v3 appendFormat:@"Viewport %@\n", v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_items;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 coordinate];
        uint64_t v12 = v11;
        [v10 coordinate];
        uint64_t v14 = v13;
        v15 = [v10 geotaggables];
        [v3 appendFormat:@"Item %f, %f has %ld children\n", v12, v14, objc_msgSend(v15, "count")];
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return (NSString *)v3;
}

- (PXPlacesMapLayoutResultImpl)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapLayoutResultImpl;
  v2 = [(PXPlacesMapLayoutResultImpl *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    items = v2->_items;
    v2->_items = v3;
  }
  return v2;
}

@end