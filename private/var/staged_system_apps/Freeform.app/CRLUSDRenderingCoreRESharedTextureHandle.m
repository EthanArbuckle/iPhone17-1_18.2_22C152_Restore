@interface CRLUSDRenderingCoreRESharedTextureHandle
+ (BOOL)supportsSecureCoding;
- (CRLUSDRenderingCoreRESharedTextureHandle)init;
- (CRLUSDRenderingCoreRESharedTextureHandle)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRLUSDRenderingCoreRESharedTextureHandle

- (CRLUSDRenderingCoreRESharedTextureHandle)initWithCoder:(id)a3
{
  return (CRLUSDRenderingCoreRESharedTextureHandle *)sub_100844984(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CRLUSDRenderingCoreRESharedTextureHandle_handle);
  id v5 = a3;
  v6 = self;
  id v7 = String._bridgeToObjectiveC()();
  [v5 encodeObject:v4 forKey:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRLUSDRenderingCoreRESharedTextureHandle)init
{
  result = (CRLUSDRenderingCoreRESharedTextureHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end