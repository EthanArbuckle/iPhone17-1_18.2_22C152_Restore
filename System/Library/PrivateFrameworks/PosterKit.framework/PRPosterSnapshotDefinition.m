@interface PRPosterSnapshotDefinition
+ (int64_t)snapshotOptionsForDefinition:(id)a3;
- (BOOL)includesComplications;
- (BOOL)includesHeaderElements;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDefinition:(id)a3;
- (BOOL)isUnlocked;
- (NSArray)levelSets;
- (NSString)uniqueIdentifier;
- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 layerSet:(unint64_t)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10;
- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 levelSets:(id)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10;
- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 levelSets:(id)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10 boundingShape:(int64_t)a11;
- (id)description;
- (int64_t)boundingShape;
- (int64_t)renderingContent;
- (int64_t)renderingMode;
- (unint64_t)hash;
- (unint64_t)layerSet;
- (unint64_t)previewContent;
- (void)applySceneSettings:(id)a3;
@end

@implementation PRPosterSnapshotDefinition

- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 levelSets:(id)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10 boundingShape:(int64_t)a11
{
  id v18 = a3;
  id v19 = a6;
  id v20 = v18;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v20)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]();
    }
LABEL_23:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C23DFF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C23E050);
  }

  id v21 = v19;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v21)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C23E0ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C23E108);
  }

  if (![v21 count])
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[levelSets count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:](a2, (uint64_t)self, (uint64_t)v29);
    }
    goto LABEL_23;
  }
  v33.receiver = self;
  v33.super_class = (Class)PRPosterSnapshotDefinition;
  v22 = [(PRPosterSnapshotDefinition *)&v33 init];
  v23 = v22;
  if (v22)
  {
    v22->_includesHeaderElements = a4;
    v22->_includesComplications = a5;
    uint64_t v24 = [v21 copy];
    levelSets = v23->_levelSets;
    v23->_levelSets = (NSArray *)v24;

    v23->_layerSet = PRPosterSnapshotDefinitionLayerSetForPRPosterLevelSets(v21);
    v23->_unlocked = a7;
    v23->_renderingContent = a8;
    v23->_renderingMode = a9;
    v23->_previewContent = a10;
    uint64_t v26 = [v20 copy];
    uniqueIdentifier = v23->_uniqueIdentifier;
    v23->_uniqueIdentifier = (NSString *)v26;

    v23->_boundingShape = a11;
  }

  return v23;
}

- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 levelSets:(id)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10
{
  return [(PRPosterSnapshotDefinition *)self initWithUniqueIdentifier:a3 includeHeaderElements:a4 includesComplications:a5 levelSets:a6 isUnlocked:a7 renderingContent:a8 renderingMode:a9 previewContent:a10 boundingShape:-1];
}

- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 layerSet:(unint64_t)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10
{
  BOOL v11 = a7;
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v16 = a3;
  v17 = PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(a6);
  id v18 = [(PRPosterSnapshotDefinition *)self initWithUniqueIdentifier:v16 includeHeaderElements:v14 includesComplications:v13 levelSets:v17 isUnlocked:v11 renderingContent:a8 renderingMode:a9 previewContent:a10];

  if (v18) {
    v18->_layerSet = a6;
  }
  return v18;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_includesHeaderElements];
  id v5 = (id)[v3 appendBool:self->_includesComplications];
  id v6 = (id)[v3 appendObject:self->_levelSets];
  id v7 = (id)[v3 appendBool:self->_unlocked];
  id v8 = (id)[v3 appendUnsignedInteger:self->_renderingContent];
  id v9 = (id)[v3 appendUnsignedInteger:self->_renderingMode];
  id v10 = (id)[v3 appendUnsignedInteger:self->_previewContent];
  unint64_t v11 = [v3 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterSnapshotDefinition *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterSnapshotDefinition *)self isEqualToDefinition:v4];
  }

  return v5;
}

- (BOOL)isEqualToDefinition:(id)a3
{
  id v4 = (PRPosterSnapshotDefinition *)a3;
  if (self == v4)
  {
    char v26 = 1;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
    BOOL v6 = [(PRPosterSnapshotDefinition *)self includesHeaderElements];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke;
    v40[3] = &unk_1E54DB0C0;
    id v7 = v4;
    v41 = v7;
    id v8 = (id)[v5 appendBool:v6 counterpart:v40];
    id v9 = [(PRPosterSnapshotDefinition *)self levelSets];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_2;
    v38[3] = &unk_1E54DC130;
    id v10 = v7;
    v39 = v10;
    id v11 = (id)[v5 appendObject:v9 counterpart:v38];

    BOOL v12 = [(PRPosterSnapshotDefinition *)self isUnlocked];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_3;
    v36[3] = &unk_1E54DB0C0;
    BOOL v13 = v10;
    v37 = v13;
    id v14 = (id)[v5 appendBool:v12 counterpart:v36];
    v15 = [(PRPosterSnapshotDefinition *)self uniqueIdentifier];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_4;
    v34[3] = &unk_1E54DB098;
    id v16 = v13;
    v35 = v16;
    id v17 = (id)[v5 appendString:v15 counterpart:v34];

    int64_t v18 = [(PRPosterSnapshotDefinition *)self renderingContent];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_5;
    v32[3] = &unk_1E54DB110;
    id v19 = v16;
    objc_super v33 = v19;
    id v20 = (id)[v5 appendInt64:v18 counterpart:v32];
    int64_t v21 = [(PRPosterSnapshotDefinition *)self renderingMode];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_6;
    v30[3] = &unk_1E54DB110;
    v22 = v19;
    v31 = v22;
    id v23 = (id)[v5 appendInt64:v21 counterpart:v30];
    unint64_t v24 = [(PRPosterSnapshotDefinition *)self previewContent];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_7;
    v28[3] = &unk_1E54DB110;
    v29 = v22;
    id v25 = (id)[v5 appendInt64:v24 counterpart:v28];
    char v26 = [v5 isEqual];
  }
  return v26;
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) includesHeaderElements];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) levelSets];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUnlocked];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) uniqueIdentifier];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderingContent];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderingMode];
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewContent];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v5 = (id)[v3 appendBool:self->_includesHeaderElements withName:@"includesHeaderElements"];
  id v6 = (id)[v3 appendBool:self->_includesComplications withName:@"includesComplications"];
  id v7 = (id)[v3 appendBool:self->_unlocked withName:@"isUnlocked"];
  id v8 = NSStringFromPRRenderingContent();
  [v3 appendString:v8 withName:@"renderingContent"];

  id v9 = NSStringFromPRRenderingMode();
  [v3 appendString:v9 withName:@"renderingMode"];

  id v10 = NSStringFromPRPosterPreviewContent();
  [v3 appendString:v10 withName:@"previewContent"];

  id v11 = (id)[v3 appendObject:self->_levelSets withName:@"levelSets"];
  BOOL v12 = [v3 build];

  return v12;
}

- (void)applySceneSettings:(id)a3
{
  id v4 = a3;
  id v11 = [(PRPosterSnapshotDefinition *)self uniqueIdentifier];
  BOOL v5 = [(PRPosterSnapshotDefinition *)self includesHeaderElements];
  BOOL v6 = [(PRPosterSnapshotDefinition *)self includesComplications];
  int64_t v7 = [(PRPosterSnapshotDefinition *)self renderingContent];
  int64_t v8 = [(PRPosterSnapshotDefinition *)self renderingMode];
  unint64_t v9 = [(PRPosterSnapshotDefinition *)self previewContent];
  if ([(PRPosterSnapshotDefinition *)self isUnlocked]) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  objc_msgSend(v4, "pui_setContent:", v7);
  objc_msgSend(v4, "pui_setMode:", v8);
  objc_msgSend(v4, "pui_setPreviewContent:", v9);
  objc_msgSend(v4, "pui_setPreviewIdentifier:", v11);
  objc_msgSend(v4, "pr_setUnlockProgress:", v10);
  objc_msgSend(v4, "pui_setShowsComplications:", v6);
  objc_msgSend(v4, "pui_setShowsHeaderElements:", v5);
}

+ (int64_t)snapshotOptionsForDefinition:(id)a3
{
  id v3 = a3;
  if ([v3 includesHeaderElements]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([v3 includesComplications]) {
    v4 |= 4uLL;
  }
  uint64_t v5 = [v3 layerSet];
  uint64_t v6 = v4 | 0x20;
  uint64_t v7 = v4 | 0x38;
  if (v5) {
    uint64_t v7 = v4;
  }
  if (v5 != 1) {
    uint64_t v6 = v7;
  }
  if (v5 == 2) {
    int64_t v8 = v4 | 0x18;
  }
  else {
    int64_t v8 = v6;
  }
  if ([v3 isUnlocked]) {
    v8 |= 0x40uLL;
  }
  if (PRRenderingContentIsPreview([v3 renderingContent])) {
    v8 |= 0x80uLL;
  }

  return v8;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)includesHeaderElements
{
  return self->_includesHeaderElements;
}

- (BOOL)includesComplications
{
  return self->_includesComplications;
}

- (int64_t)renderingContent
{
  return self->_renderingContent;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (unint64_t)previewContent
{
  return self->_previewContent;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (NSArray)levelSets
{
  return self->_levelSets;
}

- (BOOL)isUnlocked
{
  return self->_unlocked;
}

- (unint64_t)layerSet
{
  return self->_layerSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelSets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:.cold.2()
{
  v0 = [NSString stringWithUTF8String:"-[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueIdentifier:(uint64_t)a3 includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:boundingShape:.cold.3(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint8_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  unint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PRPosterSnapshotDefinition.m";
  __int16 v16 = 1024;
  int v17 = 55;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end