@interface PGGraphPeopleDomainBuildingHelper
- (PGGraphPeopleDomainBuildingHelper)init;
- (id)cachedAuthorNodeForShareParticipant:(id)a3;
- (id)insertIdentifiedPersonWithPersonNode:(id)a3 forPersonLocalIdentifier:(id)a4;
- (id)insertedIdentifiedPersonForPersonLocalIdentifier:(id)a3;
- (void)cacheAuthorNode:(id)a3 forShareParticipant:(id)a4;
@end

@implementation PGGraphPeopleDomainBuildingHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorNodeByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_insertedIdentifiedPersonByPersonLocalIdentifier, 0);
}

- (id)cachedAuthorNodeForShareParticipant:(id)a3
{
  authorNodeByLocalIdentifier = self->_authorNodeByLocalIdentifier;
  v4 = [a3 localIdentifier];
  v5 = [(NSMutableDictionary *)authorNodeByLocalIdentifier objectForKeyedSubscript:v4];

  return v5;
}

- (void)cacheAuthorNode:(id)a3 forShareParticipant:(id)a4
{
  authorNodeByLocalIdentifier = self->_authorNodeByLocalIdentifier;
  id v6 = a3;
  id v7 = [a4 localIdentifier];
  [(NSMutableDictionary *)authorNodeByLocalIdentifier setObject:v6 forKeyedSubscript:v7];
}

- (id)insertIdentifiedPersonWithPersonNode:(id)a3 forPersonLocalIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PGGraphBuilderInsertedIdentifiedPerson alloc] initWithPersonNode:v7];

  [(NSMutableDictionary *)self->_insertedIdentifiedPersonByPersonLocalIdentifier setObject:v8 forKeyedSubscript:v6];
  return v8;
}

- (id)insertedIdentifiedPersonForPersonLocalIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_insertedIdentifiedPersonByPersonLocalIdentifier objectForKeyedSubscript:a3];
}

- (PGGraphPeopleDomainBuildingHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPeopleDomainBuildingHelper;
  v2 = [(PGGraphPeopleDomainBuildingHelper *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    insertedIdentifiedPersonByPersonLocalIdentifier = v2->_insertedIdentifiedPersonByPersonLocalIdentifier;
    v2->_insertedIdentifiedPersonByPersonLocalIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    authorNodeByLocalIdentifier = v2->_authorNodeByLocalIdentifier;
    v2->_authorNodeByLocalIdentifier = v5;
  }
  return v2;
}

@end