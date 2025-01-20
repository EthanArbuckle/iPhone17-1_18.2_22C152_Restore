@interface PGMemoryProcessedScenesAndFacesCache
- (BOOL)allMomentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4;
- (BOOL)allMomentNodesInCollectionHaveFacesProcessed:(id)a3;
- (BOOL)allMomentNodesInCollectionHaveScenesProcessed:(id)a3;
- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4;
- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4 forYear:(int64_t)a5 inGraph:(id)a6;
- (BOOL)libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:(unint64_t)a3;
- (BOOL)petVIPModelExists;
- (PGMemoryProcessedScenesAndFacesCache)initWithPhotoLibrary:(id)a3;
- (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3;
- (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3;
- (void)setFacesAreProcessedEnoughInYear:(id)a3;
- (void)setScenesAreProcessedEnoughInYear:(id)a3;
@end

@implementation PGMemoryProcessedScenesAndFacesCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petVIPModelExistsAsNumber, 0);
  objc_storeStrong((id *)&self->_momentNodesWithEnoughFacesProcessed, 0);
  objc_storeStrong((id *)&self->_momentNodesWithEnoughScenesProcessed, 0);
  objc_storeStrong((id *)&self->_facesAreProcessedEnoughByYear, 0);
  objc_storeStrong((id *)&self->_scenesAreProcessedWithMinimumSceneAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_scenesAreProcessedEnoughByYear, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setFacesAreProcessedEnoughInYear:(id)a3
{
}

- (void)setScenesAreProcessedEnoughInYear:(id)a3
{
}

- (BOOL)allMomentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v7 graph:v6];

  LOBYTE(v7) = [(PGMemoryProcessedScenesAndFacesCache *)self allMomentNodesInCollectionHaveScenesProcessed:v8];
  return (char)v7;
}

- (BOOL)allMomentNodesInCollectionHaveFacesProcessed:(id)a3
{
  id v4 = a3;
  v5 = [v4 graph];
  id v6 = [(PGMemoryProcessedScenesAndFacesCache *)self momentNodesWithEnoughFacesProcessedInGraph:v5];

  id v7 = [v6 collectionByIntersecting:v4];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [v4 count];

  return v8 == v9;
}

- (BOOL)allMomentNodesInCollectionHaveScenesProcessed:(id)a3
{
  id v4 = a3;
  v5 = [v4 graph];
  id v6 = [(PGMemoryProcessedScenesAndFacesCache *)self momentNodesWithEnoughScenesProcessedInGraph:v5];

  id v7 = [v6 collectionByIntersecting:v4];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [v4 count];

  return v8 == v9;
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4 forYear:(int64_t)a5 inGraph:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  scenesAreProcessedEnoughByYear = self->_scenesAreProcessedEnoughByYear;
  v12 = [NSNumber numberWithInteger:a5];
  v13 = [(NSMutableDictionary *)scenesAreProcessedEnoughByYear objectForKeyedSubscript:v12];

  facesAreProcessedEnoughByYear = self->_facesAreProcessedEnoughByYear;
  v15 = [NSNumber numberWithInteger:a5];
  v16 = [(NSMutableDictionary *)facesAreProcessedEnoughByYear objectForKeyedSubscript:v15];

  LOBYTE(v17) = [v13 BOOLValue];
  char v18 = [v16 BOOLValue];
  if (v13) {
    BOOL v19 = v16 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v41 = +[PGGraphYearNodeCollection yearNodesForYear:a5 inGraph:v10];
    v20 = [v41 dateNodes];
    v21 = [v20 momentNodes];

    unint64_t v22 = [v21 count];
    id v43 = v10;
    BOOL v42 = v7;
    v39 = v21;
    if (v22)
    {
      double v23 = (double)v22;
      v24 = -[PGMemoryProcessedScenesAndFacesCache momentNodesWithEnoughScenesProcessedInGraph:](self, "momentNodesWithEnoughScenesProcessedInGraph:", v10, v21);
      v25 = [v24 collectionByIntersecting:v21];
      double v26 = (double)(unint64_t)[v25 count];

      v27 = [(PGMemoryProcessedScenesAndFacesCache *)self momentNodesWithEnoughFacesProcessedInGraph:v10];
      v28 = [v27 collectionByIntersecting:v21];
      double v29 = (double)(unint64_t)[v28 count];

      uint64_t v17 = v26 / v23 >= 0.9;
      BOOL v30 = v29 / v23 >= 0.9;
    }
    else
    {
      uint64_t v17 = 1;
      BOOL v30 = 1;
    }
    v31 = objc_msgSend(NSNumber, "numberWithBool:", v17, v39);
    v32 = self->_scenesAreProcessedEnoughByYear;
    v33 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v32 setObject:v31 forKeyedSubscript:v33];

    v34 = [NSNumber numberWithBool:v30];
    v35 = self->_facesAreProcessedEnoughByYear;
    v36 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:v36];

    id v10 = v43;
    BOOL v7 = v42;
  }
  else
  {
    LOBYTE(v30) = v18;
  }
  if (v7) {
    char v37 = (!a3 | v17) & v30;
  }
  else {
    char v37 = !a3 | v17;
  }

  return v37;
}

- (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3
{
  momentNodesWithEnoughFacesProcessed = self->_momentNodesWithEnoughFacesProcessed;
  if (!momentNodesWithEnoughFacesProcessed)
  {
    v5 = +[PGGraphMomentNodeCollection momentNodesWithEnoughFacesProcessedInGraph:a3];
    id v6 = self->_momentNodesWithEnoughFacesProcessed;
    self->_momentNodesWithEnoughFacesProcessed = v5;

    momentNodesWithEnoughFacesProcessed = self->_momentNodesWithEnoughFacesProcessed;
  }
  return momentNodesWithEnoughFacesProcessed;
}

- (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3
{
  momentNodesWithEnoughScenesProcessed = self->_momentNodesWithEnoughScenesProcessed;
  if (!momentNodesWithEnoughScenesProcessed)
  {
    v5 = +[PGGraphMomentNodeCollection momentNodesWithEnoughScenesProcessedInGraph:a3];
    id v6 = self->_momentNodesWithEnoughScenesProcessed;
    self->_momentNodesWithEnoughScenesProcessed = v5;

    momentNodesWithEnoughScenesProcessed = self->_momentNodesWithEnoughScenesProcessed;
  }
  return momentNodesWithEnoughScenesProcessed;
}

- (BOOL)libraryHasEnoughScenesProcessedWithMinimumSceneAnalysisVersion:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  scenesAreProcessedWithMinimumSceneAnalysisVersion = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  BOOL v7 = [(NSMutableDictionary *)scenesAreProcessedWithMinimumSceneAnalysisVersion objectForKeyedSubscript:v6];

  if (!v7)
  {
    [(PHPhotoLibrary *)self->_photoLibrary ratioOfAssetsAtOrAboveSceneAnalysisVersion:(__int16)a3];
    uint64_t v9 = [NSNumber numberWithBool:v8 >= 0.9];
    id v10 = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  v12 = self->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
  v13 = [NSNumber numberWithUnsignedInteger:a3];
  v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
  char v15 = [v14 BOOLValue];

  return v15;
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 andProcessedFaces:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = [(NSMutableDictionary *)self->_scenesAreProcessedEnoughByYear objectForKeyedSubscript:&unk_1F28D06D8];
    BOOL v7 = v6;
    if (v6)
    {
      int v8 = [v6 BOOLValue];
    }
    else
    {
      [(PHPhotoLibrary *)self->_photoLibrary ratioOfAssetsWithScenesProcessed];
      int v8 = v9 >= 0.9;
      id v10 = [NSNumber numberWithBool:v9 >= 0.9];
      [(NSMutableDictionary *)self->_scenesAreProcessedEnoughByYear setObject:v10 forKeyedSubscript:&unk_1F28D06D8];
    }
    if (!v8) {
      return v8;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  if (v4)
  {
    v11 = [(NSMutableDictionary *)self->_facesAreProcessedEnoughByYear objectForKeyedSubscript:&unk_1F28D06D8];
    v12 = v11;
    if (v11)
    {
      LOBYTE(v8) = [v11 BOOLValue];
    }
    else
    {
      [(PHPhotoLibrary *)self->_photoLibrary ratioOfAssetsWithFacesProcessed];
      LOBYTE(v8) = v13 >= 0.9;
      v14 = [NSNumber numberWithBool:v13 >= 0.9];
      [(NSMutableDictionary *)self->_facesAreProcessedEnoughByYear setObject:v14 forKeyedSubscript:&unk_1F28D06D8];
    }
  }
  return v8;
}

- (BOOL)petVIPModelExists
{
  petVIPModelExistsAsNumber = self->_petVIPModelExistsAsNumber;
  if (!petVIPModelExistsAsNumber)
  {
    uint64_t v4 = [(PHPhotoLibrary *)self->_photoLibrary petVIPModelExists];
    v5 = [NSNumber numberWithBool:v4];
    id v6 = self->_petVIPModelExistsAsNumber;
    self->_petVIPModelExistsAsNumber = v5;

    petVIPModelExistsAsNumber = self->_petVIPModelExistsAsNumber;
  }
  return [(NSNumber *)petVIPModelExistsAsNumber BOOLValue];
}

- (PGMemoryProcessedScenesAndFacesCache)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMemoryProcessedScenesAndFacesCache;
  id v6 = [(PGMemoryProcessedScenesAndFacesCache *)&v15 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    int v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scenesAreProcessedEnoughByYear = v7->_scenesAreProcessedEnoughByYear;
    v7->_scenesAreProcessedEnoughByYear = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scenesAreProcessedWithMinimumSceneAnalysisVersion = v7->_scenesAreProcessedWithMinimumSceneAnalysisVersion;
    v7->_scenesAreProcessedWithMinimumSceneAnalysisVersion = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    facesAreProcessedEnoughByYear = v7->_facesAreProcessedEnoughByYear;
    v7->_facesAreProcessedEnoughByYear = v12;
  }
  return v7;
}

@end