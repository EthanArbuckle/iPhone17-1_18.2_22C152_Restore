@interface _UIMagicMorphMilestone
- (_UIMagicMorphMilestone)init;
- (double)value;
- (id)action;
@end

@implementation _UIMagicMorphMilestone

- (double)value
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphMilestone_value);
}

- (id)action
{
  uint64_t v2 = *(void *)&self->property[OBJC_IVAR____UIMagicMorphMilestone_action];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphMilestone_action);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_1856A95EC;
  v5[3] = &block_descriptor_53;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (_UIMagicMorphMilestone)init
{
  result = (_UIMagicMorphMilestone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end