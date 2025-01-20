@interface WFPopoverModel
- (WFPopoverModel)init;
- (void)displayFileActivityWith:(id)a3;
@end

@implementation WFPopoverModel

- (void)displayFileActivityWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DA198D8();
}

- (WFPopoverModel)init
{
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF97C0);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10();
  v3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF97B0);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10();
  v4();
  v5 = (char *)self + OBJC_IVAR___WFPopoverModel__fileActivityModel;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9790);
  OUTLINED_FUNCTION_14_0();
  v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
}

@end