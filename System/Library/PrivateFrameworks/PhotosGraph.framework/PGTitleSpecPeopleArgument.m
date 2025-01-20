@interface PGTitleSpecPeopleArgument
+ (id)argumentWithPeopleType:(unint64_t)a3;
+ (id)argumentWithPeopleType:(unint64_t)a3 personNodes:(id)a4;
- (NSSet)personNodes;
- (PGTitleSpecPeopleArgument)initWithPeopleType:(unint64_t)a3;
- (id)_birthdayTitleWithMomentNodes:(id)a3 serviceManager:(id)a4;
- (id)_groupTitleWithFeature:(id)a3 graph:(id)a4 allowedGroupsFormat:(unint64_t)a5;
- (id)_groupTitleWithMomentNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4;
- (id)_initWithPeopleType:(unint64_t)a3 personNodes:(id)a4;
- (id)_personNodesWithMomentNodes:(id)a3;
- (id)_personTitleWithFeature:(id)a3 graph:(id)a4 serviceManager:(id)a5;
- (id)_personTitleWithMomentNodes:(id)a3 serviceManager:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (unint64_t)type;
@end

@implementation PGTitleSpecPeopleArgument

- (void).cxx_destruct
{
}

- (NSSet)personNodes
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_personNodesWithMomentNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) personNodes];
        v10 = v9;
        if (v6)
        {
          [v6 intersectSet:v9];
        }
        else if ([v9 count])
        {
          v6 = (void *)[v10 mutableCopy];
        }
        else
        {
          v6 = 0;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_personTitleWithFeature:(id)a3 graph:(id)a4 serviceManager:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NSSet *)self->_personNodes count] == 1) {
    [(NSSet *)self->_personNodes anyObject];
  }
  else {
  v11 = [v8 nodeInGraph:v9];
  }
  if (v11)
  {
    long long v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    long long v13 = +[PGPeopleTitleUtility nameStringForPersonNodes:v12 includeMe:0 allowUnnamed:0 allowedGroupsFormat:0 insertLineBreaks:0 serviceManager:v10];
  }
  else
  {
    long long v14 = +[PGLogging sharedLogging];
    long long v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v8 description];
      int v18 = 138412290;
      v19 = v17;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", (uint8_t *)&v18, 0xCu);
    }
    long long v13 = 0;
  }

  return v13;
}

- (id)_personTitleWithMomentNodes:(id)a3 serviceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSSet *)self->_personNodes count])
  {
    id v8 = self->_personNodes;
  }
  else
  {
    id v8 = [(PGTitleSpecPeopleArgument *)self _personNodesWithMomentNodes:v6];
  }
  id v9 = v8;
  if ([(NSSet *)v8 count] > 2)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[PGPeopleTitleUtility nameStringForPersonNodes:v9 includeMe:0 allowUnnamed:0 allowedGroupsFormat:0 insertLineBreaks:0 serviceManager:v7];
  }

  return v10;
}

- (id)_groupTitleWithFeature:(id)a3 graph:(id)a4 allowedGroupsFormat:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 nodeInGraph:a4];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 personNodes];
    v11 = +[PGPeopleTitleUtility peopleGroupNameForPersonNodes:v10 allowedGroupsFormat:a5 fallbackToGeneric:a5 & 1];
  }
  else
  {
    long long v12 = +[PGLogging sharedLogging];
    long long v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [v7 description];
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", (uint8_t *)&v16, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_groupTitleWithMomentNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4
{
  unint64_t v5 = a4 & 1;
  id v6 = [(PGTitleSpecPeopleArgument *)self _personNodesWithMomentNodes:a3];
  id v7 = +[PGPeopleTitleUtility peopleGroupNameForPersonNodes:v6 allowedGroupsFormat:a4 fallbackToGeneric:v5];

  return v7;
}

- (id)_birthdayTitleWithMomentNodes:(id)a3 serviceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = self->_personNodes;
    if (![(NSSet *)v8 count])
    {
      id v9 = [PGGraphMomentNodeCollection alloc];
      id v10 = [v6 anyObject];
      v11 = [v10 graph];
      long long v12 = [(MAElementCollection *)v9 initWithSet:v6 graph:v11];

      long long v13 = [(PGGraphMomentNodeCollection *)v12 birthdayPersonNodes];
      uint64_t v14 = [v13 temporarySet];

      id v8 = (NSSet *)v14;
    }
    long long v15 = +[PGPeopleTitleUtility nameStringForPersonNodes:v8 includeMe:0 allowUnnamed:0 allowedGroupsFormat:0 insertLineBreaks:0 serviceManager:v7];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  v36 = v8;
  id v10 = [v8 anyObject];
  v11 = [v10 graph];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v13)
  {
    int v16 = 0;
    goto LABEL_30;
  }
  uint64_t v15 = v13;
  int v16 = 0;
  uint64_t v17 = *(void *)v40;
  uint64_t v18 = &OBJC_IVAR___PGHighlightEnrichmentValues__promotionScore;
  *(void *)&long long v14 = 138412290;
  long long v35 = v14;
  id v37 = v12;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v40 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v21 = objc_msgSend(v20, "type", v35);
      if (v21 == 3)
      {
        if (*(Class *)((char *)&self->super.super.isa + v18[229]) != (Class)4) {
          goto LABEL_25;
        }
        if ([(NSSet *)self->_personNodes count] == 1) {
          [(NSSet *)self->_personNodes anyObject];
        }
        else {
        v27 = [v20 nodeInGraph:v11];
        }
        v28 = v11;
        if (v27)
        {
          v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
          v30 = [v38 serviceManager];
          uint64_t v31 = +[PGPeopleTitleUtility nameStringForPersonNodes:v29 includeMe:0 allowUnnamed:0 allowedGroupsFormat:0 insertLineBreaks:0 serviceManager:v30];

          int v16 = (void *)v31;
        }
        else
        {
          v32 = +[PGLogging sharedLogging];
          v29 = [v32 loggingConnection];

          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v33 = [v20 description];
            *(_DWORD *)buf = v35;
            v44 = v33;
            _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", buf, 0xCu);
          }
        }

        v11 = v28;
        id v12 = v37;
        uint64_t v18 = &OBJC_IVAR___PGHighlightEnrichmentValues__promotionScore;
      }
      else
      {
        if (v21 != 2) {
          goto LABEL_25;
        }
        uint64_t v22 = *(uint64_t *)((char *)&self->super.super.isa + v18[229]);
        switch(v22)
        {
          case 3:
            v23 = self;
            v24 = v20;
            v25 = v11;
            uint64_t v26 = 2;
            break;
          case 2:
            v23 = self;
            v24 = v20;
            v25 = v11;
            uint64_t v26 = 8;
            break;
          case 1:
            v23 = self;
            v24 = v20;
            v25 = v11;
            uint64_t v26 = 1;
            break;
          default:
            goto LABEL_25;
        }
        [(PGTitleSpecPeopleArgument *)v23 _groupTitleWithFeature:v24 graph:v25 allowedGroupsFormat:v26];
        int v16 = v27 = v16;
      }

LABEL_25:
      if ([v16 length]) {
        goto LABEL_30;
      }
    }
    uint64_t v15 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v15);
LABEL_30:

  return v16;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  switch(self->_type)
  {
    case 0uLL:
      id v9 = [v7 serviceManager];
      uint64_t v10 = [(PGTitleSpecPeopleArgument *)self _personTitleWithMomentNodes:v6 serviceManager:v9];
      goto LABEL_9;
    case 1uLL:
      id v12 = self;
      id v13 = v6;
      uint64_t v14 = 1;
      goto LABEL_7;
    case 2uLL:
      id v12 = self;
      id v13 = v6;
      uint64_t v14 = 8;
      goto LABEL_7;
    case 3uLL:
      id v12 = self;
      id v13 = v6;
      uint64_t v14 = 2;
LABEL_7:
      v11 = [(PGTitleSpecPeopleArgument *)v12 _groupTitleWithMomentNodes:v13 allowedGroupsFormat:v14];
      break;
    case 4uLL:
      id v9 = [v7 serviceManager];
      uint64_t v10 = [(PGTitleSpecPeopleArgument *)self _birthdayTitleWithMomentNodes:v6 serviceManager:v9];
LABEL_9:
      v11 = (void *)v10;

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (PGTitleSpecPeopleArgument)initWithPeopleType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGTitleSpecPeopleArgument;
  result = [(PGTitleSpecPeopleArgument *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)_initWithPeopleType:(unint64_t)a3 personNodes:(id)a4
{
  id v7 = a4;
  id v8 = [(PGTitleSpecPeopleArgument *)self initWithPeopleType:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_personNodes, a4);
  }

  return v9;
}

+ (id)argumentWithPeopleType:(unint64_t)a3 personNodes:(id)a4
{
  id v5 = a4;
  id v6 = [[PGTitleSpecPeopleArgument alloc] _initWithPeopleType:a3 personNodes:v5];

  return v6;
}

+ (id)argumentWithPeopleType:(unint64_t)a3
{
  id v3 = [[PGTitleSpecPeopleArgument alloc] initWithPeopleType:a3];
  return v3;
}

@end