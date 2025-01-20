@interface PBFPosterSnapshotDefinition
+ (id)defaultConfigurationDefinitions;
+ (id)defaultPreviewDefinitionForPreview:(id)a3;
+ (id)defaultPreviewDefinitions;
+ (id)editingConfirmationDefinition;
+ (id)gallerySnapshotDefinition;
+ (id)gallerySnapshotKeyFrameDefinition;
+ (id)gallerySnapshotWithComplicationsDefinition;
+ (id)switcherFloatingLayerSnapshotDefinition;
+ (id)switcherSnapshotDefinition;
+ (id)switcherUnlockedSnapshotDefinition;
- (BOOL)shouldBePersistedOnlyTemporarily;
- (PBFPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3;
- (double)persistenceScale;
- (id)_persistenceIdentitifer;
- (id)description;
@end

@implementation PBFPosterSnapshotDefinition

+ (id)gallerySnapshotDefinition
{
  if (gallerySnapshotDefinition_onceToken != -1) {
    dispatch_once(&gallerySnapshotDefinition_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)gallerySnapshotDefinition_gallerySnapshotDefinition;
  return v2;
}

void __56__PBFPosterSnapshotDefinition_gallerySnapshotDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierGallery];
  v2 = (void *)gallerySnapshotDefinition_gallerySnapshotDefinition;
  gallerySnapshotDefinition_gallerySnapshotDefinition = v1;
}

+ (id)gallerySnapshotKeyFrameDefinition
{
  if (gallerySnapshotKeyFrameDefinition_onceToken != -1) {
    dispatch_once(&gallerySnapshotKeyFrameDefinition_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition;
  return v2;
}

void __64__PBFPosterSnapshotDefinition_gallerySnapshotKeyFrameDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierGalleryKeyFrame];
  v2 = (void *)gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition;
  gallerySnapshotKeyFrameDefinition_gallerySnapshotKeyFrameDefinition = v1;
}

+ (id)gallerySnapshotWithComplicationsDefinition
{
  if (gallerySnapshotWithComplicationsDefinition_onceToken != -1) {
    dispatch_once(&gallerySnapshotWithComplicationsDefinition_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition;
  return v2;
}

void __73__PBFPosterSnapshotDefinition_gallerySnapshotWithComplicationsDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierGalleryWithComplications];
  v2 = (void *)gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition;
  gallerySnapshotWithComplicationsDefinition_gallerySnapshotDefinition = v1;
}

+ (id)switcherSnapshotDefinition
{
  if (switcherSnapshotDefinition_onceToken != -1) {
    dispatch_once(&switcherSnapshotDefinition_onceToken, &__block_literal_global_28_0);
  }
  v2 = (void *)switcherSnapshotDefinition_switcherSnapshotDefinition;
  return v2;
}

void __57__PBFPosterSnapshotDefinition_switcherSnapshotDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierSwitcher];
  v2 = (void *)switcherSnapshotDefinition_switcherSnapshotDefinition;
  switcherSnapshotDefinition_switcherSnapshotDefinition = v1;
}

+ (id)switcherUnlockedSnapshotDefinition
{
  if (switcherUnlockedSnapshotDefinition_onceToken != -1) {
    dispatch_once(&switcherUnlockedSnapshotDefinition_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition;
  return v2;
}

void __65__PBFPosterSnapshotDefinition_switcherUnlockedSnapshotDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierSwitcherUnlocked];
  v2 = (void *)switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition;
  switcherUnlockedSnapshotDefinition_switcherUnlockedSnapshotDefinition = v1;
}

+ (id)switcherFloatingLayerSnapshotDefinition
{
  if (switcherFloatingLayerSnapshotDefinition_onceToken != -1) {
    dispatch_once(&switcherFloatingLayerSnapshotDefinition_onceToken, &__block_literal_global_32_0);
  }
  v2 = (void *)switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition;
  return v2;
}

void __70__PBFPosterSnapshotDefinition_switcherFloatingLayerSnapshotDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierSwitcherFloatingLayer];
  v2 = (void *)switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition;
  switcherFloatingLayerSnapshotDefinition_switcherFloatingLayerSnapshotDefinition = v1;
}

+ (id)editingConfirmationDefinition
{
  if (editingConfirmationDefinition_onceToken[0] != -1) {
    dispatch_once(editingConfirmationDefinition_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)editingConfirmationDefinition_editingConfirmationDefinition;
  return v2;
}

void __60__PBFPosterSnapshotDefinition_editingConfirmationDefinition__block_invoke()
{
  v0 = [PBFPosterSnapshotDefinition alloc];
  uint64_t v1 = [(PBFPosterSnapshotDefinition *)v0 initWithUniqueIdentifier:PRPosterSnapshotDefinitionIdentifierEditingConfirmation];
  v2 = (void *)editingConfirmationDefinition_editingConfirmationDefinition;
  editingConfirmationDefinition_editingConfirmationDefinition = v1;
}

+ (id)defaultPreviewDefinitions
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = +[PBFPosterSnapshotDefinition gallerySnapshotDefinition];
  v3 = +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition];
  v7[1] = v3;
  v4 = +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)defaultPreviewDefinitionForPreview:(id)a3
{
  PFCurrentDeviceClass();
  return +[PBFPosterSnapshotDefinition gallerySnapshotDefinition];
}

+ (id)defaultConfigurationDefinitions
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = +[PBFPosterSnapshotDefinition switcherSnapshotDefinition];
  v8[0] = v2;
  v3 = +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition];
  v8[1] = v3;
  v4 = +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition];
  v8[2] = v4;
  v5 = +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (PBFPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  char v15 = 0;
  double v14 = 0.0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  _PBFPosterSnapshotDefinitionAttributesForIdentifier(v4, &v15, (uint64_t)&v11);
  if (v15)
  {
    uint64_t v5 = v11;
    uint64_t v6 = BYTE1(v11);
    v7 = PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet();
    v8 = -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:](self, "initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:", v4, v5, v6, v7, v12, *((void *)&v12 + 1), v13);

    if (v8) {
      v8->_persistenceScale = v14;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendSuper];
  if ([(PBFPosterSnapshotDefinition *)self shouldBePersistedOnlyTemporarily]) {
    id v5 = (id)[v3 appendBool:1 withName:@"shouldBePersistedOnlyTemporarily"];
  }
  [(PBFPosterSnapshotDefinition *)self persistenceScale];
  if ((BSFloatIsOne() & 1) == 0)
  {
    [(PBFPosterSnapshotDefinition *)self persistenceScale];
    id v6 = (id)objc_msgSend(v3, "appendFloat:withName:", @"persistenceScale");
  }
  v7 = [v3 build];

  return v7;
}

- (BOOL)shouldBePersistedOnlyTemporarily
{
  v2 = [(PRPosterSnapshotDefinition *)self uniqueIdentifier];
  char v3 = [v2 isEqualToString:PRPosterSnapshotDefinitionIdentifierEditingConfirmation];

  return v3;
}

- (id)_persistenceIdentitifer
{
  persistenceIdentifier = self->_persistenceIdentifier;
  if (persistenceIdentifier)
  {
    char v3 = persistenceIdentifier;
    goto LABEL_19;
  }
  id v5 = [(PRPosterSnapshotDefinition *)self uniqueIdentifier];
  unint64_t v6 = [(PRPosterSnapshotDefinition *)self layerSet];
  switch(v6)
  {
    case 0uLL:
      goto LABEL_8;
    case 2uLL:
      uint64_t v8 = [v5 stringByAppendingString:@"-noFloatingLayer"];

      id v5 = (void *)v8;
LABEL_8:
      v9 = v5;
      if ([(PRPosterSnapshotDefinition *)self includesHeaderElements]) {
        v10 = @"-withHeader";
      }
      else {
        v10 = @"-noHeader";
      }
      id v5 = [v5 stringByAppendingString:v10];

      if (![(PRPosterSnapshotDefinition *)self isUnlocked]) {
        break;
      }
      v7 = @"-unlocked";
      goto LABEL_13;
    case 1uLL:
      v7 = @"-floatingLayerOnly";
LABEL_13:
      uint64_t v11 = [v5 stringByAppendingString:v7];

      id v5 = (void *)v11;
      break;
  }
  if ([(PRPosterSnapshotDefinition *)self previewContent] == 2)
  {
    uint64_t v12 = [v5 stringByAppendingString:@"-KeyFrame"];

    id v5 = (void *)v12;
  }
  [(PBFPosterSnapshotDefinition *)self persistenceScale];
  if ((BSFloatIsOne() & 1) == 0)
  {
    [(PBFPosterSnapshotDefinition *)self persistenceScale];
    uint64_t v14 = objc_msgSend(v5, "stringByAppendingFormat:", @"-PS%f", v13);

    id v5 = (void *)v14;
  }
  char v15 = self->_persistenceIdentifier;
  self->_persistenceIdentifier = (NSString *)v5;
  id v16 = v5;

  char v3 = self->_persistenceIdentifier;
LABEL_19:
  return v3;
}

- (double)persistenceScale
{
  return self->_persistenceScale;
}

- (void).cxx_destruct
{
}

@end