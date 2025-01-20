@interface PXEditTipsHelper_Swift
+ (BOOL)isTipValid:(id)a3;
+ (NSString)cleanUpTipID;
+ (NSString)stylesSetupTipID;
+ (PXEditTipsHelper_Swift)shared;
+ (void)setTip:(id)a3 isPresentable:(BOOL)a4;
+ (void)setTipActionPerformed:(id)a3;
+ (void)setTipsPresentationDelegate:(id)a3;
- (PXEditTipsHelper_Swift)init;
@end

@implementation PXEditTipsHelper_Swift

+ (PXEditTipsHelper_Swift)shared
{
  if (qword_1E98A9320 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E98A9328;
  return (PXEditTipsHelper_Swift *)v2;
}

+ (NSString)stylesSetupTipID
{
}

+ (NSString)cleanUpTipID
{
}

+ (void)setTipsPresentationDelegate:(id)a3
{
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  v8 = sub_1A9F431FC();
  BOOL v9 = *v8 == v5 && v8[1] == v7;
  if (v9 || (sub_1AB23C5AC() & 1) != 0)
  {
    sub_1A9F43228(v4);
  }
  else
  {
    v10 = sub_1A9F43208();
    BOOL v11 = *v10 == v5 && v10[1] == v7;
    if (v11 || (sub_1AB23C5AC() & 1) != 0) {
      sub_1A9F43960(v4);
    }
  }
  swift_bridgeObjectRelease();
}

+ (void)setTipActionPerformed:(id)a3
{
  sub_1AB23A76C();
  _s12PhotosUICore16PXEditTipsHelperC21setTipActionPerformedyySSFZ_0();
  swift_bridgeObjectRelease();
}

+ (BOOL)isTipValid:(id)a3
{
  sub_1AB23A76C();
  char v3 = _s12PhotosUICore16PXEditTipsHelperC10isTipValidySbSSFZ_0();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (PXEditTipsHelper_Swift)init
{
  v2 = self;
  PXDisplayCollectionDetailedCountsMake(v2, v3);
  PXDisplayCollectionDetailedCountsMake(v4, v5);
  *((unsigned char *)&v2->super.super.isa + OBJC_IVAR___PXEditTipsHelper_Swift_hasStartedTips) = 0;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PXEditTipsHelper();
  return [(PXTipsHelper_Swift *)&v7 init];
}

@end