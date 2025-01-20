@interface SFAnimationSettings
+ (SFAnimationSettings)quickTabSwitcherPan;
+ (SFAnimationSettings)quickTabSwitcherUpdate;
+ (SFAnimationSettings)tabOverviewScroll;
+ (SFAnimationSettings)tabOverviewSwitcherScroll;
+ (SFAnimationSettings)tabOverviewUpdate;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (SFAnimationSettings)init;
- (void)performInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
@end

@implementation SFAnimationSettings

+ (SFAnimationSettings)quickTabSwitcherPan
{
  return (SFAnimationSettings *)sub_18C5D23F0((uint64_t)a1, (uint64_t)a2, &qword_1E91759E0, &qword_1E9190450);
}

+ (SFAnimationSettings)quickTabSwitcherUpdate
{
  return (SFAnimationSettings *)sub_18C5D23F0((uint64_t)a1, (uint64_t)a2, &qword_1E91759F0, &qword_1E9190460);
}

+ (SFAnimationSettings)tabOverviewScroll
{
  return (SFAnimationSettings *)sub_18C5D23F0((uint64_t)a1, (uint64_t)a2, &qword_1E9175A90, &qword_1E9190500);
}

+ (SFAnimationSettings)tabOverviewSwitcherScroll
{
  return (SFAnimationSettings *)sub_18C5D23F0((uint64_t)a1, (uint64_t)a2, &qword_1E9175A78, &qword_1E91904E8);
}

+ (SFAnimationSettings)tabOverviewUpdate
{
  return (SFAnimationSettings *)sub_18C5D23F0((uint64_t)a1, (uint64_t)a2, &qword_1E9175AA0, &qword_1E9190510);
}

- (void)performInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_18C5DEC8C;
  }
  else
  {
    uint64_t v10 = 0;
  }
  _Block_copy(v8);
  v11 = self;
  sub_18C5DDE28(a3, (uint64_t)v9, v10, (uint64_t)v11, v8);
  sub_18C3F33C8((uint64_t)v9);
  _Block_release(v8);
  _Block_release(v8);
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  uint64_t v5 = *(void *)((char *)&self->var0 + OBJC_IVAR___SFAnimationSettings_wrapped);
  if (a5 == 1 && (*(unsigned char *)(v5 + 88) & 1) == 0)
  {
    v6 = (double *)(v5 + 64);
    v8 = (double *)(v5 + 80);
    v7 = (double *)(v5 + 72);
  }
  else
  {
    v6 = (double *)(v5 + 40);
    v7 = (double *)(v5 + 48);
    v8 = (double *)(v5 + 56);
  }
  double v9 = *v7;
  double v10 = *v8;
  retstr->var0 = *v6;
  retstr->var1 = v9;
  *(_WORD *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var10 = v10;
  return self;
}

- (SFAnimationSettings)init
{
  result = (SFAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end