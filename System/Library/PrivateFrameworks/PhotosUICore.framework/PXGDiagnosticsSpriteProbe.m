@interface PXGDiagnosticsSpriteProbe
+ (NSMutableArray)activeSpriteProbes;
+ (PXGSpriteDataStore)spriteDataStore;
+ (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7;
+ (void)didAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5;
+ (void)layout:(id)a3 didChangeSprites:(id *)a4;
+ (void)layout:(id)a3 didInsertSprites:(id *)a4;
+ (void)layout:(id)a3 willChangeSprites:(id *)a4;
+ (void)layout:(id)a3 willRemoveSprites:(id *)a4;
+ (void)shouldUseDoubleSidedAnimationForSprites:(id *)a3 indexes:(id)a4 animation:(id)a5;
+ (void)willAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5;
+ (void)willRequestTextureForSpriteWithGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 inLayout:(id)a6 textureInfo:(id)a7;
- (BOOL)isActive;
- (PXGDiagnosticsSpriteProbe)init;
- (id)descriptionForSpriteState:(id *)a3;
- (id)eventHandler;
- (id)predicate;
- (id)tagDescriptor;
- (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7;
- (void)_recordEventWithType:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 userInfo:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setTagDescriptor:(id)a3;
@end

@implementation PXGDiagnosticsSpriteProbe

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_tagDescriptor, 0);
  objc_storeStrong(&self->_predicate, 0);
}

- (void)setEventHandler:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setTagDescriptor:(id)a3
{
}

- (id)tagDescriptor
{
  return self->_tagDescriptor;
}

- (void)setPredicate:(id)a3
{
}

- (id)predicate
{
  return self->_predicate;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7
{
  id v15 = a4;
  id v12 = a7;
  uint64_t v13 = [(PXGDiagnosticsSpriteProbe *)self predicate];
  v14 = (unsigned int (**)(void, void, void))v13;
  if ((!a5
     || (*(unsigned int (**)(uint64_t, const $B980CBA6C71237C62FFCE18A37759231 *, id))(v13 + 16))(v13, a5, v15))&& (!a6|| ((unsigned int (**)(void, const $B980CBA6C71237C62FFCE18A37759231 *, id))v14)[2](v14, a6, v15)))
  {
    [(PXGDiagnosticsSpriteProbe *)self _recordEventWithType:a3 oldState:a5 newState:a6 userInfo:v12];
  }
}

- (id)descriptionForSpriteState:(id *)a3
{
  if (a3) {
    PXRectWithCenterAndSize();
  }
  return &stru_1F00B0030;
}

- (void)_recordEventWithType:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 userInfo:(id)a6
{
  id v10 = a6;
  v11 = [(PXGDiagnosticsSpriteProbe *)self eventHandler];
  v11[2](v11, self, a3, a4, a5, v10);
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    v5 = [(id)objc_opt_class() activeSpriteProbes];
    id v6 = v5;
    if (self->_active)
    {
      [v5 removeObject:self];
      v5 = v6;
    }
    self->_active = v3;
    if (v3)
    {
      [v6 addObject:self];
      v5 = v6;
    }
  }
}

- (PXGDiagnosticsSpriteProbe)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXGDiagnosticsSpriteProbe;
  v2 = [(PXGDiagnosticsSpriteProbe *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(PXGDiagnosticsSpriteProbe *)v2 setPredicate:&__block_literal_global_31_300162];
    [(PXGDiagnosticsSpriteProbe *)v3 setTagDescriptor:&__block_literal_global_34_300163];
    [(PXGDiagnosticsSpriteProbe *)v3 setEventHandler:&__block_literal_global_41_300164];
  }
  return v3;
}

void __33__PXGDiagnosticsSpriteProbe_init__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a6;
  PXGTungstenGetLog();
}

uint64_t __33__PXGDiagnosticsSpriteProbe_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"0x%llx", a2);
}

uint64_t __33__PXGDiagnosticsSpriteProbe_init__block_invoke()
{
  return 0;
}

+ (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = objc_msgSend(a1, "activeSpriteProbes", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) _recordEventIfNeededWithType:a3 layout:v12 oldState:a5 newState:a6 userInfo:v13];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

+ (void)shouldUseDoubleSidedAnimationForSprites:(id *)a3 indexes:(id)a4 animation:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [a5 layout];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  long long v10 = *(_OWORD *)&a3->var2;
  long long v14 = *(_OWORD *)&a3->var0;
  long long v15 = v10;
  v12[2] = __87__PXGDiagnosticsSpriteProbe_shouldUseDoubleSidedAnimationForSprites_indexes_animation___block_invoke;
  v12[3] = &unk_1E5DD2C68;
  var4 = a3->var4;
  id v17 = a1;
  id v13 = v9;
  id v11 = v9;
  [v8 enumerateIndexesUsingBlock:v12];
}

uint64_t __87__PXGDiagnosticsSpriteProbe_shouldUseDoubleSidedAnimationForSprites_indexes_animation___block_invoke(void *a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v2 = a1[8];
  BOOL v3 = (_OWORD *)(a1[7] + 32 * a2);
  long long v4 = v3[1];
  v18[0] = *v3;
  v18[1] = v4;
  objc_super v5 = (_OWORD *)(v2 + 160 * a2);
  long long v6 = v5[1];
  v18[2] = *v5;
  v18[3] = v6;
  long long v7 = v5[5];
  long long v9 = v5[2];
  long long v8 = v5[3];
  v18[6] = v5[4];
  v18[7] = v7;
  v18[4] = v9;
  v18[5] = v8;
  long long v10 = v5[9];
  long long v12 = v5[6];
  long long v11 = v5[7];
  v18[10] = v5[8];
  v18[11] = v10;
  v18[8] = v12;
  v18[9] = v11;
  id v13 = (void *)a1[10];
  uint64_t v14 = a1[9] + 40 * a2;
  uint64_t v15 = *(void *)(v14 + 32);
  long long v16 = *(_OWORD *)(v14 + 16);
  v18[12] = *(_OWORD *)v14;
  v18[13] = v16;
  uint64_t v19 = v15;
  return [v13 _recordEventIfNeededWithType:7 layout:a1[4] oldState:v18 newState:0 userInfo:0];
}

+ (void)didAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5
{
  BOOL v45 = a5;
  v80[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v47 = [v8 layout];
  v79 = @"duration";
  long long v9 = NSNumber;
  [v8 duration];
  long long v10 = objc_msgSend(v9, "numberWithDouble:");
  v80[0] = v10;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];

  long long v48 = 0u;
  long long v11 = [a1 spriteDataStore];
  long long v12 = v11;
  if (v11) {
    [v11 sprites];
  }
  else {
    long long v48 = 0u;
  }

  if (a3->var0)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2 object:a1 file:@"PXGDiagnosticsSpriteProbe.m" lineNumber:214 description:@"sprite count mismatch"];

    if (a3->var0)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      do
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v64 = 0u;
        long long v17 = *(_OWORD *)(v48 + v13 + 16);
        long long v64 = *(_OWORD *)(v48 + v13);
        long long v65 = v17;
        long long v18 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 96);
        long long v19 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 112);
        long long v20 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 144);
        long long v74 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 128);
        long long v75 = v20;
        long long v73 = v19;
        long long v21 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 16);
        long long v66 = *(_OWORD *)(*((void *)&v48 + 1) + v14);
        long long v67 = v21;
        long long v22 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 80);
        long long v24 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 32);
        long long v23 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 48);
        long long v70 = *(_OWORD *)(*((void *)&v48 + 1) + v14 + 64);
        long long v71 = v22;
        long long v68 = v24;
        long long v69 = v23;
        long long v72 = v18;
        long long v26 = *v15;
        long long v25 = v15[1];
        *(void *)&long long v78 = *((void *)v15 + 4);
        long long v76 = v26;
        long long v77 = v25;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v49 = 0u;
        var3 = a3->var3;
        var4 = a3->var4;
        v29 = (long long *)((char *)a3->var2 + v13);
        long long v30 = v29[1];
        long long v49 = *v29;
        long long v50 = v30;
        long long v31 = *(_OWORD *)((char *)var3 + v14 + 96);
        long long v32 = *(_OWORD *)((char *)var3 + v14 + 112);
        long long v33 = *(_OWORD *)((char *)var3 + v14 + 144);
        long long v59 = *(_OWORD *)((char *)var3 + v14 + 128);
        long long v60 = v33;
        long long v58 = v32;
        long long v34 = *(_OWORD *)((char *)var3 + v14 + 16);
        long long v51 = *(_OWORD *)((char *)var3 + v14);
        long long v52 = v34;
        long long v35 = *(_OWORD *)((char *)var3 + v14 + 80);
        long long v37 = *(_OWORD *)((char *)var3 + v14 + 32);
        long long v36 = *(_OWORD *)((char *)var3 + v14 + 48);
        long long v55 = *(_OWORD *)((char *)var3 + v14 + 64);
        long long v56 = v35;
        long long v53 = v37;
        long long v54 = v36;
        long long v57 = v31;
        long long v39 = *(long long *)((char *)v15 + (void)var4);
        long long v38 = *(long long *)((char *)v15 + (void)var4 + 16);
        *(void *)&long long v63 = *(void *)((char *)v15 + (void)var4 + 32);
        long long v61 = v39;
        long long v62 = v38;
        if (v45)
        {
          v40 = &v49;
          v41 = &v64;
          id v42 = a1;
          uint64_t v43 = 5;
        }
        else
        {
          v40 = &v64;
          v41 = &v49;
          id v42 = a1;
          uint64_t v43 = 6;
        }
        [v42 _recordEventIfNeededWithType:v43 layout:v47 oldState:v40 newState:v41 userInfo:v46];
        ++v16;
        uint64_t v15 = (long long *)((char *)v15 + 40);
        v14 += 160;
        v13 += 32;
      }
      while (v16 < a3->var0);
    }
  }
}

+ (void)willAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5
{
  objc_super v5 = objc_msgSend(a1, "spriteDataStore", *(void *)&a3->var0, a3->var1, a3->var2, a3->var3, a3->var4);
  [v5 setSprites:&v6];
}

+ (void)willRequestTextureForSpriteWithGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 inLayout:(id)a6 textureInfo:(id)a7
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v7;
  long long v8 = *(_OWORD *)&a4[2].var3;
  v14[8] = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&a4[2].var1 + 4);
  v14[9] = v8;
  long long v9 = *(long long *)((char *)&a4[3].var1 + 8);
  v14[10] = *(_OWORD *)&a4[2].var8;
  v14[11] = v9;
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1 = a4[1].var1;
  v14[4] = *(_OWORD *)&a4->var5;
  v14[5] = var1;
  long long v11 = *(_OWORD *)&a4[1].var6;
  v14[6] = *(_OWORD *)&a4[1].var2;
  v14[7] = v11;
  long long v12 = *(long long *)((char *)&a4->var1 + 12);
  v14[2] = *(_OWORD *)&a4->var0;
  v14[3] = v12;
  long long v13 = *(_OWORD *)&a5->var4;
  v14[12] = *(_OWORD *)&a5->var0;
  v14[13] = v13;
  int64_t var3 = a5[1].var3;
  uint64_t v16 = 0;
  [a1 _recordEventIfNeededWithType:4 layout:a6 oldState:0 newState:v14 userInfo:a7];
}

+ (void)layout:(id)a3 didChangeSprites:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  long long v48 = 0u;
  long long v6 = [a1 spriteDataStore];
  long long v7 = v6;
  if (v6) {
    [v6 sprites];
  }
  else {
    long long v48 = 0u;
  }

  if (a4->var0)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:a1 file:@"PXGDiagnosticsSpriteProbe.m" lineNumber:180 description:@"sprite count mismatch"];

    unint64_t var0 = a4->var0;
    if (a4->var0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      long long v10 = 0;
      unint64_t v11 = 0;
      int v12 = *(unsigned __int8 *)off_1E5DAAF88;
      int v44 = *((unsigned __int16 *)off_1E5DAAF88 + 16);
      int v45 = *((unsigned __int8 *)off_1E5DAAF88 + 1);
      float32x2_t v13 = *(float32x2_t *)((char *)off_1E5DAAF88 + 8);
      float v14 = *((float *)off_1E5DAAF88 + 4);
      uint64_t v43 = *((void *)off_1E5DAAF88 + 3);
      while (1)
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        *(_OWORD *)&v63[48] = 0u;
        long long v64 = 0u;
        memset(&v63[16], 0, 32);
        long long v62 = 0u;
        *(_OWORD *)long long v63 = 0u;
        long long v61 = 0u;
        long long v15 = *(_OWORD *)(v48 + v8 + 16);
        long long v61 = *(_OWORD *)(v48 + v8);
        long long v62 = v15;
        long long v16 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 96);
        long long v17 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 112);
        long long v18 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 144);
        long long v68 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 128);
        long long v69 = v18;
        long long v67 = v17;
        long long v19 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 16);
        *(_OWORD *)long long v63 = *(_OWORD *)(*((void *)&v48 + 1) + v9);
        *(_OWORD *)&v63[16] = v19;
        long long v20 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 80);
        long long v22 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 32);
        long long v21 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 48);
        long long v64 = *(_OWORD *)(*((void *)&v48 + 1) + v9 + 64);
        long long v65 = v20;
        *(_OWORD *)&v63[32] = v22;
        *(_OWORD *)&v63[48] = v21;
        long long v66 = v16;
        long long v24 = *v10;
        long long v23 = v10[1];
        *(void *)&long long v72 = *((void *)v10 + 4);
        long long v70 = v24;
        long long v71 = v23;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        *(_OWORD *)&v51[48] = 0u;
        long long v52 = 0u;
        memset(&v51[16], 0, 32);
        long long v50 = 0u;
        *(_OWORD *)long long v51 = 0u;
        long long v49 = 0u;
        int64_t var3 = a4->var3;
        var4 = a4->var4;
        v27 = (long long *)((char *)a4->var2 + v8);
        long long v28 = v27[1];
        long long v49 = *v27;
        long long v50 = v28;
        long long v29 = *(_OWORD *)((char *)var3 + v9 + 96);
        long long v30 = *(_OWORD *)((char *)var3 + v9 + 112);
        long long v31 = *(_OWORD *)((char *)var3 + v9 + 144);
        long long v56 = *(_OWORD *)((char *)var3 + v9 + 128);
        long long v57 = v31;
        long long v55 = v30;
        long long v32 = *(_OWORD *)((char *)var3 + v9 + 16);
        *(_OWORD *)long long v51 = *(_OWORD *)((char *)var3 + v9);
        *(_OWORD *)&v51[16] = v32;
        long long v33 = *(_OWORD *)((char *)var3 + v9 + 80);
        long long v35 = *(_OWORD *)((char *)var3 + v9 + 32);
        long long v34 = *(_OWORD *)((char *)var3 + v9 + 48);
        long long v52 = *(_OWORD *)((char *)var3 + v9 + 64);
        long long v53 = v33;
        *(_OWORD *)&v51[32] = v35;
        *(_OWORD *)&v51[48] = v34;
        long long v54 = v29;
        uint64_t v36 = *(void *)((char *)v10 + (void)var4 + 32);
        long long v37 = *(long long *)((char *)v10 + (void)var4 + 16);
        long long v58 = *(long long *)((char *)v10 + (void)var4);
        long long v59 = v37;
        *(void *)&long long v60 = v36;
        uint16x4_t v38 = (uint16x4_t)v61;
        if (*(double *)&v61 == *(double *)&v49)
        {
          uint16x4_t v38 = *(uint16x4_t *)((char *)&v61 + 8);
          if (*((double *)&v61 + 1) == *((double *)&v49 + 1))
          {
            uint16x4_t v38 = (uint16x4_t)v62;
            if (*(double *)&v62 == *(double *)&v50)
            {
              uint16x4_t v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v62 + 8), *(float32x2_t *)((char *)&v50 + 8));
              if (v38.i32[0] & v38.i32[1])
              {
                v38.i32[0] = *(_DWORD *)v63;
                if (*(float *)v63 == *(float *)v51)
                {
                  uint16x4_t v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[4], *(float32x4_t *)&v51[4])), 0xFuLL));
                  v38.i16[0] = vminv_u16(v38);
                  if (v38.i8[0])
                  {
                    uint16x4_t v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[20], *(float32x4_t *)&v51[20])), 0xFuLL));
                    v38.i16[0] = vminv_u16(v38);
                    if (v38.i8[0])
                    {
                      uint16x4_t v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[36], *(float32x4_t *)&v51[36])), 0xFuLL));
                      v38.i16[0] = vminv_u16(v38);
                      if (v38.i8[0])
                      {
                        v38.i32[0] = *(_DWORD *)&v63[52];
                        if (*(float *)&v63[52] == *(float *)&v51[52]
                          && WORD2(v64) == WORD2(v52)
                          && v70 == v58
                          && BYTE1(v70) == BYTE1(v58)
                          && (unsigned __int16)v72 == (unsigned __int16)v60)
                        {
                          uint16x4_t v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v70 + 8), *(float32x2_t *)((char *)&v58 + 8));
                          if (v38.i32[0] & v38.i32[1])
                          {
                            v38.i32[0] = v71;
                            if (*(float *)&v71 == *(float *)&v59 && *((void *)&v71 + 1) == *((void *)&v59 + 1)) {
                              goto LABEL_29;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        long long v39 = &v61;
        if (v70 != v12 || BYTE1(v70) != v45) {
          goto LABEL_27;
        }
        uint64_t v40 = 3;
        if ((unsigned __int16)v72 == v44) {
          break;
        }
LABEL_28:
        objc_msgSend(a1, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", v40, v47, v39, &v49, 0, *(double *)&v38, v43);
        unint64_t var0 = a4->var0;
LABEL_29:
        ++v11;
        long long v10 = (long long *)((char *)v10 + 40);
        v9 += 160;
        v8 += 32;
        if (v11 >= var0) {
          goto LABEL_41;
        }
      }
      uint16x4_t v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v70 + 8), v13);
      long long v39 = &v61;
      if (v38.i8[0] & 1) != 0 && (v38.i8[4])
      {
        v38.i32[0] = v71;
        uint64_t v40 = 3;
        if (*(float *)&v71 == v14)
        {
          if (*((void *)&v71 + 1) == v43) {
            uint64_t v40 = 2;
          }
          else {
            uint64_t v40 = 3;
          }
          if (*((void *)&v71 + 1) == v43) {
            long long v39 = 0;
          }
          else {
            long long v39 = &v61;
          }
        }
        goto LABEL_28;
      }
LABEL_27:
      uint64_t v40 = 3;
      goto LABEL_28;
    }
  }
LABEL_41:
}

+ (void)layout:(id)a3 willChangeSprites:(id *)a4
{
  long long v4 = objc_msgSend(a1, "spriteDataStore", a3, *(void *)&a4->var0, a4->var1, a4->var2, a4->var3, a4->var4);
  [v4 setSprites:&v5];
}

+ (void)layout:(id)a3 didInsertSprites:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4->var0)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      int64_t var3 = a4->var3;
      var4 = a4->var4;
      float32x2_t v13 = (long long *)((char *)a4->var2 + v7);
      long long v14 = v13[1];
      long long v24 = *v13;
      long long v25 = v14;
      long long v15 = *(_OWORD *)((char *)var3 + v8 + 96);
      long long v16 = *(_OWORD *)((char *)var3 + v8 + 112);
      long long v17 = *(_OWORD *)((char *)var3 + v8 + 144);
      long long v34 = *(_OWORD *)((char *)var3 + v8 + 128);
      long long v35 = v17;
      long long v33 = v16;
      long long v18 = *(_OWORD *)((char *)var3 + v8 + 16);
      long long v26 = *(_OWORD *)((char *)var3 + v8);
      long long v27 = v18;
      long long v19 = *(_OWORD *)((char *)var3 + v8 + 80);
      long long v21 = *(_OWORD *)((char *)var3 + v8 + 32);
      long long v20 = *(_OWORD *)((char *)var3 + v8 + 48);
      long long v30 = *(_OWORD *)((char *)var3 + v8 + 64);
      long long v31 = v19;
      long long v28 = v21;
      long long v29 = v20;
      long long v32 = v15;
      long long v23 = *(_OWORD *)((char *)var4 + v9);
      long long v22 = *(_OWORD *)((char *)var4 + v9 + 16);
      *(void *)&long long v38 = *(void *)((char *)var4 + v9 + 32);
      long long v36 = v23;
      long long v37 = v22;
      [a1 _recordEventIfNeededWithType:1 layout:a3 oldState:0 newState:&v24 userInfo:0];
      ++v10;
      v9 += 40;
      v8 += 160;
      v7 += 32;
    }
    while (v10 < a4->var0);
  }
}

+ (void)layout:(id)a3 willRemoveSprites:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4->var0)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      int64_t var3 = a4->var3;
      var4 = a4->var4;
      float32x2_t v13 = (long long *)((char *)a4->var2 + v7);
      long long v14 = v13[1];
      long long v24 = *v13;
      long long v25 = v14;
      long long v15 = *(_OWORD *)((char *)var3 + v8 + 96);
      long long v16 = *(_OWORD *)((char *)var3 + v8 + 112);
      long long v17 = *(_OWORD *)((char *)var3 + v8 + 144);
      long long v34 = *(_OWORD *)((char *)var3 + v8 + 128);
      long long v35 = v17;
      long long v33 = v16;
      long long v18 = *(_OWORD *)((char *)var3 + v8 + 16);
      long long v26 = *(_OWORD *)((char *)var3 + v8);
      long long v27 = v18;
      long long v19 = *(_OWORD *)((char *)var3 + v8 + 80);
      long long v21 = *(_OWORD *)((char *)var3 + v8 + 32);
      long long v20 = *(_OWORD *)((char *)var3 + v8 + 48);
      long long v30 = *(_OWORD *)((char *)var3 + v8 + 64);
      long long v31 = v19;
      long long v28 = v21;
      long long v29 = v20;
      long long v32 = v15;
      long long v23 = *(_OWORD *)((char *)var4 + v9);
      long long v22 = *(_OWORD *)((char *)var4 + v9 + 16);
      *(void *)&long long v38 = *(void *)((char *)var4 + v9 + 32);
      long long v36 = v23;
      long long v37 = v22;
      [a1 _recordEventIfNeededWithType:1 layout:a3 oldState:&v24 newState:0 userInfo:0];
      ++v10;
      v9 += 40;
      v8 += 160;
      v7 += 32;
    }
    while (v10 < a4->var0);
  }
}

+ (PXGSpriteDataStore)spriteDataStore
{
  if (spriteDataStore_onceToken != -1) {
    dispatch_once(&spriteDataStore_onceToken, &__block_literal_global_27_300234);
  }
  uint64_t v2 = (void *)spriteDataStore_spriteDataStore;
  return (PXGSpriteDataStore *)v2;
}

void __44__PXGDiagnosticsSpriteProbe_spriteDataStore__block_invoke()
{
  uint64_t v0 = [off_1E5DA6B40 newSpriteDataStore];
  v1 = (void *)spriteDataStore_spriteDataStore;
  spriteDataStore_spriteDataStore = v0;
}

+ (NSMutableArray)activeSpriteProbes
{
  if (activeSpriteProbes_onceToken != -1) {
    dispatch_once(&activeSpriteProbes_onceToken, &__block_literal_global_300237);
  }
  uint64_t v2 = (void *)activeSpriteProbes_activeSpriteProbes;
  return (NSMutableArray *)v2;
}

void __47__PXGDiagnosticsSpriteProbe_activeSpriteProbes__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)activeSpriteProbes_activeSpriteProbes;
  activeSpriteProbes_activeSpriteProbes = (uint64_t)v0;
}

@end