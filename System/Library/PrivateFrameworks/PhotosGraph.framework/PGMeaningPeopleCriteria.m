@interface PGMeaningPeopleCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (BOOL)requiresChildPresence;
- (BOOL)requiresPartnerPresence;
- (BOOL)requiresPetPresence;
- (NSString)description;
- (unint64_t)minimumNumberOfPeople;
- (void)setMinimumNumberOfPeople:(unint64_t)a3;
- (void)setRequiresChildPresence:(BOOL)a3;
- (void)setRequiresPartnerPresence:(BOOL)a3;
- (void)setRequiresPetPresence:(BOOL)a3;
@end

@implementation PGMeaningPeopleCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"minimumNumberOfPeople"];
  objc_msgSend(v5, "setMinimumNumberOfPeople:", objc_msgSend(v6, "unsignedIntegerValue"));

  v7 = [v4 objectForKeyedSubscript:@"requiresPetPresence"];
  objc_msgSend(v5, "setRequiresPetPresence:", objc_msgSend(v7, "BOOLValue"));

  v8 = [v4 objectForKeyedSubscript:@"requiresChildPresence"];
  objc_msgSend(v5, "setRequiresChildPresence:", objc_msgSend(v8, "BOOLValue"));

  v9 = [v4 objectForKeyedSubscript:@"requiresPartnerPresence"];

  objc_msgSend(v5, "setRequiresPartnerPresence:", objc_msgSend(v9, "BOOLValue"));
  return v5;
}

+ (id)criteriaKey
{
  return @"People";
}

- (void)setRequiresPartnerPresence:(BOOL)a3
{
  self->_requiresPartnerPresence = a3;
}

- (BOOL)requiresPartnerPresence
{
  return self->_requiresPartnerPresence;
}

- (void)setRequiresChildPresence:(BOOL)a3
{
  self->_requiresChildPresence = a3;
}

- (BOOL)requiresChildPresence
{
  return self->_requiresChildPresence;
}

- (void)setRequiresPetPresence:(BOOL)a3
{
  self->_requiresPetPresence = a3;
}

- (BOOL)requiresPetPresence
{
  return self->_requiresPetPresence;
}

- (void)setMinimumNumberOfPeople:(unint64_t)a3
{
  self->_minimumNumberOfPeople = a3;
}

- (unint64_t)minimumNumberOfPeople
{
  return self->_minimumNumberOfPeople;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfPeople: %d\n", -[PGMeaningPeopleCriteria minimumNumberOfPeople](self, "minimumNumberOfPeople"));
  objc_msgSend(v3, "appendFormat:", @"requiresPetPresence: %d\n", -[PGMeaningPeopleCriteria requiresPetPresence](self, "requiresPetPresence"));
  objc_msgSend(v3, "appendFormat:", @"requiresChildPresence: %d\n", -[PGMeaningPeopleCriteria requiresChildPresence](self, "requiresChildPresence"));
  objc_msgSend(v3, "appendFormat:", @"requiresPartnerPresence: %d\n", -[PGMeaningPeopleCriteria requiresPartnerPresence](self, "requiresPartnerPresence"));
  return (NSString *)v3;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 totalNumberOfPersons];
  if (v8 >= [(PGMeaningPeopleCriteria *)self minimumNumberOfPeople])
  {
    [(PGMeaningPeopleCriteria *)self requiresPetPresence];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    char v20 = ![(PGMeaningPeopleCriteria *)self requiresPartnerPresence];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    char v16 = ![(PGMeaningPeopleCriteria *)self requiresChildPresence];
    v10 = [v7 personNodes];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PGMeaningPeopleCriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v12[3] = &unk_1E68EAB68;
    v12[4] = &v17;
    v12[5] = &v13;
    [v10 enumerateObjectsUsingBlock:v12];
    if (*((unsigned char *)v18 + 24)) {
      BOOL v9 = *((unsigned char *)v14 + 24) != 0;
    }
    else {
      BOOL v9 = 0;
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __63__PGMeaningPeopleCriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if (([v10 isMeNode] & 1) == 0)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v5 + 24))
    {
      char v6 = 1;
    }
    else
    {
      char v6 = [v10 isMyPartner];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(unsigned char *)(v5 + 24) = v6;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      char v8 = 1;
    }
    else
    {
      char v8 = [v10 isMyChild];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    *(unsigned char *)(v7 + 24) = v8;
    char v9 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v9) {
      char v9 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
    }
    *a3 = v9;
  }
}

@end