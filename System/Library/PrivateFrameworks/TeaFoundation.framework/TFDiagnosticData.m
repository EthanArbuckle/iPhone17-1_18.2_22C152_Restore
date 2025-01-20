@interface TFDiagnosticData
- (TFDiagnosticData)init;
@end

@implementation TFDiagnosticData

- (TFDiagnosticData)init
{
}

- (void).cxx_destruct
{
  sub_191D76D1C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TFDiagnosticData_data), *(void *)&self->data[OBJC_IVAR___TFDiagnosticData_data]);

  swift_bridgeObjectRelease();
}

@end