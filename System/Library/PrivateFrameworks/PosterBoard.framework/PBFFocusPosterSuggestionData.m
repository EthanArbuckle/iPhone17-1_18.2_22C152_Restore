@interface PBFFocusPosterSuggestionData
- (NSArray)previews;
- (NSMapTable)previewsToSnapshotsMapTable;
- (PBFFocusPosterSuggestionData)initWithPreviews:(id)a3 previewsToSnapshotsMapTable:(id)a4;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)previewForUniqueIdentifier:(id)a3;
- (id)snapshotForPoster:(id)a3;
- (unint64_t)count;
@end

@implementation PBFFocusPosterSuggestionData

- (PBFFocusPosterSuggestionData)initWithPreviews:(id)a3 previewsToSnapshotsMapTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBFFocusPosterSuggestionData;
  v8 = [(PBFFocusPosterSuggestionData *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    previews = v8->_previews;
    v8->_previews = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_previewsToSnapshotsMapTable, a4);
  }

  return v8;
}

- (unint64_t)count
{
  return [(NSArray *)self->_previews count];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return [(NSArray *)self->_previews objectAtIndexedSubscript:a3];
}

- (id)previewForUniqueIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_previews;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "previewUniqueIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)snapshotForPoster:(id)a3
{
  return [(NSMapTable *)self->_previewsToSnapshotsMapTable objectForKey:a3];
}

- (NSArray)previews
{
  return self->_previews;
}

- (NSMapTable)previewsToSnapshotsMapTable
{
  return self->_previewsToSnapshotsMapTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewsToSnapshotsMapTable, 0);
  objc_storeStrong((id *)&self->_previews, 0);
}

@end