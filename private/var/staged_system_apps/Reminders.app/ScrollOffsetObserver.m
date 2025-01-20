@interface ScrollOffsetObserver
- (_TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver)init;
- (void)_observeScrollViewDidScroll:(id)a3;
@end

@implementation ScrollOffsetObserver

- (void)_observeScrollViewDidScroll:(id)a3
{
  v4 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver_scrollViewDidScroll);
  id v5 = a3;
  v6 = self;
  v4();
}

- (_TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver)init
{
  result = (_TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end