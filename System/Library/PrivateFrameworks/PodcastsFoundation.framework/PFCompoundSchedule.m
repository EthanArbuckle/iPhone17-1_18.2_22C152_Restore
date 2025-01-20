@interface PFCompoundSchedule
- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4;
- (PFCompoundSchedule)init;
- (PFCompoundSchedule)initWithType:(int64_t)a3 children:(id)a4;
@end

@implementation PFCompoundSchedule

- (PFCompoundSchedule)initWithType:(int64_t)a3 children:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F12E0);
  v6 = (objc_class *)sub_1ACE76578();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFCompoundSchedule_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFCompoundSchedule_children) = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CompoundSchedule();
  return [(PFCompoundSchedule *)&v8 init];
}

- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v6 - 8);
  objc_super v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1ACE750A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1ACE75078();
  if (a4)
  {
    sub_1ACE75078();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v13, 1, v9);
  v14 = self;
  char v15 = sub_1ACA9021C(v12, (uint64_t)v8);

  sub_1ACA3E034((uint64_t)v8);
  (*(void (**)(unsigned int (**)(char *, uint64_t, uint64_t), uint64_t))(v10 + 8))(v12, v9);
  return v15 & 1;
}

- (PFCompoundSchedule)init
{
  result = (PFCompoundSchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end