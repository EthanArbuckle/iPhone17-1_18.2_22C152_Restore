@interface PGGraphMusicTrackNode
+ (NSArray)musicTrackTitleSortDescriptors;
- (BOOL)hasProperties:(id)a3;
- (NSSet)albumNodes;
- (NSSet)artistNodes;
- (NSSet)genreNodes;
- (NSString)title;
- (PGGraphMusicTrackNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphMusicTrackNode)initWithTitle:(id)a3 durationInSeconds:(double)a4;
- (double)durationInSeconds;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
- (void)enumerateAlbumNodesUsingBlock:(id)a3;
- (void)enumerateArtistNodesUsingBlock:(id)a3;
- (void)enumerateGenreNodesUsingBlock:(id)a3;
@end

@implementation PGGraphMusicTrackNode

- (void).cxx_destruct
{
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (NSString)title
{
  return self->_title;
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphMusicTrackNode *)self artistNodes];
  v4 = [v3 anyObject];

  v5 = [(PGGraphMusicTrackNode *)self albumNodes];
  v6 = [v5 anyObject];

  [(PGGraphMusicTrackNode *)self durationInSeconds];
  uint64_t v8 = v7;
  v9 = [(PGGraphMusicTrackNode *)self genreNodes];
  v10 = [v9 allObjects];

  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) label];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  [v11 sortUsingSelector:sel_caseInsensitiveCompare_];
  v18 = [v11 componentsJoinedByString:@", "];
  v19 = NSString;
  v20 = [(PGGraphMusicTrackNode *)self title];
  v21 = [v4 name];
  v22 = [v6 title];
  v23 = [v19 stringWithFormat:@"%@ (%lf seconds) | %@ | %@ | %@", v20, v8, v21, v22, v18];

  return v23;
}

- (NSSet)artistNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphMusicTrackNode_artistNodes__block_invoke;
  v6[3] = &unk_1E68E82B0;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMusicTrackNode *)self enumerateArtistNodesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __36__PGGraphMusicTrackNode_artistNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSSet)genreNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PGGraphMusicTrackNode_genreNodes__block_invoke;
  v6[3] = &unk_1E68E4FE8;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMusicTrackNode *)self enumerateGenreNodesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __35__PGGraphMusicTrackNode_genreNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSSet)albumNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PGGraphMusicTrackNode_albumNodes__block_invoke;
  v6[3] = &unk_1E68E4FC0;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphMusicTrackNode *)self enumerateAlbumNodesUsingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __35__PGGraphMusicTrackNode_albumNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateArtistNodesUsingBlock:(id)a3
{
}

- (void)enumerateGenreNodesUsingBlock:(id)a3
{
}

- (void)enumerateAlbumNodesUsingBlock:(id)a3
{
}

- (unsigned)domain
{
  return 1000;
}

- (id)label
{
  v2 = @"MusicTrack";
  return @"MusicTrack";
}

- (id)propertyDictionary
{
  v7[2] = *MEMORY[0x1E4F143B8];
  title = self->_title;
  v6[0] = @"name";
  v6[1] = @"durt";
  v7[0] = title;
  v3 = [NSNumber numberWithDouble:self->_durationInSeconds];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    id v7 = v6;
    BOOL v10 = 0;
    if (!v6 || [v6 isEqual:self->_title])
    {

      uint64_t v8 = [v5 objectForKeyedSubscript:@"durt"];
      id v7 = v8;
      if (!v8 || ([v8 doubleValue], v9 == self->_durationInSeconds)) {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (PGGraphMusicTrackNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  id v7 = [v6 objectForKeyedSubscript:@"name"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"durt"];

  [v8 doubleValue];
  double v10 = v9;

  v11 = [(PGGraphMusicTrackNode *)self initWithTitle:v7 durationInSeconds:v10];
  return v11;
}

- (PGGraphMusicTrackNode)initWithTitle:(id)a3 durationInSeconds:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMusicTrackNode;
  uint64_t v8 = [(PGGraphNode *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_durationInSeconds = a4;
  }

  return v9;
}

+ (NSArray)musicTrackTitleSortDescriptors
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"durationInSeconds" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

@end