@interface UITraitCollection(PBFDisplayContextAdditions)
+ (id)pbf_traitCollectionCompatibleWithContext:()PBFDisplayContextAdditions;
@end

@implementation UITraitCollection(PBFDisplayContextAdditions)

+ (id)pbf_traitCollectionCompatibleWithContext:()PBFDisplayContextAdditions
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB1E20];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__UITraitCollection_PBFDisplayContextAdditions__pbf_traitCollectionCompatibleWithContext___block_invoke;
  v8[3] = &unk_1E6983ED0;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 traitCollectionWithTraits:v8];

  return v6;
}

@end