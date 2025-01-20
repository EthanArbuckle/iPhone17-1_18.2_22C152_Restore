uint64_t sub_260B3B33C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_260B3CFDC(0, &qword_26A8DBCA8);
  result = sub_260B3D858();
  *a1 = result;
  return result;
}

uint64_t sub_260B3B390@<X0>(uint64_t *a1@<X8>)
{
  sub_260B3CFDC(0, &qword_26A8DBCA0);
  uint64_t result = sub_260B3D858();
  *a1 = result;
  return result;
}

uint64_t USUIMoreHelpContextMenuSwiftUI.USUIHelpMenuActions.init(messageSomeoneAction:blockContactAction:blockContactsAction:moreHelpAction:leaveChatAction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t USUIMoreHelpContextMenuSwiftUI.init(options:contentView:showTitle:actions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _OWORD *a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(self, sel_getCurrentInterventionType);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, a5);
  long long v16 = a4[1];
  v20[0] = *a4;
  v20[1] = v16;
  long long v17 = a4[3];
  v20[2] = a4[2];
  v20[3] = v17;
  v20[4] = a4[4];
  __n128 v18 = USUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)(a1, (uint64_t)v15, (uint64_t)v14, a3, (uint64_t)v20, a5, a6);
  return (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v12 + 8))(a2, a5, v18);
}

__n128 USUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  *(void *)a7 = objc_msgSend(self, sel_modelWithOptions_interventionType_, a1, a2);
  uint64_t v12 = (int *)type metadata accessor for USUIMoreHelpContextMenuSwiftUI();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(&a7[v12[9]], a3, a6);
  a7[v12[10]] = a4;
  uint64_t v13 = &a7[v12[11]];
  long long v14 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)a5;
  *((_OWORD *)v13 + 1) = v14;
  long long v15 = *(_OWORD *)(a5 + 48);
  *((_OWORD *)v13 + 2) = *(_OWORD *)(a5 + 32);
  *((_OWORD *)v13 + 3) = v15;
  __n128 result = *(__n128 *)(a5 + 64);
  *((__n128 *)v13 + 4) = result;
  return result;
}

uint64_t type metadata accessor for USUIMoreHelpContextMenuSwiftUI()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t USUIMoreHelpContextMenuSwiftUI.body.getter@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8DBC90);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v25 = v5;
  uint64_t v26 = v6;
  uint64_t v27 = v7;
  uint64_t v28 = sub_260B3D218(&qword_26A8DBC98, &qword_26A8DBC90);
  uint64_t v8 = sub_260B3D7C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  long long v14 = &v18[-v13];
  uint64_t v22 = v5;
  uint64_t v23 = v7;
  uint64_t v24 = v2;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  uint64_t v21 = v2;
  sub_260B3D7B8();
  swift_getWitnessTable();
  long long v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16);
  v15(v14, v12, v8);
  long long v16 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v15(a2, v14, v8);
  return ((uint64_t (*)(unsigned char *, uint64_t))v16)(v14, v8);
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

uint64_t sub_260B3B8BC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v47 = *(void *)(v9 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8DBCB0);
  uint64_t v12 = *(void *)(v53 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v52 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v56 = (char *)&v45 - v15;
  long long v16 = *a1;
  if (*((unsigned char *)a1 + *(int *)(v8 + 40)) == 1)
  {
    v46 = *a1;
    id v17 = objc_msgSend(v16, sel_title);
    uint64_t v45 = v8;
    __n128 v18 = v11;
    uint64_t v19 = v12;
    uint64_t v20 = a2;
    id v21 = v17;
    uint64_t v22 = v9;
    uint64_t v23 = a1;
    uint64_t v24 = a3;
    uint64_t v25 = sub_260B3D838();
    uint64_t v27 = v26;

    a2 = v20;
    uint64_t v12 = v19;
    uint64_t v11 = v18;
    uint64_t v8 = v45;
    uint64_t v57 = v25;
    uint64_t v58 = v27;
    a3 = v24;
    a1 = v23;
    uint64_t v9 = v22;
    sub_260B3D384();
    uint64_t v55 = sub_260B3D7D8();
    uint64_t v50 = v29;
    uint64_t v51 = v28;
    uint64_t v49 = v30 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    long long v16 = v46;
    int v48 = 1;
  }
  else
  {
    uint64_t KeyPath = 0;
    uint64_t v55 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v49 = 0;
    int v48 = 0;
  }
  id v31 = objc_msgSend(v16, sel_actions);
  sub_260B3CFDC(0, &qword_26A8DBCA0);
  uint64_t v32 = sub_260B3D848();

  uint64_t v57 = v32;
  (*(void (**)(char *, void **, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v33 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = a2;
  *(void *)(v34 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v34 + v33, v11, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8DBCB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8DBCC0);
  sub_260B3D218(&qword_26A8DBCC8, &qword_26A8DBCB8);
  sub_260B3D218(&qword_26A8DBCD0, &qword_26A8DBCC0);
  sub_260B3D25C();
  v35 = v56;
  sub_260B3D828();
  v36 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v38 = v52;
  uint64_t v37 = v53;
  v36(v52, v35, v53);
  uint64_t v39 = v50;
  uint64_t v40 = v51;
  *(void *)a4 = v55;
  *(void *)(a4 + 8) = v40;
  LOBYTE(v32) = v49;
  *(void *)(a4 + 16) = v49;
  *(void *)(a4 + 24) = v39;
  *(void *)(a4 + 32) = KeyPath;
  *(void *)(a4 + 40) = 0;
  *(unsigned char *)(a4 + 48) = v48;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8DBCE0);
  v36((char *)(a4 + *(int *)(v41 + 48)), v38, v37);
  uint64_t v42 = v55;
  sub_260B3D2C4(v55, v40, v32, v39);
  v43 = *(void (**)(char *, uint64_t))(v12 + 8);
  v43(v56, v37);
  v43(v38, v37);
  return sub_260B3D324(v42, v40, v32, v39);
}

uint64_t sub_260B3BD54@<X0>(uint64_t a1@<X8>)
{
  return sub_260B3B8BC(*(void ***)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_260B3BD60@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v29 = a3;
  uint64_t v28 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI();
  uint64_t v6 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v26 - v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8DBCF0);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8DBCC0);
  uint64_t v11 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  id v15 = objc_msgSend(v14, sel_title);
  uint64_t v16 = sub_260B3D838();
  uint64_t v18 = v17;

  uint64_t v32 = v16;
  uint64_t v33 = v18;
  if (objc_msgSend(v14, sel_destructive)) {
    sub_260B3D768();
  }
  else {
    sub_260B3D778();
  }
  uint64_t v19 = sub_260B3D788();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 0, 1, v19);
  uint64_t v20 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v26, v28);
  unint64_t v21 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v22 = (char *)swift_allocObject();
  uint64_t v23 = v30;
  *((void *)v22 + 2) = v29;
  *((void *)v22 + 3) = v23;
  *((void *)v22 + 4) = v14;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v22[v21], v8, v20);
  sub_260B3D384();
  id v24 = v14;
  sub_260B3D818();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v31, v13, v27);
}

uint64_t sub_260B3C060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + *(int *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI() + 36);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, v9, a2);
  v10(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_260B3C164@<X0>(char *a1@<X8>)
{
  return sub_260B3C060(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_260B3C170()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_260B3C17C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_260B3C1C8()
{
  return sub_260B3D808();
}

uint64_t sub_260B3C1E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_260B3C1F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void **sub_260B3C2A4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  int v7 = *(_DWORD *)(v4 + 80) & 0x100000;
  uint64_t v8 = (char *)*a2;
  *a1 = *a2;
  if (v5 > 7 || v7 != 0 || ((((v5 + 8) & ~v5) + v6) & 0xFFFFFFFFFFFFFFF8) + 88 > 0x18)
  {
    uint64_t v11 = (void **)&v8[(v5 & 0xF8 ^ 0x1F8) & (v5 + 16)];
  }
  else
  {
    uint64_t v11 = a1;
    uint64_t v12 = ((unint64_t)a1 + v5 + 8) & ~v5;
    uint64_t v13 = ((unint64_t)a2 + v5 + 8) & ~v5;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    id v15 = v8;
    v14(v12, v13, v3);
    *(unsigned char *)(v12 + v6) = *(unsigned char *)(v13 + v6);
    uint64_t v16 = (void *)((v12 + v6) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v17 = (void *)((v13 + v6) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v18 = v17[2];
    v16[1] = v17[1];
    v16[2] = v18;
    uint64_t v19 = v17[4];
    v16[3] = v17[3];
    v16[4] = v19;
    uint64_t v20 = v17[6];
    v16[5] = v17[5];
    v16[6] = v20;
    uint64_t v21 = v17[8];
    v16[7] = v17[7];
    v16[8] = v21;
    uint64_t v22 = v17[10];
    v16[9] = v17[9];
    v16[10] = v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v11;
}

uint64_t sub_260B3C418(id *a1, uint64_t a2)
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))(((unint64_t)a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void **sub_260B3C4CC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  id v12 = v4;
  v7(v10, v11, v5);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = v13 + v10;
  uint64_t v15 = v13 + v11;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = *(void *)(v15 + 16);
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  *(void *)(v14 + 16) = v16;
  uint64_t v17 = *(void *)(v15 + 32);
  *(void *)(v14 + 24) = *(void *)(v15 + 24);
  *(void *)(v14 + 32) = v17;
  uint64_t v18 = *(void *)(v15 + 48);
  *(void *)(v14 + 40) = *(void *)(v15 + 40);
  *(void *)(v14 + 48) = v18;
  uint64_t v19 = *(void *)(v15 + 64);
  *(void *)(v14 + 56) = *(void *)(v15 + 56);
  *(void *)(v14 + 64) = v19;
  uint64_t v20 = *(void *)(v15 + 80);
  *(void *)(v14 + 72) = *(void *)(v15 + 72);
  *(void *)(v14 + 80) = v20;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void **sub_260B3C5C4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  int v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = ((unint64_t)a1 + v11 + 8) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 8) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 40);
  unint64_t v15 = v14 + v12;
  unint64_t v16 = v14 + v13;
  *(unsigned char *)unint64_t v15 = *(unsigned char *)v16;
  uint64_t v17 = (void *)(v15 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (void *)(v16 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = *(void *)((v16 & 0xFFFFFFFFFFFFFFF8) + 16);
  v17[1] = *(void *)((v16 & 0xFFFFFFFFFFFFFFF8) + 8);
  v17[2] = v19;
  swift_retain();
  swift_release();
  uint64_t v20 = v18[4];
  v17[3] = v18[3];
  v17[4] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = v18[6];
  v17[5] = v18[5];
  v17[6] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = v18[8];
  v17[7] = v18[7];
  v17[8] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = v18[10];
  v17[9] = v18[9];
  v17[10] = v23;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_260B3C6EC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t v10 = v9 + v7;
  uint64_t v11 = v9 + v8;
  *(unsigned char *)uint64_t v10 = *(unsigned char *)v11;
  v10 &= 0xFFFFFFFFFFFFFFF8;
  v11 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + 8);
  long long v12 = *(_OWORD *)(v11 + 72);
  long long v13 = *(_OWORD *)(v11 + 56);
  long long v14 = *(_OWORD *)(v11 + 40);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(v11 + 24);
  *(_OWORD *)(v10 + 40) = v14;
  *(_OWORD *)(v10 + 56) = v13;
  *(_OWORD *)(v10 + 72) = v12;
  return a1;
}

void **sub_260B3C7B0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 24);
  unint64_t v13 = v12 + v10;
  unint64_t v14 = v12 + v11;
  *(unsigned char *)unint64_t v13 = *(unsigned char *)v14;
  unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((v14 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  *(_OWORD *)(v15 + 24) = *(_OWORD *)(v16 + 24);
  swift_release();
  *(_OWORD *)(v15 + 40) = *(_OWORD *)(v16 + 40);
  swift_release();
  *(_OWORD *)(v15 + 56) = *(_OWORD *)(v16 + 56);
  swift_release();
  *(_OWORD *)(v15 + 72) = *(_OWORD *)(v16 + 72);
  swift_release();
  return a1;
}

uint64_t sub_260B3C8AC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 8) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 88;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x260B3CA00);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 8) & ~v6);
  }
  uint64_t v17 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_260B3CA14(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((v9 + 8) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)) & 0xFFFFFFFFFFFFFFF8) + 88;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (unint64_t)&a1[v9 + 8] & ~v9;
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v18 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v18 = a2 - 1;
              }
              *(void *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 8) & ~v9) + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)) & 0xFFFFFFF8) == 0xFFFFFFA8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 8) & ~v9) + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)) & 0xFFFFFFF8) == 0xFFFFFFA8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 8) & ~v9) + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)) & 0xFFFFFFF8) != 0xFFFFFFA8)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x260B3CC00);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_260B3CC28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_260B3CC30(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_260B3CC64()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_260B3CCB8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_260B3CD54(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_OWORD *sub_260B3CE18(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  return a1;
}

uint64_t sub_260B3CE90(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_260B3CED8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for USUIMoreHelpContextMenuSwiftUI.USUIHelpMenuActions()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_260B3CF44()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B3CFDC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_260B3D05C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;

  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[11], v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_260B3D17C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_260B3BD60(a1, v8, v5, v6, a2);
}

uint64_t sub_260B3D218(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_260B3D25C()
{
  unint64_t result = qword_26A8DBCD8;
  if (!qword_26A8DBCD8)
  {
    sub_260B3CFDC(255, &qword_26A8DBCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8DBCD8);
  }
  return result;
}

uint64_t sub_260B3D2C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_260B3D314(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_260B3D314(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_260B3D324(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_260B3D374(result, a2, a3 & 1);
    swift_release();
    return MEMORY[0x270FA01E8](a4);
  }
  return result;
}

uint64_t sub_260B3D374(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return MEMORY[0x270FA01E8](a2);
  }
}

unint64_t sub_260B3D384()
{
  unint64_t result = qword_26A8DBCE8;
  if (!qword_26A8DBCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8DBCE8);
  }
  return result;
}

uint64_t sub_260B3D3D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_260B3D798();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_260B3D40C()
{
  return sub_260B3D7A8();
}

uint64_t sub_260B3D43C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;

  uint64_t v7 = (id *)(v0 + v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 8))((char *)v7 + v2[11], v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v5, v6);
}

id sub_260B3D564()
{
  uint64_t v1 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  id result = objc_msgSend(*(id *)(v0 + 32), sel_actionID);
  uint64_t v4 = v0 + ((v2 + 40) & ~v2);
  switch((unint64_t)result)
  {
    case 1uLL:
      uint64_t v5 = (uint64_t (**)(void))(v4 + *(int *)(v1 + 44));
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = (uint64_t (**)(void))(v4 + *(int *)(v1 + 44) + 48);
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = (uint64_t (**)(void))(v4 + *(int *)(v1 + 44) + 64);
      goto LABEL_7;
    case 4uLL:
      uint64_t v5 = (uint64_t (**)(void))(v4 + *(int *)(v1 + 44) + 16);
      goto LABEL_7;
    case 5uLL:
      uint64_t v5 = (uint64_t (**)(void))(v4 + *(int *)(v1 + 44) + 32);
LABEL_7:
      id result = (id)(*v5)();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_260B3D6BC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_260B3D768()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_260B3D778()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_260B3D788()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_260B3D798()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_260B3D7A8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_260B3D7B8()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_260B3D7C8()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_260B3D7D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_260B3D7E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_260B3D7F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_260B3D808()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_260B3D818()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_260B3D828()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_260B3D838()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_260B3D848()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_260B3D858()
{
  return MEMORY[0x270F9E9D8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}