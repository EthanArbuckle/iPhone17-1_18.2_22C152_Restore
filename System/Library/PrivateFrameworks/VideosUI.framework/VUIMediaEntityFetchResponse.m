@interface VUIMediaEntityFetchResponse
- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5;
- (BOOL)hasDataForCheckHasItemsOption;
- (BOOL)isEqual:(id)a3;
- (NSArray)grouping;
- (NSArray)groupingSortIndexes;
- (NSArray)mediaEntities;
- (NSArray)sortIndexes;
- (VUIMediaEntityFetchResponse)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)mediaEntitySubtype;
- (void)setGrouping:(id)a3;
- (void)setGroupingSortIndexes:(id)a3;
- (void)setHasDataForCheckHasItemsOption:(BOOL)a3;
- (void)setMediaEntities:(id)a3;
- (void)setMediaEntitySubtype:(unint64_t)a3;
- (void)setSortIndexes:(id)a3;
@end

@implementation VUIMediaEntityFetchResponse

- (VUIMediaEntityFetchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaEntityFetchResponse;
  v2 = [(VUIMediaEntityFetchResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    mediaEntities = v2->_mediaEntities;
    v2->_mediaEntities = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(VUIMediaEntityFetchResponse *)self mediaEntities];
  v11 = (void *)[v10 mutableCopy];

  v12 = [v9 mediaEntitiesChangeSet];
  v13 = [v8 mediaEntities];
  int v14 = objc_msgSend(v11, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v12, v13, v5);

  if (v14)
  {
    [(VUIMediaEntityFetchResponse *)self setMediaEntities:v11];
    v15 = [v8 sortIndexes];
    [(VUIMediaEntityFetchResponse *)self setSortIndexes:v15];
  }
  v16 = [(VUIMediaEntityFetchResponse *)self grouping];
  v17 = (void *)[v16 mutableCopy];

  uint64_t v18 = [v8 grouping];
  v19 = (void *)v18;
  if (v17)
  {
    if (v18)
    {
      v20 = [v9 groupingChangeSet];
      int v21 = objc_msgSend(v17, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v20, v19, v5);

      if (v21)
      {
        [(VUIMediaEntityFetchResponse *)self setGrouping:v17];
        v22 = [v8 groupingSortIndexes];
        [(VUIMediaEntityFetchResponse *)self setGroupingSortIndexes:v22];

        LOBYTE(v14) = 1;
      }
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIMediaEntityFetchResponse);
  uint64_t v5 = [(NSArray *)self->_mediaEntities copy];
  mediaEntities = v4->_mediaEntities;
  v4->_mediaEntities = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_sortIndexes copy];
  sortIndexes = v4->_sortIndexes;
  v4->_sortIndexes = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_grouping copy];
  grouping = v4->_grouping;
  v4->_grouping = (NSArray *)v9;

  uint64_t v11 = [(NSArray *)self->_groupingSortIndexes copy];
  groupingSortIndexes = v4->_groupingSortIndexes;
  v4->_groupingSortIndexes = (NSArray *)v11;

  return v4;
}

- (unint64_t)hash
{
  v3 = [(VUIMediaEntityFetchResponse *)self mediaEntities];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(VUIMediaEntityFetchResponse *)self sortIndexes];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(VUIMediaEntityFetchResponse *)self grouping];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(VUIMediaEntityFetchResponse *)self groupingSortIndexes];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMediaEntityFetchResponse *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(VUIMediaEntityFetchResponse *)self mediaEntities];
        uint64_t v8 = [(VUIMediaEntityFetchResponse *)v6 mediaEntities];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_29;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_22;
          }
        }
        int v14 = [(VUIMediaEntityFetchResponse *)self sortIndexes];
        v15 = [(VUIMediaEntityFetchResponse *)v6 sortIndexes];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {
        }
        else
        {
          uint64_t v11 = v16;
          char v12 = 0;
          if (!v9 || !v16) {
            goto LABEL_29;
          }
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_22;
          }
        }
        uint64_t v18 = [(VUIMediaEntityFetchResponse *)self grouping];
        v19 = [(VUIMediaEntityFetchResponse *)v6 grouping];
        id v9 = v18;
        id v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          v22 = [(VUIMediaEntityFetchResponse *)self groupingSortIndexes];
          v23 = [(VUIMediaEntityFetchResponse *)v6 groupingSortIndexes];
          id v9 = v22;
          id v24 = v23;
          uint64_t v11 = v24;
          if (v9 == v24)
          {
            char v12 = 1;
          }
          else
          {
            char v12 = 0;
            if (v9 && v24) {
              char v12 = [v9 isEqual:v24];
            }
          }
          goto LABEL_29;
        }
        uint64_t v11 = v20;
        char v12 = 0;
        if (v9 && v20)
        {
          char v21 = [v9 isEqual:v20];

          if ((v21 & 1) == 0)
          {
LABEL_22:
            char v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v12 = 0;
  }
LABEL_31:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21.receiver = self;
  v21.super_class = (Class)VUIMediaEntityFetchResponse;
  uint64_t v4 = [(VUIMediaEntityFetchResponse *)&v21 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  uint64_t v6 = [(VUIMediaEntityFetchResponse *)self mediaEntities];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"mediaEntities", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [(VUIMediaEntityFetchResponse *)self sortIndexes];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"sortIndexes", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  char v12 = [(VUIMediaEntityFetchResponse *)self grouping];
  char v13 = [v11 stringWithFormat:@"%@=%@", @"grouping", v12];
  [v3 addObject:v13];

  int v14 = NSString;
  v15 = [(VUIMediaEntityFetchResponse *)self groupingSortIndexes];
  id v16 = [v14 stringWithFormat:@"%@=%@", @"groupingSortIndexes", v15];
  [v3 addObject:v16];

  char v17 = NSString;
  uint64_t v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (void)setMediaEntities:(id)a3
{
}

- (NSArray)sortIndexes
{
  return self->_sortIndexes;
}

- (void)setSortIndexes:(id)a3
{
}

- (NSArray)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
}

- (NSArray)groupingSortIndexes
{
  return self->_groupingSortIndexes;
}

- (void)setGroupingSortIndexes:(id)a3
{
}

- (BOOL)hasDataForCheckHasItemsOption
{
  return self->_hasDataForCheckHasItemsOption;
}

- (void)setHasDataForCheckHasItemsOption:(BOOL)a3
{
  self->_hasDataForCheckHasItemsOption = a3;
}

- (unint64_t)mediaEntitySubtype
{
  return self->_mediaEntitySubtype;
}

- (void)setMediaEntitySubtype:(unint64_t)a3
{
  self->_mediaEntitySubtype = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSortIndexes, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_sortIndexes, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
}

@end