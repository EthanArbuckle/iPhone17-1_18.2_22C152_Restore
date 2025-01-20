@interface PBSlideObjAndMasterPair
+ (id)createPair:(id)a3 masterId:(int)a4;
- (id)slide;
- (int)masterId;
- (void)setSlide:(id)a3 masterId:(int)a4;
@end

@implementation PBSlideObjAndMasterPair

+ (id)createPair:(id)a3 masterId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = objc_alloc_init(PBSlideObjAndMasterPair);
  [(PBSlideObjAndMasterPair *)v6 setSlide:v5 masterId:v4];

  return v6;
}

- (void)setSlide:(id)a3 masterId:(int)a4
{
  self->mMasterId = a4;
}

- (id)slide
{
  return self->mSlide;
}

- (int)masterId
{
  return self->mMasterId;
}

- (void).cxx_destruct
{
}

@end