@interface _UISceneHostingTraitCollectionPropagationHostComponent
- (void)setTraitCollection:(id)a3;
@end

@implementation _UISceneHostingTraitCollectionPropagationHostComponent

- (void)setTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77___UISceneHostingTraitCollectionPropagationHostComponent_setTraitCollection___block_invoke;
  v7[3] = &unk_1E530CC30;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettingsWithBlock:v7];
}

@end