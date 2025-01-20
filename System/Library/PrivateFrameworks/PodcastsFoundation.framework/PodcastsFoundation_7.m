uint64_t assignWithTake for PodcastIdentifier(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(unsigned char *)(a2 + 16);
  v4 = *(void *)a1;
  v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1ACADC6D8(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for PodcastIdentifier()
{
  return &type metadata for PodcastIdentifier;
}

uint64_t static MTDB.shared.getter()
{
  return sub_1ACE5C2CC();
}

void sub_1ACE5C254(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  swift_beginAccess();
  v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v2;
}

uint64_t sub_1ACE5C2CC()
{
  aBlock[6] = *(id *)MEMORY[0x1E4F143B8];
  v0 = (id *)swift_allocObject();
  v0[2] = 0;
  v1 = v0 + 2;
  id v2 = self;
  aBlock[4] = sub_1ACE5C4AC;
  aBlock[5] = v0;
  aBlock[0] = (id)MEMORY[0x1E4F143A8];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_98;
  v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v2, sel_perform_error_, v3, aBlock);
  _Block_release(v3);
  if (aBlock[0])
  {
    swift_willThrow();
    return swift_release();
  }
  else
  {
    uint64_t result = swift_beginAccess();
    if (*v1)
    {
      id v5 = *v1;
      swift_release();
      return (uint64_t)v5;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1ACE5C474()
{
  return swift_deallocObject();
}

void sub_1ACE5C4AC()
{
  sub_1ACE5C254(v0);
}

void sub_1ACE5C4B4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1ACE74D68();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_1ACE5C518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for FairPlayAsset();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7669F0);
  sub_1ACE64278(&qword_1E99F5790, (void (*)(uint64_t))type metadata accessor for FairPlayAsset);
  id v5 = (void *)sub_1ACE75FC8();
  if (a2) {
    uint64_t v6 = sub_1ACE74D68();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

id FairPlayKeyLoader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id FairPlayKeyLoader.__allocating_init(metadataLoader:fairPlayKeySessionProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1(a2, v6);
  id v9 = sub_1ACE635A4(a1, v8, v2, ObjectType, v6, v7);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v9;
}

id FairPlayKeyLoader.init(metadataLoader:fairPlayKeySessionProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1(a2, v6);
  __n128 v9 = MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v11, v9);
  id v13 = sub_1ACE63258(a1, (uint64_t)v11, v2, ObjectType, v6, v7);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v13;
}

id FairPlayKeyLoader.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  type metadata accessor for FairPlayKeySessionProvider();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  id v3 = sub_1ACE636A0((uint64_t)v1, v2, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t FairPlayKeyLoader.createSession(asset:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1ACE75DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1ACE75E48();
  uint64_t v12 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (void *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = v15;
  v16[5] = a1;
  aBlock[4] = sub_1ACE63A48;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_99;
  v17 = _Block_copy(aBlock);
  sub_1ACA6DEC8(a2);
  swift_retain();
  id v18 = a1;
  sub_1ACE75E08();
  uint64_t v22 = MEMORY[0x1E4FBC860];
  sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_1ACE5CC24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    id v5 = (void (*)(uint64_t, void *))result;
    uint64_t v6 = a3 + 16;
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x1AD11B470](v6);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = (void *)(v7 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
      uint64_t v10 = v9[3];
      uint64_t v11 = v9[4];
      __swift_project_boxed_opaque_existential_1(v9, v10);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 8);
      swift_retain();
      v12(a4, v10, v11);
      uint64_t v15 = swift_unknownObjectRetain();
      v5(v15, 0);
      swift_unknownObjectRelease();

      sub_1ACA76F34((uint64_t)v5);
      return swift_unknownObjectRelease();
    }
    else
    {
      sub_1ACDD1DD4();
      uint64_t v13 = (void *)swift_allocError();
      unsigned char *v14 = 1;
      swift_retain();
      v5(0, v13);

      return sub_1ACA76F34((uint64_t)v5);
    }
  }
  return result;
}

unint64_t sub_1ACE5CFAC()
{
  id v1 = (unint64_t *)(v0 + OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix);
  if (*(void *)(v0 + OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix + 8))
  {
    unint64_t v2 = *v1;
  }
  else
  {
    unint64_t v2 = 0xD000000000000027;
    unint64_t *v1 = 0xD000000000000027;
    v1[1] = 0x80000001ACED5000;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FairPlayKeyLoader.startKeyRequest(session:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1ACE75DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1ACE75E48();
  uint64_t v12 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_1ACE63AA4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_10_7;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1ACA6DEC8(a2);
  sub_1ACE75E08();
  uint64_t v21 = MEMORY[0x1E4FBC860];
  sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return swift_release();
}

void sub_1ACE5D3FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1AD11B470](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_1ACE5D474(a2, a3, a4);
  }
}

uint64_t sub_1ACE5D474(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1ACE75EC8();
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (void *)((char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  void *v11 = v12;
  (*(void (**)(void *, void, uint64_t, __n128))(v8 + 104))(v11, *MEMORY[0x1E4FBCBF0], v7, v9);
  id v13 = v12;
  char v14 = sub_1ACE75EF8();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v11, v7);
  if (v14)
  {
    if (qword_1EB76D5B8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v15 = sub_1ACE754C8();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EB76D598);
  v16 = v3;
  swift_unknownObjectRetain_n();
  v17 = v16;
  id v18 = sub_1ACE75498();
  os_log_type_t v19 = sub_1ACE76BD8();
  int v20 = v19;
  uint64_t v21 = &selRef_generateAndRestorePersonaContextWithPersonaUniqueString_;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v22 = 136315651;
    int v38 = v20;
    unint64_t v23 = sub_1ACE5CFAC();
    uint64_t v40 = sub_1ACA3189C(v23, v24, &v41);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2160;
    uint64_t v40 = 1752392040;
    sub_1ACE76FF8();
    *(_WORD *)(v22 + 22) = 2081;
    v37[1] = v22 + 24;
    id v25 = objc_msgSend(a1, sel_asset);
    uint64_t v26 = FairPlayAsset.description.getter();
    uint64_t v27 = a2;
    uint64_t v28 = a3;
    unint64_t v30 = v29;

    uint64_t v31 = v26;
    uint64_t v21 = &selRef_generateAndRestorePersonaContextWithPersonaUniqueString_;
    uint64_t v40 = sub_1ACA3189C(v31, v30, &v41);
    sub_1ACE76FF8();
    swift_unknownObjectRelease_n();
    a3 = v28;
    a2 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC9D5000, v18, (os_log_type_t)v38, "%s Sending start request for asset: %{private,mask.hash}s", (uint8_t *)v22, 0x20u);
    uint64_t v32 = v39;
    swift_arrayDestroy();
    MEMORY[0x1AD11B340](v32, -1, -1);
    MEMORY[0x1AD11B340](v22, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_1ACE60A54((uint64_t)a1);
  objc_msgSend(a1, sel_register);
  id v33 = [a1 v21[171]];
  uint64_t v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = (void *)swift_allocObject();
  v35[2] = v34;
  v35[3] = a2;
  v35[4] = a3;
  v35[5] = a1;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1ACA6DEC8(a2);
  sub_1ACE6169C(v33, (uint64_t)sub_1ACE63FD0, (uint64_t)v35);

  swift_release();
  return swift_release();
}

void FairPlayKeyLoader.renewKeyRequest(asset:completion:)(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a3;
  uint64_t v7 = sub_1ACE75DC8();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  __n128 v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1ACE75E48();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1ACE74F28();
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)&double v15 = MEMORY[0x1F4188790](v13).n128_u64[0];
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_msgSend(*(id *)&a1[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL, v15);
  sub_1ACE74E98();

  LOBYTE(v18) = sub_1ACE74D98();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if (v18)
  {
    uint64_t v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    int v20 = (void *)swift_allocObject();
    void v20[2] = v19;
    v20[3] = a2;
    v20[4] = v38;
    v20[5] = a1;
    aBlock[4] = (uint64_t)sub_1ACE63AB4;
    aBlock[5] = (uint64_t)v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1ACA6DA9C;
    aBlock[3] = (uint64_t)&block_descriptor_17_8;
    uint64_t v21 = _Block_copy(aBlock);
    swift_retain();
    sub_1ACA6DEC8(a2);
    uint64_t v22 = a1;
    sub_1ACE75E08();
    uint64_t v40 = MEMORY[0x1E4FBC860];
    sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v12, v9, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v36);
    swift_release();
    swift_release();
    return;
  }
  unint64_t v23 = (void (*)(void))a2;
  if (qword_1EB76D5B8 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1ACE754C8();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EB76D598);
  id v25 = v4;
  uint64_t v26 = sub_1ACE75498();
  os_log_type_t v27 = sub_1ACE76BE8();
  if (!os_log_type_enabled(v26, v27))
  {

    if (!a2) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v28 = (uint8_t *)swift_slowAlloc();
  uint64_t v29 = swift_slowAlloc();
  aBlock[0] = v29;
  *(_DWORD *)uint64_t v28 = 136315138;
  unint64_t v30 = sub_1ACE5CFAC();
  uint64_t v40 = sub_1ACA3189C(v30, v31, aBlock);
  sub_1ACE76FF8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1AC9D5000, v26, v27, "%s Unsupported operation, attempting to renew a non-offline asset.", v28, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1AD11B340](v29, -1, -1);
  MEMORY[0x1AD11B340](v28, -1, -1);

  if (v23)
  {
LABEL_9:
    sub_1ACDD1DD4();
    uint64_t v32 = (void *)swift_allocError();
    *id v33 = 6;
    v23();
  }
}

void sub_1ACE5DF04(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1AD11B470](v7);
  if (v8)
  {
    __n128 v9 = (void *)v8;
    uint64_t v10 = (void *)(v8 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
    uint64_t v11 = v10[3];
    uint64_t v12 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v11);
    double v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 8))(a4, v11, v12);
    objc_msgSend(v15, sel_setBypassCache_, 1);
    sub_1ACE5E06C(v15, (uint64_t)a2, a3);
    swift_unknownObjectRelease();
  }
  else if (a2)
  {
    sub_1ACDD1DD4();
    uint64_t v13 = (void *)swift_allocError();
    unsigned char *v14 = 1;
    a2();
  }
}

uint64_t sub_1ACE5E06C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1ACE75EC8();
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (void *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  void *v11 = v12;
  (*(void (**)(void *, void, uint64_t, __n128))(v8 + 104))(v11, *MEMORY[0x1E4FBCBF0], v7, v9);
  id v13 = v12;
  char v14 = sub_1ACE75EF8();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v11, v7);
  if (v14)
  {
    if (qword_1EB76D5B8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v15 = sub_1ACE754C8();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EB76D598);
  uint64_t v16 = v3;
  swift_unknownObjectRetain_n();
  v17 = v16;
  id v18 = sub_1ACE75498();
  os_log_type_t v19 = sub_1ACE76BD8();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v36 = v34;
    *(_DWORD *)uint64_t v21 = 136315651;
    int v33 = v20;
    unint64_t v22 = sub_1ACE5CFAC();
    uint64_t v35 = sub_1ACA3189C(v22, v23, &v36);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2160;
    uint64_t v35 = 1752392040;
    sub_1ACE76FF8();
    *(_WORD *)(v21 + 22) = 2081;
    v32[1] = v21 + 24;
    id v24 = objc_msgSend(a1, sel_asset);
    uint64_t v25 = FairPlayAsset.description.getter();
    uint64_t v26 = a2;
    uint64_t v27 = a3;
    unint64_t v29 = v28;

    uint64_t v35 = sub_1ACA3189C(v25, v29, &v36);
    sub_1ACE76FF8();
    swift_unknownObjectRelease_n();
    a3 = v27;
    a2 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC9D5000, v18, (os_log_type_t)v33, "%s Sending renew request for asset: %{private,mask.hash}s.", (uint8_t *)v21, 0x20u);
    uint64_t v30 = v34;
    swift_arrayDestroy();
    MEMORY[0x1AD11B340](v30, -1, -1);
    MEMORY[0x1AD11B340](v21, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return sub_1ACE5D474(a1, a2, a3);
}

uint64_t FairPlayKeyLoader.renewKeyRequests(assets:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1ACE75DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1ACE75E48();
  uint64_t v12 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  char v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a1;
  aBlock[4] = sub_1ACE63AD8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_24_8;
  v17 = _Block_copy(aBlock);
  swift_retain();
  sub_1ACA6DEC8(a2);
  swift_bridgeObjectRetain();
  sub_1ACE75E08();
  uint64_t v21 = MEMORY[0x1E4FBC860];
  sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_1ACE5E7BC(uint64_t a1, void (*a2)(void, void), uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_1ACE75DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1ACE75E48();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1AD11B470](a1 + 16);
  if (result)
  {
    v17 = (void *)result;
    v65 = v15;
    v66 = a2;
    uint64_t v67 = a3;
    uint64_t v68 = v13;
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1ACE754C8();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB76D598);
    id v19 = v17;
    swift_bridgeObjectRetain_n();
    id v20 = v19;
    uint64_t v21 = sub_1ACE75498();
    int v22 = sub_1ACE76C08();
    BOOL v23 = os_log_type_enabled(v21, (os_log_type_t)v22);
    unint64_t v24 = a4 >> 62;
    uint64_t v72 = v8;
    id v73 = v20;
    uint64_t v70 = v12;
    uint64_t v71 = v9;
    v69 = v11;
    if (!v23)
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_24;
    }
    int v64 = v22;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)uint64_t v25 = 136315651;
    unint64_t v26 = sub_1ACE5CFAC();
    uint64_t v74 = sub_1ACA3189C(v26, v27, aBlock);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2160;
    uint64_t v74 = 1752392040;
    sub_1ACE76FF8();
    *(_WORD *)(v25 + 22) = 2081;
    if (v24) {
      goto LABEL_36;
    }
    uint64_t v28 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      uint64_t v29 = MEMORY[0x1E4FBC860];
      if (v28)
      {
        uint64_t v74 = MEMORY[0x1E4FBC860];
        uint64_t result = sub_1ACC82E60(0, v28 & ~(v28 >> 63), 0);
        if (v28 < 0)
        {
          __break(1u);
          return result;
        }
        uint64_t v62 = v9;
        unint64_t v63 = v24;
        uint64_t v29 = v74;
        if ((a4 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            uint64_t v31 = *(void *)(MEMORY[0x1AD119490](i, a4) + OBJC_IVAR___PFFairPlayAsset_adamID);
            swift_unknownObjectRelease();
            uint64_t v74 = v29;
            unint64_t v33 = *(void *)(v29 + 16);
            unint64_t v32 = *(void *)(v29 + 24);
            if (v33 >= v32 >> 1)
            {
              sub_1ACC82E60(v32 > 1, v33 + 1, 1);
              uint64_t v29 = v74;
            }
            *(void *)(v29 + 16) = v33 + 1;
            *(void *)(v29 + 8 * v33 + 32) = v31;
          }
        }
        else
        {
          uint64_t v37 = (void *)(a4 + 32);
          unint64_t v38 = *(void *)(v74 + 16);
          do
          {
            uint64_t v39 = *(void *)(*v37 + OBJC_IVAR___PFFairPlayAsset_adamID);
            uint64_t v74 = v29;
            unint64_t v40 = *(void *)(v29 + 24);
            if (v38 >= v40 >> 1)
            {
              sub_1ACC82E60(v40 > 1, v38 + 1, 1);
              uint64_t v29 = v74;
            }
            *(void *)(v29 + 16) = v38 + 1;
            *(void *)(v29 + 8 * v38 + 32) = v39;
            ++v37;
            ++v38;
            --v28;
          }
          while (v28);
        }
        unint64_t v24 = v63;
        uint64_t v9 = v62;
      }
      uint64_t v41 = MEMORY[0x1AD118740](v29, MEMORY[0x1E4FBC1C8]);
      unint64_t v43 = v42;
      swift_bridgeObjectRelease();
      uint64_t v74 = sub_1ACA3189C(v41, v43, aBlock);
      sub_1ACE76FF8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AC9D5000, v21, (os_log_type_t)v64, "%s Beginning renewals for adamIDs: %{private,mask.hash}s", (uint8_t *)v25, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v9, -1, -1);
      MEMORY[0x1AD11B340](v25, -1, -1);

LABEL_24:
      uint64_t v25 = (uint64_t)dispatch_group_create();
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = sub_1ACA36DE4(MEMORY[0x1E4FBC860]);
      if (v24)
      {
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_1ACE77508();
        if (!v45) {
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v45 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v45) {
          goto LABEL_33;
        }
      }
      if (v45 >= 1)
      {
        uint64_t v46 = 0;
        do
        {
          if ((a4 & 0xC000000000000001) != 0) {
            id v47 = (id)MEMORY[0x1AD119490](v46, a4);
          }
          else {
            id v47 = *(id *)(a4 + 8 * v46 + 32);
          }
          v48 = v47;
          ++v46;
          dispatch_group_enter((dispatch_group_t)v25);
          v49 = (void *)swift_allocObject();
          v49[2] = v44;
          v49[3] = v48;
          v49[4] = v25;
          swift_retain();
          v50 = v48;
          id v51 = (id)v25;
          FairPlayKeyLoader.renewKeyRequest(asset:completion:)(v50, (uint64_t)sub_1ACE63F28, (uint64_t)v49);

          swift_release();
        }
        while (v45 != v46);
LABEL_33:
        swift_bridgeObjectRelease();
        v52 = v73;
        v53 = (void *)swift_allocObject();
        v53[2] = v52;
        v53[3] = v44;
        uint64_t v55 = (uint64_t)v66;
        uint64_t v54 = v67;
        v53[4] = v66;
        v53[5] = v54;
        aBlock[4] = (uint64_t)sub_1ACE63F4C;
        aBlock[5] = (uint64_t)v53;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1ACA6DA9C;
        aBlock[3] = (uint64_t)&block_descriptor_85_2;
        v56 = _Block_copy(aBlock);
        id v57 = v52;
        swift_retain();
        sub_1ACA6DEC8(v55);
        v58 = v65;
        sub_1ACE75E08();
        uint64_t v74 = MEMORY[0x1E4FBC860];
        sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
        sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
        v59 = v69;
        uint64_t v60 = v72;
        sub_1ACE770E8();
        sub_1ACE76C68();
        _Block_release(v56);

        (*(void (**)(char *, uint64_t))(v71 + 8))(v59, v60);
        (*(void (**)(char *, uint64_t))(v68 + 8))(v58, v70);

        swift_release();
        return swift_release();
      }
      __break(1u);
LABEL_36:
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_1ACE77508();
      swift_bridgeObjectRelease();
    }
  }
  if (a2)
  {
    unint64_t v34 = sub_1ACA36DE4(MEMORY[0x1E4FBC860]);
    sub_1ACDD1DD4();
    uint64_t v35 = (void *)swift_allocError();
    *uint64_t v36 = 1;
    a2(v34, v35);

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1ACE5F008(void *a1, uint64_t a2, void *a3, dispatch_group_t group)
{
  if (a1)
  {
    swift_beginAccess();
    id v8 = a1;
    id v9 = a1;
    id v10 = a3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0x8000000000000000;
    sub_1ACD0F3B0((uint64_t)a1, v10, isUniquelyReferenced_nonNull_native);
    *(void *)(a2 + 16) = v12;

    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  dispatch_group_leave(group);
}

void sub_1ACE5F0D8(void *a1, uint64_t a2, void (*a3)(void, void))
{
  if (qword_1EB76D5B8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1ACE754C8();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB76D598);
  id v6 = a1;
  swift_retain_n();
  id v7 = v6;
  id v8 = sub_1ACE75498();
  os_log_type_t v9 = sub_1ACE76C08();
  if (!os_log_type_enabled(v8, v9))
  {

    swift_release_n();
    if (!a3) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v10 = swift_slowAlloc();
  uint64_t v11 = swift_slowAlloc();
  v21[0] = v11;
  *(_DWORD *)uint64_t v10 = 136315651;
  id v20 = a3;
  unint64_t v12 = sub_1ACE5CFAC();
  sub_1ACA3189C(v12, v13, v21);
  sub_1ACE76FF8();

  swift_bridgeObjectRelease();
  *(_WORD *)(v10 + 12) = 2160;
  sub_1ACE76FF8();
  *(_WORD *)(v10 + 22) = 2081;
  swift_beginAccess();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_1ACB1F5B4(v14);
  swift_bridgeObjectRelease();
  uint64_t v16 = MEMORY[0x1AD118740](v15, MEMORY[0x1E4FBC1C8]);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  sub_1ACA3189C(v16, v18, v21);
  sub_1ACE76FF8();
  swift_release_n();
  a3 = v20;
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1AC9D5000, v8, v9, "%s Completed renewals with errors for adamIDs: %{private,mask.hash}s", (uint8_t *)v10, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x1AD11B340](v11, -1, -1);
  MEMORY[0x1AD11B340](v10, -1, -1);

  if (v20)
  {
LABEL_7:
    swift_beginAccess();
    uint64_t v19 = swift_bridgeObjectRetain();
    a3(v19, 0);
    swift_bridgeObjectRelease();
  }
}

id FairPlayKeyLoader.renewKey(session:)(void *a1)
{
  if (qword_1EB76D5B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1ACE754C8();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EB76D598);
  id v4 = v1;
  swift_unknownObjectRetain_n();
  id v5 = v4;
  id v6 = sub_1ACE75498();
  os_log_type_t v7 = sub_1ACE76C08();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v9;
    *(_DWORD *)uint64_t v8 = 136315651;
    unint64_t v10 = sub_1ACE5CFAC();
    sub_1ACA3189C(v10, v11, &v16);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2160;
    sub_1ACE76FF8();
    *(_WORD *)(v8 + 22) = 2081;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6CC0);
    uint64_t v12 = sub_1ACE76228();
    uint64_t v15 = sub_1ACA3189C(v12, v13, &v16);
    sub_1ACE76FF8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC9D5000, v6, v7, "%s Renewing keys for session: %{private,mask.hash}s.", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AD11B340](v9, -1, -1);
    MEMORY[0x1AD11B340](v8, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return objc_msgSend(a1, sel_renewKey, v15, v16);
}

void FairPlayKeyLoader.stopKeyRequest(asset:completion:)(char *a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v38 = a3;
  uint64_t v7 = sub_1ACE75DC8();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1ACE75E48();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1ACE74F28();
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)&double v15 = MEMORY[0x1F4188790](v13).n128_u64[0];
  unint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_msgSend(*(id *)&a1[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL, v15);
  sub_1ACE74E98();

  LOBYTE(v18) = sub_1ACE74D98();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) == 0)
  {
    uint64_t v28 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = v28;
    v29[3] = a2;
    v29[4] = v38;
    v29[5] = a1;
    aBlock[4] = (uint64_t)sub_1ACE63B38;
    aBlock[5] = (uint64_t)v29;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1ACA6DA9C;
    aBlock[3] = (uint64_t)&block_descriptor_31_2;
    uint64_t v30 = _Block_copy(aBlock);
    swift_retain();
    sub_1ACA6DEC8(a2);
    uint64_t v31 = a1;
    sub_1ACE75E08();
    uint64_t v39 = MEMORY[0x1E4FBC860];
    sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v12, v9, v30);
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v36);
    swift_release();
    swift_release();
    return;
  }
  uint64_t v19 = (void (*)(void))a2;
  if (qword_1EB76D5B8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1ACE754C8();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EB76D598);
  id v21 = v4;
  int v22 = sub_1ACE75498();
  os_log_type_t v23 = sub_1ACE76BE8();
  if (!os_log_type_enabled(v22, v23))
  {

    if (!a2) {
      return;
    }
    goto LABEL_9;
  }
  unint64_t v24 = (uint8_t *)swift_slowAlloc();
  uint64_t v25 = swift_slowAlloc();
  aBlock[0] = v25;
  *(_DWORD *)unint64_t v24 = 136315138;
  unint64_t v26 = sub_1ACE5CFAC();
  uint64_t v39 = sub_1ACA3189C(v26, v27, aBlock);
  sub_1ACE76FF8();

  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  MEMORY[0x1AD11B340](v25, -1, -1);
  MEMORY[0x1AD11B340](v24, -1, -1);

  if (v19)
  {
LABEL_9:
    sub_1ACDD1DD4();
    unint64_t v32 = (void *)swift_allocError();
    *unint64_t v33 = 6;
    v19();
  }
}

void sub_1ACE5FCE8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1AD11B470](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = (void *)(v8 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
    uint64_t v11 = v10[3];
    uint64_t v12 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v11);
    uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 8))(a4, v11, v12);
    sub_1ACE5FE3C(v13, (uint64_t)a2, a3);
    swift_unknownObjectRelease();
  }
  else if (a2)
  {
    sub_1ACDD1DD4();
    uint64_t v14 = (void *)swift_allocError();
    *double v15 = 1;
    a2();
  }
}

void sub_1ACE5FE3C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1ACE75EC8();
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  void *v11 = v12;
  (*(void (**)(void *, void, uint64_t, __n128))(v8 + 104))(v11, *MEMORY[0x1E4FBCBF0], v7, v9);
  id v13 = v12;
  char v14 = sub_1ACE75EF8();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v11, v7);
  if (v14)
  {
    if (qword_1EB76D5B8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v15 = sub_1ACE754C8();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EB76D598);
  uint64_t v16 = v3;
  swift_unknownObjectRetain_n();
  unint64_t v17 = v16;
  id v18 = sub_1ACE75498();
  os_log_type_t v19 = sub_1ACE76BD8();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)uint64_t v21 = 136315651;
    unint64_t v22 = sub_1ACE5CFAC();
    uint64_t v39 = sub_1ACA3189C(v22, v23, aBlock);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2160;
    uint64_t v39 = 1752392040;
    sub_1ACE76FF8();
    *(_WORD *)(v21 + 22) = 2081;
    uint64_t v37 = v21 + 24;
    id v24 = objc_msgSend(a1, sel_asset);
    uint64_t v25 = a2;
    uint64_t v26 = a3;
    unint64_t v27 = a1;
    uint64_t v28 = FairPlayAsset.description.getter();
    HIDWORD(v36) = v20;
    unint64_t v30 = v29;

    uint64_t v31 = v28;
    a1 = v27;
    a3 = v26;
    a2 = v25;
    uint64_t v39 = sub_1ACA3189C(v31, v30, aBlock);
    sub_1ACE76FF8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC9D5000, v18, BYTE4(v36), "%s Sending stop request for asset: %{private,mask.hash}s.", (uint8_t *)v21, 0x20u);
    uint64_t v32 = v38;
    swift_arrayDestroy();
    MEMORY[0x1AD11B340](v32, -1, -1);
    MEMORY[0x1AD11B340](v21, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  unint64_t v33 = (void *)swift_allocObject();
  v33[2] = v17;
  v33[3] = a2;
  v33[4] = a3;
  aBlock[4] = (uint64_t)sub_1ACE63E9C;
  aBlock[5] = (uint64_t)v33;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1ACCB9FCC;
  aBlock[3] = (uint64_t)&block_descriptor_73_4;
  uint64_t v34 = _Block_copy(aBlock);
  uint64_t v35 = v17;
  sub_1ACA6DEC8(a2);
  swift_release();
  objc_msgSend(a1, sel_stopAndInvalidateKeysWithCompletion_, v34);
  _Block_release(v34);
}

void FairPlayKeyLoader.stopKeyRequest(session:completion:)(void *a1, void (*a2)(void), uint64_t a3)
{
  id v4 = v3;
  uint64_t v38 = a3;
  uint64_t v39 = a2;
  uint64_t v6 = sub_1ACE75DC8();
  uint64_t v37 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1ACE75E48();
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v36 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1ACE74F28();
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)&double v14 = MEMORY[0x1F4188790](v12).n128_u64[0];
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = (char *)objc_msgSend(a1, sel_asset, v14);
  id v18 = objc_msgSend(*(id *)&v17[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL);
  sub_1ACE74E98();

  LOBYTE(v18) = sub_1ACE74D98();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);

  if (v18)
  {
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1ACE754C8();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EB76D598);
    id v20 = v4;
    uint64_t v21 = sub_1ACE75498();
    os_log_type_t v22 = sub_1ACE76BE8();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)unint64_t v23 = 136315138;
      unint64_t v25 = sub_1ACE5CFAC();
      uint64_t v40 = sub_1ACA3189C(v25, v26, aBlock);
      sub_1ACE76FF8();

      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v24, -1, -1);
      MEMORY[0x1AD11B340](v23, -1, -1);
    }
    else
    {
    }
    uint64_t v32 = v39;
    if (v39)
    {
      sub_1ACDD1DD4();
      unint64_t v33 = (void *)swift_allocError();
      *uint64_t v34 = 6;
      v32();
    }
  }
  else
  {
    uint64_t v27 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = v38;
    uint64_t v30 = (uint64_t)v39;
    v28[2] = v27;
    v28[3] = v30;
    v28[4] = v29;
    v28[5] = a1;
    aBlock[4] = (uint64_t)sub_1ACE63B5C;
    aBlock[5] = (uint64_t)v28;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1ACA6DA9C;
    aBlock[3] = (uint64_t)&block_descriptor_38_5;
    uint64_t v31 = _Block_copy(aBlock);
    swift_retain();
    sub_1ACA6DEC8(v30);
    swift_unknownObjectRetain();
    sub_1ACE75E08();
    uint64_t v40 = MEMORY[0x1E4FBC860];
    sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v11, v8, v31);
    _Block_release(v31);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
    swift_release();
    swift_release();
  }
}

void sub_1ACE608D0(uint64_t a1, void (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1AD11B470](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_1ACE5FE3C(a4, (uint64_t)a2, a3);
  }
  else if (a2)
  {
    sub_1ACDD1DD4();
    uint64_t v10 = (void *)swift_allocError();
    unsigned char *v11 = 1;
    a2();
  }
}

uint64_t sub_1ACE60A54(uint64_t a1)
{
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1ACE75E48();
  uint64_t v6 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = sub_1ACE627F0();
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  aBlock[4] = sub_1ACE64300;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_136;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1ACE75E08();
  uint64_t v17 = MEMORY[0x1E4FBC860];
  sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  uint64_t v12 = v15;
  MEMORY[0x1AD118ED0](0, v8, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v16);
  swift_release();
  return swift_release();
}

void sub_1ACE60D3C(void *a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(void), uint64_t a6, void *a7)
{
  uint64_t v14 = sub_1ACE75EC8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (void *)((char *)&aBlock[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x1AD11B470](a4 + 16);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v34 = a6;
    id v20 = *(void **)(v18 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
    void *v17 = v20;
    (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E4FBCBF0], v14);
    id v21 = v20;
    LOBYTE(v20) = sub_1ACE75EF8();
    (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
    if (v20)
    {
      if (a3)
      {
        swift_retain();
        sub_1ACE640E8(a1, a2, 1);
        id v29 = [a7 id];
        uint64_t v30 = sub_1ACE761B8();
        uint64_t v32 = v31;

        sub_1ACE6142C(v30, v32);
        swift_release();
        swift_bridgeObjectRelease();
        if (a5)
        {
          id v33 = a1;
          ((void (*)(void *))a5)(a1);
          sub_1ACE640F8(a1, a2, 1);

          sub_1ACE640F8(a1, a2, 1);
        }
        else
        {
          sub_1ACE640F8(a1, a2, 1);
        }
      }
      else
      {
        os_log_type_t v22 = (void *)sub_1ACE76178();
        unint64_t v23 = (void *)swift_allocObject();
        v23[2] = v19;
        v23[3] = a7;
        uint64_t v24 = v34;
        v23[4] = a5;
        v23[5] = v24;
        aBlock[4] = sub_1ACE64180;
        aBlock[5] = v23;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1ACCB9FCC;
        aBlock[3] = &block_descriptor_114;
        unint64_t v25 = _Block_copy(aBlock);
        id v26 = v19;
        swift_unknownObjectRetain();
        sub_1ACA6DEC8((uint64_t)a5);
        swift_release();
        objc_msgSend(a7, sel_processKeyWith_completion_, v22, v25);

        _Block_release(v25);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else if (a5)
  {
    sub_1ACDD1DD4();
    uint64_t v27 = (void *)swift_allocError();
    *uint64_t v28 = 1;
    a5();
  }
}

uint64_t sub_1ACE610A0(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1ACE75DC8();
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1ACE75E48();
  uint64_t v13 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)&a2[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = a1;
  aBlock[4] = sub_1ACE641E4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_120;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = a2;
  swift_unknownObjectRetain();
  sub_1ACA6DEC8(a4);
  id v19 = a1;
  sub_1ACE75E08();
  uint64_t v24 = MEMORY[0x1E4FBC860];
  sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v22);
  return swift_release();
}

uint64_t sub_1ACE61388(int a1, id a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  id v7 = [a2 id];
  uint64_t v8 = sub_1ACE761B8();
  uint64_t v10 = v9;

  sub_1ACE6142C(v8, v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (a3) {
    return a3(a5);
  }
  return result;
}

uint64_t sub_1ACE6142C(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = sub_1ACE75E48();
  uint64_t v4 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1ACE75DC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = sub_1ACE627F0();
  sub_1ACE75DB8();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_1ACE6426C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_129_0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1ACE75E08();
  MEMORY[0x1AD118ED0](0, v6, v10, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  return swift_release();
}

void sub_1ACE6169C(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EB76D5B8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1ACE754C8();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB76D598);
  id v8 = v3;
  id v9 = a1;
  uint64_t v10 = (char *)v8;
  id v11 = (char *)v9;
  uint64_t v12 = sub_1ACE75498();
  os_log_type_t v13 = sub_1ACE76BD8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v27 = a2;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315651;
    unint64_t v16 = sub_1ACE5CFAC();
    sub_1ACA3189C(v16, v17, aBlock);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2160;
    sub_1ACE76FF8();
    *(_WORD *)(v14 + 22) = 2081;
    uint64_t v18 = FairPlayAsset.description.getter();
    sub_1ACA3189C(v18, v19, aBlock);
    sub_1ACE76FF8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC9D5000, v12, v13, "%s Fetching key identifier for: %{private,mask.hash}s.", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AD11B340](v15, -1, -1);
    uint64_t v20 = v14;
    a2 = v27;
    MEMORY[0x1AD11B340](v20, -1, -1);
  }
  else
  {
  }
  uint64_t v21 = *(void **)&v10[OBJC_IVAR___PFFairPlayKeyLoader_metadataLoader];
  uint64_t v22 = *(void *)&v11[OBJC_IVAR___PFFairPlayAsset_avAsset];
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v23;
  v24[3] = a2;
  v24[4] = a3;
  v24[5] = v11;
  aBlock[4] = (uint64_t)sub_1ACE64028;
  aBlock[5] = (uint64_t)v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1ACC3C930;
  aBlock[3] = (uint64_t)&block_descriptor_96;
  unint64_t v25 = _Block_copy(aBlock);
  id v26 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v21, sel_keyIdentifiersFrom_completion_, v22, v25);
  _Block_release(v25);
}

void sub_1ACE619D8(id a1, void *a2, void (*a3)(id))
{
  if (a1)
  {
    id v6 = a1;
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1ACE754C8();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EB76D598);
    id v8 = a2;
    id v9 = a1;
    id v10 = v8;
    id v11 = a1;
    uint64_t v12 = sub_1ACE75498();
    os_log_type_t v13 = sub_1ACE76BE8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v16 = sub_1ACE5CFAC();
      sub_1ACA3189C(v16, v17, &v28);
      sub_1ACE76FF8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v18 = sub_1ACE77A98();
      sub_1ACA3189C(v18, v19, &v28);
      sub_1ACE76FF8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1AC9D5000, v12, v13, "%s Failed to stop and/or invalidate with error: %s.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v15, -1, -1);
      MEMORY[0x1AD11B340](v14, -1, -1);

      if (!a3) {
        return;
      }
    }
    else
    {

      if (!a3) {
        return;
      }
    }
  }
  else
  {
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1ACE754C8();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB76D598);
    id v21 = a2;
    uint64_t v22 = sub_1ACE75498();
    os_log_type_t v23 = sub_1ACE76C08();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v28 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      unint64_t v26 = sub_1ACE5CFAC();
      sub_1ACA3189C(v26, v27, &v28);
      sub_1ACE76FF8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AC9D5000, v22, v23, "%s Session stopped successfully.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v25, -1, -1);
      MEMORY[0x1AD11B340](v24, -1, -1);

      if (!a3) {
        return;
      }
    }
    else
    {

      if (!a3) {
        return;
      }
    }
  }
  a3(a1);
}

void sub_1ACE61DD8(void *a1, uint64_t a2, void (*a3)(void *, void, uint64_t), uint64_t a4, void *a5)
{
  uint64_t v10 = sub_1ACE75DC8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  os_log_type_t v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1ACE75E48();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v71 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v17 = MEMORY[0x1AD11B470](a2 + 16);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v69 = v14;
    uint64_t v70 = v11;
    uint64_t v67 = v13;
    uint64_t v68 = v15;
    uint64_t v66 = a4;
    if (a1 && a1[2])
    {
      uint64_t v19 = a1[4];
      uint64_t v63 = a1[5];
      uint64_t v64 = v19;
      uint64_t v20 = qword_1EB76D5B8;
      swift_bridgeObjectRetain();
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v65 = v10;
      uint64_t v21 = sub_1ACE754C8();
      __swift_project_value_buffer(v21, (uint64_t)qword_1EB76D598);
      id v22 = v18;
      id v23 = a5;
      id v24 = v22;
      id v25 = v23;
      unint64_t v26 = sub_1ACE75498();
      os_log_type_t v27 = sub_1ACE76BD8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t aBlock = v29;
        *(_DWORD *)uint64_t v28 = 136315651;
        unint64_t v30 = sub_1ACE5CFAC();
        uint64_t v72 = sub_1ACA3189C(v30, v31, &aBlock);
        sub_1ACE76FF8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2160;
        uint64_t v72 = 1752392040;
        sub_1ACE76FF8();
        *(_WORD *)(v28 + 22) = 2081;
        uint64_t v32 = FairPlayAsset.description.getter();
        uint64_t v72 = sub_1ACA3189C(v32, v33, &aBlock);
        sub_1ACE76FF8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AC9D5000, v26, v27, "%s Loaded key identifier for: %{private,mask.hash}s.", (uint8_t *)v28, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1AD11B340](v29, -1, -1);
        MEMORY[0x1AD11B340](v28, -1, -1);
      }
      else
      {
      }
      v56 = (void *)swift_allocObject();
      uint64_t v57 = v66;
      v56[2] = a3;
      v56[3] = v57;
      uint64_t v58 = v63;
      v56[4] = v64;
      v56[5] = v58;
      v77 = sub_1ACE640B4;
      v78 = v56;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v74 = 1107296256;
      v75 = sub_1ACA6DA9C;
      v76 = &block_descriptor_108;
      v59 = _Block_copy(&aBlock);
      swift_retain();
      uint64_t v60 = v71;
      sub_1ACE75E08();
      uint64_t v72 = MEMORY[0x1E4FBC860];
      sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
      sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
      uint64_t v61 = v67;
      uint64_t v62 = v65;
      sub_1ACE770E8();
      MEMORY[0x1AD118ED0](0, v60, v61, v59);
      _Block_release(v59);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v60, v69);
    }
    else
    {
      if (qword_1EB76D5B8 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_1ACE754C8();
      __swift_project_value_buffer(v34, (uint64_t)qword_1EB76D598);
      id v35 = v18;
      id v36 = a5;
      id v37 = v35;
      id v38 = v36;
      uint64_t v39 = sub_1ACE75498();
      os_log_type_t v40 = sub_1ACE76BD8();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = swift_slowAlloc();
        uint64_t v65 = v10;
        uint64_t v42 = v41;
        uint64_t v43 = swift_slowAlloc();
        uint64_t aBlock = v43;
        *(_DWORD *)uint64_t v42 = 136315651;
        unint64_t v44 = sub_1ACE5CFAC();
        uint64_t v72 = sub_1ACA3189C(v44, v45, &aBlock);
        sub_1ACE76FF8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v42 + 12) = 2160;
        uint64_t v72 = 1752392040;
        sub_1ACE76FF8();
        *(_WORD *)(v42 + 22) = 2081;
        uint64_t v46 = FairPlayAsset.description.getter();
        uint64_t v72 = sub_1ACA3189C(v46, v47, &aBlock);
        sub_1ACE76FF8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AC9D5000, v39, v40, "%s Missing key identifier for: %{private,mask.hash}s.", (uint8_t *)v42, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1AD11B340](v43, -1, -1);
        uint64_t v48 = v42;
        uint64_t v10 = v65;
        MEMORY[0x1AD11B340](v48, -1, -1);
      }
      else
      {
      }
      uint64_t v51 = swift_allocObject();
      uint64_t v52 = v66;
      *(void *)(v51 + 16) = a3;
      *(void *)(v51 + 24) = v52;
      v77 = sub_1ACE6406C;
      v78 = (void *)v51;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v74 = 1107296256;
      v75 = sub_1ACA6DA9C;
      v76 = &block_descriptor_102;
      v53 = _Block_copy(&aBlock);
      swift_retain();
      uint64_t v54 = v71;
      sub_1ACE75E08();
      uint64_t v72 = MEMORY[0x1E4FBC860];
      sub_1ACE64278((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
      sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
      uint64_t v55 = v67;
      sub_1ACE770E8();
      MEMORY[0x1AD118ED0](0, v54, v55, v53);
      _Block_release(v53);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v55, v10);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v54, v69);
    }
    swift_release();
  }
  else
  {
    sub_1ACDD1DD4();
    v49 = (void *)swift_allocError();
    unsigned char *v50 = 1;
    a3(v49, 0, 1);
  }
}

void sub_1ACE626C0(void (*a1)(void *, void, uint64_t))
{
  sub_1ACDD1DD4();
  uint64_t v2 = (void *)swift_allocError();
  unsigned char *v3 = 3;
  a1(v2, 0, 1);
}

id FairPlayKeyLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1ACE627F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1ACE76CE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1ACE76C78();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1ACE75E48();
  MEMORY[0x1F4188790](v7 - 8);
  id v8 = *(void **)(v0 + 40);
  if (v8)
  {
    id v9 = *(id *)(v0 + 40);
  }
  else
  {
    v14[0] = sub_1ACA51E1C();
    sub_1ACE75E18();
    v14[1] = MEMORY[0x1E4FBC860];
    sub_1ACE64278((unint64_t *)&qword_1EB773180, MEMORY[0x1E4FBCC10]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773160);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773170, (uint64_t *)&unk_1EB773160);
    sub_1ACE770E8();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC58], v2);
    uint64_t v10 = (void *)sub_1ACE76D28();
    uint64_t v11 = *(void **)(v0 + 40);
    *(void *)(v1 + 40) = v10;
    id v9 = v10;

    id v8 = 0;
  }
  id v12 = v8;
  return v9;
}

uint64_t sub_1ACE62A5C(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1ACE754C8();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EB76D598);
    swift_unknownObjectRetain_n();
    swift_retain_n();
    uint64_t v6 = sub_1ACE75498();
    os_log_type_t v7 = sub_1ACE76BD8();
    id v8 = &selRef_generateAndRestorePersonaContextWithPersonaUniqueString_;
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v28[0] = v25;
      *(_DWORD *)uint64_t v9 = 136315907;
      unint64_t v10 = sub_1ACE62E00();
      sub_1ACA3189C(v10, v11, v28);
      sub_1ACE76FF8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      id v12 = [a2 id];
      uint64_t v13 = sub_1ACE761B8();
      unint64_t v15 = v14;

      sub_1ACA3189C(v13, v15, v28);
      sub_1ACE76FF8();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 22) = 2160;
      sub_1ACE76FF8();
      *(_WORD *)(v9 + 32) = 2081;
      id v16 = objc_msgSend(a2, sel_asset);
      uint64_t v17 = FairPlayAsset.description.getter();
      unint64_t v19 = v18;

      uint64_t v26 = sub_1ACA3189C(v17, v19, v28);
      id v8 = &selRef_generateAndRestorePersonaContextWithPersonaUniqueString_;
      sub_1ACE76FF8();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AC9D5000, v6, v7, "%s Adding session with id: %s, asset: %{private,mask.hash}s", (uint8_t *)v9, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v25, -1, -1);
      MEMORY[0x1AD11B340](v9, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_release_n();
    }
    id v20 = objc_msgSend(a2, v8[126], v25, v26, v28[0]);
    uint64_t v21 = sub_1ACE761B8();
    uint64_t v23 = v22;

    swift_beginAccess();
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *(void *)(v4 + 16);
    *(void *)(v4 + 16) = 0x8000000000000000;
    sub_1ACD0F514((uint64_t)a2, v21, v23, isUniquelyReferenced_nonNull_native);
    *(void *)(v4 + 16) = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

unint64_t sub_1ACE62E00()
{
  if (*(void *)(v0 + 32))
  {
    unint64_t v1 = *(void *)(v0 + 24);
  }
  else
  {
    unint64_t v1 = 0xD000000000000028;
    *(void *)(v0 + 24) = 0xD000000000000028;
    *(void *)(v0 + 32) = 0x80000001ACED4FD0;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1ACE62E6C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_1EB76D5B8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1ACE754C8();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EB76D598);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    os_log_type_t v7 = sub_1ACE75498();
    os_log_type_t v8 = sub_1ACE76BD8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v13[0] = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      unint64_t v11 = sub_1ACE62E00();
      sub_1ACA3189C(v11, v12, v13);
      sub_1ACE76FF8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1ACA3189C(a2, a3, v13);
      sub_1ACE76FF8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AC9D5000, v7, v8, "%s Removing session with id: %s.", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v10, -1, -1);
      MEMORY[0x1AD11B340](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    swift_beginAccess();
    sub_1ACA69AEC(a2, a3);
    swift_endAccess();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1ACE630E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

PodcastsFoundation::FairPlayKeyLoadError_optional __swiftcall FairPlayKeyLoadError.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 7;
  if ((unint64_t)rawValue < 7) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (PodcastsFoundation::FairPlayKeyLoadError_optional)rawValue;
}

uint64_t FairPlayKeyLoadError.rawValue.getter()
{
  return *v0;
}

PodcastsFoundation::FairPlayKeyLoadError_optional sub_1ACE63148(Swift::Int *a1)
{
  return FairPlayKeyLoadError.init(rawValue:)(*a1);
}

uint64_t sub_1ACE63150(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1ACE63E00();
  unint64_t v5 = sub_1ACA339A4();
  return MEMORY[0x1F4185E20](a1, a2, v4, v5);
}

uint64_t sub_1ACE631A8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  uint64_t v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

id sub_1ACE63258(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v24 = sub_1ACE76CE8();
  uint64_t v10 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  unint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1ACE76C78();
  MEMORY[0x1F4188790](v13);
  uint64_t v14 = sub_1ACE75E48();
  MEMORY[0x1F4188790](v14 - 8);
  v29[3] = a5;
  v29[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a2, a5);
  uint64_t v16 = OBJC_IVAR___PFFairPlayKeyLoader_activeSessionStore;
  type metadata accessor for ActiveSessionStore();
  uint64_t v17 = (void *)swift_allocObject();
  unint64_t v18 = a3;
  uint64_t v19 = MEMORY[0x1E4FBC860];
  v17[2] = sub_1ACA38618(MEMORY[0x1E4FBC860]);
  v17[3] = 0;
  v17[4] = 0;
  v17[5] = 0;
  *(void *)&a3[v16] = v17;
  uint64_t v23 = OBJC_IVAR___PFFairPlayKeyLoader_internalQueue;
  sub_1ACA51E1C();
  sub_1ACE75E18();
  uint64_t v28 = v19;
  sub_1ACE64278((unint64_t *)&qword_1EB773180, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773160);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773170, (uint64_t *)&unk_1EB773160);
  sub_1ACE770E8();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FBCC58], v24);
  *(void *)&v18[v23] = sub_1ACE76D28();
  id v20 = &v18[OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix];
  *(void *)id v20 = 0;
  *((void *)v20 + 1) = 0;
  *(void *)&v18[OBJC_IVAR___PFFairPlayKeyLoader_metadataLoader] = v25;
  sub_1ACA3E158((uint64_t)v29, (uint64_t)&v18[OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider]);
  swift_unknownObjectRetain();

  v27.receiver = v18;
  v27.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v27, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  return v21;
}

id sub_1ACE635A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = (char *)objc_allocWithZone(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, a5);
  return sub_1ACE63258(a1, (uint64_t)v13, v15, a4, a5, a6);
}

id sub_1ACE636A0(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v19 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v18 = sub_1ACE76CE8();
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1ACE76C78();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1ACE75E48();
  MEMORY[0x1F4188790](v9 - 8);
  v23[3] = type metadata accessor for FairPlayKeySessionProvider();
  v23[4] = &protocol witness table for FairPlayKeySessionProvider;
  v23[0] = a2;
  uint64_t v10 = OBJC_IVAR___PFFairPlayKeyLoader_activeSessionStore;
  type metadata accessor for ActiveSessionStore();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = a3;
  uint64_t v13 = MEMORY[0x1E4FBC860];
  v11[2] = sub_1ACA38618(MEMORY[0x1E4FBC860]);
  v11[3] = 0;
  v11[4] = 0;
  v11[5] = 0;
  *(void *)&a3[v10] = v11;
  uint64_t v17 = OBJC_IVAR___PFFairPlayKeyLoader_internalQueue;
  sub_1ACA51E1C();
  sub_1ACE75E18();
  uint64_t v22 = v13;
  sub_1ACE64278((unint64_t *)&qword_1EB773180, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773160);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773170, (uint64_t *)&unk_1EB773160);
  sub_1ACE770E8();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC58], v18);
  *(void *)&v12[v17] = sub_1ACE76D28();
  Class v14 = &v12[OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix];
  *(void *)Class v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v12[OBJC_IVAR___PFFairPlayKeyLoader_metadataLoader] = v19;
  sub_1ACA3E158((uint64_t)v23, (uint64_t)&v12[OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider]);
  swift_unknownObjectRetain();

  v21.receiver = v12;
  v21.super_class = ObjectType;
  id v15 = objc_msgSendSuper2(&v21, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  return v15;
}

uint64_t sub_1ACE639C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1ACE639F8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1ACE63A48()
{
  return sub_1ACE5CC24(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1ACE63A54()
{
  swift_release();
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_1ACE63AA4()
{
  sub_1ACE5D3FC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

void sub_1ACE63AB4()
{
  sub_1ACE5DF04(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1ACE63AC0()
{
  return objectdestroy_20Tm_0(MEMORY[0x1E4FBC898]);
}

uint64_t sub_1ACE63AD8()
{
  return sub_1ACE5E7BC(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t objectdestroy_13Tm_0()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return swift_deallocObject();
}

void sub_1ACE63B38()
{
  sub_1ACE5FCE8(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1ACE63B44()
{
  return objectdestroy_20Tm_0(MEMORY[0x1E4FBC8F8]);
}

void sub_1ACE63B5C()
{
  sub_1ACE608D0(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

unint64_t sub_1ACE63B6C()
{
  unint64_t result = qword_1E99F6CC8;
  if (!qword_1E99F6CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6CC8);
  }
  return result;
}

uint64_t type metadata accessor for FairPlayKeyLoader()
{
  return self;
}

uint64_t method lookup function for FairPlayKeyLoader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FairPlayKeyLoader);
}

uint64_t dispatch thunk of FairPlayKeyLoader.__allocating_init(metadataLoader:fairPlayKeySessionProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for ActiveSessionStore()
{
  return self;
}

uint64_t getEnumTagSinglePayload for FairPlayKeyLoadError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FairPlayKeyLoadError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1ACE63D90);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FairPlayKeyLoadError()
{
  return &type metadata for FairPlayKeyLoadError;
}

uint64_t sub_1ACE63DC8()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_1ACE63E00()
{
  unint64_t result = qword_1E99F6CF0;
  if (!qword_1E99F6CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E99F6CF0);
  }
  return result;
}

uint64_t sub_1ACE63E54()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_1ACE63E9C(void *a1)
{
  sub_1ACE619D8(a1, *(void **)(v1 + 16), *(void (**)(id))(v1 + 24));
}

uint64_t sub_1ACE63EA8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ACE63EE0()
{
  swift_release();

  return swift_deallocObject();
}

void sub_1ACE63F28(void *a1)
{
  sub_1ACE5F008(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(dispatch_group_t *)(v1 + 32));
}

uint64_t sub_1ACE63F34()
{
  return objectdestroy_81Tm(MEMORY[0x1E4FBC8D0]);
}

void sub_1ACE63F4C()
{
  sub_1ACE5F0D8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void, void))(v0 + 32));
}

uint64_t sub_1ACE63F58()
{
  return objectdestroy_20Tm_0(MEMORY[0x1E4FBC8F8]);
}

uint64_t objectdestroy_20Tm_0(void (*a1)(void))
{
  swift_release();
  if (*(void *)(v1 + 24)) {
    swift_release();
  }
  a1(*(void *)(v1 + 40));
  return swift_deallocObject();
}

void sub_1ACE63FD0(void *a1, uint64_t a2, char a3)
{
  sub_1ACE60D3C(a1, a2, a3 & 1, *(void *)(v3 + 16), *(void (**)(void))(v3 + 24), *(void *)(v3 + 32), *(void **)(v3 + 40));
}

uint64_t sub_1ACE63FE0()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1ACE64028(void *a1)
{
  sub_1ACE61DD8(a1, *(void *)(v1 + 16), *(void (**)(void *, void, uint64_t))(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_1ACE64034()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1ACE6406C()
{
  sub_1ACE626C0(*(void (**)(void *, void, uint64_t))(v0 + 16));
}

uint64_t sub_1ACE64074()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ACE640B4()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), 0);
}

id sub_1ACE640E8(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_1ACE640F8(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1ACE64108()
{
  return objectdestroy_81Tm(MEMORY[0x1E4FBC8F8]);
}

uint64_t objectdestroy_81Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 24));
  if (*(void *)(v1 + 32)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_1ACE64180(void *a1)
{
  return sub_1ACE610A0(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1ACE6418C()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_1ACE641E4()
{
  return sub_1ACE61388(*(void *)(v0 + 16), *(id *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1ACE641F4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1ACE6422C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ACE6426C()
{
  return sub_1ACE62E6C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1ACE64278(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1ACE642C0()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ACE64300()
{
  return sub_1ACE62A5C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t static ImageCacheDeleteStrategy.cacheDeleteLevels(for:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  char v2 = 8 * (*(unsigned char *)(result + 32) + 1);
  *a2 = 0x301u >> v2;
  a2[1] = 0x3030101u >> v2;
  return result;
}

ValueMetadata *type metadata accessor for ImageCacheDeleteStrategy()
{
  return &type metadata for ImageCacheDeleteStrategy;
}

void *AssetReaderScoutingAligner.__allocating_init(asset:catalog:logger:)(void *a1, void *a2, uint64_t a3)
{
  swift_allocObject();
  unsigned int v6 = sub_1ACE69834(a1, (uint64_t)a2, a3);

  return v6;
}

void *AssetReaderScoutingAligner.init(asset:catalog:logger:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_1ACE69834(a1, (uint64_t)a2, a3);

  return v5;
}

uint64_t sub_1ACE64440(double a1, double a2, double a3)
{
  *(void *)(v4 + 64) = v3;
  *(double *)(v4 + 48) = a2;
  *(double *)(v4 + 56) = a3;
  *(double *)(v4 + 40) = a1;
  uint64_t v5 = sub_1ACE75448();
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = *(void *)(v5 - 8);
  *(void *)(v4 + 88) = swift_task_alloc();
  *(void *)(v4 + 96) = swift_task_alloc();
  uint64_t v6 = sub_1ACE753F8();
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 112) = *(void *)(v6 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  *(void *)(v4 + 128) = swift_task_alloc();
  *(void *)(v4 + 136) = swift_task_alloc();
  *(void *)(v4 + 144) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1ACE6459C, 0, 0);
}

uint64_t sub_1ACE6459C()
{
  if (qword_1E99EFFA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1ACE75438();
  *((void *)v0 + 19) = __swift_project_value_buffer(v1, (uint64_t)qword_1E99F2D90);
  sub_1ACE75428();
  sub_1ACE753C8();
  char v2 = sub_1ACE75428();
  os_signpost_type_t v3 = sub_1ACE76E18();
  if (sub_1ACE76FA8())
  {
    uint64_t v4 = *((void *)v0 + 17);
    uint64_t v5 = *((void *)v0 + 13);
    uint64_t v6 = *((void *)v0 + 14);
    BOOL v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    unint64_t v8 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v7(v4, *((void *)v0 + 18), v5);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    os_signpost_id_t v10 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v2, v3, v10, "ScoutingAlignment", "", v9, 2u);
    MEMORY[0x1AD11B340](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v11 = *((void *)v0 + 14);

    BOOL v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    unint64_t v8 = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v13 = *((void *)v0 + 17);
  uint64_t v12 = *((void *)v0 + 18);
  uint64_t v14 = *((void *)v0 + 13);
  uint64_t v15 = *((void *)v0 + 14);
  *((void *)v0 + 20) = v7;
  *((void *)v0 + 21) = v8;
  v7(v13, v12, v14);
  sub_1ACE75478();
  swift_allocObject();
  *((void *)v0 + 22) = sub_1ACE75468();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  *((void *)v0 + 23) = v16;
  *((void *)v0 + 24) = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v12, v14);
  uint64_t v17 = (void *)swift_task_alloc();
  *((void *)v0 + 25) = v17;
  void *v17 = v0;
  v17[1] = sub_1ACE647E4;
  double v18 = v0[6];
  double v19 = v0[7];
  double v20 = v0[5];
  return sub_1ACE64D5C(v20, v18, v19);
}

uint64_t sub_1ACE647E4(double a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = v2;
  *(double *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v1;
  *(void *)(v3 + 208) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_1ACE64B38;
  }
  else {
    uint64_t v4 = sub_1ACE64904;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1ACE64904()
{
  uint64_t v1 = (void *)(v0 + 128);
  char v2 = sub_1ACE75428();
  sub_1ACE75458();
  os_signpost_type_t v3 = sub_1ACE76E08();
  if (sub_1ACE76FA8())
  {
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v6 = *(void *)(v0 + 80);
    swift_retain();
    sub_1ACE75488();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v6 + 88))(v4, v5) == *MEMORY[0x1E4FBD340])
    {
      BOOL v7 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 72));
      BOOL v7 = "";
    }
    uint64_t v1 = (void *)(v0 + 136);
    unint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v10 = *(void *)(v0 + 104);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 160))(*(void *)(v0 + 136), v9, v10);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_signpost_id_t v12 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v2, v3, v12, "ScoutingAlignment", v7, v11, 2u);
    MEMORY[0x1AD11B340](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {
  }
  unint64_t v13 = *(void *)(v0 + 24);
  (*(void (**)(void, void))(v0 + 184))(*v1, *(void *)(v0 + 104));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(__n128))(v0 + 8);
  v15.n128_u64[0] = v13;
  return v14(v15);
}

uint64_t sub_1ACE64B38()
{
  uint64_t v1 = (void *)(v0 + 120);
  char v2 = sub_1ACE75428();
  sub_1ACE75458();
  os_signpost_type_t v3 = sub_1ACE76E08();
  if (sub_1ACE76FA8())
  {
    uint64_t v5 = *(void *)(v0 + 80);
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v6 = *(void *)(v0 + 72);
    swift_retain();
    sub_1ACE75488();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x1E4FBD340])
    {
      BOOL v7 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
      BOOL v7 = "";
    }
    uint64_t v1 = (void *)(v0 + 136);
    unint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 104);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 160))(*(void *)(v0 + 136), v9, v10);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_signpost_id_t v12 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v2, v3, v12, "ScoutingAlignment", v7, v11, 2u);
    MEMORY[0x1AD11B340](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0 + 184))(*v1, *(void *)(v0 + 104));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_1ACE64D5C(double a1, double a2, double a3)
{
  *(void *)(v4 + 280) = v3;
  *(double *)(v4 + 264) = a2;
  *(double *)(v4 + 272) = a3;
  *(double *)(v4 + 256) = a1;
  uint64_t v5 = sub_1ACE75448();
  *(void *)(v4 + 288) = v5;
  *(void *)(v4 + 296) = *(void *)(v5 - 8);
  *(void *)(v4 + 304) = swift_task_alloc();
  uint64_t v6 = sub_1ACE753F8();
  *(void *)(v4 + 312) = v6;
  *(void *)(v4 + 320) = *(void *)(v6 - 8);
  *(void *)(v4 + 328) = swift_task_alloc();
  *(void *)(v4 + 336) = swift_task_alloc();
  *(void *)(v4 + 344) = swift_task_alloc();
  *(void *)(v4 + 352) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1ACE64EA8, 0, 0);
}

uint64_t sub_1ACE64EA8()
{
  uint64_t v81 = v0;
  *(void *)(v0 + 360) = OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  uint64_t v1 = sub_1ACE75498();
  os_log_type_t v2 = sub_1ACE76C08();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 256);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    *(void *)(v0 + 248) = v3;
    sub_1ACE76FF8();
    _os_log_impl(&dword_1AC9D5000, v1, v2, "Scouting: Beginning with initial guess for %f", v4, 0xCu);
    MEMORY[0x1AD11B340](v4, -1, -1);
  }

  if (qword_1E99EFFA0 != -1) {
LABEL_49:
  }
    swift_once();
  uint64_t v5 = sub_1ACE75438();
  *(void *)(v0 + 368) = __swift_project_value_buffer(v5, (uint64_t)qword_1E99F2D90);
  sub_1ACE75428();
  sub_1ACE753C8();
  uint64_t v6 = sub_1ACE75428();
  os_signpost_type_t v7 = sub_1ACE76E18();
  if (sub_1ACE76FA8())
  {
    uint64_t v8 = *(void *)(v0 + 344);
    uint64_t v9 = *(void *)(v0 + 312);
    uint64_t v10 = *(void *)(v0 + 320);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    unint64_t v12 = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v11(v8, *(void *)(v0 + 352), v9);
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v13 = 0;
    os_signpost_id_t v14 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v6, v7, v14, "ScoutingAlignmentResolve", "", v13, 2u);
    MEMORY[0x1AD11B340](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 320);

    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    unint64_t v12 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v16 = (uint64_t *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 344);
  uint64_t v17 = *(void *)(v0 + 352);
  v78 = (void *)(v0 + 144);
  uint64_t v19 = *(void *)(v0 + 312);
  uint64_t v20 = *(void *)(v0 + 320);
  uint64_t v21 = *(void *)(v0 + 256);
  *(void *)(v0 + 376) = v11;
  *(void *)(v0 + 384) = v12;
  v11(v18, v17, v19);
  *(void *)(v0 + 392) = sub_1ACE75478();
  swift_allocObject();
  *(void *)(v0 + 400) = sub_1ACE75468();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  *(void *)(v0 + 408) = v22;
  *(void *)(v0 + 416) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v22(v17, v19);
  *(void *)(v0 + 144) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F0CC0);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 424) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1ACE843F0;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = v21;
  uint64_t v24 = MEMORY[0x1E4FBC870];
  *(void *)(v0 + 128) = 0;
  *(void *)(v0 + 136) = inited;
  *(void *)(v0 + 112) = v24;
  *(void *)(v0 + 120) = 0;
  swift_beginAccess();
  swift_beginAccess();
  *(_DWORD *)(v0 + 464) = *MEMORY[0x1E4FBD340];
  uint64_t v25 = *(void *)(inited + 16);
  while (1)
  {
    if (!v25)
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    *(unsigned char *)(v0 + 468) = *(unsigned char *)(inited + 32);
    double v26 = *(double *)(inited + 40);
    *(double *)(v0 + 432) = v26;
    sub_1ACACA6DC(0, 1);
    if (*(uint64_t *)(v0 + 120) >= 24)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = *(void *)(v0 + 120);
      sub_1ACE69BE0();
      swift_allocError();
      uint64_t v40 = *(void *)(v0 + 400);
      uint64_t v41 = *(void *)(v0 + 280);
      double v42 = *(double *)(v0 + 256);
      if (v38 < 24) {
        char v43 = 1;
      }
      else {
        char v43 = 2;
      }
      *uint64_t v39 = v43;
      swift_willThrow();
      sub_1ACE66954(v42, v41, v40, v78);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
      return v44();
    }
    if (v26 < *(double *)(v0 + 264) || v26 >= *(double *)(v0 + 272))
    {
      uint64_t v28 = sub_1ACE75498();
      os_log_type_t v29 = sub_1ACE76C08();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = swift_slowAlloc();
        *(_DWORD *)uint64_t v30 = 134217984;
        *(double *)(v30 + 4) = v26;
        unint64_t v31 = v28;
        os_log_type_t v32 = v29;
        unint64_t v33 = "Scouting: Skipping out of bounds %f";
LABEL_23:
        _os_log_impl(&dword_1AC9D5000, v31, v32, v33, (uint8_t *)v30, 0xCu);
        MEMORY[0x1AD11B340](v30, -1, -1);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    if ((~*(void *)&v26 & 0x7FF0000000000000) == 0) {
      goto LABEL_46;
    }
    if (v26 <= -9.22337204e18) {
      goto LABEL_47;
    }
    if (v26 >= 9.22337204e18) {
      goto LABEL_48;
    }
    uint64_t v34 = *(void *)(v0 + 112);
    uint64_t v35 = (((uint64_t)v26 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)(uint64_t)v26 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    swift_bridgeObjectRetain();
    char v36 = sub_1ACCEA8A0(1000000000000000000 * (uint64_t)v26, v35, v34);
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0) {
      break;
    }
    uint64_t v28 = sub_1ACE75498();
    os_log_type_t v37 = sub_1ACE76C08();
    if (os_log_type_enabled(v28, v37))
    {
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 134217984;
      *(double *)(v30 + 4) = v26;
      unint64_t v31 = v28;
      os_log_type_t v32 = v37;
      unint64_t v33 = "Scouting: Skipping already visited position %f";
      goto LABEL_23;
    }
LABEL_8:

    uint64_t inited = *v16;
    uint64_t v25 = *(void *)(*v16 + 16);
    if (!v25) {
      goto LABEL_24;
    }
  }
  sub_1ACD324A8(&v80, 1000000000000000000 * (uint64_t)v26, v35);
  uint64_t v46 = sub_1ACE75498();
  os_log_type_t v47 = sub_1ACE76C08();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 134218752;
    *(void *)(v0 + 216) = *(void *)(v0 + 128);
    sub_1ACE76FF8();
    *(_WORD *)(v48 + 12) = 2048;
    *(double *)(v0 + 224) = v26;
    sub_1ACE76FF8();
    *(_WORD *)(v48 + 22) = 2048;
    *(void *)(v0 + 232) = *(void *)(v0 + 120);
    sub_1ACE76FF8();
    *(_WORD *)(v48 + 32) = 2048;
    *(void *)(v0 + 240) = 24;
    sub_1ACE76FF8();
    _os_log_impl(&dword_1AC9D5000, v46, v47, "Scouting: Beginning step %ld, Position: %f, GiveUp: %ld/%ld", (uint8_t *)v48, 0x2Au);
    MEMORY[0x1AD11B340](v48, -1, -1);
  }

  if (*v78)
  {
    swift_retain();
    v49 = sub_1ACE75428();
    sub_1ACE75458();
    os_signpost_type_t v50 = sub_1ACE76E08();
    if (sub_1ACE76FA8())
    {
      int v51 = *(_DWORD *)(v0 + 464);
      uint64_t v53 = *(void *)(v0 + 296);
      uint64_t v52 = *(void *)(v0 + 304);
      uint64_t v54 = *(void *)(v0 + 288);
      swift_retain();
      sub_1ACE75488();
      swift_release();
      os_signpost_type_t v79 = v50;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v53 + 88))(v52, v54) == v51)
      {
        uint64_t v55 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
        uint64_t v55 = "";
      }
      v59 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
      uint64_t v61 = *(void *)(v0 + 336);
      uint64_t v60 = *(void *)(v0 + 344);
      uint64_t v62 = *(void *)(v0 + 312);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376))(v60, v61, v62);
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      os_signpost_id_t v64 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v49, v79, v64, "ScoutingAlignmentStep", v55, v63, 2u);
      MEMORY[0x1AD11B340](v63, -1, -1);

      v59(v61, v62);
      swift_release();
      v59(v60, v62);
    }
    else
    {
      v56 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
      uint64_t v57 = *(void *)(v0 + 336);
      uint64_t v58 = *(void *)(v0 + 312);

      v56(v57, v58);
      swift_release();
    }
  }
  sub_1ACE75428();
  sub_1ACE753C8();
  uint64_t v65 = sub_1ACE75428();
  os_signpost_type_t v66 = sub_1ACE76E18();
  if (sub_1ACE76FA8())
  {
    uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    uint64_t v68 = *(void *)(v0 + 344);
    uint64_t v69 = *(void *)(v0 + 312);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 376))(v68, *(void *)(v0 + 328), v69);
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v70 = 0;
    os_signpost_id_t v71 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v65, v66, v71, "ScoutingAlignmentStep", "", v70, 2u);
    MEMORY[0x1AD11B340](v70, -1, -1);

    v67(v68, v69);
  }
  else
  {
  }
  uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  uint64_t v73 = *(void *)(v0 + 328);
  uint64_t v74 = *(void *)(v0 + 312);
  (*(void (**)(void, uint64_t, uint64_t))(v0 + 376))(*(void *)(v0 + 344), v73, v74);
  swift_allocObject();
  uint64_t v75 = sub_1ACE75468();
  v72(v73, v74);
  swift_release();
  *(void *)(v0 + 144) = v75;
  v76 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v76;
  void *v76 = v0;
  v76[1] = sub_1ACE65928;
  double v77 = *(double *)(v0 + 256);
  return sub_1ACE66F00(v77, v26);
}

uint64_t sub_1ACE65928(uint64_t a1, char a2)
{
  uint64_t v5 = *v3;
  *(void *)(v5 + 448) = a1;
  *(void *)(v5 + 456) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_1ACE6688C;
  }
  else
  {
    *(unsigned char *)(v5 + 469) = a2;
    uint64_t v6 = sub_1ACE65A5C;
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t sub_1ACE65A5C()
{
  uint64_t v108 = v1;
  if (*(unsigned char *)(v1 + 469))
  {
    uint64_t v4 = (uint64_t *)(v1 + 136);
    v105 = (void *)(v1 + 144);
    if (*(unsigned char *)(v1 + 469) != 1)
    {
      uint64_t v24 = *(void *)(v1 + 120);
      BOOL v6 = __OFADD__(v24, 1);
      uint64_t v25 = v24 + 1;
      if (v6) {
        goto LABEL_81;
      }
      int v26 = *(unsigned __int8 *)(v1 + 468);
      *(void *)(v1 + 120) = v25;
      if (v26)
      {
        if (v26 == 1)
        {
          objc_super v27 = sub_1ACE75498();
          os_log_type_t v28 = sub_1ACE76C08();
          if (os_log_type_enabled(v27, v28))
          {
            uint64_t v29 = *(void *)(v1 + 432);
            uint64_t v30 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v30 = 134217984;
            *(void *)(v1 + 160) = v29;
            sub_1ACE76FF8();
            _os_log_impl(&dword_1AC9D5000, v27, v28, "Scouting: ⬅️ No match found for %f", v30, 0xCu);
            MEMORY[0x1AD11B340](v30, -1, -1);
          }
          double v2 = *(double *)(v1 + 432);

          double v3 = -120.0;
          uint64_t v0 = *(void **)(v1 + 136);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            goto LABEL_16;
          }
          goto LABEL_82;
        }
        unint64_t v45 = sub_1ACE75498();
        os_log_type_t v46 = sub_1ACE76C08();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = *(void *)(v1 + 432);
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v48 = 134217984;
          *(void *)(v1 + 152) = v47;
          sub_1ACE76FF8();
          _os_log_impl(&dword_1AC9D5000, v45, v46, "Scouting: ➡️ No match found for %f", v48, 0xCu);
          MEMORY[0x1AD11B340](v48, -1, -1);
        }
        double v49 = *(double *)(v1 + 432);

        double v3 = 120.0;
        uint64_t v0 = *(void **)(v1 + 136);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_1ACA444A4(0, v0[2] + 1, 1, v0);
        }
        double v2 = v49 + 120.0;
        unint64_t v51 = v0[2];
        unint64_t v50 = v0[3];
        if (v51 >= v50 >> 1) {
          uint64_t v0 = sub_1ACA444A4((void *)(v50 > 1), v51 + 1, 1, v0);
        }
        v0[2] = v51 + 1;
        unint64_t v33 = &v0[2 * v51];
        char v34 = 2;
      }
      else
      {
        uint64_t v35 = sub_1ACE75498();
        os_log_type_t v36 = sub_1ACE76C08();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = *(void *)(v1 + 432);
          uint64_t v38 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v38 = 134217984;
          *(void *)(v1 + 168) = v37;
          sub_1ACE76FF8();
          _os_log_impl(&dword_1AC9D5000, v35, v36, "Scouting: ↔️ No match found for %f", v38, 0xCu);
          MEMORY[0x1AD11B340](v38, -1, -1);
        }
        double v39 = *(double *)(v1 + 432);

        uint64_t v0 = *(void **)(v1 + 136);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_1ACA444A4(0, v0[2] + 1, 1, v0);
        }
        double v3 = v39 + 120.0;
        unint64_t v41 = v0[2];
        unint64_t v40 = v0[3];
        int64_t v42 = v40 >> 1;
        unint64_t v43 = v41 + 1;
        if (v40 >> 1 <= v41)
        {
          uint64_t v0 = sub_1ACA444A4((void *)(v40 > 1), v41 + 1, 1, v0);
          unint64_t v40 = v0[3];
          int64_t v42 = v40 >> 1;
        }
        double v2 = v39 + -120.0;
        v0[2] = v43;
        unint64_t v44 = &v0[2 * v41];
        *((unsigned char *)v44 + 32) = 2;
        *((double *)v44 + 5) = v3;
        if (v42 < (uint64_t)(v41 + 2)) {
          uint64_t v0 = sub_1ACA444A4((void *)(v40 > 1), v41 + 2, 1, v0);
        }
        v0[2] = v41 + 2;
        unint64_t v33 = &v0[2 * v43];
        char v34 = 1;
      }
      goto LABEL_35;
    }
    uint64_t v5 = *(void *)(v1 + 120);
    BOOL v6 = __OFADD__(v5, 4);
    uint64_t v7 = v5 + 4;
    if (v6) {
      goto LABEL_80;
    }
    double v2 = *(double *)(v1 + 448);
    *(void *)(v1 + 120) = v7;
    uint64_t v8 = sub_1ACE75498();
    os_log_type_t v9 = sub_1ACE76C08();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = *(void *)(v1 + 448);
      double v3 = *(double *)(v1 + 432);
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134218240;
      *(double *)(v1 + 176) = v3;
      sub_1ACE76FF8();
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v1 + 184) = v10;
      sub_1ACE76FF8();
      _os_log_impl(&dword_1AC9D5000, v8, v9, "Scouting: 🔎 Refined guess from %f to %f.", (uint8_t *)v11, 0x16u);
      MEMORY[0x1AD11B340](v11, -1, -1);
    }

    uint64_t v0 = (void *)(v1 + 136);
    sub_1ACAC91DC(0, 0, 0, v2);
    while (1)
    {
      uint64_t v52 = *(void *)(v1 + 128);
      BOOL v6 = __OFADD__(v52, 1);
      uint64_t v53 = v52 + 1;
      if (!v6) {
        break;
      }
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      uint64_t v0 = sub_1ACA444A4(0, v0[2] + 1, 1, v0);
LABEL_16:
      double v2 = v2 + v3;
      unint64_t v32 = v0[2];
      unint64_t v31 = v0[3];
      if (v32 >= v31 >> 1) {
        uint64_t v0 = sub_1ACA444A4((void *)(v31 > 1), v32 + 1, 1, v0);
      }
      v0[2] = v32 + 1;
      unint64_t v33 = &v0[2 * v32];
      char v34 = 1;
LABEL_35:
      *((unsigned char *)v33 + 32) = v34;
      *((double *)v33 + 5) = v2;
      *uint64_t v4 = (uint64_t)v0;
    }
    *(void *)(v1 + 128) = v53;
    uint64_t v54 = *v4;
    if (*(void *)(*v4 + 16))
    {
      while (1)
      {
        *(unsigned char *)(v1 + 468) = *(unsigned char *)(v54 + 32);
        double v2 = *(double *)(v54 + 40);
        *(double *)(v1 + 432) = v2;
        uint64_t v0 = (void *)(v1 + 136);
        sub_1ACACA6DC(0, 1);
        if (*(uint64_t *)(v1 + 120) >= 24) {
          goto LABEL_54;
        }
        if (v2 < *(double *)(v1 + 264) || v2 >= *(double *)(v1 + 272)) {
          break;
        }
        if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
        {
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
          goto LABEL_79;
        }
        if (v2 <= -9.22337204e18) {
          goto LABEL_77;
        }
        if (v2 >= 9.22337204e18) {
          goto LABEL_78;
        }
        uint64_t v62 = *(void *)(v1 + 112);
        uint64_t v63 = (((uint64_t)v2 >> 63) & 0xF21F494C589C0000)
            + (((unint64_t)(uint64_t)v2 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
        swift_bridgeObjectRetain();
        char v64 = sub_1ACCEA8A0(1000000000000000000 * (uint64_t)v2, v63, v62);
        swift_bridgeObjectRelease();
        if ((v64 & 1) == 0)
        {
          sub_1ACD324A8(&v107, 1000000000000000000 * (uint64_t)v2, v63);
          uint64_t v73 = sub_1ACE75498();
          os_log_type_t v74 = sub_1ACE76C08();
          if (os_log_type_enabled(v73, v74))
          {
            uint64_t v75 = swift_slowAlloc();
            *(_DWORD *)uint64_t v75 = 134218752;
            *(void *)(v1 + 216) = *(void *)(v1 + 128);
            sub_1ACE76FF8();
            *(_WORD *)(v75 + 12) = 2048;
            *(double *)(v1 + 224) = v2;
            sub_1ACE76FF8();
            *(_WORD *)(v75 + 22) = 2048;
            *(void *)(v1 + 232) = *(void *)(v1 + 120);
            sub_1ACE76FF8();
            *(_WORD *)(v75 + 32) = 2048;
            *(void *)(v1 + 240) = 24;
            sub_1ACE76FF8();
            _os_log_impl(&dword_1AC9D5000, v73, v74, "Scouting: Beginning step %ld, Position: %f, GiveUp: %ld/%ld", (uint8_t *)v75, 0x2Au);
            MEMORY[0x1AD11B340](v75, -1, -1);
          }

          if (*v105)
          {
            swift_retain();
            v76 = sub_1ACE75428();
            sub_1ACE75458();
            os_signpost_type_t v77 = sub_1ACE76E08();
            if (sub_1ACE76FA8())
            {
              os_signpost_type_t v106 = v77;
              int v78 = *(_DWORD *)(v1 + 464);
              uint64_t v80 = *(void *)(v1 + 296);
              uint64_t v79 = *(void *)(v1 + 304);
              uint64_t v81 = *(void *)(v1 + 288);
              swift_retain();
              sub_1ACE75488();
              swift_release();
              if ((*(unsigned int (**)(uint64_t, uint64_t))(v80 + 88))(v79, v81) == v78)
              {
                uint64_t v82 = "[Error] Interval already ended";
              }
              else
              {
                (*(void (**)(void, void))(*(void *)(v1 + 296) + 8))(*(void *)(v1 + 304), *(void *)(v1 + 288));
                uint64_t v82 = "";
              }
              v86 = *(void (**)(uint64_t, uint64_t))(v1 + 408);
              uint64_t v88 = *(void *)(v1 + 336);
              uint64_t v87 = *(void *)(v1 + 344);
              uint64_t v89 = *(void *)(v1 + 312);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 376))(v87, v88, v89);
              v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v90 = 0;
              os_signpost_id_t v91 = sub_1ACE753D8();
              _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v76, v106, v91, "ScoutingAlignmentStep", v82, v90, 2u);
              MEMORY[0x1AD11B340](v90, -1, -1);

              v86(v88, v89);
              swift_release();
              v86(v87, v89);
            }
            else
            {
              v83 = *(void (**)(uint64_t, uint64_t))(v1 + 408);
              uint64_t v84 = *(void *)(v1 + 336);
              uint64_t v85 = *(void *)(v1 + 312);

              v83(v84, v85);
              swift_release();
            }
          }
          sub_1ACE75428();
          sub_1ACE753C8();
          v92 = sub_1ACE75428();
          os_signpost_type_t v93 = sub_1ACE76E18();
          if (sub_1ACE76FA8())
          {
            v94 = *(void (**)(uint64_t, uint64_t))(v1 + 408);
            uint64_t v95 = *(void *)(v1 + 344);
            uint64_t v96 = *(void *)(v1 + 312);
            (*(void (**)(uint64_t, void, uint64_t))(v1 + 376))(v95, *(void *)(v1 + 328), v96);
            v97 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v97 = 0;
            os_signpost_id_t v98 = sub_1ACE753D8();
            _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v92, v93, v98, "ScoutingAlignmentStep", "", v97, 2u);
            MEMORY[0x1AD11B340](v97, -1, -1);

            v94(v95, v96);
          }
          else
          {
          }
          v99 = *(void (**)(uint64_t, uint64_t))(v1 + 408);
          uint64_t v100 = *(void *)(v1 + 328);
          uint64_t v101 = *(void *)(v1 + 312);
          (*(void (**)(void, uint64_t, uint64_t))(v1 + 376))(*(void *)(v1 + 344), v100, v101);
          swift_allocObject();
          uint64_t v102 = sub_1ACE75468();
          v99(v100, v101);
          swift_release();
          *(void *)(v1 + 144) = v102;
          v103 = (void *)swift_task_alloc();
          *(void *)(v1 + 440) = v103;
          void *v103 = v1;
          v103[1] = sub_1ACE65928;
          double v104 = *(double *)(v1 + 256);
          return sub_1ACE66F00(v104, v2);
        }
        v56 = sub_1ACE75498();
        os_log_type_t v65 = sub_1ACE76C08();
        if (os_log_type_enabled(v56, v65))
        {
          uint64_t v58 = swift_slowAlloc();
          *(_DWORD *)uint64_t v58 = 134217984;
          *(double *)(v58 + 4) = v2;
          v59 = v56;
          os_log_type_t v60 = v65;
          uint64_t v61 = "Scouting: Skipping already visited position %f";
LABEL_39:
          _os_log_impl(&dword_1AC9D5000, v59, v60, v61, (uint8_t *)v58, 0xCu);
          MEMORY[0x1AD11B340](v58, -1, -1);
        }
LABEL_40:

        uint64_t v54 = *v4;
        if (!*(void *)(*v4 + 16)) {
          goto LABEL_54;
        }
      }
      v56 = sub_1ACE75498();
      os_log_type_t v57 = sub_1ACE76C08();
      if (!os_log_type_enabled(v56, v57)) {
        goto LABEL_40;
      }
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 134217984;
      *(double *)(v58 + 4) = v2;
      v59 = v56;
      os_log_type_t v60 = v57;
      uint64_t v61 = "Scouting: Skipping out of bounds %f";
      goto LABEL_39;
    }
LABEL_54:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v66 = *(void *)(v1 + 120);
    sub_1ACE69BE0();
    swift_allocError();
    uint64_t v68 = *(void *)(v1 + 400);
    uint64_t v69 = *(void *)(v1 + 280);
    double v70 = *(double *)(v1 + 256);
    if (v66 < 24) {
      char v71 = 1;
    }
    else {
      char v71 = 2;
    }
    *uint64_t v67 = v71;
    swift_willThrow();
    sub_1ACE66954(v70, v69, v68, v105);
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(__n128))(v1 + 8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v1 + 128);
    unint64_t v13 = sub_1ACE75498();
    os_log_type_t v14 = sub_1ACE76C08();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *(void *)(v1 + 432);
      uint64_t v16 = *(void *)(v1 + 256);
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134218496;
      *(void *)(v1 + 192) = v16;
      sub_1ACE76FF8();
      *(_WORD *)(v17 + 12) = 2048;
      *(void *)(v1 + 200) = v15;
      sub_1ACE76FF8();
      *(_WORD *)(v17 + 22) = 2048;
      *(void *)(v1 + 208) = v12;
      sub_1ACE76FF8();
      _os_log_impl(&dword_1AC9D5000, v13, v14, "Scouting: 🎯 Resolved from %f to %f in %ld steps", (uint8_t *)v17, 0x20u);
      MEMORY[0x1AD11B340](v17, -1, -1);
    }
    unint64_t v18 = *(void *)(v1 + 448);
    uint64_t v19 = *(void *)(v1 + 400);
    uint64_t v20 = *(void *)(v1 + 280);
    double v21 = *(double *)(v1 + 256);

    sub_1ACE66954(v21, v20, v19, (void *)(v1 + 144));
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(__n128))(v1 + 8);
    v23.n128_u64[0] = v18;
  }
  return v22(v23);
}

uint64_t sub_1ACE6688C()
{
  sub_1ACE66954(*(double *)(v0 + 256), *(void *)(v0 + 280), *(void *)(v0 + 400), (void *)(v0 + 144));
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1ACE66954(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v49 = a4;
  uint64_t v5 = sub_1ACE75448();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v45 - v9;
  uint64_t v11 = sub_1ACE753F8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  os_log_type_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v45 - v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v45 - v19;
  double v21 = sub_1ACE75498();
  os_log_type_t v22 = sub_1ACE76C08();
  BOOL v23 = os_log_type_enabled(v21, v22);
  unint64_t v45 = v7;
  os_log_type_t v46 = v14;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134217984;
    double v50 = a1;
    sub_1ACE76FF8();
    _os_log_impl(&dword_1AC9D5000, v21, v22, "Scouting: Ending task for %f", v24, 0xCu);
    MEMORY[0x1AD11B340](v24, -1, -1);
  }

  if (qword_1E99EFFA0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1ACE75438();
  __swift_project_value_buffer(v25, (uint64_t)qword_1E99F2D90);
  int v26 = sub_1ACE75428();
  sub_1ACE75458();
  os_signpost_type_t v27 = sub_1ACE76E08();
  if (sub_1ACE76FA8())
  {
    swift_retain();
    sub_1ACE75488();
    swift_release();
    uint64_t v29 = v47;
    uint64_t v28 = v48;
    if ((*(unsigned int (**)(char *, uint64_t))(v47 + 88))(v10, v48) == *MEMORY[0x1E4FBD340])
    {
      uint64_t v30 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v28);
      uint64_t v30 = "";
    }
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v20, v11);
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v33 = 0;
    os_signpost_id_t v34 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v26, v27, v34, "ScoutingAlignmentResolve", v30, v33, 2u);
    MEMORY[0x1AD11B340](v33, -1, -1);

    unint64_t v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    v31(v20, v11);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v17, v11);
  }
  else
  {

    unint64_t v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v20, v11);
  }
  if (*v49)
  {
    swift_retain();
    uint64_t v35 = sub_1ACE75428();
    os_log_type_t v36 = v46;
    sub_1ACE75458();
    int v37 = sub_1ACE76E08();
    if (sub_1ACE76FA8())
    {
      LODWORD(v49) = v37;
      uint64_t v38 = v36;
      swift_retain();
      double v39 = v45;
      sub_1ACE75488();
      swift_release();
      uint64_t v41 = v47;
      uint64_t v40 = v48;
      if ((*(unsigned int (**)(char *, uint64_t))(v47 + 88))(v39, v48) == *MEMORY[0x1E4FBD340])
      {
        int64_t v42 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v41 + 8))(v39, v40);
        int64_t v42 = "";
      }
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v38, v11);
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v43 = 0;
      os_signpost_id_t v44 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v35, (os_signpost_type_t)v49, v44, "ScoutingAlignmentStep", v42, v43, 2u);
      MEMORY[0x1AD11B340](v43, -1, -1);

      v31(v38, v11);
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v31)(v17, v11);
    }
    else
    {

      v31(v36, v11);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1ACE66F00(double a1, double a2)
{
  *(void *)(v3 + 152) = v2;
  *(double *)(v3 + 136) = a1;
  *(double *)(v3 + 144) = a2;
  uint64_t v4 = sub_1ACE75448();
  *(void *)(v3 + 160) = v4;
  *(void *)(v3 + 168) = *(void *)(v4 - 8);
  *(void *)(v3 + 176) = swift_task_alloc();
  *(void *)(v3 + 184) = swift_task_alloc();
  *(void *)(v3 + 192) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6D40);
  *(void *)(v3 + 200) = v5;
  *(void *)(v3 + 208) = *(void *)(v5 - 8);
  *(void *)(v3 + 216) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6D48);
  *(void *)(v3 + 224) = v6;
  *(void *)(v3 + 232) = *(void *)(v6 - 8);
  *(void *)(v3 + 240) = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6D50);
  *(void *)(v3 + 248) = v7;
  *(void *)(v3 + 256) = *(void *)(v7 - 8);
  *(void *)(v3 + 264) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6D58);
  *(void *)(v3 + 272) = v8;
  *(void *)(v3 + 280) = *(void *)(v8 - 8);
  *(void *)(v3 + 288) = swift_task_alloc();
  uint64_t v9 = sub_1ACE753F8();
  *(void *)(v3 + 296) = v9;
  *(void *)(v3 + 304) = *(void *)(v9 - 8);
  *(void *)(v3 + 312) = swift_task_alloc();
  *(void *)(v3 + 320) = swift_task_alloc();
  *(void *)(v3 + 328) = swift_task_alloc();
  *(void *)(v3 + 336) = swift_task_alloc();
  *(void *)(v3 + 344) = swift_task_alloc();
  *(void *)(v3 + 352) = swift_task_alloc();
  *(void *)(v3 + 360) = swift_task_alloc();
  uint64_t v10 = sub_1ACE75438();
  *(void *)(v3 + 368) = v10;
  *(void *)(v3 + 376) = *(void *)(v10 - 8);
  *(void *)(v3 + 384) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1ACE67264, 0, 0);
}

uint64_t sub_1ACE67264()
{
  if (qword_1E99EFF98 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1E99F2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  if (qword_1E99EFFA0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 392) = __swift_project_value_buffer(*(void *)(v0 + 368), (uint64_t)qword_1E99F2D90);
  sub_1ACE75428();
  sub_1ACE753C8();
  uint64_t v5 = sub_1ACE75428();
  os_signpost_type_t v6 = sub_1ACE76E18();
  if (sub_1ACE76FA8())
  {
    uint64_t v7 = *(void *)(v0 + 352);
    uint64_t v8 = *(void *)(v0 + 296);
    uint64_t v9 = *(void *)(v0 + 304);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    unint64_t v11 = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v10(v7, *(void *)(v0 + 360), v8);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    os_signpost_id_t v13 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v5, v6, v13, "ScoutingAssetRead", "", v12, 2u);
    MEMORY[0x1AD11B340](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 304);

    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
    unint64_t v11 = (v14 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v15 = *(void *)(v0 + 376);
  uint64_t v29 = *(void *)(v0 + 384);
  uint64_t v16 = *(void *)(v0 + 360);
  uint64_t v28 = *(void *)(v0 + 368);
  uint64_t v17 = *(void *)(v0 + 352);
  uint64_t v19 = *(void *)(v0 + 296);
  uint64_t v18 = *(void *)(v0 + 304);
  uint64_t v32 = *(void *)(v0 + 256);
  uint64_t v30 = *(void *)(v0 + 264);
  uint64_t v31 = *(void *)(v0 + 248);
  uint64_t v35 = *(void *)(v0 + 272);
  uint64_t v36 = *(void *)(v0 + 208);
  uint64_t v33 = *(void *)(v0 + 216);
  uint64_t v34 = *(void *)(v0 + 200);
  uint64_t v20 = *(void *)(v0 + 152);
  *(void *)(v0 + 400) = v10;
  *(void *)(v0 + 408) = v11;
  v10(v17, v16, v19);
  *(void *)(v0 + 416) = sub_1ACE75478();
  swift_allocObject();
  *(void *)(v0 + 424) = sub_1ACE75468();
  double v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  *(void *)(v0 + 432) = v21;
  *(void *)(v0 + 440) = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v16, v19);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v28);
  os_log_type_t v22 = *(void **)(v20 + 24);
  sub_1ACE77CB8();
  sub_1ACE76F38();
  sub_1ACE76F38();
  sub_1ACE76B78();
  *(void *)(v0 + 120) = sub_1ACBF8C54(v22, (_OWORD *)(v0 + 504));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F4A20);
  sub_1ACA51EA4(&qword_1E99F4A28, &qword_1E99F4A20);
  sub_1ACE75C48();
  swift_release();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F6D60);
  sub_1ACA51EA4(&qword_1E99F6D68, &qword_1E99F6D50);
  sub_1ACE75C28();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
  uint64_t v23 = sub_1ACA51EA4(&qword_1E99F6D70, &qword_1E99F6D58);
  MEMORY[0x1AD117DF0](v35, v23);
  sub_1ACE75958();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v34);
  uint64_t v24 = sub_1ACA51EA4(&qword_1E99F6D78, &qword_1E99F6D48);
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_1ACE677B4;
  uint64_t v26 = *(void *)(v0 + 224);
  return MEMORY[0x1F4187C78](v0 + 16, v26, v24);
}

uint64_t sub_1ACE677B4()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1ACE67C30;
  }
  else {
    uint64_t v2 = sub_1ACE678C8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1ACE678C8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 464) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    long long v3 = *(_OWORD *)(v0 + 40);
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    *(void *)(v0 + 72) = *(void *)(v0 + 24);
    *(void *)(v0 + 80) = v2;
    *(_OWORD *)(v0 + 88) = v3;
    *(void *)(v0 + 104) = v4;
    *(void *)(v0 + 112) = v5;
    sub_1ACE75428();
    sub_1ACE753C8();
    os_signpost_type_t v6 = sub_1ACE75428();
    os_signpost_type_t v7 = sub_1ACE76E18();
    if (sub_1ACE76FA8())
    {
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      uint64_t v9 = *(void *)(v0 + 352);
      uint64_t v10 = *(void *)(v0 + 296);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 400))(v9, *(void *)(v0 + 344), v10);
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      os_signpost_id_t v12 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v6, v7, v12, "ScoutingSignatureMatching", "", v11, 2u);
      MEMORY[0x1AD11B340](v11, -1, -1);

      v8(v9, v10);
    }
    else
    {
    }
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
    uint64_t v20 = *(void *)(v0 + 344);
    uint64_t v21 = *(void *)(v0 + 296);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 352), v20, v21);
    swift_allocObject();
    *(void *)(v0 + 472) = sub_1ACE75468();
    v19(v20, v21);
    os_log_type_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v22;
    *os_log_type_t v22 = v0;
    v22[1] = sub_1ACE67E34;
    return MEMORY[0x1F40F75F8](v1);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 280);
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v15 = *(void *)(v0 + 272);
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));
    sub_1ACE69BE0();
    swift_allocError();
    unsigned char *v16 = 1;
    swift_willThrow();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_1ACE67C30()
{
  *(void *)(v0 + 128) = *(void *)(v0 + 456);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7669F0);
  swift_willThrowTypedImpl();
  return MEMORY[0x1F4188298](sub_1ACE67CBC, 0, 0);
}

uint64_t sub_1ACE67CBC()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[34];
  uint64_t v5 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v6 = v0[28];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_signpost_type_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1ACE67E34(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 488) = a1;
  *(void *)(v4 + 496) = a2;
  *(unsigned char *)(v4 + 552) = a3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1ACE67F38, 0, 0);
}

uint64_t sub_1ACE67F38()
{
  uint64_t v1 = sub_1ACE75428();
  sub_1ACE75458();
  os_signpost_type_t v2 = sub_1ACE76E08();
  if (sub_1ACE76FA8())
  {
    uint64_t v3 = *(void *)(v0 + 192);
    uint64_t v4 = *(void *)(v0 + 160);
    uint64_t v5 = *(void *)(v0 + 168);
    swift_retain();
    sub_1ACE75488();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v3, v4) == *MEMORY[0x1E4FBD340])
    {
      uint64_t v6 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 192), *(void *)(v0 + 160));
      uint64_t v6 = "";
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
    os_signpost_type_t v7 = (void *)(v0 + 352);
    uint64_t v9 = *(void *)(v0 + 336);
    uint64_t v10 = *(void *)(v0 + 296);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 352), v9, v10);
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    os_signpost_id_t v12 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v1, v2, v12, "ScoutingSignatureMatching", v6, v11, 2u);
    MEMORY[0x1AD11B340](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {
    os_signpost_type_t v7 = (void *)(v0 + 336);
  }
  int v13 = *(unsigned __int8 *)(v0 + 552);
  (*(void (**)(void, void))(v0 + 432))(*v7, *(void *)(v0 + 296));
  if (v13)
  {
    if (v13 == 1)
    {
      uint64_t v86 = 0;
      unsigned int v85 = 2;
LABEL_32:
      os_signpost_type_t v77 = *(void **)(v0 + 488);
      int v78 = *(void **)(v0 + 496);
      uint64_t v79 = *(void *)(v0 + 280);
      uint64_t v87 = *(void *)(v0 + 272);
      uint64_t v88 = *(void *)(v0 + 288);
      uint64_t v81 = *(void *)(v0 + 232);
      uint64_t v80 = *(void *)(v0 + 240);
      uint64_t v82 = *(void *)(v0 + 224);
      unsigned __int8 v83 = *(unsigned char *)(v0 + 552);

      sub_1ACE69C50(v77, v78, v83);
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v80, v82);
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v88, v87);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v84 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
      return v84(v86, v85);
    }
    uint64_t v23 = *(void **)(v0 + 488);
    os_log_type_t v22 = *(void **)(v0 + 496);
    uint64_t v24 = *(void **)(v0 + 464);
    uint64_t v25 = *(void *)(v0 + 280);
    uint64_t v91 = *(void *)(v0 + 288);
    uint64_t v90 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 232);
    uint64_t v27 = *(void *)(v0 + 240);
    uint64_t v28 = *(void *)(v0 + 224);
    id v29 = v23;
    swift_willThrow();

    sub_1ACE69C50(v23, v22, 2u);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v91, v90);
  }
  else
  {
    id v14 = *(id *)(v0 + 488);
    sub_1ACE75428();
    sub_1ACE753C8();
    uint64_t v15 = sub_1ACE75428();
    os_signpost_type_t v16 = sub_1ACE76E18();
    if (sub_1ACE76FA8())
    {
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      uint64_t v18 = *(void *)(v0 + 352);
      uint64_t v19 = *(void *)(v0 + 296);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 400))(v18, *(void *)(v0 + 328), v19);
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      os_signpost_id_t v21 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v15, v16, v21, "ScoutingSignatureAlignment", "", v20, 2u);
      MEMORY[0x1AD11B340](v20, -1, -1);

      v17(v18, v19);
    }
    else
    {
    }
    uint64_t v30 = *(void *)(v0 + 456);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
    uint64_t v32 = *(void *)(v0 + 328);
    uint64_t v33 = *(void *)(v0 + 296);
    Swift::Double v35 = *(double *)(v0 + 136);
    Swift::Double v34 = *(double *)(v0 + 144);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 352), v32, v33);
    swift_allocObject();
    sub_1ACE75468();
    v31(v32, v33);
    uint64_t v36 = sub_1ACE69C9C(v14, v0 + 72, v35, v34);
    if (!v30)
    {
      uint64_t v44 = v36;
      unsigned int v45 = v37;
      os_log_type_t v46 = sub_1ACE75428();
      sub_1ACE75458();
      uint64_t v47 = sub_1ACE76E08();
      uint64_t v86 = v44;
      unsigned int v85 = v45;
      if (sub_1ACE76FA8())
      {
        uint64_t v48 = *(void *)(v0 + 184);
        uint64_t v50 = *(void *)(v0 + 160);
        uint64_t v49 = *(void *)(v0 + 168);
        swift_retain();
        sub_1ACE75488();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v49 + 88))(v48, v50) == *MEMORY[0x1E4FBD340])
        {
          unint64_t v51 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 160));
          unint64_t v51 = "";
        }
        uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
        uint64_t v70 = *(void *)(v0 + 320);
        uint64_t v71 = *(void *)(v0 + 296);
        (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 352), v70, v71);
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v72 = 0;
        os_signpost_id_t v73 = sub_1ACE753D8();
        _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v46, (os_signpost_type_t)v47, v73, "ScoutingSignatureAlignment", v51, v72, 2u);
        MEMORY[0x1AD11B340](v72, -1, -1);

        v69(v70, v71);
        uint64_t v53 = (uint64_t *)(v0 + 352);
      }
      else
      {
        uint64_t v53 = (uint64_t *)(v0 + 320);
      }
      uint64_t v74 = *v53;
      uint64_t v75 = *(void **)(v0 + 488);
      v76 = *(void **)(v0 + 496);
      (*(void (**)(uint64_t, void))(v0 + 432))(v74, *(void *)(v0 + 296));
      swift_release();
      sub_1ACE69C50(v75, v76, 0);
      goto LABEL_32;
    }
    uint64_t v38 = sub_1ACE75428();
    sub_1ACE75458();
    os_signpost_type_t v39 = sub_1ACE76E08();
    if (sub_1ACE76FA8())
    {
      uint64_t v40 = *(void *)(v0 + 168);
      uint64_t v41 = *(void *)(v0 + 176);
      uint64_t v42 = *(void *)(v0 + 160);
      swift_retain();
      sub_1ACE75488();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v40 + 88))(v41, v42) == *MEMORY[0x1E4FBD340])
      {
        unint64_t v43 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
        unint64_t v43 = "";
      }
      uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      uint64_t v55 = *(void *)(v0 + 312);
      uint64_t v56 = *(void *)(v0 + 296);
      (*(void (**)(void, uint64_t, uint64_t))(v0 + 400))(*(void *)(v0 + 352), v55, v56);
      os_log_type_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v57 = 0;
      os_signpost_id_t v58 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v38, v39, v58, "ScoutingSignatureAlignment", v43, v57, 2u);
      MEMORY[0x1AD11B340](v57, -1, -1);

      v54(v55, v56);
      uint64_t v52 = (uint64_t *)(v0 + 352);
    }
    else
    {
      uint64_t v52 = (uint64_t *)(v0 + 312);
    }
    uint64_t v59 = *v52;
    uint64_t v61 = *(void **)(v0 + 488);
    os_log_type_t v60 = *(void **)(v0 + 496);
    uint64_t v62 = *(void **)(v0 + 464);
    uint64_t v92 = *(void *)(v0 + 288);
    uint64_t v63 = *(void *)(v0 + 280);
    uint64_t v89 = *(void *)(v0 + 272);
    uint64_t v64 = *(void *)(v0 + 232);
    uint64_t v65 = *(void *)(v0 + 240);
    uint64_t v66 = *(void *)(v0 + 224);
    (*(void (**)(uint64_t, void))(v0 + 432))(v59, *(void *)(v0 + 296));
    swift_release();
    sub_1ACE69C50(v61, v60, 0);

    sub_1ACE69C50(v61, v60, 0);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v65, v66);
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v92, v89);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v67 = *(uint64_t (**)(void))(v0 + 8);
  return v67();
}

uint64_t AssetReaderScoutingAligner.deinit()
{
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  uint64_t v2 = sub_1ACE754C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AssetReaderScoutingAligner.__deallocating_deinit()
{
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  uint64_t v2 = sub_1ACE754C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1ACE68A00(double a1, double a2, double a3)
{
  os_signpost_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *os_signpost_type_t v7 = v3;
  v7[1] = sub_1ACE68AB0;
  return sub_1ACE64440(a1, a2, a3);
}

uint64_t sub_1ACE68AB0(double a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(__n128))(v7 + 8);
  if (!v1) {
    v4.n128_f64[0] = a1;
  }
  return v5(v4);
}

uint64_t sub_1ACE68BB0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1ACE75448();
  uint64_t v119 = *(void *)(v3 - 8);
  uint64_t v120 = v3;
  MEMORY[0x1F4188790](v3);
  v112 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v108 = (char *)&v107 - v6;
  MEMORY[0x1F4188790](v7);
  v111 = (char *)&v107 - v8;
  MEMORY[0x1F4188790](v9);
  unint64_t v11 = (char *)&v107 - v10;
  uint64_t v124 = sub_1ACE753F8();
  os_signpost_id_t v12 = *(void (***)(char *, char *, uint64_t))(v124 - 8);
  MEMORY[0x1F4188790](v124);
  v114 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v110 = (char *)&v107 - v15;
  MEMORY[0x1F4188790](v16);
  v113 = (char *)&v107 - v17;
  MEMORY[0x1F4188790](v18);
  v126 = (uint64_t *)((char *)&v107 - v19);
  MEMORY[0x1F4188790](v20);
  os_log_type_t v22 = (char *)&v107 - v21;
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)&v107 - v24;
  v123 = (void *)*a1;
  if (qword_1E99EFFA0 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1ACE75438();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_1E99F2D90);
  uint64_t v28 = sub_1ACE75428();
  sub_1ACE75458();
  os_signpost_type_t v29 = sub_1ACE76E08();
  if (sub_1ACE76FA8())
  {
    swift_retain();
    sub_1ACE75488();
    swift_release();
    uint64_t v31 = v119;
    uint64_t v30 = v120;
    if ((*(unsigned int (**)(char *, uint64_t))(v119 + 88))(v11, v120) == *MEMORY[0x1E4FBD340])
    {
      uint64_t v32 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v30);
      uint64_t v32 = "";
    }
    Swift::Double v35 = v22;
    uint64_t v36 = v22;
    uint64_t v37 = v124;
    v12[2](v35, v25, v124);
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    os_signpost_id_t v39 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v28, v29, v39, "ScoutingAssetRead", v32, v38, 2u);
    MEMORY[0x1AD11B340](v38, -1, -1);

    uint64_t v34 = v37;
    os_log_type_t v22 = v36;
    uint64_t v33 = v12[1];
    ((void (*)(char *, uint64_t))v33)(v25, v34);
    ((void (*)(char *, uint64_t))v33)(v36, v34);
  }
  else
  {

    uint64_t v33 = v12[1];
    uint64_t v34 = v124;
    ((void (*)(char *, uint64_t))v33)(v25, v124);
  }
  sub_1ACE75428();
  uint64_t v40 = v126;
  sub_1ACE753C8();
  uint64_t v118 = v27;
  uint64_t v41 = sub_1ACE75428();
  os_signpost_type_t v42 = sub_1ACE76E18();
  char v43 = sub_1ACE76FA8();
  v122 = v33;
  if (v43)
  {
    v125 = (char *)v12;
    unsigned int v45 = (char *)(v12 + 2);
    uint64_t v44 = v12[2];
    unint64_t v46 = (unint64_t)v45 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v44(v22, (char *)v126, v34);
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    os_signpost_id_t v48 = sub_1ACE753D8();
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v41, v42, v48, "ScoutingSignatureGeneration", "", v47, 2u);
    MEMORY[0x1AD11B340](v47, -1, -1);

    uint64_t v49 = v125;
    uint64_t v40 = v126;
    uint64_t v33 = v122;
    ((void (*)(char *, uint64_t))v122)(v22, v34);
  }
  else
  {

    uint64_t v49 = (char *)v12;
    uint64_t v50 = (char *)(v12 + 2);
    uint64_t v44 = v12[2];
    unint64_t v46 = (unint64_t)v50 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v116 = v44;
  unint64_t v115 = v46;
  v44(v22, (char *)v40, v34);
  sub_1ACE75478();
  swift_allocObject();
  uint64_t v51 = sub_1ACE75468();
  uint64_t v52 = v40;
  uint64_t v53 = v51;
  v117 = v49 + 8;
  ((void (*)(CMTimeEpoch *, uint64_t))v33)(v52, v34);
  v125 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F3BEC0]), sel_init);
  uint64_t v54 = v123;
  uint64_t v55 = v123[2];
  uint64_t v121 = v53;
  if (v55)
  {
    v113 = v22;
    uint64_t v56 = (void *)v123[4];
    os_log_type_t v57 = (char *)v123[5];
    uint64_t v58 = v123[6];
    uint64_t v60 = v123[7];
    CMTimeValue v59 = v123[8];
    uint64_t v61 = v123[9];
    CMTimeEpoch epoch = v123[10];
    swift_bridgeObjectRetain();
    id v63 = v56;
    lhs.value = 0;
    unsigned int v64 = objc_msgSend(v125, sel_appendBuffer_atTime_error_, v63, 0, &lhs);
    value = (void *)lhs.value;
    if (v64)
    {
      uint64_t v107 = v60;
      v111 = v57;
      uint64_t v66 = v54 + 17;
      while (1)
      {
        id v67 = value;

        if (!--v55) {
          break;
        }
        v126 = v66 + 7;
        CMTimeEpoch v68 = *v66;
        CMTimeValue v69 = *(v66 - 2);
        id v63 = (id)*(v66 - 6);
        uint64_t v70 = *(v66 - 1);
        rhs.CMTimeEpoch epoch = v68;
        lhs.value = v59;
        *(void *)&lhs.timescale = v61;
        lhs.CMTimeEpoch epoch = epoch;
        rhs.value = v69;
        *(void *)&rhs.timescale = v70;
        CMTimeAdd(&v127, &lhs, &rhs);
        CMTimeValue v59 = v127.value;
        uint64_t v61 = *(void *)&v127.timescale;
        CMTimeEpoch epoch = v127.epoch;
        lhs.value = 0;
        unsigned __int8 v71 = objc_msgSend(v125, sel_appendBuffer_atTime_error_, v63, 0, &lhs);
        value = (void *)lhs.value;
        uint64_t v66 = v126;
        if ((v71 & 1) == 0) {
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v92 = v125;
      id v93 = objc_msgSend(v125, sel_signature);

      v94 = v109;
      uint64_t v95 = v111;
      *uint64_t v109 = v93;
      v94[1] = v95;
      v94[2] = v58;
      v94[3] = v107;
      v94[4] = v59;
      v94[5] = v61;
      v94[6] = epoch;
      os_signpost_id_t v73 = sub_1ACE75428();
      uint64_t v74 = v110;
      sub_1ACE75458();
      os_signpost_type_t v75 = sub_1ACE76E08();
      char v96 = sub_1ACE76FA8();
      uint64_t v80 = v124;
      if (v96)
      {
        swift_retain();
        v76 = v108;
        sub_1ACE75488();
        swift_release();
        uint64_t v78 = v119;
        uint64_t v77 = v120;
        if ((*(unsigned int (**)(char *, uint64_t))(v119 + 88))(v76, v120) == *MEMORY[0x1E4FBD340])
        {
          uint64_t v81 = "[Error] Interval already ended";
          goto LABEL_34;
        }
        goto LABEL_33;
      }

      ((void (*)(char *, uint64_t))v122)(v74, v80);
    }
    else
    {
LABEL_17:
      id v72 = value;
      swift_bridgeObjectRelease();
      sub_1ACE74D78();

      swift_willThrow();
      os_signpost_id_t v73 = sub_1ACE75428();
      uint64_t v74 = v114;
      sub_1ACE75458();
      os_signpost_type_t v75 = sub_1ACE76E08();
      if (sub_1ACE76FA8())
      {
        swift_retain();
        v76 = v112;
        sub_1ACE75488();
        swift_release();
        uint64_t v78 = v119;
        uint64_t v77 = v120;
        int v79 = (*(uint64_t (**)(char *, uint64_t))(v119 + 88))(v76, v120);
        uint64_t v80 = v124;
        if (v79 == *MEMORY[0x1E4FBD340])
        {
          uint64_t v81 = "[Error] Interval already ended";
LABEL_34:
          v103 = v113;
          v116(v113, v74, v80);
          double v104 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)double v104 = 0;
          os_signpost_id_t v105 = sub_1ACE753D8();
          _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v73, v75, v105, "ScoutingSignatureGeneration", v81, v104, 2u);
          MEMORY[0x1AD11B340](v104, -1, -1);

          os_signpost_type_t v106 = v122;
          ((void (*)(char *, uint64_t))v122)(v74, v80);
          ((void (*)(char *, uint64_t))v106)(v103, v80);
          return swift_release();
        }
LABEL_33:
        (*(void (**)(char *, uint64_t))(v78 + 8))(v76, v77);
        uint64_t v81 = "";
        goto LABEL_34;
      }

      ((void (*)(char *, uint64_t))v122)(v74, v124);
    }
  }
  else
  {
    sub_1ACC98674();
    swift_allocError();
    *uint64_t v82 = 1;
    swift_willThrow();

    unsigned __int8 v83 = sub_1ACE75428();
    uint64_t v84 = v113;
    sub_1ACE75458();
    os_signpost_type_t v85 = sub_1ACE76E08();
    if (sub_1ACE76FA8())
    {
      swift_retain();
      uint64_t v86 = v111;
      sub_1ACE75488();
      swift_release();
      uint64_t v88 = v119;
      uint64_t v87 = v120;
      int v89 = (*(uint64_t (**)(char *, uint64_t))(v119 + 88))(v86, v120);
      uint64_t v90 = v124;
      if (v89 == *MEMORY[0x1E4FBD340])
      {
        uint64_t v91 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v88 + 8))(v86, v87);
        uint64_t v91 = "";
      }
      v116(v22, v84, v90);
      v97 = v84;
      os_signpost_id_t v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_signpost_id_t v98 = 0;
      os_signpost_id_t v99 = sub_1ACE753D8();
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v83, v85, v99, "ScoutingSignatureGeneration", v91, v98, 2u);
      MEMORY[0x1AD11B340](v98, -1, -1);

      uint64_t v100 = v97;
      uint64_t v101 = v122;
      ((void (*)(char *, uint64_t))v122)(v100, v90);
      ((void (*)(char *, uint64_t))v101)(v22, v90);
    }
    else
    {

      ((void (*)(char *, uint64_t))v33)(v84, v124);
    }
  }
  return swift_release();
}

void *sub_1ACE69834(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for AssetReader.StateController();
  uint64_t v7 = (void *)swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F4AB0);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 20) = 0;
  *(unsigned char *)(v8 + 16) = 0;
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v8;
  if (qword_1E99EFEB0 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_1E99F2638;
  type metadata accessor for AssetReader();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_OWORD *)(v10 + 64) = 0u;
  *(unsigned char *)(v10 + 80) = 1;
  *(void *)(v10 + 88) = 0;
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = v9;
  v3[2] = v10;
  v3[3] = a1;
  id v11 = objc_allocWithZone(MEMORY[0x1E4F3BEA0]);
  id v12 = v9;
  id v13 = a1;
  v3[4] = objc_msgSend(v11, sel_initWithCatalog_, a2);
  uint64_t v14 = (char *)v3 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  uint64_t v15 = sub_1ACE754C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a3, v15);
  return v3;
}

uint64_t sub_1ACE69994()
{
  return type metadata accessor for AssetReaderScoutingAligner();
}

uint64_t type metadata accessor for AssetReaderScoutingAligner()
{
  uint64_t result = qword_1E99F6D18;
  if (!qword_1E99F6D18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1ACE699E8()
{
  uint64_t result = sub_1ACE754C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AssetReaderScoutingAligner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssetReaderScoutingAligner);
}

uint64_t dispatch thunk of AssetReaderScoutingAligner.__allocating_init(asset:catalog:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AssetReaderScoutingAligner.align(at:within:)(double a1, double a2, double a3)
{
  id v13 = (uint64_t (*)(__n128, __n128, __n128))(*(void *)(*(void *)v3 + 120)
                                                       + **(int **)(*(void *)v3 + 120));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1ACA7699C;
  v9.n128_f64[0] = a1;
  v10.n128_f64[0] = a2;
  v11.n128_f64[0] = a3;
  return v13(v9, v10, v11);
}

unint64_t sub_1ACE69BE0()
{
  unint64_t result = qword_1E99F6D30;
  if (!qword_1E99F6D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E99F6D30);
  }
  return result;
}

uint64_t sub_1ACE69C34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1ACE68BB0(a1, a2);
}

void sub_1ACE69C50(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return;
    }

    a1 = a2;
  }
}

uint64_t sub_1ACE69C9C(void *a1, uint64_t a2, Swift::Double a3, Swift::Double a4)
{
  uint64_t v9 = sub_1ACE754C8();
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)&double v11 = MEMORY[0x1F4188790](v9).n128_u64[0];
  id v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(a1, sel_mediaItems, v11);
  sub_1ACA50D4C(0, &qword_1E99F49C0);
  unint64_t v15 = sub_1ACE76578();

  if (!(v15 >> 62))
  {
    uint64_t v16 = *(void **)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v16) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_1ACE77508();
  swift_bridgeObjectRelease();
  if (!v16) {
    goto LABEL_15;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v17 = (id)MEMORY[0x1AD119490](0, v15);
    goto LABEL_6;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v17 = *(id *)(v15 + 32);
LABEL_6:
    uint64_t v16 = v17;
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(v16, sel_signatureAlignments);
    if (v18)
    {
      uint64_t v19 = v18;
      sub_1ACA50D4C(0, &qword_1E99F49C8);
      unint64_t v15 = sub_1ACE76578();

      unint64_t v4 = sub_1ACA3A054(MEMORY[0x1E4FBC860]);
      if (qword_1E99EFEF0 == -1) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }

LABEL_16:
    sub_1ACE69BE0();
    swift_allocError();
    *uint64_t v25 = 0;
    swift_willThrow();
    return a2;
  }
  __break(1u);
LABEL_20:
  swift_once();
LABEL_8:
  uint64_t v20 = __swift_project_value_buffer(v9, (uint64_t)qword_1E99F2C10);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v20, v9);
  type metadata accessor for AssetReaderTimelineAlignment();
  swift_allocObject();
  sub_1ACA84ED4(v4, 0, 1, 3, 2000000000000000000, 0, (uint64_t)v13);
  sub_1ACA84FE8(v15);
  swift_bridgeObjectRelease();
  Swift::Double_optional v28 = AssetReaderTimelineAlignment.playerTimestamp(for:)(a3);
  if (v21)
  {
    Swift::Double_optional v29 = AssetReaderTimelineAlignment.referenceTimestamp(for:)(a4);
    double v22 = *(double *)&v29.is_nil;
    char v24 = v23;

    swift_release();
    if (v24) {
      *(double *)&a2 = 0.0;
    }
    else {
      *(double *)&a2 = a4 - v22 + a3;
    }
  }
  else
  {
    a2 = *(uint64_t *)&v28.is_nil;

    swift_release();
  }
  return a2;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingError()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingError;
}

uint64_t getEnumTagSinglePayload for AssetReaderScoutingAligner.ScoutingStep(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[16]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetReaderScoutingAligner.ScoutingStep(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)unint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingStep()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingStep;
}

unint64_t sub_1ACE6A09C()
{
  unint64_t result = qword_1E99F6D80;
  if (!qword_1E99F6D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6D80);
  }
  return result;
}

unsigned char *_s18PodcastsFoundation26AssetReaderScoutingAlignerC13ScoutingErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1ACE6A1BCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingStep.StepType()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingStep.StepType;
}

unint64_t sub_1ACE6A1F8()
{
  unint64_t result = qword_1E99F6D88;
  if (!qword_1E99F6D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6D88);
  }
  return result;
}

uint64_t MTBookmarksSyncType.description.getter(uint64_t a1)
{
  unint64_t v1 = 0xD00000000000001DLL;
  unint64_t v2 = 0xD00000000000001DLL;
  if (a1 == 1) {
    unint64_t v2 = 5067332;
  }
  if (a1 != 2) {
    unint64_t v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 5460818;
  }
}

uint64_t sub_1ACE6A2AC()
{
  uint64_t v1 = *v0;
  unint64_t v2 = 0xD00000000000001DLL;
  unint64_t v3 = 0xD00000000000001DLL;
  if (*v0 == 1) {
    unint64_t v3 = 5067332;
  }
  if (v1 != 2) {
    unint64_t v2 = v3;
  }
  if (v1) {
    return v2;
  }
  else {
    return 5460818;
  }
}

double ServerArtwork.__allocating_init(from:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_artworkWidth);
  if (v2)
  {
    unint64_t v3 = v2;
    sub_1ACE76A68();
  }
  id v4 = objc_msgSend(a1, sel_artworkHeight);
  if (v4)
  {
    uint64_t v5 = v4;
    sub_1ACE76A68();
  }
  id v6 = objc_msgSend(a1, sel_artworkTemplateURL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_1ACE761B8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(a1, sel_artworkPrimaryColor);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_1ACE761B8();
    uint64_t v15 = v14;

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(unsigned char *)(v16 + 24) = 1;
  *(void *)(v16 + 32) = 0;
  *(unsigned char *)(v16 + 40) = 1;
  *(void *)(v16 + 48) = v8;
  *(void *)(v16 + 56) = v10;
  *(void *)(v16 + 64) = v13;
  *(void *)(v16 + 72) = v15;
  double result = 0.0;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 128) = 0u;
  return result;
}

id static DeviceCapacityMonitor.shared.getter()
{
  if (qword_1EB767B50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB767B40;
  return v0;
}

uint64_t DeviceCapacityMonitor.addCapacityChangeObserver(options:callback:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  char v4 = a1;
  if (a1) {
    a1 = sub_1ACE6A698(a2, a3);
  }
  if ((v4 & 2) != 0)
  {
    id v6 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
    MEMORY[0x1F4188790](a1);
    MEMORY[0x1F4188790](v7);
    swift_retain();
    os_unfair_lock_lock(v6 + 6);
    sub_1ACDA2434((uint64_t)&v6[4]);
    os_unfair_lock_unlock(v6 + 6);
    swift_release();
  }
  return 0;
}

Swift::Void __swiftcall DeviceCapacityMonitor.removeCapacityChangeObserver(with:)(Swift::Int64 with)
{
  id v2 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  swift_retain();
  os_unfair_lock_lock(v2 + 6);
  sub_1ACE6F6C8((uint64_t)&v2[4]);
  os_unfair_lock_unlock(v2 + 6);
  swift_release();
}

uint64_t sub_1ACE6A698(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v5 = sub_1ACE75DC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1ACE75E48();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    uint64_t v13 = (uint64_t *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    uint64_t v14 = *v13;
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
    sub_1ACA30C84((void *)(v14 + 16), &v22);
    os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 24));
    uint64_t v15 = v22;
    swift_release();
    return a1(v15);
  }
  else
  {
    v21[1] = *(void *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    uint64_t v17 = swift_allocObject();
    v21[0] = v6;
    uint64_t v18 = v17;
    swift_unknownObjectWeakInit();
    uint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v18;
    v19[3] = a1;
    v19[4] = a2;
    aBlock[4] = sub_1ACE6F6F4;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1ACA6DA9C;
    aBlock[3] = &block_descriptor_54_4;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    sub_1ACE75E08();
    uint64_t v22 = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v12, v8, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_1ACE6AA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1ACD0B52C(v6);
  swift_bridgeObjectRelease();
  v14[0] = (uint64_t)v7;
  sub_1ACB4D900(v14);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v14[0] + 16);
  if (v8)
  {
    uint64_t v9 = *(void *)(v14[0] + 8 * v8 + 24);
    swift_release();
    uint64_t v10 = v9 + 1;
  }
  else
  {
    swift_release();
    uint64_t v10 = 1;
  }
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  sub_1ACD0F684(a1, a2, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v5 = v13;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v10;
}

uint64_t DeviceCapacityMonitor.CapacityLevel.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0x64657269736564;
    case 2:
      return 1819047270;
    case 1:
      return 7827308;
  }
  uint64_t result = sub_1ACE77A18();
  __break(1u);
  return result;
}

unint64_t DeviceCapacityMonitor.CapacityLevel.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_1ACE6ABE0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_1ACE6ABFC()
{
  uint64_t v1 = *v0;
  if (!*v0) {
    return 0x64657269736564;
  }
  if (v1 == 2) {
    return 1819047270;
  }
  if (v1 == 1) {
    return 7827308;
  }
  uint64_t result = sub_1ACE77A18();
  __break(1u);
  return result;
}

void *sub_1ACE6AC80()
{
  uint64_t v0 = sub_1ACE74F28();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(self, sel_managedAssetsDirectoryURL);
  sub_1ACE74E98();

  id v4 = objc_allocWithZone((Class)type metadata accessor for DeviceCapacityMonitor());
  uint64_t result = sub_1ACE6B76C(43200000, 0, (uint64_t)v2, 1);
  qword_1EB767B40 = (uint64_t)result;
  return result;
}

void *DeviceCapacityMonitor.activeNotificationName.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1ACE6E704((void **)(v2 + 16), &v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  id v3 = v5;
  swift_release();
  return v3;
}

void DeviceCapacityMonitor.activeNotificationName.setter(void *a1)
{
  sub_1ACE6F08C(a1);
}

uint64_t sub_1ACE6AF84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (os_unfair_lock_s **)(*a1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  id v4 = *v3;
  uint64_t v5 = (void **)&(*v3)[4];
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_1ACE6E704(v5, &v8);
  os_unfair_lock_unlock(v4 + 6);
  uint64_t v6 = v8;
  uint64_t result = swift_release();
  *a2 = v6;
  return result;
}

void sub_1ACE6B028(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1ACE76E78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = (void **)&(*v8)[4];
  swift_retain();
  os_unfair_lock_lock(v9 + 6);
  sub_1ACE6E704(v10, &v24);
  os_unfair_lock_unlock(v9 + 6);
  uint64_t v11 = v24;
  swift_release();
  if (!a1)
  {
    if (!v11) {
      return;
    }

    goto LABEL_9;
  }
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v12 = sub_1ACE761B8();
  uint64_t v14 = v13;
  if (v12 == sub_1ACE761B8() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  char v16 = sub_1ACE77848();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
LABEL_9:
    uint64_t v17 = OBJC_IVAR___MTDeviceCapacityMonitor_activeObserver;
    if (*(void *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_activeObserver))
    {
      swift_retain();
      sub_1ACE75848();
      swift_release();
    }
    if (a1)
    {
      uint64_t v18 = self;
      id v19 = a1;
      id v20 = objc_msgSend(v18, sel_defaultCenter);
      id v21 = v19;
      sub_1ACE76E68();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_1ACE6F5BC((unint64_t *)&qword_1EB768EF8, MEMORY[0x1E4F27FC8]);
      uint64_t v22 = sub_1ACE75D58();

      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      *(void *)(v2 + v17) = v22;
      swift_release();
    }
  }
}

void sub_1ACE6B304(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1AD11B470](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_1ACE6B358();
  }
}

uint64_t sub_1ACE6B358()
{
  uint64_t v1 = sub_1ACE75DC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1ACE75E48();
  uint64_t v5 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1ACE6F448;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_28_2;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_1ACE75E08();
  uint64_t v13 = MEMORY[0x1E4FBC860];
  sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v7, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

void (*DeviceCapacityMonitor.activeNotificationName.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = (os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = (void **)&(*v4)[4];
  swift_retain();
  os_unfair_lock_lock(v5 + 6);
  sub_1ACE6E704(v6, &v9);
  os_unfair_lock_unlock(v5 + 6);
  uint64_t v7 = v9;
  swift_release();
  v3[3] = v7;
  return sub_1ACE6B6F0;
}

void sub_1ACE6B6F0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = (void **)(*(void *)a1 + 24);
  uint64_t v3 = *v4;
  if (a2)
  {
    id v5 = v3;
    sub_1ACE6F08C(v3);

    uint64_t v3 = *v4;
  }
  else
  {
    sub_1ACE6F08C(*(void **)(*(void *)a1 + 24));
  }

  free(v2);
}

void *sub_1ACE6B76C(uint64_t a1, int a2, uint64_t a3, int a4)
{
  LODWORD(v70) = a4;
  uint64_t v80 = a3;
  int v79 = a2;
  uint64_t v78 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_1ACE75DC8();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v77 = v5;
  MEMORY[0x1F4188790](v5);
  os_signpost_type_t v75 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1ACE75DA8();
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x1F4188790](v64);
  uint64_t v62 = (uint64_t *)((char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = sub_1ACE75E88();
  uint64_t v66 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  uint64_t v61 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v65 = (char *)&v60 - v10;
  uint64_t v11 = sub_1ACE76CE8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1ACE76C78();
  MEMORY[0x1F4188790](v15);
  uint64_t v16 = sub_1ACE75E48();
  uint64_t v73 = *(void *)(v16 - 8);
  uint64_t v74 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue;
  uint64_t v67 = sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
  id v19 = v4;
  sub_1ACE75E28();
  uint64_t aBlock = MEMORY[0x1E4FBC860];
  sub_1ACE6F5BC((unint64_t *)&qword_1EB773180, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773160);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773170, (uint64_t *)&unk_1EB773160);
  sub_1ACE770E8();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCC58], v11);
  *(void *)((char *)v68 + v71) = sub_1ACE76D28();
  uint64_t v20 = OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB76B908);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = MEMORY[0x1E4FBC868];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB76A850);
  uint64_t v22 = swift_allocObject();
  *(_DWORD *)(v22 + 24) = 0;
  *(void *)(v22 + 16) = v21;
  *(void *)&v19[v20] = v22;
  *(void *)&v19[OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource] = 0;
  *(void *)&v19[OBJC_IVAR___MTDeviceCapacityMonitor_activeObserver] = 0;
  uint64_t v23 = OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB76A8B8);
  uint64_t v24 = swift_allocObject();
  *(_DWORD *)(v24 + 24) = 0;
  *(void *)(v24 + 16) = 0;
  *(void *)&v19[v23] = v24;
  uint64_t v25 = &v19[OBJC_IVAR___MTDeviceCapacityMonitor_capacityThreshold];
  *(void *)uint64_t v25 = v78;
  v25[8] = v79 & 1;
  uint64_t v26 = &v19[OBJC_IVAR___MTDeviceCapacityMonitor_url];
  uint64_t v27 = sub_1ACE74F28();
  uint64_t v28 = *(void *)(v27 - 8);
  Swift::Double_optional v29 = *(void (**)(char *, uint64_t))(v28 + 16);
  uint64_t v71 = v27;
  v29(v26, v80);
  uint64_t v30 = (uint64_t *)&v19[OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel];
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB76A860);
  uint64_t v31 = swift_allocObject();
  *(_DWORD *)(v31 + 24) = 0;
  *(void *)(v31 + 16) = 0;
  *uint64_t v30 = v31;

  v88.receiver = v19;
  v88.super_class = ObjectType;
  uint64_t v32 = (char *)objc_msgSendSuper2(&v88, sel_init);
  uint64_t v33 = v32;
  uint64_t v34 = &unk_1ACE84000;
  if (v70)
  {
    Swift::Double v35 = *(NSObject **)&v32[OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue];
    uint64_t v36 = v32;
    dispatch_suspend(v35);
    uint64_t ObjectType = (objc_class *)sub_1ACE76CF8();
    uint64_t v37 = v61;
    sub_1ACE75E78();
    uint64_t v38 = v62;
    *uint64_t v62 = 1;
    uint64_t v39 = v63;
    uint64_t v40 = v64;
    (*(void (**)(void *, void, uint64_t))(v63 + 104))(v38, *MEMORY[0x1E4FBCAE8], v64);
    uint64_t v70 = v28;
    uint64_t v41 = v65;
    MEMORY[0x1AD118090](v37, v38);
    (*(void (**)(void *, uint64_t))(v39 + 8))(v38, v40);
    CMTimeEpoch v68 = *(void (**)(char *, uint64_t))(v66 + 8);
    v68(v37, v72);
    uint64_t v42 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v86 = sub_1ACE6F648;
    uint64_t v87 = v42;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v83 = 1107296256;
    uint64_t v84 = sub_1ACA6DA9C;
    os_signpost_type_t v85 = &block_descriptor_79_2;
    char v43 = _Block_copy(&aBlock);
    swift_release();
    sub_1ACE75E08();
    uint64_t aBlock = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    uint64_t v44 = v18;
    unsigned int v45 = v75;
    uint64_t v46 = v77;
    sub_1ACE770E8();
    uint64_t v47 = ObjectType;
    MEMORY[0x1AD118E40](v41, v44, v45, v43);
    uint64_t v34 = (void *)&unk_1ACE84000;
    _Block_release(v43);

    os_signpost_id_t v48 = v45;
    uint64_t v18 = v44;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v48, v46);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v44, v74);
    uint64_t v49 = v41;
    uint64_t v28 = v70;
    v68(v49, v72);
  }
  else
  {
    uint64_t v50 = v32;
  }
  uint64_t v51 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = v78;
  *(void *)(v52 + 16) = v51;
  *(void *)(v52 + 24) = v53;
  *(unsigned char *)(v52 + 32) = v79 & 1;
  uint64_t v86 = sub_1ACE6F63C;
  uint64_t v87 = v52;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v83 = v34[141];
  uint64_t v84 = sub_1ACA6DA9C;
  os_signpost_type_t v85 = &block_descriptor_75;
  uint64_t v54 = _Block_copy(&aBlock);
  swift_retain();
  sub_1ACE75E08();
  uint64_t v81 = MEMORY[0x1E4FBC860];
  sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  uint64_t v55 = v18;
  uint64_t v56 = v75;
  uint64_t v57 = v77;
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v55, v56, v54);
  _Block_release(v54);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v56, v57);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v55, v74);
  swift_release();
  swift_release();
  if (sub_1ACE6C47C())
  {
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v80, v71);
  }
  else
  {
    sub_1ACE76BF8();
    if (qword_1EB772280 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v58 = (id)qword_1EB7720C8;
    sub_1ACE75388();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v80, v71);
  }
  return v33;
}

void sub_1ACE6C2D4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1AD11B470](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    dispatch_resume(*(dispatch_object_t *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue));
  }
}

void sub_1ACE6C334(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1AD11B470](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_beginAccess();
    URL.volumeAvailableCapacityForOpportunisticUsage()();
    swift_endAccess();
    uint64_t v4 = swift_beginAccess();
    MEMORY[0x1F4188790](v4);
    uint64_t v6 = v5 + 4;
    uint64_t v7 = v5 + 6;
    os_unfair_lock_lock(v5 + 6);
    sub_1ACE6F6F8(v6);
    os_unfair_lock_unlock(v7);
    swift_endAccess();
  }
}

BOOL sub_1ACE6C47C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v23 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1ACE75E48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = objc_retainAutoreleasedReturnValue(MT_makeDispatchSourceTypeVfs(*(dispatch_queue_t *)(v1
                                                                                           + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue)));
  if (v9)
  {
    uint64_t v20 = v5;
    *(void *)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource) = v9;
    uint64_t v22 = v9;
    uint64_t v21 = v9;
    swift_unknownObjectRelease();
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    Swift::Double_optional v29 = sub_1ACE6F650;
    uint64_t v30 = v10;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    v19[5] = &v27;
    uint64_t v27 = sub_1ACA6DA9C;
    uint64_t v28 = &block_descriptor_83_3;
    uint64_t v11 = _Block_copy(&aBlock);
    swift_retain();
    sub_1ACE75E08();
    uint64_t v24 = MEMORY[0x1E4FBC860];
    v19[4] = sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    v19[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    void v19[2] = sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    v19[1] = sub_1ACA50D4C(0, (unint64_t *)&qword_1EB772720);
    sub_1ACE76DB8();
    _Block_release(v11);
    uint64_t v12 = *(void (**)(char *, uint64_t))(v23 + 8);
    v23 += 8;
    v19[0] = v12;
    v12(v4, v2);
    uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v14 = v20;
    v13(v8, v20);
    swift_release();
    swift_release();
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    Swift::Double_optional v29 = sub_1ACE6F658;
    uint64_t v30 = v15;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_1ACA6DA9C;
    uint64_t v28 = &block_descriptor_87;
    uint64_t v16 = _Block_copy(&aBlock);
    swift_retain();
    sub_1ACE75E08();
    uint64_t v24 = MEMORY[0x1E4FBC860];
    sub_1ACE770E8();
    uint64_t v17 = v21;
    sub_1ACE76DC8();
    _Block_release(v16);
    ((void (*)(char *, uint64_t))v19[0])(v4, v2);
    v13(v8, v14);
    swift_release();
    swift_release();
    dispatch_resume(v17);

    uint64_t v9 = v22;
  }
  return v9 != 0;
}

uint64_t sub_1ACE6C8FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1ACE75DC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1ACE75E48();
  uint64_t v10 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x1AD11B470](a1 + 16);
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = sub_1ACE6CC14();
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
  uint64_t v16 = (void *)sub_1ACE76CF8();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a2;
  v17[3] = a3;
  v17[4] = v15;
  aBlock[4] = sub_1ACE6F3C8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_23_1;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1ACE75E08();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v12, v9, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v20);
}

uint64_t sub_1ACE6CC14()
{
  Swift::Int64 v1 = *(void *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor_capacityThreshold);
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor_capacityThreshold + 8);
  swift_beginAccess();
  Swift::Int64_optional v8 = URL.volumeAvailableCapacityForOpportunisticUsage()();
  Swift::Int64 value = v8.value;
  Swift::Bool is_nil = v8.is_nil;
  swift_endAccess();
  uint64_t result = 0;
  if (!is_nil)
  {
    if (v2)
    {
      if (value > 0) {
        return 0;
      }
    }
    else if (v1 < value)
    {
      return 0;
    }
    swift_beginAccess();
    Swift::Int_optional v9 = URL.volumeAvailableCapacity()();
    Swift::Int v6 = v9.value;
    Swift::Bool v7 = v9.is_nil;
    swift_endAccess();
    if (v7) {
      return 1;
    }
    if (v2)
    {
      if (v6 > 0) {
        return 1;
      }
    }
    else if (v1 < v6)
    {
      return 1;
    }
    return 2;
  }
  return result;
}

id DeviceCapacityMonitor.__deallocating_deinit()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1ACE75E48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  Swift::Int_optional v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource;
  if (*(void *)&v0[OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource])
  {
    swift_getObjectType();
    uint64_t v13 = v2;
    swift_unknownObjectRetain();
    sub_1ACE75E08();
    sub_1ACE6CFC4();
    sub_1ACE76DC8();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (*(void *)&v0[v10])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1ACE76DE8();
      swift_unknownObjectRelease();
    }
  }
  uint64_t v11 = *(void *)&v0[OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
  sub_1ACAD445C((uint64_t *)(v11 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
  swift_release();
  v14.receiver = v0;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_dealloc);
}

uint64_t sub_1ACE6CFC4()
{
  return sub_1ACE770E8();
}

uint64_t sub_1ACE6D184(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  swift_retain();
  uint64_t v8 = sub_1ACE6AA1C((uint64_t)sub_1ACE6F54C, v7);
  uint64_t result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t sub_1ACE6D280(void *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(*a1 + 16);
  swift_beginAccess();
  uint64_t v4 = sub_1ACA6A1FC(a2);
  uint64_t v5 = 0;
  if (v6)
  {
    unint64_t v7 = v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1ACD0A8AC();
      uint64_t v9 = v11;
    }
    uint64_t v5 = *(void *)(*(void *)(v9 + 56) + 16 * v7);
    sub_1ACB1DFF4(v7, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return sub_1ACA76F34(v5);
}

void sub_1ACE6D3F4(uint64_t a1)
{
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1ACE75E48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x1AD11B470](a1 + 16);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = *(void *)(v10 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource);
    swift_unknownObjectRetain();

    if (v12)
    {
      swift_getObjectType();
      uint64_t v13 = sub_1ACE76DD8();
      if (MT_isDispatchSourceDataVfsDesiredDisk(v13))
      {
        uint64_t v19 = v7;
        uint64_t v20 = v3;
        uint64_t v14 = 0;
      }
      else if (MT_isDispatchSourceDataVfsConstrainedDisk(v13))
      {
        uint64_t v19 = v7;
        uint64_t v20 = v3;
        uint64_t v14 = 1;
      }
      else
      {
        if (!MT_isDispatchSourceDataVfsFullDisk(v13))
        {
          swift_unknownObjectRelease();
          return;
        }
        uint64_t v19 = v7;
        uint64_t v20 = v3;
        uint64_t v14 = 2;
      }
      sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
      uint64_t v15 = (void *)sub_1ACE76CF8();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = a1;
      *(void *)(v16 + 24) = v14;
      aBlock[4] = sub_1ACE6F6A0;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1ACA6DA9C;
      aBlock[3] = &block_descriptor_96_0;
      uint64_t v17 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1ACE75E08();
      aBlock[0] = MEMORY[0x1E4FBC860];
      sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
      sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
      sub_1ACE770E8();
      MEMORY[0x1AD118ED0](0, v9, v5, v17);
      _Block_release(v17);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
    }
  }
}

void sub_1ACE6D778(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1AD11B470](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_1ACE6D7D4(a2);
  }
}

uint64_t sub_1ACE6D7D4(uint64_t a1)
{
  uint64_t v3 = sub_1ACE75DC8();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1ACE75E48();
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
  sub_1ACE6E6E4((void *)(v9 + 16), aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
  swift_release();
  swift_beginAccess();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_1ACD0B54C(v10);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a1;
  uint64_t v13[3] = v12;
  v13[4] = v11;
  if (*(void *)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    uint64_t v14 = (os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    uint64_t v15 = *v14 + 4;
    uint64_t v16 = *v14 + 6;
    swift_retain_n();
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v16);
    sub_1ACA30C84(v15, &v28);
    os_unfair_lock_unlock(v16);
    uint64_t v17 = v28;
    swift_release();
    sub_1ACE6E04C(v17, a1, v12, v11);
    swift_release();
    swift_release_n();
  }
  else
  {
    uint64_t v23 = *(void *)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    uint64_t v18 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v18;
    v19[3] = sub_1ACE6F4F0;
    v19[4] = v13;
    aBlock[4] = sub_1ACE6F6F4;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1ACA6DA9C;
    aBlock[3] = &block_descriptor_46_0;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1ACE75E08();
    uint64_t v28 = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    uint64_t v21 = v27;
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v8, v5, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v21);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
    swift_release();
    swift_release_n();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1ACE6DCA4(uint64_t a1)
{
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1ACE75E48();
  uint64_t v6 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE76BF8();
  if (qword_1EB772280 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v9 = (id)qword_1EB7720C8;
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1ACE75388();

  sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
  uint64_t v11 = (void *)sub_1ACE76CF8();
  aBlock[4] = sub_1ACE6F660;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACA6DA9C;
  aBlock[3] = &block_descriptor_90;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1ACE75E08();
  aBlock[0] = v10;
  sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
  sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
  sub_1ACE770E8();
  MEMORY[0x1AD118ED0](0, v8, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v14);
}

char *sub_1ACE6DFE8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t result = (char *)MEMORY[0x1AD11B470](v1);
  if (result)
  {
    *(void *)&result[OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource] = 0;

    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1ACE6E04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a1)
  {
    os_log_type_t v7 = sub_1ACE76BD8();
    if (qword_1EB772280 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v8 = (void *)qword_1EB7720C8;
    if (os_log_type_enabled((os_log_t)qword_1EB7720C8, v7))
    {
      id v9 = v8;
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v24[0] = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      if (a2)
      {
        if (a2 == 2)
        {
          unint64_t v12 = 0xE400000000000000;
          uint64_t v13 = 1819047270;
        }
        else
        {
          if (a2 != 1)
          {
            sub_1ACE77A18();
            __break(1u);
            return;
          }
          unint64_t v12 = 0xE300000000000000;
          uint64_t v13 = 7827308;
        }
      }
      else
      {
        unint64_t v12 = 0xE700000000000000;
        uint64_t v13 = 0x64657269736564;
      }
      v23[0] = sub_1ACA3189C(v13, v12, v24);
      sub_1ACE76FF8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AC9D5000, v9, v7, "Device capacity reached %s threshold, notifying observers.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD11B340](v11, -1, -1);
      MEMORY[0x1AD11B340](v10, -1, -1);
    }
    swift_beginAccess();
    uint64_t v14 = MEMORY[0x1AD11B470](a3 + 16);
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = swift_beginAccess();
      MEMORY[0x1F4188790](v16);
      uint64_t v18 = v17 + 4;
      uint64_t v19 = v17 + 6;
      os_unfair_lock_lock(v17 + 6);
      sub_1ACE6F500(v18);
      os_unfair_lock_unlock(v19);
      swift_endAccess();
    }
    uint64_t v20 = *(void *)(a4 + 16);
    if (v20)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = a4 + 40;
      do
      {
        uint64_t v22 = *(void (**)(uint64_t *))(v21 - 8);
        v23[0] = a2;
        swift_retain();
        v22(v23);
        swift_release();
        v21 += 16;
        --v20;
      }
      while (v20);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1ACE6E340(uint64_t a1)
{
  uint64_t v2 = sub_1ACE75DC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1ACE75E48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x1AD11B470](a1 + 16);
  if (result)
  {
    uint64_t v11 = (void *)result;
    uint64_t v12 = sub_1ACE6CC14();
    uint64_t v21 = v7;
    uint64_t v13 = v12;
    sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
    uint64_t v14 = sub_1ACE76CF8();
    uint64_t v20 = v6;
    uint64_t v15 = (void *)v14;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v11;
    *(void *)(v16 + 24) = v13;
    aBlock[4] = sub_1ACE6F488;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1ACA6DA9C;
    aBlock[3] = &block_descriptor_34_0;
    uint64_t v17 = _Block_copy(aBlock);
    id v18 = v11;
    swift_release();
    sub_1ACE75E08();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v9, v5, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v20);
  }
  return result;
}

id DeviceCapacityMonitor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DeviceCapacityMonitor.init()()
{
}

uint64_t sub_1ACE6E6E4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

id sub_1ACE6E704@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

uint64_t sub_1ACE6E734(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1ACE75DC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1ACE75E48();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (*(void *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    uint64_t v15 = (os_unfair_lock_s **)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    uint64_t v16 = *v15;
    uint64_t v17 = *v15 + 4;
    id v18 = a2;
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v16 + 6);
    sub_1ACA30C84(v17, &v30);
    os_unfair_lock_unlock(v16 + 6);
    uint64_t v19 = v30;
    swift_release();
    sub_1ACAFBB90(v19, (uint64_t)v18, a3);
  }
  else
  {
    uint64_t v29 = *(void *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    uint64_t v20 = swift_allocObject();
    uint64_t v28 = v7;
    uint64_t v21 = v20;
    swift_unknownObjectWeakInit();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v21;
    v22[3] = sub_1ACAFD068;
    v22[4] = v14;
    aBlock[4] = sub_1ACE6F6F4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1ACA6DA9C;
    aBlock[3] = &block_descriptor_68_3;
    uint64_t v23 = _Block_copy(aBlock);
    id v24 = a2;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1ACE75E08();
    uint64_t v30 = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    uint64_t v27 = v10;
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v13, v9, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v27);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1ACE6EB30(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_1ACE75DC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1ACE75E48();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  if (*(void *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    uint64_t v13 = (os_unfair_lock_s **)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    uint64_t v14 = *v13;
    uint64_t v15 = *v13 + 4;
    _Block_copy(a2);
    swift_retain();
    os_unfair_lock_lock(v14 + 6);
    sub_1ACA30C84(v15, &v26);
    os_unfair_lock_unlock(v14 + 6);
    uint64_t v16 = v26;
    swift_release();
    a2[2](a2, v16);
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    uint64_t v17 = swift_allocObject();
    uint64_t v24 = v5;
    uint64_t v18 = v17;
    swift_unknownObjectWeakInit();
    uint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v18;
    v19[3] = sub_1ACE6F6B0;
    v19[4] = v12;
    aBlock[4] = sub_1ACCA5760;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1ACA6DA9C;
    aBlock[3] = &block_descriptor_100;
    uint64_t v20 = _Block_copy(aBlock);
    _Block_copy(a2);
    swift_retain();
    swift_retain();
    sub_1ACE75E08();
    uint64_t v26 = MEMORY[0x1E4FBC860];
    sub_1ACE6F5BC((unint64_t *)&qword_1EB7734E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7734F0);
    uint64_t v23 = v8;
    sub_1ACAC5D64((unint64_t *)&qword_1EB773500, (uint64_t *)&unk_1EB7734F0);
    sub_1ACE770E8();
    MEMORY[0x1AD118ED0](0, v11, v7, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1ACE6EF1C(char a1, uint64_t a2, void *a3)
{
  *(void *)(swift_allocObject() + 16) = a3;
  uint64_t v6 = (uint64_t)_Block_copy(a3);
  if (a1) {
    uint64_t v6 = sub_1ACE6EB30(a2, (void (**)(void, void))a3);
  }
  if ((a1 & 2) != 0)
  {
    uint64_t v8 = *(os_unfair_lock_s **)(a2 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
    MEMORY[0x1F4188790](v6);
    MEMORY[0x1F4188790](v9);
    swift_retain();
    os_unfair_lock_lock(v8 + 6);
    sub_1ACE6F6C8((uint64_t)&v8[4]);
    os_unfair_lock_unlock(v8 + 6);
    swift_release();
  }
  swift_release();
  return 0;
}

uint64_t sub_1ACE6F08C(void *a1)
{
  sub_1ACE6B028(a1);
  uint64_t v3 = (os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  uint64_t v4 = (id *)&(*v3)[4];
  uint64_t v5 = *v3 + 6;
  id v6 = a1;
  os_unfair_lock_lock(v5);
  sub_1ACE6F3F8(v4);
  os_unfair_lock_unlock(v5);

  return swift_endAccess();
}

unint64_t sub_1ACE6F130()
{
  unint64_t result = qword_1E99F6DA0;
  if (!qword_1E99F6DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6DA0);
  }
  return result;
}

void sub_1ACE6F188(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1ACE6F08C(v1);
}

uint64_t sub_1ACE6F1D8()
{
  return type metadata accessor for DeviceCapacityMonitor();
}

uint64_t type metadata accessor for DeviceCapacityMonitor()
{
  uint64_t result = qword_1EB767B68;
  if (!qword_1EB767B68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1ACE6F22C()
{
  uint64_t result = sub_1ACE74F28();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DeviceCapacityMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DeviceCapacityMonitor);
}

ValueMetadata *type metadata accessor for DeviceCapacityMonitor.CapacityLevel()
{
  return &type metadata for DeviceCapacityMonitor.CapacityLevel;
}

uint64_t sub_1ACE6F31C()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1ACE6F354()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1ACE6F390()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1ACE6F3C8()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

id sub_1ACE6F3F8(id *a1)
{
  uint64_t v3 = **(void ***)(v1 + 16);

  *a1 = v3;
  return v3;
}

void sub_1ACE6F440(uint64_t a1)
{
  sub_1ACE6B304(a1, v1);
}

uint64_t sub_1ACE6F448()
{
  return sub_1ACE6E340(v0);
}

uint64_t sub_1ACE6F450()
{
  return swift_deallocObject();
}

uint64_t sub_1ACE6F488()
{
  return sub_1ACE6D7D4(*(void *)(v0 + 24));
}

uint64_t sub_1ACE6F4B0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1ACE6F4F0(uint64_t a1)
{
  sub_1ACE6E04C(a1, v1[2], v1[3], v1[4]);
}

void *sub_1ACE6F500(void *result)
{
  *uint64_t result = **(void **)(v1 + 16);
  return result;
}

uint64_t sub_1ACE6F514()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1ACE6F54C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1ACE6F578()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1ACE6F5BC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1ACE6F604()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1ACE6F63C()
{
  sub_1ACE6C334(*(void *)(v0 + 16));
}

void sub_1ACE6F648()
{
  sub_1ACE6C2D4(v0);
}

void sub_1ACE6F650()
{
  sub_1ACE6D3F4(v0);
}

uint64_t sub_1ACE6F658()
{
  return sub_1ACE6DCA4(v0);
}

char *sub_1ACE6F660()
{
  return sub_1ACE6DFE8(v0);
}

uint64_t sub_1ACE6F668()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1ACE6F6A0()
{
  sub_1ACE6D778(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1ACE6F6C8(uint64_t a1)
{
  return sub_1ACDA2434(a1);
}

void *sub_1ACE6F6F8(void *a1)
{
  return sub_1ACE6F500(a1);
}

void sub_1ACE6F710(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1ACE76558();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t type metadata accessor for MediaItemMetadataLoadingMock()
{
  return self;
}

uint64_t sub_1ACE6F890()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t StorageSpace.init(bytes:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static StorageSpace.zero.getter(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t StorageSpace.megabytes.getter()
{
  return *v0 >> 20;
}

uint64_t StorageSpace.init(integerLiteral:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *static StorageSpace.+= infix(_:_:)(void *result, void *a2)
{
  if (__CFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result += *a2;
  }
  return result;
}

void *static StorageSpace.+ infix(_:_:)@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__CFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + *a2;
  }
  return result;
}

unint64_t StorageSpace.init(megabytes:)@<X0>(unint64_t result@<X0>, void *a2@<X8>)
{
  if (result >> 54)
  {
    __break(1u);
  }
  else if ((result & 0x3FF00000000000) == 0)
  {
    *a2 = result << 20;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t StorageSpace.bytes.getter()
{
  return *(void *)v0;
}

uint64_t StorageSpace.kilobytes.getter()
{
  return *v0 >> 10;
}

uint64_t StorageSpace.gigabytes.getter()
{
  return *v0 >> 30;
}

unint64_t StorageSpace.init(kilobytes:)@<X0>(unint64_t result@<X0>, void *a2@<X8>)
{
  if (result >> 54) {
    __break(1u);
  }
  else {
    *a2 = result << 10;
  }
  return result;
}

unint64_t StorageSpace.init(gigabytes:)@<X0>(unint64_t result@<X0>, void *a2@<X8>)
{
  if (result >> 54)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((result & 0x3FF00000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if ((result & 0xFFC00000000) == 0)
  {
    *a2 = result << 30;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t StorageSpace.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1ACE77C68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_1ACE779B8();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t StorageSpace.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1ACE77C38();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    uint64_t v5 = sub_1ACE778B8();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    *a2 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1ACE6FAF8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1ACE77C38();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    uint64_t v5 = sub_1ACE778B8();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    *a2 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1ACE6FBAC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1ACE77C68();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_1ACE779B8();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

void *static StorageSpace.- infix(_:_:)@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result < *a2) {
    __break(1u);
  }
  else {
    *a3 = *result - *a2;
  }
  return result;
}

void *static StorageSpace.-= infix(_:_:)(void *result, void *a2)
{
  if (*result < *a2) {
    __break(1u);
  }
  else {
    *result -= *a2;
  }
  return result;
}

unint64_t *static StorageSpace.* infix(_:_:)@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, void *a3@<X8>)
{
  if (is_mul_ok(*result, *a2)) {
    *a3 = *result * *a2;
  }
  else {
    __break(1u);
  }
  return result;
}

BOOL static StorageSpace.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1ACE6FCB0@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__CFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + *a2;
  }
  return result;
}

void *sub_1ACE6FCCC(void *result, void *a2)
{
  if (__CFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result += *a2;
  }
  return result;
}

void *sub_1ACE6FCE8@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result < *a2) {
    __break(1u);
  }
  else {
    *a3 = *result - *a2;
  }
  return result;
}

void *sub_1ACE6FD04(void *result, void *a2)
{
  if (*result < *a2) {
    __break(1u);
  }
  else {
    *result -= *a2;
  }
  return result;
}

BOOL static StorageSpace.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

id StorageSpace.description.getter()
{
  id result = objc_msgSend(self, sel_stringWithBytesize_, *v0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_1ACE761B8();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1ACE6FDA8()
{
  unint64_t result = qword_1E99F6DB8;
  if (!qword_1E99F6DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6DB8);
  }
  return result;
}

id sub_1ACE6FDFC()
{
  id result = objc_msgSend(self, sel_stringWithBytesize_, *v0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_1ACE761B8();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageSpace()
{
  return &type metadata for StorageSpace;
}

void PFAutoBugCaptureBugReporter.prepare(bugReport:maximumFrequency:checkBlock:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 1107296256;
    v8[2] = sub_1ACE70098;
    v8[3] = &block_descriptor_101;
    uint64_t v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_msgSend(v4, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, a1, v7, dbl_1ACEAC010[v6]);
  _Block_release(v7);
}

PodcastsFoundation::BugReportFrequency_optional __swiftcall BugReportFrequency.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (PodcastsFoundation::BugReportFrequency_optional)rawValue;
}

uint64_t BugReportFrequency.rawValue.getter()
{
  return *v0;
}

PodcastsFoundation::BugReportFrequency_optional sub_1ACE6FF78(Swift::Int *a1)
{
  return BugReportFrequency.init(rawValue:)(*a1);
}

uint64_t PFAutoBugCaptureBugReporter.submit(bugReport:maximumFrequency:userInfo:)(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  v10[4] = sub_1ACE70164;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1ACE70098;
  v10[3] = &block_descriptor_3;
  uint64_t v8 = _Block_copy(v10);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, a1, v8, dbl_1ACEAC010[v6]);
  _Block_release(v8);
  return swift_release();
}

uint64_t sub_1ACE70098(uint64_t a1, void *aBlock)
{
  char v2 = *(void (**)(void (*)(), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1ACE70800, v4);
  swift_release();
  return swift_release();
}

uint64_t sub_1ACE7012C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ACE70164(uint64_t (*a1)(void))
{
  return a1(*(void *)(v1 + 16));
}

void sub_1ACE70194(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1ACE701B8(uint64_t a1, char *a2, uint64_t a3)
{
  return PFAutoBugCaptureBugReporter.submit(bugReport:maximumFrequency:userInfo:)(a1, a2, a3);
}

id PFBugReporterBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PFBugReporterBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PFBugReporterBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18PodcastsFoundation19PFBugReporterBridgeC23reportKeyIntegrityErroryyFZ_0()
{
  uint64_t v0 = (objc_class *)type metadata accessor for BugReport();
  id v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___PFBugReport_system] = 24;
  v1[OBJC_IVAR___PFBugReport_errorKind] = 4;
  v1[OBJC_IVAR___PFBugReport_forceSubmissionAttempt] = 0;
  v9.receiver = v1;
  v9.super_class = v0;
  id v2 = objc_msgSendSuper2(&v9, sel_init);
  id v3 = objc_msgSend(self, sel_sharedInstance);
  unint64_t v4 = sub_1ACA364E4(MEMORY[0x1E4FBC860]);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v8[4] = sub_1ACE7088C;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1ACE70098;
  v8[3] = &block_descriptor_22_4;
  uint64_t v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, v2, v6, 3600.0);
  _Block_release(v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s18PodcastsFoundation19PFBugReporterBridgeC31reportMissingFairPlayOfflineKeyyyFZ_0()
{
  uint64_t v0 = (objc_class *)type metadata accessor for BugReport();
  id v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___PFBugReport_system] = 24;
  v1[OBJC_IVAR___PFBugReport_errorKind] = 3;
  v1[OBJC_IVAR___PFBugReport_forceSubmissionAttempt] = 0;
  v9.receiver = v1;
  v9.super_class = v0;
  id v2 = objc_msgSendSuper2(&v9, sel_init);
  id v3 = objc_msgSend(self, sel_sharedInstance);
  unint64_t v4 = sub_1ACA364E4(MEMORY[0x1E4FBC860]);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v8[4] = sub_1ACE7088C;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1ACE70098;
  v8[3] = &block_descriptor_15_4;
  uint64_t v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, v2, v6, 3600.0);
  _Block_release(v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

unint64_t sub_1ACE70624()
{
  unint64_t result = qword_1E99F6DC0;
  if (!qword_1E99F6DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E99F6DC0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BugReportFrequency(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1ACE70744);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BugReportFrequency()
{
  return &type metadata for BugReportFrequency;
}

uint64_t dispatch thunk of BugReporter.prepare(bugReport:maximumFrequency:checkBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of BugReporter.submit(bugReport:maximumFrequency:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for PFBugReporterBridge()
{
  return self;
}

uint64_t sub_1ACE707C8()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1ACE70800()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_1ACE75FC8();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void *sub_1ACE70890(void *result)
{
  *unint64_t result = ++qword_1E9A22AF0;
  return result;
}

void sub_1ACE708B8(uint64_t a1)
{
  __asm { BRAA            X9, X10 }
}

uint64_t sub_1ACE708F4@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v3 = -769513831 * a2;
  int v4 = ((uint64_t (*)(void))qword_1F03A5070[-769513831 * a2 + 2])();
  qword_1F03A5070[v3 + 1](a1);
  if (v4 == 16) {
    unsigned int v5 = -42029;
  }
  else {
    unsigned int v5 = -42030;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

void sub_1ACE70984(uint64_t a1)
{
  __asm { BRAA            X10, X11 }
}

uint64_t sub_1ACE709CC@<X0>(int a1@<W8>)
{
  int v3 = (-21985942 * v1) | a1;
  uint64_t v4 = ((uint64_t (*)(uint64_t))qword_1F03A5070[v3 - 1])(200);
  return (*(uint64_t (**)(void))(v2 + 8 * (v3 + 2 * (v4 != 0))))();
}

uint64_t sub_1ACE70A38@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v8 = (*(uint64_t (**)(uint64_t, void))(v5 + 8 * (v6 + a2 * (v4 - 1) + 21985945)))(a1, 0);
  if (v8 == 16)
  {
    int v3 = 1537719254;
    goto LABEL_7;
  }
  if (v8 == 12)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v5 + 8 * (v4 + 21985943)))(a1);
    return (1510190423 * v3 + 277669913);
  }
  if (v8)
  {
    int v3 = 292433263;
    goto LABEL_7;
  }
  *uint64_t v2 = a1;
  int v3 = 1191165937;
  return (1510190423 * v3 + 277669913);
}

void fd3fa4R8(int a1, uint64_t a2)
{
  __asm { BRAA            X8, X10 }
}

uint64_t sub_1ACE70B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  int v20 = -191875503 * (v19 ^ 1) - 2 * v19 + 5;
  *(&a19 + 16 * (void)&a19 - 144 * (((unint64_t)&a9 - 0x36F214C141B3E0BELL) / 9) - 0x6F214C141B3E10D1) = *(unsigned char *)(qword_1E5E64B40[v20 + 6] + 8) ^ *(unsigned char *)(a2 + 15) ^ 0xD1 ^ *(unsigned char *)(qword_1E5E64B40[v20 + 1] + 13) ^ *(unsigned char *)(qword_1E5E64B40[v20 + 5] + 14);
  return (*(uint64_t (**)(void))(a5 + 8 * v20))();
}

void sub_1ACE70C68()
{
}

uint64_t sub_1ACE70C78()
{
  return 4294925273;
}

uint64_t getkSymptomDiagnosticReplySuccess_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getSDRDiagnosticReporterClass_block_invoke_cold_1(v0);
}

uint64_t __getSDRDiagnosticReporterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[MTEpisode(Core) setPodcastUuid:](v0);
}

uint64_t __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[IMAVSecureKeyLoader startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:](v0);
}

uint64_t sub_1ACE747E8()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_1ACE747F8()
{
  return MEMORY[0x1F40E2E70]();
}

uint64_t sub_1ACE74808()
{
  return MEMORY[0x1F40E2E90]();
}

uint64_t sub_1ACE74818()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1ACE74828()
{
  return MEMORY[0x1F40E2EC0]();
}

uint64_t sub_1ACE74838()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1ACE74848()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1ACE74858()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1ACE74868()
{
  return MEMORY[0x1F40E2F28]();
}

uint64_t sub_1ACE74878()
{
  return MEMORY[0x1F40E2F40]();
}

uint64_t sub_1ACE74888()
{
  return MEMORY[0x1F40E2F50]();
}

uint64_t sub_1ACE74898()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1ACE748A8()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1ACE748B8()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1ACE748C8()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1ACE748D8()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1ACE748E8()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1ACE748F8()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1ACE74908()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1ACE74918()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1ACE74928()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1ACE74938()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1ACE74948()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1ACE74958()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1ACE74968()
{
  return MEMORY[0x1F40E33E8]();
}

uint64_t sub_1ACE74978()
{
  return MEMORY[0x1F40E3400]();
}

uint64_t sub_1ACE74988()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1ACE74998()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1ACE749A8()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1ACE749B8()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1ACE749C8()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1ACE749D8()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1ACE749E8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1ACE749F8()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1ACE74A08()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1ACE74A18()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1ACE74A28()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1ACE74A38()
{
  return MEMORY[0x1F40E3660]();
}

uint64_t sub_1ACE74A48()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1ACE74A58()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1ACE74A68()
{
  return MEMORY[0x1F40E3688]();
}

uint64_t sub_1ACE74A78()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1ACE74A88()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1ACE74A98()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1ACE74AA8()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1ACE74AB8()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1ACE74AC8()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1ACE74AD8()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1ACE74AE8()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1ACE74AF8()
{
  return MEMORY[0x1F40E3798]();
}

uint64_t sub_1ACE74B08()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1ACE74B18()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1ACE74B28()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1ACE74B38()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1ACE74B48()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1ACE74B58()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1ACE74B68()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1ACE74B78()
{
  return MEMORY[0x1F40E3938]();
}

uint64_t sub_1ACE74B88()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1ACE74B98()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1ACE74BA8()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1ACE74BB8()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1ACE74BC8()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1ACE74BD8()
{
  return MEMORY[0x1F40E39D8]();
}

uint64_t sub_1ACE74BE8()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1ACE74BF8()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1ACE74C48()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1ACE74C58()
{
  return MEMORY[0x1F40E3FA0]();
}

uint64_t sub_1ACE74C68()
{
  return MEMORY[0x1F40E3FD0]();
}

uint64_t sub_1ACE74C78()
{
  return MEMORY[0x1F40E3FF0]();
}

uint64_t sub_1ACE74C88()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1ACE74C98()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1ACE74CA8()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1ACE74CB8()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1ACE74CC8()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1ACE74CD8()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1ACE74CE8()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1ACE74CF8()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1ACE74D58()
{
  return MEMORY[0x1F40E44F0]();
}

uint64_t sub_1ACE74D68()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1ACE74D78()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1ACE74D88()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1ACE74D98()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1ACE74DA8()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1ACE74DB8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1ACE74DC8()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1ACE74DD8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1ACE74DE8()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1ACE74DF8()
{
  return MEMORY[0x1F40E4948]();
}

uint64_t sub_1ACE74E08()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1ACE74E18()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1ACE74E28()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1ACE74E38()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1ACE74E48()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1ACE74E58()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1ACE74E68()
{
  return MEMORY[0x1F40E4A30]();
}

uint64_t sub_1ACE74E78()
{
  return MEMORY[0x1F40E4A40]();
}

uint64_t sub_1ACE74E88()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1ACE74E98()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1ACE74EA8()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1ACE74EB8()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1ACE74EC8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1ACE74ED8()
{
  return MEMORY[0x1F40E4AE8]();
}

uint64_t sub_1ACE74EE8()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1ACE74EF8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1ACE74F08()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1ACE74F18()
{
  return MEMORY[0x1F40E4B68]();
}

uint64_t sub_1ACE74F28()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1ACE74F38()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1ACE74F48()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1ACE74F58()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1ACE74F68()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1ACE74F78()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1ACE74F88()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1ACE74F98()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1ACE74FA8()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1ACE74FB8()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1ACE74FC8()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1ACE74FD8()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1ACE74FE8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1ACE74FF8()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1ACE75008()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1ACE75018()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1ACE75028()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1ACE75038()
{
  return MEMORY[0x1F40E51C0]();
}

uint64_t sub_1ACE75048()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1ACE75058()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1ACE75068()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1ACE75078()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1ACE75088()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1ACE75098()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1ACE750A8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1ACE750B8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1ACE750C8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1ACE750D8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1ACE750E8()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1ACE750F8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1ACE75108()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1ACE75118()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1ACE75128()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1ACE75138()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1ACE75148()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1ACE75158()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1ACE75168()
{
  return MEMORY[0x1F40E5910]();
}

uint64_t sub_1ACE75178()
{
  return MEMORY[0x1F40E5930]();
}

uint64_t sub_1ACE75188()
{
  return MEMORY[0x1F40E5950]();
}

uint64_t sub_1ACE75198()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1ACE751A8()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1ACE751B8()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1ACE751C8()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1ACE751D8()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1ACE751E8()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1ACE751F8()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1ACE75208()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1ACE75218()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1ACE75228()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1ACE75238()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_1ACE75248()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1ACE75258()
{
  return MEMORY[0x1F40E5E60]();
}

uint64_t sub_1ACE75268()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1ACE75278()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1ACE75288()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1ACE75298()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1ACE752A8()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1ACE752B8()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1ACE752C8()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1ACE752D8()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1ACE752E8()
{
  return MEMORY[0x1F4108B80]();
}

uint64_t sub_1ACE752F8()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1ACE75308()
{
  return MEMORY[0x1F41878B0]();
}

uint64_t sub_1ACE75318()
{
  return MEMORY[0x1F4187918]();
}

uint64_t sub_1ACE75328()
{
  return MEMORY[0x1F4187938]();
}

uint64_t sub_1ACE75338()
{
  return MEMORY[0x1F4187948]();
}

uint64_t sub_1ACE75348()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_1ACE75358()
{
  return MEMORY[0x1F4187990]();
}

uint64_t sub_1ACE75368()
{
  return MEMORY[0x1F41879B8]();
}

uint64_t sub_1ACE75378()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1ACE75388()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1ACE75398()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1ACE753A8()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1ACE753B8()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1ACE753C8()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1ACE753D8()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1ACE753E8()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1ACE753F8()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1ACE75418()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1ACE75428()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1ACE75438()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1ACE75448()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1ACE75458()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1ACE75468()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1ACE75478()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1ACE75488()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1ACE75498()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1ACE754A8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1ACE754B8()
{
  return MEMORY[0x1F4188690]();
}

uint64_t sub_1ACE754C8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1ACE754D8()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1ACE754E8()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1ACE754F8()
{
  return MEMORY[0x1F40D65F8]();
}

uint64_t sub_1ACE75508()
{
  return MEMORY[0x1F40D6600]();
}

uint64_t sub_1ACE75518()
{
  return MEMORY[0x1F40D6608]();
}

uint64_t sub_1ACE75528()
{
  return MEMORY[0x1F40D6620]();
}

uint64_t sub_1ACE75538()
{
  return MEMORY[0x1F40D6628]();
}

uint64_t sub_1ACE75548()
{
  return MEMORY[0x1F40D6630]();
}

uint64_t sub_1ACE75558()
{
  return MEMORY[0x1F40D6638]();
}

uint64_t sub_1ACE75568()
{
  return MEMORY[0x1F40D6640]();
}

uint64_t sub_1ACE75578()
{
  return MEMORY[0x1F40D6648]();
}

uint64_t sub_1ACE75588()
{
  return MEMORY[0x1F40D6650]();
}

uint64_t sub_1ACE75598()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1ACE755A8()
{
  return MEMORY[0x1F40D6670]();
}

uint64_t sub_1ACE755B8()
{
  return MEMORY[0x1F40D6680]();
}

uint64_t sub_1ACE755C8()
{
  return MEMORY[0x1F40D6688]();
}

uint64_t sub_1ACE755D8()
{
  return MEMORY[0x1F40D6690]();
}

uint64_t sub_1ACE755E8()
{
  return MEMORY[0x1F40D6698]();
}

uint64_t sub_1ACE755F8()
{
  return MEMORY[0x1F40D66A8]();
}

uint64_t sub_1ACE75608()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1ACE75618()
{
  return MEMORY[0x1F40D66D0]();
}

uint64_t sub_1ACE75628()
{
  return MEMORY[0x1F40D66D8]();
}

uint64_t sub_1ACE75638()
{
  return MEMORY[0x1F40D66F0]();
}

uint64_t sub_1ACE75648()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t sub_1ACE75658()
{
  return MEMORY[0x1F40D6718]();
}

uint64_t sub_1ACE75668()
{
  return MEMORY[0x1F40D6720]();
}

uint64_t sub_1ACE75678()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1ACE75688()
{
  return MEMORY[0x1F40D6750]();
}

uint64_t sub_1ACE75698()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1ACE756A8()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1ACE756B8()
{
  return MEMORY[0x1F40D6798]();
}

uint64_t sub_1ACE756C8()
{
  return MEMORY[0x1F40D67B0]();
}

uint64_t sub_1ACE756D8()
{
  return MEMORY[0x1F40D67D8]();
}

uint64_t sub_1ACE756E8()
{
  return MEMORY[0x1F40D67E0]();
}

uint64_t sub_1ACE756F8()
{
  return MEMORY[0x1F40D67E8]();
}

uint64_t sub_1ACE75708()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1ACE75718()
{
  return MEMORY[0x1F40D6818]();
}

uint64_t sub_1ACE75728()
{
  return MEMORY[0x1F40D6840]();
}

uint64_t sub_1ACE75738()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1ACE75748()
{
  return MEMORY[0x1F40D6890]();
}

uint64_t sub_1ACE75758()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1ACE75768()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1ACE75778()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1ACE75788()
{
  return MEMORY[0x1F40D68B8]();
}

uint64_t sub_1ACE75798()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1ACE757A8()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1ACE757B8()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t sub_1ACE757C8()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1ACE757D8()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1ACE757F8()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1ACE75808()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t sub_1ACE75818()
{
  return MEMORY[0x1F40D6938]();
}

uint64_t sub_1ACE75828()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1ACE75838()
{
  return MEMORY[0x1F40D6948]();
}

uint64_t sub_1ACE75848()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1ACE75858()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t sub_1ACE75868()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1ACE75878()
{
  return MEMORY[0x1F40D69E8]();
}

uint64_t sub_1ACE75888()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t sub_1ACE75898()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1ACE758A8()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t sub_1ACE758B8()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1ACE758C8()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1ACE758D8()
{
  return MEMORY[0x1F40D6A30]();
}

uint64_t sub_1ACE758E8()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1ACE758F8()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1ACE75908()
{
  return MEMORY[0x1F40D6A60]();
}

uint64_t sub_1ACE75918()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1ACE75928()
{
  return MEMORY[0x1F40D6A70]();
}

uint64_t sub_1ACE75938()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1ACE75948()
{
  return MEMORY[0x1F40D6A80]();
}

uint64_t sub_1ACE75958()
{
  return MEMORY[0x1F40D6A88]();
}

uint64_t sub_1ACE75968()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1ACE75978()
{
  return MEMORY[0x1F40D6AD8]();
}

uint64_t sub_1ACE75988()
{
  return MEMORY[0x1F40D6AE8]();
}

uint64_t sub_1ACE75998()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1ACE759A8()
{
  return MEMORY[0x1F40D6B08]();
}

uint64_t sub_1ACE759B8()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1ACE759C8()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1ACE759D8()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1ACE759E8()
{
  return MEMORY[0x1F40D6B30]();
}

uint64_t sub_1ACE759F8()
{
  return MEMORY[0x1F40D6B38]();
}

uint64_t sub_1ACE75A08()
{
  return MEMORY[0x1F40D6B40]();
}

uint64_t sub_1ACE75A18()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1ACE75A28()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1ACE75A38()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1ACE75A48()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1ACE75A58()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1ACE75A68()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1ACE75A78()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1ACE75A88()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1ACE75A98()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1ACE75AA8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1ACE75AB8()
{
  return MEMORY[0x1F40D6BC0]();
}

uint64_t sub_1ACE75AC8()
{
  return MEMORY[0x1F40D6BC8]();
}

uint64_t sub_1ACE75AD8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1ACE75AE8()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1ACE75AF8()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t sub_1ACE75B08()
{
  return MEMORY[0x1F40D6BF8]();
}

uint64_t sub_1ACE75B18()
{
  return MEMORY[0x1F40D6C10]();
}

uint64_t sub_1ACE75B28()
{
  return MEMORY[0x1F40D6C20]();
}

uint64_t sub_1ACE75B38()
{
  return MEMORY[0x1F40D6C28]();
}

uint64_t sub_1ACE75B48()
{
  return MEMORY[0x1F40D6C48]();
}

uint64_t sub_1ACE75B58()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1ACE75B68()
{
  return MEMORY[0x1F40D6C88]();
}

uint64_t sub_1ACE75B78()
{
  return MEMORY[0x1F40D6C90]();
}

uint64_t sub_1ACE75B88()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1ACE75B98()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1ACE75BA8()
{
  return MEMORY[0x1F40D6CC8]();
}

uint64_t sub_1ACE75BB8()
{
  return MEMORY[0x1F40D6CD0]();
}

uint64_t sub_1ACE75BC8()
{
  return MEMORY[0x1F40D6CD8]();
}

uint64_t sub_1ACE75BD8()
{
  return MEMORY[0x1F40D6CE8]();
}

uint64_t sub_1ACE75BE8()
{
  return MEMORY[0x1F40D6CF8]();
}

uint64_t sub_1ACE75BF8()
{
  return MEMORY[0x1F40D6D00]();
}

uint64_t sub_1ACE75C08()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1ACE75C18()
{
  return MEMORY[0x1F40D6D20]();
}

uint64_t sub_1ACE75C28()
{
  return MEMORY[0x1F40D6D30]();
}

uint64_t sub_1ACE75C38()
{
  return MEMORY[0x1F40D6D38]();
}

uint64_t sub_1ACE75C48()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1ACE75C58()
{
  return MEMORY[0x1F40D6D50]();
}

uint64_t sub_1ACE75C68()
{
  return MEMORY[0x1F40D6D58]();
}

uint64_t sub_1ACE75C78()
{
  return MEMORY[0x1F40D6D60]();
}

uint64_t sub_1ACE75C88()
{
  return MEMORY[0x1F40D6D68]();
}

uint64_t sub_1ACE75C98()
{
  return MEMORY[0x1F40D6D70]();
}

uint64_t sub_1ACE75CA8()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1ACE75CB8()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1ACE75CC8()
{
  return MEMORY[0x1F40D6D98]();
}

uint64_t sub_1ACE75CD8()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1ACE75CE8()
{
  return MEMORY[0x1F40D6DC0]();
}

uint64_t sub_1ACE75CF8()
{
  return MEMORY[0x1F40D6DD0]();
}

uint64_t sub_1ACE75D08()
{
  return MEMORY[0x1F40D6DD8]();
}

uint64_t sub_1ACE75D18()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1ACE75D28()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1ACE75D38()
{
  return MEMORY[0x1F40D6DF8]();
}

uint64_t sub_1ACE75D48()
{
  return MEMORY[0x1F40D6E08]();
}

uint64_t sub_1ACE75D58()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1ACE75D68()
{
  return MEMORY[0x1F40D6E20]();
}

uint64_t sub_1ACE75D78()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t sub_1ACE75D88()
{
  return MEMORY[0x1F40D6E38]();
}

uint64_t sub_1ACE75D98()
{
  return MEMORY[0x1F40D6E40]();
}

uint64_t sub_1ACE75DA8()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1ACE75DB8()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1ACE75DC8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1ACE75DD8()
{
  return MEMORY[0x1F4186CD0]();
}

uint64_t sub_1ACE75DE8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1ACE75DF8()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1ACE75E08()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1ACE75E18()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1ACE75E28()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1ACE75E38()
{
  return MEMORY[0x1F4186D50]();
}

uint64_t sub_1ACE75E48()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1ACE75E58()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1ACE75E68()
{
  return MEMORY[0x1F4186E18]();
}

uint64_t sub_1ACE75E78()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1ACE75E88()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1ACE75E98()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1ACE75EA8()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1ACE75EB8()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1ACE75EC8()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1ACE75ED8()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1ACE75EE8()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1ACE75EF8()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1ACE75F08()
{
  return MEMORY[0x1F41868F0]();
}

uint64_t sub_1ACE75F18()
{
  return MEMORY[0x1F41869E8]();
}

uint64_t sub_1ACE75F28()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1ACE75F38()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1ACE75F48()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1ACE75F58()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1ACE75F68()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1ACE75F78()
{
  return MEMORY[0x1F40E0540]();
}

uint64_t sub_1ACE75F88()
{
  return MEMORY[0x1F40E0550]();
}

uint64_t sub_1ACE75F98()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1ACE75FA8()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1ACE75FB8()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1ACE75FC8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1ACE75FD8()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_1ACE75FE8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1ACE75FF8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1ACE76008()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1ACE76018()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1ACE76028()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1ACE76038()
{
  return MEMORY[0x1F4183360]();
}

uint64_t sub_1ACE76048()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1ACE76058()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1ACE76068()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1ACE76078()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1ACE76088()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1ACE76098()
{
  return MEMORY[0x1F41834B0]();
}

uint64_t sub_1ACE760A8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1ACE760B8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1ACE760C8()
{
  return MEMORY[0x1F4183518]();
}

uint64_t sub_1ACE760D8()
{
  return MEMORY[0x1F4183550]();
}

uint64_t sub_1ACE760E8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1ACE760F8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1ACE76108()
{
  return MEMORY[0x1F4183678]();
}

uint64_t sub_1ACE76118()
{
  return MEMORY[0x1F4188400]();
}

uint64_t sub_1ACE76128()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1ACE76138()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1ACE76148()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1ACE76158()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1ACE76168()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1ACE76178()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1ACE76188()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1ACE76198()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1ACE761A8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1ACE761B8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1ACE761C8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1ACE761D8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1ACE761E8()
{
  return MEMORY[0x1F40E6228]();
}

uint64_t sub_1ACE761F8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1ACE76208()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1ACE76218()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1ACE76228()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1ACE76238()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1ACE76248()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1ACE76268()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1ACE76278()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1ACE76288()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1ACE76298()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1ACE762A8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1ACE762B8()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1ACE762C8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1ACE762D8()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1ACE762E8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1ACE762F8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1ACE76308()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1ACE76328()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1ACE76338()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1ACE76348()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1ACE76358()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1ACE76368()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1ACE76378()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1ACE76388()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1ACE76398()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1ACE763A8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1ACE763B8()
{
  return MEMORY[0x1F40D6E68]();
}

uint64_t sub_1ACE763C8()
{
  return MEMORY[0x1F4183BE0]();
}

uint64_t sub_1ACE763D8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1ACE763E8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1ACE763F8()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t sub_1ACE76408()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1ACE76418()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1ACE76428()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1ACE76438()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1ACE76448()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1ACE76458()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1ACE76468()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1ACE76478()
{
  return MEMORY[0x1F4183CC8]();
}

uint64_t sub_1ACE76488()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1ACE76498()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1ACE764A8()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1ACE764B8()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1ACE764C8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1ACE764D8()
{
  return MEMORY[0x1F4183D90]();
}

uint64_t sub_1ACE764E8()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1ACE764F8()
{
  return MEMORY[0x1F4183DB8]();
}

uint64_t sub_1ACE76508()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1ACE76518()
{
  return MEMORY[0x1F4183E08]();
}

uint64_t sub_1ACE76528()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1ACE76538()
{
  return MEMORY[0x1F4183E30]();
}

uint64_t sub_1ACE76548()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1ACE76558()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1ACE76568()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1ACE76578()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1ACE76588()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1ACE76598()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1ACE765A8()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1ACE765B8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1ACE765C8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1ACE765D8()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1ACE765E8()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1ACE765F8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1ACE76608()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1ACE76618()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1ACE76628()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1ACE76638()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1ACE76648()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1ACE76658()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1ACE76668()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1ACE76678()
{
  return MEMORY[0x1F4183F80]();
}

uint64_t sub_1ACE76688()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1ACE76698()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1ACE766A8()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1ACE766B8()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1ACE766C8()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1ACE766D8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1ACE766E8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1ACE766F8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1ACE76708()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1ACE76718()
{
  return MEMORY[0x1F4187C20]();
}

uint64_t sub_1ACE76728()
{
  return MEMORY[0x1F4187C30]();
}

uint64_t sub_1ACE76758()
{
  return MEMORY[0x1F4187C90]();
}

uint64_t sub_1ACE76768()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1ACE76778()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1ACE76788()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1ACE76798()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1ACE767A8()
{
  return MEMORY[0x1F4187CD8]();
}

uint64_t sub_1ACE767B8()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1ACE767C8()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1ACE767D8()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1ACE767E8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1ACE767F8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1ACE76808()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1ACE76818()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1ACE76828()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1ACE76838()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1ACE76848()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1ACE76858()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1ACE76868()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1ACE76878()
{
  return MEMORY[0x1F4187E10]();
}

uint64_t sub_1ACE76888()
{
  return MEMORY[0x1F4187E18]();
}

uint64_t sub_1ACE76898()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1ACE768B8()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t sub_1ACE768D8()
{
  return MEMORY[0x1F4187E50]();
}

uint64_t sub_1ACE768E8()
{
  return MEMORY[0x1F4187E60]();
}

uint64_t sub_1ACE768F8()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1ACE76908()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1ACE76918()
{
  return MEMORY[0x1F40E63D8]();
}

uint64_t sub_1ACE76928()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1ACE76938()
{
  return MEMORY[0x1F4184028]();
}

uint64_t sub_1ACE76948()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1ACE76958()
{
  return MEMORY[0x1F4184058]();
}

uint64_t sub_1ACE76968()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1ACE76978()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1ACE76988()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1ACE76998()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1ACE769A8()
{
  return MEMORY[0x1F4184108]();
}

uint64_t sub_1ACE769B8()
{
  return MEMORY[0x1F4184110]();
}

uint64_t sub_1ACE769C8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1ACE769D8()
{
  return MEMORY[0x1F4184160]();
}

uint64_t sub_1ACE769E8()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1ACE769F8()
{
  return MEMORY[0x1F4184188]();
}

uint64_t sub_1ACE76A08()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1ACE76A18()
{
  return MEMORY[0x1F41841B0]();
}

uint64_t sub_1ACE76A28()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1ACE76A38()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1ACE76A48()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1ACE76A58()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1ACE76A68()
{
  return MEMORY[0x1F40E64A0]();
}

uint64_t sub_1ACE76A78()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1ACE76A88()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1ACE76A98()
{
  return MEMORY[0x1F4184320]();
}

uint64_t sub_1ACE76AA8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1ACE76AB8()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1ACE76AC8()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1ACE76AD8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1ACE76AE8()
{
  return MEMORY[0x1F41843E8]();
}

uint64_t sub_1ACE76AF8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1ACE76B08()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_1ACE76B18()
{
  return MEMORY[0x1F41844B8]();
}

uint64_t sub_1ACE76B28()
{
  return MEMORY[0x1F41844F8]();
}

uint64_t sub_1ACE76B38()
{
  return MEMORY[0x1F40D9658]();
}

uint64_t sub_1ACE76B48()
{
  return MEMORY[0x1F4186A18]();
}

uint64_t sub_1ACE76B58()
{
  return MEMORY[0x1F4186A20]();
}

uint64_t sub_1ACE76B68()
{
  return MEMORY[0x1F4186A28]();
}

uint64_t sub_1ACE76B78()
{
  return MEMORY[0x1F4186A30]();
}

uint64_t sub_1ACE76B88()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1ACE76B98()
{
  return MEMORY[0x1F40E65D0]();
}

uint64_t sub_1ACE76BA8()
{
  return MEMORY[0x1F40E65E8]();
}

uint64_t sub_1ACE76BB8()
{
  return MEMORY[0x1F40E65F0]();
}

uint64_t sub_1ACE76BC8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1ACE76BD8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1ACE76BE8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1ACE76BF8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1ACE76C08()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1ACE76C18()
{
  return MEMORY[0x1F4186A60]();
}

uint64_t sub_1ACE76C28()
{
  return MEMORY[0x1F4186A90]();
}

uint64_t sub_1ACE76C38()
{
  return MEMORY[0x1F4186A98]();
}

uint64_t sub_1ACE76C48()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1ACE76C58()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1ACE76C68()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1ACE76C78()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1ACE76C88()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1ACE76C98()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1ACE76CA8()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1ACE76CB8()
{
  return MEMORY[0x1F4187060]();
}

uint64_t sub_1ACE76CC8()
{
  return MEMORY[0x1F4187070]();
}

uint64_t sub_1ACE76CD8()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1ACE76CE8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1ACE76CF8()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1ACE76D08()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1ACE76D18()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1ACE76D28()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1ACE76D38()
{
  return MEMORY[0x1F4187108]();
}

uint64_t sub_1ACE76D48()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1ACE76D58()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1ACE76D68()
{
  return MEMORY[0x1F4187188]();
}

uint64_t sub_1ACE76D78()
{
  return MEMORY[0x1F4187190]();
}

uint64_t sub_1ACE76D88()
{
  return MEMORY[0x1F41871A8]();
}

uint64_t sub_1ACE76D98()
{
  return MEMORY[0x1F41871B0]();
}

uint64_t sub_1ACE76DA8()
{
  return MEMORY[0x1F41871C8]();
}

uint64_t sub_1ACE76DB8()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1ACE76DC8()
{
  return MEMORY[0x1F41871F0]();
}

uint64_t sub_1ACE76DD8()
{
  return MEMORY[0x1F4187210]();
}

uint64_t sub_1ACE76DE8()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1ACE76DF8()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1ACE76E08()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1ACE76E18()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1ACE76E28()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1ACE76E38()
{
  return MEMORY[0x1F40E6758]();
}

uint64_t sub_1ACE76E48()
{
  return MEMORY[0x1F40E6768]();
}

uint64_t sub_1ACE76E58()
{
  return MEMORY[0x1F40E6778]();
}

uint64_t sub_1ACE76E68()
{
  return MEMORY[0x1F40E6780]();
}

uint64_t sub_1ACE76E78()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1ACE76E88()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1ACE76E98()
{
  return MEMORY[0x1F4187250]();
}

uint64_t sub_1ACE76EA8()
{
  return MEMORY[0x1F4187258]();
}

uint64_t sub_1ACE76EB8()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_1ACE76EC8()
{
  return MEMORY[0x1F40D7068]();
}

uint64_t sub_1ACE76ED8()
{
  return MEMORY[0x1F40D7070]();
}

uint64_t sub_1ACE76EE8()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1ACE76F08()
{
  return MEMORY[0x1F41872D8]();
}

uint64_t sub_1ACE76F18()
{
  return MEMORY[0x1F41872F8]();
}

uint64_t sub_1ACE76F28()
{
  return MEMORY[0x1F4186B10]();
}

uint64_t sub_1ACE76F38()
{
  return MEMORY[0x1F4186B50]();
}

uint64_t sub_1ACE76F48()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1ACE76F58()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1ACE76F68()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1ACE76F78()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1ACE76F88()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1ACE76F98()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1ACE76FA8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1ACE76FB8()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1ACE76FD8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1ACE76FE8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1ACE76FF8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1ACE77008()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1ACE77018()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1ACE77028()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1ACE77038()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1ACE77048()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1ACE77058()
{
  return MEMORY[0x1F40E6C78]();
}

uint64_t sub_1ACE77068()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1ACE77078()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1ACE77088()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_1ACE77098()
{
  return MEMORY[0x1F40E6D28]();
}

uint64_t sub_1ACE770A8()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1ACE770B8()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1ACE770C8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1ACE770E8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1ACE770F8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1ACE77108()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1ACE77118()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1ACE77128()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1ACE77138()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1ACE77148()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1ACE77158()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1ACE77168()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1ACE77178()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1ACE77188()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1ACE77198()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1ACE771A8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1ACE771B8()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1ACE771C8()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1ACE771D8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1ACE771E8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1ACE771F8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1ACE77208()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1ACE77218()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1ACE77228()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1ACE77238()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1ACE77248()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1ACE77258()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1ACE77268()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1ACE77278()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1ACE77288()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_1ACE77298()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1ACE772A8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1ACE772B8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1ACE772C8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1ACE772D8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1ACE772E8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1ACE772F8()
{
  return MEMORY[0x1F4184DB0]();
}

uint64_t sub_1ACE77308()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1ACE77318()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1ACE77328()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1ACE77338()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1ACE77348()
{
  return MEMORY[0x1F4184E10]();
}

uint64_t sub_1ACE77358()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1ACE77368()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1ACE77378()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1ACE77388()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1ACE77398()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1ACE773A8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1ACE773B8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1ACE773C8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1ACE773D8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1ACE773E8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1ACE773F8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1ACE77408()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1ACE77418()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1ACE77428()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1ACE77438()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1ACE77448()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1ACE77458()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1ACE77468()
{
  return MEMORY[0x1F4185160]();
}

uint64_t sub_1ACE77478()
{
  return MEMORY[0x1F4185168]();
}

uint64_t sub_1ACE77488()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1ACE77498()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1ACE774A8()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1ACE774B8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1ACE774C8()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1ACE774D8()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1ACE774E8()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1ACE774F8()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1ACE77508()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1ACE77518()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1ACE77528()
{
  return MEMORY[0x1F4185360]();
}

uint64_t sub_1ACE77538()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1ACE77548()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1ACE77558()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1ACE77568()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1ACE77578()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1ACE77598()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1ACE775A8()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1ACE775B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1ACE775D8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1ACE775E8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1ACE775F8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1ACE77608()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1ACE77618()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1ACE77628()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1ACE77638()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1ACE77648()
{
  return MEMORY[0x1F4185560]();
}

uint64_t sub_1ACE77658()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1ACE77668()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1ACE77678()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1ACE77688()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1ACE77698()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1ACE776A8()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1ACE776B8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1ACE776C8()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1ACE776D8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1ACE776E8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1ACE776F8()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1ACE77708()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1ACE77718()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1ACE77728()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1ACE77738()
{
  return MEMORY[0x1F4185688]();
}

uint64_t sub_1ACE77748()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1ACE77758()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1ACE77768()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1ACE77778()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1ACE77788()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1ACE77798()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1ACE777A8()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1ACE777B8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1ACE777C8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1ACE777F8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1ACE77808()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1ACE77818()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1ACE77828()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1ACE77838()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1ACE77848()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1ACE77858()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1ACE77868()
{
  return MEMORY[0x1F4185A60]();
}

uint64_t sub_1ACE77878()
{
  return MEMORY[0x1F4185A68]();
}

uint64_t sub_1ACE77888()
{
  return MEMORY[0x1F4185A78]();
}

uint64_t sub_1ACE77898()
{
  return MEMORY[0x1F4185A80]();
}

uint64_t sub_1ACE778A8()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1ACE778B8()
{
  return MEMORY[0x1F4185AB8]();
}

uint64_t sub_1ACE778C8()
{
  return MEMORY[0x1F4185AE8]();
}

uint64_t sub_1ACE778D8()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1ACE778E8()
{
  return MEMORY[0x1F4185AF8]();
}

uint64_t sub_1ACE778F8()
{
  return MEMORY[0x1F4185B00]();
}

uint64_t sub_1ACE77908()
{
  return MEMORY[0x1F4185B08]();
}

uint64_t sub_1ACE77918()
{
  return MEMORY[0x1F4185B10]();
}

uint64_t sub_1ACE77928()
{
  return MEMORY[0x1F4185B18]();
}

uint64_t sub_1ACE77938()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1ACE77948()
{
  return MEMORY[0x1F4185B28]();
}

uint64_t sub_1ACE77958()
{
  return MEMORY[0x1F4185B30]();
}

uint64_t sub_1ACE77968()
{
  return MEMORY[0x1F4185B38]();
}

uint64_t sub_1ACE77978()
{
  return MEMORY[0x1F4185B40]();
}

uint64_t sub_1ACE77988()
{
  return MEMORY[0x1F4185B48]();
}

uint64_t sub_1ACE77998()
{
  return MEMORY[0x1F4185B50]();
}

uint64_t sub_1ACE779A8()
{
  return MEMORY[0x1F4185B58]();
}

uint64_t sub_1ACE779B8()
{
  return MEMORY[0x1F4185B60]();
}

uint64_t sub_1ACE779C8()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1ACE779D8()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1ACE779E8()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1ACE77A18()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1ACE77A28()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1ACE77A38()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1ACE77A48()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1ACE77A58()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1ACE77A68()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1ACE77A98()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1ACE77AA8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1ACE77AB8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1ACE77AC8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1ACE77AD8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1ACE77AF8()
{
  return MEMORY[0x1F40E6E60]();
}

uint64_t sub_1ACE77B08()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1ACE77B18()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1ACE77B28()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1ACE77B38()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1ACE77B48()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1ACE77B58()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1ACE77B68()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1ACE77B78()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1ACE77B88()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1ACE77B98()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1ACE77BA8()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1ACE77BB8()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1ACE77BC8()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1ACE77BD8()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1ACE77BE8()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1ACE77BF8()
{
  return MEMORY[0x1F40D6E78]();
}

uint64_t sub_1ACE77C08()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1ACE77C18()
{
  return MEMORY[0x1F40E6ED8]();
}

uint64_t sub_1ACE77C28()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t sub_1ACE77C38()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1ACE77C48()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1ACE77C58()
{
  return MEMORY[0x1F4185FD0]();
}

uint64_t sub_1ACE77C68()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1ACE77C78()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1ACE77C88()
{
  return MEMORY[0x1F40E6F78]();
}

uint64_t sub_1ACE77C98()
{
  return MEMORY[0x1F40E6F88]();
}

uint64_t sub_1ACE77CA8()
{
  return MEMORY[0x1F40E6F98]();
}

uint64_t sub_1ACE77CB8()
{
  return MEMORY[0x1F4186130]();
}

uint64_t sub_1ACE77CC8()
{
  return MEMORY[0x1F4186138]();
}

uint64_t sub_1ACE77CD8()
{
  return MEMORY[0x1F4186160]();
}

uint64_t sub_1ACE77CE8()
{
  return MEMORY[0x1F4186180]();
}

uint64_t sub_1ACE77CF8()
{
  return MEMORY[0x1F4186188]();
}

uint64_t sub_1ACE77D08()
{
  return MEMORY[0x1F4186198]();
}

uint64_t sub_1ACE77D18()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1ACE77D48()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AMSError()
{
  return MEMORY[0x1F410A918]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9730]();
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

uint64_t CGImageSourceCreateWithFile()
{
  return MEMORY[0x1F40E99B0]();
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1F40DB4D8]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

uint64_t CacheDeleteEnumerateRemovedFilesInDirectories()
{
  return MEMORY[0x1F410DCC0]();
}

uint64_t CacheDeleteInitPurgeMarker()
{
  return MEMORY[0x1F410DCC8]();
}

uint64_t CacheDeleteRegisterPurgeNotification()
{
  return MEMORY[0x1F410DD00]();
}

uint64_t ICSiriGetSharedUserIDs()
{
  return MEMORY[0x1F4177C40]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F30](target, runLoop, runLoopMode);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1F40F6AB8](certificate, commonName);
}

OSStatus SecCertificateCopyEmailAddresses(SecCertificateRef certificate, CFArrayRef *emailAddresses)
{
  return MEMORY[0x1F40F6AE0](certificate, emailAddresses);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6B48](certificate, error);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1F40F71B8](trust);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1F40F71D8](trust);
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

uint64_t _CTServerConnectionCopyDataStatus()
{
  return MEMORY[0x1F40DF038]();
}

uint64_t _CTServerConnectionCopyOperatorName()
{
  return MEMORY[0x1F40DF078]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1F40DF1D0]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1F40DF218]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x1F40DF238]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1F40CBA50](object);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
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

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x1F40CC610](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x1F41825A8](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1F4181628](m, imp);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1F40CE228](a1, a2, a3, a4);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced()
{
  return MEMORY[0x1F41866D8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}