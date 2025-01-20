@interface PGGraphAddressNodeCollection
+ (Class)nodeClass;
+ (id)addressNodeAsCollectionForUUID:(id)a3 inGraph:(id)a4;
+ (id)addressNodesForUUIDs:(id)a3 inGraph:(id)a4;
+ (id)addressNodesWithinDistance:(double)a3 ofLocations:(id)a4 inGraph:(id)a5;
- (CLLocation)centroidLocation;
- (CLLocationCoordinate2D)centroidCoordinate;
- (NSArray)locations;
- (NSSet)uuids;
- (PGGraphAddressNodeCollection)preciseSubset;
- (PGGraphAreaNodeCollection)areaNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphHomeWorkNodeCollection)homeNodes;
- (PGGraphHomeWorkNodeCollection)homeWorkNodes;
- (PGGraphHomeWorkNodeCollection)workNodes;
- (PGGraphLanguageNodeCollection)languageNodes;
- (PGGraphLocationCityNodeCollection)cityNodes;
- (PGGraphLocationCountryNodeCollection)countryNodes;
- (PGGraphLocationCountyNodeCollection)countyNodes;
- (PGGraphLocationDistrictNodeCollection)districtNodes;
- (PGGraphLocationNumberNodeCollection)numberNodes;
- (PGGraphLocationStateNodeCollection)stateNodes;
- (PGGraphLocationStreetNodeCollection)streetNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (void)enumerateLatitudesUsingBlock:(id)a3;
- (void)enumerateLongitudesUsingBlock:(id)a3;
- (void)enumerateUniversalEndDatesUsingBlock:(id)a3;
@end

@implementation PGGraphAddressNodeCollection

- (NSArray)locations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PGGraphAddressNodeCollection_locations__block_invoke;
  v6[3] = &unk_1E68EFB10;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return (NSArray *)v4;
}

void __41__PGGraphAddressNodeCollection_locations__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 location];
  [v2 addObject:v3];
}

- (CLLocationCoordinate2D)centroidCoordinate
{
  unint64_t v3 = [(MAElementCollection *)self count];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v16 = 0;
    v17 = (double *)&v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v12 = 0;
    v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke;
    v11[3] = &unk_1E68EFA90;
    v11[4] = &v16;
    [(PGGraphAddressNodeCollection *)self enumerateLatitudesUsingBlock:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke_2;
    v10[3] = &unk_1E68EFA90;
    v10[4] = &v12;
    [(PGGraphAddressNodeCollection *)self enumerateLongitudesUsingBlock:v10];
    CLLocationCoordinate2D v5 = CLLocationCoordinate2DMake(v17[3] / (double)v4, v13[3] / (double)v4);
    CLLocationDegrees latitude = v5.latitude;
    CLLocationDegrees longitude = v5.longitude;
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    CLLocationDegrees latitude = *MEMORY[0x1E4F1E750];
    CLLocationDegrees longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  double v8 = latitude;
  double v9 = longitude;
  result.CLLocationDegrees longitude = v9;
  result.CLLocationDegrees latitude = v8;
  return result;
}

double __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

double __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

- (CLLocation)centroidLocation
{
  [(PGGraphAddressNodeCollection *)self centroidCoordinate];
  double latitude = v7.latitude;
  double longitude = v7.longitude;
  if (CLLocationCoordinate2DIsValid(v7)) {
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
  }
  else {
    unint64_t v4 = 0;
  }
  return (CLLocation *)v4;
}

- (void)enumerateLongitudesUsingBlock:(id)a3
{
}

- (void)enumerateLatitudesUsingBlock:(id)a3
{
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphAddressNodeCollection)preciseSubset
{
  unint64_t v3 = +[PGGraphAddressNode preciseFilter];
  unint64_t v4 = [v3 relation];
  CLLocationCoordinate2D v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphAddressNodeCollection *)v5;
}

- (PGGraphAreaNodeCollection)areaNodes
{
  unint64_t v3 = +[PGGraphAddressNode areaOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAreaNodeCollection *)v4;
}

- (PGGraphLanguageNodeCollection)languageNodes
{
  unint64_t v3 = +[PGGraphAddressNode languageOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLanguageNodeCollection *)v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  unint64_t v3 = +[PGGraphAddressNode countryOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (PGGraphLocationStateNodeCollection)stateNodes
{
  unint64_t v3 = +[PGGraphAddressNode stateOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationStateNodeCollection *)v4;
}

- (PGGraphLocationCountyNodeCollection)countyNodes
{
  unint64_t v3 = +[PGGraphAddressNode countyOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCountyNodeCollection *)v4;
}

- (PGGraphLocationCityNodeCollection)cityNodes
{
  unint64_t v3 = +[PGGraphAddressNode cityOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationCityNodeCollection *)v4;
}

- (PGGraphLocationDistrictNodeCollection)districtNodes
{
  unint64_t v3 = +[PGGraphAddressNode districtOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationDistrictNodeCollection *)v4;
}

- (PGGraphLocationStreetNodeCollection)streetNodes
{
  unint64_t v3 = +[PGGraphAddressNode streetOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationStreetNodeCollection *)v4;
}

- (PGGraphLocationNumberNodeCollection)numberNodes
{
  unint64_t v3 = +[PGGraphAddressNode numberOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphLocationNumberNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeWorkNodes
{
  unint64_t v3 = +[PGGraphAddressNode homeWorkOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)workNodes
{
  unint64_t v3 = +[PGGraphAddressNode workOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeNodes
{
  unint64_t v3 = +[PGGraphAddressNode homeOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  unint64_t v3 = +[PGGraphAddressNode momentOfAddress];
  unint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (NSSet)uuids
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphAddressNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"uuid" withBlock:v6];

  return (NSSet *)v4;
}

void __37__PGGraphAddressNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PGGraphAddressNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"utce" withBlock:v6];
}

void __69__PGGraphAddressNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)addressNodesWithinDistance:(double)a3 ofLocations:(id)a4 inGraph:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v11 = [a1 nodesInGraph:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PGGraphAddressNodeCollection_addressNodesWithinDistance_ofLocations_inGraph___block_invoke;
    v15[3] = &unk_1E68EBEA8;
    double v18 = a3;
    id v16 = v8;
    id v17 = v10;
    id v12 = v10;
    [v11 enumerateNodesUsingBlock:v15];

    v13 = (void *)[objc_alloc((Class)a1) initWithGraph:v9 elementIdentifiers:v12];
    id v9 = v12;
  }
  else
  {
    v13 = (void *)[objc_alloc((Class)a1) initWithGraph:v9];
  }

  return v13;
}

void __79__PGGraphAddressNodeCollection_addressNodesWithinDistance_ofLocations_inGraph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "coordinate", v14, v15, 0, 0, (void)v16);
        objc_msgSend(v3, "coordinate", 0, 0, v9, v10);
        uint64_t v14 = v11;
        uint64_t v15 = v12;
        CLLocationCoordinate2DGetDistanceFrom();
        if (v13 <= *(double *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", objc_msgSend(v3, "identifier", v14, v15));
          goto LABEL_11;
        }
      }
      uint64_t v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, v15);
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (id)addressNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PGGraphAddressNode filter];
  uint64_t v12 = @"uuid";
  v13[0] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [v7 filterBySettingProperties:v8];

  uint64_t v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:v5];

  return v10;
}

+ (id)addressNodeAsCollectionForUUID:(id)a3 inGraph:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PGGraphAddressNode filter];
  uint64_t v12 = @"uuid";
  v13[0] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [v7 filterBySettingProperties:v8];

  uint64_t v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:v5];

  return v10;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end