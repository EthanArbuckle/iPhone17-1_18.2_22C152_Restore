@interface PNPetPromoterWrapper
+ (id)statusWithLibrary:(id)a3 delegate:(id)a4;
+ (unint64_t)minimumNumberOfFacesNeededForPromotion;
+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4;
- (PNPetPromoterWrapper)initWithLibrary:(id)a3 andDelegate:(id)a4;
- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3;
@end

@implementation PNPetPromoterWrapper

- (void).cxx_destruct
{
}

- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3
{
}

- (PNPetPromoterWrapper)initWithLibrary:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPetPromoterWrapper;
  v8 = [(PNPetPromoterWrapper *)&v12 init];
  if (v8)
  {
    v9 = [[PNPetPromoter alloc] initWithPhotoLibrary:v6 andDelegate:v7];
    petPromoter = v8->_petPromoter;
    v8->_petPromoter = v9;
  }
  return v8;
}

+ (unint64_t)minimumNumberOfFacesNeededForPromotion
{
  return +[PNPetPromoter kPNPetPromoterVerifiedPetMinimumNumberOfFaces];
}

+ (id)statusWithLibrary:(id)a3 delegate:(id)a4
{
  return +[PNPetPromoter statusWithPhotoLibrary:a3 delegate:a4];
}

+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4
{
}

@end