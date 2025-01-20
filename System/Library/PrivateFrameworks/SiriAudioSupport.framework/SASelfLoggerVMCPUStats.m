@interface SASelfLoggerVMCPUStats
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SASelfLoggerVMCPUStats)init;
- (SASelfLoggerVMCPUStats)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SASelfLoggerVMCPUStats

+ (BOOL)supportsSecureCoding
{
  return byte_26894D0C0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26894D0C0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_238091CE4(v4);
}

- (SASelfLoggerVMCPUStats)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (SASelfLoggerVMCPUStats *)sub_2380992A8();

  return v4;
}

- (SASelfLoggerVMCPUStats)init
{
  result = (SASelfLoggerVMCPUStats *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SASelfLoggerVMCPUStats_mwtId;
  uint64_t v3 = sub_2380E2E98();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end