@interface PNPetPromoter
+ (id)statusWithPhotoLibrary:(id)a3 delegate:(id)a4;
+ (int64_t)kPNPetPromoterMaximumNumberOfPetsInPeopleHome;
+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfAssetsAlone;
+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfFaces;
+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfMoments;
+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4;
- (NSDictionary)metrics;
- (PHPhotoLibrary)photoLibrary;
- (PNPersonPromoterDelegate)delegate;
- (PNPetPromoter)init;
- (PNPetPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4;
- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4;
- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation PNPetPromoter

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfFaces
{
  return 25;
}

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfMoments
{
  return 3;
}

+ (int64_t)kPNPetPromoterVerifiedPetMinimumNumberOfAssetsAlone
{
  return 3;
}

+ (int64_t)kPNPetPromoterMaximumNumberOfPetsInPeopleHome
{
  return 10;
}

- (PHPhotoLibrary)photoLibrary
{
  id v2 = sub_25959349C();
  return (PHPhotoLibrary *)v2;
}

- (PNPersonPromoterDelegate)delegate
{
  id v2 = (void *)sub_2595934E0();
  return (PNPersonPromoterDelegate *)v2;
}

- (NSDictionary)metrics
{
  sub_25959356C();
  sub_25935633C(0, (unint64_t *)&qword_26B2FFA10);
  id v2 = (void *)sub_259843E90();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setMetrics:(id)a3
{
  sub_25935633C(0, (unint64_t *)&qword_26B2FFA10);
  uint64_t v4 = sub_259843EB0();
  v5 = self;
  sub_259593640(v4);
}

- (PNPetPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (PNPetPromoter *)PetPromoter.init(with:delegate:)((uint64_t)v5, (uint64_t)a4);
}

- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = self;
  sub_2595937A4();

  swift_release();
}

- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4
{
  uint64_t v6 = sub_2598440A0();
  uint64_t v8 = v7;
  v9 = self;
  sub_25959D120(v6, v8, a4);

  swift_bridgeObjectRelease();
}

+ (id)statusWithPhotoLibrary:(id)a3 delegate:(id)a4
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  swift_unknownObjectRetain();
  static PetPromoter.status(with:delegate:)();

  swift_unknownObjectRelease();
  uint64_t v6 = (void *)sub_259844070();
  swift_bridgeObjectRelease();
  return v6;
}

+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v5);
  id v7 = a3;
  sub_25959FD64(v7, ObjCClassMetadata, (uint64_t)v5);
  _Block_release(v5);
}

- (PNPetPromoter)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end