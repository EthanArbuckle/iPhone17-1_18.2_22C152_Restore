@interface PGGraphStorytellingRelationshipEdge
+ (id)filter;
+ (id)relationshipNameForLabel:(id)a3;
- (NSString)relationship;
- (PGGraphStorytellingRelationshipEdge)initWithRelationship:(id)a3 fromMeNode:(id)a4 toPersonNode:(id)a5;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphStorytellingRelationshipEdge

- (void).cxx_destruct
{
}

- (NSString)relationship
{
  return self->_relationship;
}

- (unsigned)domain
{
  return 306;
}

- (id)label
{
  return self->_relationship;
}

- (PGGraphStorytellingRelationshipEdge)initWithRelationship:(id)a3 fromMeNode:(id)a4 toPersonNode:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphStorytellingRelationshipEdge;
  v9 = [(PGGraphEdge *)&v13 initWithSourceNode:a4 targetNode:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    relationship = v9->_relationship;
    v9->_relationship = (NSString *)v10;
  }
  return v9;
}

+ (id)relationshipNameForLabel:(id)a3
{
  uint64_t v3 = relationshipNameForLabel__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&relationshipNameForLabel__onceToken, &__block_literal_global_63263);
  }
  v5 = [(id)relationshipNameForLabel__multiWordRelationshipNameForLabel objectForKeyedSubscript:v4];
  v6 = v5;
  if (!v5) {
    v5 = v4;
  }
  id v7 = v5;

  return v7;
}

void __64__PGGraphStorytellingRelationshipEdge_relationshipNameForLabel___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"FAMILY_SOCIALGROUP";
  v2[1] = @"COWORKER_SOCIALGROUP";
  v3[0] = @"Family Social Group";
  v3[1] = @"Coworker Social Group";
  v2[2] = @"HOUSEHOLD_MEMBER";
  v3[2] = @"Household Member";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)relationshipNameForLabel__multiWordRelationshipNameForLabel;
  relationshipNameForLabel__multiWordRelationshipNameForLabel = v0;
}

+ (id)filter
{
  id v2 = objc_alloc(MEMORY[0x1E4F71EB0]);
  uint64_t v3 = +[PGGraphRelationshipEdge supportedRelationshipLabels];
  id v4 = (void *)[v2 initWithLabels:v3 domain:306 properties:MEMORY[0x1E4F1CC08]];

  return v4;
}

@end