@interface PVEffectDebugViewOptions
+ (NSArray)persistedProperties;
+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3;
+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3 propertyToKeyMap:(id)a4;
+ (PVEffectDebugViewOptions)optionsWithUserDefaults:(id)a3 propertyToKeyMap:(id)a4;
+ (id)keyPathsForValuesAffectingAnyPersistedPropertyChanged;
+ (id)options;
+ (id)propertyToDefaultKeyMap;
+ (id)remapKeysToPropertyKeys:(id)a3 propertyToKeyMap:(id)a4;
- (BOOL)isEnabled;
- (BOOL)saveToUserDefaultsOnUpdate;
- (BOOL)showCornerPoints;
- (BOOL)showDocumentBoundingBox;
- (BOOL)showHitAreaPoints;
- (BOOL)showHitAreaShape;
- (BOOL)showMidpoint;
- (BOOL)showObjectAlignedBoundingBox;
- (BOOL)showOrigin;
- (BOOL)showOutputROI;
- (BOOL)showTextBoundingBoxes;
- (BOOL)showTextCornerPoints;
- (BOOL)showUserPoints;
- (BOOL)showUserRects;
- (NSArray)cornerPointColors;
- (NSArray)hitAreaPointColors;
- (NSArray)textBoundingBoxColors;
- (NSArray)textCornerPointColors;
- (NSDictionary)propertyToKeyMap;
- (PVEffectDebugViewOptions)init;
- (UIColor)documentBoundingBoxColor;
- (UIColor)hitAreaShapeColor;
- (UIColor)midpointColor;
- (UIColor)objectAlignedBoundingBoxColor;
- (UIColor)originColor;
- (UIColor)outputROIColor;
- (id)anyPersistedPropertyChanged;
- (id)description;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCornerPointColors:(id)a3;
- (void)setDocumentBoundingBoxColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHitAreaPointColors:(id)a3;
- (void)setHitAreaShapeColor:(id)a3;
- (void)setMidpointColor:(id)a3;
- (void)setObjectAlignedBoundingBoxColor:(id)a3;
- (void)setOriginColor:(id)a3;
- (void)setOutputROIColor:(id)a3;
- (void)setPropertyToKeyMap:(id)a3;
- (void)setSaveToUserDefaultsOnUpdate:(BOOL)a3;
- (void)setShowCornerPoints:(BOOL)a3;
- (void)setShowDocumentBoundingBox:(BOOL)a3;
- (void)setShowHitAreaPoints:(BOOL)a3;
- (void)setShowHitAreaShape:(BOOL)a3;
- (void)setShowMidpoint:(BOOL)a3;
- (void)setShowObjectAlignedBoundingBox:(BOOL)a3;
- (void)setShowOrigin:(BOOL)a3;
- (void)setShowOutputROI:(BOOL)a3;
- (void)setShowTextBoundingBoxes:(BOOL)a3;
- (void)setShowTextCornerPoints:(BOOL)a3;
- (void)setShowUserPoints:(BOOL)a3;
- (void)setShowUserRects:(BOOL)a3;
- (void)setTextBoundingBoxColors:(id)a3;
- (void)setTextCornerPointColors:(id)a3;
@end

@implementation PVEffectDebugViewOptions

- (void)dealloc
{
  v3 = +[PVEffectDebugViewOptions persistedProperties];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __35__PVEffectDebugViewOptions_dealloc__block_invoke;
  v5[3] = &unk_1E61690B0;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)PVEffectDebugViewOptions;
  [(PVEffectDebugViewOptions *)&v4 dealloc];
}

uint64_t __35__PVEffectDebugViewOptions_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 32) forKeyPath:a2];
}

+ (id)options
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_super v4 = [a1 propertyToDefaultKeyMap];
  v5 = [a1 optionsWithUserDefaults:v3 propertyToKeyMap:v4];

  return v5;
}

+ (PVEffectDebugViewOptions)optionsWithUserDefaults:(id)a3 propertyToKeyMap:(id)a4
{
  id v6 = a4;
  v7 = [a3 dictionaryRepresentation];
  v8 = [a1 optionsWithDictionary:v7 propertyToKeyMap:v6];

  return (PVEffectDebugViewOptions *)v8;
}

+ (id)remapKeysToPropertyKeys:(id)a3 propertyToKeyMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v9 = [a1 persistedProperties];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = *(void *)"";
  v16[2] = __69__PVEffectDebugViewOptions_remapKeysToPropertyKeys_propertyToKeyMap___block_invoke;
  v16[3] = &unk_1E616B9E0;
  id v17 = v7;
  id v10 = v8;
  id v18 = v10;
  id v19 = v6;
  id v11 = v6;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:v16];

  v13 = v19;
  id v14 = v10;

  return v14;
}

void __69__PVEffectDebugViewOptions_remapKeysToPropertyKeys_propertyToKeyMap___block_invoke(id *a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3) {
    id v3 = v5;
  }
  objc_super v4 = [a1[6] objectForKeyedSubscript:v3];
  [a1[5] setObject:v4 forKeyedSubscript:v5];
}

+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [a1 propertyToDefaultKeyMap];
  id v6 = [a1 optionsWithDictionary:v4 propertyToKeyMap:v5];

  return (PVEffectDebugViewOptions *)v6;
}

+ (PVEffectDebugViewOptions)optionsWithDictionary:(id)a3 propertyToKeyMap:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setPropertyToKeyMap:v5];
  uint64_t v8 = [v7 saveToUserDefaultsOnUpdate];
  [v7 setSaveToUserDefaultsOnUpdate:0];
  v9 = +[PVEffectDebugViewOptions remapKeysToPropertyKeys:v6 propertyToKeyMap:v5];

  [v7 setValuesForKeysWithDictionary:v9];
  [v7 setSaveToUserDefaultsOnUpdate:v8];

  return (PVEffectDebugViewOptions *)v7;
}

- (PVEffectDebugViewOptions)init
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PVEffectDebugViewOptions;
  v2 = [(PVEffectDebugViewOptions *)&v27 init];
  if (v2)
  {
    id v3 = +[PVEffectDebugViewOptions persistedProperties];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = *(void *)"";
    v24 = __32__PVEffectDebugViewOptions_init__block_invoke;
    v25 = &unk_1E61690B0;
    id v4 = v2;
    v26 = v4;
    [v3 enumerateObjectsUsingBlock:&v22];

    id v5 = objc_msgSend(MEMORY[0x1E4F428B8], "magentaColor", v22, v23, v24, v25);
    [(PVEffectDebugViewOptions *)v4 setDocumentBoundingBoxColor:v5];

    id v6 = [MEMORY[0x1E4F428B8] yellowColor];
    [(PVEffectDebugViewOptions *)v4 setOutputROIColor:v6];

    id v7 = [MEMORY[0x1E4F428B8] cyanColor];
    [(PVEffectDebugViewOptions *)v4 setObjectAlignedBoundingBoxColor:v7];

    uint64_t v8 = [MEMORY[0x1E4F428B8] greenColor];
    v31[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [(PVEffectDebugViewOptions *)v4 setTextBoundingBoxColors:v9];

    id v10 = [MEMORY[0x1E4F428B8] orangeColor];
    [(PVEffectDebugViewOptions *)v4 setHitAreaShapeColor:v10];

    id v11 = [MEMORY[0x1E4F428B8] cyanColor];
    [(PVEffectDebugViewOptions *)v4 setMidpointColor:v11];

    id v12 = [MEMORY[0x1E4F428B8] lightGrayColor];
    [(PVEffectDebugViewOptions *)v4 setOriginColor:v12];

    v13 = [MEMORY[0x1E4F428B8] blueColor];
    id v14 = [MEMORY[0x1E4F428B8] redColor];
    v30[0] = v14;
    v30[1] = v13;
    v30[2] = v13;
    v30[3] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [(PVEffectDebugViewOptions *)v4 setCornerPointColors:v15];

    v16 = [MEMORY[0x1E4F428B8] colorWithRed:0.215686275 green:0.431372549 blue:0.0 alpha:1.0];
    id v17 = [MEMORY[0x1E4F428B8] redColor];
    v29[0] = v17;
    v29[1] = v16;
    v29[2] = v16;
    v29[3] = v16;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [(PVEffectDebugViewOptions *)v4 setTextCornerPointColors:v18];

    id v19 = [MEMORY[0x1E4F428B8] yellowColor];
    v28 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [(PVEffectDebugViewOptions *)v4 setHitAreaPointColors:v20];

    [(PVEffectDebugViewOptions *)v4 setSaveToUserDefaultsOnUpdate:1];
  }
  return v2;
}

void __32__PVEffectDebugViewOptions_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:v4];
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 32) forKeyPath:v4 options:1 context:0];
}

- (id)anyPersistedPropertyChanged
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_saveToUserDefaultsOnUpdate)
  {
    id v11 = [(NSDictionary *)self->_propertyToKeyMap objectForKeyedSubscript:v18];
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F284C8];
      v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15 = [v10 objectForKeyedSubscript:v12];
        uint64_t v16 = [v15 BOOLValue];

        id v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v17 setBool:v16 forKey:v11];
      }
    }
  }
}

+ (NSArray)persistedProperties
{
  if (persistedProperties_onceToken != -1) {
    dispatch_once(&persistedProperties_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)persistedProperties_s_persistedProperties;

  return (NSArray *)v2;
}

void __47__PVEffectDebugViewOptions_persistedProperties__block_invoke()
{
  v0 = (void *)persistedProperties_s_persistedProperties;
  persistedProperties_s_persistedProperties = (uint64_t)&unk_1F11EC670;
}

+ (id)propertyToDefaultKeyMap
{
  if (propertyToDefaultKeyMap_onceToken != -1) {
    dispatch_once(&propertyToDefaultKeyMap_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)propertyToDefaultKeyMap_s_propertyToDefaultKeyMap;

  return v2;
}

void __51__PVEffectDebugViewOptions_propertyToDefaultKeyMap__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA60] dictionary];
  [v0 setObject:@"kPVEffectDebugViewEnabled" forKeyedSubscript:@"enabled"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowDocumentBoundingBox" forKeyedSubscript:@"showDocumentBoundingBox"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowOutputROI" forKeyedSubscript:@"showOutputROI"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowObjectAlignedBoundingBox" forKeyedSubscript:@"showObjectAlignedBoundingBox"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowTextBoundingBoxes" forKeyedSubscript:@"showTextBoundingBoxes"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowHitAreaShape" forKeyedSubscript:@"showHitAreaShape"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowOrigin" forKeyedSubscript:@"showOrigin"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowMidpoint" forKeyedSubscript:@"showMidpoint"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowCornerPoints" forKeyedSubscript:@"showCornerPoints"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowTextCornerPoints" forKeyedSubscript:@"showTextCornerPoints"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowHitAreaPoints" forKeyedSubscript:@"showHitAreaPoints"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowUserRects" forKeyedSubscript:@"showUserRects"];
  [v0 setObject:@"kPVEffectDebugViewOption_ShowUserPoints" forKeyedSubscript:@"showUserPoints"];
  v1 = (void *)propertyToDefaultKeyMap_s_propertyToDefaultKeyMap;
  propertyToDefaultKeyMap_s_propertyToDefaultKeyMap = (uint64_t)v0;
}

+ (id)keyPathsForValuesAffectingAnyPersistedPropertyChanged
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a1 persistedProperties];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)PVEffectDebugViewOptions;
  id v4 = [(PVEffectDebugViewOptions *)&v21 description];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = +[PVEffectDebugViewOptions persistedProperties];
  uint64_t v8 = [v7 count];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  id v9 = +[PVEffectDebugViewOptions persistedProperties];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = *(void *)"";
  v19[2] = __39__PVEffectDebugViewOptions_description__block_invoke;
  v19[3] = &unk_1E616BA08;
  v19[4] = v20;
  [v9 enumerateObjectsUsingBlock:v19];

  id v10 = +[PVEffectDebugViewOptions persistedProperties];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = *(void *)"";
  v14[2] = __39__PVEffectDebugViewOptions_description__block_invoke_2;
  v14[3] = &unk_1E616BA30;
  id v17 = v20;
  id v11 = v6;
  id v15 = v11;
  uint64_t v16 = self;
  uint64_t v18 = v8 - 1;
  [v10 enumerateObjectsUsingBlock:v14];

  id v12 = v11;
  _Block_object_dispose(v20, 8);

  return v12;
}

void __39__PVEffectDebugViewOptions_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 length] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 length];
  }
}

void __39__PVEffectDebugViewOptions_description__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 4;
  id v6 = a2;
  id v11 = [v6 stringByPaddingToLength:v5 withString:@" " startingAtIndex:0];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [&stru_1F119C770 stringByPaddingToLength:4 withString:@" " startingAtIndex:0];
  id v9 = [*(id *)(a1 + 40) valueForKey:v6];

  if (*(void *)(a1 + 56) <= a3) {
    id v10 = &stru_1F119C770;
  }
  else {
    id v10 = @"\n";
  }
  [v7 appendFormat:@"%@%@%@%@", v8, v11, v9, v10];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)showDocumentBoundingBox
{
  return self->_showDocumentBoundingBox;
}

- (void)setShowDocumentBoundingBox:(BOOL)a3
{
  self->_showDocumentBoundingBox = a3;
}

- (BOOL)showOutputROI
{
  return self->_showOutputROI;
}

- (void)setShowOutputROI:(BOOL)a3
{
  self->_showOutputROI = a3;
}

- (BOOL)showObjectAlignedBoundingBox
{
  return self->_showObjectAlignedBoundingBox;
}

- (void)setShowObjectAlignedBoundingBox:(BOOL)a3
{
  self->_showObjectAlignedBoundingBox = a3;
}

- (BOOL)showTextBoundingBoxes
{
  return self->_showTextBoundingBoxes;
}

- (void)setShowTextBoundingBoxes:(BOOL)a3
{
  self->_showTextBoundingBoxes = a3;
}

- (BOOL)showHitAreaShape
{
  return self->_showHitAreaShape;
}

- (void)setShowHitAreaShape:(BOOL)a3
{
  self->_showHitAreaShape = a3;
}

- (BOOL)showOrigin
{
  return self->_showOrigin;
}

- (void)setShowOrigin:(BOOL)a3
{
  self->_showOrigin = a3;
}

- (BOOL)showMidpoint
{
  return self->_showMidpoint;
}

- (void)setShowMidpoint:(BOOL)a3
{
  self->_showMidpoint = a3;
}

- (BOOL)showCornerPoints
{
  return self->_showCornerPoints;
}

- (void)setShowCornerPoints:(BOOL)a3
{
  self->_showCornerPoints = a3;
}

- (BOOL)showTextCornerPoints
{
  return self->_showTextCornerPoints;
}

- (void)setShowTextCornerPoints:(BOOL)a3
{
  self->_showTextCornerPoints = a3;
}

- (BOOL)showHitAreaPoints
{
  return self->_showHitAreaPoints;
}

- (void)setShowHitAreaPoints:(BOOL)a3
{
  self->_showHitAreaPoints = a3;
}

- (BOOL)showUserRects
{
  return self->_showUserRects;
}

- (void)setShowUserRects:(BOOL)a3
{
  self->_showUserRects = a3;
}

- (BOOL)showUserPoints
{
  return self->_showUserPoints;
}

- (void)setShowUserPoints:(BOOL)a3
{
  self->_showUserPoints = a3;
}

- (UIColor)documentBoundingBoxColor
{
  return self->_documentBoundingBoxColor;
}

- (void)setDocumentBoundingBoxColor:(id)a3
{
}

- (UIColor)outputROIColor
{
  return self->_outputROIColor;
}

- (void)setOutputROIColor:(id)a3
{
}

- (UIColor)objectAlignedBoundingBoxColor
{
  return self->_objectAlignedBoundingBoxColor;
}

- (void)setObjectAlignedBoundingBoxColor:(id)a3
{
}

- (NSArray)textBoundingBoxColors
{
  return self->_textBoundingBoxColors;
}

- (void)setTextBoundingBoxColors:(id)a3
{
}

- (UIColor)hitAreaShapeColor
{
  return self->_hitAreaShapeColor;
}

- (void)setHitAreaShapeColor:(id)a3
{
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (void)setMidpointColor:(id)a3
{
}

- (UIColor)originColor
{
  return self->_originColor;
}

- (void)setOriginColor:(id)a3
{
}

- (NSArray)cornerPointColors
{
  return self->_cornerPointColors;
}

- (void)setCornerPointColors:(id)a3
{
}

- (NSArray)textCornerPointColors
{
  return self->_textCornerPointColors;
}

- (void)setTextCornerPointColors:(id)a3
{
}

- (NSArray)hitAreaPointColors
{
  return self->_hitAreaPointColors;
}

- (void)setHitAreaPointColors:(id)a3
{
}

- (BOOL)saveToUserDefaultsOnUpdate
{
  return self->_saveToUserDefaultsOnUpdate;
}

- (void)setSaveToUserDefaultsOnUpdate:(BOOL)a3
{
  self->_saveToUserDefaultsOnUpdate = a3;
}

- (NSDictionary)propertyToKeyMap
{
  return self->_propertyToKeyMap;
}

- (void)setPropertyToKeyMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyToKeyMap, 0);
  objc_storeStrong((id *)&self->_hitAreaPointColors, 0);
  objc_storeStrong((id *)&self->_textCornerPointColors, 0);
  objc_storeStrong((id *)&self->_cornerPointColors, 0);
  objc_storeStrong((id *)&self->_originColor, 0);
  objc_storeStrong((id *)&self->_midpointColor, 0);
  objc_storeStrong((id *)&self->_hitAreaShapeColor, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxColors, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_outputROIColor, 0);

  objc_storeStrong((id *)&self->_documentBoundingBoxColor, 0);
}

@end