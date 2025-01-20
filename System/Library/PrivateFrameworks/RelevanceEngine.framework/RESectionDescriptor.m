@interface RESectionDescriptor
+ (id)defaultSectionDescriptorForIdentifier:(id)a3;
+ (id)defaultUpNextSectionDescriptorForIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)orderedRules;
- (NSSet)rules;
- (NSString)name;
- (REHistoricSectionDescriptor)historicSectionDescriptor;
- (RESectionDescriptor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxElementCount;
- (unint64_t)hash;
- (void)setHistoricSectionDescriptor:(id)a3;
- (void)setMaxElementCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOrderedRules:(id)a3;
- (void)setRules:(id)a3;
@end

@implementation RESectionDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setName:self->_name];
  [v4 setMaxElementCount:self->_maxElementCount];
  objc_storeStrong(v4 + 1, self->_rules);
  v5 = (void *)[(REHistoricSectionDescriptor *)self->_historicSectionDescriptor copy];
  [v4 setHistoricSectionDescriptor:v5];

  return v4;
}

- (void)setName:(id)a3
{
}

- (RESectionDescriptor)init
{
  v9.receiver = self;
  v9.super_class = (Class)RESectionDescriptor;
  v2 = [(RESectionDescriptor *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxElementCount = -1;
    name = v2->_name;
    v2->_name = (NSString *)&stru_26CFA57D0;

    uint64_t v5 = [MEMORY[0x263EFF9D8] orderedSet];
    rules = v3->_rules;
    v3->_rules = (NSOrderedSet *)v5;

    historicSectionDescriptor = v3->_historicSectionDescriptor;
    v3->_historicSectionDescriptor = 0;
  }
  return v3;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void)setHistoricSectionDescriptor:(id)a3
{
  v4 = (REHistoricSectionDescriptor *)[a3 copy];
  [(REHistoricSectionDescriptor *)self->_historicSectionDescriptor setParentDescriptor:0];
  historicSectionDescriptor = self->_historicSectionDescriptor;
  self->_historicSectionDescriptor = v4;
  v6 = v4;

  [(REHistoricSectionDescriptor *)self->_historicSectionDescriptor setParentDescriptor:self];
}

- (NSArray)orderedRules
{
  return [(NSOrderedSet *)self->_rules array];
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (REHistoricSectionDescriptor)historicSectionDescriptor
{
  return self->_historicSectionDescriptor;
}

- (void)setRules:(id)a3
{
  self->_rules = [MEMORY[0x263EFF9D8] orderedSetWithSet:a3];
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicSectionDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (NSSet)rules
{
  v2 = [(NSOrderedSet *)self->_rules set];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSString)name
{
  return self->_name;
}

REFilteringRule *__61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_super v9 = +[RECondition conditionHasValueForFeature:v8];
        v10 = +[RECondition conditionForFeature:v8 relation:-1 floatValue:3.18618444e-58];
        v22[0] = v9;
        v22[1] = v10;
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
        v12 = +[RECondition andConditions:v11];

        [v3 addObject:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  v13 = [REFilteringRule alloc];
  v14 = +[RECondition orConditions:v3];
  v15 = [(REFilteringRule *)v13 initWithCondition:v14];

  return v15;
}

id __61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_3(uint64_t a1)
{
  v71[2] = *MEMORY[0x263EF8340];
  id v2 = +[REFeature priorityFeature];
  uint64_t v3 = +[RECondition conditionHasValueForFeature:v2];

  uint64_t v4 = +[REFeature priorityFeature];
  uint64_t v5 = +[REFeature priorityFeature];
  v63 = +[REComparisonCondition conditionForLeftFeature:v4 relation:2 rightFeature:v5];

  uint64_t v6 = +[REFeature dataSourceFeature];
  v7 = +[REFeature dataSourceFeature];
  v62 = +[REComparisonCondition conditionForLeftFeature:v6 relation:0 rightFeature:v7];

  uint64_t v8 = [RERankingRule alloc];
  v71[0] = v63;
  v71[1] = v62;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  v10 = +[RECondition andConditions:v9];
  v61 = (void *)v3;
  v65 = [(RERankingRule *)v8 initWithLeftCondition:v3 rightCondition:v3 comparisonCondition:v10 order:1];

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = +[REFeature dateFeature];
  v60 = (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  uint64_t v13 = *(void *)(a1 + 32);
  v14 = +[REFeature locationFeature];
  v59 = (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  uint64_t v15 = *(void *)(a1 + 32);
  v16 = +[REFeature geofenceFeature];
  v58 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  v17 = +[REFeature dateFeature];
  v64 = +[RECondition conditionHasValueForFeature:v17];

  uint64_t v18 = *(void *)(a1 + 40);
  long long v19 = +[REFeature dateFeature];
  v70[0] = v19;
  long long v20 = +[REFeature locationFeature];
  v70[1] = v20;
  long long v21 = +[REFeature geofenceFeature];
  v70[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
  v57 = (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);

  LODWORD(v23) = 1157234688;
  [v57 setPriority:v23];
  uint64_t v24 = +[REFeature dailyRoutineFeature];
  uint64_t v25 = +[RECondition conditionHasValueForFeature:v24];

  v26 = +[REFeature isInDailyRoutineFeature];
  v27 = +[RECondition conditionForFeature:v26 hasBoolValue:1];
  v56 = +[RECondition notCondition:v27];

  v28 = [REFilteringRule alloc];
  v69[0] = v25;
  v69[1] = v56;
  v29 = (void *)v25;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
  v31 = +[RECondition andConditions:v30];
  v55 = [(REFilteringRule *)v28 initWithCondition:v31 type:0];

  v68[0] = v29;
  v32 = v29;
  v54 = v29;
  v33 = +[REFeature dailyRoutineFeature];
  v34 = +[RECondition conditionForFeature:v33 hasIntegerValue:0];
  v68[1] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
  v36 = +[RECondition andConditions:v35];

  v37 = [RERankingRule alloc];
  v38 = +[RECondition notCondition:v36];
  v39 = +[REComparisonCondition trueCondition];
  v53 = [(RERankingRule *)v37 initWithLeftCondition:v36 rightCondition:v38 comparisonCondition:v39 order:1];

  LODWORD(v40) = 1157226496;
  [(RERule *)v53 setPriority:v40];
  v67[0] = v32;
  v41 = +[REFeature dailyRoutineFeature];
  v42 = +[RECondition conditionForFeature:v41 hasIntegerValue:1];
  v67[1] = v42;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
  v44 = +[RECondition andConditions:v43];

  v45 = [RERankingRule alloc];
  v46 = +[REComparisonCondition trueCondition];
  v47 = [(RERankingRule *)v45 initWithLeftCondition:v64 rightCondition:v44 comparisonCondition:v46 order:1];

  v48 = [RERankingRule alloc];
  v49 = +[REComparisonCondition trueCondition];
  v50 = [(RERankingRule *)v48 initWithLeftCondition:v36 rightCondition:v44 comparisonCondition:v49 order:1];

  v66[0] = v60;
  v66[1] = v59;
  v66[2] = v58;
  v66[3] = v65;
  v66[4] = v57;
  v66[5] = v55;
  v66[6] = v53;
  v66[7] = v47;
  v66[8] = v50;
  id v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:9];

  return v52;
}

RERankingRule *__61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[RECondition conditionHasValueForFeature:v2];
  uint64_t v4 = +[REComparisonCondition conditionForLeftFeature:v2 relation:2 rightFeature:v2];

  uint64_t v5 = [[RERankingRule alloc] initWithLeftCondition:v3 rightCondition:v3 comparisonCondition:v4 order:1];
  LODWORD(v6) = 1157234688;
  [(RERule *)v5 setPriority:v6];

  return v5;
}

- (void)setOrderedRules:(id)a3
{
  self->_rules = [MEMORY[0x263EFF9D8] orderedSetWithArray:a3];
  MEMORY[0x270F9A758]();
}

+ (id)defaultSectionDescriptorForIdentifier:(id)a3
{
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_3;
  uint64_t v11 = &unk_2644BE868;
  id v12 = &__block_literal_global_29;
  id v13 = &__block_literal_global_82_0;
  id v3 = a3;
  uint64_t v4 = (void (**)(void))MEMORY[0x223C31700](&v8);
  uint64_t v5 = objc_alloc_init(RESectionDescriptor);
  double v6 = v4[2](v4);
  -[RESectionDescriptor setOrderedRules:](v5, "setOrderedRules:", v6, v8, v9, v10, v11);

  [(RESectionDescriptor *)v5 setName:v3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RESectionDescriptor *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      double v6 = v5;
      if (self->_maxElementCount == v5->_maxElementCount)
      {
        name = self->_name;
        uint64_t v8 = v5->_name;
        if (name == v8)
        {
        }
        else
        {
          uint64_t v9 = v8;
          v10 = name;
          int v11 = [(NSString *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_12;
          }
        }
        rules = self->_rules;
        v14 = v6->_rules;
        if (rules == v14)
        {
        }
        else
        {
          uint64_t v15 = v14;
          v16 = rules;
          int v17 = [(NSOrderedSet *)v16 isEqual:v15];

          if (!v17) {
            goto LABEL_12;
          }
        }
        historicSectionDescriptor = self->_historicSectionDescriptor;
        long long v19 = v6->_historicSectionDescriptor;
        long long v20 = historicSectionDescriptor;
        long long v21 = v20;
        if (v20 == v19) {
          char v12 = 1;
        }
        else {
          char v12 = [(REHistoricSectionDescriptor *)v20 isEqual:v19];
        }

        goto LABEL_18;
      }
LABEL_12:
      char v12 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  int64_t maxElementCount = self->_maxElementCount;
  NSUInteger v4 = [(NSString *)self->_name hash] ^ maxElementCount;
  uint64_t v5 = [(NSOrderedSet *)self->_rules hash];
  return v4 ^ v5 ^ [(REHistoricSectionDescriptor *)self->_historicSectionDescriptor hash];
}

+ (id)defaultUpNextSectionDescriptorForIdentifier:(id)a3
{
  NSUInteger v4 = (__CFString *)a3;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_3;
  v33[3] = &unk_2644BE868;
  id v34 = &__block_literal_global_57;
  id v35 = &__block_literal_global_5_0;
  uint64_t v5 = (void *)MEMORY[0x223C31700](v33);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_4;
  v31[3] = &unk_2644BFC80;
  id v6 = v5;
  id v32 = v6;
  v7 = (void *)MEMORY[0x223C31700](v31);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_6;
  v29[3] = &unk_2644BFC80;
  id v30 = &__block_literal_global_57;
  uint64_t v8 = (void *)MEMORY[0x223C31700](v29);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_7;
  v27[3] = &unk_2644BFC80;
  id v9 = v6;
  id v28 = v9;
  v10 = (void *)MEMORY[0x223C31700](v27);
  int v11 = v10;
  if (@"defaultSectionIdentifier" == v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_8;
    block[3] = &unk_2644BFCC8;
    id v24 = v7;
    id v25 = v8;
    id v26 = &__block_literal_global_14_3;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken != -1) {
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken, block);
    }
    id v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;

    uint64_t v15 = v24;
    goto LABEL_19;
  }
  if (@"allDaySectionIdentifier" == v4)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_9;
    v21[3] = &unk_2644BCBC0;
    id v22 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_18 != -1) {
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_18, v21);
    }
    id v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
    uint64_t v15 = v22;
    goto LABEL_19;
  }
  if (@"tomorrowSectionIdentifier" == v4)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_10;
    v19[3] = &unk_2644BCBC0;
    id v20 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_19 != -1) {
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_19, v19);
    }
    id v14 = (id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
    uint64_t v15 = v20;
    goto LABEL_19;
  }
  if (@"upcomingSectionIdentifier" == v4)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_11;
    v17[3] = &unk_2644BCBC0;
    id v18 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_20 != -1) {
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_20, v17);
    }
    id v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
    uint64_t v15 = v18;
LABEL_19:

    goto LABEL_20;
  }
  if ([(__CFString *)v4 isEqualToString:@"defaultSectionIdentifier"])
  {
    id v12 = a1;
    id v13 = @"defaultSectionIdentifier";
LABEL_29:
    id v14 = [v12 defaultSectionDescriptorForIdentifier:v13];
    goto LABEL_20;
  }
  if ([(__CFString *)v4 isEqualToString:@"allDaySectionIdentifier"])
  {
    id v12 = a1;
    id v13 = @"allDaySectionIdentifier";
    goto LABEL_29;
  }
  if ([(__CFString *)v4 isEqualToString:@"tomorrowSectionIdentifier"])
  {
    id v12 = a1;
    id v13 = @"tomorrowSectionIdentifier";
    goto LABEL_29;
  }
  if ([(__CFString *)v4 isEqualToString:@"upcomingSectionIdentifier"])
  {
    id v12 = a1;
    id v13 = @"upcomingSectionIdentifier";
    goto LABEL_29;
  }
  id v14 = 0;
LABEL_20:

  return v14;
}

RERankingRule *__90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[RECondition conditionHasValueForFeature:v2];
  NSUInteger v4 = +[REComparisonCondition conditionForLeftFeature:v2 relation:2 rightFeature:v2];

  uint64_t v5 = [[RERankingRule alloc] initWithLeftCondition:v3 rightCondition:v3 comparisonCondition:v4 order:1];
  LODWORD(v6) = 1157234688;
  [(RERule *)v5 setPriority:v6];

  return v5;
}

REFilteringRule *__90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = +[RECondition conditionHasValueForFeature:v8];
        v10 = +[RECondition conditionForFeature:v8 relation:-1 floatValue:3.18618444e-58];
        v22[0] = v9;
        v22[1] = v10;
        int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
        id v12 = +[RECondition andConditions:v11];

        [v3 addObject:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  id v13 = [REFilteringRule alloc];
  id v14 = +[RECondition orConditions:v3];
  uint64_t v15 = [(REFilteringRule *)v13 initWithCondition:v14];

  return v15;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_3(uint64_t a1)
{
  v274[2] = *MEMORY[0x263EF8340];
  id v2 = +[REFeature priorityFeature];
  uint64_t v3 = +[RECondition conditionHasValueForFeature:v2];

  uint64_t v4 = +[REFeature priorityFeature];
  uint64_t v5 = +[REFeature priorityFeature];
  v224 = +[REComparisonCondition conditionForLeftFeature:v4 relation:2 rightFeature:v5];

  uint64_t v6 = +[REFeature dataSourceFeature];
  v7 = +[REFeature dataSourceFeature];
  v223 = +[REComparisonCondition conditionForLeftFeature:v6 relation:0 rightFeature:v7];

  uint64_t v8 = [RERankingRule alloc];
  v274[0] = v224;
  v274[1] = v223;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v274 count:2];
  v10 = +[RECondition andConditions:v9];
  v222 = (void *)v3;
  v245 = [(RERankingRule *)v8 initWithLeftCondition:v3 rightCondition:v3 comparisonCondition:v10 order:1];

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = +[REFeature dateFeature];
  v244 = (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = +[REFeature locationFeature];
  v243 = (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  uint64_t v15 = *(void *)(a1 + 32);
  v16 = +[REFeature geofenceFeature];
  v242 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  int v17 = +[REFeature dateFeature];
  v239 = +[RECondition conditionHasValueForFeature:v17];

  long long v18 = +[REFeature dateFeature];
  LODWORD(v19) = 1064682127;
  v221 = +[RECondition conditionForFeature:v18 relation:2 floatValue:v19];

  long long v20 = [RERankingRule alloc];
  v273[0] = v239;
  v273[1] = v221;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v273 count:2];
  id v22 = +[RECondition andConditions:v21];
  double v23 = +[RECondition notCondition:v239];
  uint64_t v24 = +[REComparisonCondition trueCondition];
  v241 = [(RERankingRule *)v20 initWithLeftCondition:v22 rightCondition:v23 comparisonCondition:v24 order:1];

  id v25 = +[REFeature sessionFeature];
  v220 = +[RECondition conditionHasValueForFeature:v25];

  id v26 = [RERankingRule alloc];
  v27 = +[RECondition notCondition:v220];
  id v28 = +[REComparisonCondition trueCondition];
  v240 = [(RERankingRule *)v26 initWithLeftCondition:v220 rightCondition:v27 comparisonCondition:v28 order:1];

  LODWORD(v29) = 1157234688;
  [(RERule *)v240 setPriority:v29];
  uint64_t v30 = *(void *)(a1 + 40);
  v31 = +[REFeature dateFeature];
  v272[0] = v31;
  id v32 = +[REFeature locationFeature];
  v272[1] = v32;
  v33 = +[REFeature geofenceFeature];
  v272[2] = v33;
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v272 count:3];
  v238 = (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v34);

  LODWORD(v35) = 1157234688;
  [v238 setPriority:v35];
  v36 = +[REFeature dailyRoutineFeature];
  uint64_t v37 = +[RECondition conditionHasValueForFeature:v36];

  v38 = +[REFeature isInDailyRoutineFeature];
  v39 = +[RECondition conditionForFeature:v38 hasBoolValue:1];
  v219 = +[RECondition notCondition:v39];

  double v40 = [REFilteringRule alloc];
  v271[0] = v37;
  v271[1] = v219;
  uint64_t v41 = v37;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v271 count:2];
  v43 = +[RECondition andConditions:v42];
  v237 = [(REFilteringRule *)v40 initWithCondition:v43 type:0];

  v270[0] = v37;
  v218 = (void *)v37;
  v44 = +[REFeature dailyRoutineFeature];
  v45 = +[RECondition conditionForFeature:v44 hasIntegerValue:0];
  v270[1] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v270 count:2];
  uint64_t v47 = +[RECondition andConditions:v46];

  v48 = [RERankingRule alloc];
  v49 = +[RECondition notCondition:v47];
  v50 = +[REComparisonCondition trueCondition];
  v217 = (void *)v47;
  v236 = [(RERankingRule *)v48 initWithLeftCondition:v47 rightCondition:v49 comparisonCondition:v50 order:1];

  LODWORD(v51) = 1157226496;
  [(RERule *)v236 setPriority:v51];
  v269[0] = v41;
  id v52 = +[REFeature dailyRoutineFeature];
  v53 = +[RECondition conditionForFeature:v52 hasIntegerValue:1];
  v269[1] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v269 count:2];
  uint64_t v55 = +[RECondition andConditions:v54];

  v56 = [RERankingRule alloc];
  v57 = +[REComparisonCondition trueCondition];
  v216 = (void *)v55;
  v235 = [(RERankingRule *)v56 initWithLeftCondition:v239 rightCondition:v55 comparisonCondition:v57 order:1];

  v58 = [RERankingRule alloc];
  v59 = +[REComparisonCondition trueCondition];
  v234 = [(RERankingRule *)v58 initWithLeftCondition:v47 rightCondition:v55 comparisonCondition:v59 order:1];

  uint64_t v60 = +[REFeature conditionalFeature];
  v268[0] = +[RECondition conditionHasValueForFeature:v60];
  uint64_t v61 = v268[0];
  v213 = (void *)v268[0];
  v214 = (void *)v60;
  LODWORD(v62) = 953267991;
  v63 = +[RECondition conditionForFeature:v60 relation:-1 floatValue:v62];
  v268[1] = v63;
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v268 count:2];
  v215 = +[RECondition andConditions:v64];

  v233 = [[REFilteringRule alloc] initWithCondition:v215 type:0];
  v267[0] = v61;
  LODWORD(v65) = 953267991;
  v66 = +[RECondition conditionForFeature:v60 relation:2 floatValue:v65];
  v267[1] = v66;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v267 count:2];
  v212 = +[RECondition andConditions:v67];

  v232 = [[REFilteringRule alloc] initWithCondition:v212 type:1];
  v68 = +[REFeature noContentFeature];
  v211 = +[RECondition conditionHasValueForFeature:v68];

  v69 = +[REFeature noContentFeature];
  v210 = +[RECondition conditionForFeature:v69 hasBoolValue:1];

  v70 = [REFilteringRule alloc];
  v266[0] = v211;
  v266[1] = v210;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v266 count:2];
  v72 = +[RECondition andConditions:v71];
  v231 = [(REFilteringRule *)v70 initWithCondition:v72 type:1];

  v73 = +[REFeature isDeveloperDonationFeature];
  v209 = +[RECondition conditionHasValueForFeature:v73];

  v74 = [RERankingRule alloc];
  v75 = +[RECondition notCondition:v209];
  v76 = +[REComparisonCondition trueCondition];
  v230 = [(RERankingRule *)v74 initWithLeftCondition:v209 rightCondition:v75 comparisonCondition:v76 order:1];

  LODWORD(v77) = 1157275648;
  [(RERule *)v230 setPriority:v77];
  uint64_t v78 = +[REFeature siriActionRoleFeature];
  uint64_t v79 = +[REFeature siriActionDailyAveragePerformedCountFeature];
  v80 = [REFilteringRule alloc];
  v81 = +[RECondition conditionHasValueForFeature:v78];
  v265[0] = v81;
  v82 = +[RECondition conditionForFeature:v78 hasIntegerValue:0];
  v265[1] = v82;
  v206 = (void *)v79;
  LODWORD(v83) = 1039516303;
  v84 = +[RECondition conditionForFeature:v79 relation:-1 floatValue:v83];
  v265[2] = v84;
  v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v265 count:3];
  v86 = +[RECondition andConditions:v85];
  v229 = [(REFilteringRule *)v80 initWithCondition:v86];

  v207 = +[REFeature siriActionHasRelevanceProvidersFeature];
  v87 = [REFilteringRule alloc];
  v208 = (void *)v78;
  v88 = +[RECondition conditionHasValueForFeature:v78];
  v264[0] = v88;
  v89 = +[RECondition conditionHasValueForFeature:v207];
  v264[1] = v89;
  v90 = +[RECondition conditionForFeature:v78 hasIntegerValue:0];
  v264[2] = v90;
  LODWORD(v91) = 1039516303;
  v92 = +[RECondition conditionForFeature:v79 relation:-1 floatValue:v91];
  v264[3] = v92;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v264 count:4];
  v94 = +[RECondition andConditions:v93];
  v227 = [(REFilteringRule *)v87 initWithCondition:v94];

  v228 = +[REFeature workoutStateFeature];
  v95 = [REFilteringRule alloc];
  v96 = +[RECondition conditionHasValueForFeature:v228];
  v263[0] = v96;
  v97 = +[RECondition conditionForFeature:v228 hasBoolValue:0];
  v263[1] = v97;
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v263 count:2];
  v99 = +[RECondition andConditions:v98];
  v226 = [(REFilteringRule *)v95 initWithCondition:v99 type:0];

  v246 = +[REFeature dailyAverageWorkoutCountFeature];
  v100 = +[RECondition conditionHasValueForFeature:v246];
  v262[0] = v100;
  v101 = +[REFeature performedWorkoutCountFeature];
  v102 = +[RECondition conditionHasValueForFeature:v101];
  v262[1] = v102;
  v103 = +[REFeature performedWorkoutCountFeature];
  v104 = +[REFeature dailyAverageWorkoutCountFeature];
  v105 = +[REFeatureTransformer roundTransformer];
  v106 = [v104 featureByUsingTransformer:v105];
  v107 = +[RECondition conditionForFeature:v103 relation:1 feature:v106];
  v262[2] = v107;
  v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v262 count:3];
  v205 = +[RECondition andConditions:v108];

  v109 = [REFilteringRule alloc];
  v110 = +[RECondition conditionHasValueForFeature:v228];
  v261[0] = v110;
  v261[1] = v205;
  v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:v261 count:2];
  v112 = +[RECondition andConditions:v111];
  v204 = [(REFilteringRule *)v109 initWithCondition:v112 type:0];

  v113 = [REFilteringRule alloc];
  v114 = +[REFeature isDeveloperDonationFeature];
  v115 = +[RECondition conditionHasValueForFeature:v114];
  v260[0] = v115;
  v116 = +[REFeature isDeveloperDonationFeature];
  v117 = +[RECondition conditionForFeature:v116 hasBoolValue:1];
  v260[1] = v117;
  v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:v260 count:2];
  v119 = +[RECondition andConditions:v118];
  v203 = [(REFilteringRule *)v113 initWithCondition:v119 type:1];

  LODWORD(v120) = 1157275648;
  [(RERule *)v203 setPriority:v120];
  v121 = +[REFeature nowPlayingStateFeature];
  v122 = +[RECondition conditionHasValueForFeature:v121];
  v259[0] = v122;
  v123 = +[REFeature nowPlayingStateFeature];
  v124 = +[RECondition conditionForFeature:v123 hasBoolValue:0];
  v259[1] = v124;
  v125 = [MEMORY[0x263EFF8C0] arrayWithObjects:v259 count:2];
  v225 = +[RECondition andConditions:v125];

  v126 = +[REFeature isSiriActionFeature];
  v127 = +[RECondition conditionHasValueForFeature:v126];
  v258[0] = v127;
  v128 = +[REFeature isSiriActionFeature];
  v129 = +[RECondition conditionForFeature:v128 hasBoolValue:1];
  v258[1] = v129;
  v130 = [MEMORY[0x263EFF8C0] arrayWithObjects:v258 count:2];
  v247 = +[RECondition andConditions:v130];

  v257[0] = v247;
  v131 = +[REFeature siriActionRoleFeature];
  v132 = +[RECondition conditionHasValueForFeature:v131];
  v257[1] = v132;
  v133 = +[REFeature siriActionRoleFeature];
  v134 = +[RECondition conditionForFeature:v133 hasIntegerValue:1];
  v257[2] = v134;
  v135 = [MEMORY[0x263EFF8C0] arrayWithObjects:v257 count:3];
  v136 = +[RECondition andConditions:v135];

  v137 = +[REFeature siriActionHasRelevanceProvidersFeature];
  v138 = +[RECondition conditionHasValueForFeature:v137];
  v256[0] = v138;
  v139 = +[REFeature siriActionHasRelevanceProvidersFeature];
  v140 = +[RECondition conditionForFeature:v139 hasBoolValue:1];
  v256[1] = v140;
  v141 = [MEMORY[0x263EFF8C0] arrayWithObjects:v256 count:2];
  uint64_t v142 = +[RECondition andConditions:v141];

  v255[0] = v247;
  v143 = +[RECondition notCondition:v136];
  v255[1] = v143;
  v255[2] = v142;
  v201 = (void *)v142;
  LODWORD(v144) = 1038174126;
  v145 = +[RECondition conditionForProbabilityForInteraction:@"app-action" relation:-2 floatValue:v144];
  v255[3] = v145;
  v146 = [MEMORY[0x263EFF8C0] arrayWithObjects:v255 count:4];
  v202 = +[RECondition andConditions:v146];

  v200 = [[REFilteringRule alloc] initWithCondition:v202];
  LODWORD(v147) = 1149009920;
  [(RERule *)v200 setPriority:v147];
  v254[0] = v247;
  v148 = +[RECondition notCondition:v136];
  v254[1] = v148;
  v149 = +[RECondition notCondition:v142];
  v254[2] = v149;
  LODWORD(v150) = 1045220557;
  v151 = +[RECondition conditionForProbabilityForInteraction:@"app-action" relation:-2 floatValue:v150];
  v254[3] = v151;
  v152 = [MEMORY[0x263EFF8C0] arrayWithObjects:v254 count:4];
  v199 = +[RECondition andConditions:v152];

  v198 = [[REFilteringRule alloc] initWithCondition:v199];
  LODWORD(v153) = 1148993536;
  [(RERule *)v198 setPriority:v153];
  v154 = +[REFeature relevanceThresholdFeature];
  v155 = +[RECondition conditionHasValueForFeature:v154];
  v253[0] = v155;
  v156 = +[REFeature relevanceThresholdFeature];
  v157 = +[RECondition conditionForProbabilityForInteraction:0 relation:-2 feature:v156];
  v253[1] = v157;
  v158 = [MEMORY[0x263EFF8C0] arrayWithObjects:v253 count:2];
  v197 = +[RECondition andConditions:v158];

  v196 = [[REFilteringRule alloc] initWithCondition:v197];
  LODWORD(v159) = 1148977152;
  [(RERule *)v196 setPriority:v159];
  v160 = [REFilteringRule alloc];
  v252[0] = v225;
  LODWORD(v161) = 1054280253;
  v162 = +[RECondition conditionForProbabilityWithRelation:-2 floatValue:v161];
  v252[1] = v162;
  v163 = [MEMORY[0x263EFF8C0] arrayWithObjects:v252 count:2];
  v164 = +[RECondition andConditions:v163];
  v195 = [(REFilteringRule *)v160 initWithCondition:v164];

  LODWORD(v165) = 1148960768;
  [(RERule *)v195 setPriority:v165];
  v166 = [REFilteringRule alloc];
  v251[0] = v136;
  LODWORD(v167) = 1045220557;
  v168 = +[RECondition conditionForProbabilityWithRelation:-2 floatValue:v167];
  v251[1] = v168;
  v169 = [MEMORY[0x263EFF8C0] arrayWithObjects:v251 count:2];
  v170 = +[RECondition andConditions:v169];
  v171 = [(REFilteringRule *)v166 initWithCondition:v170];

  LODWORD(v172) = 1148944384;
  v193 = v171;
  [(RERule *)v171 setPriority:v172];
  v173 = [REFilteringRule alloc];
  v250[0] = v247;
  LODWORD(v174) = 1041865114;
  v175 = +[RECondition conditionForProbabilityWithRelation:-2 floatValue:v174];
  v250[1] = v175;
  v176 = [MEMORY[0x263EFF8C0] arrayWithObjects:v250 count:2];
  v177 = +[RECondition andConditions:v176];
  v194 = [(REFilteringRule *)v173 initWithCondition:v177];

  LODWORD(v178) = 1148928000;
  [(RERule *)v171 setPriority:v178];
  v179 = [REFilteringRule alloc];
  LODWORD(v180) = 1034147594;
  v181 = +[RECondition conditionForProbabilityWithRelation:-2 floatValue:v180];
  v192 = [(REFilteringRule *)v179 initWithCondition:v181];

  v182 = [REFilteringRule alloc];
  v183 = +[REFeature activitySummaryFeature];
  v184 = +[RECondition conditionHasValueForFeature:v183];
  v249[0] = v184;
  v185 = +[REFeature activitySummaryFeature];
  v186 = +[RECondition conditionForFeature:v185 hasBoolValue:0];
  v249[1] = v186;
  v187 = [MEMORY[0x263EFF8C0] arrayWithObjects:v249 count:2];
  v188 = +[RECondition andConditions:v187];
  v189 = [(REFilteringRule *)v182 initWithCondition:v188 type:0];

  v248[0] = v244;
  v248[1] = v243;
  v248[2] = v242;
  v248[3] = v245;
  v248[4] = v238;
  v248[5] = v240;
  v248[6] = v241;
  v248[7] = v237;
  v248[8] = v236;
  v248[9] = v235;
  v248[10] = v234;
  v248[11] = v231;
  v248[12] = v233;
  v248[13] = v232;
  v248[14] = v230;
  v248[15] = v229;
  v248[16] = v227;
  v248[17] = v226;
  v248[18] = v204;
  v248[19] = v203;
  v248[20] = v200;
  v248[21] = v198;
  v248[22] = v196;
  v248[23] = v195;
  v248[24] = v193;
  v248[25] = v194;
  v248[26] = v192;
  v248[27] = v189;
  id v191 = [MEMORY[0x263EFF8C0] arrayWithObjects:v248 count:28];

  return v191;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_4(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v2 = +[REFeature dateOccursTodayFeature];
  uint64_t v3 = +[RECondition conditionHasValueForFeature:v2];

  uint64_t v4 = +[REFeature dateOccursTodayFeature];
  uint64_t v5 = +[RECondition conditionForFeature:v4 hasBoolValue:0];

  uint64_t v6 = [REFilteringRule alloc];
  v15[0] = v3;
  v15[1] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  uint64_t v8 = +[RECondition andConditions:v7];
  id v9 = [(REFilteringRule *)v6 initWithCondition:v8];

  v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v14 = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v12 = [v10 arrayByAddingObjectsFromArray:v11];

  return v12;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_5()
{
  v59[2] = *MEMORY[0x263EF8340];
  v0 = +[REFeature currentlyPlayingMediaDonationFeature];
  v49 = +[RECondition conditionHasValueForFeature:v0];

  v1 = +[REFeature currentlyPlayingMediaDonationFeature];
  v48 = +[RECondition conditionForFeature:v1 hasBoolValue:1];

  id v2 = [REFilteringRule alloc];
  v59[0] = v49;
  v59[1] = v48;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
  uint64_t v4 = +[RECondition andConditions:v3];
  uint64_t v47 = [(REFilteringRule *)v2 initWithCondition:v4 type:0];

  uint64_t v5 = +[REFeature isSiriActionFeature];
  uint64_t v6 = +[RECondition conditionHasValueForFeature:v5];
  v58[0] = v6;
  v7 = +[REFeature isSiriActionFeature];
  uint64_t v8 = +[RECondition conditionForFeature:v7 hasBoolValue:1];
  v58[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  v46 = +[RECondition andConditions:v9];

  v45 = +[RECondition notCondition:v46];
  v10 = +[REFeature dateFeature];
  uint64_t v11 = +[RECondition conditionHasValueForFeature:v10];
  v57[0] = v11;
  id v12 = +[REFeature dateOccursTodayFeature];
  uint64_t v13 = +[RECondition conditionHasValueForFeature:v12];
  v57[1] = v13;
  id v14 = +[REFeature dateFeature];
  uint64_t v15 = +[RECondition conditionForFeature:v14 relation:2 floatValue:0.0];
  v57[2] = v15;
  v16 = +[REFeature dateOccursTodayFeature];
  int v17 = +[RECondition conditionForFeature:v16 hasBoolValue:1];
  v57[3] = v17;
  long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];
  v50 = +[RECondition andConditions:v18];

  double v19 = +[REFeature locationFeature];
  long long v20 = +[RECondition conditionHasValueForFeature:v19];
  v56[0] = v20;
  long long v21 = +[REFeature locationFeature];
  id v22 = +[RECondition conditionForFeature:v21 relation:2 floatValue:0.0];
  v56[1] = v22;
  double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  v44 = +[RECondition andConditions:v23];

  uint64_t v24 = +[REFeature geofenceFeature];
  id v25 = +[RECondition conditionHasValueForFeature:v24];
  v55[0] = v25;
  id v26 = +[REFeature geofenceFeature];
  v27 = +[RECondition conditionForFeature:v26 relation:2 floatValue:0.0];
  v55[1] = v27;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  v43 = +[RECondition andConditions:v28];

  double v29 = [REFilteringRule alloc];
  v54[0] = v45;
  v54[1] = v50;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  v31 = +[RECondition andConditions:v30];
  id v32 = [(REFilteringRule *)v29 initWithCondition:v31 type:1];

  v33 = [REFilteringRule alloc];
  v53[0] = v45;
  v53[1] = v44;
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  double v35 = +[RECondition andConditions:v34];
  v36 = [(REFilteringRule *)v33 initWithCondition:v35 type:1];

  uint64_t v37 = [REFilteringRule alloc];
  v52[0] = v45;
  v52[1] = v43;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  v39 = +[RECondition andConditions:v38];
  double v40 = [(REFilteringRule *)v37 initWithCondition:v39 type:1];

  v51[0] = v47;
  v51[1] = v32;
  v51[2] = v36;
  v51[3] = v40;
  uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];

  return v41;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_6(uint64_t a1)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v2 = +[REFeature recentSiriActionFeature];
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = +[REFeature dateFeature];
  uint64_t v5 = +[REComparisonCondition conditionForLeftFeature:v2 relation:2 rightFeature:v4];
  uint64_t v6 = [RERankingRule alloc];
  v7 = +[RECondition conditionHasValueForFeature:v2];
  uint64_t v8 = +[RECondition conditionHasValueForFeature:v4];
  id v9 = [(RERankingRule *)v6 initWithLeftCondition:v7 rightCondition:v8 comparisonCondition:v5 order:1];

  LODWORD(v10) = 1157234688;
  [(RERule *)v9 setPriority:v10];
  v13[0] = v3;
  v13[1] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_7(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = [REFilteringRule alloc];
  uint64_t v3 = +[RECondition trueCondition];
  uint64_t v4 = [(REFilteringRule *)v2 initWithCondition:v3 type:1];

  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v9[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_8(void *a1)
{
  id v2 = objc_alloc_init(RESectionDescriptor);
  uint64_t v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor = (uint64_t)v2;

  [(id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor setName:@"defaultSectionIdentifier"];
  [(id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor setMaxElementCount:-1];
  uint64_t v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
  uint64_t v5 = (*(void (**)(void))(a1[4] + 16))();
  [v4 setOrderedRules:v5];

  uint64_t v6 = objc_alloc_init(REHistoricSectionDescriptor);
  [(REHistoricSectionDescriptor *)v6 setMaxElementCount:-1];
  v7 = [(id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor orderedRules];
  [(REHistoricSectionDescriptor *)v6 setOrderedRules:v7];

  [(REHistoricSectionDescriptor *)v6 setInvertsRanking:1];
  [(id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor setHistoricSectionDescriptor:v6];
  uint64_t v8 = (void (**)(void))MEMORY[0x223C31700](a1[5]);
  if (v8)
  {
    id v9 = [(REHistoricSectionDescriptor *)v6 orderedRules];
    double v10 = v8[2](v8);
    uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];
    [(REHistoricSectionDescriptor *)v6 setOrderedRules:v11];
  }
  v16 = (void (**)(void))MEMORY[0x223C31700](a1[6]);
  if (v16)
  {
    id v12 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
    uint64_t v13 = [(id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor orderedRules];
    id v14 = v16[2]();
    uint64_t v15 = [v13 arrayByAddingObjectsFromArray:v14];
    [v12 setOrderedRules:v15];
  }
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_9(uint64_t a1)
{
  id v2 = objc_alloc_init(RESectionDescriptor);
  uint64_t v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor = (uint64_t)v2;

  [(id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor setName:@"allDaySectionIdentifier"];
  [(id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor setMaxElementCount:-1];
  uint64_t v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setOrderedRules:v5];
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_10(uint64_t a1)
{
  id v2 = objc_alloc_init(RESectionDescriptor);
  uint64_t v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor = (uint64_t)v2;

  [(id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor setName:@"tomorrowSectionIdentifier"];
  [(id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor setMaxElementCount:-1];
  uint64_t v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setOrderedRules:v5];
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_11(uint64_t a1)
{
  id v2 = objc_alloc_init(RESectionDescriptor);
  uint64_t v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor = (uint64_t)v2;

  [(id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor setName:@"upcomingSectionIdentifier"];
  [(id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor setMaxElementCount:-1];
  uint64_t v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setOrderedRules:v5];
}

@end