@interface UPResult
+ (id)createResultFromExistingResult:(id)a3 truncatedTo:(unint64_t)a4;
- (NSArray)_candidates;
- (NSUUID)queryUUID;
- (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse)protobufRepresentation;
- (UPResult)initWithCandidates:(id)a3 queryUUID:(id)a4;
- (UPResultRootNode)rootNode;
- (id)candidateAtRank:(int64_t)a3;
- (int64_t)candidateCount;
@end

@implementation UPResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__candidates, 0);
  objc_storeStrong((id *)&self->_queryUUID, 0);
}

- (NSArray)_candidates
{
  return self->__candidates;
}

- (NSUUID)queryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse)protobufRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA2AD0]);
  if ([(UPResult *)self candidateCount] >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [(UPResult *)self candidateAtRank:v4];
      v6 = [v5 protobufRepresentation];

      [v3 addHypotheses:v6];
      ++v4;
    }
    while ([(UPResult *)self candidateCount] > v4);
  }
  return (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)v3;
}

- (UPResult)initWithCandidates:(id)a3 queryUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPResult;
  v9 = [(UPResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__candidates, a3);
    objc_storeStrong((id *)&v10->_queryUUID, a4);
  }

  return v10;
}

- (UPResultRootNode)rootNode
{
  v2 = [(UPResult *)self candidateAtRank:0];
  id v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 rootNodeRepresentation];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (UPResultRootNode *)v4;
}

- (int64_t)candidateCount
{
  return [(NSArray *)self->__candidates count];
}

- (id)candidateAtRank:(int64_t)a3
{
  if ([(NSArray *)self->__candidates count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->__candidates objectAtIndexedSubscript:a3];
  }
  return v5;
}

+ (id)createResultFromExistingResult:(id)a3 truncatedTo:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    id v5 = a3;
    unint64_t v6 = [v5 candidateCount];
    if (v6 < v4) {
      unint64_t v4 = v6;
    }
    id v7 = [v5 _candidates];
    id v8 = objc_msgSend(v7, "subarrayWithRange:", 0, v4);

    v9 = [UPResult alloc];
    v10 = [v5 queryUUID];

    v11 = [(UPResult *)v9 initWithCandidates:v8 queryUUID:v10];
  }
  else
  {
    id v12 = a3;
    v13 = [UPResult alloc];
    id v8 = [v12 queryUUID];

    v11 = [(UPResult *)v13 initWithCandidates:MEMORY[0x1E4F1CBF0] queryUUID:v8];
  }

  return v11;
}

@end