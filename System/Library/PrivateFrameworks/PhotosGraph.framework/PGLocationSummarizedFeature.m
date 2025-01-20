@interface PGLocationSummarizedFeature
+ (unsigned)summarizedFeatureSubtypeForLocationNode:(id)a3;
- (BOOL)isMandatoryForKeyAsset;
- (NSSet)intervalsPresent;
- (NSString)locationName;
- (PGGraphLocationOrArea)locationNode;
- (PGGraphPersonNode)personNode;
- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7;
- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7 personNode:(id)a8 locationName:(id)a9;
- (unint64_t)numberOfAssets;
- (unsigned)subtype;
- (unsigned)type;
@end

@implementation PGLocationSummarizedFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
  objc_storeStrong((id *)&self->_locationNode, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

- (NSString)locationName
{
  return self->_locationName;
}

- (PGGraphPersonNode)personNode
{
  return self->_personNode;
}

- (PGGraphLocationOrArea)locationNode
{
  return self->_locationNode;
}

- (BOOL)isMandatoryForKeyAsset
{
  return self->_isMandatoryForKeyAsset;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (NSSet)intervalsPresent
{
  return self->_intervalsPresent;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7
{
  return [(PGLocationSummarizedFeature *)self initWithSubtype:a3 intervalsPresent:a4 numberOfAssets:a5 isMandatoryForKeyAsset:a6 locationNode:a7 personNode:0 locationName:0];
}

- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7 personNode:(id)a8 locationName:(id)a9
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PGLocationSummarizedFeature;
  v18 = [(PGLocationSummarizedFeature *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = 1;
    v18->_subtype = a3;
    uint64_t v20 = PGSummarizedFeatureConsolidatedDateIntervals(v14);
    intervalsPresent = v19->_intervalsPresent;
    v19->_intervalsPresent = (NSSet *)v20;

    v19->_numberOfAssets = a5;
    v19->_isMandatoryForKeyAsset = a6;
    objc_storeStrong((id *)&v19->_locationNode, a7);
    objc_storeStrong((id *)&v19->_personNode, a8);
    objc_storeStrong((id *)&v19->_locationName, a9);
  }

  return v19;
}

+ (unsigned)summarizedFeatureSubtypeForLocationNode:(id)a3
{
  id v3 = a3;
  v4 = [v3 label];
  char v5 = [v4 isEqualToString:@"Address"];

  if (v5)
  {
    unsigned __int16 v6 = 1;
  }
  else
  {
    v7 = [v3 label];
    char v8 = [v7 isEqualToString:@"Area"];

    if (v8)
    {
      unsigned __int16 v6 = 2;
    }
    else
    {
      v9 = [v3 label];
      char v10 = [v9 isEqualToString:@"District"];

      if (v10)
      {
        unsigned __int16 v6 = 3;
      }
      else
      {
        v11 = [v3 label];
        char v12 = [v11 isEqualToString:@"City"];

        if (v12)
        {
          unsigned __int16 v6 = 4;
        }
        else
        {
          v13 = [v3 label];
          int v14 = [v13 isEqualToString:@"County"];

          if (v14) {
            unsigned __int16 v6 = 5;
          }
          else {
            unsigned __int16 v6 = 0;
          }
        }
      }
    }
  }

  return v6;
}

@end