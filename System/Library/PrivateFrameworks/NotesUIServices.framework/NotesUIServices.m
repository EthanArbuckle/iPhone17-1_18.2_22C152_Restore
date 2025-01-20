unint64_t sub_257D9F268(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  long long v10;
  long long v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E138);
  v2 = sub_257DB0138();
  v3 = (void *)v2;
  v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_257D9FEB4(v6, (uint64_t)v15, &qword_26A05E140);
    result = sub_257D9F590((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_257D9FF18(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

ICNotesSharedIndexedViewHelper __swiftcall ICNotesSharedIndexedViewHelper.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (ICNotesSharedIndexedViewHelper)objc_msgSend(v0, sel_init);
}

id ICNotesSharedIndexedViewHelper.init()()
{
  v1.super_class = (Class)ICNotesSharedIndexedViewHelper;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t sub_257D9F590(uint64_t a1)
{
  uint64_t v2 = sub_257DB00C8();
  return sub_257D9F5D4(a1, v2);
}

unint64_t sub_257D9F5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_257D9FF28(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2C3450](v9, a1);
      sub_257D9FF84((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id _sSo30ICNotesSharedIndexedViewHelperC15NotesUIServicesE020makeNoteSearchResultD04with13attachmentURLSo28CSSearchableItemAttributeSetCSgSo017ICSearchIndexableI0_p_10Foundation0N0VSgtFZ_0(void *a1, uint64_t a2)
{
  uint64_t v38 = a2;
  uint64_t v3 = sub_257DAF8B8();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  ((void (*)(void))MEMORY[0x270FA5388])();
  char v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05F0);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v13 = (char *)&v38 - v12;
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v38 - v14;
  sub_257D9F268(MEMORY[0x263F8EE78]);
  id v16 = objc_allocWithZone(MEMORY[0x263F02AE8]);
  v17 = (void *)sub_257DAFF08();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithAttributes_, v17);

  v19 = self;
  id v20 = objc_msgSend(self, sel_noteSortTypeDefaultAscending);
  id v21 = objc_msgSend(v19, sel_dateForCurrentSortTypeForNote_folderNoteSortType_, a1, v20);

  if (v21)
  {
    sub_257DAF9B8();

    uint64_t v22 = sub_257DAF9C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_257DAF9C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
  }
  sub_257D9FCB8((uint64_t)v13, (uint64_t)v15);
  sub_257D9FEB4((uint64_t)v15, (uint64_t)v10, &qword_26B2E05F0);
  if (objc_msgSend(a1, sel_isSharedViaICloud)) {
    char v24 = 1;
  }
  else {
    char v24 = objc_msgSend(a1, sel_isSharedViaICloudFolder, v38);
  }
  uint64_t v25 = sub_257DAF998();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 1, 1, v25);
  id v26 = objc_allocWithZone((Class)type metadata accessor for NotesIndexSharedModel(0));
  v27 = (char *)NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)((uint64_t)v10, v24, 0, 0, (uint64_t)v7, 0);
  sub_257D9FEB4(v38, (uint64_t)v7, qword_26B2E0678);
  uint64_t v28 = (uint64_t)&v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  swift_beginAccess();
  sub_257D9FD20((uint64_t)v7, v28);
  swift_endAccess();
  id v29 = objc_msgSend(a1, sel_folderName);
  if (v29)
  {
    v30 = v29;
    uint64_t v31 = sub_257DAFF48();
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
  }
  v34 = (uint64_t *)&v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  swift_beginAccess();
  uint64_t *v34 = v31;
  v34[1] = v33;
  swift_bridgeObjectRelease();
  LOBYTE(v34) = objc_msgSend(a1, sel_hasUnreadChanges);
  v35 = &v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges];
  uint64_t v36 = swift_beginAccess();
  char *v35 = (char)v34;
  MEMORY[0x270FA5388](v36);
  *(&v38 - 2) = (uint64_t)v27;
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_257D9FE6C(&qword_26B2E0598, (void (*)(uint64_t))type metadata accessor for NotesSharedIndexedSearchView);
  sub_257DAF8A8();
  sub_257DB0068();

  (*(void (**)(char *, uint64_t))(v39 + 8))(v5, v40);
  sub_257D9FE10((uint64_t)v15, &qword_26B2E05F0);
  return v18;
}

unint64_t type metadata accessor for ICNotesSharedIndexedViewHelper()
{
  unint64_t result = qword_26A05E130;
  if (!qword_26A05E130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A05E130);
  }
  return result;
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

uint64_t sub_257D9FCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_257D9FD20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_257D9FD88@<X0>(uint64_t a1@<X8>)
{
  id v5 = *(id *)(v1 + 16);
  uint64_t v3 = sub_257D9FE6C(&qword_26B2E0630, (void (*)(uint64_t))type metadata accessor for NotesIndexSharedModel);
  NotesSharedIndexedSearchView.init(model:)((uint64_t)v5, v3, a1);
  return v5;
}

uint64_t sub_257D9FE10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_257D9FE6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_257D9FEB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_257D9FF18(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_257D9FF28(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_257D9FF84(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for NotesYellowHeaderView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_257DA001C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_257DA003C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets()
{
  if (!qword_26A05E148)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A05E148);
    }
  }
}

uint64_t MathNotesUpdateSafeAreaInsetsAction.performAction(forSceneController:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_delegate);
  if (!v2
    || (v38[0] = v2,
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E220),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E228),
        (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    return sub_257D9FE10((uint64_t)&v35, &qword_26A05E1B8);
  }
  if (!*((void *)&v36 + 1)) {
    return sub_257D9FE10((uint64_t)&v35, &qword_26A05E1B8);
  }
  sub_257DA05F0(&v35, (uint64_t)v38);
  id v3 = objc_msgSend(v1, sel_info);
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_objectForSetting_, 1);

  if (v5)
  {
    sub_257DB00A8();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)uint64_t v33 = 0u;
    long long v34 = 0u;
  }
  sub_257DA0658((uint64_t)v33, (uint64_t)&v35);
  if (!*((void *)&v36 + 1)) {
    goto LABEL_16;
  }
  sub_257DA4A2C(0, &qword_26A05E238);
  if ((swift_dynamicCast() & 1) == 0) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  id v7 = v33[0];
  objc_msgSend(v33[0], sel_UIEdgeInsetsValue);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = objc_msgSend(v1, sel_info);
  if (!v16)
  {
LABEL_15:
    long long v35 = 0u;
    long long v36 = 0u;
LABEL_16:
    sub_257D9FE10((uint64_t)&v35, &qword_26A05E230);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  v17 = v16;
  id v18 = objc_msgSend(v16, sel_objectForSetting_, 0);

  if (v18)
  {
    sub_257DB00A8();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)uint64_t v33 = 0u;
    long long v34 = 0u;
  }
  sub_257DA0658((uint64_t)v33, (uint64_t)&v35);
  if (!*((void *)&v36 + 1)) {
    goto LABEL_16;
  }
  sub_257DA4A2C(0, &qword_26A05E240);
  if (swift_dynamicCast())
  {
    id v19 = v33[0];
    char v20 = objc_msgSend(v33[0], sel_BOOLValue);

    id v21 = objc_msgSend(v1, sel_info);
    if (v21)
    {
      uint64_t v22 = v21;
      id v23 = objc_msgSend(v21, sel_objectForSetting_, 2);

      if (v23)
      {
        sub_257DB00A8();
        swift_unknownObjectRelease();
      }
      else
      {
        *(_OWORD *)uint64_t v33 = 0u;
        long long v34 = 0u;
      }
      sub_257DA0658((uint64_t)v33, (uint64_t)&v35);
      if (*((void *)&v36 + 1))
      {
        sub_257DA4A2C(0, &qword_26A05E250);
        if (swift_dynamicCast()) {
          id v24 = v33[0];
        }
        else {
          id v24 = 0;
        }
LABEL_31:
        id v25 = objc_msgSend(v1, sel_info, v33[0], v33[1], v34, v35, (void)v36);
        if (v25)
        {
          id v26 = v25;
          id v27 = objc_msgSend(v25, sel_objectForSetting_, 3);

          if (v27)
          {
            sub_257DB00A8();
            swift_unknownObjectRelease();
          }
          else
          {
            *(_OWORD *)uint64_t v33 = 0u;
            long long v34 = 0u;
          }
          sub_257DA0658((uint64_t)v33, (uint64_t)&v35);
          if (*((void *)&v36 + 1))
          {
            if (swift_dynamicCast())
            {
              id v28 = v33[0];
              goto LABEL_41;
            }
LABEL_40:
            id v28 = 0;
LABEL_41:
            id v29 = objc_msgSend(v1, sel_info, v33[0], v33[1], v34, v35, (void)v36);
            if (v29)
            {
              v30 = v29;
              id v31 = objc_msgSend(v29, sel_objectForSetting_, 4);

              if (v31)
              {
                sub_257DB00A8();
                swift_unknownObjectRelease();
              }
              else
              {
                *(_OWORD *)uint64_t v33 = 0u;
                long long v34 = 0u;
              }
              sub_257DA0658((uint64_t)v33, (uint64_t)&v35);
              if (*((void *)&v36 + 1))
              {
                sub_257DA4A2C(0, &qword_26A05E248);
                if (swift_dynamicCast()) {
                  id v32 = v33[0];
                }
                else {
                  id v32 = 0;
                }
                goto LABEL_51;
              }
            }
            else
            {
              long long v35 = 0u;
              long long v36 = 0u;
            }
            sub_257D9FE10((uint64_t)&v35, &qword_26A05E230);
            id v32 = 0;
LABEL_51:
            __swift_project_boxed_opaque_existential_1(v38, v38[3]);
            sub_257DA3364(v20, v24, (uint64_t)v32, v9, v11, v13, v15, *(double *)&v28);

            return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
          }
        }
        else
        {
          long long v35 = 0u;
          long long v36 = 0u;
        }
        sub_257D9FE10((uint64_t)&v35, &qword_26A05E230);
        goto LABEL_40;
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    sub_257D9FE10((uint64_t)&v35, &qword_26A05E230);
    id v24 = 0;
    goto LABEL_31;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
}

uint64_t sub_257DA05F0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
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

uint64_t sub_257DA0658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(safeAreaInsets:isModeButtonHidden:animationSettings:animationDuration:animationFenceHandle:)(double a1, double a2, double a3, double a4, uint64_t a5, void *a6, void *a7)
{
  double v8 = v7;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  sub_257DA4A2C(0, &qword_26A05E240);
  id v16 = (void *)sub_257DB0078();
  objc_msgSend(v15, sel_setObject_forSetting_, v16, 0);

  id v17 = objc_msgSend(self, sel_valueWithUIEdgeInsets_, a1, a2, a3, a4);
  objc_msgSend(v15, sel_setObject_forSetting_, v17, 1);

  objc_msgSend(v15, sel_setObject_forSetting_, a6, 2);
  id v18 = (void *)sub_257DB0018();
  objc_msgSend(v15, sel_setObject_forSetting_, v18, 3);

  if (a7) {
    objc_msgSend(v15, sel_setObject_forSetting_, a7, 4);
  }
  id v19 = objc_allocWithZone(v8);
  id v20 = v15;
  id v21 = objc_msgSend(v19, sel_initWithInfo_responder_, v20, 0);

  return v21;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(info:responder:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithInfo_responder_, a1, a2);

  return v5;
}

id MathNotesUpdateSafeAreaInsetsAction.init(info:responder:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)swift_getObjectType();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithInfo_responder_, a1, a2);

  return v5;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  if (a3)
  {
    v13[4] = a3;
    v13[5] = a4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_257DA0B18;
    v13[3] = &block_descriptor;
    double v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    double v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v10, a5);

  _Block_release(v10);
  return v11;
}

void sub_257DA0B18(uint64_t a1, void *a2)
{
  long long v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id MathNotesUpdateSafeAreaInsetsAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v16[4] = a3;
    v16[5] = a4;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_257DA0B18;
    v16[3] = &block_descriptor_3;
    double v13 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
  else
  {
    double v13 = 0;
  }
  v17.receiver = v6;
  v17.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v17, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v13, a5);
  sub_257DA3618(a3);

  _Block_release(v13);
  return v14;
}

id MathNotesUpdateSafeAreaInsetsAction.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(xpcDictionary:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(v1), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v2;
}

id MathNotesUpdateSafeAreaInsetsAction.init(xpcDictionary:)(uint64_t a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v3;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MathNotesUpdateSafeAreaInsetsAction.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_257DA0F18(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v7.receiver = a1;
  v7.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id MathNotesUpdateSafeAreaInsetsAction.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_257DA0FA0()
{
  id v0 = (id)ICNotesAppBundleIdentifier();
  if (!v0)
  {
    sub_257DAFF48();
    id v0 = (id)sub_257DAFF38();
    swift_bridgeObjectRelease();
  }
  id v1 = objc_msgSend(self, sel_applicationWithBundleIdentifier_, v0);

  qword_26A05E1B0 = (uint64_t)v1;
}

uint64_t sub_257DA107C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_257DB0128())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x25A2C3470](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_257DB0028();
      char v7 = sub_257DB0088();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_257DB0088();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x25A2C3470](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_257DB0088();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_257DA11F4(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x25A2C3B50](a1+ OBJC_IVAR____TtCC15NotesUIServices30MathNotesHostingViewControllerP33_82644AFB0C2F2CCE6D5FA1AE07FA364223AppProtectionController_hostingViewController);
  if (v1)
  {
    uint64_t v6 = (char *)v1;
    if (qword_26A05E120 != -1) {
      swift_once();
    }
    objc_super v2 = (void *)qword_26A05E1B0;
    if (objc_msgSend(self, sel_isMainThread))
    {
      if (objc_msgSend(v2, sel_isLocked))
      {
        sub_257DA2100();
        uint64_t v3 = v6;
      }
      else
      {
        uint64_t v4 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
        objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView], sel_removeFromSuperview);
        id v5 = *(void **)&v6[v4];
        *(void *)&v6[v4] = 0;

        uint64_t v3 = v5;
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_257DA12FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_257DA13F0()
{
  return sub_257DA3C10(0, type metadata accessor for MathNotesHostingViewController.AppProtectionController);
}

id sub_257DA141C()
{
  uint64_t v1 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController);
  }
  else
  {
    uint64_t v4 = (objc_class *)type metadata accessor for MathNotesHostingViewController.AppProtectionController();
    id v5 = objc_allocWithZone(v4);
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    v10.receiver = v5;
    v10.super_class = v4;
    id v6 = objc_msgSendSuper2(&v10, sel_init);
    char v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id MathNotesHostingViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id MathNotesHostingViewController.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView] = 0;
  id v1 = &v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate];
  uint64_t v2 = (objc_class *)type metadata accessor for MathNotesHostingViewController();
  *(_OWORD *)id v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t sub_257DA16A4(uint64_t a1, void *a2)
{
  sub_257DA364C(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_257DA36B4((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_257DA170C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  return sub_257DA364C(v3, a1);
}

uint64_t sub_257DA1760(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_257DA36B4(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_257DA17BC())()
{
  return j__swift_endAccess;
}

void sub_257DA18E0(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E280);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (objc_class *)type metadata accessor for MathNotesHostingViewController();
  v21.receiver = v1;
  v21.super_class = v6;
  objc_msgSendSuper2(&v21, sel_viewIsAppearing_, a1 & 1);
  id v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_msgSend(v7, sel_window);

    if (v9)
    {
      id v10 = objc_msgSend(v9, sel_windowScene);

      if (v10)
      {
        char v11 = self;
        id v12 = objc_msgSend(v11, sel_defaultCenter);
        objc_msgSend(v12, sel_addObserver_selector_name_object_, v1, sel_sceneDidEnterBackground_, *MEMORY[0x263F83930], v10);

        id v13 = objc_msgSend(v11, sel_defaultCenter);
        objc_msgSend(v13, sel_addObserver_selector_name_object_, v1, sel_sceneWillEnterForeground_, *MEMORY[0x263F83958], v10);
      }
    }
    if (qword_26A05E120 != -1) {
      swift_once();
    }
    if (objc_msgSend((id)qword_26A05E1B0, sel_isLocked))
    {
      sub_257DA2100();
      uint64_t v14 = sub_257DB0008();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
      sub_257DAFFE8();
      id v15 = v1;
      uint64_t v16 = sub_257DAFFD8();
      objc_super v17 = (void *)swift_allocObject();
      uint64_t v18 = MEMORY[0x263F8F500];
      v17[2] = v16;
      v17[3] = v18;
      v17[4] = v15;
      sub_257DA2A60((uint64_t)v5, (uint64_t)&unk_26A05E290, (uint64_t)v17);
      swift_release();
    }
    else
    {
      uint64_t v19 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
      objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView], sel_removeFromSuperview);
      id v20 = *(void **)&v1[v19];
      *(void *)&v1[v19] = 0;
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_257DA1BF4(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for MathNotesHostingViewController();
  objc_msgSendSuper2(&v10, sel_viewWillDisappear_, a1 & 1);
  id v3 = objc_msgSend(v1, sel_view);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_window);

    if (v5)
    {
      id v6 = objc_msgSend(v5, sel_windowScene);

      if (v6)
      {
        id v7 = self;
        id v8 = objc_msgSend(v7, sel_defaultCenter);
        objc_msgSend(v8, sel_removeObserver_name_object_, v1, *MEMORY[0x263F83930], v6);

        id v9 = objc_msgSend(v7, sel_defaultCenter);
        objc_msgSend(v9, sel_removeObserver_name_object_, v1, *MEMORY[0x263F83958], v6);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_257DA1D8C()
{
  if (qword_26A05E120 != -1) {
    swift_once();
  }
  if (objc_msgSend((id)qword_26A05E1B0, sel_isLocked))
  {
    sub_257DA2100();
  }
  else
  {
    uint64_t v1 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView), sel_removeFromSuperview);
    uint64_t v2 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = 0;
  }
}

void sub_257DA1E54()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E280);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A05E120 != -1) {
    swift_once();
  }
  if (objc_msgSend((id)qword_26A05E1B0, sel_isLocked))
  {
    sub_257DA2100();
    uint64_t v4 = sub_257DB0008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    sub_257DAFFE8();
    id v5 = v0;
    uint64_t v6 = sub_257DAFFD8();
    id v7 = (void *)swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8F500];
    v7[2] = v6;
    v7[3] = v8;
    v7[4] = v5;
    sub_257DA2A60((uint64_t)v3, (uint64_t)&unk_26A05E390, (uint64_t)v7);
    swift_release();
  }
  else
  {
    uint64_t v9 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView], sel_removeFromSuperview);
    objc_super v10 = *(void **)&v0[v9];
    *(void *)&v0[v9] = 0;
  }
}

uint64_t sub_257DA2014(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = sub_257DAF8D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257DAF8C8();
  id v10 = a1;
  a4();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_257DA2100()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
  if (*(void *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView])
  {
    self;
    id v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      objc_msgSend(v3, sel_resetShield);
      return;
    }
  }
  if (qword_26A05E120 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25238]), sel_initWithApplication_, qword_26A05E1B0);
  id v5 = sub_257DA141C();
  objc_msgSend(v4, sel_setDelegate_, v5);

  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  objc_msgSend(v6, sel_addSubview_, v4);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_257DB0A10;
  id v9 = objc_msgSend(v4, sel_leadingAnchor);
  id v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_leadingAnchor);

  id v13 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v12);
  *(void *)(v8 + 32) = v13;
  id v14 = objc_msgSend(v4, sel_trailingAnchor);
  id v15 = objc_msgSend(v1, sel_view);
  if (!v15)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  id v17 = objc_msgSend(v15, sel_trailingAnchor);

  id v18 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v17);
  *(void *)(v8 + 40) = v18;
  id v19 = objc_msgSend(v4, sel_topAnchor);
  id v20 = objc_msgSend(v1, sel_view);
  if (!v20)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_super v21 = v20;
  id v22 = objc_msgSend(v20, sel_topAnchor);

  id v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v22);
  *(void *)(v8 + 48) = v23;
  id v24 = objc_msgSend(v4, sel_bottomAnchor);
  id v25 = objc_msgSend(v1, sel_view);
  if (!v25)
  {
LABEL_20:
    __break(1u);
    return;
  }
  id v26 = v25;
  id v27 = self;
  id v28 = objc_msgSend(v26, sel_bottomAnchor);

  id v29 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v28);
  *(void *)(v8 + 56) = v29;
  sub_257DAFF98();
  sub_257DA4A2C(0, &qword_26A05E3B8);
  v30 = (void *)sub_257DAFF78();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_activateConstraints_, v30);

  id v31 = *(void **)&v1[v2];
  *(void *)&v1[v2] = v4;
}

uint64_t sub_257DA2510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  sub_257DAFFE8();
  v4[16] = sub_257DAFFD8();
  uint64_t v6 = sub_257DAFFC8();
  v4[17] = v6;
  v4[18] = v5;
  return MEMORY[0x270FA2498](sub_257DA25A8, v6, v5);
}

uint64_t sub_257DA25A8()
{
  id v1 = objc_msgSend(self, sel_sharedGuard);
  v0[19] = v1;
  if (qword_26A05E120 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26A05E1B0;
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_257DA270C;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_257DA29AC;
  v0[13] = &block_descriptor_60;
  v0[14] = v3;
  objc_msgSend(v1, sel_authenticateForShieldDismissalForSubject_completion_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_257DA270C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 160) = v2;
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v4 = *(void *)(v1 + 136);
  if (v2) {
    uint64_t v5 = sub_257DA28C8;
  }
  else {
    uint64_t v5 = sub_257DA283C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_257DA283C()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[15];
  swift_release();

  uint64_t v3 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView;
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView), sel_removeFromSuperview);
  uint64_t v4 = *(void **)(v2 + v3);
  *(void *)(v2 + v3) = 0;

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_257DA28C8()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[15];
  swift_release();
  swift_willThrow();

  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView);
  if (v3)
  {
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    uint64_t v5 = (void *)v0[20];
    if (v4)
    {
      uint64_t v6 = (void *)v4;
      id v7 = v3;
      objc_msgSend(v6, sel_setShieldStyle_, 1);

      goto LABEL_7;
    }
    uint64_t v8 = (void *)v0[20];
  }
  else
  {
    uint64_t v8 = (void *)v0[20];
  }

LABEL_7:
  id v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_257DA29AC(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3A8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_257DA2A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_257DB0008();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_257DAFFF8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_257D9FE10(a1, &qword_26A05E280);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_257DAFFC8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_257DA2C0C()
{
  uint64_t v1 = OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController;
  if (*(void *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController]) {
    return;
  }
  uint64_t v2 = v0;
  id v3 = (id)ICNotesAppBundleIdentifier();
  sub_257DAFF48();

  uint64_t v4 = (void *)sub_257DAFF38();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_identityForEmbeddedApplicationIdentifier_, v4);

  id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NKNotesSceneSpecification()), sel_init);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F830A8]), sel_initWithProcessIdentity_sceneSpecification_, v5, v6);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F830B8]), sel_init);
  objc_msgSend(v7, sel_setActivationController_, v8);

  objc_msgSend(v7, sel_setDelegate_, v2);
  id v9 = objc_msgSend(v7, sel_sceneViewController);
  objc_msgSend(v2, sel_addChildViewController_, v9);

  id v10 = objc_msgSend(v7, sel_sceneView);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v11 = objc_msgSend(v7, sel_sceneViewController);
  objc_msgSend(v11, sel_loadViewIfNeeded);

  id v12 = objc_msgSend(v2, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v13 = v12;
  v48 = v6;
  id v14 = objc_msgSend(v7, sel_sceneView);
  objc_msgSend(v13, sel_insertSubview_atIndex_, v14, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3B0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_257DB0A10;
  id v16 = objc_msgSend(v7, sel_sceneView);
  id v17 = objc_msgSend(v16, sel_leadingAnchor);

  id v18 = objc_msgSend(v2, sel_view);
  if (!v18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v19 = v18;
  id v20 = objc_msgSend(v18, sel_leadingAnchor);

  id v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
  *(void *)(v15 + 32) = v21;
  id v22 = objc_msgSend(v7, sel_sceneView);
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v2, sel_view);
  if (!v24)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v25 = v24;
  v46 = (char *)v1;
  id v26 = objc_msgSend(v24, sel_trailingAnchor);

  id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
  *(void *)(v15 + 40) = v27;
  id v28 = objc_msgSend(v7, sel_sceneView);
  id v29 = objc_msgSend(v28, sel_bottomAnchor);

  id v30 = objc_msgSend(v2, sel_view);
  if (!v30)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v31 = v30;
  id v32 = objc_msgSend(v30, sel_bottomAnchor);

  id v33 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v32);
  *(void *)(v15 + 48) = v33;
  id v34 = objc_msgSend(v7, sel_sceneView);
  id v35 = objc_msgSend(v34, sel_topAnchor);

  id v36 = objc_msgSend(v2, sel_view);
  if (!v36)
  {
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v37 = v36;
  uint64_t v38 = self;
  id v39 = objc_msgSend(v37, sel_topAnchor);

  id v40 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v39);
  *(void *)(v15 + 56) = v40;
  sub_257DAFF98();
  sub_257DA4A2C(0, &qword_26A05E3B8);
  v41 = (void *)sub_257DAFF78();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_activateConstraints_, v41);

  id v42 = objc_msgSend(v7, sel_sceneViewController);
  objc_msgSend(v42, sel_didMoveToParentViewController_, v2);

  v43 = *(void **)&v46[(void)v2];
  *(void *)&v46[(void)v2] = v7;
  id v44 = v7;

  id v45 = objc_msgSend(v44, sel_sceneView);
  id v47 = objc_msgSend(self, sel_systemOrangeColor);
  objc_msgSend(v45, sel_setTintColor_, v47);
}

id MathNotesHostingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_257DAFF38();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void MathNotesHostingViewController.init(nibName:bundle:)()
{
}

id MathNotesHostingViewController.__deallocating_deinit(uint64_t a1)
{
  return sub_257DA3C10(a1, type metadata accessor for MathNotesHostingViewController);
}

void sub_257DA3364(char a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8)
{
  id v17 = objc_msgSend(v8, sel_view);
  if (v17)
  {
    id v18 = v17;
    id v19 = objc_msgSend(v17, sel_window);

    if (v19)
    {
      id v20 = objc_msgSend(v19, sel_windowScene);

      if (v20)
      {
        if (a3) {
          objc_msgSend(v20, sel__synchronizeDrawingWithFence_, a3);
        }
      }
    }
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v8;
    *(double *)(v21 + 24) = a4;
    *(double *)(v21 + 32) = a5;
    *(double *)(v21 + 40) = a6;
    *(double *)(v21 + 48) = a7;
    *(unsigned char *)(v21 + 56) = a1 & 1;
    *(void *)(v21 + 64) = a2;
    id v22 = self;
    if (a2)
    {
      id v32 = sub_257DA4AA8;
      uint64_t v33 = v21;
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 1107296256;
      id v30 = sub_257DA12FC;
      id v31 = &block_descriptor_69;
      id v23 = _Block_copy(&v28);
      id v24 = a2;
      id v25 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel__animateWithAnimationSettings_animations_completion_, v24, v23, 0);
      swift_release();
      _Block_release(v23);
    }
    else
    {
      id v32 = sub_257DA4AA8;
      uint64_t v33 = v21;
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 1107296256;
      id v30 = sub_257DA12FC;
      id v31 = &block_descriptor_66;
      id v26 = _Block_copy(&v28);
      id v27 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel_animateWithDuration_animations_, v26, a8);
      swift_release();
      _Block_release(v26);
    }
  }
  else
  {
    __break(1u);
  }
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

uint64_t sub_257DA3618(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for MathNotesHostingViewController()
{
  return self;
}

uint64_t sub_257DA364C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_257DA36B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_257DA3720(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_257DA4B48;
  return sub_257DA2510(a1, v4, v5, v6);
}

void sub_257DA37D4(void *a1, char a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14 = (uint64_t)a1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_257DA364C(v14, (uint64_t)v22);
  if (v23)
  {
    sub_257DA4AC0((uint64_t)v22, (uint64_t)v19);
    sub_257D9FE10((uint64_t)v22, &qword_26A05E278);
    uint64_t v15 = v20;
    uint64_t v16 = v21;
    __swift_project_boxed_opaque_existential_1(v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t, uint64_t, double, double, double, double))(v16 + 16))(a1, a2 & 1, a3, v15, v16, a4, a5, a6, a7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    sub_257D9FE10((uint64_t)v22, &qword_26A05E278);
  }
  id v17 = objc_msgSend(a1, sel_view);
  if (v17)
  {
    id v18 = v17;
    objc_msgSend(v17, sel_layoutIfNeeded);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_257DA392C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_257DA43E8(a1, a3, a4, a5);
}

uint64_t MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:isModeButtonHidden:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_257DA43E8(a1, a3, a4, a5);
}

uint64_t UIScene.hostApplicationIdentifier.getter()
{
  id v1 = objc_msgSend(v0, sel__FBSScene);
  id v2 = objc_msgSend(v1, sel_hostHandle);

  if (!v2)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_11:
    sub_257D9FE10((uint64_t)&v8, &qword_26A05E230);
    return 0;
  }
  id v3 = objc_msgSend(v2, sel_auditToken);

  uint64_t v4 = (void *)sub_257DAFF38();
  id v5 = objc_msgSend(v3, sel_valueForEntitlement_, v4);

  if (v5)
  {
    sub_257DB00A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_257DA0658((uint64_t)v7, (uint64_t)&v8);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v7[0];
  }
  else {
    return 0;
  }
}

id sub_257DA3B7C()
{
  return sub_257DA3C10(0, type metadata accessor for NKNotesSceneSpecification);
}

id sub_257DA3BF4()
{
  return sub_257DA3C10(0, type metadata accessor for NKNotesWindowScene);
}

id sub_257DA3C10(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_257DA3C48(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *objc_super v4 = v2;
  v4[1] = sub_257DA3D24;
  return v6(a1);
}

uint64_t sub_257DA3D24()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_257DA3E1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E280);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x25A2C3B50](v0+ OBJC_IVAR____TtCC15NotesUIServices30MathNotesHostingViewControllerP33_82644AFB0C2F2CCE6D5FA1AE07FA364223AppProtectionController_hostingViewController);
  if (result)
  {
    id v5 = (void *)result;
    uint64_t v6 = sub_257DB0008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
    sub_257DAFFE8();
    id v7 = v5;
    uint64_t v8 = sub_257DAFFD8();
    long long v9 = (void *)swift_allocObject();
    uint64_t v10 = MEMORY[0x263F8F500];
    v9[2] = v8;
    v9[3] = v10;
    v9[4] = v7;
    sub_257DA2A60((uint64_t)v3, (uint64_t)&unk_26A05E388, (uint64_t)v9);

    return swift_release();
  }
  return result;
}

void sub_257DA3F58(unint64_t a1)
{
  uint64_t v2 = sub_257DAFED8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257DAFEF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_257DB0128();
    if (v10) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_20;
  }
LABEL_3:
  if (v10 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v22 = v7;
  uint64_t v23 = v6;
  uint64_t v24 = v3;
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      MEMORY[0x25A2C3470](i, a1);
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x25A2C32E0]();
        if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
          sub_257DAFFA8();
        sub_257DAFFB8();
        sub_257DAFF98();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      id v13 = *(void **)(a1 + 8 * j + 32);
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x25A2C32E0](v13);
        if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
          sub_257DAFFA8();
        sub_257DAFFB8();
        sub_257DAFF98();
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v23;
  uint64_t v3 = v24;
  uint64_t v7 = v22;
LABEL_21:
  unint64_t v14 = aBlock[0];
  if (qword_26A05E120 != -1) {
    swift_once();
  }
  id v15 = (id)qword_26A05E1B0;
  char v16 = sub_257DA107C((uint64_t)v15, v14);
  swift_bridgeObjectRelease();

  if (v16)
  {
    sub_257DA4A2C(0, &qword_26A05E368);
    id v17 = (void *)sub_257DB0048();
    uint64_t v18 = swift_allocObject();
    id v19 = v25;
    *(void *)(v18 + 16) = v25;
    aBlock[4] = sub_257DA45FC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_257DA12FC;
    aBlock[3] = &block_descriptor_41;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = v19;
    swift_release();
    sub_257DAFEE8();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_257DA4604();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E378);
    sub_257DA465C();
    sub_257DB00B8();
    MEMORY[0x25A2C33D0](0, v9, v5, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_257DA43E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_257DA43FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  return sub_257DA364C(v3, a2);
}

uint64_t type metadata accessor for MathNotesUpdateSafeAreaInsetsAction()
{
  return self;
}

uint64_t method lookup function for MathNotesHostingViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MathNotesHostingViewController);
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t type metadata accessor for MathNotesHostingViewController.AppProtectionController()
{
  return self;
}

uint64_t dispatch thunk of MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:isModeButtonHidden:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for NKNotesSceneSpecification()
{
  return self;
}

uint64_t type metadata accessor for NKNotesWindowScene()
{
  return self;
}

uint64_t sub_257DA45C4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_257DA45FC()
{
  sub_257DA11F4(*(void *)(v0 + 16));
}

unint64_t sub_257DA4604()
{
  unint64_t result = qword_26A05E370;
  if (!qword_26A05E370)
  {
    sub_257DAFED8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E370);
  }
  return result;
}

unint64_t sub_257DA465C()
{
  unint64_t result = qword_26A05E380;
  if (!qword_26A05E380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A05E378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E380);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_257DA4704(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_257DA47B8;
  return sub_257DA2510(a1, v4, v5, v6);
}

uint64_t sub_257DA47B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_257DA48F0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_257DA4928()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_257DA493C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_257DA4974(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_257DA47B8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A05E398 + dword_26A05E398);
  return v6(a1, v4);
}

uint64_t sub_257DA4A2C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_257DA4A68()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_257DA4AA8()
{
  sub_257DA37D4(*(void **)(v0 + 16), *(unsigned char *)(v0 + 56), *(void *)(v0 + 64), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_257DA4AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id NotesIndexSharedModel.__allocating_init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v13 = objc_allocWithZone(v6);
  return NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(a1, a2, a3, a4, a5, a6);
}

uint64_t NotesSharedIndexedSearchView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = swift_getKeyPath();
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = swift_getKeyPath();
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  uint64_t v6 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  uint64_t v7 = (uint64_t *)(a3 + v6[6]);
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (uint64_t *)(a3 + v6[7]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(void *)(a3 + v6[9]) = 0x404A000000000000;
  *(void *)(a3 + v6[10]) = 0x4020000000000000;
  *(void *)(a3 + v6[11]) = 0x402C000000000000;
  *(void *)(a3 + v6[12]) = 0x402C000000000000;
  uint64_t v10 = (void *)(a3 + v6[13]);
  void *v10 = 0;
  v10[1] = 0xE000000000000000;
  uint64_t v11 = (void *)(a3 + v6[14]);
  *uint64_t v11 = 0;
  v11[1] = 0xE000000000000000;
  id v12 = (void *)(a3 + v6[8]);
  *id v12 = a1;
  v12[1] = a2;
  return result;
}

uint64_t sub_257DA4CE8@<X0>(uint64_t a1@<X8>)
{
  return sub_257DA50C0(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_26B2E05F0, a1);
}

uint64_t sub_257DA4CFC(uint64_t a1)
{
  return sub_257DA5134(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_26B2E05F0);
}

uint64_t (*sub_257DA4D10())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_257DA4D6C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_257DA4DB4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_257DA4E00())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_257DA4E5C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_257DA4EC8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_257DA4F20(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_257DA4F80())()
{
  return j__swift_endAccess;
}

uint64_t sub_257DA4FDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D9FEB4(a1, (uint64_t)v12, a5);
  uint64_t v13 = *a2 + *a6;
  swift_beginAccess();
  sub_257DAB130((uint64_t)v12, v13, a5);
  return swift_endAccess();
}

uint64_t sub_257DA50AC@<X0>(uint64_t a1@<X8>)
{
  return sub_257DA50C0(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_26B2E0678, a1);
}

uint64_t sub_257DA50C0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return sub_257D9FEB4(v6, a3, a2);
}

uint64_t sub_257DA5120(uint64_t a1)
{
  return sub_257DA5134(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_26B2E0678);
}

uint64_t sub_257DA5134(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  sub_257DAB130(a1, v6, a3);
  return swift_endAccess();
}

uint64_t (*sub_257DA519C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_257DA51F8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_257DA5240(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_257DA528C())()
{
  return j_j__swift_endAccess;
}

id NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12 = (uint64_t)&v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date];
  uint64_t v13 = sub_257DAF9C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  unint64_t v14 = &v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = (uint64_t)&v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  uint64_t v16 = sub_257DAF998();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  swift_beginAccess();
  id v17 = v6;
  sub_257DAB194(a1, v12, &qword_26B2E05F0);
  swift_endAccess();
  v17[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge] = a2;
  swift_beginAccess();
  *(void *)unint64_t v14 = a3;
  *((void *)v14 + 1) = a4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_257DAB194(a5, v15, qword_26B2E0678);
  swift_endAccess();
  v17[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges] = a6;

  v21.receiver = v17;
  v21.super_class = (Class)type metadata accessor for NotesIndexSharedModel(0);
  id v18 = objc_msgSendSuper2(&v21, sel_init);
  sub_257D9FE10(a5, qword_26B2E0678);
  sub_257D9FE10(a1, &qword_26B2E05F0);
  return v18;
}

id NotesIndexSharedModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void NotesIndexSharedModel.init()()
{
}

unint64_t sub_257DA556C(char a1)
{
  unint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x6C6F467365746F6ELL;
      break;
    case 3:
      unint64_t result = 0x656D686361747461;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_257DA5638(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_257DA564C()
{
  return sub_257DB01F8();
}

uint64_t sub_257DA5694()
{
  return sub_257DB01E8();
}

uint64_t sub_257DA56C0()
{
  return sub_257DB01F8();
}

unint64_t sub_257DA5704()
{
  return sub_257DA556C(*v0);
}

uint64_t sub_257DA570C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_257DAE428(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_257DA5734()
{
  return 0;
}

void sub_257DA5740(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_257DA574C(uint64_t a1)
{
  unint64_t v2 = sub_257DAB250();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257DA5788(uint64_t a1)
{
  unint64_t v2 = sub_257DAB250();
  return MEMORY[0x270FA00B8](a1, v2);
}

id NotesIndexSharedModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotesIndexSharedModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_257DA5860(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05D0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257DAB250();
  sub_257DB0218();
  uint64_t v14 = v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date;
  swift_beginAccess();
  sub_257D9FEB4(v14, (uint64_t)v9, &qword_26B2E05F0);
  char v22 = 0;
  sub_257DAF9C8();
  sub_257DAB2A4((unint64_t *)&unk_26B2E0588, MEMORY[0x263F07490]);
  uint64_t v15 = v18;
  sub_257DB0198();
  sub_257D9FE10((uint64_t)v9, &qword_26B2E05F0);
  if (!v15)
  {
    swift_beginAccess();
    char v21 = 1;
    sub_257DB01A8();
    swift_beginAccess();
    char v20 = 2;
    swift_bridgeObjectRetain();
    sub_257DB0188();
    swift_bridgeObjectRelease();
    uint64_t v17 = v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL;
    swift_beginAccess();
    sub_257D9FEB4(v17, (uint64_t)v6, qword_26B2E0678);
    char v19 = 3;
    sub_257DAF998();
    sub_257DAB2A4(&qword_26B2E0580, MEMORY[0x263F06EA8]);
    sub_257DB0198();
    sub_257D9FE10((uint64_t)v6, qword_26B2E0678);
    swift_beginAccess();
    char v23 = 4;
    sub_257DB01A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

id NotesIndexSharedModel.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return NotesIndexSharedModel.init(from:)(a1);
}

id NotesIndexSharedModel.init(from:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v37 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E04B0);
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date];
  uint64_t v12 = sub_257DAF9C8();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v43 = (uint64_t)v11;
  v13(v11, 1, 1, v12);
  uint64_t v14 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  id v40 = (uint64_t *)v14;
  uint64_t v15 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  uint64_t v16 = sub_257DAF998();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v41 = v15;
  v17(v15, 1, 1, v16);
  uint64_t v18 = a1[3];
  id v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_257DAB250();
  char v19 = v2;
  id v39 = v10;
  char v20 = v47;
  sub_257DB0208();
  if (v20)
  {
    uint64_t v24 = v43;
    id v35 = v41;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    sub_257D9FE10(v24, &qword_26B2E05F0);
    swift_bridgeObjectRelease();
    sub_257D9FE10((uint64_t)v35, qword_26B2E0678);

    type metadata accessor for NotesIndexSharedModel(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    id v47 = v6;
    uint64_t v21 = v36;
    char v46 = 0;
    sub_257DAB2A4(&qword_26B2E0288, MEMORY[0x263F07490]);
    uint64_t v23 = (uint64_t)v37;
    uint64_t v22 = v38;
    sub_257DB0158();
    uint64_t v26 = v43;
    swift_beginAccess();
    sub_257DAB130(v23, v26, &qword_26B2E05F0);
    swift_endAccess();
    char v46 = 1;
    v19[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge] = sub_257DB0168() & 1;
    char v46 = 2;
    uint64_t v27 = sub_257DB0148();
    uint64_t v29 = v28;
    id v30 = v40;
    swift_beginAccess();
    uint64_t *v30 = v27;
    v30[1] = v29;
    swift_bridgeObjectRelease();
    char v45 = 3;
    sub_257DAB2A4(&qword_26B2E0280, MEMORY[0x263F06EA8]);
    uint64_t v31 = (uint64_t)v47;
    id v32 = v39;
    sub_257DB0158();
    uint64_t v33 = (uint64_t)v41;
    swift_beginAccess();
    sub_257DAB130(v31, v33, qword_26B2E0678);
    swift_endAccess();
    char v45 = 4;
    v19[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges] = sub_257DB0168() & 1;

    id v34 = (objc_class *)type metadata accessor for NotesIndexSharedModel(0);
    v44.receiver = v19;
    v44.super_class = v34;
    id v35 = objc_msgSendSuper2(&v44, sel_init);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v32, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  return v35;
}

uint64_t sub_257DA6298@<X0>(uint64_t a1@<X8>)
{
  return sub_257DA62C0(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_26B2E05F0, a1);
}

uint64_t sub_257DA62AC@<X0>(uint64_t a1@<X8>)
{
  return sub_257DA62C0(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_26B2E0678, a1);
}

uint64_t sub_257DA62C0@<X0>(void *a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return sub_257D9FEB4(v6, a3, a2);
}

id sub_257DA6320@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for NotesIndexSharedModel(0));
  id result = NotesIndexSharedModel.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_257DA6378(void *a1)
{
  return sub_257DA5860(a1);
}

uint64_t NotesYellowHeaderView.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_257DAFDD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *MEMORY[0x263F1B388];
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, v6, v2);
  uint64_t v8 = MEMORY[0x25A2C31A0](v5, 1.0, 0.85, 0.0, 1.0);
  v7(v5, v6, v2);
  uint64_t v9 = MEMORY[0x25A2C31A0](v5, 0.98, 0.73, 0.0, 1.0);
  v7(v5, v6, v2);
  uint64_t v10 = MEMORY[0x25A2C31A0](v5, 0.24, 0.24, 0.26, 1.0);
  v7(v5, v6, v2);
  MEMORY[0x25A2C31A0](v5, 0.47, 0.47, 0.5, 1.0);
  uint64_t v11 = sub_257DAFDF8();
  swift_release();
  id v12 = objc_msgSend(self, sel_quaternaryLabelColor);
  uint64_t result = MEMORY[0x25A2C31B0](v12);
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  a1[4] = result;
  return result;
}

uint64_t NotesYellowHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  uint64_t v7 = *(void *)(v1 + 32);
  *(void *)a1 = sub_257DAFC28();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02C8);
  return sub_257DA65FC((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_257DA65FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0390);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - v7;
  long long v9 = *(_OWORD *)(a1 + 16);
  long long v24 = *(_OWORD *)a1;
  long long v25 = v9;
  uint64_t v26 = *(void *)(a1 + 32);
  sub_257DA67C8((uint64_t)&v22 - v7);
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(void *)(v10 + 48) = *(void *)(a1 + 32);
  sub_257DAF74C(a1);
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v12 = v24;
  char v13 = BYTE8(v24);
  uint64_t v14 = v25;
  char v15 = BYTE8(v25);
  uint64_t v17 = v26;
  uint64_t v16 = v27;
  uint64_t v22 = v6;
  sub_257D9FEB4((uint64_t)v8, (uint64_t)v6, &qword_26B2E0390);
  uint64_t v18 = (uint64_t)v6;
  uint64_t v19 = v23;
  sub_257D9FEB4(v18, v23, &qword_26B2E0390);
  uint64_t v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0398) + 48);
  *(void *)uint64_t v20 = sub_257DAF744;
  *(void *)(v20 + 8) = v10;
  *(void *)(v20 + 16) = v12;
  *(unsigned char *)(v20 + 24) = v13;
  *(void *)(v20 + 32) = v14;
  *(unsigned char *)(v20 + 40) = v15;
  *(void *)(v20 + 48) = v17;
  *(void *)(v20 + 56) = v16;
  swift_retain();
  sub_257D9FE10((uint64_t)v8, &qword_26B2E0390);
  swift_release();
  return sub_257D9FE10((uint64_t)v22, &qword_26B2E0390);
}

uint64_t sub_257DA67C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03A0) - 8;
  MEMORY[0x270FA5388](v67);
  uint64_t v66 = (uint64_t)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_257DAFAB8();
  MEMORY[0x270FA5388](v3 - 8);
  v60 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_257DAFEA8();
  uint64_t v5 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0388) - 8;
  MEMORY[0x270FA5388](v58);
  long long v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0330) - 8;
  MEMORY[0x270FA5388](v61);
  long long v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0360) - 8;
  MEMORY[0x270FA5388](v64);
  uint64_t v62 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0380) - 8;
  MEMORY[0x270FA5388](v65);
  uint64_t v63 = (uint64_t)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *v1;
  uint64_t v15 = v1[1];
  uint64_t v54 = v1[2];
  uint64_t v57 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E04C8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_257DB0BC0;
  *(void *)(v16 + 32) = v14;
  *(void *)(v16 + 40) = v15;
  *(void *)&long long v79 = v16;
  sub_257DAFF98();
  uint64_t v17 = v79;
  swift_retain();
  swift_retain();
  sub_257DAFEB8();
  sub_257DAFEC8();
  MEMORY[0x25A2C31F0](v17);
  sub_257DAFA88();
  uint64_t v55 = v69;
  long long v56 = v70;
  uint64_t v18 = v71;
  uint64_t v19 = v72;
  swift_retain();
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v20 = v73;
  LOBYTE(v14) = v74;
  uint64_t v21 = v75;
  char v22 = v76;
  uint64_t v23 = v78;
  uint64_t v51 = v77;
  uint64_t v24 = *MEMORY[0x263F1B950];
  uint64_t v53 = v5;
  long long v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v52 = v7;
  uint64_t v26 = v59;
  v25(v7, v24, v59);
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v28 = (uint64_t)v60;
  v27(v60, v7, v26);
  uint64_t v29 = (uint64_t (*)(void))MEMORY[0x263F190D8];
  sub_257DAF3B4(v28, (uint64_t)&v9[*(int *)(v58 + 44)], MEMORY[0x263F190D8]);
  *(void *)long long v9 = v20;
  v9[8] = v14;
  *((void *)v9 + 2) = v21;
  v9[24] = v22;
  *((void *)v9 + 4) = v51;
  *((void *)v9 + 5) = v23;
  *((_OWORD *)v9 + 3) = xmmword_257DB0BD0;
  *((void *)v9 + 8) = v57;
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = 0;
  *((void *)v9 + 11) = 0xBFF0000000000000;
  swift_retain_n();
  sub_257DAF41C(v28, v29);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v26);
  swift_release();
  uint64_t v30 = sub_257DAFE88();
  uint64_t v32 = v31;
  uint64_t v33 = v66;
  sub_257D9FEB4((uint64_t)v9, v66, &qword_26B2E0388);
  id v34 = (uint64_t *)(v33 + *(int *)(v67 + 44));
  uint64_t *v34 = v30;
  v34[1] = v32;
  sub_257D9FEB4(v33, (uint64_t)&v11[*(int *)(v61 + 44)], &qword_26B2E03A0);
  *(void *)long long v11 = v55;
  *(_OWORD *)(v11 + 8) = v56;
  *((void *)v11 + 3) = v18;
  *((void *)v11 + 4) = v19;
  *((void *)v11 + 5) = v54;
  *((_OWORD *)v11 + 3) = xmmword_257DB0BE0;
  *((void *)v11 + 8) = 0x3FF0000000000000;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257D9FE10(v33, &qword_26B2E03A0);
  sub_257D9FE10((uint64_t)v9, &qword_26B2E0388);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v35 = v62;
  sub_257D9FEB4((uint64_t)v11, v62, &qword_26B2E0330);
  *(_WORD *)(v35 + *(int *)(v64 + 44)) = 0;
  sub_257D9FE10((uint64_t)v11, &qword_26B2E0330);
  LOBYTE(v30) = sub_257DAFC68();
  sub_257DAFA08();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v44 = v63;
  sub_257D9FEB4(v35, v63, &qword_26B2E0360);
  uint64_t v45 = v44 + *(int *)(v65 + 44);
  *(unsigned char *)uint64_t v45 = v30;
  *(void *)(v45 + 8) = v37;
  *(void *)(v45 + 16) = v39;
  *(void *)(v45 + 24) = v41;
  *(void *)(v45 + 32) = v43;
  *(unsigned char *)(v45 + 40) = 0;
  sub_257D9FE10(v35, &qword_26B2E0360);
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v46 = v68;
  sub_257D9FEB4(v44, v68, &qword_26B2E0380);
  id v47 = (_OWORD *)(v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0390) + 36));
  long long v48 = v80;
  *id v47 = v79;
  v47[1] = v48;
  v47[2] = v81;
  return sub_257D9FE10(v44, &qword_26B2E0380);
}

double sub_257DA6EA4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_257DAFD18();
  uint64_t v4 = *(void *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E04C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_257DB0BC0;
  *(_OWORD *)(v5 + 32) = xmmword_257DB0BF0;
  swift_retain();
  sub_257DAFA28();
  uint64_t v6 = sub_257DAFE98();
  *(_OWORD *)a2 = v9;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
  *(unsigned char *)(a2 + 32) = v12;
  double result = v14;
  *(void *)(a2 + 40) = v13;
  *(double *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v17;
  *(void *)(a2 + 80) = v4;
  *(_WORD *)(a2 + 88) = 256;
  *(void *)(a2 + 96) = v6;
  *(void *)(a2 + 104) = v8;
  return result;
}

uint64_t sub_257DA6FCC()
{
  sub_257DAFA78();
  remainder(v0, 4.0);
  sub_257DAFCF8();
  uint64_t result = sub_257DAFA78();
  double v3 = v2 * 0.25;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)((uint64_t)v3 - 0x2000000000000000) >> 62 == 3)
  {
    sub_257DAFA78();
    remainder(v4, 4.0);
    return sub_257DAFD08();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_257DA70C8()
{
  return sub_257DAFDB8();
}

uint64_t sub_257DA70E4@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  uint64_t v7 = *(void *)(v1 + 32);
  *(void *)a1 = sub_257DAFC28();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02C8);
  return sub_257DA65FC((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t NotesSharedIndexedSearchView.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E04B8);
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v24 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  *((void *)v7 + 2) = swift_getKeyPath();
  *((void *)v7 + 3) = 0;
  v7[32] = 0;
  uint64_t v8 = (uint64_t *)&v7[v5[6]];
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  char v22 = v8;
  swift_storeEnumTagMultiPayload();
  long long v9 = (uint64_t *)&v7[v5[7]];
  *long long v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  swift_storeEnumTagMultiPayload();
  *(void *)&v7[v5[9]] = 0x404A000000000000;
  *(void *)&v7[v5[10]] = 0x4020000000000000;
  *(void *)&v7[v5[11]] = 0x402C000000000000;
  *(void *)&v7[v5[12]] = 0x402C000000000000;
  uint64_t v10 = &v7[v5[13]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0xE000000000000000;
  uint64_t v11 = &v7[v5[14]];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257DAB2EC();
  uint64_t v12 = (uint64_t)v23;
  sub_257DB0208();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_257DAB340(*(id *)v7, v7[8]);
    sub_257DAB34C(*((void *)v7 + 2), *((void *)v7 + 3), v7[32]);
    sub_257D9FE10((uint64_t)v22, &qword_26A05E3C0);
    sub_257D9FE10((uint64_t)v9, &qword_26A05E3C8);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = a1;
    type metadata accessor for NotesIndexSharedModel(0);
    sub_257DAB2A4((unint64_t *)&unk_26B2E0620, (void (*)(uint64_t))type metadata accessor for NotesIndexSharedModel);
    uint64_t v13 = v21;
    double v14 = v24;
    sub_257DB0178();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v13);
    uint64_t v15 = v25;
    uint64_t v16 = sub_257DAB2A4(&qword_26B2E0630, (void (*)(uint64_t))type metadata accessor for NotesIndexSharedModel);
    uint64_t v17 = &v7[v5[8]];
    *(void *)uint64_t v17 = v15;
    *((void *)v17 + 1) = v16;
    sub_257DAF3B4((uint64_t)v7, v19, type metadata accessor for NotesSharedIndexedSearchView);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return sub_257DAF41C((uint64_t)v7, type metadata accessor for NotesSharedIndexedSearchView);
  }
}

uint64_t sub_257DA74E0()
{
  return 1;
}

uint64_t sub_257DA74E8()
{
  return sub_257DB01F8();
}

uint64_t sub_257DA752C()
{
  return sub_257DB01E8();
}

uint64_t sub_257DA7554()
{
  return sub_257DB01F8();
}

uint64_t sub_257DA7594()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_257DA75A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_257DB01C8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_257DA7638(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_257DA7644(uint64_t a1)
{
  unint64_t v2 = sub_257DAB2EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257DA7680(uint64_t a1)
{
  unint64_t v2 = sub_257DAB2EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NotesSharedIndexedSearchView.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05D8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257DAB2EC();
  sub_257DB0218();
  uint64_t v8 = *(void *)(v2 + *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32));
  swift_getObjectType();
  v10[1] = v8;
  sub_257DB01B8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t NotesSharedIndexedSearchView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v31 = sub_257DAFA18();
  uint64_t v2 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0448);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0320);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0358);
  MEMORY[0x270FA5388](v32);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v7 = sub_257DAFC28();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  double v14 = (uint64_t *)&v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02C0) + 44)];
  uint64_t v30 = v1;
  sub_257DA7BB0(v1, v14);
  uint64_t v15 = sub_257DAFE98();
  uint64_t v17 = v16;
  id v18 = objc_msgSend(self, sel_systemBackgroundColor);
  uint64_t v19 = MEMORY[0x25A2C3140](v18);
  sub_257D9FEB4((uint64_t)v7, (uint64_t)v11, &qword_26B2E0448);
  uint64_t v20 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *uint64_t v20 = v19;
  v20[1] = v15;
  v20[2] = v17;
  sub_257D9FE10((uint64_t)v7, &qword_26B2E0448);
  id v21 = objc_msgSend(self, sel_mainScreen);
  id v22 = objc_msgSend(v21, sel_traitCollection);

  id v23 = objc_msgSend(v22, sel_userInterfaceStyle);
  if (v23 == (id)1)
  {
    uint64_t v24 = (unsigned int *)MEMORY[0x263F18508];
  }
  else
  {
    if (v23 != (id)2)
    {
      type metadata accessor for NotesSharedIndexedSearchView(0);
      sub_257DAB764((uint64_t)v4);
      uint64_t v25 = v31;
      goto LABEL_7;
    }
    uint64_t v24 = (unsigned int *)MEMORY[0x263F184F8];
  }
  uint64_t v25 = v31;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v24, v31);
LABEL_7:
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v27 = (uint64_t *)&v13[*(int *)(v32 + 36)];
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0410);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v27 + *(int *)(v28 + 28), v4, v25);
  uint64_t *v27 = KeyPath;
  sub_257D9FEB4((uint64_t)v11, (uint64_t)v13, &qword_26B2E0320);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
  sub_257D9FE10((uint64_t)v11, &qword_26B2E0320);
  return sub_257DAF648((uint64_t)v13, v33, &qword_26B2E0358);
}

uint64_t sub_257DA7BB0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v67 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0418);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0310);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0348) - 8;
  MEMORY[0x270FA5388](v64);
  uint64_t v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0378) - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v66);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v65 = (uint64_t)&v58 - v14;
  uint64_t v15 = sub_257DAFDD8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x263F1B388];
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
  v20(v18, v19, v15);
  uint64_t v62 = MEMORY[0x25A2C31A0](v18, 1.0, 0.85, 0.0, 1.0);
  v20(v18, v19, v15);
  uint64_t v61 = MEMORY[0x25A2C31A0](v18, 0.98, 0.73, 0.0, 1.0);
  v20(v18, v19, v15);
  uint64_t v60 = MEMORY[0x25A2C31A0](v18, 0.24, 0.24, 0.26, 1.0);
  v20(v18, v19, v15);
  MEMORY[0x25A2C31A0](v18, 0.47, 0.47, 0.5, 1.0);
  uint64_t v59 = sub_257DAFDF8();
  swift_release();
  id v21 = objc_msgSend(self, sel_quaternaryLabelColor);
  uint64_t v22 = MEMORY[0x25A2C31B0](v21);
  *(void *)uint64_t v4 = sub_257DAFB98();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02B8);
  sub_257DA8148(v63, &v4[*(int *)(v23 + 44)]);
  LOBYTE(v19) = sub_257DAFC88();
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_257DAFA08();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_257D9FEB4((uint64_t)v4, (uint64_t)v8, &qword_26B2E0418);
  uint64_t v32 = &v8[*(int *)(v6 + 44)];
  *uint64_t v32 = v19;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_257D9FE10((uint64_t)v4, &qword_26B2E0418);
  LOBYTE(v4) = sub_257DAFC98();
  sub_257DAFA08();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_257D9FEB4((uint64_t)v8, (uint64_t)v10, &qword_26B2E0310);
  uint64_t v41 = &v10[*(int *)(v64 + 44)];
  char *v41 = (char)v4;
  *((void *)v41 + 1) = v34;
  *((void *)v41 + 2) = v36;
  *((void *)v41 + 3) = v38;
  *((void *)v41 + 4) = v40;
  v41[40] = 0;
  sub_257D9FE10((uint64_t)v8, &qword_26B2E0310);
  LOBYTE(v4) = sub_257DAFC78();
  sub_257DAFA08();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  sub_257D9FEB4((uint64_t)v10, (uint64_t)v13, &qword_26B2E0348);
  uint64_t v50 = &v13[*(int *)(v66 + 44)];
  *uint64_t v50 = (char)v4;
  *((void *)v50 + 1) = v43;
  *((void *)v50 + 2) = v45;
  *((void *)v50 + 3) = v47;
  *((void *)v50 + 4) = v49;
  v50[40] = 0;
  sub_257D9FE10((uint64_t)v10, &qword_26B2E0348);
  uint64_t v51 = v65;
  sub_257DAF648((uint64_t)v13, v65, &qword_26B2E0378);
  sub_257D9FEB4(v51, (uint64_t)v13, &qword_26B2E0378);
  v52 = v67;
  uint64_t v53 = v61;
  *uint64_t v67 = v62;
  v52[1] = v53;
  uint64_t v54 = v59;
  v52[2] = v60;
  v52[3] = v54;
  v52[4] = v22;
  uint64_t v55 = v52;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0298);
  sub_257D9FEB4((uint64_t)v13, (uint64_t)v55 + *(int *)(v56 + 48), &qword_26B2E0378);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_257D9FE10(v51, &qword_26B2E0378);
  sub_257D9FE10((uint64_t)v13, &qword_26B2E0378);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_257DA8148@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03C0);
  MEMORY[0x270FA5388](v73);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0488);
  MEMORY[0x270FA5388](v74);
  uint64_t v71 = (uint64_t *)((char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0428);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v69 = (uint64_t)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v70 = (uint64_t *)((char *)&v67 - v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v72 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03F0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v76 = (char *)&v67 - v17;
  uint64_t v18 = *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32);
  uint64_t v78 = a1;
  uint64_t v19 = *(void *)(a1 + v18 + 8);
  uint64_t ObjectType = swift_getObjectType();
  char v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 32))(ObjectType, v19);
  uint64_t v77 = v16;
  uint64_t v75 = v5;
  if (v21)
  {
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 56);
    uint64_t v67 = v19;
    uint64_t v68 = ObjectType;
    if (v22(ObjectType, v19))
    {
      uint64_t v23 = sub_257DAFC28();
      sub_257DA8D34((uint64_t)&v103);
      long long v24 = v104[0];
      uint64_t v25 = *(void *)&v104[1];
      uint64_t v26 = *(void *)&v104[3];
      uint64_t v27 = *(void *)&v104[4];
      long long v28 = *(_OWORD *)((char *)&v104[1] + 8);
      long long v29 = v104[5];
      long long v30 = v103;
      LOBYTE(v125[0]) = 0;
      LOBYTE(v90) = BYTE8(v104[2]);
      LOBYTE(v79) = BYTE8(v104[3]);
      LOBYTE(v118[0]) = BYTE8(v104[4]);
      *(void *)&long long v103 = v23;
      *((void *)&v103 + 1) = 0x4010000000000000;
      LOBYTE(v104[0]) = 0;
      *(_OWORD *)((char *)v104 + 8) = v30;
      *(_OWORD *)((char *)&v104[1] + 8) = v24;
      *((void *)&v104[2] + 1) = v25;
      v104[3] = v28;
      LOBYTE(v104[4]) = v90;
      *((void *)&v104[4] + 1) = v26;
      LOBYTE(v104[5]) = v79;
      *((void *)&v104[5] + 1) = v27;
      LOBYTE(v104[6]) = v118[0];
      *(_OWORD *)((char *)&v104[6] + 8) = v29;
      sub_257DAED78((uint64_t)&v103);
    }
    else
    {
      uint64_t v34 = sub_257DAFC38();
      sub_257DA8EF4((uint64_t)&v90);
      *(_OWORD *)((char *)&v125[7] + 7) = v97;
      *(_OWORD *)((char *)&v125[6] + 7) = v96;
      *(_OWORD *)((char *)&v125[3] + 7) = v93;
      *(_OWORD *)((char *)&v125[2] + 7) = v92;
      *(_OWORD *)((char *)&v125[8] + 7) = v98;
      *(_OWORD *)((char *)&v125[9] + 7) = v99;
      *(_OWORD *)((char *)&v125[4] + 7) = v94;
      *(_OWORD *)((char *)&v125[5] + 7) = v95;
      *(_OWORD *)((char *)v125 + 7) = v90;
      *(_OWORD *)((char *)&v125[1] + 7) = v91;
      *(_OWORD *)((char *)&v104[7] + 1) = v125[7];
      *(_OWORD *)((char *)&v104[8] + 1) = v125[8];
      *(_OWORD *)((char *)&v104[9] + 1) = v125[9];
      *(_OWORD *)((char *)&v104[3] + 1) = v125[3];
      *(_OWORD *)((char *)&v104[4] + 1) = v125[4];
      *(_OWORD *)((char *)&v104[5] + 1) = v125[5];
      *(_OWORD *)((char *)&v104[6] + 1) = v125[6];
      *(_OWORD *)((char *)v104 + 1) = v125[0];
      *(_OWORD *)((char *)&v104[1] + 1) = v125[1];
      LOBYTE(v79) = 0;
      long long v103 = (unint64_t)v34;
      LOBYTE(v104[0]) = 0;
      *(void *)&v104[10] = *((void *)&v99 + 1);
      *(_OWORD *)((char *)&v104[2] + 1) = v125[2];
      sub_257DAED64((uint64_t)&v103);
    }
    sub_257DAF648((uint64_t)&v103, (uint64_t)&v101, &qword_26A05E3E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0458);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0468);
    sub_257DAF85C(&qword_26B2E0450, &qword_26B2E0458);
    sub_257DAF85C(&qword_26B2E0460, &qword_26B2E0468);
    sub_257DAFC48();
    v104[7] = v113;
    v104[8] = v114;
    v104[9] = v115[0];
    *(_OWORD *)((char *)&v104[9] + 9) = *(_OWORD *)((char *)v115 + 9);
    v104[3] = v109;
    v104[4] = v110;
    v104[5] = v111;
    v104[6] = v112;
    long long v103 = v105;
    v104[0] = v106;
    v104[1] = v107;
    v104[2] = v108;
    sub_257DAED70((uint64_t)&v103);
    sub_257DAF648((uint64_t)&v103, (uint64_t)&v101, &qword_26B2E03C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0438);
    sub_257DAE7F0();
    sub_257DAF85C(&qword_26B2E0430, &qword_26B2E0438);
    sub_257DAFC48();
    uint64_t v32 = v78;
    uint64_t v33 = (uint64_t)v72;
    uint64_t v19 = v67;
    uint64_t ObjectType = v68;
  }
  else
  {
    uint64_t v31 = sub_257DAFC28();
    sub_257DAFE98();
    sub_257DAFA68();
    long long v103 = (unint64_t)v31;
    LOBYTE(v104[0]) = 1;
    *((void *)&v104[0] + 1) = 0;
    LOBYTE(v104[1]) = 1;
    *((void *)&v104[1] + 1) = v120;
    LOBYTE(v104[2]) = v121;
    *((void *)&v104[2] + 1) = v122;
    LOBYTE(v104[3]) = v123;
    *(_OWORD *)((char *)&v104[3] + 8) = v124;
    sub_257DAE7E4((uint64_t)&v103);
    sub_257DAF648((uint64_t)&v103, (uint64_t)&v101, &qword_26B2E03C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0438);
    sub_257DAE7F0();
    sub_257DAF85C(&qword_26B2E0430, &qword_26B2E0438);
    sub_257DAFC48();
    uint64_t v32 = v78;
    uint64_t v33 = (uint64_t)v72;
  }
  uint64_t v35 = sub_257DAFC38();
  sub_257DA9170(v32, (uint64_t)v116);
  *(_OWORD *)((char *)&v118[7] + 7) = v116[7];
  *(_OWORD *)((char *)&v118[8] + 7) = v116[8];
  *(_OWORD *)((char *)&v118[9] + 7) = v116[9];
  *(_OWORD *)((char *)&v118[3] + 7) = v116[3];
  *(_OWORD *)((char *)&v118[4] + 7) = v116[4];
  *(_OWORD *)((char *)&v118[5] + 7) = v116[5];
  *(_OWORD *)((char *)&v118[6] + 7) = v116[6];
  *(_OWORD *)((char *)v118 + 7) = v116[0];
  *(_OWORD *)((char *)&v118[1] + 7) = v116[1];
  char v119 = 0;
  *(void *)((char *)&v118[10] + 7) = v117;
  *(_OWORD *)((char *)&v118[2] + 7) = v116[2];
  LODWORD(v78) = 0;
  (*(void (**)(uint64_t, uint64_t))(v19 + 48))(ObjectType, v19);
  uint64_t v36 = sub_257DAF998();
  int v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v33, 1, v36);
  sub_257D9FE10(v33, qword_26B2E0678);
  if (v37 == 1)
  {
    uint64_t v38 = v75;
    *uint64_t v75 = 0;
    *((unsigned char *)v38 + 8) = 1;
    swift_storeEnumTagMultiPayload();
    sub_257DAF85C(&qword_26B2E0480, &qword_26B2E0488);
    uint64_t v39 = (uint64_t)v76;
    sub_257DAFC48();
  }
  else
  {
    uint64_t v40 = sub_257DAFC28();
    uint64_t v41 = v32;
    uint64_t v42 = (uint64_t)v70;
    *long long v70 = v40;
    *(void *)(v42 + 8) = 0;
    *(unsigned char *)(v42 + 16) = 1;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02D0);
    sub_257DAA3CC(v41, v42 + *(int *)(v43 + 44));
    uint64_t v44 = v69;
    sub_257D9FEB4(v42, v69, &qword_26B2E0428);
    uint64_t v45 = (uint64_t)v71;
    *uint64_t v71 = 0;
    *(unsigned char *)(v45 + 8) = 1;
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0420);
    sub_257D9FEB4(v44, v45 + *(int *)(v46 + 48), &qword_26B2E0428);
    sub_257D9FE10(v44, &qword_26B2E0428);
    sub_257D9FEB4(v45, (uint64_t)v75, &qword_26B2E0488);
    swift_storeEnumTagMultiPayload();
    sub_257DAF85C(&qword_26B2E0480, &qword_26B2E0488);
    uint64_t v39 = (uint64_t)v76;
    sub_257DAFC48();
    sub_257D9FE10(v45, &qword_26B2E0488);
    sub_257D9FE10(v42, &qword_26B2E0428);
  }
  char v47 = v78;
  long long v87 = v125[8];
  long long v88 = v125[9];
  v89[0] = v125[10];
  *(_OWORD *)((char *)v89 + 10) = *(_OWORD *)((char *)&v125[10] + 10);
  long long v83 = v125[4];
  long long v84 = v125[5];
  long long v85 = v125[6];
  long long v86 = v125[7];
  long long v79 = v125[0];
  long long v80 = v125[1];
  long long v81 = v125[2];
  long long v82 = v125[3];
  uint64_t v48 = (uint64_t)v77;
  sub_257D9FEB4(v39, (uint64_t)v77, &qword_26B2E03F0);
  long long v49 = v88;
  long long v98 = v87;
  long long v99 = v88;
  long long v50 = v89[0];
  v100[0] = v89[0];
  *(_OWORD *)((char *)v100 + 10) = *(_OWORD *)((char *)v89 + 10);
  long long v51 = v83;
  long long v52 = v84;
  long long v94 = v83;
  long long v95 = v84;
  long long v53 = v85;
  long long v54 = v86;
  long long v96 = v85;
  long long v97 = v86;
  long long v55 = v79;
  long long v56 = v80;
  long long v90 = v79;
  long long v91 = v80;
  long long v57 = v81;
  long long v58 = v82;
  long long v92 = v81;
  long long v93 = v82;
  a2[8] = v87;
  a2[9] = v49;
  a2[10] = v50;
  *(_OWORD *)((char *)a2 + 170) = *(_OWORD *)((char *)v89 + 10);
  a2[4] = v51;
  a2[5] = v52;
  a2[6] = v53;
  a2[7] = v54;
  *a2 = v55;
  a2[1] = v56;
  a2[2] = v57;
  a2[3] = v58;
  *(_OWORD *)((char *)&v102[7] + 1) = v118[7];
  *(_OWORD *)((char *)&v102[8] + 1) = v118[8];
  *(_OWORD *)((char *)&v102[9] + 1) = v118[9];
  v102[10] = *(_OWORD *)((char *)&v118[9] + 15);
  *(_OWORD *)((char *)&v102[3] + 1) = v118[3];
  *(_OWORD *)((char *)&v102[4] + 1) = v118[4];
  *(_OWORD *)((char *)&v102[5] + 1) = v118[5];
  *(_OWORD *)((char *)&v102[6] + 1) = v118[6];
  *(_OWORD *)((char *)v102 + 1) = v118[0];
  *(void *)&long long v101 = v35;
  *((void *)&v101 + 1) = 0x4010000000000000;
  LOBYTE(v102[0]) = v47;
  *(_OWORD *)((char *)&v102[1] + 1) = v118[1];
  *(_OWORD *)((char *)&v102[2] + 1) = v118[2];
  long long v59 = v102[8];
  a2[20] = v102[7];
  a2[21] = v59;
  long long v60 = v102[10];
  a2[22] = v102[9];
  a2[23] = v60;
  long long v61 = v102[4];
  a2[16] = v102[3];
  a2[17] = v61;
  long long v62 = v102[6];
  a2[18] = v102[5];
  a2[19] = v62;
  long long v63 = v102[0];
  a2[12] = v101;
  a2[13] = v63;
  long long v64 = v102[2];
  a2[14] = v102[1];
  a2[15] = v64;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03F8);
  sub_257D9FEB4(v48, (uint64_t)a2 + *(int *)(v65 + 64), &qword_26B2E03F0);
  sub_257DAEBD8((uint64_t)&v90, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_257DAE8B0);
  sub_257DAE9B8((uint64_t)&v101);
  sub_257D9FE10(v39, &qword_26B2E03F0);
  sub_257D9FE10(v48, &qword_26B2E03F0);
  *(_OWORD *)((char *)&v104[7] + 1) = v118[7];
  *(_OWORD *)((char *)&v104[8] + 1) = v118[8];
  *(_OWORD *)((char *)&v104[9] + 1) = v118[9];
  v104[10] = *(_OWORD *)((char *)&v118[9] + 15);
  *(_OWORD *)((char *)&v104[3] + 1) = v118[3];
  *(_OWORD *)((char *)&v104[4] + 1) = v118[4];
  *(_OWORD *)((char *)&v104[5] + 1) = v118[5];
  *(_OWORD *)((char *)&v104[6] + 1) = v118[6];
  *(_OWORD *)((char *)v104 + 1) = v118[0];
  *(_OWORD *)((char *)&v104[1] + 1) = v118[1];
  *(void *)&long long v103 = v35;
  *((void *)&v103 + 1) = 0x4010000000000000;
  LOBYTE(v104[0]) = v47;
  *(_OWORD *)((char *)&v104[2] + 1) = v118[2];
  sub_257DAEAC8((uint64_t)&v103);
  long long v113 = v87;
  long long v114 = v88;
  v115[0] = v89[0];
  *(_OWORD *)((char *)v115 + 10) = *(_OWORD *)((char *)v89 + 10);
  long long v109 = v83;
  long long v110 = v84;
  long long v111 = v85;
  long long v112 = v86;
  long long v105 = v79;
  long long v106 = v80;
  long long v107 = v81;
  long long v108 = v82;
  return sub_257DAEBD8((uint64_t)&v105, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_257DAEC5C);
}

uint64_t sub_257DA8D34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3F0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_257DAFE48();
  uint64_t v6 = sub_257DAFDE8();
  uint64_t v7 = sub_257DAFE48();
  uint64_t v8 = sub_257DAFCB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  uint64_t v9 = sub_257DAFCC8();
  sub_257D9FE10((uint64_t)v4, &qword_26A05E3F0);
  uint64_t KeyPath = swift_getKeyPath();
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v11 = v16;
  char v12 = v17;
  uint64_t v13 = v18;
  char v14 = v19;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = 0x3FE0000000000000;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v13;
  *(unsigned char *)(a1 + 88) = v14;
  *(_OWORD *)(a1 + 96) = v20;
  swift_retain();
  return swift_release();
}

double sub_257DA8EF4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3F0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v5 = v21;
  char v6 = v22;
  uint64_t v7 = v23;
  char v8 = v24;
  uint64_t v19 = v26;
  uint64_t v20 = v25;
  uint64_t v9 = sub_257DAFE48();
  uint64_t v10 = sub_257DAFCB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  uint64_t v11 = sub_257DAFCC8();
  sub_257D9FE10((uint64_t)v4, &qword_26A05E3F0);
  uint64_t KeyPath = swift_getKeyPath();
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v13 = v27;
  uint64_t v14 = v29;
  char v35 = v28;
  char v33 = v30;
  *(_DWORD *)(a1 + 9) = *(_DWORD *)v39;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a1 + 25) = *(_DWORD *)v38;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v37;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v36;
  char v15 = v35;
  *(_DWORD *)(a1 + 124) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 121) = *(_DWORD *)v34;
  char v16 = v33;
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v32;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v32[3];
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  uint64_t v17 = v19;
  *(void *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = 0x3FE0000000000000;
  *(void *)(a1 + 80) = KeyPath;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 1;
  *(void *)(a1 + 112) = v13;
  *(unsigned char *)(a1 + 120) = v15;
  *(void *)(a1 + 128) = v14;
  *(unsigned char *)(a1 + 136) = v16;
  double result = v31[0];
  *(_OWORD *)(a1 + 144) = *(_OWORD *)v31;
  return result;
}

uint64_t sub_257DA9170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_257DA93C0(&v33);
  uint64_t v4 = v33;
  char v5 = v35;
  uint64_t v32 = v36;
  uint64_t v30 = v34;
  uint64_t v31 = v37;
  uint64_t v26 = v38;
  char v6 = v39;
  uint64_t v25 = sub_257DAFB88();
  sub_257DA9E88(a1, &v33);
  uint64_t v7 = v33;
  char v8 = v35;
  uint64_t v28 = v34;
  uint64_t v29 = v36;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v9 = *(void *)(a1 + *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32) + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(ObjectType, v9);
  if (v11)
  {
    sub_257DA9710((uint64_t)&v33);
    swift_bridgeObjectRelease();
    uint64_t v12 = v33;
    uint64_t v13 = v34;
    uint64_t v14 = v35;
    uint64_t v15 = v36;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  LOBYTE(v33) = v5;
  uint64_t v16 = v4;
  uint64_t v23 = v4;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v30;
  *(unsigned char *)(a2 + 16) = v5;
  char v17 = v5;
  char v24 = v5;
  *(void *)(a2 + 24) = v32;
  *(void *)(a2 + 32) = v31;
  *(void *)(a2 + 40) = v26;
  *(unsigned char *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v25;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 1;
  *(void *)(a2 + 80) = v7;
  *(void *)(a2 + 88) = v28;
  *(unsigned char *)(a2 + 96) = v8;
  *(void *)(a2 + 104) = v29;
  *(void *)(a2 + 112) = KeyPath;
  *(void *)(a2 + 120) = 1;
  *(unsigned char *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = v12;
  *(void *)(a2 + 144) = v13;
  *(void *)(a2 + 152) = v14;
  *(void *)(a2 + 160) = v15;
  uint64_t v18 = v12;
  uint64_t v19 = v13;
  char v20 = v14;
  uint64_t v21 = v15;
  sub_257DAEA74(v16, v30, v17);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257DAEA74(v7, v28, v8);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257DAEA84(v18, v19, v20, v21);
  sub_257DAEB94(v18, v19, v20, v21);
  sub_257DAEB84(v7, v28, v8);
  swift_release();
  swift_bridgeObjectRelease();
  sub_257DAEB84(v23, v30, v24);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_257DA93C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_257DAF908();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v40 - v9;
  id v11 = *(id *)v1;
  char v12 = *(unsigned char *)(v1 + 8);
  sub_257DACF18(*(id *)v1, v12);
  id v13 = sub_257DAB35C(v11, v12);
  sub_257DAB340(v11, v12);
  id v14 = objc_msgSend(v13, sel_displayName);

  if (!v14)
  {
    sub_257DAF3B4(v1, (uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
LABEL_5:
    uint64_t v15 = *(void *)&v4[*(int *)(v2 + 52)];
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  uint64_t v15 = sub_257DAFF48();
  uint64_t v17 = v16;

  sub_257DAF3B4(v1, (uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
  if (!v17) {
    goto LABEL_5;
  }
LABEL_6:
  sub_257DAF41C((uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
  uint64_t v18 = sub_257DAFE08();
  uint64_t v19 = v10;
  uint64_t v41 = v10;
  sub_257DA98F8(v15, v18, (uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v20 = v42;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v8, v19, v5);
  uint64_t v21 = sub_257DAFD78();
  uint64_t v23 = v22;
  LOBYTE(v19) = v24 & 1;
  sub_257DAFCE8();
  uint64_t v25 = sub_257DAFD58();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v40 = v5;
  swift_release();
  sub_257DAEB84(v21, v23, (char)v19);
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_257DAFD48();
  uint64_t v32 = v31;
  char v34 = v33;
  uint64_t v36 = v35;
  sub_257DAEB84(v25, v27, v29 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = v43;
  uint64_t *v43 = v30;
  v38[1] = v32;
  *((unsigned char *)v38 + 16) = v34 & 1;
  v38[3] = v36;
  v38[4] = KeyPath;
  void v38[5] = 1;
  *((unsigned char *)v38 + 48) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v41, v40);
}

uint64_t sub_257DA9710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_257DAFBE8();
  MEMORY[0x270FA5388](v2 - 8);
  sub_257DAFBD8();
  sub_257DAFBC8();
  sub_257DAFE48();
  sub_257DAFBA8();
  swift_release();
  sub_257DAFBC8();
  sub_257DAFBB8();
  sub_257DAFBC8();
  sub_257DAFC08();
  uint64_t v3 = sub_257DAFD68();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_257DAFCD8();
  uint64_t v8 = sub_257DAFD58();
  uint64_t v10 = v9;
  char v12 = v11;
  swift_release();
  char v13 = v12 & 1;
  sub_257DAEB84(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_257DAFE18();
  uint64_t v14 = sub_257DAFD28();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  sub_257DAEB84(v8, v10, v13);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v16;
  *(unsigned char *)(a1 + 16) = v18 & 1;
  *(void *)(a1 + 24) = v20;
  return result;
}

uint64_t sub_257DA98F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v42 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0290);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_257DAF908();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E04A0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0498);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v43 = v17;
  uint64_t v44 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v41 = (uint64_t)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v40 = (uint64_t)&v39 - v21;
  uint64_t v22 = sub_257DAF948();
  MEMORY[0x270FA5388](v22 - 8);
  swift_bridgeObjectRetain();
  sub_257DAF938();
  sub_257DAF918();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v46[0] = a2;
  unint64_t v23 = sub_257DAF554();
  swift_retain();
  unint64_t v39 = v23;
  sub_257DAF8F8();
  char v24 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v42 = a3;
  v24(v13, a3, v10);
  uint64_t v25 = *(void *)(v4 + 16);
  uint64_t v26 = *(void *)(v4 + 24);
  LOBYTE(a2) = *(unsigned char *)(v4 + 32);
  sub_257DACF24(v25, v26, a2);
  uint64_t v27 = sub_257DAB56C(v25, v26, a2);
  uint64_t v29 = v28;
  sub_257DAB34C(v25, v26, a2);
  v46[0] = v27;
  v46[1] = v29;
  uint64_t v30 = sub_257DAF9D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v9, 1, 1, v30);
  sub_257DAB2A4(&qword_26B2E0278, MEMORY[0x263F06828]);
  sub_257DAF4E0();
  sub_257DAF978();
  uint64_t v31 = v43;
  sub_257D9FE10((uint64_t)v9, &qword_26B2E0290);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v16, 1, v31) == 1)
  {
    uint64_t v32 = &qword_26B2E04A0;
    uint64_t v33 = (uint64_t)v16;
  }
  else
  {
    uint64_t v34 = v40;
    sub_257DAF648((uint64_t)v16, v40, &qword_26B2E0498);
    uint64_t v35 = v41;
    sub_257D9FEB4(v34, v41, &qword_26B2E0498);
    uint64_t v36 = swift_getKeyPath();
    *(&v39 - 2) = MEMORY[0x270FA5388](v36);
    swift_getKeyPath();
    v46[4] = sub_257DAFDE8();
    sub_257DAF85C(&qword_26B2E04A8, &qword_26B2E0498);
    uint64_t v37 = (void (*)(void *, void))sub_257DAF928();
    sub_257DAF958();
    v37(v46, 0);
    sub_257D9FE10(v35, &qword_26B2E0498);
    uint64_t v33 = v34;
    uint64_t v32 = &qword_26B2E0498;
  }
  return sub_257D9FE10(v33, v32);
}

uint64_t sub_257DA9E2C()
{
  return sub_257DAFF28() & 1;
}

uint64_t sub_257DA9E88@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_257DAF908();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05F0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = v4;
  uint64_t v13 = *(void *)(a1 + *(int *)(v4 + 32) + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(ObjectType, v13);
  uint64_t v15 = sub_257DAF9C8();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15);
  uint64_t v77 = v9;
  uint64_t v78 = a2;
  char v76 = v6;
  if (v17 == 1)
  {
    sub_257D9FE10((uint64_t)v12, &qword_26B2E05F0);
    uint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
  }
  else
  {
    uint64_t v18 = sub_257DAF9A8();
    unint64_t v19 = v20;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  }
  uint64_t v79 = v18;
  unint64_t v80 = v19;
  sub_257DAF4E0();
  uint64_t v21 = sub_257DAFD88();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_257DAFCA8();
  uint64_t v26 = sub_257DAFD58();
  uint64_t v28 = v27;
  char v30 = v29;
  swift_release();
  char v31 = v30 & 1;
  sub_257DAEB84(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_257DAFBF8();
  uint64_t v32 = sub_257DAFD68();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  uint64_t v37 = sub_257DAFD38();
  uint64_t v73 = v38;
  uint64_t v74 = v37;
  char v40 = v39;
  uint64_t v75 = v41;
  sub_257DAEB84(v32, v34, v36);
  swift_bridgeObjectRelease();
  sub_257DAEB84(v26, v28, v31);
  swift_bridgeObjectRelease();
  id v42 = *(id *)a1;
  char v43 = *(unsigned char *)(a1 + 8);
  sub_257DACF18(*(id *)a1, v43);
  id v44 = sub_257DAB35C(v42, v43);
  sub_257DAB340(v42, v43);
  id v45 = objc_msgSend(v44, sel_contentDescription);

  if (!v45)
  {
    uint64_t v49 = (uint64_t)v76;
    sub_257DAF3B4(a1, (uint64_t)v76, type metadata accessor for NotesSharedIndexedSearchView);
    uint64_t v50 = (uint64_t)v77;
LABEL_8:
    uint64_t v46 = *(void *)(v49 + *(int *)(v72 + 56));
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  uint64_t v46 = sub_257DAFF48();
  uint64_t v48 = v47;

  uint64_t v49 = (uint64_t)v76;
  sub_257DAF3B4(a1, (uint64_t)v76, type metadata accessor for NotesSharedIndexedSearchView);
  uint64_t v50 = (uint64_t)v77;
  if (!v48) {
    goto LABEL_8;
  }
LABEL_9:
  LODWORD(v72) = v40 & 1;
  sub_257DAF41C(v49, type metadata accessor for NotesSharedIndexedSearchView);
  uint64_t v51 = sub_257DAFE18();
  sub_257DA98F8(v46, v51, v50);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v52 = sub_257DAFD78();
  uint64_t v54 = v53;
  char v56 = v55 & 1;
  sub_257DAFCA8();
  uint64_t v57 = sub_257DAFD58();
  uint64_t v59 = v58;
  char v61 = v60;
  swift_release();
  sub_257DAEB84(v52, v54, v56);
  swift_bridgeObjectRelease();
  uint64_t v62 = v73;
  uint64_t v63 = v74;
  LOBYTE(v52) = v72;
  char v76 = (char *)sub_257DAFD38();
  uint64_t v77 = v64;
  uint64_t v66 = v65;
  char v68 = v67;
  sub_257DAEB84(v57, v59, v61 & 1);
  swift_bridgeObjectRelease();
  sub_257DAEB84(v63, v62, v52);
  uint64_t result = swift_bridgeObjectRelease();
  long long v70 = v78;
  *uint64_t v78 = v76;
  v70[1] = v66;
  *((unsigned char *)v70 + 16) = v68 & 1;
  v70[3] = v77;
  return result;
}

uint64_t sub_257DAA3CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v24[1] = a2;
  uint64_t v3 = type metadata accessor for NotesSharedIndexedSearchView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v24 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v24 - v15;
  uint64_t v17 = *(void *)(a1 + *(int *)(v4 + 40) + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v17 + 48))(ObjectType, v17);
  sub_257DAF3B4(a1, (uint64_t)v10, type metadata accessor for NotesSharedIndexedSearchView);
  unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v20 = swift_allocObject();
  sub_257DAEDDC((uint64_t)v10, v20 + v19);
  sub_257DAF3B4(a1, (uint64_t)v8, type metadata accessor for NotesSharedIndexedSearchView);
  uint64_t v21 = swift_allocObject();
  sub_257DAEDDC((uint64_t)v8, v21 + v19);
  sub_257D9FEB4((uint64_t)v16, (uint64_t)v14, qword_26B2E0678);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = sub_257DAEE40;
  v22[3] = v20;
  v22[4] = sub_257DAF098;
  v22[5] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03D8);
  sub_257DAF154();
  sub_257DAF9F8();
  return sub_257D9FE10((uint64_t)v16, qword_26B2E0678);
}

uint64_t sub_257DAA680@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02B0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257DAFAA8();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (_OWORD *)((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_257DAFE58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
  uint64_t v14 = sub_257DAFE68();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v15 = v33;
  LOBYTE(v10) = v34;
  uint64_t v16 = v35;
  int v32 = v36;
  uint64_t v30 = v38;
  uint64_t v31 = v37;
  uint64_t v17 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v18 = *MEMORY[0x263F19860];
  uint64_t v19 = sub_257DAFC18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v9 = _Q0;
  char v25 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_257DAF3B4((uint64_t)v9, (uint64_t)v5, MEMORY[0x263F19048]);
  *(_WORD *)&v5[*(int *)(v3 + 44)] = 256;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0370);
  sub_257D9FEB4((uint64_t)v5, a1 + *(int *)(v26 + 36), &qword_26B2E02B0);
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v16;
  *(unsigned char *)(a1 + 32) = v32;
  uint64_t v27 = v30;
  *(void *)(a1 + 40) = v31;
  *(void *)(a1 + 48) = v27;
  swift_retain();
  sub_257D9FE10((uint64_t)v5, &qword_26B2E02B0);
  sub_257DAF41C((uint64_t)v9, v25);
  return swift_release();
}

uint64_t sub_257DAA988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02B0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_257DAFAA8();
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (_OWORD *)((char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_257DAFE58();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257DAFE48();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F1B4B8], v11);
  uint64_t v15 = sub_257DAFE68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_257DAFE98();
  sub_257DAFA68();
  uint64_t v16 = v33;
  LOBYTE(v14) = v34;
  uint64_t v32 = v35;
  int v31 = v36;
  uint64_t v29 = v38;
  uint64_t v30 = v37;
  uint64_t v17 = (char *)v10 + *(int *)(v8 + 28);
  uint64_t v18 = *MEMORY[0x263F19860];
  uint64_t v19 = sub_257DAFC18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __asm { FMOV            V0.2D, #5.0 }
  _OWORD *v10 = _Q0;
  char v25 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_257DAF3B4((uint64_t)v10, (uint64_t)v6, MEMORY[0x263F19048]);
  *(_WORD *)&v6[*(int *)(v4 + 44)] = 256;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0370);
  sub_257D9FEB4((uint64_t)v6, a2 + *(int *)(v26 + 36), &qword_26B2E02B0);
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v16;
  *(unsigned char *)(a2 + 16) = (_BYTE)v14;
  *(void *)(a2 + 24) = v32;
  *(unsigned char *)(a2 + 32) = v31;
  uint64_t v27 = v29;
  *(void *)(a2 + 40) = v30;
  *(void *)(a2 + 48) = v27;
  swift_retain();
  sub_257D9FE10((uint64_t)v6, &qword_26B2E02B0);
  sub_257DAF41C((uint64_t)v10, v25);
  return swift_release();
}

uint64_t sub_257DAACC0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NotesSharedIndexedSearchView.init(from:)(a1, a2);
}

uint64_t sub_257DAACD8(void *a1)
{
  return NotesSharedIndexedSearchView.encode(to:)(a1);
}

uint64_t sub_257DAACF4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E02E8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0400);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, a1, v8);
  uint64_t v9 = &v7[*(int *)(v5 + 44)];
  *(void *)uint64_t v9 = 0;
  *((_WORD *)v9 + 4) = 257;
  sub_257DAFA78();
  double v11 = v10 * 0.5;
  sub_257DAFA78();
  double v13 = v12 * 0.5;
  sub_257D9FEB4((uint64_t)v7, a2, &qword_26B2E02E8);
  uint64_t v14 = (double *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0328) + 36));
  *uint64_t v14 = v11;
  v14[1] = v13;
  return sub_257D9FE10((uint64_t)v7, &qword_26B2E02E8);
}

uint64_t sub_257DAAE2C()
{
  return sub_257DAFA58();
}

uint64_t sub_257DAAE48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0400);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)a2 = sub_257DAE700;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_257DAAF84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257DAFAC8();
  *a1 = result;
  return result;
}

uint64_t sub_257DAAFB0(id *a1)
{
  id v1 = *a1;
  return sub_257DAFAD8();
}

uint64_t sub_257DAAFDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257DAFAE8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_257DAB008()
{
  return sub_257DAFAF8();
}

uint64_t type metadata accessor for NotesSharedIndexedSearchView(uint64_t a1)
{
  return sub_257DAB218(a1, (uint64_t *)&unk_26B2E05A0);
}

uint64_t sub_257DAB068()
{
  return sub_257DAFB08();
}

uint64_t sub_257DAB08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257DAC040(a1, a2, a3, a4, MEMORY[0x263F200B0], MEMORY[0x263F200D0]);
}

uint64_t sub_257DAB0CC()
{
  return sub_257DAFB18();
}

uint64_t sub_257DAB0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257DAC040(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_257DAB130(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_257DAB194(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for NotesIndexSharedModel(uint64_t a1)
{
  return sub_257DAB218(a1, (uint64_t *)&unk_26B2E0638);
}

uint64_t sub_257DAB218(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_257DAB250()
{
  unint64_t result = qword_26B2E0600;
  if (!qword_26B2E0600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0600);
  }
  return result;
}

uint64_t sub_257DAB2A4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_257DAB2EC()
{
  unint64_t result = qword_26B2E0648;
  if (!qword_26B2E0648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0648);
  }
  return result;
}

void sub_257DAB340(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_257DAB34C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

id sub_257DAB35C(void *a1, char a2)
{
  id v16 = a1;
  uint64_t v3 = sub_257DAFB78();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = v16;
    return v15;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = sub_257DB0038();
    uint64_t v8 = sub_257DAFC58();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_257DAF6AC();
      uint64_t v12 = sub_257DB0248();
      *(void *)(v10 + 4) = sub_257DABBC0(v12, v13, &v17);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_257D9D000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C3A80](v11, -1, -1);
      MEMORY[0x25A2C3A80](v10, -1, -1);
    }

    sub_257DAFB68();
    swift_getAtKeyPath();
    sub_257DAB340(v16, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v17;
  }
}

uint64_t sub_257DAB56C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_257DAFB78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_257DB0038();
    uint64_t v11 = sub_257DAFC58();
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v12 + 4) = sub_257DABBC0(0x676E69727453, 0xE600000000000000, &v15);
      _os_log_impl(&dword_257D9D000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C3A80](v13, -1, -1);
      MEMORY[0x25A2C3A80](v12, -1, -1);
    }

    sub_257DAFB68();
    swift_getAtKeyPath();
    sub_257DAB34C(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v15;
  }
  return a1;
}

uint64_t sub_257DAB764@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_257DAFB78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257D9FEB4(v2, (uint64_t)v10, &qword_26B2E05C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_257DAFA18();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_257DB0038();
    uint64_t v14 = sub_257DAFC58();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_257DABBC0(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      _os_log_impl(&dword_257D9D000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C3A80](v16, -1, -1);
      MEMORY[0x25A2C3A80](v15, -1, -1);
    }

    sub_257DAFB68();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_257DAB9F4@<X0>(void (*a1)(void)@<X1>, void (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  v12[1] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E03B8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0370);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_257DAFA98())
  {
    a1();
    sub_257D9FEB4((uint64_t)v10, (uint64_t)v7, &qword_26B2E0370);
    swift_storeEnumTagMultiPayload();
    sub_257DAF1C8();
    sub_257DAFC48();
    swift_release();
  }
  else
  {
    a2();
    sub_257D9FEB4((uint64_t)v10, (uint64_t)v7, &qword_26B2E0370);
    swift_storeEnumTagMultiPayload();
    sub_257DAF1C8();
    sub_257DAFC48();
  }
  return sub_257D9FE10((uint64_t)v10, &qword_26B2E0370);
}

unint64_t sub_257DABBC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_257DABC94(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_257DAE784((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_257DAE784((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_257DABC94(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_257DABD94(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_257DB0108();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_257DABD94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_257DABE2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_257DABF30(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_257DABF30((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_257DABE2C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_257DABEC8(v2, 0);
      uint64_t result = sub_257DB00E8();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_257DAFF58();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_257DABEC8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_257DABF30(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_257DAC01C()
{
  return sub_257DAFB18();
}

uint64_t sub_257DAC040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_257DAC110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_257DAC040(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_257DAC150(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_257DAB2A4((unint64_t *)&unk_26B2E0620, (void (*)(uint64_t))type metadata accessor for NotesIndexSharedModel);
  uint64_t result = sub_257DAB2A4(&qword_26B2E0618, (void (*)(uint64_t))type metadata accessor for NotesIndexSharedModel);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_257DAC1D4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of NotesYellowHeaderView.body>>, 1);
}

uint64_t sub_257DAC1F0()
{
  return sub_257DAB2A4(&qword_26B2E0670, (void (*)(uint64_t))type metadata accessor for NotesSharedIndexedSearchView);
}

uint64_t sub_257DAC238()
{
  return sub_257DAB2A4(&qword_26B2E0668, (void (*)(uint64_t))type metadata accessor for NotesSharedIndexedSearchView);
}

uint64_t sub_257DAC280()
{
  return sub_257DAB2A4(&qword_26B2E0660, (void (*)(uint64_t))type metadata accessor for NotesSharedIndexedSearchView);
}

uint64_t sub_257DAC2C8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of NotesSharedIndexedSearchView.body>>, 1);
}

uint64_t sub_257DAC2E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_19Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_26B2E05F0, a2);
}

uint64_t sub_257DAC2F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_257DA4FDC(a1, a2, a3, a4, &qword_26B2E05F0, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date);
}

uint64_t sub_257DAC320@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_21Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge, a2);
}

uint64_t sub_257DAC32C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_22Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
}

uint64_t sub_257DAC338@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_257DAC394@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_19Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_26B2E0678, a2);
}

uint64_t keypath_get_19Tm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6 = *a1 + *a2;
  swift_beginAccess();
  return sub_257D9FEB4(v6, a4, a3);
}

uint64_t sub_257DAC40C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_257DA4FDC(a1, a2, a3, a4, qword_26B2E0678, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL);
}

uint64_t sub_257DAC434@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_21Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges, a2);
}

uint64_t keypath_get_21Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_257DAC490(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_22Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
}

uint64_t keypath_set_22Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t dispatch thunk of NotesIndexModeling.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NotesIndexModeling.showCollaboratorBadge.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NotesIndexModeling.notesFolder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of NotesIndexModeling.attachmentURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of NotesIndexModeling.hasUnreadChanges.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_257DAC54C()
{
  return type metadata accessor for NotesIndexSharedModel(0);
}

void sub_257DAC554()
{
  sub_257DADD04(319, &qword_26B2E05F8, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_257DADD04(319, (unint64_t *)&unk_26B2E05E0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for NotesIndexSharedModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotesIndexSharedModel);
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.__allocating_init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t destroy for NotesYellowHeaderView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for NotesYellowHeaderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for NotesYellowHeaderView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotesYellowHeaderView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesYellowHeaderView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesYellowHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesYellowHeaderView()
{
  return &type metadata for NotesYellowHeaderView;
}

char *initializeBufferWithCopyOfBuffer for NotesSharedIndexedSearchView(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = &v16[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    int64_t v7 = *a2;
    char v8 = *((unsigned char *)a2 + 8);
    sub_257DACF18(*a2, v8);
    *(void *)a1 = v7;
    a1[8] = v8;
    uint64_t v9 = (uint64_t)a2[2];
    uint64_t v10 = (uint64_t)a2[3];
    char v11 = *((unsigned char *)a2 + 32);
    sub_257DACF24(v9, v10, v11);
    *((void *)a1 + 2) = v9;
    *((void *)a1 + 3) = v10;
    a1[32] = v11;
    uint64_t v12 = a3[6];
    os_log_type_t v13 = &a1[v12];
    uint64_t v14 = (char **)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_257DAF9E8();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *(void *)os_log_type_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = (char **)((char *)a2 + v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_257DAFA18();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *(void *)uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[8];
    uint64_t v22 = a3[9];
    long long v23 = *(_OWORD *)((char *)a2 + v21);
    *(_OWORD *)&a1[v21] = v23;
    *(void *)&a1[v22] = *(char **)((char *)a2 + v22);
    uint64_t v24 = a3[11];
    *(void *)&a1[a3[10]] = *(char **)((char *)a2 + a3[10]);
    *(void *)&a1[v24] = *(char **)((char *)a2 + v24);
    uint64_t v25 = a3[13];
    *(void *)&a1[a3[12]] = *(char **)((char *)a2 + a3[12]);
    uint64_t v26 = &a1[v25];
    uint64_t v27 = (char **)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *(void *)uint64_t v26 = *v27;
    *((void *)v26 + 1) = v28;
    uint64_t v29 = a3[14];
    uint64_t v30 = &a1[v29];
    int v31 = (char **)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *(void *)uint64_t v30 = *v31;
    *((void *)v30 + 1) = v32;
    id v33 = (id)v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

id sub_257DACF18(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t sub_257DACF24(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t destroy for NotesSharedIndexedSearchView(uint64_t a1, int *a2)
{
  sub_257DAB340(*(id *)a1, *(unsigned char *)(a1 + 8));
  sub_257DAB34C(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  uint64_t v4 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_257DAF9E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_257DAFA18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_257DACF18(*(id *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  sub_257DACF24(v8, v9, v10);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  os_log_type_t v13 = (void *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_257DAF9E8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_257DAFA18();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  long long v21 = *(_OWORD *)(a2 + v19);
  *(_OWORD *)(a1 + v19) = v21;
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v22 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  uint64_t v23 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a3[14];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  id v31 = (id)v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_257DACF18(*(id *)a2, v7);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_257DAB340(v8, v9);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  char v12 = *(unsigned char *)(a2 + 32);
  sub_257DACF24(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  char v15 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v11;
  *(unsigned char *)(a1 + 32) = v12;
  sub_257DAB34C(v13, v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = a3[6];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (void *)(a2 + v16);
    sub_257D9FE10(a1 + v16, &qword_26B2E05B0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_257DAF9E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      void *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[7];
    long long v21 = (void *)(a1 + v20);
    uint64_t v22 = (void *)(a2 + v20);
    sub_257D9FE10(a1 + v20, &qword_26B2E05C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_257DAFA18();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *long long v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v24 = a3[8];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = *(void **)v26;
  uint64_t v28 = *(void *)(v26 + 8);
  uint64_t v29 = *(void **)v25;
  *(void *)uint64_t v25 = *(void *)v26;
  id v30 = v27;

  *(void *)(v25 + 8) = v28;
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v31 = a3[13];
  uint64_t v32 = (void *)(a1 + v31);
  id v33 = (void *)(a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[14];
  uint64_t v35 = (void *)(a1 + v34);
  unsigned __int8 v36 = (void *)(a2 + v34);
  void *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = a3[6];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_257DAF9E8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[7];
  char v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_257DAFA18();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  return a1;
}

uint64_t assignWithTake for NotesSharedIndexedSearchView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_257DAB340(v8, v9);
  char v10 = *((unsigned char *)a2 + 32);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  char v13 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(unsigned char *)(a1 + 32) = v10;
  sub_257DAB34C(v11, v12, v13);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (char *)a2 + v14;
    sub_257D9FE10(a1 + v14, &qword_26B2E05B0);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_257DAF9E8();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = (void *)(a1 + v19);
    long long v21 = (char *)a2 + v19;
    sub_257D9FE10(a1 + v19, &qword_26B2E05C0);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_257DAFA18();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
  }
  uint64_t v24 = a3[8];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (uint64_t *)((char *)a2 + v24);
  uint64_t v27 = *v26;
  uint64_t v28 = v26[1];
  uint64_t v29 = *(void **)v25;
  *(void *)uint64_t v25 = v27;

  *(void *)(v25 + 8) = v28;
  uint64_t v30 = a3[10];
  *(void *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  *(void *)(a1 + v30) = *(uint64_t *)((char *)a2 + v30);
  uint64_t v31 = a3[12];
  *(void *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
  *(void *)(a1 + v31) = *(uint64_t *)((char *)a2 + v31);
  uint64_t v32 = a3[13];
  id v33 = (void *)(a1 + v32);
  uint64_t v34 = (uint64_t *)((char *)a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *id v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[14];
  uint64_t v38 = (void *)(a1 + v37);
  char v39 = (uint64_t *)((char *)a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *uint64_t v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257DAD968);
}

uint64_t sub_257DAD968(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3C0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[6];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3C8);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[7];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[8]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257DADA94);
}

uint64_t sub_257DADA94(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3C0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E3C8);
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[8]) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[7];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  return v13(a1 + v11, a2, a2, v9);
}

void sub_257DADBA8()
{
  sub_257DADD04(319, &qword_26B2E05B8, MEMORY[0x263F200B0], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_257DADD04(319, &qword_26B2E05C8, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_257DADD04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_257DADD68()
{
  return sub_257DAF85C(&qword_26B2E0470, &qword_26B2E0478);
}

unint64_t sub_257DADDA8()
{
  unint64_t result = qword_26B2E0350;
  if (!qword_26B2E0350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E0358);
    sub_257DADE48();
    sub_257DAF85C(&qword_26B2E0408, &qword_26B2E0410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0350);
  }
  return result;
}

unint64_t sub_257DADE48()
{
  unint64_t result = qword_26B2E0318;
  if (!qword_26B2E0318)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E0320);
    sub_257DAF85C(&qword_26B2E0440, &qword_26B2E0448);
    sub_257DAF85C(&qword_26B2E03A8, &qword_26B2E03B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0318);
  }
  return result;
}

ValueMetadata *type metadata accessor for SquareCropModifier()
{
  return &type metadata for SquareCropModifier;
}

uint64_t getEnumTagSinglePayload for NotesSharedIndexedSearchView.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for NotesSharedIndexedSearchView.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x257DAE00CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_257DAE034()
{
  return 0;
}

ValueMetadata *type metadata accessor for NotesSharedIndexedSearchView.CodingKeys()
{
  return &type metadata for NotesSharedIndexedSearchView.CodingKeys;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotesIndexSharedModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NotesIndexSharedModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x257DAE1B4);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_257DAE1DC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_257DAE1E4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NotesIndexSharedModel.CodingKeys()
{
  return &type metadata for NotesIndexSharedModel.CodingKeys;
}

unint64_t sub_257DAE200()
{
  unint64_t result = qword_26A05E3D0;
  if (!qword_26A05E3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E3D0);
  }
  return result;
}

unint64_t sub_257DAE258()
{
  unint64_t result = qword_26A05E3D8;
  if (!qword_26A05E3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E3D8);
  }
  return result;
}

uint64_t sub_257DAE2AC(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_257DB36B8, 1);
}

unint64_t sub_257DAE2CC()
{
  unint64_t result = qword_26B2E0658;
  if (!qword_26B2E0658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0658);
  }
  return result;
}

unint64_t sub_257DAE324()
{
  unint64_t result = qword_26B2E0650;
  if (!qword_26B2E0650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0650);
  }
  return result;
}

unint64_t sub_257DAE37C()
{
  unint64_t result = qword_26B2E0610;
  if (!qword_26B2E0610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0610);
  }
  return result;
}

unint64_t sub_257DAE3D4()
{
  unint64_t result = qword_26B2E0608;
  if (!qword_26B2E0608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0608);
  }
  return result;
}

uint64_t sub_257DAE428(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_257DB01C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000257DB1820 || (sub_257DB01C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6F467365746F6ELL && a2 == 0xEB00000000726564 || (sub_257DB01C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D686361747461 && a2 == 0xED00004C5255746ELL || (sub_257DB01C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000257DB1850)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_257DB01C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_257DAE66C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0400);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_257DAE700@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B2E0400) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_257DAACF4(v4, a1);
}

uint64_t sub_257DAE784(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_257DAE7E4(uint64_t result)
{
  *(unsigned char *)(result + 185) = 1;
  return result;
}

unint64_t sub_257DAE7F0()
{
  unint64_t result = qword_26B2E03E0;
  if (!qword_26B2E03E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E03E8);
    sub_257DAF85C(&qword_26B2E0450, &qword_26B2E0458);
    sub_257DAF85C(&qword_26B2E0460, &qword_26B2E0468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E03E0);
  }
  return result;
}

uint64_t sub_257DAE8B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  if ((a25 & 1) == 0)
  {
    char v26 = a24 & 1;
    return sub_257DAE93C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             v26);
  }
  return result;
}

uint64_t sub_257DAE93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if ((a24 & 1) == 0)
  {
    swift_retain();
    swift_retain();
  }
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_257DAE9B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  char v4 = *(unsigned char *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  uint64_t v8 = *(void *)(a1 + 184);
  uint64_t v9 = *(void *)(a1 + 176);
  sub_257DAEA74(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257DAEA74(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_257DAEA84(v5, v6, v9, v8);
  return a1;
}

uint64_t sub_257DAEA74(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_257DAEA84(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_257DAEA74(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_257DAEAC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  char v4 = *(unsigned char *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  uint64_t v8 = *(void *)(a1 + 184);
  uint64_t v9 = *(void *)(a1 + 176);
  sub_257DAEB84(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_257DAEB84(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_257DAEB94(v5, v6, v9, v8);
  return a1;
}

uint64_t sub_257DAEB84(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_257DAEB94(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_257DAEB84(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_257DAEBD8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(_WORD *)(a1 + 184));
  return a1;
}

uint64_t sub_257DAEC5C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  if ((a25 & 1) == 0)
  {
    char v26 = a24 & 1;
    return sub_257DAECE8(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             v26);
  }
  return result;
}

uint64_t sub_257DAECE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if ((a24 & 1) == 0)
  {
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_257DAED64(uint64_t result)
{
  *(unsigned char *)(result + 184) = 1;
  return result;
}

uint64_t sub_257DAED70(uint64_t result)
{
  *(unsigned char *)(result + 185) = 0;
  return result;
}

uint64_t sub_257DAED78(uint64_t result)
{
  *(unsigned char *)(result + 184) = 0;
  return result;
}

uint64_t sub_257DAED80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_257DAFB28();
  *a1 = result;
  return result;
}

uint64_t sub_257DAEDAC()
{
  return sub_257DAFB38();
}

uint64_t sub_257DAEDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotesSharedIndexedSearchView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_257DAEE40@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for NotesSharedIndexedSearchView(0);
  return sub_257DAA680(a1);
}

uint64_t objectdestroy_48Tm()
{
  uint64_t v1 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_257DAB340(*(id *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  sub_257DAB34C(*(void *)(v5 + 16), *(void *)(v5 + 24), *(unsigned char *)(v5 + 32));
  uint64_t v6 = v0 + v3 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_257DAF9E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2E05C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_257DAFA18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_257DAF098@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for NotesSharedIndexedSearchView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_257DAA988(v4, a1);
}

uint64_t sub_257DAF108()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_257DAF148@<X0>(uint64_t a1@<X8>)
{
  return sub_257DAB9F4(*(void (**)(void))(v1 + 16), *(void (**)(void))(v1 + 32), a1);
}

unint64_t sub_257DAF154()
{
  unint64_t result = qword_26B2E03D0;
  if (!qword_26B2E03D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E03D8);
    sub_257DAF1C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E03D0);
  }
  return result;
}

unint64_t sub_257DAF1C8()
{
  unint64_t result = qword_26B2E0368;
  if (!qword_26B2E0368)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E0370);
    sub_257DAF268();
    sub_257DAF85C(&qword_26B2E02A8, &qword_26B2E02B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0368);
  }
  return result;
}

unint64_t sub_257DAF268()
{
  unint64_t result = qword_26B2E0338;
  if (!qword_26B2E0338)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E0340);
    sub_257DAF2E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0338);
  }
  return result;
}

unint64_t sub_257DAF2E4()
{
  unint64_t result = qword_26B2E0300;
  if (!qword_26B2E0300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E0308);
    sub_257DAF360();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0300);
  }
  return result;
}

unint64_t sub_257DAF360()
{
  unint64_t result = qword_26B2E02A0;
  if (!qword_26B2E02A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E02A0);
  }
  return result;
}

uint64_t sub_257DAF3B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_257DAF41C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_257DAF47C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_257DAFB48();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_257DAF4B0()
{
  return sub_257DAFB58();
}

unint64_t sub_257DAF4E0()
{
  unint64_t result = qword_26B2E0490;
  if (!qword_26B2E0490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0490);
  }
  return result;
}

void sub_257DAF534()
{
}

unint64_t sub_257DAF554()
{
  unint64_t result = qword_26B2E0270;
  if (!qword_26B2E0270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E0270);
  }
  return result;
}

void sub_257DAF5A8()
{
}

uint64_t sub_257DAF5D0()
{
  return 8;
}

uint64_t sub_257DAF5DC()
{
  return swift_release();
}

uint64_t sub_257DAF5E4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_257DAF5F4()
{
  return sub_257DAFF18();
}

void *sub_257DAF63C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_257DAF648(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_257DAF6AC()
{
  unint64_t result = qword_26A05E400;
  if (!qword_26A05E400)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A05E400);
  }
  return result;
}

uint64_t sub_257DAF6EC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

double sub_257DAF744@<D0>(uint64_t a1@<X8>)
{
  return sub_257DA6EA4(v1 + 16, a1);
}

uint64_t sub_257DAF74C(uint64_t a1)
{
  return a1;
}

uint64_t sub_257DAF7B0()
{
  return sub_257DA6FCC();
}

unint64_t sub_257DAF7BC()
{
  unint64_t result = qword_26B2E02F0;
  if (!qword_26B2E02F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2E02F8);
    sub_257DAF85C(&qword_26B2E02D8, &qword_26B2E02E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2E02F0);
  }
  return result;
}

uint64_t sub_257DAF85C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_257DAF8A8()
{
  return MEMORY[0x270F07DE0]();
}

uint64_t sub_257DAF8B8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_257DAF8C8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_257DAF8D8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_257DAF8E8()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_257DAF8F8()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_257DAF908()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_257DAF918()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_257DAF928()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_257DAF938()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_257DAF948()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_257DAF958()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_257DAF968()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_257DAF978()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_257DAF988()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_257DAF998()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_257DAF9A8()
{
  return MEMORY[0x270F50CB8]();
}

uint64_t sub_257DAF9B8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_257DAF9C8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_257DAF9D8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_257DAF9E8()
{
  return MEMORY[0x270F07E10]();
}

uint64_t sub_257DAF9F8()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_257DAFA08()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_257DAFA18()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_257DAFA28()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_257DAFA38()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_257DAFA48()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_257DAFA58()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_257DAFA68()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_257DAFA78()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_257DAFA88()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_257DAFA98()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_257DAFAA8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_257DAFAB8()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_257DAFAC8()
{
  return MEMORY[0x270F07E38]();
}

uint64_t sub_257DAFAD8()
{
  return MEMORY[0x270F07E40]();
}

uint64_t sub_257DAFAE8()
{
  return MEMORY[0x270F07E48]();
}

uint64_t sub_257DAFAF8()
{
  return MEMORY[0x270F07E50]();
}

uint64_t sub_257DAFB08()
{
  return MEMORY[0x270F07E58]();
}

uint64_t sub_257DAFB18()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_257DAFB28()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_257DAFB38()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_257DAFB48()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_257DAFB58()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_257DAFB68()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_257DAFB78()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_257DAFB88()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_257DAFB98()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_257DAFBA8()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_257DAFBB8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_257DAFBC8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_257DAFBD8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_257DAFBE8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_257DAFBF8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_257DAFC08()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_257DAFC18()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_257DAFC28()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_257DAFC38()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_257DAFC48()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_257DAFC58()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_257DAFC68()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_257DAFC78()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_257DAFC88()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_257DAFC98()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_257DAFCA8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_257DAFCB8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_257DAFCC8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_257DAFCD8()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_257DAFCE8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_257DAFCF8()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_257DAFD08()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_257DAFD18()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_257DAFD28()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_257DAFD38()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_257DAFD48()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_257DAFD58()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_257DAFD68()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_257DAFD78()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_257DAFD88()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_257DAFD98()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_257DAFDA8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_257DAFDB8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_257DAFDC8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_257DAFDD8()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_257DAFDE8()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_257DAFDF8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_257DAFE08()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_257DAFE18()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_257DAFE28()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_257DAFE38()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_257DAFE48()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_257DAFE58()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_257DAFE68()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_257DAFE78()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_257DAFE88()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_257DAFE98()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_257DAFEA8()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_257DAFEB8()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_257DAFEC8()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_257DAFED8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_257DAFEE8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_257DAFEF8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_257DAFF08()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_257DAFF18()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_257DAFF28()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_257DAFF38()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_257DAFF48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257DAFF58()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_257DAFF68()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_257DAFF78()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_257DAFF88()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_257DAFF98()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_257DAFFA8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_257DAFFB8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_257DAFFC8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_257DAFFD8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_257DAFFE8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_257DAFFF8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_257DB0008()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_257DB0018()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_257DB0028()
{
  return MEMORY[0x270F0CCA0]();
}

uint64_t sub_257DB0038()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_257DB0048()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_257DB0058()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_257DB0068()
{
  return MEMORY[0x270EE1F28]();
}

uint64_t sub_257DB0078()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_257DB0088()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_257DB0098()
{
  return MEMORY[0x270F0CCA8]();
}

uint64_t sub_257DB00A8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_257DB00B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_257DB00C8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_257DB00D8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_257DB00E8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_257DB00F8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257DB0108()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_257DB0118()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_257DB0128()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_257DB0138()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_257DB0148()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_257DB0158()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_257DB0168()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_257DB0178()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_257DB0188()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_257DB0198()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_257DB01A8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_257DB01B8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_257DB01C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_257DB01D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_257DB01E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_257DB01F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_257DB0208()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_257DB0218()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_257DB0248()
{
  return MEMORY[0x270FA0128]();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return MEMORY[0x270F50DF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double remainder(long double __x, long double __y)
{
  MEMORY[0x270EDB1D8](__x, __y);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}