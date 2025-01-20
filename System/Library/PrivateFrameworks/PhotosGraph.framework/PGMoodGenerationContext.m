@interface PGMoodGenerationContext
- (BOOL)locationIsLongTimeNoSeeWithLocationNode:(id)a3;
- (BOOL)momentIsLongTimeNoSeeForLocationWithMomentNode:(id)a3;
- (BOOL)momentIsLongTimeNoSeeForPeopleWithMomentNode:(id)a3;
- (BOOL)personIsLongTimeNoSeeWithPersonNode:(id)a3;
- (BOOL)socialGroupIsLongTimeNoSeeWithSocialGroupNode:(id)a3;
- (PGMoodGenerationContext)initWithReferenceDate:(id)a3;
@end

@implementation PGMoodGenerationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTimeNoSeeLocationLatestDate, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePeopleLatestDate, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeByLocationUUID, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeBySocialGroupUUID, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeByPersonLocalIdentifier, 0);
}

- (BOOL)locationIsLongTimeNoSeeWithLocationNode:(id)a3
{
  id v4 = a3;
  isLongTimeNoSeeByLocationUUID = self->_isLongTimeNoSeeByLocationUUID;
  v6 = [v4 UUID];
  v7 = [(NSMutableDictionary *)isLongTimeNoSeeByLocationUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    v9 = [v4 locationNodeCollection];
    v10 = [v9 addressNodes];
    v11 = [v10 momentNodes];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__PGMoodGenerationContext_locationIsLongTimeNoSeeWithLocationNode___block_invoke;
    v16[3] = &unk_1E68EF338;
    v16[4] = self;
    v16[5] = &v17;
    [v11 enumerateNodesUsingBlock:v16];

    v12 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
    v13 = self->_isLongTimeNoSeeByLocationUUID;
    v14 = [v4 UUID];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    char v8 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

uint64_t __67__PGMoodGenerationContext_locationIsLongTimeNoSeeWithLocationNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 endsBeforeLocalDate:*(void *)(*(void *)(a1 + 32) + 40)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)socialGroupIsLongTimeNoSeeWithSocialGroupNode:(id)a3
{
  id v4 = a3;
  isLongTimeNoSeeBySocialGroupUUID = self->_isLongTimeNoSeeBySocialGroupUUID;
  v6 = [v4 UUID];
  v7 = [(NSMutableDictionary *)isLongTimeNoSeeBySocialGroupUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v9 = [v4 collection];
    v10 = [v9 momentNodes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__PGMoodGenerationContext_socialGroupIsLongTimeNoSeeWithSocialGroupNode___block_invoke;
    v15[3] = &unk_1E68EF338;
    v15[4] = self;
    v15[5] = &v16;
    [v10 enumerateNodesUsingBlock:v15];

    v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v17 + 24)];
    v12 = self->_isLongTimeNoSeeBySocialGroupUUID;
    v13 = [v4 UUID];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    char v8 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

uint64_t __73__PGMoodGenerationContext_socialGroupIsLongTimeNoSeeWithSocialGroupNode___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) momentIsLongTimeNoSeeForPeopleWithMomentNode:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)personIsLongTimeNoSeeWithPersonNode:(id)a3
{
  id v4 = a3;
  isLongTimeNoSeeByPersonLocalIdentifier = self->_isLongTimeNoSeeByPersonLocalIdentifier;
  v6 = [v4 localIdentifier];
  v7 = [(NSMutableDictionary *)isLongTimeNoSeeByPersonLocalIdentifier objectForKeyedSubscript:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v9 = [v4 collection];
    v10 = [v9 momentNodes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__PGMoodGenerationContext_personIsLongTimeNoSeeWithPersonNode___block_invoke;
    v15[3] = &unk_1E68EF338;
    v15[4] = self;
    v15[5] = &v16;
    [v10 enumerateNodesUsingBlock:v15];

    v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v17 + 24)];
    v12 = self->_isLongTimeNoSeeByPersonLocalIdentifier;
    v13 = [v4 localIdentifier];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    char v8 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

uint64_t __63__PGMoodGenerationContext_personIsLongTimeNoSeeWithPersonNode___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) momentIsLongTimeNoSeeForPeopleWithMomentNode:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)momentIsLongTimeNoSeeForLocationWithMomentNode:(id)a3
{
  return [a3 endsBeforeLocalDate:self->_longTimeNoSeeLocationLatestDate];
}

- (BOOL)momentIsLongTimeNoSeeForPeopleWithMomentNode:(id)a3
{
  return [a3 endsBeforeLocalDate:self->_longTimeNoSeePeopleLatestDate];
}

- (PGMoodGenerationContext)initWithReferenceDate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGMoodGenerationContext;
  v5 = [(PGMoodGenerationContext *)&v17 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    isLongTimeNoSeeByPersonLocalIdentifier = v5->_isLongTimeNoSeeByPersonLocalIdentifier;
    v5->_isLongTimeNoSeeByPersonLocalIdentifier = v6;

    char v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    isLongTimeNoSeeBySocialGroupUUID = v5->_isLongTimeNoSeeBySocialGroupUUID;
    v5->_isLongTimeNoSeeBySocialGroupUUID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    isLongTimeNoSeeByLocationUUID = v5->_isLongTimeNoSeeByLocationUUID;
    v5->_isLongTimeNoSeeByLocationUUID = v10;

    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v12 = [MEMORY[0x1E4F76C68] dateByAddingYears:-1 toDate:v4];
    longTimeNoSeePeopleLatestDate = v5->_longTimeNoSeePeopleLatestDate;
    v5->_longTimeNoSeePeopleLatestDate = (NSDate *)v12;

    uint64_t v14 = [MEMORY[0x1E4F76C68] dateByAddingYears:-2 toDate:v4];
    longTimeNoSeeLocationLatestDate = v5->_longTimeNoSeeLocationLatestDate;
    v5->_longTimeNoSeeLocationLatestDate = (NSDate *)v14;
  }
  return v5;
}

@end