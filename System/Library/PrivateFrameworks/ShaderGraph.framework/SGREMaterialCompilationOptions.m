@interface SGREMaterialCompilationOptions
- (CGColorSpace)workingColorSpace;
- (SGREMaterialCompilationOptions)init;
- (SGREMaterialCompilationOptions)initWithWorkingColorSpace:(CGColorSpace *)a3;
@end

@implementation SGREMaterialCompilationOptions

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace));
}

- (SGREMaterialCompilationOptions)initWithWorkingColorSpace:(CGColorSpace *)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_enableFailedCompileMaterial) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace) = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return [(SGREMaterialCompilationOptions *)&v8 init];
}

- (SGREMaterialCompilationOptions)init
{
  result = (SGREMaterialCompilationOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end