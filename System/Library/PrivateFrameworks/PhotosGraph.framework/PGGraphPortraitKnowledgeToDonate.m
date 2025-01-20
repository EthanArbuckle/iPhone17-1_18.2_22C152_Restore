@interface PGGraphPortraitKnowledgeToDonate
- (NSArray)locationNamedEntities;
- (NSArray)namedEntities;
- (NSDictionary)topics;
- (PGGraphPortraitKnowledgeToDonate)initWithTopics:(id)a3 namedEntities:(id)a4 locationNamedEntities:(id)a5;
@end

@implementation PGGraphPortraitKnowledgeToDonate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNamedEntities, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
}

- (NSArray)locationNamedEntities
{
  return self->_locationNamedEntities;
}

- (NSArray)namedEntities
{
  return self->_namedEntities;
}

- (NSDictionary)topics
{
  return self->_topics;
}

- (PGGraphPortraitKnowledgeToDonate)initWithTopics:(id)a3 namedEntities:(id)a4 locationNamedEntities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphPortraitKnowledgeToDonate;
  v12 = [(PGGraphPortraitKnowledgeToDonate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topics, a3);
    objc_storeStrong((id *)&v13->_namedEntities, a4);
    objc_storeStrong((id *)&v13->_locationNamedEntities, a5);
  }

  return v13;
}

@end