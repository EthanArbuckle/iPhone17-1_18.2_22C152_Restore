@interface TypistMathSupport
- (TypistMathSupport)init;
- (id)getBoundingBoxWithLatex:(id)a3 error:(id *)a4;
@end

@implementation TypistMathSupport

- (id)getBoundingBoxWithLatex:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_260416910();
  v7 = v6;
  v8 = self;
  sub_260415D48(v5, v7);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A86DCF0);
  v9 = (void *)sub_260416960();
  swift_bridgeObjectRelease();
  return v9;
}

- (TypistMathSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)TypistMathSupport;
  return [(TypistMathSupport *)&v3 init];
}

@end