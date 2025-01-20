@interface PGGraphMusicSessionNode
+ (NSArray)musicSessionDateSortDescriptors;
+ (id)momentOfMusicSession;
- (BOOL)hasProperties:(id)a3;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSSet)trackNodes;
- (PGGraphMusicSessionNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphMusicSessionNode)initWithLocalStartDate:(id)a3 localEndDate:(id)a4;
- (id)description;
- (id)label;
- (id)momentNodes;
- (id)propertyDictionary;
- (unsigned)domain;
- (void)enumerateMusicTrackNodesUsingBlock:(id)a3;
@end

@implementation PGGraphMusicSessionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (void)enumerateMusicTrackNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PGGraphMusicSessionNode_enumerateMusicTrackNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E9638;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"PLAYS_TRACK" domain:1000 usingBlock:v6];
}

uint64_t __62__PGGraphMusicSessionNode_enumerateMusicTrackNodesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)trackNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphMusicSessionNode_trackNodes__block_invoke;
  v6[3] = &unk_1E68E9610;
  id v4 = v3;
  id v7 = v4;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"PLAYS_TRACK" domain:1000 usingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __37__PGGraphMusicSessionNode_trackNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)momentNodes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphMusicSessionNode_momentNodes__block_invoke;
  v6[3] = &unk_1E68EF578;
  id v4 = v3;
  id v7 = v4;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"MUSIC_SESSION" domain:1000 usingBlock:v6];

  return v4;
}

uint64_t __38__PGGraphMusicSessionNode_momentNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (unsigned)domain
{
  return 1000;
}

- (id)label
{
  v2 = @"MusicSession";
  return @"MusicSession";
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMusicSessionNode;
  id v4 = [(PGGraphOptimizedNode *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ (%@, %@)", v4, self->_localStartDate, self->_localEndDate];

  return v5;
}

- (id)propertyDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"tzs";
  v3 = NSNumber;
  [(NSDate *)self->_localStartDate timeIntervalSince1970];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v9[1] = @"tze";
  v10[0] = v4;
  id v5 = NSNumber;
  [(NSDate *)self->_localEndDate timeIntervalSince1970];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[1] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"tzs"];
    objc_super v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      double v9 = v8;
      [(NSDate *)self->_localStartDate timeIntervalSince1970];
      if (v9 != v10) {
        goto LABEL_7;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"tze"];
    objc_super v7 = v11;
    if (!v11
      || ([v11 doubleValue],
          double v13 = v12,
          [(NSDate *)self->_localEndDate timeIntervalSince1970],
          v13 == v14))
    {
      BOOL v15 = 1;
    }
    else
    {
LABEL_7:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (PGGraphMusicSessionNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  objc_super v7 = [v6 objectForKeyedSubscript:@"tzs"];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v9];
  v11 = [v6 objectForKeyedSubscript:@"tze"];

  [v11 doubleValue];
  double v13 = v12;

  double v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13];
  BOOL v15 = [(PGGraphMusicSessionNode *)self initWithLocalStartDate:v10 localEndDate:v14];

  return v15;
}

- (PGGraphMusicSessionNode)initWithLocalStartDate:(id)a3 localEndDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphMusicSessionNode;
  double v9 = [(PGGraphNode *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localStartDate, a3);
    objc_storeStrong((id *)&v10->_localEndDate, a4);
  }

  return v10;
}

+ (id)momentOfMusicSession
{
  v2 = +[PGGraphMusicEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (NSArray)musicSessionDateSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localStartDate" ascending:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localEndDate" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

@end