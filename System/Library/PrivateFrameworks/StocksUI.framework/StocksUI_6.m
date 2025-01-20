uint64_t sub_20A884C98(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void v13[16];

  v2 = sub_20A8C7100();
  v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A88564C(0, &qword_26AC699E8, MEMORY[0x263F79E10], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)v13 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8C46C0();
  result = sub_20A8C5B60();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  v10 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E50);
  result = sub_20A8C5BB0();
  if (!v13[14])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13[0] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A885560();
  result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = sub_20A8C6CE0();
  sub_20A8C5BB0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v8, 1, v11);
  if (result == 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8C4870();
  result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7A0A8], v2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  result = sub_20A8C5BB0();
  if (!v13[9])
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC81298);
  result = sub_20A8C5BB0();
  if (v13[4])
  {
    v12 = objc_allocWithZone((Class)sub_20A8C6D00());
    return sub_20A8C6CF0();
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_20A885054()
{
  return sub_20A8C4490();
}

uint64_t sub_20A8850F4()
{
  uint64_t v0 = sub_20A8C4810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (uint64_t *)((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20A8C4790();
  void *v3 = 11;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F24E00], v0);
  return sub_20A8C4780();
}

uint64_t sub_20A8851D8(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8C4870();
  uint64_t result = sub_20A8C5BA0();
  if (result)
  {
    uint64_t v3 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A885508();
    uint64_t result = sub_20A8C5BA0();
    if (result)
    {
      uint64_t v4 = result;
      sub_20A8C4800();
      sub_20A8C47E0();
      uint64_t v5 = (void *)sub_20A8C47D0();
      sub_20A8C4140();
      sub_20A8855A0(&qword_26AC6D120, v6, (void (*)(uint64_t))type metadata accessor for MediaAssembly);
      sub_20A8C41C0();
      swift_release();
      v7 = (void *)sub_20A8C47C0();

      sub_20A8C4160();
      sub_20A8C41C0();
      swift_release();
      v8 = (void *)sub_20A8C47A0();

      sub_20A8C4150();
      sub_20A8C41C0();
      swift_release();
      uint64_t v9 = sub_20A8C47B0();

      return MEMORY[0x21051CB10](v3, v4, 0, v9);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A8853D4()
{
  sub_20A8C4870();
  id v0 = objc_msgSend(self, sel_mainBundle);
  return sub_20A8C4860();
}

uint64_t sub_20A885420(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (v2)
  {
    sub_20A8C6C50();
    swift_allocObject();
    return sub_20A8C6C40();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MediaAssembly()
{
  return self;
}

uint64_t sub_20A8854DC()
{
  return sub_20A8840EC();
}

uint64_t sub_20A885500(void *a1)
{
  return sub_20A8851D8(a1);
}

unint64_t sub_20A885508()
{
  unint64_t result = qword_26AC69320;
  if (!qword_26AC69320)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC69320);
  }
  return result;
}

unint64_t sub_20A885560()
{
  unint64_t result = qword_26AC7F8E0;
  if (!qword_26AC7F8E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC7F8E0);
  }
  return result;
}

uint64_t sub_20A8855A0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_20A8855E8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20A88564C(255, a2, a3, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_20A88564C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

Class StocksAttributionString()
{
  v0.super.isa = stocksAttributionString()().super.isa;

  return v0.super.isa;
}

NSAttributedString __swiftcall stocksAttributionString()()
{
  sub_20A885F74(0, (unint64_t *)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  v64 = (char *)&v62 - v1;
  uint64_t v2 = sub_20A8C2530();
  uint64_t v65 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  MEMORY[0x270FA5388](v2);
  v63 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_20A8C2120();
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_20A8C2990();
  uint64_t v67 = *(void *)(v7 - 8);
  uint64_t v68 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = sub_20A8C2370();
  unint64_t v15 = v14;

  unint64_t v72 = v13;
  unint64_t v73 = v15;
  swift_bridgeObjectRetain();
  sub_20A8CE3D0();
  swift_bridgeObjectRelease();
  unint64_t v17 = v72;
  unint64_t v16 = v73;
  id v18 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v19 = sub_20A8C2370();
  uint64_t v21 = v20;

  id v22 = objc_allocWithZone(MEMORY[0x263F089B8]);
  swift_bridgeObjectRetain();
  v23 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  id v71 = objc_msgSend(v22, sel_initWithString_, v23);

  v24 = (void *)sub_20A8CE240();
  v25 = (void *)sub_20A8CE240();
  id v26 = objc_msgSend(v24, sel_rangeOfString_options_, v25, 1);
  uint64_t v28 = v27;

  if (v26 == (id)sub_20A8C2010())
  {
    sub_20A8CE9E0();
    sub_20A885F74(0, (unint64_t *)&qword_26AC80130, (uint64_t (*)(uint64_t))sub_20A448228, MEMORY[0x263F8E0F8]);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_20A8D5CB0;
    uint64_t v30 = MEMORY[0x263F8D310];
    *(void *)(v29 + 56) = MEMORY[0x263F8D310];
    unint64_t v31 = sub_20A43F830();
    *(void *)(v29 + 32) = v19;
    *(void *)(v29 + 40) = v21;
    *(void *)(v29 + 96) = v30;
    *(void *)(v29 + 104) = v31;
    *(void *)(v29 + 64) = v31;
    *(void *)(v29 + 72) = v17;
    *(void *)(v29 + 80) = v16;
    v32 = (void *)sub_20A8C28F0();
    if (v32[2])
    {
      uint64_t v34 = v32[4];
      unint64_t v33 = v32[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v35 = (void *)(v29 + 112);
      *(void *)(v29 + 136) = v30;
      *(void *)(v29 + 144) = v31;
      if (v33)
      {
        void *v35 = v34;
        v36 = v71;
        unint64_t v37 = 0x263F08000;
LABEL_12:
        *(void *)(v29 + 120) = v33;
        sub_20A43F884();
        v55 = (void *)sub_20A8CF180();
        sub_20A8C7DA0();
        swift_bridgeObjectRelease();

        goto LABEL_13;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v35 = (void *)(v29 + 112);
      *(void *)(v29 + 136) = v30;
      *(void *)(v29 + 144) = v31;
    }
    v36 = v71;
    unint64_t v37 = 0x263F08000uLL;
    void *v35 = 0x3E6C696E3CLL;
    unint64_t v33 = 0xE500000000000000;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20A8C2940();
  uint64_t v38 = sub_20A8C2880();
  unint64_t v40 = v39;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v9, v68);
  unint64_t v72 = v38;
  unint64_t v73 = v40;
  sub_20A8C20F0();
  sub_20A48C5C0();
  sub_20A8CF230();
  uint64_t v42 = v41;
  (*(void (**)(char *, uint64_t))(v69 + 8))(v6, v70);
  result.super.isa = (Class)swift_bridgeObjectRelease();
  if (!v42)
  {
    __break(1u);
    return result;
  }
  unint64_t v72 = 0xD000000000000027;
  unint64_t v73 = 0x800000020A912F70;
  sub_20A8CE3D0();
  swift_bridgeObjectRelease();
  uint64_t v44 = (uint64_t)v64;
  sub_20A8C2520();
  swift_bridgeObjectRelease();
  uint64_t v46 = v65;
  uint64_t v45 = v66;
  int v47 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v44, 1, v66);
  v36 = v71;
  unint64_t v37 = 0x263F08000;
  uint64_t v48 = v28;
  if (v47 == 1)
  {
    sub_20A596854(v44);
    sub_20A8CE9E0();
    sub_20A43F884();
    v49 = (void *)sub_20A8CF180();
    sub_20A8C7D90();
  }
  else
  {
    v50 = v63;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v63, v44, v45);
    uint64_t v51 = *MEMORY[0x263F81520];
    v52 = (void *)sub_20A8C24D0();
    objc_msgSend(v36, sel_addAttribute_value_range_, v51, v52, v26, v48);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v45);
  }
  uint64_t v53 = *MEMORY[0x263F815F8];
  v54 = (void *)sub_20A8CE6D0();
  objc_msgSend(v36, sel_addAttribute_value_range_, v53, v54, v26, v48);

LABEL_13:
  if (qword_26AC817F0 != -1) {
    swift_once();
  }
  id v56 = objc_msgSend((id)qword_26AC9EC40, sel_imageWithRenderingMode_, 2);
  id v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81678]), sel_init);
  objc_msgSend(v57, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  objc_msgSend(v57, sel_setImage_, v56);
  id v58 = objc_msgSend(self, sel_attributedStringWithAttachment_, v57);
  id v59 = objc_msgSend(objc_allocWithZone(*(Class *)(v37 + 2488)), sel_initWithAttributedString_, v58);

  uint64_t v60 = *MEMORY[0x263F814B8];
  v61 = (void *)sub_20A8CE830();
  objc_msgSend(v59, sel_addAttribute_value_range_, v60, v61, 0, objc_msgSend(v59, sel_length));

  objc_msgSend(v36, sel_appendAttributedString_, v59);
  return (NSAttributedString)v36;
}

void sub_20A885F74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t FCFeedType.feedType()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((unint64_t)(a1 - 2) >= 0xE)
  {
    switch(a1)
    {
      case 0:
      case 17:
      case 18:
      case 19:
        break;
      case 1:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F7A610];
        goto LABEL_4;
      case 16:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F7A608];
        goto LABEL_4;
      case 20:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F7A618];
        goto LABEL_4;
      default:
        sub_20A8CF520();
        __break(1u);
        JUMPOUT(0x20A8860FCLL);
    }
  }
  uint64_t v3 = (unsigned int *)MEMORY[0x263F7A620];
LABEL_4:
  uint64_t v4 = *v3;
  uint64_t v5 = sub_20A8C76F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
}

void destroy for StockViewLayoutAttributes(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 320);
  if (v2 != (void *)1) {

  }
  uint64_t v3 = *(void **)(a1 + 328);
}

uint64_t initializeWithCopy for StockViewLayoutAttributes(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  uint64_t v6 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  long long v7 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 248) = v7;
  long long v8 = *(_OWORD *)(a2 + 280);
  long long v9 = *(_OWORD *)(a2 + 296);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(_OWORD *)(a1 + 280) = v8;
  *(_OWORD *)(a1 + 296) = v9;
  v10 = *(void **)(a2 + 320);
  id v11 = v6;
  if (v10 != (void *)1) {
    id v12 = v10;
  }
  uint64_t v13 = *(void **)(a2 + 328);
  *(void *)(a1 + 320) = v10;
  *(void *)(a1 + 328) = v13;
  id v14 = v13;
  return a1;
}

uint64_t assignWithCopy for StockViewLayoutAttributes(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v5 = *(void **)(a2 + 80);
  uint64_t v6 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v5;
  id v7 = v5;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  long long v8 = *(_OWORD *)(a2 + 280);
  long long v9 = *(_OWORD *)(a2 + 296);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(_OWORD *)(a1 + 280) = v8;
  *(_OWORD *)(a1 + 296) = v9;
  v10 = (void *)(a1 + 320);
  id v11 = *(void **)(a1 + 320);
  id v12 = *(void **)(a2 + 320);
  if (v11 != (void *)1)
  {
    if (v12 != (void *)1)
    {
      void *v10 = v12;
      id v14 = v12;

      goto LABEL_8;
    }
    sub_20A5A2320(a1 + 320);
    id v12 = *(void **)(a2 + 320);
    goto LABEL_6;
  }
  if (v12 == (void *)1)
  {
LABEL_6:
    void *v10 = v12;
    goto LABEL_8;
  }
  void *v10 = v12;
  id v13 = v12;
LABEL_8:
  unint64_t v15 = *(void **)(a2 + 328);
  unint64_t v16 = *(void **)(a1 + 328);
  *(void *)(a1 + 328) = v15;
  id v17 = v15;

  return a1;
}

void *__swift_memcpy336_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x150uLL);
}

uint64_t assignWithTake for StockViewLayoutAttributes(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  uint64_t v6 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  uint64_t v7 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v7;
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  long long v8 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v8;
  long long v9 = (uint64_t *)(a1 + 320);
  v10 = *(void **)(a1 + 320);
  uint64_t v11 = *(void *)(a2 + 320);
  if (v10 != (void *)1)
  {
    if (v11 != 1)
    {
      *long long v9 = v11;

      goto LABEL_6;
    }
    sub_20A5A2320(a1 + 320);
    uint64_t v11 = 1;
  }
  *long long v9 = v11;
LABEL_6:
  id v12 = *(void **)(a1 + 328);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);

  return a1;
}

uint64_t getEnumTagSinglePayload for StockViewLayoutAttributes(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 336)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StockViewLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 328) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)NSAttributedString result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 336) = 1;
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 336) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StockViewLayoutAttributes()
{
  return &type metadata for StockViewLayoutAttributes;
}

uint64_t sub_20A886684()
{
  sub_20A886724();

  return sub_20A8CACE0();
}

uint64_t sub_20A8866C0()
{
  return *(void *)(v0 + 32);
}

unint64_t sub_20A8866D0()
{
  unint64_t result = qword_26763E768;
  if (!qword_26763E768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E768);
  }
  return result;
}

unint64_t sub_20A886724()
{
  unint64_t result = qword_26763E770;
  if (!qword_26763E770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E770);
  }
  return result;
}

uint64_t sub_20A886778(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_20A8C3F00();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v33 + 64);
  MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v30 - v6;
  uint64_t v8 = type metadata accessor for CommandShareContent(0);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A887424(0, &qword_26763C178, type metadata accessor for CommandStocksShareContentComplete, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)v30 - v12;
  uint64_t v14 = type metadata accessor for CommandStocksShareContentComplete(0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A886BDC(a1, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    id v18 = &qword_26763C178;
    uint64_t v19 = type metadata accessor for CommandStocksShareContentComplete;
    uint64_t v20 = (uint64_t)v13;
    return sub_20A8873B4(v20, v18, v19);
  }
  v32 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v33;
  sub_20A886C70((uint64_t)v13, (uint64_t)v17);
  if (!v34) {
    return sub_20A886CD4((uint64_t)v17, type metadata accessor for CommandStocksShareContentComplete);
  }
  swift_retain();
  sub_20A8C99A0();
  sub_20A7CC904();
  sub_20A8C4990();
  if (swift_dynamicCast())
  {
    v30[1] = v35;
    sub_20A59ADCC((uint64_t)v17, (uint64_t)v10);
    sub_20A58B96C();
    unint64_t v31 = &v10[*(int *)(v22 + 48)];
    char v23 = v10[*(int *)(v22 + 64)];
    v24 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    v25 = v7;
    v24(v7, v10, v3);
    id v26 = v32;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v32, v25, v3);
    unint64_t v27 = (*(unsigned __int8 *)(v21 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = v23;
    v24((char *)(v28 + v27), v26, v3);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    swift_release_n();
    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v3);
    sub_20A886CD4((uint64_t)v17, type metadata accessor for CommandStocksShareContentComplete);
    id v18 = &qword_26AC68FB0;
    uint64_t v19 = (uint64_t (*)(uint64_t))MEMORY[0x263F7AEF0];
    uint64_t v20 = (uint64_t)v31;
    return sub_20A8873B4(v20, v18, v19);
  }
  sub_20A886CD4((uint64_t)v17, type metadata accessor for CommandStocksShareContentComplete);
  return swift_release();
}

uint64_t sub_20A886BDC(uint64_t a1, uint64_t a2)
{
  sub_20A887424(0, &qword_26763C178, type metadata accessor for CommandStocksShareContentComplete, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A886C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CommandStocksShareContentComplete(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A886CD4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A886D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a3;
  v28[0] = a2;
  v28[1] = a1;
  uint64_t v3 = sub_20A8C6810();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_20A8C4030();
  uint64_t v6 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_20A8C6800();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  uint64_t v32 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_20A8C6950();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_20A8C6730();
  uint64_t v18 = *(void *)(v17 - 8);
  double v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v14 + 104))(v16, **((unsigned int **)&unk_263FDD490 + SLOBYTE(v28[0])), v13, v19);
  sub_20A8C6720();
  sub_20A887488((unint64_t *)&unk_26763B740, MEMORY[0x263F79960]);
  v28[0] = 0x800000020A913010;
  sub_20A8C45B0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  sub_20A8C3EC0();
  sub_20A8C3E70();
  sub_20A5D54EC((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v29);
  sub_20A8C3EE0();
  sub_20A8C67E0();
  sub_20A887424(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v22 = sub_20A8C4620();
  uint64_t v23 = *(void *)(v22 - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v23 + 104))(v25 + v24, *MEMORY[0x263F24D48], v22);
  sub_20A887488(&qword_26AC69918, MEMORY[0x263F799D0]);
  uint64_t v26 = v31;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v26);
  sub_20A8C6E30();
  sub_20A887488(&qword_26763E778, MEMORY[0x263F79EB8]);
  memset(v33, 0, sizeof(v33));
  sub_20A8C45D0();
  return sub_20A886CD4((uint64_t)v33, (uint64_t (*)(void))sub_20A42F348);
}

uint64_t sub_20A8872B0()
{
  uint64_t v1 = sub_20A8C3F00();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_20A887340(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C3F00() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = *(unsigned __int8 *)(v1 + 16);

  return sub_20A886D34(a1, v5, v4);
}

uint64_t sub_20A8873B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_20A887424(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_20A887424(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_20A887488(unint64_t *a1, void (*a2)(uint64_t))
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

void destroy for WelcomeViewLayoutOptions(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 80);
}

uint64_t initializeWithCopy for WelcomeViewLayoutOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v4 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for WelcomeViewLayoutOptions(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(void **)(a2 + 80);
  unint64_t v8 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for WelcomeViewLayoutOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  id v5 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  return a1;
}

uint64_t getEnumTagSinglePayload for WelcomeViewLayoutOptions(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WelcomeViewLayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WelcomeViewLayoutOptions()
{
  return &type metadata for WelcomeViewLayoutOptions;
}

uint64_t initializeWithCopy for WelcomeViewAnimatorOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  id v4 = v3;
  return a1;
}

void *assignWithCopy for WelcomeViewAnimatorOptions(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  id v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for WelcomeViewAnimatorOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  id v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for WelcomeViewAnimatorOptions(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WelcomeViewAnimatorOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WelcomeViewAnimatorOptions()
{
  return &type metadata for WelcomeViewAnimatorOptions;
}

uint64_t sub_20A8878EC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  sub_20A887A3C();
  uint64_t result = sub_20A8C5BB0();
  if (v11)
  {
    sub_20A42BEBC(&v10, (uint64_t)v12);
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    unint64_t v9 = v3;
    sub_20A42F250();
    sub_20A8CB4C0();
    if (v11)
    {
      sub_20A8C4990();
      if (swift_dynamicCast()) {
        uint64_t v5 = v8;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      sub_20A44349C((uint64_t)&v10);
      uint64_t v5 = 0;
    }
    uint64_t v6 = sub_20A4AF99C(&v9, v5);
    swift_release();
    if (v6)
    {
      uint64_t v7 = (void (*)(uint64_t))sub_20A8CB490();
      v7(v6);
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_20A887A3C()
{
  unint64_t result = qword_26AC6DC30;
  if (!qword_26AC6DC30)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AC6DC30);
  }
  return result;
}

uint64_t sub_20A887A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v31 = a2;
  uint64_t v30 = type metadata accessor for StockFeedSectionDescriptor();
  MEMORY[0x270FA5388](v30);
  uint64_t v29 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_20A8C2830();
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for StockFeedModel();
  MEMORY[0x270FA5388](v27);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20A887FCC(0, (unint64_t *)&qword_26AC69D80, (uint64_t (*)(uint64_t))type metadata accessor for StockFeedModel, sub_20A44D39C, MEMORY[0x263F7D2D8]);
  uint64_t v24 = v8;
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v24 - v9;
  sub_20A42C84C();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v24 - v17;
  sub_20A887F44(&qword_26AC69D78);
  sub_20A887F44(&qword_26AC69D70);
  sub_20A8C5F70();
  sub_20A8C2820();
  uint64_t v19 = sub_20A8C2810();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v25);
  sub_20A887FCC(0, &qword_26AC6B008, (uint64_t (*)(uint64_t))type metadata accessor for StockFeedServiceConfig, sub_20A524428, MEMORY[0x263F59858]);
  swift_allocObject();
  swift_retain();
  uint64_t v22 = sub_20A8CC7A0();
  uint64_t *v7 = v19;
  v7[1] = v21;
  v7[2] = v22;
  swift_storeEnumTagMultiPayload();
  sub_20A44D39C();
  sub_20A8C8320();
  sub_20A8C5F60();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v24);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, v18, v12);
  sub_20A88804C(&qword_26AC76F98, (void (*)(uint64_t))type metadata accessor for StockFeedSectionDescriptor);
  sub_20A8C8810();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_20A887F44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20A887FCC(255, (unint64_t *)&qword_26AC69D80, (uint64_t (*)(uint64_t))type metadata accessor for StockFeedModel, sub_20A44D39C, MEMORY[0x263F7D2D8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_20A887FCC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_20A88804C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ManageWatchlistsDataManager()
{
  return self;
}

uint64_t sub_20A8880B8()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ForYouFeedMastheadModelProvider()
{
  return self;
}

BOOL sub_20A88811C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_activityType);
  uint64_t v2 = sub_20A8CE280();
  uint64_t v4 = v3;

  v5._countAndFlagsBits = v2;
  v5._object = v4;
  StocksActivityType.init(rawValue:)(v5);
  return v7 != 6;
}

uint64_t sub_20A88818C(void *a1)
{
  uint64_t v2 = v1;
  sub_20A888D34(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v39[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v39[-1] - v8;
  uint64_t v10 = type metadata accessor for StocksActivity(0);
  double v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (void *)((char *)&v39[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v14 = objc_msgSend(a1, sel_userInfo, v11);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v38 = v6;
    uint64_t v16 = sub_20A8CE180();

    id v17 = objc_msgSend(a1, sel_activityType);
    uint64_t v18 = sub_20A8CE280();
    uint64_t v20 = v19;

    id v21 = objc_msgSend(a1, sel_interaction);
    sub_20A60E534(v18, v20, v16, v13);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    char v29 = sub_20A888958((uint64_t)v13);
    __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_featureAvailability), *(void *)(v2 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_featureAvailability + 24));
    char v30 = sub_20A8CD7B0();
    if (v30 & 1) != 0 || (v29)
    {
      if ((StocksActivity.disableAnimation.getter() & 1) != 0
        || (id v31 = objc_msgSend(a1, sel_interaction), v31, v31))
      {
        uint64_t v32 = sub_20A8C6D60();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v9, 1, 1, v32);
        uint64_t v42 = 0;
        long long v40 = 0u;
        long long v41 = 0u;
        sub_20A4342F4(v2 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_resolver, (uint64_t)v39);
        uint64_t v28 = sub_20A88DCCC((uint64_t)v13, 0, (uint64_t)v9, (uint64_t)&v40, 0, 0, (uint64_t)v39);
        sub_20A592CD4((uint64_t)v39, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
        sub_20A592CD4((uint64_t)&v40, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
        uint64_t v33 = (void (*)(uint64_t))MEMORY[0x263F79E28];
        uint64_t v34 = (uint64_t)v9;
      }
      else
      {
        uint64_t v35 = sub_20A8C6D60();
        uint64_t v36 = (uint64_t)v38;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v38, 1, 1, v35);
        uint64_t v42 = 0;
        long long v40 = 0u;
        long long v41 = 0u;
        sub_20A4342F4(v2 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_resolver, (uint64_t)v39);
        uint64_t v28 = sub_20A5BFF1C((uint64_t)v13, 0, v36, (uint64_t)&v40, 0, 0, (uint64_t)v39);
        sub_20A592CD4((uint64_t)v39, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
        sub_20A592CD4((uint64_t)&v40, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
        uint64_t v33 = (void (*)(uint64_t))MEMORY[0x263F79E28];
        uint64_t v34 = v36;
      }
      sub_20A888D88(v34, (unint64_t *)&unk_26AC699F0, v33);
    }
    else
    {
      LOBYTE(v40) = 0;
      sub_20A4814C4();
      swift_allocObject();
      uint64_t v28 = sub_20A8C6580();
    }
    sub_20A481BD0((uint64_t)v13, type metadata accessor for StocksActivity);
  }
  else
  {
    sub_20A8CE9E0();
    sub_20A592C14(0, (unint64_t *)&qword_26AC80130, (unint64_t *)&qword_26AC80160, MEMORY[0x263F8E9C8], MEMORY[0x263F8E0F8]);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_20A8D3DC0;
    id v23 = objc_msgSend(a1, sel_activityType);
    uint64_t v24 = sub_20A8CE280();
    uint64_t v26 = v25;

    *(void *)(v22 + 56) = MEMORY[0x263F8D310];
    *(void *)(v22 + 64) = sub_20A43F830();
    *(void *)(v22 + 32) = v24;
    *(void *)(v22 + 40) = v26;
    sub_20A43F884();
    uint64_t v27 = (void *)sub_20A8CF180();
    sub_20A8C7D90();
    swift_bridgeObjectRelease();

    LOBYTE(v40) = 0;
    sub_20A4814C4();
    swift_allocObject();
    return sub_20A8C6580();
  }
  return v28;
}

uint64_t sub_20A888958(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StocksActivity(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A480E14(a1, (uint64_t)v4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = 1;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_20A600FA0();
      uint64_t v9 = &v4[*(int *)(v8 + 48)];
      uint64_t v10 = sub_20A8CA180();
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
      uint64_t v7 = (uint64_t (*)(void))type metadata accessor for ForYouSectionDescriptor;
      goto LABEL_3;
    case 4:
      sub_20A481BD0((uint64_t)v4, type metadata accessor for StocksActivity);
      return 0;
    case 11:
      sub_20A4B2908();
      swift_release();
      sub_20A888D88((uint64_t)v4, (unint64_t *)&qword_26AC68FD0, MEMORY[0x263F7AF08]);
      return 1;
    case 13:
      return result;
    default:
      uint64_t v7 = type metadata accessor for StocksActivity;
LABEL_3:
      sub_20A481BD0((uint64_t)v4, v7);
      return 1;
  }
}

uint64_t sub_20A888B28()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_navigator;
  sub_20A4F6AEC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_featureAvailability);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8StocksUI27StocksV2UserActivityHandler_resolver);

  return swift_deallocClassInstance();
}

uint64_t sub_20A888C00()
{
  return type metadata accessor for StocksV2UserActivityHandler();
}

uint64_t type metadata accessor for StocksV2UserActivityHandler()
{
  uint64_t result = qword_26AC6C1B0;
  if (!qword_26AC6C1B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A888C54()
{
  sub_20A4F6AEC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_20A888D10(void *a1)
{
  return sub_20A88818C(a1);
}

void sub_20A888D34(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_20A8CF1B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_20A888D88(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_20A888D34(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t *sub_20A888DE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_20A497708();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_20A888EC0(uint64_t a1)
{
  sub_20A497708();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();

  return swift_release();
}

uint64_t sub_20A888F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A497708();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20A888FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A497708();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20A889078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A497708();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_20A8890FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A497708();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_20A889194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8891A8);
}

uint64_t sub_20A8891A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A497708();
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

uint64_t sub_20A889268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A88927C);
}

void sub_20A88927C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_20A497708();
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

uint64_t type metadata accessor for NewsStockFeedGroupKnobs()
{
  uint64_t result = qword_26AC74BF8;
  if (!qword_26AC74BF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A889384()
{
  sub_20A497708();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_20A889420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  sub_20A889C80();
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A497708();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A889CD8(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) == 1)
  {
    type metadata accessor for StockFeedServiceConfig();
    sub_20A889E50(&qword_26AC73FD0, (void (*)(uint64_t))type metadata accessor for StockFeedServiceConfig);
    sub_20A8CC890();
    sub_20A889D3C((uint64_t)v10);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(a4, v15, v12);
  }
  else
  {
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v16(v15, v10, v12);
    v16(a4, v15, v12);
  }
  if (!a2)
  {
    uint64_t v20 = 6;
    sub_20A567920();
    swift_allocObject();
    a2 = sub_20A8CCC00();
  }
  uint64_t v17 = type metadata accessor for NewsStockFeedGroupKnobs();
  *(void *)&a4[*(int *)(v17 + 20)] = a2;
  if (!a3)
  {
    uint64_t v20 = 1000;
    sub_20A567920();
    swift_allocObject();
    a3 = sub_20A8CCC00();
  }
  uint64_t result = sub_20A889D3C(a1);
  *(void *)&a4[*(int *)(v17 + 24)] = a3;
  return result;
}

uint64_t sub_20A8896D8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  sub_20A889C80();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A889DEC(0, &qword_26763E780, MEMORY[0x263F8E040]);
  uint64_t v9 = v8;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v13 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A889D98();
  sub_20A8CF8E0();
  if (!v2)
  {
    sub_20A497708();
    LOBYTE(v17) = 0;
    sub_20A889E50(&qword_26763E790, (void (*)(uint64_t))sub_20A497708);
    sub_20A8CF5C0();
    sub_20A567920();
    LOBYTE(v16) = 1;
    sub_20A889E50(&qword_26AC6B0F8, (void (*)(uint64_t))sub_20A567920);
    sub_20A8CF5C0();
    uint64_t v13 = v17;
    char v15 = 2;
    sub_20A8CF5C0();
    sub_20A889420((uint64_t)v7, v13, v16, a2);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v9);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_20A889974(void *a1)
{
  uint64_t v3 = v1;
  sub_20A889DEC(0, &qword_26763E798, MEMORY[0x263F8E0C0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A889D98();
  sub_20A8CF8F0();
  LOBYTE(v14) = 0;
  sub_20A497708();
  sub_20A889E50(&qword_26763E7A0, (void (*)(uint64_t))sub_20A497708);
  sub_20A8CF6E0();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for NewsStockFeedGroupKnobs();
    uint64_t v14 = *(void *)(v3 + *(int *)(v10 + 20));
    char v13 = 1;
    sub_20A567920();
    sub_20A889E50(&qword_26763BD38, (void (*)(uint64_t))sub_20A567920);
    sub_20A8CF6E0();
    uint64_t v14 = *(void *)(v3 + *(int *)(v10 + 24));
    char v13 = 2;
    sub_20A8CF6E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_20A889BD8(uint64_t a1)
{
  unint64_t v2 = sub_20A889D98();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A889C14(uint64_t a1)
{
  unint64_t v2 = sub_20A889D98();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_20A889C50@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_20A8896D8(a1, a2);
}

uint64_t sub_20A889C68(void *a1)
{
  return sub_20A889974(a1);
}

void sub_20A889C80()
{
  if (!qword_26AC6B020)
  {
    sub_20A497708();
    unint64_t v0 = sub_20A8CF1B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC6B020);
    }
  }
}

uint64_t sub_20A889CD8(uint64_t a1, uint64_t a2)
{
  sub_20A889C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A889D3C(uint64_t a1)
{
  sub_20A889C80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20A889D98()
{
  unint64_t result = qword_26763E788;
  if (!qword_26763E788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E788);
  }
  return result;
}

void sub_20A889DEC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_20A889D98();
    unint64_t v7 = a3(a1, &type metadata for NewsStockFeedGroupKnobs.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_20A889E50(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for NewsStockFeedGroupKnobs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A889F64);
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

ValueMetadata *type metadata accessor for NewsStockFeedGroupKnobs.CodingKeys()
{
  return &type metadata for NewsStockFeedGroupKnobs.CodingKeys;
}

unint64_t sub_20A889FA0()
{
  unint64_t result = qword_26763E7A8;
  if (!qword_26763E7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E7A8);
  }
  return result;
}

unint64_t sub_20A889FF8()
{
  unint64_t result = qword_26763E7B0;
  if (!qword_26763E7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E7B0);
  }
  return result;
}

unint64_t sub_20A88A050()
{
  unint64_t result = qword_26763E7B8;
  if (!qword_26763E7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E7B8);
  }
  return result;
}

uint64_t type metadata accessor for StockFeedViewerRouter()
{
  return self;
}

ValueMetadata *type metadata accessor for ArticleOfflineModel()
{
  return &type metadata for ArticleOfflineModel;
}

uint64_t sub_20A88A0D8()
{
  uint64_t v0 = sub_20A8CD2C0();
  __swift_allocate_value_buffer(v0, qword_2676531A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2676531A0);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v4 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0x800000020A913480);
  sub_20A8C2370();

  sub_20A8594D8();
  uint64_t v5 = sub_20A8CD2A0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v6 + 104))(v8 + v7, *MEMORY[0x263F59BA8], v5);
  return sub_20A8CD250();
}

uint64_t sub_20A88A32C()
{
  uint64_t v0 = sub_20A8CD2C0();
  __swift_allocate_value_buffer(v0, qword_2676531B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2676531B8);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v4 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0x800000020A9133A0);
  sub_20A8C2370();

  return sub_20A8CD250();
}

uint64_t sub_20A88A4D0()
{
  uint64_t v0 = sub_20A8CD2C0();
  __swift_allocate_value_buffer(v0, qword_2676531D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2676531D0);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v4 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0x800000020A9132C0);
  sub_20A8C2370();

  sub_20A8594D8();
  uint64_t v5 = sub_20A8CD2A0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v6 + 104))(v8 + v7, *MEMORY[0x263F59BA8], v5);
  return sub_20A8CD250();
}

uint64_t sub_20A88A724()
{
  uint64_t v0 = sub_20A8CD2C0();
  __swift_allocate_value_buffer(v0, qword_2676531E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2676531E8);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v4 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0x800000020A913200);
  sub_20A8C2370();

  return sub_20A8CD250();
}

uint64_t sub_20A88A8C4@<X0>(uint64_t a1@<X8>)
{
  return sub_20A499C68(&qword_267639CE0, (uint64_t)qword_2676531A0, a1);
}

uint64_t sub_20A88A8E8@<X0>(uint64_t a1@<X8>)
{
  return sub_20A499C68(&qword_267639CE8, (uint64_t)qword_2676531B8, a1);
}

uint64_t sub_20A88A90C@<X0>(uint64_t a1@<X8>)
{
  return sub_20A499C68(&qword_267639CF0, (uint64_t)qword_2676531D0, a1);
}

uint64_t sub_20A88A930@<X0>(uint64_t a1@<X8>)
{
  return sub_20A499C68(qword_267639CF8, (uint64_t)qword_2676531E8, a1);
}

uint64_t type metadata accessor for StockChartCalloutRenderer()
{
  return self;
}

void *sub_20A88A978(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    char v15 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_20A8C3F00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    unint64_t v7 = (int *)type metadata accessor for StockViewModel();
    uint64_t v8 = v7[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_20A8C3E10();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_20A501660(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = v7[6];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = (int *)type metadata accessor for StockSparklineViewModel(0);
    uint64_t v20 = *((void *)v19 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
    {
      sub_20A501660(0, &qword_26AC754A0, (void (*)(uint64_t))type metadata accessor for StockSparklineViewModel);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_20A8CDCD0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v17, v18, v22);
      uint64_t v23 = v19[5];
      uint64_t v24 = &v17[v23];
      uint64_t v25 = &v18[v23];
      *(void *)uint64_t v24 = *(void *)v25;
      v24[8] = v25[8];
      uint64_t v26 = v19[6];
      uint64_t v27 = &v17[v26];
      uint64_t v28 = &v18[v26];
      *(void *)uint64_t v27 = *(void *)v28;
      v27[8] = v28[8];
      v17[v19[7]] = v18[v19[7]];
      uint64_t v29 = v19[8];
      char v30 = &v17[v29];
      id v31 = &v18[v29];
      uint64_t v32 = sub_20A8C3D00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
      (*(void (**)(char *, void, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
    }
    uint64_t v33 = v7[7];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    *(void *)uint64_t v34 = *(void *)((char *)a2 + v33);
    v34[8] = *((unsigned char *)a2 + v33 + 8);
    *((void *)v34 + 2) = *(void *)((char *)a2 + v33 + 16);
    v34[24] = *((unsigned char *)a2 + v33 + 24);
    *((void *)v34 + 4) = *(void *)((char *)a2 + v33 + 32);
    v34[40] = *((unsigned char *)a2 + v33 + 40);
    uint64_t v36 = *(void *)((char *)a2 + v33 + 56);
    *((void *)v34 + 6) = *(void *)((char *)a2 + v33 + 48);
    *((void *)v34 + 7) = v36;
    uint64_t v37 = *(void *)((char *)a2 + v33 + 72);
    *((void *)v34 + 8) = *(void *)((char *)a2 + v33 + 64);
    *((void *)v34 + 9) = v37;
    uint64_t v38 = (int *)type metadata accessor for PriceViewModel();
    uint64_t v39 = v38[9];
    uint64_t v67 = &v34[v39];
    long long v40 = &v35[v39];
    uint64_t v68 = a2;
    uint64_t v69 = v7;
    uint64_t v41 = sub_20A8C2EB0();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
    char v15 = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42(v67, v40, v41);
    uint64_t v43 = v38[10];
    uint64_t v44 = &v34[v43];
    uint64_t v45 = &v35[v43];
    uint64_t v46 = sub_20A8C4030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    uint64_t v47 = v38[11];
    uint64_t v48 = &v34[v47];
    v49 = &v35[v47];
    uint64_t v50 = sub_20A8C2990();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
    uint64_t v51 = v69[8];
    v52 = (char *)a1 + v51;
    uint64_t v53 = (char *)v68 + v51;
    uint64_t v54 = sub_20A8C3410();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
    *((unsigned char *)a1 + v69[9]) = *((unsigned char *)v68 + v69[9]);
    sub_20A747970();
    uint64_t v56 = *(int *)(v55 + 48);
    id v57 = (char *)a1 + v56;
    id v58 = (char *)v68 + v56;
    long long v59 = *((_OWORD *)v58 + 1);
    *(_OWORD *)id v57 = *(_OWORD *)v58;
    *((_OWORD *)v57 + 1) = v59;
    long long v60 = *((_OWORD *)v58 + 3);
    *((_OWORD *)v57 + 2) = *((_OWORD *)v58 + 2);
    *((_OWORD *)v57 + 3) = v60;
    long long v61 = *((_OWORD *)v58 + 5);
    *((_OWORD *)v57 + 4) = *((_OWORD *)v58 + 4);
    *((_OWORD *)v57 + 5) = v61;
    long long v62 = *((_OWORD *)v58 + 7);
    *((_OWORD *)v57 + 6) = *((_OWORD *)v58 + 6);
    *((_OWORD *)v57 + 7) = v62;
    long long v63 = *((_OWORD *)v58 + 9);
    *((_OWORD *)v57 + 8) = *((_OWORD *)v58 + 8);
    *((_OWORD *)v57 + 9) = v63;
    v64 = (void *)*((void *)v58 + 20);
    if (v64 == (void *)1)
    {
      *((void *)v57 + 20) = 1;
    }
    else
    {
      *((void *)v57 + 20) = v64;
      id v65 = v64;
    }
  }
  return v15;
}

void sub_20A88AEF8(uint64_t a1)
{
  uint64_t v2 = sub_20A8C3F00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  id v3 = (int *)type metadata accessor for StockViewModel();
  uint64_t v4 = a1 + v3[5];
  uint64_t v5 = sub_20A8C3E10();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + v3[6];
  uint64_t v8 = type metadata accessor for StockSparklineViewModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    uint64_t v9 = sub_20A8CDCD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    uint64_t v10 = v7 + *(int *)(v8 + 32);
    uint64_t v11 = sub_20A8C3D00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  uint64_t v12 = a1 + v3[7];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v14 = v12 + v13[9];
  uint64_t v15 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = v12 + v13[10];
  uint64_t v17 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  uint64_t v18 = v12 + v13[11];
  uint64_t v19 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  uint64_t v20 = a1 + v3[8];
  uint64_t v21 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  sub_20A747970();
  uint64_t v23 = *(void **)(a1 + *(int *)(v22 + 48) + 160);
  if (v23 != (void *)1)
  {
  }
}

uint64_t sub_20A88B210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for StockViewModel();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_20A8C3E10();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_20A501660(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = v5[6];
  uint64_t v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = (int *)type metadata accessor for StockSparklineViewModel(0);
  uint64_t v16 = *((void *)v15 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
  {
    sub_20A501660(0, &qword_26AC754A0, (void (*)(uint64_t))type metadata accessor for StockSparklineViewModel);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = sub_20A8CDCD0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v13, v14, v18);
    uint64_t v19 = v15[5];
    uint64_t v20 = &v13[v19];
    uint64_t v21 = &v14[v19];
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = v15[6];
    uint64_t v23 = &v13[v22];
    uint64_t v24 = &v14[v22];
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    v13[v15[7]] = v14[v15[7]];
    uint64_t v25 = v15[8];
    uint64_t v26 = &v13[v25];
    uint64_t v27 = &v14[v25];
    uint64_t v28 = sub_20A8C3D00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    (*(void (**)(char *, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v29 = v5[7];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(void *)uint64_t v30 = *(void *)(a2 + v29);
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(a2 + v29 + 8);
  *(void *)(v30 + 16) = *(void *)(a2 + v29 + 16);
  *(unsigned char *)(v30 + 24) = *(unsigned char *)(a2 + v29 + 24);
  *(void *)(v30 + 32) = *(void *)(a2 + v29 + 32);
  *(unsigned char *)(v30 + 40) = *(unsigned char *)(a2 + v29 + 40);
  uint64_t v32 = *(void *)(a2 + v29 + 56);
  *(void *)(v30 + 48) = *(void *)(a2 + v29 + 48);
  *(void *)(v30 + 56) = v32;
  uint64_t v33 = *(void *)(a2 + v29 + 72);
  *(void *)(v30 + 64) = *(void *)(a2 + v29 + 64);
  *(void *)(v30 + 72) = v33;
  uint64_t v34 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v35 = v34[9];
  uint64_t v63 = v30 + v35;
  uint64_t v36 = v31 + v35;
  uint64_t v64 = a2;
  id v65 = v5;
  uint64_t v37 = sub_20A8C2EB0();
  uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v38(v63, v36, v37);
  uint64_t v39 = v34[10];
  uint64_t v40 = v30 + v39;
  uint64_t v41 = v31 + v39;
  uint64_t v42 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
  uint64_t v43 = v34[11];
  uint64_t v44 = v30 + v43;
  uint64_t v45 = v31 + v43;
  uint64_t v46 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
  uint64_t v47 = v65[8];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = v64 + v47;
  uint64_t v50 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
  *(unsigned char *)(a1 + v65[9]) = *(unsigned char *)(v64 + v65[9]);
  sub_20A747970();
  uint64_t v52 = *(int *)(v51 + 48);
  uint64_t v53 = a1 + v52;
  uint64_t v54 = v64 + v52;
  long long v55 = *(_OWORD *)(v54 + 16);
  *(_OWORD *)uint64_t v53 = *(_OWORD *)v54;
  *(_OWORD *)(v53 + 16) = v55;
  long long v56 = *(_OWORD *)(v54 + 48);
  *(_OWORD *)(v53 + 32) = *(_OWORD *)(v54 + 32);
  *(_OWORD *)(v53 + 48) = v56;
  long long v57 = *(_OWORD *)(v54 + 80);
  *(_OWORD *)(v53 + 64) = *(_OWORD *)(v54 + 64);
  *(_OWORD *)(v53 + 80) = v57;
  long long v58 = *(_OWORD *)(v54 + 112);
  *(_OWORD *)(v53 + 96) = *(_OWORD *)(v54 + 96);
  *(_OWORD *)(v53 + 112) = v58;
  long long v59 = *(_OWORD *)(v54 + 144);
  *(_OWORD *)(v53 + 128) = *(_OWORD *)(v54 + 128);
  *(_OWORD *)(v53 + 144) = v59;
  long long v60 = *(void **)(v54 + 160);
  if (v60 != (void *)1) {
    id v61 = v60;
  }
  *(void *)(v53 + 160) = v60;
  return a1;
}

uint64_t sub_20A88B73C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for StockViewModel();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_20A8C3E10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_20A501660(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = v5[6];
  uint64_t v16 = (unsigned char *)(a1 + v15);
  uint64_t v17 = (unsigned char *)(a2 + v15);
  uint64_t v18 = (int *)type metadata accessor for StockSparklineViewModel(0);
  uint64_t v19 = *((void *)v18 - 1);
  uint64_t v20 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = sub_20A8CDCD0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 16))(v16, v17, v23);
      uint64_t v24 = v18[5];
      uint64_t v25 = &v16[v24];
      uint64_t v26 = &v17[v24];
      uint64_t v27 = *(void *)v26;
      v25[8] = v26[8];
      *(void *)uint64_t v25 = v27;
      uint64_t v28 = v18[6];
      uint64_t v29 = &v16[v28];
      uint64_t v30 = &v17[v28];
      LOBYTE(v27) = v30[8];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v27;
      v16[v18[7]] = v17[v18[7]];
      uint64_t v31 = v18[8];
      uint64_t v32 = &v16[v31];
      uint64_t v33 = &v17[v31];
      uint64_t v34 = sub_20A8C3D00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    sub_20A6981E8((uint64_t)v16, type metadata accessor for StockSparklineViewModel);
LABEL_12:
    sub_20A501660(0, &qword_26AC754A0, (void (*)(uint64_t))type metadata accessor for StockSparklineViewModel);
    memcpy(v16, v17, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v69 = sub_20A8CDCD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v69 - 8) + 24))(v16, v17, v69);
  uint64_t v70 = v18[5];
  id v71 = &v16[v70];
  unint64_t v72 = &v17[v70];
  uint64_t v73 = *(void *)v72;
  v71[8] = v72[8];
  *(void *)id v71 = v73;
  uint64_t v74 = v18[6];
  v75 = &v16[v74];
  v76 = &v17[v74];
  LOBYTE(v73) = v76[8];
  *(void *)v75 = *(void *)v76;
  v75[8] = v73;
  v16[v18[7]] = v17[v18[7]];
  uint64_t v77 = v18[8];
  v78 = &v16[v77];
  v79 = &v17[v77];
  uint64_t v80 = sub_20A8C3D00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 24))(v78, v79, v80);
LABEL_13:
  uint64_t v36 = v5[7];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void *)(a2 + v36);
  *(unsigned char *)(v37 + 8) = *(unsigned char *)(v38 + 8);
  *(void *)uint64_t v37 = v39;
  uint64_t v40 = *(void *)(v38 + 16);
  *(unsigned char *)(v37 + 24) = *(unsigned char *)(v38 + 24);
  *(void *)(v37 + 16) = v40;
  uint64_t v41 = *(void *)(v38 + 32);
  *(unsigned char *)(v37 + 40) = *(unsigned char *)(v38 + 40);
  *(void *)(v37 + 32) = v41;
  *(void *)(v37 + 48) = *(void *)(v38 + 48);
  *(void *)(v37 + 56) = *(void *)(v38 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v37 + 64) = *(void *)(v38 + 64);
  *(void *)(v37 + 72) = *(void *)(v38 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v43 = v42[9];
  uint64_t v44 = v37 + v43;
  uint64_t v45 = v38 + v43;
  uint64_t v46 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
  uint64_t v47 = v42[10];
  uint64_t v48 = v37 + v47;
  uint64_t v49 = v38 + v47;
  uint64_t v50 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 24))(v48, v49, v50);
  uint64_t v51 = v42[11];
  uint64_t v52 = v37 + v51;
  uint64_t v53 = v38 + v51;
  uint64_t v54 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 24))(v52, v53, v54);
  uint64_t v55 = v5[8];
  uint64_t v56 = a1 + v55;
  uint64_t v57 = a2 + v55;
  uint64_t v58 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 24))(v56, v57, v58);
  *(unsigned char *)(a1 + v5[9]) = *(unsigned char *)(a2 + v5[9]);
  sub_20A747970();
  uint64_t v60 = *(int *)(v59 + 48);
  id v61 = (void *)(a1 + v60);
  long long v62 = (void *)(a2 + v60);
  void *v61 = *v62;
  v61[1] = v62[1];
  v61[2] = v62[2];
  v61[3] = v62[3];
  v61[4] = v62[4];
  v61[5] = v62[5];
  v61[6] = v62[6];
  v61[7] = v62[7];
  v61[8] = v62[8];
  v61[9] = v62[9];
  v61[10] = v62[10];
  v61[11] = v62[11];
  v61[12] = v62[12];
  v61[13] = v62[13];
  v61[14] = v62[14];
  v61[15] = v62[15];
  v61[16] = v62[16];
  v61[17] = v62[17];
  v61[18] = v62[18];
  v61[19] = v62[19];
  uint64_t v63 = (void **)(a1 + v60 + 160);
  uint64_t v64 = *v63;
  id v65 = (void *)v62[20];
  if (*v63 != (void *)1)
  {
    if (v65 != (void *)1)
    {
      char *v63 = v65;
      id v67 = v65;

      return a1;
    }
    sub_20A5A2320((uint64_t)v63);
    id v65 = (void *)v62[20];
    goto LABEL_18;
  }
  if (v65 == (void *)1)
  {
LABEL_18:
    char *v63 = v65;
    return a1;
  }
  char *v63 = v65;
  id v66 = v65;
  return a1;
}

uint64_t sub_20A88BE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for StockViewModel();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_20A8C3E10();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_20A501660(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = v5[6];
  int v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = (int *)type metadata accessor for StockSparklineViewModel(0);
  uint64_t v16 = *((void *)v15 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
  {
    sub_20A501660(0, &qword_26AC754A0, (void (*)(uint64_t))type metadata accessor for StockSparklineViewModel);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = sub_20A8CDCD0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v13, v14, v18);
    uint64_t v19 = v15[5];
    uint64_t v20 = &v13[v19];
    int v21 = &v14[v19];
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = v15[6];
    uint64_t v23 = &v13[v22];
    uint64_t v24 = &v14[v22];
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    v13[v15[7]] = v14[v15[7]];
    uint64_t v25 = v15[8];
    uint64_t v26 = &v13[v25];
    uint64_t v27 = &v14[v25];
    uint64_t v28 = sub_20A8C3D00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
    (*(void (**)(char *, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v29 = v5[7];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(void *)uint64_t v30 = *(void *)(a2 + v29);
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(a2 + v29 + 8);
  *(void *)(v30 + 16) = *(void *)(a2 + v29 + 16);
  *(unsigned char *)(v30 + 24) = *(unsigned char *)(a2 + v29 + 24);
  *(void *)(v30 + 32) = *(void *)(a2 + v29 + 32);
  *(unsigned char *)(v30 + 40) = *(unsigned char *)(a2 + v29 + 40);
  long long v32 = *(_OWORD *)(a2 + v29 + 64);
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a2 + v29 + 48);
  *(_OWORD *)(v30 + 64) = v32;
  uint64_t v33 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v34 = v33[9];
  uint64_t v35 = v30 + v34;
  uint64_t v36 = v31 + v34;
  uint64_t v37 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
  uint64_t v38 = v33[10];
  uint64_t v39 = v30 + v38;
  uint64_t v40 = v31 + v38;
  uint64_t v41 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
  uint64_t v42 = v33[11];
  uint64_t v43 = v30 + v42;
  uint64_t v44 = v31 + v42;
  uint64_t v45 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
  uint64_t v46 = v5[8];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
  *(unsigned char *)(a1 + v5[9]) = *(unsigned char *)(a2 + v5[9]);
  sub_20A747970();
  uint64_t v51 = *(int *)(v50 + 48);
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  long long v54 = *(_OWORD *)(v53 + 144);
  *(_OWORD *)(v52 + 128) = *(_OWORD *)(v53 + 128);
  *(_OWORD *)(v52 + 144) = v54;
  *(void *)(v52 + 160) = *(void *)(v53 + 160);
  long long v55 = *(_OWORD *)(v53 + 80);
  *(_OWORD *)(v52 + 64) = *(_OWORD *)(v53 + 64);
  *(_OWORD *)(v52 + 80) = v55;
  long long v56 = *(_OWORD *)(v53 + 112);
  *(_OWORD *)(v52 + 96) = *(_OWORD *)(v53 + 96);
  *(_OWORD *)(v52 + 112) = v56;
  long long v57 = *(_OWORD *)(v53 + 16);
  *(_OWORD *)uint64_t v52 = *(_OWORD *)v53;
  *(_OWORD *)(v52 + 16) = v57;
  long long v58 = *(_OWORD *)(v53 + 48);
  *(_OWORD *)(v52 + 32) = *(_OWORD *)(v53 + 32);
  *(_OWORD *)(v52 + 48) = v58;
  return a1;
}

uint64_t sub_20A88C368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = (int *)type metadata accessor for StockViewModel();
  uint64_t v6 = v5[5];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_20A8C3E10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_20A501660(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = v5[6];
  uint64_t v16 = (unsigned char *)(a1 + v15);
  uint64_t v17 = (unsigned char *)(a2 + v15);
  uint64_t v18 = (int *)type metadata accessor for StockSparklineViewModel(0);
  uint64_t v19 = *((void *)v18 - 1);
  uint64_t v20 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      uint64_t v23 = sub_20A8CDCD0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v16, v17, v23);
      uint64_t v24 = v18[5];
      uint64_t v25 = &v16[v24];
      uint64_t v26 = &v17[v24];
      *(void *)uint64_t v25 = *(void *)v26;
      v25[8] = v26[8];
      uint64_t v27 = v18[6];
      uint64_t v28 = &v16[v27];
      uint64_t v29 = &v17[v27];
      *(void *)uint64_t v28 = *(void *)v29;
      v28[8] = v29[8];
      v16[v18[7]] = v17[v18[7]];
      uint64_t v30 = v18[8];
      uint64_t v31 = &v16[v30];
      long long v32 = &v17[v30];
      uint64_t v33 = sub_20A8C3D00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    sub_20A6981E8((uint64_t)v16, type metadata accessor for StockSparklineViewModel);
LABEL_12:
    sub_20A501660(0, &qword_26AC754A0, (void (*)(uint64_t))type metadata accessor for StockSparklineViewModel);
    memcpy(v16, v17, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v71 = sub_20A8CDCD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v71 - 8) + 40))(v16, v17, v71);
  uint64_t v72 = v18[5];
  uint64_t v73 = &v16[v72];
  uint64_t v74 = &v17[v72];
  *(void *)uint64_t v73 = *(void *)v74;
  v73[8] = v74[8];
  uint64_t v75 = v18[6];
  v76 = &v16[v75];
  uint64_t v77 = &v17[v75];
  *(void *)v76 = *(void *)v77;
  v76[8] = v77[8];
  v16[v18[7]] = v17[v18[7]];
  uint64_t v78 = v18[8];
  v79 = &v16[v78];
  uint64_t v80 = &v17[v78];
  uint64_t v81 = sub_20A8C3D00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v81 - 8) + 40))(v79, v80, v81);
LABEL_13:
  uint64_t v35 = v5[7];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(void *)uint64_t v36 = *(void *)(a2 + v35);
  *(unsigned char *)(v36 + 8) = *(unsigned char *)(a2 + v35 + 8);
  *(void *)(v36 + 16) = *(void *)(a2 + v35 + 16);
  *(unsigned char *)(v36 + 24) = *(unsigned char *)(a2 + v35 + 24);
  *(void *)(v36 + 32) = *(void *)(a2 + v35 + 32);
  *(unsigned char *)(v36 + 40) = *(unsigned char *)(a2 + v35 + 40);
  uint64_t v38 = *(void *)(a2 + v35 + 56);
  *(void *)(v36 + 48) = *(void *)(a2 + v35 + 48);
  *(void *)(v36 + 56) = v38;
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void *)(v37 + 72);
  *(void *)(v36 + 64) = *(void *)(v37 + 64);
  *(void *)(v36 + 72) = v39;
  swift_bridgeObjectRelease();
  uint64_t v40 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v41 = v40[9];
  uint64_t v42 = v36 + v41;
  uint64_t v43 = v37 + v41;
  uint64_t v44 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 40))(v42, v43, v44);
  uint64_t v45 = v40[10];
  uint64_t v46 = v36 + v45;
  uint64_t v47 = v37 + v45;
  uint64_t v48 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 40))(v46, v47, v48);
  uint64_t v49 = v40[11];
  uint64_t v50 = v36 + v49;
  uint64_t v51 = v37 + v49;
  uint64_t v52 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 40))(v50, v51, v52);
  uint64_t v53 = v5[8];
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  *(unsigned char *)(a1 + v5[9]) = *(unsigned char *)(a2 + v5[9]);
  sub_20A747970();
  uint64_t v58 = *(int *)(v57 + 48);
  uint64_t v59 = (_OWORD *)(a1 + v58);
  uint64_t v60 = a2 + v58;
  long long v61 = *(_OWORD *)(v60 + 16);
  *uint64_t v59 = *(_OWORD *)v60;
  v59[1] = v61;
  long long v62 = *(_OWORD *)(v60 + 48);
  v59[2] = *(_OWORD *)(v60 + 32);
  v59[3] = v62;
  long long v63 = *(_OWORD *)(v60 + 80);
  v59[4] = *(_OWORD *)(v60 + 64);
  v59[5] = v63;
  long long v64 = *(_OWORD *)(v60 + 112);
  v59[6] = *(_OWORD *)(v60 + 96);
  v59[7] = v64;
  id v66 = (uint64_t *)(a1 + v58 + 160);
  id v65 = (void *)*v66;
  long long v67 = *(_OWORD *)(v60 + 144);
  *((_OWORD *)v66 - 2) = *(_OWORD *)(v60 + 128);
  *((_OWORD *)v66 - 1) = v67;
  uint64_t v68 = *(void *)(v60 + 160);
  if (v65 == (void *)1)
  {
    if (v68 != 1)
    {
      *id v66 = v68;
      return a1;
    }
    uint64_t v69 = 1;
  }
  else
  {
    if (v68 != 1)
    {
      *id v66 = v68;

      return a1;
    }
    sub_20A5A2320((uint64_t)v66);
    uint64_t v69 = *(void *)(v60 + 160);
  }
  *id v66 = v69;
  return a1;
}

uint64_t sub_20A88CA18(uint64_t a1, uint64_t a2)
{
  sub_20A747970();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_20A88CA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A747970();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, a2, a3, v6);
}

uint64_t type metadata accessor for TickerLayoutModel()
{
  uint64_t result = qword_26AC6FF60;
  if (!qword_26AC6FF60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A88CB4C(uint64_t a1)
{
  uint64_t result = type metadata accessor for StockViewModel();
  if (v3 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = v4;
  }
  return result;
}

double sub_20A88CC08(uint64_t a1)
{
  MEMORY[0x270FA5388](a1 - 8);
  unint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A88CD8C(v1, (uint64_t)v3);
  sub_20A747970();
  uint64_t v5 = &v3[*(int *)(v4 + 48)];
  long long v6 = *((_OWORD *)v5 + 9);
  v13[8] = *((_OWORD *)v5 + 8);
  v13[9] = v6;
  uint64_t v14 = *((void *)v5 + 20);
  long long v7 = *((_OWORD *)v5 + 5);
  v13[4] = *((_OWORD *)v5 + 4);
  v13[5] = v7;
  long long v8 = *((_OWORD *)v5 + 7);
  v13[6] = *((_OWORD *)v5 + 6);
  v13[7] = v8;
  long long v9 = *((_OWORD *)v5 + 1);
  v13[0] = *(_OWORD *)v5;
  v13[1] = v9;
  long long v10 = *((_OWORD *)v5 + 3);
  v13[2] = *((_OWORD *)v5 + 2);
  v13[3] = v10;
  sub_20A4CB210((uint64_t)v13);
  double v11 = *(double *)v13;
  sub_20A6981E8((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for StockViewModel);
  return v11;
}

uint64_t sub_20A88CD00()
{
  sub_20A88CDF0(&qword_26AC6FF58);

  return sub_20A8CACE0();
}

uint64_t sub_20A88CD58()
{
  return sub_20A88CDF0(&qword_26AC6FF50);
}

uint64_t sub_20A88CD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TickerLayoutModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A88CDF0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TickerLayoutModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for BilingualFeedPromptViewLayoutAttributes()
{
  return &type metadata for BilingualFeedPromptViewLayoutAttributes;
}

uint64_t sub_20A88CE44()
{
  sub_20A88CED8();

  return sub_20A8CACE0();
}

unint64_t sub_20A88CE84()
{
  unint64_t result = qword_26763E7C0;
  if (!qword_26763E7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E7C0);
  }
  return result;
}

unint64_t sub_20A88CED8()
{
  unint64_t result = qword_26763E7C8;
  if (!qword_26763E7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E7C8);
  }
  return result;
}

void destroy for StockChartRangeCalloutLayoutAttributes(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
}

uint64_t initializeWithCopy for StockChartRangeCalloutLayoutAttributes(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v4;
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  long long v6 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  return a1;
}

uint64_t assignWithCopy for StockChartRangeCalloutLayoutAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  id v7 = *(void **)(a2 + 40);
  id v8 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v7;
  id v9 = v7;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v10 = *(void **)(a2 + 80);
  double v11 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v10;
  id v12 = v10;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for StockChartRangeCalloutLayoutAttributes(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  long long v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  long long v7 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for StockChartRangeCalloutLayoutAttributes(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StockChartRangeCalloutLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StockChartRangeCalloutLayoutAttributes()
{
  return &type metadata for StockChartRangeCalloutLayoutAttributes;
}

ValueMetadata *type metadata accessor for StockChartCalloutViewOptions()
{
  return &type metadata for StockChartCalloutViewOptions;
}

uint64_t dispatch thunk of StockChartCalloutViewProviderType.view(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of StockChartCalloutViewProviderType.present(_:on:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_20A88D24C(uint64_t a1, char *a2, long long *a3)
{
  uint64_t v7 = type metadata accessor for StockChartCalloutLayoutOptions();
  id v8 = (int *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = &v39[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  long long v38 = *a3;
  uint64_t v11 = *((void *)a3 + 2);
  uint64_t v12 = *((void *)a3 + 3);
  objc_msgSend(a2, sel_bounds);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = type metadata accessor for StockChartCalloutViewModel(0);
  uint64_t v18 = a1 + *(int *)(v17 + 20);
  uint64_t v19 = &v10[v8[7]];
  uint64_t v20 = sub_20A8C2BC0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v19, v18, v20);
  uint64_t v21 = a1 + *(int *)(v17 + 24);
  int v22 = &v10[v8[8]];
  uint64_t v23 = sub_20A8C2AF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, v21, v23);
  id v24 = objc_msgSend(a2, sel_traitCollection);
  *(void *)long long v10 = v14;
  *((void *)v10 + 1) = v16;
  *(void *)&v10[v8[9]] = v24;
  uint64_t v25 = &v10[v8[10]];
  *(_OWORD *)uint64_t v25 = v38;
  *((void *)v25 + 2) = v11;
  *((void *)v25 + 3) = v12;
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  sub_20A6B6464(a1, (double *)v10, v39);
  sub_20A88D584((uint64_t)v39, (uint64_t)v40);
  if (v40[0])
  {
    double v26 = *(double *)&v40[1];
    double v27 = *(double *)&v40[2];
    double v28 = *(double *)&v40[3];
    double v29 = *(double *)&v40[4];
    uint64_t v30 = v40[5];
    double v31 = *(double *)&v40[6];
    double v32 = *(double *)&v40[7];
    double v33 = *(double *)&v40[8];
    double v34 = *(double *)&v40[9];
    uint64_t v35 = *(void **)&a2[OBJC_IVAR____TtC8StocksUI21StockChartCalloutView_dateLabel];
    objc_msgSend(v35, sel_setAttributedText_);
    objc_msgSend(v35, sel_setAdjustsFontSizeToFitWidth_, 1);
    objc_msgSend(v35, sel_setFrame_, v26, v27, v28, v29);
    uint64_t v36 = *(void **)&a2[OBJC_IVAR____TtC8StocksUI21StockChartCalloutView_priceLabel];
    objc_msgSend(v36, sel_setAttributedText_, v30);
    objc_msgSend(v36, sel_setFrame_, v31, v32, v33, v34);
    sub_20A88D640((uint64_t)v39);
  }
  return sub_20A50E0BC((uint64_t)v10);
}

uint64_t type metadata accessor for StockChartCalloutViewProvider()
{
  return self;
}

id sub_20A88D518()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for StockChartCalloutView());

  return objc_msgSend(v0, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_20A88D560(uint64_t a1, char *a2, long long *a3)
{
  return sub_20A88D24C(a1, a2, a3);
}

uint64_t sub_20A88D584(uint64_t a1, uint64_t a2)
{
  sub_20A88D5E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20A88D5E8()
{
  if (!qword_26763E7D0)
  {
    unint64_t v0 = sub_20A8CF1B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26763E7D0);
    }
  }
}

uint64_t sub_20A88D640(uint64_t a1)
{
  return a1;
}

void sub_20A88D68C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a1)
  {
  }
}

uint64_t type metadata accessor for StocksAudioPlaybackQueue()
{
  return self;
}

uint64_t sub_20A88D6F4()
{
  return swift_retain();
}

__n128 __swift_memcpy232_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[13];
  *(void *)(a1 + 224) = *((void *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for StockSearchCellViewLayoutAttributes(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 232)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StockSearchCellViewLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 232) = v3;
  return result;
}

ValueMetadata *type metadata accessor for StockSearchCellViewLayoutAttributes()
{
  return &type metadata for StockSearchCellViewLayoutAttributes;
}

double sub_20A88D7E0()
{
  return *(double *)(v0 + 32);
}

char *sub_20A88D7E8(double a1, double a2, double a3, double a4)
{
  long long v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_headingLabel;
  id v12 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_subheadingLabel;
  *(void *)&v13[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v15 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_separatorLayer;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E158]), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_premiumSealView;
  *(void *)&v13[v16] = objc_msgSend(objc_allocWithZone((Class)sub_20A8C7960()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v23.receiver = v13;
  v23.super_class = ObjectType;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v23, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v18 = *(void *)&v17[OBJC_IVAR____TtC8StocksUI15ForYouTitleView_headingLabel];
  uint64_t v19 = v17;
  objc_msgSend(v19, sel_addSubview_, v18);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR____TtC8StocksUI15ForYouTitleView_subheadingLabel]);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR____TtC8StocksUI15ForYouTitleView_premiumSealView]);
  id v20 = objc_msgSend(v19, sel_layer);
  id v21 = *(id *)&v19[OBJC_IVAR____TtC8StocksUI15ForYouTitleView_separatorLayer];
  objc_msgSend(v20, sel_addSublayer_, v21);

  return v19;
}

uint64_t type metadata accessor for ForYouTitleView()
{
  return self;
}

void sub_20A88DAB0()
{
  sub_20A88DB70(&qword_26AC6E250);

  JUMPOUT(0x210523C60);
}

double sub_20A88DB08()
{
  objc_msgSend(*v0, sel_frame);

  return CGRectGetMaxY(*(CGRect *)&v1);
}

uint64_t sub_20A88DB3C()
{
  return sub_20A88DB70(&qword_26AC6E248);
}

uint64_t sub_20A88DB70(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ForYouTitleView();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_20A88DBB0()
{
  uint64_t v1 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_headingLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v2 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_subheadingLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v3 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_separatorLayer;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E158]), sel_init);
  uint64_t v4 = OBJC_IVAR____TtC8StocksUI15ForYouTitleView_premiumSealView;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone((Class)sub_20A8C7960()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  sub_20A8CF520();
  __break(1u);
}

uint64_t sub_20A88DCCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v32 = a6;
  uint64_t v31 = a5;
  uint64_t v29 = a4;
  sub_20A890D48(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0]);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v15 = (char *)&v28 - v14;
  sub_20A8911B0(a7, (uint64_t)&v33, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
  uint64_t v30 = a1;
  if (*((void *)&v34 + 1))
  {
    sub_20A42BEBC(&v33, (uint64_t)v35);
    uint64_t v16 = sub_20A480698(v35);
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    if (a2)
    {
LABEL_3:
      *((void *)&v34 + 1) = sub_20A8C4990();
      *(void *)&long long v33 = a2;
      goto LABEL_8;
    }
  }
  else
  {
    sub_20A890EAC((uint64_t)&v33, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
    if (qword_26AC67B18 != -1) {
      swift_once();
    }
    uint64_t v16 = qword_26AC706C8;
    uint64_t v18 = qword_26AC706D0;
    uint64_t v20 = qword_26AC706D8;
    swift_retain();
    sub_20A480ED4(v18);
    if (a2) {
      goto LABEL_3;
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
LABEL_8:
  sub_20A5C0C6C(a3, (uint64_t)v15);
  sub_20A8911B0(v29, (uint64_t)v35, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
  unint64_t v21 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v22 = (v13 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a2;
  sub_20A8913C8((uint64_t)v15, v23 + v21, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28]);
  sub_20A4B2AE0((uint64_t)v35, v23 + v22);
  id v24 = (uint64_t *)(v23 + ((v22 + 47) & 0xFFFFFFFFFFFFFFF8));
  uint64_t *v24 = v16;
  v24[1] = v18;
  v24[2] = v20;
  swift_retain_n();
  swift_retain();
  sub_20A480ED4(v18);
  sub_20A4F6AEC();
  sub_20A89152C(&qword_26AC69D10, (void (*)(uint64_t))sub_20A4F6AEC);
  uint64_t v25 = v35[6];
  sub_20A8CBC90();
  swift_release();
  sub_20A890F1C((uint64_t)&v33, (uint64_t)&qword_26AC80170, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A891574);
  if (v25)
  {
    sub_20A891574(0, (unint64_t *)&qword_26AC698C0, MEMORY[0x263F8D4F8], MEMORY[0x263F7D028]);
    swift_allocObject();
    uint64_t v26 = sub_20A8C6570();
    swift_release();
    sub_20A459CA4(v18);
    return v26;
  }
  else
  {
    sub_20A459CA4(v18);
  }
  return v16;
}

uint64_t sub_20A88E118(uint64_t a1)
{
  uint64_t v186 = sub_20A8C2800();
  uint64_t v185 = *(void *)(v186 - 8);
  MEMORY[0x270FA5388](v186);
  v184 = (char *)v179 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v208 = sub_20A8C5390();
  uint64_t v206 = *(void *)(v208 - 8);
  MEMORY[0x270FA5388](v208);
  v204 = (char *)v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v209 = sub_20A8C4B90();
  uint64_t v207 = *(void *)(v209 - 8);
  MEMORY[0x270FA5388](v209);
  v205 = (char *)v179 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = type metadata accessor for StocksActivity.Article(0);
  MEMORY[0x270FA5388](v213);
  v188 = (void *)((char *)v179 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  v211 = (char *)v179 - v7;
  long long v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A890D48(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  v183 = (char *)v179 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v182 = (char *)v179 - v12;
  MEMORY[0x270FA5388](v13);
  v193 = (char *)v179 - v14;
  MEMORY[0x270FA5388](v15);
  v190 = (char *)v179 - v16;
  MEMORY[0x270FA5388](v17);
  v202 = (char *)v179 - v18;
  uint64_t v215 = type metadata accessor for StocksActivity(0);
  MEMORY[0x270FA5388](v215);
  uint64_t v181 = (uint64_t)v179 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v180 = (uint64_t)v179 - v21;
  MEMORY[0x270FA5388](v22);
  v210 = (char *)v179 - v23;
  MEMORY[0x270FA5388](v24);
  uint64_t v189 = (uint64_t)v179 - v25;
  MEMORY[0x270FA5388](v26);
  uint64_t v201 = (uint64_t)v179 - v27;
  uint64_t v199 = sub_20A8C56A0();
  uint64_t v198 = *(void *)(v199 - 8);
  MEMORY[0x270FA5388](v199);
  v197 = (char *)v179 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A890D48(0, (unint64_t *)&qword_26AC69BD0, MEMORY[0x263F5A0D8], v8);
  MEMORY[0x270FA5388](v29 - 8);
  v196 = (char *)v179 - v30;
  uint64_t v194 = type metadata accessor for CampaignRouteModel();
  MEMORY[0x270FA5388](v194);
  v195 = (char *)v179 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v200 = (uint64_t)v179 - v33;
  uint64_t v221 = sub_20A8C6150();
  v220 = *(char **)(v221 - 8);
  MEMORY[0x270FA5388](v221);
  v219 = (char *)v179 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A890D48(0, (unint64_t *)&unk_26AC68C70, MEMORY[0x263F06EA8], v8);
  MEMORY[0x270FA5388](v35 - 8);
  v192 = (char *)v179 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  v203 = (char *)v179 - v38;
  MEMORY[0x270FA5388](v39);
  v191 = (char *)v179 - v40;
  uint64_t v217 = sub_20A8C2530();
  uint64_t v216 = *(void *)(v217 - 8);
  MEMORY[0x270FA5388](v217);
  v187 = (char *)v179 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  v179[0] = (char *)v179 - v43;
  v179[1] = v44;
  MEMORY[0x270FA5388](v45);
  v222 = (char *)v179 - v46;
  uint64_t v47 = sub_20A8CE2D0();
  MEMORY[0x270FA5388](v47 - 8);
  v214 = (char *)v179 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_20A8C4850();
  v212 = *(void (**)(char *, uint64_t))(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v51 = (char *)v179 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_20A8C5E90();
  uint64_t v53 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v55 = (char *)v179 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_20A8C5ED0();
  uint64_t v57 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  v218 = (char *)v179 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v59);
  long long v61 = (char *)v179 - v60;
  sub_20A890D48(0, &qword_26AC69780, MEMORY[0x263F7D2D0], MEMORY[0x263F7CEB0]);
  uint64_t v227 = v62;
  uint64_t v229 = a1;
  sub_20A8C6050();
  sub_20A8C5EB0();
  long long v63 = *(void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v228 = v56;
  long long v64 = (char *)(v57 + 8);
  v225 = v63;
  v63(v61, v56);
  sub_20A8C5E80();
  uint64_t v66 = v65;
  long long v67 = *(void (**)(char *, uint64_t))(v53 + 8);
  uint64_t v223 = v53 + 8;
  uint64_t v224 = v52;
  v67(v55, v52);
  if (v66)
  {
    uint64_t v68 = sub_20A8CF5B0();
    swift_bridgeObjectRelease();
    if (!v68)
    {
      strcpy(v51, "widgetHeadline");
      v51[15] = -18;
      uint64_t v69 = v212;
      (*((void (**)(char *, void, uint64_t))v212 + 13))(v51, *MEMORY[0x263F24E28], v49);
      sub_20A8C4950();
      (*((void (**)(char *, uint64_t))v69 + 1))(v51, v49);
    }
  }
  uint64_t v70 = v226;
  __swift_project_boxed_opaque_existential_1((void *)(v226 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_featureAvailability), *(void *)(v226 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_featureAvailability + 24));
  char v71 = sub_20A8CD7B0();
  sub_20A8C6050();
  sub_20A8C5EB0();
  uint64_t v72 = v64;
  uint64_t v73 = v225;
  v225(v61, v228);
  if ((v71 & 1) == 0)
  {
    sub_20A8C5E80();
    uint64_t v80 = v79;
    v67(v55, v224);
    if (!v80) {
      return 0;
    }
    uint64_t v81 = sub_20A8C2540();
    if (v82 >> 60 == 15)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v136 = v81;
    unint64_t v137 = v82;
    sub_20A8CE2C0();
    sub_20A8CE2A0();
    uint64_t v139 = v138;
    sub_20A5D78BC(v136, v137);
    swift_bridgeObjectRelease();
    if (!v139) {
      return 0;
    }
    uint64_t v140 = (uint64_t)v192;
    sub_20A8C2520();
    swift_bridgeObjectRelease();
    uint64_t v141 = v216;
    uint64_t v142 = v217;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v216 + 48))(v140, 1, v217) == 1)
    {
      sub_20A890F1C(v140, (uint64_t)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
      return 0;
    }
    v153 = v187;
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 32))(v187, v140, v142);
    v155 = v184;
    sub_20A8C27F0();
    id v156 = objc_allocWithZone(MEMORY[0x263F7AFF8]);
    v157 = (void *)sub_20A8C24D0();
    v158 = (void *)sub_20A8CE240();
    v159 = (void *)sub_20A8C2730();
    v160 = (void *)sub_20A8CE240();
    id v161 = objc_msgSend(v156, sel_initWithURL_title_shortExcerpt_publishDate_sourceName_, v157, v158, 0, v159, v160);

    (*(void (**)(char *, uint64_t))(v185 + 8))(v155, v186);
    uint64_t isEscapingClosureAtFileLocation = (uint64_t)v188;
    void *v188 = v161;
    swift_storeEnumTagMultiPayload();
    if (sub_20A86ADC0())
    {
      uint64_t v163 = v180;
      sub_20A890F7C(isEscapingClosureAtFileLocation, v180, type metadata accessor for StocksActivity.Article);
      swift_storeEnumTagMultiPayload();
      uint64_t v164 = *(void *)(v70 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_tracker);
      uint64_t v165 = sub_20A8C6D60();
      uint64_t v166 = (uint64_t)v182;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v165 - 8) + 56))(v182, 1, 1, v165);
      v232 = 0;
      long long aBlock = 0u;
      long long v231 = 0u;
      uint64_t v236 = 0;
      long long v234 = 0u;
      long long v235 = 0u;
      sub_20A5BFF1C(v163, v164, v166, (uint64_t)&aBlock, 0, 0, (uint64_t)&v234);
LABEL_40:
      swift_release();
      sub_20A890EAC((uint64_t)&v234, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
      sub_20A890EAC((uint64_t)&aBlock, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
      sub_20A890F1C(v166, (uint64_t)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
      sub_20A890FE4(v163, type metadata accessor for StocksActivity);
      sub_20A890FE4(isEscapingClosureAtFileLocation, type metadata accessor for StocksActivity.Article);
      (*(void (**)(char *, uint64_t))(v141 + 8))(v153, v142);
      return 1;
    }
LABEL_39:
    uint64_t v163 = v181;
    sub_20A890F7C(isEscapingClosureAtFileLocation, v181, type metadata accessor for StocksActivity.Article);
    swift_storeEnumTagMultiPayload();
    uint64_t v176 = *(void *)(v70 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_tracker);
    uint64_t v177 = sub_20A8C6D60();
    uint64_t v166 = (uint64_t)v183;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v177 - 8) + 56))(v183, 1, 1, v177);
    v232 = 0;
    long long aBlock = 0u;
    long long v231 = 0u;
    uint64_t v236 = 0;
    long long v234 = 0u;
    long long v235 = 0u;
    sub_20A88DCCC(v163, v176, v166, (uint64_t)&aBlock, 0, 0, (uint64_t)&v234);
    goto LABEL_40;
  }
  sub_20A8C5E80();
  uint64_t v75 = v74;
  v212 = v67;
  v67(v55, v224);
  v76 = v222;
  if (v75)
  {
    uint64_t v77 = sub_20A8C2540();
    if (v78 >> 60 == 15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v83 = v77;
    unint64_t v84 = v78;
    sub_20A8CE2C0();
    v214 = (char *)sub_20A8CE2A0();
    uint64_t v86 = v85;
    sub_20A5D78BC(v83, v84);
    swift_bridgeObjectRelease();
    if (!v86) {
      goto LABEL_14;
    }
    v87 = v191;
    sub_20A8C2520();
    uint64_t v88 = (uint64_t)v87;
    swift_bridgeObjectRelease();
    uint64_t v89 = v216;
    v90 = v87;
    uint64_t v91 = v217;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v216 + 48))(v90, 1, v217) == 1)
    {
      sub_20A890F1C(v88, (uint64_t)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
      goto LABEL_14;
    }
    v153 = (char *)(v89 + 32);
    v152 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 32);
    v152(v76, v88, v91);
    uint64_t v142 = v91;
    uint64_t v154 = v89;
    if (sub_20A86ADC0())
    {
      __swift_project_boxed_opaque_existential_1((void *)(v70 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_appURLHandler), *(void *)(v70 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_appURLHandler + 24));
      sub_20A8C8B60();
      (*(void (**)(char *, uint64_t))(v89 + 8))(v76, v91);
      return 1;
    }
    v167 = self;
    v168 = *(void (**)(void, char *, uint64_t))(v89 + 16);
    uint64_t v169 = v179[0];
    v168(v179[0], v76, v91);
    v170 = v76;
    unint64_t v171 = (*(unsigned __int8 *)(v154 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80);
    uint64_t v172 = swift_allocObject();
    *(void *)(v172 + 16) = v70;
    v152((char *)(v172 + v171), v169, v142);
    uint64_t v173 = swift_allocObject();
    *(void *)(v173 + 16) = sub_20A891110;
    *(void *)(v173 + 24) = v172;
    v232 = sub_20A53C7C0;
    uint64_t v233 = v173;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v231 = sub_20A8708E0;
    *((void *)&v231 + 1) = &block_descriptor_52;
    v174 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v167, sel_performWithoutAnimation_, v174);
    _Block_release(v174);
    v175 = *(void (**)(char *, uint64_t))(v154 + 8);
    uint64_t v141 = v154 + 8;
    v175(v170, v142);
    uint64_t v151 = 1;
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v151;
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_14:
  uint64_t v92 = sub_20A890178(v229);
  uint64_t v94 = v93;
  v95 = v218;
  sub_20A8C6050();
  v96 = v219;
  sub_20A8C5EC0();
  v73(v95, v228);
  uint64_t v97 = sub_20A8C60D0();
  uint64_t v99 = v98;
  (*((void (**)(char *, uint64_t))v220 + 1))(v96, v221);
  if (v99)
  {
    *(void *)&long long aBlock = v97;
    *((void *)&aBlock + 1) = v99;
    strcpy((char *)&v234, "subscription");
    BYTE13(v234) = 0;
    HIWORD(v234) = -5120;
    sub_20A48C5C0();
    char v100 = sub_20A8CF250();
    swift_bridgeObjectRelease();
    if (v100)
    {
      if (v94) {
        uint64_t v101 = v92;
      }
      else {
        uint64_t v101 = 0;
      }
      uint64_t v229 = sub_20A8C6040();
      uint64_t v102 = sub_20A8C7B50();
      uint64_t v103 = (uint64_t)v196;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v196, 1, 1, v102);
      uint64_t v104 = *MEMORY[0x263F58E40];
      uint64_t v105 = sub_20A8C5690();
      v106 = v197;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v105 - 8) + 104))(v197, v104, v105);
      uint64_t v107 = v198;
      uint64_t v108 = v199;
      (*(void (**)(char *, void, uint64_t))(v198 + 104))(v106, *MEMORY[0x263F58E48], v199);
      uint64_t v109 = v94;
      v110 = (int *)v194;
      v111 = v195;
      v112 = &v195[*(int *)(v194 + 44)];
      *((void *)v112 + 1) = 0;
      swift_unknownObjectWeakInit();
      *(void *)v111 = v101;
      *((void *)v111 + 1) = v109;
      (*(void (**)(char *, char *, uint64_t))(v107 + 32))(&v111[v110[5]], v106, v108);
      v113 = &v111[v110[6]];
      *(void *)v113 = 0;
      *((void *)v113 + 1) = 0;
      v114 = &v111[v110[7]];
      *(void *)v114 = 0;
      *((void *)v114 + 1) = 0;
      *(void *)&v111[v110[8]] = v229;
      *(void *)&v111[v110[9]] = 0;
      sub_20A8913C8(v103, (uint64_t)&v111[v110[10]], (unint64_t *)&qword_26AC69BD0, MEMORY[0x263F5A0D8]);
      *((void *)v112 + 1) = 0;
      swift_unknownObjectWeakAssign();
      uint64_t v115 = v200;
      sub_20A53EC84((uint64_t)v111, v200);
      uint64_t v116 = v201;
      sub_20A890F7C(v115, v201, (uint64_t (*)(void))type metadata accessor for CampaignRouteModel);
      swift_storeEnumTagMultiPayload();
      uint64_t v117 = sub_20A8C6D60();
      uint64_t v118 = (uint64_t)v202;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v202, 1, 1, v117);
      v232 = 0;
      long long aBlock = 0u;
      long long v231 = 0u;
      uint64_t v236 = 0;
      long long v234 = 0u;
      long long v235 = 0u;
      sub_20A5BFF1C(v116, 0, v118, (uint64_t)&aBlock, 0, 0, (uint64_t)&v234);
      swift_release();
      sub_20A890EAC((uint64_t)&v234, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
      sub_20A890EAC((uint64_t)&aBlock, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
      sub_20A890F1C(v118, (uint64_t)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
      sub_20A890FE4(v116, type metadata accessor for StocksActivity);
      v149 = (uint64_t (*)(void))type metadata accessor for CampaignRouteModel;
      uint64_t v150 = v115;
      goto LABEL_32;
    }
  }
  if (!v94) {
    return 0;
  }
  sub_20A42FC8C();
  uint64_t v221 = *(int *)(v119 + 48);
  v120 = v211;
  v220 = &v211[*(int *)(v119 + 64)];
  v222 = v72;
  v121 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v216 + 56);
  uint64_t v122 = (uint64_t)v203;
  uint64_t v123 = v217;
  v121(v203, 1, 1, v217);
  v124 = v205;
  sub_20A8C4B80();
  v121((char *)v122, 1, 1, v123);
  uint64_t v125 = v70;
  uint64_t v126 = v206;
  v127 = v204;
  uint64_t v128 = v208;
  (*(void (**)(char *, void, uint64_t))(v206 + 104))(v204, *MEMORY[0x263F58CD8], v208);
  sub_20A8C4D30();
  v129 = v127;
  uint64_t v130 = (uint64_t)v120;
  (*(void (**)(char *, uint64_t))(v126 + 8))(v129, v128);
  sub_20A890F1C(v122, (uint64_t)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
  (*(void (**)(char *, uint64_t))(v207 + 8))(v124, v209);
  v131 = v220;
  *((void *)v220 + 4) = 0;
  *(_OWORD *)v131 = 0u;
  *((_OWORD *)v131 + 1) = 0u;
  *(void *)&v120[v221] = 0;
  swift_storeEnumTagMultiPayload();
  sub_20A8C6050();
  sub_20A8C5EB0();
  v225(v61, v228);
  uint64_t v132 = sub_20A8C5E80();
  uint64_t v134 = v133;
  v212(v55, v224);
  uint64_t v135 = (uint64_t)v210;
  if (!v134) {
    goto LABEL_31;
  }
  if (v132 != 1702195828 || v134 != 0xE400000000000000)
  {
    char v143 = sub_20A8CF760();
    swift_bridgeObjectRelease();
    if (v143) {
      goto LABEL_29;
    }
LABEL_31:
    sub_20A890F7C(v130, v135, type metadata accessor for StocksActivity.Article);
    swift_storeEnumTagMultiPayload();
    uint64_t v147 = *(void *)(v125 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_tracker);
    uint64_t v145 = (uint64_t)v193;
    sub_20A8C6030();
    uint64_t v148 = sub_20A8C6D60();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v148 - 8) + 56))(v145, 0, 1, v148);
    v232 = 0;
    long long aBlock = 0u;
    long long v231 = 0u;
    uint64_t v236 = 0;
    long long v234 = 0u;
    long long v235 = 0u;
    sub_20A5BFF1C(v135, v147, v145, (uint64_t)&aBlock, 0, 0, (uint64_t)&v234);
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
LABEL_29:
  uint64_t v135 = v189;
  sub_20A890F7C(v130, v189, type metadata accessor for StocksActivity.Article);
  swift_storeEnumTagMultiPayload();
  uint64_t v144 = *(void *)(v125 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_tracker);
  uint64_t v145 = (uint64_t)v190;
  sub_20A8C6030();
  uint64_t v146 = sub_20A8C6D60();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v146 - 8) + 56))(v145, 0, 1, v146);
  v232 = 0;
  long long aBlock = 0u;
  long long v231 = 0u;
  uint64_t v236 = 0;
  long long v234 = 0u;
  long long v235 = 0u;
  sub_20A88DCCC(v135, v144, v145, (uint64_t)&aBlock, 0, 0, (uint64_t)&v234);
LABEL_30:
  swift_release();
  sub_20A890EAC((uint64_t)&v234, &qword_26AC69600, (unint64_t *)&unk_26AC695F0, MEMORY[0x263F7CDB8]);
  sub_20A890EAC((uint64_t)&aBlock, &qword_26AC6AE80, (unint64_t *)&qword_26AC6AE70, MEMORY[0x263F58868]);
  sub_20A890F1C(v145, (uint64_t)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A890D48);
  sub_20A890FE4(v135, type metadata accessor for StocksActivity);
  v149 = type metadata accessor for StocksActivity.Article;
  uint64_t v150 = v130;
LABEL_32:
  sub_20A890FE4(v150, v149);
  return 1;
}

uint64_t sub_20A890178(uint64_t a1)
{
  uint64_t v25 = sub_20A8C5E90();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v24 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v23 - v5;
  uint64_t v7 = sub_20A8C5ED0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v23 - v12;
  sub_20A890D48(0, &qword_26AC69780, MEMORY[0x263F7D2D0], MEMORY[0x263F7CEB0]);
  v23[1] = a1;
  sub_20A8C6050();
  sub_20A8C5EB0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v13, v7);
  uint64_t v15 = sub_20A8C5E80();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v19 = v6;
  uint64_t v20 = v25;
  v18(v19, v25);
  if (!v17)
  {
    sub_20A8C6050();
    uint64_t v21 = v24;
    sub_20A8C5EB0();
    v14(v10, v7);
    uint64_t v15 = sub_20A8C5EA0();
    v18(v21, v20);
  }
  return v15;
}

uint64_t sub_20A89041C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_navigator;
  sub_20A4F6AEC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_featureAvailability);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_appURLHandler);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_20A8904F4()
{
  return type metadata accessor for StocksArticleURLHandler();
}

uint64_t type metadata accessor for StocksArticleURLHandler()
{
  uint64_t result = qword_26AC6BBD8;
  if (!qword_26AC6BBD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A890548()
{
  sub_20A4F6AEC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_20A890600(uint64_t a1)
{
  return sub_20A88E118(a1) & 1;
}

uint64_t sub_20A890628()
{
  return sub_20A89152C(&qword_26AC6BBD0, (void (*)(uint64_t))type metadata accessor for StocksArticleURLHandler);
}

uint64_t sub_20A890670(void *a1)
{
  uint64_t v2 = sub_20A8C6130();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A891574(0, (unint64_t *)&qword_26AC800B8, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20A8E51F0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0xE000000000000000;
  *(void *)(v5 + 48) = 0x6C63697472613A2FLL;
  *(void *)(v5 + 56) = 0xEB00000000444965;
  *(void *)(v5 + 64) = 0xD000000000000014;
  *(void *)(v5 + 72) = 0x800000020A9136A0;
  strcpy((char *)(v5 + 80), "/subscription");
  *(_WORD *)(v5 + 94) = -4864;
  *(void *)(v5 + 96) = 0xD000000000000018;
  *(void *)(v5 + 104) = 0x800000020A9136C0;
  *(void *)(v5 + 112) = 0x656C63697472612FLL;
  *(void *)(v5 + 120) = 0xE800000000000000;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_20A8CD7C0() & 1) == 0)
  {
    uint64_t v6 = sub_20A46DEBC((void *)1, 7, 1, (void *)v5);
    v6[2] = 7;
    v6[16] = 0xD000000000000015;
    v6[17] = 0x800000020A9136E0;
  }
  sub_20A8C6120();
  uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_20A890D48(0, &qword_26AC7FEF0, MEMORY[0x263F7CED8], MEMORY[0x263F8E0F8]);
  uint64_t v7 = sub_20A8C60E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_20A8DCB20;
  v35[1] = v11;
  uint64_t v12 = (void *)(v11 + v10);
  *uint64_t v12 = 0x656C6369747261;
  v12[1] = 0xE700000000000000;
  uint64_t v13 = *(void (**)(void))(v8 + 104);
  ((void (*)(void *, void, uint64_t))v13)(v12, *MEMORY[0x263F7CEC0], v7);
  uint64_t v14 = (void *)((char *)v12 + v9);
  *uint64_t v14 = 0xD000000000000010;
  v14[1] = 0x800000020A8F7FC0;
  v13();
  v35[0] = v4;
  uint64_t v15 = (void *)((char *)v12 + 2 * v9);
  *uint64_t v15 = 0x6E676961706D6163;
  v15[1] = 0xEB0000000064695FLL;
  v13();
  uint64_t v16 = (char *)v12 + 3 * v9;
  strcpy(v16, "campaign_type");
  *((_WORD *)v16 + 7) = -4864;
  v13();
  uint64_t v17 = (void *)((char *)v12 + 4 * v9);
  *uint64_t v17 = 0x6576697461657263;
  v17[1] = 0xEB0000000064695FLL;
  v13();
  uint64_t v18 = (void *)((char *)v12 + 5 * v9);
  *uint64_t v18 = 0x6E656B6F7471;
  v18[1] = 0xE600000000000000;
  v13();
  uint64_t v19 = (void *)((char *)v12 + 6 * v9);
  *uint64_t v19 = 0x6574756F72;
  v19[1] = 0xE500000000000000;
  v13();
  uint64_t v20 = (void *)((char *)v12 + 7 * v9);
  *uint64_t v20 = 0x724664656E65706FLL;
  v20[1] = 0xEA00000000006D6FLL;
  v13();
  uint64_t v21 = (char *)&v12[v9];
  strcpy(v21, "web_headline");
  v21[13] = 0;
  *((_WORD *)v21 + 7) = -5120;
  v13();
  uint64_t v22 = (void *)((char *)v12 + 9 * v9);
  *uint64_t v22 = 0x6C6F626D7973;
  v22[1] = 0xE600000000000000;
  v13();
  uint64_t v23 = v38;
  sub_20A890D48(0, &qword_26AC800D0, (uint64_t (*)(uint64_t))sub_20A890DAC, v38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A8D3DC0;
  *(void *)(inited + 32) = 0x49656C6369747261;
  *(void *)(inited + 40) = 0xE900000000000044;
  sub_20A890D48(0, &qword_26AC7FEF8, MEMORY[0x263F7CEF0], v23);
  uint64_t v25 = sub_20A8C6140();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(void *)(v26 + 72);
  unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_20A8D4540;
  uint64_t v30 = (void *)(v29 + v28);
  *uint64_t v30 = 65;
  v30[1] = 0xE100000000000000;
  uint64_t v31 = *(void (**)(void))(v26 + 104);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v31)(v29 + v28, *MEMORY[0x263F7CEE0], v25);
  if ((*MEMORY[0x263F592C8] & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)((char *)v30 + v27) = *MEMORY[0x263F592C8];
    v31();
    *(void *)(inited + 48) = v29;
    sub_20A4D0434(inited);
    uint64_t v33 = v35[0];
    uint64_t v34 = sub_20A8C6110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v37);
    return v34;
  }
  return result;
}

void sub_20A890D48(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_20A890DAC()
{
  if (!qword_26AC7F6A8)
  {
    sub_20A890D48(255, &qword_26AC7F738, MEMORY[0x263F7CEF0], MEMORY[0x263F8D488]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26AC7F6A8);
    }
  }
}

void sub_20A890E44(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_20A43F7E0(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_20A890EAC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_20A890E44(0, a2, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_20A890F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_20A890F7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A890FE4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A891044()
{
  uint64_t v1 = sub_20A8C2530();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_20A891110()
{
  sub_20A8C2530();
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_appURLHandler), *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8StocksUI23StocksArticleURLHandler_appURLHandler + 24));
  return sub_20A8C8B60();
}

uint64_t sub_20A8911A0()
{
  return swift_deallocObject();
}

uint64_t sub_20A8911B0(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  sub_20A890E44(0, a3, a4, a5, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_20A891234()
{
  sub_20A890D48(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0]);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  unint64_t v3 = (*(void *)(*(void *)(v1 - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v4 = v0 + v2;
  uint64_t v5 = sub_20A8C6D60();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  if (*(void *)(v0 + v3 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + v3);
  }
  swift_release();
  if (*(void *)(v0 + ((v3 + 47) & 0xFFFFFFFFFFFFFFF8) + 8)) {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_20A8913C8(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_20A890D48(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_20A891448(uint64_t a1)
{
  sub_20A890D48(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0]);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = v1 + v5;
  unint64_t v9 = (uint64_t *)(v1 + ((v6 + 47) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = v9[2];

  return sub_20A480C4C(a1, v7, v8, v1 + v6, v10, v11, v12);
}

uint64_t sub_20A89152C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_20A891574(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_20A8915C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5, char *a6, char a7)
{
  id v21 = *(id *)&a6[OBJC_IVAR____TtC8StocksUI9TodayView_titleLabel];
  objc_msgSend(v21, sel_setFrame_, a5[4], a5[5], a5[6], a5[7]);
  id v23 = *(id *)&a6[OBJC_IVAR____TtC8StocksUI9TodayView_brandingLabel];
  objc_msgSend(v23, sel_setFrame_, a5[8], a5[9], a5[10], a5[11]);
  uint64_t v14 = v7 + 16;
  swift_beginAccess();
  sub_20A4342F4(v7 + 16, (uint64_t)v24);
  __swift_project_boxed_opaque_existential_1(v24, v25);
  uint64_t v15 = (id (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))off_26BE6EA60[0];
  type metadata accessor for TodayViewStyler();
  id v16 = v15(a1, a2, a3, a4, a7);
  objc_msgSend(v21, sel_setAttributedText_, v16);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  sub_20A4342F4(v14, (uint64_t)v24);
  __swift_project_boxed_opaque_existential_1(v24, v25);
  id v17 = ((id (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))off_26BE6EA68)(a1, a2, a3, a4, a7);
  objc_msgSend(v23, sel_setAttributedText_, v17);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  if (UIAccessibilityDarkerSystemColorsEnabled() && (a7 & 1) != 0)
  {
    id v18 = objc_msgSend(self, sel_lightTextColor);
    objc_msgSend(a6, sel_setBackgroundColor_, v18);
  }
  objc_msgSend(v21, sel_setNumberOfLines_, 0);
  return objc_msgSend(v23, sel_setNumberOfLines_, 0);
}

uint64_t type metadata accessor for TodayViewRenderer()
{
  return self;
}

unint64_t sub_20A891818(uint64_t a1)
{
  unint64_t result = sub_20A891840();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_20A891840()
{
  unint64_t result = qword_26AC6FFE0;
  if (!qword_26AC6FFE0)
  {
    type metadata accessor for TodayViewRenderer();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC6FFE0);
  }
  return result;
}

id sub_20A891894(char a1, id a2)
{
  return objc_msgSend(a2, sel_setEnabled_, a1 & 1);
}

uint64_t sub_20A891984(void *a1)
{
  id v2 = objc_msgSend(a1, sel_text);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_20A8CE280();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  sub_20A8CE8D0();
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20A891C10();
    sub_20A8CE340();
    unint64_t v9 = *(void (**)(void))(v1 + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_setAllowSubmission);
    char v10 = (*(uint64_t (**)(uint64_t, unint64_t))(v1
                                                               + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_isTextValid))(v12, v6);
    swift_bridgeObjectRelease();
    v9(v10 & 1);
  }
  return 1;
}

uint64_t type metadata accessor for TextFieldValidator()
{
  return self;
}

unint64_t sub_20A891C10()
{
  unint64_t result = qword_26763E880;
  if (!qword_26763E880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E880);
  }
  return result;
}

uint64_t type metadata accessor for AudioListeningProgressAdapter()
{
  return self;
}

uint64_t sub_20A891C88(uint64_t a1)
{
  uint64_t v3 = sub_20A8CC9C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = type metadata accessor for StocksAudioTrack();
  if ((*(unsigned char *)(a1 + *(int *)(result + 32)) & 2) != 0)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    sub_20A8C5820();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
    if (result == *MEMORY[0x263F598D0])
    {
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    }
    else if (result != *MEMORY[0x263F598D8])
    {
      uint64_t result = sub_20A8CF520();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_20A891E40(uint64_t a1)
{
  uint64_t v3 = sub_20A8CC9C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = type metadata accessor for StocksAudioTrack();
  if ((*(unsigned char *)(a1 + *(int *)(result + 32)) & 2) != 0)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    sub_20A8C5830();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
    if (result == *MEMORY[0x263F598D0])
    {
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    }
    else if (result != *MEMORY[0x263F598D8])
    {
      uint64_t result = sub_20A8CF520();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_20A892000(uint64_t a1)
{
  return sub_20A891C88(a1);
}

uint64_t sub_20A892024(uint64_t a1)
{
  return sub_20A891E40(a1);
}

uint64_t dispatch thunk of ArticleScienceDataProviderType.scienceData(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_20A89205C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_20A8C2830();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v38 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_20A8C4CA0();
  uint64_t v34 = *(void *)(v42 - 8);
  uint64_t v36 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_20A8C5920();
  uint64_t v8 = *(void *)(v32 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v32);
  uint64_t v29 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_20A8C6820();
  uint64_t v30 = v10;
  uint64_t v28 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v31 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v27 - v13;
  sub_20A892534();
  uint64_t v37 = v14;
  uint64_t v33 = v2;
  sub_20A8928F0(v2, (uint64_t)v14);
  uint64_t v35 = *(void *)(v2 + 32);
  uint64_t v15 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v32);
  uint64_t v16 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v41, a1, v42);
  uint64_t v17 = v28;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v10);
  unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v19 = (v9 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + v19 + 8) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v21 = v17;
  unint64_t v22 = (v36 + *(unsigned __int8 *)(v17 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v23 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v23 + v18, v29, v15);
  *(void *)(v23 + v19) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v23 + v20, v41, v42);
  uint64_t v24 = v30;
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v23 + v22, v31, v30);
  swift_retain();
  sub_20A8C48E0();
  swift_release();
  sub_20A8C48A0();
  sub_20A8C7250();
  sub_20A89CB3C(&qword_26AC69AB8, MEMORY[0x263F7A1D0]);
  sub_20A8C4980();
  sub_20A8C48C0();
  uint64_t v25 = v38;
  sub_20A8C2820();
  sub_20A8C2810();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v25, v40);
  sub_20A8C48B0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v37, v24);
}

uint64_t sub_20A892534()
{
  sub_20A897510(0, (unint64_t *)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v24 - v1;
  uint64_t v3 = sub_20A8C5920();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for StocksActivity(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_20A8C5390();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = (void *)sub_20A8C5900();
  if (objc_msgSend(v13, sel_respondsToSelector_, sel_role))
  {
    id v14 = objc_msgSend(v13, sel_role);
    uint64_t result = swift_unknownObjectRelease();
    if (v14 == (id)3) {
      return result;
    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
  uint64_t v24 = v6;
  uint64_t v16 = v25;
  uint64_t v17 = *(void **)(v25 + 176);
  if (v17)
  {
    *uint64_t v12 = v17;
    unint64_t v18 = (unsigned int *)MEMORY[0x263F58CE0];
  }
  else
  {
    unint64_t v18 = (unsigned int *)MEMORY[0x263F58CD8];
  }
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *v18, v9);
  uint64_t v25 = *(void *)(v16 + 168);
  sub_20A42FC8C();
  uint64_t v20 = *(int *)(v19 + 48);
  uint64_t v21 = &v8[*(int *)(v19 + 64)];
  id v22 = v17;
  sub_20A8C5900();
  sub_20A8C58F0();
  uint64_t v23 = sub_20A8C2530();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v2, 1, 1, v23);
  sub_20A8C4D60();
  sub_20A89CACC((uint64_t)v2, (unint64_t *)&unk_26AC68C70, MEMORY[0x263F06EA8]);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  *((void *)v21 + 4) = 0;
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  *(void *)&v8[v20] = 0;
  type metadata accessor for StocksActivity.Article(0);
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  sub_20A8C92D0();
  sub_20A89C9EC((uint64_t)v8, type metadata accessor for StocksActivity);
  return (*(uint64_t (**)(void *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_20A8928F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_20A8C4610();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C5130();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C4C80();
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  if (v12 == *MEMORY[0x263F58C38])
  {
    uint64_t v60 = *(void *)(a1 + 32);
    uint64_t v61 = a2;
    sub_20A8C4910();
    sub_20A897510(0, &qword_26AC7FED8, MEMORY[0x263F24E48], MEMORY[0x263F8E0F8]);
    uint64_t v14 = v13;
    uint64_t v15 = sub_20A8C4850();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(void *)(v16 + 72);
    uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
    uint64_t v19 = (v18 + 32) & ~v18;
    uint64_t v58 = v18 | 7;
    uint64_t v59 = v14;
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = v4;
    *(_OWORD *)(v20 + 16) = xmmword_20A8D3DC0;
    id v22 = *(void (**)(void))(v16 + 104);
    ((void (*)(uint64_t, void, uint64_t))v22)(v20 + v19, *MEMORY[0x263F24E40], v15);
    char v23 = sub_20A8C4600();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
    v24(v7, v21);
    if (v23)
    {
      uint64_t v25 = *MEMORY[0x263F79A50];
      uint64_t v26 = sub_20A8C6820();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v61, v25, v26);
    }
    sub_20A8C4910();
    uint64_t v56 = v19 + 2 * v17;
    uint64_t v29 = swift_allocObject();
    uint64_t v57 = v21;
    long long v55 = xmmword_20A8D4540;
    *(_OWORD *)(v29 + 16) = xmmword_20A8D4540;
    uint64_t v30 = v29 + v19;
    strcpy((char *)(v29 + v19), "widgetHeadline");
    *(unsigned char *)(v29 + v19 + 15) = -18;
    ((void (*)(uint64_t, void, uint64_t))v22)(v29 + v19, *MEMORY[0x263F24E28], v15);
    uint64_t v31 = (void *)(v30 + v17);
    *uint64_t v31 = 0x656C6369747261;
    v31[1] = 0xE700000000000000;
    v54[3] = *MEMORY[0x263F24E38];
    v22();
    LOBYTE(v30) = sub_20A8C4600();
    uint64_t v32 = v57;
    swift_bridgeObjectRelease();
    v24(v7, v32);
    if (v30)
    {
      uint64_t v33 = *MEMORY[0x263F79A38];
      uint64_t v34 = sub_20A8C6820();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v61, v33, v34);
    }
    sub_20A8C4910();
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = v55;
    uint64_t v47 = (void *)(v46 + v19);
    *uint64_t v47 = 0x656E696C64616568;
    v47[1] = 0xE800000000000000;
    ((void (*)(uint64_t, void, uint64_t))v22)(v46 + v19, *MEMORY[0x263F24E30], v15);
    uint64_t v48 = (void *)((char *)v47 + v17);
    *uint64_t v48 = 0x656C6369747261;
    v48[1] = 0xE700000000000000;
    v22();
    LOBYTE(v47) = sub_20A8C4600();
    swift_bridgeObjectRelease();
    v24(v7, v57);
    uint64_t v43 = sub_20A8C6820();
    uint64_t v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104);
    if (v47) {
      uint64_t v49 = (unsigned int *)MEMORY[0x263F79A18];
    }
    else {
      uint64_t v49 = (unsigned int *)MEMORY[0x263F79A28];
    }
    uint64_t v52 = *v49;
    uint64_t v53 = v61;
    return v44(v53, v52, v43);
  }
  if (v12 == *MEMORY[0x263F58C30])
  {
    uint64_t v28 = (unsigned int *)MEMORY[0x263F79A40];
    goto LABEL_15;
  }
  if (v12 != *MEMORY[0x263F58C20])
  {
    if (v12 != *MEMORY[0x263F58C28])
    {
      uint64_t result = sub_20A8CF520();
      __break(1u);
      return result;
    }
    uint64_t v28 = (unsigned int *)MEMORY[0x263F79A20];
LABEL_15:
    uint64_t v50 = *v28;
    uint64_t v51 = sub_20A8C6820();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 104))(a2, v50, v51);
  }
  sub_20A8C4910();
  sub_20A897510(0, &qword_26AC7FED8, MEMORY[0x263F24E48], MEMORY[0x263F8E0F8]);
  uint64_t v35 = sub_20A8C4850();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(void *)(v36 + 72);
  unint64_t v38 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_20A8D4540;
  uint64_t v40 = (char *)(v39 + v38);
  strcpy(v40, "widgetHeadline");
  v40[15] = -18;
  uint64_t v41 = *(void (**)(void))(v36 + 104);
  ((void (*)(char *, void, uint64_t))v41)(v40, *MEMORY[0x263F24E28], v35);
  uint64_t v42 = &v40[v37];
  *(void *)uint64_t v42 = 0x656C6369747261;
  *((void *)v42 + 1) = 0xE700000000000000;
  v41();
  LOBYTE(v35) = sub_20A8C4600();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v43 = sub_20A8C6820();
  uint64_t v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104);
  if (v35) {
    uint64_t v45 = (unsigned int *)MEMORY[0x263F79A38];
  }
  else {
    uint64_t v45 = (unsigned int *)MEMORY[0x263F79A58];
  }
  uint64_t v52 = *v45;
  uint64_t v53 = a2;
  return v44(v53, v52, v43);
}

uint64_t sub_20A8930AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v134 = a5;
  uint64_t v135 = a4;
  uint64_t v140 = a1;
  uint64_t v141 = a3;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC69A78, MEMORY[0x263F7A090], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v126 = (char *)&v96 - v8;
  uint64_t v128 = sub_20A8C70D0();
  uint64_t v127 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  v110 = (char *)&v96 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_20A8C6A50();
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v107 = (char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A897510(0, &qword_26AC676E0, MEMORY[0x263F79D08], v6);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v104 = (char *)&v96 - v12;
  uint64_t v106 = sub_20A8C6B80();
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v97 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A897510(0, &qword_26AC69960, MEMORY[0x263F79B40], v6);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v101 = (char *)&v96 - v15;
  uint64_t v103 = sub_20A8C69D0();
  uint64_t v102 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  v96 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A897510(0, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], v6);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v125 = (uint64_t)&v96 - v18;
  uint64_t v19 = sub_20A8C6D60();
  uint64_t v130 = *(void *)(v19 - 8);
  uint64_t v131 = v19;
  MEMORY[0x270FA5388](v19);
  v129 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_20A8C6C30();
  uint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v122 = (char *)&v96 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_20A8C6820();
  *(void *)&long long v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  uint64_t v118 = (char *)&v96 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_20A8C7720();
  uint64_t v115 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  uint64_t v117 = (char *)&v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_20A8C7710();
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  uint64_t v119 = (char *)&v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A897510(0, &qword_26AC69A38, MEMORY[0x263F79FB8], v6);
  MEMORY[0x270FA5388](v25 - 8);
  v114 = (char *)&v96 - v26;
  uint64_t v137 = sub_20A8C6FA0();
  uint64_t v139 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v136 = (char *)&v96 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_20A8C7800();
  uint64_t v99 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v98 = (char *)&v96 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_20A8C6890();
  uint64_t v112 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  v111 = (char *)&v96 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_20A8C72F0();
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v96 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_20A8C6CB0();
  uint64_t v35 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v96 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C5900();
  swift_getObjectType();
  sub_20A670898((uint64_t)v37);
  swift_unknownObjectRelease();
  sub_20A89CB3C((unint64_t *)&unk_26AC699D0, MEMORY[0x263F79DF8]);
  uint64_t v138 = "";
  sub_20A8C45B0();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  sub_20A8C5900();
  swift_getObjectType();
  sub_20A67115C(*(void **)(v141 + 160));
  swift_unknownObjectRelease();
  sub_20A89CB3C((unint64_t *)&unk_26AC69AD0, MEMORY[0x263F7A270]);
  sub_20A8C45B0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
  id v38 = objc_msgSend((id)sub_20A8C5900(), sel_sourceChannel);
  swift_unknownObjectRelease();
  if (v38)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v141 + 80), *(void *)(v141 + 104));
    uint64_t v39 = v111;
    sub_20A661B70(v38);
    sub_20A89CB3C((unint64_t *)&unk_26AC69930, MEMORY[0x263F79AA0]);
    uint64_t v40 = v113;
    sub_20A8C45B0();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v112 + 8))(v39, v40);
  }
  uint64_t v41 = (void *)sub_20A8C5900();
  if (objc_msgSend(v41, sel_respondsToSelector_, sel_parentIssue))
  {
    id v42 = objc_msgSend(v41, sel_parentIssue);
    swift_unknownObjectRelease();
    uint64_t v44 = v137;
    uint64_t v43 = v138;
    uint64_t v45 = (uint64_t)v114;
    if (v42)
    {
      id v46 = v42;
      id v47 = objc_msgSend(v46, sel_identifier);
      sub_20A8CE280();

      uint64_t v48 = v98;
      sub_20A8C77F0();
      sub_20A89CB3C(&qword_26AC69B70, MEMORY[0x263F7A748]);
      uint64_t v49 = v100;
      sub_20A8C45B0();

      (*(void (**)(char *, uint64_t))(v99 + 8))(v48, v49);
    }
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v44 = v137;
    uint64_t v43 = v138;
    uint64_t v45 = (uint64_t)v114;
  }
  sub_20A42FF3C(v141 + 120, (uint64_t)&v142);
  uint64_t v50 = v143;
  if (v143)
  {
    uint64_t v51 = v144;
    __swift_project_boxed_opaque_existential_1(&v142, v143);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 8))(a2, v50, v51);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v45, 1, v44) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v139 + 32))(v136, v45, v44);
      goto LABEL_12;
    }
  }
  else
  {
    sub_20A89C9EC((uint64_t)&v142, (uint64_t (*)(void))sub_20A481954);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v139 + 56))(v45, 1, 1, v44);
  }
  sub_20A8C6F90();
  sub_20A89CACC(v45, &qword_26AC69A38, MEMORY[0x263F79FB8]);
LABEL_12:
  sub_20A89CB3C(&qword_26AC69A30, MEMORY[0x263F79FB8]);
  v114 = (char *)((unint64_t)v43 | 0x8000000000000000);
  sub_20A8C45B0();
  sub_20A8C4C60();
  (*(void (**)(char *, void, uint64_t))(v115 + 104))(v117, *MEMORY[0x263F7A650], v116);
  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))(v118, v134, v133);
  uint64_t v52 = v119;
  sub_20A8C7700();
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v54 = v53;
  uint64_t v55 = sub_20A8C4620();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(void *)(v56 + 72);
  uint64_t v58 = *(unsigned __int8 *)(v56 + 80);
  uint64_t v59 = (v58 + 32) & ~v58;
  uint64_t v133 = v58 | 7;
  uint64_t v134 = v59 + v57;
  uint64_t v60 = swift_allocObject();
  long long v132 = xmmword_20A8D3DC0;
  *(_OWORD *)(v60 + 16) = xmmword_20A8D3DC0;
  uint64_t v61 = *MEMORY[0x263F24D40];
  uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104);
  v62(v60 + v59, v61, v55);
  sub_20A89CB3C((unint64_t *)&unk_26AC69B50, MEMORY[0x263F7A640]);
  uint64_t v63 = v121;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v120 + 8))(v52, v63);
  sub_20A8C4C60();
  long long v64 = v122;
  sub_20A8C6C20();
  uint64_t v135 = v54;
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = v132;
  uint64_t v118 = (char *)v55;
  uint64_t v66 = v55;
  long long v67 = v62;
  uint64_t v117 = (char *)(v56 + 104);
  v62(v65 + v59, v61, v66);
  sub_20A89CB3C(&qword_26AC699C8, MEMORY[0x263F79D68]);
  uint64_t v68 = v124;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v64, v68);
  uint64_t v69 = v141 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_urlReferralData;
  swift_beginAccess();
  uint64_t v70 = v125;
  sub_20A89CA4C(v69, v125, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28]);
  uint64_t v72 = v130;
  uint64_t v71 = v131;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v130 + 48))(v70, 1, v131) == 1)
  {
    sub_20A89CACC(v70, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28]);
    uint64_t v73 = v128;
    uint64_t v74 = v137;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v129, v70, v71);
    uint64_t v75 = (uint64_t)v101;
    sub_20A8C6D40();
    uint64_t v76 = v102;
    uint64_t v77 = v103;
    int v78 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v75, 1, v103);
    uint64_t v79 = (_DWORD *)MEMORY[0x263F24D48];
    if (v78 == 1)
    {
      sub_20A89CACC(v75, &qword_26AC69960, MEMORY[0x263F79B40]);
    }
    else
    {
      uint64_t v83 = v96;
      (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v96, v75, v77);
      uint64_t v84 = swift_allocObject();
      *(_OWORD *)(v84 + 16) = v132;
      v67(v84 + v59, *v79, (uint64_t)v118);
      sub_20A89CB3C((unint64_t *)&unk_26AC69950, MEMORY[0x263F79B40]);
      sub_20A8C45B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v83, v77);
    }
    uint64_t v80 = v106;
    uint64_t v81 = v105;
    uint64_t v82 = (uint64_t)v104;
    sub_20A8C6D30();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v82, 1, v80) == 1)
    {
      sub_20A89CACC(v82, &qword_26AC676E0, MEMORY[0x263F79D08]);
      uint64_t v85 = *v79;
    }
    else
    {
      uint64_t v86 = v97;
      (*(void (**)(char *, uint64_t, uint64_t))(v81 + 32))(v97, v82, v80);
      uint64_t v87 = swift_allocObject();
      *(_OWORD *)(v87 + 16) = v132;
      LODWORD(v141) = *v79;
      ((void (*)(uint64_t))v67)(v87 + v59);
      sub_20A89CB3C(&qword_26AC699B0, MEMORY[0x263F79D08]);
      sub_20A8C45B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v86, v80);
      uint64_t v85 = v141;
    }
    uint64_t v88 = v107;
    uint64_t v89 = v129;
    sub_20A8C6D50();
    uint64_t v90 = swift_allocObject();
    *(_OWORD *)(v90 + 16) = v132;
    v67(v90 + v59, v85, (uint64_t)v118);
    sub_20A89CB3C(&qword_26AC69978, MEMORY[0x263F79BB0]);
    uint64_t v91 = v109;
    sub_20A8C45B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v108 + 8))(v88, v91);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v89, v131);
    uint64_t v73 = v128;
    uint64_t v74 = v137;
  }
  sub_20A89CB3C(&qword_26AC69A70, MEMORY[0x263F7A090]);
  uint64_t v92 = (uint64_t)v126;
  sub_20A8C45A0();
  uint64_t v93 = v127;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v127 + 48))(v92, 1, v73) == 1)
  {
    (*(void (**)(char *, uint64_t))(v139 + 8))(v136, v74);
    return sub_20A89CACC(v92, &qword_26AC69A78, MEMORY[0x263F7A090]);
  }
  else
  {
    v95 = v110;
    (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v110, v92, v73);
    sub_20A8C45B0();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v95, v73);
    return (*(uint64_t (**)(char *, uint64_t))(v139 + 8))(v136, v74);
  }
}

uint64_t sub_20A894864(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v2 = sub_20A8C5390();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (uint64_t (*)(uint64_t))MEMORY[0x263F06EA8];
  sub_20A897510(0, (unint64_t *)&unk_26AC68C70, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = sub_20A8C5920();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for StocksActivity(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v1 + 168);
  sub_20A42FC8C();
  uint64_t v20 = *(int *)(v15 + 48);
  uint64_t v16 = &v14[*(int *)(v15 + 64)];
  sub_20A8C5900();
  sub_20A8C58F0();
  uint64_t v17 = sub_20A8C2530();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F58CD8], v2);
  sub_20A8C4D60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_20A89CACC((uint64_t)v8, (unint64_t *)&unk_26AC68C70, v24);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *((void *)v16 + 4) = 0;
  *(_OWORD *)uint64_t v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *(void *)&v14[v20] = 0;
  type metadata accessor for StocksActivity.Article(0);
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  sub_20A8C92C0();
  return sub_20A89C9EC((uint64_t)v14, type metadata accessor for StocksActivity);
}

uint64_t sub_20A894BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = a3;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v3 = sub_20A8C2800();
  uint64_t v44 = *(void *)(v3 - 8);
  uint64_t v45 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v43 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v42 = (char *)v37 - v6;
  uint64_t v7 = sub_20A8C6B00();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v38 = sub_20A8C40E0();
  uint64_t v14 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v16 = (char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_20A8C6AF0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v40 = v17;
  uint64_t v41 = v18;
  MEMORY[0x270FA5388](v17);
  v37[0] = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_20A8C6940();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A513C38();
  sub_20A89CB3C((unint64_t *)&unk_26AC69940, MEMORY[0x263F79B20]);
  v37[1] = 0x800000020A913910;
  sub_20A8C45B0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  __swift_project_boxed_opaque_existential_1((void *)(v39 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager), *(void *)(v39 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager + 24));
  sub_20A8C3600();
  char v24 = sub_20A8C4040();
  uint64_t v25 = (unsigned int *)MEMORY[0x263F79CB8];
  if ((v24 & 1) == 0) {
    uint64_t v25 = (unsigned int *)MEMORY[0x263F79CB0];
  }
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v13, *v25, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  uint64_t v26 = v37[0];
  sub_20A8C6AE0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v38);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v27 = sub_20A8C4620();
  uint64_t v28 = *(void *)(v27 - 8);
  unint64_t v29 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v28 + 104))(v30 + v29, *MEMORY[0x263F24D48], v27);
  sub_20A89CB3C(&qword_26AC699A0, MEMORY[0x263F79CA8]);
  uint64_t v31 = v40;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v26, v31);
  sub_20A8C7180();
  uint64_t v32 = v42;
  sub_20A8C4C70();
  sub_20A89CB3C(&qword_26AC69A98, MEMORY[0x263F7A120]);
  sub_20A8C4570();
  uint64_t v33 = v45;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v44 + 8);
  v34(v32, v45);
  uint64_t v35 = v43;
  sub_20A8C4C70();
  sub_20A8C4C90();
  sub_20A8C2720();
  v34(v35, v33);
  swift_retain();
  sub_20A8C4580();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v34)(v32, v33);
}

uint64_t sub_20A89527C()
{
  return sub_20A8C4550();
}

uint64_t sub_20A89539C(uint64_t a1)
{
  uint64_t v186 = a1;
  v167 = (void *)sub_20A8C57E0();
  v168 = (char *)*(v167 - 1);
  uint64_t v1 = *((void *)v168 + 8);
  MEMORY[0x270FA5388](v167);
  uint64_t v165 = (char *)&v161 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v166 = (char *)&v161 - v3;
  unint64_t v171 = (void (*)(char *, char *, uint64_t))sub_20A8C5410();
  v174 = (char *)*((void *)v171 - 1);
  uint64_t v4 = *((void *)v174 + 8);
  MEMORY[0x270FA5388](v171);
  uint64_t v169 = (char *)&v161 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v170 = (uint64_t (*)(uint64_t))((char *)&v161 - v6);
  uint64_t v181 = sub_20A8C54A0();
  uint64_t v177 = *(void *)(v181 - 8);
  MEMORY[0x270FA5388](v181);
  v184 = (char *)&v161 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v185 = (char *)&v161 - v9;
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], MEMORY[0x263F8D8F0]);
  uint64_t v172 = *(unsigned __int8 **)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  v178 = (void (*)(unint64_t, char *, uint64_t))((char *)&v161
                                                                - ((unint64_t)(v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v173 = v11;
  MEMORY[0x270FA5388](v12);
  v179 = (uint64_t *)((char *)&v161 - v13);
  uint64_t v14 = sub_20A8C4F10();
  uint64_t v187 = *(void *)(v14 - 8);
  uint64_t v188 = v14;
  MEMORY[0x270FA5388](v14);
  v182 = (char *)&v161 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = v15;
  MEMORY[0x270FA5388](v16);
  v183 = (char *)&v161 - v17;
  uint64_t v18 = sub_20A8C4F50();
  uint64_t v19 = *(char **)(v18 - 8);
  uint64_t v20 = *((void *)v19 + 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v161 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  char v24 = (char *)&v161 - v23;
  uint64_t v25 = sub_20A8C4C50();
  uint64_t v26 = *(void *)(v25 - 8);
  double v27 = MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v161 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v26 + 16))(v29, v186, v25, v27);
  int v30 = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v29, v25);
  if (v30 == *MEMORY[0x263F58A30])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89B8C0();
    uint64_t v32 = *(void *)&v29[v31[12]];
    uint64_t v33 = *(void *)&v29[v31[16]];
    uint64_t v34 = *(void *)&v29[v31[20]];
    uint64_t v35 = (void (*)(char *, char *, uint64_t))*((void *)v19 + 4);
    v35(v24, v29, v18);
    (*((void (**)(char *, char *, uint64_t))v19 + 2))(v21, v24, v18);
    unint64_t v36 = (v19[80] + 40) & ~(unint64_t)v19[80];
    uint64_t v37 = (char *)swift_allocObject();
    *((void *)v37 + 2) = v32;
    *((void *)v37 + 3) = v33;
    *((void *)v37 + 4) = v34;
    v35(&v37[v36], v21, v18);
    sub_20A8C48E0();
    swift_release();
    return (*((uint64_t (**)(char *, uint64_t))v19 + 1))(v24, v18);
  }
  uint64_t v186 = v20;
  uint64_t v163 = (char *)&v161 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = v18;
  uint64_t v180 = v19;
  if (v30 == *MEMORY[0x263F58A60])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89A918();
    uint64_t v40 = &v29[v39[12]];
    uint64_t v41 = &v29[v39[16]];
    v170 = (uint64_t (*)(uint64_t))&v29[v39[20]];
    uint64_t v42 = v177;
    uint64_t v43 = v181;
    uint64_t v44 = v187;
    uint64_t v45 = *(char **)(v187 + 32);
    v167 = (void *)(v187 + 32);
    v168 = v45;
    uint64_t v46 = v183;
    uint64_t v47 = v188;
    ((void (*)(char *, char *, uint64_t))v45)(v183, v29, v188);
    unint64_t v171 = (void (*)(char *, char *, uint64_t))*((void *)v180 + 4);
    v174 = v180 + 32;
    uint64_t v48 = v24;
    v162 = v24;
    uint64_t v49 = v164;
    v171(v24, v40, v164);
    uint64_t v50 = (uint64_t)v41;
    uint64_t v51 = (void (*)(void, void, void))v179;
    sub_20A89AA58(v50, (uint64_t)v179);
    uint64_t v166 = *(char **)(v42 + 32);
    uint64_t v52 = v185;
    ((void (*)(char *, uint64_t (*)(uint64_t), uint64_t))v166)(v185, v170, v43);
    uint64_t v169 = *(char **)(v189 + 32);
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v182, v46, v47);
    v170 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
    sub_20A89CA4C((uint64_t)v51, (uint64_t)v178, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0]);
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v184, v52, v43);
    uint64_t v53 = v180;
    uint64_t v54 = v163;
    (*((void (**)(char *, char *, uint64_t))v180 + 2))(v163, v48, v49);
    unint64_t v55 = (*(unsigned __int8 *)(v44 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    unint64_t v56 = (v175 + v172[80] + v55) & ~(unint64_t)v172[80];
    unint64_t v57 = (unint64_t)&v173[*(unsigned __int8 *)(v42 + 80) + v56] & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    unint64_t v58 = (v176 + v53[80] + v57) & ~(unint64_t)v53[80];
    uint64_t v59 = swift_allocObject();
    uint64_t v60 = v188;
    *(void *)(v59 + 16) = v189;
    ((void (*)(unint64_t, char *, uint64_t))v168)(v59 + v55, v182, v60);
    sub_20A89AA58((uint64_t)v178, v59 + v56);
    uint64_t v61 = v181;
    ((void (*)(unint64_t, char *, uint64_t))v166)(v59 + v57, v184, v181);
    v171((char *)(v59 + v58), v54, v49);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v185, v61);
    sub_20A89CACC((uint64_t)v179, (unint64_t *)&unk_26AC69450, v170);
    (*((void (**)(char *, uint64_t))v180 + 1))(v162, v49);
    return (*(uint64_t (**)(char *, uint64_t))(v187 + 8))(v183, v188);
  }
  if (v30 == *MEMORY[0x263F58A20])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89AEB0();
    uint64_t v63 = &v29[v62[12]];
    long long v64 = &v29[v62[16]];
    uint64_t v173 = &v29[v62[20]];
    uint64_t v65 = *(unsigned __int8 **)(v187 + 32);
    v168 = (char *)(v187 + 32);
    uint64_t v172 = v65;
    uint64_t v66 = v183;
    uint64_t v67 = v188;
    ((void (*)(char *, char *, uint64_t))v65)(v183, v29, v188);
    uint64_t v68 = (void *)*((void *)v180 + 4);
    v178 = (void (*)(unint64_t, char *, uint64_t))(v180 + 32);
    v179 = v68;
    v162 = v24;
    ((void (*)(char *, char *, uint64_t))v68)(v24, v63, v164);
    uint64_t v69 = v177;
    uint64_t v70 = v181;
    uint64_t v71 = (void *)*((void *)v174 + 4);
    uint64_t v166 = v174 + 32;
    v167 = v71;
    uint64_t v72 = v170;
    uint64_t v73 = v64;
    uint64_t v74 = v171;
    ((void (*)(uint64_t (*)(uint64_t), char *, void))v71)(v170, v73, v171);
    uint64_t v165 = *(char **)(v69 + 32);
    uint64_t v75 = v185;
    ((void (*)(char *, char *, uint64_t))v165)(v185, v173, v70);
    uint64_t v173 = *(char **)(v189 + 32);
    uint64_t v76 = v187;
    (*(void (**)(char *, char *, uint64_t))(v187 + 16))(v182, v66, v67);
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v184, v75, v70);
    uint64_t v77 = v174;
    (*((void (**)(char *, uint64_t (*)(uint64_t), void *))v174 + 2))(v169, v72, v74);
    int v78 = v180;
    uint64_t v79 = v164;
    (*((void (**)(char *, char *, uint64_t))v180 + 2))(v163, v162, v164);
    unint64_t v80 = (*(unsigned __int8 *)(v76 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    unint64_t v81 = (v175 + *(unsigned __int8 *)(v69 + 80) + v80) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    unint64_t v82 = (v176 + v77[80] + v81) & ~(unint64_t)v77[80];
    unint64_t v83 = (v4 + v78[80] + v82) & ~(unint64_t)v78[80];
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = v189;
    unint64_t v85 = v84 + v80;
    uint64_t v86 = v188;
    ((void (*)(unint64_t, char *, uint64_t))v172)(v85, v182, v188);
    uint64_t v87 = v181;
    ((void (*)(unint64_t, char *, uint64_t))v165)(v84 + v81, v184, v181);
    uint64_t v88 = v171;
    ((void (*)(unint64_t, char *, void))v167)(v84 + v82, v169, v171);
    ((void (*)(unint64_t, char *, uint64_t))v179)(v84 + v83, v163, v79);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v185, v87);
    (*((void (**)(uint64_t (*)(uint64_t), void (*)(char *, char *, uint64_t)))v174 + 1))(v170, v88);
    (*((void (**)(char *, uint64_t))v180 + 1))(v162, v79);
    return (*(uint64_t (**)(char *, uint64_t))(v187 + 8))(v183, v86);
  }
  if (v30 == *MEMORY[0x263F58A48])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89AB08();
    uint64_t v90 = &v29[*(int *)(v89 + 48)];
    uint64_t v91 = &v29[*(int *)(v89 + 64)];
    uint64_t v92 = v188;
    uint64_t v93 = v187;
    uint64_t v94 = *(void (**)(unint64_t, char *, uint64_t))(v187 + 32);
    v174 = (char *)(v187 + 32);
    v178 = v94;
    v95 = v183;
    v94((unint64_t)v183, v29, v188);
    v96 = (char *)*((void *)v168 + 4);
    v179 = v168 + 32;
    uint64_t v180 = v96;
    uint64_t v97 = v166;
    uint64_t v98 = v167;
    ((void (*)(char *, char *, void *))v96)(v166, v90, v167);
    uint64_t v99 = v177;
    uint64_t v173 = *(char **)(v177 + 32);
    uint64_t v100 = v185;
    uint64_t v101 = v91;
    uint64_t v102 = v181;
    ((void (*)(char *, char *))v173)(v185, v101);
    uint64_t v186 = *(void *)(v189 + 32);
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v182, v95, v92);
    (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v184, v100, v102);
    uint64_t v103 = v168;
    (*((void (**)(char *, char *, void *))v168 + 2))(v165, v97, v98);
    unint64_t v104 = (*(unsigned __int8 *)(v93 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
    unint64_t v105 = (v175 + *(unsigned __int8 *)(v99 + 80) + v104) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80);
    unint64_t v106 = (v176 + v103[80] + v105) & ~(unint64_t)v103[80];
    uint64_t v107 = swift_allocObject();
    *(void *)(v107 + 16) = v189;
    v178(v107 + v104, v182, v92);
    ((void (*)(unint64_t, char *, uint64_t))v173)(v107 + v105, v184, v102);
    uint64_t v108 = v167;
    ((void (*)(unint64_t, char *, void *))v180)(v107 + v106, v165, v167);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v99 + 8))(v185, v102);
    (*((void (**)(char *, void *))v168 + 1))(v166, v108);
    return (*(uint64_t (**)(char *, uint64_t))(v187 + 8))(v183, v92);
  }
  uint64_t v109 = v24;
  if (v30 == *MEMORY[0x263F58A38])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89A918();
    v111 = &v29[v110[12]];
    uint64_t v112 = &v29[v110[16]];
    uint64_t v113 = &v29[v110[20]];
    uint64_t v114 = v187;
    uint64_t v115 = *(char **)(v187 + 32);
    v167 = (void *)(v187 + 32);
    v168 = v115;
    uint64_t v116 = v183;
    uint64_t v117 = v188;
    ((void (*)(char *, char *, uint64_t))v115)(v183, v29, v188);
    uint64_t v118 = (char *)*((void *)v180 + 4);
    unint64_t v171 = (void (*)(char *, char *, uint64_t))(v180 + 32);
    v174 = v118;
    ((void (*)(char *, char *, uint64_t))v118)(v109, v111, v164);
    uint64_t v119 = (uint64_t)v112;
    uint64_t v120 = (void (*)(void, void, void))v179;
    sub_20A89AA58(v119, (uint64_t)v179);
    uint64_t v121 = v177;
    uint64_t v166 = *(char **)(v177 + 32);
    uint64_t v122 = v185;
    uint64_t v123 = v113;
    uint64_t v124 = v181;
    ((void (*)(char *, char *, uint64_t))v166)(v185, v123, v181);
    uint64_t v169 = *(char **)(v189 + 32);
    uint64_t v125 = v114;
    (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v182, v116, v117);
    v170 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
    sub_20A89CA4C((uint64_t)v120, (uint64_t)v178, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0]);
    (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v184, v122, v124);
    uint64_t v126 = v180;
    uint64_t v127 = v164;
    (*((void (**)(char *, char *, uint64_t))v180 + 2))(v163, v109, v164);
    unint64_t v128 = (*(unsigned __int8 *)(v125 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80);
    unint64_t v129 = (v175 + v172[80] + v128) & ~(unint64_t)v172[80];
    unint64_t v130 = (unint64_t)&v173[*(unsigned __int8 *)(v121 + 80) + v129] & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
    uint64_t v131 = v126[80];
    uint64_t v132 = v124;
    v162 = v109;
    unint64_t v133 = (v176 + v131 + v130) & ~v131;
    uint64_t v134 = swift_allocObject();
    *(void *)(v134 + 16) = v189;
    unint64_t v135 = v134 + v128;
    uint64_t v86 = v188;
    ((void (*)(unint64_t, char *, uint64_t))v168)(v135, v182, v188);
    sub_20A89AA58((uint64_t)v178, v134 + v129);
    ((void (*)(unint64_t, char *, uint64_t))v166)(v134 + v130, v184, v132);
    ((void (*)(unint64_t, char *, uint64_t))v174)(v134 + v133, v163, v127);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v121 + 8))(v185, v132);
    sub_20A89CACC((uint64_t)v179, (unint64_t *)&unk_26AC69450, v170);
    (*((void (**)(char *, uint64_t))v180 + 1))(v162, v127);
    return (*(uint64_t (**)(char *, uint64_t))(v187 + 8))(v183, v86);
  }
  if (v30 == *MEMORY[0x263F58A40])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89A664(0, &qword_26763E8A8, MEMORY[0x263F58D60]);
    uint64_t v137 = &v29[*(int *)(v136 + 48)];
    uint64_t v138 = (void (**)(char *, char *, uint64_t))v180;
    uint64_t v187 = *((void *)v180 + 4);
    uint64_t v139 = v29;
    uint64_t v140 = v164;
    ((void (*)(char *, char *, uint64_t))v187)(v24, v139, v164);
    uint64_t v141 = v177;
    v183 = *(char **)(v177 + 32);
    uint64_t v142 = v185;
    uint64_t v143 = v137;
    uint64_t v144 = v109;
    v162 = v109;
    uint64_t v145 = v181;
    ((void (*)(char *, char *, uint64_t))v183)(v185, v143, v181);
    uint64_t v146 = v189;
    uint64_t v188 = *(void *)(v189 + 32);
    uint64_t v147 = v184;
    (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v184, v142, v145);
    v138[2](v163, v144, v140);
    unint64_t v148 = (*(unsigned __int8 *)(v141 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80);
    unint64_t v149 = (v176 + *((unsigned __int8 *)v138 + 80) + v148) & ~(unint64_t)*((unsigned __int8 *)v138 + 80);
    uint64_t v150 = swift_allocObject();
    *(void *)(v150 + 16) = v146;
    ((void (*)(unint64_t, char *, uint64_t))v183)(v150 + v148, v147, v145);
    uint64_t v151 = v164;
    ((void (*)(unint64_t, char *, uint64_t))v187)(v150 + v149, v163, v164);
    swift_retain();
    sub_20A8C48E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v141 + 8))(v185, v145);
    return ((uint64_t (*)(char *, uint64_t))v138[1])(v162, v151);
  }
  else if (v30 == *MEMORY[0x263F58A58])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    uint64_t v152 = sub_20A8C4D20();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v152 - 8) + 8))(v29, v152);
  }
  else if (v30 == *MEMORY[0x263F58A28])
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
    sub_20A89A664(0, &qword_26763E8A0, MEMORY[0x263F58C10]);
    uint64_t v154 = &v29[*(int *)(v153 + 48)];
    uint64_t v155 = sub_20A8C5100();
    (*(void (**)(char *, uint64_t))(*(void *)(v155 - 8) + 8))(v154, v155);
    return (*((uint64_t (**)(char *, uint64_t))v180 + 1))(v29, v164);
  }
  else
  {
    id v156 = (uint64_t (**)(char *, uint64_t))v180;
    uint64_t v157 = v164;
    if (v30 == *MEMORY[0x263F58A50])
    {
      (*(void (**)(char *, uint64_t))(v26 + 96))(v29, v25);
      sub_20A89A5C8();
      v159 = &v29[*(int *)(v158 + 48)];

      uint64_t v160 = sub_20A8C5100();
      (*(void (**)(char *, uint64_t))(*(void *)(v160 - 8) + 8))(v159, v160);
      return v156[1](v29, v157);
    }
    else
    {
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v29, v25);
    }
  }
}

uint64_t sub_20A896A90()
{
  sub_20A4380C4(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  sub_20A89C9EC(v0 + 120, (uint64_t (*)(void))sub_20A481954);

  swift_release();
  swift_unknownObjectRelease();
  sub_20A89CACC(v0 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_urlReferralData, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28]);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager);
  return v0;
}

uint64_t sub_20A896B40()
{
  sub_20A896A90();

  return swift_deallocClassInstance();
}

uint64_t sub_20A896B98()
{
  return type metadata accessor for ArticleCoordinator();
}

uint64_t type metadata accessor for ArticleCoordinator()
{
  uint64_t result = qword_26AC67B00;
  if (!qword_26AC67B00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A896BEC()
{
  sub_20A897510(319, (unint64_t *)&unk_26AC699F0, MEMORY[0x263F79E28], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_20A896CFC(uint64_t a1, uint64_t a2)
{
  return sub_20A89205C(a1, a2);
}

uint64_t sub_20A896D20(uint64_t a1, uint64_t a2)
{
  return sub_20A896DB0(a1, a2, MEMORY[0x263F7A400], &qword_26AC69B10, MEMORY[0x263F7A400]);
}

uint64_t sub_20A896D68(uint64_t a1, uint64_t a2)
{
  return sub_20A896DB0(a1, a2, MEMORY[0x263F7A3F0], &qword_26AC69B08, MEMORY[0x263F7A3F0]);
}

uint64_t sub_20A896DB0(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  return sub_20A8C4980();
}

uint64_t sub_20A896E30(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_20A8C4CA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = *v2;
  sub_20A894864(a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  *(void *)(v10 + ((v7 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
  swift_retain();
  sub_20A8C48E0();
  return swift_release();
}

uint64_t sub_20A896F98(uint64_t a1, uint64_t a2)
{
  return sub_20A8C48C0();
}

uint64_t sub_20A896FD0(uint64_t a1)
{
  return sub_20A89539C(a1);
}

uint64_t sub_20A896FF4(uint64_t a1, void *a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = a2;

  id v6 = a2;
  return sub_20A892534();
}

uint64_t sub_20A897044()
{
  return sub_20A8C4980();
}

uint64_t sub_20A8970C4(uint64_t a1, uint64_t a2)
{
  return sub_20A8970E4(a1, a2, MEMORY[0x263F79AE0]);
}

uint64_t sub_20A8970D4(uint64_t a1, uint64_t a2)
{
  return sub_20A8970E4(a1, a2, MEMORY[0x263F79AE8]);
}

uint64_t sub_20A8970E4(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4 = sub_20A8C68F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C68E0();
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v5 + 104))(v7, *a3, v4, v10);
  sub_20A8C68D0();
  sub_20A89CB3C(&qword_26AC676D8, MEMORY[0x263F79AD8]);
  sub_20A8C4940();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t sub_20A8972D4()
{
  uint64_t v0 = sub_20A8C71D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_20A8C6BC0();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v1 + 104))(v3, *MEMORY[0x263F7A170], v0, v6);
  sub_20A8C6BB0();
  sub_20A89CB3C(&qword_26763E890, MEMORY[0x263F79D28]);
  sub_20A8C4940();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_20A8974B4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 64);
  uint64_t v3 = *(void *)(*v0 + 72);
  __swift_project_boxed_opaque_existential_1((void *)(*v0 + 40), v2);
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v3 + 8))(*(void *)(v1 + 32), v2, v3);
}

void sub_20A897510(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_20A897574(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a2;
  uint64_t v31 = a1;
  uint64_t v2 = sub_20A8C2800();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v35 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_20A8C6AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v32 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_20A8C6CD0();
  uint64_t v30 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C6CC0();
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v29 = v10;
  uint64_t v11 = sub_20A8C4620();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v27 = v14 | 7;
  uint64_t v28 = v15 + v13;
  uint64_t v16 = swift_allocObject();
  long long v26 = xmmword_20A8D3DC0;
  *(_OWORD *)(v16 + 16) = xmmword_20A8D3DC0;
  uint64_t v17 = *MEMORY[0x263F24D48];
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104);
  v18(v16 + v15, v17, v11);
  sub_20A89CB3C(&qword_26763E8C8, MEMORY[0x263F79E08]);
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  uint64_t v19 = v32;
  sub_20A8C6AB0();
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v26;
  v18(v20 + v15, v17, v11);
  sub_20A89CB3C(&qword_26763E8D0, MEMORY[0x263F79BF0]);
  uint64_t v21 = v33;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v19, v21);
  sub_20A8C6FB0();
  uint64_t v22 = v35;
  sub_20A8C4F40();
  sub_20A89CB3C(&qword_26763E8D8, MEMORY[0x263F79FC8]);
  sub_20A8C4570();
  uint64_t v23 = v38;
  char v24 = *(void (**)(char *, uint64_t))(v37 + 8);
  v24(v22, v38);
  sub_20A8C4F30();
  sub_20A8C4580();
  return ((uint64_t (*)(char *, uint64_t))v24)(v22, v23);
}

uint64_t sub_20A897A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v63 = a6;
  uint64_t v52 = a5;
  uint64_t v53 = a1;
  uint64_t v54 = a4;
  uint64_t v50 = a3;
  uint64_t v59 = a2;
  uint64_t v6 = sub_20A8C2800();
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_20A8C6B00();
  uint64_t v9 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  unint64_t v57 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v55 = (char *)&v48 - v12;
  uint64_t v58 = sub_20A8C40E0();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_20A8C6AF0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v61 = v15;
  uint64_t v62 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v51 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = (uint64_t (*)(uint64_t))MEMORY[0x263F58D60];
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v22 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B70];
  sub_20A897510(0, (unint64_t *)&unk_26AC69430, MEMORY[0x263F58B70], v18);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v48 - v24;
  long long v26 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v18);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v29 = (char *)&v48 - v28;
  uint64_t v30 = sub_20A8C4F10();
  uint64_t v31 = *(void *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v29, v50, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v29, 0, 1, v30);
  uint64_t v32 = sub_20A8C4F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v25, 1, 1, v32);
  uint64_t v33 = sub_20A8C54A0();
  uint64_t v34 = *(void *)(v33 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v21, v52, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v21, 0, 1, v33);
  sub_20A89BABC(v53, (uint64_t)v29, v54, (uint64_t)v25, (uint64_t)v21);
  sub_20A89CACC((uint64_t)v21, &qword_26AC694C0, v49);
  sub_20A89CACC((uint64_t)v25, (unint64_t *)&unk_26AC69430, v22);
  sub_20A89CACC((uint64_t)v29, &qword_26AC69428, v26);
  __swift_project_boxed_opaque_existential_1((void *)(v59 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager), *(void *)(v59 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager + 24));
  sub_20A8C3600();
  char v35 = sub_20A8C4040();
  uint64_t v36 = (unsigned int *)MEMORY[0x263F79CB8];
  if ((v35 & 1) == 0) {
    uint64_t v36 = (unsigned int *)MEMORY[0x263F79CB0];
  }
  uint64_t v37 = v55;
  uint64_t v38 = v60;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v55, *v36, v60);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v57, v37, v38);
  uint64_t v39 = v51;
  sub_20A8C6AE0();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v14, v58);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v38);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v40 = sub_20A8C4620();
  uint64_t v41 = *(void *)(v40 - 8);
  unint64_t v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v41 + 104))(v43 + v42, *MEMORY[0x263F24D48], v40);
  sub_20A89CB3C(&qword_26AC699A0, MEMORY[0x263F79CA8]);
  uint64_t v44 = v61;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v44);
  sub_20A8C6BD0();
  sub_20A8C4F40();
  sub_20A89CB3C(&qword_26763E8E0, MEMORY[0x263F79D38]);
  sub_20A8C4570();
  uint64_t v45 = v65;
  uint64_t v46 = *(void (**)(char *, uint64_t))(v64 + 8);
  v46(v8, v65);
  sub_20A8C4F30();
  sub_20A8C4580();
  return ((uint64_t (*)(char *, uint64_t))v46)(v8, v45);
}

uint64_t sub_20A8982A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v86 = a6;
  uint64_t v73 = a5;
  uint64_t v70 = a4;
  uint64_t v67 = a3;
  uint64_t v81 = a2;
  uint64_t v89 = a1;
  uint64_t v6 = sub_20A8C2800();
  uint64_t v87 = *(void *)(v6 - 8);
  uint64_t v88 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v85 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_20A8C6B00();
  uint64_t v78 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v79 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v76 = (char *)&v64 - v10;
  uint64_t v80 = sub_20A8C40E0();
  uint64_t v77 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v74 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A8C6AF0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v83 = v12;
  uint64_t v84 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v75 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_20A8C5410();
  *(void *)&long long v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_20A8C70B0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v71 = v17;
  uint64_t v72 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v66 = (uint64_t)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = (uint64_t (*)(uint64_t))MEMORY[0x263F58D60];
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v64 - v22;
  uint64_t v24 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B70];
  sub_20A897510(0, (unint64_t *)&unk_26AC69430, MEMORY[0x263F58B70], v20);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v64 - v26;
  uint64_t v28 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], v20);
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v31 = (char *)&v64 - v30;
  uint64_t v32 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v20);
  MEMORY[0x270FA5388](v33 - 8);
  char v35 = (char *)&v64 - v34;
  uint64_t v36 = sub_20A8C4F10();
  uint64_t v37 = *(void *)(v36 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v35, v67, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v35, 0, 1, v36);
  uint64_t v38 = sub_20A8C5010();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v31, 1, 1, v38);
  uint64_t v39 = sub_20A8C4F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v27, 1, 1, v39);
  uint64_t v40 = sub_20A8C54A0();
  uint64_t v41 = *(void *)(v40 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v23, v70, v40);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v23, 0, 1, v40);
  sub_20A89BABC(v89, (uint64_t)v35, (uint64_t)v31, (uint64_t)v27, (uint64_t)v23);
  sub_20A89CACC((uint64_t)v23, &qword_26AC694C0, v65);
  sub_20A89CACC((uint64_t)v27, (unint64_t *)&unk_26AC69430, v24);
  sub_20A89CACC((uint64_t)v31, (unint64_t *)&unk_26AC69450, v28);
  sub_20A89CACC((uint64_t)v35, &qword_26AC69428, v32);
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v16, v73, v69);
  uint64_t v42 = v66;
  sub_20A8B2D74((uint64_t)v16, v66);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v73 = v43;
  uint64_t v44 = sub_20A8C4620();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(void *)(v45 + 72);
  uint64_t v47 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v48 = (v47 + 32) & ~v47;
  uint64_t v69 = v47 | 7;
  uint64_t v70 = v48 + v46;
  uint64_t v49 = swift_allocObject();
  long long v68 = xmmword_20A8D3DC0;
  *(_OWORD *)(v49 + 16) = xmmword_20A8D3DC0;
  LODWORD(v67) = *MEMORY[0x263F24D48];
  uint64_t v65 = *(uint64_t (**)(uint64_t))(v45 + 104);
  v65(v49 + v48);
  sub_20A89CB3C(&qword_26763E8F8, MEMORY[0x263F7A080]);
  uint64_t v50 = v71;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v42, v50);
  __swift_project_boxed_opaque_existential_1((void *)(v81 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager), *(void *)(v81 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager + 24));
  uint64_t v51 = v74;
  sub_20A8C3600();
  char v52 = sub_20A8C4040();
  uint64_t v53 = v78;
  uint64_t v54 = (unsigned int *)MEMORY[0x263F79CB8];
  if ((v52 & 1) == 0) {
    uint64_t v54 = (unsigned int *)MEMORY[0x263F79CB0];
  }
  unint64_t v55 = v76;
  uint64_t v56 = v82;
  (*(void (**)(char *, void, uint64_t))(v78 + 104))(v76, *v54, v82);
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v79, v55, v56);
  unint64_t v57 = v75;
  sub_20A8C6AE0();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v51, v80);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v56);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = v68;
  ((void (*)(uint64_t, void, uint64_t))v65)(v58 + v48, v67, v44);
  sub_20A89CB3C(&qword_26AC699A0, MEMORY[0x263F79CA8]);
  uint64_t v59 = v83;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v57, v59);
  sub_20A8C6DF0();
  uint64_t v60 = v85;
  sub_20A8C4F40();
  sub_20A89CB3C(&qword_26763E900, MEMORY[0x263F79E88]);
  sub_20A8C4570();
  uint64_t v61 = v88;
  uint64_t v62 = *(void (**)(char *, uint64_t))(v87 + 8);
  v62(v60, v88);
  sub_20A8C4F30();
  sub_20A8C4580();
  return ((uint64_t (*)(char *, uint64_t))v62)(v60, v61);
}

uint64_t sub_20A898DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v77 = a4;
  uint64_t v78 = a5;
  *(void *)&long long v75 = a3;
  uint64_t v62 = a2;
  uint64_t v79 = a1;
  uint64_t v71 = sub_20A8C6B00();
  uint64_t v69 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v66 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v67 = (char *)v58 - v7;
  uint64_t v65 = sub_20A8C40E0();
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v63 = (char *)v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_20A8C6AF0();
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  long long v68 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_20A8C57E0();
  uint64_t v76 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v11 = (char *)v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_20A8C7530();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v59 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = (uint64_t (*)(uint64_t))MEMORY[0x263F58D60];
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v58 - v15;
  uint64_t v17 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B70];
  sub_20A897510(0, (unint64_t *)&unk_26AC69430, MEMORY[0x263F58B70], v13);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v58 - v19;
  uint64_t v21 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], v13);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)v58 - v23;
  uint64_t v25 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v13);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v28 = (char *)v58 - v27;
  uint64_t v29 = sub_20A8C4F10();
  uint64_t v30 = *(void *)(v29 - 8);
  (*(void (**)(char *, void, uint64_t))(v30 + 16))(v28, v75, v29);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v28, 0, 1, v29);
  uint64_t v31 = sub_20A8C5010();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v24, 1, 1, v31);
  uint64_t v32 = sub_20A8C4F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v20, 1, 1, v32);
  uint64_t v33 = sub_20A8C54A0();
  uint64_t v34 = *(void *)(v33 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v16, v77, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v16, 0, 1, v33);
  uint64_t v35 = v74;
  sub_20A89BABC(v79, (uint64_t)v28, (uint64_t)v24, (uint64_t)v20, (uint64_t)v16);
  sub_20A89CACC((uint64_t)v16, &qword_26AC694C0, v73);
  sub_20A89CACC((uint64_t)v20, (unint64_t *)&unk_26AC69430, v17);
  sub_20A89CACC((uint64_t)v24, (unint64_t *)&unk_26AC69450, v21);
  uint64_t v36 = (uint64_t)v28;
  uint64_t v37 = v76;
  sub_20A89CACC(v36, &qword_26AC69428, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v11, v78, v35);
  uint64_t result = sub_20A8C57D0();
  if ((~*(void *)&v39 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v39 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v39 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v40 = v59;
  sub_20A8C7520();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v35);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v78 = v41;
  uint64_t v42 = sub_20A8C4620();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = *(void *)(v43 + 72);
  uint64_t v45 = *(unsigned __int8 *)(v43 + 80);
  uint64_t v46 = (v45 + 32) & ~v45;
  uint64_t v76 = v45 | 7;
  uint64_t v77 = v46 + v44;
  uint64_t v47 = swift_allocObject();
  long long v75 = xmmword_20A8D3DC0;
  *(_OWORD *)(v47 + 16) = xmmword_20A8D3DC0;
  LODWORD(v74) = *MEMORY[0x263F24D48];
  uint64_t v73 = *(uint64_t (**)(uint64_t))(v43 + 104);
  v73(v47 + v46);
  sub_20A89CB3C(&qword_26763E908, MEMORY[0x263F7A498]);
  v58[1] = 0x800000020A913910;
  uint64_t v48 = v61;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v40, v48);
  __swift_project_boxed_opaque_existential_1((void *)(v62 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager), *(void *)(v62 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager + 24));
  uint64_t v49 = v63;
  sub_20A8C3600();
  char v50 = sub_20A8C4040();
  uint64_t v51 = v69;
  char v52 = (unsigned int *)MEMORY[0x263F79CB8];
  if ((v50 & 1) == 0) {
    char v52 = (unsigned int *)MEMORY[0x263F79CB0];
  }
  uint64_t v53 = v67;
  uint64_t v54 = v71;
  (*(void (**)(char *, void, uint64_t))(v69 + 104))(v67, *v52, v71);
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v66, v53, v54);
  unint64_t v55 = v68;
  sub_20A8C6AE0();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v49, v65);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v54);
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = v75;
  ((void (*)(uint64_t, void, uint64_t))v73)(v56 + v46, v74, v42);
  sub_20A89CB3C(&qword_26AC699A0, MEMORY[0x263F79CA8]);
  uint64_t v57 = v72;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v55, v57);
  sub_20A8C73F0();
  sub_20A89CB3C(&qword_26763E910, MEMORY[0x263F7A358]);
  memset(v80, 0, 32);
  sub_20A8C45D0();
  return sub_20A89C9EC((uint64_t)v80, (uint64_t (*)(void))sub_20A42F348);
}

uint64_t sub_20A8998B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v63 = a6;
  uint64_t v52 = a5;
  uint64_t v53 = a1;
  uint64_t v54 = a4;
  uint64_t v50 = a3;
  uint64_t v59 = a2;
  uint64_t v6 = sub_20A8C2800();
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_20A8C6B00();
  uint64_t v9 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v57 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v55 = (char *)&v48 - v12;
  uint64_t v58 = sub_20A8C40E0();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_20A8C6AF0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v61 = v15;
  uint64_t v62 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v51 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = (uint64_t (*)(uint64_t))MEMORY[0x263F58D60];
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v22 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B70];
  sub_20A897510(0, (unint64_t *)&unk_26AC69430, MEMORY[0x263F58B70], v18);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v48 - v24;
  uint64_t v26 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v18);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v29 = (char *)&v48 - v28;
  uint64_t v30 = sub_20A8C4F10();
  uint64_t v31 = *(void *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v29, v50, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v29, 0, 1, v30);
  uint64_t v32 = sub_20A8C4F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v25, 1, 1, v32);
  uint64_t v33 = sub_20A8C54A0();
  uint64_t v34 = *(void *)(v33 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v21, v52, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v21, 0, 1, v33);
  sub_20A89BABC(v53, (uint64_t)v29, v54, (uint64_t)v25, (uint64_t)v21);
  sub_20A89CACC((uint64_t)v21, &qword_26AC694C0, v49);
  sub_20A89CACC((uint64_t)v25, (unint64_t *)&unk_26AC69430, v22);
  sub_20A89CACC((uint64_t)v29, &qword_26AC69428, v26);
  __swift_project_boxed_opaque_existential_1((void *)(v59 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager), *(void *)(v59 + OBJC_IVAR____TtC8StocksUI18ArticleCoordinator_watchlistManager + 24));
  sub_20A8C3600();
  char v35 = sub_20A8C4040();
  uint64_t v36 = (unsigned int *)MEMORY[0x263F79CB8];
  if ((v35 & 1) == 0) {
    uint64_t v36 = (unsigned int *)MEMORY[0x263F79CB0];
  }
  uint64_t v37 = v55;
  uint64_t v38 = v60;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v55, *v36, v60);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v57, v37, v38);
  double v39 = v51;
  sub_20A8C6AE0();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v14, v58);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v38);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v40 = sub_20A8C4620();
  uint64_t v41 = *(void *)(v40 - 8);
  unint64_t v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_20A8D3DC0;
  (*(void (**)(unint64_t, void, uint64_t))(v41 + 104))(v43 + v42, *MEMORY[0x263F24D48], v40);
  sub_20A89CB3C(&qword_26AC699A0, MEMORY[0x263F79CA8]);
  uint64_t v44 = v61;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v44);
  sub_20A8C7000();
  sub_20A8C4F40();
  sub_20A89CB3C(&qword_26AC69A48, MEMORY[0x263F7A010]);
  sub_20A8C4570();
  uint64_t v45 = v65;
  uint64_t v46 = *(void (**)(char *, uint64_t))(v64 + 8);
  v46(v8, v65);
  sub_20A8C4F30();
  sub_20A8C4580();
  return ((uint64_t (*)(char *, uint64_t))v46)(v8, v45);
}

uint64_t sub_20A89A0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t v34 = a4;
  uint64_t v32 = a3;
  uint64_t v35 = sub_20A8C2800();
  uint64_t v4 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = (uint64_t (*)(uint64_t))MEMORY[0x263F58D60];
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v30 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B70];
  sub_20A897510(0, (unint64_t *)&unk_26AC69430, MEMORY[0x263F58B70], v7);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t v14 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], v7);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v30 - v16;
  uint64_t v18 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v7);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v30 - v20;
  uint64_t v22 = sub_20A8C4F10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = sub_20A8C5010();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  uint64_t v24 = sub_20A8C4F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v13, 1, 1, v24);
  uint64_t v25 = sub_20A8C54A0();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v10, v32, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v10, 0, 1, v25);
  sub_20A89BABC(v33, (uint64_t)v21, (uint64_t)v17, (uint64_t)v13, (uint64_t)v10);
  sub_20A89CACC((uint64_t)v10, &qword_26AC694C0, v31);
  sub_20A89CACC((uint64_t)v13, (unint64_t *)&unk_26AC69430, v30);
  sub_20A89CACC((uint64_t)v17, (unint64_t *)&unk_26AC69450, v14);
  sub_20A89CACC((uint64_t)v21, &qword_26AC69428, v18);
  sub_20A8C7420();
  sub_20A8C4F40();
  sub_20A89CB3C(&qword_26763E918, MEMORY[0x263F7A388]);
  sub_20A8C4570();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v28 = v35;
  v27(v6, v35);
  sub_20A8C4F30();
  sub_20A8C4580();
  return ((uint64_t (*)(char *, uint64_t))v27)(v6, v28);
}

void sub_20A89A5C8()
{
  if (!qword_26763E898)
  {
    sub_20A8C4F50();
    sub_20A8C5100();
    sub_20A43F7E0(255, (unint64_t *)&qword_26AC80150);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_26763E898);
    }
  }
}

void sub_20A89A664(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    sub_20A8C4F50();
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v6) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_20A89A6E8()
{
  uint64_t v1 = sub_20A8C54A0();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = sub_20A8C4F50();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);

  return swift_deallocObject();
}

uint64_t sub_20A89A840(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C54A0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_20A8C4F50() - 8);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_20A89A0F4(a1, v7, v1 + v4, v8);
}

void sub_20A89A918()
{
  if (!qword_26AC69420)
  {
    MEMORY[0x270FA5388](0);
    sub_20A8C4F10();
    sub_20A8C4F50();
    sub_20A897510(255, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], MEMORY[0x263F8D8F0]);
    sub_20A8C54A0();
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_26AC69420);
    }
  }
}

uint64_t sub_20A89AA58(uint64_t a1, uint64_t a2)
{
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A89AAF0(uint64_t a1)
{
  return sub_20A89B6E4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t))sub_20A8998B8);
}

void sub_20A89AB08()
{
  if (!qword_26763E8B0)
  {
    sub_20A8C4F10();
    sub_20A8C57E0();
    sub_20A8C54A0();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_26763E8B0);
    }
  }
}

uint64_t sub_20A89AB94()
{
  uint64_t v12 = sub_20A8C4F10();
  uint64_t v1 = *(void *)(v12 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v11 = sub_20A8C54A0();
  uint64_t v4 = *(void *)(v11 - 8);
  unint64_t v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = sub_20A8C57E0();
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t v9 = (v5 + v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v2, v12);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v11);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v9, v7);

  return swift_deallocObject();
}

uint64_t sub_20A89AD74(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C4F10() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_20A8C54A0() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(sub_20A8C57E0() - 8);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = v1 + ((v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_20A898DE4(a1, v10, v1 + v4, v1 + v7, v11);
}

void sub_20A89AEB0()
{
  if (!qword_26763E8B8)
  {
    MEMORY[0x270FA5388](0);
    sub_20A8C4F10();
    sub_20A8C4F50();
    sub_20A8C5410();
    sub_20A8C54A0();
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_26763E8B8);
    }
  }
}

uint64_t sub_20A89AFC0()
{
  uint64_t v16 = sub_20A8C4F10();
  uint64_t v1 = *(void *)(v16 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v15 = sub_20A8C54A0();
  uint64_t v3 = *(void *)(v15 - 8);
  unint64_t v11 = (v12 + v2 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v14 = sub_20A8C5410();
  uint64_t v5 = *(void *)(v14 - 8);
  unint64_t v6 = (v11 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v13 = sub_20A8C4F50();
  uint64_t v8 = *(void *)(v13 - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v12, v16);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v11, v15);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v14);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v9, v13);

  return swift_deallocObject();
}

uint64_t sub_20A89B22C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C4F10() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_20A8C54A0() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(sub_20A8C5410() - 8);
  unint64_t v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(sub_20A8C4F50() - 8);
  uint64_t v13 = *(void *)(v1 + 16);
  uint64_t v14 = v1 + ((v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));

  return sub_20A8982A8(a1, v13, v1 + v4, v1 + v7, v1 + v10, v14);
}

uint64_t objectdestroy_4Tm_1()
{
  uint64_t v1 = sub_20A8C4F10();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], MEMORY[0x263F8D8F0]);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v7 = (v4 + v6) & ~v6;
  uint64_t v19 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v20 = sub_20A8C54A0();
  uint64_t v8 = *(void *)(v20 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = *(void *)(v8 + 64);
  uint64_t v18 = sub_20A8C4F50();
  uint64_t v10 = *(void *)(v18 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  uint64_t v12 = sub_20A8C5010();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))(v0 + v7, 1, v12)) {
    (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v0 + v7, v12);
  }
  unint64_t v14 = (v7 + v19 + v9) & ~v9;
  uint64_t v15 = (v14 + v17 + v11) & ~v11;
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v14, v20);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v15, v18);

  return swift_deallocObject();
}

uint64_t sub_20A89B6CC(uint64_t a1)
{
  return sub_20A89B6E4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t))sub_20A897A6C);
}

uint64_t sub_20A89B6E4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_20A8C4F10() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = v5 + *(void *)(v4 + 64);
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], MEMORY[0x263F8D8F0]);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(*(void *)(v7 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v9 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v10 = *(void *)(sub_20A8C54A0() - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v13 = *(void *)(sub_20A8C4F50() - 8);
  uint64_t v14 = *(void *)(v2 + 16);
  uint64_t v15 = v2 + ((v11 + v12 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));

  return a2(a1, v14, v2 + v5, v2 + v8, v2 + v11, v15);
}

void sub_20A89B8C0()
{
  if (!qword_26763E8C0)
  {
    MEMORY[0x270FA5388](0);
    sub_20A8C4F50();
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_26763E8C0);
    }
  }
}

uint64_t sub_20A89B9B4()
{
  uint64_t v1 = sub_20A8C4F50();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_20A89BA44(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C4F50() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_20A897574(a1, v4);
}

uint64_t sub_20A89BABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v84 = a5;
  uint64_t v85 = a1;
  uint64_t v79 = a3;
  uint64_t v82 = a2;
  uint64_t v5 = sub_20A8C6DA0();
  uint64_t v75 = *(void *)(v5 - 8);
  uint64_t v76 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v74 = (char *)v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A897510(0, &qword_26AC694C0, MEMORY[0x263F58D60], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v83 = (uint64_t)v63 - v9;
  uint64_t v10 = sub_20A8C68B0();
  uint64_t v72 = *(void *)(v10 - 8);
  uint64_t v73 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v71 = (char *)v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A897510(0, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0], v7);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v63 - v13;
  uint64_t v15 = sub_20A8C5010();
  uint64_t v80 = *(void *)(v15 - 8);
  uint64_t v81 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v70 = (char *)v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v78 = (char *)v63 - v18;
  uint64_t v19 = sub_20A8C7820();
  uint64_t v77 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
  sub_20A897510(0, &qword_26AC69428, MEMORY[0x263F58B38], v7);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)v63 - v24;
  uint64_t v26 = sub_20A8C4F10();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)v63 - v31;
  sub_20A89CA4C(v82, (uint64_t)v25, &qword_26AC69428, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    uint64_t v33 = &qword_26AC69428;
    uint64_t v34 = (uint64_t (*)(uint64_t))MEMORY[0x263F58B38];
    uint64_t v35 = (uint64_t)v25;
LABEL_5:
    sub_20A89CACC(v35, v33, v34);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v32, v25, v26);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v29, v32, v26);
  sub_20A572DF0((uint64_t)v29);
  sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
  uint64_t v37 = v36;
  uint64_t v38 = sub_20A8C4620();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(unsigned __int8 *)(v39 + 80);
  uint64_t v41 = (v40 + 32) & ~v40;
  uint64_t v68 = v41 + *(void *)(v39 + 72);
  uint64_t v69 = v37;
  uint64_t v67 = v40 | 7;
  uint64_t v42 = swift_allocObject();
  long long v66 = xmmword_20A8D3DC0;
  *(_OWORD *)(v42 + 16) = xmmword_20A8D3DC0;
  uint64_t v43 = *(void (**)(void))(v39 + 104);
  unsigned int v65 = *MEMORY[0x263F24D48];
  uint64_t v82 = v38;
  uint64_t v64 = (void (*)(uint64_t, void, uint64_t))v43;
  v43(v42 + v41);
  sub_20A89CB3C(&qword_26AC69B78, MEMORY[0x263F7A758]);
  v63[1] = 0x800000020A913910;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v21, v19);
  sub_20A89CA4C(v79, (uint64_t)v14, (unint64_t *)&unk_26AC69450, MEMORY[0x263F58BD0]);
  uint64_t v45 = v80;
  uint64_t v44 = v81;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(v14, 1, v81) == 1)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v26);
    uint64_t v33 = (unint64_t *)&unk_26AC69450;
    uint64_t v34 = (uint64_t (*)(uint64_t))MEMORY[0x263F58BD0];
    uint64_t v35 = (uint64_t)v14;
    goto LABEL_5;
  }
  uint64_t v46 = v78;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v78, v14, v44);
  uint64_t v47 = (uint64_t)v70;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v70, v46, v44);
  uint64_t v48 = v71;
  sub_20A84A2D0(v47);
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = v66;
  v64(v49 + v41, v65, v82);
  sub_20A89CB3C(&qword_26763E8F0, MEMORY[0x263F79AB0]);
  uint64_t v50 = v73;
  sub_20A8C45B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v48, v50);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v78, v44);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v26);
LABEL_7:
  uint64_t v51 = v83;
  sub_20A89CA4C(v84, v83, &qword_26AC694C0, MEMORY[0x263F58D60]);
  uint64_t v52 = sub_20A8C54A0();
  uint64_t v53 = *(void *)(v52 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) == 1) {
    return sub_20A89CACC(v51, &qword_26AC694C0, MEMORY[0x263F58D60]);
  }
  sub_20A8C5490();
  uint64_t v56 = v55;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v51, v52);
  if (v56)
  {
    uint64_t v57 = v74;
    sub_20A8C6D90();
    sub_20A897510(0, (unint64_t *)&qword_26AC7FEC0, MEMORY[0x263F24D50], MEMORY[0x263F8E0F8]);
    uint64_t v58 = sub_20A8C4620();
    uint64_t v59 = *(void *)(v58 - 8);
    unint64_t v60 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_20A8D3DC0;
    (*(void (**)(unint64_t, void, uint64_t))(v59 + 104))(v61 + v60, *MEMORY[0x263F24D48], v58);
    sub_20A89CB3C(&qword_26763E8E8, MEMORY[0x263F79E48]);
    uint64_t v62 = v76;
    sub_20A8C45B0();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v57, v62);
  }
  return result;
}

uint64_t sub_20A89C568()
{
  uint64_t v1 = sub_20A8C4CA0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20A89C60C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C4CA0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_20A894BB0(a1, v1 + v4, v5);
}

uint64_t sub_20A89C6A8()
{
  return sub_20A89527C();
}

uint64_t sub_20A89C6B0()
{
  uint64_t v12 = sub_20A8C5920();
  uint64_t v1 = *(void *)(v12 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v10 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = sub_20A8C4CA0();
  uint64_t v3 = *(void *)(v11 - 8);
  unint64_t v4 = (v10 + *(unsigned __int8 *)(v3 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = sub_20A8C6820();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = (v4 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v2, v12);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v11);
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v8, v6);

  return swift_deallocObject();
}

uint64_t sub_20A89C8A4(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_20A8C5920() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(sub_20A8C4CA0() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(sub_20A8C6820() - 8);
  uint64_t v10 = *(void *)(v1 + v5);
  uint64_t v11 = v1 + ((v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_20A8930AC(a1, v1 + v4, v10, v1 + v7, v11);
}

uint64_t sub_20A89C9EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A89CA4C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_20A897510(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_20A89CACC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_20A897510(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_20A89CB3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_20A89CB84(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A8C9830();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v14 = (_OWORD *)((char *)a1 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    long long v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_20A89CC80(uint64_t a1)
{
  uint64_t v2 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_20A89CCF8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = (_OWORD *)(a2 + v12);
  long long v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A89CDA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  return a1;
}

uint64_t sub_20A89CE84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  return a1;
}

uint64_t sub_20A89CF24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[8];
  uint64_t v14 = (_OWORD *)(a1 + v13);
  long long v15 = (_OWORD *)(a2 + v13);
  long long v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  return a1;
}

uint64_t sub_20A89CFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A89CFEC);
}

uint64_t sub_20A89CFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A8C9830();
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_20A89D0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A89D0D0);
}

uint64_t sub_20A89D0D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_20A8C9830();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for StockViewLayoutOptions()
{
  uint64_t result = qword_26AC74368;
  if (!qword_26AC74368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A89D1DC()
{
  uint64_t result = sub_20A8C9830();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_20A89D28C(uint64_t a1, uint64_t a2, long long *a3, long long *a4, long long *a5, long long *a6, long long *a7, uint64_t a8, uint64_t a9, uint64_t a10, long long *a11, long long *a12)
{
  uint64_t v20 = sub_20A8C5B40();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a8, v20);
  *(void *)((char *)v12 + *(void *)(*v12 + 192)) = a1;
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))((uint64_t)v12 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_networkProxy, *MEMORY[0x263F7CDA0], v20);
  v12[2] = a2;
  sub_20A42BEBC(a3, (uint64_t)(v12 + 3));
  sub_20A42BEBC(a4, (uint64_t)(v12 + 8));
  sub_20A42BEBC(a5, (uint64_t)(v12 + 13));
  sub_20A42BEBC(a6, (uint64_t)(v12 + 18));
  sub_20A42BEBC(a7, (uint64_t)(v12 + 23));
  uint64_t v22 = (void *)((char *)v12 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_newsUserProfileProvider);
  *uint64_t v22 = a9;
  v22[1] = a10;
  sub_20A42BEBC(a11, (uint64_t)v12 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_stockFeedService);
  sub_20A42BEBC(a12, (uint64_t)v12 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_formatService);
  return v12;
}

uint64_t sub_20A89D440@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68F60);
  uint64_t result = sub_20A8C5BB0();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for ArticleStocksFeedService();
    uint64_t v5 = swift_allocObject();
    sub_20A42BEBC(&v6, v5 + 16);
    a2[3] = v4;
    uint64_t result = sub_20A8A1760(&qword_26AC6B728, (void (*)(uint64_t))type metadata accessor for ArticleStocksFeedService);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89D524@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for ArticleRecirculationConfigurationService();
    uint64_t v5 = swift_allocObject();
    sub_20A42BEBC(&v6, v5 + 16);
    a2[3] = v4;
    uint64_t result = sub_20A8A1760(&qword_26AC7E098, (void (*)(uint64_t))type metadata accessor for ArticleRecirculationConfigurationService);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89D608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DemoArticleRecirculationConfigurationService();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0xD00000000000062ALL;
  *(void *)(v3 + 24) = 0x800000020A913B10;
  a1[3] = v2;
  uint64_t result = sub_20A8A1760(&qword_26763E930, (void (*)(uint64_t))type metadata accessor for DemoArticleRecirculationConfigurationService);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_20A89D6A8@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v4 = v16;
  if (v16)
  {
    uint64_t v5 = v17;
    long long v6 = __swift_project_boxed_opaque_existential_1(v15, v16);
    v14[3] = v4;
    v14[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
    uint64_t v8 = *(void (**)(char *, uint64_t *, uint64_t, double))(*(void *)(v4 - 8) + 16);
    uint64_t v9 = ((uint64_t (*)(uint64_t *, void *, uint64_t))v8)(boxed_opaque_existential_1, v6, v4);
    double v10 = MEMORY[0x270FA5388](v9);
    uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v8(v12, boxed_opaque_existential_1, v4, v10);
    BOOL v13 = sub_20A8A1E90((uint64_t)v12, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    *a2 = v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89D7FC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A89EFC4(a1, sub_20A8A15B0, (uint64_t (*)(void))type metadata accessor for ForYouFeedServiceProxy, (uint64_t)&off_26BE635E8, a2);
}

uint64_t sub_20A89D830(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_20A8C5BB0();
  if (v18 == 2)
  {
    __break(1u);
    goto LABEL_20;
  }
  sub_20A8C4250();
  sub_20A8C4230();
  if (qword_26AC69208 != -1) {
    swift_once();
  }
  char v3 = sub_20A8C4240();
  swift_release();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (v18 & 1) == 0 && (v3)
  {
    sub_20A4301D4(0, &qword_26AC68EF0);
    uint64_t result = sub_20A8C5BB0();
    if (v19)
    {
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      sub_20A4301D4(0, &qword_26AC67650);
      uint64_t result = sub_20A8C5BB0();
      if (v17)
      {
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
        uint64_t result = sub_20A8C5BB0();
        if (v14)
        {
          uint64_t v4 = v15;
          __swift_project_boxed_opaque_existential_1(a1, a1[3]);
          sub_20A4301D4(0, &qword_26AC6B2D8);
          uint64_t result = sub_20A8C5BB0();
          if (v13)
          {
            __swift_project_boxed_opaque_existential_1(a1, a1[3]);
            sub_20A4301D4(0, (unint64_t *)&unk_26AC68E50);
            uint64_t result = sub_20A8C5BB0();
            if (v11)
            {
              type metadata accessor for NFFForYouFeedServiceConfigFetcher();
              uint64_t v5 = swift_allocObject();
              sub_20A42BEBC(&v18, v5 + 16);
              sub_20A42BEBC(&v16, v5 + 56);
              *(void *)(v5 + 96) = v14;
              *(void *)(v5 + 104) = v4;
              sub_20A42BEBC(&v12, v5 + 112);
              sub_20A42BEBC(&v10, v5 + 152);
              *(void *)&long long v18 = v5;
              sub_20A844858();
              swift_allocObject();
              long long v6 = (unint64_t *)&unk_26AC7BC58;
              uint64_t v7 = type metadata accessor for NFFForYouFeedServiceConfigFetcher;
LABEL_18:
              sub_20A8A1760(v6, (void (*)(uint64_t))v7);
              return sub_20A8CC340();
            }
            goto LABEL_24;
          }
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (!v19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v17)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
  uint64_t result = sub_20A8C5BB0();
  if (!v14)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B2D8);
  uint64_t result = sub_20A8C5BB0();
  if (!v13)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E50);
  uint64_t result = sub_20A8C5BB0();
  if (v11)
  {
    type metadata accessor for LegacyForYouFeedServiceConfigFetcher();
    uint64_t v9 = swift_allocObject();
    sub_20A42BEBC(&v18, v9 + 16);
    sub_20A42BEBC(&v16, v9 + 56);
    *(void *)(v9 + 96) = v14;
    *(void *)(v9 + 104) = v8;
    sub_20A42BEBC(&v12, v9 + 112);
    sub_20A42BEBC(&v10, v9 + 152);
    *(void *)&long long v18 = v9;
    sub_20A844858();
    swift_allocObject();
    long long v6 = (unint64_t *)&unk_26AC82608;
    uint64_t v7 = type metadata accessor for LegacyForYouFeedServiceConfigFetcher;
    goto LABEL_18;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_20A89DD6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (!v16)
  {
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
  uint64_t result = sub_20A8C5BB0();
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B2D8);
  uint64_t result = sub_20A8C5BB0();
  if (!v10)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E50);
  uint64_t result = sub_20A8C5BB0();
  if (v8)
  {
    type metadata accessor for LegacyForYouFeedServiceConfigFetcher();
    uint64_t v6 = swift_allocObject();
    sub_20A42BEBC(&v15, v6 + 16);
    sub_20A42BEBC(&v13, v6 + 56);
    *(void *)(v6 + 96) = v11;
    *(void *)(v6 + 104) = v5;
    sub_20A42BEBC(&v9, v6 + 112);
    sub_20A42BEBC(&v7, v6 + 152);
    *(void *)&long long v15 = v6;
    sub_20A844858();
    swift_allocObject();
    sub_20A8A1760(&qword_26AC82608, (void (*)(uint64_t))type metadata accessor for LegacyForYouFeedServiceConfigFetcher);
    uint64_t result = sub_20A8CC340();
    *a2 = result;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_20A89DFF8(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(v3, v4);
    sub_20A8C3800();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    if (qword_26AC6D3D0 != -1) {
      swift_once();
    }
    id v2 = (id)qword_26AC6D3C8;
    return sub_20A8CC4B0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89E104(void *a1)
{
  return sub_20A8A045C(a1, 0x6546756F59726F46, 0xEA00000000006465, (void (*)(void))sub_20A8A15F8, sub_20A8A15B0);
}

uint64_t sub_20A89E148(void *a1)
{
  return sub_20A8A0748(a1, 0x6546756F59726F46, 0xEA00000000006465, (void (*)(void))type metadata accessor for ForYouFeedPoolService, sub_20A8A16E4);
}

uint64_t sub_20A89E18C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v15)
  {
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68E68);
  uint64_t result = sub_20A8C5BB0();
  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68F40);
  uint64_t result = sub_20A8C5BB0();
  if (!v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E50);
  uint64_t result = sub_20A8C5BB0();
  if (!v9)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68F00);
  uint64_t result = sub_20A8C5BB0();
  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68EC0);
  uint64_t result = sub_20A8C5BB0();
  if (v5)
  {
    type metadata accessor for ForYouFeedPoolService();
    uint64_t v3 = swift_allocObject();
    sub_20A42BEBC(&v14, v3 + 16);
    sub_20A42BEBC(&v12, v3 + 56);
    sub_20A42BEBC(&v10, v3 + 96);
    sub_20A42BEBC(&v8, v3 + 136);
    sub_20A42BEBC(&v6, v3 + 176);
    sub_20A42BEBC(&v4, v3 + 216);
    return v3;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A89E404(void *a1)
{
  uint64_t v2 = sub_20A8C5B40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4D42C0(0, &qword_26AC7FA40);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (!v29)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v27)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68F40);
  uint64_t result = sub_20A8C5BB0();
  if (!v25)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68ED0);
  uint64_t result = sub_20A8C5BB0();
  if (!v23)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E30);
  uint64_t result = sub_20A8C5BB0();
  if (!v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68EF8);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v8 = v18;
  if (!v18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v13 = v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68E48);
  uint64_t result = sub_20A8C5BB0();
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B228);
  uint64_t result = sub_20A8C5BB0();
  if (v15)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7CDA0], v2);
    type metadata accessor for ForYouFeedGroupEmitterFactory();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    sub_20A42BEBC(&v28, v9 + 24);
    sub_20A42BEBC(&v26, v9 + 64);
    sub_20A42BEBC(&v24, v9 + 104);
    sub_20A42BEBC(&v22, v9 + 144);
    sub_20A42BEBC(&v20, v9 + 184);
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v9 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_networkProxy, v5, v2);
    long long v10 = (void *)(v9 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_newsUserProfileProvider);
    uint64_t v11 = v13;
    void *v10 = v8;
    v10[1] = v11;
    sub_20A42BEBC(&v16, v9 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_stockFeedService);
    sub_20A42BEBC(&v14, v9 + OBJC_IVAR____TtC8StocksUI29ForYouFeedGroupEmitterFactory_formatService);
    return v9;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_20A89E87C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_20A8C5B40();
  uint64_t v16 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for StubForYouFeedGroupEmitterFactory();
  uint64_t v7 = swift_allocObject();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4D42C0(0, &qword_26AC7FA40);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v9 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (!v32)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v30)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68F40);
  uint64_t result = sub_20A8C5BB0();
  if (!v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68ED0);
  uint64_t result = sub_20A8C5BB0();
  if (!v26)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v15 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E30);
  uint64_t result = sub_20A8C5BB0();
  if (!v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v10 = v7;
  long long v14 = a2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68EF8);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v11 = v21;
  if (!v21)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v12 = v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68E48);
  uint64_t result = sub_20A8C5BB0();
  if (!v20)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B228);
  uint64_t result = sub_20A8C5BB0();
  if (v18)
  {
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v6, *MEMORY[0x263F7CDA0], v4);
    sub_20A8A1AE8();
    swift_allocObject();
    uint64_t result = (uint64_t)sub_20A89D28C(v10, v15, &v31, &v29, &v27, &v25, &v23, (uint64_t)v6, v11, v12, &v19, &v17);
    *long long v14 = result;
    return result;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_20A89ECB8()
{
  sub_20A8A15F8();
  sub_20A8C6290();

  return swift_release();
}

uint64_t sub_20A89ED18(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ForYouFeedGroupEmitterFactory();
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v16 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8A16E4(0);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v15 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4D42C0(0, (unint64_t *)&qword_26AC7FB20);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B220);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v3 = v13;
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v4 = v14;
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v11[3] = v3;
  v11[4] = *(void *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
  if (qword_26AC6D3D0 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_26AC6D3C8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B078);
  id v8 = v7;
  uint64_t result = sub_20A8C5BB0();
  if (v10)
  {
    sub_20A8A15F8();
    uint64_t v9 = sub_20A8CC6E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return v9;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A89EF90@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A89EFC4(a1, sub_20A8A1944, (uint64_t (*)(void))type metadata accessor for StockFeedServiceProxy, (uint64_t)&off_26BE6A730, a2);
}

uint64_t sub_20A89EFC4@<X0>(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a2(0);
  uint64_t result = sub_20A8C5BA0();
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = a3(0);
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v10;
    a5[3] = v11;
    a5[4] = a4;
    *a5 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89F06C(void *a1)
{
  sub_20A8A1A94(0, (unint64_t *)&qword_26AC68DE8, MEMORY[0x263F7AAA0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_20A8C5BB0();
  char v9 = v29;
  if (v29 == 2)
  {
    __break(1u);
    goto LABEL_17;
  }
  sub_20A8C4250();
  sub_20A8C4230();
  if (qword_26AC69208 != -1) {
    swift_once();
  }
  char v10 = sub_20A8C4240();
  swift_release();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (v9 & 1) == 0 && (v10)
  {
    sub_20A4301D4(0, &qword_26AC68ED8);
    uint64_t result = sub_20A8C5BB0();
    if (v30)
    {
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      uint64_t v11 = sub_20A8C3190();
      sub_20A8C5BB0();
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11);
      if (result != 1)
      {
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
        uint64_t result = sub_20A8C5BB0();
        uint64_t v13 = v27;
        if (v27)
        {
          uint64_t v14 = v28;
          __swift_project_boxed_opaque_existential_1(a1, a1[3]);
          sub_20A4301D4(0, &qword_26AC6B2D8);
          uint64_t result = sub_20A8C5BB0();
          if (v26)
          {
            type metadata accessor for NFFStockFeedServiceConfigFetcher(0);
            uint64_t v15 = swift_allocObject();
            sub_20A42BEBC(&v29, v15 + 16);
            (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v15 + OBJC_IVAR____TtC8StocksUI32NFFStockFeedServiceConfigFetcher_appConfiguration, v7, v11);
            uint64_t v16 = (void *)(v15 + OBJC_IVAR____TtC8StocksUI32NFFStockFeedServiceConfigFetcher_newsConfigurationManager);
            *uint64_t v16 = v13;
            v16[1] = v14;
            sub_20A42BEBC(&v25, v15 + OBJC_IVAR____TtC8StocksUI32NFFStockFeedServiceConfigFetcher_paidBundleConfigManager);
            *(void *)&long long v29 = v15;
            sub_20A7FAD14();
            swift_allocObject();
            long long v17 = (unint64_t *)&unk_26AC7AF50;
            uint64_t v18 = (void (*)(uint64_t))type metadata accessor for NFFStockFeedServiceConfigFetcher;
LABEL_15:
            sub_20A8A1760(v17, v18);
            return sub_20A8CC340();
          }
          goto LABEL_20;
        }
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v19 = sub_20A8C3190();
  sub_20A8C5BB0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v4, 1, v19);
  if (result == 1)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v21 = v25;
  if (!(void)v25)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v22 = *((void *)&v25 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B2D8);
  uint64_t result = sub_20A8C5BB0();
  if (v30)
  {
    type metadata accessor for StockFeedServiceConfigFetcher(0);
    uint64_t v23 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_appConfiguration, v4, v19);
    uint64_t v24 = (void *)(v23 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_newsConfigurationManager);
    void *v24 = v21;
    v24[1] = v22;
    sub_20A42BEBC(&v29, v23 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_paidBundleConfigManager);
    *(void *)&long long v29 = v23;
    sub_20A7FAD14();
    swift_allocObject();
    long long v17 = (unint64_t *)&unk_26AC82520;
    uint64_t v18 = (void (*)(uint64_t))type metadata accessor for StockFeedServiceConfigFetcher;
    goto LABEL_15;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_20A89F5F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_20A8A1A94(0, (unint64_t *)&qword_26AC68DE8, MEMORY[0x263F7AAA0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = sub_20A8C3190();
  sub_20A8C5BB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68F30);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v10 = v17;
  if (!v17)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v11 = v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B2D8);
  uint64_t result = sub_20A8C5BB0();
  if (v16)
  {
    type metadata accessor for StockFeedServiceConfigFetcher(0);
    uint64_t v12 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_appConfiguration, v6, v7);
    uint64_t v13 = (void *)(v12 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_newsConfigurationManager);
    *uint64_t v13 = v10;
    v13[1] = v11;
    sub_20A42BEBC(&v15, v12 + OBJC_IVAR____TtC8StocksUI29StockFeedServiceConfigFetcher_paidBundleConfigManager);
    *(void *)&long long v15 = v12;
    sub_20A7FAD14();
    swift_allocObject();
    sub_20A8A1760(&qword_26AC82520, (void (*)(uint64_t))type metadata accessor for StockFeedServiceConfigFetcher);
    uint64_t result = sub_20A8CC340();
    *a2 = result;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20A89F89C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4D42C0(0, &qword_26AC7F988);
  uint64_t result = sub_20A8C5BA0();
  if (result)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A4D42C0(0, (unint64_t *)&unk_26AC7FA20);
    uint64_t result = sub_20A8C5BA0();
    if (result)
    {
      uint64_t v5 = sub_20A8CCE40();
      swift_allocObject();
      uint64_t result = sub_20A8CCE30();
      uint64_t v6 = MEMORY[0x263F59A08];
      a2[3] = v5;
      a2[4] = v6;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A89F998@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v3 = type metadata accessor for StocksPersonalizationConfigurationManager();
  uint64_t result = sub_20A8C5BA0();
  if (result)
  {
    uint64_t v5 = result;
    a2[3] = v3;
    uint64_t result = sub_20A8A1760(qword_26AC675D0, (void (*)(uint64_t))type metadata accessor for StocksPersonalizationConfigurationManager);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89FA40(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (v4)
  {
    type metadata accessor for StocksPersonalizationConfigurationManager();
    uint64_t v2 = swift_allocObject();
    sub_20A42BEBC(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A89FAE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A89FB10(a1, MEMORY[0x263F7AD08], a2);
}

uint64_t sub_20A89FAF8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A89FB10(a1, MEMORY[0x263F7AD10], a2);
}

uint64_t sub_20A89FB10@<X0>(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t *a3@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC67578);
  a2();
  sub_20A8C5B70();
  uint64_t result = swift_bridgeObjectRelease();
  if (v9[3])
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A4301D4(0, (unint64_t *)&unk_26AC68AE0);
    uint64_t result = sub_20A8C5BB0();
    if (v8[3])
    {
      uint64_t v7 = type metadata accessor for AttributionProvider();
      swift_allocObject();
      uint64_t result = sub_20A5D98FC(v9, (uint64_t)v8);
      a3[3] = v7;
      a3[4] = (uint64_t)&off_26BE67018;
      *a3 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_20A89FC58@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for ManagedConfigurationService;
  unint64_t result = sub_20A8A1A40();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_20A89FC8C()
{
  uint64_t v0 = sub_20A8C6410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8A17DC();
  sub_20A8C6290();
  swift_release();
  type metadata accessor for StockFeedGroupEmitterFactory();
  sub_20A8C6290();
  swift_release();
  sub_20A8CC4C0();
  sub_20A8C62A0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F7D010], v0);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_20A8A1944(0);
  sub_20A8C6290();
  swift_release();
  sub_20A8A18C8(0);
  sub_20A8C6290();
  swift_release();
  type metadata accessor for StockFeedPoolService();
  sub_20A8C6290();
  return swift_release();
}

uint64_t sub_20A89FEDC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for StockFeedGroupEmitterFactory();
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v16 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8A18C8(0);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v15 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4D42C0(0, (unint64_t *)&qword_26AC7FB20);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B220);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v3 = v13;
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v4 = v14;
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v11[3] = v3;
  v11[4] = *(void *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
  if (qword_26AC6CF90 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_26AC6CF88;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B078);
  id v8 = v7;
  uint64_t result = sub_20A8C5BB0();
  if (v10)
  {
    sub_20A8A17DC();
    uint64_t v9 = sub_20A8CC6E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return v9;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A8A0154(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B228);
  uint64_t result = sub_20A8C5BB0();
  if (v20)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
    uint64_t result = sub_20A8C5BB0();
    uint64_t v3 = v17;
    if (v17)
    {
      uint64_t v4 = type metadata accessor for StockFeedGroupEmitterFactory();
      uint64_t v5 = v18;
      uint64_t v6 = __swift_project_boxed_opaque_existential_1(v16, v17);
      void v15[3] = v3;
      v15[4] = v5;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      id v8 = *(void (**)(char *, uint64_t *, uint64_t, double))(*(void *)(v3 - 8) + 16);
      uint64_t v9 = ((uint64_t (*)(uint64_t *, void *, uint64_t))v8)(boxed_opaque_existential_1, v6, v3);
      double v10 = MEMORY[0x270FA5388](v9);
      uint64_t v12 = (char *)&v15[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      v8(v12, boxed_opaque_existential_1, v3, v10);
      uint64_t v13 = sub_20A4486E8(&v19, (uint64_t)v12, v4, v3, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      return v13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A8A030C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(v3, v4);
    sub_20A8C3800();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    if (qword_26AC6CF90 != -1) {
      swift_once();
    }
    id v2 = (id)qword_26AC6CF88;
    return sub_20A8CC4B0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A8A0418(void *a1)
{
  return sub_20A8A045C(a1, 0x6565466B636F7453, 0xE900000000000064, (void (*)(void))sub_20A8A17DC, sub_20A8A1944);
}

uint64_t sub_20A8A045C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(void))
{
  sub_20A8A1A94(0, &qword_26AC6AF38, MEMORY[0x263F597A0]);
  MEMORY[0x270FA5388](v8 - 8);
  double v10 = (char *)&v19[-1] - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = sub_20A8CC4C0();
  sub_20A8C5B70();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a4(0);
  uint64_t result = sub_20A8C5BA0();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B110);
  uint64_t result = sub_20A8C5BB0();
  if (!v23)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC6B220);
  uint64_t result = sub_20A8C5BB0();
  uint64_t v13 = v21;
  if (v21)
  {
    uint64_t v14 = v22;
    uint64_t v15 = __swift_project_boxed_opaque_existential_1(v20, v21);
    v19[3] = v13;
    v19[4] = *(void *)(v14 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(boxed_opaque_existential_1, v15, v13);
    a5(0);
    swift_allocObject();
    uint64_t v17 = sub_20A8CD030();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    return v17;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_20A8A0704(void *a1)
{
  return sub_20A8A0748(a1, 0x6565466B636F7453, 0xE900000000000064, (void (*)(void))type metadata accessor for StockFeedPoolService, sub_20A8A18C8);
}

uint64_t sub_20A8A0748(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(void))
{
  sub_20A8A1A94(0, &qword_26AC6AF38, MEMORY[0x263F597A0]);
  MEMORY[0x270FA5388](v8 - 8);
  double v10 = (char *)v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = sub_20A8CC4C0();
  sub_20A8C5B70();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    a4(0);
    uint64_t result = sub_20A8C5BA0();
    if (result)
    {
      v13[1] = result;
      a5(0);
      swift_allocObject();
      return sub_20A8CC5D0();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20A8A08E0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A4301D4(0, &qword_26AC68E48);
  uint64_t result = sub_20A8C5BB0();
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A4301D4(0, (unint64_t *)&unk_26AC68E90);
    uint64_t result = sub_20A8C5BB0();
    if (v5)
    {
      type metadata accessor for StockFeedPoolService();
      uint64_t v3 = swift_allocObject();
      sub_20A42BEBC(&v6, v3 + 16);
      sub_20A42BEBC(&v4, v3 + 56);
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ServiceAssembly()
{
  return self;
}

uint64_t sub_20A8A0A08(uint64_t a1)
{
  uint64_t v2 = sub_20A8C6410();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_20A8C6690();
  uint64_t v35 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC69478);
  sub_20A8C62A0();
  swift_release();
  swift_release();
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC695B0);
  sub_20A8C62A0();
  swift_release();
  uint64_t v10 = *MEMORY[0x263F7D048];
  uint64_t v11 = *(void (**)(char *))(v7 + 104);
  uint64_t v40 = v7 + 104;
  uint64_t v41 = v11;
  ((void (*)(char *, uint64_t, uint64_t))v11)(v9, v10, v6);
  sub_20A8C5980();
  swift_release();
  swift_release();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v37 = v7 + 8;
  v30(v9, v6);
  sub_20A8C5CC0();
  sub_20A8C62A0();
  swift_release();
  uint64_t v12 = *MEMORY[0x263F7D010];
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  unsigned int v33 = v12;
  uint64_t v36 = v2;
  v42(v5, v12, v2);
  uint64_t v38 = v3 + 104;
  sub_20A8C59B0();
  swift_release();
  swift_release();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v5, v2);
  uint64_t v32 = v13;
  uint64_t v39 = v3 + 8;
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC72CF8);
  sub_20A8C62A0();
  swift_release();
  swift_release();
  sub_20A8C5CC0();
  sub_20A844858();
  sub_20A8C6290();
  swift_release();
  unsigned int v31 = *MEMORY[0x263F7D040];
  uint64_t v14 = v35;
  v41(v9);
  sub_20A8C5980();
  swift_release();
  swift_release();
  uint64_t v15 = v14;
  uint64_t v16 = v30;
  v30(v9, v15);
  sub_20A8C5CD0();
  sub_20A8CC4C0();
  sub_20A8C62A0();
  swift_release();
  uint64_t v17 = v12;
  uint64_t v18 = v36;
  v42(v5, v17, v36);
  long long v29 = v5;
  sub_20A8C59B0();
  swift_release();
  swift_release();
  v13(v5, v18);
  sub_20A8C5CD0();
  sub_20A8A15B0(0);
  sub_20A8C6290();
  swift_release();
  swift_release();
  sub_20A8C5CD0();
  sub_20A8A16E4(0);
  sub_20A8C6290();
  swift_release();
  swift_release();
  sub_20A8C5CD0();
  type metadata accessor for ForYouFeedPoolService();
  sub_20A8C6290();
  swift_release();
  swift_release();
  sub_20A8C5CD0();
  type metadata accessor for ForYouFeedGroupEmitterFactory();
  sub_20A8C6290();
  swift_release();
  uint64_t v19 = v31;
  uint64_t v20 = v35;
  uint64_t v21 = (void (*)(char *, uint64_t, uint64_t))v41;
  ((void (*)(char *, void, uint64_t))v41)(v9, v31, v35);
  sub_20A8C5980();
  swift_release();
  swift_release();
  v16(v9, v20);
  sub_20A8C5CD0();
  sub_20A8C6280();
  swift_release();
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC723A0);
  sub_20A8C62A0();
  swift_release();
  swift_release();
  sub_20A8C5CC0();
  sub_20A7FAD14();
  sub_20A8C6290();
  swift_release();
  v21(v9, v19, v20);
  sub_20A8C5980();
  swift_release();
  swift_release();
  v16(v9, v20);
  uint64_t v22 = a1;
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC6B110);
  sub_20A8C62A0();
  swift_release();
  swift_release();
  sub_20A8C5CC0();
  sub_20A4301D4(0, (unint64_t *)&unk_26AC67588);
  sub_20A8C62A0();
  swift_release();
  uint64_t v23 = v29;
  uint64_t v24 = v33;
  uint64_t v25 = v36;
  uint64_t v26 = v42;
  v42(v29, v33, v36);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  uint64_t v27 = v32;
  v32(v23, v25);
  uint64_t v34 = v22;
  sub_20A8C5CD0();
  type metadata accessor for StocksPersonalizationConfigurationManager();
  sub_20A8C6290();
  swift_release();
  v26(v23, v24, v25);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  v27(v23, v25);
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC68BC0);
  sub_20A8C37D0();
  sub_20A8C62A0();
  swift_release();
  swift_bridgeObjectRelease();
  v26(v23, v24, v25);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  v27(v23, v25);
  sub_20A8C5CC0();
  sub_20A8C37E0();
  sub_20A8C62A0();
  swift_release();
  swift_bridgeObjectRelease();
  v26(v23, v24, v25);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  v27(v23, v25);
  sub_20A8C5CC0();
  sub_20A4301D4(0, &qword_26AC68AD8);
  sub_20A8C62A0();
  swift_release();
  v26(v23, v24, v25);
  sub_20A8C59B0();
  swift_release();
  swift_release();
  v27(v23, v25);
  sub_20A8C5CD0();
  sub_20A8C6280();
  return swift_release();
}

void sub_20A8A15B0(uint64_t a1)
{
}

void sub_20A8A15F8()
{
  if (!qword_26AC6AFF0)
  {
    type metadata accessor for ForYouFeedGroupEmitterFactory();
    sub_20A8A16E4(255);
    sub_20A8A1760(&qword_26AC79188, (void (*)(uint64_t))type metadata accessor for ForYouFeedGroupEmitterFactory);
    sub_20A8A1760(&qword_26AC6AF90, sub_20A8A16E4);
    unint64_t v0 = sub_20A8CC6F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC6AFF0);
    }
  }
}

void sub_20A8A16E4(uint64_t a1)
{
}

uint64_t sub_20A8A172C()
{
  return sub_20A8A1760(&qword_26AC72C20, (void (*)(uint64_t))type metadata accessor for ForYouFeedPoolService);
}

uint64_t sub_20A8A1760(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A8A17A8()
{
  return sub_20A8A1760(&qword_26AC6AFE8, (void (*)(uint64_t))sub_20A8A15F8);
}

void sub_20A8A17DC()
{
  if (!qword_26AC6AFE0)
  {
    type metadata accessor for StockFeedGroupEmitterFactory();
    sub_20A8A18C8(255);
    sub_20A8A1760(&qword_26AC78918, (void (*)(uint64_t))type metadata accessor for StockFeedGroupEmitterFactory);
    sub_20A8A1760(&qword_26AC6AF80, sub_20A8A18C8);
    unint64_t v0 = sub_20A8CC6F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC6AFE0);
    }
  }
}

void sub_20A8A18C8(uint64_t a1)
{
}

uint64_t sub_20A8A1910()
{
  return sub_20A8A1760(qword_26AC72310, (void (*)(uint64_t))type metadata accessor for StockFeedPoolService);
}

void sub_20A8A1944(uint64_t a1)
{
}

void sub_20A8A198C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_20A8A1A0C()
{
  return sub_20A8A1760((unint64_t *)&unk_26AC6AFD0, (void (*)(uint64_t))sub_20A8A17DC);
}

unint64_t sub_20A8A1A40()
{
  unint64_t result = qword_26AC68BF0;
  if (!qword_26AC68BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC68BF0);
  }
  return result;
}

void sub_20A8A1A94(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_20A8CF1B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_20A8A1AE8()
{
  if (!qword_26763E920)
  {
    type metadata accessor for StubForYouFeedGroupEmitterFactory();
    unint64_t v0 = type metadata accessor for ProxyForYouFeedGroupEmitterFactory();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26763E920);
    }
  }
}

uint64_t getEnumTagSinglePayload for QuoteDetailViewComponent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for QuoteDetailViewComponent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x20A8A1CA4);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuoteDetailViewComponent()
{
  return &type metadata for QuoteDetailViewComponent;
}

unint64_t sub_20A8A1CE0()
{
  unint64_t result = qword_26AC75B58;
  if (!qword_26AC75B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC75B58);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NewsSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A8A1E00);
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

ValueMetadata *type metadata accessor for NewsSource()
{
  return &type metadata for NewsSource;
}

unint64_t sub_20A8A1E3C()
{
  unint64_t result = qword_26763E938;
  if (!qword_26763E938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E938);
  }
  return result;
}

BOOL sub_20A8A1E90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  double v4 = MEMORY[0x270FA5388](a1);
  unsigned int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v3 + 32))(v6, v4);
  char v7 = sub_20A8C3800();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, a2);
  return (v7 & 1) == 0;
}

uint64_t *sub_20A8A1F7C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A8C9830();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    unint64_t v11 = (char *)a2 + v8;
    v10[80] = v11[80];
    long long v12 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v12;
    *((_OWORD *)v10 + 4) = *((_OWORD *)v11 + 4);
    long long v13 = *((_OWORD *)v11 + 1);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v13;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v14 = a3[7];
    uint64_t v15 = (_OWORD *)((char *)a1 + v14);
    uint64_t v16 = (_OWORD *)((char *)a2 + v14);
    long long v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
  }
  return a1;
}

uint64_t sub_20A8A2084(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)(v9 + 80) = *(unsigned char *)(v10 + 80);
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v13 = a3[7];
  uint64_t v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = (_OWORD *)(a2 + v13);
  long long v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  return a1;
}

uint64_t sub_20A8A213C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 32);
  long long v11 = *(_OWORD *)(v9 + 48);
  long long v12 = *(_OWORD *)(v9 + 64);
  *(unsigned char *)(v8 + 80) = *(unsigned char *)(v9 + 80);
  *(_OWORD *)(v8 + 48) = v11;
  *(_OWORD *)(v8 + 64) = v12;
  *(_OWORD *)(v8 + 32) = v10;
  long long v13 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v13;
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  long long v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  void v15[3] = v16[3];
  return a1;
}

uint64_t sub_20A8A2210(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)(v9 + 80) = *(unsigned char *)(v10 + 80);
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v13 = a3[7];
  uint64_t v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = (_OWORD *)(a2 + v13);
  long long v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  return a1;
}

uint64_t sub_20A8A22C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A8C9830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)(v9 + 80) = *(unsigned char *)(v10 + 80);
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v13 = a3[7];
  uint64_t v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = (_OWORD *)(a2 + v13);
  long long v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  return a1;
}

uint64_t sub_20A8A2380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8A2394);
}

uint64_t sub_20A8A2394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A8C9830();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 80);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_20A8A2454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8A2468);
}

uint64_t sub_20A8A2468(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_20A8C9830();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 80) = -(char)a2;
  }
  return result;
}

uint64_t type metadata accessor for QuoteDetailViewLayoutOptions()
{
  uint64_t result = qword_26AC78770;
  if (!qword_26AC78770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A8A2574()
{
  uint64_t result = sub_20A8C9830();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for QuoteDetailViewDirectionalLayoutOptions(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for QuoteDetailViewDirectionalLayoutOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_20A8A26E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_20A8A26F0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QuoteDetailViewDirectionalLayoutOptions()
{
  return &type metadata for QuoteDetailViewDirectionalLayoutOptions;
}

ValueMetadata *type metadata accessor for QuoteDetailViewVerticalLayoutOptions()
{
  return &type metadata for QuoteDetailViewVerticalLayoutOptions;
}

uint64_t getEnumTagSinglePayload for QuoteDetailViewHorizontalLayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for QuoteDetailViewHorizontalLayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for QuoteDetailViewHorizontalLayoutOptions()
{
  return &type metadata for QuoteDetailViewHorizontalLayoutOptions;
}

uint64_t type metadata accessor for LinkActionActivityProvider()
{
  return self;
}

void *sub_20A8A286C(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = sub_20A8C2530();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v85 = (char *)v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = (void *)sub_20A8C3F00();
  uint64_t v86 = *(v87 - 1);
  MEMORY[0x270FA5388](v87);
  uint64_t v84 = (char *)v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_20A8C9F40();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4D4A5C();
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v80 - v25;
  uint64_t v98 = &unk_26BEE0E78;
  uint64_t v27 = swift_dynamicCastObjCProtocolConditional();
  if (v27)
  {
    uint64_t v82 = v14;
    uint64_t v83 = v13;
    uint64_t v28 = (void *)v27;
    swift_unknownObjectRetain();
    id v29 = sub_20A8A3480(v28, v6);
    sub_20A8A3554(v28, v6, (uint64_t)v26);
    uint64_t v88 = v28;
    uint64_t v89 = v6;
    uint64_t v90 = v26;
    sub_20A8A3B38(v6, v28, (uint64_t)v26);
    uint64_t v91 = a1;
    if (v30)
    {
      id v31 = a2;
      uint64_t v32 = (void *)sub_20A8CE240();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v31 = a2;
      uint64_t v32 = 0;
    }
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C5D0]), sel_initWithTitle_sourceView_, v32, v31);

    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F7DA38], v17);
    v95 = &type metadata for Tracker;
    unint64_t v96 = sub_20A8A77BC();
    double v99 = a3;
    double v100 = a4;
    double v101 = a5;
    double v102 = a6;
    char v103 = 0;
    sub_20A8C99D0();
    swift_allocObject();
    id v34 = v31;
    uint64_t v35 = sub_20A8C99B0();
    if (v29)
    {
      swift_unknownObjectRetain();
      sub_20A8A4230(v33, v29, (uint64_t)v88, v35);
      swift_unknownObjectRelease();
      swift_release();
      swift_unknownObjectRelease_n();
    }
    else
    {
      uint64_t v38 = (uint64_t)v90;
      sub_20A44D308((uint64_t)v90, (uint64_t)v23);
      uint64_t v39 = v86;
      uint64_t v40 = v87;
      if ((*(unsigned int (**)(char *, uint64_t, void *))(v86 + 48))(v23, 1, v87) != 1)
      {
        uint64_t v79 = (uint64_t)v84;
        (*(void (**)(char *, char *, void *))(v39 + 32))(v84, v23, v40);
        sub_20A8A6C2C(v33, v79, (uint64_t)v88);
        swift_unknownObjectRelease();
        swift_release();
        (*(void (**)(uint64_t, void *))(v39 + 8))(v79, v40);
        uint64_t v36 = v38;
        goto LABEL_9;
      }
      uint64_t v86 = v35;
      sub_20A8A7944((uint64_t)v23, (uint64_t (*)(void))sub_20A4D4A5C);
      type metadata accessor for Localized();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v81 = self;
      uint64_t v84 = (char *)ObjCClassFromMetadata;
      id v42 = objc_msgSend(v81, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_20A8C2370();

      id v43 = objc_msgSend(self, sel_ts_chevronRight);
      uint64_t v44 = swift_allocObject();
      swift_unknownObjectUnownedInit();
      uint64_t v45 = swift_allocObject();
      uint64_t v46 = v88;
      *(void *)(v45 + 16) = v44;
      *(void *)(v45 + 24) = v46;
      id v47 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
      swift_unknownObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      id v48 = v43;
      swift_retain();
      uint64_t v49 = (void *)sub_20A8CE240();
      swift_bridgeObjectRelease();
      unint64_t v96 = (unint64_t)sub_20A8A784C;
      uint64_t v97 = v45;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v93 = 1107296256;
      v80[1] = &v94;
      uint64_t v94 = sub_20A8A6A5C;
      v95 = (ValueMetadata *)&block_descriptor_53;
      uint64_t v50 = _Block_copy(&aBlock);
      id v51 = objc_msgSend(v47, sel_initWithLabel_image_type_block_, v49, v48, 0, v50);

      _Block_release(v50);
      swift_release();
      uint64_t v87 = v33;
      objc_msgSend(v33, sel_addActivity_, v51);
      swift_bridgeObjectRelease();

      swift_release();
      swift_release();

      uint64_t v52 = *(void **)(v89 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_qualifier);
      uint64_t v53 = v46;
      id v54 = [v46 URL];
      uint64_t v55 = v85;
      sub_20A8C24E0();

      uint64_t v56 = (void *)sub_20A8C24D0();
      uint64_t v57 = *(void (**)(char *, uint64_t))(v82 + 8);
      uint64_t v58 = v83;
      v57(v55, v83);
      LODWORD(v44) = objc_msgSend(v52, sel_allowOpenInSafariForURL_, v56);

      if (v44)
      {
        id v59 = objc_msgSend(v81, sel_bundleForClass_, v84);
        sub_20A8C2370();

        sub_20A8C58C0();
        unint64_t v60 = (void *)sub_20A8C58A0();
        uint64_t v61 = swift_allocObject();
        *(void *)(v61 + 16) = v53;
        id v62 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v63 = (void *)sub_20A8CE240();
        swift_bridgeObjectRelease();
        unint64_t v96 = (unint64_t)sub_20A8A78A0;
        uint64_t v97 = v61;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v93 = 1107296256;
        uint64_t v94 = sub_20A8A6A5C;
        v95 = (ValueMetadata *)&block_descriptor_10;
        uint64_t v64 = _Block_copy(&aBlock);
        id v65 = objc_msgSend(v62, sel_initWithLabel_image_type_block_, v63, v60, 0, v64);

        long long v66 = v64;
        uint64_t v58 = v83;
        _Block_release(v66);
        swift_release();
        objc_msgSend(v87, sel_addActivity_, v65);
        swift_bridgeObjectRelease();

        uint64_t v55 = v85;
        swift_release();
      }
      id v67 = [v53 URL];
      sub_20A8C24E0();

      uint64_t v68 = (void *)sub_20A8C24D0();
      v57(v55, v58);
      unsigned int v69 = objc_msgSend(v52, sel_allowCopyingOfURL_, v68);

      if (!v69)
      {
        sub_20A8A7944((uint64_t)v90, (uint64_t (*)(void))sub_20A4D4A5C);
        swift_unknownObjectRelease();
        swift_release();
        return v87;
      }
      id v70 = objc_msgSend(v81, sel_bundleForClass_, v84);
      uint64_t v89 = sub_20A8C2370();

      sub_20A8C58C0();
      uint64_t v71 = (void *)sub_20A8C5890();
      uint64_t v72 = v55;
      id v73 = objc_msgSend(self, sel_generalPasteboard);
      id v74 = [v53 URL];
      sub_20A8C24E0();

      sub_20A8C24C0();
      v57(v72, v58);
      id v75 = objc_allocWithZone(MEMORY[0x263F6C630]);
      uint64_t v76 = (void *)sub_20A8CE240();
      swift_bridgeObjectRelease();
      uint64_t v77 = (void *)sub_20A8CE240();
      swift_bridgeObjectRelease();
      id v78 = objc_msgSend(v75, sel_initWithLabel_image_type_pasteboard_string_, v76, v71, 1, v73, v77);

      id v33 = v87;
      objc_msgSend(v87, sel_addActivity_, v78);
      swift_unknownObjectRelease();

      swift_release();
    }
    uint64_t v36 = (uint64_t)v90;
LABEL_9:
    sub_20A8A7944(v36, (uint64_t (*)(void))sub_20A4D4A5C);
    return v33;
  }
  return objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C5D0]), sel_initWithTitle_sourceView_, 0, a2);
}

id sub_20A8A3480(void *a1, uint64_t a2)
{
  id result = [a1 URL];
  if (result)
  {
    int v4 = result;
    id v5 = objc_msgSend(result, sel_fc_NewsArticleID);

    if (!v5) {
      return 0;
    }
    sub_20A8CE280();

    uint64_t v6 = *(void **)(*(void *)(a2 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_linkedContentProvider) + 16);
    uint64_t v7 = (void *)sub_20A8CE240();
    id v8 = objc_msgSend(v6, sel_headlineForIdentifier_, v7);
    swift_bridgeObjectRelease();

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A8A3554@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v27[1] = a2;
  uint64_t v33 = a3;
  uint64_t v31 = sub_20A8C5E90();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v28 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8A7D50(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C5ED0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v30 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_20A8C2530();
  id v12 = objc_msgSend(a1, "URL", MEMORY[0x270FA5388](v11 - 8));
  sub_20A8C24E0();

  sub_20A8C60C0();
  swift_allocObject();
  sub_20A8C60A0();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_20A8A78A8(0, (unint64_t *)&qword_26AC7FF00, MEMORY[0x263F7CEF8], MEMORY[0x263F8E0F8]);
  sub_20A8C6150();
  uint64_t v14 = swift_allocObject();
  long long v32 = xmmword_20A8D3DC0;
  *(_OWORD *)(v14 + 16) = xmmword_20A8D3DC0;
  sub_20A8A78A8(0, &qword_26AC7FEF0, MEMORY[0x263F7CED8], v13);
  uint64_t v15 = *(void *)(sub_20A8C60E0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v32;
  uint64_t v18 = (void *)(v17 + v16);
  *uint64_t v18 = 0x6C6F626D7973;
  v18[1] = 0xE600000000000000;
  (*(void (**)(void))(v15 + 104))();
  unint64_t v19 = sub_20A62F630(MEMORY[0x263F8EE78]);
  MEMORY[0x21051E410](0x736B636F7473, 0xE600000000000000, 0, 0, 0, 0, 0, 0, v17, v19);
  sub_20A8C60B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  uint64_t v21 = v30;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v30, v7, v8);
  uint64_t v22 = v28;
  sub_20A8C5EB0();
  uint64_t v23 = sub_20A8C5E80();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v31);
  if (v25)
  {
    uint64_t v34 = v23;
    uint64_t v35 = v25;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_20A8C63F0();
    swift_release();
    swift_bridgeObjectRelease_n();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v21, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v8);
    swift_release();
    uint64_t v20 = sub_20A8C3F00();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v33, 1, 1, v20);
  }
}

uint64_t sub_20A8A3B38(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v56 = a3;
  uint64_t v49 = sub_20A8C2220();
  uint64_t v51 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4845D0(0);
  MEMORY[0x270FA5388](v6 - 8);
  id v47 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8A7CD4(0);
  MEMORY[0x270FA5388](v8 - 8);
  id v48 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for StocksActivity(0);
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4D4A5C();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v55 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_20A8C3F00();
  uint64_t v57 = *(void *)(v13 - 8);
  uint64_t v58 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_20A8C2530();
  uint64_t v17 = *(void *)(v16 - 8);
  double v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a1 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_router);
  id v52 = a2;
  id v22 = objc_msgSend(a2, "URL", v18);
  sub_20A8C24E0();

  uint64_t v23 = (void *)sub_20A73F3E0((uint64_t)v20);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v17 + 8);
  v24(v20, v16);

  uint64_t v25 = 0;
  if (!v23)
  {
    uint64_t v26 = (uint64_t)v53;
    uint64_t v45 = v24;
    uint64_t v46 = v17 + 8;
    uint64_t v44 = v17;
    uint64_t v27 = v55;
    sub_20A44D308(v56, v55);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v27, 1, v58) == 1)
    {
      sub_20A8A7944(v27, (uint64_t (*)(void))sub_20A4D4A5C);
      id v32 = [v52 URL];
      sub_20A8C24E0();

      uint64_t v33 = (uint64_t)v48;
      sub_20A8C2190();
      v45(v20, v16);
      uint64_t v34 = v51;
      uint64_t v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
      uint64_t v36 = v49;
      if (!v35(v33, 1, v49)) {
        sub_20A8C21E0();
      }
      unsigned int v37 = v35(v33, 1, v36);
      uint64_t v38 = v50;
      uint64_t v39 = v44;
      if (!v37) {
        sub_20A8C2200();
      }
      if (!v35(v33, 1, v36))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v38, v33, v36);
        uint64_t v40 = (uint64_t)v47;
        sub_20A8C21A0();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v38, v36);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v40, 1, v16) != 1)
        {
          uint64_t v25 = sub_20A8C24C0();
          v45((char *)v40, v16);
          goto LABEL_14;
        }
        sub_20A8A7944(v40, (uint64_t (*)(void))sub_20A4845D0);
      }
      uint64_t v25 = 0;
LABEL_14:
      sub_20A8A7944(v33, (uint64_t (*)(void))sub_20A8A7CD4);
      return v25;
    }
    uint64_t v29 = v57;
    uint64_t v28 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v15, v27, v58);
    uint64_t v59 = *(void *)(v21 + 112);
    sub_20A4F6DE4();
    uint64_t v31 = *(int *)(v30 + 48);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v26, v15, v28);
    *(void *)(v26 + v31) = 0;
    type metadata accessor for StocksActivity.StockFeed(0);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    sub_20A491334();
    sub_20A8A7D08((unint64_t *)&qword_26AC69E50, (void (*)(uint64_t))sub_20A491334);
    swift_retain();
    uint64_t v41 = (void *)sub_20A8CBCA0();
    sub_20A8A7944(v26, type metadata accessor for StocksActivity);
    swift_release();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v15, v58);

    return 0;
  }
  return v25;
}

uint64_t sub_20A8A4230(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v126 = a4;
  id v140 = a2;
  id v144 = a1;
  sub_20A556120(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v131 = (char *)v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4AE208(0);
  uint64_t v132 = v7;
  uint64_t v136 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v123 = (char *)v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122[1] = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v142 = (char *)v122 - v10;
  sub_20A8A790C(0);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v130 = (char *)v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_20A8C5390();
  uint64_t v129 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  unint64_t v128 = (char *)v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A747520();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v122 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4845D0(0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v122 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_20A8C4B90();
  uint64_t v134 = *(void *)(v20 - 8);
  uint64_t v135 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v125 = (char *)v122 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v122 - v23;
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v137 = self;
  uint64_t v138 = ObjCClassFromMetadata;
  id v26 = objc_msgSend(v137, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v27 = objc_msgSend(self, sel_ts_chevronRight);
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v28;
  *(void *)(v29 + 24) = a3;
  id v30 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v31 = v27;
  swift_retain();
  id v32 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  uint64_t v150 = (uint64_t (*)(uint64_t))sub_20A8A7DE4;
  uint64_t v151 = (void *)v29;
  id aBlock = (id)MEMORY[0x263EF8330];
  uint64_t v147 = 1107296256;
  unint64_t v148 = sub_20A8A6A5C;
  unint64_t v149 = &block_descriptor_17_0;
  uint64_t v33 = _Block_copy(&aBlock);
  id v34 = objc_msgSend(v30, sel_initWithLabel_image_type_block_, v32, v31, 0, v33);

  _Block_release(v33);
  swift_release();
  objc_msgSend(v144, sel_addActivity_, v34);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  id v35 = objc_msgSend(v140, sel_identifier);
  sub_20A8CE280();

  uint64_t v36 = sub_20A8C2530();
  unsigned int v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56);
  v37(v19, 1, 1, v36);
  uint64_t v38 = (uint64_t)v19;
  sub_20A8C4B80();
  uint64_t v39 = *(void *)(v143 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_commandCenter);
  uint64_t v145 = *(void *)(v143 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_commandCenter + 8);
  uint64_t ObjectType = swift_getObjectType();
  if (qword_26AC81128 != -1) {
    swift_once();
  }
  uint64_t v127 = qword_26AC9EC00;
  sub_20A42FC8C();
  uint64_t v42 = *(int *)(v41 + 48);
  uint64_t v43 = &v16[*(int *)(v41 + 64)];
  v37((char *)v38, 1, 1, v36);
  uint64_t v44 = v129;
  uint64_t v45 = v128;
  uint64_t v46 = v139;
  (*(void (**)(char *, void, uint64_t))(v129 + 104))(v128, *MEMORY[0x263F58CD8], v139);
  unint64_t v133 = v24;
  sub_20A8C4D30();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
  sub_20A8A7944(v38, (uint64_t (*)(void))sub_20A4845D0);
  *(void *)&v16[v42] = 0;
  type metadata accessor for StocksActivity.Article(0);
  *(_OWORD *)uint64_t v43 = 0u;
  *((_OWORD *)v43 + 1) = 0u;
  *((void *)v43 + 4) = 0;
  swift_storeEnumTagMultiPayload();
  uint64_t v47 = type metadata accessor for StocksActivity(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v16, 0, 1, v47);
  uint64_t v141 = ObjectType;
  LOBYTE(v47) = sub_20A8C8D00();
  sub_20A8A7944((uint64_t)v16, (uint64_t (*)(void))sub_20A747520);
  uint64_t v48 = v39;
  if (v47)
  {
    id v49 = objc_msgSend(v137, sel_bundleForClass_, v138);
    sub_20A8C2370();

    sub_20A8CB580();
    uint64_t v50 = (void *)sub_20A8CB570();
    uint64_t v51 = v39;
    uint64_t v52 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v53 = v134;
    uint64_t v54 = v125;
    uint64_t v55 = v135;
    (*(void (**)(char *, char *, uint64_t))(v134 + 16))(v125, v133, v135);
    unint64_t v56 = (*(unsigned __int8 *)(v53 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v57 = swift_allocObject();
    *(void *)(v57 + 16) = v52;
    (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v57 + v56, v54, v55);
    id v58 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v59 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v150 = sub_20A8A7B90;
    uint64_t v151 = (void *)v57;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v147 = 1107296256;
    unint64_t v148 = sub_20A8A6A5C;
    unint64_t v149 = &block_descriptor_52_0;
    unint64_t v60 = _Block_copy(&aBlock);
    id v61 = objc_msgSend(v58, sel_initWithLabel_image_type_block_, v59, v50, 1, v60);

    _Block_release(v60);
    swift_release();
    objc_msgSend(v144, sel_addActivity_, v61);
    uint64_t v48 = v51;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  uint64_t v129 = sub_20A8CB840();
  sub_20A8CB6C0();
  id v62 = v140;
  id aBlock = v140;
  swift_unknownObjectRetain();
  char v63 = sub_20A8C8D00();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v139 = v48;
  if (v63)
  {
    id v64 = objc_msgSend(v137, sel_bundleForClass_, v138);
    sub_20A8C2370();

    sub_20A8C58C0();
    id v65 = (void *)sub_20A8C58A0();
    uint64_t v66 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v67 = swift_allocObject();
    *(void *)(v67 + 16) = v66;
    *(void *)(v67 + 24) = v62;
    id v68 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
    swift_unknownObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    unsigned int v69 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v150 = sub_20A8A7A74;
    uint64_t v151 = (void *)v67;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v147 = 1107296256;
    unint64_t v148 = sub_20A8A6A5C;
    unint64_t v149 = &block_descriptor_45_0;
    id v70 = _Block_copy(&aBlock);
    id v71 = objc_msgSend(v68, sel_initWithLabel_image_type_block_, v69, v65, 1, v70);

    _Block_release(v70);
    swift_release();
    objc_msgSend(v144, sel_addActivity_, v71);
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();
  }
  sub_20A8CB7C0();
  sub_20A4EED24();
  id v73 = v130;
  id v74 = &v130[*(int *)(v72 + 64)];
  id v75 = &v130[*(int *)(v72 + 80)];
  *((void *)v130 + 1) = 0;
  v73[2] = 0;
  *id v73 = v62;
  uint64_t v76 = *MEMORY[0x263F59C98];
  uint64_t v77 = sub_20A8CD5D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 104))(v74, v76, v77);
  *(void *)id v75 = 0;
  *((void *)v75 + 1) = 0;
  uint64_t v78 = *MEMORY[0x263F59C80];
  uint64_t v79 = sub_20A8CD5C0();
  uint64_t v80 = *(void *)(v79 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v80 + 104))(v73, v78, v79);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v80 + 56))(v73, 0, 1, v79);
  swift_unknownObjectRetain();
  LOBYTE(v78) = sub_20A8C8D00();
  swift_release();
  sub_20A8A7944((uint64_t)v73, (uint64_t (*)(void))sub_20A8A790C);
  if (v78)
  {
    id v81 = objc_msgSend(v137, sel_bundleForClass_, v138);
    sub_20A8C2370();

    sub_20A8C58C0();
    uint64_t v82 = (void *)sub_20A8C58B0();
    uint64_t v83 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v84 = (void *)swift_allocObject();
    v84[2] = v83;
    v84[3] = v62;
    v84[4] = v126;
    id v85 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
    swift_unknownObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v86 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v150 = sub_20A8A7A64;
    uint64_t v151 = v84;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v147 = 1107296256;
    unint64_t v148 = sub_20A8A6A5C;
    unint64_t v149 = &block_descriptor_38_0;
    uint64_t v87 = _Block_copy(&aBlock);
    id v88 = objc_msgSend(v85, sel_initWithLabel_image_type_block_, v86, v82, 1, v87);

    _Block_release(v87);
    swift_release();
    objc_msgSend(v144, sel_addActivity_, v88);
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();
  }
  sub_20A8CB6B0();
  id aBlock = v62;
  swift_unknownObjectRetain();
  char v89 = sub_20A8C8D00();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v90 = v136;
  uint64_t v91 = v142;
  if (v89)
  {
    id v92 = objc_msgSend(v137, sel_bundleForClass_, v138);
    sub_20A8C2370();

    sub_20A8C58C0();
    uint64_t v93 = (void *)sub_20A8C5890();
    uint64_t v94 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v95 = swift_allocObject();
    *(void *)(v95 + 16) = v94;
    *(void *)(v95 + 24) = v62;
    id v96 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
    swift_unknownObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v97 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v150 = sub_20A8A79EC;
    uint64_t v151 = (void *)v95;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v147 = 1107296256;
    unint64_t v148 = sub_20A8A6A5C;
    unint64_t v149 = &block_descriptor_31;
    uint64_t v98 = _Block_copy(&aBlock);
    id v99 = objc_msgSend(v96, sel_initWithLabel_image_type_block_, v97, v93, 1, v98);

    _Block_release(v98);
    swift_release();
    objc_msgSend(v144, sel_addActivity_, v99);
    swift_bridgeObjectRelease();

    swift_release();
    uint64_t v91 = v142;
    swift_release();
  }
  id aBlock = v62;
  sub_20A4549BC();
  swift_unknownObjectRetain();
  sub_20A8CD500();
  sub_20A8CB7A0();
  uint64_t v100 = (uint64_t)v131;
  uint64_t v101 = v132;
  id v140 = *(id *)(v90 + 16);
  ((void (*)(char *, char *, uint64_t))v140)(v131, v91, v132);
  double v102 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v90 + 56);
  v102(v100, 0, 1, v101);
  char v103 = sub_20A8C8D00();
  swift_release();
  sub_20A8A7944(v100, (uint64_t (*)(void))sub_20A556120);
  if ((v103 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v90 + 8))(v142, v101);
    return (*(uint64_t (**)(char *, uint64_t))(v134 + 8))(v133, v135);
  }
  sub_20A8CB7A0();
  unint64_t v104 = (void (*)(char *, char *, uint64_t))v140;
  ((void (*)(uint64_t, char *, uint64_t))v140)(v100, v142, v101);
  v102(v100, 0, 1, v101);
  sub_20A4AE1B4();
  sub_20A8C8CB0();
  swift_release();
  sub_20A8A7944(v100, (uint64_t (*)(void))sub_20A556120);
  char v105 = (char)aBlock;
  if (aBlock == 2)
  {
    (*(void (**)(char *, uint64_t))(v136 + 8))(v142, v101);
    return (*(uint64_t (**)(char *, uint64_t))(v134 + 8))(v133, v135);
  }
  uint64_t v107 = v104;
  uint64_t v108 = v142;
  uint64_t v145 = sub_20A8A6184();
  sub_20A8CDB50();
  uint64_t v109 = v136;
  if (v105) {
    uint64_t v110 = sub_20A8CDB20();
  }
  else {
    uint64_t v110 = sub_20A8CDB30();
  }
  v111 = (void *)v110;
  uint64_t v112 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v113 = v123;
  uint64_t v114 = v101;
  v107(v123, v108, v101);
  unint64_t v115 = (*(unsigned __int8 *)(v109 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
  uint64_t v116 = swift_allocObject();
  *(void *)(v116 + 16) = v112;
  (*(void (**)(unint64_t, char *, uint64_t))(v109 + 32))(v116 + v115, v113, v114);
  id v117 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
  id v118 = v111;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v119 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  uint64_t v150 = sub_20A8A79BC;
  uint64_t v151 = (void *)v116;
  id aBlock = (id)MEMORY[0x263EF8330];
  uint64_t v147 = 1107296256;
  unint64_t v148 = sub_20A8A6A5C;
  unint64_t v149 = &block_descriptor_24_1;
  uint64_t v120 = _Block_copy(&aBlock);
  id v121 = objc_msgSend(v117, sel_initWithLabel_image_type_block_, v119, v118, 1, v120);

  _Block_release(v120);
  swift_release();
  objc_msgSend(v144, sel_addActivity_, v121);
  swift_bridgeObjectRelease();

  swift_release();
  (*(void (**)(char *, uint64_t))(v109 + 8))(v108, v114);
  (*(void (**)(char *, uint64_t))(v134 + 8))(v133, v135);
  return swift_release();
}

void sub_20A8A5810(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_20A8C2530();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_sharedApplication);
  id v8 = [a2 URL];
  sub_20A8C24E0();

  uint64_t v9 = (void *)sub_20A8C24D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_20A4CFA44(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_20A8A7D08(&qword_26763B630, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v10 = (void *)sub_20A8CE170();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_openURL_options_completionHandler_, v9, v10, 0);
}

uint64_t sub_20A8A5ADC()
{
  uint64_t v0 = sub_20A8C5390();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20A4845D0(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20A747520();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  if (qword_26AC81128 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_20A8C2530();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F58CD8], v0);
  sub_20A8C4D30();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  sub_20A8A7944((uint64_t)v6, (uint64_t (*)(void))sub_20A4845D0);
  uint64_t v12 = qword_26BE5F490;
  swift_getObjectType();
  sub_20A42FC8C();
  uint64_t v14 = (uint64_t)&v9[*(int *)(v13 + 64)];
  *(void *)&v9[*(int *)(v13 + 48)] = v12;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  sub_20A42FD84((uint64_t)v18, v14);
  type metadata accessor for StocksActivity.Article(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = type metadata accessor for StocksActivity(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 0, 1, v15);
  sub_20A8C8D40();
  sub_20A8A7944((uint64_t)v9, (uint64_t (*)(void))sub_20A747520);
  return swift_unknownObjectRelease();
}

uint64_t sub_20A8A5E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A8A790C(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  swift_getObjectType();
  sub_20A8CB7C0();
  sub_20A4EED24();
  uint64_t v9 = (char *)v6 + *(int *)(v8 + 64);
  uint64_t v10 = (void *)((char *)v6 + *(int *)(v8 + 80));
  v6[1] = 0;
  v6[2] = 0;
  *uint64_t v6 = a3;
  uint64_t v11 = *MEMORY[0x263F59C98];
  uint64_t v12 = sub_20A8CD5D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v9, v11, v12);
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v13 = *MEMORY[0x263F59C80];
  uint64_t v14 = sub_20A8CD5C0();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v15 + 104))(v6, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v6, 0, 1, v14);
  swift_unknownObjectRetain();
  sub_20A8C8CD0();
  sub_20A8A7944((uint64_t)v6, (uint64_t (*)(void))sub_20A8A790C);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_20A8A60A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  swift_getObjectType();
  sub_20A8CB840();
  a4();
  swift_unknownObjectRetain();
  sub_20A8C8D40();
  swift_unknownObjectRelease();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_20A8A6184()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_20A8C2370();

  return v2;
}

uint64_t sub_20A8A62A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A556120(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  swift_getObjectType();
  sub_20A8CB7A0();
  sub_20A4AE208(0);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v6, a3, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  sub_20A8C8D40();
  sub_20A8A7944((uint64_t)v6, (uint64_t (*)(void))sub_20A556120);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_20A8A645C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_20A8C4F60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C2530();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_retain();

  id v13 = [a3 URL];
  sub_20A8C24E0();

  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F58B88], v4);
  sub_20A73DAC0((uint64_t)v11, (uint64_t)v7);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_20A8A6650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A747520();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  if (qword_26AC81128 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_20A8C3F00();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, a3, v8);
  uint64_t v9 = qword_26BE5F4B8;
  swift_getObjectType();
  sub_20A4F6DE4();
  *(void *)&v6[*(int *)(v10 + 48)] = v9;
  type metadata accessor for StocksActivity.StockFeed(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = type metadata accessor for StocksActivity(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  sub_20A8C8D40();
  sub_20A8A7944((uint64_t)v6, (uint64_t (*)(void))sub_20A747520);
  return swift_unknownObjectRelease();
}

uint64_t sub_20A8A686C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A4D4A5C();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_unknownObjectRetain();

  swift_getObjectType();
  if (qword_26AC6AC40 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_20A8C3F00();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v6, a3, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  sub_20A8C8D40();
  sub_20A8A7944((uint64_t)v6, (uint64_t (*)(void))sub_20A4D4A5C);
  return swift_unknownObjectRelease();
}

uint64_t sub_20A8A6A5C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_20A8A6ABC()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_20A8C2370();

  return v2;
}

void sub_20A8A6C2C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v75 = a2;
  id v76 = a1;
  sub_20A4D4A5C();
  MEMORY[0x270FA5388](v5 - 8);
  id v73 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_20A8C3F00();
  uint64_t v7 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v69 = v8;
  id v70 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A747520();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v67 = self;
  uint64_t v68 = ObjCClassFromMetadata;
  id v13 = objc_msgSend(v67, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  id v14 = objc_msgSend(self, sel_ts_chevronRight);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = a3;
  id v17 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v18 = v14;
  swift_retain();
  uint64_t v19 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  uint64_t v83 = (uint64_t (*)(uint64_t))sub_20A8A7DE4;
  uint64_t v84 = v16;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v80 = 1107296256;
  id v81 = sub_20A8A6A5C;
  uint64_t v82 = &block_descriptor_59;
  uint64_t v20 = _Block_copy(&aBlock);
  id v21 = objc_msgSend(v17, sel_initWithLabel_image_type_block_, v19, v18, 0, v20);

  _Block_release(v20);
  swift_release();
  objc_msgSend(v76, sel_addActivity_, v21);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  uint64_t v71 = v3;
  uint64_t v22 = *(void *)(v3 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_commandCenter + 8);
  uint64_t v78 = *(void *)(v3 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_commandCenter);
  uint64_t ObjectType = swift_getObjectType();
  if (qword_26AC81128 != -1) {
    swift_once();
  }
  sub_20A4F6DE4();
  uint64_t v25 = *(int *)(v24 + 48);
  uint64_t v74 = v7;
  uint64_t v26 = v7 + 16;
  id v27 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v28 = v75;
  uint64_t v29 = v77;
  v27(v11, v75, v77);
  *(void *)&v11[v25] = 0;
  type metadata accessor for StocksActivity.StockFeed(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = type metadata accessor for StocksActivity(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v11, 0, 1, v30);
  uint64_t v72 = v22;
  char v31 = sub_20A8C8D00();
  sub_20A8A7944((uint64_t)v11, (uint64_t (*)(void))sub_20A747520);
  uint64_t v32 = v28;
  uint64_t v33 = v29;
  if (v31)
  {
    id v34 = objc_msgSend(v67, sel_bundleForClass_, v68);
    id v67 = (id)sub_20A8C2370();

    sub_20A8CB580();
    uint64_t v68 = sub_20A8CB570();
    uint64_t v35 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v36 = ObjectType;
    unsigned int v37 = v70;
    v27(v70, v32, v29);
    uint64_t v38 = v74;
    unint64_t v39 = (*(unsigned __int8 *)(v74 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v35;
    uint64_t v41 = v37;
    uint64_t ObjectType = v36;
    (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v40 + v39, v41, v77);
    id v42 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v43 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v83 = sub_20A8A7CA8;
    uint64_t v84 = v40;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v80 = 1107296256;
    id v81 = sub_20A8A6A5C;
    uint64_t v82 = &block_descriptor_73;
    uint64_t v44 = _Block_copy(&aBlock);
    uint64_t v45 = (void *)v68;
    id v46 = objc_msgSend(v42, sel_initWithLabel_image_type_block_, v43, v68, 1, v44);

    _Block_release(v44);
    swift_release();
    objc_msgSend(v76, sel_addActivity_, v46);
    swift_release();
    uint64_t v33 = v77;
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v32 = v75;
  }
  if (qword_26AC6AC40 != -1) {
    swift_once();
  }
  uint64_t v47 = (uint64_t)v73;
  v27(v73, v32, v33);
  uint64_t v48 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v74 + 56);
  v48(v47, 0, 1, v33);
  uint64_t v77 = ObjectType;
  char v49 = sub_20A8C8D00();
  sub_20A8A7944(v47, (uint64_t (*)(void))sub_20A4D4A5C);
  if (v49)
  {
    uint64_t v50 = (uint64_t)v73;
    id v67 = v27;
    uint64_t v68 = v26;
    v27(v73, v32, v33);
    v48(v50, 0, 1, v33);
    sub_20A4AE348();
    sub_20A8C8CB0();
    sub_20A8A7944(v50, (uint64_t (*)(void))sub_20A4D4A5C);
    __int16 v51 = aBlock;
    if (aBlock != 2)
    {
      sub_20A8A6ABC();
      if ((v51 & 0x100) != 0)
      {
        uint64_t v52 = (void (*)(char *, uint64_t, uint64_t))v67;
        uint64_t v53 = v33;
        uint64_t v54 = v74;
        if (qword_2676398C8 == -1) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v54 = v74;
        if ((v51 & 1) == 0)
        {
          uint64_t v52 = (void (*)(char *, uint64_t, uint64_t))v67;
          uint64_t v53 = v33;
          if (qword_2676398D0 != -1) {
            swift_once();
          }
          uint64_t v55 = &qword_267652CD0;
          goto LABEL_16;
        }
        uint64_t v52 = (void (*)(char *, uint64_t, uint64_t))v67;
        uint64_t v53 = v33;
        if (qword_2676398C8 == -1)
        {
LABEL_11:
          uint64_t v55 = &qword_267652CC8;
LABEL_16:
          unint64_t v56 = (void *)*v55;
          uint64_t v57 = swift_allocObject();
          swift_unknownObjectUnownedInit();
          id v58 = v70;
          v52(v70, v75, v53);
          unint64_t v59 = (*(unsigned __int8 *)(v54 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
          uint64_t v60 = swift_allocObject();
          *(void *)(v60 + 16) = v57;
          (*(void (**)(unint64_t, char *, uint64_t))(v54 + 32))(v60 + v59, v58, v53);
          id v61 = objc_allocWithZone(MEMORY[0x263F6C5E8]);
          id v62 = v56;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_retain();
          char v63 = (void *)sub_20A8CE240();
          swift_bridgeObjectRelease();
          uint64_t v83 = sub_20A8A7C64;
          uint64_t v84 = v60;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v80 = 1107296256;
          id v81 = sub_20A8A6A5C;
          uint64_t v82 = &block_descriptor_66_0;
          id v64 = _Block_copy(&aBlock);
          id v65 = objc_msgSend(v61, sel_initWithLabel_image_type_block_, v63, v62, 1, v64);

          _Block_release(v64);
          swift_release();
          objc_msgSend(v76, sel_addActivity_, v65);
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();

          return;
        }
      }
      swift_once();
      goto LABEL_11;
    }
  }
}

id sub_20A8A76EC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_router);
  sub_20A4342F4(v0 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_handler, (uint64_t)v8);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8StocksUI26LinkActionActivityProvider_linkedContentProvider);
  uint64_t v3 = (objc_class *)type metadata accessor for ActionPreviewActivity();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC8StocksUI21ActionPreviewActivity_router] = v1;
  sub_20A4342F4((uint64_t)v8, (uint64_t)&v4[OBJC_IVAR____TtC8StocksUI21ActionPreviewActivity_handler]);
  *(void *)&v4[OBJC_IVAR____TtC8StocksUI21ActionPreviewActivity_linkedContentProvider] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  swift_retain();
  swift_retain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_20A8A77BC()
{
  unint64_t result = qword_26763E9E0;
  if (!qword_26763E9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763E9E0);
  }
  return result;
}

uint64_t sub_20A8A7810()
{
  swift_unknownObjectUnownedDestroy();

  return swift_deallocObject();
}

uint64_t sub_20A8A784C(uint64_t a1)
{
  return sub_20A8A645C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_20A8A7868()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

void sub_20A8A78A0(uint64_t a1)
{
  sub_20A8A5810(a1, *(void **)(v1 + 16));
}

void sub_20A8A78A8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_20A8A790C(uint64_t a1)
{
}

uint64_t sub_20A8A7944(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A8A79A4()
{
  return objectdestroy_20Tm((uint64_t (*)(void))sub_20A4AE208);
}

uint64_t sub_20A8A79BC(uint64_t a1)
{
  return sub_20A8A7BBC(a1, (uint64_t (*)(void))sub_20A4AE208, sub_20A8A62A0);
}

uint64_t sub_20A8A79EC(uint64_t a1)
{
  return sub_20A8A60A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), MEMORY[0x263F596D8]);
}

uint64_t sub_20A8A7A1C()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20A8A7A64(uint64_t a1)
{
  return sub_20A8A5E54(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_20A8A7A74(uint64_t a1)
{
  return sub_20A8A60A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), MEMORY[0x263F596E8]);
}

uint64_t sub_20A8A7AA4()
{
  return objectdestroy_20Tm(MEMORY[0x263F589E8]);
}

uint64_t objectdestroy_20Tm(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);

  return swift_deallocObject();
}

uint64_t sub_20A8A7B90(uint64_t a1)
{
  return sub_20A8A7BBC(a1, MEMORY[0x263F589E8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20A8A5ADC);
}

uint64_t sub_20A8A7BBC(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6, v7);
}

uint64_t sub_20A8A7C4C()
{
  return objectdestroy_20Tm(MEMORY[0x263F7AF08]);
}

uint64_t sub_20A8A7C64(uint64_t a1)
{
  return sub_20A8A7BBC(a1, MEMORY[0x263F7AF08], sub_20A8A686C);
}

uint64_t sub_20A8A7C90()
{
  return objectdestroy_20Tm(MEMORY[0x263F7AF08]);
}

uint64_t sub_20A8A7CA8(uint64_t a1)
{
  return sub_20A8A7BBC(a1, MEMORY[0x263F7AF08], sub_20A8A6650);
}

void sub_20A8A7CD4(uint64_t a1)
{
}

uint64_t sub_20A8A7D08(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_20A8A7D50(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for Tracker()
{
  return &type metadata for Tracker;
}

uint64_t *sub_20A8A7DE8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
    uint64_t v9 = (char *)v7 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_20A8C2800();
    uint64_t v12 = *(void *)(v11 - 8);
    id v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_20A42D040(0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
    uint64_t v16 = (char *)v7 + v15;
    id v17 = (char *)a2 + v15;
    sub_20A55361C(0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = type metadata accessor for StockForYouFeedGroupKnobs();
    *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
    *(void *)&v16[*(int *)(v19 + 24)] = *(void *)&v17[*(int *)(v19 + 24)];
    uint64_t v20 = type metadata accessor for ForYouFeedGroupKnobs();
    *(void *)&v16[*(int *)(v20 + 20)] = *(void *)&v17[*(int *)(v20 + 20)];
    uint64_t v21 = type metadata accessor for ForYouFeedKnobsConfig();
    *(void *)&v16[*(int *)(v21 + 20)] = *(void *)&v17[*(int *)(v21 + 20)];
    uint64_t v22 = a3[6];
    uint64_t v23 = a3[7];
    uint64_t v24 = *(void **)((char *)a2 + v22);
    *(uint64_t *)((char *)v7 + v22) = (uint64_t)v24;
    uint64_t v38 = (char *)v7 + v23;
    unsigned int v37 = (char *)a2 + v23;
    uint64_t v25 = sub_20A8C3190();
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    id v27 = v24;
    v26(v38, v37, v25);
    uint64_t v28 = a3[8];
    uint64_t v29 = (char *)v7 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = sub_20A8CC920();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    uint64_t v32 = a3[10];
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v33 = (char *)v7 + v32;
    id v34 = (char *)a2 + v32;
    uint64_t v35 = sub_20A8C40E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
  }
  return v7;
}

uint64_t type metadata accessor for ForYouFeedServiceConfig()
{
  uint64_t result = qword_26AC74898;
  if (!qword_26AC74898) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A8A8164(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
  uint64_t v5 = sub_20A8C2800();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
  sub_20A55361C(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  type metadata accessor for StockForYouFeedGroupKnobs();
  swift_release();
  swift_release();
  type metadata accessor for ForYouFeedGroupKnobs();
  swift_bridgeObjectRelease();

  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = sub_20A8C3190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = sub_20A8CC920();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[10];
  uint64_t v14 = sub_20A8C40E0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);

  return v15(v13, v14);
}

void *sub_20A8A837C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A8C2800();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    sub_20A42D040(0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  sub_20A55361C(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = type metadata accessor for StockForYouFeedGroupKnobs();
  *(void *)&v14[*(int *)(v17 + 20)] = *(void *)&v15[*(int *)(v17 + 20)];
  *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  uint64_t v18 = type metadata accessor for ForYouFeedGroupKnobs();
  *(void *)&v14[*(int *)(v18 + 20)] = *(void *)&v15[*(int *)(v18 + 20)];
  uint64_t v19 = type metadata accessor for ForYouFeedKnobsConfig();
  *(void *)&v14[*(int *)(v19 + 20)] = *(void *)&v15[*(int *)(v19 + 20)];
  uint64_t v20 = a3[6];
  uint64_t v21 = a3[7];
  uint64_t v22 = *(void **)((char *)a2 + v20);
  *(void *)((char *)a1 + v20) = v22;
  uint64_t v36 = (char *)a1 + v21;
  uint64_t v35 = (char *)a2 + v21;
  uint64_t v23 = sub_20A8C3190();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v25 = v22;
  v24(v36, v35, v23);
  uint64_t v26 = a3[8];
  id v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_20A8CC920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
  uint64_t v30 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_20A8C40E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
  return a1;
}

void *sub_20A8A8660(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A8C2800();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_20A42D040(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  sub_20A55361C(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = type metadata accessor for StockForYouFeedGroupKnobs();
  *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
  swift_retain();
  swift_release();
  *(void *)&v16[*(int *)(v19 + 24)] = *(void *)&v17[*(int *)(v19 + 24)];
  swift_retain();
  swift_release();
  uint64_t v20 = type metadata accessor for ForYouFeedGroupKnobs();
  *(void *)&v16[*(int *)(v20 + 20)] = *(void *)&v17[*(int *)(v20 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = type metadata accessor for ForYouFeedKnobsConfig();
  *(void *)&v16[*(int *)(v21 + 20)] = *(void *)&v17[*(int *)(v21 + 20)];
  uint64_t v22 = a3[6];
  uint64_t v23 = *(void **)((char *)a2 + v22);
  uint64_t v24 = *(void **)((char *)a1 + v22);
  *(void *)((char *)a1 + v22) = v23;
  id v25 = v23;

  uint64_t v26 = a3[7];
  id v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_20A8C3190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24))(v27, v28, v29);
  uint64_t v30 = a3[8];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_20A8CC920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v34 = a3[10];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  uint64_t v37 = sub_20A8C40E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  return a1;
}

void *sub_20A8A89C4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A8C2800();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_20A42D040(0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
  int v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  sub_20A55361C(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = type metadata accessor for StockForYouFeedGroupKnobs();
  *(void *)&v13[*(int *)(v16 + 20)] = *(void *)&v14[*(int *)(v16 + 20)];
  *(void *)&v13[*(int *)(v16 + 24)] = *(void *)&v14[*(int *)(v16 + 24)];
  uint64_t v17 = type metadata accessor for ForYouFeedGroupKnobs();
  *(void *)&v13[*(int *)(v17 + 20)] = *(void *)&v14[*(int *)(v17 + 20)];
  uint64_t v18 = type metadata accessor for ForYouFeedKnobsConfig();
  *(void *)&v13[*(int *)(v18 + 20)] = *(void *)&v14[*(int *)(v18 + 20)];
  uint64_t v19 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_20A8C3190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[8];
  uint64_t v24 = (char *)a1 + v23;
  id v25 = (char *)a2 + v23;
  uint64_t v26 = sub_20A8CC920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  uint64_t v27 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = sub_20A8C40E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  return a1;
}

void *sub_20A8A8C6C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for ForYouFeedConfig() + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A8C2800();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_20A42D040(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(type metadata accessor for ForYouFeedContentConfig() + 20);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  sub_20A55361C(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = type metadata accessor for StockForYouFeedGroupKnobs();
  *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
  swift_release();
  *(void *)&v16[*(int *)(v19 + 24)] = *(void *)&v17[*(int *)(v19 + 24)];
  swift_release();
  uint64_t v20 = type metadata accessor for ForYouFeedGroupKnobs();
  *(void *)&v16[*(int *)(v20 + 20)] = *(void *)&v17[*(int *)(v20 + 20)];
  swift_bridgeObjectRelease();
  uint64_t v21 = type metadata accessor for ForYouFeedKnobsConfig();
  *(void *)&v16[*(int *)(v21 + 20)] = *(void *)&v17[*(int *)(v21 + 20)];
  uint64_t v22 = a3[6];
  uint64_t v23 = *(void **)((char *)a1 + v22);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);

  uint64_t v24 = a3[7];
  id v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  uint64_t v27 = sub_20A8C3190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  uint64_t v28 = a3[8];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_20A8CC920();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v29, v30, v31);
  uint64_t v32 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = sub_20A8C40E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
  return a1;
}

uint64_t sub_20A8A8FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8A8FBC);
}

uint64_t sub_20A8A8FBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ForYouFeedContentConfig();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[6]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  uint64_t v13 = sub_20A8C3190();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a3[7];
LABEL_11:
    uint64_t v10 = a1 + v15;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_12;
  }
  uint64_t v16 = sub_20A8CC920();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a3[8];
    goto LABEL_11;
  }
  uint64_t v17 = sub_20A8C40E0();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a3[10];

  return v18(v20, a2, v19);
}

uint64_t sub_20A8A9188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8A919C);
}

uint64_t sub_20A8A919C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for ForYouFeedContentConfig();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_20A8C3190();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[7];
LABEL_9:
    uint64_t v12 = a1 + v15;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_20A8CC920();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_9;
  }
  uint64_t v17 = sub_20A8C40E0();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[10];

  return v18(v20, a2, a2, v19);
}

uint64_t sub_20A8A9368()
{
  uint64_t result = type metadata accessor for ForYouFeedContentConfig();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A8C3190();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_20A8CC920();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_20A8C40E0();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_20A8A94D0()
{
  sub_20A42D040(0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ForYouFeedConfig();
  sub_20A8A9C08(v0 + *(int *)(v4 + 20), (uint64_t)v3, (uint64_t (*)(void))sub_20A42D040);
  uint64_t v5 = sub_20A8CE2F0();
  unint64_t v7 = v6;
  uint64_t v10 = 45;
  unint64_t v11 = 0xE100000000000000;
  type metadata accessor for ForYouFeedServiceConfig();
  v9[1] = sub_20A8C40C0();
  sub_20A8CF720();
  sub_20A8CE3D0();
  swift_bridgeObjectRelease();
  uint64_t v10 = v5;
  unint64_t v11 = v7;
  swift_bridgeObjectRetain();
  sub_20A8CE3D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20A8A9610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v4 = sub_20A8C40E0();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_20A8CC920();
  uint64_t v34 = *(void *)(v31 - 8);
  uint64_t v6 = v34;
  MEMORY[0x270FA5388](v31);
  uint64_t v36 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C3190();
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v9 = v35;
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v11;
  uint64_t v12 = type metadata accessor for ForYouFeedContentConfig();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for ForYouFeedContentConfig;
  uint64_t v33 = v14;
  sub_20A8A9C08(a1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ForYouFeedContentConfig);
  uint64_t v15 = (int *)type metadata accessor for ForYouFeedServiceConfig();
  uint64_t v16 = *(void **)(v2 + v15[6]);
  uint64_t v17 = v2 + v15[7];
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v29(v11, v17, v8);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v19 = v36;
  uint64_t v20 = v31;
  v18(v36, v2 + v15[8], v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v38, v2 + v15[10], v40);
  uint64_t v21 = v37;
  sub_20A8A9C08((uint64_t)v14, v37, (uint64_t (*)(void))v32);
  *(void *)(v21 + v15[6]) = v16;
  uint64_t v22 = v21 + v15[7];
  uint64_t v23 = v21;
  uint64_t v24 = v30;
  v29((char *)v22, (uint64_t)v30, v8);
  v18((char *)(v23 + v15[8]), (uint64_t)v19, v20);
  id v25 = v16;
  sub_20A8C3110();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v19, v20);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v8);
  sub_20A661434((uint64_t)v33);
  *(void *)(v23 + v15[9]) = v27;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v23 + v15[10], v38, v40);
}

uint64_t sub_20A8A9998@<X0>(uint64_t a1@<X8>)
{
  return sub_20A8A9C08(v1, a1, (uint64_t (*)(void))type metadata accessor for ForYouFeedContentConfig);
}

uint64_t sub_20A8A99CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_20A8CC920();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_20A8A9A50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F59AC0];
  uint64_t v3 = sub_20A8CCF20();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_20A8A9AD8()
{
  return sub_20A8A9B68((unint64_t *)&unk_26AC74880, (void (*)(uint64_t))type metadata accessor for ForYouFeedServiceConfig);
}

uint64_t sub_20A8A9B20()
{
  return sub_20A8A9B68(&qword_26AC747E0, (void (*)(uint64_t))type metadata accessor for ForYouFeedContentConfig);
}

uint64_t sub_20A8A9B68(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_20A8A9BB4()
{
  unint64_t result = qword_26AC6D478;
  if (!qword_26AC6D478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC6D478);
  }
  return result;
}

uint64_t sub_20A8A9C08(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A8A9C70()
{
  sub_20A8CC040();

  return swift_bridgeObjectRelease();
}

uint64_t CellAutomation.init(data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_20A8C8500();
  a3[1] = v6;
  uint64_t v7 = (char *)a3 + *(int *)(type metadata accessor for CellAutomation() + 36);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v8(v7, a1, a2);
}

uint64_t type metadata accessor for CellAutomation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t CellAutomation.type.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CellAutomation.data.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t CellAutomation.automationType.getter()
{
  return 1819043171;
}

BOOL sub_20A8A9EB0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_20A8A9EC0()
{
  return sub_20A8CF890();
}

uint64_t sub_20A8A9EE8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_20A8CF760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_20A8CF760();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A8A9FBC()
{
  return sub_20A8CF8C0();
}

uint64_t sub_20A8AA004(char a1)
{
  if (a1) {
    return 1635017060;
  }
  else {
    return 1701869940;
  }
}

BOOL sub_20A8AA024(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_20A8A9EB0(*a1, *a2);
}

uint64_t sub_20A8AA038()
{
  return sub_20A8A9FBC();
}

uint64_t sub_20A8AA048()
{
  return sub_20A8A9EC0();
}

uint64_t sub_20A8AA058()
{
  return sub_20A8CF8C0();
}

uint64_t sub_20A8AA0A0()
{
  return sub_20A8AA004(*v0);
}

uint64_t sub_20A8AA0B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A8A9EE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A8AA0E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A57EE14();
  *a1 = result;
  return result;
}

uint64_t sub_20A8AA10C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_20A8AA160(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t CellAutomation.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  v11[0] = *(void *)(a2 + 24);
  v11[1] = v4;
  type metadata accessor for CellAutomation.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_20A8CF6F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A8CF8F0();
  char v13 = 0;
  uint64_t v9 = v11[3];
  sub_20A8CF6B0();
  if (!v9)
  {
    char v12 = 1;
    sub_20A8CF6E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for CellAutomation.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t CellAutomation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v21 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v24 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CellAutomation.CodingKeys();
  swift_getWitnessTable();
  uint64_t v26 = sub_20A8CF660();
  uint64_t v23 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v25 = a3;
  uint64_t v10 = type metadata accessor for CellAutomation();
  uint64_t v20 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v12 = (uint64_t *)((char *)&v20 - v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v13 = v27;
  sub_20A8CF8E0();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v27 = v10;
  uint64_t v14 = v23;
  uint64_t v15 = v24;
  char v29 = 0;
  *char v12 = sub_20A8CF620();
  v12[1] = v16;
  char v28 = 1;
  sub_20A8CF640();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v26);
  uint64_t v17 = v27;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v12 + *(int *)(v27 + 36), v15, a2);
  uint64_t v18 = v20;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v20 + 16))(v22, v12, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v18 + 8))(v12, v17);
}

uint64_t sub_20A8AA6E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_20A8AA704()
{
  return swift_getWitnessTable();
}

uint64_t sub_20A8AA720()
{
  return 1819043171;
}

uint64_t sub_20A8AA730@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return CellAutomation.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_20A8AA750(void *a1, uint64_t a2)
{
  return CellAutomation.encode(to:)(a1, a2);
}

uint64_t sub_20A8AA768()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_20A8AA804(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_20A8AA90C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_20A8AA980(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_20A8AAA10(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_20A8AAAA8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_20A8AAB18(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_20A8AABA0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_20A8AAD40(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x20A8AAFA0);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

unsigned char *sub_20A8AAFC8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A8AB094);
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

uint64_t sub_20A8AB0BC()
{
  return swift_getWitnessTable();
}

uint64_t sub_20A8AB0D8()
{
  return swift_getWitnessTable();
}

uint64_t sub_20A8AB0F4()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for StockChartRouter()
{
  return self;
}

void *sub_20A8AB134(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v32 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v32 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v6 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v6;
    uint64_t v7 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v7;
    unsigned int v8 = (int *)type metadata accessor for PriceViewModel();
    uint64_t v9 = v8[9];
    size_t v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_20A8C2EB0();
    int v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = v8[10];
    int v15 = (char *)v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_20A8C4030();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = v8[11];
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = sub_20A8C2990();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = *(int *)(a3 + 20);
    uint64_t v23 = (char *)v4 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    uint64_t v25 = sub_20A8C3410();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = *(int *)(a3 + 24);
    uint64_t v27 = (char *)v4 + v26;
    char v28 = (char *)a2 + v26;
    uint64_t v29 = type metadata accessor for QuoteSummaryTimeRange();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      sub_20A8AB4D4();
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      uint64_t v33 = sub_20A8C2BC0();
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v28, 3, v33))
      {
        memcpy(v27, v28, *(void *)(v30 + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v27, v28, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v27, 0, 3, v33);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  return v4;
}

void sub_20A8AB4D4()
{
  if (!qword_26AC82848)
  {
    type metadata accessor for QuoteSummaryTimeRange();
    unint64_t v0 = sub_20A8CF1B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC82848);
    }
  }
}

uint64_t sub_20A8AB52C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v4 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v5 = a1 + v4[9];
  uint64_t v6 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + v4[10];
  uint64_t v8 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + v4[11];
  uint64_t v10 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + *(int *)(a2 + 20);
  uint64_t v12 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + *(int *)(a2 + 24);
  uint64_t v14 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14);
  if (!result)
  {
    uint64_t v16 = sub_20A8C2BC0();
    uint64_t v18 = *(void *)(v16 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v13, 3, v16);
    if (!result)
    {
      uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
      return v17(v13, v16);
    }
  }
  return result;
}

uint64_t sub_20A8AB770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v8 = v7[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_20A8C2EB0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = v7[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = v7[11];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  uint64_t v25 = *(int *)(a3 + 24);
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  uint64_t v28 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    sub_20A8AB4D4();
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    uint64_t v31 = sub_20A8C2BC0();
    uint64_t v32 = *(void *)(v31 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v32 + 48))(v27, 3, v31))
    {
      memcpy(v26, v27, *(void *)(v29 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v32 + 16))(v26, v27, v31);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v26, 0, 3, v31);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  return a1;
}

uint64_t sub_20A8ABAC0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = a2[4];
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v10 = v9[9];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t)a2 + v10;
  uint64_t v13 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = v9[10];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = (uint64_t)a2 + v14;
  uint64_t v17 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = v9[11];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t)a2 + v18;
  uint64_t v21 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = *(int *)(a3 + 20);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (uint64_t)a2 + v22;
  uint64_t v25 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 24))(v23, v24, v25);
  uint64_t v26 = *(int *)(a3 + 24);
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v30 + 48);
  LODWORD(v24) = v31(v27, 1, v29);
  int v32 = v31(v28, 1, v29);
  if (!v24)
  {
    if (!v32)
    {
      uint64_t v37 = sub_20A8C2BC0();
      uint64_t v38 = *(void *)(v37 - 8);
      uint64_t v39 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
      int v40 = v39(v27, 3, v37);
      int v41 = v39(v28, 3, v37);
      if (v40)
      {
        if (!v41)
        {
          (*(void (**)(void *, char *, uint64_t))(v38 + 16))(v27, v28, v37);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(v27, 0, 3, v37);
          return a1;
        }
      }
      else
      {
        if (!v41)
        {
          (*(void (**)(void *, char *, uint64_t))(v38 + 24))(v27, v28, v37);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v38 + 8))(v27, v37);
      }
      size_t v36 = *(void *)(v30 + 64);
      goto LABEL_8;
    }
    sub_20A8AD01C((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for QuoteSummaryTimeRange);
LABEL_7:
    sub_20A8AB4D4();
    size_t v36 = *(void *)(*(void *)(v35 - 8) + 64);
LABEL_8:
    memcpy(v27, v28, v36);
    return a1;
  }
  if (v32) {
    goto LABEL_7;
  }
  uint64_t v33 = sub_20A8C2BC0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v28, 3, v33))
  {
    memcpy(v27, v28, *(void *)(v30 + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v34 + 16))(v27, v28, v33);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v27, 0, 3, v33);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  return a1;
}

uint64_t sub_20A8ABF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  uint64_t v7 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v8 = v7[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = v7[10];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = v7[11];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = *(int *)(a3 + 20);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  uint64_t v24 = *(int *)(a3 + 24);
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  uint64_t v27 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    sub_20A8AB4D4();
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    uint64_t v30 = sub_20A8C2BC0();
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v26, 3, v30))
    {
      memcpy(v25, v26, *(void *)(v28 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v31 + 32))(v25, v26, v30);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v25, 0, 3, v30);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

uint64_t sub_20A8AC298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for PriceViewModel();
  uint64_t v9 = v8[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_20A8C2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = v8[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_20A8C4030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = v8[11];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_20A8C2990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = *(int *)(a3 + 24);
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  uint64_t v28 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  LODWORD(v23) = v30(v26, 1, v28);
  int v31 = v30(v27, 1, v28);
  if (!v23)
  {
    if (!v31)
    {
      uint64_t v36 = sub_20A8C2BC0();
      uint64_t v37 = *(void *)(v36 - 8);
      uint64_t v38 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v37 + 48);
      int v39 = v38(v26, 3, v36);
      int v40 = v38(v27, 3, v36);
      if (v39)
      {
        if (!v40)
        {
          (*(void (**)(void *, void *, uint64_t))(v37 + 32))(v26, v27, v36);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56))(v26, 0, 3, v36);
          return a1;
        }
      }
      else
      {
        if (!v40)
        {
          (*(void (**)(void *, void *, uint64_t))(v37 + 40))(v26, v27, v36);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v37 + 8))(v26, v36);
      }
      size_t v35 = *(void *)(v29 + 64);
      goto LABEL_8;
    }
    sub_20A8AD01C((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for QuoteSummaryTimeRange);
LABEL_7:
    sub_20A8AB4D4();
    size_t v35 = *(void *)(*(void *)(v34 - 8) + 64);
LABEL_8:
    memcpy(v26, v27, v35);
    return a1;
  }
  if (v31) {
    goto LABEL_7;
  }
  uint64_t v32 = sub_20A8C2BC0();
  uint64_t v33 = *(void *)(v32 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v33 + 48))(v27, 3, v32))
  {
    memcpy(v26, v27, *(void *)(v29 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v26, v27, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v26, 0, 3, v32);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  return a1;
}

uint64_t sub_20A8AC730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8AC744);
}

uint64_t sub_20A8AC744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PriceViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_20A8C3410();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  sub_20A8AB4D4();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_20A8AC890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8AC8A4);
}

uint64_t sub_20A8AC8A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PriceViewModel();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_20A8C3410();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  sub_20A8AB4D4();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for QuoteViewModel()
{
  uint64_t result = qword_26AC82B18;
  if (!qword_26AC82B18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A8ACA48()
{
  type metadata accessor for PriceViewModel();
  if (v0 <= 0x3F)
  {
    sub_20A8C3410();
    if (v1 <= 0x3F)
    {
      sub_20A8AB4D4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

BOOL sub_20A8ACB50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuoteSummaryTimeRange();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8ACF60();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8AB4D4();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v30 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v30 - v19;
  if ((sub_20A5EEDD4(a1, a2) & 1) == 0) {
    return 0;
  }
  int v31 = v7;
  uint64_t v32 = v14;
  uint64_t v33 = v5;
  uint64_t v34 = v4;
  size_t v35 = v11;
  uint64_t v21 = type metadata accessor for QuoteViewModel();
  sub_20A8C3410();
  sub_20A8ACFC4();
  sub_20A8CE570();
  sub_20A8CE570();
  if (v37 != v36) {
    return 0;
  }
  sub_20A6B317C(a1 + *(int *)(v21 + 24), (uint64_t)v20);
  sub_20A6B317C(a2 + *(int *)(v21 + 24), (uint64_t)v17);
  uint64_t v22 = (uint64_t)v35;
  uint64_t v23 = (uint64_t)&v35[*(int *)(v9 + 48)];
  sub_20A6B317C((uint64_t)v20, (uint64_t)v35);
  sub_20A6B317C((uint64_t)v17, v23);
  uint64_t v24 = v34;
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  if (v25(v22, 1, v34) == 1)
  {
    sub_20A8AD01C((uint64_t)v17, (uint64_t (*)(void))sub_20A8AB4D4);
    sub_20A8AD01C((uint64_t)v20, (uint64_t (*)(void))sub_20A8AB4D4);
    if (v25(v23, 1, v24) == 1)
    {
      sub_20A8AD01C(v22, (uint64_t (*)(void))sub_20A8AB4D4);
      return 1;
    }
    goto LABEL_8;
  }
  uint64_t v26 = (uint64_t)v32;
  sub_20A6B317C(v22, (uint64_t)v32);
  if (v25(v23, 1, v24) == 1)
  {
    sub_20A8AD01C((uint64_t)v17, (uint64_t (*)(void))sub_20A8AB4D4);
    sub_20A8AD01C((uint64_t)v20, (uint64_t (*)(void))sub_20A8AB4D4);
    sub_20A8AD01C(v26, (uint64_t (*)(void))type metadata accessor for QuoteSummaryTimeRange);
LABEL_8:
    sub_20A8AD01C(v22, (uint64_t (*)(void))sub_20A8ACF60);
    return 0;
  }
  uint64_t v27 = (uint64_t)v31;
  sub_20A6B329C(v23, (uint64_t)v31);
  char v28 = sub_20A5FEE90(v26, v27);
  sub_20A8AD01C(v27, (uint64_t (*)(void))type metadata accessor for QuoteSummaryTimeRange);
  sub_20A8AD01C((uint64_t)v17, (uint64_t (*)(void))sub_20A8AB4D4);
  sub_20A8AD01C((uint64_t)v20, (uint64_t (*)(void))sub_20A8AB4D4);
  sub_20A8AD01C(v26, (uint64_t (*)(void))type metadata accessor for QuoteSummaryTimeRange);
  sub_20A8AD01C(v22, (uint64_t (*)(void))sub_20A8AB4D4);
  return (v28 & 1) != 0;
}

void sub_20A8ACF60()
{
  if (!qword_26AC82B60)
  {
    sub_20A8AB4D4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26AC82B60);
    }
  }
}

unint64_t sub_20A8ACFC4()
{
  unint64_t result = qword_26AC68E10;
  if (!qword_26AC68E10)
  {
    sub_20A8C3410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC68E10);
  }
  return result;
}

uint64_t sub_20A8AD01C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_20A8AD07C()
{
  swift_retain();
  sub_20A8C6470();
  swift_release();
  if (v5 != 2) {
    return (id)(v5 & 1);
  }
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_appleAccount), sel_activeiTunesAccount);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_isAuthenticated);
  }
  else
  {
    id v3 = 0;
  }
  swift_retain();
  sub_20A8C6480();
  swift_release();
  return v3;
}

void sub_20A8AD14C(void *a1)
{
  swift_retain();
  sub_20A8C6480();
  swift_release();
  sub_20A42D040(0);
  sub_20A8C6670();
  *(void *)(swift_allocObject() + 16) = a1;
  id v2 = a1;
  id v3 = (void *)sub_20A8C6450();
  sub_20A8C6500();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_20A8AD240()
{
  uint64_t v1 = sub_20A8C2800();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v33 - v6;
  uint64_t v8 = sub_20A8C3B60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B05C4(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8AD758((uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20A8B0724((uint64_t)v14, (uint64_t (*)(void))sub_20A8B05C4);
    char v15 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
    sub_20A8B0724((uint64_t)v14, (uint64_t (*)(void))sub_20A8B05C4);
    sub_20A8C3B20();
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v18 = OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager__appReviewRequestLastSeenDate;
    swift_retain();
    sub_20A8C6470();
    swift_release();
    sub_20A8C2720();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v2 + 8);
    v19(v4, v1);
    sub_20A8C27C0();
    char v15 = sub_20A8C2750();
    v19(v4, v1);
    v19(v7, v1);
    if (qword_26AC69CF0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_20A8C7DF0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26AC69CD0);
    id v21 = v0;
    uint64_t v22 = sub_20A8C7DD0();
    os_log_type_t v23 = sub_20A8CEA00();
    int v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v25 = swift_slowAlloc();
      v33[1] = v18;
      uint64_t v26 = v25;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v38 = v36;
      *(_DWORD *)uint64_t v26 = 67109634;
      LODWORD(v37) = v15 & 1;
      int v35 = v24;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 8) = 2048;
      uint64_t v37 = v17;
      id v34 = v21;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 18) = 2080;
      _OWORD v33[2] = v26 + 20;
      swift_retain();
      sub_20A8C6470();
      swift_release();
      sub_20A8B0810(&qword_26AC68CB8, MEMORY[0x263F07490]);
      uint64_t v27 = sub_20A8CF720();
      unint64_t v29 = v28;
      v19(v7, v1);
      uint64_t v37 = sub_20A687610(v27, v29, &v38);
      sub_20A8CF1C0();
      id v30 = v34;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20A414000, v22, (os_log_type_t)v35, "Checking quiescenceIntervalHasElapsed [%{BOOL}d]: quiescence interval [%g]. Last App Review Request Date [%s]", (uint8_t *)v26, 0x1Cu);
      uint64_t v31 = v36;
      swift_arrayDestroy();
      MEMORY[0x210528850](v31, -1, -1);
      MEMORY[0x210528850](v26, -1, -1);
    }
    else
    {
    }
  }
  return v15 & 1;
}

uint64_t sub_20A8AD758@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_20A8C3190();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B0590(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = v1 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager____lazy_storage___appReviewPromptConfig;
  swift_beginAccess();
  sub_20A8B0784(v13, (uint64_t)v12, (uint64_t (*)(void))sub_20A8B0590);
  sub_20A8B05C4(0);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v14) != 1) {
    return sub_20A8B0994((uint64_t)v12, a1);
  }
  sub_20A8B0724((uint64_t)v12, (uint64_t (*)(void))sub_20A8B0590);
  uint64_t v19 = v3;
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_appConfigurationManager), *(void *)(v1 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_appConfigurationManager + 24));
  sub_20A8C3AC0();
  sub_20A8C2FB0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  sub_20A8B0784(a1, (uint64_t)v9, (uint64_t (*)(void))sub_20A8B05C4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v15);
  swift_beginAccess();
  sub_20A8B0930((uint64_t)v9, v13);
  return swift_endAccess();
}

uint64_t sub_20A8ADA08(uint64_t a1)
{
  sub_20A42D040(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20A8C2800();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v18 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v18 - v13;
  sub_20A8B0784(a1, (uint64_t)v4, (uint64_t (*)(void))sub_20A42D040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_20A8B0724((uint64_t)v4, (uint64_t (*)(void))sub_20A42D040);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, v14, v5);
  v16(v8, v11, v5);
  swift_retain();
  sub_20A8C6480();
  swift_release();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v17)(v14, v5);
}

void sub_20A8ADC64(void (*a1)(char *, uint64_t))
{
  uint64_t v2 = v1;
  v179 = a1;
  uint64_t v3 = sub_20A8CC220();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v162 = (char *)v146 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_20A8CC250();
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  uint64_t v160 = (char *)v146 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = sub_20A8CC280();
  uint64_t v161 = *(void *)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  uint64_t v158 = (char *)v146 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v159 = (char *)v146 - v9;
  uint64_t v10 = sub_20A8C76F0();
  uint64_t v174 = *(void *)(v10 - 8);
  uint64_t v175 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v155 = (char *)v146 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v171 = (char *)v146 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v153 = (char *)v146 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v154 = (char *)v146 - v17;
  uint64_t v166 = sub_20A8C76E0();
  uint64_t v157 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166);
  id v156 = (char *)v146 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v172 = (char *)v146 - v20;
  uint64_t v21 = sub_20A8C6A90();
  uint64_t v169 = *(void *)(v21 - 8);
  uint64_t v170 = v21;
  MEMORY[0x270FA5388](v21);
  v168 = (char *)v146 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = sub_20A8C6800();
  uint64_t v151 = *(void *)(v152 - 8);
  MEMORY[0x270FA5388](v152);
  uint64_t v150 = (char *)v146 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_20A8C6E90();
  uint64_t v173 = *(void *)(v176 - 8);
  MEMORY[0x270FA5388](v176);
  v178 = (char *)v146 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v167 = (char *)v146 - v26;
  uint64_t v27 = type metadata accessor for EngagementEvent();
  MEMORY[0x270FA5388](v27);
  unint64_t v29 = (char *)v146 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)v146 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v177 = (uint64_t)v146 - v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)v146 - v36;
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_featureAvailability], *(void *)&v1[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_featureAvailability + 24]);
  if ((sub_20A8C3830() & 1) == 0) {
    return;
  }
  swift_retain();
  sub_20A8C6470();
  swift_release();
  if (aBlock != 1) {
    return;
  }
  uint64_t v148 = v4;
  if (qword_26AC69CF0 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_20A8C7DF0();
  uint64_t v39 = __swift_project_value_buffer(v38, (uint64_t)qword_26AC69CD0);
  sub_20A8B0784((uint64_t)v179, (uint64_t)v37, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
  int v40 = sub_20A8C7DD0();
  os_log_type_t v41 = sub_20A8CEA00();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v149 = v3;
  if (v42)
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v147 = v1;
    uint64_t v45 = v44;
    uint64_t aBlock = v44;
    v146[1] = v39;
    *(_DWORD *)uint64_t v43 = 136315138;
    v146[0] = v43 + 4;
    uint64_t v46 = sub_20A435C38();
    uint64_t v180 = sub_20A687610(v46, v47, &aBlock);
    sub_20A8CF1C0();
    swift_bridgeObjectRelease();
    sub_20A8B0724((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
    _os_log_impl(&dword_20A414000, v40, v41, "Received event %s", v43, 0xCu);
    swift_arrayDestroy();
    uint64_t v48 = v45;
    uint64_t v2 = v147;
    MEMORY[0x210528850](v48, -1, -1);
    MEMORY[0x210528850](v43, -1, -1);
  }
  else
  {
    sub_20A8B0724((uint64_t)v37, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
  }

  if ((sub_20A8AD07C() & 1) == 0)
  {
    sub_20A8B0784((uint64_t)v179, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
    uint64_t v60 = sub_20A8C7DD0();
    os_log_type_t v61 = sub_20A8CEA00();
    if (os_log_type_enabled(v60, v61))
    {
      id v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t aBlock = v63;
      *(_DWORD *)id v62 = 136315138;
      uint64_t v64 = sub_20A435C38();
      uint64_t v180 = sub_20A687610(v64, v65, &aBlock);
      sub_20A8CF1C0();
      swift_bridgeObjectRelease();
      sub_20A8B0724((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
      uint64_t v66 = "Skipping processing [%s] since user is not authenticated to the AppStore";
LABEL_18:
      _os_log_impl(&dword_20A414000, v60, v61, v66, v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x210528850](v63, -1, -1);
      MEMORY[0x210528850](v62, -1, -1);
LABEL_22:

      return;
    }
    uint64_t v69 = (uint64_t)v29;
LABEL_21:
    sub_20A8B0724(v69, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
    goto LABEL_22;
  }
  if ((sub_20A8AD240() & 1) == 0)
  {
    sub_20A8B0784((uint64_t)v179, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
    uint64_t v60 = sub_20A8C7DD0();
    os_log_type_t v61 = sub_20A8CEA00();
    if (os_log_type_enabled(v60, v61))
    {
      id v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t aBlock = v63;
      *(_DWORD *)id v62 = 136315138;
      uint64_t v67 = sub_20A435C38();
      uint64_t v180 = sub_20A687610(v67, v68, &aBlock);
      sub_20A8CF1C0();
      swift_bridgeObjectRelease();
      sub_20A8B0724((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
      uint64_t v66 = "Skipping processing [%s] due to quiescence interval";
      goto LABEL_18;
    }
    uint64_t v69 = (uint64_t)v32;
    goto LABEL_21;
  }
  uint64_t v49 = v177;
  sub_20A8B0784((uint64_t)v179, v177, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v51 = v176;
  uint64_t v52 = v178;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      id v70 = sub_20A8C7DD0();
      os_log_type_t v71 = sub_20A8CEA00();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v72 = 0;
        _os_log_impl(&dword_20A414000, v70, v71, "Ending session. Resetting counts.", v72, 2u);
        MEMORY[0x210528850](v72, -1, -1);
      }

      unint64_t v59 = &v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store];
      goto LABEL_27;
    case 2:
      id v73 = sub_20A8C7DD0();
      os_log_type_t v74 = sub_20A8CEA00();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v75 = 0;
        _os_log_impl(&dword_20A414000, v73, v74, "Engaged with article. Incrementing article engagement count.", v75, 2u);
        MEMORY[0x210528850](v75, -1, -1);
      }

      id v76 = &v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store];
      __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store], *(void *)&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store + 24]);
      __swift_project_boxed_opaque_existential_1(v76, *((void *)v76 + 3));
      swift_retain();
      sub_20A8C6470();
      swift_release();
      uint64_t v77 = v184;
      if ((_BYTE)v185) {
        uint64_t v77 = 0;
      }
      BOOL v78 = __OFADD__(v77, 1);
      uint64_t v79 = (uint64_t (*)(uint64_t))((char *)v77 + 1);
      if (v78)
      {
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
        JUMPOUT(0x20A8AF758);
      }
      uint64_t v80 = aBlock;
      if ((_BYTE)v185) {
        uint64_t v81 = 0;
      }
      else {
        uint64_t v81 = v183;
      }
      if ((_BYTE)v185) {
        uint64_t v80 = 0;
      }
      uint64_t aBlock = v80;
      uint64_t v183 = v81;
      v184 = v79;
      LOBYTE(v185) = 0;
      swift_retain();
      sub_20A8C6480();
      swift_release();
      LOBYTE(aBlock) = 1;
LABEL_39:
      swift_retain();
      sub_20A8C6480();
      swift_release();
      sub_20A8B0724(v49, (uint64_t (*)(void))type metadata accessor for EngagementEvent);
      return;
    case 3:
      (*(void (**)(char *, uint64_t, uint64_t))(v169 + 32))(v168, v49, v170);
      sub_20A8C6A70();
      uint64_t v82 = v154;
      sub_20A8C76D0();
      uint64_t v83 = v153;
      (*(void (**)(char *, void, uint64_t))(v174 + 104))(v153, *MEMORY[0x263F7A618], v175);
      sub_20A8B0810((unint64_t *)&qword_26AC69B48, MEMORY[0x263F7A628]);
      sub_20A8CE570();
      sub_20A8CE570();
      if (aBlock == v180 && v183 == v181)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v84 = v175;
        id v85 = *(void (**)(char *, uint64_t))(v174 + 8);
        v85(v83, v175);
        v85(v82, v84);
        uint64_t v86 = v157;
        uint64_t v87 = v156;
      }
      else
      {
        char v115 = sub_20A8CF760();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v116 = v175;
        id v117 = *(void (**)(char *, uint64_t))(v174 + 8);
        v117(v83, v175);
        v117(v82, v116);
        uint64_t v86 = v157;
        uint64_t v87 = v156;
        if ((v115 & 1) == 0) {
          goto LABEL_78;
        }
      }
      swift_retain();
      sub_20A8C6470();
      swift_release();
      if ((aBlock & 1) == 0)
      {
        uint64_t v118 = v166;
        (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v87, v172, v166);
        uint64_t v119 = sub_20A8C7DD0();
        uint64_t v120 = v86;
        os_log_type_t v121 = sub_20A8CEA00();
        if (os_log_type_enabled(v119, v121))
        {
          uint64_t v122 = (uint8_t *)swift_slowAlloc();
          uint64_t v123 = swift_slowAlloc();
          uint64_t aBlock = v123;
          *(_DWORD *)uint64_t v122 = 136315138;
          uint64_t v124 = sub_20A8C76B0();
          uint64_t v180 = sub_20A687610(v124, v125, &aBlock);
          sub_20A8CF1C0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v120 + 8))(v87, v166);
          _os_log_impl(&dword_20A414000, v119, v121, "Watched symbol feed [%s]. Incrementing symbol feed view count.", v122, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x210528850](v123, -1, -1);
          MEMORY[0x210528850](v122, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v120 + 8))(v87, v118);
        }

        uint64_t v86 = v120;
        uint64_t v141 = &v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store];
        __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store], *(void *)&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store + 24]);
        __swift_project_boxed_opaque_existential_1(v141, *((void *)v141 + 3));
        swift_retain();
        sub_20A8C6470();
        swift_release();
        uint64_t v142 = v183;
        if ((_BYTE)v185) {
          uint64_t v142 = 0;
        }
        BOOL v78 = __OFADD__(v142, 1);
        uint64_t v143 = v142 + 1;
        if (v78) {
          goto LABEL_81;
        }
        uint64_t v144 = aBlock;
        if ((_BYTE)v185) {
          uint64_t v145 = 0;
        }
        else {
          uint64_t v145 = v184;
        }
        if ((_BYTE)v185) {
          uint64_t v144 = 0;
        }
        uint64_t aBlock = v144;
        uint64_t v183 = v143;
        v184 = v145;
        LOBYTE(v185) = 0;
        swift_retain();
        sub_20A8C6480();
        swift_release();
      }
LABEL_78:
      (*(void (**)(char *, uint64_t))(v86 + 8))(v172, v166);
      (*(void (**)(char *, uint64_t))(v169 + 8))(v168, v170);
      return;
    case 4:
      id v88 = v167;
      uint64_t v89 = v49;
      uint64_t v90 = v173;
      (*(void (**)(char *, uint64_t, uint64_t))(v173 + 32))(v167, v89, v176);
      (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v52, v88, v51);
      uint64_t v91 = sub_20A8C7DD0();
      os_log_type_t v92 = sub_20A8CEA00();
      if (os_log_type_enabled(v91, v92))
      {
        uint64_t v93 = (uint8_t *)swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        uint64_t aBlock = v94;
        *(_DWORD *)uint64_t v93 = 136315138;
        v179 = (void (*)(char *, uint64_t))(v93 + 4);
        uint64_t v95 = v150;
        sub_20A8C6E70();
        uint64_t v96 = sub_20A8C67F0();
        uint64_t v97 = v2;
        unint64_t v99 = v98;
        (*(void (**)(char *, uint64_t))(v151 + 8))(v95, v152);
        uint64_t v180 = sub_20A687610(v96, v99, &aBlock);
        sub_20A8CF1C0();
        uint64_t v2 = v97;
        swift_bridgeObjectRelease();
        uint64_t v100 = *(void (**)(char *, uint64_t))(v173 + 8);
        v100(v178, v51);
        _os_log_impl(&dword_20A414000, v91, v92, "Added watch symbol [%s]. Incrementing watch symbol added count.", v93, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x210528850](v94, -1, -1);
        MEMORY[0x210528850](v93, -1, -1);
      }
      else
      {
        uint64_t v100 = *(void (**)(char *, uint64_t))(v90 + 8);
        v100(v52, v51);
      }

      uint64_t v126 = &v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store];
      __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store], *(void *)&v2[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store + 24]);
      __swift_project_boxed_opaque_existential_1(v126, *((void *)v126 + 3));
      swift_retain();
      sub_20A8C6470();
      swift_release();
      uint64_t v127 = aBlock;
      if ((_BYTE)v185) {
        uint64_t v127 = 0;
      }
      BOOL v78 = __OFADD__(v127, 1);
      uint64_t v128 = v127 + 1;
      if (v78) {
        goto LABEL_80;
      }
      uint64_t v129 = v183;
      if ((_BYTE)v185) {
        unint64_t v130 = 0;
      }
      else {
        unint64_t v130 = v184;
      }
      if ((_BYTE)v185) {
        uint64_t v129 = 0;
      }
      uint64_t aBlock = v128;
      uint64_t v183 = v129;
      v184 = v130;
      LOBYTE(v185) = 0;
      swift_retain();
      sub_20A8C6480();
      swift_release();
      v100(v167, v51);
      return;
    case 5:
      uint64_t v101 = v174;
      uint64_t v102 = v175;
      (*(void (**)(char *, uint64_t, uint64_t))(v174 + 32))(v171, v49, v175);
      char v103 = v155;
      (*(void (**)(char *, void, uint64_t))(v101 + 104))(v155, *MEMORY[0x263F7A610], v102);
      sub_20A8B0810((unint64_t *)&qword_26AC69B48, MEMORY[0x263F7A628]);
      sub_20A8CE570();
      sub_20A8CE570();
      if (aBlock == v180 && v183 == v181) {
        char v104 = 1;
      }
      else {
        char v104 = sub_20A8CF760();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v131 = *(void (**)(char *, uint64_t))(v174 + 8);
      v131(v103, v175);
      if (v104)
      {
        swift_retain();
        sub_20A8C6470();
        swift_release();
        if (aBlock == 1)
        {
          LOBYTE(aBlock) = 0;
          swift_retain();
          sub_20A8C6480();
          swift_release();
          sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F940);
          v178 = (char *)sub_20A8CEBE0();
          uint64_t v132 = v158;
          sub_20A8CC270();
          unint64_t v133 = v159;
          MEMORY[0x2105245B0](v132, 2.0);
          v179 = *(void (**)(char *, uint64_t))(v161 + 8);
          v179(v132, v165);
          uint64_t v134 = swift_allocObject();
          *(void *)(v134 + 16) = v2;
          uint64_t v186 = sub_20A8B0A00;
          uint64_t v187 = v134;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v183 = 1107296256;
          v184 = sub_20A4713FC;
          uint64_t v185 = &block_descriptor_13;
          uint64_t v135 = _Block_copy(&aBlock);
          uint64_t v136 = v2;
          swift_release();
          id v137 = v160;
          sub_20A8CC240();
          uint64_t aBlock = MEMORY[0x263F8EE78];
          sub_20A8B0810(&qword_26AC677A0, MEMORY[0x263F8F030]);
          sub_20A44D1C4(0);
          sub_20A8B0810((unint64_t *)&qword_26AC7F7B0, sub_20A44D1C4);
          uint64_t v138 = v162;
          uint64_t v139 = v149;
          sub_20A8CF290();
          id v140 = v178;
          MEMORY[0x210526ED0](v133, v137, v138, v135);
          _Block_release(v135);

          (*(void (**)(char *, uint64_t))(v148 + 8))(v138, v139);
          (*(void (**)(char *, uint64_t))(v163 + 8))(v137, v164);
          v179(v133, v165);
        }
      }
      v131(v171, v175);
      return;
    case 6:
      sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F940);
      char v105 = (void *)sub_20A8CEBE0();
      unint64_t v106 = v158;
      sub_20A8CC270();
      uint64_t v107 = v159;
      MEMORY[0x2105245B0](v106, 2.0);
      v179 = *(void (**)(char *, uint64_t))(v161 + 8);
      uint64_t v108 = v165;
      v179(v106, v165);
      uint64_t v109 = swift_allocObject();
      *(void *)(v109 + 16) = v2;
      uint64_t v186 = sub_20A8B07EC;
      uint64_t v187 = v109;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v183 = 1107296256;
      v184 = sub_20A4713FC;
      uint64_t v185 = &block_descriptor_54;
      uint64_t v110 = _Block_copy(&aBlock);
      v111 = v2;
      swift_release();
      uint64_t v112 = v160;
      sub_20A8CC240();
      uint64_t aBlock = MEMORY[0x263F8EE78];
      sub_20A8B0810(&qword_26AC677A0, MEMORY[0x263F8F030]);
      sub_20A44D1C4(0);
      sub_20A8B0810((unint64_t *)&qword_26AC7F7B0, sub_20A44D1C4);
      uint64_t v113 = v162;
      uint64_t v114 = v149;
      sub_20A8CF290();
      MEMORY[0x210526ED0](v107, v112, v113, v110);
      _Block_release(v110);

      (*(void (**)(char *, uint64_t))(v148 + 8))(v113, v114);
      (*(void (**)(char *, uint64_t))(v163 + 8))(v112, v164);
      v179(v107, v108);
      return;
    default:
      uint64_t v53 = sub_20A8C7DD0();
      os_log_type_t v54 = sub_20A8CEA00();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v55 = 0;
        _os_log_impl(&dword_20A414000, v53, v54, "Starting new session. Resetting counts.", v55, 2u);
        MEMORY[0x210528850](v55, -1, -1);
      }

      MEMORY[0x270FA5388](v56);
      v146[-2] = v2;
      sub_20A42D040(0);
      sub_20A8C6670();
      *(void *)(swift_allocObject() + 16) = v2;
      uint64_t v57 = v2;
      id v58 = (void *)sub_20A8C6450();
      sub_20A8C6500();
      swift_release();
      swift_release();
      swift_release();

      unint64_t v59 = &v57[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store];
LABEL_27:
      __swift_project_boxed_opaque_existential_1(v59, *((void *)v59 + 3));
      uint64_t aBlock = 0;
      uint64_t v183 = 0;
      v184 = 0;
      LOBYTE(v185) = 1;
      goto LABEL_39;
  }
}

void sub_20A8AF774()
{
  uint64_t v1 = v0;
  sub_20A8B05C4(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20A8C3B60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AC69CF0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_20A8C7DF0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AC69CD0);
  uint64_t v10 = sub_20A8C7DD0();
  os_log_type_t v11 = sub_20A8CEA00();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_20A414000, v10, v11, "Determining if review prompt needs to be displayed", v12, 2u);
    MEMORY[0x210528850](v12, -1, -1);
  }

  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store), *(void *)(v1 + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store + 24));
  swift_retain();
  sub_20A8C6470();
  swift_release();
  if (v40)
  {
    uint64_t v13 = sub_20A8C7DD0();
    os_log_type_t v14 = sub_20A8CEA00();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v16 = "No stored state found. Skipping processing";
LABEL_11:
      _os_log_impl(&dword_20A414000, v13, v14, v16, v15, 2u);
      MEMORY[0x210528850](v15, -1, -1);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v17 = v37;
  uint64_t v18 = v38;
  uint64_t v19 = v39;
  sub_20A8AD758((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_20A8B0724((uint64_t)v4, (uint64_t (*)(void))sub_20A8B05C4);
    uint64_t v13 = sub_20A8C7DD0();
    os_log_type_t v14 = sub_20A8CEA00();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v16 = "No appReviewPromptConfig found. Skipping processing";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  uint64_t v36 = v19;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  uint64_t v20 = sub_20A8C3B30();
  uint64_t v21 = sub_20A8C3B50();
  uint64_t v22 = sub_20A8C3B40();
  if (v18 >= v20)
  {
    uint64_t v24 = sub_20A8C7DD0();
    os_log_type_t v27 = sub_20A8CEA00();
    if (!os_log_type_enabled(v24, v27)) {
      goto LABEL_26;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 134217984;
    uint64_t v37 = v20;
    sub_20A8CF1C0();
    _os_log_impl(&dword_20A414000, v24, v27, "Reached minNumberOfSymbolViews %ld", v28, 0xCu);
    unint64_t v29 = v28;
LABEL_25:
    MEMORY[0x210528850](v29, -1, -1);
    goto LABEL_26;
  }
  if (v17 >= v21)
  {
    uint64_t v24 = sub_20A8C7DD0();
    os_log_type_t v30 = sub_20A8CEA00();
    if (!os_log_type_enabled(v24, v30)) {
      goto LABEL_26;
    }
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    uint64_t v37 = v21;
    sub_20A8CF1C0();
    _os_log_impl(&dword_20A414000, v24, v30, "Reached minNumberOfSymbolsAddedToWatchlist %ld", v31, 0xCu);
    unint64_t v29 = v31;
    goto LABEL_25;
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_20A8C7DD0();
  int v35 = sub_20A8CEA00();
  BOOL v25 = os_log_type_enabled(v24, (os_log_type_t)v35);
  if (v36 < v23)
  {
    if (v25)
    {
      uint64_t v34 = v23;
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 134219264;
      uint64_t v37 = v18;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 12) = 2048;
      uint64_t v37 = v20;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 22) = 2048;
      uint64_t v37 = v17;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 32) = 2048;
      uint64_t v37 = v21;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 42) = 2048;
      uint64_t v37 = v36;
      sub_20A8CF1C0();
      *(_WORD *)(v26 + 52) = 2048;
      uint64_t v37 = v34;
      sub_20A8CF1C0();
      _os_log_impl(&dword_20A414000, v24, (os_log_type_t)v35, "Skipping review prompt request. Threshold not reached: symbol views %ld/%ld, symbols added %ld/%ld, reads %ld/%ld", (uint8_t *)v26, 0x3Eu);
      MEMORY[0x210528850](v26, -1, -1);
    }

    goto LABEL_27;
  }
  if (v25)
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 134217984;
    uint64_t v37 = v23;
    sub_20A8CF1C0();
    _os_log_impl(&dword_20A414000, v24, (os_log_type_t)v35, "Reached minNumberOfArticleReads %ld", v32, 0xCu);
    unint64_t v29 = v32;
    goto LABEL_25;
  }
LABEL_26:

  sub_20A8AFDD0();
LABEL_27:
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_20A8AFDD0()
{
  sub_20A42CFF0(0, &qword_26AC7F8D0);
  uint64_t v0 = sub_20A8CE9C0();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    if (qword_26AC69CF0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_20A8C7DF0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AC69CD0);
    uint64_t v3 = sub_20A8C7DD0();
    os_log_type_t v4 = sub_20A8CEA00();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_20A414000, v3, v4, "Requesting review prompt", v5, 2u);
      MEMORY[0x210528850](v5, -1, -1);
    }

    sub_20A8C48E0();
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = v1;
    swift_retain();
    id v8 = v1;
    sub_20A8C66A0();

    swift_release();
    swift_release();
  }
  else
  {
    if (qword_26AC69CF0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_20A8C7DF0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26AC69CD0);
    oslog = sub_20A8C7DD0();
    os_log_type_t v10 = sub_20A8CEA00();
    if (os_log_type_enabled(oslog, v10))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v11 = 0;
      _os_log_impl(&dword_20A414000, oslog, v10, "No active window scene! Skipping review prompt", v11, 2u);
      MEMORY[0x210528850](v11, -1, -1);
    }
  }
}

uint64_t sub_20A8B0074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C2800();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = &v18[-v9];
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = &v18[-v12];
  swift_beginAccess();
  uint64_t result = MEMORY[0x2105289B0](a1 + 16);
  if (result)
  {
    uint64_t v15 = (char *)result;
    sub_20A8C27C0();
    __swift_project_boxed_opaque_existential_1(&v15[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_userInfo], *(void *)&v15[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_userInfo + 24]);
    sub_20A8C2D80();
    uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
    v16(v10, v13, v4);
    v16(v7, v10, v4);
    swift_retain();
    sub_20A8C6480();
    swift_release();
    uint64_t v17 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v17(v10, v4);
    __swift_project_boxed_opaque_existential_1(&v15[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store], *(void *)&v15[OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store + 24]);
    memset(&v18[8], 0, 25);
    swift_retain();
    sub_20A8C6480();
    swift_release();
    objc_msgSend(self, sel_requestReviewInScene_, a2);

    return ((uint64_t (*)(unsigned char *, uint64_t))v17)(v13, v4);
  }
  return result;
}

uint64_t sub_20A8B02BC()
{
  sub_20A8C74C0();
  sub_20A8B0810((unint64_t *)&unk_26763EB38, MEMORY[0x263F7A438]);
  memset(v1, 0, sizeof(v1));
  sub_20A8C45D0();
  return sub_20A8B0724((uint64_t)v1, (uint64_t (*)(void))sub_20A42F348);
}

uint64_t sub_20A8B047C()
{
  return type metadata accessor for AppReviewRequestManager();
}

uint64_t type metadata accessor for AppReviewRequestManager()
{
  uint64_t result = qword_26AC74460;
  if (!qword_26AC74460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20A8B04D0()
{
  sub_20A8B0590(319);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_20A8B0590(uint64_t a1)
{
}

void sub_20A8B05C4(uint64_t a1)
{
}

void sub_20A8B05F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_20A8B06B8()
{
  return sub_20A8B0858();
}

uint64_t sub_20A8B06D0()
{
  return swift_deallocObject();
}

uint64_t sub_20A8B0708(uint64_t a1)
{
  return sub_20A8ADA08(a1);
}

uint64_t sub_20A8B0724(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A8B0784(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_20A8B07EC()
{
}

uint64_t sub_20A8B0810(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A8B0858()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_userInfo), *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_userInfo + 24));
  return sub_20A8C2D50();
}

uint64_t sub_20A8B08B0()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_20A8B08E8()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20A8B0928()
{
  return sub_20A8B0074(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_20A8B0930(uint64_t a1, uint64_t a2)
{
  sub_20A8B0590(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A8B0994(uint64_t a1, uint64_t a2)
{
  sub_20A8B05C4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A8B0A10(uint64_t a1)
{
  return sub_20A8B0708(a1);
}

uint64_t sub_20A8B0A28(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_20A8B2A28(0, &qword_26AC68C48, MEMORY[0x263F8DB68], MEMORY[0x263F8DB70], MEMORY[0x263F8DFB0]);
    uint64_t v2 = sub_20A8CF570();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_20A592C7C();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_20A441D28(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_20A441D28(v35, v36);
    sub_20A441D28(v36, &v32);
    uint64_t result = sub_20A8CF340();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_20A441D28(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_20A6BDA0C();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_20A8B0E04(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_20A8B2A28(0, &qword_26AC68C48, MEMORY[0x263F8DB68], MEMORY[0x263F8DB70], MEMORY[0x263F8DFB0]);
    uint64_t v2 = sub_20A8CF570();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_20A4ED764(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    void v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_20A441D28(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_20A441D28(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_20A441D28(v36, v37);
    sub_20A441D28(v37, &v33);
    uint64_t result = sub_20A8CF340();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_20A441D28(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_20A6BDA0C();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_20A8B11F4(uint64_t a1)
{
  uint64_t v2 = sub_20A8C6340();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v51 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B2A84();
  uint64_t v50 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v42 - v9;
  uint64_t v52 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_20A8B2A28(0, &qword_26AC68C48, MEMORY[0x263F8DB68], MEMORY[0x263F8DB70], MEMORY[0x263F8DFB0]);
    uint64_t v11 = sub_20A8CF570();
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE80];
  }
  uint64_t v12 = *(void *)(v52 + 64);
  uint64_t v44 = v52 + 64;
  uint64_t v13 = -1 << *(unsigned char *)(v52 + 32);
  if (-v13 < 64) {
    uint64_t v14 = ~(-1 << -(char)v13);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v12;
  uint64_t v42 = -1 << *(unsigned char *)(v52 + 32);
  int64_t v43 = (unint64_t)(63 - v13) >> 6;
  uint64_t v49 = v3 + 16;
  uint64_t v48 = &v57;
  uint64_t v47 = v3 + 32;
  uint64_t v46 = &v61;
  uint64_t v16 = v11 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v53 = 0;
  uint64_t v45 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v21 = v20 | (v53 << 6);
      goto LABEL_28;
    }
    int64_t v22 = v53 + 1;
    if (__OFADD__(v53, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v22 >= v43) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v44 + 8 * v22);
    int64_t v24 = v53 + 1;
    if (!v23)
    {
      int64_t v24 = v53 + 2;
      if (v53 + 2 >= v43) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v44 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v53 + 3;
        if (v53 + 3 >= v43) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v44 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v53 + 4;
          if (v53 + 4 >= v43) {
            goto LABEL_37;
          }
          unint64_t v23 = *(void *)(v44 + 8 * v24);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v15 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    int64_t v53 = v24;
LABEL_28:
    uint64_t v26 = (uint64_t *)(*(void *)(v52 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = v50;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(&v10[*(int *)(v50 + 48)], *(void *)(v52 + 56) + *(void *)(v3 + 72) * v21, v2);
    *(void *)uint64_t v10 = v28;
    *((void *)v10 + 1) = v27;
    sub_20A8B2AF0((uint64_t)v10, (uint64_t)v7);
    long long v30 = (char *)v7 + *(int *)(v29 + 48);
    uint64_t v31 = v7[1];
    *(void *)&long long v62 = *v7;
    *((void *)&v62 + 1) = v31;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v51, v30, v2);
    long long v32 = v48;
    swift_dynamicCast();
    long long v58 = v54;
    long long v59 = v55;
    uint64_t v60 = v56;
    long long v33 = v32;
    long long v34 = v46;
    sub_20A441D28(v33, v46);
    long long v54 = v58;
    long long v55 = v59;
    uint64_t v56 = v60;
    sub_20A441D28(v34, &v62);
    sub_20A441D28(&v62, &v58);
    uint64_t result = sub_20A8CF340();
    uint64_t v35 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v16 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v36) & ~*(void *)(v16 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v16 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v18 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v16 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = *(void *)(v11 + 48) + 40 * v18;
    *(_OWORD *)uint64_t v19 = v54;
    *(_OWORD *)(v19 + 16) = v55;
    *(void *)(v19 + 32) = v56;
    uint64_t result = (uint64_t)sub_20A441D28(&v58, (_OWORD *)(*(void *)(v11 + 56) + 32 * v18));
    ++*(void *)(v11 + 16);
  }
  int64_t v25 = v53 + 5;
  if (v53 + 5 >= v43)
  {
LABEL_37:
    swift_release();
    sub_20A6BDA0C();
    return v11;
  }
  unint64_t v23 = *(void *)(v44 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v53 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v43) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v44 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t AppConfiguration.personalizationConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  sub_20A8B1D78();
  uint64_t v37 = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v36 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B1E34(0, &qword_26AC68B38, &qword_26AC68C20);
  uint64_t v33 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v39 = (char *)&v32 - v6;
  sub_20A8B1DD4(0, &qword_26AC68B18, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v32 - v8;
  sub_20A8B1DD4(0, &qword_26AC68B20, MEMORY[0x263F59ED8]);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - v13;
  sub_20A8B1DD4(0, (unint64_t *)&unk_26AC68B28, MEMORY[0x263F59EE8]);
  MEMORY[0x270FA5388](v15 - 8);
  long long v32 = (char *)&v32 - v16;
  sub_20A8B1E34(0, (unint64_t *)&unk_26AC68B40, &qword_26AC68C28);
  double v18 = MEMORY[0x270FA5388](v17);
  uint64_t v35 = (char *)&v32 - v19;
  uint64_t v20 = *MEMORY[0x263F59EE0];
  (*(void (**)(double))(v21 + 104))(v18);
  id v34 = AppConfiguration.fcPersonalizationTreatment.getter();
  sub_20A8C3090();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F59ED0], v11);
  AppConfiguration.statelessPersonalizationConfiguration.getter((uint64_t)v9);
  sub_20A8C7D30();
  sub_20A8C7D40();
  sub_20A8B26F8((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 104))(v39, v20, v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 104))(v36, v20, v37);
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_20A8B2814(MEMORY[0x263F8EE78]);
  id v23 = objc_allocWithZone(MEMORY[0x263F595D0]);
  uint64_t v24 = MEMORY[0x263F8DB68];
  uint64_t v25 = MEMORY[0x263F8DB70];
  uint64_t v26 = (void *)sub_20A8CE170();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_initWithConfig_, v26);

  sub_20A8B2814(v22);
  id v27 = objc_allocWithZone(MEMORY[0x263F595D0]);
  uint64_t v28 = (void *)sub_20A8CE170();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_initWithConfig_, v28);

  id v29 = objc_allocWithZone(MEMORY[0x263F59650]);
  sub_20A8B2A28(0, &qword_26AC68C10, v24, v25, MEMORY[0x263F8D060]);
  long long v30 = (void *)sub_20A8CE5D0();
  objc_msgSend(v29, sel_initWithArray_, v30);

  return sub_20A8C7D60();
}

void sub_20A8B1D78()
{
  if (!qword_26AC68B50)
  {
    unint64_t v0 = sub_20A8C7D50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC68B50);
    }
  }
}

void sub_20A8B1DD4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_20A8C7D30();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_20A8B1E34(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_20A42CFF0(255, a3);
    unint64_t v4 = sub_20A8C7D50();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_20A8B1E8C@<X0>(uint64_t a1@<X8>)
{
  return AppConfiguration.personalizationConfiguration.getter(a1);
}

uint64_t sub_20A8B1EB8(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_20A8C7D70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AppConfiguration.personalizationConfiguration.getter((uint64_t)v6);
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_20A8B1F9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_20A8C3190();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v1 + 16), *(void *)(*(void *)v1 + 40));
  sub_20A8C3AC0();
  AppConfiguration.personalizationConfiguration.getter(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_20A8B209C()
{
  sub_20A8C3190();
  sub_20A8C6670();
  unint64_t v0 = (void *)sub_20A8C6450();
  sub_20A8C7D70();
  uint64_t v1 = sub_20A8C6500();
  swift_release();

  return v1;
}

uint64_t sub_20A8B213C(uint64_t a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v2 + 16), *(void *)(*(void *)v2 + 40));
  sub_20A8C3AB0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  sub_20A8C5D60();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

id AppConfiguration.fcPersonalizationTreatment.getter()
{
  v18[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_20A8C3B70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C20C0();
  swift_allocObject();
  sub_20A8C20B0();
  sub_20A8C3040();
  sub_20A8B296C();
  uint64_t v4 = sub_20A8C20A0();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  unint64_t v7 = self;
  uint64_t v8 = (void *)sub_20A8C2550();
  v18[0] = 0;
  id v9 = objc_msgSend(v7, sel_JSONObjectWithData_options_error_, v8, 4, v18);

  id v10 = v18[0];
  if (!v9) {
    goto LABEL_5;
  }
  id v11 = v18[0];
  sub_20A8CF270();
  swift_unknownObjectRelease();
  sub_20A8B2A28(0, (unint64_t *)&unk_26AC68C00, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8D060]);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F595D8]), sel_init);
    goto LABEL_7;
  }
  sub_20A8B0E04(v17[1]);
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone(MEMORY[0x263F595D8]);
  uint64_t v12 = (void *)sub_20A8CE170();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithPersonalizationTreatmentDictionary_, v12);

  if (!v13)
  {
    __break(1u);
LABEL_5:
    id v14 = v10;
    uint64_t v15 = (void *)sub_20A8C2400();

    swift_willThrow();
    goto LABEL_6;
  }
LABEL_7:
  sub_20A531704(v4, v6);
  return v13;
}

void AppConfiguration.statelessPersonalizationConfiguration.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_20A8C2F80();
  if (v2
    && (sub_20A8B11F4(v2),
        swift_bridgeObjectRelease(),
        id v3 = objc_allocWithZone(MEMORY[0x263F59558]),
        uint64_t v4 = (void *)sub_20A8CE170(),
        swift_bridgeObjectRelease(),
        id v11 = objc_msgSend(v3, sel_initWithDictionary_, v4),
        v4,
        v11))
  {
    id v5 = objc_msgSend(v11, sel_articleEmbeddingsConfiguration);
    id v6 = objc_msgSend(v11, sel_featureConfiguration);
    AppConfiguration.fcPersonalizationTreatment.getter();
    id v7 = objc_msgSend(v11, sel_statelessPersonalizationConfiguration);
    id v8 = objc_msgSend(v11, sel_trainingConfiguration);
    sub_20A8C7D20();
  }
  else
  {
    uint64_t v9 = sub_20A8C7D30();
    id v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    v10(a1, 1, 1, v9);
  }
}

uint64_t sub_20A8B26F8(uint64_t a1)
{
  sub_20A8B1DD4(0, &qword_26AC68B18, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id AppConfiguration.fcPersonalizationConfiguration.getter()
{
  uint64_t v0 = sub_20A8C2F80();
  id v1 = (id)v0;
  if (v0)
  {
    sub_20A8B11F4(v0);
    swift_bridgeObjectRelease();
    id v2 = objc_allocWithZone(MEMORY[0x263F59558]);
    id v3 = (void *)sub_20A8CE170();
    swift_bridgeObjectRelease();
    id v1 = objc_msgSend(v2, sel_initWithDictionary_, v3);
  }
  return v1;
}

unint64_t sub_20A8B2814(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_20A8B2A28(0, &qword_26AC68C48, MEMORY[0x263F8DB68], MEMORY[0x263F8DB70], MEMORY[0x263F8DFB0]);
  uint64_t v2 = sub_20A8CF570();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20A8B2B54(v6, (uint64_t)v15);
    unint64_t result = sub_20A4D1D30((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_20A441D28(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
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

unint64_t sub_20A8B296C()
{
  unint64_t result = qword_26AC68AC8;
  if (!qword_26AC68AC8)
  {
    sub_20A8C3B70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC68AC8);
  }
  return result;
}

uint64_t type metadata accessor for StocksPersonalizationConfigurationManager()
{
  return self;
}

uint64_t sub_20A8B29E8()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20A8B2A20(uint64_t a1)
{
  return sub_20A8B1EB8(a1, *(void (**)(char *))(v1 + 16));
}

void sub_20A8B2A28(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, MEMORY[0x263F8EE58] + 8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_20A8B2A84()
{
  if (!qword_26763EB48)
  {
    sub_20A8C6340();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26763EB48);
    }
  }
}

uint64_t sub_20A8B2AF0(uint64_t a1, uint64_t a2)
{
  sub_20A8B2A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A8B2B54(uint64_t a1, uint64_t a2)
{
  sub_20A8B2BB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_20A8B2BB8()
{
  if (!qword_26763EB50)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26763EB50);
    }
  }
}

uint64_t sub_20A8B2C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8B2C38);
}

uint64_t sub_20A8B2C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C9830();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_20A8B2CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8B2CB8);
}

uint64_t sub_20A8B2CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C9830();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for StockFeedMastheadViewLayoutOptions()
{
  uint64_t result = qword_26AC7CA18;
  if (!qword_26AC7CA18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A8B2D74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_20A8C5420();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B34BC(0, (unint64_t *)&unk_26763EB60, MEMORY[0x263F58D18]);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v41 - v7;
  sub_20A8B34BC(0, &qword_26763DC88, MEMORY[0x263F79DA0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v45 = (char *)&v41 - v10;
  uint64_t v11 = sub_20A8C6C80();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v46 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_20A8C5430();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v41 - v19;
  *(double *)&uint64_t result = COERCE_DOUBLE(sub_20A8C5400());
  if (v22)
  {
    int v43 = 0;
LABEL_7:
    *(double *)&uint64_t result = COERCE_DOUBLE(sub_20A8C53E0());
    if ((~*(void *)&v23 & 0x7FF0000000000000) != 0)
    {
      if (v23 > -9.22337204e18)
      {
        if (v23 < 9.22337204e18)
        {
          sub_20A8C53F0();
          (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v17, v20, v14);
          int v24 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
          if (v24 == *MEMORY[0x263F58D30])
          {
            uint64_t v25 = (unsigned int *)MEMORY[0x263F79DB8];
          }
          else if (v24 == *MEMORY[0x263F58D38])
          {
            uint64_t v25 = (unsigned int *)MEMORY[0x263F79DC0];
          }
          else if (v24 == *MEMORY[0x263F58D48])
          {
            uint64_t v25 = (unsigned int *)MEMORY[0x263F79DD0];
          }
          else if (v24 == *MEMORY[0x263F58D28])
          {
            uint64_t v25 = (unsigned int *)MEMORY[0x263F79DE8];
          }
          else
          {
            if (v24 != *MEMORY[0x263F58D20])
            {
              id v27 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
              if (v24 != *MEMORY[0x263F58D40])
              {
                v27(v46, *MEMORY[0x263F79DD8], v11);
                (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_22:
                (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
                sub_20A8C53D0();
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3) == 1)
                {
                  sub_20A8B3510((uint64_t)v8);
                  uint64_t v28 = sub_20A8C6C70();
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v45, 1, 1, v28);
LABEL_31:
                  sub_20A8C70A0();
                  uint64_t v39 = sub_20A8C5410();
                  *(double *)&uint64_t result = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(a1, v39));
                  return result;
                }
                id v29 = v42;
                (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v42, v8, v3);
                int v30 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v29, v3);
                uint64_t v31 = v45;
                if (v30 == *MEMORY[0x263F58D08])
                {
                  long long v32 = (unsigned int *)MEMORY[0x263F79D90];
                }
                else
                {
                  int v33 = v30;
                  if (v30 != *MEMORY[0x263F58D10])
                  {
                    int v40 = *MEMORY[0x263F58D00];
                    uint64_t v35 = sub_20A8C6C70();
                    unint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104);
                    if (v33 != v40)
                    {
                      v36(v31, *MEMORY[0x263F79D90], v35);
                      (*(void (**)(char *, uint64_t))(v4 + 8))(v42, v3);
                      goto LABEL_30;
                    }
                    uint64_t v38 = *MEMORY[0x263F79D88];
                    uint64_t v37 = v31;
LABEL_29:
                    v36(v37, v38, v35);
LABEL_30:
                    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
                    sub_20A8C6C70();
                    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v31, 0, 1, v35);
                    goto LABEL_31;
                  }
                  long long v32 = (unsigned int *)MEMORY[0x263F79D98];
                }
                uint64_t v34 = *v32;
                uint64_t v35 = sub_20A8C6C70();
                unint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104);
                uint64_t v37 = v31;
                uint64_t v38 = v34;
                goto LABEL_29;
              }
              uint64_t v26 = *MEMORY[0x263F79DC8];
LABEL_21:
              v27(v46, v26, v11);
              goto LABEL_22;
            }
            uint64_t v25 = (unsigned int *)MEMORY[0x263F79DD8];
          }
          uint64_t v26 = *v25;
          id v27 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
          goto LABEL_21;
        }
        goto LABEL_40;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if ((~result & 0x7FF0000000000000) == 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(double *)&result <= -2147483650.0)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (*(double *)&result < 2147483650.0)
  {
    int v43 = (int)*(double *)&result;
    goto LABEL_7;
  }
LABEL_43:
  __break(1u);
  return result;
}

void sub_20A8B34BC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_20A8CF1B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_20A8B3510(uint64_t a1)
{
  sub_20A8B34BC(0, (unint64_t *)&unk_26763EB60, MEMORY[0x263F58D18]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A8B3588(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_20A8B35A0(void *a1, void (*a2)(void), uint64_t a3, void *a4)
{
  if (a1)
  {
    id v6 = a1;
    id v7 = objc_msgSend(v6, sel_viewControllers);
    sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F920);
    unint64_t v8 = sub_20A8CE5E0();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_20A8CF540();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v9 = (id)MEMORY[0x210527700](0, v8);
      }
      else
      {
        if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v9 = *(id *)(v8 + 32);
      }
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_20A5C845C();
      if (swift_dynamicCastClass())
      {
        sub_20A8C6370();
        type metadata accessor for ForYouFeedViewController();
        sub_20A8CEB80();

        if (v17)
        {
          id v11 = v17;
          uint64_t v12 = (void *)sub_20A8CE240();
          objc_msgSend(a4, sel_setObject_forKey_, v11, v12);

          ((void (*)(void))a2)(0);
        }
        else
        {
          id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
          a2();
        }
        return;
      }

      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
LABEL_16:
    sub_20A5C845C();
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    a2();

    goto LABEL_17;
  }
  sub_20A42CFF0(0, &qword_26763EB78);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
  a2();
LABEL_17:
}

void sub_20A8B389C(void *a1, uint64_t a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  uint64_t v8 = sub_20A8CC220();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v59 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_20A8CC250();
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v57 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A8CC280();
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v56 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v52 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v61 = (char *)&v47 - v15;
  uint64_t v16 = sub_20A8C2800();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C27F0();
  uint64_t v53 = a2;
  LOBYTE(a2) = sub_20A8C2750();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if ((a2 & 1) == 0)
  {
    a3(0);
    return;
  }
  uint64_t v50 = a3;
  uint64_t v51 = a4;
  uint64_t v48 = v9;
  uint64_t v49 = v8;
  id v20 = objc_msgSend(a1, sel_viewControllers);
  sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F920);
  unint64_t v21 = sub_20A8CE5E0();

  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_20A8CF540();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v22 >= 2)
  {
    double v23 = a1;
    id v24 = objc_msgSend(a1, sel_viewControllers);
    uint64_t v25 = sub_20A8CE5E0();

    if ((v25 & 0xC000000000000001) != 0)
    {
      id v27 = (id)MEMORY[0x210527700](1, v25);
      uint64_t v26 = v50;
    }
    else
    {
      uint64_t v26 = v50;
      if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
        return;
      }
      id v27 = *(id *)(v25 + 40);
    }
    swift_bridgeObjectRelease();
    self;
    uint64_t v28 = swift_dynamicCastObjCClass();
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = v27;
      v26(v29);

      return;
    }

    a1 = v23;
  }
  sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F940);
  uint64_t v47 = sub_20A8CEBE0();
  uint64_t v31 = v52;
  sub_20A8CC270();
  MEMORY[0x2105245B0](v31, 0.5);
  uint64_t v32 = v56;
  uint64_t v55 = *(void *)(v55 + 8);
  ((void (*)(char *, uint64_t))v55)(v31, v56);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v53, v16);
  unint64_t v33 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v34 = (v18 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v35 = swift_allocObject();
  unint64_t v36 = v54;
  *(void *)(v35 + 16) = v54;
  *(void *)(v35 + 24) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v35 + v33, v19, v16);
  uint64_t v37 = (void (**)(uint64_t))(v35 + v34);
  uint64_t v38 = v51;
  *uint64_t v37 = v50;
  v37[1] = v38;
  aBlock[4] = sub_20A8B5760;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20A4713FC;
  aBlock[3] = &block_descriptor_14;
  uint64_t v39 = _Block_copy(aBlock);
  id v40 = v36;
  id v41 = a1;
  swift_retain();
  swift_release();
  uint64_t v42 = v57;
  sub_20A8CC240();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_20A8B5764(&qword_26AC677A0, MEMORY[0x263F8F030]);
  sub_20A44D1C4(0);
  sub_20A8B5764((unint64_t *)&qword_26AC7F7B0, sub_20A44D1C4);
  int v43 = v59;
  uint64_t v44 = v49;
  sub_20A8CF290();
  uint64_t v45 = v61;
  uint64_t v46 = (void *)v47;
  MEMORY[0x210526ED0](v61, v42, v43, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v48 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v60);
  ((void (*)(char *, uint64_t))v55)(v45, v32);
}

uint64_t type metadata accessor for MainTestSuite()
{
  return self;
}

void sub_20A8B4030(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    id v5 = a1;
    id v6 = objc_msgSend(v5, sel_viewControllers);
    sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F920);
    unint64_t v7 = sub_20A8CE5E0();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_20A8CF540();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      if ((v7 & 0xC000000000000001) != 0)
      {
        id v8 = (id)MEMORY[0x210527700](0, v7);
      }
      else
      {
        if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v8 = *(id *)(v7 + 32);
      }
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      sub_20A5C845C();
      if (swift_dynamicCastClass())
      {
        sub_20A8C6370();
        type metadata accessor for ForYouFeedViewController();
        sub_20A8CEB80();

        if (v15)
        {
          id v10 = v15;
          uint64_t v11 = (void *)sub_20A8CE240();
          objc_msgSend(a2, sel_setObject_forKey_, v10, v11);

          (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0);
        }
        else
        {
          id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
          (*(void (**)(uint64_t, id))(a3 + 16))(a3, v10);
        }

        return;
      }

      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
LABEL_16:
    sub_20A5C845C();
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v13);

    goto LABEL_17;
  }
  sub_20A42CFF0(0, &qword_26763EB78);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v13);
LABEL_17:
}

void sub_20A8B4328(void *a1, uint64_t a2, void *a3, void *a4, void (**a5)(void, void))
{
  uint64_t v60 = a3;
  uint64_t v9 = sub_20A8CC220();
  uint64_t v65 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_20A8CC250();
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A8CC280();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  uint64_t v68 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v58 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v66 = (char *)&v52 - v16;
  uint64_t v17 = sub_20A8C2800();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v57 = v19;
  id v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a5;
  uint64_t v22 = (void (*)(void *))swift_allocObject();
  *((void *)v22 + 2) = sub_20A8B56FC;
  *((void *)v22 + 3) = v21;
  *((void *)v22 + 4) = a4;
  _Block_copy(a5);
  _Block_copy(a5);
  swift_retain();
  uint64_t v56 = a4;
  sub_20A8C27F0();
  uint64_t v59 = a2;
  LOBYTE(a4) = sub_20A8C2750();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if ((a4 & 1) == 0)
  {
    sub_20A42CFF0(0, &qword_26763EB78);
    id v33 = objc_allocWithZone(MEMORY[0x263F7D158]);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    _Block_copy(a5);
    id v35 = objc_msgSend(v33, sel_initWithMissingClass_, ObjCClassFromMetadata);
    ((void (**)(void, id))a5)[2](a5, v35);

    _Block_release(a5);
LABEL_13:
    swift_release();
    swift_release();
    goto LABEL_14;
  }
  uint64_t v54 = v9;
  id v55 = a1;
  id v23 = objc_msgSend(a1, sel_viewControllers);
  sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F920);
  unint64_t v24 = sub_20A8CE5E0();

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_20A8CF540();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v25 < 2)
  {
LABEL_12:
    sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F940);
    uint64_t v53 = sub_20A8CEBE0();
    unint64_t v36 = v58;
    sub_20A8CC270();
    MEMORY[0x2105245B0](v36, 0.5);
    uint64_t v37 = *(void (**)(char *, uint64_t))(v68 + 8);
    v68 += 8;
    uint64_t v56 = v37;
    v37(v36, v67);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v59, v17);
    unint64_t v38 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    unint64_t v39 = (v57 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v40 = swift_allocObject();
    uint64_t v59 = v21;
    id v41 = v60;
    id v42 = v55;
    *(void *)(v40 + 16) = v60;
    *(void *)(v40 + 24) = v42;
    (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v40 + v38, v20, v17);
    int v43 = (void (**)(void *))(v40 + v39);
    *int v43 = sub_20A8B5750;
    v43[1] = v22;
    aBlock[4] = sub_20A8B5760;
    aBlock[5] = v40;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20A4713FC;
    aBlock[3] = &block_descriptor_55;
    uint64_t v44 = _Block_copy(aBlock);
    id v45 = v41;
    id v46 = v42;
    swift_retain();
    swift_release();
    uint64_t v47 = v61;
    sub_20A8CC240();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_20A8B5764(&qword_26AC677A0, MEMORY[0x263F8F030]);
    sub_20A44D1C4(0);
    sub_20A8B5764((unint64_t *)&qword_26AC7F7B0, sub_20A44D1C4);
    uint64_t v48 = v63;
    uint64_t v49 = v54;
    sub_20A8CF290();
    uint64_t v50 = v66;
    uint64_t v51 = (void *)v53;
    MEMORY[0x210526ED0](v66, v47, v48, v44);
    _Block_release(v44);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v48, v49);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v64);
    v56(v50, v67);
    goto LABEL_13;
  }
  id v26 = objc_msgSend(v55, sel_viewControllers);
  uint64_t v27 = sub_20A8CE5E0();

  if ((v27 & 0xC000000000000001) != 0)
  {
    id v28 = (id)MEMORY[0x210527700](1, v27);
    goto LABEL_8;
  }
  if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v28 = *(id *)(v27 + 40);
LABEL_8:
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    self;
    uint64_t v30 = swift_dynamicCastObjCClass();
    if (v30)
    {
      uint64_t v31 = (void *)v30;
      _Block_copy(a5);
      id v32 = v29;
      sub_20A8B4030(v31, v56, (uint64_t)a5);
      _Block_release(a5);
      swift_release();
      swift_release();

LABEL_14:
      _Block_release(a5);
      return;
    }

    goto LABEL_12;
  }
  __break(1u);
}

void sub_20A8B4AEC(void *a1, void *a2, void (**a3)(void, void))
{
  id v6 = (void *)sub_20A8C2800();
  uint64_t v7 = *(v6 - 1);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v63 - v11;
  _Block_copy(a3);
  id v13 = objc_msgSend(a1, sel_application);
  id v14 = objc_msgSend(v13, sel_connectedScenes);

  sub_20A42CFF0(0, (unint64_t *)&qword_26763CFD0);
  sub_20A6BD9A4();
  uint64_t v15 = sub_20A8CE7F0();

  uint64_t v16 = (void *)sub_20A685470(v15);
  swift_bridgeObjectRelease();
  if (!v16) {
    goto LABEL_47;
  }
  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClass();
  if (!v17) {
    goto LABEL_34;
  }
  id v18 = objc_msgSend(v17, sel_windows);
  sub_20A42CFF0(0, (unint64_t *)&qword_26AC823A0);
  unint64_t v19 = sub_20A8CE5E0();

  if (!(v19 >> 62))
  {
    unint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20) {
      goto LABEL_5;
    }
LABEL_46:

    swift_bridgeObjectRelease();
LABEL_47:
    sub_20A42CFF0(0, &qword_26AC7F8D0);
    id v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v59);

    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_20A8CF540();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_46;
  }
LABEL_5:
  uint64_t v70 = v7;
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v21 = (id)MEMORY[0x210527700](0, v19);
  }
  else
  {
    if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_52;
    }
    id v21 = *(id *)(v19 + 32);
  }
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v22, sel_rootViewController);

  if (!v23)
  {
LABEL_34:

    goto LABEL_47;
  }
  sub_20A42CFF0(0, &qword_26763C950);
  sub_20A8CEB80();
  if (!v72)
  {
    id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v54);

    goto LABEL_61;
  }
  id v68 = v72;
  id v69 = v23;
  id v24 = objc_msgSend(v72, sel_viewControllers);
  unint64_t v19 = sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F920);
  unint64_t v20 = sub_20A8CE5E0();

  if (!(v20 >> 62))
  {
    if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_12;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
LABEL_52:
  swift_bridgeObjectRetain();
  uint64_t v60 = sub_20A8CF540();
  swift_bridgeObjectRelease();
  if (!v60) {
    goto LABEL_53;
  }
LABEL_12:
  if ((v20 & 0xC000000000000001) != 0)
  {
    id v25 = (id)MEMORY[0x210527700](0, v20);
  }
  else
  {
    if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_57;
    }
    id v25 = *(id *)(v20 + 32);
  }
  id v26 = v25;
  swift_bridgeObjectRelease();
  self;
  uint64_t v27 = (void *)swift_dynamicCastObjCClass();
  if (!v27)
  {

LABEL_54:
    sub_20A42CFF0(0, &qword_26763EB78);
    id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v54);

    id v55 = v68;
    goto LABEL_60;
  }
  id v67 = v26;
  id v28 = objc_msgSend(v27, sel_viewControllers);
  unint64_t v19 = sub_20A8CE5E0();

  if (!(v19 >> 62))
  {
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_18;
    }
LABEL_58:
    swift_bridgeObjectRelease();
    goto LABEL_59;
  }
LABEL_57:
  swift_bridgeObjectRetain();
  uint64_t v61 = sub_20A8CF540();
  swift_bridgeObjectRelease();
  if (!v61) {
    goto LABEL_58;
  }
LABEL_18:
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v29 = (id)MEMORY[0x210527700](0, v19);
  }
  else
  {
    if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_64;
    }
    id v29 = *(id *)(v19 + 32);
  }
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  type metadata accessor for TickerCardContainerController();
  uint64_t v31 = swift_dynamicCastClass();
  if (!v31)
  {

LABEL_59:
    type metadata accessor for TickerCardContainerController();
    id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v54);

    id v55 = v67;
    goto LABEL_60;
  }
  uint64_t v32 = v31;
  id v33 = v30;
  unint64_t v34 = (void *)sub_20A8C9D00();
  id v66 = v33;

  self;
  id v35 = (void *)swift_dynamicCastObjCClass();
  if (!v35)
  {
    id v38 = v69;
    goto LABEL_39;
  }
  uint64_t v36 = v32;
  id v37 = objc_msgSend(v35, sel_topViewController);

  unint64_t v34 = v37;
  id v38 = v69;
  if (!v34)
  {
LABEL_40:
    type metadata accessor for StockListViewController();
    id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v54);

LABEL_41:
    id v55 = v66;
LABEL_60:

    goto LABEL_61;
  }
  type metadata accessor for StockListViewController();
  uint64_t v39 = swift_dynamicCastClass();
  if (!v39)
  {
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v65 = v39;
  id v40 = v66;
  uint64_t v41 = sub_20A8CE240();
  id v66 = v34;
  id v42 = (void *)v41;
  objc_msgSend(a1, sel_setObject_forKey_, v36, v41);
  id v64 = v40;

  uint64_t v63 = v36;
  sub_20A8C6370();
  id v43 = v72;
  uint64_t v44 = (void *)sub_20A8CE240();
  objc_msgSend(a1, sel_setObject_forKey_, v43, v44);

  id v45 = v66;
  id v46 = (void *)sub_20A8CE240();
  objc_msgSend(a1, sel_setObject_forKey_, v65, v46);
  id v66 = v45;

  id v47 = v68;
  uint64_t v48 = (void *)sub_20A8CE240();
  objc_msgSend(a1, sel_setObject_forKey_, v47, v48);

  if (!objc_msgSend(v47, sel_isCollapsed))
  {
    sub_20A8C27F0();
    sub_20A8C2720();
    uint64_t v56 = *(void (**)(char *, void *))(v70 + 8);
    v56(v9, v6);
    uint64_t v57 = v56;
    _Block_copy(a3);
    id v58 = a1;
    sub_20A8B4328(v47, (uint64_t)v12, a2, v58, a3);
    _Block_release(a3);

    v57(v12, v6);
    goto LABEL_49;
  }
  a2 = v47;
  id v6 = v64;
  unint64_t v19 = sub_20A8C9D20();

  if (!(v19 >> 62))
  {
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
LABEL_65:
    swift_bridgeObjectRelease();
LABEL_66:
    sub_20A5C83FC();
    id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
    ((void (**)(void, id))a3)[2](a3, v54);

    goto LABEL_41;
  }
LABEL_64:
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_20A8CF540();
  swift_bridgeObjectRelease();
  if (!v62) {
    goto LABEL_65;
  }
LABEL_28:
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v49 = (id)MEMORY[0x210527700](0, v19);
    goto LABEL_31;
  }
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v49 = *(id *)(v19 + 32);
LABEL_31:
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    sub_20A5C83FC();
    if (swift_dynamicCastClass())
    {
      sub_20A8C6370();
      uint64_t v51 = v71;
      type metadata accessor for ForYouFeedViewController();
      sub_20A8CEB80();

      if (v72)
      {
        id v52 = v72;
        uint64_t v53 = (void *)sub_20A8CE240();
        objc_msgSend(a1, sel_setObject_forKey_, v52, v53);

        a3[2](a3, 0);
LABEL_49:
        _Block_release(a3);
        return;
      }
      id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7D158]), sel_initWithMissingClass_, swift_getObjCClassFromMetadata());
      ((void (**)(void, id))a3)[2](a3, v54);

LABEL_61:
      goto LABEL_49;
    }

    goto LABEL_66;
  }
  __break(1u);
}

uint64_t sub_20A8B56C4()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_20A8B56FC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_20A8B5710()
{
  swift_release();

  return swift_deallocObject();
}

void sub_20A8B5750(void *a1)
{
  sub_20A8B35A0(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_20A8B5764(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_20A8B57B0()
{
  uint64_t v1 = *(void *)(sub_20A8C2800() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_20A8B389C(*(void **)(v0 + 24), v0 + v2, *(void (**)(uint64_t))(v0 + v3), *(void (**)(uint64_t))(v0 + v3 + 8));
}

ValueMetadata *type metadata accessor for ForYouFeedServiceContext()
{
  return &type metadata for ForYouFeedServiceContext;
}

uint64_t *sub_20A8B5860(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    uint64_t *v3 = *a2;
    unint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_20A453638();
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(v9 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v8, 1, v10))
    {
      uint64_t v13 = type metadata accessor for ManageWatchlistsContentMode(0);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_20A8C3F00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_20A8B5A04(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_20A453638();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = sub_20A8C3F00();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v4, v7);
  }
  return result;
}

void *sub_20A8B5AD0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  sub_20A453638();
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v7, 1, v9))
  {
    uint64_t v12 = type metadata accessor for ManageWatchlistsContentMode(0);
    memcpy(v6, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_20A8C3F00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v6, v7, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  }
  return a1;
}

void *sub_20A8B5C24(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  sub_20A453638();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v7, 1, v9);
  int v14 = v12(v8, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      uint64_t v18 = sub_20A8C3F00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v7, v8, v18);
      return a1;
    }
    sub_20A8B5DFC((uint64_t)v7);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = type metadata accessor for ManageWatchlistsContentMode(0);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  uint64_t v15 = sub_20A8C3F00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  return a1;
}

uint64_t sub_20A8B5DFC(uint64_t a1)
{
  sub_20A453638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A8B5E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  sub_20A453638();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v7))
  {
    uint64_t v10 = type metadata accessor for ManageWatchlistsContentMode(0);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_20A8C3F00();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v5, v6, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  }
  return a1;
}

void *sub_20A8B5F8C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  sub_20A453638();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v8, 1, v10);
  int v15 = v13(v9, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      uint64_t v19 = sub_20A8C3F00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v8, v9, v19);
      return a1;
    }
    sub_20A8B5DFC((uint64_t)v8);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = type metadata accessor for ManageWatchlistsContentMode(0);
    memcpy(v8, v9, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  uint64_t v16 = sub_20A8C3F00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v8, v9, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
  return a1;
}

uint64_t sub_20A8B614C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8B6160);
}

uint64_t sub_20A8B6160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ManageWatchlistsContentMode(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_20A8B6210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8B6224);
}

uint64_t sub_20A8B6224(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ManageWatchlistsContentMode(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ManageWatchlistsReloadBlueprintModifier()
{
  uint64_t result = qword_26763EB80;
  if (!qword_26763EB80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A8B6318()
{
  uint64_t result = type metadata accessor for ManageWatchlistsContentMode(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20A8B63BC(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v107 = a3;
  uint64_t v108 = a2;
  sub_20A8B73C4(0, &qword_26763BA70, MEMORY[0x263F7D950]);
  uint64_t v105 = *(void *)(v3 - 8);
  uint64_t v106 = v3;
  MEMORY[0x270FA5388](v3);
  char v104 = (char *)&v88 - v4;
  sub_20A8B7298();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v100 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B73C4(0, (unint64_t *)&qword_26763D180, MEMORY[0x263F7E0A8]);
  uint64_t v102 = *(void *)(v7 - 8);
  uint64_t v103 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v101 = (char *)&v88 - v8;
  uint64_t v9 = type metadata accessor for ManageWatchlistsContentMode(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v96 = (uint64_t)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A4D4A5C();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v97 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8B73C4(0, (unint64_t *)&qword_26763AB58, MEMORY[0x263F7D450]);
  uint64_t v118 = v13;
  uint64_t v115 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  int v15 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v88 - v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v114 = (char *)&v88 - v20;
  uint64_t v119 = type metadata accessor for ManageWatchlistsModel();
  MEMORY[0x270FA5388](v119);
  uint64_t v95 = (uint64_t *)((char *)&v88 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  id v24 = (char *)&v88 - v23;
  sub_20A42D680();
  uint64_t v26 = v25;
  uint64_t v109 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v94 = (char *)&v88 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v88 - v29;
  sub_20A8B7484();
  uint64_t v32 = v31;
  uint64_t v112 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  id v117 = (char *)&v88 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  v111 = (char *)&v88 - v35;
  MEMORY[0x270FA5388](v36);
  id v38 = (char *)&v88 - v37;
  uint64_t v39 = sub_20A8B7250(&qword_26763EBB8, (void (*)(uint64_t))sub_20A42D680);
  uint64_t v40 = sub_20A8B7250(&qword_26763EBC0, (void (*)(uint64_t))sub_20A42D680);
  uint64_t v93 = v39;
  uint64_t v92 = v40;
  sub_20A8C5F70();
  uint64_t v41 = v113;
  uint64_t v42 = *(void *)(v113 + 16);
  uint64_t v43 = *(void *)(v42 + 16);
  uint64_t v110 = v38;
  unint64_t v99 = v18;
  unint64_t v98 = v15;
  uint64_t v116 = v26;
  if (v43)
  {
    uint64_t v44 = sub_20A8C40E0();
    uint64_t v45 = *(void *)(v44 - 8);
    uint64_t v46 = v42 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
    uint64_t v47 = type metadata accessor for WatchlistCellViewModel(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(&v24[*(int *)(v47 + 28)], v46, v44);
    uint64_t v48 = type metadata accessor for ManageWatchlistsReloadBlueprintModifier();
    uint64_t v49 = *(int *)(v47 + 32);
    id v38 = v110;
    sub_20A47F8B0(v41 + *(int *)(v48 + 24), (uint64_t)&v24[v49]);
    *(void *)id v24 = sub_20A8C4050();
    *((void *)v24 + 1) = v50;
    *((void *)v24 + 2) = sub_20A8C40A0();
    *((void *)v24 + 3) = v51;
    v24[32] = 1;
    swift_storeEnumTagMultiPayload();
    sub_20A8B7250((unint64_t *)&unk_26763D170, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsModel);
    sub_20A8C8320();
    sub_20A8C5F60();
    (*(void (**)(char *, uint64_t))(v109 + 8))(v30, v116);
    uint64_t v42 = *(void *)(v41 + 16);
    uint64_t v52 = *(void *)(v42 + 16);
  }
  else
  {
    uint64_t v52 = 0;
  }
  uint64_t v53 = sub_20A8C40E0();
  uint64_t v54 = v42
      + ((*(unsigned __int8 *)(*(void *)(v53 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v53 - 8) + 80));
  MEMORY[0x270FA5388](v53 - 8);
  uint64_t v87 = v41;
  swift_bridgeObjectRetain();
  sub_20A44E200((void (*)(char *))sub_20A8B7550, (uint64_t)(&v88 - 4), v54, v52 != 0, (2 * v52) | 1);
  swift_bridgeObjectRelease();
  sub_20A8C5F50();
  swift_bridgeObjectRelease();
  char v120 = 0;
  id v55 = *(void (**)(char *, char *, uint64_t))(v112 + 16);
  uint64_t v113 = v32;
  uint64_t v90 = v55;
  ((void (*)(char *, char *))v55)(v111, v38);
  sub_20A42D7D4();
  uint64_t v56 = sub_20A8B7250((unint64_t *)&unk_26763D170, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsModel);
  uint64_t v57 = v114;
  sub_20A8C8810();
  sub_20A8B7570();
  uint64_t v58 = v115;
  unint64_t v59 = (*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80);
  uint64_t v91 = *(void *)(v115 + 72);
  unint64_t v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_20A8D3DC0;
  uint64_t v89 = *(void (**)(unint64_t, char *, uint64_t))(v58 + 16);
  v89(v60 + v59, v57, v118);
  sub_20A8C5F70();
  uint64_t v61 = v41 + *(int *)(type metadata accessor for ManageWatchlistsReloadBlueprintModifier() + 24);
  uint64_t v62 = v96;
  sub_20A47F8B0(v61, v96);
  sub_20A453638();
  LODWORD(v57) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 48))(v62, 1, v63);
  uint64_t v64 = sub_20A8C3F00();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = 1;
  BOOL v67 = v57 == 1;
  uint64_t v68 = (uint64_t)v97;
  if (!v67)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v64 - 8) + 32))(v97, v62, v64);
    uint64_t v66 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))(v68, v66, 1, v64);
  sub_20A61B764(v68, v95);
  swift_storeEnumTagMultiPayload();
  id v69 = v94;
  sub_20A8C8320();
  uint64_t v70 = v113;
  os_log_type_t v71 = v117;
  sub_20A8C5F60();
  (*(void (**)(char *, uint64_t))(v109 + 8))(v69, v116);
  char v120 = 1;
  v90(v111, v71, v70);
  id v72 = v99;
  sub_20A8C8810();
  id v73 = v98;
  v89((unint64_t)v98, v72, v118);
  unint64_t v75 = *(void *)(v60 + 16);
  unint64_t v74 = *(void *)(v60 + 24);
  if (v75 >= v74 >> 1) {
    unint64_t v60 = sub_20A46E6E8(v74 > 1, v75 + 1, 1, v60);
  }
  *(void *)(v60 + 16) = v75 + 1;
  unint64_t v76 = v60 + v59 + v75 * v91;
  uint64_t v77 = v115;
  uint64_t v78 = v118;
  (*(void (**)(unint64_t, char *, uint64_t))(v115 + 32))(v76, v73, v118);
  uint64_t v79 = sub_20A8B7364(&qword_26763EBA0);
  uint64_t v80 = sub_20A8B7364(&qword_26763EBA8);
  MEMORY[0x21051E250](v60, v78, v79, v80);
  uint64_t v81 = v101;
  sub_20A8CBB20();
  uint64_t v87 = v56;
  uint64_t v82 = v104;
  sub_20A8C9B40();
  v108(v82);
  (*(void (**)(char *, uint64_t))(v105 + 8))(v82, v106);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v81, v103);
  uint64_t v83 = *(void (**)(char *, uint64_t))(v77 + 8);
  v83(v72, v78);
  uint64_t v84 = v113;
  id v85 = *(void (**)(char *, uint64_t))(v112 + 8);
  v85(v117, v113);
  v83(v114, v78);
  return ((uint64_t (*)(char *, uint64_t))v85)(v110, v84);
}

uint64_t sub_20A8B704C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ManageWatchlistsModel();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for WatchlistCellViewModel(0);
  uint64_t v8 = &v6[*(int *)(v7 + 28)];
  uint64_t v9 = sub_20A8C40E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a1, v9);
  uint64_t v10 = type metadata accessor for ManageWatchlistsReloadBlueprintModifier();
  sub_20A47F8B0(a2 + *(int *)(v10 + 24), (uint64_t)&v6[*(int *)(v7 + 32)]);
  *(void *)uint64_t v6 = sub_20A8C4050();
  *((void *)v6 + 1) = v11;
  *((void *)v6 + 2) = sub_20A8C40A0();
  *((void *)v6 + 3) = v12;
  v6[32] = 0;
  swift_storeEnumTagMultiPayload();
  sub_20A8B7250((unint64_t *)&unk_26763D170, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsModel);
  return sub_20A8C8320();
}

uint64_t sub_20A8B71C0()
{
  return sub_20A8B7250(&qword_26763EB90, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsReloadBlueprintModifier);
}

uint64_t sub_20A8B7208()
{
  return sub_20A8B7250((unint64_t *)&unk_26763D170, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsModel);
}

uint64_t sub_20A8B7250(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_20A8B7298()
{
  if (!qword_26763EB98)
  {
    sub_20A8B73C4(255, (unint64_t *)&qword_26763AB58, MEMORY[0x263F7D450]);
    sub_20A8B7364(&qword_26763EBA0);
    sub_20A8B7364(&qword_26763EBA8);
    unint64_t v0 = sub_20A8C5F80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26763EB98);
    }
  }
}

uint64_t sub_20A8B7364(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20A8B73C4(255, (unint64_t *)&qword_26763AB58, MEMORY[0x263F7D450]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_20A8B73C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void *))
{
  if (!*a2)
  {
    v8[0] = &type metadata for ManageWatchlistsSectionDescriptor;
    v8[1] = type metadata accessor for ManageWatchlistsModel();
    v8[2] = sub_20A42D7D4();
    v8[3] = sub_20A8B7250((unint64_t *)&unk_26763D170, (void (*)(uint64_t))type metadata accessor for ManageWatchlistsModel);
    unint64_t v6 = a3(a1, v8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_20A8B7484()
{
  if (!qword_26763EBB0)
  {
    sub_20A42D680();
    sub_20A8B7250(&qword_26763EBB8, (void (*)(uint64_t))sub_20A42D680);
    sub_20A8B7250(&qword_26763EBC0, (void (*)(uint64_t))sub_20A42D680);
    unint64_t v0 = sub_20A8C5F80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26763EBB0);
    }
  }
}

uint64_t sub_20A8B7550(uint64_t a1)
{
  return sub_20A8B704C(a1, *(void *)(v1 + 16));
}

void sub_20A8B7570()
{
  if (!qword_26763AE38)
  {
    sub_20A8B73C4(255, (unint64_t *)&qword_26763AB58, MEMORY[0x263F7D450]);
    unint64_t v0 = sub_20A8CF730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26763AE38);
    }
  }
}

id static NSBundle.stocksUI.getter()
{
  _s6MarkerCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  return v1;
}

uint64_t _s6MarkerCMa()
{
  return self;
}

uint64_t Headline.dragItem.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  sub_20A4845D0(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_20A8C2530();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = sub_20A8C4020();
  uint64_t v16 = *(void *)(v15 - 8);
  double v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (void **)((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void **, uint64_t, uint64_t, double))(v16 + 16))(v19, v1, v15, v17);
  int v20 = (*(uint64_t (**)(void **, uint64_t))(v16 + 88))(v19, v15);
  if (v20 == *MEMORY[0x263F7AF48])
  {
    (*(void (**)(void **, uint64_t))(v16 + 96))(v19, v15);
    uint64_t v21 = *v19;
    sub_20A45494C();
    uint64_t v23 = (char *)v19 + *(int *)(v22 + 48);
    swift_getObjectType();
    sub_20A8CECA0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      swift_unknownObjectRelease();
      sub_20A596854((uint64_t)v7);
      uint64_t v24 = sub_20A8CB860();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v38, 1, 1, v24);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
      sub_20A8C24D0();
      id v28 = objc_msgSend(v21, sel_title);
      if (v28)
      {
        uint64_t v29 = v28;
        sub_20A8CE280();
      }
      uint64_t v32 = v38;
      sub_20A8CB850();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      uint64_t v33 = sub_20A8CB860();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
    }
    uint64_t v34 = sub_20A8C33A0();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v34 - 8) + 8))(v23, v34);
  }
  else if (v20 == *MEMORY[0x263F7AF38])
  {
    (*(void (**)(void **, uint64_t))(v16 + 96))(v19, v15);
    uint64_t v25 = *v19;
    swift_getObjectType();
    sub_20A8CECA0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8) == 1)
    {
      swift_unknownObjectRelease();
      sub_20A596854((uint64_t)v4);
      uint64_t v26 = sub_20A8CB860();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v38, 1, 1, v26);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v4, v8);
      sub_20A8C24D0();
      id v30 = objc_msgSend(v25, sel_title);
      if (v30)
      {
        uint64_t v31 = v30;
        sub_20A8CE280();
      }
      uint64_t v35 = v38;
      sub_20A8CB850();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      uint64_t v36 = sub_20A8CB860();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
    }
  }
  else
  {
    uint64_t result = sub_20A8CF750();
    __break(1u);
  }
  return result;
}

BOOL static RouteOption.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RouteOption.hash(into:)()
{
  return sub_20A8CF890();
}

uint64_t RouteOption.hashValue.getter()
{
  return sub_20A8CF8C0();
}

unint64_t sub_20A8B7C68()
{
  unint64_t result = qword_26763EBC8;
  if (!qword_26763EBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763EBC8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RouteOption(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x20A8B7D88);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RouteOption()
{
  return &type metadata for RouteOption;
}

uint64_t sub_20A8B7DC0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v92 = a3;
  uint64_t v111 = a1;
  uint64_t v106 = sub_20A8C6610();
  uint64_t v100 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v5 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = (void (*)(void))sub_20A8C2990();
  uint64_t v6 = *((void *)v109 - 1);
  MEMORY[0x270FA5388](v109);
  char v104 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C7FB0();
  uint64_t v113 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v97 = (uint64_t *)((char *)&v92 - v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (unsigned __int8 *)&v92 - v14;
  uint64_t v16 = sub_20A8C3190();
  uint64_t v99 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v98 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v103 = (char *)&v92 - v19;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_20A43F7E0(0, (unint64_t *)&unk_26AC68E90);
  uint64_t result = sub_20A8C5BB0();
  if (!v120)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_20A42BEBC(&v119, (uint64_t)&v121);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_20A43F7E0(0, &qword_26AC67650);
  uint64_t result = sub_20A8C5BB0();
  if (!v118)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v95 = v5;
  uint64_t v96 = v10;
  uint64_t v108 = v6;
  uint64_t v94 = v16;
  sub_20A42BEBC(&v117, (uint64_t)&v119);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_20A43F7E0(0, (unint64_t *)&unk_26AC68EB0);
  uint64_t result = sub_20A8C5BB0();
  if (!v116)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_20A42BEBC(&v115, (uint64_t)&v117);
  __swift_project_boxed_opaque_existential_1(&v119, v120);
  sub_20A8C3AC0();
  __swift_project_boxed_opaque_existential_1(&v121, v122);
  *uint64_t v15 = sub_20A8C3800() & 1;
  LODWORD(v107) = *MEMORY[0x263F7D218];
  uint64_t v21 = v113;
  uint64_t v23 = v113 + 104;
  uint64_t v22 = *(void (**)(unsigned __int8 *))(v113 + 104);
  v22(v15);
  uint64_t v105 = v23;
  uint64_t v112 = v22;
  sub_20A8C8730();
  uint64_t v24 = *(void (**)(unsigned __int8 *, uint64_t))(v21 + 8);
  v24(v15, v8);
  uint64_t v113 = v21 + 8;
  __swift_project_boxed_opaque_existential_1(&v121, v122);
  *uint64_t v15 = sub_20A8C3810() & 1;
  uint64_t v25 = v107;
  ((void (*)(unsigned __int8 *, void, uint64_t))v22)(v15, v107, v8);
  sub_20A8C8730();
  uint64_t v110 = v24;
  v24(v15, v8);
  uint64_t v26 = self;
  uint64_t v93 = v26;
  id v27 = objc_msgSend(v26, sel_sharedAccount, v92);
  unsigned __int8 v28 = objc_msgSend(v27, sel_isPrivateDataSyncingEnabled);

  *uint64_t v15 = v28;
  uint64_t v29 = (void (*)(unsigned __int8 *, uint64_t, uint64_t))v112;
  ((void (*)(unsigned __int8 *, uint64_t, uint64_t))v112)(v15, v25, v8);
  sub_20A8C8730();
  v24(v15, v8);
  id v30 = objc_msgSend(v26, sel_sharedAccount);
  unsigned __int8 v31 = objc_msgSend(v30, sel_isUserSignedInToiCloud);

  *uint64_t v15 = v31;
  v29(v15, v25, v8);
  uint64_t v32 = v29;
  sub_20A8C8730();
  uint64_t v33 = v110;
  v110(v15, v8);
  uint64_t v34 = v104;
  sub_20A8C2940();
  uint64_t v35 = sub_20A8C28D0();
  uint64_t v37 = v36;
  uint64_t v102 = *(void (**)(char *, void (*)(void)))(v108 + 8);
  v108 += 8;
  v102(v34, v109);
  *(void *)uint64_t v15 = v35;
  *((void *)v15 + 1) = v37;
  uint64_t v114 = v8;
  uint64_t v38 = *MEMORY[0x263F7D228];
  v32(v15, v38, v114);
  sub_20A8C8730();
  v33(v15, v114);
  *(void *)uint64_t v15 = sub_20A8CC4A0();
  *((void *)v15 + 1) = v39;
  v32(v15, v38, v114);
  sub_20A8C8730();
  v33(v15, v114);
  uint64_t v40 = v95;
  sub_20A8CDB10();
  uint64_t v41 = sub_20A8C6600();
  uint64_t v43 = v42;
  (*(void (**)(char *, uint64_t))(v100 + 8))(v40, v106);
  *(void *)uint64_t v15 = v41;
  *((void *)v15 + 1) = v43;
  v32(v15, v38, v114);
  sub_20A8C8730();
  uint64_t v44 = v110;
  v110(v15, v114);
  sub_20A8C2940();
  uint64_t v45 = sub_20A8C2890();
  uint64_t v47 = v46;
  uint64_t v48 = v102;
  v102(v34, v109);
  *(void *)uint64_t v15 = v45;
  *((void *)v15 + 1) = v47;
  LODWORD(v106) = v38;
  uint64_t v49 = v38;
  uint64_t v50 = v114;
  ((void (*)(unsigned __int8 *, uint64_t, uint64_t))v112)(v15, v49, v114);
  sub_20A8C8730();
  v44(v15, v50);
  sub_20A8C2940();
  LOBYTE(v45) = sub_20A8C2840();
  v48(v34, v109);
  *uint64_t v15 = v45 & 1;
  ((void (*)(unsigned __int8 *, void, uint64_t))v112)(v15, v107, v50);
  uint64_t v51 = v93;
  sub_20A8C8730();
  v44(v15, v50);
  id v52 = objc_msgSend(v51, sel_sharedAccount);
  id v53 = objc_msgSend(v52, sel_userStoreFrontID);

  if (v53)
  {
    uint64_t v54 = sub_20A8CE280();
    uint64_t v56 = v55;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v56 = 0;
  }
  uint64_t v57 = v97;
  uint64_t v58 = sub_20A8B8DEC(v54, v56);
  uint64_t v60 = v59;
  swift_bridgeObjectRelease();
  *uint64_t v57 = v58;
  v57[1] = v60;
  ((void (*)(uint64_t *, void, uint64_t))v112)(v57, v106, v50);
  sub_20A8C8730();
  v110((unsigned __int8 *)v57, v50);
  id v61 = objc_msgSend(v51, (SEL)&selRef_collectionViewLayout + 2);
  id v62 = objc_msgSend(v61, sel_contentStoreFrontID);

  if (v62)
  {
    uint64_t v63 = sub_20A8CE280();
    uint64_t v65 = v64;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v65 = 0;
  }
  uint64_t v66 = sub_20A8B8DEC(v63, v65);
  uint64_t v68 = v67;
  swift_bridgeObjectRelease();
  id v69 = v96;
  uint64_t *v96 = v66;
  v69[1] = v68;
  uint64_t v70 = v114;
  os_log_type_t v71 = v112;
  ((void (*)(uint64_t *, void, uint64_t))v112)(v69, v106, v114);
  sub_20A8C8730();
  id v72 = v110;
  v110((unsigned __int8 *)v69, v70);
  id v73 = v104;
  sub_20A8C2940();
  char v74 = sub_20A8C2850();
  v102(v73, v109);
  *uint64_t v15 = v74 & 1;
  ((void (*)(unsigned __int8 *, void, uint64_t))v71)(v15, v107, v70);
  sub_20A8C8730();
  v72(v15, v70);
  __swift_project_boxed_opaque_existential_1(&v117, v118);
  *(void *)uint64_t v15 = sub_20A8C3990();
  *((void *)v15 + 1) = v75;
  ((void (*)(unsigned __int8 *, void, uint64_t))v71)(v15, v106, v70);
  sub_20A8C8730();
  v72(v15, v70);
  if (objc_msgSend(self, sel_canSendMail))
  {
    __swift_project_boxed_opaque_existential_1(&v117, v118);
    uint64_t v108 = sub_20A8C3990();
    uint64_t v107 = v76;
    uint64_t v106 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v77 = v99;
    uint64_t v109 = *(void (**)(void))(v99 + 16);
    uint64_t v78 = v98;
    uint64_t v79 = v103;
    uint64_t v80 = v94;
    v109(v98);
    unint64_t v81 = (*(unsigned __int8 *)(v77 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
    unint64_t v82 = (v101 + v81 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v83 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v77 + 32))(v83 + v81, v78, v80);
    uint64_t v84 = (uint64_t *)(v83 + v82);
    uint64_t v85 = v107;
    *uint64_t v84 = v108;
    v84[1] = v85;
    *(void *)(v83 + ((v82 + 23) & 0xFFFFFFFFFFFFFFF8)) = v106;
    *(void *)uint64_t v15 = sub_20A8B97D0;
    *((void *)v15 + 1) = v83;
    uint64_t v86 = v77;
    uint64_t v87 = *MEMORY[0x263F7D220];
    uint64_t v88 = v114;
    ((void (*)(unsigned __int8 *, uint64_t, uint64_t))v112)(v15, v87, v114);
    sub_20A8C8730();
    v110(v15, v88);
    ((void (*)(char *, char *, uint64_t))v109)(v78, v79, v80);
  }
  else
  {
    uint64_t v86 = v99;
    uint64_t v87 = *MEMORY[0x263F7D220];
    uint64_t v80 = v94;
    uint64_t v78 = v98;
    uint64_t v79 = v103;
    (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v98, v103, v94);
  }
  unint64_t v89 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  uint64_t v90 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v90 + v89, v78, v80);
  *(void *)uint64_t v15 = sub_20A8B9678;
  *((void *)v15 + 1) = v90;
  uint64_t v91 = v114;
  ((void (*)(unsigned __int8 *, uint64_t, uint64_t))v112)(v15, v87, v114);
  sub_20A8C8730();
  v110(v15, v91);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v79, v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v117);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v121);
}

uint64_t sub_20A8B8DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8CE280();
  if (a2)
  {
    if (v4 == a1 && v5 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v7 = sub_20A8CF760();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        if (sub_20A8CE280() == a1 && v8 == a2)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v10 = sub_20A8CF760();
          swift_bridgeObjectRelease();
          if ((v10 & 1) == 0)
          {
            if (sub_20A8CE280() == a1 && v11 == a2)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v13 = sub_20A8CF760();
              swift_bridgeObjectRelease();
              if ((v13 & 1) == 0)
              {
                if (sub_20A8CE280() == a1 && v14 == a2)
                {
                  swift_bridgeObjectRelease();
                  return 19285;
                }
                char v15 = sub_20A8CF760();
                swift_bridgeObjectRelease();
                if (v15) {
                  return 19285;
                }
                goto LABEL_21;
              }
            }
            return 16707;
          }
        }
        return 21825;
      }
    }
    return 21333;
  }
  swift_bridgeObjectRelease();
  sub_20A8CE280();
  swift_bridgeObjectRelease();
  sub_20A8CE280();
  swift_bridgeObjectRelease();
  sub_20A8CE280();
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20A8B8FF4(uint64_t a1)
{
  uint64_t v2 = sub_20A8CB8A0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_20A8C3190();
  v7[3] = v3;
  v7[4] = sub_20A8B986C();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_1, a1, v3);
  sub_20A8CB8B0();
  id v5 = objc_allocWithZone((Class)sub_20A8C9A20());
  return sub_20A8C9A10();
}

id sub_20A8B90E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_20A8CE2D0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_20A8C2080();
  MEMORY[0x270FA5388](v6 - 8);
  sub_20A8C20C0();
  swift_allocObject();
  sub_20A8C20B0();
  sub_20A8C2070();
  sub_20A8C2090();
  sub_20A8C3190();
  sub_20A8B986C();
  uint64_t v7 = sub_20A8C20A0();
  unint64_t v9 = v8;
  sub_20A8CE2C0();
  sub_20A8CE2A0();
  sub_20A531704(v7, v9);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F12578]), sel_init);
  strcpy((char *)v15, "[App Config ");
  BYTE5(v15[1]) = 0;
  HIWORD(v15[1]) = -5120;
  sub_20A8CE3D0();
  sub_20A8CE3D0();
  uint64_t v11 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setSubject_, v11, v15[0], v15[1]);

  uint64_t v12 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setMessageBody_isHTML_, v12, 0);

  swift_beginAccess();
  char v13 = (void *)MEMORY[0x2105289B0](a4 + 16);
  objc_msgSend(v10, sel_setMailComposeDelegate_, v13);

  swift_release();
  return v10;
}

uint64_t type metadata accessor for DebugAssembly()
{
  return self;
}

uint64_t sub_20A8B9400()
{
  uint64_t v1 = sub_20A8C5C10();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_20A8C5CE0();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_20A8C8740();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F7CDE0], v1);
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = v5;
  sub_20A8C62F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_20A8B95A8()
{
  return swift_deallocObject();
}

uint64_t sub_20A8B95E0(uint64_t a1, void *a2)
{
  return sub_20A8B7DC0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_20A8B95E8()
{
  uint64_t v1 = sub_20A8C3190();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_20A8B9678()
{
  uint64_t v1 = *(void *)(sub_20A8C3190() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_20A8B8FF4(v2);
}

uint64_t sub_20A8B96D8()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_20A8B9710()
{
  uint64_t v1 = sub_20A8C3190();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

id sub_20A8B97D0()
{
  uint64_t v1 = *(void *)(sub_20A8C3190() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + v3 + 8);
  uint64_t v6 = *(void *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8));

  return sub_20A8B90E0(v0 + v2, v4, v5, v6);
}

unint64_t sub_20A8B986C()
{
  unint64_t result = qword_26763EC40;
  if (!qword_26763EC40)
  {
    sub_20A8C3190();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26763EC40);
  }
  return result;
}

uint64_t sub_20A8B98C4()
{
  sub_20A4E8B40(0, (unint64_t *)&qword_26AC6AB40, MEMORY[0x263F7E060]);
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v6 - v3;
  sub_20A4E8B40(0, (unint64_t *)&unk_26AC6AB78, MEMORY[0x263F7E068]);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F7E058], v1);
  uint64_t result = sub_20A8CB5C0();
  qword_26AC9E9D0 = result;
  return result;
}

id sub_20A8B99F4(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_20A49A408(0, &qword_26AC6AAE0, MEMORY[0x263F7E040]);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v15 = (id *)((char *)&v24.receiver - v14);
  uint64_t v16 = OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onTap;
  sub_20A49A408(0, (unint64_t *)&qword_26AC6AAE8, MEMORY[0x263F7E048]);
  id v18 = objc_allocWithZone(v17);
  uint64_t v19 = v5;
  *(void *)&v5[v16] = objc_msgSend(v18, sel_init);
  int v20 = &v19[OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest];
  *(void *)int v20 = 0;
  *((void *)v20 + 1) = 0;

  v24.receiver = v19;
  v24.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v24, sel_initWithFrame_, a1, a2, a3, a4);
  *char v15 = 1;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F7E038], v12);
  id v22 = v21;

  (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  return v22;
}

char *sub_20A8B9CE0(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v9 = *(uint64_t (**)(uint64_t, double, double))&v4[OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest];
  if (!v9) {
    goto LABEL_4;
  }
  swift_retain();
  if (objc_msgSend(v4, sel_isHidden))
  {
    sub_20A459CA4((uint64_t)v9);
LABEL_4:
    v13.receiver = v4;
    v13.super_class = ObjectType;
    return (char *)objc_msgSendSuper2(&v13, sel_hitTest_withEvent_, a1, a2, a3);
  }
  char v11 = v9(a1, a2, a3);
  sub_20A459CA4((uint64_t)v9);
  if ((v11 & 1) == 0) {
    return 0;
  }
  uint64_t v12 = v4;
  return v4;
}

uint64_t type metadata accessor for StockFeedViewOverlayView()
{
  return self;
}

uint64_t sub_20A8B9ED4(uint64_t a1, uint64_t a2)
{
  return sub_20A8B9F2C(18.0, a1, a2, MEMORY[0x263F835D0], MEMORY[0x263F81800], MEMORY[0x263F7E140]);
}

uint64_t sub_20A8B9F00(uint64_t a1, uint64_t a2)
{
  return sub_20A8B9F2C(13.0, a1, a2, MEMORY[0x263F835D0], MEMORY[0x263F81828], MEMORY[0x263F7E140]);
}

uint64_t sub_20A8B9F2C(double a1, uint64_t a2, uint64_t a3, void *a4, double *a5, uint64_t (*a6)(void, void, double, double, double))
{
  return a6(*a4, 0, a1, 1.79769313e308, *a5);
}

uint64_t sub_20A8B9FA8(uint64_t a1, uint64_t a2)
{
  return sub_20A8B9F2C(17.0, a1, a2, MEMORY[0x263F83588], MEMORY[0x263F81840], MEMORY[0x263F7E148]);
}

uint64_t sub_20A8B9FD4(uint64_t a1, uint64_t a2)
{
  return sub_20A8B9F2C(13.0, a1, a2, MEMORY[0x263F83628], MEMORY[0x263F81828], MEMORY[0x263F7E140]);
}

id sub_20A8BA000()
{
  sub_20A45F33C();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_20A8D5C90;
  uint64_t v2 = v0 + 7;
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  *(void *)(v1 + 32) = (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 16) + 96))(v4);
  *(void *)(v1 + 40) = objc_msgSend(self, sel_clearColor);
  sub_20A8CE620();
  sub_20A42CFF0(0, (unint64_t *)&qword_26AC7FBB0);
  uint64_t v5 = (void *)sub_20A8CE5D0();
  swift_bridgeObjectRelease();
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_configurationWithPaletteColors_, v5);

  id v8 = objc_msgSend(v6, sel_configurationWithPointSize_, 28.0);
  id v9 = objc_msgSend(v7, sel_configurationByApplyingConfiguration_, v8);

  id v10 = v9;
  char v11 = (void *)sub_20A8CE240();
  id v12 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v11, v10);

  return v12;
}

uint64_t sub_20A8BA1C4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + 7;
  uint64_t v6 = v1[10];
  uint64_t v5 = v1[11];
  __swift_project_boxed_opaque_existential_1(v4, v6);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)(v5 + 16) + 32))(&v31, v6);
  int v7 = v31;
  uint64_t v8 = v2[10];
  uint64_t v9 = v2[11];
  __swift_project_boxed_opaque_existential_1(v4, v8);
  (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(v9 + 72))((char *)v28 + 1, v8, v9);
  uint64_t v10 = v29;
  uint64_t v11 = v30;
  __swift_project_boxed_opaque_existential_1((void *)((char *)v28 + 1), v29);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v11 + 24))(v28, v10, v11);
  if (v7 == 1)
  {
    if (a1)
    {
      id v12 = objc_msgSend(a1, sel_standardAppearance);
      if (v12)
      {
        uint64_t v14 = v2[10];
        uint64_t v13 = v2[11];
        __swift_project_boxed_opaque_existential_1(v4, v14);
        uint64_t v15 = *(void *)(v13 + 16);
        uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 56);
        id v17 = v12;
        id v18 = (void *)v16(v14, v15);
        objc_msgSend(v17, sel_setBackgroundColor_, v18);

        objc_msgSend(v17, sel_setBackgroundEffect_, 0);
        uint64_t v19 = self;
        id v20 = v17;
        id v21 = objc_msgSend(v19, sel_clearColor);
        objc_msgSend(v20, sel_setShadowColor_, v21);

        id v22 = objc_allocWithZone(MEMORY[0x263F827E8]);
        id v12 = v20;
        id v23 = objc_msgSend(v22, sel_init);
        objc_msgSend(v12, sel_setShadowImage_, v23);
      }
    }
    else
    {
      id v12 = 0;
    }
    objc_msgSend(a1, sel_setScrollEdgeAppearance_, v12);
    goto LABEL_9;
  }
  if (a1)
  {
    uint64_t v25 = v2[10];
    uint64_t v24 = v2[11];
    __swift_project_boxed_opaque_existential_1(v4, v25);
    uint64_t v26 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(v24 + 16) + 56))(v25);
    objc_msgSend(a1, sel_setBarTintColor_, v26);

    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
    objc_msgSend(a1, sel_setShadowImage_, v12);
LABEL_9:
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28 + 1);
}

void sub_20A8BA484(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = v4 + 7;
  uint64_t v12 = v4[10];
  uint64_t v11 = v4[11];
  __swift_project_boxed_opaque_existential_1(v10, v12);
  (*(void (**)(char *__return_ptr, uint64_t))(*(void *)(v11 + 16) + 32))((char *)&v29 + 1, v12);
  if ((v29 & 0x100) == 0 && a1) {
    objc_msgSend(a1, sel_ts_setTranslucentNavigationBarBackgroundEnabled_, 1);
  }
  if (a2)
  {
    id v13 = a2;
    objc_msgSend(v13, sel_ts_clearBackdropStyle);
    uint64_t v14 = v5[10];
    uint64_t v15 = v5[11];
    __swift_project_boxed_opaque_existential_1(v10, v14);
    (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v15 + 88))(v13, a4, v14, v15);
    uint64_t v17 = v5[10];
    uint64_t v16 = v5[11];
    __swift_project_boxed_opaque_existential_1(v10, v17);
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)(v16 + 16) + 32))(&v29, v17);
    LOBYTE(v14) = v29;
    id v18 = objc_msgSend(v13, sel_searchTextField);
    id v19 = v18;
    if (v14)
    {
      objc_msgSend(v18, sel_setBorderStyle_, 3);

      id v19 = objc_msgSend(v13, sel_searchTextField);
    }
    uint64_t v21 = v5[10];
    uint64_t v20 = v5[11];
    __swift_project_boxed_opaque_existential_1(v10, v21);
    id v22 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(v20 + 16) + 40))(v21);
    objc_msgSend(v19, sel_setTextColor_, v22);
  }
  if ((_UIBarsApplyChromelessEverywhere() & 1) == 0 && a3)
  {
    id v23 = objc_msgSend(a3, sel_view);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v26 = v5[10];
      uint64_t v25 = v5[11];
      __swift_project_boxed_opaque_existential_1(v10, v26);
      id v27 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(v25 + 16) + 56))(v26);
      id v28 = objc_msgSend(v27, sel_colorWithAlphaComponent_, 0.8);

      objc_msgSend(v24, sel_setBackgroundColor_, v28);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for StockListStyler()
{
  return self;
}

uint64_t sub_20A8BA74C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  int v7 = (void *)*v3;
  sub_20A4342F4((uint64_t)(v7 + 2), (uint64_t)v21);
  uint64_t v8 = v7[10];
  uint64_t v9 = v7[11];
  __swift_project_boxed_opaque_existential_1(v7 + 7, v8);
  uint64_t v10 = *(void *)(v9 + 8);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 8);
  void v20[3] = v8;
  v20[4] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  uint64_t v13 = v11(a1, v8, v10);
  double v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t *, uint64_t, double))(v17 + 16))(v16, boxed_opaque_existential_1, v8, v14);
  uint64_t v18 = sub_20A4486E8(v21, (uint64_t)v16, a2, v8, v9);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  *a3 = v18;
  return result;
}

uint64_t sub_20A8BA8A8()
{
  uint64_t v1 = (void *)(*(void *)v0 + 56);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + 16) + 16) + 8))(v2);
}

uint64_t sub_20A8BA8FC(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v1 + 16), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(a1, v3, v4);
}

uint64_t sub_20A8BA95C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 40);
  uint64_t v6 = *(void *)(*(void *)v2 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v2 + 16), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5, v6);
}

uint64_t sub_20A8BA9CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*(void *)v3 + 40);
  uint64_t v8 = *(void *)(*(void *)v3 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v3 + 16), v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, a2, a3, v7, v8);
}

uint64_t sub_20A8BAA44(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *(void *)a1 = *a2;
    a1 = v25 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    long long v8 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v8;
    uint64_t v9 = v8;
    uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
    swift_bridgeObjectRetain();
    v10(a1 + 16, (uint64_t)(a2 + 2), v9);
    long long v11 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 80) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, (uint64_t)(a2 + 7));
    long long v12 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)(a1 + 120) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 96, (uint64_t)(a2 + 12));
    uint64_t v13 = a3[8];
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_20A8C3410();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[10];
    *(void *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = sub_20A8C34C0();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_retain();
    v21(v18, v19, v20);
    uint64_t v22 = a3[11];
    uint64_t v23 = a1 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    *(unsigned char *)(v23 + 16) = *(unsigned char *)(v24 + 16);
  }
  return a1;
}

uint64_t sub_20A8BAC94(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  uint64_t v7 = sub_20A8C34C0();
  long long v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t sub_20A8BAD78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 16;
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  v10(a1 + 16, v7, v9);
  long long v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  long long v12 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 96, a2 + 96);
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_20A8C34C0();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
  swift_retain();
  v21(v18, v19, v20);
  uint64_t v22 = a3[11];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *(unsigned char *)(v23 + 16) = *(unsigned char *)(v24 + 16);
  return a1;
}

uint64_t *sub_20A8BAF78(uint64_t *a1, uint64_t *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A8C3410();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[10];
  long long v11 = (char *)a1 + v10;
  long long v12 = (char *)a2 + v10;
  uint64_t v13 = sub_20A8C34C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[11];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  v15[16] = v16[16];
  return a1;
}

uint64_t sub_20A8BB0C8(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 112);
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  uint64_t v11 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_20A8C34C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(unsigned char *)(v17 + 16) = *(unsigned char *)(v18 + 16);
  return a1;
}

uint64_t sub_20A8BB1F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_release();
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_20A8C34C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = a3[11];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(unsigned char *)(v18 + 16) = *(unsigned char *)(v19 + 16);
  return a1;
}

uint64_t sub_20A8BB35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8BB370);
}

uint64_t sub_20A8BB370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_20A8C3410();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 32);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_20A8C34C0();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_20A8BB49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8BB4B0);
}

uint64_t sub_20A8BB4B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_20A8C3410();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 32);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_20A8C34C0();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for TickerWatchlistChangeBlueprintModifier()
{
  uint64_t result = qword_26AC7DD28;
  if (!qword_26AC7DD28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20A8BB628()
{
  uint64_t result = sub_20A8C3410();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A8C34C0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void sub_20A8BB71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v29 = a1;
  sub_20A8BE904(0, (unint64_t *)&qword_26AC6AC90, MEMORY[0x263F7E0A8]);
  uint64_t v27 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v28 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v26 = (char *)v23 - v6;
  uint64_t v7 = type metadata accessor for TickerWatchlistChangeBlueprintModifier();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v32 = v3;
  sub_20A5AF7BC(0, &qword_26AC7F6D0, MEMORY[0x263F7AF08], MEMORY[0x263F8D488]);
  sub_20A8C6670();
  sub_20A8BEA8C(v3, (uint64_t)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t v24 = type metadata accessor for TickerWatchlistChangeBlueprintModifier;
  sub_20A8BEA24((uint64_t)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + ((v10 + 16) & ~v10), (uint64_t (*)(void))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
  uint64_t v12 = (void *)sub_20A8C6450();
  uint64_t v25 = sub_20A8C64F0();
  swift_release();
  swift_release();

  sub_20A8BEA8C(v23[1], (uint64_t)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
  uint64_t v13 = v26;
  uint64_t v14 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v26, v29, v27);
  uint64_t v15 = (v10 + 32) & ~v10;
  unint64_t v16 = (v15 + v9 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  *(void *)(v17 + 16) = v30;
  *(void *)(v17 + 24) = v18;
  sub_20A8BEA24((uint64_t)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v15, (uint64_t (*)(void))v24);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, v13, v14);
  swift_retain();
  uint64_t v20 = (void *)sub_20A8C6450();
  sub_20A8C6500();
  swift_release();
  swift_release();

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  *(void *)(v21 + 24) = v18;
  swift_retain();
  uint64_t v22 = (void *)sub_20A8C6450();
  sub_20A8C6550();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_20A8BBAE0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TickerWatchlistChangeBlueprintModifier();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = *a1;
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 16), *(void *)(a2 + 40));
  sub_20A8C39E0();
  sub_20A8BEA8C(a2, (uint64_t)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_20A8BEA24((uint64_t)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(void))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
  *(void *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_20A8C6450();
  uint64_t v11 = sub_20A8C6500();
  swift_release();
  swift_release();

  return v11;
}

uint64_t sub_20A8BBC8C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 96), *(void *)(a1 + 120));
  type metadata accessor for TickerWatchlistChangeBlueprintModifier();
  uint64_t v3 = sub_20A8C3B10();
  uint64_t v4 = sub_20A8C2EE0();
  uint64_t result = sub_20A8C2EC0();
  *a2 = v3;
  a2[1] = v4;
  a2[2] = result;
  return result;
}

uint64_t sub_20A8BBD30(void *a1, void (*a2)(char *), uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v191 = a5;
  uint64_t v233 = a4;
  v192 = a2;
  uint64_t v7 = sub_20A8C8B80();
  uint64_t v190 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v189 = (char *)&v181 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8BE904(0, &qword_26AC6A418, MEMORY[0x263F7D950]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v181 - v12;
  sub_20A8BE904(0, (unint64_t *)&qword_26AC6AC90, MEMORY[0x263F7E0A8]);
  uint64_t v188 = v14;
  uint64_t v187 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v186 = (char *)&v181 - v15;
  uint64_t v228 = type metadata accessor for TickerModel();
  MEMORY[0x270FA5388](v228);
  v225 = (uint64_t *)((char *)&v181 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_20A8C4030();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v224 = (char *)&v181 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for PriceViewModel();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v223 = (uint64_t)&v181 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v237 = sub_20A8C3410();
  long long v235 = *(char **)(v237 - 8);
  MEMORY[0x270FA5388](v237);
  uint64_t v236 = (char *)&v181 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v222 = type metadata accessor for StockViewModel();
  MEMORY[0x270FA5388](v222);
  uint64_t v221 = (char *)&v181 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v220 = (uint64_t)&v181 - v24;
  uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A5AF7BC(0, &qword_26AC754A0, type metadata accessor for StockSparklineViewModel, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v242 = (uint64_t)&v181 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v241 = (char *)&v181 - v29;
  sub_20A5AF7BC(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0], v25);
  MEMORY[0x270FA5388](v30 - 8);
  uint64_t v215 = (char *)&v181 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v219 = (uint64_t)&v181 - v33;
  MEMORY[0x270FA5388](v34);
  uint64_t v244 = (uint64_t)&v181 - v35;
  MEMORY[0x270FA5388](v36);
  v214 = (char *)&v181 - v37;
  uint64_t v38 = sub_20A8C3F00();
  uint64_t v202 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  v239 = (uint64_t (*)(uint64_t))((char *)&v181 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v40);
  v240 = (char *)&v181 - v41;
  MEMORY[0x270FA5388](v42);
  v238 = ((char *)&v181 - v43);
  sub_20A44DF90(0);
  uint64_t v226 = *(void *)(v44 - 8);
  uint64_t v227 = v44;
  MEMORY[0x270FA5388](v44);
  long long v234 = (char *)&v181 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v46);
  v232 = (char *)&v181 - v47;
  sub_20A494C14();
  MEMORY[0x270FA5388](v48 - 8);
  uint64_t v198 = (uint64_t (**)(int64_t, uint64_t))((char *)&v181 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v50);
  v203 = (char *)&v181 - v51;
  sub_20A8BE904(0, (unint64_t *)&qword_26AC69EE0, MEMORY[0x263F7D450]);
  uint64_t v53 = v52;
  uint64_t v231 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  int64_t v197 = (int64_t)&v181 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v55);
  int64_t v199 = (int64_t)&v181 - v56;
  sub_20A4949B4();
  uint64_t v207 = v57;
  uint64_t v193 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v185 = (char *)&v181 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v61 = MEMORY[0x270FA5388](v59);
  uint64_t v62 = *a1;
  if (!*(void *)(*a1 + 16))
  {
    (*(void (**)(char *, void, uint64_t, double))(v11 + 104))(v13, *MEMORY[0x263F7D948], v10, v61);
    v192(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  uint64_t v184 = a3;
  v182 = v13;
  uint64_t v183 = v7;
  uint64_t v201 = v11;
  uint64_t v63 = a1[1];
  uint64_t v218 = a1[2];
  uint64_t v64 = (char *)&v181 - v60;
  sub_20A8BE9C4(&qword_26AC69ED0);
  sub_20A8BE9C4(&qword_26AC69EC8);
  uint64_t v206 = v64;
  uint64_t v204 = v53;
  sub_20A8C5F70();
  uint64_t v205 = *(void *)(v62 + 16);
  uint64_t v200 = type metadata accessor for TickerWatchlistChangeBlueprintModifier();
  uint64_t v65 = (char *)v233 + *(int *)(v200 + 44);
  uint64_t v66 = *((void *)v65 + 1);
  int v67 = v65[16];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (v67) {
    uint64_t v66 = 0;
  }
  if (IsVoiceOverRunning) {
    uint64_t v69 = 0;
  }
  else {
    uint64_t v69 = v66;
  }
  double v70 = *(double *)v65;
  uint64_t result = UIAccessibilityIsVoiceOverRunning();
  double v72 = 1.0;
  if (((result | v67) & 1) == 0) {
    double v72 = v70;
  }
  if ((~*(void *)&v72 & 0x7FF0000000000000) == 0) {
    goto LABEL_66;
  }
  if (v72 <= -9.22337204e18)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (v72 >= 9.22337204e18)
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  uint64_t v73 = (uint64_t)v72;
  uint64_t v74 = v205;
  uint64_t v195 = v10;
  uint64_t v243 = v38;
  uint64_t v217 = v62;
  uint64_t v216 = v63;
  uint64_t v196 = (uint64_t)v72;
  if (v205 >= v69)
  {
    if (v73 < 0)
    {
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
      goto LABEL_72;
    }
    if (v73)
    {
      uint64_t v128 = 0;
      uint64_t v129 = v205;
      int64_t v197 = v129 & ~(v129 >> 63);
      long long v234 = (char *)(v202 + 16);
      v211 = (void (**)(char *, char *, uint64_t))(v235 + 16);
      v210 = (void (**)(char *, uint64_t))(v235 + 8);
      uint64_t v209 = (void (**)(char *, uint64_t))(v202 + 8);
      uint64_t v208 = v226 + 32;
      uint64_t v198 = (uint64_t (**)(int64_t, uint64_t))(v231 + 8);
      uint64_t v83 = v201;
      while (v128 != (char *)v73)
      {
        v246 = v128;
        if (v129)
        {
          uint64_t v215 = v128;
          uint64_t v245 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          uint64_t result = sub_20A68C6D4(0, v197, 0);
          if (v129 < 1) {
            goto LABEL_65;
          }
          uint64_t v213 = (char *)v233 + *(int *)(v200 + 32);
          uint64_t v133 = v62 + ((*(unsigned __int8 *)(v202 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80));
          uint64_t v212 = *(void *)(v202 + 72);
          long long v235 = *(char **)(v202 + 16);
          uint64_t v134 = v129;
          uint64_t v135 = (uint64_t)v214;
          do
          {
            uint64_t v230 = v134;
            ((void (*)(NSObject *, uint64_t, uint64_t))v235)(v238, v133, v38);
            uint64_t v136 = sub_20A8C3EC0();
            uint64_t v138 = *(void *)(v63 + 16);
            uint64_t v231 = v133;
            if (v138 && (unint64_t v139 = sub_20A4D1B24(v136, v137), (v140 & 1) != 0))
            {
              unint64_t v141 = v139;
              uint64_t v142 = *(void *)(v63 + 56);
              uint64_t v143 = sub_20A8C3E10();
              uint64_t v144 = *(void *)(v143 - 8);
              (*(void (**)(uint64_t, unint64_t, uint64_t))(v144 + 16))(v135, v142 + *(void *)(v144 + 72) * v141, v143);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v144 + 56))(v135, 0, 1, v143);
            }
            else
            {
              uint64_t v145 = sub_20A8C3E10();
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v145 - 8) + 56))(v135, 1, 1, v145);
            }
            uint64_t v146 = v233;
            swift_bridgeObjectRelease();
            uint64_t v147 = v241;
            uint64_t v148 = v238;
            sub_20A8BD9D0(v218, v238, v146, v135, v241);
            uint64_t v149 = v240;
            uint64_t v150 = v38;
            uint64_t v151 = v38;
            uint64_t v152 = (void (*)(char *, char *, uint64_t))v235;
            ((void (*)(char *, NSObject *, uint64_t))v235)(v240, v148, v151);
            uint64_t v229 = (uint64_t (*)(uint64_t))MEMORY[0x263F7AEF0];
            uint64_t v153 = v244;
            sub_20A5AF5FC(v135, v244, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
            v239 = type metadata accessor for StockSparklineViewModel;
            uint64_t v154 = v242;
            sub_20A5AF5FC((uint64_t)v147, v242, &qword_26AC754A0, type metadata accessor for StockSparklineViewModel);
            uint64_t v155 = *v211;
            (*v211)(v236, v213, v237);
            id v156 = v221;
            v152(v221, v149, v150);
            uint64_t v157 = (int *)v222;
            uint64_t v158 = v229;
            sub_20A5AF5FC(v153, (uint64_t)&v156[*(int *)(v222 + 20)], &qword_26AC68FB0, v229);
            sub_20A5AF5FC(v154, (uint64_t)&v156[v157[6]], &qword_26AC754A0, v239);
            v159 = v236;
            uint64_t v160 = v237;
            v155(&v156[v157[8]], v236, v237);
            v156[v157[9]] = 0;
            uint64_t v161 = v219;
            sub_20A5AF5FC(v153, v219, &qword_26AC68FB0, v158);
            v162 = v224;
            uint64_t v163 = v240;
            sub_20A8C3E70();
            uint64_t v164 = v223;
            sub_20A5EC850(v161, v162, 9666786, 0xA300000000000000, v223);
            (*v210)(v159, v160);
            uint64_t v165 = v239;
            sub_20A5AF67C(v242, &qword_26AC754A0, v239);
            sub_20A5AF67C(v244, &qword_26AC68FB0, v158);
            uint64_t v166 = *v209;
            (*v209)(v163, v243);
            sub_20A8BEA24(v164, (uint64_t)&v156[v157[7]], (uint64_t (*)(void))type metadata accessor for PriceViewModel);
            uint64_t v167 = (uint64_t)v156;
            uint64_t v135 = (uint64_t)v214;
            uint64_t v168 = v220;
            sub_20A8BEA24(v167, v220, (uint64_t (*)(void))type metadata accessor for StockViewModel);
            sub_20A494D04();
            uint64_t v170 = (uint64_t)v225 + *(int *)(v169 + 48);
            void *v225 = v215;
            sub_20A8BEA8C(v168, v170, (uint64_t (*)(void))type metadata accessor for StockViewModel);
            sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
            sub_20A8C8320();
            uint64_t v171 = v243;
            sub_20A4C88D8(v168);
            sub_20A5AF67C((uint64_t)v241, &qword_26AC754A0, v165);
            sub_20A5AF67C(v135, &qword_26AC68FB0, v158);
            uint64_t v38 = v171;
            v166((char *)v238, v171);
            uint64_t v172 = v245;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_20A68C6D4(0, *(void *)(v172 + 16) + 1, 1);
              uint64_t v172 = v245;
            }
            uint64_t v173 = v231;
            unint64_t v175 = *(void *)(v172 + 16);
            unint64_t v174 = *(void *)(v172 + 24);
            uint64_t v62 = v217;
            uint64_t v63 = v216;
            if (v175 >= v174 >> 1)
            {
              sub_20A68C6D4(v174 > 1, v175 + 1, 1);
              uint64_t v172 = v245;
            }
            *(void *)(v172 + 16) = v175 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v226 + 32))(v172+ ((*(unsigned __int8 *)(v226 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v226 + 80))+ *(void *)(v226 + 72) * v175, v232, v227);
            uint64_t v245 = v172;
            uint64_t v133 = v173 + v212;
            uint64_t v134 = v230 - 1;
          }
          while (v230 != 1);
          swift_bridgeObjectRelease();
          uint64_t v83 = v201;
          uint64_t v128 = v215;
        }
        else
        {
          uint64_t v172 = MEMORY[0x263F8EE78];
        }
        ++v128;
        uint64_t v130 = sub_20A8BE374(&qword_26AC69D58, sub_20A44DF90);
        uint64_t v131 = sub_20A8BE374(&qword_26AC69D50, sub_20A44DF90);
        MEMORY[0x21051E250](v172, v227, v130, v131);
        sub_20A44DD30();
        sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
        int64_t v132 = v199;
        sub_20A8C8810();
        sub_20A8C5F60();
        uint64_t result = (*v198)(v132, v204);
        uint64_t v73 = v196;
        uint64_t v129 = v205;
        if (v128 == (char *)v196)
        {
          uint64_t v10 = v195;
          goto LABEL_61;
        }
      }
      __break(1u);
      goto LABEL_63;
    }
  }
  else
  {
    uint64_t result = UIAccessibilityIsVoiceOverRunning();
    if (result) {
      uint64_t v75 = 0;
    }
    else {
      uint64_t v75 = v66;
    }
    if (!v74) {
      goto LABEL_69;
    }
    uint64_t v76 = v74;
    if (v75 == 0x8000000000000000 && v74 == -1) {
      goto LABEL_73;
    }
    uint64_t v77 = v75 / v74;
    if (v77 <= 2) {
      uint64_t v77 = 2;
    }
    uint64_t v78 = v196 * v77;
    if ((unsigned __int128)(v196 * (__int128)v77) >> 64 != (v196 * v77) >> 63) {
      goto LABEL_71;
    }
    if (v78 < 0)
    {
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      return result;
    }
    if (v78)
    {
      uint64_t v79 = 0;
      int64_t v199 = v76 & ~(v76 >> 63);
      v232 = (char *)(v202 + 16);
      v211 = (void (**)(char *, char *, uint64_t))(v235 + 16);
      v210 = (void (**)(char *, uint64_t))(v235 + 8);
      uint64_t v209 = (void (**)(char *, uint64_t))(v202 + 8);
      uint64_t v208 = v226 + 32;
      uint64_t v196 = v231 + 8;
      uint64_t v194 = (char *)v78;
      while (v79 != (char *)v78)
      {
        v246 = v79;
        uint64_t v245 = MEMORY[0x263F8EE78];
        uint64_t v84 = v79;
        swift_bridgeObjectRetain();
        uint64_t result = sub_20A68C6D4(0, v199, 0);
        if (v76 < 1) {
          goto LABEL_64;
        }
        v214 = v84;
        v203 = v84 + 1;
        uint64_t v213 = (char *)v233 + *(int *)(v200 + 32);
        uint64_t v85 = v62 + ((*(unsigned __int8 *)(v202 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80));
        uint64_t v212 = *(void *)(v202 + 72);
        long long v235 = *(char **)(v202 + 16);
        uint64_t v86 = v76;
        uint64_t v87 = (uint64_t)v215;
        do
        {
          uint64_t v230 = v86;
          uint64_t v231 = v85;
          ((void (*)(uint64_t (*)(uint64_t)))v235)(v239);
          uint64_t v88 = sub_20A8C3EC0();
          uint64_t v90 = v233;
          if (*(void *)(v63 + 16) && (unint64_t v91 = sub_20A4D1B24(v88, v89), (v92 & 1) != 0))
          {
            unint64_t v93 = v91;
            uint64_t v94 = *(void *)(v63 + 56);
            uint64_t v95 = sub_20A8C3E10();
            uint64_t v96 = *(void *)(v95 - 8);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v96 + 16))(v87, v94 + *(void *)(v96 + 72) * v93, v95);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v96 + 56))(v87, 0, 1, v95);
            uint64_t v90 = v233;
          }
          else
          {
            uint64_t v97 = sub_20A8C3E10();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v87, 1, 1, v97);
          }
          swift_bridgeObjectRelease();
          unint64_t v98 = v241;
          sub_20A8BD9D0(v218, v239, v90, v87, v241);
          uint64_t v99 = v87;
          uint64_t v100 = v240;
          uint64_t v101 = (void (*)(char *, char *, uint64_t))v235;
          ((void (*)(void))v235)();
          v238 = MEMORY[0x263F7AEF0];
          sub_20A5AF5FC(v99, v244, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
          uint64_t v229 = type metadata accessor for StockSparklineViewModel;
          uint64_t v102 = v242;
          sub_20A5AF5FC((uint64_t)v98, v242, &qword_26AC754A0, type metadata accessor for StockSparklineViewModel);
          uint64_t v103 = *v211;
          char v104 = v236;
          uint64_t v105 = v237;
          (*v211)(v236, v213, v237);
          uint64_t v106 = (uint64_t)v221;
          v101(v221, v100, v243);
          uint64_t v107 = (int *)v222;
          uint64_t v108 = v244;
          uint64_t v109 = (uint64_t (*)(uint64_t))v238;
          sub_20A5AF5FC(v244, v106 + *(int *)(v222 + 20), &qword_26AC68FB0, (uint64_t (*)(uint64_t))v238);
          uint64_t v110 = v102;
          uint64_t v111 = v229;
          sub_20A5AF5FC(v110, v106 + v107[6], &qword_26AC754A0, v229);
          v103((char *)(v106 + v107[8]), v104, v105);
          *(unsigned char *)(v106 + v107[9]) = 0;
          uint64_t v112 = v108;
          uint64_t v113 = v219;
          sub_20A5AF5FC(v112, v219, &qword_26AC68FB0, v109);
          uint64_t v114 = v224;
          long long v115 = v240;
          sub_20A8C3E70();
          uint64_t v116 = v223;
          sub_20A5EC850(v113, v114, 9666786, 0xA300000000000000, v223);
          (*v210)(v104, v105);
          sub_20A5AF67C(v242, &qword_26AC754A0, v111);
          long long v117 = (uint64_t (*)(uint64_t))v238;
          sub_20A5AF67C(v244, &qword_26AC68FB0, (uint64_t (*)(uint64_t))v238);
          uint64_t v118 = *v209;
          (*v209)(v115, v243);
          long long v119 = v118;
          uint64_t v120 = v107[7];
          uint64_t v87 = (uint64_t)v215;
          sub_20A8BEA24(v116, v106 + v120, (uint64_t (*)(void))type metadata accessor for PriceViewModel);
          uint64_t v121 = v220;
          sub_20A8BEA24(v106, v220, (uint64_t (*)(void))type metadata accessor for StockViewModel);
          sub_20A494D04();
          uint64_t v123 = (uint64_t)v225 + *(int *)(v122 + 48);
          void *v225 = v214;
          sub_20A8BEA8C(v121, v123, (uint64_t (*)(void))type metadata accessor for StockViewModel);
          sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
          sub_20A8C8320();
          uint64_t v124 = v243;
          sub_20A4C88D8(v121);
          sub_20A5AF67C((uint64_t)v241, &qword_26AC754A0, v111);
          sub_20A5AF67C(v87, &qword_26AC68FB0, v117);
          v119((char *)v239, v124);
          uint64_t v125 = v245;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_20A68C6D4(0, *(void *)(v125 + 16) + 1, 1);
            uint64_t v125 = v245;
          }
          unint64_t v127 = *(void *)(v125 + 16);
          unint64_t v126 = *(void *)(v125 + 24);
          uint64_t v62 = v217;
          uint64_t v63 = v216;
          if (v127 >= v126 >> 1)
          {
            sub_20A68C6D4(v126 > 1, v127 + 1, 1);
            uint64_t v125 = v245;
          }
          *(void *)(v125 + 16) = v127 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v226 + 32))(v125+ ((*(unsigned __int8 *)(v226 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v226 + 80))+ *(void *)(v226 + 72) * v127, v234, v227);
          uint64_t v245 = v125;
          uint64_t v85 = v231 + v212;
          uint64_t v86 = v230 - 1;
        }
        while (v230 != 1);
        swift_bridgeObjectRelease();
        uint64_t v80 = sub_20A8BE374(&qword_26AC69D58, sub_20A44DF90);
        uint64_t v81 = sub_20A8BE374(&qword_26AC69D50, sub_20A44DF90);
        MEMORY[0x21051E250](v125, v227, v80, v81);
        sub_20A44DD30();
        int64_t v82 = v197;
        sub_20A8C8810();
        sub_20A8C5F60();
        uint64_t result = (*(uint64_t (**)(int64_t, uint64_t))v196)(v82, v204);
        uint64_t v79 = v203;
        uint64_t v78 = (uint64_t)v194;
        uint64_t v10 = v195;
        uint64_t v83 = v201;
        uint64_t v76 = v205;
        if (v203 == v194) {
          goto LABEL_61;
        }
      }
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
  }
  uint64_t v83 = v201;
LABEL_61:
  (*(void (**)(char *, char *, uint64_t))(v193 + 16))(v185, v206, v207);
  sub_20A44DD30();
  sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
  uint64_t v176 = v186;
  sub_20A8CBB20();
  uint64_t v177 = v190;
  v178 = v189;
  uint64_t v179 = v183;
  (*(void (**)(char *, void, uint64_t))(v190 + 104))(v189, *MEMORY[0x263F7D528], v183);
  sub_20A494BC0();
  uint64_t v180 = v182;
  sub_20A8C9B50();
  (*(void (**)(char *, uint64_t))(v177 + 8))(v178, v179);
  v192(v180);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v180, v10);
  (*(void (**)(char *, uint64_t))(v187 + 8))(v176, v188);
  return (*(uint64_t (**)(char *, uint64_t))(v193 + 8))(v206, v207);
}

uint64_t sub_20A8BD9D0@<X0>(uint64_t a1@<X2>, NSObject *a2@<X3>, void *a3@<X4>, uint64_t a4@<X5>, unsigned char *a5@<X8>)
{
  uint64_t v66 = a4;
  double v61 = a3;
  uint64_t v68 = a5;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_20A5AF7BC(0, &qword_26AC68FB0, MEMORY[0x263F7AEF0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v60 = &v55[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v55[-v11];
  sub_20A5AF7BC(0, &qword_26AC7F4E0, MEMORY[0x263F7CB28], v7);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = &v55[-v14];
  uint64_t v67 = sub_20A8CDCD0();
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v64 = &v55[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  uint64_t v62 = &v55[-v18];
  sub_20A5AF7BC(0, (unint64_t *)&unk_26AC68F80, MEMORY[0x263F7AEB8], v7);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = &v55[-v20];
  uint64_t v22 = sub_20A8C3D00();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v63 = &v55[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = &v55[-v26];
  uint64_t v28 = sub_20A8C3EC0();
  if (*(void *)(a1 + 16) && (unint64_t v30 = sub_20A4D1B24(v28, v29), (v31 & 1) != 0))
  {
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(v23 + 16))(v21, *(void *)(a1 + 56) + *(void *)(v23 + 72) * v30, v22);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v23 + 56))(v21, 0, 1, v22);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    uint64_t v32 = (unint64_t *)&unk_26AC68F80;
    uint64_t v33 = (uint64_t (*)(uint64_t))MEMORY[0x263F7AEB8];
    uint64_t v34 = (uint64_t)v21;
LABEL_9:
    sub_20A5AF67C(v34, v32, v33);
    uint64_t v39 = type metadata accessor for StockSparklineViewModel(0);
    return (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v68, 1, 1, v39);
  }
  uint64_t v35 = *(void **)(v23 + 32);
  ((void (*)(char *, unsigned char *, uint64_t))v35)(v27, v21, v22);
  __swift_project_boxed_opaque_existential_1(v61 + 7, v61[10]);
  uint64_t v36 = v66;
  sub_20A61E8FC(v27, v66, a2, (uint64_t)v15, 0.02);
  uint64_t v37 = v65;
  uint64_t v38 = v67;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v65 + 48))(v15, 1, v67) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v22);
    uint64_t v32 = &qword_26AC7F4E0;
    uint64_t v33 = (uint64_t (*)(uint64_t))MEMORY[0x263F7CB28];
    uint64_t v34 = (uint64_t)v15;
    goto LABEL_9;
  }
  double v61 = v35;
  uint64_t v41 = v62;
  uint64_t v58 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v37 + 32);
  uint64_t v59 = v37 + 32;
  v58(v62, v15, v38);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v37 + 16))(v64, v41, v38);
  (*(void (**)(unsigned char *, char *, uint64_t))(v23 + 16))(v63, v27, v22);
  sub_20A5AF5FC(v36, (uint64_t)v12, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
  uint64_t v42 = sub_20A8C3E10();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v43 + 48);
  if (v44(v12, 1, v42) == 1)
  {
    sub_20A5AF67C((uint64_t)v12, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    uint64_t v57 = 0;
    int v56 = 1;
  }
  else
  {
    uint64_t v57 = sub_20A8C3E00();
    int v56 = v45 & 1;
    (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v12, v42);
  }
  uint64_t v46 = v60;
  sub_20A5AF5FC(v66, (uint64_t)v60, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
  if (v44(v46, 1, v42) == 1)
  {
    uint64_t v47 = v67;
    (*(void (**)(unsigned char *, uint64_t))(v65 + 8))(v62, v67);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v22);
    sub_20A5AF67C((uint64_t)v46, &qword_26AC68FB0, MEMORY[0x263F7AEF0]);
    uint64_t v48 = 0;
    char v49 = 1;
  }
  else
  {
    uint64_t v48 = sub_20A8C3D10();
    char v49 = v50 & 1;
    uint64_t v47 = v67;
    (*(void (**)(unsigned char *, uint64_t))(v65 + 8))(v62, v67);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v22);
    (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v46, v42);
  }
  uint64_t v51 = v68;
  v58(v68, v64, v47);
  uint64_t v52 = (int *)type metadata accessor for StockSparklineViewModel(0);
  ((void (*)(unsigned char *, unsigned char *, uint64_t))v61)(&v51[v52[8]], v63, v22);
  uint64_t v53 = &v51[v52[5]];
  *(void *)uint64_t v53 = v57;
  v53[8] = v56;
  uint64_t v54 = &v51[v52[6]];
  *(void *)uint64_t v54 = v48;
  v54[8] = v49;
  v51[v52[7]] = 0;
  return (*(uint64_t (**)(unsigned char *, void, uint64_t, int *))(*((void *)v52 - 1) + 56))(v51, 0, 1, v52);
}

uint64_t sub_20A8BE1BC(void *a1, void (*a2)(char *))
{
  sub_20A8BE904(0, &qword_26AC6A418, MEMORY[0x263F7D950]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  double v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v12 - v8;
  *(uint64_t *)((char *)&v12 - v8) = (uint64_t)a1;
  (*(void (**)(char *, void, uint64_t, double))(v6 + 104))((char *)&v12 - v8, *MEMORY[0x263F7D930], v5, v7);
  id v10 = a1;
  a2(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_20A8BE2E4()
{
  return sub_20A8BE374(&qword_26AC7DD20, (void (*)(uint64_t))type metadata accessor for TickerWatchlistChangeBlueprintModifier);
}

uint64_t sub_20A8BE32C()
{
  return sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
}

uint64_t sub_20A8BE374(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A8BE3BC()
{
  return swift_retain();
}

uint64_t sub_20A8BE3F8()
{
  unint64_t v1 = (int *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  __swift_destroy_boxed_opaque_existential_1(v2 + 96);
  uint64_t v3 = v2 + v1[10];
  uint64_t v4 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = v2 + v1[12];
  uint64_t v6 = sub_20A8C34C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_deallocObject();
}

uint64_t sub_20A8BE550(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  return sub_20A8BBAE0(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_20A8BE5BC()
{
  uint64_t v1 = (int *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  unint64_t v3 = v2 + *(void *)(*(void *)v1 + 64);
  sub_20A8BE904(0, (unint64_t *)&qword_26AC6AC90, MEMORY[0x263F7E0A8]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  unint64_t v7 = (v3 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  uint64_t v8 = v0 + v2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + v2 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + v2 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + v2 + 96);
  unint64_t v9 = v0 + v2 + v1[10];
  uint64_t v10 = sub_20A8C3410();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  uint64_t v11 = v8 + v1[12];
  uint64_t v12 = sub_20A8C34C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);

  return swift_deallocObject();
}

uint64_t sub_20A8BE7C4(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  sub_20A8BE904(0, (unint64_t *)&qword_26AC6AC90, MEMORY[0x263F7E0A8]);
  return sub_20A8BBD30(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), (void *)(v1 + v4), v1+ ((v5 + *(unsigned __int8 *)(*(void *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)));
}

uint64_t sub_20A8BE8C4()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20A8BE8FC(void *a1)
{
  return sub_20A8BE1BC(a1, *(void (**)(char *))(v1 + 16));
}

void sub_20A8BE904(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void *))
{
  if (!*a2)
  {
    v8[0] = &type metadata for TickerSectionDescriptor;
    v8[1] = type metadata accessor for TickerModel();
    v8[2] = sub_20A44DD30();
    v8[3] = sub_20A8BE374(&qword_26AC6CBD0, (void (*)(uint64_t))type metadata accessor for TickerModel);
    unint64_t v6 = a3(a1, v8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_20A8BE9C4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20A8BE904(255, (unint64_t *)&qword_26AC69EE0, MEMORY[0x263F7D450]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20A8BEA24(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A8BEA8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A8BEAF4()
{
  uint64_t v1 = (int *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  __swift_destroy_boxed_opaque_existential_1(v2 + 96);
  uint64_t v3 = v2 + v1[10];
  uint64_t v4 = sub_20A8C3410();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = v2 + v1[12];
  uint64_t v6 = sub_20A8C34C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20A8BEC68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TickerWatchlistChangeBlueprintModifier() - 8);
  return sub_20A8BBC8C(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

ValueMetadata *type metadata accessor for TickerWatchlistChangeBlueprintModifier.Results()
{
  return &type metadata for TickerWatchlistChangeBlueprintModifier.Results;
}

ValueMetadata *type metadata accessor for ManagedConfigurationService()
{
  return &type metadata for ManagedConfigurationService;
}

id sub_20A8BED30()
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_isNewsAllowed);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_20A8BED90(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v59 = a3;
  uint64_t v58 = a2;
  uint64_t v57 = a1;
  uint64_t v64 = sub_20A8C43D0();
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v65 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C43C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20A8CADF0();
  uint64_t v67 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_20A8C4420();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v62 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)sub_20A8C9790();
  id v16 = objc_msgSend(v15, sel_horizontalSizeClass);

  if (v16 == (id)1)
  {
    __asm { FMOV            V0.2D, #1.0 }
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
  }
  else
  {
    uint64_t v53 = a4;
    uint64_t v54 = v12;
    uint64_t v55 = v9;
    uint64_t v56 = v8;
    __swift_project_boxed_opaque_existential_1((void *)(v5 + 16), *(void *)(v5 + 40));
    swift_bridgeObjectRetain();
    sub_20A79C1DC();
    id v27 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v28 = v11;
    uint64_t v29 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    uint64_t v57 = v30;
    sub_20A8BFF80((unint64_t *)&qword_26AC7F9F8, type metadata accessor for Key);
    char v31 = (void *)sub_20A8CE170();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v27, sel_initWithString_attributes_, v29, v31);

    uint64_t v33 = v28;
    uint64_t v34 = v32;
    __swift_project_boxed_opaque_existential_1((void *)(v5 + 16), *(void *)(v5 + 40));
    swift_bridgeObjectRetain();
    sub_20A79C464();
    id v35 = objc_allocWithZone(MEMORY[0x263F089B8]);
    uint64_t v36 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    uint64_t v37 = (void *)sub_20A8CE170();
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v35, sel_initWithString_attributes_, v36, v37);

    sub_20A8C9710();
    uint64_t v39 = (void *)sub_20A8C9790();
    objc_msgSend(v39, sel_horizontalSizeClass);
    objc_msgSend(v39, sel_horizontalSizeClass);

    MEMORY[0x270FA5388](v40);
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v62, *MEMORY[0x263F7D1B8], v61);
    sub_20A8BFEC4(0, &qword_26AC80B10, MEMORY[0x263F7D1D8]);
    swift_allocObject();
    sub_20A8C4440();
    uint64_t v41 = v66;
    sub_20A8C96E0();
    sub_20A8C9720();
    sub_20A8CADC0();
    sub_20A8CADC0();
    sub_20A8CEDC0();
    uint64_t v62 = v42;
    uint64_t v61 = v43;
    sub_20A8C9720();
    uint64_t v60 = v44;
    uint64_t v59 = v45;
    sub_20A8C9760();
    uint64_t v58 = v46;
    uint64_t v57 = v47;
    sub_20A8C96F0();
    v52[3] = v48;
    v52[2] = v49;
    sub_20A8C9770();
    v52[1] = v50;
    v52[0] = v51;
    sub_20A8C9750();
    sub_20A8C9710();
    sub_20A8C9740();
    sub_20A8C97B0();
    sub_20A8C9730();
    (*(void (**)(char *, void, uint64_t))(v63 + 104))(v65, *MEMORY[0x263F7D1A8], v64);
    sub_20A8C43B0();
    sub_20A8C4450();
    swift_release();

    (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v56);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v41, v54);
    long long v22 = v68;
    _Q0 = v69;
    long long v23 = v70;
    long long v24 = v71;
    long long v25 = v72;
    long long v26 = v73;
    a4 = v53;
  }
  *a4 = v22;
  a4[1] = _Q0;
  a4[2] = v23;
  a4[3] = v24;
  a4[4] = v25;
  a4[5] = v26;
}

uint64_t sub_20A8BF5A8(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  sub_20A8BFDDC(0, &qword_26AC810B0, MEMORY[0x263F7D1F8]);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 - 8);
  double v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = &v32[-v18];
  uint64_t v39 = a1;
  (*(void (**)(unsigned char *, void, uint64_t, double))(v16 + 104))(&v32[-v18], *MEMORY[0x263F7D1E8], v15, v17);
  sub_20A8BFD68();
  sub_20A8BFDDC(0, &qword_26AC810A8, MEMORY[0x263F7D188]);
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)(v20 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_20A8D3DC0;
  long long v25 = (void *)(v24 + v23);
  MEMORY[0x210526C50](0.0, a4, a5, a6, a7);
  sub_20A8CE960();
  void *v25 = v26;
  v25[1] = v27;
  v25[2] = v28;
  v25[3] = v29;
  (*(void (**)(void *, void, uint64_t))(v22 + 104))(v25, *MEMORY[0x263F7D180], v21);
  double v33 = a4;
  double v34 = a5;
  double v35 = a6;
  double v36 = a7;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v30 = (uint64_t (*)(uint64_t, void *))MEMORY[0x263F7D198];
  sub_20A8BFEC4(0, &qword_26AC80B08, MEMORY[0x263F7D198]);
  sub_20A8BFE70(&qword_26AC80B00, &qword_26AC80B08, v30);
  sub_20A8C4350();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v16 + 8))(v19, v15);
}

uint64_t sub_20A8BF8AC(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6)
{
  double v36 = a2;
  uint64_t v37 = a3;
  sub_20A8BFDDC(0, &qword_26AC810B0, MEMORY[0x263F7D1F8]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v31 - v12);
  uint64_t v40 = a1;
  uint64_t v14 = a1;
  uint64_t v38 = a1;
  uint64_t v15 = swift_allocObject();
  *(double *)(v15 + 16) = a4;
  *uint64_t v13 = v15;
  unsigned int v39 = *MEMORY[0x263F7D1F0];
  uint64_t v16 = *(void (**)(uint64_t *))(v11 + 104);
  v16(v13);
  double v17 = v16;
  id v32 = v16;
  uint64_t v18 = (uint64_t (*)(uint64_t, void *))MEMORY[0x263F7D168];
  sub_20A8BFEC4(0, &qword_26AC80AE8, MEMORY[0x263F7D168]);
  uint64_t v33 = sub_20A8BFE70(&qword_26AC80AE0, &qword_26AC80AE8, v18);
  sub_20A8C4370();
  uint64_t v19 = *(void (**)(uint64_t *, uint64_t))(v11 + 8);
  v19(v13, v10);
  uint64_t v40 = v14;
  swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v36;
  *(void *)(v20 + 16) = v36;
  *uint64_t v13 = v20;
  unsigned int v35 = *MEMORY[0x263F7D1E0];
  v17(v13);
  uint64_t v34 = sub_20A8BFF80(&qword_26AC80AF0, (void (*)(uint64_t))sub_20A6A5320);
  id v22 = v21;
  sub_20A8C4360();
  swift_release();
  v19(v13, v10);
  uint64_t v23 = v38;
  uint64_t v40 = v38;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0x4008000000000000;
  *uint64_t v13 = v24;
  long long v25 = v32;
  ((void (*)(uint64_t *, void, uint64_t))v32)(v13, v39, v10);
  sub_20A8C4370();
  v19(v13, v10);
  uint64_t v40 = v23;
  swift_getKeyPath();
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v37;
  *(void *)(v26 + 16) = v37;
  *uint64_t v13 = v26;
  ((void (*)(uint64_t *, void, uint64_t))v25)(v13, v35, v10);
  id v28 = v27;
  sub_20A8C4360();
  swift_release();
  v19(v13, v10);
  uint64_t v40 = v38;
  uint64_t v29 = swift_allocObject();
  *(double *)(v29 + 16) = a6;
  *uint64_t v13 = v29;
  ((void (*)(uint64_t *, void, uint64_t))v25)(v13, v39, v10);
  sub_20A8C4370();
  return ((uint64_t (*)(uint64_t *, uint64_t))v19)(v13, v10);
}

uint64_t type metadata accessor for TodayViewLayoutAttributesFactory()
{
  return self;
}

uint64_t sub_20A8BFCFC(uint64_t a1)
{
  return sub_20A8BFE58(a1, sub_20A8BF5A8);
}

unint64_t sub_20A8BFD14()
{
  unint64_t result = qword_26AC81140;
  if (!qword_26AC81140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC81140);
  }
  return result;
}

void sub_20A8BFD68()
{
  if (!qword_26AC81050)
  {
    sub_20A8BFDDC(255, &qword_26AC810A8, MEMORY[0x263F7D188]);
    unint64_t v0 = sub_20A8CF730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC81050);
    }
  }
}

void sub_20A8BFDDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_20A8BFD14();
    unint64_t v7 = a3(a1, &type metadata for TodayViewLayout, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_20A8BFE40(uint64_t a1)
{
  return sub_20A8BFE58(a1, (uint64_t (*)(uint64_t, void, void, double, double, double, double))sub_20A8BF8AC);
}

uint64_t sub_20A8BFE58(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, double, double, double, double))
{
  return a2(a1, *(void *)(v2 + 48), *(void *)(v2 + 56), *(double *)(v2 + 16), *(double *)(v2 + 24), *(double *)(v2 + 32), *(double *)(v2 + 40));
}

uint64_t sub_20A8BFE70(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void *))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20A8BFEC4(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20A8BFEB4()
{
  return swift_deallocObject();
}

void sub_20A8BFEC4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void *))
{
  if (!*a2)
  {
    v8[0] = &type metadata for TodayViewLayout;
    v8[1] = &type metadata for TodayViewLayoutAttributes;
    v8[2] = sub_20A8BFD14();
    v8[3] = sub_20A6A58FC();
    unint64_t v6 = a3(a1, v8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_20A8BFF48()
{
  return swift_deallocObject();
}

uint64_t sub_20A8BFF80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20A8BFFC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A8BFFDC);
}

uint64_t sub_20A8BFFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C9830();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_20A8C0048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A8C005C);
}

uint64_t sub_20A8C005C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A8C9830();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for StockFeedPriceViewLayoutOptions()
{
  uint64_t result = qword_26AC7A918;
  if (!qword_26AC7A918) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double sub_20A8C0118@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for QuoteSummaryViewLayoutOptions();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_20A8C9830();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v10, a2, v11);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 56), *(void *)(v3 + 80));
  uint64_t v12 = type metadata accessor for StockFeedMastheadModel();
  sub_20A4BA828(COERCE_CGFLOAT(a1 + *(int *)(v12 + 28)), (uint64_t)v10, &v83);
  memcpy(v86, &v83, sizeof(v86));
  uint64_t v13 = (void *)sub_20A8C9750();
  id v14 = objc_msgSend(v13, sel_horizontalSizeClass);

  if (v14 == (id)1)
  {
    *(void *)&long long v71 = v10;
    uint64_t v72 = a3;
    sub_20A8C9710();
    *(void *)&long long v69 = v15;
    sub_20A8C9720();
    double v17 = v16;
    *(void *)&long long v70 = a2;
    sub_20A8C9710();
    sub_20A8CE970();
    CGFloat v19 = v17 - v18;
    *(CGFloat *)&long long v68 = v83.origin.x;
    CGFloat y = v83.origin.y;
    CGFloat width = v83.size.width;
    CGFloat height = v83.size.height;
    CGRectGetWidth(v83);
    uint64_t v23 = __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
    v67[1] = sub_20A817594(a1 + *(int *)(v12 + 20));
    *(void *)&long long v73 = v24;
    long long v25 = (void *)*v23;
    sub_20A42CF04();
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_20A8D4540;
    uint64_t v27 = (void *)*MEMORY[0x263F814F0];
    *(void *)(v26 + 32) = *MEMORY[0x263F814F0];
    id v28 = (void *)v25[2];
    uint64_t v29 = sub_20A42CFF0(0, (unint64_t *)&qword_26AC7FB80);
    *(void *)(v26 + 40) = v28;
    uint64_t v30 = (void *)*MEMORY[0x263F81500];
    *(void *)(v26 + 64) = v29;
    *(void *)(v26 + 72) = v30;
    uint64_t v31 = v25[6];
    uint64_t v32 = v25[7];
    __swift_project_boxed_opaque_existential_1(v25 + 3, v31);
    uint64_t v33 = *(void *)(v32 + 16);
    uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v33 + 184);
    swift_bridgeObjectRetain();
    id v35 = v27;
    id v36 = v28;
    id v37 = v30;
    uint64_t v38 = v34(v31, v33);
    *(void *)(v26 + 104) = sub_20A42CFF0(0, (unint64_t *)&qword_26AC7FBB0);
    *(void *)(v26 + 80) = v38;
    sub_20A4CF8B0(v26);
    id v39 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v40 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_20A4393AC();
    uint64_t v41 = (void *)sub_20A8CE170();
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(v39, sel_initWithString_attributes_, v40, v41);
    swift_bridgeObjectRelease();

    objc_msgSend(v42, sel_boundingRectWithSize_options_context_, 1, 0, v19, 1.79769313e308);
    CGFloat x = v87.origin.x;
    CGFloat v44 = v87.origin.y;
    CGFloat v45 = v87.size.width;
    CGFloat v46 = v87.size.height;
    BOOL v47 = v19 < CGRectGetWidth(v87);
    CGFloat v48 = *(double *)&v68;
    if (v47)
    {
      *(void *)&v88.origin.CGFloat x = v68;
      v88.origin.CGFloat y = y;
      v88.size.CGFloat width = width;
      v88.size.CGFloat height = height;
      CGRectGetHeight(v88);
    }
    v89.origin.CGFloat x = v48;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.CGFloat height = height;
    CGFloat v49 = CGRectGetWidth(v89);
    v90.size.CGFloat width = width;
    CGFloat v50 = v49;
    *(CGFloat *)&long long v73 = v49;
    v90.origin.CGFloat x = v48;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat height = height;
    CGFloat v51 = CGRectGetHeight(v90);
    v91.origin.CGFloat y = 8.0;
    CGFloat v52 = *(double *)&v69;
    *(void *)&v91.origin.CGFloat x = v69;
    v91.size.CGFloat width = v50;
    v91.size.CGFloat height = v51;
    double MaxY = CGRectGetMaxY(v91);
    v92.origin.CGFloat x = x;
    v92.origin.CGFloat y = v44;
    v92.size.CGFloat width = v45;
    v92.size.CGFloat height = v46;
    CGFloat v54 = CGRectGetWidth(v92);
    v93.origin.CGFloat x = x;
    v93.origin.CGFloat y = v44;
    v93.size.CGFloat width = v45;
    v93.size.CGFloat height = v46;
    CGFloat v55 = CGRectGetHeight(v93);
    double v56 = MaxY + 5.0;
    v94.origin.CGFloat x = v52;
    v94.origin.CGFloat y = MaxY + 5.0;
    v94.size.CGFloat width = v54;
    v94.size.CGFloat height = v55;
    CGFloat v57 = CGRectGetMaxY(v94) + 8.0;
    uint64_t v58 = sub_20A8C9720();
    double v59 = MEMORY[0x270FA5388](v58);
    v67[-14] = 0;
    v67[-13] = 0;
    *(double *)&v67[-12] = v59;
    *(CGFloat *)&v67[-11] = v57;
    *(CGFloat *)&v67[-10] = v52;
    v67[-9] = 0x4020000000000000;
    v67[-8] = v73;
    *(CGFloat *)&v67[-7] = v51;
    v67[-6] = &v83;
    *(CGFloat *)&v67[-5] = v52;
    *(double *)&v67[-4] = v56;
    *(CGFloat *)&v67[-3] = v54;
    *(CGFloat *)&v67[-2] = v55;
    sub_20A8C96A0();

    sub_20A722EC4(v71);
    long long v70 = v75;
    long long v71 = v74;
    long long v68 = v77;
    long long v69 = v76;
    memcpy(v85, v78, sizeof(v85));
    long long v61 = v77;
    long long v60 = v76;
    long long v63 = v75;
    long long v62 = v74;
    v84[0] = *(_DWORD *)v79;
    *(_DWORD *)((char *)v84 + 3) = *(_DWORD *)&v79[3];
    uint64_t v64 = v80;
    long long v73 = v81;
    uint64_t v65 = v82;
    a3 = v72;
  }
  else
  {
    sub_20A722EC4((uint64_t)v10);
    memcpy(v85, v86, sizeof(v85));
    long long v62 = 0uLL;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    long long v63 = 0uLL;
    long long v60 = 0uLL;
    long long v61 = 0uLL;
    long long v73 = 0u;
  }
  *(_OWORD *)a3 = v62;
  *(_OWORD *)(a3 + 16) = v63;
  *(_OWORD *)(a3 + 32) = v60;
  *(_OWORD *)(a3 + 48) = v61;
  memcpy((void *)(a3 + 64), v85, 0x1A1uLL);
  *(_DWORD *)(a3 + 481) = v84[0];
  *(_DWORD *)(a3 + 484) = *(_DWORD *)((char *)v84 + 3);
  *(void *)(a3 + 488) = v64;
  double result = *(double *)&v73;
  *(_OWORD *)(a3 + 496) = v73;
  *(void *)(a3 + 512) = v65;
  return result;
}

double sub_20A8C06D8@<D0>(const void *a1@<X1>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  double v34 = a5;
  double v35 = a6;
  double v32 = a3;
  double v33 = a4;
  memcpy(v36, a1, sizeof(v36));
  uint64_t v7 = sub_20A8C8180();
  uint64_t v8 = *(void *)(v7 - 8);
  double v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *MEMORY[0x263F7D268];
  uint64_t v13 = *(void (**)(void, void, void, double))(v8 + 104);
  v13(v11, v12, v7, v9);
  sub_20A8C8170();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  id v22 = *(void (**)(void, void))(v8 + 8);
  v22(v11, v7);
  ((void (*)(char *, uint64_t, uint64_t))v13)(v11, v12, v7);
  sub_20A8C8170();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  v22(v11, v7);
  memcpy((void *)(a2 + 64), v36, 0x1A1uLL);
  *(double *)a2 = v32;
  *(double *)(a2 + 8) = v33;
  *(double *)(a2 + 16) = v34;
  double result = v35;
  *(double *)(a2 + 24) = v35;
  *(void *)(a2 + 32) = v15;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v21;
  *(_DWORD *)(a2 + 481) = v37[0];
  *(_DWORD *)(a2 + 484) = *(_DWORD *)((char *)v37 + 3);
  *(void *)(a2 + 488) = v24;
  *(void *)(a2 + 496) = v26;
  *(void *)(a2 + 504) = v28;
  *(void *)(a2 + 512) = v30;
  return result;
}

uint64_t type metadata accessor for StockFeedPriceViewLayoutAttributesFactory()
{
  return self;
}

void *sub_20A8C0928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = a5;
  uint64_t v42 = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  uint64_t v38 = a7;
  uint64_t v39 = a10;
  uint64_t v17 = __swift_allocate_boxed_opaque_existential_1(v37);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(v17, a2, a7);
  uint64_t v35 = a6;
  uint64_t v36 = a9;
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v34);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(v18, a3, a6);
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v40, v41);
  double v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (uint64_t *)((char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v24 + 16))(v23, v21);
  uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v38);
  double v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (uint64_t *)((char *)&v33 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v29 + 16))(v28, v26);
  uint64_t v30 = *v23;
  uint64_t v31 = *v28;
  uint64_t v19[5] = type metadata accessor for StockFeedQuoteViewStyler();
  v19[6] = &off_26BE692B8;
  v19[2] = v30;
  v19[10] = type metadata accessor for QuoteSummaryViewLayoutAttributesFactory();
  v19[11] = &off_26BE623A0;
  v19[7] = v31;
  sub_20A42BEBC(&v34, (uint64_t)(v19 + 12));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  return v19;
}

double sub_20A8C0BDC@<D0>(uint64_t a1@<X8>)
{
  return sub_20A8C06D8(*(const void **)(v1 + 80), a1, *(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40));
}

void *__swift_memcpy417_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1A1uLL);
}

uint64_t getEnumTagSinglePayload for QuoteSummaryViewLayoutAttributes(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 417)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 416);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for QuoteSummaryViewLayoutAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 408) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(unsigned char *)(result + 416) = 0;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 417) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 417) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 416) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuoteSummaryViewLayoutAttributes()
{
  return &type metadata for QuoteSummaryViewLayoutAttributes;
}

uint64_t sub_20A8C0D40()
{
  type metadata accessor for PriceFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_20A8C2910();
  qword_26AC9EA78 = v0;
  return result;
}

uint64_t type metadata accessor for PriceChangeFormatter()
{
  return self;
}

uint64_t sub_20A8C0DB4(char a1, double a2)
{
  if (qword_26AC71B78 != -1) {
    swift_once();
  }
  id v4 = (id)sub_20A658280(a1, 3, 0, a2);
  objc_msgSend(v4, sel_setNumberStyle_, 1);
  id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  id v6 = objc_msgSend(v4, sel_stringFromNumber_, v5);

  if (v6)
  {
    uint64_t v7 = sub_20A8CE280();
  }
  else
  {

    return 0;
  }
  return v7;
}

uint64_t sub_20A8C0EC0(char a1, double a2)
{
  if (qword_26AC71B78 != -1) {
    swift_once();
  }
  double v4 = fabs(a2);
  id v5 = (id)sub_20A658280(a1, 3, 1, v4);
  objc_msgSend(v5, sel_setNumberStyle_, 1);
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v4);
  id v7 = objc_msgSend(v5, sel_stringFromNumber_, v6);

  if (v7)
  {
    uint64_t v8 = sub_20A8CE280();
    uint64_t v10 = v9;

    type metadata accessor for Localized();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v12 = self;
    id v13 = objc_msgSend(v12, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_20A8C2370();

    id v14 = objc_msgSend(v12, sel_bundleForClass_, ObjCClassFromMetadata, 0x800000020A914990);
    uint64_t v15 = sub_20A8C2370();
    uint64_t v17 = v16;

    sub_20A43F778();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_20A8D5CB0;
    uint64_t v19 = MEMORY[0x263F8D5B8];
    *(void *)(v18 + 56) = MEMORY[0x263F8D538];
    *(void *)(v18 + 64) = v19;
    *(double *)(v18 + 32) = v4;
    uint64_t v20 = MEMORY[0x263F8D310];
    *(void *)(v18 + 96) = MEMORY[0x263F8D310];
    unint64_t v21 = sub_20A43F830();
    *(void *)(v18 + 72) = v15;
    *(void *)(v18 + 80) = v17;
    *(void *)(v18 + 136) = v20;
    *(void *)(v18 + 144) = v21;
    *(void *)(v18 + 104) = v21;
    *(void *)(v18 + 112) = v8;
    *(void *)(v18 + 120) = v10;
    uint64_t v22 = sub_20A8CE250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    return 0;
  }
  return v22;
}

uint64_t sub_20A8C1198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_20A8C2AF0();
  double v4 = MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t, double))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  return sub_20A8C2A50();
}

uint64_t type metadata accessor for StockChartDateAnalyzer()
{
  return self;
}

uint64_t sub_20A8C1290@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v96 = a3;
  uint64_t v91 = a4;
  uint64_t v97 = a1;
  uint64_t v95 = a5;
  uint64_t v98 = sub_20A8C2A60();
  uint64_t v6 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  CGRect v92 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8507DC(0, &qword_26AC68CC0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v85 - v12;
  MEMORY[0x270FA5388](v14);
  CGRect v88 = (char *)&v85 - v15;
  MEMORY[0x270FA5388](v16);
  CGRect v89 = (void (*)(char *, uint64_t, uint64_t))((char *)&v85 - v17);
  uint64_t v99 = sub_20A8C2800();
  uint64_t v100 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  uint64_t v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  CGRect v87 = (char *)&v85 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v85 = (char *)&v85 - v23;
  MEMORY[0x270FA5388](v24);
  uint64_t v86 = (char *)&v85 - v25;
  uint64_t v26 = sub_20A8C22A0();
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v85 - v30;
  MEMORY[0x270FA5388](v32);
  long long v34 = (char *)&v85 - v33;
  MEMORY[0x270FA5388](v35);
  id v37 = (char *)&v85 - v36;
  uint64_t v93 = v38;
  uint64_t v94 = v39;
  uint64_t v90 = v6;
  switch(a2)
  {
    case 1:
      sub_20A8507DC(0, (unint64_t *)&qword_26AC7FE70, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v68 = *(void *)(v6 + 72);
      unint64_t v69 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v70 = swift_allocObject();
      *(_OWORD *)(v70 + 16) = xmmword_20A8D5CB0;
      unint64_t v71 = v70 + v69;
      uint64_t v72 = *(void (**)(unint64_t, void, uint64_t))(v6 + 104);
      uint64_t v73 = v98;
      v72(v71, *MEMORY[0x263F078A0], v98);
      v72(v71 + v68, *MEMORY[0x263F078A8], v73);
      unint64_t v74 = v71 + 2 * v68;
      int v75 = *MEMORY[0x263F07870];
      v72(v74, *MEMORY[0x263F07870], v73);
      sub_20A7BA4B0(v70);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_20A8C29D0();
      swift_bridgeObjectRelease();
      CGFloat v48 = v88;
      sub_20A8C2A10();
      uint64_t v49 = v100;
      uint64_t v50 = v99;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v48, 1, v99) == 1)
      {
        (*(void (**)(char *, uint64_t))(v94 + 8))(v34, v93);
        goto LABEL_10;
      }
      uint64_t v82 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
      LODWORD(v96) = v75;
      CGRect v83 = v85;
      v82(v85, v48, v50);
      uint64_t v84 = v92;
      v72((unint64_t)v92, v96, v73);
      sub_20A8C2A30();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v84, v73);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v83, v50);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v34, v93);
      break;
    case 2:
      sub_20A8507DC(0, (unint64_t *)&qword_26AC7FE70, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v51 = *(void *)(v6 + 72);
      unint64_t v52 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = xmmword_20A8D4540;
      unint64_t v54 = v53 + v52;
      CGFloat v55 = *(char **)(v6 + 104);
      uint64_t v56 = v98;
      ((void (*)(unint64_t, void, uint64_t))v55)(v54, *MEMORY[0x263F078A0], v98);
      uint64_t v57 = v54 + v51;
      uint64_t v58 = *MEMORY[0x263F078A8];
      CGRect v89 = (void (*)(char *, uint64_t, uint64_t))v55;
      ((void (*)(uint64_t, uint64_t, uint64_t))v55)(v57, v58, v56);
      sub_20A7BA4B0(v53);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_20A8C29D0();
      swift_bridgeObjectRelease();
      sub_20A8C2A10();
      uint64_t v59 = v100;
      uint64_t v60 = v99;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v13, 1, v99) == 1)
      {
        (*(void (**)(char *, uint64_t))(v94 + 8))(v31, v93);
        sub_20A7D5754((uint64_t)v13);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v95, 1, 1, v60);
      }
      else
      {
        long long v76 = v87;
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v87, v13, v60);
        long long v77 = v92;
        v89(v92, v58, v56);
        sub_20A8C2A30();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v77, v56);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v76, v60);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v31, v93);
      }
      break;
    case 3:
      sub_20A8507DC(0, (unint64_t *)&qword_26AC7FE70, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      unint64_t v62 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = xmmword_20A8D3DC0;
      uint64_t v64 = *(char **)(v6 + 104);
      unint64_t v65 = v63 + v62;
      LODWORD(v89) = *MEMORY[0x263F078A0];
      uint64_t v66 = v98;
      CGRect v88 = v64;
      ((void (*)(unint64_t))v64)(v65);
      sub_20A7BA4B0(v63);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_20A8C29D0();
      swift_bridgeObjectRelease();
      sub_20A8C2A10();
      uint64_t v49 = v100;
      uint64_t v50 = v99;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v10, 1, v99) == 1)
      {
        (*(void (**)(char *, uint64_t))(v94 + 8))(v28, v93);
        uint64_t v67 = (uint64_t)v10;
        goto LABEL_11;
      }
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v19, v10, v50);
      uint64_t v78 = v92;
      ((void (*)(char *, void, uint64_t))v88)(v92, v89, v66);
      sub_20A8C2A30();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v78, v66);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v19, v50);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v28, v93);
      break;
    default:
      sub_20A8507DC(0, (unint64_t *)&qword_26AC7FE70, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v40 = *(void *)(v6 + 72);
      unint64_t v41 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v42 = swift_allocObject();
      *(_OWORD *)(v42 + 16) = xmmword_20A8D7FF0;
      unint64_t v43 = v42 + v41;
      CGFloat v44 = *(void (**)(unint64_t, void, uint64_t))(v6 + 104);
      uint64_t v45 = v98;
      v44(v43, *MEMORY[0x263F078A0], v98);
      v44(v43 + v40, *MEMORY[0x263F078A8], v45);
      v44(v43 + 2 * v40, *MEMORY[0x263F07870], v45);
      unint64_t v46 = v43 + 3 * v40;
      int v47 = *MEMORY[0x263F07890];
      v44(v46, *MEMORY[0x263F07890], v45);
      sub_20A7BA4B0(v42);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_20A8C29D0();
      swift_bridgeObjectRelease();
      CGFloat v48 = (char *)v89;
      sub_20A8C2A10();
      uint64_t v49 = v100;
      uint64_t v50 = v99;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48))(v48, 1, v99) == 1)
      {
        (*(void (**)(char *, uint64_t))(v94 + 8))(v37, v93);
LABEL_10:
        uint64_t v67 = (uint64_t)v48;
LABEL_11:
        sub_20A7D5754(v67);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v95, 1, 1, v50);
      }
      else
      {
        uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
        LODWORD(v96) = v47;
        uint64_t v80 = v86;
        v79(v86, v48, v50);
        long long v81 = v92;
        v44((unint64_t)v92, v96, v45);
        sub_20A8C2A30();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v81, v45);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v80, v50);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v37, v93);
      }
      break;
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_20A8C1F00()
{
  return MEMORY[0x270EE0A18]();
}

uint64_t sub_20A8C1F10()
{
  return MEMORY[0x270EE0A48]();
}

uint64_t sub_20A8C1F20()
{
  return MEMORY[0x270EE0A58]();
}

uint64_t sub_20A8C1F30()
{
  return MEMORY[0x270EE0A78]();
}

uint64_t sub_20A8C1F40()
{
  return MEMORY[0x270EE0A90]();
}

uint64_t sub_20A8C1F50()
{
  return MEMORY[0x270EE0A98]();
}

uint64_t sub_20A8C1F60()
{
  return MEMORY[0x270EE0B70]();
}

uint64_t sub_20A8C1F70()
{
  return MEMORY[0x270EE0B80]();
}

uint64_t sub_20A8C1F80()
{
  return MEMORY[0x270EE0B90]();
}

uint64_t sub_20A8C1F90()
{
  return MEMORY[0x270EE0B98]();
}

uint64_t sub_20A8C1FA0()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_20A8C1FB0()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_20A8C1FC0()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_20A8C1FD0()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_20A8C1FF0()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_20A8C2000()
{
  return MEMORY[0x270EE19A0]();
}

uint64_t sub_20A8C2010()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_20A8C2020()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_20A8C2030()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_20A8C2040()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_20A8C2050()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_20A8C2060()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_20A8C2070()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_20A8C2080()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_20A8C2090()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_20A8C20A0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_20A8C20B0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_20A8C20C0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_20A8C20D0()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_20A8C20E0()
{
  return MEMORY[0x270EEE0E8]();
}

uint64_t sub_20A8C20F0()
{
  return MEMORY[0x270EEE100]();
}

uint64_t sub_20A8C2100()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_20A8C2110()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_20A8C2120()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_20A8C2130()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_20A8C2140()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_20A8C2150()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_20A8C2160()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_20A8C2170()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_20A8C2180()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_20A8C2190()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_20A8C21A0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_20A8C21B0()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_20A8C21C0()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_20A8C21D0()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_20A8C21E0()
{
  return MEMORY[0x270EEE598]();
}

uint64_t sub_20A8C21F0()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_20A8C2200()
{
  return MEMORY[0x270EEE5E0]();
}

uint64_t sub_20A8C2210()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_20A8C2220()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_20A8C2230()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_20A8C2240()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_20A8C2250()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_20A8C2260()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_20A8C2270()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_20A8C2280()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_20A8C2290()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_20A8C22A0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_20A8C22B0()
{
  return MEMORY[0x270F816C8]();
}

uint64_t sub_20A8C22C0()
{
  return MEMORY[0x270F816D0]();
}

uint64_t sub_20A8C22D0()
{
  return MEMORY[0x270EEEC90]();
}

uint64_t sub_20A8C22E0()
{
  return MEMORY[0x270EEECA8]();
}

uint64_t sub_20A8C22F0()
{
  return MEMORY[0x270EEECD0]();
}

uint64_t sub_20A8C2300()
{
  return MEMORY[0x270EEECF8]();
}

uint64_t sub_20A8C2310()
{
  return MEMORY[0x270EEED08]();
}

uint64_t sub_20A8C2320()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_20A8C2330()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_20A8C2340()
{
  return MEMORY[0x270EEEE08]();
}

uint64_t sub_20A8C2350()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_20A8C2360()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_20A8C2370()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_20A8C23C0()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_20A8C23F0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20A8C2400()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_20A8C2420()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_20A8C2430()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_20A8C2440()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_20A8C2450()
{
  return MEMORY[0x270EEFB60]();
}

uint64_t sub_20A8C2460()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_20A8C2470()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_20A8C2480()
{
  return MEMORY[0x270F79E58]();
}

uint64_t sub_20A8C2490()
{
  return MEMORY[0x270F77E10]();
}

uint64_t sub_20A8C24A0()
{
  return MEMORY[0x270F77E18]();
}

uint64_t sub_20A8C24B0()
{
  return MEMORY[0x270F4E7A0]();
}

uint64_t sub_20A8C24C0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_20A8C24D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_20A8C24E0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_20A8C24F0()
{
  return MEMORY[0x270EEFE40]();
}

uint64_t sub_20A8C2500()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t sub_20A8C2510()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_20A8C2520()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_20A8C2530()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_20A8C2540()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_20A8C2550()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_20A8C2560()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_20A8C2570()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_20A8C2580()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_20A8C2590()
{
  return MEMORY[0x270EF0340]();
}

uint64_t sub_20A8C25A0()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_20A8C25B0()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_20A8C25C0()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_20A8C25D0()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_20A8C25E0()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_20A8C25F0()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_20A8C2600()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_20A8C2610()
{
  return MEMORY[0x270EF04D8]();
}

uint64_t sub_20A8C2620()
{
  return MEMORY[0x270EF04F0]();
}

uint64_t sub_20A8C2630()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_20A8C2640()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_20A8C2650()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_20A8C2660()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_20A8C2670()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_20A8C2680()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_20A8C2690()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_20A8C26A0()
{
  return MEMORY[0x270EF0630]();
}

uint64_t sub_20A8C26B0()
{
  return MEMORY[0x270EF0638]();
}

uint64_t sub_20A8C26C0()
{
  return MEMORY[0x270EF0650]();
}

uint64_t sub_20A8C26D0()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_20A8C26E0()
{
  return MEMORY[0x270EF06C8]();
}

uint64_t sub_20A8C26F0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_20A8C2700()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_20A8C2710()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_20A8C2720()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_20A8C2730()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_20A8C2740()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_20A8C2750()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_20A8C2760()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_20A8C2770()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_20A8C2780()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_20A8C2790()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_20A8C27A0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_20A8C27B0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_20A8C27C0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_20A8C27D0()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_20A8C27E0()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_20A8C27F0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_20A8C2800()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20A8C2810()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_20A8C2820()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_20A8C2830()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_20A8C2840()
{
  return MEMORY[0x270F79E88]();
}

uint64_t sub_20A8C2850()
{
  return MEMORY[0x270F79E90]();
}

uint64_t sub_20A8C2860()
{
  return MEMORY[0x270EF0D68]();
}

uint64_t sub_20A8C2870()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_20A8C2880()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_20A8C2890()
{
  return MEMORY[0x270EF0DA0]();
}

uint64_t sub_20A8C28A0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_20A8C28B0()
{
  return MEMORY[0x270EF0DC8]();
}

uint64_t sub_20A8C28C0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_20A8C28D0()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_20A8C28E0()
{
  return MEMORY[0x270EF0E08]();
}

uint64_t sub_20A8C28F0()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_20A8C2900()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_20A8C2910()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_20A8C2920()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_20A8C2930()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_20A8C2940()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_20A8C2950()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_20A8C2960()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_20A8C2970()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_20A8C2980()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_20A8C2990()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_20A8C29A0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_20A8C29B0()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_20A8C29C0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_20A8C29D0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_20A8C29E0()
{
  return MEMORY[0x270EF12A0]();
}

uint64_t sub_20A8C29F0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_20A8C2A00()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_20A8C2A10()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_20A8C2A20()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_20A8C2A30()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_20A8C2A40()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_20A8C2A50()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_20A8C2A60()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_20A8C2A70()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_20A8C2A80()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_20A8C2A90()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_20A8C2AA0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_20A8C2AB0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_20A8C2AC0()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_20A8C2AD0()
{
  return MEMORY[0x270EF15E0]();
}

uint64_t sub_20A8C2AE0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_20A8C2AF0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_20A8C2B00()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_20A8C2B10()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_20A8C2B20()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_20A8C2B30()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_20A8C2B40()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_20A8C2B50()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_20A8C2B60()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_20A8C2B70()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_20A8C2B80()
{
  return MEMORY[0x270FA1158]();
}

uint64_t sub_20A8C2B90()
{
  return MEMORY[0x270F77E20]();
}

uint64_t sub_20A8C2BA0()
{
  return MEMORY[0x270F77E28]();
}

uint64_t sub_20A8C2BB0()
{
  return MEMORY[0x270F77E50]();
}

uint64_t sub_20A8C2BC0()
{
  return MEMORY[0x270F77E58]();
}

uint64_t sub_20A8C2BD0()
{
  return MEMORY[0x270F77E90]();
}

uint64_t sub_20A8C2BE0()
{
  return MEMORY[0x270F77EA0]();
}

uint64_t sub_20A8C2BF0()
{
  return MEMORY[0x270F77EB8]();
}

uint64_t sub_20A8C2C00()
{
  return MEMORY[0x270F77EC0]();
}

uint64_t sub_20A8C2C10()
{
  return MEMORY[0x270F77ED0]();
}

uint64_t sub_20A8C2C20()
{
  return MEMORY[0x270F77ED8]();
}

uint64_t sub_20A8C2C30()
{
  return MEMORY[0x270F77EE0]();
}

uint64_t sub_20A8C2C40()
{
  return MEMORY[0x270F77EE8]();
}

uint64_t sub_20A8C2C50()
{
  return MEMORY[0x270F77F00]();
}

uint64_t sub_20A8C2C60()
{
  return MEMORY[0x270F77F10]();
}

uint64_t sub_20A8C2C70()
{
  return MEMORY[0x270F77F20]();
}

uint64_t sub_20A8C2C80()
{
  return MEMORY[0x270F77F28]();
}

uint64_t sub_20A8C2C90()
{
  return MEMORY[0x270F77F30]();
}

uint64_t sub_20A8C2CA0()
{
  return MEMORY[0x270F77F38]();
}

uint64_t sub_20A8C2CB0()
{
  return MEMORY[0x270F77F50]();
}

uint64_t sub_20A8C2CC0()
{
  return MEMORY[0x270F77F58]();
}

uint64_t sub_20A8C2CD0()
{
  return MEMORY[0x270F78000]();
}

uint64_t sub_20A8C2CE0()
{
  return MEMORY[0x270F78008]();
}

uint64_t sub_20A8C2CF0()
{
  return MEMORY[0x270F78010]();
}

uint64_t sub_20A8C2D00()
{
  return MEMORY[0x270F78018]();
}

uint64_t sub_20A8C2D10()
{
  return MEMORY[0x270F78020]();
}

uint64_t sub_20A8C2D20()
{
  return MEMORY[0x270F78028]();
}

uint64_t sub_20A8C2D30()
{
  return MEMORY[0x270F78030]();
}

uint64_t sub_20A8C2D40()
{
  return MEMORY[0x270F78038]();
}

uint64_t sub_20A8C2D50()
{
  return MEMORY[0x270F78040]();
}

uint64_t sub_20A8C2D60()
{
  return MEMORY[0x270F78048]();
}

uint64_t sub_20A8C2D70()
{
  return MEMORY[0x270F78050]();
}

uint64_t sub_20A8C2D80()
{
  return MEMORY[0x270F78058]();
}

uint64_t sub_20A8C2D90()
{
  return MEMORY[0x270F78060]();
}

uint64_t sub_20A8C2DA0()
{
  return MEMORY[0x270F780A0]();
}

uint64_t sub_20A8C2DB0()
{
  return MEMORY[0x270F780A8]();
}

uint64_t sub_20A8C2DC0()
{
  return MEMORY[0x270F780B0]();
}

uint64_t sub_20A8C2DD0()
{
  return MEMORY[0x270F780B8]();
}

uint64_t sub_20A8C2DE0()
{
  return MEMORY[0x270F780C0]();
}

uint64_t sub_20A8C2DF0()
{
  return MEMORY[0x270F780C8]();
}

uint64_t sub_20A8C2E00()
{
  return MEMORY[0x270F780D0]();
}

uint64_t sub_20A8C2E10()
{
  return MEMORY[0x270F780D8]();
}

uint64_t sub_20A8C2E20()
{
  return MEMORY[0x270F780E0]();
}

uint64_t sub_20A8C2E30()
{
  return MEMORY[0x270F780E8]();
}

uint64_t sub_20A8C2E40()
{
  return MEMORY[0x270F780F0]();
}

uint64_t sub_20A8C2E50()
{
  return MEMORY[0x270F780F8]();
}

uint64_t sub_20A8C2E60()
{
  return MEMORY[0x270F78100]();
}

uint64_t sub_20A8C2E70()
{
  return MEMORY[0x270F78108]();
}

uint64_t sub_20A8C2E80()
{
  return MEMORY[0x270F78110]();
}

uint64_t sub_20A8C2E90()
{
  return MEMORY[0x270F78118]();
}

uint64_t sub_20A8C2EA0()
{
  return MEMORY[0x270F78120]();
}

uint64_t sub_20A8C2EB0()
{
  return MEMORY[0x270F78128]();
}

uint64_t sub_20A8C2EC0()
{
  return MEMORY[0x270F781A0]();
}

uint64_t sub_20A8C2ED0()
{
  return MEMORY[0x270F781A8]();
}

uint64_t sub_20A8C2EE0()
{
  return MEMORY[0x270F781B0]();
}

uint64_t sub_20A8C2EF0()
{
  return MEMORY[0x270F781B8]();
}

uint64_t sub_20A8C2F00()
{
  return MEMORY[0x270F781C0]();
}

uint64_t sub_20A8C2F10()
{
  return MEMORY[0x270F781D0]();
}

uint64_t sub_20A8C2F20()
{
  return MEMORY[0x270F781D8]();
}

uint64_t sub_20A8C2F30()
{
  return MEMORY[0x270F781E0]();
}

uint64_t sub_20A8C2F40()
{
  return MEMORY[0x270F781E8]();
}

uint64_t sub_20A8C2F50()
{
  return MEMORY[0x270F781F0]();
}

uint64_t sub_20A8C2F60()
{
  return MEMORY[0x270F781F8]();
}

uint64_t sub_20A8C2F70()
{
  return MEMORY[0x270F78200]();
}

uint64_t sub_20A8C2F80()
{
  return MEMORY[0x270F78208]();
}

uint64_t sub_20A8C2F90()
{
  return MEMORY[0x270F78218]();
}

uint64_t sub_20A8C2FA0()
{
  return MEMORY[0x270F78238]();
}

uint64_t sub_20A8C2FB0()
{
  return MEMORY[0x270F78248]();
}

uint64_t sub_20A8C2FC0()
{
  return MEMORY[0x270F78250]();
}

uint64_t sub_20A8C2FD0()
{
  return MEMORY[0x270F78258]();
}

uint64_t sub_20A8C2FE0()
{
  return MEMORY[0x270F78278]();
}

uint64_t sub_20A8C2FF0()
{
  return MEMORY[0x270F78290]();
}

uint64_t sub_20A8C3000()
{
  return MEMORY[0x270F78298]();
}

uint64_t sub_20A8C3010()
{
  return MEMORY[0x270F782A0]();
}

uint64_t sub_20A8C3020()
{
  return MEMORY[0x270F782A8]();
}

uint64_t sub_20A8C3030()
{
  return MEMORY[0x270F782B8]();
}

uint64_t sub_20A8C3040()
{
  return MEMORY[0x270F782C0]();
}

uint64_t sub_20A8C3050()
{
  return MEMORY[0x270F782C8]();
}

uint64_t sub_20A8C3060()
{
  return MEMORY[0x270F782D0]();
}

uint64_t sub_20A8C3070()
{
  return MEMORY[0x270F782D8]();
}

uint64_t sub_20A8C3080()
{
  return MEMORY[0x270F782E8]();
}

uint64_t sub_20A8C3090()
{
  return MEMORY[0x270F782F8]();
}

uint64_t sub_20A8C30A0()
{
  return MEMORY[0x270F78308]();
}

uint64_t sub_20A8C30B0()
{
  return MEMORY[0x270F78310]();
}

uint64_t sub_20A8C30C0()
{
  return MEMORY[0x270F78318]();
}

uint64_t sub_20A8C30D0()
{
  return MEMORY[0x270F78328]();
}

uint64_t sub_20A8C30E0()
{
  return MEMORY[0x270F78330]();
}

uint64_t sub_20A8C30F0()
{
  return MEMORY[0x270F78338]();
}

uint64_t sub_20A8C3100()
{
  return MEMORY[0x270F78340]();
}

uint64_t sub_20A8C3110()
{
  return MEMORY[0x270F78350]();
}

uint64_t sub_20A8C3120()
{
  return MEMORY[0x270F78358]();
}

uint64_t sub_20A8C3130()
{
  return MEMORY[0x270F78360]();
}

uint64_t sub_20A8C3140()
{
  return MEMORY[0x270F78368]();
}

uint64_t sub_20A8C3150()
{
  return MEMORY[0x270F78378]();
}

uint64_t sub_20A8C3160()
{
  return MEMORY[0x270F78380]();
}

uint64_t sub_20A8C3170()
{
  return MEMORY[0x270F78388]();
}

uint64_t sub_20A8C3180()
{
  return MEMORY[0x270F78390]();
}

uint64_t sub_20A8C3190()
{
  return MEMORY[0x270F78398]();
}

uint64_t sub_20A8C31A0()
{
  return MEMORY[0x270F783A0]();
}

uint64_t sub_20A8C31B0()
{
  return MEMORY[0x270F783A8]();
}

uint64_t sub_20A8C31C0()
{
  return MEMORY[0x270F783B0]();
}

uint64_t sub_20A8C31D0()
{
  return MEMORY[0x270F783E8]();
}

uint64_t sub_20A8C31E0()
{
  return MEMORY[0x270F783F8]();
}

uint64_t sub_20A8C31F0()
{
  return MEMORY[0x270F78400]();
}

uint64_t sub_20A8C3200()
{
  return MEMORY[0x270F78410]();
}

uint64_t sub_20A8C3210()
{
  return MEMORY[0x270F78418]();
}

uint64_t sub_20A8C3220()
{
  return MEMORY[0x270F78420]();
}

uint64_t sub_20A8C3230()
{
  return MEMORY[0x270F78430]();
}

uint64_t sub_20A8C3240()
{
  return MEMORY[0x270F78450]();
}

uint64_t sub_20A8C3250()
{
  return MEMORY[0x270F78458]();
}

uint64_t sub_20A8C3260()
{
  return MEMORY[0x270F78460]();
}

uint64_t sub_20A8C3270()
{
  return MEMORY[0x270F78468]();
}

uint64_t sub_20A8C3280()
{
  return MEMORY[0x270F78470]();
}

uint64_t sub_20A8C3290()
{
  return MEMORY[0x270F78478]();
}

uint64_t sub_20A8C32A0()
{
  return MEMORY[0x270F78480]();
}

uint64_t sub_20A8C32B0()
{
  return MEMORY[0x270F78488]();
}

uint64_t sub_20A8C32C0()
{
  return MEMORY[0x270F78490]();
}

uint64_t sub_20A8C32D0()
{
  return MEMORY[0x270F78498]();
}

uint64_t sub_20A8C32E0()
{
  return MEMORY[0x270F784A0]();
}

uint64_t sub_20A8C32F0()
{
  return MEMORY[0x270F784B0]();
}

uint64_t sub_20A8C3300()
{
  return MEMORY[0x270F784B8]();
}

uint64_t sub_20A8C3310()
{
  return MEMORY[0x270F784C8]();
}

uint64_t sub_20A8C3320()
{
  return MEMORY[0x270F784D0]();
}

uint64_t sub_20A8C3330()
{
  return MEMORY[0x270F784D8]();
}

uint64_t sub_20A8C3340()
{
  return MEMORY[0x270F784E0]();
}

uint64_t sub_20A8C3350()
{
  return MEMORY[0x270F784E8]();
}

uint64_t sub_20A8C3360()
{
  return MEMORY[0x270F784F8]();
}

uint64_t sub_20A8C3370()
{
  return MEMORY[0x270F78500]();
}

uint64_t sub_20A8C3380()
{
  return MEMORY[0x270F78508]();
}

uint64_t sub_20A8C3390()
{
  return MEMORY[0x270F78510]();
}

uint64_t sub_20A8C33A0()
{
  return MEMORY[0x270F78518]();
}

uint64_t sub_20A8C33B0()
{
  return MEMORY[0x270F78520]();
}

uint64_t sub_20A8C33C0()
{
  return MEMORY[0x270F78528]();
}

uint64_t sub_20A8C33D0()
{
  return MEMORY[0x270F78530]();
}

uint64_t sub_20A8C33E0()
{
  return MEMORY[0x270F78560]();
}

uint64_t sub_20A8C33F0()
{
  return MEMORY[0x270F78568]();
}

uint64_t sub_20A8C3400()
{
  return MEMORY[0x270F78570]();
}

uint64_t sub_20A8C3410()
{
  return MEMORY[0x270F78578]();
}

uint64_t sub_20A8C3420()
{
  return MEMORY[0x270F78580]();
}

uint64_t sub_20A8C3430()
{
  return MEMORY[0x270F78588]();
}

uint64_t sub_20A8C3440()
{
  return MEMORY[0x270F78590]();
}

uint64_t sub_20A8C3450()
{
  return MEMORY[0x270F78598]();
}

uint64_t sub_20A8C3460()
{
  return MEMORY[0x270F785A0]();
}

uint64_t sub_20A8C3470()
{
  return MEMORY[0x270F785A8]();
}

uint64_t sub_20A8C3480()
{
  return MEMORY[0x270F785B0]();
}

uint64_t sub_20A8C3490()
{
  return MEMORY[0x270F785B8]();
}

uint64_t sub_20A8C34A0()
{
  return MEMORY[0x270F785C0]();
}

uint64_t sub_20A8C34B0()
{
  return MEMORY[0x270F785C8]();
}

uint64_t sub_20A8C34C0()
{
  return MEMORY[0x270F785D0]();
}

uint64_t sub_20A8C34D0()
{
  return MEMORY[0x270F785E0]();
}

uint64_t sub_20A8C34E0()
{
  return MEMORY[0x270F785E8]();
}

uint64_t sub_20A8C34F0()
{
  return MEMORY[0x270F785F0]();
}

uint64_t sub_20A8C3500()
{
  return MEMORY[0x270F785F8]();
}

uint64_t sub_20A8C3510()
{
  return MEMORY[0x270F78600]();
}

uint64_t sub_20A8C3520()
{
  return MEMORY[0x270F78608]();
}

uint64_t sub_20A8C3530()
{
  return MEMORY[0x270F78610]();
}

uint64_t sub_20A8C3540()
{
  return MEMORY[0x270F78618]();
}

uint64_t sub_20A8C3550()
{
  return MEMORY[0x270F78620]();
}

uint64_t sub_20A8C3560()
{
  return MEMORY[0x270F78628]();
}

uint64_t sub_20A8C3570()
{
  return MEMORY[0x270F78630]();
}

uint64_t sub_20A8C3580()
{
  return MEMORY[0x270F78638]();
}

uint64_t sub_20A8C3590()
{
  return MEMORY[0x270F78640]();
}

uint64_t sub_20A8C35A0()
{
  return MEMORY[0x270F78648]();
}

uint64_t sub_20A8C35B0()
{
  return MEMORY[0x270F78650]();
}

uint64_t sub_20A8C35C0()
{
  return MEMORY[0x270F78658]();
}

uint64_t sub_20A8C35D0()
{
  return MEMORY[0x270F78660]();
}

uint64_t sub_20A8C35E0()
{
  return MEMORY[0x270F78668]();
}

uint64_t sub_20A8C35F0()
{
  return MEMORY[0x270F78670]();
}

uint64_t sub_20A8C3600()
{
  return MEMORY[0x270F78678]();
}

uint64_t sub_20A8C3610()
{
  return MEMORY[0x270F78680]();
}

uint64_t sub_20A8C3620()
{
  return MEMORY[0x270F78688]();
}

uint64_t sub_20A8C3630()
{
  return MEMORY[0x270F78690]();
}

uint64_t sub_20A8C3640()
{
  return MEMORY[0x270F78698]();
}

uint64_t sub_20A8C3650()
{
  return MEMORY[0x270F786A0]();
}

uint64_t sub_20A8C3660()
{
  return MEMORY[0x270F786A8]();
}

uint64_t sub_20A8C3670()
{
  return MEMORY[0x270F786B0]();
}

uint64_t sub_20A8C3680()
{
  return MEMORY[0x270F786B8]();
}

uint64_t sub_20A8C3690()
{
  return MEMORY[0x270F786C0]();
}

uint64_t sub_20A8C36A0()
{
  return MEMORY[0x270F786C8]();
}

uint64_t sub_20A8C36B0()
{
  return MEMORY[0x270F786D0]();
}

uint64_t sub_20A8C36C0()
{
  return MEMORY[0x270F786D8]();
}

uint64_t sub_20A8C36D0()
{
  return MEMORY[0x270F786E0]();
}

uint64_t sub_20A8C36F0()
{
  return MEMORY[0x270F786F0]();
}

uint64_t sub_20A8C3700()
{
  return MEMORY[0x270F786F8]();
}

uint64_t sub_20A8C3710()
{
  return MEMORY[0x270F78700]();
}

uint64_t sub_20A8C3720()
{
  return MEMORY[0x270F78708]();
}

uint64_t sub_20A8C3730()
{
  return MEMORY[0x270F78730]();
}

uint64_t sub_20A8C3740()
{
  return MEMORY[0x270F78738]();
}

uint64_t sub_20A8C3750()
{
  return MEMORY[0x270F78740]();
}

uint64_t sub_20A8C3760()
{
  return MEMORY[0x270F78748]();
}

uint64_t sub_20A8C3770()
{
  return MEMORY[0x270F78750]();
}

uint64_t sub_20A8C3780()
{
  return MEMORY[0x270F78758]();
}

uint64_t sub_20A8C3790()
{
  return MEMORY[0x270F78770]();
}

uint64_t sub_20A8C37A0()
{
  return MEMORY[0x270F78778]();
}

uint64_t sub_20A8C37B0()
{
  return MEMORY[0x270F78788]();
}

uint64_t sub_20A8C37C0()
{
  return MEMORY[0x270F78790]();
}

uint64_t sub_20A8C37D0()
{
  return MEMORY[0x270F787B0]();
}

uint64_t sub_20A8C37E0()
{
  return MEMORY[0x270F787B8]();
}

uint64_t sub_20A8C37F0()
{
  return MEMORY[0x270F787C0]();
}

uint64_t sub_20A8C3800()
{
  return MEMORY[0x270F787C8]();
}

uint64_t sub_20A8C3810()
{
  return MEMORY[0x270F787D0]();
}

uint64_t sub_20A8C3820()
{
  return MEMORY[0x270F787D8]();
}

uint64_t sub_20A8C3830()
{
  return MEMORY[0x270F787E0]();
}

uint64_t sub_20A8C3840()
{
  return MEMORY[0x270F787E8]();
}

uint64_t sub_20A8C3850()
{
  return MEMORY[0x270F787F0]();
}

uint64_t sub_20A8C3860()
{
  return MEMORY[0x270F787F8]();
}

uint64_t sub_20A8C3870()
{
  return MEMORY[0x270F78800]();
}

uint64_t sub_20A8C3880()
{
  return MEMORY[0x270F78808]();
}

uint64_t sub_20A8C3890()
{
  return MEMORY[0x270F78810]();
}

uint64_t sub_20A8C38A0()
{
  return MEMORY[0x270F78820]();
}

uint64_t sub_20A8C38B0()
{
  return MEMORY[0x270F78830]();
}

uint64_t sub_20A8C38C0()
{
  return MEMORY[0x270F78838]();
}

uint64_t sub_20A8C38D0()
{
  return MEMORY[0x270F78840]();
}

uint64_t sub_20A8C38E0()
{
  return MEMORY[0x270F78850]();
}

uint64_t sub_20A8C38F0()
{
  return MEMORY[0x270F78858]();
}

uint64_t sub_20A8C3900()
{
  return MEMORY[0x270F78860]();
}

uint64_t sub_20A8C3910()
{
  return MEMORY[0x270F78870]();
}

uint64_t sub_20A8C3920()
{
  return MEMORY[0x270F78878]();
}

uint64_t sub_20A8C3930()
{
  return MEMORY[0x270F78888]();
}

uint64_t sub_20A8C3940()
{
  return MEMORY[0x270F78890]();
}

uint64_t sub_20A8C3970()
{
  return MEMORY[0x270F788C0]();
}

uint64_t sub_20A8C3980()
{
  return MEMORY[0x270F788C8]();
}

uint64_t sub_20A8C3990()
{
  return MEMORY[0x270F788D0]();
}

uint64_t sub_20A8C39A0()
{
  return MEMORY[0x270F788E0]();
}

uint64_t sub_20A8C39B0()
{
  return MEMORY[0x270F788E8]();
}

uint64_t sub_20A8C39C0()
{
  return MEMORY[0x270F788F0]();
}

uint64_t sub_20A8C39D0()
{
  return MEMORY[0x270F788F8]();
}

uint64_t sub_20A8C39E0()
{
  return MEMORY[0x270F78900]();
}

uint64_t sub_20A8C39F0()
{
  return MEMORY[0x270F78908]();
}

uint64_t sub_20A8C3A00()
{
  return MEMORY[0x270F78910]();
}

uint64_t sub_20A8C3A10()
{
  return MEMORY[0x270F78918]();
}

uint64_t sub_20A8C3A20()
{
  return MEMORY[0x270F78920]();
}

uint64_t sub_20A8C3A30()
{
  return MEMORY[0x270F78928]();
}

uint64_t sub_20A8C3A40()
{
  return MEMORY[0x270F78930]();
}

uint64_t sub_20A8C3A50()
{
  return MEMORY[0x270F78938]();
}

uint64_t sub_20A8C3A60()
{
  return MEMORY[0x270F78940]();
}

uint64_t sub_20A8C3A70()
{
  return MEMORY[0x270F78948]();
}

uint64_t sub_20A8C3A80()
{
  return MEMORY[0x270F78958]();
}

uint64_t sub_20A8C3A90()
{
  return MEMORY[0x270F78960]();
}

uint64_t sub_20A8C3AA0()
{
  return MEMORY[0x270F78968]();
}

uint64_t sub_20A8C3AB0()
{
  return MEMORY[0x270F78970]();
}

uint64_t sub_20A8C3AC0()
{
  return MEMORY[0x270F78978]();
}

uint64_t sub_20A8C3AD0()
{
  return MEMORY[0x270F78980]();
}

uint64_t sub_20A8C3AE0()
{
  return MEMORY[0x270F78988]();
}

uint64_t sub_20A8C3AF0()
{
  return MEMORY[0x270F789A8]();
}

uint64_t sub_20A8C3B00()
{
  return MEMORY[0x270F789B0]();
}

uint64_t sub_20A8C3B10()
{
  return MEMORY[0x270F789B8]();
}

uint64_t sub_20A8C3B20()
{
  return MEMORY[0x270F789C0]();
}

uint64_t sub_20A8C3B30()
{
  return MEMORY[0x270F789C8]();
}

uint64_t sub_20A8C3B40()
{
  return MEMORY[0x270F789D0]();
}

uint64_t sub_20A8C3B50()
{
  return MEMORY[0x270F789D8]();
}

uint64_t sub_20A8C3B60()
{
  return MEMORY[0x270F789E0]();
}

uint64_t sub_20A8C3B70()
{
  return MEMORY[0x270F789E8]();
}

uint64_t sub_20A8C3B80()
{
  return MEMORY[0x270F789F0]();
}

uint64_t sub_20A8C3B90()
{
  return MEMORY[0x270F789F8]();
}

uint64_t sub_20A8C3BA0()
{
  return MEMORY[0x270F78A50]();
}

uint64_t sub_20A8C3BB0()
{
  return MEMORY[0x270F78A58]();
}

uint64_t sub_20A8C3BC0()
{
  return MEMORY[0x270F78A60]();
}

uint64_t sub_20A8C3BD0()
{
  return MEMORY[0x270F78A68]();
}

uint64_t sub_20A8C3BE0()
{
  return MEMORY[0x270F78A70]();
}

uint64_t sub_20A8C3BF0()
{
  return MEMORY[0x270F78A78]();
}

uint64_t sub_20A8C3C00()
{
  return MEMORY[0x270F78A80]();
}

uint64_t sub_20A8C3C20()
{
  return MEMORY[0x270F78AB8]();
}

uint64_t sub_20A8C3C30()
{
  return MEMORY[0x270F78AC0]();
}

uint64_t sub_20A8C3C40()
{
  return MEMORY[0x270F78AC8]();
}

uint64_t sub_20A8C3C50()
{
  return MEMORY[0x270F78AD0]();
}

uint64_t sub_20A8C3C60()
{
  return MEMORY[0x270F78AD8]();
}

uint64_t sub_20A8C3C70()
{
  return MEMORY[0x270F78AE0]();
}

uint64_t sub_20A8C3C80()
{
  return MEMORY[0x270F78B00]();
}

uint64_t sub_20A8C3C90()
{
  return MEMORY[0x270F78B08]();
}

uint64_t sub_20A8C3CA0()
{
  return MEMORY[0x270F78B10]();
}

uint64_t sub_20A8C3CB0()
{
  return MEMORY[0x270F78B18]();
}

uint64_t sub_20A8C3CC0()
{
  return MEMORY[0x270F78B20]();
}

uint64_t sub_20A8C3CD0()
{
  return MEMORY[0x270F78B28]();
}

uint64_t sub_20A8C3CE0()
{
  return MEMORY[0x270F78B30]();
}

uint64_t sub_20A8C3CF0()
{
  return MEMORY[0x270F78B38]();
}

uint64_t sub_20A8C3D00()
{
  return MEMORY[0x270F78B40]();
}

uint64_t sub_20A8C3D10()
{
  return MEMORY[0x270F78B48]();
}

uint64_t sub_20A8C3D20()
{
  return MEMORY[0x270F78B50]();
}

uint64_t sub_20A8C3D30()
{
  return MEMORY[0x270F78B58]();
}

uint64_t sub_20A8C3D40()
{
  return MEMORY[0x270F78B70]();
}

uint64_t sub_20A8C3D50()
{
  return MEMORY[0x270F78B78]();
}

uint64_t sub_20A8C3D60()
{
  return MEMORY[0x270F78B80]();
}

uint64_t sub_20A8C3D70()
{
  return MEMORY[0x270F78B88]();
}

uint64_t sub_20A8C3D80()
{
  return MEMORY[0x270F78B90]();
}

uint64_t sub_20A8C3D90()
{
  return MEMORY[0x270F78B98]();
}

uint64_t sub_20A8C3DA0()
{
  return MEMORY[0x270F78BA8]();
}

uint64_t sub_20A8C3DB0()
{
  return MEMORY[0x270F78BB0]();
}

uint64_t sub_20A8C3DC0()
{
  return MEMORY[0x270F78BB8]();
}

uint64_t sub_20A8C3DD0()
{
  return MEMORY[0x270F78BC0]();
}

uint64_t sub_20A8C3DE0()
{
  return MEMORY[0x270F78BC8]();
}

uint64_t sub_20A8C3DF0()
{
  return MEMORY[0x270F78BD0]();
}

uint64_t sub_20A8C3E00()
{
  return MEMORY[0x270F78BD8]();
}

uint64_t sub_20A8C3E10()
{
  return MEMORY[0x270F78BE0]();
}

uint64_t sub_20A8C3E20()
{
  return MEMORY[0x270F78BE8]();
}

uint64_t sub_20A8C3E30()
{
  return MEMORY[0x270F78BF8]();
}

uint64_t sub_20A8C3E40()
{
  return MEMORY[0x270F78C00]();
}

uint64_t sub_20A8C3E50()
{
  return MEMORY[0x270F78C08]();
}

uint64_t sub_20A8C3E60()
{
  return MEMORY[0x270F78C10]();
}

uint64_t sub_20A8C3E70()
{
  return MEMORY[0x270F78C18]();
}

uint64_t sub_20A8C3E80()
{
  return MEMORY[0x270F78C20]();
}

uint64_t sub_20A8C3E90()
{
  return MEMORY[0x270F78C28]();
}

uint64_t sub_20A8C3EA0()
{
  return MEMORY[0x270F78C30]();
}

uint64_t sub_20A8C3EB0()
{
  return MEMORY[0x270F78C38]();
}

uint64_t sub_20A8C3EC0()
{
  return MEMORY[0x270F78C40]();
}

uint64_t sub_20A8C3ED0()
{
  return MEMORY[0x270F78C48]();
}

uint64_t sub_20A8C3EE0()
{
  return MEMORY[0x270F78C50]();
}

uint64_t sub_20A8C3EF0()
{
  return MEMORY[0x270F78C58]();
}

uint64_t sub_20A8C3F00()
{
  return MEMORY[0x270F78C60]();
}

uint64_t sub_20A8C3F10()
{
  return MEMORY[0x270F78C68]();
}

uint64_t sub_20A8C3F20()
{
  return MEMORY[0x270F78C70]();
}

uint64_t sub_20A8C3F30()
{
  return MEMORY[0x270F78C78]();
}

uint64_t sub_20A8C3F40()
{
  return MEMORY[0x270F78C80]();
}

uint64_t sub_20A8C3F50()
{
  return MEMORY[0x270F78C90]();
}

uint64_t sub_20A8C3F60()
{
  return MEMORY[0x270F78C98]();
}

uint64_t sub_20A8C3F70()
{
  return MEMORY[0x270F78CA0]();
}

uint64_t sub_20A8C3F80()
{
  return MEMORY[0x270F78CB8]();
}

uint64_t sub_20A8C3F90()
{
  return MEMORY[0x270F78CC0]();
}

uint64_t sub_20A8C3FA0()
{
  return MEMORY[0x270F78CC8]();
}

uint64_t sub_20A8C3FB0()
{
  return MEMORY[0x270F78CD0]();
}

uint64_t sub_20A8C3FC0()
{
  return MEMORY[0x270F78CD8]();
}

uint64_t sub_20A8C3FD0()
{
  return MEMORY[0x270F78CE0]();
}

uint64_t sub_20A8C3FE0()
{
  return MEMORY[0x270F78CE8]();
}

uint64_t sub_20A8C3FF0()
{
  return MEMORY[0x270F78CF0]();
}

uint64_t sub_20A8C4000()
{
  return MEMORY[0x270F78CF8]();
}

uint64_t sub_20A8C4010()
{
  return MEMORY[0x270F78D00]();
}

uint64_t sub_20A8C4020()
{
  return MEMORY[0x270F78D08]();
}

uint64_t sub_20A8C4030()
{
  return MEMORY[0x270F78D10]();
}

uint64_t sub_20A8C4040()
{
  return MEMORY[0x270F78D18]();
}

uint64_t sub_20A8C4050()
{
  return MEMORY[0x270F78D20]();
}

uint64_t sub_20A8C4060()
{
  return MEMORY[0x270F78D28]();
}

uint64_t sub_20A8C4070()
{
  return MEMORY[0x270F78D30]();
}

uint64_t sub_20A8C4080()
{
  return MEMORY[0x270F78D38]();
}

uint64_t sub_20A8C4090()
{
  return MEMORY[0x270F78D40]();
}

uint64_t sub_20A8C40A0()
{
  return MEMORY[0x270F78D48]();
}

uint64_t sub_20A8C40B0()
{
  return MEMORY[0x270F78D50]();
}

uint64_t sub_20A8C40C0()
{
  return MEMORY[0x270F78D58]();
}

uint64_t sub_20A8C40D0()
{
  return MEMORY[0x270F78D60]();
}

uint64_t sub_20A8C40E0()
{
  return MEMORY[0x270F78D68]();
}

uint64_t sub_20A8C40F0()
{
  return MEMORY[0x270F78D78]();
}

uint64_t sub_20A8C4100()
{
  return MEMORY[0x270F78D80]();
}

uint64_t sub_20A8C4110()
{
  return MEMORY[0x270F78D90]();
}

uint64_t sub_20A8C4120()
{
  return MEMORY[0x270F78D98]();
}

uint64_t sub_20A8C4130()
{
  return MEMORY[0x270F4F170]();
}

uint64_t sub_20A8C4140()
{
  return MEMORY[0x270F77528]();
}

uint64_t sub_20A8C4150()
{
  return MEMORY[0x270F77530]();
}

uint64_t sub_20A8C4160()
{
  return MEMORY[0x270F77538]();
}

uint64_t sub_20A8C4170()
{
  return MEMORY[0x270F501D0]();
}

uint64_t sub_20A8C4180()
{
  return MEMORY[0x270F7A878]();
}

uint64_t sub_20A8C4190()
{
  return MEMORY[0x270F4F1C0]();
}

uint64_t sub_20A8C41C0()
{
  return MEMORY[0x270F7A890]();
}

uint64_t sub_20A8C41D0()
{
  return MEMORY[0x270F7A898]();
}

uint64_t sub_20A8C41E0()
{
  return MEMORY[0x270F7A8A8]();
}

uint64_t sub_20A8C41F0()
{
  return MEMORY[0x270F7A8B8]();
}

uint64_t sub_20A8C4200()
{
  return MEMORY[0x270F7A8C0]();
}

uint64_t _s11TeaSettings0B0C8StocksUIE4TipsV8EarningsV15ConfigOverridesCfd_0()
{
  return MEMORY[0x270F7A8C8]();
}

uint64_t sub_20A8C4220()
{
  return MEMORY[0x270F7A8D8]();
}

uint64_t sub_20A8C4230()
{
  return MEMORY[0x270F7A8E0]();
}

uint64_t sub_20A8C4240()
{
  return MEMORY[0x270F7A8E8]();
}

uint64_t sub_20A8C4250()
{
  return MEMORY[0x270F7A8F0]();
}

uint64_t sub_20A8C4260()
{
  return MEMORY[0x270F7A920]();
}

uint64_t sub_20A8C4270()
{
  return MEMORY[0x270F7A928]();
}

uint64_t sub_20A8C4280()
{
  return MEMORY[0x270F7A930]();
}

uint64_t sub_20A8C4290()
{
  return MEMORY[0x270F7A938]();
}

uint64_t sub_20A8C42A0()
{
  return MEMORY[0x270F7A950]();
}

uint64_t sub_20A8C42B0()
{
  return MEMORY[0x270F7A958]();
}

uint64_t sub_20A8C42C0()
{
  return MEMORY[0x270F7A960]();
}

uint64_t sub_20A8C42D0()
{
  return MEMORY[0x270F7A968]();
}

uint64_t sub_20A8C42E0()
{
  return MEMORY[0x270F7A970]();
}

uint64_t sub_20A8C42F0()
{
  return MEMORY[0x270F7A9A8]();
}

uint64_t sub_20A8C4320()
{
  return MEMORY[0x270F7A9C0]();
}

uint64_t sub_20A8C4330()
{
  return MEMORY[0x270F7A9E0]();
}

uint64_t sub_20A8C4340()
{
  return MEMORY[0x270F7A9E8]();
}

uint64_t sub_20A8C4350()
{
  return MEMORY[0x270F7A9F0]();
}

uint64_t sub_20A8C4360()
{
  return MEMORY[0x270F7A9F8]();
}

uint64_t sub_20A8C4370()
{
  return MEMORY[0x270F7AA00]();
}

uint64_t sub_20A8C4380()
{
  return MEMORY[0x270F7AA08]();
}

uint64_t sub_20A8C4390()
{
  return MEMORY[0x270F7AA10]();
}

uint64_t sub_20A8C43A0()
{
  return MEMORY[0x270F7AA18]();
}

uint64_t sub_20A8C43B0()
{
  return MEMORY[0x270F7AA20]();
}

uint64_t sub_20A8C43C0()
{
  return MEMORY[0x270F7AA28]();
}

uint64_t sub_20A8C43D0()
{
  return MEMORY[0x270F7AA30]();
}

uint64_t sub_20A8C43F0()
{
  return MEMORY[0x270F7AA40]();
}

uint64_t sub_20A8C4400()
{
  return MEMORY[0x270F7AA48]();
}

uint64_t sub_20A8C4410()
{
  return MEMORY[0x270F7AA50]();
}

uint64_t sub_20A8C4420()
{
  return MEMORY[0x270F7AA58]();
}

uint64_t sub_20A8C4430()
{
  return MEMORY[0x270F7AA60]();
}

uint64_t sub_20A8C4440()
{
  return MEMORY[0x270F7AA68]();
}

uint64_t sub_20A8C4450()
{
  return MEMORY[0x270F7AA70]();
}

uint64_t sub_20A8C4460()
{
  return MEMORY[0x270F0C230]();
}

uint64_t sub_20A8C4470()
{
  return MEMORY[0x270F0C238]();
}

uint64_t sub_20A8C4480()
{
  return MEMORY[0x270F0C240]();
}

uint64_t sub_20A8C4490()
{
  return MEMORY[0x270F0C248]();
}

uint64_t sub_20A8C44A0()
{
  return MEMORY[0x270F0C250]();
}

uint64_t sub_20A8C44B0()
{
  return MEMORY[0x270F0C2A8]();
}

uint64_t sub_20A8C44C0()
{
  return MEMORY[0x270F0C2B0]();
}

uint64_t sub_20A8C44D0()
{
  return MEMORY[0x270F0C2B8]();
}

uint64_t sub_20A8C44E0()
{
  return MEMORY[0x270F0C2C0]();
}

uint64_t sub_20A8C44F0()
{
  return MEMORY[0x270F0C2C8]();
}

uint64_t sub_20A8C4500()
{
  return MEMORY[0x270F0C2D0]();
}

uint64_t sub_20A8C4510()
{
  return MEMORY[0x270F0C308]();
}

uint64_t sub_20A8C4520()
{
  return MEMORY[0x270F0C318]();
}

uint64_t sub_20A8C4530()
{
  return MEMORY[0x270F0C320]();
}

uint64_t sub_20A8C4540()
{
  return MEMORY[0x270F77540]();
}

uint64_t sub_20A8C4550()
{
  return MEMORY[0x270F0C330]();
}

uint64_t sub_20A8C4560()
{
  return MEMORY[0x270F0C348]();
}

uint64_t sub_20A8C4570()
{
  return MEMORY[0x270F0C350]();
}

uint64_t sub_20A8C4580()
{
  return MEMORY[0x270F0C358]();
}

uint64_t sub_20A8C4590()
{
  return MEMORY[0x270F0C360]();
}

uint64_t sub_20A8C45A0()
{
  return MEMORY[0x270F0C368]();
}

uint64_t sub_20A8C45B0()
{
  return MEMORY[0x270F0C370]();
}

uint64_t sub_20A8C45C0()
{
  return MEMORY[0x270F0C378]();
}

uint64_t sub_20A8C45D0()
{
  return MEMORY[0x270F0C380]();
}

uint64_t sub_20A8C45E0()
{
  return MEMORY[0x270F0C388]();
}

uint64_t sub_20A8C45F0()
{
  return MEMORY[0x270F0C390]();
}

uint64_t sub_20A8C4600()
{
  return MEMORY[0x270F0C3C0]();
}

uint64_t sub_20A8C4610()
{
  return MEMORY[0x270F0C3C8]();
}

uint64_t sub_20A8C4620()
{
  return MEMORY[0x270F0C3D0]();
}

uint64_t sub_20A8C4630()
{
  return MEMORY[0x270F0C3E0]();
}

uint64_t sub_20A8C4640()
{
  return MEMORY[0x270F0C3E8]();
}

uint64_t sub_20A8C4650()
{
  return MEMORY[0x270F0C3F0]();
}

uint64_t sub_20A8C4660()
{
  return MEMORY[0x270F0C408]();
}

uint64_t sub_20A8C4670()
{
  return MEMORY[0x270F0C418]();
}

uint64_t sub_20A8C4680()
{
  return MEMORY[0x270F0C420]();
}

uint64_t sub_20A8C4690()
{
  return MEMORY[0x270F0C428]();
}

uint64_t sub_20A8C46A0()
{
  return MEMORY[0x270F0C430]();
}

uint64_t sub_20A8C46B0()
{
  return MEMORY[0x270F0C438]();
}

uint64_t sub_20A8C46C0()
{
  return MEMORY[0x270F0C440]();
}

uint64_t sub_20A8C46D0()
{
  return MEMORY[0x270F0C458]();
}

uint64_t sub_20A8C46E0()
{
  return MEMORY[0x270F0C468]();
}

uint64_t sub_20A8C46F0()
{
  return MEMORY[0x270F0C470]();
}

uint64_t sub_20A8C4700()
{
  return MEMORY[0x270F0C478]();
}

uint64_t sub_20A8C4780()
{
  return MEMORY[0x270F0C538]();
}

uint64_t sub_20A8C4790()
{
  return MEMORY[0x270F0C540]();
}

uint64_t sub_20A8C47A0()
{
  return MEMORY[0x270F0C548]();
}

uint64_t sub_20A8C47B0()
{
  return MEMORY[0x270F0C550]();
}

uint64_t sub_20A8C47C0()
{
  return MEMORY[0x270F0C558]();
}

uint64_t sub_20A8C47D0()
{
  return MEMORY[0x270F0C568]();
}

uint64_t sub_20A8C47E0()
{
  return MEMORY[0x270F0C570]();
}

uint64_t sub_20A8C47F0()
{
  return MEMORY[0x270F0C588]();
}

uint64_t sub_20A8C4800()
{
  return MEMORY[0x270F0C590]();
}

uint64_t sub_20A8C4810()
{
  return MEMORY[0x270F0C5D0]();
}

uint64_t sub_20A8C4820()
{
  return MEMORY[0x270F0C5E0]();
}

uint64_t sub_20A8C4830()
{
  return MEMORY[0x270F0C5E8]();
}

uint64_t sub_20A8C4840()
{
  return MEMORY[0x270F0C610]();
}

uint64_t sub_20A8C4850()
{
  return MEMORY[0x270F0C658]();
}

uint64_t sub_20A8C4860()
{
  return MEMORY[0x270F0C668]();
}

uint64_t sub_20A8C4870()
{
  return MEMORY[0x270F0C678]();
}

uint64_t sub_20A8C4880()
{
  return MEMORY[0x270F0C688]();
}

uint64_t sub_20A8C4890()
{
  return MEMORY[0x270F77548]();
}

uint64_t sub_20A8C48A0()
{
  return MEMORY[0x270F0C690]();
}

uint64_t sub_20A8C48B0()
{
  return MEMORY[0x270F0C698]();
}

uint64_t sub_20A8C48C0()
{
  return MEMORY[0x270F0C6A0]();
}

uint64_t sub_20A8C48D0()
{
  return MEMORY[0x270F0C6A8]();
}

uint64_t sub_20A8C48E0()
{
  return MEMORY[0x270F0C6B0]();
}

uint64_t sub_20A8C48F0()
{
  return MEMORY[0x270F0C6B8]();
}

uint64_t sub_20A8C4900()
{
  return MEMORY[0x270F0C6C0]();
}

uint64_t sub_20A8C4910()
{
  return MEMORY[0x270F0C6C8]();
}

uint64_t sub_20A8C4920()
{
  return MEMORY[0x270F0C6D0]();
}

uint64_t sub_20A8C4930()
{
  return MEMORY[0x270F0C6E0]();
}

uint64_t sub_20A8C4940()
{
  return MEMORY[0x270F0C6E8]();
}

uint64_t sub_20A8C4950()
{
  return MEMORY[0x270F0C6F0]();
}

uint64_t sub_20A8C4960()
{
  return MEMORY[0x270F0C6F8]();
}

uint64_t sub_20A8C4970()
{
  return MEMORY[0x270F0C700]();
}

uint64_t sub_20A8C4980()
{
  return MEMORY[0x270F0C708]();
}

uint64_t sub_20A8C4990()
{
  return MEMORY[0x270F0C710]();
}

uint64_t sub_20A8C49A0()
{
  return MEMORY[0x270F0C728]();
}

uint64_t sub_20A8C49B0()
{
  return MEMORY[0x270F0C730]();
}

uint64_t sub_20A8C49C0()
{
  return MEMORY[0x270F0C748]();
}

uint64_t sub_20A8C49D0()
{
  return MEMORY[0x270F0C750]();
}

uint64_t sub_20A8C49E0()
{
  return MEMORY[0x270F7AAC8]();
}

uint64_t sub_20A8C49F0()
{
  return MEMORY[0x270F7AAD0]();
}

uint64_t sub_20A8C4A00()
{
  return MEMORY[0x270F7AAD8]();
}

uint64_t sub_20A8C4A10()
{
  return MEMORY[0x270F4E7A8]();
}

uint64_t sub_20A8C4A20()
{
  return MEMORY[0x270F4E7B0]();
}

uint64_t sub_20A8C4A30()
{
  return MEMORY[0x270F4E7B8]();
}

uint64_t sub_20A8C4A40()
{
  return MEMORY[0x270F4E7C0]();
}

uint64_t sub_20A8C4A50()
{
  return MEMORY[0x270F4E7C8]();
}

uint64_t sub_20A8C4A60()
{
  return MEMORY[0x270F4E7D0]();
}

uint64_t sub_20A8C4A70()
{
  return MEMORY[0x270F4E7D8]();
}

uint64_t sub_20A8C4A80()
{
  return MEMORY[0x270F4E7E0]();
}

uint64_t sub_20A8C4A90()
{
  return MEMORY[0x270F4E7E8]();
}

uint64_t sub_20A8C4AA0()
{
  return MEMORY[0x270F4E7F0]();
}

uint64_t sub_20A8C4AB0()
{
  return MEMORY[0x270F4E7F8]();
}

uint64_t sub_20A8C4AC0()
{
  return MEMORY[0x270F4E800]();
}

uint64_t sub_20A8C4AD0()
{
  return MEMORY[0x270F4E808]();
}

uint64_t sub_20A8C4AE0()
{
  return MEMORY[0x270F4E810]();
}

uint64_t sub_20A8C4AF0()
{
  return MEMORY[0x270F4E818]();
}

uint64_t sub_20A8C4B00()
{
  return MEMORY[0x270F4E820]();
}

uint64_t sub_20A8C4B10()
{
  return MEMORY[0x270F4E828]();
}

uint64_t sub_20A8C4B20()
{
  return MEMORY[0x270F4E830]();
}

uint64_t sub_20A8C4B30()
{
  return MEMORY[0x270F4E838]();
}

uint64_t sub_20A8C4B40()
{
  return MEMORY[0x270F4E840]();
}

uint64_t sub_20A8C4B50()
{
  return MEMORY[0x270F4E848]();
}

uint64_t sub_20A8C4B60()
{
  return MEMORY[0x270F4E850]();
}

uint64_t sub_20A8C4B70()
{
  return MEMORY[0x270F4E858]();
}

uint64_t sub_20A8C4B80()
{
  return MEMORY[0x270F4E860]();
}

uint64_t sub_20A8C4B90()
{
  return MEMORY[0x270F4E868]();
}

uint64_t sub_20A8C4BA0()
{
  return MEMORY[0x270F4E870]();
}

uint64_t sub_20A8C4BB0()
{
  return MEMORY[0x270F4E878]();
}

uint64_t sub_20A8C4BC0()
{
  return MEMORY[0x270F4E880]();
}

uint64_t sub_20A8C4BD0()
{
  return MEMORY[0x270F4E888]();
}

uint64_t sub_20A8C4BE0()
{
  return MEMORY[0x270F4E890]();
}

uint64_t sub_20A8C4BF0()
{
  return MEMORY[0x270F4E898]();
}

uint64_t sub_20A8C4C00()
{
  return MEMORY[0x270F4E8A0]();
}

uint64_t sub_20A8C4C10()
{
  return MEMORY[0x270F4E8A8]();
}

uint64_t sub_20A8C4C20()
{
  return MEMORY[0x270F4E8B0]();
}

uint64_t sub_20A8C4C30()
{
  return MEMORY[0x270F4E8B8]();
}

uint64_t sub_20A8C4C40()
{
  return MEMORY[0x270F4E8C0]();
}

uint64_t sub_20A8C4C50()
{
  return MEMORY[0x270F4E8C8]();
}

uint64_t sub_20A8C4C60()
{
  return MEMORY[0x270F4E8D0]();
}

uint64_t sub_20A8C4C70()
{
  return MEMORY[0x270F4E8D8]();
}

uint64_t sub_20A8C4C80()
{
  return MEMORY[0x270F4E8E0]();
}

uint64_t sub_20A8C4C90()
{
  return MEMORY[0x270F4E8E8]();
}

uint64_t sub_20A8C4CA0()
{
  return MEMORY[0x270F4E8F0]();
}

uint64_t sub_20A8C4CB0()
{
  return MEMORY[0x270F4E8F8]();
}

uint64_t sub_20A8C4CC0()
{
  return MEMORY[0x270F4E900]();
}

uint64_t sub_20A8C4CD0()
{
  return MEMORY[0x270F4E908]();
}

uint64_t sub_20A8C4CE0()
{
  return MEMORY[0x270F4E910]();
}

uint64_t sub_20A8C4CF0()
{
  return MEMORY[0x270F4E918]();
}

uint64_t sub_20A8C4D00()
{
  return MEMORY[0x270F4E920]();
}

uint64_t sub_20A8C4D10()
{
  return MEMORY[0x270F4E928]();
}

uint64_t sub_20A8C4D20()
{
  return MEMORY[0x270F4E930]();
}

uint64_t sub_20A8C4D30()
{
  return MEMORY[0x270F4E938]();
}

uint64_t sub_20A8C4D40()
{
  return MEMORY[0x270F4E948]();
}

uint64_t sub_20A8C4D50()
{
  return MEMORY[0x270F4E950]();
}

uint64_t sub_20A8C4D60()
{
  return MEMORY[0x270F4E958]();
}

uint64_t sub_20A8C4D70()
{
  return MEMORY[0x270F4E960]();
}

uint64_t sub_20A8C4D80()
{
  return MEMORY[0x270F4E968]();
}

uint64_t sub_20A8C4D90()
{
  return MEMORY[0x270F4E970]();
}

uint64_t sub_20A8C4DA0()
{
  return MEMORY[0x270F4E978]();
}

uint64_t sub_20A8C4DB0()
{
  return MEMORY[0x270F4E980]();
}

uint64_t sub_20A8C4DC0()
{
  return MEMORY[0x270F4E988]();
}

uint64_t sub_20A8C4DD0()
{
  return MEMORY[0x270F4E990]();
}

uint64_t sub_20A8C4DE0()
{
  return MEMORY[0x270F4E998]();
}

uint64_t sub_20A8C4DF0()
{
  return MEMORY[0x270F4E9A0]();
}

uint64_t sub_20A8C4E00()
{
  return MEMORY[0x270F4E9A8]();
}

uint64_t sub_20A8C4E10()
{
  return MEMORY[0x270F4E9B0]();
}

uint64_t sub_20A8C4E20()
{
  return MEMORY[0x270F4E9B8]();
}

uint64_t sub_20A8C4E30()
{
  return MEMORY[0x270F4E9C0]();
}

uint64_t sub_20A8C4E40()
{
  return MEMORY[0x270F4E9C8]();
}

uint64_t sub_20A8C4E50()
{
  return MEMORY[0x270F4E9D0]();
}

uint64_t sub_20A8C4E60()
{
  return MEMORY[0x270F4E9D8]();
}

uint64_t sub_20A8C4E70()
{
  return MEMORY[0x270F4E9E0]();
}

uint64_t sub_20A8C4E80()
{
  return MEMORY[0x270F4E9E8]();
}

uint64_t sub_20A8C4E90()
{
  return MEMORY[0x270F4E9F0]();
}

uint64_t sub_20A8C4EA0()
{
  return MEMORY[0x270F4E9F8]();
}

uint64_t sub_20A8C4EB0()
{
  return MEMORY[0x270F4EA00]();
}

uint64_t sub_20A8C4EC0()
{
  return MEMORY[0x270F4EA08]();
}

uint64_t sub_20A8C4ED0()
{
  return MEMORY[0x270F4EA10]();
}

uint64_t sub_20A8C4EE0()
{
  return MEMORY[0x270F4EA18]();
}

uint64_t sub_20A8C4EF0()
{
  return MEMORY[0x270F4EA20]();
}

uint64_t sub_20A8C4F00()
{
  return MEMORY[0x270F4EA28]();
}

uint64_t sub_20A8C4F10()
{
  return MEMORY[0x270F4EA30]();
}

uint64_t sub_20A8C4F20()
{
  return MEMORY[0x270F4EA38]();
}

uint64_t sub_20A8C4F30()
{
  return MEMORY[0x270F4EA40]();
}

uint64_t sub_20A8C4F40()
{
  return MEMORY[0x270F4EA48]();
}

uint64_t sub_20A8C4F50()
{
  return MEMORY[0x270F4EA50]();
}

uint64_t sub_20A8C4F60()
{
  return MEMORY[0x270F4EA58]();
}

uint64_t sub_20A8C4F70()
{
  return MEMORY[0x270F4EA60]();
}

uint64_t sub_20A8C4F80()
{
  return MEMORY[0x270F4EA68]();
}

uint64_t sub_20A8C4F90()
{
  return MEMORY[0x270F4EA70]();
}

uint64_t sub_20A8C4FA0()
{
  return MEMORY[0x270F4EA78]();
}

uint64_t sub_20A8C4FB0()
{
  return MEMORY[0x270F4EA80]();
}

uint64_t sub_20A8C4FC0()
{
  return MEMORY[0x270F4EA88]();
}

uint64_t sub_20A8C4FD0()
{
  return MEMORY[0x270F4EA90]();
}

uint64_t sub_20A8C4FE0()
{
  return MEMORY[0x270F4EA98]();
}

uint64_t sub_20A8C4FF0()
{
  return MEMORY[0x270F4EAA0]();
}

uint64_t sub_20A8C5000()
{
  return MEMORY[0x270F4EAA8]();
}

uint64_t sub_20A8C5010()
{
  return MEMORY[0x270F4EAB0]();
}

uint64_t sub_20A8C5020()
{
  return MEMORY[0x270F4EAB8]();
}

uint64_t sub_20A8C5030()
{
  return MEMORY[0x270F4EAC0]();
}

uint64_t sub_20A8C5040()
{
  return MEMORY[0x270F4EAC8]();
}

uint64_t sub_20A8C5050()
{
  return MEMORY[0x270F4EAD0]();
}

uint64_t sub_20A8C5060()
{
  return MEMORY[0x270F4EAD8]();
}

uint64_t sub_20A8C5070()
{
  return MEMORY[0x270F4EAE0]();
}

uint64_t sub_20A8C5080()
{
  return MEMORY[0x270F4EAE8]();
}

uint64_t sub_20A8C5090()
{
  return MEMORY[0x270F4EAF0]();
}

uint64_t sub_20A8C50A0()
{
  return MEMORY[0x270F4EAF8]();
}

uint64_t sub_20A8C50B0()
{
  return MEMORY[0x270F4EB00]();
}

uint64_t sub_20A8C50C0()
{
  return MEMORY[0x270F4EB08]();
}

uint64_t sub_20A8C50D0()
{
  return MEMORY[0x270F4EB10]();
}

uint64_t sub_20A8C50E0()
{
  return MEMORY[0x270F4EB18]();
}

uint64_t sub_20A8C50F0()
{
  return MEMORY[0x270F4EB20]();
}

uint64_t sub_20A8C5100()
{
  return MEMORY[0x270F4EB28]();
}

uint64_t sub_20A8C5110()
{
  return MEMORY[0x270F4EB30]();
}

uint64_t sub_20A8C5120()
{
  return MEMORY[0x270F4EB38]();
}

uint64_t sub_20A8C5130()
{
  return MEMORY[0x270F4EB40]();
}

uint64_t sub_20A8C5140()
{
  return MEMORY[0x270F4EB48]();
}

uint64_t sub_20A8C5150()
{
  return MEMORY[0x270F4EB50]();
}

uint64_t sub_20A8C5160()
{
  return MEMORY[0x270F4EB58]();
}

uint64_t sub_20A8C5170()
{
  return MEMORY[0x270F4EB60]();
}

uint64_t sub_20A8C5180()
{
  return MEMORY[0x270F4EB68]();
}

uint64_t sub_20A8C5190()
{
  return MEMORY[0x270F4EB70]();
}

uint64_t sub_20A8C51A0()
{
  return MEMORY[0x270F4EB78]();
}

uint64_t sub_20A8C51B0()
{
  return MEMORY[0x270F4EB80]();
}

uint64_t sub_20A8C51C0()
{
  return MEMORY[0x270F4EB88]();
}

uint64_t sub_20A8C51D0()
{
  return MEMORY[0x270F4EB90]();
}

uint64_t sub_20A8C51E0()
{
  return MEMORY[0x270F4EB98]();
}

uint64_t sub_20A8C51F0()
{
  return MEMORY[0x270F4EBA0]();
}

uint64_t sub_20A8C5200()
{
  return MEMORY[0x270F4EBA8]();
}

uint64_t sub_20A8C5210()
{
  return MEMORY[0x270F4EBB0]();
}

uint64_t sub_20A8C5220()
{
  return MEMORY[0x270F4EBB8]();
}

uint64_t sub_20A8C5230()
{
  return MEMORY[0x270F4EBC0]();
}

uint64_t sub_20A8C5240()
{
  return MEMORY[0x270F4EBC8]();
}

uint64_t sub_20A8C5250()
{
  return MEMORY[0x270F4EBD0]();
}

uint64_t sub_20A8C5260()
{
  return MEMORY[0x270F4EBD8]();
}

uint64_t sub_20A8C5270()
{
  return MEMORY[0x270F4EBE0]();
}

uint64_t sub_20A8C5280()
{
  return MEMORY[0x270F4EBE8]();
}

uint64_t sub_20A8C5290()
{
  return MEMORY[0x270F4EBF0]();
}

uint64_t sub_20A8C52A0()
{
  return MEMORY[0x270F4EBF8]();
}

uint64_t sub_20A8C52B0()
{
  return MEMORY[0x270F4EC00]();
}

uint64_t sub_20A8C52C0()
{
  return MEMORY[0x270F4EC08]();
}

uint64_t sub_20A8C52D0()
{
  return MEMORY[0x270F4EC10]();
}

uint64_t sub_20A8C52E0()
{
  return MEMORY[0x270F4EC18]();
}

uint64_t sub_20A8C52F0()
{
  return MEMORY[0x270F4EC20]();
}

uint64_t sub_20A8C5300()
{
  return MEMORY[0x270F4EC28]();
}

uint64_t sub_20A8C5310()
{
  return MEMORY[0x270F4EC30]();
}

uint64_t sub_20A8C5320()
{
  return MEMORY[0x270F4EC38]();
}

uint64_t sub_20A8C5330()
{
  return MEMORY[0x270F4EC40]();
}

uint64_t sub_20A8C5340()
{
  return MEMORY[0x270F4EC48]();
}

uint64_t sub_20A8C5350()
{
  return MEMORY[0x270F4EC50]();
}

uint64_t sub_20A8C5360()
{
  return MEMORY[0x270F4EC58]();
}

uint64_t sub_20A8C5370()
{
  return MEMORY[0x270F4EC60]();
}

uint64_t sub_20A8C5380()
{
  return MEMORY[0x270F4EC68]();
}

uint64_t sub_20A8C5390()
{
  return MEMORY[0x270F4EC70]();
}

uint64_t sub_20A8C53A0()
{
  return MEMORY[0x270F4EC78]();
}

uint64_t sub_20A8C53B0()
{
  return MEMORY[0x270F4EC80]();
}

uint64_t sub_20A8C53C0()
{
  return MEMORY[0x270F4EC88]();
}

uint64_t sub_20A8C53D0()
{
  return MEMORY[0x270F4EC90]();
}

uint64_t sub_20A8C53E0()
{
  return MEMORY[0x270F4EC98]();
}

uint64_t sub_20A8C53F0()
{
  return MEMORY[0x270F4ECA0]();
}

uint64_t sub_20A8C5400()
{
  return MEMORY[0x270F4ECA8]();
}

uint64_t sub_20A8C5410()
{
  return MEMORY[0x270F4ECB0]();
}

uint64_t sub_20A8C5420()
{
  return MEMORY[0x270F4ECB8]();
}

uint64_t sub_20A8C5430()
{
  return MEMORY[0x270F4ECC0]();
}

uint64_t sub_20A8C5440()
{
  return MEMORY[0x270F4ECC8]();
}

uint64_t sub_20A8C5450()
{
  return MEMORY[0x270F4ECD0]();
}

uint64_t sub_20A8C5460()
{
  return MEMORY[0x270F4ECD8]();
}

uint64_t sub_20A8C5470()
{
  return MEMORY[0x270F4ECE0]();
}

uint64_t sub_20A8C5480()
{
  return MEMORY[0x270F4ECE8]();
}

uint64_t sub_20A8C5490()
{
  return MEMORY[0x270F4ECF0]();
}

uint64_t sub_20A8C54A0()
{
  return MEMORY[0x270F4ECF8]();
}

uint64_t sub_20A8C54C0()
{
  return MEMORY[0x270F4ED08]();
}

uint64_t sub_20A8C54D0()
{
  return MEMORY[0x270F4ED10]();
}

uint64_t sub_20A8C54E0()
{
  return MEMORY[0x270F4ED18]();
}

uint64_t sub_20A8C54F0()
{
  return MEMORY[0x270F4ED20]();
}

uint64_t sub_20A8C5510()
{
  return MEMORY[0x270F4ED30]();
}

uint64_t sub_20A8C5520()
{
  return MEMORY[0x270F4ED38]();
}

uint64_t sub_20A8C5530()
{
  return MEMORY[0x270F4ED40]();
}

uint64_t sub_20A8C5540()
{
  return MEMORY[0x270F4ED48]();
}

uint64_t sub_20A8C5550()
{
  return MEMORY[0x270F4ED50]();
}

uint64_t sub_20A8C5560()
{
  return MEMORY[0x270F4ED58]();
}

uint64_t sub_20A8C5570()
{
  return MEMORY[0x270F4ED60]();
}

uint64_t sub_20A8C5580()
{
  return MEMORY[0x270F4ED68]();
}

uint64_t sub_20A8C5590()
{
  return MEMORY[0x270F4ED70]();
}

uint64_t sub_20A8C55A0()
{
  return MEMORY[0x270F4ED78]();
}

uint64_t sub_20A8C55B0()
{
  return MEMORY[0x270F4ED88]();
}

uint64_t sub_20A8C55C0()
{
  return MEMORY[0x270F4ED90]();
}

uint64_t sub_20A8C55D0()
{
  return MEMORY[0x270F4ED98]();
}

uint64_t sub_20A8C55E0()
{
  return MEMORY[0x270F4EDA0]();
}

uint64_t sub_20A8C55F0()
{
  return MEMORY[0x270F4EDA8]();
}

uint64_t sub_20A8C5600()
{
  return MEMORY[0x270F4EDB0]();
}

uint64_t sub_20A8C5610()
{
  return MEMORY[0x270F4EDB8]();
}

uint64_t sub_20A8C5620()
{
  return MEMORY[0x270F4EDC0]();
}

uint64_t sub_20A8C5630()
{
  return MEMORY[0x270F4EDC8]();
}

uint64_t sub_20A8C5640()
{
  return MEMORY[0x270F4EDD0]();
}

uint64_t sub_20A8C5650()
{
  return MEMORY[0x270F4EDD8]();
}

uint64_t sub_20A8C5660()
{
  return MEMORY[0x270F4EDE0]();
}

uint64_t sub_20A8C5670()
{
  return MEMORY[0x270F4EDE8]();
}

uint64_t sub_20A8C5680()
{
  return MEMORY[0x270F4EDF0]();
}

uint64_t sub_20A8C5690()
{
  return MEMORY[0x270F4EDF8]();
}

uint64_t sub_20A8C56A0()
{
  return MEMORY[0x270F4EE00]();
}

uint64_t sub_20A8C56B0()
{
  return MEMORY[0x270F4EE08]();
}

uint64_t sub_20A8C56C0()
{
  return MEMORY[0x270F4EE10]();
}

uint64_t sub_20A8C56D0()
{
  return MEMORY[0x270F4EE18]();
}

uint64_t sub_20A8C56E0()
{
  return MEMORY[0x270F4EE20]();
}

uint64_t sub_20A8C56F0()
{
  return MEMORY[0x270F4EE28]();
}

uint64_t sub_20A8C5700()
{
  return MEMORY[0x270F4EE30]();
}

uint64_t sub_20A8C5710()
{
  return MEMORY[0x270F4EE38]();
}

uint64_t sub_20A8C5720()
{
  return MEMORY[0x270F4EE40]();
}

uint64_t sub_20A8C5730()
{
  return MEMORY[0x270F4EE48]();
}

uint64_t sub_20A8C5740()
{
  return MEMORY[0x270F4EE50]();
}

uint64_t sub_20A8C5750()
{
  return MEMORY[0x270F4EE58]();
}

uint64_t sub_20A8C5760()
{
  return MEMORY[0x270F4EE60]();
}

uint64_t sub_20A8C5770()
{
  return MEMORY[0x270F4EE68]();
}

uint64_t sub_20A8C5780()
{
  return MEMORY[0x270F4EE70]();
}

uint64_t sub_20A8C5790()
{
  return MEMORY[0x270F4EE78]();
}

uint64_t sub_20A8C57A0()
{
  return MEMORY[0x270F4EE80]();
}

uint64_t sub_20A8C57B0()
{
  return MEMORY[0x270F4EE88]();
}

uint64_t sub_20A8C57C0()
{
  return MEMORY[0x270F4EE90]();
}

uint64_t sub_20A8C57D0()
{
  return MEMORY[0x270F4EE98]();
}

uint64_t sub_20A8C57E0()
{
  return MEMORY[0x270F4EEA0]();
}

uint64_t sub_20A8C57F0()
{
  return MEMORY[0x270F4EEA8]();
}

uint64_t sub_20A8C5800()
{
  return MEMORY[0x270F4EEB0]();
}

uint64_t sub_20A8C5810()
{
  return MEMORY[0x270F4EEB8]();
}

uint64_t sub_20A8C5820()
{
  return MEMORY[0x270F4EEC0]();
}

uint64_t sub_20A8C5830()
{
  return MEMORY[0x270F4EEC8]();
}

uint64_t sub_20A8C5840()
{
  return MEMORY[0x270F4EED0]();
}

uint64_t sub_20A8C5860()
{
  return MEMORY[0x270F4EEE0]();
}

uint64_t sub_20A8C5870()
{
  return MEMORY[0x270F4EEE8]();
}

uint64_t sub_20A8C5880()
{
  return MEMORY[0x270F4EEF0]();
}

uint64_t sub_20A8C5890()
{
  return MEMORY[0x270F4EEF8]();
}

uint64_t sub_20A8C58A0()
{
  return MEMORY[0x270F4EF00]();
}

uint64_t sub_20A8C58B0()
{
  return MEMORY[0x270F4EF08]();
}

uint64_t sub_20A8C58C0()
{
  return MEMORY[0x270F4EF10]();
}

uint64_t sub_20A8C58D0()
{
  return MEMORY[0x270F4EF18]();
}

uint64_t sub_20A8C58E0()
{
  return MEMORY[0x270F4EF20]();
}

uint64_t sub_20A8C58F0()
{
  return MEMORY[0x270F4EF28]();
}

uint64_t sub_20A8C5900()
{
  return MEMORY[0x270F4EF30]();
}

uint64_t sub_20A8C5910()
{
  return MEMORY[0x270F4EF38]();
}

uint64_t sub_20A8C5920()
{
  return MEMORY[0x270F4EF40]();
}

uint64_t sub_20A8C5930()
{
  return MEMORY[0x270F79E98]();
}

uint64_t sub_20A8C5940()
{
  return MEMORY[0x270F79EA0]();
}

uint64_t sub_20A8C5950()
{
  return MEMORY[0x270F79EA8]();
}

uint64_t sub_20A8C5960()
{
  return MEMORY[0x270F79EB0]();
}

uint64_t sub_20A8C5970()
{
  return MEMORY[0x270F79EB8]();
}

uint64_t sub_20A8C5980()
{
  return MEMORY[0x270F79EC0]();
}

uint64_t sub_20A8C5990()
{
  return MEMORY[0x270F79EC8]();
}

uint64_t sub_20A8C59A0()
{
  return MEMORY[0x270F79ED0]();
}

uint64_t sub_20A8C59B0()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_20A8C59C0()
{
  return MEMORY[0x270F79EE0]();
}

uint64_t sub_20A8C59D0()
{
  return MEMORY[0x270F79EE8]();
}

uint64_t sub_20A8C59E0()
{
  return MEMORY[0x270F79F28]();
}

uint64_t sub_20A8C59F0()
{
  return MEMORY[0x270F79F30]();
}

uint64_t sub_20A8C5A00()
{
  return MEMORY[0x270F79F40]();
}

uint64_t sub_20A8C5A10()
{
  return MEMORY[0x270F79F48]();
}

uint64_t sub_20A8C5A20()
{
  return MEMORY[0x270F79F50]();
}

uint64_t sub_20A8C5A30()
{
  return MEMORY[0x270F79F58]();
}

uint64_t sub_20A8C5A40()
{
  return MEMORY[0x270F79F60]();
}

uint64_t sub_20A8C5A50()
{
  return MEMORY[0x270F79F68]();
}

uint64_t sub_20A8C5A60()
{
  return MEMORY[0x270F79F70]();
}

uint64_t sub_20A8C5A70()
{
  return MEMORY[0x270F79F78]();
}

uint64_t sub_20A8C5A80()
{
  return MEMORY[0x270F79F80]();
}

uint64_t sub_20A8C5A90()
{
  return MEMORY[0x270F79F88]();
}

uint64_t sub_20A8C5AA0()
{
  return MEMORY[0x270F79F90]();
}

uint64_t sub_20A8C5AB0()
{
  return MEMORY[0x270F79F98]();
}

uint64_t sub_20A8C5AC0()
{
  return MEMORY[0x270F79FA0]();
}

uint64_t sub_20A8C5AD0()
{
  return MEMORY[0x270F79FA8]();
}

uint64_t sub_20A8C5AE0()
{
  return MEMORY[0x270F79FB0]();
}

uint64_t sub_20A8C5AF0()
{
  return MEMORY[0x270F79FB8]();
}

uint64_t sub_20A8C5B00()
{
  return MEMORY[0x270F79FC0]();
}

uint64_t sub_20A8C5B10()
{
  return MEMORY[0x270F7AAE0]();
}

uint64_t sub_20A8C5B20()
{
  return MEMORY[0x270F7AAE8]();
}

uint64_t sub_20A8C5B30()
{
  return MEMORY[0x270F79FC8]();
}

uint64_t sub_20A8C5B40()
{
  return MEMORY[0x270F79FD0]();
}

uint64_t sub_20A8C5B50()
{
  return MEMORY[0x270F79FD8]();
}

uint64_t sub_20A8C5B60()
{
  return MEMORY[0x270F79FE0]();
}

uint64_t sub_20A8C5B70()
{
  return MEMORY[0x270F79FE8]();
}

uint64_t sub_20A8C5B80()
{
  return MEMORY[0x270F79FF0]();
}

uint64_t sub_20A8C5B90()
{
  return MEMORY[0x270F79FF8]();
}

uint64_t sub_20A8C5BA0()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_20A8C5BB0()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_20A8C5BC0()
{
  return MEMORY[0x270F7A010]();
}

uint64_t sub_20A8C5BD0()
{
  return MEMORY[0x270F7A018]();
}

uint64_t sub_20A8C5BE0()
{
  return MEMORY[0x270F7A020]();
}

uint64_t sub_20A8C5BF0()
{
  return MEMORY[0x270F7A028]();
}

uint64_t sub_20A8C5C00()
{
  return MEMORY[0x270F7A030]();
}

uint64_t sub_20A8C5C10()
{
  return MEMORY[0x270F7A040]();
}

uint64_t sub_20A8C5C20()
{
  return MEMORY[0x270F7A068]();
}

uint64_t sub_20A8C5C30()
{
  return MEMORY[0x270F7A070]();
}

uint64_t sub_20A8C5C40()
{
  return MEMORY[0x270F7A078]();
}

uint64_t sub_20A8C5C50()
{
  return MEMORY[0x270F7A080]();
}

uint64_t sub_20A8C5C60()
{
  return MEMORY[0x270F7A088]();
}

uint64_t sub_20A8C5C70()
{
  return MEMORY[0x270F7A090]();
}

uint64_t sub_20A8C5C80()
{
  return MEMORY[0x270F7A098]();
}

uint64_t sub_20A8C5C90()
{
  return MEMORY[0x270F7A0A8]();
}

uint64_t sub_20A8C5CA0()
{
  return MEMORY[0x270F7A0B0]();
}

uint64_t sub_20A8C5CB0()
{
  return MEMORY[0x270F7A0B8]();
}

uint64_t sub_20A8C5CC0()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_20A8C5CD0()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_20A8C5CE0()
{
  return MEMORY[0x270F7A0D0]();
}

uint64_t sub_20A8C5CF0()
{
  return MEMORY[0x270F7A0D8]();
}

uint64_t sub_20A8C5D00()
{
  return MEMORY[0x270F7A0E0]();
}

uint64_t sub_20A8C5D10()
{
  return MEMORY[0x270F7A0E8]();
}

uint64_t sub_20A8C5D20()
{
  return MEMORY[0x270F7A0F0]();
}

uint64_t sub_20A8C5D30()
{
  return MEMORY[0x270F7A0F8]();
}

uint64_t sub_20A8C5D40()
{
  return MEMORY[0x270F7A100]();
}

uint64_t sub_20A8C5D50()
{
  return MEMORY[0x270F7A108]();
}

uint64_t sub_20A8C5D60()
{
  return MEMORY[0x270F7A110]();
}

uint64_t sub_20A8C5D70()
{
  return MEMORY[0x270F7A118]();
}

uint64_t sub_20A8C5D80()
{
  return MEMORY[0x270F7A120]();
}

uint64_t sub_20A8C5D90()
{
  return MEMORY[0x270F7A128]();
}

uint64_t sub_20A8C5DA0()
{
  return MEMORY[0x270F7A138]();
}

uint64_t sub_20A8C5DB0()
{
  return MEMORY[0x270F7A140]();
}

uint64_t sub_20A8C5DC0()
{
  return MEMORY[0x270F7A148]();
}

uint64_t sub_20A8C5DD0()
{
  return MEMORY[0x270F7A150]();
}

uint64_t sub_20A8C5DE0()
{
  return MEMORY[0x270F7A158]();
}

uint64_t sub_20A8C5DF0()
{
  return MEMORY[0x270F7A160]();
}

uint64_t sub_20A8C5E00()
{
  return MEMORY[0x270F7A168]();
}

uint64_t sub_20A8C5E10()
{
  return MEMORY[0x270F7A170]();
}

uint64_t sub_20A8C5E20()
{
  return MEMORY[0x270F7A178]();
}

uint64_t sub_20A8C5E30()
{
  return MEMORY[0x270F7A180]();
}

uint64_t sub_20A8C5E40()
{
  return MEMORY[0x270F7A188]();
}

uint64_t sub_20A8C5E50()
{
  return MEMORY[0x270F7A190]();
}

uint64_t sub_20A8C5E60()
{
  return MEMORY[0x270F7A198]();
}

uint64_t sub_20A8C5E70()
{
  return MEMORY[0x270F7A1A8]();
}

uint64_t sub_20A8C5E80()
{
  return MEMORY[0x270F7A1C0]();
}

uint64_t sub_20A8C5E90()
{
  return MEMORY[0x270F7A1C8]();
}

uint64_t sub_20A8C5EA0()
{
  return MEMORY[0x270F7A1D0]();
}

uint64_t sub_20A8C5EB0()
{
  return MEMORY[0x270F7A1D8]();
}

uint64_t sub_20A8C5EC0()
{
  return MEMORY[0x270F7A1E0]();
}

uint64_t sub_20A8C5ED0()
{
  return MEMORY[0x270F7A1E8]();
}

uint64_t sub_20A8C5EE0()
{
  return MEMORY[0x270F7A208]();
}

uint64_t sub_20A8C5EF0()
{
  return MEMORY[0x270F7A210]();
}

uint64_t sub_20A8C5F00()
{
  return MEMORY[0x270F7A218]();
}

uint64_t sub_20A8C5F10()
{
  return MEMORY[0x270F7A220]();
}

uint64_t sub_20A8C5F20()
{
  return MEMORY[0x270F7A228]();
}

uint64_t sub_20A8C5F30()
{
  return MEMORY[0x270F7A230]();
}

uint64_t sub_20A8C5F40()
{
  return MEMORY[0x270F7A238]();
}

uint64_t sub_20A8C5F50()
{
  return MEMORY[0x270F7A240]();
}

uint64_t sub_20A8C5F60()
{
  return MEMORY[0x270F7A248]();
}

uint64_t sub_20A8C5F70()
{
  return MEMORY[0x270F7A250]();
}

uint64_t sub_20A8C5F80()
{
  return MEMORY[0x270F7A258]();
}

uint64_t sub_20A8C5FB0()
{
  return MEMORY[0x270F7A280]();
}

uint64_t sub_20A8C5FD0()
{
  return MEMORY[0x270F7A290]();
}

uint64_t sub_20A8C5FE0()
{
  return MEMORY[0x270F7A298]();
}

uint64_t sub_20A8C5FF0()
{
  return MEMORY[0x270F7A2A0]();
}

uint64_t sub_20A8C6000()
{
  return MEMORY[0x270F7A2A8]();
}

uint64_t sub_20A8C6020()
{
  return MEMORY[0x270F7AAF0]();
}

uint64_t sub_20A8C6030()
{
  return MEMORY[0x270F77550]();
}

uint64_t sub_20A8C6040()
{
  return MEMORY[0x270F501D8]();
}

uint64_t sub_20A8C6050()
{
  return MEMORY[0x270F7A2C8]();
}

uint64_t sub_20A8C6060()
{
  return MEMORY[0x270F7AB00]();
}

uint64_t sub_20A8C6070()
{
  return MEMORY[0x270F7A2D8]();
}

uint64_t sub_20A8C6080()
{
  return MEMORY[0x270F7A2E0]();
}

uint64_t sub_20A8C6090()
{
  return MEMORY[0x270F7A2E8]();
}

uint64_t sub_20A8C60A0()
{
  return MEMORY[0x270F7A2F0]();
}

uint64_t sub_20A8C60B0()
{
  return MEMORY[0x270F7A2F8]();
}

uint64_t sub_20A8C60C0()
{
  return MEMORY[0x270F7A300]();
}

uint64_t sub_20A8C60D0()
{
  return MEMORY[0x270F7A308]();
}

uint64_t sub_20A8C60E0()
{
  return MEMORY[0x270F7A310]();
}

uint64_t sub_20A8C60F0()
{
  return MEMORY[0x270F7A318]();
}

uint64_t sub_20A8C6100()
{
  return MEMORY[0x270F7A320]();
}

uint64_t sub_20A8C6110()
{
  return MEMORY[0x270F4F1C8]();
}

uint64_t sub_20A8C6120()
{
  return MEMORY[0x270F4F1D0]();
}

uint64_t sub_20A8C6130()
{
  return MEMORY[0x270F4F1D8]();
}

uint64_t sub_20A8C6140()
{
  return MEMORY[0x270F7A328]();
}

uint64_t sub_20A8C6150()
{
  return MEMORY[0x270F7A330]();
}

uint64_t sub_20A8C6160()
{
  return MEMORY[0x270F7A350]();
}

uint64_t sub_20A8C6170()
{
  return MEMORY[0x270F7A358]();
}

uint64_t sub_20A8C6180()
{
  return MEMORY[0x270F7A360]();
}

uint64_t sub_20A8C6190()
{
  return MEMORY[0x270F7A368]();
}

uint64_t sub_20A8C61A0()
{
  return MEMORY[0x270F7A370]();
}

uint64_t sub_20A8C61B0()
{
  return MEMORY[0x270F7A378]();
}

uint64_t sub_20A8C61C0()
{
  return MEMORY[0x270F7A380]();
}

uint64_t sub_20A8C61D0()
{
  return MEMORY[0x270F7A390]();
}

uint64_t sub_20A8C61E0()
{
  return MEMORY[0x270F7A398]();
}

uint64_t sub_20A8C61F0()
{
  return MEMORY[0x270F7A3A0]();
}

uint64_t sub_20A8C6200()
{
  return MEMORY[0x270F7A3B0]();
}

uint64_t sub_20A8C6210()
{
  return MEMORY[0x270F7A3C8]();
}

uint64_t sub_20A8C6220()
{
  return MEMORY[0x270F7A3D0]();
}

uint64_t sub_20A8C6230()
{
  return MEMORY[0x270F7A3D8]();
}

uint64_t sub_20A8C6240()
{
  return MEMORY[0x270F7A3E0]();
}

uint64_t sub_20A8C6280()
{
  return MEMORY[0x270F7A418]();
}

uint64_t sub_20A8C6290()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_20A8C62A0()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_20A8C62B0()
{
  return MEMORY[0x270F7A438]();
}

uint64_t sub_20A8C62C0()
{
  return MEMORY[0x270F7A440]();
}

uint64_t sub_20A8C62D0()
{
  return MEMORY[0x270F7A460]();
}

uint64_t sub_20A8C62E0()
{
  return MEMORY[0x270F7A468]();
}

uint64_t sub_20A8C62F0()
{
  return MEMORY[0x270F7A480]();
}

uint64_t sub_20A8C6300()
{
  return MEMORY[0x270F7A488]();
}

uint64_t sub_20A8C6310()
{
  return MEMORY[0x270F7A498]();
}

uint64_t sub_20A8C6320()
{
  return MEMORY[0x270F7A4B0]();
}

uint64_t sub_20A8C6330()
{
  return MEMORY[0x270F7A4B8]();
}

uint64_t sub_20A8C6340()
{
  return MEMORY[0x270F7A4D0]();
}

uint64_t sub_20A8C6350()
{
  return MEMORY[0x270F7A4D8]();
}

uint64_t sub_20A8C6360()
{
  return MEMORY[0x270F7A4E0]();
}

uint64_t sub_20A8C6370()
{
  return MEMORY[0x270F7A4E8]();
}

uint64_t sub_20A8C6380()
{
  return MEMORY[0x270F7A4F0]();
}

uint64_t sub_20A8C6390()
{
  return MEMORY[0x270F7A4F8]();
}

uint64_t sub_20A8C63A0()
{
  return MEMORY[0x270F7A500]();
}

uint64_t sub_20A8C63B0()
{
  return MEMORY[0x270F7A528]();
}

uint64_t sub_20A8C63C0()
{
  return MEMORY[0x270F7A538]();
}

uint64_t sub_20A8C63D0()
{
  return MEMORY[0x270F7A540]();
}

uint64_t sub_20A8C63E0()
{
  return MEMORY[0x270F7A548]();
}

uint64_t sub_20A8C63F0()
{
  return MEMORY[0x270F7A550]();
}

uint64_t sub_20A8C6400()
{
  return MEMORY[0x270F7A558]();
}

uint64_t sub_20A8C6410()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_20A8C6420()
{
  return MEMORY[0x270F7A568]();
}

uint64_t sub_20A8C6430()
{
  return MEMORY[0x270F7A570]();
}

uint64_t sub_20A8C6440()
{
  return MEMORY[0x270F7A578]();
}

uint64_t sub_20A8C6450()
{
  return MEMORY[0x270F7A580]();
}

uint64_t sub_20A8C6460()
{
  return MEMORY[0x270F7A588]();
}

uint64_t sub_20A8C6470()
{
  return MEMORY[0x270F7A598]();
}

uint64_t sub_20A8C6480()
{
  return MEMORY[0x270F7A5A0]();
}

uint64_t sub_20A8C6490()
{
  return MEMORY[0x270F7A5A8]();
}

uint64_t sub_20A8C64A0()
{
  return MEMORY[0x270F7A5E0]();
}

uint64_t sub_20A8C64C0()
{
  return MEMORY[0x270F7A5F0]();
}

uint64_t sub_20A8C64D0()
{
  return MEMORY[0x270F7A5F8]();
}

uint64_t sub_20A8C64E0()
{
  return MEMORY[0x270F7A600]();
}

uint64_t sub_20A8C64F0()
{
  return MEMORY[0x270F7A608]();
}

uint64_t sub_20A8C6500()
{
  return MEMORY[0x270F7A610]();
}

uint64_t sub_20A8C6510()
{
  return MEMORY[0x270F7A618]();
}

uint64_t sub_20A8C6520()
{
  return MEMORY[0x270F7A620]();
}

uint64_t sub_20A8C6530()
{
  return MEMORY[0x270F7A628]();
}

uint64_t sub_20A8C6540()
{
  return MEMORY[0x270F7A630]();
}

uint64_t sub_20A8C6550()
{
  return MEMORY[0x270F7A638]();
}

uint64_t sub_20A8C6560()
{
  return MEMORY[0x270F7A640]();
}

uint64_t sub_20A8C6570()
{
  return MEMORY[0x270F7A648]();
}

uint64_t sub_20A8C6580()
{
  return MEMORY[0x270F7A650]();
}

uint64_t sub_20A8C6590()
{
  return MEMORY[0x270F7A658]();
}

uint64_t sub_20A8C65A0()
{
  return MEMORY[0x270F7A660]();
}

uint64_t sub_20A8C65B0()
{
  return MEMORY[0x270F7A668]();
}

uint64_t sub_20A8C65C0()
{
  return MEMORY[0x270F7A670]();
}

uint64_t sub_20A8C65D0()
{
  return MEMORY[0x270F7A680]();
}

uint64_t sub_20A8C65E0()
{
  return MEMORY[0x270F7A690]();
}

uint64_t sub_20A8C65F0()
{
  return MEMORY[0x270F7A698]();
}

uint64_t sub_20A8C6600()
{
  return MEMORY[0x270F7A6A0]();
}

uint64_t sub_20A8C6610()
{
  return MEMORY[0x270F7A6A8]();
}

uint64_t sub_20A8C6620()
{
  return MEMORY[0x270F7A6B0]();
}

uint64_t sub_20A8C6630()
{
  return MEMORY[0x270F7A6B8]();
}

uint64_t sub_20A8C6640()
{
  return MEMORY[0x270F7A6C0]();
}

uint64_t sub_20A8C6650()
{
  return MEMORY[0x270F7A6C8]();
}

uint64_t sub_20A8C6660()
{
  return MEMORY[0x270F7A6D8]();
}

uint64_t sub_20A8C6670()
{
  return MEMORY[0x270F7A6E0]();
}

uint64_t sub_20A8C6690()
{
  return MEMORY[0x270F7A760]();
}

uint64_t sub_20A8C66A0()
{
  return MEMORY[0x270F7A778]();
}

uint64_t sub_20A8C66F0()
{
  return MEMORY[0x270F4F198]();
}

uint64_t sub_20A8C6700()
{
  return MEMORY[0x270F4F1A0]();
}

uint64_t sub_20A8C6710()
{
  return MEMORY[0x270F4F1A8]();
}

uint64_t sub_20A8C6720()
{
  return MEMORY[0x270F77558]();
}

uint64_t sub_20A8C6730()
{
  return MEMORY[0x270F77560]();
}

uint64_t sub_20A8C6740()
{
  return MEMORY[0x270F77568]();
}

uint64_t sub_20A8C6750()
{
  return MEMORY[0x270F77570]();
}

uint64_t sub_20A8C6760()
{
  return MEMORY[0x270F77578]();
}

uint64_t sub_20A8C6770()
{
  return MEMORY[0x270F77580]();
}

uint64_t sub_20A8C6780()
{
  return MEMORY[0x270F77588]();
}

uint64_t sub_20A8C6790()
{
  return MEMORY[0x270F77590]();
}

uint64_t sub_20A8C67A0()
{
  return MEMORY[0x270F77598]();
}

uint64_t sub_20A8C67B0()
{
  return MEMORY[0x270F775A0]();
}

uint64_t sub_20A8C67C0()
{
  return MEMORY[0x270F775A8]();
}

uint64_t sub_20A8C67D0()
{
  return MEMORY[0x270F775B0]();
}

uint64_t sub_20A8C67E0()
{
  return MEMORY[0x270F775B8]();
}

uint64_t sub_20A8C67F0()
{
  return MEMORY[0x270F775C0]();
}

uint64_t sub_20A8C6800()
{
  return MEMORY[0x270F775C8]();
}

uint64_t sub_20A8C6810()
{
  return MEMORY[0x270F775D0]();
}

uint64_t sub_20A8C6820()
{
  return MEMORY[0x270F775D8]();
}

uint64_t sub_20A8C6830()
{
  return MEMORY[0x270F775E0]();
}

uint64_t sub_20A8C6840()
{
  return MEMORY[0x270F775E8]();
}

uint64_t sub_20A8C6850()
{
  return MEMORY[0x270F775F0]();
}

uint64_t sub_20A8C6860()
{
  return MEMORY[0x270F775F8]();
}

uint64_t sub_20A8C6870()
{
  return MEMORY[0x270F77600]();
}

uint64_t sub_20A8C6890()
{
  return MEMORY[0x270F77610]();
}

uint64_t sub_20A8C68A0()
{
  return MEMORY[0x270F77618]();
}

uint64_t sub_20A8C68B0()
{
  return MEMORY[0x270F77620]();
}

uint64_t sub_20A8C68C0()
{
  return MEMORY[0x270F77628]();
}

uint64_t sub_20A8C68D0()
{
  return MEMORY[0x270F77630]();
}

uint64_t sub_20A8C68E0()
{
  return MEMORY[0x270F77638]();
}

uint64_t sub_20A8C68F0()
{
  return MEMORY[0x270F77640]();
}

uint64_t sub_20A8C6900()
{
  return MEMORY[0x270F77648]();
}

uint64_t sub_20A8C6910()
{
  return MEMORY[0x270F77650]();
}

uint64_t sub_20A8C6920()
{
  return MEMORY[0x270F77658]();
}

uint64_t sub_20A8C6930()
{
  return MEMORY[0x270F77660]();
}

uint64_t sub_20A8C6940()
{
  return MEMORY[0x270F77668]();
}

uint64_t sub_20A8C6950()
{
  return MEMORY[0x270F77670]();
}

uint64_t sub_20A8C6960()
{
  return MEMORY[0x270F77678]();
}

uint64_t sub_20A8C6970()
{
  return MEMORY[0x270F77680]();
}

uint64_t sub_20A8C6980()
{
  return MEMORY[0x270F77688]();
}

uint64_t sub_20A8C6990()
{
  return MEMORY[0x270F77690]();
}

uint64_t sub_20A8C69A0()
{
  return MEMORY[0x270F77698]();
}

uint64_t sub_20A8C69B0()
{
  return MEMORY[0x270F776A0]();
}

uint64_t sub_20A8C69C0()
{
  return MEMORY[0x270F776A8]();
}

uint64_t sub_20A8C69D0()
{
  return MEMORY[0x270F776B0]();
}

uint64_t sub_20A8C69E0()
{
  return MEMORY[0x270F776B8]();
}

uint64_t sub_20A8C69F0()
{
  return MEMORY[0x270F776C0]();
}

uint64_t sub_20A8C6A00()
{
  return MEMORY[0x270F776C8]();
}

uint64_t sub_20A8C6A10()
{
  return MEMORY[0x270F776D0]();
}

uint64_t sub_20A8C6A20()
{
  return MEMORY[0x270F776D8]();
}

uint64_t sub_20A8C6A30()
{
  return MEMORY[0x270F776E0]();
}

uint64_t sub_20A8C6A40()
{
  return MEMORY[0x270F776E8]();
}

uint64_t sub_20A8C6A50()
{
  return MEMORY[0x270F776F0]();
}

uint64_t sub_20A8C6A60()
{
  return MEMORY[0x270F776F8]();
}

uint64_t sub_20A8C6A70()
{
  return MEMORY[0x270F77700]();
}

uint64_t sub_20A8C6A80()
{
  return MEMORY[0x270F77708]();
}

uint64_t sub_20A8C6A90()
{
  return MEMORY[0x270F77710]();
}

uint64_t sub_20A8C6AA0()
{
  return MEMORY[0x270F77718]();
}

uint64_t sub_20A8C6AB0()
{
  return MEMORY[0x270F77720]();
}

uint64_t sub_20A8C6AC0()
{
  return MEMORY[0x270F77728]();
}

uint64_t sub_20A8C6AD0()
{
  return MEMORY[0x270F77730]();
}

uint64_t sub_20A8C6AE0()
{
  return MEMORY[0x270F77738]();
}

uint64_t sub_20A8C6AF0()
{
  return MEMORY[0x270F77740]();
}

uint64_t sub_20A8C6B00()
{
  return MEMORY[0x270F77748]();
}

uint64_t sub_20A8C6B10()
{
  return MEMORY[0x270F77750]();
}

uint64_t sub_20A8C6B20()
{
  return MEMORY[0x270F77758]();
}

uint64_t sub_20A8C6B30()
{
  return MEMORY[0x270F77760]();
}

uint64_t sub_20A8C6B40()
{
  return MEMORY[0x270F77768]();
}

uint64_t sub_20A8C6B50()
{
  return MEMORY[0x270F77770]();
}

uint64_t sub_20A8C6B60()
{
  return MEMORY[0x270F77778]();
}

uint64_t sub_20A8C6B70()
{
  return MEMORY[0x270F77780]();
}

uint64_t sub_20A8C6B80()
{
  return MEMORY[0x270F77788]();
}

uint64_t sub_20A8C6B90()
{
  return MEMORY[0x270F77790]();
}

uint64_t sub_20A8C6BA0()
{
  return MEMORY[0x270F77798]();
}

uint64_t sub_20A8C6BB0()
{
  return MEMORY[0x270F777A0]();
}

uint64_t sub_20A8C6BC0()
{
  return MEMORY[0x270F777A8]();
}

uint64_t sub_20A8C6BD0()
{
  return MEMORY[0x270F777B0]();
}

uint64_t sub_20A8C6BE0()
{
  return MEMORY[0x270F777B8]();
}

uint64_t sub_20A8C6BF0()
{
  return MEMORY[0x270F777C0]();
}

uint64_t sub_20A8C6C00()
{
  return MEMORY[0x270F777C8]();
}

uint64_t sub_20A8C6C10()
{
  return MEMORY[0x270F777D0]();
}

uint64_t sub_20A8C6C20()
{
  return MEMORY[0x270F777D8]();
}

uint64_t sub_20A8C6C30()
{
  return MEMORY[0x270F777E0]();
}

uint64_t sub_20A8C6C40()
{
  return MEMORY[0x270F777E8]();
}

uint64_t sub_20A8C6C50()
{
  return MEMORY[0x270F777F0]();
}

uint64_t sub_20A8C6C60()
{
  return MEMORY[0x270F777F8]();
}

uint64_t sub_20A8C6C70()
{
  return MEMORY[0x270F77800]();
}

uint64_t sub_20A8C6C80()
{
  return MEMORY[0x270F77808]();
}

uint64_t sub_20A8C6C90()
{
  return MEMORY[0x270F77810]();
}

uint64_t sub_20A8C6CA0()
{
  return MEMORY[0x270F77818]();
}

uint64_t sub_20A8C6CB0()
{
  return MEMORY[0x270F77820]();
}

uint64_t sub_20A8C6CC0()
{
  return MEMORY[0x270F77828]();
}

uint64_t sub_20A8C6CD0()
{
  return MEMORY[0x270F77830]();
}

uint64_t sub_20A8C6CE0()
{
  return MEMORY[0x270F77838]();
}

uint64_t sub_20A8C6CF0()
{
  return MEMORY[0x270F77840]();
}

uint64_t sub_20A8C6D00()
{
  return MEMORY[0x270F77848]();
}

uint64_t sub_20A8C6D10()
{
  return MEMORY[0x270F77850]();
}

uint64_t sub_20A8C6D20()
{
  return MEMORY[0x270F77858]();
}

uint64_t sub_20A8C6D30()
{
  return MEMORY[0x270F77860]();
}

uint64_t sub_20A8C6D40()
{
  return MEMORY[0x270F77868]();
}

uint64_t sub_20A8C6D50()
{
  return MEMORY[0x270F77870]();
}

uint64_t sub_20A8C6D60()
{
  return MEMORY[0x270F77878]();
}

uint64_t sub_20A8C6D70()
{
  return MEMORY[0x270F77880]();
}

uint64_t sub_20A8C6D80()
{
  return MEMORY[0x270F77888]();
}

uint64_t sub_20A8C6D90()
{
  return MEMORY[0x270F77890]();
}

uint64_t sub_20A8C6DA0()
{
  return MEMORY[0x270F77898]();
}

uint64_t sub_20A8C6DB0()
{
  return MEMORY[0x270F778A0]();
}

uint64_t sub_20A8C6DC0()
{
  return MEMORY[0x270F778A8]();
}

uint64_t sub_20A8C6DD0()
{
  return MEMORY[0x270F778B0]();
}

uint64_t sub_20A8C6DE0()
{
  return MEMORY[0x270F778B8]();
}

uint64_t sub_20A8C6DF0()
{
  return MEMORY[0x270F778C0]();
}

uint64_t sub_20A8C6E00()
{
  return MEMORY[0x270F778C8]();
}

uint64_t sub_20A8C6E10()
{
  return MEMORY[0x270F778D0]();
}

uint64_t sub_20A8C6E20()
{
  return MEMORY[0x270F778D8]();
}

uint64_t sub_20A8C6E30()
{
  return MEMORY[0x270F778E0]();
}

uint64_t sub_20A8C6E40()
{
  return MEMORY[0x270F778E8]();
}

uint64_t sub_20A8C6E50()
{
  return MEMORY[0x270F778F0]();
}

uint64_t sub_20A8C6E60()
{
  return MEMORY[0x270F778F8]();
}

uint64_t sub_20A8C6E70()
{
  return MEMORY[0x270F77900]();
}

uint64_t sub_20A8C6E80()
{
  return MEMORY[0x270F77908]();
}

uint64_t sub_20A8C6E90()
{
  return MEMORY[0x270F77910]();
}

uint64_t sub_20A8C6EA0()
{
  return MEMORY[0x270F77918]();
}

uint64_t sub_20A8C6EB0()
{
  return MEMORY[0x270F77920]();
}

uint64_t sub_20A8C6EC0()
{
  return MEMORY[0x270F77928]();
}

uint64_t sub_20A8C6ED0()
{
  return MEMORY[0x270F77930]();
}

uint64_t sub_20A8C6EE0()
{
  return MEMORY[0x270F77938]();
}

uint64_t sub_20A8C6EF0()
{
  return MEMORY[0x270F77940]();
}

uint64_t sub_20A8C6F00()
{
  return MEMORY[0x270F77948]();
}

uint64_t sub_20A8C6F10()
{
  return MEMORY[0x270F77950]();
}

uint64_t sub_20A8C6F20()
{
  return MEMORY[0x270F77958]();
}

uint64_t sub_20A8C6F30()
{
  return MEMORY[0x270F77960]();
}

uint64_t sub_20A8C6F40()
{
  return MEMORY[0x270F77968]();
}

uint64_t sub_20A8C6F50()
{
  return MEMORY[0x270F77970]();
}

uint64_t sub_20A8C6F60()
{
  return MEMORY[0x270F77978]();
}

uint64_t sub_20A8C6F70()
{
  return MEMORY[0x270F77980]();
}

uint64_t sub_20A8C6F80()
{
  return MEMORY[0x270F77988]();
}

uint64_t sub_20A8C6F90()
{
  return MEMORY[0x270F77990]();
}

uint64_t sub_20A8C6FA0()
{
  return MEMORY[0x270F77998]();
}

uint64_t sub_20A8C6FB0()
{
  return MEMORY[0x270F779A0]();
}

uint64_t sub_20A8C6FC0()
{
  return MEMORY[0x270F779A8]();
}

uint64_t sub_20A8C6FD0()
{
  return MEMORY[0x270F779B0]();
}

uint64_t sub_20A8C6FE0()
{
  return MEMORY[0x270F779B8]();
}

uint64_t sub_20A8C6FF0()
{
  return MEMORY[0x270F779C0]();
}

uint64_t sub_20A8C7000()
{
  return MEMORY[0x270F779C8]();
}

uint64_t sub_20A8C7010()
{
  return MEMORY[0x270F779D0]();
}

uint64_t sub_20A8C7020()
{
  return MEMORY[0x270F779D8]();
}

uint64_t sub_20A8C7030()
{
  return MEMORY[0x270F779E0]();
}

uint64_t sub_20A8C7040()
{
  return MEMORY[0x270F779E8]();
}

uint64_t sub_20A8C7050()
{
  return MEMORY[0x270F779F0]();
}

uint64_t sub_20A8C7060()
{
  return MEMORY[0x270F779F8]();
}

uint64_t sub_20A8C7070()
{
  return MEMORY[0x270F77A00]();
}

uint64_t sub_20A8C7080()
{
  return MEMORY[0x270F77A08]();
}

uint64_t sub_20A8C7090()
{
  return MEMORY[0x270F77A10]();
}

uint64_t sub_20A8C70A0()
{
  return MEMORY[0x270F77A18]();
}

uint64_t sub_20A8C70B0()
{
  return MEMORY[0x270F77A20]();
}

uint64_t sub_20A8C70C0()
{
  return MEMORY[0x270F77A28]();
}

uint64_t sub_20A8C70D0()
{
  return MEMORY[0x270F77A30]();
}

uint64_t sub_20A8C70E0()
{
  return MEMORY[0x270F77A38]();
}

uint64_t sub_20A8C70F0()
{
  return MEMORY[0x270F77A40]();
}

uint64_t sub_20A8C7100()
{
  return MEMORY[0x270F77A48]();
}

uint64_t sub_20A8C7110()
{
  return MEMORY[0x270F77A50]();
}

uint64_t sub_20A8C7120()
{
  return MEMORY[0x270F77A58]();
}

uint64_t sub_20A8C7130()
{
  return MEMORY[0x270F77A60]();
}

uint64_t sub_20A8C7140()
{
  return MEMORY[0x270F77A68]();
}

uint64_t sub_20A8C7150()
{
  return MEMORY[0x270F77A70]();
}

uint64_t sub_20A8C7160()
{
  return MEMORY[0x270F77A78]();
}

uint64_t sub_20A8C7170()
{
  return MEMORY[0x270F77A80]();
}

uint64_t sub_20A8C7180()
{
  return MEMORY[0x270F77A88]();
}

uint64_t sub_20A8C7190()
{
  return MEMORY[0x270F77A90]();
}

uint64_t sub_20A8C71A0()
{
  return MEMORY[0x270F77A98]();
}

uint64_t sub_20A8C71B0()
{
  return MEMORY[0x270F77AA0]();
}

uint64_t sub_20A8C71C0()
{
  return MEMORY[0x270F77AA8]();
}

uint64_t sub_20A8C71D0()
{
  return MEMORY[0x270F77AB0]();
}

uint64_t sub_20A8C71E0()
{
  return MEMORY[0x270F77AB8]();
}

uint64_t sub_20A8C71F0()
{
  return MEMORY[0x270F77AC0]();
}

uint64_t sub_20A8C7200()
{
  return MEMORY[0x270F77AC8]();
}

uint64_t sub_20A8C7210()
{
  return MEMORY[0x270F77AD0]();
}

uint64_t sub_20A8C7220()
{
  return MEMORY[0x270F77AD8]();
}

uint64_t sub_20A8C7230()
{
  return MEMORY[0x270F77AE0]();
}

uint64_t sub_20A8C7240()
{
  return MEMORY[0x270F77AE8]();
}

uint64_t sub_20A8C7250()
{
  return MEMORY[0x270F77AF0]();
}

uint64_t sub_20A8C7260()
{
  return MEMORY[0x270F77AF8]();
}

uint64_t sub_20A8C7270()
{
  return MEMORY[0x270F77B00]();
}

uint64_t sub_20A8C7280()
{
  return MEMORY[0x270F77B08]();
}

uint64_t sub_20A8C7290()
{
  return MEMORY[0x270F77B10]();
}

uint64_t sub_20A8C72A0()
{
  return MEMORY[0x270F77B18]();
}

uint64_t sub_20A8C72B0()
{
  return MEMORY[0x270F77B20]();
}

uint64_t sub_20A8C72C0()
{
  return MEMORY[0x270F77B28]();
}

uint64_t sub_20A8C72D0()
{
  return MEMORY[0x270F77B30]();
}

uint64_t sub_20A8C72E0()
{
  return MEMORY[0x270F77B38]();
}

uint64_t sub_20A8C72F0()
{
  return MEMORY[0x270F77B40]();
}

uint64_t sub_20A8C7300()
{
  return MEMORY[0x270F77B48]();
}

uint64_t sub_20A8C7310()
{
  return MEMORY[0x270F77B50]();
}

uint64_t sub_20A8C7320()
{
  return MEMORY[0x270F77B58]();
}

uint64_t sub_20A8C7330()
{
  return MEMORY[0x270F77B60]();
}

uint64_t sub_20A8C7340()
{
  return MEMORY[0x270F77B68]();
}

uint64_t sub_20A8C7350()
{
  return MEMORY[0x270F77B70]();
}

uint64_t sub_20A8C7360()
{
  return MEMORY[0x270F77B78]();
}

uint64_t sub_20A8C7370()
{
  return MEMORY[0x270F77B80]();
}

uint64_t sub_20A8C7380()
{
  return MEMORY[0x270F77B88]();
}

uint64_t sub_20A8C7390()
{
  return MEMORY[0x270F77B90]();
}

uint64_t sub_20A8C73A0()
{
  return MEMORY[0x270F77B98]();
}

uint64_t sub_20A8C73B0()
{
  return MEMORY[0x270F77BA0]();
}

uint64_t sub_20A8C73C0()
{
  return MEMORY[0x270F77BA8]();
}

uint64_t sub_20A8C73D0()
{
  return MEMORY[0x270F77BB0]();
}

uint64_t sub_20A8C73E0()
{
  return MEMORY[0x270F77BB8]();
}

uint64_t sub_20A8C73F0()
{
  return MEMORY[0x270F77BC0]();
}

uint64_t sub_20A8C7400()
{
  return MEMORY[0x270F77BC8]();
}

uint64_t sub_20A8C7410()
{
  return MEMORY[0x270F77BD0]();
}

uint64_t sub_20A8C7420()
{
  return MEMORY[0x270F77BD8]();
}

uint64_t sub_20A8C7430()
{
  return MEMORY[0x270F77BE0]();
}

uint64_t sub_20A8C7440()
{
  return MEMORY[0x270F77BE8]();
}

uint64_t sub_20A8C7450()
{
  return MEMORY[0x270F77BF0]();
}

uint64_t sub_20A8C7460()
{
  return MEMORY[0x270F77BF8]();
}

uint64_t sub_20A8C7470()
{
  return MEMORY[0x270F77C00]();
}

uint64_t sub_20A8C7480()
{
  return MEMORY[0x270F77C08]();
}

uint64_t sub_20A8C7490()
{
  return MEMORY[0x270F77C10]();
}

uint64_t sub_20A8C74A0()
{
  return MEMORY[0x270F77C18]();
}

uint64_t sub_20A8C74B0()
{
  return MEMORY[0x270F77C20]();
}

uint64_t sub_20A8C74C0()
{
  return MEMORY[0x270F77C28]();
}

uint64_t sub_20A8C74D0()
{
  return MEMORY[0x270F77C30]();
}

uint64_t sub_20A8C74E0()
{
  return MEMORY[0x270F77C38]();
}

uint64_t sub_20A8C74F0()
{
  return MEMORY[0x270F77C40]();
}

uint64_t sub_20A8C7500()
{
  return MEMORY[0x270F77C48]();
}

uint64_t sub_20A8C7510()
{
  return MEMORY[0x270F77C50]();
}

uint64_t sub_20A8C7520()
{
  return MEMORY[0x270F77C58]();
}

uint64_t sub_20A8C7530()
{
  return MEMORY[0x270F77C60]();
}

uint64_t sub_20A8C7540()
{
  return MEMORY[0x270F77C68]();
}

uint64_t sub_20A8C7550()
{
  return MEMORY[0x270F77C70]();
}

uint64_t sub_20A8C7560()
{
  return MEMORY[0x270F77C78]();
}

uint64_t sub_20A8C7570()
{
  return MEMORY[0x270F77C80]();
}

uint64_t sub_20A8C7580()
{
  return MEMORY[0x270F77C88]();
}

uint64_t sub_20A8C7590()
{
  return MEMORY[0x270F77C90]();
}

uint64_t sub_20A8C75A0()
{
  return MEMORY[0x270F77C98]();
}

uint64_t sub_20A8C75B0()
{
  return MEMORY[0x270F77CA0]();
}

uint64_t sub_20A8C75C0()
{
  return MEMORY[0x270F77CA8]();
}

uint64_t sub_20A8C75D0()
{
  return MEMORY[0x270F77CB0]();
}

uint64_t sub_20A8C75E0()
{
  return MEMORY[0x270F77CB8]();
}

uint64_t sub_20A8C75F0()
{
  return MEMORY[0x270F77CC0]();
}

uint64_t sub_20A8C7600()
{
  return MEMORY[0x270F77CC8]();
}

uint64_t sub_20A8C7610()
{
  return MEMORY[0x270F77CD0]();
}

uint64_t sub_20A8C7620()
{
  return MEMORY[0x270F77CD8]();
}

uint64_t sub_20A8C7630()
{
  return MEMORY[0x270F77CE0]();
}

uint64_t sub_20A8C7640()
{
  return MEMORY[0x270F77CE8]();
}

uint64_t sub_20A8C7650()
{
  return MEMORY[0x270F77CF0]();
}

uint64_t sub_20A8C7660()
{
  return MEMORY[0x270F77CF8]();
}

uint64_t sub_20A8C7670()
{
  return MEMORY[0x270F77D00]();
}

uint64_t sub_20A8C7680()
{
  return MEMORY[0x270F77D08]();
}

uint64_t sub_20A8C7690()
{
  return MEMORY[0x270F77D10]();
}

uint64_t sub_20A8C76A0()
{
  return MEMORY[0x270F77D18]();
}

uint64_t sub_20A8C76B0()
{
  return MEMORY[0x270F77D20]();
}

uint64_t sub_20A8C76C0()
{
  return MEMORY[0x270F77D28]();
}

uint64_t sub_20A8C76D0()
{
  return MEMORY[0x270F77D30]();
}

uint64_t sub_20A8C76E0()
{
  return MEMORY[0x270F77D38]();
}

uint64_t sub_20A8C76F0()
{
  return MEMORY[0x270F77D40]();
}

uint64_t sub_20A8C7700()
{
  return MEMORY[0x270F77D48]();
}

uint64_t sub_20A8C7710()
{
  return MEMORY[0x270F77D50]();
}

uint64_t sub_20A8C7720()
{
  return MEMORY[0x270F77D58]();
}

uint64_t sub_20A8C7730()
{
  return MEMORY[0x270F77D60]();
}

uint64_t sub_20A8C7740()
{
  return MEMORY[0x270F77D68]();
}

uint64_t sub_20A8C7750()
{
  return MEMORY[0x270F77D70]();
}

uint64_t sub_20A8C7760()
{
  return MEMORY[0x270F77D78]();
}

uint64_t sub_20A8C7770()
{
  return MEMORY[0x270F77D80]();
}

uint64_t sub_20A8C7780()
{
  return MEMORY[0x270F77D88]();
}

uint64_t sub_20A8C7790()
{
  return MEMORY[0x270F77D90]();
}

uint64_t sub_20A8C77A0()
{
  return MEMORY[0x270F77D98]();
}

uint64_t sub_20A8C77B0()
{
  return MEMORY[0x270F77DA0]();
}

uint64_t sub_20A8C77C0()
{
  return MEMORY[0x270F77DA8]();
}

uint64_t sub_20A8C77D0()
{
  return MEMORY[0x270F77DB0]();
}

uint64_t sub_20A8C77E0()
{
  return MEMORY[0x270F77DB8]();
}

uint64_t sub_20A8C77F0()
{
  return MEMORY[0x270F77DC0]();
}

uint64_t sub_20A8C7800()
{
  return MEMORY[0x270F77DC8]();
}

uint64_t sub_20A8C7810()
{
  return MEMORY[0x270F77DD0]();
}

uint64_t sub_20A8C7820()
{
  return MEMORY[0x270F77DD8]();
}

uint64_t sub_20A8C7830()
{
  return MEMORY[0x270F77DE0]();
}

uint64_t sub_20A8C7840()
{
  return MEMORY[0x270F77DE8]();
}

uint64_t sub_20A8C7850()
{
  return MEMORY[0x270F77DF0]();
}

uint64_t sub_20A8C7860()
{
  return MEMORY[0x270F77DF8]();
}

uint64_t sub_20A8C7870()
{
  return MEMORY[0x270F77E00]();
}

uint64_t sub_20A8C7880()
{
  return MEMORY[0x270F501E0]();
}

uint64_t sub_20A8C7890()
{
  return MEMORY[0x270F501E8]();
}

uint64_t sub_20A8C78A0()
{
  return MEMORY[0x270F501F0]();
}

uint64_t sub_20A8C78B0()
{
  return MEMORY[0x270F501F8]();
}

uint64_t sub_20A8C78C0()
{
  return MEMORY[0x270F50200]();
}

uint64_t sub_20A8C78D0()
{
  return MEMORY[0x270F50208]();
}

uint64_t sub_20A8C78E0()
{
  return MEMORY[0x270F50210]();
}

uint64_t sub_20A8C78F0()
{
  return MEMORY[0x270F50218]();
}

uint64_t sub_20A8C7900()
{
  return MEMORY[0x270F50220]();
}

uint64_t sub_20A8C7910()
{
  return MEMORY[0x270F50228]();
}

uint64_t sub_20A8C7920()
{
  return MEMORY[0x270F50230]();
}

uint64_t sub_20A8C7930()
{
  return MEMORY[0x270F50238]();
}

uint64_t sub_20A8C7940()
{
  return MEMORY[0x270F50240]();
}

uint64_t sub_20A8C7950()
{
  return MEMORY[0x270F50248]();
}

uint64_t sub_20A8C7960()
{
  return MEMORY[0x270F50250]();
}

uint64_t sub_20A8C7970()
{
  return MEMORY[0x270F50258]();
}

uint64_t sub_20A8C7980()
{
  return MEMORY[0x270F50260]();
}

uint64_t sub_20A8C7990()
{
  return MEMORY[0x270F50268]();
}

uint64_t sub_20A8C79A0()
{
  return MEMORY[0x270F50270]();
}

uint64_t sub_20A8C79B0()
{
  return MEMORY[0x270F50278]();
}

uint64_t sub_20A8C79C0()
{
  return MEMORY[0x270F50280]();
}

uint64_t sub_20A8C79D0()
{
  return MEMORY[0x270F50288]();
}

uint64_t sub_20A8C79E0()
{
  return MEMORY[0x270F50290]();
}

uint64_t sub_20A8C79F0()
{
  return MEMORY[0x270F50298]();
}

uint64_t sub_20A8C7A00()
{
  return MEMORY[0x270F502A0]();
}

uint64_t sub_20A8C7A10()
{
  return MEMORY[0x270F502A8]();
}

uint64_t sub_20A8C7A20()
{
  return MEMORY[0x270F502B0]();
}

uint64_t sub_20A8C7A30()
{
  return MEMORY[0x270F502B8]();
}

uint64_t sub_20A8C7A40()
{
  return MEMORY[0x270F502C0]();
}

uint64_t sub_20A8C7A50()
{
  return MEMORY[0x270F502C8]();
}

uint64_t sub_20A8C7A60()
{
  return MEMORY[0x270F502D0]();
}

uint64_t sub_20A8C7A70()
{
  return MEMORY[0x270F502D8]();
}

uint64_t sub_20A8C7A80()
{
  return MEMORY[0x270F502E0]();
}

uint64_t sub_20A8C7A90()
{
  return MEMORY[0x270F502E8]();
}

uint64_t sub_20A8C7AA0()
{
  return MEMORY[0x270F502F0]();
}

uint64_t sub_20A8C7AB0()
{
  return MEMORY[0x270F502F8]();
}

uint64_t sub_20A8C7AC0()
{
  return MEMORY[0x270F50300]();
}

uint64_t sub_20A8C7AD0()
{
  return MEMORY[0x270F50308]();
}

uint64_t sub_20A8C7AE0()
{
  return MEMORY[0x270F50310]();
}

uint64_t sub_20A8C7AF0()
{
  return MEMORY[0x270F50318]();
}

uint64_t sub_20A8C7B00()
{
  return MEMORY[0x270F50320]();
}

uint64_t sub_20A8C7B10()
{
  return MEMORY[0x270F50328]();
}

uint64_t sub_20A8C7B20()
{
  return MEMORY[0x270F50330]();
}

uint64_t sub_20A8C7B30()
{
  return MEMORY[0x270F50338]();
}

uint64_t sub_20A8C7B40()
{
  return MEMORY[0x270F50340]();
}

uint64_t sub_20A8C7B50()
{
  return MEMORY[0x270F50348]();
}

uint64_t sub_20A8C7B60()
{
  return MEMORY[0x270F50350]();
}

uint64_t sub_20A8C7B70()
{
  return MEMORY[0x270F50358]();
}

uint64_t sub_20A8C7B80()
{
  return MEMORY[0x270F50370]();
}

uint64_t sub_20A8C7B90()
{
  return MEMORY[0x270F50378]();
}

uint64_t sub_20A8C7BA0()
{
  return MEMORY[0x270F50380]();
}

uint64_t sub_20A8C7BB0()
{
  return MEMORY[0x270F50390]();
}

uint64_t sub_20A8C7BC0()
{
  return MEMORY[0x270F50398]();
}

uint64_t sub_20A8C7BD0()
{
  return MEMORY[0x270F503A0]();
}

uint64_t sub_20A8C7BE0()
{
  return MEMORY[0x270F503A8]();
}

uint64_t sub_20A8C7BF0()
{
  return MEMORY[0x270F503B0]();
}

uint64_t sub_20A8C7C00()
{
  return MEMORY[0x270F503B8]();
}

uint64_t sub_20A8C7C10()
{
  return MEMORY[0x270F503C0]();
}

uint64_t sub_20A8C7C20()
{
  return MEMORY[0x270F503C8]();
}

uint64_t sub_20A8C7C30()
{
  return MEMORY[0x270F503D0]();
}

uint64_t sub_20A8C7C40()
{
  return MEMORY[0x270F503D8]();
}

uint64_t sub_20A8C7C50()
{
  return MEMORY[0x270F503E0]();
}

uint64_t sub_20A8C7C60()
{
  return MEMORY[0x270F503E8]();
}

uint64_t sub_20A8C7C70()
{
  return MEMORY[0x270F503F0]();
}

uint64_t sub_20A8C7C80()
{
  return MEMORY[0x270F503F8]();
}

uint64_t sub_20A8C7C90()
{
  return MEMORY[0x270F50400]();
}

uint64_t sub_20A8C7CA0()
{
  return MEMORY[0x270F50408]();
}

uint64_t sub_20A8C7CB0()
{
  return MEMORY[0x270F50410]();
}

uint64_t sub_20A8C7CC0()
{
  return MEMORY[0x270F50418]();
}

uint64_t sub_20A8C7CD0()
{
  return MEMORY[0x270F50420]();
}

uint64_t sub_20A8C7CE0()
{
  return MEMORY[0x270F50428]();
}

uint64_t sub_20A8C7CF0()
{
  return MEMORY[0x270F50430]();
}

uint64_t sub_20A8C7D00()
{
  return MEMORY[0x270F07EA0]();
}

uint64_t sub_20A8C7D10()
{
  return MEMORY[0x270F07EA8]();
}

uint64_t sub_20A8C7D20()
{
  return MEMORY[0x270F50048]();
}

uint64_t sub_20A8C7D30()
{
  return MEMORY[0x270F50050]();
}

uint64_t sub_20A8C7D40()
{
  return MEMORY[0x270F500A0]();
}

uint64_t sub_20A8C7D50()
{
  return MEMORY[0x270F500A8]();
}

uint64_t sub_20A8C7D60()
{
  return MEMORY[0x270F500B0]();
}

uint64_t sub_20A8C7D70()
{
  return MEMORY[0x270F500C0]();
}

uint64_t sub_20A8C7D80()
{
  return MEMORY[0x270F50110]();
}

uint64_t sub_20A8C7D90()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_20A8C7DA0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_20A8C7DB0()
{
  return MEMORY[0x270F78DA8]();
}

uint64_t sub_20A8C7DC0()
{
  return MEMORY[0x270F78DB0]();
}

uint64_t sub_20A8C7DD0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20A8C7DE0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20A8C7DF0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20A8C7E00()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_20A8C7E10()
{
  return MEMORY[0x270F7AB10]();
}

uint64_t sub_20A8C7E20()
{
  return MEMORY[0x270F4F1E0]();
}

uint64_t sub_20A8C7E30()
{
  return MEMORY[0x270F4F1E8]();
}

uint64_t sub_20A8C7E40()
{
  return MEMORY[0x270F7AB18]();
}

uint64_t sub_20A8C7E50()
{
  return MEMORY[0x270F7AB20]();
}

uint64_t sub_20A8C7E60()
{
  return MEMORY[0x270F7AB28]();
}

uint64_t sub_20A8C7E70()
{
  return MEMORY[0x270F7AB30]();
}

uint64_t sub_20A8C7E80()
{
  return MEMORY[0x270F7AB38]();
}

uint64_t sub_20A8C7E90()
{
  return MEMORY[0x270F7AB40]();
}

uint64_t sub_20A8C7EA0()
{
  return MEMORY[0x270F7AB48]();
}

uint64_t sub_20A8C7EB0()
{
  return MEMORY[0x270F7AB50]();
}

uint64_t sub_20A8C7EC0()
{
  return MEMORY[0x270F7AB58]();
}

uint64_t sub_20A8C7ED0()
{
  return MEMORY[0x270F7AB60]();
}

uint64_t sub_20A8C7EE0()
{
  return MEMORY[0x270F7AB68]();
}

uint64_t sub_20A8C7EF0()
{
  return MEMORY[0x270F7AB70]();
}

uint64_t sub_20A8C7F00()
{
  return MEMORY[0x270F7AB78]();
}

uint64_t sub_20A8C7F10()
{
  return MEMORY[0x270F7AB80]();
}

uint64_t sub_20A8C7F20()
{
  return MEMORY[0x270F7AB88]();
}

uint64_t sub_20A8C7F30()
{
  return MEMORY[0x270F7AB90]();
}

uint64_t sub_20A8C7F40()
{
  return MEMORY[0x270F7AB98]();
}

uint64_t sub_20A8C7F50()
{
  return MEMORY[0x270F7ABA0]();
}

uint64_t sub_20A8C7F60()
{
  return MEMORY[0x270F7ABA8]();
}

uint64_t sub_20A8C7F70()
{
  return MEMORY[0x270F7ABB0]();
}

uint64_t sub_20A8C7F80()
{
  return MEMORY[0x270F7ABB8]();
}

uint64_t sub_20A8C7F90()
{
  return MEMORY[0x270F7ABC0]();
}

uint64_t sub_20A8C7FA0()
{
  return MEMORY[0x270F7ABC8]();
}

uint64_t sub_20A8C7FB0()
{
  return MEMORY[0x270F7ABD0]();
}

uint64_t sub_20A8C7FC0()
{
  return MEMORY[0x270F7ABD8]();
}

uint64_t sub_20A8C7FD0()
{
  return MEMORY[0x270F7ABE0]();
}

uint64_t sub_20A8C7FE0()
{
  return MEMORY[0x270F7ABE8]();
}

uint64_t sub_20A8C7FF0()
{
  return MEMORY[0x270F7ABF0]();
}

uint64_t sub_20A8C8000()
{
  return MEMORY[0x270F7ABF8]();
}

uint64_t sub_20A8C8010()
{
  return MEMORY[0x270F7AC00]();
}

uint64_t sub_20A8C8020()
{
  return MEMORY[0x270F7AC08]();
}

uint64_t sub_20A8C8030()
{
  return MEMORY[0x270F7AC10]();
}

uint64_t sub_20A8C8040()
{
  return MEMORY[0x270F7AC18]();
}

uint64_t sub_20A8C8050()
{
  return MEMORY[0x270F7AC20]();
}

uint64_t sub_20A8C8060()
{
  return MEMORY[0x270F7AC28]();
}

uint64_t sub_20A8C8070()
{
  return MEMORY[0x270F7AC30]();
}

uint64_t sub_20A8C8080()
{
  return MEMORY[0x270F7AC38]();
}

uint64_t sub_20A8C8090()
{
  return MEMORY[0x270F7AC40]();
}

uint64_t sub_20A8C80A0()
{
  return MEMORY[0x270F4F1F0]();
}

uint64_t sub_20A8C80B0()
{
  return MEMORY[0x270F4F1F8]();
}

uint64_t sub_20A8C80C0()
{
  return MEMORY[0x270F7AC48]();
}

uint64_t sub_20A8C80D0()
{
  return MEMORY[0x270F7AC50]();
}

uint64_t sub_20A8C80E0()
{
  return MEMORY[0x270F7AC58]();
}

uint64_t sub_20A8C80F0()
{
  return MEMORY[0x270F7AC60]();
}

uint64_t sub_20A8C8100()
{
  return MEMORY[0x270F7AC68]();
}

uint64_t sub_20A8C8110()
{
  return MEMORY[0x270F7AC78]();
}

uint64_t sub_20A8C8120()
{
  return MEMORY[0x270F7AC80]();
}

uint64_t sub_20A8C8130()
{
  return MEMORY[0x270F7AC88]();
}

uint64_t sub_20A8C8140()
{
  return MEMORY[0x270F7AC90]();
}

uint64_t sub_20A8C8150()
{
  return MEMORY[0x270F7AC98]();
}

uint64_t sub_20A8C8160()
{
  return MEMORY[0x270F7ACA0]();
}

uint64_t sub_20A8C8170()
{
  return MEMORY[0x270F7ACA8]();
}

uint64_t sub_20A8C8180()
{
  return MEMORY[0x270F7ACB0]();
}

uint64_t sub_20A8C8190()
{
  return MEMORY[0x270F4EF50]();
}

uint64_t sub_20A8C81A0()
{
  return MEMORY[0x270F4EF58]();
}

uint64_t sub_20A8C81B0()
{
  return MEMORY[0x270F7ACB8]();
}

uint64_t sub_20A8C81C0()
{
  return MEMORY[0x270F7ACC0]();
}

uint64_t sub_20A8C81D0()
{
  return MEMORY[0x270F7ACC8]();
}

uint64_t sub_20A8C81E0()
{
  return MEMORY[0x270F7ACD0]();
}

uint64_t sub_20A8C81F0()
{
  return MEMORY[0x270F7ACD8]();
}

uint64_t sub_20A8C8200()
{
  return MEMORY[0x270F7ACE0]();
}

uint64_t sub_20A8C8210()
{
  return MEMORY[0x270F7ACE8]();
}

uint64_t sub_20A8C8220()
{
  return MEMORY[0x270F7ACF0]();
}

uint64_t sub_20A8C8230()
{
  return MEMORY[0x270F7ACF8]();
}

uint64_t sub_20A8C8240()
{
  return MEMORY[0x270F7AD00]();
}

uint64_t sub_20A8C8250()
{
  return MEMORY[0x270F7AD08]();
}

uint64_t sub_20A8C8260()
{
  return MEMORY[0x270F7AD10]();
}

uint64_t sub_20A8C8270()
{
  return MEMORY[0x270F7AD18]();
}

uint64_t sub_20A8C8280()
{
  return MEMORY[0x270F7AD20]();
}

uint64_t sub_20A8C82A0()
{
  return MEMORY[0x270F7AD30]();
}

uint64_t sub_20A8C82B0()
{
  return MEMORY[0x270F7AD38]();
}

uint64_t sub_20A8C82C0()
{
  return MEMORY[0x270F7AD40]();
}

uint64_t sub_20A8C82D0()
{
  return MEMORY[0x270F7AD48]();
}

uint64_t sub_20A8C82E0()
{
  return MEMORY[0x270F7AD50]();
}

uint64_t sub_20A8C82F0()
{
  return MEMORY[0x270F7AD60]();
}

uint64_t sub_20A8C8300()
{
  return MEMORY[0x270F7AD68]();
}

uint64_t sub_20A8C8310()
{
  return MEMORY[0x270F7AD70]();
}

uint64_t sub_20A8C8320()
{
  return MEMORY[0x270F7AD78]();
}

uint64_t sub_20A8C8330()
{
  return MEMORY[0x270F7AD80]();
}

uint64_t sub_20A8C8340()
{
  return MEMORY[0x270F4F200]();
}

uint64_t sub_20A8C8350()
{
  return MEMORY[0x270F7AD88]();
}

uint64_t sub_20A8C8360()
{
  return MEMORY[0x270F7AD90]();
}

uint64_t sub_20A8C8370()
{
  return MEMORY[0x270F7AD98]();
}

uint64_t sub_20A8C8380()
{
  return MEMORY[0x270F7ADA0]();
}

uint64_t sub_20A8C8390()
{
  return MEMORY[0x270F7ADA8]();
}

uint64_t sub_20A8C83A0()
{
  return MEMORY[0x270F7ADB0]();
}

uint64_t sub_20A8C83B0()
{
  return MEMORY[0x270F7ADB8]();
}

uint64_t sub_20A8C83C0()
{
  return MEMORY[0x270F7ADC0]();
}

uint64_t sub_20A8C83D0()
{
  return MEMORY[0x270F7ADD8]();
}

uint64_t sub_20A8C83E0()
{
  return MEMORY[0x270F7ADE0]();
}

uint64_t sub_20A8C83F0()
{
  return MEMORY[0x270F7ADE8]();
}

uint64_t sub_20A8C8400()
{
  return MEMORY[0x270F7ADF0]();
}

uint64_t sub_20A8C8410()
{
  return MEMORY[0x270F7ADF8]();
}

uint64_t sub_20A8C8420()
{
  return MEMORY[0x270F7AE00]();
}

uint64_t sub_20A8C8430()
{
  return MEMORY[0x270F7AE08]();
}

uint64_t sub_20A8C8440()
{
  return MEMORY[0x270F7AE10]();
}

uint64_t sub_20A8C8450()
{
  return MEMORY[0x270F7AE18]();
}

uint64_t sub_20A8C8460()
{
  return MEMORY[0x270F7AE20]();
}

uint64_t sub_20A8C8470()
{
  return MEMORY[0x270F7AE28]();
}

uint64_t sub_20A8C8480()
{
  return MEMORY[0x270F7AE30]();
}

uint64_t sub_20A8C8490()
{
  return MEMORY[0x270F7AE38]();
}

uint64_t sub_20A8C84A0()
{
  return MEMORY[0x270F7AE40]();
}

uint64_t sub_20A8C84B0()
{
  return MEMORY[0x270F7AE48]();
}

uint64_t sub_20A8C84C0()
{
  return MEMORY[0x270F7AE50]();
}

uint64_t sub_20A8C84D0()
{
  return MEMORY[0x270F7AE58]();
}

uint64_t sub_20A8C84E0()
{
  return MEMORY[0x270F7AE60]();
}

uint64_t sub_20A8C84F0()
{
  return MEMORY[0x270F7AE68]();
}

uint64_t sub_20A8C8500()
{
  return MEMORY[0x270F7AE70]();
}

uint64_t sub_20A8C8510()
{
  return MEMORY[0x270F7AE78]();
}

uint64_t sub_20A8C8520()
{
  return MEMORY[0x270F7AE80]();
}

uint64_t sub_20A8C8530()
{
  return MEMORY[0x270F7AE88]();
}

uint64_t sub_20A8C8540()
{
  return MEMORY[0x270F7AE90]();
}

uint64_t sub_20A8C8550()
{
  return MEMORY[0x270F7AE98]();
}

uint64_t sub_20A8C8560()
{
  return MEMORY[0x270F7AEA0]();
}

uint64_t sub_20A8C8570()
{
  return MEMORY[0x270F7AEA8]();
}

uint64_t sub_20A8C8580()
{
  return MEMORY[0x270F7AEB0]();
}

uint64_t sub_20A8C8590()
{
  return MEMORY[0x270F7AEB8]();
}

uint64_t sub_20A8C85A0()
{
  return MEMORY[0x270F7AEC0]();
}

uint64_t sub_20A8C85B0()
{
  return MEMORY[0x270F7AEC8]();
}

uint64_t sub_20A8C85C0()
{
  return MEMORY[0x270F7AED0]();
}

uint64_t sub_20A8C85D0()
{
  return MEMORY[0x270F7AED8]();
}

uint64_t sub_20A8C85E0()
{
  return MEMORY[0x270F7AEE0]();
}

uint64_t sub_20A8C85F0()
{
  return MEMORY[0x270F7AEE8]();
}

uint64_t sub_20A8C8600()
{
  return MEMORY[0x270F7AEF0]();
}

uint64_t sub_20A8C8610()
{
  return MEMORY[0x270F7AEF8]();
}

uint64_t sub_20A8C8620()
{
  return MEMORY[0x270F7AF00]();
}

uint64_t sub_20A8C8630()
{
  return MEMORY[0x270F7AF08]();
}

uint64_t sub_20A8C8640()
{
  return MEMORY[0x270F7AF10]();
}

uint64_t sub_20A8C8650()
{
  return MEMORY[0x270F7AF18]();
}

uint64_t sub_20A8C8660()
{
  return MEMORY[0x270F7AF20]();
}

uint64_t sub_20A8C8670()
{
  return MEMORY[0x270F7AF28]();
}

uint64_t sub_20A8C8680()
{
  return MEMORY[0x270F7AF30]();
}

uint64_t sub_20A8C8690()
{
  return MEMORY[0x270F7AF38]();
}

uint64_t sub_20A8C86A0()
{
  return MEMORY[0x270F7AF40]();
}

uint64_t sub_20A8C86B0()
{
  return MEMORY[0x270F7AF48]();
}

uint64_t sub_20A8C86C0()
{
  return MEMORY[0x270F4F208]();
}

uint64_t sub_20A8C86D0()
{
  return MEMORY[0x270F4F210]();
}

uint64_t sub_20A8C86E0()
{
  return MEMORY[0x270F4F218]();
}

uint64_t sub_20A8C86F0()
{
  return MEMORY[0x270F4F220]();
}

uint64_t sub_20A8C8700()
{
  return MEMORY[0x270F4F228]();
}

uint64_t sub_20A8C8710()
{
  return MEMORY[0x270F4F230]();
}

uint64_t sub_20A8C8720()
{
  return MEMORY[0x270F7AF50]();
}

uint64_t sub_20A8C8730()
{
  return MEMORY[0x270F7AF58]();
}

uint64_t sub_20A8C8740()
{
  return MEMORY[0x270F7AF60]();
}

uint64_t sub_20A8C8750()
{
  return MEMORY[0x270F7AF68]();
}

uint64_t sub_20A8C8760()
{
  return MEMORY[0x270F7AF70]();
}

uint64_t sub_20A8C8770()
{
  return MEMORY[0x270F7AF78]();
}

uint64_t sub_20A8C8780()
{
  return MEMORY[0x270F7AF80]();
}

uint64_t sub_20A8C8790()
{
  return MEMORY[0x270F7AF88]();
}

uint64_t sub_20A8C87A0()
{
  return MEMORY[0x270F7AF98]();
}

uint64_t sub_20A8C87B0()
{
  return MEMORY[0x270F7AFA0]();
}

uint64_t sub_20A8C87C0()
{
  return MEMORY[0x270F7AFA8]();
}

uint64_t sub_20A8C87D0()
{
  return MEMORY[0x270F7AFB0]();
}

uint64_t sub_20A8C87F0()
{
  return MEMORY[0x270F7AFC0]();
}

uint64_t sub_20A8C8800()
{
  return MEMORY[0x270F7AFC8]();
}

uint64_t sub_20A8C8810()
{
  return MEMORY[0x270F7AFD0]();
}

uint64_t sub_20A8C8820()
{
  return MEMORY[0x270F7AFD8]();
}

uint64_t sub_20A8C8830()
{
  return MEMORY[0x270F7AFE0]();
}

uint64_t sub_20A8C8840()
{
  return MEMORY[0x270F7AFE8]();
}

uint64_t sub_20A8C8850()
{
  return MEMORY[0x270F7AFF0]();
}

uint64_t sub_20A8C8860()
{
  return MEMORY[0x270F7AFF8]();
}

uint64_t sub_20A8C8870()
{
  return MEMORY[0x270F7B000]();
}

uint64_t sub_20A8C8880()
{
  return MEMORY[0x270F7B008]();
}

uint64_t sub_20A8C8890()
{
  return MEMORY[0x270F7B010]();
}

uint64_t sub_20A8C88A0()
{
  return MEMORY[0x270F7B018]();
}

uint64_t sub_20A8C88B0()
{
  return MEMORY[0x270F7B020]();
}

uint64_t sub_20A8C88C0()
{
  return MEMORY[0x270F4F238]();
}

uint64_t sub_20A8C88D0()
{
  return MEMORY[0x270F4F240]();
}

uint64_t sub_20A8C88E0()
{
  return MEMORY[0x270F4F248]();
}

uint64_t sub_20A8C88F0()
{
  return MEMORY[0x270F4F250]();
}

uint64_t sub_20A8C8900()
{
  return MEMORY[0x270F7B028]();
}

uint64_t sub_20A8C8910()
{
  return MEMORY[0x270F7B030]();
}

uint64_t sub_20A8C8920()
{
  return MEMORY[0x270F7B038]();
}

uint64_t sub_20A8C8930()
{
  return MEMORY[0x270F7B040]();
}

uint64_t sub_20A8C8940()
{
  return MEMORY[0x270F7B048]();
}

uint64_t sub_20A8C8950()
{
  return MEMORY[0x270F7B050]();
}

uint64_t sub_20A8C8960()
{
  return MEMORY[0x270F7B058]();
}

uint64_t sub_20A8C8970()
{
  return MEMORY[0x270F7B060]();
}

uint64_t sub_20A8C8980()
{
  return MEMORY[0x270F7B068]();
}

uint64_t sub_20A8C8990()
{
  return MEMORY[0x270F7B070]();
}

uint64_t sub_20A8C89A0()
{
  return MEMORY[0x270F7B078]();
}

uint64_t sub_20A8C89B0()
{
  return MEMORY[0x270F7B080]();
}

uint64_t sub_20A8C89C0()
{
  return MEMORY[0x270F7B088]();
}

uint64_t sub_20A8C89D0()
{
  return MEMORY[0x270F7B090]();
}

uint64_t sub_20A8C89E0()
{
  return MEMORY[0x270F7B098]();
}

uint64_t sub_20A8C89F0()
{
  return MEMORY[0x270F7B0A0]();
}

uint64_t sub_20A8C8A00()
{
  return MEMORY[0x270F7B0A8]();
}

uint64_t sub_20A8C8A10()
{
  return MEMORY[0x270F7B0B0]();
}

uint64_t sub_20A8C8A20()
{
  return MEMORY[0x270F7B0B8]();
}

uint64_t sub_20A8C8A30()
{
  return MEMORY[0x270F7B0C0]();
}

uint64_t sub_20A8C8A40()
{
  return MEMORY[0x270F7B0C8]();
}

uint64_t sub_20A8C8A50()
{
  return MEMORY[0x270F7B0D0]();
}

uint64_t sub_20A8C8A60()
{
  return MEMORY[0x270F4F258]();
}

uint64_t sub_20A8C8A70()
{
  return MEMORY[0x270F7B0D8]();
}

uint64_t sub_20A8C8A80()
{
  return MEMORY[0x270F7B0E0]();
}

uint64_t sub_20A8C8A90()
{
  return MEMORY[0x270F7B0E8]();
}

uint64_t sub_20A8C8AA0()
{
  return MEMORY[0x270F7B0F0]();
}

uint64_t sub_20A8C8AB0()
{
  return MEMORY[0x270F7B0F8]();
}

uint64_t sub_20A8C8AC0()
{
  return MEMORY[0x270F7B100]();
}

uint64_t sub_20A8C8AD0()
{
  return MEMORY[0x270F7B108]();
}

uint64_t sub_20A8C8AE0()
{
  return MEMORY[0x270F7B110]();
}

uint64_t sub_20A8C8AF0()
{
  return MEMORY[0x270F7B118]();
}

uint64_t sub_20A8C8B00()
{
  return MEMORY[0x270F7B120]();
}

uint64_t sub_20A8C8B10()
{
  return MEMORY[0x270F7B128]();
}

uint64_t sub_20A8C8B20()
{
  return MEMORY[0x270F7B130]();
}

uint64_t sub_20A8C8B30()
{
  return MEMORY[0x270F7B138]();
}

uint64_t sub_20A8C8B40()
{
  return MEMORY[0x270F7B140]();
}

uint64_t sub_20A8C8B50()
{
  return MEMORY[0x270F7B148]();
}

uint64_t sub_20A8C8B60()
{
  return MEMORY[0x270F7B150]();
}

uint64_t sub_20A8C8B70()
{
  return MEMORY[0x270F7B158]();
}

uint64_t sub_20A8C8B80()
{
  return MEMORY[0x270F7B160]();
}

uint64_t sub_20A8C8B90()
{
  return MEMORY[0x270F7B168]();
}

uint64_t sub_20A8C8BA0()
{
  return MEMORY[0x270F7B170]();
}

uint64_t sub_20A8C8BB0()
{
  return MEMORY[0x270F7B178]();
}

uint64_t sub_20A8C8BC0()
{
  return MEMORY[0x270F7B180]();
}

uint64_t sub_20A8C8BD0()
{
  return MEMORY[0x270F7B188]();
}

uint64_t sub_20A8C8BE0()
{
  return MEMORY[0x270F7B190]();
}

uint64_t sub_20A8C8BF0()
{
  return MEMORY[0x270F7B198]();
}

uint64_t sub_20A8C8C00()
{
  return MEMORY[0x270F7B1A0]();
}

uint64_t sub_20A8C8C10()
{
  return MEMORY[0x270F7B1A8]();
}

uint64_t sub_20A8C8C20()
{
  return MEMORY[0x270F7B1B0]();
}

uint64_t sub_20A8C8C30()
{
  return MEMORY[0x270F7B1B8]();
}

uint64_t sub_20A8C8C40()
{
  return MEMORY[0x270F7B1C0]();
}

uint64_t sub_20A8C8C50()
{
  return MEMORY[0x270F7B1C8]();
}

uint64_t sub_20A8C8C60()
{
  return MEMORY[0x270F7B1D0]();
}

uint64_t sub_20A8C8C70()
{
  return MEMORY[0x270F7B1D8]();
}

uint64_t sub_20A8C8C80()
{
  return MEMORY[0x270F7B1E0]();
}

uint64_t sub_20A8C8C90()
{
  return MEMORY[0x270F7B1E8]();
}

uint64_t sub_20A8C8CA0()
{
  return MEMORY[0x270F7B1F0]();
}

uint64_t sub_20A8C8CB0()
{
  return MEMORY[0x270F7B1F8]();
}

uint64_t sub_20A8C8CC0()
{
  return MEMORY[0x270F7B200]();
}

uint64_t sub_20A8C8CD0()
{
  return MEMORY[0x270F7B208]();
}

uint64_t sub_20A8C8CE0()
{
  return MEMORY[0x270F7B210]();
}

uint64_t sub_20A8C8CF0()
{
  return MEMORY[0x270F7B218]();
}

uint64_t sub_20A8C8D00()
{
  return MEMORY[0x270F7B220]();
}

uint64_t sub_20A8C8D10()
{
  return MEMORY[0x270F7B228]();
}

uint64_t sub_20A8C8D20()
{
  return MEMORY[0x270F7B230]();
}

uint64_t sub_20A8C8D30()
{
  return MEMORY[0x270F7B238]();
}

uint64_t sub_20A8C8D40()
{
  return MEMORY[0x270F7B240]();
}

uint64_t sub_20A8C8D50()
{
  return MEMORY[0x270F7B248]();
}

uint64_t sub_20A8C8D60()
{
  return MEMORY[0x270F7B258]();
}

uint64_t sub_20A8C8D70()
{
  return MEMORY[0x270F7B260]();
}

uint64_t sub_20A8C8D80()
{
  return MEMORY[0x270F7B268]();
}

uint64_t sub_20A8C8D90()
{
  return MEMORY[0x270F7B270]();
}

uint64_t sub_20A8C8DA0()
{
  return MEMORY[0x270F7B278]();
}

uint64_t sub_20A8C8DB0()
{
  return MEMORY[0x270F7B280]();
}

uint64_t sub_20A8C8DC0()
{
  return MEMORY[0x270F7B288]();
}

uint64_t sub_20A8C8DD0()
{
  return MEMORY[0x270F7B290]();
}

uint64_t sub_20A8C8DE0()
{
  return MEMORY[0x270F7B2A0]();
}

uint64_t sub_20A8C8DF0()
{
  return MEMORY[0x270F7B2A8]();
}

uint64_t sub_20A8C8E00()
{
  return MEMORY[0x270F7B2B0]();
}

uint64_t sub_20A8C8E10()
{
  return MEMORY[0x270F7B2B8]();
}

uint64_t sub_20A8C8E20()
{
  return MEMORY[0x270F7B2C0]();
}

uint64_t sub_20A8C8E30()
{
  return MEMORY[0x270F7B2C8]();
}

uint64_t sub_20A8C8E40()
{
  return MEMORY[0x270F7B2D0]();
}

uint64_t sub_20A8C8E50()
{
  return MEMORY[0x270F7B2E8]();
}

uint64_t sub_20A8C8E60()
{
  return MEMORY[0x270F7B2F0]();
}

uint64_t sub_20A8C8E70()
{
  return MEMORY[0x270F7B2F8]();
}

uint64_t sub_20A8C8E80()
{
  return MEMORY[0x270F7B300]();
}

uint64_t sub_20A8C8E90()
{
  return MEMORY[0x270F7B308]();
}

uint64_t sub_20A8C8EA0()
{
  return MEMORY[0x270F7B310]();
}

uint64_t sub_20A8C8EB0()
{
  return MEMORY[0x270F7B318]();
}

uint64_t sub_20A8C8EC0()
{
  return MEMORY[0x270F7B320]();
}

uint64_t sub_20A8C8ED0()
{
  return MEMORY[0x270F7B328]();
}

uint64_t sub_20A8C8EE0()
{
  return MEMORY[0x270F7B330]();
}

uint64_t sub_20A8C8EF0()
{
  return MEMORY[0x270F7B338]();
}

uint64_t sub_20A8C8F00()
{
  return MEMORY[0x270F7B340]();
}

uint64_t sub_20A8C8F10()
{
  return MEMORY[0x270F7B348]();
}

uint64_t sub_20A8C8F20()
{
  return MEMORY[0x270F7B350]();
}

uint64_t sub_20A8C8F30()
{
  return MEMORY[0x270F7B358]();
}

uint64_t sub_20A8C8F40()
{
  return MEMORY[0x270F7B360]();
}

uint64_t sub_20A8C8F50()
{
  return MEMORY[0x270F7B368]();
}

uint64_t sub_20A8C8F60()
{
  return MEMORY[0x270F7B370]();
}

uint64_t sub_20A8C8F70()
{
  return MEMORY[0x270F7B378]();
}

uint64_t sub_20A8C8F80()
{
  return MEMORY[0x270F7B380]();
}

uint64_t sub_20A8C8F90()
{
  return MEMORY[0x270F7B388]();
}

uint64_t sub_20A8C8FA0()
{
  return MEMORY[0x270F7B390]();
}

uint64_t sub_20A8C8FB0()
{
  return MEMORY[0x270F7B398]();
}

uint64_t sub_20A8C8FC0()
{
  return MEMORY[0x270F7B3A0]();
}

uint64_t sub_20A8C8FD0()
{
  return MEMORY[0x270F7B3A8]();
}

uint64_t sub_20A8C8FE0()
{
  return MEMORY[0x270F7B3B0]();
}

uint64_t sub_20A8C8FF0()
{
  return MEMORY[0x270F7B3B8]();
}

uint64_t sub_20A8C9000()
{
  return MEMORY[0x270F7B3C0]();
}

uint64_t sub_20A8C9010()
{
  return MEMORY[0x270F7B3C8]();
}

uint64_t sub_20A8C9020()
{
  return MEMORY[0x270F7B3D0]();
}

uint64_t sub_20A8C9030()
{
  return MEMORY[0x270F7B3D8]();
}

uint64_t sub_20A8C9040()
{
  return MEMORY[0x270F7B3E0]();
}

uint64_t sub_20A8C9050()
{
  return MEMORY[0x270F7B3E8]();
}

uint64_t sub_20A8C9060()
{
  return MEMORY[0x270F7B3F0]();
}

uint64_t sub_20A8C9070()
{
  return MEMORY[0x270F7B3F8]();
}

uint64_t sub_20A8C9080()
{
  return MEMORY[0x270F7B400]();
}

uint64_t sub_20A8C9090()
{
  return MEMORY[0x270F7B408]();
}

uint64_t sub_20A8C90A0()
{
  return MEMORY[0x270F7B410]();
}

uint64_t sub_20A8C90B0()
{
  return MEMORY[0x270F7B418]();
}

uint64_t sub_20A8C90C0()
{
  return MEMORY[0x270F7B420]();
}

uint64_t sub_20A8C90D0()
{
  return MEMORY[0x270F7B428]();
}

uint64_t sub_20A8C90E0()
{
  return MEMORY[0x270F7B430]();
}

uint64_t sub_20A8C90F0()
{
  return MEMORY[0x270F7B438]();
}

uint64_t sub_20A8C9100()
{
  return MEMORY[0x270F7B440]();
}

uint64_t sub_20A8C9110()
{
  return MEMORY[0x270F7B448]();
}

uint64_t sub_20A8C9120()
{
  return MEMORY[0x270F7B450]();
}

uint64_t sub_20A8C9130()
{
  return MEMORY[0x270F7B458]();
}

uint64_t sub_20A8C9140()
{
  return MEMORY[0x270F7B460]();
}

uint64_t sub_20A8C9150()
{
  return MEMORY[0x270F7B468]();
}

uint64_t sub_20A8C9160()
{
  return MEMORY[0x270F7B470]();
}

uint64_t sub_20A8C9170()
{
  return MEMORY[0x270F7B478]();
}

uint64_t sub_20A8C9180()
{
  return MEMORY[0x270F7B480]();
}

uint64_t sub_20A8C9190()
{
  return MEMORY[0x270F7B488]();
}

uint64_t sub_20A8C91A0()
{
  return MEMORY[0x270F7B490]();
}

uint64_t sub_20A8C91B0()
{
  return MEMORY[0x270F7B498]();
}

uint64_t sub_20A8C91C0()
{
  return MEMORY[0x270F7B4A0]();
}

uint64_t sub_20A8C91D0()
{
  return MEMORY[0x270F7B4A8]();
}

uint64_t sub_20A8C91E0()
{
  return MEMORY[0x270F7B4B0]();
}

uint64_t sub_20A8C9210()
{
  return MEMORY[0x270F7B4C8]();
}

uint64_t sub_20A8C9220()
{
  return MEMORY[0x270F7B4D0]();
}

uint64_t sub_20A8C9230()
{
  return MEMORY[0x270F7B4D8]();
}

uint64_t sub_20A8C9240()
{
  return MEMORY[0x270F7B4E0]();
}

uint64_t sub_20A8C9250()
{
  return MEMORY[0x270F7B4E8]();
}

uint64_t sub_20A8C9260()
{
  return MEMORY[0x270F7B4F0]();
}

uint64_t sub_20A8C9270()
{
  return MEMORY[0x270F7B4F8]();
}

uint64_t sub_20A8C9280()
{
  return MEMORY[0x270F7B500]();
}

uint64_t sub_20A8C9290()
{
  return MEMORY[0x270F7B508]();
}

uint64_t sub_20A8C92A0()
{
  return MEMORY[0x270F7B510]();
}

uint64_t sub_20A8C92B0()
{
  return MEMORY[0x270F7B518]();
}

uint64_t sub_20A8C92C0()
{
  return MEMORY[0x270F7B520]();
}

uint64_t sub_20A8C92D0()
{
  return MEMORY[0x270F7B528]();
}

uint64_t sub_20A8C92E0()
{
  return MEMORY[0x270F7B530]();
}

uint64_t sub_20A8C92F0()
{
  return MEMORY[0x270F7B538]();
}

uint64_t sub_20A8C9300()
{
  return MEMORY[0x270F7B540]();
}

uint64_t sub_20A8C9310()
{
  return MEMORY[0x270F7B548]();
}

uint64_t sub_20A8C9340()
{
  return MEMORY[0x270F7B560]();
}

uint64_t sub_20A8C9350()
{
  return MEMORY[0x270F7B568]();
}

uint64_t sub_20A8C9360()
{
  return MEMORY[0x270F7B570]();
}

uint64_t sub_20A8C9370()
{
  return MEMORY[0x270F7B578]();
}

uint64_t sub_20A8C9380()
{
  return MEMORY[0x270F7B580]();
}

uint64_t sub_20A8C9390()
{
  return MEMORY[0x270F7B588]();
}

uint64_t sub_20A8C93A0()
{
  return MEMORY[0x270F7B590]();
}

uint64_t sub_20A8C93C0()
{
  return MEMORY[0x270F7B5A0]();
}

uint64_t sub_20A8C93E0()
{
  return MEMORY[0x270F7B5B0]();
}

uint64_t sub_20A8C93F0()
{
  return MEMORY[0x270F7B5B8]();
}

uint64_t sub_20A8C9400()
{
  return MEMORY[0x270F7B5C0]();
}

uint64_t sub_20A8C9410()
{
  return MEMORY[0x270F7B5C8]();
}

uint64_t sub_20A8C9420()
{
  return MEMORY[0x270F7B5D0]();
}

uint64_t sub_20A8C9430()
{
  return MEMORY[0x270F7B5D8]();
}

uint64_t sub_20A8C9440()
{
  return MEMORY[0x270F7B5E0]();
}

uint64_t sub_20A8C9450()
{
  return MEMORY[0x270F7B5E8]();
}

uint64_t sub_20A8C9460()
{
  return MEMORY[0x270F7B5F0]();
}

uint64_t sub_20A8C9490()
{
  return MEMORY[0x270F7B608]();
}

uint64_t sub_20A8C94A0()
{
  return MEMORY[0x270F7B610]();
}

uint64_t sub_20A8C94B0()
{
  return MEMORY[0x270F7B618]();
}

uint64_t sub_20A8C94C0()
{
  return MEMORY[0x270F7B620]();
}

uint64_t sub_20A8C94D0()
{
  return MEMORY[0x270F7B628]();
}

uint64_t sub_20A8C94E0()
{
  return MEMORY[0x270F7B630]();
}

uint64_t sub_20A8C94F0()
{
  return MEMORY[0x270F7B638]();
}

uint64_t sub_20A8C9500()
{
  return MEMORY[0x270F7B640]();
}

uint64_t sub_20A8C9510()
{
  return MEMORY[0x270F7B648]();
}

uint64_t sub_20A8C9520()
{
  return MEMORY[0x270F7B650]();
}

uint64_t sub_20A8C9530()
{
  return MEMORY[0x270F7B658]();
}

uint64_t sub_20A8C9540()
{
  return MEMORY[0x270F7B660]();
}

uint64_t sub_20A8C9550()
{
  return MEMORY[0x270F7B668]();
}

uint64_t sub_20A8C9560()
{
  return MEMORY[0x270F7B670]();
}

uint64_t sub_20A8C9570()
{
  return MEMORY[0x270F7B678]();
}

uint64_t sub_20A8C9580()
{
  return MEMORY[0x270F7B680]();
}

uint64_t sub_20A8C9590()
{
  return MEMORY[0x270F7B688]();
}

uint64_t sub_20A8C95A0()
{
  return MEMORY[0x270F7B690]();
}

uint64_t sub_20A8C95B0()
{
  return MEMORY[0x270F7B698]();
}

uint64_t sub_20A8C95C0()
{
  return MEMORY[0x270F7B6A0]();
}

uint64_t sub_20A8C95D0()
{
  return MEMORY[0x270F7B6A8]();
}

uint64_t sub_20A8C95E0()
{
  return MEMORY[0x270F7B6B0]();
}

uint64_t sub_20A8C95F0()
{
  return MEMORY[0x270F7B6B8]();
}

uint64_t sub_20A8C9600()
{
  return MEMORY[0x270F7B6C0]();
}

uint64_t sub_20A8C9610()
{
  return MEMORY[0x270F7B6C8]();
}

uint64_t sub_20A8C9620()
{
  return MEMORY[0x270F7B6D0]();
}

uint64_t sub_20A8C9630()
{
  return MEMORY[0x270F7B6D8]();
}

uint64_t sub_20A8C9640()
{
  return MEMORY[0x270F7B6E0]();
}

uint64_t sub_20A8C9650()
{
  return MEMORY[0x270F7B6E8]();
}

uint64_t sub_20A8C9660()
{
  return MEMORY[0x270F7B6F0]();
}

uint64_t sub_20A8C9670()
{
  return MEMORY[0x270F7B6F8]();
}

uint64_t sub_20A8C9680()
{
  return MEMORY[0x270F7B700]();
}

uint64_t sub_20A8C9690()
{
  return MEMORY[0x270F7B708]();
}

uint64_t sub_20A8C96A0()
{
  return MEMORY[0x270F7B710]();
}

uint64_t sub_20A8C96B0()
{
  return MEMORY[0x270F7B718]();
}

uint64_t sub_20A8C96C0()
{
  return MEMORY[0x270F7B720]();
}

uint64_t sub_20A8C96D0()
{
  return MEMORY[0x270F7B728]();
}

uint64_t sub_20A8C96E0()
{
  return MEMORY[0x270F7B730]();
}

uint64_t sub_20A8C96F0()
{
  return MEMORY[0x270F7B738]();
}

uint64_t sub_20A8C9700()
{
  return MEMORY[0x270F7B740]();
}

uint64_t sub_20A8C9710()
{
  return MEMORY[0x270F7B748]();
}

uint64_t sub_20A8C9720()
{
  return MEMORY[0x270F7B750]();
}

uint64_t sub_20A8C9730()
{
  return MEMORY[0x270F7B758]();
}

uint64_t sub_20A8C9740()
{
  return MEMORY[0x270F7B760]();
}

uint64_t sub_20A8C9750()
{
  return MEMORY[0x270F7B768]();
}

uint64_t sub_20A8C9760()
{
  return MEMORY[0x270F7B770]();
}

uint64_t sub_20A8C9770()
{
  return MEMORY[0x270F7B778]();
}

uint64_t sub_20A8C9780()
{
  return MEMORY[0x270F7B780]();
}

uint64_t sub_20A8C9790()
{
  return MEMORY[0x270F7B788]();
}

uint64_t sub_20A8C97A0()
{
  return MEMORY[0x270F7B790]();
}

uint64_t sub_20A8C97B0()
{
  return MEMORY[0x270F7B798]();
}

uint64_t sub_20A8C97C0()
{
  return MEMORY[0x270F7B7A0]();
}

uint64_t sub_20A8C97D0()
{
  return MEMORY[0x270F7B7A8]();
}

uint64_t sub_20A8C97E0()
{
  return MEMORY[0x270F7B7B0]();
}

uint64_t sub_20A8C97F0()
{
  return MEMORY[0x270F7B7B8]();
}

uint64_t sub_20A8C9800()
{
  return MEMORY[0x270F7B7C0]();
}

uint64_t sub_20A8C9810()
{
  return MEMORY[0x270F7B7C8]();
}

uint64_t sub_20A8C9820()
{
  return MEMORY[0x270F7B7D0]();
}

uint64_t sub_20A8C9830()
{
  return MEMORY[0x270F7B7D8]();
}

uint64_t sub_20A8C9840()
{
  return MEMORY[0x270F7B7E0]();
}

uint64_t sub_20A8C9850()
{
  return MEMORY[0x270F7B7E8]();
}

uint64_t sub_20A8C9860()
{
  return MEMORY[0x270F7B7F0]();
}

uint64_t sub_20A8C9870()
{
  return MEMORY[0x270F7B7F8]();
}

uint64_t sub_20A8C9880()
{
  return MEMORY[0x270F7B800]();
}

uint64_t sub_20A8C9890()
{
  return MEMORY[0x270F7B808]();
}

uint64_t sub_20A8C98A0()
{
  return MEMORY[0x270F7B810]();
}

uint64_t sub_20A8C98B0()
{
  return MEMORY[0x270F7B818]();
}

uint64_t sub_20A8C98C0()
{
  return MEMORY[0x270F7B820]();
}

uint64_t sub_20A8C98D0()
{
  return MEMORY[0x270F7B828]();
}

uint64_t sub_20A8C98E0()
{
  return MEMORY[0x270F7B830]();
}

uint64_t sub_20A8C98F0()
{
  return MEMORY[0x270F7B838]();
}

uint64_t sub_20A8C9900()
{
  return MEMORY[0x270F7B840]();
}

uint64_t sub_20A8C9910()
{
  return MEMORY[0x270F7B848]();
}

uint64_t sub_20A8C9920()
{
  return MEMORY[0x270F7B850]();
}

uint64_t sub_20A8C9930()
{
  return MEMORY[0x270F7B858]();
}

uint64_t sub_20A8C9940()
{
  return MEMORY[0x270F7B860]();
}

uint64_t sub_20A8C9950()
{
  return MEMORY[0x270F7B868]();
}

uint64_t sub_20A8C9960()
{
  return MEMORY[0x270F7B870]();
}

uint64_t sub_20A8C9970()
{
  return MEMORY[0x270F7B878]();
}

uint64_t sub_20A8C9980()
{
  return MEMORY[0x270F7B880]();
}

uint64_t sub_20A8C9990()
{
  return MEMORY[0x270F7B888]();
}

uint64_t sub_20A8C99A0()
{
  return MEMORY[0x270F7B890]();
}

uint64_t sub_20A8C99B0()
{
  return MEMORY[0x270F7B898]();
}

uint64_t sub_20A8C99C0()
{
  return MEMORY[0x270F7B8A0]();
}

uint64_t sub_20A8C99D0()
{
  return MEMORY[0x270F7B8A8]();
}

uint64_t sub_20A8C99E0()
{
  return MEMORY[0x270F7B8B0]();
}

uint64_t sub_20A8C99F0()
{
  return MEMORY[0x270F7B8B8]();
}

uint64_t sub_20A8C9A00()
{
  return MEMORY[0x270F7B8C0]();
}

uint64_t sub_20A8C9A10()
{
  return MEMORY[0x270F7B8C8]();
}

uint64_t sub_20A8C9A20()
{
  return MEMORY[0x270F7B8D0]();
}

uint64_t sub_20A8C9A30()
{
  return MEMORY[0x270F7B8D8]();
}

uint64_t sub_20A8C9A40()
{
  return MEMORY[0x270F7B8E0]();
}

uint64_t sub_20A8C9A50()
{
  return MEMORY[0x270F7B8E8]();
}

uint64_t sub_20A8C9A60()
{
  return MEMORY[0x270F7B8F0]();
}

uint64_t sub_20A8C9A70()
{
  return MEMORY[0x270F7B8F8]();
}

uint64_t sub_20A8C9A80()
{
  return MEMORY[0x270F7B900]();
}

uint64_t sub_20A8C9A90()
{
  return MEMORY[0x270F7B908]();
}

uint64_t sub_20A8C9AA0()
{
  return MEMORY[0x270F7B910]();
}

uint64_t sub_20A8C9AB0()
{
  return MEMORY[0x270F7B918]();
}

uint64_t sub_20A8C9AF0()
{
  return MEMORY[0x270F7B938]();
}

uint64_t sub_20A8C9B00()
{
  return MEMORY[0x270F7B940]();
}

uint64_t sub_20A8C9B10()
{
  return MEMORY[0x270F7B948]();
}

uint64_t sub_20A8C9B20()
{
  return MEMORY[0x270F7B950]();
}

uint64_t sub_20A8C9B30()
{
  return MEMORY[0x270F7B958]();
}

uint64_t sub_20A8C9B40()
{
  return MEMORY[0x270F7B960]();
}

uint64_t sub_20A8C9B50()
{
  return MEMORY[0x270F7B968]();
}

uint64_t sub_20A8C9B60()
{
  return MEMORY[0x270F7B970]();
}

uint64_t sub_20A8C9B70()
{
  return MEMORY[0x270F7B978]();
}

uint64_t sub_20A8C9B80()
{
  return MEMORY[0x270F7B980]();
}

uint64_t sub_20A8C9B90()
{
  return MEMORY[0x270F7B988]();
}

uint64_t sub_20A8C9BA0()
{
  return MEMORY[0x270F7B990]();
}

uint64_t sub_20A8C9BB0()
{
  return MEMORY[0x270F7B998]();
}

uint64_t sub_20A8C9BC0()
{
  return MEMORY[0x270F7B9A0]();
}

uint64_t sub_20A8C9BD0()
{
  return MEMORY[0x270F7B9A8]();
}

uint64_t sub_20A8C9BE0()
{
  return MEMORY[0x270F7B9B0]();
}

uint64_t sub_20A8C9BF0()
{
  return MEMORY[0x270F7B9B8]();
}

uint64_t sub_20A8C9C00()
{
  return MEMORY[0x270F7B9C0]();
}

uint64_t sub_20A8C9C10()
{
  return MEMORY[0x270F7B9C8]();
}

uint64_t sub_20A8C9C20()
{
  return MEMORY[0x270F7B9D0]();
}

uint64_t sub_20A8C9C30()
{
  return MEMORY[0x270F7B9D8]();
}

uint64_t sub_20A8C9C40()
{
  return MEMORY[0x270F7B9E0]();
}

uint64_t sub_20A8C9C50()
{
  return MEMORY[0x270F7B9E8]();
}

uint64_t sub_20A8C9C60()
{
  return MEMORY[0x270F7B9F0]();
}

uint64_t sub_20A8C9C70()
{
  return MEMORY[0x270F7B9F8]();
}

uint64_t sub_20A8C9C80()
{
  return MEMORY[0x270F7BA00]();
}

uint64_t sub_20A8C9C90()
{
  return MEMORY[0x270F7BA08]();
}

uint64_t sub_20A8C9CA0()
{
  return MEMORY[0x270F7BA10]();
}

uint64_t sub_20A8C9CB0()
{
  return MEMORY[0x270F7BA18]();
}

uint64_t sub_20A8C9CC0()
{
  return MEMORY[0x270F7BA20]();
}

uint64_t sub_20A8C9CD0()
{
  return MEMORY[0x270F7BA28]();
}

uint64_t sub_20A8C9CE0()
{
  return MEMORY[0x270F7BA30]();
}

uint64_t sub_20A8C9CF0()
{
  return MEMORY[0x270F7BA38]();
}

uint64_t sub_20A8C9D00()
{
  return MEMORY[0x270F7BA40]();
}

uint64_t sub_20A8C9D10()
{
  return MEMORY[0x270F7BA48]();
}

uint64_t sub_20A8C9D20()
{
  return MEMORY[0x270F7BA50]();
}

uint64_t sub_20A8C9D30()
{
  return MEMORY[0x270F7BA58]();
}

uint64_t sub_20A8C9D40()
{
  return MEMORY[0x270F7BA60]();
}

uint64_t sub_20A8C9D50()
{
  return MEMORY[0x270F7BA68]();
}

uint64_t sub_20A8C9D60()
{
  return MEMORY[0x270F7BA70]();
}

uint64_t sub_20A8C9D70()
{
  return MEMORY[0x270F7BA78]();
}

uint64_t sub_20A8C9D80()
{
  return MEMORY[0x270F7BA80]();
}

uint64_t sub_20A8C9D90()
{
  return MEMORY[0x270F7BA88]();
}

uint64_t sub_20A8C9DA0()
{
  return MEMORY[0x270F7BA90]();
}

uint64_t sub_20A8C9DB0()
{
  return MEMORY[0x270F7BA98]();
}

uint64_t sub_20A8C9DC0()
{
  return MEMORY[0x270F7BAA0]();
}

uint64_t sub_20A8C9DD0()
{
  return MEMORY[0x270F7BAA8]();
}

uint64_t sub_20A8C9DE0()
{
  return MEMORY[0x270F7BAB0]();
}

uint64_t sub_20A8C9DF0()
{
  return MEMORY[0x270F7BAB8]();
}

uint64_t sub_20A8C9E00()
{
  return MEMORY[0x270F7BAC0]();
}

uint64_t sub_20A8C9E10()
{
  return MEMORY[0x270F7BAC8]();
}

uint64_t sub_20A8C9E20()
{
  return MEMORY[0x270F7BAD0]();
}

uint64_t sub_20A8C9E30()
{
  return MEMORY[0x270F7BAD8]();
}

uint64_t sub_20A8C9E40()
{
  return MEMORY[0x270F7BAE0]();
}

uint64_t sub_20A8C9E50()
{
  return MEMORY[0x270F7BAE8]();
}

uint64_t sub_20A8C9E60()
{
  return MEMORY[0x270F7BAF0]();
}

uint64_t sub_20A8C9E70()
{
  return MEMORY[0x270F7BAF8]();
}

uint64_t sub_20A8C9E80()
{
  return MEMORY[0x270F7BB00]();
}

uint64_t sub_20A8C9E90()
{
  return MEMORY[0x270F7BB08]();
}

uint64_t sub_20A8C9EA0()
{
  return MEMORY[0x270F7BB10]();
}

uint64_t sub_20A8C9EB0()
{
  return MEMORY[0x270F7BB18]();
}

uint64_t sub_20A8C9EC0()
{
  return MEMORY[0x270F7BB20]();
}

uint64_t sub_20A8C9ED0()
{
  return MEMORY[0x270F7BB28]();
}

uint64_t sub_20A8C9EE0()
{
  return MEMORY[0x270F7BB30]();
}

uint64_t sub_20A8C9EF0()
{
  return MEMORY[0x270F7BB38]();
}

uint64_t sub_20A8C9F00()
{
  return MEMORY[0x270F7BB40]();
}

uint64_t sub_20A8C9F10()
{
  return MEMORY[0x270F7BB48]();
}

uint64_t sub_20A8C9F20()
{
  return MEMORY[0x270F7BB50]();
}

uint64_t sub_20A8C9F30()
{
  return MEMORY[0x270F7BB58]();
}

uint64_t sub_20A8C9F40()
{
  return MEMORY[0x270F7BB60]();
}

uint64_t sub_20A8C9F50()
{
  return MEMORY[0x270F7BB68]();
}

uint64_t sub_20A8C9F60()
{
  return MEMORY[0x270F7BB70]();
}

uint64_t sub_20A8C9F70()
{
  return MEMORY[0x270F7BB78]();
}

uint64_t sub_20A8C9F80()
{
  return MEMORY[0x270F7BB80]();
}

uint64_t sub_20A8C9F90()
{
  return MEMORY[0x270F7BB88]();
}

uint64_t sub_20A8C9FA0()
{
  return MEMORY[0x270F7BB90]();
}

uint64_t sub_20A8C9FB0()
{
  return MEMORY[0x270F7BB98]();
}

uint64_t sub_20A8C9FC0()
{
  return MEMORY[0x270F7BBA0]();
}

uint64_t sub_20A8C9FD0()
{
  return MEMORY[0x270F7BBA8]();
}

uint64_t sub_20A8C9FE0()
{
  return MEMORY[0x270F7BBB0]();
}

uint64_t sub_20A8C9FF0()
{
  return MEMORY[0x270F7BBB8]();
}

uint64_t sub_20A8CA000()
{
  return MEMORY[0x270F7BBC0]();
}

uint64_t sub_20A8CA010()
{
  return MEMORY[0x270F7BBC8]();
}

uint64_t sub_20A8CA020()
{
  return MEMORY[0x270F7BBD0]();
}

uint64_t sub_20A8CA030()
{
  return MEMORY[0x270F7BBD8]();
}

uint64_t sub_20A8CA040()
{
  return MEMORY[0x270F7BBE0]();
}

uint64_t sub_20A8CA050()
{
  return MEMORY[0x270F7BBE8]();
}

uint64_t sub_20A8CA060()
{
  return MEMORY[0x270F7BBF0]();
}

uint64_t sub_20A8CA070()
{
  return MEMORY[0x270F7BBF8]();
}

uint64_t sub_20A8CA080()
{
  return MEMORY[0x270F7BC00]();
}

uint64_t sub_20A8CA090()
{
  return MEMORY[0x270F7BC08]();
}

uint64_t sub_20A8CA0A0()
{
  return MEMORY[0x270F7BC10]();
}

uint64_t sub_20A8CA0B0()
{
  return MEMORY[0x270F7BC18]();
}

uint64_t sub_20A8CA0C0()
{
  return MEMORY[0x270F7BC20]();
}

uint64_t sub_20A8CA0D0()
{
  return MEMORY[0x270F7BC28]();
}

uint64_t sub_20A8CA0E0()
{
  return MEMORY[0x270F7BC30]();
}

uint64_t sub_20A8CA0F0()
{
  return MEMORY[0x270F7BC38]();
}

uint64_t sub_20A8CA100()
{
  return MEMORY[0x270F7BC40]();
}

uint64_t sub_20A8CA110()
{
  return MEMORY[0x270F7BC48]();
}

uint64_t sub_20A8CA120()
{
  return MEMORY[0x270F7BC50]();
}

uint64_t sub_20A8CA130()
{
  return MEMORY[0x270F7BC58]();
}

uint64_t sub_20A8CA140()
{
  return MEMORY[0x270F7BC60]();
}

uint64_t sub_20A8CA150()
{
  return MEMORY[0x270F7BC68]();
}

uint64_t sub_20A8CA160()
{
  return MEMORY[0x270F7BC70]();
}

uint64_t sub_20A8CA170()
{
  return MEMORY[0x270F7BC78]();
}

uint64_t sub_20A8CA180()
{
  return MEMORY[0x270F7BC80]();
}

uint64_t sub_20A8CA190()
{
  return MEMORY[0x270F7BC88]();
}

uint64_t sub_20A8CA1A0()
{
  return MEMORY[0x270F7BC90]();
}

uint64_t sub_20A8CA1B0()
{
  return MEMORY[0x270F7BC98]();
}

uint64_t sub_20A8CA1C0()
{
  return MEMORY[0x270F7BCA0]();
}

uint64_t sub_20A8CA1D0()
{
  return MEMORY[0x270F7BCA8]();
}

uint64_t sub_20A8CA1E0()
{
  return MEMORY[0x270F7BCB0]();
}

uint64_t sub_20A8CA1F0()
{
  return MEMORY[0x270F7BCB8]();
}

uint64_t sub_20A8CA200()
{
  return MEMORY[0x270F7BCC0]();
}

uint64_t sub_20A8CA210()
{
  return MEMORY[0x270F7BCC8]();
}

uint64_t sub_20A8CA220()
{
  return MEMORY[0x270F7BCD0]();
}

uint64_t sub_20A8CA230()
{
  return MEMORY[0x270F7BCD8]();
}

uint64_t sub_20A8CA240()
{
  return MEMORY[0x270F7BCE0]();
}

uint64_t sub_20A8CA250()
{
  return MEMORY[0x270F7BCE8]();
}

uint64_t sub_20A8CA260()
{
  return MEMORY[0x270F7BCF0]();
}

uint64_t sub_20A8CA270()
{
  return MEMORY[0x270F7BCF8]();
}

uint64_t sub_20A8CA280()
{
  return MEMORY[0x270F7BD00]();
}

uint64_t sub_20A8CA290()
{
  return MEMORY[0x270F7BD08]();
}

uint64_t sub_20A8CA2A0()
{
  return MEMORY[0x270F7BD10]();
}

uint64_t sub_20A8CA2B0()
{
  return MEMORY[0x270F7BD18]();
}

uint64_t sub_20A8CA2C0()
{
  return MEMORY[0x270F7BD20]();
}

uint64_t sub_20A8CA2D0()
{
  return MEMORY[0x270F7BD28]();
}

uint64_t sub_20A8CA2E0()
{
  return MEMORY[0x270F7BD30]();
}

uint64_t sub_20A8CA2F0()
{
  return MEMORY[0x270F7BD38]();
}

uint64_t sub_20A8CA300()
{
  return MEMORY[0x270F7BD40]();
}

uint64_t sub_20A8CA310()
{
  return MEMORY[0x270F7BD48]();
}

uint64_t sub_20A8CA320()
{
  return MEMORY[0x270F7BD50]();
}

uint64_t sub_20A8CA330()
{
  return MEMORY[0x270F7BD58]();
}

uint64_t sub_20A8CA340()
{
  return MEMORY[0x270F7BD60]();
}

uint64_t sub_20A8CA350()
{
  return MEMORY[0x270F7BD68]();
}

uint64_t sub_20A8CA360()
{
  return MEMORY[0x270F7BD70]();
}

uint64_t sub_20A8CA370()
{
  return MEMORY[0x270F7BD78]();
}

uint64_t sub_20A8CA380()
{
  return MEMORY[0x270F7BD80]();
}

uint64_t sub_20A8CA390()
{
  return MEMORY[0x270F7BD88]();
}

uint64_t sub_20A8CA3A0()
{
  return MEMORY[0x270F7BD90]();
}

uint64_t sub_20A8CA3B0()
{
  return MEMORY[0x270F7BD98]();
}

uint64_t sub_20A8CA3C0()
{
  return MEMORY[0x270F7BDA0]();
}

uint64_t sub_20A8CA3D0()
{
  return MEMORY[0x270F7BDA8]();
}

uint64_t sub_20A8CA3E0()
{
  return MEMORY[0x270F7BDB0]();
}

uint64_t sub_20A8CA3F0()
{
  return MEMORY[0x270F7BDB8]();
}

uint64_t sub_20A8CA400()
{
  return MEMORY[0x270F7BDC0]();
}

uint64_t sub_20A8CA410()
{
  return MEMORY[0x270F7BDC8]();
}

uint64_t sub_20A8CA420()
{
  return MEMORY[0x270F7BDD0]();
}

uint64_t sub_20A8CA430()
{
  return MEMORY[0x270F7BDD8]();
}

uint64_t sub_20A8CA440()
{
  return MEMORY[0x270F7BDE0]();
}

uint64_t sub_20A8CA450()
{
  return MEMORY[0x270F7BDE8]();
}

uint64_t sub_20A8CA460()
{
  return MEMORY[0x270F7BDF0]();
}

uint64_t sub_20A8CA470()
{
  return MEMORY[0x270F7BDF8]();
}

uint64_t sub_20A8CA480()
{
  return MEMORY[0x270F7BE00]();
}

uint64_t sub_20A8CA490()
{
  return MEMORY[0x270F7BE08]();
}

uint64_t sub_20A8CA4A0()
{
  return MEMORY[0x270F7BE10]();
}

uint64_t sub_20A8CA4B0()
{
  return MEMORY[0x270F7BE18]();
}

uint64_t sub_20A8CA4C0()
{
  return MEMORY[0x270F7BE20]();
}

uint64_t sub_20A8CA4D0()
{
  return MEMORY[0x270F7BE28]();
}

uint64_t sub_20A8CA4E0()
{
  return MEMORY[0x270F7BE30]();
}

uint64_t sub_20A8CA4F0()
{
  return MEMORY[0x270F7BE38]();
}

uint64_t sub_20A8CA500()
{
  return MEMORY[0x270F7BE40]();
}

uint64_t sub_20A8CA510()
{
  return MEMORY[0x270F7BE48]();
}

uint64_t sub_20A8CA520()
{
  return MEMORY[0x270F7BE50]();
}

uint64_t sub_20A8CA530()
{
  return MEMORY[0x270F7BE58]();
}

uint64_t sub_20A8CA540()
{
  return MEMORY[0x270F7BE60]();
}

uint64_t sub_20A8CA550()
{
  return MEMORY[0x270F7BE68]();
}

uint64_t sub_20A8CA560()
{
  return MEMORY[0x270F7BE70]();
}

uint64_t sub_20A8CA570()
{
  return MEMORY[0x270F7BE78]();
}

uint64_t sub_20A8CA580()
{
  return MEMORY[0x270F7BE80]();
}

uint64_t sub_20A8CA590()
{
  return MEMORY[0x270F7BE88]();
}

uint64_t sub_20A8CA5A0()
{
  return MEMORY[0x270F7BE90]();
}

uint64_t sub_20A8CA5B0()
{
  return MEMORY[0x270F7BE98]();
}

uint64_t sub_20A8CA5E0()
{
  return MEMORY[0x270F7BEB0]();
}

uint64_t sub_20A8CA5F0()
{
  return MEMORY[0x270F7BEB8]();
}

uint64_t sub_20A8CA600()
{
  return MEMORY[0x270F7BEC0]();
}

uint64_t sub_20A8CA610()
{
  return MEMORY[0x270F7BEC8]();
}

uint64_t sub_20A8CA620()
{
  return MEMORY[0x270F7BED0]();
}

uint64_t sub_20A8CA630()
{
  return MEMORY[0x270F7BED8]();
}

uint64_t sub_20A8CA640()
{
  return MEMORY[0x270F7BEE0]();
}

uint64_t sub_20A8CA650()
{
  return MEMORY[0x270F7BEE8]();
}

uint64_t sub_20A8CA660()
{
  return MEMORY[0x270F7BEF0]();
}

uint64_t sub_20A8CA670()
{
  return MEMORY[0x270F7BEF8]();
}

uint64_t sub_20A8CA690()
{
  return MEMORY[0x270F7BF08]();
}

uint64_t sub_20A8CA6A0()
{
  return MEMORY[0x270F7BF10]();
}

uint64_t sub_20A8CA6B0()
{
  return MEMORY[0x270F7BF18]();
}

uint64_t sub_20A8CA6C0()
{
  return MEMORY[0x270F7BF20]();
}

uint64_t sub_20A8CA6D0()
{
  return MEMORY[0x270F7BF28]();
}

uint64_t sub_20A8CA6E0()
{
  return MEMORY[0x270F7BF30]();
}

uint64_t sub_20A8CA6F0()
{
  return MEMORY[0x270F7BF38]();
}

uint64_t sub_20A8CA700()
{
  return MEMORY[0x270F7BF40]();
}

uint64_t sub_20A8CA710()
{
  return MEMORY[0x270F7BF48]();
}

uint64_t sub_20A8CA720()
{
  return MEMORY[0x270F7BF50]();
}

uint64_t sub_20A8CA730()
{
  return MEMORY[0x270F7BF58]();
}

uint64_t sub_20A8CA740()
{
  return MEMORY[0x270F7BF60]();
}

uint64_t sub_20A8CA750()
{
  return MEMORY[0x270F7BF68]();
}

uint64_t sub_20A8CA760()
{
  return MEMORY[0x270F7BF70]();
}

uint64_t sub_20A8CA770()
{
  return MEMORY[0x270F7BF78]();
}

uint64_t sub_20A8CA780()
{
  return MEMORY[0x270F7BF80]();
}

uint64_t sub_20A8CA790()
{
  return MEMORY[0x270F7BF88]();
}

uint64_t sub_20A8CA7A0()
{
  return MEMORY[0x270F7BF90]();
}

uint64_t sub_20A8CA7B0()
{
  return MEMORY[0x270F7BF98]();
}

uint64_t sub_20A8CA7C0()
{
  return MEMORY[0x270F7BFA0]();
}

uint64_t sub_20A8CA7D0()
{
  return MEMORY[0x270F7BFA8]();
}

uint64_t sub_20A8CA7E0()
{
  return MEMORY[0x270F7BFB0]();
}

uint64_t sub_20A8CA7F0()
{
  return MEMORY[0x270F7BFB8]();
}

uint64_t sub_20A8CA800()
{
  return MEMORY[0x270F7BFC0]();
}

uint64_t sub_20A8CA810()
{
  return MEMORY[0x270F7BFC8]();
}

uint64_t sub_20A8CA820()
{
  return MEMORY[0x270F7BFD0]();
}

uint64_t sub_20A8CA830()
{
  return MEMORY[0x270F7BFD8]();
}

uint64_t sub_20A8CA870()
{
  return MEMORY[0x270F7C000]();
}

uint64_t sub_20A8CA880()
{
  return MEMORY[0x270F7C008]();
}

uint64_t sub_20A8CA8B0()
{
  return MEMORY[0x270F7C020]();
}

uint64_t sub_20A8CA8C0()
{
  return MEMORY[0x270F7C028]();
}

uint64_t sub_20A8CA8D0()
{
  return MEMORY[0x270F7C030]();
}

uint64_t sub_20A8CA8E0()
{
  return MEMORY[0x270F7C038]();
}

uint64_t sub_20A8CA8F0()
{
  return MEMORY[0x270F7C040]();
}

uint64_t sub_20A8CA900()
{
  return MEMORY[0x270F7C048]();
}

uint64_t sub_20A8CA910()
{
  return MEMORY[0x270F7C050]();
}

uint64_t sub_20A8CA920()
{
  return MEMORY[0x270F7C058]();
}

uint64_t sub_20A8CA930()
{
  return MEMORY[0x270F7C060]();
}

uint64_t sub_20A8CA940()
{
  return MEMORY[0x270F7C068]();
}

uint64_t sub_20A8CA950()
{
  return MEMORY[0x270F7C070]();
}

uint64_t sub_20A8CA960()
{
  return MEMORY[0x270F7C078]();
}

uint64_t sub_20A8CA970()
{
  return MEMORY[0x270F7C080]();
}

uint64_t sub_20A8CA980()
{
  return MEMORY[0x270F7C088]();
}

uint64_t sub_20A8CA990()
{
  return MEMORY[0x270F7C090]();
}

uint64_t sub_20A8CA9A0()
{
  return MEMORY[0x270F7C098]();
}

uint64_t sub_20A8CA9B0()
{
  return MEMORY[0x270F7C0A0]();
}

uint64_t sub_20A8CA9C0()
{
  return MEMORY[0x270F7C0A8]();
}

uint64_t sub_20A8CA9D0()
{
  return MEMORY[0x270F7C0B0]();
}

uint64_t sub_20A8CA9E0()
{
  return MEMORY[0x270F7C0B8]();
}

uint64_t sub_20A8CA9F0()
{
  return MEMORY[0x270F7C0C0]();
}

uint64_t sub_20A8CAA00()
{
  return MEMORY[0x270F7C0C8]();
}

uint64_t sub_20A8CAA10()
{
  return MEMORY[0x270F7C0D0]();
}

uint64_t sub_20A8CAA20()
{
  return MEMORY[0x270F7C0D8]();
}

uint64_t sub_20A8CAA30()
{
  return MEMORY[0x270F7C0E0]();
}

uint64_t sub_20A8CAA40()
{
  return MEMORY[0x270F7C0E8]();
}

uint64_t sub_20A8CAA50()
{
  return MEMORY[0x270F7C0F0]();
}

uint64_t sub_20A8CAA60()
{
  return MEMORY[0x270F7C0F8]();
}

uint64_t sub_20A8CAA70()
{
  return MEMORY[0x270F7C100]();
}

uint64_t sub_20A8CAA80()
{
  return MEMORY[0x270F7C108]();
}

uint64_t sub_20A8CAA90()
{
  return MEMORY[0x270F7C110]();
}

uint64_t sub_20A8CAAA0()
{
  return MEMORY[0x270F7C118]();
}

uint64_t sub_20A8CAAB0()
{
  return MEMORY[0x270F7C120]();
}

uint64_t sub_20A8CAAC0()
{
  return MEMORY[0x270F7C128]();
}

uint64_t sub_20A8CAAD0()
{
  return MEMORY[0x270F7C130]();
}

uint64_t sub_20A8CAAE0()
{
  return MEMORY[0x270F7C138]();
}

uint64_t sub_20A8CAAF0()
{
  return MEMORY[0x270F7C140]();
}

uint64_t sub_20A8CAB00()
{
  return MEMORY[0x270F7C148]();
}

uint64_t sub_20A8CAB10()
{
  return MEMORY[0x270F7C150]();
}

uint64_t sub_20A8CAB20()
{
  return MEMORY[0x270F7C158]();
}

uint64_t sub_20A8CAB30()
{
  return MEMORY[0x270F7C160]();
}

uint64_t sub_20A8CAB40()
{
  return MEMORY[0x270F7C168]();
}

uint64_t sub_20A8CAB50()
{
  return MEMORY[0x270F7C170]();
}

uint64_t sub_20A8CAB60()
{
  return MEMORY[0x270F7C178]();
}

uint64_t sub_20A8CAB70()
{
  return MEMORY[0x270F7C180]();
}

uint64_t sub_20A8CAB80()
{
  return MEMORY[0x270F7C188]();
}

uint64_t sub_20A8CAB90()
{
  return MEMORY[0x270F7C190]();
}

uint64_t sub_20A8CABA0()
{
  return MEMORY[0x270F7C198]();
}

uint64_t sub_20A8CABB0()
{
  return MEMORY[0x270F7C1A0]();
}

uint64_t sub_20A8CABC0()
{
  return MEMORY[0x270F7C1A8]();
}

uint64_t sub_20A8CABD0()
{
  return MEMORY[0x270F7C1B0]();
}

uint64_t sub_20A8CABE0()
{
  return MEMORY[0x270F7C1B8]();
}

uint64_t sub_20A8CABF0()
{
  return MEMORY[0x270F7C1C0]();
}

uint64_t sub_20A8CAC00()
{
  return MEMORY[0x270F7C1C8]();
}

uint64_t sub_20A8CAC10()
{
  return MEMORY[0x270F7C1D0]();
}

uint64_t sub_20A8CAC20()
{
  return MEMORY[0x270F7C1D8]();
}

uint64_t sub_20A8CAC30()
{
  return MEMORY[0x270F7C1E0]();
}

uint64_t sub_20A8CAC40()
{
  return MEMORY[0x270F7C1E8]();
}

uint64_t sub_20A8CAC50()
{
  return MEMORY[0x270F7C1F0]();
}

uint64_t sub_20A8CAC60()
{
  return MEMORY[0x270F7C1F8]();
}

uint64_t sub_20A8CAC70()
{
  return MEMORY[0x270F7C200]();
}

uint64_t sub_20A8CAC80()
{
  return MEMORY[0x270F7C208]();
}

uint64_t sub_20A8CAC90()
{
  return MEMORY[0x270F7C210]();
}

uint64_t sub_20A8CACA0()
{
  return MEMORY[0x270F7C218]();
}

uint64_t sub_20A8CACB0()
{
  return MEMORY[0x270F7C220]();
}

uint64_t sub_20A8CACC0()
{
  return MEMORY[0x270F7C228]();
}

uint64_t sub_20A8CACD0()
{
  return MEMORY[0x270F7C230]();
}

uint64_t sub_20A8CACE0()
{
  return MEMORY[0x270F7C238]();
}

uint64_t sub_20A8CACF0()
{
  return MEMORY[0x270F7C240]();
}

uint64_t sub_20A8CAD00()
{
  return MEMORY[0x270F7C248]();
}

uint64_t sub_20A8CAD10()
{
  return MEMORY[0x270F7C250]();
}

uint64_t sub_20A8CAD20()
{
  return MEMORY[0x270F7C258]();
}

uint64_t sub_20A8CAD30()
{
  return MEMORY[0x270F7C260]();
}

uint64_t sub_20A8CAD40()
{
  return MEMORY[0x270F7C268]();
}

uint64_t sub_20A8CAD50()
{
  return MEMORY[0x270F7C270]();
}

uint64_t sub_20A8CAD60()
{
  return MEMORY[0x270F7C278]();
}

uint64_t sub_20A8CAD70()
{
  return MEMORY[0x270F7C280]();
}

uint64_t sub_20A8CAD80()
{
  return MEMORY[0x270F7C288]();
}

uint64_t sub_20A8CAD90()
{
  return MEMORY[0x270F7C290]();
}

uint64_t sub_20A8CADA0()
{
  return MEMORY[0x270F7C298]();
}

uint64_t sub_20A8CADB0()
{
  return MEMORY[0x270F7C2A0]();
}

uint64_t sub_20A8CADC0()
{
  return MEMORY[0x270F7C2A8]();
}

uint64_t sub_20A8CADD0()
{
  return MEMORY[0x270F7C2B0]();
}

uint64_t sub_20A8CADE0()
{
  return MEMORY[0x270F7C2B8]();
}

uint64_t sub_20A8CADF0()
{
  return MEMORY[0x270F7C2C0]();
}

uint64_t sub_20A8CAE00()
{
  return MEMORY[0x270F7C2C8]();
}

uint64_t sub_20A8CAE10()
{
  return MEMORY[0x270F7C2D0]();
}

uint64_t sub_20A8CAE20()
{
  return MEMORY[0x270F7C2D8]();
}

uint64_t sub_20A8CAE30()
{
  return MEMORY[0x270F7C2E0]();
}

uint64_t sub_20A8CAE40()
{
  return MEMORY[0x270F7C2E8]();
}

uint64_t sub_20A8CAE50()
{
  return MEMORY[0x270F7C2F0]();
}

uint64_t sub_20A8CAE70()
{
  return MEMORY[0x270F7C300]();
}

uint64_t sub_20A8CAE80()
{
  return MEMORY[0x270F7C308]();
}

uint64_t sub_20A8CAEA0()
{
  return MEMORY[0x270F7C318]();
}

uint64_t sub_20A8CAEB0()
{
  return MEMORY[0x270F7C320]();
}

uint64_t sub_20A8CAF20()
{
  return MEMORY[0x270F7C358]();
}

uint64_t sub_20A8CAF30()
{
  return MEMORY[0x270F7C360]();
}

uint64_t sub_20A8CAF40()
{
  return MEMORY[0x270F7C368]();
}

uint64_t sub_20A8CAF50()
{
  return MEMORY[0x270F7C370]();
}

uint64_t sub_20A8CAF60()
{
  return MEMORY[0x270F7C378]();
}

uint64_t sub_20A8CAF70()
{
  return MEMORY[0x270F7C380]();
}

uint64_t sub_20A8CAFA0()
{
  return MEMORY[0x270F7C398]();
}

uint64_t sub_20A8CAFC0()
{
  return MEMORY[0x270F7C3A8]();
}

uint64_t sub_20A8CAFD0()
{
  return MEMORY[0x270F7C3B0]();
}

uint64_t sub_20A8CAFE0()
{
  return MEMORY[0x270F7C3B8]();
}

uint64_t sub_20A8CAFF0()
{
  return MEMORY[0x270F7C3C0]();
}

uint64_t sub_20A8CB000()
{
  return MEMORY[0x270F7C3C8]();
}

uint64_t sub_20A8CB010()
{
  return MEMORY[0x270F7C3D0]();
}

uint64_t sub_20A8CB020()
{
  return MEMORY[0x270F7C3D8]();
}

uint64_t sub_20A8CB030()
{
  return MEMORY[0x270F7C3E0]();
}

uint64_t sub_20A8CB040()
{
  return MEMORY[0x270F7C3E8]();
}

uint64_t sub_20A8CB060()
{
  return MEMORY[0x270F7C3F8]();
}

uint64_t sub_20A8CB080()
{
  return MEMORY[0x270F7C408]();
}

uint64_t sub_20A8CB090()
{
  return MEMORY[0x270F7C410]();
}

uint64_t sub_20A8CB0A0()
{
  return MEMORY[0x270F7C418]();
}

uint64_t sub_20A8CB0B0()
{
  return MEMORY[0x270F7C420]();
}

uint64_t sub_20A8CB0D0()
{
  return MEMORY[0x270F7C430]();
}

uint64_t sub_20A8CB0E0()
{
  return MEMORY[0x270F7C438]();
}

uint64_t sub_20A8CB0F0()
{
  return MEMORY[0x270F7C440]();
}

uint64_t sub_20A8CB100()
{
  return MEMORY[0x270F7C448]();
}

uint64_t sub_20A8CB110()
{
  return MEMORY[0x270F7C450]();
}

uint64_t sub_20A8CB120()
{
  return MEMORY[0x270F7C458]();
}

uint64_t sub_20A8CB130()
{
  return MEMORY[0x270F7C460]();
}

uint64_t sub_20A8CB140()
{
  return MEMORY[0x270F7C468]();
}

uint64_t sub_20A8CB150()
{
  return MEMORY[0x270F7C470]();
}

uint64_t sub_20A8CB160()
{
  return MEMORY[0x270F7C478]();
}

uint64_t sub_20A8CB170()
{
  return MEMORY[0x270F7C480]();
}

uint64_t sub_20A8CB180()
{
  return MEMORY[0x270F7C488]();
}

uint64_t sub_20A8CB190()
{
  return MEMORY[0x270F7C490]();
}

uint64_t sub_20A8CB1A0()
{
  return MEMORY[0x270F7C498]();
}

uint64_t sub_20A8CB1B0()
{
  return MEMORY[0x270F7C4A0]();
}

uint64_t sub_20A8CB1C0()
{
  return MEMORY[0x270F7C4A8]();
}

uint64_t sub_20A8CB1D0()
{
  return MEMORY[0x270F7C4B0]();
}

uint64_t sub_20A8CB1E0()
{
  return MEMORY[0x270F7C4B8]();
}

uint64_t sub_20A8CB1F0()
{
  return MEMORY[0x270F7C4C0]();
}

uint64_t sub_20A8CB200()
{
  return MEMORY[0x270F7C4C8]();
}

uint64_t sub_20A8CB210()
{
  return MEMORY[0x270F7C4D0]();
}

uint64_t sub_20A8CB220()
{
  return MEMORY[0x270F7C4D8]();
}

uint64_t sub_20A8CB230()
{
  return MEMORY[0x270F7C4E0]();
}

uint64_t sub_20A8CB250()
{
  return MEMORY[0x270F7C4F0]();
}

uint64_t sub_20A8CB260()
{
  return MEMORY[0x270F7C4F8]();
}

uint64_t sub_20A8CB270()
{
  return MEMORY[0x270F7C500]();
}

uint64_t sub_20A8CB280()
{
  return MEMORY[0x270F7C508]();
}

uint64_t sub_20A8CB290()
{
  return MEMORY[0x270F7C510]();
}

uint64_t sub_20A8CB2A0()
{
  return MEMORY[0x270F7C518]();
}

uint64_t sub_20A8CB2B0()
{
  return MEMORY[0x270F7C520]();
}

uint64_t sub_20A8CB2C0()
{
  return MEMORY[0x270F7C528]();
}

uint64_t sub_20A8CB2D0()
{
  return MEMORY[0x270F7C530]();
}

uint64_t sub_20A8CB2E0()
{
  return MEMORY[0x270F7C538]();
}

uint64_t sub_20A8CB2F0()
{
  return MEMORY[0x270F7C540]();
}

uint64_t sub_20A8CB300()
{
  return MEMORY[0x270F7C548]();
}

uint64_t sub_20A8CB310()
{
  return MEMORY[0x270F7C550]();
}

uint64_t sub_20A8CB320()
{
  return MEMORY[0x270F7C558]();
}

uint64_t sub_20A8CB330()
{
  return MEMORY[0x270F7C560]();
}

uint64_t sub_20A8CB340()
{
  return MEMORY[0x270F7C568]();
}

uint64_t sub_20A8CB350()
{
  return MEMORY[0x270F7C570]();
}

uint64_t sub_20A8CB370()
{
  return MEMORY[0x270F7C580]();
}

uint64_t sub_20A8CB380()
{
  return MEMORY[0x270F7C588]();
}

uint64_t sub_20A8CB390()
{
  return MEMORY[0x270F7C590]();
}

uint64_t sub_20A8CB3A0()
{
  return MEMORY[0x270F7C598]();
}

uint64_t sub_20A8CB3B0()
{
  return MEMORY[0x270F7C5A0]();
}

uint64_t sub_20A8CB3C0()
{
  return MEMORY[0x270F7C5A8]();
}

uint64_t sub_20A8CB3D0()
{
  return MEMORY[0x270F7C5B0]();
}

uint64_t sub_20A8CB3E0()
{
  return MEMORY[0x270F7C5B8]();
}

uint64_t sub_20A8CB3F0()
{
  return MEMORY[0x270F7C5C0]();
}

uint64_t sub_20A8CB400()
{
  return MEMORY[0x270F7C5C8]();
}

uint64_t sub_20A8CB410()
{
  return MEMORY[0x270F7C5D0]();
}

uint64_t sub_20A8CB420()
{
  return MEMORY[0x270F7C5D8]();
}

uint64_t sub_20A8CB430()
{
  return MEMORY[0x270F7C5E0]();
}

uint64_t sub_20A8CB440()
{
  return MEMORY[0x270F7C5E8]();
}

uint64_t sub_20A8CB450()
{
  return MEMORY[0x270F7C5F0]();
}

uint64_t sub_20A8CB460()
{
  return MEMORY[0x270F7C5F8]();
}

uint64_t sub_20A8CB470()
{
  return MEMORY[0x270F7C600]();
}

uint64_t sub_20A8CB480()
{
  return MEMORY[0x270F7C608]();
}

uint64_t sub_20A8CB490()
{
  return MEMORY[0x270F7C610]();
}

uint64_t sub_20A8CB4A0()
{
  return MEMORY[0x270F7C618]();
}

uint64_t sub_20A8CB4B0()
{
  return MEMORY[0x270F7C620]();
}

uint64_t sub_20A8CB4C0()
{
  return MEMORY[0x270F7C628]();
}

uint64_t sub_20A8CB4D0()
{
  return MEMORY[0x270F7C630]();
}

uint64_t sub_20A8CB4E0()
{
  return MEMORY[0x270F7C638]();
}

uint64_t sub_20A8CB4F0()
{
  return MEMORY[0x270F7C640]();
}

uint64_t sub_20A8CB500()
{
  return MEMORY[0x270F7C648]();
}

uint64_t sub_20A8CB510()
{
  return MEMORY[0x270F7C650]();
}

uint64_t sub_20A8CB520()
{
  return MEMORY[0x270F7C658]();
}

uint64_t sub_20A8CB530()
{
  return MEMORY[0x270F7C660]();
}

uint64_t sub_20A8CB540()
{
  return MEMORY[0x270F7C668]();
}

uint64_t sub_20A8CB550()
{
  return MEMORY[0x270F7C670]();
}

uint64_t sub_20A8CB560()
{
  return MEMORY[0x270F7C678]();
}

uint64_t sub_20A8CB570()
{
  return MEMORY[0x270F7C680]();
}

uint64_t sub_20A8CB580()
{
  return MEMORY[0x270F7C688]();
}

uint64_t sub_20A8CB590()
{
  return MEMORY[0x270F7C690]();
}

uint64_t sub_20A8CB5A0()
{
  return MEMORY[0x270F7C698]();
}

uint64_t sub_20A8CB5B0()
{
  return MEMORY[0x270F7C6A0]();
}

uint64_t sub_20A8CB5C0()
{
  return MEMORY[0x270F7C6A8]();
}

uint64_t sub_20A8CB5D0()
{
  return MEMORY[0x270F7C6B0]();
}

uint64_t sub_20A8CB5E0()
{
  return MEMORY[0x270F4EF60]();
}

uint64_t sub_20A8CB5F0()
{
  return MEMORY[0x270F4EF68]();
}

uint64_t sub_20A8CB600()
{
  return MEMORY[0x270F4EF70]();
}

uint64_t sub_20A8CB610()
{
  return MEMORY[0x270F4EF78]();
}

uint64_t sub_20A8CB620()
{
  return MEMORY[0x270F4EF80]();
}

uint64_t sub_20A8CB630()
{
  return MEMORY[0x270F7C6B8]();
}

uint64_t sub_20A8CB640()
{
  return MEMORY[0x270F7C6C0]();
}

uint64_t sub_20A8CB650()
{
  return MEMORY[0x270F7C6C8]();
}

uint64_t sub_20A8CB660()
{
  return MEMORY[0x270F7C6D0]();
}

uint64_t sub_20A8CB670()
{
  return MEMORY[0x270F7C6D8]();
}

uint64_t sub_20A8CB680()
{
  return MEMORY[0x270F7C6E0]();
}

uint64_t sub_20A8CB690()
{
  return MEMORY[0x270F4F260]();
}

uint64_t sub_20A8CB6A0()
{
  return MEMORY[0x270F4F268]();
}

uint64_t sub_20A8CB6B0()
{
  return MEMORY[0x270F4F270]();
}

uint64_t sub_20A8CB6C0()
{
  return MEMORY[0x270F4F278]();
}

uint64_t sub_20A8CB6D0()
{
  return MEMORY[0x270F4F280]();
}

uint64_t sub_20A8CB6E0()
{
  return MEMORY[0x270F4F288]();
}

uint64_t sub_20A8CB6F0()
{
  return MEMORY[0x270F4F290]();
}

uint64_t sub_20A8CB700()
{
  return MEMORY[0x270F4F298]();
}

uint64_t sub_20A8CB710()
{
  return MEMORY[0x270F4F2A0]();
}

uint64_t sub_20A8CB720()
{
  return MEMORY[0x270F4F2A8]();
}

uint64_t sub_20A8CB730()
{
  return MEMORY[0x270F4F2B0]();
}

uint64_t sub_20A8CB740()
{
  return MEMORY[0x270F4F2B8]();
}

uint64_t sub_20A8CB750()
{
  return MEMORY[0x270F4F2C0]();
}

uint64_t sub_20A8CB760()
{
  return MEMORY[0x270F4F2C8]();
}

uint64_t sub_20A8CB770()
{
  return MEMORY[0x270F4F2D0]();
}

uint64_t sub_20A8CB780()
{
  return MEMORY[0x270F4F2D8]();
}

uint64_t sub_20A8CB790()
{
  return MEMORY[0x270F4F2E0]();
}

uint64_t sub_20A8CB7A0()
{
  return MEMORY[0x270F4F2E8]();
}

uint64_t sub_20A8CB7B0()
{
  return MEMORY[0x270F4F2F0]();
}

uint64_t sub_20A8CB7C0()
{
  return MEMORY[0x270F4F2F8]();
}

uint64_t sub_20A8CB7D0()
{
  return MEMORY[0x270F4EF88]();
}

uint64_t sub_20A8CB7E0()
{
  return MEMORY[0x270F4F300]();
}

uint64_t sub_20A8CB7F0()
{
  return MEMORY[0x270F4F308]();
}

uint64_t sub_20A8CB800()
{
  return MEMORY[0x270F4F310]();
}

uint64_t sub_20A8CB810()
{
  return MEMORY[0x270F4F318]();
}

uint64_t sub_20A8CB820()
{
  return MEMORY[0x270F7C6E8]();
}

uint64_t sub_20A8CB830()
{
  return MEMORY[0x270F7C6F0]();
}

uint64_t sub_20A8CB840()
{
  return MEMORY[0x270F7C6F8]();
}

uint64_t sub_20A8CB850()
{
  return MEMORY[0x270F7C700]();
}

uint64_t sub_20A8CB860()
{
  return MEMORY[0x270F7C708]();
}

uint64_t sub_20A8CB870()
{
  return MEMORY[0x270F7C710]();
}

uint64_t sub_20A8CB880()
{
  return MEMORY[0x270F7C718]();
}

uint64_t sub_20A8CB890()
{
  return MEMORY[0x270F7C720]();
}

uint64_t sub_20A8CB8A0()
{
  return MEMORY[0x270F7C728]();
}

uint64_t sub_20A8CB8B0()
{
  return MEMORY[0x270F7C730]();
}

uint64_t sub_20A8CB8C0()
{
  return MEMORY[0x270F7C738]();
}

uint64_t sub_20A8CB8D0()
{
  return MEMORY[0x270F7C740]();
}

uint64_t sub_20A8CB8E0()
{
  return MEMORY[0x270F7C748]();
}

uint64_t sub_20A8CB8F0()
{
  return MEMORY[0x270F7C750]();
}

uint64_t sub_20A8CB900()
{
  return MEMORY[0x270F7C758]();
}

uint64_t sub_20A8CB910()
{
  return MEMORY[0x270F7C760]();
}

uint64_t sub_20A8CB920()
{
  return MEMORY[0x270F7C768]();
}

uint64_t sub_20A8CB930()
{
  return MEMORY[0x270F7C770]();
}

uint64_t sub_20A8CB940()
{
  return MEMORY[0x270F7C778]();
}

uint64_t sub_20A8CB950()
{
  return MEMORY[0x270F7C780]();
}

uint64_t sub_20A8CB960()
{
  return MEMORY[0x270F7C788]();
}

uint64_t sub_20A8CB970()
{
  return MEMORY[0x270F7C790]();
}

uint64_t sub_20A8CB980()
{
  return MEMORY[0x270F7C798]();
}

uint64_t sub_20A8CB990()
{
  return MEMORY[0x270F7C7A0]();
}

uint64_t sub_20A8CB9A0()
{
  return MEMORY[0x270F7C7A8]();
}

uint64_t sub_20A8CB9B0()
{
  return MEMORY[0x270F7C7B0]();
}

uint64_t sub_20A8CB9C0()
{
  return MEMORY[0x270F7C7B8]();
}

uint64_t sub_20A8CB9D0()
{
  return MEMORY[0x270F7C7C0]();
}

uint64_t sub_20A8CB9E0()
{
  return MEMORY[0x270F7C7C8]();
}

uint64_t sub_20A8CB9F0()
{
  return MEMORY[0x270F7C7D0]();
}

uint64_t sub_20A8CBA00()
{
  return MEMORY[0x270F7C7D8]();
}

uint64_t sub_20A8CBA10()
{
  return MEMORY[0x270F7C7E0]();
}

uint64_t sub_20A8CBA20()
{
  return MEMORY[0x270F7C7E8]();
}

uint64_t sub_20A8CBA30()
{
  return MEMORY[0x270F7C7F0]();
}

uint64_t sub_20A8CBA40()
{
  return MEMORY[0x270F7C7F8]();
}

uint64_t sub_20A8CBA50()
{
  return MEMORY[0x270F7C800]();
}

uint64_t sub_20A8CBA60()
{
  return MEMORY[0x270F7C808]();
}

uint64_t sub_20A8CBA70()
{
  return MEMORY[0x270F7C810]();
}

uint64_t sub_20A8CBA80()
{
  return MEMORY[0x270F7C818]();
}

uint64_t sub_20A8CBA90()
{
  return MEMORY[0x270F7C820]();
}

uint64_t sub_20A8CBAA0()
{
  return MEMORY[0x270F7C828]();
}

uint64_t sub_20A8CBAB0()
{
  return MEMORY[0x270F7C830]();
}

uint64_t sub_20A8CBAC0()
{
  return MEMORY[0x270F7C838]();
}

uint64_t sub_20A8CBAD0()
{
  return MEMORY[0x270F7C840]();
}

uint64_t sub_20A8CBAE0()
{
  return MEMORY[0x270F4F320]();
}

uint64_t sub_20A8CBAF0()
{
  return MEMORY[0x270F4F328]();
}

uint64_t sub_20A8CBB00()
{
  return MEMORY[0x270F7C848]();
}

uint64_t sub_20A8CBB10()
{
  return MEMORY[0x270F7C850]();
}

uint64_t sub_20A8CBB20()
{
  return MEMORY[0x270F7C858]();
}

uint64_t sub_20A8CBB30()
{
  return MEMORY[0x270F7C860]();
}

uint64_t sub_20A8CBB40()
{
  return MEMORY[0x270F7C868]();
}

uint64_t sub_20A8CBB50()
{
  return MEMORY[0x270F7C870]();
}

uint64_t sub_20A8CBB60()
{
  return MEMORY[0x270F7C878]();
}

uint64_t sub_20A8CBB70()
{
  return MEMORY[0x270F7C880]();
}

uint64_t sub_20A8CBB80()
{
  return MEMORY[0x270F7C888]();
}

uint64_t sub_20A8CBB90()
{
  return MEMORY[0x270F7C890]();
}

uint64_t sub_20A8CBBA0()
{
  return MEMORY[0x270F7C898]();
}

uint64_t sub_20A8CBBB0()
{
  return MEMORY[0x270F7C8A0]();
}

uint64_t sub_20A8CBBC0()
{
  return MEMORY[0x270F7C8A8]();
}

uint64_t sub_20A8CBBD0()
{
  return MEMORY[0x270F7C8B8]();
}

uint64_t sub_20A8CBBE0()
{
  return MEMORY[0x270F7C8C0]();
}

uint64_t sub_20A8CBBF0()
{
  return MEMORY[0x270F7C8C8]();
}

uint64_t sub_20A8CBC00()
{
  return MEMORY[0x270F7C8D0]();
}

uint64_t sub_20A8CBC10()
{
  return MEMORY[0x270F7C8D8]();
}

uint64_t sub_20A8CBC20()
{
  return MEMORY[0x270F7C8E0]();
}

uint64_t sub_20A8CBC30()
{
  return MEMORY[0x270F7C8E8]();
}

uint64_t sub_20A8CBC40()
{
  return MEMORY[0x270F7C8F0]();
}

uint64_t sub_20A8CBC50()
{
  return MEMORY[0x270F7C8F8]();
}

uint64_t sub_20A8CBC60()
{
  return MEMORY[0x270F7C900]();
}

uint64_t sub_20A8CBC70()
{
  return MEMORY[0x270F7C908]();
}

uint64_t sub_20A8CBC80()
{
  return MEMORY[0x270F7C910]();
}

uint64_t sub_20A8CBC90()
{
  return MEMORY[0x270F7C918]();
}

uint64_t sub_20A8CBCA0()
{
  return MEMORY[0x270F7C920]();
}

uint64_t sub_20A8CBCB0()
{
  return MEMORY[0x270F81750]();
}

uint64_t sub_20A8CBCC0()
{
  return MEMORY[0x270F81950]();
}

uint64_t sub_20A8CBCD0()
{
  return MEMORY[0x270F81958]();
}

uint64_t sub_20A8CBCE0()
{
  return MEMORY[0x270F81960]();
}

uint64_t sub_20A8CBCF0()
{
  return MEMORY[0x270F81968]();
}

uint64_t sub_20A8CBD00()
{
  return MEMORY[0x270F81970]();
}

uint64_t sub_20A8CBD10()
{
  return MEMORY[0x270F81978]();
}

uint64_t sub_20A8CBD20()
{
  return MEMORY[0x270F819B8]();
}

uint64_t sub_20A8CBD30()
{
  return MEMORY[0x270F819C0]();
}

uint64_t sub_20A8CBD40()
{
  return MEMORY[0x270F819D0]();
}

uint64_t sub_20A8CBD50()
{
  return MEMORY[0x270F81CA0]();
}

uint64_t sub_20A8CBD60()
{
  return MEMORY[0x270F81CA8]();
}

uint64_t sub_20A8CBD70()
{
  return MEMORY[0x270F81CB0]();
}

uint64_t sub_20A8CBD80()
{
  return MEMORY[0x270F81CD0]();
}

uint64_t sub_20A8CBD90()
{
  return MEMORY[0x270F820B8]();
}

uint64_t sub_20A8CBDA0()
{
  return MEMORY[0x270F821D0]();
}

uint64_t sub_20A8CBDB0()
{
  return MEMORY[0x270F821D8]();
}

uint64_t sub_20A8CBDC0()
{
  return MEMORY[0x270F82348]();
}

uint64_t sub_20A8CBDD0()
{
  return MEMORY[0x270F82358]();
}

uint64_t sub_20A8CBDE0()
{
  return MEMORY[0x270F82360]();
}

uint64_t sub_20A8CBDF0()
{
  return MEMORY[0x270F82370]();
}

uint64_t sub_20A8CBE00()
{
  return MEMORY[0x270F82378]();
}

uint64_t sub_20A8CBE10()
{
  return MEMORY[0x270F82388]();
}

uint64_t sub_20A8CBE20()
{
  return MEMORY[0x270F82398]();
}

uint64_t sub_20A8CBE30()
{
  return MEMORY[0x270EE3890]();
}

uint64_t sub_20A8CBE40()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_20A8CBE50()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_20A8CBE60()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_20A8CBE70()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_20A8CBE80()
{
  return MEMORY[0x270EE3E70]();
}

uint64_t sub_20A8CBE90()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_20A8CBEA0()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_20A8CBEB0()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_20A8CBEC0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_20A8CBED0()
{
  return MEMORY[0x270F4E558]();
}

uint64_t sub_20A8CBEE0()
{
  return MEMORY[0x270F4E560]();
}

uint64_t sub_20A8CBEF0()
{
  return MEMORY[0x270F4E568]();
}

uint64_t sub_20A8CBF00()
{
  return MEMORY[0x270F4E570]();
}

uint64_t sub_20A8CBF10()
{
  return MEMORY[0x270F4E578]();
}

uint64_t sub_20A8CBF20()
{
  return MEMORY[0x270F4E580]();
}

uint64_t sub_20A8CBF30()
{
  return MEMORY[0x270F4E588]();
}

uint64_t sub_20A8CBF40()
{
  return MEMORY[0x270F4E590]();
}

uint64_t sub_20A8CBF50()
{
  return MEMORY[0x270F4E598]();
}

uint64_t sub_20A8CBF60()
{
  return MEMORY[0x270F77E08]();
}

uint64_t sub_20A8CBF70()
{
  return MEMORY[0x270F4E5A0]();
}

uint64_t sub_20A8CBF80()
{
  return MEMORY[0x270F4E5B0]();
}

uint64_t sub_20A8CBF90()
{
  return MEMORY[0x270F4E5E8]();
}

uint64_t sub_20A8CBFA0()
{
  return MEMORY[0x270F4E5F0]();
}

uint64_t sub_20A8CBFB0()
{
  return MEMORY[0x270F4E5F8]();
}

uint64_t sub_20A8CBFC0()
{
  return MEMORY[0x270F4E600]();
}

uint64_t sub_20A8CBFD0()
{
  return MEMORY[0x270F4E608]();
}

uint64_t sub_20A8CBFE0()
{
  return MEMORY[0x270F4E610]();
}

uint64_t sub_20A8CBFF0()
{
  return MEMORY[0x270F4E638]();
}

uint64_t sub_20A8CC000()
{
  return MEMORY[0x270F4E640]();
}

uint64_t sub_20A8CC010()
{
  return MEMORY[0x270F4E648]();
}

uint64_t sub_20A8CC020()
{
  return MEMORY[0x270F4E650]();
}

uint64_t sub_20A8CC030()
{
  return MEMORY[0x270F4E658]();
}

uint64_t sub_20A8CC040()
{
  return MEMORY[0x270F4E660]();
}

uint64_t sub_20A8CC050()
{
  return MEMORY[0x270F4E668]();
}

uint64_t sub_20A8CC060()
{
  return MEMORY[0x270F4E670]();
}

uint64_t sub_20A8CC070()
{
  return MEMORY[0x270F4E678]();
}

uint64_t sub_20A8CC080()
{
  return MEMORY[0x270F4E680]();
}

uint64_t sub_20A8CC090()
{
  return MEMORY[0x270F4E688]();
}

uint64_t sub_20A8CC0A0()
{
  return MEMORY[0x270F4E690]();
}

uint64_t sub_20A8CC0B0()
{
  return MEMORY[0x270F4E698]();
}

uint64_t sub_20A8CC0C0()
{
  return MEMORY[0x270F4E6A0]();
}

uint64_t sub_20A8CC0D0()
{
  return MEMORY[0x270F4E6A8]();
}

uint64_t sub_20A8CC0E0()
{
  return MEMORY[0x270F4E6B0]();
}

uint64_t sub_20A8CC0F0()
{
  return MEMORY[0x270F4E6B8]();
}

uint64_t sub_20A8CC100()
{
  return MEMORY[0x270F4E6C0]();
}

uint64_t sub_20A8CC110()
{
  return MEMORY[0x270F4E6C8]();
}

uint64_t sub_20A8CC120()
{
  return MEMORY[0x270F4E6D0]();
}

uint64_t sub_20A8CC130()
{
  return MEMORY[0x270F4E6D8]();
}

uint64_t sub_20A8CC140()
{
  return MEMORY[0x270F4E6E8]();
}

uint64_t sub_20A8CC150()
{
  return MEMORY[0x270F4E6F0]();
}

uint64_t sub_20A8CC160()
{
  return MEMORY[0x270F4E6F8]();
}

uint64_t sub_20A8CC170()
{
  return MEMORY[0x270F4E700]();
}

uint64_t sub_20A8CC180()
{
  return MEMORY[0x270F4E710]();
}

uint64_t sub_20A8CC190()
{
  return MEMORY[0x270F4E718]();
}

uint64_t sub_20A8CC1A0()
{
  return MEMORY[0x270F4E720]();
}

uint64_t sub_20A8CC1B0()
{
  return MEMORY[0x270F4E730]();
}

uint64_t sub_20A8CC1C0()
{
  return MEMORY[0x270F4E738]();
}

uint64_t sub_20A8CC1D0()
{
  return MEMORY[0x270F4E740]();
}

uint64_t sub_20A8CC1E0()
{
  return MEMORY[0x270F4E748]();
}

uint64_t sub_20A8CC1F0()
{
  return MEMORY[0x270F4E750]();
}

uint64_t sub_20A8CC200()
{
  return MEMORY[0x270F4E758]();
}

uint64_t sub_20A8CC210()
{
  return MEMORY[0x270F4E760]();
}

uint64_t sub_20A8CC220()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_20A8CC230()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_20A8CC240()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_20A8CC250()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_20A8CC260()
{
  return MEMORY[0x270FA0A80]();
}

uint64_t sub_20A8CC270()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_20A8CC280()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_20A8CC290()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_20A8CC2A0()
{
  return MEMORY[0x270F4F330]();
}

uint64_t sub_20A8CC2B0()
{
  return MEMORY[0x270F4F338]();
}

uint64_t sub_20A8CC2C0()
{
  return MEMORY[0x270F4F340]();
}

uint64_t sub_20A8CC2D0()
{
  return MEMORY[0x270F4F348]();
}

uint64_t sub_20A8CC2E0()
{
  return MEMORY[0x270F4F350]();
}

uint64_t sub_20A8CC2F0()
{
  return MEMORY[0x270F4F358]();
}

uint64_t sub_20A8CC300()
{
  return MEMORY[0x270F4F360]();
}

uint64_t sub_20A8CC310()
{
  return MEMORY[0x270F4F368]();
}

uint64_t sub_20A8CC320()
{
  return MEMORY[0x270F4F370]();
}

uint64_t sub_20A8CC330()
{
  return MEMORY[0x270F4F378]();
}

uint64_t sub_20A8CC340()
{
  return MEMORY[0x270F4F380]();
}

uint64_t sub_20A8CC350()
{
  return MEMORY[0x270F4F388]();
}

uint64_t sub_20A8CC360()
{
  return MEMORY[0x270F4F390]();
}

uint64_t sub_20A8CC370()
{
  return MEMORY[0x270F4F398]();
}

uint64_t sub_20A8CC380()
{
  return MEMORY[0x270F4F3A0]();
}

uint64_t sub_20A8CC390()
{
  return MEMORY[0x270F4F3A8]();
}

uint64_t sub_20A8CC3A0()
{
  return MEMORY[0x270F4F3B0]();
}

uint64_t sub_20A8CC3B0()
{
  return MEMORY[0x270F4F3B8]();
}

uint64_t sub_20A8CC3C0()
{
  return MEMORY[0x270F4F3C0]();
}

uint64_t sub_20A8CC3D0()
{
  return MEMORY[0x270F4F3C8]();
}

uint64_t sub_20A8CC3E0()
{
  return MEMORY[0x270F4F3D0]();
}

uint64_t sub_20A8CC3F0()
{
  return MEMORY[0x270F4F3D8]();
}

uint64_t sub_20A8CC400()
{
  return MEMORY[0x270F4F3E0]();
}

uint64_t sub_20A8CC410()
{
  return MEMORY[0x270F4F3E8]();
}

uint64_t sub_20A8CC420()
{
  return MEMORY[0x270F4F3F0]();
}

uint64_t sub_20A8CC430()
{
  return MEMORY[0x270F4F3F8]();
}

uint64_t sub_20A8CC440()
{
  return MEMORY[0x270F4F400]();
}

uint64_t sub_20A8CC450()
{
  return MEMORY[0x270F4F408]();
}

uint64_t sub_20A8CC460()
{
  return MEMORY[0x270F4F410]();
}

uint64_t sub_20A8CC470()
{
  return MEMORY[0x270F4F418]();
}

uint64_t sub_20A8CC480()
{
  return MEMORY[0x270F4F420]();
}

uint64_t sub_20A8CC490()
{
  return MEMORY[0x270F4F428]();
}

uint64_t sub_20A8CC4A0()
{
  return MEMORY[0x270F4F438]();
}

uint64_t sub_20A8CC4B0()
{
  return MEMORY[0x270F4F440]();
}

uint64_t sub_20A8CC4C0()
{
  return MEMORY[0x270F4F448]();
}

uint64_t sub_20A8CC4D0()
{
  return MEMORY[0x270F4F450]();
}

uint64_t sub_20A8CC4E0()
{
  return MEMORY[0x270F4F458]();
}

uint64_t sub_20A8CC4F0()
{
  return MEMORY[0x270F4F460]();
}

uint64_t sub_20A8CC500()
{
  return MEMORY[0x270F4F468]();
}

uint64_t sub_20A8CC510()
{
  return MEMORY[0x270F4F470]();
}

uint64_t sub_20A8CC520()
{
  return MEMORY[0x270F4F478]();
}

uint64_t sub_20A8CC530()
{
  return MEMORY[0x270F4F480]();
}

uint64_t sub_20A8CC540()
{
  return MEMORY[0x270F4F488]();
}

uint64_t sub_20A8CC550()
{
  return MEMORY[0x270F4F490]();
}

uint64_t sub_20A8CC560()
{
  return MEMORY[0x270F4F498]();
}

uint64_t sub_20A8CC570()
{
  return MEMORY[0x270F4F4A0]();
}

uint64_t sub_20A8CC580()
{
  return MEMORY[0x270F4F4A8]();
}

uint64_t sub_20A8CC590()
{
  return MEMORY[0x270F4F4B0]();
}

uint64_t sub_20A8CC5A0()
{
  return MEMORY[0x270F4F4B8]();
}

uint64_t sub_20A8CC5B0()
{
  return MEMORY[0x270F4F4C0]();
}

uint64_t sub_20A8CC5C0()
{
  return MEMORY[0x270F4F4C8]();
}

uint64_t sub_20A8CC5D0()
{
  return MEMORY[0x270F4F4D0]();
}

uint64_t sub_20A8CC5E0()
{
  return MEMORY[0x270F4F4D8]();
}

uint64_t sub_20A8CC5F0()
{
  return MEMORY[0x270F4F4E0]();
}

uint64_t sub_20A8CC600()
{
  return MEMORY[0x270F4F4E8]();
}

uint64_t sub_20A8CC610()
{
  return MEMORY[0x270F4F4F0]();
}

uint64_t sub_20A8CC620()
{
  return MEMORY[0x270F4F4F8]();
}

uint64_t sub_20A8CC630()
{
  return MEMORY[0x270F4F500]();
}

uint64_t sub_20A8CC640()
{
  return MEMORY[0x270F4F508]();
}

uint64_t sub_20A8CC650()
{
  return MEMORY[0x270F4F510]();
}

uint64_t sub_20A8CC660()
{
  return MEMORY[0x270F4F518]();
}

uint64_t sub_20A8CC670()
{
  return MEMORY[0x270F4F520]();
}

uint64_t sub_20A8CC680()
{
  return MEMORY[0x270F4F528]();
}

uint64_t sub_20A8CC690()
{
  return MEMORY[0x270F4F530]();
}

uint64_t sub_20A8CC6A0()
{
  return MEMORY[0x270F4F538]();
}

uint64_t sub_20A8CC6B0()
{
  return MEMORY[0x270F4F540]();
}

uint64_t sub_20A8CC6C0()
{
  return MEMORY[0x270F4F548]();
}

uint64_t sub_20A8CC6D0()
{
  return MEMORY[0x270F4F550]();
}

uint64_t sub_20A8CC6E0()
{
  return MEMORY[0x270F4F558]();
}

uint64_t sub_20A8CC6F0()
{
  return MEMORY[0x270F4F560]();
}

uint64_t sub_20A8CC700()
{
  return MEMORY[0x270F4F568]();
}

uint64_t sub_20A8CC710()
{
  return MEMORY[0x270F4F570]();
}

uint64_t sub_20A8CC720()
{
  return MEMORY[0x270F4F578]();
}

uint64_t sub_20A8CC730()
{
  return MEMORY[0x270F4F580]();
}

uint64_t sub_20A8CC740()
{
  return MEMORY[0x270F4F588]();
}

uint64_t sub_20A8CC750()
{
  return MEMORY[0x270F4F590]();
}

uint64_t sub_20A8CC760()
{
  return MEMORY[0x270F4F598]();
}

uint64_t sub_20A8CC770()
{
  return MEMORY[0x270F4F5A0]();
}

uint64_t sub_20A8CC780()
{
  return MEMORY[0x270F4F5A8]();
}

uint64_t sub_20A8CC790()
{
  return MEMORY[0x270F4F5B0]();
}

uint64_t sub_20A8CC7A0()
{
  return MEMORY[0x270F4F5B8]();
}

uint64_t sub_20A8CC7B0()
{
  return MEMORY[0x270F4F5C0]();
}

uint64_t sub_20A8CC7C0()
{
  return MEMORY[0x270F4F5C8]();
}

uint64_t sub_20A8CC7D0()
{
  return MEMORY[0x270F4F5D0]();
}

uint64_t sub_20A8CC7F0()
{
  return MEMORY[0x270F4F5E0]();
}

uint64_t sub_20A8CC800()
{
  return MEMORY[0x270F4F5E8]();
}

uint64_t sub_20A8CC810()
{
  return MEMORY[0x270F4F5F0]();
}

uint64_t sub_20A8CC820()
{
  return MEMORY[0x270F4F5F8]();
}

uint64_t sub_20A8CC830()
{
  return MEMORY[0x270F4F600]();
}

uint64_t sub_20A8CC850()
{
  return MEMORY[0x270F4F610]();
}

uint64_t sub_20A8CC860()
{
  return MEMORY[0x270F4F618]();
}

uint64_t sub_20A8CC870()
{
  return MEMORY[0x270F4F620]();
}

uint64_t sub_20A8CC880()
{
  return MEMORY[0x270F4F628]();
}

uint64_t sub_20A8CC890()
{
  return MEMORY[0x270F4F630]();
}

uint64_t sub_20A8CC8A0()
{
  return MEMORY[0x270F4F638]();
}

uint64_t sub_20A8CC8B0()
{
  return MEMORY[0x270F4F640]();
}

uint64_t sub_20A8CC8C0()
{
  return MEMORY[0x270F4F648]();
}

uint64_t sub_20A8CC8D0()
{
  return MEMORY[0x270F4F650]();
}

uint64_t sub_20A8CC8E0()
{
  return MEMORY[0x270F4F658]();
}

uint64_t sub_20A8CC8F0()
{
  return MEMORY[0x270F4F660]();
}

uint64_t sub_20A8CC900()
{
  return MEMORY[0x270F4F668]();
}

uint64_t sub_20A8CC910()
{
  return MEMORY[0x270F4F670]();
}

uint64_t sub_20A8CC920()
{
  return MEMORY[0x270F4F678]();
}

uint64_t sub_20A8CC930()
{
  return MEMORY[0x270F4F680]();
}

uint64_t sub_20A8CC940()
{
  return MEMORY[0x270F4F688]();
}

uint64_t sub_20A8CC950()
{
  return MEMORY[0x270F4F690]();
}

uint64_t sub_20A8CC960()
{
  return MEMORY[0x270F4F698]();
}

uint64_t sub_20A8CC970()
{
  return MEMORY[0x270F4F6A0]();
}

uint64_t sub_20A8CC980()
{
  return MEMORY[0x270F4F6A8]();
}

uint64_t sub_20A8CC990()
{
  return MEMORY[0x270F4F6B0]();
}

uint64_t sub_20A8CC9A0()
{
  return MEMORY[0x270F4F6B8]();
}

uint64_t sub_20A8CC9B0()
{
  return MEMORY[0x270F4F6C0]();
}

uint64_t sub_20A8CC9C0()
{
  return MEMORY[0x270F4F6C8]();
}

uint64_t sub_20A8CC9D0()
{
  return MEMORY[0x270F4F6D0]();
}

uint64_t sub_20A8CC9E0()
{
  return MEMORY[0x270F4F6D8]();
}

uint64_t sub_20A8CC9F0()
{
  return MEMORY[0x270F4F6E0]();
}

uint64_t sub_20A8CCA00()
{
  return MEMORY[0x270F4F6E8]();
}

uint64_t sub_20A8CCA10()
{
  return MEMORY[0x270F4F6F0]();
}

uint64_t sub_20A8CCA20()
{
  return MEMORY[0x270F4F6F8]();
}

uint64_t sub_20A8CCA30()
{
  return MEMORY[0x270F4F700]();
}

uint64_t sub_20A8CCA40()
{
  return MEMORY[0x270F4F708]();
}

uint64_t sub_20A8CCA50()
{
  return MEMORY[0x270F4F710]();
}

uint64_t sub_20A8CCA60()
{
  return MEMORY[0x270F4F718]();
}

uint64_t sub_20A8CCA70()
{
  return MEMORY[0x270F4F720]();
}

uint64_t sub_20A8CCA80()
{
  return MEMORY[0x270F4F728]();
}

uint64_t sub_20A8CCA90()
{
  return MEMORY[0x270F4F730]();
}

uint64_t sub_20A8CCAA0()
{
  return MEMORY[0x270F4F738]();
}

uint64_t sub_20A8CCAB0()
{
  return MEMORY[0x270F4F740]();
}

uint64_t sub_20A8CCAC0()
{
  return MEMORY[0x270F4F748]();
}

uint64_t sub_20A8CCAD0()
{
  return MEMORY[0x270F4F750]();
}

uint64_t sub_20A8CCAE0()
{
  return MEMORY[0x270F4F758]();
}

uint64_t sub_20A8CCAF0()
{
  return MEMORY[0x270F4F760]();
}

uint64_t sub_20A8CCB00()
{
  return MEMORY[0x270F4F768]();
}

uint64_t sub_20A8CCB10()
{
  return MEMORY[0x270F4F770]();
}

uint64_t sub_20A8CCB20()
{
  return MEMORY[0x270F4F778]();
}

uint64_t sub_20A8CCB30()
{
  return MEMORY[0x270F4F780]();
}

uint64_t sub_20A8CCB40()
{
  return MEMORY[0x270F4F788]();
}

uint64_t sub_20A8CCB50()
{
  return MEMORY[0x270F4F790]();
}

uint64_t sub_20A8CCB60()
{
  return MEMORY[0x270F4F798]();
}

uint64_t sub_20A8CCB70()
{
  return MEMORY[0x270F4F7A0]();
}

uint64_t sub_20A8CCB80()
{
  return MEMORY[0x270F4F7A8]();
}

uint64_t sub_20A8CCB90()
{
  return MEMORY[0x270F4F7B0]();
}

uint64_t sub_20A8CCBA0()
{
  return MEMORY[0x270F4F7B8]();
}

uint64_t sub_20A8CCBB0()
{
  return MEMORY[0x270F4F7C0]();
}

uint64_t sub_20A8CCBC0()
{
  return MEMORY[0x270F4F7C8]();
}

uint64_t sub_20A8CCBD0()
{
  return MEMORY[0x270F4F7D0]();
}

uint64_t sub_20A8CCBE0()
{
  return MEMORY[0x270F4F7D8]();
}

uint64_t sub_20A8CCBF0()
{
  return MEMORY[0x270F4F7E0]();
}

uint64_t sub_20A8CCC00()
{
  return MEMORY[0x270F4F7E8]();
}

uint64_t sub_20A8CCC10()
{
  return MEMORY[0x270F4F7F0]();
}

uint64_t sub_20A8CCC20()
{
  return MEMORY[0x270F4F7F8]();
}

uint64_t sub_20A8CCC30()
{
  return MEMORY[0x270F4F800]();
}

uint64_t sub_20A8CCC40()
{
  return MEMORY[0x270F4F808]();
}

uint64_t sub_20A8CCC50()
{
  return MEMORY[0x270F4F810]();
}

uint64_t sub_20A8CCC60()
{
  return MEMORY[0x270F4F818]();
}

uint64_t sub_20A8CCC70()
{
  return MEMORY[0x270F4F820]();
}

uint64_t sub_20A8CCC80()
{
  return MEMORY[0x270F4F828]();
}

uint64_t sub_20A8CCC90()
{
  return MEMORY[0x270F4F830]();
}

uint64_t sub_20A8CCCA0()
{
  return MEMORY[0x270F4F838]();
}

uint64_t sub_20A8CCCB0()
{
  return MEMORY[0x270F4F840]();
}

uint64_t sub_20A8CCCC0()
{
  return MEMORY[0x270F4F848]();
}

uint64_t sub_20A8CCCD0()
{
  return MEMORY[0x270F4F850]();
}

uint64_t sub_20A8CCCE0()
{
  return MEMORY[0x270F4F858]();
}

uint64_t sub_20A8CCCF0()
{
  return MEMORY[0x270F4F860]();
}

uint64_t sub_20A8CCD00()
{
  return MEMORY[0x270F4F868]();
}

uint64_t sub_20A8CCD10()
{
  return MEMORY[0x270F4F870]();
}

uint64_t sub_20A8CCD20()
{
  return MEMORY[0x270F4F878]();
}

uint64_t sub_20A8CCD30()
{
  return MEMORY[0x270F4F880]();
}

uint64_t sub_20A8CCD40()
{
  return MEMORY[0x270F4F888]();
}

uint64_t sub_20A8CCD50()
{
  return MEMORY[0x270F4F890]();
}

uint64_t sub_20A8CCD60()
{
  return MEMORY[0x270F4F898]();
}

uint64_t sub_20A8CCD70()
{
  return MEMORY[0x270F4EF90]();
}

uint64_t sub_20A8CCD80()
{
  return MEMORY[0x270F4F8A0]();
}

uint64_t sub_20A8CCD90()
{
  return MEMORY[0x270F4F8A8]();
}

uint64_t sub_20A8CCDA0()
{
  return MEMORY[0x270F4F8B0]();
}

uint64_t sub_20A8CCDB0()
{
  return MEMORY[0x270F4F8B8]();
}

uint64_t sub_20A8CCDC0()
{
  return MEMORY[0x270F4F8C0]();
}

uint64_t sub_20A8CCDD0()
{
  return MEMORY[0x270F4F8C8]();
}

uint64_t sub_20A8CCDE0()
{
  return MEMORY[0x270F4F8D0]();
}

uint64_t sub_20A8CCDF0()
{
  return MEMORY[0x270F4F8D8]();
}

uint64_t sub_20A8CCE00()
{
  return MEMORY[0x270F4F8E0]();
}

uint64_t sub_20A8CCE10()
{
  return MEMORY[0x270F4F8E8]();
}

uint64_t sub_20A8CCE20()
{
  return MEMORY[0x270F4F8F0]();
}

uint64_t sub_20A8CCE30()
{
  return MEMORY[0x270F4F8F8]();
}

uint64_t sub_20A8CCE40()
{
  return MEMORY[0x270F4F900]();
}

uint64_t sub_20A8CCE50()
{
  return MEMORY[0x270F4F908]();
}

uint64_t sub_20A8CCE60()
{
  return MEMORY[0x270F4F910]();
}

uint64_t sub_20A8CCE70()
{
  return MEMORY[0x270F4F918]();
}

uint64_t sub_20A8CCE80()
{
  return MEMORY[0x270F4F920]();
}

uint64_t sub_20A8CCE90()
{
  return MEMORY[0x270F4F928]();
}

uint64_t sub_20A8CCEA0()
{
  return MEMORY[0x270F4F930]();
}

uint64_t sub_20A8CCEB0()
{
  return MEMORY[0x270F4F938]();
}

uint64_t sub_20A8CCEC0()
{
  return MEMORY[0x270F4F940]();
}

uint64_t sub_20A8CCED0()
{
  return MEMORY[0x270F4F948]();
}

uint64_t sub_20A8CCEE0()
{
  return MEMORY[0x270F4F950]();
}

uint64_t sub_20A8CCEF0()
{
  return MEMORY[0x270F4F958]();
}

uint64_t sub_20A8CCF00()
{
  return MEMORY[0x270F4F960]();
}

uint64_t sub_20A8CCF10()
{
  return MEMORY[0x270F4F968]();
}

uint64_t sub_20A8CCF20()
{
  return MEMORY[0x270F4F970]();
}

uint64_t sub_20A8CCF30()
{
  return MEMORY[0x270F4F978]();
}

uint64_t sub_20A8CCF40()
{
  return MEMORY[0x270F4F980]();
}

uint64_t sub_20A8CCF50()
{
  return MEMORY[0x270F4F988]();
}

uint64_t sub_20A8CCF60()
{
  return MEMORY[0x270F4F990]();
}

uint64_t sub_20A8CCF70()
{
  return MEMORY[0x270F4F998]();
}

uint64_t sub_20A8CCF80()
{
  return MEMORY[0x270F4F9A0]();
}

uint64_t sub_20A8CCF90()
{
  return MEMORY[0x270F4F9A8]();
}

uint64_t sub_20A8CCFA0()
{
  return MEMORY[0x270F4F9B0]();
}

uint64_t sub_20A8CCFB0()
{
  return MEMORY[0x270F4F9B8]();
}

uint64_t sub_20A8CCFC0()
{
  return MEMORY[0x270F4F9C0]();
}

uint64_t sub_20A8CCFD0()
{
  return MEMORY[0x270F4F9C8]();
}

uint64_t sub_20A8CCFE0()
{
  return MEMORY[0x270F4F9D0]();
}

uint64_t sub_20A8CCFF0()
{
  return MEMORY[0x270F4F9D8]();
}

uint64_t sub_20A8CD000()
{
  return MEMORY[0x270F4F9E0]();
}

uint64_t sub_20A8CD010()
{
  return MEMORY[0x270F4F9E8]();
}

uint64_t sub_20A8CD020()
{
  return MEMORY[0x270F4F9F0]();
}

uint64_t sub_20A8CD030()
{
  return MEMORY[0x270F4F9F8]();
}

uint64_t sub_20A8CD040()
{
  return MEMORY[0x270F4FA00]();
}

uint64_t sub_20A8CD050()
{
  return MEMORY[0x270F4FA08]();
}

uint64_t sub_20A8CD060()
{
  return MEMORY[0x270F4FA10]();
}

uint64_t sub_20A8CD070()
{
  return MEMORY[0x270F4FA18]();
}

uint64_t sub_20A8CD080()
{
  return MEMORY[0x270F4FA20]();
}

uint64_t sub_20A8CD090()
{
  return MEMORY[0x270F4FA28]();
}

uint64_t sub_20A8CD0A0()
{
  return MEMORY[0x270F4FA30]();
}

uint64_t sub_20A8CD0B0()
{
  return MEMORY[0x270F4FA38]();
}

uint64_t sub_20A8CD0C0()
{
  return MEMORY[0x270F4FA40]();
}

uint64_t sub_20A8CD0D0()
{
  return MEMORY[0x270F4FA48]();
}

uint64_t sub_20A8CD0E0()
{
  return MEMORY[0x270F4FA50]();
}

uint64_t sub_20A8CD0F0()
{
  return MEMORY[0x270F4FA58]();
}

uint64_t sub_20A8CD100()
{
  return MEMORY[0x270F4FA60]();
}

uint64_t sub_20A8CD120()
{
  return MEMORY[0x270F4FA70]();
}

uint64_t sub_20A8CD130()
{
  return MEMORY[0x270F4FA78]();
}

uint64_t sub_20A8CD140()
{
  return MEMORY[0x270F4FA80]();
}

uint64_t sub_20A8CD150()
{
  return MEMORY[0x270F4FA88]();
}

uint64_t sub_20A8CD160()
{
  return MEMORY[0x270F4FA90]();
}

uint64_t sub_20A8CD180()
{
  return MEMORY[0x270F4FAA0]();
}

uint64_t sub_20A8CD190()
{
  return MEMORY[0x270F4FAA8]();
}

uint64_t sub_20A8CD1A0()
{
  return MEMORY[0x270F4FAB0]();
}

uint64_t sub_20A8CD1C0()
{
  return MEMORY[0x270F4FAC0]();
}

uint64_t sub_20A8CD1E0()
{
  return MEMORY[0x270F4FAD0]();
}

uint64_t sub_20A8CD1F0()
{
  return MEMORY[0x270F4FAE8]();
}

uint64_t sub_20A8CD200()
{
  return MEMORY[0x270F4FAF0]();
}

uint64_t sub_20A8CD210()
{
  return MEMORY[0x270F4FAF8]();
}

uint64_t sub_20A8CD220()
{
  return MEMORY[0x270F4FB00]();
}

uint64_t sub_20A8CD230()
{
  return MEMORY[0x270F4FB08]();
}

uint64_t sub_20A8CD240()
{
  return MEMORY[0x270F4FB10]();
}

uint64_t sub_20A8CD250()
{
  return MEMORY[0x270F4FB18]();
}

uint64_t sub_20A8CD260()
{
  return MEMORY[0x270F4FB20]();
}

uint64_t _s8StocksUI16OfflineAlertableV7messageSSSgvg_0()
{
  return MEMORY[0x270F4FB28]();
}

uint64_t sub_20A8CD280()
{
  return MEMORY[0x270F4FB30]();
}

uint64_t _s8StocksUI16OfflineAlertableV5titleSSSgvg_0()
{
  return MEMORY[0x270F4FB38]();
}

uint64_t sub_20A8CD2A0()
{
  return MEMORY[0x270F4FB40]();
}

uint64_t sub_20A8CD2B0()
{
  return MEMORY[0x270F4FB48]();
}

uint64_t sub_20A8CD2C0()
{
  return MEMORY[0x270F4FB50]();
}

uint64_t sub_20A8CD2D0()
{
  return MEMORY[0x270F4FB58]();
}

uint64_t sub_20A8CD2E0()
{
  return MEMORY[0x270F4FB60]();
}

uint64_t sub_20A8CD2F0()
{
  return MEMORY[0x270F4FB68]();
}

uint64_t sub_20A8CD300()
{
  return MEMORY[0x270F4FB70]();
}

uint64_t sub_20A8CD310()
{
  return MEMORY[0x270F4FB78]();
}

uint64_t sub_20A8CD320()
{
  return MEMORY[0x270F4FB80]();
}

uint64_t sub_20A8CD330()
{
  return MEMORY[0x270F4FB88]();
}

uint64_t sub_20A8CD340()
{
  return MEMORY[0x270F4FB90]();
}

uint64_t sub_20A8CD350()
{
  return MEMORY[0x270F4FB98]();
}

uint64_t sub_20A8CD360()
{
  return MEMORY[0x270F4FBA0]();
}

uint64_t sub_20A8CD370()
{
  return MEMORY[0x270F4FBA8]();
}

uint64_t sub_20A8CD380()
{
  return MEMORY[0x270F4FBB0]();
}

uint64_t sub_20A8CD390()
{
  return MEMORY[0x270F4FBB8]();
}

uint64_t sub_20A8CD3A0()
{
  return MEMORY[0x270F4FBC0]();
}

uint64_t sub_20A8CD3C0()
{
  return MEMORY[0x270F4FBD0]();
}

uint64_t sub_20A8CD3D0()
{
  return MEMORY[0x270F4FBD8]();
}

uint64_t sub_20A8CD3E0()
{
  return MEMORY[0x270F4FBE0]();
}

uint64_t sub_20A8CD3F0()
{
  return MEMORY[0x270F4FBF8]();
}

uint64_t sub_20A8CD400()
{
  return MEMORY[0x270F4FC00]();
}

uint64_t sub_20A8CD410()
{
  return MEMORY[0x270F4FC08]();
}

uint64_t sub_20A8CD420()
{
  return MEMORY[0x270F4FC10]();
}

uint64_t sub_20A8CD430()
{
  return MEMORY[0x270F4FC18]();
}

uint64_t sub_20A8CD440()
{
  return MEMORY[0x270F4FC20]();
}

uint64_t sub_20A8CD450()
{
  return MEMORY[0x270F4FC28]();
}

uint64_t sub_20A8CD460()
{
  return MEMORY[0x270F4FC30]();
}

uint64_t sub_20A8CD470()
{
  return MEMORY[0x270F4FC38]();
}

uint64_t sub_20A8CD480()
{
  return MEMORY[0x270F4FC40]();
}

uint64_t sub_20A8CD490()
{
  return MEMORY[0x270F4FC48]();
}

uint64_t sub_20A8CD4A0()
{
  return MEMORY[0x270F4FC50]();
}

uint64_t sub_20A8CD4B0()
{
  return MEMORY[0x270F4FC58]();
}

uint64_t sub_20A8CD4C0()
{
  return MEMORY[0x270F4FC60]();
}

uint64_t sub_20A8CD4D0()
{
  return MEMORY[0x270F4FC68]();
}

uint64_t sub_20A8CD4E0()
{
  return MEMORY[0x270F4FC70]();
}

uint64_t sub_20A8CD4F0()
{
  return MEMORY[0x270F4FC78]();
}

uint64_t sub_20A8CD500()
{
  return MEMORY[0x270F4FC80]();
}

uint64_t sub_20A8CD510()
{
  return MEMORY[0x270F4FC88]();
}

uint64_t sub_20A8CD520()
{
  return MEMORY[0x270F4FC90]();
}

uint64_t sub_20A8CD530()
{
  return MEMORY[0x270F4FC98]();
}

uint64_t sub_20A8CD540()
{
  return MEMORY[0x270F4FCA0]();
}

uint64_t sub_20A8CD550()
{
  return MEMORY[0x270F4FCA8]();
}

uint64_t sub_20A8CD560()
{
  return MEMORY[0x270F4FCB0]();
}

uint64_t sub_20A8CD570()
{
  return MEMORY[0x270F4FCB8]();
}

uint64_t sub_20A8CD580()
{
  return MEMORY[0x270F4FCC0]();
}

uint64_t sub_20A8CD590()
{
  return MEMORY[0x270F4FCC8]();
}

uint64_t sub_20A8CD5A0()
{
  return MEMORY[0x270F4FCD0]();
}

uint64_t sub_20A8CD5B0()
{
  return MEMORY[0x270F4FCD8]();
}

uint64_t sub_20A8CD5C0()
{
  return MEMORY[0x270F4FCE0]();
}

uint64_t sub_20A8CD5D0()
{
  return MEMORY[0x270F4FCE8]();
}

uint64_t sub_20A8CD5E0()
{
  return MEMORY[0x270F4FCF0]();
}

uint64_t sub_20A8CD5F0()
{
  return MEMORY[0x270F4FCF8]();
}

uint64_t sub_20A8CD600()
{
  return MEMORY[0x270F4FD00]();
}

uint64_t sub_20A8CD610()
{
  return MEMORY[0x270F4FD08]();
}

uint64_t sub_20A8CD620()
{
  return MEMORY[0x270F4FD18]();
}

uint64_t sub_20A8CD630()
{
  return MEMORY[0x270F4FD20]();
}

uint64_t sub_20A8CD640()
{
  return MEMORY[0x270F4FD28]();
}

uint64_t sub_20A8CD650()
{
  return MEMORY[0x270F4FD30]();
}

uint64_t sub_20A8CD660()
{
  return MEMORY[0x270F4FD38]();
}

uint64_t sub_20A8CD670()
{
  return MEMORY[0x270F4FD40]();
}

uint64_t sub_20A8CD680()
{
  return MEMORY[0x270F4FD48]();
}

uint64_t sub_20A8CD690()
{
  return MEMORY[0x270F4FD50]();
}

uint64_t sub_20A8CD6A0()
{
  return MEMORY[0x270F4FD58]();
}

uint64_t sub_20A8CD6B0()
{
  return MEMORY[0x270F4FD60]();
}

uint64_t sub_20A8CD6C0()
{
  return MEMORY[0x270F4FD68]();
}

uint64_t sub_20A8CD6D0()
{
  return MEMORY[0x270F4FD70]();
}

uint64_t sub_20A8CD6E0()
{
  return MEMORY[0x270F4FD78]();
}

uint64_t sub_20A8CD6F0()
{
  return MEMORY[0x270F4FD80]();
}

uint64_t sub_20A8CD700()
{
  return MEMORY[0x270F4FD88]();
}

uint64_t sub_20A8CD710()
{
  return MEMORY[0x270F4FD90]();
}

uint64_t sub_20A8CD720()
{
  return MEMORY[0x270F4FD98]();
}

uint64_t sub_20A8CD730()
{
  return MEMORY[0x270F4FDA0]();
}

uint64_t sub_20A8CD740()
{
  return MEMORY[0x270F4FDA8]();
}

uint64_t sub_20A8CD750()
{
  return MEMORY[0x270F4FDB0]();
}

uint64_t sub_20A8CD760()
{
  return MEMORY[0x270F4FDB8]();
}

uint64_t sub_20A8CD770()
{
  return MEMORY[0x270F4FDC0]();
}

uint64_t sub_20A8CD780()
{
  return MEMORY[0x270F4FDC8]();
}

uint64_t sub_20A8CD790()
{
  return MEMORY[0x270F4FDD0]();
}

uint64_t sub_20A8CD7A0()
{
  return MEMORY[0x270F4FDD8]();
}

uint64_t sub_20A8CD7B0()
{
  return MEMORY[0x270F4FDE0]();
}

uint64_t sub_20A8CD7C0()
{
  return MEMORY[0x270F4FDE8]();
}

uint64_t sub_20A8CD7D0()
{
  return MEMORY[0x270F4FDF0]();
}

uint64_t sub_20A8CD7E0()
{
  return MEMORY[0x270F4FDF8]();
}

uint64_t sub_20A8CD7F0()
{
  return MEMORY[0x270F4FE00]();
}

uint64_t sub_20A8CD800()
{
  return MEMORY[0x270F4FE10]();
}

uint64_t sub_20A8CD810()
{
  return MEMORY[0x270F4FE18]();
}

uint64_t sub_20A8CD820()
{
  return MEMORY[0x270F4FE20]();
}

uint64_t sub_20A8CD830()
{
  return MEMORY[0x270F4FE28]();
}

uint64_t sub_20A8CD840()
{
  return MEMORY[0x270F4FE30]();
}

uint64_t sub_20A8CD850()
{
  return MEMORY[0x270F4FE38]();
}

uint64_t sub_20A8CD860()
{
  return MEMORY[0x270F4FE40]();
}

uint64_t sub_20A8CD870()
{
  return MEMORY[0x270F4FE48]();
}

uint64_t sub_20A8CD880()
{
  return MEMORY[0x270F4FE50]();
}

uint64_t sub_20A8CD890()
{
  return MEMORY[0x270F4FE58]();
}

uint64_t sub_20A8CD8A0()
{
  return MEMORY[0x270F4FE60]();
}

uint64_t sub_20A8CD8B0()
{
  return MEMORY[0x270F4FE68]();
}

uint64_t sub_20A8CD8C0()
{
  return MEMORY[0x270F4FE70]();
}

uint64_t sub_20A8CD8D0()
{
  return MEMORY[0x270F4FE78]();
}

uint64_t sub_20A8CD8E0()
{
  return MEMORY[0x270F4FE80]();
}

uint64_t sub_20A8CD8F0()
{
  return MEMORY[0x270F4FE88]();
}

uint64_t sub_20A8CD900()
{
  return MEMORY[0x270F4FE90]();
}

uint64_t sub_20A8CD910()
{
  return MEMORY[0x270F4FE98]();
}

uint64_t sub_20A8CD920()
{
  return MEMORY[0x270F4FEA0]();
}

uint64_t sub_20A8CD930()
{
  return MEMORY[0x270F4FEA8]();
}

uint64_t sub_20A8CD940()
{
  return MEMORY[0x270F4FEB0]();
}

uint64_t sub_20A8CD950()
{
  return MEMORY[0x270F4FEB8]();
}

uint64_t sub_20A8CD960()
{
  return MEMORY[0x270F4FEC0]();
}

uint64_t sub_20A8CD970()
{
  return MEMORY[0x270F4FEC8]();
}

uint64_t sub_20A8CD980()
{
  return MEMORY[0x270F4FED0]();
}

uint64_t sub_20A8CD990()
{
  return MEMORY[0x270F4FED8]();
}

uint64_t sub_20A8CD9A0()
{
  return MEMORY[0x270F4FEE0]();
}

uint64_t sub_20A8CD9B0()
{
  return MEMORY[0x270F4FEE8]();
}

uint64_t sub_20A8CD9C0()
{
  return MEMORY[0x270F4FEF0]();
}

uint64_t sub_20A8CD9D0()
{
  return MEMORY[0x270F4FEF8]();
}

uint64_t sub_20A8CD9E0()
{
  return MEMORY[0x270F4FF00]();
}

uint64_t sub_20A8CD9F0()
{
  return MEMORY[0x270F4FF08]();
}

uint64_t sub_20A8CDA00()
{
  return MEMORY[0x270F4FF10]();
}

uint64_t sub_20A8CDA10()
{
  return MEMORY[0x270F4FF18]();
}

uint64_t sub_20A8CDA20()
{
  return MEMORY[0x270F4FF20]();
}

uint64_t sub_20A8CDA30()
{
  return MEMORY[0x270F4FF28]();
}

uint64_t sub_20A8CDA40()
{
  return MEMORY[0x270F4FF30]();
}

uint64_t sub_20A8CDA50()
{
  return MEMORY[0x270F4FF38]();
}

uint64_t sub_20A8CDA60()
{
  return MEMORY[0x270F4FF40]();
}

uint64_t sub_20A8CDA70()
{
  return MEMORY[0x270F4FF48]();
}

uint64_t sub_20A8CDA80()
{
  return MEMORY[0x270F4FF50]();
}

uint64_t sub_20A8CDA90()
{
  return MEMORY[0x270F4FF58]();
}

uint64_t sub_20A8CDAA0()
{
  return MEMORY[0x270F4FF60]();
}

uint64_t sub_20A8CDAB0()
{
  return MEMORY[0x270F4FF68]();
}

uint64_t sub_20A8CDAC0()
{
  return MEMORY[0x270F4FF70]();
}

uint64_t sub_20A8CDAD0()
{
  return MEMORY[0x270F4FF78]();
}

uint64_t sub_20A8CDAE0()
{
  return MEMORY[0x270F4FF80]();
}

uint64_t sub_20A8CDAF0()
{
  return MEMORY[0x270F4FF88]();
}

uint64_t sub_20A8CDB00()
{
  return MEMORY[0x270F4FF90]();
}

uint64_t sub_20A8CDB10()
{
  return MEMORY[0x270F4FF98]();
}

uint64_t sub_20A8CDB20()
{
  return MEMORY[0x270F4FFA0]();
}

uint64_t sub_20A8CDB30()
{
  return MEMORY[0x270F4FFA8]();
}

uint64_t sub_20A8CDB40()
{
  return MEMORY[0x270F4FFB0]();
}

uint64_t sub_20A8CDB50()
{
  return MEMORY[0x270F4FFB8]();
}

uint64_t sub_20A8CDB60()
{
  return MEMORY[0x270F4FFC8]();
}

uint64_t sub_20A8CDB70()
{
  return MEMORY[0x270F79B28]();
}

uint64_t sub_20A8CDB80()
{
  return MEMORY[0x270F79B30]();
}

uint64_t sub_20A8CDB90()
{
  return MEMORY[0x270F79B38]();
}

uint64_t sub_20A8CDBA0()
{
  return MEMORY[0x270F79B40]();
}

uint64_t sub_20A8CDBB0()
{
  return MEMORY[0x270F79B48]();
}

uint64_t sub_20A8CDBC0()
{
  return MEMORY[0x270F79B50]();
}

uint64_t sub_20A8CDBD0()
{
  return MEMORY[0x270F79B58]();
}

uint64_t sub_20A8CDBE0()
{
  return MEMORY[0x270F79B60]();
}

uint64_t sub_20A8CDBF0()
{
  return MEMORY[0x270F79B68]();
}

uint64_t sub_20A8CDC00()
{
  return MEMORY[0x270F79B70]();
}

uint64_t sub_20A8CDC10()
{
  return MEMORY[0x270F79B78]();
}

uint64_t sub_20A8CDC20()
{
  return MEMORY[0x270F79B80]();
}

uint64_t sub_20A8CDC30()
{
  return MEMORY[0x270F79B88]();
}

uint64_t sub_20A8CDC40()
{
  return MEMORY[0x270F79B90]();
}

uint64_t sub_20A8CDC50()
{
  return MEMORY[0x270F79B98]();
}

uint64_t sub_20A8CDC60()
{
  return MEMORY[0x270F79BA0]();
}

uint64_t sub_20A8CDC70()
{
  return MEMORY[0x270F79BA8]();
}

uint64_t sub_20A8CDC80()
{
  return MEMORY[0x270F79BB0]();
}

uint64_t sub_20A8CDC90()
{
  return MEMORY[0x270F79BB8]();
}

uint64_t sub_20A8CDCA0()
{
  return MEMORY[0x270F79BC0]();
}

uint64_t sub_20A8CDCB0()
{
  return MEMORY[0x270F79BC8]();
}

uint64_t sub_20A8CDCC0()
{
  return MEMORY[0x270F79BD0]();
}

uint64_t sub_20A8CDCD0()
{
  return MEMORY[0x270F79BD8]();
}

uint64_t sub_20A8CDCE0()
{
  return MEMORY[0x270F79BE0]();
}

uint64_t sub_20A8CDCF0()
{
  return MEMORY[0x270F79BE8]();
}

uint64_t sub_20A8CDD00()
{
  return MEMORY[0x270F79BF0]();
}

uint64_t sub_20A8CDD10()
{
  return MEMORY[0x270F79BF8]();
}

uint64_t sub_20A8CDD20()
{
  return MEMORY[0x270F79C00]();
}

uint64_t sub_20A8CDD30()
{
  return MEMORY[0x270F79C08]();
}

uint64_t sub_20A8CDD40()
{
  return MEMORY[0x270F79C10]();
}

uint64_t sub_20A8CDD50()
{
  return MEMORY[0x270F79C18]();
}

uint64_t sub_20A8CDD60()
{
  return MEMORY[0x270F79C20]();
}

uint64_t sub_20A8CDD70()
{
  return MEMORY[0x270F79C28]();
}

uint64_t sub_20A8CDD80()
{
  return MEMORY[0x270F79C30]();
}

uint64_t sub_20A8CDD90()
{
  return MEMORY[0x270F79C38]();
}

uint64_t sub_20A8CDDA0()
{
  return MEMORY[0x270F79C40]();
}

uint64_t sub_20A8CDDB0()
{
  return MEMORY[0x270F79C48]();
}

uint64_t sub_20A8CDDC0()
{
  return MEMORY[0x270F79C50]();
}

uint64_t sub_20A8CDDD0()
{
  return MEMORY[0x270F79C58]();
}

uint64_t sub_20A8CDDE0()
{
  return MEMORY[0x270F79C60]();
}

uint64_t sub_20A8CDDF0()
{
  return MEMORY[0x270F79C68]();
}

uint64_t sub_20A8CDE00()
{
  return MEMORY[0x270F79C70]();
}

uint64_t sub_20A8CDE10()
{
  return MEMORY[0x270F79C78]();
}

uint64_t sub_20A8CDE20()
{
  return MEMORY[0x270F79C80]();
}

uint64_t sub_20A8CDE30()
{
  return MEMORY[0x270F79C88]();
}

uint64_t sub_20A8CDE40()
{
  return MEMORY[0x270F79C90]();
}

uint64_t sub_20A8CDE50()
{
  return MEMORY[0x270F79C98]();
}

uint64_t sub_20A8CDE60()
{
  return MEMORY[0x270F79CA0]();
}

uint64_t sub_20A8CDE70()
{
  return MEMORY[0x270F79CA8]();
}

uint64_t sub_20A8CDE80()
{
  return MEMORY[0x270F79CB0]();
}

uint64_t sub_20A8CDE90()
{
  return MEMORY[0x270F79CB8]();
}

uint64_t sub_20A8CDEA0()
{
  return MEMORY[0x270F79CC0]();
}

uint64_t sub_20A8CDEB0()
{
  return MEMORY[0x270F79CC8]();
}

uint64_t sub_20A8CDEC0()
{
  return MEMORY[0x270F79CD0]();
}

uint64_t sub_20A8CDED0()
{
  return MEMORY[0x270F79CD8]();
}

uint64_t sub_20A8CDEE0()
{
  return MEMORY[0x270F79CE0]();
}

uint64_t sub_20A8CDEF0()
{
  return MEMORY[0x270F79CE8]();
}

uint64_t sub_20A8CDF00()
{
  return MEMORY[0x270F79CF0]();
}

uint64_t sub_20A8CDF10()
{
  return MEMORY[0x270F79CF8]();
}

uint64_t sub_20A8CDF20()
{
  return MEMORY[0x270F79D00]();
}

uint64_t sub_20A8CDF30()
{
  return MEMORY[0x270F79D08]();
}

uint64_t sub_20A8CDF40()
{
  return MEMORY[0x270F79D10]();
}

uint64_t sub_20A8CDF50()
{
  return MEMORY[0x270F79D18]();
}

uint64_t sub_20A8CDF60()
{
  return MEMORY[0x270F79D20]();
}

uint64_t sub_20A8CDF70()
{
  return MEMORY[0x270F79D28]();
}

uint64_t sub_20A8CDF80()
{
  return MEMORY[0x270F79D30]();
}

uint64_t sub_20A8CDF90()
{
  return MEMORY[0x270F79D38]();
}

uint64_t sub_20A8CDFA0()
{
  return MEMORY[0x270F79D40]();
}

uint64_t sub_20A8CDFB0()
{
  return MEMORY[0x270F79D48]();
}

uint64_t sub_20A8CDFC0()
{
  return MEMORY[0x270F79D50]();
}

uint64_t sub_20A8CDFD0()
{
  return MEMORY[0x270F79D58]();
}

uint64_t sub_20A8CDFE0()
{
  return MEMORY[0x270F79D60]();
}

uint64_t sub_20A8CDFF0()
{
  return MEMORY[0x270F79D68]();
}

uint64_t sub_20A8CE000()
{
  return MEMORY[0x270F79D70]();
}

uint64_t sub_20A8CE010()
{
  return MEMORY[0x270F79D78]();
}

uint64_t sub_20A8CE020()
{
  return MEMORY[0x270F79D80]();
}

uint64_t sub_20A8CE030()
{
  return MEMORY[0x270F79D88]();
}

uint64_t sub_20A8CE040()
{
  return MEMORY[0x270F79D90]();
}

uint64_t sub_20A8CE050()
{
  return MEMORY[0x270F79D98]();
}

uint64_t sub_20A8CE060()
{
  return MEMORY[0x270F79DA0]();
}

uint64_t sub_20A8CE070()
{
  return MEMORY[0x270F79DA8]();
}

uint64_t sub_20A8CE080()
{
  return MEMORY[0x270F79DB0]();
}

uint64_t sub_20A8CE090()
{
  return MEMORY[0x270F79DB8]();
}

uint64_t sub_20A8CE0A0()
{
  return MEMORY[0x270F79DC0]();
}

uint64_t sub_20A8CE0B0()
{
  return MEMORY[0x270F79DC8]();
}

uint64_t sub_20A8CE0C0()
{
  return MEMORY[0x270F79DD0]();
}

uint64_t sub_20A8CE0D0()
{
  return MEMORY[0x270F79DD8]();
}

uint64_t sub_20A8CE0E0()
{
  return MEMORY[0x270F79DE0]();
}

uint64_t sub_20A8CE0F0()
{
  return MEMORY[0x270F79DE8]();
}

uint64_t sub_20A8CE100()
{
  return MEMORY[0x270F79DF0]();
}

uint64_t sub_20A8CE110()
{
  return MEMORY[0x270F79DF8]();
}

uint64_t sub_20A8CE120()
{
  return MEMORY[0x270F79E00]();
}

uint64_t sub_20A8CE130()
{
  return MEMORY[0x270F79E08]();
}

uint64_t sub_20A8CE140()
{
  return MEMORY[0x270F79E10]();
}

uint64_t sub_20A8CE150()
{
  return MEMORY[0x270F79E18]();
}

uint64_t sub_20A8CE160()
{
  return MEMORY[0x270EF17F8]();
}

uint64_t sub_20A8CE170()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_20A8CE180()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_20A8CE190()
{
  return MEMORY[0x270F7A798]();
}

uint64_t sub_20A8CE1A0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_20A8CE1B0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_20A8CE1C0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_20A8CE1D0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_20A8CE1E0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_20A8CE1F0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_20A8CE200()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_20A8CE210()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_20A8CE220()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_20A8CE230()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_20A8CE240()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20A8CE250()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_20A8CE260()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_20A8CE270()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_20A8CE280()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20A8CE290()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_20A8CE2A0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_20A8CE2B0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_20A8CE2C0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_20A8CE2D0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_20A8CE2E0()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_20A8CE2F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_20A8CE300()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_20A8CE310()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_20A8CE320()
{
  return MEMORY[0x270F7A7A8]();
}

uint64_t sub_20A8CE330()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_20A8CE340()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_20A8CE350()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_20A8CE360()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20A8CE370()
{
  return MEMORY[0x270F7C928]();
}

uint64_t sub_20A8CE380()
{
  return MEMORY[0x270F7C930]();
}

uint64_t sub_20A8CE390()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_20A8CE3A0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_20A8CE3B0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_20A8CE3C0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_20A8CE3D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20A8CE3E0()
{
  return MEMORY[0x270F4E768]();
}

uint64_t sub_20A8CE3F0()
{
  return MEMORY[0x270F4FFD0]();
}

uint64_t sub_20A8CE400()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20A8CE410()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_20A8CE420()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_20A8CE440()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_20A8CE450()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_20A8CE460()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_20A8CE470()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_20A8CE480()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_20A8CE490()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_20A8CE4A0()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_20A8CE4B0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_20A8CE4C0()
{
  return MEMORY[0x270F7A7C8]();
}

uint64_t sub_20A8CE4D0()
{
  return MEMORY[0x270F9D900]();
}

uint64_t sub_20A8CE4E0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_20A8CE4F0()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_20A8CE500()
{
  return MEMORY[0x270F9D918]();
}

uint64_t sub_20A8CE510()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_20A8CE520()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_20A8CE530()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_20A8CE570()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_20A8CE580()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_20A8CE590()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_20A8CE5A0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_20A8CE5B0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_20A8CE5C0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_20A8CE5D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20A8CE5E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_20A8CE5F0()
{
  return MEMORY[0x270F78DB8]();
}

uint64_t sub_20A8CE600()
{
  return MEMORY[0x270F78DC0]();
}

uint64_t sub_20A8CE610()
{
  return MEMORY[0x270F78DC8]();
}

uint64_t sub_20A8CE620()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_20A8CE630()
{
  return MEMORY[0x270F7A7E0]();
}

uint64_t sub_20A8CE640()
{
  return MEMORY[0x270F7A7E8]();
}

uint64_t sub_20A8CE650()
{
  return MEMORY[0x270F7A7F8]();
}

uint64_t sub_20A8CE660()
{
  return MEMORY[0x270F50440]();
}

uint64_t sub_20A8CE670()
{
  return MEMORY[0x270F50448]();
}

uint64_t sub_20A8CE680()
{
  return MEMORY[0x270F50450]();
}

uint64_t sub_20A8CE690()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_20A8CE6A0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20A8CE6B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_20A8CE6C0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_20A8CE6D0()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_20A8CE6E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20A8CE6F0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_20A8CE700()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_20A8CE710()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20A8CE720()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20A8CE730()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_20A8CE740()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_20A8CE750()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_20A8CE760()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_20A8CE770()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_20A8CE780()
{
  return MEMORY[0x270F4FFD8]();
}

uint64_t sub_20A8CE7A0()
{
  return MEMORY[0x270EF1C60]();
}

uint64_t sub_20A8CE7B0()
{
  return MEMORY[0x270EF1C70]();
}

uint64_t sub_20A8CE7C0()
{
  return MEMORY[0x270EF1C78]();
}

uint64_t sub_20A8CE7E0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_20A8CE7F0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_20A8CE800()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_20A8CE810()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_20A8CE820()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_20A8CE830()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_20A8CE840()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_20A8CE850()
{
  return MEMORY[0x270F7A808]();
}

uint64_t sub_20A8CE860()
{
  return MEMORY[0x270F7A810]();
}

uint64_t sub_20A8CE870()
{
  return MEMORY[0x270F9E098]();
}

uint64_t sub_20A8CE880()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_20A8CE890()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_20A8CE8A0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_20A8CE8B0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_20A8CE8C0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_20A8CE8D0()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_20A8CE8E0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_20A8CE8F0()
{
  return MEMORY[0x270F7C938]();
}

uint64_t sub_20A8CE900()
{
  return MEMORY[0x270F7C940]();
}

uint64_t sub_20A8CE910()
{
  return MEMORY[0x270F50458]();
}

uint64_t sub_20A8CE920()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_20A8CE930()
{
  return MEMORY[0x270F7AA78]();
}

uint64_t sub_20A8CE940()
{
  return MEMORY[0x270F7AA80]();
}

uint64_t sub_20A8CE950()
{
  return MEMORY[0x270F7AA88]();
}

uint64_t sub_20A8CE960()
{
  return MEMORY[0x270F7AA90]();
}

uint64_t sub_20A8CE970()
{
  return MEMORY[0x270F7C948]();
}

uint64_t sub_20A8CE980()
{
  return MEMORY[0x270F7C950]();
}

uint64_t sub_20A8CE990()
{
  return MEMORY[0x270F7C958]();
}

uint64_t sub_20A8CE9A0()
{
  return MEMORY[0x270F7C960]();
}

uint64_t sub_20A8CE9B0()
{
  return MEMORY[0x270F50460]();
}

uint64_t sub_20A8CE9C0()
{
  return MEMORY[0x270F7C968]();
}

uint64_t sub_20A8CE9D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_20A8CE9E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20A8CE9F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_20A8CEA00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20A8CEA10()
{
  return MEMORY[0x270F4FFE0]();
}

uint64_t sub_20A8CEA20()
{
  return MEMORY[0x270F4FFE8]();
}

uint64_t sub_20A8CEA30()
{
  return MEMORY[0x270F4FFF0]();
}

uint64_t sub_20A8CEA40()
{
  return MEMORY[0x270F4FFF8]();
}

uint64_t sub_20A8CEA50()
{
  return MEMORY[0x270F50000]();
}

uint64_t sub_20A8CEA60()
{
  return MEMORY[0x270F50008]();
}

uint64_t sub_20A8CEA70()
{
  return MEMORY[0x270F50010]();
}

uint64_t sub_20A8CEA80()
{
  return MEMORY[0x270F7C970]();
}

uint64_t sub_20A8CEA90()
{
  return MEMORY[0x270F82480]();
}

uint64_t sub_20A8CEAA0()
{
  return MEMORY[0x270F50468]();
}

uint64_t sub_20A8CEAB0()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_20A8CEAC0()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_20A8CEAD0()
{
  return MEMORY[0x270F7C978]();
}

uint64_t sub_20A8CEAE0()
{
  return MEMORY[0x270F7C980]();
}

uint64_t sub_20A8CEAF0()
{
  return MEMORY[0x270F7C988]();
}

uint64_t sub_20A8CEB00()
{
  return MEMORY[0x270F7C990]();
}

uint64_t sub_20A8CEB10()
{
  return MEMORY[0x270F7C998]();
}

uint64_t sub_20A8CEB20()
{
  return MEMORY[0x270F7C9A0]();
}

uint64_t sub_20A8CEB30()
{
  return MEMORY[0x270F7C9A8]();
}

uint64_t sub_20A8CEB40()
{
  return MEMORY[0x270F7C9B0]();
}

uint64_t sub_20A8CEB50()
{
  return MEMORY[0x270F7C9B8]();
}

uint64_t sub_20A8CEB60()
{
  return MEMORY[0x270F7C9C0]();
}

uint64_t sub_20A8CEB70()
{
  return MEMORY[0x270F7C9C8]();
}

uint64_t sub_20A8CEB80()
{
  return MEMORY[0x270F7C9D0]();
}

uint64_t sub_20A8CEB90()
{
  return MEMORY[0x270F7C9D8]();
}

uint64_t sub_20A8CEBA0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_20A8CEBB0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_20A8CEBC0()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_20A8CEBD0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_20A8CEBE0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_20A8CEBF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_20A8CEC00()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_20A8CEC10()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_20A8CEC20()
{
  return MEMORY[0x270F78DD0]();
}

uint64_t sub_20A8CEC30()
{
  return MEMORY[0x270F7A838]();
}

uint64_t sub_20A8CEC40()
{
  return MEMORY[0x270F7C9E0]();
}

uint64_t sub_20A8CEC50()
{
  return MEMORY[0x270F7C9E8]();
}

uint64_t sub_20A8CEC60()
{
  return MEMORY[0x270F7C9F0]();
}

uint64_t sub_20A8CEC70()
{
  return MEMORY[0x270F7C9F8]();
}

uint64_t sub_20A8CEC80()
{
  return MEMORY[0x270F7CA00]();
}

uint64_t sub_20A8CEC90()
{
  return MEMORY[0x270F78DD8]();
}

uint64_t sub_20A8CECA0()
{
  return MEMORY[0x270F78DE0]();
}

uint64_t sub_20A8CECB0()
{
  return MEMORY[0x270F826A8]();
}

uint64_t sub_20A8CECC0()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_20A8CECD0()
{
  return MEMORY[0x270F826B8]();
}

uint64_t sub_20A8CECE0()
{
  return MEMORY[0x270F7CA08]();
}

uint64_t sub_20A8CECF0()
{
  return MEMORY[0x270F7CA10]();
}

uint64_t sub_20A8CED00()
{
  return MEMORY[0x270F826D0]();
}

uint64_t sub_20A8CED10()
{
  return MEMORY[0x270F4EF98]();
}

uint64_t sub_20A8CED20()
{
  return MEMORY[0x270F82860]();
}

uint64_t sub_20A8CED30()
{
  return MEMORY[0x270F82868]();
}

uint64_t sub_20A8CED40()
{
  return MEMORY[0x270F7AA98]();
}

uint64_t sub_20A8CED50()
{
  return MEMORY[0x270F7AAA0]();
}

uint64_t sub_20A8CED60()
{
  return MEMORY[0x270F7CA18]();
}

uint64_t sub_20A8CED70()
{
  return MEMORY[0x270F7CA20]();
}

uint64_t sub_20A8CED80()
{
  return MEMORY[0x270F7CA28]();
}

uint64_t sub_20A8CED90()
{
  return MEMORY[0x270F7CA30]();
}

uint64_t sub_20A8CEDA0()
{
  return MEMORY[0x270F7CA38]();
}

uint64_t sub_20A8CEDB0()
{
  return MEMORY[0x270F7CA40]();
}

uint64_t sub_20A8CEDC0()
{
  return MEMORY[0x270F7AAA8]();
}

uint64_t sub_20A8CEDD0()
{
  return MEMORY[0x270F7AAB0]();
}

uint64_t sub_20A8CEDE0()
{
  return MEMORY[0x270F7AAB8]();
}

uint64_t sub_20A8CEDF0()
{
  return MEMORY[0x270F7CA48]();
}

uint64_t sub_20A8CEE00()
{
  return MEMORY[0x270F7CA60]();
}

uint64_t sub_20A8CEE10()
{
  return MEMORY[0x270F7CA68]();
}

uint64_t sub_20A8CEE20()
{
  return MEMORY[0x270F7CA70]();
}

uint64_t sub_20A8CEE30()
{
  return MEMORY[0x270F7CA80]();
}

uint64_t sub_20A8CEE40()
{
  return MEMORY[0x270F50018]();
}

uint64_t sub_20A8CEE50()
{
  return MEMORY[0x270F7CA88]();
}

uint64_t sub_20A8CEE60()
{
  return MEMORY[0x270F07EC0]();
}

uint64_t sub_20A8CEE70()
{
  return MEMORY[0x270F07EC8]();
}

uint64_t sub_20A8CEE80()
{
  return MEMORY[0x270F7CA90]();
}

uint64_t sub_20A8CEE90()
{
  return MEMORY[0x270F7CA98]();
}

uint64_t sub_20A8CEEA0()
{
  return MEMORY[0x270F7CAA0]();
}

uint64_t sub_20A8CEEB0()
{
  return MEMORY[0x270F7AAC0]();
}

uint64_t sub_20A8CEEC0()
{
  return MEMORY[0x270F7CAB0]();
}

uint64_t sub_20A8CEED0()
{
  return MEMORY[0x270F7CAB8]();
}

uint64_t sub_20A8CEEE0()
{
  return MEMORY[0x270F50020]();
}

uint64_t sub_20A8CEEF0()
{
  return MEMORY[0x270F7CAC8]();
}

uint64_t sub_20A8CEF00()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_20A8CEF10()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_20A8CEF20()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_20A8CEF30()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_20A8CEF40()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_20A8CEF50()
{
  return MEMORY[0x270EF21B8]();
}

uint64_t sub_20A8CEF60()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_20A8CEF70()
{
  return MEMORY[0x270F82968]();
}

uint64_t sub_20A8CEF80()
{
  return MEMORY[0x270F82978]();
}

uint64_t sub_20A8CEF90()
{
  return MEMORY[0x270F82980]();
}

uint64_t sub_20A8CEFA0()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_20A8CEFB0()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_20A8CEFC0()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_20A8CEFD0()
{
  return MEMORY[0x270F829C8]();
}

uint64_t sub_20A8CEFE0()
{
  return MEMORY[0x270F829D8]();
}

uint64_t sub_20A8CEFF0()
{
  return MEMORY[0x270F829E8]();
}

uint64_t sub_20A8CF000()
{
  return MEMORY[0x270F829F0]();
}

uint64_t sub_20A8CF010()
{
  return MEMORY[0x270F829F8]();
}

uint64_t sub_20A8CF020()
{
  return MEMORY[0x270F82A00]();
}

uint64_t sub_20A8CF030()
{
  return MEMORY[0x270F82A10]();
}

uint64_t sub_20A8CF040()
{
  return MEMORY[0x270F82A18]();
}

uint64_t sub_20A8CF050()
{
  return MEMORY[0x270F82A30]();
}

uint64_t sub_20A8CF060()
{
  return MEMORY[0x270F82A58]();
}

uint64_t sub_20A8CF070()
{
  return MEMORY[0x270F82A68]();
}

uint64_t sub_20A8CF080()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_20A8CF090()
{
  return MEMORY[0x270F82A80]();
}

uint64_t sub_20A8CF0A0()
{
  return MEMORY[0x270F82A90]();
}

uint64_t sub_20A8CF0B0()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_20A8CF0C0()
{
  return MEMORY[0x270F82AE0]();
}

uint64_t sub_20A8CF0D0()
{
  return MEMORY[0x270F82AE8]();
}

uint64_t sub_20A8CF0E0()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_20A8CF0F0()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_20A8CF100()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_20A8CF110()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_20A8CF120()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_20A8CF130()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_20A8CF140()
{
  return MEMORY[0x270F82B90]();
}

uint64_t sub_20A8CF150()
{
  return MEMORY[0x270F7CAD8]();
}

uint64_t sub_20A8CF160()
{
  return MEMORY[0x270EF2200]();
}

uint64_t sub_20A8CF170()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_20A8CF180()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_20A8CF190()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_20A8CF1A0()
{
  return MEMORY[0x270F4EFA0]();
}

uint64_t sub_20A8CF1B0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20A8CF1C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20A8CF1D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20A8CF1E0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_20A8CF1F0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_20A8CF200()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_20A8CF210()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_20A8CF220()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_20A8CF230()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_20A8CF240()
{
  return MEMORY[0x270EF24D0]();
}

uint64_t sub_20A8CF250()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_20A8CF260()
{
  return MEMORY[0x270EF25C0]();
}

uint64_t sub_20A8CF270()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_20A8CF290()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_20A8CF2A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_20A8CF2B0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_20A8CF2C0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_20A8CF2D0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_20A8CF2E0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_20A8CF2F0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_20A8CF300()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_20A8CF310()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_20A8CF320()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_20A8CF330()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_20A8CF340()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_20A8CF350()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_20A8CF360()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_20A8CF370()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_20A8CF380()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_20A8CF390()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20A8CF3A0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_20A8CF3B0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_20A8CF3C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20A8CF3D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20A8CF3E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_20A8CF3F0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_20A8CF400()
{
  return MEMORY[0x270F9EA58]();
}

uint64_t sub_20A8CF410()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_20A8CF420()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20A8CF430()
{
  return MEMORY[0x270F9EB50]();
}

uint64_t sub_20A8CF440()
{
  return MEMORY[0x270F9EB88]();
}

uint64_t sub_20A8CF450()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_20A8CF460()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_20A8CF470()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_20A8CF480()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_20A8CF490()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_20A8CF4A0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_20A8CF4B0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_20A8CF4C0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_20A8CF4D0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_20A8CF4E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_20A8CF4F0()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_20A8CF500()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_20A8CF510()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20A8CF520()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_20A8CF530()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_20A8CF540()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_20A8CF550()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_20A8CF560()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_20A8CF570()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_20A8CF580()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_20A8CF590()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20A8CF5A0()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_20A8CF5B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_20A8CF5C0()
{
  return MEMORY[0x270F7A858]();
}

uint64_t sub_20A8CF5D0()
{
  return MEMORY[0x270F7A860]();
}

uint64_t sub_20A8CF5E0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_20A8CF5F0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_20A8CF600()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_20A8CF610()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_20A8CF620()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_20A8CF630()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_20A8CF640()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_20A8CF650()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_20A8CF660()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_20A8CF670()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_20A8CF680()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_20A8CF690()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_20A8CF6A0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_20A8CF6B0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_20A8CF6C0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_20A8CF6D0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_20A8CF6E0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_20A8CF6F0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_20A8CF700()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_20A8CF710()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_20A8CF720()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20A8CF730()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_20A8CF740()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_20A8CF750()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_20A8CF760()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20A8CF770()
{
  return MEMORY[0x270F9F838]();
}

uint64_t sub_20A8CF780()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_20A8CF790()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_20A8CF7A0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_20A8CF7B0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_20A8CF7C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_20A8CF7D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_20A8CF7E0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_20A8CF820()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_20A8CF830()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20A8CF840()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_20A8CF850()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_20A8CF860()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20A8CF870()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_20A8CF880()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20A8CF890()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_20A8CF8A0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_20A8CF8B0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_20A8CF8C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_20A8CF8D0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_20A8CF8E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_20A8CF8F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_20A8CF920()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x270EE9A80]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x270EE9C30]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x270F4F0B8]();
}

uint64_t TSAccessibilityCharacterLiteralAttributedString()
{
  return MEMORY[0x270F7CAE0]();
}

uint64_t TSAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F7CAE8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F82BF8]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F82C30]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F82C70]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x270F82C98]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F82CB8]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x270F82D10]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
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

uint64_t _UIBarsApplyChromelessEverywhere()
{
  return MEMORY[0x270F82F68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_storeStrong(id *location, id obj)
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x270FA0380]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
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