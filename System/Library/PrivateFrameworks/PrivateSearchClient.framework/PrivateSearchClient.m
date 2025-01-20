uint64_t static PrivateSearchFactory.newCallContext(withClientContext:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = sub_25A7FBD40();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  swift_beginAccess();
  sub_25A7FB7DC(a1, v5 + 16);
  result = swift_endAccess();
  v7 = MEMORY[0x263F61200];
  a2[3] = v4;
  a2[4] = v7;
  *a2 = v5;
  return result;
}

uint64_t sub_25A7FB7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t static PrivateSearchFactory.newPrivateSearchIndex(_:_:)@<X0>(void *a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  v6 = __swift_project_boxed_opaque_existential_1(a1, v4);
  v17[3] = v4;
  v17[4] = *(void *)(v5 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  v16[3] = v8;
  v16[4] = *(void *)(v9 + 16);
  v11 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v11, v10, v8);
  sub_25A7FBD60();
  swift_allocObject();
  sub_25A7FBD50();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25A7FBDA0();
  swift_bridgeObjectRelease();
  MEMORY[0x261145620](v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25A7FBD80();
  swift_allocObject();
  uint64_t result = sub_25A7FBD70();
  uint64_t v15 = MEMORY[0x263F61210];
  a2[3] = v13;
  a2[4] = v15;
  *a2 = result;
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t static PrivateSearchFactory.newPrivateSearchIndexInMemory(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25A7FBD30();
  swift_allocObject();
  uint64_t v3 = sub_25A7FBD20();
  uint64_t v4 = MEMORY[0x263F611F8];
  uint64_t v20 = v2;
  uint64_t v21 = MEMORY[0x263F611F8];
  v19[0] = v3;
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v19, v2);
  uint64_t v6 = *(void *)(v4 + 8);
  v18[3] = v2;
  v18[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v5, v2);
  uint64_t v8 = v20;
  uint64_t v9 = v21;
  v10 = __swift_project_boxed_opaque_existential_1(v19, v20);
  v17[3] = v8;
  v17[4] = *(void *)(v9 + 16);
  v11 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v11, v10, v8);
  sub_25A7FBD60();
  swift_allocObject();
  sub_25A7FBD50();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25A7FBDA0();
  swift_bridgeObjectRelease();
  MEMORY[0x261145620](v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25A7FBD80();
  swift_allocObject();
  uint64_t v14 = sub_25A7FBD70();
  uint64_t v15 = MEMORY[0x263F61210];
  a1[3] = v13;
  a1[4] = v15;
  *a1 = v14;
  return __swift_destroy_boxed_opaque_existential_1(v19);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t PrivateSearchFactory.deinit()
{
  return v0;
}

uint64_t PrivateSearchFactory.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for PrivateSearchFactory()
{
  return self;
}

uint64_t sub_25A7FBD20()
{
  return MEMORY[0x270F57408]();
}

uint64_t sub_25A7FBD30()
{
  return MEMORY[0x270F57410]();
}

uint64_t sub_25A7FBD40()
{
  return MEMORY[0x270F57418]();
}

uint64_t sub_25A7FBD50()
{
  return MEMORY[0x270F57420]();
}

uint64_t sub_25A7FBD60()
{
  return MEMORY[0x270F57428]();
}

uint64_t sub_25A7FBD70()
{
  return MEMORY[0x270F57430]();
}

uint64_t sub_25A7FBD80()
{
  return MEMORY[0x270F57438]();
}

uint64_t sub_25A7FBD90()
{
  return MEMORY[0x270F57440]();
}

uint64_t sub_25A7FBDA0()
{
  return MEMORY[0x270F57448]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}