@interface PXObservableObservation
- (_TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation)init;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXObservableObservation

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v7 = a3;
  v8 = self;
  sub_259CE64AC((uint64_t)v7, a4);
}

- (_TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);

  sub_259CE6788(v3);
}

@end