@interface WFToolKitIndexingRequest
+ (BOOL)supportsSecureCoding;
- (NSString)debugDescription;
- (WFToolKitIndexingRequest)init;
- (WFToolKitIndexingRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToolKitIndexingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B3CB7C64(v4);
}

- (WFToolKitIndexingRequest)initWithCoder:(id)a3
{
  return (WFToolKitIndexingRequest *)ToolKitIndexingRequest.init(coder:)(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1B3CB81A0();

  v3 = (void *)sub_1B3D72378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (WFToolKitIndexingRequest)init
{
}

- (void).cxx_destruct
{
  sub_1B3D71EA8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_32();
  v2();
  sub_1B3D71E58();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_32();
  v3();
  swift_bridgeObjectRelease();
}

@end