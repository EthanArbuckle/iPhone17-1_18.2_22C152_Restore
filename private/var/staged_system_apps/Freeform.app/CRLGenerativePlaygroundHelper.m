@interface CRLGenerativePlaygroundHelper
+ (BOOL)iccHasGenerativePlaygroundInputSelection:(id)a3;
- (_TtC8Freeform29CRLGenerativePlaygroundHelper)init;
@end

@implementation CRLGenerativePlaygroundHelper

- (_TtC8Freeform29CRLGenerativePlaygroundHelper)init
{
  return (_TtC8Freeform29CRLGenerativePlaygroundHelper *)sub_100FB3304();
}

+ (BOOL)iccHasGenerativePlaygroundInputSelection:(id)a3
{
  id v3 = a3;
  sub_100FB8064(v3);
  char v5 = v4;

  return v5 & 1;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_delegate);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_gpDelegate);
}

@end