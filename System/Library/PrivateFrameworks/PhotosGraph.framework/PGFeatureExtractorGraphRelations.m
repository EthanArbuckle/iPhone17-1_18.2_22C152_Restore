@interface PGFeatureExtractorGraphRelations
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
- (MAFeatureExtractor)featureExtractor;
- (PGFeatureExtractorGraphRelations)initWithGraph:(id)a3 featureExtractor:(id)a4;
- (PGGraph)graph;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)floatVectorWithMomentNodeCollection:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorGraphRelations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (MAFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = v7;
  if (a3 && !*a3)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v9 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorGraphRelations" code:a4 userInfo:v10];
  }
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v6 withType:3 options:0];
  v8 = [v7 firstObject];
  v9 = v8;
  if (!v8)
  {
    v17 = NSString;
    v13 = [v6 localIdentifier];
    v18 = [v17 stringWithFormat:@"Asset collection could not be fetched from asset %@", v13];
    [(PGFeatureExtractorGraphRelations *)self _generateError:a4 withCode:0 andMessage:v18];

    goto LABEL_5;
  }
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = [v8 uuid];
  uint64_t v12 = [v10 setWithObject:v11];
  v13 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v12 inGraph:self->_graph];

  if ([v13 isEmpty])
  {
    v14 = NSString;
    v15 = [v6 localIdentifier];
    v16 = [v14 stringWithFormat:@"Moment node could not be fetched from asset collection of asset %@", v15];
    [(PGFeatureExtractorGraphRelations *)self _generateError:a4 withCode:1 andMessage:v16];

LABEL_5:
    v19 = 0;
    goto LABEL_7;
  }
  v19 = [(PGFeatureExtractorGraphRelations *)self floatVectorWithMomentNodeCollection:v13 error:a4];
LABEL_7:

  return v19;
}

- (id)floatVectorWithMomentNodeCollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PGFeatureExtractorGraphRelations *)self featureExtractor];
  v8 = [v7 floatVectorWithEntity:v6 error:a4];

  return v8;
}

- (int64_t)featureLength
{
  v2 = [(PGFeatureExtractorGraphRelations *)self featureExtractor];
  v3 = [v2 featureNames];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)featureNames
{
  v2 = [(PGFeatureExtractorGraphRelations *)self featureExtractor];
  v3 = [v2 featureNames];

  return v3;
}

- (id)name
{
  v2 = [(PGFeatureExtractorGraphRelations *)self featureExtractor];
  v3 = [v2 name];

  return v3;
}

- (PGFeatureExtractorGraphRelations)initWithGraph:(id)a3 featureExtractor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorGraphRelations;
  v9 = [(PGFeatureExtractorGraphRelations *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_featureExtractor, a4);
  }

  return v10;
}

@end