@interface PageControlView.Coordinator
- (_TtCV10FitnessApp15PageControlView11Coordinator)init;
- (void)updateCurrentPageWithSender:(id)a3;
@end

@implementation PageControlView.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  swift_retain();
  swift_retain();
  id v5 = a3;
  v6 = self;
  [v5 currentPage];
  sub_1000AFA94(&qword_1009510D8);
  Binding.wrappedValue.setter();

  swift_release();
  swift_release();
}

- (_TtCV10FitnessApp15PageControlView11Coordinator)init
{
  result = (_TtCV10FitnessApp15PageControlView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end