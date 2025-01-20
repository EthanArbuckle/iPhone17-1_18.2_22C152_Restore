@interface NSUserDefaults
- (BOOL)BEDocumentExternalLoadApprovalCacheDidReset;
- (BOOL)BKLeftTapTurnToNext;
- (NSDate)BKPageTurnStyleReduceMotionEnabledTimestamp;
- (NSDate)BKPageTurnStyleUserSelectionTimestamp;
- (NSString)BKContentSizeCategoryManagerOverrideKey;
- (NSString)BKPageTurnStyle;
- (NSString)BookEPUB_CurrentThemePersistence_themeIdentifier;
- (void)setBKContentSizeCategoryManagerOverrideKey:(id)a3;
- (void)setBKLeftTapTurnToNext:(BOOL)a3;
- (void)setBKPageTurnStyle:(id)a3;
- (void)setBKPageTurnStyleReduceMotionEnabledTimestamp:(id)a3;
- (void)setBKPageTurnStyleUserSelectionTimestamp:(id)a3;
- (void)setBookEPUB_CurrentThemePersistence_themeIdentifier:(id)a3;
@end

@implementation NSUserDefaults

- (BOOL)BEDocumentExternalLoadApprovalCacheDidReset
{
  uint64_t v2 = qword_3FD758;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  NSString v4 = sub_2FC140();
  unsigned __int8 v5 = [(NSUserDefaults *)v3 BOOLForKey:v4];

  return v5;
}

- (NSString)BKContentSizeCategoryManagerOverrideKey
{
  uint64_t v2 = self;
  NSString v3 = sub_2FC140();
  NSString v4 = [(NSUserDefaults *)v2 stringForKey:v3];

  if (v4)
  {
    sub_2FC180();

    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setBKContentSizeCategoryManagerOverrideKey:(id)a3
{
  if (a3)
  {
    sub_2FC180();
    NSString v4 = self;
    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    NSString v5 = 0;
  }
  id v7 = sub_2FC140();
  [(NSUserDefaults *)self setObject:v5 forKey:v7];

  swift_unknownObjectRelease();
}

- (NSString)BookEPUB_CurrentThemePersistence_themeIdentifier
{
  uint64_t v2 = self;
  NSString v3 = sub_2FC140();
  NSString v4 = [(NSUserDefaults *)v2 stringForKey:v3];

  if (v4)
  {
    sub_2FC180();

    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setBookEPUB_CurrentThemePersistence_themeIdentifier:(id)a3
{
  if (a3)
  {
    sub_2FC180();
    NSString v4 = self;
    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    NSString v5 = 0;
  }
  id v7 = sub_2FC140();
  [(NSUserDefaults *)self setValue:v5 forKey:v7];

  swift_unknownObjectRelease();
}

- (BOOL)BKLeftTapTurnToNext
{
  uint64_t v2 = self;
  NSString v3 = sub_2FC140();
  unsigned __int8 v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  return v4;
}

- (void)setBKLeftTapTurnToNext:(BOOL)a3
{
  NSString v3 = self;
  Class isa = sub_2FC4C0().super.super.isa;
  id v5 = sub_2FC140();
  [(NSUserDefaults *)v3 setValue:isa forKey:v5];
}

- (NSString)BKPageTurnStyle
{
  uint64_t v2 = self;
  NSString v3 = sub_2FC140();
  unsigned __int8 v4 = [(NSUserDefaults *)v2 stringForKey:v3];

  if (v4)
  {
    sub_2FC180();

    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setBKPageTurnStyle:(id)a3
{
  if (a3)
  {
    sub_2FC180();
    unsigned __int8 v4 = self;
    NSString v5 = sub_2FC140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    NSString v5 = 0;
  }
  id v7 = sub_2FC140();
  [(NSUserDefaults *)self setObject:v5 forKey:v7];

  swift_unknownObjectRelease();
}

- (NSDate)BKPageTurnStyleUserSelectionTimestamp
{
  return (NSDate *)sub_1D6FE8(self);
}

- (void)setBKPageTurnStyleUserSelectionTimestamp:(id)a3
{
}

- (NSDate)BKPageTurnStyleReduceMotionEnabledTimestamp
{
  return (NSDate *)sub_1D6FE8(self);
}

- (void)setBKPageTurnStyleReduceMotionEnabledTimestamp:(id)a3
{
}

@end