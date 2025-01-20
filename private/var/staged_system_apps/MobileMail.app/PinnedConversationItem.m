@interface PinnedConversationItem
+ (id)pinnedItemWithID:(id)a3 dynamicOffset:(id)a4 indexPathProvider:(id)a5;
- (BOOL)isEqual:(id)a3;
- (EMCollectionItemID)itemID;
- (MFDynamicCellOffsetRepresentation)dynamicOffset;
- (NSIndexPath)indexPath;
- (NSString)ef_publicDescription;
- (id)indexPathProvider;
- (void)setDynamicOffset:(id)a3;
- (void)setIndexPathProvider:(id)a3;
- (void)setItemID:(id)a3;
@end

@implementation PinnedConversationItem

+ (id)pinnedItemWithID:(id)a3 dynamicOffset:(id)a4 indexPathProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    v11 = objc_alloc_init(PinnedConversationItem);
    [(PinnedConversationItem *)v11 setItemID:v7];
    [(PinnedConversationItem *)v11 setDynamicOffset:v8];
    [(PinnedConversationItem *)v11 setIndexPathProvider:v10];
  }

  return v11;
}

- (NSIndexPath)indexPath
{
  v3 = [(PinnedConversationItem *)self indexPathProvider];
  v4 = ((void (**)(void, PinnedConversationItem *))v3)[2](v3, self);

  return (NSIndexPath *)v4;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(PinnedConversationItem *)self itemID];
  v5 = [(PinnedConversationItem *)self indexPath];
  v6 = [(PinnedConversationItem *)self dynamicOffset];
  id v7 = [v6 ef_publicDescription];
  id v8 = +[NSString stringWithFormat:@"<%@:%p> itemID=%@ indexPath=%@ dynamicOffset=%@", v3, self, v4, v5, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 dynamicOffset];
    id v7 = [(PinnedConversationItem *)self dynamicOffset];
    if ([v6 isEqual:v7])
    {
      id v8 = [v5 itemID];
      id v9 = [(PinnedConversationItem *)self itemID];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (MFDynamicCellOffsetRepresentation)dynamicOffset
{
  return self->_dynamicOffset;
}

- (void)setDynamicOffset:(id)a3
{
}

- (id)indexPathProvider
{
  return self->_indexPathProvider;
}

- (void)setIndexPathProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indexPathProvider, 0);
  objc_storeStrong((id *)&self->_dynamicOffset, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end