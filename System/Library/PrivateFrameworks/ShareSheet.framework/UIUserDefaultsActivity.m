@interface UIUserDefaultsActivity
@end

@implementation UIUserDefaultsActivity

void __41___UIUserDefaultsActivity__activityImage__block_invoke()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1E20];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v2 = [v1 traitCollection];
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E4FB1E20];
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v7 = [v0 traitCollectionWithTraitsFromCollections:v6];

  v8 = (void *)MEMORY[0x1E4FB1818];
  v9 = _ShareSheetBundle();
  v10 = [v8 imageNamed:@"UIActivityUserDefaults" inBundle:v9 compatibleWithTraitCollection:v7];
  uint64_t v11 = +[UIActivity _activityImageForActionRepresentationImage:v10];
  v12 = (void *)_activityImage___image;
  _activityImage___image = v11;
}

@end