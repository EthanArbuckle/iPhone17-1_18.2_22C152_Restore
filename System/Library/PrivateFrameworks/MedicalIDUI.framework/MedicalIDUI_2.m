uint64_t sub_255ECF07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255ECF090);
}

uint64_t sub_255ECF090(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_14:
    return v9(v10, a2, v8);
  }
  sub_255EC8808(0, &qword_269F35338, MEMORY[0x270FA9818], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_13:
    uint64_t v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_14;
  }
  sub_255EC8808(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_13;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v15 = *(void *)(a1 + a3[10]);
    if (v15 >= 0xFFFFFFFF) {
      LODWORD(v15) = -1;
    }
    return (v15 + 1);
  }
  else
  {
    sub_255ECA8C8(0, &qword_269F38948, MEMORY[0x263F1B5D0]);
    if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
    {
      uint64_t v8 = v17;
      uint64_t v12 = *(void *)(v17 - 8);
      uint64_t v13 = a3[12];
      goto LABEL_13;
    }
    sub_255ECFF18(0, &qword_269F384C8, MEMORY[0x263F1B5D0]);
    v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a3[13];
    return v19(v21, a2, v20);
  }
}

uint64_t sub_255ECF334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255ECF348);
}

void sub_255ECF348(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_12:
    v11(v12, a2, a2, v10);
    return;
  }
  sub_255EC8808(0, &qword_269F35338, MEMORY[0x270FA9818], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_11:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_12;
  }
  sub_255EC8808(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_11;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[10]) = (a2 - 1);
    return;
  }
  sub_255ECA8C8(0, &qword_269F38948, MEMORY[0x263F1B5D0]);
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[12];
    goto LABEL_11;
  }
  sub_255ECFF18(0, &qword_269F384C8, MEMORY[0x263F1B5D0]);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[13];
  v19(v21, a2, a2, v20);
}

void sub_255ECF5EC()
{
  type metadata accessor for MedicalIDBiometricsViewModel();
  if (v0 <= 0x3F)
  {
    sub_255EC8808(319, &qword_269F35320, MEMORY[0x270FA9818], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      sub_255EC8808(319, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        sub_255ECA8C8(319, &qword_269F38948, MEMORY[0x263F1B5D0]);
        if (v3 <= 0x3F)
        {
          sub_255ECFF18(319, &qword_269F384C8, MEMORY[0x263F1B5D0]);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

unint64_t sub_255ECF844()
{
  unint64_t result = qword_269F38960;
  if (!qword_269F38960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269F38960);
  }
  return result;
}

uint64_t sub_255ECF898()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255ECF8B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_255ECF920()
{
  type metadata accessor for MedicalIDEditBiometricsModalView();
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_255D7E778;
  return sub_255EC8DA4();
}

void sub_255ECF9EC()
{
  if (!qword_269F38978)
  {
    sub_255ECFA80();
    sub_255ECFCCC(&qword_269F389C0, (void (*)(uint64_t))sub_255ECFA80);
    unint64_t v0 = type metadata accessor for MedicalIDEditModal();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38978);
    }
  }
}

void sub_255ECFA80()
{
  if (!qword_269F38980)
  {
    sub_255EC8808(255, &qword_269F38988, (uint64_t (*)(uint64_t))sub_255ECFB4C, MEMORY[0x263F1BAC8]);
    sub_255ECFDA8();
    sub_255DD25F8();
    unint64_t v0 = type metadata accessor for EditingScrollView();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38980);
    }
  }
}

void sub_255ECFB4C()
{
  if (!qword_269F38990)
  {
    type metadata accessor for EditHeightCellView();
    sub_255ECFBD4();
    type metadata accessor for EditBloodTypeCellView();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_269F38990);
    }
  }
}

void sub_255ECFBD4()
{
  if (!qword_269F38998)
  {
    type metadata accessor for EditWeightCellView();
    sub_255E13D48(255, &qword_269F389A0, (uint64_t)&type metadata for MedicalIDEditBiometricsModalView.TextFieldFocus, MEMORY[0x263F8D8F0]);
    sub_255ECFCCC(&qword_269F389A8, (void (*)(uint64_t))type metadata accessor for EditWeightCellView);
    sub_255ECFD14();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38998);
    }
  }
}

uint64_t sub_255ECFCCC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_255ECFD14()
{
  unint64_t result = qword_269F389B0;
  if (!qword_269F389B0)
  {
    sub_255E13D48(255, &qword_269F389A0, (uint64_t)&type metadata for MedicalIDEditBiometricsModalView.TextFieldFocus, MEMORY[0x263F8D8F0]);
    sub_255ECA7AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F389B0);
  }
  return result;
}

unint64_t sub_255ECFDA8()
{
  unint64_t result = qword_269F389B8;
  if (!qword_269F389B8)
  {
    sub_255EC8808(255, &qword_269F38988, (uint64_t (*)(uint64_t))sub_255ECFB4C, MEMORY[0x263F1BAC8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F389B8);
  }
  return result;
}

uint64_t sub_255ECFE34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MedicalIDEditBiometricsModalView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_255EC9A54(v4, a1);
}

uint64_t sub_255ECFEA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MedicalIDEditBiometricsModalView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_255ECA5B4(v4, a1);
}

void sub_255ECFF18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_255EC886C(255, &qword_269F352E8, &qword_269F352D8, (unint64_t *)&qword_269F352E0);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_255ECFFA0(uint64_t a1, uint64_t a2)
{
  sub_255ECA8C8(0, &qword_269F36BC0, MEMORY[0x263F1B750]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_255ED0020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = a4(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_255ED0080()
{
  if (!qword_269F389C8)
  {
    sub_255E13D48(255, &qword_269F389A0, (uint64_t)&type metadata for MedicalIDEditBiometricsModalView.TextFieldFocus, MEMORY[0x263F8D8F0]);
    sub_255ECFD14();
    unint64_t v0 = sub_255EEE5A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F389C8);
    }
  }
}

uint64_t objectdestroyTm_25()
{
  uint64_t v1 = (int *)type metadata accessor for MedicalIDEditBiometricsModalView();
  uint64_t v36 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v2 = v0 + ((v36 + 16) & ~v36);
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v3 = v2 + v35[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v5 = v3 + v4[13];
  uint64_t v6 = sub_255EEE100();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = v3 + v4[14];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v34 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)(v3 + v4[19]);
  unint64_t v11 = v10[1];
  if (v11 >> 60 != 15) {
    sub_255D80D04(*v10, v11);
  }
  uint64_t v12 = v3 + v4[20];
  uint64_t v13 = sub_255EEDF60();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }

  uint64_t v15 = v3 + v4[22];
  if (!v8(v15, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v15, v6);
  }
  uint64_t v16 = v2 + v35[6];
  uint64_t v17 = sub_255EEE200();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
  v18(v16, v17);
  uint64_t v19 = v2 + v35[7];
  v18(v19, v17);

  uint64_t v20 = v2 + v35[8];
  v18(v20, v17);
  uint64_t v21 = type metadata accessor for MedicalIDWeightFormatter();

  if (*(void *)(v2 + v1[5] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  uint64_t v22 = v2 + v1[6];
  sub_255EC8808(0, &qword_269F35320, MEMORY[0x270FA9818], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1) {
    v18(v22, v17);
  }
  else {
    swift_release();
  }
  uint64_t v23 = v2 + v1[7];
  sub_255EC8808(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_255EEE730();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  }
  else
  {
    swift_release();
  }
  swift_release();

  swift_release();
  uint64_t v25 = v2 + v1[12];
  sub_255EC88C8(0, (unint64_t *)&qword_269F36388, &qword_269F36390);
  uint64_t v27 = v26;
  uint64_t v28 = *(void *)(v26 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v25, 1, v26)) {
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v25, v27);
  }
  sub_255ECA8C8(0, &qword_269F38948, MEMORY[0x263F1B5D0]);
  swift_release();
  uint64_t v29 = v2 + v1[13];
  sub_255EC88C8(0, &qword_269F352D8, (unint64_t *)&qword_269F352E0);
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)(v30 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v29, 1, v30)) {
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v29, v31);
  }
  sub_255ECFF18(0, &qword_269F384C8, MEMORY[0x263F1B5D0]);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_255ED0808()
{
  return sub_255ECA544();
}

uint64_t sub_255ED0864()
{
  return sub_255ECFCCC(&qword_269F389E0, (void (*)(uint64_t))sub_255ECF9EC);
}

uint64_t MedicalIDNavigationBarView.init(healthStore:medicalIDData:showDateUpdated:locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v31 = a4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_255ED534C(0, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData, MEMORY[0x263F8D8F0]);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v29 - v13);
  char v32 = a3;
  sub_255ED0D44(a2, (uint64_t)&v29 - v13, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData, v8);
  uint64_t v15 = type metadata accessor for MedicalIDData();
  uint64_t v16 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  if (v16(v14, 1, v15) == 1)
  {
    sub_255ED3AD8((uint64_t)v14, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData, MEMORY[0x263F8D8F0]);
    uint64_t v17 = 0;
    unint64_t v18 = 0;
  }
  else
  {
    unint64_t v18 = v14[1];
    if (v18)
    {
      uint64_t v17 = *v14;
      uint64_t v19 = HIBYTE(v18) & 0xF;
      if ((v18 & 0x2000000000000000) == 0) {
        uint64_t v19 = *v14 & 0xFFFFFFFFFFFFLL;
      }
      if (v19)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    sub_255ED0DB4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for MedicalIDData);
  }
  sub_255ED534C(0, &qword_269F35058, MEMORY[0x270FA9208], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v29 - v21;
  sub_255ED0CC4(a2, (uint64_t)v12, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData);
  if (v16((uint64_t *)v12, 1, v15) == 1)
  {
    sub_255ED3AD8((uint64_t)v12, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData, MEMORY[0x263F8D8F0]);
    uint64_t v23 = sub_255EEE100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  }
  else
  {
    sub_255ED0D44((uint64_t)&v12[*(int *)(v15 + 88)], (uint64_t)v22, &qword_269F35058, MEMORY[0x270FA9208], MEMORY[0x263F8D8F0]);
    sub_255ED0DB4((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for MedicalIDData);
  }
  type metadata accessor for MedicalIDNavigationBarViewModel();
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v30;
  v24[3] = v17;
  v24[4] = v18;
  sub_255ED0CC4((uint64_t)v22, (uint64_t)v24 + OBJC_IVAR____TtC11MedicalIDUI31MedicalIDNavigationBarViewModel_dateSaved, &qword_269F35058, MEMORY[0x270FA9208]);
  uint64_t v25 = (char *)v24 + OBJC_IVAR____TtC11MedicalIDUI31MedicalIDNavigationBarViewModel_locale;
  uint64_t v26 = sub_255EEE200();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v25, v31, v26);
  char v28 = v32;
  *(void *)a5 = v24;
  *(unsigned char *)(a5 + 8) = v28;
  return result;
}

uint64_t sub_255ED0CC4(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_255ED534C(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_255ED0D44(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_255ED534C(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_255ED0DB4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t MedicalIDNavigationBarView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = sub_255EEED70();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_255ED1134();
  return sub_255ED0E70(v3, v4, a1 + *(int *)(v5 + 44));
}

uint64_t sub_255ED0E70@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a3;
  sub_255ED126C();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v36 - v9;
  uint64_t v11 = sub_255EEEC90();
  if (qword_269F34A58 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_269F3FD58;
  *(void *)uint64_t v10 = v11;
  *((void *)v10 + 1) = v12;
  v10[16] = 0;
  sub_255ED2250();
  sub_255ED1618(a1, (uint64_t)&v10[*(int *)(v13 + 44)]);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t KeyPath = 0;
  uint64_t v19 = 0;
  if (a2)
  {
    uint64_t v20 = sub_255E887BC(a1 + OBJC_IVAR____TtC11MedicalIDUI31MedicalIDNavigationBarViewModel_dateSaved);
    if (v21)
    {
      uint64_t v38 = v20;
      uint64_t v39 = v21;
      sub_255DAD520();
      uint64_t v22 = sub_255EEF3D0();
      uint64_t v24 = v23;
      v36[1] = v25;
      char v27 = v26 & 1;
      sub_255EEF290();
      uint64_t v14 = sub_255EEF3B0();
      uint64_t v15 = v28;
      char v30 = v29;
      uint64_t v17 = v31;
      swift_release();
      uint64_t v16 = v30 & 1;
      sub_255D85120(v22, v24, v27);
      swift_bridgeObjectRelease();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t KeyPath = 0;
      uint64_t v19 = 0;
    }
  }
  sub_255ED22E8((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))sub_255ED126C);
  uint64_t v32 = v37;
  sub_255ED22E8((uint64_t)v8, v37, (uint64_t (*)(void))sub_255ED126C);
  sub_255ED11CC();
  uint64_t v34 = v32 + *(int *)(v33 + 48);
  *(void *)uint64_t v34 = v14;
  *(void *)(v34 + 8) = v15;
  *(void *)(v34 + 16) = v16;
  *(void *)(v34 + 24) = v17;
  *(void *)(v34 + 32) = KeyPath;
  *(void *)(v34 + 40) = v19;
  *(unsigned char *)(v34 + 48) = 0;
  sub_255ED2350(v14, v15, v16, v17);
  sub_255ED0DB4((uint64_t)v10, (uint64_t (*)(void))sub_255ED126C);
  sub_255ED23A0(v14, v15, v16, v17);
  return sub_255ED0DB4((uint64_t)v8, (uint64_t (*)(void))sub_255ED126C);
}

void sub_255ED1134()
{
  if (!qword_269F389F0)
  {
    sub_255ED534C(255, &qword_269F389F8, (uint64_t (*)(uint64_t))sub_255ED11CC, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_255EEE7B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F389F0);
    }
  }
}

void sub_255ED11CC()
{
  if (!qword_269F38A00)
  {
    sub_255ED126C();
    sub_255ED534C(255, &qword_269F38A48, (uint64_t (*)(uint64_t))sub_255ED1584, MEMORY[0x263F8D8F0]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F38A00);
    }
  }
}

void sub_255ED126C()
{
  if (!qword_269F38A08)
  {
    sub_255ED534C(255, &qword_269F38A10, (uint64_t (*)(uint64_t))sub_255ED1320, MEMORY[0x263F1BAC8]);
    sub_255ED21EC(&qword_269F38A40, &qword_269F38A10, (uint64_t (*)(uint64_t))sub_255ED1320);
    unint64_t v0 = sub_255EEF8C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A08);
    }
  }
}

void sub_255ED1320()
{
  if (!qword_269F38A18)
  {
    sub_255ED1388();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F38A18);
    }
  }
}

void sub_255ED1388()
{
  if (!qword_269F38A20)
  {
    sub_255ED141C();
    sub_255ED53B0(255, (unint64_t *)&qword_269F35128, MEMORY[0x263F1B440], MEMORY[0x263F1B420], MEMORY[0x263F1A180]);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A20);
    }
  }
}

void sub_255ED141C()
{
  if (!qword_269F38A28)
  {
    sub_255ED149C();
    sub_255ED152C(255, (unint64_t *)&qword_269F35178, &qword_269F35180);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A28);
    }
  }
}

void sub_255ED149C()
{
  if (!qword_269F38A30)
  {
    sub_255ED534C(255, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A30);
    }
  }
}

void sub_255ED152C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_255E09260(255, a3);
    unint64_t v4 = sub_255EEF080();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_255ED1584()
{
  if (!qword_269F38A50)
  {
    sub_255ED152C(255, &qword_269F37650, &qword_269F37658);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A50);
    }
  }
}

uint64_t sub_255ED15FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255ED1618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v75 = a2;
  sub_255ED534C(0, &qword_269F36090, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  v80 = (char *)v68 - v3;
  uint64_t v79 = sub_255EEF2C0();
  uint64_t v81 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v77 = (char *)v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED534C(0, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (void *)((char *)v68 - v7);
  uint64_t v9 = sub_255EEF7D0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED149C();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void *)((char *)v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_255ED141C();
  uint64_t v72 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED1388();
  uint64_t v73 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v78 = (uint64_t)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v76 = (uint64_t)v68 - v23;
  if (qword_269F34C48 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_255EEF7B0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B540], v9);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v6 + 28), v12, v9);
  *uint64_t v8 = KeyPath;
  uint64_t v26 = (uint64_t)v16 + *(int *)(v14 + 36);
  char v27 = (uint64_t (*)(uint64_t))MEMORY[0x263F1B548];
  uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F1A418];
  sub_255ED0D44((uint64_t)v8, v26, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  *uint64_t v16 = v24;
  swift_retain();
  sub_255ED3AD8((uint64_t)v8, &qword_269F38A38, v27, v28);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  uint64_t v29 = v81;
  char v30 = *(void (**)(void))(v81 + 104);
  uint64_t v31 = v77;
  unsigned int v71 = *MEMORY[0x263F1A6C0];
  uint64_t v32 = v79;
  v70 = (void (*)(char *, void, uint64_t))v30;
  v30(v77);
  uint64_t v33 = sub_255EEF210();
  uint64_t v34 = *(void *)(v33 - 8);
  v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v36 = (uint64_t)v80;
  v68[1] = v34 + 56;
  v69 = v35;
  v35(v80, 1, 1, v33);
  sub_255EEF220();
  uint64_t v37 = sub_255EEF230();
  sub_255ED3AD8(v36, &qword_269F36090, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0]);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v81 = v29 + 8;
  v68[0] = v38;
  v38(v31, v32);
  uint64_t v39 = swift_getKeyPath();
  sub_255ED22E8((uint64_t)v16, (uint64_t)v19, (uint64_t (*)(void))sub_255ED149C);
  v40 = (uint64_t *)&v19[*(int *)(v72 + 36)];
  uint64_t *v40 = v39;
  v40[1] = v37;
  sub_255ED0DB4((uint64_t)v16, (uint64_t (*)(void))sub_255ED149C);
  if (qword_269F34C30 != -1) {
    swift_once();
  }
  uint64_t v41 = qword_269F3FE50;
  uint64_t v42 = v78;
  sub_255ED22E8((uint64_t)v19, v78, (uint64_t (*)(void))sub_255ED141C);
  *(void *)(v42 + *(int *)(v73 + 36)) = v41;
  swift_retain();
  sub_255ED0DB4((uint64_t)v19, (uint64_t (*)(void))sub_255ED141C);
  sub_255ED3B8C(v42, v76, (uint64_t (*)(void))sub_255ED1388);
  uint64_t v82 = sub_255EA1C1C();
  uint64_t v83 = v43;
  sub_255DAD520();
  uint64_t v44 = sub_255EEF3D0();
  uint64_t v46 = v45;
  char v48 = v47 & 1;
  v49 = v77;
  uint64_t v50 = v79;
  v70(v77, v71, v79);
  uint64_t v51 = (uint64_t)v80;
  v69(v80, 1, 1, v33);
  sub_255EEF220();
  sub_255EEF230();
  sub_255ED3AD8(v51, &qword_269F36090, MEMORY[0x263F1A620], MEMORY[0x263F8D8F0]);
  ((void (*)(char *, uint64_t))v68[0])(v49, v50);
  uint64_t v52 = sub_255EEF3B0();
  uint64_t v54 = v53;
  LOBYTE(v51) = v55;
  swift_release();
  LOBYTE(v50) = v51 & 1;
  sub_255D85120(v44, v46, v48);
  swift_bridgeObjectRelease();
  uint64_t v82 = qword_269F3FE50;
  swift_retain();
  uint64_t v56 = sub_255EEF370();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  LOBYTE(v44) = v61 & 1;
  sub_255D85120(v52, v54, v50);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v62 = v76;
  uint64_t v63 = v78;
  sub_255ED22E8(v76, v78, (uint64_t (*)(void))sub_255ED1388);
  uint64_t v64 = v75;
  sub_255ED22E8(v63, v75, (uint64_t (*)(void))sub_255ED1388);
  sub_255ED1320();
  uint64_t v66 = v64 + *(int *)(v65 + 48);
  *(void *)uint64_t v66 = v56;
  *(void *)(v66 + 8) = v58;
  *(unsigned char *)(v66 + 16) = v44;
  *(void *)(v66 + 24) = v60;
  sub_255D85214(v56, v58, v44);
  swift_bridgeObjectRetain();
  sub_255ED0DB4(v62, (uint64_t (*)(void))sub_255ED1388);
  sub_255D85120(v56, v58, v44);
  swift_bridgeObjectRelease();
  return sub_255ED0DB4(v63, (uint64_t (*)(void))sub_255ED1388);
}

uint64_t sub_255ED1EEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = sub_255EEED70();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_255ED1134();
  return sub_255ED0E70(v3, v4, a1 + *(int *)(v5 + 44));
}

uint64_t initializeBufferWithCopyOfBuffer for MedicalIDNavigationBarView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MedicalIDNavigationBarView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for MedicalIDNavigationBarView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicalIDNavigationBarView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicalIDNavigationBarView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicalIDNavigationBarView()
{
  return &type metadata for MedicalIDNavigationBarView;
}

uint64_t sub_255ED20A8()
{
  return sub_255ED20F0(&qword_269F38A58, (void (*)(uint64_t))sub_255ED2138);
}

uint64_t sub_255ED20F0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_255ED2138()
{
  if (!qword_269F38A60)
  {
    sub_255ED534C(255, &qword_269F389F8, (uint64_t (*)(uint64_t))sub_255ED11CC, MEMORY[0x263F1BAC8]);
    sub_255ED21EC(&qword_269F38A68, &qword_269F389F8, (uint64_t (*)(uint64_t))sub_255ED11CC);
    unint64_t v0 = sub_255EEF950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A60);
    }
  }
}

uint64_t sub_255ED21EC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_255ED534C(255, a2, a3, MEMORY[0x263F1BAC8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_255ED2250()
{
  if (!qword_269F38A70)
  {
    sub_255ED534C(255, &qword_269F38A10, (uint64_t (*)(uint64_t))sub_255ED1320, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_255EEE7B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A70);
    }
  }
}

uint64_t sub_255ED22E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_255ED2350(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_255D85214(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_255ED23A0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_255D85120(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_255ED23F0(uint64_t a1)
{
  uint64_t v2 = sub_255EEEE90();
  MEMORY[0x270FA5388](v2 - 8);
  sub_255ED517C();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED534C(0, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - v13;
  uint64_t v15 = *(void **)(a1 + *(int *)(type metadata accessor for MedicalIDNavigationBarViewModifier() + 24));
  if (v15)
  {
    if (objc_msgSend(v15, sel_isHostingView))
    {
      sub_255ED50A8(0);
      uint64_t v17 = v16;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v12, 1, 1, v16);
      uint64_t v18 = sub_255ED5238();
      uint64_t v27 = v4;
      uint64_t v28 = v18;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      MEMORY[0x25A29A900](v12, v17, OpaqueTypeConformance2);
      sub_255ED3AD8((uint64_t)v12, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
    }
    else
    {
      uint64_t v20 = sub_255EEEE80();
      MEMORY[0x270FA5388](v20);
      *(&v27 - 2) = a1;
      sub_255ED51E4();
      sub_255EEE680();
      uint64_t v21 = sub_255ED5238();
      MEMORY[0x25A29A8F0](v7, v4, v21);
      sub_255ED50A8(0);
      uint64_t v23 = v22;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
      uint64_t v27 = v4;
      uint64_t v28 = v21;
      uint64_t v24 = swift_getOpaqueTypeConformance2();
      MEMORY[0x25A29A900](v12, v23, v24);
      sub_255ED3AD8((uint64_t)v12, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    unint64_t v25 = sub_255ED526C();
    MEMORY[0x25A29A8F0](v14, v9, v25);
    return sub_255ED3AD8((uint64_t)v14, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
  }
  else
  {
    sub_255DB6ED8();
    sub_255ED20F0((unint64_t *)&qword_269F35578, (void (*)(uint64_t))sub_255DB6ED8);
    uint64_t result = sub_255EEE9E0();
    __break(1u);
  }
  return result;
}

uint64_t sub_255ED287C@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  sub_255D894E4(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED534C(0, &qword_269F389E8, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDData, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v22 - v8;
  uint64_t v10 = type metadata accessor for MedicalIDNavigationBarViewModifier();
  char v11 = a1[*(int *)(v10 + 36) + 8];
  id v12 = *(id *)&a1[*(int *)(v10 + 28)];
  uint64_t v13 = swift_retain();
  uint64_t v14 = sub_255DAA2A0(v13, v11);
  swift_release();
  swift_getKeyPath();
  v22[1] = v14;
  sub_255ED20F0(&qword_269F35218, (void (*)(uint64_t))type metadata accessor for MedicalIDDataManager);
  sub_255EEE2D0();
  swift_release();
  uint64_t v15 = v14 + OBJC_IVAR____TtC11MedicalIDUI20MedicalIDDataManager__medicalIDData;
  swift_beginAccess();
  sub_255ED22E8(v15, (uint64_t)v6, (uint64_t (*)(void))sub_255D894E4);
  swift_release();
  LoadState<>.loadedValue.getter((uint64_t)v9);
  sub_255ED0DB4((uint64_t)v6, (uint64_t (*)(void))sub_255D894E4);
  uint64_t v16 = type metadata accessor for MedicalIDData();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 0, 1, v16);
  LOBYTE(v6) = *a1;
  uint64_t v17 = sub_255EEE200();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255DAAA88((uint64_t)v19);
  uint64_t result = MedicalIDNavigationBarView.init(healthStore:medicalIDData:showDateUpdated:locale:)((uint64_t)v12, (uint64_t)v9, (char)v6, (uint64_t)v19, (uint64_t)&v23);
  char v21 = v24;
  *(void *)a2 = v23;
  *(unsigned char *)(a2 + 8) = v21;
  return result;
}

uint64_t sub_255ED2B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v33[1] = a2;
  uint64_t v3 = sub_255EEEE90();
  MEMORY[0x270FA5388](v3 - 8);
  sub_255DDDF50();
  uint64_t v5 = v4;
  v33[0] = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MedicalIDNavigationBarViewModifier();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255ED534C(0, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, MEMORY[0x263F8D8F0]);
  uint64_t v12 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v33 - v16;
  uint64_t v18 = *(void **)(a1 + *(int *)(v8 + 24));
  if (v18)
  {
    unsigned __int8 v19 = objc_msgSend(v18, sel_isHostingView);
    sub_255ED22E8(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDNavigationBarViewModifier);
    if (v19)
    {
      sub_255ED0DB4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDNavigationBarViewModifier);
      goto LABEL_7;
    }
    uint64_t v20 = *(void **)&v10[*(int *)(v8 + 24)];
    if (v20)
    {
      unsigned __int8 v21 = objc_msgSend(v20, sel_shouldShowDoneButton);
      sub_255ED0DB4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDNavigationBarViewModifier);
      if (v21)
      {
        uint64_t v22 = sub_255EEEE70();
        MEMORY[0x270FA5388](v22);
        v33[-2] = a1;
        sub_255ED53B0(0, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
        sub_255DDE03C();
        sub_255EEE680();
        uint64_t v23 = sub_255E4B024();
        MEMORY[0x25A29A8F0](v7, v5, v23);
        sub_255DDDE9C();
        uint64_t v25 = v24;
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 0, 1, v24);
        uint64_t v34 = v5;
        uint64_t v35 = v23;
        uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
        MEMORY[0x25A29A900](v15, v25, OpaqueTypeConformance2);
        sub_255ED3AD8((uint64_t)v15, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, MEMORY[0x263F8D8F0]);
        (*(void (**)(char *, uint64_t))(v33[0] + 8))(v7, v5);
LABEL_8:
        unint64_t v31 = sub_255ED5400();
        MEMORY[0x25A29A8F0](v17, v12, v31);
        return sub_255ED3AD8((uint64_t)v17, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, MEMORY[0x263F8D8F0]);
      }
LABEL_7:
      sub_255DDDE9C();
      uint64_t v28 = v27;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v15, 1, 1, v27);
      uint64_t v29 = sub_255E4B024();
      uint64_t v34 = v5;
      uint64_t v35 = v29;
      uint64_t v30 = swift_getOpaqueTypeConformance2();
      MEMORY[0x25A29A900](v15, v28, v30);
      sub_255ED3AD8((uint64_t)v15, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, MEMORY[0x263F8D8F0]);
      goto LABEL_8;
    }
  }
  sub_255DB6ED8();
  sub_255ED20F0((unint64_t *)&qword_269F35578, (void (*)(uint64_t))sub_255DB6ED8);
  uint64_t result = sub_255EEE9E0();
  __break(1u);
  return result;
}

uint64_t sub_255ED30E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MedicalIDNavigationBarViewModifier();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = sub_255EEFD40();
  MEMORY[0x270FA5388](v5 - 8);
  sub_255EEFCD0();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_269F352A8;
  uint64_t v7 = sub_255EEE200();
  MEMORY[0x270FA5388](v7 - 8);
  id v8 = v6;
  sub_255EEE1F0();
  v13[1] = sub_255EEFDA0();
  v13[2] = v9;
  sub_255ED22E8(a1, (uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MedicalIDNavigationBarViewModifier);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  sub_255ED3B8C((uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, (uint64_t (*)(void))type metadata accessor for MedicalIDNavigationBarViewModifier);
  sub_255DAD520();
  return sub_255EEF890();
}

uint64_t sub_255ED334C()
{
  uint64_t v0 = sub_255EEE730();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MedicalIDNavigationBarViewModifier();
  sub_255DAA4A8((uint64_t)v3);
  sub_255EEE720();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_255ED3430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v35 = a1;
  uint64_t v3 = sub_255EEEC70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31[1] = MEMORY[0x263F1B070];
  sub_255ED50F0(0, &qword_269F38A88, (void (*)(uint64_t))sub_255ED4D90, (void (*)(void))sub_255ED4E24);
  uint64_t v8 = v7;
  uint64_t v32 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v31 - v9;
  sub_255ED4E58();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F19698], v3);
  sub_255ED4D90();
  uint64_t v16 = v15;
  uint64_t v17 = sub_255ED4E24();
  sub_255EEF5C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v37 = v1;
  sub_255ED5000(0, &qword_269F38AA8, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, (void (*)(void))sub_255ED526C);
  unint64_t v19 = v18;
  uint64_t v38 = v16;
  unint64_t v39 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unsigned __int8 v21 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_255ED534C(255, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
  uint64_t v23 = v22;
  unint64_t v24 = sub_255ED526C();
  uint64_t v38 = v23;
  unint64_t v39 = v24;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  sub_255EEF640();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v8);
  uint64_t v36 = v2;
  sub_255ED5000(0, &qword_269F38AE0, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, (void (*)(void))sub_255ED5400);
  uint64_t v38 = v8;
  unint64_t v39 = v19;
  uint64_t v40 = OpaqueTypeConformance2;
  uint64_t v41 = v25;
  swift_getOpaqueTypeConformance2();
  sub_255ED534C(255, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, v21);
  uint64_t v27 = v26;
  unint64_t v28 = sub_255ED5400();
  uint64_t v38 = v27;
  unint64_t v39 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v33;
  sub_255EEF640();
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v14, v29);
}

uint64_t sub_255ED38A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_255EEEB10();
  *a1 = result;
  return result;
}

uint64_t sub_255ED38D0()
{
  return sub_255EEEB20();
}

uint64_t sub_255ED38FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_255EEEBD0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_255ED3930@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_255EEEBD0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_255ED3964()
{
  return sub_255EEEBE0();
}

uint64_t sub_255ED3994()
{
  return sub_255EEEBE0();
}

uint64_t sub_255ED39C4()
{
  return sub_255EEEA00();
}

uint64_t sub_255ED39E8()
{
  return sub_255EEEA00();
}

uint64_t sub_255ED3A0C(uint64_t a1)
{
  uint64_t v2 = sub_255EEF7D0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_255EEEA10();
}

uint64_t sub_255ED3AD8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_255ED534C(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_255ED3B34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_255EEEB10();
  *a1 = result;
  return result;
}

uint64_t sub_255ED3B60()
{
  return sub_255EEEB20();
}

uint64_t sub_255ED3B8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_255ED3BF4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    sub_255ED534C(0, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_255EEE200();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (uint64_t *)((char *)v4 + v12);
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v17 = *(void **)v15;
    uint64_t v16 = *((void *)v15 + 1);
    unint64_t v18 = *(void **)((char *)a2 + v13);
    *uint64_t v14 = v17;
    v14[1] = v16;
    *(uint64_t *)((char *)v4 + v13) = (uint64_t)v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = (uint64_t *)((char *)v4 + v19);
    unsigned __int8 v21 = (uint64_t *)((char *)a2 + v19);
    sub_255ED534C(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    id v22 = v17;
    id v23 = v18;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_255EEE730();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v20, v21, v24);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = a3[9];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = *(void *)v27;
    LOBYTE(v27) = v27[8];
    *(void *)uint64_t v26 = v28;
    v26[8] = (char)v27;
  }
  swift_retain();
  return v4;
}

uint64_t sub_255ED3E3C(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  sub_255ED534C(0, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_255EEE200();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  uint64_t v6 = a1 + a2[8];
  sub_255ED534C(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_255EEE730();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

unsigned char *sub_255ED3FBC(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  sub_255ED534C(0, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_255EEE200();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  uint64_t v15 = *(void **)v13;
  uint64_t v14 = *((void *)v13 + 1);
  uint64_t v16 = *(void **)&a2[v11];
  *uint64_t v12 = v15;
  v12[1] = v14;
  *(void *)&a1[v11] = v16;
  uint64_t v17 = a3[8];
  unint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  sub_255ED534C(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  id v20 = v15;
  id v21 = v16;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_255EEE730();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v18, v19, v22);
  }
  else
  {
    *unint64_t v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = a3[9];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = *(void *)v25;
  LOBYTE(v25) = v25[8];
  *(void *)uint64_t v24 = v26;
  v24[8] = (_BYTE)v25;
  swift_retain();
  return a1;
}

unsigned char *sub_255ED41B8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = &a1[v6];
    uint64_t v8 = &a2[v6];
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x270FA9808];
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_255ED3AD8((uint64_t)&a1[v6], &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
    sub_255ED534C(0, &qword_269F35320, v9, v10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_255EEE200();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v7, v8, v11);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = *(void **)&a1[v12];
  uint64_t v16 = *(void **)&a2[v12];
  *uint64_t v13 = v16;
  id v17 = v16;

  v13[1] = *((void *)v14 + 1);
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void **)&a2[v18];
  id v20 = *(void **)&a1[v18];
  *(void *)&a1[v18] = v19;
  id v21 = v19;

  if (a1 != a2)
  {
    uint64_t v22 = a3[8];
    uint64_t v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    uint64_t v25 = (uint64_t (*)(uint64_t))MEMORY[0x263F188C0];
    uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_255ED3AD8((uint64_t)&a1[v22], (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    sub_255ED534C(0, (unint64_t *)&qword_269F35580, v25, v26);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_255EEE730();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v23, v24, v27);
    }
    else
    {
      *uint64_t v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v28 = a3[9];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *(void *)v30;
  LOBYTE(v30) = v30[8];
  *(void *)uint64_t v29 = v31;
  v29[8] = (_BYTE)v30;
  swift_retain();
  swift_release();
  return a1;
}

unsigned char *sub_255ED442C(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  sub_255ED534C(0, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
  uint64_t v10 = v9;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_255EEE200();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(v7, v8, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[8];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  sub_255ED534C(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  uint64_t v17 = v16;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_255EEE730();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v14, v15, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  uint64_t v19 = a3[9];
  id v20 = &a1[v19];
  id v21 = &a2[v19];
  *(void *)id v20 = *(void *)v21;
  v20[8] = v21[8];
  return a1;
}

unsigned char *sub_255ED462C(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = &a1[v6];
    uint64_t v8 = &a2[v6];
    uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x270FA9808];
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_255ED3AD8((uint64_t)&a1[v6], &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
    sub_255ED534C(0, &qword_269F35320, v9, v10);
    uint64_t v12 = v11;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_255EEE200();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 32))(v7, v8, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *(void **)&a1[v14];
  *uint64_t v15 = *v16;

  v15[1] = v16[1];
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void **)&a1[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];

  if (a1 != a2)
  {
    uint64_t v20 = a3[8];
    id v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = (uint64_t (*)(uint64_t))MEMORY[0x263F188C0];
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_255ED3AD8((uint64_t)&a1[v20], (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    sub_255ED534C(0, (unint64_t *)&qword_269F35580, v23, v24);
    uint64_t v26 = v25;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = sub_255EEE730();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v27 - 8) + 32))(v21, v22, v27);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    }
  }
  uint64_t v28 = a3[9];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *(void *)v30;
  LOBYTE(v30) = v30[8];
  *(void *)uint64_t v29 = v31;
  v29[8] = (_BYTE)v30;
  swift_release();
  return a1;
}

uint64_t sub_255ED48B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255ED48C4);
}

uint64_t sub_255ED48C4(uint64_t a1, uint64_t a2, int *a3)
{
  sub_255ED534C(0, &qword_269F35338, MEMORY[0x270FA9808], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[7]);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    sub_255ED534C(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[8];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_255ED4A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255ED4A5C);
}

void sub_255ED4A5C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_255ED534C(0, &qword_269F35338, MEMORY[0x270FA9808], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[7]) = (a2 - 1);
  }
  else
  {
    sub_255ED534C(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[8];
    v14(v16, a2, a2, v15);
  }
}

uint64_t type metadata accessor for MedicalIDNavigationBarViewModifier()
{
  uint64_t result = qword_269F38A78;
  if (!qword_269F38A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_255ED4C2C()
{
  sub_255ED534C(319, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_255ED534C(319, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_255ED4D74()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_255ED4D90()
{
  if (!qword_269F38A90)
  {
    type metadata accessor for MedicalIDNavigationBarViewModifier();
    sub_255ED20F0(&qword_269F355D8, (void (*)(uint64_t))type metadata accessor for MedicalIDNavigationBarViewModifier);
    unint64_t v0 = sub_255EEEF10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38A90);
    }
  }
}

uint64_t sub_255ED4E24()
{
  return sub_255ED20F0(&qword_269F38A98, (void (*)(uint64_t))sub_255ED4D90);
}

void sub_255ED4E58()
{
  if (!qword_269F38AA0)
  {
    sub_255ED50F0(255, &qword_269F38A88, (void (*)(uint64_t))sub_255ED4D90, (void (*)(void))sub_255ED4E24);
    sub_255ED5000(255, &qword_269F38AA8, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, (void (*)(void))sub_255ED526C);
    sub_255ED4D90();
    sub_255ED4E24();
    swift_getOpaqueTypeConformance2();
    sub_255ED534C(255, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
    sub_255ED526C();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38AA0);
    }
  }
}

void sub_255ED5000(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), void (*a5)(void))
{
  if (!*a2)
  {
    sub_255ED534C(255, a3, a4, MEMORY[0x263F8D8F0]);
    a5();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v8) {
      atomic_store(OpaqueTypeMetadata2, a2);
    }
  }
}

void sub_255ED50A8(uint64_t a1)
{
}

void sub_255ED50F0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v7) {
      atomic_store(OpaqueTypeMetadata2, a2);
    }
  }
}

void sub_255ED517C()
{
  if (!qword_269F38AC0)
  {
    sub_255ED51E4();
    unint64_t v0 = sub_255EEE690();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38AC0);
    }
  }
}

unint64_t sub_255ED51E4()
{
  unint64_t result = qword_269F38AC8;
  if (!qword_269F38AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38AC8);
  }
  return result;
}

uint64_t sub_255ED5238()
{
  return sub_255ED20F0(&qword_269F38AD0, (void (*)(uint64_t))sub_255ED517C);
}

unint64_t sub_255ED526C()
{
  unint64_t result = qword_269F38AD8;
  if (!qword_269F38AD8)
  {
    sub_255ED534C(255, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
    sub_255ED517C();
    sub_255ED5238();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38AD8);
  }
  return result;
}

uint64_t sub_255ED533C()
{
  return sub_255ED23F0(*(void *)(v0 + 16));
}

uint64_t sub_255ED5344@<X0>(uint64_t a1@<X8>)
{
  return sub_255ED2B60(*(void *)(v1 + 16), a1);
}

void sub_255ED534C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_255ED53B0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_255ED5400()
{
  unint64_t result = qword_269F38AF0;
  if (!qword_269F38AF0)
  {
    sub_255ED534C(255, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, MEMORY[0x263F8D8F0]);
    sub_255DDDF50();
    sub_255E4B024();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38AF0);
  }
  return result;
}

uint64_t sub_255ED54D0()
{
  return sub_255ED30E0(*(void *)(v0 + 16));
}

uint64_t sub_255ED54D8()
{
  uint64_t v1 = (int *)type metadata accessor for MedicalIDNavigationBarViewModifier();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  uint64_t v3 = v2 + v1[5];
  sub_255ED534C(0, &qword_269F35320, MEMORY[0x270FA9808], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_255EEE200();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = v2 + v1[8];
  sub_255ED534C(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_255EEE730();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_255ED56D8()
{
  type metadata accessor for MedicalIDNavigationBarViewModifier();
  return sub_255ED334C();
}

uint64_t sub_255ED5738@<X0>(uint64_t a1@<X8>)
{
  return sub_255ED287C(*(unsigned char **)(v1 + 16), a1);
}

uint64_t sub_255ED5748()
{
  sub_255ED4E58();
  sub_255ED5000(255, &qword_269F38AE0, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, (void (*)(void))sub_255ED5400);
  sub_255ED50F0(255, &qword_269F38A88, (void (*)(uint64_t))sub_255ED4D90, (void (*)(void))sub_255ED4E24);
  sub_255ED5000(255, &qword_269F38AA8, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, (void (*)(void))sub_255ED526C);
  sub_255ED4D90();
  sub_255ED4E24();
  swift_getOpaqueTypeConformance2();
  uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_255ED534C(255, &qword_269F38AB0, (uint64_t (*)(uint64_t))sub_255ED50A8, MEMORY[0x263F8D8F0]);
  sub_255ED526C();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_255ED534C(255, &qword_269F38AE8, (uint64_t (*)(uint64_t))sub_255DDDE9C, v0);
  sub_255ED5400();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255ED5980@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for MedicalIDEditableEmergencyContactsModel();
  sub_255EDBD08((unint64_t *)&qword_269F35690, (void (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel);
  sub_255EEFA90();
  uint64_t v4 = (int *)type metadata accessor for AddEmergencyContactView(0);
  *(void *)(a2 + v4[5]) = a1;
  uint64_t v5 = (void *)(a2 + v4[6]);
  type metadata accessor for AddEmergencyContactFlowViewModel(0);
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = 2;
  sub_255E2F22C(v11);
  sub_255E2E4D4((uint64_t)v11, v6 + 24);
  *(_WORD *)(v6 + 152) = 0;
  *(unsigned char *)(v6 + 154) = 0;
  *(void *)(v6 + 160) = 0;
  *(void *)(v6 + 168) = 0;
  sub_255EEE300();
  sub_255EEF810();
  *uint64_t v5 = v9;
  v5[1] = v10;
  uint64_t v7 = a2 + v4[7];
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v7 = result;
  *(unsigned char *)(v7 + 8) = 0;
  return result;
}

uint64_t sub_255ED5ABC()
{
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_255ED5B5C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_255ED5C04()
{
  return swift_release();
}

void *sub_255ED5CD4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  v4[0] = v1;
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  sub_255E2E4D4(v1 + 24, (uint64_t)v4);
  sub_255E2E4D4((uint64_t)v4, a1);
  return sub_255ED6BF0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
}

void *sub_255ED5DA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  v5[0] = v3;
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  sub_255E2E4D4(v3 + 24, (uint64_t)v5);
  sub_255E2E4D4((uint64_t)v5, a2);
  return sub_255ED6BF0(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
}

uint64_t sub_255ED5E7C(uint64_t a1)
{
  sub_255E2E4D4(a1, (uint64_t)v3);
  sub_255E2E4D4(a1, (uint64_t)v4);
  swift_getKeyPath();
  sub_255ED6BF0(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2C0();
  sub_255ED6BF0(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
  return swift_release();
}

void *sub_255ED5FA4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 24;
  sub_255E2E4D4(a1 + 24, (uint64_t)v5);
  sub_255E2E4D4((uint64_t)a2, v3);
  sub_255ED6BF0(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
  return sub_255ED6BF0(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
}

uint64_t sub_255ED6030()
{
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 152);
}

uint64_t sub_255ED60D0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 152);
  return result;
}

uint64_t sub_255ED6178()
{
  return swift_release();
}

uint64_t sub_255ED6248()
{
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 153);
}

uint64_t sub_255ED62E8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 153);
  return result;
}

uint64_t sub_255ED6390()
{
  return swift_release();
}

uint64_t sub_255ED6460()
{
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 154);
}

uint64_t sub_255ED6500@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 154);
  return result;
}

uint64_t sub_255ED65A8()
{
  return swift_release();
}

uint64_t sub_255ED6678()
{
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_255ED6728@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 168);
  *a2 = *(void *)(v3 + 160);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_255ED67D4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_255ED68B8()
{
  sub_255E2E4D4(v0 + 24, (uint64_t)v4);
  sub_255ED6BF0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
  swift_bridgeObjectRelease();
  uint64_t v1 = v0
     + OBJC_IVAR____TtC11MedicalIDUIP33_651567AA3A8EF6C66B67A47E9FA4DE6932AddEmergencyContactFlowViewModel___observationRegistrar;
  uint64_t v2 = sub_255EEE310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_255ED6984()
{
  return type metadata accessor for AddEmergencyContactFlowViewModel(0);
}

uint64_t type metadata accessor for AddEmergencyContactFlowViewModel(uint64_t a1)
{
  return sub_255DB0714(a1, (uint64_t *)&unk_269F38B08);
}

uint64_t sub_255ED69AC()
{
  uint64_t result = sub_255EEE310();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_255ED6A70()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 160) = v0[3];
  *(void *)(v1 + 168) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_255ED6AB8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 154) = *(unsigned char *)(v0 + 24);
}

void sub_255ED6AD0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 153) = *(unsigned char *)(v0 + 24);
}

void sub_255ED6AE8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 152) = *(unsigned char *)(v0 + 24);
}

id sub_255ED6B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  id result = a13;
  if (a13)
  {
    id v15 = a14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a13;
  }
  return result;
}

void *sub_255ED6BD4()
{
  return sub_255ED5FA4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *sub_255ED6BF0(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t type metadata accessor for AddEmergencyContactView(uint64_t a1)
{
  return sub_255DB0714(a1, (uint64_t *)&unk_269F38B20);
}

void sub_255ED6C7C(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v125 = a1;
  uint64_t v132 = type metadata accessor for AddEmergencyContactView(0);
  uint64_t v3 = *(void *)(v132 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v132);
  sub_255EDAD0C();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDB1D4();
  uint64_t v108 = v10;
  MEMORY[0x270FA5388](v10);
  v134 = (char *)&v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDB23C();
  uint64_t v109 = *(void *)(v12 - 8);
  uint64_t v110 = v12;
  MEMORY[0x270FA5388](v12);
  v128 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDB408();
  v129 = v14;
  uint64_t v112 = *((void *)v14 - 1);
  MEMORY[0x270FA5388](v14);
  v111 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDB550();
  uint64_t v113 = *(void *)(v16 - 8);
  uint64_t v114 = v16;
  MEMORY[0x270FA5388](v16);
  v130 = (uint64_t (*)(uint64_t))((char *)&v104 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_255EDB7AC();
  uint64_t v115 = *(void *)(v18 - 8);
  uint64_t v116 = v18;
  MEMORY[0x270FA5388](v18);
  v131 = (char *)&v104 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDBA20();
  uint64_t v118 = *(void *)(v20 - 8);
  uint64_t v119 = v20;
  MEMORY[0x270FA5388](v20);
  v117 = (char *)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDBD50(0, &qword_269F38BE0, (void (*)(uint64_t))sub_255EDBA20);
  uint64_t v120 = v22;
  MEMORY[0x270FA5388](v22);
  v122 = (char *)&v104 - v23;
  sub_255EDBDB4();
  uint64_t v123 = *(void *)(v24 - 8);
  uint64_t v124 = v24;
  MEMORY[0x270FA5388](v24);
  v121 = (char *)&v104 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDC80C(v2, (uint64_t)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AddEmergencyContactView);
  uint64_t v26 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v27 = v2;
  uint64_t v28 = (v26 + 16) & ~v26;
  uint64_t v137 = v28 + v4;
  uint64_t v139 = v26 | 7;
  uint64_t v29 = swift_allocObject();
  uint64_t v140 = v28;
  uint64_t v133 = (uint64_t)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDC260(v133, v29 + v28, type metadata accessor for AddEmergencyContactView);
  sub_255EDBD50(0, &qword_269F38B38, (void (*)(uint64_t))sub_255EDAD94);
  sub_255EDB108();
  sub_255EEF870();
  sub_255EDC2E0(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_255EF1E20;
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  sub_255EEFA70();
  uint64_t v32 = *(void *)(v157 + 32);
  uint64_t v31 = *(void *)(v157 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)(v30 + 32) = v32;
  *(void *)(v30 + 40) = v31;
  *(void *)(v30 + 48) = 6579265;
  *(void *)(v30 + 56) = 0xE300000000000000;
  uint64_t v33 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v34 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v34)
  {
    sub_255EEFD90();

    sub_255EDBD08(&qword_269F38BA0, (void (*)(uint64_t))sub_255EDAD0C);
    sub_255EEF580();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v35 = (uint64_t *)(v27 + *(int *)(v132 + 24));
    uint64_t v36 = v35[1];
    v156[0] = *v35;
    v156[1] = v36;
    sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
    uint64_t v138 = v37;
    sub_255EEF840();
    uint64_t v38 = v157;
    unint64_t v39 = v158;
    uint64_t v40 = v27;
    uint64_t v136 = v27;
    unint64_t v41 = v159;
    swift_getKeyPath();
    uint64_t v157 = v38;
    v158 = v39;
    unint64_t v159 = v41;
    sub_255EDAE28(0, &qword_269F38C08, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B750]);
    uint64_t v127 = v42;
    sub_255EEF990();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v43 = v133;
    v105 = type metadata accessor for AddEmergencyContactView;
    sub_255EDC80C(v40, v133, type metadata accessor for AddEmergencyContactView);
    uint64_t v44 = swift_allocObject();
    v126 = type metadata accessor for AddEmergencyContactView;
    sub_255EDC260(v43, v44 + v140, type metadata accessor for AddEmergencyContactView);
    unint64_t v106 = sub_255EDB2DC();
    unint64_t v107 = sub_255EDB3B4();
    uint64_t v45 = v108;
    uint64_t v46 = (uint64_t)v134;
    sub_255EEF5F0();
    swift_release();
    swift_release();
    swift_release();
    sub_255EDC874(v46, (uint64_t (*)(void))sub_255EDB1D4);
    v135 = v35;
    char v47 = (ValueMetadata *)v35[1];
    uint64_t v157 = *v35;
    v158 = v47;
    sub_255EEF820();
    uint64_t v48 = v156[0];
    swift_getKeyPath();
    uint64_t v157 = v48;
    v134 = (char *)sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
    sub_255EEE2D0();
    swift_release();
    sub_255E2E4D4(v48 + 24, (uint64_t)v156);
    sub_255ED6BF0(v156, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
    swift_release();
    sub_255E2E4D4((uint64_t)v156, (uint64_t)&v148);
    sub_255EDC80C(v136, v43, type metadata accessor for AddEmergencyContactView);
    uint64_t v49 = swift_allocObject();
    sub_255EDC260(v43, v49 + v140, v126);
    v104 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EDC2E0(0, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, MEMORY[0x263F8D8F0]);
    uint64_t v51 = v50;
    uint64_t v157 = v45;
    v158 = &type metadata for EmergencyContactPickerSheetView;
    unint64_t v159 = v106;
    unint64_t v160 = v107;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v53 = sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    uint64_t v54 = v110;
    char v55 = v111;
    uint64_t v56 = v128;
    sub_255EEF690();
    swift_release();
    sub_255E2E4D4((uint64_t)&v148, (uint64_t)&v157);
    sub_255ED6BF0(&v157, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
    (*(void (**)(char *, uint64_t))(v109 + 8))(v56, v54);
    uint64_t v57 = v135[1];
    v148 = (uint64_t (*)(uint64_t))*v135;
    v149 = (char *)v57;
    sub_255EEF820();
    uint64_t v58 = v143;
    swift_getKeyPath();
    v148 = (uint64_t (*)(uint64_t))v58;
    sub_255EEE2D0();
    swift_release();
    LOBYTE(v56) = *(unsigned char *)(v58 + 16);
    swift_release();
    LOBYTE(v143) = (_BYTE)v56;
    sub_255EDC80C(v136, v43, v105);
    uint64_t v59 = swift_allocObject();
    sub_255EDC260(v43, v59 + v140, v126);
    sub_255EDC2E0(0, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, v104);
    char v61 = v60;
    v148 = (uint64_t (*)(uint64_t))v54;
    v149 = v51;
    uint64_t v150 = OpaqueTypeConformance2;
    v151 = (uint64_t (*)(void))v53;
    uint64_t v62 = swift_getOpaqueTypeConformance2();
    uint64_t v63 = (uint64_t (*)(void))sub_255EDB720(&qword_269F38BC8, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, (void (*)(void))sub_255E7BF58);
    uint64_t v64 = v129;
    v128 = v61;
    uint64_t v110 = v62;
    sub_255EEF690();
    swift_release();
    (*(void (**)(char *, uint64_t (*)(uint64_t)))(v112 + 8))(v55, v64);
    uint64_t v65 = v135;
    uint64_t v66 = v135[1];
    v148 = (uint64_t (*)(uint64_t))*v135;
    v149 = (char *)v66;
    sub_255EEF820();
    uint64_t v67 = v143;
    swift_getKeyPath();
    v148 = (uint64_t (*)(uint64_t))v67;
    sub_255EEE2D0();
    swift_release();
    int v68 = *(unsigned __int8 *)(v67 + 16);
    swift_release();
    v126 = v63;
    if (v68 == 2)
    {
      v69 = 0;
      unint64_t v70 = 0xE000000000000000;
    }
    else
    {
      sub_255E7A55C(v68 & 1, (uint64_t *)&v148);
      v69 = v148;
      unint64_t v70 = (unint64_t)v149;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v146 = v69;
    unint64_t v147 = v70;
    uint64_t v71 = v65[1];
    uint64_t v143 = *v65;
    uint64_t v144 = v71;
    sub_255EEF840();
    uint64_t v72 = (uint64_t)v148;
    uint64_t v73 = v149;
    uint64_t v74 = v150;
    swift_getKeyPath();
    v148 = (uint64_t (*)(uint64_t))v72;
    v149 = v73;
    uint64_t v150 = v74;
    sub_255EEF990();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v75 = swift_release();
    v111 = (char *)&v104;
    LODWORD(v109) = v145;
    uint64_t v76 = MEMORY[0x270FA5388](v75);
    MEMORY[0x270FA5388](v76);
    sub_255ED53B0(0, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
    uint64_t v78 = v77;
    v148 = v129;
    v149 = v128;
    uint64_t v150 = v110;
    v151 = v126;
    uint64_t v112 = swift_getOpaqueTypeConformance2();
    v126 = (uint64_t (*)(void))sub_255DAD520();
    v128 = (char *)sub_255DDE03C();
    uint64_t v79 = v78;
    uint64_t v80 = v114;
    uint64_t v81 = v130;
    sub_255EEF5E0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t (*)(uint64_t), uint64_t))(v113 + 8))(v81, v80);
    uint64_t v82 = v135[1];
    v141 = (uint64_t (*)(uint64_t))*v135;
    uint64_t v142 = v82;
    sub_255EEF840();
    uint64_t v83 = (uint64_t)v148;
    v84 = v149;
    uint64_t v85 = v150;
    swift_getKeyPath();
    v148 = (uint64_t (*)(uint64_t))v83;
    v149 = v84;
    uint64_t v150 = v85;
    sub_255EEF990();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v130 = type metadata accessor for AddEmergencyContactView;
    uint64_t v86 = v136;
    uint64_t v87 = v133;
    sub_255EDC80C(v136, v133, type metadata accessor for AddEmergencyContactView);
    uint64_t v88 = swift_allocObject();
    v129 = type metadata accessor for AddEmergencyContactView;
    sub_255EDC260(v87, v88 + v140, type metadata accessor for AddEmergencyContactView);
    type metadata accessor for RelationshipPickerView();
    v148 = (uint64_t (*)(uint64_t))v80;
    v149 = (char *)MEMORY[0x263F8D310];
    uint64_t v150 = v79;
    v151 = (uint64_t (*)(void))MEMORY[0x263F1A830];
    uint64_t v152 = v112;
    v153 = v126;
    v154 = v128;
    uint64_t v155 = MEMORY[0x263F1A820];
    swift_getOpaqueTypeConformance2();
    sub_255EDBD08(&qword_269F364C8, (void (*)(uint64_t))type metadata accessor for RelationshipPickerView);
    uint64_t v89 = v116;
    v90 = v117;
    v91 = v131;
    sub_255EEF5F0();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v115 + 8))(v91, v89);
    uint64_t v92 = v86 + *(int *)(v132 + 28);
    uint64_t v93 = *(void *)v92;
    LOBYTE(v83) = *(unsigned char *)(v92 + 8);
    sub_255EDA518(*(void *)v92, v83);
    LOBYTE(v89) = sub_255DAB52C(v93, v83);
    sub_255DADCE0(v93, v83);
    if (v89) {
      double v94 = 1.0;
    }
    else {
      double v94 = 0.6;
    }
    uint64_t v96 = v118;
    uint64_t v95 = v119;
    uint64_t v97 = (uint64_t)v122;
    (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v122, v90, v119);
    *(double *)(v97 + *(int *)(v120 + 36)) = v94;
    (*(void (**)(char *, uint64_t))(v96 + 8))(v90, v95);
    uint64_t v98 = v135[1];
    v148 = (uint64_t (*)(uint64_t))*v135;
    v149 = (char *)v98;
    sub_255EEF820();
    uint64_t v99 = v143;
    swift_getKeyPath();
    v148 = (uint64_t (*)(uint64_t))v99;
    sub_255EEE2D0();
    swift_release();
    uint64_t v101 = *(void *)(v99 + 160);
    v100 = *(char **)(v99 + 168);
    swift_bridgeObjectRetain();
    swift_release();
    v148 = (uint64_t (*)(uint64_t))v101;
    v149 = v100;
    sub_255EDC80C(v86, v87, v130);
    uint64_t v102 = swift_allocObject();
    sub_255EDC260(v87, v102 + v140, v129);
    sub_255EDC2E0(0, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    sub_255EDBEA0();
    sub_255EDC1D0();
    v103 = v121;
    sub_255EEF690();
    swift_release();
    swift_bridgeObjectRelease();
    sub_255EDC4FC(v97, (uint64_t)&qword_269F38BE0, (uint64_t)sub_255EDBA20, MEMORY[0x263F18C00], (uint64_t (*)(void))sub_255EDBD50);
    (*(void (**)(uint64_t, char *, uint64_t))(v123 + 32))(v125, v103, v124);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_255ED8070()
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  sub_255EEFA70();
  swift_getKeyPath();
  sub_255EDBD08((unint64_t *)&qword_269F35690, (void (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel);
  sub_255EEE2D0();
  swift_release();
  swift_beginAccess();
  uint64_t v0 = *(void *)(*(void *)&v6[0] + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRelease();
  if (HKMedicalIDEmergencyContactsIsUnderLimit(v1))
  {
    type metadata accessor for AddEmergencyContactFlowViewModel(0);
    uint64_t v2 = swift_allocObject();
    *(unsigned char *)(v2 + 16) = 2;
    sub_255E2F22C(v6);
    sub_255E2E4D4((uint64_t)v6, v2 + 24);
    *(_WORD *)(v2 + 152) = 0;
    *(unsigned char *)(v2 + 154) = 0;
    *(void *)(v2 + 160) = 0;
    *(void *)(v2 + 168) = 0;
    sub_255EEE300();
    type metadata accessor for AddEmergencyContactView(0);
    sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
    sub_255EEF830();
    sub_255EEF820();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
    sub_255EEE2C0();
    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for AddEmergencyContactView(0);
    sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
    sub_255EEF820();
    uint64_t v5 = swift_getKeyPath();
    MEMORY[0x270FA5388](v5);
    sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
    sub_255EEE2C0();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_255ED846C@<X0>(uint64_t a1@<X8>)
{
  sub_255EDAD94();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_255EEEC90();
  if (qword_269F34C68 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_269F38AF8;
  *(void *)uint64_t v4 = v5;
  *((void *)v4 + 1) = v6;
  void v4[16] = 0;
  sub_255EDC6D0();
  sub_255ED85E8((uint64_t)&v4[*(int *)(v7 + 44)]);
  char v8 = sub_255EEF1B0();
  sub_255EEE540();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  sub_255EDC80C((uint64_t)v4, a1, (uint64_t (*)(void))sub_255EDAD94);
  sub_255EDBD50(0, &qword_269F38B38, (void (*)(uint64_t))sub_255EDAD94);
  uint64_t v18 = a1 + *(int *)(v17 + 36);
  *(unsigned char *)uint64_t v18 = v8;
  *(void *)(v18 + 8) = v10;
  *(void *)(v18 + 16) = v12;
  *(void *)(v18 + 24) = v14;
  *(void *)(v18 + 32) = v16;
  *(unsigned char *)(v18 + 40) = 0;
  return sub_255EDC874((uint64_t)v4, (uint64_t (*)(void))sub_255EDAD94);
}

uint64_t sub_255ED85E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = MEMORY[0x263F1B548];
  uint64_t v51 = a1;
  uint64_t v49 = MEMORY[0x263F1A418];
  sub_255EDAE28(0, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  uint64_t v47 = v1 - 8;
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)&v45 - v2);
  uint64_t v4 = sub_255EEF7D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDAF88();
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_255EDAEF4();
  uint64_t v48 = v12 - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v46 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v52 = (uint64_t)&v45 - v15;
  uint64_t v16 = sub_255EEF7B0();
  uint64_t v17 = sub_255EEF200();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B530], v4);
  uint64_t v19 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v3 + *(int *)(v47 + 36), v7, v4);
  *uint64_t v3 = v19;
  sub_255EDC778((uint64_t)v3, (uint64_t)v11 + *(int *)(v9 + 44));
  *uint64_t v11 = v16;
  v11[1] = KeyPath;
  v11[2] = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_255EDC4FC((uint64_t)v3, (uint64_t)&qword_269F38A38, v50, v49, (uint64_t (*)(void))sub_255EDAE28);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v20 = (uint64_t)v46;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v21 = sub_255EEF710();
  sub_255EDC80C((uint64_t)v11, v20, (uint64_t (*)(void))sub_255EDAF88);
  *(void *)(v20 + *(int *)(v48 + 44)) = v21;
  sub_255EDC874((uint64_t)v11, (uint64_t (*)(void))sub_255EDAF88);
  sub_255EDC260(v20, v52, (uint64_t (*)(void))sub_255EDAEF4);
  sub_255EEED10();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_269F352A8;
  uint64_t v23 = sub_255EEF3C0();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  uint64_t v53 = sub_255EEF730();
  uint64_t v28 = sub_255EEF370();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_255D85120(v23, v25, v27);
  swift_release();
  swift_bridgeObjectRelease();
  sub_255EEF200();
  uint64_t v33 = sub_255EEF3B0();
  uint64_t v35 = v34;
  char v37 = v36;
  uint64_t v39 = v38;
  swift_release();
  sub_255D85120(v28, v30, v32);
  swift_bridgeObjectRelease();
  uint64_t v40 = v52;
  sub_255EDC80C(v52, v20, (uint64_t (*)(void))sub_255EDAEF4);
  uint64_t v41 = v51;
  sub_255EDC80C(v20, v51, (uint64_t (*)(void))sub_255EDAEF4);
  sub_255EDAE8C();
  uint64_t v43 = v41 + *(int *)(v42 + 48);
  *(void *)uint64_t v43 = v33;
  *(void *)(v43 + 8) = v35;
  *(unsigned char *)(v43 + 16) = v37 & 1;
  *(void *)(v43 + 24) = v39;
  sub_255D85214(v33, v35, v37 & 1);
  swift_bridgeObjectRetain();
  sub_255EDC874(v40, (uint64_t (*)(void))sub_255EDAEF4);
  sub_255D85120(v33, v35, v37 & 1);
  swift_bridgeObjectRelease();
  return sub_255EDC874(v20, (uint64_t (*)(void))sub_255EDAEF4);
}

double sub_255ED8B90@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  sub_255EEFA70();
  uint64_t v10 = sub_255DAE400();
  swift_release();
  sub_255EEFA70();
  uint64_t v4 = *(void *)(v23 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v5 = type metadata accessor for AddEmergencyContactView(0);
  uint64_t v6 = *(void **)(a1 + *(int *)(v5 + 20));
  uint64_t v7 = (long long *)(a1 + *(int *)(v5 + 24));
  long long v14 = *v7;
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  id v9 = v6;
  sub_255EEF840();
  swift_getKeyPath();
  sub_255EDAE28(0, &qword_269F38C08, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B750]);
  sub_255EEF990();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = *(void *)v7;
  uint64_t v12 = *((void *)v7 + 1);
  sub_255EEF840();
  swift_getKeyPath();
  sub_255EEF990();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(_OWORD *)(a2 + 104) = v19;
  *(_OWORD *)(a2 + 120) = v20;
  *(_OWORD *)(a2 + 136) = v21;
  *(_OWORD *)(a2 + 152) = v22;
  *(_OWORD *)(a2 + 40) = v15;
  double result = *(double *)&v16;
  *(_OWORD *)(a2 + 56) = v16;
  *(_OWORD *)(a2 + 72) = v17;
  *(_OWORD *)(a2 + 88) = v18;
  *(_OWORD *)(a2 + 24) = v14;
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 168) = v11;
  *(void *)(a2 + 176) = v12;
  *(unsigned char *)(a2 + 184) = v13;
  return result;
}

uint64_t sub_255ED8E3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + *(int *)(type metadata accessor for AddEmergencyContactView(0) + 24) + 8);
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  v5[1] = v1;
  sub_255EEF820();
  swift_getKeyPath();
  v5[0] = v4[0];
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  sub_255E2E4D4(v4[0] + 24, (uint64_t)v4);
  sub_255ED6BF0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
  swift_release();
  sub_255E2E4D4((uint64_t)v4, (uint64_t)v5);
  if (sub_255E2E55C((uint64_t)v5) != 1) {
    sub_255ED6BF0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_255EEE2C0();
  swift_release();
  return swift_release();
}

uint64_t sub_255ED9070()
{
  return swift_release();
}

uint64_t sub_255ED9214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = type metadata accessor for AddEmergencyContactView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388](v3);
  sub_255EDAE28(0, &qword_269F351C8, MEMORY[0x263F18380], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v25 - v7;
  sub_255ED53B0(0, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v25 - v12;
  long long v14 = (uint64_t *)(a1 + *(int *)(v4 + 32));
  uint64_t v16 = *v14;
  unint64_t v15 = v14[1];
  uint64_t v28 = v16;
  unint64_t v29 = v15;
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  uint64_t v17 = v32;
  swift_getKeyPath();
  uint64_t v28 = v17;
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  int v18 = *(unsigned __int8 *)(v17 + 16);
  swift_release();
  if (v18 == 2)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
  }
  else
  {
    sub_255E7A55C(v18 & 1, &v28);
    uint64_t v19 = v30;
    unint64_t v20 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = v19;
  unint64_t v29 = v20;
  sub_255EEE4E0();
  uint64_t v21 = sub_255EEE4F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
  sub_255EDC80C(a1, (uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AddEmergencyContactView);
  unint64_t v22 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v23 = swift_allocObject();
  sub_255EDC260((uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22, type metadata accessor for AddEmergencyContactView);
  sub_255DAD520();
  sub_255EEF880();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v27, v13, v10);
}

uint64_t sub_255ED95F4()
{
  return swift_release();
}

uint64_t sub_255ED97CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v11 = *(void *)(a1 + *(int *)(type metadata accessor for AddEmergencyContactView(0) + 24) + 8);
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  swift_getKeyPath();
  uint64_t v10 = v14;
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  int v3 = *(unsigned __int8 *)(v14 + 16);
  swift_release();
  if (v3 == 2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  else
  {
    sub_255E7A55C(v3 & 1, &v10);
    uint64_t v4 = v12;
    unint64_t v5 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = v4;
  unint64_t v11 = v5;
  sub_255DAD520();
  uint64_t result = sub_255EEF3D0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_255ED993C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  int v3 = (int *)type metadata accessor for RelationshipPickerView();
  MEMORY[0x270FA5388](v3);
  unint64_t v5 = (uint64_t *)((char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(int *)(type metadata accessor for AddEmergencyContactView(0) + 24);
  uint64_t v29 = a1;
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  v41[0] = *(void *)(a1 + v6);
  v41[1] = v8;
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  uint64_t v9 = v40[0];
  swift_getKeyPath();
  v41[0] = v9;
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  sub_255E2E4D4(v9 + 24, (uint64_t)v40);
  sub_255E2E4D4((uint64_t)v40, (uint64_t)&v35);
  sub_255ED6BF0(v40, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
  swift_release();
  sub_255E2E4D4((uint64_t)v40, (uint64_t)v41);
  id v10 = 0;
  if (sub_255E2E55C((uint64_t)v41) != 1)
  {
    unint64_t v11 = v39;
    sub_255E2E4D4((uint64_t)&v35, (uint64_t)&v33);
    id v10 = v11;
    sub_255ED6BF0(&v33, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255E2E5D0);
  }
  uint64_t v12 = v7[1];
  *(void *)&long long v33 = *v7;
  *((void *)&v33 + 1) = v12;
  sub_255EEF840();
  uint64_t v13 = v35;
  uint64_t v14 = v36;
  uint64_t v15 = v37;
  swift_getKeyPath();
  *(void *)&long long v33 = v13;
  *((void *)&v33 + 1) = v14;
  uint64_t v34 = v15;
  sub_255EDAE28(0, &qword_269F38C08, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B750]);
  sub_255EEF990();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v16 = v35;
  uint64_t v17 = v36;
  uint64_t v18 = v37;
  uint64_t v19 = v38;
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  sub_255EEFA70();
  uint64_t v20 = *(void *)(v33 + 40);
  uint64_t v29 = *(void *)(v33 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  *unint64_t v5 = swift_getKeyPath();
  sub_255EDAE28(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = (char *)v5 + v3[6];
  sub_255EDC2E0(0, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  sub_255EEF810();
  uint64_t v22 = v34;
  *(_OWORD *)uint64_t v21 = v33;
  *((void *)v21 + 2) = v22;
  uint64_t v23 = (uint64_t *)((char *)v5 + v3[5]);
  *uint64_t v23 = v16;
  v23[1] = v17;
  v23[2] = v18;
  v23[3] = v19;
  id v24 = objc_allocWithZone((Class)MIUIRelationshipPickerDataSource);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v25 = objc_msgSend(v24, sel_initWithContact_, v10);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  *(uint64_t *)((char *)v5 + v3[7]) = (uint64_t)v25;
  uint64_t v26 = (uint64_t *)((char *)v5 + v3[8]);
  uint64_t v27 = v30;
  *uint64_t v26 = v29;
  v26[1] = v20;
  return sub_255EDC260((uint64_t)v5, v27, (uint64_t (*)(void))type metadata accessor for RelationshipPickerView);
}

uint64_t sub_255ED9D9C(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for AddEmergencyContactView(0) + 24);
  *((void *)&v70 + 1) = *(void *)(v1 + 8);
  sub_255EDAE28(0, &qword_269F38C00, type metadata accessor for AddEmergencyContactFlowViewModel, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  swift_getKeyPath();
  *(void *)&long long v70 = v69[0];
  sub_255EDBD08(&qword_269F38B18, (void (*)(uint64_t))type metadata accessor for AddEmergencyContactFlowViewModel);
  sub_255EEE2D0();
  swift_release();
  sub_255E2E4D4(v69[0] + 24, (uint64_t)v69);
  sub_255ED6BF0(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_255ED6B00);
  swift_release();
  sub_255E2E4D4((uint64_t)v69, (uint64_t)&v70);
  uint64_t result = sub_255E2E55C((uint64_t)&v70);
  if (result != 1)
  {
    uint64_t v3 = *((void *)&v70 + 1);
    uint64_t v36 = v70;
    uint64_t v4 = *((void *)&v71 + 1);
    uint64_t v5 = *((void *)&v72 + 1);
    uint64_t v34 = v72;
    uint64_t v35 = v71;
    uint64_t v6 = *((void *)&v73 + 1);
    uint64_t v7 = *((void *)&v74 + 1);
    uint64_t v31 = v78;
    uint64_t v32 = v73;
    uint64_t v8 = *((void *)&v78 + 1);
    long long v67 = v73;
    long long v68 = v74;
    long long v65 = v71;
    long long v66 = v72;
    uint64_t v29 = v75;
    uint64_t v30 = v74;
    uint64_t v9 = (void *)v77;
    uint64_t v37 = v76;
    long long v63 = v78;
    long long v64 = v70;
    long long v62 = v77;
    *((void *)&v54 + 1) = *(void *)(v1 + 8);
    uint64_t v33 = *((void *)&v77 + 1);
    id v10 = *((id *)&v77 + 1);
    id v39 = v9;
    uint64_t v40 = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_255EEF820();
    swift_getKeyPath();
    *(void *)&long long v54 = v46;
    sub_255EEE2D0();
    swift_release();
    uint64_t v12 = *(void *)(v46 + 160);
    uint64_t v11 = *(void *)(v46 + 168);
    swift_bridgeObjectRetain();
    swift_release();
    if (v11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
      sub_255EEFA70();
      uint64_t v13 = v10;
      uint64_t v14 = v54;
      *(void *)&long long v46 = v36;
      *((void *)&v46 + 1) = v3;
      *(void *)&long long v47 = v35;
      *((void *)&v47 + 1) = v4;
      *(void *)&long long v48 = v34;
      *((void *)&v48 + 1) = v5;
      *(void *)&long long v49 = v32;
      *((void *)&v49 + 1) = v6;
      *(void *)&long long v50 = v30;
      *((void *)&v50 + 1) = v7;
      uint64_t v38 = v12;
      *(void *)&long long v51 = v12;
      *((void *)&v51 + 1) = v11;
      *(void *)&long long v52 = v39;
      *((void *)&v52 + 1) = v33;
      *(void *)&long long v53 = v31;
      *((void *)&v53 + 1) = v40;
      sub_255DCB308((uint64_t)&v46);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      long long v58 = v50;
      long long v59 = v51;
      long long v60 = v52;
      long long v61 = v53;
      long long v54 = v46;
      long long v55 = v47;
      long long v56 = v48;
      long long v57 = v49;
      uint64_t v15 = sub_255DCB170();
      sub_255DCB3AC((uint64_t)&v46);
      MedicalIDEmergencyContact.init(hkEmergencyContact:contact:)(v15, 0, &v54);
      swift_getKeyPath();
      sub_255EDBD08((unint64_t *)&qword_269F35690, (void (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel);
      sub_255EEE2D0();
      swift_release();
      *(void *)&v41[0] = v14;
      swift_getKeyPath();
      sub_255EEE2F0();
      swift_release();
      uint64_t v16 = (void *)(v14 + 16);
      swift_beginAccess();
      uint64_t v17 = *(void **)(v14 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v14 + 16) = v17;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v17 = sub_255DFA74C(0, v17[2] + 1, 1, v17);
        *uint64_t v16 = v17;
      }
      unint64_t v20 = v17[2];
      unint64_t v19 = v17[3];
      if (v20 >= v19 >> 1)
      {
        uint64_t v17 = sub_255DFA74C((void *)(v19 > 1), v20 + 1, 1, v17);
        *uint64_t v16 = v17;
      }
      v17[2] = v20 + 1;
      uint64_t v21 = &v17[16 * v20];
      long long v22 = v54;
      long long v23 = v55;
      long long v24 = v57;
      v21[4] = v56;
      v21[5] = v24;
      v21[2] = v22;
      v21[3] = v23;
      long long v25 = v58;
      long long v26 = v59;
      long long v27 = v61;
      v21[8] = v60;
      v21[9] = v27;
      v21[6] = v25;
      v21[7] = v26;
      swift_endAccess();
      swift_getKeyPath();
      sub_255EEE2E0();
      swift_release();
      swift_release();
      v41[2] = v66;
      v41[3] = v67;
      v41[4] = v68;
      v41[0] = v64;
      v41[1] = v65;
      uint64_t v42 = v38;
      uint64_t v43 = v11;
      long long v44 = v62;
      long long v45 = v63;
      uint64_t v28 = v41;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      long long v56 = v66;
      long long v57 = v67;
      long long v58 = v68;
      long long v54 = v64;
      long long v55 = v65;
      *(void *)&long long v59 = v29;
      *((void *)&v59 + 1) = v37;
      long long v60 = v62;
      long long v61 = v63;
      uint64_t v28 = &v54;
    }
    return sub_255DCB3AC((uint64_t)v28);
  }
  return result;
}

uint64_t sub_255EDA370@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_255EEEBB0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_255EDA3A0()
{
  return sub_255EEEBC0();
}

uint64_t *sub_255EDA3C8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = v6[5];
    uint64_t v9 = v6[6];
    id v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v6[7];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)v16;
    LOBYTE(v6) = v16[8];
    id v18 = v10;
    swift_retain();
    swift_retain();
    sub_255EDA518(v17, (char)v6);
    *(void *)uint64_t v15 = v17;
    v15[8] = (char)v6;
  }
  return a1;
}

uint64_t sub_255EDA518(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_255EDA524(uint64_t a1, uint64_t a2)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = *(void *)v5;
  char v7 = *(unsigned char *)(v5 + 8);
  return sub_255DADCE0(v6, v7);
}

uint64_t sub_255EDA5FC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *id v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)v15;
  LOBYTE(a2) = *(unsigned char *)(v15 + 8);
  id v17 = v9;
  swift_retain();
  swift_retain();
  sub_255EDA518(v16, a2);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = a2;
  return a1;
}

uint64_t sub_255EDA6FC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  swift_retain();
  swift_release();
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_retain();
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  LOBYTE(a3) = *(unsigned char *)(v16 + 8);
  sub_255EDA518(*(void *)v16, (char)a3);
  uint64_t v18 = *(void *)v15;
  char v19 = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = (_BYTE)a3;
  sub_255DADCE0(v18, v19);
  return a1;
}

uint64_t sub_255EDA82C(uint64_t a1, uint64_t a2, int *a3)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  return a1;
}

uint64_t sub_255EDA8FC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_release();
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  swift_release();
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  LOBYTE(v14) = *((unsigned char *)v14 + 8);
  uint64_t v16 = *(void *)v13;
  char v17 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8) = (_BYTE)v14;
  sub_255DADCE0(v16, v17);
  return a1;
}

uint64_t sub_255EDAA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EDAA20);
}

uint64_t sub_255EDAA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_255EDAB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EDAB24);
}

void sub_255EDAB24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_255EDAC10()
{
  sub_255EDAE28(319, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_255EDACEC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_255EDAD0C()
{
  if (!qword_269F38B30)
  {
    sub_255EDBD50(255, &qword_269F38B38, (void (*)(uint64_t))sub_255EDAD94);
    sub_255EDB108();
    unint64_t v0 = sub_255EEF8A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B30);
    }
  }
}

void sub_255EDAD94()
{
  if (!qword_269F38B40)
  {
    sub_255EDAE28(255, &qword_269F38B48, (uint64_t (*)(uint64_t))sub_255EDAE8C, MEMORY[0x263F1BAC8]);
    sub_255EDB080();
    unint64_t v0 = sub_255EEF8C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B40);
    }
  }
}

void sub_255EDAE28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_255EDAE8C()
{
  if (!qword_269F38B50)
  {
    sub_255EDAEF4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F38B50);
    }
  }
}

void sub_255EDAEF4()
{
  if (!qword_269F38B58)
  {
    sub_255EDAF88();
    sub_255ED53B0(255, (unint64_t *)&qword_269F35128, MEMORY[0x263F1B440], MEMORY[0x263F1B420], MEMORY[0x263F1A180]);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B58);
    }
  }
}

void sub_255EDAF88()
{
  if (!qword_269F38B60)
  {
    sub_255EDB020();
    sub_255EDAE28(255, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B60);
    }
  }
}

void sub_255EDB020()
{
  if (!qword_269F38B68)
  {
    sub_255D84C2C();
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B68);
    }
  }
}

unint64_t sub_255EDB080()
{
  unint64_t result = qword_269F38B70;
  if (!qword_269F38B70)
  {
    sub_255EDAE28(255, &qword_269F38B48, (uint64_t (*)(uint64_t))sub_255EDAE8C, MEMORY[0x263F1BAC8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38B70);
  }
  return result;
}

unint64_t sub_255EDB108()
{
  unint64_t result = qword_269F38B78;
  if (!qword_269F38B78)
  {
    sub_255EDBD50(255, &qword_269F38B38, (void (*)(uint64_t))sub_255EDAD94);
    sub_255EDBD08(&qword_269F38B80, (void (*)(uint64_t))sub_255EDAD94);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38B78);
  }
  return result;
}

void sub_255EDB1D4()
{
  if (!qword_269F38B88)
  {
    sub_255EDAD0C();
    sub_255EEF090();
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38B88);
    }
  }
}

void sub_255EDB23C()
{
  if (!qword_269F38B90)
  {
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38B90);
    }
  }
}

unint64_t sub_255EDB2DC()
{
  unint64_t result = qword_269F38B98;
  if (!qword_269F38B98)
  {
    sub_255EDB1D4();
    sub_255EDBD08(&qword_269F38BA0, (void (*)(uint64_t))sub_255EDAD0C);
    sub_255EDBD08(&qword_269F351C0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38B98);
  }
  return result;
}

unint64_t sub_255EDB3B4()
{
  unint64_t result = qword_269F38BA8;
  if (!qword_269F38BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38BA8);
  }
  return result;
}

void sub_255EDB408()
{
  if (!qword_269F38BB0)
  {
    sub_255EDB23C();
    sub_255EDC2E0(255, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, MEMORY[0x263F8D8F0]);
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38BB0);
    }
  }
}

void sub_255EDB550()
{
  if (!qword_269F38BC0)
  {
    sub_255EDB408();
    unint64_t v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EDC2E0(255, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, MEMORY[0x263F8D8F0]);
    sub_255EDB23C();
    sub_255EDC2E0(255, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, v0);
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BC8, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, (void (*)(void))sub_255E7BF58);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v2) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38BC0);
    }
  }
}

uint64_t sub_255EDB720(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_255EDC2E0(255, a2, a3, MEMORY[0x263F8D8F0]);
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_255EDB7AC()
{
  if (!qword_269F38BD0)
  {
    sub_255EDB550();
    sub_255ED53B0(255, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
    sub_255EDB408();
    unint64_t v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EDC2E0(255, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, MEMORY[0x263F8D8F0]);
    sub_255EDB23C();
    sub_255EDC2E0(255, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, v0);
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BC8, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, (void (*)(void))sub_255E7BF58);
    swift_getOpaqueTypeConformance2();
    sub_255DAD520();
    sub_255DDE03C();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v2) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38BD0);
    }
  }
}

void sub_255EDBA20()
{
  if (!qword_269F38BD8)
  {
    sub_255EDB7AC();
    type metadata accessor for RelationshipPickerView();
    sub_255EDB550();
    sub_255ED53B0(255, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
    sub_255EDB408();
    unint64_t v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EDC2E0(255, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, MEMORY[0x263F8D8F0]);
    sub_255EDB23C();
    sub_255EDC2E0(255, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, v0);
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BC8, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, (void (*)(void))sub_255E7BF58);
    swift_getOpaqueTypeConformance2();
    sub_255DAD520();
    sub_255DDE03C();
    swift_getOpaqueTypeConformance2();
    sub_255EDBD08(&qword_269F364C8, (void (*)(uint64_t))type metadata accessor for RelationshipPickerView);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v2) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38BD8);
    }
  }
}

uint64_t sub_255EDBD08(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_255EDBD50(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_255EEE870();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_255EDBDB4()
{
  if (!qword_269F38BE8)
  {
    sub_255EDBD50(255, &qword_269F38BE0, (void (*)(uint64_t))sub_255EDBA20);
    sub_255EDC2E0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    sub_255EDBEA0();
    sub_255EDC1D0();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38BE8);
    }
  }
}

unint64_t sub_255EDBEA0()
{
  unint64_t result = qword_269F38BF0;
  if (!qword_269F38BF0)
  {
    sub_255EDBD50(255, &qword_269F38BE0, (void (*)(uint64_t))sub_255EDBA20);
    sub_255EDB7AC();
    type metadata accessor for RelationshipPickerView();
    sub_255EDB550();
    sub_255ED53B0(255, (unint64_t *)&qword_269F35EA8, MEMORY[0x263F1A830], MEMORY[0x263F1A820], MEMORY[0x263F1B5E8]);
    sub_255EDB408();
    uint64_t v1 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EDC2E0(255, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, MEMORY[0x263F8D8F0]);
    sub_255EDB23C();
    sub_255EDC2E0(255, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, v1);
    sub_255EDB1D4();
    sub_255EDB2DC();
    sub_255EDB3B4();
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BB8, &qword_269F36C80, (uint64_t)&type metadata for MedicalIDEmergencyContact, (void (*)(void))sub_255DCB914);
    swift_getOpaqueTypeConformance2();
    sub_255EDB720(&qword_269F38BC8, &qword_269F37D70, (uint64_t)&type metadata for EmergencyContactPickerError, (void (*)(void))sub_255E7BF58);
    swift_getOpaqueTypeConformance2();
    sub_255DAD520();
    sub_255DDE03C();
    swift_getOpaqueTypeConformance2();
    sub_255EDBD08(&qword_269F364C8, (void (*)(uint64_t))type metadata accessor for RelationshipPickerView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38BF0);
  }
  return result;
}

unint64_t sub_255EDC1D0()
{
  unint64_t result = qword_269F38BF8;
  if (!qword_269F38BF8)
  {
    sub_255EDC2E0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38BF8);
  }
  return result;
}

uint64_t sub_255EDC260(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_255EDC2C8()
{
  return sub_255EDC3CC((uint64_t (*)(uint64_t))sub_255ED8070);
}

void sub_255EDC2E0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_255EDC32C()
{
  qword_269F38AF8 = 0x4030000000000000;
}

double sub_255EDC340@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AddEmergencyContactView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_255ED8B90(v4, a1);
}

uint64_t sub_255EDC3B4()
{
  return sub_255EDC3CC(sub_255ED8E3C);
}

uint64_t sub_255EDC3CC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AddEmergencyContactView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_255EDC444()
{
  return sub_255EDC3CC((uint64_t (*)(uint64_t))sub_255ED9070);
}

uint64_t sub_255EDC45C@<X0>(uint64_t a1@<X8>)
{
  return sub_255ED9214(*(void *)(v1 + 16), a1);
}

uint64_t sub_255EDC464@<X0>(uint64_t a1@<X8>)
{
  return sub_255ED97CC(*(void *)(v1 + 16), a1);
}

uint64_t sub_255EDC470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AddEmergencyContactView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_255ED993C(v4, a1);
}

uint64_t sub_255EDC4E4()
{
  return sub_255EDC3CC(sub_255ED9D9C);
}

uint64_t sub_255EDC4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t objectdestroyTm_26()
{
  uint64_t v1 = (int *)(type metadata accessor for AddEmergencyContactView(0) - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  sub_255EDAE28(0, &qword_269F35AB0, (uint64_t (*)(uint64_t))type metadata accessor for MedicalIDEditableEmergencyContactsModel, MEMORY[0x263F1B870]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
  swift_release();
  sub_255DADCE0(*(void *)(v2 + v1[9]), *(unsigned char *)(v2 + v1[9] + 8));
  return swift_deallocObject();
}

uint64_t sub_255EDC6B8()
{
  return sub_255EDC3CC((uint64_t (*)(uint64_t))sub_255ED95F4);
}

void sub_255EDC6D0()
{
  if (!qword_269F38C10)
  {
    sub_255EDAE28(255, &qword_269F38B48, (uint64_t (*)(uint64_t))sub_255EDAE8C, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_255EEE7B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38C10);
    }
  }
}

uint64_t sub_255EDC778(uint64_t a1, uint64_t a2)
{
  sub_255EDAE28(0, &qword_269F38A38, MEMORY[0x263F1B548], MEMORY[0x263F1A418]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_255EDC80C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_255EDC874(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL HKMedicalIDEmergencyContactsIsUnderLimit(uint64_t a1)
{
  return a1 < 10;
}

uint64_t sub_255EDC8E0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_255EDC9A0()
{
}

void sub_255EDC9B8()
{
}

void sub_255EDC9D0()
{
}

void sub_255EDC9E8()
{
}

void sub_255EDCA00(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  *a8 = swift_getKeyPath();
  sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = (int *)type metadata accessor for RelationshipPickerView();
  char v17 = (char *)a8 + v16[6];
  sub_255EDF3A0(0, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
  sub_255EEF810();
  *(_OWORD *)char v17 = v22;
  *((void *)v17 + 2) = v23;
  uint64_t v18 = (uint64_t *)((char *)a8 + v16[5]);
  *uint64_t v18 = a2;
  v18[1] = a3;
  v18[2] = a4;
  v18[3] = a5;
  id v19 = objc_allocWithZone((Class)MIUIRelationshipPickerDataSource);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v20 = objc_msgSend(v19, sel_initWithContact_, a1, 0, 0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  *(uint64_t *)((char *)a8 + v16[7]) = (uint64_t)v20;
  uint64_t v21 = (uint64_t *)((char *)a8 + v16[8]);
  *uint64_t v21 = a6;
  v21[1] = a7;
}

uint64_t type metadata accessor for RelationshipPickerView()
{
  uint64_t result = qword_269F38C18;
  if (!qword_269F38C18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_255EDCBEC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_255EEE730();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v12[3];
    v11[2] = v12[2];
    v11[3] = v14;
    uint64_t v15 = (uint64_t *)((char *)a1 + v10);
    uint64_t v16 = (uint64_t *)((char *)a2 + v10);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    v15[2] = v16[2];
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    id v20 = *(void **)((char *)a2 + v18);
    *(uint64_t *)((char *)a1 + v18) = (uint64_t)v20;
    uint64_t v21 = (uint64_t *)((char *)a1 + v19);
    long long v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    id v24 = v20;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_255EDCDB8(uint64_t a1, uint64_t a2)
{
  sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_255EEE730();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_255EDCED4(void *a1, void *a2, int *a3)
{
  sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_255EEE730();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  uint64_t v13 = (void *)((char *)a1 + v8);
  uint64_t v14 = (void *)((char *)a2 + v8);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  v13[2] = v14[2];
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void **)((char *)a2 + v16);
  *(void *)((char *)a1 + v16) = v18;
  uint64_t v19 = (void *)((char *)a1 + v17);
  id v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v22 = v18;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_255EDD050(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_255E463BC((uint64_t)a1);
    sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_255EEE730();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (char *)a2 + v10;
  *uint64_t v11 = *(void *)((char *)a2 + v10);
  v11[1] = *(void *)((char *)a2 + v10 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[2] = *((void *)v12 + 2);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void *)((char *)a1 + v13) = v14;
  id v16 = v14;

  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_255EDD238(char *a1, char *a2, int *a3)
{
  sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_255EEE730();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  long long v11 = *(_OWORD *)&a2[v9];
  long long v12 = *(_OWORD *)&a2[v9 + 16];
  uint64_t v13 = &a1[v9];
  *(_OWORD *)uint64_t v13 = v11;
  *((_OWORD *)v13 + 1) = v12;
  uint64_t v14 = &a1[v10];
  uint64_t v15 = &a2[v10];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((void *)v14 + 2) = *((void *)v15 + 2);
  uint64_t v16 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  return a1;
}

char *sub_255EDD36C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_255E463BC((uint64_t)a1);
    sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    uint64_t v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_255EEE730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  long long v11 = &a2[v9];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  swift_release();
  *((void *)v10 + 1) = *((void *)v11 + 1);
  swift_release();
  uint64_t v12 = *((void *)v11 + 3);
  *((void *)v10 + 2) = *((void *)v11 + 2);
  *((void *)v10 + 3) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void *)&a2[v13 + 8];
  *(void *)uint64_t v14 = *(void *)&a2[v13];
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = *(void **)&a1[v17];
  *(void *)&a1[v17] = *(void *)&a2[v17];

  uint64_t v19 = a3[8];
  id v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v23 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)id v20 = v23;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_255EDD510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EDD524);
}

uint64_t sub_255EDD524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_255EDD618(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

void sub_255EDD618(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_255EDD67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EDD690);
}

void sub_255EDD690(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_255EDD618(0, &qword_269F35720, MEMORY[0x263F188C0], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

void sub_255EDD780()
{
  sub_255EDD618(319, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_255EDD868()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255EDD884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v3 = sub_255EEEC70();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  MEMORY[0x270FA5388](v3);
  long long v66 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for RelationshipPickerView();
  uint64_t v6 = v5 - 8;
  uint64_t v58 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v58 + 64);
  MEMORY[0x270FA5388](v5);
  sub_255EDF278();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDF188();
  uint64_t v61 = v13;
  uint64_t v59 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDF060();
  uint64_t v63 = v16;
  uint64_t v62 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  long long v60 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDEF08();
  uint64_t v70 = v18;
  uint64_t v65 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  long long v64 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EDED30();
  uint64_t v71 = *(void *)(v20 - 8);
  uint64_t v72 = v20;
  MEMORY[0x270FA5388](v20);
  v69 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1 + *(int *)(v6 + 32);
  uint64_t v23 = *(void *)(v22 + 16);
  long long v76 = *(_OWORD *)v22;
  uint64_t v77 = v23;
  sub_255EDF51C(0, &qword_269F35820, MEMORY[0x263F1B5D0]);
  sub_255EEF840();
  uint64_t v75 = a1;
  sub_255EDF2F8();
  sub_255EDF464();
  sub_255EEF310();
  uint64_t v24 = *(void *)(v22 + 16);
  long long v78 = *(_OWORD *)v22;
  uint64_t v79 = v24;
  sub_255EEF820();
  long long v78 = v76;
  uint64_t v73 = a1;
  sub_255EDF5A0(a1, (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v25 = (*(unsigned __int8 *)(v58 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v26 = swift_allocObject();
  sub_255EDF608((uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25);
  sub_255EDF3A0(0, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
  uint64_t v28 = v27;
  uint64_t v29 = sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
  unint64_t v30 = sub_255EDC1D0();
  sub_255EEF690();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_255EEED10();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  id v31 = (id)qword_269F352A8;
  uint64_t v32 = sub_255EEF3C0();
  uint64_t v34 = v33;
  *(void *)&long long v78 = v9;
  *((void *)&v78 + 1) = v28;
  char v36 = v35 & 1;
  uint64_t v79 = v29;
  unint64_t v80 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v38 = v60;
  uint64_t v39 = v61;
  sub_255EEF4F0();
  sub_255D85120(v32, v34, v36);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v15, v39);
  uint64_t v41 = v67;
  uint64_t v40 = v68;
  uint64_t v42 = v66;
  (*(void (**)(char *, void, uint64_t))(v67 + 104))(v66, *MEMORY[0x263F19698], v68);
  *(void *)&long long v78 = v39;
  *((void *)&v78 + 1) = OpaqueTypeConformance2;
  uint64_t v43 = swift_getOpaqueTypeConformance2();
  long long v44 = v64;
  uint64_t v45 = v63;
  sub_255EEF5C0();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v40);
  uint64_t v46 = (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v38, v45);
  MEMORY[0x270FA5388](v46);
  sub_255E07734();
  uint64_t v48 = v47;
  *(void *)&long long v78 = v45;
  *((void *)&v78 + 1) = v43;
  uint64_t v49 = swift_getOpaqueTypeConformance2();
  uint64_t v50 = sub_255EDF4D4((unint64_t *)&qword_269F35EB0, (void (*)(uint64_t))sub_255E07734);
  long long v52 = v69;
  uint64_t v51 = v70;
  sub_255EEF650();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v44, v51);
  *(void *)&long long v76 = sub_255EEF700();
  sub_255EDD618(0, &qword_269F38C78, MEMORY[0x263F190C0], MEMORY[0x263F8E0F8]);
  sub_255EEE980();
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_255EF20B0;
  sub_255EEE970();
  *(void *)&long long v78 = v51;
  *((void *)&v78 + 1) = v48;
  uint64_t v79 = v49;
  unint64_t v80 = v50;
  uint64_t v54 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v72;
  MEMORY[0x25A29AF40](&v76, v53, v72, MEMORY[0x263F1B440], v54, MEMORY[0x263F1B420]);
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v52, v55);
}

uint64_t sub_255EDE268(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RelationshipPickerView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  id v5 = objc_msgSend(*(id *)(a1 + *(int *)(MEMORY[0x270FA5388](v2 - 8) + 36)), sel_relationships);
  uint64_t v6 = sub_255EEFEA0();

  v10[1] = v6;
  swift_getKeyPath();
  sub_255EDF5A0(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_255EDF608((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  sub_255EDF3A0(0, &qword_269F36CD0, MEMORY[0x263F8D488]);
  sub_255EDF3F0();
  sub_255E0722C();
  return sub_255EEFA00();
}

uint64_t sub_255EDE41C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = (uint64_t *)(a2 + *(int *)(type metadata accessor for RelationshipPickerView() + 32));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  *a3 = v5;
  a3[1] = v4;
  a3[2] = v7;
  a3[3] = v8;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_255EDE484(uint64_t a1)
{
  uint64_t v2 = sub_255EEE730();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RelationshipPickerView();
  uint64_t v7 = (long long *)(a1 + *(int *)(v6 + 24));
  uint64_t v8 = *((void *)v7 + 2);
  long long v12 = *v7;
  *(void *)&long long v13 = v8;
  sub_255EDF51C(0, &qword_269F35820, MEMORY[0x263F1B5D0]);
  sub_255EEF820();
  uint64_t v9 = a1 + *(int *)(v6 + 20);
  uint64_t v10 = *(void *)(v9 + 8);
  *(void *)&long long v12 = *(void *)v9;
  *((void *)&v12 + 1) = v10;
  long long v13 = *(_OWORD *)(v9 + 16);
  sub_255EDF51C(0, (unint64_t *)&qword_269F36308, MEMORY[0x263F1B750]);
  sub_255EEF980();
  sub_255DAA4A8((uint64_t)v5);
  sub_255EEE720();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_255EDE600(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RelationshipPickerView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_255EDF5A0(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_255EDF608((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  return sub_255EEF870();
}

uint64_t sub_255EDE72C()
{
  uint64_t v0 = sub_255EEE730();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255DAA4A8((uint64_t)v3);
  sub_255EEE720();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_255EDE7F8@<X0>(uint64_t a1@<X8>)
{
  sub_255EEED10();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_269F352A8;
  uint64_t result = sub_255EEF3C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_255EDE8D0()
{
  return sub_255EEE880();
}

uint64_t sub_255EDEB04@<X0>(uint64_t a1@<X8>)
{
  return sub_255EDD884(*(void *)(v1 + 16), a1);
}

void sub_255EDEB0C()
{
  if (!qword_269F38C28)
  {
    sub_255EDED30();
    sub_255EDEF08();
    sub_255E07734();
    sub_255EDF060();
    sub_255EDF188();
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_255EDF4D4((unint64_t *)&qword_269F35EB0, (void (*)(uint64_t))sub_255E07734);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38C28);
    }
  }
}

void sub_255EDED30()
{
  if (!qword_269F38C30)
  {
    sub_255EDEF08();
    sub_255E07734();
    sub_255EDF060();
    sub_255EDF188();
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_255EDF4D4((unint64_t *)&qword_269F35EB0, (void (*)(uint64_t))sub_255E07734);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38C30);
    }
  }
}

void sub_255EDEF08()
{
  if (!qword_269F38C38)
  {
    sub_255EDF060();
    sub_255EDF188();
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38C38);
    }
  }
}

void sub_255EDF060()
{
  if (!qword_269F38C40)
  {
    sub_255EDF188();
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38C40);
    }
  }
}

void sub_255EDF188()
{
  if (!qword_269F38C48)
  {
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F38C48);
    }
  }
}

void sub_255EDF278()
{
  if (!qword_269F38C50)
  {
    sub_255EDF2F8();
    sub_255EDF464();
    unint64_t v0 = sub_255EEF330();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38C50);
    }
  }
}

void sub_255EDF2F8()
{
  if (!qword_269F38C58)
  {
    sub_255EDF3A0(255, &qword_269F36CD0, MEMORY[0x263F8D488]);
    sub_255EDF3F0();
    unint64_t v0 = sub_255EEFA20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38C58);
    }
  }
}

void sub_255EDF3A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8D310]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_255EDF3F0()
{
  unint64_t result = qword_269F38C60;
  if (!qword_269F38C60)
  {
    sub_255EDF3A0(255, &qword_269F36CD0, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38C60);
  }
  return result;
}

unint64_t sub_255EDF464()
{
  unint64_t result = qword_269F38C68;
  if (!qword_269F38C68)
  {
    sub_255EDF2F8();
    sub_255E0722C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38C68);
  }
  return result;
}

uint64_t sub_255EDF4D4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_255EDF51C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_255EDF598()
{
  return sub_255EDE268(*(void *)(v0 + 16));
}

uint64_t sub_255EDF5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RelationshipPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_255EDF608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RelationshipPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_255EDF66C()
{
  return sub_255EDF6A8(sub_255EDE484);
}

uint64_t sub_255EDF684()
{
  return sub_255EDE600(*(void *)(v0 + 16));
}

uint64_t sub_255EDF690()
{
  return sub_255EDF6A8((uint64_t (*)(uint64_t))sub_255EDE72C);
}

uint64_t sub_255EDF6A8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for RelationshipPickerView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t objectdestroyTm_27()
{
  uint64_t v1 = type metadata accessor for RelationshipPickerView();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  sub_255EDD618(0, (unint64_t *)&qword_269F35580, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_255EEE730();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_255EDF8B4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for RelationshipPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_255EDE41C(a1, v6, a2);
}

uint64_t sub_255EDF934()
{
  return sub_255EDF4D4(&qword_269F38C80, (void (*)(uint64_t))sub_255EDF97C);
}

void sub_255EDF97C()
{
  if (!qword_269F38C88)
  {
    sub_255EEE810();
    sub_255EDEB0C();
    sub_255EDED30();
    sub_255EDEF08();
    sub_255E07734();
    sub_255EDF060();
    sub_255EDF188();
    sub_255EDF278();
    sub_255EDF3A0(255, (unint64_t *)&qword_269F35700, MEMORY[0x263F8D8F0]);
    sub_255EDF4D4(&qword_269F38C70, (void (*)(uint64_t))sub_255EDF278);
    sub_255EDC1D0();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_255EDF4D4((unint64_t *)&qword_269F35EB0, (void (*)(uint64_t))sub_255E07734);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t v0 = sub_255EEE890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38C88);
    }
  }
}

uint64_t sub_255EDFBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EDFBDC);
}

uint64_t sub_255EDFBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicalIDMedicalInfoViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_255EDFC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EDFCB0);
}

uint64_t sub_255EDFCB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MedicalIDMedicalInfoViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for MedicalIDAllergiesCellView()
{
  uint64_t result = qword_269F38C90;
  if (!qword_269F38C90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255EDFDB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255EDFDD4@<X0>(uint64_t a1@<X8>)
{
  if (qword_269F34B08 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_269F3FD78;
  uint64_t v21 = qword_269F3FD70;
  uint64_t v4 = *v1;
  swift_bridgeObjectRetain();
  id v5 = objc_msgSend(v4, sel_allergyInfo);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_255EEFD90();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = sub_255EEFD40();
  MEMORY[0x270FA5388](v10 - 8);
  sub_255EEFCD0();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_269F352A8;
  uint64_t v12 = sub_255EEE200();
  MEMORY[0x270FA5388](v12 - 8);
  id v13 = v11;
  sub_255EEE1F0();
  uint64_t v14 = sub_255EEFDA0();
  uint64_t v16 = v15;
  uint64_t v17 = (uint64_t *)((char *)v1 + *(int *)(type metadata accessor for MedicalIDAllergiesCellView() + 20));
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = v16;
  *(void *)(a1 + 56) = v19;
  *(void *)(a1 + 64) = v18;
  return swift_retain();
}

__n128 sub_255EE0000@<Q0>(uint64_t a1@<X8>)
{
  sub_255EDFDD4((uint64_t)v8);
  uint64_t v2 = v8[1];
  char v3 = v9;
  uint64_t v4 = v11;
  uint64_t v5 = v13;
  __n128 result = v12;
  long long v7 = v10;
  *(void *)a1 = v8[0];
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = v7;
  *(void *)(a1 + 40) = v4;
  *(__n128 *)(a1 + 48) = result;
  *(void *)(a1 + 64) = v5;
  return result;
}

uint64_t sub_255EE0060@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1;
  uint64_t v3 = type metadata accessor for EditBloodTypeCellView();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_255DDE868();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269F34B50 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void *)algn_269F3FE08;
  uint64_t v31 = qword_269F3FE00;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_255EF0070();
  long long v10 = (char *)v1 + *(int *)(v3 + 20);
  long long v11 = *(_OWORD *)v10;
  uint64_t v12 = *((void *)v10 + 2);
  long long v33 = v11;
  uint64_t v34 = v12;
  sub_255EE3398(0, &qword_269F38CC0, (uint64_t (*)(uint64_t))type metadata accessor for HKBloodType, MEMORY[0x263F1B750]);
  sub_255EEF9A0();
  uint64_t v28 = v36;
  uint64_t v29 = v35;
  uint64_t v27 = v37;
  uint64_t v13 = sub_255EE038C();
  char v15 = v14;
  sub_255D7F1F0();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_255EF1E20;
  uint64_t v17 = v2[1];
  *(void *)(v16 + 32) = *v2;
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = 0x707954646F6F6C42;
  *(void *)(v16 + 56) = 0xE900000000000065;
  swift_bridgeObjectRetain();
  uint64_t v18 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v19 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (!v19)
  {
    sub_255EE3404((uint64_t)v2, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for EditBloodTypeCellView);
LABEL_7:
    uint64_t v20 = *v5;
    uint64_t v22 = v5[1];
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  uint64_t v20 = sub_255EEFD90();
  uint64_t v22 = v21;

  sub_255EE3404((uint64_t)v2, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for EditBloodTypeCellView);
  if (!v22) {
    goto LABEL_7;
  }
LABEL_8:
  sub_255EE346C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for EditBloodTypeCellView);
  uint64_t v23 = (void *)((char *)v2 + *(int *)(v3 + 28));
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  sub_255D85808(*v23);
  sub_255DDA364(v31, v9, v30, v29, v28, v27, v13, v15 & 1, (uint64_t)v8, 0, 0, v20, v22, 0, v24, v25, (uint64_t)sub_255EE0650, 0);
  return sub_255EE3334((uint64_t)v8, v32);
}

uint64_t sub_255EE038C()
{
  uint64_t v1 = type metadata accessor for HealthDemographicData();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EE3398(0, (unint64_t *)&qword_269F350A0, (uint64_t (*)(uint64_t))type metadata accessor for HealthDemographicData, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - v6;
  uint64_t v8 = type metadata accessor for EditBloodTypeCellView();
  uint64_t v9 = *(void **)(v0 + *(int *)(v8 + 32));
  if (v9)
  {
    if (objc_msgSend(v9, sel_suggestHealthData))
    {
      uint64_t v10 = *(void *)(v0 + *(int *)(v8 + 24));
      swift_getKeyPath();
      v14[1] = v10;
      sub_255EE3514((unint64_t *)&qword_269F350A8, (void (*)(uint64_t))type metadata accessor for HealthDemographicDataProvider);
      sub_255EEE2D0();
      swift_release();
      uint64_t v11 = v10 + OBJC_IVAR____TtC11MedicalIDUI29HealthDemographicDataProvider__data;
      swift_beginAccess();
      sub_255D7FE80(v11, (uint64_t)v7);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
      {
        sub_255EE3404((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HealthDemographicData);
        sub_255D7FDC0((uint64_t)v7);
        uint64_t v12 = *(void *)&v4[*(int *)(v1 + 36)];
        sub_255EE346C((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HealthDemographicData);
        return v12;
      }
      sub_255D7FDC0((uint64_t)v7);
    }
    return 0;
  }
  sub_255DB6ED8();
  sub_255EE3514((unint64_t *)&qword_269F35578, (void (*)(uint64_t))sub_255DB6ED8);
  uint64_t result = sub_255EEE9E0();
  __break(1u);
  return result;
}

uint64_t sub_255EE0650@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_retain();
}

uint64_t sub_255EE0660()
{
  return MEMORY[0x263F8D6D8];
}

uint64_t sub_255EE066C()
{
  id v0 = (id)HKStringForBloodType();
  uint64_t v1 = sub_255EEFD90();

  return v1;
}

uint64_t sub_255EE06BC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_255EE3514(&qword_269F38CA0, type metadata accessor for HKBloodType);
  uint64_t result = sub_255EE3514(&qword_269F38CA8, type metadata accessor for HKBloodType);
  *(void *)(a1 + 16) = result;
  return result;
}

void *sub_255EE0740(void *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v25 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v6;
    uint64_t v99 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
    uint64_t v7 = v99[5];
    uint64_t v101 = a2;
    uint64_t v102 = a1;
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = &a2[v7];
    uint64_t v10 = *(void *)&a2[v7];
    uint64_t v11 = *((void *)v9 + 1);
    *uint64_t v8 = v10;
    v8[1] = v11;
    uint64_t v12 = *((void *)v9 + 3);
    void v8[2] = *((void *)v9 + 2);
    v8[3] = v12;
    uint64_t v13 = *((void *)v9 + 5);
    v8[4] = *((void *)v9 + 4);
    v8[5] = v13;
    uint64_t v14 = *((void *)v9 + 7);
    v8[6] = *((void *)v9 + 6);
    v8[7] = v14;
    uint64_t v15 = *((void *)v9 + 9);
    v8[8] = *((void *)v9 + 8);
    v8[9] = v15;
    uint64_t v16 = *((void *)v9 + 11);
    v8[10] = *((void *)v9 + 10);
    v8[11] = v16;
    uint64_t v96 = (void *)*((void *)v9 + 12);
    v103 = (void *)*((void *)v9 + 13);
    v8[12] = v96;
    v8[13] = v103;
    v105 = (int *)type metadata accessor for MedicalIDData();
    uint64_t v17 = v105[13];
    __dst = (char *)v8 + v17;
    uint64_t v18 = &v9[v17];
    uint64_t v19 = sub_255EEE100();
    uint64_t v97 = *(void *)(v19 - 8);
    uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v97 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v21 = v96;
    id v22 = v103;
    v104 = v20;
    if (v20(v18, 1, v19))
    {
      sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
      memcpy(__dst, v18, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v97 + 16))(__dst, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v97 + 56))(__dst, 0, 1, v19);
    }
    uint64_t v26 = v105[14];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = &v9[v26];
    if (v104(&v9[v26], 1, v19))
    {
      uint64_t v29 = v97;
      sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
      memcpy(v27, v28, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v27, v28, v19);
      uint64_t v29 = v97;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v97 + 56))(v27, 0, 1, v19);
    }
    uint64_t v31 = v105[15];
    uint64_t v32 = (void *)((char *)v8 + v31);
    long long v33 = &v9[v31];
    uint64_t v34 = *((void *)v33 + 1);
    *uint64_t v32 = *(void *)v33;
    v32[1] = v34;
    uint64_t v35 = v105[16];
    uint64_t v36 = (void *)((char *)v8 + v35);
    uint64_t v37 = &v9[v35];
    uint64_t v38 = *((void *)v37 + 1);
    *uint64_t v36 = *(void *)v37;
    v36[1] = v38;
    *((unsigned char *)v8 + v105[17]) = v9[v105[17]];
    *((unsigned char *)v8 + v105[18]) = v9[v105[18]];
    uint64_t v39 = v105[19];
    uint64_t v40 = (char *)v8 + v39;
    uint64_t v41 = (uint64_t *)&v9[v39];
    unint64_t v42 = *(void *)&v9[v39 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v42 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
    }
    else
    {
      uint64_t v43 = *v41;
      sub_255D80890(*v41, v42);
      *(void *)uint64_t v40 = v43;
      *((void *)v40 + 1) = v42;
    }
    uint64_t v44 = v29;
    uint64_t v45 = v105[20];
    uint64_t v46 = (char *)v8 + v45;
    uint64_t v47 = &v9[v45];
    uint64_t v48 = sub_255EEDF60();
    uint64_t v49 = *(void *)(v48 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48))
    {
      sub_255EE3398(0, &qword_269F350B8, MEMORY[0x270FA8140], MEMORY[0x263F8D8F0]);
      memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
    uint64_t v51 = v105[21];
    long long v52 = *(void **)&v9[v51];
    *(void *)((char *)v8 + v51) = v52;
    uint64_t v53 = v105[22];
    uint64_t v54 = (char *)v8 + v53;
    uint64_t v55 = &v9[v53];
    id v56 = v52;
    if (v104(v55, 1, v19))
    {
      sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
      memcpy(v54, v55, *(void *)(*(void *)(v57 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v54, v55, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v54, 0, 1, v19);
    }
    uint64_t v25 = v102;
    uint64_t v58 = v99[6];
    uint64_t v59 = (char *)v102 + v58;
    long long v60 = &v101[v58];
    uint64_t v61 = sub_255EEE200();
    uint64_t v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16);
    v62(v59, v60, v61);
    uint64_t v63 = v99[7];
    long long v64 = (char *)v102 + v63;
    uint64_t v65 = &v101[v63];
    v62((char *)v102 + v63, &v101[v63], v61);
    uint64_t v66 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
    uint64_t v67 = *(void **)&v65[v66];
    *(void *)&v64[v66] = v67;
    uint64_t v68 = v99[8];
    v69 = (char *)v102 + v68;
    uint64_t v70 = &v101[v68];
    id v71 = v67;
    v62(v69, v70, v61);
    uint64_t v72 = type metadata accessor for MedicalIDWeightFormatter();
    uint64_t v73 = *(int *)(v72 + 20);
    uint64_t v74 = *(void **)&v70[v73];
    *(void *)&v69[v73] = v74;
    uint64_t v75 = *(int *)(v72 + 24);
    long long v76 = *(void **)&v70[v75];
    *(void *)&v69[v75] = v76;
    uint64_t v77 = a3[5];
    uint64_t v78 = a3[6];
    uint64_t v79 = (void *)((char *)v102 + v77);
    unint64_t v80 = &v101[v77];
    uint64_t v81 = *((void *)v80 + 1);
    *uint64_t v79 = *(void *)v80;
    v79[1] = v81;
    v79[2] = *((void *)v80 + 2);
    *(void *)((char *)v102 + v78) = *(void *)&v101[v78];
    uint64_t v82 = a3[7];
    uint64_t v83 = (void *)((char *)v102 + v82);
    v84 = &v101[v82];
    uint64_t v85 = *(void *)&v101[v82];
    id v86 = v74;
    id v87 = v76;
    swift_retain();
    swift_retain();
    swift_retain();
    if (v85)
    {
      uint64_t v88 = *((void *)v84 + 1);
      *uint64_t v83 = v85;
      v83[1] = v88;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v83 = *(_OWORD *)v84;
    }
    uint64_t v89 = a3[8];
    v90 = (void *)((char *)v102 + v89);
    v91 = &v101[v89];
    uint64_t v93 = *(void **)v91;
    uint64_t v92 = *((void *)v91 + 1);
    void *v90 = v93;
    v90[1] = v92;
    id v94 = v93;
  }
  return v25;
}

void sub_255EE0E54(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v24 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v4 = a1 + v24[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  int v5 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v6 = v4 + v5[13];
  uint64_t v7 = sub_255EEE100();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = v4 + v5[14];
  if (!v9(v10, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v25 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (uint64_t *)(v4 + v5[19]);
  unint64_t v12 = v11[1];
  if (v12 >> 60 != 15) {
    sub_255D80D04(*v11, v12);
  }
  uint64_t v13 = v4 + v5[20];
  uint64_t v14 = sub_255EEDF60();
  uint64_t v15 = *(void *)(v14 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }

  uint64_t v16 = v4 + v5[22];
  if (!v9(v16, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v16, v7);
  }
  uint64_t v17 = a1 + v24[6];
  uint64_t v18 = sub_255EEE200();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  v19(v17, v18);
  uint64_t v20 = a1 + v24[7];
  v19(v20, v18);

  uint64_t v21 = a1 + v24[8];
  v19(v21, v18);
  uint64_t v22 = type metadata accessor for MedicalIDWeightFormatter();

  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(a1 + *(int *)(v25 + 28))) {
    swift_release();
  }
  uint64_t v23 = *(void **)(a1 + *(int *)(v25 + 32));
}

char *sub_255EE11F4(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v97 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v6 = v97[5];
  uint64_t v99 = a2;
  v100 = a1;
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = *(void *)&a2[v6 + 8];
  *(void *)uint64_t v7 = *(void *)&a2[v6];
  *((void *)v7 + 1) = v9;
  uint64_t v11 = *(void *)&a2[v6 + 16];
  uint64_t v10 = *(void *)&a2[v6 + 24];
  *((void *)v7 + 2) = v11;
  *((void *)v7 + 3) = v10;
  uint64_t v12 = *((void *)v8 + 5);
  *((void *)v7 + 4) = *((void *)v8 + 4);
  *((void *)v7 + 5) = v12;
  uint64_t v13 = *((void *)v8 + 7);
  *((void *)v7 + 6) = *((void *)v8 + 6);
  *((void *)v7 + 7) = v13;
  uint64_t v14 = *((void *)v8 + 9);
  *((void *)v7 + 8) = *((void *)v8 + 8);
  *((void *)v7 + 9) = v14;
  uint64_t v15 = *((void *)v8 + 11);
  *((void *)v7 + 10) = *((void *)v8 + 10);
  *((void *)v7 + 11) = v15;
  id v94 = (void *)*((void *)v8 + 12);
  uint64_t v101 = (void *)*((void *)v8 + 13);
  *((void *)v7 + 12) = v94;
  *((void *)v7 + 13) = v101;
  v103 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v16 = v103[13];
  __dst = &v7[v16];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = sub_255EEE100();
  uint64_t v95 = *(void *)(v18 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v20 = v94;
  id v21 = v101;
  uint64_t v102 = v19;
  if (v19(v17, 1, v18))
  {
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(__dst, v17, *(void *)(*(void *)(v22 - 8) + 64));
    uint64_t v23 = v95;
  }
  else
  {
    uint64_t v23 = v95;
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(__dst, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v95 + 56))(__dst, 0, 1, v18);
  }
  uint64_t v24 = v103[14];
  uint64_t v25 = &v7[v24];
  uint64_t v26 = &v8[v24];
  if (v102(&v8[v24], 1, v18))
  {
    uint64_t v27 = v23;
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v25, v26, v18);
    uint64_t v27 = v23;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v18);
  }
  uint64_t v29 = v103[15];
  uint64_t v30 = &v7[v29];
  uint64_t v31 = &v8[v29];
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)uint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = v32;
  uint64_t v33 = v103[16];
  uint64_t v34 = &v7[v33];
  uint64_t v35 = &v8[v33];
  uint64_t v36 = *((void *)v35 + 1);
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = v36;
  v7[v103[17]] = v8[v103[17]];
  v7[v103[18]] = v8[v103[18]];
  uint64_t v37 = v103[19];
  uint64_t v38 = &v7[v37];
  uint64_t v39 = (uint64_t *)&v8[v37];
  unint64_t v40 = *(void *)&v8[v37 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v40 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  }
  else
  {
    uint64_t v41 = *v39;
    sub_255D80890(*v39, v40);
    *(void *)uint64_t v38 = v41;
    *((void *)v38 + 1) = v40;
  }
  uint64_t v42 = v27;
  uint64_t v43 = v103[20];
  uint64_t v44 = &v7[v43];
  uint64_t v45 = &v8[v43];
  uint64_t v46 = sub_255EEDF60();
  uint64_t v47 = *(void *)(v46 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
  {
    sub_255EE3398(0, &qword_269F350B8, MEMORY[0x270FA8140], MEMORY[0x263F8D8F0]);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v44, v45, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
  }
  uint64_t v49 = v103[21];
  uint64_t v50 = *(void **)&v8[v49];
  *(void *)&v7[v49] = v50;
  uint64_t v51 = v103[22];
  long long v52 = &v7[v51];
  uint64_t v53 = &v8[v51];
  id v54 = v50;
  if (v102(v53, 1, v18))
  {
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v52, v53, *(void *)(*(void *)(v55 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v52, v53, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v52, 0, 1, v18);
  }
  uint64_t v56 = v97[6];
  uint64_t v57 = &v100[v56];
  uint64_t v58 = &v99[v56];
  uint64_t v59 = sub_255EEE200();
  long long v60 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 16);
  v60(v57, v58, v59);
  uint64_t v61 = v97[7];
  uint64_t v62 = &v100[v61];
  uint64_t v63 = &v99[v61];
  v60(&v100[v61], &v99[v61], v59);
  uint64_t v64 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  uint64_t v65 = *(void **)&v63[v64];
  *(void *)&v62[v64] = v65;
  uint64_t v66 = v97[8];
  uint64_t v67 = &v100[v66];
  uint64_t v68 = &v99[v66];
  id v69 = v65;
  v60(v67, v68, v59);
  uint64_t v70 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v71 = *(int *)(v70 + 20);
  uint64_t v72 = *(void **)&v68[v71];
  *(void *)&v67[v71] = v72;
  uint64_t v73 = *(int *)(v70 + 24);
  uint64_t v74 = *(void **)&v68[v73];
  *(void *)&v67[v73] = v74;
  uint64_t v75 = a3[5];
  uint64_t v76 = a3[6];
  uint64_t v77 = &v100[v75];
  uint64_t v78 = &v99[v75];
  uint64_t v79 = *((void *)v78 + 1);
  *(void *)uint64_t v77 = *(void *)v78;
  *((void *)v77 + 1) = v79;
  *((void *)v77 + 2) = *((void *)v78 + 2);
  *(void *)&v100[v76] = *(void *)&v99[v76];
  uint64_t v80 = a3[7];
  uint64_t v81 = &v100[v80];
  uint64_t v82 = &v99[v80];
  uint64_t v83 = *(void *)&v99[v80];
  id v84 = v72;
  id v85 = v74;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v83)
  {
    uint64_t v86 = *((void *)v82 + 1);
    *(void *)uint64_t v81 = v83;
    *((void *)v81 + 1) = v86;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v81 = *(_OWORD *)v82;
  }
  uint64_t v87 = a3[8];
  uint64_t v88 = &v100[v87];
  uint64_t v89 = &v99[v87];
  v91 = *(void **)v89;
  uint64_t v90 = *((void *)v89 + 1);
  *(void *)uint64_t v88 = v91;
  *((void *)v88 + 1) = v90;
  id v92 = v91;
  return v100;
}

char *sub_255EE18B4(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v108 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v5 = v108[5];
  uint64_t v110 = a2;
  v111 = a1;
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  *(void *)uint64_t v6 = *(void *)&a2[v5];
  *((void *)v6 + 1) = *(void *)&a2[v5 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 2) = *((void *)v7 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 3) = *((void *)v7 + 3);
  *((void *)v6 + 4) = *((void *)v7 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 5) = *((void *)v7 + 5);
  *((void *)v6 + 6) = *((void *)v7 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 7) = *((void *)v7 + 7);
  *((void *)v6 + 8) = *((void *)v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 9) = *((void *)v7 + 9);
  *((void *)v6 + 10) = *((void *)v7 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 11) = *((void *)v7 + 11);
  uint64_t v8 = (void *)*((void *)v6 + 12);
  uint64_t v9 = (void *)*((void *)v7 + 12);
  *((void *)v6 + 12) = v9;
  id v10 = v9;

  uint64_t v11 = (void *)*((void *)v6 + 13);
  uint64_t v12 = (void *)*((void *)v7 + 13);
  *((void *)v6 + 13) = v12;
  id v13 = v12;

  uint64_t v14 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v15 = v14[13];
  uint64_t v16 = &v6[v15];
  uint64_t v17 = &v7[v15];
  uint64_t v18 = sub_255EEE100();
  uint64_t v19 = *(void *)(v18 - 8);
  id v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_7:
  uint64_t v24 = v14[14];
  uint64_t v25 = &v6[v24];
  uint64_t v26 = &v7[v24];
  int v27 = v20(&v6[v24], 1, v18);
  int v28 = v20(v26, 1, v18);
  uint64_t v107 = v18;
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v26, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v18);
LABEL_12:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v25, v26, v18);
LABEL_13:
  uint64_t v30 = v14[15];
  uint64_t v31 = &v6[v30];
  uint64_t v32 = &v7[v30];
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v14[16];
  uint64_t v34 = &v6[v33];
  uint64_t v35 = &v7[v33];
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = *((void *)v35 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v14[17]] = v7[v14[17]];
  v6[v14[18]] = v7[v14[18]];
  uint64_t v36 = v14[19];
  uint64_t v37 = (uint64_t *)&v6[v36];
  uint64_t v38 = (uint64_t *)&v7[v36];
  unint64_t v39 = *(void *)&v7[v36 + 8];
  uint64_t v106 = v19;
  v105 = v20;
  if (*(void *)&v6[v36 + 8] >> 60 == 15)
  {
    if (v39 >> 60 != 15)
    {
      uint64_t v40 = *v38;
      sub_255D80890(*v38, v39);
      *uint64_t v37 = v40;
      v37[1] = v39;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v39 >> 60 == 15)
  {
    sub_255D81EF8((uint64_t)v37);
LABEL_18:
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    goto LABEL_20;
  }
  uint64_t v41 = *v38;
  sub_255D80890(*v38, v39);
  uint64_t v42 = *v37;
  unint64_t v43 = v37[1];
  *uint64_t v37 = v41;
  v37[1] = v39;
  sub_255D80D04(v42, v43);
LABEL_20:
  uint64_t v44 = v14[20];
  uint64_t v45 = &v6[v44];
  uint64_t v46 = &v7[v44];
  uint64_t v47 = sub_255EEDF60();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  int v50 = v49(v45, 1, v47);
  int v51 = v49(v46, 1, v47);
  if (v50)
  {
    uint64_t v52 = v106;
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v52 = v106;
  if (v51)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
LABEL_25:
    sub_255EE3398(0, &qword_269F350B8, MEMORY[0x270FA8140], MEMORY[0x263F8D8F0]);
    memcpy(v45, v46, *(void *)(*(void *)(v53 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v45, v46, v47);
LABEL_26:
  uint64_t v54 = v14[21];
  uint64_t v55 = *(void **)&v6[v54];
  uint64_t v56 = *(void **)&v7[v54];
  *(void *)&v6[v54] = v56;
  id v57 = v56;

  uint64_t v58 = v14[22];
  uint64_t v59 = &v6[v58];
  long long v60 = &v7[v58];
  int v61 = v105(&v6[v58], 1, v107);
  int v62 = v105(v60, 1, v107);
  if (v61)
  {
    if (!v62)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v59, v60, v107);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v59, 0, 1, v107);
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (v62)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v59, v107);
LABEL_31:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 24))(v59, v60, v107);
LABEL_32:
  uint64_t v64 = v108[6];
  uint64_t v65 = &v111[v64];
  uint64_t v66 = &v110[v64];
  uint64_t v67 = sub_255EEE200();
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 24);
  v68(v65, v66, v67);
  uint64_t v69 = v108[7];
  uint64_t v70 = &v111[v69];
  uint64_t v71 = &v110[v69];
  v68(&v111[v69], &v110[v69], v67);
  uint64_t v72 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  uint64_t v73 = *(void **)&v71[v72];
  uint64_t v74 = *(void **)&v70[v72];
  *(void *)&v70[v72] = v73;
  id v75 = v73;

  uint64_t v76 = v108[8];
  uint64_t v77 = &v111[v76];
  uint64_t v78 = &v110[v76];
  v68(&v111[v76], &v110[v76], v67);
  uint64_t v79 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v80 = *(int *)(v79 + 20);
  uint64_t v81 = *(void **)&v78[v80];
  uint64_t v82 = *(void **)&v77[v80];
  *(void *)&v77[v80] = v81;
  id v83 = v81;

  uint64_t v84 = *(int *)(v79 + 24);
  id v85 = *(void **)&v78[v84];
  uint64_t v86 = *(void **)&v77[v84];
  *(void *)&v77[v84] = v85;
  id v87 = v85;

  uint64_t v88 = a3[5];
  uint64_t v89 = &v111[v88];
  uint64_t v90 = &v110[v88];
  *(void *)&v111[v88] = *(void *)&v110[v88];
  swift_retain();
  swift_release();
  *((void *)v89 + 1) = *((void *)v90 + 1);
  swift_retain();
  swift_release();
  *((void *)v89 + 2) = *((void *)v90 + 2);
  *(void *)&v111[a3[6]] = *(void *)&v110[a3[6]];
  swift_retain();
  swift_release();
  uint64_t v91 = a3[7];
  id v92 = &v111[v91];
  uint64_t v93 = &v110[v91];
  uint64_t v94 = *(void *)&v111[v91];
  uint64_t v95 = *(void *)&v110[v91];
  if (!v94)
  {
    if (v95)
    {
      uint64_t v97 = *((void *)v93 + 1);
      *(void *)id v92 = v95;
      *((void *)v92 + 1) = v97;
      swift_retain();
      goto LABEL_39;
    }
LABEL_38:
    *(_OWORD *)id v92 = *(_OWORD *)v93;
    goto LABEL_39;
  }
  if (!v95)
  {
    swift_release();
    goto LABEL_38;
  }
  uint64_t v96 = *((void *)v93 + 1);
  *(void *)id v92 = v95;
  *((void *)v92 + 1) = v96;
  swift_retain();
  swift_release();
LABEL_39:
  uint64_t v98 = a3[8];
  uint64_t v99 = &v111[v98];
  v100 = &v110[v98];
  uint64_t v101 = *(void **)&v111[v98];
  uint64_t v102 = *(void **)&v110[v98];
  *(void *)uint64_t v99 = v102;
  id v103 = v102;

  *((void *)v99 + 1) = *((void *)v100 + 1);
  return v111;
}

char *sub_255EE2230(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v55 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v5 = v55[5];
  uint64_t v6 = &a1[v5];
  id v57 = a2;
  uint64_t v7 = &a2[v5];
  *(_OWORD *)uint64_t v6 = *(_OWORD *)&a2[v5];
  *((void *)v6 + 2) = *(void *)&a2[v5 + 16];
  *(_OWORD *)(v6 + 24) = *(_OWORD *)&a2[v5 + 24];
  *(_OWORD *)(v6 + 40) = *(_OWORD *)&a2[v5 + 40];
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&a2[v5 + 56];
  *(_OWORD *)(v6 + 72) = *(_OWORD *)&a2[v5 + 72];
  *((void *)v6 + 11) = *(void *)&a2[v5 + 88];
  *((_OWORD *)v6 + 6) = *(_OWORD *)&a2[v5 + 96];
  uint64_t v8 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v9 = v8[13];
  id v10 = &v6[v9];
  uint64_t v11 = &v7[v9];
  uint64_t v12 = sub_255EEE100();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v16 = v8[14];
  uint64_t v17 = &v6[v16];
  uint64_t v18 = &v7[v16];
  uint64_t v53 = v14;
  uint64_t v54 = v13;
  if (v14(&v7[v16], 1, v12))
  {
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  *(_OWORD *)&v6[v8[15]] = *(_OWORD *)&v7[v8[15]];
  *(_OWORD *)&v6[v8[16]] = *(_OWORD *)&v7[v8[16]];
  v6[v8[17]] = v7[v8[17]];
  v6[v8[18]] = v7[v8[18]];
  *(_OWORD *)&v6[v8[19]] = *(_OWORD *)&v7[v8[19]];
  uint64_t v20 = v8[20];
  int v21 = &v6[v20];
  int v22 = &v7[v20];
  uint64_t v23 = sub_255EEDF60();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    sub_255EE3398(0, &qword_269F350B8, MEMORY[0x270FA8140], MEMORY[0x263F8D8F0]);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(void *)&v6[v8[21]] = *(void *)&v7[v8[21]];
  uint64_t v26 = v8[22];
  int v27 = &v6[v26];
  int v28 = &v7[v26];
  if (v53(&v7[v26], 1, v12))
  {
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v27, v28, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v27, 0, 1, v12);
  }
  uint64_t v30 = v55[6];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &v57[v30];
  uint64_t v33 = sub_255EEE200();
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32);
  v34(v31, v32, v33);
  uint64_t v35 = v55[7];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &v57[v35];
  v34(&a1[v35], &v57[v35], v33);
  uint64_t v38 = type metadata accessor for MedicalIDHeightFormatter();
  *(void *)&v36[*(int *)(v38 + 20)] = *(void *)&v37[*(int *)(v38 + 20)];
  uint64_t v39 = v55[8];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &v57[v39];
  v34(&a1[v39], &v57[v39], v33);
  uint64_t v42 = type metadata accessor for MedicalIDWeightFormatter();
  *(void *)&v40[*(int *)(v42 + 20)] = *(void *)&v41[*(int *)(v42 + 20)];
  *(void *)&v40[*(int *)(v42 + 24)] = *(void *)&v41[*(int *)(v42 + 24)];
  uint64_t v43 = a3[5];
  uint64_t v44 = a3[6];
  uint64_t v45 = &a1[v43];
  uint64_t v46 = &v57[v43];
  *((void *)v45 + 2) = *((void *)v46 + 2);
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(void *)&a1[v44] = *(void *)&v57[v44];
  uint64_t v47 = a3[7];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = (uint64_t *)&v57[v47];
  uint64_t v50 = *v49;
  if (*v49)
  {
    uint64_t v51 = v49[1];
    *(void *)uint64_t v48 = v50;
    *((void *)v48 + 1) = v51;
  }
  else
  {
    *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
  }
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&v57[a3[8]];
  return a1;
}

void *sub_255EE27DC(void *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  v104 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v6 = v104[5];
  uint64_t v106 = a2;
  uint64_t v107 = a1;
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = *(void *)&a2[v6 + 8];
  *(void *)uint64_t v7 = *(void *)&a2[v6];
  *((void *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  *((void *)v7 + 2) = *((void *)v8 + 2);
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)v8 + 4);
  *((void *)v7 + 3) = *((void *)v8 + 3);
  *((void *)v7 + 4) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *((void *)v8 + 6);
  *((void *)v7 + 5) = *((void *)v8 + 5);
  *((void *)v7 + 6) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *((void *)v8 + 8);
  *((void *)v7 + 7) = *((void *)v8 + 7);
  *((void *)v7 + 8) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *((void *)v8 + 10);
  *((void *)v7 + 9) = *((void *)v8 + 9);
  *((void *)v7 + 10) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)*((void *)v7 + 12);
  uint64_t v15 = *((void *)v8 + 12);
  *((void *)v7 + 11) = *((void *)v8 + 11);
  *((void *)v7 + 12) = v15;

  uint64_t v16 = (void *)*((void *)v7 + 13);
  *((void *)v7 + 13) = *((void *)v8 + 13);

  uint64_t v17 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v18 = v17[13];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_255EEE100();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
LABEL_6:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v19, v20, v21);
LABEL_7:
  uint64_t v27 = v17[14];
  int v28 = &v7[v27];
  uint64_t v29 = &v8[v27];
  int v30 = v23(&v7[v27], 1, v21);
  int v31 = v23(v29, 1, v21);
  uint64_t v103 = v21;
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v29, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v28, 0, 1, v21);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v28, v21);
LABEL_12:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v28, v29, v21);
LABEL_13:
  uint64_t v33 = v17[15];
  uint64_t v34 = &v7[v33];
  uint64_t v35 = (uint64_t *)&v8[v33];
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  *(void *)uint64_t v34 = v37;
  *((void *)v34 + 1) = v36;
  swift_bridgeObjectRelease();
  uint64_t v38 = v17[16];
  uint64_t v39 = &v7[v38];
  uint64_t v40 = (uint64_t *)&v8[v38];
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  *(void *)uint64_t v39 = v42;
  *((void *)v39 + 1) = v41;
  swift_bridgeObjectRelease();
  v7[v17[17]] = v8[v17[17]];
  v7[v17[18]] = v8[v17[18]];
  uint64_t v43 = v17[19];
  uint64_t v44 = (uint64_t)&v7[v43];
  uint64_t v45 = &v8[v43];
  unint64_t v46 = *(void *)&v7[v43 + 8];
  uint64_t v102 = v22;
  v100 = v23;
  if (v46 >> 60 == 15)
  {
LABEL_16:
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
    goto LABEL_18;
  }
  unint64_t v47 = *((void *)v45 + 1);
  if (v47 >> 60 == 15)
  {
    sub_255D81EF8(v44);
    goto LABEL_16;
  }
  uint64_t v48 = *(void *)v44;
  *(void *)uint64_t v44 = *(void *)v45;
  *(void *)(v44 + 8) = v47;
  sub_255D80D04(v48, v46);
LABEL_18:
  uint64_t v101 = v17;
  uint64_t v49 = v17[20];
  uint64_t v50 = &v7[v49];
  uint64_t v51 = &v8[v49];
  uint64_t v52 = sub_255EEDF60();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
  int v55 = v54(v50, 1, v52);
  int v56 = v54(v51, 1, v52);
  if (v55)
  {
    if (!v56)
    {
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v50, v51, v52);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v56)
  {
    (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v52);
LABEL_23:
    sub_255EE3398(0, &qword_269F350B8, MEMORY[0x270FA8140], MEMORY[0x263F8D8F0]);
    memcpy(v50, v51, *(void *)(*(void *)(v57 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 40))(v50, v51, v52);
LABEL_24:
  uint64_t v58 = v101[21];
  uint64_t v59 = *(void **)&v7[v58];
  *(void *)&v7[v58] = *(void *)&v8[v58];

  uint64_t v60 = v101[22];
  int v61 = &v7[v60];
  int v62 = &v8[v60];
  int v63 = v100(&v7[v60], 1, v103);
  int v64 = v100(v62, 1, v103);
  if (v63)
  {
    uint64_t v65 = v107;
    if (!v64)
    {
      (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v61, v62, v103);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v102 + 56))(v61, 0, 1, v103);
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  uint64_t v65 = v107;
  if (v64)
  {
    (*(void (**)(char *, uint64_t))(v102 + 8))(v61, v103);
LABEL_29:
    sub_255EE3398(0, &qword_269F35058, MEMORY[0x270FA9130], MEMORY[0x263F8D8F0]);
    memcpy(v61, v62, *(void *)(*(void *)(v66 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v102 + 40))(v61, v62, v103);
LABEL_30:
  uint64_t v67 = v104[6];
  uint64_t v68 = (uint64_t)v65 + v67;
  uint64_t v69 = &v106[v67];
  uint64_t v70 = sub_255EEE200();
  uint64_t v71 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v70 - 8) + 40);
  v71(v68, v69, v70);
  uint64_t v72 = v104[7];
  uint64_t v73 = (uint64_t)v65 + v72;
  uint64_t v74 = &v106[v72];
  v71((uint64_t)v65 + v72, &v106[v72], v70);
  uint64_t v75 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  uint64_t v76 = *(void **)(v73 + v75);
  *(void *)(v73 + v75) = *(void *)&v74[v75];

  uint64_t v77 = v104[8];
  uint64_t v78 = (uint64_t)v65 + v77;
  uint64_t v79 = &v106[v77];
  v71((uint64_t)v65 + v77, &v106[v77], v70);
  uint64_t v80 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v81 = *(int *)(v80 + 20);
  uint64_t v82 = *(void **)(v78 + v81);
  *(void *)(v78 + v81) = *(void *)&v79[v81];

  uint64_t v83 = *(int *)(v80 + 24);
  uint64_t v84 = *(void **)(v78 + v83);
  *(void *)(v78 + v83) = *(void *)&v79[v83];

  uint64_t v85 = a3[5];
  uint64_t v86 = (uint64_t)v65 + v85;
  id v87 = &v106[v85];
  *(void *)((char *)v65 + v85) = *(void *)&v106[v85];
  swift_release();
  *(void *)(v86 + 8) = *((void *)v87 + 1);
  swift_release();
  *(void *)(v86 + 16) = *((void *)v87 + 2);
  *(void *)((char *)v65 + a3[6]) = *(void *)&v106[a3[6]];
  swift_release();
  uint64_t v88 = a3[7];
  uint64_t v89 = (void *)((char *)v65 + v88);
  uint64_t v90 = &v106[v88];
  uint64_t v91 = *(void *)((char *)v65 + v88);
  uint64_t v92 = *(void *)&v106[v88];
  if (!v91)
  {
    if (v92)
    {
      uint64_t v94 = *((void *)v90 + 1);
      *uint64_t v89 = v92;
      v89[1] = v94;
      goto LABEL_37;
    }
LABEL_36:
    *(_OWORD *)uint64_t v89 = *(_OWORD *)v90;
    goto LABEL_37;
  }
  if (!v92)
  {
    swift_release();
    goto LABEL_36;
  }
  uint64_t v93 = *((void *)v90 + 1);
  *uint64_t v89 = v92;
  v89[1] = v93;
  swift_release();
LABEL_37:
  uint64_t v95 = a3[8];
  uint64_t v96 = (void *)((char *)v65 + v95);
  uint64_t v97 = &v106[v95];
  uint64_t v98 = *(void **)((char *)v65 + v95);
  *uint64_t v96 = *(void *)v97;

  v96[1] = *((void *)v97 + 1);
  return v65;
}

uint64_t sub_255EE3070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EE3084);
}

uint64_t sub_255EE3084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_255EE3148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EE315C);
}

uint64_t sub_255EE315C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for EditBloodTypeCellView()
{
  uint64_t result = qword_269F38CB0;
  if (!qword_269F38CB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255EE3268()
{
  uint64_t result = type metadata accessor for MedicalIDBiometricsViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_255EE3318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255EE3334(uint64_t a1, uint64_t a2)
{
  sub_255DDE868();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_255EE3398(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_255EE3404(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_255EE346C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_255EE34CC()
{
  return sub_255EE3514(&qword_269F38CC8, (void (*)(uint64_t))sub_255DDE868);
}

uint64_t sub_255EE3514(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_255EE355C(void *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v27 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v6;
    uint64_t v93 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
    uint64_t v7 = v93[5];
    uint64_t v95 = a2;
    uint64_t v96 = a1;
    unint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = &a2[v7];
    uint64_t v10 = *(void *)&a2[v7];
    uint64_t v11 = *((void *)v9 + 1);
    *unint64_t v8 = v10;
    v8[1] = v11;
    uint64_t v12 = *((void *)v9 + 3);
    void v8[2] = *((void *)v9 + 2);
    v8[3] = v12;
    uint64_t v13 = *((void *)v9 + 5);
    v8[4] = *((void *)v9 + 4);
    v8[5] = v13;
    uint64_t v14 = *((void *)v9 + 7);
    v8[6] = *((void *)v9 + 6);
    v8[7] = v14;
    uint64_t v15 = *((void *)v9 + 9);
    v8[8] = *((void *)v9 + 8);
    v8[9] = v15;
    uint64_t v16 = *((void *)v9 + 11);
    v8[10] = *((void *)v9 + 10);
    v8[11] = v16;
    uint64_t v88 = (void *)*((void *)v9 + 12);
    uint64_t v89 = (void *)*((void *)v9 + 13);
    v8[12] = v88;
    v8[13] = v89;
    uint64_t v17 = type metadata accessor for MedicalIDData();
    uint64_t v18 = *(int *)(v17 + 52);
    __dst = (char *)v8 + v18;
    uint64_t v92 = (int *)v17;
    uint64_t v19 = &v9[v18];
    uint64_t v20 = sub_255EEE100();
    uint64_t v90 = *(void *)(v20 - 8);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v22 = v88;
    id v23 = v89;
    uint64_t v97 = v21;
    if (v21(v19, 1, v20))
    {
      sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
      memcpy(__dst, v19, *(void *)(*(void *)(v24 - 8) + 64));
      uint64_t v25 = v90;
    }
    else
    {
      uint64_t v25 = v90;
      (*(void (**)(char *, char *, uint64_t))(v90 + 16))(__dst, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v90 + 56))(__dst, 0, 1, v20);
    }
    uint64_t v28 = v92[14];
    uint64_t v29 = (char *)v8 + v28;
    int v30 = &v9[v28];
    if (v97(&v9[v28], 1, v20))
    {
      sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v29, v30, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v29, 0, 1, v20);
    }
    uint64_t v32 = v92[15];
    uint64_t v33 = (void *)((char *)v8 + v32);
    uint64_t v34 = &v9[v32];
    uint64_t v35 = *((void *)v34 + 1);
    *uint64_t v33 = *(void *)v34;
    v33[1] = v35;
    uint64_t v36 = v92[16];
    uint64_t v37 = (void *)((char *)v8 + v36);
    uint64_t v38 = &v9[v36];
    uint64_t v39 = *((void *)v38 + 1);
    *uint64_t v37 = *(void *)v38;
    v37[1] = v39;
    *((unsigned char *)v8 + v92[17]) = v9[v92[17]];
    *((unsigned char *)v8 + v92[18]) = v9[v92[18]];
    uint64_t v40 = v92[19];
    uint64_t v41 = (char *)v8 + v40;
    uint64_t v42 = (uint64_t *)&v9[v40];
    unint64_t v43 = *(void *)&v9[v40 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v43 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
    }
    else
    {
      uint64_t v44 = *v42;
      sub_255D80890(*v42, v43);
      *(void *)uint64_t v41 = v44;
      *((void *)v41 + 1) = v43;
    }
    uint64_t v45 = v92[20];
    unint64_t v46 = (char *)v8 + v45;
    unint64_t v47 = &v9[v45];
    uint64_t v48 = sub_255EEDF60();
    uint64_t v49 = *(void *)(v48 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48))
    {
      sub_255EE76B8(0, &qword_269F350B8, MEMORY[0x270FA8208], MEMORY[0x263F8D8F0]);
      memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
    uint64_t v51 = v92[21];
    uint64_t v52 = *(void **)&v9[v51];
    *(void *)((char *)v8 + v51) = v52;
    uint64_t v53 = v92[22];
    uint64_t v54 = (char *)v8 + v53;
    int v55 = &v9[v53];
    id v56 = v52;
    uint64_t v27 = v96;
    if (v97(v55, 1, v20))
    {
      sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
      memcpy(v54, v55, *(void *)(*(void *)(v57 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v54, v55, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v54, 0, 1, v20);
    }
    uint64_t v58 = v93[6];
    uint64_t v59 = (char *)v96 + v58;
    uint64_t v60 = &v95[v58];
    uint64_t v61 = sub_255EEE200();
    int v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16);
    v62(v59, v60, v61);
    uint64_t v63 = v93[7];
    int v64 = (char *)v96 + v63;
    uint64_t v65 = &v95[v63];
    v62((char *)v96 + v63, &v95[v63], v61);
    uint64_t v66 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
    uint64_t v67 = *(void **)&v65[v66];
    *(void *)&v64[v66] = v67;
    uint64_t v68 = v93[8];
    uint64_t v69 = (char *)v96 + v68;
    uint64_t v70 = &v95[v68];
    id v71 = v67;
    v62(v69, v70, v61);
    uint64_t v72 = type metadata accessor for MedicalIDWeightFormatter();
    uint64_t v73 = *(int *)(v72 + 20);
    uint64_t v74 = *(void **)&v70[v73];
    *(void *)&v69[v73] = v74;
    uint64_t v75 = *(int *)(v72 + 24);
    uint64_t v76 = *(void **)&v70[v75];
    *(void *)&v69[v75] = v76;
    uint64_t v77 = *(int *)(a3 + 20);
    uint64_t v78 = *(int *)(a3 + 24);
    uint64_t v79 = (void *)((char *)v96 + v77);
    uint64_t v80 = &v95[v77];
    uint64_t v81 = *((void *)v80 + 1);
    *uint64_t v79 = *(void *)v80;
    v79[1] = v81;
    uint64_t v82 = (void *)((char *)v96 + v78);
    uint64_t v83 = &v95[v78];
    sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    id v84 = v74;
    id v85 = v76;
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v86 = sub_255EEE860();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v86 - 8) + 16))(v82, v83, v86);
    }
    else
    {
      *uint64_t v82 = *(void *)v83;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v27;
}

uint64_t sub_255EE3CB0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v26 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v3 = a1 + v26[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v5 = v3 + v4[13];
  uint64_t v6 = sub_255EEE100();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = v3 + v4[14];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)(v3 + v4[19]);
  unint64_t v11 = v10[1];
  if (v11 >> 60 != 15) {
    sub_255D80D04(*v10, v11);
  }
  uint64_t v12 = v3 + v4[20];
  uint64_t v13 = sub_255EEDF60();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }

  uint64_t v15 = v3 + v4[22];
  if (!v8(v15, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v6);
  }
  uint64_t v16 = a1 + v26[6];
  uint64_t v17 = sub_255EEE200();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
  v18(v16, v17);
  uint64_t v19 = a1 + v26[7];
  v18(v19, v17);

  uint64_t v20 = a1 + v26[8];
  v18(v20, v17);
  uint64_t v21 = type metadata accessor for MedicalIDWeightFormatter();

  swift_release();
  uint64_t v22 = a1 + *(int *)(a2 + 24);
  sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_255EEE860();
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8);
    return v24(v22, v23);
  }
  else
  {
    return swift_release();
  }
}

char *sub_255EE40D4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v90 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v6 = v90[5];
  uint64_t v92 = a2;
  uint64_t v93 = a1;
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = *(void *)&a2[v6 + 8];
  *(void *)uint64_t v7 = *(void *)&a2[v6];
  *((void *)v7 + 1) = v9;
  uint64_t v11 = *(void *)&a2[v6 + 16];
  uint64_t v10 = *(void *)&a2[v6 + 24];
  *((void *)v7 + 2) = v11;
  *((void *)v7 + 3) = v10;
  uint64_t v12 = *((void *)v8 + 5);
  *((void *)v7 + 4) = *((void *)v8 + 4);
  *((void *)v7 + 5) = v12;
  uint64_t v13 = *((void *)v8 + 7);
  *((void *)v7 + 6) = *((void *)v8 + 6);
  *((void *)v7 + 7) = v13;
  uint64_t v14 = *((void *)v8 + 9);
  *((void *)v7 + 8) = *((void *)v8 + 8);
  *((void *)v7 + 9) = v14;
  uint64_t v15 = *((void *)v8 + 11);
  *((void *)v7 + 10) = *((void *)v8 + 10);
  *((void *)v7 + 11) = v15;
  id v85 = (void *)*((void *)v8 + 12);
  uint64_t v86 = (void *)*((void *)v8 + 13);
  *((void *)v7 + 12) = v85;
  *((void *)v7 + 13) = v86;
  uint64_t v16 = type metadata accessor for MedicalIDData();
  uint64_t v17 = *(int *)(v16 + 52);
  __dst = &v7[v17];
  uint64_t v89 = (int *)v16;
  id v84 = &v8[v17];
  uint64_t v18 = sub_255EEE100();
  uint64_t v87 = *(void *)(v18 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v20 = v85;
  id v21 = v86;
  uint64_t v94 = v19;
  if (v19(v84, 1, v18))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(__dst, v84, *(void *)(*(void *)(v22 - 8) + 64));
    uint64_t v23 = v87;
  }
  else
  {
    uint64_t v23 = v87;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(__dst, v84, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v87 + 56))(__dst, 0, 1, v18);
  }
  uint64_t v24 = v89[14];
  uint64_t v25 = &v7[v24];
  uint64_t v26 = &v8[v24];
  if (v94(&v8[v24], 1, v18))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v25, v26, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v18);
  }
  uint64_t v28 = v89[15];
  uint64_t v29 = &v7[v28];
  int v30 = &v8[v28];
  uint64_t v31 = *((void *)v30 + 1);
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = v31;
  uint64_t v32 = v89[16];
  uint64_t v33 = &v7[v32];
  uint64_t v34 = &v8[v32];
  uint64_t v35 = *((void *)v34 + 1);
  *(void *)uint64_t v33 = *(void *)v34;
  *((void *)v33 + 1) = v35;
  v7[v89[17]] = v8[v89[17]];
  v7[v89[18]] = v8[v89[18]];
  uint64_t v36 = v89[19];
  uint64_t v37 = &v7[v36];
  uint64_t v38 = (uint64_t *)&v8[v36];
  unint64_t v39 = *(void *)&v8[v36 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v39 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
  }
  else
  {
    uint64_t v40 = *v38;
    sub_255D80890(*v38, v39);
    *(void *)uint64_t v37 = v40;
    *((void *)v37 + 1) = v39;
  }
  uint64_t v41 = v89[20];
  uint64_t v42 = &v7[v41];
  unint64_t v43 = &v8[v41];
  uint64_t v44 = sub_255EEDF60();
  uint64_t v45 = *(void *)(v44 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
  {
    sub_255EE76B8(0, &qword_269F350B8, MEMORY[0x270FA8208], MEMORY[0x263F8D8F0]);
    memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v42, v43, v44);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
  }
  uint64_t v47 = v89[21];
  uint64_t v48 = *(void **)&v8[v47];
  *(void *)&v7[v47] = v48;
  uint64_t v49 = v89[22];
  uint64_t v50 = &v7[v49];
  uint64_t v51 = &v8[v49];
  id v52 = v48;
  if (v94(v51, 1, v18))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v50, v51, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v50, 0, 1, v18);
  }
  uint64_t v54 = v90[6];
  int v55 = &v93[v54];
  id v56 = &v92[v54];
  uint64_t v57 = sub_255EEE200();
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
  v58(v55, v56, v57);
  uint64_t v59 = v90[7];
  uint64_t v60 = &v93[v59];
  uint64_t v61 = &v92[v59];
  v58(&v93[v59], &v92[v59], v57);
  uint64_t v62 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  uint64_t v63 = *(void **)&v61[v62];
  *(void *)&v60[v62] = v63;
  uint64_t v64 = v90[8];
  uint64_t v65 = &v93[v64];
  uint64_t v66 = &v92[v64];
  id v67 = v63;
  v58(v65, v66, v57);
  uint64_t v68 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v69 = *(int *)(v68 + 20);
  uint64_t v70 = *(void **)&v66[v69];
  *(void *)&v65[v69] = v70;
  uint64_t v71 = *(int *)(v68 + 24);
  uint64_t v72 = *(void **)&v66[v71];
  *(void *)&v65[v71] = v72;
  uint64_t v73 = *(int *)(a3 + 20);
  uint64_t v74 = *(int *)(a3 + 24);
  uint64_t v75 = &v93[v73];
  uint64_t v76 = &v92[v73];
  uint64_t v77 = *((void *)v76 + 1);
  *(void *)uint64_t v75 = *(void *)v76;
  *((void *)v75 + 1) = v77;
  uint64_t v78 = &v93[v74];
  uint64_t v79 = &v92[v74];
  sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  id v80 = v70;
  id v81 = v72;
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v82 = sub_255EEE860();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16))(v78, v79, v82);
  }
  else
  {
    *(void *)uint64_t v78 = *(void *)v79;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return v93;
}

char *sub_255EE47D4(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v100 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v5 = v100[5];
  uint64_t v102 = a2;
  uint64_t v103 = a1;
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  *(void *)uint64_t v6 = *(void *)&a2[v5];
  *((void *)v6 + 1) = *(void *)&a2[v5 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 2) = *((void *)v7 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 3) = *((void *)v7 + 3);
  *((void *)v6 + 4) = *((void *)v7 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 5) = *((void *)v7 + 5);
  *((void *)v6 + 6) = *((void *)v7 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 7) = *((void *)v7 + 7);
  *((void *)v6 + 8) = *((void *)v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 9) = *((void *)v7 + 9);
  *((void *)v6 + 10) = *((void *)v7 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v6 + 11) = *((void *)v7 + 11);
  unint64_t v8 = (void *)*((void *)v6 + 12);
  uint64_t v9 = (void *)*((void *)v7 + 12);
  *((void *)v6 + 12) = v9;
  id v10 = v9;

  uint64_t v11 = (void *)*((void *)v6 + 13);
  uint64_t v12 = (void *)*((void *)v7 + 13);
  *((void *)v6 + 13) = v12;
  id v13 = v12;

  uint64_t v14 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v15 = v14[13];
  uint64_t v16 = &v6[v15];
  uint64_t v17 = &v7[v15];
  uint64_t v18 = sub_255EEE100();
  uint64_t v19 = *(void *)(v18 - 8);
  id v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_6:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_7:
  uint64_t v24 = v14[14];
  uint64_t v25 = &v6[v24];
  uint64_t v26 = &v7[v24];
  int v27 = v20(&v6[v24], 1, v18);
  int v28 = v20(v26, 1, v18);
  uint64_t v99 = v18;
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v26, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v18);
LABEL_12:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v25, v26, v18);
LABEL_13:
  uint64_t v30 = v14[15];
  uint64_t v31 = &v6[v30];
  uint64_t v32 = &v7[v30];
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v14[16];
  uint64_t v34 = &v6[v33];
  uint64_t v35 = &v7[v33];
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = *((void *)v35 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v14[17]] = v7[v14[17]];
  v6[v14[18]] = v7[v14[18]];
  uint64_t v36 = v14[19];
  uint64_t v37 = (uint64_t *)&v6[v36];
  uint64_t v38 = (uint64_t *)&v7[v36];
  unint64_t v39 = *(void *)&v7[v36 + 8];
  uint64_t v98 = v19;
  uint64_t v97 = v20;
  if (*(void *)&v6[v36 + 8] >> 60 == 15)
  {
    if (v39 >> 60 != 15)
    {
      uint64_t v40 = *v38;
      sub_255D80890(*v38, v39);
      *uint64_t v37 = v40;
      v37[1] = v39;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v39 >> 60 == 15)
  {
    sub_255D81EF8((uint64_t)v37);
LABEL_18:
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    goto LABEL_20;
  }
  uint64_t v41 = *v38;
  sub_255D80890(*v38, v39);
  uint64_t v42 = *v37;
  unint64_t v43 = v37[1];
  *uint64_t v37 = v41;
  v37[1] = v39;
  sub_255D80D04(v42, v43);
LABEL_20:
  uint64_t v44 = v14[20];
  uint64_t v45 = &v6[v44];
  uint64_t v46 = &v7[v44];
  uint64_t v47 = sub_255EEDF60();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  int v50 = v49(v45, 1, v47);
  int v51 = v49(v46, 1, v47);
  if (v50)
  {
    uint64_t v52 = v98;
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v52 = v98;
  if (v51)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
LABEL_25:
    sub_255EE76B8(0, &qword_269F350B8, MEMORY[0x270FA8208], MEMORY[0x263F8D8F0]);
    memcpy(v45, v46, *(void *)(*(void *)(v53 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v45, v46, v47);
LABEL_26:
  uint64_t v54 = v14[21];
  int v55 = *(void **)&v6[v54];
  id v56 = *(void **)&v7[v54];
  *(void *)&v6[v54] = v56;
  id v57 = v56;

  uint64_t v58 = v14[22];
  uint64_t v59 = &v6[v58];
  uint64_t v60 = &v7[v58];
  int v61 = v97(&v6[v58], 1, v99);
  int v62 = v97(v60, 1, v99);
  if (v61)
  {
    if (!v62)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v59, v60, v99);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v59, 0, 1, v99);
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (v62)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v59, v99);
LABEL_31:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 24))(v59, v60, v99);
LABEL_32:
  uint64_t v64 = v100[6];
  uint64_t v65 = &v103[v64];
  uint64_t v66 = &v102[v64];
  uint64_t v67 = sub_255EEE200();
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 24);
  v68(v65, v66, v67);
  uint64_t v69 = v100[7];
  uint64_t v70 = &v103[v69];
  uint64_t v71 = &v102[v69];
  v68(&v103[v69], &v102[v69], v67);
  uint64_t v72 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  uint64_t v73 = *(void **)&v71[v72];
  uint64_t v74 = *(void **)&v70[v72];
  *(void *)&v70[v72] = v73;
  id v75 = v73;

  uint64_t v76 = v100[8];
  uint64_t v77 = &v103[v76];
  uint64_t v78 = &v102[v76];
  v68(&v103[v76], &v102[v76], v67);
  uint64_t v79 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v80 = *(int *)(v79 + 20);
  id v81 = *(void **)&v78[v80];
  uint64_t v82 = *(void **)&v77[v80];
  *(void *)&v77[v80] = v81;
  id v83 = v81;

  uint64_t v84 = *(int *)(v79 + 24);
  id v85 = *(void **)&v78[v84];
  uint64_t v86 = *(void **)&v77[v84];
  *(void *)&v77[v84] = v85;
  id v87 = v85;

  uint64_t v88 = *(int *)(a3 + 20);
  uint64_t v89 = &v103[v88];
  uint64_t v90 = &v102[v88];
  uint64_t v91 = *((void *)v90 + 1);
  *(void *)uint64_t v89 = *(void *)v90;
  *((void *)v89 + 1) = v91;
  swift_retain();
  swift_release();
  if (v103 != v102)
  {
    uint64_t v92 = *(int *)(a3 + 24);
    uint64_t v93 = &v103[v92];
    uint64_t v94 = &v102[v92];
    sub_255E5076C((uint64_t)&v103[v92]);
    sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v95 = sub_255EEE860();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 16))(v93, v94, v95);
    }
    else
    {
      *(void *)uint64_t v93 = *(void *)v94;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v103;
}

char *sub_255EE515C(char *a1, char *a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v52 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v5 = v52[5];
  uint64_t v54 = a1;
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  *(_OWORD *)uint64_t v6 = *(_OWORD *)&a2[v5];
  *((void *)v6 + 2) = *(void *)&a2[v5 + 16];
  *(_OWORD *)(v6 + 24) = *(_OWORD *)&a2[v5 + 24];
  *(_OWORD *)(v6 + 40) = *(_OWORD *)&a2[v5 + 40];
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&a2[v5 + 56];
  *(_OWORD *)(v6 + 72) = *(_OWORD *)&a2[v5 + 72];
  *((void *)v6 + 11) = *(void *)&a2[v5 + 88];
  *((_OWORD *)v6 + 6) = *(_OWORD *)&a2[v5 + 96];
  unint64_t v8 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v9 = v8[13];
  id v10 = &v6[v9];
  uint64_t v11 = &v7[v9];
  uint64_t v12 = sub_255EEE100();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v16 = v8[14];
  uint64_t v17 = &v6[v16];
  uint64_t v18 = &v7[v16];
  int v50 = v14;
  uint64_t v51 = v13;
  if (v14(&v7[v16], 1, v12))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  *(_OWORD *)&v6[v8[15]] = *(_OWORD *)&v7[v8[15]];
  *(_OWORD *)&v6[v8[16]] = *(_OWORD *)&v7[v8[16]];
  v6[v8[17]] = v7[v8[17]];
  v6[v8[18]] = v7[v8[18]];
  *(_OWORD *)&v6[v8[19]] = *(_OWORD *)&v7[v8[19]];
  uint64_t v20 = v8[20];
  int v21 = &v6[v20];
  int v22 = &v7[v20];
  uint64_t v23 = sub_255EEDF60();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    sub_255EE76B8(0, &qword_269F350B8, MEMORY[0x270FA8208], MEMORY[0x263F8D8F0]);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(void *)&v6[v8[21]] = *(void *)&v7[v8[21]];
  uint64_t v26 = v8[22];
  int v27 = &v6[v26];
  int v28 = &v7[v26];
  if (v50(&v7[v26], 1, v12))
  {
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v27, v28, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v27, 0, 1, v12);
  }
  uint64_t v30 = v52[6];
  uint64_t v31 = &v54[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v33 = sub_255EEE200();
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32);
  v34(v31, v32, v33);
  uint64_t v35 = v52[7];
  uint64_t v36 = &v54[v35];
  uint64_t v37 = &a2[v35];
  v34(&v54[v35], &a2[v35], v33);
  uint64_t v38 = type metadata accessor for MedicalIDHeightFormatter();
  *(void *)&v36[*(int *)(v38 + 20)] = *(void *)&v37[*(int *)(v38 + 20)];
  uint64_t v39 = v52[8];
  uint64_t v40 = &v54[v39];
  uint64_t v41 = &a2[v39];
  v34(&v54[v39], &a2[v39], v33);
  uint64_t v42 = type metadata accessor for MedicalIDWeightFormatter();
  *(void *)&v40[*(int *)(v42 + 20)] = *(void *)&v41[*(int *)(v42 + 20)];
  *(void *)&v40[*(int *)(v42 + 24)] = *(void *)&v41[*(int *)(v42 + 24)];
  uint64_t v43 = *(int *)(a3 + 24);
  *(_OWORD *)&v54[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  uint64_t v44 = &v54[v43];
  uint64_t v45 = &a2[v43];
  sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
  uint64_t v47 = v46;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v48 = sub_255EEE860();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v44, v45, v48);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
  }
  return v54;
}

char *sub_255EE5784(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  uint64_t v95 = (int *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v6 = v95[5];
  uint64_t v97 = a2;
  uint64_t v98 = a1;
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = *(void *)&a2[v6 + 8];
  *(void *)uint64_t v7 = *(void *)&a2[v6];
  *((void *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  *((void *)v7 + 2) = *((void *)v8 + 2);
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)v8 + 4);
  *((void *)v7 + 3) = *((void *)v8 + 3);
  *((void *)v7 + 4) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *((void *)v8 + 6);
  *((void *)v7 + 5) = *((void *)v8 + 5);
  *((void *)v7 + 6) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *((void *)v8 + 8);
  *((void *)v7 + 7) = *((void *)v8 + 7);
  *((void *)v7 + 8) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *((void *)v8 + 10);
  *((void *)v7 + 9) = *((void *)v8 + 9);
  *((void *)v7 + 10) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)*((void *)v7 + 12);
  uint64_t v15 = *((void *)v8 + 12);
  *((void *)v7 + 11) = *((void *)v8 + 11);
  *((void *)v7 + 12) = v15;

  uint64_t v16 = (void *)*((void *)v7 + 13);
  *((void *)v7 + 13) = *((void *)v8 + 13);

  uint64_t v17 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v18 = v17[13];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_255EEE100();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
LABEL_6:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v19, v20, v21);
LABEL_7:
  uint64_t v27 = v17[14];
  int v28 = &v7[v27];
  uint64_t v29 = &v8[v27];
  int v30 = v23(&v7[v27], 1, v21);
  int v31 = v23(v29, 1, v21);
  uint64_t v94 = v21;
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v29, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v28, 0, 1, v21);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v28, v21);
LABEL_12:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v28, v29, v21);
LABEL_13:
  uint64_t v33 = v17[15];
  uint64_t v34 = &v7[v33];
  uint64_t v35 = (uint64_t *)&v8[v33];
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  *(void *)uint64_t v34 = v37;
  *((void *)v34 + 1) = v36;
  swift_bridgeObjectRelease();
  uint64_t v38 = v17[16];
  uint64_t v39 = &v7[v38];
  uint64_t v40 = (uint64_t *)&v8[v38];
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  *(void *)uint64_t v39 = v42;
  *((void *)v39 + 1) = v41;
  swift_bridgeObjectRelease();
  v7[v17[17]] = v8[v17[17]];
  v7[v17[18]] = v8[v17[18]];
  uint64_t v43 = v17[19];
  uint64_t v44 = (uint64_t)&v7[v43];
  uint64_t v45 = &v8[v43];
  unint64_t v46 = *(void *)&v7[v43 + 8];
  uint64_t v93 = v22;
  uint64_t v91 = v23;
  if (v46 >> 60 == 15)
  {
LABEL_16:
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
    goto LABEL_18;
  }
  unint64_t v47 = *((void *)v45 + 1);
  if (v47 >> 60 == 15)
  {
    sub_255D81EF8(v44);
    goto LABEL_16;
  }
  uint64_t v48 = *(void *)v44;
  *(void *)uint64_t v44 = *(void *)v45;
  *(void *)(v44 + 8) = v47;
  sub_255D80D04(v48, v46);
LABEL_18:
  uint64_t v92 = v17;
  uint64_t v49 = v17[20];
  int v50 = &v7[v49];
  uint64_t v51 = &v8[v49];
  uint64_t v52 = sub_255EEDF60();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
  int v55 = v54(v50, 1, v52);
  int v56 = v54(v51, 1, v52);
  if (v55)
  {
    if (!v56)
    {
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v50, v51, v52);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v56)
  {
    (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v52);
LABEL_23:
    sub_255EE76B8(0, &qword_269F350B8, MEMORY[0x270FA8208], MEMORY[0x263F8D8F0]);
    memcpy(v50, v51, *(void *)(*(void *)(v57 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 40))(v50, v51, v52);
LABEL_24:
  uint64_t v58 = v92[21];
  uint64_t v59 = *(void **)&v7[v58];
  *(void *)&v7[v58] = *(void *)&v8[v58];

  uint64_t v60 = v92[22];
  int v61 = &v7[v60];
  int v62 = &v8[v60];
  int v63 = v91(&v7[v60], 1, v94);
  int v64 = v91(v62, 1, v94);
  if (v63)
  {
    if (!v64)
    {
      (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v61, v62, v94);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v93 + 56))(v61, 0, 1, v94);
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v64)
  {
    (*(void (**)(char *, uint64_t))(v93 + 8))(v61, v94);
LABEL_29:
    sub_255EE76B8(0, &qword_269F35058, MEMORY[0x270FA9240], MEMORY[0x263F8D8F0]);
    memcpy(v61, v62, *(void *)(*(void *)(v65 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v93 + 40))(v61, v62, v94);
LABEL_30:
  uint64_t v66 = v95[6];
  uint64_t v67 = &v98[v66];
  uint64_t v68 = &v97[v66];
  uint64_t v69 = sub_255EEE200();
  uint64_t v70 = *(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 40);
  v70(v67, v68, v69);
  uint64_t v71 = v95[7];
  uint64_t v72 = &v98[v71];
  uint64_t v73 = &v97[v71];
  v70(&v98[v71], &v97[v71], v69);
  uint64_t v74 = *(int *)(type metadata accessor for MedicalIDHeightFormatter() + 20);
  id v75 = *(void **)&v72[v74];
  *(void *)&v72[v74] = *(void *)&v73[v74];

  uint64_t v76 = v95[8];
  uint64_t v77 = &v98[v76];
  uint64_t v78 = &v97[v76];
  v70(&v98[v76], &v97[v76], v69);
  uint64_t v79 = type metadata accessor for MedicalIDWeightFormatter();
  uint64_t v80 = *(int *)(v79 + 20);
  id v81 = *(void **)&v77[v80];
  *(void *)&v77[v80] = *(void *)&v78[v80];

  uint64_t v82 = *(int *)(v79 + 24);
  id v83 = *(void **)&v77[v82];
  *(void *)&v77[v82] = *(void *)&v78[v82];

  *(_OWORD *)&v98[*(int *)(a3 + 20)] = *(_OWORD *)&v97[*(int *)(a3 + 20)];
  swift_release();
  if (v98 != v97)
  {
    uint64_t v84 = *(int *)(a3 + 24);
    id v85 = &v98[v84];
    uint64_t v86 = &v97[v84];
    sub_255E5076C((uint64_t)&v98[v84]);
    sub_255EE76B8(0, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    uint64_t v88 = v87;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v89 = sub_255EEE860();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 32))(v85, v86, v89);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v85, v86, *(void *)(*(void *)(v88 - 8) + 64));
    }
  }
  return v98;
}

uint64_t sub_255EE604C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EE6060);
}

uint64_t sub_255EE6060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    sub_255EE76B8(0, &qword_269F36400, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_255EE61BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EE61D0);
}

uint64_t sub_255EE61D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    sub_255EE76B8(0, &qword_269F36400, MEMORY[0x263F18D80], MEMORY[0x263F185D0]);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for MedicalIDBiometricsCell()
{
  uint64_t result = qword_269F38CD0;
  if (!qword_269F38CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_255EE6378()
{
  type metadata accessor for MedicalIDBiometricsViewModel();
  if (v0 <= 0x3F)
  {
    sub_255EE76B8(319, &qword_269F35680, MEMORY[0x263F18D80], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_255EE647C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_255EE6498@<D0>(uint64_t a1@<X8>)
{
  if (qword_269F34B28 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_269F3FDB8;
  uint64_t v19 = qword_269F3FDB0;
  swift_bridgeObjectRetain();
  BOOL v4 = MedicalIDBiometricsViewModel.hasBiometricData.getter();
  uint64_t v6 = *(void *)v1;
  uint64_t v5 = *((void *)v1 + 1);
  uint64_t v7 = (uint64_t *)&v1[*(int *)(type metadata accessor for MedicalIDBiometricsCell() + 20)];
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  uint64_t v10 = qword_269F34B90;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  *(void *)&long long v20 = v19;
  *((void *)&v20 + 1) = v3;
  LOBYTE(v21) = v4;
  BYTE1(v21) = 2;
  *((void *)&v21 + 1) = v9;
  *(void *)&long long v22 = v8;
  *((void *)&v22 + 1) = v6;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = qword_269F37000;
  LOBYTE(v24[0]) = 1;
  sub_255EE667C(v1, (void *)v24 + 1);
  long long v38 = v24[10];
  uint64_t v39 = v25;
  long long v34 = v24[4];
  long long v35 = v24[5];
  long long v36 = v24[6];
  long long v37 = v24[7];
  long long v30 = v24[0];
  long long v31 = v24[1];
  long long v32 = v24[2];
  long long v33 = v24[3];
  long long v26 = v20;
  long long v27 = v21;
  long long v28 = v22;
  long long v29 = v23;
  long long v11 = v24[9];
  *(_OWORD *)(a1 + 192) = v24[8];
  *(_OWORD *)(a1 + 208) = v11;
  *(_OWORD *)(a1 + 224) = v38;
  *(void *)(a1 + 240) = v39;
  long long v12 = v35;
  *(_OWORD *)(a1 + 128) = v34;
  *(_OWORD *)(a1 + 144) = v12;
  long long v13 = v37;
  *(_OWORD *)(a1 + 160) = v36;
  *(_OWORD *)(a1 + 176) = v13;
  long long v14 = v31;
  *(_OWORD *)(a1 + 64) = v30;
  *(_OWORD *)(a1 + 80) = v14;
  long long v15 = v33;
  *(_OWORD *)(a1 + 96) = v32;
  *(_OWORD *)(a1 + 112) = v15;
  long long v16 = v27;
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v16;
  double result = *(double *)&v28;
  long long v18 = v29;
  *(_OWORD *)(a1 + 32) = v28;
  *(_OWORD *)(a1 + 48) = v18;
  return result;
}

uint64_t sub_255EE667C@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v119 = a2;
  uint64_t v3 = sub_255EEE860();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v115 - v8;
  v134 = (uint64_t *)type metadata accessor for MedicalIDBiometricsViewModel();
  uint64_t v10 = &a1[*((int *)v134 + 5)];
  uint64_t v11 = *((void *)v10 + 12);
  long long v12 = (unsigned int *)MEMORY[0x263F18CB8];
  uint64_t v122 = v3;
  uint64_t v123 = v7;
  uint64_t v120 = v4;
  if (!v11)
  {
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    if (*((void *)v10 + 13)) {
      goto LABEL_17;
    }
LABEL_7:
    uint64_t v126 = 0;
    uint64_t v127 = 0;
    uint64_t v17 = 0;
    long long v18 = 0;
    uint64_t v124 = 0;
    v134 = 0;
    if (*((void *)v10 + 11)) {
      goto LABEL_29;
    }
    goto LABEL_8;
  }
  type metadata accessor for MedicalIDBiometricsCell();
  sub_255DAAD40((uint64_t)v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *v12, v3);
  char v13 = sub_255EEE850();
  long long v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  v14(v9, v3);
  long long v15 = v10;
  if (v13)
  {
    if (qword_269F34B30 != -1) {
      swift_once();
    }
    long long v16 = &qword_269F3FDC0;
  }
  else
  {
    if (qword_269F34B38 != -1) {
      swift_once();
    }
    long long v16 = &qword_269F3FDD0;
  }
  uint64_t v25 = v16[1];
  uint64_t v132 = *v16;
  uint64_t v133 = v25;
  swift_bridgeObjectRetain();
  sub_255EC88C8(0, &qword_269F352D8, (unint64_t *)&qword_269F352E0);
  uint64_t v27 = v26;
  long long v21 = *(unint64_t **)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v17 = (char *)&v115 - v28;
  sub_255EC886C(0, &qword_269F352E8, &qword_269F352D8, (unint64_t *)&qword_269F352E0);
  MEMORY[0x270FA5388](v29 - 8);
  long long v18 = (char *)&v115 - v30;
  sub_255DFD46C(*((void **)v15 + 12), (uint64_t)&v115 - v30);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v21[6])(v18, 1, v27) == 1)
  {
    sub_255EC8994((uint64_t)v18, &qword_269F352E8, &qword_269F352D8, (unint64_t *)&qword_269F352E0);
    uint64_t v130 = 0;
    uint64_t v131 = 0;
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v21[4])(v17, v18, v27);
    uint64_t v130 = sub_255DFDD94((uint64_t)v17);
    uint64_t v131 = v31;
    long long v32 = (void (*)(char *, uint64_t))v21[1];
    ++v21;
    v32(v17, v27);
  }
  sub_255EE77D8(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_255EF1E20;
  uint64_t v34 = *((void *)a1 + 1);
  *(void *)(v33 + 32) = *(void *)a1;
  *(void *)(v33 + 40) = v34;
  *(void *)(v33 + 48) = 0x746867696548;
  *(void *)(v33 + 56) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  long long v35 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v36 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (!v36)
  {
    __break(1u);
LABEL_46:
    sub_255EE7528(v132, v133, v130, v131, v128, v129);
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v128 = sub_255EEFD90();
  uint64_t v129 = v37;

  uint64_t v10 = v15;
  uint64_t v3 = v122;
  uint64_t v7 = v123;
  uint64_t v4 = v120;
  long long v12 = (unsigned int *)MEMORY[0x263F18CB8];
  if (!*((void *)v10 + 13)) {
    goto LABEL_7;
  }
LABEL_17:
  type metadata accessor for MedicalIDBiometricsCell();
  sub_255DAAD40((uint64_t)v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *v12, v3);
  char v38 = sub_255EEE850();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v4 + 8);
  v39(v7, v3);
  v39(v9, v3);
  if (v38)
  {
    if (qword_269F34B40 != -1) {
      swift_once();
    }
    uint64_t v40 = &qword_269F3FDE0;
  }
  else
  {
    if (qword_269F34B48 != -1) {
      swift_once();
    }
    uint64_t v40 = &qword_269F3FDF0;
  }
  uint64_t v41 = v40[1];
  uint64_t v126 = *v40;
  uint64_t v127 = v41;
  swift_bridgeObjectRetain();
  uint64_t v125 = a1;
  uint64_t v42 = v10;
  uint64_t v43 = (void *)*((void *)v10 + 13);
  long long v21 = &qword_269F36390;
  sub_255EC88C8(0, (unint64_t *)&qword_269F36388, &qword_269F36390);
  uint64_t v45 = v44;
  v134 = &v115;
  uint64_t v46 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v48 = (char *)&v115 - v47;
  sub_255EC886C(0, &qword_269F36BC8, (unint64_t *)&qword_269F36388, &qword_269F36390);
  MEMORY[0x270FA5388](v49 - 8);
  uint64_t v51 = (char *)&v115 - v50;
  sub_255E447D4(v43, (uint64_t)&v115 - v50);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v51, 1, v45) == 1)
  {
    sub_255EC8994((uint64_t)v51, &qword_269F36BC8, (unint64_t *)&qword_269F36388, &qword_269F36390);
    uint64_t v17 = 0;
    long long v18 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v48, v51, v45);
    type metadata accessor for MedicalIDWeightFormatter();
    sub_255D7ED10(0, &qword_269F36390);
    uint64_t v17 = (char *)sub_255EF0150();
    long long v18 = v52;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v45);
  }
  sub_255EE77D8(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_255EF1E20;
  a1 = v125;
  uint64_t v54 = *((void *)v125 + 1);
  *(void *)(v53 + 32) = *(void *)v125;
  *(void *)(v53 + 40) = v54;
  *(void *)(v53 + 48) = 0x746867696557;
  *(void *)(v53 + 56) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  int v55 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v56 = (id)HKUIJoinStringsForAutomationIdentifier();

  uint64_t v7 = v123;
  if (!v56) {
    goto LABEL_46;
  }
  uint64_t v57 = v42;
  uint64_t v124 = sub_255EEFD90();
  v134 = (uint64_t *)v58;

  uint64_t v3 = v122;
  uint64_t v4 = v120;
  long long v12 = (unsigned int *)MEMORY[0x263F18CB8];
  if (*((void *)v57 + 11))
  {
LABEL_29:
    type metadata accessor for MedicalIDBiometricsCell();
    sub_255DAAD40((uint64_t)v9);
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *v12, v3);
    char v59 = sub_255EEE850();
    uint64_t v60 = *(void (**)(char *, uint64_t))(v4 + 8);
    v60(v7, v3);
    v60(v9, v3);
    if (v59)
    {
      if (qword_269F34B50 != -1) {
        swift_once();
      }
      int v61 = &qword_269F3FE00;
    }
    else
    {
      if (qword_269F34B58 != -1) {
        swift_once();
      }
      int v61 = &qword_269F3FE10;
    }
    uint64_t v19 = *v61;
    uint64_t v20 = v61[1];
    swift_bridgeObjectRetain();
    id v62 = (id)HKStringForBloodType();
    long long v21 = (unint64_t *)sub_255EEFD90();
    uint64_t v22 = v63;

    sub_255EE77D8(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_255EF1E20;
    uint64_t v65 = *((void *)a1 + 1);
    *(void *)(v64 + 32) = *(void *)a1;
    *(void *)(v64 + 40) = v65;
    *(void *)(v64 + 48) = 0x707954646F6F6C42;
    *(void *)(v64 + 56) = 0xE900000000000065;
    swift_bridgeObjectRetain();
    uint64_t v66 = (void *)sub_255EEFE90();
    swift_bridgeObjectRelease();
    id v67 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v67)
    {
      uint64_t v23 = sub_255EEFD90();
      uint64_t v24 = v68;

      goto LABEL_38;
    }
LABEL_47:
    sub_255EE7528(v126, v127, (uint64_t)v17, (uint64_t)v18, v124, (uint64_t)v134);
    sub_255EE7528(v132, v133, v130, v131, v128, v129);
    __break(1u);
    goto LABEL_48;
  }
LABEL_8:
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  long long v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
LABEL_38:
  BOOL v69 = MedicalIDBiometricsViewModel.hasBiometricData.getter();
  uint64_t v120 = v19;
  v121 = v18;
  uint64_t v117 = v23;
  uint64_t v118 = v20;
  uint64_t v122 = v24;
  uint64_t v123 = (char *)v22;
  uint64_t v125 = v17;
  if (v69)
  {
    uint64_t v70 = (uint64_t)v21;
    uint64_t v71 = (uint64_t)v18;
    uint64_t v72 = v17;
    uint64_t v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
LABEL_44:
    uint64_t v115 = v73;
    uint64_t v90 = v132;
    uint64_t v91 = v119;
    *uint64_t v119 = v132;
    uint64_t v92 = v90;
    uint64_t v132 = v90;
    uint64_t v93 = v133;
    v91[1] = v133;
    uint64_t v94 = v93;
    uint64_t v133 = v93;
    uint64_t v95 = v130;
    v91[2] = v130;
    uint64_t v96 = v95;
    uint64_t v130 = v95;
    uint64_t v97 = v131;
    v91[3] = v131;
    uint64_t v98 = v97;
    uint64_t v131 = v97;
    uint64_t v100 = v127;
    uint64_t v99 = v128;
    v91[4] = v128;
    uint64_t v101 = v99;
    uint64_t v127 = v100;
    uint64_t v128 = v99;
    uint64_t v102 = v129;
    uint64_t v103 = v126;
    v91[5] = v129;
    v91[6] = v103;
    uint64_t v126 = v103;
    v91[7] = v100;
    v91[8] = v72;
    uint64_t v104 = v124;
    v91[9] = v71;
    v91[10] = v104;
    uint64_t v105 = v120;
    v91[11] = v134;
    v91[12] = v105;
    uint64_t v106 = v118;
    v91[13] = v118;
    v91[14] = v70;
    uint64_t v116 = v70;
    uint64_t v107 = v122;
    uint64_t v108 = v117;
    v91[15] = v123;
    v91[16] = v108;
    v91[17] = v107;
    v91[18] = v73;
    v91[19] = v74;
    v91[20] = v75;
    v91[21] = v76;
    sub_255EE7578(v92, v94, v96, v98, v101, v102);
    uint64_t v109 = v103;
    uint64_t v110 = v124;
    sub_255EE7578(v109, v100, (uint64_t)v125, v71, v124, (uint64_t)v134);
    uint64_t v111 = v116;
    uint64_t v112 = (uint64_t)v123;
    sub_255EE7578(v105, v106, v116, (uint64_t)v123, v108, v107);
    uint64_t v113 = v115;
    sub_255E06CCC(v115, v74);
    sub_255E06D10(v113, v74);
    sub_255EE7528(v105, v106, v111, v112, v108, v122);
    sub_255EE7528(v126, v127, (uint64_t)v125, (uint64_t)v121, v110, (uint64_t)v134);
    return sub_255EE7528(v132, v133, v130, v131, v128, v129);
  }
  uint64_t v77 = sub_255EEFD40();
  MEMORY[0x270FA5388](v77 - 8);
  sub_255EEFCD0();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v78 = (void *)qword_269F352A8;
  uint64_t v79 = sub_255EEE200();
  MEMORY[0x270FA5388](v79 - 8);
  id v80 = v78;
  sub_255EEE1F0();
  uint64_t v81 = sub_255EEFDA0();
  uint64_t v83 = v82;
  sub_255EE77D8(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v84 = swift_allocObject();
  *(_OWORD *)(v84 + 16) = xmmword_255EF1E20;
  uint64_t v85 = *((void *)a1 + 1);
  *(void *)(v84 + 32) = *(void *)a1;
  *(void *)(v84 + 40) = v85;
  *(void *)(v84 + 48) = 0xD000000000000015;
  *(void *)(v84 + 56) = 0x8000000255EFB9F0;
  swift_bridgeObjectRetain();
  uint64_t v86 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v87 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v87)
  {
    uint64_t v70 = (uint64_t)v21;
    uint64_t v71 = (uint64_t)v121;
    uint64_t v72 = v125;
    uint64_t v88 = sub_255EEFD90();
    uint64_t v76 = v89;

    uint64_t v75 = v88;
    uint64_t v73 = v81;
    uint64_t v74 = v83;
    goto LABEL_44;
  }
LABEL_48:
  sub_255EE7528(v120, v118, (uint64_t)v21, (uint64_t)v123, v117, v122);
  sub_255EE7528(v126, v127, (uint64_t)v125, (uint64_t)v121, v124, (uint64_t)v134);
  uint64_t result = sub_255EE7528(v132, v133, v130, v131, v128, v129);
  __break(1u);
  return result;
}

uint64_t sub_255EE7528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_255EE7578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_255EE75CC()
{
  unint64_t result = qword_269F38CE0;
  if (!qword_269F38CE0)
  {
    sub_255EE7624();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38CE0);
  }
  return result;
}

void sub_255EE7624()
{
  if (!qword_269F38CE8)
  {
    sub_255EE76B8(255, &qword_269F38CF0, (uint64_t (*)(uint64_t))sub_255EE771C, MEMORY[0x263F1BAC8]);
    sub_255EE7824();
    unint64_t v0 = type metadata accessor for MedicalIDCellView();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38CE8);
    }
  }
}

void sub_255EE76B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_255EE771C()
{
  if (!qword_269F38CF8)
  {
    unint64_t v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_255EE77D8(255, &qword_269F38D00, (uint64_t)&type metadata for MedicalIDCellBodyText, MEMORY[0x263F8D8F0]);
    sub_255EE77D8(255, &qword_269F38D08, (uint64_t)&type metadata for MedicalIDCellPlaceholderText, v0);
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v2) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_269F38CF8);
    }
  }
}

void sub_255EE77D8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_255EE7824()
{
  unint64_t result = qword_269F38D10;
  if (!qword_269F38D10)
  {
    sub_255EE76B8(255, &qword_269F38CF0, (uint64_t (*)(uint64_t))sub_255EE771C, MEMORY[0x263F1BAC8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38D10);
  }
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.init(data:calendar:locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = 0x6C616E6F73726550;
  unint64_t v8 = (int *)type metadata accessor for MedicalIDPersonalInfoViewModel();
  uint64_t v9 = v8[8];
  *(void *)(a4 + v9) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A70]), sel_init);
  sub_255D7F1F0();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_255EF1E20;
  *(void *)(v10 + 32) = 0x496C61636964654DLL;
  *(void *)(v10 + 40) = 0xE900000000000044;
  unint64_t v11 = 0xEC0000006F666E49;
  strcpy((char *)(v10 + 48), "PersonalInfo");
  *(unsigned char *)(v10 + 61) = 0;
  *(_WORD *)(v10 + 62) = -5120;
  long long v12 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v13 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v13)
  {
    uint64_t v7 = sub_255EEFD90();
    unint64_t v11 = v14;
  }
  long long v15 = (uint64_t *)(a4 + v8[9]);
  *long long v15 = v7;
  v15[1] = v11;
  sub_255EE9F60(a1, a4, (uint64_t (*)(void))type metadata accessor for MedicalIDData);
  uint64_t v16 = a4 + v8[5];
  uint64_t v17 = sub_255EEE280();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a2, v17);
  uint64_t v19 = a4 + v8[6];
  uint64_t v20 = sub_255EEE200();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, a3, v20);
  id v22 = objc_msgSend(self, sel_calendarWithIdentifier_, *MEMORY[0x263EFF400]);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a3, v20);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
  uint64_t result = sub_255EE9FC8(a1, (uint64_t (*)(void))type metadata accessor for MedicalIDData);
  *(void *)(a4 + v8[7]) = v22;
  return result;
}

uint64_t type metadata accessor for MedicalIDPersonalInfoViewModel()
{
  uint64_t result = qword_269F38D18;
  if (!qword_269F38D18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.imageData()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for MedicalIDData() + 76);
  uint64_t v2 = *(void *)v1;
  sub_255DAD700(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t MedicalIDPersonalInfoViewModel.dateOfBirth()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_255EEDF60();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1 + *(int *)(type metadata accessor for MedicalIDData() + 80);
  unint64_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x270FA8168];
  sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v23 - v10;
  sub_255EE9B20(v7, (uint64_t)&v23 - v10, &qword_269F350B8, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3) == 1)
  {
    sub_255EE9BA0((uint64_t)v11, &qword_269F350B8, MEMORY[0x270FA8168]);
    uint64_t v12 = sub_255EEE100();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v11, v3);
    unint64_t v14 = *(void **)(v1 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
    if (v14)
    {
      long long v15 = (void *)sub_255EEDEA0();
      id v16 = objc_msgSend(v14, sel_dateFromComponents_, v15);

      sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
      MEMORY[0x270FA5388](v17 - 8);
      uint64_t v19 = (char *)&v23 - v18;
      if (v16)
      {
        sub_255EEE0D0();

        uint64_t v20 = sub_255EEE100();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
      }
      else
      {
        uint64_t v22 = sub_255EEE100();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
      }
      sub_255D8BB10((uint64_t)v19, a1);
    }
    else
    {
      uint64_t v21 = sub_255EEE100();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 1, 1, v21);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.isOrganDonationEditingAvailable(with:)(HKHealthStore with)
{
  id v1 = [(objc_class *)with.super.isa profileIdentifier];
  id v2 = objc_msgSend(v1, sel_type);

  return v2 != (id)3;
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.suggestHealthData(with:)(MIUIDisplayConfiguration *with)
{
  if ([(MIUIDisplayConfiguration *)with suggestHealthData]) {
    char v1 = MedicalIDPersonalInfoViewModel.hasPersonalInfoData.getter() ^ 1;
  }
  else {
    char v1 = 0;
  }
  return v1 & 1;
}

void MedicalIDPersonalInfoViewModel.update(medicalIDData:withPictureData:personName:birthDate:primaryLanguageCode:organDonationStatus:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  uint64_t v46 = *a9;
  uint64_t v47 = type metadata accessor for MedicalIDData();
  id v16 = (void *)((char *)a1 + *(int *)(v47 + 76));
  uint64_t v18 = *v16;
  unint64_t v17 = v16[1];
  sub_255DAD700(a2, a3);
  sub_255DAD684(v18, v17);
  *id v16 = a2;
  v16[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a1 = a4;
  a1[1] = a5;
  uint64_t v19 = sub_255EEE100();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t (*)(uint64_t))MEMORY[0x270FA9108];
  sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v44 - v25;
  sub_255EE9B20(a6, (uint64_t)&v44 - v25, &qword_269F35058, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v26, 1, v19) == 1)
  {
    sub_255EE9BA0((uint64_t)v26, &qword_269F35058, MEMORY[0x270FA9108]);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v26, v19);
  uint64_t v27 = *(void **)(v9 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
  if (!v27)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
LABEL_6:
    uint64_t v35 = v47;
    uint64_t v39 = (uint64_t)a1 + *(int *)(v47 + 80);
    sub_255EE9BA0(v39, &qword_269F350B8, MEMORY[0x270FA8168]);
    uint64_t v40 = sub_255EEDF60();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 1, 1, v40);
    uint64_t v41 = (void *)((char *)a1 + *(int *)(v35 + 60));
    uint64_t v42 = v45;
    *uint64_t v41 = v44;
    v41[1] = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v38 = v46;
    switch(v46)
    {
      case 1:
      case 2:
      case 3:
        goto LABEL_7;
      default:
        goto LABEL_8;
    }
    goto LABEL_8;
  }
  sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v44 - v29;
  id v31 = v27;
  long long v32 = (void *)sub_255EEE0A0();
  id v33 = objc_msgSend(v31, sel_hk_dateOfBirthDateComponentsWithDate_, v32);

  sub_255EEDEC0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  uint64_t v34 = sub_255EEDF60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v30, 0, 1, v34);
  uint64_t v35 = v47;
  sub_255EE9C10((uint64_t)v30, (uint64_t)a1 + *(int *)(v47 + 80));
  id v36 = (void *)((char *)a1 + *(int *)(v35 + 60));
  uint64_t v37 = v45;
  *id v36 = v44;
  v36[1] = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v38 = v46;
  switch(v46)
  {
    case 1:
    case 2:
    case 3:
LABEL_7:
      sub_255D7EFC4();
      uint64_t v38 = sub_255EF01C0();
      break;
    default:
      break;
  }
LABEL_8:
  uint64_t v43 = *(int *)(v35 + 84);

  *(void *)((char *)a1 + v43) = v38;
}

uint64_t MedicalIDPersonalInfoViewModel.hasPersonalInfoData.getter()
{
  uint64_t v1 = type metadata accessor for MedicalIDPersonalInfoViewModel();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v30 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  unint64_t v13 = v0[1];
  if (v13)
  {
    if ((v13 & 0x2000000000000000) != 0) {
      uint64_t v14 = HIBYTE(v13) & 0xF;
    }
    else {
      uint64_t v14 = *v0 & 0xFFFFFFFFFFFFLL;
    }
    sub_255EE9F60((uint64_t)v0, (uint64_t)&v30 - v11, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
    if (v14)
    {
      sub_255EE9FC8((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_255EE9F60((uint64_t)v0, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_9:
      sub_255EE9FC8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_255EE9F60((uint64_t)v0, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_10:
      sub_255EE9FC8((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
      sub_255EE9F60((uint64_t)v0, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
LABEL_11:
      sub_255EE9FC8((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
      return 1;
    }
  }
  else
  {
    sub_255EE9F60((uint64_t)v0, (uint64_t)&v30 - v11, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  }
  long long v15 = (int *)type metadata accessor for MedicalIDData();
  id v16 = (uint64_t *)&v12[v15[19]];
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_255DAD700(*v16, v18);
  sub_255EE9FC8((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  sub_255DAD684(v17, v18);
  sub_255EE9F60((uint64_t)v0, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v18 >> 60 != 15) {
    goto LABEL_9;
  }
  uint64_t v20 = (uint64_t)&v10[v15[20]];
  uint64_t v21 = (uint64_t (*)(uint64_t))MEMORY[0x270FA8168];
  sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v30 - v23;
  sub_255EE9B20(v20, (uint64_t)&v30 - v23, &qword_269F350B8, v21);
  sub_255EE9FC8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  uint64_t v25 = sub_255EEDF60();
  int v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v24, 1, v25);
  sub_255EE9BA0((uint64_t)v24, &qword_269F350B8, v21);
  sub_255EE9F60((uint64_t)v0, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v26 != 1) {
    goto LABEL_10;
  }
  uint64_t v27 = *(void *)&v7[v15[15] + 8];
  swift_bridgeObjectRetain();
  sub_255EE9FC8((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  swift_bridgeObjectRelease();
  sub_255EE9F60((uint64_t)v0, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (v27) {
    goto LABEL_11;
  }
  uint64_t v28 = *(void **)&v4[v15[21]];
  id v29 = v28;
  sub_255EE9FC8((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (!v28) {
    return 0;
  }

  return 1;
}

Swift::Bool __swiftcall MedicalIDPersonalInfoViewModel.showProfileImage(with:)(MIUIDisplayConfiguration *with)
{
  uint64_t v3 = type metadata accessor for MedicalIDPersonalInfoViewModel();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(with) = [(MIUIDisplayConfiguration *)with isLockScreen];
  sub_255EE9F60(v1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  if (with)
  {
    uint64_t v6 = (uint64_t *)&v5[*(int *)(type metadata accessor for MedicalIDData() + 76)];
    uint64_t v7 = *v6;
    unint64_t v8 = v6[1];
    sub_255DAD700(*v6, v8);
    sub_255EE9FC8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
    if (v8 >> 60 == 15) {
      return 0;
    }
    sub_255DAD684(v7, v8);
  }
  else
  {
    sub_255EE9FC8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MedicalIDPersonalInfoViewModel);
  }
  return 1;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.nameDescription()()
{
  unint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    uint64_t v3 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0) {
      uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v2 = 0;
      unint64_t v1 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = (void *)v1;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.localizedAgeDescription()()
{
  uint64_t v1 = sub_255EEE100();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v66 = v1;
  uint64_t v67 = v2;
  MEMORY[0x270FA5388](v1);
  uint64_t v62 = v3;
  uint64_t v64 = (char *)v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
  uint64_t v63 = *(void *)(*(void *)(v5 - 8) + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v59 - v6;
  uint64_t v8 = sub_255EEDF60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v61 = v10;
  uint64_t v11 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(int *)(type metadata accessor for MedicalIDData() + 80);
  uint64_t v65 = v0;
  uint64_t v13 = v0 + v12;
  uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x270FA8168];
  sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], v4);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v59 - v16;
  sub_255EE9B20(v13, (uint64_t)v59 - v16, &qword_269F350B8, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8) == 1)
  {
    sub_255EE9BA0((uint64_t)v17, &qword_269F350B8, MEMORY[0x270FA8168]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56))(v7, 1, 1, v66);
    uint64_t v18 = (uint64_t)v7;
LABEL_10:
    sub_255EE9BA0(v18, &qword_269F35058, MEMORY[0x270FA9108]);
LABEL_11:
    uint64_t v30 = 0;
    id v31 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = (uint64_t)v7;
  uint64_t v19 = v67;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v17, v8);
  uint64_t v20 = *(void **)(v65 + *(int *)(type metadata accessor for MedicalIDPersonalInfoViewModel() + 28));
  uint64_t v21 = v11;
  if (v20)
  {
    uint64_t v60 = v11;
    uint64_t v22 = (void *)sub_255EEDEA0();
    id v23 = objc_msgSend(v20, sel_dateFromComponents_, v22);

    MEMORY[0x270FA5388](v24);
    int v26 = (char *)v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v23)
    {
      sub_255EEE0D0();

      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 1;
    }
    uint64_t v28 = v66;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v26, v27, 1, v66);
    sub_255D8BB10((uint64_t)v26, v18);
    uint64_t v21 = v60;
  }
  else
  {
    uint64_t v28 = v66;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v18, 1, 1, v66);
  }
  id v29 = *(void (**)(char *, uint64_t))(v9 + 8);
  v29(v21, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v18, 1, v28) == 1) {
    goto LABEL_10;
  }
  uint64_t v60 = (char *)(v9 + 8);
  uint64_t v63 = v8;
  uint64_t v34 = v64;
  uint64_t v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 32))(v64, v18, v28);
  v59[1] = v59;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)v59 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v34;
  sub_255EEA028(0, &qword_269F37968, MEMORY[0x270FA98C8], MEMORY[0x263F8E0F8]);
  uint64_t v39 = v28;
  uint64_t v40 = sub_255EEE270();
  uint64_t v41 = *(void *)(v40 - 8);
  unint64_t v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_255EF20B0;
  (*(void (**)(unint64_t, void, uint64_t))(v41 + 104))(v43 + v42, *MEMORY[0x263F07898], v40);
  sub_255EEA08C(v43);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v44 = swift_deallocClassInstance();
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = (char *)v59 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EEE0F0();
  sub_255EEE240();
  swift_bridgeObjectRelease();
  uint64_t v47 = *(void (**)(char *, uint64_t))(v19 + 8);
  v47(v46, v39);
  uint64_t v48 = sub_255EEDF00();
  uint64_t v49 = v19 + 8;
  if (v50)
  {
    v29(v37, v63);
    v47(v38, v39);
    goto LABEL_11;
  }
  uint64_t v51 = v48;
  uint64_t v67 = v49;
  uint64_t v52 = sub_255EEFD20();
  MEMORY[0x270FA5388](v52 - 8);
  sub_255EEFD10();
  sub_255EEFD00();
  uint64_t v68 = v51;
  sub_255EEFCE0();
  sub_255EEFD00();
  uint64_t v53 = sub_255EEFD40();
  MEMORY[0x270FA5388](v53 - 8);
  sub_255EEFD30();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v54 = (void *)qword_269F352A8;
  uint64_t v55 = sub_255EEE200();
  MEMORY[0x270FA5388](v55 - 8);
  id v56 = v54;
  sub_255EEE1F0();
  uint64_t v30 = sub_255EEFDA0();
  id v31 = v57;
  v29(v37, v63);
  v47(v64, v66);
LABEL_12:
  uint64_t v32 = v30;
  id v33 = v31;
  result.value._object = v33;
  result.value._countAndFlagsBits = v32;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.spokenLanguageDescription()()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MedicalIDData() + 60));
  uint64_t v2 = *v1;
  if (v1[1])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = MedicalIDSpokenLanguage.languageInCurrentLocale.getter();
    uint64_t v5 = v4;
    MedicalIDSpokenLanguage.languageInCurrentLocale.getter();
    MedicalIDSpokenLanguage.languageInLanguageLocale.getter();
    sub_255DAD520();
    char v6 = sub_255EF0250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v3;
    }
    else
    {
      MedicalIDSpokenLanguage.languageInLanguageLocale.getter();
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_255EEFD20();
      MEMORY[0x270FA5388](v7 - 8);
      sub_255EEFD10();
      sub_255EEFD00();
      sub_255EEFCF0();
      swift_bridgeObjectRelease();
      sub_255EEFD00();
      sub_255EEFCF0();
      swift_bridgeObjectRelease();
      sub_255EEFD00();
      uint64_t v8 = sub_255EEFD40();
      MEMORY[0x270FA5388](v8 - 8);
      sub_255EEFD30();
      if (qword_269F349A0 != -1) {
        swift_once();
      }
      uint64_t v9 = (void *)qword_269F352A8;
      uint64_t v10 = sub_255EEE200();
      MEMORY[0x270FA5388](v10 - 8);
      id v11 = v9;
      sub_255EEE1F0();
      uint64_t v2 = sub_255EEFDA0();
      uint64_t v5 = v12;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v13 = v2;
  uint64_t v14 = v5;
  result.value._object = v14;
  result.value._countAndFlagsBits = v13;
  return result;
}

Swift::String_optional __swiftcall MedicalIDPersonalInfoViewModel.localizedOrganDonationDescription()()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for MedicalIDData() + 84));
  if (!v1) {
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v1, sel_integerValue) > 2)
  {
    uint64_t v1 = 0;
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = sub_255EEFD40();
  MEMORY[0x270FA5388](v2 - 8);
  sub_255EEFCD0();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_269F352A8;
  uint64_t v4 = sub_255EEE200();
  MEMORY[0x270FA5388](v4 - 8);
  id v5 = v3;
  sub_255EEE1F0();
  uint64_t v1 = (void *)sub_255EEFDA0();
LABEL_8:
  result.value._object = v6;
  result.value._countAndFlagsBits = (uint64_t)v1;
  return result;
}

uint64_t MedicalIDPersonalInfoViewModel.defaultDateOfBirth()@<X0>(char *a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_255EEE100();
  uint64_t v20 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v1);
  unint64_t v19 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = (char *)&v18 - v19;
  sub_255EEE0F0();
  sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  MEMORY[0x270FA5388](v4 - 8);
  type metadata accessor for MedicalIDPersonalInfoViewModel();
  uint64_t v6 = sub_255EEE270();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F07898], v6);
  sub_255EEE260();
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  MEMORY[0x270FA5388](v10);
  id v11 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_255D8BB10((uint64_t)v11, (uint64_t)v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = (char *)&v18 - v19;
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  uint64_t v15 = v3;
  uint64_t v16 = v20;
  v14((char *)&v18 - v19, v15, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v1) == 1)
  {
    v14(v21, v13, v1);
    return sub_255EE9BA0((uint64_t)v11, &qword_269F35058, MEMORY[0x270FA9108]);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v1);
    return ((uint64_t (*)(char *, char *, uint64_t))v14)(v21, v11, v1);
  }
}

uint64_t MedicalIDPersonalInfoViewModel.medicalIDData.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_255EE9F60(v1, a1, (uint64_t (*)(void))type metadata accessor for MedicalIDData);
}

uint64_t sub_255EE9B20(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_255EEA028(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_255EE9BA0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_255EEA028(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_255EE9C10(uint64_t a1, uint64_t a2)
{
  sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t _s11MedicalIDUI0A23IDPersonalInfoViewModelV33localizedOrganDonationPickerValue3forSSAA0hI6StatusO_tFZ_0(unsigned char *a1)
{
  switch(*a1)
  {
    case 3:
      objc_msgSend(self, sel_hasStoredRegistrant);
      uint64_t v2 = sub_255EEFD40();
      MEMORY[0x270FA5388](v2 - 8);
      break;
    default:
      uint64_t v1 = sub_255EEFD40();
      MEMORY[0x270FA5388](v1 - 8);
      break;
  }
  sub_255EEFCD0();
  if (qword_269F349A0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_269F352A8;
  uint64_t v4 = sub_255EEE200();
  MEMORY[0x270FA5388](v4 - 8);
  id v5 = v3;
  sub_255EEE1F0();
  return sub_255EEFDA0();
}

uint64_t sub_255EE9F60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_255EE9FC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_255EEA028(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_255EEA08C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_255EECBB8();
    uint64_t v3 = sub_255EF02A0();
    uint64_t v36 = v3 + 56;
    uint64_t result = sub_255EEE270();
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(result - 8);
    unint64_t v8 = *(void (**)(char *))(v7 + 16);
    uint64_t v34 = v7 + 16;
    uint64_t v35 = v8;
    uint64_t v29 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = v3;
    uint64_t v37 = *(void *)(v7 + 72);
    uint64_t v33 = *(void *)(v7 + 64);
    uint64_t v10 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v27 = v1;
    uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32);
    while (1)
    {
      MEMORY[0x270FA5388](result);
      unint64_t v32 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v12 = (char *)&v26 - v32;
      v35((char *)&v26 - v32);
      sub_255EECC2C(&qword_269F38D30);
      uint64_t v13 = sub_255EEFC70();
      uint64_t v14 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v15 = v13 & v14;
      unint64_t v16 = (v13 & (unint64_t)v14) >> 6;
      uint64_t v17 = *(void *)(v36 + 8 * v16);
      uint64_t v18 = 1 << (v13 & v14);
      if ((v18 & v17) != 0)
      {
        uint64_t v30 = &v26;
        uint64_t v31 = v6;
        do
        {
          MEMORY[0x270FA5388](v13);
          unint64_t v19 = (char *)&v26 - v32;
          uint64_t v20 = v9;
          ((void (*)(char *, unint64_t, uint64_t))v35)((char *)&v26 - v32, *(void *)(v9 + 48) + v15 * v37, v5);
          sub_255EECC2C(&qword_269F38D38);
          char v21 = sub_255EEFCC0();
          uint64_t v22 = *v10;
          uint64_t v13 = (*v10)(v19, v5);
          if (v21)
          {
            uint64_t result = v22(v12, v5);
            uint64_t v1 = v27;
            uint64_t v9 = v20;
            uint64_t v6 = v31;
            goto LABEL_4;
          }
          unint64_t v15 = (v15 + 1) & v14;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)(v36 + 8 * (v15 >> 6));
          uint64_t v18 = 1 << v15;
          uint64_t v9 = v20;
        }
        while ((v17 & (1 << v15)) != 0);
        uint64_t v1 = v27;
        uint64_t v6 = v31;
      }
      *(void *)(v36 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v9 + 48) + v15 * v37, v12, v5);
      uint64_t v23 = *(void *)(v9 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        break;
      }
      *(void *)(v9 + 16) = v25;
LABEL_4:
      if (++v6 == v1) {
        return v9;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE88];
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for MedicalIDPersonalInfoViewModel(void *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v6;
    uint64_t v7 = *((void *)a2 + 3);
    a1[2] = *((void *)a2 + 2);
    a1[3] = v7;
    uint64_t v8 = *((void *)a2 + 5);
    a1[4] = *((void *)a2 + 4);
    a1[5] = v8;
    uint64_t v9 = *((void *)a2 + 7);
    a1[6] = *((void *)a2 + 6);
    a1[7] = v9;
    uint64_t v10 = *((void *)a2 + 9);
    a1[8] = *((void *)a2 + 8);
    a1[9] = v10;
    uint64_t v11 = *((void *)a2 + 11);
    a1[10] = *((void *)a2 + 10);
    a1[11] = v11;
    BOOL v69 = (void *)*((void *)a2 + 12);
    uint64_t v70 = (void *)*((void *)a2 + 13);
    a1[12] = v69;
    a1[13] = v70;
    uint64_t v74 = (int *)type metadata accessor for MedicalIDData();
    uint64_t v12 = v74[13];
    __dst = (char *)v4 + v12;
    uint64_t v13 = &a2[v12];
    uint64_t v14 = sub_255EEE100();
    uint64_t v73 = *(void *)(v14 - 8);
    unint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v16 = v69;
    id v17 = v70;
    if (v15(v13, 1, v14))
    {
      sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
      memcpy(__dst, v13, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(__dst, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(__dst, 0, 1, v14);
    }
    uint64_t v20 = v74[14];
    char v21 = (char *)v4 + v20;
    uint64_t v22 = &a2[v20];
    if (v15(&a2[v20], 1, v14))
    {
      sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v21, v22, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v21, 0, 1, v14);
    }
    uint64_t v24 = v74[15];
    uint64_t v25 = (void *)((char *)v4 + v24);
    uint64_t v26 = &a2[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *uint64_t v25 = *(void *)v26;
    v25[1] = v27;
    uint64_t v28 = v74[16];
    uint64_t v29 = (void *)((char *)v4 + v28);
    uint64_t v30 = &a2[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *uint64_t v29 = *(void *)v30;
    v29[1] = v31;
    *((unsigned char *)v4 + v74[17]) = a2[v74[17]];
    *((unsigned char *)v4 + v74[18]) = a2[v74[18]];
    uint64_t v32 = v74[19];
    uint64_t v33 = (char *)v4 + v32;
    uint64_t v34 = (uint64_t *)&a2[v32];
    unint64_t v35 = *(void *)&a2[v32 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v35 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
    }
    else
    {
      uint64_t v36 = *v34;
      sub_255D80890(*v34, v35);
      *(void *)uint64_t v33 = v36;
      *((void *)v33 + 1) = v35;
    }
    uint64_t v37 = v74[20];
    uint64_t v38 = (char *)v4 + v37;
    uint64_t v39 = &a2[v37];
    uint64_t v40 = sub_255EEDF60();
    uint64_t v41 = *(void *)(v40 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
    {
      sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
      memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
    }
    uint64_t v43 = v74[21];
    uint64_t v44 = *(void **)&a2[v43];
    *(void *)((char *)v4 + v43) = v44;
    uint64_t v45 = v74[22];
    uint64_t v46 = (char *)v4 + v45;
    uint64_t v47 = &a2[v45];
    id v48 = v44;
    if (v15(v47, 1, v14))
    {
      sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
      memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v46, v47, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v46, 0, 1, v14);
    }
    uint64_t v50 = a3[5];
    uint64_t v51 = (char *)v4 + v50;
    uint64_t v52 = &a2[v50];
    uint64_t v53 = sub_255EEE280();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(v51, v52, v53);
    uint64_t v54 = a3[6];
    uint64_t v55 = (char *)v4 + v54;
    id v56 = &a2[v54];
    uint64_t v57 = sub_255EEE200();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
    uint64_t v58 = a3[7];
    uint64_t v59 = a3[8];
    uint64_t v60 = *(void **)&a2[v58];
    *(void *)((char *)v4 + v58) = v60;
    uint64_t v61 = *(void **)&a2[v59];
    *(void *)((char *)v4 + v59) = v61;
    uint64_t v62 = a3[9];
    uint64_t v63 = (void *)((char *)v4 + v62);
    uint64_t v64 = &a2[v62];
    uint64_t v65 = *((void *)v64 + 1);
    *uint64_t v63 = *(void *)v64;
    v63[1] = v65;
    id v66 = v60;
    id v67 = v61;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MedicalIDPersonalInfoViewModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v5 = a1 + v4[13];
  uint64_t v6 = sub_255EEE100();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = a1 + v4[14];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)(a1 + v4[19]);
  unint64_t v11 = v10[1];
  if (v11 >> 60 != 15) {
    sub_255D80D04(*v10, v11);
  }
  uint64_t v12 = a1 + v4[20];
  uint64_t v13 = sub_255EEDF60();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }

  uint64_t v15 = a1 + v4[22];
  if (!v8(v15, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v6);
  }
  uint64_t v16 = a1 + a2[5];
  uint64_t v17 = sub_255EEE280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  uint64_t v18 = a1 + a2[6];
  uint64_t v19 = sub_255EEE200();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MedicalIDPersonalInfoViewModel(void *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *((void *)a2 + 3);
  a1[2] = *((void *)a2 + 2);
  a1[3] = v6;
  uint64_t v7 = *((void *)a2 + 5);
  a1[4] = *((void *)a2 + 4);
  a1[5] = v7;
  uint64_t v8 = *((void *)a2 + 7);
  a1[6] = *((void *)a2 + 6);
  a1[7] = v8;
  uint64_t v9 = *((void *)a2 + 9);
  a1[8] = *((void *)a2 + 8);
  a1[9] = v9;
  uint64_t v10 = *((void *)a2 + 11);
  a1[10] = *((void *)a2 + 10);
  a1[11] = v10;
  id v67 = (void *)*((void *)a2 + 12);
  uint64_t v68 = (void *)*((void *)a2 + 13);
  a1[12] = v67;
  a1[13] = v68;
  uint64_t v72 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v11 = v72[13];
  __dst = (char *)a1 + v11;
  uint64_t v12 = &a2[v11];
  uint64_t v13 = sub_255EEE100();
  uint64_t v71 = *(void *)(v13 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v67;
  id v16 = v68;
  if (v14(v12, 1, v13))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(__dst, v12, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(__dst, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(__dst, 0, 1, v13);
  }
  uint64_t v18 = v72[14];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = &a2[v18];
  if (v14(&a2[v18], 1, v13))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v19, v20, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v19, 0, 1, v13);
  }
  uint64_t v22 = v72[15];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = &a2[v22];
  uint64_t v25 = *((void *)v24 + 1);
  *uint64_t v23 = *(void *)v24;
  v23[1] = v25;
  uint64_t v26 = v72[16];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = &a2[v26];
  uint64_t v29 = *((void *)v28 + 1);
  *uint64_t v27 = *(void *)v28;
  v27[1] = v29;
  *((unsigned char *)a1 + v72[17]) = a2[v72[17]];
  *((unsigned char *)a1 + v72[18]) = a2[v72[18]];
  uint64_t v30 = v72[19];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (uint64_t *)&a2[v30];
  unint64_t v33 = *(void *)&a2[v30 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v33 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  }
  else
  {
    uint64_t v34 = *v32;
    sub_255D80890(*v32, v33);
    *(void *)uint64_t v31 = v34;
    *((void *)v31 + 1) = v33;
  }
  uint64_t v35 = v72[20];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = &a2[v35];
  uint64_t v38 = sub_255EEDF60();
  uint64_t v39 = *(void *)(v38 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
  {
    sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
  }
  uint64_t v41 = v72[21];
  uint64_t v42 = *(void **)&a2[v41];
  *(void *)((char *)a1 + v41) = v42;
  uint64_t v43 = v72[22];
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = &a2[v43];
  id v46 = v42;
  if (v14(v45, 1, v13))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v44, v45, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v44, 0, 1, v13);
  }
  uint64_t v48 = a3[5];
  uint64_t v49 = (char *)a1 + v48;
  uint64_t v50 = &a2[v48];
  uint64_t v51 = sub_255EEE280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
  uint64_t v52 = a3[6];
  uint64_t v53 = (char *)a1 + v52;
  uint64_t v54 = &a2[v52];
  uint64_t v55 = sub_255EEE200();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
  uint64_t v56 = a3[7];
  uint64_t v57 = a3[8];
  uint64_t v58 = *(void **)&a2[v56];
  *(void *)((char *)a1 + v56) = v58;
  uint64_t v59 = *(void **)&a2[v57];
  *(void *)((char *)a1 + v57) = v59;
  uint64_t v60 = a3[9];
  uint64_t v61 = (void *)((char *)a1 + v60);
  uint64_t v62 = &a2[v60];
  uint64_t v63 = *((void *)v62 + 1);
  *uint64_t v61 = *(void *)v62;
  v61[1] = v63;
  id v64 = v58;
  id v65 = v59;
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MedicalIDPersonalInfoViewModel(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 3) = a2[3];
  *((void *)a1 + 4) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 5) = a2[5];
  *((void *)a1 + 6) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 7) = a2[7];
  *((void *)a1 + 8) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 9) = a2[9];
  *((void *)a1 + 10) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 11) = a2[11];
  uint64_t v5 = (void *)*((void *)a1 + 12);
  uint64_t v6 = (void *)a2[12];
  *((void *)a1 + 12) = v6;
  id v7 = v6;

  uint64_t v8 = (void *)*((void *)a1 + 13);
  uint64_t v9 = (void *)a2[13];
  *((void *)a1 + 13) = v9;
  id v10 = v9;

  uint64_t v11 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v12 = v11[13];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_255EEE100();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = v11[14];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v17(&a1[v21], 1, v15);
  int v25 = v17(v23, 1, v15);
  uint64_t v82 = v15;
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v22, v23, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v22, v23, v15);
LABEL_13:
  uint64_t v27 = v11[15];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = (void *)((char *)a2 + v27);
  *(void *)uint64_t v28 = *v29;
  *((void *)v28 + 1) = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = v11[16];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = (void *)((char *)a2 + v30);
  *(void *)uint64_t v31 = *v32;
  *((void *)v31 + 1) = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v11[17]] = *((unsigned char *)a2 + v11[17]);
  a1[v11[18]] = *((unsigned char *)a2 + v11[18]);
  uint64_t v33 = v11[19];
  uint64_t v34 = (uint64_t *)&a1[v33];
  uint64_t v35 = (void *)((char *)a2 + v33);
  unint64_t v36 = *(void *)((char *)a2 + v33 + 8);
  uint64_t v81 = v17;
  if (*(void *)&a1[v33 + 8] >> 60 == 15)
  {
    if (v36 >> 60 != 15)
    {
      uint64_t v37 = *v35;
      sub_255D80890(*v35, v36);
      *uint64_t v34 = v37;
      v34[1] = v36;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v36 >> 60 == 15)
  {
    sub_255D81EF8((uint64_t)v34);
LABEL_18:
    *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    goto LABEL_20;
  }
  uint64_t v38 = *v35;
  sub_255D80890(*v35, v36);
  uint64_t v39 = *v34;
  unint64_t v40 = v34[1];
  *uint64_t v34 = v38;
  v34[1] = v36;
  sub_255D80D04(v39, v40);
LABEL_20:
  uint64_t v41 = v11[20];
  uint64_t v42 = &a1[v41];
  uint64_t v43 = (char *)a2 + v41;
  uint64_t v44 = sub_255EEDF60();
  uint64_t v45 = *(void *)(v44 - 8);
  id v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
  int v47 = v46(v42, 1, v44);
  int v48 = v46(v43, 1, v44);
  if (v47)
  {
    uint64_t v49 = v81;
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v42, v43, v44);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v49 = v81;
  if (v48)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v44);
LABEL_25:
    sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
    memcpy(v42, v43, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v42, v43, v44);
LABEL_26:
  uint64_t v51 = v11[21];
  uint64_t v52 = *(void **)&a1[v51];
  uint64_t v53 = *(void **)((char *)a2 + v51);
  *(void *)&a1[v51] = v53;
  id v54 = v53;

  uint64_t v55 = v11[22];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = (char *)a2 + v55;
  int v58 = v49(&a1[v55], 1, v82);
  int v59 = v49(v57, 1, v82);
  if (!v58)
  {
    if (!v59)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v56, v57, v82);
      goto LABEL_32;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v56, v82);
    goto LABEL_31;
  }
  if (v59)
  {
LABEL_31:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v56, v57, *(void *)(*(void *)(v60 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v56, v57, v82);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v56, 0, 1, v82);
LABEL_32:
  uint64_t v61 = a3[5];
  uint64_t v62 = &a1[v61];
  uint64_t v63 = (char *)a2 + v61;
  uint64_t v64 = sub_255EEE280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 24))(v62, v63, v64);
  uint64_t v65 = a3[6];
  id v66 = &a1[v65];
  id v67 = (char *)a2 + v65;
  uint64_t v68 = sub_255EEE200();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 24))(v66, v67, v68);
  uint64_t v69 = a3[7];
  uint64_t v70 = *(void **)&a1[v69];
  uint64_t v71 = *(void **)((char *)a2 + v69);
  *(void *)&a1[v69] = v71;
  id v72 = v71;

  uint64_t v73 = a3[8];
  uint64_t v74 = *(void **)((char *)a2 + v73);
  uint64_t v75 = *(void **)&a1[v73];
  *(void *)&a1[v73] = v74;
  id v76 = v74;

  uint64_t v77 = a3[9];
  uint64_t v78 = &a1[v77];
  uint64_t v79 = (void *)((char *)a2 + v77);
  *(void *)uint64_t v78 = *v79;
  *((void *)v78 + 1) = v79[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MedicalIDPersonalInfoViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v5 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v6 = v5[13];
  id v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_255EEE100();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = v5[14];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v37 = v11;
  if (v11((const void *)(a2 + v13), 1, v9))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[15]) = *(_OWORD *)(a2 + v5[15]);
  *(_OWORD *)(a1 + v5[16]) = *(_OWORD *)(a2 + v5[16]);
  *(unsigned char *)(a1 + v5[17]) = *(unsigned char *)(a2 + v5[17]);
  *(unsigned char *)(a1 + v5[18]) = *(unsigned char *)(a2 + v5[18]);
  *(_OWORD *)(a1 + v5[19]) = *(_OWORD *)(a2 + v5[19]);
  uint64_t v17 = v5[20];
  int v18 = (void *)(a1 + v17);
  int v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_255EEDF60();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(void *)(a1 + v5[21]) = *(void *)(a2 + v5[21]);
  uint64_t v23 = v5[22];
  int v24 = (void *)(a1 + v23);
  int v25 = (const void *)(a2 + v23);
  if (v37((const void *)(a2 + v23), 1, v9))
  {
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v24, v25, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v24, 0, 1, v9);
  }
  uint64_t v27 = a3[5];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_255EEE280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  uint64_t v31 = a3[6];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = sub_255EEE200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  uint64_t v35 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v35) = *(void *)(a2 + v35);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

char *assignWithTake for MedicalIDPersonalInfoViewModel(char *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[4];
  *((void *)a1 + 3) = a2[3];
  *((void *)a1 + 4) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[6];
  *((void *)a1 + 5) = a2[5];
  *((void *)a1 + 6) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[8];
  *((void *)a1 + 7) = a2[7];
  *((void *)a1 + 8) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[10];
  *((void *)a1 + 9) = a2[9];
  *((void *)a1 + 10) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)*((void *)a1 + 12);
  uint64_t v11 = a2[12];
  *((void *)a1 + 11) = a2[11];
  *((void *)a1 + 12) = v11;

  uint64_t v12 = (void *)*((void *)a1 + 13);
  *((void *)a1 + 13) = a2[13];

  uint64_t v13 = (int *)type metadata accessor for MedicalIDData();
  uint64_t v14 = v13[13];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_255EEE100();
  uint64_t v18 = *(void *)(v17 - 8);
  int v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  uint64_t v23 = v13[14];
  int v24 = &a1[v23];
  int v25 = (char *)a2 + v23;
  int v26 = v19(&a1[v23], 1, v17);
  int v27 = v19(v25, 1, v17);
  uint64_t v82 = v17;
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v25, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
LABEL_12:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v24, v25, v17);
LABEL_13:
  uint64_t v29 = v13[15];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = (void *)((char *)a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *(void *)uint64_t v30 = v33;
  *((void *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = v13[16];
  uint64_t v35 = &a1[v34];
  unint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *(void *)uint64_t v35 = v38;
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  a1[v13[17]] = *((unsigned char *)a2 + v13[17]);
  a1[v13[18]] = *((unsigned char *)a2 + v13[18]);
  uint64_t v39 = v13[19];
  uint64_t v40 = (uint64_t)&a1[v39];
  uint64_t v41 = (char *)a2 + v39;
  unint64_t v42 = *(void *)&a1[v39 + 8];
  uint64_t v84 = v13;
  if (v42 >> 60 == 15)
  {
    uint64_t v43 = v19;
LABEL_17:
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
    goto LABEL_19;
  }
  unint64_t v44 = *((void *)v41 + 1);
  uint64_t v43 = v19;
  if (v44 >> 60 == 15)
  {
    sub_255D81EF8(v40);
    goto LABEL_17;
  }
  uint64_t v45 = *(void *)v40;
  *(void *)uint64_t v40 = *(void *)v41;
  *(void *)(v40 + 8) = v44;
  sub_255D80D04(v45, v42);
LABEL_19:
  uint64_t v46 = v84[20];
  int v47 = &a1[v46];
  int v48 = (char *)a2 + v46;
  uint64_t v49 = sub_255EEDF60();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 48);
  int v52 = v51(v47, 1, v49);
  int v53 = v51(v48, 1, v49);
  if (v52)
  {
    id v54 = v43;
    if (!v53)
    {
      (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v47, v48, v49);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v54 = v43;
  if (v53)
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v49);
LABEL_24:
    sub_255EEA028(0, &qword_269F350B8, MEMORY[0x270FA8168], MEMORY[0x263F8D8F0]);
    memcpy(v47, v48, *(void *)(*(void *)(v55 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v50 + 40))(v47, v48, v49);
LABEL_25:
  uint64_t v56 = v84[21];
  uint64_t v57 = *(void **)&a1[v56];
  *(void *)&a1[v56] = *(void *)((char *)a2 + v56);

  uint64_t v58 = v84[22];
  int v59 = &a1[v58];
  uint64_t v60 = (char *)a2 + v58;
  int v61 = v54(&a1[v58], 1, v82);
  int v62 = v54(v60, 1, v82);
  if (!v61)
  {
    if (!v62)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v59, v60, v82);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v59, v82);
    goto LABEL_30;
  }
  if (v62)
  {
LABEL_30:
    sub_255EEA028(0, &qword_269F35058, MEMORY[0x270FA9108], MEMORY[0x263F8D8F0]);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v59, v60, v82);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v59, 0, 1, v82);
LABEL_31:
  uint64_t v64 = a3[5];
  uint64_t v65 = &a1[v64];
  id v66 = (char *)a2 + v64;
  uint64_t v67 = sub_255EEE280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 40))(v65, v66, v67);
  uint64_t v68 = a3[6];
  uint64_t v69 = &a1[v68];
  uint64_t v70 = (char *)a2 + v68;
  uint64_t v71 = sub_255EEE200();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 40))(v69, v70, v71);
  uint64_t v72 = a3[7];
  uint64_t v73 = *(void **)&a1[v72];
  *(void *)&a1[v72] = *(void *)((char *)a2 + v72);

  uint64_t v74 = a3[8];
  uint64_t v75 = *(void **)&a1[v74];
  *(void *)&a1[v74] = *(void *)((char *)a2 + v74);

  uint64_t v76 = a3[9];
  uint64_t v77 = &a1[v76];
  uint64_t v78 = (void *)((char *)a2 + v76);
  uint64_t v80 = *v78;
  uint64_t v79 = v78[1];
  *(void *)uint64_t v77 = v80;
  *((void *)v77 + 1) = v79;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicalIDPersonalInfoViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255EEC7C4);
}

uint64_t sub_255EEC7C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MedicalIDData();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_255EEE280();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_255EEE200();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[8]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicalIDPersonalInfoViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255EEC938);
}

uint64_t sub_255EEC938(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for MedicalIDData();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_255EEE280();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_255EEE200();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[8]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_255EECA94()
{
  uint64_t result = type metadata accessor for MedicalIDData();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_255EEE280();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_255EEE200();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void sub_255EECBB8()
{
  if (!qword_269F38D28)
  {
    sub_255EEE270();
    sub_255EECC2C(&qword_269F38D30);
    unint64_t v0 = sub_255EF02B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38D28);
    }
  }
}

uint64_t sub_255EECC2C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_255EEE270();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicalIDEditSectionHeaderView()
{
  return &type metadata for MedicalIDEditSectionHeaderView;
}

uint64_t sub_255EECC98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_255EECCB4@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = (uint64_t *)v1;
  sub_255EED5B8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EED79C();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_255EEED80();
  if (qword_269F34A50 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_269F3FD50;
  *(void *)uint64_t v6 = v11;
  *((void *)v6 + 1) = v12;
  v6[16] = 0;
  sub_255EED7FC();
  sub_255EECF0C(v2, (uint64_t)&v6[*(int *)(v13 + 44)]);
  char v14 = sub_255EEF1A0();
  long long v15 = *((_OWORD *)v2 + 1);
  long long v26 = *(_OWORD *)v2;
  v27[0] = v15;
  v27[1] = *((_OWORD *)v2 + 2);
  sub_255E0E5B8((uint64_t)v27, (uint64_t)v28);
  sub_255E0E5B8((uint64_t)v28, (uint64_t)v29);
  if (v30)
  {
    if (qword_269F34C70 == -1) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  if (qword_269F34C78 != -1) {
LABEL_8:
  }
    swift_once();
LABEL_7:
  sub_255EEE540();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  sub_255EED964((uint64_t)v6, (uint64_t)v10, (uint64_t (*)(void))sub_255EED5B8);
  int v24 = &v10[*(int *)(v8 + 36)];
  *int v24 = v14;
  *((void *)v24 + 1) = v17;
  *((void *)v24 + 2) = v19;
  *((void *)v24 + 3) = v21;
  *((void *)v24 + 4) = v23;
  v24[40] = 0;
  sub_255EED9CC((uint64_t)v6, (uint64_t (*)(void))sub_255EED5B8);
  return sub_255EED884((uint64_t)v10, a1);
}

void sub_255EECF0C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v64 = a2;
  sub_255E0EB0C(0, &qword_269F38D80, &qword_269F38D88);
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v51 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v52 = (uint64_t)&v51 - v6;
  sub_255EED72C();
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v63 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v60 = (uint64_t)&v51 - v10;
  sub_255E0EB0C(0, &qword_269F38D68, &qword_269F38D70);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v59 = (uint64_t)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v51 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v55 = a1[2];
  uint64_t v21 = a1[4];
  uint64_t v67 = a1[3];
  uint64_t v68 = v19;
  uint64_t v22 = a1[5];
  uint64_t v69 = v20;
  unint64_t v23 = sub_255DAD520();
  swift_bridgeObjectRetain();
  unint64_t v56 = v23;
  uint64_t v24 = sub_255EEF3D0();
  uint64_t v26 = v25;
  uint64_t v65 = v24;
  id v66 = v27;
  uint64_t v68 = v24;
  uint64_t v69 = v25;
  char v29 = v28 & 1;
  char v70 = v28 & 1;
  uint64_t v71 = v27;
  sub_255E0E960(0, (unint64_t *)&qword_269F37DA0, MEMORY[0x263F8E0F8]);
  uint64_t v54 = v30;
  uint64_t v31 = swift_allocObject();
  long long v53 = xmmword_255EF63D0;
  *(_OWORD *)(v31 + 16) = xmmword_255EF63D0;
  uint64_t v57 = v21;
  uint64_t v58 = v22;
  *(void *)(v31 + 32) = v21;
  *(void *)(v31 + 40) = v22;
  *(void *)(v31 + 48) = 0x726564616548;
  *(void *)(v31 + 56) = 0xE600000000000000;
  *(void *)(v31 + 64) = 0x656C746954;
  *(void *)(v31 + 72) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  uint64_t v32 = (void *)sub_255EEFE90();
  swift_bridgeObjectRelease();
  id v33 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v33)
  {
    sub_255EEFD90();

    sub_255E0EB7C(0, &qword_269F38D70);
    sub_255EEDAA0(&qword_269F38DA8, &qword_269F38D70, (uint64_t)&type metadata for EditSectionHeaderViewTitleStyle, (void (*)(void))sub_255E5C6A8);
    sub_255EEF580();
    swift_bridgeObjectRelease();
    sub_255D85120(v65, v26, v29);
    swift_bridgeObjectRelease();
    sub_255E0EA04((uint64_t)v16, (uint64_t)v18, &qword_269F38D68, &qword_269F38D70);
    if (!v67)
    {
      uint64_t v46 = 1;
      uint64_t v45 = v60;
      goto LABEL_6;
    }
    id v66 = v18;
    uint64_t v68 = v55;
    uint64_t v69 = v67;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_255EEF3D0();
    uint64_t v36 = v35;
    uint64_t v68 = v34;
    uint64_t v69 = v35;
    char v38 = v37 & 1;
    char v70 = v37 & 1;
    uint64_t v67 = (uint64_t)v39;
    uint64_t v71 = v39;
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v53;
    *(void *)(v40 + 32) = v57;
    *(void *)(v40 + 40) = v58;
    *(void *)(v40 + 48) = 0x726564616548;
    *(void *)(v40 + 56) = 0xE600000000000000;
    *(void *)(v40 + 64) = 0x7470697263736544;
    *(void *)(v40 + 72) = 0xEB000000006E6F69;
    swift_bridgeObjectRetain();
    uint64_t v41 = (void *)sub_255EEFE90();
    swift_bridgeObjectRelease();
    id v42 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v42)
    {
      sub_255EEFD90();

      sub_255E0EB7C(0, &qword_269F38D88);
      sub_255EEDAA0(&qword_269F38DB0, &qword_269F38D88, (uint64_t)&type metadata for EditSectionHeaderViewDescriptionStyle, (void (*)(void))sub_255E5CDD4);
      uint64_t v43 = (uint64_t)v51;
      sub_255EEF580();
      swift_bridgeObjectRelease();
      sub_255D85120(v34, v36, v38);
      swift_bridgeObjectRelease();
      uint64_t v44 = v52;
      sub_255E0EA04(v43, v52, &qword_269F38D80, &qword_269F38D88);
      uint64_t v45 = v60;
      sub_255E0EA04(v44, v60, &qword_269F38D80, &qword_269F38D88);
      uint64_t v46 = 0;
      uint64_t v18 = v66;
LABEL_6:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v45, v46, 1, v62);
      uint64_t v47 = v59;
      sub_255EED8E8((uint64_t)v18, v59);
      uint64_t v48 = v63;
      sub_255EED964(v45, v63, (uint64_t (*)(void))sub_255EED72C);
      uint64_t v49 = v64;
      sub_255EED8E8(v47, v64);
      sub_255EED6A4();
      sub_255EED964(v48, v49 + *(int *)(v50 + 48), (uint64_t (*)(void))sub_255EED72C);
      sub_255EED9CC(v45, (uint64_t (*)(void))sub_255EED72C);
      sub_255EEDA2C((uint64_t)v18);
      sub_255EED9CC(v48, (uint64_t (*)(void))sub_255EED72C);
      sub_255EEDA2C(v47);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_255EED57C@<X0>(uint64_t a1@<X8>)
{
  return sub_255EECCB4(a1);
}

void sub_255EED5B8()
{
  if (!qword_269F38D50)
  {
    sub_255EED64C();
    sub_255EEDBDC(&qword_269F38D90, (void (*)(uint64_t))sub_255EED64C);
    unint64_t v0 = sub_255EEF950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38D50);
    }
  }
}

void sub_255EED64C()
{
  if (!qword_269F38D58)
  {
    sub_255EED6A4();
    unint64_t v0 = sub_255EEFB90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38D58);
    }
  }
}

void sub_255EED6A4()
{
  if (!qword_269F38D60)
  {
    sub_255E0EB0C(255, &qword_269F38D68, &qword_269F38D70);
    sub_255EED72C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F38D60);
    }
  }
}

void sub_255EED72C()
{
  if (!qword_269F38D78)
  {
    sub_255E0EB0C(255, &qword_269F38D80, &qword_269F38D88);
    unint64_t v0 = sub_255EF01E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38D78);
    }
  }
}

void sub_255EED79C()
{
  if (!qword_269F38D98)
  {
    sub_255EED5B8();
    unint64_t v0 = sub_255EEE870();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38D98);
    }
  }
}

void sub_255EED7FC()
{
  if (!qword_269F38DA0)
  {
    sub_255EED64C();
    unint64_t v0 = sub_255EEE7B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F38DA0);
    }
  }
}

void sub_255EED864()
{
  qword_269F38D40 = 0x4008000000000000;
}

void sub_255EED874()
{
  qword_269F38D48 = 0x4026000000000000;
}

uint64_t sub_255EED884(uint64_t a1, uint64_t a2)
{
  sub_255EED79C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_255EED8E8(uint64_t a1, uint64_t a2)
{
  sub_255E0EB0C(0, &qword_269F38D68, &qword_269F38D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_255EED964(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_255EED9CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_255EEDA2C(uint64_t a1)
{
  sub_255E0EB0C(0, &qword_269F38D68, &qword_269F38D70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_255EEDAA0(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_255E0EB7C(255, a2);
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MedicalIDEditSectionHeaderView.Configuration()
{
  return &type metadata for MedicalIDEditSectionHeaderView.Configuration;
}

unint64_t sub_255EEDB34()
{
  unint64_t result = qword_269F38DB8;
  if (!qword_269F38DB8)
  {
    sub_255EED79C();
    sub_255EEDBDC(&qword_269F38DC0, (void (*)(uint64_t))sub_255EED5B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F38DB8);
  }
  return result;
}

uint64_t sub_255EEDBDC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_255EEDC24()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_255EEDC58()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269F38DC8 = (uint64_t)result;
  return result;
}

uint64_t sub_255EEDCB0(uint64_t a1)
{
  return sub_255EEDCE4(a1, qword_269F3FE98);
}

uint64_t sub_255EEDCC8(uint64_t a1)
{
  return sub_255EEDCE4(a1, qword_269F3FEB0);
}

uint64_t sub_255EEDCE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_255EEE390();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269F34C80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269F38DC8;
  return sub_255EEE380();
}

uint64_t sub_255EEDD90()
{
  return MEMORY[0x270EEDD20]();
}

uint64_t sub_255EEDDA0()
{
  return MEMORY[0x270EEDF88]();
}

uint64_t sub_255EEDDB0()
{
  return MEMORY[0x270EEDF98]();
}

uint64_t sub_255EEDDC0()
{
  return MEMORY[0x270EEDFB0]();
}

uint64_t sub_255EEDDD0()
{
  return MEMORY[0x270EEDFB8]();
}

uint64_t sub_255EEDDE0()
{
  return MEMORY[0x270EEDFE8]();
}

uint64_t sub_255EEDDF0()
{
  return MEMORY[0x270EEE018]();
}

uint64_t sub_255EEDE00()
{
  return MEMORY[0x270EEE038]();
}

uint64_t sub_255EEDE10()
{
  return MEMORY[0x270EEE050]();
}

uint64_t sub_255EEDE20()
{
  return MEMORY[0x270EEE060]();
}

uint64_t sub_255EEDE30()
{
  return MEMORY[0x270EEE0D8]();
}

uint64_t sub_255EEDE40()
{
  return MEMORY[0x270EEE210]();
}

uint64_t sub_255EEDE50()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_255EEDE60()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_255EEDE70()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_255EEDE80()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_255EEDE90()
{
  return MEMORY[0x270EEE6D8]();
}

uint64_t sub_255EEDEA0()
{
  return MEMORY[0x270EEE740]();
}

uint64_t sub_255EEDEB0()
{
  return MEMORY[0x270EEE750]();
}

uint64_t sub_255EEDEC0()
{
  return MEMORY[0x270EEE758]();
}

uint64_t sub_255EEDED0()
{
  return MEMORY[0x270EEE770]();
}

uint64_t sub_255EEDEE0()
{
  return MEMORY[0x270EEE778]();
}

uint64_t sub_255EEDEF0()
{
  return MEMORY[0x270EEE798]();
}

uint64_t sub_255EEDF00()
{
  return MEMORY[0x270EEE7E0]();
}

uint64_t sub_255EEDF10()
{
  return MEMORY[0x270EEE7E8]();
}

uint64_t sub_255EEDF20()
{
  return MEMORY[0x270EEE7F8]();
}

uint64_t sub_255EEDF30()
{
  return MEMORY[0x270EEE808]();
}

uint64_t sub_255EEDF40()
{
  return MEMORY[0x270EEE888]();
}

uint64_t sub_255EEDF50()
{
  return MEMORY[0x270EEE8A8]();
}

uint64_t sub_255EEDF60()
{
  return MEMORY[0x270EEE8F0]();
}

uint64_t sub_255EEDF70()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_255EEDF80()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_255EEDF90()
{
  return MEMORY[0x270EEF380]();
}

uint64_t sub_255EEDFA0()
{
  return MEMORY[0x270EEF438]();
}

uint64_t sub_255EEDFB0()
{
  return MEMORY[0x270EEF468]();
}

uint64_t sub_255EEDFC0()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_255EEDFD0()
{
  return MEMORY[0x270EEF9C8]();
}

uint64_t sub_255EEDFE0()
{
  return MEMORY[0x270EEFA40]();
}

uint64_t sub_255EEDFF0()
{
  return MEMORY[0x270EEFA48]();
}

uint64_t sub_255EEE000()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_255EEE010()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_255EEE020()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_255EEE030()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_255EEE040()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_255EEE050()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_255EEE060()
{
  return MEMORY[0x270EF02F0]();
}

uint64_t sub_255EEE070()
{
  return MEMORY[0x270EF0328]();
}

uint64_t sub_255EEE080()
{
  return MEMORY[0x270EF0338]();
}

uint64_t sub_255EEE090()
{
  return MEMORY[0x270EF0368]();
}

uint64_t sub_255EEE0A0()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_255EEE0B0()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_255EEE0C0()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_255EEE0D0()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_255EEE0E0()
{
  return MEMORY[0x270EF0BF8]();
}

uint64_t sub_255EEE0F0()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_255EEE100()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_255EEE110()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_255EEE120()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_255EEE130()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_255EEE140()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_255EEE150()
{
  return MEMORY[0x270EF0D88]();
}

uint64_t sub_255EEE160()
{
  return MEMORY[0x270EF0E68]();
}

uint64_t sub_255EEE170()
{
  return MEMORY[0x270EF0E78]();
}

uint64_t sub_255EEE180()
{
  return MEMORY[0x270EF0E88]();
}

uint64_t sub_255EEE190()
{
  return MEMORY[0x270EF0EA0]();
}

uint64_t sub_255EEE1A0()
{
  return MEMORY[0x270EF0EB8]();
}

uint64_t sub_255EEE1B0()
{
  return MEMORY[0x270EF0ED8]();
}

uint64_t sub_255EEE1C0()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_255EEE1D0()
{
  return MEMORY[0x270EF0EF0]();
}

uint64_t sub_255EEE1E0()
{
  return MEMORY[0x270EF0F38]();
}

uint64_t sub_255EEE1F0()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_255EEE200()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_255EEE210()
{
  return MEMORY[0x270EF10C0]();
}

uint64_t sub_255EEE220()
{
  return MEMORY[0x270EF10D0]();
}

uint64_t sub_255EEE230()
{
  return MEMORY[0x270EF10F8]();
}

uint64_t sub_255EEE240()
{
  return MEMORY[0x270EF1240]();
}

uint64_t sub_255EEE250()
{
  return MEMORY[0x270EF12D8]();
}

uint64_t sub_255EEE260()
{
  return MEMORY[0x270EF1390]();
}

uint64_t sub_255EEE270()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_255EEE280()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_255EEE290()
{
  return MEMORY[0x270EF1578]();
}

uint64_t sub_255EEE2A0()
{
  return MEMORY[0x270EF15F8]();
}

uint64_t sub_255EEE2B0()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_255EEE2C0()
{
  return MEMORY[0x270FA1200]();
}

uint64_t sub_255EEE2D0()
{
  return MEMORY[0x270FA1210]();
}

uint64_t sub_255EEE2E0()
{
  return MEMORY[0x270FA1218]();
}

uint64_t sub_255EEE2F0()
{
  return MEMORY[0x270FA1230]();
}

uint64_t sub_255EEE300()
{
  return MEMORY[0x270FA1240]();
}

uint64_t sub_255EEE310()
{
  return MEMORY[0x270FA1248]();
}

uint64_t sub_255EEE320()
{
  return MEMORY[0x270EF17A8]();
}

uint64_t sub_255EEE330()
{
  return MEMORY[0x270EF17C0]();
}

uint64_t sub_255EEE340()
{
  return MEMORY[0x270EF17C8]();
}

uint64_t sub_255EEE350()
{
  return MEMORY[0x270EF17D8]();
}

uint64_t sub_255EEE360()
{
  return MEMORY[0x270F35070]();
}

uint64_t sub_255EEE370()
{
  return MEMORY[0x270F35078]();
}

uint64_t sub_255EEE380()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_255EEE390()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_255EEE3A0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_255EEE3B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_255EEE3C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_255EEE3D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_255EEE3E0()
{
  return MEMORY[0x270EE3AC0]();
}

uint64_t sub_255EEE3F0()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_255EEE400()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_255EEE410()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_255EEE420()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_255EEE430()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_255EEE440()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_255EEE450()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_255EEE460()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_255EEE470()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_255EEE480()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_255EEE490()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_255EEE4A0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_255EEE4B0()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_255EEE4C0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_255EEE4D0()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_255EEE4E0()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_255EEE4F0()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_255EEE500()
{
  return MEMORY[0x270EFECB0]();
}

uint64_t sub_255EEE510()
{
  return MEMORY[0x270EFECC0]();
}

uint64_t sub_255EEE520()
{
  return MEMORY[0x270EFECC8]();
}

uint64_t sub_255EEE530()
{
  return MEMORY[0x270EFECD0]();
}

uint64_t sub_255EEE540()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_255EEE550()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_255EEE560()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_255EEE570()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_255EEE580()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_255EEE590()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_255EEE5A0()
{
  return MEMORY[0x270EFED78]();
}

uint64_t sub_255EEE5B0()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_255EEE5C0()
{
  return MEMORY[0x270EFEDA8]();
}

uint64_t sub_255EEE5D0()
{
  return MEMORY[0x270EFEDC8]();
}

uint64_t sub_255EEE5E0()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_255EEE5F0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_255EEE600()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_255EEE610()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_255EEE620()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_255EEE630()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_255EEE640()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_255EEE650()
{
  return MEMORY[0x270EFEFF0]();
}

uint64_t sub_255EEE660()
{
  return MEMORY[0x270EFF140]();
}

uint64_t sub_255EEE670()
{
  return MEMORY[0x270EFF158]();
}

uint64_t sub_255EEE680()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_255EEE690()
{
  return MEMORY[0x270EFF180]();
}

uint64_t sub_255EEE6A0()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_255EEE6B0()
{
  return MEMORY[0x270EFF230]();
}

uint64_t sub_255EEE6C0()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_255EEE6D0()
{
  return MEMORY[0x270EFF3D0]();
}

uint64_t sub_255EEE6E0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_255EEE6F0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_255EEE700()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_255EEE710()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_255EEE720()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_255EEE730()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_255EEE740()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_255EEE750()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_255EEE760()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_255EEE770()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_255EEE780()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_255EEE790()
{
  return MEMORY[0x270EFF8D8]();
}

uint64_t sub_255EEE7A0()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_255EEE7B0()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_255EEE7C0()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_255EEE7D0()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_255EEE7E0()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_255EEE7F0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_255EEE800()
{
  return MEMORY[0x270EFFA80]();
}

uint64_t sub_255EEE810()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_255EEE820()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_255EEE830()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_255EEE840()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_255EEE850()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_255EEE860()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_255EEE870()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_255EEE880()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_255EEE890()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_255EEE8A0()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_255EEE8B0()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_255EEE8C0()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_255EEE8D0()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_255EEE8E0()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_255EEE8F0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_255EEE900()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_255EEE910()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_255EEE920()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_255EEE930()
{
  return MEMORY[0x270F005D0]();
}

uint64_t sub_255EEE940()
{
  return MEMORY[0x270F005D8]();
}

uint64_t sub_255EEE950()
{
  return MEMORY[0x270F00608]();
}

uint64_t sub_255EEE960()
{
  return MEMORY[0x270F00618]();
}

uint64_t sub_255EEE970()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_255EEE980()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_255EEE990()
{
  return MEMORY[0x270F00660]();
}

uint64_t sub_255EEE9A0()
{
  return MEMORY[0x270F00668]();
}

uint64_t sub_255EEE9B0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_255EEE9C0()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_255EEE9D0()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_255EEE9E0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_255EEE9F0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_255EEEA00()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_255EEEA10()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_255EEEA20()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_255EEEA30()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_255EEEA40()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_255EEEA50()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_255EEEA60()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_255EEEA70()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_255EEEA80()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_255EEEA90()
{
  return MEMORY[0x270F00A68]();
}

uint64_t sub_255EEEAA0()
{
  return MEMORY[0x270F00A70]();
}

uint64_t sub_255EEEAB0()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_255EEEAC0()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_255EEEAD0()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_255EEEAE0()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_255EEEAF0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_255EEEB00()
{
  return MEMORY[0x270F00D10]();
}

uint64_t sub_255EEEB10()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_255EEEB20()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_255EEEB30()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_255EEEB40()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_255EEEB50()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_255EEEB60()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_255EEEB70()
{
  return MEMORY[0x270F00E18]();
}

uint64_t sub_255EEEB80()
{
  return MEMORY[0x270F00E28]();
}

uint64_t sub_255EEEB90()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_255EEEBA0()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_255EEEBB0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_255EEEBC0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_255EEEBD0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_255EEEBE0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_255EEEBF0()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_255EEEC00()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_255EEEC10()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_255EEEC20()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_255EEEC30()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_255EEEC40()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_255EEEC50()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_255EEEC60()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_255EEEC70()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_255EEEC80()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_255EEEC90()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_255EEECA0()
{
  return MEMORY[0x270F011B8]();
}

uint64_t sub_255EEECB0()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_255EEECC0()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_255EEECD0()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_255EEECE0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_255EEECF0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_255EEED00()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_255EEED10()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_255EEED20()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_255EEED30()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_255EEED40()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_255EEED50()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_255EEED60()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_255EEED70()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_255EEED80()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_255EEED90()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_255EEEDA0()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_255EEEDB0()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_255EEEDC0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_255EEEDD0()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_255EEEDE0()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_255EEEDF0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_255EEEE00()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_255EEEE10()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_255EEEE20()
{
  return MEMORY[0x270F01880]();
}

uint64_t sub_255EEEE30()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_255EEEE40()
{
  return MEMORY[0x270F019A8]();
}

uint64_t sub_255EEEE50()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_255EEEE60()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_255EEEE70()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_255EEEE80()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_255EEEE90()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_255EEEEA0()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_255EEEEB0()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_255EEEEC0()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_255EEEED0()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_255EEEEE0()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_255EEEEF0()
{
  return MEMORY[0x270F01C30]();
}

uint64_t sub_255EEEF00()
{
  return MEMORY[0x270F01C58]();
}

uint64_t sub_255EEEF10()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_255EEEF20()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_255EEEF30()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_255EEEF40()
{
  return MEMORY[0x270F020D8]();
}

uint64_t sub_255EEEF50()
{
  return MEMORY[0x270F02138]();
}

uint64_t sub_255EEEF60()
{
  return MEMORY[0x270F02140]();
}

uint64_t sub_255EEEF70()
{
  return MEMORY[0x270F02240]();
}

uint64_t sub_255EEEF80()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_255EEEF90()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_255EEEFA0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_255EEEFB0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_255EEEFC0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_255EEEFD0()
{
  return MEMORY[0x270F02578]();
}

uint64_t sub_255EEEFE0()
{
  return MEMORY[0x270F02588]();
}

uint64_t sub_255EEEFF0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_255EEF000()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_255EEF010()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_255EEF030()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_255EEF040()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_255EEF050()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_255EEF070()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_255EEF080()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_255EEF090()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_255EEF0A0()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_255EEF0B0()
{
  return MEMORY[0x270F02890]();
}

uint64_t sub_255EEF0C0()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_255EEF0D0()
{
  return MEMORY[0x270F02908]();
}

uint64_t sub_255EEF0E0()
{
  return MEMORY[0x270F02910]();
}

uint64_t sub_255EEF0F0()
{
  return MEMORY[0x270F02918]();
}

uint64_t sub_255EEF100()
{
  return MEMORY[0x270F02920]();
}

uint64_t sub_255EEF110()
{
  return MEMORY[0x270F02948]();
}

uint64_t sub_255EEF120()
{
  return MEMORY[0x270F02950]();
}

uint64_t sub_255EEF130()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_255EEF140()
{
  return MEMORY[0x270F029A0]();
}

uint64_t sub_255EEF150()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_255EEF160()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_255EEF170()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_255EEF180()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_255EEF190()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_255EEF1A0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_255EEF1B0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_255EEF1C0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_255EEF1D0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_255EEF1E0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_255EEF1F0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_255EEF200()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_255EEF210()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_255EEF220()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_255EEF230()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_255EEF240()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_255EEF250()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_255EEF260()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_255EEF270()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_255EEF280()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_255EEF290()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_255EEF2A0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_255EEF2B0()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_255EEF2C0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_255EEF2D0()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_255EEF2E0()
{
  return MEMORY[0x270F02D78]();
}

uint64_t sub_255EEF2F0()
{
  return MEMORY[0x270F02D90]();
}

uint64_t sub_255EEF300()
{
  return MEMORY[0x270F02DB0]();
}

uint64_t sub_255EEF310()
{
  return MEMORY[0x270F02DC0]();
}

uint64_t sub_255EEF320()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_255EEF330()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_255EEF340()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_255EEF350()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_255EEF360()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_255EEF370()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_255EEF380()
{
  return MEMORY[0x270F03050]();
}

uint64_t sub_255EEF390()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_255EEF3A0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_255EEF3B0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_255EEF3C0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_255EEF3D0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_255EEF3E0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_255EEF3F0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_255EEF400()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_255EEF410()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_255EEF420()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_255EEF430()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_255EEF440()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_255EEF450()
{
  return MEMORY[0x270F034C8]();
}

uint64_t sub_255EEF460()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_255EEF470()
{
  return MEMORY[0x270F03540]();
}

uint64_t sub_255EEF480()
{
  return MEMORY[0x270F03568]();
}

uint64_t sub_255EEF490()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_255EEF4A0()
{
  return MEMORY[0x270F035B8]();
}

uint64_t sub_255EEF4B0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_255EEF4C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_255EEF4D0()
{
  return MEMORY[0x270F03780]();
}

uint64_t sub_255EEF4E0()
{
  return MEMORY[0x270F037C0]();
}

uint64_t sub_255EEF4F0()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_255EEF500()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_255EEF510()
{
  return MEMORY[0x270F03870]();
}

uint64_t sub_255EEF520()
{
  return MEMORY[0x270F03970]();
}

uint64_t sub_255EEF530()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_255EEF540()
{
  return MEMORY[0x270F03A28]();
}

uint64_t sub_255EEF550()
{
  return MEMORY[0x270F03B10]();
}

uint64_t sub_255EEF560()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_255EEF570()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_255EEF580()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_255EEF590()
{
  return MEMORY[0x270F03DA0]();
}

uint64_t sub_255EEF5A0()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_255EEF5B0()
{
  return MEMORY[0x270F03E20]();
}

uint64_t sub_255EEF5C0()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_255EEF5D0()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_255EEF5E0()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_255EEF5F0()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_255EEF600()
{
  return MEMORY[0x270F04010]();
}

uint64_t sub_255EEF610()
{
  return MEMORY[0x270F04018]();
}

uint64_t sub_255EEF620()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_255EEF630()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_255EEF640()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_255EEF650()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_255EEF660()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_255EEF670()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_255EEF680()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_255EEF690()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_255EEF6A0()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_255EEF6B0()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_255EEF6C0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_255EEF6D0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_255EEF6E0()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_255EEF6F0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_255EEF700()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_255EEF710()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_255EEF720()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_255EEF730()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_255EEF740()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_255EEF750()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_255EEF760()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_255EEF770()
{
  return MEMORY[0x270F045B8]();
}

uint64_t sub_255EEF780()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_255EEF790()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_255EEF7A0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_255EEF7B0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_255EEF7C0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_255EEF7D0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_255EEF7E0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_255EEF7F0()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_255EEF800()
{
  return MEMORY[0x270F04788]();
}

uint64_t sub_255EEF810()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_255EEF820()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_255EEF830()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_255EEF840()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_255EEF850()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_255EEF860()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_255EEF870()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_255EEF880()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_255EEF890()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_255EEF8A0()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_255EEF8B0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_255EEF8C0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_255EEF8D0()
{
  return MEMORY[0x270F04978]();
}

uint64_t sub_255EEF8E0()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_255EEF8F0()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_255EEF900()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_255EEF910()
{
  return MEMORY[0x270F049E8]();
}

uint64_t sub_255EEF920()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_255EEF930()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_255EEF940()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_255EEF950()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_255EEF960()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_255EEF970()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_255EEF980()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_255EEF990()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_255EEF9A0()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_255EEF9B0()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_255EEF9C0()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_255EEF9D0()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_255EEF9E0()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_255EEF9F0()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_255EEFA00()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_255EEFA10()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_255EEFA20()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_255EEFA30()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_255EEFA40()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_255EEFA50()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_255EEFA60()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_255EEFA70()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_255EEFA80()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_255EEFA90()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_255EEFAA0()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_255EEFAB0()
{
  return MEMORY[0x270F04E98]();
}

uint64_t sub_255EEFAC0()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_255EEFAD0()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_255EEFAE0()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_255EEFAF0()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_255EEFB00()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_255EEFB10()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_255EEFB20()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_255EEFB30()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_255EEFB40()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_255EEFB50()
{
  return MEMORY[0x270F05208]();
}

uint64_t sub_255EEFB60()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_255EEFB70()
{
  return MEMORY[0x270F052D8]();
}

uint64_t sub_255EEFB80()
{
  return MEMORY[0x270F05308]();
}

uint64_t sub_255EEFB90()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_255EEFBA0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_255EEFBB0()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_255EEFBC0()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_255EEFBD0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_255EEFBE0()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_255EEFBF0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_255EEFC00()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_255EEFC10()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_255EEFC20()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_255EEFC30()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_255EEFC40()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_255EEFC50()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_255EEFC60()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_255EEFC70()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_255EEFC80()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_255EEFC90()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_255EEFCA0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_255EEFCB0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_255EEFCC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_255EEFCD0()
{
  return MEMORY[0x270EF18C8]();
}

uint64_t sub_255EEFCE0()
{
  return MEMORY[0x270EF18F8]();
}

uint64_t sub_255EEFCF0()
{
  return MEMORY[0x270EF1900]();
}

uint64_t sub_255EEFD00()
{
  return MEMORY[0x270EF1920]();
}

uint64_t sub_255EEFD10()
{
  return MEMORY[0x270EF1930]();
}

uint64_t sub_255EEFD20()
{
  return MEMORY[0x270EF1940]();
}

uint64_t sub_255EEFD30()
{
  return MEMORY[0x270EF1948]();
}

uint64_t sub_255EEFD40()
{
  return MEMORY[0x270EF1960]();
}

uint64_t sub_255EEFD50()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_255EEFD60()
{
  return MEMORY[0x270EF19C0]();
}

uint64_t sub_255EEFD70()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_255EEFD80()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_255EEFD90()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_255EEFDA0()
{
  return MEMORY[0x270EF1B00]();
}

uint64_t sub_255EEFDB0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_255EEFDC0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_255EEFDD0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_255EEFDE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_255EEFDF0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_255EEFE00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_255EEFE10()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_255EEFE20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_255EEFE40()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_255EEFE50()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_255EEFE60()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_255EEFE70()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_255EEFE80()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_255EEFE90()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_255EEFEA0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_255EEFEB0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_255EEFEC0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_255EEFED0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_255EEFEE0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_255EEFEF0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_255EEFF00()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_255EEFF10()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_255EEFF20()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_255EEFF30()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_255EEFF40()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_255EEFF50()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_255EEFF60()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_255EEFF70()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_255EEFF80()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_255EEFF90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_255EEFFA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_255EEFFC0()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_255EEFFD0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_255EEFFE0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_255EEFFF0()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_255EF0000()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_255EF0010()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_255EF0020()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_255EF0030()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_255EF0040()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_255EF0050()
{
  return MEMORY[0x270F053F0]();
}

uint64_t sub_255EF0060()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_255EF0070()
{
  return MEMORY[0x270F35128]();
}

uint64_t sub_255EF0080()
{
  return MEMORY[0x270EF1DC0]();
}

uint64_t sub_255EF0090()
{
  return MEMORY[0x270EF1EE0]();
}

uint64_t sub_255EF00A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_255EF00B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_255EF00C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_255EF00D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_255EF00E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_255EF00F0()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_255EF0100()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_255EF0110()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_255EF0120()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_255EF0130()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_255EF0140()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_255EF0150()
{
  return MEMORY[0x270EF2030]();
}

uint64_t sub_255EF0160()
{
  return MEMORY[0x270EF3510]();
}

uint64_t sub_255EF0170()
{
  return MEMORY[0x270EF3518]();
}

uint64_t sub_255EF0180()
{
  return MEMORY[0x270EF3540]();
}

uint64_t sub_255EF0190()
{
  return MEMORY[0x270EF3560]();
}

uint64_t sub_255EF01A0()
{
  return MEMORY[0x270EE5910]();
}

uint64_t sub_255EF01B0()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_255EF01C0()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_255EF01D0()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_255EF01E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_255EF01F0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_255EF0200()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_255EF0210()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_255EF0220()
{
  return MEMORY[0x270EF23D0]();
}

uint64_t sub_255EF0230()
{
  return MEMORY[0x270EF24A8]();
}

uint64_t sub_255EF0240()
{
  return MEMORY[0x270EF24E8]();
}

uint64_t sub_255EF0250()
{
  return MEMORY[0x270EF2500]();
}

uint64_t sub_255EF0260()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_255EF0270()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_255EF0280()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_255EF0290()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_255EF02A0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_255EF02B0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_255EF02C0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_255EF02D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_255EF02E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_255EF02F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_255EF0300()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_255EF0310()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_255EF0320()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_255EF0330()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_255EF0340()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_255EF0350()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_255EF0360()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_255EF0370()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_255EF0380()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_255EF0390()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_255EF03A0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_255EF03B0()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_255EF03C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_255EF03D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_255EF03E0()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_255EF03F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_255EF0400()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_255EF0410()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_255EF0420()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_255EF0430()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_255EF0440()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_255EF0450()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_255EF0460()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_255EF0470()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_255EF0480()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_255EF0490()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_255EF04A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_255EF04C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_255EF04D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_255EF04E0()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_255EF04F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_255EF0500()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_255EF0510()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_255EF0520()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_255EF0540()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_255EF0550()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_255EF0560()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_255EF0570()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_255EF0580()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_255EF0590()
{
  return MEMORY[0x270EF29C0]();
}

uint64_t sub_255EF05A0()
{
  return MEMORY[0x270EF29D8]();
}

uint64_t sub_255EF05B0()
{
  return MEMORY[0x270EF29F8]();
}

uint64_t sub_255EF05C0()
{
  return MEMORY[0x270EF2A18]();
}

uint64_t sub_255EF05D0()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_255EF05E0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x270EF3710]();
}

uint64_t HKStringForBloodType()
{
  return MEMORY[0x270F382A8]();
}

uint64_t HKUIDefaultPregnancyDueDate()
{
  return MEMORY[0x270F38300]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x270F38330]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA460](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getFunctionTypeMetadataGlobalActor()
{
  return MEMORY[0x270FA03A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}