@interface NMSMediaDownloadInfo
- (BOOL)containsItem:(id)a3;
- (NMSMediaDownloadInfo)initWithItems:(id)a3;
- (NSMutableOrderedSet)items;
- (id)description;
- (id)externalLibraryItemIdentifiers;
- (id)mediaLibraryItemIdentifiers;
- (unint64_t)totalItemCount;
- (unint64_t)totalItemSize;
- (void)enumerateMediaItemsUsingBlock:(id)a3;
- (void)setItems:(id)a3;
- (void)setTotalItemSize:(unint64_t)a3;
@end

@implementation NMSMediaDownloadInfo

- (NMSMediaDownloadInfo)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaDownloadInfo;
  v5 = [(NMSMediaDownloadInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    items = v5->_items;
    v5->_items = (NSMutableOrderedSet *)v6;
  }
  return v5;
}

- (BOOL)containsItem:(id)a3
{
  return [(NSMutableOrderedSet *)self->_items containsObject:a3];
}

- (unint64_t)totalItemCount
{
  return [(NSMutableOrderedSet *)self->_items count];
}

- (unint64_t)totalItemSize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t result = self->_totalItemSize;
  if (!result)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = self->_items;
    uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          self->_totalItemSize += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "size", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    return self->_totalItemSize;
  }
  return result;
}

- (void)enumerateMediaItemsUsingBlock:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaDownloadInfo_enumerateMediaItemsUsingBlock___block_invoke;
  v7[3] = &unk_2646340D0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableOrderedSet *)items enumerateObjectsUsingBlock:v7];
}

uint64_t __54__NMSMediaDownloadInfo_enumerateMediaItemsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)mediaLibraryItemIdentifiers
{
  v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[NSMutableOrderedSet count](self->_items, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NMSMediaDownloadInfo_mediaLibraryItemIdentifiers__block_invoke;
  v7[3] = &unk_2646340F8;
  id v8 = v3;
  id v4 = v3;
  [(NMSMediaDownloadInfo *)self enumerateMediaItemsUsingBlock:v7];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

void __51__NMSMediaDownloadInfo_mediaLibraryItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 mediaLibraryIdentifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 mediaLibraryIdentifier];
    [v4 addObject:v5];
  }
}

- (id)externalLibraryItemIdentifiers
{
  v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[NSMutableOrderedSet count](self->_items, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaDownloadInfo_externalLibraryItemIdentifiers__block_invoke;
  v7[3] = &unk_2646340F8;
  id v8 = v3;
  id v4 = v3;
  [(NMSMediaDownloadInfo *)self enumerateMediaItemsUsingBlock:v7];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

void __54__NMSMediaDownloadInfo_externalLibraryItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 externalLibraryIdentifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 externalLibraryIdentifier];
    [v4 addObject:v5];
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)NMSMediaDownloadInfo;
  id v4 = [(NMSMediaDownloadInfo *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@ - itemCount: %lu - items: %@ - itemSize %llu>", v4, -[NSMutableOrderedSet count](self->_items, "count"), self->_items, self->_totalItemSize];

  return v5;
}

- (void)setTotalItemSize:(unint64_t)a3
{
  self->_totalItemSize = a3;
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end