uint64_t PosterPair.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  sub_1D33729B8();
  sub_1D33722D8();
  v30 = v0;
  sub_1D3372A68();
  sub_1D33722D8();
  v2 = sub_1D3358F0C(0, 1, 1, MEMORY[0x1E4FBC860]);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_1D3358F0C((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  v5 = &v2[2 * v4];
  v5[4] = 0;
  v5[5] = 0xE000000000000000;
  v29 = OBJC_IVAR___PBFPosterPair_configuration;
  v6 = *(id *)(v0 + OBJC_IVAR___PBFPosterPair_configuration);
  v7 = objc_msgSend(v6, sel__path);
  v8 = objc_msgSend(v7, sel_serverIdentity);

  if (v8)
  {
    v9 = objc_msgSend(v8, sel_provider);

    sub_1D3372288();
  }
  else
  {
  }
  sub_1D33722D8();
  swift_bridgeObjectRelease();
  v11 = v2[2];
  v10 = v2[3];
  if (v11 >= v10 >> 1) {
    v2 = sub_1D3358F0C((void *)(v10 > 1), v11 + 1, 1, v2);
  }
  v2[2] = v11 + 1;
  v12 = &v2[2 * v11];
  v12[4] = 0x72656469766F7270;
  v12[5] = 0xEA0000000000203ALL;
  sub_1D33729B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1D33722D8();
  swift_bridgeObjectRelease();
  sub_1D33722D8();
  v14 = v2[2];
  v13 = v2[3];
  if (v14 >= v13 >> 1) {
    v2 = sub_1D3358F0C((void *)(v13 > 1), v14 + 1, 1, v2);
  }
  v2[2] = v14 + 1;
  v15 = &v2[2 * v14];
  v15[4] = 0xD000000000000011;
  v15[5] = 0x80000001D3399A80;
  sub_1D33729B8();
  swift_bridgeObjectRelease();
  sub_1D33722D8();
  swift_bridgeObjectRelease();
  v17 = v2[2];
  v16 = v2[3];
  if (v17 >= v16 >> 1) {
    v2 = sub_1D3358F0C((void *)(v16 > 1), v17 + 1, 1, v2);
  }
  v2[2] = v17 + 1;
  v18 = &v2[2 * v17];
  v18[4] = 0xD00000000000001CLL;
  v18[5] = 0x80000001D3399AA0;
  sub_1D33729B8();
  swift_bridgeObjectRelease();
  sub_1D33722D8();
  swift_bridgeObjectRelease();
  v20 = v2[2];
  v19 = v2[3];
  if (v20 >= v19 >> 1) {
    v2 = sub_1D3358F0C((void *)(v19 > 1), v20 + 1, 1, v2);
  }
  v2[2] = v20 + 1;
  v21 = &v2[2 * v20];
  v21[4] = 0xD000000000000027;
  v21[5] = 0x80000001D3399AC0;
  v22 = objc_msgSend(*(id *)(v1 + v29), sel__path, v29, v30);
  v23 = objc_msgSend(v22, sel_description);
  sub_1D3372288();

  sub_1D33722D8();
  swift_bridgeObjectRelease();
  v25 = v2[2];
  v24 = v2[3];
  if (v25 >= v24 >> 1) {
    v2 = sub_1D3358F0C((void *)(v24 > 1), v25 + 1, 1, v2);
  }
  v2[2] = v25 + 1;
  v26 = &v2[2 * v25];
  v26[4] = 0x203A68746170;
  v26[5] = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A8B98);
  sub_1D3359898();
  v27 = sub_1D3372238();
  swift_bridgeObjectRelease();
  return v27;
}

id PosterPair.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PosterPair.init()()
{
}

id PosterPair.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterPair();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D3358908@<X0>(void *a1@<X8>)
{
  objc_super v2 = (void *)(*v1 + OBJC_IVAR___PBFPosterPair_id);
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

id sub_1D3358924()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  id v1 = (void *)sub_1D3372258();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_1D3371E38();

    swift_willThrow();
  }
  return v2;
}

void *sub_1D33589F0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD700E0);
      v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FBC860];
      v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1D3359924(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D3358B14(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1D3358C8C(a1, a2, a3, a4, &qword_1EA6A9B88, MEMORY[0x1E4F27DE8], MEMORY[0x1E4F27DE8]);
}

void *sub_1D3358B48(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA6A9E20);
      v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FBC860];
      v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1D3359B90(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D3358C58(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1D3358C8C(a1, a2, a3, a4, &qword_1EA6A9C60, MEMORY[0x1E4F27990], MEMORY[0x1E4F27990]);
}

uint64_t sub_1D3358C8C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    v18 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_1D3372A78();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1D3359A34(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_1D3358F0C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD6FF00);
      v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1D3359C7C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id sub_1D335901C(void *a1)
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  v9[0] = 0;
  id v1 = objc_msgSend(a1, sel_loadConfiguredPropertiesWithError_, v9);
  if (v1)
  {
    id v2 = v1;
    id v3 = v9[0];
  }
  else
  {
    id v4 = v9[0];
    char v5 = (void *)sub_1D3371E38();

    swift_willThrow();
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F926E8]), sel_init);
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F92680]), sel_init);
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F92640]), sel_initWithTitleStyleConfiguration_focusConfiguration_complicationLayout_renderingConfiguration_homeScreenConfiguration_colorVariationsConfiguration_quickActionsConfiguration_suggestionMetadata_otherMetadata_userInfo_, v6, 0, 0, 0, v7, 0, 0, 0, 0, 0);
  }
  return v2;
}

id sub_1D3359148(void *a1, void *a2)
{
  uint64_t v4 = sub_1D3371E68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  id v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = 0;
  if ((objc_msgSend(a1, sel_pbf_isLegacy) & 1) == 0)
  {
    id v9 = objc_msgSend(a1, sel__path);
    id v8 = objc_msgSend(v9, sel_serverIdentity);

    if (v8)
    {
      id v10 = objc_msgSend(v8, sel_provider);

      sub_1D3372288();
      id v11 = objc_allocWithZone(MEMORY[0x1E4F223A0]);
      swift_bridgeObjectRetain();
      id v12 = sub_1D3358924();
      swift_bridgeObjectRelease();
      id v13 = objc_msgSend(a2, sel_otherMetadata);
      if (v13)
      {
        uint64_t v14 = v13;
        id v15 = objc_msgSend(v13, sel_displayNameLocalizationKey);

        if (v15)
        {
          sub_1D3372288();

          uint64_t v16 = self;
          id v17 = [v12 URL];
          sub_1D3371E58();

          v18 = (void *)sub_1D3371E48();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          id v19 = objc_msgSend(v16, sel_pf_uniqueBundleWithURL_, v18);

          if (v19)
          {
            BOOL v20 = (void *)sub_1D3372258();
            swift_bridgeObjectRelease();
            id v21 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, 0);

            id v8 = (id)sub_1D3372288();
            return v8;
          }
          swift_bridgeObjectRelease();
        }
      }
      id v23 = objc_msgSend(v12, sel_localizedName);
      id v8 = (id)sub_1D3372288();
    }
  }
  return v8;
}

void sub_1D3359648(void *a1, void *a2)
{
  id v3 = v2;
  v29 = a2;
  uint64_t v5 = sub_1D3371F48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  id v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (id *)&v3[OBJC_IVAR___PBFPosterPair_localizedTitle];
  *id v9 = 0;
  v9[1] = 0;
  uint64_t v10 = OBJC_IVAR___PBFPosterPair_associatedConfiguration;
  *(void *)&v3[OBJC_IVAR___PBFPosterPair_associatedConfiguration] = 0;
  *(void *)&v3[OBJC_IVAR___PBFPosterPair_provisionalHomeScreenConfiguration] = 0;
  uint64_t v11 = OBJC_IVAR___PBFPosterPair_observers;
  id v12 = self;
  id v13 = v3;
  *(void *)&v3[v11] = objc_msgSend(v12, sel_weakObjectsHashTable);
  v13[OBJC_IVAR___PBFPosterPair_ignoreNotifyingForProvisionalHomeScreenConfigurationChange] = 0;
  id v14 = objc_msgSend(a1, sel__path);
  id v15 = objc_msgSend(v14, sel_serverIdentity);

  if (v15)
  {
    id v16 = objc_msgSend(v15, sel_posterUUID);

    sub_1D3371F28();
    uint64_t v17 = sub_1D3371EF8();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    BOOL v20 = (uint64_t *)&v13[OBJC_IVAR___PBFPosterPair_id];
    *BOOL v20 = v17;
    v20[1] = v19;
    *(void *)&v13[OBJC_IVAR___PBFPosterPair_configuration] = a1;
    id v21 = a1;
    id v22 = sub_1D335901C(v21);
    *id v9 = sub_1D3359148(v21, v22);
    v9[1] = v23;
    swift_bridgeObjectRelease();
    *(void *)&v13[OBJC_IVAR___PBFPosterPair_configuredProperties] = v22;
    uint64_t v24 = *(void **)&v3[v10];
    v25 = v29;
    *(void *)&v3[v10] = v29;
    id v26 = v25;

    v27 = (objc_class *)type metadata accessor for PosterPair();
    v30.receiver = v13;
    v30.super_class = v27;
    objc_msgSendSuper2(&v30, sel_init);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_1D3359898()
{
  unint64_t result = qword_1EA6A8BA0;
  if (!qword_1EA6A8BA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA6A8B98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6A8BA0);
  }
  return result;
}

uint64_t type metadata accessor for PosterPair()
{
  return self;
}

uint64_t sub_1D3359918()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t sub_1D3359924(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD700C8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1D3372AF8();
  __break(1u);
  return result;
}

uint64_t sub_1D3359A34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_1D3372AF8();
  __break(1u);
  return result;
}

char *sub_1D3359B90(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1D3372AF8();
  __break(1u);
  return result;
}

uint64_t sub_1D3359C7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1D3372AF8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *MobileKeyBagLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFPosterExtensionDataStore.m", 122, @"%s", *a1);

  __break(1u);
}

void __PBFDispatchAsyncWithString_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "fired block %p for msg %@");
}

void __PBFDispatchAsyncWithString_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1D31CE000, v0, v1, "firing block %p for msg %@");
}

void __getDNDModeConfigurationServiceClass_block_invoke_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *DoNotDisturbLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFPosterGalleryPreviewViewController.m", 64, @"%s", *a1);

  __break(1u);
}

void __getDNDModeConfigurationServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getDNDModeConfigurationServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFPosterGalleryPreviewViewController.m", 65, @"Unable to find class %s", "DNDModeConfigurationService");

  __break(1u);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL PBFPosterModelStoreCoordinatorSharedInit(__kindof PBFPosterModelStoreCoordinator *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL PBFPosterModelStoreCoordinatorSharedInit(__kindof PBFPosterModelStoreCoordinator *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_3()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL PBFPosterModelStoreCoordinatorSharedInit(__kindof PBFPosterModelStoreCoordinator *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_4()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL PBFPosterModelStoreCoordinatorSharedInit(__kindof PBFPosterModelStoreCoordinator *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_5()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL PBFPosterModelStoreCoordinatorSharedInit(__kindof PBFPosterModelStoreCoordinator *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PBFPosterModelStoreCoordinatorSharedInit_cold_6()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
}

void __providerURLForOptions_cold_1()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL *__providerURLForOptions(PBFPosterModelStoreSetupOptions, NSURL *__strong, PFServerPosterIdentity *__strong)");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void __providerURLForOptions_cold_2()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL *__providerURLForOptions(PBFPosterModelStoreSetupOptions, NSURL *__strong, PFServerPosterIdentity *__strong)");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void __stagedProviderURLForIdentity_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"NSURL *__stagedProviderURLForIdentity(PFServerPosterIdentity *__strong)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void __getSBSWallpaperServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFModalRootViewController.m", 62, @"%s", *a1);

  __break(1u);
}

void __getSBSWallpaperServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSBSWallpaperServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFModalRootViewController.m", 63, @"Unable to find class %s", "SBSWallpaperService");

  __break(1u);
}

void __getPLLogRegisteredEventSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PowerLogLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFPowerLogger.m", 38, @"%s", *a1);

  __break(1u);
}

void _PBFPosterRoleCoordinatorSynchronizeAttribute_cold_1()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _PBFPosterRoleCoordinatorSynchronizeAttribute(PRPosterConfiguration *__strong _Nonnull, __strong PRPosterRoleAttributeType _Nonnull, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, __strong id<PBFPosterExtensionDataStorageMutating,PBFPosterExtensionDataStorageRetrieving> _Nonnull, NSError *__autoreleasing * _Nullable)");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _PBFPosterRoleCoordinatorSynchronizeAttribute_cold_2()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _PBFPosterRoleCoordinatorSynchronizeAttribute(PRPosterConfiguration *__strong _Nonnull, __strong PRPosterRoleAttributeType _Nonnull, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, __strong id<PBFPosterExtensionDataStorageMutating,PBFPosterExtensionDataStorageRetrieving> _Nonnull, NSError *__autoreleasing * _Nullable)");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _PBFPosterRoleCoordinatorSynchronizeAttribute_cold_3()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _PBFPosterRoleCoordinatorSynchronizeAttribute(PRPosterConfiguration *__strong _Nonnull, __strong PRPosterRoleAttributeType _Nonnull, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, id<PRPosterRoleAttribute>  _Nullable __strong, __strong id<PBFPosterExtensionDataStorageMutating,PBFPosterExtensionDataStorageRetrieving> _Nonnull, NSError *__autoreleasing * _Nullable)");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void __getDNDSystemImageNameForModeSemanticTypeSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DoNotDisturbLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFGalleryConfiguration.m", 49, @"%s", *a1);

  __break(1u);
}

void PRPosterRoleLookupForExtensionBundleIdentifier_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D31CE000, log, OS_LOG_TYPE_FAULT, "Unable to find role for extensionBundleIdentifier '%{public}@' / descriptorIdentifier '%{public}@'", (uint8_t *)&v3, 0x16u);
}

void __getWKDefaultWallpaperManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *WallpaperKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFWallpaperKitBridge.m", 22, @"%s", *a1);

  __break(1u);
}

void __getWKDefaultWallpaperManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWKDefaultWallpaperManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFWallpaperKitBridge.m", 23, @"Unable to find class %s", "WKDefaultWallpaperManager");

  __break(1u);
}

void _NSStringFromPBFSQLiteWhereClauseComparison_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"NSString *_NSStringFromPBFSQLiteWhereClauseComparison(PBFSQLiteWhereClauseComparison)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _WhereClauseComparisonRequiresValue_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL _WhereClauseComparisonRequiresValue(PBFSQLiteWhereClauseComparison)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _NSStringFromPBFSQLiteObjectParameter_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"NSString *_NSStringFromPBFSQLiteObjectParameter(__strong id<PBFSQLiteQueryValue>)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _NSStringFromPBFSQLiteWhereClauseCombinator_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"NSString *_NSStringFromPBFSQLiteWhereClauseCombinator(PBFSQLiteWhereClauseCombinator)"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void __getSBSWallpaperServiceClass_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBFSBSWallpaperServiceHelper.m", 16, @"%s", *a1);

  __break(1u);
}

void __getSBSWallpaperServiceClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSBSWallpaperServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFSBSWallpaperServiceHelper.m", 17, @"Unable to find class %s", "SBSWallpaperService");

  __break(1u);
}

void PBFDefaultUpdateIntervalForDataComponent_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSTimeInterval PBFDefaultUpdateIntervalForDataComponent(__strong PBFDataComponent)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint8_t v6 = @"PBFDataFreshnessState.m";
  __int16 v7 = 1024;
  int v8 = 40;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

uint64_t sub_1D3371D98()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1D3371DA8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1D3371DB8()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1D3371DC8()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1D3371DD8()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1D3371DE8()
{
  return MEMORY[0x1F40E4028]();
}

uint64_t sub_1D3371DF8()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1D3371E08()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1D3371E18()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1D3371E28()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D3371E38()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D3371E48()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1D3371E58()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1D3371E68()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D3371E78()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1D3371E88()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D3371E98()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1D3371EA8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D3371EB8()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D3371EC8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D3371ED8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D3371EE8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1D3371EF8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D3371F08()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1D3371F18()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1D3371F28()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1D3371F38()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D3371F48()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D3371F58()
{
  return MEMORY[0x1F40E5B48]();
}

uint64_t sub_1D3371F68()
{
  return MEMORY[0x1F40E5B70]();
}

uint64_t sub_1D3371F78()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1D3371F88()
{
  return MEMORY[0x1F40E5BC8]();
}

uint64_t sub_1D3371F98()
{
  return MEMORY[0x1F40E5C08]();
}

uint64_t sub_1D3371FA8()
{
  return MEMORY[0x1F40E5C38]();
}

uint64_t sub_1D3371FB8()
{
  return MEMORY[0x1F40E5C40]();
}

uint64_t sub_1D3371FC8()
{
  return MEMORY[0x1F40E5C68]();
}

uint64_t sub_1D3371FD8()
{
  return MEMORY[0x1F40E5C98]();
}

uint64_t sub_1D3371FE8()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1D3371FF8()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1D3372008()
{
  return MEMORY[0x1F40E5E90]();
}

uint64_t sub_1D3372018()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1D3372028()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1D3372038()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1D3372048()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1D3372058()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1D3372068()
{
  return MEMORY[0x1F4165750]();
}

uint64_t sub_1D3372078()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1D3372088()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1D3372098()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1D33720A8()
{
  return MEMORY[0x1F4119B48]();
}

uint64_t sub_1D33720B8()
{
  return MEMORY[0x1F4119B50]();
}

uint64_t sub_1D33720C8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D33720D8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D33720E8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D33720F8()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D3372108()
{
  return MEMORY[0x1F4165CA0]();
}

uint64_t sub_1D3372118()
{
  return MEMORY[0x1F4165CB0]();
}

uint64_t sub_1D3372128()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1D3372138()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1D3372148()
{
  return MEMORY[0x1F4166428]();
}

uint64_t sub_1D3372158()
{
  return MEMORY[0x1F4166430]();
}

uint64_t sub_1D3372168()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D3372178()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1D3372188()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D3372198()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D33721A8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1D33721B8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1D33721C8()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1D33721D8()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1D33721E8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D33721F8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D3372208()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D3372218()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1D3372228()
{
  return MEMORY[0x1F41836D0]();
}

uint64_t sub_1D3372238()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D3372248()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D3372258()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D3372268()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1D3372278()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1D3372288()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D3372298()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D33722A8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D33722B8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1D33722C8()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1D33722D8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D33722E8()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1D33722F8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D3372308()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1D3372328()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D3372338()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D3372348()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D3372358()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1D3372368()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D3372378()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D3372388()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D3372398()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D33723A8()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1D33723C8()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1D33723D8()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1D33723E8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D33723F8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D3372408()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1D3372418()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1D3372428()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t sub_1D3372438()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1D3372448()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1D3372458()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1D3372468()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D3372478()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D3372488()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D3372498()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1D33724A8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1D33724B8()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1D33724C8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1D33724D8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1D33724E8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1D33724F8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D3372508()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D3372518()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1D3372528()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D3372538()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1D3372548()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1D3372558()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1D3372568()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D3372578()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1D3372588()
{
  return MEMORY[0x1F41665E0]();
}

uint64_t sub_1D3372598()
{
  return MEMORY[0x1F4166728]();
}

uint64_t sub_1D33725A8()
{
  return MEMORY[0x1F4166740]();
}

uint64_t sub_1D33725B8()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1D33725C8()
{
  return MEMORY[0x1F4166790]();
}

uint64_t sub_1D33725D8()
{
  return MEMORY[0x1F4166798]();
}

uint64_t sub_1D33725E8()
{
  return MEMORY[0x1F41667A0]();
}

uint64_t sub_1D33725F8()
{
  return MEMORY[0x1F41667A8]();
}

uint64_t sub_1D3372608()
{
  return MEMORY[0x1F41667B0]();
}

uint64_t sub_1D3372618()
{
  return MEMORY[0x1F41667B8]();
}

uint64_t sub_1D3372628()
{
  return MEMORY[0x1F41667C0]();
}

uint64_t sub_1D3372638()
{
  return MEMORY[0x1F41667D8]();
}

uint64_t sub_1D3372648()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1D3372658()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D3372668()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D3372678()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1D3372688()
{
  return MEMORY[0x1F4166850]();
}

uint64_t sub_1D3372698()
{
  return MEMORY[0x1F4166860]();
}

uint64_t sub_1D33726A8()
{
  return MEMORY[0x1F4166878]();
}

uint64_t sub_1D33726B8()
{
  return MEMORY[0x1F4166888]();
}

uint64_t sub_1D33726C8()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1D33726D8()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1D33726E8()
{
  return MEMORY[0x1F41668B8]();
}

uint64_t sub_1D33726F8()
{
  return MEMORY[0x1F41668D8]();
}

uint64_t sub_1D3372708()
{
  return MEMORY[0x1F41668E0]();
}

uint64_t sub_1D3372718()
{
  return MEMORY[0x1F41668F0]();
}

uint64_t sub_1D3372728()
{
  return MEMORY[0x1F41668F8]();
}

uint64_t sub_1D3372738()
{
  return MEMORY[0x1F4166900]();
}

uint64_t sub_1D3372748()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1D3372758()
{
  return MEMORY[0x1F4166930]();
}

uint64_t sub_1D3372768()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1D3372778()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1D3372788()
{
  return MEMORY[0x1F4166988]();
}

uint64_t sub_1D3372798()
{
  return MEMORY[0x1F4166998]();
}

uint64_t sub_1D33727A8()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1D33727B8()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1D33727C8()
{
  return MEMORY[0x1F41669D0]();
}

uint64_t sub_1D33727D8()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1D33727E8()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1D33727F8()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1D3372808()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1D3372818()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1D3372828()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1D3372838()
{
  return MEMORY[0x1F4166A68]();
}

uint64_t sub_1D3372848()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D3372858()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D3372868()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D3372878()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1D3372888()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1D3372898()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D33728B8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D33728C8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D33728D8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D33728E8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D33728F8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D3372908()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D3372918()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D3372928()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1D3372938()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D3372948()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D3372958()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D3372968()
{
  return MEMORY[0x1F4184C88]();
}

uint64_t sub_1D3372978()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D3372988()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D3372998()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D33729A8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D33729B8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D33729C8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D33729D8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1D33729E8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D33729F8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D3372A08()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D3372A18()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D3372A28()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D3372A38()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D3372A48()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D3372A58()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D3372A68()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1D3372A78()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D3372A88()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D3372A98()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1D3372AA8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D3372AB8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1D3372AC8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D3372AD8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D3372AE8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D3372AF8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D3372B18()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D3372B28()
{
  return MEMORY[0x1F41880F0]();
}

uint64_t sub_1D3372B38()
{
  return MEMORY[0x1F41880F8]();
}

uint64_t sub_1D3372B48()
{
  return MEMORY[0x1F4188108]();
}

uint64_t sub_1D3372B58()
{
  return MEMORY[0x1F4188110]();
}

uint64_t sub_1D3372B68()
{
  return MEMORY[0x1F4188118]();
}

uint64_t sub_1D3372B78()
{
  return MEMORY[0x1F4188128]();
}

uint64_t sub_1D3372B88()
{
  return MEMORY[0x1F4188130]();
}

uint64_t sub_1D3372B98()
{
  return MEMORY[0x1F4188140]();
}

uint64_t sub_1D3372BA8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D3372BB8()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1D3372BC8()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1D3372BD8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1D3372BE8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D3372BF8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D3372C08()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1D3372C18()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D3372C28()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D3372C38()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D3372C48()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D3372C58()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1D3372C68()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D3372C78()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D3372C88()
{
  return MEMORY[0x1F4185EF8]();
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x1F4179268](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1F4179270](istream, ostream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1F4179298](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1F41792A8](s);
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179308](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1F4179310](compressed_stream, flags, *(void *)&n_threads);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179318](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179320](dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x1F4179328](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1F4179340](*(void *)&fd, *(void *)&automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x1F4179348](path, *(void *)&open_flags, open_mode);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x1F41793A8](dir, path, msg_data, msg_proc, flags, *(void *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1F410C138]();
}

uint64_t BSCompareIntegers()
{
  return MEMORY[0x1F410C1A8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1F410C2D8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x1F410C330]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1F410C3A0]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1F410C3A8]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1F410C3B0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1F410C428]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1F410C4E0]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1F410C540]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1F410C608]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageBlockSetRetain()
{
  return MEMORY[0x1F40DA858]();
}

void CGImageRelease(CGImageRef image)
{
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x1F4166A80](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromPFServerPosterType()
{
  return MEMORY[0x1F4145C10]();
}

uint64_t NSStringFromPRSPosterSnapshotOptions()
{
  return MEMORY[0x1F4145B88]();
}

uint64_t NSStringFromPRUISSwitcherLayoutMode()
{
  return MEMORY[0x1F4145BE0]();
}

uint64_t NSStringFromPUIRenderingContent()
{
  return MEMORY[0x1F4145CF0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBUIExtensionIdentifierForPosterWallpaperMigrationProvider()
{
  return MEMORY[0x1F4139FD0]();
}

uint64_t PFBundleIdentifierRequiresMemoryHogAssertion()
{
  return MEMORY[0x1F4145C18]();
}

uint64_t PFCurrentDeviceClass()
{
  return MEMORY[0x1F4145C20]();
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x1F4145C28]();
}

uint64_t PFIsPhotosPosterProviderBundleId()
{
  return MEMORY[0x1F4145C30]();
}

uint64_t PFPosterPathURLResourceValues()
{
  return MEMORY[0x1F4145C40]();
}

uint64_t PFPosterRoleEnumerateValidRolesForCurrentDeviceClass()
{
  return MEMORY[0x1F4145C50]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x1F4145C58]();
}

uint64_t PFPosterRoleSupportsDynamicDescriptors()
{
  return MEMORY[0x1F4145C60]();
}

uint64_t PFPosterRolesKnownAmbient()
{
  return MEMORY[0x1F4145C68]();
}

uint64_t PFPosterRolesKnownIncomingCall()
{
  return MEMORY[0x1F4145C70]();
}

uint64_t PFPosterRolesKnownLockScreen()
{
  return MEMORY[0x1F4145C78]();
}

uint64_t PFPosterRolesSupportedForCurrentDeviceClass()
{
  return MEMORY[0x1F4145C80]();
}

uint64_t PFPosterRolesSupportedForDeviceClass()
{
  return MEMORY[0x1F4145C88]();
}

uint64_t PFTemporaryDirectory()
{
  return MEMORY[0x1F4145C90]();
}

uint64_t PRDynamicRotationIsActive()
{
  return MEMORY[0x1F4145C98]();
}

uint64_t PRIsDepthEffectDisallowed()
{
  return MEMORY[0x1F4145CA0]();
}

uint64_t PRIsLowQualityDevice()
{
  return MEMORY[0x1F4145CA8]();
}

uint64_t PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet()
{
  return MEMORY[0x1F4145CB0]();
}

uint64_t PRPosterRoleAttributeForData()
{
  return MEMORY[0x1F4145CB8]();
}

uint64_t PRSLogObserver()
{
  return MEMORY[0x1F4145B90]();
}

uint64_t PRSPosterSnapshotOptionsIsFloatingLayerOnly()
{
  return MEMORY[0x1F4145BA0]();
}

uint64_t PRSWallpaperObserverLocationsDescription()
{
  return MEMORY[0x1F4145BB0]();
}

uint64_t PRSWallpaperObserverLocationsFromIndex()
{
  return MEMORY[0x1F4145BB8]();
}

uint64_t PRSWallpaperObserverLocationsIndexIsValid()
{
  return MEMORY[0x1F4145BC0]();
}

uint64_t PRSWallpaperObserverLocationsLockIndexIfHomeIndex()
{
  return MEMORY[0x1F4145BC8]();
}

uint64_t PRSharedWidgetDescriptorProvider()
{
  return MEMORY[0x1F4145CC0]();
}

uint64_t PRSharedWidgetExtensionProvider()
{
  return MEMORY[0x1F4145CC8]();
}

uint64_t PRSheetCornerRadius()
{
  return MEMORY[0x1F4145CD0]();
}

uint64_t PRTimeFontIdentifiers()
{
  return MEMORY[0x1F4145CD8]();
}

uint64_t PRUISSwitcherLayoutBouncingAnimationSettings()
{
  return MEMORY[0x1F4145BE8]();
}

uint64_t PRUISSwitcherLayoutDeflationAnimationSettings()
{
  return MEMORY[0x1F4145BF0]();
}

uint64_t PRUISSwitcherLayoutTransitionAnimationSettings()
{
  return MEMORY[0x1F4145BF8]();
}

uint64_t PUIFeatureEnabled()
{
  return MEMORY[0x1F4145D08]();
}

uint64_t PUIIOSurfaceIsVolatile()
{
  return MEMORY[0x1F4145D10]();
}

uint64_t PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation()
{
  return MEMORY[0x1F4145D18]();
}

uint64_t PUIPosterSnapshotBundleURLForComponent()
{
  return MEMORY[0x1F4145D40]();
}

uint64_t SBSTopButtonFramesForPosters()
{
  return MEMORY[0x1F415C468]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4166C10]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4166CD8]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4166E28]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1F4166EA8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4166EC0]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1F4178CF0]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LSPersistentIdentifierCompare()
{
  return MEMORY[0x1F40DEEA8]();
}

uint64_t _LSPersistentIdentifierGetDebugDescription()
{
  return MEMORY[0x1F40DEEB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1F40C9CC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1F40C9CC8]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_read_data_into_fd()
{
  return MEMORY[0x1F417E0B0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_gzip()
{
  return MEMORY[0x1F417E170]();
}

uint64_t archive_read_support_format_tar()
{
  return MEMORY[0x1F417E198]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1F417E1E8]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E1F8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1F417E200]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

void exit(int a1)
{
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1F41864F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void sync(void)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}

uint64_t xpc_transaction_try_exit_clean()
{
  return MEMORY[0x1F40CF300]();
}