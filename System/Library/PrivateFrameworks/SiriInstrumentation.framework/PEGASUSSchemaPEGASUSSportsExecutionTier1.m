@interface PEGASUSSchemaPEGASUSSportsExecutionTier1
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)athleteEntities;
- (NSArray)eventEntities;
- (NSArray)leagues;
- (NSArray)sportNames;
- (NSArray)teamEntities;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)athleteEntitiesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)eventEntitiesAtIndex:(unint64_t)a3;
- (id)leagueAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (id)teamEntitiesAtIndex:(unint64_t)a3;
- (int)sportNameAtIndex:(unint64_t)a3;
- (unint64_t)athleteEntitiesCount;
- (unint64_t)eventEntitiesCount;
- (unint64_t)hash;
- (unint64_t)leagueCount;
- (unint64_t)sportNameCount;
- (unint64_t)teamEntitiesCount;
- (void)addAthleteEntities:(id)a3;
- (void)addEventEntities:(id)a3;
- (void)addLeague:(id)a3;
- (void)addSportName:(int)a3;
- (void)addTeamEntities:(id)a3;
- (void)clearAthleteEntities;
- (void)clearEventEntities;
- (void)clearLeague;
- (void)clearSportName;
- (void)clearTeamEntities;
- (void)setAthleteEntities:(id)a3;
- (void)setEventEntities:(id)a3;
- (void)setLeagues:(id)a3;
- (void)setSportNames:(id)a3;
- (void)setTeamEntities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSSportsExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSSportsExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteSportName];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteLeague];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteAthleteEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteTeamEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteEventEntities];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteSportName];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteLeague];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteAthleteEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteTeamEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteEventEntities];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteSportName];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteLeague];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteAthleteEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteTeamEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteEventEntities];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteSportName];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteLeague];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteAthleteEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteTeamEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteEventEntities];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteSportName];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteLeague];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteAthleteEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteTeamEntities];
    [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self deleteEventEntities];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEntities, 0);
  objc_storeStrong((id *)&self->_teamEntities, 0);
  objc_storeStrong((id *)&self->_athleteEntities, 0);
  objc_storeStrong((id *)&self->_leagues, 0);
  objc_storeStrong((id *)&self->_sportNames, 0);
}

- (void)setEventEntities:(id)a3
{
}

- (NSArray)eventEntities
{
  return self->_eventEntities;
}

- (void)setTeamEntities:(id)a3
{
}

- (NSArray)teamEntities
{
  return self->_teamEntities;
}

- (void)setAthleteEntities:(id)a3
{
}

- (NSArray)athleteEntities
{
  return self->_athleteEntities;
}

- (void)setLeagues:(id)a3
{
}

- (NSArray)leagues
{
  return self->_leagues;
}

- (void)setSportNames:(id)a3
{
}

- (NSArray)sportNames
{
  return self->_sportNames;
}

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithDictionary:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PEGASUSSchemaPEGASUSSportsExecutionTier1;
  v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)&v70 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sportName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v67 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addSportName:](v5, "addSportName:", [v12 intValue]);
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v9);
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"league"];
    objc_opt_class();
    v49 = v13;
    if (objc_opt_isKindOfClass())
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v63 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v62 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = (void *)[v19 copy];
              [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)v5 addLeague:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v62 objects:v74 count:16];
        }
        while (v16);
      }
    }
    v21 = [v4 objectForKeyedSubscript:@"athleteEntities"];
    objc_opt_class();
    v48 = v21;
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v58 objects:v73 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v59;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v59 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v58 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = (void *)[v27 copy];
              [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)v5 addAthleteEntities:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v58 objects:v73 count:16];
        }
        while (v24);
      }
    }
    v29 = [v4 objectForKeyedSubscript:@"teamEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v72 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v55;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v55 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v54 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v36 = (void *)[v35 copy];
              [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)v5 addTeamEntities:v36];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v72 count:16];
        }
        while (v32);
      }
    }
    v37 = [v4 objectForKeyedSubscript:@"eventEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = v6;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v71 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v51;
        do
        {
          for (uint64_t n = 0; n != v40; ++n)
          {
            if (*(void *)v51 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v50 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v44 = (void *)[v43 copy];
              [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)v5 addEventEntities:v44];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v71 count:16];
        }
        while (v40);
      }

      v6 = v47;
    }
    v45 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_athleteEntities)
  {
    id v4 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self athleteEntities];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"athleteEntities"];
  }
  if (self->_eventEntities)
  {
    v6 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self eventEntities];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"eventEntities"];
  }
  if (self->_leagues)
  {
    uint64_t v8 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self leagues];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"league"];
  }
  if ([(NSArray *)self->_sportNames count])
  {
    uint64_t v10 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self sportNames];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"sportName"];
  }
  if (self->_teamEntities)
  {
    v12 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self teamEntities];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"teamEntities"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_sportNames hash];
  uint64_t v4 = [(NSArray *)self->_leagues hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_athleteEntities hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_teamEntities hash];
  return v6 ^ [(NSArray *)self->_eventEntities hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self sportNames];
  uint64_t v6 = [v4 sportNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self sportNames];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self sportNames];
    uint64_t v10 = [v4 sportNames];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self leagues];
  uint64_t v6 = [v4 leagues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self leagues];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self leagues];
    uint64_t v15 = [v4 leagues];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self athleteEntities];
  uint64_t v6 = [v4 athleteEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self athleteEntities];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self athleteEntities];
    v20 = [v4 athleteEntities];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self teamEntities];
  uint64_t v6 = [v4 teamEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self teamEntities];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self teamEntities];
    uint64_t v25 = [v4 teamEntities];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self eventEntities];
  uint64_t v6 = [v4 eventEntities];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self eventEntities];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self eventEntities];
    id v30 = [v4 eventEntities];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v5 = self->_sportNames;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v9) intValue];
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = self->_leagues;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = self->_athleteEntities;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_teamEntities;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v25 = self->_eventEntities;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSSportsExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (id)eventEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_eventEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)eventEntitiesCount
{
  return [(NSArray *)self->_eventEntities count];
}

- (void)addEventEntities:(id)a3
{
  id v4 = a3;
  eventEntities = self->_eventEntities;
  id v8 = v4;
  if (!eventEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_eventEntities;
    self->_eventEntities = v6;

    id v4 = v8;
    eventEntities = self->_eventEntities;
  }
  [(NSArray *)eventEntities addObject:v4];
}

- (void)clearEventEntities
{
}

- (id)teamEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_teamEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)teamEntitiesCount
{
  return [(NSArray *)self->_teamEntities count];
}

- (void)addTeamEntities:(id)a3
{
  id v4 = a3;
  teamEntities = self->_teamEntities;
  id v8 = v4;
  if (!teamEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_teamEntities;
    self->_teamEntities = v6;

    id v4 = v8;
    teamEntities = self->_teamEntities;
  }
  [(NSArray *)teamEntities addObject:v4];
}

- (void)clearTeamEntities
{
}

- (id)athleteEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_athleteEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)athleteEntitiesCount
{
  return [(NSArray *)self->_athleteEntities count];
}

- (void)addAthleteEntities:(id)a3
{
  id v4 = a3;
  athleteEntities = self->_athleteEntities;
  id v8 = v4;
  if (!athleteEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_athleteEntities;
    self->_athleteEntities = v6;

    id v4 = v8;
    athleteEntities = self->_athleteEntities;
  }
  [(NSArray *)athleteEntities addObject:v4];
}

- (void)clearAthleteEntities
{
}

- (id)leagueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_leagues objectAtIndexedSubscript:a3];
}

- (unint64_t)leagueCount
{
  return [(NSArray *)self->_leagues count];
}

- (void)addLeague:(id)a3
{
  id v4 = a3;
  leagues = self->_leagues;
  id v8 = v4;
  if (!leagues)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_leagues;
    self->_leagues = v6;

    id v4 = v8;
    leagues = self->_leagues;
  }
  [(NSArray *)leagues addObject:v4];
}

- (void)clearLeague
{
}

- (int)sportNameAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_sportNames objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)sportNameCount
{
  return [(NSArray *)self->_sportNames count];
}

- (void)addSportName:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sportNames = self->_sportNames;
  if (!sportNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sportNames;
    self->_sportNames = v6;

    sportNames = self->_sportNames;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)sportNames addObject:v8];
}

- (void)clearSportName
{
}

@end