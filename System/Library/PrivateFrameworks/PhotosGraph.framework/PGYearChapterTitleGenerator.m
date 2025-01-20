@interface PGYearChapterTitleGenerator
- (PGYearChapterTitleGenerator)initWithTriggeredMemory:(id)a3;
- (id)generateChapterTitles;
- (id)momentNodesByChapterYearNodeWithMomentNodes:(id)a3;
@end

@implementation PGYearChapterTitleGenerator

- (void).cxx_destruct
{
}

- (id)generateChapterTitles
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33695;
  v11 = __Block_byref_object_dispose__33696;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  momentNodesByChapterYearNode = self->_momentNodesByChapterYearNode;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PGYearChapterTitleGenerator_generateChapterTitles__block_invoke;
  v6[3] = &unk_1E68E9230;
  v6[4] = &v7;
  [(MABinaryAdjacency *)momentNodesByChapterYearNode enumerateTargetsBySourceWithBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__PGYearChapterTitleGenerator_generateChapterTitles__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a3;
  id v7 = a2;
  v8 = objc_alloc_init(PGTimeTitleOptions);
  [(PGTimeTitleOptions *)v8 setAllowedFormats:4];
  uint64_t v9 = [v17 set];
  [(PGTimeTitleOptions *)v8 setMomentNodes:v9];

  [(PGTimeTitleOptions *)v8 setFeaturedYearNodes:v7];
  v10 = +[PGTimeTitleUtility timeTitleWithOptions:v8];
  if (v10)
  {
    v11 = [PGChapterTitle alloc];
    id v12 = [v17 localDateInterval];
    v13 = [(PGChapterTitle *)v11 initWithLocalizedTitleString:v10 chapterDateInterval:v12];

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v13];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

- (id)momentNodesByChapterYearNodeWithMomentNodes:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PGGraphMomentNode dateOfMoment];
  v5 = +[PGGraphDateNode yearOfDate];
  id v6 = objc_alloc(MEMORY[0x1E4F71E90]);
  v12[0] = v4;
  v12[1] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = (void *)[v6 initWithSteps:v7];

  uint64_t v9 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v3 relation:v8 targetsClass:objc_opt_class()];

  v10 = [v9 transposed];

  return v10;
}

- (PGYearChapterTitleGenerator)initWithTriggeredMemory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGYearChapterTitleGenerator;
  v5 = [(PGYearChapterTitleGenerator *)&v10 init];
  if (v5)
  {
    id v6 = [v4 memoryMomentNodes];
    uint64_t v7 = [(PGYearChapterTitleGenerator *)v5 momentNodesByChapterYearNodeWithMomentNodes:v6];
    momentNodesByChapterYearNode = v5->_momentNodesByChapterYearNode;
    v5->_momentNodesByChapterYearNode = (MABinaryAdjacency *)v7;
  }
  return v5;
}

@end