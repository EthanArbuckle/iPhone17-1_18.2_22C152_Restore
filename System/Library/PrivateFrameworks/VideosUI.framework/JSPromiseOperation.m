@interface JSPromiseOperation
- (_TtC8VideosUI18JSPromiseOperation)init;
- (_TtC8VideosUI18JSPromiseOperation)initWithAppContext:(id)a3;
- (_TtC8VideosUI18JSPromiseOperation)initWithPromiseFunction:(id)a3 cancelFunction:(id)a4;
- (void)dealloc;
@end

@implementation JSPromiseOperation

- (_TtC8VideosUI18JSPromiseOperation)initWithPromiseFunction:(id)a3 cancelFunction:(id)a4
{
  return (_TtC8VideosUI18JSPromiseOperation *)sub_1E2C504F0(a3, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_1E344060C();
}

- (_TtC8VideosUI18JSPromiseOperation)initWithAppContext:(id)a3
{
  id v3 = a3;
  sub_1E34407AC();
}

- (_TtC8VideosUI18JSPromiseOperation)init
{
}

@end