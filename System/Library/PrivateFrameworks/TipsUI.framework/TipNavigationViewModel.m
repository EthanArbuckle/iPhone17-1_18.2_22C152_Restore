@interface TipNavigationViewModel
- (BOOL)canGoBack;
- (BOOL)canGoNext;
- (NSArray)tips;
- (TPSTip)currentTip;
- (TipNavigationViewModel)init;
- (int64_t)currentTipIndex;
- (void)goBack;
- (void)goNext;
- (void)selectTipAtIndex:(int64_t)a3;
- (void)setCurrentTip:(id)a3;
- (void)setTips:(id)a3;
- (void)updateSelectedTip:(id)a3 forceUpdate:(BOOL)a4;
@end

@implementation TipNavigationViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TipNavigationViewModel__currentTip;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7530);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___TipNavigationViewModel__tips;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (TipNavigationViewModel)init
{
  return (TipNavigationViewModel *)TipNavigationViewModel.init()();
}

- (TPSTip)currentTip
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_2179E1AE0();
  swift_release();
  swift_release();

  return (TPSTip *)v5;
}

- (void)setCurrentTip:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  uint64_t v6 = self;
  sub_2179E1AF0();
}

- (NSArray)tips
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_2179E1AE0();
  swift_release();
  swift_release();

  sub_2179CBC9C();
  uint64_t v4 = (void *)sub_2179E29C0();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (void)setTips:(id)a3
{
  sub_2179CBC9C();
  sub_2179E29D0();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v4 = self;
  sub_2179E1AF0();
}

- (int64_t)currentTipIndex
{
  v2 = self;
  int64_t v3 = sub_2179E034C();

  return v3;
}

- (BOOL)canGoBack
{
  v2 = self;
  BOOL v3 = sub_2179E05FC();

  return v3;
}

- (BOOL)canGoNext
{
  v2 = self;
  uint64_t v3 = sub_2179E034C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  BOOL result = swift_bridgeObjectRelease();
  if (!__OFSUB__(v4, 1)) {
    return v3 < v4 - 1;
  }
  __break(1u);
  return result;
}

- (void)goBack
{
  id v5 = self;
  uint64_t v2 = sub_2179E034C();
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    sub_2179E09C4(v4);
  }
}

- (void)goNext
{
  id v5 = self;
  uint64_t v2 = sub_2179E034C();
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    sub_2179E09C4(v4);
  }
}

- (void)selectTipAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_2179E09C4(a3);
}

- (void)updateSelectedTip:(id)a3 forceUpdate:(BOOL)a4
{
  id v8 = a3;
  v7 = self;
  sub_2179E0C3C(a3, a4);
}

@end