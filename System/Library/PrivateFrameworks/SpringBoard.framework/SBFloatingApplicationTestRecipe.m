@interface SBFloatingApplicationTestRecipe
- (SBFloatingApplicationTestRecipe)init;
- (id)title;
- (void)_perform;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBFloatingApplicationTestRecipe

- (SBFloatingApplicationTestRecipe)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingApplicationTestRecipe;
  result = [(SBFloatingApplicationTestRecipe *)&v3 init];
  if (result)
  {
    result->_mode = 0;
    result->_addSide = 0;
  }
  return result;
}

- (id)title
{
  return @"Floating Application";
}

- (void)handleVolumeIncrease
{
  [(SBFloatingApplicationTestRecipe *)self _perform];
  unint64_t v3 = self->_mode + 1;
  self->_mode = v3;
  if (v3 >= 0xB)
  {
    self->_mode = 0;
    self->_addSide ^= 1u;
  }
}

- (void)handleVolumeDecrease
{
  self->_mode = 0;
  self->_addSide = 0;
  [(SBFloatingApplicationTestRecipe *)self _perform];
}

- (void)_perform
{
  uint64_t v3 = __43__SBFloatingApplicationTestRecipe__perform__block_invoke((uint64_t)self, @"com.apple.mobilecal");
  v4 = (void *)v3;
  if (self->_addSide) {
    __43__SBFloatingApplicationTestRecipe__perform__block_invoke(v3, @"com.apple.Music");
  }
  else {
  v5 = +[SBWorkspaceEntity entity];
  }
  v6 = __43__SBFloatingApplicationTestRecipe__perform__block_invoke((uint64_t)v5, @"com.apple.mobiletimer");
  v7 = +[SBWorkspace mainWorkspace];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SBFloatingApplicationTestRecipe__perform__block_invoke_2;
  v11[3] = &unk_1E6AFB070;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  [v7 requestTransitionWithOptions:0 builder:v11 validator:&__block_literal_global_9_1];
}

SBDeviceApplicationSceneEntity *__43__SBFloatingApplicationTestRecipe__perform__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [SBDeviceApplicationSceneEntity alloc];
  v4 = +[SBApplicationController sharedInstance];
  v5 = [v4 applicationWithBundleIdentifier:v2];

  v6 = [(SBDeviceApplicationSceneEntity *)v3 initWithApplicationForMainDisplay:v5];
  return v6;
}

void __43__SBFloatingApplicationTestRecipe__perform__block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBFloatingApplicationTestRecipe__perform__block_invoke_3;
  v5[3] = &unk_1E6AFB048;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [a2 modifyApplicationContext:v5];
}

void __43__SBFloatingApplicationTestRecipe__perform__block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  switch(*(void *)(a1[4] + 8))
  {
    case 0:
    case 2:
    case 4:
      [v3 setEntity:a1[5] forLayoutRole:1];
      [v7 setEntity:a1[6] forLayoutRole:2];
      v4 = +[SBWorkspaceEntity entity];
      [v7 setEntity:v4 forLayoutRole:3];

      goto LABEL_8;
    case 1:
    case 6:
      [v3 setEntity:a1[5] forLayoutRole:1];
      [v7 setEntity:a1[6] forLayoutRole:2];
      [v7 setEntity:a1[7] forLayoutRole:3];
      v5 = v7;
      uint64_t v6 = 2;
      goto LABEL_7;
    case 3:
    case 7:
    case 9:
      [v3 setEntity:a1[5] forLayoutRole:1];
      [v7 setEntity:a1[6] forLayoutRole:2];
      [v7 setEntity:a1[7] forLayoutRole:3];
      v5 = v7;
      uint64_t v6 = 1;
      goto LABEL_7;
    case 5:
    case 8:
      [v3 setEntity:a1[5] forLayoutRole:1];
      [v7 setEntity:a1[6] forLayoutRole:2];
      [v7 setEntity:a1[7] forLayoutRole:3];
      v5 = v7;
      uint64_t v6 = 4;
      goto LABEL_7;
    case 0xALL:
      [v3 setEntity:a1[5] forLayoutRole:1];
      [v7 setEntity:a1[6] forLayoutRole:2];
      [v7 setEntity:a1[7] forLayoutRole:3];
      v5 = v7;
      uint64_t v6 = 3;
LABEL_7:
      [v5 setRequestedFloatingConfiguration:v6];
LABEL_8:
      id v3 = v7;
      break;
    default:
      break;
  }
}

uint64_t __43__SBFloatingApplicationTestRecipe__perform__block_invoke_4()
{
  return 1;
}

@end