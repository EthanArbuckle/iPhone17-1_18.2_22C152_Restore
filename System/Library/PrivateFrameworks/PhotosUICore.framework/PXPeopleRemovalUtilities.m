@interface PXPeopleRemovalUtilities
+ (void)presentAlertFor:(id)a3 totalNumberOfPeople:(int64_t)a4 presentationEnvironment:(id)a5 undoManager:(id)a6 sourceItem:(id)a7 completion:(id)a8;
@end

@implementation PXPeopleRemovalUtilities

+ (void)presentAlertFor:(id)a3 totalNumberOfPeople:(int64_t)a4 presentationEnvironment:(id)a5 undoManager:(id)a6 sourceItem:(id)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  _Block_copy(v13);
  id v14 = a3;
  swift_unknownObjectRetain();
  id v15 = a6;
  swift_unknownObjectRetain();
  sub_1A9D5CA5C(v14, (id)a4, a5, a6, (uint64_t)a7, (void (**)(void, void, void))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end