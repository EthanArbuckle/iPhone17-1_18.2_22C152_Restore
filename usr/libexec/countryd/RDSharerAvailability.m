@interface RDSharerAvailability
+ (BOOL)hasLocalStatusKit;
- (_TtC8countryd20RDSharerAvailability)init;
@end

@implementation RDSharerAvailability

+ (BOOL)hasLocalStatusKit
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v2 = &type metadata accessor for LSKLocalStatusClient == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    sub_10000F510();
    sub_10000A970(0, &qword_100019190);
    v6 = (void *)sub_10000F530();
    sub_10000F420();
  }
  if (&metaclass for LSKLocalStatusClient) {
    BOOL v7 = &nominal type descriptor for LSKLocalStatusClient == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7
      && &type metadata for LSKLocalStatusClient != 0
      && &type metadata accessor for LSKLocalStatusClient != 0
      && &class metadata base offset for LSKLocalStatusClient != 0;
}

- (_TtC8countryd20RDSharerAvailability)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return [(RDSharerAvailability *)&v3 init];
}

@end