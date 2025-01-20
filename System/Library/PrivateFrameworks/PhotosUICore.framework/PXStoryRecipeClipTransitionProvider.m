@interface PXStoryRecipeClipTransitionProvider
- ($7F31FC32F9D1B293069C8DA058A10F41)_nextTransitionFromTable:(SEL)a3 currentMotion:(id)a4 nextMotion:(id *)a5;
- ($7F31FC32F9D1B293069C8DA058A10F41)nextIntraMomentTransition;
- (BOOL)_cameraMovement:(int64_t)a3 allowsTransition:(int64_t)a4;
- (PFStoryAutoEditConfiguration)configuration;
- (PXStoryRecipeClipTransitionProvider)init;
- (PXStoryRecipeClipTransitionProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6;
- (int64_t)songPace;
- (void)provideTransitionsForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5;
@end

@implementation PXStoryRecipeClipTransitionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_interModuleTransitionTable, 0);
  objc_storeStrong((id *)&self->_nUpTransitionTable, 0);
  objc_storeStrong((id *)&self->_portraitTransitionTable, 0);
  objc_storeStrong((id *)&self->_interMomentTransitionTable, 0);
  objc_storeStrong((id *)&self->_baseTransitionTable, 0);
}

- (int64_t)songPace
{
  return self->_songPace;
}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (void)provideTransitionsForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  NSUInteger v9 = length - 1;
  NSUInteger v39 = length - 1 + location;
  v40 = a5;
  if (!__CFADD__(length - 1, location))
  {
    int v10 = 0;
    p_interModuleTransitionTable = &self->_interModuleTransitionTable;
    v38 = v8;
    do
    {
      unint64_t v11 = location + 1;
      unint64_t v12 = objc_msgSend(v8, "numberOfClips", p_interModuleTransitionTable);
      v13 = [v8 clipAtIndex:location];
      if (location + 1 >= v12)
      {
        v14 = 0;
      }
      else
      {
        v14 = [v8 clipAtIndex:location + 1];
      }
      v15 = [v13 displayAssets];
      uint64_t v16 = [v15 count];

      unint64_t v42 = v16;
      v43 = v14;
      if (v11 >= v12)
      {
        uint64_t v18 = [v13 moduleInfo];
        [v13 moduleInfo];
        char v21 = v24;
        uint64_t v19 = 0;
        int v23 = 0;
        BOOL v44 = 1;
      }
      else
      {
        v17 = [v14 displayAssets];
        BOOL v44 = (unint64_t)[v17 count] < 2;

        uint64_t v18 = [v13 moduleInfo];
        uint64_t v19 = [v14 moduleInfo];
        [v13 moduleInfo];
        char v21 = v20;
        [v14 moduleInfo];
        int v23 = v22 & 1;
      }
      [v13 moduleInfo];
      __int16 v26 = v25;
      if (v18 == v19) {
        int v27 = v23;
      }
      else {
        int v27 = 1;
      }
      int v45 = v27;
      long long v54 = 0u;
      long long v55 = 0u;
      if ((v21 & 1) != 0 || v23 || !v18 || v18 != v19)
      {
        v29 = self->_baseTransitionTable;
        BOOL v30 = v42 < 2 && v44;
        p_nUpTransitionTable = &self->_nUpTransitionTable;
        if (!v30) {
          goto LABEL_27;
        }
        uint64_t v32 = 24;
        if (!v9) {
          uint64_t v32 = 16;
        }
        p_nUpTransitionTable = (Class *)((char *)&self->super.isa + v32);
        if (!v9
          || (v21 & 1) != 0
          || (p_nUpTransitionTable = p_interModuleTransitionTable, (v45 & (v10 ^ 1) & 1) != 0)
          || (p_nUpTransitionTable = p_interModuleTransitionTable, (v26 & 0x100) != 0))
        {
LABEL_27:
          v33 = *p_nUpTransitionTable;

          v29 = v33;
        }
        id v8 = v38;
        v28 = v43;
        v34 = [v38 clipAtIndex:location];
        v35 = v34;
        long long v46 = 0uLL;
        *(void *)&long long v47 = 0;
        if (v34) {
          [v34 motionInfo];
        }
        long long v52 = 0uLL;
        uint64_t v53 = 0;
        if (v44)
        {
          long long v52 = 0uLL;
          uint64_t v53 = 0;
        }
        else if (v43)
        {
          [v43 motionInfo];
        }
        long long v50 = v46;
        uint64_t v51 = v47;
        long long v48 = v52;
        uint64_t v49 = v53;
        [(PXStoryRecipeClipTransitionProvider *)self _nextTransitionFromTable:v29 currentMotion:&v50 nextMotion:&v48];
      }
      else
      {
        long long v54 = v56;
        long long v55 = v57;
        id v8 = v38;
        v28 = v43;
      }
      v36 = (void (*)(void *, long long *, NSUInteger))v40[2];
      long long v46 = v54;
      long long v47 = v55;
      v36(v40, &v46, location);
      long long v56 = v54;
      long long v57 = v55;

      --v9;
      int v10 = v45;
      ++location;
    }
    while (v11 <= v39);
  }
}

- ($7F31FC32F9D1B293069C8DA058A10F41)nextIntraMomentTransition
{
  baseTransitionTable = self->_baseTransitionTable;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  return [(PXStoryRecipeClipTransitionProvider *)self _nextTransitionFromTable:baseTransitionTable currentMotion:v6 nextMotion:v5];
}

- ($7F31FC32F9D1B293069C8DA058A10F41)_nextTransitionFromTable:(SEL)a3 currentMotion:(id)a4 nextMotion:(id *)a5
{
  int64_t var0 = a5->var0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PXStoryRecipeClipTransitionProvider__nextTransitionFromTable_currentMotion_nextMotion___block_invoke;
  v16[3] = &unk_1E5DC8E88;
  v16[4] = self;
  v16[5] = var0;
  unint64_t v11 = [a4 nextValuePassingTest:v16];
  int64_t v12 = [v11 integerValue];
  if (v12 == 8)
  {
    if (a6->var0 == 1 || (a6 = a5, a5->var0 == 1))
    {
      __int16 v13 = 512;
      switch(a6->var1.var0.var0)
      {
        case 0uLL:
          break;
        case 1uLL:
        case 4uLL:
          __int16 v13 = 256;
          goto LABEL_15;
        case 2uLL:
        case 3uLL:
          goto LABEL_15;
        default:
          PXAssertGetLog();
      }
    }
    if ([(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2])
    {
      __int16 v13 = 256;
    }
    else
    {
      __int16 v13 = 512;
    }
LABEL_15:
    retstr->int64_t var0 = 8;
    retstr->$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0.0;
    retstr->var2.var0.int64_t var0 = 0;
    retstr->var2.var0.$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0;
    LOWORD(retstr->var2.var0.var0) = v13;
  }
  else
  {
    $84AEFE31E1BF12A743E9A5C7022F1118 var1 = a5->var1;
    retstr->int64_t var0 = v12;
    retstr->$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0.0;
    retstr->var2.var0.int64_t var0 = 0;
    retstr->var2.var0.$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0;
    if (v12 == 7 || v12 == 6)
    {
      retstr->var2.var0.int64_t var0 = var1.var0.var0;
    }
    else if (v12 == 5)
    {
      retstr->var2 = ($3913CBCB8C27C6162DFA06D9B9422DBB)var1;
    }
  }

  return result;
}

uint64_t __89__PXStoryRecipeClipTransitionProvider__nextTransitionFromTable_currentMotion_nextMotion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _cameraMovement:v5 allowsTransition:v3];
}

- (BOOL)_cameraMovement:(int64_t)a3 allowsTransition:(int64_t)a4
{
  BOOL v4 = a4 != 5 || a3 == 1;
  if (a4 == 6) {
    BOOL v4 = a3 == 2;
  }
  if (a4 == 7) {
    return a3 == 3;
  }
  else {
    return v4;
  }
}

- (PXStoryRecipeClipTransitionProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PXStoryRecipeClipTransitionProvider;
  __int16 v13 = [(PXStoryRecipeClipTransitionProvider *)&v36 init];
  v14 = v13;
  if (v13)
  {
    v13->_songPace = a5;
    v15 = [v10 defaultTransitionTable];
    v35 = [v15 transitionsForColorGrade:v11 songPace:a5];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v35 randomNumberGenerator:v12 fallbackValue:&unk_1F02D9AA8];
    baseTransitionTable = v14->_baseTransitionTable;
    v14->_baseTransitionTable = (PFStoryAutoEditFrequencyTable *)v16;

    uint64_t v18 = [v10 interMomentTransitionTable];
    uint64_t v19 = [v18 transitionsForColorGrade:v11 songPace:a5];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v19 randomNumberGenerator:v12 fallbackValue:&unk_1F02D9AC0];
    interMomentTransitionTable = v14->_interMomentTransitionTable;
    v14->_interMomentTransitionTable = (PFStoryAutoEditFrequencyTable *)v20;

    char v22 = [v10 portraitTransitionTable];
    int v23 = [v22 transitionsForColorGrade:v11 songPace:a5];

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v23 randomNumberGenerator:v12 fallbackValue:&unk_1F02D9AD8];
    portraitTransitionTable = v14->_portraitTransitionTable;
    v14->_portraitTransitionTable = (PFStoryAutoEditFrequencyTable *)v24;

    __int16 v26 = [v10 nUpTransitionTable];
    int v27 = [v26 transitionsForColorGrade:v11 songPace:a5];

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v27 randomNumberGenerator:v12 fallbackValue:&unk_1F02D9AF0];
    nUpTransitionTable = v14->_nUpTransitionTable;
    v14->_nUpTransitionTable = (PFStoryAutoEditFrequencyTable *)v28;

    BOOL v30 = [v10 interModuleTransitionTable];
    v31 = [v30 transitionsForColorGrade:v11 songPace:a5];

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v31 randomNumberGenerator:v12 fallbackValue:&unk_1F02D9AD8];
    interModuleTransitionTable = v14->_interModuleTransitionTable;
    v14->_interModuleTransitionTable = (PFStoryAutoEditFrequencyTable *)v32;

    objc_storeStrong((id *)&v14->_randomNumberGenerator, a6);
  }

  return v14;
}

- (PXStoryRecipeClipTransitionProvider)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecipeClipTransitionProvider.m", 29, @"%s is not available as initializer", "-[PXStoryRecipeClipTransitionProvider init]");

  abort();
}

@end