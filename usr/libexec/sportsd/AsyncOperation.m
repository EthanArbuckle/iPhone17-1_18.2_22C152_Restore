@interface AsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC7sportsd14AsyncOperation)init;
- (void)start;
@end

@implementation AsyncOperation

- (_TtC7sportsd14AsyncOperation)init
{
  return (_TtC7sportsd14AsyncOperation *)sub_10006BC90();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  char v3 = sub_10006BD64();

  return v3 & 1;
}

- (BOOL)isFinished
{
  v2 = self;
  char v3 = sub_10006BE04();

  return v3 & 1;
}

- (void)start
{
  v2 = self;
  sub_10006BF18();
}

@end