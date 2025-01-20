@interface WFAppEntityContextualAction
+ (id)spotlightDomainIdentifierForEntityType:(int64_t)a3;
- (CSSearchableItem)spotlightItem;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithCoder:(id)a3;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 displayTitle:(id)a4 entityType:(int64_t)a5;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15;
- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18;
@end

@implementation WFAppEntityContextualAction

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 displayTitle:(id)a4 entityType:(int64_t)a5
{
  uint64_t v6 = sub_1C7E992D0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1C7E992D0();
  return (_TtC14VoiceShortcuts27WFAppEntityContextualAction *)sub_1C7DF15A0(v6, v8, v9, v10, a5);
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithCoder:(id)a3
{
}

- (CSSearchableItem)spotlightItem
{
  v2 = self;
  id v3 = sub_1C7DF1808();

  return (CSSearchableItem *)v3;
}

+ (id)spotlightDomainIdentifierForEntityType:(int64_t)a3
{
  sub_1C7DF1A58(a3);
  id v3 = (void *)sub_1C7E992A0();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10
{
  sub_1C7E992D0();
  if (a4) {
    sub_1C7E992D0();
  }
  if (a5) {
    sub_1C7E992D0();
  }
  sub_1C7DF1ED8();
  sub_1C7E993C0();
  sub_1C7E992D0();
  sub_1C7E992D0();
  if (a9) {
    sub_1C7E992D0();
  }
  id v12 = a10;
  sub_1C7DF1B00();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14
{
  sub_1C7E992D0();
  if (a4) {
    sub_1C7E992D0();
  }
  if (a5) {
    sub_1C7E992D0();
  }
  sub_1C7DF1ED8();
  sub_1C7E993C0();
  sub_1C7E992D0();
  sub_1C7E992D0();
  if (a9) {
    sub_1C7E992D0();
  }
  id v16 = a10;
  id v17 = a11;
  sub_1C7DF1BBC();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15
{
  sub_1C7E992D0();
  if (a4) {
    sub_1C7E992D0();
  }
  if (a7) {
    sub_1C7E992D0();
  }
  if (a11)
  {
    sub_1C7DF1ED8();
    sub_1C7E993C0();
  }
  sub_1C7E992D0();
  sub_1C7E992D0();
  if (a14) {
    sub_1C7E992D0();
  }
  id v17 = a10;
  id v18 = a15;
  sub_1C7DF1C8C();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18
{
  sub_1C7E992D0();
  if (a4) {
    sub_1C7E992D0();
  }
  if (a7) {
    sub_1C7E992D0();
  }
  if (a11)
  {
    sub_1C7DF1ED8();
    sub_1C7E993C0();
  }
  sub_1C7E992D0();
  sub_1C7E992D0();
  if (a14) {
    sub_1C7E992D0();
  }
  id v20 = a10;
  id v21 = a15;
  id v22 = a16;
  sub_1C7DF1D54();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end