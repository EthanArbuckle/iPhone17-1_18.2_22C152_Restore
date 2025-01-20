void SNSetupLogging()
{
  if (SNSetupLogging_onceToken != -1) {
    dispatch_once(&SNSetupLogging_onceToken, &__block_literal_global_0);
  }
}

uint64_t __SNSetupLogging_block_invoke()
{
  SNDefaultLog = (uint64_t)os_log_create((const char *)SNLogSubsystemIdentifier, "Snappy");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DE0411B8()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  sub_1DE043000(v0);
  sub_1DE043070(0, &qword_1EABA0900);
  uint64_t result = sub_1DE043230();
  qword_1EABA0910 = result;
  return result;
}

void static PPT.preloadScroll(initDelay:currentDepth:maxDepth:scrollView:completion:)()
{
  OUTLINED_FUNCTION_4();
  v51 = v1;
  uint64_t v52 = v2;
  v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  double v10 = v9;
  sub_1DE043180();
  OUTLINED_FUNCTION_0();
  uint64_t v49 = v12;
  uint64_t v50 = v11;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v47 = v13;
  uint64_t v48 = sub_1DE0431A0();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_1();
  uint64_t v43 = v16;
  sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v18;
  uint64_t v45 = v17;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_6();
  if (_MergedGlobals != -1) {
    swift_once();
  }
  v22 = (void *)qword_1EABA0910;
  sub_1DE041C08(0, &qword_1EABA08C0, (uint64_t (*)(uint64_t))sub_1DE0416F4, MEMORY[0x1E4FBBE00]);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = MEMORY[0x1E4FBB550];
  *(_OWORD *)(v23 + 16) = xmmword_1DE043AD0;
  uint64_t v25 = MEMORY[0x1E4FBB5C8];
  *(void *)(v23 + 56) = v24;
  *(void *)(v23 + 64) = v25;
  *(void *)(v23 + 32) = v6;
  id v26 = v22;
  id v27 = objc_msgSend(v4, sel_description);
  uint64_t v28 = sub_1DE0431F0();
  uint64_t v30 = v29;

  *(void *)(v23 + 96) = MEMORY[0x1E4FBB1A0];
  *(void *)(v23 + 104) = sub_1DE04174C();
  *(void *)(v23 + 72) = v28;
  *(void *)(v23 + 80) = v30;
  sub_1DE043200();
  sub_1DE043170();

  uint64_t v31 = swift_bridgeObjectRelease();
  if (v8 >= v6)
  {
    v51(v31);
  }
  else
  {
    sub_1DE043070(0, &qword_1EABA08D8);
    v32 = (void *)sub_1DE043220();
    sub_1DE0431B0();
    MEMORY[0x1E01CBF70](v21, v10);
    uint64_t v33 = v45;
    uint64_t v44 = *(void *)(v44 + 8);
    ((void (*)(char *, uint64_t))v44)(v21, v45);
    v34 = (void *)swift_allocObject();
    v35 = v51;
    uint64_t v36 = v52;
    v34[2] = v4;
    v34[3] = v35;
    v34[4] = v36;
    v34[5] = v8;
    v34[6] = v6;
    v53[4] = sub_1DE041B9C;
    v53[5] = v34;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 1107296256;
    v53[2] = sub_1DE041BAC;
    v53[3] = &block_descriptor;
    v37 = _Block_copy(v53);
    id v38 = v4;
    swift_retain();
    swift_release();
    uint64_t v39 = v43;
    sub_1DE043190();
    v53[0] = MEMORY[0x1E4FBC860];
    sub_1DE042DA4(&qword_1EABA08E0, MEMORY[0x1E4FBCB00]);
    sub_1DE041C08(0, &qword_1EABA08E8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1DE041C6C();
    uint64_t v40 = v47;
    sub_1DE043240();
    MEMORY[0x1E01CBFB0](v0, v39, v40, v37);
    _Block_release(v37);

    OUTLINED_FUNCTION_2();
    v41();
    OUTLINED_FUNCTION_2();
    v42();
    ((void (*)(uint64_t, uint64_t))v44)(v0, v33);
  }
  OUTLINED_FUNCTION_3();
}

unint64_t sub_1DE0416F4()
{
  unint64_t result = qword_1EABA08C8;
  if (!qword_1EABA08C8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EABA08C8);
  }
  return result;
}

unint64_t sub_1DE04174C()
{
  unint64_t result = qword_1EABA08D0;
  if (!qword_1EABA08D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EABA08D0);
  }
  return result;
}

void sub_1DE041798()
{
  OUTLINED_FUNCTION_4();
  uint64_t v43 = v1;
  uint64_t v44 = v2;
  uint64_t v46 = v3;
  uint64_t v47 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = sub_1DE043180();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1DE0431A0();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v13;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  uint64_t v19 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_6();
  objc_msgSend(v6, sel_bounds);
  double Height = CGRectGetHeight(v49);
  objc_msgSend(v6, sel_contentSize);
  double v24 = v23;
  id v25 = objc_msgSend(v6, sel_contentOffset);
  if (Height + v26 >= v24)
  {
    v46(v25);
  }
  else
  {
    objc_msgSend(v6, sel_setContentOffset_animated_, 0);
    sub_1DE043070(0, &qword_1EABA08D8);
    uint64_t v42 = v12;
    uint64_t v39 = sub_1DE043220();
    sub_1DE0431B0();
    MEMORY[0x1E01CBF70](v21, 1.0);
    uint64_t v27 = *(void *)(v18 + 8);
    uint64_t v40 = v16;
    uint64_t v41 = v27;
    OUTLINED_FUNCTION_7();
    v28();
    uint64_t v29 = (void *)swift_allocObject();
    uint64_t v30 = v44;
    v29[2] = v43;
    v29[3] = v30;
    uint64_t v31 = v46;
    uint64_t v32 = v47;
    v29[4] = v6;
    v29[5] = v31;
    v29[6] = v32;
    v48[4] = sub_1DE042FC0;
    v48[5] = v29;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 1107296256;
    v48[2] = sub_1DE041BAC;
    v48[3] = &block_descriptor_33;
    uint64_t v33 = _Block_copy(v48);
    id v34 = v6;
    swift_retain();
    swift_release();
    sub_1DE043190();
    v48[0] = MEMORY[0x1E4FBC860];
    sub_1DE042DA4(&qword_1EABA08E0, MEMORY[0x1E4FBCB00]);
    sub_1DE041C08(0, &qword_1EABA08E8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1DE041C6C();
    sub_1DE043240();
    v35 = (void *)v39;
    MEMORY[0x1E01CBFB0](v0, v15, v11, v33);
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    OUTLINED_FUNCTION_2();
    v36();
    OUTLINED_FUNCTION_7();
    v37();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t sub_1DE041B5C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1DE041B9C()
{
}

uint64_t sub_1DE041BAC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

void sub_1DE041C08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1DE041C6C()
{
  unint64_t result = qword_1EABA08F0;
  if (!qword_1EABA08F0)
  {
    sub_1DE041C08(255, &qword_1EABA08E8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EABA08F0);
  }
  return result;
}

void static PPT.waitForContent(initDelay:contentLength:scrollView:timeout:completion:)()
{
  OUTLINED_FUNCTION_4();
  uint64_t v53 = v0;
  uint64_t v50 = v1;
  uint64_t v51 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  sub_1DE043180();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v10;
  uint64_t v59 = v9;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_1();
  uint64_t v57 = v11;
  sub_1DE0431A0();
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v13;
  uint64_t v56 = v12;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v54 = v14;
  uint64_t v52 = sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  v21 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  double v23 = (char *)&v45 - v22;
  uint64_t v49 = *v6;
  int v48 = *((unsigned __int8 *)v6 + 8);
  if (_MergedGlobals != -1) {
    swift_once();
  }
  double v24 = (void *)qword_1EABA0910;
  sub_1DE041C08(0, &qword_1EABA08C0, (uint64_t (*)(uint64_t))sub_1DE0416F4, MEMORY[0x1E4FBBE00]);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1DE043AE0;
  id v26 = v24;
  id v27 = objc_msgSend(v4, sel_description);
  uint64_t v28 = sub_1DE0431F0();
  uint64_t v30 = v29;

  *(void *)(v25 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v25 + 64) = sub_1DE04174C();
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v30;
  sub_1DE043200();
  sub_1DE043170();

  swift_bridgeObjectRelease();
  sub_1DE043070(0, &qword_1EABA08D8);
  uint64_t v46 = sub_1DE043220();
  sub_1DE0431B0();
  uint64_t v31 = v23;
  MEMORY[0x1E01CBF70](v21, v8);
  uint64_t v47 = *(void *)(v16 + 8);
  uint64_t v32 = v52;
  OUTLINED_FUNCTION_7();
  v33();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v21, v50, v32);
  unint64_t v34 = (*(unsigned __int8 *)(v16 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v49;
  *(unsigned char *)(v35 + 24) = v48;
  uint64_t v36 = v51;
  *(void *)(v35 + 32) = v4;
  *(void *)(v35 + 40) = v36;
  *(void *)(v35 + 48) = v53;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v35 + v34, v21, v32);
  v60[4] = sub_1DE04270C;
  v60[5] = v35;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 1107296256;
  v60[2] = sub_1DE041BAC;
  v60[3] = &block_descriptor_6;
  v37 = _Block_copy(v60);
  id v38 = v4;
  swift_retain();
  swift_release();
  uint64_t v39 = v54;
  sub_1DE043190();
  v60[0] = MEMORY[0x1E4FBC860];
  sub_1DE042DA4(&qword_1EABA08E0, MEMORY[0x1E4FBCB00]);
  sub_1DE041C08(0, &qword_1EABA08E8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1DE041C6C();
  uint64_t v40 = v57;
  sub_1DE043240();
  uint64_t v41 = (void *)v46;
  MEMORY[0x1E01CBFB0](v31, v39, v40, v37);
  _Block_release(v37);

  OUTLINED_FUNCTION_2();
  v42();
  OUTLINED_FUNCTION_2();
  v43();
  OUTLINED_FUNCTION_7();
  v44();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_1DE0421D0(uint64_t a1, int a2, void *a3, uint64_t (*a4)(id), uint64_t (*a5)(id), uint64_t a6)
{
  uint64_t v53 = a6;
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  uint64_t v47 = sub_1DE043180();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v52 = v13;
  uint64_t v14 = sub_1DE0431A0();
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_1();
  uint64_t v50 = v17;
  uint64_t v18 = sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  uint64_t v22 = *(void *)(v21 + 64);
  uint64_t v24 = MEMORY[0x1F4188790](v23);
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_6();
  uint64_t v49 = a3;
  id v25 = objc_msgSend(a3, sel_contentSize);
  uint64_t v46 = a1;
  int v48 = a2;
  if (a2)
  {
    if (v26 > *(double *)&a1) {
      return v54(v25);
    }
  }
  else if (v27 > *(double *)&a1)
  {
    return v54(v25);
  }
  v45[1] = v14;
  v45[2] = v11;
  sub_1DE0431B0();
  sub_1DE042DA4(&qword_1EABA08F8, MEMORY[0x1E4FBCBC8]);
  uint64_t v28 = v53;
  char v29 = sub_1DE0431E0();
  uint64_t v30 = *(uint64_t (**)(void))(v20 + 8);
  OUTLINED_FUNCTION_5();
  id v25 = (id)v30();
  if (v29)
  {
    sub_1DE043070(0, &qword_1EABA08D8);
    v45[0] = sub_1DE043220();
    sub_1DE0431B0();
    MEMORY[0x1E01CBF70]((char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), 1.0);
    OUTLINED_FUNCTION_5();
    v30();
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v18);
    unint64_t v31 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v46;
    *(unsigned char *)(v32 + 24) = v48 & 1;
    uint64_t v33 = v49;
    *(void *)(v32 + 32) = v49;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v32 + v31, (char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    unint64_t v34 = (uint64_t (**)(id))(v32 + ((v22 + v31 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v35 = v30;
    uint64_t v36 = v55;
    void *v34 = v54;
    v34[1] = v36;
    aBlock[4] = sub_1DE042EAC;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DE041BAC;
    aBlock[3] = &block_descriptor_27;
    v37 = _Block_copy(aBlock);
    id v38 = v33;
    swift_retain();
    swift_release();
    uint64_t v39 = v50;
    sub_1DE043190();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1DE042DA4(&qword_1EABA08E0, MEMORY[0x1E4FBCB00]);
    sub_1DE041C08(0, &qword_1EABA08E8, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1DE041C6C();
    uint64_t v40 = v52;
    sub_1DE043240();
    uint64_t v41 = (void *)v45[0];
    MEMORY[0x1E01CBFB0](v6, v39, v40, v37);
    _Block_release(v37);

    OUTLINED_FUNCTION_2();
    v42();
    OUTLINED_FUNCTION_2();
    v43();
    OUTLINED_FUNCTION_5();
    return v35();
  }
  return v54(v25);
}

uint64_t sub_1DE042664()
{
  sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 56) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_release();
  OUTLINED_FUNCTION_5();
  v8();
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1DE04270C()
{
  uint64_t v1 = *(void *)(sub_1DE0431C0() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  int v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(uint64_t (**)(id))(v0 + 40);
  uint64_t v6 = *(uint64_t (**)(id))(v0 + 48);
  uint64_t v7 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_1DE0421D0(v2, v3, v4, v5, v6, v7);
}

void static PPT.rampDisplay(completion:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_sharedApplication);
  id v5 = objc_msgSend(v4, sel_delegate);

  if (v5)
  {
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_window))
    {
      id v6 = objc_msgSend(v5, sel_window);
      swift_unknownObjectRelease();
      if (v6)
      {
        objc_msgSend(v6, sel_setAlpha_, 0.0);
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  uint64_t v7 = self;
  uint64_t v15 = sub_1DE042988;
  uint64_t v16 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_1DE041BAC;
  uint64_t v14 = &block_descriptor_9;
  double v8 = _Block_copy(&v11);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v15 = sub_1DE042AC8;
  uint64_t v16 = v9;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_1DE042BA0;
  uint64_t v14 = &block_descriptor_15;
  uint64_t v10 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_animateWithDuration_animations_completion_, v8, v10, 0.5);
  _Block_release(v10);
  _Block_release(v8);
}

void sub_1DE042988()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  id v1 = objc_msgSend(v0, sel_delegate);

  if (v1)
  {
    if (objc_msgSend(v1, sel_respondsToSelector_, sel_window))
    {
      id v2 = objc_msgSend(v1, sel_window);
      swift_unknownObjectRelease();
      if (v2)
      {
        objc_msgSend(v2, sel_setAlpha_, 1.0);
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1DE042A90()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1DE042AC8()
{
  id v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  id v2 = objc_msgSend(self, sel_sharedApplication);
  id v3 = objc_msgSend(v2, sel_delegate);

  if (v3)
  {
    if (objc_msgSend(v3, sel_respondsToSelector_, sel_window))
    {
      id v5 = objc_msgSend(v3, sel_window);
      uint64_t v4 = swift_unknownObjectRelease();
      if (v5)
      {
        objc_msgSend(v5, sel_setAlpha_, 1.0);
      }
    }
    else
    {
      uint64_t v4 = swift_unknownObjectRelease();
    }
  }
  return v1(v4);
}

uint64_t sub_1DE042BA0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id PPT.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PPT.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PPT.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PPT()
{
  return self;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PPT.ContentLength(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for PPT.ContentLength(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1DE042D7C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1DE042D88(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PPT.ContentLength()
{
  return &type metadata for PPT.ContentLength;
}

uint64_t sub_1DE042DA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DE042DEC()
{
  sub_1DE0431C0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 40) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  OUTLINED_FUNCTION_5();
  v8();
  swift_release();
  return MEMORY[0x1F4186498](v0, v7 + 16, v6);
}

uint64_t sub_1DE042EAC()
{
  uint64_t v1 = *(void *)(sub_1DE0431C0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v2;
  unint64_t v7 = (uint64_t *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  type metadata accessor for PPT();
  uint64_t v11 = v3;
  char v12 = v4;
  return static PPT.waitForContent(initDelay:contentLength:scrollView:timeout:completion:)(&v11, v5, v6, v8, v9, 0.0);
}

uint64_t sub_1DE042F80()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1DE042FC0()
{
  uint64_t v1 = v0[2];
  type metadata accessor for PPT();
  uint64_t result = v1 + 1;
  if (!__OFADD__(v1, 1)) {
    return static PPT.preloadScroll(initDelay:currentDepth:maxDepth:scrollView:completion:)(result, v0[3], v0[4], v0[5], v0[6], 1.0);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DE043000(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1DE0431F0();

  return v3;
}

uint64_t sub_1DE043070(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DE043170()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1DE043180()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DE043190()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DE0431A0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DE0431B0()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1DE0431C0()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1DE0431D0()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1DE0431E0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1DE0431F0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DE043200()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DE043210()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1DE043220()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DE043230()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1DE043240()
{
  return MEMORY[0x1F4184B18]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}