@interface WOEffortUIController
+ (id)makeHostingControllerWithShouldEmbedInNavStack:(BOOL)a3 startingEffort:(id)a4 workoutActivityType:(id)a5 shouldShowWorkoutGlyph:(BOOL)a6 showCurrentWorkloadButton:(BOOL)a7 cancel:(id)a8 completion:(id)a9;
- (WOEffortUIController)init;
@end

@implementation WOEffortUIController

+ (id)makeHostingControllerWithShouldEmbedInNavStack:(BOOL)a3 startingEffort:(id)a4 workoutActivityType:(id)a5 shouldShowWorkoutGlyph:(BOOL)a6 showCurrentWorkloadButton:(BOOL)a7 cancel:(id)a8 completion:(id)a9
{
  BOOL v9 = a7;
  v13 = _Block_copy(a8);
  v14 = _Block_copy(a9);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  id v17 = a4;
  id v18 = a5;
  v19 = (void *)sub_261B4D98C(a3, a4, v9, (uint64_t)sub_261B4DCF0, v15, (uint64_t)sub_261AD588C, v16);

  swift_release();
  swift_release();
  return v19;
}

- (WOEffortUIController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortUIController();
  return [(WOEffortUIController *)&v3 init];
}

@end