@interface TVWidgetAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC17TVWidgetExtension22TVWidgetAsyncOperation)init;
- (void)start;
@end

@implementation TVWidgetAsyncOperation

- (_TtC17TVWidgetExtension22TVWidgetAsyncOperation)init
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation__logIdentifier);
  void *v2 = 0;
  v2[1] = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation_lock) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation__state) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVWidgetAsyncOperation();
  return [(TVWidgetAsyncOperation *)&v4 init];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  char v3 = sub_10001CB24();

  return v3 & 1;
}

- (BOOL)isFinished
{
  v2 = self;
  char v3 = sub_10001CC38();

  return v3 & 1;
}

- (void)start
{
  v2 = self;
  sub_10001CE00();
}

- (void).cxx_destruct
{
}

@end