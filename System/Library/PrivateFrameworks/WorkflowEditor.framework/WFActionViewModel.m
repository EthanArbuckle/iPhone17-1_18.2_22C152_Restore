@interface WFActionViewModel
- (WFActionViewModel)init;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)actionIconDidChange:(id)a3;
- (void)actionNameDidChange:(id)a3;
- (void)actionOutputDetailsDidChange:(id)a3;
- (void)actionReloadAuxiliaryButton:(id)a3;
- (void)actionVisibleParametersDidChange:(id)a3;
- (void)favoritesDidChange:(id)a3;
- (void)parameterAttributesDidChange:(id)a3;
- (void)pasteboardDidChange;
- (void)resourcesDidChange:(id)a3;
@end

@implementation WFActionViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_234AE86C4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFActionViewModel_parameterSummary), *(void *)&self->action[OBJC_IVAR___WFActionViewModel_parameterSummary], *(void *)&self->observingParameters[OBJC_IVAR___WFActionViewModel_parameterSummary], *(void *)&self->visibleParameters[OBJC_IVAR___WFActionViewModel_parameterSummary]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFEC8);
  OUTLINED_FUNCTION_4();
  v4 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_7_24();
  v4();
  OUTLINED_FUNCTION_7_24();
  v4();
  OUTLINED_FUNCTION_7_24();
  v4();
  v5 = (char *)self + OBJC_IVAR___WFActionViewModel__resourceError;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7FA0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(char *))(v6 + 8))(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F98);
  OUTLINED_FUNCTION_4();
  v8 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_7_24();
  v8();
  OUTLINED_FUNCTION_7_24();
  v8();
  swift_release();
  swift_release();
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  sub_234B3B588();
  id v6 = a3;
  uint64_t v7 = self;
  sub_234AE228C();

  swift_bridgeObjectRelease();
}

- (void)actionIconDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE2654();
}

- (void)actionNameDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE26C8();
}

- (void)actionVisibleParametersDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE273C();
}

- (void)actionOutputDetailsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE2A24();
}

- (void)actionReloadAuxiliaryButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE2A98();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE2E00();
}

- (void)resourcesDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234AE3184();
}

- (void)favoritesDidChange:(id)a3
{
  uint64_t v4 = sub_234B38248();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234B38228();
  v8 = self;
  sub_234AE3420();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pasteboardDidChange
{
  v2 = self;
  sub_234AE37A0();
}

- (WFActionViewModel)init
{
}

@end