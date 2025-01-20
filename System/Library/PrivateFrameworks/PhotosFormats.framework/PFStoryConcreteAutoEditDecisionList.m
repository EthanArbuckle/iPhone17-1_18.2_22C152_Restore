@interface PFStoryConcreteAutoEditDecisionList
- (BOOL)isEqualToAutoEditDecisionList:(id)a3;
- (NSArray)clips;
- (NSString)diagnosticDescription;
- (NSString)songAssetIdentifier;
- (PFStoryConcreteAutoEditDecisionList)initWithSongAssetIdentifier:(id)a3 clips:(id)a4;
- (id)clipAtIndex:(int64_t)a3;
- (int64_t)numberOfClips;
@end

@implementation PFStoryConcreteAutoEditDecisionList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clips, 0);

  objc_storeStrong((id *)&self->_songAssetIdentifier, 0);
}

- (NSArray)clips
{
  return self->_clips;
}

- (NSString)songAssetIdentifier
{
  return self->_songAssetIdentifier;
}

- (BOOL)isEqualToAutoEditDecisionList:(id)a3
{
  v4 = (PFStoryConcreteAutoEditDecisionList *)a3;
  if (v4 == self) {
    goto LABEL_10;
  }
  v5 = [(PFStoryConcreteAutoEditDecisionList *)self songAssetIdentifier];
  v6 = [(PFStoryConcreteAutoEditDecisionList *)v4 songAssetIdentifier];
  int v7 = [v5 isEqual:v6];

  if (!v7
    || (uint64_t v8 = [(PFStoryConcreteAutoEditDecisionList *)self numberOfClips],
        v8 != [(PFStoryConcreteAutoEditDecisionList *)v4 numberOfClips]))
  {
    BOOL v9 = 0;
    goto LABEL_11;
  }
  if (v8 < 1)
  {
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  BOOL v9 = 0;
  for (i = 0; i != v8; BOOL v9 = i >= v8)
  {
    v11 = [(PFStoryConcreteAutoEditDecisionList *)self clipAtIndex:i];
    v12 = [(PFStoryConcreteAutoEditDecisionList *)v4 clipAtIndex:i];
    char v13 = [v11 isEqualToClip:v12];

    if ((v13 & 1) == 0) {
      break;
    }
    ++i;
  }
LABEL_11:

  return v9;
}

- (NSString)diagnosticDescription
{
  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONObjectWithAutoEditDecisionList:self];
  v5 = [v4 description];

  return (NSString *)v5;
}

- (id)clipAtIndex:(int64_t)a3
{
  v4 = [(PFStoryConcreteAutoEditDecisionList *)self clips];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfClips
{
  v2 = [(PFStoryConcreteAutoEditDecisionList *)self clips];
  int64_t v3 = [v2 count];

  return v3;
}

- (PFStoryConcreteAutoEditDecisionList)initWithSongAssetIdentifier:(id)a3 clips:(id)a4
{
  v6 = (NSString *)a3;
  int v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFStoryConcreteAutoEditDecisionList;
  uint64_t v8 = [(PFStoryConcreteAutoEditDecisionList *)&v13 init];
  songAssetIdentifier = v8->_songAssetIdentifier;
  v8->_songAssetIdentifier = v6;
  v10 = v6;

  clips = v8->_clips;
  v8->_clips = v7;

  return v8;
}

@end