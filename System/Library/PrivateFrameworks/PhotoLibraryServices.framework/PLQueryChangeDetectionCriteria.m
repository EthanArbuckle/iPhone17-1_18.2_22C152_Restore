@interface PLQueryChangeDetectionCriteria
- (BOOL)isEmpty;
- (PLQueryChangeDetectionCriteria)init;
- (id)description;
- (void)addAttributeKeyPath:(id)a3 forEntityName:(id)a4;
- (void)addRelationshipKeyPath:(id)a3 forEntityName:(id)a4;
- (void)enumerateEntitiesAndAttributesUsingBlock:(id)a3;
- (void)enumerateEntitiesAndRelationshipsUsingBlock:(id)a3;
@end

@implementation PLQueryChangeDetectionCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipKeyPathsByEntityNameAffectingFetchResult, 0);
  objc_storeStrong((id *)&self->_attributeKeyPathsByEntityNameAffectingFetchResult, 0);
}

- (void)enumerateEntitiesAndRelationshipsUsingBlock:(id)a3
{
}

- (void)enumerateEntitiesAndAttributesUsingBlock:(id)a3
{
}

- (void)addRelationshipKeyPath:(id)a3 forEntityName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_relationshipKeyPathsByEntityNameAffectingFetchResult objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)self->_relationshipKeyPathsByEntityNameAffectingFetchResult setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (void)addAttributeKeyPath:(id)a3 forEntityName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_attributeKeyPathsByEntityNameAffectingFetchResult objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)self->_attributeKeyPathsByEntityNameAffectingFetchResult setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (BOOL)isEmpty
{
  return ![(NSMutableDictionary *)self->_attributeKeyPathsByEntityNameAffectingFetchResult count]
      && [(NSMutableDictionary *)self->_relationshipKeyPathsByEntityNameAffectingFetchResult count] == 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@(attributes: %@ relationships: %@)", objc_opt_class(), self->_attributeKeyPathsByEntityNameAffectingFetchResult, self->_relationshipKeyPathsByEntityNameAffectingFetchResult];
}

- (PLQueryChangeDetectionCriteria)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLQueryChangeDetectionCriteria;
  v2 = [(PLQueryChangeDetectionCriteria *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributeKeyPathsByEntityNameAffectingFetchResult = v2->_attributeKeyPathsByEntityNameAffectingFetchResult;
    v2->_attributeKeyPathsByEntityNameAffectingFetchResult = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationshipKeyPathsByEntityNameAffectingFetchResult = v2->_relationshipKeyPathsByEntityNameAffectingFetchResult;
    v2->_relationshipKeyPathsByEntityNameAffectingFetchResult = v5;
  }
  return v2;
}

@end