uint64_t static ContinuityDisplayProfile.profile.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = sub_25E3AB700();
  v1 = *(void *)(v0 - 8);
  v2 = MEMORY[0x270FA5388](v0);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v6 = (char *)&v13 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3862F0);
  v7 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B386300) - 8);
  v8 = (*(unsigned __int8 *)(*(void *)v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25E3ABA90;
  v10 = v7[14];
  sub_25E3AB6D0();
  *(void *)(v9 + v8 + v10) = _s26SpringBoardDisplayServices010ContinuityC7ProfileO13sceneRequestsSay13ShellSceneKit0J7RequestVGvgZ_0();
  sub_25E3AA068(v9);
  sub_25E3AB6F0();
  sub_25E3AB5B4(0, &qword_26B386308);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v11 = sub_25E3AB770();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v11;
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

unint64_t sub_25E3AA068(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386300);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B386310);
  uint64_t v6 = sub_25E3AB780();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25E3AB5F4(v12, (uint64_t)v5);
    unint64_t result = sub_25E3AA4A4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25E3AB6E0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25E3AA32C()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification();
  id v1 = objc_msgSendSuper2(&v8, sel_defaultExtensions);
  if (v1)
  {
    uint64_t v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ECF78);
    uint64_t v3 = sub_25E3AB760();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (uint64_t)sub_25E3AA9A4(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
  }
  unint64_t v5 = *(void *)(v3 + 16);
  unint64_t v4 = *(void *)(v3 + 24);
  if (v5 >= v4 >> 1) {
    uint64_t v3 = (uint64_t)sub_25E3AA9A4((char *)(v4 > 1), v5 + 1, 1, (char *)v3);
  }
  uint64_t v6 = sub_25E3AB5B4(0, &qword_26A6ECF80);
  *(void *)(v3 + 16) = v5 + 1;
  *(void *)(v3 + 8 * v5 + 32) = v6;
  return v3;
}

id sub_25E3AA470()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25E3AA4A4(uint64_t a1)
{
  sub_25E3AB6E0();
  sub_25E3AB65C(&qword_26B3862F8);
  uint64_t v2 = sub_25E3AB710();
  return sub_25E3AA528(a1, v2);
}

unint64_t sub_25E3AA528(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25E3AB6E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25E3AB65C(&qword_26A6ECF90);
      char v15 = sub_25E3AB720();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

char *sub_25E3AA6D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ECF98);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_25E3AA7D0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B386318);
  uint64_t v10 = *(void *)(sub_25E3AB6C0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25E3AB6C0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_25E3AA9A4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ECF88);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *_s26SpringBoardDisplayServices010ContinuityC7ProfileO13sceneRequestsSay13ShellSceneKit0J7RequestVGvgZ_0()
{
  uint64_t v0 = sub_25E3AB6C0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v95 = (char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v96 = (char *)&v88 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v88 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v89 = (char *)&v88 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v94 = (char *)&v88 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v88 = (char *)&v88 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v88 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v88 - v19;
  MEMORY[0x270FA5388](v18);
  v22 = (char *)&v88 - v21;
  v23 = (void *)sub_25E3AB730();
  id v91 = self;
  id v24 = objc_msgSend(v91, sel_identityForDaemonJobLabel_, v23);

  id v90 = self;
  id v25 = objc_msgSend(v90, sel_identityForProcessIdentity_, v24);

  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82988]), sel_init);
  objc_msgSend(v26, sel_setPreferredLevel_, 0.0);
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F79720]), sel_init);
  id v92 = v26;
  id v101 = v25;
  sub_25E3AB6A0();
  v27 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v93 = v22;
  v102 = v27;
  v27(v20, v22, v0);
  v28 = (void *)sub_25E3AA7D0(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v30 = v28[2];
  unint64_t v29 = v28[3];
  v31 = v28;
  if (v30 >= v29 >> 1) {
    v31 = (void *)sub_25E3AA7D0(v29 > 1, v30 + 1, 1, v28);
  }
  v31[2] = v30 + 1;
  v32 = v31;
  v33 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
  unint64_t v100 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v103 = *(void *)(v1 + 72);
  v97 = v33;
  uint64_t v98 = v1 + 32;
  v33((char *)v31 + v100 + v103 * v30, v20, v0);
  unsigned int v34 = objc_msgSend(self, sel_isSupported);
  uint64_t v99 = v1;
  if (v34)
  {
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82988]), sel_init);
    objc_msgSend(v35, sel_setPreferredLevel_, *MEMORY[0x263F79788]);
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F79758]), sel_init);
    id v36 = v101;
    id v37 = v35;
    sub_25E3AB6A0();
    v38 = v88;
    v102(v88, v17, v0);
    unint64_t v40 = v31[2];
    unint64_t v39 = v31[3];
    if (v40 >= v39 >> 1) {
      v31 = (void *)sub_25E3AA7D0(v39 > 1, v40 + 1, 1, v31);
    }
    v31[2] = v40 + 1;
    v32 = v31;
    v97((char *)v31 + v100 + v40 * v103, v38, v0);

    uint64_t v1 = v99;
    (*(void (**)(char *, uint64_t))(v99 + 8))(v17, v0);
  }
  if (objc_msgSend(self, sel_isSupported))
  {
    id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82988]), sel_init);
    objc_msgSend(v41, sel_setPreferredLevel_, *MEMORY[0x263F79790]);
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F79760]), sel_init);
    id v42 = v101;
    id v43 = v41;
    v44 = v94;
    sub_25E3AB6A0();
    v45 = v89;
    v102(v89, v44, v0);
    unint64_t v47 = v32[2];
    unint64_t v46 = v32[3];
    size_t v48 = (size_t)v32;
    if (v47 >= v46 >> 1) {
      size_t v48 = sub_25E3AA7D0(v46 > 1, v47 + 1, 1, v32);
    }
    *(void *)(v48 + 16) = v47 + 1;
    v32 = (void *)v48;
    v97((char *)(v48 + v100 + v47 * v103), v45, v0);

    (*(void (**)(char *, uint64_t))(v1 + 8))(v94, v0);
  }
  id v49 = objc_msgSend(self, sel_mainBundle);
  id v50 = objc_msgSend(v49, sel_bundleIdentifier);

  if (!v50) {
    goto LABEL_46;
  }
  uint64_t v51 = sub_25E3AB740();
  uint64_t v53 = v52;

  if (v51 == 0xD000000000000015 && v53 == 0x800000025E3ABD70
    || (sub_25E3AB790() & 1) != 0
    || v51 == 0xD00000000000001FLL && v53 == 0x800000025E3ABD90)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v86 = sub_25E3AB790();
    swift_bridgeObjectRelease();
    if ((v86 & 1) == 0)
    {
LABEL_46:
      (*(void (**)(char *, uint64_t))(v99 + 8))(v93, v0);

      return v32;
    }
  }
  v54 = (void *)sub_25E3AB730();
  id v55 = objc_msgSend(v91, sel_identityForAngelJobLabel_, v54);

  id v56 = objc_msgSend(v90, sel_identityForProcessIdentity_, v55);
  v57 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82988]), sel_init);
  v58 = v57;
  uint64_t v59 = v32[2];
  v94 = v57;
  if (v59)
  {
    id v90 = v56;
    id v91 = v32;
    v60 = (char *)v32 + v100;
    v61 = (void (**)(char *, uint64_t))(v99 + 8);
    swift_bridgeObjectRetain_n();
    id v62 = v58;
    v63 = (char *)MEMORY[0x263F8EE78];
    do
    {
      v102(v8, v60, v0);
      v64 = (void *)sub_25E3AB6B0();
      if (v64)
      {
        v65 = v64;
        objc_msgSend(v64, sel_preferredLevel);
        uint64_t v67 = v66;

        (*v61)(v8, v0);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v63 = sub_25E3AA6D4(0, *((void *)v63 + 2) + 1, 1, v63);
        }
        unint64_t v69 = *((void *)v63 + 2);
        unint64_t v68 = *((void *)v63 + 3);
        if (v69 >= v68 >> 1) {
          v63 = sub_25E3AA6D4((char *)(v68 > 1), v69 + 1, 1, v63);
        }
        *((void *)v63 + 2) = v69 + 1;
        *(void *)&v63[8 * v69 + 32] = v67;
      }
      else
      {
        (*v61)(v8, v0);
      }
      v60 += v103;
      --v59;
    }
    while (v59);
    v32 = v91;
    swift_bridgeObjectRelease_n();
    id v56 = v90;
    uint64_t v70 = *((void *)v63 + 2);
    if (v70) {
      goto LABEL_28;
    }
  }
  else
  {
    v76 = v57;
    v63 = (char *)MEMORY[0x263F8EE78];
    uint64_t v70 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v70)
    {
LABEL_28:
      double v71 = *((double *)v63 + 4);
      uint64_t v72 = v70 - 1;
      if (v70 != 1)
      {
        v73 = (double *)(v63 + 40);
        do
        {
          double v74 = *v73++;
          double v75 = v74;
          if (v71 < v74) {
            double v71 = v75;
          }
          --v72;
        }
        while (v72);
      }
      goto LABEL_36;
    }
  }
  double v71 = 0.0;
LABEL_36:
  swift_bridgeObjectRelease();
  double v77 = 1.0;
  if (v70) {
    double v77 = v71 + 1.0;
  }
  v78 = v94;
  objc_msgSend(v94, sel_setPreferredLevel_, v77);

  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification()), sel_init);
  v79 = v78;
  id v80 = v56;
  v81 = v96;
  sub_25E3AB6A0();
  v102(v95, v81, v0);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v32 = (void *)sub_25E3AA7D0(0, v32[2] + 1, 1, v32);
  }
  uint64_t v82 = v99;
  unint64_t v84 = v32[2];
  unint64_t v83 = v32[3];
  if (v84 >= v83 >> 1) {
    v32 = (void *)sub_25E3AA7D0(v83 > 1, v84 + 1, 1, v32);
  }
  v32[2] = v84 + 1;
  v97((char *)v32 + v100 + v84 * v103, v95, v0);

  v85 = *(void (**)(char *, uint64_t))(v82 + 8);
  v85(v96, v0);
  v85(v93, v0);
  return v32;
}

ValueMetadata *type metadata accessor for ContinuityDisplayProfile()
{
  return &type metadata for ContinuityDisplayProfile;
}

uint64_t type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification()
{
  return self;
}

uint64_t sub_25E3AB5B4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25E3AB5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B386300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E3AB65C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25E3AB6E0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E3AB6A0()
{
  return MEMORY[0x270F63868]();
}

uint64_t sub_25E3AB6B0()
{
  return MEMORY[0x270F63870]();
}

uint64_t sub_25E3AB6C0()
{
  return MEMORY[0x270F63878]();
}

uint64_t sub_25E3AB6D0()
{
  return MEMORY[0x270F63880]();
}

uint64_t sub_25E3AB6E0()
{
  return MEMORY[0x270F63888]();
}

uint64_t sub_25E3AB6F0()
{
  return MEMORY[0x270F63890]();
}

uint64_t sub_25E3AB700()
{
  return MEMORY[0x270F63898]();
}

uint64_t sub_25E3AB710()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25E3AB720()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E3AB730()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E3AB740()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E3AB750()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25E3AB760()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E3AB770()
{
  return MEMORY[0x270F638A0]();
}

uint64_t sub_25E3AB780()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E3AB790()
{
  return MEMORY[0x270F9F7D0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}