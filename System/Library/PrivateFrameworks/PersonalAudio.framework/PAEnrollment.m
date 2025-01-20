@interface PAEnrollment
+ (id)enrollmentWithAudiogram:(id)a3;
+ (id)sharedInstance;
- (NSMutableDictionary)enrollmentHandlers;
- (PAConfiguration)audiogramPreset;
- (PAEnrollment)init;
- (id)enrollmentNodeAfter:(id)a3 withSelectedNode:(id)a4;
- (unint64_t)progress;
- (unint64_t)selectedLevel;
- (void)addEnrollmentStepForSection:(unint64_t)a3 comparing:(unint64_t)a4 withOption:(unint64_t)a5 andBlock:(id)a6;
- (void)addHandlers;
- (void)addLevelEnrollmentStepsStartingWith:(unint64_t)a3;
- (void)addOffEnrollmentStepComparing:(unint64_t)a3;
- (void)setAudiogramPreset:(id)a3;
- (void)setEnrollmentHandlers:(id)a3;
- (void)setProgress:(unint64_t)a3;
- (void)setSelectedLevel:(unint64_t)a3;
@end

@implementation PAEnrollment

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_enrollment;
  return v2;
}

uint64_t __30__PAEnrollment_sharedInstance__block_invoke()
{
  sharedInstance_enrollment = objc_alloc_init(PAEnrollment);
  return MEMORY[0x270F9A758]();
}

+ (id)enrollmentWithAudiogram:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PAEnrollment);
  v5 = +[PAAudiogramUtilities normalizedOffsetsFromAudiogram:v3];

  v6 = +[PAConfiguration configurationWithAudiogram:v5];
  [(PAEnrollment *)v4 setAudiogramPreset:v6];

  return v4;
}

- (PAEnrollment)init
{
  v5.receiver = self;
  v5.super_class = (Class)PAEnrollment;
  v2 = [(PAEnrollment *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PAEnrollment *)v2 addHandlers];
  }
  return v3;
}

- (void)addHandlers
{
  objc_initWeak(&location, self);
  [(PAEnrollment *)self addEnrollmentStepForSection:0 comparing:0 withOption:0 andBlock:&__block_literal_global_5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__PAEnrollment_addHandlers__block_invoke_2;
  v10[3] = &unk_264103738;
  objc_copyWeak(&v11, &location);
  [(PAEnrollment *)self addEnrollmentStepForSection:2 comparing:0 withOption:1 andBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__PAEnrollment_addHandlers__block_invoke_3;
  v8[3] = &unk_264103738;
  objc_copyWeak(&v9, &location);
  [(PAEnrollment *)self addEnrollmentStepForSection:2 comparing:0 withOption:2 andBlock:v8];
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  objc_super v5 = __27__PAEnrollment_addHandlers__block_invoke_4;
  v6 = &unk_264103738;
  objc_copyWeak(&v7, &location);
  [(PAEnrollment *)self addEnrollmentStepForSection:3 comparing:0 withOption:0 andBlock:&v3];
  -[PAEnrollment addOffEnrollmentStepComparing:](self, "addOffEnrollmentStepComparing:", 3, v3, v4, v5, v6);
  [(PAEnrollment *)self addOffEnrollmentStepComparing:4];
  [(PAEnrollment *)self addLevelEnrollmentStepsStartingWith:3];
  [(PAEnrollment *)self addLevelEnrollmentStepsStartingWith:6];
  [(PAEnrollment *)self addLevelEnrollmentStepsStartingWith:9];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __27__PAEnrollment_addHandlers__block_invoke()
{
  v0 = +[PAEnrollmentNode nodeWithSection:2 andType:1 comparing:0 with:1];
  [v0 setIndex:1];
  return v0;
}

id __27__PAEnrollment_addHandlers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 type])
  {
    uint64_t v4 = +[PAEnrollmentNode nodeWithSection:2 andType:2 comparing:0 with:2];
    objc_super v5 = v4;
    uint64_t v6 = 2;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setSelectedLevel:3];

    uint64_t v4 = +[PAEnrollmentNode nodeWithSection:3 type:3 andConfiguration:0];
    objc_super v5 = v4;
    uint64_t v6 = 3;
  }
  [v4 setIndex:v6];
  return v5;
}

id __27__PAEnrollment_addHandlers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 type]) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSelectedLevel:v4];

  uint64_t v6 = +[PAEnrollmentNode nodeWithSection:3 type:v4 andConfiguration:0];
  [v6 setIndex:3];
  return v6;
}

id __27__PAEnrollment_addHandlers__block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained selectedLevel];

  if (v3 == 9)
  {
    uint64_t v4 = 9;
    uint64_t v5 = 9;
    uint64_t v6 = 10;
  }
  else
  {
    id v7 = objc_loadWeakRetained(v1);
    uint64_t v8 = [v7 selectedLevel];

    if (v8 == 3)
    {
      uint64_t v4 = 3;
      uint64_t v5 = 0;
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v4 = 6;
      uint64_t v5 = 6;
      uint64_t v6 = 7;
    }
  }
  id v9 = +[PAEnrollmentNode nodeWithSection:4 andType:v4 comparing:v5 with:v6];
  [v9 setIndex:3];
  return v9;
}

- (void)addOffEnrollmentStepComparing:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__PAEnrollment_addOffEnrollmentStepComparing___block_invoke;
  v3[3] = &__block_descriptor_40_e65___PAEnrollmentNode_24__0__PAEnrollmentNode_8__PAEnrollmentNode_16l;
  v3[4] = a3;
  [(PAEnrollment *)self addEnrollmentStepForSection:4 comparing:0 withOption:a3 andBlock:v3];
}

id __46__PAEnrollment_addOffEnrollmentStepComparing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 type] + 1;
  if ([v6 type])
  {
    if ([v6 type] == 5)
    {
      uint64_t v8 = +[PAEnrollmentNode nodeWithSection:6 andType:5 comparing:5 with:0];
      uint64_t v7 = 7;
      goto LABEL_10;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v11 + 1;
    goto LABEL_8;
  }
  if ([v5 type] != 4)
  {
    uint64_t v12 = *(void *)(a1 + 32) + 1;
    uint64_t v11 = 0;
LABEL_8:
    uint64_t v10 = +[PAEnrollmentNode nodeWithSection:4 andType:v12 comparing:v11 with:v12];
    goto LABEL_9;
  }
  id v9 = +[PASettings sharedInstance];
  [v9 setPersonalMediaConfiguration:0];

  uint64_t v7 = 7;
  uint64_t v10 = +[PAEnrollmentNode nodeWithSection:7 type:0 andConfiguration:0];
LABEL_9:
  uint64_t v8 = (void *)v10;
LABEL_10:
  [v8 setIndex:v7];

  return v8;
}

- (void)addLevelEnrollmentStepsStartingWith:(unint64_t)a3
{
  unint64_t v5 = a3 + 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke;
  v6[3] = &__block_descriptor_40_e65___PAEnrollmentNode_24__0__PAEnrollmentNode_8__PAEnrollmentNode_16l;
  v6[4] = a3;
  [(PAEnrollment *)self addEnrollmentStepForSection:4 comparing:a3 withOption:a3 + 1 andBlock:v6];
  [(PAEnrollment *)self addEnrollmentStepForSection:4 comparing:v5 withOption:a3 + 2 andBlock:&__block_literal_global_9];
  [(PAEnrollment *)self addEnrollmentStepForSection:4 comparing:a3 withOption:a3 + 2 andBlock:&__block_literal_global_11];
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  uint64_t v6 = [v4 type];

  uint64_t v7 = +[PAEnrollmentNode nodeWithSection:4 andType:v5 comparing:v6 with:*(void *)(a1 + 32) + 2];
  uint64_t v8 = v7;
  if (*(void *)(a1 + 32) == 3) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 4;
  }
  [v7 setIndex:v9];
  return v8;
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v3 type];

  uint64_t v6 = +[PAEnrollmentNode nodeWithSection:6 andType:v4 comparing:v5 with:0];
  [v6 setIndex:7];
  return v6;
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v3 type];

  uint64_t v6 = +[PAEnrollmentNode nodeWithSection:6 andType:v4 comparing:v5 with:0];
  [v6 setIndex:7];
  return v6;
}

- (void)addEnrollmentStepForSection:(unint64_t)a3 comparing:(unint64_t)a4 withOption:(unint64_t)a5 andBlock:(id)a6
{
  id v13 = a6;
  uint64_t v10 = [(PAEnrollment *)self enrollmentHandlers];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    [(PAEnrollment *)self setEnrollmentHandlers:v10];
  }
  uint64_t v11 = (void *)MEMORY[0x210557C80](v13);
  uint64_t v12 = paKeyFromNodeParameters(a3, a4, a5);
  [v10 setValue:v11 forKey:v12];
}

- (id)enrollmentNodeAfter:(id)a3 withSelectedNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PAEnrollment *)self enrollmentHandlers];
  uint64_t v9 = [v6 key];
  uint64_t v10 = [v8 objectForKey:v9];

  unint64_t v11 = [v6 section];
  uint64_t v12 = [v6 configuration];
  if (self->_audiogramPreset && v11 <= 4)
  {
    id v13 = +[PASettings sharedInstance];
    [v13 setPersonalMediaConfiguration:self->_audiogramPreset];

    v14 = +[PAEnrollmentNode nodeWithSection:6 andType:12 comparing:12 with:0];
    v15 = [v14 options];
    v16 = [v15 firstObject];
    [v16 setConfiguration:self->_audiogramPreset];

    [v14 setConfiguration:self->_audiogramPreset];
    v17 = v14;
LABEL_4:
    uint64_t v18 = 7;
    goto LABEL_5;
  }
  if (v11 == 6)
  {
    v21 = +[PASettings sharedInstance];
    if ([v21 personalMediaEnabled])
    {
      BOOL v22 = paCurrentRouteSupportsTransparencyAccommodations();

      if (v22)
      {
        v14 = +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 5, [v6 type], objc_msgSend(v6, "type"), 0);
        [v14 setConfiguration:v12];
        v17 = v14;
        uint64_t v18 = 6;
        goto LABEL_5;
      }
    }
    else
    {
    }
    v23 = +[PASettings sharedInstance];
    if ([v23 personalMediaEnabled])
    {
    }
    else
    {
      audiogramPreset = self->_audiogramPreset;

      if (!audiogramPreset)
      {
        v17 = +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", 8, [v6 type], 0);
        v14 = v17;
        goto LABEL_4;
      }
    }
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  if (v11 > 4) {
    goto LABEL_23;
  }
  if (!v10)
  {
    v17 = +[PAEnrollmentNode nodeWithSection:2 andType:1 comparing:0 with:1];
    v14 = v17;
    uint64_t v18 = 1;
LABEL_5:
    [v17 setIndex:v18];
    if (v14) {
      goto LABEL_6;
    }
LABEL_24:
    uint64_t v20 = 1;
    goto LABEL_25;
  }
  v14 = ((void (**)(void, id, id))v10)[2](v10, v6, v7);
  if (!v14) {
    goto LABEL_24;
  }
LABEL_6:
  uint64_t v19 = [v14 index];
  if ((unint64_t)(v19 - 1) >= 2)
  {
    if ((unint64_t)(v19 - 2) >= 4) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 3;
    }
  }
  else
  {
    uint64_t v20 = 2;
  }
LABEL_25:
  [(PAEnrollment *)self setProgress:v20];
  v25 = +[PASettings sharedInstance];
  [v25 setCurrentEnrollmentProgress:v20];

  return v14;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(unint64_t)a3
{
  self->_progress = a3;
}

- (PAConfiguration)audiogramPreset
{
  return self->_audiogramPreset;
}

- (void)setAudiogramPreset:(id)a3
{
}

- (NSMutableDictionary)enrollmentHandlers
{
  return self->_enrollmentHandlers;
}

- (void)setEnrollmentHandlers:(id)a3
{
}

- (unint64_t)selectedLevel
{
  return self->_selectedLevel;
}

- (void)setSelectedLevel:(unint64_t)a3
{
  self->_selectedLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentHandlers, 0);
  objc_storeStrong((id *)&self->_audiogramPreset, 0);
}

@end