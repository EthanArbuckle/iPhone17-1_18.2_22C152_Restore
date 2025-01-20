@interface PDSequentialTimeNode
+ (id)newSequentialTimeNodeGroupForAnimationInfo;
+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3;
+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3 target:(id)a4;
+ (id)timeNodeUnion:(id)a3 initWithClass:(Class)a4;
+ (unint64_t)buildPartsFromTarget:(id)a3;
- (BOOL)concurrent;
- (NSMutableArray)nextConditions;
- (NSMutableArray)previousConditions;
- (NSString)groupId;
- (PDAnimationTarget)target;
- (double)delay;
- (double)direction;
- (id)level1ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3;
- (id)level2ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3 level1NodeIndex:(unint64_t)a4;
- (id)level3BehaviorAtNodeIndex:(unint64_t)a3 level2NodeIndex:(unint64_t)a4 level1NodeIndex:(unint64_t)a5;
- (int)iterateType;
- (int)nextAction;
- (int)presetClass;
- (int)presetId;
- (int)previousAction;
- (int)triggerType;
- (void)setConcurrent:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setDirection:(double)a3;
- (void)setGroupId:(id)a3;
- (void)setIterateType:(int)a3;
- (void)setLevel2ParallelAttribute:(id)a3;
- (void)setNextAction:(int)a3;
- (void)setNextConditions:(id)a3;
- (void)setPresetClass:(int)a3;
- (void)setPresetId:(int)a3;
- (void)setPreviousAction:(int)a3;
- (void)setPreviousConditions:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTriggerType:(int)a3;
@end

@implementation PDSequentialTimeNode

- (BOOL)concurrent
{
  return self->mConcurrent;
}

- (void)setConcurrent:(BOOL)a3
{
  self->mConcurrent = a3;
}

- (int)previousAction
{
  return self->mPreviousAction;
}

- (void)setPreviousAction:(int)a3
{
  self->mPreviousAction = a3;
}

- (int)nextAction
{
  return self->mNextAction;
}

- (void)setNextAction:(int)a3
{
  self->mNextAction = a3;
}

- (NSMutableArray)previousConditions
{
  return self->mPreviousConditions;
}

- (void)setPreviousConditions:(id)a3
{
}

- (NSMutableArray)nextConditions
{
  return self->mNextConditions;
}

- (void)setNextConditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNextConditions, 0);
  objc_storeStrong((id *)&self->mPreviousConditions, 0);
}

+ (id)timeNodeUnion:(id)a3 initWithClass:(Class)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(a4);
  if ((Class)objc_opt_class() == a4)
  {
    [v5 setBehavior:v6];
  }
  else if ((Class)objc_opt_class() == a4)
  {
    [v5 setCmdBehavior:v6];
  }
  else
  {
    v7 = [NSString stringWithUTF8String:"+[PDSequentialTimeNode(PDAnimationInfoAdditions) timeNodeUnion:initWithClass:]"];
    v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Dom/PDAnimationInfo.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:58 isFatal:0 description:"PDSequentialTimeNode::timeNodeUnion unsupported behavior class"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v9 = [v5 commonBehavior];

  return v9;
}

+ (unint64_t)buildPartsFromTarget:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = TSUDynamicCast(v4, (uint64_t)v3);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v5 drawable];
    v8 = TSUDynamicCast(v6, (uint64_t)v7);

    if (v8 && ([v8 textBody], v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      v10 = [v8 textBody];
      unint64_t v11 = [v10 nonEmptyParagraphCount];
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 1;
  }

  return v11;
}

+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3 target:(id)a4
{
  id v24 = a4;
  v25 = objc_alloc_init(PDSequentialTimeNode);
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PDTimeNode *)v25 setStartTimeConditions:v23];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PDTimeNode *)v25 setChildTimeNodeList:v4];
  uint64_t v5 = [a1 buildPartsFromTarget:v24];
  if (v5)
  {
    uint64_t v6 = &OBJC_METACLASS___PBPresentation;
    do
    {
      v7 = objc_alloc_init(PDTimeNodeUnion);
      [v4 addObject:v7];
      id v8 = objc_alloc_init(&v6[81]);
      [(PDTimeNodeUnion *)v7 setParallel:v8];
      v9 = objc_alloc_init(PDTimeCondition);
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v10 addObject:v9];
      [v8 setStartTimeConditions:v10];
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v8 setChildTimeNodeList:v11];
      v12 = objc_alloc_init(PDTimeNodeUnion);
      [v11 addObject:v12];
      id v13 = objc_alloc_init(&v6[81]);
      [(PDTimeNodeUnion *)v12 setParallel:v13];
      v33 = objc_alloc_init(PDIterate);
      [v13 setIterate:v33];
      v35 = v13;
      v34 = objc_alloc_init(PDTimeCondition);
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v28 = v5;
      [v14 addObject:v34];
      [v35 setStartTimeConditions:v14];
      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      v32 = v12;
      [v35 setChildTimeNodeList:v15];
      v16 = objc_alloc_init(PDTimeNodeUnion);
      v30 = v10;
      v31 = v9;
      v29 = v11;
      [v15 addObject:v16];
      v17 = [a1 timeNodeUnion:v16 initWithClass:a3];
      v18 = v8;
      id v19 = v4;
      v20 = objc_alloc_init(PDTimeCondition);
      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v21 addObject:v20];
      [v17 setStartTimeConditions:v21];

      uint64_t v5 = v28 - 1;
      id v4 = v19;
      uint64_t v6 = &OBJC_METACLASS___PBPresentation;
    }
    while (v28 != 1);
  }

  return v25;
}

+ (id)newSequentialTimeNodeGroupForAnimationInfo
{
  uint64_t v3 = objc_opt_class();
  return (id)[a1 newSequentialTimeNodeGroupForAnimationInfoWithClass:v3 target:0];
}

+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3
{
  return (id)[a1 newSequentialTimeNodeGroupForAnimationInfoWithClass:a3 target:0];
}

- (id)level1ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3
{
  id v4 = [(PDTimeNode *)self childTimeNodeList];
  if ([v4 count] <= a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndex:a3];
    uint64_t v6 = [v5 parallel];
  }
  return v6;
}

- (id)level2ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3 level1NodeIndex:(unint64_t)a4
{
  uint64_t v5 = [(PDSequentialTimeNode *)self level1ParallelTimeNodeGroupAtNodeIndex:a4];
  uint64_t v6 = [v5 childTimeNodeList];

  if ([v6 count] <= a3)
  {
    id v8 = 0;
  }
  else
  {
    v7 = [v6 objectAtIndex:a3];
    id v8 = [v7 parallel];
  }
  return v8;
}

- (id)level3BehaviorAtNodeIndex:(unint64_t)a3 level2NodeIndex:(unint64_t)a4 level1NodeIndex:(unint64_t)a5
{
  uint64_t v6 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:a4 level1NodeIndex:a5];
  v7 = [v6 childTimeNodeList];

  id v8 = [v7 objectAtIndex:a3];
  v9 = [v8 commonBehavior];

  return v9;
}

- (void)setTarget:(id)a3
{
  id v22 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = TSUDynamicCast(v4, (uint64_t)v22);
  v18 = [(PDTimeNode *)self childTimeNodeList];
  uint64_t v19 = [v18 count];
  if (v19)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      v7 = [(PDSequentialTimeNode *)self level1ParallelTimeNodeGroupAtNodeIndex:i];
      id v8 = [v7 childTimeNodeList];

      v20 = v8;
      uint64_t v21 = [v8 count];
      if (v21)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          id v10 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:j level1NodeIndex:i];
          id v11 = [v10 childTimeNodeList];

          uint64_t v12 = [v11 count];
          if (v12)
          {
            for (uint64_t k = 0; k != v12; ++k)
            {
              id v14 = [(PDSequentialTimeNode *)self level3BehaviorAtNodeIndex:k level2NodeIndex:j level1NodeIndex:i];
              id v15 = v14;
              if (v14)
              {
                if (v5)
                {
                  v16 = objc_alloc_init(PDAnimationTextTarget);
                  -[PDAnimationTextTarget setType:](v16, "setType:", [v5 type]);
                  v17 = [v5 drawable];
                  [(PDAnimationShapeTarget *)v16 setDrawable:v17];

                  -[PDAnimationTextTarget setRange:](v16, "setRange:", i, 1);
                  [v15 setTarget:v16];
                }
                else
                {
                  [v14 setTarget:v22];
                }
              }
            }
          }
        }
      }
    }
  }
}

- (PDAnimationTarget)target
{
  v2 = [(PDSequentialTimeNode *)self level3BehaviorAtNodeIndex:0 level2NodeIndex:0 level1NodeIndex:0];
  uint64_t v3 = [v2 target];

  return (PDAnimationTarget *)v3;
}

- (void)setLevel2ParallelAttribute:(id)a3
{
  uint64_t v12 = (void (**)(id, void *))a3;
  uint64_t v4 = [(PDTimeNode *)self childTimeNodeList];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v7 = [(PDSequentialTimeNode *)self level1ParallelTimeNodeGroupAtNodeIndex:i];
      id v8 = [v7 childTimeNodeList];

      uint64_t v9 = [v8 count];
      if (v9)
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          id v11 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:j level1NodeIndex:i];
          v12[2](v12, v11);
        }
      }
    }
  }
}

- (void)setPresetClass:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetClass___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  int v4 = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

uint64_t __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAnimationPresetClass:*(unsigned int *)(a1 + 32)];
}

- (int)presetClass
{
  v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  int v3 = [v2 animationPresetClass];

  return v3;
}

- (void)setPresetId:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetId___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  int v4 = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

uint64_t __62__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresetId:*(unsigned int *)(a1 + 32)];
}

- (int)presetId
{
  v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  int v3 = [v2 presetId];

  return v3;
}

- (void)setTriggerType:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setTriggerType___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  int v4 = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

uint64_t __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setTriggerType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setType:*(unsigned int *)(a1 + 32)];
}

- (int)triggerType
{
  v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  int v3 = [v2 type];

  return v3;
}

- (void)setIterateType:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setIterateType___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  int v4 = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

void __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setIterateType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  id v3 = [a2 iterate];
  [v3 setType:v2];
}

- (int)iterateType
{
  uint64_t v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  id v3 = [v2 iterate];
  int v4 = [v3 type];

  return v4;
}

- (void)setDelay:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__PDSequentialTimeNode_PDAnimationInfoAdditions__setDelay___block_invoke;
  v3[3] = &__block_descriptor_40_e28_v16__0__PDParallelTimeNode_8l;
  *(double *)&void v3[4] = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

void __59__PDSequentialTimeNode_PDAnimationInfoAdditions__setDelay___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 startTimeConditions];
  id v3 = [v4 objectAtIndex:0];
  [v3 setDelay:(int)*(double *)(a1 + 32)];
}

- (double)delay
{
  uint64_t v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  id v3 = [v2 startTimeConditions];

  id v4 = [v3 objectAtIndex:0];
  double v5 = (double)(int)[v4 delay];

  return v5;
}

- (void)setDirection:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__PDSequentialTimeNode_PDAnimationInfoAdditions__setDirection___block_invoke;
  v3[3] = &__block_descriptor_40_e28_v16__0__PDParallelTimeNode_8l;
  *(double *)&void v3[4] = a3;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v3];
}

uint64_t __63__PDSequentialTimeNode_PDAnimationInfoAdditions__setDirection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPresetSubType:(int)*(double *)(a1 + 32)];
}

- (double)direction
{
  uint64_t v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  double v3 = (double)(int)[v2 presetSubType];

  return v3;
}

- (void)setGroupId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__PDSequentialTimeNode_PDAnimationInfoAdditions__setGroupId___block_invoke;
  v6[3] = &unk_264D68618;
  id v7 = v4;
  id v5 = v4;
  [(PDSequentialTimeNode *)self setLevel2ParallelAttribute:v6];
}

uint64_t __61__PDSequentialTimeNode_PDAnimationInfoAdditions__setGroupId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGroupId:*(void *)(a1 + 32)];
}

- (NSString)groupId
{
  uint64_t v2 = [(PDSequentialTimeNode *)self level2ParallelTimeNodeGroupAtNodeIndex:0 level1NodeIndex:0];
  double v3 = [v2 groupId];

  return (NSString *)v3;
}

@end