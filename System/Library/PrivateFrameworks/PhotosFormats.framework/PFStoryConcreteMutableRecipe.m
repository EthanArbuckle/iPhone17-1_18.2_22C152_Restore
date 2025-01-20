@interface PFStoryConcreteMutableRecipe
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAsset:(id)a3;
- (void)addLibrary:(id)a3;
- (void)addPresentation:(id)a3;
- (void)removeAssetWithIdentifier:(id)a3;
- (void)removeLibraryWithKind:(int64_t)a3;
- (void)removePresentationWithIdentifier:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAutoEditDecisionLists:(id)a3;
- (void)setContentIdentifier:(id)a3;
- (void)setCurrentStyle:(id)a3;
- (void)setLibraries:(id)a3;
- (void)setMajorVersion:(int64_t)a3;
- (void)setMinorVersion:(int64_t)a3;
- (void)setOverallDurationInfo:(id *)a3;
- (void)setPresentations:(id)a3;
- (void)setSeedSongIdentifiersByCatalog:(id)a3;
@end

@implementation PFStoryConcreteMutableRecipe

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PFStoryConcreteRecipe alloc];
  v5 = [(PFStoryConcreteRecipe *)self contentIdentifier];
  int64_t v6 = [(PFStoryConcreteRecipe *)self majorVersion];
  int64_t v7 = [(PFStoryConcreteRecipe *)self minorVersion];
  v8 = [(PFStoryConcreteRecipe *)self libraries];
  v9 = [(PFStoryConcreteRecipe *)self assets];
  [(PFStoryConcreteRecipe *)self overallDurationInfo];
  v10 = [(PFStoryConcreteRecipe *)self currentStyle];
  v11 = [(PFStoryConcreteRecipe *)self seedSongIdentifiersByCatalog];
  v12 = [(PFStoryConcreteRecipe *)self autoEditDecisionLists];
  v13 = [(PFStoryConcreteRecipe *)self presentations];
  v14 = [(PFStoryConcreteRecipe *)v4 initWithContentIdentifier:v5 majorVersion:v6 minorVersion:v7 libraries:v8 assets:v9 overallDurationInfo:v16 currentStyle:v10 seedSongIdentifiersByCatalog:v11 autoDecisionLists:v12 presentations:v13];

  return v14;
}

- (void)setSeedSongIdentifiersByCatalog:(id)a3
{
}

- (void)setAutoEditDecisionLists:(id)a3
{
}

- (void)setOverallDurationInfo:(id *)a3
{
  *(_OWORD *)&self->super._overallDurationInfo.kind = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var1.var0.var1;
  long long v4 = *(_OWORD *)&a3->var1.var1.var0;
  long long v5 = *(_OWORD *)&a3->var1.var1.var3;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a3->var1.var2.var1;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v5;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.preferredDuration.value = v4;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v3;
}

- (void)removeLibraryWithKind:(int64_t)a3
{
  long long v5 = [(PFStoryConcreteRecipe *)self libraries];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PFStoryConcreteMutableRecipe_removeLibraryWithKind___block_invoke;
  v10[3] = &__block_descriptor_40_e39_B32__0___PFStoryRecipeLibrary__8Q16_B24l;
  v10[4] = a3;
  int64_t v6 = [v5 indexesOfObjectsPassingTest:v10];

  int64_t v7 = [(PFStoryConcreteRecipe *)self libraries];
  v8 = (void *)[v7 mutableCopy];

  [v8 removeObjectsAtIndexes:v6];
  v9 = (void *)[v8 copy];
  [(PFStoryConcreteMutableRecipe *)self setLibraries:v9];
}

BOOL __54__PFStoryConcreteMutableRecipe_removeLibraryWithKind___block_invoke(uint64_t a1, void *a2)
{
  return [a2 kind] == *(void *)(a1 + 32);
}

- (void)addLibrary:(id)a3
{
  id v8 = a3;
  if (!self->super._libraries)
  {
    long long v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    libraries = self->super._libraries;
    self->super._libraries = v4;
  }
  int64_t v6 = [(PFStoryConcreteRecipe *)self libraries];
  int64_t v7 = [v6 arrayByAddingObject:v8];
  [(PFStoryConcreteMutableRecipe *)self setLibraries:v7];
}

- (void)removePresentationWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v5 = [(PFStoryConcreteRecipe *)self presentations];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PFStoryConcreteMutableRecipe_removePresentationWithIdentifier___block_invoke;
  v11[3] = &unk_1E5B2EE10;
  id v12 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexesOfObjectsPassingTest:v11];

  id v8 = [(PFStoryConcreteRecipe *)self presentations];
  v9 = (void *)[v8 mutableCopy];

  [v9 removeObjectsAtIndexes:v7];
  v10 = (void *)[v9 copy];
  [(PFStoryConcreteMutableRecipe *)self setPresentations:v10];
}

uint64_t __65__PFStoryConcreteMutableRecipe_removePresentationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)addPresentation:(id)a3
{
  id v8 = a3;
  if (!self->super._presentations)
  {
    uint64_t v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    presentations = self->super._presentations;
    self->super._presentations = v4;
  }
  id v6 = [(PFStoryConcreteRecipe *)self presentations];
  int64_t v7 = [v6 arrayByAddingObject:v8];
  [(PFStoryConcreteMutableRecipe *)self setPresentations:v7];
}

- (void)setPresentations:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  presentations = self->super._presentations;
  self->super._presentations = v4;

  MEMORY[0x1F41817F8](v4, presentations);
}

- (void)removeAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v5 = [(PFStoryConcreteRecipe *)self assets];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PFStoryConcreteMutableRecipe_removeAssetWithIdentifier___block_invoke;
  v11[3] = &unk_1E5B2EDE8;
  id v12 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexesOfObjectsPassingTest:v11];

  id v8 = [(PFStoryConcreteRecipe *)self assets];
  v9 = (void *)[v8 mutableCopy];

  [v9 removeObjectsAtIndexes:v7];
  v10 = (void *)[v9 copy];
  [(PFStoryConcreteMutableRecipe *)self setAssets:v10];
}

uint64_t __58__PFStoryConcreteMutableRecipe_removeAssetWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)setCurrentStyle:(id)a3
{
}

- (void)addAsset:(id)a3
{
  id v8 = a3;
  if (!self->super._assets)
  {
    uint64_t v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    assets = self->super._assets;
    self->super._assets = v4;
  }
  id v6 = [(PFStoryConcreteRecipe *)self assets];
  int64_t v7 = [v6 arrayByAddingObject:v8];
  [(PFStoryConcreteMutableRecipe *)self setAssets:v7];
}

- (void)setAssets:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  assets = self->super._assets;
  self->super._assets = v4;

  MEMORY[0x1F41817F8](v4, assets);
}

- (void)setLibraries:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  libraries = self->super._libraries;
  self->super._libraries = v4;

  MEMORY[0x1F41817F8](v4, libraries);
}

- (void)setMinorVersion:(int64_t)a3
{
  self->super._minorVersion = a3;
}

- (void)setMajorVersion:(int64_t)a3
{
  self->super._majorVersion = a3;
}

- (void)setContentIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  contentIdentifier = self->super._contentIdentifier;
  self->super._contentIdentifier = v4;

  MEMORY[0x1F41817F8](v4, contentIdentifier);
}

@end