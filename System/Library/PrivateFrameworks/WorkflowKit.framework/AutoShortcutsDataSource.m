@interface AutoShortcutsDataSource
- (_TtC11WorkflowKit23AutoShortcutsDataSource)init;
- (void)appShortcutsChanged;
@end

@implementation AutoShortcutsDataSource

- (_TtC11WorkflowKit23AutoShortcutsDataSource)init
{
  return (_TtC11WorkflowKit23AutoShortcutsDataSource *)AutoShortcutsDataSource.init()();
}

- (void)appShortcutsChanged
{
  v2 = self;
  sub_1C81E6E24();
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA511C90);
  OUTLINED_FUNCTION_9_0();
  v2();
  swift_release();
}

@end