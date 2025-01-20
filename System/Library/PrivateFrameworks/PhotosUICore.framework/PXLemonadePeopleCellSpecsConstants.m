@interface PXLemonadePeopleCellSpecsConstants
+ (double)cornerRadius;
+ (double)smallCornerRadius;
- (PXLemonadePeopleCellSpecsConstants)init;
@end

@implementation PXLemonadePeopleCellSpecsConstants

+ (double)cornerRadius
{
  return sub_1A9EFCA44((uint64_t)a1, (uint64_t)a2, qword_1E98548A0, (uint64_t)&qword_1E98CE690);
}

+ (double)smallCornerRadius
{
  return sub_1A9EFCA44((uint64_t)a1, (uint64_t)a2, qword_1E9851030, (uint64_t)&qword_1E98CE698);
}

- (PXLemonadePeopleCellSpecsConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PXLemonadePeopleCellSpecsConstants *)&v3 init];
}

@end