@interface PBUIWallpaperStyleInfo
- ($1D129F7B4C980C50E70029647222EF17)styleTransitionState;
- ($B02D014F61B172915FAB8AA02880CAEC)priorityInfoForPriority:(SEL)a3;
- (NSString)description;
- (PBUIWallpaperEffectViewBase)wallpaperEffectView;
- (PBUIWallpaperStyleInfo)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)highestValidPriority;
- (void)enumerateValidPrioritiesUsingBlock:(id)a3;
- (void)removePriorityInfoForPriority:(int64_t)a3;
- (void)setPriorityInfo:(id *)a3 forPriority:(int64_t)a4;
- (void)setStyleTransitionState:(id *)a3;
- (void)setWallpaperEffectView:(id)a3;
@end

@implementation PBUIWallpaperStyleInfo

- (PBUIWallpaperStyleInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperStyleInfo;
  result = [(PBUIWallpaperStyleInfo *)&v3 init];
  if (result)
  {
    result->_styleTransitionState.startStyle = 0;
    result->_styleTransitionState.endStyle = 0;
    result->_styleTransitionState.transitionFraction = 0.0;
  }
  return result;
}

- ($B02D014F61B172915FAB8AA02880CAEC)priorityInfoForPriority:(SEL)a3
{
  if (a4 >= 5)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Bad index to priorityInfoAtIndex:" userInfo:0];
    objc_exception_throw(v6);
  }
  v4 = &self[a4];
  long long v5 = *(_OWORD *)&v4->var1.var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v4->var1.var0;
  *(_OWORD *)&retstr->var1.var1 = v5;
  return self;
}

- (void)setPriorityInfo:(id *)a3 forPriority:(int64_t)a4
{
  if (a4 >= 5)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Bad index to setPriorityInfo:atIndex:" userInfo:0];
    objc_exception_throw(v6);
  }
  long long v4 = *(_OWORD *)&a3->var0;
  long long v5 = (char *)self + 32 * a4;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v5 + 8) = v4;
}

- (void)removePriorityInfoForPriority:(int64_t)a3
{
  if (a3 >= 5)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Bad index to removePriorityInfoForPriority:" userInfo:0];
    objc_exception_throw(v3);
  }
  self->_priorityInfo[a3].valid = 0;
}

- (void)enumerateValidPrioritiesUsingBlock:(id)a3
{
  long long v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  long long v5 = &self->_priorityInfo[4];
  for (uint64_t i = 4; ; --i)
  {
    BOOL valid = v5->valid;
    --v5;
    if (valid) {
      break;
    }
    if (i < 1) {
      goto LABEL_11;
    }
LABEL_10:
    ;
  }
  char v9 = 0;
  v4[2](v4, i, &v9);
  if (v9) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = i <= 0;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_11:
}

- (int64_t)highestValidPriority
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PBUIWallpaperStyleInfo_highestValidPriority__block_invoke;
  v4[3] = &unk_1E62B2C60;
  v4[4] = &v5;
  [(PBUIWallpaperStyleInfo *)self enumerateValidPrioritiesUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__PBUIWallpaperStyleInfo_highestValidPriority__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperStyleInfo *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PBUIWallpaperStyleInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  long long v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  long long v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  $908C602B16FFD440FE7BF19AD013F0CC styleTransitionState = self->_styleTransitionState;
  uint64_t v7 = PBUIStringForStyleTransitionState((unint64_t *)&styleTransitionState);
  id v8 = (id)[v6 appendObject:v7 withName:@"styleTransitionState"];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E62B2C38;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  [v9 appendBodySectionWithName:@"priorityInfo" multilinePrefix:v5 block:v13];

  v10 = v14;
  id v11 = v9;

  return v11;
}

void __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_1E62B2C88;
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateValidPrioritiesUsingBlock:v5];
}

void __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, unint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40) + 32 * a2;
  long long v5 = *(_OWORD *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 32);
  long long v9 = v5;
  id v6 = PBUIStringForStyleTransitionState((unint64_t *)&v9);
  uint64_t v7 = PBUIStringForWallpaperStylePriority(a2);
  id v8 = (id)[v3 appendObject:v6 withName:v7];
}

- (id)succinctDescription
{
  int64_t v2 = [(PBUIWallpaperStyleInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (PBUIWallpaperEffectViewBase)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
}

- ($1D129F7B4C980C50E70029647222EF17)styleTransitionState
{
  *($908C602B16FFD440FE7BF19AD013F0CC *)retstr = *($908C602B16FFD440FE7BF19AD013F0CC *)((char *)self + 176);
  return self;
}

- (void)setStyleTransitionState:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_styleTransitionState.transitionFraction = a3->var2;
  *(_OWORD *)&self->_styleTransitionState.startStyle = v3;
}

- (void).cxx_destruct
{
}

@end