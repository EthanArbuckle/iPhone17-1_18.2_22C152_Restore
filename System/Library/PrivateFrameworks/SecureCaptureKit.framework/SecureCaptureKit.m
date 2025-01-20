uint64_t sub_25BEE56F4(uint64_t a1)
{
  return sub_25BEE93CC(a1, (void (*)(void))type metadata accessor for SharedSecureCaptureSessionActor, &qword_26A582268);
}

uint64_t static SharedSecureCaptureSessionActor.shared.getter()
{
  return sub_25BEE957C(&qword_26A582260);
}

uint64_t SharedSecureCaptureSessionActor.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SharedSecureCaptureSessionActor.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t SharedSecureCaptureSessionActor.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25BEE5794()
{
  return v0;
}

uint64_t sub_25BEE57A0(uint64_t a1, uint64_t a2)
{
  return sub_25BEE9454(a1, a2, &qword_26A582260);
}

uint64_t sub_25BEE57C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SharedSecureCaptureSessionActor();
  return MEMORY[0x270FA2150](v3, a2);
}

uint64_t static SecureCaptureSession.currentSession.getter()
{
  return swift_retain();
}

uint64_t SecureCaptureSession.__allocating_init(sceneDelegate:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  SecureCaptureSession.init(sceneDelegate:)(a1);
  return v2;
}

id SecureCaptureSession.init(sceneDelegate:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(self, sel_temporarySessionPathWithType_, 1);
  if (result)
  {
    v7 = result;
    *(void *)(v2 + 16) = result;
    uint64_t v8 = v2 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath;
    uint64_t v9 = sub_25BF05328();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    uint64_t v10 = sub_25BF05638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    sub_25BF05618();
    id v11 = v7;
    id v12 = a1;
    uint64_t v13 = sub_25BF05608();
    v14 = (void *)swift_allocObject();
    uint64_t v15 = MEMORY[0x263F8F500];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v12;
    v14[5] = v11;
    sub_25BEE5D80((uint64_t)v5, (uint64_t)&unk_26A5822C8, (uint64_t)v14);
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822D0);
    uint64_t v16 = swift_allocObject();
    *(_DWORD *)(v16 + 24) = 0;
    *(void *)(v16 + 16) = v12;
    *(void *)(v2 + 24) = v16;
    return (id)v2;
  }
  else
  {
    __break(1u);
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

uint64_t sub_25BEE5A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_25BF05618();
  v5[4] = sub_25BF05608();
  uint64_t v7 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE5B04, v7, v6);
}

uint64_t sub_25BEE5B04()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  id v2 = v1;
  sub_25BF02E08(v1);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25BEE5B84()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BEE5BCC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_25BEE5C8C;
  return sub_25BEE5A6C(a1, v4, v5, v7, v6);
}

uint64_t sub_25BEE5C8C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25BEE5D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25BF05638();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25BF05628();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25BEEDD1C(a1, &qword_26A5822B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BF055D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SecureCaptureSession.sessionContentsURL.getter(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BEE5F4C, 0, 0);
}

uint64_t sub_25BEE5F4C()
{
  id v1 = objc_msgSend(*(id *)(*(void *)(v0 + 24) + 16), sel_url);
  sub_25BF05318();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id SecureCaptureSession.sessionPath.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t SecureCaptureSession.__sceneDelegate.getter()
{
  return swift_retain();
}

void *SecureCaptureSession._sceneDelegate.getter()
{
  id v1 = *(os_unfair_lock_s **)(v0 + 24);
  uint64_t v2 = (void **)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_25BEE6040(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

id sub_25BEE6040@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

void *SecureCaptureSession.sceneDelegate.getter()
{
  id v1 = *(os_unfair_lock_s **)(v0 + 24);
  uint64_t v2 = (void **)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_25BEE6040(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

void sub_25BEE60D0(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 24);
  uint64_t v4 = (void **)&v3[4];
  uint64_t v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_25BEE6040(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void (*SecureCaptureSession.sceneDelegate.modify(void *a1))(id *a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  uint64_t v4 = (void **)&v3[4];
  uint64_t v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_25BEE6040(v4, &v7);
  os_unfair_lock_unlock(v5);
  *a1 = v7;
  return sub_25BEE61C8;
}

void sub_25BEE61C8(id *a1)
{
}

uint64_t SecureCaptureSession.urlsToOpen.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(os_unfair_lock_s **)(v0 + 24);
  uint64_t v6 = (void **)&v5[4];
  uint64_t v7 = v5 + 6;
  os_unfair_lock_lock(v5 + 6);
  sub_25BEE6040(v6, v11);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = v11[0];
  uint64_t v9 = (char *)v11[0] + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v9, v1);

  sub_25BF05328();
  sub_25BEED068(&qword_26A5822F0, &qword_26A5822E0);
  return sub_25BF05998();
}

uint64_t sub_25BEE6368(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25BEE638C, 0, 0);
}

uint64_t sub_25BEE638C()
{
  sub_25BF05618();
  *(void *)(v0 + 32) = sub_25BF05608();
  uint64_t v2 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE6420, v2, v1);
}

uint64_t sub_25BEE6420()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 40) = objc_msgSend(v1, sel_URL);
  return MEMORY[0x270FA2498](sub_25BEE64A4, 0, 0);
}

uint64_t sub_25BEE64A4()
{
  uint64_t v1 = *(void **)(v0 + 40);
  sub_25BF05318();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

Swift::Void __swiftcall SecureCaptureSession.openApplication(userActivity:)(NSUserActivity userActivity)
{
  sub_25BEE6620(MEMORY[0x263F8EE78]);
  uint64_t v3 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  v5[4] = sub_25BEEAF08;
  uint64_t v6 = v1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25BEE6D2C;
  v5[3] = &block_descriptor;
  uint64_t v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  [(objc_class *)userActivity.super.isa _createUserActivityDataWithOptions:v3 completionHandler:v4];
  _Block_release(v4);
}

unint64_t sub_25BEE6620(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582518);
  uint64_t v2 = sub_25BF059F8();
  uint64_t v3 = (void *)v2;
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
    sub_25BEEDBF8(v6, (uint64_t)v15, (uint64_t *)&unk_26A582520);
    unint64_t result = sub_25BEEB284((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_25BEEDC5C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25BEE6764(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582488);
  uint64_t v2 = (void *)sub_25BF059F8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25BEEB3A8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

uint64_t sub_25BEE6878(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  uint64_t result = MEMORY[0x270FA5388]();
  long long v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3 && a2 >> 60 != 15)
  {
    uint64_t v11 = sub_25BF05638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    sub_25BF05618();
    sub_25BEED90C(a1, a2);
    swift_retain();
    uint64_t v12 = sub_25BF05608();
    uint64_t v13 = (void *)swift_allocObject();
    uint64_t v14 = MEMORY[0x263F8F500];
    v13[2] = v12;
    v13[3] = v14;
    v13[4] = a4;
    v13[5] = a1;
    v13[6] = a2;
    sub_25BEE5D80((uint64_t)v10, (uint64_t)&unk_26A582510, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t sub_25BEE69C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  sub_25BF05618();
  v6[13] = sub_25BF05608();
  uint64_t v8 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE6A60, v8, v7);
}

uint64_t sub_25BEE6A60()
{
  v27 = v0;
  uint64_t v1 = v0[10];
  swift_release();
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  uint64_t v3 = (void **)&v2[4];
  uint64_t v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_25BEE6040(v3, (void **)&v26);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = (void *)v26;
  uint64_t v6 = (id *)(v26 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id v7 = *v6;
  id v8 = *v6;

  if (v7)
  {
    id v9 = objc_msgSend(v8, sel_windowScene);

    if (v9)
    {
      uint64_t v11 = v0[11];
      unint64_t v10 = v0[12];
      id v12 = objc_allocWithZone(MEMORY[0x263F08D38]);
      sub_25BEED528(v11, v10);
      uint64_t v13 = (void *)sub_25BF05338();
      id v14 = objc_msgSend(v12, sel_initWithData_, v13);
      sub_25BEED970(v11, v10);

      if (!v14)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v15 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction), sel_initWithUserActivity_responder_, v14, 0);
      id v16 = objc_msgSend(v9, sel__FBSScene);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25BF06730;
      *(void *)(inited + 32) = v15;
      unint64_t v26 = inited;
      sub_25BF055A8();
      unint64_t v18 = v26;
      if (v26 >> 62)
      {
        id v21 = v15;
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_25BF059C8();
        swift_bridgeObjectRelease();
        if (!v22) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v19 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v20 = v15;
        if (!v19)
        {
LABEL_8:
          swift_bridgeObjectRelease();
          sub_25BEED774(0, &qword_26A5824C8);
          sub_25BEED5A0();
          v23 = (void *)sub_25BF05668();
          swift_bridgeObjectRelease();
          objc_msgSend(v16, sel_sendActions_, v23);

          goto LABEL_9;
        }
      }
      sub_25BEF60B8(v18);
      goto LABEL_8;
    }
  }
LABEL_10:
  v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_25BEE6D2C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_25BF05348();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_25BEEDAB4((uint64_t)v4, v8);
  return swift_release();
}

void sub_25BEE6DD8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25BEE6620(MEMORY[0x263F8EE78]);
  unint64_t v8 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  id v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = v3;
  v9[5] = v7;
  v11[4] = sub_25BEED900;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_25BEE6D2C;
  v11[3] = &block_descriptor_87;
  unint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v8, v10);
  _Block_release(v10);
}

void sub_25BEE6F44(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388]();
  id v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 || a2 >> 60 == 15)
  {
    sub_25BEEC9CC();
    id v20 = (void *)swift_allocError();
    *id v21 = 0;
    a4(v20, 1);
  }
  else
  {
    uint64_t v16 = sub_25BF05638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
    sub_25BF05618();
    sub_25BEED90C(a1, a2);
    sub_25BEED90C(a1, a2);
    swift_retain();
    swift_retain();
    uint64_t v17 = sub_25BF05608();
    unint64_t v18 = (void *)swift_allocObject();
    uint64_t v19 = MEMORY[0x263F8F500];
    v18[2] = v17;
    v18[3] = v19;
    v18[4] = a6;
    v18[5] = a1;
    v18[6] = a2;
    v18[7] = a4;
    v18[8] = a5;
    v18[9] = a7;
    sub_25BEE5D80((uint64_t)v15, (uint64_t)&unk_26A582500, (uint64_t)v18);
    sub_25BEEDAB4(a1, a2);
    swift_release();
  }
}

uint64_t sub_25BEE7134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a8;
  v8[21] = v13;
  v8[18] = a6;
  v8[19] = a7;
  v8[16] = a4;
  v8[17] = a5;
  sub_25BF05618();
  v8[22] = sub_25BF05608();
  uint64_t v10 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE71DC, v10, v9);
}

uint64_t sub_25BEE71DC()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void *)(v0 + 128);
  swift_release();
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  uint64_t v3 = (void **)&v2[4];
  uint64_t v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_25BEE6040(v3, (void **)&v34);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = (void *)v34;
  id v6 = (id *)(v34 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id v7 = *v6;
  id v8 = *v6;

  if (!v7) {
    goto LABEL_8;
  }
  id v9 = objc_msgSend(v8, sel_windowScene);

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v0 + 136);
  unint64_t v10 = *(void *)(v0 + 144);
  id v12 = objc_allocWithZone(MEMORY[0x263F08D38]);
  sub_25BEED528(v11, v10);
  uint64_t v13 = (void *)sub_25BF05338();
  id v14 = objc_msgSend(v12, sel_initWithData_, v13);
  sub_25BEED970(v11, v10);

  if (!v14)
  {

LABEL_8:
    unint64_t v26 = *(void (**)(void *, uint64_t))(v0 + 152);
    sub_25BEEC9CC();
    v27 = (void *)swift_allocError();
    *uint64_t v28 = 0;
    v26(v27, 1);

    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(v0 + 152);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(_OWORD *)(v16 + 24) = *(_OWORD *)(v0 + 160);
  *(void *)(v0 + 48) = sub_25BEEDAC8;
  *(void *)(v0 + 56) = v16;
  *(void *)(v0 + 16) = MEMORY[0x263EF8330];
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_25BEF4230;
  *(void *)(v0 + 40) = &block_descriptor_97;
  uint64_t v17 = _Block_copy((const void *)(v0 + 16));
  unint64_t v18 = self;
  swift_retain();
  id v19 = objc_msgSend(v18, sel_responderWithHandler_, v17);
  _Block_release(v17);
  swift_release();
  id v20 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction), sel_initWithUserActivity_responder_, v14, v19);
  id v21 = objc_msgSend(v9, sel__FBSScene);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BF06730;
  *(void *)(inited + 32) = v20;
  unint64_t v34 = inited;
  sub_25BF055A8();
  unint64_t v23 = v34;
  if (v34 >> 62)
  {
    id v29 = v20;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_25BF059C8();
    swift_bridgeObjectRelease();
    if (!v30) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  uint64_t v24 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v25 = v20;
  if (v24) {
LABEL_6:
  }
    sub_25BEF60B8(v23);
LABEL_10:
  swift_bridgeObjectRelease();
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  v31 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_sendActions_, v31);

LABEL_11:
  v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

void sub_25BEE75C8(void *a1@<X0>, char *a2@<X8>)
{
  id v3 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824B0);
  if (swift_dynamicCast())
  {
    char v4 = (char)v22;
  }
  else
  {
    uint64_t v5 = (void *)sub_25BF052D8();
    id v6 = objc_msgSend(v5, sel_underlyingErrors);
    uint64_t v7 = sub_25BF05598();

    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      id v21 = v5;
      swift_bridgeObjectRetain();
      uint64_t v9 = 0;
      while (1)
      {
        unint64_t v10 = *(void **)(v7 + 8 * v9 + 32);
        id v11 = v10;
        id v12 = (void *)sub_25BF052D8();
        id v13 = objc_msgSend(v12, sel_domain);

        uint64_t v14 = sub_25BF05528();
        uint64_t v16 = v15;

        if (v14 == sub_25BF05528() && v16 == v17) {
          break;
        }
        char v19 = sub_25BF05A38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v19) {
          goto LABEL_14;
        }
        ++v9;

        if (v8 == v9)
        {

          swift_bridgeObjectRelease_n();
LABEL_19:
          char v4 = 0;
          goto LABEL_20;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_14:
      swift_bridgeObjectRelease_n();
      sub_25BEED774(0, &qword_26A5824F0);
      if ((swift_dynamicCast() & 1) == 0)
      {

        goto LABEL_19;
      }
      id v20 = objc_msgSend(v22, sel_code);

      char v4 = v20 == (id)4;
      if (v20 == (id)7) {
        char v4 = 2;
      }
    }
    else
    {

      swift_bridgeObjectRelease();
      char v4 = 0;
    }
  }
LABEL_20:
  *a2 = v4;
}

uint64_t sub_25BEE7824(void *a1, uint64_t a2, uint64_t a3)
{
  char v4 = v3;
  uint64_t v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25BF05638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_25BF05618();
  swift_retain();
  swift_retain();
  id v12 = a1;
  uint64_t v13 = sub_25BF05608();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v4;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = v12;
  v14[8] = v8;
  sub_25BEE5D80((uint64_t)v10, (uint64_t)&unk_26A5824E8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_25BEE799C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  sub_25BF05618();
  v8[21] = sub_25BF05608();
  uint64_t v10 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE7A3C, v10, v9);
}

uint64_t sub_25BEE7A3C()
{
  v33 = v0;
  uint64_t v1 = v0[16];
  swift_release();
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  id v3 = (void **)&v2[4];
  char v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_25BEE6040(v3, (void **)&v32);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = (void *)v32;
  id v6 = (id *)(v32 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id v7 = *v6;
  id v8 = *v6;

  if (!v7 || (id v9 = objc_msgSend(v8, sel_windowScene), v8, !v9))
  {
    uint64_t v24 = (void (*)(void *, uint64_t))v0[17];
    sub_25BEEC9CC();
    id v25 = (void *)swift_allocError();
    *unint64_t v26 = 0;
    v24(v25, 1);

    goto LABEL_9;
  }
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[20];
  uint64_t v13 = v0[17];
  uint64_t v12 = v0[18];
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = v12;
  v14[4] = v11;
  v0[6] = sub_25BEEDF20;
  v0[7] = v14;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25BEF4230;
  v0[5] = &block_descriptor_78;
  uint64_t v15 = _Block_copy(v0 + 2);
  uint64_t v16 = self;
  swift_retain();
  id v17 = objc_msgSend(v16, sel_responderWithHandler_, v15);
  _Block_release(v15);
  swift_release();
  id v18 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction), sel_initWithUserActivity_responder_, v10, v17);
  id v19 = objc_msgSend(v9, sel__FBSScene);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BF06730;
  *(void *)(inited + 32) = v18;
  unint64_t v32 = inited;
  sub_25BF055A8();
  unint64_t v21 = v32;
  if (v32 >> 62)
  {
    id v27 = v18;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_25BF059C8();
    swift_bridgeObjectRelease();
    if (!v28) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  uint64_t v22 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v23 = v18;
  if (v22) {
LABEL_5:
  }
    sub_25BEF60B8(v21);
LABEL_8:
  swift_bridgeObjectRelease();
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  id v29 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_sendActions_, v29);

LABEL_9:
  uint64_t v30 = (uint64_t (*)(void))v0[1];
  return v30();
}

void sub_25BEE7DBC(void *a1, void (*a2)(void *, uint64_t))
{
  id v3 = objc_msgSend(a1, sel_error);
  if (v3)
  {
    id v6 = v3;
    sub_25BEEC9CC();
    char v4 = (void *)swift_allocError();
    sub_25BEE75C8(v6, v5);
    a2(v4, 1);
  }
  else
  {
    a2(0, 0);
  }
}

uint64_t SecureCaptureSession.openApplication(for:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BEE7EB0, 0, 0);
}

uint64_t sub_25BEE7EB0()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BEE7FA0;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25BEE7FA0()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25BEE80D4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_25BEE80BC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25BEE80BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25BEE80D4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SecureCaptureSession.openApplicationAfterTransitionCompletion(for:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_25BF05618();
  v2[5] = sub_25BF05608();
  uint64_t v4 = sub_25BF055D8();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_25BEE81D4, v4, v3);
}

uint64_t sub_25BEE81D4()
{
  int8x16_t v4 = v0[1];
  v0[4].i64[0] = sub_25BF05608();
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[4].i64[1] = (uint64_t)v1;
  v1[1] = vextq_s8(v4, v4, 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5].i64[0] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25BEE82E8;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25BEE82E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_25BEE8470;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_25BEE840C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25BEE840C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEE8470()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEE84E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824D8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  a6(a3, a5, v14);
  return swift_release();
}

uint64_t sub_25BEE8638(void *a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824D8);
    return sub_25BF055E8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824D8);
    return sub_25BF055F8();
  }
}

uint64_t SecureCaptureSession.openApplication(url:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25BF05328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BF05638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_25BF05618();
  swift_retain();
  uint64_t v11 = sub_25BF05608();
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v13 = (char *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  *((void *)v13 + 2) = v11;
  *((void *)v13 + 3) = v14;
  *((void *)v13 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v13[v12], v7, v4);
  sub_25BEE5D80((uint64_t)v9, (uint64_t)&unk_26A582310, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_25BEE888C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  sub_25BF05618();
  v5[12] = sub_25BF05608();
  uint64_t v7 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEE8924, v7, v6);
}

uint64_t sub_25BEE8924()
{
  uint64_t v24 = v0;
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  id v3 = (void **)&v2[4];
  uint64_t v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_25BEE6040(v3, (void **)&v23);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = (void *)v23;
  uint64_t v6 = (id *)(v23 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id v7 = *v6;
  id v8 = *v6;

  if (v7)
  {
    id v9 = objc_msgSend(v8, sel_windowScene);

    if (v9)
    {
      id v10 = objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction);
      uint64_t v11 = (void *)sub_25BF052E8();
      id v12 = objc_msgSend(v10, sel_initWithURL_responder_, v11, 0);

      id v13 = objc_msgSend(v9, sel__FBSScene);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25BF06730;
      *(void *)(inited + 32) = v12;
      unint64_t v23 = inited;
      sub_25BF055A8();
      unint64_t v15 = v23;
      if (v23 >> 62)
      {
        id v18 = v12;
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_25BF059C8();
        swift_bridgeObjectRelease();
        if (!v19) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v16 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v17 = v12;
        if (!v16)
        {
LABEL_7:
          swift_bridgeObjectRelease();
          sub_25BEED774(0, &qword_26A5824C8);
          sub_25BEED5A0();
          id v20 = (void *)sub_25BF05668();
          swift_bridgeObjectRelease();
          objc_msgSend(v13, sel_sendActions_, v20);

          goto LABEL_8;
        }
      }
      sub_25BEF60B8(v15);
      goto LABEL_7;
    }
  }
LABEL_8:
  unint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t SecureCaptureSession.sessionContentsPath.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BEEDBF8(v1 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, a1, &qword_26A582600);
}

void SecureCaptureSession.__allocating_init(delegate:)()
{
  if (!objc_msgSend(self, sel_temporarySessionPathWithType_, 1)) {
    __break(1u);
  }
  sub_25BF059B8();
  __break(1u);
}

void SecureCaptureSession.init(delegate:)()
{
  id v1 = objc_msgSend(self, sel_temporarySessionPathWithType_, 1);
  if (!v1) {
    __break(1u);
  }
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath;
  uint64_t v3 = sub_25BF05328();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_25BF059B8();
  __break(1u);
}

Swift::Void __swiftcall SecureCaptureSession.authenticate(with:)(NSUserActivity with)
{
}

Swift::Void __swiftcall SecureCaptureSession.authenticate(userActivity:)(NSUserActivity userActivity)
{
}

void sub_25BEE8D70(void *a1, uint64_t a2, uint64_t a3)
{
  sub_25BEE6620(MEMORY[0x263F8EE78]);
  id v7 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  v9[4] = a2;
  uint64_t v10 = v3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25BEE6D2C;
  v9[3] = a3;
  id v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v8);
  _Block_release(v8);
}

uint64_t SecureCaptureSession.authenticate(url:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25BF05328();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BF05638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_25BF05618();
  swift_retain();
  uint64_t v11 = sub_25BF05608();
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v13 = (char *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  *((void *)v13 + 2) = v11;
  *((void *)v13 + 3) = v14;
  *((void *)v13 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v13[v12], v7, v4);
  sub_25BEE5D80((uint64_t)v9, (uint64_t)&unk_26A582320, (uint64_t)v13);
  return swift_release();
}

unint64_t static SecureCaptureSession.ApplicationLaunchError.errorDomain.getter()
{
  return 0xD000000000000033;
}

uint64_t SecureCaptureSession.ApplicationLaunchError.errorCode.getter()
{
  return *v0;
}

unint64_t SecureCaptureSession.ApplicationLaunchError.failureReason.getter()
{
  unint64_t v1 = 0xD00000000000002ELL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000063;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000023;
  }
}

BOOL static SecureCaptureSession.ApplicationLaunchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SecureCaptureSession.ApplicationLaunchError.hash(into:)()
{
  return sub_25BF05B18();
}

uint64_t SecureCaptureSession.ApplicationLaunchError.hashValue.getter()
{
  return sub_25BF05B38();
}

BOOL sub_25BEE916C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25BEE9180()
{
  return sub_25BF05B38();
}

uint64_t sub_25BEE91C8()
{
  return sub_25BF05B18();
}

uint64_t sub_25BEE91F4()
{
  return sub_25BF05B38();
}

unint64_t sub_25BEE9238()
{
  return 0xD000000000000033;
}

uint64_t sub_25BEE9254()
{
  return *v0;
}

uint64_t sub_25BEE9270(uint64_t a1)
{
  unint64_t v2 = sub_25BEED0D4();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_25BEE92AC(uint64_t a1)
{
  unint64_t v2 = sub_25BEED0D4();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t SecureCaptureSession.deinit()
{
  swift_release();
  sub_25BEEDD1C(v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, &qword_26A582600);
  return v0;
}

uint64_t SecureCaptureSession.__deallocating_deinit()
{
  swift_release();
  sub_25BEEDD1C((uint64_t)v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, &qword_26A582600);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25BEE93AC(uint64_t a1)
{
  return sub_25BEE93CC(a1, (void (*)(void))type metadata accessor for SharedSecureCaptureSessionStorageActor, &qword_26A582280);
}

uint64_t sub_25BEE93CC(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  a2();
  uint64_t v4 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *a3 = v4;
  return result;
}

uint64_t static SharedSecureCaptureSessionStorageActor.shared.getter()
{
  return sub_25BEE957C(&qword_26A582278);
}

uint64_t sub_25BEE9430(uint64_t a1, uint64_t a2)
{
  return sub_25BEE9454(a1, a2, &qword_26A582278);
}

uint64_t sub_25BEE9454(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_25BEE94A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SharedSecureCaptureSessionStorageActor();
  return MEMORY[0x270FA2150](v3, a2);
}

uint64_t sub_25BEE94DC()
{
  type metadata accessor for SecureCaptureSessionStorage(0);
  swift_allocObject();
  uint64_t result = SecureCaptureSessionStorage.init()();
  if (result) {
    qword_26A582290 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t SecureCaptureSessionStorage.__allocating_init()()
{
  return SecureCaptureSessionStorage.init()();
}

uint64_t static SecureCaptureSessionStorage.shared.getter()
{
  return sub_25BEE957C(&qword_26A582288);
}

uint64_t sub_25BEE957C(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t (*sub_25BEE95C8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25BEE961C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEE96E0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BEE97C4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEE9880()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BEE9958(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_25BEE99C0(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_25BF053B8();
  swift_release();
  v3[7] = sub_25BEE95C8();
  return sub_25BEE9AE0;
}

void sub_25BEE9AE0(void *a1)
{
}

uint64_t sub_25BEE9AEC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEE9BA8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEE9C6C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BEE9D50(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SecureCaptureSessionStorage.init()()
{
  uint64_t v1 = v0;
  uint64_t v24 = sub_25BF05328();
  uint64_t v2 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[4] = 0;
  sub_25BF053C8();
  id v5 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_25BEED774(0, (unint64_t *)&qword_26A582670);
  unint64_t v6 = sub_25BF05598();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25BF059C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_25BEEC548(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
      __break(1u);
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    uint64_t v9 = 0;
    uint64_t v8 = v25;
    uint64_t v22 = v0;
    unint64_t v23 = v6 & 0xC000000000000001;
    unint64_t v10 = v6;
    uint64_t v11 = v7;
    do
    {
      if (v23) {
        id v12 = (id)MEMORY[0x261177BE0](v9, v6);
      }
      else {
        id v12 = *(id *)(v6 + 8 * v9 + 32);
      }
      id v13 = v12;
      id v14 = objc_msgSend(v12, sel_url);
      sub_25BF05318();

      uint64_t v25 = v8;
      unint64_t v16 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_25BEEC548(v15 > 1, v16 + 1, 1);
        uint64_t v8 = v25;
      }
      ++v9;
      *(void *)(v8 + 16) = v16 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v8+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v16, v4, v24);
      unint64_t v6 = v10;
    }
    while (v11 != v9);
    uint64_t v7 = v11;
    uint64_t v1 = v22;
  }
  v1[2] = v8;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  v1[4] = v8;
  if (v7 >= *(void *)(v8 + 16)) {
    uint64_t v17 = *(void *)(v8 + 16);
  }
  else {
    uint64_t v17 = v7;
  }
  if (v17)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
    uint64_t v18 = sub_25BF059F8();
  }
  else
  {
    uint64_t v18 = MEMORY[0x263F8EE80];
  }
  uint64_t v25 = v18;
  swift_bridgeObjectRetain();
  uint64_t v19 = swift_bridgeObjectRetain();
  sub_25BEEB82C(v19, v6, 1, &v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[3] = v25;
  return (uint64_t)v1;
}

uint64_t sub_25BEEA0F8()
{
  return swift_bridgeObjectRelease();
}

void sub_25BEEA1D0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25BF05328();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v27 = v1;
  sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 16) + 16))
  {
    swift_getKeyPath();
    uint64_t v26 = v1;
    sub_25BF05398();
    swift_release();
    uint64_t v7 = *(void *)(v1 + 16);
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_25BEEA628(a1, v7);
    char v9 = v8;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    uint64_t v26 = v2;
    sub_25BF05398();
    swift_release();
    swift_beginAccess();
    uint64_t v10 = *(void *)(v2 + 24);
    if (*(void *)(v10 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_25BEEB2C8(a1);
      if (v12)
      {
        uint64_t v22 = v4;
        id v13 = *(id *)(*(void *)(v10 + 56) + 8 * v11);
        swift_bridgeObjectRelease();
        if (v9 & 1) != 0 || (id v14 = v13, (objc_msgSend(v13, sel_isTemporaryPath)))
        {
        }
        else
        {
          objc_msgSend(v13, sel_invalidate);
          uint64_t v15 = v24;
          uint64_t v16 = a1;
          uint64_t v17 = v22;
          (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v6, v16, v22);
          swift_getKeyPath();
          uint64_t v25 = v2;
          id v21 = v14;
          sub_25BF05398();
          swift_release();
          uint64_t v25 = v2;
          swift_getKeyPath();
          sub_25BF053B8();
          swift_release();
          swift_beginAccess();
          uint64_t v18 = (void *)sub_25BEEC7C4((uint64_t)v6);
          uint64_t v19 = *(void (**)(char *, uint64_t))(v15 + 8);
          v19(v6, v17);
          swift_endAccess();

          uint64_t v25 = v2;
          swift_getKeyPath();
          sub_25BF053A8();
          swift_release();
          swift_getKeyPath();
          uint64_t v25 = v2;
          sub_25BF05398();
          swift_release();
          uint64_t v25 = v2;
          swift_getKeyPath();
          sub_25BF053B8();
          swift_release();
          swift_beginAccess();
          sub_25BEEA750(v23, (uint64_t)v6);
          v19(v6, v22);
          swift_endAccess();
          uint64_t v25 = v2;
          swift_getKeyPath();
          sub_25BF053A8();

          swift_release();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t sub_25BEEA628(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(sub_25BF05328() - 8);
  uint64_t v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = *(void *)(v4 + 72);
  sub_25BEEC904(&qword_26A5824A0, 255, MEMORY[0x263F06EA8]);
  uint64_t v7 = 0;
  while ((sub_25BF05508() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7) {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_25BEEA750@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_25BEF2E88(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = sub_25BF05328();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_25BF05A08();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  *(void *)(v5 + 16) = v7;
  *uint64_t v2 = v5;
  return result;
}

uint64_t (*sub_25BEEA8AC())()
{
  return j__swift_endAccess;
}

uint64_t sub_25BEEA904@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEEA9C8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BEEAAAC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEEAB68(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_25BEEABD0(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_25BEEC904((unint64_t *)&unk_26A582330, 255, (void (*)(uint64_t))type metadata accessor for SecureCaptureSessionStorage);
  sub_25BF05398();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_25BF053B8();
  swift_release();
  v3[7] = sub_25BEEA8AC();
  return sub_25BEEACF0;
}

void sub_25BEEACF0(void *a1)
{
}

void sub_25BEEACFC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_25BF053A8();
  swift_release();
  free(v1);
}

uint64_t SecureCaptureSessionStorage.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  uint64_t v2 = sub_25BF053D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SecureCaptureSessionStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  uint64_t v2 = sub_25BF053D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
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

uint64_t sub_25BEEAF08(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_25BEE6878(a1, a2, a3, v3);
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

uint64_t sub_25BEEAF28(uint64_t a1)
{
  return sub_25BEE84E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_2709677D0, (uint64_t)sub_25BEED60C, (void (*)(uint64_t, uint64_t, uint64_t))sub_25BEE6DD8);
}

uint64_t sub_25BEEAF74(uint64_t a1)
{
  return sub_25BEE84E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_270967730, (uint64_t)sub_25BEED60C, (void (*)(uint64_t, uint64_t, uint64_t))sub_25BEE7824);
}

uint64_t sub_25BEEAFC4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_25BF05328() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25BEEDF8C;
  return sub_25BEE888C(a1, v5, v6, v7, v8);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v1 = sub_25BF05328();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t type metadata accessor for SecureCaptureSessionStorage(uint64_t a1)
{
  return sub_25BEECACC(a1, (uint64_t *)&unk_26A582390);
}

uint64_t sub_25BEEB1B8()
{
  return sub_25BEE9958(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_25BEEB1D4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25BEEB1DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_25BEEB1F0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25BEEB220(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25BEEB234(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25BEEB248@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25BEEB258(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25BEEB264(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_25BEEB278@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_25BEEB284(uint64_t a1)
{
  uint64_t v2 = sub_25BF058D8();
  return sub_25BEEB420(a1, v2);
}

unint64_t sub_25BEEB2C8(uint64_t a1)
{
  sub_25BF05328();
  sub_25BEEC904(&qword_26A582498, 255, MEMORY[0x263F06EA8]);
  uint64_t v2 = sub_25BF054E8();
  return sub_25BEEB4E8(a1, v2);
}

unint64_t sub_25BEEB364(uint64_t a1)
{
  uint64_t v2 = sub_25BF05AF8();
  return sub_25BEEB6AC(a1, v2);
}

unint64_t sub_25BEEB3A8(uint64_t a1, uint64_t a2)
{
  sub_25BF05B08();
  sub_25BF05548();
  uint64_t v4 = sub_25BF05B38();
  return sub_25BEEB748(a1, a2, v4);
}

unint64_t sub_25BEEB420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25BEEDC6C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x261177B60](v9, a1);
      sub_25BEEDCC8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25BEEB4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25BF05328();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    id v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25BEEC904(&qword_26A5824A0, 255, MEMORY[0x263F06EA8]);
      char v15 = sub_25BF05508();
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

unint64_t sub_25BEEB6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25BEEB748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25BF05A38() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25BF05A38() & 1) == 0);
    }
  }
  return v6;
}

void sub_25BEEB82C(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  v61 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582600);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25BF05328();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v62 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v60 = (char *)v45 - v13;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824A8);
  MEMORY[0x270FA5388](v56);
  v55 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v52 = v15;
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_30:
    sub_25BEEDD1C((uint64_t)v8, &qword_26A582600);
LABEL_31:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  unint64_t v16 = 0;
  uint64_t v57 = v10 + 56;
  uint64_t v53 = v10 + 48;
  uint64_t v54 = v10 + 16;
  v64 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v17 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v59 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0) {
    uint64_t v17 = a2;
  }
  v45[0] = v17;
  uint64_t v49 = a1;
  unint64_t v50 = a2 & 0xC000000000000001;
  uint64_t v63 = v9;
  v47 = v8;
  uint64_t v48 = a2;
  uint64_t v51 = v10;
  while (1)
  {
    if (v16 >= *(void *)(a1 + 16))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      sub_25BF05A78();
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v18 = *(void *)(v10 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)) + v18 * v16, v9);
    v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v46(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
      goto LABEL_30;
    }
    uint64_t v19 = v8;
    uint64_t v20 = *v64;
    (*v64)(v60, v19, v9);
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25BF059C8();
      swift_bridgeObjectRelease();
      if (v16 == v42)
      {
LABEL_29:
        (*(void (**)(char *, uint64_t))(v51 + 8))(v60, v9);
        goto LABEL_31;
      }
    }
    else if (v16 == *(void *)(v59 + 16))
    {
      goto LABEL_29;
    }
    uint64_t v58 = v18;
    if (v50)
    {
      id v21 = (id)MEMORY[0x261177BE0](v16, a2);
    }
    else
    {
      if (v16 >= *(void *)(v59 + 16)) {
        goto LABEL_35;
      }
      id v21 = *(id *)(a2 + 8 * v16 + 32);
    }
    id v22 = v21;
    unint64_t v23 = v55;
    uint64_t v24 = *(int *)(v56 + 48);
    uint64_t v25 = v63;
    v20(v55, v60, v63);
    uint64_t v26 = v22;
    *(void *)&v23[v24] = v22;
    uint64_t v27 = (uint64_t)v62;
    v20(v62, v23, v25);
    uint64_t v28 = (void *)*v61;
    unint64_t v30 = sub_25BEEB2C8(v27);
    uint64_t v31 = v28[2];
    BOOL v32 = (v29 & 1) == 0;
    uint64_t v33 = v31 + v32;
    if (__OFADD__(v31, v32)) {
      goto LABEL_34;
    }
    char v34 = v29;
    if (v28[3] < v33) {
      break;
    }
    if (a3)
    {
      if (v29) {
        goto LABEL_26;
      }
    }
    else
    {
      sub_25BEEBE88();
      if (v34) {
        goto LABEL_26;
      }
    }
LABEL_19:
    uint64_t v37 = (uint64_t)v62;
    v38 = (void *)*v61;
    *(void *)(*v61 + 8 * (v30 >> 6) + 64) |= 1 << v30;
    v20((char *)(v38[6] + v30 * v58), (char *)v37, v63);
    *(void *)(v38[7] + 8 * v30) = v26;
    uint64_t v39 = v38[2];
    BOOL v40 = __OFADD__(v39, 1);
    uint64_t v41 = v39 + 1;
    if (v40) {
      goto LABEL_36;
    }
    ++v16;
    v38[2] = v41;
    a3 = 1;
    uint64_t v10 = v51;
    a2 = v48;
    a1 = v49;
    uint64_t v9 = v63;
    uint64_t v8 = v47;
    if (v52 == v16)
    {
      v46(v47, 1, 1, v63);
      goto LABEL_30;
    }
  }
  sub_25BEEC120(v33, a3 & 1);
  unint64_t v35 = sub_25BEEB2C8((uint64_t)v62);
  if ((v34 & 1) != (v36 & 1)) {
    goto LABEL_37;
  }
  unint64_t v30 = v35;
  if ((v34 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_26:
  v43 = (void *)swift_allocError();
  swift_willThrow();
  id v67 = v43;
  id v44 = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824B0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v62, v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_38:
  uint64_t v65 = 0;
  unint64_t v66 = 0xE000000000000000;
  sub_25BF05948();
  sub_25BF05558();
  sub_25BF05988();
  sub_25BF05558();
  sub_25BF059B8();
  __break(1u);
}

id sub_25BEEBE88()
{
  uint64_t v1 = sub_25BF05328();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25BF059D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25BEEC120(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25BF05328();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
  int v46 = a2;
  uint64_t v10 = sub_25BF059E8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  BOOL v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    int64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_25BEEC904(&qword_26A582498, 255, MEMORY[0x263F06EA8]);
    uint64_t result = sub_25BF054E8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  int64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25BEEC548(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25BEEC584(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25BEEC568()
{
  return sub_25BEEAB68(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25BEEC584(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824B8);
  uint64_t v10 = *(void *)(sub_25BF05328() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25BF05328() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  int64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25BF05A08();
  __break(1u);
  return result;
}

uint64_t sub_25BEEC7C4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_25BEEB2C8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25BEEBE88();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_25BF05328();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_25BEED128(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25BEEC8BC(uint64_t a1, uint64_t a2)
{
  return sub_25BEEC904(&qword_26A582348, a2, (void (*)(uint64_t))type metadata accessor for SharedSecureCaptureSessionActor);
}

uint64_t sub_25BEEC904(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for SharedSecureCaptureSessionActor()
{
  return self;
}

unint64_t sub_25BEEC974()
{
  unint64_t result = qword_26A582350;
  if (!qword_26A582350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582350);
  }
  return result;
}

unint64_t sub_25BEEC9CC()
{
  unint64_t result = qword_26A582358;
  if (!qword_26A582358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582358);
  }
  return result;
}

uint64_t sub_25BEECA20(uint64_t a1, uint64_t a2)
{
  return sub_25BEEC904((unint64_t *)&unk_26A582360, a2, (void (*)(uint64_t))type metadata accessor for SharedSecureCaptureSessionStorageActor);
}

uint64_t type metadata accessor for SharedSecureCaptureSessionStorageActor()
{
  return self;
}

uint64_t method lookup function for SharedSecureCaptureSessionActor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedSecureCaptureSessionActor);
}

uint64_t sub_25BEECAA4()
{
  return type metadata accessor for SecureCaptureSession(0);
}

uint64_t type metadata accessor for SecureCaptureSession(uint64_t a1)
{
  return sub_25BEECACC(a1, (uint64_t *)&unk_26A582370);
}

uint64_t sub_25BEECACC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25BEECB04()
{
  sub_25BEECBF0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SecureCaptureSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SecureCaptureSession);
}

uint64_t dispatch thunk of SecureCaptureSession.__allocating_init(sceneDelegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of SecureCaptureSession.__allocating_init(delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_25BEECBF0()
{
  if (!qword_26A582380)
  {
    sub_25BF05328();
    unint64_t v0 = sub_25BF05818();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A582380);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SecureCaptureSession.ApplicationLaunchError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SecureCaptureSession.ApplicationLaunchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BEECDB4);
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

uint64_t sub_25BEECDDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BEECDE4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecureCaptureSession.ApplicationLaunchError()
{
  return &type metadata for SecureCaptureSession.ApplicationLaunchError;
}

uint64_t method lookup function for SharedSecureCaptureSessionStorageActor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharedSecureCaptureSessionStorageActor);
}

uint64_t sub_25BEECE14()
{
  return type metadata accessor for SecureCaptureSessionStorage(0);
}

uint64_t sub_25BEECE1C()
{
  uint64_t result = sub_25BF053D8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SecureCaptureSessionStorage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SecureCaptureSessionStorage);
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.invalidate(url:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.invalidate(forPath:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t sub_25BEED02C()
{
  return sub_25BEED068(&qword_26A5823A0, &qword_26A5823A8);
}

uint64_t sub_25BEED068(unint64_t *a1, uint64_t *a2)
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

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

unint64_t sub_25BEED0D4()
{
  unint64_t result = qword_26A582480;
  if (!qword_26A582480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582480);
  }
  return result;
}

unint64_t sub_25BEED128(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BF05328();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_25BF05878();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      unint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_25BEEC904(&qword_26A582498, 255, MEMORY[0x263F06EA8]);
        uint64_t v17 = sub_25BF054E8();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            unint64_t v23 = (void *)(v22 + 8 * a1);
            int64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              void *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    int64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *int64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25BEED424(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582490);
  int v3 = (void *)sub_25BF059F8();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t v6 = a1[6];
  unint64_t result = sub_25BEEB364(v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x263F8EE80];
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v5;
    unint64_t v10 = (uint64_t *)(v3[7] + 16 * result);
    *unint64_t v10 = v4;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    sub_25BEED528(v4, v6);
    if (!--v1) {
      return (unint64_t)v3;
    }
    uint64_t v5 = *(v9 - 2);
    uint64_t v4 = *(v9 - 1);
    unint64_t v6 = *v9;
    unint64_t result = sub_25BEEB364(v5);
    v9 += 3;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25BEED528(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_25BEED580()
{
  return sub_25BEE9D50(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_25BEED5A0()
{
  unint64_t result = qword_26A5824D0;
  if (!qword_26A5824D0)
  {
    sub_25BEED774(255, &qword_26A5824C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5824D0);
  }
  return result;
}

uint64_t sub_25BEED610()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25BEED660(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_25BEEDF8C;
  return sub_25BEE799C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25BEED73C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25BEED774(uint64_t a1, unint64_t *a2)
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

uint64_t objectdestroy_67Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BEED848(void *a1, char a2)
{
  char v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824D8);
  return sub_25BEE8638(a1, v3);
}

uint64_t sub_25BEED8C0()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25BEED900(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_25BEE6F44(a1, a2, a3, *(void (**)(void *, uint64_t))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40));
}

uint64_t sub_25BEED90C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25BEED528(a1, a2);
  }
  return a1;
}

uint64_t sub_25BEED920()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_25BEED970(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_25BEED970(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_25BEED9C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_25BEEDF8C;
  return sub_25BEE7134(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25BEEDAB4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25BEED970(a1, a2);
  }
  return a1;
}

void sub_25BEEDAC8(void *a1)
{
  sub_25BEE7DBC(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

uint64_t sub_25BEEDAE8()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_25BEED970(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25BEEDB30(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25BEEDF8C;
  return sub_25BEE69C4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25BEEDBF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_25BEEDC5C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25BEEDC6C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25BEEDCC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BEEDD1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25BEEDD78()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BEEDDB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25BEE5C8C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5826F8 + dword_26A5826F8);
  return v6(a1, v4);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25BEEDE74(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25BEEDE94(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_25BEEDED0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25BEEDF54()
{
  return sub_25BEEC568();
}

uint64_t sub_25BEEDF6C()
{
  return sub_25BEEB1B8();
}

uint64_t sub_25BEEDF90(void (*a1)(uint64_t), uint64_t a2)
{
  v73 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582658);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v69 = (uint64_t)&v59 - v7;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582660);
  uint64_t v8 = MEMORY[0x270FA5388](v64);
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))((char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  v74 = (uint64_t *)((char *)&v59 - v10);
  uint64_t v75 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x270FA5388](v75);
  v71 = (uint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582668);
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v60 = (char *)&v59 - v16;
  uint64_t v17 = sub_25BF05328();
  uint64_t v76 = *(void *)(v17 - 8);
  uint64_t v77 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  id v67 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v59 - v20;
  id v22 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_25BEED774(0, (unint64_t *)&qword_26A582670);
  unint64_t v23 = sub_25BF05598();

  uint64_t v72 = a2;
  uint64_t v70 = v3;
  uint64_t v59 = v6;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25BF059C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  v68 = v15;
  if (v24)
  {
    v78[0] = MEMORY[0x263F8EE78];
    sub_25BEEC548(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    uint64_t v65 = (void (*)(void, char *, uint64_t))v12;
    uint64_t v26 = 0;
    uint64_t v25 = v78[0];
    unint64_t v27 = v23 & 0xC000000000000001;
    unint64_t v28 = v23;
    do
    {
      if (v27) {
        id v29 = (id)MEMORY[0x261177BE0](v26, v23);
      }
      else {
        id v29 = *(id *)(v23 + 8 * v26 + 32);
      }
      uint64_t v30 = v29;
      id v31 = objc_msgSend(v29, sel_url, v59);
      sub_25BF05318();

      v78[0] = v25;
      unint64_t v33 = *(void *)(v25 + 16);
      unint64_t v32 = *(void *)(v25 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_25BEEC548(v32 > 1, v33 + 1, 1);
        uint64_t v25 = v78[0];
      }
      ++v26;
      *(void *)(v25 + 16) = v33 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v25+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(void *)(v76 + 72) * v33, v21, v77);
      unint64_t v23 = v28;
    }
    while (v24 != v26);
    uint64_t v12 = (uint64_t)v65;
  }
  if (v24 >= *(void *)(v25 + 16)) {
    uint64_t v34 = *(void *)(v25 + 16);
  }
  else {
    uint64_t v34 = v24;
  }
  if (v34)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
    uint64_t v35 = sub_25BF059F8();
  }
  else
  {
    uint64_t v35 = MEMORY[0x263F8EE80];
  }
  uint64_t v36 = (uint64_t)v74;
  v78[0] = v35;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25BEEB82C(v25, v23, 1, v78);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v78[0];
  v78[0] = v25;
  uint64_t v38 = v66;
  v78[4] = *(void *)(v66 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582680);
  sub_25BEED068((unint64_t *)&unk_26A582688, &qword_26A582680);
  sub_25BEF2B2C(&qword_26A5824A0, MEMORY[0x263F06EA8]);
  uint64_t v39 = v60;
  sub_25BF054F8();
  *(void *)(v38 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v38 + 128) = v37;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v38 + 112))
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = (uint64_t)v63;
    uint64_t v65 = *(void (**)(void, char *, uint64_t))(v61 + 16);
    uint64_t v66 = v61 + 16;
    v65(v63, v39, v12);
    uint64_t v41 = sub_25BEED068(&qword_26A582698, &qword_26A582668);
    sub_25BF056B8();
    uint64_t v42 = v64;
    *(void *)(v40 + *(int *)(v64 + 36)) = v78[0];
    sub_25BEF2BDC(v40, v36, &qword_26A582660);
    v74 = (uint64_t *)(v36 + *(int *)(v42 + 36));
    uint64_t v75 = v41;
    uint64_t v43 = *v74;
    sub_25BF056C8();
    uint64_t v44 = (uint64_t)v59;
    if (v43 != v78[0])
    {
      uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))(v76 + 32);
      uint64_t v64 = v61 + 8;
      v62 = (void (**)(uint64_t, char *, uint64_t))(v76 + 16);
      v76 += 8;
      uint64_t v45 = (uint64_t)v71;
      do
      {
        int v46 = (void (*)(void *, void))sub_25BF056E8();
        uint64_t v47 = v36;
        uint64_t v48 = v69;
        sub_25BEF2B74(v49, v69);
        v46(v78, 0);
        unint64_t v50 = v68;
        v65(v68, (char *)v47, v12);
        sub_25BF056D8();
        (*(void (**)(char *, uint64_t))v64)(v50, v12);
        uint64_t v51 = v48;
        uint64_t v36 = v47;
        uint64_t v52 = v77;
        uint64_t v53 = v73;
        sub_25BEF2BDC(v51, v44, &qword_26A582658);
        swift_getEnumCaseMultiPayload();
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826A0);
        v55 = v67;
        (*v63)(v67, v44 + *(int *)(v54 + 48), v52);
        (*v62)(v45, v55, v52);
        swift_storeEnumTagMultiPayload();
        v53(v45);
        sub_25BEF23CC(v45);
        (*(void (**)(char *, uint64_t))v76)(v55, v52);
        uint64_t v56 = *v74;
        sub_25BF056C8();
      }
      while (v56 != v78[0]);
    }
    sub_25BEEDD1C(v36, &qword_26A582660);
    return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v60, v12);
  }
  else
  {
    uint64_t v58 = (uint64_t)v71;
    uint64_t *v71 = v25;
    swift_storeEnumTagMultiPayload();
    v73(v58);
    sub_25BEF23CC(v58);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v39, v12);
    *(unsigned char *)(v38 + 112) = 1;
  }
  return result;
}

void sub_25BEEE8B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = *(void *)(v1 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25BEEA628(a1, v2);
    char v6 = v5;
    swift_bridgeObjectRelease();
    if (*(void *)(v4 + 16) && (unint64_t v7 = sub_25BEEB2C8(a1), (v8 & 1) != 0))
    {
      id v9 = *(id *)(*(void *)(v4 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0 && (objc_msgSend(v9, sel_isTemporaryPath) & 1) == 0) {
        objc_msgSend(v9, sel_invalidate);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_25BEEE9C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

void sub_25BEEEA04(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a1;
  uint64_t v57 = a2;
  uint64_t v3 = sub_25BF054A8();
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  MEMORY[0x270FA5388](v3);
  v60 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BF054C8();
  uint64_t v58 = *(void *)(v5 - 8);
  uint64_t v59 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25BF05768();
  v55 = *(uint64_t (***)(uint64_t))(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582600);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25BF05328();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v53 - v19;
  uint64_t v63 = v2;
  if (*(void *)(v2 + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    if ((sub_25BF05788() & 1) == 0)
    {
      if (qword_26A5822A0 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_25BF05468();
      __swift_project_value_buffer(v41, (uint64_t)qword_26A582CE0);
      uint64_t v64 = sub_25BF05448();
      os_log_type_t v42 = sub_25BF056F8();
      if (os_log_type_enabled(v64, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_25BEE3000, v64, v42, "Already observing directory changes when beginObservingChanges called, bailing.", v43, 2u);
        MEMORY[0x261178490](v43, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        uint64_t v48 = v64;
      }
      return;
    }
    swift_unknownObjectRelease();
  }
  id v21 = objc_allocWithZone(MEMORY[0x263F52710]);
  id v22 = (void *)sub_25BF05518();
  unint64_t v23 = objc_msgSend(v21, sel_initWithTypeIdentifier_, v22);

  uint64_t v64 = v23;
  id v24 = [v23 finalizedSessionsContainerURLForCurrentApplication];
  if (v24)
  {
    uint64_t v25 = v24;
    sub_25BF05318();

    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v26(v13, v18, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
    {
      unint64_t v27 = v20;
      v26(v20, v13, v14);
      sub_25BF05308();
      int v28 = aBlock;
      if (aBlock == -1)
      {
        if (qword_26A5822A0 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_25BF05468();
        __swift_project_value_buffer(v49, (uint64_t)qword_26A582CE0);
        unint64_t v50 = sub_25BF05448();
        os_log_type_t v51 = sub_25BF05718();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl(&dword_25BEE3000, v50, v51, "Unable to acquire fd for session container URL", v52, 2u);
          MEMORY[0x261178490](v52, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v15 + 8))(v27, v14);
      }
      else
      {
        uint64_t v53 = sub_25BEED774(0, &qword_26A582608);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A582610);
        id v29 = v55;
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_25BF06C10;
        sub_25BF05758();
        uint64_t aBlock = v30;
        sub_25BEF2B2C(&qword_26A582618, MEMORY[0x263F8F168]);
        uint64_t v54 = v27;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A582620);
        sub_25BEED068(&qword_26A582628, &qword_26A582620);
        sub_25BF05868();
        uint64_t v31 = sub_25BF05778();
        ((void (*)(char *, uint64_t))v29[1])(v10, v8);
        uint64_t v32 = *(void *)(v63 + 136);
        swift_getObjectType();
        unint64_t v33 = (void *)swift_allocObject();
        v33[2] = v31;
        v33[3] = v32;
        uint64_t v34 = v56;
        LODWORD(v56) = v28;
        uint64_t v35 = v57;
        v33[4] = v34;
        v33[5] = v35;
        uint64_t v69 = sub_25BEF2820;
        uint64_t v70 = v33;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v66 = 1107296256;
        v55 = &v67;
        id v67 = sub_25BEEF9E8;
        v68 = &block_descriptor_0;
        uint64_t v36 = _Block_copy(&aBlock);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        sub_25BF054B8();
        uint64_t v37 = v60;
        sub_25BEEFB1C();
        sub_25BF05798();
        _Block_release(v36);
        uint64_t v61 = *(void *)(v61 + 8);
        ((void (*)(char *, uint64_t))v61)(v37, v62);
        uint64_t v38 = v59;
        uint64_t v58 = *(void *)(v58 + 8);
        ((void (*)(char *, uint64_t))v58)(v7, v59);
        swift_release();
        uint64_t v39 = swift_allocObject();
        *(_DWORD *)(v39 + 16) = v56;
        uint64_t v69 = sub_25BEF2854;
        uint64_t v70 = (void *)v39;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v66 = 1107296256;
        id v67 = sub_25BEEF9E8;
        v68 = &block_descriptor_52;
        uint64_t v40 = _Block_copy(&aBlock);
        sub_25BF054B8();
        sub_25BEEFB1C();
        sub_25BF057A8();
        _Block_release(v40);
        ((void (*)(char *, uint64_t))v61)(v37, v62);
        ((void (*)(char *, uint64_t))v58)(v7, v38);
        swift_release();
        sub_25BF057C8();

        (*(void (**)(char *, uint64_t))(v15 + 8))(v54, v14);
        *(void *)(v63 + 112) = v31;
        swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  sub_25BEEDD1C((uint64_t)v13, &qword_26A582600);
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_25BF05468();
  __swift_project_value_buffer(v44, (uint64_t)qword_26A582CE0);
  uint64_t v45 = sub_25BF05448();
  os_log_type_t v46 = sub_25BF05718();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_25BEE3000, v45, v46, "beginObservingChanges: Unable to build sessions container URL for current application.", v47, 2u);
    MEMORY[0x261178490](v47, -1, -1);
  }
}

uint64_t sub_25BEEF47C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  if (a1)
  {
    uint64_t result = sub_25BF05478();
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25BF05468();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A582CE0);
    uint64_t v5 = sub_25BF05448();
    os_log_type_t v6 = sub_25BF05718();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_25BEE3000, v5, v6, "unable to get fs path for sessionContainerURL", v7, 2u);
      MEMORY[0x261178490](v7, -1, -1);
    }

    uint64_t result = 0xFFFFFFFFLL;
  }
  *a2 = result;
  return result;
}

uint64_t sub_25BEEF580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25BF05768();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  swift_getObjectType();
  sub_25BF057E8();
  sub_25BF05758();
  sub_25BEF2B2C(&qword_26A582618, MEMORY[0x263F8F168]);
  char v17 = sub_25BF05858();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  if (v17)
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25BF05468();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A582CE0);
    uint64_t v20 = sub_25BF05448();
    os_log_type_t v21 = sub_25BF05728();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = v18;
      uint64_t v23 = a2;
      uint64_t v24 = a4;
      uint64_t v25 = a3;
      uint64_t v26 = v22;
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_25BEE3000, v20, v21, "Write event received, refreshing session URLs", v22, 2u);
      unint64_t v27 = v26;
      a3 = v25;
      a4 = v24;
      a2 = v23;
      uint64_t v18 = v36;
      MEMORY[0x261178490](v27, -1, -1);
    }

    uint64_t v28 = sub_25BF05638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 1, 1, v28);
    id v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = a2;
    v29[5] = a3;
    v29[6] = a4;
    swift_retain();
    swift_retain();
    sub_25BEE5D80((uint64_t)v9, (uint64_t)&unk_26A582650, (uint64_t)v29);
    swift_release();
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_25BF05468();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A582CE0);
    uint64_t v31 = sub_25BF05448();
    os_log_type_t v32 = sub_25BF05708();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_25BEE3000, v31, v32, "Event received, was not a write (or self == nil), bailing", v33, 2u);
      MEMORY[0x261178490](v33, -1, -1);
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v10);
}

uint64_t sub_25BEEF960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_25BEEF984, a4, 0);
}

uint64_t sub_25BEEF984()
{
  sub_25BEEDF90(*(void (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEEF9E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25BEEFA2C(int a1)
{
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BF05468();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A582CE0);
  uint64_t v3 = sub_25BF05448();
  os_log_type_t v4 = sub_25BF05728();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25BEE3000, v3, v4, "DispatchSource cancelled, closing file handle", v5, 2u);
    MEMORY[0x261178490](v5, -1, -1);
  }

  return close(a1);
}

uint64_t sub_25BEEFB1C()
{
  return sub_25BF05868();
}

uint64_t sub_25BEEFBF8()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_25BEEFC48()
{
  type metadata accessor for SecureCaptureManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_25BEEFD60();
  qword_26A5825A0 = v0;
  return result;
}

uint64_t static SecureCaptureManager.shared.getter()
{
  if (qword_26A582298 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t SecureCaptureManager.sessionContentURLs.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 32);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_25BEEFD40(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_25BEEFD40@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEEFD60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v44 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_25BF05328();
  uint64_t v2 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  os_log_type_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826B0);
  uint64_t v9 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826B8);
  uint64_t v12 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SecureCaptureManager.URLUpdate();
  uint64_t v15 = v46;
  *(void *)(v46 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F580], v5);
  sub_25BF05648();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v48);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v45);
  id v16 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_25BEED774(0, (unint64_t *)&qword_26A582670);
  unint64_t v17 = sub_25BF05598();

  uint64_t v48 = v17;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = v48;
    uint64_t v18 = sub_25BF059C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (v18)
  {
    uint64_t v49 = MEMORY[0x263F8EE78];
    sub_25BEEC548(0, v18 & ~(v18 >> 63), 0);
    if (v18 < 0)
    {
      __break(1u);
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    uint64_t v20 = 0;
    uint64_t v19 = v49;
    unint64_t v21 = v17 & 0xC000000000000001;
    do
    {
      if (v21) {
        id v22 = (id)MEMORY[0x261177BE0](v20, v17);
      }
      else {
        id v22 = *(id *)(v17 + 8 * v20 + 32);
      }
      uint64_t v23 = v22;
      id v24 = objc_msgSend(v22, sel_url);
      sub_25BF05318();

      uint64_t v49 = v19;
      unint64_t v26 = *(void *)(v19 + 16);
      unint64_t v25 = *(void *)(v19 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_25BEEC548(v25 > 1, v26 + 1, 1);
        uint64_t v19 = v49;
      }
      ++v20;
      *(void *)(v19 + 16) = v26 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v19+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v26, v4, v47);
      unint64_t v17 = v48;
    }
    while (v18 != v20);
  }
  if (v18 >= *(void *)(v19 + 16)) {
    uint64_t v27 = *(void *)(v19 + 16);
  }
  else {
    uint64_t v27 = v18;
  }
  uint64_t v28 = MEMORY[0x263F8EE80];
  if (v27)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
    uint64_t v29 = sub_25BF059F8();
  }
  else
  {
    uint64_t v29 = MEMORY[0x263F8EE80];
  }
  uint64_t v49 = v29;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25BEEB82C(v19, v17, 1, &v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = v49;
  type metadata accessor for CaptureManagerURLs();
  uint64_t v31 = swift_allocObject();
  swift_bridgeObjectRetain();
  swift_defaultActor_initialize();
  *(unsigned char *)(v31 + 112) = 1;
  *(void *)(v31 + 120) = v19;
  *(void *)(v31 + 128) = v28;
  swift_bridgeObjectRelease();
  *(void *)(v31 + 128) = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = v46;
  *(void *)(v46 + 40) = v31;
  type metadata accessor for CaptureManagerFSObserving();
  unint64_t v33 = (void *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v33[14] = 0;
  v33[15] = 0;
  v33[16] = 0;
  v33[17] = v31;
  *(void *)(v32 + 48) = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826C0);
  uint64_t v34 = swift_allocObject();
  *(_DWORD *)(v34 + 24) = 0;
  *(void *)(v34 + 16) = v19;
  *(void *)(v32 + 32) = v34;
  uint64_t v35 = sub_25BF05638();
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
  uint64_t v37 = (uint64_t)v44;
  v36(v44, 1, 1, v35);
  uint64_t v38 = (void *)swift_allocObject();
  v38[2] = 0;
  v38[3] = 0;
  v38[4] = v32;
  swift_retain();
  sub_25BEE5D80(v37, (uint64_t)&unk_26A5826D0, (uint64_t)v38);
  swift_release();
  v36((char *)v37, 1, 1, v35);
  sub_25BF05618();
  swift_retain();
  uint64_t v39 = sub_25BF05608();
  uint64_t v40 = (void *)swift_allocObject();
  uint64_t v41 = MEMORY[0x263F8F500];
  v40[2] = v39;
  v40[3] = v41;
  v40[4] = v32;
  sub_25BEE5D80(v37, (uint64_t)&unk_26A5826E0, (uint64_t)v40);
  swift_release();
  sub_25BEF0484();
  return v32;
}

uint64_t sub_25BEF0484()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v2 - 8);
  os_log_type_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BF05638();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_25BEEDD1C((uint64_t)v4, &qword_26A5822B8);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_25BF05628();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_25BF055D8();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_26A5826F0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t SecureCaptureManager.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v2 - 8);
  os_log_type_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BF05638();
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  swift_retain();
  sub_25BEE5D80((uint64_t)v4, (uint64_t)&unk_26A5825B8, (uint64_t)v7);
  swift_release();
  v6(v4, 1, 1, v5);
  sub_25BF05618();
  swift_retain();
  uint64_t v8 = sub_25BF05608();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v1;
  sub_25BEE5D80((uint64_t)v4, (uint64_t)&unk_26A5825C8, (uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SecureCaptureManager.__deallocating_deinit()
{
  SecureCaptureManager.deinit();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_25BEF08B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25BEF08D4, 0, 0);
}

uint64_t sub_25BEF08D4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 40);
  *(void *)(v0 + 24) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25BEF0948, v1, 0);
}

uint64_t sub_25BEF0948()
{
  sub_25BEF329C(v0[3], v0[2]);
  swift_release();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25BEF09B4(uint64_t a1)
{
  uint64_t v2 = sub_25BF05328();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v26[-v7];
  uint64_t v9 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)&v26[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25BEF3BC0(a1, (uint64_t)v11);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v13 = (*(uint64_t (**)(unsigned char *, uint64_t *, uint64_t))(v3 + 32))(v8, v11, v2);
      MEMORY[0x270FA5388](v13);
      *(void *)&v26[-16] = v8;
      p_os_unfair_lock_opaque = (unint64_t *)&v14[4]._os_unfair_lock_opaque;
      id v16 = v14 + 6;
      os_unfair_lock_lock(v14 + 6);
      sub_25BEF3C40(p_os_unfair_lock_opaque);
      os_unfair_lock_unlock(v16);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
    }
    else
    {
      uint64_t v22 = (*(uint64_t (**)(unsigned char *, uint64_t *, uint64_t))(v3 + 32))(v6, v11, v2);
      MEMORY[0x270FA5388](v22);
      *(void *)&v26[-16] = v6;
      uint64_t v24 = (uint64_t)&v23[4];
      unint64_t v25 = v23 + 6;
      os_unfair_lock_lock(v23 + 6);
      sub_25BEF3C24(v24);
      os_unfair_lock_unlock(v25);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  else
  {
    uint64_t v18 = *v11;
    MEMORY[0x270FA5388](EnumCaseMultiPayload);
    *(void *)&v26[-16] = v18;
    uint64_t v20 = v19 + 4;
    unint64_t v21 = v19 + 6;
    os_unfair_lock_lock(v19 + 6);
    sub_25BEF3C5C(v20);
    os_unfair_lock_unlock(v21);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25BEF0C68(unint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_25BF05328();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  unint64_t v8 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v8 = sub_25BEF6BC0(0, *(void *)(v8 + 16) + 1, 1, v8);
  }
  unint64_t v10 = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v10 >= v9 >> 1) {
    unint64_t v8 = sub_25BEF6BC0(v9 > 1, v10 + 1, 1, v8);
  }
  *(void *)(v8 + 16) = v10 + 1;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v10, v7, v4);
  *a1 = v8;
  return result;
}

uint64_t sub_25BEF0DE0(uint64_t a1, uint64_t a2)
{
  v5[2] = a2;
  uint64_t result = sub_25BEF2E9C((uint64_t (*)(unint64_t))sub_25BEF3CA4, (uint64_t)v5);
  int64_t v4 = *(void *)(*(void *)a1 + 16);
  if (v4 >= result) {
    return sub_25BEF3CD4(result, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_25BEF0E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25BEF0E68, 0, 0);
}

uint64_t sub_25BEF0E68()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 48);
  *(void *)(v0 + 24) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25BEF0EDC, v1, 0);
}

uint64_t sub_25BEF0EDC()
{
  sub_25BEEEA04((uint64_t)sub_25BEF40FC, *(void *)(v0 + 16));
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEF0F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_25BF05618();
  *(void *)(v4 + 72) = sub_25BF05608();
  uint64_t v6 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEF0FF4, v6, v5);
}

uint64_t sub_25BEF0FF4()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_defaultCenter);
  uint64_t v4 = *MEMORY[0x263F83330];
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_25BEF3EF4;
  v0[7] = v5;
  uint64_t v6 = MEMORY[0x263EF8330];
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25BEF13C0;
  v0[5] = &block_descriptor_79;
  uint64_t v7 = _Block_copy(v0 + 2);
  swift_release();
  id v8 = objc_msgSend(v3, sel_addObserverForName_object_queue_usingBlock_, v4, 0, 0, v7);
  _Block_release(v7);

  uint64_t v9 = *(void *)(v1 + 16);
  if (v9)
  {
    swift_unknownObjectRetain();
    id v10 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v10, sel_removeObserver_, v9);

    swift_unknownObjectRelease();
  }
  uint64_t v11 = v0[8];
  *(void *)(v1 + 16) = v8;
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v2, sel_defaultCenter);
  uint64_t v13 = *MEMORY[0x263F833B8];
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_25BEF3F2C;
  v0[7] = v14;
  v0[2] = v6;
  v0[3] = 1107296256;
  v0[4] = sub_25BEF13C0;
  v0[5] = &block_descriptor_83;
  uint64_t v15 = _Block_copy(v0 + 2);
  swift_release();
  id v16 = objc_msgSend(v12, sel_addObserverForName_object_queue_usingBlock_, v13, 0, 0, v15);
  _Block_release(v15);

  uint64_t v17 = *(void *)(v11 + 24);
  if (v17)
  {
    swift_unknownObjectRetain();
    id v18 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v18, sel_removeObserver_, v17);

    swift_unknownObjectRelease();
  }
  *(void *)(v11 + 24) = v16;
  swift_unknownObjectRelease();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_25BEF12F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25BEF1314, 0, 0);
}

uint64_t sub_25BEF1314()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 48);
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BEF1338, v1, 0);
}

uint64_t sub_25BEF1338()
{
  if (*(void *)(*(void *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BF057D8();
    swift_unknownObjectRelease();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEF13C0(uint64_t a1)
{
  uint64_t v2 = sub_25BF05278();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_25BF05268();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25BEF14B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = sub_25BF05638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    sub_25BEE5D80((uint64_t)v7, a4, (uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_25BEF15C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25BEF15E8, 0, 0);
}

uint64_t sub_25BEF15E8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 48);
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BEF160C, v1, 0);
}

uint64_t sub_25BEF160C()
{
  if (*(void *)(*(void *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BF057C8();
    swift_unknownObjectRelease();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEF1694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_25BEF16B4, 0, 0);
}

uint64_t sub_25BEF16B4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 48);
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25BEF16D8, v1, 0);
}

uint64_t sub_25BEF16D8()
{
  if (*(void *)(*(void *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25BF057B8();
    swift_unknownObjectRelease();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEF1764()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BEEDF8C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_25BEF16B4, 0, 0);
}

uint64_t sub_25BEF180C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_25BF05618();
  *(void *)(v4 + 24) = sub_25BF05608();
  uint64_t v6 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEF18A4, v6, v5);
}

uint64_t sub_25BEF18A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = self;
    swift_unknownObjectRetain();
    id v4 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v4, sel_removeObserver_, v2);

    swift_unknownObjectRelease();
  }
  uint64_t v5 = *(void *)(v0 + 16);
  *(void *)(v1 + 16) = 0;
  swift_unknownObjectRelease();
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6)
  {
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    id v8 = objc_msgSend(v7, sel_defaultCenter);
    objc_msgSend(v8, sel_removeObserver_, v6);

    swift_unknownObjectRelease();
  }
  *(void *)(v5 + 24) = 0;
  swift_unknownObjectRelease();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_25BEF19F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25BEEDF8C;
  return sub_25BEF180C(a1, v4, v5, v6);
}

uint64_t SecureCaptureManager.invalidate(url:)(uint64_t a1)
{
  uint64_t v3 = sub_25BF05328();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25BF05638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v1;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v11[v10], (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  sub_25BEE5D80((uint64_t)v8, (uint64_t)&unk_26A5825D8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_25BEF1C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_25BEF1C94, 0, 0);
}

uint64_t sub_25BEF1C94()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 40);
  *(void *)(v0 + 32) = v1;
  return MEMORY[0x270FA2498](sub_25BEF1CB8, v1, 0);
}

uint64_t sub_25BEF1CB8()
{
  sub_25BEEE8B8(*(void *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BEF1D18()
{
  uint64_t v1 = sub_25BF05328();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25BEF1DEC()
{
  uint64_t v2 = *(void *)(sub_25BF05328() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_25BEEDF8C;
  return MEMORY[0x270FA2498](sub_25BEF1C94, 0, 0);
}

Swift::Void __swiftcall SecureCaptureManager.applicationDidCompleteTransition()()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v0, sel_applicationDidCompleteTransition);
}

uint64_t type metadata accessor for CaptureManagerURLs()
{
  return self;
}

uint64_t type metadata accessor for CaptureManagerFSObserving()
{
  return self;
}

uint64_t type metadata accessor for SecureCaptureManager()
{
  return self;
}

uint64_t method lookup function for SecureCaptureManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SecureCaptureManager);
}

uint64_t *initializeBufferWithCopyOfBuffer for SecureCaptureManager.URLUpdate(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_25BF05328();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SecureCaptureManager.URLUpdate(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v3 = sub_25BF05328();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for SecureCaptureManager.URLUpdate(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_25BF05328();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for SecureCaptureManager.URLUpdate(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25BEF23CC((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_25BF05328();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25BEF23CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SecureCaptureManager.URLUpdate();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SecureCaptureManager.URLUpdate()
{
  uint64_t result = qword_26A5825E8;
  if (!qword_26A5825E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *initializeWithTake for SecureCaptureManager.URLUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_25BF05328();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SecureCaptureManager.URLUpdate(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25BEF23CC((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_25BF05328();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SecureCaptureManager.URLUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SecureCaptureManager.URLUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25BEF26F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25BEF2708()
{
  uint64_t result = sub_25BF05328();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25BEF27D8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BEF2820()
{
  return sub_25BEEF580(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25BEF2844()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_25BEF2854()
{
  return sub_25BEEFA2C(*(_DWORD *)(v0 + 16));
}

uint64_t sub_25BEF285C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25BEF28A4()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_25BEE5C8C;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_25BEEF984, v4, 0);
}

uint64_t sub_25BEF2958(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *long long v4 = v2;
  v4[1] = sub_25BEF2A34;
  return v6(a1);
}

uint64_t sub_25BEF2A34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25BEF2B2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BEF2B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582658);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BEF2BDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25BEF2C44()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BEEDF8C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_25BEF0E68, 0, 0);
}

uint64_t sub_25BEF2CF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25BEEDF8C;
  return sub_25BEF0F5C(a1, v4, v5, v6);
}

uint64_t sub_25BEF2DA8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BEEDF8C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_25BEF08D4, 0, 0);
}

uint64_t sub_25BEF2E50()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BEF2E88(unint64_t a1)
{
  return sub_25BEF6BC0(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25BEF2E9C(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25BF05328();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  os_log_type_t v42 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v33 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t v44 = v4;
  unint64_t v15 = *v4;
  uint64_t v16 = *(void *)(*v4 + 16);
  if (!v16) {
    return 0;
  }
  unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v35 = v12;
  uint64_t v45 = *(void *)(v12 + 72);
  swift_bridgeObjectRetain();
  unint64_t v18 = 0;
  unint64_t v36 = v17;
  while (1)
  {
    char v19 = a1(v15 + v17);
    if (v3)
    {
      swift_bridgeObjectRelease();
      return v18;
    }
    if (v19) {
      break;
    }
    ++v18;
    v17 += v45;
    if (v16 == v18)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v15 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v18, 1))
  {
    unint64_t v21 = *(void *)(v15 + 16);
    if (v18 + 1 == v21) {
      return v18;
    }
    uint64_t v22 = v45 + v17;
    unint64_t v23 = v18 + 1;
    uint64_t v24 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    uint64_t v39 = a1;
    uint64_t v40 = (uint64_t (**)(char *, uint64_t))(v35 + 8);
    unint64_t v33 = (uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 40);
    uint64_t v37 = v14;
    uint64_t v38 = a2;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    while (v23 < v21)
    {
      uint64_t v25 = v15 + v22;
      unint64_t v26 = (uint64_t (*)(char *))a1;
      uint64_t v27 = *v24;
      (*v24)(v14, v25, v7);
      LOBYTE(v26) = v26(v14);
      uint64_t result = (*v40)(v14, v7);
      if (v26)
      {
        a1 = v39;
        uint64_t v24 = v43;
      }
      else
      {
        uint64_t v24 = v43;
        if (v23 != v18)
        {
          if ((v18 & 0x8000000000000000) != 0) {
            goto LABEL_32;
          }
          unint64_t v28 = *v44;
          if (v18 >= *(void *)(*v44 + 16)) {
            goto LABEL_33;
          }
          unint64_t v35 = *(void *)(*v44 + 16);
          uint64_t v34 = v18 * v45;
          uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v27)(v41, v28 + v36 + v18 * v45, v7);
          if (v23 >= v35) {
            goto LABEL_34;
          }
          v27(v42, v28 + v22, v7);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v44 = v28;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_25BEF2E88(v28);
            unint64_t v28 = result;
            *uint64_t v44 = result;
          }
          if (v18 >= *(void *)(v28 + 16)) {
            goto LABEL_35;
          }
          unint64_t v29 = v28 + v36 + v34;
          uint64_t v30 = *v33;
          uint64_t result = (*v33)(v29, v42, v7);
          if (v23 >= *(void *)(*v44 + 16)) {
            goto LABEL_36;
          }
          uint64_t result = v30(*v44 + v22, v41, v7);
          uint64_t v24 = v43;
        }
        BOOL v31 = __OFADD__(v18++, 1);
        a1 = v39;
        if (v31) {
          goto LABEL_31;
        }
      }
      unint64_t v32 = v23 + 1;
      uint64_t v14 = v37;
      if (__OFADD__(v23, 1)) {
        goto LABEL_30;
      }
      unint64_t v15 = *v44;
      unint64_t v21 = *(void *)(*v44 + 16);
      ++v23;
      v22 += v45;
      if (v32 == v21) {
        return v18;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25BEF329C(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = a2;
  uint64_t v73 = a1;
  uint64_t v2 = sub_25BF05328();
  uint64_t v78 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v64 = (char *)&v59 - v6;
  uint64_t v7 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582658);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v62 = (char *)&v59 - v14;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582660);
  uint64_t v15 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))((char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v61 = (uint64_t)&v59 - v17;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582668);
  uint64_t v67 = *(void *)(v65 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v65);
  v60 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  unint64_t v21 = (char *)&v59 - v20;
  id v22 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_25BEED774(0, (unint64_t *)&qword_26A582670);
  unint64_t v23 = sub_25BF05598();

  uint64_t v79 = v23;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25BF059C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v76 = v9;
  uint64_t v77 = v7;
  uint64_t v74 = v10;
  uint64_t v63 = v13;
  uint64_t v66 = v21;
  if (v24)
  {
    v80[0] = MEMORY[0x263F8EE78];
    sub_25BEEC548(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      swift_release();
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    uint64_t v26 = 0;
    uint64_t v25 = v80[0];
    unint64_t v27 = v79 & 0xC000000000000001;
    uint64_t v28 = v2;
    do
    {
      if (v27) {
        id v29 = (id)MEMORY[0x261177BE0](v26, v79);
      }
      else {
        id v29 = *(id *)(v79 + 8 * v26 + 32);
      }
      uint64_t v30 = v29;
      id v31 = objc_msgSend(v29, sel_url);
      sub_25BF05318();

      v80[0] = v25;
      unint64_t v33 = *(void *)(v25 + 16);
      unint64_t v32 = *(void *)(v25 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_25BEEC548(v32 > 1, v33 + 1, 1);
        uint64_t v25 = v80[0];
      }
      ++v26;
      *(void *)(v25 + 16) = v33 + 1;
      uint64_t v2 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v78 + 32))(v25+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ *(void *)(v78 + 72) * v33, v5, v28);
    }
    while (v24 != v26);
    uint64_t v9 = v76;
    unint64_t v21 = v66;
  }
  if (v24 >= *(void *)(v25 + 16)) {
    uint64_t v34 = *(void *)(v25 + 16);
  }
  else {
    uint64_t v34 = v24;
  }
  if (v34)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582340);
    uint64_t v35 = sub_25BF059F8();
  }
  else
  {
    uint64_t v35 = MEMORY[0x263F8EE80];
  }
  uint64_t v36 = v79;
  v80[0] = v35;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_25BEEB82C(v25, v36, 1, v80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v80[0];
  v80[0] = v25;
  uint64_t v38 = v73;
  v80[4] = *(void *)(v73 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582680);
  sub_25BEED068((unint64_t *)&unk_26A582688, &qword_26A582680);
  sub_25BEF2B2C(&qword_26A5824A0, MEMORY[0x263F06EA8]);
  sub_25BF054F8();
  *(void *)(v38 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v38 + 128) = v37;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v38 + 112))
  {
    swift_bridgeObjectRelease();
    uint64_t v73 = v2;
    uint64_t v39 = v64;
    uint64_t v40 = (uint64_t)v69;
    uint64_t v41 = v65;
    v71 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
    uint64_t v72 = v67 + 16;
    v71((char *)v69, v21, v65);
    uint64_t v42 = sub_25BEED068(&qword_26A582698, &qword_26A582668);
    sub_25BF056B8();
    uint64_t v43 = v70;
    *(void *)(v40 + *(int *)(v70 + 36)) = v80[0];
    uint64_t v44 = v61;
    sub_25BEF2BDC(v40, v61, &qword_26A582660);
    uint64_t v45 = (uint64_t *)(v44 + *(int *)(v43 + 36));
    uint64_t v46 = *v45;
    sub_25BF056C8();
    uint64_t v47 = (uint64_t)v63;
    uint64_t v48 = (uint64_t)v62;
    uint64_t v49 = v60;
    if (v46 != v80[0])
    {
      uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))(v78 + 32);
      uint64_t v70 = v67 + 8;
      v68 = (void (**)(uint64_t *, char *, uint64_t))(v78 + 16);
      v78 += 8;
      uint64_t v79 = v42;
      do
      {
        unint64_t v50 = (void (*)(void *, void))sub_25BF056E8();
        sub_25BEF2B74(v51, v48);
        v50(v80, 0);
        v71(v49, (char *)v44, v41);
        sub_25BF056D8();
        (*(void (**)(char *, uint64_t))v70)(v49, v41);
        sub_25BEF2BDC(v48, v47, &qword_26A582658);
        swift_getEnumCaseMultiPayload();
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5826A0);
        uint64_t v53 = v73;
        (*v69)(v39, v47 + *(int *)(v52 + 48), v73);
        uint64_t v54 = v48;
        uint64_t v55 = (uint64_t)v76;
        (*v68)(v76, v39, v53);
        swift_storeEnumTagMultiPayload();
        sub_25BEF09B4(v55);
        uint64_t v56 = v55;
        uint64_t v48 = v54;
        sub_25BEF23CC(v56);
        (*(void (**)(char *, uint64_t))v78)(v39, v53);
        uint64_t v57 = *v45;
        sub_25BF056C8();
      }
      while (v57 != v80[0]);
    }
    sub_25BEEDD1C(v44, &qword_26A582660);
    return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v66, v41);
  }
  else
  {
    *uint64_t v9 = v25;
    swift_storeEnumTagMultiPayload();
    sub_25BEF09B4((uint64_t)v9);
    sub_25BEF23CC((uint64_t)v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v21, v65);
    *(unsigned char *)(v38 + 112) = 1;
  }
  return result;
}

uint64_t sub_25BEF3BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SecureCaptureManager.URLUpdate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BEF3C24(uint64_t a1)
{
  return sub_25BEF0DE0(a1, *(void *)(v1 + 16));
}

uint64_t sub_25BEF3C40(unint64_t *a1)
{
  return sub_25BEF0C68(a1, *(void *)(v1 + 16));
}

uint64_t sub_25BEF3C5C(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease();
  *a1 = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BEF3CA4(uint64_t a1)
{
  return MEMORY[0x261177570](a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_25BEF3CD4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_25BEF6BC0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(sub_25BF05328() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_25BF05A08();
  __break(1u);
  return result;
}

uint64_t sub_25BEF3EBC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BEF3EF4(uint64_t a1)
{
  return sub_25BEF14B4(a1, v1, (uint64_t)&unk_270967C10, (uint64_t)&unk_26A582720);
}

uint64_t sub_25BEF3F2C(uint64_t a1)
{
  return sub_25BEF14B4(a1, v1, (uint64_t)&unk_270967BE8, (uint64_t)&unk_26A582710);
}

uint64_t sub_25BEF3F68()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BEEDF8C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_25BEF15E8, 0, 0);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25BEF4054()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BEEDF8C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_25BEF1314, 0, 0);
}

uint64_t sub_25BEF4118()
{
  uint64_t v0 = sub_25BF05468();
  __swift_allocate_value_buffer(v0, qword_26A582CE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A582CE0);
  return sub_25BF05458();
}

uint64_t sub_25BEF418C(char a1)
{
  if (a1) {
    return 0x52737365636F7270;
  }
  else {
    return 0x6E6F6D6D6F63;
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_25BEF4230(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(userActivity:responder:)(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserActivity_responder_, a1, a2);

  return v4;
}

{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t inited;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  void aBlock[7];

  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25BF06DA0;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  objc_msgSend(a1, sel_setNeedsSave_, 0);
  sub_25BEE6620(MEMORY[0x263F8EE78]);
  uint64_t v7 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  aBlock[4] = sub_25BEF48C0;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BEE6D2C;
  aBlock[3] = &block_descriptor_1;
  int64_t v9 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v9);
  _Block_release(v9);

  swift_beginAccess();
  if (*(void *)(v6 + 16))
  {
    v22.receiver = v2;
    v22.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    uint64_t v10 = objc_msgSendSuper2(&v22, sel_initWithInfo_responder_, 0, 0);
LABEL_5:
    uint64_t v12 = v10;
    swift_release();
    swift_release();

    return v12;
  }
  swift_beginAccess();
  int64_t v11 = *(void *)(v5 + 24);
  if (v11 >> 60 == 15)
  {
    v25.receiver = v2;
    v25.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    uint64_t v10 = objc_msgSendSuper2(&v25, sel_initWithInfo_responder_, 0, 0);
    goto LABEL_5;
  }
  uint64_t v14 = *(void *)(v5 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582730);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BF06C10;
  *(void *)(inited + 32) = 7;
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = v11;
  unint64_t v16 = sub_25BEED424((void *)inited);
  swift_setDeallocating();
  sub_25BEED528(v14, v11);
  sub_25BEED528(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582738);
  swift_arrayDestroy();
  sub_25BEF48E0(v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = objc_allocWithZone(MEMORY[0x263F823E0]);
  uint64_t v18 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  uint64_t v19 = objc_msgSend(v17, sel_initWithSettings_, v18);

  if (v19)
  {
    uint64_t v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
    objc_msgSend(v20, sel_setObject_forSetting_, v19, 1);
    v23.receiver = v2;
    v23.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    uint64_t v21 = v20;
    uint64_t v12 = objc_msgSendSuper2(&v23, sel_initWithInfo_responder_, v21, a2);

    sub_25BEEDAB4(v14, v11);
    swift_release();
    swift_release();
  }
  else
  {
    v24.receiver = v2;
    v24.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    uint64_t v12 = objc_msgSendSuper2(&v24, sel_initWithInfo_responder_, 0, 0);

    sub_25BEEDAB4(v14, v11);
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_25BEF474C()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_25BEED970(*(void *)(v0 + 16), v1);
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BEF4794()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25BEF47CC(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v10 = *(void *)(a4 + 16);
  unint64_t v11 = *(void *)(a4 + 24);
  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_25BEED90C(a1, a2);
  sub_25BEEDAB4(v10, v11);
  swift_beginAccess();
  uint64_t v12 = *(void **)(a5 + 16);
  *(void *)(a5 + 16) = a3;
  id v13 = a3;
}

uint64_t sub_25BEF4880()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25BEF48C0(uint64_t a1, unint64_t a2, void *a3)
{
  sub_25BEF47CC(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25BEF48E0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582518);
    uint64_t v2 = sub_25BF059F8();
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v12);
    uint64_t v18 = *v17;
    unint64_t v19 = v17[1];
    sub_25BEED528(*v17, v19);
    swift_dynamicCast();
    *(void *)&v37[0] = v18;
    *((void *)&v37[0] + 1) = v19;
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_25BEEDC5C(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_25BEEDC5C(v36, v37);
    sub_25BEEDC5C(v37, &v33);
    uint64_t result = sub_25BF058D8();
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
    uint64_t result = (uint64_t)sub_25BEEDC5C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_25BEF6428();
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

void __swiftcall SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(coder:)(SESecureCaptureOpenApplicationAfterTransitionCompletionAction_optional *__return_ptr retstr, NSCoder coder)
{
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(coder:)(void *a1)
{
  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  id v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(xpcDictionary:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  id v1;
  objc_super v3;

  v3.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  id v1 = objc_msgSendSuper2(&v3, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t SESecureCaptureOpenApplicationAfterTransitionCompletionAction.launchActions.getter()
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25BF059C8()) {
    sub_25BEF60B8(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE88];
  }
  uint64_t v9 = v1;
  id v2 = objc_msgSend(v0, sel_info);
  if (!v2)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_25BEF5FF0((uint64_t)&v7);
    return v9;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_objectForSetting_, 1);

  if (v4)
  {
    sub_25BF05848();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_25BEF6050((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  sub_25BEED774(0, &qword_26A582748);
  if (swift_dynamicCast())
  {
    sub_25BEF5284(&v7, *(void **)&v6[0]);
  }
  return v9;
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:responder:)(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, a1, a2);

  return v4;
}

void SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:responder:)()
{
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (a3)
  {
    v11[4] = a3;
    v11[5] = a4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_25BEF4230;
    v11[3] = &block_descriptor_9;
    long long v8 = _Block_copy(v11);
    swift_release();
  }
  else
  {
    long long v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v8, a5);

  _Block_release(v8);
  return v9;
}

void SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:timeout:forResponseOn:withHandler:)()
{
}

uint64_t sub_25BEF5284(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_25BF058B8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_25BEED774(0, &qword_26A5824C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25BF058A8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_25BEF5524(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_25BEF571C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_25BEF59BC((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25BF057F8();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_25BEED774(0, &qword_26A5824C8);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_25BF05808();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_25BF05808();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *id v2 = 0x8000000000000000;
    id v8 = a2;
    sub_25BEF5A40((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *id v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_25BEF5524(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582758);
    uint64_t v2 = sub_25BF05928();
    uint64_t v14 = v2;
    sub_25BF05898();
    if (sub_25BF058C8())
    {
      sub_25BEED774(0, &qword_26A5824C8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_25BEF571C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_25BF057F8();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_25BF058C8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_25BEF571C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582758);
  uint64_t v3 = sub_25BF05918();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_25BF057F8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_25BEF59BC(uint64_t a1, uint64_t a2)
{
  sub_25BF057F8();
  unint64_t result = sub_25BF05888();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_25BEF5A40(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25BEF571C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_25BEF5BC8();
      goto LABEL_14;
    }
    sub_25BEF5D74();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_25BF057F8();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25BEED774(0, &qword_26A5824C8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_25BF05808();

    if (v12)
    {
LABEL_13:
      sub_25BF05A68();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_25BF05808();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_25BEF5BC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582758);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25BF05908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25BEF5D74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582758);
  uint64_t v3 = sub_25BF05918();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_25BF057F8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25BEF5FF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582740);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BEF6050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25BEF60B8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25BF059C8();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A582758);
      uint64_t v3 = sub_25BF05938();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25BF059C8();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x261177BE0](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_25BF057F8();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_25BEED774(0, &qword_26A5824C8);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_25BF05808();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25BF05808();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_25BF057F8();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25BEED774(0, &qword_26A5824C8);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25BF05808();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_25BF05808();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t type metadata accessor for SESecureCaptureOpenApplicationAfterTransitionCompletionAction(uint64_t a1)
{
  return sub_25BEED774(a1, &qword_26A582750);
}

uint64_t sub_25BEF6428()
{
  return swift_release();
}

id sub_25BEF653C()
{
  return sub_25BEF6B38(type metadata accessor for SecureCaptureSceneExtension);
}

uint64_t type metadata accessor for SecureCaptureSceneExtension()
{
  return self;
}

uint64_t sub_25BEF6578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25BEF658C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void sub_25BEF6618(void *a1, void *a2)
{
  id v13 = objc_msgSend(a1, sel_clientSettings);
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_msgSend(a2, sel_previousSettings);
    if (v6)
    {
      uint64_t v7 = v6;
      self;
      uint64_t v8 = swift_dynamicCastObjCClass();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = v2 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
        swift_beginAccess();
        sub_25BEEDBF8(v10, (uint64_t)v14, &qword_26A582770);
        if (v15)
        {
          sub_25BEEDD1C((uint64_t)v14, &qword_26A582770);
          unsigned int v11 = objc_msgSend(v5, sel_statusBarHidden);
          if (v11 != objc_msgSend(v9, sel_statusBarHidden))
          {
            id v12 = objc_msgSend(a2, sel_transitionContext);
          }
        }
        else
        {

          sub_25BEEDD1C((uint64_t)v14, &qword_26A582770);
        }
        return;
      }
    }
  }
}

id sub_25BEF6888()
{
  return sub_25BEF6B38(type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

uint64_t type metadata accessor for SecureCaptureSceneStatusBarHostComponent()
{
  return self;
}

id sub_25BEF6914(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_25BEF6958()
{
  return sub_25BEF6B38(type metadata accessor for SecureCaptureSessionPathSettingsExtension);
}

uint64_t type metadata accessor for SecureCaptureSessionPathSettingsExtension()
{
  return self;
}

uint64_t sub_25BEF6994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

id sub_25BEF6A40(char *a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  uint64_t v5 = &a1[*a3];
  id v6 = (objc_class *)a4();
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = a1;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

id sub_25BEF6AB8(char *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  uint64_t v7 = &a1[*a4];
  objc_super v8 = (objc_class *)a5();
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  v10.receiver = a1;
  v10.super_class = v8;
  return objc_msgSendSuper2(&v10, sel_initWithScene_, a3);
}

id sub_25BEF6B20()
{
  return sub_25BEF6B38(type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

id sub_25BEF6B38(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SecureCaptureSceneSessionPathHostComponent()
{
  return self;
}

uint64_t sub_25BEF6BC0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5824B8);
  uint64_t v10 = *(void *)(sub_25BF05328() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25BF059A8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25BF05328() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25BEF6F38(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_25BEF6E28(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A582780);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25BEF7090(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25BEF6F38(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25BF05328() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_25BF05A08();
  __break(1u);
  return result;
}

char *sub_25BEF7090(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25BF05A08();
  __break(1u);
  return result;
}

void *sub_25BEF717C()
{
  uint64_t v0 = (NSString *)sub_25BF05518();
  Class v1 = NSClassFromString(v0);

  if (v1)
  {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    objc_super v3 = sub_25BEF6E28(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v5 = v3[2];
    unint64_t v4 = v3[3];
    if (v5 >= v4 >> 1) {
      objc_super v3 = sub_25BEF6E28((void *)(v4 > 1), v5 + 1, 1, v3);
    }
    v3[2] = v5 + 1;
    v3[v5 + 4] = ObjCClassMetadata;
  }
  else
  {
    objc_super v3 = (void *)MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v3 = sub_25BEF6E28(0, v3[2] + 1, 1, v3);
  }
  unint64_t v7 = v3[2];
  unint64_t v6 = v3[3];
  unint64_t v8 = v7 + 1;
  if (v7 >= v6 >> 1) {
    objc_super v3 = sub_25BEF6E28((void *)(v6 > 1), v7 + 1, 1, v3);
  }
  uint64_t v9 = type metadata accessor for SecureCaptureSceneStatusBarHostComponent();
  v3[2] = v8;
  v3[v7 + 4] = v9;
  unint64_t v10 = v3[3];
  int64_t v11 = v7 + 2;
  if (v11 > (uint64_t)(v10 >> 1)) {
    objc_super v3 = sub_25BEF6E28((void *)(v10 > 1), v11, 1, v3);
  }
  uint64_t v12 = type metadata accessor for SecureCaptureSceneSessionPathHostComponent();
  v3[2] = v11;
  v3[v8 + 4] = v12;
  return v3;
}

id sub_25BEF72F0(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
  swift_beginAccess();
  sub_25BEEDBF8(v3, (uint64_t)&v14, &qword_26A582770);
  if (!v15) {
    return (id)sub_25BEEDD1C((uint64_t)&v14, &qword_26A582770);
  }
  sub_25BEF788C(&v14, (uint64_t)v16);
  id v4 = objc_msgSend(a1, sel_mutableSettings);
  if (v4)
  {
    unint64_t v5 = v4;
    self;
    uint64_t v6 = swift_dynamicCastObjCClass();
    if (!v6) {
      goto LABEL_9;
    }
    unint64_t v7 = (void *)v6;
    unint64_t v8 = (id *)(*__swift_project_boxed_opaque_existential_1(v16, v16[3])
              + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
    swift_beginAccess();
    if (!*v8) {
      goto LABEL_9;
    }
    id result = objc_msgSend(*v8, sel_view);
    if (!result)
    {
      __break(1u);
      return result;
    }
    unint64_t v10 = result;
    id v11 = objc_msgSend(result, sel_window);

    id v12 = objc_msgSend(v11, sel_windowScene);
    id v13 = objc_msgSend(v12, sel_statusBarManager);

    if (v13)
    {
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 1);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 1);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 4);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 4);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 3);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 3);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 2);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 2);
    }
    else
    {
LABEL_9:
    }
  }
  return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

void sub_25BEF7520(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_settings);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v27 = &unk_270978330;
    uint64_t v6 = swift_dynamicCastObjCProtocolConditional();
    if (v6)
    {
      unint64_t v7 = (void *)v6;
      id v8 = objc_msgSend(a1, sel_previousSettings);
      if (v8)
      {
        uint64_t v9 = v8;
        id v26 = &unk_270978330;
        uint64_t v10 = swift_dynamicCastObjCProtocolConditional();
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = objc_msgSend(v7, sel_captureSessionPath);
          id v13 = objc_msgSend(v11, sel_captureSessionPath);
          long long v14 = v13;
          if (v12)
          {
            if (v13)
            {
              sub_25BEF784C();
              id v15 = v12;
              char v16 = sub_25BF05808();

              if ((v16 & 1) == 0)
              {
LABEL_16:
                uint64_t v17 = v2 + OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate;
                swift_beginAccess();
                sub_25BEEDBF8(v17, (uint64_t)v24, &qword_26A5827D0);
                if (v25)
                {
                  sub_25BEF7754((uint64_t)v24, (uint64_t)v21);
                  sub_25BEEDD1C((uint64_t)v24, &qword_26A5827D0);
                  uint64_t v18 = v22;
                  uint64_t v19 = v23;
                  __swift_project_boxed_opaque_existential_1(v21, v22);
                  id v20 = objc_msgSend(v7, sel_captureSessionPath);
                  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v19 + 8))(v2, v20, v18, v19);

                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
                }
                else
                {

                  sub_25BEEDD1C((uint64_t)v24, &qword_26A5827D0);
                }
                return;
              }
LABEL_13:

              return;
            }
            long long v14 = v12;
          }
          else if (!v13)
          {
            goto LABEL_13;
          }

          goto LABEL_16;
        }
      }
    }
  }
}

uint64_t sub_25BEF7754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unint64_t sub_25BEF784C()
{
  unint64_t result = qword_26A582670;
  if (!qword_26A582670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A582670);
  }
  return result;
}

uint64_t sub_25BEF788C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t PresentationMode.description.getter(unsigned int a1)
{
  if (a1 < 3) {
    return *(void *)&aNone[8 * a1];
  }
  uint64_t result = sub_25BF05A58();
  __break(1u);
  return result;
}

unint64_t PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = 2;
  if (a1 != 2) {
    uint64_t v2 = 0;
  }
  BOOL v3 = a1 != 2;
  if (a1 == 1) {
    BOOL v3 = 0;
  }
  else {
    uint64_t v1 = v2;
  }
  if (!a1)
  {
    uint64_t v1 = 0;
    BOOL v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_25BEF7954(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25BEF7968()
{
  return sub_25BF05B38();
}

uint64_t sub_25BEF79B0()
{
  return sub_25BF05B28();
}

uint64_t sub_25BEF79DC()
{
  return sub_25BF05B38();
}

int *sub_25BEF7A20@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *result;
  BOOL v3 = *result > 2;
  if (*result > 2) {
    int v2 = 0;
  }
  *(_DWORD *)a2 = v2;
  *(unsigned char *)(a2 + 4) = v3;
  return result;
}

void sub_25BEF7A3C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25BEF7A48()
{
  return PresentationMode.description.getter(*v0);
}

id sub_25BEF7A50()
{
  uint64_t v1 = OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector;
  int v2 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82450]), sel_init);
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = sub_25BF00B94;
    v10[5] = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_25BEF7CE0;
    v10[3] = &block_descriptor_20;
    uint64_t v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v4, sel_observeIdleTimerDisabledWithBlock_, v6);
    _Block_release(v6);
    unint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    int v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_25BEF7B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x261178580](v2);
  if (v3)
  {
    id v4 = (id)v3;
    uint64_t v5 = *(void **)(v3 + OBJC_IVAR___SESecureCaptureSceneViewController_scene);
    if (v5)
    {
      id v6 = v5;

      id v4 = objc_msgSend(v6, sel_clientSettings);
      if (!v4) {
        return;
      }
      self;
      uint64_t v7 = swift_dynamicCastObjCClass();
      if (v7)
      {
        id v8 = (void *)v7;
        swift_beginAccess();
        uint64_t v9 = MEMORY[0x261178580](v2);
        if (v9)
        {
          uint64_t v10 = (unsigned char *)v9;
          unsigned int v11 = objc_msgSend(v8, sel_idleTimerDisabled);
          int v12 = v10[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled];
          v10[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = v11;
          if (v11 != v12)
          {
            id v13 = objc_msgSend(v10, sel_delegate);
            if (v13)
            {
              objc_msgSend(v13, sel_secureCaptureSceneViewController_requestsIdleTimerDisabled_, v10, objc_msgSend(v10, sel_requestsIdleTimerDisabled));

              swift_unknownObjectRelease();
              return;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25BEF7CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_25BEF7D34()
{
  uint64_t v1 = OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue);
  }
  else
  {
    id v4 = (void *)sub_25BF05518();
    Serial = (void *)BSDispatchQueueCreateSerial();

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = Serial;
    id v3 = Serial;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void *SESecureCaptureSceneViewController._scene.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_scene);
  id v2 = v1;
  return v1;
}

uint64_t SESecureCaptureSceneViewController.presentationMode.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
}

void SESecureCaptureSceneViewController.presentationMode.setter(int a1)
{
  BSDispatchQueueAssertMain();
  sub_25BEF7E50(a1, 0);
}

void sub_25BEF7E50(int a1, char a2)
{
  id v3 = v2;
  LODWORD(v5) = a1;
  uint64_t v6 = sub_25BF05468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if ((v3[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] & 1) == 0)
  {
    unint64_t v10 = 0x26A582000uLL;
    if ((a2 & 1) != 0 || *(_DWORD *)&v3[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] != v5)
    {
      if (qword_26A5822A0 != -1) {
        swift_once();
      }
      uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A582CE0);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
      int v12 = sub_25BF05448();
      os_log_type_t v13 = sub_25BF05728();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_t v28 = v12;
        uint64_t v29 = v11;
        uint64_t v14 = swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v31 = v27;
        *(_DWORD *)uint64_t v14 = 136446466;
        if (v5 >= 3)
        {
LABEL_24:
          LODWORD(v30) = v5;
          goto LABEL_25;
        }
        uint64_t v30 = sub_25BEFEB58(*(void *)&aNone[8 * (int)v5], *(void *)&aLivesnap[8 * (int)v5 + 8], &v31);
        sub_25BF05828();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 1026;
        LODWORD(v30) = a2 & 1;
        sub_25BF05828();
        os_log_t v15 = v28;
        _os_log_impl(&dword_25BEE3000, v28, v13, "Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v14, 0x12u);
        uint64_t v16 = v27;
        swift_arrayDestroy();
        MEMORY[0x261178490](v16, -1, -1);
        MEMORY[0x261178490](v14, -1, -1);

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        unint64_t v10 = 0x26A582000;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      }
      uint64_t v17 = *(void *)(v10 + 1944);
      *(_DWORD *)&v3[v17] = v5;
      if (v5 < 2)
      {
        sub_25BEF9598(0, 1);
        sub_25BEFA678(v5 == 1, 0, 0);
        return;
      }
      if (v5 != 2)
      {
        LODWORD(v31) = v5;
LABEL_25:
        sub_25BF05A58();
        __break(1u);
        return;
      }
      uint64_t v18 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
      if (v18)
      {
        id v5 = v18;
        if (objc_msgSend(v5, sel_contentState) != (id)2)
        {
          uint64_t v24 = swift_allocObject();
          *(void *)(v24 + 16) = v3;
          uint64_t v25 = v3;
          sub_25BEFA678(1, (uint64_t)sub_25BF00CB4, v24);
          swift_release();

          return;
        }
        BSDispatchQueueAssertMain();
        if (*(_DWORD *)&v3[v17] == 2)
        {
          uint64_t v19 = swift_allocObject();
          *(void *)(v19 + 16) = v3;
          id v20 = v3;
          sub_25BEF9A80((uint64_t)sub_25BF00CBC, v19);

          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_24;
      }
      id v21 = sub_25BF05448();
      os_log_type_t v22 = sub_25BF05718();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_25BEE3000, v21, v22, "Snapshot failed because there is no scene found", v23, 2u);
        MEMORY[0x261178490](v23, -1, -1);
      }
    }
  }
}

void (*SESecureCaptureSceneViewController.presentationMode.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  return sub_25BEF832C;
}

void sub_25BEF832C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_25BEF7E50(v1, 0);
}

uint64_t SESecureCaptureSceneViewController.__presentationMode.getter()
{
  uint64_t result = *(unsigned int *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  if (result >= 3)
  {
    uint64_t result = sub_25BF05A58();
    __break(1u);
  }
  return result;
}

void SESecureCaptureSceneViewController.__presentationMode.setter(uint64_t a1)
{
  if (a1 == 2) {
    int v1 = 2;
  }
  else {
    int v1 = a1 == 1;
  }
  BSDispatchQueueAssertMain();
  sub_25BEF7E50(v1, 0);
}

unint64_t sub_25BEF84C4(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000025;
    }
    else {
      return 0xD000000000000021;
    }
  }
  return result;
}

unint64_t sub_25BEF8524()
{
  return sub_25BEF84C4(*v0);
}

uint64_t SESecureCaptureSceneViewController.requestsIdleTimerDisabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled);
}

uint64_t SESecureCaptureSceneViewController.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SESecureCaptureSceneViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x261178580](v1);
}

uint64_t SESecureCaptureSceneViewController.delegate.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t SESecureCaptureSceneViewController.extensionProvider.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t SESecureCaptureSceneViewController.extensionProvider.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

id SESecureCaptureSceneViewController.init(provider:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProvider_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  void *v1;
  void *v3;
  id v4;

  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25BF059C8()) {
    sub_25BEF60B8(MEMORY[0x263F8EE78]);
  }
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  id v3 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_initWithProvider_launchActions_, a1, v3);

  swift_unknownObjectRelease();
  return v4;
}

id SESecureCaptureSceneViewController.init(provider:launch:)(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  id v3 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithProvider_launchActions_, a1, v3);

  swift_unknownObjectRelease();
  return v4;
}

id SESecureCaptureSceneViewController.init(provider:launch:)(uint64_t a1, uint64_t a2)
{
  id v2 = sub_25BEFF1B0(a1, a2);
  swift_unknownObjectRelease();
  return v2;
}

void __swiftcall SESecureCaptureSceneViewController.init(coder:)(SESecureCaptureSceneViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

id sub_25BEF8BD4(void *a1)
{
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BF05468();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A582CE0);
  id v3 = sub_25BF05448();
  os_log_type_t v4 = sub_25BF05728();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_25BEE3000, v3, v4, "Capture Extension scene dealloc", v5, 2u);
    MEMORY[0x261178490](v5, -1, -1);
  }

  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_25BEF8CD0(uint64_t a1, uint64_t a2)
{
  sub_25BF05608();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_25BF008EC();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_25BF05948();
    sub_25BF05558();
    sub_25BF05B48();
    sub_25BF05558();
    swift_bridgeObjectRelease();
    sub_25BF05558();
    uint64_t result = sub_25BF059B8();
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall SESecureCaptureSceneViewController._canShowWhileLocked()()
{
  return 1;
}

Swift::Void __swiftcall SESecureCaptureSceneViewController.viewDidLoad()()
{
  BSDispatchQueueAssertMain();
  v1.receiver = v0;
  v1.super_class = (Class)SESecureCaptureSceneViewController;
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_25BEF9060();
  objc_msgSend(*(id *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant], sel_addObserver_, v0);
  sub_25BEF92CC();
}

void sub_25BEF9060()
{
  BSDispatchQueueAssertMain();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v2 = objc_msgSend(v1, sel_layer);
  id v3 = (void *)sub_25BF05518();
  objc_msgSend(v2, sel_setName_, v3);

  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v1, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);
  uint64_t v14 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController];
  if (!v14)
  {
    id v20 = objc_msgSend(v0, sel_view);
    if (v20)
    {
      uint64_t v19 = v20;
      objc_msgSend(v20, sel_addSubview_, v1);
      goto LABEL_8;
    }
LABEL_17:
    __break(1u);
    return;
  }
  id v15 = v14;
  id v16 = objc_msgSend(v0, sel_view);
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(v15, sel_view);
  if (!v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v19 = v18;
  objc_msgSend(v17, sel_insertSubview_belowSubview_, v1, v18);

LABEL_8:
  uint64_t v21 = OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView;
  os_log_type_t v22 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = v1;
  id v26 = v1;

  BSDispatchQueueAssertMain();
  uint64_t v23 = *(void **)&v0[v21];
  if (v23)
  {
    id v24 = v23;
    sub_25BEF97EC(v0, v24, 0);
    objc_msgSend(v24, sel_setHidden_, 1);

    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v25 = v26;
  }
}

void sub_25BEF92CC()
{
  uint64_t v1 = OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant;
  unsigned int v2 = objc_msgSend(*(id *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant], sel_shouldShield);
  uint64_t v3 = OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController;
  id v4 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController];
  if (!v2)
  {
    if (!v4) {
      return;
    }
    id v24 = v4;
    id v25 = objc_msgSend(v24, sel_view);
    if (v25)
    {
      id v26 = v25;
      objc_msgSend(v25, sel_removeFromSuperview);

      objc_msgSend(v24, sel_didMoveToParentViewController_, 0);
      id v5 = 0;
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_17;
  }
  if (v4) {
    return;
  }
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F526F0]), sel_initWithAssistant_, *(void *)&v0[v1]);
  id v6 = objc_msgSend(v5, sel_view);
  if (!v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  double v7 = v6;
  id v8 = objc_msgSend(v0, sel_view);
  if (!v8)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  double v9 = v8;
  objc_msgSend(v8, sel_bounds);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v7, sel_setFrame_, v11, v13, v15, v17);
  id v18 = objc_msgSend(v5, sel_view);
  if (!v18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v19 = v18;
  objc_msgSend(v18, sel_setAutoresizingMask_, 18);

  id v20 = objc_msgSend(v0, sel_view);
  if (!v20)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v5, sel_view);
  if (!v22)
  {
LABEL_21:
    __break(1u);
    return;
  }
  uint64_t v23 = v22;
  objc_msgSend(v21, sel_addSubview_, v22);

  objc_msgSend(v0, sel_addChildViewController_, v5);
  objc_msgSend(v5, sel_didMoveToParentViewController_, v0);
LABEL_12:
  uint64_t v27 = *(void **)&v0[v3];
  *(void *)&v0[v3] = v5;
}

void sub_25BEF9598(char a1, char a2)
{
  BSDispatchQueueAssertMain();
  id v5 = *(void **)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (!v5) {
    return;
  }
  id v16 = *(id *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (a1 != 2)
  {
    int v6 = a1 & 1;
    id v7 = v5;
    if ((a2 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    id v8 = self;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v2;
    *(void *)(v9 + 24) = v16;
    *(unsigned char *)(v9 + 32) = v6;
    uint64_t v21 = sub_25BF00C54;
    uint64_t v22 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v18 = 1107296256;
    uint64_t v19 = sub_25BEEF9E8;
    id v20 = &block_descriptor_41;
    double v10 = _Block_copy(&aBlock);
    id v11 = v16;
    double v12 = v2;
    swift_release();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v11;
    *(unsigned char *)(v13 + 24) = v6;
    uint64_t v21 = sub_25BF00C98;
    uint64_t v22 = v13;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v18 = 1107296256;
    uint64_t v19 = sub_25BEF9908;
    id v20 = &block_descriptor_47;
    double v14 = _Block_copy(&aBlock);
    id v15 = v11;
    swift_release();
    objc_msgSend(v8, sel_animateWithDuration_animations_completion_, v10, v14, 0.4);

    _Block_release(v14);
    _Block_release(v10);
    return;
  }
  int v6 = objc_msgSend(v5, sel_isHidden);
  if (a2) {
    goto LABEL_8;
  }
LABEL_4:
  sub_25BEF97EC(v2, v16, v6);
  objc_msgSend(v16, sel_setHidden_, v6 ^ 1u);
}

id sub_25BEF97EC(char *a1, void *a2, char a3)
{
  int v6 = *(void **)&a1[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController];
  if (!v6)
  {
    id result = objc_msgSend(a1, sel_view);
    if (result)
    {
      id v10 = result;
      objc_msgSend(result, sel_bringSubviewToFront_, a2);
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  id v7 = v6;
  id result = objc_msgSend(a1, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }
  id v9 = result;
  id result = objc_msgSend(v7, sel_view);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v10 = result;
  objc_msgSend(v9, sel_insertSubview_belowSubview_, a2, result);

LABEL_7:
  double v11 = 0.0;
  if (a3) {
    double v11 = 1.0;
  }
  return objc_msgSend(a2, sel_setAlpha_, v11);
}

uint64_t sub_25BEF9908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_25BEF995C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t)a1;
  unsigned int v6 = objc_msgSend(a1, sel_capture);
  if (v6) {
    id v7 = (id)v5;
  }
  else {
    uint64_t v5 = 2;
  }
  char v8 = v6 ^ 1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  *(void *)(v9 + 32) = v5;
  *(unsigned char *)(v9 + 40) = v8;
  v11[4] = sub_25BF00D78;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_25BEEF9E8;
  v11[3] = &block_descriptor_68;
  id v10 = _Block_copy(v11);
  swift_retain();
  sub_25BF00DAC((id)v5, v8);
  swift_release();
  BSDispatchMain();
  _Block_release(v10);
  sub_25BF00D6C((id)v5, v8);
}

void sub_25BEF9A80(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25BF054A8();
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25BF054C8();
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  double v11 = (void *)swift_allocObject();
  v11[2] = v2;
  v11[3] = a1;
  v11[4] = a2;
  id v12 = v2;
  swift_retain_n();
  uint64_t v13 = (char *)v12;
  BSDispatchQueueAssertMain();
  double v14 = *(void **)&v13[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter];
  if (v14 && (id v15 = *(void **)&v13[OBJC_IVAR___SESecureCaptureSceneViewController_scene]) != 0)
  {
    swift_unknownObjectRetain();
    id v25 = v15;
    if (objc_msgSend(v25, sel_contentState) == (id)2)
    {
      id v16 = objc_msgSend(v14, sel_newSnapshot);
      id v24 = sub_25BEF7D34();
      double v17 = (void *)swift_allocObject();
      v17[2] = v16;
      v17[3] = sub_25BF00CC8;
      v17[4] = v11;
      aBlock[4] = sub_25BF00D1C;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_25BEEF9E8;
      aBlock[3] = &block_descriptor_62;
      uint64_t v22 = _Block_copy(aBlock);
      id v23 = v16;
      swift_retain();
      sub_25BF054B8();
      uint64_t v28 = MEMORY[0x263F8EE78];
      sub_25BF00AB8((unint64_t *)&unk_26A582630, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5829F0);
      sub_25BF00B00();
      sub_25BF05868();
      uint64_t v18 = v22;
      uint64_t v19 = v24;
      MEMORY[0x2611779C0](0, v10, v7, v22);
      _Block_release(v18);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v5);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v8);
      swift_release();

      swift_release();
      swift_release();
    }
    else
    {
      sub_25BEF9EDC((void *)1, 1, v13, a1, a2);
      swift_release();

      swift_release();
      swift_unknownObjectRelease();
      id v20 = v25;
    }
  }
  else
  {
    sub_25BEF9EDC(0, 1, v13, a1, a2);
    swift_release();

    swift_release();
  }
}

void sub_25BEF9EDC(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25BF05468();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A582CE0);
    uint64_t v13 = sub_25BF05448();
    os_log_type_t v14 = sub_25BF05728();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t aBlock = v16;
      *(_DWORD *)id v15 = 136315138;
      sub_25BF00E20();
      uint64_t v17 = sub_25BF05A28();
      uint64_t v27 = v16;
      if (v17)
      {
        uint64_t v18 = (void *)v17;
      }
      else
      {
        uint64_t v18 = (void *)swift_allocError();
        *uint64_t v19 = (_BYTE)a1;
      }
      id v20 = (void *)sub_25BF052D8();

      id v21 = objc_msgSend(v20, sel_localizedDescription);
      uint64_t v22 = sub_25BF05528();
      unint64_t v24 = v23;

      sub_25BEFEB58(v22, v24, &aBlock);
      sub_25BF05828();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BEE3000, v13, v14, "Snapshot failed - %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v27, -1, -1);
      MEMORY[0x261178490](v15, -1, -1);
    }

    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    *(void *)(v25 + 24) = a5;
    *(unsigned char *)(v25 + 32) = (_BYTE)a1;
    uint64_t v32 = sub_25BF00DF0;
    id v33 = (void *)v25;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_25BEEF9E8;
    uint64_t v31 = &block_descriptor_74;
    uint64_t v26 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v26);
  }
  else
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    void v9[5] = a5;
    uint64_t v32 = sub_25BF00EBC;
    id v33 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_25BEEF9E8;
    uint64_t v31 = &block_descriptor_80;
    id v10 = _Block_copy(&aBlock);
    sub_25BF00DAC(a1, 0);
    sub_25BF00DAC(a1, 0);
    id v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_25BF00D6C(a1, 0);
  }
}

void sub_25BEFA278(uint64_t a1, void *a2, void (*a3)(uint64_t))
{
  if (*(_DWORD *)(a1 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode) == 2)
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25BF05468();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A582CE0);
    id v7 = sub_25BF05448();
    os_log_type_t v8 = sub_25BF05728();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25BEE3000, v7, v8, "Snapshot success - Updating layer.", v9, 2u);
      MEMORY[0x261178490](v9, -1, -1);
    }

    id v10 = objc_msgSend(a2, sel_IOSurface);
    if (!v10) {
      id v10 = objc_msgSend(a2, sel_fallbackIOSurface);
    }
    id v13 = v10;
    id v11 = *(void **)(a1 + OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView);
    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_layer);
      objc_msgSend(v12, sel_setContents_, v13);
    }
    a3(3);
  }
}

void sub_25BEFA440(unsigned __int8 a1, char *a2)
{
  int v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    BSDispatchQueueAssertMain();
    uint64_t v5 = *(void **)&a2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
    if (v5)
    {
      id v6 = v5;
      sub_25BEF97EC(a2, v6, 1);
      objc_msgSend(v6, sel_setHidden_, 0);
LABEL_10:
    }
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25BF05468();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A582CE0);
    os_log_type_t v8 = sub_25BF05448();
    os_log_type_t v9 = sub_25BF05718();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138543362;
      sub_25BF00E20();
      swift_allocError();
      *id v12 = a1;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_25BF05828();
      *id v11 = v14;
      _os_log_impl(&dword_25BEE3000, v8, v9, " Snapshot failed so backgrounding scene without updated snapshot: %{public}@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5827E0);
      swift_arrayDestroy();
      MEMORY[0x261178490](v11, -1, -1);
      MEMORY[0x261178490](v10, -1, -1);
    }

    BSDispatchQueueAssertMain();
    id v13 = *(void **)&a2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
    if (v13)
    {
      id v6 = v13;
      sub_25BEF97EC(a2, v6, 0);
      objc_msgSend(v6, sel_setHidden_, 1);
      goto LABEL_10;
    }
  }
  sub_25BEFA678(0, 0, 0);
}

void sub_25BEFA678(int a1, uint64_t a2, uint64_t a3)
{
  id v6 = v3;
  uint64_t v10 = sub_25BF05468();
  id v11 = *(void **)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v102 - v15;
  BSDispatchQueueAssertMain();
  uint64_t v17 = (char *)OBJC_IVAR___SESecureCaptureSceneViewController_scene;
  uint64_t v18 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
  if (!v18)
  {
    v106 = v14;
    v107 = v11;
    uint64_t v110 = a3;
    v111 = (void *)v10;
    int v108 = a1;
    id v109 = (id)a2;
    uint64_t v29 = (void **)objc_msgSend(v3, sel_extensionProvider);
    id v30 = objc_msgSend(v29, sel_processIdentity);
    if (qword_26A5822A8 != -1) {
      swift_once();
    }
    uint64_t v31 = (void *)qword_26A582CF8;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v30;
    id v33 = (void *)swift_allocObject();
    v33[2] = sub_25BF00EC8;
    v33[3] = v32;
    v117 = sub_25BF00EE0;
    v118 = v33;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v114 = 1107296256;
    v115 = sub_25BEFEAF4;
    v116 = &block_descriptor_89;
    char v34 = _Block_copy(&aBlock);
    uint64_t v35 = v118;
    id v36 = v31;
    id v37 = v30;
    swift_retain();
    swift_release();
    id v38 = objc_msgSend(v36, sel_createScene_, v34);

    _Block_release(v34);
    LOBYTE(v34) = swift_isEscapingClosureAtFileLocation();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    if (v34)
    {
      __break(1u);
    }
    else
    {
      type metadata accessor for SecureCaptureSceneExtension();
      objc_msgSend(v38, sel_addExtension_, swift_getObjCClassFromMetadata());
      uint64_t v39 = *(void **)&v17[(void)v6];
      *(void *)&v17[(void)v6] = v38;
      uint64_t v29 = (void **)v38;

      objc_msgSend(v29, sel_setDelegate_, v6);
      id v40 = objc_msgSend(v29, sel_layerManager);
      objc_msgSend(v40, sel_addObserver_, v6);

      unint64_t v41 = (char *)objc_msgSend(v29, sel_uiPresentationManager);
      if (!v41) {
        goto LABEL_26;
      }
      uint64_t v17 = v41;
      uint64_t v42 = (void *)sub_25BF05518();
      id v33 = objc_msgSend(v17, sel_createPresenterWithIdentifier_, v42);

      *(void *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = v33;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      v117 = sub_25BEFB914;
      v118 = 0;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v114 = 1107296256;
      v115 = sub_25BF01334;
      v116 = &block_descriptor_92;
      uint64_t v43 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v33, sel_modifyPresentationContext_, v43);
      _Block_release(v43);
      if ((swift_isEscapingClosureAtFileLocation() & 1) == 0)
      {
        objc_msgSend(v33, sel_activate);
        id v44 = objc_msgSend(v33, sel_presentationView);
        id v45 = objc_msgSend(v44, sel_layer);
        objc_msgSend(v45, sel_setSecurityMode_, *MEMORY[0x263F15E60]);

        uint64_t v46 = *(void **)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView];
        *(void *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = v44;
        id v38 = v44;

        id v47 = objc_msgSend(v6, sel_view);
        if (v47)
        {
          uint64_t v48 = v47;
          objc_msgSend(v47, sel_addSubview_, v38);

          uint64_t v49 = *(void **)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController];
          if (v49)
          {
            id v50 = v38;
            id v51 = v49;
            id v52 = objc_msgSend(v6, sel_view);
            if (!v52)
            {
LABEL_57:
              __break(1u);
              goto LABEL_58;
            }
            uint64_t v53 = v52;
            id v54 = objc_msgSend(v51, sel_view);
            if (!v54)
            {
LABEL_58:
              __break(1u);
              goto LABEL_59;
            }
            uint64_t v55 = v54;
            objc_msgSend(v53, sel_bringSubviewToFront_, v54);

            id v38 = v50;
          }
          id v56 = objc_msgSend(v6, sel_view);
          if (v56)
          {
            uint64_t v57 = v56;
            objc_msgSend(v56, sel_setNeedsLayout);

            objc_msgSend(v38, sel_setClipsToBounds_, 1);
            id v58 = objc_msgSend(v38, sel_layer);
            uint64_t v59 = (void *)sub_25BF05518();
            objc_msgSend(v58, sel_setName_, v59);

            id v60 = objc_msgSend(v6, sel_view);
            if (v60)
            {
              uint64_t v61 = v60;
              id v62 = objc_msgSend(v60, sel_window);

              id v36 = v111;
              v104 = v33;
              if (v62)
              {
                id v63 = objc_msgSend(v62, sel_screen);

                objc_msgSend(v63, sel__referenceBounds);
                double v4 = v64;
                double v5 = v65;

                goto LABEL_38;
              }
              id v75 = objc_msgSend(v6, sel_view);
              if (v75)
              {
                uint64_t v76 = v75;
                objc_msgSend(v75, sel_bounds);
                double v5 = v77;
                double v79 = v78;

                if (v79 >= v5) {
                  double v4 = v5;
                }
                else {
                  double v4 = v79;
                }
                if (v5 <= v79) {
                  double v5 = v79;
                }
LABEL_38:
                id v33 = v106;
                uint64_t v35 = v107;
                objc_msgSend(v6, sel_setPreferredContentSize_, v4, v5);
                if (qword_26A5822A0 == -1)
                {
LABEL_39:
                  v106 = v17;
                  uint64_t v80 = __swift_project_value_buffer((uint64_t)v36, (uint64_t)qword_26A582CE0);
                  ((void (*)(void *, uint64_t, id))v35[2])(v33, v80, v36);
                  v81 = sub_25BF05448();
                  os_log_type_t v82 = sub_25BF05728();
                  BOOL v83 = os_log_type_enabled(v81, v82);
                  v105 = v29;
                  id v103 = v38;
                  if (v83)
                  {
                    v84 = (uint8_t *)swift_slowAlloc();
                    uint64_t v85 = swift_slowAlloc();
                    *(_DWORD *)v84 = 136446210;
                    uint64_t aBlock = v85;
                    char v86 = v108;
                    if (v108) {
                      uint64_t v87 = 0x756F726765726F66;
                    }
                    else {
                      uint64_t v87 = 0x756F72676B636162;
                    }
                    uint64_t v112 = sub_25BEFEB58(v87, 0xEA0000000000646ELL, &aBlock);
                    sub_25BF05828();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_25BEE3000, v81, v82, "Creating capture scene to %{public}s.", v84, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x261178490](v85, -1, -1);
                    MEMORY[0x261178490](v84, -1, -1);

                    v88 = v105;
                    ((void (*)(void *, void *))v35[1])(v33, v111);
                    uint64_t v29 = v88;
                  }
                  else
                  {

                    ((void (*)(void *, id))v35[1])(v33, v36);
                    char v86 = v108;
                  }
                  uint64_t v89 = swift_allocObject();
                  *(double *)(v89 + 16) = v4;
                  *(double *)(v89 + 24) = v5;
                  *(void *)(v89 + 32) = v6;
                  uint64_t v71 = v86 & 1;
                  *(unsigned char *)(v89 + 40) = v71;
                  uint64_t v90 = swift_allocObject();
                  *(void *)(v90 + 16) = sub_25BF00F08;
                  *(void *)(v90 + 24) = v89;
                  v117 = sub_25BF01338;
                  v118 = (void *)v90;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v114 = 1107296256;
                  v115 = sub_25BF01334;
                  v116 = &block_descriptor_101;
                  v91 = _Block_copy(&aBlock);
                  v92 = v6;
                  swift_retain();
                  swift_release();
                  objc_msgSend(v29, sel_configureParameters_, v91);
                  _Block_release(v91);
                  LOBYTE(v91) = swift_isEscapingClosureAtFileLocation();
                  swift_release();
                  if (v91)
                  {
                    __break(1u);
                  }
                  else
                  {
                    uint64_t v93 = swift_allocObject();
                    *(unsigned char *)(v93 + 16) = v71;
                    *(void *)(v93 + 24) = v92;
                    uint64_t v71 = swift_allocObject();
                    *(void *)(v71 + 16) = sub_25BF00F60;
                    *(void *)(v71 + 24) = v93;
                    v117 = sub_25BF00F7C;
                    v118 = (void *)v71;
                    uint64_t aBlock = MEMORY[0x263EF8330];
                    uint64_t v114 = 1107296256;
                    v115 = sub_25BEFB830;
                    v116 = &block_descriptor_110;
                    v94 = _Block_copy(&aBlock);
                    v95 = v92;
                    swift_retain();
                    swift_release();
                    v96 = (void *)swift_allocObject();
                    uint64_t v98 = (uint64_t)v109;
                    uint64_t v97 = v110;
                    v96[2] = v109;
                    v96[3] = v97;
                    v99 = v105;
                    v96[4] = v95;
                    v96[5] = v99;
                    v117 = sub_25BF00FF4;
                    v118 = v96;
                    uint64_t aBlock = MEMORY[0x263EF8330];
                    uint64_t v114 = 1107296256;
                    v115 = sub_25BEFB89C;
                    v116 = &block_descriptor_116;
                    v100 = _Block_copy(&aBlock);
                    sub_25BF01000(v98);
                    uint64_t v29 = v99;
                    v101 = v95;
                    swift_release();
                    objc_msgSend(v29, sel_performUpdate_withCompletion_, v94, v100);

                    swift_unknownObjectRelease();
                    _Block_release(v100);
                    _Block_release(v94);
                    LOBYTE(v95) = swift_isEscapingClosureAtFileLocation();
                    swift_release();
                    swift_release();
                    swift_release();
                    if ((v95 & 1) == 0) {
                      return;
                    }
                  }
                  __break(1u);
                  goto LABEL_53;
                }
LABEL_50:
                swift_once();
                goto LABEL_39;
              }
LABEL_59:
              __break(1u);
              return;
            }
            goto LABEL_56;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
    }
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v19 = qword_26A5822A0;
  id v20 = v18;
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v10, (uint64_t)qword_26A582CE0);
  ((void (*)(char *, uint64_t, uint64_t))v11[2])(v16, v21, v10);
  uint64_t v22 = sub_25BF05448();
  os_log_type_t v23 = sub_25BF05728();
  if (os_log_type_enabled(v22, v23))
  {
    id v109 = v20;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v110 = a3;
    v111 = (void *)v10;
    uint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136446210;
    uint64_t aBlock = v26;
    if (a1) {
      uint64_t v27 = 0x756F726765726F66;
    }
    else {
      uint64_t v27 = 0x756F72676B636162;
    }
    uint64_t v112 = sub_25BEFEB58(v27, 0xEA0000000000646ELL, &aBlock);
    id v20 = v109;
    sub_25BF05828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25BEE3000, v22, v23, "Updating capture extension scene to %{public}s.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261178490](v26, -1, -1);
    uint64_t v28 = v25;
    a3 = v110;
    MEMORY[0x261178490](v28, -1, -1);

    ((void (*)(char *, void *))v11[1])(v16, v111);
  }
  else
  {

    ((void (*)(char *, uint64_t))v11[1])(v16, v10);
  }
  uint64_t v66 = swift_allocObject();
  *(unsigned char *)(v66 + 16) = a1 & 1;
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = sub_25BF01020;
  *(void *)(v67 + 24) = v66;
  v117 = sub_25BF01330;
  v118 = (void *)v67;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v114 = 1107296256;
  uint64_t v29 = &v115;
  v115 = sub_25BEFB830;
  v116 = &block_descriptor_126;
  v68 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v69 = swift_allocObject();
  *(void *)(v69 + 16) = a2;
  *(void *)(v69 + 24) = a3;
  v117 = sub_25BF01080;
  v118 = (void *)v69;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v114 = 1107296256;
  v115 = sub_25BEFB89C;
  v116 = &block_descriptor_132;
  uint64_t v70 = _Block_copy(&aBlock);
  sub_25BF01000(a2);
  swift_release();
  objc_msgSend(v20, sel_performUpdate_withCompletion_, v68, v70);

  _Block_release(v70);
  _Block_release(v68);
  LOBYTE(v70) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v70)
  {
    __break(1u);
LABEL_26:
    uint64_t v71 = (uint64_t)v109;
    if (qword_26A5822A0 == -1)
    {
LABEL_27:
      __swift_project_value_buffer((uint64_t)v111, (uint64_t)qword_26A582CE0);
      uint64_t v72 = sub_25BF05448();
      os_log_type_t v73 = sub_25BF05718();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl(&dword_25BEE3000, v72, v73, "Can't find the UI presentation manager", v74, 2u);
        MEMORY[0x261178490](v74, -1, -1);
      }

      if (v71) {
        ((void (*)(void))v71)();
      }

      return;
    }
LABEL_53:
    swift_once();
    goto LABEL_27;
  }
}

void sub_25BEFB6CC(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  void v5[4] = sub_25BF01108;
  void v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25BEEF9E8;
  v5[3] = &block_descriptor_147;
  uint64_t v3 = _Block_copy(v5);
  id v4 = a1;
  swift_release();
  BSDispatchMain();
  _Block_release(v3);
}

uint64_t sub_25BEFB798(char *a1)
{
  uint64_t result = BSDispatchQueueAssertMain();
  if (*(_DWORD *)&a1[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] == 2)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = a1;
    id v4 = a1;
    sub_25BEF9A80((uint64_t)sub_25BF01274, v3);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25BEFB830(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

void sub_25BEFB89C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_25BEFB914(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

uint64_t sub_25BEFB9B4(void *a1, void *a2, char a3, double a4, double a5)
{
  uint64_t v10 = swift_allocObject();
  *(double *)(v10 + 16) = a4;
  *(double *)(v10 + 24) = a5;
  *(void *)(v10 + 32) = a2;
  *(unsigned char *)(v10 + 40) = a3;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_25BF010E8;
  *(void *)(v11 + 24) = v10;
  v15[4] = sub_25BF01338;
  v15[5] = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  _OWORD v15[2] = sub_25BEFBE80;
  v15[3] = &block_descriptor_141;
  uint64_t v12 = _Block_copy(v15);
  id v13 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v12);
  _Block_release(v12);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a1) {
    __break(1u);
  }
  return result;
}

void sub_25BEFBB28(void *a1, void *a2, char a3)
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = a1;
    BSRectWithSize();
    objc_msgSend(v7, sel_setFrame_);
    uint64_t v22 = v8;
    objc_msgSend(v7, sel_setInterfaceOrientation_, objc_msgSend(a2, sel_interfaceOrientation));

    objc_msgSend(v7, sel_setInterfaceOrientationMode_, 1);
    id v9 = objc_msgSend(self, sel_mainConfiguration);
    objc_msgSend(v7, sel_setDisplayConfiguration_, v9);

    objc_msgSend(v7, sel_setForeground_, a3 & 1);
    objc_msgSend(v7, sel_setActivityMode_, 0);
    id v10 = objc_msgSend(a2, sel_traitCollection);
    id v11 = objc_msgSend(v10, sel_userInterfaceStyle);

    objc_msgSend(v7, sel_setUserInterfaceStyle_, v11);
    id v12 = objc_msgSend(v7, sel_otherSettings);
    id v13 = (void *)sub_25BF05518();
    objc_msgSend(v12, sel_setObject_forSetting_, v13, 20211529);

    id v14 = objc_msgSend(a2, sel_view);
    if (!v14)
    {
      __break(1u);
      return;
    }
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_window);

    if (v16)
    {
      id v17 = objc_msgSend(v16, sel_windowScene);

      if (v17)
      {
        id v18 = objc_msgSend(v17, sel_statusBarManager);

        if (v18)
        {
          objc_msgSend(v18, sel_defaultStatusBarHeightInOrientation_, 1);
          objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 1);
        }
      }
    }
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25BF05468();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A582CE0);
    uint64_t v22 = sub_25BF05448();
    os_log_type_t v20 = sub_25BF05718();
    if (os_log_type_enabled(v22, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_25BEE3000, v22, v20, "Can't update Capture Extension mutable scene settings.", v21, 2u);
      MEMORY[0x261178490](v21, -1, -1);
    }
  }
}

void sub_25BEFBE80(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_25BEFBECC(uint64_t a1, void *a2, char a3, char *a4)
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a4[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions];
    if ((v6 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25BF058A8();
      swift_bridgeObjectRelease();
      if (!v7) {
        return;
      }
    }
    else if (!*(void *)(v6 + 16))
    {
      return;
    }
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25BF05468();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A582CE0);
    id v9 = a4;
    id v10 = sub_25BF05448();
    os_log_type_t v11 = sub_25BF05728();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v19 = a2;
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)id v12 = 136315138;
      sub_25BEED774(0, &qword_26A5824C8);
      sub_25BEED5A0();
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_25BF05698();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      sub_25BEFEB58(v13, v15, &v20);
      sub_25BF05828();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BEE3000, v10, v11, "Setting transition context with launch actions: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v18, -1, -1);
      id v16 = v12;
      a2 = v19;
      MEMORY[0x261178490](v16, -1, -1);
    }
    else
    {
    }
    sub_25BEED774(0, &qword_26A5824C8);
    sub_25BEED5A0();
    swift_bridgeObjectRetain();
    id v17 = (void *)sub_25BF05668();
    swift_bridgeObjectRelease();
    objc_msgSend(a2, sel_setActions_, v17);
  }
}

id sub_25BEFC184(int a1, int a2, void (*a3)(void), int a4, id a5, uint64_t a6)
{
  if (a3) {
    a3();
  }
  id result = objc_msgSend(a5, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_secureCaptureSceneViewController_didCreateScene_, a5, a6);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_25BEFC218()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter];
  if (v2) {
    objc_msgSend(v2, sel_invalidate);
  }
  *(void *)&v0[v1] = 0;
  swift_unknownObjectRelease();
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  uint64_t v3 = OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView;
  id v4 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView];
  if (v4)
  {
    objc_msgSend(v4, sel_removeFromSuperview);
    id v5 = *(void **)&v0[v3];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&v0[v3] = 0;

  uint64_t v6 = OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView;
  uint64_t v7 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (v7)
  {
    objc_msgSend(v7, sel_removeFromSuperview);
    uint64_t v8 = *(void **)&v0[v6];
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)&v0[v6] = 0;

  uint64_t v9 = OBJC_IVAR___SESecureCaptureSceneViewController_scene;
  id v10 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_msgSend(v11, sel_layerManager);
    objc_msgSend(v12, sel_remove_, v0);

    objc_msgSend(v11, sel_invalidate);
    objc_msgSend(v11, sel_setDelegate_, 0);
    uint64_t v13 = *(void **)&v0[v9];
    *(void *)&v0[v9] = 0;

    id v14 = objc_msgSend(v0, sel_delegate);
    if (v14)
    {
      objc_msgSend(v14, sel_secureCaptureSceneViewController_didDestroyScene_, v0, v11);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25BF059C8()) {
    sub_25BEF60B8(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v15 = MEMORY[0x263F8EE88];
  }
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = OBJC_IVAR___SESecureCaptureSceneViewController_assertion;
  id v17 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_assertion];
  if (v17)
  {
    objc_msgSend(v17, sel_invalidate);
    uint64_t v18 = *(void **)&v0[v16];
  }
  else
  {
    uint64_t v18 = 0;
  }
  *(void *)&v0[v16] = 0;

  v0[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 1;
}

Swift::Void __swiftcall SESecureCaptureSceneViewController.invalidate()()
{
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  uint64_t v2 = OBJC_IVAR___SESecureCaptureSceneViewController_invalidated;
  if ((*(unsigned char *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_invalidated) & 1) == 0)
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25BF05468();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A582CE0);
    id v4 = sub_25BF05448();
    os_log_type_t v5 = sub_25BF05728();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25BEE3000, v4, v5, "Capture Extension Scene Invalidated", v6, 2u);
      MEMORY[0x261178490](v6, -1, -1);
    }

    *(unsigned char *)(v1 + v2) = 1;
    sub_25BEFC218();
  }
}

void __swiftcall SESecureCaptureSceneViewController.init(nibName:bundle:)(SESecureCaptureSceneViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    id v4 = (void *)sub_25BF05518();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void SESecureCaptureSceneViewController.init(nibName:bundle:)()
{
}

uint64_t sub_25BEFC668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_25BF05618();
  void v5[4] = sub_25BF05608();
  uint64_t v7 = sub_25BF055D8();
  return MEMORY[0x270FA2498](sub_25BEFC700, v7, v6);
}

uint64_t sub_25BEFC700()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v0[2];
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR___SESecureCaptureSceneViewController_currentPath);
  *(void *)(v2 + OBJC_IVAR___SESecureCaptureSceneViewController_currentPath) = v1;
  id v4 = v1;

  os_log_type_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25BEFC784(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  uint64_t v8 = sub_25BF05638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_25BF05618();
  id v9 = a2;
  id v10 = v7;
  uint64_t v11 = sub_25BF05608();
  id v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a2;
  sub_25BEE5D80((uint64_t)v6, (uint64_t)&unk_26A5829D8, (uint64_t)v12);
  return swift_release();
}

void sub_25BEFC8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25BF05378();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR___SESecureCaptureSceneViewController_assertion;
  if (!*(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_assertion])
  {
    id v11 = objc_msgSend(v2, sel__scene);
    if (v11
      && (id v12 = v11,
          id v13 = objc_msgSend(v11, sel_clientHandle),
          v12,
          v13)
      && (id v14 = objc_msgSend(v13, sel_processHandle), v13, v14)
      && (uint64_t v15 = (char *)objc_msgSend(v14, sel_identity), v14, v15))
    {
      uint64_t v70 = a2;
      uint64_t v71 = a1;
      if (qword_26A5822A0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_25BF05468();
      uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_26A582CE0);
      uint64_t v18 = v3;
      uint64_t v69 = v17;
      uint64_t v19 = sub_25BF05448();
      os_log_type_t v20 = sub_25BF05728();
      int v21 = v20;
      uint64_t v72 = v19;
      BOOL v22 = os_log_type_enabled(v19, v20);
      os_log_type_t v73 = v15;
      if (v22)
      {
        uint64_t v23 = swift_slowAlloc();
        int v67 = v21;
        uint64_t v24 = (uint8_t *)v23;
        uint64_t v68 = swift_slowAlloc();
        uint64_t aBlock = v68;
        *(_DWORD *)uint64_t v24 = 136315138;
        uint64_t v66 = v24;
        id v25 = objc_msgSend(objc_msgSend(v18, sel_extensionProvider, v24 + 4), sel_bundleIdentifier);
        swift_unknownObjectRelease();
        uint64_t v26 = sub_25BF05528();
        unint64_t v28 = v27;

        uint64_t v80 = sub_25BEFEB58(v26, v28, &aBlock);
        uint64_t v15 = v73;
        sub_25BF05828();

        swift_bridgeObjectRelease();
        uint64_t v29 = v72;
        id v30 = v66;
        _os_log_impl(&dword_25BEE3000, v72, (os_log_type_t)v67, "Acquiring secure capture process assertion for bundle identifier: %s", v66, 0xCu);
        uint64_t v31 = v68;
        swift_arrayDestroy();
        MEMORY[0x261178490](v31, -1, -1);
        MEMORY[0x261178490](v30, -1, -1);
      }
      else
      {
      }
      id v42 = objc_msgSend(self, sel_targetWithProcessIdentity_, v15);
      uint64_t v80 = MEMORY[0x263F8EE78];
      sub_25BF05368();
      uint64_t aBlock = 0;
      unint64_t v75 = 0xE000000000000000;
      sub_25BF05948();
      swift_bridgeObjectRelease();
      uint64_t aBlock = 0xD000000000000018;
      unint64_t v75 = 0x800000025BF08230;
      sub_25BF00AB8(&qword_26A582A00, MEMORY[0x263F07508]);
      sub_25BF05A18();
      sub_25BF05558();
      swift_bridgeObjectRelease();
      uint64_t v43 = (void *)sub_25BF05518();
      swift_bridgeObjectRelease();
      id v44 = self;
      id v45 = objc_msgSend(v44, sel_attributeWithTag_, v43);

      MEMORY[0x2611777F0]();
      if (*(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25BF055B8();
      }
      sub_25BF055C8();
      sub_25BF055A8();
      sub_25BEE6764((uint64_t)&unk_270967520);
      uint64_t v46 = (void *)sub_25BF054D8();
      swift_bridgeObjectRelease();
      unsigned int v47 = MKBGetDeviceLockState();

      if (v47 > 6 || ((1 << v47) & 0x46) == 0)
      {
        uint64_t v48 = sub_25BF05448();
        os_log_type_t v49 = sub_25BF05728();
        if (os_log_type_enabled(v48, v49))
        {
          id v50 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v50 = 0;
          _os_log_impl(&dword_25BEE3000, v48, v49, "Adding unlocked attribute tag for the process assertion", v50, 2u);
          MEMORY[0x261178490](v50, -1, -1);
        }

        id v51 = (void *)sub_25BF05518();
        id v52 = objc_msgSend(v44, sel_attributeWithTag_, v51);

        MEMORY[0x2611777F0]();
        if (*(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25BF055B8();
        }
        sub_25BF055C8();
        sub_25BF055A8();
      }
      id v53 = objc_allocWithZone(MEMORY[0x263F64408]);
      id v54 = v42;
      uint64_t v55 = (void *)sub_25BF05518();
      sub_25BEED774(0, &qword_26A582A08);
      id v56 = (void *)sub_25BF05588();
      swift_bridgeObjectRelease();
      id v57 = objc_msgSend(v53, sel_initWithExplanation_target_attributes_, v55, v54, v56);

      id v58 = *(void **)&v3[v10];
      *(void *)&v3[v10] = v57;

      uint64_t v59 = *(void **)&v3[v10];
      if (v59)
      {
        uint64_t v60 = v71;
        uint64_t v61 = v73;
        if (v71)
        {
          uint64_t v78 = v71;
          uint64_t v79 = v70;
          uint64_t aBlock = MEMORY[0x263EF8330];
          unint64_t v75 = 1107296256;
          uint64_t v76 = sub_25BEFD208;
          double v77 = &block_descriptor_35;
          id v62 = _Block_copy(&aBlock);
          id v63 = v59;
          sub_25BF01000(v60);
          swift_release();
        }
        else
        {
          id v64 = v59;
          id v62 = 0;
        }
        objc_msgSend(v59, sel_acquireWithInvalidationHandler_, v62);
        _Block_release(v62);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
      if (qword_26A5822A0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_25BF05468();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A582CE0);
      os_log_type_t v73 = v3;
      id v33 = sub_25BF05448();
      os_log_type_t v34 = sub_25BF05718();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t aBlock = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        id v37 = objc_msgSend(objc_msgSend(v73, sel_extensionProvider), sel_bundleIdentifier);
        swift_unknownObjectRelease();
        uint64_t v38 = sub_25BF05528();
        unint64_t v40 = v39;

        uint64_t v80 = sub_25BEFEB58(v38, v40, &aBlock);
        sub_25BF05828();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25BEE3000, v33, v34, "Failed to acquire secure capture process assertion for bundle identifier: %s, no process identity found for the scene", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261178490](v36, -1, -1);
        MEMORY[0x261178490](v35, -1, -1);
      }
      else
      {

        unint64_t v41 = v73;
      }
    }
  }
}

void sub_25BEFD208(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

id SESecureCaptureSceneViewController.sceneDidActivate(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25BF05468();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A582CE0);
  uint64_t v5 = sub_25BF05448();
  os_log_type_t v6 = sub_25BF05728();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_25BEE3000, v5, v6, "Capture Scene did activate.", v7, 2u);
    MEMORY[0x261178490](v7, -1, -1);
  }

  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 1;
  type metadata accessor for SecureCaptureSceneExtension();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for SecureCaptureSceneSessionPathHostComponent();
  id result = objc_msgSend(a1, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());
  if (result)
  {
    uint64_t v10 = swift_dynamicCastClass();
    if (v10)
    {
      uint64_t v11 = v10;
      v14[3] = type metadata accessor for SESecureCaptureSceneViewController(v10);
      void v14[4] = &off_270967CF0;
      v14[0] = v2;
      uint64_t v12 = v11 + OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate;
      swift_beginAccess();
      swift_unknownObjectRetain();
      id v13 = v2;
      sub_25BEFF450((uint64_t)v14, v12);
      swift_endAccess();
      return (id)swift_unknownObjectRelease_n();
    }
    else
    {
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

id SESecureCaptureSceneViewController.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  uint64_t v3 = v2;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  unint64_t v5 = 0x26A582000uLL;
  if (a2)
  {
    id v7 = a2;
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25BF05468();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A582CE0);
    id v9 = a2;
    id v10 = a2;
    uint64_t v11 = sub_25BF05448();
    os_log_type_t v12 = sub_25BF05728();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v50 = v14;
      *(_DWORD *)id v13 = 136446210;
      swift_getErrorValue();
      uint64_t v15 = sub_25BF05AA8();
      sub_25BEFEB58(v15, v16, &v50);
      unint64_t v5 = 0x26A582000;
      sub_25BF05828();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25BEE3000, v11, v12, "Capture Scene did deactivate with error: %{public}s.", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v17 = v14;
      uint64_t v3 = v2;
      MEMORY[0x261178490](v17, -1, -1);
      MEMORY[0x261178490](v13, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25BF05468();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A582CE0);
    uint64_t v19 = sub_25BF05448();
    os_log_type_t v20 = sub_25BF05728();
    if (os_log_type_enabled(v19, v20))
    {
      int v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v21 = 0;
      _os_log_impl(&dword_25BEE3000, v19, v20, "Capture Scene did deactivate.", v21, 2u);
      MEMORY[0x261178490](v21, -1, -1);
    }
  }
  if (*(void *)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene])
  {
    BOOL v22 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath];
    if (v22)
    {
      id v23 = v22;
      id v24 = objc_msgSend(v23, sel_finalizeTemporarySessionPathForExtension_, objc_msgSend(v3, sel_extensionProvider));

      swift_unknownObjectRelease();
      uint64_t v25 = *(void *)(v5 + 672);
      if (v24)
      {
        if (v25 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_25BF05468();
        __swift_project_value_buffer(v26, (uint64_t)qword_26A582CE0);
        id v27 = v23;
        unint64_t v28 = sub_25BF05448();
        os_log_type_t v29 = sub_25BF056F8();
        if (os_log_type_enabled(v28, v29))
        {
          id v30 = (uint8_t *)swift_slowAlloc();
          uint64_t v31 = (void *)swift_slowAlloc();
          *(_DWORD *)id v30 = 138412290;
          uint64_t v50 = (uint64_t)v27;
          id v32 = v27;
          sub_25BF05828();
          void *v31 = v22;

          id v33 = "Finalized path %@";
LABEL_33:
          _os_log_impl(&dword_25BEE3000, v28, v29, v33, v30, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5827E0);
          swift_arrayDestroy();
          MEMORY[0x261178490](v31, -1, -1);
          MEMORY[0x261178490](v30, -1, -1);

          return sub_25BEFDD3C(v3, (uint64_t)a1);
        }
      }
      else
      {
        if (v25 != -1) {
          swift_once();
        }
        uint64_t v48 = sub_25BF05468();
        __swift_project_value_buffer(v48, (uint64_t)qword_26A582CE0);
        id v27 = v23;
        unint64_t v28 = sub_25BF05448();
        os_log_type_t v29 = sub_25BF05718();
        if (os_log_type_enabled(v28, v29))
        {
          id v30 = (uint8_t *)swift_slowAlloc();
          uint64_t v31 = (void *)swift_slowAlloc();
          *(_DWORD *)id v30 = 138412290;
          uint64_t v50 = (uint64_t)v27;
          id v32 = v27;
          sub_25BF05828();
          void *v31 = v22;

          id v33 = "Failed to finalize current path %@";
          goto LABEL_33;
        }
      }

      return sub_25BEFDD3C(v3, (uint64_t)a1);
    }
    if (*(void *)(v5 + 672) != -1) {
      swift_once();
    }
    uint64_t v44 = sub_25BF05468();
    __swift_project_value_buffer(v44, (uint64_t)qword_26A582CE0);
    id v45 = sub_25BF05448();
    os_log_type_t v46 = sub_25BF05718();
    if (os_log_type_enabled(v45, v46))
    {
      unsigned int v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v47 = 0;
      _os_log_impl(&dword_25BEE3000, v45, v46, "No current path to finalize on scene deactivation...", v47, 2u);
      MEMORY[0x261178490](v47, -1, -1);
    }
  }
  else
  {
    if (*(void *)(v5 + 672) != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25BF05468();
    __swift_project_value_buffer(v34, (uint64_t)qword_26A582CE0);
    id v35 = a1;
    uint64_t v36 = sub_25BF05448();
    os_log_type_t v37 = sub_25BF05718();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v50 = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      id v40 = objc_msgSend(v35, sel_identifier);
      uint64_t v41 = sub_25BF05528();
      unint64_t v43 = v42;

      sub_25BEFEB58(v41, v43, &v50);
      sub_25BF05828();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BEE3000, v36, v37, "No Capture Scene found: %s", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v39, -1, -1);
      MEMORY[0x261178490](v38, -1, -1);
    }
    else
    {
    }
  }
  return sub_25BEFDD3C(v3, (uint64_t)a1);
}

id sub_25BEFDD3C(char *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)&a1[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath];
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  id v5 = objc_msgSend(objc_msgSend(a1, sel_extensionProvider), sel_containerBundleIdentifier);
  swift_unknownObjectRelease();
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = sub_25BF05528();
  uint64_t v8 = v7;

  if (v6 == 0xD000000000000010 && v8 == 0x800000025BF084C0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v9 = sub_25BF05A38();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_8:
    objc_msgSend(self, sel_removeContentsOfExtensionDataContainerForBundleProvider_, objc_msgSend(a1, sel_extensionProvider));
    swift_unknownObjectRelease();
  }
LABEL_9:
  id v10 = *(void **)&a1[OBJC_IVAR___SESecureCaptureSceneViewController_assertion];
  if (v10) {
    objc_msgSend(v10, sel_invalidate);
  }
  id result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    id v12 = result;
    if (objc_msgSend(result, sel_respondsToSelector_, sel_secureCaptureSceneViewController_sceneDidDeactivate_))objc_msgSend(v12, sel_secureCaptureSceneViewController_sceneDidDeactivate_, a1, a2); {
    return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

void SESecureCaptureSceneViewController.sceneContentStateDidChange(_:)(void *a1)
{
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BF05468();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A582CE0);
  id v3 = a1;
  uint64_t v4 = sub_25BF05448();
  os_log_type_t v5 = sub_25BF05728();
  uint64_t v6 = &off_2654A7000;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    objc_msgSend(v3, sel_contentState);
    type metadata accessor for FBSceneContentState(0);
    uint64_t v9 = sub_25BF05538();
    uint64_t v11 = sub_25BEFEB58(v9, v10, &v12);
    sub_25BF05828();

    uint64_t v6 = &off_2654A7000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25BEE3000, v4, v5, "Content state changed: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261178490](v8, -1, -1);
    MEMORY[0x261178490](v7, -1, -1);
  }
  else
  {
  }
  if (objc_msgSend(v3, (SEL)v6[200], v11) == (id)2) {
    sub_25BEFC8A4((uint64_t)sub_25BEFE198, 0);
  }
}

void sub_25BEFE198(void *a1, id a2)
{
  if (a2)
  {
    id v3 = a2;
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25BF05468();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A582CE0);
    id v5 = a2;
    id v6 = a2;
    oslog = sub_25BF05448();
    os_log_type_t v7 = sub_25BF05718();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v23 = v9;
      *(_DWORD *)uint64_t v8 = 136446210;
      swift_getErrorValue();
      uint64_t v10 = sub_25BF05AA8();
      sub_25BEFEB58(v10, v11, &v23);
      sub_25BF05828();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25BEE3000, oslog, v7, "Failed to acquire assertion: %{public}s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v9, -1, -1);
      MEMORY[0x261178490](v8, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26A5822A0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25BF05468();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A582CE0);
    oslog = a1;
    uint64_t v14 = sub_25BF05448();
    os_log_type_t v15 = sub_25BF05728();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v23 = v17;
      *(_DWORD *)unint64_t v16 = 136315138;
      id v18 = [oslog description];
      uint64_t v19 = sub_25BF05528();
      unint64_t v21 = v20;

      sub_25BEFEB58(v19, v21, &v23);
      sub_25BF05828();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BEE3000, v14, v15, "Runningboard assertion invalidated: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v17, -1, -1);
      MEMORY[0x261178490](v16, -1, -1);

      return;
    }
  }
}

void SESecureCaptureSceneViewController.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
}

void sub_25BEFE5C0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_25BEFE62C(void *a1, id a2)
{
  if (objc_msgSend(a2, sel_canSendResponse))
  {
    if (a1)
    {
      id v4 = a1;
      id v5 = (void *)sub_25BF052D8();
    }
    else
    {
      id v5 = 0;
    }
    id v6 = objc_msgSend(self, sel_responseForError_, v5);

    objc_msgSend(a2, sel_sendResponse_, v6);
  }
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidUpdateLayers(_:)(uint64_t a1)
{
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidStopTrackingLayers(_:)(uint64_t a1)
{
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidStartTrackingLayers(_:)(uint64_t a1)
{
}

void sub_25BEFE880(uint64_t a1, const char *a2)
{
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25BF05468();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A582CE0);
  oslog = sub_25BF05448();
  os_log_type_t v4 = sub_25BF05708();
  if (os_log_type_enabled(oslog, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_25BEE3000, oslog, v4, a2, v5, 2u);
    MEMORY[0x261178490](v5, -1, -1);
  }
}

void sub_25BEFE97C(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_26A5822A0;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25BF05468();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A582CE0);
  uint64_t v9 = sub_25BF05448();
  os_log_type_t v10 = sub_25BF05708();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_25BEE3000, v9, v10, a4, v11, 2u);
    MEMORY[0x261178490](v11, -1, -1);
  }
}

uint64_t sub_25BEFEAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_25BEFEB48(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25BEFEB58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25BEFEC2C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25BF00BB8((uint64_t)v12, *a3);
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
      sub_25BF00BB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25BEFEC2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25BF05838();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25BEFEDE8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25BF05978();
  if (!v8)
  {
    sub_25BF059A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25BF05A08();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25BEFEDE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BEFEE80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25BEFF060(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25BEFF060(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BEFEE80(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_25BEFEFF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25BF05958();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25BF059A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25BF05568();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25BF05A08();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25BF059A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25BEFEFF8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582A10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BEFF060(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582A10);
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
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25BF05A08();
  __break(1u);
  return result;
}

id sub_25BEFF1B0(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_scene] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_assertion] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector] = 0;
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue] = 0;
  *(_DWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider] = a1;
  id v5 = objc_allocWithZone(MEMORY[0x263F526F8]);
  unint64_t v6 = v2;
  swift_unknownObjectRetain();
  id v7 = objc_msgSend(v5, sel_initWithExtension_, a1);
  *(void *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant] = v7;
  *(void *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions] = a2;

  v9.receiver = v6;
  v9.super_class = (Class)SESecureCaptureSceneViewController;
  return objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5coderABSgSo7NSCoderC_tcfc_0()
{
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scene] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_assertion] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector] = 0;
  *(void *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue] = 0;
  *(_DWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = 0;
  swift_unknownObjectWeakInit();

  sub_25BF059B8();
  __break(1u);
}

uint64_t type metadata accessor for SESecureCaptureSceneViewController(uint64_t a1)
{
  return sub_25BEED774(a1, &qword_26A5828A0);
}

uint64_t sub_25BEFF450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5827D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE18sceneDidInvalidateyySo7FBSceneCF_0()
{
  *(unsigned char *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated) = 0;
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25BF05468();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A582CE0);
  oslog = sub_25BF05448();
  os_log_type_t v2 = sub_25BF05728();
  if (os_log_type_enabled(oslog, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_25BEE3000, oslog, v2, "Capture Scene did invalidate.", v3, 2u);
    MEMORY[0x261178490](v3, -1, -1);
  }
}

void sub_25BEFF5AC(uint64_t a1)
{
  if (qword_26A5822A0 != -1) {
    goto LABEL_115;
  }
  while (1)
  {
    uint64_t v2 = sub_25BF05468();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A582CE0);
    swift_bridgeObjectRetain_n();
    unint64_t v3 = sub_25BF05448();
    os_log_type_t v4 = sub_25BF05728();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      unint64_t v6 = (void *)swift_slowAlloc();
      id aBlock = v6;
      *(_DWORD *)id v5 = 136380675;
      sub_25BEED774(0, &qword_26A5824C8);
      sub_25BEED5A0();
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25BF05688();
      unint64_t v9 = v8;
      swift_bridgeObjectRelease();
      uint64_t v98 = sub_25BEFEB58(v7, v9, (uint64_t *)&aBlock);
      sub_25BF05828();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BEE3000, v3, v4, "Capture Scene did receive actions: %{private}s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261178490](v6, -1, -1);
      MEMORY[0x261178490](v5, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v80[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated]) {
      break;
    }
    uint64_t v87 = MEMORY[0x263F8EE88];
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_25BF05898();
      sub_25BEED774(0, &qword_26A5824C8);
      sub_25BEED5A0();
      sub_25BF056A8();
      a1 = v88;
      uint64_t v71 = v89;
      uint64_t v10 = v90;
      uint64_t v11 = v91;
      unint64_t v12 = v92;
    }
    else
    {
      uint64_t v13 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v71 = a1 + 56;
      uint64_t v10 = ~v13;
      uint64_t v14 = -v13;
      if (v14 < 64) {
        uint64_t v15 = ~(-1 << v14);
      }
      else {
        uint64_t v15 = -1;
      }
      unint64_t v12 = v15 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      uint64_t v11 = 0;
    }
    int64_t v70 = (unint64_t)(v10 + 64) >> 6;
    uint64_t v72 = a1;
    uint64_t v16 = v11;
    if (a1 < 0) {
      goto LABEL_13;
    }
LABEL_16:
    if (v12)
    {
      uint64_t v19 = (v12 - 1) & v12;
      unint64_t v20 = __clz(__rbit64(v12)) | (v16 << 6);
      uint64_t v18 = v16;
    }
    else
    {
      int64_t v21 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_114;
      }
      if (v21 >= v70) {
        goto LABEL_110;
      }
      unint64_t v22 = *(void *)(v71 + 8 * v21);
      uint64_t v18 = v16 + 1;
      if (!v22)
      {
        uint64_t v18 = v16 + 2;
        if (v16 + 2 >= v70) {
          goto LABEL_110;
        }
        unint64_t v22 = *(void *)(v71 + 8 * v18);
        if (!v22)
        {
          uint64_t v18 = v16 + 3;
          if (v16 + 3 >= v70) {
            goto LABEL_110;
          }
          unint64_t v22 = *(void *)(v71 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v16 + 4;
            if (v16 + 4 >= v70) {
              goto LABEL_110;
            }
            unint64_t v22 = *(void *)(v71 + 8 * v18);
            if (!v22)
            {
              uint64_t v23 = v16 + 5;
              while (v70 != v23)
              {
                unint64_t v22 = *(void *)(v71 + 8 * v23++);
                if (v22)
                {
                  uint64_t v18 = v23 - 1;
                  goto LABEL_31;
                }
              }
LABEL_110:
              sub_25BEF6428();
              swift_bridgeObjectRelease();
              return;
            }
          }
        }
      }
LABEL_31:
      uint64_t v19 = (v22 - 1) & v22;
      unint64_t v20 = __clz(__rbit64(v22)) + (v18 << 6);
    }
    id v17 = *(id *)(*(void *)(a1 + 48) + 8 * v20);
    if (!v17) {
      goto LABEL_110;
    }
LABEL_33:
    unint64_t v74 = v19;
    self;
    uint64_t v24 = swift_dynamicCastObjCClass();
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      id v26 = v17;
      id v27 = objc_msgSend(v80, sel_delegate);
      if (!v27)
      {

        goto LABEL_38;
      }
      unint64_t v28 = v27;
      uint64_t v73 = v18;
      id v29 = objc_msgSend(v25, sel_launchActions);
      sub_25BEED774(0, &qword_26A5824C8);
      sub_25BEED5A0();
      uint64_t v30 = sub_25BF05678();

      uint64_t v79 = v26;
      if ((v30 & 0xC000000000000001) != 0)
      {
        sub_25BF05898();
        sub_25BF056A8();
        uint64_t v30 = v93;
        uint64_t v77 = v94;
        uint64_t v31 = v95;
        uint64_t v32 = v96;
        unint64_t v33 = v97;
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v44 = -1 << *(unsigned char *)(v30 + 32);
        uint64_t v77 = v30 + 56;
        uint64_t v45 = ~v44;
        uint64_t v46 = -v44;
        if (v46 < 64) {
          uint64_t v47 = ~(-1 << v46);
        }
        else {
          uint64_t v47 = -1;
        }
        unint64_t v33 = v47 & *(void *)(v30 + 56);
        uint64_t v31 = v45;
      }
      int64_t v75 = (unint64_t)(v31 + 64) >> 6;
      while (1)
      {
        if (v30 < 0)
        {
          if (!sub_25BF058C8()) {
            goto LABEL_107;
          }
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v50 = aBlock;
          swift_unknownObjectRelease();
          a1 = v32;
          uint64_t v48 = v33;
          if (!v50) {
            goto LABEL_107;
          }
        }
        else
        {
          if (v33)
          {
            uint64_t v48 = (v33 - 1) & v33;
            unint64_t v49 = __clz(__rbit64(v33)) | (v32 << 6);
            a1 = v32;
          }
          else
          {
            int64_t v51 = v32 + 1;
            if (__OFADD__(v32, 1))
            {
              __break(1u);
              goto LABEL_113;
            }
            if (v51 >= v75) {
              goto LABEL_107;
            }
            unint64_t v52 = *(void *)(v77 + 8 * v51);
            a1 = v32 + 1;
            if (!v52)
            {
              a1 = v32 + 2;
              if (v32 + 2 >= v75) {
                goto LABEL_107;
              }
              unint64_t v52 = *(void *)(v77 + 8 * a1);
              if (!v52)
              {
                a1 = v32 + 3;
                if (v32 + 3 >= v75) {
                  goto LABEL_107;
                }
                unint64_t v52 = *(void *)(v77 + 8 * a1);
                if (!v52)
                {
                  a1 = v32 + 4;
                  if (v32 + 4 >= v75) {
                    goto LABEL_107;
                  }
                  unint64_t v52 = *(void *)(v77 + 8 * a1);
                  if (!v52)
                  {
                    uint64_t v53 = v32 + 5;
                    while (v75 != v53)
                    {
                      unint64_t v52 = *(void *)(v77 + 8 * v53++);
                      if (v52)
                      {
                        a1 = v53 - 1;
                        goto LABEL_68;
                      }
                    }
LABEL_107:
                    sub_25BEF6428();
                    swift_unknownObjectRelease();

                    a1 = v72;
                    uint64_t v18 = v73;
LABEL_108:
                    unint64_t v12 = v74;
                    uint64_t v16 = v18;
                    if ((a1 & 0x8000000000000000) == 0) {
                      goto LABEL_16;
                    }
LABEL_13:
                    if (!sub_25BF058C8()) {
                      goto LABEL_110;
                    }
                    sub_25BEED774(0, &qword_26A5824C8);
                    swift_unknownObjectRetain();
                    swift_dynamicCast();
                    id v17 = aBlock;
                    swift_unknownObjectRelease();
                    uint64_t v18 = v16;
                    uint64_t v19 = v12;
                    if (!v17) {
                      goto LABEL_110;
                    }
                    goto LABEL_33;
                  }
                }
              }
            }
LABEL_68:
            uint64_t v48 = (v52 - 1) & v52;
            unint64_t v49 = __clz(__rbit64(v52)) + (a1 << 6);
          }
          id v50 = *(id *)(*(void *)(v30 + 48) + 8 * v49);
          if (!v50) {
            goto LABEL_107;
          }
        }
        if (objc_msgSend(v28, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchWithAction_completion_))
        {
          uint64_t v54 = swift_allocObject();
          *(void *)(v54 + 16) = v25;
          uint64_t v85 = sub_25BF01270;
          uint64_t v86 = v54;
          id aBlock = (id)MEMORY[0x263EF8330];
          uint64_t v82 = 1107296256;
          BOOL v83 = sub_25BEFE5C0;
          v84 = &block_descriptor_32;
          uint64_t v55 = _Block_copy(&aBlock);
          id v56 = v79;
          swift_release();
          objc_msgSend(v28, sel_secureCaptureSceneViewController_requestsLaunchWithAction_completion_, v80, v50, v55);

          _Block_release(v55);
        }
        else
        {
          if (objc_msgSend(v28, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchWithAction_))objc_msgSend(v28, sel_secureCaptureSceneViewController_requestsLaunchWithAction_, v80, v50); {
        }
          }
        uint64_t v32 = a1;
        unint64_t v33 = v48;
      }
    }
LABEL_38:
    self;
    uint64_t v34 = swift_dynamicCastObjCClass();
    if (!v34) {
      goto LABEL_75;
    }
    id v35 = (void *)v34;
    id v36 = v17;
    id v37 = objc_msgSend(v80, sel_delegate);
    if (!v37)
    {

LABEL_75:
      sub_25BEF5284(&aBlock, v17);

      goto LABEL_108;
    }
    uint64_t v38 = v37;
    uint64_t v79 = v36;
    uint64_t v73 = v18;
    id v39 = objc_msgSend(v35, sel_launchActions);
    sub_25BEED774(0, &qword_26A5824C8);
    sub_25BEED5A0();
    uint64_t v40 = sub_25BF05678();

    if ((v40 & 0xC000000000000001) != 0)
    {
      sub_25BF05898();
      sub_25BF056A8();
      uint64_t v40 = v98;
      uint64_t v78 = v99;
      uint64_t v41 = v100;
      uint64_t v42 = v101;
      unint64_t v43 = v102;
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v57 = -1 << *(unsigned char *)(v40 + 32);
      uint64_t v78 = v40 + 56;
      uint64_t v58 = ~v57;
      uint64_t v59 = -v57;
      if (v59 < 64) {
        uint64_t v60 = ~(-1 << v59);
      }
      else {
        uint64_t v60 = -1;
      }
      unint64_t v43 = v60 & *(void *)(v40 + 56);
      uint64_t v41 = v58;
    }
    int64_t v76 = (unint64_t)(v41 + 64) >> 6;
    while (2)
    {
      if (v40 < 0)
      {
        if (!sub_25BF058C8()) {
          goto LABEL_107;
        }
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v63 = aBlock;
        swift_unknownObjectRelease();
        a1 = v42;
        uint64_t v61 = v43;
        if (!v63) {
          goto LABEL_107;
        }
        goto LABEL_105;
      }
      if (v43)
      {
        uint64_t v61 = (v43 - 1) & v43;
        unint64_t v62 = __clz(__rbit64(v43)) | (v42 << 6);
        a1 = v42;
LABEL_104:
        id v63 = *(id *)(*(void *)(v40 + 48) + 8 * v62);
        if (!v63) {
          goto LABEL_107;
        }
LABEL_105:
        if (objc_msgSend(v38, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchAfterTransitionCompletionWithAction_completion_))
        {
          uint64_t v67 = swift_allocObject();
          *(void *)(v67 + 16) = v35;
          uint64_t v85 = sub_25BF00B9C;
          uint64_t v86 = v67;
          id aBlock = (id)MEMORY[0x263EF8330];
          uint64_t v82 = 1107296256;
          BOOL v83 = sub_25BEFE5C0;
          v84 = &block_descriptor_26;
          uint64_t v68 = _Block_copy(&aBlock);
          id v69 = v79;
          swift_release();
          objc_msgSend(v38, sel_secureCaptureSceneViewController_requestsLaunchAfterTransitionCompletionWithAction_completion_, v80, v63, v68);

          _Block_release(v68);
        }
        else
        {
        }
        uint64_t v42 = a1;
        unint64_t v43 = v61;
        continue;
      }
      break;
    }
    int64_t v64 = v42 + 1;
    if (!__OFADD__(v42, 1))
    {
      if (v64 >= v76) {
        goto LABEL_107;
      }
      unint64_t v65 = *(void *)(v78 + 8 * v64);
      a1 = v42 + 1;
      if (!v65)
      {
        a1 = v42 + 2;
        if (v42 + 2 >= v76) {
          goto LABEL_107;
        }
        unint64_t v65 = *(void *)(v78 + 8 * a1);
        if (!v65)
        {
          a1 = v42 + 3;
          if (v42 + 3 >= v76) {
            goto LABEL_107;
          }
          unint64_t v65 = *(void *)(v78 + 8 * a1);
          if (!v65)
          {
            a1 = v42 + 4;
            if (v42 + 4 >= v76) {
              goto LABEL_107;
            }
            unint64_t v65 = *(void *)(v78 + 8 * a1);
            if (!v65)
            {
              uint64_t v66 = v42 + 5;
              do
              {
                if (v76 == v66) {
                  goto LABEL_107;
                }
                unint64_t v65 = *(void *)(v78 + 8 * v66++);
              }
              while (!v65);
              a1 = v66 - 1;
            }
          }
        }
      }
      uint64_t v61 = (v65 - 1) & v65;
      unint64_t v62 = __clz(__rbit64(v65)) + (a1 << 6);
      goto LABEL_104;
    }
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    swift_once();
  }
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5scene_27didUpdateClientSettingsWith03oldkL017transitionContextySo7FBSceneC_So08FBSScenekL4DiffCSo0rkL0CSo0r10TransitionP0CSgtF_0(void *a1, void *a2)
{
  if (qword_26A5822A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25BF05468();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A582CE0);
  id v5 = a2;
  id v6 = a1;
  id v7 = v5;
  id v8 = v6;
  unint64_t v9 = sub_25BF05448();
  os_log_type_t v10 = sub_25BF05728();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v11 = 136315394;
    id v12 = objc_msgSend(v7, sel_debugDescription);
    uint64_t v13 = sub_25BF05528();
    unint64_t v15 = v14;

    sub_25BEFEB58(v13, v15, &v23);
    sub_25BF05828();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    id v16 = objc_msgSend(v8, sel_settings);
    id v17 = objc_msgSend(v16, sel_debugDescription);

    uint64_t v18 = sub_25BF05528();
    unint64_t v20 = v19;

    sub_25BEFEB58(v18, v20, &v23);
    sub_25BF05828();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25BEE3000, v9, v10, "Capture Scene did receive new client settings. clientSettings: %s, scene settings: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261178490](v22, -1, -1);
    MEMORY[0x261178490](v11, -1, -1);
  }
  else
  {
  }
  id v21 = sub_25BEF7A50();
  objc_msgSend(v7, sel_evaluateWithInspector_context_, v21, 0);
}

uint64_t _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE52extensionAppProtectionAssistantShouldShieldDidChangeyySo012LCSExtensionijK0CF_0()
{
  uint64_t v1 = sub_25BF054A8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25BF054C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BEED774(0, (unint64_t *)&unk_26A5829E0);
  unint64_t v9 = (void *)sub_25BF05738();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_25BF00A7C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BEEF9E8;
  aBlock[3] = &block_descriptor_2;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  sub_25BF054B8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25BF00AB8((unint64_t *)&unk_26A582630, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5829F0);
  sub_25BF00B00();
  sub_25BF05868();
  MEMORY[0x2611779C0](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_25BF00704()
{
  unint64_t result = qword_26A5827E8;
  if (!qword_26A5827E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5827E8);
  }
  return result;
}

void *sub_25BF00758@<X0>(void *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  return result;
}

void sub_25BF00770(int *a1)
{
  int v1 = *a1;
  BSDispatchQueueAssertMain();
  sub_25BEF7E50(v1, 0);
}

char *keypath_get_selector_presentationMode()
{
  return sel_presentationMode;
}

id sub_25BF007B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_presentationMode);
  *a2 = result;
  return result;
}

id sub_25BF007E4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentationMode_, *a1);
}

char *keypath_get_selector_delegate()
{
  return sel_delegate;
}

id sub_25BF00804@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_delegate);
  *a2 = result;
  return result;
}

id sub_25BF00840(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDelegate_, *a1);
}

char *keypath_get_selector_extensionProvider()
{
  return sel_extensionProvider;
}

id sub_25BF00860@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_extensionProvider);
  *a2 = result;
  return result;
}

id sub_25BF0089C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExtensionProvider_, *a1);
}

ValueMetadata *type metadata accessor for PresentationMode()
{
  return &type metadata for PresentationMode;
}

id sub_25BF008C0()
{
  return sub_25BEF8BD4(*(void **)(v0 + 16));
}

uint64_t sub_25BF008DC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF008EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25BF00914(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BF0093C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BF00984(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = sub_25BEE5C8C;
  return sub_25BEFC668(a1, v4, v5, v7, v6);
}

uint64_t sub_25BF00A44()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25BF00A7C()
{
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25BF00AB8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25BF00B00()
{
  unint64_t result = qword_26A582640;
  if (!qword_26A582640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A5829F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A582640);
  }
  return result;
}

uint64_t sub_25BF00B5C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25BF00B94(uint64_t a1)
{
  sub_25BEF7B7C(a1, v1);
}

void sub_25BF00B9C(void *a1)
{
  sub_25BEFE62C(a1, *(id *)(v1 + 16));
}

uint64_t sub_25BF00BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25BF00C14()
{
  return MEMORY[0x270FA0238](v0, 33, 7);
}

id sub_25BF00C54()
{
  return sub_25BEF97EC(*(char **)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_25BF00C60()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

id sub_25BF00C98()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(unsigned char *)(v0 + 24) & 1) == 0);
}

void sub_25BF00CB4()
{
  sub_25BEFB6CC(*(void **)(v0 + 16));
}

void sub_25BF00CBC(unsigned __int8 a1)
{
  sub_25BEFA440(a1, *(char **)(v1 + 16));
}

void sub_25BF00CC8(void *a1, char a2)
{
  sub_25BEF9EDC(a1, a2 & 1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t objectdestroy_55Tm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25BF00D1C()
{
  sub_25BEF995C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_25BF00D28()
{
  swift_release();
  sub_25BF00D6C(*(id *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_25BF00D6C(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

uint64_t sub_25BF00D78()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

id sub_25BF00DAC(id result, char a2)
{
  if ((a2 & 1) == 0) {
    return result;
  }
  return result;
}

uint64_t sub_25BF00DB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_25BF00DF0()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_25BF00E20()
{
  unint64_t result = qword_26A582A18;
  if (!qword_26A582A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582A18);
  }
  return result;
}

uint64_t sub_25BF00E74()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25BF00EBC()
{
  sub_25BEFA278(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

id sub_25BF00EC8(void *a1)
{
  return sub_25BF013AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25BF00ED0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF00EE0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25BF00F08(void *a1)
{
  return sub_25BEFB9B4(a1, *(void **)(v1 + 32), *(unsigned char *)(v1 + 40), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_25BF00F18()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF00F28()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25BF00F60(uint64_t a1, void *a2)
{
  sub_25BEFBECC(a1, a2, *(unsigned char *)(v2 + 16), *(char **)(v2 + 24));
}

uint64_t sub_25BF00F6C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF00F7C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25BF00FA4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

id sub_25BF00FF4(int a1, int a2)
{
  return sub_25BEFC184(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(id *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_25BF01000(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25BF01010()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

id sub_25BF01020(void *a1)
{
  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_25BF01030()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF01040()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF01080()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_25BF010B0()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_25BF010E8(void *a1)
{
  sub_25BEFBB28(a1, *(void **)(v1 + 32), *(unsigned char *)(v1 + 40));
}

uint64_t sub_25BF010F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF01108()
{
  return sub_25BEFB798(*(char **)(v0 + 16));
}

unsigned char *_s17SceneCaptureErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BF011DCLL);
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

ValueMetadata *_s17SceneCaptureErrorOMa()
{
  return &_s17SceneCaptureErrorON;
}

unint64_t sub_25BF0121C()
{
  unint64_t result = qword_26A582A80;
  if (!qword_26A582A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582A80);
  }
  return result;
}

void sub_25BF0133C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F3F500]);
  uint64_t v1 = (void *)sub_25BF05518();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_26A582CF8 = (uint64_t)v2;
}

id sub_25BF013AC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25BF05378();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BF05368();
  sub_25BF05358();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v8 = (void *)sub_25BF05518();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82460]), sel_init);
  objc_msgSend(a1, sel_setSpecification_, v9);

  return objc_msgSend(a1, sel_setClientIdentity_, a2);
}

uint64_t sub_25BF01508()
{
  uint64_t v0 = sub_25BF05438();
  __swift_allocate_value_buffer(v0, qword_26A582AF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A582AF0);
  return sub_25BF05418();
}

void *sub_25BF015B4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25BF01664(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

void sub_25BF016B8(void **a1, void *a2)
{
  id v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_25BF0171C())()
{
  return j_j__swift_endAccess;
}

void *sub_25BF01778()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25BF017C8(void *a1)
{
  sub_25BF02FBC(a1);
}

void (*sub_25BF01800(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_25BF0186C;
}

void sub_25BF0186C(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (id *)(v3[3] + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
    swift_beginAccess();
    if (*v4) {
      objc_msgSend(*v4, sel_setRootViewController_, *(void *)(v3[3] + v3[4]));
    }
  }
  free(v3);
}

void *sub_25BF018F0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25BF01940(void *a1)
{
  sub_25BF02E08(a1);
}

void (*sub_25BF01978(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath;
  v3[6] = v1;
  v3[7] = v4;
  swift_beginAccess();
  return sub_25BF019E4;
}

void sub_25BF019E4(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if (a2) {
    goto LABEL_5;
  }
  uint64_t v4 = v3[6];
  id v5 = *(void **)(v4 + v3[7]);
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene);
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_25BF0308C;
  *(void *)(v8 + 24) = v7;
  v3[4] = sub_25BF00F7C;
  v3[5] = v8;
  *id v3 = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_25BEFB830;
  v3[3] = &block_descriptor_3;
  id v9 = _Block_copy(v3);
  id v10 = v5;
  id v11 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_updateClientSettings_, v9);

  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v9)
  {
    __break(1u);
  }
  else
  {
LABEL_5:
    free(v3);
  }
}

uint64_t sub_25BF01B8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_25BF01C18(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_25BF01D38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_25BF01DC0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_25BF01E50())()
{
  return j__swift_endAccess;
}

id CaptureSceneDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CaptureSceneDelegate.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582B30);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582B38);
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath] = 0;
  sub_25BF030D0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  id v12 = v0;
  sub_25BF05648();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v12[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts], v11, v8);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContextsProducerContinuation], v7, v16);

  uint64_t v13 = (objc_class *)type metadata accessor for CaptureSceneDelegate();
  v17.receiver = v12;
  v17.super_class = v13;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t sub_25BF021C0(void *a1, uint64_t a2, void *a3)
{
  return sub_25BF0315C(a1, a3);
}

id sub_25BF021C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = (id)swift_dynamicCastObjCProtocolConditional();
  if (result) {
    return objc_msgSend(result, sel_setCaptureSessionPath_, a3);
  }
  return result;
}

uint64_t sub_25BF022B0(uint64_t a1, uint64_t a2)
{
  return sub_25BF023E0(a2);
}

void sub_25BF02340()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  uint64_t v2 = *v1;
  *uint64_t v1 = 0;
}

uint64_t sub_25BF023E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A582C60);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25BF05898();
    sub_25BF030D0();
    sub_25BF03F48();
    uint64_t result = sub_25BF056A8();
    a1 = v28;
    uint64_t v25 = v29;
    uint64_t v7 = v30;
    uint64_t v8 = v31;
    unint64_t v9 = v32;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v25 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v12 = -v10;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & v11;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v8 = 0;
  }
  v23[1] = v7;
  v23[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v24 = (unint64_t)(v7 + 64) >> 6;
  v23[2] = MEMORY[0x263F8EE50] + 8;
  if (a1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v9)
    {
      uint64_t v14 = (v9 - 1) & v9;
      unint64_t v15 = __clz(__rbit64(v9)) | (v8 << 6);
      uint64_t v16 = v8;
      goto LABEL_29;
    }
    int64_t v19 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v19 >= v24) {
      return sub_25BEF6428();
    }
    unint64_t v20 = *(void *)(v25 + 8 * v19);
    uint64_t v16 = v8 + 1;
    if (!v20)
    {
      uint64_t v16 = v8 + 2;
      if (v8 + 2 >= v24) {
        return sub_25BEF6428();
      }
      unint64_t v20 = *(void *)(v25 + 8 * v16);
      if (!v20)
      {
        uint64_t v16 = v8 + 3;
        if (v8 + 3 >= v24) {
          return sub_25BEF6428();
        }
        unint64_t v20 = *(void *)(v25 + 8 * v16);
        if (!v20)
        {
          uint64_t v16 = v8 + 4;
          if (v8 + 4 >= v24) {
            return sub_25BEF6428();
          }
          unint64_t v20 = *(void *)(v25 + 8 * v16);
          if (!v20)
          {
            uint64_t v16 = v8 + 5;
            if (v8 + 5 >= v24) {
              return sub_25BEF6428();
            }
            unint64_t v20 = *(void *)(v25 + 8 * v16);
            if (!v20)
            {
              uint64_t v21 = v8 + 6;
              while (v24 != v21)
              {
                unint64_t v20 = *(void *)(v25 + 8 * v21++);
                if (v20)
                {
                  uint64_t v16 = v21 - 1;
                  goto LABEL_28;
                }
              }
              return sub_25BEF6428();
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_29:
    id v18 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    if (!v18) {
      return sub_25BEF6428();
    }
    while (1)
    {
      id v27 = v18;
      id v22 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A582B38);
      sub_25BF05658();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v8 = v16;
      unint64_t v9 = v14;
      if ((a1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v17 = sub_25BF058C8();
      if (v17)
      {
        uint64_t v26 = v17;
        sub_25BF030D0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v18 = v27;
        swift_unknownObjectRelease();
        uint64_t v16 = v8;
        uint64_t v14 = v9;
        if (v18) {
          continue;
        }
      }
      return sub_25BEF6428();
    }
  }
  __break(1u);
  return result;
}

id CaptureSceneDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaptureSceneDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SecureCaptureExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_25BF053F8();
}

uint64_t SecureCaptureUIScene.session.getter()
{
  return swift_retain();
}

id SecureCaptureUIScene.init(content:)@<X0>(void (*a1)(id)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - v11;
  if (qword_26A5822B0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25BF05438();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A582AF0);
  uint64_t v14 = sub_25BF05428();
  uint64_t v29 = v15;
  uint64_t v30 = v14;
  id v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CaptureSceneDelegate()), sel_init);
  type metadata accessor for SecureCaptureSession(0);
  swift_allocObject();
  uint64_t v17 = (char *)v16;
  id v18 = SecureCaptureSession.init(sceneDelegate:)(v17);
  qword_26A582270 = (uint64_t)v18;
  swift_retain_n();
  swift_release();
  uint64_t v32 = a2;
  a1(v18);
  sub_25BF05498();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, a3);
  int64_t v19 = (void *)sub_25BF05488();
  id result = objc_msgSend(v19, sel_view);
  if (result)
  {
    uint64_t v21 = result;
    id v22 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v21, sel_setBackgroundColor_, v22);

    uint64_t v23 = &v17[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController];
    swift_beginAccess();
    int64_t v24 = *(void **)v23;
    *(void *)uint64_t v23 = v19;
    id v25 = v19;

    uint64_t v26 = (id *)&v17[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
    swift_beginAccess();
    if (*v26) {
      objc_msgSend(*v26, sel_setRootViewController_, *(void *)v23);
    }
    swift_release();

    swift_release();
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, a3);
    uint64_t v28 = v30;
    id v27 = v31;
    void *v31 = v18;
    v27[1] = v28;
    v27[2] = v29;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SecureCaptureUIScene.body.getter(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(a1 + 16);
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v4;
  *(void *)(v6 + 48) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  return sub_25BF053E8();
}

uint64_t sub_25BF02DF8()
{
  return 0;
}

void sub_25BF02E08(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  uint64_t v6 = *v3;
  if (*v3)
  {
    uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene);
    if (v7)
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v6;
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_25BF04068;
      *(void *)(v9 + 24) = v8;
      aBlock[4] = sub_25BF01330;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_25BEFB830;
      aBlock[3] = &block_descriptor_44;
      uint64_t v10 = _Block_copy(aBlock);
      id v11 = v6;
      id v12 = v7;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_updateClientSettings_, v10);

      _Block_release(v10);
      LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if (v10) {
        __break(1u);
      }
    }
  }
}

id sub_25BF02FBC(void *a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
  swift_beginAccess();
  uint64_t v4 = (void *)*v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  uint64_t v6 = (id *)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  id result = *v6;
  if (*v6) {
    return objc_msgSend(result, sel_setRootViewController_, *v3);
  }
  return result;
}

uint64_t sub_25BF03054()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25BF0308C(uint64_t a1, uint64_t a2)
{
  return sub_25BF021C8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_25BF030A8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_25BF030D0()
{
  unint64_t result = qword_26A582B40;
  if (!qword_26A582B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A582B40);
  }
  return result;
}

uint64_t type metadata accessor for CaptureSceneDelegate()
{
  uint64_t result = qword_26A582BB8;
  if (!qword_26A582BB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BF0315C(void *a1, void *a2)
{
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    uint64_t v6 = result;
    id v7 = objc_allocWithZone(MEMORY[0x263F82E88]);
    id v8 = a1;
    id v9 = objc_msgSend(v7, sel_initWithWindowScene_, v6);
    uint64_t v10 = &v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController];
    swift_beginAccess();
    objc_msgSend(v9, sel_setRootViewController_, *(void *)v10);
    objc_msgSend(v9, sel_makeKeyAndVisible);
    id v11 = objc_msgSend(a2, sel_URLContexts);
    sub_25BF030D0();
    sub_25BF03F48();
    uint64_t v12 = sub_25BF05678();

    sub_25BF023E0(v12);
    swift_bridgeObjectRelease();
    uint64_t v13 = &off_2654A7000;
    id v14 = objc_msgSend(v8, sel__FBSScene);
    type metadata accessor for SecureCaptureSceneExtension();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    type metadata accessor for SecureCaptureSceneStatusBarHostComponent();
    id v16 = objc_msgSend(v14, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());

    if (v16)
    {
      uint64_t v17 = swift_dynamicCastClass();
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v34 = (void *)type metadata accessor for CaptureSceneDelegate();
        id v35 = (uint64_t (*)())&off_270968620;
        v33[0] = v2;
        uint64_t v19 = v18 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
        swift_beginAccess();
        unint64_t v20 = v2;
        sub_25BF03FC0((uint64_t)v33, v19);
        swift_endAccess();
      }
      swift_unknownObjectRelease();
    }
    uint64_t v21 = (id *)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath];
    swift_beginAccess();
    if (*v21)
    {
      id v22 = *v21;
      id v23 = objc_msgSend(v8, sel__FBSScene);
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v22;
      uint64_t v25 = swift_allocObject();
      uint64_t v26 = sub_25BF04068;
      *(void *)(v25 + 16) = sub_25BF04068;
      *(void *)(v25 + 24) = v24;
      id v35 = sub_25BF01330;
      uint64_t v36 = v25;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 1107296256;
      v33[2] = sub_25BEFB830;
      uint64_t v34 = &block_descriptor_33;
      id v27 = _Block_copy(v33);
      id v28 = v22;
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_updateClientSettings_, v27);

      _Block_release(v27);
      LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
      uint64_t result = swift_release();
      if (v23)
      {
        __break(1u);
        return result;
      }
      uint64_t v13 = &off_2654A7000;
    }
    else
    {
      uint64_t v26 = 0;
    }
    id v29 = objc_msgSend(v8, (SEL)v13[149], v33[0]);
    uint64_t v30 = *(void **)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene];
    *(void *)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene] = v29;

    uint64_t v31 = (void **)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
    swift_beginAccess();
    uint64_t v32 = *v31;
    void *v31 = v9;

    return sub_25BF03FA0((uint64_t)v26);
  }
  return result;
}

uint64_t sub_25BF03548()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25BF035D0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t sub_25BF0363C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void *sub_25BF0367C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + 32) + 24);
  uint64_t v2 = (void **)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_25BEE6040(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_25BF036E0(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25BF0371C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_25BF03760@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window, a2);
}

id sub_25BF03770@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController, a2);
}

void sub_25BF0377C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_25BF02FBC(v1);
}

id sub_25BF037CC@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath, a2);
}

id keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  uint64_t v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_25BF03838(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_25BF02E08(v1);
}

uint64_t sub_25BF03890()
{
  return type metadata accessor for CaptureSceneDelegate();
}

void sub_25BF03898()
{
  sub_25BF03CDC(319, &qword_26A582BC8, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_25BF03CDC(319, qword_26A582BD0, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for CaptureSceneDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CaptureSceneDelegate);
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.scene(_:willConnectTo:options:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.scene(_:openURLContexts:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sceneDidDisconnect(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

void sub_25BF03CDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_25BF030D0();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t dispatch thunk of SecureCaptureExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25BF03D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25BF03D5C()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_25BF03D98(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25BF03DD8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *sub_25BF03E54(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25BF03E9C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25BF03EE4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SecureCaptureUIScene()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BF03F3C()
{
  return MEMORY[0x263F04E30];
}

unint64_t sub_25BF03F48()
{
  unint64_t result = qword_26A582C58;
  if (!qword_26A582C58)
  {
    sub_25BF030D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A582C58);
  }
  return result;
}

uint64_t sub_25BF03FA0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25BF03FB0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF03FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BF04028()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id SESecureCaptureOpenApplicationAction.init(url:responder:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_25BF052E8();
  id v6 = objc_msgSend(v4, sel_initWithURL_responder_, v5, a2);

  uint64_t v7 = sub_25BF05328();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  uint64_t v3 = v2;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  uint64_t v7 = (void *)sub_25BF052E8();
  objc_msgSend(v6, sel_setObject_forSetting_, v7, 0);

  v11.receiver = v3;
  v11.super_class = (Class)SESecureCaptureOpenApplicationAction;
  uint64_t v8 = objc_msgSendSuper2(&v11, sel_initWithInfo_responder_, v6, a2);

  id v9 = sub_25BF05328();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

id SESecureCaptureOpenApplicationAction.init(userActivity:responder:)(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserActivity_responder_, a1, a2);

  return v4;
}

{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t inited;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  void aBlock[7];

  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25BF06DA0;
  id v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  objc_msgSend(a1, sel_setNeedsSave_, 0);
  sub_25BEE6620(MEMORY[0x263F8EE78]);
  uint64_t v7 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  aBlock[4] = sub_25BEF48C0;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BEE6D2C;
  aBlock[3] = &block_descriptor_4;
  id v9 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v9);
  _Block_release(v9);

  swift_beginAccess();
  if (*(void *)(v6 + 16))
  {
    v22.receiver = v2;
    v22.super_class = (Class)SESecureCaptureOpenApplicationAction;
    uint64_t v10 = objc_msgSendSuper2(&v22, sel_initWithInfo_responder_, 0, 0);
LABEL_5:
    uint64_t v12 = v10;
    swift_release();
    swift_release();

    return v12;
  }
  swift_beginAccess();
  id v11 = *(void *)(v5 + 24);
  if (v11 >> 60 == 15)
  {
    v25.receiver = v2;
    v25.super_class = (Class)SESecureCaptureOpenApplicationAction;
    uint64_t v10 = objc_msgSendSuper2(&v25, sel_initWithInfo_responder_, 0, 0);
    goto LABEL_5;
  }
  id v14 = *(void *)(v5 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582730);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BF06C10;
  *(void *)(inited + 32) = 7;
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = v11;
  id v16 = sub_25BEED424((void *)inited);
  swift_setDeallocating();
  sub_25BEED528(v14, v11);
  sub_25BEED528(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582738);
  swift_arrayDestroy();
  sub_25BEF48E0(v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = objc_allocWithZone(MEMORY[0x263F823E0]);
  uint64_t v18 = (void *)sub_25BF054D8();
  swift_bridgeObjectRelease();
  uint64_t v19 = objc_msgSend(v17, sel_initWithSettings_, v18);

  if (v19)
  {
    unint64_t v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
    objc_msgSend(v20, sel_setObject_forSetting_, v19, 1);
    v23.receiver = v2;
    v23.super_class = (Class)SESecureCaptureOpenApplicationAction;
    uint64_t v21 = v20;
    uint64_t v12 = objc_msgSendSuper2(&v23, sel_initWithInfo_responder_, v21, a2);

    sub_25BEEDAB4(v14, v11);
    swift_release();
    swift_release();
  }
  else
  {
    v24.receiver = v2;
    v24.super_class = (Class)SESecureCaptureOpenApplicationAction;
    uint64_t v12 = objc_msgSendSuper2(&v24, sel_initWithInfo_responder_, 0, 0);

    sub_25BEEDAB4(v14, v11);
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_25BF04844()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_25BEED970(*(void *)(v0 + 16), v1);
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BF0488C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BF048C4()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void __swiftcall SESecureCaptureOpenApplicationAction.init(coder:)(SESecureCaptureOpenApplicationAction_optional *__return_ptr retstr, NSCoder coder)
{
}

id SESecureCaptureOpenApplicationAction.init(coder:)(void *a1)
{
  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  id v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

id SESecureCaptureOpenApplicationAction.init(xpcDictionary:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  id v1;
  objc_super v3;

  v3.super_class = (Class)SESecureCaptureOpenApplicationAction;
  id v1 = objc_msgSendSuper2(&v3, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t SESecureCaptureOpenApplicationAction.launchActions.getter()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582600);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v8 = sub_25BF05328();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25BF059C8()) {
    sub_25BEF60B8(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v12 = MEMORY[0x263F8EE88];
  }
  uint64_t v29 = v12;
  id v13 = objc_msgSend(v1, sel_info);
  if (!v13)
  {
    long long v27 = 0u;
    long long v28 = 0u;
LABEL_12:
    sub_25BEEDD1C((uint64_t)&v27, &qword_26A582740);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_13;
  }
  id v14 = v13;
  id v15 = objc_msgSend(v13, sel_objectForSetting_, 0);

  if (v15)
  {
    sub_25BF05848();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  sub_25BEF6050((uint64_t)&v25, (uint64_t)&v27);
  if (!*((void *)&v28 + 1)) {
    goto LABEL_12;
  }
  int v16 = swift_dynamicCast();
  uint64_t v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v17(v7, v16 ^ 1u, 1, v8);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v18(v7, 1, v8) == 1)
  {
LABEL_13:
    sub_25BEEDD1C((uint64_t)v7, &qword_26A582600);
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
  v17(v5, 0, 1, v8);
  if (v18(v5, 1, v8) == 1)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = (void *)sub_25BF052E8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F83E68]), sel_initWithURL_, v19);

  if (v24)
  {
    sub_25BEF5284(&v27, v24);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_14:
  id v20 = objc_msgSend(v1, sel_info, v25, v26);
  if (!v20)
  {
    long long v27 = 0u;
    long long v28 = 0u;
LABEL_22:
    sub_25BEEDD1C((uint64_t)&v27, &qword_26A582740);
    return v29;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v20, sel_objectForSetting_, 1);

  if (v22)
  {
    sub_25BF05848();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  sub_25BEF6050((uint64_t)&v25, (uint64_t)&v27);
  if (!*((void *)&v28 + 1)) {
    goto LABEL_22;
  }
  sub_25BEED774(0, &qword_26A582748);
  if (swift_dynamicCast())
  {
    sub_25BEF5284(&v27, (void *)v25);
  }
  return v29;
}

id SESecureCaptureOpenApplicationAction.init(info:responder:)(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, a1, a2);

  return v4;
}

void SESecureCaptureOpenApplicationAction.init(info:responder:)()
{
}

id SESecureCaptureOpenApplicationAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (a3)
  {
    v11[4] = a3;
    v11[5] = a4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_25BEF4230;
    v11[3] = &block_descriptor_9_0;
    uint64_t v8 = _Block_copy(v11);
    swift_release();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v8, a5);

  _Block_release(v8);
  return v9;
}

void SESecureCaptureOpenApplicationAction.init(info:timeout:forResponseOn:withHandler:)()
{
}

uint64_t type metadata accessor for SESecureCaptureOpenApplicationAction(uint64_t a1)
{
  return sub_25BEED774(a1, &qword_26A582CD0);
}

uint64_t sub_25BF05268()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25BF05278()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25BF05288()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_25BF05298()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25BF052A8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25BF052B8()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_25BF052C8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25BF052D8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25BF052E8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25BF052F8()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25BF05308()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_25BF05318()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25BF05328()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25BF05338()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25BF05348()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25BF05358()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25BF05368()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25BF05378()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25BF05388()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25BF05398()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25BF053A8()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_25BF053B8()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_25BF053C8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25BF053D8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25BF053E8()
{
  return MEMORY[0x270EEB950]();
}

uint64_t sub_25BF053F8()
{
  return MEMORY[0x270EEB970]();
}

uint64_t sub_25BF05408()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_25BF05418()
{
  return MEMORY[0x270EEB998]();
}

uint64_t sub_25BF05428()
{
  return MEMORY[0x270EEB9A0]();
}

uint64_t sub_25BF05438()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_25BF05448()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BF05458()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BF05468()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BF05478()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t sub_25BF05488()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_25BF05498()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_25BF054A8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25BF054B8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25BF054C8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25BF054D8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25BF054E8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25BF054F8()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_25BF05508()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25BF05518()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BF05528()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BF05538()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25BF05548()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BF05558()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25BF05568()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BF05578()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25BF05588()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25BF05598()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25BF055A8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25BF055B8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25BF055C8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25BF055D8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BF055E8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25BF055F8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25BF05608()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25BF05618()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25BF05628()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25BF05638()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25BF05648()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_25BF05658()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25BF05668()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25BF05678()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25BF05688()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25BF05698()
{
  return MEMORY[0x270F9DF00]();
}

uint64_t sub_25BF056A8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25BF056B8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25BF056C8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25BF056D8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25BF056E8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25BF056F8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25BF05708()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25BF05718()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BF05728()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25BF05738()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25BF05748()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25BF05758()
{
  return MEMORY[0x270FA0E08]();
}

uint64_t sub_25BF05768()
{
  return MEMORY[0x270FA0E20]();
}

uint64_t sub_25BF05778()
{
  return MEMORY[0x270FA0E88]();
}

uint64_t sub_25BF05788()
{
  return MEMORY[0x270FA0E90]();
}

uint64_t sub_25BF05798()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25BF057A8()
{
  return MEMORY[0x270FA0EA8]();
}

uint64_t sub_25BF057B8()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25BF057C8()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_25BF057D8()
{
  return MEMORY[0x270FA0ED8]();
}

uint64_t sub_25BF057E8()
{
  return MEMORY[0x270FA0F70]();
}

uint64_t sub_25BF057F8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25BF05808()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25BF05818()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25BF05828()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BF05838()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BF05848()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25BF05858()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_25BF05868()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25BF05878()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25BF05888()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25BF05898()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25BF058A8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25BF058B8()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25BF058C8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25BF058D8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25BF058E8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25BF05908()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25BF05918()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25BF05928()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25BF05938()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25BF05948()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25BF05958()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BF05968()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25BF05978()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BF05988()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25BF05998()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_25BF059A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BF059B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BF059C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25BF059D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25BF059E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BF059F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BF05A08()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BF05A18()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25BF05A28()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25BF05A38()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BF05A58()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25BF05A68()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25BF05A78()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BF05AA8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25BF05AB8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BF05AC8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BF05AD8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BF05AE8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BF05AF8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25BF05B08()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BF05B18()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BF05B28()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25BF05B38()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BF05B48()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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