@interface ICNoteTimelineControllerInternal
+ (id)ascendingTimelineSectionsForNoteObjectIds:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6;
+ (void)setTimeZone:(id)a3;
- (_TtC7NotesUI32ICNoteTimelineControllerInternal)init;
@end

@implementation ICNoteTimelineControllerInternal

+ (id)ascendingTimelineSectionsForNoteObjectIds:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6
{
  uint64_t v7 = sub_1B0B7FDEC();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
  uint64_t v11 = sub_1B0B825CC();
  uint64_t v12 = sub_1B0B825CC();
  sub_1B0B7FDAC();
  _s7NotesUI32ICNoteTimelineControllerInternalC09ascendingD8Sections3for5dates13referenceDate9directionSaySo0cD7SectionCGSaySo17NSManagedObjectIDCG_Say10Foundation0L0VGAQSo35ICFolderCustomNoteSortTypeDirectionVtFZ_0(v11, v12, v10, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v8 + 8))(v10, v7);
  sub_1B0A2E124(0, &qword_1EBBB49C8);
  v13 = (void *)sub_1B0B825AC();
  swift_bridgeObjectRelease();
  return v13;
}

+ (void)setTimeZone:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44F8);
  MEMORY[0x1F4188790](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B0B7FF9C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v16 - v11;
  sub_1B0B7FF8C();
  if (qword_1EBBB4890 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_1EBBB4AB0);
  sub_1B0B7FECC();
  uint64_t v14 = sub_1B0B7FEFC();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v5, 0, 1, v14);
  swift_beginAccess();
  sub_1B0B32AE4((uint64_t)v5, v13);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    sub_1B0B7FEDC();
  }
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (_TtC7NotesUI32ICNoteTimelineControllerInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICNoteTimelineControllerInternal *)&v3 init];
}

@end