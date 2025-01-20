@interface TUINetworkObserver
- (_TtC11TextInputUI18TUINetworkObserver)init;
- (_TtP11TextInputUI26TUINetworkObserverDelegate_)delegate;
- (void)isNetworkAvailableWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TUINetworkObserver

- (_TtP11TextInputUI26TUINetworkObserverDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP11TextInputUI26TUINetworkObserverDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC11TextInputUI18TUINetworkObserver)init
{
  return (_TtC11TextInputUI18TUINetworkObserver *)sub_18D4817E0();
}

- (void)isNetworkAvailableWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_18D481E70((void (*)(void))sub_18D4842C4, v5);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();

  sub_18D483D48((uint64_t)self + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus, &qword_1E91B6568);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end