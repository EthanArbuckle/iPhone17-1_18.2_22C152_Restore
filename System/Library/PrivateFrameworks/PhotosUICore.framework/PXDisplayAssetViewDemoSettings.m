@interface PXDisplayAssetViewDemoSettings
+ (PXDisplayAssetViewDemoSettings)sharedInstance;
+ (id)transientProperties;
- (BOOL)allowsTextSelection;
- (BOOL)showDummyTimeRangeHighlight;
- (NSArray)audioIdentifiersToHighlight;
- (NSArray)humanActionIdentifiersToHighlight;
- (NSArray)personLocalIdentifiersToHighlight;
- (NSArray)sceneIdentifiersToHighlight;
- (NSArray)stringsToHighlight;
- (NSString)audioIdentifiersToHighlightString;
- (NSString)humanActionIdentifiersToHighlightString;
- (NSString)personLocalIdentifiersToHighlightString;
- (NSString)sceneIdentifiersToHighlightString;
- (NSString)stringToHighlight;
- (id)parentSettings;
- (int64_t)preferredDynamicRange;
- (void)setAllowsTextSelection:(BOOL)a3;
- (void)setAudioIdentifiersToHighlightString:(id)a3;
- (void)setDefaultValues;
- (void)setHumanActionIdentifiersToHighlightString:(id)a3;
- (void)setPersonLocalIdentifiersToHighlightString:(id)a3;
- (void)setPreferredDynamicRange:(int64_t)a3;
- (void)setSceneIdentifiersToHighlightString:(id)a3;
- (void)setShowDummyTimeRangeHighlight:(BOOL)a3;
- (void)setStringToHighlight:(id)a3;
@end

@implementation PXDisplayAssetViewDemoSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetViewDemoSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXDisplayAssetViewDemoSettings *)self setPreferredDynamicRange:2];
  [(PXDisplayAssetViewDemoSettings *)self setAllowsTextSelection:0];
  [(PXDisplayAssetViewDemoSettings *)self setStringToHighlight:0];
  [(PXDisplayAssetViewDemoSettings *)self setSceneIdentifiersToHighlightString:0];
  [(PXDisplayAssetViewDemoSettings *)self setAudioIdentifiersToHighlightString:0];
  [(PXDisplayAssetViewDemoSettings *)self setHumanActionIdentifiersToHighlightString:0];
  [(PXDisplayAssetViewDemoSettings *)self setShowDummyTimeRangeHighlight:0];
}

- (void)setStringToHighlight:(id)a3
{
}

- (void)setShowDummyTimeRangeHighlight:(BOOL)a3
{
  self->_showDummyTimeRangeHighlight = a3;
}

- (void)setSceneIdentifiersToHighlightString:(id)a3
{
}

- (void)setPreferredDynamicRange:(int64_t)a3
{
  self->_preferredDynamicRange = a3;
}

- (void)setHumanActionIdentifiersToHighlightString:(id)a3
{
}

- (void)setAudioIdentifiersToHighlightString:(id)a3
{
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  self->_allowsTextSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlightString, 0);
  objc_storeStrong((id *)&self->_stringToHighlight, 0);
}

- (int64_t)preferredDynamicRange
{
  return self->_preferredDynamicRange;
}

- (BOOL)showDummyTimeRangeHighlight
{
  return self->_showDummyTimeRangeHighlight;
}

- (void)setPersonLocalIdentifiersToHighlightString:(id)a3
{
}

- (NSString)personLocalIdentifiersToHighlightString
{
  return self->_personLocalIdentifiersToHighlightString;
}

- (NSString)humanActionIdentifiersToHighlightString
{
  return self->_humanActionIdentifiersToHighlightString;
}

- (NSString)audioIdentifiersToHighlightString
{
  return self->_audioIdentifiersToHighlightString;
}

- (NSString)sceneIdentifiersToHighlightString
{
  return self->_sceneIdentifiersToHighlightString;
}

- (NSString)stringToHighlight
{
  return self->_stringToHighlight;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  v2 = [(PXDisplayAssetViewDemoSettings *)self personLocalIdentifiersToHighlightString];
  objc_super v3 = [v2 componentsSeparatedByString:@","];

  return (NSArray *)v3;
}

- (NSArray)humanActionIdentifiersToHighlight
{
}

uint64_t __67__PXDisplayAssetViewDemoSettings_humanActionIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

- (NSArray)audioIdentifiersToHighlight
{
}

uint64_t __61__PXDisplayAssetViewDemoSettings_audioIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

- (NSArray)sceneIdentifiersToHighlight
{
}

uint64_t __61__PXDisplayAssetViewDemoSettings_sceneIdentifiersToHighlight__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

- (NSArray)stringsToHighlight
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PXDisplayAssetViewDemoSettings *)self stringToHighlight];
  if ([v2 length])
  {
    v5[0] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXDisplayAssetViewDemoSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_107722 != -1) {
    dispatch_once(&transientProperties_onceToken_107722, block);
  }
  v2 = (void *)transientProperties_transientProperties_107723;
  return v2;
}

void __53__PXDisplayAssetViewDemoSettings_transientProperties__block_invoke(uint64_t a1)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___PXDisplayAssetViewDemoSettings;
  v1 = objc_msgSendSuper2(&v10, sel_transientProperties);
  v2 = NSStringFromSelector(sel_stringsToHighlight);
  v11[0] = v2;
  uint64_t v3 = NSStringFromSelector(sel_sceneIdentifiersToHighlight);
  v11[1] = v3;
  v4 = NSStringFromSelector(sel_audioIdentifiersToHighlight);
  v11[2] = v4;
  v5 = NSStringFromSelector(sel_humanActionIdentifiersToHighlight);
  v11[3] = v5;
  v6 = NSStringFromSelector(sel_personLocalIdentifiersToHighlight);
  v11[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  uint64_t v8 = [v1 setByAddingObjectsFromArray:v7];
  v9 = (void *)transientProperties_transientProperties_107723;
  transientProperties_transientProperties_107723 = v8;
}

+ (PXDisplayAssetViewDemoSettings)sharedInstance
{
  if (sharedInstance_onceToken_107730 != -1) {
    dispatch_once(&sharedInstance_onceToken_107730, &__block_literal_global_107731);
  }
  v2 = (void *)sharedInstance_sharedInstance_107732;
  return (PXDisplayAssetViewDemoSettings *)v2;
}

void __48__PXDisplayAssetViewDemoSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 assetViewDemoSettings];
  v1 = (void *)sharedInstance_sharedInstance_107732;
  sharedInstance_sharedInstance_107732 = v0;
}

@end