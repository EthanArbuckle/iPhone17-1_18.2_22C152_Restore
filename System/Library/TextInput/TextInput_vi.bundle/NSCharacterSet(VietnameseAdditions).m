@interface NSCharacterSet(VietnameseAdditions)
+ (id)TI_vietnameseBaseCharacterSet;
+ (id)TI_vietnameseTelexSpecialsCharacterSet;
+ (id)TI_vietnameseVIQRSpecialsCharacterSet;
+ (id)TI_vietnameseVNISpecialsCharacterSet;
@end

@implementation NSCharacterSet(VietnameseAdditions)

+ (id)TI_vietnameseBaseCharacterSet
{
  if (TI_vietnameseBaseCharacterSet___onceToken != -1) {
    dispatch_once(&TI_vietnameseBaseCharacterSet___onceToken, &__block_literal_global);
  }
  v0 = (void *)TI_vietnameseBaseCharacterSet___vietnameseBaseCharacterSet;
  return v0;
}

+ (id)TI_vietnameseTelexSpecialsCharacterSet
{
  if (TI_vietnameseTelexSpecialsCharacterSet___onceToken != -1) {
    dispatch_once(&TI_vietnameseTelexSpecialsCharacterSet___onceToken, &__block_literal_global_6);
  }
  v0 = (void *)TI_vietnameseTelexSpecialsCharacterSet___vietnameseTelexSpecialsCharacterSet;
  return v0;
}

+ (id)TI_vietnameseVIQRSpecialsCharacterSet
{
  if (TI_vietnameseVIQRSpecialsCharacterSet___onceToken != -1) {
    dispatch_once(&TI_vietnameseVIQRSpecialsCharacterSet___onceToken, &__block_literal_global_11);
  }
  v0 = (void *)TI_vietnameseVIQRSpecialsCharacterSet___vietnameseVIQRSpecialsCharacterSet;
  return v0;
}

+ (id)TI_vietnameseVNISpecialsCharacterSet
{
  if (TI_vietnameseVNISpecialsCharacterSet___onceToken != -1) {
    dispatch_once(&TI_vietnameseVNISpecialsCharacterSet___onceToken, &__block_literal_global_13);
  }
  v0 = (void *)TI_vietnameseVNISpecialsCharacterSet___vietnameseVNISpecialsCharacterSet;
  return v0;
}

@end