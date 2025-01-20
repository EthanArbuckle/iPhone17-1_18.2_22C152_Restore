@interface PGFeatureExtractorAssetSpecialPOI
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
- (PGFeatureExtractorAssetSpecialPOI)initWithGraph:(id)a3;
- (PGGraph)graph;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)floatVectorWithMoment:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetSpecialPOI

- (void).cxx_destruct
{
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
    *a3 = [v9 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorSpecialPOIDomain" code:a4 userInfo:v10];
  }
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v6 withType:3 options:0];
  v8 = [v7 firstObject];
  if (v8)
  {
    uint64_t v9 = [(PGGraph *)self->_graph momentNodeForMoment:v8];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(PGFeatureExtractorAssetSpecialPOI *)self floatVectorWithMoment:v9 error:a4];
      goto LABEL_7;
    }
    v14 = NSString;
    v15 = [v6 localIdentifier];
    v16 = [v14 stringWithFormat:@"Moment node could not be fetched from asset collection of asset %@", v15];
    [(PGFeatureExtractorAssetSpecialPOI *)self _generateError:a4 withCode:1 andMessage:v16];

    v10 = 0;
  }
  else
  {
    uint64_t v12 = NSString;
    v10 = [v6 localIdentifier];
    v13 = [v12 stringWithFormat:@"Asset collection could not be fetched from asset %@", v10];
    [(PGFeatureExtractorAssetSpecialPOI *)self _generateError:a4 withCode:0 andMessage:v13];
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)floatVectorWithMoment:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [PGSpecialPOIResolver alloc];
  v13[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v8 = [(PGSpecialPOIResolver *)v6 initWithMomentNodes:v7];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorAssetSpecialPOI featureLength](self, "featureLength"));

  if ([(PGSpecialPOIResolver *)v8 momentsContainSpecialPOI:1 withMomentRatio:1.0])
  {
    LODWORD(v10) = 1.0;
    [v9 setFloat:0 atIndex:v10];
  }
  if ([(PGSpecialPOIResolver *)v8 momentsContainSpecialPOI:2 withMomentRatio:1.0])
  {
    LODWORD(v11) = 1.0;
    [v9 setFloat:1 atIndex:v11];
  }

  return v9;
}

- (int64_t)featureLength
{
  return 2;
}

- (id)featureNames
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Disney";
  v4[1] = @"Universal";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)name
{
  v2 = @"SpecialPOI";
  return @"SpecialPOI";
}

- (PGFeatureExtractorAssetSpecialPOI)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGFeatureExtractorAssetSpecialPOI;
  id v6 = [(PGFeatureExtractorAssetSpecialPOI *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

@end