@interface ICPaperCommonUtilities
+ (BOOL)shouldResumeLastQuickNote;
+ (BOOL)shouldShowLinksWhenComposingQuickNote;
+ (id)activitiesToExcludeForNote:(id)a3 currentUserActivity:(id)a4;
- (ICPaperCommonUtilities)init;
@end

@implementation ICPaperCommonUtilities

+ (BOOL)shouldShowLinksWhenComposingQuickNote
{
  return sub_20C126440() & 1;
}

+ (BOOL)shouldResumeLastQuickNote
{
  return sub_20C126440() & 1;
}

+ (id)activitiesToExcludeForNote:(id)a3 currentUserActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _s11NotesEditor20PaperCommonUtilitiesC19activitiesToExclude7forNote19currentUserActivitySaySo06NSUserM0CGSo6ICNoteC_AHSgtFZ_0((int64_t)v5, (int64_t)a4);

  sub_20BFCEE58(0, &qword_2676BC640);
  v7 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v7;
}

- (ICPaperCommonUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICPaperCommonUtilities *)&v3 init];
}

@end