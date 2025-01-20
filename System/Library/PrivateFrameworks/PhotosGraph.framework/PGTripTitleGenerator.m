@interface PGTripTitleGenerator
+ (id)titleForFeaturedLocationNodes:(id)a3 momentNodes:(id)a4 locationHelper:(id)a5 error:(id *)a6;
+ (id)titleForTripNodeAsCollection:(id)a3 locationHelper:(id)a4 error:(id *)a5;
+ (id)titleTupleForDayHighlightGroupNode:(id)a3 locationHelper:(id)a4 error:(id *)a5;
- (PGTripTitleGenerator)init;
@end

@implementation PGTripTitleGenerator

+ (id)titleForTripNodeAsCollection:(id)a3 locationHelper:(id)a4 error:(id *)a5
{
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v7, sel_tripFeatureNodes);
  id v10 = objc_msgSend(v7, sel_momentNodes);
  static TripTitleGenerator.title(for:momentNodes:locationHelper:)(v9, v10, v8);

  v11 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)titleForFeaturedLocationNodes:(id)a3 momentNodes:(id)a4 locationHelper:(id)a5 error:(id *)a6
{
  swift_getObjCClassMetadata();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  static TripTitleGenerator.title(for:momentNodes:locationHelper:)(v9, v10, v11);

  v12 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v12;
}

+ (id)titleTupleForDayHighlightGroupNode:(id)a3 locationHelper:(id)a4 error:(id *)a5
{
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  static TripTitleGenerator.titleTuple(highlightGroupNode:locationHelper:)(v7, v8);
  id v10 = v9;

  return v10;
}

- (PGTripTitleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TripTitleGenerator();
  return [(PGTripTitleGenerator *)&v3 init];
}

@end