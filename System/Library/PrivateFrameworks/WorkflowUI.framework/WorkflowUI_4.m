uint64_t sub_22DBE243C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  _OWORD *v10;
  long long v11;
  unsigned char v13[16];
  uint64_t v14;
  uint64_t v15;
  long long v16;
  long long v17;
  long long v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B740);
  v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = a2;
  v15 = a1;
  sub_22DC91908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B748);
  sub_22DBE7C7C(&qword_26859B750, &qword_26859B748, (void (*)(void))sub_22DBE7CF8);
  sub_22DC90878();
  sub_22DC90A58();
  sub_22DC92598();
  sub_22DC909B8();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(a3, v9, v6);
  v10 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859B778) + 36));
  v11 = v17;
  *v10 = v16;
  v10[1] = v11;
  v10[2] = v18;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22DBE2604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B770);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B760);
  MEMORY[0x270FA5388](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B748);
  MEMORY[0x270FA5388](v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v6 = sub_22DC91258();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B780);
  sub_22DBE28D8(a1, (uint64_t)&v6[*(int *)(v13 + 44)]);
  unsigned __int8 v14 = sub_22DC91958();
  unsigned __int8 v15 = sub_22DC91978();
  char v16 = sub_22DC91968();
  sub_22DC91968();
  if (sub_22DC91968() != v14) {
    char v16 = sub_22DC91968();
  }
  sub_22DC91968();
  if (sub_22DC91968() != v15) {
    char v16 = sub_22DC91968();
  }
  sub_22DC90828();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_22D9CC3C8((uint64_t)v6, (uint64_t)v9, &qword_26859B770);
  v25 = &v9[*(int *)(v7 + 36)];
  char *v25 = v16;
  *((void *)v25 + 1) = v18;
  *((void *)v25 + 2) = v20;
  *((void *)v25 + 3) = v22;
  *((void *)v25 + 4) = v24;
  v25[40] = 0;
  sub_22D9CAD04((uint64_t)v6, &qword_26859B770);
  unsigned __int8 v26 = sub_22DC91938();
  char v27 = sub_22DC91968();
  sub_22DC91968();
  if (sub_22DC91968() != v26) {
    char v27 = sub_22DC91968();
  }
  sub_22DC90828();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_22D9CC3C8((uint64_t)v9, (uint64_t)v12, &qword_26859B760);
  v36 = &v12[*(int *)(v10 + 36)];
  char *v36 = v27;
  *((void *)v36 + 1) = v29;
  *((void *)v36 + 2) = v31;
  *((void *)v36 + 3) = v33;
  *((void *)v36 + 4) = v35;
  v36[40] = 0;
  sub_22D9CAD04((uint64_t)v9, &qword_26859B760);
  return sub_22D9D01F0((uint64_t)v12, a2, &qword_26859B748);
}

uint64_t sub_22DBE28D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B660);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B668);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v63 - v12;
  MEMORY[0x270FA5388](v11);
  unsigned __int8 v15 = (char *)&v63 - v14;
  sub_22DC90A58();
  double v17 = v16;
  *(void *)v6 = sub_22DC91258();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B670);
  sub_22DBDEFC4(a1, (uint64_t *)&v6[*(int *)(v18 + 44)], v17);
  unsigned __int8 v19 = sub_22DC91948();
  char v20 = sub_22DC91968();
  sub_22DC91968();
  if (sub_22DC91968() != v19) {
    char v20 = sub_22DC91968();
  }
  objc_msgSend(self, sel_bottomPadding);
  sub_22DC90828();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_22D9CC3C8((uint64_t)v6, (uint64_t)v13, &qword_26859B660);
  uint64_t v29 = &v13[*(int *)(v7 + 36)];
  *uint64_t v29 = v20;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_22D9CAD04((uint64_t)v6, &qword_26859B660);
  sub_22D9D01F0((uint64_t)v13, (uint64_t)v15, &qword_26859B668);
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v30 = (id)qword_268595FA0;
  uint64_t v31 = (void *)sub_22DC92948();
  uint64_t v32 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v30, sel_localizedStringForKey_value_table_, v31, v32, 0);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685950B0);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_22DCB0E90;
  uint64_t v35 = a1 + *(int *)(type metadata accessor for AddToSiriView() + 32);
  uint64_t v36 = *(void *)v35;
  char v37 = *(unsigned char *)(v35 + 8);
  uint64_t v38 = *(void *)(v35 + 16);
  uint64_t v64 = v36;
  LOBYTE(v65) = v37;
  uint64_t v66 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
  sub_22DC92228();
  id v39 = v67;
  id v40 = objc_msgSend(v67, sel_actions);

  sub_22D9A6F3C(0, (unint64_t *)&qword_268596D00);
  unint64_t v41 = sub_22DC92B48();

  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_22DC93628();
    swift_bridgeObjectRelease();
    if (v45) {
      goto LABEL_7;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_7:
  sub_22DA25524(0, (v41 & 0xC000000000000001) == 0, v41);
  if ((v41 & 0xC000000000000001) != 0) {
    id v42 = (id)MEMORY[0x230F94700](0, v41);
  }
  else {
    id v42 = *(id *)(v41 + 32);
  }
  v43 = v42;
  swift_bridgeObjectRelease();
  id v44 = objc_msgSend(v43, sel_localizedName);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
LABEL_12:
  uint64_t v46 = sub_22D9A6F3C(0, (unint64_t *)&unk_26859B560);
  id v47 = sub_22D9D908C();
  *(void *)(v34 + 56) = v46;
  unint64_t v48 = sub_22DBE7D98();
  *(void *)(v34 + 64) = v48;
  *(void *)(v34 + 32) = v47;
  sub_22DBE2EB4();
  id v49 = sub_22D9D908C();
  *(void *)(v34 + 96) = v46;
  *(void *)(v34 + 104) = v48;
  *(void *)(v34 + 72) = v49;
  uint64_t v50 = sub_22DC92958();
  uint64_t v52 = v51;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v64 = v50;
  uint64_t v65 = v52;
  sub_22D9CFB38();
  uint64_t v53 = sub_22DC91BB8();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  char v59 = v58 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_22D9CC3C8((uint64_t)v15, (uint64_t)v10, &qword_26859B668);
  sub_22D9CC3C8((uint64_t)v10, a2, &qword_26859B668);
  uint64_t v61 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859B790) + 48);
  *(void *)uint64_t v61 = v53;
  *(void *)(v61 + 8) = v55;
  *(unsigned char *)(v61 + 16) = v59;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = KeyPath;
  *(unsigned char *)(v61 + 40) = 1;
  sub_22D9CFBC8(v53, v55, v59);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22D9CAD04((uint64_t)v15, &qword_26859B668);
  sub_22D9CFC1C(v53, v55, v59);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_22D9CAD04((uint64_t)v10, &qword_26859B668);
}

uint64_t sub_22DBE2EB4()
{
  sub_22D9A6F3C(0, &qword_26859B798);
  uint64_t v0 = sub_22DBE35A8();
  id v2 = sub_22DBE3764(v0, v1);
  if (!v2) {
    return 0;
  }
  v3 = v2;
  id v4 = objc_msgSend(v2, sel_localizedName);
  if (!v4)
  {

    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

  return v6;
}

uint64_t sub_22DBE2F50()
{
  return sub_22DC92238();
}

uint64_t sub_22DBE2FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9B00);
  MEMORY[0x270FA5388](v1 - 8);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_22DC91AD8();
  uint64_t v4 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685994A0);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268597F58);
  MEMORY[0x270FA5388](v30);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC929E8();
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v12 = (id)qword_268595FA0;
  uint64_t v13 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

  uint64_t v16 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v18 = v17;

  uint64_t v35 = v16;
  uint64_t v36 = v18;
  sub_22D9CFB38();
  sub_22DC921F8();
  uint64_t v19 = v31;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1A730], v31);
  uint64_t v20 = sub_22DC919E8();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v20);
  sub_22DC91A38();
  sub_22D9CAD04((uint64_t)v3, &qword_26AEF9B00);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  sub_22DC91A18();
  uint64_t v21 = sub_22DC91A68();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v32;
  uint64_t v23 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v11, v9, v33);
  uint64_t v25 = (uint64_t *)&v11[*(int *)(v30 + 36)];
  uint64_t *v25 = KeyPath;
  v25[1] = v21;
  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
  uint64_t v26 = sub_22DC92598();
  sub_22DB1EC20(0, 1, 0, 1, 0x7FF0000000000000, 0, 0, 1, 0, 1, 0, 1, v26, v27);
  return sub_22D9CAD04((uint64_t)v11, &qword_268597F58);
}

uint64_t sub_22DBE3404(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddToSiriView();
  return (*(uint64_t (**)(void, uint64_t))(a1 + *(int *)(v2 + 28)))(0, 3);
}

void sub_22DBE3448()
{
  type metadata accessor for AddToSiriView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
  sub_22DC92228();
  sub_22DA4FE24(v2);
  sub_22D9A6F3C(0, (unint64_t *)&unk_26859B560);
  id v0 = sub_22D9D908C();
  unsigned __int8 v1 = objc_msgSend(v0, sel_wf_isEmpty);

  if ((v1 & 1) == 0)
  {
    sub_22DC92228();
    sub_22DA4FE24(v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268596B68);
    sub_22DC92238();
    sub_22DBDEF10();
  }
}

uint64_t sub_22DBE35A8()
{
  type metadata accessor for AddToSiriView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
  sub_22DC92228();
  id v0 = objc_msgSend(v9, sel_actions);

  sub_22D9A6F3C(0, (unint64_t *)&qword_268596D00);
  unint64_t v1 = sub_22DC92B48();

  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22DC93628();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_8;
  }
LABEL_3:
  sub_22DA25524(0, (v1 & 0xC000000000000001) == 0, v1);
  if ((v1 & 0xC000000000000001) != 0) {
    id v2 = (id)MEMORY[0x230F94700](0, v1);
  }
  else {
    id v2 = *(id *)(v1 + 32);
  }
  v3 = v2;
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v3, sel_app);

  if (!v4) {
    return _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = objc_msgSend(v4, sel_bundleIdentifier);

  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  return v6;
}

id sub_22DBE3764(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_applicationProxyForIdentifier_, v2);

  return v3;
}

void sub_22DBE37D4()
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v1 = type metadata accessor for AddToSiriView();
  uint64_t v2 = v0 + *(int *)(v1 + 32);
  id v3 = *(id *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  id v32 = *(id *)v2;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
  sub_22DC92228();
  id v6 = objc_msgSend(v29, sel_reference);

  if (!v6) {
    return;
  }
  uint64_t v28 = v6;
  sub_22DC92228();
  objc_msgSend(v29, sel_save);

  id v32 = v3;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  sub_22DC92228();
  uint64_t v7 = sub_22DA4FE24(v29);
  uint64_t v9 = v8;
  uint64_t v26 = v1;
  uint64_t v27 = v0;
  uint64_t v10 = v0 + *(int *)(v1 + 36);
  uint64_t v11 = *(void *)(v10 + 8);
  uint64_t v12 = *(void *)(v10 + 16);
  id v25 = *(id *)v10;
  id v32 = *(id *)v10;
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268596B68);
  sub_22DC92228();
  if (v9)
  {
    if ((id)v7 == v29 && v9 == v30)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    char v14 = sub_22DC937E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v15 = *(void **)(v0 + *(int *)(v26 + 48));
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  sub_22DC92228();
  uint64_t v16 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v32 = 0;
  id v17 = objc_msgSend(v15, sel_renameReference_to_error_, v28, v16, &v32);

  if (v17)
  {
    id v18 = v32;
  }
  else
  {
    id v19 = v32;
    uint64_t v20 = (void *)sub_22DC8F028();

    swift_willThrow();
  }
LABEL_14:
  id v32 = v3;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  sub_22DC92228();
  id v32 = v25;
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  sub_22DC92228();
  sub_22DBB494C((uint64_t)v29, v30, v29, (SEL *)&selRef_setName_);

  id v32 = v3;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  sub_22DC92228();

  id v32 = v3;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  sub_22DC92228();
  id v32 = v3;
  LOBYTE(v33) = v4;
  uint64_t v34 = v5;
  if (v30 == 1) {
    char v21 = 1;
  }
  else {
    char v21 = 2;
  }
  char v31 = v21;
  sub_22DC92238();
  uint64_t v22 = *(void (**)(id, uint64_t))(v27 + *(int *)(v26 + 24));
  if (v22)
  {
    id v32 = v3;
    LOBYTE(v33) = v4;
    uint64_t v34 = v5;
    sub_22DC92228();
    uint64_t v23 = v29;
    if (v31 == 1) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = 2;
    }
    v22(v29, v24);
  }
  else
  {
    uint64_t v23 = v28;
  }
}

void sub_22DBE3BF4()
{
  uint64_t v1 = v0;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = (int *)type metadata accessor for AddToSiriView();
  uint64_t v3 = v0 + v2[8];
  char v5 = *(unsigned char *)(v3 + 8);
  uint64_t v6 = *(void *)(v3 + 16);
  id v29 = *(id *)v3;
  id v4 = v29;
  LOBYTE(v30) = v5;
  uint64_t v31 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
  sub_22DC92228();
  id v7 = objc_msgSend(v26, sel_record);

  uint64_t v30 = *(void *)(v0 + v2[9] + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268596B68);
  sub_22DC92228();
  sub_22DA4F9B4((uint64_t)v26, v28, v7);

  LOBYTE(v30) = v5;
  uint64_t v31 = v6;
  sub_22DC92228();
  id v8 = objc_msgSend(v26, sel_record);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F87000]), sel_initWithRecord_, v8);
  uint64_t v10 = *(void **)(v0 + v2[12]);
  id v29 = 0;
  id v11 = objc_msgSend(v10, sel_createWorkflowWithOptions_nameCollisionBehavior_error_, v9, 2, &v29);
  id v12 = v29;
  if (v11)
  {
    uint64_t v13 = v11;
    id v25 = v9;
    sub_22D9A6F3C(0, &qword_2685942E8);
    id v14 = v12;
    id v15 = v13;
    id v16 = v10;
    id v17 = sub_22DA194B4(v15, v16);
    id v29 = v4;
    LOBYTE(v30) = v5;
    uint64_t v31 = v6;
    id v27 = v17;
    id v22 = v17;
    sub_22DC92238();
    id v29 = v4;
    LOBYTE(v30) = v5;
    uint64_t v31 = v6;
    sub_22DC92228();
    id v23 = objc_msgSend(v27, sel_actions);

    if (!v23)
    {
      sub_22D9A6F3C(0, (unint64_t *)&qword_268596D00);
      sub_22DC92B48();
      id v23 = (id)sub_22DC92B38();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v16, sel_createSmartPromptStatesForInsertedActions_forReference_, v23, v15);

    uint64_t v24 = *(void (**)(id, void))(v1 + v2[6]);
    if (v24)
    {
      id v29 = v4;
      LOBYTE(v30) = v5;
      uint64_t v31 = v6;
      sub_22DC92228();
      v24(v27, 0);
    }
    else
    {
    }
  }
  else
  {
    id v18 = v29;
    id v19 = (void *)sub_22DC8F028();

    swift_willThrow();
    uint64_t v20 = v1 + v2[11];
    uint64_t v21 = *(void *)(v20 + 8);
    LOBYTE(v29) = *(unsigned char *)v20;
    uint64_t v30 = v21;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9B20);
    sub_22DC92238();

    swift_release();
  }
}

void sub_22DBE3FF8()
{
  id v0 = objc_msgSend(self, sel_sharedAnalytics);
  if (v0)
  {
    uint64_t v1 = v0;
    objc_msgSend(v0, sel_logEventWithType_context_, 5302, 0);

    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F868B8]), sel_init);
    type metadata accessor for AddToSiriView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859B580);
    sub_22DC92228();
    id v3 = objc_msgSend(v11, sel_record);

    id v4 = objc_msgSend(v3, sel_actions);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B6B0);
    uint64_t v5 = sub_22DC92B48();

    unint64_t v6 = *(void *)(v5 + 16);
    swift_bridgeObjectRelease();
    if (!HIDWORD(v6))
    {
      objc_msgSend(v2, sel_setActionCount_, v6);
      uint64_t v7 = sub_22DBE35A8();
      sub_22DBB494C(v7, v8, v2, (SEL *)&selRef_setAddToSiriBundleIdentifier_);
      id v9 = @"ShortcutSourceAddToSiri";
      uint64_t v10 = @"ShortcutSourceAddToSiri";
      objc_msgSend(v2, sel_setShortcutSource_, v10);

      objc_msgSend(v2, sel_track);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  sub_22DC935F8();
  __break(1u);
}

void sub_22DBE4200()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone((Class)VCUIDictationTextField), sel_init);
  objc_msgSend(v2, sel_frame);
  objc_msgSend(v2, sel_setFrame_);
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_preferredFontForTextStyle_, *MEMORY[0x263F83610]);
  id v5 = objc_msgSend(v4, sel_fontDescriptor);

  id v6 = objc_msgSend(v5, sel_fontDescriptorWithSymbolicTraits_, 2);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v7, sel_pointSize);
    id v8 = objc_msgSend(v3, sel_fontWithDescriptor_size_, v7);

    objc_msgSend(v2, sel_setFont_, v8);
    objc_msgSend(v2, sel_setTextAlignment_, 1);
    objc_msgSend(v2, sel_setReturnKeyType_, 9);
    id v9 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859B4A8);
    sub_22DC91758();
    objc_msgSend(v9, sel_setDelegate_, aBlock[0]);

    objc_msgSend(v9, sel_setScrollEnabled_, 0);
    uint64_t v10 = self;
    id v11 = v9;
    id v12 = objc_msgSend(v10, sel_clearColor);
    objc_msgSend(v11, sel_setBackgroundColor_, v12);

    objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    LODWORD(v13) = 1132068864;
    objc_msgSend(v11, sel_setContentCompressionResistancePriority_forAxis_, 0, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v11, sel_setContentCompressionResistancePriority_forAxis_, 1, v14);
    LODWORD(v15) = 1144750080;
    objc_msgSend(v11, sel_setContentHuggingPriority_forAxis_, 1, v15);
    LODWORD(v16) = 1132068864;
    objc_msgSend(v11, sel_setContentHuggingPriority_forAxis_, 0, v16);
    uint64_t v32 = v8;
    if (!*(void *)(v1 + 40))
    {
      sub_22DC929E8();
      OUTLINED_FUNCTION_66_0();
      if (qword_268592270 != -1) {
        swift_once();
      }
      id v17 = (id)qword_268595FA0;
      id v18 = (void *)sub_22DC92948();
      id v19 = (void *)sub_22DC92948();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

      _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    }
    swift_bridgeObjectRetain();
    sub_22DC929E8();
    sub_22DC929E8();
    if (qword_268592270 != -1) {
      swift_once();
    }
    id v21 = (id)qword_268595FA0;
    id v22 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v23 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    swift_bridgeObjectRetain();
    sub_22DC92A38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22D9A6F3C(0, (unint64_t *)&unk_26859B4B0);
    OUTLINED_FUNCTION_52_2();
    id v25 = sub_22D9D908C();
    id v26 = objc_msgSend(v25, sel_mutableString);
    id v27 = objc_msgSend(v25, sel_length);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = v25;
    aBlock[4] = sub_22DBE7190;
    aBlock[5] = v28;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_22DBE4AE4;
    aBlock[3] = &block_descriptor_38;
    id v29 = _Block_copy(aBlock);
    id v30 = v25;
    swift_release();
    objc_msgSend(v26, sel_enumerateSubstringsInRange_options_usingBlock_, 0, v27, 2, v29);
    _Block_release(v29);

    objc_msgSend(v11, sel_setAttributedPlaceholder_, v30);
    sub_22DC91758();
    id v31 = aBlock[0];
    v11;
    sub_22DBE4D08((uint64_t)v11);
  }
  else
  {
    __break(1u);
  }
}

void sub_22DBE4804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  sub_22DC929E8();
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v13 = (id)qword_268595FA0;
  double v14 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  double v15 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

  uint64_t v17 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v19 = v18;

  if (a2)
  {
    if (v17 == a1 && v19 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v21 = sub_22DC937E8();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        return;
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9CC0);
    uint64_t inited = swift_initStackObject();
    id v23 = (void **)MEMORY[0x263F81500];
    *(_OWORD *)(inited + 16) = xmmword_22DCB0EA0;
    id v24 = *v23;
    *(void *)(inited + 32) = *v23;
    id v25 = self;
    id v26 = v24;
    id v27 = objc_msgSend(v25, sel_labelColor);
    *(void *)(inited + 64) = sub_22D9A6F3C(0, (unint64_t *)&unk_2685969E0);
    *(void *)(inited + 40) = v27;
    _s3__C3KeyVMa_0(0);
    sub_22DBE73F8((unint64_t *)&unk_26AEF9C18, _s3__C3KeyVMa_0);
    sub_22DC92898();
    uint64_t v28 = (void *)sub_22DC92878();
    swift_bridgeObjectRelease();
    objc_msgSend(a8, sel_addAttributes_range_, v28, a3, a4);

    return;
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_22DBE4AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v13 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  swift_retain();
  v12(v13, v15, a3, a4, a5, a6, a7);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_22DBE4BA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B4A8);
  sub_22DC91758();
  sub_22DBE70D0((uint64_t)v0);
  sub_22DBE4C64(v0);

  sub_22DC91758();
  sub_22DBE4F24();
}

id sub_22DBE4C28()
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for DictationTextView.Coordinator());
  sub_22DBE70D0((uint64_t)v0);
  return sub_22DBE4D14(v0);
}

uint64_t sub_22DBE4C64(void *__src)
{
  memcpy((void *)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration), __src, 0x60uLL);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_22DBE4D08(uint64_t a1)
{
}

id sub_22DBE4D14(void *__src)
{
  v1[OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isEditing] = 0;
  v1[OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isDictating] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_textView] = 0;
  memcpy(&v1[OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration], __src, 0x60uLL);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for DictationTextView.Coordinator();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_22DBE4D84(void *a1)
{
  return swift_release();
}

void sub_22DBE4F24()
{
  uint64_t v1 = v0;
  id v2 = (long long *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration);
  uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration + 56);
  uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration + 64);
  LOBYTE(v17) = *(unsigned char *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration + 72);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B7A0);
  MEMORY[0x230F935C0](&v20, v3);
  if (v20 == 1
    && (uint64_t v4 = OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isDictating,
        (*(unsigned char *)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isDictating) & 1) == 0))
  {
    uint64_t v11 = OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_textView;
    id v12 = *(void **)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_textView);
    if (v12)
    {
      sub_22DBB494C(0, 0xE000000000000000, v12, (SEL *)&selRef_setText_);
      uint64_t v13 = *(void **)(v1 + v11);
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_msgSend(v13, sel_startDictation, v14, v16, v17);
    *(unsigned char *)(v1 + v4) = 1;
  }
  else if ((*(unsigned char *)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isEditing) & 1) == 0)
  {
    id v5 = *(void **)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_textView);
    if (v5)
    {
      long long v15 = *v2;
      uint64_t v18 = *((void *)v2 + 2);
      uint64_t v19 = *((void *)v2 + 3);
      id v6 = v5;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B1C0);
      MEMORY[0x230F935C0](&v20, v7);
      sub_22DBE534C();
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      if (v9)
      {
        uint64_t v10 = (void *)sub_22DC92948();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = 0;
      }
      objc_msgSend(v6, sel_setText_, v10, v15, v18, v19);
    }
  }
}

void sub_22DBE5098(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isEditing) = 1;
  sub_22DBE7DF8(a1);
  sub_22DBE5628();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (v4)
  {
    id v5 = (id)sub_22DC92948();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  objc_msgSend(a1, sel_setText_, v5);
}

uint64_t sub_22DBE51A8()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isEditing) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_isDictating) = 0;
  uint64_t v1 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtCV10WorkflowUI17DictationTextView11Coordinator_configuration
                                      + 80);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22DBE5270(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v6 = a4 == 10 && a5 == 0xE100000000000000;
  if (!v6 && (sub_22DC937E8() & 1) == 0) {
    return 1;
  }
  objc_msgSend(a1, sel_resignFirstResponder);
  return 0;
}

void sub_22DBE534C()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_22DC8EEB8();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11_1();
  sub_22DC929E8();
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v5 = (id)qword_268595FA0;
  BOOL v6 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_22DC92948();
  uint64_t v8 = swift_bridgeObjectRelease();
  id v9 = OUTLINED_FUNCTION_19_19(v8, sel_localizedStringForKey_value_table_);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  sub_22DC8EE88();
  swift_bridgeObjectRelease();
  if (!v1) {
    goto LABEL_7;
  }
  sub_22D9CFB38();
  sub_22DC93228();
  uint64_t v10 = (void *)sub_22DC92948();
  unsigned int v11 = objc_msgSend(v10, sel_wf_isEmpty, v3, v1);

  if (!v11)
  {
    sub_22DC929E8();
    sub_22DC929E8();
    id v14 = (id)qword_268595FA0;
    long long v15 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, 0);

    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    swift_bridgeObjectRetain();
    sub_22DC92A38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v18 = OUTLINED_FUNCTION_31_1();
    v19(v18);
    goto LABEL_8;
  }
  uint64_t v12 = OUTLINED_FUNCTION_31_1();
  v13(v12);
  swift_bridgeObjectRelease();
LABEL_8:
  OUTLINED_FUNCTION_12_0();
}

void sub_22DBE5628()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_22DC8EEB8();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_20();
  sub_22DC929E8();
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v5 = (id)qword_268595FA0;
  BOOL v6 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_22DC92948();
  uint64_t v8 = swift_bridgeObjectRelease();
  id v9 = OUTLINED_FUNCTION_19_19(v8, sel_localizedStringForKey_value_table_);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  sub_22DC8EE88();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_22D9CFB38();
    sub_22DC93228();
    OUTLINED_FUNCTION_66_0();
    uint64_t v10 = (void *)sub_22DC92948();
    unsigned int v11 = objc_msgSend(v10, sel_wf_isEmpty, v3, v1);

    uint64_t v12 = OUTLINED_FUNCTION_16_20();
    v13(v12);
    if (v11) {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_16_20();
    v15(v14);
  }
  OUTLINED_FUNCTION_52_2();
  OUTLINED_FUNCTION_12_0();
}

id sub_22DBE581C()
{
  return sub_22DBE5834(type metadata accessor for DictationTextView.Coordinator);
}

id sub_22DBE5834(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for DictationTextView.Coordinator()
{
  return self;
}

uint64_t destroy for DictationTextView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DictationTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DictationTextView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v4 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v4;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for DictationTextView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DictationTextView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DictationTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DictationTextView()
{
  return &type metadata for DictationTextView;
}

uint64_t getEnumTagSinglePayload for AddToSiriView.CompletionStatus(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AddToSiriView.CompletionStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22DBE5D08(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_22DBE5D20(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AddToSiriView.CompletionStatus()
{
  return &type metadata for AddToSiriView.CompletionStatus;
}

uint64_t *sub_22DBE5D48(uint64_t *a1, uint64_t *a2, int *a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22DC908B8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    unsigned int v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_22DC90AC8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    long long v15 = (uint64_t *)((char *)a2 + v13);
    if (*v15)
    {
      uint64_t v16 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    id v22 = (char *)a1 + v18;
    id v23 = (char *)a2 + v18;
    id v24 = *(void **)v23;
    LOBYTE(v19) = v23[8];
    *(void *)id v22 = *(void *)v23;
    v22[8] = (char)v19;
    *((void *)v22 + 2) = *((void *)v23 + 2);
    uint64_t v25 = a3[9];
    uint64_t v26 = a3[10];
    id v27 = (uint64_t *)((char *)a1 + v25);
    uint64_t v28 = (uint64_t *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *id v27 = *v28;
    v27[1] = v29;
    v27[2] = v28[2];
    id v30 = (char *)a1 + v26;
    id v31 = (char *)a2 + v26;
    *id v30 = *v31;
    *((void *)v30 + 1) = *((void *)v31 + 1);
    uint64_t v32 = a3[11];
    uint64_t v33 = a3[12];
    uint64_t v34 = (char *)a1 + v32;
    uint64_t v35 = (char *)a2 + v32;
    *uint64_t v34 = *v35;
    *((void *)v34 + 1) = *((void *)v35 + 1);
    uint64_t v36 = *(void **)((char *)a2 + v33);
    *(uint64_t *)((char *)a1 + v33) = (uint64_t)v36;
    swift_retain();
    id v37 = v24;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v38 = v36;
  }
  return a1;
}

void sub_22DBE5FEC(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_22DC908B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22DC90AC8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  if (*(void *)(a1 + a2[6])) {
    swift_release();
  }
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = *(void **)(a1 + a2[12]);
}

void *sub_22DBE6178(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22DC908B8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_22DC90AC8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  if (*v13)
  {
    uint64_t v14 = v13[1];
    void *v12 = *v13;
    v12[1] = v14;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)((char *)a1 + v15);
  uint64_t v18 = (void *)((char *)a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (char *)a1 + v16;
  uint64_t v21 = (char *)a2 + v16;
  id v22 = *(void **)v21;
  LOBYTE(v17) = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = (char)v17;
  *((void *)v20 + 2) = *((void *)v21 + 2);
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v23);
  uint64_t v26 = (void *)((char *)a2 + v23);
  uint64_t v27 = v26[1];
  void *v25 = *v26;
  v25[1] = v27;
  v25[2] = v26[2];
  uint64_t v28 = (char *)a1 + v24;
  uint64_t v29 = (char *)a2 + v24;
  *uint64_t v28 = *v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  uint64_t v30 = a3[11];
  uint64_t v31 = a3[12];
  uint64_t v32 = (char *)a1 + v30;
  uint64_t v33 = (char *)a2 + v30;
  *uint64_t v32 = *v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  uint64_t v34 = *(void **)((char *)a2 + v31);
  *(void *)((char *)a1 + v31) = v34;
  swift_retain();
  id v35 = v22;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v36 = v34;
  return a1;
}

void *sub_22DBE63CC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22D9CAD04((uint64_t)a1, &qword_268599210);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22DC908B8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_22D9CAD04((uint64_t)a1 + v7, &qword_268595688);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_22DC90AC8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a1 + v11);
  uint64_t v15 = *(void *)((char *)a2 + v11);
  if (!v14)
  {
    if (v15)
    {
      uint64_t v17 = *((void *)v13 + 1);
      void *v12 = v15;
      v12[1] = v17;
      swift_retain();
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    goto LABEL_16;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_15;
  }
  uint64_t v16 = *((void *)v13 + 1);
  void *v12 = v15;
  v12[1] = v16;
  swift_retain();
  swift_release();
LABEL_16:
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = a3[8];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void **)((char *)a2 + v22);
  char v26 = v24[8];
  uint64_t v27 = *(void **)v23;
  *(void *)uint64_t v23 = v25;
  v23[8] = v26;
  id v28 = v25;

  *((void *)v23 + 2) = *((void *)v24 + 2);
  swift_retain();
  swift_release();
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (char *)a2 + v29;
  *uint64_t v30 = *(void *)((char *)a2 + v29);
  v30[1] = *(void *)((char *)a2 + v29 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30[2] = *((void *)v31 + 2);
  swift_retain();
  swift_release();
  uint64_t v32 = a3[10];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  *uint64_t v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_retain();
  swift_release();
  uint64_t v35 = a3[11];
  id v36 = (char *)a1 + v35;
  id v37 = (char *)a2 + v35;
  char *v36 = *v37;
  *((void *)v36 + 1) = *((void *)v37 + 1);
  swift_retain();
  swift_release();
  uint64_t v38 = a3[12];
  id v39 = *(void **)((char *)a2 + v38);
  id v40 = *(void **)((char *)a1 + v38);
  *(void *)((char *)a1 + v38) = v39;
  id v41 = v39;

  return a1;
}

char *sub_22DBE66C8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_22DC908B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_22DC90AC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  if (*(void *)v15)
  {
    uint64_t v17 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = v16;
    *((void *)v14 + 1) = v17;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v18 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *((void *)v19 + 2) = *((void *)v20 + 2);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v21];
  uint64_t v24 = &a2[v21];
  *((void *)v23 + 2) = *((void *)v24 + 2);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *(_OWORD *)&a1[v22] = *(_OWORD *)&a2[v22];
  uint64_t v25 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(void *)&a1[v25] = *(void *)&a2[v25];
  return a1;
}

char *sub_22DBE68BC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22D9CAD04((uint64_t)a1, &qword_268599210);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22DC908B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_22D9CAD04((uint64_t)&a1[v8], &qword_268595688);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_22DC90AC8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void *)&a1[v13];
  uint64_t v17 = *(void *)&a2[v13];
  if (!v16)
  {
    if (v17)
    {
      uint64_t v19 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = v17;
      *((void *)v14 + 1) = v19;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_15;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v18 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v18;
  swift_release();
LABEL_15:
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  char v23 = a2[v20 + 8];
  uint64_t v24 = *(void **)&a1[v20];
  *(void *)uint64_t v21 = *(void *)&a2[v20];
  v21[8] = v23;

  *((void *)v21 + 2) = *((void *)v22 + 2);
  swift_release();
  uint64_t v25 = a3[9];
  char v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = *(void *)&a2[v25 + 8];
  *(void *)char v26 = *(void *)&a2[v25];
  *((void *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
  *((void *)v26 + 2) = *((void *)v27 + 2);
  swift_release();
  uint64_t v29 = a3[10];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *uint64_t v30 = *v31;
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_release();
  uint64_t v32 = a3[11];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  *uint64_t v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_release();
  uint64_t v35 = a3[12];
  id v36 = *(void **)&a1[v35];
  *(void *)&a1[v35] = *(void *)&a2[v35];

  return a1;
}

uint64_t sub_22DBE6B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22DBE6B8C);
}

uint64_t sub_22DBE6B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B460);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B468);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_22DBE6C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22DBE6C5C);
}

void sub_22DBE6C5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B460);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B468);
    OUTLINED_FUNCTION_9();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for AddToSiriView()
{
  uint64_t result = qword_26859B478;
  if (!qword_26859B478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22DBE6D5C()
{
  sub_22DBE6E98(319, (unint64_t *)&qword_268595510, MEMORY[0x263F18520]);
  if (v0 <= 0x3F)
  {
    sub_22DBE6E98(319, (unint64_t *)&unk_26859B490, MEMORY[0x263F18948]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_22DBE6E98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    OUTLINED_FUNCTION_13_19();
    unint64_t v4 = sub_22DC908D8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_22DBE6EE8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22DBE6F08()
{
  memcpy(v1, v0, sizeof(v1));
  sub_22DBE4BA4();
}

id sub_22DBE6F4C@<X0>(void *a1@<X8>)
{
  memcpy(v4, v1, sizeof(v4));
  id result = sub_22DBE4C28();
  *a1 = result;
  return result;
}

uint64_t sub_22DBE6F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBE71A0();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22DBE6FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBE71A0();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22DBE7058()
{
}

unint64_t sub_22DBE7084()
{
  unint64_t result = qword_26859B4A0;
  if (!qword_26859B4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B4A0);
  }
  return result;
}

uint64_t sub_22DBE70D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22DBE7158()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22DBE7190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_22DBE4804(a1, a2, a3, a4, a5, a6, a7, *(void **)(v7 + 16));
}

uint64_t block_destroy_helper_33()
{
  return swift_release();
}

unint64_t sub_22DBE71A0()
{
  unint64_t result = qword_26859B4C0;
  if (!qword_26859B4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B4C0);
  }
  return result;
}

uint64_t sub_22DBE71EC@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBDD068(*(void *)(v1 + 16), a1);
}

unint64_t sub_22DBE71F4()
{
  unint64_t result = qword_26859B4E8;
  if (!qword_26859B4E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B4E0);
    sub_22DBE7270();
    sub_22DBE7440();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B4E8);
  }
  return result;
}

unint64_t sub_22DBE7270()
{
  unint64_t result = qword_26859B4F0;
  if (!qword_26859B4F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B4F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B500);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B508);
    sub_22D9A6FA0((unint64_t *)&unk_26859B510, &qword_26859B500);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268599220);
    sub_22D9A6FA0((unint64_t *)&unk_268596BB0, &qword_268599220);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_22DBE73F8((unint64_t *)&qword_2685923D0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B4F0);
  }
  return result;
}

uint64_t sub_22DBE73F8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22DBE7440()
{
  unint64_t result = qword_26859B520;
  if (!qword_26859B520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B528);
    sub_22DBE74EC();
    sub_22DBE73F8((unint64_t *)&qword_2685923D0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B520);
  }
  return result;
}

unint64_t sub_22DBE74EC()
{
  unint64_t result = qword_26859B530;
  if (!qword_26859B530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B540);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B548);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268599220);
    sub_22D9A6FA0(&qword_26859B550, &qword_26859B548);
    sub_22D9A6FA0((unint64_t *)&unk_268596BB0, &qword_268599220);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B530);
  }
  return result;
}

uint64_t sub_22DBE7644@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBDE05C(*(void *)(v1 + 16), a1);
}

uint64_t sub_22DBE764C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddToSiriView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBE76B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddToSiriView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBE7718()
{
  return sub_22DBE7794((uint64_t (*)(uint64_t))sub_22DBE16D8);
}

uint64_t sub_22DBE7734(uint64_t a1)
{
  return sub_22DBE78D0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_22DBDF7AC);
}

uint64_t sub_22DBE7750()
{
  return sub_22DBE7794((uint64_t (*)(uint64_t))sub_22DBE0FB8);
}

uint64_t sub_22DBE777C()
{
  return sub_22DBE7794((uint64_t (*)(uint64_t))sub_22DBE13E0);
}

uint64_t sub_22DBE7794(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for AddToSiriView();
  uint64_t v3 = OUTLINED_FUNCTION_1_1(v2);
  return a1(v3);
}

uint64_t sub_22DBE77D8@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBDF96C(*(void *)(v1 + 16), a1);
}

uint64_t sub_22DBE77EC()
{
  return sub_22DBE7B54((uint64_t (*)(uint64_t))sub_22DBE03DC);
}

uint64_t sub_22DBE7808()
{
  return sub_22DBE7B54((uint64_t (*)(uint64_t))sub_22DBDEC74);
}

uint64_t sub_22DBE7820(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddToSiriView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DBE7880()
{
  return sub_22DBE7B54(sub_22DBE3404);
}

uint64_t sub_22DBE789C()
{
  return sub_22DBE7B54((uint64_t (*)(uint64_t))sub_22DBE3448);
}

uint64_t sub_22DBE78B8(uint64_t a1)
{
  return sub_22DBE78D0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_22DBE243C);
}

uint64_t sub_22DBE78D0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = type metadata accessor for AddToSiriView();
  OUTLINED_FUNCTION_1_1(v4);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a2(a1, v6);
}

uint64_t objectdestroy_32Tm()
{
  uint64_t v1 = (int *)type metadata accessor for AddToSiriView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22DC908B8();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_10();
    v6();
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268595688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22DC90AC8();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_10();
    v7();
  }
  else
  {
    swift_release();
  }
  if (*(void *)(v5 + v1[6])) {
    swift_release();
  }
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22DBE7B3C()
{
  return sub_22DBE7B54((uint64_t (*)(uint64_t))sub_22DBE2F50);
}

uint64_t sub_22DBE7B54(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for AddToSiriView();
  OUTLINED_FUNCTION_1_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

unint64_t sub_22DBE7BA8()
{
  unint64_t result = qword_26859B710;
  if (!qword_26859B710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268597F58);
    sub_22D9A6FA0((unint64_t *)&unk_26859B720, &qword_2685994A0);
    sub_22D9A6FA0((unint64_t *)&unk_26AEF9AB0, (uint64_t *)&unk_26AEF9AC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B710);
  }
  return result;
}

uint64_t sub_22DBE7C74@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBE2604(*(void *)(v1 + 16), a1);
}

uint64_t sub_22DBE7C7C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22DBE7CF8()
{
  unint64_t result = qword_26859B758;
  if (!qword_26859B758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B760);
    sub_22D9A6FA0(&qword_26859B768, &qword_26859B770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B758);
  }
  return result;
}

unint64_t sub_22DBE7D98()
{
  unint64_t result = qword_26859B788;
  if (!qword_26859B788)
  {
    sub_22D9A6F3C(255, (unint64_t *)&unk_26859B560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B788);
  }
  return result;
}

uint64_t sub_22DBE7DF8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_text);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

  return v3;
}

void sub_22DBE7E5C(id a1, char a2)
{
  if (a2 != -1) {
}
  }

uint64_t sub_22DBE7E70()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22DBE7EA8(void *a1, char a2)
{
  sub_22DBDC45C(a1, a2, v2);
}

void sub_22DBE7EB0(void *a1, char a2)
{
  sub_22DBDC4D0(a1, a2, v2);
}

ValueMetadata *type metadata accessor for AddToSiriView.Status()
{
  return &type metadata for AddToSiriView.Status;
}

unint64_t sub_22DBE7EDC()
{
  unint64_t result = qword_26859B7B8;
  if (!qword_26859B7B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26859B7C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B4D0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B4C8);
    sub_22DC91668();
    sub_22D9A6FA0(&qword_26859B558, &qword_26859B4C8);
    sub_22DBE73F8(&qword_2685989C0, MEMORY[0x263F1A128]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_22DBE73F8((unint64_t *)&qword_2685923D0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B7B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_16_20()
{
  return v0;
}

uint64_t getEnumTagSinglePayload for ImagePickerView(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 65281 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65281 < 0xFF0000) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((unsigned char *)a1 + 2)) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 16)) - 65282;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ImagePickerView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22DBE81F0);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImagePickerView()
{
  return &type metadata for ImagePickerView;
}

uint64_t sub_22DBE8228()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DBE8244(__int16 a1)
{
  uint64_t v39 = sub_22DC91748();
  OUTLINED_FUNCTION_1_0();
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_11_1();
  uint64_t v37 = v5 - v4;
  sub_22DC91238();
  OUTLINED_FUNCTION_1_0();
  uint64_t v35 = v7;
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_22DC90E78();
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_11_1();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B7D0);
  MEMORY[0x270FA5388](v18 - 8);
  OUTLINED_FUNCTION_11_1();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B7D8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_11_1();
  uint64_t v26 = v25 - v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B7E0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_11_1();
  uint64_t v30 = v29 - v28;
  *(void *)uint64_t v21 = sub_22DC91258();
  *(void *)(v21 + 8) = 0;
  *(unsigned char *)(v21 + 16) = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B7E8);
  sub_22DBE856C(a1 & 0x1FF, v21 + *(int *)(v31 + 44));
  sub_22DC90E68();
  uint64_t v32 = (unsigned char *)(v26 + *(int *)(v22 + 36));
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(&v32[*(int *)(v33 + 40)], v17, v11);
  *uint64_t v32 = 0;
  sub_22D9CC3C8(v21, v26, &qword_26859B7D0);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  sub_22D9CC550(v21, &qword_26859B7D0);
  sub_22DC91218();
  sub_22DBE9074();
  sub_22DC91E68();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v10, v36);
  sub_22D9CC550(v26, &qword_26859B7D8);
  sub_22DC91728();
  sub_22DBE9138();
  sub_22DC91E38();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
  return sub_22D9CC550(v30, &qword_26859B7E0);
}

uint64_t sub_22DBE856C@<X0>(__int16 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268597090);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v52 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)&v49 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B818);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B820);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B828);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B830);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v54 = (uint64_t)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B838) - 8;
  uint64_t v21 = MEMORY[0x270FA5388](v57);
  id v49 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v55 = (uint64_t)&v49 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v56 = (uint64_t)&v49 - v25;
  *(void *)uint64_t v9 = sub_22DC91188();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v26 = (uint64_t)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859B840) + 44)];
  int v53 = a1 & 0x1FF;
  sub_22DBE8ADC(v26);
  char v27 = sub_22DC91918();
  sub_22D9CC3C8((uint64_t)v9, (uint64_t)v13, &qword_26859B818);
  uint64_t v28 = &v13[*(int *)(v11 + 44)];
  *uint64_t v28 = v27;
  *(_OWORD *)(v28 + 8) = 0u;
  *(_OWORD *)(v28 + 24) = 0u;
  v28[40] = 1;
  sub_22D9CC550((uint64_t)v9, &qword_26859B818);
  sub_22DC92598();
  sub_22DC90E38();
  sub_22D9CC3C8((uint64_t)v13, (uint64_t)v17, &qword_26859B820);
  memcpy(&v17[*(int *)(v15 + 44)], __src, 0x70uLL);
  sub_22D9CC550((uint64_t)v13, &qword_26859B820);
  uint64_t v29 = sub_22DC920F8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = v54;
  sub_22D9CC3C8((uint64_t)v17, v54, &qword_26859B828);
  uint64_t v32 = (uint64_t *)(v31 + *(int *)(v19 + 44));
  *uint64_t v32 = KeyPath;
  v32[1] = v29;
  sub_22D9CC550((uint64_t)v17, &qword_26859B828);
  uint64_t v33 = self;
  uint64_t v34 = &selRef_systemBackgroundColor;
  if ((a1 & 0x100) != 0) {
    uint64_t v34 = &selRef_systemGray4Color;
  }
  uint64_t v35 = MEMORY[0x230F932C0]([v33 *v34]);
  uint64_t v36 = sub_22DBE8E14(v53);
  uint64_t v37 = v55;
  sub_22D9CC3C8(v31, v55, &qword_26859B830);
  uint64_t v38 = v37 + *(int *)(v57 + 44);
  *(void *)uint64_t v38 = v35;
  *(void *)(v38 + 8) = v36;
  *(_WORD *)(v38 + 16) = 256;
  sub_22D9CC550(v31, &qword_26859B830);
  uint64_t v39 = v56;
  sub_22DBE91EC(v37, v56);
  if (off_26E195CB8
    && (int v40 = *((unsigned __int8 *)&unk_26E195CC7 + (void)off_26E195CB8), v40 != 3)
    && v40 == a1)
  {
    uint64_t v41 = 1;
    uint64_t v43 = v51;
    uint64_t v42 = (uint64_t)v52;
    uint64_t v44 = (uint64_t)v50;
  }
  else
  {
    uint64_t v44 = (uint64_t)v50;
    sub_22DC923B8();
    uint64_t v41 = 0;
    uint64_t v43 = v51;
    uint64_t v42 = (uint64_t)v52;
  }
  uint64_t v45 = (uint64_t)v49;
  uint64_t v46 = sub_22DC923C8();
  __swift_storeEnumTagSinglePayload(v44, v41, 1, v46);
  sub_22D9CC3C8(v39, v45, &qword_26859B838);
  sub_22D9CC3C8(v44, v42, &qword_268597090);
  sub_22D9CC3C8(v45, v43, &qword_26859B838);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B848);
  sub_22D9CC3C8(v42, v43 + *(int *)(v47 + 48), &qword_268597090);
  sub_22D9CC550(v44, &qword_268597090);
  sub_22D9CC550(v39, &qword_26859B838);
  sub_22D9CC550(v42, &qword_268597090);
  return sub_22D9CC550(v45, &qword_26859B838);
}

uint64_t sub_22DBE8ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B858);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v31 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v30 = (char *)&v29 - v5;
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v6 = (id)qword_268595FA0;
  uint64_t v7 = (void *)sub_22DC92948();
  uint64_t v8 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  uint64_t v10 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v12 = v11;

  uint64_t v32 = v10;
  uint64_t v33 = v12;
  sub_22D9CFB38();
  uint64_t v13 = sub_22DC91BB8();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = sub_22DC92178();
  uint64_t v21 = sub_22DC92598();
  uint64_t v23 = v22;
  v17 &= 1u;
  uint64_t v24 = sub_22DC92178();
  uint64_t v32 = v20;
  uint64_t v33 = 0;
  uint64_t v34 = v24;
  uint64_t v35 = v21;
  uint64_t v36 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B860);
  sub_22DBE929C();
  uint64_t v25 = (uint64_t)v30;
  sub_22DC91E18();
  swift_release();
  swift_release();
  uint64_t v26 = v31;
  sub_22D9CC3C8(v25, v31, &qword_26859B858);
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B890);
  sub_22D9CC3C8(v26, a1 + *(int *)(v27 + 64), &qword_26859B858);
  sub_22D9CFBC8(v13, v15, v17);
  swift_bridgeObjectRetain();
  sub_22D9CC550(v25, &qword_26859B858);
  sub_22D9CC550(v26, &qword_26859B858);
  sub_22D9CFC1C(v13, v15, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBE8E14(unsigned __int8 a1)
{
  uint64_t v2 = sub_22DC915A8();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (uint64_t *)((char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_268592240 != -1) {
    swift_once();
  }
  if (off_26E195CB8) {
    BOOL v5 = byte_26E195CC8 == a1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5
    || off_26E195CB8
    && ((v6 = *((unsigned __int8 *)&unk_26E195CC7 + (void)off_26E195CB8), v6 != 3) ? (BOOL v7 = v6 == a1) : (BOOL v7 = 0), v7))
  {
    id v9 = (char *)v4 + *(int *)(v2 + 20);
    uint64_t v10 = *MEMORY[0x263F19860];
    uint64_t v11 = sub_22DC911E8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
    sub_22DC91478();
    *uint64_t v4 = v12;
    v4[1] = v13;
    v4[2] = v14;
    v4[3] = v15;
    sub_22DBE9254(&qword_26859B850, MEMORY[0x263F19EE8]);
    return sub_22DC92448();
  }
  else
  {
    sub_22DAB3674();
    return sub_22DC92448();
  }
}

uint64_t sub_22DBE9058()
{
  if (v0[1]) {
    __int16 v1 = 256;
  }
  else {
    __int16 v1 = 0;
  }
  return sub_22DBE8244(v1 | *v0);
}

unint64_t sub_22DBE9074()
{
  unint64_t result = qword_26859B7F8;
  if (!qword_26859B7F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B7D8);
    sub_22D9A6FA0(&qword_26859B800, &qword_26859B7D0);
    sub_22D9A6FA0(&qword_26859B808, &qword_26859B7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B7F8);
  }
  return result;
}

unint64_t sub_22DBE9138()
{
  unint64_t result = qword_26859B810;
  if (!qword_26859B810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B7E0);
    sub_22DBE9074();
    sub_22DBE9254((unint64_t *)&qword_2685923D0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B810);
  }
  return result;
}

uint64_t sub_22DBE91EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBE9254(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22DBE929C()
{
  unint64_t result = qword_26859B868;
  if (!qword_26859B868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B860);
    sub_22DBE933C();
    sub_22D9A6FA0(&qword_26859B880, &qword_26859B888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B868);
  }
  return result;
}

unint64_t sub_22DBE933C()
{
  unint64_t result = qword_26859B870;
  if (!qword_26859B870)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B870);
  }
  return result;
}

uint64_t sub_22DBE93B0()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 GalleryView.init(destination:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 v9 = *a1;
  unint64_t v3 = a1[1].n128_u64[0];
  unint64_t v4 = a1[1].n128_u64[1];
  unsigned __int8 v5 = a1[2].n128_u8[0];
  type metadata accessor for GallerySearchManager(0);
  sub_22DBEB234(&qword_26AEF8A58, (void (*)(uint64_t))type metadata accessor for GallerySearchManager);
  uint64_t v6 = sub_22DC90EA8();
  __n128 result = v9;
  *a2 = v9;
  a2[1].n128_u64[0] = v3;
  a2[1].n128_u64[1] = v4;
  a2[2].n128_u8[0] = v5;
  a2[2].n128_u64[1] = v6;
  a2[3].n128_u64[0] = v8;
  return result;
}

uint64_t sub_22DBE94B4()
{
  sub_22DC8FB98();
  swift_allocObject();
  uint64_t result = sub_22DC8FB88();
  qword_26859B898 = result;
  return result;
}

uint64_t GalleryView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v7[0] = *(_OWORD *)v1;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 48);
  *a1 = sub_22DC92598();
  a1[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8A0);
  return sub_22DBE9564((uint64_t)v7, (uint64_t *)((char *)a1 + *(int *)(v5 + 44)));
}

uint64_t sub_22DBE9564@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8B8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8C0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  __n128 v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8C8);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8D0);
  uint64_t v14 = MEMORY[0x270FA5388](v33);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v32 = (uint64_t)&v32 - v17;
  int v34 = sub_22DC91928();
  sub_22DBEAB60(a1);
  sub_22DBE98F4(a1, (uint64_t)v5);
  uint64_t v18 = sub_22DC92598();
  uint64_t v20 = v19;
  sub_22D9D5140((uint64_t)v5, (uint64_t)v9, &qword_26859B8B8);
  uint64_t v21 = &v9[*(int *)(v7 + 44)];
  *(_WORD *)uint64_t v21 = 256;
  *((void *)v21 + 1) = v18;
  *((void *)v21 + 2) = v20;
  sub_22D9D51A4((uint64_t)v5, &qword_26859B8B8);
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v22 + 32) = v23;
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v22 + 64) = *(void *)(a1 + 48);
  sub_22D9D5140((uint64_t)v9, (uint64_t)v13, &qword_26859B8C0);
  uint64_t v24 = (uint64_t (**)())&v13[*(int *)(v11 + 44)];
  *uint64_t v24 = sub_22DBEABEC;
  v24[1] = (uint64_t (*)())v22;
  v24[2] = 0;
  v24[3] = 0;
  sub_22DBEAB60(a1);
  sub_22D9D51A4((uint64_t)v9, &qword_26859B8C0);
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_268592380 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_26859B898;
  sub_22D9D5140((uint64_t)v13, (uint64_t)v16, &qword_26859B8C8);
  uint64_t v27 = (uint64_t *)&v16[*(int *)(v33 + 36)];
  *uint64_t v27 = KeyPath;
  v27[1] = v26;
  swift_retain();
  sub_22D9D51A4((uint64_t)v13, &qword_26859B8C8);
  sub_22DBEABFC(a1);
  uint64_t v28 = v32;
  sub_22DBEAC40((uint64_t)v16, v32);
  sub_22D9D5140(v28, (uint64_t)v16, &qword_26859B8D0);
  uint64_t v29 = v35;
  *uint64_t v35 = 256;
  *((unsigned char *)v29 + 2) = v34;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8D8);
  sub_22D9D5140((uint64_t)v16, (uint64_t)v29 + *(int *)(v30 + 48), &qword_26859B8D0);
  sub_22D9D51A4(v28, &qword_26859B8D0);
  return sub_22D9D51A4((uint64_t)v16, &qword_26859B8D0);
}

uint64_t sub_22DBE98D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DBE98F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for GallerySearchResultsView(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v53 - v11;
  if (!*(void *)(a1 + 40))
  {
    sub_22DBEAB60(a1);
    type metadata accessor for GallerySearchManager(0);
    sub_22DBEB234(&qword_26AEF8A58, (void (*)(uint64_t))type metadata accessor for GallerySearchManager);
    sub_22DC90E98();
    __break(1u);
    JUMPOUT(0x22DBEA7F0);
  }
  swift_retain();
  char v13 = sub_22DB79990();
  swift_release();
  if (v13)
  {
    type metadata accessor for GallerySearchManager(0);
    sub_22DBEB234(&qword_26AEF8A58, (void (*)(uint64_t))type metadata accessor for GallerySearchManager);
    *uint64_t v10 = sub_22DC90EA8();
    v10[1] = v14;
    uint64_t v15 = (uint64_t *)((char *)v10 + *(int *)(v7 + 20));
    *uint64_t v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268599F70);
    swift_storeEnumTagMultiPayload();
    sub_22DBEB284((uint64_t)v10, (uint64_t)v12);
    sub_22DBEB2E8((uint64_t)v12, (uint64_t)v6);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859B930);
    sub_22DBEB234(&qword_26859B938, (void (*)(uint64_t))type metadata accessor for GallerySearchResultsView);
    sub_22DBEAD20(&qword_26859B940, &qword_26859B930, (void (*)(void))sub_22DBEACA8, (void (*)(void))sub_22DBEAE7C);
    sub_22DC91418();
    return sub_22DBEB34C((uint64_t)v12);
  }
  else
  {
    uint64_t v64 = v4;
    uint64_t v65 = v7;
    uint64_t v66 = a2;
    uint64_t v18 = *(void **)a1;
    uint64_t v17 = *(void **)(a1 + 8);
    uint64_t v20 = *(void **)(a1 + 16);
    uint64_t v19 = *(void **)(a1 + 24);
    unsigned int v21 = *(unsigned __int8 *)(a1 + 32);
    switch(v21 >> 5)
    {
      case 1u:
        swift_bridgeObjectRetain();
        uint64_t v62 = v21 & 1;
        sub_22D9BFD5C(v20, v19, v21 & 1);
        swift_bridgeObjectRelease();
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v60 = KeyPath;
        *(void *)&long long v73 = 1;
        sub_22D9BFD5C(v20, v19, v21 & 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B948);
        sub_22DC92218();
        long long v40 = v76;
        *(void *)&long long v76 = v20;
        *((void *)&v76 + 1) = v19;
        id v61 = (id)(v21 & 1 | 0x80);
        *(void *)v77 = v61;
        *(void *)&v77[8] = KeyPath;
        *(_OWORD *)&v77[16] = 0uLL;
        *(_OWORD *)&v77[32] = v40;
        uint64_t v58 = *((void *)&v40 + 1);
        id v59 = (id)v40;
        v77[48] = 0;
        sub_22DB44B54(v20, v19, v21 & 1 | 0x80);
        sub_22DAB7268(KeyPath, 0, 0);
        sub_22DB4D550((id)v40);
        sub_22DBEADF4();
        sub_22DAB89E4();
        id v63 = v19;
        swift_retain();
        sub_22DC91418();
        long long v76 = v73;
        *(_OWORD *)v77 = *(_OWORD *)v74;
        *(_OWORD *)&v77[16] = *(_OWORD *)&v74[16];
        *(_OWORD *)&v77[32] = *(_OWORD *)&v74[32];
        v77[48] = v74[48];
        v77[49] = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B900);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B920);
        sub_22DBEACE4();
        sub_22DBEAE40();
        sub_22DC91418();
        uint64_t v41 = *((void *)&v67 + 1);
        long long v42 = v68;
        uint64_t v43 = v69;
        char v44 = v71;
        char v45 = v72;
        if (v72) {
          __int16 v46 = 256;
        }
        else {
          __int16 v46 = 0;
        }
        long long v73 = v67;
        uint64_t v54 = v67;
        *(_OWORD *)v74 = v68;
        *(_OWORD *)&v74[16] = v69;
        uint64_t v57 = *((void *)&v69 + 1);
        uint64_t v56 = v70;
        *(_OWORD *)&v74[32] = v70;
        uint64_t v55 = *((void *)&v70 + 1);
        *(_WORD *)&v74[48] = v46 | v71;
        char v75 = 0;
        sub_22DBEB05C(v67, *((uint64_t *)&v67 + 1), v68, *((uint64_t *)&v68 + 1), v69, *((uint64_t *)&v69 + 1), v70, *((uint64_t *)&v70 + 1), v71, v72, (uint64_t (*)(void))sub_22DBEAED8, (uint64_t (*)(void))sub_22DBEAF94);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E8);
        sub_22DBEACA8();
        sub_22DBEAE7C();
        sub_22DC91418();
        uint64_t v47 = v63;
        sub_22D9B9D98(v20, v63, v62);
        sub_22DBEB05C(v54, v41, v42, *((uint64_t *)&v42 + 1), v43, v57, v56, v55, v44, v45, (uint64_t (*)(void))sub_22DBEB090, (uint64_t (*)(void))sub_22DBEB158);
        sub_22DB44BC8(v20, v47, (char)v61);
        sub_22DA84968(v60, 0, 0);
        sub_22DBEB148(v59);
        goto LABEL_24;
      case 2u:
        uint64_t v36 = swift_getKeyPath();
        uint64_t v37 = swift_getKeyPath();
        *(void *)&long long v76 = v18;
        *((void *)&v76 + 1) = v36;
        *(void *)v77 = 0;
        *(void *)&v77[8] = v37;
        memset(&v77[16], 0, 32);
        v77[48] = 1;
        sub_22DA0AB30(v18, v17, v20, v19, v21);
        sub_22DA0AB30(v18, v17, v20, v19, v21);
        sub_22DBEADF4();
        id v63 = v19;
        sub_22DAB89E4();
        swift_retain();
        swift_retain();
        sub_22DC91418();
        long long v76 = v73;
        *(_OWORD *)v77 = *(_OWORD *)v74;
        *(_OWORD *)&v77[16] = *(_OWORD *)&v74[16];
        *(_OWORD *)&v77[32] = *(_OWORD *)&v74[32];
        v77[48] = v74[48];
        v77[49] = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B900);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B920);
        sub_22DBEACE4();
        sub_22DBEAE40();
        sub_22DC91418();
        if (v72) {
          __int16 v38 = 256;
        }
        else {
          __int16 v38 = 0;
        }
        long long v73 = v67;
        *(_OWORD *)v74 = v68;
        *(_OWORD *)&v74[16] = v69;
        *(_OWORD *)&v74[32] = v70;
        *(_WORD *)&v74[48] = v38 | v71;
        char v75 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E8);
        sub_22DBEACA8();
        sub_22DBEAE7C();
        sub_22DC91418();
        sub_22D9B9C80(v18, v17, v20, v63, v21);
        swift_release();
        goto LABEL_24;
      case 3u:
        *(void *)&long long v73 = *(void *)a1;
        *((void *)&v73 + 1) = v17;
        *(void *)v74 = v20;
        memset(&v74[8], 0, 42);
        char v75 = 1;
        sub_22DA0AB08(v18, v17, (char)v20);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E8);
        sub_22DBEACA8();
        sub_22DBEAE7C();
        sub_22DC91418();
        goto LABEL_25;
      case 4u:
        if (qword_268592370 != -1) {
          swift_once();
        }
        type metadata accessor for GalleryLoader();
        sub_22DBEB234(&qword_26859B950, (void (*)(uint64_t))type metadata accessor for GalleryLoader);
        swift_retain();
        uint64_t v31 = sub_22DC90BA8();
        uint64_t v33 = v32;
        uint64_t v34 = swift_getKeyPath();
        *(void *)&long long v76 = v31;
        *((void *)&v76 + 1) = v33;
        *(void *)v77 = v34;
        memset(&v77[8], 0, 41);
        sub_22DBEADA8();
        sub_22DBEADF4();
        swift_retain();
        swift_retain();
        sub_22DC91418();
        long long v76 = v73;
        *(_OWORD *)v77 = *(_OWORD *)v74;
        *(_OWORD *)&v77[16] = *(_OWORD *)&v74[16];
        *(_OWORD *)&v77[32] = *(_OWORD *)&v74[32];
        *(_WORD *)&v77[48] = v74[48];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B900);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B920);
        sub_22DBEACE4();
        sub_22DBEAE40();
        sub_22DC91418();
        if (v72) {
          __int16 v35 = 256;
        }
        else {
          __int16 v35 = 0;
        }
        long long v73 = v67;
        *(_OWORD *)v74 = v68;
        *(_OWORD *)&v74[16] = v69;
        *(_OWORD *)&v74[32] = v70;
        *(_WORD *)&v74[48] = v35 | v71;
        char v75 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E8);
        sub_22DBEACA8();
        sub_22DBEAE7C();
        sub_22DC91418();
        swift_release();
        goto LABEL_24;
      default:
        id v22 = v20;
        uint64_t v23 = swift_getKeyPath();
        *(void *)&long long v73 = 1;
        id v63 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B948);
        sub_22DC92218();
        long long v24 = v76;
        long long v76 = (unint64_t)v20;
        *(void *)v77 = 0;
        *(void *)&v77[8] = v23;
        uint64_t v62 = v23;
        *(_OWORD *)&v77[16] = 0uLL;
        *(_OWORD *)&v77[32] = v24;
        uint64_t v60 = *((void *)&v24 + 1);
        id v61 = (id)v24;
        v77[48] = 1;
        sub_22DB44B54(v20, 0, 0);
        sub_22DAB7268(v23, 0, 0);
        sub_22DB4D550((id)v24);
        sub_22DBEADA8();
        sub_22DBEADF4();
        swift_retain();
        sub_22DC91418();
        long long v76 = v73;
        *(_OWORD *)v77 = *(_OWORD *)v74;
        *(_OWORD *)&v77[16] = *(_OWORD *)&v74[16];
        *(_OWORD *)&v77[32] = *(_OWORD *)&v74[32];
        *(_WORD *)&v77[48] = v74[48];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B900);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B920);
        sub_22DBEACE4();
        sub_22DBEAE40();
        sub_22DC91418();
        uint64_t v25 = *((void *)&v68 + 1);
        long long v26 = v69;
        id v59 = v20;
        long long v27 = v70;
        char v28 = v71;
        char v29 = v72;
        if (v72) {
          __int16 v30 = 256;
        }
        else {
          __int16 v30 = 0;
        }
        long long v73 = v67;
        uint64_t v58 = *((void *)&v67 + 1);
        uint64_t v56 = v67;
        uint64_t v57 = v68;
        *(_OWORD *)v74 = v68;
        *(_OWORD *)&v74[16] = v69;
        *(_OWORD *)&v74[32] = v70;
        *(_WORD *)&v74[48] = v30 | v71;
        char v75 = 0;
        sub_22DBEB05C(v67, *((uint64_t *)&v67 + 1), v68, *((uint64_t *)&v68 + 1), v69, *((uint64_t *)&v69 + 1), v70, *((uint64_t *)&v70 + 1), v71, v72, (uint64_t (*)(void))sub_22DBEAED8, (uint64_t (*)(void))sub_22DBEAF94);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8E8);
        sub_22DBEACA8();
        sub_22DBEAE7C();
        sub_22DC91418();

        sub_22DBEB05C(v56, v58, v57, v25, v26, *((uint64_t *)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, (uint64_t (*)(void))sub_22DBEB090, (uint64_t (*)(void))sub_22DBEB158);
        sub_22DB44BC8(v59, 0, 0);
        sub_22DA84968(v62, 0, 0);
        sub_22DBEB148(v61);
LABEL_24:
        swift_release();
LABEL_25:
        long long v48 = *(_OWORD *)v77;
        long long v49 = *(_OWORD *)&v77[16];
        long long v50 = *(_OWORD *)&v77[32];
        __int16 v51 = *(_WORD *)&v77[48];
        char v52 = v78;
        *(_OWORD *)uint64_t v6 = v76;
        *((_OWORD *)v6 + 1) = v48;
        *((_OWORD *)v6 + 2) = v49;
        *((_OWORD *)v6 + 3) = v50;
        *((_WORD *)v6 + 32) = v51;
        v6[66] = v52;
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859B930);
        sub_22DBEB234(&qword_26859B938, (void (*)(uint64_t))type metadata accessor for GallerySearchResultsView);
        sub_22DBEAD20(&qword_26859B940, &qword_26859B930, (void (*)(void))sub_22DBEACA8, (void (*)(void))sub_22DBEAE7C);
        uint64_t result = sub_22DC91418();
        break;
    }
  }
  return result;
}

uint64_t sub_22DBEA804()
{
  if (qword_268592380 != -1) {
    swift_once();
  }
  return sub_22DC8FB78();
}

uint64_t destroy for GalleryView(uint64_t a1)
{
  sub_22D9B9C80(*(void **)a1, *(id *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(unsigned char *)(a1 + 32));
  return swift_release();
}

uint64_t initializeWithCopy for GalleryView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void **)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_22DA0AB30(*(id *)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GalleryView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void **)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 32);
  sub_22DA0AB30(*(id *)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void **)a1;
  uint64_t v10 = *(void **)(a1 + 8);
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void **)(a1 + 24);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  unsigned __int8 v13 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v8;
  sub_22D9B9C80(v9, v10, v11, v12, v13);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for GalleryView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v7 = *(void **)(a1 + 16);
  unsigned __int8 v8 = *(void **)(a1 + 24);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v4;
  sub_22D9B9C80(v5, v6, v7, v8, v10);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for GalleryView(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 40);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GalleryView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GalleryView()
{
  return &type metadata for GalleryView;
}

unint64_t sub_22DBEAB0C()
{
  unint64_t result = qword_26859B8A8;
  if (!qword_26859B8A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859B8B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B8A8);
  }
  return result;
}

uint64_t sub_22DBEAB60(uint64_t a1)
{
  return a1;
}

uint64_t sub_22DBEABA4()
{
  sub_22D9B9C80(*(void **)(v0 + 16), *(id *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(unsigned char *)(v0 + 48));
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22DBEABEC()
{
  return sub_22DBEA804();
}

uint64_t sub_22DBEABFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_22DBEAC40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBEACA8()
{
  return sub_22DBEAD20(&qword_26859B8F0, &qword_26859B8E8, (void (*)(void))sub_22DBEACE4, (void (*)(void))sub_22DBEAE40);
}

uint64_t sub_22DBEACE4()
{
  return sub_22DBEAD20(&qword_26859B8F8, &qword_26859B900, (void (*)(void))sub_22DBEADA8, (void (*)(void))sub_22DBEADF4);
}

uint64_t sub_22DBEAD20(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22DBEADA8()
{
  unint64_t result = qword_26859B908;
  if (!qword_26859B908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B908);
  }
  return result;
}

unint64_t sub_22DBEADF4()
{
  unint64_t result = qword_26859B910;
  if (!qword_26859B910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B910);
  }
  return result;
}

uint64_t sub_22DBEAE40()
{
  return sub_22DBEAD20(&qword_26859B918, &qword_26859B920, (void (*)(void))sub_22DBEADF4, (void (*)(void))sub_22DAB89E4);
}

unint64_t sub_22DBEAE7C()
{
  unint64_t result = qword_26859B928;
  if (!qword_26859B928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859B928);
  }
  return result;
}

uint64_t sub_22DBEAED8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, char a9)
{
  if (a9)
  {
    char v13 = a6 & 1;
    sub_22DB44B54(a1, a2, a3);
    sub_22DAB7268(a4, a5, v13);
    sub_22DB4D550(a7);
    return swift_retain();
  }
  else
  {
    swift_retain();
    return sub_22DAB7268(a3, a4, a5 & 1);
  }
}

uint64_t sub_22DBEAF94(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, char a9)
{
  if (a9)
  {
    char v12 = a3 & 1;
    char v13 = a6 & 1;
    id v14 = a1;
    sub_22D9EFDBC(a2, v12);
    return sub_22DAB7268(a4, a5, v13);
  }
  else
  {
    char v17 = a6 & 1;
    sub_22DB44B54(a1, a2, a3);
    sub_22DAB7268(a4, a5, v17);
    sub_22DB4D550(a7);
    return swift_retain();
  }
}

uint64_t sub_22DBEB05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, uint64_t (*a11)(void), uint64_t (*a12)(void))
{
  if (a10) {
    return a12();
  }
  else {
    return a11();
  }
}

uint64_t sub_22DBEB090(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, char a9)
{
  if (a9)
  {
    char v13 = a6 & 1;
    sub_22DB44BC8(a1, a2, a3);
    sub_22DA84968(a4, a5, v13);
    sub_22DBEB148(a7);
    return swift_release();
  }
  else
  {
    swift_release();
    return sub_22DA84968(a3, a4, a5 & 1);
  }
}

void sub_22DBEB148(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_22DBEB158(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, char a6, void *a7, uint64_t a8, char a9)
{
  if (a9)
  {

    sub_22D9EFDC8(a2, a3 & 1);
    return sub_22DA84968(a4, a5, a6 & 1);
  }
  else
  {
    sub_22DB44BC8(a1, a2, a3);
    sub_22DA84968(a4, a5, a6 & 1);
    sub_22DBEB148(a7);
    return swift_release();
  }
}

uint64_t sub_22DBEB234(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22DBEB284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GallerySearchResultsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBEB2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GallerySearchResultsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBEB34C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GallerySearchResultsView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DBEB3A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598158);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_11_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598160);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_11_1();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B988);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_11_1();
  uint64_t v16 = v15 - v14;
  *(void *)uint64_t v7 = sub_22DC91188();
  *(void *)(v7 + 8) = 0x4024000000000000;
  *(unsigned char *)(v7 + 16) = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B990);
  sub_22DBEB5D8(v2, v7 + *(int *)(v17 + 44));
  uint64_t v18 = sub_22DC92598();
  char v23 = 1;
  char v22 = 1;
  sub_22DB1EC58(0, 1, 0, 1, 0x7FF0000000000000, 0, 0, 1, 0, v22, 0, v23, v18, v19);
  sub_22D9CC550(v7, &qword_268598158);
  sub_22DC91938();
  sub_22DC90828();
  OUTLINED_FUNCTION_38();
  sub_22D9CC3C8(v11, v16, &qword_268598160);
  OUTLINED_FUNCTION_0_0(v16 + *(int *)(v13 + 44));
  sub_22D9CC550(v11, &qword_268598160);
  sub_22DC91948();
  sub_22DC90828();
  OUTLINED_FUNCTION_38();
  sub_22D9CC3C8(v16, a1, &qword_26859B988);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B998);
  OUTLINED_FUNCTION_0_0(a1 + *(int *)(v20 + 36));
  return sub_22D9CC550(v16, &qword_26859B988);
}

uint64_t sub_22DBEB5D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9A0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v39 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9A8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  long long v40 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v41 = (uint64_t)v36 - v9;
  uint64_t v10 = type metadata accessor for ModePickerView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9B0);
  uint64_t v14 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v16 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9B8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v37 = (uint64_t)v36 - v21;
  v36[0] = a1;
  sub_22DBEE1B0(a1, (uint64_t)v13);
  uint64_t v22 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  v36[2] = v22 | 7;
  v36[3] = v23 + v12;
  uint64_t v24 = swift_allocObject();
  sub_22DBEE218((uint64_t)v13, v24 + v23);
  uint64_t v46 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9C0);
  v36[1] = MEMORY[0x263F1B6E0];
  sub_22D9A6FA0(&qword_26859B9C8, &qword_26859B9C0);
  sub_22DC92288();
  sub_22DC911D8();
  sub_22D9A6FA0(&qword_26859B9D0, &qword_26859B9B0);
  uint64_t v25 = v38;
  sub_22DC91D98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v25);
  uint64_t v26 = v37;
  sub_22D9D01F0((uint64_t)v20, v37, &qword_26859B9B8);
  uint64_t v27 = v36[0];
  sub_22DBEE1B0(v36[0], (uint64_t)v13);
  uint64_t v28 = swift_allocObject();
  sub_22DBEE218((uint64_t)v13, v28 + v23);
  uint64_t v45 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9D8);
  sub_22D9A6FA0(&qword_26859B9E0, &qword_26859B9D8);
  char v29 = v39;
  sub_22DC92288();
  sub_22DC911D8();
  sub_22D9A6FA0(&qword_26859B9E8, &qword_26859B9A0);
  uint64_t v30 = (uint64_t)v40;
  uint64_t v31 = v42;
  sub_22DC91D98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v31);
  uint64_t v32 = v41;
  sub_22D9D01F0(v30, v41, &qword_26859B9A8);
  sub_22D9CC3C8(v26, (uint64_t)v20, &qword_26859B9B8);
  sub_22D9CC3C8(v32, v30, &qword_26859B9A8);
  uint64_t v33 = v44;
  sub_22D9CC3C8((uint64_t)v20, v44, &qword_26859B9B8);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859B9F0);
  sub_22D9CC3C8(v30, v33 + *(int *)(v34 + 48), &qword_26859B9A8);
  sub_22D9CC550(v32, &qword_26859B9A8);
  sub_22D9CC550(v26, &qword_26859B9B8);
  sub_22D9CC550(v30, &qword_26859B9A8);
  return sub_22D9CC550((uint64_t)v20, &qword_26859B9B8);
}

uint64_t sub_22DBEBBDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v75 = sub_22DC90178();
  long long v69 = *(void (***)(void, void, void))(v75 - 8);
  MEMORY[0x270FA5388](v75);
  long long v68 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA40);
  MEMORY[0x270FA5388](v77);
  uint64_t v78 = (uint64_t)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22DC901A8();
  uint64_t v67 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v66 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598448);
  MEMORY[0x270FA5388](v65);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_22DC90168();
  uint64_t v81 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_22DC90148();
  uint64_t v11 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA48);
  MEMORY[0x270FA5388](v74);
  uint64_t v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA50);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v76 = (uint64_t)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v62 - v19;
  uint64_t v21 = a1 + *(int *)(type metadata accessor for ModePickerView() + 20);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  uint64_t v73 = v21;
  sub_22DC92468();
  uint64_t v70 = sub_22DB29BA0();
  unint64_t v23 = v22;
  swift_release();
  if (v23 >> 60 == 15) {
    goto LABEL_5;
  }
  uint64_t v63 = v5;
  uint64_t v25 = v80;
  uint64_t v24 = v81;
  uint64_t v64 = v20;
  sub_22D9A6F3C(0, &qword_2685950C0);
  uint64_t v26 = v70;
  sub_22DA16194(v70, v23);
  id v27 = sub_22DB2A7F4(v26, v23);
  if (!v27)
  {
    sub_22DA17290(v70, v23);
    uint64_t v20 = v64;
LABEL_5:
    long long v48 = self;
    id v49 = objc_msgSend(v48, sel_grayColor);
    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithPlatformColor_, v49);

    id v51 = objc_msgSend(v48, sel_secondarySystemFillColor);
    id v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithPlatformColor_, v51);

    id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v52);
    id v54 = objc_allocWithZone(MEMORY[0x263F85438]);
    sub_22DB2B064(0x6F746F6870, 0xE500000000000000, v50, v53);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F87A90], v80);
    (*(void (**)(char *, void, uint64_t))(v81 + 104))(v10, *MEMORY[0x263F87AE0], v71);
    uint64_t v55 = v68;
    sub_22DC90188();
    uint64_t v56 = v69;
    uint64_t v57 = v75;
    ((void (**)(uint64_t, char *, uint64_t))v69)[2](v78, v55, v75);
    swift_storeEnumTagMultiPayload();
    sub_22DBEE4AC();
    sub_22DBEE580((unint64_t *)&qword_26AEF9710, 255, MEMORY[0x263F87AF0]);
    sub_22DC91418();
    ((void (*)(char *, uint64_t))v56[1])(v55, v57);
    goto LABEL_6;
  }
  uint64_t v28 = (void (**)(void, void, void))v27;
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F85310]), sel_initWithImage_, v27);
  long long v69 = v28;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F87A90], v25);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v10, *MEMORY[0x263F87AE0], v71);
  sub_22DC90188();
  uint64_t v29 = sub_22DC92598();
  uint64_t v81 = v30;
  uint64_t v31 = (uint64_t)&v15[*(int *)(v74 + 36)];
  uint64_t v32 = v66;
  sub_22DC90198();
  uint64_t v33 = sub_22DC920B8();
  uint64_t v34 = v67;
  uint64_t v35 = v63;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v8, v32, v63);
  uint64_t v36 = v65;
  *(void *)&v8[*(int *)(v65 + 52)] = v33;
  *(_WORD *)&v8[*(int *)(v36 + 56)] = 256;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
  LOBYTE(v33) = sub_22DC91928();
  sub_22DC90828();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  sub_22D9CC3C8((uint64_t)v8, v31, &qword_268598448);
  uint64_t v45 = v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268598450) + 36);
  *(unsigned char *)uint64_t v45 = v33;
  *(void *)(v45 + 8) = v38;
  *(void *)(v45 + 16) = v40;
  *(void *)(v45 + 24) = v42;
  *(void *)(v45 + 32) = v44;
  *(unsigned char *)(v45 + 40) = 0;
  sub_22D9CC550((uint64_t)v8, &qword_268598448);
  uint64_t v46 = (uint64_t *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA68) + 36));
  uint64_t v47 = v81;
  *uint64_t v46 = v29;
  v46[1] = v47;
  sub_22D9CC3C8((uint64_t)v15, v78, &qword_26859BA48);
  swift_storeEnumTagMultiPayload();
  sub_22DBEE4AC();
  sub_22DBEE580((unint64_t *)&qword_26AEF9710, 255, MEMORY[0x263F87AF0]);
  uint64_t v20 = v64;
  sub_22DC91418();

  sub_22DA17290(v70, v23);
  sub_22D9CC550((uint64_t)v15, &qword_26859BA48);
LABEL_6:
  sub_22DC92468();
  char v58 = sub_22DB2901C();
  swift_release();
  uint64_t v59 = v76;
  sub_22D9CC3C8((uint64_t)v20, v76, &qword_26859BA50);
  uint64_t v60 = v79;
  sub_22D9CC3C8(v59, v79, &qword_26859BA50);
  *(unsigned char *)(v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA70) + 48)) = (v58 & 1) == 0;
  sub_22D9CC550((uint64_t)v20, &qword_26859BA50);
  return sub_22D9CC550(v59, &qword_26859BA50);
}

uint64_t sub_22DBEC500()
{
  return swift_release();
}

uint64_t sub_22DBEC564@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = sub_22DC91258();
  *(void *)(a4 + 8) = 0x4014000000000000;
  *(unsigned char *)(a4 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return a3(a1);
}

uint64_t sub_22DBEC5C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v23[0] = a1;
  uint64_t v26 = a2;
  uint64_t v25 = sub_22DC90168();
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_22DC90148();
  uint64_t v6 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA00);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v23 - v14;
  v23[1] = a1 + *(int *)(type metadata accessor for ModePickerView() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  sub_22DC92468();
  sub_22DB29D70();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F87A90], v24);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F87AE0], v25);
  sub_22DC90188();
  uint64_t v16 = sub_22DC92598();
  uint64_t v18 = v17;
  uint64_t v19 = (uint64_t)&v15[*(int *)(v10 + 44)];
  sub_22DBEC8C8(v23[0], v19);
  uint64_t v20 = (uint64_t *)(v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA08) + 36));
  *uint64_t v20 = v16;
  v20[1] = v18;
  sub_22DC92468();
  LOBYTE(v16) = sub_22DB2901C();
  swift_release();
  sub_22D9CC3C8((uint64_t)v15, (uint64_t)v13, &qword_26859BA00);
  uint64_t v21 = v26;
  sub_22D9CC3C8((uint64_t)v13, v26, &qword_26859BA00);
  *(unsigned char *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA10) + 48)) = v16 & 1;
  sub_22D9CC550((uint64_t)v15, &qword_26859BA00);
  return sub_22D9CC550((uint64_t)v13, &qword_26859BA00);
}

uint64_t sub_22DBEC8C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v56 = sub_22DC901A8();
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  id v53 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA18);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22DC908B8();
  uint64_t v55 = *(void (***)(void, void, void))(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v47 - v11;
  uint64_t v13 = sub_22DC8FD48();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ModePickerView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  sub_22DC92468();
  sub_22DB28D34((uint64_t)v16);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 88))(v16, v13) == *MEMORY[0x263F87810])
  {
    id v49 = v12;
    id v50 = v10;
    uint64_t v51 = a1;
    uint64_t v52 = v4;
    long long v48 = v6;
    uint64_t v17 = v56;
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t v18 = (void *)*((void *)v16 + 1);

    sub_22D9A6F3C(0, (unint64_t *)&qword_268593F90);
    id v19 = objc_msgSend(v18, sel_endColor);
    uint64_t v20 = self;
    id v21 = objc_msgSend(v20, sel_whiteColor);
    char v22 = sub_22DC93138();

    if ((v22 & 1) != 0
      && (id v23 = objc_msgSend(v18, sel_startColor),
          id v24 = objc_msgSend(v20, sel_whiteColor),
          char v25 = sub_22DC93138(),
          v23,
          v24,
          (v25 & 1) != 0))
    {
      uint64_t v26 = v49;
      sub_22DA7CA4C();
      id v27 = v55;
      uint64_t v28 = v50;
      ((void (**)(char *, void, uint64_t))v55)[13](v50, *MEMORY[0x263F18508], v7);
      char v29 = sub_22DC908A8();
      uint64_t v30 = (void (*)(char *, uint64_t))v27[1];
      v30(v28, v7);
      v30(v26, v7);
      uint64_t v31 = v57;
      uint64_t v32 = v52;
      if (v29)
      {
        uint64_t v33 = v53;
        sub_22DC90198();
        sub_22DC920B8();
        uint64_t v34 = sub_22DC920E8();
        uint64_t v55 = (void (**)(void, void, void))v18;
        uint64_t v35 = v34;
        swift_release();
        sub_22DC90948();
        uint64_t v36 = v54;
        uint64_t v37 = (uint64_t)v48;
        (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v48, v33, v17);
        uint64_t v38 = v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA20) + 36);
        long long v39 = v59;
        *(_OWORD *)uint64_t v38 = v58;
        *(_OWORD *)(v38 + 16) = v39;
        *(void *)(v38 + 32) = v60;
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BA28);
        *(void *)(v37 + *(int *)(v40 + 52)) = v35;
        *(_WORD *)(v37 + *(int *)(v40 + 56)) = 256;
        swift_retain();
        uint64_t v41 = sub_22DC92598();
        uint64_t v43 = v42;
        swift_release();

        uint64_t v44 = (uint64_t *)(v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BA30) + 36));
        *uint64_t v44 = v41;
        v44[1] = v43;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v17);
        sub_22D9D01F0(v37, v31, &qword_26859BA18);
        uint64_t v45 = 0;
      }
      else
      {

        uint64_t v45 = 1;
      }
    }
    else
    {

      uint64_t v45 = 1;
      uint64_t v31 = v57;
      uint64_t v32 = v52;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v45 = 1;
    uint64_t v31 = v57;
    uint64_t v32 = v4;
  }
  return __swift_storeEnumTagSinglePayload(v31, v45, 1, v32);
}

__n128 sub_22DBECE80@<Q0>(char a1@<W0>, __n128 *a2@<X8>)
{
  if (a1)
  {
    uint64_t v3 = sub_22DC92178();
    uint64_t v4 = sub_22DC919D8();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v6 = sub_22DC92058();
    uint64_t v19 = v3;
    uint64_t v20 = KeyPath;
    uint64_t v21 = v4;
    uint64_t v22 = swift_getKeyPath();
    uint64_t v23 = v6;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_22DB93598(&v19, (uint64_t)v16);
  }
  else
  {
    uint64_t v7 = sub_22DC92178();
    uint64_t v8 = sub_22DC919D8();
    uint64_t v9 = swift_getKeyPath();
    uint64_t v10 = sub_22DC92108();
    uint64_t v19 = v7;
    uint64_t v20 = v9;
    uint64_t v21 = v8;
    uint64_t v22 = swift_getKeyPath();
    uint64_t v23 = v10;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_22DB93648(&v19, (uint64_t)v16);
  }
  __n128 v14 = v16[1];
  __n128 v15 = v16[0];
  unint64_t v11 = v17;
  unsigned __int8 v12 = v18;
  swift_release();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  swift_release_n();
  __n128 result = v14;
  *a2 = v15;
  a2[1] = v14;
  a2[2].n128_u64[0] = v11;
  a2[2].n128_u8[8] = v12;
  return result;
}

double sub_22DBED038@<D0>(__n128 *a1@<X8>)
{
  *(void *)&double result = sub_22DBECE80(*v1, a1).n128_u64[0];
  return result;
}

id sub_22DBED040()
{
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = v0;
  v14.super_class = ObjectType;
  id v2 = objc_msgSendSuper2(&v14, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_systemRedColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  id v6 = objc_msgSend(v4, sel_widthAnchor);
  id v7 = objc_msgSend(v6, sel_constraintEqualToConstant_, 100.0);

  objc_msgSend(v7, sel_setActive_, 1);
  id v8 = objc_msgSend(v4, sel_heightAnchor);
  id v9 = objc_msgSend(v8, sel_constraintEqualToConstant_, 100.0);

  objc_msgSend(v9, sel_setActive_, 1);
  v13[3] = ObjectType;
  v13[0] = v4;
  objc_allocWithZone(MEMORY[0x263F82CB0]);
  id v10 = v4;
  id v11 = sub_22DB2F084(v13, (uint64_t)sel_onTap);
  objc_msgSend(v10, sel_addGestureRecognizer_, v11, v13[0]);

  return v10;
}

void sub_22DBED250()
{
}

uint64_t sub_22DBED2C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC10WorkflowUI33HomeScreenModePickerConfiguration11ContentView_configuration;
  swift_beginAccess();
  return sub_22DA96438(v3, a1);
}

uint64_t sub_22DBED314(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC10WorkflowUI33HomeScreenModePickerConfiguration11ContentView_configuration;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_22DA0D384(a1, v3);
  return swift_endAccess();
}

void sub_22DBED378()
{
}

uint64_t (*sub_22DBED400())()
{
  return j__swift_endAccess;
}

id sub_22DBED45C()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for HomeScreenModePickerConfiguration.ContentView());
  uint64_t v1 = swift_retain();
  id v2 = sub_22DBED564(v1, v0);
  sub_22DBEE580(&qword_26859B960, v3, (void (*)(uint64_t))type metadata accessor for HomeScreenModePickerConfiguration.ContentView);
  return v2;
}

uint64_t type metadata accessor for HomeScreenModePickerConfiguration()
{
  return self;
}

uint64_t type metadata accessor for HomeScreenModePickerConfiguration.ButtonView()
{
  return self;
}

uint64_t type metadata accessor for HomeScreenModePickerConfiguration.ContentView()
{
  return self;
}

id sub_22DBED540()
{
  return sub_22DBED45C();
}

id sub_22DBED564(uint64_t a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for ModePickerView();
  MEMORY[0x270FA5388](v5);
  id v7 = (uint64_t *)&v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18[3] = type metadata accessor for HomeScreenModePickerConfiguration();
  v18[4] = sub_22DBEE580(&qword_26859B968, v8, (void (*)(uint64_t))type metadata accessor for HomeScreenModePickerConfiguration);
  v18[0] = a1;
  sub_22DA96438((uint64_t)v18, (uint64_t)a2 + OBJC_IVAR____TtCC10WorkflowUI33HomeScreenModePickerConfiguration11ContentView_configuration);
  v17.receiver = a2;
  v17.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_22DA96438((uint64_t)v18, (uint64_t)v16);
  id v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859B1B0);
  if (swift_dynamicCast())
  {
    *id v7 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    swift_storeEnumTagMultiPayload();
    type metadata accessor for HomeScreenIconState();
    sub_22DBEE580(&qword_2685948F0, 255, (void (*)(uint64_t))type metadata accessor for HomeScreenIconState);
    swift_retain();
    sub_22DC92498();
    id v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26859B970));
    unsigned __int8 v12 = (void *)sub_22DC90C28();
    objc_msgSend(v10, sel_addSubview_, v12);
    id v13 = objc_msgSend(v12, sel_wf_addConstraintsToFillSuperview_, v10);

    swift_release();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v10;
}

uint64_t type metadata accessor for ModePickerView()
{
  uint64_t result = qword_26859B978;
  if (!qword_26859B978) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_22DBED82C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22DC908B8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (char *)a1 + v9;
    id v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_22DBED988(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_22DC908B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

void *sub_22DBEDA60(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22DC908B8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

void *sub_22DBEDB6C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D9CC550((uint64_t)a1, &qword_268599210);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22DC908B8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

char *sub_22DBEDC90(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_22DC908B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_22DBEDDA4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D9CC550((uint64_t)a1, &qword_268599210);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22DC908B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22DBEDED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22DBEDEE4);
}

uint64_t sub_22DBEDEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B460);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_22DBEDF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22DBEDF7C);
}

uint64_t sub_22DBEDF7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B460);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_22DBEE008()
{
  sub_22DBEE130(319, (unint64_t *)&qword_268595510, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_22DBEE130(319, (unint64_t *)&qword_268598360, (uint64_t (*)(uint64_t))type metadata accessor for HomeScreenIconState, MEMORY[0x263F1B870]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_22DBEE130(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_22DBEE194()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DBEE1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModePickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBEE218(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModePickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBEE27C()
{
  return sub_22DBEE410();
}

uint64_t sub_22DBEE284@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBEC564(*(void *)(v1 + 16), &qword_26859BA38, (uint64_t (*)(uint64_t))sub_22DBEBBDC, a1);
}

uint64_t objectdestroyTm_18()
{
  uint64_t v1 = type metadata accessor for ModePickerView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268599210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22DC908B8();
    OUTLINED_FUNCTION_14_0();
    (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268598348);
  OUTLINED_FUNCTION_14_0();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22DBEE408()
{
  return sub_22DBEE410();
}

uint64_t sub_22DBEE410()
{
  return sub_22DBEC500();
}

uint64_t sub_22DBEE474@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBEC564(*(void *)(v1 + 16), &qword_26859B9F8, (uint64_t (*)(uint64_t))sub_22DBEC5C4, a1);
}

unint64_t sub_22DBEE4AC()
{
  unint64_t result = qword_26859BA58;
  if (!qword_26859BA58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BA48);
    sub_22DBEE580((unint64_t *)&qword_26AEF9710, 255, MEMORY[0x263F87AF0]);
    sub_22D9A6FA0(&qword_26859BA60, &qword_26859BA68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BA58);
  }
  return result;
}

uint64_t sub_22DBEE580(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EnablementCheckmark(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EnablementCheckmark(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x22DBEE72CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnablementCheckmark()
{
  return &type metadata for EnablementCheckmark;
}

uint64_t sub_22DBEE764()
{
  return sub_22DBEE7C8(&qword_26859BA78, &qword_26859B998, (void (*)(void))sub_22DBEE7A0);
}

uint64_t sub_22DBEE7A0()
{
  return sub_22DBEE7C8(&qword_26859BA80, &qword_26859B988, (void (*)(void))sub_22DBEE848);
}

uint64_t sub_22DBEE7C8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22DBEE848()
{
  unint64_t result = qword_26859BA88;
  if (!qword_26859BA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268598160);
    sub_22D9A6FA0(&qword_26859BA90, &qword_268598158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BA88);
  }
  return result;
}

uint64_t sub_22DBEE8E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22DBEE918()
{
  unint64_t result = qword_26859BA98;
  if (!qword_26859BA98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BAA0);
    sub_22DB9A64C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BA98);
  }
  return result;
}

id sub_22DBEE98C(void *a1)
{
  type metadata accessor for WFBluetoothTriggerSelection(0);
  sub_22DC92218();
  id v2 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BA0);
  sub_22DC92218();
  if (a1)
  {
    self;
    uint64_t v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      unsigned int v4 = (void *)v3;
      id v5 = a1;
      id v2 = objc_msgSend(v4, sel_selection);
      swift_release();
      id v6 = objc_msgSend(v4, sel_selectedDevices);
      sub_22DC92B48();

      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
    }
  }
  return v2;
}

uint64_t sub_22DBEEAC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAA8);
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (void *)OUTLINED_FUNCTION_0_20();
  sub_22DBEEBA4(v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_0_20();
  id v10 = sub_22DBEF694();
  sub_22D9D5140((uint64_t)v4, a1, &qword_26859BAA8);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BAB0) + 36)) = v10;
  return sub_22D9D51A4((uint64_t)v4, &qword_26859BAA8);
}

uint64_t sub_22DBEEBA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v51 = a4;
  uint64_t v52 = a3;
  uint64_t v54 = a1;
  uint64_t v63 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAC0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v67 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v64 = (uint64_t)&v51 - v10;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAC8);
  uint64_t v65 = *(void *)(v57 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v57);
  uint64_t v66 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  __n128 v15 = (char *)&v51 - v14;
  MEMORY[0x270FA5388](v13);
  objc_super v17 = (char *)&v51 - v16;
  sub_22DC911D8();
  uint64_t v18 = sub_22DC91BA8();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  uint64_t v23 = sub_22DC91B88();
  uint64_t v59 = v24;
  uint64_t v60 = v23;
  int v58 = v25;
  uint64_t v61 = v26;
  sub_22D9CFC1C(v18, v20, v22);
  swift_bridgeObjectRelease();
  uint64_t v62 = sub_22DC911D8();
  uint64_t v56 = v27;
  long long v68 = a1;
  uint64_t v69 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAB8);
  sub_22DC92248();
  type metadata accessor for WFBluetoothTriggerSelection(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAD0);
  sub_22DBEFA04();
  sub_22D9A6FA0(&qword_26859BAE0, &qword_26859BAD0);
  sub_22DC922C8();
  uint64_t v28 = v54;
  char v29 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  uint64_t v30 = v15;
  uint64_t v31 = v15;
  uint64_t v62 = (uint64_t)v17;
  uint64_t v32 = v57;
  uint64_t v55 = v29;
  uint64_t v56 = v65 + 16;
  ((void (*)(char *, char *))v29)(v31, v17);
  uint64_t v70 = v28;
  uint64_t v71 = a2;
  sub_22DC92228();
  if (v68 == (void *)1)
  {
    swift_getKeyPath();
    uint64_t v33 = (void *)swift_allocObject();
    v33[2] = v28;
    v33[3] = a2;
    v33[4] = v52;
    uint64_t v34 = v51;
    v33[5] = v51;
    uint64_t v70 = &unk_26E196018;
    MEMORY[0x270FA5388](v34);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAF8);
    sub_22DBEFC34();
    uint64_t v35 = v64;
    sub_22DC91B18();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v36 = 0;
    uint64_t v37 = v35;
  }
  else
  {
    uint64_t v36 = 1;
    uint64_t v37 = v64;
  }
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAE8);
  __swift_storeEnumTagSinglePayload(v37, v36, 1, v38);
  char v39 = v58 & 1;
  LOBYTE(v70) = v58 & 1;
  uint64_t v40 = v66;
  uint64_t v41 = v30;
  id v53 = v30;
  uint64_t v42 = v32;
  uint64_t v43 = v55;
  v55(v66, v41, v32);
  sub_22D9D5140(v37, v67, &qword_26859BAC0);
  uint64_t v44 = v63;
  uint64_t v45 = v59;
  uint64_t v46 = v60;
  *uint64_t v63 = v60;
  v44[1] = v45;
  *((unsigned char *)v44 + 16) = v39;
  v44[3] = v61;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAF0);
  v43((char *)v44 + *(int *)(v47 + 48), v40, v42);
  uint64_t v48 = v67;
  sub_22D9D5140(v67, (uint64_t)v44 + *(int *)(v47 + 64), &qword_26859BAC0);
  sub_22D9CFBC8(v46, v45, v39);
  swift_bridgeObjectRetain();
  sub_22D9CFBC8(v46, v45, v39);
  swift_bridgeObjectRetain();
  sub_22D9D51A4(v64, &qword_26859BAC0);
  id v49 = *(void (**)(char *, uint64_t))(v65 + 8);
  v49(v53, v42);
  v49((char *)v62, v42);
  sub_22D9CFC1C(v46, v45, v39);
  swift_bridgeObjectRelease();
  sub_22D9D51A4(v48, &qword_26859BAC0);
  v49(v66, v42);
  sub_22D9CFC1C(v46, v45, (char)v70);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBEF184@<X0>(uint64_t a1@<X8>)
{
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268595FA0;
  uint64_t v3 = (void *)sub_22DC92948();
  unsigned int v4 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  sub_22D9CFB38();
  uint64_t v6 = sub_22DC91BB8();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  LOBYTE(v3) = v11 & 1;
  sub_22DC929E8();
  id v12 = (id)qword_268595FA0;
  uint64_t v13 = (void *)sub_22DC92948();
  uint64_t v14 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

  uint64_t v16 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v23 = v16;
  uint64_t v17 = sub_22DC91BB8();
  uint64_t v19 = v18;
  LOBYTE(v15) = v20 & 1;
  *(_DWORD *)(a1 + 17) = v23;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v23 + 3);
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v28;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v28[3];
  *(_WORD *)(a1 + 62) = v27;
  *(_DWORD *)(a1 + 58) = v26;
  *(_DWORD *)(a1 + 84) = *(_DWORD *)&v25[3];
  *(_DWORD *)(a1 + 81) = *(_DWORD *)v25;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v24[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v24;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = (_BYTE)v3;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v17;
  *(void *)(a1 + 72) = v18;
  *(unsigned char *)(a1 + 80) = v20 & 1;
  *(void *)(a1 + 88) = v21;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(unsigned char *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 121) = 0;
  sub_22D9CFBC8(v6, v8, (char)v3);
  swift_bridgeObjectRetain();
  sub_22D9CFBC8(v17, v19, (char)v15);
  swift_bridgeObjectRetain();
  sub_22D9CFC1C(v17, v19, (char)v15);
  swift_bridgeObjectRelease();
  sub_22D9CFC1C(v6, v8, (char)v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBEF490(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  swift_bridgeObjectRetain();
  sub_22DBEF540(v9, v10, a2, a3, a4, a5);
  sub_22D9CFB38();
  return sub_22DC92308();
}

uint64_t sub_22DBEF540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_22DC92C68();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22DC92C58();
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  void v13[4] = a3;
  v13[5] = a4;
  v13[6] = a5;
  v13[7] = a6;
  v13[8] = a1;
  v13[9] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_22DC92C58();
  uint64_t v16 = (void *)swift_allocObject();
  __n128 v16[2] = v15;
  v16[3] = v14;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a6;
  v16[8] = a1;
  v16[9] = a2;
  sub_22DC92388();
  return v18;
}

id sub_22DBEF694()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86940]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BAB8);
  sub_22DC92228();
  objc_msgSend(v0, sel_setSelection_, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685959E8);
  sub_22DC92228();
  uint64_t v1 = (void *)sub_22DC92B38();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setSelectedDevices_, v1);

  return v0;
}

uint64_t sub_22DBEF77C@<X0>(uint64_t a1@<X6>, uint64_t a2@<X7>, unsigned char *a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685959E8);
  sub_22DC92228();
  LOBYTE(a2) = sub_22DBFF2D8(a1, a2, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = a2 & 1;
  return result;
}

uint64_t sub_22DBEF7F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685959E8);
  sub_22DC92228();
  unint64_t v10 = sub_22DADCE8C(a8, a9, v23);
  char v12 = v11;
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    sub_22DC92228();
    uint64_t v13 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22DAE2A44();
      uint64_t v13 = v20;
    }
    unint64_t v14 = v13[2];
    if (v10 < v14)
    {
      unint64_t v15 = v14 - 1;
      sub_22D9B04CC((char *)&v13[2 * v10 + 6], v14 - 1 - v10, (char *)&v13[2 * v10 + 4]);
      v13[2] = v15;
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_12;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22DC92228();
  uint64_t v16 = v23;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
LABEL_12:
    sub_22D9ADD04();
    uint64_t v16 = v21;
  }
  unint64_t v17 = v16[2];
  if (v17 >= v16[3] >> 1)
  {
    sub_22D9ADD04();
    uint64_t v16 = v22;
  }
  __n128 v16[2] = v17 + 1;
  uint64_t v18 = &v16[2 * v17];
  v18[4] = a8;
  void v18[5] = a9;
LABEL_10:
  sub_22DC92238();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBEF9CC@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBEEAC4(a1);
}

ValueMetadata *type metadata accessor for BluetoothConfigurationView()
{
  return &type metadata for BluetoothConfigurationView;
}

uint64_t sub_22DBEF9E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22DBEFA04()
{
  unint64_t result = qword_26859BAD8;
  if (!qword_26859BAD8)
  {
    type metadata accessor for WFBluetoothTriggerSelection(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BAD8);
  }
  return result;
}

uint64_t sub_22DBEFA54()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22DBEFA9C(uint64_t *a1)
{
  return sub_22DBEF490(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_22DBEFAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268598FB8);
  sub_22D9A6FA0(&qword_26859BB18, &qword_26859BB10);
  sub_22D9A6FA0(&qword_26859BB08, &qword_268598FB8);
  return sub_22DC923D8();
}

uint64_t sub_22DBEFBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void *))
{
  v6[0] = a1;
  v6[1] = a2;
  v6[2] = a3;
  v6[3] = a4;
  return a5(v6);
}

uint64_t sub_22DBEFC20(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22DBEFAA8(*a1, a2, a3, a4);
}

uint64_t sub_22DBEFC28()
{
  return sub_22DBEFC20(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_22DBEFC34()
{
  unint64_t result = qword_26859BB00;
  if (!qword_26859BB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BAF8);
    sub_22D9A6FA0(&qword_26859BB08, &qword_268598FB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BB00);
  }
  return result;
}

uint64_t sub_22DBEFCCC(uint64_t *a1, uint64_t (*a2)(void *))
{
  return sub_22DBEFBE4(*a1, a1[1], a1[2], a1[3], a2);
}

uint64_t sub_22DBEFCE4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22DBEFD1C(uint64_t *a1)
{
  return sub_22DBEFCCC(a1, *(uint64_t (**)(void *))(v1 + 16));
}

uint64_t sub_22DBEFD28@<X0>(unsigned char *a1@<X8>)
{
  return sub_22DBEF77C(*(void *)(v1 + 64), *(void *)(v1 + 72), a1);
}

uint64_t objectdestroy_5Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_22DBEFD98(uint64_t a1)
{
  return sub_22DBEF7F8(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

ValueMetadata *type metadata accessor for BluetoothConfigurationView.Device()
{
  return &type metadata for BluetoothConfigurationView.Device;
}

unint64_t sub_22DBEFDE0()
{
  unint64_t result = qword_26859BB20;
  if (!qword_26859BB20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BAB0);
    sub_22DBEFE80();
    sub_22D9A6FA0((unint64_t *)&qword_2685932A8, &qword_2685932B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BB20);
  }
  return result;
}

unint64_t sub_22DBEFE80()
{
  unint64_t result = qword_26859BB28;
  if (!qword_26859BB28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BAA8);
    sub_22D9A6FA0(&qword_26859BB30, &qword_26859BB38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BB28);
  }
  return result;
}

id sub_22DBEFF1C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593268);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22DCB2E80;
  uint64_t v1 = (void *)*MEMORY[0x263F87480];
  id v2 = (void *)*MEMORY[0x263F87478];
  *(void *)(v0 + 32) = *MEMORY[0x263F87480];
  *(void *)(v0 + 40) = v2;
  id v6 = (id)*MEMORY[0x263F87488];
  *(void *)(v0 + 48) = *MEMORY[0x263F87488];
  off_26859BB40 = (_UNKNOWN *)v0;
  id v3 = v1;
  id v4 = v2;
  return v6;
}

uint64_t static WFSmartPromptStatus.allCases.getter()
{
  if (qword_268592388 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static WFSmartPromptStatus.allCases.setter(void *a1)
{
  if (qword_268592388 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_26859BB40 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static WFSmartPromptStatus.allCases.modify())()
{
  if (qword_268592388 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22DBF0138()
{
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  if (v1 == OUTLINED_FUNCTION_63() && v0 == v2)
  {
LABEL_17:
    OUTLINED_FUNCTION_94();
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_126();
  swift_bridgeObjectRelease();
  if (v1) {
    goto LABEL_22;
  }
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  if (v1 == OUTLINED_FUNCTION_63() && v0 == v4)
  {
    OUTLINED_FUNCTION_94();
  }
  else
  {
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_126();
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0)
    {
      uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
      uint64_t v8 = v7;
      if (v6 == _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0() && v8 == v9)
      {
        OUTLINED_FUNCTION_94();
        goto LABEL_22;
      }
      char v11 = OUTLINED_FUNCTION_5_27();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_5_29();
      __break(1u);
      goto LABEL_17;
    }
  }
LABEL_22:
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v12 = (id)qword_268595FA0;
  uint64_t v13 = (void *)OUTLINED_FUNCTION_154();
  unint64_t v14 = (void *)OUTLINED_FUNCTION_154();
  uint64_t v15 = swift_bridgeObjectRelease();
  id v16 = OUTLINED_FUNCTION_150(v15, sel_localizedStringForKey_value_table_);

  uint64_t v17 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  return v17;
}

uint64_t sub_22DBF0320()
{
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  if (v1 == OUTLINED_FUNCTION_63() && v0 == v2) {
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_126();
  swift_bridgeObjectRelease();
  if (v1) {
    goto LABEL_18;
  }
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  if (v1 == OUTLINED_FUNCTION_63() && v0 == v4)
  {
    OUTLINED_FUNCTION_94();
  }
  else
  {
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_126();
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0)
    {
      uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
      uint64_t v8 = v7;
      if (v6 == _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0() && v8 == v9)
      {
        OUTLINED_FUNCTION_94();
      }
      else
      {
        char v11 = OUTLINED_FUNCTION_5_27();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
        {
          OUTLINED_FUNCTION_5_29();
          __break(1u);
LABEL_17:
          OUTLINED_FUNCTION_94();
        }
      }
    }
  }
LABEL_18:
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v12 = (id)qword_268595FA0;
  uint64_t v13 = (void *)OUTLINED_FUNCTION_154();
  unint64_t v14 = (void *)OUTLINED_FUNCTION_154();
  uint64_t v15 = swift_bridgeObjectRelease();
  id v16 = OUTLINED_FUNCTION_150(v15, sel_localizedStringForKey_value_table_);

  uint64_t v17 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  return v17;
}

BOOL sub_22DBF050C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  BOOL result = a2 == 2 && a1 == 2;
  if (v2 != 2 && a2 != 2) {
    return ((a2 ^ v2) & 1) == 0;
  }
  return result;
}

uint64_t sub_22DBF0540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WFSmartPromptStatus.id.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22DBF056C()
{
  return sub_22D9A6FA0(&qword_26859BB48, &qword_26859BB50);
}

uint64_t sub_22DBF05A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static WFSmartPromptStatus.allCases.getter();
  *a1 = result;
  return result;
}

void sub_22DBF05D0(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  int v2 = *(void **)(a1 + 48);
}

uint64_t sub_22DBF0624(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  id v5 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  uint64_t v6 = *(void **)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_retain();
  swift_retain();
  id v8 = v6;
  return a1;
}

uint64_t sub_22DBF0694(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  id v7 = *(void **)(a2 + 48);
  id v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v7;
  id v9 = v7;

  return a1;
}

uint64_t sub_22DBF0744(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  id v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

void type metadata accessor for SmartPromptRowView()
{
}

uint64_t sub_22DBF07C8()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_22DBF07E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22DBF050C(*a1, *a2);
}

uint64_t sub_22DBF07F0@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  v21[4] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB58);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11_1();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB60);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11_1();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB68);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_11_1();
  uint64_t v16 = v15 - v14;
  sub_22DBF2104(v2, &v22);
  sub_22DBF2104(&v22, &v23);
  if (v23 == 2)
  {
    uint64_t v17 = sub_22DBF0B94();
    v21[3] = v3;
    v21[1] = v18;
    v21[2] = v21;
    MEMORY[0x270FA5388](v17);
    v21[-2] = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB88);
    sub_22D9A6FA0(&qword_26859BB90, &qword_26859BB88);
    sub_22DC922F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v16, v12);
    swift_storeEnumTagMultiPayload();
    sub_22D9A6FA0(&qword_26859BB78, &qword_26859BB68);
    sub_22D9A6FA0(&qword_26859BB80, &qword_26859BB58);
    sub_22DC91418();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  }
  else
  {
    *(void *)uint64_t v7 = sub_22DC91188();
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 1;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB70);
    sub_22DBF11F8(v2, (char *)(v7 + *(int *)(v20 + 44)));
    sub_22D9CC3C8(v7, v11, &qword_26859BB58);
    swift_storeEnumTagMultiPayload();
    sub_22D9A6FA0(&qword_26859BB78, &qword_26859BB68);
    sub_22D9A6FA0(&qword_26859BB80, &qword_26859BB58);
    sub_22DC91418();
    return sub_22D9CC550(v7, &qword_26859BB58);
  }
}

uint64_t sub_22DBF0B94()
{
  uint64_t v1 = v0;
  sub_22DC92C68();
  sub_22DBF2150(v0);
  uint64_t v2 = sub_22DC92C58();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8F500];
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v4;
  long long v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)v0;
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v0 + 32);
  *(void *)(v3 + 80) = *(void *)(v0 + 48);
  sub_22DBF2150(v0);
  uint64_t v6 = sub_22DC92C58();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v4;
  long long v8 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v7 + 48) = v8;
  *(_OWORD *)(v7 + 64) = *(_OWORD *)(v1 + 32);
  *(void *)(v7 + 80) = *(void *)(v1 + 48);
  sub_22DC92388();
  return v10;
}

uint64_t sub_22DBF0CAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v3 = sub_22DC90168();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22DC90148();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22DC90178();
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v40 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = *(void **)(v1 + 24);
  uint64_t v42 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v13)
  {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithSystemColor_, 9);
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v14);

    id v16 = objc_allocWithZone(MEMORY[0x263F85438]);
    sub_22DBD2E10(0x6C6C69662E707061, 0xE800000000000000, v15);
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F87AB0], v7);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F87AE0], v3);
  id v17 = v13;
  sub_22DC90188();
  uint64_t v18 = *(void *)(v2 + 16);
  if (v18)
  {
    uint64_t v19 = *(void *)(v2 + 8);
    uint64_t v20 = v18;
  }
  else
  {
    sub_22DC929E8();
    if (qword_268592270 != -1) {
      swift_once();
    }
    id v21 = (id)qword_268595FA0;
    char v22 = (void *)sub_22DC92948();
    char v23 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    uint64_t v19 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v20 = v25;
  }
  uint64_t v43 = v19;
  uint64_t v44 = v20;
  sub_22D9CFB38();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_22DC91BB8();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = (uint64_t)&v38;
  uint64_t v43 = v26;
  uint64_t v44 = v28;
  char v45 = v32;
  uint64_t v46 = v30;
  uint64_t v47 = KeyPath;
  uint64_t v48 = 1;
  char v49 = 0;
  uint64_t v34 = MEMORY[0x270FA5388](KeyPath);
  *(&v38 - 2) = (uint64_t)&v43;
  MEMORY[0x270FA5388](v34);
  uint64_t v35 = v42;
  *(&v38 - 2) = (uint64_t)v42;
  sub_22D9CFBC8(v26, v28, v32);
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF98D8);
  sub_22DAB3944();
  sub_22DBF239C((unint64_t *)&qword_26AEF9710, MEMORY[0x263F87AF0]);
  uint64_t v36 = v40;
  sub_22DC921E8();
  sub_22D9CFC1C(v26, v28, v32);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22D9CFC1C(v43, v44, v45);
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v35, v36);
}

uint64_t sub_22DBF11F8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v3 = sub_22DC90C88();
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v60 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBA0);
  uint64_t v51 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v48 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBA8);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v52 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBB0);
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  id v50 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBB8);
  uint64_t v8 = MEMORY[0x270FA5388](v47);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v58 = (uint64_t)&v46 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB88);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v53 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v49 = (char *)&v46 - v16;
  sub_22DBF0CAC((uint64_t)&v46 - v16);
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v17 = (id)qword_268595FA0;
  uint64_t v18 = (void *)sub_22DC92948();
  uint64_t v19 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

  uint64_t v21 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v23 = v22;

  uint64_t v67 = v21;
  uint64_t v68 = v23;
  uint64_t v24 = a1[4];
  uint64_t v25 = a1[5];
  id v69 = (id)a1[6];
  uint64_t v70 = v24;
  uint64_t v64 = v24;
  uint64_t v65 = v25;
  id v66 = v69;
  MEMORY[0x270FA5388](v26);
  sub_22DAE4B8C((uint64_t)&v70);
  swift_retain();
  sub_22DB22C44(&v69);
  type metadata accessor for WFSmartPromptStatus(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBC0);
  sub_22DBF239C(&qword_268592978, type metadata accessor for WFSmartPromptStatus);
  sub_22DBF2234();
  sub_22D9CFB38();
  uint64_t v27 = v48;
  sub_22DC922D8();
  uint64_t v28 = sub_22D9A6FA0(&qword_26859BBE0, &qword_26859BBA0);
  uint64_t v29 = v52;
  uint64_t v30 = v55;
  sub_22DC91D08();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v27, v30);
  char v31 = v60;
  sub_22DC90C78();
  uint64_t v64 = v30;
  uint64_t v65 = v28;
  swift_getOpaqueTypeConformance2();
  char v32 = v50;
  uint64_t v33 = v59;
  uint64_t v34 = v62;
  sub_22DC91CC8();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v34);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v29, v33);
  uint64_t v35 = v54;
  uint64_t v36 = v56;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v10, v32, v56);
  *(_WORD *)&v10[*(int *)(v47 + 36)] = 257;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v36);
  uint64_t v37 = v58;
  sub_22DBF231C((uint64_t)v10, v58);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v39 = v53;
  uint64_t v40 = v49;
  v38(v53, v49, v12);
  sub_22D9CC3C8(v37, (uint64_t)v10, &qword_26859BBB8);
  uint64_t v41 = v63;
  v38(v63, v39, v12);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBE8);
  uint64_t v43 = &v41[*(int *)(v42 + 48)];
  *(void *)uint64_t v43 = 0;
  v43[8] = 1;
  sub_22D9CC3C8((uint64_t)v10, (uint64_t)&v41[*(int *)(v42 + 64)], &qword_26859BBB8);
  sub_22D9CC550(v37, &qword_26859BBB8);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v13 + 8);
  v44(v40, v12);
  sub_22D9CC550((uint64_t)v10, &qword_26859BBB8);
  return ((uint64_t (*)(char *, uint64_t))v44)(v39, v12);
}

uint64_t sub_22DBF1974@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  int v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBC0);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268592388 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_26859BB40;
  uint64_t v7 = *((void *)off_26859BB40 + 2);
  if (!v7)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    goto LABEL_24;
  }
  uint64_t v24 = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  uint64_t v9 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v10 = (void *)v6[v8 + 4];
    if (v3)
    {
      uint64_t v12 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
      uint64_t v14 = v13;
      if (v12 == _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0() && v14 == v15)
      {
        id v19 = v10;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v17 = sub_22DC937E8();
        id v18 = v10;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          goto LABEL_15;
        }
      }
      if (!objc_msgSend(self, sel_allowsDeletingWithoutConfirmation))
      {

        goto LABEL_20;
      }
    }
    else
    {
      id v11 = v10;
    }
LABEL_15:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_22D9BABC0();
      uint64_t v9 = v28;
    }
    unint64_t v21 = *(void *)(v9 + 16);
    if (v21 >= *(void *)(v9 + 24) >> 1)
    {
      sub_22D9BABC0();
      uint64_t v9 = v28;
    }
    *(void *)(v9 + 16) = v21 + 1;
    *(void *)(v9 + 8 * v21 + 32) = v10;
LABEL_20:
    ++v8;
  }
  while (v7 != v8);
  swift_bridgeObjectRelease();
  a2 = v24;
LABEL_24:
  uint64_t v28 = v9;
  *(unsigned char *)(swift_allocObject() + 16) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBD8);
  sub_22D9A6FA0(&qword_26859BBF0, &qword_26859BB50);
  sub_22DBF22A8();
  sub_22DBF239C(&qword_26859BBF8, type metadata accessor for WFSmartPromptStatus);
  uint64_t v22 = v25;
  sub_22DC923E8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(a2, v22, v27);
}

uint64_t sub_22DBF1CFC@<X0>(void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1;
  if (a2)
  {
    uint64_t v26 = sub_22DBF0320();
    uint64_t v27 = v13;
    sub_22D9CFB38();
    uint64_t v6 = sub_22DC91BB8();
    uint64_t v8 = v14;
    *(void *)&long long v33 = v6;
    *((void *)&v33 + 1) = v14;
    char v10 = v15 & 1;
    char v34 = v15 & 1;
    uint64_t v35 = v16;
    uint64_t v36 = v4;
    uint64_t v37 = v4;
    id v17 = v4;
    sub_22D9CFBC8(v6, v8, v10);
    swift_bridgeObjectRetain();
    sub_22DB93778(&v33, (uint64_t)&v26);
  }
  else
  {
    uint64_t v26 = sub_22DBF0138();
    uint64_t v27 = v5;
    sub_22D9CFB38();
    uint64_t v6 = sub_22DC91BB8();
    uint64_t v8 = v7;
    *(void *)&long long v33 = v6;
    *((void *)&v33 + 1) = v7;
    char v10 = v9 & 1;
    char v34 = v9 & 1;
    uint64_t v35 = v11;
    uint64_t v36 = v4;
    uint64_t v37 = v4;
    id v12 = v4;
    sub_22D9CFBC8(v6, v8, v10);
    swift_bridgeObjectRetain();
    sub_22DB935A0(&v33, (uint64_t)&v26);
  }
  uint64_t v24 = v27;
  uint64_t v25 = v26;
  uint64_t v18 = v29;
  uint64_t v23 = v28;
  uint64_t v19 = v30;
  uint64_t v20 = v31;
  char v21 = v32;
  sub_22D9CFC1C(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_22D9CFC1C(v6, v8, v10);

  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v25;
  *(void *)(a3 + 8) = v24;
  *(void *)(a3 + 16) = v23;
  *(void *)(a3 + 24) = v18;
  *(void *)(a3 + 32) = v19;
  *(void *)(a3 + 40) = v20;
  *(unsigned char *)(a3 + 48) = v21;
  return result;
}

uint64_t sub_22DBF1E9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB98);
  MEMORY[0x230F935C0](&v11, v2);
  int v3 = v11;
  uint64_t v4 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v6 = v5;
  if (v4 == _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0() && v6 == v7) {
    char v9 = 0;
  }
  else {
    char v9 = sub_22DC937E8() ^ 1;
  }

  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v9 & 1;
  return result;
}

uint64_t sub_22DBF1F74(unsigned char *a1)
{
  if (*a1) {
    uint64_t v1 = (id *)MEMORY[0x263F87478];
  }
  else {
    uint64_t v1 = (id *)MEMORY[0x263F87480];
  }
  id v2 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BB98);
  return sub_22DC92358();
}

uint64_t sub_22DBF1FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 48);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v7;
  *(unsigned char *)(a2 + 48) = v8;
  sub_22D9CFBC8(v3, v2, v4);
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_22DBF2054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22DC90178();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_22DBF20C0@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBF07F0(a1);
}

unsigned char *sub_22DBF2104(unsigned char *a1, unsigned char *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t sub_22DBF2114@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBF0CAC(a1);
}

uint64_t sub_22DBF2140@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBF1FEC(*(void *)(v1 + 16), a1);
}

uint64_t sub_22DBF2148@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBF2054(*(void *)(v1 + 16), a1);
}

uint64_t sub_22DBF2150(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 48);
  swift_retain();
  swift_retain();
  id v4 = v3;
  swift_bridgeObjectRetain();
  id v5 = v2;
  return a1;
}

uint64_t sub_22DBF21B0@<X0>(unsigned char *a1@<X8>)
{
  return sub_22DBF1E9C(a1);
}

uint64_t objectdestroyTm_19()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_22DBF2220(unsigned char *a1)
{
  return sub_22DBF1F74(a1);
}

uint64_t sub_22DBF222C@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBF1974(*(unsigned char *)(v1 + 16), a1);
}

unint64_t sub_22DBF2234()
{
  unint64_t result = qword_26859BBC8;
  if (!qword_26859BBC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BBC0);
    sub_22DBF22A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BBC8);
  }
  return result;
}

unint64_t sub_22DBF22A8()
{
  unint64_t result = qword_26859BBD0;
  if (!qword_26859BBD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BBD8);
    sub_22DB9A248();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BBD0);
  }
  return result;
}

uint64_t sub_22DBF231C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBF2384()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22DBF2394@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DBF1CFC(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_22DBF239C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22DBF23E4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22DBF2490);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = v7 - 2;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *sub_22DBF24A4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x22DBF2578);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_22DBF25A0(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_22DBF25B4(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

void type metadata accessor for SmartPromptRowView.Style()
{
}

unint64_t sub_22DBF25D4()
{
  unint64_t result = qword_26859BC00;
  if (!qword_26859BC00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BC08);
    sub_22D9A6FA0(&qword_26859BB78, &qword_26859BB68);
    sub_22D9A6FA0(&qword_26859BB80, &qword_26859BB58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BC00);
  }
  return result;
}

unsigned char *sub_22DBF2698(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x22DBF2764);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void type metadata accessor for SmartPromptRowView.Style.MenuStyle()
{
}

unint64_t sub_22DBF279C()
{
  unint64_t result = qword_26859BC10;
  if (!qword_26859BC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BC10);
  }
  return result;
}

uint64_t _s10DataSourceCMa(uint64_t a1)
{
  return sub_22D9BC514(a1, (uint64_t *)&unk_26859BC38);
}

uint64_t sub_22DBF2808()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22DBF2864(uint64_t a1)
{
  uint64_t v2 = _s13RowIdentifierOMa(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_22D9BA498();
    uint64_t v7 = v13;
    BOOL v8 = (char *)(a1 + 32);
    do
    {
      char v9 = *v8++;
      *uint64_t v5 = v9;
      swift_storeEnumTagMultiPayload();
      uint64_t v13 = v7;
      unint64_t v10 = *(void *)(v7 + 16);
      if (v10 >= *(void *)(v7 + 24) >> 1)
      {
        sub_22D9BA498();
        uint64_t v7 = v13;
      }
      *(void *)(v7 + 16) = v10 + 1;
      sub_22DBF73BC((uint64_t)v5, v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v10, (void (*)(void))_s13RowIdentifierOMa);
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_22DBF29EC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = a3;
  uint64_t v6 = _s13RowIdentifierOMa(0);
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v6);
  BOOL v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    v25[0] = v3;
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_22D9BA498();
    uint64_t v10 = v30;
    uint64_t v11 = (unsigned __int16 *)(a1 + 32);
    v25[1] = qword_26859BC18;
    id v26 = a2;
    do
    {
      int v13 = *v11++;
      int v12 = v13;
      uint64_t v14 = sub_22DB28BE8();
      if (v16)
      {
        BOOL v17 = v12 == (unsigned __int16)v14;
      }
      else
      {
        sub_22DA43288(v14, v15, 0);
        BOOL v17 = 0;
      }
      uint64_t v18 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
      uint64_t v19 = v18[12];
      uint64_t v20 = v18[16];
      uint64_t v21 = v18[20];
      uint64_t v22 = sub_22DC8F188();
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v22);
      *(void *)&v8[v19] = v29;
      *(_WORD *)&v8[v20] = v12;
      v8[v21] = v17;
      swift_storeEnumTagMultiPayload();
      uint64_t v30 = v10;
      unint64_t v23 = *(void *)(v10 + 16);
      if (v23 >= *(void *)(v10 + 24) >> 1)
      {
        sub_22D9BA498();
        uint64_t v10 = v30;
      }
      *(void *)(v10 + 16) = v23 + 1;
      sub_22DBF73BC((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v23, (void (*)(void))_s13RowIdentifierOMa);
      --v9;
    }
    while (v9);
  }
  else
  {

    return MEMORY[0x263F8EE78];
  }
  return v10;
}

uint64_t sub_22DBF2C10(uint64_t a1, char a2)
{
  _s11SectionTypeOMa(0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_97();
  _s13RowIdentifierOMa(0);
  sub_22DBF72AC(&qword_26859BCA8, (void (*)(uint64_t))_s11SectionTypeOMa);
  sub_22DBF72AC(&qword_26859BCB0, (void (*)(uint64_t))_s13RowIdentifierOMa);
  sub_22DC904E8();
  char v13 = sub_22DB2901C();
  type metadata accessor for WFGlyphCategory();
  OUTLINED_FUNCTION_3_31(v8, 1);
  sub_22DBF6DCC(v8, (void (*)(void))_s11SectionTypeOMa);
  if (v13)
  {
    OUTLINED_FUNCTION_3_31(v8, 3);
    sub_22DBF6DCC(v8, (void (*)(void))_s11SectionTypeOMa);
    if (a1) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = GlyphRegistry.categories.getter();
    }
    swift_bridgeObjectRetain();
    sub_22DBF4528(v14, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_3_31(v8, 2);
    sub_22DBF6DCC(v8, (void (*)(void))_s11SectionTypeOMa);
  }
  sub_22DBF4C70();
  sub_22DC90588();
  sub_22DBF58BC(a2 & 1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
}

uint64_t sub_22DBF2E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = sub_22DC8F188();
  OUTLINED_FUNCTION_1_0();
  uint64_t v53 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_2();
  uint64_t v52 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BC88);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_2();
  uint64_t v54 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
  uint64_t v13 = OUTLINED_FUNCTION_62(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_7_26();
  MEMORY[0x270FA5388](v14);
  uint64_t v56 = (uint64_t)&v47 - v15;
  _s13RowIdentifierOMa(0);
  OUTLINED_FUNCTION_14_0();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (unsigned __int8 *)&v47 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BC90);
  uint64_t v23 = OUTLINED_FUNCTION_62(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_8_27();
  uint64_t v25 = (unsigned __int8 *)(v2 + v24);
  sub_22DBF72F4(a1, v2, (void (*)(void))_s13RowIdentifierOMa);
  sub_22DBF72F4(a2, (uint64_t)v25, (void (*)(void))_s13RowIdentifierOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_22DBF72F4(v2, (uint64_t)v19, (void (*)(void))_s13RowIdentifierOMa);
      uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
      uint64_t v28 = v27[12];
      uint64_t v29 = *(void *)&v19[v28];
      uint64_t v30 = v27[16];
      int v31 = *(unsigned __int16 *)&v19[v30];
      uint64_t v32 = v27[20];
      int v50 = v19[v32];
      int v51 = v31;
      if (OUTLINED_FUNCTION_5_30() != 1)
      {
        sub_22D9CC550((uint64_t)v19, &qword_268594080);
        goto LABEL_19;
      }
      uint64_t v49 = *(void *)&v25[v28];
      int v48 = *(unsigned __int16 *)&v25[v30];
      int v33 = v25[v32];
      uint64_t v34 = (uint64_t)v25;
      uint64_t v35 = v56;
      sub_22DA84BB0(v34, v56, &qword_268594080);
      uint64_t v36 = v54;
      uint64_t v37 = v54 + *(int *)(v9 + 48);
      sub_22DA84BB0((uint64_t)v19, v54, &qword_268594080);
      sub_22DBF7354(v35, v37);
      uint64_t v38 = v55;
      if (__swift_getEnumTagSinglePayload(v36, 1, v55) == 1)
      {
        if (__swift_getEnumTagSinglePayload(v37, 1, v38) == 1)
        {
          sub_22D9CC550(v36, &qword_268594080);
          goto LABEL_26;
        }
        goto LABEL_24;
      }
      sub_22DBF7354(v36, v3);
      if (__swift_getEnumTagSinglePayload(v37, 1, v38) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v3, v38);
LABEL_24:
        sub_22D9CC550(v36, &qword_26859BC88);
LABEL_29:
        sub_22D9CC550(v56, &qword_268594080);
        goto LABEL_30;
      }
      uint64_t v40 = v53;
      uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
      int v47 = v33;
      uint64_t v42 = v52;
      v41(v52, v37, v38);
      sub_22DBF72AC(&qword_26859BC98, MEMORY[0x263F07508]);
      char v43 = sub_22DC92938();
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
      uint64_t v45 = v42;
      int v33 = v47;
      v44(v45, v38);
      v44(v3, v38);
      sub_22D9CC550(v36, &qword_268594080);
      if ((v43 & 1) == 0) {
        goto LABEL_29;
      }
LABEL_26:
      if (v29 != v49) {
        goto LABEL_29;
      }
      sub_22D9CC550(v56, &qword_268594080);
      if (v51 != v48)
      {
LABEL_30:
        sub_22DBF6DCC(v2, (void (*)(void))_s13RowIdentifierOMa);
        return 0;
      }
      int v46 = v50 ^ v33;
      sub_22DBF6DCC(v2, (void (*)(void))_s13RowIdentifierOMa);
      return v46 ^ 1u;
    case 2u:
      if (OUTLINED_FUNCTION_5_30() != 2) {
        goto LABEL_19;
      }
      goto LABEL_17;
    case 3u:
      if (OUTLINED_FUNCTION_5_30() != 3) {
        goto LABEL_19;
      }
      goto LABEL_17;
    case 4u:
      if (OUTLINED_FUNCTION_5_30() != 4) {
        goto LABEL_19;
      }
      goto LABEL_17;
    case 5u:
      if (OUTLINED_FUNCTION_5_30() != 5) {
        goto LABEL_19;
      }
      goto LABEL_17;
    case 6u:
      if (OUTLINED_FUNCTION_5_30() != 6) {
        goto LABEL_19;
      }
LABEL_17:
      sub_22DBF6DCC(v2, (void (*)(void))_s13RowIdentifierOMa);
      return 1;
    default:
      sub_22DBF72F4(v2, (uint64_t)v21, (void (*)(void))_s13RowIdentifierOMa);
      if (OUTLINED_FUNCTION_5_30())
      {
LABEL_19:
        sub_22D9CC550(v2, &qword_26859BC90);
        return 0;
      }
      else
      {
        BOOL v26 = *v21 == *v25;
        sub_22DBF6DCC(v2, (void (*)(void))_s13RowIdentifierOMa);
      }
      return v26;
  }
}

unint64_t sub_22DBF3450()
{
  uint64_t v2 = type metadata accessor for WFGlyphCategory();
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s11SectionTypeOMa(0);
  uint64_t v7 = OUTLINED_FUNCTION_62(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_97();
  sub_22DBF72F4(v0, v1, (void (*)(void))_s11SectionTypeOMa);
  unint64_t v8 = 0xD000000000000012;
  switch(__swift_getEnumTagSinglePayload(v1, 5, v2))
  {
    case 1u:
      return v8;
    case 2u:
      unint64_t v8 = 0xD000000000000016;
      break;
    case 3u:
      unint64_t v8 = 0x53206C6F626D7953;
      break;
    case 4u:
      unint64_t v8 = 0xD000000000000014;
      break;
    case 5u:
      unint64_t v8 = 0xD00000000000001FLL;
      break;
    default:
      sub_22DBF73BC(v1, (uint64_t)v5, (void (*)(void))type metadata accessor for WFGlyphCategory);
      v10[0] = 0;
      v10[1] = 0xE000000000000000;
      sub_22DC93438();
      sub_22DC92A38();
      sub_22DC93588();
      unint64_t v8 = v10[0];
      sub_22DBF6DCC((uint64_t)v5, (void (*)(void))type metadata accessor for WFGlyphCategory);
      break;
  }
  return v8;
}

uint64_t sub_22DBF367C()
{
  uint64_t v1 = type metadata accessor for WFGlyphCategory();
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s11SectionTypeOMa(0);
  uint64_t v6 = OUTLINED_FUNCTION_62(v5);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DBF72F4(v0, (uint64_t)v8, (void (*)(void))_s11SectionTypeOMa);
  switch(__swift_getEnumTagSinglePayload((uint64_t)v8, 5, v1))
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
      uint64_t result = sub_22DC93918();
      break;
    default:
      sub_22DBF73BC((uint64_t)v8, (uint64_t)v4, (void (*)(void))type metadata accessor for WFGlyphCategory);
      sub_22DC93918();
      sub_22DC8F188();
      sub_22DBF72AC((unint64_t *)&qword_268594120, MEMORY[0x263F07508]);
      sub_22DC928E8();
      uint64_t result = sub_22DBF6DCC((uint64_t)v4, (void (*)(void))type metadata accessor for WFGlyphCategory);
      break;
  }
  return result;
}

uint64_t sub_22DBF3868(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for WFGlyphCategory();
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _s11SectionTypeOMa(0);
  uint64_t v10 = OUTLINED_FUNCTION_62(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_11_1();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BC80);
  uint64_t v15 = OUTLINED_FUNCTION_62(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_8_27();
  uint64_t v17 = v2 + v16;
  sub_22DBF72F4(a1, v2, (void (*)(void))_s11SectionTypeOMa);
  sub_22DBF72F4(a2, v17, (void (*)(void))_s11SectionTypeOMa);
  switch(__swift_getEnumTagSinglePayload(v2, 5, v5))
  {
    case 1u:
      if (OUTLINED_FUNCTION_2_28() == 1) {
        goto LABEL_13;
      }
      goto LABEL_14;
    case 2u:
      if (OUTLINED_FUNCTION_2_28() != 2) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 3u:
      if (OUTLINED_FUNCTION_2_28() != 3) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 4u:
      if (OUTLINED_FUNCTION_2_28() != 4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 5u:
      if (OUTLINED_FUNCTION_2_28() == 5) {
        goto LABEL_13;
      }
      goto LABEL_14;
    default:
      sub_22DBF72F4(v2, v13, (void (*)(void))_s11SectionTypeOMa);
      if (OUTLINED_FUNCTION_2_28())
      {
        sub_22DBF6DCC(v13, (void (*)(void))type metadata accessor for WFGlyphCategory);
LABEL_14:
        sub_22D9CC550(v2, &qword_26859BC80);
        return 0;
      }
      sub_22DBF73BC(v17, (uint64_t)v8, (void (*)(void))type metadata accessor for WFGlyphCategory);
      if ((sub_22DC8F158() & 1) == 0
        || ((uint64_t v19 = *(int *)(v5 + 20),
             uint64_t v20 = *(void *)(v13 + v19),
             uint64_t v21 = *(void *)(v13 + v19 + 8),
             uint64_t v22 = &v8[v19],
             v20 == *(void *)v22)
          ? (BOOL v23 = v21 == *((void *)v22 + 1))
          : (BOOL v23 = 0),
            !v23 && (sub_22DC937E8() & 1) == 0
         || !sub_22D9DC26C(*(void *)(v13 + *(int *)(v5 + 24)), *(void *)&v8[*(int *)(v5 + 24)])))
      {
        sub_22DBF6DCC((uint64_t)v8, (void (*)(void))type metadata accessor for WFGlyphCategory);
        sub_22DBF6DCC(v13, (void (*)(void))type metadata accessor for WFGlyphCategory);
        sub_22DBF6DCC(v2, (void (*)(void))_s11SectionTypeOMa);
        return 0;
      }
      sub_22DBF6DCC((uint64_t)v8, (void (*)(void))type metadata accessor for WFGlyphCategory);
      sub_22DBF6DCC(v13, (void (*)(void))type metadata accessor for WFGlyphCategory);
LABEL_13:
      sub_22DBF6DCC(v2, (void (*)(void))_s11SectionTypeOMa);
      return 1;
  }
}

uint64_t sub_22DBF3B94()
{
  return sub_22DBF3EE0((void (*)(unsigned char *))sub_22DBF367C);
}

uint64_t sub_22DBF3BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DBF3F70(a1, a2, a3, (void (*)(unsigned char *))sub_22DBF367C);
}

uint64_t sub_22DBF3BE4()
{
  uint64_t v3 = sub_22DC8F188();
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_97();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
  uint64_t v8 = OUTLINED_FUNCTION_62(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_26();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v17 - v10;
  _s13RowIdentifierOMa(0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_11_1();
  uint64_t v15 = v14 - v13;
  sub_22DBF72F4(v0, v14 - v13, (void (*)(void))_s13RowIdentifierOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v17[3] = *(unsigned __int8 *)(v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268594768) + 80));
      sub_22DA84BB0(v15, (uint64_t)v11, &qword_268594080);
      sub_22DC93918();
      sub_22DBF7354((uint64_t)v11, v2);
      if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
      {
        sub_22DC93928();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v1, v2, v3);
        sub_22DC93928();
        sub_22DBF72AC((unint64_t *)&qword_268594120, MEMORY[0x263F07508]);
        sub_22DC928E8();
        (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
      }
      sub_22DC93918();
      sub_22DC93938();
      sub_22DC93928();
      uint64_t result = sub_22D9CC550((uint64_t)v11, &qword_268594080);
      break;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      goto LABEL_5;
    default:
      sub_22DC93918();
LABEL_5:
      uint64_t result = sub_22DC93918();
      break;
  }
  return result;
}

uint64_t sub_22DBF3EE0(void (*a1)(unsigned char *))
{
  sub_22DC93908();
  a1(v3);
  return sub_22DC93958();
}

uint64_t sub_22DBF3F28()
{
  return sub_22DBF3EE0((void (*)(unsigned char *))sub_22DBF3BE4);
}

uint64_t sub_22DBF3F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DBF3F70(a1, a2, a3, (void (*)(unsigned char *))sub_22DBF3BE4);
}

uint64_t sub_22DBF3F70(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_22DC93908();
  a4(v6);
  return sub_22DC93958();
}

uint64_t sub_22DBF3FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + qword_26859BC30 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + qword_26859BC18) = a2;
  *(void *)(v4 + qword_26859BC20) = a3;
  *(void *)(v4 + qword_26859BC28) = a4;
  return sub_22DC90538();
}

uint64_t sub_22DBF405C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594758);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_22DC90328();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = _s11SectionTypeOMa(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22DBF72F4(a1, (uint64_t)v12, (void (*)(void))_s11SectionTypeOMa);
  uint64_t v13 = type metadata accessor for WFGlyphCategory();
  switch(__swift_getEnumTagSinglePayload((uint64_t)v12, 5, v13))
  {
    case 1u:
    case 3u:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685931E0);
      _s13RowIdentifierOMa(0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_22DCB0EA0;
      swift_storeEnumTagMultiPayload();
      goto LABEL_8;
    case 2u:
      sub_22DBF2864((uint64_t)&unk_26E195CA8);
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCE0);
      unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_22DCB0EA0;
      sub_22DBF72F4(a1, v19 + v18, (void (*)(void))_s11SectionTypeOMa);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
      sub_22DC904B8();
      swift_bridgeObjectRelease();
      sub_22DBF72F4(a1, (uint64_t)v4, (void (*)(void))_s11SectionTypeOMa);
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v9);
      sub_22DC90498();
      swift_bridgeObjectRelease();
      return sub_22D9CC550((uint64_t)v4, &qword_268594758);
    case 4u:
    case 5u:
      goto LABEL_3;
    default:
      sub_22DBF6DCC((uint64_t)v12, (void (*)(void))_s11SectionTypeOMa);
LABEL_3:
      sub_22DC90228();
      uint64_t v14 = sub_22DC90318();
      os_log_type_t v15 = sub_22DC92E78();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        MEMORY[0x230F95FD0](v16, -1, -1);
      }

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_22DBF4528(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = a2;
  uint64_t v41 = a1;
  uint64_t v3 = _s11SectionTypeOMa(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  *(void *)&long long v52 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v47 = (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v48 = (uint64_t)&v40 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594758);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(self, sel_currentTraitCollection);
  id v49 = objc_msgSend(v13, sel_userInterfaceStyle);

  uint64_t v14 = v2;
  swift_retain();
  uint64_t v15 = sub_22D9F9A74();
  unint64_t v17 = v16;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v18 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0) {
    uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (v18)
  {
    uint64_t v50 = v6;
    swift_retain();
    sub_22D9F9A74();
    swift_release();
    uint64_t v19 = sub_22DA338C8();
    swift_bridgeObjectRelease();
    if (*(void *)(v19 + 16))
    {
      id v20 = v14;
      sub_22DBF29EC(v19, v20, (uint64_t)v49);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCE0);
      unint64_t v21 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_22DCB0EA0;
      uint64_t v23 = v50;
      __swift_storeEnumTagSinglePayload(v22 + v21, 4, 5, v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
      sub_22DC904B8();
      swift_bridgeObjectRelease();
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 4, 5, v23);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCE0);
      unint64_t v37 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v38 = swift_allocObject();
      long long v52 = xmmword_22DCB0EA0;
      *(_OWORD *)(v38 + 16) = xmmword_22DCB0EA0;
      uint64_t v39 = v50;
      __swift_storeEnumTagSinglePayload(v38 + v37, 5, 5, v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
      sub_22DC904B8();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685931E0);
      _s13RowIdentifierOMa(0);
      *(_OWORD *)(swift_allocObject() + 16) = v52;
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 5, 5, v39);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v3);
    sub_22DC90498();
    swift_bridgeObjectRelease();
    return sub_22D9CC550((uint64_t)v12, &qword_268594758);
  }
  else
  {
    uint64_t v24 = (uint64_t)v12;
    uint64_t result = v41;
    uint64_t v26 = *(void *)(v41 + 16);
    if (v26)
    {
      uint64_t v50 = v6;
      uint64_t v27 = *(int *)(v6 + 24);
      uint64_t v28 = v41 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
      uint64_t v45 = *(void *)(v45 + 72);
      uint64_t v46 = v27;
      swift_bridgeObjectRetain();
      long long v44 = xmmword_22DCB0EA0;
      uint64_t v42 = (uint64_t)v2;
      uint64_t v43 = v24;
      uint64_t v29 = v52;
      do
      {
        uint64_t v30 = v48;
        sub_22DBF72F4(v28, v48, (void (*)(void))type metadata accessor for WFGlyphCategory);
        sub_22DBF72F4(v30, v29, (void (*)(void))type metadata accessor for WFGlyphCategory);
        __swift_storeEnumTagSinglePayload(v29, 0, 5, v50);
        uint64_t v31 = v47;
        uint64_t v32 = *(void *)(v30 + v46);
        uint64_t v33 = sub_22DBF73BC(v30, v47, (void (*)(void))type metadata accessor for WFGlyphCategory);
        MEMORY[0x270FA5388](v33);
        *(&v40 - 4) = v42;
        *(&v40 - 3) = v31;
        *(&v40 - 2) = (uint64_t)v49;
        swift_bridgeObjectRetain();
        sub_22DB34E14((void (*)(__int16 *))sub_22DBF7410, (uint64_t)(&v40 - 6), v32, (uint64_t)v53);
        swift_bridgeObjectRelease();
        sub_22DBF6DCC(v31, (void (*)(void))type metadata accessor for WFGlyphCategory);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCE0);
        unint64_t v34 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
        uint64_t v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = v44;
        sub_22DBF72F4(v52, v35 + v34, (void (*)(void))_s11SectionTypeOMa);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
        sub_22DC904B8();
        swift_bridgeObjectRelease();
        uint64_t v36 = v43;
        sub_22DBF72F4(v52, v43, (void (*)(void))_s11SectionTypeOMa);
        __swift_storeEnumTagSinglePayload(v36, 0, 1, v3);
        sub_22DC90498();
        uint64_t v29 = v52;
        swift_bridgeObjectRelease();
        sub_22D9CC550(v36, &qword_268594758);
        sub_22DBF6DCC(v29, (void (*)(void))_s11SectionTypeOMa);
        v28 += v45;
        --v26;
      }
      while (v26);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_22DBF4C70()
{
  uint64_t v0 = sub_22DC8F2E8();
  unint64_t v1 = *(void *)(v0 - 8);
  uint64_t v108 = v0;
  unint64_t v109 = v1;
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s13RowIdentifierOMa(0);
  uint64_t v101 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCC0);
  MEMORY[0x270FA5388](v7);
  v100 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCC8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (unint64_t *)((char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v81 - v13);
  uint64_t v15 = type metadata accessor for WFGlyphCategory();
  MEMORY[0x270FA5388](v15);
  uint64_t v96 = (uint64_t)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BC80);
  MEMORY[0x270FA5388](v99);
  uint64_t v110 = (uint64_t)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _s11SectionTypeOMa(0);
  uint64_t v94 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v98 = (uint64_t)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v104 = (char *)&v81 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v111 = (uint64_t)&v81 - v23;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCD0);
  MEMORY[0x270FA5388](v93);
  v82 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCD8);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  v92 = (unint64_t *)((char *)&v81 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v26);
  v91 = (uint64_t *)((char *)&v81 - v28);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCA0);
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v81 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_22DC904D8();
  sub_22DC905A8();
  uint64_t v33 = sub_22DC904D8();
  unint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
  v85 = v32;
  uint64_t v87 = v29;
  uint64_t v86 = v30 + 8;
  v84 = v34;
  v34(v32, v29);
  uint64_t v35 = v33;
  unint64_t v36 = 0;
  unint64_t v37 = *(void *)(v35 + 16);
  uint64_t v107 = v88 + qword_26859BC30;
  v106 = (void (**)(char *, uint64_t))(v109 + 8);
  uint64_t v90 = v35;
  unint64_t v89 = v37;
  uint64_t v83 = v15;
  while (1)
  {
    if (v36 == v37)
    {
      uint64_t v38 = 1;
      unint64_t v97 = v37;
      uint64_t v40 = (uint64_t)v92;
      uint64_t v39 = v93;
    }
    else
    {
      if ((v36 & 0x8000000000000000) != 0) {
        goto LABEL_57;
      }
      if (v36 >= *(void *)(v35 + 16))
      {
LABEL_58:
        __break(1u);
        __break(1u);
        JUMPOUT(0x22DBF58A4);
      }
      unint64_t v109 = v36 + 1;
      uint64_t v41 = v93;
      uint64_t v42 = v35
          + ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80))
          + *(void *)(v94 + 72) * v36;
      uint64_t v43 = (uint64_t)&v82[*(int *)(v93 + 48)];
      sub_22DBF72F4(v42, v43, (void (*)(void))_s11SectionTypeOMa);
      long long v44 = v92;
      uint64_t v45 = (uint64_t)v92 + *(int *)(v41 + 48);
      unint64_t *v92 = v36;
      sub_22DBF73BC(v43, v45, (void (*)(void))_s11SectionTypeOMa);
      uint64_t v38 = 0;
      unint64_t v97 = v109;
      uint64_t v40 = (uint64_t)v44;
      uint64_t v39 = v41;
    }
    __swift_storeEnumTagSinglePayload(v40, v38, 1, v39);
    uint64_t v46 = v40;
    uint64_t v47 = v91;
    sub_22DA84BB0(v46, (uint64_t)v91, &qword_26859BCD8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v39) == 1) {
      break;
    }
    unint64_t v109 = *v47;
    sub_22DBF73BC((uint64_t)v47 + *(int *)(v39 + 48), v111, (void (*)(void))_s11SectionTypeOMa);
    uint64_t v105 = *(void *)(v95 + 16);
    if (!v105) {
      goto LABEL_42;
    }
    uint64_t v48 = v94;
    unint64_t v103 = v95 + ((*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80));
    swift_bridgeObjectRetain();
    uint64_t v49 = 0;
    uint64_t v102 = *(void *)(v48 + 72);
    uint64_t v50 = (uint64_t)v104;
    while (2)
    {
      uint64_t v51 = v103 + v102 * v49++;
      sub_22DBF72F4(v51, v50, (void (*)(void))_s11SectionTypeOMa);
      uint64_t v52 = v110;
      uint64_t v53 = v50;
      uint64_t v54 = v110 + *(int *)(v99 + 48);
      sub_22DBF72F4(v53, v110, (void (*)(void))_s11SectionTypeOMa);
      sub_22DBF72F4(v111, v54, (void (*)(void))_s11SectionTypeOMa);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v52, 5, v15);
      uint64_t v56 = v98;
      switch(EnumTagSinglePayload)
      {
        case 1:
          BOOL v57 = __swift_getEnumTagSinglePayload(v54, 5, v15) == 1;
          goto LABEL_18;
        case 2:
          BOOL v57 = __swift_getEnumTagSinglePayload(v54, 5, v15) == 2;
          goto LABEL_18;
        case 3:
          BOOL v57 = __swift_getEnumTagSinglePayload(v54, 5, v15) == 3;
          goto LABEL_18;
        case 4:
          BOOL v57 = __swift_getEnumTagSinglePayload(v54, 5, v15) == 4;
          goto LABEL_18;
        case 5:
          BOOL v57 = __swift_getEnumTagSinglePayload(v54, 5, v15) == 5;
LABEL_18:
          uint64_t v50 = (uint64_t)v104;
          if (!v57) {
            goto LABEL_19;
          }
          goto LABEL_53;
        default:
          sub_22DBF72F4(v110, v98, (void (*)(void))_s11SectionTypeOMa);
          if (__swift_getEnumTagSinglePayload(v54, 5, v15))
          {
            sub_22DBF6DCC(v56, (void (*)(void))type metadata accessor for WFGlyphCategory);
            uint64_t v50 = (uint64_t)v104;
LABEL_19:
            sub_22D9CC550(v110, &qword_26859BC80);
            goto LABEL_20;
          }
          sub_22DBF73BC(v54, v96, (void (*)(void))type metadata accessor for WFGlyphCategory);
          if ((sub_22DC8F158() & 1) == 0) {
            goto LABEL_41;
          }
          uint64_t v58 = *(int *)(v15 + 20);
          uint64_t v59 = *(void *)(v56 + v58);
          uint64_t v60 = *(void *)(v56 + v58 + 8);
          uint64_t v61 = (void *)(v96 + v58);
          BOOL v62 = v59 == *v61 && v60 == v61[1];
          if (!v62 && (sub_22DC937E8() & 1) == 0) {
            goto LABEL_41;
          }
          uint64_t v63 = *(int *)(v15 + 24);
          uint64_t v64 = *(void *)(v56 + v63);
          uint64_t v65 = *(void *)(v96 + v63);
          uint64_t v66 = *(void *)(v64 + 16);
          if (v66 != *(void *)(v65 + 16)) {
            goto LABEL_41;
          }
          if (v66) {
            BOOL v67 = v64 == v65;
          }
          else {
            BOOL v67 = 1;
          }
          if (!v67)
          {
            if (*(unsigned __int16 *)(v64 + 32) == *(unsigned __int16 *)(v65 + 32))
            {
              if (v66 == 1) {
                goto LABEL_52;
              }
              if (*(unsigned __int16 *)(v64 + 34) == *(unsigned __int16 *)(v65 + 34))
              {
                uint64_t v68 = v66 - 2;
                if (!v68) {
                  goto LABEL_52;
                }
                id v69 = (unsigned __int16 *)(v64 + 36);
                uint64_t v70 = (unsigned __int16 *)(v65 + 36);
                while (*v69 == *v70)
                {
                  ++v69;
                  ++v70;
                  if (!--v68) {
                    goto LABEL_52;
                  }
                }
              }
            }
LABEL_41:
            sub_22DBF6DCC(v96, (void (*)(void))type metadata accessor for WFGlyphCategory);
            sub_22DBF6DCC(v56, (void (*)(void))type metadata accessor for WFGlyphCategory);
            sub_22DBF6DCC(v110, (void (*)(void))_s11SectionTypeOMa);
            uint64_t v50 = (uint64_t)v104;
LABEL_20:
            sub_22DBF6DCC(v50, (void (*)(void))_s11SectionTypeOMa);
            if (v49 == v105)
            {
              swift_bridgeObjectRelease();
LABEL_42:
              uint64_t v71 = v85;
              sub_22DC905A8();
              uint64_t v72 = v87;
              uint64_t v73 = sub_22DC904C8();
              v84(v71, v72);
              unint64_t v74 = 0;
              unint64_t v75 = *(void *)(v73 + 16);
              while (1)
              {
                if (v74 == v75)
                {
                  uint64_t v76 = 1;
                  unint64_t v74 = v75;
                }
                else
                {
                  if (v74 >= *(void *)(v73 + 16))
                  {
                    __break(1u);
LABEL_57:
                    __break(1u);
                    goto LABEL_58;
                  }
                  uint64_t v77 = (uint64_t)&v100[*(int *)(v7 + 48)];
                  sub_22DBF72F4(v73+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(void *)(v101 + 72) * v74, v77, (void (*)(void))_s13RowIdentifierOMa);
                  uint64_t v78 = (uint64_t)v12 + *(int *)(v7 + 48);
                  unint64_t *v12 = v74;
                  sub_22DBF73BC(v77, v78, (void (*)(void))_s13RowIdentifierOMa);
                  uint64_t v76 = 0;
                  ++v74;
                }
                __swift_storeEnumTagSinglePayload((uint64_t)v12, v76, 1, v7);
                sub_22DA84BB0((uint64_t)v12, (uint64_t)v14, &qword_26859BCC8);
                if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v7) == 1)
                {
                  uint64_t v15 = v83;
                  goto LABEL_54;
                }
                uint64_t v79 = *v14;
                sub_22DBF73BC((uint64_t)v14 + *(int *)(v7 + 48), (uint64_t)v6, (void (*)(void))_s13RowIdentifierOMa);
                MEMORY[0x230F90530](v79, v109);
                if (MEMORY[0x230F96100](v107))
                {
                  sub_22DA41D30((uint64_t)v3, (uint64_t)v6);
                  swift_unknownObjectRelease();
                }
                (*v106)(v3, v108);
                sub_22DBF6DCC((uint64_t)v6, (void (*)(void))_s13RowIdentifierOMa);
              }
            }
            continue;
          }
LABEL_52:
          sub_22DBF6DCC(v96, (void (*)(void))type metadata accessor for WFGlyphCategory);
          sub_22DBF6DCC(v56, (void (*)(void))type metadata accessor for WFGlyphCategory);
          uint64_t v50 = (uint64_t)v104;
LABEL_53:
          sub_22DBF6DCC(v110, (void (*)(void))_s11SectionTypeOMa);
          sub_22DBF6DCC(v50, (void (*)(void))_s11SectionTypeOMa);
LABEL_54:
          uint64_t v35 = v90;
          swift_bridgeObjectRelease();
          sub_22DBF6DCC(v111, (void (*)(void))_s11SectionTypeOMa);
          unint64_t v37 = v89;
          unint64_t v36 = v97;
          break;
      }
      break;
    }
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBF58BC(int a1)
{
  uint64_t v2 = v1;
  int v27 = a1;
  uint64_t v3 = _s11SectionTypeOMa(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v26 = (uint64_t)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594750);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BCB8);
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _s13RowIdentifierOMa(0);
  sub_22DBF72AC(&qword_26859BCB0, (void (*)(uint64_t))_s13RowIdentifierOMa);
  sub_22DC905E8();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685931E0);
  v24[1] = ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80))
         + *(void *)(*(void *)(v11 - 8) + 72);
  uint64_t v13 = swift_allocObject();
  long long v29 = xmmword_22DCB0EA0;
  *(_OWORD *)(v13 + 16) = xmmword_22DCB0EA0;
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v11);
  uint64_t v30 = v8;
  sub_22DC905B8();
  swift_bridgeObjectRelease();
  sub_22D9CC550((uint64_t)v7, &qword_268594750);
  char v14 = sub_22DB2901C();
  uint64_t v28 = v2;
  if (v14)
  {
    v24[0] = v12;
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_22DCB0E90;
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v11);
    sub_22DC905B8();
    swift_bridgeObjectRelease();
    sub_22D9CC550((uint64_t)v7, &qword_268594750);
    swift_retain();
    uint64_t v16 = sub_22D9F9A74();
    unint64_t v18 = v17;
    swift_release();
    swift_bridgeObjectRelease();
    if ((v18 & 0x2000000000000000) != 0) {
      uint64_t v19 = HIBYTE(v18) & 0xF;
    }
    else {
      uint64_t v19 = v16 & 0xFFFFFFFFFFFFLL;
    }
    swift_retain();
    char v20 = sub_22D9F9938();
    swift_release();
    *(_OWORD *)(swift_allocObject() + 16) = v29;
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = v30;
    if ((v20 & 1) != 0 || v19)
    {
      sub_22DC905D8();
      goto LABEL_10;
    }
  }
  else
  {
    *(_OWORD *)(swift_allocObject() + 16) = v29;
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v11);
    uint64_t v15 = v30;
    sub_22DC905B8();
    swift_bridgeObjectRelease();
    sub_22D9CC550((uint64_t)v7, &qword_268594750);
    *(_OWORD *)(swift_allocObject() + 16) = v29;
    swift_storeEnumTagMultiPayload();
  }
  sub_22DC905C8();
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v21 = type metadata accessor for WFGlyphCategory();
  uint64_t v22 = v26;
  __swift_storeEnumTagSinglePayload(v26, 1, 5, v21);
  sub_22DC90598();
  sub_22DBF6DCC(v22, (void (*)(void))_s11SectionTypeOMa);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v15);
}

uint64_t sub_22DBF5DE4@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  int v7 = *a1;
  uint64_t v8 = sub_22DB28BE8();
  if (v10)
  {
    BOOL v11 = v7 == (unsigned __int16)v8;
  }
  else
  {
    sub_22DA43288(v8, v9, 0);
    BOOL v11 = 0;
  }
  uint64_t v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
  uint64_t v13 = v12[12];
  uint64_t v14 = v12[16];
  uint64_t v15 = v12[20];
  uint64_t v16 = sub_22DC8F188();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(a4, a2, v16);
  __swift_storeEnumTagSinglePayload(a4, 0, 1, v16);
  *(void *)(a4 + v13) = a3;
  *(_WORD *)(a4 + v14) = v7;
  *(unsigned char *)(a4 + v15) = v11;
  _s13RowIdentifierOMa(0);
  return swift_storeEnumTagMultiPayload();
}

void sub_22DBF5EF4()
{
}

uint64_t sub_22DBF5F24()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + qword_26859BC30;
  return sub_22D9ADBA0(v1);
}

uint64_t sub_22DBF5F84(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = a1 + qword_26859BC30;
  return sub_22D9ADBA0(v2);
}

void sub_22DBF5FF0()
{
}

uint64_t sub_22DBF6000()
{
  return _s10DataSourceCMa(0);
}

uint64_t *sub_22DBF6008(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for WFGlyphCategory();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 5, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_22DC8F188();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(v7 + 20);
      BOOL v11 = (uint64_t *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v13 = v12[1];
      *BOOL v11 = *v12;
      v11[1] = v13;
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 5, v7);
    }
  }
  return a1;
}

uint64_t sub_22DBF6138(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WFGlyphCategory();
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 5, v2);
  if (!result)
  {
    uint64_t v4 = sub_22DC8F188();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_22DBF61E4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 5, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22DC8F188();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = *(void *)v10;
    *((void *)v9 + 1) = v11;
    *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 5, v6);
  }
  return a1;
}

char *sub_22DBF62D8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 5, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 5, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v14 = sub_22DC8F188();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(a1, a2, v14);
      uint64_t v15 = *(int *)(v6 + 20);
      uint64_t v16 = &a1[v15];
      unint64_t v17 = &a2[v15];
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_22DBF6DCC((uint64_t)a1, (void (*)(void))type metadata accessor for WFGlyphCategory);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22DC8F188();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  uint64_t v10 = *(int *)(v6 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 5, v6);
  return a1;
}

char *sub_22DBF649C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 5, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_22DC8F188();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
    *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 5, v6);
  }
  return a1;
}

char *sub_22DBF657C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 5, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 5, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      uint64_t v11 = sub_22DC8F188();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(a1, a2, v11);
      uint64_t v12 = *(int *)(v6 + 20);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      uint64_t v16 = *(void *)v14;
      uint64_t v15 = *((void *)v14 + 1);
      *(void *)uint64_t v13 = v16;
      *((void *)v13 + 1) = v15;
      swift_bridgeObjectRelease();
      *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_22DBF6DCC((uint64_t)a1, (void (*)(void))type metadata accessor for WFGlyphCategory);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_22DC8F188();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
  *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 5, v6);
  return a1;
}

uint64_t sub_22DBF670C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22DBF6720);
}

uint64_t sub_22DBF6720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WFGlyphCategory();
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 6) {
    return EnumTagSinglePayload - 5;
  }
  else {
    return 0;
  }
}

uint64_t sub_22DBF6768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22DBF677C);
}

uint64_t sub_22DBF677C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 5);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for WFGlyphCategory();
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_22DBF67DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WFGlyphCategory();
  return __swift_getEnumTagSinglePayload(a1, 5, v2);
}

uint64_t sub_22DBF6820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WFGlyphCategory();
  return __swift_storeEnumTagSinglePayload(a1, a2, 5, v4);
}

uint64_t _s11SectionTypeOMa(uint64_t a1)
{
  return sub_22D9BC514(a1, (uint64_t *)&unk_26859BC48);
}

uint64_t sub_22DBF688C()
{
  uint64_t result = type metadata accessor for WFGlyphCategory();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_22DBF6904(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22DC8F188();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
      }
      uint64_t v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
      *(uint64_t *)((char *)a1 + v10[12]) = *(uint64_t *)((char *)a2 + v10[12]);
      *(_WORD *)((char *)a1 + v10[16]) = *(_WORD *)((char *)a2 + v10[16]);
      *((unsigned char *)a1 + v10[20]) = *((unsigned char *)a2 + v10[20]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_22DBF6A8C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_22DC8F188();
    uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v3);
    if (!result)
    {
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      return v4(a1, v3);
    }
  }
  return result;
}

char *sub_22DBF6B20(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22DC8F188();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
    *(void *)&a1[v8[12]] = *(void *)&a2[v8[12]];
    *(_WORD *)&a1[v8[16]] = *(_WORD *)&a2[v8[16]];
    a1[v8[20]] = a2[v8[20]];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_22DBF6C64(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22DBF6DCC((uint64_t)a1, (void (*)(void))_s13RowIdentifierOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22DC8F188();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
      *(void *)&a1[v8[12]] = *(void *)&a2[v8[12]];
      *(_WORD *)&a1[v8[16]] = *(_WORD *)&a2[v8[16]];
      a1[v8[20]] = a2[v8[20]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22DBF6DCC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t _s13RowIdentifierOMa(uint64_t a1)
{
  return sub_22D9BC514(a1, (uint64_t *)&unk_26859BC58);
}

char *sub_22DBF6E44(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22DC8F188();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
    *(void *)&a1[v8[12]] = *(void *)&a2[v8[12]];
    *(_WORD *)&a1[v8[16]] = *(_WORD *)&a2[v8[16]];
    a1[v8[20]] = a2[v8[20]];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_22DBF6F88(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22DBF6DCC((uint64_t)a1, (void (*)(void))_s13RowIdentifierOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22DC8F188();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268594768);
      *(void *)&a1[v8[12]] = *(void *)&a2[v8[12]];
      *(_WORD *)&a1[v8[16]] = *(_WORD *)&a2[v8[16]];
      a1[v8[20]] = a2[v8[20]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void sub_22DBF70F0()
{
  uint64_t v2 = &unk_22DCC2A30;
  sub_22DBF71C4();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout();
    uint64_t v3 = &v1;
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_22DBF71C4()
{
  if (!qword_26859BC68)
  {
    sub_22DC8F188();
    unint64_t v0 = sub_22DC931B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26859BC68);
    }
  }
}

uint64_t sub_22DBF721C()
{
  return sub_22DBF72AC(&qword_26859BC70, (void (*)(uint64_t))_s13RowIdentifierOMa);
}

uint64_t sub_22DBF7264()
{
  return sub_22DBF72AC(&qword_26859BC78, (void (*)(uint64_t))_s11SectionTypeOMa);
}

uint64_t sub_22DBF72AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22DBF72F4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_22DBF7354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594080);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBF73BC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = OUTLINED_FUNCTION_42();
  v5(v4);
  return a2;
}

uint64_t sub_22DBF7410@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DBF5DE4(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

WorkflowUI::CustomMaterialView __swiftcall CustomMaterialView.init(configuration:)(WorkflowUI::CustomMaterialView configuration)
{
  *uint64_t v1 = *(void *)configuration.configuration.filters._rawValue;
  return configuration;
}

id sub_22DBF7440(double a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_init);
  id v6 = objc_msgSend(self, sel_effectWithVariableBlurRadius_imageMask_, a3, a1);
  objc_msgSend(v5, sel_setEffect_, v6);

  return v5;
}

id sub_22DBF74D0(uint64_t a1)
{
  return sub_22DBF7440(*(double *)v1, a1, *(void *)(v1 + 8));
}

uint64_t sub_22DBF74E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBF7DC0();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22DBF7544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBF7DC0();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22DBF75A8()
{
}

uint64_t sub_22DBF75D0()
{
  return sub_22DBF75DC(&qword_26859BCE8);
}

uint64_t sub_22DBF75DC@<X0>(uint64_t *a1@<X8>)
{
  sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  id v2 = sub_22DA86A70();
  uint64_t v3 = (void *)sub_22DC92B38();
  objc_msgSend(v2, sel_setValue_forKey_, v3, *MEMORY[0x263F15CB0]);

  uint64_t v4 = (void *)sub_22DC8F7C8();
  uint64_t v5 = *MEMORY[0x263F15BF8];
  objc_msgSend(v2, sel_setValue_forKey_, v4, *MEMORY[0x263F15BF8]);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  id v6 = sub_22DA86A70();
  uint64_t v7 = (void *)sub_22DC8F7C8();
  objc_msgSend(v6, sel_setValue_forKey_, v7, v5);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  id v8 = sub_22DA86A70();
  uint64_t v9 = (void *)sub_22DC8F7C8();
  objc_msgSend(v8, sel_setValue_forKey_, v9, *MEMORY[0x263F15C80]);

  uint64_t v10 = (void *)sub_22DC92C08();
  objc_msgSend(v8, sel_setValue_forKey_, v10, *MEMORY[0x263F15C68]);

  uint64_t v11 = (void *)sub_22DC92C08();
  objc_msgSend(v8, sel_setValue_forKey_, v11, *MEMORY[0x263F15C38]);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685950A0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22DCB5460;
  *(void *)(v12 + 32) = v2;
  *(void *)(v12 + 40) = v6;
  *(void *)(v12 + 48) = v8;
  uint64_t v14 = v12;
  uint64_t result = sub_22DC92B68();
  *a1 = v14;
  return result;
}

uint64_t static CustomMaterialConfiguration.searchBackdrop.getter@<X0>(void *a1@<X8>)
{
  if (qword_268592390 != -1) {
    swift_once();
  }
  *a1 = qword_26859BCE8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22DBF786C()
{
  return sub_22D9A6F3C(0, &qword_26859BCF0);
}

id CustomMaterialUIView.__allocating_init(configuration:)(unint64_t *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CustomMaterialUIView.init(configuration:)(a1);
}

id CustomMaterialUIView.init(configuration:)(unint64_t *a1)
{
  unint64_t v2 = *a1;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CustomMaterialUIView();
  id v3 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v4 = objc_msgSend(v3, sel_layer);
  sub_22DA035A4(v2);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  sub_22DA89634(v6, v4);

  return v3;
}

uint64_t type metadata accessor for CustomMaterialUIView()
{
  return self;
}

void sub_22DBF798C()
{
}

id CustomMaterialUIView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void CustomMaterialUIView.init(frame:)()
{
}

id CustomMaterialUIView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomMaterialUIView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CustomMaterialView.configuration.getter@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

id CustomMaterialView.makeUIView(context:)()
{
  unint64_t v3 = *v0;
  id v1 = objc_allocWithZone((Class)type metadata accessor for CustomMaterialUIView());
  swift_bridgeObjectRetain();
  return CustomMaterialUIView.init(configuration:)(&v3);
}

uint64_t sub_22DBF7B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBF7E0C();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22DBF7B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22DBF7E0C();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22DBF7BF4()
{
}

unint64_t sub_22DBF7C20()
{
  unint64_t result = qword_26859BCF8;
  if (!qword_26859BCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BCF8);
  }
  return result;
}

void type metadata accessor for CustomMaterialConfiguration()
{
}

uint64_t method lookup function for CustomMaterialUIView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CustomMaterialUIView);
}

uint64_t dispatch thunk of CustomMaterialUIView.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for CustomMaterialView()
{
}

void *sub_22DBF7CB0(void *a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void sub_22DBF7CE0(uint64_t a1)
{
}

void *sub_22DBF7CE8(void *a1, void *a2)
{
  *a1 = *a2;
  unint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *sub_22DBF7D28(void *a1, void *a2)
{
  *a1 = *a2;
  unint64_t v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

void type metadata accessor for VariableBlurView()
{
}

unint64_t sub_22DBF7D74()
{
  unint64_t result = qword_26859BD00;
  if (!qword_26859BD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BD00);
  }
  return result;
}

unint64_t sub_22DBF7DC0()
{
  unint64_t result = qword_26859BD08;
  if (!qword_26859BD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BD08);
  }
  return result;
}

unint64_t sub_22DBF7E0C()
{
  unint64_t result = qword_26859BD10;
  if (!qword_26859BD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BD10);
  }
  return result;
}

void sub_22DBF7E5C(void *a1@<X0>, _OWORD *a2@<X8>)
{
  v120 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685980A0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_5_2();
  uint64_t v97 = v4;
  uint64_t v116 = sub_22DC8EF08();
  OUTLINED_FUNCTION_1_0();
  uint64_t v102 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5_2();
  uint64_t v107 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD18);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_60();
  uint64_t v98 = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v115 = (uint64_t)&v97 - v11;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5_2();
  uint64_t v114 = v13;
  uint64_t v14 = sub_22DC8F278();
  OUTLINED_FUNCTION_1_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_60();
  uint64_t v101 = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v97 - v20;
  uint64_t v22 = sub_22DC8F118();
  OUTLINED_FUNCTION_1_0();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_60();
  uint64_t v111 = v26;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v97 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v97 - v31;
  uint64_t v123 = 2;
  type metadata accessor for WFTimeTriggerEvent(0);
  OUTLINED_FUNCTION_6_23();
  *a2 = v124;
  uint64_t v33 = (int *)type metadata accessor for TimeOfDayConfigurationView();
  uint64_t v34 = (uint64_t)a2 + v33[5];
  sub_22DC8F108();
  v117 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  uint64_t v118 = v24 + 16;
  v117(v30, v32, v22);
  uint64_t v110 = v34;
  v119 = v30;
  sub_22DC92218();
  uint64_t v112 = v24;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v24 + 8);
  uint64_t v122 = v22;
  v35(v32, v22);
  unint64_t v36 = (_OWORD *)((char *)a2 + v33[6]);
  uint64_t v123 = 7;
  type metadata accessor for WFTimeTriggerOffset(0);
  OUTLINED_FUNCTION_6_23();
  unint64_t v109 = v36;
  _OWORD *v36 = v124;
  uint64_t v37 = v33[7];
  v121 = a2;
  uint64_t v38 = (char *)a2 + v37;
  LOBYTE(v123) = 0;
  sub_22DC92218();
  uint64_t v39 = *((void *)&v124 + 1);
  *uint64_t v38 = v124;
  uint64_t v108 = v38;
  *((void *)v38 + 1) = v39;
  sub_22DC8F248();
  uint64_t v40 = sub_22DC8F218();
  uint64_t v41 = *(void (**)(void, void))(v16 + 8);
  v100 = v21;
  uint64_t v106 = v14;
  uint64_t v105 = v16 + 8;
  v104 = v41;
  v41(v21, v14);
  uint64_t v42 = sub_22DBF8958(v40);
  uint64_t v99 = 0;
  swift_bridgeObjectRelease();
  uint64_t v43 = *(void *)(v42 + 16);
  if (v43)
  {
    unint64_t v103 = v35;
    *(void *)&long long v124 = MEMORY[0x263F8EE78];
    sub_22D9BA448();
    uint64_t v44 = v124;
    unint64_t v45 = *(void *)(v124 + 16);
    uint64_t v46 = 48;
    do
    {
      uint64_t v47 = *(void *)(v42 + v46);
      *(void *)&long long v124 = v44;
      if (v45 >= *(void *)(v44 + 24) >> 1)
      {
        sub_22D9BA448();
        uint64_t v44 = v124;
      }
      *(void *)(v44 + 16) = v45 + 1;
      *(void *)(v44 + 8 * v45 + 32) = v47;
      v46 += 24;
      ++v45;
      --v43;
    }
    while (v43);
    swift_bridgeObjectRelease();
    uint64_t v48 = v120;
    uint64_t v35 = v103;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v48 = v120;
  }
  uint64_t v49 = v121;
  uint64_t v50 = (void *)((char *)v121 + v33[8]);
  uint64_t v123 = sub_22D9A8418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD28);
  OUTLINED_FUNCTION_6_23();
  uint64_t v51 = *((void *)&v124 + 1);
  *uint64_t v50 = v124;
  v50[1] = v51;
  sub_22DC8F108();
  uint64_t v52 = v122;
  v117(v119, v32, v122);
  sub_22DC92218();
  v35(v32, v52);
  if (v48)
  {
    self;
    uint64_t v53 = swift_dynamicCastObjCClass();
    if (!v53)
    {

      return;
    }
    uint64_t v54 = (void *)v53;
    uint64_t v55 = v48;
    id v56 = objc_msgSend(v54, sel_event);
    swift_release();
    *uint64_t v49 = v56;
    v49[1] = 0;
    id v57 = objc_msgSend(v54, sel_time);
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = v107;
      sub_22DC8EEF8();

      uint64_t v60 = v102;
      uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v102 + 32);
      uint64_t v62 = v115;
      uint64_t v63 = v59;
      uint64_t v64 = v116;
      v61(v115, v63, v116);
      __swift_storeEnumTagSinglePayload(v62, 0, 1, v64);
      if (__swift_getEnumTagSinglePayload(v62, 1, v64) != 1)
      {
        v121 = v55;
        sub_22D9CC550(v62, &qword_26859BD18);
        sub_22DC8F248();
        id v65 = objc_msgSend(v54, sel_time);
        if (!v65)
        {
LABEL_46:
          __swift_storeEnumTagSinglePayload(v98, 1, 1, v64);
          goto LABEL_47;
        }
        uint64_t v66 = v65;
        uint64_t v67 = v107;
        sub_22DC8EEF8();

        uint64_t v68 = v98;
        v61(v98, v67, v64);
        __swift_storeEnumTagSinglePayload(v68, 0, 1, v64);
        if (__swift_getEnumTagSinglePayload(v68, 1, v64) == 1)
        {
LABEL_47:
          __break(1u);
          return;
        }
        uint64_t v69 = v97;
        sub_22DC8F228();
        OUTLINED_FUNCTION_2_29();
        v70();
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v68, v64);
        int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v69, 1, v52);
        uint64_t v72 = v111;
        uint64_t v55 = v121;
        if (EnumTagSinglePayload != 1)
        {
          uint64_t v73 = v112;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 32))(v111, v69, v52);
LABEL_20:
          uint64_t v74 = v114;
          *(void *)(v114 + *(int *)(v113 + 28)) = 0;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v74, v72, v52);
          sub_22DBFC1E4(v74, v110);
          id v75 = objc_msgSend(v54, sel_timeOffset);
          uint64_t v76 = v109;
          swift_release();
          *uint64_t v76 = v75;
          v76[1] = 0;
          if (objc_msgSend(v54, sel_mode))
          {

            uint64_t v77 = v108;
            swift_release();
            char v78 = 2;
            goto LABEL_42;
          }
          uint64_t v79 = &selRef_currentSunriseTime;
          id v80 = objc_msgSend(v54, sel_daysOfWeek);
          unint64_t v81 = sub_22DA35EE4();
          unint64_t v82 = sub_22DC92B48();

          if (v82 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v64 = sub_22DC93628();
            swift_bridgeObjectRelease();
            if (v64) {
              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v64 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v64)
            {
LABEL_24:
              v121 = v55;
              uint64_t v122 = v81;
              *(void *)&long long v124 = MEMORY[0x263F8EE78];
              sub_22D9BA448();
              if ((v64 & 0x8000000000000000) == 0)
              {
                uint64_t v83 = 0;
                uint64_t v84 = v124;
                do
                {
                  if ((v82 & 0xC000000000000001) != 0) {
                    id v85 = (id)MEMORY[0x230F94700](v83, v82);
                  }
                  else {
                    id v85 = *(id *)(v82 + 8 * v83 + 32);
                  }
                  uint64_t v86 = v85;
                  uint64_t v87 = sub_22DC92D28();

                  *(void *)&long long v124 = v84;
                  unint64_t v88 = *(void *)(v84 + 16);
                  if (v88 >= *(void *)(v84 + 24) >> 1)
                  {
                    sub_22D9BA448();
                    uint64_t v84 = v124;
                  }
                  ++v83;
                  *(void *)(v84 + 16) = v88 + 1;
                  *(void *)(v84 + 8 * v88 + 32) = v87;
                }
                while (v64 != v83);
                swift_bridgeObjectRelease();
                uint64_t v55 = v121;
                uint64_t v79 = &selRef_currentSunriseTime;
                goto LABEL_36;
              }
              __break(1u);
              goto LABEL_46;
            }
          }
          swift_bridgeObjectRelease();
LABEL_36:
          uint64_t v89 = sub_22D9A8418();
          swift_bridgeObjectRelease();
          swift_release();
          *uint64_t v50 = v89;
          v50[1] = 0;
          id v90 = [v54 v79[20]];
          sub_22DC92B48();

          sub_22DC8F248();
          uint64_t v91 = sub_22DC8F218();
          OUTLINED_FUNCTION_2_29();
          v92();
          uint64_t v93 = sub_22DBF8958(v91);
          swift_bridgeObjectRelease();
          uint64_t v94 = *(void *)(v93 + 16);
          if (v94)
          {
            *(void *)&long long v124 = MEMORY[0x263F8EE78];
            sub_22DC93528();
            uint64_t v95 = 48;
            do
            {
              objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v93 + v95));
              sub_22DC934F8();
              sub_22DC93538();
              sub_22DC93548();
              sub_22DC93508();
              v95 += 24;
              --v94;
            }
            while (v94);
          }
          swift_bridgeObjectRelease();
          char v96 = sub_22D9DC49C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          uint64_t v77 = v108;
          swift_release();
          if (v96)
          {
            *uint64_t v77 = 0;
LABEL_43:
            *((void *)v77 + 1) = 0;
            return;
          }
          char v78 = 1;
LABEL_42:
          *uint64_t v77 = v78;
          goto LABEL_43;
        }
        sub_22DC8F108();
        sub_22D9CC550(v69, (uint64_t *)&unk_2685980A0);
LABEL_19:
        uint64_t v73 = v112;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v62 = v115;
      __swift_storeEnumTagSinglePayload(v115, 1, 1, v116);
    }
    sub_22D9CC550(v62, &qword_26859BD18);
    uint64_t v72 = v111;
    sub_22DC8F108();
    goto LABEL_19;
  }
}

uint64_t sub_22DBF8958(uint64_t a1)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_22D9BA3F8();
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_22D9BA3F8();
      }
      ++v3;
      v4 += 2;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = (void *)(v11 + 24 * v8);
      v9[4] = v5;
      v9[5] = v6;
      v9[6] = v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void sub_22DBF8A54(void *a1@<X8>)
{
  *a1 = &unk_26E195F48;
}

uint64_t sub_22DBF8A64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD60);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD68);
  sub_22D9A6FA0(&qword_26859BD70, &qword_26859BD68);
  sub_22DC91B18();
  id v9 = sub_22DBFB1DC();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 16))(a1, v8, v3);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BD78) + 36)) = v9;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t sub_22DBF8BB0@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDA8);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v54 = (char *)&v48 - v6;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDB0);
  uint64_t v7 = *(void *)(v49 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v48 - v10;
  id v56 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDB8);
  sub_22D9A6FA0(&qword_26859BDC0, &qword_26859BDB8);
  uint64_t v53 = v11;
  sub_22DC92428();
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v12 = (id)qword_268595FA0;
  uint64_t v13 = (void *)sub_22DC92948();
  uint64_t v14 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

  uint64_t v16 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v18 = v17;

  uint64_t v57 = v16;
  uint64_t v58 = v18;
  sub_22D9CFB38();
  uint64_t v19 = sub_22DC91BB8();
  uint64_t v21 = v20;
  LOBYTE(v14) = v22 & 1;
  uint64_t v23 = sub_22DC91B88();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v29 = v28;
  sub_22D9CFC1C(v19, v21, (char)v14);
  swift_bridgeObjectRelease();
  LOBYTE(v19) = sub_22DC91938();
  uint64_t v30 = sub_22DC90828();
  uint64_t v57 = v23;
  uint64_t v58 = v25;
  char v59 = v27 & 1;
  uint64_t v60 = v29;
  char v61 = v19;
  uint64_t v62 = v31;
  uint64_t v63 = v32;
  uint64_t v64 = v33;
  uint64_t v65 = v34;
  char v66 = 0;
  MEMORY[0x270FA5388](v30);
  *(&v48 - 2) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859A4F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDC8);
  sub_22DA43680();
  sub_22D9A6FA0(&qword_26859BDD0, &qword_26859BDC8);
  uint64_t v35 = v54;
  sub_22DC92408();
  unint64_t v36 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v37 = v48;
  uint64_t v38 = v49;
  v36(v48, v53, v49);
  uint64_t v40 = v51;
  uint64_t v39 = v52;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v41(v55, v35, v52);
  uint64_t v42 = v50;
  v36(v50, v37, v38);
  uint64_t v43 = &v42[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26859BDD8) + 48)];
  uint64_t v44 = v55;
  v41(v43, v55, v39);
  unint64_t v45 = *(void (**)(char *, uint64_t))(v40 + 8);
  v45(v54, v39);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v7 + 8);
  v46(v53, v38);
  v45(v44, v39);
  return ((uint64_t (*)(char *, uint64_t))v46)(v37, v38);
}

uint64_t sub_22DBF90A8@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v42 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE68);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v41 = (uint64_t)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE70) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v40);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v39 = (uint64_t)&v33 - v8;
  uint64_t v9 = sub_22DC90C88();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v37 = v9;
  uint64_t v38 = v10;
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE78);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v35 = v13;
  uint64_t v36 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE80);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v33 = (char *)&v33 - v22;
  long long v43 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD80);
  sub_22DC92248();
  type metadata accessor for WFTimeTriggerEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE88);
  sub_22DBFD380(&qword_26859BE90, type metadata accessor for WFTimeTriggerEvent);
  sub_22D9A6FA0(&qword_26859BE98, &qword_26859BE88);
  sub_22DC922B8();
  sub_22DC90C78();
  sub_22D9A6FA0(&qword_26859BEA0, &qword_26859BE78);
  uint64_t v23 = v35;
  uint64_t v24 = v37;
  sub_22DC91CC8();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v24);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v23);
  uint64_t v25 = v33;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v33, v21, v17);
  uint64_t v26 = v41;
  sub_22DBF9A6C(v34, v41);
  sub_22D9CC3C8(v26, (uint64_t)v7, &qword_26859BE68);
  *(_WORD *)&v7[*(int *)(v40 + 44)] = 1;
  sub_22D9CC550(v26, &qword_26859BE68);
  uint64_t v27 = v39;
  sub_22DBFD1F8((uint64_t)v7, v39);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v28(v21, v25, v17);
  sub_22D9CC3C8(v27, (uint64_t)v7, &qword_26859BE70);
  uint64_t v29 = v42;
  v28(v42, v21, v17);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEA8);
  sub_22D9CC3C8((uint64_t)v7, (uint64_t)&v29[*(int *)(v30 + 48)], &qword_26859BE70);
  sub_22D9CC550(v27, &qword_26859BE70);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v18 + 8);
  v31(v25, v17);
  sub_22D9CC550((uint64_t)v7, &qword_26859BE70);
  return ((uint64_t (*)(char *, uint64_t))v31)(v21, v17);
}

uint64_t sub_22DBF95F4@<X0>(uint64_t a1@<X8>)
{
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268595FA0;
  uint64_t v3 = (void *)sub_22DC92948();
  uint64_t v4 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  sub_22D9CFB38();
  uint64_t v6 = sub_22DC91BB8();
  uint64_t v33 = v7;
  uint64_t v34 = v6;
  uint64_t v32 = v8;
  LOBYTE(v3) = v9 & 1;
  sub_22DC929E8();
  id v10 = (id)qword_268595FA0;
  uint64_t v11 = (void *)sub_22DC92948();
  id v12 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, (SEL)&selRef_numberOfRowsInSection_, v11, v12, 0);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v14 = sub_22DC91BB8();
  uint64_t v16 = v15;
  uint64_t v31 = v17;
  char v19 = v18 & 1;
  sub_22DC929E8();
  id v20 = (id)qword_268595FA0;
  uint64_t v21 = (void *)sub_22DC92948();
  uint64_t v22 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, v22, 0);

  uint64_t v24 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v35 = v24;
  uint64_t v25 = sub_22DC91BB8();
  uint64_t v27 = v26;
  LOBYTE(v20) = v28 & 1;
  *(_DWORD *)(a1 + 17) = v35;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v35 + 3);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v44;
  *(_WORD *)(a1 + 62) = v43;
  *(_DWORD *)(a1 + 58) = v42;
  *(_DWORD *)(a1 + 84) = *(_DWORD *)&v41[3];
  *(_DWORD *)(a1 + 81) = *(_DWORD *)v41;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v40[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v40;
  *(_WORD *)(a1 + 126) = v39;
  *(_DWORD *)(a1 + 122) = v38;
  *(_DWORD *)(a1 + 148) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a1 + 145) = *(_DWORD *)v37;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a1 + 169) = *(_DWORD *)v36;
  *(void *)a1 = v34;
  *(void *)(a1 + 8) = v33;
  *(unsigned char *)(a1 + 16) = (_BYTE)v3;
  *(void *)(a1 + 24) = v32;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 57) = 0;
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 72) = v16;
  *(unsigned char *)(a1 + 80) = v19;
  *(void *)(a1 + 88) = v31;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(unsigned char *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 121) = 0;
  *(void *)(a1 + 128) = v25;
  *(void *)(a1 + 136) = v26;
  *(unsigned char *)(a1 + 144) = v28 & 1;
  *(void *)(a1 + 152) = v29;
  *(void *)(a1 + 160) = 2;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 2;
  *(unsigned char *)(a1 + 184) = 0;
  *(unsigned char *)(a1 + 185) = 0;
  sub_22D9CFBC8(v34, v33, (char)v3);
  swift_bridgeObjectRetain();
  sub_22D9CFBC8(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_22D9CFBC8(v25, v27, (char)v20);
  swift_bridgeObjectRetain();
  sub_22D9CFC1C(v25, v27, (char)v20);
  swift_bridgeObjectRelease();
  sub_22D9CFC1C(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_22D9CFC1C(v34, v33, (char)v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBF9A6C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v41 = sub_22DC91468();
  v38[2] = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE10);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE18);
  uint64_t v39 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEB0);
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEB8);
  MEMORY[0x270FA5388](v46);
  uint64_t v49 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEC0);
  MEMORY[0x270FA5388](v52);
  uint64_t v48 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_22DC90C88();
  uint64_t v43 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  id v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEC8);
  uint64_t v42 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BED0);
  uint64_t v45 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  char v19 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v44 = (char *)v38 - v20;
  long long v55 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD80);
  sub_22DC92228();
  if ((unint64_t)v54 >= 2)
  {
    uint64_t v44 = (char *)v13;
    uint64_t v45 = v16;
    uint64_t v29 = v49;
    if ((void)v54 == 2)
    {
      uint64_t v30 = sub_22DC911D8();
      uint64_t v42 = v31;
      uint64_t v43 = v30;
      v38[1] = v32;
      type metadata accessor for TimeOfDayConfigurationView();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
      sub_22DC92248();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE28);
      uint64_t v33 = v5;
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_22DCB0EA0;
      sub_22DC91448();
      *(void *)&long long v55 = v34;
      sub_22DBFD380(&qword_26859BE30, MEMORY[0x263F19B78]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE38);
      sub_22D9A6FA0(&qword_26859BE40, &qword_26859BE38);
      sub_22DC932C8();
      sub_22DC90808();
      uint64_t v35 = v39;
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v29, v7, v33);
      swift_storeEnumTagMultiPayload();
      uint64_t v36 = sub_22D9A6FA0(&qword_26859BEE0, &qword_26859BEC8);
      *(void *)&long long v55 = v44;
      *((void *)&v55 + 1) = v47;
      uint64_t v56 = v36;
      uint64_t v57 = MEMORY[0x263F18E00];
      swift_getOpaqueTypeConformance2();
      sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
      uint64_t v37 = (uint64_t)v48;
      sub_22DC91418();
      sub_22D9CC3C8(v37, v50, &qword_26859BEC0);
      swift_storeEnumTagMultiPayload();
      sub_22DBFD260();
      sub_22DC91418();
      sub_22D9CC550(v37, &qword_26859BEC0);
      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v33);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_22DBFD260();
      return sub_22DC91418();
    }
  }
  else
  {
    long long v54 = *(long long *)((char *)a1 + *(int *)(type metadata accessor for TimeOfDayConfigurationView() + 24));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDA0);
    uint64_t v21 = sub_22DC92248();
    uint64_t v40 = (char *)v38;
    MEMORY[0x270FA5388](v21);
    type metadata accessor for WFTimeTriggerOffset(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BEE8);
    uint64_t v41 = v5;
    sub_22DBFD380(&qword_26859BEF0, type metadata accessor for WFTimeTriggerOffset);
    sub_22DBFD3C8(&qword_26859BEF8, &qword_26859BEE8);
    sub_22DC922B8();
    sub_22DC90C78();
    uint64_t v22 = sub_22D9A6FA0(&qword_26859BEE0, &qword_26859BEC8);
    uint64_t v23 = MEMORY[0x263F18E00];
    uint64_t v24 = v47;
    sub_22DC91CC8();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v24);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v13);
    uint64_t v26 = v44;
    uint64_t v25 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v44, v19, v16);
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v49, v26, v16);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v55 = v13;
    *((void *)&v55 + 1) = v24;
    uint64_t v56 = v22;
    uint64_t v57 = v23;
    swift_getOpaqueTypeConformance2();
    sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
    uint64_t v27 = (uint64_t)v48;
    sub_22DC91418();
    sub_22D9CC3C8(v27, v50, &qword_26859BEC0);
    swift_storeEnumTagMultiPayload();
    sub_22DBFD260();
    sub_22DC91418();
    sub_22D9CC550(v27, &qword_26859BEC0);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v26, v16);
  }
}

uint64_t sub_22DBFA498(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimeOfDayConfigurationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = &unk_26E196058;
  swift_getKeyPath();
  sub_22DBFD430(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_22DBFD610((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF00);
  sub_22D9A6FA0(&qword_26859BF08, &qword_26859BF00);
  sub_22DBFD380(&qword_26859BEF0, type metadata accessor for WFTimeTriggerOffset);
  return sub_22DC923D8();
}

uint64_t sub_22DBFA658@<X0>(uint64_t *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = self;
  long long v12 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD80);
  sub_22DC92228();
  id v7 = objc_msgSend(v6, sel_localizedSunriseSunsetDescriptionForTriggerEvent_timeOffset_, v13, v5, v12);
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

  sub_22D9CFB38();
  uint64_t result = sub_22DC91BB8();
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v9;
  *(unsigned char *)(a3 + 16) = v10 & 1;
  *(void *)(a3 + 24) = v11;
  return result;
}

uint64_t sub_22DBFA720@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDE0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDE8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = a1 + *(int *)(type metadata accessor for TimeOfDayConfigurationView() + 28);
  char v17 = *(unsigned char *)v16;
  uint64_t v18 = *(void *)(v16 + 8);
  char v25 = v17;
  uint64_t v26 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD90);
  sub_22DC92248();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDF0);
  sub_22DBFD130();
  sub_22DBFD3C8(&qword_26859BE00, &qword_26859BDF0);
  sub_22DC922B8();
  sub_22DBFAC1C(a1, (uint64_t)v8);
  char v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v19(v13, v15, v9);
  sub_22D9CC3C8((uint64_t)v8, (uint64_t)v6, &qword_26859BDE0);
  uint64_t v20 = v24;
  v19(v24, v13, v9);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE08);
  sub_22D9CC3C8((uint64_t)v6, (uint64_t)&v20[*(int *)(v21 + 48)], &qword_26859BDE0);
  sub_22D9CC550((uint64_t)v8, &qword_26859BDE0);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v15, v9);
  sub_22D9CC550((uint64_t)v6, &qword_26859BDE0);
  return ((uint64_t (*)(char *, uint64_t))v22)(v13, v9);
}

uint64_t sub_22DBFA9F0()
{
  return sub_22DC923D8();
}

uint64_t sub_22DBFAAC4@<X0>(uint64_t a1@<X8>)
{
  sub_22DC929E8();
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268595FA0;
  uint64_t v3 = (void *)sub_22DC92948();
  uint64_t v4 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  sub_22D9CFB38();
  uint64_t result = sub_22DC91BB8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_22DBFAC1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_22DC91468();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE10);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE18);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE20);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TimeOfDayConfigurationView();
  uint64_t v12 = (char *)(a1 + *(int *)(v11 + 28));
  char v13 = *v12;
  uint64_t v14 = *((void *)v12 + 1);
  LOBYTE(v46) = v13;
  *((void *)&v46 + 1) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD90);
  sub_22DC92228();
  if ((_BYTE)v42)
  {
    if (v42 == 1)
    {
      uint64_t v15 = (uint64_t *)(a1 + *(int *)(v11 + 32));
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      uint64_t v42 = v17;
      uint64_t v43 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD98);
      sub_22DC92248();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_22DB9387C();
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      char v24 = v23;
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      *(void *)uint64_t v10 = v18;
      *((void *)v10 + 1) = v20;
      *((void *)v10 + 2) = v22;
      v10[24] = v24 & 1;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE48);
      sub_22DBFD17C();
      sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
      sub_22DC91418();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
    else
    {
      uint64_t v28 = sub_22DC911D8();
      uint64_t v37 = v29;
      uint64_t v38 = v28;
      v35[3] = v30;
      uint64_t v36 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
      sub_22DC92248();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE28);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_22DCB0EA0;
      sub_22DC91458();
      *(void *)&long long v46 = v32;
      sub_22DBFD380(&qword_26859BE30, MEMORY[0x263F19B78]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE38);
      sub_22D9A6FA0(&qword_26859BE40, &qword_26859BE38);
      sub_22DC932C8();
      sub_22DC90808();
      uint64_t v34 = v39;
      uint64_t v33 = v40;
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v10, v7, v40);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE48);
      sub_22DBFD17C();
      sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
      sub_22DC91418();
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v33);
    }
  }
  else
  {
    sub_22DB9A388();
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v42 = 0;
    char v45 = 0;
    sub_22DC91418();
    uint64_t v26 = v47;
    char v27 = v48;
    *(_OWORD *)uint64_t v10 = v46;
    *((void *)v10 + 2) = v26;
    v10[24] = v27;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE48);
    sub_22DBFD17C();
    sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
    return sub_22DC91418();
  }
}

id sub_22DBFB1DC()
{
  uint64_t v1 = sub_22DC8F258();
  uint64_t v68 = *(void *)(v1 - 8);
  uint64_t v69 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v63 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_22DC8F118();
  uint64_t v67 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v70 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_22DC8F278();
  uint64_t v4 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22DC8EF08();
  uint64_t v65 = *(void *)(v7 - 8);
  uint64_t v66 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v64 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86F20]), sel_init);
  uint64_t v10 = *v0;
  uint64_t v11 = v0[1];
  uint64_t v74 = v0;
  *(void *)&long long v75 = v10;
  *((void *)&v75 + 1) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD80);
  sub_22DC92228();
  objc_msgSend(v9, sel_setEvent_, v76);
  *(void *)&long long v75 = v10;
  *((void *)&v75 + 1) = v11;
  sub_22DC92228();
  id v72 = v9;
  if (v76 > 1)
  {
    objc_msgSend(v9, sel_setTimeOffset_, 7);
    sub_22DC8F248();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD88);
    uint64_t v19 = v68;
    uint64_t v20 = *(void *)(v68 + 72);
    unint64_t v21 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_22DCB0E90;
    unint64_t v23 = v22 + v21;
    uint64_t v24 = *MEMORY[0x263F07890];
    uint64_t v25 = v69;
    uint64_t v62 = v4;
    uint64_t v26 = *(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 104);
    v26(v22 + v21, v24, v69);
    v26(v23 + v20, *MEMORY[0x263F078C0], v25);
    uint64_t v27 = v73;
    uint64_t v28 = v67;
    sub_22DA26CEC();
    uint64_t v14 = (int *)type metadata accessor for TimeOfDayConfigurationView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
    uint64_t v18 = v70;
    sub_22DC92228();
    uint64_t v29 = v64;
    sub_22DC8F1F8();
    swift_bridgeObjectRelease();
    uint64_t v30 = v71;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v71);
    uint64_t v16 = v62;
    char v13 = v6;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v6, v27);
    uint64_t v31 = (void *)sub_22DC8EEE8();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v29, v66);
    id v15 = v72;
    objc_msgSend(v72, sel_setTime_, v31);

    uint64_t v17 = v30;
  }
  else
  {
    uint64_t v12 = v9;
    char v13 = v6;
    uint64_t v14 = (int *)type metadata accessor for TimeOfDayConfigurationView();
    long long v75 = *(_OWORD *)((char *)v74 + v14[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BDA0);
    sub_22DC92228();
    objc_msgSend(v12, sel_setTimeOffset_, v76);
    objc_msgSend(v12, sel_setTime_, 0);
    id v15 = v12;
    uint64_t v16 = v4;
    uint64_t v18 = v70;
    uint64_t v17 = v71;
  }
  type metadata accessor for TimeOfDayConfigurationView();
  uint64_t v32 = (char *)v74 + v14[7];
  char v33 = *v32;
  uint64_t v34 = *((void *)v32 + 1);
  LOBYTE(v75) = v33;
  *((void *)&v75 + 1) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD90);
  uint64_t v35 = (uint64_t)&v75;
  sub_22DC92228();
  if (!(_BYTE)v76)
  {
    objc_msgSend(v15, sel_setMode_, 0);
    sub_22DC8F248();
    uint64_t v48 = sub_22DC8F218();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v73);
    uint64_t v49 = sub_22DBF8958(v48);
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void *)(v49 + 16);
    if (v50)
    {
      *(void *)&long long v75 = MEMORY[0x263F8EE78];
      sub_22DC93528();
      uint64_t v51 = 48;
      do
      {
        sub_22DC92D38();
        sub_22DC934F8();
        sub_22DC93538();
        sub_22DC93548();
        sub_22DC93508();
        v51 += 24;
        --v50;
      }
      while (v50);
    }
    swift_bridgeObjectRelease();
    sub_22DA35EE4();
    uint64_t v58 = (void *)sub_22DC92B38();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (v76 == 1)
  {
    objc_msgSend(v15, sel_setMode_, 0);
    uint64_t v36 = (void *)((char *)v74 + v14[8]);
    uint64_t v38 = *v36;
    uint64_t v37 = v36[1];
    *(void *)&long long v75 = v38;
    *((void *)&v75 + 1) = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD98);
    sub_22DC92228();
    unint64_t v39 = v76;
    uint64_t v40 = *(void *)(v76 + 16);
    if (v40)
    {
      *(void *)&long long v75 = MEMORY[0x263F8EE78];
      sub_22DC93528();
      uint64_t v41 = sub_22DA171D8(v39);
      uint64_t v43 = v42;
      id v15 = (id)(v44 & 1);
      do
      {
        if (v41 < 0 || v41 >= 1 << *(unsigned char *)(v39 + 32))
        {
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        if (((*(void *)(v39 + 56 + (((unint64_t)v41 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v41) & 1) == 0) {
          goto LABEL_27;
        }
        if (*(_DWORD *)(v39 + 36) != v43) {
          goto LABEL_28;
        }
        sub_22DC92D38();
        uint64_t v35 = (uint64_t)&v75;
        sub_22DC934F8();
        sub_22DC93538();
        sub_22DC93548();
        sub_22DC93508();
        uint64_t v45 = sub_22D9BFC60(v41, v43, v15 & 1, v39);
        uint64_t v41 = v45;
        uint64_t v43 = v46;
        id v15 = (id)(v47 & 1);
        --v40;
      }
      while (v40);
      sub_22D9BFD6C(v45, v46, v47 & 1);
      uint64_t v35 = v75;
      swift_bridgeObjectRelease();
      id v15 = v72;
      if ((v35 & 0x8000000000000000) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = MEMORY[0x263F8EE78];
      if ((MEMORY[0x263F8EE78] & 0x8000000000000000) == 0)
      {
LABEL_21:
        if ((v35 & 0x4000000000000000) == 0)
        {
LABEL_22:
          sub_22DA35EE4();
          uint64_t v58 = (void *)sub_22DC92B38();
          swift_release();
LABEL_24:
          char v59 = &selRef_setDaysOfWeek_;
          goto LABEL_25;
        }
      }
    }
LABEL_29:
    sub_22DA8DD10(v35);
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  objc_msgSend(v15, sel_setMode_, 1);
  sub_22DA35EE4();
  uint64_t v52 = (void *)sub_22DC92B38();
  objc_msgSend(v15, sel_setDaysOfWeek_, v52);

  sub_22DC8F248();
  uint64_t v54 = v67;
  uint64_t v53 = v68;
  long long v55 = v63;
  uint64_t v56 = v18;
  uint64_t v57 = v69;
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v63, *MEMORY[0x263F07870], v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  sub_22DC92228();
  sub_22DC8F268();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v17);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v57);
  id v15 = v72;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v73);
  uint64_t v58 = (void *)sub_22DC92D38();
  char v59 = &selRef_setDayOfMonth_;
LABEL_25:
  objc_msgSend(v15, *v59, v58);

  return v15;
}

uint64_t sub_22DBFBAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = sub_22DC91188();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF10);
  return sub_22DBFBB0C(a1, a2, a3);
}

uint64_t sub_22DBFBB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22DC8F278();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F248();
  uint64_t v10 = sub_22DC8F218();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v11 = sub_22DBF8958(v10);
  swift_bridgeObjectRelease();
  v16[3] = v11;
  swift_getKeyPath();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF20);
  sub_22D9A6FA0(&qword_26859BF28, &qword_26859BF18);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BF30);
  unint64_t v14 = sub_22DBFD748();
  v16[1] = v13;
  __n128 v16[2] = v14;
  swift_getOpaqueTypeConformance2();
  return sub_22DC923D8();
}

uint64_t sub_22DBFBD28@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v40 = a4;
  uint64_t v38 = a3;
  uint64_t v46 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF20);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  uint64_t v42 = *a1;
  uint64_t v47 = v42;
  uint64_t v48 = v9;
  sub_22D9CFB38();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_22DC91BB8();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_22DC920D8();
  uint64_t v16 = sub_22DC91B58();
  uint64_t v37 = v17;
  char v19 = v18;
  uint64_t v39 = v20;
  uint64_t v21 = v38;
  swift_release();
  char v22 = v15;
  uint64_t v23 = v40;
  sub_22D9CFC1C(v11, v13, v22);
  swift_bridgeObjectRelease();
  char v24 = sub_22DC91928();
  uint64_t v41 = a2;
  uint64_t v47 = a2;
  uint64_t v48 = v21;
  uint64_t v49 = v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF50);
  MEMORY[0x230F935C0](v59, v25);
  sub_22DA50DC4(v10, v59[0]);
  char v27 = v26;
  swift_bridgeObjectRelease();
  if (v27) {
    uint64_t v28 = sub_22DC92098();
  }
  else {
    uint64_t v28 = sub_22DC920A8();
  }
  uint64_t v29 = v28;
  uint64_t v30 = sub_22DC92598();
  uint64_t v47 = v16;
  uint64_t v48 = v37;
  LOBYTE(v49) = v19 & 1;
  uint64_t v50 = v39;
  char v51 = v24;
  long long v52 = 0u;
  long long v53 = 0u;
  char v54 = 1;
  uint64_t v55 = v29;
  __int16 v56 = 256;
  uint64_t v57 = v30;
  uint64_t v58 = v31;
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v41;
  v32[3] = v21;
  uint64_t v33 = v42;
  v32[4] = v23;
  v32[5] = v33;
  v32[6] = v9;
  v32[7] = v10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF30);
  sub_22DBFD748();
  uint64_t v34 = v43;
  sub_22DC91D18();
  swift_release();
  sub_22D9CFC1C(v47, v48, v49);
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v44 + 32))(v46, v34, v45);
}

uint64_t sub_22DBFC034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BF50);
  MEMORY[0x230F935C0](&v18);
  sub_22DA50DC4(a6, v18);
  char v12 = v11;
  swift_bridgeObjectRelease();
  if (v12)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x230F935C0](&v18, v10);
    sub_22D9BD8F0(a6);
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    uint64_t v14 = v18;
  }
  else
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x230F935C0](&v14, v10);
    sub_22D9B1BAC();
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
  }
  sub_22DC92358();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_22DBFC190@<X0>(uint64_t a1@<X8>)
{
  return sub_22DBFBAA4(*v1, v1[1], v1[2], a1);
}

uint64_t type metadata accessor for TimeOfDayConfigurationView()
{
  uint64_t result = qword_26859BD30;
  if (!qword_26859BD30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22DBFC1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t destroy for DayPickerView()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s10WorkflowUI13DayPickerViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DayPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DayPickerView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DayPickerView()
{
  return &type metadata for DayPickerView;
}

void *sub_22DBFC3C8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DayPickerView.Day(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for DayPickerView.Day(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for DayPickerView.Day()
{
  return &type metadata for DayPickerView.Day;
}

unsigned char *storeEnumTagSinglePayload for TimeOfDayConfigurationView.RepeatFrequency(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x22DBFC574);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeOfDayConfigurationView.RepeatFrequency()
{
  return &type metadata for TimeOfDayConfigurationView.RepeatFrequency;
}

uint64_t *sub_22DBFC5AC(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22DC8F118();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v29(v9, v10, v11);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
    *(void *)&v9[*(int *)(v12 + 28)] = *(void *)&v10[*(int *)(v12 + 28)];
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)v4 + v14;
    char v19 = (char *)a2 + v14;
    *uint64_t v18 = *v19;
    *((void *)v18 + 1) = *((void *)v19 + 1);
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    char v22 = (uint64_t *)((char *)v4 + v20);
    uint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *char v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = (char *)v4 + v21;
    char v26 = (char *)a2 + v21;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    v29(v25, v26, v11);
    *(void *)&v25[*(int *)(v12 + 28)] = *(void *)&v26[*(int *)(v12 + 28)];
  }
  swift_retain();
  return v4;
}

uint64_t sub_22DBFC760(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22DC8F118();
  unsigned int v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v6(a1 + *(int *)(a2 + 36), v5);
  return swift_release();
}

void *sub_22DBFC870(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22DC8F118();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  v27(v8, v9, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  *(void *)&v8[*(int *)(v11 + 28)] = *(void *)&v9[*(int *)(v11 + 28)];
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (char *)a1 + v13;
  uint64_t v18 = (char *)a2 + v13;
  *uint64_t v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)((char *)a1 + v19);
  char v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = (char *)a1 + v20;
  uint64_t v25 = (char *)a2 + v20;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v27(v24, v25, v10);
  *(void *)&v24[*(int *)(v11 + 28)] = *(void *)&v25[*(int *)(v11 + 28)];
  swift_retain();
  return a1;
}

char *sub_22DBFC9D8(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22DC8F118();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  *(void *)&v7[*(int *)(v11 + 28)] = *(void *)&v8[*(int *)(v11 + 28)];
  swift_retain();
  swift_release();
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (void *)((char *)a2 + v12);
  *(void *)uint64_t v13 = *v14;
  *((void *)v13 + 1) = v14[1];
  swift_retain();
  swift_release();
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  *uint64_t v16 = *v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = (char *)a2 + v18;
  *(void *)&a1[v18] = *(void *)((char *)a2 + v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  uint64_t v21 = a3[9];
  char v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  v10(&a1[v21], v23, v9);
  *(void *)&v22[*(int *)(v11 + 28)] = *(void *)&v23[*(int *)(v11 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_22DBFCB90(char *a1, _OWORD *a2, int *a3)
{
  *(_OWORD *)a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22DC8F118();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  *(void *)&v7[*(int *)(v11 + 28)] = *(void *)&v8[*(int *)(v11 + 28)];
  uint64_t v12 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)&a1[v12] = *(_OWORD *)((char *)a2 + v12);
  uint64_t v13 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = (char *)a2 + v13;
  v10(&a1[v13], v15, v9);
  *(void *)&v14[*(int *)(v11 + 28)] = *(void *)&v15[*(int *)(v11 + 28)];
  return a1;
}

char *sub_22DBFCC98(char *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v6;
  swift_release();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22DC8F118();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;
  swift_release();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = (char *)a2 + v18;
  *uint64_t v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_release();
  uint64_t v21 = a3[8];
  char v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  *(void *)&a1[v21] = *(void *)((char *)a2 + v21);
  swift_bridgeObjectRelease();
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_release();
  uint64_t v24 = a3[9];
  uint64_t v25 = &a1[v24];
  char v26 = (char *)a2 + v24;
  v11(&a1[v24], v26, v10);
  *(void *)&v25[*(int *)(v12 + 28)] = *(void *)&v26[*(int *)(v12 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_22DBFCE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22DBFCE1C);
}

uint64_t sub_22DBFCE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_22DBFCEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22DBFCEC4);
}

void sub_22DBFCEC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
}

void sub_22DBFCF54()
{
  sub_22DBFCFFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22DBFCFFC()
{
  if (!qword_26859BD40)
  {
    sub_22DC8F118();
    unint64_t v0 = sub_22DC92258();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26859BD40);
    }
  }
}

uint64_t sub_22DBFD054()
{
  return sub_22D9A6FA0(&qword_26859BD48, &qword_26859BD50);
}

unint64_t sub_22DBFD094()
{
  unint64_t result = qword_26859BD58;
  if (!qword_26859BD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BD58);
  }
  return result;
}

uint64_t sub_22DBFD0E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DBFD0FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22DBFD118@<X0>(char *a1@<X8>)
{
  return sub_22DBF8BB0(*(char **)(v1 + 16), a1);
}

uint64_t sub_22DBFD120@<X0>(char *a1@<X8>)
{
  return sub_22DBF90A8(*(long long **)(v1 + 16), a1);
}

uint64_t sub_22DBFD128@<X0>(char *a1@<X8>)
{
  return sub_22DBFA720(*(void *)(v1 + 16), a1);
}

unint64_t sub_22DBFD130()
{
  unint64_t result = qword_26859BDF8;
  if (!qword_26859BDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BDF8);
  }
  return result;
}

unint64_t sub_22DBFD17C()
{
  unint64_t result = qword_26859BE50;
  if (!qword_26859BE50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BE48);
    sub_22DB9A388();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BE50);
  }
  return result;
}

uint64_t sub_22DBFD1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BE70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22DBFD260()
{
  unint64_t result = qword_26859BED8;
  if (!qword_26859BED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BEC0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BEC8);
    sub_22DC90C88();
    sub_22D9A6FA0(&qword_26859BEE0, &qword_26859BEC8);
    swift_getOpaqueTypeConformance2();
    sub_22D9A6FA0(&qword_26859BE58, &qword_26859BE18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BED8);
  }
  return result;
}

uint64_t sub_22DBFD378()
{
  return sub_22DBFA498(*(void *)(v0 + 16));
}

uint64_t sub_22DBFD380(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22DBFD3C8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22DBFD430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeOfDayConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBFD494()
{
  uint64_t v1 = (int *)(type metadata accessor for TimeOfDayConfigurationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_22DC8F118();
  OUTLINED_FUNCTION_14_0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v7, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859BD20);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v10(v6 + v1[11], v8);
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_22DBFD610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeOfDayConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DBFD674@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TimeOfDayConfigurationView() - 8);
  uint64_t v6 = (long long *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  return sub_22DBFA658(a1, v6, a2);
}

uint64_t sub_22DBFD6F4()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22DBFD73C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22DBFBD28(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t sub_22DBFD748()
{
  unint64_t result = qword_26859BF38;
  if (!qword_26859BF38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BF30);
    sub_22DA43680();
    sub_22D9A6FA0(&qword_26859BF40, &qword_26859BF48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BF38);
  }
  return result;
}

uint64_t sub_22DBFD7E8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22DBFD838()
{
  return sub_22DBFC034(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

unint64_t sub_22DBFD84C()
{
  unint64_t result = qword_26859BF58;
  if (!qword_26859BF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26859BD78);
    sub_22D9A6FA0(&qword_26859BF60, &qword_26859BD60);
    sub_22D9A6FA0((unint64_t *)&qword_2685932A8, &qword_2685932B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26859BF58);
  }
  return result;
}

uint64_t sub_22DBFD910()
{
  return sub_22D9A6FA0(&qword_26859BF68, &qword_26859BF70);
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SmartShortcutPickerPromotedActionsDataSource.init()();
  return v0;
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.sections.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22DC90768();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22DBFD9F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SmartShortcutPickerPromotedActionsDataSource.sections.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22DBFDA24()
{
  return SmartShortcutPickerPromotedActionsDataSource.sections.setter();
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.sections.setter()
{
  return sub_22DC90778();
}

void (*SmartShortcutPickerPromotedActionsDataSource.sections.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_22DC90758();
  return sub_22D9C1014;
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.$sections.getter()
{
  return swift_endAccess();
}

uint64_t sub_22DBFDBB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return SmartShortcutPickerPromotedActionsDataSource.$sections.setter((uint64_t)v4);
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.$sections.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C0);
  sub_22DC90748();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

void (*SmartShortcutPickerPromotedActionsDataSource.$sections.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C8);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[6] = malloc(v6);
  v3[7] = malloc(v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C0);
  sub_22DC90738();
  swift_endAccess();
  return sub_22DBFDE84;
}

void sub_22DBFDE84(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 56);
  if (a2)
  {
    uint64_t v5 = v2[4];
    uint64_t v6 = v2[5];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 48), v4, v5);
    SmartShortcutPickerPromotedActionsDataSource.$sections.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    SmartShortcutPickerPromotedActionsDataSource.$sections.setter(*(void *)(*(void *)a1 + 56));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0 + OBJC_IVAR____TtC10WorkflowUI44SmartShortcutPickerPromotedActionsDataSource__sections;
  v9[1] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685932F0);
  sub_22DC90728();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v7, v6, v1);
  return v0;
}

uint64_t sub_22DBFE014@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SmartShortcutPickerPromotedActionsDataSource.sections.getter();
  *a1 = result;
  return result;
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.load()()
{
  OUTLINED_FUNCTION_6_2();
  *(void *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593FB0);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22DBFE0D4, 0, 0);
}

uint64_t sub_22DBFE0D4()
{
  uint64_t v1 = sub_22DBFE34C();
  uint64_t v2 = v0[3];
  uint64_t v3 = v1;
  uint64_t v4 = v0[2];
  uint64_t v5 = sub_22DC92C98();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v5);
  sub_22DC92C68();
  swift_retain();
  uint64_t v6 = sub_22DC92C58();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  _OWORD v7[3] = v8;
  v7[4] = v4;
  v7[5] = v3;
  v0[4] = sub_22D9FDA58();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[5] = v9;
  void *v9 = v0;
  v9[1] = sub_22DBFE264;
  return MEMORY[0x270FA1FD0]();
}

uint64_t sub_22DBFE264()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_5_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22DB405C4, 0, 0);
}

__objc2_prot **sub_22DBFE34C()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedRegistry);
  uint64_t v3 = (void *)sub_22DC92948();
  uint64_t v4 = &_OBJC_LABEL_PROTOCOL___WFCompactThumbnailViewControllerDelegate;
  id v5 = objc_msgSend(v2, sel_createActionWithIdentifier_serializedParameters_, v3, 0);

  uint64_t v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v8 = v7;
  id v9 = objc_allocWithZone(MEMORY[0x263F01878]);
  id v10 = sub_22DA3B530(v6, v8, 1);
  if (v0)
  {
  }
  else
  {
    id v11 = v10;
    id v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F988]), sel_initWithApplicationRecord_, v10);
    uint64_t v68 = v11;
    id v12 = objc_msgSend(v1, sel_sharedRegistry);
    id v60 = objc_msgSend(v12, sel_createActionWithIdentifier_serializedParameters_, *MEMORY[0x263F872A8], 0);

    __swift_instantiateConcreteTypeFromMangledName(&qword_268593190);
    uint64_t v4 = (__objc2_prot **)swift_allocObject();
    *((_OWORD *)v4 + 1) = xmmword_22DCB0E90;
    uint64_t v13 = self;
    id v14 = objc_msgSend(v13, sel_clearColor);
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v14);

    id v16 = objc_allocWithZone(MEMORY[0x263F85438]);
    id v17 = sub_22DBD2E10(0xD000000000000017, 0x800000022DCA8A30, v15);
    sub_22DBFEC40(v5, 0, v17, 0, 0, (uint64_t)(v4 + 4));

    uint64_t v18 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v66 = v19;
    uint64_t v67 = (__objc2_prot *)v18;
    sub_22DC929E8();
    uint64_t v65 = v5;
    if (qword_268592270 != -1) {
      swift_once();
    }
    id v20 = (id)qword_268595FA0;
    uint64_t v21 = (void *)sub_22DC92948();
    char v22 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, v22, 0);

    uint64_t v24 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v63 = v25;
    uint64_t v64 = (__objc2_prot *)v24;

    sub_22D9F98B0();
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    id v62 = sub_22DBBB150();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268593198);
    type metadata accessor for SmartShortcutPickerEntry();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_22DCB0EA0;
    id v61 = v60;
    id v26 = objc_msgSend(v13, sel_clearColor);
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v26);

    id v28 = objc_allocWithZone(MEMORY[0x263F85438]);
    sub_22DBD2E10(0xD000000000000011, 0x800000022DCA8A60, v27);
    sub_22DC93438();
    uint64_t v29 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    v81[0] = v29;
    v81[1] = v31;
    sub_22DC92A38();
    sub_22DC929E8();
    id v32 = (id)qword_268595FA0;
    uint64_t v33 = (void *)sub_22DC92948();
    uint64_t v34 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, v34, 0);

    uint64_t v36 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v58 = v37;
    uint64_t v59 = v36;

    sub_22DC929E8();
    id v38 = (id)qword_268595FA0;
    uint64_t v39 = (void *)sub_22DC92948();
    uint64_t v40 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

    uint64_t v42 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v44 = v43;

    sub_22DC929E8();
    id v45 = (id)qword_268595FA0;
    uint64_t v46 = (void *)sub_22DC92948();
    uint64_t v47 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    id v48 = objc_msgSend(v45, (SEL)&selRef_numberOfRowsInSection_, v46, v47, 0);

    uint64_t v49 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v51 = v50;

    long long v52 = v82;
    v70[0] = v59;
    v70[1] = v58;
    v70[2] = v42;
    v70[3] = v44;
    strcpy((char *)v71, "WFSelectedApp");
    v71[7] = -4864;
    strcpy((char *)v72, "WFSelectedApp");
    v72[7] = -4864;
    uint64_t v73 = v49;
    uint64_t v74 = v51;
    uint64_t v75 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v76 = v53;
    id v77 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F868D0]), sel_initWithValue_, v82);
    unint64_t v78 = 0xD00000000000001DLL;
    unint64_t v79 = 0x800000022DCA8AD0;
    uint64_t v80 = MEMORY[0x263F8EE78];
    sub_22DA3BC64((uint64_t)v70);
    sub_22D9BF6F8((uint64_t)v70, (uint64_t)v81);
    CGPointMake(v81);
    sub_22DAED728((uint64_t)v81, (uint64_t)v69);
    sub_22DAE9DB0();
    v69[0] = MEMORY[0x263F8EE88];
    char v54 = (__objc2_prot *)v62;
    uint64_t v55 = swift_bridgeObjectRetain();
    uint64_t v56 = sub_22DBD4B34(v55, v69);

    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_22DC0AE24();
    v4[12] = v67;
    v4[13] = v66;
    *((unsigned char *)v4 + 112) = 1;
    v4[15] = v64;
    v4[16] = v63;
    v4[17] = v54;
    v4[18] = (__objc2_prot *)v56;
    *((unsigned char *)v4 + 152) = 1;
  }
  return v4;
}

uint64_t sub_22DBFEB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_22DC92C68();
  v5[4] = sub_22DC92C58();
  uint64_t v7 = sub_22DC92C18();
  return MEMORY[0x270FA2498](sub_22DBFEBD8, v7, v6);
}

uint64_t sub_22DBFEBD8()
{
  OUTLINED_FUNCTION_6_2();
  swift_release();
  swift_bridgeObjectRetain();
  SmartShortcutPickerPromotedActionsDataSource.sections.setter();
  OUTLINED_FUNCTION_11();
  return v0();
}

uint64_t sub_22DBFEC40@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_22DB69090(a1);
  if (!v13) {
    uint64_t v12 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  if (!a5)
  {
    sub_22DC8F418();
    swift_bridgeObjectRetain();
    sub_22DC8F408();
    a4 = sub_22DC8F3F8();
    unint64_t v16 = v17;
    swift_release();
    if (v16)
    {
      if (a2) {
        goto LABEL_8;
      }
    }
    else
    {
      a4 = 0;
      unint64_t v16 = 0xE000000000000000;
      if (a2) {
        goto LABEL_8;
      }
    }
LABEL_10:
    sub_22D9F98B0();
    swift_bridgeObjectRetain();
    id v18 = sub_22DBBB150();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v16 = a5;
  if (!a2) {
    goto LABEL_10;
  }
LABEL_8:
  id v18 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_11:
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593198);
  type metadata accessor for SmartShortcutPickerEntry();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22DCB0EA0;
  sub_22DBFF2B8((uint64_t)v26);
  sub_22DAED728((uint64_t)v26, (uint64_t)v25);
  id v19 = a3;
  id v20 = a1;
  sub_22DAE9DB0();
  v25[0] = MEMORY[0x263F8EE88];
  id v21 = v18;
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_22DBD4B34(v22, v25);

  swift_bridgeObjectRelease();
  swift_setDeallocating();
  uint64_t result = sub_22DC0AE24();
  *(void *)a6 = v14;
  *(void *)(a6 + 8) = v15;
  *(unsigned char *)(a6 + 16) = 1;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = v16;
  *(void *)(a6 + 40) = v21;
  *(void *)(a6 + 48) = v23;
  *(unsigned char *)(a6 + 56) = 1;
  return result;
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10WorkflowUI44SmartShortcutPickerPromotedActionsDataSource__sections;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C0);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t SmartShortcutPickerPromotedActionsDataSource.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10WorkflowUI44SmartShortcutPickerPromotedActionsDataSource__sections;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685932C0);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22DBFEF78()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22D9C9B5C;
  return SmartShortcutPickerPromotedActionsDataSource.load()();
}

uint64_t sub_22DBFF004()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22DBFF04C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22D9C9B5C;
  return sub_22DBFEB40(a1, v4, v5, v7, v6);
}

unint64_t sub_22DBFF10C(uint64_t a1)
{
  unint64_t result = sub_22DBFF134();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22DBFF134()
{
  unint64_t result = qword_268593358;
  if (!qword_268593358)
  {
    type metadata accessor for SmartShortcutPickerPromotedActionsDataSource();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268593358);
  }
  return result;
}

uint64_t type metadata accessor for SmartShortcutPickerPromotedActionsDataSource()
{
  uint64_t result = qword_26859BFA0;
  if (!qword_26859BFA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22DBFF1CC()
{
  return SmartShortcutPickerPromotedActionsDataSource.$sections.getter();
}

uint64_t sub_22DBFF1F4()
{
  return type metadata accessor for SmartShortcutPickerPromotedActionsDataSource();
}

void sub_22DBFF1FC()
{
  sub_22DA3BA6C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SmartShortcutPickerPromotedActionsDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SmartShortcutPickerPromotedActionsDataSource);
}

uint64_t dispatch thunk of SmartShortcutPickerPromotedActionsDataSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

double sub_22DBFF2B8(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 128) = -1;
  return result;
}

uint64_t sub_22DBFF2D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_22DC937E8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_22DC937E8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22DBFF3A0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    goto LABEL_5;
  }
  if ((((result & 1) == 0) ^ *(unsigned __int8 *)(a2 + 32)))
  {
    char v3 = 1;
    return v3 & 1;
  }
  if (v2 == 1)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  uint64_t v4 = 33;
  while (1)
  {
    uint64_t v5 = v4 - 31;
    if (__OFADD__(v4 - 32, 1)) {
      break;
    }
    char v3 = ((result & 1) == 0) ^ *(unsigned char *)(a2 + v4);
    if ((v3 & 1) == 0)
    {
      ++v4;
      if (v5 != v2) {
        continue;
      }
    }
    return v3 & 1;
  }
  __break(1u);
  return result;
}

void sub_22DBFF414()
{
}

void sub_22DBFF434()
{
  OUTLINED_FUNCTION_48();
  uint64_t v1 = v0;
  uint64_t v3 = v2 & 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11_1();
  uint64_t v11 = v10 - v9;
  OUTLINED_FUNCTION_117();
  v12();
  uint64_t v13 = sub_22DC8FBF8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  LOBYTE(v11) = sub_22DBFF3A0(v3, v13);
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    char v18 = v3;
    uint64_t v17 = MEMORY[0x263F8EE78];
    OUTLINED_FUNCTION_121_3();
    sub_22DC8FCB8();
  }
  char v18 = v3;
  OUTLINED_FUNCTION_121_3();
  uint64_t v14 = (void (*)(uint64_t *, void))sub_22DC8FC98();
  if (*v15)
  {
    uint64_t v16 = swift_bridgeObjectRetain();
    v1(v16);
  }
  v14(&v17, 0);
  OUTLINED_FUNCTION_47();
}

uint64_t sub_22DBFF578(uint64_t a1, uint64_t a2)
{
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v4 = sub_22DC93348();
  }
  else {
    uint64_t v4 = *(void *)(a1 + 16);
  }
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (v4 > *(void *)(a2 + 16) >> 3) {
      goto LABEL_11;
    }
LABEL_14:
    sub_22DC0BBA8(a1);
    return a2;
  }
  if (a2 < 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if (sub_22DC93348() / 8 >= v4) {
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_22DC93348();
  sub_22D9B27D0(v5, v6, v7, v8, v9, v10, v11, v12, v16, v17, v18);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  a2 = v14;
LABEL_11:
  return sub_22DC0BFF8(a1, a2);
}

void sub_22DBFF678(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) <= *(void *)(a2 + 16) >> 3) {
    sub_22DC0BE90();
  }
  else {
    sub_22DC0C560();
  }
}

uint64_t sub_22DBFF6CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_22DBFF6F4(uint64_t a1)
{
  uint64_t v3 = (void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70));
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DBFF764(uint64_t a1, int a2)
{
  int v257 = a2;
  uint64_t v282 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
  OUTLINED_FUNCTION_1_0();
  uint64_t v276 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_21((uint64_t)&v252 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v256 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_21(v10);
  uint64_t v286 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593658);
  OUTLINED_FUNCTION_1_0();
  uint64_t v285 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_60();
  uint64_t v271 = v13;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_21_6();
  uint64_t v270 = v15;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_21(v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C040);
  uint64_t v19 = OUTLINED_FUNCTION_62(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_60();
  v280 = v20;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_21(v22);
  uint64_t v267 = sub_22DC90328();
  OUTLINED_FUNCTION_1_0();
  unint64_t v297 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_87_0();
  uint64_t v25 = sub_22DC8F2E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_60();
  uint64_t v277 = v29;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_21_6();
  uint64_t v255 = v31;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_21_6();
  uint64_t v266 = v33;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_21(v35);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F10);
  uint64_t v37 = OUTLINED_FUNCTION_62(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_60();
  uint64_t v273 = v38;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_21(v40);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593660);
  uint64_t v42 = OUTLINED_FUNCTION_62(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_60();
  v279 = v43;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_69_5();
  uint64_t v45 = MEMORY[0x263F8EED0];
  OUTLINED_FUNCTION_152_1();
  uint64_t v47 = v2 + *(void *)(v46 + 152);
  OUTLINED_FUNCTION_34();
  uint64_t v296 = v47;
  sub_22DA4DA68(v47, v2, &qword_268593660);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593668);
  uint64_t v49 = sub_22DC8FBF8();
  uint64_t v50 = *(void *)(v48 - 8);
  uint64_t v51 = *(unsigned char **)(v50 + 8);
  uint64_t v272 = v2;
  v295 = v51;
  id v294 = (id)(v50 + 8);
  ((void (*)(uint64_t, uint64_t))v51)(v2, v48);
  uint64_t v52 = sub_22D9A8344(v49);
  v298 = (void (*)(uint64_t, char *, uint64_t))v48;
  uint64_t v53 = sub_22DC8FBF8();
  uint64_t v268 = sub_22D9A8344(v53);
  sub_22DBFF678(v268, v52);
  uint64_t v281 = v54;
  OUTLINED_FUNCTION_152_1();
  uint64_t v56 = *(void *)(v55 + 112);
  uint64_t v260 = v2;
  uint64_t v57 = (void *)(v2 + v56);
  OUTLINED_FUNCTION_34();
  uint64_t v263 = *v57 + 64;
  OUTLINED_FUNCTION_15_20();
  unint64_t v60 = v59 & v58;
  id v287 = (id)(v27 + 16);
  v292 = (void **)(v27 + 32);
  int64_t v274 = v27;
  v291 = (void (**)(void))(v27 + 8);
  uint64_t v265 = *MEMORY[0x263F856F8];
  unint64_t v264 = v297 + 8;
  int64_t v269 = (unint64_t)(v61 + 63) >> 6;
  int64_t v253 = v269 - 1;
  uint64_t v275 = swift_bridgeObjectRetain();
  uint64_t v254 = v275 + 112;
  uint64_t v259 = MEMORY[0x263F8EE80];
  *(void *)&long long v62 = 136315138;
  long long v262 = v62;
  uint64_t v261 = MEMORY[0x263F8EE58] + 8;
  uint64_t v284 = a1;
  unint64_t v297 = v25;
LABEL_2:
  OUTLINED_FUNCTION_84_3();
  OUTLINED_FUNCTION_131_3();
  uint64_t v64 = v288;
  if (v60)
  {
LABEL_3:
    unint64_t v65 = __clz(__rbit64(v60));
    v60 &= v60 - 1;
    unint64_t v293 = v63;
    unint64_t v66 = v65 | (v63 << 6);
LABEL_4:
    uint64_t v67 = v275;
    OUTLINED_FUNCTION_66();
    v68();
    uint64_t v69 = *(void *)(v67 + 56);
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
    uint64_t v71 = *(void **)(v69 + 8 * v66);
    *(void *)(v27 + *(int *)(v70 + 48)) = v71;
    __swift_storeEnumTagSinglePayload(v27, 0, 1, v70);
    id v72 = v71;
    uint64_t v64 = v288;
    goto LABEL_11;
  }
  while (1)
  {
    if (__OFADD__(v63, 1)) {
      goto LABEL_172;
    }
    OUTLINED_FUNCTION_58_7();
    if (v74 != v75)
    {
      OUTLINED_FUNCTION_122_3();
      if (v77) {
        goto LABEL_9;
      }
      unint64_t v117 = v76 + 1;
      unint64_t v78 = v76;
      if ((uint64_t)(v76 + 1) < v269)
      {
        unint64_t v77 = *(void *)(v263 + 8 * v117);
        if (v77) {
          goto LABEL_35;
        }
        unint64_t v78 = v76 + 1;
        if ((uint64_t)(v76 + 2) < v269)
        {
          unint64_t v77 = *(void *)(v263 + 8 * (v76 + 2));
          if (v77)
          {
            v76 += 2;
          }
          else
          {
            unint64_t v117 = v76 + 3;
            unint64_t v78 = v76 + 2;
            if ((uint64_t)(v76 + 3) >= v269) {
              goto LABEL_10;
            }
            unint64_t v77 = *(void *)(v263 + 8 * v117);
            if (v77)
            {
LABEL_35:
              unint64_t v76 = v117;
            }
            else
            {
              unint64_t v78 = v76 + 3;
              OUTLINED_FUNCTION_58_7();
              if (v74 == v75) {
                goto LABEL_10;
              }
              OUTLINED_FUNCTION_122_3();
              if (!v77)
              {
                do
                {
                  OUTLINED_FUNCTION_58_7();
                  if (v74 == v75)
                  {
                    unint64_t v78 = v253;
                    goto LABEL_10;
                  }
                  unint64_t v77 = *(void *)(v122 + 8 * v123);
                  uint64_t v124 = v123 + 1;
                }
                while (!v77);
                unint64_t v76 = v124 + 5;
              }
            }
          }
LABEL_9:
          unint64_t v60 = (v77 - 1) & v77;
          unint64_t v66 = __clz(__rbit64(v77)) + (v76 << 6);
          unint64_t v293 = v76;
          goto LABEL_4;
        }
      }
    }
    else
    {
      unint64_t v78 = v73;
    }
LABEL_10:
    uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
    __swift_storeEnumTagSinglePayload(v27, 1, 1, v79);
    unint64_t v60 = 0;
    unint64_t v293 = v78;
LABEL_11:
    sub_22DC0D2D0(v27, v64, (uint64_t *)&unk_268594F10);
    uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
    if (__swift_getEnumTagSinglePayload(v64, 1, v80) == 1) {
      break;
    }
    id v290 = *(id *)(v64 + *(int *)(v80 + 48));
    OUTLINED_FUNCTION_14_7();
    uint64_t v81 = v278;
    OUTLINED_FUNCTION_76_0();
    v82();
    sub_22DA4DA68(v296, (uint64_t)v279, &qword_268593660);
    OUTLINED_FUNCTION_115_3((uint64_t)&v310);
    uint64_t v83 = sub_22DC8FBF8();
    OUTLINED_FUNCTION_10();
    v84();
    uint64_t v85 = *(void *)(v83 + 16);
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_22DC8F2D8();
    if ((v86 & 0x8000000000000000) == 0 && v86 < v85)
    {
      uint64_t v45 = v272;
      sub_22DA4DA68(v296, v272, &qword_268593660);
      OUTLINED_FUNCTION_115_3((uint64_t)&v310);
      uint64_t v87 = sub_22DC8FBF8();
      OUTLINED_FUNCTION_10();
      v88();
      unint64_t v89 = sub_22DC8F2D8();
      if ((v89 & 0x8000000000000000) != 0) {
        goto LABEL_167;
      }
      if (v89 >= *(void *)(v87 + 16)) {
        goto LABEL_168;
      }
      uint64_t v27 = v3;
      uint64_t v90 = *(unsigned __int8 *)(v87 + v89 + 32);
      swift_bridgeObjectRelease();
      sub_22DA4DA68(v296, v45, &qword_268593660);
      uint64_t v91 = sub_22DC8FC08();
      OUTLINED_FUNCTION_10();
      v92();
      unint64_t v93 = sub_22DC8F2D8();
      if ((v93 & 0x8000000000000000) != 0) {
        goto LABEL_169;
      }
      if (v93 >= *(void *)(v91 + 16)) {
        goto LABEL_170;
      }
      uint64_t v94 = *(void *)(v91 + 8 * v93 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v95 = *(void *)(v94 + 16);
      swift_bridgeObjectRelease();
      uint64_t v96 = sub_22DC8F2C8();
      if (v96 < 0 || v96 >= v95)
      {
        sub_22DC90228();
        OUTLINED_FUNCTION_14_7();
        uint64_t v104 = v266;
        unint64_t v105 = v297;
        OUTLINED_FUNCTION_66();
        v106();
        uint64_t v107 = sub_22DC90318();
        os_log_type_t v108 = sub_22DC92E78();
        uint64_t v45 = v108;
        if (os_log_type_enabled(v107, v108))
        {
          uint64_t v109 = OUTLINED_FUNCTION_24_2();
          uint64_t aBlock = OUTLINED_FUNCTION_24_3();
          *(_DWORD *)uint64_t v109 = v262;
          sub_22DC0D0D4((unint64_t *)&qword_268594F30, MEMORY[0x263F07A30]);
          uint64_t v110 = sub_22DC93798();
          *(void *)(v109 + 4) = sub_22DA2556C(v110, v111, &aBlock);
          swift_bridgeObjectRelease();
          uint64_t v112 = *v291;
          ((void (*)(uint64_t, unint64_t))*v291)(v104, v297);
          _os_log_impl(&dword_22D994000, v107, (os_log_type_t)v45, "On screen cell at invalid index path: %s", (uint8_t *)v109, 0xCu);
          swift_arrayDestroy();
          uint64_t v45 = v284;
          OUTLINED_FUNCTION_7();
          unint64_t v113 = v297;
          OUTLINED_FUNCTION_7();
          OUTLINED_FUNCTION_104_2();

          OUTLINED_FUNCTION_14_7();
          OUTLINED_FUNCTION_10();
          v114();
          ((void (*)(uint64_t, unint64_t))v112)(v81, v113);
        }
        else
        {
          OUTLINED_FUNCTION_104_2();

          uint64_t v115 = *v291;
          ((void (*)(uint64_t, unint64_t))*v291)(v104, v105);
          OUTLINED_FUNCTION_14_7();
          OUTLINED_FUNCTION_10();
          v116();
          ((void (*)(uint64_t, unint64_t))v115)(v81, v105);
        }
        OUTLINED_FUNCTION_84_3();
        OUTLINED_FUNCTION_131_3();
        goto LABEL_41;
      }
      char v308 = v90;
      sub_22DC8FCA8();
      uint64_t v97 = aBlock;
      sub_22DA4DA68(v296, v45, &qword_268593660);
      sub_22DC8FCA8();
      OUTLINED_FUNCTION_10();
      v98();
      if (!v97 || !aBlock)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_131_3();
        goto LABEL_37;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22D9DC2E0();
      uint64_t v45 = v99;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_131_3();
      if ((v45 & 1) == 0) {
        goto LABEL_37;
      }
      uint64_t v100 = sub_22DC8FBF8();
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)(v100 + 16);
      if (!v102)
      {
LABEL_26:
        swift_bridgeObjectRelease();
LABEL_37:
        if (sub_22DA50AB0(v90, v268))
        {
          id v118 = v290;
          objc_msgSend(v290, sel_removeFromSuperview);
        }
        else
        {
          OUTLINED_FUNCTION_104_2();
        }
        OUTLINED_FUNCTION_10();
        v119();
        OUTLINED_FUNCTION_84_3();
        goto LABEL_41;
      }
      if (v90 == *(unsigned __int8 *)(v100 + 32))
      {
        uint64_t v45 = 0;
      }
      else
      {
        if (v102 == 1) {
          goto LABEL_26;
        }
        sub_22DA25528(1uLL, 1, v100);
        uint64_t v45 = 1;
        if (v90 != *(unsigned __int8 *)(v101 + 33))
        {
          uint64_t v120 = 0;
          do
          {
            if (v102 - 2 == v120) {
              goto LABEL_26;
            }
            int v121 = *(unsigned __int8 *)(v101 + v120++ + 34);
          }
          while (v90 != v121);
          uint64_t v45 = v120 + 1;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v125 = sub_22DC8F2C8();
      uint64_t v27 = v255;
      MEMORY[0x230F90530](v125, v45);
      id v126 = v290;
      uint64_t v127 = v259;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t aBlock = v127;
      sub_22DC0B2BC();
      uint64_t v259 = aBlock;
      swift_bridgeObjectRelease();
      v128 = *v291;
      OUTLINED_FUNCTION_23_19();
      v128();

      OUTLINED_FUNCTION_23_19();
      v128();
      goto LABEL_2;
    }
    OUTLINED_FUNCTION_10();
    v103();
    OUTLINED_FUNCTION_104_2();
LABEL_41:
    uint64_t v64 = v288;
    unint64_t v63 = v293;
    if (v60) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  v129 = (void *)v260;
  sub_22DBFF6F4(v259);
  v130 = (void *)((char *)v129 + *(void *)((*MEMORY[0x263F8EED0] & *v129) + 0xB8));
  OUTLINED_FUNCTION_34();
  v279 = v130;
  uint64_t v273 = *v130 + 64;
  OUTLINED_FUNCTION_15_20();
  unint64_t v133 = v132 & v131;
  int64_t v274 = (unint64_t)(v134 + 63) >> 6;
  uint64_t v268 = v274 - 1;
  uint64_t v135 = 0;
  uint64_t v278 = swift_bridgeObjectRetain();
  int64_t v269 = v278 + 104;
  uint64_t v136 = v276;
  while (1)
  {
    uint64_t v137 = v282;
    v138 = v283;
    uint64_t v139 = v281;
    v140 = v280;
    if (v133)
    {
      id v294 = (id)((v133 - 1) & v133);
      unint64_t v141 = __clz(__rbit64(v133)) | (v135 << 6);
LABEL_65:
      uint64_t v142 = *(void *)(v278 + 56);
      unsigned char *v140 = *(unsigned char *)(*(void *)(v278 + 48) + v141);
      uint64_t v143 = v142 + *(void *)(v285 + 72) * v141;
      uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C048);
      sub_22DA4DA68(v143, (uint64_t)&v140[*(int *)(v144 + 48)], &qword_268593658);
      __swift_storeEnumTagSinglePayload((uint64_t)v140, 0, 1, v144);
      goto LABEL_72;
    }
    if (__OFADD__(v135, 1)) {
      goto LABEL_173;
    }
    OUTLINED_FUNCTION_58_7();
    if (v74 != v75)
    {
      OUTLINED_FUNCTION_122_3();
      if (v146) {
        goto LABEL_70;
      }
      uint64_t v147 = v145;
      if (v145 + 1 < v274)
      {
        unint64_t v146 = *(void *)(v273 + 8 * (v145 + 1));
        if (v146)
        {
          ++v145;
        }
        else
        {
          uint64_t v147 = v145 + 1;
          if (v145 + 2 >= v274) {
            goto LABEL_71;
          }
          unint64_t v146 = *(void *)(v273 + 8 * (v145 + 2));
          if (v146)
          {
            v145 += 2;
          }
          else
          {
            uint64_t v147 = v145 + 2;
            OUTLINED_FUNCTION_58_7();
            if (v74 == v75) {
              goto LABEL_71;
            }
            OUTLINED_FUNCTION_122_3();
            if (!v146)
            {
              do
              {
                OUTLINED_FUNCTION_58_7();
                if (v74 == v75)
                {
                  uint64_t v147 = v268;
                  goto LABEL_71;
                }
                unint64_t v146 = *(void *)(v269 + 8 * v135++);
              }
              while (!v146);
              uint64_t v145 = v135 + 4;
            }
          }
        }
LABEL_70:
        id v294 = (id)((v146 - 1) & v146);
        unint64_t v141 = __clz(__rbit64(v146)) + (v145 << 6);
        uint64_t v135 = v145;
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v147 = v135;
    }
LABEL_71:
    uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C048);
    __swift_storeEnumTagSinglePayload((uint64_t)v140, 1, 1, v148);
    id v294 = 0;
    uint64_t v135 = v147;
LABEL_72:
    sub_22DC0D2D0((uint64_t)v140, v45, &qword_26859C040);
    uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C048);
    if (__swift_getEnumTagSinglePayload(v45, 1, v149) == 1) {
      break;
    }
    unint64_t v293 = v135;
    uint64_t v150 = *(int *)(v286 + 48);
    uint64_t v151 = v45 + *(int *)(v149 + 48) + v150;
    uint64_t v152 = v289 + v150;
    OUTLINED_FUNCTION_14_7();
    OUTLINED_FUNCTION_76_0();
    v153();
    unint64_t v154 = *(void *)v151;
    uint64_t v155 = *(void *)(v151 + 8);
    int v156 = *(unsigned __int8 *)(v151 + 16);
    *(void *)uint64_t v152 = *(void *)v151;
    *(void *)(v152 + 8) = v155;
    *(unsigned char *)(v152 + 16) = v156;
    int v157 = *(unsigned __int8 *)v45;
    LOBYTE(v305) = *(unsigned char *)v45;
    uint64_t v158 = sub_22DC8FBF8();
    uint64_t v159 = *(void *)(v158 + 16);
    if (!v159) {
      goto LABEL_76;
    }
    if (v157 == *(unsigned __int8 *)(v158 + 32))
    {
      uint64_t v288 = 0;
      BOOL v160 = 0;
    }
    else
    {
      if (v159 == 1)
      {
LABEL_76:
        uint64_t v288 = 0;
        BOOL v160 = 1;
        goto LABEL_89;
      }
      if (v157 == *(unsigned __int8 *)(v158 + 33))
      {
        BOOL v160 = 0;
        uint64_t v164 = 1;
LABEL_84:
        uint64_t v288 = v164;
      }
      else
      {
        uint64_t v161 = 0;
        uint64_t v162 = v159 - 2;
        while (1)
        {
          BOOL v160 = v162 == v161;
          if (v162 == v161) {
            break;
          }
          int v163 = *(unsigned __int8 *)(v158 + 34 + v161++);
          if (v157 == v163)
          {
            uint64_t v164 = v161 + 1;
            goto LABEL_84;
          }
        }
        uint64_t v288 = 0;
      }
    }
LABEL_89:
    swift_bridgeObjectRelease();
    sub_22DC8FCA8();
    LODWORD(v290) = v157;
    if (aBlock)
    {
      uint64_t v165 = *(void *)(aBlock + 16);
      if (v165)
      {
        uint64_t v166 = 0;
        BOOL v168 = v156 == 3 && (v155 | v154) == 0;
        LODWORD(v295) = v168;
        uint64_t v275 = aBlock;
        v169 = (unsigned __int8 *)(aBlock + 48);
        while (1)
        {
          uint64_t v45 = *((void *)v169 - 2);
          uint64_t v170 = *((void *)v169 - 1);
          int v171 = *v169;
          v169 += 24;
          switch(v171)
          {
            case 1:
              if (v156 == 1)
              {
                BOOL v176 = v45 == v154 && v170 == v155;
                if (v176 || (sub_22DC937E8() & 1) != 0) {
                  goto LABEL_117;
                }
              }
              goto LABEL_113;
            case 2:
              if (v156 != 2) {
                goto LABEL_113;
              }
              sub_22D9A6F3C(0, (unint64_t *)&qword_26AEF9C40);
              sub_22D9BF1A8((id)v45, v170, 2);
              sub_22D9BF1A8((id)v154, v155, 2);
              char v172 = sub_22DC93138();
              sub_22D9BF180((void *)v154, v155, 2);
              v173 = (void *)v45;
              uint64_t v174 = v170;
              char v175 = 2;
              break;
            case 3:
              if (v295) {
                goto LABEL_117;
              }
              goto LABEL_113;
            default:
              if (v156) {
                goto LABEL_113;
              }
              sub_22D9A6F3C(0, (unint64_t *)&qword_26AEF9C40);
              sub_22D9BF1A8((id)v45, v170, 0);
              sub_22D9BF1A8((id)v154, v155, 0);
              char v172 = sub_22DC93138();
              sub_22D9BF180((void *)v154, v155, 0);
              v173 = (void *)v45;
              uint64_t v174 = v170;
              char v175 = 0;
              break;
          }
          sub_22D9BF180(v173, v174, v175);
          if (v172) {
            break;
          }
LABEL_113:
          if (v165 == ++v166)
          {
            uint64_t v166 = 0;
            int v177 = 1;
            goto LABEL_118;
          }
        }
LABEL_117:
        int v177 = 0;
LABEL_118:
        uint64_t v136 = v276;
        OUTLINED_FUNCTION_84_3();
      }
      else
      {
        uint64_t v166 = 0;
        int v177 = 1;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v166 = 0;
      int v177 = 1;
    }
    if ((v160 | v177))
    {
      sub_22D9BF180((void *)v154, v155, v156);
      OUTLINED_FUNCTION_14_7();
      OUTLINED_FUNCTION_10();
      v178();
    }
    else
    {
      MEMORY[0x230F90530](v166, v288);
      uint64_t v179 = v270;
      uint64_t v180 = v270 + *(int *)(v286 + 48);
      OUTLINED_FUNCTION_14_7();
      OUTLINED_FUNCTION_66();
      v181();
      *(void *)uint64_t v180 = v154;
      *(void *)(v180 + 8) = v155;
      *(unsigned char *)(v180 + 16) = v156;
      v182 = v279;
      OUTLINED_FUNCTION_12();
      sub_22DC0D2D0(v179, v271, &qword_268593658);
      sub_22D9BF1A8((id)v154, v155, v156);
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v307 = *v182;
      uint64_t v183 = v307;
      uint64_t *v182 = 0x8000000000000000;
      uint64_t v184 = v290;
      uint64_t v185 = sub_22D9FBC34(v290);
      uint64_t v187 = *(void *)(v183 + 16);
      BOOL v188 = (v186 & 1) == 0;
      uint64_t v45 = v187 + v188;
      if (__OFADD__(v187, v188)) {
        goto LABEL_171;
      }
      unint64_t v189 = v185;
      char v190 = v186;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26859C038);
      sub_22DC93598();
      OUTLINED_FUNCTION_84_3();
      if (v191)
      {
        uint64_t v192 = sub_22D9FBC34(v184);
        if ((v190 & 1) != (v193 & 1)) {
          goto LABEL_176;
        }
        unint64_t v189 = v192;
      }
      uint64_t v194 = v307;
      if (v190)
      {
        uint64_t v195 = OUTLINED_FUNCTION_51_8();
        sub_22DA4CEC0(v195, v196, &qword_268593658);
      }
      else
      {
        *(void *)(v307 + 8 * (v189 >> 6) + 64) |= 1 << v189;
        *(unsigned char *)(*(void *)(v194 + 48) + v189) = v184;
        uint64_t v197 = OUTLINED_FUNCTION_51_8();
        sub_22DC0D2D0(v197, v198, &qword_268593658);
        uint64_t v199 = *(void *)(v194 + 16);
        BOOL v75 = __OFADD__(v199, 1);
        uint64_t v200 = v199 + 1;
        if (v75) {
          goto LABEL_174;
        }
        *(void *)(v194 + 16) = v200;
      }
      uint64_t *v279 = v194;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v201 = *v291;
      unint64_t v202 = v297;
      ((void (*)(uint64_t, unint64_t))*v291)(v277, v297);
      sub_22D9BF180((void *)v154, v155, v156);
      ((void (*)(uint64_t, unint64_t))v201)(v289, v202);
      uint64_t v136 = v276;
    }
    uint64_t v135 = v293;
    unint64_t v133 = (unint64_t)v294;
  }
  swift_release();
  uint64_t v203 = v272;
  sub_22DA4DA68(v284, v272, &qword_268593660);
  OUTLINED_FUNCTION_115_3((uint64_t)&v309);
  OUTLINED_FUNCTION_12();
  sub_22DA4CEC0(v203, (uint64_t)v140, &qword_268593660);
  swift_endAccess();
  v204 = (char *)(v260 + *(void *)((*MEMORY[0x263F8EED0] & *(void *)v260) + 0x88));
  OUTLINED_FUNCTION_34();
  v298 = *(void (**)(uint64_t, char *, uint64_t))(v136 + 16);
  v298(v138, v204, v137);
  uint64_t v205 = v139 + 56;
  uint64_t v206 = -1 << *(unsigned char *)(v139 + 32);
  if (-v206 < 64) {
    uint64_t v207 = ~(-1 << -(char)v206);
  }
  else {
    uint64_t v207 = -1;
  }
  unint64_t v208 = v207 & *(void *)(v139 + 56);
  OUTLINED_FUNCTION_12();
  int64_t v209 = (unint64_t)(63 - v206) >> 6;
  swift_bridgeObjectRetain();
  int64_t v210 = 0;
  if (!v208) {
    goto LABEL_147;
  }
  while (2)
  {
    unint64_t v211 = __clz(__rbit64(v208));
    v208 &= v208 - 1;
    unint64_t v212 = v211 | (v210 << 6);
LABEL_160:
    char v306 = *(unsigned char *)(*(void *)(v139 + 48) + v212);
    uint64_t v305 = 0;
    sub_22DC8FCB8();
    if (v208) {
      continue;
    }
    break;
  }
LABEL_147:
  int64_t v213 = v210 + 1;
  if (__OFADD__(v210, 1))
  {
    __break(1u);
LABEL_167:
    __break(1u);
LABEL_168:
    __break(1u);
LABEL_169:
    __break(1u);
LABEL_170:
    __break(1u);
LABEL_171:
    __break(1u);
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  if (v213 >= v209) {
    goto LABEL_162;
  }
  unint64_t v214 = *(void *)(v205 + 8 * v213);
  int64_t v215 = v210 + 1;
  if (v214) {
    goto LABEL_159;
  }
  int64_t v215 = v210 + 2;
  if (v210 + 2 >= v209) {
    goto LABEL_162;
  }
  unint64_t v214 = *(void *)(v205 + 8 * v215);
  if (v214) {
    goto LABEL_159;
  }
  int64_t v215 = v210 + 3;
  if (v210 + 3 >= v209) {
    goto LABEL_162;
  }
  unint64_t v214 = *(void *)(v205 + 8 * v215);
  if (v214)
  {
LABEL_159:
    unint64_t v208 = (v214 - 1) & v214;
    unint64_t v212 = __clz(__rbit64(v214)) + (v215 << 6);
    int64_t v210 = v215;
    goto LABEL_160;
  }
  int64_t v216 = v210 + 4;
  if (v210 + 4 < v209)
  {
    unint64_t v214 = *(void *)(v205 + 8 * v216);
    int64_t v215 = v210 + 4;
    if (!v214)
    {
      while (1)
      {
        int64_t v215 = v216 + 1;
        if (__OFADD__(v216, 1)) {
          break;
        }
        if (v215 >= v209) {
          goto LABEL_162;
        }
        unint64_t v214 = *(void *)(v205 + 8 * v215);
        ++v216;
        if (v214) {
          goto LABEL_159;
        }
      }
LABEL_175:
      __break(1u);
LABEL_176:
      sub_22DC93868();
      __break(1u);
      JUMPOUT(0x22DC01630);
    }
    goto LABEL_159;
  }
LABEL_162:
  swift_endAccess();
  sub_22DA0D508();
  if (v257)
  {
    v295 = *(unsigned char **)((*MEMORY[0x263F8EED0] & *(void *)v260) + 0xC8);
    v295[v260] = 1;
    v217 = (void *)sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    sub_22DA86A70();
    OUTLINED_FUNCTION_120();
    v218 = (void *)sub_22DC92D38();
    OUTLINED_FUNCTION_33_17();

    v219 = (void *)sub_22DC92C08();
    OUTLINED_FUNCTION_33_17();

    v220 = (void *)sub_22DC92C08();
    OUTLINED_FUNCTION_33_17();

    v221 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_33_17();

    v222 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_33_17();

    id v287 = self;
    v298(v258, (char *)v138, v137);
    v291 = (void (**)(void))(v136 + 16);
    uint64_t v223 = *(unsigned __int8 *)(v276 + 80);
    uint64_t v224 = v276;
    uint64_t v289 = v223 | 7;
    id v290 = (id)((v223 + 24) & ~v223);
    unint64_t v225 = ((unint64_t)v290 + v256 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v293 = v225 + 8;
    unint64_t v226 = v225;
    unint64_t v297 = v225;
    unint64_t v227 = (v225 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v228 = swift_allocObject();
    *(void *)(v228 + 16) = v139;
    uint64_t v229 = *(void *)(v224 + 32);
    uint64_t v288 = v224 + 32;
    uint64_t v296 = v229;
    OUTLINED_FUNCTION_76_0();
    v230();
    uint64_t v231 = v260;
    *(void *)(v228 + v226) = v260;
    *(void *)(v228 + v227) = v217;
    v303 = (uint64_t (*)(void))sub_22DC0D328;
    uint64_t v304 = v228;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v300 = 1107296256;
    v292 = &v301;
    v301 = sub_22D9AA6D0;
    v302 = &block_descriptor_98;
    v232 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    id v233 = (id)v231;
    id v294 = v217;
    swift_release();
    v303 = j__CGPointMake;
    uint64_t v304 = 0;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v300 = 1107296256;
    v301 = sub_22DA86A10;
    v302 = &block_descriptor_101;
    v234 = _Block_copy(&aBlock);
    OUTLINED_FUNCTION_43_14();
    objc_msgSend(v287, v235, 1, v232, v234, 0.9);
    _Block_release(v234);
    _Block_release(v232);
    v295[v231] = 1;
    objc_msgSend(v233, sel_contentInset);
    double v237 = -v236;
    objc_msgSend(v233, sel_contentOffset);
    double v239 = v237 - v238;
    OUTLINED_FUNCTION_115_3((uint64_t)&v288);
    OUTLINED_FUNCTION_148_0();
    v240();
    uint64_t v241 = swift_allocObject();
    *(void *)(v241 + 16) = v139;
    OUTLINED_FUNCTION_151_0();
    v242();
    *(double *)(v241 + v297) = v239;
    *(void *)(v241 + v227) = v233;
    *(double *)(v241 + ((v227 + 15) & 0xFFFFFFFFFFFFFFF8)) = v237;
    objc_allocWithZone(MEMORY[0x263F82E30]);
    swift_bridgeObjectRetain();
    id v243 = v233;
    id v244 = sub_22DA8938C((uint64_t)sub_22DC0D410, v241, 0.6, 0.9);
    OUTLINED_FUNCTION_148_0();
    v245();
    uint64_t v246 = swift_allocObject();
    *(void *)(v246 + 16) = v139;
    OUTLINED_FUNCTION_151_0();
    v247();
    *(void *)(v246 + v297) = v243;
    v303 = sub_22DC0D560;
    uint64_t v304 = v246;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v300 = 1107296256;
    v301 = sub_22DC04CD0;
    v302 = &block_descriptor_110_0;
    v248 = _Block_copy(&aBlock);
    id v249 = v243;
    swift_release();
    objc_msgSend(v244, sel_addCompletion_, v248);
    _Block_release(v248);
    objc_msgSend(v244, sel_startAnimation);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_22DC04FFC();
  }
  OUTLINED_FUNCTION_10();
  return v250();
}

uint64_t sub_22DC01640(uint64_t a1, int a2)
{
  int v236 = a2;
  uint64_t v275 = a1;
  uint64_t v264 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
  uint64_t v240 = *(void *)(v264 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v264);
  double v237 = (char *)&v231 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v235 = v4;
  MEMORY[0x270FA5388](v3);
  double v239 = (char *)&v231 - v5;
  uint64_t v267 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268593678);
  unint64_t v266 = *((void *)v267 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v267);
  uint64_t v258 = (uint64_t)&v231 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int64_t v253 = (char *)&v231 - v9;
  MEMORY[0x270FA5388](v8);
  int64_t v269 = (char *)&v231 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v261 = (char *)&v231 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v260 = (char *)&v231 - v14;
  uint64_t v248 = sub_22DC90328();
  uint64_t v276 = *(char **)(v248 - 8);
  MEMORY[0x270FA5388](v248);
  v251 = (char *)&v231 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22DC8F2E8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  int v257 = (char *)&v231 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v234 = (char *)&v231 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v247 = (char *)&v231 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v231 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F10);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v265 = (void (*)(char *, char *, uint64_t))((char *)&v231 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v27);
  uint64_t v263 = (uint64_t *)((char *)&v231 - v29);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  uint64_t v259 = (uint64_t)&v231 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v231 - v33;
  uint64_t v35 = (void *)MEMORY[0x263F8EED0];
  uint64_t v274 = (uint64_t)v2 + *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x98);
  uint64_t v36 = v274;
  swift_beginAccess();
  sub_22DA4DA68(v36, (uint64_t)v34, &qword_268593680);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593688);
  uint64_t v38 = sub_22DC8FBF8();
  uint64_t v39 = *(void *)(v37 - 8);
  uint64_t v273 = *(void (**)(char *, uint64_t))(v39 + 8);
  id v272 = (id)(v39 + 8);
  v273(v34, v37);
  uint64_t v40 = sub_22D9A8698(v38);
  unint64_t v277 = v37;
  uint64_t v41 = sub_22DC8FBF8();
  uint64_t v249 = sub_22D9A8698(v41);
  sub_22DBFF678(v249, v40);
  uint64_t v262 = v42;
  uint64_t v43 = (char *)v16;
  uint64_t v44 = (uint64_t)v34;
  uint64_t v45 = *(void *)((*v35 & *v2) + 0x70);
  uint64_t v241 = v2;
  uint64_t v46 = (char *)v2 + v45;
  swift_beginAccess();
  uint64_t v47 = *(void *)v46;
  uint64_t v48 = *(void *)(*(void *)v46 + 64);
  uint64_t v244 = *(void *)v46 + 64;
  uint64_t v49 = 1 << *(unsigned char *)(v47 + 32);
  uint64_t v50 = -1;
  if (v49 < 64) {
    uint64_t v50 = ~(-1 << v49);
  }
  unint64_t v51 = v50 & v48;
  uint64_t v268 = (void (**)(char *, char *, char *))(v17 + 16);
  uint64_t v52 = (void (**)(void))(v17 + 32);
  uint64_t v254 = v17;
  uint64_t v270 = (void **)(v17 + 8);
  uint64_t v246 = *MEMORY[0x263F856F8];
  v245 = (void (**)(char *, uint64_t))(v276 + 8);
  int64_t v252 = (unint64_t)(v49 + 63) >> 6;
  int64_t v232 = v252 - 1;
  uint64_t v53 = swift_bridgeObjectRetain();
  uint64_t v54 = 0;
  int64_t v255 = v53;
  uint64_t v233 = v53 + 112;
  uint64_t v238 = MEMORY[0x263F8EE80];
  *(void *)&long long v55 = 136315138;
  long long v243 = v55;
  uint64_t v242 = MEMORY[0x263F8EE58] + 8;
  uint64_t v276 = v43;
  uint64_t v256 = (void (**)(void))(v17 + 32);
  uint64_t v250 = v44;
  while (1)
  {
    uint64_t v56 = (uint64_t)v265;
    if (v51)
    {
LABEL_5:
      unint64_t v57 = __clz(__rbit64(v51));
      v51 &= v51 - 1;
      uint64_t v271 = v54;
      unint64_t v58 = v57 | (v54 << 6);
LABEL_6:
      int64_t v59 = v255;
      (*(void (**)(uint64_t, unint64_t, char *))(v254 + 16))(v56, *(void *)(v255 + 48) + *(void *)(v254 + 72) * v58, v43);
      uint64_t v60 = *(void *)(v59 + 56);
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
      long long v62 = *(void **)(v60 + 8 * v58);
      *(void *)(v56 + *(int *)(v61 + 48)) = v62;
      __swift_storeEnumTagSinglePayload(v56, 0, 1, v61);
      id v63 = v62;
      goto LABEL_13;
    }
    while (1)
    {
      int64_t v64 = v54 + 1;
      if (__OFADD__(v54, 1)) {
        goto LABEL_177;
      }
      if (v64 >= v252)
      {
        int64_t v66 = v54;
      }
      else
      {
        unint64_t v65 = *(void *)(v244 + 8 * v64);
        if (v65) {
          goto LABEL_10;
        }
        int64_t v102 = v54 + 2;
        int64_t v66 = v54 + 1;
        if (v54 + 2 < v252)
        {
          unint64_t v65 = *(void *)(v244 + 8 * v102);
          if (v65) {
            goto LABEL_37;
          }
          int64_t v66 = v54 + 2;
          if (v54 + 3 < v252)
          {
            unint64_t v65 = *(void *)(v244 + 8 * (v54 + 3));
            if (v65)
            {
              int64_t v64 = v54 + 3;
              goto LABEL_10;
            }
            int64_t v102 = v54 + 4;
            int64_t v66 = v54 + 3;
            if (v54 + 4 < v252)
            {
              unint64_t v65 = *(void *)(v244 + 8 * v102);
              if (v65)
              {
LABEL_37:
                int64_t v64 = v102;
LABEL_10:
                unint64_t v51 = (v65 - 1) & v65;
                unint64_t v58 = __clz(__rbit64(v65)) + (v64 << 6);
                uint64_t v271 = v64;
                goto LABEL_6;
              }
              int64_t v64 = v54 + 5;
              int64_t v66 = v54 + 4;
              if (v54 + 5 < v252)
              {
                unint64_t v65 = *(void *)(v244 + 8 * v64);
                if (v65) {
                  goto LABEL_10;
                }
                while (v54 + 6 < v252)
                {
                  unint64_t v65 = *(void *)(v233 + 8 * v54++);
                  if (v65)
                  {
                    int64_t v64 = v54 + 5;
                    goto LABEL_10;
                  }
                }
                int64_t v66 = v232;
              }
            }
          }
        }
      }
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
      __swift_storeEnumTagSinglePayload(v56, 1, 1, v67);
      unint64_t v51 = 0;
      uint64_t v271 = v66;
LABEL_13:
      uint64_t v68 = v263;
      sub_22DC0D2D0(v56, (uint64_t)v263, (uint64_t *)&unk_268594F10);
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
      if (__swift_getEnumTagSinglePayload((uint64_t)v68, 1, v69) == 1)
      {
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v112 = v241;
        sub_22DBFF6F4(v238);
        unint64_t v113 = (void *)((char *)v112 + *(void *)((*MEMORY[0x263F8EED0] & *v112) + 0xB8));
        swift_beginAccess();
        uint64_t v263 = v113;
        uint64_t v114 = *v113;
        uint64_t v115 = *(void *)(*v113 + 64);
        uint64_t v254 = *v113 + 64;
        uint64_t v116 = 1 << *(unsigned char *)(v114 + 32);
        uint64_t v117 = -1;
        if (v116 < 64) {
          uint64_t v117 = ~(-1 << v116);
        }
        unint64_t v118 = v117 & v115;
        int64_t v255 = (unint64_t)(v116 + 63) >> 6;
        v251 = (char *)(v255 - 1);
        int64_t v119 = 0;
        uint64_t v259 = swift_bridgeObjectRetain();
        int64_t v252 = v259 + 104;
        while (1)
        {
          uint64_t v120 = v264;
          uint64_t v121 = v262;
          uint64_t v122 = (uint64_t)v261;
          if (v118) {
            break;
          }
          int64_t v129 = v119 + 1;
          if (__OFADD__(v119, 1)) {
            goto LABEL_178;
          }
          if (v129 >= v255)
          {
            uint64_t v131 = (char *)v119;
          }
          else
          {
            unint64_t v130 = *(void *)(v254 + 8 * v129);
            if (v130) {
              goto LABEL_72;
            }
            uint64_t v131 = (char *)(v119 + 1);
            if (v119 + 2 < v255)
            {
              unint64_t v130 = *(void *)(v254 + 8 * (v119 + 2));
              if (v130)
              {
                int64_t v129 = v119 + 2;
                goto LABEL_72;
              }
              uint64_t v131 = (char *)(v119 + 2);
              if (v119 + 3 < v255)
              {
                unint64_t v130 = *(void *)(v254 + 8 * (v119 + 3));
                if (v130)
                {
                  int64_t v129 = v119 + 3;
LABEL_72:
                  uint64_t v124 = (void *)((v130 - 1) & v130);
                  unint64_t v125 = __clz(__rbit64(v130)) + (v129 << 6);
                  int64_t v119 = v129;
LABEL_68:
                  uint64_t v126 = *(void *)(v259 + 56);
                  *uint64_t v261 = *(unsigned char *)(*(void *)(v259 + 48) + v125);
                  uint64_t v127 = v126 + *(void *)(v266 + 72) * v125;
                  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFF8);
                  sub_22DA4DA68(v127, v122 + *(int *)(v128 + 48), &qword_268593678);
                  __swift_storeEnumTagSinglePayload(v122, 0, 1, v128);
                  goto LABEL_75;
                }
                int64_t v129 = v119 + 4;
                uint64_t v131 = (char *)(v119 + 3);
                if (v119 + 4 < v255)
                {
                  unint64_t v130 = *(void *)(v254 + 8 * v129);
                  if (v130) {
                    goto LABEL_72;
                  }
                  while (v119 + 5 < v255)
                  {
                    unint64_t v130 = *(void *)(v252 + 8 * v119++);
                    if (v130)
                    {
                      int64_t v129 = v119 + 4;
                      goto LABEL_72;
                    }
                  }
                  uint64_t v131 = v251;
                }
              }
            }
          }
          uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFF8);
          __swift_storeEnumTagSinglePayload(v122, 1, 1, v132);
          uint64_t v124 = 0;
          int64_t v119 = (int64_t)v131;
LABEL_75:
          uint64_t v133 = v122;
          uint64_t v134 = v260;
          sub_22DC0D2D0(v133, (uint64_t)v260, &qword_26859BFF0);
          uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFF8);
          if (__swift_getEnumTagSinglePayload((uint64_t)v134, 1, v135) == 1)
          {
            swift_release();
            uint64_t v178 = v250;
            sub_22DA4DA68(v275, v250, &qword_268593680);
            uint64_t v179 = v274;
            swift_beginAccess();
            sub_22DA4CEC0(v178, v179, &qword_268593680);
            swift_endAccess();
            uint64_t v180 = (char *)v241 + *(void *)((*MEMORY[0x263F8EED0] & *v241) + 0x88);
            swift_beginAccess();
            uint64_t v181 = v240 + 16;
            v182 = *(void (**)(char *, char *, uint64_t))(v240 + 16);
            v182(v239, v180, v120);
            uint64_t v183 = v121 + 56;
            uint64_t v184 = -1 << *(unsigned char *)(v121 + 32);
            if (-v184 < 64) {
              uint64_t v185 = ~(-1 << -(char)v184);
            }
            else {
              uint64_t v185 = -1;
            }
            unint64_t v186 = v185 & *(void *)(v121 + 56);
            swift_beginAccess();
            int64_t v187 = (unint64_t)(63 - v184) >> 6;
            swift_bridgeObjectRetain();
            int64_t v188 = 0;
            if (!v186) {
              goto LABEL_152;
            }
LABEL_151:
            unint64_t v189 = __clz(__rbit64(v186));
            v186 &= v186 - 1;
            unint64_t v190 = v189 | (v188 << 6);
            while (1)
            {
              char v285 = *(unsigned char *)(*(void *)(v121 + 48) + v190);
              uint64_t v284 = 0;
              sub_22DC8FCB8();
              if (v186) {
                goto LABEL_151;
              }
LABEL_152:
              int64_t v191 = v188 + 1;
              if (__OFADD__(v188, 1))
              {
                __break(1u);
                goto LABEL_172;
              }
              if (v191 >= v187)
              {
LABEL_167:
                swift_endAccess();
                sub_22DA0D508();
                if (v236)
                {
                  uint64_t v273 = *(void (**)(char *, uint64_t))((*MEMORY[0x263F8EED0] & *v241) + 0xC8);
                  *((unsigned char *)v273 + (void)v241) = 1;
                  sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
                  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
                  id v195 = sub_22DA86A70();
                  uint64_t v196 = (void *)sub_22DC92D38();
                  objc_msgSend(v195, sel_setValue_forKey_, v196, *MEMORY[0x263F15C80]);

                  uint64_t v197 = (void *)sub_22DC92C08();
                  objc_msgSend(v195, sel_setValue_forKey_, v197, *MEMORY[0x263F15C68]);

                  uint64_t v198 = (void *)sub_22DC92C08();
                  objc_msgSend(v195, sel_setValue_forKey_, v198, *MEMORY[0x263F15C58]);

                  uint64_t v199 = (void *)sub_22DC92948();
                  objc_msgSend(v195, sel_setValue_forKey_, v199, *MEMORY[0x263F15C78]);

                  uint64_t v200 = (void *)sub_22DC92948();
                  objc_msgSend(v195, sel_setValue_forKey_, v200, *MEMORY[0x263F15C60]);

                  uint64_t v267 = (int *)self;
                  v201 = v237;
                  v182(v237, v239, v120);
                  uint64_t v275 = v181;
                  uint64_t v202 = *(unsigned __int8 *)(v240 + 80);
                  uint64_t v203 = v240;
                  int64_t v269 = (char *)(v202 | 7);
                  uint64_t v204 = (v202 + 24) & ~v202;
                  uint64_t v274 = v204;
                  unint64_t v205 = (v235 + v204 + 7) & 0xFFFFFFFFFFFFFFF8;
                  uint64_t v271 = v205 + 8;
                  unint64_t v206 = v205;
                  unint64_t v277 = v205;
                  unint64_t v207 = (v205 + 15) & 0xFFFFFFFFFFFFFFF8;
                  unint64_t v266 = v207;
                  uint64_t v208 = swift_allocObject();
                  *(void *)(v208 + 16) = v121;
                  uint64_t v265 = v182;
                  int64_t v209 = *(char **)(v203 + 32);
                  uint64_t v268 = (void (**)(char *, char *, char *))(v203 + 32);
                  uint64_t v276 = v209;
                  ((void (*)(uint64_t, char *, uint64_t))v209)(v208 + v204, v201, v264);
                  int64_t v210 = v241;
                  *(void *)(v208 + v206) = v241;
                  *(void *)(v208 + v207) = v195;
                  uint64_t v282 = (uint64_t (*)(void))sub_22DC0D05C;
                  uint64_t v283 = v208;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v279 = 1107296256;
                  uint64_t v270 = &v280;
                  v280 = sub_22D9AA6D0;
                  uint64_t v281 = &block_descriptor_25_0;
                  unint64_t v211 = _Block_copy(&aBlock);
                  uint64_t v212 = v121;
                  swift_bridgeObjectRetain();
                  id v213 = v210;
                  id v272 = v195;
                  swift_release();
                  uint64_t v282 = j__CGPointMake;
                  uint64_t v283 = 0;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v279 = 1107296256;
                  v280 = sub_22DA86A10;
                  uint64_t v281 = &block_descriptor_28;
                  unint64_t v214 = _Block_copy(&aBlock);
                  objc_msgSend(v267, sel__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_, 1, v211, v214, 0.9, 0.45, 0.0, 0.0, 0.0, 0.0);
                  _Block_release(v214);
                  _Block_release(v211);
                  *((unsigned char *)v273 + (void)v210) = 1;
                  objc_msgSend(v213, sel_contentInset);
                  double v216 = -v215;
                  objc_msgSend(v213, sel_contentOffset);
                  double v218 = v216 - v217;
                  v219 = v237;
                  v220 = v239;
                  v182(v237, v239, v264);
                  unint64_t v221 = v266;
                  unint64_t v222 = (v266 + 15) & 0xFFFFFFFFFFFFFFF8;
                  uint64_t v223 = swift_allocObject();
                  *(void *)(v223 + 16) = v212;
                  ((void (*)(uint64_t, char *, uint64_t))v276)(v223 + v274, v219, v264);
                  *(double *)(v223 + v277) = v218;
                  *(void *)(v223 + v221) = v213;
                  *(double *)(v223 + v222) = v216;
                  objc_allocWithZone(MEMORY[0x263F82E30]);
                  swift_bridgeObjectRetain();
                  id v224 = v213;
                  id v225 = sub_22DA8938C((uint64_t)sub_22DC0D088, v223, 0.6, 0.9);
                  v265(v219, v220, v264);
                  uint64_t v226 = swift_allocObject();
                  *(void *)(v226 + 16) = v212;
                  uint64_t v120 = v264;
                  ((void (*)(uint64_t, char *, uint64_t))v276)(v226 + v274, v219, v264);
                  *(void *)(v226 + v277) = v224;
                  uint64_t v282 = sub_22DC0D0B4;
                  uint64_t v283 = v226;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v279 = 1107296256;
                  v280 = sub_22DC04CD0;
                  uint64_t v281 = &block_descriptor_37_2;
                  unint64_t v227 = _Block_copy(&aBlock);
                  id v228 = v224;
                  swift_release();
                  objc_msgSend(v225, sel_addCompletion_, v227);
                  _Block_release(v227);
                  objc_msgSend(v225, sel_startAnimation);

                  uint64_t v229 = v240;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  sub_22DC06D40();
                  uint64_t v229 = v240;
                  v220 = v239;
                }
                return (*(uint64_t (**)(char *, uint64_t))(v229 + 8))(v220, v120);
              }
              unint64_t v192 = *(void *)(v183 + 8 * v191);
              int64_t v193 = v188 + 1;
              if (!v192)
              {
                int64_t v193 = v188 + 2;
                if (v188 + 2 >= v187) {
                  goto LABEL_167;
                }
                unint64_t v192 = *(void *)(v183 + 8 * v193);
                if (!v192)
                {
                  int64_t v193 = v188 + 3;
                  if (v188 + 3 >= v187) {
                    goto LABEL_167;
                  }
                  unint64_t v192 = *(void *)(v183 + 8 * v193);
                  if (!v192)
                  {
                    int64_t v194 = v188 + 4;
                    if (v188 + 4 >= v187) {
                      goto LABEL_167;
                    }
                    unint64_t v192 = *(void *)(v183 + 8 * v194);
                    int64_t v193 = v188 + 4;
                    if (!v192) {
                      break;
                    }
                  }
                }
              }
LABEL_164:
              unint64_t v186 = (v192 - 1) & v192;
              unint64_t v190 = __clz(__rbit64(v192)) + (v193 << 6);
              int64_t v188 = v193;
            }
            while (1)
            {
              int64_t v193 = v194 + 1;
              if (__OFADD__(v194, 1)) {
                goto LABEL_180;
              }
              if (v193 >= v187) {
                goto LABEL_167;
              }
              unint64_t v192 = *(void *)(v183 + 8 * v193);
              ++v194;
              if (v192) {
                goto LABEL_164;
              }
            }
          }
          id v272 = v124;
          uint64_t v136 = v267[12];
          uint64_t v137 = &v134[*(int *)(v135 + 48) + v136];
          v138 = &v269[v136];
          uint64_t v139 = v276;
          (*v52)();
          uint64_t v140 = *(void *)v137;
          uint64_t v141 = *((void *)v137 + 1);
          int v142 = v137[16];
          *(void *)v138 = *(void *)v137;
          *((void *)v138 + 1) = v141;
          v138[16] = v142;
          uint64_t v143 = *v134;
          LOBYTE(v284) = *v134;
          uint64_t v144 = sub_22DC8FBF8();
          uint64_t v145 = *(void *)(v144 + 16);
          uint64_t v273 = (void (*)(char *, uint64_t))v119;
          if (v145)
          {
            if (v143 == *(unsigned __int8 *)(v144 + 32))
            {
              uint64_t v271 = 0;
              BOOL v146 = 0;
              goto LABEL_92;
            }
            if (v145 != 1)
            {
              if (v143 == *(unsigned __int8 *)(v144 + 33))
              {
                BOOL v146 = 0;
                uint64_t v150 = 1;
LABEL_87:
                uint64_t v271 = v150;
              }
              else
              {
                uint64_t v147 = 0;
                uint64_t v148 = v145 - 2;
                while (1)
                {
                  BOOL v146 = v148 == v147;
                  if (v148 == v147) {
                    break;
                  }
                  int v149 = *(unsigned __int8 *)(v144 + 34 + v147++);
                  if (v143 == v149)
                  {
                    uint64_t v150 = v147 + 1;
                    goto LABEL_87;
                  }
                }
                uint64_t v271 = 0;
              }
              goto LABEL_92;
            }
          }
          uint64_t v271 = 0;
          BOOL v146 = 1;
LABEL_92:
          swift_bridgeObjectRelease();
          sub_22DC8FCA8();
          if (!aBlock)
          {
            uint64_t v152 = 0;
            int v160 = 1;
            goto LABEL_126;
          }
          uint64_t v151 = *(void *)(aBlock + 16);
          if (!v151)
          {
            uint64_t v152 = 0;
            int v160 = 1;
            goto LABEL_125;
          }
          uint64_t v152 = 0;
          BOOL v153 = v142 == 2;
          if (v141 | v140) {
            BOOL v153 = 0;
          }
          LODWORD(v265) = v153;
          BOOL v155 = v140 != 1 || v141 != 0 || v142 != 2;
          int v156 = (unsigned char *)(aBlock + 48);
          while (1)
          {
            uint64_t v157 = *((void *)v156 - 2);
            uint64_t v158 = *((void *)v156 - 1);
            if (!*v156) {
              break;
            }
            if (*v156 == 1)
            {
              if (v142 == 1 && (unsigned __int16)*((void *)v156 - 2) == (unsigned __int16)v140) {
                goto LABEL_123;
              }
            }
            else if (v157 | v158)
            {
              if (!v155) {
                goto LABEL_123;
              }
            }
            else if (v265)
            {
              goto LABEL_123;
            }
LABEL_119:
            v156 += 24;
            if (v151 == ++v152)
            {
              uint64_t v152 = 0;
              int v160 = 1;
              goto LABEL_124;
            }
          }
          if (v142) {
            goto LABEL_119;
          }
          BOOL v159 = v157 == v140 && v158 == v141;
          if (!v159 && (sub_22DC937E8() & 1) == 0) {
            goto LABEL_119;
          }
LABEL_123:
          int v160 = 0;
LABEL_124:
          uint64_t v139 = v276;
          uint64_t v52 = v256;
LABEL_125:
          swift_bridgeObjectRelease();
LABEL_126:
          if ((v146 | v160))
          {
            sub_22D9BF390(v140, v141, v142);
            ((void (*)(char *, char *))*v270)(v269, v139);
            goto LABEL_137;
          }
          uint64_t v161 = v257;
          MEMORY[0x230F90530](v152, v271);
          uint64_t v162 = (uint64_t)v253;
          int v163 = &v253[v267[12]];
          (*v268)(v253, v161, v139);
          *(void *)int v163 = v140;
          *((void *)v163 + 1) = v141;
          v163[16] = v142;
          uint64_t v164 = v263;
          swift_beginAccess();
          sub_22DC0D2D0(v162, v258, &qword_268593678);
          sub_22D9BF3A4(v140, v141, v142);
          swift_isUniquelyReferenced_nonNull_native();
          uint64_t v286 = (void *)*v164;
          uint64_t v165 = v286;
          *uint64_t v164 = 0x8000000000000000;
          uint64_t v166 = sub_22D9FBC34(v143);
          if (__OFADD__(v165[2], (v167 & 1) == 0)) {
            goto LABEL_176;
          }
          unint64_t v168 = v166;
          char v169 = v167;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26859C000);
          if ((sub_22DC93598() & 1) == 0) {
            goto LABEL_132;
          }
          uint64_t v170 = sub_22D9FBC34(v143);
          if ((v169 & 1) != (v171 & 1)) {
            goto LABEL_181;
          }
          unint64_t v168 = v170;
LABEL_132:
          char v172 = v286;
          if ((v169 & 1) == 0)
          {
            v286[(v168 >> 6) + 8] |= 1 << v168;
            *(unsigned char *)(v172[6] + v168) = v143;
            sub_22DC0D2D0(v258, v172[7] + *(void *)(v266 + 72) * v168, &qword_268593678);
            uint64_t v173 = v172[2];
            BOOL v174 = __OFADD__(v173, 1);
            uint64_t v175 = v173 + 1;
            if (!v174)
            {
              v172[2] = v175;
              goto LABEL_136;
            }
            goto LABEL_179;
          }
          sub_22DA4CEC0(v258, v286[7] + *(void *)(v266 + 72) * v168, &qword_268593678);
LABEL_136:
          *uint64_t v263 = v172;
          swift_bridgeObjectRelease();
          swift_endAccess();
          BOOL v176 = (void (*)(char *, char *))*v270;
          int v177 = v276;
          ((void (*)(char *, char *))*v270)(v257, v276);
          sub_22D9BF390(v140, v141, v142);
          v176(v269, v177);
LABEL_137:
          int64_t v119 = (int64_t)v273;
          unint64_t v118 = (unint64_t)v272;
        }
        unint64_t v123 = __clz(__rbit64(v118));
        uint64_t v124 = (void *)((v118 - 1) & v118);
        unint64_t v125 = v123 | (v119 << 6);
        goto LABEL_68;
      }
      uint64_t v70 = *(void **)((char *)v68 + *(int *)(v69 + 48));
      ((void (*)(char *, void *, char *))*v52)(v25, v68, v43);
      uint64_t v71 = v259;
      sub_22DA4DA68(v274, v259, &qword_268593680);
      unint64_t v72 = v277;
      uint64_t v73 = sub_22DC8FBF8();
      v273((char *)v71, v72);
      uint64_t v74 = *(void *)(v73 + 16);
      swift_bridgeObjectRelease();
      uint64_t v75 = sub_22DC8F2D8();
      if ((v75 & 0x8000000000000000) == 0 && v75 < v74) {
        break;
      }
      ((void (*)(char *, char *))*v270)(v25, v43);

LABEL_42:
      uint64_t v56 = (uint64_t)v265;
      uint64_t v54 = v271;
      if (v51) {
        goto LABEL_5;
      }
    }
    sub_22DA4DA68(v274, v44, &qword_268593680);
    unint64_t v76 = v277;
    uint64_t v77 = sub_22DC8FBF8();
    v273((char *)v44, v76);
    unint64_t v78 = sub_22DC8F2D8();
    if ((v78 & 0x8000000000000000) != 0) {
      break;
    }
    if (v78 >= *(void *)(v77 + 16)) {
      goto LABEL_173;
    }
    uint64_t v79 = *(unsigned __int8 *)(v77 + v78 + 32);
    swift_bridgeObjectRelease();
    sub_22DA4DA68(v274, v44, &qword_268593680);
    unint64_t v80 = v277;
    uint64_t v81 = sub_22DC8FC08();
    v273((char *)v44, v80);
    unint64_t v82 = sub_22DC8F2D8();
    if ((v82 & 0x8000000000000000) != 0) {
      goto LABEL_174;
    }
    if (v82 >= *(void *)(v81 + 16)) {
      goto LABEL_175;
    }
    uint64_t v83 = *(void *)(v81 + 8 * v82 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v84 = *(void *)(v83 + 16);
    swift_bridgeObjectRelease();
    uint64_t v85 = sub_22DC8F2C8();
    if (v85 < 0 || v85 >= v84)
    {
      uint64_t v91 = v251;
      sub_22DC90228();
      v92 = v247;
      (*v268)(v247, v25, v43);
      unint64_t v93 = sub_22DC90318();
      os_log_type_t v94 = sub_22DC92E78();
      if (os_log_type_enabled(v93, v94))
      {
        uint64_t v95 = swift_slowAlloc();
        uint64_t v96 = swift_slowAlloc();
        uint64_t aBlock = v96;
        *(_DWORD *)uint64_t v95 = v243;
        sub_22DC0D0D4((unint64_t *)&qword_268594F30, MEMORY[0x263F07A30]);
        uint64_t v97 = sub_22DC93798();
        *(void *)(v95 + 4) = sub_22DA2556C(v97, v98, &aBlock);
        swift_bridgeObjectRelease();
        uint64_t v99 = (void (*)(char *, char *))*v270;
        ((void (*)(char *, char *))*v270)(v92, v276);
        _os_log_impl(&dword_22D994000, v93, v94, "On screen cell at invalid index path: %s", (uint8_t *)v95, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230F95FD0](v96, -1, -1);
        uint64_t v100 = v95;
        uint64_t v43 = v276;
        MEMORY[0x230F95FD0](v100, -1, -1);

        (*v245)(v251, v248);
        v99(v25, v43);
      }
      else
      {

        uint64_t v101 = (void (*)(char *, char *))*v270;
        ((void (*)(char *, char *))*v270)(v92, v43);
        (*v245)(v91, v248);
        v101(v25, v43);
      }
      uint64_t v44 = v250;
      uint64_t v52 = v256;
      goto LABEL_42;
    }
    char v287 = v79;
    unint64_t v86 = v277;
    sub_22DC8FCA8();
    uint64_t v87 = aBlock;
    sub_22DA4DA68(v274, v44, &qword_268593680);
    sub_22DC8FCA8();
    v273((char *)v44, v86);
    if (!v87)
    {
      swift_bridgeObjectRelease();
      uint64_t v43 = v276;
      uint64_t v52 = v256;
      goto LABEL_39;
    }
    uint64_t v52 = v256;
    if (!aBlock)
    {
      swift_bridgeObjectRelease();
      uint64_t v43 = v276;
      goto LABEL_39;
    }
    char v88 = sub_22D9DC87C(aBlock, v87);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = v276;
    if ((v88 & 1) == 0)
    {
LABEL_39:
      if (sub_22DA50AB0(v79, v249)) {
        objc_msgSend(v70, sel_removeFromSuperview);
      }

      ((void (*)(char *, char *))*v270)(v25, v43);
      goto LABEL_42;
    }
    uint64_t v89 = sub_22DC8FBF8();
    uint64_t v90 = *(void *)(v89 + 16);
    if (!v90) {
      goto LABEL_28;
    }
    if (v79 == *(unsigned __int8 *)(v89 + 32))
    {
      uint64_t v106 = 0;
      goto LABEL_60;
    }
    if (v90 == 1)
    {
LABEL_28:
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
    if (v79 != *(unsigned __int8 *)(v89 + 33))
    {
      uint64_t v103 = 0;
      uint64_t v104 = v90 - 2;
      while (v104 != v103)
      {
        int v105 = *(unsigned __int8 *)(v89 + v103++ + 34);
        if (v79 == v105)
        {
          uint64_t v106 = v103 + 1;
          goto LABEL_60;
        }
      }
      goto LABEL_28;
    }
    uint64_t v106 = 1;
LABEL_60:
    swift_bridgeObjectRelease();
    uint64_t v107 = sub_22DC8F2C8();
    os_log_type_t v108 = v234;
    MEMORY[0x230F90530](v107, v106);
    id v109 = v70;
    uint64_t v110 = v238;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t aBlock = v110;
    sub_22DC0B2BC();
    uint64_t v238 = aBlock;
    swift_bridgeObjectRelease();
    unint64_t v111 = (void (*)(char *, char *))*v270;
    ((void (*)(char *, char *))*v270)(v108, v43);

    v111(v25, v43);
    uint64_t v54 = v271;
  }
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  __break(1u);
LABEL_179:
  __break(1u);
LABEL_180:
  __break(1u);
LABEL_181:
  uint64_t result = sub_22DC93868();
  __break(1u);
  return result;
}

uint64_t sub_22DC03734(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = self;
  LOBYTE(aBlock[0]) = 0;
  sub_22DC92EA8();
  int v13 = v12;
  int v15 = v14;
  int v17 = v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v18, v11, v8);
  *(void *)(v20 + v19) = a3;
  *(void *)(v20 + ((v19 + 15) & 0xFFFFFFFFFFFFFFF8)) = a4;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_22DC0D6CC;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_22DBCB318;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22DBFF6CC;
  aBlock[3] = &block_descriptor_120;
  uint64_t v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v23 = a3;
  id v24 = a4;
  swift_retain();
  swift_release();
  LODWORD(v25) = v13;
  LODWORD(v26) = v15;
  LODWORD(v27) = v17;
  objc_msgSend(v30, sel__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_, 2, v22, v25, v26, v27);
  _Block_release(v22);
  swift_release();
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a4) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22DC039EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = self;
  LOBYTE(aBlock[0]) = 0;
  sub_22DC92EA8();
  int v13 = v12;
  int v15 = v14;
  int v17 = v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v18, v11, v8);
  *(void *)(v20 + v19) = a3;
  *(void *)(v20 + ((v19 + 15) & 0xFFFFFFFFFFFFFFF8)) = a4;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_22DC0D128;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_22DA4B78C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22DBFF6CC;
  aBlock[3] = &block_descriptor_46;
  uint64_t v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v23 = a3;
  id v24 = a4;
  swift_retain();
  swift_release();
  LODWORD(v25) = v13;
  LODWORD(v26) = v15;
  LODWORD(v27) = v17;
  objc_msgSend(v30, sel__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_, 2, v22, v25, v26, v27);
  _Block_release(v22);
  swift_release();
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a4) {
    __break(1u);
  }
  return result;
}

void sub_22DC03CA4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = a1 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v29 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_20:
    char v32 = *(unsigned char *)(*(void *)(a1 + 48) + v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
    sub_22DC8FCA8();
    int v15 = (void *)aBlock[0];
    if (aBlock[0])
    {
      int v16 = self;
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v15;
      *(void *)(v17 + 24) = a3;
      aBlock[4] = sub_22DC0D728;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D9AA6D0;
      aBlock[3] = &block_descriptor_126;
      unint64_t v18 = _Block_copy(aBlock);
      id v19 = v15;
      id v20 = a3;
      swift_release();
      objc_msgSend(v16, sel__performWithoutRetargetingAnimations_, v18);
      _Block_release(v18);
      id v21 = objc_msgSend(v19, sel_layer);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685945E0);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_22DCB0EA0;
      *(void *)(v22 + 56) = sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
      *(void *)(v22 + 32) = a4;
      id v23 = a4;
      id v24 = (void *)sub_22DC92B38();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setFilters_, v24);

      id v25 = objc_msgSend(v19, sel_layer);
      double v26 = (void *)sub_22DC8F7C8();
      double v27 = (void *)sub_22DC92948();
      objc_msgSend(v25, sel_setValue_forKeyPath_, v26, v27);
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v12 >= v29) {
    goto LABEL_22;
  }
  unint64_t v13 = *(void *)(v28 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_19;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v29) {
    goto LABEL_22;
  }
  unint64_t v13 = *(void *)(v28 + 8 * v9);
  if (v13) {
    goto LABEL_19;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v29) {
    goto LABEL_22;
  }
  unint64_t v13 = *(void *)(v28 + 8 * v9);
  if (v13)
  {
LABEL_19:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_20;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v29)
  {
LABEL_22:
    swift_release();
    return;
  }
  unint64_t v13 = *(void *)(v28 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v29) {
      goto LABEL_22;
    }
    unint64_t v13 = *(void *)(v28 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_19;
    }
  }
LABEL_24:
  __break(1u);
}

void sub_22DC04048(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = a1 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v29 = (unint64_t)(63 - v6) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    char v33 = *(unsigned char *)(*(void *)(a1 + 48) + v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
    sub_22DC8FCA8();
    int v16 = (void *)aBlock[0];
    if (aBlock[0])
    {
      uint64_t v17 = self;
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v16;
      *(void *)(v18 + 24) = a3;
      aBlock[4] = sub_22DC0D7E0;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D9AA6D0;
      aBlock[3] = &block_descriptor_52;
      id v19 = _Block_copy(aBlock);
      id v20 = v16;
      id v21 = a3;
      swift_release();
      objc_msgSend(v17, sel__performWithoutRetargetingAnimations_, v19);
      _Block_release(v19);
      id v22 = objc_msgSend(v20, sel_layer);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685945E0);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_22DCB0EA0;
      *(void *)(v23 + 56) = sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
      *(void *)(v23 + 32) = a4;
      id v24 = a4;
      id v25 = (void *)sub_22DC92B38();
      swift_bridgeObjectRelease();
      objc_msgSend(v22, sel_setFilters_, v25);

      id v26 = objc_msgSend(v20, sel_layer);
      double v27 = (void *)sub_22DC8F7C8();
      uint64_t v28 = (void *)sub_22DC92948();
      objc_msgSend(v26, sel_setValue_forKeyPath_, v27, v28);
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v12 >= v29) {
    goto LABEL_23;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v12);
  int64_t v14 = v9 + 1;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v14 = v9 + 2;
  if (v9 + 2 >= v29) {
    goto LABEL_23;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v14);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v14 = v9 + 3;
  if (v9 + 3 >= v29) {
    goto LABEL_23;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v14);
  if (v13)
  {
LABEL_20:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v9 = v14;
    goto LABEL_21;
  }
  int64_t v15 = v9 + 4;
  if (v9 + 4 >= v29)
  {
LABEL_23:
    sub_22DA0D508();
    return;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v9 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v29) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
}

id sub_22DC04404(void *a1, void *a2)
{
  objc_msgSend(a1, sel_removeFromSuperview);
  return objc_msgSend(a2, sel_insertSubview_atIndex_, a1, 0);
}

void sub_22DC04458(uint64_t a1, CGFloat a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a1 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (v9)
  {
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_20:
    LOBYTE(v19.a) = *(unsigned char *)(*(void *)(a1 + 48) + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
    sub_22DC8FCA8();
    CGFloat a = v20.a;
    if (*(void *)&v20.a)
    {
      objc_msgSend(*(id *)&v20.a, sel_setAlpha_, 0.0);
      CGAffineTransformMakeScale(&v20, 0.65, 0.65);
      CGAffineTransformTranslate(&v19, &v20, 0.0, a2);
      CGAffineTransform v20 = v19;
      CGAffineTransformTranslate(&v19, &v20, 0.0, -70.0);
      CGAffineTransform v20 = v19;
      objc_msgSend(*(id *)&a, sel_setTransform_, &v20);
    }
  }
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v14 >= v10) {
    goto LABEL_22;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v14);
  ++v11;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 1;
  if (v14 + 1 >= v10) {
    goto LABEL_22;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v11);
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 2;
  if (v14 + 2 >= v10) {
    goto LABEL_22;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v11);
  if (v15)
  {
LABEL_19:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_20;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_22:
    swift_release();
    objc_msgSend(a4, sel_contentOffset);
    objc_msgSend(a4, sel_setContentOffset_);
    sub_22DC04FFC();
    return;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v10) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_24:
  __break(1u);
}

void sub_22DC046BC(uint64_t a1, CGFloat a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a1 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v10 = (unint64_t)(63 - v7) >> 6;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (v9)
  {
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_21:
    char v22 = *(unsigned char *)(*(void *)(a1 + 48) + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
    sub_22DC8FCA8();
    CGFloat a = v21.a;
    if (*(void *)&v21.a)
    {
      objc_msgSend(*(id *)&v21.a, sel_setAlpha_, 0.0);
      CGAffineTransformMakeScale(&v21, 0.65, 0.65);
      CGAffineTransformTranslate(&v20, &v21, 0.0, a2);
      CGAffineTransform v21 = v20;
      CGAffineTransformTranslate(&v20, &v21, 0.0, -70.0);
      CGAffineTransform v21 = v20;
      objc_msgSend(*(id *)&a, sel_setTransform_, &v21);
    }
  }
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v14 >= v10) {
    goto LABEL_23;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v14);
  int64_t v16 = v11 + 1;
  if (v15) {
    goto LABEL_20;
  }
  int64_t v16 = v11 + 2;
  if (v11 + 2 >= v10) {
    goto LABEL_23;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_20;
  }
  int64_t v16 = v11 + 3;
  if (v11 + 3 >= v10) {
    goto LABEL_23;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v11 = v16;
    goto LABEL_21;
  }
  int64_t v17 = v11 + 4;
  if (v11 + 4 >= v10)
  {
LABEL_23:
    sub_22DA0D508();
    objc_msgSend(a4, sel_contentOffset);
    objc_msgSend(a4, sel_setContentOffset_);
    sub_22DC06D40();
    return;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v17);
  if (v15)
  {
    int64_t v16 = v11 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v16 >= v10) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
}

void sub_22DC0493C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (v8)
  {
    v8 &= v8 - 1;
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
    sub_22DC8FCA8();
    if (v14)
    {
      objc_msgSend(v14, sel_removeFromSuperview);
    }
  }
  int64_t v11 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v11 >= v9) {
    goto LABEL_22;
  }
  uint64_t v12 = *(void *)(v5 + 8 * v11);
  ++v10;
  if (v12) {
    goto LABEL_19;
  }
  int64_t v10 = v11 + 1;
  if (v11 + 1 >= v9) {
    goto LABEL_22;
  }
  uint64_t v12 = *(void *)(v5 + 8 * v10);
  if (v12) {
    goto LABEL_19;
  }
  int64_t v10 = v11 + 2;
  if (v11 + 2 >= v9) {
    goto LABEL_22;
  }
  uint64_t v12 = *(void *)(v5 + 8 * v10);
  if (v12)
  {
LABEL_19:
    uint64_t v8 = (v12 - 1) & v12;
    goto LABEL_20;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v9)
  {
LABEL_22:
    swift_release();
    *((unsigned char *)a4 + *(void *)((*MEMORY[0x263F8EED0] & *a4) + 0xC8)) = 0;
    return;
  }
  uint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v10 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v10 >= v9) {
      goto LABEL_22;
    }
    uint64_t v12 = *(void *)(v5 + 8 * v10);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_24:
  __break(1u);
}

void sub_22DC04AF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  uint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v8 = (unint64_t)(63 - v5) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v7)
  {
    v7 &= v7 - 1;
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
    sub_22DC8FCA8();
    if (v15)
    {
      objc_msgSend(v15, sel_removeFromSuperview);
    }
  }
  int64_t v10 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v10 >= v8) {
    goto LABEL_23;
  }
  uint64_t v11 = *(void *)(v4 + 8 * v10);
  int64_t v12 = v9 + 1;
  if (v11) {
    goto LABEL_20;
  }
  int64_t v12 = v9 + 2;
  if (v9 + 2 >= v8) {
    goto LABEL_23;
  }
  uint64_t v11 = *(void *)(v4 + 8 * v12);
  if (v11) {
    goto LABEL_20;
  }
  int64_t v12 = v9 + 3;
  if (v9 + 3 >= v8) {
    goto LABEL_23;
  }
  uint64_t v11 = *(void *)(v4 + 8 * v12);
  if (v11)
  {
LABEL_20:
    uint64_t v7 = (v11 - 1) & v11;
    int64_t v9 = v12;
    goto LABEL_21;
  }
  int64_t v13 = v9 + 4;
  if (v9 + 4 >= v8)
  {
LABEL_23:
    sub_22DA0D508();
    *((unsigned char *)a4 + *(void *)((*MEMORY[0x263F8EED0] & *a4) + 0xC8)) = 0;
    return;
  }
  uint64_t v11 = *(void *)(v4 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v9 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v8) {
      goto LABEL_23;
    }
    uint64_t v11 = *(void *)(v4 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_22DC04CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_22DC04D28(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)MEMORY[0x263F8EED0];
  OUTLINED_FUNCTION_142_1();
  uint64_t v7 = v2 + *(void *)(v6 + 120);
  OUTLINED_FUNCTION_34();
  uint64_t v8 = *(void *)(*(void *)v7 + 16);
  if (!v8) {
    return 0;
  }
  for (uint64_t i = (uint64_t *)(*(void *)v7 + 48); ; i += 3)
  {
    unint64_t v11 = *(i - 2);
    uint64_t v10 = *(i - 1);
    uint64_t v12 = *i;
    BOOL v13 = v10 == a1 && v12 == a2;
    if (v13) {
      break;
    }
    if (sub_22DC937E8()) {
      goto LABEL_11;
    }
    if (!--v8) {
      return 0;
    }
  }
  uint64_t v10 = a1;
  uint64_t v12 = a2;
LABEL_11:
  OUTLINED_FUNCTION_142_1();
  int64_t v16 = (void *)(v2 + *(void *)(v15 + 128));
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_34();
  int64_t v17 = (void *)*v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_22DA0FF6C(v10, v12, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v18 || (id v14 = (void *)sub_22DA0FA14(v18), swift_bridgeObjectRelease(), !v14))
  {
    id v14 = objc_msgSend(objc_allocWithZone((Class)v11), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    swift_bridgeObjectRelease();
    return (uint64_t)v14;
  }
  OUTLINED_FUNCTION_12();
  swift_bridgeObjectRetain();
  swift_isUniquelyReferenced_nonNull_native();
  char v33 = (void *)*v16;
  *int64_t v16 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22D9FBAD4(v10, v12);
  OUTLINED_FUNCTION_77_3();
  if (v19)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_19_11();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F40);
    if (sub_22DC93598())
    {
      sub_22D9FBAD4(v10, v12);
      OUTLINED_FUNCTION_25_17();
      if (!v13) {
        goto LABEL_24;
      }
      unint64_t v11 = v27;
    }
    if (v8)
    {
      sub_22D9BD534((uint64_t)v14, v20, v21, v22, v23, v24, v25, v26, v31, *(void *)(v33[7] + 8 * v11));

      sub_22DC0CE84(&v32, 1, &v33, v11, v10, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *int64_t v16 = v33;
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v29 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))((*v5 & *v14) + 0x50))(v29);
      return (uint64_t)v14;
    }
  }
  __break(1u);
LABEL_24:
  uint64_t result = sub_22DC93868();
  __break(1u);
  return result;
}

void sub_22DC04FFC()
{
  OUTLINED_FUNCTION_74_5();
  uint64_t v2 = v0;
  uint64_t v293 = sub_22DC90328();
  OUTLINED_FUNCTION_1_0();
  uint64_t v271 = v3;
  MEMORY[0x270FA5388](v4);
  v269[1] = (uint64_t)v269 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void (*)(void))((char *)v269 - v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859C028);
  OUTLINED_FUNCTION_1_0();
  uint64_t v272 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v284 = (char *)v269 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v13);
  char v285 = (char *)v269 - v14;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v15);
  v292 = (char *)v269 - v16;
  OUTLINED_FUNCTION_75();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v26 = OUTLINED_FUNCTION_72_4(v18, v19, v20, v21, v22, v23, v24, v25, v269[0]);
  OUTLINED_FUNCTION_1_0();
  uint64_t v302 = v27;
  MEMORY[0x270FA5388](v28);
  uint64_t v305 = (char *)v269 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_21_6();
  uint64_t v316 = v31;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v32);
  v291 = (char *)v269 - v33;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_70_5();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F10);
  uint64_t v36 = OUTLINED_FUNCTION_62(v35);
  MEMORY[0x270FA5388](v36);
  uint64_t v304 = (void (*)(void))((char *)v269 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_75();
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_100_2(v39, v40, v41, v42, v43, v44, v45, v46, v269[0]);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593660);
  uint64_t v48 = OUTLINED_FUNCTION_62(v47);
  MEMORY[0x270FA5388](v48);
  char v287 = (char *)v269 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_69_5();
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v348);
  OUTLINED_FUNCTION_153_0();
  objc_msgSend(v0, sel_setContentSize_, Width);
  OUTLINED_FUNCTION_22_19();
  uint64_t v53 = (uint64_t)&v0[*(void *)(v52 + 160)];
  uint64_t v328 = MEMORY[0x230F96100](v53);
  if (!v328)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685945E0);
    uint64_t v194 = OUTLINED_FUNCTION_79_5();
    *(_OWORD *)(v194 + 16) = xmmword_22DCB0EA0;
    uint64_t v195 = OUTLINED_FUNCTION_94_2(v194, MEMORY[0x263F8D310]);
    OUTLINED_FUNCTION_48_8(v195, v196);
    OUTLINED_FUNCTION_8_28();
    swift_bridgeObjectRelease();
    return;
  }
  v327 = *(char **)(v53 + 8);
  objc_msgSend(v0, sel_contentOffset);
  if (v54 + -70.0 < 0.0) {
    double v55 = 0.0;
  }
  else {
    double v55 = v54 + -70.0;
  }
  objc_msgSend(v0, sel_frame);
  double v313 = v55;
  double v57 = v56 + v55 + 70.0;
  OUTLINED_FUNCTION_153_0();
  if (v58 >= v57) {
    double v59 = v57;
  }
  else {
    double v59 = v58;
  }
  double v312 = v59;
  v324 = (void (**)(void))objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  v347[0] = 0;
  OUTLINED_FUNCTION_22_19();
  uint64_t v61 = (uint64_t)&v0[*(void *)(v60 + 152)];
  OUTLINED_FUNCTION_34();
  uint64_t v286 = v61;
  sub_22DA4DA68(v61, (uint64_t)v0, &qword_268593660);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593668);
  sub_22DC8FBF8();
  OUTLINED_FUNCTION_139_2();
  v299 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v300 = v62;
  uint64_t v298 = v63 + 8;
  v299(v0, v62);
  uint64_t v64 = *(void *)(v53 + 16);
  uint64_t v65 = MEMORY[0x263F8EE58];
  v315 = v0;
  uint64_t v270 = v8;
  uint64_t v295 = v9;
  uint64_t v325 = v26;
  uint64_t v297 = v64;
  uint64_t v283 = v1;
  if (!v64)
  {
    swift_bridgeObjectRelease();
    uint64_t v278 = 0;
    uint64_t v279 = 0;
    uint64_t v276 = 0;
    goto LABEL_93;
  }
  OUTLINED_FUNCTION_9_28();
  uint64_t v53 = (uint64_t)&v0[*(void *)(v66 + 144)];
  OUTLINED_FUNCTION_9_28();
  v320 = (void (**)(void))&v0[*(void *)(v67 + 112)];
  OUTLINED_FUNCTION_9_28();
  OUTLINED_FUNCTION_9_28();
  uint64_t v273 = *(void *)(v68 + 208);
  OUTLINED_FUNCTION_9_28();
  uint64_t v280 = *(void *)(v69 + 200);
  uint64_t v296 = v70 + 32;
  v301 = v70;
  uint64_t v294 = v71;
  OUTLINED_FUNCTION_34();
  uint64_t v282 = (uint64_t *)v53;
  OUTLINED_FUNCTION_34();
  uint64_t v278 = 0;
  uint64_t v279 = 0;
  uint64_t v276 = 0;
  uint64_t v310 = (void (*)(void *@<X8>))(v327 + 88);
  v322 = v327 + 80;
  OUTLINED_FUNCTION_38_12();
  v319 = v72;
  OUTLINED_FUNCTION_60_5();
  uint64_t v277 = 1107296256;
  uint64_t v275 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v274 = 0x3FDCCCCCCCCCCCCDLL;
  OUTLINED_FUNCTION_134_2((uint64_t)"filters.gaussianBlur.inputRadius");
  uint64_t v281 = v65 + 8;
  while (1)
  {
    if ((unint64_t)v74 >= *(void *)(v73 + 16)) {
      goto LABEL_158;
    }
    v323 = v74;
    uint64_t v75 = OUTLINED_FUNCTION_132_2((uint64_t)v296);
    sub_22DA4DA68(v75, v76, &qword_268593660);
    OUTLINED_FUNCTION_138_2();
    OUTLINED_FUNCTION_10();
    v77();
    if (!v331) {
      goto LABEL_86;
    }
    uint64_t v78 = v331[2];
    if (v78) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_86:
    uint64_t v73 = OUTLINED_FUNCTION_144_1();
    if (v82)
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v270;
LABEL_93:
      objc_msgSend(v2, sel_contentSize);
      objc_msgSend(v2, sel_setContentSize_);
      OUTLINED_FUNCTION_22_19();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_149_1();
      v311 = v199;
      uint64_t v200 = 1 << *(unsigned char *)(v53 + 32);
      uint64_t v201 = -1;
      if (v200 < 64) {
        uint64_t v201 = ~(-1 << v200);
      }
      uint64_t v329 = v201 & v198;
      OUTLINED_FUNCTION_9_28();
      uint64_t v307 = &v2[*(void *)(v202 + 128)];
      OUTLINED_FUNCTION_9_28();
      uint64_t v204 = &v2[*(void *)(v203 + 136)];
      OUTLINED_FUNCTION_9_28();
      unint64_t v206 = &v2[*(void *)(v205 + 120)];
      swift_bridgeObjectRetain();
      v326 = v204;
      OUTLINED_FUNCTION_34();
      uint64_t v309 = v206;
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_47_11();
      uint64_t v321 = v207;
      v322 = v208;
      v323 = (void (**)(void))(v272 + 8);
      v324 = (void (**)(void))(v272 + 16);
      int64_t v209 = (uint64_t *)*MEMORY[0x263F856F8];
      v319 = (void (**)(void))v53;
      v320 = (void (**)(void))(v210 + 8);
      uint64_t v317 = v271 + 8;
      v318 = v209;
      uint64_t v316 = v211;
      OUTLINED_FUNCTION_143_1();
      *(void *)&long long v212 = 136315138;
      long long v314 = v212;
      uint64_t v306 = MEMORY[0x263F8EE58] + 8;
      id v213 = v304;
      while (1)
      {
        if (v329)
        {
          OUTLINED_FUNCTION_61_6();
LABEL_98:
          OUTLINED_FUNCTION_45_9();
          OUTLINED_FUNCTION_66();
          v214();
          uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
          OUTLINED_FUNCTION_56_7(v215);
          goto LABEL_108;
        }
        uint64_t v216 = (uint64_t)(v204 + 1);
        if (__OFADD__(v204, 1)) {
          goto LABEL_161;
        }
        if (v216 < v316)
        {
          if (v311[v216]) {
            goto LABEL_102;
          }
          double v217 = v204 + 2;
          if ((uint64_t)(v204 + 2) >= v316)
          {
            ++v204;
          }
          else
          {
            if (v311[(void)v217]) {
              goto LABEL_102;
            }
            if ((uint64_t)(v204 + 3) >= v316) {
              goto LABEL_151;
            }
            if (v311[(void)(v204 + 3)]) {
              goto LABEL_102;
            }
            double v217 = v204 + 4;
            if ((uint64_t)(v204 + 4) >= v316)
            {
              v204 += 3;
              goto LABEL_107;
            }
            if (v311[(void)v217]) {
              goto LABEL_102;
            }
            if ((uint64_t)(v204 + 5) >= v316)
            {
LABEL_151:
              uint64_t v204 = v217;
            }
            else
            {
              if (v311[(void)(v204 + 5)])
              {
LABEL_102:
                OUTLINED_FUNCTION_42_14();
                goto LABEL_98;
              }
              while ((uint64_t)(v204 + 6) < v316)
              {
                if (*(void *)&v305[8 * (void)v204++]) {
                  goto LABEL_102;
                }
              }
              uint64_t v204 = v301;
            }
          }
        }
LABEL_107:
        uint64_t v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
        __swift_storeEnumTagSinglePayload((uint64_t)v213, 1, 1, v218);
        uint64_t v329 = 0;
LABEL_108:
        v219 = v303;
        sub_22DC0D2D0((uint64_t)v213, (uint64_t)v303, (uint64_t *)&unk_268594F10);
        uint64_t v220 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
        if (__swift_getEnumTagSinglePayload((uint64_t)v219, 1, v220) == 1)
        {
          swift_unknownObjectRelease();
          swift_release();
          sub_22D9CC274((uint64_t)v279);
          sub_22D9CC274((uint64_t)v310);
          OUTLINED_FUNCTION_8_28();
          return;
        }
        v327 = v204;
        v330 = *(char **)&v219[*(int *)(v220 + 48)];
        uint64_t v221 = OUTLINED_FUNCTION_54_8();
        v222(v221);
        uint64_t v223 = *v324;
        OUTLINED_FUNCTION_117();
        v223();
        uint64_t v224 = sub_22DC8FBF8();
        id v213 = *v323;
        OUTLINED_FUNCTION_20_16();
        v213();
        uint64_t v225 = *(void *)(v224 + 16);
        swift_bridgeObjectRelease();
        uint64_t v226 = sub_22DC8F2D8();
        if (v226 < 0 || v226 >= v225)
        {
          sub_22DC90228();
          OUTLINED_FUNCTION_55_8();
          uint64_t v233 = v325;
          OUTLINED_FUNCTION_66();
          v234();
          uint64_t v235 = sub_22DC90318();
          os_log_type_t v236 = sub_22DC92E78();
          if (os_log_type_enabled(v235, v236))
          {
            uint64_t v237 = OUTLINED_FUNCTION_24_2();
            unint64_t v238 = OUTLINED_FUNCTION_24_3();
            OUTLINED_FUNCTION_101_2(v238);
            sub_22DC0D0D4((unint64_t *)&qword_268594F30, MEMORY[0x263F07A30]);
            uint64_t v239 = sub_22DC93798();
            *(void *)(v237 + 4) = sub_22DA2556C(v239, v240, v340);
            swift_bridgeObjectRelease();
            uint64_t v241 = *v320;
            OUTLINED_FUNCTION_23_19();
            v241();
            OUTLINED_FUNCTION_97_3(&dword_22D994000, v235, v236, "Invalid on screen cell index path %s");
            swift_arrayDestroy();
            OUTLINED_FUNCTION_7();
            OUTLINED_FUNCTION_7();

            OUTLINED_FUNCTION_10();
            v242();
            OUTLINED_FUNCTION_23_19();
            v241();
          }
          else
          {

            uint64_t v243 = OUTLINED_FUNCTION_78_5();
            ((void (*)(uint64_t))v213)(v243);
            OUTLINED_FUNCTION_10();
            v244();
            ((void (*)(char *, uint64_t))v213)(v219, v233);
          }
          uint64_t v8 = v213;
          uint64_t v1 = (uint64_t)v219;
        }
        else
        {
          OUTLINED_FUNCTION_123_2();
          OUTLINED_FUNCTION_117();
          v223();
          uint64_t v227 = sub_22DC8FC08();
          OUTLINED_FUNCTION_20_16();
          v213();
          uint64_t v228 = sub_22DC8F2D8();
          if ((v227 & 0xC000000000000001) != 0)
          {
            id v231 = (id)MEMORY[0x230F94700](v228, v227);
            uint64_t v229 = v315;
            OUTLINED_FUNCTION_141_1();
          }
          else
          {
            uint64_t v229 = v315;
            OUTLINED_FUNCTION_141_1();
            if ((v230 & 0x8000000000000000) != 0) {
              goto LABEL_159;
            }
            if (v230 >= *(void *)((v227 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_160;
            }
            id v231 = *(id *)(v227 + 8 * v230 + 32);
          }
          swift_bridgeObjectRelease();
          objc_msgSend(v219, sel_frame);
          objc_msgSend(v231, sel_convertRect_toCoordinateSpace_, v229);
          if (OUTLINED_FUNCTION_154_0(v349) >= v313 && v312 >= OUTLINED_FUNCTION_124_3())
          {
            OUTLINED_FUNCTION_10();
            v232();

            goto LABEL_123;
          }
          objc_msgSend(v219, sel_removeFromSuperview);
          uint64_t v245 = *(void *)v309;
          uint64_t v246 = *(void *)(*(void *)v309 + 16);
          if (v246)
          {
            swift_bridgeObjectRetain_n();
            v247 = (uint64_t *)(v245 + 48);
            while (1)
            {
              uint64_t v249 = *(v247 - 1);
              uint64_t v248 = *v247;
              ObjCClassFromMetadatCGFloat a = swift_getObjCClassFromMetadata();
              swift_bridgeObjectRetain();
              if (objc_msgSend(v330, sel_isKindOfClass_, ObjCClassFromMetadata)) {
                break;
              }
              v247 += 3;
              swift_bridgeObjectRelease();
              if (!--v246)
              {
                OUTLINED_FUNCTION_117_2();
                uint64_t v8 = v270;
                uint64_t v1 = v283;
                v219 = v330;
                goto LABEL_129;
              }
            }
            OUTLINED_FUNCTION_117_2();
            OUTLINED_FUNCTION_12();
            v330;
            sub_22D9CC274((uint64_t)v310);
            int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            OUTLINED_FUNCTION_40_13(isUniquelyReferenced_nonNull_native);
            LODWORD(v310) = v259;
            OUTLINED_FUNCTION_77_3();
            if (v260) {
              goto LABEL_163;
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F40);
            char v261 = OUTLINED_FUNCTION_109_3();
            uint64_t v8 = v270;
            uint64_t v1 = v283;
            if (v261)
            {
              sub_22D9FBAD4(v249, v248);
              OUTLINED_FUNCTION_107_3();
              if (!v82) {
                goto LABEL_164;
              }
            }
            OUTLINED_FUNCTION_108_3();
            OUTLINED_FUNCTION_106_3();
            if ((v262 & 1) == 0)
            {
              swift_bridgeObjectRetain();
              sub_22DC0948C(&v339);
              OUTLINED_FUNCTION_103_3();
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_22D9B1388(&v339, v300);
            uint64_t v263 = (void *)v339;
            swift_endAccess();
            swift_bridgeObjectRelease();

            uint64_t v310 = sub_22DC0948C;
            v219 = v330;
          }
          else
          {
LABEL_129:
            sub_22DC90228();
            v251 = v219;
            int64_t v252 = sub_22DC90318();
            os_log_type_t v253 = sub_22DC92E78();
            if (os_log_type_enabled(v252, v253))
            {
              OUTLINED_FUNCTION_24_2();
              uint64_t v254 = OUTLINED_FUNCTION_24_3();
              uint64_t v339 = OUTLINED_FUNCTION_53_7(v254);
              __swift_instantiateConcreteTypeFromMangledName(&qword_268594F38);
              uint64_t v255 = sub_22DC929A8();
              v219 = (char *)v1;
              uint64_t v1 = v256;
              *(void *)((char *)v8 + 4) = sub_22DA2556C(v255, v256, v340);

              OUTLINED_FUNCTION_102_3();
              OUTLINED_FUNCTION_97_3(&dword_22D994000, v252, v253, "Recycled cell without a reuse identifier, cell is of type: %s");
              OUTLINED_FUNCTION_112_2();
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_7();
            }
            else
            {
            }
            OUTLINED_FUNCTION_10();
            v257();
          }
          OUTLINED_FUNCTION_12();
          uint64_t v264 = (void *)sub_22DC0AF74(v1);
          swift_endAccess();

          OUTLINED_FUNCTION_10();
          v265();
        }
        id v213 = v304;
LABEL_123:
        uint64_t v204 = v327;
      }
    }
  }
  uint64_t v79 = (void *)v331[4];
  uint64_t v80 = v331[5];
  char v81 = *((unsigned char *)v331 + 48);
  BOOL v82 = v78 == 1 || (v81 & 0xFD) == 0;
  v311 = v331;
  if (v82)
  {
LABEL_25:
    v343 = v79;
    uint64_t v344 = v80;
    char v345 = v81;
    if (v346) {
      double v86 = 12.0;
    }
    else {
      double v86 = 16.0;
    }
    sub_22D9BF1A8(v79, v80, v81);
    OUTLINED_FUNCTION_118_3();
    double v88 = v87 - (v86 + 16.0 + v86 + 16.0);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v90 = v327;
    OUTLINED_FUNCTION_81_3();
    double v92 = v91();
    uint64_t v93 = *((void *)v90 + 10);
    v318 = (uint64_t *)ObjectType;
    uint64_t v321 = v93;
    OUTLINED_FUNCTION_37_12();
    double v95 = v86 + v86 + v94();
    *(double *)v340 = v95;
    if (trunc(v88 / v92) > 1.0) {
      fmod(v88, v92);
    }
    if (v323 || (OUTLINED_FUNCTION_114_3(), v82)) {
      double v57 = v57 + v86;
    }
    uint64_t v96 = (char *)v328;
    OUTLINED_FUNCTION_113_3();
    uint64_t v289 = v97;
    OUTLINED_FUNCTION_117();
    v98();
    OUTLINED_FUNCTION_44_11();
    uint64_t v288 = *v290;
    OUTLINED_FUNCTION_20_16();
    v99();
    uint64_t v100 = (char *)v331;
    if (!v331)
    {
      id v101 = objc_allocWithZone((Class)type metadata accessor for WFGridSectionContainerView());
      uint64_t v100 = sub_22DA66810(v86);
    }
    int64_t v102 = v282;
    int v103 = v346;
    char v308 = v100;
    LODWORD(v329) = v103;
    sub_22DC929E8();
    uint64_t v104 = v311;
    if (qword_268592270 != -1) {
      swift_once();
    }
    id v105 = (id)qword_268595FA0;
    uint64_t v106 = (void *)OUTLINED_FUNCTION_4_12();
    uint64_t v107 = OUTLINED_FUNCTION_4_12();
    uint64_t v108 = swift_bridgeObjectRelease();
    uint64_t v109 = (uint64_t)OUTLINED_FUNCTION_130_2(v108, sel_localizedStringForKey_value_table_);

    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v110 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
    unint64_t v111 = v308;
    objc_msgSend(v308, sel_setAccessibilityLabel_, v110);

    uint64_t v339 = MEMORY[0x263F8EE78];
    OUTLINED_FUNCTION_75_4();
    if (v82)
    {
      OUTLINED_FUNCTION_118_3();
      OUTLINED_FUNCTION_105_2(v112);
    }
    double v338 = v86;
    double v337 = v86;
    LOBYTE(v113) = (_BYTE)v327;
    if (v329)
    {
      uint64_t v114 = (void *)sub_22DC929E8();
      if (qword_268592270 != -1) {
        swift_once();
      }
      uint64_t v107 = (uint64_t)(id)qword_268595FA0;
      uint64_t v109 = OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_42_0();
      uint64_t v115 = OUTLINED_FUNCTION_126();
      id v116 = OUTLINED_FUNCTION_125_3(v115, sel_localizedStringForKey_value_table_);

      LODWORD(v107) = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
      if (sub_22DA10074(1, *v102))
      {
        OUTLINED_FUNCTION_126();
      }
      else
      {
        id v117 = objc_msgSend(objc_allocWithZone((Class)WFSearchBar), sel_initWithStyle_, 4);
        objc_msgSend(v117, sel_setTextFieldDefaultAlignmentBehavior_, 0);
        objc_msgSend(v117, sel_setCancelButtonTrailingPadding_, 6.0);
        uint64_t v109 = (uint64_t)objc_msgSend(v117, sel_searchTextField);
        uint64_t v107 = sub_22DC92948();
        swift_bridgeObjectRelease();
        objc_msgSend((id)v109, sel_setPlaceholder_, v107);

        objc_msgSend(v117, sel_setDelegate_, v2);
        OUTLINED_FUNCTION_12();
        id v118 = v117;
        sub_22DBB0F44((uint64_t)v118, 1);
        swift_endAccess();
        id v119 = *(id *)&v308[OBJC_IVAR____TtC10WorkflowUI26WFGridSectionContainerView_contentView];
        objc_msgSend(v119, sel_addSubview_, v118);
      }
      OUTLINED_FUNCTION_75_4();
      uint64_t v120 = self;
      OUTLINED_FUNCTION_129_1((uint64_t)objc_msgSend(v120, sel_begin), sel_setDisableActions_);
      double v121 = OUTLINED_FUNCTION_66_4();
      objc_msgSend(v122, v123, v121);
      objc_msgSend(v120, sel_commit);
      id v124 = OUTLINED_FUNCTION_64_5(56.0);
      MEMORY[0x230F93DA0]();
      OUTLINED_FUNCTION_96_2();
      uint64_t v104 = v311;
      if (v125) {
        OUTLINED_FUNCTION_24_17();
      }
      sub_22DC92BC8();
      sub_22DC92B68();
    }
    uint64_t v317 = v104[2];
    if (v317)
    {
      v330 = (char *)self;
      uint64_t v306 = OBJC_IVAR____TtC10WorkflowUI26WFGridSectionContainerView_contentView;
      OUTLINED_FUNCTION_34();
      uint64_t v126 = 0;
      for (uint64_t i = 0; v317 != i; ++i)
      {
        OUTLINED_FUNCTION_92_2((uint64_t)&v126[(void)v104]);
        v326 = v128;
        if ((v107 & 0xFFFFFFFD) != 0 && (v347[0] & 1) == 0 && (double v338 = v86, v128))
        {
          if ((unint64_t)(i - 1) >= v104[2]) {
            goto LABEL_157;
          }
          int64_t v129 = (void *)OUTLINED_FUNCTION_39_11((uint64_t)&v128[(void)v104]);
          sub_22D9BF1A8(v129, v130, v131);
          sub_22D9BF1A8(v96, (uint64_t)v2, (char)v113);
          OUTLINED_FUNCTION_37_12();
          double v95 = v132();
          uint64_t v133 = (uint64_t)v2;
          uint64_t v2 = v315;
          sub_22D9BF180(v96, v133, (char)v113);
          double v134 = 16.0;
          if (v329) {
            double v134 = 8.0;
          }
          double v135 = OUTLINED_FUNCTION_146_1(v134);
        }
        else
        {
          sub_22D9BF1A8(v102, v109, v107);
        }
        v347[0] = 0;
        OUTLINED_FUNCTION_129_1((uint64_t)objc_msgSend(v330, sel_begin, v135), sel_setDisableActions_);
        OUTLINED_FUNCTION_63_4();
        uint64_t v136 = v316;
        MEMORY[0x230F90530](i, v323);
        uint64_t v137 = *v320;
        int64_t v102 = v318;
        if (*((void *)*v320 + 2))
        {
          swift_bridgeObjectRetain();
          unint64_t v138 = sub_22D9FBB9C(v136);
          if (v139)
          {
            uint64_t v96 = v2;
            uint64_t v140 = *(void **)(*((void *)v137 + 7) + 8 * v138);
            id v141 = v140;
            swift_bridgeObjectRelease();
            goto LABEL_69;
          }
          swift_bridgeObjectRelease();
        }
        OUTLINED_FUNCTION_62_3();
        OUTLINED_FUNCTION_37_12();
        if (v313 < v95 + v142() && v95 < v312)
        {
          uint64_t v96 = v2;
          OUTLINED_FUNCTION_89_4();
          uint64_t v140 = (void *)v144();
          LODWORD(v329) = 1;
          goto LABEL_71;
        }
        uint64_t v96 = v2;
        uint64_t v140 = 0;
LABEL_69:
        LODWORD(v329) = 0;
LABEL_71:
        uint64_t v145 = *v319;
        OUTLINED_FUNCTION_20_16();
        v145();
        id v113 = v330;
        objc_msgSend(v330, sel_commit);
        if (v140)
        {
          *(void *)&long long v314 = v145;
          id v146 = v140;
          OUTLINED_FUNCTION_128_3();
          v147();
          OUTLINED_FUNCTION_75_4();
          objc_msgSend(v113, sel_begin);
          objc_msgSend(v113, sel_setDisableActions_, 1);
          objc_msgSend(v146, sel_layoutIfNeeded);
          id v148 = v146;
          OUTLINED_FUNCTION_133_2();
          id v150 = [v96 v149];
          objc_msgSend(v150, sel_displayScale);
          double v95 = v151;

          BSFloatRoundForScale();
          id v152 = OUTLINED_FUNCTION_147_1();
          objc_msgSend(v152, sel_displayScale);

          BSFloatRoundForScale();
          OUTLINED_FUNCTION_127_2();
          OUTLINED_FUNCTION_37_12();
          uint64_t v154 = v153();
          OUTLINED_FUNCTION_93_1(v154, sel_setFrame_);

          objc_msgSend(v330, sel_commit);
          if (v329)
          {
            uint64_t v96 = v305;
            MEMORY[0x230F90530](i, v323);
            OUTLINED_FUNCTION_12();
            BOOL v155 = v102;
            sub_22DBB0EDC();
            OUTLINED_FUNCTION_20_16();
            v156();
            swift_endAccess();
            objc_msgSend(*(id *)&v308[v306], sel_addSubview_, v155);
          }
          uint64_t v107 = v102;
          MEMORY[0x230F93DA0]();
          OUTLINED_FUNCTION_95_2();
          uint64_t v104 = v311;
          if (v125) {
            OUTLINED_FUNCTION_24_17();
          }
          OUTLINED_FUNCTION_75_4();
          OUTLINED_FUNCTION_120_2();
          sub_22DC92B68();

          LODWORD(v107) = v341;
          uint64_t v109 = v342;
          LODWORD(v329) = v346;
          char v268 = v346;
          uint64_t v2 = v315;
          uint64_t v267 = v315;
          double v164 = OUTLINED_FUNCTION_18_22();
          char v167 = (char)v102;
        }
        else
        {
          OUTLINED_FUNCTION_75_4();
          LODWORD(v107) = v341;
          uint64_t v109 = v342;
          LODWORD(v329) = v346;
          char v268 = v346;
          uint64_t v267 = v96;
          uint64_t v2 = v96;
          double v164 = OUTLINED_FUNCTION_18_22();
        }
        sub_22DC08A2C(v157, v158, v159, v160, v161, v162, v163, v167, v164, v165, v166, &v338, v267, &v337, v268, (double *)v340, v347);
        unint64_t v168 = (void *)OUTLINED_FUNCTION_111_3();
        sub_22D9BF180(v168, v169, v170);
        uint64_t v126 = v326 + 24;
      }
    }
    swift_bridgeObjectRelease();
    char v171 = v308;
    unint64_t v172 = swift_bridgeObjectRetain();
    sub_22DA03208(v172);
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_22DC92B38();
    swift_bridgeObjectRelease();
    objc_msgSend(v171, sel_setAccessibilityElements_, v53);

    objc_msgSend(v2, sel_contentSize);
    uint64_t v173 = OUTLINED_FUNCTION_17_20();
    v174(v173);
    OUTLINED_FUNCTION_44_11();
    OUTLINED_FUNCTION_20_16();
    v175();
    BOOL v176 = v331;

    if (!v176)
    {
      v330 = (char *)self;
      int v177 = (void *)OUTLINED_FUNCTION_79_5();
      id v178 = OUTLINED_FUNCTION_50_10(v177);
      uint64_t v179 = v2;
      sub_22D9CC274((uint64_t)v279);
      uint64_t v180 = swift_allocObject();
      *(void *)(v180 + 16) = sub_22DC0D204;
      *(void *)(v180 + 24) = v104;
      v334 = sub_22DBCB318;
      uint64_t v335 = v180;
      v331 = (void *)MEMORY[0x263EF8330];
      uint64_t v332 = v277;
      v333 = sub_22DBFF6CC;
      uint64_t v181 = OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_92);
      swift_retain();
      swift_release();
      objc_msgSend(v330, sel_performWithoutAnimation_, v181);
      _Block_release(v181);
      char v182 = OUTLINED_FUNCTION_110_2();
      swift_release();
      if (v182) {
        goto LABEL_162;
      }
      objc_msgSend(v179, sel_insertSubview_atIndex_, v178, 0);
      OUTLINED_FUNCTION_26_16((uint64_t)objc_msgSend(v178, sel_setAlpha_, 1.0), sel_setTransform_);
      unsigned __int8 v336 = v346;
      v340[3] = (uint64_t)v178;
      OUTLINED_FUNCTION_12();
      id v183 = v178;
      uint64_t v184 = OUTLINED_FUNCTION_136_1();
      MEMORY[0x270FA5388](v184);
      OUTLINED_FUNCTION_99_2();
      uint64_t v53 = v276;
      sub_22DC8FC28();
      uint64_t v276 = v53;
      swift_endAccess();
      uint64_t v278 = v104;
      uint64_t v279 = sub_22DC0D204;
    }
    swift_bridgeObjectRelease();
    uint64_t v2 = v315;
    OUTLINED_FUNCTION_114_3();
    uint64_t v1 = v283;
    if (v82)
    {
      id v186 = objc_msgSend(v171, sel_layer);
      sub_22DC8F7C8();
      int64_t v187 = (void *)OUTLINED_FUNCTION_140_1();
      objc_msgSend(v186, sel_setValue_forKeyPath_, v53, v187);

      int64_t v188 = self;
      uint64_t v189 = OUTLINED_FUNCTION_50();
      *(void *)(v189 + 16) = v171;
      v334 = sub_22DC0D844;
      uint64_t v335 = v189;
      v331 = (void *)MEMORY[0x263EF8330];
      uint64_t v190 = v277;
      uint64_t v332 = v277;
      v333 = sub_22D9AA6D0;
      uint64_t v53 = (uint64_t)OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_79);
      int64_t v191 = v171;
      swift_release();
      v334 = (uint64_t (*)())CGPointMake;
      uint64_t v335 = 0;
      v331 = (void *)MEMORY[0x263EF8330];
      uint64_t v332 = v190;
      v333 = sub_22DA86A10;
      unint64_t v192 = OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_82_1);
      OUTLINED_FUNCTION_43_14();
      OUTLINED_FUNCTION_98_3(v188, v193);
      _Block_release(v192);
      _Block_release((const void *)v53);
    }
    OUTLINED_FUNCTION_65_5(v185, sel_setFrame_);

    sub_22D9BF180(v343, v344, v345);
    double v57 = v57 + v88;
    goto LABEL_86;
  }
  uint64_t v83 = (char *)(v331 + 9);
  uint64_t v84 = 1;
  while (1)
  {
    uint64_t v85 = v84 + 1;
    if (__OFADD__(v84, 1)) {
      break;
    }
    if ((*v83 & 0xFD) == 0)
    {
      uint64_t v79 = (void *)*((void *)v83 - 2);
      uint64_t v80 = *((void *)v83 - 1);
      char v81 = *v83;
      goto LABEL_25;
    }
    ++v84;
    v83 += 24;
    if (v85 == v78) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  sub_22DC93868();
  __break(1u);
}

void sub_22DC06D40()
{
  OUTLINED_FUNCTION_74_5();
  uint64_t v2 = v0;
  uint64_t v292 = sub_22DC90328();
  OUTLINED_FUNCTION_1_0();
  *(void *)char v268 = v3;
  MEMORY[0x270FA5388](v4);
  id v266 = (char *)&v265 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (double *)((char *)&v265 - v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE8);
  OUTLINED_FUNCTION_1_0();
  int64_t v269 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v282 = (char *)&v265 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v13);
  uint64_t v283 = (char *)&v265 - v14;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v15);
  v291 = (char *)&v265 - v16;
  OUTLINED_FUNCTION_75();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v26 = OUTLINED_FUNCTION_72_4(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v265);
  OUTLINED_FUNCTION_1_0();
  uint64_t v301 = v27;
  MEMORY[0x270FA5388](v28);
  uint64_t v304 = (void (*)(void))((char *)&v265 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_21_6();
  long long v314 = v31;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v32);
  id v290 = (char *)&v265 - v33;
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_70_5();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F10);
  uint64_t v36 = OUTLINED_FUNCTION_62(v35);
  MEMORY[0x270FA5388](v36);
  v303 = (void (*)(void))((char *)&v265 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_75();
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_100_2(v39, v40, v41, v42, v43, v44, v45, v46, (uint64_t)v265);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  uint64_t v48 = OUTLINED_FUNCTION_62(v47);
  MEMORY[0x270FA5388](v48);
  char v285 = (char *)&v265 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_75();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_69_5();
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v345);
  OUTLINED_FUNCTION_153_0();
  objc_msgSend(v0, sel_setContentSize_, Width);
  OUTLINED_FUNCTION_22_19();
  uint64_t v53 = (uint64_t)&v0[*(void *)(v52 + 160)];
  uint64_t v326 = MEMORY[0x230F96100](v53);
  if (!v326)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685945E0);
    uint64_t v192 = OUTLINED_FUNCTION_79_5();
    *(_OWORD *)(v192 + 16) = xmmword_22DCB0EA0;
    uint64_t v193 = OUTLINED_FUNCTION_94_2(v192, MEMORY[0x263F8D310]);
    OUTLINED_FUNCTION_48_8(v193, v194);
    OUTLINED_FUNCTION_8_28();
    swift_bridgeObjectRelease();
    return;
  }
  v327 = *(char **)(v53 + 8);
  objc_msgSend(v0, sel_contentOffset);
  if (v54 + -70.0 < 0.0) {
    double v55 = 0.0;
  }
  else {
    double v55 = v54 + -70.0;
  }
  objc_msgSend(v0, sel_frame);
  double v311 = v55;
  double v57 = v56 + v55 + 70.0;
  OUTLINED_FUNCTION_153_0();
  if (v58 >= v57) {
    double v59 = v57;
  }
  else {
    double v59 = v58;
  }
  double v310 = v59;
  v322 = (void (**)(void))objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  char v344 = 0;
  OUTLINED_FUNCTION_22_19();
  uint64_t v61 = (uint64_t)&v0[*(void *)(v60 + 152)];
  OUTLINED_FUNCTION_34();
  uint64_t v284 = v61;
  sub_22DA4DA68(v61, (uint64_t)v0, &qword_268593680);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593688);
  sub_22DC8FBF8();
  OUTLINED_FUNCTION_139_2();
  uint64_t v298 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v299 = v62;
  uint64_t v297 = v63 + 8;
  v298(v0, v62);
  uint64_t v64 = *(void *)(v53 + 16);
  uint64_t v65 = MEMORY[0x263F8EE58];
  v324 = v2;
  uint64_t v267 = v8;
  uint64_t v294 = v9;
  uint64_t v323 = v26;
  uint64_t v296 = v64;
  uint64_t v281 = v1;
  if (!v64)
  {
    swift_bridgeObjectRelease();
    uint64_t v276 = 0;
    uint64_t v277 = 0;
    uint64_t v274 = 0;
    goto LABEL_90;
  }
  OUTLINED_FUNCTION_9_28();
  uint64_t v53 = (uint64_t)&v2[*(void *)(v66 + 144)];
  OUTLINED_FUNCTION_9_28();
  v318 = (void (**)(void))&v2[*(void *)(v67 + 112)];
  OUTLINED_FUNCTION_9_28();
  OUTLINED_FUNCTION_9_28();
  uint64_t v271 = *(void *)(v68 + 208);
  OUTLINED_FUNCTION_9_28();
  uint64_t v278 = *(void *)(v69 + 200);
  uint64_t v295 = v70 + 32;
  uint64_t v300 = v70;
  uint64_t v293 = v71;
  OUTLINED_FUNCTION_34();
  uint64_t v280 = (uint64_t *)v53;
  OUTLINED_FUNCTION_34();
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  uint64_t v274 = 0;
  uint64_t v309 = (void (*)(void *@<X8>))(v327 + 88);
  v320 = v327 + 80;
  OUTLINED_FUNCTION_38_12();
  uint64_t v317 = v72;
  OUTLINED_FUNCTION_60_5();
  uint64_t v275 = 1107296256;
  uint64_t v273 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v272 = 0x3FDCCCCCCCCCCCCDLL;
  OUTLINED_FUNCTION_134_2((uint64_t)"filters.gaussianBlur.inputRadius");
  uint64_t v279 = v65 + 8;
  uint64_t v75 = (void (*)(void))v326;
  while (1)
  {
    if ((unint64_t)v74 >= *(void *)(v73 + 16)) {
      goto LABEL_154;
    }
    uint64_t v321 = v74;
    uint64_t v76 = OUTLINED_FUNCTION_132_2((uint64_t)v295);
    sub_22DA4DA68(v76, v77, &qword_268593680);
    OUTLINED_FUNCTION_138_2();
    OUTLINED_FUNCTION_10();
    v78();
    if (!v330) {
      goto LABEL_83;
    }
    uint64_t v79 = v330[2];
    if (v79) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_83:
    uint64_t v73 = OUTLINED_FUNCTION_144_1();
    if (v96)
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v267;
LABEL_90:
      objc_msgSend(v2, sel_contentSize);
      objc_msgSend(v2, sel_setContentSize_);
      OUTLINED_FUNCTION_22_19();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_149_1();
      double v312 = v197;
      uint64_t v198 = 1 << *(unsigned char *)(v53 + 32);
      uint64_t v199 = -1;
      if (v198 < 64) {
        uint64_t v199 = ~(-1 << v198);
      }
      uint64_t v328 = v199 & v196;
      OUTLINED_FUNCTION_9_28();
      uint64_t v306 = &v2[*(void *)(v200 + 128)];
      OUTLINED_FUNCTION_9_28();
      uint64_t v202 = &v2[*(void *)(v201 + 136)];
      OUTLINED_FUNCTION_9_28();
      uint64_t v204 = &v2[*(void *)(v203 + 120)];
      swift_bridgeObjectRetain();
      uint64_t v325 = v202;
      OUTLINED_FUNCTION_34();
      char v308 = v204;
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_47_11();
      uint64_t v319 = v205;
      v320 = v206;
      uint64_t v321 = (void (**)(void))(v269 + 1);
      v322 = (void (**)(void))(v269 + 2);
      uint64_t v207 = (uint64_t *)*MEMORY[0x263F856F8];
      uint64_t v317 = (void (**)(void))v53;
      v318 = (void (**)(void))(v208 + 8);
      uint64_t v315 = *(void *)v268 + 8;
      uint64_t v316 = v207;
      long long v314 = v209;
      OUTLINED_FUNCTION_143_1();
      *(void *)&long long v210 = 136315138;
      long long v313 = v210;
      uint64_t v305 = MEMORY[0x263F8EE58] + 8;
      uint64_t v211 = v303;
      while (1)
      {
        if (v328)
        {
          OUTLINED_FUNCTION_61_6();
LABEL_95:
          OUTLINED_FUNCTION_45_9();
          OUTLINED_FUNCTION_66();
          v212();
          uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
          OUTLINED_FUNCTION_56_7(v213);
          goto LABEL_105;
        }
        unint64_t v214 = v202 + 1;
        if (__OFADD__(v202, 1)) {
          goto LABEL_157;
        }
        if ((uint64_t)v214 < (uint64_t)v314)
        {
          if (v312[(void)v214]) {
            goto LABEL_99;
          }
          uint64_t v215 = v202 + 2;
          if ((uint64_t)(v202 + 2) >= (uint64_t)v314)
          {
            ++v202;
          }
          else
          {
            if (v312[(void)v215]) {
              goto LABEL_99;
            }
            if ((uint64_t)(v202 + 3) >= (uint64_t)v314) {
              goto LABEL_148;
            }
            if (v312[(void)(v202 + 3)]) {
              goto LABEL_99;
            }
            uint64_t v215 = v202 + 4;
            if ((uint64_t)(v202 + 4) >= (uint64_t)v314)
            {
              v202 += 3;
              goto LABEL_104;
            }
            if (v312[(void)v215]) {
              goto LABEL_99;
            }
            if ((uint64_t)(v202 + 5) >= (uint64_t)v314)
            {
LABEL_148:
              uint64_t v202 = v215;
            }
            else
            {
              if (v312[(void)(v202 + 5)])
              {
LABEL_99:
                OUTLINED_FUNCTION_42_14();
                goto LABEL_95;
              }
              while ((uint64_t)(v202 + 6) < (uint64_t)v314)
              {
                if (*((void *)v304 + (void)v202++)) {
                  goto LABEL_99;
                }
              }
              uint64_t v202 = v300;
            }
          }
        }
LABEL_104:
        uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
        __swift_storeEnumTagSinglePayload((uint64_t)v211, 1, 1, v216);
        uint64_t v328 = 0;
LABEL_105:
        double v217 = v302;
        sub_22DC0D2D0((uint64_t)v211, (uint64_t)v302, (uint64_t *)&unk_268594F10);
        uint64_t v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_268594F20);
        if (__swift_getEnumTagSinglePayload((uint64_t)v217, 1, v218) == 1)
        {
          swift_unknownObjectRelease();
          swift_release();
          sub_22D9CC274((uint64_t)v277);
          sub_22D9CC274((uint64_t)v309);
          OUTLINED_FUNCTION_8_28();
          return;
        }
        v327 = v202;
        uint64_t v329 = *(char **)&v217[*(int *)(v218 + 48)];
        uint64_t v219 = OUTLINED_FUNCTION_54_8();
        v220(v219);
        uint64_t v221 = *v322;
        OUTLINED_FUNCTION_117();
        v221();
        uint64_t v222 = sub_22DC8FBF8();
        uint64_t v211 = *v321;
        OUTLINED_FUNCTION_20_16();
        v211();
        uint64_t v223 = *(void *)(v222 + 16);
        swift_bridgeObjectRelease();
        uint64_t v224 = sub_22DC8F2D8();
        if (v224 < 0 || v224 >= v223)
        {
          sub_22DC90228();
          OUTLINED_FUNCTION_55_8();
          uint64_t v231 = v323;
          OUTLINED_FUNCTION_66();
          v232();
          uint64_t v233 = sub_22DC90318();
          os_log_type_t v234 = sub_22DC92E78();
          if (os_log_type_enabled(v233, v234))
          {
            uint64_t v235 = OUTLINED_FUNCTION_24_2();
            unint64_t v236 = OUTLINED_FUNCTION_24_3();
            OUTLINED_FUNCTION_101_2(v236);
            sub_22DC0D0D4((unint64_t *)&qword_268594F30, MEMORY[0x263F07A30]);
            uint64_t v237 = sub_22DC93798();
            *(void *)(v235 + 4) = sub_22DA2556C(v237, v238, v339);
            swift_bridgeObjectRelease();
            uint64_t v239 = *v318;
            OUTLINED_FUNCTION_23_19();
            v239();
            OUTLINED_FUNCTION_97_3(&dword_22D994000, v233, v234, "Invalid on screen cell index path %s");
            swift_arrayDestroy();
            OUTLINED_FUNCTION_7();
            OUTLINED_FUNCTION_7();

            OUTLINED_FUNCTION_10();
            v240();
            OUTLINED_FUNCTION_23_19();
            v239();
          }
          else
          {

            uint64_t v241 = OUTLINED_FUNCTION_78_5();
            ((void (*)(uint64_t))v211)(v241);
            OUTLINED_FUNCTION_10();
            v242();
            ((void (*)(char *, uint64_t))v211)(v217, v231);
          }
          uint64_t v8 = (double *)v211;
          uint64_t v1 = (uint64_t)v217;
        }
        else
        {
          OUTLINED_FUNCTION_123_2();
          OUTLINED_FUNCTION_117();
          v221();
          uint64_t v225 = sub_22DC8FC08();
          OUTLINED_FUNCTION_20_16();
          v211();
          uint64_t v226 = sub_22DC8F2D8();
          if ((v225 & 0xC000000000000001) != 0)
          {
            id v229 = (id)MEMORY[0x230F94700](v226, v225);
            uint64_t v227 = v324;
            OUTLINED_FUNCTION_141_1();
          }
          else
          {
            uint64_t v227 = v324;
            OUTLINED_FUNCTION_141_1();
            if ((v228 & 0x8000000000000000) != 0) {
              goto LABEL_155;
            }
            if (v228 >= *(void *)((v225 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_156;
            }
            id v229 = *(id *)(v225 + 8 * v228 + 32);
          }
          swift_bridgeObjectRelease();
          objc_msgSend(v217, sel_frame);
          objc_msgSend(v229, sel_convertRect_toCoordinateSpace_, v227);
          if (OUTLINED_FUNCTION_154_0(v346) >= v311 && v310 >= OUTLINED_FUNCTION_124_3())
          {
            OUTLINED_FUNCTION_10();
            v230();

            goto LABEL_120;
          }
          objc_msgSend(v217, sel_removeFromSuperview);
          uint64_t v243 = *(void *)v308;
          uint64_t v244 = *(void *)(*(void *)v308 + 16);
          if (v244)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v245 = (uint64_t *)(v243 + 48);
            while (1)
            {
              uint64_t v247 = *(v245 - 1);
              uint64_t v246 = *v245;
              ObjCClassFromMetadatCGFloat a = swift_getObjCClassFromMetadata();
              swift_bridgeObjectRetain();
              if (objc_msgSend(v329, sel_isKindOfClass_, ObjCClassFromMetadata)) {
                break;
              }
              v245 += 3;
              swift_bridgeObjectRelease();
              if (!--v244)
              {
                OUTLINED_FUNCTION_117_2();
                uint64_t v8 = v267;
                uint64_t v1 = v281;
                double v217 = v329;
                goto LABEL_126;
              }
            }
            OUTLINED_FUNCTION_117_2();
            OUTLINED_FUNCTION_12();
            v329;
            sub_22D9CC274((uint64_t)v309);
            int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            OUTLINED_FUNCTION_40_13(isUniquelyReferenced_nonNull_native);
            LODWORD(v309) = v257;
            OUTLINED_FUNCTION_77_3();
            if (v258) {
              goto LABEL_159;
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268594F40);
            char v259 = OUTLINED_FUNCTION_109_3();
            uint64_t v8 = v267;
            uint64_t v1 = v281;
            if (v259)
            {
              sub_22D9FBAD4(v247, v246);
              OUTLINED_FUNCTION_107_3();
              if (!v96) {
                goto LABEL_160;
              }
            }
            OUTLINED_FUNCTION_108_3();
            OUTLINED_FUNCTION_106_3();
            if ((v260 & 1) == 0)
            {
              swift_bridgeObjectRetain();
              sub_22DC0948C(&v338);
              OUTLINED_FUNCTION_103_3();
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_22D9B1388(&v338, v299);
            char v261 = (void *)v338;
            swift_endAccess();
            swift_bridgeObjectRelease();

            uint64_t v309 = sub_22DC0948C;
            double v217 = v329;
          }
          else
          {
LABEL_126:
            sub_22DC90228();
            uint64_t v249 = v217;
            uint64_t v250 = sub_22DC90318();
            os_log_type_t v251 = sub_22DC92E78();
            if (os_log_type_enabled(v250, v251))
            {
              OUTLINED_FUNCTION_24_2();
              uint64_t v252 = OUTLINED_FUNCTION_24_3();
              uint64_t v338 = OUTLINED_FUNCTION_53_7(v252);
              __swift_instantiateConcreteTypeFromMangledName(&qword_268594F38);
              uint64_t v253 = sub_22DC929A8();
              double v217 = (char *)v1;
              uint64_t v1 = v254;
              *(void *)((char *)v8 + 4) = sub_22DA2556C(v253, v254, v339);

              OUTLINED_FUNCTION_102_3();
              OUTLINED_FUNCTION_97_3(&dword_22D994000, v250, v251, "Recycled cell without a reuse identifier, cell is of type: %s");
              OUTLINED_FUNCTION_112_2();
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_7();
            }
            else
            {
            }
            OUTLINED_FUNCTION_10();
            v255();
          }
          OUTLINED_FUNCTION_12();
          char v262 = (void *)sub_22DC0AF74(v1);
          swift_endAccess();

          OUTLINED_FUNCTION_10();
          v263();
        }
        uint64_t v211 = v303;
LABEL_120:
        uint64_t v202 = v327;
      }
    }
  }
  double v312 = v330;
  uint64_t v80 = v330 + 6;
  while (*v80 != 1)
  {
    v80 += 24;
    if (!--v79)
    {
      uint64_t v82 = v312[4];
      uint64_t v81 = v312[5];
      char v83 = *((unsigned char *)v312 + 48);
      sub_22D9BF3A4(v82, v81, v83);
      goto LABEL_19;
    }
  }
  uint64_t v82 = *((void *)v80 - 2);
  uint64_t v81 = *((void *)v80 - 1);
  char v83 = 1;
LABEL_19:
  uint64_t v340 = v82;
  uint64_t v341 = v81;
  char v342 = v83;
  double v84 = 0.0;
  if (v343) {
    double v85 = 12.0;
  }
  else {
    double v85 = 0.0;
  }
  OUTLINED_FUNCTION_118_3();
  double v87 = v86 - (v85 + 16.0 + v85 + 16.0);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v89 = v327;
  OUTLINED_FUNCTION_81_3();
  double v91 = v90();
  uint64_t v92 = *((void *)v89 + 10);
  uint64_t v316 = (uint64_t *)ObjectType;
  uint64_t v319 = v92;
  OUTLINED_FUNCTION_37_12();
  double v94 = v85 + v85 + v93();
  *(double *)uint64_t v339 = v94;
  double v95 = trunc(v87 / v91);
  if (v95 > 1.0) {
    double v84 = fmod(v87, v91) / (v95 + -1.0);
  }
  if (v321 || (OUTLINED_FUNCTION_114_3(), v96)) {
    double v57 = v57 + v85;
  }
  uint64_t v97 = *v289;
  OUTLINED_FUNCTION_113_3();
  OUTLINED_FUNCTION_117();
  v97();
  OUTLINED_FUNCTION_44_11();
  uint64_t v286 = *v288;
  OUTLINED_FUNCTION_20_16();
  v98();
  uint64_t v99 = (char *)v330;
  if (!v330)
  {
    id v100 = objc_allocWithZone((Class)type metadata accessor for WFGridSectionContainerView());
    uint64_t v99 = sub_22DA66810(v85);
  }
  id v101 = v280;
  int v102 = v343;
  uint64_t v307 = v99;
  LODWORD(v328) = v102;
  char v287 = v97;
  sub_22DC929E8();
  int v103 = v312;
  if (qword_268592270 != -1) {
    swift_once();
  }
  id v104 = (id)qword_268595FA0;
  id v105 = (void *)OUTLINED_FUNCTION_4_12();
  uint64_t v106 = (uint64_t *)OUTLINED_FUNCTION_4_12();
  uint64_t v107 = swift_bridgeObjectRelease();
  id v108 = OUTLINED_FUNCTION_130_2(v107, sel_localizedStringForKey_value_table_);

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  uint64_t v109 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  uint64_t v110 = v307;
  objc_msgSend(v307, sel_setAccessibilityLabel_, v109);

  uint64_t v338 = MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_80_4();
  if (v96)
  {
    OUTLINED_FUNCTION_118_3();
    OUTLINED_FUNCTION_105_2(v111);
  }
  double v337 = v85;
  double v336 = v85;
  LOBYTE(v112) = (_BYTE)v327;
  if (v328)
  {
    id v113 = (void *)sub_22DC929E8();
    if (qword_268592270 != -1) {
      swift_once();
    }
    uint64_t v106 = (uint64_t *)(id)qword_268595FA0;
    id v108 = (id)OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_42_0();
    uint64_t v114 = OUTLINED_FUNCTION_126();
    id v115 = OUTLINED_FUNCTION_125_3(v114, sel_localizedStringForKey_value_table_);

    LODWORD(v106) = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    if (sub_22DA10074(1, *v101))
    {
      OUTLINED_FUNCTION_126();
    }
    else
    {
      id v116 = objc_msgSend(objc_allocWithZone((Class)WFSearchBar), sel_initWithStyle_, 4);
      objc_msgSend(v116, sel_setTextFieldDefaultAlignmentBehavior_, 0);
      objc_msgSend(v116, sel_setCancelButtonTrailingPadding_, 6.0);
      id v108 = objc_msgSend(v116, sel_searchTextField);
      uint64_t v106 = (uint64_t *)sub_22DC92948();
      swift_bridgeObjectRelease();
      objc_msgSend(v108, sel_setPlaceholder_, v106);

      objc_msgSend(v116, sel_setDelegate_, v2);
      OUTLINED_FUNCTION_12();
      id v117 = v116;
      sub_22DBB0F74((uint64_t)v117, 1);
      swift_endAccess();
      id v118 = *(id *)&v307[OBJC_IVAR____TtC10WorkflowUI26WFGridSectionContainerView_contentView];
      objc_msgSend(v118, sel_addSubview_, v117);
    }
    OUTLINED_FUNCTION_80_4();
    id v119 = self;
    OUTLINED_FUNCTION_129_1((uint64_t)objc_msgSend(v119, sel_begin), sel_setDisableActions_);
    double v120 = OUTLINED_FUNCTION_66_4();
    objc_msgSend(v121, v122, v120);
    objc_msgSend(v119, sel_commit);
    id v123 = OUTLINED_FUNCTION_64_5(60.0);
    MEMORY[0x230F93DA0]();
    OUTLINED_FUNCTION_96_2();
    int v103 = v312;
    if (v124) {
      OUTLINED_FUNCTION_24_17();
    }
    sub_22DC92BC8();
    sub_22DC92B68();
  }
  uint64_t v315 = v103[2];
  if (!v315)
  {
LABEL_73:
    swift_bridgeObjectRelease();
    uint64_t v169 = v307;
    unint64_t v170 = swift_bridgeObjectRetain();
    sub_22DA03208(v170);
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_22DC92B38();
    swift_bridgeObjectRelease();
    objc_msgSend(v169, sel_setAccessibilityElements_, v53);

    objc_msgSend(v2, sel_contentSize);
    uint64_t v171 = OUTLINED_FUNCTION_17_20();
    v172(v171);
    OUTLINED_FUNCTION_44_11();
    OUTLINED_FUNCTION_20_16();
    v173();
    BOOL v174 = v330;

    if (!v174)
    {
      uint64_t v329 = (char *)self;
      uint64_t v175 = (void *)OUTLINED_FUNCTION_79_5();
      id v176 = OUTLINED_FUNCTION_50_10(v175);
      int v177 = v2;
      sub_22D9CC274((uint64_t)v277);
      uint64_t v178 = swift_allocObject();
      *(void *)(v178 + 16) = sub_22DC0D204;
      *(void *)(v178 + 24) = v103;
      v333 = sub_22DBCB318;
      uint64_t v334 = v178;
      v330 = (void *)MEMORY[0x263EF8330];
      uint64_t v331 = v275;
      uint64_t v332 = sub_22DBFF6CC;
      uint64_t v179 = OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_71_0);
      swift_retain();
      swift_release();
      objc_msgSend(v329, sel_performWithoutAnimation_, v179);
      _Block_release(v179);
      char v180 = OUTLINED_FUNCTION_110_2();
      swift_release();
      if (v180) {
        goto LABEL_158;
      }
      objc_msgSend(v177, sel_insertSubview_atIndex_, v176, 0);
      OUTLINED_FUNCTION_26_16((uint64_t)objc_msgSend(v176, sel_setAlpha_, 1.0), sel_setTransform_);
      unsigned __int8 v335 = v343;
      v339[3] = (uint64_t)v176;
      OUTLINED_FUNCTION_12();
      id v181 = v176;
      uint64_t v182 = OUTLINED_FUNCTION_136_1();
      MEMORY[0x270FA5388](v182);
      OUTLINED_FUNCTION_99_2();
      uint64_t v53 = v274;
      sub_22DC8FC28();
      uint64_t v274 = v53;
      swift_endAccess();
      uint64_t v276 = v103;
      uint64_t v277 = sub_22DC0D204;
    }
    swift_bridgeObjectRelease();
    uint64_t v2 = v324;
    OUTLINED_FUNCTION_114_3();
    uint64_t v1 = v281;
    uint64_t v75 = (void (*)(void))v326;
    if (v96)
    {
      id v184 = objc_msgSend(v169, sel_layer);
      sub_22DC8F7C8();
      uint64_t v185 = (void *)OUTLINED_FUNCTION_140_1();
      objc_msgSend(v184, sel_setValue_forKeyPath_, v53, v185);

      uint64_t v329 = (char *)self;
      uint64_t v186 = OUTLINED_FUNCTION_50();
      *(void *)(v186 + 16) = v169;
      v333 = sub_22DA66F70;
      uint64_t v334 = v186;
      v330 = (void *)MEMORY[0x263EF8330];
      uint64_t v187 = v275;
      uint64_t v331 = v275;
      uint64_t v332 = sub_22D9AA6D0;
      uint64_t v53 = (uint64_t)OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_58_0);
      int64_t v188 = v169;
      swift_release();
      v333 = (uint64_t (*)())CGPointMake;
      uint64_t v334 = 0;
      v330 = (void *)MEMORY[0x263EF8330];
      uint64_t v331 = v187;
      uint64_t v332 = sub_22DA86A10;
      uint64_t v189 = OUTLINED_FUNCTION_52_10((uint64_t)&block_descriptor_61_2);
      OUTLINED_FUNCTION_43_14();
      OUTLINED_FUNCTION_98_3(v329, v190);
      _Block_release(v189);
      _Block_release((const void *)v53);
    }
    OUTLINED_FUNCTION_65_5(v183, sel_setFrame_);
    if (v343)
    {
    }
    else
    {
      id v191 = objc_msgSend(*(id *)&v169[OBJC_IVAR____TtC10WorkflowUI26WFGridSectionContainerView_contentView], sel_layer);
      objc_msgSend(v191, sel_setCornerRadius_, 20.0);
    }
    sub_22D9BF390(v340, v341, v342);
    double v57 = v57 + v84;
    goto LABEL_83;
  }
  uint64_t v329 = (char *)self;
  uint64_t v305 = OBJC_IVAR____TtC10WorkflowUI26WFGridSectionContainerView_contentView;
  OUTLINED_FUNCTION_34();
  char v125 = 0;
  uint64_t v126 = 0;
  while (1)
  {
    OUTLINED_FUNCTION_92_2((uint64_t)&v125[(void)v103]);
    if (v106 == 1) {
      goto LABEL_54;
    }
    if (v344 == 1 || (double v337 = v85, !v125))
    {
      sub_22D9BF3A4((uint64_t)v101, (uint64_t)v108, (char)v106);
      goto LABEL_54;
    }
    if ((unint64_t)(v126 - 1) >= v103[2]) {
      break;
    }
    uint64_t v128 = OUTLINED_FUNCTION_39_11((uint64_t)&v125[(void)v103]);
    sub_22D9BF3A4(v128, v129, v130);
    sub_22D9BF3A4((uint64_t)v75, (uint64_t)v2, (char)v112);
    OUTLINED_FUNCTION_37_12();
    double v132 = v131();
    int v103 = v312;
    double v94 = v132;
    uint64_t v133 = (uint64_t)v2;
    uint64_t v2 = v324;
    sub_22D9BF390((uint64_t)v75, v133, (char)v112);
    double v134 = 0.0;
    if (v328) {
      double v134 = 12.0;
    }
    double v127 = OUTLINED_FUNCTION_146_1(v134);
LABEL_54:
    uint64_t v325 = v125;
    char v344 = 0;
    OUTLINED_FUNCTION_129_1((uint64_t)objc_msgSend(v329, sel_begin, v127), sel_setDisableActions_);
    OUTLINED_FUNCTION_63_4();
    id v108 = v314;
    MEMORY[0x230F90530](v126, v321);
    double v135 = *v318;
    id v101 = v316;
    if (*((void *)*v318 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v136 = sub_22D9FBB9C((uint64_t)v108);
      if (v137)
      {
        unint64_t v138 = *(void **)(*((void *)v135 + 7) + 8 * v136);
        id v139 = v138;
        swift_bridgeObjectRelease();
        goto LABEL_63;
      }
      swift_bridgeObjectRelease();
    }
    OUTLINED_FUNCTION_62_3();
    OUTLINED_FUNCTION_37_12();
    if (v311 < v94 + v140() && v94 < v310)
    {
      OUTLINED_FUNCTION_89_4();
      unint64_t v138 = (void *)v142();
      LODWORD(v106) = 1;
      goto LABEL_65;
    }
    unint64_t v138 = 0;
LABEL_63:
    LODWORD(v106) = 0;
LABEL_65:
    uint64_t v75 = *v317;
    OUTLINED_FUNCTION_20_16();
    v75();
    id v112 = v329;
    objc_msgSend(v329, sel_commit);
    if (v138)
    {
      *(void *)&long long v313 = v75;
      id v143 = v138;
      LODWORD(v328) = v106;
      id v144 = v143;
      id v108 = v327;
      OUTLINED_FUNCTION_128_3();
      v145();
      OUTLINED_FUNCTION_80_4();
      objc_msgSend(v112, sel_begin);
      objc_msgSend(v112, sel_setDisableActions_, 1);
      objc_msgSend(v144, sel_layoutIfNeeded);
      id v146 = v144;
      OUTLINED_FUNCTION_133_2();
      uint64_t v75 = (void (*)(void))v324;
      id v148 = [v324 v147];
      objc_msgSend(v148, sel_displayScale);
      double v94 = v149;

      BSFloatRoundForScale();
      id v150 = OUTLINED_FUNCTION_147_1();
      objc_msgSend(v150, sel_displayScale);

      BSFloatRoundForScale();
      OUTLINED_FUNCTION_127_2();
      OUTLINED_FUNCTION_37_12();
      uint64_t v152 = v151();
      OUTLINED_FUNCTION_93_1(v152, sel_setFrame_);

      objc_msgSend(v329, sel_commit);
      if (v328)
      {
        uint64_t v75 = v304;
        MEMORY[0x230F90530](v126, v321);
        OUTLINED_FUNCTION_12();
        BOOL v153 = v101;
        sub_22DBB0EDC();
        OUTLINED_FUNCTION_20_16();
        v154();
        swift_endAccess();
        objc_msgSend(*(id *)&v307[v305], sel_addSubview_, v153);
      }
      uint64_t v106 = v101;
      MEMORY[0x230F93DA0]();
      OUTLINED_FUNCTION_95_2();
      int v103 = v312;
      if (v124) {
        OUTLINED_FUNCTION_24_17();
      }
      OUTLINED_FUNCTION_80_4();
      OUTLINED_FUNCTION_120_2();
      sub_22DC92B68();

      double v162 = OUTLINED_FUNCTION_1_30();
      char v165 = (char)v101;
    }
    else
    {
      OUTLINED_FUNCTION_80_4();
      double v162 = OUTLINED_FUNCTION_1_30();
    }
    sub_22DC08C54(v155, v156, v157, v158, v159, v160, v161, v165, v162, v163, v164, v265, v266, v267, v268[0], v269, v270);
    uint64_t v166 = OUTLINED_FUNCTION_111_3();
    sub_22D9BF390(v166, v167, v168);
    ++v126;
    char v125 = v325 + 24;
    if (v315 == v126) {
      goto LABEL_73;
    }
  }
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  sub_22DC93868();
  __break(1u);
}

void sub_22DC08A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, uint64_t a7, char a8, double a9, double a10, double a11, double *a12, id a13, double *a14, char a15, double *a16, unsigned char *a17)
{
  v44[0] = a3;
  v44[1] = a4;
  char v45 = a5;
  unint64_t v23 = *(void *)(a2 + 16);
  if (!v23 || v23 - 1 != a1)
  {
    if ((a5 & 0xFD) == 0)
    {
      unint64_t v27 = a1 + 1;
      if (__OFADD__(a1, 1))
      {
        __break(1u);
        return;
      }
      double v28 = 0.0;
      if (v27 < v23)
      {
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v30 = a2 + 24 * v27;
        uint64_t v31 = *(void **)(v30 + 32);
        uint64_t v32 = *(void *)(v30 + 40);
        v42[0] = v31;
        v42[1] = v32;
        char v43 = *(unsigned char *)(v30 + 48);
        char v33 = v43;
        uint64_t v34 = *(double (**)(void *, uint64_t, uint64_t, double))(a7 + 88);
        sub_22D9BF1A8(v31, v32, v43);
        double v28 = v34(v42, ObjectType, a7, a9);
        sub_22D9BF180(v31, v32, v33);
      }
      uint64_t v35 = swift_getObjectType();
      double v36 = (*(double (**)(void *, uint64_t, uint64_t, double))(a7 + 88))(v44, v35, a7, a9) + a10;
      double v37 = *a12;
      if (a8)
      {
        double v38 = v37 - v36;
        *a12 = v38;
        if (v38 - v28 > 0.0) {
          return;
        }
      }
      else
      {
        double v39 = v37 + v36;
        *a12 = v39;
        double v40 = v28 + v39;
        objc_msgSend(a13, sel_contentSize);
        if (v41 > v40) {
          return;
        }
      }
    }
    *a12 = a11;
    if (a15) {
      double v24 = 8.0;
    }
    else {
      double v24 = 16.0;
    }
    uint64_t v25 = swift_getObjectType();
    uint64_t v26 = *(double (**)(void *, uint64_t, uint64_t))(a7 + 80);
    *a14 = *a14 + v24 + v26(v44, v25, a7);
    *a16 = *a16 + v24 + v26(v44, v25, a7);
    *a17 = 1;
  }
}

void sub_22DC08C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, uint64_t a7, char a8, double a9, double a10, double a11, double *a12, id a13, double *a14, char a15, double *a16, unsigned char *a17)
{
  v44[0] = a3;
  v44[1] = a4;
  char v45 = a5;
  unint64_t v23 = *(void *)(a2 + 16);
  if (!v23 || v23 - 1 != a1)
  {
    if (a5 == 1)
    {
      unint64_t v24 = a1 + 1;
      if (__OFADD__(a1, 1))
      {
        __break(1u);
        return;
      }
      double v25 = 0.0;
      if (v24 < v23)
      {
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v27 = a2 + 24 * v24;
        uint64_t v28 = *(void *)(v27 + 32);
        uint64_t v29 = *(void *)(v27 + 40);
        v42[0] = v28;
        v42[1] = v29;
        char v43 = *(unsigned char *)(v27 + 48);
        char v30 = v43;
        uint64_t v31 = *(double (**)(void *, uint64_t, uint64_t, double))(a7 + 88);
        sub_22D9BF3A4(v28, v29, v43);
        double v25 = v31(v42, ObjectType, a7, a9);
        sub_22D9BF390(v28, v29, v30);
      }
      uint64_t v32 = swift_getObjectType();
      double v33 = (*(double (**)(void *, uint64_t, uint64_t, double))(a7 + 88))(v44, v32, a7, a9) + a10;
      double v34 = *a12;
      if (a8)
      {
        double v35 = v34 - v33;
        *a12 = v35;
        if (v35 - v25 > 0.0) {
          return;
        }
      }
      else
      {
        double v36 = v34 + v33;
        *a12 = v36;
        double v37 = v25 + v36;
        objc_msgSend(a13, sel_contentSize);
        if (v38 > v37) {
          return;
        }
      }
    }
    *a12 = a11;
    if (a15) {
      double v39 = 12.0;
    }
    else {
      double v39 = 0.0;
    }
    uint64_t v40 = swift_getObjectType();
    double v41 = *(double (**)(void *, uint64_t, uint64_t))(a7 + 80);
    *a14 = *a14 + v39 + v41(v44, v40, a7);
    *a16 = *a16 + v39 + v41(v44, v40, a7);
    *a17 = 1;
  }
}

void sub_22DC08E78(void *a1, void *a2)
{
  objc_msgSend(a1, sel_setFrame_);
  if (*((unsigned char *)a2 + *(void *)((*MEMORY[0x263F8EED0] & *a2) + 0xC8)) == 1)
  {
    objc_msgSend(a1, sel_setAlpha_, 0.0);
    CGAffineTransformMakeScale(&v16, 0.5, 0.5);
    CGAffineTransformTranslate(&v15, &v16, 0.0, -70.0);
    CGAffineTransform v16 = v15;
    objc_msgSend(a1, sel_setTransform_, &v16);
    uint64_t v4 = sub_22D9A6F3C(0, (unint64_t *)&unk_268596A40);
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    id v5 = sub_22DA86A70();
    uint64_t v6 = (void *)sub_22DC92D38();
    OUTLINED_FUNCTION_1_14();

    uint64_t v7 = (void *)sub_22DC92C08();
    OUTLINED_FUNCTION_1_14();

    uint64_t v8 = (void *)sub_22DC92C08();
    OUTLINED_FUNCTION_1_14();

    uint64_t v9 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_1_14();

    uint64_t v10 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_1_14();

    id v11 = objc_msgSend(a1, sel_layer);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685945E0);
    uint64_t v12 = OUTLINED_FUNCTION_79_5();
    *(_OWORD *)(v12 + 16) = xmmword_22DCB0EA0;
    *(void *)(v12 + 56) = v4;
    *(void *)(v12 + 32) = v5;
    id v13 = v5;
    uint64_t v14 = (void *)sub_22DC92B38();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setFilters_, v14);
  }
}

BOOL sub_22DC090BC(char a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  uint64_t v7 = a1 & 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593660);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t)a5 + *(void *)((*MEMORY[0x263F8EED0] & *a5) + 0x98);
  swift_beginAccess();
  sub_22DA4DA68(v11, (uint64_t)v10, &qword_268593660);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593668);
  uint64_t v13 = sub_22DC8FBF8();
  uint64_t v14 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
  v14(v10, v12);
  uint64_t v15 = sub_22DADCC70(v7, v13);
  char v17 = v16;
  swift_bridgeObjectRelease();
  if (v17) {
    return 0;
  }
  sub_22DA4DA68(v11, (uint64_t)v10, &qword_268593660);
  uint64_t v18 = sub_22DC8FBF8();
  v14(v10, v12);
  uint64_t v19 = sub_22DADCC70(a3 & 1, v18);
  char v21 = v20;
  swift_bridgeObjectRelease();
  return (v21 & 1) == 0 && v15 < v19;
}

BOOL sub_22DC09288(char a1, void *a2, char a3, void *a4, void *a5)
{
  uint64_t v9 = a1 & 1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t)a5 + *(void *)((*MEMORY[0x263F8EED0] & *a5) + 0x98);
  swift_beginAccess();
  sub_22DA4DA68(v13, (uint64_t)v12, &qword_268593680);
  id v26 = a2;
  id v27 = a4;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593688);
  uint64_t v15 = sub_22DC8FBF8();
  char v16 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v16(v12, v14);
  uint64_t v17 = sub_22DADCC70(v9, v15);
  char v19 = v18;
  swift_bridgeObjectRelease();
  if (v19)
  {

    return 0;
  }
  else
  {
    uint64_t v20 = a3 & 1;
    sub_22DA4DA68(v13, (uint64_t)v12, &qword_268593680);
    uint64_t v21 = sub_22DC8FBF8();
    v16(v12, v14);
    uint64_t v22 = sub_22DADCC70(v20, v21);
    LOBYTE(v20) = v23;

    swift_bridgeObjectRelease();
    return (v20 & 1) == 0 && v17 < v22;
  }
}

void sub_22DC0948C(void *a1@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22DC93628()) {
    sub_22DA26AD4(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  *a1 = v2;
}

uint64_t sub_22DC094E8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_allSymbolItems) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DC09500()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859C018);
  sub_22D9BF134();
  sub_22DC8FC68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593688);
  sub_22DC8FCB8();
  sub_22DC8FCB8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593090);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22DCB0EA0;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 2;
  sub_22DBFF434();
  swift_setDeallocating();
  sub_22DC0AED4();
  swift_bridgeObjectRetain();
  sub_22DBFF434();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DC09664()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859C018);
  sub_22D9BF134();
  sub_22DC8FC68();
  swift_bridgeObjectRetain();
  sub_22DBFF434();
  return swift_bridgeObjectRelease();
}

void sub_22DC09708()
{
  OUTLINED_FUNCTION_11_0();
  unint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  uint64_t v7 = OUTLINED_FUNCTION_62(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v11 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859C018);
    sub_22D9BF134();
    sub_22DC8FC68();
    uint64_t v12 = MEMORY[0x263F8EE78];
    __swift_instantiateConcreteTypeFromMangledName(&qword_268593688);
    sub_22DC8FCB8();
    uint64_t v13 = sub_22DA338C8();
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      uint64_t v25 = v5;
      sub_22D9BA6B4();
      uint64_t v15 = (unsigned __int16 *)(v13 + 32);
      unint64_t v16 = *(void *)(v12 + 16);
      uint64_t v17 = 24 * v16;
      do
      {
        unsigned int v19 = *v15++;
        uint64_t v18 = v19;
        unint64_t v20 = v16 + 1;
        if (v16 >= *(void *)(v12 + 24) >> 1) {
          sub_22D9BA6B4();
        }
        *(void *)(v12 + 16) = v20;
        uint64_t v21 = v12 + v17;
        *(void *)(v21 + 32) = v18;
        *(void *)(v21 + 40) = 0;
        *(unsigned char *)(v21 + 48) = 1;
        v17 += 24;
        unint64_t v16 = v20;
        --v14;
      }
      while (v14);
      uint64_t v5 = v25;
    }
    sub_22DBFF434();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void *)(v13 + 16);
    swift_bridgeObjectRelease();
    if (!v22)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268593090);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22DCB0EA0;
      *(_OWORD *)(inited + 32) = xmmword_22DCB2E90;
      *(unsigned char *)(inited + 48) = 2;
      sub_22DBFF434();
      swift_setDeallocating();
      sub_22DC0AED4();
    }
    sub_22DC0D2D0(v10, v5, &qword_268593680);
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_0();
    sub_22DC09664();
  }
}

void sub_22DC099A8()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268596A50);
  uint64_t v7 = OUTLINED_FUNCTION_62(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_45();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593628);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593630);
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_11_1();
  uint64_t v19 = v18 - v17;
  *(void *)&v0[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_glyphRegistryCancellable] = 0;
  v0[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_renameTextFieldDidAppear] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_allSymbolItems] = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_gridView] = v5;
  *(void *)&v0[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_collection] = v3;
  uint64_t v20 = qword_268592200;
  uint64_t v21 = v0;
  id v22 = v5;
  uint64_t v34 = v3;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  *(void *)&v21[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_glyphRegistry] = qword_2685945F0;
  swift_retain();

  char v23 = (objc_class *)type metadata accessor for WFCollectionConfigurationDataSource();
  v36.receiver = v21;
  v36.super_class = v23;
  id v24 = objc_msgSendSuper2(&v36, sel_init);
  OUTLINED_FUNCTION_12();
  uint64_t v25 = (char *)v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268593638);
  sub_22DC90738();
  swift_endAccess();
  sub_22D9A6F3C(0, (unint64_t *)&qword_268595B40);
  id v35 = (id)sub_22DC92F78();
  uint64_t v26 = sub_22DC92F58();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v26);
  sub_22D9A6FA0(&qword_268593640, &qword_268593628);
  sub_22D9D47F8();
  sub_22DC907B8();
  sub_22D9CAD04(v1, &qword_268596A50);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  uint64_t v27 = OUTLINED_FUNCTION_50();
  swift_unknownObjectWeakInit();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = v22;
  sub_22D9A6FA0(&qword_268593650, &qword_268593630);
  id v29 = v22;
  uint64_t v30 = v33;
  uint64_t v31 = sub_22DC907D8();

  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v30);
  *(void *)&v25[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_glyphRegistryCancellable] = v31;
  swift_release();
  OUTLINED_FUNCTION_12_0();
}

void sub_22DC09D70(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x230F96100](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = sub_22DC09E68(v2);
    sub_22DC094E8(v6);
    sub_22DC0A220(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268593090);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22DCB0EA0;
    swift_retain();
    unsigned __int16 v8 = sub_22D9F22CC();
    swift_release();
    *(void *)(inited + 32) = v8;
    *(void *)(inited + 40) = 0;
    *(unsigned char *)(inited + 48) = 1;
    sub_22D9D4018();
    swift_setDeallocating();
    sub_22DC0AED4();
  }
}

uint64_t sub_22DC09E68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WFGlyphCategory();
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v42 = *(void *)(a1 + 16);
  if (!v42) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v7 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v40 = *(void *)(v3 + 72);
  uint64_t v41 = v7;
  v37[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  uint64_t v9 = v6;
  double v38 = v5;
  uint64_t v39 = v2;
  while (1)
  {
    sub_22D9D4954(v41 + v40 * v8, (uint64_t)v5);
    uint64_t v10 = &v5[*(int *)(v2 + 20)];
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *((void *)v10 + 1);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D9AE7B4();
      uint64_t v9 = v33;
    }
    unint64_t v14 = *(void *)(v9 + 16);
    unint64_t v13 = *(void *)(v9 + 24);
    unint64_t v15 = v14 + 1;
    uint64_t v43 = v8;
    if (v14 >= v13 >> 1)
    {
      sub_22D9AE7B4();
      uint64_t v9 = v34;
    }
    *(void *)(v9 + 16) = v15;
    uint64_t v44 = v9;
    uint64_t v16 = v9 + 24 * v14;
    *(void *)(v16 + 32) = v11;
    *(void *)(v16 + 40) = v12;
    *(unsigned char *)(v16 + 48) = 0;
    uint64_t v17 = *(void *)&v5[*(int *)(v2 + 24)];
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v45 = v6;
      swift_bridgeObjectRetain();
      sub_22D9BA6B4();
      uint64_t v19 = 0;
      uint64_t v20 = v45;
      uint64_t v21 = *(void *)(v45 + 16);
      uint64_t v22 = 24 * v21;
      do
      {
        uint64_t v23 = *(unsigned __int16 *)(v17 + 32 + 2 * v19);
        uint64_t v45 = v20;
        uint64_t v24 = v21 + v19 + 1;
        if ((unint64_t)(v21 + v19) >= *(void *)(v20 + 24) >> 1)
        {
          sub_22D9BA6B4();
          uint64_t v20 = v45;
        }
        ++v19;
        *(void *)(v20 + 16) = v24;
        uint64_t v25 = v20 + v22;
        *(void *)(v25 + 32) = v23;
        *(void *)(v25 + 40) = 0;
        *(unsigned char *)(v25 + 48) = 1;
        v22 += 24;
      }
      while (v18 != v19);
      swift_bridgeObjectRelease();
      uint64_t v9 = v44;
      unint64_t v15 = *(void *)(v44 + 16);
      uint64_t v5 = v38;
      uint64_t v2 = v39;
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v20 = v6;
      uint64_t v9 = v44;
    }
    uint64_t v26 = *(void *)(v20 + 16);
    if (__OFADD__(v15, v26)) {
      break;
    }
    if ((int64_t)(v15 + v26) > *(void *)(v9 + 24) >> 1)
    {
      sub_22D9AE7B4();
      uint64_t v9 = v35;
      if (*(void *)(v20 + 16))
      {
LABEL_17:
        uint64_t v27 = *(void *)(v9 + 16);
        if ((*(void *)(v9 + 24) >> 1) - v27 < v26) {
          goto LABEL_34;
        }
        unint64_t v28 = v9 + 24 * v27 + 32;
        if (v20 + 32 < v28 + 24 * v26 && v28 < v20 + 32 + 24 * v26) {
          goto LABEL_36;
        }
        swift_arrayInitWithCopy();
        if (v26)
        {
          uint64_t v30 = *(void *)(v9 + 16);
          BOOL v31 = __OFADD__(v30, v26);
          uint64_t v32 = v30 + v26;
          if (v31) {
            goto LABEL_35;
          }
          *(void *)(v9 + 16) = v32;
        }
        goto LABEL_28;
      }
    }
    else if (v26)
    {
      goto LABEL_17;
    }
    if (v26) {
      goto LABEL_33;
    }
LABEL_28:
    uint64_t v8 = v43 + 1;
    swift_bridgeObjectRelease();
    sub_22D9D49B8((uint64_t)v5);
    if (v8 == v42)
    {
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  uint64_t result = sub_22DC93678();
  __break(1u);
  return result;
}

uint64_t sub_22DC0A220(int a1)
{
  return sub_22DC0A250(a1, (void (*)(void))sub_22DC09500);
}

uint64_t sub_22DC0A238(int a1)
{
  return sub_22DC0A250(a1, (void (*)(void))sub_22DC09664);
}

uint64_t sub_22DC0A250(int a1, void (*a2)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  uint64_t v7 = OUTLINED_FUNCTION_62(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_97();
  id v8 = *(id *)(v2 + OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_gridView);
  a2();
  sub_22DC01640(v3, a1);

  return sub_22D9CAD04(v3, &qword_268593680);
}

uint64_t sub_22DC0A300()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268593680);
  uint64_t v3 = OUTLINED_FUNCTION_62(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_97();
  id v4 = *(id *)(v0 + OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_gridView);
  sub_22DC09708();
  sub_22DC01640(v1, 0);

  return sub_22D9CAD04(v1, &qword_268593680);
}

void sub_22DC0A3B4()
{
  OUTLINED_FUNCTION_11_0();
  double v57 = v0;
  char v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_120();
  sub_22DC926B8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v55 = v11;
  uint64_t v56 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_45();
  sub_22DC926E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v54 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_87_0();
  sub_22DC92708();
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_70_5();
  if (!v5)
  {
    if (!OUTLINED_FUNCTION_135_2((uint64_t)"IconPickerHeaderView")) {
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_120();
    type metadata accessor for WFIconPickerHeaderView();
    uint64_t v23 = swift_dynamicCastClass();
    if (v23)
    {
      uint64_t v24 = *(void **)(v23 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerHeaderView_label);
      uint64_t v0 = v0;
      sub_22DB2F5AC(v9, v7, v24);
      OUTLINED_FUNCTION_82_5();
      sub_22DC0CF58(v25, v26, v27);
    }
    goto LABEL_9;
  }
  if (v5 != 1)
  {
    if (v9 | v7)
    {
      sub_22DC04D28(0xD000000000000016, 0x800000022DC9FFF0);
      goto LABEL_16;
    }
    uint64_t v53 = v18;
    uint64_t v28 = sub_22DC04D28(0xD00000000000002DLL, 0x800000022DCA0860);
    if (!v28) {
      goto LABEL_16;
    }
    id v29 = (void *)v28;
    type metadata accessor for WFCollectionNameFieldCell();
    uint64_t v30 = swift_dynamicCastClass();
    if (!v30)
    {

      goto LABEL_16;
    }
    uint64_t v51 = OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_collection;
    id v52 = v29;
    swift_retain();
    uint64_t v31 = sub_22D9F23B0();
    uint64_t v33 = v32;
    swift_release();
    sub_22DA9FA84(v31, v33);
    uint64_t v34 = OUTLINED_FUNCTION_50();
    uint64_t v35 = v57;
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_22DA9F900((uint64_t)sub_22DC0CFE8, v34);
    swift_release();
    if (v35[OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_renameTextFieldDidAppear])
    {

      goto LABEL_16;
    }
    uint64_t v50 = OBJC_IVAR____TtC10WorkflowUI35WFCollectionConfigurationDataSource_renameTextFieldDidAppear;
    swift_retain();
    uint64_t v36 = sub_22D9F23B0();
    uint64_t v38 = v37;
    swift_release();
    if (v36 || v38 != 0xE000000000000000)
    {
      char v39 = sub_22DC937E8();
      swift_bridgeObjectRelease();
      if ((v39 & 1) == 0)
      {

        goto LABEL_24;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_22D9A6F3C(0, (unint64_t *)&qword_268595B40);
    uint64_t v49 = sub_22DC92F78();
    sub_22DC926F8();
    MEMORY[0x230F939A0](v17, 0.18);
    uint64_t v40 = *(void *)(v53 + 8);
    v53 += 8;
    uint64_t v51 = v40;
    OUTLINED_FUNCTION_10();
    v41();
    uint64_t v42 = OUTLINED_FUNCTION_50();
    *(void *)(v42 + 16) = v30;
    v58[4] = sub_22DC0D028;
    v58[5] = v42;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 1107296256;
    v58[2] = sub_22D9AA6D0;
    v58[3] = &block_descriptor_39;
    uint64_t v43 = _Block_copy(v58);
    id v52 = v52;
    swift_release();
    sub_22DC926D8();
    v58[0] = MEMORY[0x263F8EE78];
    sub_22DC0D0D4((unint64_t *)&qword_268596CD0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268595B50);
    sub_22D9A6FA0((unint64_t *)&qword_268596CE0, &qword_268595B50);
    sub_22DC932C8();
    uint64_t v44 = (void *)v49;
    MEMORY[0x230F941C0](v3, v2, v1, v43);
    _Block_release(v43);

    OUTLINED_FUNCTION_10();
    v45();
    OUTLINED_FUNCTION_10();
    v46();
    OUTLINED_FUNCTION_10();
    v47();
LABEL_24:
    v57[v50] = 1;
    goto LABEL_16;
  }
  if (OUTLINED_FUNCTION_135_2((uint64_t)"IconPickerSymbolCell"))
  {
    OUTLINED_FUNCTION_120();
    type metadata accessor for WFIconPickerSymbolCell();
    uint64_t v19 = swift_dynamicCastClass();
    if (v19)
    {
      id v20 = objc_allocWithZone(MEMORY[0x263F854A8]);
      uint64_t v21 = v0;
      id v22 = objc_msgSend(v20, sel_initWithGlyph_, (unsigned __int16)v9);
      sub_22DC0DAC4(v22, 1);

      swift_retain();
      LOWORD(v22) = sub_22D9F22CC();
      swift_release();
      *(unsigned char *)(v19 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_isSelected) = (unsigned __int16)v9 == (unsigned __int16)v22;
      sub_22DC0DFDC();

      goto LABEL_16;
    }
LABEL_9:
  }
LABEL_16:
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_22DC0A9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x230F96100](v3);
  if (result)
  {
    char v5 = (void *)result;
    swift_retain();

    swift_bridgeObjectRetain();
    sub_22D9F2424();
    return swift_release();
  }
  return result;
}

id sub_22DC0AA68(int a1, id a2)
{
  id result = objc_msgSend(a2, sel_isFirstResponder);
  if (result)
  {
    sub_22DBE7DF8(a2);
    sub_22DC0A300();
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22DC0AADC(uint64_t a1, void *a2)
{
  uint64_t v2 = sub_22DBE7DF8(a2);
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
LABEL_5:
    return sub_22DC0A238(1);
  }
  return result;
}

uint64_t sub_22DC0AB54()
{
  return sub_22DC0A220(1);
}

double sub_22DC0AB5C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (qword_268592398 != -1) {
        swift_once();
      }
      return *(double *)&qword_2685B4EB8;
    }
    else if (a1 | a2)
    {
      if (qword_268592278 != -1) {
        swift_once();
      }
      return *(double *)&qword_2685B4DB8;
    }
    else
    {
      return 54.0;
    }
  }
  else
  {
    if (qword_2685922C0 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_2685B4DE8, sel_lineHeight);
    return v4 + 12.0;
  }
}

double sub_22DC0AC58(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    if (qword_268592398 != -1) {
      swift_once();
    }
    return *(double *)&qword_2685B4EB8;
  }
  return result;
}

void sub_22DC0ACB4()
{
}

id sub_22DC0ACF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFCollectionConfigurationDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFCollectionConfigurationDataSource()
{
  return self;
}

void sub_22DC0ADC8()
{
}

double sub_22DC0ADE4(uint64_t a1)
{
  return sub_22DC0AB5C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

double sub_22DC0AE08(uint64_t a1, uint64_t a2)
{
  return sub_22DC0AC58(a1, a2, *(unsigned char *)(a1 + 16));
}

uint64_t sub_22DC0AE24()
{
  type metadata accessor for SmartShortcutPickerEntry();
  swift_arrayDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_82();
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22DC0AE98()
{
  swift_arrayDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_82();
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22DC0AED4()
{
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_22DC0AF18()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685995A0);
  swift_arrayDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_82();
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22DC0AF74(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_22D9FBB9C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859C008);
  sub_22DC93598();
  sub_22DC8F2E8();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10();
  v6();
  uint64_t v7 = *(void *)(*(void *)(v9 + 56) + 8 * v4);
  type metadata accessor for WFGridViewCell();
  sub_22DC0D0D4(&qword_268593F70, MEMORY[0x263F07A30]);
  sub_22DC935B8();
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_22DC0B0D0()
{
  OUTLINED_FUNCTION_11_0();
  unsigned __int8 v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_22D9FB9C8(v4, v2, v0);
  OUTLINED_FUNCTION_4_27();
  if (v9)
  {
    __break(1u);
LABEL_13:
    uint64_t result = sub_22DC93868();
    __break(1u);
    return result;
  }
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859B398);
  OUTLINED_FUNCTION_76_5();
  if (sub_22DC93598())
  {
    sub_22D9FB9C8(v5, v3, v1);
    OUTLINED_FUNCTION_25_17();
    if (!v11) {
      goto LABEL_13;
    }
  }
  if (v10)
  {
    OUTLINED_FUNCTION_12_0();
    return sub_22DC0D744(v12, v13);
  }
  else
  {
    OUTLINED_FUNCTION_82_5();
    sub_22DC0B948(v16, v17, v18, v1, v7, v19);
    OUTLINED_FUNCTION_12_0();
    return sub_22D9CA494(v20, v21, v22);
  }
}

void sub_22DC0B1F0()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_34_14(v6, v7, v8);
  OUTLINED_FUNCTION_4_27();
  if (v9)
  {
    __break(1u);
LABEL_12:
    sub_22DC93868();
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_19_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268596008);
  if (OUTLINED_FUNCTION_23_22())
  {
    sub_22D9FBAD4(v2, v1);
    OUTLINED_FUNCTION_25_17();
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v4 = v10;
  }
  if (v5)
  {
    uint64_t v12 = *(void *)(*(void *)v3 + 56);
    swift_bridgeObjectRelease();
    *(void *)(v12 + 8 * v4) = v0;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    OUTLINED_FUNCTION_83_4();
    sub_22DC0B9B4(v13, v14, v15, v16, v17);
    OUTLINED_FUNCTION_47();
    swift_bridgeObjectRetain();
  }
}

void sub_22DC0B2BC()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_22DC8F2E8();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_45();
  sub_22D9FBB9C(v3);
  OUTLINED_FUNCTION_4_27();
  if (v12)
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v10;
  char v14 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859C008);
  OUTLINED_FUNCTION_76_5();
  if (sub_22DC93598())
  {
    unint64_t v15 = sub_22D9FBB9C(v3);
    if ((v14 & 1) == (v16 & 1))
    {
      unint64_t v13 = v15;
      goto LABEL_5;
    }
LABEL_10:
    sub_22DC93868();
    __break(1u);
    return;
  }
LABEL_5:
  uint64_t v17 = *v0;
  if (v14)
  {
    uint64_t v18 = v17[7];

    *(void *)(v18 + 8 * v13) = v5;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v1, v3, v6);
    sub_22DC0B9FC(v13, v1, v5, v17);
  }
  OUTLINED_FUNCTION_12_0();
}

void sub_22DC0B3F0()
{
}

uint64_t sub_22DC0B418(uint64_t a1, char a2, uint64_t a3)
{
  return sub_22DC0B66C(a1, a2, a3, (void (*)(uint64_t))sub_22D9FBC34, &qword_26859C038, (uint64_t)&type metadata for WFIconPickerSection, &qword_268593658);
}

void sub_22DC0B448()
{
  OUTLINED_FUNCTION_48();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_22D9FBAD4(v3, v1);
  OUTLINED_FUNCTION_4_27();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26859C050);
  if ((OUTLINED_FUNCTION_23_22() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_22D9FBAD4(v4, v2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    sub_22DC93868();
    __break(1u);
    return;
  }
  unint64_t v10 = v12;
LABEL_5:
  char v14 = *v0;
  if (v11)
  {
    *(void *)(v14[7] + 8 * v10) = v6;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    sub_22DC0B9B4(v10, v4, v2, v6, v14);
    OUTLINED_FUNCTION_47();
    swift_bridgeObjectRetain();
  }
}

void sub_22DC0B540()
{
}

void sub_22DC0B568()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9 & 1;
  v5(v10);
  OUTLINED_FUNCTION_4_27();
  if (v11)
  {
    __break(1u);
LABEL_11:
    sub_22DC93868();
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_19_11();
  __swift_instantiateConcreteTypeFromMangledName(v4);
  OUTLINED_FUNCTION_76_5();
  if (sub_22DC93598())
  {
    v6(v10);
    OUTLINED_FUNCTION_25_17();
    if (!v13) {
      goto LABEL_11;
    }
    unint64_t v1 = v12;
  }
  uint64_t v14 = *v0;
  if (v2)
  {
    uint64_t v15 = *(void *)(v14 + 56);

    *(void *)(v15 + 8 * v1) = v8;
  }
  else
  {
    sub_22DC0BAB4(v1, v10, v8, v14);
  }
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_22DC0B63C(uint64_t a1, char a2, uint64_t a3)
{
  return sub_22DC0B66C(a1, a2, a3, (void (*)(uint64_t))sub_22D9FBC34, &qword_26859C000, (uint64_t)&type metadata for WFFolderConfigSection, &qword_268593678);
}

uint64_t sub_22DC0B66C(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t), uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v12 = a2 & 1;
  a4(v12);
  OUTLINED_FUNCTION_4_27();
  if (v15)
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v16 = v13;
  char v17 = v14;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  if ((sub_22DC93598() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v18 = ((uint64_t (*)(uint64_t))a4)(v12);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    uint64_t result = sub_22DC93868();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v7;
  if ((v17 & 1) == 0) {
    return sub_22DC0BAE0(v16, v12, a1, v20, a7);
  }
  uint64_t v21 = *(void *)(v20 + 56);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(a7);
  OUTLINED_FUNCTION_62(v22);
  return sub_22DA4CEC0(a1, v21 + *(void *)(v23 + 72) * v16, a7);
}

void sub_22DC0B790()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_34_14(v6, v7, v8);
  OUTLINED_FUNCTION_4_27();
  if (v9)
  {
    __break(1u);
LABEL_12:
    sub_22DC93868();
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_19_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859C020);
  if (OUTLINED_FUNCTION_23_22())
  {
    sub_22D9FBAD4(v2, v1);
    OUTLINED_FUNCTION_25_17();
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v4 = v10;
  }
  if (v5)
  {
    uint64_t v12 = *(void *)(*(void *)v3 + 56);
    swift_release();
    *(void *)(v12 + 8 * v4) = v0;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    OUTLINED_FUNCTION_83_4();
    sub_22DC0B9B4(v13, v14, v15, v16, v17);
    OUTLINED_FUNCTION_47();
    swift_bridgeObjectRetain();
  }
}

void sub_22DC0B85C()
{
  OUTLINED_FUNCTION_48();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_22D9FC6A4(v1);
  OUTLINED_FUNCTION_4_27();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26859A848);
  if ((OUTLINED_FUNCTION_23_22() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_22D9FC6A4(v2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    sub_22DC93868();
    __break(1u);
    return;
  }
  unint64_t v10 = v12;
LABEL_5:
  if (v11)
  {
    uint64_t v14 = (void *)(*(void *)(*(void *)v0 + 56) + 16 * v10);
    swift_unknownObjectRelease();
    *uint64_t v14 = v6;
    v14[1] = v4;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    OUTLINED_FUNCTION_83_4();
    OUTLINED_FUNCTION_47();
    sub_22DC0BB60(v15, v16, v17, v18, v19);
  }
}

unint64_t sub_22DC0B948(unint64_t result, uint64_t a2, uint64_t a3, char a4, _OWORD *a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = a6[6] + 24 * result;
  *(void *)uint64_t v6 = a2;
  *(void *)(v6 + 8) = a3;
  *(unsigned char *)(v6 + 16) = a4;
  unint64_t v7 = (_OWORD *)(a6[7] + (result << 6));
  long long v8 = a5[1];
  *unint64_t v7 = *a5;
  v7[1] = v8;
  v7[2] = a5[2];
  *(_OWORD *)((char *)v7 + 41) = *(_OWORD *)((char *)a5 + 41);
  uint64_t v9 = a6[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a6[2] = v11;
  }
  return result;
}

unint64_t sub_22DC0B9B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_22DC0B9FC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_22DC8F2E8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_22DC0BAB4(unint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = OUTLINED_FUNCTION_35_14(a1, a2, a3, a4);
  *(void *)(*(void *)(v5 + 56) + 8 * result) = v6;
  uint64_t v7 = *(void *)(v5 + 16);
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    *(void *)(v5 + 16) = v9;
  }
  return result;
}

uint64_t sub_22DC0BAE0(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  OUTLINED_FUNCTION_35_14(a1, a2, a3, a4);
  uint64_t v10 = *(void *)(v9 + 56);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
  OUTLINED_FUNCTION_62(v12);
  uint64_t result = sub_22DC0D2D0(a3, v10 + *(void *)(v13 + 72) * a1, a5);
  uint64_t v15 = *(void *)(a4 + 16);
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v17;
  }
  return result;
}

unint64_t sub_22DC0BB60(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = (void *)(a5[7] + 16 * result);
  *uint64_t v5 = a3;
  v5[1] = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void sub_22DC0BBA8(uint64_t a1)
{
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    if (!sub_22DC93348()) {
      return;
    }
LABEL_5:
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_22DC93308();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
      sub_22D9A6FA0(&qword_268594388, &qword_26AEF9BC8);
      sub_22DC92D18();
      a1 = v30;
      uint64_t v28 = v31;
      uint64_t v3 = v32;
      int64_t v4 = v33;
      unint64_t v5 = v34;
    }
    else
    {
      uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v28 = a1 + 56;
      uint64_t v3 = ~v6;
      uint64_t v7 = -v6;
      if (v7 < 64) {
        uint64_t v8 = ~(-1 << v7);
      }
      else {
        uint64_t v8 = -1;
      }
      unint64_t v5 = v8 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      int64_t v4 = 0;
    }
    uint64_t v26 = v3;
    int64_t v9 = (unint64_t)(v3 + 64) >> 6;
    uint64_t v27 = MEMORY[0x263F8EE50] + 8;
    if (a1 < 0) {
      goto LABEL_14;
    }
    while (1)
    {
      if (v5)
      {
        uint64_t v10 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
        int64_t v12 = v4;
      }
      else
      {
        int64_t v21 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v21 >= v9) {
          goto LABEL_36;
        }
        unint64_t v22 = *(void *)(v28 + 8 * v21);
        int64_t v12 = v4 + 1;
        if (!v22)
        {
          int64_t v12 = v4 + 2;
          if (v4 + 2 >= v9) {
            goto LABEL_36;
          }
          unint64_t v22 = *(void *)(v28 + 8 * v12);
          if (!v22)
          {
            int64_t v12 = v4 + 3;
            if (v4 + 3 >= v9) {
              goto LABEL_36;
            }
            unint64_t v22 = *(void *)(v28 + 8 * v12);
            if (!v22)
            {
              int64_t v12 = v4 + 4;
              if (v4 + 4 >= v9) {
                goto LABEL_36;
              }
              unint64_t v22 = *(void *)(v28 + 8 * v12);
              if (!v22)
              {
                int64_t v12 = v4 + 5;
                if (v4 + 5 >= v9) {
                  goto LABEL_36;
                }
                unint64_t v22 = *(void *)(v28 + 8 * v12);
                if (!v22)
                {
                  int64_t v23 = v4 + 6;
                  while (v23 < v9)
                  {
                    unint64_t v22 = *(void *)(v28 + 8 * v23++);
                    if (v22)
                    {
                      int64_t v12 = v23 - 1;
                      goto LABEL_32;
                    }
                  }
LABEL_36:
                  sub_22DA0D508();
                  return;
                }
              }
            }
          }
        }
LABEL_32:
        uint64_t v10 = (v22 - 1) & v22;
        unint64_t v11 = __clz(__rbit64(v22)) + (v12 << 6);
      }
      id v13 = *(id *)(*(void *)(a1 + 48) + 8 * v11);
      if (!v13) {
        goto LABEL_36;
      }
      while (1)
      {
        sub_22D9BD67C((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20, v26, v27);
        uint64_t v25 = v24;

        int64_t v4 = v12;
        unint64_t v5 = v10;
        if ((a1 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_14:
        if (sub_22DC93378())
        {
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
          swift_dynamicCast();
          id v13 = v29;
          swift_unknownObjectRelease();
          int64_t v12 = v4;
          uint64_t v10 = v5;
          if (v29) {
            continue;
          }
        }
        goto LABEL_36;
      }
    }
  }
  if (*(void *)(*(void *)v1 + 16)) {
    goto LABEL_5;
  }
}

void sub_22DC0BE90()
{
  OUTLINED_FUNCTION_48();
  if (!*(void *)(*(void *)v0 + 16))
  {
    OUTLINED_FUNCTION_47();
    return;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v1 + 56;
  OUTLINED_FUNCTION_15_20();
  unint64_t v8 = v7 & v6;
  int64_t v10 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_4;
  }
LABEL_3:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v3(*(unsigned __int8 *)(*(void *)(v4 + 48) + i));
    if (v8) {
      goto LABEL_3;
    }
LABEL_4:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v14 >= v10) {
      goto LABEL_22;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_22;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_22;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v11);
        if (!v15)
        {
          int64_t v11 = v14 + 3;
          if (v14 + 3 >= v10) {
            goto LABEL_22;
          }
          unint64_t v15 = *(void *)(v5 + 8 * v11);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 4;
  if (v16 < v10)
  {
    unint64_t v15 = *(void *)(v5 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v11 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_27;
        }
        if (v11 >= v10) {
          goto LABEL_22;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v11);
        ++v16;
        if (v15) {
          goto LABEL_19;
        }
      }
    }
    int64_t v11 = v16;
    goto LABEL_19;
  }
LABEL_22:
  OUTLINED_FUNCTION_47();
  swift_release();
}

uint64_t sub_22DC0BFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v42[10] = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22DC93308();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
    sub_22D9A6FA0(&qword_268594388, &qword_26AEF9BC8);
    sub_22DC92D18();
    uint64_t v3 = v42[5];
    uint64_t v4 = v42[6];
    uint64_t v5 = v42[7];
    int64_t v39 = v42[8];
    unint64_t v6 = v42[9];
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v4 = a1 + 56;
    uint64_t v5 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v39 = 0;
  }
  v42[0] = v3;
  v42[1] = v4;
  void v42[2] = v5;
  v36[3] = v3 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = v2 + 56;
  int64_t v37 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v38 = v4;
  v36[0] = v37 - 1;
  v36[1] = v5;
  v36[2] = MEMORY[0x263F8EE50] + 8;
  if ((v3 & 0x8000000000000000) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v11 = sub_22DC93378();
  if (!v11) {
    goto LABEL_52;
  }
  uint64_t v40 = v11;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
  swift_dynamicCast();
  id v12 = v41;
  swift_unknownObjectRelease();
  if (!v41) {
    goto LABEL_52;
  }
  while (1)
  {
    uint64_t v18 = sub_22DC93128();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    if ((*(void *)(v10 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
      id v21 = *(id *)(*(void *)(v2 + 48) + 8 * v20);
      char v22 = sub_22DC93138();

      if (v22)
      {
LABEL_42:
        v42[3] = v39;
        v42[4] = v6;

        char v28 = *(unsigned char *)(v2 + 32);
        unint64_t v29 = (unint64_t)((1 << v28) + 63) >> 6;
        size_t v30 = 8 * v29;
        if ((v28 & 0x3Fu) < 0xE
          || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
        {
          MEMORY[0x270FA5388](isStackAllocationSafe);
          memcpy((char *)v36 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v30);
          sub_22DC0C8D0((void *)((char *)v36 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0)), v29, v2, v20, v42);
          uint64_t v32 = v31;
          swift_release();
          sub_22DA0D508();
        }
        else
        {
          uint64_t v33 = (void *)swift_slowAlloc();
          memcpy(v33, (const void *)(v2 + 56), v30);
          sub_22DC0C8D0(v33, v29, v2, v20, v42);
          uint64_t v32 = v34;
          swift_release();
          sub_22DA0D508();
          MEMORY[0x230F95FD0](v33, -1, -1);
        }
        return v32;
      }
      uint64_t v23 = ~v19;
      while (1)
      {
        unint64_t v20 = (v20 + 1) & v23;
        if (((*(void *)(v10 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
          break;
        }
        id v24 = *(id *)(*(void *)(v2 + 48) + 8 * v20);
        char v25 = sub_22DC93138();

        if (v25) {
          goto LABEL_42;
        }
      }
    }

    if (v3 < 0) {
      goto LABEL_10;
    }
LABEL_13:
    if (!v6) {
      break;
    }
    unint64_t v13 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v14 = v13 | (v39 << 6);
LABEL_25:
    id v12 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
    if (!v12) {
      goto LABEL_52;
    }
  }
  int64_t v15 = v39 + 1;
  if (__OFADD__(v39, 1)) {
    __break(1u);
  }
  if (v15 >= v37) {
    goto LABEL_52;
  }
  unint64_t v16 = *(void *)(v38 + 8 * v15);
  if (v16)
  {
LABEL_24:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v15 << 6);
    int64_t v39 = v15;
    goto LABEL_25;
  }
  int64_t v17 = v39 + 2;
  if (v39 + 2 >= v37) {
    goto LABEL_51;
  }
  unint64_t v16 = *(void *)(v38 + 8 * v17);
  if (v16) {
    goto LABEL_20;
  }
  if (v39 + 3 >= v37) {
    goto LABEL_49;
  }
  unint64_t v16 = *(void *)(v38 + 8 * (v39 + 3));
  if (v16)
  {
    int64_t v15 = v39 + 3;
    goto LABEL_24;
  }
  int64_t v17 = v39 + 4;
  if (v39 + 4 >= v37)
  {
    v39 += 3;
    goto LABEL_52;
  }
  unint64_t v16 = *(void *)(v38 + 8 * v17);
  if (v16)
  {
LABEL_20:
    int64_t v15 = v17;
    goto LABEL_24;
  }
  int64_t v15 = v39 + 5;
  if (v39 + 5 >= v37)
  {
LABEL_49:
    int64_t v39 = v17;
    goto LABEL_52;
  }
  unint64_t v16 = *(void *)(v38 + 8 * v15);
  if (v16) {
    goto LABEL_24;
  }
  int64_t v26 = v39 + 6;
  while (v26 < v37)
  {
    unint64_t v16 = *(void *)(v38 + 8 * v26++);
    if (v16)
    {
      int64_t v15 = v26 - 1;
      goto LABEL_24;
    }
  }
  int64_t v15 = v36[0];
LABEL_51:
  int64_t v39 = v15;
LABEL_52:
  sub_22DA0D508();
  return v2;
}

void sub_22DC0C560()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = v1;
  v37[5] = *MEMORY[0x263EF8340];
  if (!*(void *)(v1 + 16))
  {
    swift_release();
LABEL_35:
    OUTLINED_FUNCTION_12_0();
    return;
  }
  uint64_t v4 = (void *)v0;
  int64_t v5 = 0;
  uint64_t v7 = v0 + 56;
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v8 = -1 << *(unsigned char *)(v0 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = ~v8;
  if (-v8 < 64) {
    uint64_t v9 = ~(-1 << -(char)v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & v6;
  int64_t v11 = (unint64_t)(63 - v8) >> 6;
  uint64_t v12 = v1 + 56;
  while (1)
  {
    do
    {
      if (v10)
      {
        unint64_t v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v14 = v13 | (v5 << 6);
        goto LABEL_24;
      }
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_38;
      }
      if (v15 >= v11) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v15);
      int64_t v17 = v5 + 1;
      if (v16) {
        goto LABEL_23;
      }
      int64_t v17 = v5 + 2;
      if (v5 + 2 >= v11) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16) {
        goto LABEL_23;
      }
      int64_t v17 = v5 + 3;
      if (v5 + 3 >= v11) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16) {
        goto LABEL_23;
      }
      int64_t v17 = v5 + 4;
      if (v5 + 4 >= v11) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16) {
        goto LABEL_23;
      }
      int64_t v18 = v5 + 5;
      if (v5 + 5 >= v11)
      {
LABEL_36:
        swift_bridgeObjectRetain();
        sub_22DA0D508();
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v18);
      if (!v16)
      {
        while (1)
        {
          int64_t v17 = v18 + 1;
          if (__OFADD__(v18, 1)) {
            break;
          }
          if (v17 >= v11) {
            goto LABEL_36;
          }
          unint64_t v16 = *(void *)(v7 + 8 * v17);
          ++v18;
          if (v16) {
            goto LABEL_23;
          }
        }
LABEL_38:
        __break(1u);
      }
      int64_t v17 = v5 + 5;
LABEL_23:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      int64_t v5 = v17;
LABEL_24:
      int v19 = *(unsigned __int8 *)(v4[6] + v14);
      sub_22DC93908();
      sub_22DC93918();
      uint64_t v20 = sub_22DC93958();
      uint64_t v21 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v22 = v20 & ~v21;
    }
    while (((*(void *)(v12 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0);
    uint64_t v23 = *(void *)(v3 + 48);
    if (v19 == *(unsigned __int8 *)(v23 + v22)) {
      break;
    }
    while (1)
    {
      unint64_t v22 = (v22 + 1) & ~v21;
      if (((*(void *)(v12 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
        break;
      }
      if (v19 == *(unsigned __int8 *)(v23 + v22)) {
        goto LABEL_28;
      }
    }
  }
LABEL_28:
  v37[0] = v4;
  v37[1] = v7;
  void v37[2] = v36;
  v37[3] = v5;
  v37[4] = v10;
  unint64_t v24 = (unint64_t)(63 - v21) >> 6;
  size_t v25 = 8 * v24;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
  if (v24 >= 0x81)
  {
    uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if (!isStackAllocationSafe)
    {
      uint64_t v31 = (void *)swift_slowAlloc();
      memcpy(v31, (const void *)(v3 + 56), v25);
      OUTLINED_FUNCTION_88_3((uint64_t)v31, v32, v33, v34, v37);
      swift_release();
      if (v4) {
        goto LABEL_40;
      }
      sub_22DA0D508();
      OUTLINED_FUNCTION_7();
      goto LABEL_35;
    }
  }
  MEMORY[0x270FA5388](isStackAllocationSafe);
  uint64_t v4 = (uint64_t *)((char *)&v35 - v27);
  memcpy((char *)&v35 - v27, (const void *)(v3 + 56), v25);
  OUTLINED_FUNCTION_88_3((uint64_t)v4, v28, v29, v30, v37);
  swift_release();
  if (!v4)
  {
    sub_22DA0D508();
    goto LABEL_35;
  }
  swift_willThrow();

  __break(1u);
LABEL_40:

  OUTLINED_FUNCTION_7();
  __break(1u);
}

void sub_22DC0C8D0(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  int64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(void *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v37 = a3 + 56;
  while (2)
  {
    uint64_t v34 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          int64_t v10 = v5[3];
          unint64_t v9 = v5[4];
          if (v9)
          {
            uint64_t v11 = (v9 - 1) & v9;
            unint64_t v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_6:
            unint64_t v13 = *(void **)(*(void *)(*v5 + 48) + 8 * v12);
            id v14 = v13;
            goto LABEL_7;
          }
          int64_t v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          int64_t v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            unint64_t v13 = 0;
            uint64_t v11 = 0;
            goto LABEL_7;
          }
          uint64_t v29 = v5[1];
          unint64_t v30 = *(void *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            uint64_t v11 = (v30 - 1) & v30;
            unint64_t v12 = __clz(__rbit64(v30)) + (v27 << 6);
            int64_t v10 = v27;
            goto LABEL_6;
          }
          if (v10 + 2 < v28)
          {
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 2));
            if (v30)
            {
              int64_t v27 = v10 + 2;
              goto LABEL_22;
            }
            if (v10 + 3 >= v28)
            {
              unint64_t v13 = 0;
              uint64_t v11 = 0;
              v10 += 2;
              goto LABEL_7;
            }
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              int64_t v27 = v10 + 3;
              goto LABEL_22;
            }
            int64_t v27 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              unint64_t v13 = 0;
              uint64_t v11 = 0;
              v10 += 3;
LABEL_7:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13) {
                goto LABEL_45;
              }
              goto LABEL_11;
            }
            unint64_t v30 = *(void *)(v29 + 8 * v27);
            if (v30) {
              goto LABEL_22;
            }
            int64_t v27 = v28 - 1;
            int64_t v32 = v10 + 5;
            while (v32 < v28)
            {
              unint64_t v30 = *(void *)(v29 + 8 * v32++);
              if (v30)
              {
                int64_t v27 = v32 - 1;
                goto LABEL_22;
              }
            }
          }
          unint64_t v13 = 0;
          uint64_t v11 = 0;
          int64_t v10 = v27;
          goto LABEL_7;
        }
        if (!sub_22DC93378()
          || (swift_unknownObjectRetain(),
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8),
              swift_dynamicCast(),
              unint64_t v13 = v38,
              swift_unknownObjectRelease(),
              !v38))
        {
LABEL_45:
          swift_retain();
          sub_22DA59678(a1, a2, v34, a3);
          return;
        }
LABEL_11:
        uint64_t v15 = sub_22DC93128();
        uint64_t v16 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v17 = v15 & ~v16;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = 1 << v17;
        if (((1 << v17) & *(void *)(v37 + 8 * (v17 >> 6))) == 0) {
          goto LABEL_18;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AEF9BC8);
        id v20 = *(id *)(*(void *)(a3 + 48) + 8 * v17);
        char v21 = sub_22DC93138();

        if (v21) {
          break;
        }
        uint64_t v22 = ~v16;
        for (unint64_t i = v17 + 1; ; unint64_t i = v24 + 1)
        {
          unint64_t v24 = i & v22;
          if (((*(void *)(v37 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0) {
            break;
          }
          id v25 = *(id *)(*(void *)(a3 + 48) + 8 * v24);
          char v26 = sub_22DC93138();

          if (v26)
          {

            unint64_t v18 = v24 >> 6;
            uint64_t v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_18:

        int64_t v5 = a5;
      }

LABEL_25:
      int64_t v5 = a5;
      uint64_t v31 = a1[v18];
      a1[v18] = v31 & ~v19;
    }
    while ((v19 & v31) == 0);
    uint64_t v8 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v34 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_22DC0CC24(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = result;
  uint64_t v9 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v10 = v9 - 1;
  uint64_t v11 = a3 + 56;
  while (1)
  {
    int64_t v12 = a5[3];
    unint64_t v13 = a5[4];
    if (!v13) {
      break;
    }
    uint64_t v14 = (v13 - 1) & v13;
    unint64_t v15 = __clz(__rbit64(v13)) | (v12 << 6);
LABEL_20:
    int v22 = *(unsigned __int8 *)(*(void *)(*a5 + 48) + v15);
    a5[3] = v12;
    a5[4] = v14;
    sub_22DC93908();
    sub_22DC93918();
    uint64_t result = sub_22DC93958();
    uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    uint64_t v26 = 1 << v24;
    if (((1 << v24) & *(void *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      uint64_t v27 = *(void *)(a3 + 48);
      if (v22 == *(unsigned __int8 *)(v27 + v24))
      {
LABEL_27:
        uint64_t v30 = *(void *)(v8 + 8 * v25);
        *(void *)(v8 + 8 * v25) = v30 & ~v26;
        if ((v26 & v30) != 0)
        {
          if (__OFSUB__(v10--, 1)) {
            goto LABEL_35;
          }
          if (!v10) {
            return MEMORY[0x263F8EE88];
          }
        }
      }
      else
      {
        for (unint64_t i = v24 + 1; ; unint64_t i = v29 + 1)
        {
          unint64_t v29 = i & ~v23;
          if (((*(void *)(v11 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0) {
            break;
          }
          if (v22 == *(unsigned __int8 *)(v27 + v29))
          {
            unint64_t v25 = v29 >> 6;
            uint64_t v26 = 1 << v29;
            goto LABEL_27;
          }
        }
      }
    }
  }
  int64_t v16 = v12 + 1;
  if (!__OFADD__(v12, 1))
  {
    int64_t v17 = (unint64_t)(a5[2] + 64) >> 6;
    int64_t v18 = a5[3];
    if (v16 >= v17) {
      goto LABEL_32;
    }
    uint64_t v19 = a5[1];
    unint64_t v20 = *(void *)(v19 + 8 * v16);
    if (!v20)
    {
      int64_t v18 = v12 + 1;
      if (v12 + 2 >= v17) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v19 + 8 * (v12 + 2));
      if (v20)
      {
        int64_t v16 = v12 + 2;
      }
      else
      {
        int64_t v18 = v12 + 2;
        if (v12 + 3 >= v17) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v19 + 8 * (v12 + 3));
        if (v20)
        {
          int64_t v16 = v12 + 3;
        }
        else
        {
          int64_t v16 = v12 + 4;
          int64_t v18 = v12 + 3;
          if (v12 + 4 >= v17) {
            goto LABEL_32;
          }
          unint64_t v20 = *(void *)(v19 + 8 * v16);
          if (!v20)
          {
            int64_t v21 = v12 + 5;
            while (v21 < v17)
            {
              unint64_t v20 = *(void *)(v19 + 8 * v21++);
              if (v20)
              {
                int64_t v16 = v21 - 1;
                goto LABEL_19;
              }
            }
            int64_t v18 = v17 - 1;
LABEL_32:
            a5[3] = v18;
            a5[4] = 0;
            swift_retain();
            return a6(v8, a2, v10, a3);
          }
        }
      }
    }
LABEL_19:
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
    int64_t v12 = v16;
    goto LABEL_20;
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_22DC0CE84(uint64_t *a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_22DC0B9B4(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26859BFE0);
    sub_22DC935B8();
  }
  return swift_bridgeObjectRetain();
}

void sub_22DC0CF58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22DC92948();
  objc_msgSend(a3, sel_setAccessibilityLabel_, v4);
}

uint64_t sub_22DC0CFB0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22DC0CFE8(uint64_t a1, uint64_t a2)
{
  return sub_22DC0A9D4(a1, a2, v2);
}

uint64_t sub_22DC0CFF0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_22DC0D028()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC10WorkflowUI25WFCollectionNameFieldCell_textField), sel_becomeFirstResponder);
}

uint64_t block_destroy_helper_34()
{
  return swift_release();
}

uint64_t sub_22DC0D050()
{
  return objectdestroy_21Tm();
}

uint64_t sub_22DC0D05C()
{
  return sub_22DC0D148(&qword_26859BFE8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DC039EC);
}

uint64_t sub_22DC0D07C()
{
  return objectdestroy_30Tm();
}

uint64_t sub_22DC0D088()
{
  return sub_22DC0D430(&qword_26859BFE8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, __n128, __n128))sub_22DC046BC);
}

uint64_t sub_22DC0D0A8()
{
  return objectdestroy_33Tm();
}

uint64_t sub_22DC0D0B4(uint64_t a1)
{
  return sub_22DC0D580(a1, &qword_26859BFE8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_22DC04AF8);
}

uint64_t sub_22DC0D0D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22DC0D11C()
{
  return objectdestroy_21Tm();
}

uint64_t sub_22DC0D128()
{
  return sub_22DC0D148(&qword_26859BFE8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DC04048);
}

uint64_t sub_22DC0D148(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_90_3();
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + v6);
  uint64_t v9 = *(void *)(v2 + v8);
  return a2(v5, v2 + v4, v7, v9);
}

uint64_t sub_22DC0D1C4()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

BOOL sub_22DC0D20C(char *a1, uint64_t *a2, char *a3, uint64_t *a4, void *a5)
{
  return sub_22DC090BC(*a1, *a2, *a3, *a4, a5);
}

BOOL sub_22DC0D238(char *a1, void **a2, char *a3, void **a4, void *a5)
{
  return sub_22DC09288(*a1, *a2, *a3, *a4, a5);
}

BOOL sub_22DC0D264(char *a1, void **a2, char *a3, void **a4)
{
  return sub_22DC0D238(a1, a2, a3, a4, *(void **)(v4 + 16));
}

void sub_22DC0D284()
{
  sub_22DC08E78(*(void **)(v0 + 16), *(void **)(v0 + 56));
}

BOOL sub_22DC0D2B0(char *a1, uint64_t *a2, char *a3, uint64_t *a4)
{
  return sub_22DC0D20C(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_22DC0D2D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_24_0(a1, a2, a3);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_76_0();
  v4();
  return v3;
}

uint64_t sub_22DC0D31C()
{
  return objectdestroy_21Tm();
}

uint64_t sub_22DC0D328()
{
  return sub_22DC0D148(&qword_26859C028, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DC03734);
}

uint64_t sub_22DC0D348()
{
  return objectdestroy_30Tm();
}

uint64_t objectdestroy_30Tm()
{
  OUTLINED_FUNCTION_48();
  __swift_instantiateConcreteTypeFromMangledName(v1);
  OUTLINED_FUNCTION_1_0();
  unint64_t v4 = (((*(void *)(v3 + 64)
        + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_19();
  v5();

  OUTLINED_FUNCTION_82_5();
  OUTLINED_FUNCTION_47();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

uint64_t sub_22DC0D410()
{
  return sub_22DC0D430(&qword_26859C028, (uint64_t (*)(uint64_t, uint64_t, uint64_t, __n128, __n128))sub_22DC04458);
}

uint64_t sub_22DC0D430(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, __n128, __n128))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_90_3();
  uint64_t v5 = *(void *)(v2 + 16);
  v7.n128_u64[0] = *(void *)(v2 + v6);
  uint64_t v9 = *(void *)(v2 + v8);
  v10.n128_u64[0] = *(void *)(v2 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
  return a2(v5, v2 + v4, v9, v7, v10);
}

uint64_t sub_22DC0D4B4()
{
  return objectdestroy_33Tm();
}

uint64_t objectdestroy_33Tm()
{
  OUTLINED_FUNCTION_48();
  __swift_instantiateConcreteTypeFromMangledName(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_145_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_19();
  v3();

  OUTLINED_FUNCTION_82_5();
  OUTLINED_FUNCTION_47();
  return MEMORY[0x270FA0238](v4, v5, v6);
}

uint64_t sub_22DC0D560(uint64_t a1)
{
  return sub_22DC0D580(a1, &qword_26859C028, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_22DC0493C);
}

uint64_t sub_22DC0D580(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a3(a1, v11, v3 + v10, v12);
}

uint64_t sub_22DC0D610()
{
  return objectdestroy_21Tm();
}

uint64_t objectdestroy_21Tm()
{
  OUTLINED_FUNCTION_48();
  __swift_instantiateConcreteTypeFromMangledName(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_145_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_19();
  v3();

  OUTLINED_FUNCTION_82_5();
  OUTLINED_FUNCTION_47();
  return MEMORY[0x270FA0238](v4, v5, v6);
}

uint64_t sub_22DC0D6CC()
{
  return sub_22DC0D148(&qword_26859C028, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DC03CA4);
}

uint64_t sub_22DC0D6F0()
{
  uint64_t v1 = OUTLINED_FUNCTION_82();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

id sub_22DC0D728()
{
  return sub_22DC04404(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_22DC0D744(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22DC0D7A0()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_82();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_22DC0D7D8(uint64_t *a1)
{
  sub_22DC09D70(a1, *(void *)(v1 + 16));
}

unint64_t OUTLINED_FUNCTION_34_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D9FBAD4(a2, a3);
}

uint64_t OUTLINED_FUNCTION_44_11()
{
  return sub_22DC8FCA8();
}

uint64_t OUTLINED_FUNCTION_103_3()
{
  sub_22DC0B9B4(v2, v4, v3, *(void *)(v0 + 672), v1);
  return v3;
}

void OUTLINED_FUNCTION_104_2()
{
  unint64_t v2 = *(void **)(v0 - 352);
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_118_3()
{
  return [v1 (SEL)(v0 + 3480)];
}

uint64_t OUTLINED_FUNCTION_120_2()
{
  return sub_22DC92BC8();
}

uint64_t OUTLINED_FUNCTION_121_3()
{
  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_136_1()
{
  return sub_22DC8FCB8();
}

uint64_t OUTLINED_FUNCTION_140_1()
{
  return sub_22DC92948();
}

uint64_t OUTLINED_FUNCTION_144_1()
{
  return *(void *)(v0 + 304);
}

id OUTLINED_FUNCTION_153_0()
{
  return [v1 (SEL)(v0 + 3480)];
}

double OUTLINED_FUNCTION_154_0(CGRect rect)
{
  return CGRectGetMaxY(rect);
}

void sub_22DC0DA40()
{
  qword_2685B4EB8 = 0x4049000000000000;
}

id sub_22DC0DA50(_OWORD *a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform];
  long long v3 = a1[1];
  *(_OWORD *)uint64_t v2 = *a1;
  *((_OWORD *)v2 + 1) = v3;
  *((_OWORD *)v2 + 2) = a1[2];
  objc_msgSend(v1, sel_setNeedsLayout);
  objc_msgSend(v1, sel_layoutIfNeeded);
  return sub_22DC0E7E8();
}

void sub_22DC0DAB0(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon);
  *(void *)(v1 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon) = a1;
}

void sub_22DC0DAC4(void *a1, char a2)
{
  long long v3 = v2;
  id v6 = a1;
  sub_22DC0DAB0((uint64_t)a1);
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = v6;
    objc_msgSend(v8, sel_glyph);
    id v10 = (id)WFSystemImageNameForGlyphCharacter();
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
      uint64_t v14 = v13;

      if (a2)
      {
        uint64_t v15 = sub_22DB11274(v12, v14);
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        id v18 = objc_msgSend(self, sel_clearColor);
        id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v18);

        id v20 = objc_allocWithZone(MEMORY[0x263F85438]);
        uint64_t v21 = v15;
        uint64_t v22 = v17;
      }
      else
      {
        id v23 = objc_msgSend(self, sel_clearColor);
        id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v23);

        id v24 = objc_allocWithZone(MEMORY[0x263F85438]);
        uint64_t v21 = v12;
        uint64_t v22 = v14;
      }
      id v48 = sub_22DBD2E10(v21, v22, v19);

      goto LABEL_9;
    }
  }
  id v48 = v6;
LABEL_9:
  self;
  uint64_t v25 = swift_dynamicCastObjCClass();
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    sub_22DC8FE28();
    id v27 = v48;
    id v28 = objc_msgSend(v26, sel_symbolName);
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

    id v29 = objc_msgSend(v3, sel_traitCollection);
    objc_msgSend(v29, sel_displayScale);

    sub_22DC8FE18();
    double v31 = v30;
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v26, sel_symbolName);
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

    sub_22DC8FE08();
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void **)&v3[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView];
    sub_22DB11770();
    id v38 = objc_msgSend(v26, sel_symbolName);
    uint64_t v39 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v41 = v40;

    id v42 = objc_msgSend(self, sel_systemFontOfSize_weight_, v31, *MEMORY[0x263F81828]);
    id v43 = objc_msgSend(self, sel_configurationWithFont_, v42);

    id v44 = sub_22DC0DF5C(v39, v41, v43);
    objc_msgSend(v37, sel_setImage_, v44);

    CGAffineTransformMakeTranslation(&v49, v34, v36);
    sub_22DC0DA50(&v49);
  }
  else
  {
    id v27 = objc_msgSend(self, sel_loadIcon_size_style_, v48, 0, 40.0, 40.0);
    self;
    id v45 = (id)swift_dynamicCastObjCClass();
    uint64_t v46 = *(void **)&v3[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView];
    if (v45)
    {
      objc_msgSend(v46, sel_setImage_, v27);
    }
    else
    {
      if (v27)
      {
        id v45 = objc_msgSend(v27, sel_imageWithRenderingMode_, 2);
        uint64_t v47 = v45;
      }
      else
      {
        uint64_t v47 = 0;
      }
      OUTLINED_FUNCTION_13((uint64_t)v45, sel_setImage_);
    }
  }
}

id sub_22DC0DF5C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__systemImageNamed_withConfiguration_, v4, a3);

  return v5;
}

id sub_22DC0DFDC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_isSelected) == 1)
  {
    uint64_t v2 = self;
    id v3 = objc_msgSend(v2, sel_systemBlueColor);
    objc_msgSend(v1, sel_setTintColor_, v3);

    id v4 = objc_msgSend(v2, sel_systemBlueColor);
    id v5 = objc_msgSend(v4, sel_colorWithAlphaComponent_, 0.1);
  }
  else
  {
    id v7 = objc_allocWithZone(MEMORY[0x263F825C8]);
    id v8 = sub_22DA89454((uint64_t)sub_22DC0E12C, 0);
    objc_msgSend(v1, sel_setTintColor_, v8);

    id v6 = objc_msgSend(self, sel_clearColor);
    id v5 = v6;
  }
  OUTLINED_FUNCTION_13((uint64_t)v6, sel_setBackgroundColor_);

  return sub_22DC0E7E8();
}

id sub_22DC0E12C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_userInterfaceStyle);
  uint64_t v2 = self;
  if (v1 == (id)2)
  {
    id v3 = objc_msgSend(v2, sel_systemGray2Color);
    id v4 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 1);
    id v5 = objc_msgSend(v3, sel_resolvedColorWithTraitCollection_, v4);

    return v5;
  }
  else
  {
    id v7 = objc_msgSend(v2, sel_systemGrayColor);
    return v7;
  }
}

char *sub_22DC0E210(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_button;
  id v10 = objc_allocWithZone(MEMORY[0x263F824E8]);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_init);
  uint64_t v12 = OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  uint64_t v13 = &v11[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform];
  uint64_t v14 = MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)uint64_t v13 = *MEMORY[0x263F000D0];
  *((_OWORD *)v13 + 1) = v15;
  *((_OWORD *)v13 + 2) = *(_OWORD *)(v14 + 32);
  *(void *)&v11[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon] = 0;
  v11[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_isSelected] = 0;

  v23.receiver = v11;
  v23.super_class = (Class)type metadata accessor for WFIconPickerSymbolCell();
  uint64_t v16 = (char *)objc_msgSendSuper2(&v23, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v17 = *(void **)&v16[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView];
  id v18 = v16;
  OUTLINED_FUNCTION_13((uint64_t)objc_msgSend(v17, sel_setContentMode_, 4), sel_addSubview_);
  id v19 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v19, sel_setCornerRadius_, 14.0);

  id v20 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v20, sel_setCornerCurve_, *MEMORY[0x263F15A20]);

  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_init);
  objc_msgSend(v21, sel_setMinimumPressDuration_, 0.0);
  objc_msgSend(v21, sel_addTarget_action_, v18, sel_handleTap_);
  OUTLINED_FUNCTION_13((uint64_t)objc_msgSend(v21, sel_setDelegate_, v18), sel_addGestureRecognizer_);
  objc_msgSend(v18, sel_setIsAccessibilityElement_, 1);

  return v18;
}

void sub_22DC0E45C(void *a1)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    objc_allocWithZone(MEMORY[0x263F82E30]);
    id v4 = v1;
    id v5 = sub_22DA332D0;
    double v6 = 0.05;
  }
  else
  {
    if (objc_msgSend(a1, sel_state) != (id)3)
    {
      objc_msgSend(v1, sel_frame);
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      objc_msgSend(a1, sel_locationInView_, v1);
      v20.x = v15;
      v20.y = v16;
      v21.origin.x = v8;
      v21.origin.y = v10;
      v21.size.width = v12;
      v21.size.height = v14;
      if (CGRectContainsPoint(v21, v20)) {
        return;
      }
    }
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    objc_allocWithZone(MEMORY[0x263F82E30]);
    id v17 = v1;
    id v5 = sub_22DA332F4;
    double v6 = 0.6;
  }
  id v18 = sub_22DA8938C((uint64_t)v5, v3, v6, 1.0);
  objc_msgSend(v18, sel_startAnimation);
}

id sub_22DC0E674()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for WFIconPickerSymbolCell();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
  long long v2 = *(_OWORD *)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform + 16];
  v4[0] = *(_OWORD *)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform];
  v4[1] = v2;
  v4[2] = *(_OWORD *)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform + 32];
  return objc_msgSend(v1, sel_setTransform_, v4);
}

double sub_22DC0E754()
{
  if (qword_268592398 != -1) {
    swift_once();
  }
  return *(double *)&qword_2685B4EB8;
}

id sub_22DC0E7E8()
{
  id v1 = v0;
  long long v2 = *(void **)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon];
  if (!v2) {
    goto LABEL_14;
  }
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = v2;
    objc_msgSend(v4, sel_glyph);
    id v6 = (id)WFNameForGlyphCharacter();
    if (!v6)
    {
      sub_22DC929E8();
      if (qword_268592270 != -1) {
        swift_once();
      }
      id v7 = (id)qword_268595FA0;
      CGFloat v8 = (void *)sub_22DC92948();
      double v9 = (void *)sub_22DC92948();
      uint64_t v10 = swift_bridgeObjectRelease();
      id v6 = OUTLINED_FUNCTION_50_8(v10, sel_localizedStringForKey_value_table_);
    }
    uint64_t v11 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v13 = v12;

    sub_22DC0ED1C(v11, v13, v1);
    goto LABEL_15;
  }
  self;
  uint64_t v14 = swift_dynamicCastObjCClass();
  if (!v14)
  {
LABEL_14:
    objc_msgSend(v1, sel_setAccessibilityLabel_, 0);
    goto LABEL_15;
  }
  CGFloat v15 = (void *)v14;
  sub_22DC8F418();
  id v16 = v2;
  sub_22DC8F408();
  id v17 = objc_msgSend(v15, sel_bundleIdentifier);
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();

  uint64_t v18 = sub_22DC8F3F8();
  uint64_t v20 = v19;
  swift_release();
  swift_bridgeObjectRelease();
  if (!v20)
  {
    sub_22DC929E8();
    if (qword_268592270 != -1) {
      swift_once();
    }
    id v21 = (id)qword_268595FA0;
    uint64_t v22 = (void *)sub_22DC92948();
    objc_super v23 = (void *)sub_22DC92948();
    uint64_t v24 = swift_bridgeObjectRelease();
    id v25 = OUTLINED_FUNCTION_50_8(v24, sel_localizedStringForKey_value_table_);

    uint64_t v18 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    uint64_t v20 = v26;
  }
  sub_22DC0ED1C(v18, v20, v1);

LABEL_15:
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_isSelected)) {
    uint64_t v27 = *MEMORY[0x263F832A8];
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v27 | *MEMORY[0x263F83260];
  return objc_msgSend(v1, sel_setAccessibilityTraits_, v28);
}

void sub_22DC0EB14()
{
  uint64_t v1 = OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_button;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  uint64_t v3 = &v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_imageViewTransform];
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  _OWORD *v3 = *MEMORY[0x263F000D0];
  v3[1] = v5;
  v3[2] = *(_OWORD *)(v4 + 32);
  *(void *)&v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon] = 0;
  v0[OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_isSelected] = 0;

  sub_22DC93608();
  __break(1u);
}

void sub_22DC0EC18()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10WorkflowUI22WFIconPickerSymbolCell_icon);
}

id sub_22DC0EC68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFIconPickerSymbolCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFIconPickerSymbolCell()
{
  return self;
}

void sub_22DC0ED1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_22DC92948();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAccessibilityLabel_, v4);
}

uint64_t sub_22DC0ED80()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_2685B4A68 == -1)
  {
    if (qword_2685B4A70) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_2685B4A68, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2685B4A70) {
      return _availability_version_check();
    }
  }
  if (qword_2685B4A60 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2685B4A60, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_2685B4A54 > a3) {
    return 1;
  }
  return dword_2685B4A54 >= a3 && dword_2685B4A58 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_2685B4A70;
  if (qword_2685B4A70) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_2685B4A70 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          long long v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            id v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                double v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x230F955D0](v13);
                          if (v14 < 0)
                          {
                            id v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            id v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2685B4A54, &dword_2685B4A58);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                id v16 = v26;
                              }
                              else
                              {
                                id v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL WFShouldRedrawIconForTraitCollectionChange(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 userInterfaceStyle];
  uint64_t v6 = [v3 userInterfaceStyle];
  uint64_t v7 = [v4 accessibilityContrast];

  uint64_t v8 = [v3 accessibilityContrast];
  return v5 != v6 || v7 != v8;
}

void sub_22DC174B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22DC17C90(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 152));
  _Unwind_Resume(a1);
}

Class initHUTriggerActionFlow()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_513);
  }
  Class result = objc_getClass("HUTriggerActionFlow");
  classHUTriggerActionFlow = (uint64_t)result;
  getHUTriggerActionFlowClass = (uint64_t (*)())HUTriggerActionFlowFunction;
  return result;
}

id HUTriggerActionFlowFunction()
{
  return (id)classHUTriggerActionFlow;
}

void *__HomeUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initHUTriggerSummaryViewController()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_513);
  }
  Class result = objc_getClass("HUTriggerSummaryViewController");
  classHUTriggerSummaryViewController = (uint64_t)result;
  getHUTriggerSummaryViewControllerClass = (uint64_t (*)())HUTriggerSummaryViewControllerFunction;
  return result;
}

id HUTriggerSummaryViewControllerFunction()
{
  return (id)classHUTriggerSummaryViewController;
}

Class initHUTriggerBuilderContext()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_513);
  }
  Class result = objc_getClass("HUTriggerBuilderContext");
  classHUTriggerBuilderContext = (uint64_t)result;
  getHUTriggerBuilderContextClass = (uint64_t (*)())HUTriggerBuilderContextFunction;
  return result;
}

id HUTriggerBuilderContextFunction()
{
  return (id)classHUTriggerBuilderContext;
}

Class initHFTriggerBuilder()
{
  if (HomeLibrary_sOnce != -1) {
    dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_508);
  }
  Class result = objc_getClass("HFTriggerBuilder");
  classHFTriggerBuilder = (uint64_t)result;
  getHFTriggerBuilderClass = (uint64_t (*)())HFTriggerBuilderFunction;
  return result;
}

id HFTriggerBuilderFunction()
{
  return (id)classHFTriggerBuilder;
}

void *__HomeLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHFTriggerItem()
{
  if (HomeLibrary_sOnce != -1) {
    dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_508);
  }
  Class result = objc_getClass("HFTriggerItem");
  classHFTriggerItem = (uint64_t)result;
  getHFTriggerItemClass = (uint64_t (*)())HFTriggerItemFunction;
  return result;
}

id HFTriggerItemFunction()
{
  return (id)classHFTriggerItem;
}

uint64_t __WFAutomationsSortForUI_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 trigger];
  uint64_t v8 = [v6 trigger];
  id v9 = *(id *)(a1 + 32);
  unint64_t v10 = [v9 indexOfObject:objc_opt_class()];
  unint64_t v11 = [v9 indexOfObject:objc_opt_class()];

  if (v10 == v11)
  {

    uint64_t v12 = [v5 trigger];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v6 trigger];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v7 = [v5 trigger];
        uint64_t v8 = [v6 trigger];
        uint64_t v15 = [v7 event];
        uint64_t v16 = [v8 event];
        if (!(v15 | v16) || v15 == 1 && v16 == 1)
        {
          unint64_t v17 = [v7 timeOffset];
          unint64_t v18 = [v8 timeOffset];
          uint64_t v19 = -1;
          if (v17 >= v18) {
            uint64_t v19 = 1;
          }
          if (v17 == v18) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = v19;
          }
          goto LABEL_23;
        }
        if (!v15 && v16) {
          goto LABEL_26;
        }
        BOOL v26 = v15 != 0;
        BOOL v28 = v15 == 1 && v16 != 1;
        if (v16) {
          BOOL v26 = v28;
        }
        if (v26)
        {
          uint64_t v20 = 1;
          goto LABEL_23;
        }
        if (v16 == 1 && v15 != 1)
        {
LABEL_26:
          uint64_t v20 = -1;
          goto LABEL_23;
        }
        uint64_t v23 = [MEMORY[0x263EFF8F0] currentCalendar];
        id v29 = [v7 time];
        uint64_t v24 = [v23 dateFromComponents:v29];

        uint64_t v30 = [v8 time];
        double v31 = [v23 dateFromComponents:v30];

        uint64_t v20 = [v24 compare:v31];
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v7 = [v5 trigger];
    uint64_t v8 = [v7 localizedDescriptionWithConfigurationSummary];
    uint64_t v23 = [v6 trigger];
    uint64_t v24 = [v23 localizedDescriptionWithConfigurationSummary];
    uint64_t v20 = [v8 localizedStandardCompare:v24];
    goto LABEL_22;
  }
  uint64_t v21 = -1;
  if (v10 < v11) {
    uint64_t v22 = -1;
  }
  else {
    uint64_t v22 = 1;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v21 = v22;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v21;
  }
LABEL_23:

  return v20;
}

Class initHFTriggerIconFactory()
{
  if (HomeLibrary_sOnce_1772 != -1) {
    dispatch_once(&HomeLibrary_sOnce_1772, &__block_literal_global_232);
  }
  Class result = objc_getClass("HFTriggerIconFactory");
  classHFTriggerIconFactory = (uint64_t)result;
  getHFTriggerIconFactoryClass = (uint64_t (*)())HFTriggerIconFactoryFunction;
  return result;
}

id HFTriggerIconFactoryFunction()
{
  return (id)classHFTriggerIconFactory;
}

void *__HomeLibrary_block_invoke_1775()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_1776 = (uint64_t)result;
  return result;
}

Class initHFTriggerUISummary()
{
  if (HomeLibrary_sOnce_1772 != -1) {
    dispatch_once(&HomeLibrary_sOnce_1772, &__block_literal_global_232);
  }
  Class result = objc_getClass("HFTriggerUISummary");
  classHFTriggerUISummary = (uint64_t)result;
  getHFTriggerUISummaryClass = (uint64_t (*)())HFTriggerUISummaryFunction;
  return result;
}

id HFTriggerUISummaryFunction()
{
  return (id)classHFTriggerUISummary;
}

void sub_22DC2030C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22DC24784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMTAlarmManagerClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MTAlarmManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMTAlarmManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    BOOL v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMTAlarmManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFAlarmTriggerConfigurationViewController.m", 24, @"Unable to find class %s", "MTAlarmManager");

    __break(1u);
  }
}

void __getMTAlarmDataSourceClass_block_invoke(uint64_t a1)
{
  MobileTimerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MTAlarmDataSource");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMTAlarmDataSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    BOOL v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMTAlarmDataSourceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFAlarmTriggerConfigurationViewController.m", 25, @"Unable to find class %s", "MTAlarmDataSource");

    __break(1u);
  }
}

void MobileTimerLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MobileTimerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2649CAC38;
    uint64_t v5 = 0;
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    BOOL v2 = [NSString stringWithUTF8String:"void *MobileTimerLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFAlarmTriggerConfigurationViewController.m", 23, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MobileTimerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileTimerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22DC28144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initTLKImage()
{
  if (TemplateKitLibrary_sOnce != -1) {
    dispatch_once(&TemplateKitLibrary_sOnce, &__block_literal_global_3038);
  }
  Class result = objc_getClass("TLKImage");
  classTLKImage = (uint64_t)result;
  getTLKImageClass = (uint64_t (*)(void))TLKImageFunction;
  return result;
}

id TLKImageFunction()
{
  return (id)classTLKImage;
}

void *__TemplateKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/TemplateKit.framework/TemplateKit", 2);
  TemplateKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initTLKRichText()
{
  if (TemplateKitLibrary_sOnce != -1) {
    dispatch_once(&TemplateKitLibrary_sOnce, &__block_literal_global_3038);
  }
  Class result = objc_getClass("TLKRichText");
  classTLKRichText = (uint64_t)result;
  getTLKRichTextClass = (uint64_t (*)())TLKRichTextFunction;
  return result;
}

id TLKRichTextFunction()
{
  return (id)classTLKRichText;
}

Class initTLKFormattedText()
{
  if (TemplateKitLibrary_sOnce != -1) {
    dispatch_once(&TemplateKitLibrary_sOnce, &__block_literal_global_3038);
  }
  Class result = objc_getClass("TLKFormattedText");
  classTLKFormattedText = (uint64_t)result;
  getTLKFormattedTextClass = (uint64_t (*)())TLKFormattedTextFunction;
  return result;
}

id TLKFormattedTextFunction()
{
  return (id)classTLKFormattedText;
}

void sub_22DC295A4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

Class initSUICProgressEventViewController()
{
  if (SiriUICoreLibrary_sOnce != -1) {
    dispatch_once(&SiriUICoreLibrary_sOnce, &__block_literal_global_3536);
  }
  Class result = objc_getClass("SUICProgressEventViewController");
  classSUICProgressEventViewController = (uint64_t)result;
  getSUICProgressEventViewControllerClass = (uint64_t (*)())SUICProgressEventViewControllerFunction;
  return result;
}

id SUICProgressEventViewControllerFunction()
{
  return (id)classSUICProgressEventViewController;
}

void *__SiriUICoreLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SiriUICore.framework/SiriUICore", 2);
  SiriUICoreLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_22DC2E2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initAPUIActionCardRequest()
{
  if (AppPredictionUILibrary_sOnce != -1) {
    dispatch_once(&AppPredictionUILibrary_sOnce, &__block_literal_global_143);
  }
  Class result = objc_getClass("APUIActionCardRequest");
  classAPUIActionCardRequest = (uint64_t)result;
  getAPUIActionCardRequestClass = (uint64_t (*)())APUIActionCardRequestFunction;
  return result;
}

id APUIActionCardRequestFunction()
{
  return (id)classAPUIActionCardRequest;
}

void *__AppPredictionUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppPredictionUI.framework/AppPredictionUI", 2);
  AppPredictionUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initAPUIActionCardViewConfig()
{
  if (AppPredictionUILibrary_sOnce != -1) {
    dispatch_once(&AppPredictionUILibrary_sOnce, &__block_literal_global_143);
  }
  Class result = objc_getClass("APUIActionCardViewConfig");
  classAPUIActionCardViewConfig = (uint64_t)result;
  getAPUIActionCardViewConfigClass = (uint64_t (*)())APUIActionCardViewConfigFunction;
  return result;
}

id APUIActionCardViewConfigFunction()
{
  return (id)classAPUIActionCardViewConfig;
}

void sub_22DC2F09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initCRKOverlayButton()
{
  if (CardKitLibrary_sOnce != -1) {
    dispatch_once(&CardKitLibrary_sOnce, &__block_literal_global_3954);
  }
  Class result = objc_getClass("CRKOverlayButton");
  classCRKOverlayButton = (uint64_t)result;
  getCRKOverlayButtonClass = (uint64_t (*)())CRKOverlayButtonFunction;
  return result;
}

id CRKOverlayButtonFunction()
{
  return (id)classCRKOverlayButton;
}

void *__CardKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CardKit.framework/CardKit", 2);
  CardKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCRKCardPresentationConfiguration()
{
  if (CardKitLibrary_sOnce != -1) {
    dispatch_once(&CardKitLibrary_sOnce, &__block_literal_global_3954);
  }
  Class result = objc_getClass("CRKCardPresentationConfiguration");
  classCRKCardPresentationConfiguration = (uint64_t)result;
  getCRKCardPresentationConfigurationClass = (uint64_t (*)())CRKCardPresentationConfigurationFunction;
  return result;
}

id CRKCardPresentationConfigurationFunction()
{
  return (id)classCRKCardPresentationConfiguration;
}

Class initCRKCardPresentation()
{
  if (CardKitLibrary_sOnce != -1) {
    dispatch_once(&CardKitLibrary_sOnce, &__block_literal_global_3954);
  }
  Class result = objc_getClass("CRKCardPresentation");
  classCRKCardPresentation = (uint64_t)result;
  getCRKCardPresentationClass = (uint64_t (*)())CRKCardPresentationFunction;
  return result;
}

id CRKCardPresentationFunction()
{
  return (id)classCRKCardPresentation;
}

uint64_t (*initAPUIRegisterCardKitProvidersIfNeeded())()
{
  if (AppPredictionUILibrary_sOnce != -1) {
    dispatch_once(&AppPredictionUILibrary_sOnce, &__block_literal_global_143);
  }
  Class result = (uint64_t (*)())dlsym((void *)AppPredictionUILibrary_sLib, "APUIRegisterCardKitProvidersIfNeeded");
  softLinkAPUIRegisterCardKitProvidersIfNeeded = result;
  if (result)
  {
    return (uint64_t (*)())result();
  }
  return result;
}

uint64_t (*initAPUIRegisterCardServicesIfNeeded())()
{
  if (AppPredictionUILibrary_sOnce != -1) {
    dispatch_once(&AppPredictionUILibrary_sOnce, &__block_literal_global_143);
  }
  Class result = (uint64_t (*)())dlsym((void *)AppPredictionUILibrary_sLib, "APUIRegisterCardServicesIfNeeded");
  softLinkAPUIRegisterCardServicesIfNeeded = result;
  if (result)
  {
    return (uint64_t (*)())result();
  }
  return result;
}

id initCRKCardViewControllerDelegate()
{
  if (CardKitLibrary_sOnce != -1) {
    dispatch_once(&CardKitLibrary_sOnce, &__block_literal_global_3954);
  }
  uint64_t v0 = objc_getProtocol("CRKCardViewControllerDelegate");
  uint64_t v1 = (void *)protocolCRKCardViewControllerDelegate;
  protocolCRKCardViewControllerDelegate = v0;

  getCRKCardViewControllerDelegateProtocol = (uint64_t (*)())CRKCardViewControllerDelegateFunction;
  BOOL v2 = (void *)protocolCRKCardViewControllerDelegate;
  return v2;
}

id CRKCardViewControllerDelegateFunction()
{
  return (id)protocolCRKCardViewControllerDelegate;
}

Class initHUTriggerIconView()
{
  if (HomeUILibrary_sOnce_4666 != -1) {
    dispatch_once(&HomeUILibrary_sOnce_4666, &__block_literal_global_4667);
  }
  Class result = objc_getClass("HUTriggerIconView");
  classHUTriggerIconView = (uint64_t)result;
  getHUTriggerIconViewClass = (uint64_t (*)())HUTriggerIconViewFunction;
  return result;
}

id HUTriggerIconViewFunction()
{
  return (id)classHUTriggerIconView;
}

void *__HomeUILibrary_block_invoke_4671()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib_4673 = (uint64_t)result;
  return result;
}

void WFPresentWorkflowSettingsViewController(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = a1;
  unint64_t v10 = [[WFWorkflowSettingsViewController alloc] initWithWorkflow:v9 database:v8 hideNavigationBar:0];

  if (!v11)
  {
    id v11 = (id)objc_opt_new();
    objc_setAssociatedObject(v10, &WFWorkflowSettingsViewControllerDelegateKey, v11, (void *)1);
  }
  [(WFWorkflowSettingsViewController *)v10 setDelegate:v11];
  [(WFWorkflowSettingsViewController *)v10 setModalPresentationStyle:2];
  [v7 presentViewController:v10 animated:1 completion:0];
}

NSString *UIContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (v5)
  {
    id v8 = (NSString *)v5;
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    unint64_t v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), unint64_t v10 = v6, v11 == NSOrderedAscending))
    {
      uint64_t v12 = v10;

      id v8 = v12;
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

BOOL UIContentSizeCategoryIsEqualToCategory(NSString *a1, NSString *a2)
{
  return UIContentSizeCategoryCompareToCategory(a1, a2) == NSOrderedSame;
}

id UIContentSizeCategoryOneSmallerThanSizeCategory(void *a1)
{
  uint64_t v1 = a1;
  NSComparisonResult v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83400]);
  id v3 = (void *)*MEMORY[0x263F83408];
  if (v2)
  {
    NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83408]);
    id v3 = (void *)*MEMORY[0x263F83410];
    if (v4)
    {
      NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83410]);
      id v3 = (void *)*MEMORY[0x263F83418];
      if (v5)
      {
        NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83418]);
        id v3 = (void *)*MEMORY[0x263F83420];
        if (v6)
        {
          NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83420]);
          id v3 = (void *)*MEMORY[0x263F83430];
          if (v7)
          {
            NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83430]);
            id v3 = (void *)*MEMORY[0x263F83440];
            if (v8)
            {
              NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83440]);
              id v3 = (void *)*MEMORY[0x263F83450];
              if (v9)
              {
                NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83450]);
                id v3 = (void *)*MEMORY[0x263F83468];
                if (v10)
                {
                  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83468]);
                  id v3 = (void *)*MEMORY[0x263F83470];
                  if (v11)
                  {
                    NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83470]);
                    id v3 = (void *)*MEMORY[0x263F83488];
                    if (v12)
                    {
                      NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83488]);
                      id v3 = (void *)*MEMORY[0x263F83458];
                      if (v13)
                      {
                        if (UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x263F83458])) {
                          id v3 = (void *)*MEMORY[0x263F83490];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v14 = v3;

  return v14;
}

double WFRectWithSize()
{
  return *MEMORY[0x263F00148];
}

Class initHFTriggerIconFactory_5003()
{
  if (HomeLibrary_sOnce_5004 != -1) {
    dispatch_once(&HomeLibrary_sOnce_5004, &__block_literal_global_250);
  }
  Class result = objc_getClass("HFTriggerIconFactory");
  classHFTriggerIconFactory_5005 = (uint64_t)result;
  getHFTriggerIconFactoryClass_5001 = (uint64_t (*)())HFTriggerIconFactoryFunction_5007;
  return result;
}

id HFTriggerIconFactoryFunction_5007()
{
  return (id)classHFTriggerIconFactory_5005;
}

void *__HomeLibrary_block_invoke_5009()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_5010 = (uint64_t)result;
  return result;
}

Class initHFTriggerUISummary_5012()
{
  if (HomeLibrary_sOnce_5004 != -1) {
    dispatch_once(&HomeLibrary_sOnce_5004, &__block_literal_global_250);
  }
  Class result = objc_getClass("HFTriggerUISummary");
  classHFTriggerUISummary_5014 = (uint64_t)result;
  getHFTriggerUISummaryClass_5000 = (uint64_t (*)())HFTriggerUISummaryFunction_5016;
  return result;
}

id HFTriggerUISummaryFunction_5016()
{
  return (id)classHFTriggerUISummary_5014;
}

void sub_22DC38388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getDetailDateMaskToStringSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary_5471)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __MobileTimerLibraryCore_block_invoke_5472;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2649CAE90;
    uint64_t v7 = 0;
    MobileTimerLibraryCore_frameworkLibrary_5471 = _sl_dlopen();
  }
  NSComparisonResult v2 = (void *)MobileTimerLibraryCore_frameworkLibrary_5471;
  if (!MobileTimerLibraryCore_frameworkLibrary_5471)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    NSComparisonResult v2 = [NSString stringWithUTF8String:"void * _Nonnull MobileTimerLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFAlarmTableViewCell.m", 22, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  Class result = dlsym(v2, "DetailDateMaskToString");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getDetailDateMaskToStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __MobileTimerLibraryCore_block_invoke_5472()
{
  uint64_t result = _sl_dlopen();
  MobileTimerLibraryCore_frameworkLibrary_5471 = result;
  return result;
}

void sub_22DC387BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTUIAlarmViewClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!MobileTimerUILibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __MobileTimerUILibraryCore_block_invoke;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2649CAE78;
    uint64_t v8 = 0;
    MobileTimerUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerUILibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    NSComparisonResult v4 = [NSString stringWithUTF8String:"void * _Nonnull MobileTimerUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFAlarmTableViewCell.m", 25, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MTUIAlarmView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    NSComparisonResult v5 = [NSString stringWithUTF8String:"Class  _Nonnull getMTUIAlarmViewClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFAlarmTableViewCell.m", 26, @"Unable to find class %s", "MTUIAlarmView");

LABEL_10:
    __break(1u);
  }
  getMTUIAlarmViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileTimerUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileTimerUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22DC39E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC40B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFMessageTriggerConfigurationSenderStringsFromContact(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (WFCNContactIsAuthorizedToAccessContact())
  {
    NSComparisonResult v2 = [v1 contact];
    id v3 = [v2 identifier];

    if (v3)
    {
      NSComparisonResult v4 = [v1 contact];
      NSComparisonResult v5 = [v4 identifier];
      v11[0] = v5;
      long long v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
LABEL_8:

      goto LABEL_9;
    }
  }
  NSComparisonResult v4 = [v1 contact];
  long long v6 = objc_opt_new();
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE070]])
  {
    long long v7 = [v4 phoneNumbers];
    uint64_t v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_8175);
    [v6 addObjectsFromArray:v8];
  }
  if ([v4 isKeyAvailable:*MEMORY[0x263EFDF80]])
  {
    NSComparisonResult v5 = [v4 emailAddresses];
    uint64_t v9 = objc_msgSend(v5, "if_map:", &__block_literal_global_169);
    [v6 addObjectsFromArray:v9];

    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

uint64_t __WFMessageTriggerConfigurationSenderStringsFromContact_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

id __WFMessageTriggerConfigurationSenderStringsFromContact_block_invoke(uint64_t a1, void *a2)
{
  NSComparisonResult v2 = [a2 value];
  id v3 = [v2 unformattedInternationalStringValue];

  return v3;
}

void sub_22DC48228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v22 - 176));
  _Unwind_Resume(a1);
}

NSString *WFUIContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  long long v6 = a2;
  long long v7 = a3;
  if (v5)
  {
    uint64_t v8 = (NSString *)v5;
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    NSComparisonResult v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), NSComparisonResult v10 = v6, v11 == NSOrderedAscending))
    {
      NSComparisonResult v12 = v10;

      uint64_t v8 = v12;
    }
  }
  else
  {
    uint64_t v8 = v6;
  }

  return v8;
}

double WFFloatCeilForScale(double a1, double a2)
{
  return ceil(a1 * a2) / a2;
}

double WFFloatFloorForScale(double a1, double a2)
{
  return floor(a1 * a2) / a2;
}

double WFSizeCeilForScale(double a1, double a2, double a3)
{
  return ceil(a1 * a3) / a3;
}

double WFSizeScaleSizeToFill(double a1, double a2, double a3, double a4)
{
  return fmax(a1 / a3, a2 / a4);
}

BOOL WFSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 >= a3;
}

double WFSizeCeiling(double a1)
{
  return ceil(a1);
}

double WFSizeScaled(double a1, double a2, double a3)
{
  return a1 * a3;
}

double WFSizeScaledToFill(double a1, double a2, double a3, double a4)
{
  return a3 * fmax(a1 / a3, a2 / a4);
}

void sub_22DC4EF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC4F978(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

Class initPHAsset()
{
  if (PhotosLibrary_sOnce != -1) {
    dispatch_once(&PhotosLibrary_sOnce, &__block_literal_global_9846);
  }
  Class result = objc_getClass("PHAsset");
  classPHAsset = (uint64_t)result;
  getPHAssetClass = (uint64_t (*)())PHAssetFunction;
  return result;
}

id PHAssetFunction()
{
  return (id)classPHAsset;
}

void *__PhotosLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  PhotosLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_22DC515C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22DC5664C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC566B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC56718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC567D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC568D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC56958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC569D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC56A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC56A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC56B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5724C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC572B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC573B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC57484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5756C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC575DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC576DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5779C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC579A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC57BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC57D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC57DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC580BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC58448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC58638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_22DC586D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC587D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC58A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC58B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC58CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC59010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC592EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_22DC593C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC59580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5999C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31)
{
  objc_destroyWeak(v34);
  objc_destroyWeak((id *)(v37 - 112));

  _Unwind_Resume(a1);
}

void sub_22DC59D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC59E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC59F84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);

  _Unwind_Resume(a1);
}

void sub_22DC5A04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5A710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  _Unwind_Resume(a1);
}

void sub_22DC5A978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  NSComparisonResult v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22DC5AA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22DC5AB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22DC5ABB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22DC5AFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

void sub_22DC5B7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *location, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a14);

  objc_destroyWeak(a13);
  objc_destroyWeak(a12);

  objc_destroyWeak(a11);
  objc_destroyWeak(a10);

  _Unwind_Resume(a1);
}

void sub_22DC5BBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5BC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5BD88(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_22DC5BE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C1D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5C984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5CD3C(_Unwind_Exception *a1)
{
  NSComparisonResult v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22DC5CEE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5D1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5D8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL WFUIBarButtonItemsEqualToItems(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count])
  {
    uint64_t v11 = 0;
    NSComparisonResult v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = ___ZL30WFUIBarButtonItemsEqualToItemsP7NSArrayIP15UIBarButtonItemES3__block_invoke;
    v8[3] = &unk_2649CB4F8;
    id v9 = v4;
    NSComparisonResult v10 = &v11;
    [v3 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_22DC5DBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZL30WFUIBarButtonItemsEqualToItemsP7NSArrayIP15UIBarButtonItemES3__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___ZL30WFUIBarButtonItemsEqualToItemsP7NSArrayIP15UIBarButtonItemES3__block_invoke_2;
  _OWORD v7[3] = &unk_2649CB4F8;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_22DC5DC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void ___ZL30WFUIBarButtonItemsEqualToItemsP7NSArrayIP15UIBarButtonItemES3__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(id *)(a1 + 32);
  id v18 = v6;
  if (v7 == v18)
  {

    goto LABEL_15;
  }
  id v8 = [v7 target];
  uint64_t v9 = [v18 target];
  if (![v8 isEqual:v9]) {
    goto LABEL_13;
  }
  uint64_t v10 = [v7 action];
  if (v10 != [v18 action]) {
    goto LABEL_13;
  }
  int v11 = [v7 isEnabled];
  if (v11 != [v18 isEnabled]) {
    goto LABEL_13;
  }
  NSComparisonResult v12 = [v7 title];
  uint64_t v13 = [v18 title];
  id v14 = v12;
  id v15 = v13;
  if (v14 == v15)
  {

    goto LABEL_15;
  }
  uint64_t v16 = v15;
  if (!v14 || !v15)
  {

LABEL_13:
    goto LABEL_14;
  }
  char v17 = [v14 isEqualToString:v15];

  if ((v17 & 1) == 0)
  {
LABEL_14:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_15:
}

void sub_22DC5DE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5E62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5EA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5EC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5ECE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5ED74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5EDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5EE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5EFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F26C(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  if (v3) {
  _Unwind_Resume(a1);
  }
}

void sub_22DC5F3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5F730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5FB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5FBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC5FF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC60068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC6013C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC602CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC60500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC60680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC60C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_22DC60F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)WFComposeViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_22DC61420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC61524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22DC618C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC629C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SleepLibrary();
  Class result = dlsym(v2, "HKSPSleepLaunchURLRouteOnboardSleepCoaching");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *SleepLibrary()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SleepLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    _OWORD v4[3] = __SleepLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2649CB518;
    uint64_t v6 = 0;
    SleepLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)SleepLibraryCore_frameworkLibrary;
  if (!SleepLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    int v3 = [NSString stringWithUTF8String:"void *SleepLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFSleepTriggerConfigurationViewController.m", 24, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getHKSPProvenanceSourceShortcutsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SleepLibrary();
  Class result = dlsym(v2, "HKSPProvenanceSourceShortcuts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKSPProvenanceSourceShortcutsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHKSPSleepURLSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SleepLibrary();
  Class result = dlsym(v2, "HKSPSleepURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKSPSleepURLSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SleepLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SleepLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22DC6310C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_22DC654C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22DC65918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_22DC65CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22DC65DB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22DC66020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id WFFooterTextForHomeAction(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 workflow];
  if ([v4 environment] == 1
    || ([v3 homesToWhichWeCanAddHomeAutomations],
        long long v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = WFLocalizedString(@"This action will not work when this device is away from your home’s network because you don’t have a home hub set up.");
    uint64_t v9 = WFLocalizedString(@"Set up home hub…");
    uint64_t v10 = [NSString stringWithFormat:@"%@ %@", v8, v9];
    uint64_t v11 = [v10 rangeOfString:v9];
    uint64_t v13 = v12;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v10];
    uint64_t v14 = *MEMORY[0x263F81520];
    uint64_t v15 = [NSURL URLWithString:*MEMORY[0x263F874A8]];
    objc_msgSend(v7, "addAttribute:value:range:", v14, v15, v11, v13);
  }
  return v7;
}

void sub_22DC6D570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFAddConstraintsToFillAnchorProvider(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  v27[4] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a1;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v26 = [v12 topAnchor];
  uint64_t v25 = [v11 topAnchor];
  uint64_t v24 = [v26 constraintEqualToAnchor:v25 constant:a3];
  v27[0] = v24;
  uint64_t v13 = [v12 bottomAnchor];
  uint64_t v14 = [v11 bottomAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:-a5];
  v27[1] = v15;
  uint64_t v16 = [v12 leadingAnchor];
  char v17 = [v11 leadingAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17 constant:a4];
  v27[2] = v18;
  uint64_t v19 = [v12 trailingAnchor];

  uint64_t v20 = [v11 trailingAnchor];

  uint64_t v21 = [v19 constraintEqualToAnchor:v20 constant:-a6];
  v27[3] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];

  [MEMORY[0x263F08938] activateConstraints:v22];
  return v22;
}

void sub_22DC6DC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC6DCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC6DEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22DC6E0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_22DC6E1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)WFTriggerComposeViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t WFRunSelectionForTrigger(void *a1)
{
  id v1 = a1;
  if ([v1 isEnabled]) {
    uint64_t v2 = [v1 shouldPrompt];
  }
  else {
    uint64_t v2 = 2;
  }

  return v2;
}

void _BTSessionEvent(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1;
  if (!(a3 | a2))
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    uint64_t v6 = 0;
    BTLocalDeviceGetDefault();
    BTSessionDetachWithQueue();
    [a4 finishWithDevices:v5];
  }
}

void sub_22DC74EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WFCurrentBundle();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1) {
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global_14605);
  }
  uint64_t v0 = (void *)WFCurrentBundle_bundle;
  return v0;
}

void __WFCurrentBundle_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v4, 0, sizeof(v4));
  if (dladdr(WFCurrentBundle, &v4) && v4.dli_fname)
  {
    uint64_t v0 = [objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v4.dli_fname isDirectory:0 relativeToURL:0];
    id v1 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithURL:v1];
    id v3 = (void *)WFCurrentBundle_bundle;
    WFCurrentBundle_bundle = v2;
  }
  else
  {
    uint64_t v0 = getWFGeneralLogObject();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = "WFCurrentBundle_block_invoke";
      _os_log_impl(&dword_22D994000, v0, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

id WFLocalizedStringWithKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = WFCurrentBundle();
  uint64_t v6 = [v5 localizedStringForKey:v4 value:v3 table:0];

  return v6;
}

id WFLocalizedPluralString(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = NSString;
    id v3 = [v1 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    id v4 = [v2 stringWithFormat:@"%@ (Pluralization)", v3];

    id v5 = WFCurrentBundle();
    id v6 = [v5 localizedStringForKey:v4 value:v1 table:0];
  }
  else
  {
    id v6 = v1;
  }

  return v6;
}

void sub_22DC770D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void HomeLibrary()
{
  if (!HomeLibraryCore())
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    id v1 = [NSString stringWithUTF8String:"void *HomeLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WFAutomationTriggerDataSource.m", 21, @"%s", 0);

    __break(1u);
    free(v2);
  }
}

void __getHFTriggerItemClass_block_invoke(uint64_t a1)
{
  HomeLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HFTriggerItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHFTriggerItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getHFTriggerItemClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFAutomationTriggerDataSource.m", 23, @"Unable to find class %s", "HFTriggerItem");

    __break(1u);
  }
}

id getHFTriggerUISummaryClass_15127()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getHFTriggerUISummaryClass_softClass;
  uint64_t v6 = getHFTriggerUISummaryClass_softClass;
  if (!getHFTriggerUISummaryClass_softClass)
  {
    HomeLibraryCore();
    _OWORD v4[3] = (uint64_t)objc_getClass("HFTriggerUISummary");
    getHFTriggerUISummaryClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_22DC77480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHFTriggerUISummaryClass_block_invoke(uint64_t a1)
{
  HomeLibraryCore();
  Class result = objc_getClass("HFTriggerUISummary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHFTriggerUISummaryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HomeLibraryCore()
{
  if (!HomeLibraryCore_frameworkLibrary) {
    HomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return HomeLibraryCore_frameworkLibrary;
}

uint64_t __HomeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HomeLibraryCore_frameworkLibrary = result;
  return result;
}

Class initHUTriggerIconView_15771()
{
  if (HomeUILibrary_sOnce_15772 != -1) {
    dispatch_once(&HomeUILibrary_sOnce_15772, &__block_literal_global_15773);
  }
  Class result = objc_getClass("HUTriggerIconView");
  classHUTriggerIconView_15775 = (uint64_t)result;
  getHUTriggerIconViewClass_15768 = (uint64_t (*)())HUTriggerIconViewFunction_15777;
  return result;
}

id HUTriggerIconViewFunction_15777()
{
  return (id)classHUTriggerIconView_15775;
}

void *__HomeUILibrary_block_invoke_15780()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib_15781 = (uint64_t)result;
  return result;
}

void sub_22DC7CAD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_22DC7CC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22DC7D420(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

BOOL WFIsRunningOniPad()
{
  uint64_t v0 = [MEMORY[0x263F82670] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

void sub_22DC7FA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC7FB94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id WFAutomationTableSectionHeaderViewWithTitle(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83618] addingSymbolicTraits:2 options:0];
  uint64_t v5 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];
  [v3 setFont:v5];

  [v3 setText:v1];
  [v2 addSubview:v3];
  id v6 = (id)objc_msgSend(v3, "wf_addConstraintsToFillSuperview:insets:", v2, 18.0, 0.0, 12.0, 0.0);

  return v2;
}

void sub_22DC81EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC82A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC82EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC834C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22DC83B98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_22DC840DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initHUTriggerTypePickerViewController()
{
  if (HomeUILibrary_sOnce_16822 != -1) {
    dispatch_once(&HomeUILibrary_sOnce_16822, &__block_literal_global_406);
  }
  Class result = objc_getClass("HUTriggerTypePickerViewController");
  classHUTriggerTypePickerViewController = (uint64_t)result;
  getHUTriggerTypePickerViewControllerClass = (uint64_t (*)())HUTriggerTypePickerViewControllerFunction;
  return result;
}

id HUTriggerTypePickerViewControllerFunction()
{
  return (id)classHUTriggerTypePickerViewController;
}

void *__HomeUILibrary_block_invoke_16824()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib_16825 = (uint64_t)result;
  return result;
}

Class initHFHomeKitDispatcher()
{
  if (HomeLibrary_sOnce_16826 != -1) {
    dispatch_once(&HomeLibrary_sOnce_16826, &__block_literal_global_402);
  }
  Class result = objc_getClass("HFHomeKitDispatcher");
  classHFHomeKitDispatcher = (uint64_t)result;
  getHFHomeKitDispatcherClass = (uint64_t (*)())HFHomeKitDispatcherFunction;
  return result;
}

id HFHomeKitDispatcherFunction()
{
  return (id)classHFHomeKitDispatcher;
}

void *__HomeLibrary_block_invoke_16828()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib_16830 = (uint64_t)result;
  return result;
}

void sub_22DC85634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPKIconForMerchantCategorySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = PassKitUILibrary();
  Class result = dlsym(v2, "PKIconForMerchantCategory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKIconForMerchantCategorySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *PassKitUILibrary()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    _OWORD v4[3] = __PassKitUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2649CBED8;
    uint64_t v6 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)PassKitUILibraryCore_frameworkLibrary;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *PassKitUILibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFWalletTransactionTriggerConfigurationViewController.m", 36, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PassKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t WFAutocapitalizationTypeFromLocalizedString(void *a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = [a1 integerValue];
  uint64_t v2 = 1;
  if (v1 == 1) {
    uint64_t v2 = 2;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t WFAutocapitalizationTypeFromLocale()
{
  uint64_t v0 = WFLocalizedStringWithKey(@"Auto-capitalization for Shortcut Name", @"2");
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 integerValue];
    uint64_t v3 = 1;
    if (v2 == 1) {
      uint64_t v3 = 2;
    }
    if (v2) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

void sub_22DC8A25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22DC8AB00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18375(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18376(uint64_t a1)
{
}

id WFScaledImage(void *a1)
{
  id v1 = a1;
  v5.width = 29.0;
  v5.height = 29.0;
  UIGraphicsBeginImageContextWithOptions(v5, 0, 0.0);
  objc_msgSend(v1, "drawInRect:", 0.0, 0.0, 29.0, 29.0);

  uint64_t v2 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v2;
}

void sub_22DC8E0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPaymentTransactionIconGeneratorClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!PassKitUILibraryCore_frameworkLibrary_19254)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __PassKitUILibraryCore_block_invoke_19255;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_2649CC0D8;
    uint64_t v8 = 0;
    PassKitUILibraryCore_frameworkLibrary_19254 = _sl_dlopen();
  }
  if (!PassKitUILibraryCore_frameworkLibrary_19254)
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *PassKitUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFWalletMerchantSelectionTableViewController.m", 22, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PKPaymentTransactionIconGenerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    CGSize v5 = [NSString stringWithUTF8String:"Class getPKPaymentTransactionIconGeneratorClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFWalletMerchantSelectionTableViewController.m", 23, @"Unable to find class %s", "PKPaymentTransactionIconGenerator");

LABEL_10:
    __break(1u);
  }
  getPKPaymentTransactionIconGeneratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUILibraryCore_block_invoke_19255()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore_frameworkLibrary_19254 = result;
  return result;
}

uint64_t sub_22DC8EE68()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_22DC8EE78()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_22DC8EE88()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_22DC8EE98()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_22DC8EEA8()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_22DC8EEB8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22DC8EEC8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_22DC8EED8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22DC8EEE8()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_22DC8EEF8()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_22DC8EF08()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22DC8EF18()
{
  return MEMORY[0x270EEEE90]();
}

uint64_t sub_22DC8EF28()
{
  return MEMORY[0x270EEEE98]();
}

uint64_t sub_22DC8EF38()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_22DC8EF48()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_22DC8EF58()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_22DC8EF68()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_22DC8EF78()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_22DC8EF88()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_22DC8EF98()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_22DC8EFA8()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_22DC8F018()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22DC8F028()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22DC8F038()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_22DC8F048()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_22DC8F058()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22DC8F068()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22DC8F078()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_22DC8F088()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_22DC8F098()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22DC8F0A8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22DC8F0B8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22DC8F0C8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_22DC8F0D8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22DC8F0E8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22DC8F0F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22DC8F108()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22DC8F118()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22DC8F128()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_22DC8F138()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22DC8F148()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_22DC8F158()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_22DC8F168()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_22DC8F178()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22DC8F188()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22DC8F198()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_22DC8F1A8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_22DC8F1B8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_22DC8F1C8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22DC8F1D8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22DC8F1E8()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_22DC8F1F8()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_22DC8F208()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_22DC8F218()
{
  return MEMORY[0x270EF1308]();
}

uint64_t sub_22DC8F228()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_22DC8F238()
{
  return MEMORY[0x270EF13B8]();
}

uint64_t sub_22DC8F248()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22DC8F258()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22DC8F268()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_22DC8F278()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22DC8F288()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_22DC8F298()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_22DC8F2A8()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_22DC8F2B8()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_22DC8F2C8()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_22DC8F2D8()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_22DC8F2E8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_22DC8F2F8()
{
  return MEMORY[0x270EF1788]();
}

uint64_t sub_22DC8F308()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_22DC8F318()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_22DC8F328()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_22DC8F338()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_22DC8F348()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_22DC8F358()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_22DC8F368()
{
  return MEMORY[0x270F85B00]();
}

uint64_t sub_22DC8F378()
{
  return MEMORY[0x270F85B10]();
}

uint64_t sub_22DC8F388()
{
  return MEMORY[0x270F85B18]();
}

uint64_t sub_22DC8F398()
{
  return MEMORY[0x270F85B20]();
}

uint64_t sub_22DC8F3A8()
{
  return MEMORY[0x270F85B28]();
}

uint64_t sub_22DC8F3B8()
{
  return MEMORY[0x270F85B30]();
}

uint64_t sub_22DC8F3C8()
{
  return MEMORY[0x270F85B48]();
}

uint64_t sub_22DC8F3D8()
{
  return MEMORY[0x270F85B60]();
}

uint64_t sub_22DC8F3E8()
{
  return MEMORY[0x270F85B70]();
}

uint64_t sub_22DC8F3F8()
{
  return MEMORY[0x270F85B78]();
}

uint64_t sub_22DC8F408()
{
  return MEMORY[0x270F85B80]();
}

uint64_t sub_22DC8F418()
{
  return MEMORY[0x270F85B88]();
}

uint64_t sub_22DC8F428()
{
  return MEMORY[0x270F85B90]();
}

uint64_t sub_22DC8F438()
{
  return MEMORY[0x270F85BE0]();
}

uint64_t sub_22DC8F448()
{
  return MEMORY[0x270F85BF8]();
}

uint64_t sub_22DC8F458()
{
  return MEMORY[0x270F85C00]();
}

uint64_t sub_22DC8F468()
{
  return MEMORY[0x270F85C08]();
}

uint64_t sub_22DC8F478()
{
  return MEMORY[0x270F85C18]();
}

uint64_t sub_22DC8F488()
{
  return MEMORY[0x270F85C20]();
}

uint64_t sub_22DC8F498()
{
  return MEMORY[0x270F85C28]();
}

uint64_t sub_22DC8F4A8()
{
  return MEMORY[0x270F85C30]();
}

uint64_t sub_22DC8F4B8()
{
  return MEMORY[0x270F85C38]();
}

uint64_t sub_22DC8F4C8()
{
  return MEMORY[0x270F85C40]();
}

uint64_t sub_22DC8F4D8()
{
  return MEMORY[0x270F85C48]();
}

uint64_t sub_22DC8F4E8()
{
  return MEMORY[0x270F85C50]();
}

uint64_t sub_22DC8F4F8()
{
  return MEMORY[0x270F85C58]();
}

uint64_t sub_22DC8F508()
{
  return MEMORY[0x270F85C60]();
}

uint64_t sub_22DC8F518()
{
  return MEMORY[0x270F85C68]();
}

uint64_t sub_22DC8F528()
{
  return MEMORY[0x270F85C70]();
}

uint64_t sub_22DC8F538()
{
  return MEMORY[0x270F85C78]();
}

uint64_t sub_22DC8F548()
{
  return MEMORY[0x270F85C80]();
}

uint64_t sub_22DC8F558()
{
  return MEMORY[0x270F85C88]();
}

uint64_t sub_22DC8F568()
{
  return MEMORY[0x270F85D38]();
}

uint64_t sub_22DC8F578()
{
  return MEMORY[0x270F85D40]();
}

uint64_t sub_22DC8F588()
{
  return MEMORY[0x270F85D48]();
}

uint64_t sub_22DC8F598()
{
  return MEMORY[0x270F85E20]();
}

uint64_t sub_22DC8F5A8()
{
  return MEMORY[0x270F85E28]();
}

uint64_t sub_22DC8F5B8()
{
  return MEMORY[0x270F85E30]();
}

uint64_t sub_22DC8F5C8()
{
  return MEMORY[0x270F85E48]();
}

uint64_t sub_22DC8F5D8()
{
  return MEMORY[0x270F85E50]();
}

uint64_t sub_22DC8F5F8()
{
  return MEMORY[0x270F85E68]();
}

uint64_t sub_22DC8F608()
{
  return MEMORY[0x270F85E90]();
}

uint64_t sub_22DC8F618()
{
  return MEMORY[0x270F85E98]();
}

uint64_t sub_22DC8F628()
{
  return MEMORY[0x270F85EA0]();
}

uint64_t sub_22DC8F638()
{
  return MEMORY[0x270F85EA8]();
}

uint64_t sub_22DC8F648()
{
  return MEMORY[0x270F85EB0]();
}

uint64_t sub_22DC8F658()
{
  return MEMORY[0x270F85EC0]();
}

uint64_t sub_22DC8F668()
{
  return MEMORY[0x270F85EC8]();
}

uint64_t sub_22DC8F678()
{
  return MEMORY[0x270F85ED0]();
}

uint64_t sub_22DC8F688()
{
  return MEMORY[0x270F85ED8]();
}

uint64_t sub_22DC8F698()
{
  return MEMORY[0x270F85EE0]();
}

uint64_t sub_22DC8F6A8()
{
  return MEMORY[0x270F85EE8]();
}

uint64_t sub_22DC8F6B8()
{
  return MEMORY[0x270F85EF0]();
}

uint64_t sub_22DC8F6C8()
{
  return MEMORY[0x270F85EF8]();
}

uint64_t sub_22DC8F6D8()
{
  return MEMORY[0x270F85F00]();
}

uint64_t sub_22DC8F6E8()
{
  return MEMORY[0x270F85F08]();
}

uint64_t sub_22DC8F6F8()
{
  return MEMORY[0x270F85F10]();
}

uint64_t sub_22DC8F708()
{
  return MEMORY[0x270F85F18]();
}

uint64_t sub_22DC8F738()
{
  return MEMORY[0x270F85F80]();
}

uint64_t sub_22DC8F748()
{
  return MEMORY[0x270F85F88]();
}

uint64_t sub_22DC8F758()
{
  return MEMORY[0x270F85F90]();
}

uint64_t sub_22DC8F768()
{
  return MEMORY[0x270F85FE0]();
}

uint64_t sub_22DC8F778()
{
  return MEMORY[0x270F85FE8]();
}

uint64_t sub_22DC8F788()
{
  return MEMORY[0x270F85FF0]();
}

uint64_t sub_22DC8F798()
{
  return MEMORY[0x270F85FF8]();
}

uint64_t sub_22DC8F7A8()
{
  return MEMORY[0x270F86000]();
}

uint64_t sub_22DC8F7B8()
{
  return MEMORY[0x270F86008]();
}

uint64_t sub_22DC8F7C8()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_22DC8F7D8()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_22DC8F7E8()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_22DC8F7F8()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_22DC8F808()
{
  return MEMORY[0x270F85918]();
}

uint64_t sub_22DC8F818()
{
  return MEMORY[0x270F85920]();
}

uint64_t sub_22DC8F828()
{
  return MEMORY[0x270F85928]();
}

uint64_t sub_22DC8F838()
{
  return MEMORY[0x270F85930]();
}

uint64_t sub_22DC8F848()
{
  return MEMORY[0x270F85938]();
}

uint64_t sub_22DC8F858()
{
  return MEMORY[0x270F85940]();
}

uint64_t sub_22DC8F868()
{
  return MEMORY[0x270F85948]();
}

uint64_t sub_22DC8F878()
{
  return MEMORY[0x270F85950]();
}

uint64_t sub_22DC8F888()
{
  return MEMORY[0x270F85958]();
}

uint64_t sub_22DC8F898()
{
  return MEMORY[0x270F85960]();
}

uint64_t sub_22DC8F8A8()
{
  return MEMORY[0x270F85968]();
}

uint64_t sub_22DC8F8B8()
{
  return MEMORY[0x270F85970]();
}

uint64_t sub_22DC8F8C8()
{
  return MEMORY[0x270F85978]();
}

uint64_t sub_22DC8F8D8()
{
  return MEMORY[0x270F85980]();
}

uint64_t sub_22DC8F8E8()
{
  return MEMORY[0x270F85988]();
}

uint64_t sub_22DC8F8F8()
{
  return MEMORY[0x270F85990]();
}

uint64_t sub_22DC8F908()
{
  return MEMORY[0x270F85998]();
}

uint64_t sub_22DC8F918()
{
  return MEMORY[0x270F859A0]();
}

uint64_t sub_22DC8F928()
{
  return MEMORY[0x270F859A8]();
}

uint64_t sub_22DC8F938()
{
  return MEMORY[0x270F859B0]();
}

uint64_t sub_22DC8F948()
{
  return MEMORY[0x270F859B8]();
}

uint64_t sub_22DC8F958()
{
  return MEMORY[0x270F859C0]();
}

uint64_t sub_22DC8F968()
{
  return MEMORY[0x270F859C8]();
}

uint64_t sub_22DC8F978()
{
  return MEMORY[0x270F859D0]();
}

uint64_t sub_22DC8F988()
{
  return MEMORY[0x270F859D8]();
}

uint64_t sub_22DC8F998()
{
  return MEMORY[0x270F859E0]();
}

uint64_t sub_22DC8F9A8()
{
  return MEMORY[0x270F859E8]();
}

uint64_t sub_22DC8F9B8()
{
  return MEMORY[0x270F859F0]();
}

uint64_t sub_22DC8F9C8()
{
  return MEMORY[0x270F859F8]();
}

uint64_t sub_22DC8F9D8()
{
  return MEMORY[0x270F85A30]();
}

uint64_t sub_22DC8F9E8()
{
  return MEMORY[0x270F85A38]();
}

uint64_t sub_22DC8F9F8()
{
  return MEMORY[0x270F85A40]();
}

uint64_t sub_22DC8FA08()
{
  return MEMORY[0x270F85A48]();
}

uint64_t sub_22DC8FA18()
{
  return MEMORY[0x270F85A50]();
}

uint64_t sub_22DC8FA28()
{
  return MEMORY[0x270F85A60]();
}

uint64_t sub_22DC8FA38()
{
  return MEMORY[0x270F85A68]();
}

uint64_t sub_22DC8FA48()
{
  return MEMORY[0x270F85A70]();
}

uint64_t sub_22DC8FA58()
{
  return MEMORY[0x270F85A78]();
}

uint64_t sub_22DC8FA68()
{
  return MEMORY[0x270F85A80]();
}

uint64_t sub_22DC8FA78()
{
  return MEMORY[0x270F85A90]();
}

uint64_t sub_22DC8FA88()
{
  return MEMORY[0x270F85A98]();
}

uint64_t sub_22DC8FA98()
{
  return MEMORY[0x270F85AA0]();
}

uint64_t sub_22DC8FAA8()
{
  return MEMORY[0x270F85AA8]();
}

uint64_t sub_22DC8FAB8()
{
  return MEMORY[0x270F85AB0]();
}

uint64_t sub_22DC8FAC8()
{
  return MEMORY[0x270F85AB8]();
}

uint64_t sub_22DC8FAD8()
{
  return MEMORY[0x270F85AC0]();
}

uint64_t sub_22DC8FAE8()
{
  return MEMORY[0x270F85AC8]();
}

uint64_t sub_22DC8FAF8()
{
  return MEMORY[0x270F85AD0]();
}

uint64_t sub_22DC8FB08()
{
  return MEMORY[0x270F85AD8]();
}

uint64_t sub_22DC8FB18()
{
  return MEMORY[0x270F85AE0]();
}

uint64_t sub_22DC8FB28()
{
  return MEMORY[0x270F85AE8]();
}

uint64_t sub_22DC8FB38()
{
  return MEMORY[0x270F86310]();
}

uint64_t sub_22DC8FB48()
{
  return MEMORY[0x270F86318]();
}

uint64_t sub_22DC8FB58()
{
  return MEMORY[0x270F86320]();
}

uint64_t sub_22DC8FB68()
{
  return MEMORY[0x270F86328]();
}

uint64_t sub_22DC8FB78()
{
  return MEMORY[0x270F86330]();
}

uint64_t sub_22DC8FB88()
{
  return MEMORY[0x270F86338]();
}

uint64_t sub_22DC8FB98()
{
  return MEMORY[0x270F86340]();
}

uint64_t sub_22DC8FBA8()
{
  return MEMORY[0x270F86348]();
}

uint64_t sub_22DC8FBB8()
{
  return MEMORY[0x270F86350]();
}

uint64_t sub_22DC8FBC8()
{
  return MEMORY[0x270F86358]();
}

uint64_t sub_22DC8FBD8()
{
  return MEMORY[0x270F86380]();
}

uint64_t sub_22DC8FBE8()
{
  return MEMORY[0x270F86388]();
}

uint64_t sub_22DC8FBF8()
{
  return MEMORY[0x270F863D0]();
}

uint64_t sub_22DC8FC08()
{
  return MEMORY[0x270F863D8]();
}

uint64_t sub_22DC8FC18()
{
  return MEMORY[0x270F863E0]();
}

uint64_t sub_22DC8FC28()
{
  return MEMORY[0x270F863E8]();
}

uint64_t sub_22DC8FC38()
{
  return MEMORY[0x270F863F0]();
}

uint64_t sub_22DC8FC48()
{
  return MEMORY[0x270F86400]();
}

uint64_t sub_22DC8FC58()
{
  return MEMORY[0x270F86408]();
}

uint64_t sub_22DC8FC68()
{
  return MEMORY[0x270F86410]();
}

uint64_t sub_22DC8FC78()
{
  return MEMORY[0x270F86418]();
}

uint64_t sub_22DC8FC88()
{
  return MEMORY[0x270F86420]();
}

uint64_t sub_22DC8FC98()
{
  return MEMORY[0x270F86428]();
}

uint64_t sub_22DC8FCA8()
{
  return MEMORY[0x270F86430]();
}

uint64_t sub_22DC8FCB8()
{
  return MEMORY[0x270F86438]();
}

uint64_t sub_22DC8FCC8()
{
  return MEMORY[0x270F86448]();
}

uint64_t sub_22DC8FCD8()
{
  return MEMORY[0x270F86450]();
}

uint64_t sub_22DC8FCE8()
{
  return MEMORY[0x270F86458]();
}

uint64_t sub_22DC8FCF8()
{
  return MEMORY[0x270F86460]();
}

uint64_t sub_22DC8FD08()
{
  return MEMORY[0x270F86478]();
}

uint64_t sub_22DC8FD18()
{
  return MEMORY[0x270F86480]();
}

uint64_t sub_22DC8FD28()
{
  return MEMORY[0x270F86488]();
}

uint64_t sub_22DC8FD38()
{
  return MEMORY[0x270F86490]();
}

uint64_t sub_22DC8FD48()
{
  return MEMORY[0x270F86498]();
}

uint64_t sub_22DC8FD58()
{
  return MEMORY[0x270F864C0]();
}

uint64_t sub_22DC8FD68()
{
  return MEMORY[0x270F864D0]();
}

uint64_t sub_22DC8FD78()
{
  return MEMORY[0x270F864D8]();
}

uint64_t sub_22DC8FD88()
{
  return MEMORY[0x270F864F8]();
}

uint64_t sub_22DC8FD98()
{
  return MEMORY[0x270F86500]();
}

uint64_t sub_22DC8FDA8()
{
  return MEMORY[0x270F86508]();
}

uint64_t sub_22DC8FDB8()
{
  return MEMORY[0x270F86610]();
}

uint64_t sub_22DC8FDC8()
{
  return MEMORY[0x270F86650]();
}

uint64_t sub_22DC8FDD8()
{
  return MEMORY[0x270F86658]();
}

uint64_t sub_22DC8FDE8()
{
  return MEMORY[0x270F86660]();
}

uint64_t sub_22DC8FDF8()
{
  return MEMORY[0x270F86668]();
}

uint64_t sub_22DC8FE08()
{
  return MEMORY[0x270F86828]();
}

uint64_t sub_22DC8FE18()
{
  return MEMORY[0x270F86830]();
}

uint64_t sub_22DC8FE28()
{
  return MEMORY[0x270F86838]();
}

uint64_t sub_22DC8FE38()
{
  return MEMORY[0x270F86840]();
}

uint64_t sub_22DC8FE48()
{
  return MEMORY[0x270F86848]();
}

uint64_t sub_22DC8FE58()
{
  return MEMORY[0x270F86850]();
}

uint64_t sub_22DC8FE68()
{
  return MEMORY[0x270F86858]();
}

uint64_t sub_22DC8FE78()
{
  return MEMORY[0x270F86860]();
}

uint64_t sub_22DC8FE88()
{
  return MEMORY[0x270F86870]();
}

uint64_t sub_22DC8FE98()
{
  return MEMORY[0x270F86878]();
}

uint64_t sub_22DC8FEA8()
{
  return MEMORY[0x270F86880]();
}

uint64_t sub_22DC8FEB8()
{
  return MEMORY[0x270F86888]();
}

uint64_t sub_22DC8FEC8()
{
  return MEMORY[0x270F86890]();
}

uint64_t sub_22DC8FED8()
{
  return MEMORY[0x270F868A0]();
}

uint64_t sub_22DC8FEE8()
{
  return MEMORY[0x270F868B8]();
}

uint64_t sub_22DC8FEF8()
{
  return MEMORY[0x270F868C0]();
}

uint64_t sub_22DC8FF08()
{
  return MEMORY[0x270F868C8]();
}

uint64_t sub_22DC8FF18()
{
  return MEMORY[0x270F868D0]();
}

uint64_t sub_22DC8FF28()
{
  return MEMORY[0x270F868E8]();
}

uint64_t sub_22DC8FF38()
{
  return MEMORY[0x270F868F0]();
}

uint64_t sub_22DC8FF48()
{
  return MEMORY[0x270F868F8]();
}

uint64_t sub_22DC8FF58()
{
  return MEMORY[0x270F86900]();
}

uint64_t sub_22DC8FF68()
{
  return MEMORY[0x270F86930]();
}

uint64_t sub_22DC8FF78()
{
  return MEMORY[0x270F86940]();
}

uint64_t sub_22DC8FF88()
{
  return MEMORY[0x270F86948]();
}

uint64_t sub_22DC8FF98()
{
  return MEMORY[0x270F86950]();
}

uint64_t sub_22DC8FFA8()
{
  return MEMORY[0x270F86958]();
}

uint64_t sub_22DC8FFB8()
{
  return MEMORY[0x270F86960]();
}

uint64_t sub_22DC8FFC8()
{
  return MEMORY[0x270F86968]();
}

uint64_t sub_22DC8FFD8()
{
  return MEMORY[0x270F86970]();
}

uint64_t sub_22DC8FFE8()
{
  return MEMORY[0x270F86978]();
}

uint64_t sub_22DC8FFF8()
{
  return MEMORY[0x270F86980]();
}

uint64_t sub_22DC90008()
{
  return MEMORY[0x270F86988]();
}

uint64_t sub_22DC90018()
{
  return MEMORY[0x270F86990]();
}

uint64_t sub_22DC90028()
{
  return MEMORY[0x270F86998]();
}

uint64_t sub_22DC90038()
{
  return MEMORY[0x270F869A0]();
}

uint64_t sub_22DC90048()
{
  return MEMORY[0x270F869A8]();
}

uint64_t sub_22DC90058()
{
  return MEMORY[0x270F869B0]();
}

uint64_t sub_22DC90068()
{
  return MEMORY[0x270F869B8]();
}

uint64_t sub_22DC90078()
{
  return MEMORY[0x270F869C0]();
}

uint64_t sub_22DC90088()
{
  return MEMORY[0x270F869C8]();
}

uint64_t sub_22DC90098()
{
  return MEMORY[0x270F869D0]();
}

uint64_t sub_22DC900A8()
{
  return MEMORY[0x270F869D8]();
}

uint64_t sub_22DC900B8()
{
  return MEMORY[0x270F869E0]();
}

uint64_t sub_22DC900C8()
{
  return MEMORY[0x270F869E8]();
}

uint64_t sub_22DC900D8()
{
  return MEMORY[0x270F869F0]();
}

uint64_t sub_22DC900E8()
{
  return MEMORY[0x270F869F8]();
}

uint64_t sub_22DC900F8()
{
  return MEMORY[0x270F86A00]();
}

uint64_t sub_22DC90108()
{
  return MEMORY[0x270F86A08]();
}

uint64_t sub_22DC90118()
{
  return MEMORY[0x270F86A10]();
}

uint64_t sub_22DC90128()
{
  return MEMORY[0x270F86A18]();
}

uint64_t sub_22DC90138()
{
  return MEMORY[0x270F86A20]();
}

uint64_t sub_22DC90148()
{
  return MEMORY[0x270F86A28]();
}

uint64_t sub_22DC90158()
{
  return MEMORY[0x270F86A30]();
}

uint64_t sub_22DC90168()
{
  return MEMORY[0x270F86A38]();
}

uint64_t sub_22DC90178()
{
  return MEMORY[0x270F86A40]();
}

uint64_t sub_22DC90188()
{
  return MEMORY[0x270F86A48]();
}

uint64_t sub_22DC90198()
{
  return MEMORY[0x270F86A50]();
}

uint64_t sub_22DC901A8()
{
  return MEMORY[0x270F86A58]();
}

uint64_t sub_22DC901B8()
{
  return MEMORY[0x270F845D8]();
}

uint64_t sub_22DC901C8()
{
  return MEMORY[0x270F845E0]();
}

uint64_t sub_22DC901D8()
{
  return MEMORY[0x270F845E8]();
}

uint64_t sub_22DC901E8()
{
  return MEMORY[0x270F845F0]();
}

uint64_t sub_22DC901F8()
{
  return MEMORY[0x270F845F8]();
}

uint64_t sub_22DC90208()
{
  return MEMORY[0x270F84600]();
}

uint64_t sub_22DC90218()
{
  return MEMORY[0x270F84608]();
}

uint64_t sub_22DC90228()
{
  return MEMORY[0x270F847B0]();
}

uint64_t sub_22DC90238()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_22DC90248()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_22DC90258()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22DC90278()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_22DC90288()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_22DC90298()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_22DC902A8()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_22DC902B8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_22DC902C8()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_22DC902D8()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_22DC902E8()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_22DC902F8()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_22DC90308()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_22DC90318()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22DC90328()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22DC90348()
{
  return MEMORY[0x270F81778]();
}

uint64_t sub_22DC90358()
{
  return MEMORY[0x270F819F0]();
}

uint64_t sub_22DC90368()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_22DC90378()
{
  return MEMORY[0x270F81BB0]();
}

uint64_t sub_22DC90388()
{
  return MEMORY[0x270F81C48]();
}

uint64_t sub_22DC90398()
{
  return MEMORY[0x270F81C58]();
}

uint64_t sub_22DC903A8()
{
  return MEMORY[0x270F81C60]();
}

uint64_t sub_22DC903B8()
{
  return MEMORY[0x270F81C68]();
}

uint64_t sub_22DC903C8()
{
  return MEMORY[0x270F81C78]();
}

uint64_t sub_22DC903D8()
{
  return MEMORY[0x270F81C80]();
}

uint64_t sub_22DC903E8()
{
  return MEMORY[0x270F81CC0]();
}

uint64_t sub_22DC903F8()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_22DC90408()
{
  return MEMORY[0x270F81D00]();
}

uint64_t sub_22DC90418()
{
  return MEMORY[0x270F81D10]();
}

uint64_t sub_22DC90428()
{
  return MEMORY[0x270F81D20]();
}

uint64_t sub_22DC90438()
{
  return MEMORY[0x270F81D40]();
}

uint64_t sub_22DC90448()
{
  return MEMORY[0x270F81DC8]();
}

uint64_t sub_22DC90458()
{
  return MEMORY[0x270F81DF0]();
}

uint64_t sub_22DC90468()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_22DC90478()
{
  return MEMORY[0x270F81EC0]();
}

uint64_t sub_22DC90488()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_22DC90498()
{
  return MEMORY[0x270F81F60]();
}

uint64_t sub_22DC904A8()
{
  return MEMORY[0x270F81F90]();
}

uint64_t sub_22DC904B8()
{
  return MEMORY[0x270F81FB0]();
}

uint64_t sub_22DC904C8()
{
  return MEMORY[0x270F81FE0]();
}

uint64_t sub_22DC904D8()
{
  return MEMORY[0x270F82028]();
}

uint64_t sub_22DC904E8()
{
  return MEMORY[0x270F82058]();
}

uint64_t sub_22DC904F8()
{
  return MEMORY[0x270F820A0]();
}

uint64_t sub_22DC90508()
{
  return MEMORY[0x270F820B0]();
}

uint64_t sub_22DC90518()
{
  return MEMORY[0x270F820B8]();
}

uint64_t sub_22DC90528()
{
  return MEMORY[0x270F820D8]();
}

uint64_t sub_22DC90538()
{
  return MEMORY[0x270F82270]();
}

uint64_t sub_22DC90548()
{
  return MEMORY[0x270F82280]();
}

uint64_t sub_22DC90558()
{
  return MEMORY[0x270F82298]();
}

uint64_t sub_22DC90568()
{
  return MEMORY[0x270F822A0]();
}

uint64_t sub_22DC90578()
{
  return MEMORY[0x270F822A8]();
}

uint64_t sub_22DC90588()
{
  return MEMORY[0x270F822D0]();
}

uint64_t sub_22DC90598()
{
  return MEMORY[0x270F822D8]();
}

uint64_t sub_22DC905A8()
{
  return MEMORY[0x270F822F0]();
}

uint64_t sub_22DC905B8()
{
  return MEMORY[0x270F82310]();
}

uint64_t sub_22DC905C8()
{
  return MEMORY[0x270F82320]();
}

uint64_t sub_22DC905D8()
{
  return MEMORY[0x270F82328]();
}

uint64_t sub_22DC905E8()
{
  return MEMORY[0x270F82330]();
}

uint64_t sub_22DC905F8()
{
  return MEMORY[0x270F82348]();
}

uint64_t sub_22DC90608()
{
  return MEMORY[0x270F82360]();
}

uint64_t sub_22DC90618()
{
  return MEMORY[0x270F82378]();
}

uint64_t sub_22DC90628()
{
  return MEMORY[0x270F82380]();
}

uint64_t sub_22DC90638()
{
  return MEMORY[0x270F82390]();
}

uint64_t sub_22DC90648()
{
  return MEMORY[0x270F82398]();
}

uint64_t sub_22DC90658()
{
  return MEMORY[0x270F82410]();
}

uint64_t sub_22DC90668()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_22DC90678()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_22DC90688()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_22DC90698()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_22DC906A8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_22DC906B8()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_22DC906C8()
{
  return MEMORY[0x270EE3C18]();
}

uint64_t sub_22DC906D8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22DC906E8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_22DC906F8()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_22DC90708()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_22DC90718()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_22DC90728()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22DC90738()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_22DC90748()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_22DC90758()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_22DC90768()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22DC90778()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22DC90788()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22DC90798()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_22DC907A8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_22DC907B8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_22DC907C8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_22DC907D8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_22DC907E8()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_22DC907F8()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_22DC90808()
{
  return MEMORY[0x270EFECB0]();
}

uint64_t sub_22DC90818()
{
  return MEMORY[0x270EFECE8]();
}

uint64_t sub_22DC90828()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_22DC90838()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_22DC90848()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_22DC90858()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_22DC90868()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_22DC90878()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_22DC90888()
{
  return MEMORY[0x270EFEE80]();
}

uint64_t sub_22DC90898()
{
  return MEMORY[0x270EFEE88]();
}

uint64_t sub_22DC908A8()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_22DC908B8()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_22DC908C8()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_22DC908D8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_22DC908E8()
{
  return MEMORY[0x270EFF080]();
}

uint64_t sub_22DC908F8()
{
  return MEMORY[0x270EFF090]();
}

uint64_t sub_22DC90908()
{
  return MEMORY[0x270EFF098]();
}

uint64_t sub_22DC90918()
{
  return MEMORY[0x270EFF0B0]();
}

uint64_t sub_22DC90928()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_22DC90938()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_22DC90948()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_22DC90958()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_22DC90968()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_22DC90978()
{
  return MEMORY[0x270EFF3C8]();
}

uint64_t sub_22DC90988()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_22DC90998()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_22DC909A8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_22DC909B8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_22DC909C8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_22DC909D8()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_22DC909E8()
{
  return MEMORY[0x270EFF610]();
}

uint64_t sub_22DC909F8()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_22DC90A08()
{
  return MEMORY[0x270EFF628]();
}

uint64_t sub_22DC90A18()
{
  return MEMORY[0x270EFF630]();
}

uint64_t sub_22DC90A28()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_22DC90A38()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_22DC90A48()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_22DC90A58()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_22DC90A68()
{
  return MEMORY[0x270EFF710]();
}

uint64_t sub_22DC90A78()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_22DC90A88()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_22DC90A98()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_22DC90AA8()
{
  return MEMORY[0x270EFF808]();
}

uint64_t sub_22DC90AB8()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_22DC90AC8()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_22DC90AD8()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_22DC90AE8()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_22DC90AF8()
{
  return MEMORY[0x270EFF8E0]();
}

uint64_t sub_22DC90B08()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_22DC90B18()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_22DC90B28()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_22DC90B48()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_22DC90B58()
{
  return MEMORY[0x270EFFAF0]();
}

uint64_t sub_22DC90B68()
{
  return MEMORY[0x270EFFB38]();
}

uint64_t sub_22DC90B78()
{
  return MEMORY[0x270EFFB50]();
}

uint64_t sub_22DC90B88()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_22DC90B98()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_22DC90BA8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22DC90BB8()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_22DC90BC8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_22DC90BD8()
{
  return MEMORY[0x270EFFCB0]();
}

uint64_t sub_22DC90BE8()
{
  return MEMORY[0x270EFFCD8]();
}

uint64_t sub_22DC90BF8()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_22DC90C08()
{
  return MEMORY[0x270EFFD20]();
}

uint64_t sub_22DC90C18()
{
  return MEMORY[0x270EFFD28]();
}

uint64_t sub_22DC90C28()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_22DC90C38()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_22DC90C48()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_22DC90C58()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_22DC90C68()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_22DC90C78()
{
  return MEMORY[0x270F00068]();
}

uint64_t sub_22DC90C88()
{
  return MEMORY[0x270F00070]();
}

uint64_t sub_22DC90C98()
{
  return MEMORY[0x270F000C0]();
}

uint64_t sub_22DC90CA8()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_22DC90CB8()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_22DC90CC8()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_22DC90CD8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_22DC90CE8()
{
  return MEMORY[0x270F001B8]();
}

uint64_t sub_22DC90CF8()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_22DC90D08()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_22DC90D18()
{
  return MEMORY[0x270F00228]();
}

uint64_t sub_22DC90D28()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_22DC90D38()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_22DC90D48()
{
  return MEMORY[0x270F003B8]();
}

uint64_t sub_22DC90D58()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_22DC90D68()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_22DC90D78()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_22DC90D88()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_22DC90D98()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_22DC90DA8()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_22DC90DB8()
{
  return MEMORY[0x270F00560]();
}

uint64_t sub_22DC90DC8()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_22DC90DD8()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_22DC90DE8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_22DC90DF8()
{
  return MEMORY[0x270F005D0]();
}

uint64_t sub_22DC90E08()
{
  return MEMORY[0x270F005D8]();
}

uint64_t sub_22DC90E18()
{
  return MEMORY[0x270F005E0]();
}

uint64_t sub_22DC90E28()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_22DC90E38()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_22DC90E48()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_22DC90E58()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_22DC90E68()
{
  return MEMORY[0x270F00728]();
}

uint64_t sub_22DC90E78()
{
  return MEMORY[0x270F00738]();
}

uint64_t sub_22DC90E88()
{
  return MEMORY[0x270F007F0]();
}

uint64_t sub_22DC90E98()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_22DC90EA8()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_22DC90EB8()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_22DC90EC8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_22DC90ED8()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_22DC90EE8()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_22DC90EF8()
{
  return MEMORY[0x270F86678]();
}

uint64_t sub_22DC90F08()
{
  return MEMORY[0x270F86680]();
}

uint64_t sub_22DC90F18()
{
  return MEMORY[0x270F86698]();
}

uint64_t sub_22DC90F28()
{
  return MEMORY[0x270F866A0]();
}

uint64_t sub_22DC90F38()
{
  return MEMORY[0x270F866A8]();
}

uint64_t sub_22DC90F48()
{
  return MEMORY[0x270F866B0]();
}

uint64_t sub_22DC90F58()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_22DC90F68()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_22DC90F78()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_22DC90F88()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_22DC90F98()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_22DC90FA8()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_22DC90FB8()
{
  return MEMORY[0x270F86A60]();
}

uint64_t sub_22DC90FC8()
{
  return MEMORY[0x270F86A68]();
}

uint64_t sub_22DC90FD8()
{
  return MEMORY[0x270F86A70]();
}

uint64_t sub_22DC90FE8()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_22DC90FF8()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_22DC91008()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_22DC91018()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_22DC91028()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_22DC91038()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_22DC91048()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_22DC91058()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_22DC91068()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_22DC91078()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_22DC91088()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_22DC91098()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_22DC910A8()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_22DC910B8()
{
  return MEMORY[0x270F00E28]();
}

uint64_t sub_22DC910C8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_22DC910D8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_22DC910E8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_22DC910F8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_22DC91108()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_22DC91118()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_22DC91128()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_22DC91138()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_22DC91148()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_22DC91158()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_22DC91168()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_22DC91178()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_22DC91188()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22DC91198()
{
  return MEMORY[0x270F01180]();
}

uint64_t sub_22DC911A8()
{
  return MEMORY[0x270F01188]();
}

uint64_t sub_22DC911B8()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_22DC911C8()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_22DC911D8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22DC911E8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_22DC911F8()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_22DC91208()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_22DC91218()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_22DC91228()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_22DC91238()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_22DC91248()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_22DC91258()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_22DC91268()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_22DC91278()
{
  return MEMORY[0x270F01570]();
}

uint64_t sub_22DC91288()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_22DC91298()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_22DC912A8()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_22DC912B8()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_22DC912C8()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_22DC912D8()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_22DC912E8()
{
  return MEMORY[0x270F01668]();
}

uint64_t sub_22DC912F8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_22DC91308()
{
  return MEMORY[0x270F016C8]();
}

uint64_t sub_22DC91318()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_22DC91328()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_22DC91338()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_22DC91358()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_22DC91368()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_22DC91378()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_22DC91388()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_22DC91398()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_22DC913A8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_22DC913C8()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_22DC913D8()
{
  return MEMORY[0x270F017C8]();
}

uint64_t sub_22DC913E8()
{
  return MEMORY[0x270F017D0]();
}

uint64_t sub_22DC913F8()
{
  return MEMORY[0x270F017D8]();
}

uint64_t sub_22DC91418()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22DC91428()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_22DC91438()
{
  return MEMORY[0x270F01838]();
}

uint64_t sub_22DC91448()
{
  return MEMORY[0x270F01878]();
}

uint64_t sub_22DC91458()
{
  return MEMORY[0x270F01880]();
}

uint64_t sub_22DC91468()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_22DC91478()
{
  return MEMORY[0x270F01938]();
}

uint64_t sub_22DC91488()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_22DC91498()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_22DC914A8()
{
  return MEMORY[0x270F01A00]();
}

uint64_t sub_22DC914B8()
{
  return MEMORY[0x270F01A20]();
}

uint64_t sub_22DC914C8()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_22DC914D8()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_22DC914E8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_22DC914F8()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_22DC91508()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_22DC91518()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_22DC91528()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_22DC91538()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_22DC91548()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_22DC91558()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_22DC91568()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_22DC91578()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_22DC91588()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_22DC91598()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_22DC915A8()
{
  return MEMORY[0x270F01E48]();
}

uint64_t sub_22DC915B8()
{
  return MEMORY[0x270F01E58]();
}

uint64_t sub_22DC915C8()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_22DC915D8()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_22DC915E8()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_22DC915F8()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_22DC91608()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_22DC91618()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_22DC91628()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_22DC91638()
{
  return MEMORY[0x270F02198]();
}

uint64_t sub_22DC91648()
{
  return MEMORY[0x270F021A0]();
}

uint64_t sub_22DC91658()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_22DC91668()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_22DC91678()
{
  return MEMORY[0x270F021F0]();
}

uint64_t sub_22DC91688()
{
  return MEMORY[0x270F021F8]();
}

uint64_t sub_22DC91698()
{
  return MEMORY[0x270F02208]();
}

uint64_t sub_22DC916A8()
{
  return MEMORY[0x270F02210]();
}

uint64_t sub_22DC916B8()
{
  return MEMORY[0x270F02218]();
}

uint64_t sub_22DC916C8()
{
  return MEMORY[0x270F02288]();
}

uint64_t sub_22DC916D8()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_22DC916E8()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_22DC916F8()
{
  return MEMORY[0x270F02318]();
}

uint64_t sub_22DC91708()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_22DC91718()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_22DC91728()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_22DC91738()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_22DC91748()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_22DC91758()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_22DC91768()
{
  return MEMORY[0x270F02510]();
}

uint64_t sub_22DC91778()
{
  return MEMORY[0x270F02528]();
}

uint64_t sub_22DC91788()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_22DC91798()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_22DC917A8()
{
  return MEMORY[0x270F02630]();
}

uint64_t sub_22DC917B8()
{
  return MEMORY[0x270F02650]();
}

uint64_t sub_22DC917C8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_22DC917D8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_22DC917E8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_22DC91808()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_22DC91818()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_22DC91828()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_22DC91848()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_22DC91858()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_22DC91868()
{
  return MEMORY[0x270F027D8]();
}

uint64_t sub_22DC91878()
{
  return MEMORY[0x270F027E0]();
}

uint64_t sub_22DC91888()
{
  return MEMORY[0x270F027E8]();
}

uint64_t sub_22DC91898()
{
  return MEMORY[0x270F027F0]();
}

uint64_t sub_22DC918A8()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_22DC918B8()
{
  return MEMORY[0x270F02890]();
}

uint64_t sub_22DC918C8()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_22DC918D8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_22DC918E8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_22DC918F8()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_22DC91908()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_22DC91918()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_22DC91928()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22DC91938()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_22DC91948()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_22DC91958()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_22DC91968()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_22DC91978()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_22DC91988()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_22DC91998()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_22DC919A8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_22DC919B8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_22DC919C8()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_22DC919D8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_22DC919E8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_22DC919F8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_22DC91A08()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_22DC91A18()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_22DC91A28()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_22DC91A38()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_22DC91A48()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_22DC91A58()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_22DC91A68()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_22DC91A78()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_22DC91A88()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_22DC91A98()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_22DC91AA8()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_22DC91AB8()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_22DC91AC8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_22DC91AD8()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_22DC91AE8()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_22DC91AF8()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_22DC91B08()
{
  return MEMORY[0x270F02DC0]();
}

uint64_t sub_22DC91B18()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_22DC91B28()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_22DC91B38()
{
  return MEMORY[0x270F02E10]();
}

uint64_t sub_22DC91B48()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_22DC91B58()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22DC91B68()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_22DC91B78()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_22DC91B88()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_22DC91B98()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22DC91BA8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_22DC91BB8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22DC91BC8()
{
  return MEMORY[0x270F85AF0]();
}

uint64_t sub_22DC91BD8()
{
  return MEMORY[0x270F86728]();
}

uint64_t sub_22DC91BE8()
{
  return MEMORY[0x270F86730]();
}

uint64_t sub_22DC91BF8()
{
  return MEMORY[0x270F86750]();
}

uint64_t sub_22DC91C08()
{
  return MEMORY[0x270F86768]();
}

uint64_t sub_22DC91C18()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_22DC91C28()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22DC91C38()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22DC91C48()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_22DC91C58()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_22DC91C68()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_22DC91C78()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_22DC91C88()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_22DC91C98()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_22DC91CA8()
{
  return MEMORY[0x270F034B0]();
}

uint64_t sub_22DC91CB8()
{
  return MEMORY[0x270F034C8]();
}

uint64_t sub_22DC91CC8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_22DC91CD8()
{
  return MEMORY[0x270F03508]();
}

uint64_t sub_22DC91CE8()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_22DC91CF8()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_22DC91D08()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_22DC91D18()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_22DC91D28()
{
  return MEMORY[0x270F036A8]();
}

uint64_t sub_22DC91D38()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22DC91D48()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_22DC91D58()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_22DC91D68()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_22DC91D78()
{
  return MEMORY[0x270F03908]();
}

uint64_t sub_22DC91D88()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_22DC91D98()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_22DC91DA8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_22DC91DB8()
{
  return MEMORY[0x270F039D0]();
}

uint64_t sub_22DC91DC8()
{
  return MEMORY[0x270F03A50]();
}

uint64_t sub_22DC91DD8()
{
  return MEMORY[0x270F03A60]();
}

uint64_t sub_22DC91DE8()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_22DC91DF8()
{
  return MEMORY[0x270F03AC0]();
}

uint64_t sub_22DC91E08()
{
  return MEMORY[0x270F03AF0]();
}

uint64_t sub_22DC91E18()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_22DC91E28()
{
  return MEMORY[0x270F03B50]();
}

uint64_t sub_22DC91E38()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_22DC91E48()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_22DC91E58()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_22DC91E68()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_22DC91E78()
{
  return MEMORY[0x270F03CD8]();
}

uint64_t sub_22DC91E88()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_22DC91E98()
{
  return MEMORY[0x270F03D58]();
}

uint64_t sub_22DC91EA8()
{
  return MEMORY[0x270F03E10]();
}

uint64_t sub_22DC91EB8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_22DC91EC8()
{
  return MEMORY[0x270F03F10]();
}

uint64_t sub_22DC91ED8()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_22DC91EE8()
{
  return MEMORY[0x270F03F70]();
}

uint64_t sub_22DC91EF8()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_22DC91F08()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_22DC91F18()
{
  return MEMORY[0x270F04080]();
}

uint64_t sub_22DC91F28()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_22DC91F38()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_22DC91F48()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_22DC91F58()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_22DC91F68()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_22DC91F78()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_22DC91F88()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_22DC91F98()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_22DC91FA8()
{
  return MEMORY[0x270F041C8]();
}

uint64_t sub_22DC91FB8()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_22DC91FC8()
{
  return MEMORY[0x270F86770]();
}

uint64_t sub_22DC91FD8()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_22DC91FE8()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_22DC91FF8()
{
  return MEMORY[0x270F042F8]();
}

uint64_t sub_22DC92008()
{
  return MEMORY[0x270F04310]();
}

uint64_t sub_22DC92018()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_22DC92028()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_22DC92038()
{
  return MEMORY[0x270F04368]();
}

uint64_t sub_22DC92048()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_22DC92058()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_22DC92068()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_22DC92078()
{
  return MEMORY[0x270F86A80]();
}

uint64_t sub_22DC92088()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_22DC92098()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_22DC920A8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_22DC920B8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_22DC920C8()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_22DC920D8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_22DC920E8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_22DC920F8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_22DC92108()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22DC92118()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_22DC92128()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_22DC92138()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22DC92148()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_22DC92158()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_22DC92168()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_22DC92178()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_22DC92188()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_22DC92198()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_22DC921A8()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_22DC921B8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_22DC921C8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_22DC921D8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_22DC921E8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_22DC921F8()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_22DC92208()
{
  return MEMORY[0x270F86A90]();
}

uint64_t sub_22DC92218()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22DC92228()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22DC92238()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_22DC92248()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_22DC92258()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_22DC92268()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_22DC92278()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_22DC92288()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22DC92298()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_22DC922A8()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_22DC922B8()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_22DC922C8()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_22DC922D8()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_22DC922E8()
{
  return MEMORY[0x270F04A48]();
}

uint64_t sub_22DC922F8()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_22DC92308()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_22DC92318()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_22DC92328()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_22DC92338()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_22DC92348()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22DC92358()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22DC92368()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_22DC92378()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_22DC92388()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_22DC92398()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_22DC923A8()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_22DC923B8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_22DC923C8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_22DC923D8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22DC923E8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_22DC923F8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_22DC92408()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_22DC92418()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_22DC92428()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_22DC92438()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_22DC92448()
{
  return MEMORY[0x270F04DD8]();
}

uint64_t sub_22DC92458()
{
  return MEMORY[0x270F04DE8]();
}

uint64_t sub_22DC92468()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_22DC92478()
{
  return MEMORY[0x270F04E00]();
}

uint64_t sub_22DC92498()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_22DC924A8()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_22DC924B8()
{
  return MEMORY[0x270F04E98]();
}

uint64_t sub_22DC924C8()
{
  return MEMORY[0x270F86AA0]();
}

uint64_t sub_22DC924D8()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_22DC924E8()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_22DC924F8()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_22DC92508()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_22DC92518()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_22DC92528()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_22DC92538()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_22DC92548()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_22DC92558()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_22DC92568()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_22DC92578()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_22DC92588()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_22DC92598()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22DC925A8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_22DC925B8()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_22DC925C8()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_22DC925D8()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_22DC925E8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_22DC925F8()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_22DC92608()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_22DC92618()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_22DC92628()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_22DC92638()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_22DC92648()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_22DC92658()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_22DC92668()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_22DC92678()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_22DC92688()
{
  return MEMORY[0x270F80318]();
}

uint64_t sub_22DC92698()
{
  return MEMORY[0x270F80330]();
}

uint64_t sub_22DC926A8()
{
  return MEMORY[0x270F80360]();
}

uint64_t sub_22DC926B8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22DC926C8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_22DC926D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22DC926E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22DC926F8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22DC92708()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22DC92718()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22DC92728()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_22DC92738()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22DC92748()
{
  return MEMORY[0x270F5C190]();
}

uint64_t sub_22DC92758()
{
  return MEMORY[0x270F5C1A0]();
}

uint64_t sub_22DC92768()
{
  return MEMORY[0x270F5C1A8]();
}

uint64_t sub_22DC92778()
{
  return MEMORY[0x270F5C1B0]();
}

uint64_t sub_22DC92788()
{
  return MEMORY[0x270F5C1B8]();
}

uint64_t sub_22DC92798()
{
  return MEMORY[0x270F5C1C0]();
}

uint64_t sub_22DC927A8()
{
  return MEMORY[0x270F5C1C8]();
}

uint64_t sub_22DC927B8()
{
  return MEMORY[0x270F5C1D8]();
}

uint64_t sub_22DC927C8()
{
  return MEMORY[0x270F5C1E0]();
}

uint64_t sub_22DC927D8()
{
  return MEMORY[0x270F5C200]();
}

uint64_t sub_22DC927E8()
{
  return MEMORY[0x270F5C208]();
}

uint64_t sub_22DC927F8()
{
  return MEMORY[0x270F5C210]();
}

uint64_t sub_22DC92808()
{
  return MEMORY[0x270F5C218]();
}

uint64_t sub_22DC92818()
{
  return MEMORY[0x270F5C220]();
}

uint64_t sub_22DC92828()
{
  return MEMORY[0x270F5C228]();
}

uint64_t sub_22DC92838()
{
  return MEMORY[0x270F5C230]();
}

uint64_t sub_22DC92848()
{
  return MEMORY[0x270F5C238]();
}

uint64_t sub_22DC92858()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_22DC92868()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_22DC92878()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22DC92888()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22DC92898()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22DC928A8()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_22DC928B8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_22DC928C8()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_22DC928D8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22DC928E8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22DC928F8()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_22DC92908()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22DC92918()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22DC92928()
{
  return MEMORY[0x270F053E0]();
}

uint64_t sub_22DC92938()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22DC92948()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22DC92958()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22DC92968()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22DC92978()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22DC92998()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22DC929A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22DC929B8()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_22DC929C8()
{
  return MEMORY[0x270F860D8]();
}

uint64_t sub_22DC929D8()
{
  return MEMORY[0x270F860E0]();
}

uint64_t sub_22DC929E8()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_22DC929F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22DC92A08()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22DC92A18()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22DC92A28()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_22DC92A38()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22DC92A48()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22DC92A58()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_22DC92A68()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22DC92A78()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22DC92A88()
{
  return MEMORY[0x270EF1B58]();
}

uint64_t sub_22DC92A98()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_22DC92AA8()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_22DC92AB8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_22DC92AC8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_22DC92AD8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_22DC92AE8()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_22DC92AF8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_22DC92B08()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_22DC92B18()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_22DC92B28()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22DC92B38()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22DC92B48()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22DC92B58()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22DC92B68()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22DC92B78()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_22DC92B88()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22DC92B98()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_22DC92BA8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22DC92BB8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22DC92BC8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22DC92BD8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22DC92BE8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22DC92BF8()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_22DC92C08()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_22DC92C18()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22DC92C28()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_22DC92C38()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22DC92C58()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22DC92C68()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22DC92C78()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_22DC92C88()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22DC92C98()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22DC92CA8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_22DC92CD8()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_22DC92CE8()
{
  return MEMORY[0x270F9DDC0]();
}

uint64_t sub_22DC92CF8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22DC92D08()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22DC92D18()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22DC92D28()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_22DC92D38()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_22DC92D48()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_22DC92D58()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22DC92D68()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22DC92D78()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22DC92D88()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22DC92D98()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_22DC92DA8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22DC92DB8()
{
  return MEMORY[0x270FA2BC8]();
}

uint64_t sub_22DC92DC8()
{
  return MEMORY[0x270F053F0]();
}

uint64_t sub_22DC92DD8()
{
  return MEMORY[0x270F9E320]();
}

uint64_t sub_22DC92DE8()
{
  return MEMORY[0x270F86780]();
}

uint64_t sub_22DC92DF8()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_22DC92E08()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_22DC92E18()
{
  return MEMORY[0x270F82450]();
}

uint64_t sub_22DC92E28()
{
  return MEMORY[0x270EF1F00]();
}

uint64_t sub_22DC92E38()
{
  return MEMORY[0x270F86790]();
}

uint64_t sub_22DC92E48()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22DC92E58()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22DC92E68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22DC92E78()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22DC92E88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22DC92E98()
{
  return MEMORY[0x270F82480]();
}

uint64_t sub_22DC92EA8()
{
  return MEMORY[0x270FA1288]();
}

uint64_t sub_22DC92EB8()
{
  return MEMORY[0x270F824D8]();
}

uint64_t sub_22DC92EC8()
{
  return MEMORY[0x270F824E8]();
}

uint64_t sub_22DC92ED8()
{
  return MEMORY[0x270F824F8]();
}

uint64_t sub_22DC92EE8()
{
  return MEMORY[0x270F82508]();
}

uint64_t sub_22DC92EF8()
{
  return MEMORY[0x270F82548]();
}

uint64_t sub_22DC92F08()
{
  return MEMORY[0x270F82558]();
}

uint64_t sub_22DC92F18()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_22DC92F28()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_22DC92F38()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22DC92F48()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_22DC92F58()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_22DC92F68()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22DC92F78()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22DC92F88()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22DC92F98()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22DC92FA8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_22DC92FB8()
{
  return MEMORY[0x270F86150]();
}

uint64_t sub_22DC92FC8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_22DC92FD8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_22DC92FE8()
{
  return MEMORY[0x270F867A8]();
}

uint64_t sub_22DC92FF8()
{
  return MEMORY[0x270F86168]();
}

uint64_t sub_22DC93008()
{
  return MEMORY[0x270F82658]();
}

uint64_t sub_22DC93018()
{
  return MEMORY[0x270F82670]();
}

uint64_t sub_22DC93028()
{
  return MEMORY[0x270F82678]();
}

uint64_t sub_22DC93038()
{
  return MEMORY[0x270F82698]();
}

uint64_t sub_22DC93048()
{
  return MEMORY[0x270F86170]();
}

uint64_t sub_22DC93058()
{
  return MEMORY[0x270F86178]();
}

uint64_t sub_22DC93068()
{
  return MEMORY[0x270F86180]();
}

uint64_t sub_22DC93078()
{
  return MEMORY[0x270F82708]();
}

uint64_t sub_22DC93088()
{
  return MEMORY[0x270F82730]();
}

uint64_t sub_22DC93098()
{
  return MEMORY[0x270F86AA8]();
}

uint64_t sub_22DC930A8()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_22DC930B8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_22DC930C8()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_22DC930D8()
{
  return MEMORY[0x270F86AB0]();
}

uint64_t sub_22DC930E8()
{
  return MEMORY[0x270F861F0]();
}

uint64_t sub_22DC930F8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_22DC93108()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_22DC93118()
{
  return MEMORY[0x270EF21A0]();
}

uint64_t sub_22DC93128()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22DC93138()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22DC93148()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_22DC93158()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_22DC93168()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_22DC93178()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_22DC93188()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_22DC93198()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_22DC931A8()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_22DC931B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22DC931C8()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_22DC931D8()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_22DC931E8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22DC931F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22DC93208()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22DC93218()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_22DC93228()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22DC93238()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22DC93248()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_22DC93258()
{
  return MEMORY[0x270EF24F8]();
}

uint64_t sub_22DC93268()
{
  return MEMORY[0x270EF2518]();
}

uint64_t sub_22DC93278()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22DC93288()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22DC93298()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_22DC932B8()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_22DC932C8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22DC932D8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22DC932E8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22DC932F8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22DC93308()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22DC93318()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_22DC93328()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22DC93338()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22DC93348()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22DC93358()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22DC93368()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22DC93378()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22DC93388()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22DC93398()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_22DC933A8()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_22DC933B8()
{
  return MEMORY[0x270F9E8B0]();
}

uint64_t sub_22DC933C8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22DC933D8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22DC933E8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22DC933F8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22DC93408()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22DC93418()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22DC93428()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22DC93438()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22DC93448()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22DC93458()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_22DC93468()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_22DC93478()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_22DC93488()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22DC93498()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22DC934A8()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_22DC934B8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_22DC934C8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22DC934D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22DC934F8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22DC93508()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22DC93518()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22DC93528()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22DC93538()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22DC93548()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22DC93558()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22DC93568()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22DC93578()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22DC93588()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22DC93598()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_22DC935A8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_22DC935B8()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_22DC935C8()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_22DC935D8()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_22DC935E8()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_22DC935F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22DC93608()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22DC93618()
{
  return MEMORY[0x270F9F058]();
}

uint64_t sub_22DC93628()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22DC93638()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_22DC93648()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22DC93658()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22DC93668()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22DC93678()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22DC93688()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_22DC93698()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22DC936B8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_22DC936C8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_22DC936D8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22DC936E8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22DC936F8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22DC93708()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22DC93718()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_22DC93728()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_22DC93738()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_22DC93748()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22DC93758()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22DC93768()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22DC93778()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_22DC93788()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22DC93798()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22DC937A8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_22DC937C8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22DC937D8()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_22DC937E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22DC937F8()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_22DC93808()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_22DC93818()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_22DC93838()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22DC93848()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_22DC93858()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22DC93868()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22DC93898()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22DC938A8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22DC938B8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22DC938C8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22DC938D8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22DC938E8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_22DC938F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22DC93908()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22DC93918()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22DC93928()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22DC93938()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_22DC93948()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_22DC93958()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22DC93968()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_22DC93978()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_22DC93988()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22DC93998()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_22DC939A8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22DC939B8()
{
  return MEMORY[0x270F9FDD0]();
}

uint64_t sub_22DC939E8()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_22DC939F8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x270F10828]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x270F4ABC0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x270F4ACB8]();
}

uint64_t BTLocalDeviceGetPairedDevices()
{
  return MEMORY[0x270F4ACE0]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x270F4AD98]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PKEqualObjects()
{
  return MEMORY[0x270F51CC0]();
}

uint64_t PKLocalizedStringFromMerchantCategory()
{
  return MEMORY[0x270F51D98]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x270F82CF8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F82E78]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F82E88]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F82E98]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t VCIsInternalBuild()
{
  return MEMORY[0x270F84820]();
}

uint64_t WFActionIconsFromNotificationUserInfo()
{
  return MEMORY[0x270F86220]();
}

uint64_t WFAddRecoveryOptionsToRemoteQuarantineDenialError()
{
  return MEMORY[0x270F86240]();
}

uint64_t WFAsyncTransformedImageFromImage()
{
  return MEMORY[0x270F186C0]();
}

uint64_t WFAutocapitalizationTypeFromString()
{
  return MEMORY[0x270F867C0]();
}

uint64_t WFAutocorrectionTypeFromString()
{
  return MEMORY[0x270F867C8]();
}

uint64_t WFCNContactIsAuthorizedToAccessContact()
{
  return MEMORY[0x270F186D0]();
}

uint64_t WFClearButtonModeFromString()
{
  return MEMORY[0x270F867D0]();
}

uint64_t WFConvertEdgeInsetsToRTLIfNeeded()
{
  return MEMORY[0x270F867D8]();
}

uint64_t WFDatePickerModeFromString()
{
  return MEMORY[0x270F867E0]();
}

uint64_t WFEntitlementsForExecutableAtPath()
{
  return MEMORY[0x270F18700]();
}

uint64_t WFErrorIsRemoteQuarantineDenialError()
{
  return MEMORY[0x270F86280]();
}

uint64_t WFGallerySharingURLForIdentifier()
{
  return MEMORY[0x270F86290]();
}

uint64_t WFGlyphCharactersInSection()
{
  return MEMORY[0x270F84848]();
}

uint64_t WFHumanReadableNameForWorkflowType()
{
  return MEMORY[0x270F84850]();
}

uint64_t WFImageSizeFromFile()
{
  return MEMORY[0x270F18780]();
}

uint64_t WFInstalledAppsEnumerator()
{
  return MEMORY[0x270F18790]();
}

uint64_t WFKeyboardTypeFromString()
{
  return MEMORY[0x270F867E8]();
}

uint64_t WFLocalizedAllShortcutsString()
{
  return MEMORY[0x270F84858]();
}

uint64_t WFLocalizedDisplayNameForContentCategory()
{
  return MEMORY[0x270F187A0]();
}

uint64_t WFLocalizedNumberFormatStyle()
{
  return MEMORY[0x270F862A0]();
}

uint64_t WFModuleSummaryEditorClassForParameterClass()
{
  return MEMORY[0x270F85AF8]();
}

uint64_t WFNSProgressCreateUserInfoKeyPathForKey()
{
  return MEMORY[0x270F862B0]();
}

uint64_t WFNameForGlyphCharacter()
{
  return MEMORY[0x270F84860]();
}

uint64_t WFNameForGlyphSection()
{
  return MEMORY[0x270F84868]();
}

uint64_t WFReturnKeyTypeFromString()
{
  return MEMORY[0x270F867F8]();
}

uint64_t WFSerializableHomeIdentifier()
{
  return MEMORY[0x270F862D0]();
}

uint64_t WFSystemGlyphCharactersInSection()
{
  return MEMORY[0x270F84898]();
}

uint64_t WFSystemImageNameForGlyphCharacter()
{
  return MEMORY[0x270F848A0]();
}

uint64_t WFSystemImageNameForOutlineGlyphCharacter()
{
  return MEMORY[0x270F848A8]();
}

uint64_t WFSystemOutlineGlyphCharactersInSection()
{
  return MEMORY[0x270F848B0]();
}

uint64_t WFTextAlignmentFromString()
{
  return MEMORY[0x270F86808]();
}

uint64_t WFTextContentTypeFromString()
{
  return MEMORY[0x270F86810]();
}

uint64_t WFTriggerDisplayInfoToDisableFromNotificationUserInfo()
{
  return MEMORY[0x270F862F0]();
}

uint64_t WFUserInterfaceFromViewController()
{
  return MEMORY[0x270F86818]();
}

uint64_t WFViewControllerFromUserInterface()
{
  return MEMORY[0x270F86820]();
}

uint64_t WFWorkflowCollectionIdentifierForWorkflowType()
{
  return MEMORY[0x270F862F8]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x270F4B4F0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B780]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A418](cls, protocol);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

uint64_t getWFDialogLogObject()
{
  return MEMORY[0x270F848E8]();
}

uint64_t getWFEditorLogObject()
{
  return MEMORY[0x270F848F0]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x270F84900]();
}

uint64_t getWFTriggersLogObject()
{
  return MEMORY[0x270F84928]();
}

uint64_t getWFWorkflowExecutionLogObject()
{
  return MEMORY[0x270F84948]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x270F9A680](name);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x270FA03D8]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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