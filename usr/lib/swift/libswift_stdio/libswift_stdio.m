uint64_t stderr.getter()
{
  uint64_t result;

  result = *MEMORY[0x263EF8348];
  if (!*MEMORY[0x263EF8348]) {
    __break(1u);
  }
  return result;
}

uint64_t stdin.getter()
{
  uint64_t result = *MEMORY[0x263EF8350];
  if (!*MEMORY[0x263EF8350]) {
    __break(1u);
  }
  return result;
}

uint64_t stdin.setter(uint64_t result)
{
  *MEMORY[0x263EF8350] = result;
  return result;
}

void *stdin.modify(void *result)
{
  if (*MEMORY[0x263EF8350])
  {
    *uint64_t result = *MEMORY[0x263EF8350];
    return stdin.modify;
  }
  else
  {
    __break(1u);
  }
  return result;
}

{
  *MEMORY[0x263EF8350] = *result;
  return result;
}

uint64_t stdout.getter()
{
  uint64_t result = *MEMORY[0x263EF8358];
  if (!*MEMORY[0x263EF8358]) {
    __break(1u);
  }
  return result;
}

uint64_t stdout.setter(uint64_t result)
{
  *MEMORY[0x263EF8358] = result;
  return result;
}

void *stdout.modify(void *result)
{
  if (*MEMORY[0x263EF8358])
  {
    *uint64_t result = *MEMORY[0x263EF8358];
    return stdout.modify;
  }
  else
  {
    __break(1u);
  }
  return result;
}

{
  *MEMORY[0x263EF8358] = *result;
  return result;
}

uint64_t stderr.setter(uint64_t result)
{
  *MEMORY[0x263EF8348] = result;
  return result;
}

void *stderr.modify(void *result)
{
  if (*MEMORY[0x263EF8348])
  {
    *uint64_t result = *MEMORY[0x263EF8348];
    return stderr.modify;
  }
  else
  {
    __break(1u);
  }
  return result;
}

{
  *MEMORY[0x263EF8348] = *result;
  return result;
}

char *dprintf(_:_:_:)(uint64_t a1, const char *a2, uint64_t a3)
{
  return specialized withVaList<A>(_:_:)(a3, a1, a2);
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, const char *a3)
{
  type metadata accessor for __VaListBuilder();
  v4 = (void *)swift_allocObject();
  v4[2] = 8;
  v4[3] = 0;
  v5 = v4 + 3;
  v4[4] = 0;
  v4[5] = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v8 + 40 * v7, (uint64_t)v26);
      __swift_project_boxed_opaque_existential_1(v26, v26[3]);
      uint64_t result = (char *)dispatch thunk of CVarArg._cVarArgEncoding.getter();
      uint64_t v10 = *v5;
      uint64_t v11 = *((void *)result + 2);
      BOOL v12 = __OFADD__(*v5, v11);
      uint64_t v13 = *v5 + v11;
      if (v12)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      v14 = result;
      uint64_t v15 = v4[4];
      if (v15 >= v13) {
        goto LABEL_18;
      }
      if (v15 + 0x4000000000000000 < 0) {
        goto LABEL_30;
      }
      v16 = (char *)v4[5];
      if (2 * v15 > v13) {
        uint64_t v13 = 2 * v15;
      }
      v4[4] = v13;
      if ((unint64_t)(v13 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_31;
      }
      uint64_t result = (char *)swift_slowAlloc();
      v4[5] = result;
      if (v16) {
        break;
      }
LABEL_19:
      if (!result) {
        goto LABEL_34;
      }
      uint64_t v18 = *((void *)v14 + 2);
      if (v18)
      {
        v19 = (uint64_t *)(v14 + 32);
        uint64_t v20 = *v5;
        while (1)
        {
          uint64_t v21 = *v19++;
          *(void *)&result[8 * v20] = v21;
          uint64_t v20 = *v5 + 1;
          if (__OFADD__(*v5, 1)) {
            break;
          }
          uint64_t *v5 = v20;
          if (!--v18) {
            goto LABEL_3;
          }
        }
        __break(1u);
        goto LABEL_29;
      }
LABEL_3:
      ++v7;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      if (v7 == v6) {
        goto LABEL_25;
      }
    }
    if (result != v16 || result >= &v16[8 * v10]) {
      memmove(result, v16, 8 * v10);
    }
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    uint64_t result = (char *)v4[5];
    goto LABEL_19;
  }
LABEL_25:
  va_list v22 = (va_list)__VaListBuilder.va_list()();
  uint64_t result = (char *)a2;
  if (a2 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_32;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
  }
  else
  {
    uint64_t v23 = vdprintf(a2, a3, v22);
    swift_release();
    return (char *)v23;
  }
  return result;
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, char *a2, size_t a3, const char *a4)
{
  type metadata accessor for __VaListBuilder();
  v5 = (void *)swift_allocObject();
  v5[2] = 8;
  v5[3] = 0;
  uint64_t v6 = v5 + 3;
  v5[4] = 0;
  v5[5] = 0;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_25:
    va_list v23 = (va_list)__VaListBuilder.va_list()();
    uint64_t v24 = vsnprintf(a2, a3, a4, v23);
    swift_release();
    return (char *)v24;
  }
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v9 + 40 * v8, (uint64_t)v28);
    __swift_project_boxed_opaque_existential_1(v28, v28[3]);
    uint64_t result = (char *)dispatch thunk of CVarArg._cVarArgEncoding.getter();
    uint64_t v11 = *v6;
    uint64_t v12 = *((void *)result + 2);
    BOOL v13 = __OFADD__(*v6, v12);
    uint64_t v14 = *v6 + v12;
    if (v13) {
      break;
    }
    uint64_t v15 = result;
    uint64_t v16 = v5[4];
    if (v16 >= v14) {
      goto LABEL_18;
    }
    if (v16 + 0x4000000000000000 < 0) {
      goto LABEL_28;
    }
    v17 = (char *)v5[5];
    if (2 * v16 > v14) {
      uint64_t v14 = 2 * v16;
    }
    v5[4] = v14;
    if ((unint64_t)(v14 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_29;
    }
    uint64_t result = (char *)swift_slowAlloc();
    v5[5] = result;
    if (v17)
    {
      if (result != v17 || result >= &v17[8 * v11]) {
        memmove(result, v17, 8 * v11);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
      uint64_t result = (char *)v5[5];
    }
    if (!result) {
      goto LABEL_30;
    }
    uint64_t v19 = *((void *)v15 + 2);
    if (v19)
    {
      uint64_t v20 = (uint64_t *)(v15 + 32);
      uint64_t v21 = *v6;
      while (1)
      {
        uint64_t v22 = *v20++;
        *(void *)&result[8 * v21] = v22;
        uint64_t v21 = *v6 + 1;
        if (__OFADD__(*v6, 1)) {
          break;
        }
        *uint64_t v6 = v21;
        if (!--v19) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v8;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    if (v8 == v7) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

char *snprintf(ptr:_:_:_:)(char *a1, size_t a2, const char *a3, uint64_t a4)
{
  return specialized withVaList<A>(_:_:)(a4, a1, a2, a3);
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x270F9ED50]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x270F9ED58]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x270F9ED60]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x270F9FD48]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA68](*(void *)&a1, a2, a3);
}