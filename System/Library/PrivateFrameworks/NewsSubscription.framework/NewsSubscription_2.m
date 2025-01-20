id sub_1BFB8C064(int a1, int a2, id a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t inited;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *__return_ptr, uint64_t, uint64_t);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void v29[8];

  objc_msgSend(a3, sel_horizontalSizeClass);
  v4 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  v5 = (void *)sub_1BFBD4B18();
  sub_1BFBD4668();
  sub_1BFB8CCA8(0, (unint64_t *)&qword_1EBA86C88, (uint64_t (*)(uint64_t))sub_1BFA6DFB4, MEMORY[0x1E4FBBE00]);
  inited = swift_initStackObject();
  v7 = (void **)MEMORY[0x1E4FB0700];
  *(_OWORD *)(inited + 16) = xmmword_1BFBD7990;
  v8 = *v7;
  *(void *)(inited + 32) = *v7;
  v10 = v3[5];
  v9 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v10);
  v11 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v9 + 8);
  v12 = v8;
  v11(v29, v10, v9);
  v13 = (void *)v29[0];
  v14 = (void *)v29[1];
  v15 = (void *)v29[2];
  v16 = (void *)v29[3];
  v17 = (void *)v29[4];
  v18 = (void *)v29[5];
  v19 = v29[6];

  v20 = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 40) = v19;
  v21 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = v20;
  *(void *)(inited + 72) = v21;
  sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  *(void *)(inited + 104) = v4;
  *(void *)(inited + 80) = v5;
  v22 = v21;
  v23 = v5;
  sub_1BFAF8D10(inited);
  v24 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  v25 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  v26 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  return v27;
}

id sub_1BFB8C2D8(int a1, int a2, id a3)
{
  void (*v12)(void *__return_ptr, uint64_t, uint64_t);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void v28[8];

  v4 = v3;
  objc_msgSend(a3, sel_horizontalSizeClass);
  uint64_t v5 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  v6 = (void *)sub_1BFBD4B18();
  sub_1BFB8CCA8(0, (unint64_t *)&qword_1EBA86C88, (uint64_t (*)(uint64_t))sub_1BFA6DFB4, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BFBD7990;
  v8 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  *(void *)(inited + 40) = v6;
  v9 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 72) = v9;
  uint64_t v11 = v4[5];
  uint64_t v10 = v4[6];
  __swift_project_boxed_opaque_existential_1(v4 + 2, v11);
  v12 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8);
  swift_bridgeObjectRetain();
  v13 = v8;
  v14 = v6;
  v15 = v9;
  v12(v28, v11, v10);
  v16 = (void *)v28[0];
  v17 = (void *)v28[1];
  v18 = (void *)v28[2];
  v19 = (void *)v28[3];
  v20 = (void *)v28[4];
  v21 = v28[5];
  v22 = (void *)v28[6];

  *(void *)(inited + 104) = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 80) = v21;
  sub_1BFAF8D10(inited);
  v23 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  v24 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  v25 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v23, sel_initWithString_attributes_, v24, v25);

  return v26;
}

uint64_t type metadata accessor for BundlePaywallBaseStyler()
{
  return self;
}

void sub_1BFB8C56C(void *a1, void *a2)
{
  if (a2)
  {
    id v14 = a2;
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)v2 + 40);
    uint64_t v6 = *(void *)(*(void *)v2 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)v2 + 16), v5);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v15, v5, v6);
    v7 = (void *)v15[0];
    id v14 = (id)v15[1];
    v8 = (void *)v15[2];
    v9 = (void *)v15[3];
    uint64_t v10 = (void *)v15[4];
    uint64_t v11 = (void *)v15[5];
    v12 = (void *)v15[6];
  }
  id v13 = a2;
  objc_msgSend(a1, sel_setBackgroundColor_, v14);
}

void sub_1BFB8C650(void *a1)
{
  v3 = (void *)*v1;
  objc_msgSend(a1, sel_setContentMode_, 4);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 8))(v13, v4, v5);
  uint64_t v6 = (void *)v13[0];
  v7 = (void *)v13[1];
  v8 = (void *)v13[3];
  id v12 = (id)v13[2];
  v9 = (void *)v13[4];
  uint64_t v10 = (void *)v13[5];
  uint64_t v11 = (void *)v13[6];

  objc_msgSend(a1, sel_setTintColor_, v12);
}

void sub_1BFB8C738(void *a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v1 + 16), v3);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v12, v3, v4);
  uint64_t v5 = (void *)v12[0];
  uint64_t v6 = (void *)v12[1];
  v7 = (void *)v12[2];
  v8 = (void *)v12[3];
  v9 = (void *)v12[5];
  id v11 = (id)v12[4];
  uint64_t v10 = (void *)v12[6];

  objc_msgSend(a1, sel_setBackgroundColor_, v11);
}

id sub_1BFB8C808(int a1, int a2, void *a3)
{
  return sub_1BFB8B6FC(a1, a2, a3);
}

id sub_1BFB8C82C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BFB8BA74(a1, a2, a3, a4, a5, a6);
}

id sub_1BFB8C850(int a1, int a2, void *a3)
{
  return sub_1BFB8C064(a1, a2, a3);
}

void sub_1BFB8C874(void *a1)
{
  id v2 = objc_msgSend(a1, sel_titleLabel);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_setLineBreakMode_, 0);
  }
  id v4 = objc_msgSend(a1, sel_titleLabel);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_setTextAlignment_, 1);
  }
}

id sub_1BFB8C928()
{
  return sub_1BFB8CA68();
}

id sub_1BFB8C950(int a1, int a2, void *a3)
{
  return sub_1BFB8C2D8(a1, a2, a3);
}

void sub_1BFB8C974(void *a1)
{
  id v2 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(a1, sel_setBackgroundColor_, v2);

  id v3 = objc_msgSend(a1, sel_titleLabel);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_setLineBreakMode_, 0);
  }
  id v5 = objc_msgSend(a1, sel_titleLabel);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setTextAlignment_, 1);
  }
}

id sub_1BFB8CA68()
{
  void (*v10)(void *__return_ptr, uint64_t, uint64_t);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void v24[8];

  uint64_t v1 = v0;
  sub_1BFB8CCA8(0, (unint64_t *)&qword_1EBA86C88, (uint64_t (*)(uint64_t))sub_1BFA6DFB4, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BFBD7990;
  id v3 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v4 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  swift_bridgeObjectRetain();
  id v5 = v3;
  *(void *)(inited + 40) = sub_1BFBD4B18();
  id v6 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v4;
  *(void *)(inited + 72) = v6;
  v7 = v1 + 2;
  uint64_t v9 = v1[5];
  uint64_t v8 = v1[6];
  __swift_project_boxed_opaque_existential_1(v7, v9);
  uint64_t v10 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 8);
  id v11 = v6;
  v10(v24, v9, v8);
  id v12 = (void *)v24[0];
  id v13 = (void *)v24[1];
  id v14 = (void *)v24[2];
  v15 = (void *)v24[3];
  v16 = (void *)v24[4];
  v17 = (void *)v24[5];
  v18 = v24[7];

  *(void *)(inited + 104) = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 80) = v18;
  sub_1BFAF8D10(inited);
  v19 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  v20 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  v21 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_initWithString_attributes_, v20, v21);

  return v22;
}

void sub_1BFB8CCA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t dispatch thunk of SubscriptionStatusCheckBlockerType.isCheckAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1BFB8CD20()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  __swift_project_boxed_opaque_existential_1(v0 + 19, v2);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3))
  {
    id v4 = objc_msgSend(self, sel_sharedApplication);
    id v5 = objc_msgSend(v4, sel_applicationState);

    if (v5 == (id)2)
    {
      if (qword_1EBA876B8 != -1) {
        swift_once();
      }
      sub_1BFBD4A18();
      sub_1BFBD2D88();
    }
    else
    {
      uint64_t v6 = *__swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
      sub_1BFBD2CB8();
      sub_1BFA6AE24();
      uint64_t v7 = (void *)sub_1BFBD4A78();
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v6;
      *(unsigned char *)(v8 + 24) = 0;
      swift_retain();
      sub_1BFBD2B68();
      swift_release();

      swift_release();
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v6;
      *(unsigned char *)(v9 + 24) = 0;
      swift_retain();
      uint64_t v10 = (void *)sub_1BFBD2AF8();
      sub_1BFBD2B98();
      swift_release();
      swift_release();
      swift_release();

      __swift_project_boxed_opaque_existential_1(v1 + 7, v1[10]);
      sub_1BFB91DD0();
    }
  }
}

uint64_t sub_1BFB8CF80()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BFBD3CD8();
  uint64_t v30 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BFBD3D28();
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB8DDF4(0, (unint64_t *)&qword_1EBA89280, (uint64_t (*)(uint64_t))type metadata accessor for PurchaseContext, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v28 - v9;
  id v11 = self;
  id v12 = objc_msgSend(v11, sel_sharedAccount);
  objc_msgSend(v12, sel_reloadiTunesAccount);

  if ((objc_msgSend(*(id *)(v1 + 96), sel_anyOngoingPurchases) & 1) == 0)
  {
    uint64_t v13 = *(void *)(v1 + 200);
    if (v13)
    {
      uint64_t v14 = v13 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
      swift_beginAccess();
      sub_1BFB6135C(v14, (uint64_t)v10);
      uint64_t v15 = type metadata accessor for PurchaseContext();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v10, 1, v15) != 1)
      {
        sub_1BFAABDC8((uint64_t)v10);
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v19 = type metadata accessor for PurchaseContext();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v10, 1, 1, v19);
    }
    sub_1BFAABDC8((uint64_t)v10);
    char v18 = 0;
    unsigned int v16 = 1;
    goto LABEL_11;
  }
LABEL_5:
  if (*(unsigned char *)(v1 + 192))
  {
    unsigned int v16 = 0;
  }
  else
  {
    id v17 = objc_msgSend(v11, sel_sharedAccount);
    unsigned int v16 = objc_msgSend(v17, sel_isUserSignedIntoiTunes);
  }
  char v18 = 1;
LABEL_11:
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFA9CD34(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1BFBD78F0;
  unint64_t v21 = sub_1BFA4DEE8();
  uint64_t v22 = 20302;
  if (v16) {
    uint64_t v22 = 5457241;
  }
  unint64_t v23 = 0xE200000000000000;
  *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v20 + 64) = v21;
  if (v16) {
    unint64_t v23 = 0xE300000000000000;
  }
  *(void *)(v20 + 32) = v22;
  *(void *)(v20 + 40) = v23;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  if (v16)
  {
    sub_1BFA6AE24();
    v24 = (void *)sub_1BFBD4A78();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v1;
    *(unsigned char *)(v25 + 24) = v18;
    aBlock[4] = sub_1BFB8DE58;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BFAAED70;
    aBlock[3] = &block_descriptor_11;
    v26 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1BFBD3CF8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1BFA6B038();
    sub_1BFB8DDF4(0, (unint64_t *)&qword_1EBA84F40, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1BFA6B0F4();
    sub_1BFBD4C88();
    MEMORY[0x1C18BBBD0](0, v7, v4, v26);
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  }
  else
  {
    sub_1BFBD4A18();
    return sub_1BFBD2D88();
  }
}

void sub_1BFB8D538(uint64_t a1, char a2)
{
  uint64_t v3 = *__swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
  sub_1BFBD2CB8();
  sub_1BFA6AE24();
  id v4 = (void *)sub_1BFBD4A78();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(unsigned char *)(v5 + 24) = a2;
  swift_retain();
  sub_1BFBD2B68();
  swift_release();

  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  *(unsigned char *)(v6 + 24) = a2;
  swift_retain();
  id v7 = (id)sub_1BFBD2AF8();
  sub_1BFBD2B98();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1BFB8D6E0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_unknownObjectRelease();
  sub_1BFB8DD14(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SubscriptionStatusChecker()
{
  return self;
}

uint64_t sub_1BFB8D764()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BFBD3CD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BFBD3D28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(self, sel_sharedAccount);
  unsigned __int8 v11 = objc_msgSend(v10, sel_isUserSignedIntoiTunes);

  *(unsigned char *)(v1 + 192) = v11;
  sub_1BFA6AE24();
  id v12 = (void *)sub_1BFBD4A78();
  aBlock[4] = sub_1BFB8DD0C;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFAAED70;
  aBlock[3] = &block_descriptor_31;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1BFBD3CF8();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1BFA6B038();
  sub_1BFB8DDF4(0, (unint64_t *)&qword_1EBA84F40, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1BFA6B0F4();
  sub_1BFBD4C88();
  MEMORY[0x1C18BBBD0](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_1BFB8DA34(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 144) != 1) {
    return;
  }
  sub_1BFAA6E58(a1 + 104, (uint64_t)&v4);
  if (!v5)
  {
    sub_1BFB8DD14((uint64_t)&v4);
    goto LABEL_6;
  }
  sub_1BFA6ADEC(&v4, (uint64_t)v6);
  uint64_t v1 = v7;
  uint64_t v2 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2))
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
LABEL_6:
    id v3 = objc_msgSend(self, sel_sharedAccount);
    objc_msgSend(v3, sel_reloadiTunesAccount);

    if (qword_1EBA876B8 != -1) {
      swift_once();
    }
    sub_1BFBD4A18();
    sub_1BFBD2D88();
    sub_1BFB8CD20();
    return;
  }
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_1BFB8DBF4()
{
  return MEMORY[0x1F415E7C8](*v0);
}

uint64_t sub_1BFB8DC20()
{
  return MEMORY[0x1F415E7C8](*v0);
}

uint64_t sub_1BFB8DC4C()
{
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_retain();
  sub_1BFBD23C8();
  return swift_release();
}

void sub_1BFB8DD0C()
{
  sub_1BFB8DA34(v0);
}

uint64_t sub_1BFB8DD14(uint64_t a1)
{
  sub_1BFA9CD34(0, &qword_1EBA83D78, &qword_1EBA83D70, (uint64_t)&protocol descriptor for SubscriptionStatusCheckBlockerType, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BFB8DD9C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 25, 7);
}

void sub_1BFB8DDD4()
{
  sub_1BFB8CD20();
  *(unsigned char *)(v0 + 144) = 1;
}

void sub_1BFB8DDF4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BFB8DE58()
{
  sub_1BFB8D538(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

id sub_1BFB8DE7C@<X0>(void *a1@<X8>)
{
  return ColorPaletteProviding.bundlePaywallColorPalette.getter(a1);
}

id ColorPaletteProviding.bundlePaywallColorPalette.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EBA85848 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EBA8EE40;
  id v3 = *(void **)algn_1EBA8EE48;
  long long v4 = (void *)qword_1EBA8EE50;
  uint64_t v5 = (void *)unk_1EBA8EE58;
  uint64_t v6 = (void *)qword_1EBA8EE60;
  uint64_t v7 = (void *)unk_1EBA8EE68;
  uint64_t v9 = (void *)qword_1EBA8EE70;
  uint64_t v8 = unk_1EBA8EE78;
  id v18 = (id)unk_1EBA8EE78;
  *a1 = qword_1EBA8EE40;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v9;
  a1[7] = v8;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v9;
  return v18;
}

id sub_1BFB8DF60@<X0>(void *a1@<X8>)
{
  return ColorPaletteProviding.alacartePaywallColorPalette.getter(a1);
}

id ColorPaletteProviding.alacartePaywallColorPalette.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EBA821E0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EBA8EDB8;
  id v3 = (void *)unk_1EBA8EDC0;
  long long v4 = (void *)qword_1EBA8EDC8;
  uint64_t v5 = (void *)unk_1EBA8EDD0;
  uint64_t v6 = (void *)qword_1EBA8EDD8;
  uint64_t v7 = (void *)unk_1EBA8EDE0;
  uint64_t v9 = (void *)qword_1EBA8EDE8;
  uint64_t v8 = unk_1EBA8EDF0;
  id v18 = (id)unk_1EBA8EDF0;
  *a1 = qword_1EBA8EDB8;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v9;
  a1[7] = v8;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v9;
  return v18;
}

id sub_1BFB8E044@<X0>(void *a1@<X8>)
{
  return ColorPaletteProviding.subscriptionOffersColorPalette.getter(a1);
}

id ColorPaletteProviding.subscriptionOffersColorPalette.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EA183B50 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EA194240;
  id v3 = *(void **)algn_1EA194248;
  long long v4 = (void *)qword_1EA194250;
  uint64_t v5 = (void *)unk_1EA194258;
  uint64_t v7 = (void *)qword_1EA194260;
  uint64_t v6 = unk_1EA194268;
  id v14 = (id)unk_1EA194268;
  *a1 = qword_1EA194240;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v7;
  a1[5] = v6;
  id v8 = v2;
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = v7;
  return v14;
}

uint64_t dispatch thunk of ColorPaletteProviding.bundlePaywallColorPalette.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ColorPaletteProviding.alacartePaywallColorPalette.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ColorPaletteProviding.subscriptionOffersColorPalette.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for ColorPalette()
{
  return self;
}

id sub_1BFB8E170@<X0>(void *a1@<X8>)
{
  if (qword_1EBA85848 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EBA8EE40;
  id v3 = *(void **)algn_1EBA8EE48;
  long long v4 = (void *)qword_1EBA8EE50;
  uint64_t v5 = (void *)unk_1EBA8EE58;
  uint64_t v6 = (void *)qword_1EBA8EE60;
  uint64_t v7 = (void *)unk_1EBA8EE68;
  id v9 = (void *)qword_1EBA8EE70;
  uint64_t v8 = unk_1EBA8EE78;
  id v18 = (id)unk_1EBA8EE78;
  *a1 = qword_1EBA8EE40;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v9;
  a1[7] = v8;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v9;
  return v18;
}

id sub_1BFB8E23C@<X0>(void *a1@<X8>)
{
  if (qword_1EBA821E0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EBA8EDB8;
  id v3 = (void *)unk_1EBA8EDC0;
  long long v4 = (void *)qword_1EBA8EDC8;
  uint64_t v5 = (void *)unk_1EBA8EDD0;
  uint64_t v6 = (void *)qword_1EBA8EDD8;
  uint64_t v7 = (void *)unk_1EBA8EDE0;
  id v9 = (void *)qword_1EBA8EDE8;
  uint64_t v8 = unk_1EBA8EDF0;
  id v18 = (id)unk_1EBA8EDF0;
  *a1 = qword_1EBA8EDB8;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v9;
  a1[7] = v8;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v9;
  return v18;
}

id sub_1BFB8E308@<X0>(void *a1@<X8>)
{
  if (qword_1EA183B50 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EA194240;
  id v3 = *(void **)algn_1EA194248;
  long long v4 = (void *)qword_1EA194250;
  uint64_t v5 = (void *)unk_1EA194258;
  uint64_t v7 = (void *)qword_1EA194260;
  uint64_t v6 = unk_1EA194268;
  id v14 = (id)unk_1EA194268;
  *a1 = qword_1EA194240;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v7;
  a1[5] = v6;
  id v8 = v2;
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = v7;
  return v14;
}

unint64_t sub_1BFB8E3BC(void *a1)
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = sub_1BFBD1C78();

  id v5 = objc_msgSend(PaywallModel.tag.getter(), sel_publisherPaidOfferableConfigurations, 0x80000001BFBECD60);
  swift_unknownObjectRelease();
  if (!v5) {
    return v4;
  }
  sub_1BFB8E65C();
  unint64_t v6 = sub_1BFBD4828();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1BFBD4E68();
    swift_bridgeObjectRelease();
    if (v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1BFBD4E68();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return v4;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_5:
  swift_bridgeObjectRelease();
  if (v7 == 1) {
    return sub_1BFB8E69C(a1);
  }
  else {
    return sub_1BFB8EF94(a1);
  }
}

uint64_t sub_1BFB8E5B8()
{
  long long v1 = v0[8];
  v7[6] = v0[7];
  v7[7] = v1;
  long long v2 = v0[10];
  v7[8] = v0[9];
  v7[9] = v2;
  long long v3 = v0[4];
  v7[2] = v0[3];
  v7[3] = v3;
  long long v4 = v0[6];
  v7[4] = v0[5];
  v7[5] = v4;
  long long v5 = v0[2];
  v7[0] = v0[1];
  v7[1] = v5;
  sub_1BFA516CC((uint64_t)v7);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AlacartePaywallSubscribeButtonTextProvider()
{
  return self;
}

unint64_t sub_1BFB8E638(void *a1)
{
  return sub_1BFB8E3BC(a1);
}

unint64_t sub_1BFB8E65C()
{
  unint64_t result = qword_1EBA86BD0;
  if (!qword_1EBA86BD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA86BD0);
  }
  return result;
}

unint64_t sub_1BFB8E69C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_subscriptionPeriodInISO_8601);
  uint64_t v3 = sub_1BFBD45F8();
  uint64_t v5 = v4;

  uint64_t v6 = sub_1BFACE800(v3, v5);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = self;
  id v11 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v12 = sub_1BFBD1C78();

  if (!v8) {
    return v12;
  }
  id v13 = objc_msgSend(a1, sel_introductoryOffer, 0x80000001BFBECD60);

  if (!v13)
  {
    sub_1BFA4DE80();
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1BFBD7990;
    id v32 = objc_msgSend(a1, sel_subscriptionPriceFormatted);
    uint64_t v33 = v12;
    uint64_t v34 = sub_1BFBD45F8();
    uint64_t v36 = v35;

    uint64_t v37 = MEMORY[0x1E4FBB1A0];
    *(void *)(v31 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v38 = sub_1BFA4DEE8();
    *(void *)(v31 + 32) = v34;
    *(void *)(v31 + 40) = v36;
    uint64_t v12 = v33;
    *(void *)(v31 + 96) = v37;
    *(void *)(v31 + 104) = v38;
    *(void *)(v31 + 64) = v38;
    *(void *)(v31 + 72) = v6;
    *(void *)(v31 + 80) = v8;
    sub_1BFBD4618();
    return v12;
  }
  id v14 = objc_msgSend(a1, sel_introductoryOffer);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return v12;
  }
  id v15 = v14;
  uint64_t v82 = v12;
  uint64_t v81 = ObjCClassFromMetadata;
  id v16 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BFBD1C78();

  sub_1BFA4DE80();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BFBD7990;
  id v18 = objc_msgSend(a1, sel_subscriptionPriceFormatted, 0x80000001BFBF56B0);
  uint64_t v19 = sub_1BFBD45F8();
  uint64_t v20 = v15;
  uint64_t v22 = v21;

  uint64_t v23 = MEMORY[0x1E4FBB1A0];
  *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v24 = sub_1BFA4DEE8();
  *(void *)(v17 + 32) = v19;
  *(void *)(v17 + 40) = v22;
  unint64_t v25 = v24;
  *(void *)(v17 + 96) = v23;
  *(void *)(v17 + 104) = v24;
  *(void *)(v17 + 64) = v24;
  *(void *)(v17 + 72) = v6;
  *(void *)(v17 + 80) = v8;
  swift_bridgeObjectRetain();
  sub_1BFBD4618();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v20, sel_subscriptionPeriodInISO_8601);
  if (v26)
  {
    v27 = v26;
    uint64_t v28 = sub_1BFBD45F8();
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v30 = 0;
  }
  unint64_t result = (unint64_t)objc_msgSend(v20, sel_numOfPeriods);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v40 = sub_1BFACEA94(v28, v30, result);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  if (!v42) {
    goto LABEL_14;
  }
  uint64_t v77 = v40;
  unsigned int v43 = objc_msgSend(v20, sel_offerType);
  uint64_t v12 = v82;
  if (v43 == 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v44 = objc_msgSend(v10, sel_bundleForClass_, v81);
    sub_1BFBD1C78();

    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_1BFBD78F0;
    *(void *)(v45 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v45 + 64) = v25;
    *(void *)(v45 + 32) = v77;
    *(void *)(v45 + 40) = v42;
    uint64_t v83 = sub_1BFBD4618();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(v10, sel_bundleForClass_, v81, 0x80000001BFBECD60);
    sub_1BFBD1C78();

    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_1BFBD7990;
    id v48 = objc_msgSend(a1, sel_subscriptionPriceFormatted, 0x80000001BFBF56B0);
    uint64_t v49 = sub_1BFBD45F8();
    uint64_t v51 = v50;

    uint64_t v12 = v83;
    uint64_t v52 = MEMORY[0x1E4FBB1A0];
    *(void *)(v47 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v47 + 64) = v25;
    *(void *)(v47 + 32) = v49;
    *(void *)(v47 + 40) = v51;
    *(void *)(v47 + 96) = v52;
    *(void *)(v47 + 104) = v25;
    *(void *)(v47 + 72) = v6;
    *(void *)(v47 + 80) = v8;
    sub_1BFBD4618();
    swift_bridgeObjectRelease();

    return v12;
  }
  unsigned int v53 = v43;
  swift_bridgeObjectRelease();
  if (v53 != 1)
  {
    if (v53 != 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return v12;
    }
    uint64_t v78 = v42;
    swift_bridgeObjectRelease();
    id v54 = objc_msgSend(v10, sel_bundleForClass_, v81);
    sub_1BFBD1C78();

    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_1BFBD7990;
    unint64_t result = (unint64_t)objc_msgSend(v20, sel_priceFormatted, 0x80000001BFBECD60);
    if (result)
    {
      v56 = (void *)result;
      uint64_t v57 = sub_1BFBD45F8();
      uint64_t v59 = v58;

      uint64_t v60 = MEMORY[0x1E4FBB1A0];
      *(void *)(v55 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v55 + 64) = v25;
      *(void *)(v55 + 32) = v57;
      *(void *)(v55 + 40) = v59;
      *(void *)(v55 + 96) = v60;
      *(void *)(v55 + 104) = v25;
      *(void *)(v55 + 72) = v77;
      *(void *)(v55 + 80) = v78;
      uint64_t v12 = sub_1BFBD4618();
      swift_bridgeObjectRelease();

      return v12;
    }
    goto LABEL_28;
  }
  uint64_t v79 = v42;
  id v61 = objc_msgSend(v20, sel_subscriptionPeriodInISO_8601);
  if (v61)
  {
    v62 = v61;
    uint64_t v63 = sub_1BFBD45F8();
    uint64_t v65 = v64;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v65 = 0;
  }
  uint64_t v66 = sub_1BFACE800(v63, v65);
  uint64_t v68 = v67;
  swift_bridgeObjectRelease();
  if (!v68)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return v82;
  }
  uint64_t v80 = v66;
  unint64_t v84 = v25;
  swift_bridgeObjectRelease();
  v69 = v20;
  id v70 = objc_msgSend(v10, sel_bundleForClass_, v81);
  sub_1BFBD1C78();

  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_1BFBD9C70;
  unint64_t result = (unint64_t)objc_msgSend(v20, sel_priceFormatted, 0x80000001BFBECD60);
  if (result)
  {
    v72 = (void *)result;
    uint64_t v73 = sub_1BFBD45F8();
    uint64_t v75 = v74;

    uint64_t v76 = MEMORY[0x1E4FBB1A0];
    *(void *)(v71 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v71 + 64) = v84;
    *(void *)(v71 + 32) = v73;
    *(void *)(v71 + 40) = v75;
    *(void *)(v71 + 96) = v76;
    *(void *)(v71 + 104) = v84;
    *(void *)(v71 + 72) = v80;
    *(void *)(v71 + 80) = v68;
    *(void *)(v71 + 136) = v76;
    *(void *)(v71 + 144) = v84;
    *(void *)(v71 + 112) = v77;
    *(void *)(v71 + 120) = v79;
    uint64_t v12 = sub_1BFBD4618();
    swift_bridgeObjectRelease();

    return v12;
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_1BFB8EF94(void *a1)
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_1BFBD1C78();

  id v6 = objc_msgSend(a1, sel_introductoryOffer, 0x80000001BFBECD60);
  if (!v6) {
    return v5;
  }
  id v7 = objc_msgSend(a1, sel_introductoryOffer);
  if (!v7) {
    return v5;
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(v7, sel_subscriptionPeriodInISO_8601);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = sub_1BFBD45F8();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  unint64_t result = (unint64_t)objc_msgSend(v8, sel_numOfPeriods);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v15 = sub_1BFACEA94(v11, v13, result);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  if (!v17)
  {

    return v5;
  }
  unsigned int v18 = objc_msgSend(v8, sel_offerType);
  if (v18 != 1)
  {
    if (v18 != 2)
    {
      if (v18 != 3) {
        goto LABEL_23;
      }
      swift_bridgeObjectRelease();
      id v19 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_1BFBD1C78();

      sub_1BFA4DE80();
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1BFBD78F0;
      *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v20 + 64) = sub_1BFA4DEE8();
      *(void *)(v20 + 32) = v15;
      *(void *)(v20 + 40) = v17;
LABEL_22:
      uint64_t v5 = sub_1BFBD4618();
LABEL_23:
      swift_bridgeObjectRelease();

      return v5;
    }
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_1BFBD1C78();

    sub_1BFA4DE80();
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_1BFBD7990;
    uint64_t v28 = MEMORY[0x1E4FBB1A0];
    *(void *)(v27 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v29 = sub_1BFA4DEE8();
    *(void *)(v27 + 64) = v29;
    *(void *)(v27 + 32) = v15;
    *(void *)(v27 + 40) = v17;
    unint64_t result = (unint64_t)objc_msgSend(v8, sel_priceFormatted, 0x80000001BFBECD60);
    if (result)
    {
      uint64_t v30 = (void *)result;
      uint64_t v31 = sub_1BFBD45F8();
      uint64_t v33 = v32;

      *(void *)(v27 + 96) = v28;
      *(void *)(v27 + 104) = v29;
      *(void *)(v27 + 72) = v31;
      *(void *)(v27 + 80) = v33;
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  uint64_t v45 = v15;
  id v21 = objc_msgSend(v8, sel_subscriptionPeriodInISO_8601);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_1BFBD45F8();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  uint64_t v34 = sub_1BFACE800(v23, v25);
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  if (!v36)
  {

    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BFBD1C78();

  sub_1BFA4DE80();
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_1BFBDBBA0;
  uint64_t v39 = MEMORY[0x1E4FBB1A0];
  *(void *)(v38 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v40 = sub_1BFA4DEE8();
  *(void *)(v38 + 64) = v40;
  *(void *)(v38 + 32) = v45;
  *(void *)(v38 + 40) = v17;
  unint64_t result = (unint64_t)objc_msgSend(v8, sel_priceFormatted, 0x80000001BFBECD60);
  if (result)
  {
    uint64_t v41 = (void *)result;
    uint64_t v42 = sub_1BFBD45F8();
    uint64_t v44 = v43;

    *(void *)(v38 + 96) = v39;
    *(void *)(v38 + 104) = v40;
    *(void *)(v38 + 72) = v42;
    *(void *)(v38 + 80) = v44;
    *(void *)(v38 + 136) = v39;
    *(void *)(v38 + 144) = v40;
    *(void *)(v38 + 112) = v34;
    *(void *)(v38 + 120) = v36;
    *(void *)(v38 + 176) = v39;
    *(void *)(v38 + 184) = v40;
    *(void *)(v38 + 152) = v34;
    *(void *)(v38 + 160) = v36;
    swift_bridgeObjectRetain();
    goto LABEL_22;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of PaywallRouterType.routeToCampaignLandingPage(with:sourceChannelID:sourceArticleID:purchaseSessionID:paywallType:postPurchaseURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return (*(uint64_t (**)(void))(a12 + 8))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToCampaignLandingPage(with:sourceChannelID:sourceArticleID:purchaseSessionID:paywallType:postPurchaseDestination:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return (*(uint64_t (**)(void))(a12 + 16))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToWebLink(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToDynamicLink(with:placement:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToPreBuyFlow(with:placement:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToSubscriptionOffers(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PaywallRouterType.routeToPreBuyEmailSignup(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t PostPurchaseDestination.overridenPostPurchaseDestination(with:postPurchaseUrl:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v34 = a2;
  id v37 = a4;
  sub_1BFA4D9FC(0);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v34 - v9;
  uint64_t v11 = sub_1BFBD1DD8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = type metadata accessor for PostPurchaseDestination();
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  id v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v34 - v22;
  if (a1 == 2)
  {
    uint64_t v27 = v12;
    if (v35)
    {
      sub_1BFBD1DB8();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
      {
        uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
        v32(v17, v10, v11);
        v32(v37, v17, v11);
        return swift_storeEnumTagMultiPayload();
      }
      sub_1BFB9000C((uint64_t)v10, (uint64_t (*)(void))sub_1BFA4D9FC);
    }
    uint64_t v28 = v36;
    sub_1BFB8FFA8(v36, (uint64_t)v21);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v8, v21, v11);
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v8, v29, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v8, 1, v11) == 1)
    {
      uint64_t v30 = (uint64_t (*)(void))sub_1BFA4D9FC;
      uint64_t v31 = (uint64_t)v8;
      goto LABEL_18;
    }
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v33(v15, v8, v11);
    v33(v37, v15, v11);
    return swift_storeEnumTagMultiPayload();
  }
  if (a1 == 1)
  {
    uint64_t v28 = v36;
    sub_1BFB8FFA8(v36, (uint64_t)&v34 - v22);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination;
      uint64_t v31 = (uint64_t)v23;
LABEL_18:
      sub_1BFB9000C(v31, v30);
      return sub_1BFB8FFA8(v28, (uint64_t)v37);
    }
    *id v37 = *v23;
    return swift_storeEnumTagMultiPayload();
  }
  uint64_t v24 = v36;
  uint64_t v25 = v37;
  return sub_1BFB8FFA8(v24, (uint64_t)v25);
}

uint64_t PostPurchaseDestination.postPurchaseURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PostPurchaseDestination();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB8FFA8(v1, (uint64_t)v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v7 = sub_1BFBD1DD8();
  uint64_t v8 = *(void *)(v7 - 8);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v5, v7);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v9, 1, v7);
}

NewsSubscription::PurchaseOrigin_optional __swiftcall PurchaseOrigin.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_1BFBD4ED8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *id v2 = v5;
  return result;
}

uint64_t PurchaseOrigin.rawValue.getter()
{
  uint64_t v1 = 0x50676E69646E616CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x656C7A7A7570;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656568536F6C736FLL;
  }
}

uint64_t sub_1BFB8FB78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BFA5B774(*a1, *a2);
}

uint64_t sub_1BFB8FB84()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFB8FC30()
{
  sub_1BFBD4698();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFB8FCC8()
{
  return sub_1BFBD5128();
}

NewsSubscription::PurchaseOrigin_optional sub_1BFB8FD70(Swift::String *a1)
{
  return PurchaseOrigin.init(rawValue:)(*a1);
}

void sub_1BFB8FD7C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000074;
  unint64_t v4 = 0xEB00000000656761;
  uint64_t v5 = 0x50676E69646E616CLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x656C7A7A7570;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656568536F6C736FLL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BFB8FDE4()
{
  return sub_1BFBD47D8();
}

uint64_t sub_1BFB8FE44()
{
  return sub_1BFBD47B8();
}

uint64_t PostPurchaseDestination.purchaseOrigin.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PostPurchaseDestination();
  MEMORY[0x1F4188790](v4);
  BOOL v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB8FFA8(v2, (uint64_t)v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t result = sub_1BFB9000C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
    char v8 = 3;
  }
  else
  {
    char v8 = *v6;
  }
  *a1 = v8;
  return result;
}

uint64_t type metadata accessor for PostPurchaseDestination()
{
  uint64_t result = qword_1EBA893E8;
  if (!qword_1EBA893E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BFB8FFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PostPurchaseDestination();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BFB9000C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BFB9006C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BFA5AAD8(*a1, *a2);
}

uint64_t sub_1BFB90078()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFB90118()
{
  sub_1BFBD4698();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFB901A4()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFB90240@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BFB91954();
  *a1 = result;
  return result;
}

void sub_1BFB90270(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE800000000000000;
  unint64_t v5 = 0x65756C61566C7275;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000013;
    unint64_t v4 = 0x80000001BFBE64C0;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1702060386;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BFB902CC()
{
  unint64_t v1 = 0x65756C61566C7275;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1702060386;
  }
}

uint64_t sub_1BFB90324@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BFB91954();
  *a1 = result;
  return result;
}

uint64_t sub_1BFB9034C(uint64_t a1)
{
  unint64_t v2 = sub_1BFB909F4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFB90388(uint64_t a1)
{
  unint64_t v2 = sub_1BFB909F4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BFB903C4(char *a1, char *a2)
{
  return sub_1BFA5AA2C(*a1, *a2);
}

uint64_t sub_1BFB903D0()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFB90458()
{
  sub_1BFBD4698();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFB904CC()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFB90550@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1BFBD4ED8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1BFB905B0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7107189;
  if (!*v1) {
    uint64_t v2 = 0x696472616F626E6FLL;
  }
  unint64_t v3 = 0xEE00776F6C46676ELL;
  if (*v1) {
    unint64_t v3 = 0xE300000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1BFB905F4()
{
  return sub_1BFBD47D8();
}

uint64_t sub_1BFB90654()
{
  return sub_1BFBD47B8();
}

uint64_t PostPurchaseDestination.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1BFBD1DD8();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  MEMORY[0x1F4188790](v4);
  BOOL v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PostPurchaseDestination();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB90E68(0, &qword_1EA186A00, MEMORY[0x1E4FBBDE0]);
  uint64_t v11 = v10;
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v20 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFB909F4();
  sub_1BFBD5148();
  sub_1BFB8FFA8(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = v20;
    uint64_t v14 = v21;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v6, v9, v21);
    char v29 = 1;
    char v28 = 0;
    sub_1BFB90A48();
    uint64_t v16 = v22;
    sub_1BFBD4FE8();
    if (!v16)
    {
      char v27 = 1;
      sub_1BFB90F20(&qword_1EA186A18);
      sub_1BFBD4FE8();
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v14);
  }
  else
  {
    char v17 = *v9;
    __int16 v26 = 0;
    sub_1BFB90A48();
    uint64_t v18 = v22;
    sub_1BFBD4FE8();
    if (!v18)
    {
      char v25 = v17;
      char v24 = 2;
      sub_1BFB90A9C();
      sub_1BFBD4FE8();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v11);
}

unint64_t sub_1BFB909F4()
{
  unint64_t result = qword_1EA186A08;
  if (!qword_1EA186A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A08);
  }
  return result;
}

unint64_t sub_1BFB90A48()
{
  unint64_t result = qword_1EA186A10;
  if (!qword_1EA186A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A10);
  }
  return result;
}

unint64_t sub_1BFB90A9C()
{
  unint64_t result = qword_1EA186A20;
  if (!qword_1EA186A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A20);
  }
  return result;
}

uint64_t PostPurchaseDestination.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v25 = sub_1BFBD1DD8();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB90E68(0, &qword_1EA186A28, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = type metadata accessor for PostPurchaseDestination();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFB909F4();
  uint64_t v12 = v27;
  sub_1BFBD5138();
  if (!v12)
  {
    char v27 = v4;
    uint64_t v14 = v24;
    uint64_t v13 = v25;
    uint64_t v21 = v11;
    uint64_t v22 = v9;
    uint64_t v15 = v26;
    char v31 = 0;
    sub_1BFB90ECC();
    sub_1BFBD4F58();
    uint64_t v16 = v6;
    if (v32)
    {
      char v30 = 1;
      sub_1BFB90F20(&qword_1EA186A38);
      uint64_t v18 = v27;
      sub_1BFBD4F58();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v16);
      uint64_t v19 = (uint64_t)v21;
      (*(void (**)(unsigned char *, char *, uint64_t))(v23 + 32))(v21, v18, v13);
    }
    else
    {
      char v28 = 2;
      sub_1BFB90FC8();
      sub_1BFBD4F58();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
      uint64_t v19 = (uint64_t)v21;
      *uint64_t v21 = v29;
    }
    swift_storeEnumTagMultiPayload();
    sub_1BFB90F64(v19, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BFB90E68(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFB909F4();
    unint64_t v7 = a3(a1, &type metadata for PostPurchaseDestination.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BFB90ECC()
{
  unint64_t result = qword_1EA186A30;
  if (!qword_1EA186A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A30);
  }
  return result;
}

uint64_t sub_1BFB90F20(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BFBD1DD8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BFB90F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PostPurchaseDestination();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BFB90FC8()
{
  unint64_t result = qword_1EA186A40;
  if (!qword_1EA186A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A40);
  }
  return result;
}

unint64_t sub_1BFB91020()
{
  unint64_t result = qword_1EA186A48;
  if (!qword_1EA186A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A48);
  }
  return result;
}

uint64_t sub_1BFB91074@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PostPurchaseDestination.init(from:)(a1, a2);
}

uint64_t sub_1BFB9108C(void *a1)
{
  return PostPurchaseDestination.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PurchaseOrigin()
{
  return &type metadata for PurchaseOrigin;
}

uint64_t *initializeBufferWithCopyOfBuffer for PostPurchaseDestination(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1BFBD1DD8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for PostPurchaseDestination(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_1BFBD1DD8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for PostPurchaseDestination(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1BFBD1DD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for PostPurchaseDestination(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BFB9000C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for PostPurchaseDestination(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1BFBD1DD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PostPurchaseDestination(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BFB9000C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1BFB91558()
{
  uint64_t result = sub_1BFBD1DD8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PostPurchaseDestination.Base(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFB916B8);
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

ValueMetadata *type metadata accessor for PostPurchaseDestination.Base()
{
  return &type metadata for PostPurchaseDestination.Base;
}

unsigned char *_s16NewsSubscription14PurchaseOriginOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFB917BCLL);
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

ValueMetadata *type metadata accessor for PostPurchaseDestination.CodingKeys()
{
  return &type metadata for PostPurchaseDestination.CodingKeys;
}

unint64_t sub_1BFB917F8()
{
  unint64_t result = qword_1EA186A50;
  if (!qword_1EA186A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A50);
  }
  return result;
}

unint64_t sub_1BFB91850()
{
  unint64_t result = qword_1EA186A58;
  if (!qword_1EA186A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A58);
  }
  return result;
}

unint64_t sub_1BFB918A8()
{
  unint64_t result = qword_1EA186A60;
  if (!qword_1EA186A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A60);
  }
  return result;
}

unint64_t sub_1BFB91900()
{
  unint64_t result = qword_1EA186A68;
  if (!qword_1EA186A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A68);
  }
  return result;
}

uint64_t sub_1BFB91954()
{
  unint64_t v0 = sub_1BFBD4ED8();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_1BFB919A0()
{
  unint64_t result = qword_1EA186A70;
  if (!qword_1EA186A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A70);
  }
  return result;
}

unint64_t sub_1BFB919F4()
{
  unint64_t result = qword_1EA186A78;
  if (!qword_1EA186A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186A78);
  }
  return result;
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintModifierFactory()
{
  return self;
}

uint64_t sub_1BFB91A6C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for HideMyEmailSignupPrewarmBlueprintModifier();
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v9 = (uint64_t *)((char *)&v13 - v8);
  uint64_t v10 = *v1;
  sub_1BFB91BB8(a1, (uint64_t)&v13 + *(int *)(v7 + 20) - v8, (uint64_t (*)(void))type metadata accessor for HideMyEmailSignupDataModel);
  sub_1BFA4DFE0(v10 + 16, (uint64_t)v9 + *(int *)(v3 + 24));
  void *v9 = 0x6D726177657250;
  v9[1] = 0xE700000000000000;
  sub_1BFB91BB8((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HideMyEmailSignupPrewarmBlueprintModifier);
  sub_1BFB14A7C();
  swift_allocObject();
  sub_1BFB91C20();
  uint64_t v11 = sub_1BFBD3268();
  sub_1BFB91C78((uint64_t)v9);
  return v11;
}

uint64_t sub_1BFB91BB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1BFB91C20()
{
  unint64_t result = qword_1EA1864D0;
  if (!qword_1EA1864D0)
  {
    type metadata accessor for HideMyEmailSignupPrewarmBlueprintModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1864D0);
  }
  return result;
}

uint64_t sub_1BFB91C78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HideMyEmailSignupPrewarmBlueprintModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BFB91CD4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HideMyEmailSignupDataManager()
{
  return self;
}

uint64_t sub_1BFB91D38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for HideMyEmailSignupDataModel();
  uint64_t v3 = v2 - 8;
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD25E8();
  sub_1BFA4E9F4((uint64_t)&v5[*(int *)(v3 + 48)], a1);
  return sub_1BFB5D4FC((uint64_t)v5);
}

void sub_1BFB91DD0()
{
  uint64_t v3 = sub_1BFBD1ED8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v61 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB934F8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v64 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v65 = (id)v0[4];
  id v8 = objc_msgSend(v65, sel_purchaseLookUpEntriesByTagID);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_1BFA4DF3C(0, qword_1EBA85020);
    uint64_t v10 = MEMORY[0x1E4FBB1A0];
    uint64_t v11 = sub_1BFBD4568();

    int64_t v12 = 0;
    uint64_t v13 = *(void *)(v11 + 64);
    uint64_t v53 = v11 + 64;
    uint64_t v66 = v11;
    uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v15 = -1;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    unint64_t v16 = v15 & v13;
    int64_t v54 = (unint64_t)(v14 + 63) >> 6;
    v62 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v59 = (unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
    uint64_t v60 = (void (**)(char *, char *, uint64_t))(v4 + 32);
    uint64_t v57 = (void (**)(char *, uint64_t))(v4 + 8);
    v56 = &v73;
    long long v55 = xmmword_1BFBD9C70;
    uint64_t v63 = v3;
    uint64_t v58 = v0;
    if ((v15 & v13) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v17 = __clz(__rbit64(v16));
    uint64_t v18 = (v16 - 1) & v16;
    for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v12 << 6))
    {
      uint64_t v23 = *(void *)(v66 + 48) + 16 * i;
      uint64_t v9 = *(void **)v23;
      uint64_t v2 = *(void *)(v23 + 8);
      uint64_t v24 = *(void **)(*(void *)(v66 + 56) + 8 * i);
      swift_bridgeObjectRetain();
      id v1 = v24;
      if (objc_msgSend(v1, sel_purchaseType) != (id)2 || (sub_1BFB9274C(v1) & 1) == 0) {
        goto LABEL_30;
      }
      unint64_t v70 = v18;
      uint64_t v25 = (void *)v0[2];
      uint64_t v26 = (void *)sub_1BFBD45C8();
      id v27 = objc_msgSend(v25, sel_accessTokenForTagID_, v26);

      if (!v27)
      {
        if (objc_msgSend(v1, sel_purchaseValidationState) == (id)2)
        {
LABEL_30:
          swift_bridgeObjectRelease();

LABEL_31:
          swift_release();
          return;
        }
        if (qword_1EBA876B8 != -1) {
          goto LABEL_39;
        }
        goto LABEL_33;
      }
      int64_t v68 = v12;
      uint64_t v28 = v10;
      uint64_t v67 = sub_1BFBD45F8();
      char v29 = v1;
      uint64_t v31 = v30;
      char v32 = (void *)v0[3];
      uint64_t v33 = (void *)sub_1BFBD45C8();
      id v69 = v29;
      id v34 = objc_msgSend(v29, sel_lastVerificationTime);
      if (!v34) {
        break;
      }
      uint64_t v35 = v34;
      uint64_t v36 = v61;
      sub_1BFBD1EA8();

      id v37 = v64;
      uint64_t v38 = v36;
      uint64_t v39 = v63;
      (*v60)(v64, v38, v63);
      (*v62)(v37, 0, 1, v39);
      if ((*v59)(v37, 1, v39) == 1) {
        goto LABEL_41;
      }
      unint64_t v40 = (void *)sub_1BFBD1E68();
      (*v57)(v37, v39);
      id v41 = objc_msgSend(v32, sel_consumedArticleIDsForTagID_fromTime_, v33, v40);

      uint64_t v10 = v28;
      uint64_t v42 = sub_1BFBD4828();

      if (qword_1EBA876B8 != -1) {
        swift_once();
      }
      sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = v55;
      *(void *)(v43 + 56) = v28;
      unint64_t v44 = sub_1BFA4DEE8();
      *(void *)(v43 + 32) = v9;
      *(void *)(v43 + 40) = v2;
      *(void *)(v43 + 96) = v28;
      *(void *)(v43 + 104) = v44;
      uint64_t v45 = v67;
      *(void *)(v43 + 64) = v44;
      *(void *)(v43 + 72) = v45;
      *(void *)(v43 + 80) = v31;
      uint64_t v46 = *(void *)(v42 + 16);
      *(void *)(v43 + 136) = MEMORY[0x1E4FBB550];
      *(void *)(v43 + 144) = MEMORY[0x1E4FBB5C8];
      *(void *)(v43 + 112) = v46;
      swift_bridgeObjectRetain();
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      swift_bridgeObjectRelease();
      uint64_t v47 = (void *)sub_1BFBD45C8();
      swift_bridgeObjectRelease();
      sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA84FF0);
      id v1 = (id)sub_1BFBD4A78();
      id v48 = (void *)swift_allocObject();
      v48[2] = v9;
      v48[3] = v2;
      uint64_t v0 = v58;
      v48[4] = v58;
      uint64_t v75 = sub_1BFB93590;
      uint64_t v76 = v48;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v72 = 1107296256;
      uint64_t v73 = sub_1BFB8AFBC;
      uint64_t v74 = &block_descriptor_5;
      uint64_t v9 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v65, sel_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion_, v47, v27, v46, 0, v1, v9);

      _Block_release(v9);
      int64_t v12 = v68;
      unint64_t v16 = v70;
      if (v70) {
        goto LABEL_5;
      }
LABEL_6:
      int64_t v20 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
        goto LABEL_38;
      }
      if (v20 >= v54) {
        goto LABEL_31;
      }
      unint64_t v21 = *(void *)(v53 + 8 * v20);
      ++v12;
      if (!v21)
      {
        int64_t v12 = v20 + 1;
        if (v20 + 1 >= v54) {
          goto LABEL_31;
        }
        unint64_t v21 = *(void *)(v53 + 8 * v12);
        if (!v21)
        {
          int64_t v12 = v20 + 2;
          if (v20 + 2 >= v54) {
            goto LABEL_31;
          }
          unint64_t v21 = *(void *)(v53 + 8 * v12);
          if (!v21)
          {
            int64_t v22 = v20 + 3;
            if (v22 >= v54) {
              goto LABEL_31;
            }
            unint64_t v21 = *(void *)(v53 + 8 * v22);
            if (!v21)
            {
              while (1)
              {
                int64_t v12 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  break;
                }
                if (v12 >= v54) {
                  goto LABEL_31;
                }
                unint64_t v21 = *(void *)(v53 + 8 * v12);
                ++v22;
                if (v21) {
                  goto LABEL_19;
                }
              }
LABEL_38:
              __break(1u);
LABEL_39:
              swift_once();
LABEL_33:
              sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
              uint64_t v49 = swift_allocObject();
              *(_OWORD *)(v49 + 16) = xmmword_1BFBD78F0;
              *(void *)(v49 + 56) = v10;
              *(void *)(v49 + 64) = sub_1BFA4DEE8();
              *(void *)(v49 + 32) = v9;
              *(void *)(v49 + 40) = v2;
              sub_1BFBD4A18();
              sub_1BFBD2D88();
              swift_bridgeObjectRelease();
              objc_msgSend(v65, sel_updatePurchaseEntryToExpired_, v1);
              uint64_t v50 = v0[6];
              sub_1BFBD4A18();
              sub_1BFBD2D88();
              sub_1BFBD4A18();
              sub_1BFBD2D88();
              if (*(unsigned char *)(v50 + 240) == 1)
              {
                uint64_t v51 = *(void **)(v50 + 232);
                uint64_t v75 = sub_1BFAB2B40;
                uint64_t v76 = (void *)v50;
                uint64_t aBlock = MEMORY[0x1E4F143A8];
                uint64_t v72 = 1107296256;
                uint64_t v73 = sub_1BFA840EC;
                uint64_t v74 = &block_descriptor_32;
                uint64_t v52 = _Block_copy(&aBlock);
                swift_retain();
                swift_release();
                objc_msgSend(v51, sel_enqueueBlock_, v52);
                _Block_release(v52);
              }
              else
              {
                sub_1BFBD4A18();
                sub_1BFBD2D88();
              }
              sub_1BFA82C24();
              swift_release();

              return;
            }
            int64_t v12 = v22;
          }
        }
      }
LABEL_19:
      uint64_t v18 = (v21 - 1) & v21;
    }
    (*v62)(v64, 1, 1, v63);
LABEL_41:

    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1BFB9274C(void *a1)
{
  sub_1BFB934F8();
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v55 - v6;
  uint64_t v8 = sub_1BFBD1ED8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v62 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v55 - v13;
  MEMORY[0x1F4188790](v12);
  unint64_t v16 = (char *)&v55 - v15;
  sub_1BFBD1EC8();
  id v17 = objc_msgSend(a1, sel_lastVerificationTime);
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_35;
  }
  uint64_t v18 = v17;
  id v61 = v5;
  id v64 = a1;
  sub_1BFBD1EA8();

  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v59 = v14;
  v58(v7, v14, v8);
  uint64_t v60 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v60(v7, 0, 1, v8);
  uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v57(v7, 1, v8) == 1)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    uint64_t result = v60(v61, 1, 1, v8);
    goto LABEL_38;
  }
  sub_1BFBD1E48();
  double v20 = v19;
  unint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v16, v8);
  v56 = v21;
  v21(v7, v8);
  int64_t v22 = self;
  id v23 = objc_msgSend(v22, sel_standardUserDefaults);
  id v24 = objc_msgSend(v23, sel_integerForKey_, *MEMORY[0x1E4F7E170]);

  if ((NFInternalBuild() & ((uint64_t)v24 > 0)) != 0) {
    double v25 = (double)(uint64_t)v24;
  }
  else {
    double v25 = 86400.0;
  }
  id v26 = objc_msgSend(v22, sel_standardUserDefaults, (double)(uint64_t)v24);
  uint64_t v27 = (uint64_t)objc_msgSend(v26, sel_integerForKey_, *MEMORY[0x1E4F7E178]);

  if (!NFInternalBuild() || v27 < 1)
  {
    uint64_t v27 = (uint64_t)objc_msgSend(objc_msgSend(*(id *)(v63 + 40), sel_appConfiguration), sel_subscriptionsGracePeriodForTokenVerificationSeconds);
    swift_unknownObjectRelease();
  }
  id v28 = v64;
  if (v25 >= v20)
  {
    if (qword_1EBA876B8 != -1) {
      swift_once();
    }
    sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_1BFBD78F0;
    id v41 = objc_msgSend(v28, sel_tagID);
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = sub_1BFBD45F8();
      uint64_t v45 = v44;

      *(void *)(v40 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v40 + 64) = sub_1BFA4DEE8();
      *(void *)(v40 + 32) = v43;
      *(void *)(v40 + 40) = v45;
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      swift_bridgeObjectRelease();
      return 0;
    }
    goto LABEL_36;
  }
  if (objc_msgSend(v64, sel_purchaseValidationState) != (id)3)
  {
    if (objc_msgSend(v28, sel_purchaseValidationState) == (id)1)
    {
      if (qword_1EBA876B8 != -1) {
        swift_once();
      }
      sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_1BFBD78F0;
      uint64_t result = (uint64_t)objc_msgSend(v28, sel_tagID);
      if (result) {
        goto LABEL_26;
      }
      goto LABEL_40;
    }
    return 0;
  }
  sub_1BFBD1EC8();
  id v29 = objc_msgSend(v28, sel_lastVerificationFailureTime);
  if (!v29) {
    goto LABEL_37;
  }
  uint64_t v30 = v29;
  uint64_t v31 = v59;
  sub_1BFBD1EA8();

  char v32 = v61;
  v58(v61, v31, v8);
  v60(v32, 0, 1, v8);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v57)(v32, 1, v8);
  if (result != 1)
  {
    double v34 = (double)v27;
    uint64_t v35 = v62;
    sub_1BFBD1E48();
    double v37 = v36;
    uint64_t v38 = v56;
    v56(v35, v8);
    v38(v32, v8);
    if (v37 < v34)
    {
      if (qword_1EBA876B8 != -1) {
        swift_once();
      }
      sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_1BFBD78F0;
      uint64_t result = (uint64_t)objc_msgSend(v28, sel_tagID);
      if (result)
      {
LABEL_26:
        uint64_t v46 = (void *)result;
        uint64_t v47 = sub_1BFBD45F8();
        uint64_t v49 = v48;

        *(void *)(v39 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v39 + 64) = sub_1BFA4DEE8();
        *(void *)(v39 + 32) = v47;
        *(void *)(v39 + 40) = v49;
        sub_1BFBD4A18();
        sub_1BFBD2D88();
        swift_bridgeObjectRelease();
        return 1;
      }
      goto LABEL_39;
    }
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
    uint64_t v50 = (void *)sub_1BFBD4BD8();
    sub_1BFBD4A18();
    sub_1BFBD2D88();

    uint64_t v51 = v63;
    objc_msgSend(*(id *)(v63 + 32), sel_updatePurchaseEntryToExpired_, v28);
    uint64_t v52 = *(void *)(v51 + 48);
    if (qword_1EBA876B8 != -1) {
      swift_once();
    }
    sub_1BFBD4A18();
    sub_1BFBD2D88();
    sub_1BFBD4A18();
    sub_1BFBD2D88();
    if (*(unsigned char *)(v52 + 240) == 1)
    {
      uint64_t v53 = *(void **)(v52 + 232);
      aBlock[4] = sub_1BFAB2B40;
      aBlock[5] = v52;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1BFA840EC;
      aBlock[3] = &block_descriptor_13_1;
      int64_t v54 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v53, sel_enqueueBlock_, v54);
      _Block_release(v54);
    }
    else
    {
      sub_1BFBD4A18();
      sub_1BFBD2D88();
    }
    sub_1BFA82C24();
    return 0;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1BFB930F4(char a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFB61430(0, (unint64_t *)&qword_1EBA85100, (unint64_t *)&qword_1EBA85120, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1BFBD9C70;
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = sub_1BFA4DEE8();
  *(void *)(v11 + 64) = v13;
  uint64_t v14 = MEMORY[0x1E4FBB390];
  uint64_t v15 = MEMORY[0x1E4FBB3C8];
  *(void *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = a5;
  *(void *)(v11 + 96) = v14;
  *(void *)(v11 + 104) = v15;
  *(unsigned char *)(v11 + 72) = a1 & 1;
  aBlock[0] = a3;
  swift_bridgeObjectRetain();
  id v16 = a3;
  sub_1BFB61430(0, (unint64_t *)&unk_1EBA83830, (unint64_t *)&qword_1EBA85110, MEMORY[0x1E4FBC0E8], MEMORY[0x1E4FBB718]);
  uint64_t v17 = sub_1BFBD4648();
  *(void *)(v11 + 136) = v12;
  *(void *)(v11 + 144) = v13;
  *(void *)(v11 + 112) = v17;
  *(void *)(v11 + 120) = v18;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  if (!a3) {
    goto LABEL_10;
  }
  aBlock[0] = a3;
  id v19 = a3;
  sub_1BFA4E0BC(0, (unint64_t *)&qword_1EBA85110);
  sub_1BFA4DF3C(0, &qword_1EA186A80);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v20 = (uint64_t)objc_msgSend(v26, sel_code);
  uint64_t v21 = *MEMORY[0x1E4F7E8D8];

  if (v20 != v21 || v20 <= -1)
  {
LABEL_10:
    if ((a1 & 1) == 0)
    {
      uint64_t v23 = *(void *)(a6 + 48);
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      if (*(unsigned char *)(v23 + 240) == 1)
      {
        id v24 = *(void **)(v23 + 232);
        aBlock[4] = sub_1BFAB2B40;
        aBlock[5] = v23;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1BFA840EC;
        aBlock[3] = &block_descriptor_9;
        double v25 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v24, sel_enqueueBlock_, v25);
        _Block_release(v25);
      }
      else
      {
        sub_1BFBD4A18();
        sub_1BFBD2D88();
      }
      sub_1BFA82C24();
    }
  }
}

uint64_t sub_1BFB9347C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WebSubscriptionStatusChecker()
{
  return self;
}

void sub_1BFB934F8()
{
  if (!qword_1EBA83870)
  {
    sub_1BFBD1ED8();
    unint64_t v0 = sub_1BFBD4BF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA83870);
    }
  }
}

uint64_t sub_1BFB93550()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BFB93590(char a1, uint64_t a2, void *a3)
{
  sub_1BFB930F4(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t BundleSubscriptionExpiredAlert.title.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BFBD1C78();

  sub_1BFA4DE80();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BFBD78F0;
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 64) = sub_1BFA4DEE8();
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1BFBD4618();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t BundleSubscriptionExpiredAlert.message.getter()
{
  unint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v4 = *v0;
  uint64_t v5 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v5 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_6:
    type metadata accessor for Localized();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_1BFBD1C78();

    sub_1BFA4DE80();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1BFBD78F0;
    *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v8 + 64) = sub_1BFA4DEE8();
    *(void *)(v8 + 32) = v2;
    *(void *)(v8 + 40) = v3;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1BFBD4618();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t BundleSubscriptionExpiredAlert.preferredActionButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FAC7A0];
  uint64_t v3 = sub_1BFBD3438();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t BundleSubscriptionExpiredAlert.acceptButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t BundleSubscriptionExpiredAlert.rejectButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFB93A54()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFB93B14()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t getEnumTagSinglePayload for BundleSubscriptionExpiredAlert(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BundleSubscriptionExpiredAlert(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BundleSubscriptionExpiredAlert()
{
  return &type metadata for BundleSubscriptionExpiredAlert;
}

uint64_t sub_1BFB93C74(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93C94, &qword_1EA186A88);
}

uint64_t sub_1BFB93C94(void *a1)
{
  return sub_1BFB93CFC(a1);
}

uint64_t static Presets.BundleSubscriptions.none.getter()
{
  return sub_1BFB9471C(&qword_1EA183C00);
}

uint64_t sub_1BFB93CC8(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93CE8, &qword_1EA186A90);
}

uint64_t sub_1BFB93CE8(void *a1)
{
  return sub_1BFB93CFC(a1);
}

uint64_t sub_1BFB93CFC(void *a1)
{
  if (qword_1EA183DB0 != -1) {
    swift_once();
  }
  sub_1BFAFA7E8();
  sub_1BFB94A10((unint64_t *)&qword_1EA186AD8, (void (*)(uint64_t))sub_1BFAFA7E8);
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183DA8 != -1) {
    swift_once();
  }
  return sub_1BFBD2148();
}

uint64_t static Presets.BundleSubscriptions.iTMS5.getter()
{
  return sub_1BFB9471C(&qword_1EA183C08);
}

uint64_t sub_1BFB93E7C(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93E9C, &qword_1EA186A98);
}

uint64_t sub_1BFB93E9C(void *a1)
{
  return sub_1BFB93CFC(a1);
}

uint64_t static Presets.BundleSubscriptions.iTMS6.getter()
{
  return sub_1BFB9471C(&qword_1EA183C10);
}

uint64_t sub_1BFB93ED4(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93EF4, &qword_1EA186AA0);
}

uint64_t sub_1BFB93EF4(void *a1)
{
  return sub_1BFB93CFC(a1);
}

uint64_t static Presets.BundleSubscriptions.iTMS7.getter()
{
  return sub_1BFB9471C(&qword_1EA183C18);
}

uint64_t sub_1BFB93F2C(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93F4C, &qword_1EA186AA8);
}

uint64_t sub_1BFB93F4C(void *a1)
{
  return sub_1BFB93CFC(a1);
}

uint64_t static Presets.BundleSubscriptions.iTMS11.getter()
{
  return sub_1BFB9471C(&qword_1EA183C20);
}

uint64_t sub_1BFB93F84(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB93FA4, &qword_1EA186AB0);
}

uint64_t sub_1BFB93FA4(void *a1)
{
  return sub_1BFB94020(a1);
}

uint64_t static Presets.BestOffers.iTMS6.getter()
{
  return sub_1BFB9471C(&qword_1EA183C28);
}

uint64_t sub_1BFB93FE4(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB94004, &qword_1EA186AB8);
}

uint64_t sub_1BFB94004(void *a1)
{
  return sub_1BFB94020(a1);
}

uint64_t sub_1BFB94020(void *a1)
{
  if (qword_1EA183CD8 != -1) {
    swift_once();
  }
  return sub_1BFBD2148();
}

uint64_t static Presets.BestOffers.iTMS7.getter()
{
  return sub_1BFB9471C(&qword_1EA183C30);
}

uint64_t sub_1BFB940F0(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB94110, &qword_1EA186AC0);
}

uint64_t static Presets.BestOffers.none.getter()
{
  return sub_1BFB9471C(&qword_1EA183C38);
}

uint64_t sub_1BFB94138(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB94158, &qword_1EA186AC8);
}

uint64_t sub_1BFB94158(void *a1)
{
  uint64_t v2 = sub_1BFBD20B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB94788(a1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183CF8 != -1) {
    swift_once();
  }
  char v8 = 1;
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183CB8 != -1) {
    swift_once();
  }
  uint64_t v7 = 1;
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EBA82C10 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FAB280], v2);
  sub_1BFB94A10(&qword_1EBA82068, MEMORY[0x1E4FAB298]);
  sub_1BFBD2148();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t static Presets.BestOffers.appleOneViaCarrier.getter()
{
  return sub_1BFB9471C(&qword_1EA183C40);
}

uint64_t sub_1BFB94400(uint64_t a1)
{
  return sub_1BFB94420(a1, (uint64_t)sub_1BFB94478, &qword_1EA186AD0);
}

uint64_t sub_1BFB94420(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1BFBD21D8();
  swift_allocObject();
  uint64_t result = sub_1BFBD21C8();
  *a3 = result;
  return result;
}

uint64_t sub_1BFB94478(void *a1)
{
  uint64_t v2 = sub_1BFBD20B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB94788(a1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183D00 != -1) {
    swift_once();
  }
  char v8 = 1;
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183CB8 != -1) {
    swift_once();
  }
  uint64_t v7 = 0;
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EBA82908 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FAB280], v2);
  sub_1BFB94A10(&qword_1EBA82068, MEMORY[0x1E4FAB298]);
  sub_1BFBD2148();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t static Presets.BestOffers.paidBundleViaOffer.getter()
{
  return sub_1BFB9471C(&qword_1EA183C48);
}

uint64_t sub_1BFB9471C(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

ValueMetadata *type metadata accessor for Presets.BundleSubscriptions()
{
  return &type metadata for Presets.BundleSubscriptions;
}

ValueMetadata *type metadata accessor for Presets.BestOffers()
{
  return &type metadata for Presets.BestOffers;
}

uint64_t sub_1BFB94788(void *a1)
{
  if (qword_1EA183D00 != -1) {
    swift_once();
  }
  sub_1BFBD2158();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183CF8 != -1) {
    swift_once();
  }
  sub_1BFBD2158();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EA183CB8 != -1) {
    swift_once();
  }
  sub_1BFBD2148();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EBA82C10 != -1) {
    swift_once();
  }
  sub_1BFBD20B8();
  sub_1BFB94A10(&qword_1EBA82068, MEMORY[0x1E4FAB298]);
  sub_1BFBD2158();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (qword_1EBA82908 != -1) {
    swift_once();
  }
  return sub_1BFBD2158();
}

uint64_t sub_1BFB94A10(unint64_t *a1, void (*a2)(uint64_t))
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

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for HideMyEmailSignupBlueprintFooterLayoutAttributes(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HideMyEmailSignupBlueprintFooterLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HideMyEmailSignupBlueprintFooterLayoutAttributes()
{
  return &type metadata for HideMyEmailSignupBlueprintFooterLayoutAttributes;
}

id BridgedFamilyStatusManager.__allocating_init(familyStatusManager:)(uint64_t a1, uint64_t a2)
{
  long long v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR____TtC16NewsSubscription26BridgedFamilyStatusManager_familyStatusManager];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id BridgedFamilyStatusManager.init(familyStatusManager:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR____TtC16NewsSubscription26BridgedFamilyStatusManager_familyStatusManager];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

void BridgedFamilyStatusManager.refreshFamilyStatus()()
{
}

void sub_1BFB94BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BFBD4128();
  sub_1BFBD2CB8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  sub_1BFA9C504(a1);
  uint64_t v9 = (void *)sub_1BFBD2AF8();
  sub_1BFB89B90(0, (unint64_t *)&unk_1EA185A68);
  sub_1BFBD2B68();
  swift_release();
  swift_release();

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  sub_1BFA9C504(a3);
  uint64_t v11 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B98();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1BFB94D34()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BFB94D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1BFB94D74@<X0>(uint64_t a1@<X0>, void (*a2)(void *)@<X1>, char *a3@<X8>)
{
  id v19 = a3;
  uint64_t v5 = sub_1BFBD4118();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BFBD4128();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (unsigned __int8 *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  int v13 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v10 + 88))(v12, v9);
  if (v13 == *MEMORY[0x1E4F80888])
  {
    uint64_t result = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v10 + 96))(v12, v9);
    if (a2)
    {
      id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, *v12);
      unint64_t v21 = sub_1BFAB2A40();
      v20[0] = v15;
      a2(v20);
LABEL_7:
      uint64_t result = sub_1BFA5BBF0((uint64_t)v20);
      char v17 = 0;
LABEL_10:
      *id v19 = v17;
      return result;
    }
    goto LABEL_9;
  }
  if (v13 == *MEMORY[0x1E4F80890])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v10 + 96))(v12, v9);
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 32))(v8, v12, v5);
    if (a2)
    {
      id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, sub_1BFBD4108() & 1);
      unint64_t v21 = sub_1BFAB2A40();
      v20[0] = v16;
      a2(v20);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      goto LABEL_7;
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_9:
    char v17 = 1;
    goto LABEL_10;
  }
  uint64_t result = sub_1BFBD5038();
  __break(1u);
  return result;
}

void BridgedFamilyStatusManager.syncFamilyStatus()()
{
}

void sub_1BFB950BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  id v7 = objc_allocWithZone(MEMORY[0x1E4F81BF0]);
  v11[4] = a2;
  v11[5] = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1BFB95894;
  v11[3] = a3;
  uint64_t v8 = _Block_copy(v11);
  id v9 = v3;
  swift_release();
  id v10 = objc_msgSend(v7, sel_initWithResolver_, v8);
  _Block_release(v8);
  if (!v10) {
    __break(1u);
  }
}

uint64_t sub_1BFB951A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_1BFBD2548();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a5;
  v8[3] = a1;
  v8[4] = a2;
  id v9 = a5;
  sub_1BFA9C504(a1);
  sub_1BFBD2538();
  return swift_release();
}

uint64_t sub_1BFB9524C(uint64_t a1, void (*a2)(void *), uint64_t a3)
{
  v23[1] = a3;
  uint64_t v4 = sub_1BFBD4118();
  v23[0] = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFB95A50();
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BFBD4128();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (unsigned __int8 *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  id v16 = (char *)v23 - v15;
  swift_getObjectType();
  sub_1BFBD4468();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    (*(void (**)(unsigned __int8 *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    int v19 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v11 + 88))(v14, v10);
    if (v19 == *MEMORY[0x1E4F80888])
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 96))(v14, v10);
      if (a2)
      {
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, *v14);
        unint64_t v25 = sub_1BFAB2A40();
        v24[0] = v20;
        a2(v24);
LABEL_10:
        (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
        return sub_1BFA5BBF0((uint64_t)v24);
      }
    }
    else
    {
      if (v19 != *MEMORY[0x1E4F80890])
      {
        uint64_t result = sub_1BFBD5038();
        __break(1u);
        return result;
      }
      (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 96))(v14, v10);
      uint64_t v21 = v23[0];
      (*(void (**)(char *, unsigned __int8 *, uint64_t))(v23[0] + 32))(v6, v14, v4);
      if (a2)
      {
        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithBool_, sub_1BFBD4108() & 1);
        unint64_t v25 = sub_1BFAB2A40();
        v24[0] = v22;
        a2(v24);
        (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
        goto LABEL_10;
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  uint64_t result = sub_1BFB95AA8((uint64_t)v9);
  if (a2)
  {
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithInteger_, 0);
    unint64_t v25 = sub_1BFAB2A40();
    v24[0] = v18;
    a2(v24);
    return sub_1BFA5BBF0((uint64_t)v24);
  }
  return result;
}

void sub_1BFB956AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F81BF0]);
  v14[4] = a4;
  v14[5] = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1BFB95894;
  v14[3] = a5;
  uint64_t v10 = _Block_copy(v14);
  id v11 = a1;
  swift_release();
  id v12 = objc_msgSend(v9, sel_initWithResolver_, v10);
  _Block_release(v10);
  if (v12)
  {

    id v13 = v12;
  }
  else
  {
    __break(1u);
  }
}

id BridgedFamilyStatusManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BridgedFamilyStatusManager.init()()
{
}

id BridgedFamilyStatusManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BFB95894(uint64_t a1, void *aBlock, const void *a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t, void *, uint64_t))(a1 + 32);
  uint64_t v5 = _Block_copy(aBlock);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v5 = sub_1BFB95CE4;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = _Block_copy(a3);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    uint64_t v7 = sub_1BFB95CDC;
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_retain();
  v4(v5, v6, v7, v8);
  sub_1BFA9C2FC((uint64_t)v7);
  sub_1BFA9C2FC((uint64_t)v5);
  return swift_release();
}

uint64_t sub_1BFB959A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BFB951A4(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t type metadata accessor for BridgedFamilyStatusManager()
{
  return self;
}

uint64_t method lookup function for BridgedFamilyStatusManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BridgedFamilyStatusManager);
}

uint64_t dispatch thunk of BridgedFamilyStatusManager.__allocating_init(familyStatusManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1BFB959FC()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BFB95A44()
{
  return sub_1BFB9524C(*(void *)(v0 + 16), *(void (**)(void *))(v0 + 24), *(void *)(v0 + 32));
}

void sub_1BFB95A50()
{
  if (!qword_1EA186AE8)
  {
    sub_1BFBD4128();
    unint64_t v0 = sub_1BFBD4BF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186AE8);
    }
  }
}

uint64_t sub_1BFB95AA8(uint64_t a1)
{
  sub_1BFB95A50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BFB95B04(uint64_t a1, uint64_t a2)
{
  sub_1BFA7EBC0(a1, (uint64_t)v10);
  uint64_t v3 = v11;
  if (v11)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = sub_1BFBD5028();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v8);
  return swift_unknownObjectRelease();
}

void sub_1BFB95C40(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1BFBD1CF8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1BFB95CA4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BFB95CDC(uint64_t a1)
{
  sub_1BFB95C40(a1, *(void *)(v1 + 16));
}

uint64_t sub_1BFB95CE4(uint64_t a1)
{
  return sub_1BFB95B04(a1, *(void *)(v1 + 16));
}

uint64_t sub_1BFB95CEC()
{
  return sub_1BFBD4478();
}

uint64_t sub_1BFB95D40@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1BFB94D74(a1, *(void (**)(void *))(v2 + 16), a2);
}

uint64_t sub_1BFB95D60()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

BOOL static AppLaunchUpsellTriggerResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppLaunchUpsellTriggerResult.hash(into:)()
{
  return sub_1BFBD5108();
}

uint64_t AppLaunchUpsellTriggerResult.hashValue.getter()
{
  return sub_1BFBD5128();
}

unint64_t sub_1BFB95E4C()
{
  unint64_t result = qword_1EA186AF0;
  if (!qword_1EA186AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186AF0);
  }
  return result;
}

uint64_t dispatch thunk of AppLaunchUpsellTrackerType.trackAppLaunchUpsellTriggered(result:articleId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t getEnumTagSinglePayload for AppLaunchUpsellTriggerResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
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
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppLaunchUpsellTriggerResult(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x1BFB96010);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchUpsellTriggerResult()
{
  return &type metadata for AppLaunchUpsellTriggerResult;
}

id DismissibleDynamicViewController.__allocating_init(rootViewController:identifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  int v8 = &v7[OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_identifier];
  *(void *)int v8 = a2;
  *((void *)v8 + 1) = a3;
  v11.receiver = v7;
  v11.super_class = v3;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, a1);

  return v9;
}

uint64_t DismissibleDynamicViewController.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BFB9611C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  return MEMORY[0x1C18BCCA0](v1);
}

uint64_t sub_1BFB9616C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1BFB961D8(void *a1))(uint64_t a1, char a2)
{
  int v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1C18BCCA0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1BFABA1B0;
}

id DismissibleDynamicViewController.init(rootViewController:identifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v7 = &v3[OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_identifier];
  *(void *)uint64_t v7 = a2;
  *((void *)v7 + 1) = a3;
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for DismissibleDynamicViewController();
  id v8 = objc_msgSendSuper2(&v10, sel_initWithRootViewController_, a1);

  return v8;
}

uint64_t type metadata accessor for DismissibleDynamicViewController()
{
  return self;
}

uint64_t sub_1BFB96394()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C18BCCA0](v1);
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

id DismissibleDynamicViewController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void DismissibleDynamicViewController.init(navigationBarClass:toolbarClass:)()
{
}

id DismissibleDynamicViewController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void DismissibleDynamicViewController.init(rootViewController:)()
{
}

id DismissibleDynamicViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1BFBD45C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DismissibleDynamicViewController.init(nibName:bundle:)()
{
}

id DismissibleDynamicViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DismissibleDynamicViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BFB967C0()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DismissibleDynamicViewController.cardSplitViewPresentation(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BFBD3378();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x1E4FAC3B8])
  {
    id v9 = (unsigned int *)MEMORY[0x1E4FACC88];
LABEL_5:
    uint64_t v10 = *v9;
    uint64_t v11 = sub_1BFBD3638();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a2, v10, v11);
    uint64_t v12 = *MEMORY[0x1E4FACC80];
    uint64_t v13 = sub_1BFBD3648();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(a2, v12, v13);
  }
  if (v8 == *MEMORY[0x1E4FAC3B0])
  {
    id v9 = (unsigned int *)MEMORY[0x1E4FACC90];
    goto LABEL_5;
  }
  uint64_t result = sub_1BFBD4E58();
  __break(1u);
  return result;
}

uint64_t sub_1BFB96A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return DismissibleDynamicViewController.cardSplitViewPresentation(for:)(a1, a2);
}

uint64_t sub_1BFB96A1C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1C18BCCA0](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1BFB96A78(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16NewsSubscription32DismissibleDynamicViewController_dismissDelegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of EmbeddedDynamicViewControllerDelegate.dismissibleDynamicViewControllerDidDismiss(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t method lookup function for DismissibleDynamicViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DismissibleDynamicViewController);
}

uint64_t dispatch thunk of DismissibleDynamicViewController.dismissDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of DismissibleDynamicViewController.dismissDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DismissibleDynamicViewController.dismissDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DismissibleDynamicViewController.__allocating_init(rootViewController:identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DismissibleDynamicViewController.presentationControllerDidDismiss(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ArticlePrefetcherType.prefetch(articleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

char *sub_1BFB96C00(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_titleLabel;
  id v12 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_choiceLabel;
  *(void *)&v13[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v15 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_addressPreviewLabel;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v16 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_checkbox;
  *(void *)&v13[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v21.receiver = v13;
  v21.super_class = ObjectType;
  char v17 = (char *)objc_msgSendSuper2(&v21, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v18 = *(void *)&v17[OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_titleLabel];
  int v19 = v17;
  objc_msgSend(v19, sel_addSubview_, v18);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_choiceLabel]);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_addressPreviewLabel]);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_checkbox]);

  return v19;
}

uint64_t type metadata accessor for HideMyEmailSignupChoiceView()
{
  return self;
}

id sub_1BFB96E9C()
{
  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_titleLabel), sel_setHidden_, 0);
}

void sub_1BFB96EBC()
{
  sub_1BFB96F48(&qword_1EA186190);
  JUMPOUT(0x1C18BACD0);
}

uint64_t sub_1BFB96F14()
{
  return sub_1BFB96F48(&qword_1EA186BA0);
}

uint64_t sub_1BFB96F48(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HideMyEmailSignupChoiceView();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BFB96F88()
{
  uint64_t v1 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_titleLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v2 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_choiceLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v3 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_addressPreviewLabel;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v4 = OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_checkbox;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  sub_1BFBD4E58();
  __break(1u);
}

uint64_t sub_1BFB970AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, CGFloat *a3@<X8>)
{
  void (*v53)(void **__return_ptr, uint64_t, uint64_t);
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(void **__return_ptr, uint64_t, uint64_t);
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  char v88;
  double v90;
  double MaxY;
  CGFloat v92;
  double v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  uint64_t result;
  CGFloat v110;
  double v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  id v133;
  double v134;
  uint64_t v135;
  CGFloat height;
  uint64_t v137;
  CGFloat width;
  id v139;
  CGFloat y;
  id v141;
  CGFloat x;
  id v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  uint64_t v156;
  CGFloat v157;
  CGFloat v158;
  CGFloat v159;
  double v160;
  CGFloat v161;
  void *rect;
  CGFloat recta;
  CGFloat rectb;
  uint64_t v165;
  double v166;
  uint64_t v167;
  CGFloat v168;
  uint64_t v169;
  unint64_t v170;
  CGFloat v171;
  double v172;
  id v173;
  uint64_t v174;
  CGFloat v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  id v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  uint64_t v6 = *(void **)(a2 + 48);
  double v7 = *(double *)a2;
  v172 = *(double *)(a2 + 8);
  double v8 = *(double *)(a2 + 16);
  sub_1BFB97F04(a2);
  sub_1BFBD49C8();
  if ((unint64_t)objc_msgSend(v6, sel_horizontalSizeClass) >= 3) {
    goto LABEL_34;
  }
  v173 = v6;
  id v9 = *(void **)a1;
  v169 = a1;
  v170 = *(void *)(*(void *)a1 + 16);
  v156 = a2;
  if (!v170)
  {
    v115 = 0.0;
    v117 = 0.0;
    v152 = 0;
    v153 = 0;
    v154 = 0;
    v155 = 0;
    v150 = 0;
    v151 = 0;
    recta = 0.0;
    v166 = 0.0;
    v146 = 0.0;
    v148 = 0.0;
    v121 = 0.0;
    v123 = 0.0;
    v160 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    v144 = 0.0;
    goto LABEL_13;
  }
  uint64_t v10 = v9[7];
  v165 = v9[6];
  uint64_t v12 = v9[8];
  uint64_t v11 = v9[9];
  __swift_project_boxed_opaque_existential_1((void *)(v174 + 64), *(void *)(v174 + 88));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = sub_1BFBA56A8();
  sub_1BFB97D5C(v13);
  double v15 = v14;
  double v17 = v16;
  rect = (void *)(v174 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(v174 + 64), *(void *)(v174 + 88));
  v155 = v13;
  id v18 = v13;
  id v19 = sub_1BFBA5AEC(v165, v10, v12, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v20 = (unint64_t)objc_msgSend(v6, sel_horizontalSizeClass);
  if (v20 >= 3) {
    goto LABEL_34;
  }
  double v21 = dbl_1BFBE36A0[v20];

  v154 = v19;
  v160 = v21;
  if (v170 < 2)
  {
    v117 = 0.0;
    v152 = 0;
    v153 = 0;
    v150 = 0;
    v151 = 0;
    v166 = 0.0;
    recta = 50.0;
    v148 = 0.0;
    v121 = 0.0;
    v123 = 0.0;
LABEL_10:
    v115 = 0.0;
    v144 = 0.0;
    v146 = 0.0;
    goto LABEL_13;
  }
  uint64_t v22 = v9[13];
  v167 = v9[12];
  uint64_t v24 = v9[14];
  uint64_t v23 = v9[15];
  __swift_project_boxed_opaque_existential_1(rect, *(void *)(v174 + 88));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v25 = sub_1BFBA56A8();
  sub_1BFB97D5C(v25);
  v121 = v27;
  v123 = v26;
  __swift_project_boxed_opaque_existential_1(rect, *(void *)(v174 + 88));
  v153 = v25;
  id v28 = v25;
  id v29 = sub_1BFBA5AEC(v167, v22, v24, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v30 = (unint64_t)objc_msgSend(v6, sel_horizontalSizeClass);
  if (v30 >= 3) {
    goto LABEL_34;
  }
  double v31 = dbl_1BFBE36A0[v30];

  v152 = v29;
  v166 = v31;
  if (v170 < 3)
  {
    v117 = 0.0;
    v150 = 0;
    v151 = 0;
    v148 = 50.0;
    recta = 50.0;
    goto LABEL_10;
  }
  uint64_t v33 = v9[18];
  uint64_t v32 = v9[19];
  uint64_t v35 = v9[20];
  uint64_t v34 = v9[21];
  __swift_project_boxed_opaque_existential_1(rect, *(void *)(v174 + 88));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v36 = sub_1BFBA56A8();
  sub_1BFB97D5C(v36);
  v115 = v37;
  double v39 = v38;
  __swift_project_boxed_opaque_existential_1(rect, *(void *)(v174 + 88));
  id v40 = v36;
  id v41 = sub_1BFBA5AEC(v33, v32, v35, v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v42 = (unint64_t)objc_msgSend(v6, sel_horizontalSizeClass);
  if (v42 >= 3)
  {
LABEL_34:
    uint64_t result = sub_1BFBD4E58();
    __break(1u);
    return result;
  }
  v117 = v39;
  v150 = v41;
  v151 = v40;
  v146 = dbl_1BFBE36A0[v42];

  recta = 50.0;
  v148 = 50.0;
  v144 = 50.0;
LABEL_13:
  double v43 = v8;
  uint64_t v44 = (void *)*__swift_project_boxed_opaque_existential_1((void *)(v174 + 64), *(void *)(v174 + 88));
  sub_1BFA6DF5C();
  uint64_t inited = swift_initStackObject();
  uint64_t v46 = (void **)MEMORY[0x1E4FB06F8];
  *(_OWORD *)(inited + 16) = xmmword_1BFBD7990;
  uint64_t v47 = *v46;
  *(void *)(inited + 32) = *v46;
  v141 = self;
  swift_bridgeObjectRetain();
  v139 = v47;
  id v48 = objc_msgSend(v141, sel_systemFontOfSize_, 15.0);
  v137 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  *(void *)(inited + 40) = v48;
  uint64_t v49 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v137;
  *(void *)(inited + 72) = v49;
  uint64_t v50 = v44 + 2;
  uint64_t v51 = v44[5];
  uint64_t v52 = v44[6];
  __swift_project_boxed_opaque_existential_1(v50, v51);
  uint64_t v53 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v52 + 24);
  v133 = v49;
  v53(&v176, v51, v52);
  int64_t v54 = v176;
  uint64_t v55 = v177;
  v56 = v178;
  uint64_t v57 = v179;
  uint64_t v58 = v181;

  v135 = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 104) = v135;
  *(void *)(inited + 80) = v58;
  sub_1BFAF8D10(inited);
  uint64_t v59 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v60 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  id v61 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  v62 = objc_msgSend(v59, sel_initWithString_attributes_, v60, v61);

  v143 = v62;
  sub_1BFBD4AB8();
  v110 = v64;
  v111 = v63;
  id v65 = (void *)*__swift_project_boxed_opaque_existential_1((void *)(v174 + 64), *(void *)(v174 + 88));
  uint64_t v66 = swift_initStackObject();
  *(_OWORD *)(v66 + 16) = xmmword_1BFBD7990;
  *(void *)(v66 + 32) = v139;
  swift_bridgeObjectRetain();
  uint64_t v67 = v139;
  *(void *)(v66 + 40) = objc_msgSend(v141, sel_systemFontOfSize_, 13.0);
  *(void *)(v66 + 64) = v137;
  *(void *)(v66 + 72) = v133;
  id v69 = v65[5];
  int64_t v68 = v65[6];
  __swift_project_boxed_opaque_existential_1(v65 + 2, v69);
  unint64_t v70 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v68 + 24);
  uint64_t v71 = v133;
  v70(&v176, v69, v68);
  uint64_t v72 = v176;
  uint64_t v73 = v177;
  uint64_t v74 = v178;
  uint64_t v75 = v179;
  uint64_t v76 = v180;

  *(void *)(v66 + 104) = v135;
  *(void *)(v66 + 80) = v76;
  sub_1BFAF8D10(v66);
  uint64_t v77 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v78 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  uint64_t v79 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  uint64_t v80 = objc_msgSend(v77, sel_initWithString_attributes_, v78, v79);

  if (objc_msgSend(v173, sel_horizontalSizeClass) == (id)1
    && (uint64_t v81 = objc_msgSend(self, sel_currentDevice),
        uint64_t v82 = objc_msgSend(v81, sel_userInterfaceIdiom),
        v81,
        v82 != (id)1))
  {
    uint64_t v83 = v15;
    unint64_t v84 = v17;
  }
  else
  {
    uint64_t v83 = v15;
    unint64_t v84 = v17;
  }
  sub_1BFBD4AB8();
  v86 = v85;
  v134 = v87;
  v182.origin.x = 0.0;
  v175 = 0.0;
  v182.origin.y = 0.0;
  v182.size.width = v7;
  v182.size.height = v172;
  v183 = CGRectIntegral(v182);
  y = v183.origin.y;
  x = v183.origin.x;
  height = v183.size.height;
  width = v183.size.width;
  v88 = *(unsigned char *)(v169 + 8);
  if (v170 == 3 && (v88 & 1) == 0) {
    v90 = 30.0;
  }
  else {
    v90 = 50.0;
  }
  v184.size.width = sub_1BFB97F30(v173, v7, v172);
  v184.size.height = v184.size.width * 14.63 / 100.0;
  v184.origin.x = (v7 - v184.size.width) * 0.5;
  v184.origin.y = v43 + v90;
  v185 = CGRectIntegral(v184);
  v131 = v185.origin.y;
  v132 = v185.origin.x;
  v129 = v185.size.height;
  v130 = v185.size.width;
  v186.origin.y = CGRectGetMaxY(v185) + 31.0;
  v186.origin.x = (v7 - v83) * 0.5;
  v186.size.width = v83;
  v186.size.height = v84;
  v187 = CGRectIntegral(v186);
  v127 = v187.origin.y;
  v128 = v187.origin.x;
  v125 = v187.size.height;
  v126 = v187.size.width;
  MaxY = CGRectGetMaxY(v187);
  if (v88)
  {
    v196.origin.y = MaxY + 31.0;
    v196.origin.x = (v7 - v160) * 0.5;
    v196.size.width = v160;
    v196.size.height = recta;
    v197 = CGRectIntegral(v196);
    v92 = v197.origin.x;
    v158 = v197.size.width;
    v159 = v197.origin.y;
    v157 = v197.size.height;
    v198.origin.y = CGRectGetMaxY(v197) + 16.0;
    v198.origin.x = (v7 - v166) * 0.5;
    v198.size.width = v166;
    v93 = v148;
    v198.size.height = v148;
    v195 = CGRectIntegral(v198);
    v116 = 0.0;
    v118 = 0.0;
    v114 = 0.0;
    v122 = 0.0;
    v124 = 0.0;
    v119 = 0.0;
    v120 = 0.0;
    v171 = v195.size.width;
    rectb = v195.origin.x;
    v168 = v195.size.height;
    v161 = v195.origin.y;
  }
  else
  {
    v188.origin.y = MaxY + 16.0;
    v188.origin.x = (v7 - v160) * 0.5;
    v188.size.width = v160;
    v188.size.height = recta;
    v189 = CGRectIntegral(v188);
    v92 = v189.origin.x;
    v158 = v189.size.width;
    v159 = v189.origin.y;
    v157 = v189.size.height;
    v190.origin.y = CGRectGetMaxY(v189) + 16.0;
    v190.origin.x = (v7 - v123) * 0.5;
    v190.size.width = v123;
    v190.size.height = v121;
    v191 = CGRectIntegral(v190);
    v119 = v191.origin.y;
    v120 = v191.origin.x;
    v122 = v191.size.height;
    v124 = v191.size.width;
    v192.origin.y = CGRectGetMaxY(v191) + 16.0;
    v192.origin.x = (v7 - v166) * 0.5;
    v192.size.width = v166;
    v93 = v148;
    v192.size.height = v148;
    v193 = CGRectIntegral(v192);
    v161 = v193.origin.y;
    rectb = v193.origin.x;
    v171 = v193.size.width;
    v168 = v193.size.height;
    v194.origin.y = CGRectGetMaxY(v193) + 16.0;
    v194.origin.x = (v7 - v115) * 0.5;
    v194.size.width = v115;
    v194.size.height = v117;
    v195 = CGRectIntegral(v194);
    v175 = v195.size.width;
    v116 = v195.origin.x;
    v118 = v195.size.height;
    v114 = v195.origin.y;
  }
  v199.origin.y = CGRectGetMaxY(v195) + 16.0;
  v199.origin.x = (v7 - v146) * 0.5;
  v199.size.width = v146;
  v94 = v144;
  v199.size.height = v144;
  v200 = CGRectIntegral(v199);
  v145 = v200.origin.x;
  v147 = v200.origin.y;
  v112 = v200.size.width;
  v113 = v200.size.height;
  if (v94 <= 0.0)
  {
    v200.origin.y = v161;
    v200.origin.x = rectb;
    v200.size.width = v171;
    v200.size.height = v168;
    if (v93 <= 0.0)
    {
      v200.origin.x = v92;
      v200.size.width = v158;
      v200.origin.y = v159;
      v200.size.height = v157;
    }
  }
  v149 = v92;
  v95 = CGRectGetMaxY(v200);
  v96 = 0.0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  if ((*(unsigned char *)(v169 + 48) & 1) == 0)
  {
    v201.size.width = v111;
    v201.origin.y = v95 + 20.0;
    v201.origin.x = (v7 - v111) * 0.5;
    v201.size.height = v110;
    *(CGRect *)&v95 = CGRectIntegral(v201);
    v96 = v95;
    v97 = v100;
    v98 = v101;
    v99 = v102;
  }
  v103 = objc_msgSend(v173, sel_horizontalSizeClass, v95);
  v104 = 20.0;
  if (v103 == (id)1) {
    v104 = 40.0;
  }
  v202.origin.x = (v7 - v86) * 0.5;
  v202.size.height = v134;
  v202.origin.y = v172 - (v134 + v104);
  v202.size.width = v86;
  v203 = CGRectIntegral(v202);
  v105 = v203.origin.x;
  v106 = v203.origin.y;
  v107 = v203.size.width;
  v108 = v203.size.height;
  uint64_t result = sub_1BFB97FE0(v156);
  a3[8] = v132;
  a3[9] = v131;
  a3[10] = v130;
  a3[11] = v129;
  a3[12] = v128;
  a3[13] = v127;
  a3[14] = v126;
  a3[15] = v125;
  *a3 = x;
  a3[1] = y;
  a3[2] = width;
  a3[3] = height;
  a3[4] = x;
  a3[5] = y;
  a3[6] = width;
  a3[7] = height;
  a3[16] = v149;
  a3[17] = v159;
  a3[18] = v158;
  a3[19] = v157;
  a3[20] = v120;
  a3[21] = v119;
  a3[22] = v124;
  a3[23] = v122;
  a3[24] = rectb;
  a3[25] = v161;
  a3[26] = v171;
  a3[27] = v168;
  a3[28] = v116;
  a3[29] = v114;
  a3[30] = v175;
  a3[31] = v118;
  a3[32] = v145;
  a3[33] = v147;
  a3[34] = v112;
  a3[35] = v113;
  a3[36] = v96;
  *((void *)a3 + 37) = v97;
  *((void *)a3 + 38) = v98;
  *((void *)a3 + 39) = v99;
  a3[40] = v105;
  a3[41] = v106;
  a3[42] = v107;
  a3[43] = v108;
  *((void *)a3 + 44) = v155;
  *((void *)a3 + 45) = v153;
  *((void *)a3 + 46) = v151;
  *((void *)a3 + 47) = v154;
  *((void *)a3 + 48) = v152;
  *((void *)a3 + 49) = v150;
  *((void *)a3 + 50) = v143;
  *((void *)a3 + 51) = v80;
  return result;
}

uint64_t sub_1BFB97D5C(void *a1)
{
  uint64_t v2 = sub_1BFBD1B38();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_string);
  uint64_t v7 = sub_1BFBD45F8();
  uint64_t v9 = v8;

  v15[0] = v7;
  v15[1] = v9;
  sub_1BFBD1B18();
  sub_1BFAB08A0();
  uint64_t v10 = sub_1BFBD4C28();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v14 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (v14) {
    return sub_1BFBD4AB8();
  }
  return result;
}

uint64_t type metadata accessor for SubscriptionOffersLayoutAttributesFactory()
{
  return self;
}

uint64_t sub_1BFB97F04(uint64_t a1)
{
  id v2 = *(id *)(a1 + 48);
  return a1;
}

double sub_1BFB97F30(void *a1, double a2, double a3)
{
  if (objc_msgSend(a1, sel_horizontalSizeClass) == (id)1
    && (id v5 = objc_msgSend(self, sel_currentDevice),
        id v6 = objc_msgSend(v5, sel_userInterfaceIdiom),
        v5,
        v6 != (id)1))
  {
    double v7 = 60.5;
  }
  else
  {
    double v7 = 40.5;
  }
  if (a3 >= a2) {
    double v8 = a2;
  }
  else {
    double v8 = a3;
  }
  return v8 * v7 / 100.0;
}

uint64_t sub_1BFB97FE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BFB9800C(uint64_t a1)
{
  unint64_t v2 = sub_1BFBA24E4();
  uint64_t v3 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4F8](a1, v2, v3);
}

uint64_t sub_1BFB98060(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BFBA24E4();
  uint64_t v5 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4F0](a1, a2, v4, v5);
}

uint64_t sub_1BFB980BC(uint64_t a1)
{
  unint64_t v2 = sub_1BFBA24E4();
  uint64_t v3 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4E8](a1, v2, v3);
}

NewsSubscription::BundleTrialStatus_optional __swiftcall BundleTrialStatus.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (NewsSubscription::BundleTrialStatus_optional)rawValue;
}

uint64_t BundleTrialStatus.rawValue.getter()
{
  return *v0;
}

NewsSubscription::BundleTrialStatus_optional sub_1BFB9812C(Swift::Int *a1)
{
  return BundleTrialStatus.init(rawValue:)(*a1);
}

uint64_t sub_1BFB98134(uint64_t a1)
{
  unint64_t v2 = sub_1BFBA2490();
  uint64_t v3 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4F8](a1, v2, v3);
}

uint64_t sub_1BFB98188(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1BFBA2490();
  uint64_t v5 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4F0](a1, a2, v4, v5);
}

uint64_t sub_1BFB981E4(uint64_t a1)
{
  unint64_t v2 = sub_1BFBA2490();
  uint64_t v3 = MEMORY[0x1E4FAB4A0];
  return MEMORY[0x1F415F4E8](a1, v2, v3);
}

uint64_t sub_1BFB98238(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000002ALL, 0x80000001BFBF7AD0, &qword_1EBA87070);
}

uint64_t static Settings.AppLaunch.disableAppLaunchOnboarding.getter()
{
  return sub_1BFB9471C(&qword_1EBA87080);
}

uint64_t sub_1BFB98280(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000002ELL, 0x80000001BFBF7AA0, (uint64_t *)&unk_1EBA82658);
}

uint64_t sub_1BFB982A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v9);
  (*(void (**)(unsigned char *, void))(v11 + 104))(&v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x1E4FAB410]);
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FAB3F8], v5);
  v13[15] = 0;
  sub_1BFBA2668(0, &qword_1EBA83900, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  *a4 = result;
  return result;
}

uint64_t static Settings.AppLaunch.locationServicesAdPromptShown.getter()
{
  return sub_1BFB9471C(&qword_1EBA82668);
}

uint64_t sub_1BFB984AC(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000039, 0x80000001BFBF7A60, (uint64_t *)&unk_1EBA82670);
}

uint64_t static Settings.AppLaunch.ignoreLocationServicesUpgradeRequirement.getter()
{
  return sub_1BFB9471C(&qword_1EBA82680);
}

uint64_t sub_1BFB984F4(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000031, 0x80000001BFBF7A20, &qword_1EBA87060);
}

uint64_t static Settings.AppLaunch.showPersonalizedAdsOnNextLaunch.getter()
{
  return sub_1BFB9471C(&qword_1EBA87068);
}

uint64_t sub_1BFB9853C(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000037, 0x80000001BFBF79E0, &qword_1EBA82C18);
}

uint64_t static Settings.AppLaunch.avoidPromptingForNotificationAuthorization.getter()
{
  return sub_1BFB9471C(qword_1EBA82C20);
}

uint64_t sub_1BFB98584(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000026, 0x80000001BFBF7B80, &qword_1EBA87088);
}

uint64_t static Settings.AppLaunch.disableAppLaunchUpsell.getter()
{
  return sub_1BFB9471C(&qword_1EBA87098);
}

uint64_t sub_1BFB985CC(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000003CLL, 0x80000001BFBF7B40, &qword_1EA186BA8);
}

uint64_t static Settings.AppLaunch.disableAppLaunchPaidBundleViaOfferUpsell.getter()
{
  return sub_1BFB9471C(&qword_1EA183C50);
}

uint64_t sub_1BFB98614(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000002ALL, 0x80000001BFBF79B0, &qword_1EBA87038);
}

uint64_t static Settings.AppLaunch.resetUpsellAppLaunchCount.getter()
{
  return sub_1BFB9471C(&qword_1EBA87048);
}

uint64_t sub_1BFB9865C(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000025, 0x80000001BFBF7980, &qword_1EBA870A0);
}

uint64_t static Settings.AppLaunch.resetUpsellInstanceID.getter()
{
  return sub_1BFB9471C(&qword_1EBA870B0);
}

uint64_t sub_1BFB986A4(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000029, 0x80000001BFBF7950, &qword_1EBA870B8);
}

uint64_t static Settings.AppLaunch.resetUpsellLastShownCampaignID.getter()
{
  return sub_1BFB9471C(&qword_1EBA870C8);
}

uint64_t sub_1BFB986EC(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000028, 0x80000001BFBF7920, &qword_1EBA879E0);
}

uint64_t static Settings.AppLaunch.resetUpsellLastSeenDate.getter()
{
  return sub_1BFB9471C(&qword_1EBA879F0);
}

uint64_t sub_1BFB98734(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000029, 0x80000001BFBF7BB0, &qword_1EBA87050);
}

uint64_t static Settings.AppLaunch.forceUpsellOnEveryLaunch.getter()
{
  return sub_1BFB9471C(&qword_1EBA87058);
}

uint64_t sub_1BFB9877C(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000031, 0x80000001BFBF78E0, &qword_1EA186BB0);
}

uint64_t static Settings.AppLaunch.allowAppLaunchModalsInSimulator.getter()
{
  return sub_1BFB9471C(&qword_1EA183C60);
}

uint64_t sub_1BFB987C4()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1BFBD1ED8();
  MEMORY[0x1F4188790](v8 - 8);
  sub_1BFBD1E28();
  void *v7 = 0xD00000000000001BLL;
  v7[1] = 0x80000001BFBF7860;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  sub_1BFBA26B8();
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EBA829C0 = result;
  return result;
}

uint64_t static Settings.AppLaunch.upsellLastSeenDate.getter()
{
  return sub_1BFB9471C(&qword_1EBA829C8);
}

uint64_t sub_1BFB98A04(uint64_t a1)
{
  return sub_1BFB98A70(a1, 0xD00000000000002ELL, 0x80000001BFBF7880, &qword_1EA186BB8);
}

uint64_t static Settings.AppLaunch.upsellLastPresentedCampaignID.getter()
{
  return sub_1BFB9471C(&qword_1EA183C70);
}

uint64_t sub_1BFB98A4C(uint64_t a1)
{
  return sub_1BFB98A70(a1, 0xD00000000000002CLL, 0x80000001BFBF7830, &qword_1EBA829D0);
}

uint64_t sub_1BFB98A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (void *)((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = 0xD00000000000001BLL;
  v11[1] = 0x80000001BFBF7860;
  (*(void (**)(void *, void))(v12 + 104))(v11, *MEMORY[0x1E4FAB408]);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FAB3F8], v5);
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  *a4 = result;
  return result;
}

uint64_t static Settings.AppLaunch.upsellLastPresenterBundleID.getter()
{
  return sub_1BFB9471C(&qword_1EBA829D8);
}

uint64_t sub_1BFB98C98(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000027, 0x80000001BFBF7800, (uint64_t *)&unk_1EBA82640);
}

uint64_t static Settings.Features.allowInAppMessages.getter()
{
  return sub_1BFB9471C(&qword_1EBA82650);
}

uint64_t sub_1BFB98CE0(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000028, 0x80000001BFBF77D0, &qword_1EA186BC0);
}

uint64_t static Settings.Features.enableSIWAOnMac.getter()
{
  return sub_1BFB9471C(&qword_1EA183C78);
}

uint64_t sub_1BFB98D28(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000033, 0x80000001BFBF7790, &qword_1EA186BC8);
}

uint64_t static Settings.PurchaseFlow.simulatePurchaseFlow.getter()
{
  return sub_1BFB9471C(&qword_1EA183C80);
}

uint64_t sub_1BFB98D78()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  sub_1BFBD45F8();
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD7990;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186BD0 = result;
  return result;
}

uint64_t static Settings.SubscriptionLink.targetType.getter()
{
  return sub_1BFB9471C(&qword_1EA183C88);
}

uint64_t sub_1BFB990D8()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v12[1] = v9;
  sub_1BFBD45F8();
  uint64_t v14 = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v10;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBDC120;
  uint64_t v13 = 0;
  sub_1BFBD21B8();
  uint64_t v13 = 1;
  sub_1BFBD21B8();
  uint64_t v13 = 2;
  sub_1BFBD21B8();
  uint64_t v13 = 3;
  sub_1BFBD21B8();
  uint64_t v13 = 4;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186BD8 = result;
  return result;
}

uint64_t static Settings.PaywallConfigs.ConfigOverrides.configType.getter()
{
  return sub_1BFB9471C(qword_1EA183C90);
}

uint64_t sub_1BFB994E8()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBDBBA0;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  v11[0] = 2;
  sub_1BFBD21B8();
  v11[0] = 3;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EBA838B8 = result;
  return result;
}

uint64_t static Settings.PaywallConfigs.ConfigOverrides.subscriptionButtonTargetType.getter()
{
  return sub_1BFB9471C(&qword_1EBA85238);
}

uint64_t sub_1BFB998A0()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD9C70;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  v11[0] = 2;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186BE0 = result;
  return result;
}

uint64_t static Settings.PaywallConfigs.ConfigOverrides.postPurchaseTargetType.getter()
{
  return sub_1BFB9471C(&qword_1EA183CA0);
}

uint64_t sub_1BFB99C30()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0xD00000000000003FLL;
  v10[1] = 0x80000001BFBF76D0;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186BE8 = result;
  return result;
}

uint64_t static Settings.PaywallConfigs.ConfigOverrides.url.getter()
{
  return sub_1BFB9471C(&qword_1EA183CA8);
}

uint64_t sub_1BFB99E74(uint64_t a1)
{
  return sub_1BFB9B4D8(a1, (void (*)(void))type metadata accessor for Settings.PaywallConfigs.ConfigOverrides, 0xD000000000000045, 0x80000001BFBF7640, &qword_1EBA853C0);
}

uint64_t static Settings.PaywallConfigs.configOverrides.getter()
{
  return sub_1BFB9471C(&qword_1EBA853D0);
}

uint64_t sub_1BFB99ED0()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD9C70;
  v11[0] = -1;
  sub_1BFBD21B8();
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186BF0 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.offerType.getter()
{
  return sub_1BFB9471C(&qword_1EA183CB8);
}

uint64_t sub_1BFB9A260()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0xD000000000000014;
  v10[1] = 0x80000001BFBF75F0;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186BF8 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.offerTitle.getter()
{
  return sub_1BFB9471C(&qword_1EA183CC0);
}

uint64_t sub_1BFB9A494()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0xD00000000000004DLL;
  v10[1] = 0x80000001BFBF7570;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C00 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.offerDescription.getter()
{
  return sub_1BFB9471C(&qword_1EA183CC8);
}

uint64_t sub_1BFB9A6D0()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0xD000000000000010;
  v10[1] = 0x80000001BFBF7520;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C08 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.offerCallToActionTitle.getter()
{
  return sub_1BFB9471C(&qword_1EA183CD0);
}

uint64_t sub_1BFB9A908()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C10 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.buyParams.getter()
{
  return sub_1BFB9471C(&qword_1EA183CD8);
}

uint64_t sub_1BFB9AB2C()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0xD000000000000078;
  v10[1] = 0x80000001BFBF7430;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C18 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.offerLinkAction.getter()
{
  return sub_1BFB9471C(&qword_1EA183CE0);
}

uint64_t sub_1BFB9AD68(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000029, 0x80000001BFBF73D0, &qword_1EA186C20);
}

uint64_t sub_1BFB9AD94(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = sub_1BFBD2198();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_1BFBD21A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (uint64_t *)&v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *uint64_t v14 = sub_1BFBD45F8();
  v14[1] = v15;
  (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FAB408], v11);
  (*(void (**)(unsigned char *, void, uint64_t))(v8 + 104))(v10, *a2, v7);
  v17[15] = 0;
  sub_1BFBA2668(0, &qword_1EBA83900, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  *a5 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.trialEligible.getter()
{
  return sub_1BFB9471C(&qword_1EA183CE8);
}

uint64_t sub_1BFB9AFB8()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBDC120;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  v11[0] = 2;
  sub_1BFBD21B8();
  v11[0] = 3;
  sub_1BFBD21B8();
  v11[0] = 4;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186C28 = result;
  return result;
}

uint64_t static Settings.BestOffers.ConfigOverrides.upsellScenario.getter()
{
  return sub_1BFB9471C(&qword_1EA183CF0);
}

uint64_t sub_1BFB9B3C4(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD00000000000002ELL, 0x80000001BFBF7370, &qword_1EA186C30);
}

uint64_t static Settings.BestOffers.ConfigOverrides.appleOneViaCarrier.getter()
{
  return sub_1BFB9471C(&qword_1EA183CF8);
}

uint64_t sub_1BFB9B414(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD00000000000002ELL, 0x80000001BFBF7340, &qword_1EA186C38);
}

uint64_t static Settings.BestOffers.ConfigOverrides.paidBundleViaOffer.getter()
{
  return sub_1BFB9471C(&qword_1EA183D00);
}

uint64_t Settings.BestOffers.ConfigOverrides.__deallocating_deinit()
{
  _s11TeaSettings0B0C16NewsSubscriptionE10BestOffersV15ConfigOverridesCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_1BFB9B4A0(uint64_t a1)
{
  return sub_1BFB9B4D8(a1, (void (*)(void))type metadata accessor for Settings.BestOffers.ConfigOverrides, 0xD00000000000002BLL, 0x80000001BFBF7310, &qword_1EBA838B0);
}

uint64_t sub_1BFB9B4D8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = sub_1BFBD21A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (uint64_t *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_1BFBD2198();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FAB400], v11);
  *uint64_t v10 = sub_1BFBD45F8();
  v10[1] = v15;
  (*(void (**)(uint64_t *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FAB408], v7);
  uint64_t result = sub_1BFBD20C8();
  *a5 = result;
  return result;
}

uint64_t static Settings.BestOffers.configOverrides.getter()
{
  return sub_1BFB9471C(&qword_1EBA85228);
}

uint64_t sub_1BFB9B6C8(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000026, 0x80000001BFBF72E0, &qword_1EBA82C08);
}

uint64_t static Settings.BestOffers.enableCIP.getter()
{
  return sub_1BFB9471C(&qword_1EBA82C10);
}

uint64_t sub_1BFB9B710(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000038, 0x80000001BFBF72A0, &qword_1EBA82900);
}

uint64_t static Settings.BestOffers.enablePaidBundleViaOffer.getter()
{
  return sub_1BFB9471C(&qword_1EBA82908);
}

uint64_t sub_1BFB9B758(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB3F0], 0xD00000000000001DLL, 0x80000001BFBF7280, &qword_1EA186C40);
}

uint64_t static Settings.AccessChecks.simulateAccessToEverything.getter()
{
  return sub_1BFB9471C(&qword_1EA183D10);
}

uint64_t sub_1BFB9B7A8()
{
  uint64_t v0 = sub_1BFBD21A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD2198();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v10[1] = 0;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB400], v4);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36C0;
  v10[0] = 0;
  sub_1BFBD21B8();
  v10[0] = 60;
  sub_1BFBD21B8();
  v10[0] = 180;
  sub_1BFBD21B8();
  v10[0] = 300;
  sub_1BFBD21B8();
  v10[0] = 600;
  sub_1BFBD21B8();
  v10[0] = 900;
  sub_1BFBD21B8();
  v10[0] = 3600;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB410], v0);
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186C48 = result;
  return result;
}

uint64_t static Settings.Entitlements.cacheRecoveryAttemptDuration.getter()
{
  return sub_1BFB9471C(&qword_1EA183D18);
}

uint64_t sub_1BFB9BC24()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BFBD45F8();
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[15] = 0;
  sub_1BFBA2668(0, &qword_1EBA83900, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C50 = result;
  return result;
}

uint64_t static Settings.Entitlements.simulateEntitlementCacheExpired.getter()
{
  return sub_1BFB9471C(&qword_1EA183D20);
}

uint64_t sub_1BFB9BE50()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36C0;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  v11[0] = 2;
  sub_1BFBD21B8();
  v11[0] = 3;
  sub_1BFBD21B8();
  v11[0] = 4;
  sub_1BFBD21B8();
  v11[0] = 5;
  sub_1BFBD21B8();
  v11[0] = 6;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186C58 = result;
  return result;
}

uint64_t static Settings.Entitlements.entitlementsResultOverride.getter()
{
  return sub_1BFB9471C(&qword_1EA183D28);
}

uint64_t sub_1BFB9C2CC()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186C60 = result;
  return result;
}

uint64_t static Settings.Entitlements.entitlementsOverride.getter()
{
  return sub_1BFB9471C(&qword_1EA183D30);
}

uint64_t sub_1BFB9C4F0(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000033, 0x80000001BFBF70E0, &qword_1EA186C68);
}

uint64_t static Settings.Entitlements.trialPeriodOverride.getter()
{
  return sub_1BFB9471C(&qword_1EA183D38);
}

uint64_t sub_1BFB9C540(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000034, 0x80000001BFBF70A0, &qword_1EA186C70);
}

uint64_t static Settings.Entitlements.simulateFamilyMember.getter()
{
  return sub_1BFB9471C(&qword_1EA183D40);
}

uint64_t sub_1BFB9C590(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000036, 0x80000001BFBF7060, &qword_1EA186C78);
}

uint64_t static Settings.Entitlements.simulateServicesBundle.getter()
{
  return sub_1BFB9471C(&qword_1EA183D48);
}

uint64_t sub_1BFB9C5E0(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000033, 0x80000001BFBF7020, &qword_1EA186C80);
}

uint64_t static Settings.Entitlements.simulateAmplifyUser.getter()
{
  return sub_1BFB9471C(&qword_1EA183D50);
}

uint64_t sub_1BFB9C630(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000047, 0x80000001BFBF6FD0, &qword_1EA186C88);
}

uint64_t static Settings.Entitlements.simulatePaidBundleViaOfferActivation.getter()
{
  return sub_1BFB9471C(&qword_1EA183D58);
}

uint64_t sub_1BFB9C680()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v11[1] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v8);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v8, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBDBBA0;
  v11[0] = 0;
  sub_1BFBD21B8();
  v11[0] = 1;
  sub_1BFBD21B8();
  v11[0] = 2;
  sub_1BFBD21B8();
  v11[0] = 3;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186C90 = result;
  return result;
}

uint64_t static Settings.Entitlements.simulateInitialPurchaseTime.getter()
{
  return sub_1BFB9471C(&qword_1EA183D60);
}

uint64_t sub_1BFB9CA64()
{
  uint64_t v11 = sub_1BFBD21A8();
  uint64_t v0 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1BFBD2198();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  uint64_t v10 = v8;
  uint64_t v13 = -1;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAB400], v3);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v7);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v7, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36D0;
  uint64_t v12 = -1;
  sub_1BFBD21B8();
  uint64_t v12 = 60;
  sub_1BFBD21B8();
  uint64_t v12 = 180;
  sub_1BFBD21B8();
  uint64_t v12 = 300;
  sub_1BFBD21B8();
  uint64_t v12 = 600;
  sub_1BFBD21B8();
  uint64_t v12 = 900;
  sub_1BFBD21B8();
  uint64_t v12 = 1200;
  sub_1BFBD21B8();
  uint64_t v12 = 1800;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FAB410], v11);
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186C98 = result;
  return result;
}

uint64_t static Settings.Subscriptions.meteredCountDuration.getter()
{
  return sub_1BFB9471C(&qword_1EA183D68);
}

uint64_t sub_1BFB9CF44()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186CA0 = result;
  return result;
}

uint64_t static Settings.Subscriptions.landingPageOverride.getter()
{
  return sub_1BFB9471C(&qword_1EA183D70);
}

uint64_t sub_1BFB9D168()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186CA8 = result;
  return result;
}

uint64_t static Settings.Subscriptions.postPurchaseURL.getter()
{
  return sub_1BFB9471C(&qword_1EA183D78);
}

uint64_t sub_1BFB9D38C(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000034, 0x80000001BFBF6E50, &qword_1EA186CB0);
}

uint64_t static Settings.PostPurchaseOnboardingFlow.showPostPurchaseOnboardingAlways.getter()
{
  return sub_1BFB9471C(&qword_1EA183D80);
}

uint64_t sub_1BFB9D3D4(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000047, 0x80000001BFBF6E00, &qword_1EA186CB8);
}

uint64_t static Settings.BundleSubscriptions.forceExpireBundleSubscriptions.getter()
{
  return sub_1BFB9471C(&qword_1EA183D88);
}

uint64_t sub_1BFB9D41C(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000004BLL, 0x80000001BFBF6DB0, &qword_1EA186CC0);
}

uint64_t static Settings.BundleSubscriptions.familySharingLandingPageSeen.getter()
{
  return sub_1BFB9471C(&qword_1EA183D90);
}

uint64_t sub_1BFB9D464()
{
  uint64_t v0 = sub_1BFBD21A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1BFBD2198();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(unsigned char *, void))(v6 + 104))(&v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x1E4FAB3F0]);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB410], v0);
  v8[15] = 0;
  sub_1BFBA2668(0, &qword_1EBA83900, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EBA82D38 = result;
  return result;
}

uint64_t static Settings.BundleSubscriptions.disableArticlePaywalls.getter()
{
  return sub_1BFB9471C(&qword_1EBA85248);
}

uint64_t sub_1BFB9D664()
{
  uint64_t v0 = sub_1BFBD21A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD2198();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBA2A40(0, &qword_1EBA87A00, (void (*)(void))sub_1BFBA2AA0);
  uint64_t v10 = v8;
  char v14 = 0;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB3F0], v4);
  sub_1BFBA2828(0, &qword_1EBA88688, &qword_1EBA879F8, (uint64_t)&type metadata for SettingsArticleAccess);
  sub_1BFBA2AF4(0, &qword_1EBA879F8, (uint64_t)&type metadata for SettingsArticleAccess, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD9C70;
  char v13 = 0;
  sub_1BFBD21B8();
  char v12 = 1;
  sub_1BFBD21B8();
  char v11 = 2;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB410], v0);
  sub_1BFBA2B40();
  uint64_t result = sub_1BFBD21E8();
  qword_1EBA879D8 = result;
  return result;
}

uint64_t static Settings.BundleSubscriptions.defaultArticleAccess.getter()
{
  return sub_1BFB9471C(&qword_1EBA87860);
}

uint64_t sub_1BFB9D9E0(uint64_t a1)
{
  return sub_1BFB9E540(a1, 0xD000000000000041, 0x80000001BFBF6CE0, &qword_1EA186CC8);
}

uint64_t static Settings.BundleSubscriptions.meteredCountMaximumLimit.getter()
{
  return sub_1BFB9471C(&qword_1EA183D98);
}

uint64_t sub_1BFB9DA28()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BFBA2A40(0, &qword_1EA186DD8, (void (*)(void))sub_1BFBA2998);
  v10[15] = 0;
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  sub_1BFBA2828(0, &qword_1EA186DE8, &qword_1EA186DF0, (uint64_t)&type metadata for BundleTrialStatus);
  sub_1BFBA2AF4(0, &qword_1EA186DF0, (uint64_t)&type metadata for BundleTrialStatus, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD9C70;
  v10[14] = 0;
  sub_1BFBD21B8();
  v10[13] = 1;
  sub_1BFBD21B8();
  v10[12] = 2;
  sub_1BFBD21B8();
  sub_1BFBA29EC();
  uint64_t result = sub_1BFBD21E8();
  qword_1EA186CD0 = result;
  return result;
}

uint64_t static Settings.BundleSubscriptions.trialEligible.getter()
{
  return sub_1BFB9471C(&qword_1EA183DA0);
}

uint64_t sub_1BFB9DDB4(uint64_t a1)
{
  return sub_1BFB9DE20(a1, 0xD00000000000003ALL, 0x80000001BFBF6CA0, &qword_1EA186CD8);
}

uint64_t static Settings.BundleSubscriptions.offeredBundlePurchaseIDs.getter()
{
  return sub_1BFB9471C(&qword_1EA183DA8);
}

uint64_t sub_1BFB9DDFC(uint64_t a1)
{
  return sub_1BFB9DE20(a1, 0xD00000000000003DLL, 0x80000001BFBF6C60, &qword_1EA186CE0);
}

uint64_t sub_1BFB9DE20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BFBD21A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  char v12 = (void *)((char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v12 = sub_1BFBD45F8();
  v12[1] = v13;
  (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FAB408], v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FAB400], v5);
  v15[1] = MEMORY[0x1E4FBC860];
  sub_1BFBA2894();
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  *a4 = result;
  return result;
}

uint64_t static Settings.BundleSubscriptions.restorableBundlePurchaseIDs.getter()
{
  return sub_1BFB9471C(&qword_1EA183DB0);
}

uint64_t sub_1BFB9E024(uint64_t a1)
{
  return sub_1BFB9E048(a1, 0xD00000000000003CLL, 0x80000001BFBF6C20, &qword_1EBA889A8);
}

uint64_t sub_1BFB9E048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  double v16 = a4;
  uint64_t v4 = sub_1BFBD2198();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BFBD21A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  uint64_t v18 = 0;
  *uint64_t v11 = sub_1BFBD45F8();
  v11[1] = v13;
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FAB408], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB400], v4);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v12);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v12, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36C0;
  uint64_t v17 = 0;
  sub_1BFBD21B8();
  uint64_t v17 = 60;
  sub_1BFBD21B8();
  uint64_t v17 = 180;
  sub_1BFBD21B8();
  uint64_t v17 = 300;
  sub_1BFBD21B8();
  uint64_t v17 = 600;
  sub_1BFBD21B8();
  uint64_t v17 = 900;
  sub_1BFBD21B8();
  uint64_t v17 = 3600;
  sub_1BFBD21B8();
  uint64_t result = sub_1BFBD21E8();
  *double v16 = result;
  return result;
}

uint64_t static Settings.BundleSubscriptions.prewarmBundlePurchaseRefreshPeriod.getter()
{
  return sub_1BFB9471C(&qword_1EBA88978);
}

uint64_t sub_1BFB9E4D4(uint64_t a1)
{
  return sub_1BFB9E048(a1, 0xD00000000000003FLL, 0x80000001BFBF6BE0, &qword_1EA186CE8);
}

uint64_t static Settings.BundleSubscriptions.entitlementsGracePeriod.getter()
{
  return sub_1BFB9471C(&qword_1EA183DC0);
}

uint64_t sub_1BFB9E51C(uint64_t a1)
{
  return sub_1BFB9E540(a1, 0xD000000000000043, 0x80000001BFBF6B90, &qword_1EA186CF0);
}

uint64_t sub_1BFB9E540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v16 = a2;
  uint64_t v15 = sub_1BFBD21A8();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BFBD2198();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  v14[1] = v12;
  uint64_t v20 = -1;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FAB400], v7);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v11);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v11, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36E0;
  uint64_t v19 = -1;
  sub_1BFBD21B8();
  uint64_t v19 = 1;
  sub_1BFBD21B8();
  uint64_t v19 = 2;
  sub_1BFBD21B8();
  uint64_t v19 = 3;
  sub_1BFBD21B8();
  uint64_t v19 = 5;
  sub_1BFBD21B8();
  uint64_t v19 = 8;
  sub_1BFBD21B8();
  uint64_t v19 = 10;
  sub_1BFBD21B8();
  uint64_t v19 = 12;
  sub_1BFBD21B8();
  uint64_t v19 = 15;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAB410], v15);
  uint64_t result = sub_1BFBD21E8();
  *uint64_t v18 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.meteredCountMaximumLimit.getter()
{
  return sub_1BFB9471C(qword_1EA183DC8);
}

uint64_t sub_1BFB9E9AC()
{
  uint64_t v11 = sub_1BFBD21A8();
  uint64_t v0 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1BFBD2198();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  uint64_t v10 = v8;
  uint64_t v13 = -1;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAB400], v3);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v7);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v7, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36D0;
  uint64_t v12 = -1;
  sub_1BFBD21B8();
  uint64_t v12 = 60;
  sub_1BFBD21B8();
  uint64_t v12 = 180;
  sub_1BFBD21B8();
  uint64_t v12 = 300;
  sub_1BFBD21B8();
  uint64_t v12 = 600;
  sub_1BFBD21B8();
  uint64_t v12 = 900;
  sub_1BFBD21B8();
  uint64_t v12 = 1200;
  sub_1BFBD21B8();
  uint64_t v12 = 1800;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FAB410], v11);
  uint64_t result = sub_1BFBD21E8();
  qword_1EBA820C8 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.publisherPaywallFrequency.getter()
{
  return sub_1BFB9471C(&qword_1EBA820D0);
}

uint64_t sub_1BFB9EE88()
{
  uint64_t v11 = sub_1BFBD21A8();
  uint64_t v0 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1BFBD2198();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  uint64_t v10 = v8;
  uint64_t v13 = -1;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAB400], v3);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v7);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v7, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36D0;
  uint64_t v12 = -1;
  sub_1BFBD21B8();
  uint64_t v12 = 60;
  sub_1BFBD21B8();
  uint64_t v12 = 180;
  sub_1BFBD21B8();
  uint64_t v12 = 300;
  sub_1BFBD21B8();
  uint64_t v12 = 600;
  sub_1BFBD21B8();
  uint64_t v12 = 900;
  sub_1BFBD21B8();
  uint64_t v12 = 1200;
  sub_1BFBD21B8();
  uint64_t v12 = 1800;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FAB410], v11);
  uint64_t result = sub_1BFBD21E8();
  qword_1EBA820B0 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.perDayPaywallFrequency.getter()
{
  return sub_1BFB9471C(&qword_1EBA820B8);
}

uint64_t sub_1BFB9F364()
{
  uint64_t v11 = sub_1BFBD21A8();
  uint64_t v0 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1BFBD2198();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1E4FBB550];
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  uint64_t v10 = v8;
  uint64_t v13 = -1;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FAB400], v3);
  sub_1BFBA2828(0, &qword_1EBA850C8, &qword_1EBA838F8, v7);
  sub_1BFBA2AF4(0, &qword_1EBA838F8, v7, MEMORY[0x1E4FAB418]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBE36D0;
  uint64_t v12 = -1;
  sub_1BFBD21B8();
  uint64_t v12 = 3;
  sub_1BFBD21B8();
  uint64_t v12 = 5;
  sub_1BFBD21B8();
  uint64_t v12 = 8;
  sub_1BFBD21B8();
  uint64_t v12 = 10;
  sub_1BFBD21B8();
  uint64_t v12 = 12;
  sub_1BFBD21B8();
  uint64_t v12 = 15;
  sub_1BFBD21B8();
  uint64_t v12 = 20;
  sub_1BFBD21B8();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FAB410], v11);
  uint64_t result = sub_1BFBD21E8();
  qword_1EBA82060 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.globalPaywallMaximumLimit.getter()
{
  return sub_1BFB9471C(&qword_1EBA820C0);
}

uint64_t sub_1BFB9F7B0(uint64_t a1)
{
  return sub_1BFB9AD94(a1, MEMORY[0x1E4FAB400], 0xD000000000000034, 0x80000001BFBF6A60, &qword_1EA186CF8);
}

uint64_t static Settings.ALaCarteSubscriptions.allowAlacarteFromEOD.getter()
{
  return sub_1BFB9471C(&qword_1EA183DD8);
}

uint64_t sub_1BFB9F800()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BFBD1ED8();
  MEMORY[0x1F4188790](v8 - 8);
  sub_1BFBD1E28();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB410], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  sub_1BFBA26B8();
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EBA82D40 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.paywallShownDate.getter()
{
  return sub_1BFB9471C(&qword_1EBA853E0);
}

uint64_t sub_1BFB9FA28()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FAB410]);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  v8[1] = 0;
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EBA82D48 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.paywallShownCount.getter()
{
  return sub_1BFB9471C(&qword_1EBA85258);
}

uint64_t sub_1BFB9FC24(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD00000000000003BLL, 0x80000001BFBF69A0, &qword_1EA186D00);
}

uint64_t static Settings.ALaCarteSubscriptions.useMandatoryEmailShare.getter()
{
  return sub_1BFB9471C(&qword_1EA183DE0);
}

uint64_t sub_1BFB9FC6C()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FAB410]);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  v8[0] = 0x514745335141364BLL;
  v8[1] = 0xEA00000000005037;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186D08 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.SIWAConfigOverrides.teamID.getter()
{
  return sub_1BFB9471C(&qword_1EA183DE8);
}

uint64_t sub_1BFB9FE84()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FAB410]);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  v8[0] = 0xD000000000000015;
  v8[1] = 0x80000001BFBF6930;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186D10 = result;
  return result;
}

uint64_t static Settings.ALaCarteSubscriptions.SIWAConfigOverrides.clientID.getter()
{
  return sub_1BFB9471C(&qword_1EA183DF0);
}

uint64_t _s11TeaSettings0B0C16NewsSubscriptionE14PaywallConfigsV15ConfigOverridesC3key12defaultValue6accessAHSSSg_SbAA6AccessOtcfC_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a4, v5);
  uint64_t v9 = sub_1BFBD20D8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a4, v5);
  return v9;
}

uint64_t _s11TeaSettings0B0C16NewsSubscriptionE14PaywallConfigsV15ConfigOverridesC3key12defaultValue6accessAHSSSg_SbAA6AccessOtcfc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v5);
  uint64_t v8 = sub_1BFBD20D8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a4, v5);
  return v8;
}

uint64_t sub_1BFBA02DC(uint64_t a1)
{
  return sub_1BFB9B4D8(a1, (void (*)(void))type metadata accessor for Settings.ALaCarteSubscriptions.SIWAConfigOverrides, 0xD00000000000003BLL, 0x80000001BFBF68A0, &qword_1EA186D18);
}

uint64_t static Settings.ALaCarteSubscriptions.siwaOverrides.getter()
{
  return sub_1BFB9471C(&qword_1EA183DF8);
}

uint64_t sub_1BFBA0338(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000034, 0x80000001BFBF6860, &qword_1EBA82928);
}

uint64_t static Settings.PaidBundleViaOffer.paywallsEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82930);
}

uint64_t sub_1BFBA0380(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000042, 0x80000001BFBF6810, &qword_1EBA829B0);
}

uint64_t static Settings.PaidBundleViaOffer.subscriptionsDeeplinkEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA829B8);
}

uint64_t sub_1BFBA03C8(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD00000000000003BLL, 0x80000001BFBF67D0, (uint64_t *)&unk_1EBA82950);
}

uint64_t static Settings.PaidBundleViaOffer.mastheadBannerEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82960);
}

uint64_t sub_1BFBA0410(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000036, 0x80000001BFBF6790, (uint64_t *)&unk_1EBA82938);
}

uint64_t static Settings.PaidBundleViaOffer.iconBadgeEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82948);
}

uint64_t sub_1BFBA0458(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD00000000000003ELL, 0x80000001BFBF6750, (uint64_t *)&unk_1EBA82980);
}

uint64_t static Settings.PaidBundleViaOffer.iconBadgeMercuryEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82990);
}

uint64_t sub_1BFBA04A0(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD00000000000003ELL, 0x80000001BFBF6710, (uint64_t *)&unk_1EBA82998);
}

uint64_t static Settings.PaidBundleViaOffer.localNotificationEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA829A8);
}

uint64_t sub_1BFBA04E8(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD000000000000032, 0x80000001BFBF66D0, (uint64_t *)&unk_1EBA82910);
}

uint64_t static Settings.PaidBundleViaOffer.upsellEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82920);
}

uint64_t sub_1BFBA0530(uint64_t a1)
{
  return sub_1BFBA0554(a1, 0xD00000000000003DLL, 0x80000001BFBF6690, (uint64_t *)&unk_1EBA82968);
}

uint64_t sub_1BFBA0554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = sub_1BFBD2198();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BFBD20B8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBA2794();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FAB278], v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FAB400], v5);
  uint64_t result = sub_1BFBD21F8();
  *a4 = result;
  return result;
}

uint64_t static Settings.PaidBundleViaOffer.appLaunchUpsellEnabled.getter()
{
  return sub_1BFB9471C(&qword_1EBA82978);
}

uint64_t sub_1BFBA0724()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BFBD45F8();
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB400], v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EBA853E8 = result;
  return result;
}

uint64_t static Settings.WebAccess.localServerIP.getter()
{
  return sub_1BFB9471C(&qword_1EBA853F0);
}

uint64_t sub_1BFBA0958()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1BFBD1ED8();
  MEMORY[0x1F4188790](v8 - 8);
  sub_1BFBD1E28();
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  sub_1BFBA26B8();
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186D20 = result;
  return result;
}

uint64_t static Settings.OsloAbandonmentUpsell.lastSeenDate.getter()
{
  return sub_1BFB9471C(&qword_1EA183E08);
}

uint64_t sub_1BFBA0B94()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v7 = sub_1BFBD45F8();
  v7[1] = v8;
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAB408], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  v10[1] = 0;
  sub_1BFBA2668(0, &qword_1EBA83908, MEMORY[0x1E4FBB550], MEMORY[0x1E4FAB4A0], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186D28 = result;
  return result;
}

uint64_t static Settings.OsloAbandonmentUpsell.presentationCount.getter()
{
  return sub_1BFB9471C(&qword_1EA183E10);
}

uint64_t sub_1BFBA0DB4(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD00000000000002FLL, 0x80000001BFBF6600, &qword_1EA186D30);
}

uint64_t static Settings.OsloAbandonmentUpsell.resetLastSeenDate.getter()
{
  return sub_1BFB9471C(&qword_1EA183E18);
}

uint64_t sub_1BFBA0DFC(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000033, 0x80000001BFBF65C0, &qword_1EA186D38);
}

uint64_t static Settings.OsloAbandonmentUpsell.resetPresentationCount.getter()
{
  return sub_1BFB9471C(&qword_1EA183E20);
}

uint64_t sub_1BFBA0E44()
{
  uint64_t v0 = sub_1BFBD2198();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFBD21A8();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FAB410]);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB3F8], v0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_1BFBA2668(0, (unint64_t *)&unk_1EBA853F8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB458], MEMORY[0x1E4FAB420]);
  swift_allocObject();
  uint64_t result = sub_1BFBD2218();
  qword_1EA186D40 = result;
  return result;
}

uint64_t static Settings.OsloAbandonmentUpsell.lastSeenInstanceID.getter()
{
  return sub_1BFB9471C(&qword_1EA183E28);
}

uint64_t sub_1BFBA1048(uint64_t a1)
{
  return sub_1BFB982A4(a1, 0xD000000000000036, 0x80000001BFBF6540, &qword_1EA186D48);
}

uint64_t static Settings.OsloAbandonmentUpsell.resetLastSeenInstanceID.getter()
{
  return sub_1BFB9471C(&qword_1EA183E30);
}

uint64_t sub_1BFBA1090()
{
  uint64_t v0 = MEMORY[0x1E4FBB390];
  uint64_t v1 = MEMORY[0x1E4FAB468];
  sub_1BFBA2668(0, &qword_1EA186DA0, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB398]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v42 - v5;
  uint64_t v7 = sub_1BFBD2128();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1BFBD2058();
  __swift_allocate_value_buffer(v11, qword_1EA186D50);
  uint64_t v46 = __swift_project_value_buffer(v11, (uint64_t)qword_1EA186D50);
  sub_1BFBA2538(0, &qword_1EA186DA8, MEMORY[0x1E4FAB3E8]);
  uint64_t v12 = *(void *)(sub_1BFBD2188() - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v45 = *(void *)(v12 + 72);
  unint64_t v43 = v13;
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_1BFBD7990;
  sub_1BFBA2538(0, &qword_1EA186DB0, (void (*)(uint64_t))sub_1BFBA258C);
  uint64_t v44 = v14;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1BFBE36C0;
  sub_1BFBA2668(0, &qword_1EA186DC0, v0, v1, MEMORY[0x1E4FAB3C0]);
  uint64_t v17 = v16;
  if (qword_1EBA87098 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v50 = *MEMORY[0x1E4FAB2F0];
  uint64_t v53 = v8 + 104;
  int64_t v54 = v18;
  ((void (*)(char *))v18)(v10);
  unsigned int v19 = *MEMORY[0x1E4FAB390];
  uint64_t v20 = *(void (**)(void))(v4 + 104);
  uint64_t v55 = v4 + 104;
  v56 = (void (*)(char *, void, uint64_t))v20;
  unsigned int v57 = v19;
  v20(v6);
  swift_retain();
  uint64_t v21 = sub_1BFBD2168();
  *(void *)(v15 + 56) = v17;
  unint64_t v22 = sub_1BFBA25E4();
  *(void *)(v15 + 64) = v22;
  *(void *)(v15 + 32) = v21;
  uint64_t v52 = v7;
  if (qword_1EBA87048 != -1) {
    swift_once();
  }
  sub_1BFBA2AF4(0, (unint64_t *)&qword_1EBA886B8, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v23 = swift_allocObject();
  long long v48 = xmmword_1BFBDCDE0;
  *(_OWORD *)(v23 + 16) = xmmword_1BFBDCDE0;
  uint64_t v24 = sub_1BFBD2108();
  swift_retain();
  unint64_t v49 = v24;
  *(void *)(v23 + 32) = sub_1BFBD2138();
  uint64_t v58 = v23;
  sub_1BFBD4838();
  v54(v10, v50, v52);
  v56(v6, v57, v3);
  uint64_t v25 = sub_1BFBD2168();
  *(void *)(v15 + 96) = v17;
  *(void *)(v15 + 104) = v22;
  *(void *)(v15 + 72) = v25;
  if (qword_1EBA870B0 != -1) {
    swift_once();
  }
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v48;
  swift_retain();
  *(void *)(v26 + 32) = sub_1BFBD2138();
  uint64_t v58 = v26;
  sub_1BFBD4838();
  v54(v10, v50, v52);
  v56(v6, v57, v3);
  uint64_t v27 = sub_1BFBD2168();
  *(void *)(v15 + 136) = v17;
  *(void *)(v15 + 144) = v22;
  *(void *)(v15 + 112) = v27;
  if (qword_1EBA870C8 != -1) {
    swift_once();
  }
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v48;
  swift_retain();
  *(void *)(v28 + 32) = sub_1BFBD2138();
  uint64_t v58 = v28;
  sub_1BFBD4838();
  uint64_t v29 = v50;
  v54(v10, v50, v52);
  uint64_t v51 = v3;
  v56(v6, v57, v3);
  uint64_t v30 = sub_1BFBD2168();
  *(void *)(v15 + 176) = v17;
  *(void *)(v15 + 184) = v22;
  *(void *)(v15 + 152) = v30;
  uint64_t v31 = v29;
  unint64_t v32 = v22;
  if (qword_1EBA879F0 != -1) {
    swift_once();
  }
  v43 += v47;
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = v48;
  swift_retain();
  *(void *)(v33 + 32) = sub_1BFBD2138();
  uint64_t v58 = v33;
  sub_1BFBD4838();
  uint64_t v34 = v52;
  v54(v10, v31, v52);
  v56(v6, v57, v51);
  uint64_t v35 = sub_1BFBD2168();
  *(void *)(v15 + 216) = v17;
  *(void *)(v15 + 224) = v32;
  *(void *)(v15 + 192) = v35;
  if (qword_1EBA87058 != -1) {
    swift_once();
  }
  id v36 = v54;
  v54(v10, v31, v34);
  v56(v6, v57, v51);
  swift_retain();
  uint64_t v37 = sub_1BFBD2168();
  *(void *)(v15 + 256) = v17;
  *(void *)(v15 + 264) = v32;
  *(void *)(v15 + 232) = v37;
  if (qword_1EA183C60 != -1) {
    swift_once();
  }
  v36(v10, v31, v34);
  v56(v6, v57, v51);
  swift_retain();
  uint64_t v38 = sub_1BFBD2168();
  *(void *)(v15 + 296) = v17;
  *(void *)(v15 + 304) = v32;
  *(void *)(v15 + 272) = v38;
  unint64_t v49 = 0x80000001BFBF63F0;
  sub_1BFBD2178();
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_1BFBD78F0;
  if (qword_1EA183C50 != -1) {
    swift_once();
  }
  v54(v10, v31, v34);
  v56(v6, v57, v51);
  swift_retain();
  uint64_t v40 = sub_1BFBD2168();
  *(void *)(v39 + 56) = v17;
  *(void *)(v39 + 64) = v32;
  *(void *)(v39 + 32) = v40;
  sub_1BFBD2178();
  return sub_1BFBD2048();
}

uint64_t static SettingsBundle.appLaunchUpsell.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BFBA2068(&qword_1EA183E38, (uint64_t)qword_1EA186D50, a1);
}

uint64_t sub_1BFBA1B04()
{
  uint64_t v0 = MEMORY[0x1E4FBB390];
  uint64_t v1 = MEMORY[0x1E4FAB468];
  sub_1BFBA2668(0, &qword_1EA186DA0, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB398]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v30 = (char *)v22 - v5;
  uint64_t v6 = sub_1BFBD2128();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BFBD2058();
  __swift_allocate_value_buffer(v10, qword_1EA186D68);
  uint64_t v24 = __swift_project_value_buffer(v10, (uint64_t)qword_1EA186D68);
  sub_1BFBA2538(0, &qword_1EA186DA8, MEMORY[0x1E4FAB3E8]);
  uint64_t v11 = *(void *)(sub_1BFBD2188() - 8);
  v22[1] = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1BFBD78F0;
  sub_1BFBA2538(0, &qword_1EA186DB0, (void (*)(uint64_t))sub_1BFBA258C);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BFBD9C70;
  sub_1BFBA2668(0, &qword_1EA186DC0, v0, v1, MEMORY[0x1E4FAB3C0]);
  uint64_t v14 = v13;
  if (qword_1EA183E18 != -1) {
    swift_once();
  }
  uint64_t v15 = *MEMORY[0x1E4FAB2F0];
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  uint64_t v29 = v7 + 104;
  v28(v9, v15, v6);
  uint64_t v25 = v6;
  uint64_t v16 = *(void (**)(void))(v4 + 104);
  unsigned int v27 = *MEMORY[0x1E4FAB390];
  uint64_t v26 = (void (*)(char *, void, uint64_t))v16;
  v16(v30);
  swift_retain();
  uint64_t v17 = sub_1BFBD2168();
  *(void *)(v12 + 56) = v14;
  unint64_t v18 = sub_1BFBA25E4();
  *(void *)(v12 + 64) = v18;
  *(void *)(v12 + 32) = v17;
  if (qword_1EA183E20 != -1) {
    swift_once();
  }
  v28(v9, v15, v25);
  v26(v30, v27, v3);
  swift_retain();
  uint64_t v19 = sub_1BFBD2168();
  *(void *)(v12 + 96) = v14;
  *(void *)(v12 + 104) = v18;
  *(void *)(v12 + 72) = v19;
  if (qword_1EA183E30 != -1) {
    swift_once();
  }
  v28(v9, v15, v25);
  v26(v30, v27, v3);
  swift_retain();
  uint64_t v20 = sub_1BFBD2168();
  *(void *)(v12 + 136) = v14;
  *(void *)(v12 + 144) = v18;
  *(void *)(v12 + 112) = v20;
  sub_1BFBD2178();
  return sub_1BFBD2048();
}

uint64_t static SettingsBundle.osloAbandonmentUpsell.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BFBA2068(qword_1EA183E40, (uint64_t)qword_1EA186D68, a1);
}

uint64_t sub_1BFBA2068@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1BFBD2058();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

unint64_t sub_1BFBA2104()
{
  unint64_t result = qword_1EBA87CD0;
  if (!qword_1EBA87CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87CD0);
  }
  return result;
}

unint64_t sub_1BFBA215C()
{
  unint64_t result = qword_1EA186D80;
  if (!qword_1EA186D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186D80);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsArticleAccess()
{
  return &type metadata for SettingsArticleAccess;
}

unsigned char *_s16NewsSubscription21SettingsArticleAccessOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBA2290);
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

ValueMetadata *type metadata accessor for BundleTrialStatus()
{
  return &type metadata for BundleTrialStatus;
}

ValueMetadata *type metadata accessor for Settings.AppLaunch()
{
  return &type metadata for Settings.AppLaunch;
}

ValueMetadata *type metadata accessor for Settings.Features()
{
  return &type metadata for Settings.Features;
}

ValueMetadata *type metadata accessor for Settings.PurchaseFlow()
{
  return &type metadata for Settings.PurchaseFlow;
}

ValueMetadata *type metadata accessor for Settings.SubscriptionLink()
{
  return &type metadata for Settings.SubscriptionLink;
}

ValueMetadata *type metadata accessor for Settings.PaywallConfigs()
{
  return &type metadata for Settings.PaywallConfigs;
}

uint64_t type metadata accessor for Settings.PaywallConfigs.ConfigOverrides(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EBA838C0);
}

uint64_t sub_1BFBA2338()
{
  return sub_1BFBA241C();
}

uint64_t sub_1BFBA2344()
{
  return type metadata accessor for Settings.PaywallConfigs.ConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.BestOffers()
{
  return &type metadata for Settings.BestOffers;
}

uint64_t type metadata accessor for Settings.BestOffers.ConfigOverrides(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EBA83878);
}

uint64_t sub_1BFBA237C()
{
  return sub_1BFBA241C();
}

uint64_t sub_1BFBA2388()
{
  return type metadata accessor for Settings.BestOffers.ConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.AccessChecks()
{
  return &type metadata for Settings.AccessChecks;
}

ValueMetadata *type metadata accessor for Settings.Entitlements()
{
  return &type metadata for Settings.Entitlements;
}

ValueMetadata *type metadata accessor for Settings.Subscriptions()
{
  return &type metadata for Settings.Subscriptions;
}

ValueMetadata *type metadata accessor for Settings.PostPurchaseOnboardingFlow()
{
  return &type metadata for Settings.PostPurchaseOnboardingFlow;
}

ValueMetadata *type metadata accessor for Settings.BundleSubscriptions()
{
  return &type metadata for Settings.BundleSubscriptions;
}

ValueMetadata *type metadata accessor for Settings.ALaCarteSubscriptions()
{
  return &type metadata for Settings.ALaCarteSubscriptions;
}

uint64_t type metadata accessor for Settings.ALaCarteSubscriptions.SIWAConfigOverrides(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EA186D88);
}

uint64_t sub_1BFBA2410()
{
  return sub_1BFBA241C();
}

uint64_t sub_1BFBA241C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BFBA2458()
{
  return type metadata accessor for Settings.ALaCarteSubscriptions.SIWAConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.PaidBundleViaOffer()
{
  return &type metadata for Settings.PaidBundleViaOffer;
}

ValueMetadata *type metadata accessor for Settings.WebAccess()
{
  return &type metadata for Settings.WebAccess;
}

ValueMetadata *type metadata accessor for Settings.OsloAbandonmentUpsell()
{
  return &type metadata for Settings.OsloAbandonmentUpsell;
}

unint64_t sub_1BFBA2490()
{
  unint64_t result = qword_1EA186D98;
  if (!qword_1EA186D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186D98);
  }
  return result;
}

unint64_t sub_1BFBA24E4()
{
  unint64_t result = qword_1EBA87CD8;
  if (!qword_1EBA87CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87CD8);
  }
  return result;
}

void sub_1BFBA2538(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1BFBD5018();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1BFBA258C()
{
  unint64_t result = qword_1EA186DB8;
  if (!qword_1EA186DB8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA186DB8);
  }
  return result;
}

unint64_t sub_1BFBA25E4()
{
  unint64_t result = qword_1EA186DC8;
  if (!qword_1EA186DC8)
  {
    sub_1BFBA2668(255, &qword_1EA186DC0, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB468], MEMORY[0x1E4FAB3C0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186DC8);
  }
  return result;
}

void sub_1BFBA2668(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_1BFBA26B8()
{
  if (!qword_1EBA82D50)
  {
    sub_1BFBD1ED8();
    sub_1BFBA274C(&qword_1EBA82D30, MEMORY[0x1E4F27928]);
    unint64_t v0 = sub_1BFBD2208();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA82D50);
    }
  }
}

uint64_t sub_1BFBA274C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BFBA2794()
{
  if (!qword_1EBA820D8)
  {
    sub_1BFBD20B8();
    sub_1BFBA274C(&qword_1EBA82068, MEMORY[0x1E4FAB298]);
    unint64_t v0 = sub_1BFBD2208();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA820D8);
    }
  }
}

void sub_1BFBA2828(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  if (!*a2)
  {
    sub_1BFBA2AF4(255, a3, a4, MEMORY[0x1E4FAB418]);
    unint64_t v5 = sub_1BFBD5018();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1BFBA2894()
{
  if (!qword_1EA186DD0)
  {
    sub_1BFBA2AF4(255, (unint64_t *)&qword_1EBA84F60, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1BFBA291C();
    unint64_t v0 = sub_1BFBD2208();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186DD0);
    }
  }
}

unint64_t sub_1BFBA291C()
{
  unint64_t result = qword_1EA186AD8;
  if (!qword_1EA186AD8)
  {
    sub_1BFBA2AF4(255, (unint64_t *)&qword_1EBA84F60, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186AD8);
  }
  return result;
}

unint64_t sub_1BFBA2998()
{
  unint64_t result = qword_1EA186DE0;
  if (!qword_1EA186DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186DE0);
  }
  return result;
}

unint64_t sub_1BFBA29EC()
{
  unint64_t result = qword_1EA186DF8;
  if (!qword_1EA186DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186DF8);
  }
  return result;
}

void sub_1BFBA2A40(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  if (!*a2)
  {
    a3();
    unint64_t v4 = sub_1BFBD2208();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1BFBA2AA0()
{
  unint64_t result = qword_1EBA87CC8;
  if (!qword_1EBA87CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87CC8);
  }
  return result;
}

void sub_1BFBA2AF4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1BFBA2B40()
{
  unint64_t result = qword_1EBA87CC0;
  if (!qword_1EBA87CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87CC0);
  }
  return result;
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.paywallsEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.subscriptionsDeeplinkEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.mastheadBannerEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.iconBadgeEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.iconBadgeMercuryEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.localNotificationEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.upsellEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.appLaunchUpsellEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.isPaidBundleViaOfferEligible.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.refreshPaidBundleViaOfferEligibility()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.refreshPaidBundleViaOfferActivated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t __swift_memcpy9_1(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DefaultPaidBundleViaOfferFeatureAvailability(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[9]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultPaidBundleViaOfferFeatureAvailability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultPaidBundleViaOfferFeatureAvailability()
{
  return &type metadata for DefaultPaidBundleViaOfferFeatureAvailability;
}

uint64_t sub_1BFBA2D4C()
{
  return *v0;
}

uint64_t sub_1BFBA2D54()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_1BFBA2D5C()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t sub_1BFBA2D64()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t sub_1BFBA2D6C()
{
  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t sub_1BFBA2D74()
{
  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t sub_1BFBA2D7C()
{
  return *(unsigned __int8 *)(v0 + 6);
}

uint64_t sub_1BFBA2D84()
{
  return *(unsigned __int8 *)(v0 + 7);
}

uint64_t sub_1BFBA2D8C()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t sub_1BFBA2D98()
{
  return sub_1BFBD2BC8();
}

Swift::Bool __swiftcall AMSMarketingItem.isBundleHardwareOffer()()
{
  uint64_t v0 = sub_1BFBA3E80();
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 16);
  if (!v2)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    LOBYTE(v0) = 0;
    return v0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  while (1)
  {
    if (v3 >= *(void *)(v1 + 16))
    {
      __break(1u);
      return v0;
    }
    uint64_t v5 = *(void *)(v1 + 32 + 8 * v3);
    if (*(void *)(v5 + 16)) {
      break;
    }
LABEL_4:
    if (++v3 == v2) {
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1BFA5C7C0(0x6C69626967696C65, 0xEF65707954797469);
  if ((v7 & 1) == 0) {
    goto LABEL_3;
  }
  sub_1BFA5CA14(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v18);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v18 = v16;
  unint64_t v19 = v17;
  uint64_t v16 = 0x4552415744524148;
  unint64_t v17 = 0xEA0000000000315FLL;
  sub_1BFAB08A0();
  uint64_t v8 = v4;
  uint64_t v9 = sub_1BFBD4C58();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_10;
  }
  if (!*(void *)(v5 + 16)) {
    goto LABEL_10;
  }
  unint64_t v10 = sub_1BFA5C7C0(0x5465636976726573, 0xEC00000073657079);
  if ((v11 & 1) == 0) {
    goto LABEL_10;
  }
  sub_1BFA5CA14(*(void *)(v5 + 56) + 32 * v10, (uint64_t)&v18);
  sub_1BFBA406C(0, (unint64_t *)&qword_1EBA84F60, v4, MEMORY[0x1E4FBB320]);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_3:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v12 = MEMORY[0x4552415744524158];
  if (!MEMORY[0x4552415744524158])
  {
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_10:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    uint64_t v4 = v8;
    goto LABEL_4;
  }
  uint64_t v13 = 0x4552415744524170;
  while (1)
  {
    unint64_t v14 = *(void *)v13;
    uint64_t v18 = *(void *)(v13 - 8);
    unint64_t v19 = v14;
    uint64_t v16 = 0x554C505F5357454ELL;
    unint64_t v17 = 0xE900000000000053;
    if (!sub_1BFBD4C58()) {
      break;
    }
    v13 += 16;
    if (!--v12) {
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v0) = 1;
  return v0;
}

Swift::Bool __swiftcall AMSMarketingItem.isCIPOffer()()
{
  uint64_t v0 = sub_1BFBA3E80();
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 16);
  if (!v2)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    LOBYTE(v0) = 0;
    return v0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  while (1)
  {
    if (v3 >= *(void *)(v1 + 16))
    {
      __break(1u);
      return v0;
    }
    uint64_t v5 = *(void *)(v1 + 32 + 8 * v3);
    if (*(void *)(v5 + 16)) {
      break;
    }
LABEL_4:
    if (++v3 == v2) {
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1BFA5C7C0(0x6C69626967696C65, 0xEF65707954797469);
  if ((v7 & 1) == 0 || (sub_1BFA5CA14(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v18), (swift_dynamicCast() & 1) == 0))
  {
LABEL_3:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v8 = v17[0];
  uint64_t v9 = v17[1];
  uint64_t v18 = v17[0];
  uint64_t v19 = v17[1];
  strcpy((char *)v17, "HARD_BUNDLE");
  HIDWORD(v17[1]) = -352321536;
  sub_1BFAB08A0();
  if (sub_1BFBD4C58())
  {
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    strcpy((char *)v17, "EXTENDED_OFFER");
    HIBYTE(v17[1]) = -18;
    uint64_t v10 = sub_1BFBD4C58();
    swift_bridgeObjectRelease();
    if (v10 || !*(void *)(v5 + 16)) {
      goto LABEL_3;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (!*(void *)(v5 + 16)) {
      goto LABEL_3;
    }
  }
  unint64_t v11 = sub_1BFA5C7C0(0x5465636976726573, 0xEC00000073657079);
  if ((v12 & 1) == 0) {
    goto LABEL_3;
  }
  sub_1BFA5CA14(*(void *)(v5 + 56) + 32 * v11, (uint64_t)&v18);
  sub_1BFBA406C(0, (unint64_t *)&qword_1EBA84F60, v4, MEMORY[0x1E4FBB320]);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v13 = *(void *)(v17[0] + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_3;
  }
  unint64_t v14 = (uint64_t *)(v17[0] + 40);
  while (1)
  {
    uint64_t v15 = *v14;
    uint64_t v18 = *(v14 - 1);
    uint64_t v19 = v15;
    strcpy((char *)v17, "NEWS_PLUS");
    WORD1(v17[1]) = 0;
    HIDWORD(v17[1]) = -385875968;
    if (!sub_1BFBD4C58()) {
      break;
    }
    v14 += 2;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v0) = 1;
  return v0;
}

uint64_t AMSMarketingItem.priceString(for:)(void *a1)
{
  return sub_1BFBA34B0(a1, 0x726F466563697270, 0xEF79616C70736944);
}

uint64_t AMSMarketingItem.priceDiff(for:)(void *a1)
{
  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0xD000000000000010, 0x80000001BFBF7BE0, 0x6669446563697270, 0xE900000000000066, &v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1BFA5BBF0((uint64_t)&v3);
    return 0;
  }
}

uint64_t AMSMarketingItem.priceDiffString(for:)(void *a1)
{
  return sub_1BFBA34B0(a1, 0xD000000000000013, 0x80000001BFBF7C00);
}

uint64_t sub_1BFBA34B0(void *a1, uint64_t a2, uint64_t a3)
{
  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0xD000000000000010, 0x80000001BFBF7BE0, a2, a3, &v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1BFA5BBF0((uint64_t)&v5);
    return 0;
  }
}

BOOL AMSMarketingItem.trialEligible(for:)(void *a1)
{
  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0x7363697274656DLL, 0xE700000000000000, 0x6C69626967696C65, 0xEF65707954797469, &v4);
  if (v5)
  {
    if (swift_dynamicCast())
    {
      long long v4 = v3;
      sub_1BFAB08A0();
      uint64_t v1 = sub_1BFBD4C58();
      swift_bridgeObjectRelease();
      return v1 == 0;
    }
  }
  else
  {
    sub_1BFA5BBF0((uint64_t)&v4);
  }
  return 0;
}

uint64_t AMSMarketingItem.upsellScenario(for:)@<X0>(char *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_rawValues);
  sub_1BFAC957C();
  uint64_t v4 = sub_1BFBD4568();

  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1BFA5C7C0(1635018093, 0xE400000000000000), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v16 = v7;
    sub_1BFBA4000();
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      if (*(void *)(v15 + 16) && (unint64_t v9 = sub_1BFA5C7C0(0x7363697274656DLL, 0xE700000000000000), (v10 & 1) != 0))
      {
        sub_1BFA5CA14(*(void *)(v15 + 56) + 32 * v9, (uint64_t)&v16);
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v17 + 1)) {
        goto LABEL_24;
      }
      uint64_t result = swift_dynamicCast();
      if ((result & 1) == 0) {
        goto LABEL_8;
      }
      if (*(void *)(v15 + 16) && (unint64_t v12 = sub_1BFA5C7C0(0x63536C6C65737075, 0xEE006F6972616E65), (v13 & 1) != 0))
      {
        sub_1BFA5CA14(*(void *)(v15 + 56) + 32 * v12, (uint64_t)&v16);
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v17 + 1))
      {
LABEL_24:
        uint64_t result = sub_1BFA5BBF0((uint64_t)&v16);
        goto LABEL_8;
      }
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        long long v16 = v15;
        sub_1BFAB08A0();
        if (!sub_1BFBD4C58())
        {
          uint64_t result = swift_bridgeObjectRelease();
          char v11 = 1;
          goto LABEL_9;
        }
        long long v16 = v15;
        if (!sub_1BFBD4C58())
        {
          uint64_t result = swift_bridgeObjectRelease();
          char v11 = 2;
          goto LABEL_9;
        }
        long long v16 = v15;
        if (!sub_1BFBD4C58())
        {
          uint64_t result = swift_bridgeObjectRelease();
          char v11 = 3;
          goto LABEL_9;
        }
        long long v16 = v15;
        uint64_t v14 = sub_1BFBD4C58();
        uint64_t result = swift_bridgeObjectRelease();
        if (!v14)
        {
          char v11 = 4;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_8:
  char v11 = 0;
LABEL_9:
  *a1 = v11;
  return result;
}

uint64_t AMSMarketingItem.value(for:offerDictKey:key:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  id v13 = objc_msgSend(v6, sel_rawValues);
  sub_1BFAC957C();
  uint64_t v14 = sub_1BFBD4568();

  if (!*(void *)(v14 + 16)) {
    goto LABEL_46;
  }
  unint64_t v15 = sub_1BFA5C7C0(0x7475626972747461, 0xEA00000000007365);
  if ((v16 & 1) == 0) {
    goto LABEL_46;
  }
  uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&long long v44 = v17;
  sub_1BFBA4000();
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_47;
  }
  if (*(void *)(v43 + 16) && (unint64_t v19 = sub_1BFA5C7C0(0x73726566666FLL, 0xE600000000000000), (v20 & 1) != 0))
  {
    sub_1BFA5CA14(*(void *)(v43 + 56) + 32 * v19, (uint64_t)&v44);
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v45 + 1))
  {
    uint64_t result = sub_1BFA5BBF0((uint64_t)&v44);
    goto LABEL_47;
  }
  sub_1BFBA406C(0, (unint64_t *)&unk_1EBA83760, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB320]);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_47:
    *a6 = 0u;
    a6[1] = 0u;
    return result;
  }
  id v21 = objc_msgSend(a1, sel_buyParams);
  if (!v21) {
    goto LABEL_46;
  }
  unint64_t v22 = v21;
  uint64_t v41 = AMSBuyParams.purchaseID.getter();
  uint64_t v24 = v23;

  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v25 = *(void *)(v43 + 16);
  if (!v25)
  {
LABEL_45:
    swift_bridgeObjectRelease();
LABEL_46:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  uint64_t v39 = a4;
  uint64_t v40 = a5;
  uint64_t v26 = v43 + 32;
  while (1)
  {
    sub_1BFA5CA14(v26, (uint64_t)&v44);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_15;
    }
    if (!*(void *)(v43 + 16)) {
      goto LABEL_14;
    }
    unint64_t v27 = sub_1BFA5C7C0(0x6D61726150797562, 0xE900000000000073);
    if ((v28 & 1) == 0) {
      goto LABEL_14;
    }
    sub_1BFA5CA14(*(void *)(v43 + 56) + 32 * v27, (uint64_t)&v44);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_14;
    }
    id v42 = objc_allocWithZone(MEMORY[0x1E4F4DC00]);
    uint64_t v29 = (void *)sub_1BFBD45C8();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v42, sel_initWithString_, v29);

    uint64_t v31 = AMSBuyParams.purchaseID.getter();
    uint64_t v33 = v32;

    if (!v33)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    if (v31 == v41 && v33 == v24)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v34 = sub_1BFBD5048();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0) {
        goto LABEL_14;
      }
    }
    if (*(void *)(v43 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_1BFA5C7C0(a2, a3);
      if (v36)
      {
        sub_1BFA5CA14(*(void *)(v43 + 56) + 32 * v35, (uint64_t)&v44);
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v45 + 1)) {
      goto LABEL_42;
    }
    if (swift_dynamicCast()) {
      break;
    }
LABEL_15:
    v26 += 32;
    if (!--v25) {
      goto LABEL_45;
    }
  }
  if (*(void *)(v43 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v37 = sub_1BFA5C7C0(v39, v40);
    if (v38)
    {
      sub_1BFA5CA14(*(void *)(v43 + 56) + 32 * v37, (uint64_t)&v44);
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v45 + 1))
  {
LABEL_42:
    sub_1BFA5BBF0((uint64_t)&v44);
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)sub_1BFA71DAC(&v44, a6);
}

uint64_t sub_1BFBA3E80()
{
  id v1 = objc_msgSend(v0, sel_rawValues);
  sub_1BFAC957C();
  uint64_t v2 = sub_1BFBD4568();

  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_1BFA5C7C0(0x7475626972747461, 0xEA00000000007365), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(*(void *)(v2 + 56) + 8 * v3);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v9 = v5;
    sub_1BFBA4000();
    if (swift_dynamicCast())
    {
      if (*(void *)(v11 + 16) && (unint64_t v6 = sub_1BFA5C7C0(0x73726566666FLL, 0xE600000000000000), (v7 & 1) != 0))
      {
        sub_1BFA5CA14(*(void *)(v11 + 56) + 32 * v6, (uint64_t)&v9);
      }
      else
      {
        long long v9 = 0u;
        long long v10 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v10 + 1))
      {
        sub_1BFBA40B8();
        if (swift_dynamicCast()) {
          return v11;
        }
      }
      else
      {
        sub_1BFA5BBF0((uint64_t)&v9);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x1E4FBC860];
}

void sub_1BFBA4000()
{
  if (!qword_1EBA83730)
  {
    unint64_t v0 = sub_1BFBD4588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA83730);
    }
  }
}

void sub_1BFBA406C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1BFBA40B8()
{
  if (!qword_1EBA88610)
  {
    sub_1BFBA4000();
    unint64_t v0 = sub_1BFBD4898();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA88610);
    }
  }
}

uint64_t InvalidEmailAddressAlert.title.getter()
{
  return 0;
}

uint64_t InvalidEmailAddressAlert.message.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t InvalidEmailAddressAlert.preferredActionButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FAC7A0];
  uint64_t v3 = sub_1BFBD3438();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t InvalidEmailAddressAlert.acceptButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t InvalidEmailAddressAlert.rejectButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFBA43E0()
{
  return 0;
}

uint64_t sub_1BFBA43EC()
{
  return InvalidEmailAddressAlert.message.getter();
}

uint64_t sub_1BFBA4404()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFBA44CC()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

ValueMetadata *type metadata accessor for InvalidEmailAddressAlert()
{
  return &type metadata for InvalidEmailAddressAlert;
}

uint64_t AppleIDAuthenticationErrorAlert.title.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.message.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BFBD1C78();

  uint64_t v2 = sub_1BFBD4618();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.preferredActionButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FAC7A0];
  uint64_t v3 = sub_1BFBD3438();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t AppleIDAuthenticationErrorAlert.acceptButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.rejectButton.getter()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFBA4950()
{
  return AppleIDAuthenticationErrorAlert.title.getter();
}

uint64_t sub_1BFBA4968()
{
  return AppleIDAuthenticationErrorAlert.message.getter();
}

uint64_t sub_1BFBA4980()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

uint64_t sub_1BFBA4A48()
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_1BFBD1C78();

  return v2;
}

ValueMetadata *type metadata accessor for AppleIDAuthenticationErrorAlert()
{
  return &type metadata for AppleIDAuthenticationErrorAlert;
}

uint64_t ArticlePurchaseOffer.purchaseID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticlePurchaseOffer.purchaseType.getter()
{
  return *(void *)(v0 + 16);
}

void *sub_1BFBA4B54(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ArticlePurchaseOffer(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for ArticlePurchaseOffer(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for ArticlePurchaseOffer()
{
  return &type metadata for ArticlePurchaseOffer;
}

uint64_t dispatch thunk of ArticlePurchaseOffersProviderType.purchaseOffers(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

unint64_t *sub_1BFBA4C48(void *a1)
{
  void (*v28)(void *__return_ptr, char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  int EnumCaseMultiPayload;
  uint64_t v39;
  void *v40;
  unint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  char v74;
  void v75[4];
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;

  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for OfferAction();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(*(id *)(v2 + 16), sel_configuration);
  if (!v8)
  {
    __break(1u);
    goto LABEL_57;
  }
  long long v9 = v8;
  if ((objc_msgSend(v8, sel_respondsToSelector_, sel_paidBundleConfig) & 1) == 0) {
    goto LABEL_10;
  }
  id v10 = objc_msgSend(v9, sel_paidBundleConfig);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(a1, sel_headline);
  if (!v11)
  {
LABEL_57:
    __break(1u);
    JUMPOUT(0x1BFBA5488);
  }
  unint64_t v12 = v11;
  if (objc_msgSend(v11, sel_respondsToSelector_, sel_role))
  {
    id v13 = objc_msgSend(v12, sel_role);
    swift_unknownObjectRelease();
    if (v13 == (id)2)
    {
      uint64_t v14 = v10;
      uint64_t v15 = 3;
    }
    else
    {
      if (v13 != (id)3)
      {
LABEL_23:

        return 0;
      }
      uint64_t v14 = v10;
      uint64_t v15 = 2;
    }
    uint64_t v73 = (id)v15;
    uint64_t v18 = *(void *)(v2 + 32);
    uint64_t ObjectType = swift_getObjectType();
    LOBYTE(v75[0]) = 6;
    char v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 24);
    swift_unknownObjectRetain();
    LOBYTE(v18) = v20(v75, ObjectType, v18);
    swift_unknownObjectRelease();
    id v10 = v14;
    if (v18) {
      id v21 = objc_msgSend(v14, sel_servicesBundleSubscriptionButtonConfigurationsByType);
    }
    else {
      id v21 = objc_msgSend(v14, sel_subscriptionButtonConfigurationsByType);
    }
    char v16 = (unint64_t *)v21;
    if (!v16)
    {

      return v16;
    }
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850A0);
    sub_1BFA4DF3C(0, &qword_1EBA82A38);
    sub_1BFAC697C();
    uint64_t v22 = sub_1BFBD4568();

    id v23 = objc_allocWithZone(MEMORY[0x1E4F28ED0]);
    id v24 = objc_msgSend(v23, sel_initWithUnsignedInteger_, v73);
    uint64_t v25 = sub_1BFACEE0C(v24, v22);

    swift_bridgeObjectRelease();
    if (v25)
    {
      switch((unint64_t)objc_msgSend(v25, sel_targetType))
      {
        case 0uLL:
          sub_1BFBD49F8();
          sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
          uint64_t v40 = (void *)sub_1BFBD4BD8();
          sub_1BFBD2D88();

          return 0;
        case 1uLL:
        case 3uLL:
          uint64_t v72 = v25;
          uint64_t v73 = v14;
          uint64_t v26 = *(void *)(v2 + 32);
          uint64_t v27 = swift_getObjectType();
          uint64_t v74 = 6;
          char v28 = *(void (**)(void *__return_ptr, char *, uint64_t, uint64_t))(v26 + 32);
          swift_unknownObjectRetain();
          v28(v75, &v74, v27, v26);
          swift_unknownObjectRelease();
          uint64_t v29 = v76;
          if (v76)
          {
            id v69 = v75[1];
            unint64_t v70 = v75[0];
            uint64_t v67 = v75[3];
            int64_t v68 = v75[2];
            id v30 = v77;
            uint64_t v31 = v78;
            uint64_t v71 = v79;
            id v65 = v81;
            uint64_t v66 = v80;
            uint64_t v32 = *(void *)(v76 + 16);
            uint64_t v33 = v73;
            if (v32)
            {
              v62 = v78;
              uint64_t v63 = v77;
              char v34 = v76 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
              unint64_t v35 = *(void *)(v5 + 72);
              id v64 = v76;
              swift_bridgeObjectRetain();
              while (1)
              {
                sub_1BFA6EEFC(v34, (uint64_t)v7);
                int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
                if (EnumCaseMultiPayload)
                {
                  if (EnumCaseMultiPayload == 1)
                  {
                    sub_1BFA64830();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    uint64_t v39 = sub_1BFBD1DD8();
                    (*(void (**)(char *, uint64_t))(*(void *)(v39 - 8) + 8))(v7, v39);
                  }
                }
                else
                {
                  char v36 = (void *)*((void *)v7 + 2);
                  unint64_t v37 = v7[90];
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v37)
                  {
                    uint64_t v29 = v64;
                    swift_bridgeObjectRelease();
                    uint64_t v59 = AMSBuyParams.purchaseID.getter();
                    id v61 = v60;

                    if (v61)
                    {
                      sub_1BFBA5650();
                      char v16 = (unint64_t *)swift_allocObject();
                      *((_OWORD *)v16 + 1) = xmmword_1BFBD78F0;
                      v16[4] = v59;
                      v16[5] = v61;
                      v16[6] = 2;
                      sub_1BFA64760(v70, v69, v68, v67, v29, v63, v62, v71, v66, v65);

                      return v16;
                    }

LABEL_46:
                    id v30 = v63;
                    uint64_t v31 = v62;
LABEL_48:
                    sub_1BFA64760(v70, v69, v68, v67, v29, v30, v31, v71, v66, v65);
                    return 0;
                  }

                  uint64_t v33 = v73;
                }
                v34 += v35;
                if (!--v32)
                {

                  uint64_t v29 = v64;
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
              }
            }

            goto LABEL_48;
          }
          uint64_t v51 = v73;
          uint64_t v52 = objc_msgSend(v73, sel_offeredBundlePurchaseIDs);
          uint64_t v53 = v72;
          if (v52)
          {
            int64_t v54 = v52;
            uint64_t v55 = (void *)sub_1BFBD4828();

            if (v55[2])
            {
              v56 = v51;
              unsigned int v57 = v55[4];
              uint64_t v58 = v55[5];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              sub_1BFBA5650();
              char v16 = (unint64_t *)swift_allocObject();
              *((_OWORD *)v16 + 1) = xmmword_1BFBD78F0;
              v16[4] = v57;
              v16[5] = v58;
              v16[6] = 1;

              return v16;
            }

            swift_bridgeObjectRelease();
          }
          else
          {
          }
          break;
        case 2uLL:
          char v16 = (unint64_t *)objc_msgSend(v14, sel_offeredBundlePurchaseIDs);
          if (v16)
          {
            uint64_t v41 = (unint64_t *)sub_1BFBD4828();

            id v42 = sub_1BFBA5498(v2);
            uint64_t v43 = v41[2];
            if (v43)
            {
              long long v44 = v42;
              uint64_t v72 = v25;
              swift_bridgeObjectRetain();
              uint64_t v73 = v41;
              long long v45 = v41 + 5;
              char v16 = (unint64_t *)MEMORY[0x1E4FBC860];
              do
              {
                uint64_t v47 = *(v45 - 1);
                uint64_t v46 = *v45;
                swift_bridgeObjectRetain();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  char v16 = sub_1BFA5C678(0, v16[2] + 1, 1, v16);
                }
                unint64_t v49 = v16[2];
                long long v48 = v16[3];
                if (v49 >= v48 >> 1) {
                  char v16 = sub_1BFA5C678((void *)(v48 > 1), v49 + 1, 1, v16);
                }
                v45 += 2;
                v16[2] = v49 + 1;
                unsigned int v50 = &v16[3 * v49];
                v50[4] = v47;
                v50[5] = v46;
                v50[6] = v44;
                --v43;
              }
              while (v43);

              swift_bridgeObjectRelease_n();
            }
            else
            {
              swift_bridgeObjectRelease();

              return (unint64_t *)MEMORY[0x1E4FBC860];
            }
          }
          else
          {
          }
          return v16;
        default:

          return 0;
      }
      return 0;
    }
    goto LABEL_23;
  }

LABEL_10:
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_1BFBA5498(uint64_t a1)
{
  void (*v3)(uint64_t *__return_ptr, char *, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  Swift::Bool v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = 4;
  uint64_t v3 = *(void (**)(uint64_t *__return_ptr, char *, uint64_t, uint64_t))(v1 + 40);
  swift_unknownObjectRetain();
  v3(&v18, &v17, ObjectType, v1);
  swift_unknownObjectRelease();
  uint64_t v4 = v22;
  if (v22)
  {
    uint64_t v5 = v18;
    uint64_t v6 = v19;
    char v7 = v20;
    id v8 = v21;
    long long v9 = v23;
    id v10 = v25;
    id v11 = v26;
    unint64_t v12 = v27;
    if (v23)
    {
      sub_1BFA64760(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      char v16 = v24;
      swift_bridgeObjectRetain();
      id v13 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v15 = AMSMarketingItem.isBundleHardwareOffer()();
      sub_1BFA64760(v5, v6, v7, v8, v4, v9, v16, v10, v11, v12);
      sub_1BFA64760(v5, v6, v7, v8, v4, v9, v16, v10, v11, v12);
      if (v15) {
        return 4;
      }
    }
  }
  return 1;
}

uint64_t type metadata accessor for ArticlePurchaseOffersProvider()
{
  return self;
}

unint64_t *sub_1BFBA562C(void *a1)
{
  return sub_1BFBA4C48(a1);
}

void sub_1BFBA5650()
{
  if (!qword_1EBA82A50)
  {
    unint64_t v0 = sub_1BFBD5018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA82A50);
    }
  }
}

id sub_1BFBA56A8()
{
  void (*v15)(void *__return_ptr, uint64_t, uint64_t);
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void v29[6];

  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
  objc_msgSend(v1, sel_setAlignment_, 1);
  objc_msgSend(v1, sel_setLineBreakMode_, 0);
  objc_msgSend(v1, sel_setMaximumLineHeight_, 19.0);
  objc_msgSend(v1, sel_setMinimumLineHeight_, 19.0);
  sub_1BFA6DF5C();
  uint64_t inited = swift_initStackObject();
  uint64_t v3 = (void **)MEMORY[0x1E4FB06F8];
  *(_OWORD *)(inited + 16) = xmmword_1BFBD9C70;
  uint64_t v4 = *v3;
  *(void *)(inited + 32) = *v3;
  uint64_t v5 = self;
  double v6 = *MEMORY[0x1E4FB09D8];
  swift_bridgeObjectRetain();
  id v7 = v4;
  id v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_, 15.0, v6);
  uint64_t v9 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  *(void *)(inited + 40) = v8;
  id v10 = (void *)*MEMORY[0x1E4FB0738];
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = v10;
  uint64_t v11 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BC0);
  *(void *)(inited + 80) = v1;
  unint64_t v12 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 112) = v12;
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v13);
  uint64_t v15 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v14 + 24);
  char v16 = v10;
  uint64_t v17 = v1;
  uint64_t v18 = v12;
  v15(v29, v13, v14);
  unint64_t v19 = (void *)v29[0];
  char v20 = v29[1];
  id v21 = (void *)v29[2];
  uint64_t v22 = (void *)v29[3];
  id v23 = (void *)v29[4];

  *(void *)(inited + 144) = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 120) = v20;
  sub_1BFAF8D10(inited);
  id v24 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v25 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  uint64_t v26 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  uint64_t v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  return v27;
}

void sub_1BFBA5954(void *a1)
{
  id v3 = objc_msgSend(a1, sel_titleLabel);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_setTextAlignment_, 1);
  }
  id v5 = objc_msgSend(a1, sel_titleLabel);
  if (v5)
  {
    double v6 = v5;
    objc_msgSend(v5, sel_setNumberOfLines_, 2);
  }
  id v7 = objc_msgSend(a1, sel_titleLabel);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 1);
  }
  id v9 = objc_msgSend(a1, sel_titleLabel);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(self, sel_labelFontSize);
    objc_msgSend(v10, sel_setMinimumScaleFactor_, 10.0 / v11);
  }
  uint64_t v12 = v1[5];
  uint64_t v13 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v12);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 24))(v19, v12, v13);
  uint64_t v14 = (void *)v19[0];
  uint64_t v15 = (void *)v19[1];
  char v16 = (void *)v19[2];
  id v18 = (id)v19[3];
  uint64_t v17 = (void *)v19[4];

  objc_msgSend(a1, sel_setBackgroundColor_, v18);
}

id sub_1BFBA5AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v11)(void **__return_ptr, uint64_t, uint64_t);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void **__return_ptr, uint64_t, uint64_t);
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void **v51;
  void *v52;
  void *v53;
  double v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(void **__return_ptr, uint64_t, uint64_t);
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;

  id v5 = v4;
  if (a4)
  {
    sub_1BFA6DF5C();
    uint64_t inited = swift_initStackObject();
    id v7 = (void **)MEMORY[0x1E4FB0700];
    *(_OWORD *)(inited + 16) = xmmword_1BFBD7990;
    id v8 = *v7;
    *(void *)(inited + 32) = *v7;
    uint64_t v74 = v4 + 2;
    uint64_t v9 = v4[5];
    uint64_t v10 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v9);
    double v11 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v72 = v8;
    v11(&v75, v9, v10);
    uint64_t v12 = v75;
    uint64_t v13 = v76;
    uint64_t v14 = v77;
    uint64_t v15 = v78;
    char v16 = v79;
    uint64_t v17 = v80;
    id v18 = v81;

    uint64_t v73 = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
    *(void *)(inited + 40) = v18;
    unint64_t v19 = (void *)*MEMORY[0x1E4FB06F8];
    *(void *)(inited + 64) = v73;
    *(void *)(inited + 72) = v19;
    char v20 = self;
    id v21 = *MEMORY[0x1E4FB09B8];
    uint64_t v22 = v19;
    id v23 = objc_msgSend(v20, sel_systemFontOfSize_weight_, 13.0, v21);
    id v24 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
    *(void *)(inited + 104) = v24;
    *(void *)(inited + 80) = v23;
    sub_1BFAF8D10(inited);
    uint64_t v25 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    uint64_t v26 = (void *)sub_1BFBD45C8();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1BFA6E020();
    uint64_t v27 = (void *)sub_1BFBD4558();
    swift_bridgeObjectRelease();
    char v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

    uint64_t v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_1BFBD7990;
    *(void *)(v29 + 32) = v22;
    id v30 = v22;
    *(void *)(v29 + 40) = objc_msgSend(v20, sel_systemFontOfSize_, 11.0);
    *(void *)(v29 + 64) = v24;
    *(void *)(v29 + 72) = v72;
    uint64_t v32 = v5[5];
    uint64_t v31 = v5[6];
    __swift_project_boxed_opaque_existential_1(v74, v32);
    uint64_t v33 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v31 + 16);
    char v34 = v72;
    v33(&v75, v32, v31);
    unint64_t v35 = v75;
    char v36 = v76;
    unint64_t v37 = v77;
    char v38 = v78;
    uint64_t v39 = v79;
    uint64_t v40 = v80;
    uint64_t v41 = v81;

    *(void *)(v29 + 104) = v73;
    *(void *)(v29 + 80) = v41;
    sub_1BFAF8D10(v29);
    id v42 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    uint64_t v43 = (void *)sub_1BFBD45C8();
    swift_bridgeObjectRelease();
    long long v44 = (void *)sub_1BFBD4558();
    swift_bridgeObjectRelease();
    long long v45 = objc_msgSend(v42, sel_initWithString_attributes_, v43, v44);

    uint64_t v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, v28);
    uint64_t v47 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    long long v48 = (void *)sub_1BFBD45C8();
    unint64_t v49 = objc_msgSend(v47, sel_initWithString_, v48);

    objc_msgSend(v46, sel_appendAttributedString_, v49);
    objc_msgSend(v46, sel_appendAttributedString_, v45);
  }
  else
  {
    sub_1BFA6DF5C();
    unsigned int v50 = swift_initStackObject();
    uint64_t v51 = (void **)MEMORY[0x1E4FB06F8];
    *(_OWORD *)(v50 + 16) = xmmword_1BFBD7990;
    uint64_t v52 = *v51;
    *(void *)(v50 + 32) = *v51;
    uint64_t v53 = self;
    int64_t v54 = *MEMORY[0x1E4FB09B8];
    swift_bridgeObjectRetain();
    uint64_t v55 = v52;
    v56 = objc_msgSend(v53, sel_systemFontOfSize_weight_, 13.0, v54);
    unsigned int v57 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
    *(void *)(v50 + 40) = v56;
    uint64_t v58 = (void *)*MEMORY[0x1E4FB0700];
    *(void *)(v50 + 64) = v57;
    *(void *)(v50 + 72) = v58;
    uint64_t v60 = v4[5];
    uint64_t v59 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v60);
    id v61 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v59 + 16);
    v62 = v58;
    v61(&v75, v60, v59);
    uint64_t v63 = v75;
    id v64 = v76;
    id v65 = v77;
    uint64_t v66 = v78;
    uint64_t v67 = v79;
    int64_t v68 = v80;
    id v69 = v81;

    *(void *)(v50 + 104) = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
    *(void *)(v50 + 80) = v69;
    sub_1BFAF8D10(v50);
    unint64_t v70 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
    long long v45 = (id)sub_1BFBD45C8();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1BFA6E020();
    char v28 = (id)sub_1BFBD4558();
    swift_bridgeObjectRelease();
    uint64_t v46 = objc_msgSend(v70, sel_initWithString_attributes_, v45, v28);
  }

  return v46;
}

uint64_t sub_1BFBA60B4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SubscriptionOffersStyler()
{
  return self;
}

ValueMetadata *type metadata accessor for BundlePaywallTopOffsetConfiguration()
{
  return &type metadata for BundlePaywallTopOffsetConfiguration;
}

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

id Assembly.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Assembly.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___NPAssembly_assemblies;
  sub_1BFBA65DC();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BFBE3DE0;
  uint64_t v4 = type metadata accessor for DatabaseAssembly();
  uint64_t v5 = swift_allocObject();
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = sub_1BFBA668C(&qword_1EBA89648, (void (*)(uint64_t))type metadata accessor for DatabaseAssembly);
  *(void *)(v3 + 32) = v5;
  uint64_t v6 = type metadata accessor for DiagnosticAssembly();
  uint64_t v7 = swift_allocObject();
  *(void *)(v3 + 96) = v6;
  *(void *)(v3 + 104) = sub_1BFBA668C(&qword_1EBA88818, (void (*)(uint64_t))type metadata accessor for DiagnosticAssembly);
  *(void *)(v3 + 72) = v7;
  uint64_t v8 = type metadata accessor for ManagerAssembly();
  uint64_t v9 = swift_allocObject();
  *(void *)(v3 + 136) = v8;
  *(void *)(v3 + 144) = sub_1BFBA668C(&qword_1EBA895B8, (void (*)(uint64_t))type metadata accessor for ManagerAssembly);
  *(void *)(v3 + 112) = v9;
  uint64_t v10 = type metadata accessor for FactoryAssembly();
  uint64_t v11 = swift_allocObject();
  *(void *)(v3 + 176) = v10;
  *(void *)(v3 + 184) = sub_1BFBA668C(&qword_1EBA89588, (void (*)(uint64_t))type metadata accessor for FactoryAssembly);
  *(void *)(v3 + 152) = v11;
  uint64_t v12 = type metadata accessor for UtilityAssembly();
  uint64_t v13 = swift_allocObject();
  *(void *)(v3 + 216) = v12;
  *(void *)(v3 + 224) = sub_1BFBA668C(&qword_1EBA89618, (void (*)(uint64_t))type metadata accessor for UtilityAssembly);
  *(void *)(v3 + 192) = v13;
  uint64_t v14 = type metadata accessor for StylerAssembly();
  uint64_t v15 = swift_allocObject();
  *(void *)(v3 + 256) = v14;
  *(void *)(v3 + 264) = sub_1BFBA668C(&qword_1EBA89558, (void (*)(uint64_t))type metadata accessor for StylerAssembly);
  *(void *)(v3 + 232) = v15;
  uint64_t v16 = type metadata accessor for RendererAssembly();
  uint64_t v17 = swift_allocObject();
  *(void *)(v3 + 296) = v16;
  *(void *)(v3 + 304) = sub_1BFBA668C(&qword_1EBA89680, (void (*)(uint64_t))type metadata accessor for RendererAssembly);
  *(void *)(v3 + 272) = v17;
  uint64_t v18 = type metadata accessor for PaywallAssembly();
  uint64_t v19 = swift_allocObject();
  *(void *)(v3 + 336) = v18;
  *(void *)(v3 + 344) = sub_1BFBA668C(&qword_1EBA895E8, (void (*)(uint64_t))type metadata accessor for PaywallAssembly);
  *(void *)(v3 + 312) = v19;
  uint64_t v20 = type metadata accessor for PurchasingSpinnerAssembly();
  uint64_t v21 = swift_allocObject();
  *(void *)(v3 + 376) = v20;
  *(void *)(v3 + 384) = sub_1BFBA668C(&qword_1EBA896E8, (void (*)(uint64_t))type metadata accessor for PurchasingSpinnerAssembly);
  *(void *)(v3 + 352) = v21;
  uint64_t v22 = type metadata accessor for SubscriptionOffersAssembly();
  uint64_t v23 = swift_allocObject();
  *(void *)(v3 + 416) = v22;
  *(void *)(v3 + 424) = sub_1BFBA668C((unint64_t *)&unk_1EBA89520, (void (*)(uint64_t))type metadata accessor for SubscriptionOffersAssembly);
  *(void *)(v3 + 392) = v23;
  uint64_t v24 = type metadata accessor for HideMyEmailSignupAssembly();
  uint64_t v25 = swift_allocObject();
  *(void *)(v3 + 456) = v24;
  *(void *)(v3 + 464) = sub_1BFBA668C((unint64_t *)&unk_1EBA896B0, (void (*)(uint64_t))type metadata accessor for HideMyEmailSignupAssembly);
  *(void *)(v3 + 432) = v25;
  *(void *)&v0[v2] = v3;
  v27.receiver = v0;
  v27.super_class = ObjectType;
  return objc_msgSendSuper2(&v27, sel_init);
}

void sub_1BFBA65DC()
{
  if (!qword_1EBA89778)
  {
    sub_1BFBA6634();
    unint64_t v0 = sub_1BFBD5018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA89778);
    }
  }
}

unint64_t sub_1BFBA6634()
{
  unint64_t result = qword_1EBA89500;
  if (!qword_1EBA89500)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA89500);
  }
  return result;
}

uint64_t sub_1BFBA668C(unint64_t *a1, void (*a2)(uint64_t))
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

id Assembly.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BFBA6740()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Assembly()
{
  return self;
}

uint64_t sub_1BFBA6778(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1BFAC0EAC();
  sub_1BFBD34A8();
  sub_1BFAC10B4((uint64_t)v19, (uint64_t)&v23);
  sub_1BFB5D308();
  sub_1BFBD31B8();
  sub_1BFAC10B4((uint64_t)&v23, (uint64_t)v24);
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  void v20[3] = v12;
  v20[4] = v13;
  v20[5] = v14;
  v20[6] = v15;
  v20[7] = v16;
  v20[8] = v17;
  char v21 = v18;
  sub_1BFBA7100();
  uint64_t v3 = sub_1BFBD4988();
  __swift_project_boxed_opaque_existential_1((void *)(v8 + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer), *(void *)(v8+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer+ 24));
  uint64_t v4 = (char *)sub_1BFBD2F48();
  v22[4] = v24[4];
  v22[5] = v24[5];
  v22[6] = v24[6];
  v22[7] = v24[7];
  v22[0] = v24[0];
  v22[1] = v24[1];
  void v22[2] = v24[2];
  v22[3] = v24[3];
  id v5 = objc_msgSend(a3, sel_traitCollection);
  sub_1BFBCE9D4((int)v20, v4, (double *)v22);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1BFBA6940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v25[1] = a3;
  uint64_t v3 = sub_1BFBD30D8();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v29 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFAC0EAC();
  sub_1BFBD34A8();
  sub_1BFAC10B4((uint64_t)&v42, (uint64_t)v46);
  sub_1BFB5D308();
  sub_1BFBD31B8();
  uint64_t v5 = v33;
  v25[0] = v32;
  uint64_t v7 = v34;
  uint64_t v6 = v35;
  uint64_t v27 = v35;
  uint64_t v28 = v33;
  uint64_t v8 = v36;
  uint64_t v9 = v37;
  uint64_t v10 = v38;
  uint64_t v11 = v39;
  uint64_t v12 = v40;
  char v13 = v41;
  sub_1BFAC10B4((uint64_t)v46, (uint64_t)v47);
  v43[0] = v25[0];
  v43[1] = v5;
  v43[2] = v7;
  v43[3] = v6;
  v43[4] = v8;
  v43[5] = v9;
  v43[6] = v10;
  v43[7] = v11;
  v43[8] = v12;
  char v44 = v13;
  sub_1BFBA702C();
  uint64_t v14 = sub_1BFBD4988();
  uint64_t v15 = v26;
  __swift_project_boxed_opaque_existential_1(&v26[OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer], *(void *)&v26[OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer+ 24]);
  uint64_t v16 = (char *)sub_1BFBD2F48();
  v45[0] = v47[8];
  v45[1] = v47[9];
  v45[2] = v47[10];
  v45[3] = v47[11];
  v45[4] = v47[12];
  v45[5] = v47[13];
  sub_1BFAFAA3C((uint64_t)v43, v16, (double *)v45);

  uint64_t v17 = (char *)sub_1BFBD2F48();
  id v18 = *(id *)&v17[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button];

  uint64_t v19 = (void *)sub_1BFBD2FD8();
  *(void *)(swift_allocObject() + 16) = v15;
  id v20 = v15;

  swift_release();
  char v21 = (char *)sub_1BFBD2F48();
  id v22 = *(id *)&v21[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel];

  objc_msgSend(v22, sel_setDelegate_, v20);
  char v23 = (void *)sub_1BFBD2F58();
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x1E4FABE70], v31);
  sub_1BFBD30E8();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

uint64_t sub_1BFBA6C60(uint64_t a1)
{
  uint64_t result = MEMORY[0x1C18BCCA0](a1 + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate);
  if (result)
  {
    uint64_t v2 = *(void *)(*(void *)(result
                               + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                   + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 72))(ObjectType, v2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintViewHeaderFooterProvider()
{
  return self;
}

uint64_t sub_1BFBA6DA0()
{
  return sub_1BFBD49A8();
}

uint64_t sub_1BFBA6DF0(uint64_t a1, uint64_t a2, void **a3)
{
  return sub_1BFBA6778(a1, a2, *a3);
}

uint64_t sub_1BFBA6E18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1BFBA6940(a1, a2, *a3);
}

void sub_1BFBA702C()
{
  if (!qword_1EA186E40)
  {
    type metadata accessor for HideMyEmailSignupBlueprintFooterView();
    sub_1BFBA7194(&qword_1EA186E48, (void (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintFooterView);
    unint64_t v0 = sub_1BFBD2F68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186E40);
    }
  }
}

uint64_t sub_1BFBA70C0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBA70F8()
{
  return sub_1BFBA6C60(*(void *)(v0 + 16));
}

void sub_1BFBA7100()
{
  if (!qword_1EA186E50)
  {
    type metadata accessor for HideMyEmailSignupBlueprintHeaderView();
    sub_1BFBA7194(&qword_1EA184B10, (void (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintHeaderView);
    unint64_t v0 = sub_1BFBD2F68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186E50);
    }
  }
}

uint64_t sub_1BFBA7194(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1BFBA71DC()
{
  unint64_t result = qword_1EBA856B0;
  if (!qword_1EBA856B0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA856B0);
  }
  return result;
}

NewsSubscription::PaywallContentType_optional __swiftcall PaywallContentType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BFBD4ED8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t PaywallContentType.rawValue.getter()
{
  uint64_t v1 = 0x6F69647561;
  if (*v0 != 1) {
    uint64_t v1 = 0x657061707377656ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746C7561666564;
  }
}

uint64_t sub_1BFBA72EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BFA5B040(*a1, *a2);
}

uint64_t sub_1BFBA72F8()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFBA739C()
{
  sub_1BFBD4698();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFBA742C()
{
  return sub_1BFBD5128();
}

NewsSubscription::PaywallContentType_optional sub_1BFBA74CC(Swift::String *a1)
{
  return PaywallContentType.init(rawValue:)(*a1);
}

void sub_1BFBA74D8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE500000000000000;
  uint64_t v5 = 0x6F69647561;
  if (v2 != 1)
  {
    uint64_t v5 = 0x657061707377656ELL;
    unint64_t v4 = 0xE900000000000072;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x746C7561666564;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BFBA7538()
{
  return sub_1BFBD47D8();
}

uint64_t sub_1BFBA7598()
{
  return sub_1BFBD47B8();
}

uint64_t PaywallContentType.description.getter()
{
  uint64_t v1 = 0x6F69647541;
  if (*v0 != 1) {
    uint64_t v1 = 0x657061707377654ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746C7561666544;
  }
}

unint64_t sub_1BFBA7648()
{
  unint64_t result = qword_1EA186E58;
  if (!qword_1EA186E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186E58);
  }
  return result;
}

uint64_t sub_1BFBA769C()
{
  uint64_t v1 = 0x6F69647541;
  if (*v0 != 1) {
    uint64_t v1 = 0x657061707377654ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746C7561666544;
  }
}

unsigned char *storeEnumTagSinglePayload for PaywallContentType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBA77C4);
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

ValueMetadata *type metadata accessor for PaywallContentType()
{
  return &type metadata for PaywallContentType;
}

unint64_t sub_1BFBA77FC()
{
  unint64_t result = qword_1EBA82618;
  if (!qword_1EBA82618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA82618);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleAccess(unsigned __int8 *a1, unsigned int a2)
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
        JUMPOUT(0x1BFBA790CLL);
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
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
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

unsigned char *storeEnumTagSinglePayload for ArticleAccess(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1BFBA79F4);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1BFBA7A1C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_1BFBA7A38(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleAccess()
{
  return &type metadata for ArticleAccess;
}

uint64_t PaidBundleViaOfferSettings.allowPaywalls.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowPaywalls);
}

uint64_t PaidBundleViaOfferSettings.allowSubscriptionsDeeplink.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowSubscriptionsDeeplink);
}

uint64_t PaidBundleViaOfferSettings.allowMastheadBanner.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowMastheadBanner);
}

uint64_t PaidBundleViaOfferSettings.allowIconBadge.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadge);
}

uint64_t PaidBundleViaOfferSettings.allowIconBadgeMercury.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadgeMercury);
}

uint64_t PaidBundleViaOfferSettings.allowLocalNotification.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowLocalNotification);
}

uint64_t PaidBundleViaOfferSettings.allowUpsell.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowUpsell);
}

uint64_t PaidBundleViaOfferSettings.allowAppLaunchUpsell.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowAppLaunchUpsell);
}

id PaidBundleViaOfferSettings.__allocating_init(allowPaywalls:allowSubscriptionsDeeplink:allowMastheadBanner:allowIconBadge:allowIconBadgeMercury:allowLocalNotification:allowUpsell:allowAppLaunchUpsell:)(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  uint64_t v17 = objc_allocWithZone(v8);
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowPaywalls] = a1;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowSubscriptionsDeeplink] = a2;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowMastheadBanner] = a3;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadge] = a4;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadgeMercury] = a5;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowLocalNotification] = a6;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowUpsell] = a7;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowAppLaunchUpsell] = a8;
  v19.receiver = v17;
  v19.super_class = v8;
  return objc_msgSendSuper2(&v19, sel_init);
}

id PaidBundleViaOfferSettings.init(allowPaywalls:allowSubscriptionsDeeplink:allowMastheadBanner:allowIconBadge:allowIconBadgeMercury:allowLocalNotification:allowUpsell:allowAppLaunchUpsell:)(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowPaywalls] = a1;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowSubscriptionsDeeplink] = a2;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowMastheadBanner] = a3;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadge] = a4;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadgeMercury] = a5;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowLocalNotification] = a6;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowUpsell] = a7;
  v8[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowAppLaunchUpsell] = a8;
  v19.receiver = v8;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

id PaidBundleViaOfferSettings.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PaidBundleViaOfferSettings.init()()
{
}

id PaidBundleViaOfferSettings.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PaidBundleViaOfferSettings()
{
  return self;
}

uint64_t method lookup function for PaidBundleViaOfferSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PaidBundleViaOfferSettings);
}

uint64_t dispatch thunk of PaidBundleViaOfferSettings.__allocating_init(allowPaywalls:allowSubscriptionsDeeplink:allowMastheadBanner:allowIconBadge:allowIconBadgeMercury:allowLocalNotification:allowUpsell:allowAppLaunchUpsell:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1BFBA7DBC()
{
  sub_1BFA51A44(v0 + 16);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HideMyEmailSignupEventHandler()
{
  return self;
}

BOOL AppLaunchMethod.isDirect.getter()
{
  uint64_t v1 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v1 - 8);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC93C(v0, (uint64_t)v3, type metadata accessor for AppLaunchMethod);
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  int v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4);
  if (v5 != 1) {
    sub_1BFBAA79C((uint64_t)v3, type metadata accessor for AppLaunchMethod);
  }
  return v5 == 1;
}

uint64_t AppLaunchMethod.isWidget.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v6 - 8);
  BOOL v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC93C(v1, (uint64_t)v8, type metadata accessor for AppLaunchMethod);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
    return 0;
  }
  sub_1BFBAA738((uint64_t)v8, (uint64_t)v5);
  uint64_t v9 = sub_1BFBD1DD8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v5, 2, v9)) {
    return 0;
  }
  sub_1BFBAA79C((uint64_t)v5, type metadata accessor for AppLaunchMethod.IndirectMethod);
  return 1;
}

uint64_t AppLaunchMethod.isNotification.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v6 - 8);
  BOOL v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC93C(v1, (uint64_t)v8, type metadata accessor for AppLaunchMethod);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
  {
    sub_1BFBAA738((uint64_t)v8, (uint64_t)v5);
    uint64_t v9 = sub_1BFBD1DD8();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v5, 2, v9);
    if (result)
    {
      if (result == 1) {
        return result;
      }
    }
    else
    {
      sub_1BFBAA79C((uint64_t)v5, type metadata accessor for AppLaunchMethod.IndirectMethod);
    }
  }
  return 0;
}

uint64_t sub_1BFBA8284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_1BFBAA888(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v32 - v5;
  id v7 = objc_msgSend(v2, sel_userActivities);
  sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA88620);
  sub_1BFB111B4(&qword_1EBA88630, (unint64_t *)&unk_1EBA88620);
  uint64_t v8 = sub_1BFBD48F8();

  uint64_t v9 = (void *)sub_1BFA8288C(v8);
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_8:
    id v17 = objc_msgSend(v2, sel_URLContexts);
    sub_1BFA4DF3C(0, &qword_1EBA88638);
    sub_1BFB111B4(&qword_1EBA88640, &qword_1EBA88638);
    uint64_t v18 = sub_1BFBD48F8();

    objc_super v19 = (void *)sub_1BFA828A0(v18);
    swift_bridgeObjectRelease();
    if (v19)
    {
      id v20 = objc_msgSend(v19, sel_URL);
      sub_1BFBD1D98();

      uint64_t v21 = sub_1BFBD1DD8();
      id v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
      uint64_t v23 = v21;
      uint64_t v24 = a1;
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v29 = sub_1BFBD1DD8();
      id v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
      uint64_t v23 = v29;
      uint64_t v24 = a1;
      uint64_t v25 = 1;
    }
    return v22(v24, v25, 1, v23);
  }
  id v10 = objc_msgSend(v9, sel_activityType);
  uint64_t v11 = sub_1BFBD45F8();
  uint64_t v13 = v12;

  if (v11 == sub_1BFBD45F8() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {

      goto LABEL_8;
    }
  }
  id v26 = objc_msgSend(v9, sel_webpageURL);
  if (v26)
  {
    uint64_t v27 = v26;
    sub_1BFBD1D98();

    uint64_t v28 = sub_1BFBD1DD8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 0, 1, v28);
  }
  else
  {

    uint64_t v31 = sub_1BFBD1DD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v6, 1, 1, v31);
  }
  return sub_1BFAC64FC((uint64_t)v6, a1);
}

uint64_t sub_1BFBA8644@<X0>(uint64_t a1@<X8>)
{
  return sub_1BFBA8284(a1);
}

uint64_t AppLaunchMethodChecker.appActivationURLHandler.getter()
{
  return swift_retain();
}

uint64_t AppLaunchMethodChecker.launchMethod.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  swift_beginAccess();
  return sub_1BFBAC93C(v3, a1, type metadata accessor for AppLaunchMethod);
}

uint64_t AppLaunchMethodChecker.__allocating_init(appActivationURLHandler:notificationLaunchStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  AppLaunchMethodChecker.init(appActivationURLHandler:notificationLaunchStatusProvider:)(a1, a2, a3);
  return v6;
}

uint64_t AppLaunchMethodChecker.init(appActivationURLHandler:notificationLaunchStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = v4 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  uint64_t v9 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(void *)(v4 + 16) = a1;
  id v10 = (void *)(v4 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_notificationLaunchStatusProvider);
  *id v10 = a2;
  v10[1] = a3;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  uint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = sub_1BFBAA834;
  *(void *)(a1 + 24) = v11;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1BFA9C2FC(v12);
  uint64_t v13 = *(void *)(v4 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_notificationLaunchStatusProvider);
  if (v13)
  {
    uint64_t v14 = *(void *)(v4
                    + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_notificationLaunchStatusProvider
                    + 8);
    uint64_t ObjectType = swift_getObjectType();
    char v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    swift_unknownObjectRetain();
    v16(ObjectType, v14);
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v17;
    v18[3] = v13;
    v18[4] = v14;
    swift_unknownObjectRetain();
    sub_1BFBD25F8();
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  }
  else
  {
    swift_release();
    swift_unknownObjectRelease();
  }
  return v4;
}

uint64_t sub_1BFBA8954()
{
  uint64_t v0 = type metadata accessor for AppLaunchMethod(0);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v12 - v4;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
    swift_beginAccess();
    sub_1BFBAC93C(v7, (uint64_t)v5, type metadata accessor for AppLaunchMethod);
    uint64_t v8 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    v9(v3, 1, 1, v8);
    char v10 = _s16NewsSubscription15AppLaunchMethodO2eeoiySbAC_ACtFZ_0((uint64_t)v5, (uint64_t)v3);
    sub_1BFBAA79C((uint64_t)v3, type metadata accessor for AppLaunchMethod);
    sub_1BFBAA79C((uint64_t)v5, type metadata accessor for AppLaunchMethod);
    if (v10)
    {
      uint64_t v11 = sub_1BFBD1DD8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 2, 2, v11);
      v9(v5, 0, 1, v8);
      swift_beginAccess();
      sub_1BFBAA8EC((uint64_t)v5, v7);
      swift_endAccess();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1BFBA8B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    sub_1BFBAC808(a1, (uint64_t)&v21, (uint64_t)&unk_1EA186EB8, (uint64_t)&unk_1EA186EC0, (uint64_t)&protocol descriptor for NotificationActionIdentifierProviding, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1BFA89B44);
    if (v22)
    {
      sub_1BFA6ADEC(&v21, (uint64_t)v23);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(ObjectType, a4);
      uint64_t v13 = v24;
      uint64_t v14 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
      LOBYTE(v13) = sub_1BFA77DE8(v15, v16, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13)
      {
        uint64_t v17 = sub_1BFBD1DD8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 2, v17);
        uint64_t v18 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 0, 1, v18);
        uint64_t v19 = v10 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
        swift_beginAccess();
        sub_1BFBAA8EC((uint64_t)v8, v19);
        swift_endAccess();
      }
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    else
    {
      swift_release();
      return sub_1BFBAC87C((uint64_t)&v21, (uint64_t)&unk_1EA186EB8, (uint64_t)&unk_1EA186EC0, (uint64_t)&protocol descriptor for NotificationActionIdentifierProviding, (uint64_t (*)(void))sub_1BFA89B44);
    }
  }
  return result;
}

uint64_t AppLaunchMethodChecker.deinit()
{
  swift_release();
  sub_1BFBAA79C(v0 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod, type metadata accessor for AppLaunchMethod);
  swift_unknownObjectRelease();
  return v0;
}

uint64_t AppLaunchMethodChecker.__deallocating_deinit()
{
  swift_release();
  sub_1BFBAA79C(v0 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod, type metadata accessor for AppLaunchMethod);
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1BFBA8EC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  swift_beginAccess();
  return sub_1BFBAC93C(v3, a1, type metadata accessor for AppLaunchMethod);
}

uint64_t sub_1BFBA8F2C()
{
  return swift_retain();
}

uint64_t AppLaunchMethodChecker.patterns.getter()
{
  uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBBE00];
  sub_1BFBAA888(0, (unint64_t *)&qword_1EBA88690, MEMORY[0x1E4FAAC60], MEMORY[0x1E4FBBE00]);
  sub_1BFBD2888();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BFBD78F0;
  sub_1BFBAA888(0, &qword_1EBA82A40, MEMORY[0x1E4FAAC40], v0);
  uint64_t v2 = sub_1BFBD2858();
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BFBD78F0;
  uint64_t v6 = (uint64_t *)(v5 + v4);
  uint64_t *v6 = sub_1BFBD45F8();
  v6[1] = v7;
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FAAC38], v2);
  unint64_t v8 = sub_1BFBA9FDC(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C18B99B0](42, 0xE100000000000000, 0, 0, 0, 0, 0, 0, v5, v8);
  return v1;
}

uint64_t AppLaunchMethodChecker.processURL(for:)(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t v2 = sub_1BFBD26B8();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v36 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v32 = (uint64_t)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC8DC(0, (unint64_t *)&unk_1EBA88990, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod);
  uint64_t v8 = v7 - 8;
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for AppLaunchMethod(0);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v35 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v32 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)&v32 - v18;
  MEMORY[0x1F4188790](v17);
  long long v21 = (char *)&v32 - v20;
  uint64_t v22 = v1 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  swift_beginAccess();
  uint64_t v34 = v22;
  sub_1BFBAC93C(v22, (uint64_t)v21, type metadata accessor for AppLaunchMethod);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v33(v19, 1, 1, v4);
  uint64_t v23 = (uint64_t)&v10[*(int *)(v8 + 56)];
  sub_1BFBAC93C((uint64_t)v21, (uint64_t)v10, type metadata accessor for AppLaunchMethod);
  sub_1BFBAC93C((uint64_t)v19, v23, type metadata accessor for AppLaunchMethod);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v24((uint64_t)v10, 1, v4) == 1)
  {
    if (v24(v23, 1, v4) == 1) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_1BFBAC93C((uint64_t)v10, (uint64_t)v16, type metadata accessor for AppLaunchMethod);
  if (v24(v23, 1, v4) == 1)
  {
    sub_1BFBAA79C((uint64_t)v16, type metadata accessor for AppLaunchMethod.IndirectMethod);
LABEL_6:
    sub_1BFBAC9A4((uint64_t)v10, (unint64_t *)&unk_1EBA88990, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod);
    goto LABEL_10;
  }
  uint64_t v25 = v32;
  sub_1BFBAA738(v23, v32);
  char v26 = _s16NewsSubscription15AppLaunchMethodO08IndirectE0O2eeoiySbAE_AEtFZ_0((uint64_t)v16, v25);
  sub_1BFBAA79C(v25, type metadata accessor for AppLaunchMethod.IndirectMethod);
  sub_1BFBAA79C((uint64_t)v16, type metadata accessor for AppLaunchMethod.IndirectMethod);
  if (v26)
  {
LABEL_8:
    sub_1BFBAA79C((uint64_t)v10, type metadata accessor for AppLaunchMethod);
    sub_1BFBAA79C((uint64_t)v19, type metadata accessor for AppLaunchMethod);
    sub_1BFBAA79C((uint64_t)v21, type metadata accessor for AppLaunchMethod);
    sub_1BFBAA888(0, (unint64_t *)&qword_1EBA829E0, MEMORY[0x1E4FABD38], MEMORY[0x1E4FAAC10]);
    uint64_t v27 = v36;
    sub_1BFBD2808();
    uint64_t v28 = (uint64_t)v35;
    sub_1BFBD2678();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v39);
    uint64_t v29 = sub_1BFBD1DD8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 2, v29);
    v33((char *)v28, 0, 1, v4);
    uint64_t v30 = v34;
    swift_beginAccess();
    sub_1BFBAA8EC(v28, v30);
    return swift_endAccess();
  }
  sub_1BFBAA79C((uint64_t)v10, type metadata accessor for AppLaunchMethod);
LABEL_10:
  sub_1BFBAA79C((uint64_t)v19, type metadata accessor for AppLaunchMethod);
  return sub_1BFBAA79C((uint64_t)v21, type metadata accessor for AppLaunchMethod);
}

uint64_t sub_1BFBA96A4()
{
  uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBBE00];
  sub_1BFBAA888(0, (unint64_t *)&qword_1EBA88690, MEMORY[0x1E4FAAC60], MEMORY[0x1E4FBBE00]);
  sub_1BFBD2888();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BFBD78F0;
  sub_1BFBAA888(0, &qword_1EBA82A40, MEMORY[0x1E4FAAC40], v0);
  uint64_t v2 = sub_1BFBD2858();
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BFBD78F0;
  uint64_t v6 = (uint64_t *)(v5 + v4);
  uint64_t *v6 = sub_1BFBD45F8();
  v6[1] = v7;
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FAAC38], v2);
  unint64_t v8 = sub_1BFBA9FDC(MEMORY[0x1E4FBC860]);
  MEMORY[0x1C18B99B0](42, 0xE100000000000000, 0, 0, 0, 0, 0, 0, v5, v8);
  return v1;
}

uint64_t sub_1BFBA98B0(uint64_t a1)
{
  return AppLaunchMethodChecker.processURL(for:)(a1);
}

uint64_t AppLaunchMethodChecker.sceneWillConnectToSession(withOptions:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppLaunchMethod(0);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v32 - v6;
  sub_1BFBAA888(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_1BFBD1DD8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2968();
  sub_1BFA4E0BC(0, &qword_1EBA877E0);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v0;
    sub_1BFA6ADEC(v34, (uint64_t)v36);
    uint64_t v15 = v12;
    uint64_t v16 = v37;
    uint64_t v17 = v38;
    __swift_project_boxed_opaque_existential_1(v36, v37);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    uint64_t v19 = v17;
    uint64_t v12 = v15;
    v18(v16, v19);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v11) == 1)
    {
      sub_1BFBAC87C((uint64_t)v10, (uint64_t)&qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFBAA888);
    }
    else
    {
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v20(v14, v10, v11);
      uint64_t v21 = sub_1BFBD45F8();
      sub_1BFB1AD94(v21, v22);
      uint64_t v24 = v23;
      swift_bridgeObjectRelease();
      if (v24)
      {
        swift_bridgeObjectRelease();
        v20(v7, v14, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 2, v11);
        uint64_t v25 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
        uint64_t v26 = v33 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
        swift_beginAccess();
        sub_1BFBAA8EC((uint64_t)v7, v26);
        swift_endAccess();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
      }
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    uint64_t v1 = v33;
  }
  else
  {
    uint64_t v35 = 0;
    memset(v34, 0, sizeof(v34));
    sub_1BFBAC87C((uint64_t)v34, (uint64_t)&unk_1EA186EA0, (uint64_t)&qword_1EBA877E0, (uint64_t)&protocol descriptor for SceneOptionsURLProviding, (uint64_t (*)(void))sub_1BFA89B44);
  }
  uint64_t result = sub_1BFBD2978();
  if ((result & 1) == 0)
  {
    uint64_t v28 = v1 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
    swift_beginAccess();
    sub_1BFBAC93C(v28, (uint64_t)v7, type metadata accessor for AppLaunchMethod);
    uint64_t v29 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
    v30(v5, 1, 1, v29);
    char v31 = _s16NewsSubscription15AppLaunchMethodO2eeoiySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v5);
    sub_1BFBAA79C((uint64_t)v5, type metadata accessor for AppLaunchMethod);
    uint64_t result = sub_1BFBAA79C((uint64_t)v7, type metadata accessor for AppLaunchMethod);
    if (v31)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v7, 2, 2, v11);
      v30(v7, 0, 1, v29);
      swift_beginAccess();
      sub_1BFBAA8EC((uint64_t)v7, v28);
      return swift_endAccess();
    }
  }
  return result;
}

Swift::Void __swiftcall AppLaunchMethodChecker.sceneDidEnterBackground()()
{
  uint64_t v1 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  swift_beginAccess();
  sub_1BFBAA8EC((uint64_t)v3, v5);
  swift_endAccess();
}

uint64_t sub_1BFBA9EFC()
{
  uint64_t v1 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
  swift_beginAccess();
  sub_1BFBAA8EC((uint64_t)v3, v5);
  return swift_endAccess();
}

unint64_t sub_1BFBA9FDC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1BFBAC770();
  uint64_t v2 = (void *)sub_1BFBD4E98();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BFAE2C34(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

uint64_t _s16NewsSubscription15AppLaunchMethodO08IndirectE0O2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFBD1DD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC8DC(0, (unint64_t *)&unk_1EA186EC8, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod.IndirectMethod);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v21 - v13;
  uint64_t v15 = (char *)&v21 + *(int *)(v12 + 56) - v13;
  sub_1BFBAC93C(a1, (uint64_t)&v21 - v13, type metadata accessor for AppLaunchMethod.IndirectMethod);
  sub_1BFBAC93C(a2, (uint64_t)v15, type metadata accessor for AppLaunchMethod.IndirectMethod);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v17 = v16(v14, 2, v4);
  if (!v17)
  {
    sub_1BFBAC93C((uint64_t)v14, (uint64_t)v10, type metadata accessor for AppLaunchMethod.IndirectMethod);
    if (!v16(v15, 2, v4))
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v15, v4);
      char v18 = MEMORY[0x1C18B8ED0](v10, v7);
      uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
      v19(v7, v4);
      v19(v10, v4);
      sub_1BFBAA79C((uint64_t)v14, type metadata accessor for AppLaunchMethod.IndirectMethod);
      return v18 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16(v15, 2, v4) != 1) {
      goto LABEL_9;
    }
  }
  else if (v16(v15, 2, v4) != 2)
  {
LABEL_9:
    sub_1BFBAC9A4((uint64_t)v14, (unint64_t *)&unk_1EA186EC8, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod.IndirectMethod);
    char v18 = 0;
    return v18 & 1;
  }
  sub_1BFBAA79C((uint64_t)v14, type metadata accessor for AppLaunchMethod.IndirectMethod);
  char v18 = 1;
  return v18 & 1;
}

uint64_t _s16NewsSubscription15AppLaunchMethodO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppLaunchMethod(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC8DC(0, (unint64_t *)&unk_1EBA88990, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v19 - v13;
  uint64_t v15 = (char *)&v19 + *(int *)(v12 + 56) - v13;
  sub_1BFBAC93C(a1, (uint64_t)&v19 - v13, type metadata accessor for AppLaunchMethod);
  sub_1BFBAC93C(a2, (uint64_t)v15, type metadata accessor for AppLaunchMethod);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v16(v14, 1, v4) != 1)
  {
    sub_1BFBAC93C((uint64_t)v14, (uint64_t)v10, type metadata accessor for AppLaunchMethod);
    if (v16(v15, 1, v4) != 1)
    {
      sub_1BFBAA738((uint64_t)v15, (uint64_t)v7);
      char v17 = _s16NewsSubscription15AppLaunchMethodO08IndirectE0O2eeoiySbAE_AEtFZ_0((uint64_t)v10, (uint64_t)v7);
      sub_1BFBAA79C((uint64_t)v7, type metadata accessor for AppLaunchMethod.IndirectMethod);
      sub_1BFBAA79C((uint64_t)v10, type metadata accessor for AppLaunchMethod.IndirectMethod);
      sub_1BFBAA79C((uint64_t)v14, type metadata accessor for AppLaunchMethod);
      return v17 & 1;
    }
    sub_1BFBAA79C((uint64_t)v10, type metadata accessor for AppLaunchMethod.IndirectMethod);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_1BFBAC9A4((uint64_t)v14, (unint64_t *)&unk_1EBA88990, (void (*)(uint64_t))type metadata accessor for AppLaunchMethod);
    char v17 = 0;
    return v17 & 1;
  }
  sub_1BFBAA79C((uint64_t)v14, type metadata accessor for AppLaunchMethod);
  char v17 = 1;
  return v17 & 1;
}

uint64_t type metadata accessor for AppLaunchMethod(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EBA88980);
}

uint64_t type metadata accessor for AppLaunchMethod.IndirectMethod(uint64_t a1)
{
  return sub_1BFB59454(a1, qword_1EBA88A90);
}

uint64_t sub_1BFBAA738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BFBAA79C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BFBAA7FC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBAA834()
{
  return sub_1BFBA8954();
}

uint64_t sub_1BFBAA83C()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BFBAA87C(uint64_t a1)
{
  return sub_1BFBA8B68(a1, v1[2], v1[3], v1[4]);
}

void sub_1BFBAA888(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1BFBAA8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchMethod(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t _s16NewsSubscription22AppLaunchMethodCheckerC20sceneDidBecomeActive4with17sourceApplication0G2IDy10Foundation3URLVSg_SSSgSStF_0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppLaunchMethod(0);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = MEMORY[0x1E4F276F0];
  uint64_t v9 = MEMORY[0x1E4FBB718];
  sub_1BFBAA888(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = sub_1BFBD1DD8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBAC808(a1, (uint64_t)v12, (uint64_t)&qword_1EBA88B80, v8, v9, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1BFBAA888);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_1BFBAC87C((uint64_t)v12, (uint64_t)&qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFBAA888);
  }
  char v18 = v30;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v19(v16, v12, v13);
  uint64_t v20 = sub_1BFBD45F8();
  sub_1BFB1AD94(v20, v21);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_bridgeObjectRelease();
    v19(v7, v16, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 2, v13);
    uint64_t v24 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 0, 1, v24);
    uint64_t v25 = (uint64_t)v18 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
    swift_beginAccess();
    sub_1BFBAA8EC((uint64_t)v7, v25);
  }
  else
  {
    uint64_t v26 = (uint64_t)v18 + OBJC_IVAR____TtC16NewsSubscription22AppLaunchMethodChecker_launchMethod;
    swift_beginAccess();
    sub_1BFBAC93C(v26, (uint64_t)v7, type metadata accessor for AppLaunchMethod);
    uint64_t v27 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
    uint64_t v30 = *(void (**)(void, void, void, void))(*(void *)(v27 - 8) + 56);
    v30(v5, 1, 1, v27);
    char v28 = _s16NewsSubscription15AppLaunchMethodO2eeoiySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v5);
    sub_1BFBAA79C((uint64_t)v5, type metadata accessor for AppLaunchMethod);
    sub_1BFBAA79C((uint64_t)v7, type metadata accessor for AppLaunchMethod);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if ((v28 & 1) == 0) {
      return result;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v7, 2, 2, v13);
    v30(v7, 0, 1, v27);
    swift_beginAccess();
    sub_1BFBAA8EC((uint64_t)v7, v26);
  }
  return swift_endAccess();
}

unint64_t sub_1BFBAADD4(uint64_t a1)
{
  unint64_t result = sub_1BFBAADFC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1BFBAADFC()
{
  unint64_t result = qword_1EBA87CE0;
  if (!qword_1EBA87CE0)
  {
    type metadata accessor for AppLaunchMethodChecker(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87CE0);
  }
  return result;
}

uint64_t type metadata accessor for AppLaunchMethodChecker(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EBA88938);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppLaunchMethod(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_1BFBD1DD8();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 2, v10))
      {
        memcpy(a1, a2, *(void *)(v8 + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 2, v10);
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for AppLaunchMethod(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_1BFBD1DD8();
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 2, v4);
    if (!result)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      return v5(a1, v4);
    }
  }
  return result;
}

void *initializeWithCopy for AppLaunchMethod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_1BFBD1DD8();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 2, v8))
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 2, v8);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for AppLaunchMethod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_1BFBD1DD8();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
      int v17 = v16(a1, 2, v14);
      int v18 = v16(a2, 2, v14);
      if (v17)
      {
        if (!v18)
        {
          (*(void (**)(void *, void *, uint64_t))(v15 + 16))(a1, a2, v14);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 2, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
        {
          (*(void (**)(void *, void *, uint64_t))(v15 + 24))(a1, a2, v14);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v15 + 8))(a1, v14);
      }
      size_t v13 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_1BFBAA79C((uint64_t)a1, type metadata accessor for AppLaunchMethod.IndirectMethod);
LABEL_7:
    size_t v13 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = sub_1BFBD1DD8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 2, v11))
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 16))(a1, a2, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 2, v11);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for AppLaunchMethod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_1BFBD1DD8();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 2, v8))
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 2, v8);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for AppLaunchMethod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = sub_1BFBD1DD8();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
      int v17 = v16(a1, 2, v14);
      int v18 = v16(a2, 2, v14);
      if (v17)
      {
        if (!v18)
        {
          (*(void (**)(void *, void *, uint64_t))(v15 + 32))(a1, a2, v14);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 2, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
        {
          (*(void (**)(void *, void *, uint64_t))(v15 + 40))(a1, a2, v14);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v15 + 8))(a1, v14);
      }
      size_t v13 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_1BFBAA79C((uint64_t)a1, type metadata accessor for AppLaunchMethod.IndirectMethod);
LABEL_7:
    size_t v13 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = sub_1BFBD1DD8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 2, v11))
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 32))(a1, a2, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 2, v11);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchMethod(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBABB18);
}

uint64_t sub_1BFBABB18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppLaunchMethod(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBABB98);
}

uint64_t sub_1BFBABB98(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for AppLaunchMethod.IndirectMethod(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_1BFBABC18(uint64_t a1, uint64_t a2)
{
  return sub_1BFBAC4C4(a1, a2, type metadata accessor for AppLaunchMethod.IndirectMethod, 1);
}

uint64_t sub_1BFBABC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBAC550(a1, a2, a3, type metadata accessor for AppLaunchMethod.IndirectMethod, 1);
}

uint64_t sub_1BFBABC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBAC5EC(a1, a2, a3, type metadata accessor for AppLaunchMethod.IndirectMethod);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppLaunchMethod.IndirectMethod(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1BFBD1DD8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for AppLaunchMethod.IndirectMethod(uint64_t a1)
{
  uint64_t v2 = sub_1BFBD1DD8();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for AppLaunchMethod.IndirectMethod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFBD1DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithCopy for AppLaunchMethod.IndirectMethod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFBD1DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *initializeWithTake for AppLaunchMethod.IndirectMethod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFBD1DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithTake for AppLaunchMethod.IndirectMethod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFBD1DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchMethod.IndirectMethod(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBAC3A4);
}

uint64_t sub_1BFBAC3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFBD1DD8();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppLaunchMethod.IndirectMethod(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBAC424);
}

uint64_t sub_1BFBAC424(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1BFBD1DD8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_1BFBAC4A8(uint64_t a1, uint64_t a2)
{
  return sub_1BFBAC4C4(a1, a2, MEMORY[0x1E4F276F0], 2);
}

uint64_t sub_1BFBAC4C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v6 = a3(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  return v7(a1, a4, v6);
}

uint64_t sub_1BFBAC534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBAC550(a1, a2, a3, MEMORY[0x1E4F276F0], 2);
}

uint64_t sub_1BFBAC550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  uint64_t v8 = a4(0);
  int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  return v9(a1, a2, a5, v8);
}

uint64_t sub_1BFBAC5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBAC5EC(a1, a2, a3, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1BFBAC5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of AppLaunchMethodCheckerType.launchMethod.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppLaunchMethodCheckerType.appActivationURLHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1BFBAC694()
{
  return type metadata accessor for AppLaunchMethodChecker(0);
}

uint64_t sub_1BFBAC69C()
{
  uint64_t result = type metadata accessor for AppLaunchMethod(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AppLaunchMethodChecker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppLaunchMethodChecker);
}

uint64_t dispatch thunk of AppLaunchMethodChecker.__allocating_init(appActivationURLHandler:notificationLaunchStatusProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void sub_1BFBAC770()
{
  if (!qword_1EA186EA8)
  {
    sub_1BFBAA888(255, &qword_1EA186EB0, MEMORY[0x1E4FAAC58], MEMORY[0x1E4FBB320]);
    unint64_t v0 = sub_1BFBD4EA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186EA8);
    }
  }
}

uint64_t sub_1BFBAC808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_1BFBAC87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_1BFBAC8DC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_1BFBAC93C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BFBAC9A4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1BFBAC8DC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t LandingPageDecision.CloseButtonVisibility.shouldHideCloseButton.getter()
{
  return *v0;
}

BOOL static LandingPageDecision.CloseButtonVisibility.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LandingPageDecision.CloseButtonVisibility.hash(into:)()
{
  return sub_1BFBD5108();
}

uint64_t LandingPageDecision.CloseButtonVisibility.hashValue.getter()
{
  return sub_1BFBD5128();
}

uint64_t LandingPageDecider.landingPage(for:)()
{
  return sub_1BFBD2C38();
}

uint64_t sub_1BFBACAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    MEMORY[0x1F4188790](a1);
    sub_1BFBAE898();
    sub_1BFBD2CB8();
    int v10 = (void *)sub_1BFBD2428();
    uint64_t v11 = (void *)swift_allocObject();
    void v11[2] = a3;
    v11[3] = a4;
    v11[4] = a1;
    v11[5] = a2;
    swift_retain();
    swift_retain();
    sub_1BFBD2B88();
    swift_release();
    swift_release();

    return swift_release();
  }
  else
  {
    sub_1BFBD2CB8();
    size_t v13 = (void *)sub_1BFBD2AF8();
    sub_1BFBD2C08();
    swift_release();

    uint64_t v14 = (void *)sub_1BFBD2428();
    uint64_t v15 = (void *)swift_allocObject();
    void v15[2] = a1;
    v15[3] = a2;
    v15[4] = a3;
    v15[5] = a4;
    swift_retain();
    swift_retain();
    sub_1BFBD2B88();
    swift_release();
    swift_release();

    return swift_release();
  }
}

uint64_t sub_1BFBACD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BFBACAF8(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

void sub_1BFBACD74()
{
  if (!qword_1EBA828C0)
  {
    type metadata accessor for LandingPageDecision(255);
    unint64_t v0 = sub_1BFBD2C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA828C0);
    }
  }
}

uint64_t type metadata accessor for LandingPageDecision(uint64_t a1)
{
  return sub_1BFB59454(a1, (uint64_t *)&unk_1EBA828E0);
}

uint64_t sub_1BFBACDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
  sub_1BFA73910();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BFBD78F0;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1BFBD4298();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1BFBACE9C(unint64_t *a1, uint64_t a2, void (*a3)(void), uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v11 = type metadata accessor for LandingPageDecision(0);
  MEMORY[0x1F4188790](v11);
  size_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *a1;
  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_3;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    sub_1BFBAE924();
    char v31 = (void *)swift_allocError();
    *uint64_t v32 = 0;
    a3();

    return;
  }
  swift_bridgeObjectRetain();
  if (!sub_1BFBD4E68()) {
    goto LABEL_21;
  }
LABEL_3:
  uint64_t v34 = a5;
  v33[1] = a6;
  if ((v14 & 0xC000000000000001) != 0)
  {
    uint64_t v16 = (void *)MEMORY[0x1C18BBF00](0, v14);
LABEL_6:
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v16, sel_respondsToSelector_, sel_role) & 1) != 0
      && objc_msgSend(v16, sel_role) == (id)3)
    {
      BOOL v17 = (objc_msgSend(v16, sel_respondsToSelector_, sel_hideModalCloseButton) & 1) != 0
         && (objc_msgSend(v16, sel_hideModalCloseButton) & 1) != 0;
      id v27 = objc_msgSend(v16, sel_identifier);
      uint64_t v28 = sub_1BFBD45F8();
      uint64_t v30 = v29;

      *(void *)size_t v13 = v28;
      *((void *)v13 + 1) = v30;
      unsigned char v13[16] = v17;
      goto LABEL_19;
    }
    id v18 = objc_msgSend(*(id *)(a2 + 56), sel_configuration);
    if (v18)
    {
      uint64_t v19 = v18;
      if (objc_msgSend(v18, sel_respondsToSelector_, sel_paidBundleConfig))
      {
        id v20 = objc_msgSend(v19, sel_paidBundleConfig);
        swift_unknownObjectRelease();
        id v21 = objc_msgSend(v20, sel_defaultLandingPageArticleID);

        if (v21)
        {
          uint64_t v22 = sub_1BFBD45F8();
          uint64_t v24 = v23;

          *(void *)size_t v13 = v22;
          *((void *)v13 + 1) = v24;
          unsigned char v13[16] = 0;
LABEL_19:
          swift_storeEnumTagMultiPayload();
          v34(v13);
          swift_unknownObjectRelease();
          sub_1BFBAE534((uint64_t)v13, type metadata accessor for LandingPageDecision);
          return;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
      sub_1BFBAE924();
      uint64_t v25 = (void *)swift_allocError();
      unsigned char *v26 = 1;
      a3();

      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v16 = *(void **)(v14 + 32);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t sub_1BFBAD1E8@<X0>(uint64_t a1@<X8>)
{
  sub_1BFAC76E8(MEMORY[0x1E4FBC868]);
  id v2 = objc_allocWithZone(MEMORY[0x1E4F4DD00]);
  sub_1BFA95EF0(0, (unint64_t *)&qword_1EBA850B0);
  uint64_t v3 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithDictionary_, v3);

  char v5 = byte_1EBA88800;
  uint64_t v7 = qword_1EBA88808;
  uint64_t v6 = unk_1EBA88810;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = MEMORY[0x1E4FBC860];
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v4;
  return swift_bridgeObjectRetain();
}

void sub_1BFBAD2D4(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v25 = a6;
  uint64_t v26 = a5;
  uint64_t v32 = a4;
  uint64_t v33 = a3;
  uint64_t v27 = a2;
  uint64_t v7 = type metadata accessor for LandingPageDecision(0);
  MEMORY[0x1F4188790](v7);
  int v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v30 = *(void *)(a1 + 16);
  uint64_t v31 = v10;
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  int v29 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 56);
  uint64_t v16 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  id v17 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(a1) = AMSMarketingItem.isCIPOffer()();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1) {
    goto LABEL_4;
  }
  if (v14) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v18 = v17;
  HIDWORD(v24) = AMSMarketingItem.isBundleHardwareOffer()();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 0x100000000) != 0)
  {
LABEL_4:
    *(void *)int v9 = v31;
    *((void *)v9 + 1) = v11;
    *((void *)v9 + 2) = v30;
    *((void *)v9 + 3) = v12;
    *((void *)v9 + 4) = v13;
    v9[40] = v14;
    v9[48] = v29;
    *((void *)v9 + 7) = v28;
    *((void *)v9 + 8) = v15;
    *((void *)v9 + 9) = v17;
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v19 = v17;
  }
  else
  {
LABEL_5:
    id v20 = sub_1BFBAD56C(v27);
    if (!v21)
    {
      sub_1BFBAE924();
      uint64_t v22 = (void *)swift_allocError();
      *uint64_t v23 = 1;
      v26();

      return;
    }
    *(void *)int v9 = v20;
    *((void *)v9 + 1) = v21;
    v9[16] = 0;
    swift_storeEnumTagMultiPayload();
  }
  v33(v9);
  sub_1BFBAE534((uint64_t)v9, type metadata accessor for LandingPageDecision);
}

id sub_1BFBAD56C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t ObjectType = swift_getObjectType();
  char v11 = 6;
  (*(void (**)(uint64_t *__return_ptr, char *, uint64_t, uint64_t))(v2 + 32))(v12, &v11, ObjectType, v2);
  uint64_t v4 = v13;
  sub_1BFA64760(v12[0], v12[1], v12[2], v12[3], v13, v14, v15, v16, v17, v18);
  id result = objc_msgSend(*(id *)(a1 + 56), sel_configuration);
  uint64_t v6 = result;
  if (v4)
  {
    if (result)
    {
      if (objc_msgSend(result, sel_respondsToSelector_, sel_paidBundleConfig))
      {
        id v7 = objc_msgSend(v6, sel_paidBundleConfig);
        swift_unknownObjectRelease();
        id v8 = objc_msgSend(v7, sel_defaultServicesBundleLandingPageArticleID);
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    __break(1u);
  }
  else if (result)
  {
    if (objc_msgSend(result, sel_respondsToSelector_, sel_paidBundleConfig))
    {
      id v7 = objc_msgSend(v6, sel_paidBundleConfig);
      swift_unknownObjectRelease();
      id v8 = objc_msgSend(v7, sel_defaultLandingPageArticleID);
LABEL_8:
      id v9 = v8;

      if (v9)
      {
        uint64_t v10 = sub_1BFBD45F8();

        return (id)v10;
      }
      return 0;
    }
LABEL_10:
    swift_unknownObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t LandingPageDecider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t LandingPageDecider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_1BFBAD784()
{
  unint64_t result = qword_1EA186ED8;
  if (!qword_1EA186ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186ED8);
  }
  return result;
}

uint64_t sub_1BFBAD7D8()
{
  return sub_1BFBD2C38();
}

ValueMetadata *type metadata accessor for CampaignRouteTarget()
{
  return &type metadata for CampaignRouteTarget;
}

uint64_t initializeBufferWithCopyOfBuffer for LandingPageDecision(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v6 = a2[1];
        *(void *)a1 = *a2;
        *(void *)(a1 + 8) = v6;
        uint64_t v7 = a2[3];
        *(void *)(a1 + 16) = a2[2];
        *(void *)(a1 + 24) = v7;
        *(void *)(a1 + 32) = a2[4];
        *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
        *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
        uint64_t v8 = a2[8];
        *(void *)(a1 + 56) = a2[7];
        *(void *)(a1 + 64) = v8;
        id v9 = (void *)a2[9];
        *(void *)(a1 + 72) = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v10 = v9;
      }
      else
      {
        uint64_t v13 = sub_1BFBD1DD8();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v12 = a2[1];
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v12;
      *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for LandingPageDecision.AMSSheet(uint64_t a1)
{
  return sub_1BFB59454(a1, qword_1EBA828C8);
}

void destroy for LandingPageDecision(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = *(void **)(a1 + 72);
    }
    else
    {
      uint64_t v3 = sub_1BFBD1DD8();
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for LandingPageDecision(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      uint64_t v6 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v6;
      uint64_t v7 = *(void **)(a2 + 72);
      *(void *)(a1 + 72) = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v8 = v7;
    }
    else
    {
      uint64_t v10 = sub_1BFBD1DD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v9;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for LandingPageDecision(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1BFBAE534(a1, type metadata accessor for LandingPageDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
        *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        uint64_t v4 = *(void **)(a2 + 72);
        *(void *)(a1 + 72) = v4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v5 = v4;
      }
      else
      {
        uint64_t v6 = sub_1BFBD1DD8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LandingPageDecision(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LandingPageDecision(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BFBAE534((uint64_t)a1, type metadata accessor for LandingPageDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        uint64_t v7 = sub_1BFBD1DD8();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1BFBAE044()
{
  uint64_t result = type metadata accessor for LandingPageDecision.AMSSheet(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LandingPageDecision.CloseButtonVisibility()
{
  return &type metadata for LandingPageDecision.CloseButtonVisibility;
}

uint64_t initializeBufferWithCopyOfBuffer for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v6;
      uint64_t v7 = a2[3];
      *(void *)(a1 + 16) = a2[2];
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = a2[4];
      *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      uint64_t v8 = a2[8];
      *(void *)(a1 + 56) = a2[7];
      *(void *)(a1 + 64) = v8;
      uint64_t v9 = (void *)a2[9];
      *(void *)(a1 + 72) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v10 = v9;
    }
    else
    {
      uint64_t v12 = sub_1BFBD1DD8();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for LandingPageDecision.AMSSheet(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void **)(a1 + 72);
  }
  else
  {
    uint64_t v3 = sub_1BFBD1DD8();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    v4(a1, v3);
  }
}

uint64_t initializeWithCopy for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    uint64_t v6 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v6;
    uint64_t v7 = *(void **)(a2 + 72);
    *(void *)(a1 + 72) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = sub_1BFBD1DD8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1BFBAE534(a1, type metadata accessor for LandingPageDecision.AMSSheet);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      uint64_t v4 = *(void **)(a2 + 72);
      *(void *)(a1 + 72) = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v5 = v4;
    }
    else
    {
      uint64_t v6 = sub_1BFBD1DD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1BFBAE534(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeWithTake for LandingPageDecision.AMSSheet(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_1BFBD1DD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for LandingPageDecision.AMSSheet(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BFBAE534((uint64_t)a1, type metadata accessor for LandingPageDecision.AMSSheet);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1BFBAE720()
{
  uint64_t result = sub_1BFBD1DD8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of LandingPageDeciderType.landingPage(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for LandingPageDecider()
{
  return self;
}

uint64_t method lookup function for LandingPageDecider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LandingPageDecider);
}

uint64_t sub_1BFBAE800()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

void sub_1BFBAE858(uint64_t a1, uint64_t a2)
{
  sub_1BFBAD2D4(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24), *(void (**)(void))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1BFBAE878()
{
  return sub_1BFBACDEC(v0[2], v0[3], v0[4]);
}

void sub_1BFBAE898()
{
  if (!qword_1EBA828F0)
  {
    sub_1BFA95EF0(255, &qword_1EBA828F8);
    unint64_t v0 = sub_1BFBD4898();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA828F0);
    }
  }
}

void sub_1BFBAE904(unint64_t *a1, uint64_t a2)
{
  sub_1BFBACE9C(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void (**)(char *))(v2 + 32), *(void *)(v2 + 40));
}

unint64_t sub_1BFBAE924()
{
  unint64_t result = qword_1EA186EE0;
  if (!qword_1EA186EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186EE0);
  }
  return result;
}

unsigned char *_s16NewsSubscription19LandingPageDecisionO21CloseButtonVisibilityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBAEA44);
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

ValueMetadata *type metadata accessor for LandingPageDecider.Errors()
{
  return &type metadata for LandingPageDecider.Errors;
}

unint64_t sub_1BFBAEA80()
{
  unint64_t result = qword_1EA186EF0;
  if (!qword_1EA186EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186EF0);
  }
  return result;
}

uint64_t sub_1BFBAEAD8()
{
  uint64_t result = sub_1BFBD45C8();
  qword_1EBA81DF8 = result;
  return result;
}

uint64_t sub_1BFBAEB10()
{
  uint64_t result = sub_1BFBD45C8();
  qword_1EBA81DF0 = result;
  return result;
}

uint64_t CampaignClickRecorder.patterns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CampaignClickRecorder.__allocating_init(patterns:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  CampaignClickRecorder.init(patterns:)(a1);
  return v2;
}

uint64_t CampaignClickRecorder.init(patterns:)(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)BridgedCampaignClickRecorder), sel_init);
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = v3;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4DD98]), sel_init);
  if (qword_1EBA821F8 != -1) {
    swift_once();
  }
  objc_msgSend(v4, sel_addBagKey_valueType_, qword_1EBA81DF8, 6);
  if (qword_1EBA821F0 != -1) {
    swift_once();
  }
  objc_msgSend(v4, sel_addBagKey_valueType_, qword_1EBA81DF0, 5);
  uint64_t v5 = self;
  unsigned int v6 = (void *)sub_1BFBD45C8();
  uint64_t v7 = (void *)sub_1BFBD45C8();
  objc_msgSend(v5, sel_registerBagKeySet_forProfile_profileVersion_, v4, v6, v7);

  return v1;
}

uint64_t CampaignClickRecorder.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CampaignClickRecorder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void sub_1BFBAED64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = (void *)sub_1BFBD45C8();
  id v10 = (void *)sub_1BFBD45C8();
  id v11 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v9, v10);

  if (qword_1EBA821F8 != -1) {
    swift_once();
  }
  id v12 = objc_msgSend(v11, sel_dictionaryForKey_, qword_1EBA81DF8);
  id v13 = objc_msgSend(v12, sel_valuePromise);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = a3;
  v14[3] = a4;
  v14[4] = sub_1BFAEB1F8;
  v14[5] = v8;
  v16[4] = sub_1BFBB1920;
  v16[5] = v14;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1BFA79E9C;
  v16[3] = &block_descriptor_45_1;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_addFinishBlock_, v15);
  _Block_release(v15);
}

void sub_1BFBAEF68(void *a1, id a2, void (*a3)(void), uint64_t a4, void (*a5)())
{
  if (a2)
  {
    id v7 = a2;
    ((void (*)(id))a3)(a2);
    id v8 = a2;
    goto LABEL_3;
  }
  if (!a1)
  {
    sub_1BFBB10D4();
    uint64_t v14 = swift_allocError();
    *uint64_t v15 = 0;
    a3();
    id v8 = (id)v14;
LABEL_3:
LABEL_5:

    return;
  }
  id v21 = a1;
  id v10 = (void *)sub_1BFBD45C8();
  id v11 = objc_msgSend(v21, sel_objectForKey_, v10);

  if (!v11)
  {
    sub_1BFBB10D4();
    uint64_t v16 = (void *)swift_allocError();
    *uint64_t v17 = 0;
    a3();

    id v8 = v21;
    goto LABEL_5;
  }
  sub_1BFBD4C68();
  swift_unknownObjectRelease();
  sub_1BFA71DAC(v23, v24);
  id v12 = (void *)sub_1BFBD45C8();
  id v13 = objc_msgSend(v21, sel_objectForKey_, v12);

  if (v13)
  {
    sub_1BFBD4C68();
    swift_unknownObjectRelease();
    sub_1BFA71DAC(v22, v23);
    sub_1BFA5CA14((uint64_t)v24, (uint64_t)v22);
    if (swift_dynamicCast())
    {
      sub_1BFA5CA14((uint64_t)v23, (uint64_t)v22);
      sub_1BFBB192C(0, (unint64_t *)&qword_1EBA84F60, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
      if (swift_dynamicCast())
      {
        a5();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        return;
      }
      swift_bridgeObjectRelease();
    }
    sub_1BFBB10D4();
    id v18 = (void *)swift_allocError();
    *id v20 = 0;
    a3();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    sub_1BFBB10D4();
    id v18 = (void *)swift_allocError();
    *id v19 = 0;
    a3();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

void sub_1BFBAF2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = (void *)sub_1BFBD45C8();
  id v10 = (void *)sub_1BFBD45C8();
  id v11 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v9, v10);

  if (qword_1EBA821F0 != -1) {
    swift_once();
  }
  id v12 = objc_msgSend(v11, sel_URLForKey_, qword_1EBA81DF0);
  id v13 = objc_msgSend(v12, sel_valuePromise);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = a3;
  v14[3] = a4;
  v14[4] = sub_1BFB4A838;
  v14[5] = v8;
  v16[4] = sub_1BFBB18B0;
  v16[5] = v14;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1BFA79E9C;
  v16[3] = &block_descriptor_36;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_addFinishBlock_, v15);
  _Block_release(v15);
}

void sub_1BFBAF4D4(void *a1, id a2, void (*a3)(void), uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  if (a1 && (id v8 = objc_msgSend(a1, sel_absoluteString)) != 0)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_1BFBD45F8();
    uint64_t v12 = v11;

    a5(v10, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (a2)
    {
      id v13 = a2;
      ((void (*)(id))a3)(a2);
      id v14 = a2;
    }
    else
    {
      sub_1BFBB10D4();
      uint64_t v15 = swift_allocError();
      *uint64_t v16 = 1;
      a3();
      id v14 = (id)v15;
    }
  }
}

uint64_t sub_1BFBAF5E4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v32 = v4;
  uint64_t v33 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v31 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (1)
    {
      int64_t v12 = v11;
      if (!v8) {
        break;
      }
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      if (*(void *)(v5 + 16)) {
        goto LABEL_31;
      }
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v12 + 2;
      if (v12 + 2 >= v31) {
        goto LABEL_48;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v12 + 3;
        if (v12 + 3 >= v31) {
          goto LABEL_48;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(void *)(v5 + 16))
    {
LABEL_31:
      id v18 = (uint64_t *)(*(void *)(v32 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_1BFBD50F8();
      swift_bridgeObjectRetain();
      sub_1BFBD4698();
      uint64_t v21 = sub_1BFBD5128();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = *(void *)(v5 + 48);
        uint64_t v25 = (void *)(v24 + 16 * v23);
        BOOL v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_1BFBD5048() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
LABEL_45:
          sub_1BFA804E4();
          return v30;
        }
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          uint64_t v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_1BFBD5048() & 1) != 0) {
            goto LABEL_44;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    uint64_t v30 = 1;
    goto LABEL_45;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_48;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_30;
    }
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_1BFBAF8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  int64_t v11 = *(void **)(a5 + 24);
  swift_retain();
  int64_t v12 = (void *)sub_1BFBD45C8();
  unint64_t v13 = (void *)sub_1BFBD45C8();
  id v14 = objc_msgSend(v11, sel_recordCampaignClickWithReportUrl_campaignUrl_, v12, v13);

  int64_t v15 = (void *)swift_allocObject();
  void v15[2] = sub_1BFA4DDE8;
  v15[3] = v10;
  v15[4] = a3;
  v15[5] = a4;
  uint64_t v25 = sub_1BFBB10C0;
  BOOL v26 = v15;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 1107296256;
  unint64_t v23 = sub_1BFABC618;
  uint64_t v24 = &block_descriptor_34;
  unint64_t v16 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  id v17 = objc_msgSend(v14, sel_then_, v16);
  _Block_release(v16);

  if (v17)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    uint64_t v25 = sub_1BFBB10CC;
    BOOL v26 = (void *)v18;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 1107296256;
    unint64_t v23 = sub_1BFA78BFC;
    uint64_t v24 = &block_descriptor_20_1;
    uint64_t v19 = _Block_copy(&v21);
    swift_retain();
    swift_release();
    id v20 = objc_msgSend(v17, sel_error_, v19);
    _Block_release(v19);
  }
  else
  {
    __break(1u);
  }
}

double sub_1BFBAFB34@<D0>(uint64_t a1@<X0>, void (*a2)()@<X1>, void (*a3)(void)@<X3>, _OWORD *a4@<X8>)
{
  sub_1BFA7EBC0(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_1BFBB18BC((uint64_t)v11, (uint64_t)&qword_1EBA85130, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFBB192C);
    goto LABEL_5;
  }
  sub_1BFA4DF3C(0, &qword_1EBA81D40);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    sub_1BFBB10D4();
    uint64_t v7 = (void *)swift_allocError();
    unsigned char *v8 = 6;
    a3();

    goto LABEL_6;
  }
  a2();

LABEL_6:
  double result = 0.0;
  *a4 = 0u;
  a4[1] = 0u;
  return result;
}

void sub_1BFBAFC68(void *a1, void (*a2)(uint64_t))
{
  if (a1)
  {
    unint64_t v3 = a1;
    id v4 = a1;
    uint64_t v5 = (uint64_t)v3;
  }
  else
  {
    sub_1BFBB10D4();
    uint64_t v5 = swift_allocError();
    unint64_t v3 = (void *)v5;
    unsigned char *v6 = 6;
  }
  a2(v5);
}

void sub_1BFBAFCEC(void (*a1)(void *), uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (sub_1BFBB1158(a6, a7, a10))
  {
    sub_1BFBAFDEC(a6, a7);
    v17[0] = a8;
    v17[1] = a9;
    a1(v17);
  }
  else
  {
    sub_1BFBB10D4();
    int64_t v15 = (void *)swift_allocError();
    *unint64_t v16 = 2;
    a3();
  }
}

void sub_1BFBAFDEC(uint64_t a1, uint64_t a2)
{
  if ((sub_1BFBAFFB4() & 1) == 0)
  {
    sub_1BFBD2CB8();
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = v2;
    v5[3] = a1;
    v5[4] = a2;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_1BFBD2AF8();
    sub_1BFA4DF3C(0, &qword_1EBA81D40);
    sub_1BFBD2B58();
    swift_release();
    swift_release();

    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    swift_bridgeObjectRetain();
    unint64_t v8 = (void *)sub_1BFBD2AF8();
    sub_1BFBD2B68();
    swift_release();
    swift_release();

    id v9 = (id)sub_1BFBD2AF8();
    sub_1BFBD2B98();
    swift_release();
    swift_release();
  }
}

uint64_t sub_1BFBAFFB4()
{
  id v0 = objc_msgSend(self, sel_ams_sharedAccountStore);
  uint64_t v1 = (uint64_t)objc_msgSend(v0, sel_ams_localiTunesAccount);

  if (v1)
  {
    id v2 = objc_msgSend((id)v1, sel_ams_cookies);
    if (v2)
    {
      unint64_t v3 = v2;
      sub_1BFA4DF3C(0, &qword_1EA186F10);
      unint64_t v4 = sub_1BFBD4828();

      if (v4 >> 62) {
        goto LABEL_24;
      }
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v5; uint64_t v5 = sub_1BFBD4E68())
      {
        uint64_t v6 = 4;
        while (1)
        {
          id v7 = (v4 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x1C18BBF00](v6 - 4, v4)
             : *(id *)(v4 + 8 * v6);
          unint64_t v8 = v7;
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v6 - 4, 1)) {
            break;
          }
          id v10 = objc_msgSend(v7, sel_name);
          uint64_t v11 = sub_1BFBD45F8();
          uint64_t v13 = v12;

          if (v11 == 0x69635F7078 && v13 == 0xE500000000000000)
          {

            swift_bridgeObjectRelease();
LABEL_20:
            swift_bridgeObjectRelease();
            uint64_t v1 = 1;
            goto LABEL_21;
          }
          char v15 = sub_1BFBD5048();

          swift_bridgeObjectRelease();
          if (v15)
          {

            goto LABEL_20;
          }
          ++v6;
          if (v9 == v5) {
            goto LABEL_16;
          }
        }
        __break(1u);
LABEL_24:
        swift_bridgeObjectRetain();
      }
LABEL_16:

      swift_bridgeObjectRelease();
      uint64_t v1 = 0;
LABEL_21:
      swift_bridgeObjectRelease();
    }
    else
    {

      return 0;
    }
  }
  return v1;
}

uint64_t sub_1BFBB01D8()
{
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFBD4A08();
  sub_1BFA4DE80();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BFBD78F0;
  sub_1BFA4E0BC(0, (unint64_t *)&qword_1EBA85110);
  sub_1BFBD4E28();
  *(void *)(v0 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v0 + 64) = sub_1BFA4DEE8();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  sub_1BFBD2D88();
  return swift_bridgeObjectRelease();
}

void CampaignClickRecorder.processURL(for:)()
{
  uint64_t v1 = sub_1BFBD1DD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  unint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BFBD26B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBB0FB4(0, (unint64_t *)&qword_1EBA829E0, MEMORY[0x1E4FABD38], MEMORY[0x1E4FAAC10]);
  sub_1BFBD2808();
  sub_1BFBD2678();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = sub_1BFBD1D28();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1BFBD2CB8();
  uint64_t v12 = (void *)swift_allocObject();
  void v12[2] = v0;
  v12[3] = v9;
  uint64_t v12[4] = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B58();
  swift_release();
  swift_release();

  id v14 = (void *)swift_allocObject();
  void v14[2] = v0;
  v14[3] = v9;
  v14[4] = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  char v15 = (void *)sub_1BFBD2AF8();
  sub_1BFA4DF3C(0, &qword_1EBA81D40);
  sub_1BFBD2B58();
  swift_release();
  swift_release();

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v9;
  *(void *)(v16 + 24) = v11;
  id v17 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B68();
  swift_release();
  swift_release();

  uint64_t v18 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B98();
  swift_release();
  swift_release();
}

uint64_t sub_1BFBB0688(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  return sub_1BFBD2C38();
}

uint64_t sub_1BFBB06F0()
{
  return sub_1BFBB0688(v0, (unint64_t *)&unk_1EBA81D20, (uint64_t)&type metadata for CampaignClickRecorder.ProcessRedirectValue);
}

uint64_t sub_1BFBB0730()
{
  return sub_1BFBD2C38();
}

uint64_t sub_1BFBB07CC()
{
  return sub_1BFBB0730();
}

uint64_t sub_1BFBB07EC()
{
  return sub_1BFBD2C38();
}

uint64_t sub_1BFBB085C()
{
  return sub_1BFBB07EC();
}

uint64_t sub_1BFBB0890(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  sub_1BFBB0FB4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v28 - v12;
  id v14 = *a1;
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFA4DE80();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1BFBD7990;
  uint64_t v16 = MEMORY[0x1E4FBB1A0];
  *(void *)(v15 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v17 = sub_1BFA4DEE8();
  *(void *)(v15 + 64) = v17;
  *(void *)(v15 + 32) = a2;
  *(void *)(v15 + 40) = a3;
  swift_bridgeObjectRetain();
  id v18 = objc_msgSend(v14, sel_response, v28, v29);
  if (!v18) {
    goto LABEL_9;
  }
  uint64_t v19 = v18;
  id v20 = objc_msgSend(v18, sel_URL);

  if (v20)
  {
    sub_1BFBD1D98();

    uint64_t v21 = sub_1BFBD1DD8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 0, 1, v21);
  }
  else
  {
    uint64_t v21 = sub_1BFBD1DD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 1, 1, v21);
  }
  sub_1BFAC64FC((uint64_t)v11, (uint64_t)v13);
  sub_1BFBD1DD8();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v13, 1, v21) == 1)
  {
    sub_1BFBB18BC((uint64_t)v13, (uint64_t)&qword_1EBA88B80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFBB0FB4);
LABEL_9:
    unint64_t v23 = (uint64_t *)(v15 + 72);
    *(void *)(v15 + 96) = v16;
    *(void *)(v15 + 104) = v17;
    goto LABEL_10;
  }
  uint64_t v26 = sub_1BFBD1D28();
  unint64_t v24 = v27;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
  unint64_t v23 = (uint64_t *)(v15 + 72);
  *(void *)(v15 + 96) = v16;
  *(void *)(v15 + 104) = v17;
  if (v24)
  {
    *unint64_t v23 = v26;
    goto LABEL_11;
  }
LABEL_10:
  *unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
LABEL_11:
  *(void *)(v15 + 80) = v24;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFBB0C08(void **a1)
{
  return sub_1BFBB0890(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)"Successfully registered campaign click with figaro for campaign url: %@ && redirect url: %@", 91);
}

void sub_1BFBB0C30(void *a1)
{
  id v1 = a1;
  sub_1BFA4E0BC(0, (unint64_t *)&qword_1EBA85110);
  if (swift_dynamicCast())
  {

    if (v3 == 2) {
      return;
    }
  }
  else
  {
  }
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFBD4A08();
  sub_1BFA4DE80();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BFBD78F0;
  sub_1BFBD4E28();
  *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v2 + 64) = sub_1BFA4DEE8();
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
}

unint64_t sub_1BFBB0DAC()
{
  unint64_t result = qword_1EA186F00;
  if (!qword_1EA186F00)
  {
    type metadata accessor for CampaignClickRecorder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F00);
  }
  return result;
}

uint64_t type metadata accessor for CampaignClickRecorder()
{
  return self;
}

void sub_1BFBB0E24()
{
}

uint64_t method lookup function for CampaignClickRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CampaignClickRecorder);
}

uint64_t dispatch thunk of CampaignClickRecorder.__allocating_init(patterns:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for CampaignClickRecorder.ProcessRedirectValue()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16NewsSubscription21CampaignClickRecorderC20ProcessRedirectValueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CampaignClickRecorder.ProcessRedirectValue(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CampaignClickRecorder.ProcessRedirectValue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CampaignClickRecorder.ProcessRedirectValue()
{
  return &type metadata for CampaignClickRecorder.ProcessRedirectValue;
}

void sub_1BFBB0FB4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BFBB101C()
{
  if (!qword_1EA186F08)
  {
    sub_1BFA4DF3C(255, &qword_1EBA81D40);
    unint64_t v0 = sub_1BFBD2C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186F08);
    }
  }
}

uint64_t sub_1BFBB1084()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

double sub_1BFBB10C0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1BFBAFB34(a1, *(void (**)())(v2 + 16), *(void (**)(void))(v2 + 32), a2);
}

void sub_1BFBB10CC(void *a1)
{
  sub_1BFBAFC68(a1, *(void (**)(uint64_t))(v1 + 16));
}

unint64_t sub_1BFBB10D4()
{
  unint64_t result = qword_1EBA81D38;
  if (!qword_1EBA81D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA81D38);
  }
  return result;
}

void sub_1BFBB1128(void (*a1)(void *), uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_1BFBAFCEC(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7]);
}

uint64_t sub_1BFBB1158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v57 = a3;
  uint64_t v59 = a2;
  uint64_t v3 = sub_1BFBD1BA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1BFBB0FB4(0, &qword_1EBA82D28, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v53 - v9;
  uint64_t v11 = sub_1BFBD1C68();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v58 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBB0FB4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0], v7);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v53 - v15;
  uint64_t v17 = sub_1BFBD1DD8();
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v20;
  sub_1BFBD1DB8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v16, 1, v17) == 1)
  {
    uint64_t v22 = &qword_1EBA88B80;
    uint64_t v23 = MEMORY[0x1E4F276F0];
    uint64_t v24 = MEMORY[0x1E4FBB718];
    uint64_t v25 = (uint64_t)v16;
LABEL_5:
    sub_1BFBB18BC(v25, (uint64_t)v22, v23, v24, (uint64_t (*)(void))sub_1BFBB0FB4);
LABEL_6:
    char v26 = 0;
    return v26 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v19, v16, v17);
  sub_1BFBD1BD8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v17);
    uint64_t v22 = &qword_1EBA82D28;
    uint64_t v23 = MEMORY[0x1E4F26ED8];
    uint64_t v24 = MEMORY[0x1E4FBB718];
    uint64_t v25 = (uint64_t)v10;
    goto LABEL_5;
  }
  uint64_t v59 = v17;
  uint64_t v28 = v58;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v58, v10, v11);
  uint64_t v29 = sub_1BFBD1BB8();
  if (!v29)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v28, v11);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v59);
    goto LABEL_6;
  }
  int64_t v54 = v19;
  uint64_t v55 = v21;
  uint64_t v53 = v12;
  uint64_t v56 = v11;
  uint64_t v61 = MEMORY[0x1E4FBC870];
  uint64_t v30 = *(void *)(v29 + 16);
  if (v30)
  {
    uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v31 = v4 + 16;
    uint64_t v32 = v33;
    unint64_t v34 = v29 + ((*(unsigned __int8 *)(v31 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 64));
    uint64_t v35 = *(void *)(v31 + 56);
    do
    {
      v32(v6, v34, v3);
      uint64_t v36 = sub_1BFBD1B88();
      sub_1BFBBECB4(&v60, v36, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 - 8))(v6, v3);
      v34 += v35;
      --v30;
    }
    while (v30);
  }
  swift_bridgeObjectRelease();
  uint64_t v38 = v57;
  int64_t v39 = *(void *)(v57 + 16);
  uint64_t v40 = MEMORY[0x1E4FBC860];
  if (v39)
  {
    uint64_t v60 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1BFB0F4C4(0, v39, 0);
    uint64_t v40 = v60;
    char v41 = (uint64_t *)(v38 + 40);
    do
    {
      uint64_t v42 = *(v41 - 1);
      uint64_t v43 = *v41;
      uint64_t v60 = v40;
      unint64_t v44 = *(void *)(v40 + 16);
      unint64_t v45 = *(void *)(v40 + 24);
      swift_bridgeObjectRetain();
      if (v44 >= v45 >> 1)
      {
        sub_1BFB0F4C4(v45 > 1, v44 + 1, 1);
        uint64_t v40 = v60;
      }
      v41 += 2;
      *(void *)(v40 + 16) = v44 + 1;
      uint64_t v46 = v40 + 16 * v44;
      *(void *)(v46 + 32) = v42;
      *(void *)(v46 + 40) = v43;
      --v39;
    }
    while (v39);
    swift_bridgeObjectRelease();
  }
  uint64_t v48 = v55;
  uint64_t v47 = v56;
  uint64_t v49 = sub_1BFAD8FA8(v40);
  swift_bridgeObjectRelease();
  unsigned int v50 = v54;
  if (*(void *)(v61 + 16) && *(void *)(v49 + 16))
  {
    uint64_t v51 = swift_bridgeObjectRetain();
    char v52 = sub_1BFBAF5E4(v51, v49);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    char v26 = v52 ^ 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v26 = 0;
  }
  (*(void (**)(char *, uint64_t))(v53 + 8))(v58, v47);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v59);
  return v26 & 1;
}

uint64_t sub_1BFBB1798()
{
  return sub_1BFBB0688(v0, &qword_1EBA81D30, MEMORY[0x1E4FBB1A0]);
}

uint64_t objectdestroyTm_2()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BFBB181C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BFBB1854(void **a1)
{
  return sub_1BFBB0890(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)"Successfully obtained xp_ci token for campaign url: %@ && register url: %@", 74);
}

void sub_1BFBB187C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BFBAF8C8(a1, a2, a3, a4, *(void *)(v4 + 16));
}

void sub_1BFBB18B0(void *a1, void *a2)
{
  sub_1BFBAF4D4(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t, uint64_t))(v2 + 32));
}

uint64_t sub_1BFBB18BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_1BFBB1920(void *a1, void *a2)
{
  sub_1BFBAEF68(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void (**)())(v2 + 32));
}

void sub_1BFBB192C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for CampaignClickRecorder.CampaignLinkRecordingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBB1A44);
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

ValueMetadata *type metadata accessor for CampaignClickRecorder.CampaignLinkRecordingError()
{
  return &type metadata for CampaignClickRecorder.CampaignLinkRecordingError;
}

unint64_t sub_1BFBB1A80()
{
  unint64_t result = qword_1EA186F18;
  if (!qword_1EA186F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F18);
  }
  return result;
}

uint64_t FCPostPurchaseOnboardingConfigurationType.debugDescription.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_1BFBB1BEC()
{
  return FCPostPurchaseOnboardingConfigurationType.debugDescription.getter();
}

unint64_t sub_1BFBB1BF4(char a1)
{
  unint64_t result = 0x69746E6564657263;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x496C656E6E616863;
      break;
    case 2:
      unint64_t result = 0x7275507070416E69;
      break;
    case 3:
      unint64_t result = 0x74706965636572;
      break;
    case 4:
      unint64_t result = 0x6C69616D65;
      break;
    case 5:
      unint64_t result = 0x744164616F6C7075;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFBB1CFC(void *a1)
{
  int v3 = v1;
  sub_1BFBB4230(0, &qword_1EA186F38, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v15[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFBB41DC();
  sub_1BFBD5148();
  long long v10 = v3[1];
  uint64_t v11 = *((void *)v3 + 4);
  uint64_t v12 = *((void *)v3 + 5);
  long long v16 = *v3;
  long long v17 = v10;
  uint64_t v18 = v11;
  uint64_t v19 = v12;
  long long v13 = v3[4];
  long long v20 = v3[3];
  long long v21 = v13;
  v15[15] = 0;
  sub_1BFB7FB80();
  sub_1BFBD4FE8();
  if (!v2)
  {
    LOBYTE(v16) = 1;
    sub_1BFBD4FB8();
    LOBYTE(v16) = 2;
    sub_1BFBD4FB8();
    LOBYTE(v16) = 3;
    sub_1BFBD4FB8();
    LOBYTE(v16) = 4;
    sub_1BFBD4F88();
    LOBYTE(v16) = 5;
    sub_1BFBD4FD8();
    type metadata accessor for SiwaCredentialUploadData();
    LOBYTE(v16) = 6;
    sub_1BFBD1ED8();
    sub_1BFB427F4((unint64_t *)&unk_1EBA82098);
    sub_1BFBD4FE8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1BFBB1FA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v4 = sub_1BFBD1ED8();
  uint64_t v36 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBB4230(0, &qword_1EA186F28, MEMORY[0x1E4FBBDC0]);
  uint64_t v33 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  long long v10 = (char *)&v31 - v9;
  uint64_t v11 = type metadata accessor for SiwaCredentialUploadData();
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)v14 + 18) = 0;
  uint64_t v35 = &v14[*(int *)(v12 + 48)];
  sub_1BFBD1E28();
  uint64_t v15 = a1[3];
  unint64_t v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_1BFBB41DC();
  sub_1BFBD5138();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v35, v4);
  }
  else
  {
    uint64_t v16 = v8;
    char v44 = 0;
    sub_1BFB80214();
    uint64_t v17 = v33;
    sub_1BFBD4F58();
    long long v18 = v38;
    uint64_t v19 = v39;
    uint64_t v20 = v40;
    *(_OWORD *)uint64_t v14 = v37;
    *((_OWORD *)v14 + 1) = v18;
    *((void *)v14 + 4) = v19;
    *((void *)v14 + 5) = v20;
    long long v21 = v42;
    *((_OWORD *)v14 + 3) = v41;
    *((_OWORD *)v14 + 4) = v21;
    LOBYTE(v37) = 1;
    *((void *)v14 + 10) = sub_1BFBD4F28();
    *((void *)v14 + 11) = v22;
    LOBYTE(v37) = 2;
    uint64_t v23 = sub_1BFBD4F28();
    uint64_t v32 = v4;
    *((void *)v14 + 12) = v23;
    *((void *)v14 + 13) = v24;
    LOBYTE(v37) = 3;
    uint64_t v25 = sub_1BFBD4F28();
    int v43 = 1;
    *((void *)v14 + 14) = v25;
    *((void *)v14 + 15) = v26;
    LOBYTE(v37) = 4;
    uint64_t v27 = v16;
    *((void *)v14 + 16) = sub_1BFBD4EE8();
    *((void *)v14 + 17) = v28;
    LOBYTE(v37) = 5;
    *((void *)v14 + 18) = sub_1BFBD4F48();
    LOBYTE(v37) = 6;
    sub_1BFB427F4(&qword_1EBA853B8);
    uint64_t v29 = v32;
    sub_1BFBD4F58();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v17);
    (*(void (**)(char *, char *, uint64_t))(v36 + 40))(v35, v6, v29);
    sub_1BFACB83C((uint64_t)v14, v31);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return sub_1BFBB3F88((uint64_t)v14);
  }
}

unint64_t sub_1BFBB2518()
{
  return sub_1BFBB1BF4(*v0);
}

uint64_t sub_1BFBB2520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBB44A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFBB2548(uint64_t a1)
{
  unint64_t v2 = sub_1BFBB41DC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBB2584(uint64_t a1)
{
  unint64_t v2 = sub_1BFBB41DC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BFBB25C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BFBB1FA4(a1, a2);
}

uint64_t sub_1BFBB25D8(void *a1)
{
  return sub_1BFBB1CFC(a1);
}

uint64_t sub_1BFBB25F0(uint64_t a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 16), *(void *)(a1 + 40));
  if (qword_1EA183B58 != -1) {
    swift_once();
  }
  sub_1BFBB4118(0, (unint64_t *)&qword_1EBA85100, (uint64_t (*)(uint64_t))sub_1BFA6FDD8, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BFBD78F0;
  uint64_t v5 = *(void *)(a2 + 80);
  uint64_t v4 = *(void *)(a2 + 88);
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 64) = sub_1BFA4DEE8();
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v4;
  swift_bridgeObjectRetain();
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  uint64_t v6 = swift_bridgeObjectRelease();
  MEMORY[0x1F4188790](v6);
  sub_1BFBB4184();
  swift_allocObject();
  return sub_1BFBD2C38();
}

uint64_t sub_1BFBB2784(unsigned char *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_1BFBD1ED8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  long long v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SiwaCredentialUploadData();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*a1)
  {
    if (qword_1EBA82A18 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1BFBD2DC8();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EBA8EE00);
    uint64_t v26 = sub_1BFBD2DA8();
    os_log_type_t v27 = sub_1BFBD4A18();
    if (!os_log_type_enabled(v26, v27)) {
      goto LABEL_19;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    uint64_t v29 = "SIWACredentialUploader successfully uploaded the credential";
    goto LABEL_18;
  }
  if (*a1 != 1)
  {
    if (qword_1EBA82A18 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1BFBD2DC8();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EBA8EE00);
    uint64_t v26 = sub_1BFBD2DA8();
    os_log_type_t v27 = sub_1BFBD4A08();
    if (!os_log_type_enabled(v26, v27)) {
      goto LABEL_19;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    uint64_t v29 = "SIWACredentialUploader failed to uploaded the credential with error. Will not retry.";
LABEL_18:
    _os_log_impl(&dword_1BFA45000, v26, v27, v29, v28, 2u);
    MEMORY[0x1C18BCB70](v28, -1, -1);
LABEL_19:

    uint64_t v31 = (void *)(a2 + 56);
    uint64_t v32 = *(void *)(a2 + 80);
LABEL_23:
    __swift_project_boxed_opaque_existential_1(v31, v32);
    uint64_t v38 = a3[11];
    uint64_t v41 = a3[10];
    uint64_t v42 = v38;
    swift_bridgeObjectRetain();
    sub_1BFBD46D8();
    swift_bridgeObjectRetain();
    sub_1BFBD46D8();
    swift_bridgeObjectRelease();
    sub_1BFACB3E8(v41, v42);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v40 = v8;
  uint64_t v43 = a2;
  if (qword_1EBA82A18 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1BFBD2DC8();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EBA8EE00);
  uint64_t v15 = sub_1BFBD2DA8();
  os_log_type_t v16 = sub_1BFBD4A08();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = v3;
    long long v18 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1BFA45000, v15, v16, "SIWACredentialUploader failed to uploaded the credential with error. Error is retry eligible.", v17, 2u);
    MEMORY[0x1C18BCB70](v18, -1, -1);
  }

  if ((uint64_t)a3[18] > 4)
  {
    uint64_t v33 = sub_1BFBD2DA8();
    os_log_type_t v34 = sub_1BFBD4A08();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = v43;
    if (v35)
    {
      long long v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v37 = 0;
      _os_log_impl(&dword_1BFA45000, v33, v34, "Credential upload attempts has reached a limit. Will not retry.", v37, 2u);
      MEMORY[0x1C18BCB70](v37, -1, -1);
    }

    uint64_t v31 = (void *)(v36 + 56);
    uint64_t v32 = *(void *)(v36 + 80);
    goto LABEL_23;
  }
  uint64_t result = sub_1BFACB83C((uint64_t)a3, (uint64_t)v13);
  uint64_t v20 = *((void *)v13 + 18);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  uint64_t v23 = v43;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *((void *)v13 + 18) = v22;
    sub_1BFBD1EC8();
    (*(void (**)(char *, char *, uint64_t))(v40 + 40))(&v13[*(int *)(v11 + 40)], v10, v7);
    __swift_project_boxed_opaque_existential_1((void *)(v23 + 56), *(void *)(v23 + 80));
    uint64_t v24 = a3[11];
    uint64_t v41 = a3[10];
    uint64_t v42 = v24;
    swift_bridgeObjectRetain();
    sub_1BFBD46D8();
    swift_bridgeObjectRetain();
    sub_1BFBD46D8();
    swift_bridgeObjectRelease();
    sub_1BFACB048(v41, v42, (uint64_t)v13);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_1BFBB3F88((uint64_t)v13);
  }
  return result;
}

void sub_1BFBB2C78(void *a1)
{
  if (qword_1EBA82A18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1BFBD2DC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBA8EE00);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_1BFBD2DA8();
  os_log_type_t v5 = sub_1BFBD4A08();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_1BFBD50A8();
    sub_1BFA93E54(v8, v9, &v11);
    sub_1BFBD4C08();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BFA45000, oslog, v5, "SIWACredentialUploader failed to uploaded the credential with error. Will not retry: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18BCB70](v7, -1, -1);
    MEMORY[0x1C18BCB70](v6, -1, -1);
  }
  else
  {
  }
}

uint64_t type metadata accessor for SIWACredentialUploader()
{
  return self;
}

uint64_t *sub_1BFBB2E90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    uint64_t *v3 = *a2;
    id v3 = (uint64_t *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    uint64_t v10 = a2[11];
    a1[10] = a2[10];
    a1[11] = v10;
    uint64_t v11 = a2[13];
    a1[12] = a2[12];
    a1[13] = v11;
    uint64_t v12 = a2[15];
    a1[14] = a2[14];
    a1[15] = v12;
    uint64_t v13 = a2[17];
    a1[16] = a2[16];
    a1[17] = v13;
    uint64_t v14 = *(int *)(a3 + 40);
    uint64_t v20 = (char *)a2 + v14;
    uint64_t v19 = (char *)a1 + v14;
    a1[18] = a2[18];
    uint64_t v15 = sub_1BFBD1ED8();
    long long v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v19, v20, v15);
  }
  return v3;
}

uint64_t sub_1BFBB3020(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_1BFBD1ED8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_1BFBB30D8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  uint64_t v13 = *(int *)(a3 + 40);
  long long v18 = (char *)a2 + v13;
  uint64_t v17 = (char *)a1 + v13;
  a1[18] = a2[18];
  uint64_t v14 = sub_1BFBD1ED8();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v17, v18, v14);
  return a1;
}

void *sub_1BFBB3218(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BFBD1ED8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1BFBB33BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a2 + v8;
  uint64_t v10 = a1 + v8;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v11 = sub_1BFBD1ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, v9, v11);
  return a1;
}

void *sub_1BFBB3460(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = a2[17];
  a1[16] = a2[16];
  a1[17] = v14;
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_1BFBD1ED8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t sub_1BFBB3574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBB3588);
}

uint64_t sub_1BFBB3588(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1BFBD1ED8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1BFBB3638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBB364C);
}

uint64_t sub_1BFBB364C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1BFBD1ED8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SiwaCredentialUploadData()
{
  uint64_t result = qword_1EBA88098;
  if (!qword_1EBA88098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BFBB3740()
{
  uint64_t result = sub_1BFBD1ED8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1BFBB37FC()
{
  uint64_t v0 = sub_1BFBD3CE8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_1BFBB4118(0, (unint64_t *)&unk_1EBA885E8, (uint64_t (*)(uint64_t))type metadata accessor for SiwaCredentialUploadData, MEMORY[0x1E4FBB320]);
    sub_1BFBD2CB8();
    sub_1BFA6AE24();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCB10], v0);
    unint64_t v4 = (void *)sub_1BFBD4AA8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    type metadata accessor for SIWACredentialUploader();
    sub_1BFBD2B88();
    swift_release();
    swift_release();
    swift_release();
  }
}

uint64_t sub_1BFBB39EC(uint64_t *a1, void *a2)
{
  uint64_t v36 = *a2;
  long long v37 = a2;
  uint64_t v39 = sub_1BFBD1ED8();
  uint64_t v4 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for SiwaCredentialUploadData();
  uint64_t v7 = MEMORY[0x1F4188790](v38);
  uint64_t v35 = (uint64_t)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)v29 - v11;
  uint64_t result = *a1;
  uint64_t v14 = *(void *)(*a1 + 16);
  if (v14)
  {
    v29[1] = *a1;
    v29[2] = v2;
    uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v16 = result + ((v15 + 32) & ~v15);
    uint64_t v33 = (v15 + 16) & ~v15;
    os_log_type_t v34 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v31 = v15 | 7;
    uint64_t v32 = v33 + v10;
    uint64_t v30 = *(void *)(v9 + 72);
    swift_bridgeObjectRetain();
    v29[3] = MEMORY[0x1E4FBC848] + 8;
    uint64_t v17 = v37;
    while (1)
    {
      sub_1BFACB83C(v16, (uint64_t)v12);
      sub_1BFBD1EC8();
      sub_1BFBD1E48();
      double v19 = v18;
      uint64_t v20 = (*v34)(v6, v39);
      if (v19 <= 60.0) {
        break;
      }
      MEMORY[0x1F4188790](v20);
      v29[-2] = v17;
      v29[-1] = v12;
      sub_1BFBD2CB8();
      uint64_t v21 = v35;
      sub_1BFACB83C((uint64_t)v12, v35);
      uint64_t v22 = swift_allocObject();
      sub_1BFACB9DC(v21, v22 + v33);
      uint64_t v23 = (void *)sub_1BFBD2AF8();
      sub_1BFBD2B88();
      swift_release();
      swift_release();

      uint64_t v24 = (void *)sub_1BFBD2AF8();
      sub_1BFBD2B98();
      swift_release();
      swift_release();

      sub_1BFBB3F88((uint64_t)v12);
      v16 += v30;
      if (!--v14) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    if (qword_1EBA82A18 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1BFBD2DC8();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EBA8EE00);
    uint64_t v26 = sub_1BFBD2DA8();
    os_log_type_t v27 = sub_1BFBD4A18();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1BFA45000, v26, v27, "SIWACredentialUploader is skipping an upload retry attempt because it was tried recently.", v28, 2u);
      MEMORY[0x1C18BCB70](v28, -1, -1);
    }

    return sub_1BFBB3F88((uint64_t)v12);
  }
  return result;
}

void sub_1BFBB3E28()
{
  uint64_t v0 = self;
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  v3[4] = sub_1BFBB3F48;
  v3[5] = v1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 1107296256;
  v3[2] = sub_1BFAAED70;
  v3[3] = &block_descriptor_35;
  uint64_t v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_scheduleLowPriorityBlock_, v2);
  _Block_release(v2);
}

uint64_t sub_1BFBB3F10()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BFBB3F48()
{
}

uint64_t sub_1BFBB3F50()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  return sub_1BFACAD34();
}

uint64_t sub_1BFBB3F88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiwaCredentialUploadData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BFBB3FE4()
{
  uint64_t v1 = (int *)(type metadata accessor for SiwaCredentialUploadData() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[12];
  uint64_t v8 = sub_1BFBD1ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

void sub_1BFBB4118(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BFBB417C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_1BFB76874(a1, a2, a3, a4, *(void *)(v4 + 16), *(uint64_t **)(v4 + 24));
}

void sub_1BFBB4184()
{
  if (!qword_1EA186F20)
  {
    unint64_t v0 = sub_1BFBD2C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA186F20);
    }
  }
}

unint64_t sub_1BFBB41DC()
{
  unint64_t result = qword_1EA186F30;
  if (!qword_1EA186F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F30);
  }
  return result;
}

void sub_1BFBB4230(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFBB41DC();
    unint64_t v7 = a3(a1, &type metadata for SiwaCredentialUploadData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for SiwaCredentialUploadData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBB4360);
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

ValueMetadata *type metadata accessor for SiwaCredentialUploadData.CodingKeys()
{
  return &type metadata for SiwaCredentialUploadData.CodingKeys;
}

unint64_t sub_1BFBB439C()
{
  unint64_t result = qword_1EA186F40;
  if (!qword_1EA186F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F40);
  }
  return result;
}

unint64_t sub_1BFBB43F4()
{
  unint64_t result = qword_1EA186F48;
  if (!qword_1EA186F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F48);
  }
  return result;
}

unint64_t sub_1BFBB444C()
{
  unint64_t result = qword_1EA186F50;
  if (!qword_1EA186F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186F50);
  }
  return result;
}

uint64_t sub_1BFBB44A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69746E6564657263 && a2 == 0xEA00000000006C61;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x496C656E6E616863 && a2 == 0xE900000000000064 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7275507070416E69 && a2 == 0xEF64496573616863 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74706965636572 && a2 == 0xE700000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x744164616F6C7075 && a2 == 0xEE007374706D6574 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BFBF8560)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceed(purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceed(for:transaction:chargeCurrencyCode:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceedOutsideNewsApp(for:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFail(error:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFail(for:transactionState:transactionError:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFailWithInvalidReceipt(for:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t sub_1BFBB485C@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  uint64_t v4 = sub_1BFBD2418();
  MEMORY[0x1F4188790](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA95EF0(0, &qword_1EBA85038);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v6 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA85010);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v7 = (void *)result;
  sub_1BFA4DFE0((uint64_t)a1, (uint64_t)&v13);
  uint64_t v8 = swift_allocObject();
  sub_1BFA6ADEC(&v13, v8 + 16);
  *(void *)&long long v13 = MEMORY[0x1E4FBC860];
  sub_1BFBB5868((unint64_t *)&qword_1EBA83910, MEMORY[0x1E4FAA910]);
  sub_1BFBB58B0(0, (unint64_t *)&unk_1EBA84F00, MEMORY[0x1E4FAA910], MEMORY[0x1E4FBB320]);
  sub_1BFB6EF64();
  sub_1BFBD4C88();
  sub_1BFBB5914();
  swift_allocObject();
  uint64_t v9 = sub_1BFBD2A18();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA95EF0(0, &qword_1EBA88D00);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v10 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88BE0);
  uint64_t result = sub_1BFBD24F8();
  if (v14)
  {
    id v11 = objc_allocWithZone((Class)type metadata accessor for PurchaseManager());
    uint64_t v12 = sub_1BFA7DF84(v6, v7, v9, v10, (uint64_t)&v13);
    swift_unknownObjectRelease();

    swift_release();
    uint64_t result = swift_unknownObjectRelease();
    *a2 = v12;
    a2[1] = (char *)&off_1F1B317C8;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1BFBB4B80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88CA0);
  uint64_t result = sub_1BFBD24F8();
  if (v5) {
    return sub_1BFA6ADEC(&v4, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BFBB4C08@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BFBB4CA4(a1, (uint64_t (*)(void))type metadata accessor for PurchaseContextEntriesManager, (uint64_t (*)(uint64_t))sub_1BFAAD54C, (uint64_t)&off_1F1B333A0, a2);
}

uint64_t sub_1BFBB4C3C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BFBB4CA4(a1, (uint64_t (*)(void))type metadata accessor for PurchaseAdContextEntriesManager, (uint64_t (*)(uint64_t))sub_1BFAEC694, (uint64_t)&off_1F1B35928, a2);
}

uint64_t sub_1BFBB4C70@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BFBB4CA4(a1, (uint64_t (*)(void))type metadata accessor for PaywallShownEntriesManager, (uint64_t (*)(uint64_t))sub_1BFB2D05C, (uint64_t)&off_1F1B37518, a2);
}

uint64_t sub_1BFBB4CA4@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFBB58B0(0, &qword_1EBA89510, MEMORY[0x1E4FAA758], MEMORY[0x1E4FAAFF0]);
  uint64_t result = sub_1BFBD24A8();
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = a2(0);
    swift_allocObject();
    uint64_t result = a3(v10);
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

id sub_1BFBB4DA4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, &qword_1EBA889A0);
  id result = (id)sub_1BFBD24F8();
  if (v7)
  {
    uint64_t v2 = v8;
    int v3 = (objc_class *)type metadata accessor for BridgedFamilyStatusManager();
    long long v4 = (char *)objc_allocWithZone(v3);
    uint64_t v5 = &v4[OBJC_IVAR____TtC16NewsSubscription26BridgedFamilyStatusManager_familyStatusManager];
    *(void *)uint64_t v5 = v7;
    *((void *)v5 + 1) = v2;
    v6.receiver = v4;
    v6.super_class = v3;
    return objc_msgSendSuper2(&v6, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFBB4E54()
{
  type metadata accessor for AppActivationURLHandler();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t sub_1BFBB4E80@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for BundleSubscriptionDetectionManager();
  uint64_t result = sub_1BFBD24E8();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t result = sub_1BFBB5868(&qword_1EBA87AF0, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
    *a2 = v4;
    a2[1] = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFBB4F14(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, &qword_1EBA88BB8);
  uint64_t result = sub_1BFBD24F8();
  uint64_t v2 = v11;
  if (v11)
  {
    uint64_t v3 = v12;
    uint64_t v4 = (objc_class *)type metadata accessor for SubscriptionActivationEligibilityProvider();
    uint64_t v5 = objc_allocWithZone(v4);
    *(void *)&v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers] = MEMORY[0x1E4FBC860];
    v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_didProcessInitialOffer] = 0;
    objc_super v6 = &v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_offerManager];
    void *v6 = v2;
    v6[1] = v3;
    v10.receiver = v5;
    v10.super_class = v4;
    swift_unknownObjectRetain();
    id v7 = objc_msgSendSuper2(&v10, sel_init);
    swift_getObjectType();
    uint64_t v8 = *(void (**)(id, _UNKNOWN **))(v3 + 72);
    id v9 = v7;
    v8(v9, &off_1F1B36850);

    swift_unknownObjectRelease();
    return (uint64_t)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFBB5044(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA95EF0(0, (unint64_t *)&unk_1EBA85060);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA95EF0(0, &qword_1EBA88D00);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA4DF3C(0, &qword_1EBA83790);
  uint64_t result = sub_1BFBD24E8();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, &qword_1EBA894D0);
  uint64_t result = sub_1BFBD24F8();
  if (!v13)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA7F77C(0, &qword_1EBA84560);
  uint64_t result = sub_1BFBD24F8();
  if (v11)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88590);
    sub_1BFBD24F8();
    id v6 = objc_allocWithZone((Class)type metadata accessor for BundleSubscriptionDetectionManager());
    id v7 = sub_1BFBC70DC(v3, v4, v5, (uint64_t)v12, (uint64_t)v10, v8, v9);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    return (uint64_t)v7;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ManagerAssembly()
{
  return self;
}

uint64_t sub_1BFBB52C0()
{
  uint64_t v0 = sub_1BFBD2AC8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2598();
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88BF0);
  sub_1BFBD2938();
  swift_release();
  uint64_t v4 = *MEMORY[0x1E4FAB040];
  uint64_t v5 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  id v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  sub_1BFBD25A8();
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88CA0);
  sub_1BFBD2938();
  swift_release();
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1BFBD2598();
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88CB8);
  sub_1BFBD2938();
  swift_release();
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1BFBD2598();
  sub_1BFA7F77C(0, (unint64_t *)&unk_1EBA88C60);
  sub_1BFBD2938();
  swift_release();
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1BFBD2598();
  type metadata accessor for BridgedFamilyStatusManager();
  sub_1BFBD2928();
  swift_release();
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1BFBD2598();
  type metadata accessor for AppActivationURLHandler();
  sub_1BFBD2928();
  swift_release();
  swift_release();
  sub_1BFBD2598();
  sub_1BFA7F77C(0, &qword_1EBA89518);
  sub_1BFBD2938();
  swift_release();
  v5(v3, v4, v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_1BFBD2598();
  sub_1BFA95EF0(0, &qword_1EBA89770);
  sub_1BFBD2928();
  swift_release();
  swift_release();
  sub_1BFBD25A8();
  type metadata accessor for BundleSubscriptionDetectionManager();
  sub_1BFBD2928();
  swift_release();
  return swift_release();
}

uint64_t sub_1BFBB5828()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1BFBB5860@<X0>(uint64_t a1@<X8>)
{
  return sub_1BFBB4B80((void *)(v1 + 16), a1);
}

uint64_t sub_1BFBB5868(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BFBB58B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1BFBB5914()
{
  if (!qword_1EBA87010)
  {
    sub_1BFA7F77C(255, (unint64_t *)&unk_1EBA88CA0);
    unint64_t v0 = sub_1BFBD2A28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA87010);
    }
  }
}

char *sub_1BFBB5980(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button;
  id v11 = objc_allocWithZone((Class)sub_1BFBD2FE8());
  uint64_t v12 = v4;
  *(void *)&v4[v10] = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel;
  type metadata accessor for UnselectableLinkEnabledTextView();
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v18.receiver = v12;
  v18.super_class = ObjectType;
  uint64_t v14 = (char *)objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v15 = *(void *)&v14[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button];
  uint64_t v16 = v14;
  objc_msgSend(v16, sel_addSubview_, v15);
  objc_msgSend(v16, sel_addSubview_, *(void *)&v16[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel]);

  return v16;
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintFooterView()
{
  return self;
}

id sub_1BFBB5C38()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)sub_1BFBD2FD8();

  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel);
  return objc_msgSend(v3, sel_setDelegate_, 0);
}

void sub_1BFBB5CA0()
{
  sub_1BFBB5D2C(&qword_1EA186E48);
  JUMPOUT(0x1C18BACD0);
}

uint64_t sub_1BFBB5CF8()
{
  return sub_1BFBB5D2C(&qword_1EA186F68);
}

uint64_t sub_1BFBB5D2C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HideMyEmailSignupBlueprintFooterView();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PaywallHostType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_unknownObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for PaywallHostType(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for PaywallHostType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_unknownObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for PaywallHostType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallHostType(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF9 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483642);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 5;
  if (v4 >= 7) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PaywallHostType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallHostType()
{
  return &type metadata for PaywallHostType;
}

uint64_t dispatch thunk of PurchaseOriginatorIdentifier.sourceChannelID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PurchaseOriginatorIdentifier.sessionID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t AMSBuyParams.purchaseID.getter()
{
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_12:
    sub_1BFA5BBF0((uint64_t)&v8);
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1BFBD4568();

  strcpy((char *)&v8, "salableAdamId");
  HIWORD(v8) = -4864;
  sub_1BFBD4D48();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_1BFA5C97C((uint64_t)&v7), (v5 & 1) != 0))
  {
    sub_1BFA5CA14(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1BFA5C9C0((uint64_t)&v7);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_12;
  }
  if (swift_dynamicCast()) {
    return v7;
  }
  else {
    return 0;
  }
}

uint64_t static String.manageSubscriptionURL.getter()
{
  return sub_1BFBB615C((uint64_t *)&unk_1EA186FD0);
}

uint64_t static String.manageSubscriptionURL.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BFBB61C0(a1, a2, qword_1EA186FD0, &qword_1EA186FD0[1]);
}

uint64_t (*static String.manageSubscriptionURL.modify())()
{
  return j__swift_endAccess;
}

uint64_t static String.flexiblePaywall.getter()
{
  return sub_1BFBB615C(&qword_1EA186FE0);
}

uint64_t sub_1BFBB615C(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static String.flexiblePaywall.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BFBB61C0(a1, a2, &qword_1EA186FE0, &qword_1EA186FE8);
}

uint64_t sub_1BFBB61C0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static String.flexiblePaywall.modify())()
{
  return j_j__swift_endAccess;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for HideMyEmailSignupBlueprintHeaderLayoutAttributes(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HideMyEmailSignupBlueprintHeaderLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0;
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
  *(unsigned char *)(result + 128) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HideMyEmailSignupBlueprintHeaderLayoutAttributes()
{
  return &type metadata for HideMyEmailSignupBlueprintHeaderLayoutAttributes;
}

unint64_t PurchaseConversionLocation.pageContext.getter()
{
  unint64_t result = 0x6E776F6E6B6E55;
  switch(*v0)
  {
    case 1:
    case 3:
      unint64_t result = 0x656C6369747241;
      break;
    case 2:
      unint64_t result = 0x6C656E6E616843;
      break;
    case 5:
      unint64_t result = 0x6C63697472416E49;
      break;
    case 6:
      unint64_t result = 0x6441646565466E49;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 9:
      unint64_t result = 0x50676E69646E614CLL;
      break;
    case 0xA:
      unint64_t result = 0x2B7377654ELL;
      break;
    case 0xC:
      unint64_t result = 0x6F69647541;
      break;
    case 0xD:
      unint64_t result = 0x6575737349666450;
      break;
    case 0xE:
      unint64_t result = 0x656C7A7A7550;
      break;
    case 0xF:
      unint64_t result = 0x73614D7961646F54;
      break;
    default:
      return result;
  }
  return result;
}

NewsSubscription::PurchaseConversionLocation_optional __swiftcall PurchaseConversionLocation.init(rawValue:)(Swift::String rawValue)
{
  long long v2 = v1;
  unint64_t v3 = sub_1BFBD4ED8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 16;
  if (v3 < 0x10) {
    char v5 = v3;
  }
  *long long v2 = v5;
  return result;
}

unint64_t PurchaseConversionLocation.rawValue.getter()
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x747241664F706F74;
      break;
    case 2:
      unint64_t result = 0x616843664F706F74;
      break;
    case 3:
      unint64_t result = 0x7779615064726168;
      break;
    case 4:
      unint64_t result = 0x6974737265746E69;
      break;
    case 5:
      unint64_t result = 0x6C63697472416E69;
      break;
    case 6:
      unint64_t result = 0x6441646565466E69;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x50676E69646E616CLL;
      break;
    case 0xA:
      unint64_t result = 0x656E697A6167616DLL;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000012;
      break;
    case 0xC:
      unint64_t result = 0x6565466F69647561;
      break;
    case 0xD:
      unint64_t result = 0x6664506575737369;
      break;
    case 0xE:
      unint64_t result = 0x656C7A7A7570;
      break;
    case 0xF:
      unint64_t result = 0x73614D7961646F74;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFBB6738()
{
  return sub_1BFA5A438();
}

uint64_t sub_1BFBB6744()
{
  return sub_1BFBD5128();
}

uint64_t sub_1BFBB67AC()
{
  PurchaseConversionLocation.rawValue.getter();
  sub_1BFBD4698();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFBB6810()
{
  return sub_1BFBD5128();
}

NewsSubscription::PurchaseConversionLocation_optional sub_1BFBB6874(Swift::String *a1)
{
  return PurchaseConversionLocation.init(rawValue:)(*a1);
}

unint64_t sub_1BFBB6880@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PurchaseConversionLocation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BFBB68A8()
{
  return sub_1BFBD47D8();
}

uint64_t sub_1BFBB6908()
{
  return sub_1BFBD47B8();
}

NewsSubscription::PurchaseUserAction_optional __swiftcall PurchaseUserAction.init(rawValue:)(Swift::String rawValue)
{
  long long v2 = v1;
  unint64_t v3 = sub_1BFBD4ED8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *long long v2 = v5;
  return result;
}

unint64_t PurchaseUserAction.rawValue.getter()
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6B6E694C70656564;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BFBB6A70()
{
  unint64_t result = qword_1EA186FF0;
  if (!qword_1EA186FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186FF0);
  }
  return result;
}

uint64_t sub_1BFBB6AC4(unsigned __int8 *a1, char *a2)
{
  return sub_1BFA5AE88(*a1, *a2);
}

unint64_t sub_1BFBB6AD4()
{
  unint64_t result = qword_1EA186FF8;
  if (!qword_1EA186FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA186FF8);
  }
  return result;
}

uint64_t sub_1BFBB6B28()
{
  return sub_1BFA6BE50();
}

uint64_t sub_1BFBB6B30()
{
  return sub_1BFACF05C();
}

uint64_t sub_1BFBB6B38()
{
  return sub_1BFA6C1BC();
}

NewsSubscription::PurchaseUserAction_optional sub_1BFBB6B40(Swift::String *a1)
{
  return PurchaseUserAction.init(rawValue:)(*a1);
}

unint64_t sub_1BFBB6B4C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PurchaseUserAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BFBB6B74()
{
  return sub_1BFBD47D8();
}

uint64_t sub_1BFBB6BD4()
{
  return sub_1BFBD47B8();
}

uint64_t getEnumTagSinglePayload for PurchaseConversionLocation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF1) {
    goto LABEL_17;
  }
  if (a2 + 15 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 15) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 15;
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
      return (*a1 | (v4 << 8)) - 15;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 15;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x10;
  int v8 = v6 - 16;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PurchaseConversionLocation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *unint64_t result = a2 + 15;
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
        JUMPOUT(0x1BFBB6D80);
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
          *unint64_t result = a2 + 15;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseConversionLocation()
{
  return &type metadata for PurchaseConversionLocation;
}

unsigned char *storeEnumTagSinglePayload for PurchaseUserAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBB6E84);
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

ValueMetadata *type metadata accessor for PurchaseUserAction()
{
  return &type metadata for PurchaseUserAction;
}

unint64_t sub_1BFBB6EBC()
{
  unint64_t result = qword_1EBA821D0;
  if (!qword_1EBA821D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA821D0);
  }
  return result;
}

unint64_t sub_1BFBB6F10()
{
  unint64_t result = qword_1EBA822E0;
  if (!qword_1EBA822E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA822E0);
  }
  return result;
}

unint64_t sub_1BFBB6F64(char a1)
{
  unint64_t result = 0x6573616863727570;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6843656372756F73;
      break;
    case 2:
      unint64_t result = 0x6E656B6F5471;
      break;
    case 3:
      unint64_t result = 0x6E676961706D6163;
      break;
    case 4:
      unint64_t result = 0x6563697270;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0x4664657669727261;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BFBB7060()
{
  return sub_1BFBB6F64(*v0);
}

uint64_t sub_1BFBB7068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBB83CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFBB7090(uint64_t a1)
{
  unint64_t v2 = sub_1BFBB7390();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBB70CC(uint64_t a1)
{
  unint64_t v2 = sub_1BFBB7390();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PurchaseAdContext.encode(to:)(void *a1)
{
  sub_1BFBB7958(0, &qword_1EA187000, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  BOOL v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFBB7390();
  sub_1BFBD5148();
  v9[15] = 0;
  sub_1BFBD4FB8();
  if (!v1)
  {
    v9[14] = 1;
    sub_1BFBD4FB8();
    v9[13] = 2;
    sub_1BFBD4FB8();
    v9[12] = 3;
    sub_1BFBD4F88();
    v9[11] = 4;
    sub_1BFBD4FB8();
    type metadata accessor for PurchaseAdContext();
    v9[10] = 5;
    sub_1BFBD1ED8();
    sub_1BFB427F4((unint64_t *)&unk_1EBA82098);
    sub_1BFBD4FE8();
    v9[9] = 6;
    sub_1BFBD4FC8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BFBB7390()
{
  unint64_t result = qword_1EA187008;
  if (!qword_1EA187008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187008);
  }
  return result;
}

uint64_t type metadata accessor for PurchaseAdContext()
{
  uint64_t result = qword_1EBA84018;
  if (!qword_1EBA84018) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PurchaseAdContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = sub_1BFBD1ED8();
  uint64_t v28 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBB7958(0, &qword_1EA187010, MEMORY[0x1E4FBBDC0]);
  uint64_t v29 = v6;
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)v25 - v7;
  uint64_t v9 = type metadata accessor for PurchaseAdContext();
  MEMORY[0x1F4188790](v9);
  id v11 = (void *)((char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1[3];
  uint64_t v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1BFBB7390();
  uint64_t v13 = v31;
  sub_1BFBD5138();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  uint64_t v31 = v5;
  uint64_t v14 = v27;
  uint64_t v15 = v28;
  char v38 = 0;
  *id v11 = sub_1BFBD4F28();
  v11[1] = v16;
  char v37 = 1;
  void v11[2] = sub_1BFBD4F28();
  v11[3] = v17;
  char v36 = 2;
  v11[4] = sub_1BFBD4F28();
  v11[5] = v18;
  char v35 = 3;
  void v11[6] = sub_1BFBD4EE8();
  v11[7] = v19;
  char v34 = 4;
  v25[1] = 0;
  uint64_t v20 = v15;
  v11[8] = sub_1BFBD4F28();
  v11[9] = v21;
  char v33 = 5;
  sub_1BFB427F4(&qword_1EBA853B8);
  uint64_t v22 = v31;
  sub_1BFBD4F58();
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))((char *)v11 + *(int *)(v9 + 36), v22, v3);
  char v32 = 6;
  uint64_t v23 = v29;
  LOBYTE(v22) = sub_1BFBD4F38();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v23);
  *((unsigned char *)v11 + *(int *)(v9 + 40)) = v22 & 1;
  sub_1BFAEF078((uint64_t)v11, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return sub_1BFB25854((uint64_t)v11);
}

void sub_1BFBB7958(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFBB7390();
    unint64_t v7 = a3(a1, &type metadata for PurchaseAdContext.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BFBB79BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BFBB79D4(void *a1)
{
  return PurchaseAdContext.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for PurchaseAdContext(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v11 = a2[9];
    uint64_t v12 = *(int *)(a3 + 36);
    uint64_t v17 = (char *)a2 + v12;
    uint64_t v18 = (char *)a1 + v12;
    a1[8] = a2[8];
    a1[9] = v11;
    uint64_t v13 = sub_1BFBD1ED8();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v18, v17, v13);
    *((unsigned char *)v4 + *(int *)(a3 + 40)) = *((unsigned char *)a2 + *(int *)(a3 + 40));
  }
  return v4;
}

uint64_t destroy for PurchaseAdContext(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_1BFBD1ED8();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for PurchaseAdContext(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v9 = a2[9];
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v14 = (char *)a2 + v10;
  uint64_t v15 = (char *)a1 + v10;
  a1[8] = a2[8];
  a1[9] = v9;
  uint64_t v11 = sub_1BFBD1ED8();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v15, v14, v11);
  *((unsigned char *)a1 + *(int *)(a3 + 40)) = *((unsigned char *)a2 + *(int *)(a3 + 40));
  return a1;
}

void *assignWithCopy for PurchaseAdContext(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BFBD1ED8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 40)) = *((unsigned char *)a2 + *(int *)(a3 + 40));
  return a1;
}

_OWORD *initializeWithTake for PurchaseAdContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1BFBD1ED8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(a3 + 40)) = *((unsigned char *)a2 + *(int *)(a3 + 40));
  return a1;
}

void *assignWithTake for PurchaseAdContext(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_1BFBD1ED8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *((unsigned char *)a1 + *(int *)(a3 + 40)) = *((unsigned char *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseAdContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBB7FA4);
}

uint64_t sub_1BFBB7FA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1BFBD1ED8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseAdContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBB8068);
}

uint64_t sub_1BFBB8068(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1BFBD1ED8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1BFBB8110()
{
  uint64_t result = sub_1BFBD1ED8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PurchaseAdContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1BFBB828CLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseAdContext.CodingKeys()
{
  return &type metadata for PurchaseAdContext.CodingKeys;
}

unint64_t sub_1BFBB82C8()
{
  unint64_t result = qword_1EA187018;
  if (!qword_1EA187018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187018);
  }
  return result;
}

unint64_t sub_1BFBB8320()
{
  unint64_t result = qword_1EA187020;
  if (!qword_1EA187020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187020);
  }
  return result;
}

unint64_t sub_1BFBB8378()
{
  unint64_t result = qword_1EA187028;
  if (!qword_1EA187028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187028);
  }
  return result;
}

uint64_t sub_1BFBB83CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6573616863727570 && a2 == 0xEA00000000004449;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6843656372756F73 && a2 == 0xEF44496C656E6E61 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656B6F5471 && a2 == 0xE600000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E676961706D6163 && a2 == 0xEA00000000004449 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6563697270 && a2 == 0xE500000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001BFBF86D0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4664657669727261 && a2 == 0xED000064416D6F72)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t destroy for PaywallConfig(void *a1)
{
  if (*a1 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[13] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[26] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[39] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[52] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PaywallConfig(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
  }
  else
  {
    uint64_t v7 = *(void *)(a2 + 8);
    uint64_t v8 = *(void *)(a2 + 16);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v9 = *(void *)(a2 + 24);
    uint64_t v10 = *(void *)(a2 + 32);
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v9;
    uint64_t v11 = *(void *)(a2 + 40);
    uint64_t v12 = *(void *)(a2 + 48);
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v11;
    uint64_t v13 = *(void *)(a2 + 56);
    uint64_t v14 = *(void *)(a2 + 64);
    *(void *)(a1 + 48) = v12;
    *(void *)(a1 + 56) = v13;
    uint64_t v15 = *(void *)(a2 + 80);
    uint64_t v74 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = v74;
    uint64_t v16 = *(void *)(a2 + 88);
    uint64_t v79 = *(void *)(a2 + 96);
    *(void *)(a1 + 80) = v15;
    *(void *)(a1 + 88) = v16;
    *(void *)(a1 + 96) = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v17 = *(void *)(a2 + 104);
  if (v17 == 1)
  {
    long long v18 = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v18;
    *(void *)(a1 + 200) = *(void *)(a2 + 200);
    long long v19 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v19;
    long long v20 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v20;
  }
  else
  {
    uint64_t v21 = *(void *)(a2 + 112);
    uint64_t v22 = *(void *)(a2 + 120);
    *(void *)(a1 + 104) = v17;
    *(void *)(a1 + 112) = v21;
    uint64_t v23 = *(void *)(a2 + 128);
    uint64_t v24 = *(void *)(a2 + 136);
    *(void *)(a1 + 120) = v22;
    *(void *)(a1 + 128) = v23;
    uint64_t v25 = *(void *)(a2 + 144);
    uint64_t v26 = *(void *)(a2 + 152);
    *(void *)(a1 + 136) = v24;
    *(void *)(a1 + 144) = v25;
    uint64_t v27 = *(void *)(a2 + 160);
    uint64_t v28 = *(void *)(a2 + 168);
    *(void *)(a1 + 152) = v26;
    *(void *)(a1 + 160) = v27;
    uint64_t v29 = *(void *)(a2 + 184);
    uint64_t v75 = *(void *)(a2 + 176);
    *(void *)(a1 + 168) = v28;
    *(void *)(a1 + 176) = v75;
    uint64_t v30 = *(void *)(a2 + 192);
    uint64_t v80 = *(void *)(a2 + 200);
    *(void *)(a1 + 184) = v29;
    *(void *)(a1 + 192) = v30;
    *(void *)(a1 + 200) = v80;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v31 = *(void *)(a2 + 208);
  if (v31 == 1)
  {
    long long v32 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v32;
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    long long v33 = *(_OWORD *)(a2 + 224);
    *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 224) = v33;
    long long v34 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v34;
  }
  else
  {
    uint64_t v35 = *(void *)(a2 + 216);
    uint64_t v36 = *(void *)(a2 + 224);
    *(void *)(a1 + 208) = v31;
    *(void *)(a1 + 216) = v35;
    uint64_t v37 = *(void *)(a2 + 232);
    uint64_t v38 = *(void *)(a2 + 240);
    *(void *)(a1 + 224) = v36;
    *(void *)(a1 + 232) = v37;
    uint64_t v39 = *(void *)(a2 + 248);
    uint64_t v40 = *(void *)(a2 + 256);
    *(void *)(a1 + 240) = v38;
    *(void *)(a1 + 248) = v39;
    uint64_t v41 = *(void *)(a2 + 264);
    uint64_t v42 = *(void *)(a2 + 272);
    *(void *)(a1 + 256) = v40;
    *(void *)(a1 + 264) = v41;
    uint64_t v43 = *(void *)(a2 + 288);
    uint64_t v76 = *(void *)(a2 + 280);
    *(void *)(a1 + 272) = v42;
    *(void *)(a1 + 280) = v76;
    uint64_t v44 = *(void *)(a2 + 296);
    uint64_t v81 = *(void *)(a2 + 304);
    *(void *)(a1 + 288) = v43;
    *(void *)(a1 + 296) = v44;
    *(void *)(a1 + 304) = v81;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v45 = *(void *)(a2 + 312);
  if (v45 == 1)
  {
    long long v46 = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 392) = v46;
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    long long v47 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
    *(_OWORD *)(a1 + 328) = v47;
    long long v48 = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
    *(_OWORD *)(a1 + 360) = v48;
  }
  else
  {
    uint64_t v49 = *(void *)(a2 + 320);
    uint64_t v50 = *(void *)(a2 + 328);
    *(void *)(a1 + 312) = v45;
    *(void *)(a1 + 320) = v49;
    uint64_t v51 = *(void *)(a2 + 336);
    uint64_t v52 = *(void *)(a2 + 344);
    *(void *)(a1 + 328) = v50;
    *(void *)(a1 + 336) = v51;
    uint64_t v53 = *(void *)(a2 + 352);
    uint64_t v54 = *(void *)(a2 + 360);
    *(void *)(a1 + 344) = v52;
    *(void *)(a1 + 352) = v53;
    uint64_t v55 = *(void *)(a2 + 368);
    uint64_t v56 = *(void *)(a2 + 376);
    *(void *)(a1 + 360) = v54;
    *(void *)(a1 + 368) = v55;
    uint64_t v57 = *(void *)(a2 + 392);
    uint64_t v77 = *(void *)(a2 + 384);
    *(void *)(a1 + 376) = v56;
    *(void *)(a1 + 384) = v77;
    uint64_t v58 = *(void *)(a2 + 400);
    uint64_t v82 = *(void *)(a2 + 408);
    *(void *)(a1 + 392) = v57;
    *(void *)(a1 + 400) = v58;
    *(void *)(a1 + 408) = v82;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v59 = *(void *)(a2 + 416);
  if (v59 == 1)
  {
    long long v60 = *(_OWORD *)(a2 + 496);
    *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 496) = v60;
    *(void *)(a1 + 512) = *(void *)(a2 + 512);
    long long v61 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v61;
    long long v62 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v62;
  }
  else
  {
    uint64_t v63 = *(void *)(a2 + 424);
    uint64_t v64 = *(void *)(a2 + 432);
    *(void *)(a1 + 416) = v59;
    *(void *)(a1 + 424) = v63;
    uint64_t v65 = *(void *)(a2 + 440);
    uint64_t v66 = *(void *)(a2 + 448);
    *(void *)(a1 + 432) = v64;
    *(void *)(a1 + 440) = v65;
    uint64_t v67 = *(void *)(a2 + 456);
    uint64_t v68 = *(void *)(a2 + 464);
    *(void *)(a1 + 448) = v66;
    *(void *)(a1 + 456) = v67;
    uint64_t v69 = *(void *)(a2 + 472);
    uint64_t v70 = *(void *)(a2 + 480);
    *(void *)(a1 + 464) = v68;
    *(void *)(a1 + 472) = v69;
    uint64_t v71 = *(void *)(a2 + 496);
    uint64_t v78 = *(void *)(a2 + 488);
    *(void *)(a1 + 480) = v70;
    *(void *)(a1 + 488) = v78;
    uint64_t v72 = *(void *)(a2 + 504);
    uint64_t v83 = *(void *)(a2 + 512);
    *(void *)(a1 + 496) = v71;
    *(void *)(a1 + 504) = v72;
    *(void *)(a1 + 512) = v83;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 520) = *(void *)(a2 + 520);
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PaywallConfig(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *a2;
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)a2;
      long long v7 = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(_OWORD *)(a1 + 32) = v7;
      *(_OWORD *)a1 = v6;
      long long v8 = *((_OWORD *)a2 + 3);
      long long v9 = *((_OWORD *)a2 + 4);
      long long v10 = *((_OWORD *)a2 + 5);
      *(void *)(a1 + 96) = a2[12];
      *(_OWORD *)(a1 + 64) = v9;
      *(_OWORD *)(a1 + 80) = v10;
      *(_OWORD *)(a1 + 48) = v8;
    }
    else
    {
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = a2[1];
      *(void *)(a1 + 16) = a2[2];
      *(void *)(a1 + 24) = a2[3];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = a2[5];
      *(void *)(a1 + 48) = a2[6];
      *(void *)(a1 + 56) = a2[7];
      *(void *)(a1 + 64) = a2[8];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = a2[10];
      *(void *)(a1 + 88) = a2[11];
      *(void *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v5 == 1)
  {
    sub_1BFBB9B60(a1);
    long long v12 = *((_OWORD *)a2 + 1);
    long long v11 = *((_OWORD *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    *(_OWORD *)(a1 + 32) = v11;
    long long v14 = *((_OWORD *)a2 + 4);
    long long v13 = *((_OWORD *)a2 + 5);
    long long v15 = *((_OWORD *)a2 + 3);
    *(void *)(a1 + 96) = a2[12];
    *(_OWORD *)(a1 + 64) = v14;
    *(_OWORD *)(a1 + 80) = v13;
    *(_OWORD *)(a1 + 48) = v15;
  }
  else
  {
    *(void *)a1 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 8) = a2[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 24) = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 32) = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 48) = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 56) = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 64) = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 96) = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = (long long *)(a1 + 104);
  long long v18 = (long long *)(a2 + 13);
  uint64_t v17 = a2[13];
  if (*(void *)(a1 + 104) == 1)
  {
    if (v17 == 1)
    {
      long long v19 = *v18;
      long long v20 = *(_OWORD *)(a2 + 17);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
      *(_OWORD *)(a1 + 136) = v20;
      *uint64_t v16 = v19;
      long long v21 = *(_OWORD *)(a2 + 19);
      long long v22 = *(_OWORD *)(a2 + 21);
      long long v23 = *(_OWORD *)(a2 + 23);
      *(void *)(a1 + 200) = a2[25];
      *(_OWORD *)(a1 + 168) = v22;
      *(_OWORD *)(a1 + 184) = v23;
      *(_OWORD *)(a1 + 152) = v21;
    }
    else
    {
      *(void *)(a1 + 104) = v17;
      *(void *)(a1 + 112) = a2[14];
      *(void *)(a1 + 120) = a2[15];
      *(void *)(a1 + 128) = a2[16];
      *(void *)(a1 + 136) = a2[17];
      *(void *)(a1 + 144) = a2[18];
      *(void *)(a1 + 152) = a2[19];
      *(void *)(a1 + 160) = a2[20];
      *(void *)(a1 + 168) = a2[21];
      *(void *)(a1 + 176) = a2[22];
      *(void *)(a1 + 184) = a2[23];
      *(void *)(a1 + 192) = a2[24];
      *(void *)(a1 + 200) = a2[25];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v17 == 1)
  {
    sub_1BFBB9B60(a1 + 104);
    long long v25 = *(_OWORD *)(a2 + 15);
    long long v24 = *(_OWORD *)(a2 + 17);
    *uint64_t v16 = *v18;
    *(_OWORD *)(a1 + 120) = v25;
    *(_OWORD *)(a1 + 136) = v24;
    long long v27 = *(_OWORD *)(a2 + 21);
    long long v26 = *(_OWORD *)(a2 + 23);
    long long v28 = *(_OWORD *)(a2 + 19);
    *(void *)(a1 + 200) = a2[25];
    *(_OWORD *)(a1 + 168) = v27;
    *(_OWORD *)(a1 + 184) = v26;
    *(_OWORD *)(a1 + 152) = v28;
  }
  else
  {
    *(void *)(a1 + 104) = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 112) = a2[14];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 120) = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 128) = a2[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 136) = a2[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 144) = a2[18];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 152) = a2[19];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 160) = a2[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 168) = a2[21];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 176) = a2[22];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 184) = a2[23];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 192) = a2[24];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 200) = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v29 = (long long *)(a1 + 208);
  uint64_t v31 = (long long *)(a2 + 26);
  uint64_t v30 = a2[26];
  if (*(void *)(a1 + 208) == 1)
  {
    if (v30 == 1)
    {
      long long v32 = *v31;
      long long v33 = *((_OWORD *)a2 + 15);
      *(_OWORD *)(a1 + 224) = *((_OWORD *)a2 + 14);
      *(_OWORD *)(a1 + 240) = v33;
      *uint64_t v29 = v32;
      long long v34 = *((_OWORD *)a2 + 16);
      long long v35 = *((_OWORD *)a2 + 17);
      long long v36 = *((_OWORD *)a2 + 18);
      *(void *)(a1 + 304) = a2[38];
      *(_OWORD *)(a1 + 272) = v35;
      *(_OWORD *)(a1 + 288) = v36;
      *(_OWORD *)(a1 + 256) = v34;
    }
    else
    {
      *(void *)(a1 + 208) = v30;
      *(void *)(a1 + 216) = a2[27];
      *(void *)(a1 + 224) = a2[28];
      *(void *)(a1 + 232) = a2[29];
      *(void *)(a1 + 240) = a2[30];
      *(void *)(a1 + 248) = a2[31];
      *(void *)(a1 + 256) = a2[32];
      *(void *)(a1 + 264) = a2[33];
      *(void *)(a1 + 272) = a2[34];
      *(void *)(a1 + 280) = a2[35];
      *(void *)(a1 + 288) = a2[36];
      *(void *)(a1 + 296) = a2[37];
      *(void *)(a1 + 304) = a2[38];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v30 == 1)
  {
    sub_1BFBB9B60(a1 + 208);
    long long v38 = *((_OWORD *)a2 + 14);
    long long v37 = *((_OWORD *)a2 + 15);
    *uint64_t v29 = *v31;
    *(_OWORD *)(a1 + 224) = v38;
    *(_OWORD *)(a1 + 240) = v37;
    long long v40 = *((_OWORD *)a2 + 17);
    long long v39 = *((_OWORD *)a2 + 18);
    long long v41 = *((_OWORD *)a2 + 16);
    *(void *)(a1 + 304) = a2[38];
    *(_OWORD *)(a1 + 272) = v40;
    *(_OWORD *)(a1 + 288) = v39;
    *(_OWORD *)(a1 + 256) = v41;
  }
  else
  {
    *(void *)(a1 + 208) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 216) = a2[27];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 224) = a2[28];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 232) = a2[29];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 240) = a2[30];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 248) = a2[31];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 256) = a2[32];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 264) = a2[33];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 272) = a2[34];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 280) = a2[35];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 288) = a2[36];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 296) = a2[37];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 304) = a2[38];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v42 = (long long *)(a1 + 312);
  uint64_t v43 = (long long *)(a2 + 39);
  uint64_t v44 = a2[39];
  if (*(void *)(a1 + 312) == 1)
  {
    if (v44 == 1)
    {
      long long v45 = *v43;
      long long v46 = *(_OWORD *)(a2 + 43);
      *(_OWORD *)(a1 + 328) = *(_OWORD *)(a2 + 41);
      *(_OWORD *)(a1 + 344) = v46;
      *uint64_t v42 = v45;
      long long v47 = *(_OWORD *)(a2 + 45);
      long long v48 = *(_OWORD *)(a2 + 47);
      long long v49 = *(_OWORD *)(a2 + 49);
      *(void *)(a1 + 408) = a2[51];
      *(_OWORD *)(a1 + 376) = v48;
      *(_OWORD *)(a1 + 392) = v49;
      *(_OWORD *)(a1 + 360) = v47;
    }
    else
    {
      *(void *)(a1 + 312) = v44;
      *(void *)(a1 + 320) = a2[40];
      *(void *)(a1 + 328) = a2[41];
      *(void *)(a1 + 336) = a2[42];
      *(void *)(a1 + 344) = a2[43];
      *(void *)(a1 + 352) = a2[44];
      *(void *)(a1 + 360) = a2[45];
      *(void *)(a1 + 368) = a2[46];
      *(void *)(a1 + 376) = a2[47];
      *(void *)(a1 + 384) = a2[48];
      *(void *)(a1 + 392) = a2[49];
      *(void *)(a1 + 400) = a2[50];
      *(void *)(a1 + 408) = a2[51];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v44 == 1)
  {
    sub_1BFBB9B60(a1 + 312);
    long long v51 = *(_OWORD *)(a2 + 41);
    long long v50 = *(_OWORD *)(a2 + 43);
    *uint64_t v42 = *v43;
    *(_OWORD *)(a1 + 328) = v51;
    *(_OWORD *)(a1 + 344) = v50;
    long long v53 = *(_OWORD *)(a2 + 47);
    long long v52 = *(_OWORD *)(a2 + 49);
    long long v54 = *(_OWORD *)(a2 + 45);
    *(void *)(a1 + 408) = a2[51];
    *(_OWORD *)(a1 + 376) = v53;
    *(_OWORD *)(a1 + 392) = v52;
    *(_OWORD *)(a1 + 360) = v54;
  }
  else
  {
    *(void *)(a1 + 312) = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 320) = a2[40];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 328) = a2[41];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 336) = a2[42];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 344) = a2[43];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 352) = a2[44];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 360) = a2[45];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 368) = a2[46];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 376) = a2[47];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 384) = a2[48];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 392) = a2[49];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 400) = a2[50];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 408) = a2[51];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v55 = (long long *)(a1 + 416);
  uint64_t v56 = (long long *)(a2 + 52);
  uint64_t v57 = a2[52];
  if (*(void *)(a1 + 416) == 1)
  {
    if (v57 == 1)
    {
      long long v58 = *v56;
      long long v59 = *((_OWORD *)a2 + 28);
      *(_OWORD *)(a1 + 432) = *((_OWORD *)a2 + 27);
      *(_OWORD *)(a1 + 448) = v59;
      *uint64_t v55 = v58;
      long long v60 = *((_OWORD *)a2 + 29);
      long long v61 = *((_OWORD *)a2 + 30);
      long long v62 = *((_OWORD *)a2 + 31);
      *(void *)(a1 + 512) = a2[64];
      *(_OWORD *)(a1 + 480) = v61;
      *(_OWORD *)(a1 + 496) = v62;
      *(_OWORD *)(a1 + 464) = v60;
    }
    else
    {
      *(void *)(a1 + 416) = v57;
      *(void *)(a1 + 424) = a2[53];
      *(void *)(a1 + 432) = a2[54];
      *(void *)(a1 + 440) = a2[55];
      *(void *)(a1 + 448) = a2[56];
      *(void *)(a1 + 456) = a2[57];
      *(void *)(a1 + 464) = a2[58];
      *(void *)(a1 + 472) = a2[59];
      *(void *)(a1 + 480) = a2[60];
      *(void *)(a1 + 488) = a2[61];
      *(void *)(a1 + 496) = a2[62];
      *(void *)(a1 + 504) = a2[63];
      *(void *)(a1 + 512) = a2[64];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v57 == 1)
  {
    sub_1BFBB9B60(a1 + 416);
    long long v64 = *((_OWORD *)a2 + 27);
    long long v63 = *((_OWORD *)a2 + 28);
    *uint64_t v55 = *v56;
    *(_OWORD *)(a1 + 432) = v64;
    *(_OWORD *)(a1 + 448) = v63;
    long long v66 = *((_OWORD *)a2 + 30);
    long long v65 = *((_OWORD *)a2 + 31);
    long long v67 = *((_OWORD *)a2 + 29);
    *(void *)(a1 + 512) = a2[64];
    *(_OWORD *)(a1 + 480) = v66;
    *(_OWORD *)(a1 + 496) = v65;
    *(_OWORD *)(a1 + 464) = v67;
  }
  else
  {
    *(void *)(a1 + 416) = v57;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 424) = a2[53];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 432) = a2[54];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 440) = a2[55];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 448) = a2[56];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 456) = a2[57];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 464) = a2[58];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 472) = a2[59];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 480) = a2[60];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 488) = a2[61];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 496) = a2[62];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 504) = a2[63];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 512) = a2[64];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(void *)(a1 + 520) = a2[65];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 528) = a2[66];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BFBB9B60(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy536_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x218uLL);
}

uint64_t assignWithTake for PaywallConfig(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == 1) {
    goto LABEL_4;
  }
  if (*(void *)a2 == 1)
  {
    sub_1BFBB9B60(a1);
LABEL_4:
    long long v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v7 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104) == 1)
  {
LABEL_9:
    long long v8 = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v8;
    *(void *)(a1 + 200) = *(void *)(a2 + 200);
    long long v9 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v9;
    long long v10 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v10;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_1BFBB9B60(a1 + 104);
    goto LABEL_9;
  }
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRelease();
LABEL_11:
  uint64_t v11 = *(void *)(a2 + 208);
  if (*(void *)(a1 + 208) == 1)
  {
LABEL_14:
    long long v12 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v12;
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    long long v13 = *(_OWORD *)(a2 + 224);
    *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 224) = v13;
    long long v14 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v14;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    sub_1BFBB9B60(a1 + 208);
    goto LABEL_14;
  }
  *(void *)(a1 + 208) = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  swift_bridgeObjectRelease();
LABEL_16:
  if (*(void *)(a1 + 312) == 1)
  {
LABEL_19:
    long long v16 = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 392) = v16;
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    long long v17 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
    *(_OWORD *)(a1 + 328) = v17;
    long long v18 = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
    *(_OWORD *)(a1 + 360) = v18;
    goto LABEL_21;
  }
  uint64_t v15 = *(void *)(a2 + 312);
  if (v15 == 1)
  {
    sub_1BFBB9B60(a1 + 312);
    goto LABEL_19;
  }
  *(void *)(a1 + 312) = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRelease();
LABEL_21:
  if (*(void *)(a1 + 416) != 1)
  {
    uint64_t v19 = *(void *)(a2 + 416);
    if (v19 != 1)
    {
      *(void *)(a1 + 416) = v19;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 424) = *(void *)(a2 + 424);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 432) = *(void *)(a2 + 432);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 440) = *(void *)(a2 + 440);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 464) = *(void *)(a2 + 464);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 472) = *(void *)(a2 + 472);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 480) = *(void *)(a2 + 480);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 488) = *(void *)(a2 + 488);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 496) = *(void *)(a2 + 496);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 504) = *(void *)(a2 + 504);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 512) = *(void *)(a2 + 512);
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    sub_1BFBB9B60(a1 + 416);
  }
  long long v20 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 496) = v20;
  *(void *)(a1 + 512) = *(void *)(a2 + 512);
  long long v21 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v21;
  long long v22 = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 464) = v22;
LABEL_26:
  *(void *)(a1 + 520) = *(void *)(a2 + 520);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallConfig(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 536)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 520);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PaywallConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
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
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 536) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 536) = 0;
    }
    if (a2) {
      *(void *)(result + 520) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallConfig()
{
  return &type metadata for PaywallConfig;
}

uint64_t destroy for PaywallResourceByLocationConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PaywallResourceByLocationConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PaywallResourceByLocationConfig(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PaywallResourceByLocationConfig(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallResourceByLocationConfig(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 104)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PaywallResourceByLocationConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallResourceByLocationConfig()
{
  return &type metadata for PaywallResourceByLocationConfig;
}

uint64_t sub_1BFBBA71C(long long *a1)
{
  memcpy(v74, v1, sizeof(v74));
  sub_1BFBC0FB8(0, &qword_1EBA85648, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, MEMORY[0x1E4FBB718]);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v4);
  long long v8 = (uint64_t *)((char *)&v31 - v7);
  long long v9 = a1[7];
  long long v10 = a1[5];
  long long v70 = a1[6];
  long long v71 = v9;
  long long v11 = a1[7];
  long long v12 = a1[9];
  long long v72 = a1[8];
  long long v73 = v12;
  long long v13 = a1[3];
  long long v14 = a1[1];
  long long v66 = a1[2];
  long long v67 = v13;
  long long v15 = a1[3];
  long long v16 = a1[5];
  long long v68 = a1[4];
  long long v69 = v16;
  long long v17 = a1[1];
  long long v64 = *a1;
  long long v65 = v17;
  v63[6] = v70;
  v63[7] = v11;
  long long v18 = a1[9];
  v63[8] = v72;
  v63[9] = v18;
  v63[2] = v66;
  v63[3] = v15;
  v63[4] = v68;
  v63[5] = v10;
  v63[0] = v64;
  v63[1] = v14;
  sub_1BFBBE6A8(&v64, (uint64_t)v1, (uint64_t)v42);
  sub_1BFBC0350(v63, (uint64_t)v42, v43);
  sub_1BFAE4D9C((uint64_t)v42);
  sub_1BFBC0DEC((uint64_t)v43, (uint64_t)v54, (unint64_t *)&unk_1EBA863A0);
  if (*(void *)&v54[0] != 1)
  {
    long long v60 = v54[4];
    long long v61 = v54[5];
    uint64_t v62 = v55;
    long long v56 = v54[0];
    long long v57 = v54[1];
    long long v59 = v54[3];
    long long v58 = v54[2];
    uint64_t v19 = sub_1BFBBE8BC((uint64_t)&v64);
    sub_1BFBC0E58(v43, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE5150);
    if (v19)
    {
      uint64_t v20 = type metadata accessor for PaywallResource();
      sub_1BFBC4E18(&qword_1EBA855F8, (void (*)(uint64_t))type metadata accessor for PaywallResource);
      sub_1BFBD4858();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v8, 1, v20) != 1)
      {
        uint64_t v27 = *v8;
        uint64_t v28 = v8[1];
        swift_bridgeObjectRetain();
        sub_1BFBBEE64((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for PaywallResource);
        if (qword_1EBA876C0 == -1) {
          goto LABEL_15;
        }
        goto LABEL_17;
      }
      sub_1BFBBDF88((uint64_t)v8);
    }
  }
  long long v37 = v70;
  long long v38 = v71;
  long long v39 = v72;
  long long v40 = v73;
  long long v33 = v66;
  long long v34 = v67;
  long long v35 = v68;
  long long v36 = v69;
  long long v31 = v64;
  long long v32 = v65;
  memcpy(v41, v74, sizeof(v41));
  nullsub_1(v41);
  sub_1BFBC0DEC((uint64_t)v41, (uint64_t)v63, &qword_1EBA87120);
  sub_1BFBC0350(&v31, (uint64_t)v63, v44);
  sub_1BFBC0DEC((uint64_t)v44, (uint64_t)v45, (unint64_t *)&unk_1EBA863A0);
  if (*(void *)&v45[0] == 1) {
    goto LABEL_9;
  }
  long long v51 = v45[4];
  long long v52 = v45[5];
  uint64_t v53 = v46;
  long long v47 = v45[0];
  long long v48 = v45[1];
  long long v50 = v45[3];
  long long v49 = v45[2];
  uint64_t v21 = sub_1BFBBE8BC((uint64_t)&v64);
  sub_1BFBC0E58(v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE5150);
  if (!v21) {
    goto LABEL_9;
  }
  uint64_t v22 = type metadata accessor for PaywallResource();
  sub_1BFBC4E18(&qword_1EBA855F8, (void (*)(uint64_t))type metadata accessor for PaywallResource);
  sub_1BFBD4858();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v6, 1, v22) != 1)
  {
    uint64_t v27 = *v6;
    uint64_t v28 = v6[1];
    swift_bridgeObjectRetain();
    sub_1BFBBEE64((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PaywallResource);
    if (qword_1EBA876C0 == -1)
    {
LABEL_15:
      sub_1BFBC0FB8(0, (unint64_t *)&qword_1EBA85100, (uint64_t (*)(uint64_t))sub_1BFA6FDD8, MEMORY[0x1E4FBBE00]);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_1BFBD78F0;
      *(void *)(v29 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v29 + 64) = sub_1BFA4DEE8();
      *(void *)(v29 + 32) = v27;
      *(void *)(v29 + 40) = v28;
      swift_bridgeObjectRetain();
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      swift_bridgeObjectRelease();
      return v27;
    }
LABEL_17:
    swift_once();
    goto LABEL_15;
  }
  sub_1BFBBDF88((uint64_t)v6);
LABEL_9:
  if (qword_1EBA876C0 != -1) {
    swift_once();
  }
  sub_1BFBC0FB8(0, (unint64_t *)&qword_1EBA85100, (uint64_t (*)(uint64_t))sub_1BFA6FDD8, MEMORY[0x1E4FBBE00]);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1BFBD78F0;
  long long v37 = v70;
  long long v38 = v71;
  long long v39 = v72;
  long long v40 = v73;
  long long v33 = v66;
  long long v34 = v67;
  long long v35 = v68;
  long long v36 = v69;
  long long v31 = v64;
  long long v32 = v65;
  uint64_t v24 = PaywallModel.description.getter();
  uint64_t v26 = v25;
  *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v23 + 64) = sub_1BFA4DEE8();
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 40) = v26;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1BFBBAEB4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v418 = a1;
  sub_1BFBC0FB8(0, &qword_1EBA85648, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  v417 = (char *)&v342 - v4;
  uint64_t v420 = type metadata accessor for PaywallResource();
  uint64_t v343 = *(void *)(v420 - 8);
  MEMORY[0x1F4188790](v420);
  v419 = (uint64_t *)((char *)&v342 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BFBBDF20();
  uint64_t v362 = v6;
  uint64_t v7 = (void *)swift_allocObject();
  sub_1BFBC0DEC(v2, (uint64_t)v428, (unint64_t *)&unk_1EBA863A0);
  v416 = v7 + 4;
  sub_1BFBC0DEC((uint64_t)v428, (uint64_t)(v7 + 4), (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v2 + 104, (uint64_t)v427, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v427, (uint64_t)(v7 + 17), (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v2 + 208, (uint64_t)v426, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v426, (uint64_t)(v7 + 30), (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v2 + 312, (uint64_t)v425, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v425, (uint64_t)(v7 + 43), (unint64_t *)&unk_1EBA863A0);
  uint64_t v344 = v2;
  sub_1BFBC0DEC(v2 + 416, (uint64_t)v424, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v424, (uint64_t)(v7 + 56), (unint64_t *)&unk_1EBA863A0);
  unint64_t v8 = v7[4];
  uint64_t v415 = v7[5];
  uint64_t v9 = v7[6];
  uint64_t v413 = v7[7];
  v412 = (void *)v7[8];
  uint64_t v411 = v7[9];
  v410 = (void *)v7[10];
  unint64_t v10 = v7[12];
  v414 = (void *)v7[11];
  unint64_t v12 = v7[13];
  uint64_t v11 = v7[14];
  unint64_t v13 = v7[15];
  uint64_t v14 = v7[16];
  long long v15 = sub_1BFAE4CA8;
  sub_1BFBC0E58(v428, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v427, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v426, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v425, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v424, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  if (v8 != 1)
  {
    uint64_t v404 = v14;
    uint64_t v405 = v13;
    uint64_t v406 = v11;
    unint64_t v407 = v12;
    unint64_t v408 = v10;
    uint64_t v409 = v9;
    unint64_t v17 = (unint64_t)v412;
    uint64_t v18 = v411;
    uint64_t v19 = v410;
    sub_1BFAE4CA8(v8);
    long long v16 = sub_1BFA5C038(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v13 = v16[2];
    unint64_t v20 = v16[3];
    long long v15 = (void *)(v13 + 1);
    if (v13 >= v20 >> 1) {
      goto LABEL_144;
    }
    goto LABEL_4;
  }
  long long v16 = (void *)MEMORY[0x1E4FBC860];
LABEL_5:
  uint64_t v18 = v7[17];
  if (v18 != 1)
  {
    uint64_t v27 = v7[18];
    uint64_t v28 = v7[19];
    uint64_t v29 = v7[20];
    uint64_t v405 = v7[21];
    uint64_t v30 = v7[23];
    uint64_t v404 = v7[22];
    uint64_t v31 = v7[24];
    uint64_t v406 = v7[25];
    uint64_t v32 = v7[26];
    unint64_t v407 = v7[27];
    unint64_t v33 = v7[29];
    uint64_t v415 = v7[28];
    unint64_t v408 = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v414 = (void *)v27;
    swift_bridgeObjectRetain();
    uint64_t v413 = v28;
    swift_bridgeObjectRetain();
    uint64_t v411 = v29;
    uint64_t v34 = v30;
    uint64_t v35 = v405;
    uint64_t v36 = v404;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v410 = (void *)v34;
    swift_bridgeObjectRetain();
    v412 = (void *)v31;
    unint64_t v8 = v406;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v409 = v32;
    unint64_t v37 = v407;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v16 = sub_1BFA5C038(0, v16[2] + 1, 1, v16);
    }
    unint64_t v13 = v16[2];
    unint64_t v38 = v16[3];
    long long v15 = (void *)(v13 + 1);
    if (v13 >= v38 >> 1) {
      long long v16 = sub_1BFA5C038((void *)(v38 > 1), v13 + 1, 1, v16);
    }
    v16[2] = v15;
    long long v39 = &v16[13 * v13];
    uint64_t v40 = (uint64_t)v414;
    v39[4] = v18;
    v39[5] = v40;
    uint64_t v41 = v411;
    v39[6] = v413;
    v39[7] = v41;
    v39[8] = v35;
    v39[9] = v36;
    uint64_t v42 = (uint64_t)v412;
    v39[10] = v410;
    v39[11] = v42;
    uint64_t v43 = v409;
    v39[12] = v8;
    v39[13] = v43;
    uint64_t v44 = v415;
    v39[14] = v37;
    v39[15] = v44;
    v39[16] = v408;
  }
  uint64_t v45 = v7[30];
  if (v45 != 1)
  {
    uint64_t v46 = v7[31];
    uint64_t v47 = v7[32];
    uint64_t v48 = v7[33];
    uint64_t v405 = v7[34];
    uint64_t v49 = v7[36];
    uint64_t v404 = v7[35];
    uint64_t v50 = v7[37];
    uint64_t v406 = v7[38];
    uint64_t v51 = v7[39];
    unint64_t v407 = v7[40];
    unint64_t v52 = v7[42];
    uint64_t v415 = v7[41];
    unint64_t v408 = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v414 = (void *)v46;
    swift_bridgeObjectRetain();
    uint64_t v413 = v47;
    swift_bridgeObjectRetain();
    uint64_t v411 = v48;
    uint64_t v53 = v405;
    uint64_t v54 = v49;
    uint64_t v18 = v404;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v410 = (void *)v54;
    swift_bridgeObjectRetain();
    v412 = (void *)v50;
    unint64_t v8 = v406;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v409 = v51;
    unint64_t v55 = v407;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v16 = sub_1BFA5C038(0, v16[2] + 1, 1, v16);
    }
    unint64_t v13 = v16[2];
    unint64_t v56 = v16[3];
    long long v15 = (void *)(v13 + 1);
    if (v13 >= v56 >> 1) {
      long long v16 = sub_1BFA5C038((void *)(v56 > 1), v13 + 1, 1, v16);
    }
    v16[2] = v15;
    long long v57 = &v16[13 * v13];
    uint64_t v58 = (uint64_t)v414;
    v57[4] = v45;
    v57[5] = v58;
    uint64_t v59 = v411;
    v57[6] = v413;
    v57[7] = v59;
    v57[8] = v53;
    v57[9] = v18;
    uint64_t v60 = (uint64_t)v412;
    v57[10] = v410;
    v57[11] = v60;
    uint64_t v61 = v409;
    v57[12] = v8;
    v57[13] = v61;
    uint64_t v62 = v415;
    v57[14] = v55;
    v57[15] = v62;
    v57[16] = v408;
  }
  uint64_t v63 = v7[43];
  if (v63 != 1)
  {
    uint64_t v64 = v7[44];
    uint64_t v65 = v7[45];
    uint64_t v66 = v7[46];
    uint64_t v405 = v7[47];
    uint64_t v67 = v7[49];
    uint64_t v404 = v7[48];
    uint64_t v68 = v7[50];
    uint64_t v406 = v7[51];
    uint64_t v69 = v7[52];
    unint64_t v407 = v7[53];
    unint64_t v70 = v7[55];
    uint64_t v415 = v7[54];
    unint64_t v408 = v70;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v414 = (void *)v64;
    swift_bridgeObjectRetain();
    uint64_t v413 = v65;
    swift_bridgeObjectRetain();
    uint64_t v411 = v66;
    uint64_t v71 = v405;
    uint64_t v72 = v67;
    uint64_t v18 = v404;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v410 = (void *)v72;
    swift_bridgeObjectRetain();
    v412 = (void *)v68;
    unint64_t v8 = v406;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v409 = v69;
    unint64_t v73 = v407;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v16 = sub_1BFA5C038(0, v16[2] + 1, 1, v16);
    }
    unint64_t v13 = v16[2];
    unint64_t v74 = v16[3];
    long long v15 = (void *)(v13 + 1);
    if (v13 >= v74 >> 1) {
      long long v16 = sub_1BFA5C038((void *)(v74 > 1), v13 + 1, 1, v16);
    }
    v16[2] = v15;
    uint64_t v75 = &v16[13 * v13];
    uint64_t v76 = (uint64_t)v414;
    v75[4] = v63;
    v75[5] = v76;
    uint64_t v77 = v411;
    v75[6] = v413;
    v75[7] = v77;
    v75[8] = v71;
    v75[9] = v18;
    uint64_t v78 = (uint64_t)v412;
    v75[10] = v410;
    v75[11] = v78;
    uint64_t v79 = v409;
    v75[12] = v8;
    v75[13] = v79;
    uint64_t v80 = v415;
    v75[14] = v73;
    v75[15] = v80;
    v75[16] = v408;
  }
  uint64_t v19 = (void *)v7[56];
  if (v19 != (void *)1)
  {
    uint64_t v81 = v7[57];
    uint64_t v82 = v7[58];
    uint64_t v83 = v7[59];
    uint64_t v405 = v7[60];
    uint64_t v84 = v7[62];
    uint64_t v404 = v7[61];
    uint64_t v85 = v7[63];
    uint64_t v406 = v7[64];
    uint64_t v86 = v7[65];
    unint64_t v407 = v7[66];
    uint64_t v415 = v7[67];
    unint64_t v408 = v7[68];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v414 = (void *)v81;
    swift_bridgeObjectRetain();
    uint64_t v413 = v82;
    swift_bridgeObjectRetain();
    uint64_t v411 = v83;
    uint64_t v87 = v405;
    uint64_t v88 = v84;
    uint64_t v18 = v404;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v410 = (void *)v88;
    swift_bridgeObjectRetain();
    v412 = (void *)v85;
    unint64_t v8 = v406;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v409 = v86;
    unint64_t v89 = v407;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v16 = sub_1BFA5C038(0, v16[2] + 1, 1, v16);
    }
    unint64_t v13 = v16[2];
    unint64_t v90 = v16[3];
    long long v15 = (void *)(v13 + 1);
    if (v13 >= v90 >> 1) {
      long long v16 = sub_1BFA5C038((void *)(v90 > 1), v13 + 1, 1, v16);
    }
    v16[2] = v15;
    v91 = &v16[13 * v13];
    uint64_t v92 = (uint64_t)v414;
    v91[4] = v19;
    v91[5] = v92;
    uint64_t v93 = v411;
    v91[6] = v413;
    v91[7] = v93;
    v91[8] = v87;
    v91[9] = v18;
    uint64_t v94 = (uint64_t)v412;
    v91[10] = v410;
    v91[11] = v94;
    uint64_t v95 = v409;
    v91[12] = v8;
    v91[13] = v95;
    uint64_t v96 = v415;
    v91[14] = v89;
    v91[15] = v96;
    v91[16] = v408;
  }
  swift_setDeallocating();
  sub_1BFB89B90(0, (unint64_t *)&unk_1EBA863A0);
  uint64_t v348 = v97;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v423 = v16;
  uint64_t v7 = *(void **)(v344 + 520);
  long long v16 = (void *)v420;
  if (v7)
  {
    uint64_t v98 = v7[8];
    v345 = v7 + 8;
    uint64_t v99 = 1 << *((unsigned char *)v7 + 32);
    uint64_t v100 = -1;
    if (v99 < 64) {
      uint64_t v100 = ~(-1 << v99);
    }
    unint64_t v17 = v100 & v98;
    int64_t v346 = (unint64_t)(v99 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    int64_t v101 = 0;
    v347 = v7;
    while (1)
    {
      if (v17)
      {
        uint64_t v360 = (v17 - 1) & v17;
        int64_t v361 = v101;
        unint64_t v108 = __clz(__rbit64(v17)) | (v101 << 6);
      }
      else
      {
        unint64_t v20 = v101 + 1;
        if (__OFADD__(v101, 1))
        {
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if ((uint64_t)v20 >= v346) {
          goto LABEL_81;
        }
        unint64_t v109 = v345[v20];
        int64_t v110 = v101 + 1;
        if (!v109)
        {
          int64_t v110 = v101 + 2;
          if (v101 + 2 >= v346) {
            goto LABEL_81;
          }
          unint64_t v109 = v345[v110];
          if (!v109)
          {
            int64_t v110 = v101 + 3;
            if (v101 + 3 >= v346) {
              goto LABEL_81;
            }
            unint64_t v109 = v345[v110];
            if (!v109)
            {
              int64_t v110 = v101 + 4;
              if (v101 + 4 >= v346) {
                goto LABEL_81;
              }
              unint64_t v109 = v345[v110];
              if (!v109)
              {
                unint64_t v20 = v101 + 5;
                if (v101 + 5 >= v346)
                {
LABEL_81:
                  swift_release();
                  swift_bridgeObjectRelease();
                  break;
                }
                unint64_t v109 = v345[v20];
                if (!v109)
                {
                  while (1)
                  {
                    int64_t v110 = v20 + 1;
                    if (__OFADD__(v20, 1)) {
                      break;
                    }
                    if (v110 >= v346) {
                      goto LABEL_81;
                    }
                    unint64_t v109 = v345[v110];
                    ++v20;
                    if (v109) {
                      goto LABEL_52;
                    }
                  }
LABEL_142:
                  __break(1u);
                  goto LABEL_143;
                }
                int64_t v110 = v101 + 5;
              }
            }
          }
        }
LABEL_52:
        uint64_t v360 = (v109 - 1) & v109;
        int64_t v361 = v110;
        unint64_t v108 = __clz(__rbit64(v109)) + (v110 << 6);
      }
      v111 = (uint64_t *)(v7[7] + 536 * v108);
      v414 = (void *)*v111;
      uint64_t v112 = v111[1];
      uint64_t v415 = v111[2];
      uint64_t v113 = v111[3];
      uint64_t v357 = v111[4];
      uint64_t v358 = v113;
      uint64_t v367 = v111[5];
      uint64_t v114 = v111[6];
      uint64_t v365 = v112;
      uint64_t v366 = v114;
      uint64_t v115 = v111[7];
      v416 = (void *)v111[8];
      uint64_t v413 = v111[9];
      v412 = (void *)v111[10];
      uint64_t v116 = v111[12];
      uint64_t v363 = v111[11];
      unint64_t v364 = v115;
      uint64_t v117 = v111[13];
      v389 = (void *)v111[14];
      unint64_t v390 = v117;
      uint64_t v118 = v111[15];
      int64_t v387 = v111[16];
      *(void *)&long long v388 = v118;
      uint64_t v119 = v111[17];
      uint64_t v385 = v111[18];
      v386 = (void *)v119;
      uint64_t v120 = v111[19];
      uint64_t v383 = v111[20];
      uint64_t v384 = v120;
      uint64_t v376 = v111[21];
      uint64_t v373 = v111[22];
      uint64_t v371 = v111[23];
      uint64_t v121 = v111[24];
      uint64_t v368 = v111[25];
      uint64_t v369 = v121;
      uint64_t v122 = v111[26];
      v397 = (void *)v111[27];
      *(void *)&long long v398 = v122;
      uint64_t v123 = v111[28];
      uint64_t v395 = v111[29];
      uint64_t v396 = v123;
      uint64_t v124 = v111[30];
      uint64_t v393 = v111[31];
      uint64_t v394 = v124;
      uint64_t v125 = v111[32];
      uint64_t v391 = v111[33];
      uint64_t v392 = v125;
      uint64_t v380 = v111[34];
      uint64_t v378 = v111[35];
      uint64_t v375 = v111[36];
      uint64_t v372 = v111[37];
      uint64_t v370 = v111[38];
      uint64_t v406 = v111[39];
      uint64_t v405 = v111[40];
      uint64_t v404 = v111[41];
      uint64_t v126 = v111[42];
      uint64_t v402 = v111[43];
      uint64_t v403 = v126;
      uint64_t v127 = v111[44];
      uint64_t v400 = v111[45];
      unint64_t v401 = v127;
      uint64_t v399 = v111[46];
      uint64_t v128 = v111[47];
      uint64_t v381 = v111[48];
      uint64_t v382 = v128;
      uint64_t v379 = v111[49];
      uint64_t v377 = v111[50];
      uint64_t v374 = v111[51];
      uint64_t v411 = v111[52];
      v410 = (void *)v111[53];
      uint64_t v409 = v111[54];
      unint64_t v408 = v111[55];
      unint64_t v8 = v111[57];
      unint64_t v407 = v111[56];
      uint64_t v129 = v111[58];
      uint64_t v130 = v111[59];
      uint64_t v131 = v111[60];
      long long v15 = (void *)v111[61];
      unint64_t v13 = v111[62];
      uint64_t v132 = v111[63];
      uint64_t v133 = v111[64];
      v134 = (void *)swift_allocObject();
      uint64_t v135 = v413;
      v136 = v416;
      uint64_t v137 = (uint64_t)v414;
      uint64_t v139 = v363;
      unint64_t v138 = v364;
      uint64_t v141 = v366;
      uint64_t v140 = v367;
      uint64_t v143 = v357;
      unint64_t v142 = v358;
      uint64_t v144 = v415;
      uint64_t v145 = v116;
      uint64_t v146 = v365;
      v147 = v134;
      v134[4] = v414;
      v359 = v134 + 4;
      uint64_t v148 = (uint64_t)v412;
      v134[5] = v146;
      v134[6] = v144;
      v134[7] = v142;
      v134[8] = v143;
      v134[9] = v140;
      v134[10] = v141;
      v134[11] = v138;
      v134[12] = v136;
      v134[13] = v135;
      v134[14] = v148;
      v134[15] = v139;
      v134[16] = v145;
      v149 = v389;
      v134[17] = v390;
      v134[18] = v149;
      int64_t v150 = v387;
      v134[19] = v388;
      v134[20] = v150;
      uint64_t v151 = v385;
      v134[21] = v386;
      v134[22] = v151;
      uint64_t v152 = v383;
      v134[23] = v384;
      v134[24] = v152;
      uint64_t v153 = v373;
      v134[25] = v376;
      v134[26] = v153;
      uint64_t v154 = v369;
      v134[27] = v371;
      v134[28] = v154;
      uint64_t v155 = v398;
      v134[29] = v368;
      v134[30] = v155;
      uint64_t v156 = v396;
      v134[31] = v397;
      v134[32] = v156;
      uint64_t v157 = v394;
      v134[33] = v395;
      v134[34] = v157;
      uint64_t v158 = v392;
      v134[35] = v393;
      v134[36] = v158;
      uint64_t v159 = v380;
      v134[37] = v391;
      v134[38] = v159;
      uint64_t v160 = v375;
      v134[39] = v378;
      v134[40] = v160;
      uint64_t v161 = v370;
      v134[41] = v372;
      v134[42] = v161;
      uint64_t v162 = v405;
      v134[43] = v406;
      v134[44] = v162;
      uint64_t v163 = v403;
      v134[45] = v404;
      v134[46] = v163;
      unint64_t v164 = v401;
      v134[47] = v402;
      v134[48] = v164;
      uint64_t v165 = v399;
      v134[49] = v400;
      v134[50] = v165;
      uint64_t v166 = v381;
      v134[51] = v382;
      v134[52] = v166;
      uint64_t v167 = v377;
      v134[53] = v379;
      v134[54] = v167;
      uint64_t v168 = v411;
      v134[55] = v374;
      v134[56] = v168;
      uint64_t v169 = v409;
      v134[57] = v410;
      v134[58] = v169;
      unint64_t v170 = v407;
      v134[59] = v408;
      v134[60] = v170;
      uint64_t v355 = v129;
      unint64_t v356 = v8;
      v134[61] = v8;
      v134[62] = v129;
      uint64_t v353 = v131;
      uint64_t v354 = v130;
      v134[63] = v130;
      v134[64] = v131;
      unint64_t v351 = v13;
      v352 = v15;
      v134[65] = v15;
      v134[66] = v13;
      uint64_t v349 = v133;
      uint64_t v350 = v132;
      v134[67] = v132;
      v134[68] = v133;
      if (v137 == 1)
      {
        sub_1BFAE4CA8(1);
        sub_1BFAE4CA8(v390);
        sub_1BFAE4CA8(v398);
        sub_1BFAE4CA8(v406);
        sub_1BFAE4CA8(v411);
        uint64_t v19 = (void *)MEMORY[0x1E4FBC860];
        long long v16 = (void *)v420;
      }
      else
      {
        unint64_t v8 = v138;
        uint64_t v171 = v143;
        unint64_t v172 = v142;
        uint64_t v173 = v145;
        sub_1BFAE4CA8(v137);
        sub_1BFAE4CA8(v390);
        sub_1BFAE4CA8(v398);
        sub_1BFAE4CA8(v406);
        sub_1BFAE4CA8(v411);
        uint64_t v411 = v173;
        uint64_t v174 = v415;
        unint64_t v13 = v172;
        uint64_t v175 = v171;
        sub_1BFAE4CA8((uint64_t)v414);
        uint64_t v19 = sub_1BFA5C038(0, 1, 1, MEMORY[0x1E4FBC860]);
        unint64_t v177 = v19[2];
        unint64_t v176 = v19[3];
        long long v15 = (void *)(v177 + 1);
        if (v177 >= v176 >> 1) {
          uint64_t v19 = sub_1BFA5C038((void *)(v176 > 1), v177 + 1, 1, v19);
        }
        long long v16 = (void *)v420;
        v19[2] = v15;
        v178 = &v19[13 * v177];
        uint64_t v179 = v365;
        v178[4] = v414;
        v178[5] = v179;
        v178[6] = v174;
        v178[7] = v13;
        uint64_t v180 = v367;
        v178[8] = v175;
        v178[9] = v180;
        unint64_t v181 = v364;
        v178[10] = v366;
        v178[11] = v181;
        uint64_t v182 = v413;
        v178[12] = v416;
        v178[13] = v182;
        uint64_t v183 = v363;
        v178[14] = v412;
        v178[15] = v183;
        v178[16] = v411;
      }
      uint64_t v184 = v147[17];
      if (v184 != 1)
      {
        uint64_t v185 = v147[18];
        uint64_t v186 = v147[19];
        uint64_t v187 = v147[20];
        uint64_t v406 = v147[21];
        uint64_t v188 = v147[23];
        uint64_t v405 = v147[22];
        uint64_t v189 = v147[24];
        unint64_t v407 = v147[25];
        uint64_t v190 = v147[26];
        unint64_t v408 = v147[27];
        uint64_t v191 = v147[29];
        v416 = (void *)v147[28];
        uint64_t v409 = v191;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v415 = v185;
        swift_bridgeObjectRetain();
        v414 = (void *)v186;
        swift_bridgeObjectRetain();
        v412 = (void *)v187;
        uint64_t v192 = v406;
        uint64_t v193 = v188;
        uint64_t v194 = v405;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v411 = v193;
        swift_bridgeObjectRetain();
        uint64_t v413 = v189;
        unint64_t v8 = v407;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v410 = (void *)v190;
        unint64_t v195 = v408;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_1BFA5C038(0, v19[2] + 1, 1, v19);
        }
        unint64_t v13 = v19[2];
        unint64_t v196 = v19[3];
        long long v15 = (void *)(v13 + 1);
        if (v13 >= v196 >> 1) {
          uint64_t v19 = sub_1BFA5C038((void *)(v196 > 1), v13 + 1, 1, v19);
        }
        v19[2] = v15;
        v197 = &v19[13 * v13];
        uint64_t v198 = v415;
        v197[4] = v184;
        v197[5] = v198;
        uint64_t v199 = (uint64_t)v412;
        v197[6] = v414;
        v197[7] = v199;
        v197[8] = v192;
        v197[9] = v194;
        uint64_t v200 = v413;
        v197[10] = v411;
        v197[11] = v200;
        uint64_t v201 = (uint64_t)v410;
        v197[12] = v8;
        v197[13] = v201;
        v202 = v416;
        v197[14] = v195;
        v197[15] = v202;
        v197[16] = v409;
        long long v16 = (void *)v420;
      }
      uint64_t v203 = v147[30];
      if (v203 != 1)
      {
        uint64_t v204 = v147[31];
        uint64_t v205 = v147[32];
        uint64_t v206 = v147[33];
        uint64_t v406 = v147[34];
        uint64_t v207 = v147[36];
        uint64_t v405 = v147[35];
        uint64_t v208 = v147[37];
        unint64_t v407 = v147[38];
        uint64_t v209 = v147[39];
        unint64_t v408 = v147[40];
        uint64_t v210 = v147[42];
        v416 = (void *)v147[41];
        uint64_t v409 = v210;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v415 = v204;
        swift_bridgeObjectRetain();
        v414 = (void *)v205;
        swift_bridgeObjectRetain();
        v412 = (void *)v206;
        uint64_t v211 = v406;
        uint64_t v212 = v207;
        uint64_t v213 = v405;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v411 = v212;
        swift_bridgeObjectRetain();
        uint64_t v413 = v208;
        unint64_t v8 = v407;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v410 = (void *)v209;
        unint64_t v214 = v408;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_1BFA5C038(0, v19[2] + 1, 1, v19);
        }
        unint64_t v13 = v19[2];
        unint64_t v215 = v19[3];
        long long v15 = (void *)(v13 + 1);
        if (v13 >= v215 >> 1) {
          uint64_t v19 = sub_1BFA5C038((void *)(v215 > 1), v13 + 1, 1, v19);
        }
        v19[2] = v15;
        v216 = &v19[13 * v13];
        uint64_t v217 = v415;
        v216[4] = v203;
        v216[5] = v217;
        uint64_t v218 = (uint64_t)v412;
        v216[6] = v414;
        v216[7] = v218;
        v216[8] = v211;
        v216[9] = v213;
        uint64_t v219 = v413;
        v216[10] = v411;
        v216[11] = v219;
        uint64_t v220 = (uint64_t)v410;
        v216[12] = v8;
        v216[13] = v220;
        v221 = v416;
        v216[14] = v214;
        v216[15] = v221;
        v216[16] = v409;
        long long v16 = (void *)v420;
      }
      uint64_t v222 = v147[43];
      if (v222 != 1)
      {
        uint64_t v223 = v147[44];
        uint64_t v224 = v147[45];
        uint64_t v225 = v147[46];
        uint64_t v406 = v147[47];
        uint64_t v226 = v147[49];
        uint64_t v405 = v147[48];
        uint64_t v227 = v147[50];
        unint64_t v407 = v147[51];
        uint64_t v228 = v147[52];
        unint64_t v408 = v147[53];
        uint64_t v229 = v147[55];
        v416 = (void *)v147[54];
        uint64_t v409 = v229;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v415 = v223;
        swift_bridgeObjectRetain();
        v414 = (void *)v224;
        swift_bridgeObjectRetain();
        v412 = (void *)v225;
        uint64_t v230 = v406;
        uint64_t v231 = v226;
        uint64_t v232 = v405;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v411 = v231;
        swift_bridgeObjectRetain();
        uint64_t v413 = v227;
        unint64_t v8 = v407;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v410 = (void *)v228;
        unint64_t v233 = v408;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_1BFA5C038(0, v19[2] + 1, 1, v19);
        }
        unint64_t v13 = v19[2];
        unint64_t v234 = v19[3];
        long long v15 = (void *)(v13 + 1);
        if (v13 >= v234 >> 1) {
          uint64_t v19 = sub_1BFA5C038((void *)(v234 > 1), v13 + 1, 1, v19);
        }
        v19[2] = v15;
        v235 = &v19[13 * v13];
        uint64_t v236 = v415;
        v235[4] = v222;
        v235[5] = v236;
        uint64_t v237 = (uint64_t)v412;
        v235[6] = v414;
        v235[7] = v237;
        v235[8] = v230;
        v235[9] = v232;
        uint64_t v238 = v413;
        v235[10] = v411;
        v235[11] = v238;
        uint64_t v239 = (uint64_t)v410;
        v235[12] = v8;
        v235[13] = v239;
        v240 = v416;
        v235[14] = v233;
        v235[15] = v240;
        v235[16] = v409;
        long long v16 = (void *)v420;
      }
      uint64_t v18 = v147[56];
      if (v18 != 1)
      {
        uint64_t v241 = v147[57];
        uint64_t v242 = v147[58];
        uint64_t v243 = v147[59];
        uint64_t v406 = v147[60];
        uint64_t v244 = v147[62];
        uint64_t v405 = v147[61];
        uint64_t v245 = v147[63];
        unint64_t v407 = v147[64];
        uint64_t v246 = v147[65];
        unint64_t v408 = v147[66];
        v416 = (void *)v147[67];
        uint64_t v409 = v147[68];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v415 = v241;
        swift_bridgeObjectRetain();
        v414 = (void *)v242;
        swift_bridgeObjectRetain();
        v412 = (void *)v243;
        uint64_t v247 = v406;
        uint64_t v248 = v244;
        uint64_t v249 = v405;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v411 = v248;
        swift_bridgeObjectRetain();
        uint64_t v413 = v245;
        unint64_t v8 = v407;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v410 = (void *)v246;
        unint64_t v250 = v408;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_1BFA5C038(0, v19[2] + 1, 1, v19);
        }
        unint64_t v13 = v19[2];
        unint64_t v251 = v19[3];
        long long v15 = (void *)(v13 + 1);
        if (v13 >= v251 >> 1) {
          uint64_t v19 = sub_1BFA5C038((void *)(v251 > 1), v13 + 1, 1, v19);
        }
        v19[2] = v15;
        v102 = &v19[13 * v13];
        uint64_t v103 = v415;
        v102[4] = v18;
        v102[5] = v103;
        uint64_t v104 = (uint64_t)v412;
        v102[6] = v414;
        v102[7] = v104;
        v102[8] = v247;
        v102[9] = v249;
        uint64_t v105 = v413;
        v102[10] = v411;
        v102[11] = v105;
        uint64_t v106 = (uint64_t)v410;
        v102[12] = v8;
        v102[13] = v106;
        v107 = v416;
        v102[14] = v250;
        v102[15] = v107;
        v102[16] = v409;
        long long v16 = (void *)v420;
      }
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_1BFBBEB54((uint64_t)v19);
      uint64_t v7 = v347;
      unint64_t v17 = v360;
      int64_t v101 = v361;
    }
  }
  uint64_t v7 = *(void **)(v344 + 528);
  if (v7)
  {
    uint64_t v252 = v7[8];
    v386 = v7 + 8;
    uint64_t v253 = 1 << *((unsigned char *)v7 + 32);
    uint64_t v254 = -1;
    if (v253 < 64) {
      uint64_t v254 = ~(-1 << v253);
    }
    unint64_t v17 = v254 & v252;
    int64_t v387 = (unint64_t)(v253 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    uint64_t v255 = 0;
    long long v388 = xmmword_1BFBD7990;
    v389 = v7;
    while (1)
    {
      if (v17)
      {
        unint64_t v390 = (v17 - 1) & v17;
        uint64_t v391 = v255;
        unint64_t v262 = __clz(__rbit64(v17)) | (v255 << 6);
      }
      else
      {
        unint64_t v20 = v255 + 1;
        if (__OFADD__(v255, 1)) {
          goto LABEL_141;
        }
        if ((uint64_t)v20 >= v387)
        {
LABEL_117:
          swift_release();
          swift_bridgeObjectRelease();
          break;
        }
        unint64_t v263 = v386[v20];
        int64_t v264 = v255 + 1;
        if (!v263)
        {
          int64_t v264 = v255 + 2;
          if (v255 + 2 >= v387) {
            goto LABEL_117;
          }
          unint64_t v263 = v386[v264];
          if (!v263)
          {
            int64_t v264 = v255 + 3;
            if (v255 + 3 >= v387) {
              goto LABEL_117;
            }
            unint64_t v263 = v386[v264];
            if (!v263)
            {
              int64_t v264 = v255 + 4;
              if (v255 + 4 >= v387) {
                goto LABEL_117;
              }
              unint64_t v263 = v386[v264];
              if (!v263)
              {
                unint64_t v20 = v255 + 5;
                if (v255 + 5 >= v387) {
                  goto LABEL_117;
                }
                unint64_t v263 = v386[v20];
                if (!v263)
                {
                  while (1)
                  {
                    int64_t v264 = v20 + 1;
                    if (__OFADD__(v20, 1)) {
                      break;
                    }
                    if (v264 >= v387) {
                      goto LABEL_117;
                    }
                    unint64_t v263 = v386[v264];
                    ++v20;
                    if (v263) {
                      goto LABEL_105;
                    }
                  }
LABEL_143:
                  __break(1u);
LABEL_144:
                  long long v16 = sub_1BFA5C038((void *)(v20 > 1), (int64_t)v15, 1, v16);
LABEL_4:
                  v16[2] = v15;
                  uint64_t v21 = &v16[13 * v13];
                  uint64_t v22 = v415;
                  v21[4] = v8;
                  v21[5] = v22;
                  uint64_t v23 = v413;
                  v21[6] = v409;
                  v21[7] = v23;
                  v21[8] = v17;
                  v21[9] = v18;
                  uint64_t v24 = (uint64_t)v414;
                  v21[10] = v19;
                  v21[11] = v24;
                  unint64_t v25 = v407;
                  v21[12] = v408;
                  v21[13] = v25;
                  uint64_t v26 = v405;
                  v21[14] = v406;
                  v21[15] = v26;
                  v21[16] = v404;
                  goto LABEL_5;
                }
                int64_t v264 = v255 + 5;
              }
            }
          }
        }
LABEL_105:
        unint64_t v390 = (v263 - 1) & v263;
        uint64_t v391 = v264;
        unint64_t v262 = __clz(__rbit64(v263)) + (v264 << 6);
      }
      v265 = (uint64_t *)(v7[7] + 536 * v262);
      v412 = (void *)*v265;
      uint64_t v406 = v265[1];
      v414 = (void *)v265[2];
      uint64_t v415 = v265[3];
      v416 = (void *)v265[4];
      uint64_t v404 = v265[5];
      uint64_t v405 = v265[6];
      uint64_t v393 = v265[7];
      uint64_t v413 = v265[8];
      uint64_t v411 = v265[9];
      uint64_t v266 = v265[10];
      uint64_t v267 = v265[12];
      uint64_t v402 = v265[11];
      uint64_t v403 = v266;
      v410 = (void *)v265[26];
      uint64_t v409 = v265[27];
      unint64_t v408 = v265[28];
      unint64_t v13 = v265[30];
      unint64_t v407 = v265[29];
      uint64_t v268 = v265[31];
      uint64_t v392 = v265[32];
      uint64_t v269 = v265[33];
      uint64_t v270 = v265[34];
      uint64_t v19 = (void *)v265[35];
      uint64_t v18 = v265[36];
      uint64_t v271 = v265[37];
      uint64_t v272 = v265[38];
      uint64_t inited = swift_initStackObject();
      uint64_t v275 = v402;
      uint64_t v274 = v403;
      uint64_t v276 = v411;
      uint64_t v277 = v404;
      v278 = v416;
      uint64_t v279 = v415;
      uint64_t v280 = (uint64_t)v412;
      uint64_t v281 = (uint64_t)v414;
      uint64_t v282 = v267;
      uint64_t v283 = v413;
      uint64_t v284 = v393;
      uint64_t v285 = v405;
      uint64_t v286 = v406;
      v287 = (void *)inited;
      *(_OWORD *)(inited + 16) = v388;
      *(void *)(inited + 32) = v280;
      *(void *)(inited + 40) = v286;
      *(void *)(inited + 48) = v281;
      *(void *)(inited + 56) = v279;
      *(void *)(inited + 64) = v278;
      *(void *)(inited + 72) = v277;
      *(void *)(inited + 80) = v285;
      *(void *)(inited + 88) = v284;
      *(void *)(inited + 96) = v283;
      *(void *)(inited + 104) = v276;
      *(void *)(inited + 112) = v274;
      *(void *)(inited + 120) = v275;
      uint64_t v288 = (uint64_t)v410;
      *(void *)(inited + 128) = v282;
      *(void *)(inited + 136) = v288;
      unint64_t v289 = v408;
      *(void *)(inited + 144) = v409;
      *(void *)(inited + 152) = v289;
      *(void *)(inited + 160) = v407;
      *(void *)(inited + 168) = v13;
      uint64_t v400 = v268;
      unint64_t v401 = v13;
      *(void *)(inited + 176) = v268;
      *(void *)(inited + 184) = v392;
      *(void *)(inited + 192) = v269;
      uint64_t v399 = v269;
      v397 = v19;
      *(void *)&long long v398 = v270;
      *(void *)(inited + 200) = v270;
      *(void *)(inited + 208) = v19;
      uint64_t v395 = v271;
      uint64_t v396 = v18;
      *(void *)(inited + 216) = v18;
      *(void *)(inited + 224) = v271;
      uint64_t v394 = v272;
      *(void *)(inited + 232) = v272;
      if (v280 == 1)
      {
        sub_1BFAE4CA8(1);
        sub_1BFAE4CA8((uint64_t)v410);
        long long v15 = (void *)MEMORY[0x1E4FBC860];
      }
      else
      {
        uint64_t v18 = v284;
        uint64_t v290 = v282;
        sub_1BFAE4CA8(v280);
        sub_1BFAE4CA8((uint64_t)v410);
        v410 = (void *)v290;
        uint64_t v19 = v414;
        uint64_t v291 = v415;
        v292 = v416;
        sub_1BFAE4CA8((uint64_t)v412);
        long long v15 = sub_1BFA5C038(0, 1, 1, MEMORY[0x1E4FBC860]);
        unint64_t v294 = v15[2];
        unint64_t v293 = v15[3];
        unint64_t v13 = v294 + 1;
        if (v294 >= v293 >> 1) {
          long long v15 = sub_1BFA5C038((void *)(v293 > 1), v294 + 1, 1, v15);
        }
        void v15[2] = v13;
        v295 = &v15[13 * v294];
        uint64_t v296 = v406;
        v295[4] = v412;
        v295[5] = v296;
        v295[6] = v19;
        v295[7] = v291;
        uint64_t v297 = v404;
        v295[8] = v292;
        v295[9] = v297;
        v295[10] = v405;
        v295[11] = v18;
        uint64_t v298 = v411;
        v295[12] = v413;
        v295[13] = v298;
        uint64_t v299 = v402;
        v295[14] = v403;
        v295[15] = v299;
        v295[16] = v410;
      }
      unint64_t v8 = v287[17];
      if (v8 != 1)
      {
        uint64_t v301 = v287[18];
        uint64_t v300 = v287[19];
        uint64_t v302 = v287[20];
        uint64_t v19 = (void *)v287[21];
        uint64_t v303 = v287[22];
        uint64_t v406 = v287[23];
        uint64_t v304 = v287[24];
        unint64_t v407 = v287[25];
        v416 = (void *)v287[26];
        uint64_t v415 = v287[27];
        uint64_t v305 = v287[29];
        v414 = (void *)v287[28];
        uint64_t v409 = v305;
        swift_bridgeObjectRetain();
        unint64_t v408 = v8;
        swift_bridgeObjectRetain();
        uint64_t v405 = v301;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v413 = v302;
        swift_bridgeObjectRetain();
        v412 = v19;
        swift_bridgeObjectRetain();
        v410 = (void *)v303;
        uint64_t v18 = v406;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v411 = v304;
        unint64_t v306 = v407;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v307 = v405;
        }
        else
        {
          uint64_t v307 = v405;
          long long v15 = sub_1BFA5C038(0, v15[2] + 1, 1, v15);
        }
        unint64_t v8 = v15[2];
        unint64_t v308 = v15[3];
        unint64_t v13 = v8 + 1;
        if (v8 >= v308 >> 1) {
          long long v15 = sub_1BFA5C038((void *)(v308 > 1), v8 + 1, 1, v15);
        }
        void v15[2] = v13;
        v256 = &v15[13 * v8];
        v256[4] = v408;
        v256[5] = v307;
        uint64_t v257 = v413;
        v256[6] = v300;
        v256[7] = v257;
        uint64_t v258 = (uint64_t)v410;
        v256[8] = v412;
        v256[9] = v258;
        uint64_t v259 = v411;
        v256[10] = v18;
        v256[11] = v259;
        v260 = v416;
        v256[12] = v306;
        v256[13] = v260;
        uint64_t v261 = (uint64_t)v414;
        v256[14] = v415;
        v256[15] = v261;
        v256[16] = v409;
      }
      long long v16 = (void *)v420;
      swift_bridgeObjectRelease();
      sub_1BFBBEB54((uint64_t)v15);
      uint64_t v7 = v389;
      unint64_t v17 = v390;
      uint64_t v255 = v391;
    }
  }
  v309 = v423;
  uint64_t v310 = MEMORY[0x1E4FBC870];
  uint64_t v422 = MEMORY[0x1E4FBC870];
  unint64_t v401 = v423[2];
  if (v401)
  {
    uint64_t v400 = (uint64_t)(v423 + 4);
    v311 = (unsigned int (**)(uint64_t, uint64_t, void *))(v343 + 48);
    v312 = (void *)(v343 + 56);
    sub_1BFBC0FB8(0, &qword_1EBA86C80, (uint64_t (*)(uint64_t))sub_1BFAE7078, MEMORY[0x1E4FBBE00]);
    uint64_t v399 = v313;
    uint64_t v396 = (uint64_t)v309;
    swift_bridgeObjectRetain_n();
    unint64_t v314 = 0;
    long long v398 = xmmword_1BFBE5080;
    v397 = v312;
    while (1)
    {
      unint64_t v315 = v314;
      v316 = (unint64_t *)(v400 + 104 * v314);
      uint64_t v409 = v316[12];
      unint64_t v408 = v315 + 1;
      uint64_t v413 = v316[11];
      v414 = (void *)v316[10];
      uint64_t v415 = v316[9];
      uint64_t v317 = v316[7];
      v416 = (void *)v316[8];
      uint64_t v318 = v316[5];
      v410 = (void *)v316[6];
      uint64_t v319 = (uint64_t)v410;
      uint64_t v320 = v316[4];
      uint64_t v411 = v316[3];
      uint64_t v321 = v316[2];
      v412 = (void *)v316[1];
      unint64_t v322 = *v316;
      uint64_t v323 = swift_initStackObject();
      *(_OWORD *)(v323 + 16) = v398;
      *(void *)(v323 + 32) = v322;
      uint64_t v402 = v323 + 32;
      *(void *)(v323 + 40) = v321;
      *(void *)(v323 + 48) = v320;
      *(void *)(v323 + 56) = v318;
      *(void *)(v323 + 64) = v319;
      v324 = (void (**)(uint64_t, uint64_t, uint64_t, void *))v397;
      v325 = v416;
      *(void *)(v323 + 72) = v317;
      *(void *)(v323 + 80) = v325;
      uint64_t v326 = (uint64_t)v414;
      *(void *)(v323 + 88) = v415;
      *(void *)(v323 + 96) = v326;
      *(void *)(v323 + 104) = v413;
      swift_bridgeObjectRetain();
      unint64_t v407 = v322;
      swift_bridgeObjectRetain_n();
      uint64_t v406 = v321;
      swift_bridgeObjectRetain_n();
      uint64_t v405 = v320;
      swift_bridgeObjectRetain_n();
      uint64_t v404 = v318;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v403 = v317;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v327 = 32;
      v328 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v329 = (uint64_t)v417;
      do
      {
        if (!*(void *)(v323 + v327))
        {
          (*v324)(v329, 1, 1, v16);
LABEL_123:
          sub_1BFBBDF88(v329);
          goto LABEL_124;
        }
        sub_1BFBC4E18(&qword_1EBA855F8, (void (*)(uint64_t))type metadata accessor for PaywallResource);
        sub_1BFBD4858();
        if ((*v311)(v329, 1, v16) == 1) {
          goto LABEL_123;
        }
        v330 = v419;
        sub_1BFBC0EB4(v329, (uint64_t)v419, (uint64_t (*)(void))type metadata accessor for PaywallResource);
        if (*((unsigned char *)v330 + *((int *)v16 + 7)))
        {
          uint64_t v331 = (uint64_t)v330;
          uint64_t v332 = *v330;
          uint64_t v333 = v330[1];
          swift_bridgeObjectRetain();
          sub_1BFBBEE64(v331, (uint64_t (*)(void))type metadata accessor for PaywallResource);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v328 = sub_1BFA5BC74(0, v328[2] + 1, 1, v328);
          }
          unint64_t v335 = v328[2];
          unint64_t v334 = v328[3];
          if (v335 >= v334 >> 1) {
            v328 = sub_1BFA5BC74((void *)(v334 > 1), v335 + 1, 1, v328);
          }
          v328[2] = v335 + 1;
          v336 = &v328[2 * v335];
          v336[4] = v332;
          v336[5] = v333;
          uint64_t v329 = (uint64_t)v417;
          long long v16 = (void *)v420;
        }
        else
        {
          sub_1BFBBEE64((uint64_t)v330, (uint64_t (*)(void))type metadata accessor for PaywallResource);
        }
LABEL_124:
        v327 += 8;
      }
      while (v327 != 112);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1BFAE7078(0);
      swift_arrayDestroy();
      uint64_t v337 = v328[2];
      if (v337)
      {
        v338 = v328 + 5;
        do
        {
          uint64_t v339 = *(v338 - 1);
          uint64_t v340 = *v338;
          swift_bridgeObjectRetain();
          sub_1BFBBECB4(v421, v339, v340);
          swift_bridgeObjectRelease();
          v338 += 2;
          --v337;
        }
        while (v337);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v314 = v408;
      if (v408 == v401)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v310 = v422;
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  return v310;
}

unint64_t sub_1BFBBD210(char a1)
{
  unint64_t result = 0x73756C507377656ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F69647561;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x6574726143616C61;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BFBBD2F0(char a1)
{
  unint64_t result = 0x53656C6369747261;
  switch(a1)
  {
    case 1:
    case 2:
    case 4:
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0x48656C6369747261;
      break;
    case 6:
      unint64_t result = 0x64726148666470;
      break;
    case 7:
      unint64_t result = 0x536C656E6E616863;
      break;
    case 8:
      unint64_t result = 0x656E697A6167616DLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000016;
      break;
    case 11:
      unint64_t result = 0x6565466F69647561;
      break;
    case 12:
      unint64_t result = 0x6148656C7A7A7570;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFBBD484@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  sub_1BFAE4A20(0);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v24 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v23 = (char *)v20 - v6;
  sub_1BFBC4D64(0, &qword_1EBA86C48, (void (*)(void))sub_1BFBC4DC4);
  uint64_t v25 = v7;
  uint64_t v22 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v20 - v8;
  unint64_t v10 = (int *)type metadata accessor for PaywallResource();
  MEMORY[0x1F4188790](v10);
  unint64_t v12 = (void *)((char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFBC4DC4();
  uint64_t v13 = (uint64_t)v26;
  sub_1BFBD5138();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v15 = (uint64_t)v23;
  uint64_t v14 = (uint64_t)v24;
  uint64_t v26 = a1;
  uint64_t v16 = v22;
  char v30 = 0;
  uint64_t *v12 = sub_1BFBD4F28();
  v12[1] = v17;
  uint64_t v18 = sub_1BFBD2C88();
  char v29 = 1;
  sub_1BFBC4E18(&qword_1EBA85450, MEMORY[0x1E4FAB0A8]);
  v20[1] = v18;
  sub_1BFBD4F08();
  sub_1BFBC0EB4(v15, (uint64_t)v12 + v10[5], (uint64_t (*)(void))sub_1BFAE4A20);
  char v28 = 2;
  sub_1BFBD4F08();
  sub_1BFBC0EB4(v14, (uint64_t)v12 + v10[6], (uint64_t (*)(void))sub_1BFAE4A20);
  char v27 = 3;
  LOBYTE(v14) = sub_1BFBD4EF8();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v25);
  *((unsigned char *)v12 + v10[7]) = v14;
  sub_1BFBC4E60((uint64_t)v12, v21, (uint64_t (*)(void))type metadata accessor for PaywallResource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_1BFBBEE64((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PaywallResource);
}

unint64_t sub_1BFBBD8F4()
{
  return sub_1BFBBD210(*v0);
}

uint64_t sub_1BFBBD8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBC101C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFBBD924(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC27A0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBBD960(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC27A0();
  return MEMORY[0x1F41862B0](a1, v2);
}

void *sub_1BFBBD99C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1BFBC12D8(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x218uLL);
  }
  return result;
}

unint64_t sub_1BFBBD9F0()
{
  return sub_1BFBBD2F0(*v0);
}

uint64_t sub_1BFBBD9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBC28C0(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BFBBDA20(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_1BFBBDA2C(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC3988();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBBDA68(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC3988();
  return MEMORY[0x1F41862B0](a1, v2);
}

__n128 sub_1BFBBDAA4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BFBC2E24(a1, v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v8;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1BFBBDB04()
{
  uint64_t result = 0x656372756F736572;
  switch(*v0)
  {
    case 1:
      unsigned int v2 = 1315858797;
      goto LABEL_4;
    case 2:
      unsigned int v2 = 1316512109;
LABEL_4:
      uint64_t result = v2 | 0x5673776500000000;
      break;
    case 3:
      uint64_t result = 0x7250646C756F6873;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFBBDBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBC50D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFBBDBCC(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC4DC4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBBDC08(uint64_t a1)
{
  unint64_t v2 = sub_1BFBC4DC4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1BFBBDC44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BFBBD484(a1, a2);
}

uint64_t sub_1BFBBDC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BFAE4A20(0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBC4E60(v2 + *(int *)(a1 + 20), (uint64_t)v7, (uint64_t (*)(void))sub_1BFAE4A20);
  uint64_t v8 = sub_1BFBD2C88();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  }
  sub_1BFBD2C78();
  return sub_1BFBBEE64((uint64_t)v7, (uint64_t (*)(void))sub_1BFAE4A20);
}

uint64_t sub_1BFBBDD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BFAE4A20(0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBC4E60(v2 + *(int *)(a1 + 24), (uint64_t)v7, (uint64_t (*)(void))sub_1BFAE4A20);
  uint64_t v8 = sub_1BFBD2C88();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  }
  sub_1BFBD2C68();
  return sub_1BFBBEE64((uint64_t)v7, (uint64_t (*)(void))sub_1BFAE4A20);
}

uint64_t type metadata accessor for PaywallResource()
{
  uint64_t result = qword_1EBA85608;
  if (!qword_1EBA85608) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BFBBDF20()
{
  if (!qword_1EBA86C68)
  {
    sub_1BFB89B90(255, (unint64_t *)&unk_1EBA863A0);
    unint64_t v0 = sub_1BFBD5018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA86C68);
    }
  }
}

uint64_t sub_1BFBBDF88(uint64_t a1)
{
  sub_1BFBC0FB8(0, &qword_1EBA85648, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1BFBBE014()
{
  sub_1BFBC0DEC(v0, (uint64_t)v78, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v78, (uint64_t)v71, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v0 + 208, (uint64_t)v77, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v77, (uint64_t)v72, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v0 + 104, (uint64_t)v76, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v76, (uint64_t)v73, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC(v0 + 312, (uint64_t)v75, (unint64_t *)&unk_1EBA863A0);
  sub_1BFBC0DEC((uint64_t)v75, (uint64_t)v74, (unint64_t *)&unk_1EBA863A0);
  uint64_t v1 = v71[0];
  uint64_t v2 = v71[1];
  uint64_t v66 = v71[3];
  uint64_t v70 = v71[2];
  uint64_t v3 = v71[6];
  uint64_t v64 = v71[5];
  uint64_t v65 = v71[4];
  uint64_t v4 = v71[7];
  uint64_t v5 = v71[8];
  uint64_t v6 = v71[9];
  uint64_t v7 = v71[10];
  uint64_t v8 = v71[11];
  uint64_t v9 = v71[12];
  sub_1BFBC0E58(v78, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v77, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  sub_1BFBC0E58(v75, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BFAE4CA8);
  if (v1 == 1)
  {
    unint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    uint64_t v63 = v2;
    sub_1BFAE4CA8(v1);
    unint64_t v10 = sub_1BFA5C038(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v12 = v10[2];
    unint64_t v11 = v10[3];
    if (v12 >= v11 >> 1) {
      unint64_t v10 = sub_1BFA5C038((void *)(v11 > 1), v12 + 1, 1, v10);
    }
    void v10[2] = v12 + 1;
    uint64_t v13 = &v10[13 * v12];
    v13[4] = v1;
    v13[5] = v63;
    v13[6] = v70;
    v13[7] = v66;
    void v13[8] = v65;
    v13[9] = v64;
    v13[10] = v3;
    v13[11] = v4;
    v13[12] = v5;
    v13[13] = v6;
    v13[14] = v7;
    v13[15] = v8;
    unsigned char v13[16] = v9;
  }
  uint64_t v14 = v72[0];
  if (v72[0] != 1)
  {
    uint64_t v15 = v72[1];
    uint64_t v16 = v72[2];
    uint64_t v17 = v72[5];
    uint64_t v53 = v72[3];
    uint64_t v56 = v72[4];
    uint64_t v18 = v72[6];
    uint64_t v19 = v72[7];
    uint64_t v20 = v72[8];
    uint64_t v21 = v72[9];
    uint64_t v22 = v72[10];
    uint64_t v59 = v72[11];
    uint64_t v62 = v72[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v67 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v10 = sub_1BFA5C038(0, v10[2] + 1, 1, v10);
    }
    unint64_t v24 = v10[2];
    unint64_t v23 = v10[3];
    if (v24 >= v23 >> 1) {
      unint64_t v10 = sub_1BFA5C038((void *)(v23 > 1), v24 + 1, 1, v10);
    }
    void v10[2] = v24 + 1;
    uint64_t v25 = &v10[13 * v24];
    v25[4] = v14;
    v25[5] = v15;
    v25[6] = v16;
    v25[7] = v53;
    v25[8] = v56;
    v25[9] = v17;
    v25[10] = v18;
    v25[11] = v19;
    v25[12] = v67;
    v25[13] = v21;
    v25[14] = v22;
    v25[15] = v59;
    v25[16] = v62;
  }
  uint64_t v26 = v73[0];
  if (v73[0] != 1)
  {
    uint64_t v27 = v73[1];
    uint64_t v28 = v73[2];
    uint64_t v29 = v73[3];
    uint64_t v30 = v73[6];
    uint64_t v51 = v73[4];
    uint64_t v54 = v73[5];
    uint64_t v31 = v73[7];
    uint64_t v32 = v73[8];
    uint64_t v33 = v73[9];
    uint64_t v34 = v73[11];
    uint64_t v57 = v73[10];
    uint64_t v60 = v73[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v68 = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v10 = sub_1BFA5C038(0, v10[2] + 1, 1, v10);
    }
    unint64_t v36 = v10[2];
    unint64_t v35 = v10[3];
    if (v36 >= v35 >> 1) {
      unint64_t v10 = sub_1BFA5C038((void *)(v35 > 1), v36 + 1, 1, v10);
    }
    void v10[2] = v36 + 1;
    unint64_t v37 = &v10[13 * v36];
    v37[4] = v26;
    v37[5] = v27;
    v37[6] = v68;
    v37[7] = v29;
    v37[8] = v51;
    v37[9] = v54;
    v37[10] = v30;
    v37[11] = v31;
    v37[12] = v32;
    v37[13] = v33;
    v37[14] = v57;
    v37[15] = v34;
    v37[16] = v60;
  }
  uint64_t v38 = v74[0];
  if (v74[0] != 1)
  {
    uint64_t v39 = v74[1];
    uint64_t v40 = v74[2];
    uint64_t v41 = v74[3];
    uint64_t v52 = v74[4];
    uint64_t v55 = v74[5];
    uint64_t v42 = v74[6];
    uint64_t v43 = v74[7];
    uint64_t v44 = v74[8];
    uint64_t v45 = v74[9];
    uint64_t v46 = v74[11];
    uint64_t v58 = v74[10];
    uint64_t v61 = v74[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v69 = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v10 = sub_1BFA5C038(0, v10[2] + 1, 1, v10);
    }
    unint64_t v48 = v10[2];
    unint64_t v47 = v10[3];
    if (v48 >= v47 >> 1) {
      unint64_t v10 = sub_1BFA5C038((void *)(v47 > 1), v48 + 1, 1, v10);
    }
    void v10[2] = v48 + 1;
    uint64_t v49 = &v10[13 * v48];
    v49[4] = v38;
    v49[5] = v39;
    v49[6] = v69;
    v49[7] = v41;
    v49[8] = v52;
    v49[9] = v55;
    v49[10] = v42;
    v49[11] = v43;
    v49[12] = v44;
    v49[13] = v45;
    v49[14] = v58;
    v49[15] = v46;
    v49[16] = v61;
  }
  sub_1BFB89B90(0, (unint64_t *)&unk_1EBA863A0);
  swift_arrayDestroy();
  return v10;
}

uint64_t sub_1BFBBE6A8@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a1;
  long long v6 = a1[7];
  long long v36 = a1[6];
  long long v37 = v6;
  long long v7 = a1[9];
  long long v38 = a1[8];
  long long v39 = v7;
  long long v8 = a1[3];
  long long v32 = a1[2];
  long long v33 = v8;
  long long v9 = a1[5];
  long long v34 = a1[4];
  long long v35 = v9;
  long long v10 = a1[1];
  long long v30 = *a1;
  long long v31 = v10;
  id v11 = objc_msgSend(PaywallModel.tag.getter(), sel_identifier);
  swift_unknownObjectRelease();
  uint64_t v12 = sub_1BFBD45F8();
  uint64_t v14 = v13;

  long long v15 = v4[7];
  long long v36 = v4[6];
  long long v37 = v15;
  long long v16 = v4[9];
  long long v38 = v4[8];
  long long v39 = v16;
  long long v17 = v4[3];
  long long v32 = v4[2];
  long long v33 = v17;
  long long v18 = v4[5];
  long long v34 = v4[4];
  long long v35 = v18;
  long long v19 = v4[1];
  long long v30 = *v4;
  long long v31 = v19;
  LODWORD(v4) = objc_msgSend(PaywallModel.tag.getter(), sel_isPuzzleType);
  swift_unknownObjectRelease();
  if (v4) {
    uint64_t v20 = a2 + 528;
  }
  else {
    uint64_t v20 = a2 + 520;
  }
  sub_1BFBC0EB4(v20, (uint64_t)v28, (uint64_t (*)(void))sub_1BFBC0F1C);
  sub_1BFBC0EB4((uint64_t)v28, (uint64_t)&v29, (uint64_t (*)(void))sub_1BFBC0F1C);
  uint64_t v21 = v29;
  if (v29 && *(void *)(v29 + 16) && (unint64_t v22 = sub_1BFA5C7C0(v12, v14), (v23 & 1) != 0))
  {
    unint64_t v24 = (const void *)(*(void *)(v21 + 56) + 536 * v22);
    memcpy(v26, v24, sizeof(v26));
    memmove(__dst, v24, 0x218uLL);
    nullsub_1(__dst);
    sub_1BFAE4A78(v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1BFAE496C(__dst);
  }
  sub_1BFBC0DEC((uint64_t)__dst, (uint64_t)&v30, &qword_1EBA87120);
  return sub_1BFBC0DEC((uint64_t)&v30, a3, &qword_1EBA87120);
}

uint64_t sub_1BFBBE8BC(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 146);
  uint64_t v3 = 0;
  switch(*(unsigned char *)(a1 + 16))
  {
    case 1:
      uint64_t v5 = v1[6];
      goto LABEL_26;
    case 2:
      uint64_t v5 = v1[11];
      goto LABEL_26;
    case 3:
      uint64_t v5 = v1[7];
      goto LABEL_26;
    case 4:
      if (*(unsigned char *)(a1 + 145))
      {
        if (*(unsigned char *)(a1 + 145) == 1) {
          uint64_t v5 = v1[9];
        }
        else {
          uint64_t v5 = v1[10];
        }
      }
      else
      {
        uint64_t v5 = v1[8];
      }
      goto LABEL_26;
    case 5:
      uint64_t v5 = v1[12];
      if (!v5) {
        goto LABEL_13;
      }
      goto LABEL_26;
    case 6:
      return v3;
    default:
      uint64_t v4 = *(void *)(a1 + 128);
      if ((*(unsigned char *)(a1 + 144) & 1) == 0)
      {
        if (v4 != 2)
        {
          uint64_t v5 = v1[5];
          goto LABEL_26;
        }
        if (v2 <= 1)
        {
          uint64_t v5 = *v1;
          goto LABEL_26;
        }
        uint64_t v5 = v1[1];
        if (v5) {
          goto LABEL_26;
        }
        uint64_t v3 = *v1;
LABEL_14:
        swift_bridgeObjectRetain();
        goto LABEL_27;
      }
      if (v4 != 2)
      {
        uint64_t v5 = v1[4];
        if (v5) {
          goto LABEL_26;
        }
LABEL_13:
        uint64_t v3 = v1[5];
        goto LABEL_14;
      }
      if (v2 > 1)
      {
        uint64_t v5 = v1[3];
        if (v5) {
          goto LABEL_26;
        }
        uint64_t v3 = v1[2];
        goto LABEL_14;
      }
      uint64_t v5 = v1[2];
LABEL_26:
      uint64_t v3 = v5;
LABEL_27:
      swift_bridgeObjectRetain();
      return v3;
  }
}

uint64_t sub_1BFBBEA00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_1BFA5BC74(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1BFBD4EB8();
  __break(1u);
  return result;
}

uint64_t sub_1BFBBEB54(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_1BFA5C038(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[13 * v9 + 4];
  if (a1 + 32 < v10 + 104 * v8 && v10 < a1 + 32 + 104 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1BFBD4EB8();
  __break(1u);
  return result;
}

uint64_t sub_1BFBBECB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1BFBD50F8();
  swift_bridgeObjectRetain();
  sub_1BFBD4698();
  uint64_t v8 = sub_1BFBD5128();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1BFBD5048() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      long long v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1BFBD5048() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1BFBBF8BC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1BFBBEE64(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BFBBEEC4(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1BFBD40E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1BFBC4E18(&qword_1EBA87620, MEMORY[0x1E4F80640]);
  swift_bridgeObjectRetain();
  long long v33 = a2;
  uint64_t v11 = sub_1BFBD4598();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    long long v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_1BFBC4E18(&qword_1EBA87628, MEMORY[0x1E4F80640]);
      char v21 = sub_1BFBD45B8();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_1BFBBFA58((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1BFBBF1E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BFAE55AC();
  uint64_t v3 = sub_1BFBD4D68();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1BFBD50F8();
      sub_1BFBD4698();
      uint64_t result = sub_1BFBD5128();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1BFBBF4C4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1BFBD40E8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_1BFAE5C98();
  uint64_t v5 = sub_1BFBD4D68();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    long long v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    long long v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_1BFBC4E18(&qword_1EBA87620, MEMORY[0x1E4F80640]);
      uint64_t result = sub_1BFBD4598();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_1BFBBF8BC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1BFBBF1E8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1BFAE3D18();
      goto LABEL_22;
    }
    sub_1BFBBFCF8();
  }
  uint64_t v11 = *v4;
  sub_1BFBD50F8();
  sub_1BFBD4698();
  uint64_t result = sub_1BFBD5128();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1BFBD5048(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1BFBD5068();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1BFBD5048();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  int64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *int64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_1BFBBFA58(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_1BFBD40E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1BFBBF4C4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1BFAE3EC8();
      goto LABEL_12;
    }
    sub_1BFBBFFA4();
  }
  uint64_t v12 = *v3;
  sub_1BFBC4E18(&qword_1EBA87620, MEMORY[0x1E4F80640]);
  uint64_t v13 = sub_1BFBD4598();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_1BFBC4E18(&qword_1EBA87628, MEMORY[0x1E4F80640]);
      char v21 = sub_1BFBD45B8();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1BFBD5068();
  __break(1u);
  return result;
}

uint64_t sub_1BFBBFCF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1BFAE55AC();
  uint64_t v3 = sub_1BFBD4D68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1BFBD50F8();
    swift_bridgeObjectRetain();
    sub_1BFBD4698();
    uint64_t result = sub_1BFBD5128();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BFBBFFA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BFBD40E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_1BFAE5C98();
  uint64_t v7 = sub_1BFBD4D68();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_1BFBC4E18(&qword_1EBA87620, MEMORY[0x1E4F80640]);
    uint64_t result = sub_1BFBD4598();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BFBC0350@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  long long v4 = a1[7];
  long long v215 = a1[6];
  long long v216 = v4;
  long long v5 = a1[9];
  long long v217 = a1[8];
  long long v218 = v5;
  long long v6 = a1[3];
  long long v211 = a1[2];
  long long v212 = v6;
  long long v7 = a1[5];
  long long v213 = a1[4];
  long long v214 = v7;
  long long v8 = a1[1];
  long long v209 = *a1;
  long long v210 = v8;
  sub_1BFBC0DEC(a2, (uint64_t)v134, &qword_1EBA87120);
  uint64_t result = sub_1BFAE4A54((uint64_t)v134);
  if (result != 1)
  {
    unint64_t v23 = v215;
    if ((unint64_t)v215 >> 62)
    {
      if ((unint64_t)v215 >> 62 == 1)
      {
        uint64_t v112 = v195;
        uint64_t v115 = v194;
        uint64_t v118 = v193;
        uint64_t v121 = v192;
        uint64_t v17 = v191;
        uint64_t v24 = v190;
        uint64_t v15 = v189;
        uint64_t v25 = v188;
        uint64_t v26 = v187;
        uint64_t v12 = v186;
        uint64_t v11 = v185;
        uint64_t v10 = v184;
        uint64_t v22 = v183;
        uint64_t result = sub_1BFAE4CA8(v183);
        uint64_t v16 = v24;
        uint64_t v14 = v25;
        uint64_t v13 = v26;
        uint64_t v19 = v118;
        uint64_t v18 = v121;
        uint64_t v21 = v112;
        uint64_t v20 = v115;
        goto LABEL_35;
      }
      uint64_t v96 = v158;
      uint64_t v99 = v157;
      uint64_t v89 = v160;
      uint64_t v93 = v159;
      uint64_t v107 = v162;
      uint64_t v109 = v161;
      uint64_t v105 = v163;
      uint64_t v87 = v164;
      uint64_t v119 = v167;
      uint64_t v123 = v166;
      uint64_t v116 = v168;
      uint64_t v111 = v165;
      uint64_t v113 = v169;
      uint64_t v62 = v171;
      uint64_t v63 = v172;
      uint64_t v71 = v170;
      uint64_t v72 = v174;
      uint64_t v64 = v173;
      uint64_t v65 = v176;
      uint64_t v66 = v178;
      uint64_t v67 = v179;
      uint64_t v68 = v180;
      uint64_t v69 = v181;
      uint64_t v70 = v177;
      uint64_t v73 = v175;
      uint64_t v74 = v182;
      long long v33 = v216;
      uint64_t v102 = v211;
      uint64_t v34 = *((void *)&v215 + 1);
      uint64_t v35 = *((void *)&v214 + 1);
      uint64_t v76 = *((void *)&v215 + 1);
      uint64_t v78 = *((void *)&v214 + 1);
      long long v36 = v213;
      uint64_t v75 = v214;
      long long v37 = v212;
      uint64_t v38 = (void *)*((void *)&v211 + 1);
      uint64_t v84 = (void *)*((void *)&v211 + 1);
      uint64_t v39 = *((void *)&v210 + 1);
      uint64_t v80 = v213;
      uint64_t v82 = *((void *)&v210 + 1);
      sub_1BFA514B4((uint64_t)&v209);
      sub_1BFA5161C(v39, v102, v38, v37, *((uint64_t *)&v37 + 1), v36, *((uint64_t *)&v36 + 1), v75, v35, v23, v34, v33, *((void **)&v33 + 1));
      swift_bridgeObjectRetain();
      id v40 = *((id *)&v33 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      LOBYTE(v34) = AMSMarketingItem.isCIPOffer()();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BFA51834(v82, v102, v84, v37, *((uint64_t *)&v37 + 1), v80, *((uint64_t *)&v36 + 1), v75, v78, v23, v76, v33, *((void **)&v33 + 1));
      sub_1BFA516CC((uint64_t)&v209);
      if ((v34 & 1) == 0 && v210 == 2)
      {
        uint64_t v22 = v71;
        if (v71 == 1)
        {
          uint64_t v17 = v111;
          uint64_t v12 = v89;
          uint64_t v11 = v93;
          uint64_t v15 = v105;
          uint64_t result = sub_1BFAE4CA8(v99);
          uint64_t v16 = v87;
          uint64_t v14 = v107;
          uint64_t v13 = v109;
          uint64_t v18 = v123;
          uint64_t v20 = v116;
          uint64_t v19 = v119;
          uint64_t v21 = v113;
          uint64_t v10 = v96;
          uint64_t v22 = v99;
          goto LABEL_35;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v10 = v62;
        swift_bridgeObjectRetain();
        uint64_t v11 = v63;
        swift_bridgeObjectRetain();
        uint64_t v12 = v64;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v15 = v65;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v17 = v66;
        swift_bridgeObjectRetain();
        uint64_t v47 = v67;
        swift_bridgeObjectRetain();
        uint64_t v19 = v68;
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRetain();
        uint64_t v13 = v72;
        uint64_t v14 = v73;
        uint64_t v16 = v70;
LABEL_30:
        uint64_t v18 = v47;
        uint64_t v20 = result;
        uint64_t v21 = v74;
        goto LABEL_35;
      }
      uint64_t v10 = v96;
      uint64_t v22 = v99;
      uint64_t v12 = v89;
      uint64_t v11 = v93;
      uint64_t v20 = v116;
      uint64_t v21 = v113;
      if (!(_BYTE)v210)
      {
        uint64_t v44 = (void *)v209;
        if (objc_msgSend((id)swift_unknownObjectRetain(), sel_respondsToSelector_, sel_hasAudioTrack))
        {
          unsigned __int8 v45 = objc_msgSend(v44, sel_hasAudioTrack);
          swift_unknownObjectRelease();
          if ((v45 & 1) != 0 && v71 != 1)
          {
            uint64_t v196 = v71;
            uint64_t v197 = v62;
            uint64_t v198 = v63;
            uint64_t v199 = v64;
            uint64_t v200 = v72;
            uint64_t v201 = v73;
            uint64_t v202 = v65;
            uint64_t v203 = v70;
            uint64_t v204 = v66;
            uint64_t v205 = v67;
            uint64_t v206 = v68;
            uint64_t v207 = v69;
            uint64_t v208 = v74;
            long long v130 = v215;
            long long v131 = v216;
            long long v132 = v217;
            long long v133 = v218;
            long long v126 = v211;
            long long v127 = v212;
            long long v128 = v213;
            long long v129 = v214;
            long long v124 = v209;
            long long v125 = v210;
            uint64_t v46 = sub_1BFBBE8BC((uint64_t)&v124);
            swift_bridgeObjectRelease();
            if (v46)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v10 = v62;
              swift_bridgeObjectRetain();
              uint64_t v11 = v63;
              swift_bridgeObjectRetain();
              uint64_t v12 = v64;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v15 = v65;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v47 = v67;
              swift_bridgeObjectRetain();
              uint64_t v19 = v68;
              swift_bridgeObjectRetain();
              uint64_t result = swift_bridgeObjectRetain();
              uint64_t v22 = v71;
              uint64_t v13 = v72;
              uint64_t v14 = v73;
              uint64_t v16 = v70;
              uint64_t v17 = v66;
              goto LABEL_30;
            }
          }
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      uint64_t v17 = v111;
      uint64_t result = sub_1BFAE4CA8(v99);
      uint64_t v16 = v87;
      uint64_t v15 = v105;
      uint64_t v14 = v107;
      uint64_t v13 = v109;
      uint64_t v18 = v123;
      uint64_t v19 = v119;
      goto LABEL_35;
    }
    uint64_t v22 = v134[0];
    uint64_t v10 = v134[1];
    uint64_t v11 = v134[2];
    uint64_t v12 = v134[3];
    uint64_t v27 = v135;
    uint64_t v28 = v136;
    uint64_t v29 = v137;
    uint64_t v30 = v138;
    uint64_t v110 = v139;
    uint64_t v31 = v140;
    uint64_t v19 = v141;
    uint64_t v20 = v142;
    uint64_t v21 = v143;
    if ((v211 & 1) == 0 && v210 == 2)
    {
      if (v144 == 1)
      {
        uint64_t v17 = v139;
        uint64_t v32 = v134[0];
        uint64_t v106 = v136;
        uint64_t v108 = v135;
        uint64_t v104 = v137;
        uint64_t v122 = v140;
LABEL_10:
        uint64_t result = sub_1BFAE4CA8(v32);
        uint64_t v16 = v30;
        uint64_t v15 = v104;
        uint64_t v14 = v106;
        uint64_t v13 = v108;
        uint64_t v18 = v122;
        goto LABEL_35;
      }
      uint64_t v100 = v151;
      uint64_t v103 = v156;
      uint64_t v117 = v154;
      uint64_t v120 = v155;
      uint64_t v114 = v153;
      uint64_t v48 = v152;
      uint64_t v94 = v149;
      uint64_t v97 = v150;
      uint64_t v49 = v148;
      uint64_t v91 = v147;
      uint64_t v86 = v146;
      uint64_t v50 = v144;
      uint64_t v51 = v145;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = v48;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v22 = v50;
      uint64_t v10 = v51;
      uint64_t v11 = v86;
      uint64_t v12 = v91;
      uint64_t v13 = v49;
      goto LABEL_28;
    }
    if (!(_BYTE)v210)
    {
      uint64_t v77 = v145;
      uint64_t v79 = v144;
      uint64_t v83 = v152;
      uint64_t v85 = v146;
      uint64_t v90 = v147;
      uint64_t v94 = v149;
      uint64_t v81 = v148;
      uint64_t v97 = v150;
      uint64_t v100 = v151;
      uint64_t v114 = v153;
      uint64_t v117 = v154;
      uint64_t v120 = v155;
      uint64_t v122 = v140;
      uint64_t v103 = v156;
      uint64_t v104 = v137;
      uint64_t v106 = v136;
      uint64_t v108 = v135;
      uint64_t v88 = v138;
      uint64_t v41 = (void *)v209;
      if (objc_msgSend((id)swift_unknownObjectRetain(), sel_respondsToSelector_, sel_hasAudioTrack))
      {
        unsigned __int8 v42 = objc_msgSend(v41, sel_hasAudioTrack);
        swift_unknownObjectRelease();
        uint64_t v30 = v88;
        uint64_t v31 = v122;
        uint64_t v28 = v106;
        uint64_t v27 = v108;
        uint64_t v29 = v104;
        if (v42)
        {
          if (v79 == 1) {
            goto LABEL_36;
          }
          uint64_t v196 = v79;
          uint64_t v197 = v77;
          uint64_t v198 = v85;
          uint64_t v199 = v90;
          uint64_t v200 = v81;
          uint64_t v201 = v94;
          uint64_t v202 = v97;
          uint64_t v203 = v100;
          uint64_t v204 = v83;
          uint64_t v205 = v114;
          uint64_t v206 = v117;
          uint64_t v207 = v120;
          uint64_t v208 = v103;
          long long v130 = v215;
          long long v131 = v216;
          long long v132 = v217;
          long long v133 = v218;
          long long v126 = v211;
          long long v127 = v212;
          long long v128 = v213;
          long long v129 = v214;
          long long v124 = v209;
          long long v125 = v210;
          uint64_t v43 = sub_1BFBBE8BC((uint64_t)&v124);
          swift_bridgeObjectRelease();
          if (!v43)
          {
LABEL_36:
            uint64_t v17 = v110;
            uint64_t v32 = v22;
            uint64_t v30 = v88;
            goto LABEL_10;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v17 = v83;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t result = swift_bridgeObjectRetain();
          uint64_t v22 = v79;
          uint64_t v10 = v77;
          uint64_t v11 = v85;
          uint64_t v12 = v90;
          uint64_t v13 = v81;
LABEL_28:
          uint64_t v14 = v94;
          uint64_t v15 = v97;
          uint64_t v16 = v100;
          uint64_t v21 = v103;
          uint64_t v18 = v114;
          uint64_t v19 = v117;
          uint64_t v20 = v120;
          goto LABEL_35;
        }
      }
      else
      {
        swift_unknownObjectRelease();
        uint64_t v30 = v88;
        uint64_t v31 = v122;
        uint64_t v28 = v106;
        uint64_t v27 = v108;
        uint64_t v29 = v104;
      }
    }
    uint64_t v17 = v110;
    uint64_t v52 = v22;
    uint64_t v53 = v11;
    uint64_t v54 = v12;
    uint64_t v55 = v27;
    uint64_t v56 = v28;
    uint64_t v57 = v29;
    uint64_t v92 = v54;
    uint64_t v95 = v53;
    uint64_t v98 = v10;
    uint64_t v101 = v52;
    uint64_t v58 = v21;
    uint64_t v59 = v20;
    uint64_t v60 = v19;
    uint64_t v61 = v31;
    uint64_t result = sub_1BFAE4CA8(v52);
    uint64_t v16 = v30;
    uint64_t v15 = v57;
    uint64_t v14 = v56;
    uint64_t v13 = v55;
    uint64_t v18 = v61;
    uint64_t v19 = v60;
    uint64_t v20 = v59;
    uint64_t v21 = v58;
    uint64_t v10 = v98;
    uint64_t v22 = v101;
    uint64_t v12 = v92;
    uint64_t v11 = v95;
    goto LABEL_35;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 1;
LABEL_35:
  *a3 = v22;
  a3[1] = v10;
  a3[2] = v11;
  a3[3] = v12;
  a3[4] = v13;
  a3[5] = v14;
  a3[6] = v15;
  a3[7] = v16;
  a3[8] = v17;
  a3[9] = v18;
  a3[10] = v19;
  a3[11] = v20;
  a3[12] = v21;
  return result;
}

uint64_t sub_1BFBC0DEC(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  sub_1BFB89B90(0, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_1BFBC0E58(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1BFBC0EB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1BFBC0F1C(uint64_t a1)
{
}

void sub_1BFBC0F50()
{
  if (!qword_1EBA87630)
  {
    unint64_t v0 = sub_1BFBD4588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA87630);
    }
  }
}

void sub_1BFBC0FB8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1BFBC101C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73756C507377656ELL && a2 == 0xE800000000000000;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69647561 && a2 == 0xE500000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001BFBF87E0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BFBF8800 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6574726143616C61 && a2 == 0xE800000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001BFBF8820 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BFBF8840)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

void *sub_1BFBC12D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_1BFBC4D64(0, &qword_1EBA86C40, (void (*)(void))sub_1BFBC27A0);
  uint64_t v131 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v59 - v7;
  uint64_t v9 = a1[3];
  long long v132 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_1BFBC27A0();
  long long v130 = v8;
  sub_1BFBD5138();
  if (v2) {
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
  }
  uint64_t v10 = a2;
  uint64_t v129 = v6;
  LOBYTE(v133[0]) = 0;
  unint64_t v11 = sub_1BFBC27F4();
  uint64_t v12 = v130;
  sub_1BFBD4F08();
  uint64_t v111 = v10;
  unint64_t v128 = 0;
  uint64_t v14 = v140;
  uint64_t v15 = v141;
  LOBYTE(v133[0]) = 1;
  uint64_t v122 = v146;
  uint64_t v123 = v145;
  uint64_t v124 = v144;
  uint64_t v127 = v143;
  uint64_t v125 = v142;
  uint64_t v126 = (uint64_t)v134;
  uint64_t v16 = v135;
  uint64_t v17 = v136;
  uint64_t v18 = v137;
  uint64_t v120 = v139;
  uint64_t v121 = v138;
  sub_1BFAE4CA8((uint64_t)v134);
  unint64_t v19 = v128;
  sub_1BFBD4F08();
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v129 + 8))(v12, v131);
    sub_1BFAE5150(v126);
    unint64_t v128 = v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
    return (void *)sub_1BFAE5150(v126);
  }
  uint64_t v104 = v15;
  uint64_t v105 = v16;
  uint64_t v102 = v18;
  uint64_t v103 = v17;
  uint64_t v101 = v14;
  uint64_t v20 = v142;
  uint64_t v21 = v143;
  uint64_t v22 = v144;
  uint64_t v23 = v145;
  uint64_t v24 = v146;
  LOBYTE(v133[0]) = 2;
  uint64_t v112 = (uint64_t)v134;
  uint64_t v113 = v135;
  uint64_t v114 = v136;
  uint64_t v115 = v137;
  uint64_t v116 = v138;
  uint64_t v117 = v139;
  uint64_t v118 = v140;
  uint64_t v119 = v141;
  sub_1BFAE4CA8((uint64_t)v134);
  uint64_t v100 = 0;
  sub_1BFBD4F08();
  uint64_t v109 = v21;
  uint64_t v110 = v20;
  uint64_t v107 = v23;
  uint64_t v108 = v22;
  uint64_t v106 = v24;
  uint64_t v25 = (uint64_t)v134;
  uint64_t v26 = v135;
  uint64_t v27 = v136;
  uint64_t v28 = v142;
  LOBYTE(v133[0]) = 3;
  uint64_t v92 = v146;
  uint64_t v93 = v145;
  uint64_t v94 = v144;
  uint64_t v95 = v143;
  uint64_t v99 = v138;
  uint64_t v100 = v137;
  uint64_t v97 = v140;
  uint64_t v98 = v139;
  uint64_t v96 = v141;
  sub_1BFAE4CA8((uint64_t)v134);
  uint64_t v29 = v131;
  unint64_t v128 = v11;
  sub_1BFBD4F08();
  uint64_t v90 = v26;
  uint64_t v91 = v25;
  uint64_t v88 = v28;
  uint64_t v89 = v27;
  uint64_t v30 = v141;
  uint64_t v31 = v143;
  uint64_t v32 = v144;
  uint64_t v33 = v145;
  uint64_t v34 = v146;
  LOBYTE(v133[0]) = 4;
  uint64_t v71 = v142;
  uint64_t v72 = (uint64_t)v134;
  uint64_t v73 = v135;
  uint64_t v74 = v136;
  uint64_t v75 = v137;
  uint64_t v76 = v138;
  uint64_t v77 = v139;
  uint64_t v78 = v140;
  sub_1BFAE4CA8((uint64_t)v134);
  uint64_t v60 = 0;
  sub_1BFBD4F08();
  uint64_t v67 = v31;
  uint64_t v68 = v30;
  uint64_t v65 = v33;
  uint64_t v66 = v32;
  uint64_t v64 = v34;
  uint64_t v85 = v134;
  uint64_t v86 = v135;
  uint64_t v87 = v136;
  uint64_t v84 = v137;
  uint64_t v69 = v138;
  uint64_t v63 = v139;
  uint64_t v35 = v140;
  uint64_t v36 = v141;
  uint64_t v37 = v142;
  uint64_t v38 = v143;
  unint64_t v128 = 0;
  uint64_t v39 = v144;
  uint64_t v40 = v145;
  uint64_t v41 = v146;
  sub_1BFBC0F50();
  LOBYTE(v133[0]) = 5;
  uint64_t v83 = v41;
  uint64_t v82 = v40;
  uint64_t v81 = v39;
  uint64_t v80 = v38;
  uint64_t v79 = v37;
  uint64_t v61 = v35;
  uint64_t v62 = v36;
  sub_1BFAE4CA8((uint64_t)v85);
  sub_1BFBC2848();
  unint64_t v42 = v128;
  sub_1BFBD4F08();
  if (!v42)
  {
    char v201 = 6;
    uint64_t v70 = (uint64_t)v134;
    swift_bridgeObjectRetain();
    sub_1BFBD4F08();
    unint64_t v128 = 0;
    uint64_t v44 = v77;
    uint64_t v45 = v78;
    uint64_t v46 = v75;
    uint64_t v47 = v76;
    uint64_t v48 = v74;
    (*(void (**)(char *, uint64_t))(v129 + 8))(v130, v29);
    uint64_t v131 = v202;
    v133[0] = v126;
    v133[1] = v105;
    v133[2] = v103;
    v133[3] = v102;
    v133[4] = v121;
    v133[5] = v120;
    v133[6] = v101;
    v133[7] = v104;
    v133[8] = v125;
    v133[9] = v127;
    v133[10] = v124;
    v133[11] = v123;
    v133[12] = v122;
    v133[13] = v112;
    v133[14] = v113;
    v133[15] = v114;
    v133[16] = v115;
    v133[17] = v116;
    v133[18] = v117;
    v133[19] = v118;
    v133[20] = v119;
    v133[21] = v110;
    v133[22] = v109;
    v133[23] = v108;
    v133[24] = v107;
    v133[25] = v106;
    v133[26] = v91;
    v133[27] = v90;
    v133[28] = v89;
    v133[29] = v100;
    v133[30] = v99;
    v133[31] = v98;
    v133[32] = v97;
    v133[33] = v96;
    v133[34] = v88;
    v133[35] = v95;
    v133[36] = v94;
    v133[37] = v93;
    v133[38] = v92;
    v133[39] = v72;
    v133[40] = v73;
    v133[41] = v48;
    v133[42] = v46;
    v133[43] = v47;
    v133[44] = v44;
    v133[45] = v45;
    v133[46] = v68;
    v133[47] = v71;
    v133[48] = v67;
    v133[49] = v66;
    v133[50] = v65;
    v133[51] = v64;
    v133[52] = (uint64_t)v85;
    v133[53] = v86;
    v133[54] = v87;
    v133[55] = v84;
    v133[56] = v69;
    v133[57] = v63;
    v133[58] = v61;
    v133[59] = v62;
    v133[60] = v79;
    v133[61] = v80;
    v133[62] = v81;
    v133[63] = v82;
    v133[64] = v83;
    v133[65] = v70;
    v133[66] = v202;
    sub_1BFAE4A78(v133);
    swift_bridgeObjectRelease();
    sub_1BFAE5150((uint64_t)v85);
    sub_1BFAE5150(v72);
    sub_1BFAE5150(v91);
    sub_1BFAE5150(v112);
    uint64_t v51 = v126;
    uint64_t v52 = v104;
    uint64_t v53 = v105;
    uint64_t v54 = v102;
    uint64_t v55 = v103;
    uint64_t v56 = v120;
    uint64_t v57 = v121;
    uint64_t v58 = v101;
    sub_1BFAE5150(v126);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
    v134 = (void *)v51;
    uint64_t v135 = v53;
    uint64_t v136 = v55;
    uint64_t v137 = v54;
    uint64_t v138 = v57;
    uint64_t v139 = v56;
    uint64_t v140 = v58;
    uint64_t v141 = v52;
    uint64_t v142 = v125;
    uint64_t v143 = v127;
    uint64_t v144 = v124;
    uint64_t v145 = v123;
    uint64_t v146 = v122;
    uint64_t v147 = v112;
    uint64_t v148 = v113;
    uint64_t v149 = v114;
    uint64_t v150 = v115;
    uint64_t v151 = v116;
    uint64_t v152 = v117;
    uint64_t v153 = v118;
    uint64_t v154 = v119;
    uint64_t v155 = v110;
    uint64_t v156 = v109;
    uint64_t v157 = v108;
    uint64_t v158 = v107;
    uint64_t v159 = v106;
    uint64_t v160 = v91;
    uint64_t v161 = v90;
    uint64_t v162 = v89;
    uint64_t v163 = v100;
    uint64_t v164 = v99;
    uint64_t v165 = v98;
    uint64_t v166 = v97;
    uint64_t v167 = v96;
    uint64_t v168 = v88;
    uint64_t v169 = v95;
    uint64_t v170 = v94;
    uint64_t v171 = v93;
    uint64_t v172 = v92;
    uint64_t v173 = v72;
    uint64_t v174 = v73;
    uint64_t v175 = v74;
    uint64_t v176 = v75;
    uint64_t v177 = v76;
    uint64_t v178 = v77;
    uint64_t v179 = v78;
    uint64_t v180 = v68;
    uint64_t v181 = v71;
    uint64_t v182 = v67;
    uint64_t v183 = v66;
    uint64_t v184 = v65;
    uint64_t v185 = v64;
    uint64_t v186 = (uint64_t)v85;
    uint64_t v187 = v86;
    uint64_t v188 = v87;
    uint64_t v189 = v84;
    uint64_t v190 = v69;
    uint64_t v191 = v63;
    uint64_t v192 = v61;
    uint64_t v193 = v62;
    uint64_t v194 = v79;
    uint64_t v195 = v80;
    uint64_t v196 = v81;
    uint64_t v197 = v82;
    uint64_t v198 = v83;
    uint64_t v199 = v70;
    uint64_t v200 = v131;
    sub_1BFAE6254((uint64_t *)&v134);
    return memcpy(v111, v133, 0x218uLL);
  }
  uint64_t v43 = *(void (**)(char *, uint64_t))(v129 + 8);
  unint64_t v128 = v42;
  v43(v130, v29);
  sub_1BFAE5150((uint64_t)v85);
  sub_1BFAE5150(v72);
  sub_1BFAE5150(v91);
  sub_1BFAE5150(v112);
  sub_1BFAE5150(v126);
  LODWORD(v130) = 0;
  LODWORD(v131) = 1;
  uint64_t v49 = v60;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
  sub_1BFAE5150(v126);
  sub_1BFAE5150(v112);
  sub_1BFAE5150(v91);
  if (v49)
  {
    uint64_t result = v85;
    int v50 = (int)v130;
    if (v131) {
      goto LABEL_12;
    }
  }
  else
  {
    sub_1BFAE5150(v72);
    uint64_t result = v85;
    int v50 = (int)v130;
    if (v131)
    {
LABEL_12:
      uint64_t result = (void *)sub_1BFAE5150((uint64_t)result);
      if (v50) {
        return (void *)swift_bridgeObjectRelease();
      }
      return result;
    }
  }
  if (v50) {
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1BFBC27A0()
{
  unint64_t result = qword_1EBA854F8;
  if (!qword_1EBA854F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA854F8);
  }
  return result;
}

unint64_t sub_1BFBC27F4()
{
  unint64_t result = qword_1EBA86398;
  if (!qword_1EBA86398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA86398);
  }
  return result;
}

unint64_t sub_1BFBC2848()
{
  unint64_t result = qword_1EBA87638;
  if (!qword_1EBA87638)
  {
    sub_1BFBC0F50();
    sub_1BFAE5BB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87638);
  }
  return result;
}

uint64_t sub_1BFBC28C0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x53656C6369747261 && a2 == 0xEB0000000074666FLL;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFBF8860 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFBF8880 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BFBF88A0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFBF88C0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x48656C6369747261 && a2 == 0xEB00000000647261 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x64726148666470 && a2 == 0xE700000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x536C656E6E616863 && a2 == 0xEB0000000074666FLL || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x656E697A6167616DLL && a2 == 0xEC00000064656546 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFBF88E0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001BFBF8900 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6565466F69647561 && a2 == 0xE900000000000064 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6148656C7A7A7570 && a2 == 0xEA00000000006472)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_1BFBC2E24@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_1BFBC4D64(0, &qword_1EBA86C58, (void (*)(void))sub_1BFBC3988);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v30 - v8;
  uint64_t v10 = a1[3];
  uint64_t v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_1BFBC3988();
  sub_1BFBD5138();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  }
  uint64_t v42 = v7;
  sub_1BFAE70AC(0);
  char v45 = 0;
  sub_1BFBC39DC();
  sub_1BFBD4F08();
  uint64_t v11 = v46;
  char v45 = 1;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v39 = v11;
  uint64_t v12 = v46;
  char v45 = 2;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v41 = v12;
  uint64_t v13 = v46;
  char v45 = 3;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v40 = v13;
  uint64_t v14 = v46;
  char v45 = 4;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v38 = v14;
  uint64_t v15 = v46;
  char v45 = 5;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v16 = v46;
  char v45 = 6;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v43 = v16;
  uint64_t v17 = v46;
  char v45 = 7;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  char v45 = 8;
  uint64_t v37 = v46;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  uint64_t v35 = v17;
  uint64_t v36 = v15;
  char v45 = 9;
  uint64_t v18 = v46;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  char v45 = 10;
  uint64_t v34 = v46;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  char v45 = 11;
  uint64_t v32 = v46;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  char v45 = 12;
  uint64_t v33 = v46;
  swift_bridgeObjectRetain();
  sub_1BFBD4F08();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v6);
  uint64_t v42 = v46;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v35;
  swift_bridgeObjectRelease();
  uint64_t v20 = v43;
  swift_bridgeObjectRelease();
  uint64_t v21 = v36;
  swift_bridgeObjectRelease();
  uint64_t v22 = v38;
  swift_bridgeObjectRelease();
  uint64_t v23 = v40;
  swift_bridgeObjectRelease();
  uint64_t v24 = v41;
  swift_bridgeObjectRelease();
  uint64_t v25 = v39;
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v25;
  a2[1] = v24;
  a2[2] = v23;
  a2[3] = v22;
  a2[4] = v21;
  a2[5] = v20;
  uint64_t v27 = v37;
  a2[6] = v19;
  a2[7] = v27;
  uint64_t v28 = v34;
  a2[8] = v31;
  a2[9] = v28;
  uint64_t v29 = v33;
  a2[10] = v32;
  a2[11] = v29;
  a2[12] = v42;
  return result;
}

unint64_t sub_1BFBC3988()
{
  unint64_t result = qword_1EBA86380;
  if (!qword_1EBA86380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA86380);
  }
  return result;
}

unint64_t sub_1BFBC39DC()
{
  unint64_t result = qword_1EBA86AE8;
  if (!qword_1EBA86AE8)
  {
    sub_1BFAE70AC(255);
    sub_1BFBC4E18(&qword_1EBA85600, (void (*)(uint64_t))type metadata accessor for PaywallResource);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA86AE8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PaywallResourceByLocationConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PaywallResourceByLocationConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x1BFBC3BD8);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallResourceByLocationConfig.CodingKeys()
{
  return &type metadata for PaywallResourceByLocationConfig.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PaywallConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBC3CDCLL);
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

ValueMetadata *type metadata accessor for PaywallConfig.CodingKeys()
{
  return &type metadata for PaywallConfig.CodingKeys;
}

void *sub_1BFBC3D14(void *a1, char *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    void *v4 = *(void *)a2;
    unsigned int v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_1BFBD2C88();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_1BFAE4A20(0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = &a2[v16];
    if (v13(&a2[v16], 1, v11))
    {
      sub_1BFAE4A20(0);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v18, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
    }
    *((unsigned char *)v4 + a3[7]) = a2[a3[7]];
  }
  return v4;
}

uint64_t sub_1BFBC3F38(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1BFBD2C88();
  uint64_t v10 = *(void *)(v5 - 8);
  unsigned int v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v5);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v7, v5);
  }
  return result;
}

void *sub_1BFBC4060(void *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_1BFBD2C88();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_1BFAE4A20(0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = &a2[v14];
  if (v12(&a2[v14], 1, v10))
  {
    sub_1BFAE4A20(0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v16, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  return a1;
}

char *sub_1BFBC4234(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1BFBD2C88();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_1BFAE4A20(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    sub_1BFAE4A20(0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  return a1;
}

_OWORD *sub_1BFBC44D4(_OWORD *a1, char *a2, int *a3)
{
  *a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1BFBD2C88();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_1BFAE4A20(0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_1BFAE4A20(0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  *((unsigned char *)a1 + a3[7]) = a2[a3[7]];
  return a1;
}

char *sub_1BFBC46A0(char *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1BFBD2C88();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_1BFAE4A20(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  int v18 = (char *)a2 + v16;
  int v19 = v12(&a1[v16], 1, v10);
  int v20 = v12(v18, 1, v10);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v17, v18, v10);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    sub_1BFAE4A20(0);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v17, v18, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
LABEL_13:
  a1[a3[7]] = *((unsigned char *)a2 + a3[7]);
  return a1;
}

uint64_t sub_1BFBC4930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBC4944);
}

uint64_t sub_1BFBC4944(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1BFAE4A20(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1BFBC49F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBC4A08);
}

uint64_t sub_1BFBC4A08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_1BFAE4A20(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1BFBC4AB0()
{
  sub_1BFAE4A20(319);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1BFBC4B58()
{
  unint64_t result = qword_1EA187030;
  if (!qword_1EA187030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187030);
  }
  return result;
}

unint64_t sub_1BFBC4BB0()
{
  unint64_t result = qword_1EA187038;
  if (!qword_1EA187038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187038);
  }
  return result;
}

unint64_t sub_1BFBC4C08()
{
  unint64_t result = qword_1EBA86390;
  if (!qword_1EBA86390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA86390);
  }
  return result;
}

unint64_t sub_1BFBC4C60()
{
  unint64_t result = qword_1EBA86388;
  if (!qword_1EBA86388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA86388);
  }
  return result;
}

unint64_t sub_1BFBC4CB8()
{
  unint64_t result = qword_1EBA85508;
  if (!qword_1EBA85508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA85508);
  }
  return result;
}

unint64_t sub_1BFBC4D10()
{
  unint64_t result = qword_1EBA85500;
  if (!qword_1EBA85500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA85500);
  }
  return result;
}

void sub_1BFBC4D64(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  if (!*a2)
  {
    a3();
    unint64_t v4 = sub_1BFBD4F78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1BFBC4DC4()
{
  unint64_t result = qword_1EBA855D8;
  if (!qword_1EBA855D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA855D8);
  }
  return result;
}

uint64_t sub_1BFBC4E18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BFBC4E60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for PaywallResource.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1BFBC4F94);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallResource.CodingKeys()
{
  return &type metadata for PaywallResource.CodingKeys;
}

unint64_t sub_1BFBC4FD0()
{
  unint64_t result = qword_1EA187040;
  if (!qword_1EA187040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187040);
  }
  return result;
}

unint64_t sub_1BFBC5028()
{
  unint64_t result = qword_1EBA855E8;
  if (!qword_1EBA855E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA855E8);
  }
  return result;
}

unint64_t sub_1BFBC5080()
{
  unint64_t result = qword_1EBA855E0;
  if (!qword_1EBA855E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA855E0);
  }
  return result;
}

uint64_t sub_1BFBC50D4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656372756F736572 && a2 == 0xEA00000000006449;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x567377654E6E696DLL && a2 == 0xEE006E6F69737265 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x567377654E78616DLL && a2 == 0xEE006E6F69737265 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7250646C756F6873 && a2 == 0xED00006D72617765)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t ArticleAccessMap.map.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ArticleAccessMap.map.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*ArticleAccessMap.map.modify())()
{
  return nullsub_1;
}

NewsSubscription::ArticleAccessMap __swiftcall ArticleAccessMap.init(map:)(NewsSubscription::ArticleAccessMap map)
{
  v1->map._rawValue = map.map._rawValue;
  return map;
}

uint64_t ArticleAccessMap.articleAccess(for:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5 = *v3;
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = result;
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_1BFA5C7C0(v7, a2);
    if (v9) {
      char v10 = *(unsigned char *)(*(void *)(v5 + 56) + v8);
    }
    else {
      char v10 = 2;
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = 2;
  }
  *a3 = v10;
  return result;
}

ValueMetadata *type metadata accessor for ArticleAccessMap()
{
  return &type metadata for ArticleAccessMap;
}

uint64_t dispatch thunk of BundleSubscriptionDetectionManagerType.showWelcomePage()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id sub_1BFBC53F8()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (qword_1EBA82A18 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1BFBD2DC8();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBA8EE00);
  unsigned int v4 = sub_1BFBD2DA8();
  os_log_type_t v5 = sub_1BFBD4A18();
  if (os_log_type_enabled(v4, v5))
  {
    char v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1BFA45000, v4, v5, "De-initializing BundleSubscriptionManager!", v6, 2u);
    MEMORY[0x1C18BCB70](v6, -1, -1);
  }

  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

uint64_t type metadata accessor for BundleSubscriptionDetectionManager()
{
  return self;
}

void sub_1BFBC5704()
{
  swift_getObjectType();
  sub_1BFADDED4();
  sub_1BFBD2CB8();
  unint64_t v0 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B88();
  swift_release();

  uint64_t v1 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B98();
  swift_release();
  swift_release();
}

unsigned char *storeEnumTagSinglePayload for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BFBC59E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent()
{
  return &type metadata for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent;
}

unint64_t sub_1BFBC5A24()
{
  unint64_t result = qword_1EBA87AD0;
  if (!qword_1EBA87AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87AD0);
  }
  return result;
}

void sub_1BFBC5A78()
{
}

void sub_1BFBC5AAC(void (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  uint64_t v6 = sub_1BFBD2908();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(sub_1BFBC6244())
  {
    case 1u:
      uint64_t v11 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 24);
      uint64_t v12 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v2+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager), v11);
      (*(void (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v12 + 16))(6, a1, a2, v11, v12);
      return;
    case 2u:
      uint64_t v13 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 24);
      uint64_t v14 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v2+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager), v13);
      (*(void (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v14 + 16))(5, a1, a2, v13, v14);
      return;
    case 3u:
      uint64_t v15 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 24);
      uint64_t v16 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v2+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager), v15);
      (*(void (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v16 + 16))(4, a1, a2, v15, v16);
      return;
    case 4u:
      id v17 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager), sel_configuration);
      if (!v17)
      {
        __break(1u);
        JUMPOUT(0x1BFBC60ACLL);
      }
      int v18 = v17;
      if (objc_msgSend(v17, sel_respondsToSelector_, sel_paidBundleConfig))
      {
        id v19 = objc_msgSend(v18, sel_paidBundleConfig);
        swift_unknownObjectRelease();
        id v20 = objc_msgSend(v19, sel_familySharingLandingPageArticleID);

        if (v20)
        {
          uint64_t v21 = sub_1BFBD45F8();
          uint64_t v23 = v22;

          if (a1)
          {
            v34[1] = *(void *)(v3
                               + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_completionEventManager);
            sub_1BFAFC9DC(0, &qword_1EBA82A48, MEMORY[0x1E4FBBE00]);
            uint64_t v35 = v21;
            uint64_t v36 = v23;
            uint64_t v25 = swift_allocObject();
            *(_OWORD *)(v25 + 16) = xmmword_1BFBD7990;
            swift_retain();
            sub_1BFBD28D8();
            uint64_t v23 = v36;
            sub_1BFBD28F8();
            uint64_t v37 = v25;
            sub_1BFBC7744(&qword_1EBA829F0, 255, MEMORY[0x1E4FAAD18]);
            sub_1BFAFC9DC(0, &qword_1EBA82A28, MEMORY[0x1E4FBB320]);
            sub_1BFADDD94();
            sub_1BFBD4C88();
            uint64_t v26 = swift_allocObject();
            *(void *)(v26 + 16) = a1;
            *(void *)(v26 + 24) = a2;
            swift_retain();
            sub_1BFBD2468();
            uint64_t v21 = v35;
            swift_release();
            sub_1BFA9C2FC((uint64_t)a1);
            (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          }
          if (qword_1EA183D90 != -1) {
            swift_once();
          }
          char v38 = 1;
          sub_1BFBC7744(&qword_1EA187098, v24, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
          sub_1BFBD2238();
          uint64_t v27 = *(void *)(v3 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router + 24);
          uint64_t v28 = *(void *)(v3 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router + 32);
          __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router), v27);
          uint64_t v30 = sub_1BFBC7744((unint64_t *)&unk_1EA1870A0, v29, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
          (*(void (**)(uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 16))(v21, v23, 0, 0, 0, 0, v3, v30, v27, v28);
          swift_bridgeObjectRelease();
          return;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
      sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
      uint64_t v33 = (void *)sub_1BFBD4BD8();
      sub_1BFBD4A18();
      sub_1BFBD2D88();

      if (a1) {
        a1();
      }
      return;
    case 5u:
      uint64_t v31 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 24);
      uint64_t v32 = *(void *)(v2
                      + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                      + 32);
      __swift_project_boxed_opaque_existential_1((void *)(v2+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager), v31);
      (*(void (**)(uint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v32 + 16))(7, a1, a2, v31, v32);
      return;
    default:
      sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
      uint64_t v36 = sub_1BFBD4BD8();
      sub_1BFBD4A18();
      sub_1BFBD2D88();
      char v10 = (void *)v36;

      return;
  }
}

uint64_t sub_1BFBC60C8()
{
  sub_1BFBC6244();
  if (qword_1EBA82A18 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1BFBD2DC8();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBA8EE00);
  uint64_t v1 = sub_1BFBD2DA8();
  os_log_type_t v2 = sub_1BFBD4A18();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109120;
    sub_1BFBD4C08();
    _os_log_impl(&dword_1BFA45000, v1, v2, "Post Purchase Onboarding Requires Presentation: %{BOOL}d.", v3, 8u);
    MEMORY[0x1C18BCB70](v3, -1, -1);
  }

  sub_1BFBC778C(0, (unint64_t *)&qword_1EBA87890, MEMORY[0x1E4FBB390], MEMORY[0x1E4FAB088]);
  swift_allocObject();
  return sub_1BFBD2BC8();
}

uint64_t sub_1BFBC6244()
{
  swift_getObjectType();
  uint64_t v1 = (char *)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_bundleSubscriptionManager), sel_cachedSubscription);
  if (objc_getAssociatedObject(v1, v1 + 1))
  {
    sub_1BFBD4C68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_1BFA951F0((uint64_t)&v18, (uint64_t)v20);
  if (v21)
  {
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850A0);
    if (swift_dynamicCast())
    {
      os_log_type_t v2 = v17;
      unint64_t v3 = (unint64_t)objc_msgSend(v17, sel_integerValue);
      if (v3 == -1) {
        goto LABEL_18;
      }
      goto LABEL_10;
    }
  }
  else
  {
    sub_1BFA5BBF0((uint64_t)v20);
  }
  os_log_type_t v2 = 0;
  unint64_t v3 = 0;
LABEL_10:
  if (objc_getAssociatedObject(v1, (const void *)~v3))
  {
    sub_1BFBD4C68();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_1BFA951F0((uint64_t)&v18, (uint64_t)v20);
  if (v21)
  {
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850A0);
    if (swift_dynamicCast())
    {
      id v4 = v17;
      unsigned int v5 = objc_msgSend(v4, sel_integerValue);

      if ((((v5 - 182) ^ v3) & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
  }
  else
  {
    sub_1BFA5BBF0((uint64_t)v20);
  }
LABEL_18:

  if (((v3 ^ 0xFFFFFF4A) & 1) == 0)
  {
LABEL_27:

    return 0;
  }
LABEL_19:
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager), sel_configuration);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v7 = (void *)result;
  if ((objc_msgSend((id)result, sel_respondsToSelector_, sel_paidBundleConfig) & 1) == 0)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  id v8 = objc_msgSend(v7, sel_paidBundleConfig);
  swift_unknownObjectRelease();
  if (!objc_msgSend(v8, sel_areMagazinesEnabled))
  {

    goto LABEL_27;
  }
  if (objc_msgSend(v1, sel_isPaidBundleViaOfferActivated))
  {
    char v9 = sub_1BFBC75B8(7, v8);

    if (v9) {
      return 5;
    }
    return 0;
  }
  if (objc_msgSend(v1, sel_isAmplifyUser))
  {
    char v10 = sub_1BFBC75B8(6, v8);

    return (v10 & 1) != 0;
  }
  if (objc_msgSend(v1, sel_isServicesBundleUser))
  {
    char v11 = sub_1BFBC75B8(5, v8);

    if ((v11 & 1) == 0) {
      return 0;
    }
    return 2;
  }
  else if (sub_1BFBC75B8(4, v8))
  {
    unsigned int v13 = objc_msgSend(v1, sel_isPurchaser);

    if (v13) {
      return 0;
    }
    else {
      return 3;
    }
  }
  else
  {
    if (qword_1EA183D90 != -1) {
      swift_once();
    }
    sub_1BFBC7744((unint64_t *)&unk_1EA187088, v12, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
    sub_1BFBD2098();
    if (v20[0] & 1) != 0 || (objc_msgSend(v1, sel_isPurchaser))
    {

      return 0;
    }
    id v14 = objc_msgSend(v8, sel_familySharingLandingPageArticleID);
    if (!v14)
    {
      sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
      uint64_t v16 = (void *)sub_1BFBD4BD8();
      sub_1BFBD4A18();
      sub_1BFBD2D88();

      return 0;
    }
    uint64_t v15 = v14;

    return 4;
  }
}

void sub_1BFBC66EC()
{
  sub_1BFBD4A08();
  sub_1BFA4DE80();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BFBD78F0;
  sub_1BFA4E0BC(0, (unint64_t *)&qword_1EBA85110);
  sub_1BFBD4E28();
  *(void *)(v0 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v0 + 64) = sub_1BFA4DEE8();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 4sub_1BFBC5AAC(0, 0) = 0xE000000000000000;
  sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
  uint64_t v1 = (void *)sub_1BFBD4BD8();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
}

void sub_1BFBC6800(void (*a1)(void *, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1C18BCCA0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (sub_1BFBC696C())
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = a1;
      *(void *)(v8 + 24) = a2;
      swift_retain();
      sub_1BFBC5AAC((void (*)(void))sub_1BFA959B0, v8);

      swift_release();
      return;
    }
  }
  uint64_t v9 = sub_1BFBD3628();
  sub_1BFBC7744(&qword_1EA1870C0, 255, MEMORY[0x1E4FACC00]);
  char v10 = (void *)swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x1E4FACBF8], v9);
  a1(v10, 1);
}

uint64_t sub_1BFBC696C()
{
  uint64_t v1 = sub_1BFBD1ED8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3);
  uint64_t v8 = (char *)&v39 - v7;
  MEMORY[0x1F4188790](v6);
  char v10 = (char *)&v39 - v9;
  id v11 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_bundleSubscriptionManager), sel_cachedSubscription);
  id v12 = objc_msgSend(v11, sel_initialPurchaseTimestamp);

  if (!v12) {
    return 0;
  }
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager), sel_configuration);
  if (result)
  {
    id v14 = (void *)result;
    if (objc_msgSend((id)result, sel_respondsToSelector_, sel_paidBundleConfig))
    {
      id v15 = objc_msgSend(v14, sel_paidBundleConfig);
      swift_unknownObjectRelease();
      objc_msgSend(v12, sel_doubleValue);
      sub_1BFBD1E98();
      sub_1BFBD1EC8();
      sub_1BFBD1E48();
      double v17 = v16;
      long long v18 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
      uint64_t result = v18(v8, v1);
      if ((~*(void *)&v17 & 0x7FF0000000000000) != 0)
      {
        if (v17 > -9.22337204e18)
        {
          if (v17 < 9.22337204e18)
          {
            if ((uint64_t)objc_msgSend(v15, sel_maxAllowedSubscriptionDetectionTime) >= (uint64_t)v17)
            {
              v18(v10, v1);

              return 1;
            }
            id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
            objc_msgSend(v19, sel_setTimeStyle_, 1);
            objc_msgSend(v19, sel_setDateStyle_, 1);
            (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v10, v1);
            sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
            id v20 = v19;
            id v21 = v15;
            id v22 = v20;
            id v23 = v21;
            uint64_t v24 = sub_1BFBD4BD8();
            os_log_type_t v25 = sub_1BFBD4A18();
            int v26 = v25;
            if (os_log_type_enabled(v24, v25))
            {
              uint64_t v27 = swift_slowAlloc();
              id v43 = v23;
              uint64_t v28 = v27;
              uint64_t v46 = swift_slowAlloc();
              uint64_t v48 = v46;
              *(_DWORD *)uint64_t v28 = 136315394;
              uint64_t v41 = v28 + 4;
              os_log_t v45 = v24;
              uint64_t v29 = (void *)sub_1BFBD1E68();
              id v30 = objc_msgSend(v22, sel_stringFromDate_, v29);
              int v44 = v26;
              id v31 = v30;

              uint64_t v32 = sub_1BFBD45F8();
              uint64_t v40 = v18;
              unint64_t v34 = v33;

              uint64_t v47 = sub_1BFA93E54(v32, v34, &v48);
              sub_1BFBD4C08();
              id v42 = v22;

              swift_bridgeObjectRelease();
              long long v18 = v40;
              v40(v5, v1);
              *(_WORD *)(v28 + 12) = 2048;
              id v35 = v43;
              id v36 = objc_msgSend(v43, sel_maxAllowedSubscriptionDetectionTime);

              uint64_t v47 = (uint64_t)v36;
              sub_1BFBD4C08();

              os_log_t v37 = v45;
              _os_log_impl(&dword_1BFA45000, v45, (os_log_type_t)v44, "BundleSubscriptionDetectionManager: User does not qualify for onboarding flow since the purchase date=%s has surpassed maximum allowed subscription detection time=%lld. Nothing will be presented.", (uint8_t *)v28, 0x16u);
              uint64_t v38 = v46;
              swift_arrayDestroy();
              MEMORY[0x1C18BCB70](v38, -1, -1);
              MEMORY[0x1C18BCB70](v28, -1, -1);
            }
            else
            {

              v18(v5, v1);
            }
            v18(v10, v1);
            return 0;
          }
          goto LABEL_17;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }

    swift_unknownObjectRelease();
    return 0;
  }
LABEL_18:
  __break(1u);
  return result;
}

unint64_t sub_1BFBC6EB4()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_1BFBC6ED0()
{
  sub_1BFADDED4();
  sub_1BFBD2CB8();
  uint64_t v0 = (void *)sub_1BFBD2AF8();
  sub_1BFBD2B78();
  swift_release();

  uint64_t v1 = (void *)sub_1BFBD2AF8();
  uint64_t v2 = sub_1BFBD2B98();
  swift_release();

  return v2;
}

void (*sub_1BFBC6FB4())(void (*a1)(void *, uint64_t), uint64_t a2)
{
  return sub_1BFBC773C;
}

uint64_t sub_1BFBC7010()
{
  return sub_1BFBD2458();
}

uint64_t sub_1BFBC703C(uint64_t a1, uint64_t a2)
{
  return sub_1BFBC7744((unint64_t *)&unk_1EA187088, a2, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
}

uint64_t sub_1BFBC7084(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1BFBC7744((unint64_t *)&unk_1EBA87AE0, a2, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
  *(void *)(a1 + 8) = result;
  return result;
}

id sub_1BFBC70DC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v14 = OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_completionEventManager;
  sub_1BFBC7240();
  swift_allocObject();
  id v15 = v7;
  *(void *)&v7[v14] = sub_1BFBD2478();
  *(void *)&v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager] = a1;
  *(void *)&v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_bundleSubscriptionManager] = a2;
  *(void *)&v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_userInfo] = a3;
  sub_1BFA4DFE0(a4, (uint64_t)&v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager]);
  sub_1BFA4DFE0(a5, (uint64_t)&v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router]);
  double v16 = &v15[OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_presentationOperationManager];
  *(void *)double v16 = a6;
  *((void *)v16 + 1) = a7;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v17 = a3;

  v22.receiver = v15;
  v22.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v22, sel_init);
  objc_msgSend(a2, sel_addObserver_, v18);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  return v18;
}

void sub_1BFBC7240()
{
  if (!qword_1EBA87A38)
  {
    sub_1BFBC729C();
    unint64_t v0 = sub_1BFBD2488();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA87A38);
    }
  }
}

unint64_t sub_1BFBC729C()
{
  unint64_t result = qword_1EBA87AC0;
  if (!qword_1EBA87AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA87AC0);
  }
  return result;
}

uint64_t sub_1BFBC72F0()
{
  return sub_1BFBC77D8();
}

uint64_t sub_1BFBC7308()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BFBC7340(char a1)
{
  swift_getObjectType();
  if (a1)
  {
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
    uint64_t v7 = (void *)sub_1BFBD4BD8();
    sub_1BFBD4A18();
    sub_1BFBD2D88();
  }
  else
  {
    if (*(void *)(v1
                   + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_presentationOperationManager))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1BFBD3888();
      sub_1BFBD25E8();
      swift_release();
      uint64_t v3 = sub_1BFBD3728();
      if (v3)
      {
        MEMORY[0x1F4188790](v3);
        sub_1BFADDED4();
        sub_1BFBD2CB8();
        uint64_t v4 = (void *)sub_1BFBD2AF8();
        sub_1BFBD2B88();
        swift_release();

        uint64_t v5 = (void *)sub_1BFBD2AF8();
        sub_1BFBD2B98();
        swift_unknownObjectRelease();
        swift_release();
        swift_release();

        return;
      }
      swift_unknownObjectRelease();
    }
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850C0);
    uint64_t v6 = (void *)sub_1BFBD4BD8();
    sub_1BFBD4A18();
    sub_1BFBD2D88();
  }
}

uint64_t sub_1BFBC75B8(uint64_t a1, id a2)
{
  uint64_t result = (uint64_t)objc_msgSend(a2, sel_postPurchaseOnboardingConfigurationsByType);
  if (result)
  {
    uint64_t v4 = (void *)result;
    sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA850A0);
    sub_1BFADDC80();
    sub_1BFAC697C();
    uint64_t v5 = sub_1BFBD4568();

    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithUnsignedInteger_, a1);
    uint64_t v7 = v6;
    if (*(void *)(v5 + 16) && (unint64_t v8 = sub_1BFA5C8A4((uint64_t)v6), (v9 & 1) != 0))
    {
      unint64_t v10 = *(void *)(*(void *)(v5 + 56) + 8 * v8);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_1BFBD4E68();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v11) {
        return 1;
      }
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

uint64_t sub_1BFBC7704()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BFBC773C(void (*a1)(void *, uint64_t), uint64_t a2)
{
  sub_1BFBC6800(a1, a2, v2);
}

uint64_t sub_1BFBC7744(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_1BFBC778C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1BFBC77D8()
{
  return sub_1BFBCF064();
}

uint64_t dispatch thunk of DynamicViewControllerResultDelegate.dynamicViewController(_:purchaseDidSucceed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of DynamicViewControllerResultDelegate.dynamicViewController(_:purchaseDidFail:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

void sub_1BFBC7844(void *a1, void *a2, void *a3)
{
  id v31 = a1;
  sub_1BFAA8EC0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PurchaseContext();
  uint64_t v30 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v29 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFA4DE80();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BFBD7990;
  unint64_t v33 = a2;
  sub_1BFBC9000(0, &qword_1EA187150, (uint64_t)&unk_1EA187158, 0x1E4F4DC28, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BFA4DF3C);
  id v11 = a2;
  uint64_t v12 = sub_1BFBD4648();
  uint64_t v14 = v13;
  uint64_t v15 = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v16 = sub_1BFA4DEE8();
  *(void *)(v10 + 64) = v16;
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 4sub_1BFBC5AAC(0, 0) = v14;
  unint64_t v33 = a3;
  id v17 = a3;
  sub_1BFBC9000(0, (unint64_t *)&unk_1EBA83830, (uint64_t)&qword_1EBA85110, MEMORY[0x1E4FBC0E8], (void (*)(uint64_t, uint64_t, uint64_t))sub_1BFA4E0BC);
  uint64_t v18 = sub_1BFBD4648();
  *(void *)(v10 + 96) = v15;
  *(void *)(v10 + 104) = v16;
  *(void *)(v10 + 72) = v18;
  *(void *)(v10 + 8sub_1BFBC5AAC(0, 0) = v19;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_1BFBC7C34(v31);
  }
  else
  {
    uint64_t v20 = v32;
    if (a3)
    {
      uint64_t v21 = v32 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
      swift_beginAccess();
      sub_1BFB6135C(v21, (uint64_t)v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v7, 1, v8) == 1)
      {
        sub_1BFBC8FA0((uint64_t)v7, (uint64_t (*)(void))sub_1BFAA8EC0);
      }
      else
      {
        uint64_t v22 = v29;
        sub_1BFBC9308((uint64_t)v7, v29, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
        id v23 = (void *)(v20 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
        swift_beginAccess();
        if (*v23)
        {
          uint64_t v24 = v23[1];
          swift_endAccess();
          uint64_t ObjectType = swift_getObjectType();
          int v26 = *(void (**)(void *, uint64_t, void *, uint64_t, uint64_t))(v24 + 16);
          id v27 = a3;
          swift_unknownObjectRetain();
          v26(v31, v22, a3, ObjectType, v24);

          swift_unknownObjectRelease();
          sub_1BFBC8FA0(v22, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
        }
        else
        {
          id v28 = a3;
          sub_1BFBC8FA0(v22, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
          swift_endAccess();
        }
      }
    }
  }
}

uint64_t sub_1BFBC7C34(void *a1)
{
  uint64_t v2 = v1;
  sub_1BFAA8EC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v8 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&aBlock[-1] - v9;
  uint64_t v11 = v2 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
  swift_beginAccess();
  sub_1BFB6135C(v11, (uint64_t)v10);
  uint64_t v12 = type metadata accessor for PurchaseContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  swift_beginAccess();
  sub_1BFA63268((uint64_t)v8, v11);
  swift_endAccess();
  uint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_bundleSubscriptionManager);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1BFB6135C((uint64_t)v10, (uint64_t)v8);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v16 = (v6 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  sub_1BFBC9308((uint64_t)v8, v17 + v15, (uint64_t (*)(void))sub_1BFAA8EC0);
  *(void *)(v17 + v16) = v14;
  *(void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8)) = a1;
  aBlock[4] = sub_1BFBC9370;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFA628B0;
  aBlock[3] = &block_descriptor_36;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = a1;
  swift_release();
  objc_msgSend(v13, sel_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion_, 3, 1, v18);
  _Block_release(v18);
  return sub_1BFBC8FA0((uint64_t)v10, (uint64_t (*)(void))sub_1BFAA8EC0);
}

void sub_1BFBC7F0C(void *a1, void *a2, void *a3)
{
  id v31 = a1;
  sub_1BFAA8EC0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PurchaseContext();
  uint64_t v30 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v29 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFA4DE80();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BFBD7990;
  unint64_t v33 = a2;
  sub_1BFBC9000(0, &qword_1EA187130, (uint64_t)&unk_1EA187138, 0x1E4F4DDE8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BFA4DF3C);
  id v11 = a2;
  uint64_t v12 = sub_1BFBD4648();
  uint64_t v14 = v13;
  uint64_t v15 = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v16 = sub_1BFA4DEE8();
  *(void *)(v10 + 64) = v16;
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 4sub_1BFBC5AAC(0, 0) = v14;
  unint64_t v33 = a3;
  id v17 = a3;
  sub_1BFBC9000(0, (unint64_t *)&unk_1EBA83830, (uint64_t)&qword_1EBA85110, MEMORY[0x1E4FBC0E8], (void (*)(uint64_t, uint64_t, uint64_t))sub_1BFA4E0BC);
  uint64_t v18 = sub_1BFBD4648();
  *(void *)(v10 + 96) = v15;
  *(void *)(v10 + 104) = v16;
  *(void *)(v10 + 72) = v18;
  *(void *)(v10 + 8sub_1BFBC5AAC(0, 0) = v19;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_1BFBC7C34(v31);
  }
  else
  {
    uint64_t v20 = v32;
    if (a3)
    {
      uint64_t v21 = v32 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
      swift_beginAccess();
      sub_1BFB6135C(v21, (uint64_t)v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v7, 1, v8) == 1)
      {
        sub_1BFBC8FA0((uint64_t)v7, (uint64_t (*)(void))sub_1BFAA8EC0);
      }
      else
      {
        uint64_t v22 = v29;
        sub_1BFBC9308((uint64_t)v7, v29, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
        id v23 = (void *)(v20 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
        swift_beginAccess();
        if (*v23)
        {
          uint64_t v24 = v23[1];
          swift_endAccess();
          uint64_t ObjectType = swift_getObjectType();
          int v26 = *(void (**)(void *, uint64_t, void *, uint64_t, uint64_t))(v24 + 16);
          id v27 = a3;
          swift_unknownObjectRetain();
          v26(v31, v22, a3, ObjectType, v24);

          swift_unknownObjectRelease();
          sub_1BFBC8FA0(v22, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
        }
        else
        {
          id v28 = a3;
          sub_1BFBC8FA0(v22, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
          swift_endAccess();
        }
      }
    }
  }
}

void sub_1BFBC8314(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(id, void *, void *))
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = a5;
  a6(v10, a4, a5);
}

uint64_t sub_1BFBC83B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BFAA8EC0();
  MEMORY[0x1F4188790](v8 - 8);
  id v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PurchaseContext();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a3 + 16;
  if (qword_1EBA876B8 != -1) {
    swift_once();
  }
  sub_1BFA4DE80();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1BFBD78F0;
  *(void *)(v16 + 56) = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA87690);
  *(void *)(v16 + 64) = sub_1BFBC9418();
  *(void *)(v16 + 32) = a1;
  id v17 = a1;
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  swift_bridgeObjectRelease();
  sub_1BFB6135C(a2, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    uint64_t v18 = (uint64_t (*)(void))sub_1BFAA8EC0;
    uint64_t v19 = (uint64_t)v10;
    goto LABEL_12;
  }
  sub_1BFBC9308((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
  if (!objc_msgSend(v17, sel_isSubscribed))
  {
    uint64_t v18 = (uint64_t (*)(void))type metadata accessor for PurchaseContext;
    uint64_t v19 = (uint64_t)v14;
LABEL_12:
    sub_1BFBC8FA0(v19, v18);
    swift_beginAccess();
    uint64_t result = MEMORY[0x1C18BCCA0](v15);
    if (result)
    {
      id v27 = (void *)result;
      sub_1BFA4DFE0(result + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_router, (uint64_t)v37);

      uint64_t v28 = v37[4];
      __swift_project_boxed_opaque_existential_1(v37, v37[3]);
      v36[4] = &type metadata for PurchaseReceiptVerificationFailureAlert;
      v36[5] = sub_1BFA642B4();
      sub_1BFBD3AE8();
      swift_allocObject();
      sub_1BFBD3A98();
      (*(void (**)(void))(v28 + 88))();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    return result;
  }
  id v20 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1EBA88668 != -1) {
    swift_once();
  }
  objc_msgSend(v20, sel_postNotificationName_object_userInfo_, qword_1EBA88658, 0, 0);

  swift_beginAccess();
  uint64_t v21 = MEMORY[0x1C18BCCA0](v15);
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    id v23 = (void *)(v21 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
    swift_beginAccess();
    if (*v23)
    {
      uint64_t v24 = v23[1];
      swift_unknownObjectRetain();

      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v24 + 8))(a4, v14, ObjectType, v24);
      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  swift_beginAccess();
  uint64_t v29 = MEMORY[0x1C18BCCA0](v15);
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    if (*((void *)v14 + 2) == 4)
    {
      *(void *)(swift_allocObject() + 16) = v29;
      id v31 = v30;
      sub_1BFBD23C8();

      swift_release();
    }
    else
    {
      if (qword_1EBA82A18 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_1BFBD2DC8();
      __swift_project_value_buffer(v32, (uint64_t)qword_1EBA8EE00);
      unint64_t v33 = sub_1BFBD2DA8();
      os_log_type_t v34 = sub_1BFBD4A18();
      if (os_log_type_enabled(v33, v34))
      {
        id v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v35 = 0;
        _os_log_impl(&dword_1BFA45000, v33, v34, "Purchase type is not a bundle via offer. Skipping welcome onboarding.", v35, 2u);
        MEMORY[0x1C18BCB70](v35, -1, -1);
      }
    }
  }
  return sub_1BFBC8FA0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
}

uint64_t sub_1BFBC8948(uint64_t a1)
{
  sub_1BFAA8EC0();
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = &v20[-v7];
  uint64_t v9 = type metadata accessor for PurchaseContext();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v13 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1EBA88650 != -1) {
    swift_once();
  }
  objc_msgSend(v13, sel_postNotificationName_object_userInfo_, qword_1EBA88648, 0, 0);

  uint64_t v14 = v1 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
  swift_beginAccess();
  sub_1BFB6135C(v14, (uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_1BFBC8FA0((uint64_t)v8, (uint64_t (*)(void))sub_1BFAA8EC0);
  }
  sub_1BFBC9308((uint64_t)v8, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
  uint64_t v16 = (void *)(v1 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
  swift_beginAccess();
  if (*v16)
  {
    uint64_t v17 = v16[1];
    swift_endAccess();
    uint64_t ObjectType = swift_getObjectType();
    swift_unknownObjectRetain();
    id v19 = (id)AMSError();
    (*(void (**)(uint64_t, unsigned char *, id, uint64_t, uint64_t))(v17 + 16))(a1, v12, v19, ObjectType, v17);
    swift_unknownObjectRelease();

    sub_1BFBC8FA0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
  }
  else
  {
    sub_1BFBC8FA0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
    swift_endAccess();
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
  swift_beginAccess();
  sub_1BFA63268((uint64_t)v6, v14);
  return swift_endAccess();
}

uint64_t sub_1BFBC8E24()
{
  return type metadata accessor for DynamicViewControllerDelegate();
}

uint64_t type metadata accessor for DynamicViewControllerDelegate()
{
  uint64_t result = qword_1EBA894B8;
  if (!qword_1EBA894B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BFBC8E78()
{
  sub_1BFAA8EC0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1BFBC8F28(void *a1)
{
  id v1 = objc_msgSend(a1, sel_topViewController);
  if (v1)
  {
    id v3 = v1;
    self;
    uint64_t v2 = swift_dynamicCastObjCClass();
    if (v2) {
      sub_1BFBC8948(v2);
    }
  }
}

uint64_t sub_1BFBC8FA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1BFBC9000(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    unint64_t v6 = sub_1BFBD4BF8();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1BFBC905C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBC9094()
{
  sub_1BFAA8EC0();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = type metadata accessor for PurchaseContext();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v0 + v3, 1, v6))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BFA4EC88(*(void *)(v5 + 72), *(void *)(v5 + 80), *(void *)(v5 + 88), *(void *)(v5 + 96), *(void *)(v5 + 104), *(void *)(v5 + 112), *(unsigned char *)(v5 + 120));
    uint64_t v7 = v5 + *(int *)(v6 + 52);
    uint64_t v8 = type metadata accessor for PostPurchaseDestination();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8)
      && swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1BFBD1DD8();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    }
    uint64_t v10 = v5 + *(int *)(v6 + 64);
    uint64_t v11 = sub_1BFBD1DD8();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
  }
  unint64_t v13 = (((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  return MEMORY[0x1F4186498](v0, v13 + 8, v2 | 7);
}

uint64_t sub_1BFBC9308(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BFBC9370(void *a1)
{
  sub_1BFAA8EC0();
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v6);
  uint64_t v8 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_1BFBC83B0(a1, v1 + v5, v7, v8);
}

unint64_t sub_1BFBC9418()
{
  unint64_t result = qword_1EA187140;
  if (!qword_1EA187140)
  {
    sub_1BFA4DF3C(255, (unint64_t *)&unk_1EBA87690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187140);
  }
  return result;
}

uint64_t sub_1BFBC9480()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBC94B8()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 16)
                + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_postPurchaseOnboardingManager);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(8, v2, v3);
}

uint64_t sub_1BFBC951C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBC9574(a1, a2, a3, MEMORY[0x1E4FAD328], MEMORY[0x1E4FAD338]);
}

uint64_t sub_1BFBC9548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BFBC9574(a1, a2, a3, MEMORY[0x1E4FAD330], MEMORY[0x1E4FAD340]);
}

uint64_t sub_1BFBC9574(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(void, uint64_t, uint64_t))
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void *)(a3 + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor);
    sub_1BFBD38D8();
    uint64_t v11 = sub_1BFBD38C8();
    a4(v10, v11, ObjectType, a2);
    return swift_release();
  }
  else
  {
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (result)
    {
      uint64_t v13 = swift_getObjectType();
      return a5(*(void *)(a3 + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor), v13, a2);
    }
  }
  return result;
}

uint64_t type metadata accessor for FlexiblePaywallCollectionViewDelegate()
{
  return self;
}

void sub_1BFBC9EAC()
{
  if (!qword_1EBA885F8)
  {
    sub_1BFBD35D8();
    unint64_t v0 = sub_1BFBD4898();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA885F8);
    }
  }
}

uint64_t sub_1BFBC9F04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t SubscriptionFeatureAvailabilityType.allowCIPBestOffer.getter()
{
  return 0;
}

uint64_t SubscriptionFeatureAvailabilityType.allowSIWAOnMac.getter()
{
  return 0;
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowStatusCheck.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowInAppMessages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowCIPBestOffer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowSIWAOnMac.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowPaidBundleViaOffer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t __swift_memcpy5_1(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DefaultSubscriptionFeatureAvailability(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[5]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultSubscriptionFeatureAvailability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultSubscriptionFeatureAvailability()
{
  return &type metadata for DefaultSubscriptionFeatureAvailability;
}

uint64_t static Databases.Subscription.name.getter()
{
  return 0x7069726373627553;
}

uint64_t sub_1BFBCA0A0()
{
  uint64_t result = sub_1BFBCA0C4();
  qword_1EBA88510 = result;
  *(void *)algn_1EBA88518 = v1;
  return result;
}

uint64_t sub_1BFBCA0C4()
{
  uint64_t v0 = sub_1BFBD1DD8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  BOOL v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  uint64_t v8 = sub_1BFBD4828();

  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1BFBD1D48();
    swift_bridgeObjectRelease();
    sub_1BFBD1D68();
    uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    v9(v4, v0);
    uint64_t v10 = sub_1BFBD1DA8();
    v9(v6, v0);
    return v10;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

uint64_t static Databases.Subscription.location.getter()
{
  if (qword_1EBA877E8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EBA88510;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for Databases()
{
  return &type metadata for Databases;
}

ValueMetadata *type metadata accessor for Databases.Subscription()
{
  return &type metadata for Databases.Subscription;
}

uint64_t sub_1BFBCA2F4()
{
  uint64_t v0 = sub_1BFBD2418();
  MEMORY[0x1F4188790](v0);
  uint64_t v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FAA910];
  sub_1BFBCA820(0, (unint64_t *)&unk_1EBA850D0, MEMORY[0x1E4FAA910], MEMORY[0x1E4FBBE00]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFBD78F0;
  sub_1BFBD2408();
  sub_1BFBCA7C8();
  sub_1BFBCA820(0, (unint64_t *)&unk_1EBA84F00, v1, MEMORY[0x1E4FBB320]);
  sub_1BFB6EF64();
  sub_1BFBD4C88();
  sub_1BFBCA820(0, &qword_1EBA89510, MEMORY[0x1E4FAA758], MEMORY[0x1E4FAAFF0]);
  swift_allocObject();
  return sub_1BFBD2A18();
}

uint64_t sub_1BFBCA4E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BFBD2F08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BFBD2F38();
  if (qword_1EBA877E8 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)algn_1EBA88518;
  *uint64_t v5 = qword_1EBA88510;
  v5[1] = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FAA728], v2);
  swift_bridgeObjectRetain();
  uint64_t result = sub_1BFBD2EE8();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for DatabaseAssembly()
{
  return self;
}

uint64_t sub_1BFBCA638()
{
  uint64_t v0 = sub_1BFBD2AC8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2598();
  sub_1BFBCA820(0, &qword_1EBA89510, MEMORY[0x1E4FAA758], MEMORY[0x1E4FAAFF0]);
  sub_1BFBD2928();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FAB040], v0);
  sub_1BFBD2358();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_1BFBCA7C8()
{
  unint64_t result = qword_1EBA83910;
  if (!qword_1EBA83910)
  {
    sub_1BFBD2418();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA83910);
  }
  return result;
}

void sub_1BFBCA820(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1BFBCA884()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  for (unint64_t i = (uint64_t *)(v1 + 56); ; i += 10)
  {
    unint64_t v4 = i[5];
    if ((v4 >> 61) < 2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  uint64_t v5 = *(i - 3);
  sub_1BFA55CCC(v5, *(i - 2), *(i - 1), *i, i[1], i[2], i[3], i[4], v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t PurchaseContext.init(purchaseID:purchaseType:purchaseSessionID:sourceChannelID:webAccessOptIn:conversionLocation:userAction:traits:hideMyEmailShareSelection:postPurchaseDestination:hidePostPurchaseOnboarding:isDirectBuy:financeURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unsigned __int8 *a10, unsigned __int8 *a11, uint64_t a12, uint64_t *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, uint64_t a17)
{
  int v53 = a8;
  uint64_t v51 = a6;
  uint64_t v52 = a7;
  uint64_t v39 = a4;
  uint64_t v40 = a3;
  uint64_t v57 = a17;
  int v55 = a15;
  int v56 = a16;
  uint64_t v54 = a14;
  uint64_t v50 = a12;
  uint64_t v21 = sub_1BFBD1F08();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v25 = *a10;
  int v49 = *a11;
  uint64_t v26 = *a13;
  uint64_t v47 = a13[1];
  uint64_t v48 = v26;
  uint64_t v27 = a13[2];
  uint64_t v45 = a13[3];
  uint64_t v46 = v27;
  uint64_t v28 = a13[4];
  uint64_t v43 = a13[5];
  uint64_t v44 = v28;
  LODWORD(v23) = *((unsigned __int8 *)a13 + 48);
  int v41 = v25;
  int v42 = v23;
  uint64_t v29 = (int *)type metadata accessor for PurchaseContext();
  uint64_t v30 = a9 + v29[16];
  uint64_t v31 = sub_1BFBD1DD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v40;
  if (a5)
  {
    uint64_t v32 = v39;
  }
  else
  {
    sub_1BFBD1EF8();
    uint64_t v32 = sub_1BFBD1EE8();
    a5 = v33;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  *(void *)(a9 + 24) = v32;
  *(void *)(a9 + 32) = a5;
  uint64_t v34 = v52;
  *(void *)(a9 + 4sub_1BFBC5AAC(0, 0) = v51;
  *(void *)(a9 + 48) = v34;
  *(unsigned char *)(a9 + 56) = v53 & 1;
  *(unsigned char *)(a9 + 57) = v41;
  *(unsigned char *)(a9 + 58) = v49;
  uint64_t v35 = v48;
  *(void *)(a9 + 64) = v50;
  *(void *)(a9 + 72) = v35;
  uint64_t v36 = v46;
  *(void *)(a9 + 8sub_1BFBC5AAC(0, 0) = v47;
  *(void *)(a9 + 88) = v36;
  uint64_t v37 = v44;
  *(void *)(a9 + 96) = v45;
  *(void *)(a9 + 104) = v37;
  *(void *)(a9 + 112) = v43;
  *(unsigned char *)(a9 + 12sub_1BFBC5AAC(0, 0) = v42;
  sub_1BFA9C5EC(v54, a9 + v29[13]);
  *(unsigned char *)(a9 + v29[14]) = v55 & 1;
  *(unsigned char *)(a9 + v29[15]) = v56 & 1;
  return sub_1BFA9C680(v57, v30);
}

uint64_t type metadata accessor for PurchaseContext()
{
  uint64_t result = qword_1EBA89288;
  if (!qword_1EBA89288) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PurchaseContext.purchaseID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.purchaseID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PurchaseContext.purchaseID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.purchaseType.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t PurchaseContext.purchaseType.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*PurchaseContext.purchaseType.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.purchaseSessionID.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.purchaseSessionID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PurchaseContext.purchaseSessionID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.sourceChannelID.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.sourceChannelID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 4sub_1BFBC5AAC(0, 0) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*PurchaseContext.sourceChannelID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.webAccessOptIn.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t PurchaseContext.webAccessOptIn.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 56) = result;
  return result;
}

uint64_t (*PurchaseContext.webAccessOptIn.modify())()
{
  return nullsub_1;
}

void PurchaseContext.conversionLocation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 57);
}

unsigned char *PurchaseContext.conversionLocation.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 57) = *result;
  return result;
}

uint64_t (*PurchaseContext.conversionLocation.modify())()
{
  return nullsub_1;
}

void PurchaseContext.userAction.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 58);
}

unsigned char *PurchaseContext.userAction.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 58) = *result;
  return result;
}

uint64_t (*PurchaseContext.userAction.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.traits.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PurchaseContext.traits.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

uint64_t (*PurchaseContext.traits.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.hideMyEmailShareSelection.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  uint64_t v5 = *(void *)(v1 + 96);
  uint64_t v6 = *(void *)(v1 + 104);
  uint64_t v7 = *(void *)(v1 + 112);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 4sub_1BFBC5AAC(0, 0) = v7;
  char v8 = *(unsigned char *)(v1 + 120);
  *(unsigned char *)(a1 + 48) = v8;
  return sub_1BFA6CCA0(v2, v3, v4, v5, v6, v7, v8);
}

__n128 PurchaseContext.hideMyEmailShareSelection.setter(long long *a1)
{
  __n128 v6 = (__n128)a1[1];
  long long v7 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  char v4 = *((unsigned char *)a1 + 48);
  sub_1BFA4EC88(*(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(unsigned char *)(v1 + 120));
  *(_OWORD *)(v1 + 72) = v7;
  __n128 result = v6;
  *(__n128 *)(v1 + 88) = v6;
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = v3;
  *(unsigned char *)(v1 + 12sub_1BFBC5AAC(0, 0) = v4;
  return result;
}

uint64_t (*PurchaseContext.hideMyEmailShareSelection.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.postPurchaseDestination.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PurchaseContext();
  return sub_1BFBCB100(v1 + *(int *)(v3 + 52), a1, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
}

uint64_t PurchaseContext.hidePostPurchaseOnboarding.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseContext() + 56));
}

uint64_t PurchaseContext.isDirectBuy.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseContext() + 60));
}

uint64_t PurchaseContext.isDirectBuy.setter(char a1)
{
  uint64_t result = type metadata accessor for PurchaseContext();
  *(unsigned char *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*PurchaseContext.isDirectBuy.modify())(void)
{
  return nullsub_1;
}

uint64_t PurchaseContext.financeURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PurchaseContext();
  return sub_1BFBCB100(v1 + *(int *)(v3 + 64), a1, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1BFBCB100(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1BFA80CF4(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t PurchaseContext.financeURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseContext() + 64);
  return sub_1BFA9C680(a1, v3);
}

uint64_t (*PurchaseContext.financeURL.modify())(void)
{
  return nullsub_1;
}

unint64_t sub_1BFBCB1F8(char a1)
{
  unint64_t result = 0x6573616863727570;
  switch(a1)
  {
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6843656372756F73;
      break;
    case 4:
      unint64_t result = 0x7365636341626577;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x6974634172657375;
      break;
    case 7:
      unint64_t result = 0x737469617274;
      break;
    case 8:
      unint64_t result = 0xD000000000000019;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 11:
      unint64_t result = 0x7463657269447369;
      break;
    case 12:
      unint64_t result = 0x5565636E616E6966;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BFBCB3B0()
{
  return sub_1BFBCB1F8(*v0);
}

uint64_t sub_1BFBCB3B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFBCE158(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFBCB3E0(uint64_t a1)
{
  unint64_t v2 = sub_1BFBCB8FC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFBCB41C(uint64_t a1)
{
  unint64_t v2 = sub_1BFBCB8FC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PurchaseContext.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_1BFBCC354(0, &qword_1EA1871D0, MEMORY[0x1E4FBBDE0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFBCB8FC();
  sub_1BFBD5148();
  LOBYTE(v13[0]) = 0;
  sub_1BFBD4FB8();
  if (!v2)
  {
    *(void *)&v13[0] = *(void *)(v3 + 16);
    char v15 = 1;
    sub_1BFBCB950();
    sub_1BFBD4FE8();
    LOBYTE(v13[0]) = 2;
    sub_1BFBD4FB8();
    LOBYTE(v13[0]) = 3;
    sub_1BFBD4FB8();
    LOBYTE(v13[0]) = 4;
    sub_1BFBD4FC8();
    LOBYTE(v13[0]) = *(unsigned char *)(v3 + 57);
    char v15 = 5;
    sub_1BFBCB9A4();
    sub_1BFBD4FE8();
    LOBYTE(v13[0]) = *(unsigned char *)(v3 + 58);
    char v15 = 6;
    sub_1BFBCB9F8();
    sub_1BFBD4FE8();
    *(void *)&v13[0] = *(void *)(v3 + 64);
    char v15 = 7;
    sub_1BFBCBA4C();
    sub_1BFBCC510(&qword_1EA1871F0, (void (*)(void))sub_1BFBCBAA4);
    sub_1BFBD4FE8();
    char v10 = *(unsigned char *)(v3 + 120);
    long long v11 = *(_OWORD *)(v3 + 88);
    v13[0] = *(_OWORD *)(v3 + 72);
    v13[1] = v11;
    v13[2] = *(_OWORD *)(v3 + 104);
    char v14 = v10;
    char v15 = 8;
    sub_1BFBCBAF8();
    sub_1BFBD4FE8();
    type metadata accessor for PurchaseContext();
    LOBYTE(v13[0]) = 9;
    type metadata accessor for PostPurchaseDestination();
    sub_1BFBCC624(&qword_1EA187208, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    sub_1BFBD4F98();
    LOBYTE(v13[0]) = 10;
    sub_1BFBD4FC8();
    LOBYTE(v13[0]) = 11;
    sub_1BFBD4FC8();
    LOBYTE(v13[0]) = 12;
    sub_1BFBD1DD8();
    sub_1BFBCC624(&qword_1EA186A18, MEMORY[0x1E4F276F0]);
    sub_1BFBD4F98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1BFBCB8FC()
{
  unint64_t result = qword_1EBA82180;
  if (!qword_1EBA82180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA82180);
  }
  return result;
}

unint64_t sub_1BFBCB950()
{
  unint64_t result = qword_1EA1871D8;
  if (!qword_1EA1871D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1871D8);
  }
  return result;
}

unint64_t sub_1BFBCB9A4()
{
  unint64_t result = qword_1EA1871E0;
  if (!qword_1EA1871E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1871E0);
  }
  return result;
}

unint64_t sub_1BFBCB9F8()
{
  unint64_t result = qword_1EA1871E8;
  if (!qword_1EA1871E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1871E8);
  }
  return result;
}

void sub_1BFBCBA4C()
{
  if (!qword_1EBA82488)
  {
    unint64_t v0 = sub_1BFBD4898();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA82488);
    }
  }
}

unint64_t sub_1BFBCBAA4()
{
  unint64_t result = qword_1EA1871F8;
  if (!qword_1EA1871F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1871F8);
  }
  return result;
}

unint64_t sub_1BFBCBAF8()
{
  unint64_t result = qword_1EA187200;
  if (!qword_1EA187200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187200);
  }
  return result;
}

uint64_t PurchaseContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v32 - v4;
  sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v32 - v7;
  sub_1BFBCC354(0, (unint64_t *)&unk_1EBA82508, MEMORY[0x1E4FBBDC0]);
  uint64_t v35 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = (int *)type metadata accessor for PurchaseContext();
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (uint64_t *)((char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(int *)(v14 + 64);
  uint64_t v39 = v16;
  uint64_t v18 = (uint64_t)v16 + v17;
  uint64_t v19 = sub_1BFBD1DD8();
  id v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v36 = v18;
  v20(v18, 1, 1, v19);
  uint64_t v21 = a1[3];
  uint64_t v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_1BFBCB8FC();
  uint64_t v34 = v12;
  uint64_t v22 = (uint64_t)v38;
  sub_1BFBD5138();
  if (v22)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    return sub_1BFBCC3B8(v36, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
  }
  else
  {
    uint64_t v38 = v8;
    uint64_t v32 = v5;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 0;
    uint64_t v23 = sub_1BFBD4F28();
    uint64_t v24 = v39;
    *uint64_t v39 = v23;
    v24[1] = v25;
    char v44 = 1;
    sub_1BFBCC414();
    sub_1BFBD4F58();
    _OWORD v24[2] = v40;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 2;
    void v24[3] = sub_1BFBD4F28();
    v24[4] = v26;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 3;
    v24[5] = sub_1BFBD4F28();
    v24[6] = v27;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 4;
    *((unsigned char *)v24 + 56) = sub_1BFBD4F38() & 1;
    char v44 = 5;
    sub_1BFBCC468();
    sub_1BFBD4F58();
    *((unsigned char *)v24 + 57) = v40;
    char v44 = 6;
    sub_1BFBCC4BC();
    sub_1BFBD4F58();
    *((unsigned char *)v24 + 58) = v40;
    sub_1BFBCBA4C();
    char v44 = 7;
    sub_1BFBCC510((unint64_t *)&unk_1EBA82490, (void (*)(void))sub_1BFBCC57C);
    sub_1BFBD4F58();
    v24[8] = v40;
    char v44 = 8;
    sub_1BFBCC5D0();
    sub_1BFBD4F58();
    char v28 = v43;
    long long v29 = v41;
    *(_OWORD *)(v24 + 9) = v40;
    *(_OWORD *)(v24 + 11) = v29;
    *(_OWORD *)(v24 + 13) = v42;
    *((unsigned char *)v24 + 12sub_1BFBC5AAC(0, 0) = v28;
    type metadata accessor for PostPurchaseDestination();
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 9;
    sub_1BFBCC624(&qword_1EA187210, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    sub_1BFBD4F08();
    sub_1BFA9C5EC((uint64_t)v38, (uint64_t)v39 + v13[13]);
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 10;
    *((unsigned char *)v39 + v13[14]) = sub_1BFBD4F38() & 1;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 11;
    *((unsigned char *)v39 + v13[15]) = sub_1BFBD4F38() & 1;
    LOBYTE(v4sub_1BFBC5AAC(0, 0) = 12;
    sub_1BFBCC624(&qword_1EA186A38, MEMORY[0x1E4F276F0]);
    sub_1BFBD4F08();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v34, v35);
    sub_1BFA9C680((uint64_t)v32, v36);
    uint64_t v30 = v39;
    sub_1BFA4E9F4((uint64_t)v39, v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    return sub_1BFA65418((uint64_t)v30, (uint64_t (*)(void))type metadata accessor for PurchaseContext);
  }
}

void sub_1BFBCC354(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFBCB8FC();
    unint64_t v7 = a3(a1, &type metadata for PurchaseContext.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BFBCC3B8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1BFA80CF4(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1BFBCC414()
{
  unint64_t result = qword_1EBA820E8;
  if (!qword_1EBA820E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA820E8);
  }
  return result;
}

unint64_t sub_1BFBCC468()
{
  unint64_t result = qword_1EBA822E8;
  if (!qword_1EBA822E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA822E8);
  }
  return result;
}

unint64_t sub_1BFBCC4BC()
{
  unint64_t result = qword_1EBA821D8;
  if (!qword_1EBA821D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA821D8);
  }
  return result;
}

uint64_t sub_1BFBCC510(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BFBCBA4C();
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BFBCC57C()
{
  unint64_t result = qword_1EBA82178;
  if (!qword_1EBA82178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA82178);
  }
  return result;
}

unint64_t sub_1BFBCC5D0()
{
  unint64_t result = qword_1EBA822D0;
  if (!qword_1EBA822D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA822D0);
  }
  return result;
}

uint64_t sub_1BFBCC624(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BFBCC66C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseContext.init(from:)(a1, a2);
}

uint64_t sub_1BFBCC684(void *a1)
{
  return PurchaseContext.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for PurchaseContext(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *(void *)a1 = *a2;
    a1 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 4sub_1BFBC5AAC(0, 0) = v7;
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    *(_WORD *)(a1 + 57) = *(_WORD *)((char *)a2 + 57);
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    uint64_t v9 = a2[10];
    uint64_t v10 = a2[11];
    uint64_t v12 = a2[12];
    uint64_t v11 = a2[13];
    uint64_t v30 = a2[14];
    char v29 = *((unsigned char *)a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BFA6CCA0(v8, v9, v10, v12, v11, v30, v29);
    *(void *)(a1 + 72) = v8;
    *(void *)(a1 + 8sub_1BFBC5AAC(0, 0) = v9;
    *(void *)(a1 + 88) = v10;
    *(void *)(a1 + 96) = v12;
    *(void *)(a1 + 104) = v11;
    *(void *)(a1 + 112) = v30;
    *(unsigned char *)(a1 + 12sub_1BFBC5AAC(0, 0) = v29;
    uint64_t v13 = a3[13];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for PostPurchaseDestination();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v20 = sub_1BFBD1DD8();
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v14, v15, v20);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v14, v15, *(void *)(v17 + 64));
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v21 = a3[15];
    *(unsigned char *)(a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
    *(unsigned char *)(a1 + v21) = *((unsigned char *)a2 + v21);
    uint64_t v22 = a3[16];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = sub_1BFBD1DD8();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
      memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return a1;
}

uint64_t destroy for PurchaseContext(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BFA4EC88(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(unsigned char *)(a1 + 120));
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1BFBD1DD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 64);
  uint64_t v8 = sub_1BFBD1DD8();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

uint64_t initializeWithCopy for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_1BFBC5AAC(0, 0) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 96);
  uint64_t v10 = *(void *)(a2 + 104);
  uint64_t v28 = *(void *)(a2 + 112);
  char v27 = *(unsigned char *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BFA6CCA0(v7, v8, v9, v11, v10, v28, v27);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 8sub_1BFBC5AAC(0, 0) = v8;
  *(void *)(a1 + 88) = v9;
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 104) = v10;
  *(void *)(a1 + 112) = v28;
  *(unsigned char *)(a1 + 12sub_1BFBC5AAC(0, 0) = v27;
  uint64_t v12 = a3[13];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for PostPurchaseDestination();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 16))(v13, v14, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(v16 + 64));
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  uint64_t v20 = a3[16];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  uint64_t v23 = sub_1BFBD1DD8();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

uint64_t assignWithCopy for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 4sub_1BFBC5AAC(0, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 96);
  uint64_t v10 = *(void *)(a2 + 104);
  uint64_t v11 = *(void *)(a2 + 112);
  char v12 = *(unsigned char *)(a2 + 120);
  sub_1BFA6CCA0(v6, v7, v8, v9, v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 96);
  uint64_t v17 = *(void *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 112);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 8sub_1BFBC5AAC(0, 0) = v7;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = v10;
  *(void *)(a1 + 112) = v11;
  char v19 = *(unsigned char *)(a1 + 120);
  *(unsigned char *)(a1 + 12sub_1BFBC5AAC(0, 0) = v12;
  sub_1BFA4EC88(v13, v14, v15, v16, v17, v18, v19);
  uint64_t v20 = a3[13];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = type metadata accessor for PostPurchaseDestination();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v9) = v25(v21, 1, v23);
  int v26 = v25(v22, 1, v23);
  if (!v9)
  {
    if (!v26)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_1BFA65418((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v30 = sub_1BFBD1DD8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v21, v22, v30);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v29 = *(void *)(v24 + 64);
LABEL_8:
      memcpy(v21, v22, v29);
      goto LABEL_14;
    }
    sub_1BFA65418((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
LABEL_7:
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    size_t v29 = *(void *)(*(void *)(v28 - 8) + 64);
    goto LABEL_8;
  }
  if (v26) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v27 = sub_1BFBD1DD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v21, v22, v27);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(v24 + 64));
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_14:
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v31 = a3[16];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  uint64_t v34 = sub_1BFBD1DD8();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v32, v33, v34);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_19;
  }
  if (v38)
  {
LABEL_19:
    sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v39 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v32, v33, v34);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

uint64_t initializeWithTake for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 4sub_1BFBC5AAC(0, 0) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  long long v6 = *(_OWORD *)(a2 + 72);
  long long v7 = *(_OWORD *)(a2 + 88);
  long long v8 = *(_OWORD *)(a2 + 104);
  *(unsigned char *)(a1 + 12sub_1BFBC5AAC(0, 0) = *(unsigned char *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 88) = v7;
  uint64_t v9 = a3[13];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 72) = v6;
  uint64_t v12 = type metadata accessor for PostPurchaseDestination();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_1BFBD1DD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v10, v11, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(v13 + 64));
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v16 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v17 = a3[16];
  uint64_t v18 = (void *)(a1 + v17);
  char v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_1BFBD1DD8();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

uint64_t assignWithTake for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 4sub_1BFBC5AAC(0, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 120);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 104);
  uint64_t v14 = *(void *)(a1 + 112);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  char v15 = *(unsigned char *)(a1 + 120);
  *(unsigned char *)(a1 + 12sub_1BFBC5AAC(0, 0) = v8;
  sub_1BFA4EC88(v9, v10, v11, v12, v13, v14, v15);
  uint64_t v16 = a3[13];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for PostPurchaseDestination();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_1BFA65418((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v27 = sub_1BFBD1DD8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 32))(v17, v18, v27);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v26 = *(void *)(v20 + 64);
LABEL_8:
      memcpy(v17, v18, v26);
      goto LABEL_14;
    }
    sub_1BFA65418((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for PostPurchaseDestination);
LABEL_7:
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    size_t v26 = *(void *)(*(void *)(v25 - 8) + 64);
    goto LABEL_8;
  }
  if (v23) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_1BFBD1DD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 32))(v17, v18, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(v20 + 64));
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_14:
  uint64_t v28 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[16];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = sub_1BFBD1DD8();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 40))(v30, v31, v32);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_19;
  }
  if (v36)
  {
LABEL_19:
    sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
    memcpy(v30, v31, *(void *)(*(void *)(v37 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v30, v31, v32);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BFBCDB18);
}

uint64_t sub_1BFBCDB18(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 64);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BFBCDC90);
}

uint64_t sub_1BFBCDC90(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_1BFA80CF4(0, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      sub_1BFA80CF4(0, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 64);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_1BFBCDDF4()
{
  sub_1BFA80CF4(319, (unint64_t *)&qword_1EBA89420, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
  if (v0 <= 0x3F)
  {
    sub_1BFA80CF4(319, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PurchaseContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x1BFBCE018);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseContext.CodingKeys()
{
  return &type metadata for PurchaseContext.CodingKeys;
}

unint64_t sub_1BFBCE054()
{
  unint64_t result = qword_1EA187218;
  if (!qword_1EA187218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA187218);
  }
  return result;
}

unint64_t sub_1BFBCE0AC()
{
  unint64_t result = qword_1EBA82190;
  if (!qword_1EBA82190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA82190);
  }
  return result;
}

unint64_t sub_1BFBCE104()
{
  unint64_t result = qword_1EBA82188;
  if (!qword_1EBA82188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA82188);
  }
  return result;
}

uint64_t sub_1BFBCE158(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6573616863727570 && a2 == 0xEA00000000004449;
  if (v2 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065707954 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFBF1BD0 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6843656372756F73 && a2 == 0xEF44496C656E6E61 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7365636341626577 && a2 == 0xEE006E4974704F73 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BFBF9000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6974634172657375 && a2 == 0xEA00000000006E6FLL || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x737469617274 && a2 == 0xE600000000000000 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001BFBF9020 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BFBF9040 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001BFBF9060 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x7463657269447369 && a2 == 0xEB00000000797542 || (sub_1BFBD5048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x5565636E616E6966 && a2 == 0xEA00000000004C52)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_1BFBD5048();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t type metadata accessor for AlacartePaywallRenderer()
{
  return self;
}

void sub_1BFBCE700(uint64_t a1, uint64_t a2, char *a3)
{
  id v17 = *(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_titleTextView];
  objc_msgSend(v17, sel_setAttributedText_, *(void *)(a2 + 256));
  id v19 = *(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_subscribeButton];
  objc_msgSend(v19, sel_setAttributedTitle_forState_, *(void *)(a2 + 272), 0);
  char v6 = *(void **)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_webAuthButton];
  id v18 = v6;
  objc_msgSend(v6, sel_setAttributedTitle_forState_, *(void *)(a2 + 280), 0);
  uint64_t v7 = type metadata accessor for AlacartePaywallViewModel();
  objc_msgSend(v6, sel_setHidden_, *(unsigned __int8 *)(a1 + *(int *)(v7 + 48)));
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E48]), sel_initWithAttributedString_, *(void *)(a2 + 264));
  uint64_t v8 = *MEMORY[0x1E4FB0720];
  uint64_t v9 = (void *)sub_1BFBD1D58();
  id v10 = objc_msgSend(v20, sel_mutableString);
  uint64_t v11 = (void *)sub_1BFBD45C8();
  id v12 = objc_msgSend(v10, sel_rangeOfString_, v11);
  uint64_t v14 = v13;

  objc_msgSend(v20, sel_addAttribute_value_range_, v8, v9, v12, v14);
  uint64_t v15 = *(void **)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_descriptionTextView];
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28B18]), sel_initWithAttributedString_, v20);
  objc_msgSend(v15, sel_setAttributedText_, v16);

  objc_msgSend(v15, sel_setHidden_, *(unsigned __int8 *)(a1 + *(int *)(v7 + 52)));
  objc_msgSend(a3, sel_setFrame_, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_gradientMaskView], sel_setFrame_, *(double *)(a2 + 64), *(double *)(a2 + 72), *(double *)(a2 + 80), *(double *)(a2 + 88));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_contentView], sel_setFrame_, *(double *)(a2 + 32), *(double *)(a2 + 40), *(double *)(a2 + 48), *(double *)(a2 + 56));
  objc_msgSend(v17, sel_setFrame_, *(double *)(a2 + 96), *(double *)(a2 + 104), *(double *)(a2 + 112), *(double *)(a2 + 120));
  objc_msgSend(v15, sel_setFrame_, *(double *)(a2 + 160), *(double *)(a2 + 168), *(double *)(a2 + 176), *(double *)(a2 + 184));
  objc_msgSend(v19, sel_setFrame_, *(double *)(a2 + 128), *(double *)(a2 + 136), *(double *)(a2 + 144), *(double *)(a2 + 152));
  objc_msgSend(v18, sel_setFrame_, *(double *)(a2 + 192), *(double *)(a2 + 200), *(double *)(a2 + 208), *(double *)(a2 + 216));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_bottomHairline], sel_setFrame_, *(double *)(a2 + 224), *(double *)(a2 + 232), *(double *)(a2 + 240), *(double *)(a2 + 248));
}

id sub_1BFBCE9D4(int a1, char *a2, double *a3)
{
  uint64_t v4 = v3;
  objc_msgSend(a2, sel_setFrame_, *a3, a3[1], a3[2], a3[3]);
  objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_publisherLogo], sel_setFrame_, a3[4], a3[5], a3[6], a3[7]);
  uint64_t v7 = *(void **)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_headline];
  objc_msgSend(v7, sel_setFrame_, a3[8], a3[9], a3[10], a3[11]);
  uint64_t v8 = *(void **)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_subheadline];
  objc_msgSend(v8, sel_setFrame_, a3[12], a3[13], a3[14], a3[15]);
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
  id v9 = sub_1BFAAC68C();
  int v35 = v7;
  objc_msgSend(v7, sel_setAttributedText_, v9);

  uint64_t v10 = *__swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
  sub_1BFA6DF5C();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BFBD9C70;
  id v12 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  id v14 = v12;
  uint64_t v15 = sub_1BFBD4B18();
  id v16 = (void **)MEMORY[0x1E4FB0738];
  *(void *)(inited + 4sub_1BFBC5AAC(0, 0) = v15;
  id v17 = *v16;
  *(void *)(inited + 64) = v13;
  *(void *)(inited + 72) = v17;
  id v18 = objc_allocWithZone(MEMORY[0x1E4FB0848]);
  id v19 = v17;
  id v20 = objc_msgSend(v18, sel_init);
  objc_msgSend(v20, sel_setAlignment_, 1);
  uint64_t v21 = sub_1BFA4DF3C(0, &qword_1EA185358);
  *(void *)(inited + 8sub_1BFBC5AAC(0, 0) = v20;
  int v22 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 104) = v21;
  *(void *)(inited + 112) = v22;
  int v23 = *(void **)(v10 + 64);
  id v24 = v22;
  id v25 = objc_msgSend(v23, sel_tertiaryColor);
  id v26 = sub_1BFAAD314(v25);

  *(void *)(inited + 144) = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  if (!v26) {
    id v26 = objc_msgSend(self, sel_labelColor);
  }
  *(void *)(inited + 12sub_1BFBC5AAC(0, 0) = v26;
  sub_1BFAF8D10(inited);
  id v27 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  swift_bridgeObjectRetain();
  uint64_t v28 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  uint64_t v29 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v27, sel_initWithString_attributes_, v28, v29);

  objc_msgSend(v8, sel_setAttributedText_, v30);
  MEMORY[0x1F4188790](v31);
  sub_1BFA4DF3C(0, &qword_1EBA86BF8);
  sub_1BFBD2CB8();
  sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA84FF0);
  uint64_t v32 = (void *)sub_1BFBD4A78();
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v33 = a2;
  sub_1BFBD2B68();
  swift_release();
  swift_release();

  swift_release();
  objc_msgSend(v35, sel_setNumberOfLines_, 0);
  objc_msgSend(v35, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_frame);
  objc_msgSend(v8, sel__setFirstLineCapFrameOriginY_, CGRectGetMinY(v36));
  return objc_msgSend(v8, sel_sizeToFit);
}

uint64_t sub_1BFBCEEC4(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v7);
  uint64_t v9 = *(void *)(a2 + 64);
  objc_msgSend(a3, sel_frame);
  return (*(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, double, double))(v8 + 8))(v9, objc_msgSend(a4, sel_userInterfaceStyle), v7, v8, v10, v11);
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintHeaderViewRenderer()
{
  return self;
}

uint64_t sub_1BFBCEFAC()
{
  return sub_1BFBCEEC4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1BFBCEFCC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1BFBCF004(void *a1)
{
  BOOL v2 = *(void **)(*(void *)(v1 + 16)
                + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_publisherLogo);
  objc_msgSend(v2, sel_setImage_, *a1);
  return objc_msgSend(v2, sel_setContentMode_, 1);
}

uint64_t sub_1BFBCF064()
{
  return sub_1BFBD2C38();
}

void sub_1BFBCF0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  double v11 = (void *)swift_allocObject();
  void v11[2] = sub_1BFA4DDE8;
  v11[3] = v10;
  v11[4] = a3;
  v11[5] = a4;
  v13[4] = sub_1BFBCF370;
  v13[5] = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1BFA973C0;
  _OWORD v13[3] = &block_descriptor_37;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_fetchConfigurationIfNeededWithCompletion_, v12);
  _Block_release(v12);
}

void sub_1BFBCF1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BFBCF0C0(a1, a2, a3, a4, *(void **)(v4 + 24));
}

void sub_1BFBCF1F4()
{
  if (!qword_1EBA839B0)
  {
    sub_1BFADDED4();
    unint64_t v0 = sub_1BFBD2C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA839B0);
    }
  }
}

uint64_t sub_1BFBCF24C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BFBCF284(uint64_t a1, void *a2, void (*a3)(), uint64_t a4, void (*a5)())
{
  swift_unknownObjectRetain();
  id v8 = a2;
  sub_1BFADDED4();
  sub_1BFBD2B38();
  if (v10) {
    a5();
  }
  else {
    a3();
  }
  sub_1BFBCF37C(v9, v10);
}

uint64_t sub_1BFBCF330()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1BFBCF370(uint64_t a1, void *a2)
{
  sub_1BFBCF284(a1, a2, *(void (**)())(v2 + 16), *(void *)(v2 + 24), *(void (**)())(v2 + 32));
}

void sub_1BFBCF37C(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_unknownObjectRelease();
  }
}

id sub_1BFBCF448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UnselectableLinkEnabledTextView()
{
  return self;
}

uint64_t type metadata accessor for HideMyEmailSignupViewController()
{
  return self;
}

uint64_t sub_1BFBCF6B8()
{
  return sub_1BFBD3088();
}

void sub_1BFBCF6E4()
{
  v19.receiver = v0;
  v19.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v19, sel_viewDidLoad);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_blueprintViewController];
  objc_msgSend(v0, sel_addChildViewController_, v1);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  objc_msgSend(v3, sel_addSubview_, v4);

  objc_msgSend(v1, sel_didMoveToParentViewController_, v0);
  id v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v0, sel_view);
  if (v8)
  {
    uint64_t v9 = v8;
    objc_msgSend(v8, sel_bounds);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v7, sel_setFrame_, v11, v13, v15, v17);
    id v18 = objc_msgSend(v0, sel_traitCollection);
    sub_1BFBD1078();

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1BFBCFA50(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for PurchaseContext();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = &v1[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_purchasePresenter];
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_purchasePresenter + 24];
  uint64_t v9 = *((void *)v7 + 4);
  __swift_project_boxed_opaque_existential_1(v7, v8);
  uint64_t v17 = 0;
  char v18 = 2;
  PurchasePresenterType.presentPurchase(on:with:type:)((uint64_t)v2, a1, &v17, v8, v9);
  sub_1BFA6AE24();
  double v10 = (void *)sub_1BFBD4A78();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1BFA4E9F4(a1, (uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  sub_1BFA4ECF4((uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_1BFBD2B68();
  swift_release();

  swift_release();
  double v14 = (void *)sub_1BFBD4A78();
  *(void *)(swift_allocObject() + 16) = v2;
  id v15 = v2;
  sub_1BFBD2B98();
  swift_release();
  swift_release();

  return swift_release();
}

void sub_1BFBCFC80(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PurchaseContext();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = *a1;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x1C18BCCA0](a2 + 16);
  if (v11)
  {
    unint64_t v12 = (void *)v11;
    sub_1BFA4E9F4(a3, (uint64_t)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v15 = swift_allocObject();
    sub_1BFA4ECF4((uint64_t)v9, v15 + v13);
    *(void *)(v15 + v14) = v12;
    *(void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = v10;
    aBlock[4] = sub_1BFBD0FE0;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BFAAED70;
    aBlock[3] = &block_descriptor_38;
    double v16 = _Block_copy(aBlock);
    id v17 = v12;
    id v18 = v10;
    swift_release();
    objc_msgSend(v17, sel_dismissViewControllerAnimated_completion_, 1, v16);
    _Block_release(v16);
  }
}

uint64_t sub_1BFBCFE64(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(result + 16))
  {
    uint64_t v4 = result;
    if (*(unsigned char *)(result + 120) != 2
      || (uint64_t v5 = *(void *)(result + 96),
          uint64_t v6 = *(void *)(result + 72),
          uint64_t v7 = *(void *)(result + 104) | *(void *)(result + 112),
          uint64_t v8 = *(void *)(result + 88) | *(void *)(result + 80),
          v7 | v6 | v5 | v8)
      && ((v9 = v7 | v5 | v8, v6 == 1) ? (BOOL v10 = v9 == 0) : (BOOL v10 = 0), !v10))
    {
      uint64_t v11 = *(void *)(*(void *)(a2 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                      + 40);
      uint64_t ObjectType = swift_getObjectType();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a3, v4, ObjectType, v11);
    }
  }
  return result;
}

uint64_t sub_1BFBCFF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1BFBD38F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a3, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (result == *MEMORY[0x1E4FAD508])
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    if (result == *MEMORY[0x1E4FAD4E0])
    {
      uint64_t v10 = *(void *)(*(void *)(v3 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                      + 40);
      uint64_t ObjectType = swift_getObjectType();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(ObjectType, v10);
    }
    if (result != *MEMORY[0x1E4FAD500] && result != *MEMORY[0x1E4FAD4E8])
    {
      if (result == *MEMORY[0x1E4FAD510]) {
        return result;
      }
      if (result != *MEMORY[0x1E4FAD528]) {
        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
    }
  }
  uint64_t v13 = *(void *)(*(void *)(v3 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                  + 40);
  uint64_t v14 = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 40))(v14, v13);
}

void sub_1BFBD0114()
{
  id v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_navigationBar);

    sub_1BFBD4B28();
  }
}

uint64_t sub_1BFBD01B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD0](a1, a2, a3, ObjectType, a5);
}

uint64_t sub_1BFBD0220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(v2 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                 + 40);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a2, ObjectType, v4);
}

uint64_t sub_1BFBD0280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD0](a1, a2, a3, ObjectType, a5);
}

uint64_t sub_1BFBD02E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AC0](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AC8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD0](a1, a2, a3, ObjectType, a5);
}

uint64_t sub_1BFBD0400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD04B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD05B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD066C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162B28](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD06C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AD0](a1, a2, a3, ObjectType, a5);
}

uint64_t sub_1BFBD072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AE8](a1, a2, a3, ObjectType, a5);
}

uint64_t sub_1BFBD0794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162A88](a1, ObjectType, a3);
}

uint64_t sub_1BFBD07E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162A88](a1, ObjectType, a3);
}

uint64_t sub_1BFBD0834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AB8](a1, ObjectType, a3);
}

uint64_t sub_1BFBD0884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162A88](a1, ObjectType, a3);
}

uint64_t sub_1BFBD08D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162A88](a1, ObjectType, a3);
}

uint64_t sub_1BFBD0924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AC8](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD097C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AA0](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD09D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return MEMORY[0x1F4162AA0](a1, a2, ObjectType, a4);
}

uint64_t sub_1BFBD0A2C()
{
  return sub_1BFBD3538();
}

uint64_t sub_1BFBD0A58()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                 + 40);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1);
}

uint64_t sub_1BFBD0AA4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBD0ADC()
{
  uint64_t v1 = type metadata accessor for PurchaseContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BFA4EC88(*(void *)(v5 + 72), *(void *)(v5 + 80), *(void *)(v5 + 88), *(void *)(v5 + 96), *(void *)(v5 + 104), *(void *)(v5 + 112), *(unsigned char *)(v5 + 120));
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 52);
  uint64_t v7 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1BFBD1DD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  uint64_t v9 = v5 + *(int *)(v1 + 64);
  uint64_t v10 = sub_1BFBD1DD8();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

void sub_1BFBD0CF0(void **a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PurchaseContext() - 8);
  sub_1BFBCFC80(a1, *(void *)(v1 + 16), v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_1BFBD0D70()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BFBD0DA8()
{
  uint64_t v1 = type metadata accessor for PurchaseContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BFA4EC88(*(void *)(v5 + 72), *(void *)(v5 + 80), *(void *)(v5 + 88), *(void *)(v5 + 96), *(void *)(v5 + 104), *(void *)(v5 + 112), *(unsigned char *)(v5 + 120));
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 52);
  uint64_t v7 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1BFBD1DD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  uint64_t v9 = v5 + *(int *)(v1 + 64);
  uint64_t v10 = sub_1BFBD1DD8();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  unint64_t v12 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;

  return MEMORY[0x1F4186498](v0, v13 + 8, v2 | 7);
}

uint64_t sub_1BFBD0FE0()
{
  uint64_t v1 = *(void *)(type metadata accessor for PurchaseContext() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_1BFBCFE64(v0 + v2, v4, v5);
}

void sub_1BFBD1078()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_styler];
  sub_1BFA4DFE0((uint64_t)&v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_styler], (uint64_t)v11);
  unint64_t v2 = __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  id v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(*(id *)(*v2 + 64), sel_backgroundColor);
    id v6 = sub_1BFAAD314(v5);

    if (!v6) {
      id v6 = objc_msgSend(self, sel_systemBackgroundColor);
    }
    objc_msgSend(v4, sel_setBackgroundColor_, v6);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v1, *((void *)v1 + 3));
    sub_1BFBD3508();
    uint64_t v8 = (void *)sub_1BFBD3418();
    swift_release();
    id v9 = objc_msgSend(*(id *)(*v7 + 64), sel_backgroundColor);
    id v10 = sub_1BFAAD314(v9);

    if (!v10) {
      id v10 = objc_msgSend(self, sel_systemBackgroundColor);
    }
    objc_msgSend(v8, sel_setBackgroundColor_, v10);

    objc_msgSend(v8, sel_setSeparatorStyle_, 0);
  }
  else
  {
    __break(1u);
  }
}

BOOL static PurchaseErrorAlert.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PurchaseErrorAlert.hash(into:)()
{
  return sub_1BFBD5108();
}

uint64_t PurchaseErrorAlert.hashValue.getter()
{
  return sub_1BFBD5128();
}

unint64_t sub_1BFBD12AC()
{
  unint64_t result = qword_1EA1872B0;
  if (!qword_1EA1872B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1872B0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PurchaseErrorAlert(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFBD13CCLL);
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

ValueMetadata *type metadata accessor for PurchaseErrorAlert()
{
  return &type metadata for PurchaseErrorAlert;
}

unsigned char *storeEnumTagSinglePayload for PurchaseLookupError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BFBD14A0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseLookupError()
{
  return &type metadata for PurchaseLookupError;
}

unint64_t sub_1BFBD14DC()
{
  unint64_t result = qword_1EA1872B8;
  if (!qword_1EA1872B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1872B8);
  }
  return result;
}

void sub_1BFBD1530(char *a1, double *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v7 = *(void **)&a1[OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email];
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB0848]), sel_init);
  objc_msgSend(v8, sel_setLineBreakMode_, 5);
  sub_1BFA6DF5C();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BFBD9C70;
  id v10 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BE0);
  swift_bridgeObjectRetain();
  id v12 = v10;
  *(void *)(inited + 4sub_1BFBC5AAC(0, 0) = sub_1BFBD4B18();
  unint64_t v13 = (void *)*MEMORY[0x1E4FB0700];
  *(void *)(inited + 64) = v11;
  *(void *)(inited + 72) = v13;
  uint64_t v14 = self;
  id v15 = v13;
  id v34 = v14;
  id v16 = objc_msgSend(v14, sel_labelColor);
  uint64_t v17 = sub_1BFA4DF3C(0, &qword_1EBA86BF0);
  *(void *)(inited + 8sub_1BFBC5AAC(0, 0) = v16;
  id v18 = (void *)*MEMORY[0x1E4FB0738];
  *(void *)(inited + 104) = v17;
  *(void *)(inited + 112) = v18;
  *(void *)(inited + 144) = sub_1BFA4DF3C(0, (unint64_t *)&unk_1EBA86BC0);
  *(void *)(inited + 12sub_1BFBC5AAC(0, 0) = v8;
  id v19 = v18;
  id v20 = v8;
  sub_1BFAF8D10(inited);
  id v21 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  int v22 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BFA6E020();
  int v23 = (void *)sub_1BFBD4558();
  swift_bridgeObjectRelease();
  id v24 = objc_msgSend(v21, sel_initWithString_attributes_, v22, v23);

  objc_msgSend(v7, sel_setAttributedText_, v24);
  __swift_project_boxed_opaque_existential_1((void *)(v35 + 16), *(void *)(v35 + 40));
  id v25 = sub_1BFAAC59C(a5);
  if (v25)
  {
    id v26 = v25;
    id v27 = a1;
  }
  else
  {
    id v27 = a1;
    id v26 = objc_msgSend(a1, sel_tintColor);
    if (!v26)
    {
LABEL_9:
      __break(1u);
      return;
    }
  }
  uint64_t v28 = *(void **)&v27[OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark];
  uint64_t v29 = (void *)sub_1BFBD45C8();
  id v30 = objc_msgSend(self, sel_systemImageNamed_, v29);

  if (!v30)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v31 = objc_msgSend(v30, sel_imageWithTintColor_renderingMode_, v26, 1);

  objc_msgSend(v28, sel_setImage_, v31);
  objc_msgSend(v28, sel_setHidden_, (a5 & 1) == 0);
  objc_msgSend(v7, sel_setFrame_, a2[1], a2[2], a2[3], a2[4]);
  objc_msgSend(v28, sel_setFrame_, a2[5], a2[6], a2[7], a2[8]);
  objc_msgSend(v7, sel_setNumberOfLines_, 1);
  id v32 = objc_msgSend(*(id *)(*__swift_project_boxed_opaque_existential_1((void *)(v35 + 16), *(void *)(v35 + 40)) + 64), sel_backgroundColor);
  id v33 = sub_1BFAAD314(v32);

  if (!v33) {
    id v33 = objc_msgSend(v34, sel_systemBackgroundColor);
  }
  objc_msgSend(a1, sel_setBackgroundColor_, v33);
}

uint64_t type metadata accessor for HideMyEmailSignupAlternateViewRenderer()
{
  return self;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1BFBD1A68()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1BFBD1A78()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1BFBD1A88()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1BFBD1A98()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1BFBD1AA8()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1BFBD1AB8()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1BFBD1AC8()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1BFBD1AD8()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1BFBD1AE8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1BFBD1AF8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1BFBD1B08()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1BFBD1B18()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1BFBD1B28()
{
  return MEMORY[0x1F40E32E8]();
}

uint64_t sub_1BFBD1B38()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1BFBD1B48()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1BFBD1B58()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1BFBD1B68()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1BFBD1B78()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1BFBD1B88()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1BFBD1B98()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1BFBD1BA8()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1BFBD1BB8()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1BFBD1BC8()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1BFBD1BD8()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1BFBD1BE8()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1BFBD1BF8()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1BFBD1C08()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1BFBD1C18()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1BFBD1C28()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1BFBD1C38()
{
  return MEMORY[0x1F40E3728]();
}

uint64_t sub_1BFBD1C48()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1BFBD1C58()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1BFBD1C68()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1BFBD1C78()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1BFBD1CC8()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1BFBD1CF8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1BFBD1D08()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BFBD1D18()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1BFBD1D28()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1BFBD1D38()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1BFBD1D48()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1BFBD1D58()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BFBD1D68()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1BFBD1D78()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1BFBD1D88()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1BFBD1D98()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1BFBD1DA8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1BFBD1DB8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1BFBD1DC8()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1BFBD1DD8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BFBD1DE8()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1BFBD1DF8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BFBD1E08()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1BFBD1E18()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BFBD1E28()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1BFBD1E38()
{
  return MEMORY[0x1F40E50D0]();
}

uint64_t sub_1BFBD1E48()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1BFBD1E58()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1BFBD1E68()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1BFBD1E78()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1BFBD1E88()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1BFBD1E98()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1BFBD1EA8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1BFBD1EB8()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1BFBD1EC8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BFBD1ED8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BFBD1EE8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BFBD1EF8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BFBD1F08()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BFBD1F18()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1BFBD1F28()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1BFBD1F38()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1BFBD1F48()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1BFBD1F58()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1BFBD1F68()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1BFBD1F78()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1BFBD1F88()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1BFBD1F98()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1BFBD1FA8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BFBD1FB8()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1BFBD1FC8()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1BFBD1FD8()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1BFBD1FE8()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1BFBD1FF8()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1BFBD2008()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1BFBD2018()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1BFBD2028()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1BFBD2038()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1BFBD2048()
{
  return MEMORY[0x1F415F218]();
}

uint64_t sub_1BFBD2058()
{
  return MEMORY[0x1F415F220]();
}

uint64_t sub_1BFBD2068()
{
  return MEMORY[0x1F415F228]();
}

uint64_t sub_1BFBD2098()
{
  return MEMORY[0x1F415F248]();
}

uint64_t sub_1BFBD20B8()
{
  return MEMORY[0x1F415F260]();
}

uint64_t sub_1BFBD20C8()
{
  return MEMORY[0x1F415F268]();
}

uint64_t sub_1BFBD20D8()
{
  return MEMORY[0x1F415F270]();
}

uint64_t sub_1BFBD20E8()
{
  return MEMORY[0x1F415F278]();
}

uint64_t _s11TeaSettings0B0C16NewsSubscriptionE10BestOffersV15ConfigOverridesCfd_0()
{
  return MEMORY[0x1F415F290]();
}

uint64_t sub_1BFBD2108()
{
  return MEMORY[0x1F415F2D0]();
}

uint64_t sub_1BFBD2118()
{
  return MEMORY[0x1F415F2D8]();
}

uint64_t sub_1BFBD2128()
{
  return MEMORY[0x1F415F308]();
}

uint64_t sub_1BFBD2138()
{
  return MEMORY[0x1F415F310]();
}

uint64_t sub_1BFBD2148()
{
  return MEMORY[0x1F415F370]();
}

uint64_t sub_1BFBD2158()
{
  return MEMORY[0x1F415F378]();
}

uint64_t sub_1BFBD2168()
{
  return MEMORY[0x1F415F3B0]();
}

uint64_t sub_1BFBD2178()
{
  return MEMORY[0x1F415F3D8]();
}

uint64_t sub_1BFBD2188()
{
  return MEMORY[0x1F415F3E0]();
}

uint64_t sub_1BFBD2198()
{
  return MEMORY[0x1F415F3E8]();
}

uint64_t sub_1BFBD21A8()
{
  return MEMORY[0x1F415F3F0]();
}

uint64_t sub_1BFBD21B8()
{
  return MEMORY[0x1F415F3F8]();
}

uint64_t sub_1BFBD21C8()
{
  return MEMORY[0x1F415F408]();
}

uint64_t sub_1BFBD21D8()
{
  return MEMORY[0x1F415F410]();
}

uint64_t sub_1BFBD21E8()
{
  return MEMORY[0x1F415F428]();
}

uint64_t sub_1BFBD21F8()
{
  return MEMORY[0x1F415F430]();
}

uint64_t sub_1BFBD2208()
{
  return MEMORY[0x1F415F448]();
}

uint64_t sub_1BFBD2218()
{
  return MEMORY[0x1F415F450]();
}

uint64_t sub_1BFBD2228()
{
  return MEMORY[0x1F415F4C8]();
}

uint64_t sub_1BFBD2238()
{
  return MEMORY[0x1F415F4D0]();
}

uint64_t sub_1BFBD2268()
{
  return MEMORY[0x1F415F6B8]();
}

uint64_t sub_1BFBD2278()
{
  return MEMORY[0x1F415F708]();
}

uint64_t sub_1BFBD2288()
{
  return MEMORY[0x1F415F780]();
}

uint64_t sub_1BFBD2298()
{
  return MEMORY[0x1F415F890]();
}

uint64_t sub_1BFBD22A8()
{
  return MEMORY[0x1F415F8C0]();
}

uint64_t sub_1BFBD22B8()
{
  return MEMORY[0x1F415F8C8]();
}

uint64_t sub_1BFBD22C8()
{
  return MEMORY[0x1F415F8E8]();
}

uint64_t sub_1BFBD22D8()
{
  return MEMORY[0x1F4108798]();
}

uint64_t sub_1BFBD22E8()
{
  return MEMORY[0x1F41087C0]();
}

uint64_t sub_1BFBD22F8()
{
  return MEMORY[0x1F415FB20]();
}

uint64_t sub_1BFBD2308()
{
  return MEMORY[0x1F415D9B0]();
}

uint64_t sub_1BFBD2318()
{
  return MEMORY[0x1F415D9C0]();
}

uint64_t sub_1BFBD2328()
{
  return MEMORY[0x1F415D9C8]();
}

uint64_t sub_1BFBD2338()
{
  return MEMORY[0x1F415D9E8]();
}

uint64_t sub_1BFBD2348()
{
  return MEMORY[0x1F415D9F0]();
}

uint64_t sub_1BFBD2358()
{
  return MEMORY[0x1F415D9F8]();
}

uint64_t sub_1BFBD2368()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1BFBD2378()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1BFBD2388()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1BFBD2398()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1BFBD23A8()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1BFBD23B8()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1BFBD23C8()
{
  return MEMORY[0x1F415DB20]();
}

uint64_t sub_1BFBD23D8()
{
  return MEMORY[0x1F415DB78]();
}

uint64_t sub_1BFBD23E8()
{
  return MEMORY[0x1F415DB80]();
}

uint64_t sub_1BFBD23F8()
{
  return MEMORY[0x1F415DB88]();
}

uint64_t sub_1BFBD2408()
{
  return MEMORY[0x1F415DBF0]();
}

uint64_t sub_1BFBD2418()
{
  return MEMORY[0x1F415DBF8]();
}

uint64_t sub_1BFBD2428()
{
  return MEMORY[0x1F415DC68]();
}

uint64_t sub_1BFBD2438()
{
  return MEMORY[0x1F415DCA0]();
}

uint64_t sub_1BFBD2448()
{
  return MEMORY[0x1F415DCB8]();
}

uint64_t sub_1BFBD2458()
{
  return MEMORY[0x1F415DCD0]();
}

uint64_t sub_1BFBD2468()
{
  return MEMORY[0x1F415DCE0]();
}

uint64_t sub_1BFBD2478()
{
  return MEMORY[0x1F415DCF8]();
}

uint64_t sub_1BFBD2488()
{
  return MEMORY[0x1F415DD00]();
}

uint64_t sub_1BFBD2498()
{
  return MEMORY[0x1F415DD40]();
}

uint64_t sub_1BFBD24A8()
{
  return MEMORY[0x1F415DD48]();
}

uint64_t sub_1BFBD24B8()
{
  return MEMORY[0x1F415DD50]();
}

uint64_t sub_1BFBD24C8()
{
  return MEMORY[0x1F415DD58]();
}

uint64_t sub_1BFBD24D8()
{
  return MEMORY[0x1F415DD60]();
}

uint64_t sub_1BFBD24E8()
{
  return MEMORY[0x1F415DD68]();
}

uint64_t sub_1BFBD24F8()
{
  return MEMORY[0x1F415DD70]();
}

uint64_t sub_1BFBD2508()
{
  return MEMORY[0x1F415DE28]();
}

uint64_t sub_1BFBD2518()
{
  return MEMORY[0x1F415DEA0]();
}

uint64_t sub_1BFBD2528()
{
  return MEMORY[0x1F415DEB0]();
}

uint64_t sub_1BFBD2538()
{
  return MEMORY[0x1F415DED8]();
}

uint64_t sub_1BFBD2548()
{
  return MEMORY[0x1F415DEE0]();
}

uint64_t sub_1BFBD2558()
{
  return MEMORY[0x1F415DF50]();
}

uint64_t sub_1BFBD2568()
{
  return MEMORY[0x1F415DF70]();
}

uint64_t sub_1BFBD2578()
{
  return MEMORY[0x1F415DF80]();
}

uint64_t sub_1BFBD2588()
{
  return MEMORY[0x1F415DF88]();
}

uint64_t sub_1BFBD2598()
{
  return MEMORY[0x1F415DF90]();
}

uint64_t sub_1BFBD25A8()
{
  return MEMORY[0x1F415DF98]();
}

uint64_t sub_1BFBD25B8()
{
  return MEMORY[0x1F415DFA0]();
}

uint64_t sub_1BFBD25C8()
{
  return MEMORY[0x1F415DFD8]();
}

uint64_t sub_1BFBD25D8()
{
  return MEMORY[0x1F415DFE8]();
}

uint64_t sub_1BFBD25E8()
{
  return MEMORY[0x1F415DFF0]();
}

uint64_t sub_1BFBD25F8()
{
  return MEMORY[0x1F415DFF8]();
}

uint64_t sub_1BFBD2608()
{
  return MEMORY[0x1F415E000]();
}

uint64_t sub_1BFBD2618()
{
  return MEMORY[0x1F415E010]();
}

uint64_t sub_1BFBD2628()
{
  return MEMORY[0x1F415E0C0]();
}

uint64_t sub_1BFBD2638()
{
  return MEMORY[0x1F415E0C8]();
}

uint64_t sub_1BFBD2648()
{
  return MEMORY[0x1F415E0D0]();
}

uint64_t sub_1BFBD2658()
{
  return MEMORY[0x1F415E0E0]();
}

uint64_t sub_1BFBD2668()
{
  return MEMORY[0x1F415E0F8]();
}

uint64_t sub_1BFBD2678()
{
  return MEMORY[0x1F415E110]();
}

uint64_t sub_1BFBD2688()
{
  return MEMORY[0x1F415E118]();
}

uint64_t sub_1BFBD2698()
{
  return MEMORY[0x1F415E120]();
}

uint64_t sub_1BFBD26A8()
{
  return MEMORY[0x1F415E128]();
}

uint64_t sub_1BFBD26B8()
{
  return MEMORY[0x1F415E138]();
}

uint64_t sub_1BFBD26C8()
{
  return MEMORY[0x1F415E240]();
}

uint64_t sub_1BFBD26D8()
{
  return MEMORY[0x1F415E250]();
}

uint64_t sub_1BFBD26E8()
{
  return MEMORY[0x1F415E258]();
}

uint64_t sub_1BFBD26F8()
{
  return MEMORY[0x1F415E260]();
}

uint64_t sub_1BFBD2708()
{
  return MEMORY[0x1F415E268]();
}

uint64_t sub_1BFBD2718()
{
  return MEMORY[0x1F415E270]();
}

uint64_t sub_1BFBD2728()
{
  return MEMORY[0x1F415E280]();
}

uint64_t sub_1BFBD2738()
{
  return MEMORY[0x1F415E2A8]();
}

uint64_t sub_1BFBD2748()
{
  return MEMORY[0x1F415E2E8]();
}

uint64_t sub_1BFBD2758()
{
  return MEMORY[0x1F415E330]();
}

uint64_t sub_1BFBD2768()
{
  return MEMORY[0x1F415E338]();
}

uint64_t sub_1BFBD2798()
{
  return MEMORY[0x1F415E3B0]();
}

uint64_t sub_1BFBD27B8()
{
  return MEMORY[0x1F415E3C0]();
}

uint64_t sub_1BFBD27C8()
{
  return MEMORY[0x1F415E3C8]();
}

uint64_t sub_1BFBD27D8()
{
  return MEMORY[0x1F415E3D0]();
}

uint64_t sub_1BFBD27E8()
{
  return MEMORY[0x1F415E3D8]();
}

uint64_t sub_1BFBD2808()
{
  return MEMORY[0x1F415E400]();
}

uint64_t sub_1BFBD2818()
{
  return MEMORY[0x1F415E408]();
}

uint64_t sub_1BFBD2828()
{
  return MEMORY[0x1F415E440]();
}

uint64_t sub_1BFBD2838()
{
  return MEMORY[0x1F415E448]();
}

uint64_t sub_1BFBD2848()
{
  return MEMORY[0x1F415E450]();
}

uint64_t sub_1BFBD2858()
{
  return MEMORY[0x1F415E460]();
}

uint64_t sub_1BFBD2868()
{
  return MEMORY[0x1F415E468]();
}

uint64_t sub_1BFBD2878()
{
  return MEMORY[0x1F415E470]();
}

uint64_t sub_1BFBD2888()
{
  return MEMORY[0x1F415E480]();
}

uint64_t sub_1BFBD2898()
{
  return MEMORY[0x1F415E530]();
}

uint64_t sub_1BFBD28A8()
{
  return MEMORY[0x1F415E550]();
}

uint64_t sub_1BFBD28B8()
{
  return MEMORY[0x1F415E580]();
}

uint64_t sub_1BFBD28C8()
{
  return MEMORY[0x1F415E590]();
}

uint64_t sub_1BFBD28D8()
{
  return MEMORY[0x1F415E5D8]();
}

uint64_t sub_1BFBD28E8()
{
  return MEMORY[0x1F415E5E0]();
}

uint64_t sub_1BFBD28F8()
{
  return MEMORY[0x1F415E5E8]();
}

uint64_t sub_1BFBD2908()
{
  return MEMORY[0x1F415E5F0]();
}

uint64_t sub_1BFBD2918()
{
  return MEMORY[0x1F415E6A0]();
}

uint64_t sub_1BFBD2928()
{
  return MEMORY[0x1F415E6A8]();
}

uint64_t sub_1BFBD2938()
{
  return MEMORY[0x1F415E6B0]();
}

uint64_t sub_1BFBD2948()
{
  return MEMORY[0x1F415E6F8]();
}

uint64_t sub_1BFBD2958()
{
  return MEMORY[0x1F415E708]();
}

uint64_t sub_1BFBD2968()
{
  return MEMORY[0x1F415E788]();
}

uint64_t sub_1BFBD2978()
{
  return MEMORY[0x1F415FB58]();
}

uint64_t sub_1BFBD2998()
{
  return MEMORY[0x1F415E7D8]();
}

uint64_t sub_1BFBD29A8()
{
  return MEMORY[0x1F415E7E0]();
}

uint64_t sub_1BFBD29B8()
{
  return MEMORY[0x1F415E7E8]();
}

uint64_t sub_1BFBD29C8()
{
  return MEMORY[0x1F415E840]();
}

uint64_t sub_1BFBD29D8()
{
  return MEMORY[0x1F415E848]();
}

uint64_t sub_1BFBD29E8()
{
  return MEMORY[0x1F415E8E0]();
}

uint64_t sub_1BFBD29F8()
{
  return MEMORY[0x1F415E900]();
}

uint64_t sub_1BFBD2A08()
{
  return MEMORY[0x1F415E9D8]();
}

uint64_t sub_1BFBD2A18()
{
  return MEMORY[0x1F415E9F0]();
}

uint64_t sub_1BFBD2A28()
{
  return MEMORY[0x1F415E9F8]();
}

uint64_t sub_1BFBD2A38()
{
  return MEMORY[0x1F415EA28]();
}

uint64_t sub_1BFBD2A48()
{
  return MEMORY[0x1F415EA30]();
}

uint64_t sub_1BFBD2A58()
{
  return MEMORY[0x1F415EA38]();
}

uint64_t sub_1BFBD2A68()
{
  return MEMORY[0x1F415EA50]();
}

uint64_t sub_1BFBD2A78()
{
  return MEMORY[0x1F415EA60]();
}

uint64_t sub_1BFBD2A88()
{
  return MEMORY[0x1F415EA70]();
}

uint64_t sub_1BFBD2A98()
{
  return MEMORY[0x1F415EA78]();
}

uint64_t sub_1BFBD2AA8()
{
  return MEMORY[0x1F415EA98]();
}

uint64_t sub_1BFBD2AB8()
{
  return MEMORY[0x1F415EAA0]();
}

uint64_t sub_1BFBD2AC8()
{
  return MEMORY[0x1F415EAA8]();
}

uint64_t sub_1BFBD2AD8()
{
  return MEMORY[0x1F415EB10]();
}

uint64_t sub_1BFBD2AE8()
{
  return MEMORY[0x1F415EB18]();
}

uint64_t sub_1BFBD2AF8()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1BFBD2B08()
{
  return MEMORY[0x1F415EB38]();
}

uint64_t sub_1BFBD2B18()
{
  return MEMORY[0x1F415EB48]();
}

uint64_t sub_1BFBD2B28()
{
  return MEMORY[0x1F415EB50]();
}

uint64_t sub_1BFBD2B38()
{
  return MEMORY[0x1F415EB98]();
}

uint64_t sub_1BFBD2B48()
{
  return MEMORY[0x1F415EBE8]();
}

uint64_t sub_1BFBD2B58()
{
  return MEMORY[0x1F415EC10]();
}

uint64_t sub_1BFBD2B68()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1BFBD2B78()
{
  return MEMORY[0x1F415EC20]();
}

uint64_t sub_1BFBD2B88()
{
  return MEMORY[0x1F415EC28]();
}

uint64_t sub_1BFBD2B98()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1BFBD2BA8()
{
  return MEMORY[0x1F415EC50]();
}

uint64_t sub_1BFBD2BB8()
{
  return MEMORY[0x1F415EC60]();
}

uint64_t sub_1BFBD2BC8()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1BFBD2BD8()
{
  return MEMORY[0x1F415EC78]();
}

uint64_t sub_1BFBD2BE8()
{
  return MEMORY[0x1F415EC88]();
}

uint64_t sub_1BFBD2BF8()
{
  return MEMORY[0x1F415EC90]();
}

uint64_t sub_1BFBD2C08()
{
  return MEMORY[0x1F415EC98]();
}

uint64_t sub_1BFBD2C18()
{
  return MEMORY[0x1F415ECA0]();
}

uint64_t sub_1BFBD2C28()
{
  return MEMORY[0x1F415ECA8]();
}

uint64_t sub_1BFBD2C38()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1BFBD2C48()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1BFBD2C58()
{
  return MEMORY[0x1F415ED58]();
}

uint64_t sub_1BFBD2C68()
{
  return MEMORY[0x1F415ED78]();
}

uint64_t sub_1BFBD2C78()
{
  return MEMORY[0x1F415ED80]();
}

uint64_t sub_1BFBD2C88()
{
  return MEMORY[0x1F415EDA0]();
}

uint64_t sub_1BFBD2C98()
{
  return MEMORY[0x1F415EDF0]();
}

uint64_t sub_1BFBD2CA8()
{
  return MEMORY[0x1F415EE08]();
}

uint64_t sub_1BFBD2CB8()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1BFBD2CD8()
{
  return MEMORY[0x1F415EEE8]();
}

uint64_t sub_1BFBD2CE8()
{
  return MEMORY[0x1F415EF88]();
}

uint64_t sub_1BFBD2CF8()
{
  return MEMORY[0x1F4146750]();
}

uint64_t sub_1BFBD2D08()
{
  return MEMORY[0x1F4146758]();
}

uint64_t sub_1BFBD2D18()
{
  return MEMORY[0x1F4138DC8]();
}

uint64_t sub_1BFBD2D28()
{
  return MEMORY[0x1F4138DD0]();
}

uint64_t sub_1BFBD2D38()
{
  return MEMORY[0x1F4138DD8]();
}

uint64_t sub_1BFBD2D48()
{
  return MEMORY[0x1F4138E80]();
}

uint64_t sub_1BFBD2D58()
{
  return MEMORY[0x1F4138E90]();
}

uint64_t sub_1BFBD2D68()
{
  return MEMORY[0x1F4138E98]();
}

uint64_t sub_1BFBD2D78()
{
  return MEMORY[0x1F4138EA0]();
}

uint64_t sub_1BFBD2D88()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BFBD2D98()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1BFBD2DA8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BFBD2DB8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BFBD2DC8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BFBD2DD8()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1BFBD2DE8()
{
  return MEMORY[0x1F415D5A8]();
}

uint64_t sub_1BFBD2DF8()
{
  return MEMORY[0x1F415D5B0]();
}

uint64_t sub_1BFBD2E08()
{
  return MEMORY[0x1F415D5D8]();
}

uint64_t sub_1BFBD2E18()
{
  return MEMORY[0x1F415D5E0]();
}

uint64_t sub_1BFBD2E28()
{
  return MEMORY[0x1F415D5E8]();
}

uint64_t sub_1BFBD2E38()
{
  return MEMORY[0x1F415D5F0]();
}

uint64_t sub_1BFBD2E48()
{
  return MEMORY[0x1F415D5F8]();
}

uint64_t sub_1BFBD2E58()
{
  return MEMORY[0x1F415D600]();
}

uint64_t sub_1BFBD2E68()
{
  return MEMORY[0x1F415D608]();
}

uint64_t sub_1BFBD2E78()
{
  return MEMORY[0x1F415D618]();
}

uint64_t sub_1BFBD2E88()
{
  return MEMORY[0x1F415D620]();
}

uint64_t sub_1BFBD2E98()
{
  return MEMORY[0x1F415D640]();
}

uint64_t sub_1BFBD2EA8()
{
  return MEMORY[0x1F415D668]();
}

uint64_t sub_1BFBD2EB8()
{
  return MEMORY[0x1F415D818]();
}

uint64_t sub_1BFBD2EC8()
{
  return MEMORY[0x1F415D828]();
}

uint64_t sub_1BFBD2ED8()
{
  return MEMORY[0x1F415D838]();
}

uint64_t sub_1BFBD2EE8()
{
  return MEMORY[0x1F415D848]();
}

uint64_t sub_1BFBD2EF8()
{
  return MEMORY[0x1F415D850]();
}

uint64_t sub_1BFBD2F08()
{
  return MEMORY[0x1F415D888]();
}

uint64_t sub_1BFBD2F18()
{
  return MEMORY[0x1F415D898]();
}

uint64_t sub_1BFBD2F28()
{
  return MEMORY[0x1F415D8A0]();
}

uint64_t sub_1BFBD2F38()
{
  return MEMORY[0x1F415D8A8]();
}

uint64_t sub_1BFBD2F48()
{
  return MEMORY[0x1F415FBA0]();
}

uint64_t sub_1BFBD2F58()
{
  return MEMORY[0x1F415FBA8]();
}

uint64_t sub_1BFBD2F68()
{
  return MEMORY[0x1F415FBB0]();
}

uint64_t sub_1BFBD2F78()
{
  return MEMORY[0x1F415FC28]();
}

uint64_t sub_1BFBD2F88()
{
  return MEMORY[0x1F415FC30]();
}

uint64_t sub_1BFBD2F98()
{
  return MEMORY[0x1F415FC58]();
}

uint64_t sub_1BFBD2FA8()
{
  return MEMORY[0x1F415FC60]();
}

uint64_t sub_1BFBD2FB8()
{
  return MEMORY[0x1F415FD48]();
}

uint64_t sub_1BFBD2FC8()
{
  return MEMORY[0x1F415FD60]();
}

uint64_t sub_1BFBD2FD8()
{
  return MEMORY[0x1F415FEA0]();
}

uint64_t sub_1BFBD2FE8()
{
  return MEMORY[0x1F415FEA8]();
}

uint64_t sub_1BFBD2FF8()
{
  return MEMORY[0x1F415FEC0]();
}

uint64_t sub_1BFBD3008()
{
  return MEMORY[0x1F415FEE8]();
}

uint64_t sub_1BFBD3018()
{
  return MEMORY[0x1F415FF30]();
}

uint64_t sub_1BFBD3028()
{
  return MEMORY[0x1F415FF38]();
}

uint64_t sub_1BFBD3038()
{
  return MEMORY[0x1F4160048]();
}

uint64_t sub_1BFBD3048()
{
  return MEMORY[0x1F4160068]();
}

uint64_t sub_1BFBD3058()
{
  return MEMORY[0x1F4160070]();
}

uint64_t sub_1BFBD3068()
{
  return MEMORY[0x1F4160078]();
}

uint64_t sub_1BFBD3078()
{
  return MEMORY[0x1F41600B8]();
}

uint64_t sub_1BFBD3088()
{
  return MEMORY[0x1F41600D0]();
}

uint64_t sub_1BFBD3098()
{
  return MEMORY[0x1F41600D8]();
}

uint64_t sub_1BFBD30A8()
{
  return MEMORY[0x1F41600E0]();
}

uint64_t sub_1BFBD30B8()
{
  return MEMORY[0x1F41600E8]();
}

uint64_t sub_1BFBD30C8()
{
  return MEMORY[0x1F41600F0]();
}

uint64_t sub_1BFBD30D8()
{
  return MEMORY[0x1F41601F8]();
}

uint64_t sub_1BFBD30E8()
{
  return MEMORY[0x1F4160208]();
}

uint64_t sub_1BFBD30F8()
{
  return MEMORY[0x1F4160230]();
}

uint64_t sub_1BFBD3108()
{
  return MEMORY[0x1F4160238]();
}

uint64_t sub_1BFBD3118()
{
  return MEMORY[0x1F4160240]();
}

uint64_t sub_1BFBD3128()
{
  return MEMORY[0x1F4160300]();
}

uint64_t sub_1BFBD3138()
{
  return MEMORY[0x1F4160340]();
}

uint64_t sub_1BFBD3148()
{
  return MEMORY[0x1F4160348]();
}

uint64_t sub_1BFBD3158()
{
  return MEMORY[0x1F41604A0]();
}

uint64_t sub_1BFBD3168()
{
  return MEMORY[0x1F41604A8]();
}

uint64_t sub_1BFBD3178()
{
  return MEMORY[0x1F41604E8]();
}

uint64_t sub_1BFBD3188()
{
  return MEMORY[0x1F41605A8]();
}

uint64_t sub_1BFBD3198()
{
  return MEMORY[0x1F41605B0]();
}

uint64_t sub_1BFBD31A8()
{
  return MEMORY[0x1F4160728]();
}

uint64_t sub_1BFBD31B8()
{
  return MEMORY[0x1F4160730]();
}

uint64_t sub_1BFBD31C8()
{
  return MEMORY[0x1F41607B0]();
}

uint64_t sub_1BFBD31D8()
{
  return MEMORY[0x1F4160868]();
}

uint64_t sub_1BFBD31E8()
{
  return MEMORY[0x1F4160888]();
}

uint64_t sub_1BFBD31F8()
{
  return MEMORY[0x1F4160890]();
}

uint64_t sub_1BFBD3208()
{
  return MEMORY[0x1F4160898]();
}

uint64_t sub_1BFBD3218()
{
  return MEMORY[0x1F41608A0]();
}

uint64_t sub_1BFBD3228()
{
  return MEMORY[0x1F4160938]();
}

uint64_t sub_1BFBD3238()
{
  return MEMORY[0x1F4160940]();
}

uint64_t sub_1BFBD3248()
{
  return MEMORY[0x1F41609A8]();
}

uint64_t sub_1BFBD3258()
{
  return MEMORY[0x1F41609D0]();
}

uint64_t sub_1BFBD3268()
{
  return MEMORY[0x1F4160A10]();
}

uint64_t sub_1BFBD3278()
{
  return MEMORY[0x1F4160A18]();
}

uint64_t sub_1BFBD3288()
{
  return MEMORY[0x1F4160A30]();
}

uint64_t sub_1BFBD3298()
{
  return MEMORY[0x1F4160A40]();
}

uint64_t sub_1BFBD32A8()
{
  return MEMORY[0x1F4160A50]();
}

uint64_t sub_1BFBD32B8()
{
  return MEMORY[0x1F4160A60]();
}

uint64_t sub_1BFBD32C8()
{
  return MEMORY[0x1F4160A70]();
}

uint64_t sub_1BFBD32D8()
{
  return MEMORY[0x1F4160A90]();
}

uint64_t sub_1BFBD32E8()
{
  return MEMORY[0x1F4160B60]();
}

uint64_t sub_1BFBD32F8()
{
  return MEMORY[0x1F4160B68]();
}

uint64_t sub_1BFBD3308()
{
  return MEMORY[0x1F4160BB0]();
}

uint64_t sub_1BFBD3318()
{
  return MEMORY[0x1F4160BB8]();
}

uint64_t sub_1BFBD3328()
{
  return MEMORY[0x1F4160BC0]();
}

uint64_t sub_1BFBD3338()
{
  return MEMORY[0x1F4160BF0]();
}

uint64_t sub_1BFBD3348()
{
  return MEMORY[0x1F4160C18]();
}

uint64_t sub_1BFBD3358()
{
  return MEMORY[0x1F4160D00]();
}

uint64_t sub_1BFBD3368()
{
  return MEMORY[0x1F4160D10]();
}

uint64_t sub_1BFBD3378()
{
  return MEMORY[0x1F4160D18]();
}

uint64_t sub_1BFBD3388()
{
  return MEMORY[0x1F4160DC0]();
}

uint64_t sub_1BFBD3398()
{
  return MEMORY[0x1F4160DE0]();
}

uint64_t sub_1BFBD33A8()
{
  return MEMORY[0x1F4160DF8]();
}

uint64_t sub_1BFBD33B8()
{
  return MEMORY[0x1F4160F88]();
}

uint64_t sub_1BFBD33C8()
{
  return MEMORY[0x1F4160F90]();
}

uint64_t sub_1BFBD33D8()
{
  return MEMORY[0x1F4160F98]();
}

uint64_t sub_1BFBD33E8()
{
  return MEMORY[0x1F4161200]();
}

uint64_t sub_1BFBD33F8()
{
  return MEMORY[0x1F4161390]();
}

uint64_t sub_1BFBD3408()
{
  return MEMORY[0x1F4161400]();
}

uint64_t sub_1BFBD3418()
{
  return MEMORY[0x1F4161408]();
}

uint64_t sub_1BFBD3428()
{
  return MEMORY[0x1F4161418]();
}

uint64_t sub_1BFBD3438()
{
  return MEMORY[0x1F4161498]();
}

uint64_t sub_1BFBD3448()
{
  return MEMORY[0x1F4161630]();
}

uint64_t sub_1BFBD3458()
{
  return MEMORY[0x1F4161638]();
}

uint64_t sub_1BFBD3468()
{
  return MEMORY[0x1F4161660]();
}

uint64_t sub_1BFBD3478()
{
  return MEMORY[0x1F4161670]();
}

uint64_t sub_1BFBD3488()
{
  return MEMORY[0x1F41616D8]();
}

uint64_t sub_1BFBD3498()
{
  return MEMORY[0x1F41616E0]();
}

uint64_t sub_1BFBD34A8()
{
  return MEMORY[0x1F41616E8]();
}

uint64_t sub_1BFBD34B8()
{
  return MEMORY[0x1F4161708]();
}

uint64_t sub_1BFBD34C8()
{
  return MEMORY[0x1F41619C8]();
}

uint64_t sub_1BFBD34D8()
{
  return MEMORY[0x1F41619D0]();
}

uint64_t sub_1BFBD34E8()
{
  return MEMORY[0x1F4161A00]();
}

uint64_t sub_1BFBD34F8()
{
  return MEMORY[0x1F4161A10]();
}

uint64_t sub_1BFBD3508()
{
  return MEMORY[0x1F4161A60]();
}

uint64_t sub_1BFBD3518()
{
  return MEMORY[0x1F4161AC8]();
}

uint64_t sub_1BFBD3528()
{
  return MEMORY[0x1F4161AD0]();
}

uint64_t sub_1BFBD3538()
{
  return MEMORY[0x1F4161AD8]();
}

uint64_t sub_1BFBD3548()
{
  return MEMORY[0x1F4161AE0]();
}

uint64_t sub_1BFBD3558()
{
  return MEMORY[0x1F4161B28]();
}

uint64_t sub_1BFBD3568()
{
  return MEMORY[0x1F4161B40]();
}

uint64_t sub_1BFBD3578()
{
  return MEMORY[0x1F4161B50]();
}

uint64_t sub_1BFBD3588()
{
  return MEMORY[0x1F4161C18]();
}

uint64_t sub_1BFBD3598()
{
  return MEMORY[0x1F4161C20]();
}

uint64_t sub_1BFBD35A8()
{
  return MEMORY[0x1F4161C30]();
}

uint64_t sub_1BFBD35B8()
{
  return MEMORY[0x1F4161C38]();
}

uint64_t sub_1BFBD35C8()
{
  return MEMORY[0x1F4161C40]();
}

uint64_t sub_1BFBD35D8()
{
  return MEMORY[0x1F4161C50]();
}

uint64_t sub_1BFBD35E8()
{
  return MEMORY[0x1F4161C58]();
}

uint64_t sub_1BFBD35F8()
{
  return MEMORY[0x1F4161C60]();
}

uint64_t sub_1BFBD3608()
{
  return MEMORY[0x1F4161CE0]();
}

uint64_t sub_1BFBD3618()
{
  return MEMORY[0x1F4161CE8]();
}

uint64_t sub_1BFBD3628()
{
  return MEMORY[0x1F4161D80]();
}

uint64_t sub_1BFBD3638()
{
  return MEMORY[0x1F4161E58]();
}

uint64_t sub_1BFBD3648()
{
  return MEMORY[0x1F4161E60]();
}

uint64_t sub_1BFBD3658()
{
  return MEMORY[0x1F4161E78]();
}

uint64_t sub_1BFBD3668()
{
  return MEMORY[0x1F4161E80]();
}

uint64_t sub_1BFBD3678()
{
  return MEMORY[0x1F4161E88]();
}

uint64_t sub_1BFBD3688()
{
  return MEMORY[0x1F4161E90]();
}

uint64_t sub_1BFBD3698()
{
  return MEMORY[0x1F4161FB0]();
}

uint64_t sub_1BFBD36A8()
{
  return MEMORY[0x1F4162020]();
}

uint64_t sub_1BFBD36B8()
{
  return MEMORY[0x1F4162048]();
}

uint64_t sub_1BFBD36C8()
{
  return MEMORY[0x1F4162058]();
}

uint64_t sub_1BFBD36D8()
{
  return MEMORY[0x1F4162060]();
}

uint64_t sub_1BFBD36E8()
{
  return MEMORY[0x1F4162228]();
}

uint64_t sub_1BFBD36F8()
{
  return MEMORY[0x1F4162238]();
}

uint64_t sub_1BFBD3708()
{
  return MEMORY[0x1F4162258]();
}

uint64_t sub_1BFBD3718()
{
  return MEMORY[0x1F4162260]();
}

uint64_t sub_1BFBD3728()
{
  return MEMORY[0x1F4162368]();
}

uint64_t sub_1BFBD3738()
{
  return MEMORY[0x1F4162398]();
}

uint64_t sub_1BFBD3748()
{
  return MEMORY[0x1F41623A0]();
}

uint64_t sub_1BFBD3758()
{
  return MEMORY[0x1F4162480]();
}

uint64_t sub_1BFBD3768()
{
  return MEMORY[0x1F4162490]();
}

uint64_t sub_1BFBD3778()
{
  return MEMORY[0x1F41624A0]();
}

uint64_t sub_1BFBD3788()
{
  return MEMORY[0x1F41624A8]();
}

uint64_t sub_1BFBD3798()
{
  return MEMORY[0x1F41624C8]();
}

uint64_t sub_1BFBD37A8()
{
  return MEMORY[0x1F4162590]();
}

uint64_t sub_1BFBD37B8()
{
  return MEMORY[0x1F4162638]();
}

uint64_t sub_1BFBD37C8()
{
  return MEMORY[0x1F4162640]();
}

uint64_t sub_1BFBD37E8()
{
  return MEMORY[0x1F4162680]();
}

uint64_t sub_1BFBD37F8()
{
  return MEMORY[0x1F4162688]();
}

uint64_t sub_1BFBD3808()
{
  return MEMORY[0x1F4162708]();
}

uint64_t sub_1BFBD3818()
{
  return MEMORY[0x1F4162710]();
}

uint64_t sub_1BFBD3828()
{
  return MEMORY[0x1F4162740]();
}

uint64_t sub_1BFBD3838()
{
  return MEMORY[0x1F4162748]();
}

uint64_t sub_1BFBD3848()
{
  return MEMORY[0x1F4162758]();
}

uint64_t sub_1BFBD3858()
{
  return MEMORY[0x1F4162760]();
}

uint64_t sub_1BFBD3868()
{
  return MEMORY[0x1F41627C0]();
}

uint64_t sub_1BFBD3878()
{
  return MEMORY[0x1F41627D0]();
}

uint64_t sub_1BFBD3888()
{
  return MEMORY[0x1F4162800]();
}

uint64_t sub_1BFBD3898()
{
  return MEMORY[0x1F4162838]();
}

uint64_t sub_1BFBD38A8()
{
  return MEMORY[0x1F4162840]();
}

uint64_t sub_1BFBD38B8()
{
  return MEMORY[0x1F4162848]();
}

uint64_t sub_1BFBD38C8()
{
  return MEMORY[0x1F4162988]();
}

uint64_t sub_1BFBD38D8()
{
  return MEMORY[0x1F41629A0]();
}

uint64_t sub_1BFBD38E8()
{
  return MEMORY[0x1F41629D0]();
}

uint64_t sub_1BFBD38F8()
{
  return MEMORY[0x1F4162A68]();
}

uint64_t sub_1BFBD3918()
{
  return MEMORY[0x1F4162A90]();
}

uint64_t sub_1BFBD3928()
{
  return MEMORY[0x1F4162A98]();
}

uint64_t sub_1BFBD3948()
{
  return MEMORY[0x1F4162AA8]();
}

uint64_t sub_1BFBD3958()
{
  return MEMORY[0x1F4162AB0]();
}

uint64_t sub_1BFBD39B8()
{
  return MEMORY[0x1F4162AE0]();
}

uint64_t sub_1BFBD39D8()
{
  return MEMORY[0x1F4162AF0]();
}

uint64_t sub_1BFBD39E8()
{
  return MEMORY[0x1F4162AF8]();
}

uint64_t sub_1BFBD39F8()
{
  return MEMORY[0x1F4162B00]();
}

uint64_t sub_1BFBD3A08()
{
  return MEMORY[0x1F4162B08]();
}

uint64_t sub_1BFBD3A18()
{
  return MEMORY[0x1F4162B10]();
}

uint64_t sub_1BFBD3A28()
{
  return MEMORY[0x1F4162B18]();
}

uint64_t sub_1BFBD3A38()
{
  return MEMORY[0x1F4162B20]();
}

uint64_t sub_1BFBD3A58()
{
  return MEMORY[0x1F4162B38]();
}

uint64_t sub_1BFBD3A68()
{
  return MEMORY[0x1F4162B48]();
}

uint64_t sub_1BFBD3A78()
{
  return MEMORY[0x1F4162C20]();
}

uint64_t sub_1BFBD3A98()
{
  return MEMORY[0x1F4162E90]();
}

uint64_t sub_1BFBD3AA8()
{
  return MEMORY[0x1F4162E98]();
}

uint64_t sub_1BFBD3AB8()
{
  return MEMORY[0x1F4162EA0]();
}

uint64_t sub_1BFBD3AC8()
{
  return MEMORY[0x1F4162EA8]();
}

uint64_t sub_1BFBD3AD8()
{
  return MEMORY[0x1F4162EB8]();
}

uint64_t sub_1BFBD3AE8()
{
  return MEMORY[0x1F4162ED0]();
}

uint64_t sub_1BFBD3AF8()
{
  return MEMORY[0x1F4162F30]();
}

uint64_t sub_1BFBD3B08()
{
  return MEMORY[0x1F4162F38]();
}

uint64_t sub_1BFBD3B18()
{
  return MEMORY[0x1F4162F48]();
}

uint64_t sub_1BFBD3B28()
{
  return MEMORY[0x1F4163080]();
}

uint64_t sub_1BFBD3B38()
{
  return MEMORY[0x1F4163088]();
}

uint64_t sub_1BFBD3B48()
{
  return MEMORY[0x1F4163090]();
}

uint64_t sub_1BFBD3B58()
{
  return MEMORY[0x1F41630A8]();
}

uint64_t sub_1BFBD3B68()
{
  return MEMORY[0x1F41630B0]();
}

uint64_t sub_1BFBD3B78()
{
  return MEMORY[0x1F41630B8]();
}

uint64_t sub_1BFBD3B88()
{
  return MEMORY[0x1F4163160]();
}

uint64_t sub_1BFBD3B98()
{
  return MEMORY[0x1F4163168]();
}

uint64_t sub_1BFBD3BA8()
{
  return MEMORY[0x1F4163178]();
}

uint64_t sub_1BFBD3BB8()
{
  return MEMORY[0x1F4163180]();
}

uint64_t sub_1BFBD3BC8()
{
  return MEMORY[0x1F4163188]();
}

uint64_t sub_1BFBD3BD8()
{
  return MEMORY[0x1F4163190]();
}

uint64_t sub_1BFBD3BE8()
{
  return MEMORY[0x1F4163198]();
}

uint64_t sub_1BFBD3BF8()
{
  return MEMORY[0x1F41631A8]();
}

uint64_t sub_1BFBD3C08()
{
  return MEMORY[0x1F41631B0]();
}

uint64_t sub_1BFBD3C18()
{
  return MEMORY[0x1F41631B8]();
}

uint64_t sub_1BFBD3C28()
{
  return MEMORY[0x1F41631C0]();
}

uint64_t sub_1BFBD3C38()
{
  return MEMORY[0x1F41631C8]();
}

uint64_t sub_1BFBD3C48()
{
  return MEMORY[0x1F41631D0]();
}

uint64_t sub_1BFBD3C58()
{
  return MEMORY[0x1F4163260]();
}

uint64_t sub_1BFBD3C68()
{
  return MEMORY[0x1F41632B8]();
}

uint64_t sub_1BFBD3C78()
{
  return MEMORY[0x1F41632C0]();
}

uint64_t sub_1BFBD3C88()
{
  return MEMORY[0x1F4163320]();
}

uint64_t sub_1BFBD3C98()
{
  return MEMORY[0x1F4163328]();
}

uint64_t sub_1BFBD3CA8()
{
  return MEMORY[0x1F41633D0]();
}

uint64_t sub_1BFBD3CB8()
{
  return MEMORY[0x1F4165F78]();
}

uint64_t sub_1BFBD3CC8()
{
  return MEMORY[0x1F4131100]();
}

uint64_t sub_1BFBD3CD8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BFBD3CE8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1BFBD3CF8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BFBD3D08()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1BFBD3D18()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1BFBD3D28()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BFBD3D38()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BFBD3D48()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BFBD3D58()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BFBD3D68()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BFBD3D78()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BFBD3D88()
{
  return MEMORY[0x1F4134810]();
}

uint64_t sub_1BFBD3D98()
{
  return MEMORY[0x1F4134AC8]();
}

uint64_t sub_1BFBD3DA8()
{
  return MEMORY[0x1F4134BF0]();
}

uint64_t sub_1BFBD3DB8()
{
  return MEMORY[0x1F4134C00]();
}

uint64_t sub_1BFBD3DC8()
{
  return MEMORY[0x1F4134C18]();
}

uint64_t sub_1BFBD3DD8()
{
  return MEMORY[0x1F4134CE0]();
}

uint64_t sub_1BFBD3DE8()
{
  return MEMORY[0x1F4134D40]();
}

uint64_t sub_1BFBD3DF8()
{
  return MEMORY[0x1F4134D58]();
}

uint64_t sub_1BFBD3E08()
{
  return MEMORY[0x1F4134D68]();
}

uint64_t sub_1BFBD3E18()
{
  return MEMORY[0x1F4134D78]();
}

uint64_t sub_1BFBD3E28()
{
  return MEMORY[0x1F4134D80]();
}

uint64_t sub_1BFBD3E38()
{
  return MEMORY[0x1F4134DA8]();
}

uint64_t sub_1BFBD3E48()
{
  return MEMORY[0x1F4134DB0]();
}

uint64_t sub_1BFBD3E58()
{
  return MEMORY[0x1F4134DB8]();
}

uint64_t sub_1BFBD3E68()
{
  return MEMORY[0x1F4134FB8]();
}

uint64_t sub_1BFBD3E78()
{
  return MEMORY[0x1F4134FC0]();
}

uint64_t sub_1BFBD3E88()
{
  return MEMORY[0x1F41350C0]();
}

uint64_t sub_1BFBD3E98()
{
  return MEMORY[0x1F41350E0]();
}

uint64_t sub_1BFBD3EA8()
{
  return MEMORY[0x1F41350E8]();
}

uint64_t sub_1BFBD3EB8()
{
  return MEMORY[0x1F41354C8]();
}

uint64_t sub_1BFBD3EC8()
{
  return MEMORY[0x1F41354D0]();
}

uint64_t sub_1BFBD3ED8()
{
  return MEMORY[0x1F41354F8]();
}

uint64_t sub_1BFBD3EE8()
{
  return MEMORY[0x1F41357E8]();
}

uint64_t sub_1BFBD3EF8()
{
  return MEMORY[0x1F41357F0]();
}

uint64_t sub_1BFBD3F08()
{
  return MEMORY[0x1F41358E8]();
}

uint64_t sub_1BFBD3F18()
{
  return MEMORY[0x1F4135938]();
}

uint64_t sub_1BFBD3F28()
{
  return MEMORY[0x1F4135940]();
}

uint64_t sub_1BFBD3F38()
{
  return MEMORY[0x1F4135948]();
}

uint64_t sub_1BFBD3F48()
{
  return MEMORY[0x1F4135950]();
}

uint64_t sub_1BFBD3F58()
{
  return MEMORY[0x1F4135958]();
}

uint64_t sub_1BFBD3F68()
{
  return MEMORY[0x1F4135968]();
}

uint64_t sub_1BFBD3F78()
{
  return MEMORY[0x1F4135970]();
}

uint64_t sub_1BFBD3F88()
{
  return MEMORY[0x1F4135978]();
}

uint64_t sub_1BFBD3F98()
{
  return MEMORY[0x1F4135980]();
}

uint64_t sub_1BFBD3FA8()
{
  return MEMORY[0x1F4135988]();
}

uint64_t sub_1BFBD3FB8()
{
  return MEMORY[0x1F4135990]();
}

uint64_t sub_1BFBD3FC8()
{
  return MEMORY[0x1F4135998]();
}

uint64_t sub_1BFBD3FD8()
{
  return MEMORY[0x1F41359A0]();
}

uint64_t sub_1BFBD3FE8()
{
  return MEMORY[0x1F41359A8]();
}

uint64_t sub_1BFBD3FF8()
{
  return MEMORY[0x1F41359B0]();
}

uint64_t sub_1BFBD4008()
{
  return MEMORY[0x1F4135AF8]();
}

uint64_t sub_1BFBD4018()
{
  return MEMORY[0x1F4135B08]();
}

uint64_t sub_1BFBD4028()
{
  return MEMORY[0x1F4135D98]();
}

uint64_t sub_1BFBD4038()
{
  return MEMORY[0x1F4135DA0]();
}

uint64_t sub_1BFBD4048()
{
  return MEMORY[0x1F4135DA8]();
}

uint64_t sub_1BFBD4058()
{
  return MEMORY[0x1F4135E20]();
}

uint64_t sub_1BFBD4068()
{
  return MEMORY[0x1F4135E30]();
}

uint64_t sub_1BFBD4078()
{
  return MEMORY[0x1F4135FF8]();
}

uint64_t sub_1BFBD4088()
{
  return MEMORY[0x1F4136008]();
}

uint64_t sub_1BFBD4098()
{
  return MEMORY[0x1F4136010]();
}

uint64_t sub_1BFBD40A8()
{
  return MEMORY[0x1F4136138]();
}

uint64_t sub_1BFBD40B8()
{
  return MEMORY[0x1F4136258]();
}

uint64_t sub_1BFBD40C8()
{
  return MEMORY[0x1F41362C0]();
}

uint64_t sub_1BFBD40D8()
{
  return MEMORY[0x1F41362D0]();
}

uint64_t sub_1BFBD40E8()
{
  return MEMORY[0x1F41364F0]();
}

uint64_t sub_1BFBD40F8()
{
  return MEMORY[0x1F41364F8]();
}

uint64_t sub_1BFBD4108()
{
  return MEMORY[0x1F41366A8]();
}

uint64_t sub_1BFBD4118()
{
  return MEMORY[0x1F41366B0]();
}

uint64_t sub_1BFBD4128()
{
  return MEMORY[0x1F41366B8]();
}

uint64_t sub_1BFBD4138()
{
  return MEMORY[0x1F4136848]();
}

uint64_t sub_1BFBD4148()
{
  return MEMORY[0x1F41368A8]();
}

uint64_t sub_1BFBD4158()
{
  return MEMORY[0x1F41368B8]();
}

uint64_t sub_1BFBD4168()
{
  return MEMORY[0x1F41368D0]();
}

uint64_t sub_1BFBD4178()
{
  return MEMORY[0x1F41368E0]();
}

uint64_t sub_1BFBD4188()
{
  return MEMORY[0x1F41368E8]();
}

uint64_t sub_1BFBD4198()
{
  return MEMORY[0x1F4136900]();
}

uint64_t sub_1BFBD41A8()
{
  return MEMORY[0x1F4136C90]();
}

uint64_t sub_1BFBD41B8()
{
  return MEMORY[0x1F4136C98]();
}

uint64_t sub_1BFBD41C8()
{
  return MEMORY[0x1F4136CC8]();
}

uint64_t sub_1BFBD41D8()
{
  return MEMORY[0x1F4136CD0]();
}

uint64_t sub_1BFBD41E8()
{
  return MEMORY[0x1F4136CD8]();
}

uint64_t sub_1BFBD41F8()
{
  return MEMORY[0x1F4136CE0]();
}

uint64_t sub_1BFBD4208()
{
  return MEMORY[0x1F4136CE8]();
}

uint64_t sub_1BFBD4218()
{
  return MEMORY[0x1F4136D00]();
}

uint64_t sub_1BFBD4228()
{
  return MEMORY[0x1F4136D08]();
}

uint64_t sub_1BFBD4238()
{
  return MEMORY[0x1F4136D68]();
}

uint64_t sub_1BFBD4248()
{
  return MEMORY[0x1F4136D70]();
}

uint64_t sub_1BFBD4258()
{
  return MEMORY[0x1F4136E98]();
}

uint64_t sub_1BFBD4268()
{
  return MEMORY[0x1F4136EA0]();
}

uint64_t sub_1BFBD4278()
{
  return MEMORY[0x1F4136EB0]();
}

uint64_t sub_1BFBD4288()
{
  return MEMORY[0x1F41370E8]();
}

uint64_t sub_1BFBD4298()
{
  return MEMORY[0x1F41370F0]();
}

uint64_t sub_1BFBD42A8()
{
  return MEMORY[0x1F4137188]();
}

uint64_t sub_1BFBD42B8()
{
  return MEMORY[0x1F4137238]();
}

uint64_t sub_1BFBD42C8()
{
  return MEMORY[0x1F4137248]();
}

uint64_t sub_1BFBD42D8()
{
  return MEMORY[0x1F4137278]();
}

uint64_t sub_1BFBD42E8()
{
  return MEMORY[0x1F41373C0]();
}

uint64_t sub_1BFBD42F8()
{
  return MEMORY[0x1F41373C8]();
}

uint64_t sub_1BFBD4308()
{
  return MEMORY[0x1F41373D0]();
}

uint64_t sub_1BFBD4318()
{
  return MEMORY[0x1F41373D8]();
}

uint64_t sub_1BFBD4328()
{
  return MEMORY[0x1F41373F0]();
}

uint64_t sub_1BFBD4338()
{
  return MEMORY[0x1F41373F8]();
}

uint64_t sub_1BFBD4348()
{
  return MEMORY[0x1F41375B0]();
}

uint64_t sub_1BFBD4358()
{
  return MEMORY[0x1F41375C0]();
}

uint64_t sub_1BFBD4368()
{
  return MEMORY[0x1F41375C8]();
}

uint64_t sub_1BFBD4378()
{
  return MEMORY[0x1F41376C0]();
}

uint64_t sub_1BFBD4388()
{
  return MEMORY[0x1F4137798]();
}

uint64_t sub_1BFBD4398()
{
  return MEMORY[0x1F4137B28]();
}

uint64_t sub_1BFBD43A8()
{
  return MEMORY[0x1F4137B30]();
}

uint64_t sub_1BFBD43B8()
{
  return MEMORY[0x1F4137B78]();
}

uint64_t sub_1BFBD43C8()
{
  return MEMORY[0x1F4137B80]();
}

uint64_t sub_1BFBD43D8()
{
  return MEMORY[0x1F4137B88]();
}

uint64_t sub_1BFBD43E8()
{
  return MEMORY[0x1F4137BE0]();
}

uint64_t sub_1BFBD43F8()
{
  return MEMORY[0x1F4137BE8]();
}

uint64_t sub_1BFBD4408()
{
  return MEMORY[0x1F4137D28]();
}

uint64_t sub_1BFBD4418()
{
  return MEMORY[0x1F4137D30]();
}

uint64_t sub_1BFBD4428()
{
  return MEMORY[0x1F4137D38]();
}

uint64_t sub_1BFBD4438()
{
  return MEMORY[0x1F4137E10]();
}

uint64_t sub_1BFBD4448()
{
  return MEMORY[0x1F4137E18]();
}

uint64_t sub_1BFBD4458()
{
  return MEMORY[0x1F4137E20]();
}

uint64_t sub_1BFBD4468()
{
  return MEMORY[0x1F4137F50]();
}

uint64_t sub_1BFBD4478()
{
  return MEMORY[0x1F4137F58]();
}

uint64_t sub_1BFBD4488()
{
  return MEMORY[0x1F4137F60]();
}

uint64_t sub_1BFBD4498()
{
  return MEMORY[0x1F4137F80]();
}

uint64_t sub_1BFBD44A8()
{
  return MEMORY[0x1F4138290]();
}

uint64_t sub_1BFBD44B8()
{
  return MEMORY[0x1F41382A0]();
}

uint64_t sub_1BFBD44C8()
{
  return MEMORY[0x1F41383D0]();
}

uint64_t sub_1BFBD44D8()
{
  return MEMORY[0x1F41383D8]();
}

uint64_t sub_1BFBD44E8()
{
  return MEMORY[0x1F41383E0]();
}

uint64_t sub_1BFBD44F8()
{
  return MEMORY[0x1F4138510]();
}

uint64_t sub_1BFBD4508()
{
  return MEMORY[0x1F4138518]();
}

uint64_t sub_1BFBD4518()
{
  return MEMORY[0x1F4138520]();
}

uint64_t sub_1BFBD4528()
{
  return MEMORY[0x1F4138528]();
}

uint64_t sub_1BFBD4538()
{
  return MEMORY[0x1F4138530]();
}

uint64_t sub_1BFBD4548()
{
  return MEMORY[0x1F4138538]();
}

uint64_t sub_1BFBD4558()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BFBD4568()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BFBD4578()
{
  return MEMORY[0x1F415EFB0]();
}

uint64_t sub_1BFBD4588()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BFBD4598()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BFBD45A8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BFBD45B8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BFBD45C8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BFBD45D8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BFBD45E8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BFBD45F8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BFBD4608()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1BFBD4618()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1BFBD4628()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BFBD4638()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BFBD4648()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BFBD4658()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1BFBD4668()
{
  return MEMORY[0x1F415EFF0]();
}

uint64_t sub_1BFBD4678()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1BFBD4688()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1BFBD4698()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BFBD46A8()
{
  return MEMORY[0x1F4163440]();
}

uint64_t sub_1BFBD46B8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1BFBD46C8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1BFBD46D8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BFBD46E8()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1BFBD46F8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BFBD4708()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1BFBD4718()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1BFBD4738()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1BFBD4748()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1BFBD4758()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1BFBD4768()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1BFBD4778()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1BFBD47B8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1BFBD47C8()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1BFBD47D8()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1BFBD47E8()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1BFBD47F8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BFBD4808()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BFBD4818()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1BFBD4828()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BFBD4838()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BFBD4848()
{
  return MEMORY[0x1F415F058]();
}

uint64_t sub_1BFBD4858()
{
  return MEMORY[0x1F415F060]();
}

uint64_t sub_1BFBD4868()
{
  return MEMORY[0x1F415F078]();
}

uint64_t sub_1BFBD4878()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BFBD4888()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BFBD4898()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BFBD48A8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1BFBD48B8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1BFBD48C8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1BFBD48D8()
{
  return MEMORY[0x1F4163480]();
}

uint64_t sub_1BFBD48E8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1BFBD48F8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BFBD4908()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BFBD4918()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1BFBD4928()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1BFBD4938()
{
  return MEMORY[0x1F40E6468]();
}

uint64_t sub_1BFBD4948()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BFBD4958()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BFBD4968()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BFBD4978()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BFBD4988()
{
  return MEMORY[0x1F41634C0]();
}

uint64_t sub_1BFBD4998()
{
  return MEMORY[0x1F41634C8]();
}

uint64_t sub_1BFBD49A8()
{
  return MEMORY[0x1F41634D0]();
}

uint64_t sub_1BFBD49B8()
{
  return MEMORY[0x1F41634D8]();
}

uint64_t sub_1BFBD49C8()
{
  return MEMORY[0x1F41634E0]();
}

uint64_t sub_1BFBD49D8()
{
  return MEMORY[0x1F41387B8]();
}

uint64_t sub_1BFBD49E8()
{
  return MEMORY[0x1F4163538]();
}

uint64_t sub_1BFBD49F8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BFBD4A08()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BFBD4A18()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BFBD4A28()
{
  return MEMORY[0x1F41635D8]();
}

uint64_t sub_1BFBD4A38()
{
  return MEMORY[0x1F415F150]();
}

uint64_t sub_1BFBD4A48()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BFBD4A58()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1BFBD4A68()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BFBD4A78()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BFBD4A88()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BFBD4A98()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BFBD4AA8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1BFBD4AB8()
{
  return MEMORY[0x1F4163628]();
}

uint64_t sub_1BFBD4AC8()
{
  return MEMORY[0x1F4163630]();
}

uint64_t sub_1BFBD4AD8()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1BFBD4AE8()
{
  return MEMORY[0x1F4163688]();
}

uint64_t sub_1BFBD4AF8()
{
  return MEMORY[0x1F415FAD0]();
}

uint64_t sub_1BFBD4B08()
{
  return MEMORY[0x1F41636E8]();
}

uint64_t sub_1BFBD4B18()
{
  return MEMORY[0x1F41636F8]();
}

uint64_t sub_1BFBD4B28()
{
  return MEMORY[0x1F4163758]();
}

uint64_t sub_1BFBD4B38()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1BFBD4B48()
{
  return MEMORY[0x1F4138988]();
}

uint64_t sub_1BFBD4B58()
{
  return MEMORY[0x1F41637F0]();
}

uint64_t sub_1BFBD4B68()
{
  return MEMORY[0x1F4163848]();
}

uint64_t sub_1BFBD4B78()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1BFBD4B88()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1BFBD4B98()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1BFBD4BA8()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1BFBD4BB8()
{
  return MEMORY[0x1F40E6B48]();
}

uint64_t sub_1BFBD4BC8()
{
  return MEMORY[0x1F40E6B50]();
}

uint64_t sub_1BFBD4BD8()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1BFBD4BE8()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BFBD4BF8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BFBD4C08()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BFBD4C18()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BFBD4C28()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1BFBD4C38()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1BFBD4C48()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1BFBD4C58()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1BFBD4C68()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BFBD4C88()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BFBD4C98()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BFBD4CA8()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1BFBD4CB8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BFBD4CC8()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1BFBD4CD8()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1BFBD4CE8()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1BFBD4CF8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1BFBD4D08()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BFBD4D18()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1BFBD4D28()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BFBD4D38()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1BFBD4D48()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1BFBD4D58()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BFBD4D68()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BFBD4D78()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BFBD4D88()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BFBD4D98()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BFBD4DA8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BFBD4DB8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BFBD4DC8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BFBD4DD8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BFBD4DE8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BFBD4DF8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1BFBD4E08()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BFBD4E18()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BFBD4E28()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BFBD4E38()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1BFBD4E48()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BFBD4E58()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BFBD4E68()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BFBD4E78()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BFBD4E88()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BFBD4E98()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BFBD4EA8()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1BFBD4EB8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BFBD4ED8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BFBD4EE8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1BFBD4EF8()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1BFBD4F08()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1BFBD4F18()
{
  return MEMORY[0x1F4185540]();
}

uint64_t sub_1BFBD4F28()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BFBD4F38()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1BFBD4F48()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1BFBD4F58()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BFBD4F68()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1BFBD4F78()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BFBD4F88()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1BFBD4F98()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1BFBD4FA8()
{
  return MEMORY[0x1F4185668]();
}

uint64_t sub_1BFBD4FB8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BFBD4FC8()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1BFBD4FD8()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1BFBD4FE8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BFBD4FF8()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1BFBD5008()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BFBD5018()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1BFBD5028()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1BFBD5038()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1BFBD5048()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BFBD5058()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1BFBD5068()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BFBD5078()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BFBD50A8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1BFBD50B8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BFBD50C8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BFBD50D8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BFBD50E8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BFBD50F8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BFBD5108()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BFBD5118()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1BFBD5128()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BFBD5138()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BFBD5148()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AMSError()
{
  return MEMORY[0x1F410A918]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x1F41389C0]();
}

uint64_t NFStoreDemoMode()
{
  return MEMORY[0x1F41389D0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x1F4133CD8]();
}

uint64_t TSAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x1F4163878]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1F41865D0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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