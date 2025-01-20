@interface WDListDefinitionTable
- (WDListDefinitionTable)initWithDocument:(id)a3;
- (id)addDefinitionWithDefinitionId:(int)a3 styleId:(id)a4;
- (id)definitionWithDefinitionId:(int)a3;
- (id)definitionWithStyleId:(id)a3;
- (id)definitions;
- (id)description;
- (id)resolvedDefinitionWithDefinitionId:(int)a3;
@end

@implementation WDListDefinitionTable

- (WDListDefinitionTable)initWithDocument:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WDListDefinitionTable;
  v5 = [(WDListDefinitionTable *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mListDefinitions = v6->mListDefinitions;
    v6->mListDefinitions = v7;

    uint64_t v9 = objc_opt_new();
    mListDefinitionMapById = v6->mListDefinitionMapById;
    v6->mListDefinitionMapById = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    mListDefinitionMapByStyleId = v6->mListDefinitionMapByStyleId;
    v6->mListDefinitionMapByStyleId = (NSMutableDictionary *)v11;

    v13 = [[WDListDefinition alloc] initWithDocument:v4 listDefinitionId:0xFFFFFFFFLL styleId:0];
    mNullListDefinition = v6->mNullListDefinition;
    v6->mNullListDefinition = v13;

    [(WDListDefinition *)v6->mNullListDefinition setType:0];
    v15 = [(WDListDefinition *)v6->mNullListDefinition addLevel];
    [v15 setNumberFormat:0];
    v16 = [v15 paragraphProperties];
    [v16 setFirstLineIndent:0];
    [v16 setLeadingIndent:0];
    [v16 setFollowingIndent:0];
    [v15 setSuffix:0];
    v17 = [[WDListDefinition alloc] initWithDocument:v4 listDefinitionId:4294967294 styleId:0];
    mDefaultListDefinition = v6->mDefaultListDefinition;
    v6->mDefaultListDefinition = v17;

    [(WDListDefinition *)v6->mDefaultListDefinition setType:1];
    id v24 = v4;
    for (uint64_t i = 1; i != 10; ++i)
    {
      v20 = [(WDListDefinition *)v6->mDefaultListDefinition addLevel];
      [v20 setStartNumber:1];
      [v20 setNumberFormat:0];
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%%%lu.", i);
      [v20 setText:v21];

      [v20 setJustification:0];
      v22 = [v20 paragraphProperties];
      [v22 setFirstLineIndent:4294966576];
      [v22 setLeadingIndent:(__int16)(720 * i)];
      v25[1] = 6;
      v25[0] = 720 * i;
      [v22 addTabStopAdded:v25];
    }
    id v4 = v24;
  }

  return v6;
}

- (id)definitions
{
  return self->mListDefinitions;
}

- (id)addDefinitionWithDefinitionId:(int)a3 styleId:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v4 == 0x80000000) {
    uint64_t v4 = [(NSMutableArray *)self->mListDefinitions count];
  }
  v7 = [WDListDefinition alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  uint64_t v9 = [(WDListDefinition *)v7 initWithDocument:WeakRetained listDefinitionId:v4 styleId:v6];

  [(NSMutableArray *)self->mListDefinitions addObject:v9];
  mListDefinitionMapById = self->mListDefinitionMapById;
  uint64_t v11 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)mListDefinitionMapById setObject:v9 forKeyedSubscript:v11];

  if (v6) {
    [(NSMutableDictionary *)self->mListDefinitionMapByStyleId setObject:v9 forKeyedSubscript:v6];
  }

  return v9;
}

- (id)definitionWithDefinitionId:(int)a3
{
  if (a3 == -1)
  {
    uint64_t v7 = 40;
  }
  else
  {
    mListDefinitionMapById = self->mListDefinitionMapById;
    v5 = objc_msgSend(NSNumber, "numberWithInt:");
    id v6 = [(NSMutableDictionary *)mListDefinitionMapById objectForKeyedSubscript:v5];

    if (v6) {
      goto LABEL_6;
    }
    uint64_t v7 = 48;
  }
  id v6 = *(id *)((char *)&self->super.isa + v7);
LABEL_6:
  return v6;
}

- (id)definitionWithStyleId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mListDefinitionMapByStyleId objectForKeyedSubscript:a3];
  return v3;
}

- (id)resolvedDefinitionWithDefinitionId:(int)a3
{
  uint64_t v4 = [(WDListDefinitionTable *)self definitionWithDefinitionId:*(void *)&a3];
  v5 = [(WDListDefinition *)v4 styleRefId];

  if (v5)
  {
    id v6 = [(WDListDefinition *)v4 styleRefId];
    uint64_t v7 = [(WDListDefinitionTable *)self definitionWithStyleId:v6];

    uint64_t v4 = (WDListDefinition *)v7;
    if (!v7) {
      uint64_t v4 = self->mNullListDefinition;
    }
  }
  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDListDefinitionTable;
  v2 = [(WDListDefinitionTable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultListDefinition, 0);
  objc_storeStrong((id *)&self->mNullListDefinition, 0);
  objc_storeStrong((id *)&self->mListDefinitionMapByStyleId, 0);
  objc_storeStrong((id *)&self->mListDefinitionMapById, 0);
  objc_storeStrong((id *)&self->mListDefinitions, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end