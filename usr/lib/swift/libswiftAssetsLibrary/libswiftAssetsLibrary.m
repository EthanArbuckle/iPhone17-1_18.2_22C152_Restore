void ALAssetsLibrary.enumerateGroupsWithTypes(_:usingBlock:failureBlock:)(unsigned int a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = a4;
  if (a2)
  {
    v15 = a2;
    v16 = a3;
    v11 = MEMORY[0x263EF8330];
    v12 = 1107296256;
    v13 = sub_22F4CAD7C;
    v14 = &block_descriptor_3;
    v9 = _Block_copy(&v11);
    swift_retain();
    swift_release();
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = 0;
  if (a4)
  {
LABEL_3:
    v15 = v7;
    v16 = a5;
    v11 = MEMORY[0x263EF8330];
    v12 = 1107296256;
    v13 = sub_22F4CADF4;
    v14 = &block_descriptor;
    v7 = _Block_copy(&v11);
    swift_retain();
    swift_release();
  }
LABEL_4:
  if (a1 == -1) {
    v10 = 63;
  }
  else {
    v10 = a1;
  }
  [v5 enumerateGroupsWithTypes:v10 usingBlock:v9 failureBlock:v7];
  _Block_release(v7);
  _Block_release(v9);
}

void sub_22F4CAD7C(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

void sub_22F4CADF4(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

void objc_release(id a1)
{
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}