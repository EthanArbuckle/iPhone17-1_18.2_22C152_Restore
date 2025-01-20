uint64_t WallpaperMetalCoordination.EditingCoordinator.renderingType.getter()
{
  uint64_t v0;

  return *(void *)(v0 + 16);
}

uint64_t sub_26153E1E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 32;
  swift_beginAccess();
  return sub_261548938(v3, a2, (uint64_t *)&unk_26A921640);
}

uint64_t sub_26153E238(uint64_t a1, void *a2)
{
  sub_261548938(a1, (uint64_t)v5, (uint64_t *)&unk_26A921640);
  uint64_t v3 = *a2 + 32;
  swift_beginAccess();
  sub_261548020((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_26153E2A0@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_261548938(v1 + 32, a1, (uint64_t *)&unk_26A921640);
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

uint64_t static WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle.== infix(_:_:)(void **a1, void **a2)
{
  v2 = *a1;
  uint64_t v3 = *a2;
  if (!v2)
  {
    if (!v3)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    return 0;
  }
  if (!v3) {
    return 0;
  }
  return sub_26153E394(v2, v3);
}

uint64_t sub_26153E394(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_261569B40(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_261569B40() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_26153E45C(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (!v2)
  {
    if (!v3)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    return 0;
  }
  if (!v3) {
    return 0;
  }
  return sub_26153E394(v2, v3);
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.lookSelectionStyle.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 72);
  return swift_bridgeObjectRetain();
}

uint64_t sub_26153E4C4()
{
  uint64_t v0 = sub_261569610();
  __swift_allocate_value_buffer(v0, qword_26A9215D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A9215D8);
  return sub_261569600();
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.__allocating_init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v16 = swift_allocObject();
  WallpaperMetalCoordination.EditingCoordinator.init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v9 = v8;
  *(_OWORD *)(v8 + 32) = 0u;
  *(_OWORD *)(v8 + 48) = 0u;
  uint64_t v14 = v8 + 32;
  uint64_t v15 = *a8;
  *(_OWORD *)(v14 + 272) = 0u;
  *(_OWORD *)(v14 + 288) = 0u;
  *(_DWORD *)(v14 + 304) = 0;
  *(unsigned char *)(v14 + 308) = -1;
  *(void *)(v14 + 312) = 0;
  *(void *)(v14 + 320) = 0;
  *(unsigned char *)(v14 + 328) = 1;
  *(void *)(v14 + 344) = 0;
  *(void *)(v14 + 352) = 0;
  *(void *)(v14 + 336) = 0x3FF0000000000000;
  *(void *)(v14 + 48) = a1;
  *(void *)(v14 + 56) = a2;
  *(void *)(v14 - 16) = a3;
  *(void *)(v14 - 8) = a4;
  *(void *)(v14 + 120) = a6;
  *(void *)(v14 + 128) = a7;
  *(void *)(v14 + 32) = 0;
  *(void *)(v14 + 40) = v15;
  uint64_t v16 = qword_26A921618;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A9239B8;
  if (qword_26A9239B8)
  {
    uint64_t v43 = a6;
    uint64_t v18 = *(void *)(qword_26A9239B8
                    + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device);
    *(void *)(v9 + 96) = v18;
    *(void *)(v9 + 104) = *(void *)(v17
                                      + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue);
    v19 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 8);
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v20 = v19(a3, a4);
    v21 = (CGColorSpace *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
    id v22 = objc_allocWithZone((Class)type metadata accessor for WallpaperMetalView(0));
    v23 = sub_261548EF4(v18, v20, v21);
    *(void *)(v9 + 112) = v23;
    v23[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 0;
    id v24 = objc_msgSend((id)swift_unknownObjectRetain(), sel_traitCollection);
    if (v24)
    {
      v25 = v24;
      id v26 = objc_msgSend(v24, sel_userInterfaceStyle);

      BOOL v27 = v26 == (id)2;
    }
    else
    {
      BOOL v27 = 0;
    }
    id v29 = objc_msgSend(a5, sel_deviceOrientation);
    swift_unknownObjectRelease();
    *(unsigned char *)(v9 + 168) = 0;
    *(void *)(v9 + 176) = 0;
    *(unsigned char *)(v9 + 184) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v9 + 192) = _Q0;
    *(unsigned char *)(v9 + 208) = v27;
    *(unsigned char *)(v9 + 209) = 0;
    *(void *)(v9 + 216) = v43;
    *(void *)(v9 + 224) = a7;
    *(void *)(v9 + 232) = 0;
    *(void *)(v9 + 240) = 0;
    *(_DWORD *)(v9 + 248) = 0;
    *(unsigned char *)(v9 + 252) = 0;
    *(void *)(v9 + 256) = v29;
    *(_OWORD *)(v9 + 264) = 0u;
    *(_OWORD *)(v9 + 280) = 0u;
    *(unsigned char *)(v9 + 296) = 0;
    v35 = (void *)MEMORY[0x263F8EE78];
    *(void *)(v9 + 120) = sub_26153EC44(MEMORY[0x263F8EE78], &qword_26A9217B8);
    *(void *)(v9 + 128) = sub_261547CCC(v35);
    *(void *)(v9 + 136) = sub_26153EC44((uint64_t)v35, &qword_26A9217B0);
    *(void *)(v9 + 144) = sub_261547DCC(v35);
    swift_bridgeObjectRelease();
    if (v15)
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = v19(a3, a4);
      if ((unint64_t)(v36 - 70) <= 0x2D && ((1 << (v36 - 70)) & 0x200000000C03) != 0) {
        goto LABEL_13;
      }
      sub_2615699E0();
      sub_261569760();
      v19(a3, a4);
      type metadata accessor for MTLPixelFormat(0);
      sub_261569A70();
      sub_261569760();
      sub_261569A90();
      __break(1u);
    }
    swift_bridgeObjectRelease();
LABEL_13:
    v37 = *(char **)(v9 + 112);
    uint64_t v38 = swift_allocObject();
    swift_weakInit();
    v39 = (uint64_t (**)(void *))&v37[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    uint64_t v40 = *(void *)&v37[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    *v39 = sub_261547F18;
    v39[1] = (uint64_t (*)(void *))v38;
    v41 = v37;
    swift_retain();
    sub_261547F20(v40);
    swift_release();

    swift_release();
    swift_unknownObjectRelease();
    return v9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_261544B2C();
  swift_allocError();
  unsigned char *v28 = 0;
  swift_willThrow();
  swift_unknownObjectRelease();
  sub_261544B80(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_261544BE0(*(void *)(v9 + 304), *(void *)(v9 + 312), *(void *)(v9 + 320), *(void *)(v9 + 328), *(unsigned int *)(v14 + 304) | ((unint64_t)*(unsigned __int8 *)(v14 + 308) << 32));

  type metadata accessor for WallpaperMetalCoordination.EditingCoordinator();
  swift_deallocPartialClassInstance();
  return v9;
}

unint64_t sub_26153EB1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9217C0);
  uint64_t v2 = (void *)sub_261569AE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_261545AD4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

unint64_t sub_26153EC38(uint64_t a1)
{
  return sub_26153EC44(a1, (uint64_t *)&unk_26A9217A0);
}

unint64_t sub_26153EC44(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_261569AE0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_261545AD4(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v12 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_26153ED5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921790);
  uint64_t v2 = sub_261569AE0();
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
    sub_261548938(v6, (uint64_t)&v13, &qword_26A921798);
    uint64_t v7 = v13;
    unint64_t result = sub_261545BB8(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2615488CC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_26153EE8C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921778);
  uint64_t v2 = sub_261569AE0();
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
    sub_261548938(v6, (uint64_t)&v13, &qword_26A921780);
    uint64_t v7 = v13;
    unint64_t result = sub_261545C4C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2615488CC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_26153EFBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E020);
  uint64_t v2 = (void *)sub_261569AE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    id v6 = *v4;
    id v7 = *v4;
    id v8 = v5;
    unint64_t result = sub_261545D00((uint64_t)v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = 8 * result;
    *(void *)(v2[6] + v11) = v8;
    *(void *)(v2[7] + v11) = v6;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v14;
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

uint64_t sub_26153F0C0(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_261540B94(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_26153F120(id a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_26A9215D0 != -1) {
    swift_once();
  }
  uint64_t v7 = v86 + 296;
  uint64_t v8 = sub_261569610();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A9215D8);
  swift_bridgeObjectRetain_n();
  char v9 = sub_2615695F0();
  os_log_type_t v10 = sub_2615698A0();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v89[0] = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    swift_bridgeObjectRetain();
    v88[3] = sub_2615453FC(a2, v11, v89);
    uint64_t v4 = v3;
    sub_261569960();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26153C000, v9, v10, "populating views for ”%{public}s”", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v13;
    uint64_t v7 = v86 + 296;
    MEMORY[0x263E3AFE0](v14, -1, -1);
    uint64_t v15 = v12;
    a3 = v11;
    MEMORY[0x263E3AFE0](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(a1, sel_bounds);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (*(unsigned char *)(v7 + 64))
  {
    id v24 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v24, sel_nativeScale);
    double v26 = v25;

    v93.origin.x = v17;
    v93.origin.y = v19;
    v93.size.width = v21;
    v93.size.height = v23;
    double v27 = ceil(v26 * CGRectGetWidth(v93));
    v94.origin.x = v17;
    v94.origin.y = v19;
    v94.size.width = v21;
    v94.size.height = v23;
    double v28 = ceil(v26 * CGRectGetHeight(v94));
    *(double *)(v86 + 344) = v27;
    *(double *)(v86 + 352) = v28;
    *(unsigned char *)(v7 + 64) = 0;
  }
  else
  {
    double v27 = *(double *)(v86 + 344);
    double v28 = *(double *)(v86 + 352);
  }
  id v29 = (id *)(v86 + 32);
  swift_beginAccess();
  sub_261548938(v86 + 32, (uint64_t)v89, (uint64_t *)&unk_26A921640);
  uint64_t v30 = v90;
  sub_261544B80((uint64_t)v89);
  if (v30) {
    goto LABEL_10;
  }
  uint64_t v39 = *(void *)(v86 + 16);
  uint64_t v40 = *(void *)(v86 + 24);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40))
  {
    id v41 = objc_msgSend(*(id *)(v86 + 104), sel_commandBuffer);
    if (!v41)
    {
      sub_261544B2C();
      swift_allocError();
      unsigned char *v70 = 1;
      return swift_willThrow();
    }
    v42 = v41;
    unint64_t v43 = a3;
    v44 = (void *)sub_2615696D0();
    objc_msgSend(v42, sel_setLabel_, v44);

    a3 = v43;
  }
  else
  {
    v42 = 0;
  }
  if (v27 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_64;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if ((~*(void *)&v28 & 0x7FF0000000000000) == 0
    || (*(void *)&v27 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_65;
  }
  if (v28 <= -9.22337204e18)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (v28 >= 9.22337204e18)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  id v83 = a1;
  unint64_t v79 = a3;
  uint64_t v45 = *(void *)(v86 + 88);
  uint64_t v46 = *(void *)(v86 + 96);
  uint64_t v47 = *(void *)(v86 + 80);
  v81 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))(v40 + 40);
  uint64_t v90 = v39;
  uint64_t v91 = v40;
  __swift_allocate_boxed_opaque_existential_1(v89);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v81(v46, v47, v45, (uint64_t)v27, (uint64_t)v28, v42, v39, v40);
  if (v4)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)v89);
    return swift_unknownObjectRelease();
  }
  swift_beginAccess();
  sub_261548020((uint64_t)v89, (uint64_t)v29);
  swift_endAccess();
  if (v42) {
    objc_msgSend(v42, sel_commit);
  }
  id v69 = objc_msgSend(*(id *)(v86 + 112), sel_layer, v79);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setDrawableSize_, v27, v28);

  sub_26154128C();
  swift_unknownObjectRelease();
  a3 = v80;
  a1 = v83;
LABEL_10:
  unint64_t v31 = 0x265583000;
  if (*(void *)(v86 + 72))
  {
    id v29 = (id *)(v86 + 120);
    swift_beginAccess();
    uint64_t v32 = *(void *)(v86 + 120);
    id v82 = a1;
    if (*(void *)(v32 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v33 = sub_261545AD4(a2, a3);
      if (v34)
      {
        id v84 = *(id *)(*(void *)(v32 + 56) + 8 * v33);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        v35 = sub_2615695F0();
        os_log_type_t v36 = sub_2615698A0();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          v88[0] = v38;
          *(_DWORD *)v37 = 136446210;
          swift_bridgeObjectRetain();
          v87[0] = (id)sub_2615453FC(a2, a3, v88);
          sub_261569960();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_26153C000, v35, v36, "reusing snapshot layer for “%{public}s”", v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x263E3AFE0](v38, -1, -1);
          MEMORY[0x263E3AFE0](v37, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain_n();
    v49 = sub_2615695F0();
    os_log_type_t v50 = sub_2615698A0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v88[0] = v52;
      *(_DWORD *)v51 = 136446210;
      swift_bridgeObjectRetain();
      v87[0] = (id)sub_2615453FC(a2, a3, v88);
      sub_261569960();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_26153C000, v49, v50, "creating snapshot layer for “%{public}s”", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v52, -1, -1);
      MEMORY[0x263E3AFE0](v51, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    objc_msgSend(a1, sel_setAnchorPoint_, 0.0, 0.0);
    if (qword_26A921610 == -1)
    {
LABEL_33:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9216B0);
      v53 = (void *)sub_261569660();
      objc_msgSend(a1, sel_setActions_, v53);

      swift_beginAccess();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v87[0] = *v29;
      *id v29 = (id)0x8000000000000000;
      id v84 = a1;
      sub_2615471E0((uint64_t)a1, a2, a3, isUniquelyReferenced_nonNull_native, &qword_26A9217B8);
      *id v29 = v87[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
LABEL_34:
      unint64_t v31 = 0x265583000uLL;
      uint64_t v55 = *(void *)(v86 + 256);
      uint64_t v56 = *(void *)(v86 + 264);
      int v57 = *(unsigned __int8 *)(v86 + 296);
      swift_beginAccess();
      uint64_t v58 = *(void *)(v86 + 128);
      if (*(void *)(v58 + 16) && (!v57 ? (uint64_t v59 = v55) : (uint64_t v59 = v56), v60 = sub_261545B4C(v59), (v61 & 1) != 0))
      {
        uint64_t v62 = *(void *)(*(void *)(v58 + 56) + 8 * v60);
        unint64_t v63 = a3;
        v64 = v82;
        if (*(void *)(v62 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v65 = sub_261545AD4(a2, a3);
          if (v66)
          {
            id v67 = *(id *)(*(void *)(v62 + 56) + 8 * v65);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v87[0] = v67;
            type metadata accessor for CGImage(0);
            uint64_t v68 = sub_261569B30();

            goto LABEL_50;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        uint64_t v68 = 0;
      }
      else
      {
        uint64_t v68 = 0;
        unint64_t v63 = a3;
        v64 = v82;
      }
LABEL_50:
      objc_msgSend(v84, sel_setContents_, v68);
      swift_unknownObjectRelease();
      objc_msgSend(v84, sel_setBounds_, v17, v19, v21, v23);
      id v71 = objc_msgSend(v64, sel_layer);
      objc_msgSend(v71, sel_addSublayer_, v84);

      swift_beginAccess();
      swift_bridgeObjectRetain();
      id v72 = v64;
      char v73 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v92 = *(void *)(v86 + 136);
      *(void *)(v86 + 136) = 0x8000000000000000;
      sub_2615471E0((uint64_t)v72, a2, v63, v73, &qword_26A9217B0);
      *(void *)(v86 + 136) = v92;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      if (*(void *)(v86 + 152) == a2 && *(void *)(v86 + 160) == v63 || (sub_261569B40() & 1) != 0)
      {
        swift_bridgeObjectRetain_n();
        v74 = sub_2615695F0();
        os_log_type_t v75 = sub_2615698A0();
        if (os_log_type_enabled(v74, v75))
        {
          v76 = (uint8_t *)swift_slowAlloc();
          v77 = (void *)swift_slowAlloc();
          v87[0] = v77;
          *(_DWORD *)v76 = 136446210;
          swift_bridgeObjectRetain();
          uint64_t v92 = sub_2615453FC(a2, v63, (uint64_t *)v87);
          unint64_t v31 = 0x265583000;
          sub_261569960();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_26153C000, v74, v75, "adding main view to background for “%{public}s”", v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x263E3AFE0](v77, -1, -1);
          MEMORY[0x263E3AFE0](v76, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        objc_msgSend(v72, sel_addSubview_, *(void *)(v86 + 112));
      }
      else
      {
      }
      goto LABEL_58;
    }
LABEL_68:
    swift_once();
    goto LABEL_33;
  }
  objc_msgSend(a1, sel_addSubview_, *(void *)(v86 + 112));
LABEL_58:
  v78 = *(void **)(v86 + 112);
  objc_msgSend(v78, *(SEL *)(v31 + 1608), v17, v19, v21, v23);
  *((unsigned char *)v78 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically) = 1;
  if (*(void *)(v86 + 80) == *(void *)(v86 + 152) && *(void *)(v86 + 88) == *(void *)(v86 + 160)) {
    return (uint64_t)objc_msgSend(v78, sel_setNeedsDisplay);
  }
  uint64_t result = sub_261569B40();
  if (result) {
    return (uint64_t)objc_msgSend(v78, sel_setNeedsDisplay);
  }
  return result;
}

uint64_t sub_26153FEB8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_261569610();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v71 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v3 + 160);
  *(void *)&long long v74 = *(void *)(v3 + 152);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = objc_msgSend(a1, sel_traitCollection);
  if (v10)
  {
    unint64_t v11 = v10;
    id v12 = objc_msgSend(v10, sel_userInterfaceStyle);

    BOOL v73 = v12 == (id)2;
  }
  else
  {
    BOOL v73 = 0;
  }
  id v13 = objc_msgSend(a1, sel_deviceOrientation);
  swift_unknownObjectRelease();
  int v14 = *(unsigned __int8 *)(v3 + 296);
  *((void *)&v74 + 1) = v9;
  if (!a2)
  {
    if (v14)
    {
      double v19 = *(double *)(v3 + 280);
      double v18 = *(double *)(v3 + 288);
      if (CFAbsoluteTimeGetCurrent() <= v18 + v19)
      {
        uint64_t v20 = *(void *)(v3 + 256);
        uint64_t v21 = *(void *)(v3 + 264);
        id v22 = *(id *)(v3 + 272);
        uint64_t v23 = *(void *)(v3 + 280);
        uint64_t v24 = *(void *)(v3 + 288);
        int v25 = *(unsigned __int8 *)(v3 + 296);
        sub_2615480DC(v20, v21, v22, v23, v24, *(unsigned char *)(v3 + 296));
        sub_2615480DC(v20, v21, v22, v23, v24, v25);
        id v13 = (id)v20;
        LODWORD(v72) = v25;
        goto LABEL_33;
      }
    }
    goto LABEL_11;
  }
  uint64_t v70 = v7;
  _ZF = v14 == 0;
  uint64_t v16 = 256;
  if (!_ZF) {
    uint64_t v16 = 264;
  }
  double v17 = *(char **)(v3 + v16);
  id v72 = a2;
  if (objc_msgSend(a1, sel_deviceOrientation) == v17)
  {

LABEL_11:
    objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay);
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    LOBYTE(v25) = 0;
    LODWORD(v72) = 255;
    goto LABEL_33;
  }
  if (qword_26A9215D0 != -1) {
    swift_once();
  }
  uint64_t v26 = v6;
  uint64_t v27 = __swift_project_value_buffer(v6, (uint64_t)qword_26A9215D8);
  uint64_t v29 = v70;
  double v28 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v71, v27, v26);
  swift_unknownObjectRetain_n();
  uint64_t v30 = sub_2615695F0();
  int v68 = sub_2615698A0();
  BOOL v31 = os_log_type_enabled(v30, (os_log_type_t)v68);
  id v69 = v17;
  if (v31)
  {
    os_log_t v66 = v30;
    uint64_t v67 = v26;
    uint64_t v32 = v17;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(void *)&v83[0] = v34;
    *(_DWORD *)uint64_t v33 = 136446466;
    v35 = v32 - 1;
    unint64_t v36 = v34;
    uint64_t v37 = 0xD000000000000014;
    unint64_t v38 = 0x800000026156CAD0;
    os_log_type_t v39 = v68;
    switch((unint64_t)v35)
    {
      case 0uLL:
        unint64_t v38 = 0xE800000000000000;
        uint64_t v37 = 0x7469617274726F50;
        break;
      case 1uLL:
        break;
      case 2uLL:
        unint64_t v38 = 0xEF74686769522065;
        goto LABEL_22;
      case 3uLL:
        unint64_t v38 = 0xEE007466654C2065;
LABEL_22:
        uint64_t v37 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v36 = 0xD000000000000014;
        unint64_t v38 = 0x800000026156CAB0;
        uint64_t v37 = 0xD000000000000013;
        os_log_type_t v39 = v68;
        break;
    }
    *(void *)&long long v75 = sub_2615453FC(v37, v38, (uint64_t *)v83);
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    uint64_t v40 = (char *)objc_msgSend(a1, sel_deviceOrientation) - 1;
    uint64_t v41 = 0xD000000000000014;
    unint64_t v42 = 0x800000026156CAD0;
    switch((unint64_t)v40)
    {
      case 0uLL:
        unint64_t v42 = 0xE800000000000000;
        uint64_t v41 = 0x7469617274726F50;
        break;
      case 1uLL:
        break;
      case 2uLL:
        unint64_t v42 = 0xEF74686769522065;
        goto LABEL_28;
      case 3uLL:
        unint64_t v42 = 0xEE007466654C2065;
LABEL_28:
        uint64_t v41 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v42 = 0x800000026156CAB0;
        uint64_t v41 = 0xD000000000000013;
        break;
    }
    *(void *)&long long v75 = sub_2615453FC(v41, v42, (uint64_t *)v83);
    sub_261569960();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v43 = v66;
    _os_log_impl(&dword_26153C000, v66, v39, "🔄 editor starting orientation transition %{public}s → %{public}s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v36, -1, -1);
    MEMORY[0x263E3AFE0](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v67);
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v26);
  }
  id v71 = (char *)objc_msgSend(a1, sel_deviceOrientation);
  id v22 = objc_msgSend(v72, sel_timingFunction);
  if (!v22) {
    id v22 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v45 = v72;
  objc_msgSend(v72, sel_delay);
  *(double *)&uint64_t v47 = Current + v46;
  objc_msgSend(v45, sel_duration);
  uint64_t v23 = v47;
  uint64_t v24 = v48;
  objc_msgSend(v45, sel_delay);
  double v50 = v49;
  objc_msgSend(v45, sel_duration);
  sub_2615494C8(v50 + v51);

  id v52 = v22;
  LODWORD(v72) = 1;
  uint64_t v20 = (uint64_t)v69;
  id v13 = v69;
  LOBYTE(v25) = 1;
  uint64_t v21 = (uint64_t)v71;
LABEL_33:
  LOBYTE(v75) = 0;
  *((void *)&v75 + 1) = 0;
  LOBYTE(v76[0]) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)v76 + 8) = _Q0;
  WORD4(v76[1]) = v73;
  long long v77 = v74;
  uint64_t v78 = 0;
  v79[0] = 0;
  *(void *)((char *)v79 + 5) = 0;
  v79[2] = v13;
  *(void *)&long long v80 = v21;
  *((void *)&v80 + 1) = v22;
  *(void *)&long long v81 = v23;
  *((void *)&v81 + 1) = v24;
  long long v57 = *(_OWORD *)(v3 + 248);
  long long v58 = *(_OWORD *)(v3 + 280);
  v83[6] = *(_OWORD *)(v3 + 264);
  v83[7] = v58;
  long long v59 = *(_OWORD *)(v3 + 184);
  long long v60 = *(_OWORD *)(v3 + 216);
  v83[2] = *(_OWORD *)(v3 + 200);
  v83[3] = v60;
  v83[4] = *(_OWORD *)(v3 + 232);
  v83[5] = v57;
  v83[0] = *(_OWORD *)(v3 + 168);
  v83[1] = v59;
  *(_OWORD *)(v3 + 248) = *(_OWORD *)&v79[1];
  long long v61 = v81;
  *(_OWORD *)(v3 + 264) = v80;
  *(_OWORD *)(v3 + 280) = v61;
  long long v62 = v75;
  *(_OWORD *)(v3 + 184) = v76[0];
  long long v63 = v77;
  *(_OWORD *)(v3 + 200) = v76[1];
  *(_OWORD *)(v3 + 216) = v63;
  *(_OWORD *)(v3 + 232) = 0u;
  char v82 = v25;
  char v84 = *(unsigned char *)(v3 + 296);
  *(unsigned char *)(v3 + 296) = v25;
  *(_OWORD *)(v3 + 168) = v62;
  sub_2615480E8((uint64_t)&v75, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
  sub_2615480E8((uint64_t)v83, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
  sub_26154128C();
  sub_261548184(v20, v21, (uint64_t)v22, v23, v24, v72);
  return sub_2615480E8((uint64_t)&v75, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
}

void sub_2615406D4(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  if (!*(void *)(v3 + 72))
  {
    if (*(double *)(v3 + 368) - a3 <= 0.9)
    {
      uint64_t v10 = *(void *)(v3 + 160);
      float v11 = a3;
      uint64_t v12 = *(void *)(v3 + 304);
      uint64_t v13 = *(void *)(v3 + 312);
      uint64_t v14 = *(void *)(v3 + 320);
      uint64_t v15 = *(void *)(v3 + 328);
      unint64_t v16 = *(unsigned int *)(v3 + 336) | ((unint64_t)*(unsigned __int8 *)(v3 + 340) << 32);
      *(void *)(v3 + 304) = *(void *)(v3 + 152);
      *(void *)(v3 + 312) = v10;
      *(void *)(v3 + 320) = a1;
      *(void *)(v3 + 328) = a2;
      *(float *)(v3 + 336) = v11;
      *(unsigned char *)(v3 + 340) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_261544BE0(v12, v13, v14, v15, v16);
      objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay);
    }
    else
    {
      if (qword_26A9215D0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_261569610();
      __swift_project_value_buffer(v6, (uint64_t)qword_26A9215D8);
      uint64_t v7 = sub_2615695F0();
      os_log_type_t v8 = sub_2615698B0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 134218240;
        sub_261569960();
        *(_WORD *)(v9 + 12) = 2048;
        sub_261569960();
        _os_log_impl(&dword_26153C000, v7, v8, "got a nonsense transition-progress change (%f → %f), ignoring", (uint8_t *)v9, 0x16u);
        MEMORY[0x263E3AFE0](v9, -1, -1);
      }
    }
    *(double *)(v4 + 368) = a3;
  }
}

id sub_2615408B4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A9215D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_261569610();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A9215D8);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_2615695F0();
  os_log_type_t v8 = sub_2615698A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v28[0] = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2615453FC(a1, a2, v28);
    sub_261569960();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26153C000, v7, v8, "finalized transition to “%{public}s”", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v10, -1, -1);
    MEMORY[0x263E3AFE0](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v3 + 152) = a1;
  *(void *)(v3 + 160) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v3 + 216);
  uint64_t v12 = *(void *)(v3 + 224);
  uint64_t v13 = *(void *)(v3 + 232);
  uint64_t v14 = *(void *)(v3 + 240);
  uint64_t v15 = *(unsigned int *)(v3 + 248);
  char v16 = *(unsigned char *)(v3 + 252);
  *(void *)(v3 + 216) = a1;
  *(void *)(v3 + 224) = a2;
  *(void *)(v3 + 232) = 0;
  *(void *)(v3 + 240) = 0;
  *(void *)(v3 + 245) = 0;
  swift_bridgeObjectRetain();
  sub_261544BF8(v11, v12, v13, v14, v15, v16);
  uint64_t v17 = *(void *)(v3 + 304);
  uint64_t v18 = *(void *)(v3 + 312);
  uint64_t v19 = *(void *)(v3 + 320);
  uint64_t v20 = *(void *)(v3 + 328);
  unint64_t v21 = *(unsigned int *)(v3 + 336) | ((unint64_t)*(unsigned __int8 *)(v3 + 340) << 32);
  *(_OWORD *)(v3 + 304) = 0u;
  *(_OWORD *)(v3 + 320) = 0u;
  *(_DWORD *)(v3 + 336) = 0;
  *(unsigned char *)(v3 + 340) = -1;
  sub_261544BE0(v17, v18, v19, v20, v21);
  if (*(void *)(v3 + 72))
  {
    swift_beginAccess();
    uint64_t v22 = *(void *)(v3 + 136);
    if (*(void *)(v22 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_261545AD4(a1, a2);
      if (v24)
      {
        id v25 = *(id *)(*(void *)(v22 + 56) + 8 * v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(v25, sel_addSubview_, *(void *)(v3 + 112));
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  return objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay, v27, v28[0]);
}

void sub_261540B94(void *a1)
{
  swift_beginAccess();
  sub_261548938(v1 + 32, (uint64_t)&v55, (uint64_t *)&unk_26A921640);
  if (*((void *)&v56 + 1))
  {
    sub_261548858(&v55, (uint64_t)v64);
    id v2 = objc_msgSend(*(id *)(v1 + 104), sel_commandBuffer);
    if (v2)
    {
      uint64_t v3 = v2;
      if (*(unsigned __int8 *)(v1 + 340) == 255)
      {
        long long v4 = *(_OWORD *)(v1 + 248);
        long long v5 = *(_OWORD *)(v1 + 280);
        long long v61 = *(_OWORD *)(v1 + 264);
        long long v62 = v5;
        char v63 = *(unsigned char *)(v1 + 296);
        long long v6 = *(_OWORD *)(v1 + 216);
        long long v59 = *(_OWORD *)(v1 + 232);
        long long v60 = v4;
        long long v57 = *(_OWORD *)(v1 + 200);
        long long v58 = v6;
        long long v7 = *(_OWORD *)(v1 + 184);
        long long v55 = *(_OWORD *)(v1 + 168);
        long long v56 = v7;
        uint64_t v8 = *((void *)&v60 + 1);
        uint64_t v48 = *((void *)&v61 + 1);
        uint64_t v49 = v61;
        uint64_t v46 = *((void *)&v5 + 1);
        uint64_t v47 = v5;
        uint64_t v10 = *((void *)&v6 + 1);
        uint64_t v9 = v6;
        uint64_t v11 = *((void *)&v59 + 1);
        uint64_t v12 = v59;
        LODWORD(v13) = v60;
        LOBYTE(v14) = BYTE4(v60);
        char v44 = BYTE9(v57);
        char v45 = v63;
        char v42 = v7;
        char v43 = BYTE8(v57);
        uint64_t v15 = *((void *)&v7 + 1);
        uint64_t v16 = v57;
        char v41 = v55;
        uint64_t v17 = *((void *)&v55 + 1);
        sub_2615480E8((uint64_t)&v55, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
      }
      else
      {
        unint64_t v13 = *(unsigned int *)(v1 + 336) | ((unint64_t)*(unsigned __int8 *)(v1 + 340) << 32);
        uint64_t v12 = *(void *)(v1 + 320);
        uint64_t v22 = *(void *)(v1 + 328);
        uint64_t v9 = *(void *)(v1 + 304);
        uint64_t v10 = *(void *)(v1 + 312);
        long long v23 = *(_OWORD *)(v1 + 248);
        long long v24 = *(_OWORD *)(v1 + 280);
        long long v61 = *(_OWORD *)(v1 + 264);
        long long v62 = v24;
        char v63 = *(unsigned char *)(v1 + 296);
        long long v25 = *(_OWORD *)(v1 + 200);
        long long v26 = *(_OWORD *)(v1 + 184);
        long long v55 = *(_OWORD *)(v1 + 168);
        long long v56 = v26;
        long long v27 = *(_OWORD *)(v1 + 216);
        long long v57 = v25;
        long long v58 = v27;
        long long v59 = *(_OWORD *)(v1 + 232);
        long long v60 = v23;
        uint64_t v39 = *((void *)&v23 + 1);
        uint64_t v48 = *((void *)&v61 + 1);
        uint64_t v49 = v61;
        uint64_t v46 = *((void *)&v62 + 1);
        uint64_t v47 = v62;
        char v44 = BYTE9(v25);
        char v45 = v63;
        char v42 = v56;
        char v43 = BYTE8(v25);
        uint64_t v15 = *((void *)&v56 + 1);
        uint64_t v16 = v25;
        char v41 = v55;
        uint64_t v17 = *((void *)&v55 + 1);
        uint64_t v28 = *((void *)&v27 + 1);
        uint64_t v38 = v27;
        id v40 = v2;
        uint64_t v29 = *((void *)&v59 + 1);
        uint64_t v30 = v59;
        uint64_t v31 = v23;
        char v37 = BYTE4(v23);
        uint64_t v11 = v22;
        sub_2615488B4(v9, v10, v12, v22, v13);
        sub_2615480E8((uint64_t)&v55, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
        uint64_t v32 = v28;
        uint64_t v33 = v30;
        uint64_t v8 = v39;
        uint64_t v34 = v29;
        uint64_t v14 = HIDWORD(v13) & 1;
        uint64_t v3 = v40;
        sub_261544BF8(v38, v32, v33, v34, v31, v37);
      }
      LOBYTE(v55) = v41;
      *((void *)&v55 + 1) = v17;
      LOBYTE(v56) = v42;
      *((void *)&v56 + 1) = v15;
      *(void *)&long long v57 = v16;
      BYTE8(v57) = v43;
      BYTE9(v57) = v44;
      *(void *)&long long v58 = v9;
      *((void *)&v58 + 1) = v10;
      *(void *)&long long v59 = v12;
      *((void *)&v59 + 1) = v11;
      LODWORD(v60) = v13;
      BYTE4(v60) = v14;
      *((void *)&v60 + 1) = v8;
      *(void *)&long long v61 = v49;
      *((void *)&v61 + 1) = v48;
      *(void *)&long long v62 = v47;
      *((void *)&v62 + 1) = v46;
      char v63 = v45;
      uint64_t v35 = v65;
      uint64_t v36 = v66;
      __swift_project_boxed_opaque_existential_1(v64, v65);
      v53[7] = v62;
      char v54 = v63;
      v53[2] = v57;
      v53[3] = v58;
      v53[5] = v60;
      v53[6] = v61;
      v53[4] = v59;
      v53[0] = v55;
      v53[1] = v56;
      sub_2615480E8((uint64_t)&v55, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
      uint64_t v51 = 0;
      char v52 = -1;
      (*(void (**)(_OWORD *, id, uint64_t *, void *, uint64_t, uint64_t))(v36 + 48))(v53, objc_msgSend(a1, sel_texture), &v51, v3, v35, v36);
      sub_2615480E8((uint64_t)&v55, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      swift_unknownObjectRelease();
      objc_msgSend(v3, sel_commit);
      objc_msgSend(v3, sel_waitUntilScheduled);
      objc_msgSend(a1, sel_present);
      sub_2615480E8((uint64_t)&v55, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v64);
  }
  else
  {
    sub_261544B80((uint64_t)&v55);
    if (qword_26A9215D0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_261569610();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A9215D8);
    uint64_t v19 = sub_2615695F0();
    os_log_type_t v20 = sub_2615698B0();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl(&dword_26153C000, v19, v20, "trying to update layer content with no renderer!", v21, 2u);
      MEMORY[0x263E3AFE0](v21, -1, -1);
    }
  }
}

void sub_26154128C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_261569610();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v144 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1[9];
  if (v6)
  {
    swift_beginAccess();
    sub_261548938((uint64_t)(v1 + 4), (uint64_t)&v175, (uint64_t *)&unk_26A921640);
    if (*((void *)&v176 + 1))
    {
      sub_261548858(&v175, (uint64_t)v184);
      if (v1[45])
      {
        if (qword_26A9215D0 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v3, (uint64_t)qword_26A9215D8);
        long long v7 = sub_2615695F0();
        os_log_type_t v8 = sub_2615698B0();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_26153C000, v7, v8, "trying to generate snapshots with no known pixel size", v9, 2u);
          MEMORY[0x263E3AFE0](v9, -1, -1);
        }
        goto LABEL_73;
      }
      uint64_t v122 = v2;
      double v13 = *((double *)v1 + 43);
      uint64_t v141 = v4;
      double v142 = v13;
      double v140 = *((double *)v1 + 44);
      long long v14 = *(_OWORD *)(v1 + 31);
      long long v15 = *(_OWORD *)(v1 + 35);
      long long v181 = *(_OWORD *)(v1 + 33);
      long long v182 = v15;
      unsigned __int8 v183 = *((unsigned char *)v1 + 296);
      long long v16 = *(_OWORD *)(v1 + 23);
      long long v17 = *(_OWORD *)(v1 + 27);
      long long v177 = *(_OWORD *)(v1 + 25);
      long long v178 = v17;
      long long v179 = *(_OWORD *)(v1 + 29);
      long long v180 = v14;
      long long v175 = *(_OWORD *)(v1 + 21);
      long long v176 = v16;
      uint64_t v18 = *((void *)&v14 + 1);
      uint64_t v19 = *((void *)&v181 + 1);
      uint64_t v20 = v181;
      uint64_t v21 = *((void *)&v15 + 1);
      uint64_t v22 = v15;
      int v23 = v183;
      swift_bridgeObjectRetain();
      sub_2615480E8((uint64_t)&v175, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
      if (v23 == 1)
      {
        sub_261548178(v18, v20, v19, v22, v21, 1);
        uint64_t v19 = 0;
        uint64_t v22 = 0;
        uint64_t v21 = 0;
        uint64_t v18 = v20;
        uint64_t v20 = 0;
      }
      uint64_t v120 = v6;
      uint64_t v24 = *((void *)&v176 + 1);
      uint64_t v25 = v177;
      uint64_t v26 = *((void *)&v175 + 1);
      int v126 = v175;
      int v127 = v176;
      v159[0] = v175;
      uint64_t v160 = *((void *)&v175 + 1);
      char v161 = v176;
      uint64_t v162 = *((void *)&v176 + 1);
      uint64_t v163 = v177;
      int v128 = BYTE8(v177);
      int v129 = BYTE9(v177);
      __int16 v164 = WORD4(v177);
      uint64_t v134 = *((void *)&v178 + 1);
      uint64_t v135 = v178;
      long long v165 = v178;
      uint64_t v132 = *((void *)&v179 + 1);
      uint64_t v133 = v179;
      long long v166 = v179;
      int v130 = BYTE4(v180);
      unsigned int v131 = v180;
      int v167 = v180;
      char v168 = BYTE4(v180);
      uint64_t v143 = v18;
      uint64_t v169 = v18;
      uint64_t v138 = v19;
      uint64_t v139 = v20;
      uint64_t v170 = v20;
      uint64_t v171 = v19;
      uint64_t v136 = v21;
      uint64_t v137 = v22;
      uint64_t v172 = v22;
      uint64_t v173 = v21;
      char v174 = 0;
      if (qword_26A9215D0 != -1) {
        swift_once();
      }
      double v27 = v142;
      uint64_t v28 = __swift_project_value_buffer(v3, (uint64_t)qword_26A9215D8);
      uint64_t v29 = v141;
      uint64_t v30 = *(void (**)(char *))(v141 + 16);
      uint64_t v145 = v28;
      v30(v144);
      uint64_t v31 = sub_2615695F0();
      os_log_type_t v32 = sub_2615698A0();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v34 = v122;
      if (v33)
      {
        v115 = v1;
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        *(void *)&long long v150 = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        uint64_t v37 = 0xD000000000000014;
        unint64_t v38 = 0x800000026156CAD0;
        switch(v143)
        {
          case 1:
            unint64_t v38 = 0xE800000000000000;
            uint64_t v37 = 0x7469617274726F50;
            break;
          case 2:
            break;
          case 3:
            unint64_t v38 = 0xEF74686769522065;
            goto LABEL_24;
          case 4:
            unint64_t v38 = 0xEE007466654C2065;
LABEL_24:
            uint64_t v37 = 0x70616373646E614CLL;
            break;
          default:
            unint64_t v38 = 0x800000026156CAB0;
            break;
        }
        *(void *)&v148[0] = sub_2615453FC(v37, v38, (uint64_t *)&v150);
        sub_261569960();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_26153C000, v31, v32, "generating look snapshots for orientation %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v36, -1, -1);
        MEMORY[0x263E3AFE0](v35, -1, -1);

        (*(void (**)(char *, uint64_t))(v29 + 8))(v144, v3);
        uint64_t v1 = v115;
        uint64_t v34 = v122;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v29 + 8))(v144, v3);
      }
      uint64_t v39 = v120;
      if (v27 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v27 < 9.22337204e18)
      {
        if ((*(void *)&v142 & 0x7FF0000000000000) != 0x7FF0000000000000
          && (*(void *)&v140 & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          if (v140 > -9.22337204e18)
          {
            if (v140 < 9.22337204e18)
            {
              uint64_t v40 = (uint64_t)v140;
              uint64_t v41 = v1[2];
              char v42 = *(uint64_t (**)(void))(v1[3] + 8);
              uint64_t v113 = v1[3];
              uint64_t v114 = v41;
              uint64_t v43 = v42();
              char v44 = self;
              uint64_t v119 = v40;
              id v45 = objc_msgSend(v44, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v43, (uint64_t)v27, v40, 0);
              objc_msgSend(v45, sel_setUsage_, 4);
              objc_msgSend(v45, sel_setStorageMode_, 0);
              uint64_t v46 = swift_allocObject();
              uint64_t v112 = v43;
              uint64_t v47 = sub_261553F60(v43);
              uint64_t v48 = (uint64_t)v27 * v47;
              if ((unsigned __int128)((uint64_t)v27 * (__int128)v47) >> 64 == v48 >> 63)
              {
                *(void *)(v46 + 16) = v48;
                if (v48 <= 0) {
                  uint64_t v49 = -(-v48 & 0xF);
                }
                else {
                  uint64_t v49 = v48 & 0xF;
                }
                if (v49)
                {
                  uint64_t v50 = 16 - v49;
                  BOOL v51 = __OFADD__(v48, v50);
                  v48 += v50;
                  if (v51)
                  {
LABEL_84:
                    __break(1u);
                    goto LABEL_85;
                  }
                  *(void *)(v46 + 16) = v48;
                }
                if ((unsigned __int128)(v119 * (__int128)v48) >> 64 == (v119 * v48) >> 63)
                {
                  uint64_t v52 = *(void *)(v39 + 16);
                  uint64_t v118 = v119 * v48;
                  if ((unsigned __int128)(v52 * (__int128)(v119 * v48)) >> 64 == (v52 * v119 * v48) >> 63)
                  {
                    id v53 = objc_msgSend((id)v1[12], sel_newBufferWithLength_options_);
                    if (v53)
                    {
                      uint64_t v109 = (uint64_t)v27;
                      char v54 = v53;
                      swift_unknownObjectRetain();
                      id v55 = v45;
                      uint64_t v56 = sub_2615485F8(0, v52, v54, (uint64_t)v55, v118);
                      v111 = v54;
                      swift_unknownObjectRelease();
                      id v110 = v55;

                      double v140 = COERCE_DOUBLE(objc_msgSend((id)v1[13], sel_commandBuffer));
                      if (v140 != 0.0)
                      {
                        uint64_t v57 = v34;
                        v144 = 0;
                        uint64_t v125 = v56;
                        sub_261569580();
                        uint64_t v108 = swift_allocBox();
                        uint64_t v59 = v58;
                        *(void *)&long long v150 = MEMORY[0x263F8EE78];
                        sub_2615488F0(&qword_26A9217C8, MEMORY[0x263F07978]);
                        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9217D0);
                        sub_261548C3C(&qword_26A9217D8, &qword_26A9217D0);
                        uint64_t v141 = v59;
                        sub_261569990();
                        double v61 = *(double *)(v39 + 16);
                        if (v61 == 0.0)
                        {
                          swift_bridgeObjectRelease();
LABEL_67:
                          uint64_t v99 = (*(uint64_t (**)(void))(v113 + 16))();
                          if (v99)
                          {
                            CGColorSpaceRef v100 = (CGColorSpaceRef)v99;
LABEL_70:
                            v101 = (void *)swift_allocObject();
                            v101[2] = v143;
                            v101[3] = v1;
                            v101[4] = v111;
                            v101[5] = v39;
                            uint64_t v102 = v118;
                            v101[6] = v108;
                            v101[7] = v102;
                            uint64_t v103 = v119;
                            v101[8] = v109;
                            v101[9] = v103;
                            v101[10] = v46;
                            v101[11] = v100;
                            v101[12] = v112;
                            v101[13] = v57;
                            *(void *)&long long v152 = sub_261548B04;
                            *((void *)&v152 + 1) = v101;
                            *(void *)&long long v150 = MEMORY[0x263EF8330];
                            *((void *)&v150 + 1) = 1107296256;
                            *(void *)&long long v151 = sub_26154411C;
                            *((void *)&v151 + 1) = &block_descriptor;
                            v104 = _Block_copy(&v150);
                            swift_unknownObjectRetain();
                            swift_retain();
                            swift_retain();
                            swift_retain();
                            v105 = v100;
                            swift_release();
                            double v106 = v140;
                            objc_msgSend(*(id *)&v140, sel_addCompletedHandler_, v104);
                            _Block_release(v104);
                            objc_msgSend(*(id *)&v106, sel_commit);

                            swift_release();
                            swift_unknownObjectRelease();
                            swift_unknownObjectRelease();
                            swift_release();

                            sub_2615480E8((uint64_t)v159, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                            goto LABEL_74;
                          }
                          CGColorSpaceRef v100 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
                          if (v100) {
                            goto LABEL_70;
                          }
LABEL_86:
                          __break(1u);
                          JUMPOUT(0x2615425ACLL);
                        }
                        uint64_t v107 = v46;
                        v115 = v1;
                        uint64_t v62 = v125;
                        if (*(void *)&v61 <= *(void *)(v125 + 16))
                        {
                          uint64_t v63 = 0;
                          v124 = &v154;
                          v64 = (unint64_t *)(v120 + 40);
                          *(void *)&long long v60 = 136446210;
                          long long v121 = v60;
                          uint64_t v116 = MEMORY[0x263F8EE58] + 8;
                          *(void *)&long long v60 = 136446466;
                          long long v117 = v60;
                          uint64_t v65 = v144;
                          double v142 = v61;
                          do
                          {
                            uint64_t v66 = *(v64 - 1);
                            unint64_t v67 = *v64;
                            uint64_t v68 = *(void *)(v62 + 8 * v63 + 32);
                            if (v68)
                            {
                              uint64_t v70 = v185;
                              uint64_t v69 = v186;
                              __swift_project_boxed_opaque_existential_1(v184, v185);
                              swift_bridgeObjectRetain_n();
                              swift_unknownObjectRetain();
                              sub_2615480E8((uint64_t)v159, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
                              sub_261544BF8(v135, v134, v133, v132, v131, v130);
                              LOBYTE(v150) = v126;
                              *((void *)&v150 + 1) = v26;
                              LOBYTE(v151) = v127;
                              *((void *)&v151 + 1) = v24;
                              *(void *)&long long v152 = v25;
                              BYTE8(v152) = v128;
                              BYTE9(v152) = v129;
                              v144 = (char *)v66;
                              *(void *)&long long v153 = v66;
                              *((void *)&v153 + 1) = v67;
                              id v71 = v124;
                              *(void *)((char *)v124 + 13) = 0;
                              *(void *)id v71 = 0;
                              *((void *)v71 + 1) = 0;
                              *((void *)&v155 + 1) = v143;
                              *(void *)&long long v156 = v139;
                              *((void *)&v156 + 1) = v138;
                              *(void *)&long long v157 = v137;
                              *((void *)&v157 + 1) = v136;
                              char v158 = 0;
                              v148[6] = v156;
                              v148[7] = v157;
                              char v149 = 0;
                              v148[2] = v152;
                              v148[3] = v153;
                              v148[4] = v154;
                              v148[5] = v155;
                              v148[0] = v150;
                              v148[1] = v151;
                              uint64_t v146 = 0;
                              char v147 = -1;
                              (*(void (**)(_OWORD *, uint64_t, uint64_t *, double, uint64_t, uint64_t))(v69 + 48))(v148, v68, &v146, COERCE_DOUBLE(*(void *)&v140), v70, v69);
                              if (v65)
                              {
                                sub_2615480E8((uint64_t)&v150, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                                id v72 = v65;
                                swift_bridgeObjectRetain();
                                BOOL v73 = v65;
                                long long v74 = sub_2615695F0();
                                os_log_type_t v75 = sub_2615698B0();
                                if (os_log_type_enabled(v74, v75))
                                {
                                  uint64_t v76 = swift_slowAlloc();
                                  long long v77 = (void *)swift_slowAlloc();
                                  uint64_t v123 = swift_slowAlloc();
                                  *(void *)&v148[0] = v123;
                                  *(_DWORD *)uint64_t v76 = v117;
                                  swift_bridgeObjectRetain();
                                  *(void *)(v76 + 4) = sub_2615453FC((uint64_t)v144, v67, (uint64_t *)v148);
                                  swift_bridgeObjectRelease_n();
                                  *(_WORD *)(v76 + 12) = 2112;
                                  uint64_t v78 = v65;
                                  uint64_t v79 = _swift_stdlib_bridgeErrorToNSError();
                                  *(void *)(v76 + 14) = v79;
                                  void *v77 = v79;

                                  _os_log_impl(&dword_26153C000, v74, v75, "couldn’t snapshot look “%{public}s” due to renderer error: %@", (uint8_t *)v76, 0x16u);
                                  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
                                  swift_arrayDestroy();
                                  MEMORY[0x263E3AFE0](v77, -1, -1);
                                  uint64_t v80 = v123;
                                  swift_arrayDestroy();
                                  MEMORY[0x263E3AFE0](v80, -1, -1);
                                  MEMORY[0x263E3AFE0](v76, -1, -1);
                                }
                                else
                                {
                                  swift_bridgeObjectRelease_n();
                                }
                                uint64_t v62 = v125;
                                double v61 = v142;
                                sub_261569560();

                                swift_unknownObjectRelease();
                                uint64_t v65 = 0;
                              }
                              else
                              {
                                sub_2615480E8((uint64_t)&v150, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                                swift_bridgeObjectRetain();
                                uint64_t v90 = sub_2615695F0();
                                os_log_type_t v91 = sub_2615698A0();
                                if (os_log_type_enabled(v90, v91))
                                {
                                  uint64_t v92 = swift_slowAlloc();
                                  uint64_t v93 = swift_slowAlloc();
                                  *(void *)&v148[0] = v93;
                                  *(_DWORD *)uint64_t v92 = v121;
                                  swift_bridgeObjectRetain();
                                  *(void *)(v92 + 4) = sub_2615453FC((uint64_t)v144, v67, (uint64_t *)v148);
                                  swift_bridgeObjectRelease_n();
                                  _os_log_impl(&dword_26153C000, v90, v91, "snapshotted look “%{public}s”", (uint8_t *)v92, 0xCu);
                                  swift_arrayDestroy();
                                  MEMORY[0x263E3AFE0](v93, -1, -1);
                                  uint64_t v94 = v92;
                                  double v61 = v142;
                                  MEMORY[0x263E3AFE0](v94, -1, -1);

                                  swift_unknownObjectRelease();
                                  uint64_t v62 = v125;
                                }
                                else
                                {

                                  swift_unknownObjectRelease();
                                  swift_bridgeObjectRelease_n();
                                  uint64_t v62 = v125;
                                  double v61 = v142;
                                }
                              }
                            }
                            else
                            {
                              swift_bridgeObjectRetain_n();
                              long long v81 = sub_2615695F0();
                              uint64_t v82 = sub_2615698B0();
                              if (os_log_type_enabled(v81, (os_log_type_t)v82))
                              {
                                uint64_t v83 = swift_slowAlloc();
                                v144 = v65;
                                uint64_t v84 = v83;
                                uint64_t v85 = v62;
                                uint64_t v86 = v66;
                                uint64_t v87 = swift_slowAlloc();
                                *(void *)&long long v150 = v87;
                                *(_DWORD *)uint64_t v84 = v121;
                                swift_bridgeObjectRetain();
                                uint64_t v88 = v86;
                                uint64_t v62 = v85;
                                *(void *)(v84 + 4) = sub_2615453FC(v88, v67, (uint64_t *)&v150);
                                swift_bridgeObjectRelease_n();
                                _os_log_impl(&dword_26153C000, v81, (os_log_type_t)v82, "couldn’t snapshot look “%{public}s”, didn’t get a texture from the buffer", (uint8_t *)v84, 0xCu);
                                swift_arrayDestroy();
                                MEMORY[0x263E3AFE0](v87, -1, -1);
                                uint64_t v89 = v84;
                                double v61 = v142;
                                uint64_t v65 = v144;
                                MEMORY[0x263E3AFE0](v89, -1, -1);
                              }
                              else
                              {

                                swift_bridgeObjectRelease_n();
                              }
                              sub_261569560();
                            }
                            ++v63;
                            v64 += 2;
                          }
                          while (*(void *)&v61 != v63);
                          swift_bridgeObjectRelease();
                          uint64_t v1 = v115;
                          uint64_t v57 = v122;
                          uint64_t v39 = v120;
                          uint64_t v46 = v107;
                          goto LABEL_67;
                        }
LABEL_85:
                        __break(1u);
                        goto LABEL_86;
                      }
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      long long v7 = sub_2615695F0();
                      os_log_type_t v97 = sub_2615698B0();
                      if (os_log_type_enabled(v7, v97))
                      {
                        v98 = (uint8_t *)swift_slowAlloc();
                        *(_WORD *)v98 = 0;
                        _os_log_impl(&dword_26153C000, v7, v97, "couldn’t make command buffer for look snapshotting", v98, 2u);
                        MEMORY[0x263E3AFE0](v98, -1, -1);

                        sub_2615480E8((uint64_t)v159, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                        swift_release();
                        swift_unknownObjectRelease();
                        goto LABEL_74;
                      }

                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                      long long v7 = sub_2615695F0();
                      os_log_type_t v95 = sub_2615698B0();
                      if (os_log_type_enabled(v7, v95))
                      {
                        v96 = (uint8_t *)swift_slowAlloc();
                        *(_WORD *)v96 = 0;
                        _os_log_impl(&dword_26153C000, v7, v95, "couldn’t make buffer for look snapshots", v96, 2u);
                        MEMORY[0x263E3AFE0](v96, -1, -1);

                        sub_2615480E8((uint64_t)v159, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                        swift_release();
LABEL_74:
                        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v184);
                        return;
                      }
                    }
                    sub_2615480E8((uint64_t)v159, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
                    swift_release();
LABEL_73:

                    goto LABEL_74;
                  }
                  goto LABEL_83;
                }
LABEL_82:
                __break(1u);
LABEL_83:
                __break(1u);
                goto LABEL_84;
              }
LABEL_81:
              __break(1u);
              goto LABEL_82;
            }
LABEL_80:
            __break(1u);
            goto LABEL_81;
          }
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      __break(1u);
      goto LABEL_78;
    }
    sub_261544B80((uint64_t)&v175);
    if (qword_26A9215D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26A9215D8);
    uint64_t v10 = sub_2615695F0();
    os_log_type_t v11 = sub_2615698B0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_26153C000, v10, v11, "trying to generate snapshots when there’s no renderer yet", v12, 2u);
      MEMORY[0x263E3AFE0](v12, -1, -1);
    }
  }
}

void sub_2615425BC(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v61 = a7;
  uint64_t v62 = a8;
  uint64_t v65 = a5;
  uint64_t v66 = a6;
  uint64_t v59 = a12;
  uint64_t v60 = a13;
  unint64_t v67 = a11;
  os_log_t v68 = a2;
  uint64_t v63 = a4;
  uint64_t v64 = a10;
  uint64_t v57 = a3;
  uint64_t v58 = a9;
  uint64_t v14 = sub_261569620();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_261569650();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_261569610();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_status) == (id)4)
  {
    uint64_t v53 = v19;
    if (qword_26A9215D0 != -1) {
      swift_once();
    }
    char v54 = v17;
    uint64_t v55 = v18;
    uint64_t v26 = __swift_project_value_buffer(v22, (uint64_t)qword_26A9215D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v26, v22);
    double v27 = sub_2615695F0();
    os_log_type_t v28 = sub_2615698A0();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v56 = v15;
    if (v29)
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      aBlock[0] = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v52 = v14;
      uint64_t v51 = v31;
      uint64_t v32 = 0xD000000000000014;
      unint64_t v33 = 0x800000026156CAD0;
      switch((unint64_t)v68)
      {
        case 1uLL:
          unint64_t v33 = 0xE800000000000000;
          uint64_t v32 = 0x7469617274726F50;
          break;
        case 2uLL:
          break;
        case 3uLL:
          unint64_t v33 = 0xEF74686769522065;
          goto LABEL_18;
        case 4uLL:
          unint64_t v33 = 0xEE007466654C2065;
LABEL_18:
          uint64_t v32 = 0x70616373646E614CLL;
          break;
        default:
          unint64_t v33 = 0x800000026156CAB0;
          break;
      }
      uint64_t v69 = sub_2615453FC(v32, v33, aBlock);
      sub_261569960();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26153C000, v27, v28, "snapshot rendering finished for %{public}s", v30, 0xCu);
      uint64_t v37 = v51;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v37, -1, -1);
      MEMORY[0x263E3AFE0](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
      uint64_t v14 = v52;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    }
    sub_261548B60(0, (unint64_t *)&qword_26A9217E0);
    unint64_t v38 = (void *)sub_261569900();
    uint64_t v39 = swift_allocObject();
    swift_weakInit();
    uint64_t v40 = (void *)swift_allocObject();
    uint64_t v42 = v63;
    uint64_t v41 = v64;
    v40[2] = v39;
    v40[3] = v42;
    uint64_t v43 = v66;
    v40[4] = v65;
    v40[5] = v43;
    uint64_t v44 = v62;
    v40[6] = v61;
    v40[7] = v44;
    v40[8] = v58;
    v40[9] = v41;
    id v45 = v67;
    uint64_t v46 = v59;
    v40[10] = v67;
    v40[11] = v46;
    uint64_t v47 = v60;
    v40[12] = v68;
    v40[13] = v47;
    aBlock[4] = (uint64_t)sub_261548BFC;
    aBlock[5] = (uint64_t)v40;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2615530F4;
    aBlock[3] = (uint64_t)&block_descriptor_59;
    uint64_t v48 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    id v49 = v45;
    swift_release();
    sub_261569630();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_2615488F0((unint64_t *)&qword_26A9217E8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9217F0);
    sub_261548C3C((unint64_t *)&qword_26A9217F8, &qword_26A9217F0);
    uint64_t v50 = v54;
    sub_261569990();
    MEMORY[0x263E3A5D0](0, v21, v50, v48);
    _Block_release(v48);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v50, v14);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v21, v55);
  }
  else
  {
    if (qword_26A9215D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v22, (uint64_t)qword_26A9215D8);
    os_log_t v68 = (os_log_t)sub_2615695F0();
    os_log_type_t v34 = sub_2615698B0();
    if (os_log_type_enabled(v68, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_26153C000, v68, v34, "look-snapshotting command buffer did not complete successfully", v35, 2u);
      MEMORY[0x263E3AFE0](v35, -1, -1);
    }
    os_log_t v36 = v68;
  }
}

uint64_t sub_261542D1C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6, size_t a7, uint64_t a8, CGColorSpace *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v135 = a8;
  size_t v127 = a7;
  size_t v126 = a6;
  *(void *)&long long v128 = a5;
  double v13 = sub_261569610();
  Class isa = v13[-1].isa;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v17 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v114 - v18;
  *(void *)&long long v136 = sub_261569580();
  uint64_t v20 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  uint64_t v22 = (char *)&v114 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = swift_projectBox();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v24 = result;
  long long v117 = v17;
  unint64_t v25 = a11;
  int v130 = (char *)objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
  id v26 = a2;
  int64_t v27 = (int64_t)v26;
  uint64_t v28 = *(void *)(a3 + 16);
  int v129 = v13;
  if (!v28)
  {
    int v130 = 0;
    uint64_t v101 = 256;
    if (*(unsigned char *)(v24 + 296)) {
      uint64_t v101 = 264;
    }
    uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v24 + v101);
    unint64_t v31 = 0x26A921000;
    if (isUniquelyReferenced_nonNull_native == a11)
    {
LABEL_81:
      sub_26154417C(v25);
      goto LABEL_94;
    }
    goto LABEL_76;
  }
  Class v114 = isa;
  uint64_t v119 = v19;
  int64_t v116 = (int64_t)v26;
  CGColorSpaceRef v124 = a9;
  BOOL v29 = (size_t *)(v135 + 16);
  uint64_t v118 = v24;
  unsigned int v131 = (uint64_t *)(v24 + 128);
  swift_beginAccess();
  uint64_t v123 = v29;
  swift_beginAccess();
  uint64_t isUniquelyReferenced_nonNull_native = 0;
  uint64_t v24 = 0;
  uint64_t v134 = *(void (***)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v135 = v20 + 16;
  uint64_t v133 = (void (**)(char *, NSObject *))(v20 + 8);
  uint64_t v115 = a3;
  Class isa = (Class)(a3 + 40);
  uint64_t v120 = a10;
  unint64_t v122 = a10 - 70;
  uint64_t v132 = a11;
  unint64_t v31 = 0x26A921000;
  uint64_t v121 = v28;
  int64_t v27 = v128;
  while (1)
  {
    double v13 = v136;
    ((void (*)(char *, uint64_t, void))v134)(v22, v137, v136);
    char v34 = sub_261569570();
    (*v133)(v22, v13);
    if ((v34 & 1) == 0) {
      break;
    }
LABEL_7:
    ++v24;
    Class isa = (Class)((char *)isa + 16);
    if (v28 == v24)
    {
      int v130 = (char *)isUniquelyReferenced_nonNull_native;
      uint64_t v24 = v118;
      uint64_t v62 = 256;
      if (*(unsigned char *)(v118 + 296)) {
        uint64_t v62 = 264;
      }
      uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v118 + v62);
      if (isUniquelyReferenced_nonNull_native == v25)
      {
        uint64_t v63 = v115;
        swift_bridgeObjectRetain();
        uint64_t v137 = v24 + 120;
        swift_beginAccess();
        swift_beginAccess();
        uint64_t v134 = (void (**)(char *, uint64_t, uint64_t))((char *)v114 + 16);
        uint64_t v133 = (void (**)(char *, NSObject *))((char *)v114 + 8);
        uint64_t v64 = (unint64_t *)(v63 + 40);
        *(void *)&long long v65 = 136446210;
        long long v136 = v65;
        uint64_t v135 = MEMORY[0x263F8EE58] + 8;
        *(void *)&long long v65 = 136446466;
        long long v128 = v65;
        size_t v127 = (size_t)"Unknown Orientation";
        size_t v126 = (size_t)"WallpaperCoordinator setup";
        uint64_t v66 = (uint64_t)v129;
        while (1)
        {
          uint64_t v67 = v28;
          uint64_t v69 = *(v64 - 1);
          unint64_t v68 = *v64;
          uint64_t v70 = *(void *)v137;
          uint64_t v71 = *(void *)(*(void *)v137 + 16);
          swift_bridgeObjectRetain();
          if (!v71) {
            goto LABEL_49;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v72 = sub_261545AD4(v69, v68);
          if ((v73 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_49:
            if (*(void *)(v31 + 1488) != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v66, (uint64_t)qword_26A9215D8);
            swift_bridgeObjectRetain();
            long long v81 = sub_2615695F0();
            os_log_type_t v82 = sub_2615698B0();
            if (os_log_type_enabled(v81, v82))
            {
              uint64_t v83 = swift_slowAlloc();
              uint64_t v84 = swift_slowAlloc();
              v140[0] = v84;
              *(_DWORD *)uint64_t v83 = v136;
              swift_bridgeObjectRetain();
              *(void *)(v83 + 4) = sub_2615453FC(v69, v68, v140);
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_26153C000, v81, v82, "layer for the “%{public}s” snapshot does not exist!", (uint8_t *)v83, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x263E3AFE0](v84, -1, -1);
              MEMORY[0x263E3AFE0](v83, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            goto LABEL_41;
          }
          id v74 = *(id *)(*(void *)(v70 + 56) + 8 * v72);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(void *)(v31 + 1488) != -1) {
            swift_once();
          }
          uint64_t v75 = __swift_project_value_buffer(v66, (uint64_t)qword_26A9215D8);
          swift_bridgeObjectRetain_n();
          uint64_t v76 = sub_2615695F0();
          os_log_type_t v77 = sub_2615698A0();
          if (os_log_type_enabled(v76, v77))
          {
            uint64_t v78 = swift_slowAlloc();
            uint64_t v79 = swift_slowAlloc();
            v140[0] = v79;
            *(_DWORD *)uint64_t v78 = v136;
            swift_bridgeObjectRetain();
            *(void *)(v78 + 4) = sub_2615453FC(v69, v68, v140);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_26153C000, v76, v77, "applying snapshot to layer for “%{public}s”", (uint8_t *)v78, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x263E3AFE0](v79, -1, -1);
            uint64_t v80 = v78;
            uint64_t v66 = (uint64_t)v129;
            MEMORY[0x263E3AFE0](v80, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v85 = *v131;
          if (!*(void *)(*v131 + 16)) {
            goto LABEL_60;
          }
          unint64_t v86 = sub_261545B4C(v132);
          if ((v87 & 1) == 0) {
            goto LABEL_60;
          }
          uint64_t v88 = *(void *)(*(void *)(v85 + 56) + 8 * v86);
          if (!*(void *)(v88 + 16)) {
            goto LABEL_60;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v89 = sub_261545AD4(v69, v68);
          if ((v90 & 1) == 0) {
            break;
          }
          id v91 = *(id *)(*(void *)(v88 + 56) + 8 * v89);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          id v92 = v91;
          objc_msgSend(v74, sel_setContents_, v92);

LABEL_70:
          unint64_t v31 = 0x26A921000;
LABEL_41:
          v64 += 2;
          uint64_t v28 = v67 - 1;
          if (v67 == 1)
          {
            swift_bridgeObjectRelease();
            uint64_t v24 = v118;
            unint64_t v25 = v132;
            int64_t v27 = v116;
            goto LABEL_81;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_60:
        uint64_t v93 = v119;
        (*v134)(v119, v75, v66);
        swift_bridgeObjectRetain();
        uint64_t v94 = sub_2615695F0();
        os_log_type_t v95 = sub_2615698B0();
        if (os_log_type_enabled(v94, v95))
        {
          uint64_t v96 = swift_slowAlloc();
          uint64_t v97 = swift_slowAlloc();
          v140[0] = v97;
          *(_DWORD *)uint64_t v96 = v128;
          swift_bridgeObjectRetain();
          *(void *)(v96 + 4) = sub_2615453FC(v69, v68, v140);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v96 + 12) = 2082;
          uint64_t v98 = 0xD000000000000014;
          size_t v99 = v127 | 0x8000000000000000;
          CGColorSpaceRef v100 = v119;
          switch(v132)
          {
            case 1:
              size_t v99 = 0xE800000000000000;
              uint64_t v98 = 0x7469617274726F50;
              break;
            case 2:
              break;
            case 3:
              size_t v99 = 0xEF74686769522065;
              goto LABEL_66;
            case 4:
              size_t v99 = 0xEE007466654C2065;
LABEL_66:
              uint64_t v98 = 0x70616373646E614CLL;
              break;
            default:
              size_t v99 = v126 | 0x8000000000000000;
              uint64_t v98 = 0xD000000000000013;
              CGColorSpaceRef v100 = v119;
              break;
          }
          *(void *)(v96 + 14) = sub_2615453FC(v98, v99, v140);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_26153C000, v94, v95, "missing snapshot for “%{public}s” in orientation %{public}s — clearing contents", (uint8_t *)v96, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x263E3AFE0](v97, -1, -1);
          MEMORY[0x263E3AFE0](v96, -1, -1);

          uint64_t v66 = (uint64_t)v129;
          (*v133)(v100, v129);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*v133)(v93, v66);
        }
        objc_msgSend(v74, sel_setContents_, 0);
        goto LABEL_70;
      }
      double v13 = v129;
      int64_t v27 = v116;
      Class isa = v114;
LABEL_76:
      if (*(void *)(v31 + 1488) != -1) {
        goto LABEL_99;
      }
      goto LABEL_77;
    }
  }
  if ((unsigned __int128)(v24 * (__int128)v27) >> 64 == (v24 * v27) >> 63)
  {
    uint64_t v35 = CGDataProviderCreateWithData(0, &v130[v24 * v27], v27, (CGDataProviderReleaseDataCallback)nullsub_1);
    if (v35)
    {
      double v13 = v35;
      if (v122 < 2)
      {
        CGBitmapInfo v36 = 16389;
      }
      else if ((unint64_t)(v120 - 80) >= 2)
      {
        if (v120 != 115) {
          goto LABEL_101;
        }
        CGBitmapInfo v36 = 261;
      }
      else
      {
        CGBitmapInfo v36 = 8198;
      }
      CGImageRef v40 = CGImageCreate(v126, v127, 8uLL, 0x20uLL, *v123, v124, v36, v35, 0, 0, kCGRenderingIntentDefault);
      if (v40)
      {
        CGImageRef v41 = v40;
        uint64_t v42 = *(void *)isa;
        uint64_t v125 = *((void *)isa - 1);
        uint64_t v43 = v131;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        int64_t v27 = v41;
        sub_261547F20(isUniquelyReferenced_nonNull_native);
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v138 = *v43;
        uint64_t v44 = v138;
        *uint64_t v43 = 0x8000000000000000;
        unint64_t v25 = sub_261545B4C(v25);
        uint64_t v46 = *(void *)(v44 + 16);
        BOOL v47 = (v45 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47)) {
          goto LABEL_97;
        }
        char v49 = v45;
        if (*(void *)(v44 + 24) >= v48)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2615477C8();
            uint64_t v44 = v138;
          }
        }
        else
        {
          sub_261546590(v48, isUniquelyReferenced_nonNull_native);
          type metadata accessor for UIInterfaceOrientation(0);
          uint64_t v44 = v138;
          unint64_t v50 = sub_261545B4C(v132);
          if ((v49 & 1) != (v51 & 1))
          {
            sub_261569B70();
            __break(1u);
LABEL_101:
            v140[0] = 0;
            v140[1] = 0xE000000000000000;
            sub_2615699E0();
            sub_261569760();
            uint64_t v138 = v120;
            type metadata accessor for MTLPixelFormat(0);
            sub_261569A70();
            sub_261569A90();
            __break(1u);
            JUMPOUT(0x2615440B0);
          }
          unint64_t v25 = v50;
        }
        uint64_t v56 = v131;
        *unsigned int v131 = v44;
        swift_bridgeObjectRelease();
        uint64_t v57 = (void *)*v56;
        swift_bridgeObjectRetain();
        uint64_t isUniquelyReferenced_nonNull_native = 8 * v25;
        if ((v49 & 1) == 0)
        {
          unint64_t v58 = sub_26153EC44(MEMORY[0x263F8EE78], &qword_26A921768);
          v57[(v25 >> 6) + 8] |= 1 << v25;
          *(void *)(v57[6] + 8 * v25) = v132;
          *(void *)(v57[7] + 8 * v25) = v58;
          uint64_t v59 = v57[2];
          BOOL v60 = __OFADD__(v59, 1);
          uint64_t v61 = v59 + 1;
          if (v60) {
            goto LABEL_98;
          }
          v57[2] = v61;
        }
        uint64_t v32 = v57[7];
        swift_bridgeObjectRelease();
        char v33 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v138 = *(void *)(v32 + 8 * v25);
        *(void *)(v32 + 8 * v25) = 0x8000000000000000;
        sub_2615471E0(v27, v125, v42, v33, &qword_26A921768);
        *(void *)(v32 + 8 * v25) = v138;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_2615440E4;
        double v13 = v27;
        unint64_t v25 = v132;
        unint64_t v31 = 0x26A921000uLL;
        uint64_t v28 = v121;
      }
      else
      {
        if (*(void *)(v31 + 1488) != -1) {
          swift_once();
        }
        __swift_project_value_buffer((uint64_t)v129, (uint64_t)qword_26A9215D8);
        uint64_t v52 = sub_2615695F0();
        os_log_type_t v53 = sub_2615698B0();
        if (os_log_type_enabled(v52, v53))
        {
          char v54 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v54 = 0;
          _os_log_impl(&dword_26153C000, v52, v53, "couldn’t create image from data", v54, 2u);
          uint64_t v55 = v54;
          uint64_t v28 = v121;
          MEMORY[0x263E3AFE0](v55, -1, -1);
        }
      }
      int64_t v27 = v128;
    }
    else
    {
      if (*(void *)(v31 + 1488) != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v129, (uint64_t)qword_26A9215D8);
      double v13 = sub_2615695F0();
      os_log_type_t v37 = sub_2615698B0();
      if (os_log_type_enabled(v13, v37))
      {
        unint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v38 = 0;
        _os_log_impl(&dword_26153C000, v13, v37, "couldn’t create data provider", v38, 2u);
        uint64_t v39 = v38;
        int64_t v27 = v128;
        MEMORY[0x263E3AFE0](v39, -1, -1);
      }
    }

    goto LABEL_7;
  }
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  swift_once();
LABEL_77:
  uint64_t v102 = __swift_project_value_buffer((uint64_t)v13, (uint64_t)qword_26A9215D8);
  uint64_t v103 = v117;
  (*((void (**)(char *, uint64_t, NSObject *))isa + 2))(v117, v102, v13);
  v104 = sub_2615695F0();
  os_log_type_t v105 = sub_2615698A0();
  if (os_log_type_enabled(v104, v105))
  {
    int64_t v116 = v27;
    uint64_t v118 = v24;
    uint64_t v106 = swift_slowAlloc();
    uint64_t v107 = swift_slowAlloc();
    v140[0] = v107;
    *(_DWORD *)uint64_t v106 = 136446466;
    uint64_t v108 = isUniquelyReferenced_nonNull_native - 1;
    uint64_t v109 = 0xD000000000000014;
    unint64_t v110 = 0x800000026156CAD0;
    switch(v108)
    {
      case 0:
        unint64_t v110 = 0xE800000000000000;
        uint64_t v109 = 0x7469617274726F50;
        break;
      case 1:
        break;
      case 2:
        unint64_t v110 = 0xEF74686769522065;
        goto LABEL_85;
      case 3:
        unint64_t v110 = 0xEE007466654C2065;
LABEL_85:
        uint64_t v109 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v110 = 0x800000026156CAB0;
        uint64_t v109 = 0xD000000000000013;
        break;
    }
    uint64_t v138 = sub_2615453FC(v109, v110, v140);
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v106 + 12) = 2082;
    uint64_t v111 = 0xD000000000000014;
    unint64_t v112 = 0x800000026156CAD0;
    switch(v25)
    {
      case 1uLL:
        unint64_t v112 = 0xE800000000000000;
        uint64_t v111 = 0x7469617274726F50;
        break;
      case 2uLL:
        break;
      case 3uLL:
        unint64_t v112 = 0xEF74686769522065;
        goto LABEL_91;
      case 4uLL:
        unint64_t v112 = 0xEE007466654C2065;
LABEL_91:
        uint64_t v111 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v112 = 0x800000026156CAB0;
        break;
    }
    uint64_t v138 = sub_2615453FC(v111, v112, v140);
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v104, v105, "not applying snapshots (final orientation %{public}s, these are %{public}s)", (uint8_t *)v106, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v107, -1, -1);
    MEMORY[0x263E3AFE0](v106, -1, -1);

    (*((void (**)(char *, NSObject *))isa + 1))(v117, v129);
    uint64_t v24 = v118;
    int64_t v27 = v116;
  }
  else
  {

    (*((void (**)(char *, NSObject *))isa + 1))(v103, v13);
  }
LABEL_94:
  swift_beginAccess();
  swift_unknownObjectRetain();
  char v113 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v139 = *(void *)(v24 + 144);
  *(void *)(v24 + 144) = 0x8000000000000000;
  sub_261547368(v27, v25, v113);
  *(void *)(v24 + 144) = v139;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return sub_261547F20((uint64_t)v130);
}

unint64_t sub_2615440E4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_26153EC44(MEMORY[0x263F8EE78], &qword_26A921768);
  *a1 = result;
  return result;
}

uint64_t sub_26154411C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_26154417C(uint64_t isUniquelyReferenced_nonNull_native)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_261569610();
  unint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v60 - v9;
  uint64_t v11 = 32;
  if (*((unsigned char *)v2 + 296)) {
    uint64_t v11 = 33;
  }
  if (v2[v11] == isUniquelyReferenced_nonNull_native)
  {
    if (qword_26A9215D0 != -1) {
LABEL_64:
    }
      swift_once();
    uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_26A9215D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v12, v4);
    double v13 = sub_2615695F0();
    os_log_type_t v14 = sub_2615698A0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v64[0] = v16;
      *(_DWORD *)uint64_t v15 = 136446210;
      uint64_t v61 = v16;
      int64_t v62 = isUniquelyReferenced_nonNull_native;
      uint64_t v17 = 0xD000000000000014;
      unint64_t v18 = 0x800000026156CAD0;
      switch(isUniquelyReferenced_nonNull_native)
      {
        case 1:
          unint64_t v18 = 0xE800000000000000;
          uint64_t v17 = 0x7469617274726F50;
          break;
        case 2:
          break;
        case 3:
          unint64_t v18 = 0xEF74686769522065;
          goto LABEL_16;
        case 4:
          unint64_t v18 = 0xEE007466654C2065;
LABEL_16:
          uint64_t v17 = 0x70616373646E614CLL;
          break;
        default:
          unint64_t v18 = 0x800000026156CAB0;
          break;
      }
      uint64_t v65 = sub_2615453FC(v17, v18, v64);
      sub_261569960();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26153C000, v13, v14, "cleaning up non-%{public}s snapshots", v15, 0xCu);
      uint64_t v28 = v61;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v28, -1, -1);
      MEMORY[0x263E3AFE0](v15, -1, -1);

      BOOL v29 = *(void (**)(char *, uint64_t))(v5 + 8);
      v5 += 8;
      v29(v10, v4);
      uint64_t isUniquelyReferenced_nonNull_native = v62;
    }
    else
    {

      int64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
      v5 += 8;
      v27(v10, v4);
    }
    uint64_t v65 = sub_261548714((uint64_t)&unk_270D688F0);
    sub_261562BAC(isUniquelyReferenced_nonNull_native);
    int64_t v30 = 0;
    uint64_t v4 = v65;
    uint64_t v31 = *(void *)(v65 + 56);
    uint64_t v61 = v65 + 56;
    uint64_t v32 = 1 << *(unsigned char *)(v65 + 32);
    uint64_t v33 = -1;
    if (v32 < 64) {
      uint64_t v33 = ~(-1 << v32);
    }
    unint64_t v34 = v33 & v31;
    uint64_t v35 = v2 + 16;
    v2 += 18;
    int64_t v62 = (unint64_t)(v32 + 63) >> 6;
    while (1)
    {
      if (v34)
      {
        unint64_t v36 = __clz(__rbit64(v34));
        v34 &= v34 - 1;
        unint64_t v37 = v36 | (v30 << 6);
      }
      else
      {
        int64_t v38 = v30 + 1;
        if (__OFADD__(v30, 1)) {
          goto LABEL_62;
        }
        if (v38 >= v62) {
          return swift_release();
        }
        unint64_t v39 = *(void *)(v61 + 8 * v38);
        ++v30;
        if (!v39)
        {
          int64_t v30 = v38 + 1;
          if (v38 + 1 >= v62) {
            return swift_release();
          }
          unint64_t v39 = *(void *)(v61 + 8 * v30);
          if (!v39)
          {
            int64_t v30 = v38 + 2;
            if (v38 + 2 >= v62) {
              return swift_release();
            }
            unint64_t v39 = *(void *)(v61 + 8 * v30);
            if (!v39)
            {
              int64_t v40 = v38 + 3;
              if (v40 >= v62) {
                return swift_release();
              }
              unint64_t v39 = *(void *)(v61 + 8 * v40);
              if (!v39)
              {
                while (1)
                {
                  int64_t v30 = v40 + 1;
                  if (__OFADD__(v40, 1)) {
                    goto LABEL_63;
                  }
                  if (v30 >= v62) {
                    return swift_release();
                  }
                  unint64_t v39 = *(void *)(v61 + 8 * v30);
                  ++v40;
                  if (v39) {
                    goto LABEL_42;
                  }
                }
              }
              int64_t v30 = v40;
            }
          }
        }
LABEL_42:
        unint64_t v34 = (v39 - 1) & v39;
        unint64_t v37 = __clz(__rbit64(v39)) + (v30 << 6);
      }
      uint64_t v10 = *(char **)(*(void *)(v4 + 48) + 8 * v37);
      swift_beginAccess();
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v63 = (void *)*v35;
      CGImageRef v41 = v63;
      void *v35 = 0x8000000000000000;
      unint64_t v5 = sub_261545B4C((uint64_t)v10);
      uint64_t v43 = v41[2];
      BOOL v44 = (v42 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44))
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
      char v46 = v42;
      if (v41[3] >= v45)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_2615477C8();
        }
      }
      else
      {
        sub_261546590(v45, isUniquelyReferenced_nonNull_native);
        unint64_t v47 = sub_261545B4C((uint64_t)v10);
        if ((v46 & 1) != (v48 & 1))
        {
          type metadata accessor for UIInterfaceOrientation(0);
          sub_261569B70();
          __break(1u);
          JUMPOUT(0x2615449D0);
        }
        unint64_t v5 = v47;
      }
      char v49 = v63;
      uint64_t isUniquelyReferenced_nonNull_native = 8 * v5;
      if (v46)
      {
        uint64_t v50 = v63[7];
        swift_bridgeObjectRelease();
        *(void *)(v50 + 8 * v5) = MEMORY[0x263F8EE80];
      }
      else
      {
        v63[(v5 >> 6) + 8] |= 1 << v5;
        *(void *)(v49[6] + 8 * v5) = v10;
        *(void *)(v49[7] + 8 * v5) = MEMORY[0x263F8EE80];
        uint64_t v51 = v49[2];
        BOOL v52 = __OFADD__(v51, 1);
        uint64_t v53 = v51 + 1;
        if (v52) {
          goto LABEL_61;
        }
        v49[2] = v53;
      }
      void *v35 = v49;
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_beginAccess();
      unint64_t v54 = sub_261545B4C((uint64_t)v10);
      if (v55)
      {
        unint64_t v56 = v54;
        char v57 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v58 = *v2;
        uint64_t v63 = (void *)*v2;
        uint64_t *v2 = 0x8000000000000000;
        if ((v57 & 1) == 0)
        {
          sub_261547624();
          uint64_t v58 = (uint64_t)v63;
        }
        sub_261546E4C(v56, v58);
        uint64_t v10 = (char *)*v2;
        uint64_t *v2 = v58;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
    }
  }
  if (qword_26A9215D0 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v4, (uint64_t)qword_26A9215D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v19, v4);
  uint64_t v20 = sub_2615695F0();
  os_log_type_t v21 = sub_2615698B0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v64[0] = v23;
    *(_DWORD *)uint64_t v22 = 136446210;
    uint64_t v24 = isUniquelyReferenced_nonNull_native - 1;
    uint64_t v25 = 0xD000000000000014;
    unint64_t v26 = 0x800000026156CAD0;
    switch(v24)
    {
      case 0:
        unint64_t v26 = 0xE800000000000000;
        uint64_t v25 = 0x7469617274726F50;
        break;
      case 1:
        break;
      case 2:
        unint64_t v26 = 0xEF74686769522065;
        goto LABEL_19;
      case 3:
        unint64_t v26 = 0xEE007466654C2065;
LABEL_19:
        uint64_t v25 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v26 = 0x800000026156CAB0;
        break;
    }
    uint64_t v65 = sub_2615453FC(v25, v26, v64);
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v20, v21, "asked to clean up non-%{public}s snapshots while not in that orientation — skipping", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v23, -1, -1);
    MEMORY[0x263E3AFE0](v22, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.deinit()
{
  sub_261544B80(v0 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v1 = *(_OWORD *)(v0 + 248);
  long long v2 = *(_OWORD *)(v0 + 280);
  v6[6] = *(_OWORD *)(v0 + 264);
  v6[7] = v2;
  char v7 = *(unsigned char *)(v0 + 296);
  long long v3 = *(_OWORD *)(v0 + 184);
  long long v4 = *(_OWORD *)(v0 + 216);
  v6[2] = *(_OWORD *)(v0 + 200);
  v6[3] = v4;
  v6[4] = *(_OWORD *)(v0 + 232);
  v6[5] = v1;
  v6[0] = *(_OWORD *)(v0 + 168);
  v6[1] = v3;
  sub_2615480E8((uint64_t)v6, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
  sub_261544BE0(*(void *)(v0 + 304), *(void *)(v0 + 312), *(void *)(v0 + 320), *(void *)(v0 + 328), *(unsigned int *)(v0 + 336) | ((unint64_t)*(unsigned __int8 *)(v0 + 340) << 32));

  return v0;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.__deallocating_deinit()
{
  WallpaperMetalCoordination.EditingCoordinator.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_261544B2C()
{
  unint64_t result = qword_26A921BF0;
  if (!qword_26A921BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921BF0);
  }
  return result;
}

uint64_t sub_261544B80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921640);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_261544BE0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (BYTE4(a5) != 255) {
    return sub_261544BF8(result, a2, a3, a4, a5, BYTE4(a5) & 1);
  }
  return result;
}

uint64_t sub_261544BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a6)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for WallpaperMetalCoordination.EditingCoordinator()
{
  return self;
}

uint64_t sub_261544C6C()
{
  return sub_261569BF0();
}

uint64_t sub_261544CB4()
{
  return sub_261569BE0();
}

uint64_t sub_261544CE0()
{
  return sub_261569BF0();
}

BOOL sub_261544D24(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_261544D38@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_261544D48(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_261544D54(uint64_t a1, uint64_t a2)
{
  return sub_261544EC0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_261544D6C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2615696E0();
  *a2 = 0;
  return result;
}

uint64_t sub_261544DE4(uint64_t a1, id *a2)
{
  char v3 = sub_2615696F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_261544E64@<X0>(uint64_t *a1@<X8>)
{
  sub_261569700();
  uint64_t v2 = sub_2615696D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_261544EA8(uint64_t a1, uint64_t a2)
{
  return sub_261544EC0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_261544EC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_261569700();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_261544F04()
{
  sub_261569700();
  sub_261569730();
  return swift_bridgeObjectRelease();
}

uint64_t sub_261544F58()
{
  sub_261569700();
  sub_261569BD0();
  sub_261569730();
  uint64_t v0 = sub_261569BF0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_261544FCC()
{
  return sub_2615695E0();
}

uint64_t sub_261545018()
{
  return sub_2615695D0();
}

uint64_t sub_261545070()
{
  return sub_261569BF0();
}

uint64_t sub_2615450D8()
{
  uint64_t v0 = sub_261569700();
  uint64_t v2 = v1;
  if (v0 == sub_261569700() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_261569B40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_261545164()
{
  swift_getWitnessTable();
  return sub_2615695C0();
}

uint64_t sub_2615451D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2615696D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_261545218@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_261569700();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_261545244(uint64_t a1)
{
  uint64_t v2 = sub_2615488F0(&qword_26A921848, type metadata accessor for IOSurfacePropertyKey);
  uint64_t v3 = sub_2615488F0((unint64_t *)&unk_26A921850, type metadata accessor for IOSurfacePropertyKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_261545300(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_261545310(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_26154534C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_26154535C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_261545384(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2615453FC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_261569960();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2615453FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2615454D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2615489EC((uint64_t)v12, *a3);
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
      sub_2615489EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2615454D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_261569970();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_26154568C(a5, a6);
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
  uint64_t v8 = sub_261569A10();
  if (!v8)
  {
    sub_261569A80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_261569AF0();
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

uint64_t sub_26154568C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_261545724(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_261545904(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_261545904(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_261545724(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_26154589C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2615699F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_261569A80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_261569770();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_261569AF0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_261569A80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_26154589C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E328);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_261545904(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E328);
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
  double v13 = a4 + 32;
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
  uint64_t result = sub_261569AF0();
  __break(1u);
  return result;
}

uint64_t sub_261545A54(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_261545A7C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_261569960();
  *a1 = v5;
  return result;
}

unint64_t sub_261545AD4(uint64_t a1, uint64_t a2)
{
  sub_261569BD0();
  sub_261569730();
  uint64_t v4 = sub_261569BF0();
  return sub_261545D44(a1, a2, v4);
}

unint64_t sub_261545B4C(uint64_t a1)
{
  sub_261569BD0();
  sub_261569BE0();
  uint64_t v2 = sub_261569BF0();
  return sub_261545E28(a1, v2);
}

unint64_t sub_261545BB8(uint64_t a1)
{
  sub_261569700();
  sub_261569BD0();
  sub_261569730();
  uint64_t v2 = sub_261569BF0();
  swift_bridgeObjectRelease();
  return sub_261545EC4(a1, v2);
}

unint64_t sub_261545C4C(uint64_t a1)
{
  sub_261569BD0();
  type metadata accessor for CFString(0);
  sub_2615488F0(&qword_26A921788, type metadata accessor for CFString);
  sub_2615695D0();
  uint64_t v2 = sub_261569BF0();
  return sub_26154603C(a1, v2);
}

unint64_t sub_261545D00(uint64_t a1)
{
  uint64_t v2 = sub_261569930();
  return sub_261546198(a1, v2);
}

unint64_t sub_261545D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_261569B40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        double v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_261569B40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_261545E28(uint64_t a1, uint64_t a2)
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

unint64_t sub_261545EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_261569700();
    uint64_t v8 = v7;
    if (v6 == sub_261569700() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_261569B40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_261569700();
          uint64_t v15 = v14;
          if (v13 == sub_261569700() && v15 == v16) {
            break;
          }
          char v18 = sub_261569B40();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_26154603C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_2615488F0(&qword_26A921788, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_2615695C0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_2615695C0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_261546198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_261548B60(0, (unint64_t *)&unk_26B40E318);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_261569940();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_261569940();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_2615462B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921758);
  uint64_t result = sub_261569AD0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_unknownObjectRetain();
      }
      sub_261569BD0();
      sub_261569BE0();
      uint64_t result = sub_261569BF0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_261546590(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921750);
  uint64_t result = sub_261569AD0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_261569BD0();
      sub_261569BE0();
      uint64_t result = sub_261569BF0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_26154686C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_261569AD0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  unint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    char v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_261569BD0();
    sub_261569730();
    uint64_t result = sub_261569BF0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  char v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_261546B78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E020);
  uint64_t v6 = sub_261569AD0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    char v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v32;
      id v34 = v31;
    }
    uint64_t result = sub_261569930();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  char v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_261546E4C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2615699A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_261569BD0();
        sub_261569BE0();
        uint64_t result = sub_261569BF0();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          int64_t v11 = (void *)(v10 + 8 * v3);
          uint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *int64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          int64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *int64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_261547008(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2615699A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_261569BD0();
        swift_bridgeObjectRetain();
        sub_261569730();
        uint64_t v9 = sub_261569BF0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_2615471E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_261545AD4(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_261547978(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_26154686C(v17, a4 & 1, a5);
  unint64_t v22 = sub_261545AD4(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_261569B70();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;
  swift_bridgeObjectRetain();
}

uint64_t sub_261547368(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_261545B4C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_261547624();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_2615462B4(result, a3 & 1);
  uint64_t result = sub_261545B4C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for UIInterfaceOrientation(0);
  uint64_t result = sub_261569B70();
  __break(1u);
  return result;
}

void sub_2615474A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2615474B0(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_261545D00((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_261547B24();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_261546B78(v12, a3 & 1);
  unint64_t v17 = sub_261545D00((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_261548B60(0, (unint64_t *)&unk_26B40E318);
    sub_261569B70();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

void *sub_261547624()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921758);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_261569AC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2615477C8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921750);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_261569AC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_26154796C()
{
  return sub_261547978((uint64_t *)&unk_26A9217A0);
}

id sub_261547978(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_261569AC0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    int64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    BOOL v21 = *(void **)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_261547B24()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E020);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_261569AC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    int64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v18;
    id result = v17;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_261547CCC(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921750);
  uint64_t v3 = (void *)sub_261569AE0();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_261545B4C(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_261545B4C(v5);
    unint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_261547DCC(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921758);
  uint64_t v3 = (void *)sub_261569AE0();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_261545B4C(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_unknownObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_unknownObjectRetain();
    unint64_t result = sub_261545B4C(v5);
    unint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
}

uint64_t sub_261547EE0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_261547F18(void *a1)
{
  return sub_26153F0C0(a1);
}

uint64_t sub_261547F20(uint64_t result)
{
  if (result) {
    return swift_release();
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x263E3AFE0);
  }
  return result;
}

uint64_t sub_261548020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

uint64_t sub_26154809C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = vars8;
  }
  return swift_bridgeObjectRetain();
}

id sub_2615480DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6) {
    return a3;
  }
  return result;
}

uint64_t sub_2615480E8(uint64_t a1, void (*a2)(void, void, void, void, void, void), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 120);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 128);
  a2(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned int *)(a1 + 80), *(unsigned __int8 *)(a1 + 84));
  a3(v5, v6, v7, v8, v9, v10);
  return a1;
}

uint64_t sub_261548178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6) {
    return MEMORY[0x270F9A790]();
  }
  return result;
}

uint64_t sub_261548184(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255) {
    return sub_261548178(result, a2, a3, a4, a5, a6 & 1);
  }
  return result;
}

uint64_t method lookup function for WallpaperMetalCoordination.EditingCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WallpaperMetalCoordination.EditingCoordinator);
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.renderer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.__allocating_init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)()
{
  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.attachToViews(background:lookIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.handleEditingEnvironmentUpdate(_:animationSettings:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.updateLookTransition(progress:destinationIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.finishLookTransition(toIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

void *_s18EditingCoordinatorC18LookSelectionStyleOwCP(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s18EditingCoordinatorC18LookSelectionStyleOwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *_s18EditingCoordinatorC18LookSelectionStyleOwta(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_26154841C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_261548438(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle()
{
  return &type metadata for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle;
}

uint64_t _s14WallpaperStateV12RotationInfoOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_2615484B4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2615484D4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

void type metadata accessor for AnimationCurve(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Keyframe.Progress(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Keyframe.Progress(uint64_t result, int a2, int a3)
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

uint64_t sub_2615485B0()
{
  return sub_2615488F0(&qword_26A921748, type metadata accessor for UIInterfaceOrientation);
}

uint64_t sub_2615485F8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a2 - result;
  if (__OFSUB__(a2, result)) {
    goto LABEL_12;
  }
  uint64_t v6 = result;
  __n128 result = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    __n128 result = sub_261569A40();
    if (a2 < v6 || v5 < 0) {
      goto LABEL_13;
    }
    while (a2 != v6)
    {
      if ((unsigned __int128)(a5 * (__int128)v6) >> 64 != (a5 * v6) >> 63) {
        goto LABEL_11;
      }
      objc_msgSend(a3, sel_newTextureWithDescriptor_offset_bytesPerRow_, a4);
      sub_261569A20();
      sub_261569A50();
      sub_261569A60();
      __n128 result = sub_261569A30();
      if (a2 == ++v6) {
        return v11;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  return result;
}

uint64_t sub_261548714(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921760);
    uint64_t v3 = sub_2615699D0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = *(void *)(v6 + 8 * v4);
      sub_261569BD0();
      sub_261569BE0();
      uint64_t result = sub_261569BF0();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(void *)(v14 + 8 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(void *)(v14 + 8 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_261548858(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

uint64_t sub_2615488B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (BYTE4(a5) != 255) {
    return sub_26154809C(result, a2, a3, a4, a5, BYTE4(a5) & 1);
  }
  return result;
}

_OWORD *sub_2615488CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_2615488F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_261548938(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2615489EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_261548A4C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_261548AA4()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

void sub_261548B04(void *a1)
{
  sub_2615425BC(a1, *(NSObject **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void **)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104));
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

uint64_t sub_261548B60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_261548B9C()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_261548BFC()
{
  return sub_261542D1C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(CGColorSpace **)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96));
}

uint64_t sub_261548C3C(unint64_t *a1, uint64_t *a2)
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

void type metadata accessor for CGColorSpace(uint64_t a1)
{
}

void type metadata accessor for IOSurfacePropertyKey(uint64_t a1)
{
}

void type metadata accessor for IOSurfaceRef(uint64_t a1)
{
}

void sub_261548D2C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_261548D74()
{
  return sub_2615488F0(&qword_26A921820, type metadata accessor for IOSurfacePropertyKey);
}

uint64_t sub_261548DBC()
{
  return sub_2615488F0(&qword_26A921828, type metadata accessor for IOSurfacePropertyKey);
}

uint64_t sub_261548E04()
{
  return sub_2615488F0(&qword_26A921830, type metadata accessor for IOSurfacePropertyKey);
}

uint64_t sub_261548E4C()
{
  return sub_2615488F0((unint64_t *)&qword_26A921838, type metadata accessor for CFString);
}

uint64_t sub_261548E94()
{
  return sub_2615488F0(&qword_26A921840, type metadata accessor for CFString);
}

char *sub_261548EF4(uint64_t a1, uint64_t a2, CGColorSpace *a3)
{
  uint64_t v7 = &v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  *uint64_t v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 1;
  uint64_t v8 = &v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
  uint64_t v9 = sub_261569610();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering] = 0;
  uint64_t v10 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  type metadata accessor for DisplayLink();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v11 + 32) = 0;
  uint64_t v12 = self;
  uint64_t v13 = v3;
  id v14 = objc_msgSend(v12, sel_displayLinkWithTarget_selector_, v11, sel__displayLinkFired);
  uint64_t v15 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v14;

  *(void *)&v3[v10] = v11;
  v13[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive] = 0;
  uint64_t v16 = &v13[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo];
  uint64_t v17 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);

  v30.receiver = v13;
  v30.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
  uint64_t v18 = (char *)objc_msgSendSuper2(&v30, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v19 = objc_msgSend(v18, sel_layer);
  self;
  int64_t v20 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v21 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  uint64_t v22 = *(void *)&v18[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink];
  swift_beginAccess();
  *(void *)(v22 + 24) = &off_270D68D08;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_2615698D0();
  uint64_t result = *(char **)(v22 + 32);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(result, sel_setPreferredFrameRateRange_);
  swift_release();
  uint64_t result = *(char **)(*(void *)&v18[v21] + 32);
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_setPaused_, 1);
  objc_msgSend(v20, sel_setDevice_, a1);
  objc_msgSend(v20, sel_setPixelFormat_, a2);
  id v24 = objc_msgSend(v18, sel_layer);
  if (qword_26A921610 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9216B0);
  int64_t v25 = (void *)sub_261569660();
  objc_msgSend(v24, sel_setActions_, v25);

  id v26 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v26, sel_setPosition_, 0.0, 0.0);

  id v27 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v27, sel_setAnchorPoint_, 0.0, 0.0);

  if (a3) {
    CGColorSpaceRef v28 = a3;
  }
  else {
    CGColorSpaceRef v28 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  }
  uint64_t v29 = a3;
  objc_msgSend(v20, sel_setColorspace_, v28);

  objc_msgSend(v20, sel_setAllowsDisplayCompositing_, 0);
  objc_msgSend(v20, sel_setDelegate_, v18);
  objc_msgSend(v20, sel_setPresentsWithTransaction_, 1);

  swift_unknownObjectRelease();
  return v18;
}

id sub_261549388()
{
  id result = *(id *)(*(void *)&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink] + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    v2.receiver = v0;
    v2.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
    return objc_msgSendSuper2(&v2, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2615494C8(double a1)
{
  uint64_t v2 = v1;
  uint64_t v84 = sub_261569610();
  uint64_t v86 = *(void *)(v84 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v84);
  uint64_t v76 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v75 = (char *)&v73 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AB0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v80 = (uint64_t)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v73 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v78 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (id *)((char *)&v73 - v16);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v73 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC8);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v73 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_261569540();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  id v27 = (char *)&v73 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  objc_super v30 = (char *)&v73 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v73 - v31;
  sub_261569530();
  uint64_t v85 = v32;
  sub_261569500();
  os_log_type_t v82 = *(void (**)(char *, uint64_t))(v24 + 8);
  uint64_t v83 = v24 + 8;
  v82(v30, v23);
  uint64_t v87 = v2;
  uint64_t v33 = v2 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
  swift_beginAccess();
  uint64_t v81 = v33;
  sub_261548938(v33, (uint64_t)v19, &qword_26A921AC0);
  uint64_t v34 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  uint64_t v79 = *(void *)(v34 - 8);
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 48);
  int v36 = v35(v19, 1, v34);
  uint64_t v77 = v23;
  if (v36)
  {
    uint64_t v37 = v34;
    sub_26154B598((uint64_t)v19, &qword_26A921AC0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v22, 1, 1, v23);
LABEL_4:
    sub_26154B598((uint64_t)v22, &qword_26A921AC8);
    uint64_t v38 = v86;
    char v39 = v78;
    uint64_t v40 = v81;
LABEL_5:
    sub_261548938(v40, (uint64_t)v17, &qword_26A921AC0);
    if (v35((char *)v17, 1, v37))
    {
      sub_26154B598((uint64_t)v17, &qword_26A921AC0);
    }
    else
    {
      id v41 = *v17;
      sub_26154B598((uint64_t)v17, &qword_26A921AC0);
      objc_msgSend(v41, sel_invalidate);
    }
    uint64_t v42 = v84;
    uint64_t v43 = self;
    uint64_t v44 = swift_allocObject();
    uint64_t v45 = v87;
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_26154B62C;
    aBlock[5] = v44;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_26154A030;
    aBlock[3] = &block_descriptor_0;
    char v46 = _Block_copy(aBlock);
    swift_release();
    id v47 = objc_msgSend(v43, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v46, a1);
    _Block_release(v46);
    uint64_t v48 = v45 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
    swift_beginAccess();
    uint64_t v49 = v80;
    sub_261548938(v48, v80, &qword_26A921AB0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v49, 1, v42))
    {
      sub_26154B598(v49, &qword_26A921AB0);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v76, v49, v42);
      sub_26154B598(v49, &qword_26A921AB0);
      uint64_t v50 = sub_2615695F0();
      os_log_type_t v51 = sub_2615698C0();
      if (os_log_type_enabled(v50, v51))
      {
        BOOL v52 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)BOOL v52 = 134349056;
        uint64_t v42 = v84;
        double v88 = a1;
        sub_261569960();
        _os_log_impl(&dword_26153C000, v50, v51, "beginning timed continuous rendering for %{public}f seconds", v52, 0xCu);
        uint64_t v53 = v52;
        uint64_t v38 = v86;
        MEMORY[0x263E3AFE0](v53, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v38 + 8))(v76, v42);
    }
    uint64_t v54 = v77;
    uint64_t v55 = v79;
    unint64_t v56 = v85;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(&v39[*(int *)(v37 + 20)], v85, v77);
    *(void *)char v39 = v47;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v39, 0, 1, v37);
    swift_beginAccess();
    id v57 = v47;
    sub_26154B64C((uint64_t)v39, v40);
    swift_endAccess();
    sub_26154A098();
    sub_26154B598((uint64_t)v39, &qword_26A921AC0);

    return ((uint64_t (*)(char *, uint64_t))v82)(v56, v54);
  }
  id v74 = v27;
  uint64_t v37 = v34;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v22, &v19[*(int *)(v34 + 20)], v23);
  sub_26154B598((uint64_t)v19, &qword_26A921AC0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v22, 0, 1, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1) {
    goto LABEL_4;
  }
  uint64_t v59 = v74;
  (*(void (**)(void))(v24 + 32))();
  char v60 = sub_261569510();
  uint64_t v61 = v23;
  uint64_t v38 = v86;
  uint64_t v40 = v81;
  if ((v60 & 1) == 0)
  {
    v82(v59, v61);
    char v39 = v78;
    goto LABEL_5;
  }
  uint64_t v62 = v61;
  uint64_t v63 = v87 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
  swift_beginAccess();
  uint64_t v64 = (uint64_t)v11;
  sub_261548938(v63, (uint64_t)v11, &qword_26A921AB0);
  uint64_t v65 = v84;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v11, 1, v84))
  {
    uint64_t v66 = v82;
    v82(v74, v62);
    v66(v85, v62);
    return sub_26154B598((uint64_t)v11, &qword_26A921AB0);
  }
  else
  {
    uint64_t v67 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v75, v64, v65);
    sub_26154B598(v64, &qword_26A921AB0);
    unint64_t v68 = sub_2615695F0();
    os_log_type_t v69 = sub_2615698C0();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v70 = 0;
      _os_log_impl(&dword_26153C000, v68, v69, "display link already running and will stop later than requested: not updating timer", v70, 2u);
      uint64_t v71 = v70;
      uint64_t v38 = v86;
      MEMORY[0x263E3AFE0](v71, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v67, v65);
    unint64_t v72 = (uint64_t (*)(char *, uint64_t))v82;
    v82(v74, v62);
    return v72(v85, v62);
  }
}

void sub_261549F04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x263E3B0E0](a2 + 16);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
    uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
    swift_beginAccess();
    sub_26154B64C((uint64_t)v5, v9);
    swift_endAccess();
    sub_26154A098();
    sub_26154B598((uint64_t)v5, &qword_26A921AC0);
  }
}

void sub_26154A030(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_26154A098()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_261569610();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AB0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1
                + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) == 1)
  {
    uint64_t v18 = (unsigned char *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive);
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive)) {
      return;
    }
    goto LABEL_6;
  }
  uint64_t v40 = v6;
  uint64_t v19 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
  swift_beginAccess();
  sub_261548938(v19, (uint64_t)v17, &qword_26A921AC0);
  uint64_t v20 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v17, 1, v20);
  sub_26154B598((uint64_t)v17, &qword_26A921AC0);
  uint64_t v18 = (unsigned char *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive);
  if ((v21 != 1) != *(unsigned char *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive))
  {
    if (v21 != 1)
    {
LABEL_6:
      uint64_t v22 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
      swift_beginAccess();
      sub_261548938(v22, (uint64_t)v14, &qword_26A921AB0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v14, 1, v2))
      {
        sub_26154B598((uint64_t)v14, &qword_26A921AB0);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v14, v2);
        sub_26154B598((uint64_t)v14, &qword_26A921AB0);
        uint64_t v23 = sub_2615695F0();
        os_log_type_t v24 = sub_2615698C0();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl(&dword_26153C000, v23, v24, "🟢 starting display link", v25, 2u);
          MEMORY[0x263E3AFE0](v25, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      }
      uint64_t v26 = *(void *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink);
      id v27 = *(void **)(v26 + 32);
      if (v27)
      {
        objc_msgSend(v27, sel_setPaused_, 0);
        id v28 = objc_msgSend(self, sel_mainRunLoop);
        uint64_t v29 = *(void **)(v26 + 32);
        if (v29)
        {
          objc_msgSend(v29, sel_addToRunLoop_forMode_, v28, *MEMORY[0x263EFF588]);

          *uint64_t v18 = 1;
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink);
    id v31 = objc_msgSend(self, sel_mainRunLoop);
    uint64_t v32 = *(void **)(v30 + 32);
    if (!v32)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    objc_msgSend(v32, sel_removeFromRunLoop_forMode_, v31, *MEMORY[0x263EFF588]);

    uint64_t v33 = *(void **)(v30 + 32);
    uint64_t v34 = v40;
    if (!v33)
    {
LABEL_26:
      __break(1u);
      return;
    }
    objc_msgSend(v33, sel_setPaused_, 1);
    uint64_t v35 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
    swift_beginAccess();
    sub_261548938(v35, (uint64_t)v12, &qword_26A921AB0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2))
    {
      sub_26154B598((uint64_t)v12, &qword_26A921AB0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v34, v12, v2);
      sub_26154B598((uint64_t)v12, &qword_26A921AB0);
      int v36 = sub_2615695F0();
      os_log_type_t v37 = sub_2615698C0();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_26153C000, v36, v37, "🛑 stopped display link", v38, 2u);
        MEMORY[0x263E3AFE0](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v34, v2);
    }
    *uint64_t v18 = 0;
  }
}

uint64_t sub_26154A678()
{
  return type metadata accessor for WallpaperMetalView(0);
}

uint64_t type metadata accessor for WallpaperMetalView(uint64_t a1)
{
  return sub_26154A8CC(a1, (uint64_t *)&unk_26A921A10);
}

void sub_26154A734()
{
  sub_26154A858(319, &qword_26A921A20, MEMORY[0x263F90268]);
  if (v0 <= 0x3F)
  {
    sub_26154A858(319, &qword_26A921A28, (void (*)(uint64_t))type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_26154A858(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_261569950();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(uint64_t a1)
{
  return sub_26154A8CC(a1, qword_26A921A98);
}

uint64_t sub_26154A8CC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void **sub_26154A904(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_261569540();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_26154A9E4(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_261569540();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void **sub_26154AA5C(void **a1, void **a2, uint64_t a3)
{
  unint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_261569540();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_26154AAF0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_261569540();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *sub_26154AB80(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_261569540();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_26154ABFC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_261569540();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_26154AC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26154AC9C);
}

uint64_t sub_26154AC9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_261569540();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_26154AD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26154AD60);
}

void *sub_26154AD60(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_261569540();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_26154AE08()
{
  uint64_t result = sub_261569540();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_26154AEA8()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  *unint64_t v1 = 0;
  v1[1] = 0;
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 1;
  uint64_t v2 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
  uint64_t v3 = sub_261569610();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering] = 0;
  uint64_t v4 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  type metadata accessor for DisplayLink();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v5 + 32) = 0;
  id v6 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v5, sel__displayLinkFired);
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(void *)&v0[v4] = v5;
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive] = 0;
  uint64_t v8 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo];
  uint64_t v9 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  sub_261569A90();
  __break(1u);
}

void sub_26154B044()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_261569610();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AB0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically;
  if (v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] != 1) {
    goto LABEL_11;
  }
  uint64_t v10 = *(void **)(*(void *)&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink] + 32);
  if (!v10)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (!objc_msgSend(v10, sel_isPaused))
  {
LABEL_11:
    uint64_t v14 = (uint64_t)&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
    swift_beginAccess();
    sub_261548938(v14, (uint64_t)v8, &qword_26A921AB0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
    {
      sub_26154B598((uint64_t)v8, &qword_26A921AB0);
      return;
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_26154B598((uint64_t)v8, &qword_26A921AB0);
    uint64_t v15 = v1;
    uint64_t v16 = sub_2615695F0();
    os_log_type_t v17 = sub_2615698A0();
    if (!os_log_type_enabled(v16, v17))
    {

      uint64_t v16 = v15;
      goto LABEL_17;
    }
    uint64_t v18 = swift_slowAlloc();
    unsigned int v19 = v1[v9];
    *(_DWORD *)uint64_t v18 = 67109376;
    unsigned int v24 = v19;
    sub_261569960();
    *(_WORD *)(v18 + 8) = 1024;
    uint64_t v20 = (void *)(*(void **)((char *)&v15->isa
                              + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink))[4];
    if (v20)
    {
      unsigned int v24 = objc_msgSend(v20, sel_isPaused);
      sub_261569960();

      _os_log_impl(&dword_26153C000, v16, v17, "skipping needs-display render: should auto-draw %{BOOL}d, link paused %{BOOL}d", (uint8_t *)v18, 0xEu);
      MEMORY[0x263E3AFE0](v18, -1, -1);
LABEL_17:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return;
    }
LABEL_23:
    __break(1u);
    return;
  }
  uint64_t v11 = *(void (**)(id))&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  if (v11)
  {
    swift_retain();
    id v23 = objc_msgSend(v1, sel_layer);
    self;
    uint64_t v12 = (void *)swift_dynamicCastObjCClass();
    if (v12)
    {
      id v13 = objc_msgSend(v12, sel_nextDrawable);

      if (v13)
      {
        v11(v13);
        swift_unknownObjectRelease();
      }
      sub_261547F20((uint64_t)v11);
    }
    else
    {
      sub_261547F20((uint64_t)v11);
      id v21 = v23;
    }
  }
}

void sub_26154B438()
{
  unint64_t v1 = *(void (**)(id))&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  if (v1)
  {
    swift_retain();
    id v4 = objc_msgSend(v0, sel_layer);
    self;
    uint64_t v2 = (void *)swift_dynamicCastObjCClass();
    if (v2)
    {
      id v3 = objc_msgSend(v2, sel_nextDrawable);

      if (v3)
      {
        v1(v3);
        swift_unknownObjectRelease();
      }
      sub_261547F20((uint64_t)v1);
    }
    else
    {
      sub_261547F20((uint64_t)v1);
    }
  }
}

unint64_t sub_26154B558()
{
  unint64_t result = qword_26A921AB8;
  if (!qword_26A921AB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A921AB8);
  }
  return result;
}

uint64_t sub_26154B598(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_26154B5F4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_26154B62C(uint64_t a1)
{
  sub_261549F04(a1, v1);
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

uint64_t sub_26154B64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

double WallpaperMetalCoordination.WallpaperState.unlockState.getter@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)(v1 + 8);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(double *)(a1 + 8) = result;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.unlockState.setter(uint64_t a1)
{
  double result = *(double *)(a1 + 8);
  *(unsigned char *)uint64_t v1 = *(unsigned char *)a1;
  *(double *)(v1 + 8) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.unlockState.modify())()
{
  return nullsub_2;
}

__n128 WallpaperMetalCoordination.WallpaperState.wakeState.getter@<Q0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = *(unsigned char *)(v1 + 16);
  __n128 result = *(__n128 *)(v1 + 24);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

__n128 WallpaperMetalCoordination.WallpaperState.wakeState.setter(uint64_t a1)
{
  *(unsigned char *)(v1 + 16) = *(unsigned char *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v1 + 24) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.wakeState.modify())()
{
  return nullsub_2;
}

uint64_t WallpaperMetalCoordination.WallpaperState.isDarkMode.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t WallpaperMetalCoordination.WallpaperState.isDarkMode.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.isDarkMode.modify())()
{
  return nullsub_2;
}

uint64_t WallpaperMetalCoordination.WallpaperState.isTransient.getter()
{
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t WallpaperMetalCoordination.WallpaperState.isTransient.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 41) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.isTransient.modify())()
{
  return nullsub_2;
}

float WallpaperMetalCoordination.WallpaperState.rotationRadians.getter()
{
  sub_26154B7DC((long long *)(v0 + 88), v2);
  return sub_26154B7F4();
}

_OWORD *sub_26154B7DC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

float sub_26154B7F4()
{
  sub_26154B7DC(v0, &v15);
  uint64_t v1 = v16;
  sub_26154B7DC(v0, &v17);
  if (v21)
  {
    float v2 = 0.0;
    float v3 = 0.0;
    if ((unint64_t)(v17 - 2) <= 2) {
      float v3 = flt_26156AD24[(void)v17 - 2];
    }
    double v4 = v19;
    double v5 = v20;
    if ((unint64_t)(*((void *)&v17 + 1) - 2) <= 2) {
      float v2 = flt_26156AD24[*((void *)&v17 + 1) - 2];
    }
    uint64_t v6 = v18;
    id v7 = v1;
    CFAbsoluteTime v8 = (CFAbsoluteTimeGetCurrent() - v4) / v5;
    *(float *)&CFAbsoluteTime v8 = v8;
    if (*(float *)&v8 >= 1.0)
    {
      sub_26154CF18((uint64_t)v0, (void (*)(void, void, void, void, void, void))sub_261548178);
    }
    else
    {
      if (*(float *)&v8 > 1.0) {
        *(float *)&CFAbsoluteTime v8 = 1.0;
      }
      objc_msgSend(v6, sel__solveForInput_, v8);
      float v10 = v9;
      sub_26154CF18((uint64_t)v0, (void (*)(void, void, void, void, void, void))sub_261548178);
      float v11 = fabsf(vabds_f32(v2, v3) + -3.1416);
      float v12 = (float)(v2 - v3) + 6.2832;
      if ((float)(v2 - v3) >= -3.1416) {
        float v12 = v2 - v3;
      }
      if ((float)(v2 - v3) <= 3.1416) {
        float v13 = v12;
      }
      else {
        float v13 = (float)(v2 - v3) + -6.2832;
      }
      if (v11 < 0.1) {
        float v13 = 3.1416;
      }
      return v3 + (float)(v10 * v13);
    }
  }
  else
  {
    float v2 = 0.0;
    if ((unint64_t)(v17 - 2) < 3) {
      return flt_26156AD24[(void)v17 - 2];
    }
  }
  return v2;
}

uint64_t WallpaperMetalCoordination.WallpaperState.rotationLandscapeAmount.getter()
{
  long long v1 = *(_OWORD *)(v0 + 112);
  long long v8 = *(_OWORD *)(v0 + 96);
  long long v9 = v1;
  char v10 = *(unsigned char *)(v0 + 128);
  long long v2 = *(_OWORD *)(v0 + 48);
  v6[2] = *(_OWORD *)(v0 + 32);
  v6[3] = v2;
  long long v3 = *(_OWORD *)(v0 + 80);
  v6[4] = *(_OWORD *)(v0 + 64);
  long long v7 = v3;
  long long v4 = *(_OWORD *)(v0 + 16);
  v6[0] = *(_OWORD *)v0;
  v6[1] = v4;
  if (v10 == 1)
  {
    if (*((void *)&v7 + 1) == 4)
    {
      if ((void)v8 == 3) {
        return result;
      }
LABEL_11:
      sub_2615480E8((uint64_t)v6, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
      sub_26154B7F4();
      return sub_2615480E8((uint64_t)v6, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
    }
    if ((void)v8 == 4)
    {
      if (*((void *)&v7 + 1) != 3) {
        goto LABEL_11;
      }
    }
    else if (*((void *)&v7 + 1) == (void)v8 || (*((void *)&v7 + 1) == 3) != ((void)v8 == 3))
    {
      goto LABEL_11;
    }
  }
  return result;
}

uint64_t WallpaperMetalCoordination.WallpaperState.look.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(v1 + 72);
  uint64_t v6 = *(unsigned int *)(v1 + 80);
  char v7 = *(unsigned char *)(v1 + 84);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(_DWORD *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 36) = v7;
  return sub_26154809C(v2, v3, v4, v5, v6, v7);
}

__n128 WallpaperMetalCoordination.WallpaperState.look.setter(__n128 *a1)
{
  __n128 v7 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int32 v4 = a1[2].n128_u32[0];
  unsigned __int8 v5 = a1[2].n128_u8[4];
  sub_261544BF8(*(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(unsigned int *)(v1 + 80), *(unsigned char *)(v1 + 84));
  __n128 result = v7;
  *(__n128 *)(v1 + 48) = v7;
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v3;
  *(_DWORD *)(v1 + 80) = v4;
  *(unsigned char *)(v1 + 84) = v5;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.look.modify())()
{
  return nullsub_2;
}

BOOL sub_26154BC04(long long *a1, long long *a2)
{
  sub_26154B7DC(a1, v4);
  sub_26154B7DC(a2, v5);
  return sub_26154BF38(v4, v5);
}

id sub_26154BC50()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15890]), sel_init);
  objc_msgSend(v0, sel_setMass_, 1.0);
  objc_msgSend(v0, sel_setStiffness_, 61.69);
  objc_msgSend(v0, sel_setDamping_, 15.71);
  id result = objc_msgSend(v0, sel_setDuration_, 1.2);
  qword_26A921AD0 = (uint64_t)v0;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.init()@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_WORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = xmmword_26156AC30;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 84) = 0;
  *(void *)(a1 + 88) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.init(unlockProgress:linearWakeProgress:isDarkMode:orientation:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  double v10 = 0.0;
  if (a5 > 0.0)
  {
    double v10 = 1.0;
    if (a5 < 0.9999)
    {
      if (qword_26A9215F0 != -1) {
        swift_once();
      }
      *(float *)&double v10 = a5;
      objc_msgSend((id)qword_26A921AD0, sel__solveForInput_, v10);
      double v10 = v11;
    }
  }
  if (a4 >= 1.0) {
    char v12 = 1;
  }
  else {
    char v12 = 2;
  }
  if (a4 <= 0.0) {
    char v12 = 0;
  }
  *(unsigned char *)a3 = v12;
  *(double *)(a3 + 8) = a4;
  char v13 = 2 * (v10 < 1.0);
  if (v10 <= 0.0) {
    char v13 = 1;
  }
  *(unsigned char *)(a3 + 16) = v13;
  *(double *)(a3 + 24) = a5;
  *(double *)(a3 + 32) = v10;
  *(unsigned char *)(a3 + 40) = a1 & 1;
  *(unsigned char *)(a3 + 41) = 0;
  *(_OWORD *)(a3 + 48) = xmmword_26156AC30;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = 0;
  *(_DWORD *)(a3 + 80) = 0;
  *(unsigned char *)(a3 + 84) = 0;
  *(void *)(a3 + 88) = a2;
  double result = 0.0;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(unsigned char *)(a3 + 128) = 0;
  return result;
}

uint64_t WallpaperMetalCoordination.WallpaperState.description.getter()
{
  return 0x2093949FF0;
}

BOOL sub_26154BF38(long long *a1, long long *a2)
{
  sub_26154B7DC(a1, &v17);
  uint64_t v4 = v17;
  if (v20)
  {
    uint64_t v5 = *((void *)&v17 + 1);
    double v7 = v18;
    double v6 = v19;
    sub_26154B7DC(a2, &v13);
    if (v16 != 1) {
      return 0;
    }
    if (v4 != (void)v13 || v5 != *((void *)&v13 + 1)) {
      return 0;
    }
    double v10 = v14;
    double v9 = v15;
    sub_26154CED8();
    sub_26154CF18((uint64_t)a1, (void (*)(void, void, void, void, void, void))sub_2615480DC);
    sub_26154CF18((uint64_t)a2, (void (*)(void, void, void, void, void, void))sub_2615480DC);
    char v11 = sub_261569940();
    sub_26154CF18((uint64_t)a2, (void (*)(void, void, void, void, void, void))sub_261548178);
    sub_26154CF18((uint64_t)a1, (void (*)(void, void, void, void, void, void))sub_261548178);
    if (v6 == v9) {
      return v11 & (v7 == v10);
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_26154B7DC(a2, &v13);
    if (v16) {
      return 0;
    }
    return v4 == (void)v13;
  }
}

BOOL _s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV4LookO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  float v39 = *(float *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 36);
  uint64_t v8 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v11 = *(unsigned int *)(a2 + 32);
  char v12 = *(unsigned char *)(a2 + 36);
  if ((v6 & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 36) & 1) == 0)
    {
      if (v2 == v8 && v3 == v7)
      {
        BOOL v27 = 1;
        uint64_t v28 = *(void *)a1;
      }
      else
      {
        uint64_t v29 = *(void *)(a2 + 8);
        uint64_t v28 = *(void *)a1;
        char v30 = sub_261569B40();
        uint64_t v7 = v29;
        BOOL v27 = v30;
      }
      uint64_t v38 = v7;
      sub_26154809C(v8, v7, v10, v9, v11, 0);
      sub_26154809C(v28, v3, v4, v5, LODWORD(v39), 0);
      sub_261544BF8(v28, v3, v4, v5, LODWORD(v39), 0);
      sub_261544BF8(v8, v38, v10, v9, v11, 0);
      return v27;
    }
    goto LABEL_10;
  }
  if ((*(unsigned char *)(a2 + 36) & 1) == 0)
  {
LABEL_10:
    uint64_t v35 = *(void *)(a2 + 16);
    uint64_t v37 = *(void *)(a2 + 8);
    uint64_t v20 = *(void *)a1;
    sub_26154809C(*(void *)a2, v37, v35, v9, v11, v12);
    sub_26154809C(v20, v3, v4, v5, LODWORD(v39), v6);
    sub_261544BF8(v20, v3, v4, v5, LODWORD(v39), v6);
    uint64_t v21 = v8;
    uint64_t v23 = v35;
    uint64_t v22 = v37;
    uint64_t v24 = v9;
    uint64_t v25 = v11;
    char v26 = v12;
LABEL_11:
    sub_261544BF8(v21, v22, v23, v24, v25, v26);
    return 0;
  }
  if (v2 != v8 || v3 != v7)
  {
    uint64_t v13 = *(void *)(a2 + 8);
    uint64_t v14 = *(void *)a1;
    char v15 = sub_261569B40();
    uint64_t v2 = v14;
    uint64_t v7 = v13;
    if ((v15 & 1) == 0)
    {
      sub_26154809C(v8, v13, v10, v9, v11, 1);
      sub_26154809C(v14, v3, v4, v5, LODWORD(v39), 1);
      sub_261544BF8(v14, v3, v4, v5, LODWORD(v39), 1);
      uint64_t v21 = v8;
      uint64_t v22 = v13;
      uint64_t v23 = v10;
      uint64_t v24 = v9;
      uint64_t v25 = v11;
      char v26 = 1;
      goto LABEL_11;
    }
  }
  if (v4 == v10 && v5 == v9)
  {
    uint64_t v16 = v7;
    uint64_t v17 = v11;
    uint64_t v18 = v2;
    sub_26154809C(v8, v7, v4, v5, v11, 1);
    float v19 = v39;
    sub_26154809C(v18, v3, v4, v5, LODWORD(v39), 1);
    sub_261544BF8(v18, v3, v4, v5, LODWORD(v39), 1);
    sub_261544BF8(v8, v16, v4, v5, v17, 1);
    return v19 == *(float *)&v17;
  }
  uint64_t v31 = v9;
  uint64_t v32 = v7;
  uint64_t v17 = v11;
  uint64_t v33 = v2;
  char v36 = sub_261569B40();
  sub_26154809C(v8, v32, v10, v31, v11, 1);
  float v19 = v39;
  sub_26154809C(v33, v3, v4, v5, LODWORD(v39), 1);
  sub_261544BF8(v33, v3, v4, v5, LODWORD(v39), 1);
  sub_261544BF8(v8, v32, v10, v31, v17, 1);
  BOOL v27 = 0;
  if (v36) {
    return v19 == *(float *)&v17;
  }
  return v27;
}

BOOL _s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = 0;
  if (*a1 == *a2
    && *((double *)a1 + 1) == *((double *)a2 + 1)
    && a1[16] == a2[16]
    && *((double *)a1 + 3) == *((double *)a2 + 3)
    && *((double *)a1 + 4) == *((double *)a2 + 4)
    && ((a1[40] ^ a2[40]) & 1) == 0
    && ((a1[41] ^ a2[41]) & 1) == 0)
  {
    uint64_t v3 = *((void *)a1 + 11);
    uint64_t v4 = *((void *)a1 + 12);
    char v6 = (void *)*((void *)a1 + 13);
    uint64_t v5 = *((uint64_t *)a1 + 14);
    int v7 = a1[128];
    uint64_t v9 = *((void *)a2 + 11);
    uint64_t v8 = *((void *)a2 + 12);
    uint64_t v11 = (void *)*((void *)a2 + 13);
    uint64_t v10 = *((uint64_t *)a2 + 14);
    uint64_t v22 = *((uint64_t *)a2 + 15);
    uint64_t v23 = *((uint64_t *)a1 + 15);
    char v12 = a2[128];
    unsigned __int8 v13 = a2[84];
    int v14 = *((_DWORD *)a2 + 20);
    unsigned __int8 v15 = a1[84];
    int v16 = *((_DWORD *)a1 + 20);
    long long v17 = *((_OWORD *)a1 + 4);
    v27[0] = *((_OWORD *)a1 + 3);
    v27[1] = v17;
    int v28 = v16;
    unsigned __int8 v29 = v15;
    long long v18 = *((_OWORD *)a2 + 4);
    v24[0] = *((_OWORD *)a2 + 3);
    v24[1] = v18;
    int v25 = v14;
    unsigned __int8 v26 = v13;
    if (!_s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV4LookO2eeoiySbAG_AGtFZ_0((uint64_t)v27, (uint64_t)v24))return 0; {
    if (!v7)
    }
    {
      if (v3 == v9) {
        char v20 = v12;
      }
      else {
        char v20 = 1;
      }
      return (v20 & 1) == 0;
    }
    if ((v12 & 1) == 0) {
      return 0;
    }
    if (v3 != v9) {
      return 0;
    }
    if (v4 != v8) {
      return 0;
    }
    sub_26154CED8();
    uint64_t v2 = 1;
    sub_2615480DC(v3, v4, v6, v5, v23, 1);
    sub_2615480DC(v3, v4, v11, v10, v22, 1);
    char v19 = sub_261569940();
    sub_261548178(v3, v4, (uint64_t)v11, v10, v22, 1);
    sub_261548178(v3, v4, (uint64_t)v6, v5, v23, 1);
    if ((v19 & 1) == 0 || *(double *)&v5 != *(double *)&v10 || *(double *)&v23 != *(double *)&v22) {
      return 0;
    }
  }
  return v2;
}

uint64_t _s14WallpaperStateVwxx(uint64_t a1)
{
  sub_261544BF8(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned int *)(a1 + 80), *(unsigned char *)(a1 + 84));
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  char v7 = *(unsigned char *)(a1 + 128);
  return sub_261548178(v2, v3, v4, v5, v6, v7);
}

uint64_t _s14WallpaperStateVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 72);
  uint64_t v9 = *(unsigned int *)(a2 + 80);
  char v10 = *(unsigned char *)(a2 + 84);
  sub_26154809C(v5, v6, v7, v8, v9, v10);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v8;
  *(_DWORD *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 84) = v10;
  uint64_t v11 = *(void *)(v2 + 88);
  uint64_t v12 = *(void *)(v2 + 96);
  unsigned __int8 v13 = *(void **)(v2 + 104);
  uint64_t v14 = *(void *)(v2 + 112);
  uint64_t v15 = *(void *)(v2 + 120);
  LOBYTE(v2) = *(unsigned char *)(v2 + 128);
  sub_2615480DC(v11, v12, v13, v14, v15, v2);
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v15;
  *(unsigned char *)(a1 + 128) = v2;
  return a1;
}

uint64_t _s14WallpaperStateVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v4 = *(void *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 72);
  uint64_t v8 = *(unsigned int *)(a2 + 80);
  char v9 = *(unsigned char *)(a2 + 84);
  sub_26154809C(v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(unsigned int *)(a1 + 80);
  char v15 = *(unsigned char *)(a1 + 84);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  *(_DWORD *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 84) = v9;
  sub_261544BF8(v10, v11, v12, v13, v14, v15);
  uint64_t v16 = *(void *)(v2 + 88);
  uint64_t v17 = *(void *)(v2 + 96);
  long long v18 = *(void **)(v2 + 104);
  uint64_t v19 = *(void *)(v2 + 112);
  uint64_t v20 = *(void *)(v2 + 120);
  LOBYTE(v2) = *(unsigned char *)(v2 + 128);
  sub_2615480DC(v16, v17, v18, v19, v20, v2);
  uint64_t v21 = *(void *)(a1 + 88);
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = *(void *)(a1 + 112);
  uint64_t v25 = *(void *)(a1 + 120);
  char v26 = *(unsigned char *)(a1 + 128);
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v17;
  *(void *)(a1 + 104) = v18;
  *(void *)(a1 + 112) = v19;
  *(void *)(a1 + 120) = v20;
  *(unsigned char *)(a1 + 128) = v2;
  sub_261548178(v21, v22, v23, v24, v25, v26);
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t _s14WallpaperStateVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  int v4 = *(_DWORD *)(a2 + 80);
  char v5 = *(unsigned char *)(a2 + 84);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(unsigned int *)(a1 + 80);
  char v11 = *(unsigned char *)(a1 + 84);
  long long v12 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v12;
  *(_DWORD *)(a1 + 80) = v4;
  *(unsigned char *)(a1 + 84) = v5;
  sub_261544BF8(v6, v7, v8, v9, v10, v11);
  uint64_t v13 = *(void *)(a2 + 120);
  char v14 = *(unsigned char *)(a2 + 128);
  uint64_t v15 = *(void *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 96);
  uint64_t v17 = *(void *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 120);
  char v20 = *(unsigned char *)(a1 + 128);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = v13;
  *(unsigned char *)(a1 + 128) = v14;
  sub_261548178(v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t _s14WallpaperStateVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 129)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s14WallpaperStateVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 129) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 129) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.WallpaperState()
{
  return &type metadata for WallpaperMetalCoordination.WallpaperState;
}

uint64_t _s14WallpaperStateV4LookOwxx(uint64_t a1)
{
  return sub_261544BF8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned char *)(a1 + 36));
}

uint64_t _s14WallpaperStateV4LookOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(unsigned int *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 36);
  sub_26154809C(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 36) = v8;
  return a1;
}

uint64_t _s14WallpaperStateV4LookOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(unsigned int *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 36);
  sub_26154809C(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(unsigned int *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 36);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 36) = v8;
  sub_261544BF8(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy37_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 29) = *(void *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14WallpaperStateV4LookOwta(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 36);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(unsigned int *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 36);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_DWORD *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 36) = v4;
  sub_261544BF8(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t _s14WallpaperStateV4LookOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 37)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 36);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14WallpaperStateV4LookOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 37) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 37) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 36) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_26154CC74(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 36);
}

uint64_t sub_26154CC7C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 36) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.WallpaperState.Look()
{
  return &type metadata for WallpaperMetalCoordination.WallpaperState.Look;
}

uint64_t _s14WallpaperStateV12RotationInfoOwxx(uint64_t a1)
{
  return sub_261548178(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t _s14WallpaperStateV12RotationInfoOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_2615480DC(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s14WallpaperStateV12RotationInfoOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_2615480DC(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_261548178(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14WallpaperStateV12RotationInfoOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  sub_261548178(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t _s14WallpaperStateV12RotationInfoOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14WallpaperStateV12RotationInfoOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_26154CEB4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_26154CEBC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *_s14WallpaperStateV12RotationInfoOMa()
{
  return &_s14WallpaperStateV12RotationInfoON;
}

unint64_t sub_26154CED8()
{
  unint64_t result = qword_26A921AD8;
  if (!qword_26A921AD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A921AD8);
  }
  return result;
}

uint64_t sub_26154CF18(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_26154CF5C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_26154CF94()
{
  uint64_t v0 = sub_261569610();
  __swift_allocate_value_buffer(v0, qword_26B40E2E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B40E2E0);
  return sub_261569600();
}

uint64_t static Logger.supression.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B40E2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_261569610();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B40E2E0);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void sub_26154D0B8()
{
  qword_26B40E248 = MEMORY[0x263F8EE78];
}

void static RendererTokenManager.pushSupression()()
{
  uint64_t v0 = qword_26B40E018 + 1;
  if (__OFADD__(qword_26B40E018, 1)) {
    goto LABEL_55;
  }
  ++qword_26B40E018;
  if (v0 == 1)
  {
    if (qword_26B40E250 != -1) {
      goto LABEL_56;
    }
    while (1)
    {
      swift_beginAccess();
      uint64_t v1 = qword_26B40E248;
      if ((unint64_t)qword_26B40E248 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v2 = sub_261569AB0();
        if (!v2)
        {
LABEL_49:
          swift_bridgeObjectRelease();
          return;
        }
      }
      else
      {
        uint64_t v2 = *(void *)((qword_26B40E248 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v2) {
          goto LABEL_49;
        }
      }
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v34 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v5 = qword_26B40E2E0;
      p_cache = &OBJC_METACLASS____TtC26WatchFacesWallpaperSupport20RendererTokenManager.cache;
      uint64_t v36 = v2;
      uint64_t v37 = v1;
      unint64_t v35 = v1 & 0xC000000000000001;
      while (1)
      {
        while (1)
        {
          if (v4)
          {
            MEMORY[0x263E3A6C0](v3, v1);
            BOOL v7 = __OFADD__(v3++, 1);
            if (v7) {
              goto LABEL_52;
            }
          }
          else
          {
            if (v3 >= *(void *)(v34 + 16)) {
              goto LABEL_53;
            }
            swift_retain();
            BOOL v7 = __OFADD__(v3++, 1);
            if (v7) {
              goto LABEL_52;
            }
          }
          uint64_t Strong = swift_weakLoadStrong();
          if (Strong) {
            break;
          }
LABEL_48:
          swift_release();
          if (v3 == v2) {
            goto LABEL_49;
          }
        }
        uint64_t v9 = Strong;
        swift_beginAccess();
        uint64_t v10 = *(void *)(v9 + 16);
        if (!*(void *)(v10 + 16))
        {
          swift_release();
          goto LABEL_48;
        }
        unint64_t v38 = v3;
        uint64_t v39 = v10 + 64;
        uint64_t v11 = 1 << *(unsigned char *)(v10 + 32);
        if (v11 < 64) {
          uint64_t v12 = ~(-1 << v11);
        }
        else {
          uint64_t v12 = -1;
        }
        unint64_t v13 = v12 & *(void *)(v10 + 64);
        int64_t v40 = (unint64_t)(v11 + 63) >> 6;
        int64_t v14 = 0;
        uint64_t v15 = swift_bridgeObjectRetain();
        while (v13)
        {
          while (1)
          {
            unint64_t v16 = __clz(__rbit64(v13));
            v13 &= v13 - 1;
            unint64_t v17 = v16 | (v14 << 6);
LABEL_41:
            uint64_t v21 = (uint64_t *)(*(void *)(v15 + 48) + 16 * v17);
            uint64_t v23 = *v21;
            unint64_t v22 = v21[1];
            uint64_t v24 = p_cache[95];
            swift_bridgeObjectRetain();
            if (v24 != (void *)-1) {
              swift_once();
            }
            uint64_t v25 = sub_261569610();
            __swift_project_value_buffer(v25, (uint64_t)v5);
            swift_bridgeObjectRetain();
            char v26 = sub_2615695F0();
            os_log_type_t v27 = sub_2615698C0();
            if (os_log_type_enabled(v26, v27)) {
              break;
            }

            swift_bridgeObjectRelease_n();
            if (!v13) {
              goto LABEL_23;
            }
          }
          int64_t v41 = v14;
          int v28 = v5;
          uint64_t v29 = swift_slowAlloc();
          char v30 = p_cache;
          uint64_t v31 = swift_slowAlloc();
          uint64_t v42 = v31;
          *(_DWORD *)uint64_t v29 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v29 + 4) = sub_2615453FC(v23, v22, &v42);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_26153C000, v26, v27, "Canceling render extension for reason: %s due to supression", (uint8_t *)v29, 0xCu);
          swift_arrayDestroy();
          uint64_t v32 = v31;
          p_cache = v30;
          MEMORY[0x263E3AFE0](v32, -1, -1);
          uint64_t v33 = v29;
          uint64_t v5 = v28;
          int64_t v14 = v41;
          MEMORY[0x263E3AFE0](v33, -1, -1);
        }
LABEL_23:
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        if (v18 < v40)
        {
          unint64_t v19 = *(void *)(v39 + 8 * v18);
          ++v14;
          if (v19) {
            goto LABEL_40;
          }
          int64_t v14 = v18 + 1;
          if (v18 + 1 < v40)
          {
            unint64_t v19 = *(void *)(v39 + 8 * v14);
            if (v19) {
              goto LABEL_40;
            }
            int64_t v14 = v18 + 2;
            if (v18 + 2 < v40)
            {
              unint64_t v19 = *(void *)(v39 + 8 * v14);
              if (v19) {
                goto LABEL_40;
              }
              int64_t v14 = v18 + 3;
              if (v18 + 3 < v40)
              {
                unint64_t v19 = *(void *)(v39 + 8 * v14);
                if (v19) {
                  goto LABEL_40;
                }
                int64_t v14 = v18 + 4;
                if (v18 + 4 < v40)
                {
                  unint64_t v19 = *(void *)(v39 + 8 * v14);
                  if (v19) {
                    goto LABEL_40;
                  }
                  int64_t v20 = v18 + 5;
                  if (v20 < v40) {
                    break;
                  }
                }
              }
            }
          }
        }
LABEL_7:
        swift_release();
        RendererTokenManager.invalidateAllTokens()();
        swift_release();
        swift_release();
        uint64_t v2 = v36;
        uint64_t v1 = v37;
        unint64_t v3 = v38;
        unint64_t v4 = v35;
        if (v38 == v36) {
          goto LABEL_49;
        }
      }
      unint64_t v19 = *(void *)(v39 + 8 * v20);
      if (v19)
      {
        int64_t v14 = v20;
LABEL_40:
        unint64_t v13 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
        goto LABEL_41;
      }
      while (1)
      {
        int64_t v14 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v14 >= v40) {
          goto LABEL_7;
        }
        unint64_t v19 = *(void *)(v39 + 8 * v14);
        ++v20;
        if (v19) {
          goto LABEL_40;
        }
      }
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      swift_once();
    }
  }
}

BOOL RendererTokenManager.hasAnyExtensions.getter()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 16) + 16) != 0;
}

Swift::Void __swiftcall RendererTokenManager.invalidateAllTokens()()
{
  uint64_t v1 = v0;
  if (qword_26B40E308 != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v2 = sub_261569610();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B40E510);
  swift_retain_n();
  unint64_t v3 = sub_2615695F0();
  os_log_type_t v4 = sub_2615698C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v23[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_beginAccess();
    sub_26154E708();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_261569690();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_2615453FC(v7, v9, v23);
    sub_261569960();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v3, v4, "Invalidating all render extensions: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v6, -1, -1);
    MEMORY[0x263E3AFE0](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v10 = v1 + 2;
  swift_beginAccess();
  uint64_t v11 = v1[2];
  uint64_t v12 = v11 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v11 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v17 = 0;
  while (1)
  {
    if (v15)
    {
      unint64_t v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v19 = v18 | (v17 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v16) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v12 + 8 * v20);
    ++v17;
    if (!v21)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_27;
      }
      unint64_t v21 = *(void *)(v12 + 8 * v17);
      if (!v21)
      {
        int64_t v17 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_27;
        }
        unint64_t v21 = *(void *)(v12 + 8 * v17);
        if (!v21)
        {
          int64_t v17 = v20 + 3;
          if (v20 + 3 >= v16) {
            goto LABEL_27;
          }
          unint64_t v21 = *(void *)(v12 + 8 * v17);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_9:
    uint64_t v1 = *(id *)(*(void *)(v11 + 56) + 8 * v19);
    objc_msgSend(objc_msgSend(v1, sel_assertion), sel_invalidate);

    swift_unknownObjectRelease();
  }
  int64_t v22 = v20 + 4;
  if (v22 < v16)
  {
    unint64_t v21 = *(void *)(v12 + 8 * v22);
    if (!v21)
    {
      while (1)
      {
        int64_t v17 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_29;
        }
        if (v17 >= v16) {
          goto LABEL_27;
        }
        unint64_t v21 = *(void *)(v12 + 8 * v17);
        ++v22;
        if (v21) {
          goto LABEL_26;
        }
      }
    }
    int64_t v17 = v22;
    goto LABEL_26;
  }
LABEL_27:
  swift_release();
  void *v10 = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
}

void static RendererTokenManager.popSupression()()
{
  if (__OFSUB__(qword_26B40E018, 1)) {
    __break(1u);
  }
  else {
    --qword_26B40E018;
  }
}

uint64_t RendererTokenManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  RendererTokenManager.init()();
  return v0;
}

uint64_t RendererTokenManager.init()()
{
  *(void *)(v0 + 16) = sub_26153EC38(MEMORY[0x263F8EE78]);
  if (qword_26B40E250 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E2D8);
  swift_allocObject();
  swift_weakInit();
  swift_weakAssign();
  uint64_t v1 = swift_beginAccess();
  MEMORY[0x263E3A490](v1);
  if (*(void *)((qword_26B40E248 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26B40E248 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_261569800();
  sub_261569810();
  sub_2615697F0();
  swift_endAccess();
  return v0;
}

uint64_t RendererTokenManager.deinit()
{
  uint64_t v1 = v0;
  if (qword_26B40E250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = qword_26B40E248;
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!((unint64_t)qword_26B40E248 >> 62))
  {
    uint64_t v3 = *(void *)((qword_26B40E248 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_17:
    qword_26B40E248 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v1;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_261569AB0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_5:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        MEMORY[0x263E3A6C0](i, v2);
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      swift_release();
      if (Strong)
      {
        sub_261569A20();
        sub_261569A50();
        sub_261569A60();
        sub_261569A30();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v8;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t RendererTokenManager.__deallocating_deinit()
{
  if (qword_26B40E250 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26B40E248;
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (!((unint64_t)qword_26B40E248 >> 62))
  {
    uint64_t v1 = *(void *)((qword_26B40E248 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v1) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_17:
    qword_26B40E248 = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_deallocClassInstance();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_261569AB0();
  uint64_t v1 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_5:
  if (v1 >= 1)
  {
    for (uint64_t i = 0; i != v1; ++i)
    {
      if ((v0 & 0xC000000000000001) != 0) {
        MEMORY[0x263E3A6C0](i, v0);
      }
      else {
        swift_retain();
      }
      uint64_t Strong = swift_weakLoadStrong();
      swift_release();
      if (Strong)
      {
        sub_261569A20();
        sub_261569A50();
        sub_261569A60();
        sub_261569A30();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v5 = v6;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void RendererTokenManager.requestExtension(from:for:)(void *a1, Swift::String a2)
{
  object = a2._object;
  uint64_t countAndFlagsBits = a2._countAndFlagsBits;
  if (qword_26B40E018 < 1)
  {
    uint64_t v17 = v2;
    RendererTokenManager.invalidateToken(for:)(a2);
    if (qword_26B40E308 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_261569610();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B40E510);
    id v19 = a1;
    swift_bridgeObjectRetain_n();
    id v20 = v19;
    unint64_t v21 = sub_2615695F0();
    os_log_type_t v22 = sub_2615698C0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      v39[0] = v34;
      *(_DWORD *)uint64_t v23 = 136315394;
      id v37 = (id)countAndFlagsBits;
      id v24 = v20;
      id v25 = objc_msgSend(v24, sel_description);
      uint64_t v26 = sub_261569700();
      unint64_t v28 = v27;

      sub_2615453FC(v26, v28, v39);
      sub_261569960();

      uint64_t countAndFlagsBits = (uint64_t)v37;
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2615453FC((uint64_t)v37, (unint64_t)object, v39);
      sub_261569960();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_26153C000, v21, v22, "Requesting render extension on %s for reason: %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v34, -1, -1);
      MEMORY[0x263E3AFE0](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v29 = (void *)sub_2615696D0();
    id v30 = objc_msgSend(v20, sel_extendRenderingSessionForReason_, v29);

    uint64_t v31 = (uint64_t *)(v17 + 16);
    swift_beginAccess();
    if (v30)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = *v31;
      *uint64_t v31 = 0x8000000000000000;
      sub_2615474A4((uint64_t)v30, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
      *uint64_t v31 = v38;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v33 = (void *)sub_26154E7EC(countAndFlagsBits, (uint64_t)object);
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
  }
  else
  {
    if (qword_26B40E2F8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_261569610();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B40E2E0);
    id v7 = a1;
    swift_bridgeObjectRetain_n();
    id v35 = v7;
    uint64_t v8 = sub_2615695F0();
    os_log_type_t v9 = sub_2615698C0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v39[0] = v11;
      *(_DWORD *)uint64_t v10 = 136315650;
      id v12 = v35;
      id v36 = (id)countAndFlagsBits;
      id v13 = objc_msgSend(v12, sel_description);
      uint64_t v14 = sub_261569700();
      unint64_t v16 = v15;

      sub_2615453FC(v14, v16, v39);
      sub_261569960();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2615453FC((uint64_t)v36, (unint64_t)object, v39);
      sub_261569960();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v10 + 22) = 2048;
      sub_261569960();
      _os_log_impl(&dword_26153C000, v8, v9, "Supressed requested render extension on %s for reason: %s because supression count is %ld", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v11, -1, -1);
      MEMORY[0x263E3AFE0](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

Swift::Void __swiftcall RendererTokenManager.invalidateToken(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  if (!*(void *)(v4 + 16)) {
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_261545AD4(countAndFlagsBits, (uint64_t)object);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_endAccess();
    return;
  }
  id v7 = *(void **)(*(void *)(v4 + 56) + 8 * v5);
  swift_endAccess();
  id v8 = v7;
  swift_bridgeObjectRelease();
  if (qword_26B40E308 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_261569610();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B40E510);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_2615695F0();
  os_log_type_t v11 = sub_2615698C0();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v16[0] = v13;
    *(_DWORD *)id v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2615453FC(countAndFlagsBits, (unint64_t)object, v16);
    sub_261569960();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26153C000, v10, v11, "Invalidating render extension of reason: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v13, -1, -1);
    MEMORY[0x263E3AFE0](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(objc_msgSend(v8, sel_assertion, v15, v16[0]), sel_invalidate);
  swift_unknownObjectRelease();
  swift_beginAccess();
  uint64_t v14 = (void *)sub_26154E7EC(countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
}

Swift::Bool __swiftcall RendererTokenManager.hasExtension(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_261545AD4(countAndFlagsBits, (uint64_t)object);
    char v7 = v6;
    if (v6) {
      id v8 = *(id *)(*(void *)(v4 + 56) + 8 * v5);
    }
    else {
      id v8 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
    id v8 = 0;
  }
  swift_endAccess();

  return v7 & 1;
}

unint64_t sub_26154E708()
{
  unint64_t result = qword_26B40E310;
  if (!qword_26B40E310)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B40E310);
  }
  return result;
}

void *sub_26154E748(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_261569AF0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_26154E7EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_261545AD4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_26154796C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_261547008(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_26154E8C0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Weak()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for RendererTokenManager()
{
  return self;
}

uint64_t method lookup function for RendererTokenManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RendererTokenManager);
}

uint64_t dispatch thunk of RendererTokenManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t RotationFrame.fromOrientation.getter()
{
  return *(void *)v0;
}

uint64_t RotationFrame.toOrientation.getter()
{
  return *(void *)(v0 + 8);
}

double RotationFrame.fraction.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t RotationFrame.clockwise.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0 == 1 && v2 == 4) {
    return 1;
  }
  BOOL v5 = v1 == 3 && v2 == 1;
  unsigned int v7 = v1 == 2 && v2 == 3 || v5;
  if (v1 == 4 && v2 == 2) {
    return 1;
  }
  else {
    return v7;
  }
}

uint64_t RotationFrame.init(from:to:fraction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

uint64_t RotationFrame.init(orientation:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  a2[1] = result;
  a2[2] = 0x3FF0000000000000;
  return result;
}

uint64_t RotationFrame.description.getter()
{
  return 0;
}

uint64_t _s26WatchFacesWallpaperSupport13RotationFrameV2eeoiySbAC_ACtFZ_0(double *a1, uint64_t a2)
{
  double v3 = *a1;
  uint64_t v2 = *((void *)a1 + 1);
  double v4 = a1[2];
  uint64_t v5 = *(void *)(a2 + 8);
  double v6 = *(double *)(a2 + 16);
  if (v4 == v6 && *(void *)&v3 == v5 && v2 == v5) {
    return 1;
  }
  if (*(void *)&v3 == v5)
  {
    if (v4 == 1.0 - v6) {
      return 1;
    }
  }
  else
  {
    double v10 = 1.0 - v6;
    if (v2 == *(void *)a2 && v4 == v10) {
      return 1;
    }
  }
  return 0;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for RotationFrame(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RotationFrame(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RotationFrame()
{
  return &type metadata for RotationFrame;
}

BOOL static PosterLayout.LayoutType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PosterLayout.LayoutType.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t PosterLayout.LayoutType.hashValue.getter()
{
  return sub_261569BF0();
}

BOOL sub_26154EDFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_26154EE14()
{
  return sub_261569BF0();
}

uint64_t sub_26154EE5C()
{
  return sub_261569BE0();
}

uint64_t sub_26154EE88()
{
  return sub_261569BF0();
}

void sub_26154EECC()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (!v1)
  {
    char v2 = 1;
LABEL_5:
    byte_26A921AE0 = v2;
    return;
  }
  if (v1 == (id)1)
  {
    char v2 = 0;
    goto LABEL_5;
  }
  sub_261569A90();
  __break(1u);
}

uint64_t static PosterLayout.currentLayoutType.getter@<X0>(unsigned char *a1@<X8>)
{
  if (qword_26A9215F8 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = byte_26A921AE0;
  return result;
}

double PosterLayout.Animation.duration.getter()
{
  return *(double *)v0;
}

uint64_t PosterLayout.Animation.curve.getter()
{
  return *(void *)(v0 + 8);
}

__n128 PosterLayout.Animation.transform.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t PosterLayout.deinit()
{
  return v0;
}

uint64_t PosterLayout.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_26154F030()
{
  unint64_t result = qword_26A921AE8;
  if (!qword_26A921AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921AE8);
  }
  return result;
}

uint64_t type metadata accessor for PosterLayout()
{
  return self;
}

uint64_t method lookup function for PosterLayout(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PosterLayout);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PosterLayout.LayoutType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PosterLayout.LayoutType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26154F228);
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

uint64_t sub_26154F250(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_26154F258(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PosterLayout.LayoutType()
{
  return &type metadata for PosterLayout.LayoutType;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PosterLayout.Animation(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PosterLayout.Animation(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PosterLayout.Animation()
{
  return &type metadata for PosterLayout.Animation;
}

unint64_t UIInterfaceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  unint64_t result = 0xD000000000000014;
  switch(v1)
  {
    case 0:
      unint64_t result = 0x7469617274726F50;
      break;
    case 2:
    case 3:
      unint64_t result = 0x70616373646E614CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26154F3B4()
{
  uint64_t v0 = sub_261569610();
  __swift_allocate_value_buffer(v0, qword_26A921AF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A921AF0);
  return sub_261569600();
}

uint64_t static Logger.rotation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_261569610();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A921AF0);
  long long v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id PosterRotatingViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PosterRotatingViewController.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders] = MEMORY[0x263F8EE78];
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  id v1 = objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_msgSend(self, sel_blackColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v4);

    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for PosterRotatingViewController()
{
  return self;
}

id PosterRotatingViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t PosterRotatingViewController.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders;
  id v4 = v1;

  *(void *)&v1[v3] = MEMORY[0x263F8EE78];
  type metadata accessor for PosterRotatingViewController();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_26154F728(char a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    id v4 = result;
    objc_msgSend(result, sel_bounds);
    double v6 = v5;
    double v8 = v7;

    unint64_t v9 = (unint64_t)objc_msgSend(v1, sel_interfaceOrientation) - 2;
    double v10 = 0.0;
    if (v9 <= 2) {
      double v10 = dbl_26156B040[v9];
    }
    return (id)sub_2615502C4(v6, v8, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_26154F83C(uint64_t a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  objc_msgSendSuper2(&v11, sel_willMoveToParentViewController_, a1);
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    id v4 = result;
    objc_msgSend(result, sel_bounds);
    double v6 = v5;
    double v8 = v7;

    unint64_t v9 = (unint64_t)objc_msgSend(v1, sel_interfaceOrientation) - 2;
    double v10 = 0.0;
    if (v9 <= 2) {
      double v10 = dbl_26156B040[v9];
    }
    return (id)sub_2615502C4(v6, v8, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_26154F968(void *a1, long double a2, double a3)
{
  id v4 = v3;
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_261569610();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A921AF0);
  unint64_t v9 = sub_2615695F0();
  os_log_type_t v10 = sub_2615698A0();
  if (os_log_type_enabled(v9, v10))
  {
    objc_super v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v29 = v12;
    *(_DWORD *)objc_super v11 = 136315138;
    long double aBlock = a2;
    uint64_t v32 = *(void *)&a3;
    type metadata accessor for CGSize(0);
    uint64_t v13 = sub_261569720();
    long double aBlock = COERCE_DOUBLE(sub_2615453FC(v13, v14, &v29));
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v9, v10, "viewWillTransition to: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v12, -1, -1);
    MEMORY[0x263E3AFE0](v11, -1, -1);
  }

  id result = objc_msgSend(v4, sel_view);
  if (result)
  {
    unint64_t v16 = result;
    objc_msgSend(result, sel_transform);
    long double v17 = aBlock;
    long double v18 = *(double *)&v32;

    double v19 = atan2(v18, v17);
    objc_msgSend(a1, sel_targetTransform);
    long double v20 = v19 - atan2(*(long double *)&v32, aBlock);
    double v21 = fmod(v20, 3.14159265);
    if (v20 > 3.14159265) {
      long double v20 = v21;
    }
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v4;
    *(long double *)(v22 + 24) = a2;
    *(double *)(v22 + 32) = a3;
    *(long double *)(v22 + 40) = v20;
    id v35 = sub_2615512C4;
    uint64_t v36 = v22;
    long double aBlock = MEMORY[0x263EF8330];
    uint64_t v32 = 1107296256;
    uint64_t v33 = sub_26154411C;
    uint64_t v34 = &block_descriptor_1;
    uint64_t v23 = _Block_copy(&aBlock);
    id v24 = v4;
    swift_release();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v24;
    *(long double *)(v25 + 24) = a2;
    *(double *)(v25 + 32) = a3;
    *(long double *)(v25 + 40) = v20;
    id v35 = sub_2615512EC;
    uint64_t v36 = v25;
    long double aBlock = MEMORY[0x263EF8330];
    uint64_t v32 = 1107296256;
    uint64_t v33 = sub_26154411C;
    uint64_t v34 = &block_descriptor_6;
    uint64_t v26 = _Block_copy(&aBlock);
    id v27 = v24;
    swift_release();
    objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v23, v26);
    _Block_release(v26);
    _Block_release(v23);
    unint64_t v28 = (objc_class *)type metadata accessor for PosterRotatingViewController();
    v30.receiver = v27;
    v30.super_class = v28;
    return objc_msgSendSuper2(&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, (double)a2, a3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_26154FD0C(void *a1, double a2, double a3, double a4)
{
  objc_msgSend(a1, sel_transitionDuration);
  double v9 = v8;
  id v10 = objc_msgSend(a1, sel_completionCurve);
  objc_msgSend(a1, sel_targetTransform);
  return sub_261550714((uint64_t)v10, (uint64_t *)&v12, a2, a3, a4, v9);
}

double static PosterRotatingViewController.rotation(forOrientation:)(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 2) <= 2) {
    return dbl_26156B040[a1 - 2];
  }
  return result;
}

uint64_t sub_26154FE60(uint64_t a1, unint64_t a2)
{
  if (qword_26A921600 != -1) {
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v5 = sub_261569610();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A921AF0);
    swift_unknownObjectRetain_n();
    double v6 = v2;
    double v7 = sub_2615695F0();
    os_log_type_t v8 = sub_2615698A0();
    unint64_t v30 = a2;
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v31 = v28;
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v35 = a1;
      unint64_t v36 = a2;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921B10);
      uint64_t v10 = sub_261569720();
      uint64_t v29 = a1;
      uint64_t v35 = sub_2615453FC(v10, v11, &v31);
      sub_261569960();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      long long v12 = v6;
      id v13 = objc_msgSend(v12, sel_description);
      uint64_t v14 = sub_261569700();
      unint64_t v16 = v15;

      uint64_t v35 = sub_2615453FC(v14, v16, &v31);
      sub_261569960();

      a1 = v29;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26153C000, v7, v8, "Adding responder %s to rotatingViewController: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v28, -1, -1);
      MEMORY[0x263E3AFE0](v9, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    long double v17 = (void *)((char *)v6
                   + OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders);
    swift_beginAccess();
    long double v18 = (void *)*v17;
    a2 = MEMORY[0x263F8EE78];
    uint64_t v34 = (void *)MEMORY[0x263F8EE78];
    uint64_t v19 = v18[2];
    swift_bridgeObjectRetain();
    if (!v19) {
      break;
    }
    unint64_t v20 = 0;
    uint64_t v21 = (uint64_t)(v18 + 4);
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    while (v20 < v18[2])
    {
      sub_261551450(v21, (uint64_t)&v31);
      a2 = MEMORY[0x263E3B0E0](&v31);
      swift_unknownObjectRelease();
      if (a2)
      {
        sub_2615514B4((uint64_t)&v31, (uint64_t)v33);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2615514F0(0, v2[2] + 1, 1);
        }
        uint64_t v2 = v34;
        a2 = v34[2];
        unint64_t v22 = v34[3];
        if (a2 >= v22 >> 1)
        {
          sub_2615514F0(v22 > 1, a2 + 1, 1);
          uint64_t v2 = v34;
        }
        v2[2] = a2 + 1;
        sub_2615514B4((uint64_t)v33, (uint64_t)&v2[2 * a2 + 4]);
      }
      else
      {
        sub_26155148C((uint64_t)&v31);
      }
      ++v20;
      v21 += 16;
      if (v19 == v20)
      {
        a2 = (unint64_t)v34;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_23:
    swift_once();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  *long double v17 = a2;
  swift_bridgeObjectRelease();
  unint64_t v32 = 0;
  swift_unknownObjectWeakInit();
  unint64_t v32 = v30;
  swift_unknownObjectWeakAssign();
  sub_2615514B4((uint64_t)&v31, (uint64_t)v33);
  swift_beginAccess();
  uint64_t v23 = (void *)*v17;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *long double v17 = (unint64_t)v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v23 = sub_26155131C(0, v23[2] + 1, 1, (unint64_t)v23);
    *long double v17 = (unint64_t)v23;
  }
  unint64_t v26 = v23[2];
  unint64_t v25 = v23[3];
  if (v26 >= v25 >> 1)
  {
    uint64_t v23 = sub_26155131C((void *)(v25 > 1), v26 + 1, 1, (unint64_t)v23);
    *long double v17 = (unint64_t)v23;
  }
  v23[2] = v26 + 1;
  sub_2615514B4((uint64_t)v33, (uint64_t)&v23[2 * v26 + 4]);
  return swift_endAccess();
}

uint64_t sub_2615502C4(double a1, double a2, double a3)
{
  id v4 = v3;
  uint64_t v8 = sub_261569610();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(v4, sel_interfaceOrientation);
  if ((unint64_t)v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_26A921AF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  unint64_t v15 = sub_2615695F0();
  int v16 = sub_2615698A0();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    int v31 = v16;
    uint64_t v29 = v4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v32[0] = v30;
    *(_DWORD *)uint64_t v17 = 136315650;
    double v33 = a1;
    double v34 = a2;
    type metadata accessor for CGSize(0);
    uint64_t v18 = sub_261569720();
    double v33 = COERCE_DOUBLE(sub_2615453FC(v18, v19, v32));
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2048;
    double v33 = a3;
    sub_261569960();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v20 = 0xD000000000000014;
    unint64_t v21 = 0x800000026156CAD0;
    id v4 = v29;
    switch(v13)
    {
      case 1:
        unint64_t v21 = 0xE800000000000000;
        uint64_t v20 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        unint64_t v21 = 0xEF74686769522065;
        goto LABEL_12;
      case 4:
        unint64_t v21 = 0xEE007466654C2065;
LABEL_12:
        uint64_t v20 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v21 = 0x800000026156CAB0;
        id v4 = v29;
        break;
    }
    double v33 = COERCE_DOUBLE(sub_2615453FC(v20, v21, v32));
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v15, (os_log_type_t)v31, "Notifying rotating views apply size: %s rotation: %f orientation: %s", (uint8_t *)v17, 0x20u);
    uint64_t v22 = v30;
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v22, -1, -1);
    MEMORY[0x263E3AFE0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v23 = &v4[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  uint64_t result = swift_beginAccess();
  uint64_t v25 = *(void *)(*(void *)v23 + 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v23 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_261551450(v26, (uint64_t)v32);
      if (MEMORY[0x263E3B0E0](v32))
      {
        uint64_t v27 = v32[1];
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double))(v27 + 8))(v13, ObjectType, v27, a1, a2, a3);
        swift_unknownObjectRelease();
      }
      sub_26155148C((uint64_t)v32);
      v26 += 16;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261550714(uint64_t a1, uint64_t *a2, double a3, double a4, double a5, double a6)
{
  double v7 = v6;
  uint64_t v46 = *a2;
  uint64_t v13 = a2[2];
  uint64_t v45 = a2[1];
  uint64_t v15 = a2[3];
  uint64_t v14 = a2[4];
  uint64_t v16 = a2[5];
  uint64_t v17 = sub_261569610();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = objc_msgSend(v7, sel_interfaceOrientation);
  if ((unint64_t)v21 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = (uint64_t)v21;
  }
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v17, (uint64_t)qword_26A921AF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v23, v17);
  id v24 = sub_2615695F0();
  int v25 = sub_2615698A0();
  if (os_log_type_enabled(v24, (os_log_type_t)v25))
  {
    int v43 = v25;
    uint64_t v44 = v7;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v57[0] = v42;
    *(_DWORD *)uint64_t v26 = 136316162;
    double v47 = a3;
    double v48 = a4;
    type metadata accessor for CGSize(0);
    uint64_t v27 = sub_261569720();
    double v47 = COERCE_DOUBLE(sub_2615453FC(v27, v28, v57));
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2048;
    double v47 = a5;
    sub_261569960();
    *(_WORD *)(v26 + 22) = 2048;
    double v47 = a6;
    sub_261569960();
    *(_WORD *)(v26 + 32) = 2080;
    uint64_t v29 = 0xD00000000000001DLL;
    unint64_t v30 = 0x800000026156D520;
    switch(a1)
    {
      case 0:
        break;
      case 1:
        int v31 = "UIViewAnimationCurveEaseIn";
        goto LABEL_13;
      case 2:
        uint64_t v29 = 0xD00000000000001BLL;
        unint64_t v30 = 0x800000026156D4E0;
        break;
      case 3:
        int v31 = "UIViewAnimationCurveLinear";
LABEL_13:
        unint64_t v30 = (unint64_t)(v31 - 32) | 0x8000000000000000;
        uint64_t v29 = 0xD00000000000001ALL;
        break;
      default:
        unint64_t v30 = 0xE700000000000000;
        uint64_t v29 = 0x6E776F6E6B6E55;
        break;
    }
    double v47 = COERCE_DOUBLE(sub_2615453FC(v29, v30, v57));
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 42) = 2080;
    uint64_t v32 = 0xD000000000000014;
    unint64_t v33 = 0x800000026156CAD0;
    switch(v22)
    {
      case 1:
        unint64_t v33 = 0xE800000000000000;
        uint64_t v32 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        unint64_t v33 = 0xEF74686769522065;
        goto LABEL_19;
      case 4:
        unint64_t v33 = 0xEE007466654C2065;
LABEL_19:
        uint64_t v32 = 0x70616373646E614CLL;
        break;
      default:
        uint64_t v32 = 0xD000000000000013;
        unint64_t v33 = 0x800000026156CAB0;
        break;
    }
    double v47 = COERCE_DOUBLE(sub_2615453FC(v32, v33, v57));
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v24, (os_log_type_t)v43, "Notifying rotating views rotating to: %s rotation: %f duration: %f curve: %s orientation: %s", (uint8_t *)v26, 0x34u);
    uint64_t v34 = v42;
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v34, -1, -1);
    MEMORY[0x263E3AFE0](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    double v7 = v44;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
  uint64_t v35 = &v7[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  uint64_t result = swift_beginAccess();
  uint64_t v37 = *(void *)(*(void *)v35 + 16);
  if (v37)
  {
    uint64_t v38 = *(void *)v35 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_261551450(v38, (uint64_t)v55);
      if (MEMORY[0x263E3B0E0](v55))
      {
        uint64_t v39 = v56;
        uint64_t ObjectType = swift_getObjectType();
        double v47 = a6;
        double v48 = *(double *)&a1;
        uint64_t v49 = v46;
        uint64_t v50 = v45;
        uint64_t v51 = v13;
        uint64_t v52 = v15;
        uint64_t v53 = v14;
        uint64_t v54 = v16;
        (*(void (**)(double *, uint64_t, uint64_t, uint64_t, double, double, double))(v39 + 16))(&v47, v22, ObjectType, v39, a3, a4, a5);
        swift_unknownObjectRelease();
      }
      sub_26155148C((uint64_t)v55);
      v38 += 16;
      --v37;
    }
    while (v37);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261550D04(double a1, double a2, double a3)
{
  id v4 = v3;
  uint64_t v8 = sub_261569610();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(v4, sel_interfaceOrientation);
  if ((unint64_t)v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_26A921AF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  uint64_t v15 = sub_2615695F0();
  int v16 = sub_2615698A0();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    int v31 = v16;
    uint64_t v29 = v4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v32[0] = v30;
    *(_DWORD *)uint64_t v17 = 136315650;
    double v33 = a1;
    double v34 = a2;
    type metadata accessor for CGSize(0);
    uint64_t v18 = sub_261569720();
    double v33 = COERCE_DOUBLE(sub_2615453FC(v18, v19, v32));
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2048;
    double v33 = a3;
    sub_261569960();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v20 = 0xD000000000000014;
    unint64_t v21 = 0x800000026156CAD0;
    id v4 = v29;
    switch(v13)
    {
      case 1:
        unint64_t v21 = 0xE800000000000000;
        uint64_t v20 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        unint64_t v21 = 0xEF74686769522065;
        goto LABEL_12;
      case 4:
        unint64_t v21 = 0xEE007466654C2065;
LABEL_12:
        uint64_t v20 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v21 = 0x800000026156CAB0;
        id v4 = v29;
        break;
    }
    double v33 = COERCE_DOUBLE(sub_2615453FC(v20, v21, v32));
    sub_261569960();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v15, (os_log_type_t)v31, "Notifying rotating views didRotate to: %s rotation: %f orientation: %s", (uint8_t *)v17, 0x20u);
    uint64_t v22 = v30;
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v22, -1, -1);
    MEMORY[0x263E3AFE0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v23 = &v4[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  uint64_t result = swift_beginAccess();
  uint64_t v25 = *(void *)(*(void *)v23 + 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v23 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_261551450(v26, (uint64_t)v32);
      if (MEMORY[0x263E3B0E0](v32))
      {
        uint64_t v27 = v32[1];
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double))(v27 + 24))(v13, ObjectType, v27, a1, a2, a3);
        swift_unknownObjectRelease();
      }
      sub_26155148C((uint64_t)v32);
      v26 += 16;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id PosterRotatingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    double v6 = (void *)sub_2615696D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void PosterRotatingViewController.init(nibName:bundle:)()
{
}

id PosterRotatingViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL UIInterfaceOrientation.useFlippedRotation.getter(uint64_t a1)
{
  return a1 == 4 || a1 == 2;
}

unint64_t sub_261551284()
{
  return UIInterfaceOrientation.description.getter(*v0);
}

uint64_t sub_26155128C()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2615512C4(void *a1)
{
  return sub_26154FD0C(a1, v1[3], v1[4], v1[5]);
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

uint64_t sub_2615512EC()
{
  return sub_261550D04(v0[3], v0[4], v0[5]);
}

void *sub_26155131C(void *result, int64_t a2, char a3, unint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *(void *)(a4 + 24);
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
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921B90);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = (unint64_t)(v10 + 4);
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = MEMORY[0x263F8EE78] + 32;
      if (result)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 16 * v8)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (void *)a4)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        *(void *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    sub_261551A24(0, v8, v13, a4);
LABEL_26:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_261551450(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  return a2;
}

uint64_t sub_26155148C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2615514B4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  return a2;
}

uint64_t sub_2615514F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_261551708(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t dispatch thunk of PosterRotatingResponder.apply(size:rotation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PosterRotatingResponder.rotating(to:rotation:animation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PosterRotatingResponder.didRotate(to:rotation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for PosterRotatingViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PosterRotatingViewController);
}

uint64_t dispatch thunk of PosterRotatingViewController.addResponder(responder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t initializeWithCopy for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithCopy for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t initializeWithTake for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for WeakPosterRotatingResponder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WeakPosterRotatingResponder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeakPosterRotatingResponder()
{
  return &type metadata for WeakPosterRotatingResponder;
}

uint64_t sub_2615516E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_261551898(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_261551708(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_34;
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921B90);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 < a4 || v13 >= v14 + 16 * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_34:
  uint64_t result = sub_261569AF0();
  __break(1u);
  return result;
}

uint64_t sub_261551898(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921B80);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921B88);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_261569AF0();
  __break(1u);
  return result;
}

uint64_t sub_261551A24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_261569AF0();
  __break(1u);
  return result;
}

uint64_t sub_261551B24()
{
  uint64_t v0 = sub_261569610();
  __swift_allocate_value_buffer(v0, qword_26A921BA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A921BA0);
  return sub_261569600();
}

uint64_t static Logger.rotationAnimator.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A921608 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_261569610();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A921BA0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_261551C50()
{
  swift_beginAccess();
  return MEMORY[0x263E3B0E0](v0 + 16);
}

uint64_t sub_261551C98(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_261551CFC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x263E3B0E0](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_261551D7C;
}

void sub_261551D7C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 24) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_261551E00()
{
  swift_beginAccess();
  return *(void *)(v0 + 32);
}

uint64_t sub_261551E34(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_261551E74())()
{
  return j_j__swift_endAccess;
}

float sub_261551EC8()
{
  swift_beginAccess();
  return *(float *)(v0 + 40);
}

uint64_t sub_261551EFC(float a1)
{
  uint64_t result = swift_beginAccess();
  *(float *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_261551F3C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261551F90()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t sub_261551FC4(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 88) = a1;
  return result;
}

uint64_t (*sub_261552004())()
{
  return j__swift_endAccess;
}

uint64_t PosterRotationAnimator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  PosterRotationAnimator.init()();
  return v0;
}

void *PosterRotationAnimator.init()()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 32) = 0;
  *(_DWORD *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  type metadata accessor for DisplayLink();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + 32) = 0;
  id v3 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v2, sel__displayLinkFired);
  uint64_t v4 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = v3;

  *(void *)(v1 + 56) = v2;
  type metadata accessor for RendererTokenManager();
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
  swift_allocObject();
  *(void *)(v1 + 80) = RendererTokenManager.init()();
  *(unsigned char *)(v1 + 88) = 0;
  uint64_t v5 = *(void *)(v1 + 56);
  swift_beginAccess();
  *(void *)(v5 + 24) = &protocol witness table for PosterRotationAnimator;
  swift_unknownObjectWeakAssign();
  uint64_t result = *(void **)(v5 + 32);
  if (result)
  {
    objc_msgSend(result, sel_setPaused_, 1);
    uint64_t v7 = *(void *)(v1 + 56);
    uint64_t v8 = self;
    swift_retain();
    id v9 = objc_msgSend(v8, sel_currentRunLoop);
    uint64_t result = *(void **)(v7 + 32);
    if (result)
    {
      objc_msgSend(result, sel_addToRunLoop_forMode_, v9, *MEMORY[0x263EFF588]);
      swift_release();

      return (void *)v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *PosterRotationAnimator.deinit()
{
  uint64_t result = *(void **)(*(void *)(v0 + 56) + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    swift_retain();
    RendererTokenManager.invalidateAllTokens()();
    swift_release();
    sub_26155148C(v0 + 16);
    swift_release();

    swift_release();
    return (void *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *PosterRotationAnimator.__deallocating_deinit()
{
  uint64_t result = *(void **)(*(void *)(v0 + 56) + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    swift_retain();
    RendererTokenManager.invalidateAllTokens()();
    swift_release();
    sub_26155148C(v0 + 16);
    swift_release();

    swift_release();
    return (void *)swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_26155233C(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
  swift_unknownObjectRelease();
  return sub_261552430(a2, (uint64_t)v4, a1);
}

BOOL sub_2615523BC(void *a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
  swift_unknownObjectRelease();
  return sub_261552430(a2, (uint64_t)v3, 0);
}

BOOL sub_261552430(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_261569610();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v4 + 32);
  if (v12 == a2) {
    return v12 != a2;
  }
  double v47 = 0.0;
  if (a1)
  {
    id v13 = objc_msgSend(a1, sel_animationSettings);
    if (v13)
    {
      unint64_t v14 = v13;
      objc_msgSend(v13, sel_duration);
      double v47 = v15;
      id v16 = objc_msgSend(v14, sel_timingFunction);
      if (!v16) {
        id v16 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
      }
      uint64_t v17 = *(void **)(v4 + 72);
      *(void *)(v4 + 72) = v16;
    }
  }
  uint64_t v44 = a3;
  if (qword_26A921600 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v8, (uint64_t)qword_26A921AF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
  uint64_t v19 = *(void *)&v47;
  uint64_t v20 = sub_2615695F0();
  os_log_type_t v21 = sub_2615698C0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v42 = v12;
    uint64_t v22 = a2;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v46[0] = v41;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v43 = v22;
    uint64_t v24 = 0xD000000000000014;
    unint64_t v25 = 0x800000026156CAD0;
    switch(v22)
    {
      case 1:
        unint64_t v25 = 0xE800000000000000;
        uint64_t v24 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        unint64_t v25 = 0xEF74686769522065;
        goto LABEL_16;
      case 4:
        unint64_t v25 = 0xEE007466654C2065;
LABEL_16:
        uint64_t v24 = 0x70616373646E614CLL;
        break;
      default:
        unint64_t v25 = 0x800000026156CAB0;
        break;
    }
    uint64_t v45 = sub_2615453FC(v24, v25, v46);
    sub_261569960();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2048;
    uint64_t v45 = v19;
    sub_261569960();
    _os_log_impl(&dword_26153C000, v20, v21, "Poster requested rotation to %s with duration: %f", (uint8_t *)v23, 0x16u);
    uint64_t v26 = v41;
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v26, -1, -1);
    MEMORY[0x263E3AFE0](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v12 = v42;
    a2 = v43;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v27 = v44;
  swift_beginAccess();
  if (v47 > 0.00001)
  {
    float v28 = v47;
    swift_beginAccess();
    *(float *)(v4 + 40) = v28;
    *(CFTimeInterval *)(v4 + 48) = CACurrentMediaTime();
    uint64_t v29 = *(void **)(*(void *)(v4 + 56) + 32);
    if (v29)
    {
      objc_msgSend(v29, sel_setPaused_, 0);
      *(void *)(v4 + 64) = a2;
      swift_beginAccess();
      *(unsigned char *)(v4 + 88) = 1;
      if (v27)
      {
        uint64_t v30 = qword_26A921BB8;
        int v31 = off_26A921BC0;
        id v32 = v27;
        swift_retain();
        swift_bridgeObjectRetain();
        v48._uint64_t countAndFlagsBits = v30;
        v48._object = v31;
        RendererTokenManager.requestExtension(from:for:)(v32, v48);

        swift_release();
        swift_bridgeObjectRelease();
      }
      return v12 != a2;
    }
    __break(1u);
LABEL_28:
    __break(1u);
    JUMPOUT(0x2615529E8);
  }
  double v33 = *(void **)(*(void *)(v4 + 56) + 32);
  if (!v33) {
    goto LABEL_28;
  }
  objc_msgSend(v33, sel_setPaused_, 1, v47);
  uint64_t v34 = qword_26A921BB8;
  uint64_t v35 = off_26A921BC0;
  swift_retain();
  swift_bridgeObjectRetain();
  v36._uint64_t countAndFlagsBits = v34;
  v36._object = v35;
  RendererTokenManager.invalidateToken(for:)(v36);
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)(v4 + 32) = a2;
  swift_beginAccess();
  if (MEMORY[0x263E3B0E0](v4 + 16))
  {
    uint64_t v37 = *(void *)(v4 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(a2, ObjectType, v37);
    swift_unknownObjectRelease();
  }
  uint64_t v39 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  swift_beginAccess();
  *(unsigned char *)(v4 + 88) = 0;
  return v12 != a2;
}

void *PosterRotationAnimator.displayLinkFired(displayLink:)(uint64_t a1)
{
  uint64_t v2 = v1;
  float v4 = CACurrentMediaTime() - *(double *)(v1 + 48);
  swift_beginAccess();
  if ((float)(v4 / *(float *)(v1 + 40)) <= 1.0) {
    float v6 = v4 / *(float *)(v1 + 40);
  }
  else {
    float v6 = 1.0;
  }
  uint64_t v7 = *(void **)(v1 + 72);
  if (v7)
  {
    *(float *)&double v5 = v6;
    objc_msgSend(v7, sel__solveForInput_, v5);
    float v6 = v8;
  }
  swift_beginAccess();
  uint64_t result = (void *)MEMORY[0x263E3B0E0](v1 + 16);
  if (result)
  {
    uint64_t v10 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    (*(void (**)(void, void, uint64_t, uint64_t, float))(v10 + 8))(*(void *)(v1 + 32), *(void *)(v1 + 64), ObjectType, v10, v6);
    uint64_t result = (void *)swift_unknownObjectRelease();
  }
  if (*(float *)(v1 + 40) <= v4)
  {
    uint64_t v12 = *(void *)(v1 + 64);
    swift_beginAccess();
    *(void *)(v2 + 32) = v12;
    *(void *)(v2 + 64) = 0;
    uint64_t result = *(void **)(a1 + 32);
    if (result)
    {
      objc_msgSend(result, sel_setPaused_, 1);
      swift_beginAccess();
      *(unsigned char *)(v2 + 88) = 0;
      uint64_t v13 = qword_26A921BB8;
      unint64_t v14 = off_26A921BC0;
      swift_retain();
      swift_bridgeObjectRetain();
      v15._uint64_t countAndFlagsBits = v13;
      v15._object = v14;
      RendererTokenManager.invalidateToken(for:)(v15);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t result = (void *)MEMORY[0x263E3B0E0](v2 + 16);
      if (result)
      {
        uint64_t v16 = *(void *)(v2 + 24);
        uint64_t v17 = swift_getObjectType();
        (*(void (**)(void, uint64_t, uint64_t))(v16 + 16))(*(void *)(v2 + 32), v17, v16);
        return (void *)swift_unknownObjectRelease();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_261552BF4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x263E3B0E0](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_261552C50(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_261552CAC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 32);
  return result;
}

uint64_t sub_261552CF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  return result;
}

float sub_261552D38@<S0>(uint64_t *a1@<X0>, float *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  float result = *(float *)(v3 + 40);
  *a2 = result;
  return result;
}

uint64_t sub_261552D80(int *a1, uint64_t *a2)
{
  int v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)(v3 + 40) = v2;
  return result;
}

uint64_t sub_261552DCC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 88);
  return result;
}

uint64_t sub_261552E14(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 88) = v2;
  return result;
}

uint64_t dispatch thunk of PosterRotationAnimatorDelegate.rotating(progress:fromOrientation:toOrientation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PosterRotationAnimatorDelegate.didRotate(orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for PosterRotationAnimator()
{
  return self;
}

uint64_t method lookup function for PosterRotationAnimator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PosterRotationAnimator);
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of PosterRotationAnimator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t sub_2615530F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t showSensitiveUIAlert(for:)(void *a1)
{
  uint64_t v2 = sub_261569620();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261569650();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2615533B4();
  uint64_t v10 = (void *)sub_261569900();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  aBlock[4] = sub_2615535F0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2615530F4;
  aBlock[3] = &block_descriptor_2;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  swift_release();
  sub_261569630();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_261553610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9217F0);
  sub_261553668();
  sub_261569990();
  MEMORY[0x263E3A5D0](0, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_2615533B4()
{
  unint64_t result = qword_26A9217E0;
  if (!qword_26A9217E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A9217E0);
  }
  return result;
}

void sub_2615533F4(void *a1)
{
  uint64_t v2 = (void *)sub_2615696D0();
  uint64_t v3 = (void *)sub_2615696D0();
  id v4 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v2, v3, 1);

  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = v4;
  uint64_t v7 = (void *)sub_2615696D0();
  v10[4] = sub_2615536C4;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_26154A030;
  v10[3] = &block_descriptor_6_0;
  uint64_t v8 = _Block_copy(v10);
  swift_release();
  id v9 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v7, 0, v8);
  _Block_release(v8);

  objc_msgSend(v6, sel_addAction_, v9);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v6, 1, 0);
}

uint64_t sub_2615535B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2615535F0()
{
  sub_2615533F4(*(void **)(v0 + 16));
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

unint64_t sub_261553610()
{
  unint64_t result = qword_26A9217E8;
  if (!qword_26A9217E8)
  {
    sub_261569620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9217E8);
  }
  return result;
}

unint64_t sub_261553668()
{
  unint64_t result = qword_26A9217F8;
  if (!qword_26A9217F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9217F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9217F8);
  }
  return result;
}

id sub_2615536C4()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

uint64_t DisplayLink.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 32) = 0;
  id v1 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v0, sel__displayLinkFired);
  uint64_t v2 = *(void **)(v0 + 32);
  *(void *)(v0 + 32) = v1;

  return v0;
}

id DisplayLink.preferredFrameRateRange.setter()
{
  id result = *(id *)(v0 + 32);
  if (result) {
    return objc_msgSend(result, sel_setPreferredFrameRateRange_);
  }
  __break(1u);
  return result;
}

id DisplayLink.isPaused.setter(char a1)
{
  id result = *(id *)(v1 + 32);
  if (result) {
    return objc_msgSend(result, sel_setPaused_, a1 & 1);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall DisplayLink.invalidate()()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  else {
    __break(1u);
  }
}

Swift::Void __swiftcall DisplayLink.add(to:forMode:)(NSRunLoop to, NSRunLoopMode forMode)
{
}

Swift::Void __swiftcall DisplayLink.remove(from:forMode:)(NSRunLoop from, NSRunLoopMode forMode)
{
}

id sub_2615537D4(uint64_t a1, uint64_t a2, SEL *a3)
{
  id result = *(id *)(v3 + 32);
  if (result) {
    return objc_msgSend(result, *a3, a1, a2);
  }
  __break(1u);
  return result;
}

id DisplayLink.isPaused.getter()
{
  id result = *(id *)(v0 + 32);
  if (result) {
    return objc_msgSend(result, sel_isPaused);
  }
  __break(1u);
  return result;
}

uint64_t DisplayLink.delegate.getter()
{
  swift_beginAccess();
  return MEMORY[0x263E3B0E0](v0 + 16);
}

uint64_t DisplayLink.delegate.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*DisplayLink.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x263E3B0E0](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_261551D7C;
}

uint64_t DisplayLink.init()()
{
  *(void *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 32) = 0;
  id v1 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v0, sel__displayLinkFired);
  uint64_t v2 = *(void **)(v0 + 32);
  *(void *)(v0 + 32) = v1;

  return v0;
}

SEL *DisplayLink.timestamp.getter()
{
  return sub_261553A80((SEL *)&selRef_timestamp);
}

SEL *DisplayLink.duration.getter()
{
  return sub_261553A80((SEL *)&selRef_duration);
}

SEL *DisplayLink.targetTimestamp.getter()
{
  return sub_261553A80((SEL *)&selRef_targetTimestamp);
}

SEL *sub_261553A80(SEL *result)
{
  if (*(void *)(v1 + 32)) {
    return (SEL *)[*(id *)(v1 + 32) *result];
  }
  __break(1u);
  return result;
}

id (*DisplayLink.isPaused.modify(uint64_t a1))(unsigned __int8 *a1, char a2)
{
  *(void *)a1 = v1;
  id result = *(id (**)(unsigned __int8 *, char))(v1 + 32);
  if (result)
  {
    *(unsigned char *)(a1 + 8) = objc_msgSend(result, sel_isPaused);
    return sub_261553B00;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553B00(unsigned __int8 *a1, char a2)
{
  id result = *(id *)(*(void *)a1 + 32);
  if (a2)
  {
    if (result) {
      return objc_msgSend(result, sel_setPaused_, a1[8]);
    }
    __break(1u);
  }
  if (result) {
    return objc_msgSend(result, sel_setPaused_, a1[8]);
  }
  __break(1u);
  return result;
}

id DisplayLink.preferredFramesPerSecond.getter()
{
  id result = *(id *)(v0 + 32);
  if (result) {
    return objc_msgSend(result, sel_preferredFramesPerSecond);
  }
  __break(1u);
  return result;
}

id DisplayLink.preferredFramesPerSecond.setter(uint64_t a1)
{
  id result = *(id *)(v1 + 32);
  if (result) {
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, a1);
  }
  __break(1u);
  return result;
}

id (*DisplayLink.preferredFramesPerSecond.modify(void *a1))(void *a1, char a2)
{
  a1[1] = v1;
  id result = *(id (**)(void *, char))(v1 + 32);
  if (result)
  {
    *a1 = objc_msgSend(result, sel_preferredFramesPerSecond);
    return sub_261553BC0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553BC0(void *a1, char a2)
{
  id result = *(id *)(a1[1] + 32);
  if (a2)
  {
    if (result) {
      return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
    }
    __break(1u);
  }
  if (result) {
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
  }
  __break(1u);
  return result;
}

id DisplayLink.preferredFrameRateRange.getter()
{
  id result = *(id *)(v0 + 32);
  if (result) {
    return objc_msgSend(result, sel_preferredFrameRateRange);
  }
  __break(1u);
  return result;
}

id (*DisplayLink.preferredFrameRateRange.modify(uint64_t a1))(_DWORD *a1, char a2, double a3, double a4, double a5)
{
  *(void *)a1 = v1;
  id result = *(id (**)(_DWORD *, char, double, double, double))(v1 + 32);
  if (result)
  {
    objc_msgSend(result, sel_preferredFrameRateRange);
    *(_DWORD *)(a1 + 8) = v4;
    *(_DWORD *)(a1 + 12) = v5;
    *(_DWORD *)(a1 + 16) = v6;
    return sub_261553C74;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553C74(_DWORD *a1, char a2, double a3, double a4, double a5)
{
  id result = *(id *)(*(void *)a1 + 32);
  if (a2)
  {
    if (result)
    {
LABEL_5:
      LODWORD(a4) = a1[3];
      LODWORD(a5) = a1[4];
      LODWORD(a3) = a1[2];
      return objc_msgSend(result, sel_setPreferredFrameRateRange_, a3, a4, a5);
    }
    __break(1u);
  }
  if (result) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t DisplayLink.deinit()
{
  sub_26155148C(v0 + 16);

  return v0;
}

uint64_t DisplayLink.__deallocating_deinit()
{
  sub_26155148C(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_261553D10@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x263E3B0E0](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_261553D6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

id sub_261553DC8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  id result = *(id *)(*(void *)a1 + 32);
  if (result)
  {
    id result = objc_msgSend(result, sel_isPaused);
    *a2 = (_BYTE)result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553E08(unsigned __int8 *a1, uint64_t a2)
{
  id result = *(id *)(*(void *)a2 + 32);
  if (result) {
    return objc_msgSend(result, sel_setPaused_, *a1);
  }
  __break(1u);
  return result;
}

id sub_261553E2C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = *(id *)(*(void *)a1 + 32);
  if (result)
  {
    id result = objc_msgSend(result, sel_preferredFramesPerSecond);
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553E6C(void *a1, uint64_t a2)
{
  id result = *(id *)(*(void *)a2 + 32);
  if (result) {
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
  }
  __break(1u);
  return result;
}

id sub_261553E90@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  id result = *(id *)(*(void *)a1 + 32);
  if (result)
  {
    id result = objc_msgSend(result, sel_preferredFrameRateRange);
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_261553ED4(_DWORD *a1, uint64_t a2, double a3, double a4, double a5)
{
  id result = *(id *)(*(void *)a2 + 32);
  if (result)
  {
    LODWORD(a4) = a1[1];
    LODWORD(a5) = a1[2];
    LODWORD(a3) = *a1;
    return objc_msgSend(result, sel_setPreferredFrameRateRange_, a3, a4, a5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t dispatch thunk of DisplayLinkDelegate.displayLinkFired(displayLink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for DisplayLink()
{
  return self;
}

uint64_t method lookup function for DisplayLink(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisplayLink);
}

uint64_t dispatch thunk of DisplayLink.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_261553F60(uint64_t a1)
{
  if ((unint64_t)(a1 - 70) > 0x2D) {
    goto LABEL_6;
  }
  if (((1 << (a1 - 70)) & 0xC03) != 0) {
    return 4;
  }
  if (a1 == 115) {
    return 8;
  }
LABEL_6:
  sub_2615699E0();
  sub_261569760();
  type metadata accessor for MTLPixelFormat(0);
  sub_261569A70();
  uint64_t result = sub_261569A90();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination()
{
  return &type metadata for WallpaperMetalCoordination;
}

unint64_t sub_261554060()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26156B1B0;
  *(void *)(inited + 32) = 0x73646E756F62;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  *(void *)(inited + 56) = 0x6E6F697469736F70;
  *(void *)(inited + 64) = 0xE800000000000000;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  *(void *)(inited + 80) = 0x6F50726F68636E61;
  *(void *)(inited + 88) = 0xEB00000000746E69;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  *(void *)(inited + 104) = 0x73746E65746E6F63;
  *(void *)(inited + 112) = 0xE800000000000000;
  *(void *)(inited + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  unint64_t result = sub_26153EB1C(inited);
  qword_26A9239B0 = result;
  return result;
}

BOOL sub_261554178(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_26155419C()
{
  type metadata accessor for WallpaperMetalCoordination.Resources();
  swift_allocObject();
  uint64_t result = sub_2615541DC();
  qword_26A9239B8 = result;
  return result;
}

uint64_t sub_2615541DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2615698F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  int v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2615698E0();
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261569650();
  MEMORY[0x270FA5388]();
  uint64_t v7 = sub_261569610();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = MTLCreateSystemDefaultDevice();
  if (!v11) {
    goto LABEL_5;
  }
  id v12 = v11;
  uint64_t v22 = v3;
  id v13 = objc_msgSend(v11, sel_newCommandQueue);
  if (!v13)
  {
    swift_unknownObjectRelease();
LABEL_5:
    type metadata accessor for WallpaperMetalCoordination.Resources();
    swift_deallocPartialClassInstance();
    return 0;
  }
  unint64_t v14 = v13;
  *(void *)(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device) = v12;
  *(void *)(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue) = v13;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v21 = v2;
  uint64_t v15 = sub_2615696D0();
  uint64_t v20 = v5;
  uint64_t v16 = (void *)v15;
  objc_msgSend(v14, sel_setLabel_, v15);

  sub_261569600();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_log, v10, v7);
  sub_2615533B4();
  sub_261569640();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_26155511C(&qword_26A921C08, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921C10);
  sub_261555164();
  sub_261569990();
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v20, *MEMORY[0x263F8F130], v21);
  uint64_t v17 = sub_261569920();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(void *)(v1 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_snapshotQueue) = v17;
  return v1;
}

uint64_t sub_2615545DC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_log;
  uint64_t v2 = sub_261569610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_snapshotQueue));
  return swift_deallocClassInstance();
}

uint64_t sub_2615546AC()
{
  return type metadata accessor for WallpaperMetalCoordination.Resources();
}

uint64_t type metadata accessor for WallpaperMetalCoordination.Resources()
{
  uint64_t result = qword_26A921BC8;
  if (!qword_26A921BC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261554700()
{
  uint64_t result = sub_261569610();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2615547A8(uint64_t a1, uint64_t a2, void *a3, void *a4, char *a5, double a6, double a7)
{
  uint64_t v9 = v7;
  char v16 = *a5;
  *(void *)(v7 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15840]), sel_init);
  *(void *)(v7 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  *(void *)(v7 + 40) = 0;
  *(unsigned char *)(v7 + 48) = v16;
  if (v16)
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v22 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 10, a1, a2, 0);
    objc_msgSend(v22, sel_setUsage_, 4);
    objc_msgSend(v22, sel_setStorageMode_, 2);
    uint64_t v53 = MEMORY[0x263F8EE78];
    sub_2615516E8(0, 3, 0);
    uint64_t v17 = v53;
    uint64_t v23 = sub_261554E70(a1, a2, a3);
    if (v8)
    {
      swift_unknownObjectRelease();

      swift_release();
      type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager();
      swift_deallocPartialClassInstance();
      return v9;
    }
    unint64_t v25 = *(void *)(v53 + 16);
    unint64_t v26 = *(void *)(v53 + 24);
    unint64_t v27 = v25 + 1;
    if (v25 >= v26 >> 1)
    {
      double v47 = v23;
      unint64_t v50 = *(void *)(v53 + 16);
      unint64_t v43 = v25 + 1;
      uint64_t v45 = v24;
      sub_2615516E8(v26 > 1, v25 + 1, 1);
      uint64_t v23 = v47;
      unint64_t v25 = v50;
      unint64_t v27 = v43;
      uint64_t v24 = v45;
      uint64_t v17 = v53;
    }
    *(void *)(v17 + 16) = v27;
    uint64_t v28 = v17 + 16 * v25;
    *(void *)(v28 + 32) = v23;
    *(void *)(v28 + 40) = v24;
    uint64_t v29 = sub_261554E70(a1, a2, a3);
    unint64_t v31 = *(void *)(v17 + 16);
    unint64_t v32 = *(void *)(v17 + 24);
    unint64_t v33 = v31 + 1;
    if (v31 >= v32 >> 1)
    {
      Swift::String v48 = v29;
      unint64_t v51 = *(void *)(v17 + 16);
      unint64_t v44 = v31 + 1;
      uint64_t v46 = v30;
      sub_2615516E8(v32 > 1, v31 + 1, 1);
      uint64_t v29 = v48;
      unint64_t v31 = v51;
      unint64_t v33 = v44;
      uint64_t v30 = v46;
    }
    *(void *)(v17 + 16) = v33;
    uint64_t v34 = v17 + 16 * v31;
    *(void *)(v34 + 32) = v29;
    *(void *)(v34 + 40) = v30;
    Swift::String v36 = sub_261554E70(a1, a2, a3);
    uint64_t v38 = v37;
    unint64_t v39 = *(void *)(v17 + 16);
    unint64_t v40 = *(void *)(v17 + 24);
    unint64_t v41 = v39 + 1;
    if (v39 >= v40 >> 1)
    {
      unint64_t v49 = *(void *)(v17 + 16);
      unint64_t v52 = v39 + 1;
      sub_2615516E8(v40 > 1, v39 + 1, 1);
      unint64_t v39 = v49;
      unint64_t v41 = v52;
    }
    *(void *)(v17 + 16) = v41;
    uint64_t v42 = v17 + 16 * v39;
    *(void *)(v42 + 32) = v36;
    *(void *)(v42 + 40) = v38;
  }
  *(void *)(v9 + 32) = v17;
  uint64_t v18 = *(void **)(v9 + 16);
  objc_msgSend(v18, sel_setSourceLayer_, a4);
  objc_msgSend(v18, sel_setPosition_, a6 * 0.5, a7 * 0.5);
  objc_msgSend(v18, sel_setBounds_, 0.0, 0.0, a6, a7);
  objc_msgSend(v18, sel_setAnchorPoint_, 0.0, 0.0);
  uint64_t v19 = *(void **)(v9 + 24);
  objc_msgSend(v19, sel_setPosition_, 0.0, 0.0);
  objc_msgSend(v19, sel_setBounds_, 0.0, 0.0, a6, a7);
  id v20 = v18;
  id v21 = v19;
  objc_msgSend(v20, sel_setMask_, v21);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_261554B48()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (!v1) {
    goto LABEL_10;
  }
  unint64_t v2 = *(void *)(v0 + 40);
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v3 = *(void *)(v1 + 16);
  if (v2 >= v3)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    uint64_t result = sub_261569A90();
    __break(1u);
    return result;
  }
  uint64_t v4 = v1 + 16 * v2;
  uint64_t v5 = *(void *)(v4 + 32);
  uint64_t v6 = *(void **)(v4 + 40);
  if (v2 + 1 == v3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v2 + 1;
  }
  *(void *)(v0 + 40) = v7;
  swift_unknownObjectRetain();
  id v8 = v6;
  return v5;
}

uint64_t sub_261554C10()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager()
{
  return self;
}

uint64_t getEnumTagSinglePayload for WallpaperMetalCoordination.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WallpaperMetalCoordination.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x261554DD8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_261554E00(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.Error()
{
  return &type metadata for WallpaperMetalCoordination.Error;
}

unint64_t sub_261554E1C()
{
  unint64_t result = qword_26A921BD8;
  if (!qword_26A921BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921BD8);
  }
  return result;
}

void *sub_261554E70(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921BE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26156B1B0;
  BOOL v7 = (void *)*MEMORY[0x263F0ECF8];
  uint64_t v8 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F0ECF8];
  *(void *)(inited + 40) = a1;
  uint64_t v9 = (void *)*MEMORY[0x263F0ECC0];
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = v9;
  *(void *)(inited + 80) = a2;
  uint64_t v10 = (void *)*MEMORY[0x263F0ECA0];
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 112) = v10;
  *(void *)(inited + 120) = 1;
  id v11 = (void *)*MEMORY[0x263F0ECC8];
  *(void *)(inited + 144) = v8;
  *(void *)(inited + 152) = v11;
  *(void *)(inited + 184) = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 160) = 1093677112;
  id v12 = v7;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  sub_26153ED5C(inited);
  id v16 = objc_allocWithZone(MEMORY[0x263F0ED00]);
  type metadata accessor for IOSurfacePropertyKey(0);
  sub_26155511C(&qword_26A921848, type metadata accessor for IOSurfacePropertyKey);
  uint64_t v17 = (void *)sub_261569660();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithProperties_, v17);

  if (v18)
  {
    uint64_t v19 = self;
    id v20 = v18;
    id v21 = objc_msgSend(v19, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 10, a1, a2, 0);
    objc_msgSend(v21, sel_setUsage_, 4);
    objc_msgSend(v21, sel_setStorageMode_, 2);
    id v22 = objc_msgSend(a3, sel_newTextureWithDescriptor_iosurface_plane_, v21, v20, 0);
    if (v22)
    {
      a3 = v22;
    }
    else
    {
      sub_261544B2C();
      swift_allocError();
      *uint64_t v24 = 4;
      swift_willThrow();
    }
  }
  else
  {
    sub_261544B2C();
    swift_allocError();
    unsigned char *v23 = 4;
    swift_willThrow();
  }
  return a3;
}

uint64_t sub_26155511C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_261555164()
{
  unint64_t result = qword_26A921C18;
  if (!qword_26A921C18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A921C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921C18);
  }
  return result;
}

uint64_t UIViewAnimationCurve.description.getter()
{
  return 0x6E776F6E6B6E55;
}

uint64_t sub_261555270()
{
  return UIViewAnimationCurve.description.getter();
}

uint64_t sub_261555278(uint64_t a1)
{
  return sub_2615552E0(a1, qword_26B40E540);
}

uint64_t sub_26155529C(uint64_t a1)
{
  return sub_2615552E0(a1, qword_26B40E510);
}

uint64_t sub_2615552C0(uint64_t a1)
{
  return sub_2615552E0(a1, qword_26B40E528);
}

uint64_t sub_2615552E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_261569610();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_261569600();
}

id PRPosterRenderingEnvironment.unlockState.getter@<X0>(uint64_t a1@<X8>)
{
  objc_msgSend(v1, sel_unlockProgress);
  if (v3 < 0.0 || (objc_msgSend(v1, sel_unlockProgress), v4 > 1.0))
  {
    objc_msgSend(v1, sel_unlockProgress);
    BOOL v6 = v5 >= 0.0;
    id result = objc_msgSend(v1, sel_unlockProgress);
    BOOL v9 = v8 < 0.0;
    double v10 = 1.0;
    if (v9) {
      double v10 = 0.0;
    }
    *(unsigned char *)a1 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v1, sel_unlockProgress);
  double v12 = v11;
  id result = objc_msgSend(v1, sel_unlockProgress);
  double v14 = v13;
  if (v12 != 0.0)
  {
    id result = objc_msgSend(v1, sel_unlockProgress);
    if (v14 == 1.0) {
      *(unsigned char *)a1 = 1;
    }
    else {
      *(unsigned char *)a1 = 2;
    }
LABEL_6:
    *(double *)(a1 + 8) = v10;
    return result;
  }
  *(unsigned char *)a1 = 0;
  *(double *)(a1 + 8) = v13;
  return result;
}

id PRPosterRenderingEnvironment.wakeState.getter@<X0>(uint64_t a1@<X8>)
{
  objc_msgSend(v1, sel_backlightProgress);
  if (v3 >= 0.0)
  {
    objc_msgSend(v1, sel_backlightProgress);
    if (v4 <= 1.0)
    {
      objc_msgSend(v1, sel_backlightProgress);
      if (v11 == 0.0)
      {
        objc_msgSend(v1, sel_linearBacklightProgress);
        uint64_t v13 = v12;
        id result = objc_msgSend(v1, sel_backlightProgress);
        char v15 = 1;
      }
      else
      {
        objc_msgSend(v1, sel_backlightProgress);
        double v17 = v16;
        objc_msgSend(v1, sel_linearBacklightProgress);
        uint64_t v13 = v18;
        id result = objc_msgSend(v1, sel_backlightProgress);
        if (v17 == 1.0)
        {
          *(unsigned char *)a1 = 0;
          goto LABEL_12;
        }
        char v15 = 2;
      }
      *(unsigned char *)a1 = v15;
LABEL_12:
      *(void *)(a1 + 8) = v13;
      *(void *)(a1 + 16) = v14;
      return result;
    }
  }
  objc_msgSend(v1, sel_backlightProgress);
  BOOL v6 = v5 < 0.0;
  objc_msgSend(v1, sel_backlightProgress);
  if (v7 >= 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  id result = objc_msgSend(v1, sel_linearBacklightProgress);
  *(unsigned char *)a1 = v6;
  *(void *)(a1 + 8) = v10;
  *(double *)(a1 + 16) = v8;
  return result;
}

id PRRenderer.isPreview.getter()
{
  return sub_2615555A4((SEL *)&selRef_isPreview);
}

id PRRenderer.isSnapshot.getter()
{
  return sub_2615555A4((SEL *)&selRef_isSnapshot);
}

id sub_2615555A4(SEL *a1)
{
  id v2 = objc_msgSend(objc_msgSend(v1, sel_environment), *a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t PRRenderer.wakeState.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_environment);
  PRPosterRenderingEnvironment.wakeState.getter(a1);
  return swift_unknownObjectRelease();
}

uint64_t PRRenderer.unlockState.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_environment);
  PRPosterRenderingEnvironment.unlockState.getter(a1);
  return swift_unknownObjectRelease();
}

id PRRenderer.posterContents.getter()
{
  id v1 = objc_msgSend(objc_msgSend(v0, sel_environment), sel_contents);
  swift_unknownObjectRelease();
  return v1;
}

double PRRenderer.snapshotBounds.getter()
{
  id v1 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v1, sel_bounds);
  double v3 = v2;

  return v3;
}

void sub_26155577C()
{
  qword_26A9239E0 = 0x617A696C61636F4CLL;
  *(void *)algn_26A9239E8 = 0xEB00000000656C62;
}

uint64_t static String.localized(key:tableSuffix:comment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_26A921628 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26A9239E0;
  uint64_t v9 = *(void *)algn_26A9239E8;
  id v10 = objc_msgSend(self, sel_mainBundle);
  uint64_t v11 = sub_2615558A0(a1, a2, (uint64_t)v10, v8, v9, a3, a4);

  return v11;
}

uint64_t sub_2615558A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7 && sub_261569740() > 0)
  {
    swift_bridgeObjectRetain();
    sub_261569760();
    swift_bridgeObjectRetain();
    sub_2615697C0();
    sub_261569750();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = sub_261569440();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static String.localized(key:table:comment:)()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_261569440();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_261555ABC()
{
  uint64_t v0 = sub_261569540();
  __swift_allocate_value_buffer(v0, qword_26A921C20);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A921C20);
  return sub_261555B08(v1);
}

uint64_t sub_261555B08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC8);
  MEMORY[0x270FA5388](v1 - 8);
  double v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921C38);
  MEMORY[0x270FA5388](v4 - 8);
  BOOL v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921C40);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_261569420();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_261569550();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v15 = sub_2615695A0();
  double v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v6, 1, 1, v15);
  sub_261569400();
  sub_2615693D0();
  sub_2615693E0();
  sub_2615693A0();
  sub_2615693C0();
  sub_2615693F0();
  sub_261569590();
  v16(v6, 0, 1, v15);
  sub_261569410();
  sub_2615693B0();
  uint64_t v17 = sub_261569540();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) == 1)
  {
    sub_261569520();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return sub_26155612C((uint64_t)v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v3, v17);
  }
}

uint64_t static Date.idealizedDate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A921630 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_261569540();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A921C20);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Date.idealizedDate.setter(uint64_t a1)
{
  if (qword_26A921630 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_261569540();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A921C20);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Date.idealizedDate.modify())()
{
  if (qword_26A921630 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_261569540();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A921C20);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_26155612C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static PosterDataLoader.from(look:)(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 80);
  id v3 = objc_msgSend(a1, sel_identifier);
  uint64_t v4 = sub_261569700();
  uint64_t v6 = v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 88) + 32))(v4, v6, v2);
}

uint64_t static PosterDataLoader.from(renderer:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v4 = *(void *)(v2 + 80);
  uint64_t v55 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  unint64_t v52 = (uint8_t *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v49 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v53 = (char *)&v49 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v54 = (char *)&v49 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v49 - v14;
  uint64_t v16 = *(void *)(v2 + 88);
  uint64_t v17 = type metadata accessor for PosterDataLoadResult();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v49 - v22;
  id v24 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_contents);
  swift_unknownObjectRelease();
  static PosterDataLoader.posterDataResult<A>(from:)(v4, v16, v23);
  swift_unknownObjectRelease();
  uint64_t v56 = v23;
  uint64_t v57 = v18;
  unint64_t v25 = v23;
  uint64_t v26 = v55;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v25, v17);
  uint64_t v58 = v17;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  char v60 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    v60(v15, v21, v4);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_261569610();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B40E540);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    uint64_t v30 = v54;
    v29(v54, v15, v4);
    unint64_t v31 = sub_2615695F0();
    os_log_type_t v32 = sub_2615698A0();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      unint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = v52;
      unint64_t v51 = v33;
      *(_DWORD *)unint64_t v33 = 136315138;
      unint64_t v50 = v33 + 4;
      v29(v53, v30, v4);
      uint64_t v34 = sub_261569720();
      uint64_t v61 = sub_2615453FC(v34, v35, (uint64_t *)&v62);
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v54, v4);
      Swift::String v36 = v51;
      _os_log_impl(&dword_26153C000, v31, v32, "renderer posterData — fallbacking to: %s", v51, 0xCu);
      uint64_t v37 = v52;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v37, -1, -1);
      MEMORY[0x263E3AFE0](v36, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v4);
    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v58);
  }
  else
  {
    v60(v9, v21, v4);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_261569610();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B40E540);
    unint64_t v39 = *(void (**)(uint8_t *, char *, uint64_t))(v26 + 16);
    unint64_t v40 = v52;
    v39(v52, v9, v4);
    unint64_t v41 = sub_2615695F0();
    os_log_type_t v42 = sub_2615698A0();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      unint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = v51;
      uint64_t v54 = v9;
      unint64_t v50 = v43;
      *(_DWORD *)unint64_t v43 = 136315138;
      unint64_t v49 = v43 + 4;
      v39((uint8_t *)v53, (char *)v40, v4);
      uint64_t v44 = sub_261569720();
      uint64_t v61 = sub_2615453FC(v44, v45, (uint64_t *)&v62);
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(uint8_t *, uint64_t))(v26 + 8))(v40, v4);
      uint64_t v46 = v50;
      _os_log_impl(&dword_26153C000, v41, v42, "renderer posterData — successfully loaded: %s", v50, 0xCu);
      double v47 = v51;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v47, -1, -1);
      MEMORY[0x263E3AFE0](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v58);
      uint64_t v15 = v54;
    }
    else
    {

      (*(void (**)(uint8_t *, uint64_t))(v26 + 8))(v40, v4);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v58);
      uint64_t v15 = v9;
    }
  }
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v60)(v59, v15, v4);
}

uint64_t static PosterDataLoader.posterDataResult<A>(from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char *a3@<X8>)
{
  uint64_t v6 = sub_261569950();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v34 - v9;
  uint64_t v11 = *(void *)(a1 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  unint64_t v40 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v34 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v34 - v17;
  swift_getObjectType();
  uint64_t v42 = a2;
  PRPosterContents.posterData<A>()(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_261569610();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B40E540);
    uint64_t v20 = sub_2615695F0();
    os_log_type_t v21 = sub_2615698A0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_26153C000, v20, v21, "posterDataResult(from posterContents — using fallback", v22, 2u);
      MEMORY[0x263E3AFE0](v22, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v42 + 56))(a1, v42);
  }
  else
  {
    unint64_t v39 = a3;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v23(v18, v10, a1);
    unint64_t v41 = v18;
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_261569610();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B40E540);
    unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v25(v16, v41, a1);
    uint64_t v26 = sub_2615695F0();
    os_log_type_t v27 = sub_2615698A0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v44 = v36;
      uint64_t v37 = v11 + 32;
      uint64_t v38 = v23;
      *(_DWORD *)uint64_t v28 = 136315138;
      v34[1] = v28 + 4;
      unint64_t v35 = v28;
      v25(v40, v16, a1);
      uint64_t v29 = sub_261569720();
      uint64_t v43 = sub_2615453FC(v29, v30, &v44);
      uint64_t v23 = v38;
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, a1);
      unint64_t v31 = v35;
      _os_log_impl(&dword_26153C000, v26, v27, "posterDataResult(from posterContents — successfully loaded: %s", v35, 0xCu);
      uint64_t v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v32, -1, -1);
      MEMORY[0x263E3AFE0](v31, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, a1);
    }

    v23(v39, v41, a1);
  }
  type metadata accessor for PosterDataLoadResult();
  return swift_storeEnumTagMultiPayload();
}

uint64_t static PosterDataLoader.from(renderingEnvironment:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_261556DD8(a1, (SEL *)&selRef_contents, a2);
}

uint64_t static PosterDataLoader.from(editingEnvironment:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_261556DD8(a1, (SEL *)&selRef_sourceContents, a2);
}

uint64_t sub_261556DD8@<X0>(void *a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a3;
  id v61 = a1;
  uint64_t v5 = *(void *)(v3 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v56 = (char *)&v50 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v54 = (char *)&v50 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v18 = *(void *)(v3 + 88);
  uint64_t v19 = type metadata accessor for PosterDataLoadResult();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v50 - v24;
  id v26 = [v61 *a2];
  static PosterDataLoader.posterDataResult<A>(from:)(v5, v18, v25);
  swift_unknownObjectRelease();
  uint64_t v57 = v25;
  uint64_t v58 = v20;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v25, v19);
  uint64_t v59 = v19;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  id v61 = *(id *)(v6 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    ((void (*)(char *, char *, uint64_t))v61)(v17, v23, v5);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_261569610();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B40E540);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    unint64_t v30 = v54;
    v29(v54, v17, v5);
    unint64_t v31 = sub_2615695F0();
    os_log_type_t v32 = sub_2615698A0();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v63 = v53;
      uint64_t v55 = v17;
      *(_DWORD *)unint64_t v33 = 136315138;
      unint64_t v51 = v33 + 4;
      unint64_t v52 = v33;
      v29(v56, v30, v5);
      uint64_t v34 = sub_261569720();
      uint64_t v62 = sub_2615453FC(v34, v35, &v63);
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v30, v5);
      uint64_t v17 = v55;
      uint64_t v36 = v52;
      _os_log_impl(&dword_26153C000, v31, v32, "renderer posterData — fallbacking to: %s", v52, 0xCu);
      uint64_t v37 = v53;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v37, -1, -1);
      MEMORY[0x263E3AFE0](v36, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v30, v5);
    }
    (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v59);
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v61)(v11, v23, v5);
    uint64_t v17 = v11;
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_261569610();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B40E540);
    unint64_t v39 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    unint64_t v40 = v55;
    v39(v55, v11, v5);
    unint64_t v41 = sub_2615695F0();
    uint64_t v42 = v5;
    os_log_type_t v43 = sub_2615698A0();
    if (os_log_type_enabled(v41, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v63 = v53;
      uint64_t v54 = v17;
      *(_DWORD *)uint64_t v44 = 136315138;
      unint64_t v51 = v44 + 4;
      unint64_t v52 = v44;
      v39(v56, v40, v42);
      uint64_t v45 = sub_261569720();
      uint64_t v62 = sub_2615453FC(v45, v46, &v63);
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v40, v42);
      double v47 = v52;
      _os_log_impl(&dword_26153C000, v41, v43, "renderer posterData — successfully loaded: %s", v52, 0xCu);
      uint64_t v48 = v53;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v48, -1, -1);
      MEMORY[0x263E3AFE0](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v59);
      uint64_t v17 = v54;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v40, v42);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v59);
    }
    uint64_t v5 = v42;
  }
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v61)(v60, v17, v5);
}

uint64_t static PosterDataLoader.from(editor:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v137 = a2;
  v141[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(v3 + 80);
  uint64_t v127 = *(void *)(v3 + 88);
  uint64_t v6 = type metadata accessor for PosterDataLoadResult();
  uint64_t v135 = *(void *)(v6 - 8);
  long long v136 = (void (*)(char *, char *, uint64_t))v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v132 = (char *)v121 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v134 = (char *)v121 - v9;
  uint64_t v10 = sub_261569950();
  uint64_t v124 = *(void *)(v10 - 8);
  uint64_t v125 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unsigned int v131 = (char *)v121 - v12;
  uint64_t v13 = *(void *)(v5 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  int v129 = (char *)v121 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v121 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  long long v128 = (char *)v121 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  int v130 = (char *)v121 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v121 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v138 = (char *)v121 - v29;
  if (qword_26B40E330 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_261569610();
  uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_26B40E540);
  id v32 = a1;
  unint64_t v33 = sub_2615695F0();
  os_log_type_t v34 = sub_2615698A0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v139 = v5;
  uint64_t v133 = v13;
  uint64_t v123 = v16;
  unint64_t v122 = v21;
  size_t v126 = v28;
  if (v35)
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = (void *)swift_slowAlloc();
    v141[0] = v37;
    v121[1] = v3;
    *(_DWORD *)uint64_t v36 = 136315138;
    id v38 = objc_msgSend(v32, sel_currentLook, v36 + 4);
    uint64_t v39 = v31;
    id v40 = objc_msgSend(v38, sel_identifier);

    uint64_t v41 = sub_261569700();
    unint64_t v43 = v42;

    uint64_t v31 = v39;
    uint64_t v140 = sub_2615453FC(v41, v43, (uint64_t *)v141);
    sub_261569960();

    uint64_t v5 = v139;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_26153C000, v33, v34, "loading poster data, from editor with lookIdentifier: %s", v36, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v133;
    MEMORY[0x263E3AFE0](v37, -1, -1);
    MEMORY[0x263E3AFE0](v36, -1, -1);
  }
  else
  {
  }
  id v44 = objc_msgSend(v32, sel_currentLook);
  uint64_t v45 = v131;
  static PosterDataLoader.from(look:)(v44);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v45, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v124 + 8))(v45, v125);
    unint64_t v46 = (char *)v32;
    double v47 = sub_2615695F0();
    os_log_type_t v48 = sub_2615698A0();
    unint64_t v49 = 0x265583000uLL;
    uint64_t v50 = v31;
    unint64_t v51 = 0x265583000uLL;
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = (void *)swift_slowAlloc();
      v141[0] = v53;
      *(_DWORD *)unint64_t v52 = 136315138;
      uint64_t v54 = v46;
      id v55 = objc_msgSend(objc_msgSend(v46, sel_environment), sel_sourceContents);
      swift_unknownObjectRelease();
      uint64_t v140 = (uint64_t)v55;
      __swift_instantiateConcreteTypeFromMangledName(qword_26A921CB0);
      uint64_t v56 = sub_261569720();
      uint64_t v140 = sub_2615453FC(v56, v57, (uint64_t *)v141);
      unint64_t v46 = v54;
      unint64_t v51 = 0x265583000;
      sub_261569960();

      unint64_t v49 = 0x265583000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26153C000, v47, v48, "loading poster data from %s", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v53, -1, -1);
      MEMORY[0x263E3AFE0](v52, -1, -1);
    }
    else
    {
    }
    id v70 = objc_msgSend(objc_msgSend(v46, *(SEL *)(v49 + 2136)), *(SEL *)(v51 + 2336));
    swift_unknownObjectRelease();
    v141[0] = 0;
    id v71 = objc_msgSend(v70, sel_loadUserInfoWithError_, v141);
    swift_unknownObjectRelease();
    id v72 = v141[0];
    v121[2] = v50;
    if (v71)
    {
      sub_261569670();
      id v73 = v72;

      swift_bridgeObjectRetain();
      id v74 = sub_2615695F0();
      os_log_type_t v75 = sub_2615698A0();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v138 = v46;
        uint64_t v76 = (uint8_t *)swift_slowAlloc();
        uint64_t v77 = (void *)swift_slowAlloc();
        v141[0] = v77;
        *(_DWORD *)uint64_t v76 = 136315138;
        unsigned int v131 = (char *)(v76 + 4);
        swift_bridgeObjectRetain();
        unint64_t v78 = v51;
        uint64_t v79 = sub_261569680();
        unint64_t v81 = v80;
        swift_bridgeObjectRelease();
        uint64_t v82 = v79;
        unint64_t v51 = v78;
        uint64_t v140 = sub_2615453FC(v82, v81, (uint64_t *)v141);
        sub_261569960();
        swift_bridgeObjectRelease_n();
        unint64_t v46 = v138;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_26153C000, v74, v75, "loaded userInfo: %s", v76, 0xCu);
        swift_arrayDestroy();
        uint64_t v83 = v77;
        unint64_t v49 = 0x265583000;
        MEMORY[0x263E3AFE0](v83, -1, -1);
        MEMORY[0x263E3AFE0](v76, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      id v85 = v141[0];
      uint64_t v86 = (void *)sub_261569450();

      swift_willThrow();
      uint64_t v87 = sub_2615695F0();
      os_log_type_t v88 = sub_2615698A0();
      if (os_log_type_enabled(v87, v88))
      {
        unint64_t v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v89 = 0;
        _os_log_impl(&dword_26153C000, v87, v88, "unable to load userInfo", v89, 2u);
        MEMORY[0x263E3AFE0](v89, -1, -1);
      }
    }
    uint64_t v90 = v139;
    uint64_t v91 = v133;
    id v92 = objc_msgSend(objc_msgSend(v46, *(SEL *)(v49 + 2136)), *(SEL *)(v51 + 2336));
    swift_unknownObjectRelease();
    uint64_t v93 = v134;
    static PosterDataLoader.posterDataResult<A>(from:)(v90, v127, v134);
    swift_unknownObjectRelease();
    (*(void (**)(char *, char *, void))(v135 + 16))(v132, v93, v136);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    os_log_type_t v95 = *(void (**)(char *, char *, uint64_t))(v91 + 32);
    uint64_t v96 = (void (**)(char *, char *, uint64_t))(v91 + 16);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v97 = v128;
      v95(v128, v132, v90);
      uint64_t v98 = *v96;
      size_t v99 = v122;
      (*v96)(v122, v97, v90);
      CGColorSpaceRef v100 = sub_2615695F0();
      os_log_type_t v101 = sub_2615698A0();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v138 = (char *)v95;
        uint64_t v102 = (uint8_t *)swift_slowAlloc();
        uint64_t v132 = (char *)swift_slowAlloc();
        v141[0] = v132;
        *(_DWORD *)uint64_t v102 = 136315138;
        unsigned int v131 = (char *)(v102 + 4);
        v98(v130, v99, v139);
        os_log_type_t v95 = (void (*)(char *, char *, uint64_t))v138;
        uint64_t v103 = sub_261569720();
        uint64_t v140 = sub_2615453FC(v103, v104, (uint64_t *)v141);
        sub_261569960();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v91 + 8))(v99, v139);
        _os_log_impl(&dword_26153C000, v100, v101, "editor posterData — fallbacking to: %s", v102, 0xCu);
        os_log_type_t v105 = v132;
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v105, -1, -1);
        uint64_t v106 = v102;
        uint64_t v90 = v139;
        MEMORY[0x263E3AFE0](v106, -1, -1);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v91 + 8))(v99, v90);
      }
      (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v135 + 8))(v134, v136);
      uint64_t v119 = v137;
      uint64_t v120 = v128;
    }
    else
    {
      uint64_t v107 = v129;
      v95(v129, v132, v90);
      uint64_t v108 = *v96;
      uint64_t v109 = v123;
      (*v96)(v123, v107, v90);
      unint64_t v110 = sub_2615695F0();
      os_log_type_t v111 = sub_2615698A0();
      int v112 = v111;
      if (os_log_type_enabled(v110, v111))
      {
        uint64_t v138 = (char *)v95;
        char v113 = (uint8_t *)swift_slowAlloc();
        uint64_t v114 = v91;
        uint64_t v115 = (void *)swift_slowAlloc();
        v141[0] = v115;
        LODWORD(v132) = v112;
        *(_DWORD *)char v113 = 136315138;
        unsigned int v131 = (char *)(v113 + 4);
        v108(v130, v109, v139);
        os_log_type_t v95 = (void (*)(char *, char *, uint64_t))v138;
        uint64_t v116 = sub_261569720();
        uint64_t v140 = sub_2615453FC(v116, v117, (uint64_t *)v141);
        sub_261569960();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v114 + 8))(v109, v139);
        _os_log_impl(&dword_26153C000, v110, (os_log_type_t)v132, "editor posterData — successfully loaded: %s", v113, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v115, -1, -1);
        uint64_t v118 = v113;
        uint64_t v90 = v139;
        MEMORY[0x263E3AFE0](v118, -1, -1);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v91 + 8))(v109, v90);
      }
      (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v135 + 8))(v134, v136);
      uint64_t v119 = v137;
      uint64_t v120 = v129;
    }
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v95)(v119, v120, v90);
  }
  else
  {
    uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v59 = v138;
    v58(v138, v45, v5);
    uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    id v61 = v126;
    v60(v126, v59, v5);
    uint64_t v62 = sub_2615695F0();
    os_log_type_t v63 = sub_2615698A0();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      long long v136 = v58;
      uint64_t v65 = v64;
      uint64_t v135 = swift_slowAlloc();
      v141[0] = (id)v135;
      *(_DWORD *)uint64_t v65 = 136315138;
      uint64_t v134 = (char *)(v65 + 4);
      v60(v130, v61, v139);
      uint64_t v66 = sub_261569720();
      uint64_t v140 = sub_2615453FC(v66, v67, (uint64_t *)v141);
      uint64_t v5 = v139;
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v61, v5);
      _os_log_impl(&dword_26153C000, v62, v63, "currentLookKaleidoscopePosterData: %s", (uint8_t *)v65, 0xCu);
      uint64_t v68 = v135;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v68, -1, -1);
      uint64_t v69 = v65;
      uint64_t v58 = v136;
      MEMORY[0x263E3AFE0](v69, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v61, v5);
    }

    return ((uint64_t (*)(uint64_t, char *, uint64_t))v58)(v137, v138, v5);
  }
}

uint64_t static PosterDataLoader.comparePosterData(from:to:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  double v47 = a3;
  uint64_t v6 = *(void *)(v3 + 80);
  uint64_t v7 = sub_261569950();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v45 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v39 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v39 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v39 - v17;
  objc_msgSend(objc_msgSend(a1, sel_environment), sel_contents);
  uint64_t v19 = (uint64_t)v18;
  swift_unknownObjectRelease();
  swift_getObjectType();
  uint64_t v48 = v3;
  PRPosterContents.posterData<A>()(v6, (uint64_t)v18);
  swift_unknownObjectRelease();
  if (qword_26B40E330 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_261569610();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B40E540);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v21(v16, v19, v7);
  v21(v13, a2, v7);
  uint64_t v22 = sub_2615695F0();
  os_log_type_t v23 = sub_2615698A0();
  int v24 = v23;
  BOOL v25 = os_log_type_enabled(v22, v23);
  unint64_t v46 = v13;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v44 = a2;
    uint64_t v27 = v26;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v50 = v42;
    *(_DWORD *)uint64_t v27 = 136315394;
    int v41 = v24;
    os_log_t v40 = v22;
    uint64_t v28 = v45;
    v21(v45, (uint64_t)v16, v7);
    uint64_t v29 = sub_261569720();
    uint64_t v43 = v19;
    uint64_t v49 = sub_2615453FC(v29, v30, &v50);
    v39[2] = &v50;
    sub_261569960();
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v16, v7);
    *(_WORD *)(v27 + 12) = 2080;
    v39[1] = v27 + 14;
    id v32 = v46;
    v21(v28, (uint64_t)v46, v7);
    uint64_t v33 = sub_261569720();
    uint64_t v49 = sub_2615453FC(v33, v34, &v50);
    sub_261569960();
    uint64_t v19 = v43;
    swift_bridgeObjectRelease();
    v31(v32, v7);
    os_log_t v35 = v40;
    _os_log_impl(&dword_26153C000, v40, (os_log_type_t)v41, "updateResult from renderer data: %s compared to %s", (uint8_t *)v27, 0x16u);
    uint64_t v36 = v42;
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v36, -1, -1);
    uint64_t v37 = v27;
    a2 = v44;
    MEMORY[0x263E3AFE0](v37, -1, -1);
  }
  else
  {
    uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v16, v7);
    v31(v46, v7);
  }
  static PosterDataLoader.compare(newData:with:)(v19, a2, v47);
  return ((uint64_t (*)(uint64_t, uint64_t))v31)(v19, v7);
}

{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  unint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  void (*v55)(char *, uint64_t, char *);
  char *v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void (*v68)(char *, char *);
  NSObject *v69;
  uint64_t v70;
  char *v72;
  void v73[2];
  uint64_t v74;
  int v75;
  uint64_t v76;
  char *v77;
  NSObject *v78;
  os_log_t v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;

  uint64_t v87 = (char *)a2;
  id v85 = a3;
  uint64_t v5 = *(void *)(v3 + 80);
  uint64_t v6 = sub_261569950();
  uint64_t v84 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v83 = (char *)v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v80 = (char *)v73 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v73 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v82 = (char *)v73 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v81 = (void (*)(char *, uint64_t))((char *)v73 - v17);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v73 - v19;
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v18);
  uint64_t v79 = (os_log_t)((char *)v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v73 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v73 - v27;
  uint64_t v29 = objc_msgSend(a1, sel_currentLook);
  static PosterDataLoader.from(look:)(v29);

  unint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v5);
  uint64_t v86 = v3;
  if (v30 == 1)
  {
    uint64_t v31 = v84;
    unint64_t v81 = *(void (**)(char *, uint64_t))(v84 + 8);
    v81(v20, v6);
    objc_msgSend(objc_msgSend(a1, sel_environment), sel_sourceContents);
    swift_unknownObjectRelease();
    swift_getObjectType();
    PRPosterContents.posterData<A>()(v5, (uint64_t)v13);
    swift_unknownObjectRelease();
    id v32 = v6;
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_261569610();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B40E540);
    unint64_t v34 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    os_log_t v35 = v80;
    v34(v80, v13, v6);
    uint64_t v36 = v83;
    v34(v83, v87, v6);
    uint64_t v37 = sub_2615695F0();
    id v38 = sub_2615698A0();
    uint64_t v39 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      os_log_t v40 = swift_slowAlloc();
      uint64_t v79 = v37;
      int v41 = v40;
      uint64_t v84 = swift_slowAlloc();
      unint64_t v89 = v84;
      *(_DWORD *)int v41 = 136315394;
      uint64_t v76 = v41 + 4;
      LODWORD(v78) = v39;
      uint64_t v42 = v82;
      v34(v82, v35, v6);
      uint64_t v43 = sub_261569720();
      os_log_type_t v88 = sub_2615453FC(v43, v44, &v89);
      uint64_t v77 = v13;
      sub_261569960();
      id v32 = v6;
      swift_bridgeObjectRelease();
      uint64_t v45 = v35;
      unint64_t v46 = v81;
      v81(v45, v6);
      *(_WORD *)(v41 + 12) = 2080;
      v34(v42, v36, v6);
      double v47 = v46;
      uint64_t v13 = v77;
      uint64_t v48 = sub_261569720();
      os_log_type_t v88 = sub_2615453FC(v48, v49, &v89);
      sub_261569960();
      swift_bridgeObjectRelease();
      v46(v36, v6);
      uint64_t v50 = v79;
      _os_log_impl(&dword_26153C000, v79, (os_log_type_t)v78, "updateResult from editor source contents: %s compared to %s", (uint8_t *)v41, 0x16u);
      unint64_t v51 = v84;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v51, -1, -1);
      MEMORY[0x263E3AFE0](v41, -1, -1);
    }
    else
    {
      double v47 = v81;
      v81(v35, v6);
      v47(v36, v6);
    }
    static PosterDataLoader.compare(newData:with:)((uint64_t)v13, (uint64_t)v87, v85);
    return ((uint64_t (*)(char *, uint64_t))v47)(v13, v32);
  }
  else
  {
    unint64_t v52 = v84;
    uint64_t v83 = (char *)v6;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v28, v20, v5);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_261569610();
    __swift_project_value_buffer(v53, (uint64_t)qword_26B40E540);
    uint64_t v54 = *(char **)(v21 + 16);
    uint64_t v77 = v28;
    unint64_t v80 = v54;
    ((void (*)(char *, char *, uint64_t))v54)(v26, v28, v5);
    id v55 = *(void (**)(char *, uint64_t, char *))(v52 + 16);
    uint64_t v56 = (char *)v81;
    unint64_t v57 = v83;
    v55((char *)v81, (uint64_t)v87, v83);
    uint64_t v58 = sub_2615695F0();
    uint64_t v59 = sub_2615698A0();
    unint64_t v78 = v58;
    os_log_type_t v75 = v59;
    uint64_t v60 = os_log_type_enabled(v58, v59);
    uint64_t v76 = v21 + 16;
    if (v60)
    {
      id v61 = swift_slowAlloc();
      id v74 = swift_slowAlloc();
      unint64_t v89 = v74;
      *(_DWORD *)id v61 = 136315394;
      ((void (*)(os_log_t, char *, uint64_t))v80)(v79, v26, v5);
      uint64_t v62 = sub_261569720();
      os_log_type_t v88 = sub_2615453FC(v62, v63, &v89);
      sub_261569960();
      swift_bridgeObjectRelease();
      uint64_t v79 = *(os_log_t *)(v21 + 8);
      ((void (*)(char *, uint64_t))v79)(v26, v5);
      *(_WORD *)(v61 + 12) = 2080;
      v73[1] = v61 + 14;
      uint64_t v64 = (char *)v81;
      uint64_t v65 = (uint64_t)v82;
      v55(v82, (uint64_t)v81, v83);
      uint64_t v66 = sub_261569720();
      os_log_type_t v88 = sub_2615453FC(v66, v67, &v89);
      unint64_t v57 = v83;
      sub_261569960();
      swift_bridgeObjectRelease();
      uint64_t v68 = *(void (**)(char *, char *))(v52 + 8);
      v68(v64, v57);
      uint64_t v69 = v78;
      _os_log_impl(&dword_26153C000, v78, (os_log_type_t)v75, "updateResult from editor look identifier: %s compared to %s", (uint8_t *)v61, 0x16u);
      id v70 = v74;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v70, -1, -1);
      MEMORY[0x263E3AFE0](v61, -1, -1);
    }
    else
    {
      uint64_t v79 = *(os_log_t *)(v21 + 8);
      ((void (*)(char *, uint64_t))v79)(v26, v5);
      uint64_t v68 = *(void (**)(char *, char *))(v52 + 8);
      v68(v56, v57);

      uint64_t v65 = (uint64_t)v82;
    }
    id v72 = v77;
    ((void (*)(uint64_t, char *, uint64_t))v80)(v65, v77, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v65, 0, 1, v5);
    static PosterDataLoader.compare(newData:with:)(v65, (uint64_t)v87, v85);
    v68((char *)v65, v57);
    return ((uint64_t (*)(char *, uint64_t))v79)(v72, v5);
  }
}

uint64_t static PosterDataLoader.compare(newData:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  unint64_t v57 = a3;
  uint64_t v6 = *(void *)(v3 + 80);
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  id v55 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v52 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v54 = (char *)&v52 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v52 = (char *)&v52 - v14;
  uint64_t v15 = sub_261569950();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v19 = (char *)&v52 - v18;
  uint64_t v20 = (char *)&v52 + *(int *)(v17 + 56) - v18;
  uint64_t v21 = *(void *)(v15 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v22((char *)&v52 - v18, a1, v15);
  uint64_t v23 = a2;
  uint64_t v24 = v6;
  v22(v20, v23, v15);
  BOOL v25 = v7;
  uint64_t v26 = (unsigned int (*)(char *, uint64_t, uint64_t))v7[6];
  if (v26(v19, 1, v6) == 1)
  {
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_261569610();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B40E540);
    uint64_t v28 = sub_2615695F0();
    os_log_type_t v29 = sub_2615698A0();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v30 = 0;
      _os_log_impl(&dword_26153C000, v28, v29, "compare — newData nil", v30, 2u);
      MEMORY[0x263E3AFE0](v30, -1, -1);
    }

    (*(void (**)(uint64_t, void))(*(void *)(v56 + 88) + 56))(v24, *(void *)(v56 + 88));
    type metadata accessor for PosterDataComparisonResult();
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v15);
  }
  else if (v26(v20, 1, v6) == 1)
  {
    id v32 = (void (*)(char *, char *, uint64_t))v7[4];
    uint64_t v33 = v52;
    v32(v52, v19, v6);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_261569610();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B40E540);
    os_log_t v35 = sub_2615695F0();
    os_log_type_t v36 = sub_2615698A0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_26153C000, v35, v36, "compare — new data not nil; old data nil", v37, 2u);
      MEMORY[0x263E3AFE0](v37, -1, -1);
    }

    v32(v57, v33, v24);
    type metadata accessor for PosterDataComparisonResult();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    id v38 = (void (*)(char *, char *, uint64_t))v7[2];
    uint64_t v39 = v54;
    v38(v54, v19, v6);
    os_log_t v40 = v53;
    v38(v53, v20, v6);
    if (sub_2615696C0())
    {
      if (qword_26B40E330 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_261569610();
      __swift_project_value_buffer(v41, (uint64_t)qword_26B40E540);
      uint64_t v42 = sub_2615695F0();
      os_log_type_t v43 = sub_2615698A0();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_26153C000, v42, v43, "compare — new and old data are equal", v44, 2u);
        MEMORY[0x263E3AFE0](v44, -1, -1);
      }

      uint64_t v45 = (void (*)(char *, uint64_t))v25[1];
      v45(v40, v24);
      v45(v39, v24);
      type metadata accessor for PosterDataComparisonResult();
      swift_storeEnumTagMultiPayload();
      v45(v20, v24);
      return ((uint64_t (*)(char *, uint64_t))v45)(v19, v24);
    }
    else
    {
      unint64_t v46 = (void (*)(char *, uint64_t))v25[1];
      v46(v40, v6);
      v46(v39, v6);
      double v47 = (void (*)(char *, char *, uint64_t))v25[4];
      v47(v55, v19, v6);
      if (qword_26B40E330 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_261569610();
      __swift_project_value_buffer(v48, (uint64_t)qword_26B40E540);
      uint64_t v49 = sub_2615695F0();
      os_log_type_t v50 = sub_2615698A0();
      if (os_log_type_enabled(v49, v50))
      {
        unint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v51 = 0;
        _os_log_impl(&dword_26153C000, v49, v50, "compare — new data different than old data", v51, 2u);
        MEMORY[0x263E3AFE0](v51, -1, -1);
      }

      v47(v57, v55, v24);
      type metadata accessor for PosterDataComparisonResult();
      swift_storeEnumTagMultiPayload();
      return ((uint64_t (*)(char *, uint64_t))v46)(v20, v24);
    }
  }
}

uint64_t PosterDataLoader.deinit()
{
  return v0;
}

uint64_t PosterDataLoader.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2615598BC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PosterDataLoader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PosterDataLoader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PosterDataLoader);
}

uint64_t sub_261559924@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  return PosterData.init(lookIdentifier:)(a1, a2, a3, a4, a5);
}

uint64_t PosterData.init(lookIdentifier:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v10 = sub_261569950();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v31 = v10;
  uint64_t v32 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v29 - v16;
  uint64_t v18 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  unint64_t v30 = a1;
  uint64_t v21 = sub_261559FD0(a1, a2);
  (*(void (**)(uint64_t))(a4 + 40))(v21);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v22(v17, 1, a3) != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v27(v20, v17, a3);
LABEL_6:
    v27(a5, v20, a3);
    uint64_t v26 = 0;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(a5, v26, 1, a3);
  }
  os_log_type_t v29 = a5;
  uint64_t v23 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v24 = v17;
  uint64_t v25 = v31;
  v32 += 8;
  v23(v24, v31);
  (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(a4 + 48))(v30, a2, a3, a4);
  if (v22(v14, 1, a3) != 1)
  {
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v27(v20, v14, a3);
    a5 = v29;
    goto LABEL_6;
  }
  v23(v14, v25);
  uint64_t v26 = 1;
  a5 = v29;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(a5, v26, 1, a3);
}

uint64_t sub_261559C1C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return PosterData.init(data:)(a1, a2, a3, a4);
}

uint64_t PosterData.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_261569950();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v14 - v9;
  sub_2615692F0();
  swift_allocObject();
  sub_2615692E0();
  sub_2615692D0();
  sub_26155A4F8(a1, a2);
  swift_release();
  uint64_t v11 = *(void *)(a3 - 8);
  uint64_t v12 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  v12(v10, 0, 1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a4, v10, a3);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v12)(a4, 0, 1, a3);
}

uint64_t sub_261559E68@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return PosterData.init(string:)(a1, a2);
}

uint64_t PosterData.init(string:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
  return v4(a2, 1, 1, a1);
}

id PosterData.editingLook.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 80))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
  id v4 = objc_allocWithZone(MEMORY[0x263F5F498]);
  uint64_t v5 = (void *)sub_2615696D0();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_2615696D0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithIdentifier_displayName_, v5, v6);

  return v7;
}

uint64_t sub_261559FD0(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921D38);
  if (swift_dynamicCast())
  {
    sub_261548858(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_261569430();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_26155BEF0((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      id v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_261569A10();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_26155C6BC(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_261569770();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_26155C720(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_26155BFCC((void *(*)(uint64_t *__return_ptr, char *, char *))sub_26155C7C0);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_2615694B0();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_26155BF50(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_2615697A0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_261569A10();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_26155BF50(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_261569780();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_2615694C0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_2615694C0();
    sub_26155C82C(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_26155C82C((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_26155A4F8(uint64_t a1, unint64_t a2)
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

uint64_t dispatch thunk of PosterData.init(lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PosterData.init(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of PosterData.init(string:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of static PosterData.fallbackData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PosterData.editingLook.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PosterData.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PosterData.lookIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_26155A5DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_26155A5E8(void *__dst, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(_DWORD *)(v4 + 80);
  if (v6 <= 7 && (unint64_t)(v5 + 1) <= 0x18 && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    unsigned int v10 = a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a2;
          goto LABEL_18;
        case 2:
          int v13 = *(unsigned __int16 *)a2;
          goto LABEL_18;
        case 3:
          int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_18;
        case 4:
          int v13 = *(_DWORD *)a2;
LABEL_18:
          int v14 = (v13 | (v11 << (8 * v5))) + 2;
          unsigned int v10 = v13 + 2;
          if (v5 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      (*(void (**)(void *))(v4 + 16))(__dst);
      *((unsigned char *)v3 + v5) = 1;
    }
    else if (v10)
    {
      memcpy(__dst, a2, v5 + 1);
    }
    else
    {
      (*(void (**)(void *))(v4 + 16))(__dst);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  else
  {
    uint64_t v9 = *(void *)a2;
    *unint64_t v3 = *(void *)a2;
    unint64_t v3 = (void *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

unsigned __int8 *sub_26155A770(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_10;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_10;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_10;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_10:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 <= 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

unsigned char *sub_26155A860(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_10;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_10:
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v6 == 1)
  {
    (*(void (**)(unsigned char *))(v4 + 16))(__dst);
    __dst[v5] = 1;
  }
  else if (v6)
  {
    memcpy(__dst, a2, v5 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *))(v4 + 16))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_26155A9AC(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_11;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_11;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_11;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_11:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 <= 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_24;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_24;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_24;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_24:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 0;
    }
  }
  return __dst;
}

unsigned char *sub_26155ABD8(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_10;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_10:
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v6 == 1)
  {
    (*(void (**)(unsigned char *))(v4 + 32))(__dst);
    __dst[v5] = 1;
  }
  else if (v6)
  {
    memcpy(__dst, a2, v5 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *))(v4 + 32))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_26155AD24(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_11;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_11;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_11;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_11:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 <= 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_24;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_24;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_24;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_24:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_26155AF50(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_20;
  }
  uint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_20:
      unsigned int v10 = *((unsigned __int8 *)a1 + v3);
      if (v10 >= 3) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_20;
  }
LABEL_12:
  int v9 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v9 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v4 | v9) + 254;
}

void sub_26155B078(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_32:
        __break(1u);
        JUMPOUT(0x26155B234);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_20;
      case 3:
        goto LABEL_32;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      default:
LABEL_20:
        if (a2) {
LABEL_21:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_26155B25C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v3 = a1[v2];
  int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_10;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_10;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_10;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_10:
        unsigned int v7 = (v6 | (v4 << (8 * v2))) + 2;
        LODWORD(v3) = v6 + 2;
        if (v2 >= 4) {
          uint64_t v3 = v3;
        }
        else {
          uint64_t v3 = v7;
        }
        break;
      default:
        return v3;
    }
  }
  return v3;
}

uint64_t type metadata accessor for PosterDataComparisonResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_26155B324()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_26155B3B0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(_DWORD *)(v4 + 80);
  if (v6 <= 7 && (unint64_t)(v5 + 1) <= 0x18 && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    unsigned int v10 = a2[v5];
    if (v10 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_18;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_18;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_18;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_18:
          int v13 = (v12 | ((v10 - 2) << (8 * v5))) + 2;
          unsigned int v14 = v12 + 2;
          if (v5 >= 4) {
            unsigned int v10 = v14;
          }
          else {
            unsigned int v10 = v13;
          }
          break;
        default:
          break;
      }
    }
    (*(void (**)(void *))(v4 + 16))(a1);
    *((unsigned char *)v3 + v5) = v10 == 1;
  }
  else
  {
    uint64_t v9 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_26155B518(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_26155B544(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_10;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_10:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  BOOL v10 = v5 == 1;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
  *(unsigned char *)(a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_26155B664(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 + 64);
    (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    unsigned int v9 = a2[v8];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_11;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_11;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_11;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_11:
          int v13 = (v12 | (v10 << (8 * v8))) + 2;
          unsigned int v9 = v12 + 2;
          if (v8 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    BOOL v14 = v9 == 1;
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v5);
    a1[v8] = v14;
  }
  return a1;
}

uint64_t sub_26155B7CC(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_10;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_10:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  BOOL v10 = v5 == 1;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
  *(unsigned char *)(a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_26155B8EC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 + 64);
    (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    unsigned int v9 = a2[v8];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_11;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_11;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_11;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_11:
          int v13 = (v12 | (v10 << (8 * v8))) + 2;
          unsigned int v9 = v12 + 2;
          if (v8 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    BOOL v14 = v9 == 1;
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v5);
    a1[v8] = v14;
  }
  return a1;
}

uint64_t sub_26155BA54(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_20;
  }
  uint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_20:
      unsigned int v10 = *((unsigned __int8 *)a1 + v3);
      if (v10 >= 2) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_20;
  }
LABEL_12:
  int v9 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v9 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v4 | v9) + 255;
}

void sub_26155BB7C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_32:
        __break(1u);
        JUMPOUT(0x26155BD38);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_20;
      case 3:
        goto LABEL_32;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      default:
LABEL_20:
        if (a2) {
LABEL_21:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_26155BD60(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v3 = a1[v2];
  int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_10;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_10;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_10;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_10:
        unsigned int v7 = (v6 | (v4 << (8 * v2))) + 2;
        LODWORD(v3) = v6 + 2;
        if (v2 >= 4) {
          uint64_t v3 = v3;
        }
        else {
          uint64_t v3 = v7;
        }
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_26155BE0C(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for PosterDataLoadResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_26155BEF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26155BF50(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2615697B0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x263E3A450](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_26155BFCC(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_26156B3E0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_261569350() && __OFSUB__((int)v4, sub_261569380())) {
        goto LABEL_24;
      }
      sub_261569390();
      swift_allocObject();
      uint64_t v13 = sub_261569330();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_26155C3B8((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_261569490();
      uint64_t result = sub_26155C3B8(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *unint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *unint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *unint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_26155C2D0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_26155C4F8(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_26155C5BC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_26155C638((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_26155C348(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_26155C3B8(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_261569350();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_261569380();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_261569370();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_26155C46C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2615699F0();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
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

uint64_t sub_26155C4F8(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_26155C5BC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_261569390();
  swift_allocObject();
  uint64_t result = sub_261569340();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2615694A0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_26155C638(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_261569390();
  swift_allocObject();
  uint64_t result = sub_261569340();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_26155C6BC(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_26155C4F8(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_26155C5BC((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_26155C638((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_26155C720(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_261569390();
      swift_allocObject();
      sub_261569360();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2615694A0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_26155C7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_26155C348((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_26155C840, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_26155C82C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_26155A4F8(a1, a2);
  }
  return a1;
}

uint64_t sub_26155C840@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_26155C46C(a1, a2);
}

uint64_t PRPosterContents.posterData<A>()@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  v47[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v42 - v9;
  uint64_t v11 = (void *)MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v42 - v12;
  v47[0] = 0;
  id v14 = objc_msgSend(v11, sel_loadUserInfoWithError_, v47);
  id v15 = v47[0];
  if (v14)
  {
    int v16 = v14;
    int v17 = (void *)sub_261569670();
    id v18 = v15;

    sub_2615692F0();
    swift_allocObject();
    sub_2615692E0();
    v47[3] = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_26B40E338);
    v47[0] = v17;
    swift_bridgeObjectRetain();
    sub_26155D078(a1, v47);
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_261569610();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B40E540);
    uint64_t v32 = v4;
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v33(v10, v13, a1);
    uint64_t v34 = sub_2615695F0();
    os_log_type_t v35 = sub_2615698C0();
    uint64_t v44 = v34;
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      v47[0] = v43;
      *(_DWORD *)os_log_type_t v36 = 136315138;
      uint64_t v42 = v36 + 4;
      v33(v7, v10, a1);
      uint64_t v37 = sub_261569720();
      uint64_t v46 = sub_2615453FC(v37, v38, (uint64_t *)v47);
      sub_261569960();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v10, a1);
      uint64_t v39 = v44;
      _os_log_impl(&dword_26153C000, v44, v35, "Decoded object from userInfo: %s", v36, 0xCu);
      long long v40 = v43;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v40, -1, -1);
      MEMORY[0x263E3AFE0](v36, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v10, a1);
    }
    uint64_t v4 = v32;
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v45, v13, a1);
    uint64_t v30 = 0;
  }
  else
  {
    id v19 = v47[0];
    uint64_t v20 = (void *)sub_261569450();

    swift_willThrow();
    if (qword_26B40E330 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_261569610();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B40E540);
    id v22 = v20;
    id v23 = v20;
    uint64_t v24 = sub_2615695F0();
    os_log_type_t v25 = sub_2615698B0();
    if (os_log_type_enabled(v24, v25))
    {
      unsigned int v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      v47[0] = v27;
      *(_DWORD *)unsigned int v26 = 136315138;
      swift_getErrorValue();
      uint64_t v28 = sub_261569B80();
      uint64_t v46 = sub_2615453FC(v28, v29, (uint64_t *)v47);
      sub_261569960();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_26153C000, v24, v25, "Could not load userInfo from poster contents: %s", v26, 0xCu);
      uint64_t v30 = 1;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v27, -1, -1);
      MEMORY[0x263E3AFE0](v26, -1, -1);
    }
    else
    {

      uint64_t v30 = 1;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v45, v30, 1, a1);
}

uint64_t sub_26155D078(uint64_t a1, void *a2)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = self;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v11[0] = 0;
  id v4 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, sub_261569B30(), 0, v11);
  swift_unknownObjectRelease();
  id v5 = v11[0];
  if (v4)
  {
    uint64_t v6 = sub_2615694E0();
    unint64_t v8 = v7;

    sub_2615692D0();
    return sub_26155A4F8(v6, v8);
  }
  else
  {
    uint64_t v10 = v5;
    sub_261569450();

    return swift_willThrow();
  }
}

Swift::OpaquePointer_optional __swiftcall Encodable.userInfo()()
{
  sub_261569320();
  swift_allocObject();
  sub_261569310();
  sub_26155D2B0();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B40E338);
  if (swift_dynamicCast()) {
    unint64_t v1 = v2;
  }
  else {
    unint64_t v1 = 0;
  }
  result.value._rawValue = v1;
  result.is_nil = v0;
  return result;
}

uint64_t sub_26155D2B0()
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t result = sub_261569300();
  if (!v0)
  {
    uint64_t v3 = result;
    unint64_t v4 = v2;
    id v5 = self;
    uint64_t v6 = (void *)sub_2615694D0();
    v10[0] = 0;
    id v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 4, v10);

    id v8 = v10[0];
    if (v7)
    {
      sub_261569980();
      sub_26155A4F8(v3, v4);
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = v8;
      sub_261569450();

      swift_willThrow();
      return sub_26155A4F8(v3, v4);
    }
  }
  return result;
}

uint64_t FloatingPoint.reverse.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_261569B50();
  sub_261569B20();
  sub_261569AA0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, a1);
}

uint64_t FloatingPoint.smoothstep.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v26 = *(void *)(*(void *)(a2 + 16) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v29 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = *(void *)(a1 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v26 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  id v18 = (char *)&v26 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v28 = (char *)&v26 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v30 = (char *)&v26 - v21;
  uint64_t v27 = v3;
  sub_261569880();
  swift_getAssociatedConformanceWitness();
  sub_261569B50();
  sub_261569B20();
  sub_261569B50();
  sub_261569B20();
  sub_261569880();
  id v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v12, a1);
  id v23 = v28;
  sub_261569AA0();
  v22(v15, a1);
  v22(v18, a1);
  uint64_t v24 = v30;
  sub_261569880();
  v22(v23, a1);
  return ((uint64_t (*)(char *, uint64_t))v22)(v24, a1);
}

uint64_t FloatingPoint.toRadians.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v17[1] = a3;
  v17[2] = *(void *)(*(void *)(a2 + 16) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v17 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v17 - v13;
  sub_2615696B0();
  swift_getAssociatedConformanceWitness();
  sub_261569B50();
  sub_261569B20();
  sub_2615696A0();
  id v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v9, a1);
  v15(v12, a1);
  sub_261569880();
  return ((uint64_t (*)(char *, uint64_t))v15)(v14, a1);
}

uint64_t FloatingPoint.toDegrees.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v16 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v16 - v12;
  swift_getAssociatedConformanceWitness();
  sub_261569B50();
  sub_261569B20();
  sub_2615696B0();
  sub_2615696A0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a1);
  v14(v11, a1);
  sub_261569880();
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, a1);
}

Swift::Double __swiftcall Double.truncate(to:)(Swift::Int to)
{
  double v2 = v1;
  double v3 = __exp10((double)to);
  return floor(v3 * v2) / v3;
}

Swift::Float __swiftcall Float.truncate(to:)(Swift::Int to)
{
  float v2 = v1;
  float v3 = __exp10f((float)to);
  return floorf(v3 * v2) / v3;
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.renderingType.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_26155DDB4(uint64_t a1, void *a2)
{
  sub_26155DE68(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + 32;
  swift_beginAccess();
  sub_26156298C((uint64_t)v5, v3, (uint64_t *)&unk_26A921640);
  return swift_endAccess();
}

uint64_t sub_26155DE1C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_26155DE68(v1 + 32, a1);
}

uint64_t sub_26155DE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921D70);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + 32);
  unint64_t v5 = *(void *)(v0 + 40);
  uint64_t v7 = qword_26A921638;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_261569610();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A921D50);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_2615695F0();
  os_log_type_t v10 = sub_2615698A0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2615453FC(v6, v5, &v21);
    sub_261569960();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26153C000, v9, v10, "ContinuousRenderingToken “%{public}s” deinit", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v12, -1, -1);
    MEMORY[0x263E3AFE0](v11, -1, -1);

    if (*(unsigned char *)(v1 + 24)) {
      goto LABEL_9;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (*(unsigned char *)(v1 + 24))
    {
LABEL_9:
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    goto LABEL_9;
  }
  uint64_t v14 = Strong;
  uint64_t v15 = sub_261569860();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_261569840();
  swift_retain();
  uint64_t v16 = sub_261569830();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  v17[2] = v16;
  void v17[3] = v18;
  v17[4] = v14;
  v17[5] = v6;
  v17[6] = v5;
  sub_26155E2D4((uint64_t)v4, (uint64_t)&unk_26A921D80, (uint64_t)v17);
  swift_release();
  swift_release();
LABEL_10:
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_26155E1C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_261569840();
  _OWORD v6[5] = sub_261569830();
  uint64_t v8 = sub_261569820();
  return MEMORY[0x270FA2498](sub_26155E25C, v8, v7);
}

uint64_t sub_26155E25C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  swift_release();
  sub_26156241C(v2, v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_26155E2D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_261569860();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_261569850();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_26154B598(a1, &qword_26A921D70);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_261569820();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.__deallocating_deinit()
{
  WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_26155E4B4()
{
  uint64_t v0 = sub_261569610();
  __swift_allocate_value_buffer(v0, qword_26A921D50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A921D50);
  return sub_261569600();
}

uint64_t sub_26155E530()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_26155E578(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_26155E640;
  return sub_26155E1C0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_26155E640()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.__allocating_init(identifier:rendering:environment:lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  WallpaperMetalCoordination.RenderingCoordinator.init(identifier:rendering:environment:lookIdentifier:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t *WallpaperMetalCoordination.RenderingCoordinator.init(identifier:rendering:environment:lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = v7;
  uint64_t v70 = a4;
  uint64_t v71 = a7;
  uint64_t v67 = a6;
  uint64_t v68 = a5;
  uint64_t v66 = *v7;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921AB0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v7 + 2) = 0u;
  uint64_t v16 = (uint64_t)(v7 + 4);
  v9[8] = 0;
  *((_OWORD *)v9 + 3) = 0u;
  v9[16] = 0;
  v9[17] = 0;
  sub_2615628CC((uint64_t)v92);
  uint64_t v69 = v9 + 18;
  sub_261562A0C((uint64_t)v92, (uint64_t)(v9 + 18), (uint64_t *)&unk_26A921D90);
  v9[37] = 0;
  v9[38] = 0;
  v9[39] = MEMORY[0x263F8EE88];
  if (qword_26A921618 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A9239B8;
  if (qword_26A9239B8)
  {
    v65[2] = v8;
    v9[9] = a1;
    v9[10] = a2;
    uint64_t v18 = v70;
    v9[2] = a3;
    v9[3] = v18;
    uint64_t v19 = *(void *)(v17 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device);
    v9[11] = v19;
    v9[12] = *(void *)(v17
                       + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
    uint64_t v21 = v17;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    v65[1] = v21;
    swift_retain();
    uint64_t v22 = v20(a3, v18);
    id v23 = (CGColorSpace *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(a3, v18);
    id v24 = objc_allocWithZone((Class)type metadata accessor for WallpaperMetalView(0));
    os_log_type_t v25 = sub_261548EF4(v19, v22, v23);
    v9[13] = (uint64_t)v25;
    if (qword_26A921638 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_261569610();
    uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_26A921D50);
    uint64_t v28 = *(void *)(v26 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v15, v27, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v15, 0, 1, v26);
    uint64_t v29 = (uint64_t)&v25[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
    swift_beginAccess();
    sub_26156298C((uint64_t)v15, v29, &qword_26A921AB0);
    swift_endAccess();
    *(unsigned char *)(v9[13] + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically) = 0;
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    v9[14] = (uint64_t)v30;
    uint64_t v31 = qword_26A921610;
    id v32 = v30;
    if (v31 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9216B0);
    uint64_t v33 = (void *)sub_261569660();
    objc_msgSend(v32, sel_setActions_, v33);

    uint64_t v34 = (void *)v9[14];
    objc_msgSend(v34, sel_setPosition_, 0.0, 0.0);
    objc_msgSend(v34, sel_setAnchorPoint_, 0.0, 0.0);
    id v35 = v34;
    os_log_type_t v36 = (void *)sub_2615696D0();
    objc_msgSend(v35, sel_setName_, v36);

    (*(void (**)(void *__return_ptr, uint64_t))(v70 + 32))(v91, a3);
    if (LOBYTE(v91[0]) == 2)
    {
      id v37 = 0;
      unint64_t v38 = v68;
      uint64_t v39 = v71;
    }
    else
    {
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
      objc_msgSend(v37, sel_setAnchorPoint_, 0.0, 0.0);
      id v41 = objc_msgSend((id)v9[14], sel_actions);
      if (v41)
      {
        sub_261569670();

        id v41 = (id)sub_261569660();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v37, sel_setActions_, v41);

      objc_msgSend(v37, sel_setHidden_, 1);
      id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
      objc_msgSend(v42, sel_setAnchorPoint_, 0.0, 0.0);
      id v43 = objc_msgSend((id)v9[14], sel_actions);
      if (v43)
      {
        sub_261569670();

        id v43 = (id)sub_261569660();
        swift_bridgeObjectRelease();
      }
      unint64_t v38 = v68;
      uint64_t v39 = v71;
      objc_msgSend(v42, sel_setActions_, v43);

      objc_msgSend(v37, sel_setMask_, v42);
    }
    v9[15] = (uint64_t)v37;
    v9[35] = v67;
    v9[36] = v39;
    swift_getObjectType();
    swift_bridgeObjectRetain();
    if (objc_msgSend(v38, sel_isSnapshot))
    {
      swift_bridgeObjectRelease();
      uint64_t v44 = (uint64_t)v69;
      sub_261562A0C((uint64_t)v69, (uint64_t)v91, (uint64_t *)&unk_26A921D90);
      uint64_t v45 = v92;
    }
    else
    {
      id v46 = objc_msgSend((id)swift_unknownObjectRetain(), sel_traitCollection);
      if (v46)
      {
        double v47 = v46;
        id v48 = objc_msgSend(v46, sel_userInterfaceStyle);

        BOOL v49 = v48 == (id)2;
      }
      else
      {
        BOOL v49 = 0;
      }
      id v50 = objc_msgSend(v38, sel_deviceOrientation);
      PRPosterRenderingEnvironment.unlockState.getter((uint64_t)v74);
      char v51 = v74[0];
      uint64_t v52 = v75;
      PRPosterRenderingEnvironment.wakeState.getter((uint64_t)v91);
      char v53 = v91[0];
      uint64_t v54 = v91[1];
      uint64_t v55 = v91[2];
      unsigned __int8 v56 = objc_msgSend(v38, sel_isSnapshot);
      swift_unknownObjectRelease();
      char v73 = 0;
      char v72 = 0;
      v74[0] = v51;
      uint64_t v75 = v52;
      char v76 = v53;
      uint64_t v77 = v54;
      uint64_t v78 = v55;
      BOOL v79 = v49;
      unsigned __int8 v80 = v56;
      uint64_t v81 = v67;
      uint64_t v82 = v71;
      uint64_t v83 = 0;
      uint64_t v84 = 0;
      int v85 = 0;
      char v86 = 0;
      id v87 = v50;
      long long v88 = 0u;
      long long v89 = 0u;
      char v90 = 0;
      nullsub_2(v74);
      uint64_t v44 = (uint64_t)v69;
      sub_261562A0C((uint64_t)v69, (uint64_t)v91, (uint64_t *)&unk_26A921D90);
      uint64_t v45 = v74;
    }
    sub_261562A0C((uint64_t)v45, v44, (uint64_t *)&unk_26A921D90);
    sub_261562A70((uint64_t)v91, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);
    unint64_t v57 = (char *)v9[13];
    uint64_t v58 = swift_allocObject();
    swift_weakInit();
    uint64_t v59 = swift_allocObject();
    uint64_t v60 = v66;
    *(void *)(v59 + 16) = v58;
    *(void *)(v59 + 24) = v60;
    id v61 = (uint64_t (**)(void *))&v57[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    uint64_t v62 = *(void *)&v57[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    *id v61 = sub_261562984;
    v61[1] = (uint64_t (*)(void *))v59;
    os_log_type_t v63 = v57;
    swift_retain();
    sub_261547F20(v62);
    swift_release();

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_261544B2C();
    swift_allocError();
    *long long v40 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_26154B598(v16, (uint64_t *)&unk_26A921640);
    swift_release();
    swift_unknownObjectRelease();
    sub_261562A0C((uint64_t)v69, (uint64_t)v91, (uint64_t *)&unk_26A921D90);
    sub_261562A70((uint64_t)v91, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);

    swift_bridgeObjectRelease();
    type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator();
    swift_deallocPartialClassInstance();
  }
  return v9;
}

uint64_t sub_26155F134(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_261562A0C(result + 144, (uint64_t)v10, (uint64_t *)&unk_26A921D90);
    sub_261562A0C((uint64_t)v10, (uint64_t)v11, (uint64_t *)&unk_26A921D90);
    if (sub_2615629F0((uint64_t)v11) == 1)
    {
      if (qword_26A921638 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_261569610();
      __swift_project_value_buffer(v3, (uint64_t)qword_26A921D50);
      uint64_t v4 = sub_2615695F0();
      os_log_type_t v5 = sub_2615698B0();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_26153C000, v4, v5, "got a request to render, but have no non-snapshot state", v6, 2u);
        MEMORY[0x263E3AFE0](v6, -1, -1);
      }

      return swift_release();
    }
    else
    {
      v7[6] = v11[6];
      v7[7] = v11[7];
      char v8 = v12;
      v7[2] = v11[2];
      v7[3] = v11[3];
      v7[4] = v11[4];
      v7[5] = v11[5];
      v7[0] = v11[0];
      v7[1] = v11[1];
      sub_261562A0C((uint64_t)v10, (uint64_t)v9, (uint64_t *)&unk_26A921D90);
      sub_2615480E8((uint64_t)v9, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
      sub_2615612B0((uint64_t)v7, 0, a1);
      swift_release();
      return sub_261562A70((uint64_t)v10, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);
    }
  }
  return result;
}

uint64_t sub_26155F554(void *a1, void *a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v7 = v2 + 32;
  swift_beginAccess();
  sub_26155DE68(v2 + 32, (uint64_t)v80);
  uint64_t v8 = v81;
  sub_26154B598((uint64_t)v80, (uint64_t *)&unk_26A921640);
  if (!v8) {
    goto LABEL_6;
  }
  if (qword_26A921638 != -1) {
    goto LABEL_49;
  }
  while (1)
  {
    uint64_t v9 = sub_261569610();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A921D50);
    uint64_t v10 = sub_2615695F0();
    os_log_type_t v11 = sub_2615698B0();
    if (os_log_type_enabled(v10, v11))
    {
      char v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v12 = 0;
      _os_log_impl(&dword_26153C000, v10, v11, "renderer should be nil at this point — attaching multiple times?", v12, 2u);
      MEMORY[0x263E3AFE0](v12, -1, -1);
    }

LABEL_6:
    objc_msgSend(a1, sel_bounds);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v21 = objc_msgSend(a1, sel_window);
    if (!v21
      || (uint64_t v22 = v21, v23 = objc_msgSend(v21, sel_screen), v22, !v23))
    {
      id v23 = objc_msgSend(self, sel_mainScreen);
    }
    objc_msgSend(v23, sel_nativeScale);
    double v25 = v24;

    v84.origin.x = v14;
    v84.origin.y = v16;
    v84.size.width = v18;
    v84.size.height = v20;
    double v26 = ceil(v25 * CGRectGetWidth(v84));
    if ((~*(void *)&v26 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v26 <= -9.22337204e18) {
      goto LABEL_44;
    }
    if (v26 >= 9.22337204e18) {
      goto LABEL_45;
    }
    v85.origin.x = v14;
    v85.origin.y = v16;
    v85.size.width = v18;
    v85.size.height = v20;
    double v27 = ceil(v25 * CGRectGetHeight(v85));
    if ((~*(void *)&v27 & 0x7FF0000000000000) == 0) {
      goto LABEL_46;
    }
    if (v27 <= -9.22337204e18) {
      goto LABEL_47;
    }
    if (v27 < 9.22337204e18) {
      break;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    swift_once();
  }
  uint64_t v75 = v7;
  uint64_t v28 = (uint64_t)v26;
  uint64_t v29 = (uint64_t)v27;
  id v30 = *(void **)(v5 + 104);
  double v31 = (double)(uint64_t)v26;
  double v32 = (double)(uint64_t)v27;
  id v33 = objc_msgSend(v30, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setDrawableSize_, v31, v32);

  objc_msgSend(v30, sel_setBounds_, v14, v16, v18, v20);
  uint64_t v34 = *(void **)(v5 + 112);
  objc_msgSend(v34, sel_setBounds_, v14, v16, v18, v20);
  objc_msgSend(a1, sel_addSubview_, v30);
  id v35 = objc_msgSend(a1, sel_layer);
  objc_msgSend(v35, sel_addSublayer_, v34);

  uint64_t v36 = *(void *)(v5 + 16);
  uint64_t v37 = *(void *)(v5 + 24);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v37 + 32))(v80, v36, v37);
  uint64_t v76 = v28;
  uint64_t v83 = v29;
  if (LOBYTE(v80[0]) == 2)
  {
    *(void *)(v5 + 128) = 0;
  }
  else
  {
    uint64_t v73 = v37;
    uint64_t v74 = v36;
    char v38 = v80[0] & 1;
    id v39 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(a2, sel_setBackgroundColor_, v39);

    long long v40 = *(void **)(v5 + 88);
    swift_unknownObjectRetain();
    id v41 = objc_msgSend(v30, sel_layer);
    LOBYTE(v80[0]) = v38;
    uint64_t v42 = v83;
    type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager();
    swift_allocObject();
    uint64_t v43 = sub_2615547A8(v28, v42, v40, v41, (char *)v80, v18, v20);
    if (v3)
    {
      if (qword_26A921638 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_261569610();
      __swift_project_value_buffer(v44, (uint64_t)qword_26A921D50);
      id v45 = v3;
      id v46 = v3;
      double v47 = sub_2615695F0();
      os_log_type_t v48 = sub_2615698B0();
      if (os_log_type_enabled(v47, v48))
      {
        BOOL v49 = (uint8_t *)swift_slowAlloc();
        id v50 = (void *)swift_slowAlloc();
        *(_DWORD *)BOOL v49 = 138543362;
        id v51 = v3;
        uint64_t v52 = v5;
        uint64_t v53 = _swift_stdlib_bridgeErrorToNSError();
        v80[0] = v53;
        sub_261569960();
        *id v50 = v53;
        uint64_t v5 = v52;

        _os_log_impl(&dword_26153C000, v47, v48, "couldn’t set up floating layer: %{public}@", v49, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v50, -1, -1);
        MEMORY[0x263E3AFE0](v49, -1, -1);
      }
      else
      {
      }
      uint64_t v54 = 0;
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v54 = v43;
    }
    uint64_t v37 = v73;
    *(void *)(v5 + 128) = v54;
    swift_retain();
    swift_release();
    if (v54)
    {
      swift_retain();
      id v55 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v55, sel_addSublayer_, *(void *)(v54 + 16));
      swift_release();
    }
    unsigned __int8 v56 = *(void **)(v5 + 120);
    if (v56)
    {
      id v57 = v56;
      objc_msgSend(v57, sel_setBounds_, v14, v16, v18, v20);
      uint64_t v58 = v5;
      id v59 = objc_msgSend(v57, sel_mask);
      objc_msgSend(v59, sel_setBounds_, v14, v16, v18, v20);

      id v60 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v60, sel_addSublayer_, v57);

      uint64_t v5 = v58;
    }
    uint64_t v36 = v74;
  }
  id v78 = v4;
  swift_release();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v37 + 24))(v36, v37))
  {
    id v61 = objc_msgSend(*(id *)(v5 + 96), sel_commandBuffer);
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = v36;
      uint64_t v64 = (void *)sub_2615696D0();
      objc_msgSend(v62, sel_setLabel_, v64);

      goto LABEL_35;
    }
    sub_261544B2C();
    swift_allocError();
    *char v72 = 1;
    return swift_willThrow();
  }
  else
  {
    uint64_t v63 = v36;
    uint64_t v62 = 0;
LABEL_35:
    uint64_t v65 = *(void *)(v5 + 72);
    uint64_t v66 = v5;
    uint64_t v69 = v5 + 80;
    uint64_t v68 = *(void *)(v5 + 80);
    uint64_t v67 = *(void *)(v69 + 8);
    uint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))(v37 + 40);
    uint64_t v81 = v63;
    uint64_t v82 = v37;
    __swift_allocate_boxed_opaque_existential_1(v80);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v70(v67, v65, v68, v76, v83, v62, v63, v37);
    if (v78)
    {
      __swift_deallocate_boxed_opaque_existential_1((uint64_t)v80);
    }
    else
    {
      swift_beginAccess();
      sub_26156298C((uint64_t)v80, v75, (uint64_t *)&unk_26A921640);
      swift_endAccess();
      if (v62) {
        objc_msgSend(v62, sel_commit);
      }
      sub_261562A0C(v66 + 144, (uint64_t)v79, (uint64_t *)&unk_26A921D90);
      sub_261562A0C((uint64_t)v79, (uint64_t)v80, (uint64_t *)&unk_26A921D90);
      if (sub_2615629F0((uint64_t)v80) != 1)
      {
        *((unsigned char *)v30 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically) = 1;
        objc_msgSend(v30, sel_setNeedsDisplay);
      }
    }
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_26155FE98(void *a1, void *a2)
{
  char v113 = a2;
  uint64_t v3 = sub_261569610();
  uint64_t v112 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  os_log_type_t v111 = (char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  id v5 = objc_msgSend(a1, sel_contents);
  uint64_t v6 = (void *)sub_2615696D0();
  id v7 = objc_msgSend(v5, sel_objectForUserInfoKey_, v6);

  swift_unknownObjectRelease();
  if (v7)
  {
    sub_261569980();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v133 = 0u;
    long long v134 = 0u;
  }
  uint64_t v109 = v3;
  sub_261562A0C((uint64_t)&v133, (uint64_t)&v142, (uint64_t *)&unk_26A921DA0);
  if (*((void *)&v143 + 1))
  {
    if (swift_dynamicCast())
    {
      long long v8 = v124;
      if (v124 == *(_OWORD *)(v114 + 280) || (sub_261569B40() & 1) != 0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_26A921638 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v109, (uint64_t)qword_26A921D50);
        swift_bridgeObjectRetain_n();
        CGRect v84 = sub_2615695F0();
        os_log_type_t v85 = sub_2615698A0();
        int v86 = v85;
        if (os_log_type_enabled(v84, v85))
        {
          uint64_t v87 = swift_slowAlloc();
          LODWORD(v110) = v86;
          long long v88 = (uint8_t *)v87;
          id v108 = (id)swift_slowAlloc();
          *(void *)&long long v142 = v108;
          *(_DWORD *)long long v88 = 136446210;
          uint64_t v106 = v88 + 4;
          long long v89 = v88;
          swift_bridgeObjectRetain();
          *(void *)&long long v133 = sub_2615453FC(v8, *((unint64_t *)&v8 + 1), (uint64_t *)&v142);
          sub_261569960();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_26153C000, v84, (os_log_type_t)v110, "renderer got an update with a new look identifier %{public}s", v88, 0xCu);
          id v90 = v108;
          swift_arrayDestroy();
          MEMORY[0x263E3AFE0](v90, -1, -1);
          MEMORY[0x263E3AFE0](v89, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        *(_OWORD *)(v114 + 280) = v8;
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_26154B598((uint64_t)&v142, (uint64_t *)&unk_26A921DA0);
  }
  uint64_t v10 = *(void *)(v114 + 280);
  uint64_t v9 = *(void *)(v114 + 288);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = objc_msgSend(a1, sel_traitCollection);
  if (v11)
  {
    char v12 = v11;
    id v13 = objc_msgSend(v11, sel_userInterfaceStyle);

    BOOL v14 = v13 == (id)2;
  }
  else
  {
    BOOL v14 = 0;
  }
  id v15 = objc_msgSend(a1, sel_deviceOrientation);
  PRPosterRenderingEnvironment.unlockState.getter((uint64_t)&v124);
  char v16 = v124;
  uint64_t v17 = *((void *)&v124 + 1);
  PRPosterRenderingEnvironment.wakeState.getter((uint64_t)&v133);
  char v18 = v133;
  uint64_t v19 = *((void *)&v133 + 1);
  uint64_t v20 = v134;
  unsigned __int8 v21 = objc_msgSend(a1, sel_isSnapshot);
  swift_unknownObjectRelease();
  LOBYTE(v142) = v16;
  *((void *)&v142 + 1) = v17;
  LOBYTE(v143) = v18;
  *((void *)&v143 + 1) = v19;
  *(void *)&long long v144 = v20;
  BYTE8(v144) = v14;
  BYTE9(v144) = v21;
  *(void *)&long long v145 = v10;
  *((void *)&v145 + 1) = v9;
  *(void *)&long long v147 = 0;
  uint64_t v146 = 0;
  *(void *)((char *)&v147 + 5) = 0;
  uint64_t v110 = (uint64_t)v15;
  id v148 = v15;
  long long v149 = 0u;
  long long v150 = 0u;
  char v151 = 0;
  long long v153 = v142;
  long long v154 = v143;
  uint64_t v158 = *((void *)&v147 + 1);
  long long v156 = v145;
  long long v157 = 0u;
  long long v155 = v144;
  unsigned __int8 v152 = 0;
  if (v113)
  {
    uint64_t v22 = v113;
    objc_msgSend(v22, sel_duration);
    if (v23 > 0.0)
    {
      id v108 = v22;
      sub_261562A0C(v114 + 144, (uint64_t)&v124, (uint64_t *)&unk_26A921D90);
      sub_261562A0C((uint64_t)&v124, (uint64_t)&v133, (uint64_t *)&unk_26A921D90);
      if (sub_2615629F0((uint64_t)&v133) == 1)
      {
        LOBYTE(v116) = v16;
        *((void *)&v116 + 1) = v17;
        LOBYTE(v117) = v18;
        *((void *)&v117 + 1) = v19;
        *(void *)&long long v118 = v20;
        BYTE8(v118) = v14;
        BYTE9(v118) = v21;
        *(void *)&long long v119 = v10;
        *((void *)&v119 + 1) = v9;
        memset(v120, 0, 21);
        uint64_t v24 = v110;
        *((void *)&v120[1] + 1) = v110;
        long long v121 = 0u;
        long long v122 = 0u;
        unsigned __int8 v123 = 0;
        sub_2615480E8((uint64_t)&v142, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
        sub_2615480E8((uint64_t)&v116, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      }
      else
      {
        sub_261562A0C((uint64_t)&v124, (uint64_t)&v116, (uint64_t *)&unk_26A921D90);
        uint64_t v24 = *((void *)&v120[1] + 1);
        long long v30 = v121;
        long long v31 = v122;
        int v32 = v123;
        sub_2615480DC(*((uint64_t *)&v120[1] + 1), v121, *((void **)&v121 + 1), v122, *((uint64_t *)&v122 + 1), v123);
        if (v32 == 1)
        {
          sub_261548178(v24, v30, *((uint64_t *)&v30 + 1), v31, *((uint64_t *)&v31 + 1), 1);
          uint64_t v24 = v30;
        }
      }
      uint64_t v33 = v109;
      uint64_t v34 = v111;
      id v35 = objc_msgSend(a1, sel_deviceOrientation);
      uint64_t v36 = v112;
      if (v35 != (id)v24)
      {
        if (qword_26A921638 != -1) {
          swift_once();
        }
        uint64_t v77 = __swift_project_value_buffer(v33, (uint64_t)qword_26A921D50);
        (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v34, v77, v33);
        swift_unknownObjectRetain_n();
        id v78 = sub_2615695F0();
        LODWORD(v113) = sub_2615698A0();
        if (os_log_type_enabled(v78, (os_log_type_t)v113))
        {
          uint64_t v79 = swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          *(void *)&long long v116 = v80;
          *(_DWORD *)uint64_t v79 = 136315394;
          uint64_t v106 = (uint8_t *)v80;
          uint64_t v81 = 0xD000000000000014;
          unint64_t v82 = 0x800000026156CAD0;
          switch(v24)
          {
            case 1:
              unint64_t v82 = 0xE800000000000000;
              uint64_t v81 = 0x7469617274726F50;
              break;
            case 2:
              break;
            case 3:
              unint64_t v82 = 0xEF74686769522065;
              goto LABEL_70;
            case 4:
              unint64_t v82 = 0xEE007466654C2065;
LABEL_70:
              uint64_t v81 = 0x70616373646E614CLL;
              break;
            default:
              unint64_t v82 = 0x800000026156CAB0;
              uint64_t v81 = 0xD000000000000013;
              break;
          }
          v115[0] = sub_2615453FC(v81, v82, (uint64_t *)&v116);
          sub_261569960();
          swift_bridgeObjectRelease();
          *(_WORD *)(v79 + 12) = 2080;
          uint64_t v91 = 0xD000000000000014;
          unint64_t v92 = 0x800000026156CAD0;
          switch((unint64_t)objc_msgSend(a1, sel_deviceOrientation))
          {
            case 1uLL:
              unint64_t v92 = 0xE800000000000000;
              uint64_t v91 = 0x7469617274726F50;
              break;
            case 2uLL:
              break;
            case 3uLL:
              unint64_t v92 = 0xEF74686769522065;
              goto LABEL_76;
            case 4uLL:
              unint64_t v92 = 0xEE007466654C2065;
LABEL_76:
              uint64_t v91 = 0x70616373646E614CLL;
              break;
            default:
              unint64_t v92 = 0x800000026156CAB0;
              break;
          }
          v115[0] = sub_2615453FC(v91, v92, (uint64_t *)&v116);
          sub_261569960();
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_26153C000, v78, (os_log_type_t)v113, "🔄 renderer starting orientation transition %s → %s", (uint8_t *)v79, 0x16u);
          uint64_t v93 = v106;
          swift_arrayDestroy();
          MEMORY[0x263E3AFE0](v93, -1, -1);
          MEMORY[0x263E3AFE0](v79, -1, -1);

          (*(void (**)(char *, uint64_t))(v112 + 8))(v111, v109);
        }
        else
        {

          swift_unknownObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v34, v33);
        }
        os_log_type_t v111 = (char *)objc_msgSend(a1, sel_deviceOrientation);
        id v94 = v108;
        id v95 = objc_msgSend(v108, sel_timingFunction);
        if (!v95) {
          id v95 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB8]);
        }
        char v113 = v95;
        double Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v94, sel_delay);
        *(double *)&uint64_t v98 = Current + v97;
        objc_msgSend(v94, sel_duration);
        uint64_t v37 = v98;
        CGColorSpaceRef v100 = v99;
        objc_msgSend(v94, sel_delay);
        double v102 = v101;
        objc_msgSend(v94, sel_duration);
        sub_2615494C8(v102 + v103);
        id v29 = v100;

        char v38 = 0;
        LODWORD(v106) = 1;
        goto LABEL_27;
      }

LABEL_26:
      uint64_t v24 = 0;
      os_log_type_t v111 = 0;
      char v113 = 0;
      uint64_t v37 = 0;
      id v29 = 0;
      LODWORD(v106) = 255;
      char v38 = 1;
LABEL_27:
      unint64_t v39 = 0x265583000uLL;
      goto LABEL_28;
    }
  }
  sub_261562A0C(v114 + 144, (uint64_t)&v124, (uint64_t *)&unk_26A921D90);
  sub_261562A0C((uint64_t)&v124, (uint64_t)&v116, (uint64_t *)&unk_26A921D90);
  sub_261562A0C((uint64_t)&v124, (uint64_t)&v133, (uint64_t *)&unk_26A921D90);
  if (sub_2615629F0((uint64_t)&v133) == 1) {
    goto LABEL_26;
  }
  uint64_t v25 = *((void *)&v120[1] + 1);
  long long v26 = v121;
  long long v27 = v122;
  int v28 = v123;
  sub_261562A0C((uint64_t)&v116, (uint64_t)v115, (uint64_t *)&unk_26A921D90);
  uint64_t v112 = v25;
  sub_2615480DC(v25, v26, *((void **)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28);
  sub_261562A70((uint64_t)&v124, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_2615480DC);
  sub_261562A70((uint64_t)v115, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);
  if (v28 != 1) {
    goto LABEL_26;
  }
  id v29 = (id)*((void *)&v27 + 1);
  if (CFAbsoluteTimeGetCurrent() > *(double *)&v27 + *((double *)&v27 + 1))
  {
    sub_261548178(v112, v26, *((uint64_t *)&v26 + 1), v27, *((uint64_t *)&v27 + 1), 1);
    goto LABEL_26;
  }
  char v113 = (void *)*((void *)&v26 + 1);
  os_log_type_t v111 = (char *)v26;
  char v38 = 0;
  LODWORD(v106) = 1;
  unint64_t v39 = 0x265583000;
  uint64_t v37 = v27;
  uint64_t v24 = v112;
LABEL_28:
  unsigned int v40 = [a1 *(SEL *)(v39 + 2304)];
  id v41 = *(unsigned char **)(v114 + 104);
  uint64_t v42 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically;
  int v43 = v41[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically];
  id v108 = v29;
  uint64_t v112 = v24;
  if (v40)
  {
    if (v43)
    {
      if (qword_26A921638 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v109, (uint64_t)qword_26A921D50);
      uint64_t v44 = sub_2615695F0();
      os_log_type_t v45 = sub_2615698A0();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = v37;
        double v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v47 = 0;
        _os_log_impl(&dword_26153C000, v44, v45, "⏸️ disabling automatic drawing", v47, 2u);
        os_log_type_t v48 = v47;
        uint64_t v37 = v46;
        MEMORY[0x263E3AFE0](v48, -1, -1);
      }

      uint64_t v24 = v112;
    }
    v41[v42] = 0;
    long long v135 = v155;
    long long v136 = v156;
    long long v137 = v157;
    long long v133 = v153;
    long long v134 = v154;
    *(void *)&long long v138 = v158;
    uint64_t v49 = v110;
    *((void *)&v138 + 1) = v110;
    long long v139 = 0u;
    long long v140 = 0u;
    unsigned __int8 v141 = v152;
    long long v130 = 0u;
    long long v131 = 0u;
    unsigned __int8 v132 = v152;
    long long v126 = v155;
    long long v127 = v156;
    long long v128 = v157;
    long long v129 = v138;
    long long v124 = v153;
    long long v125 = v154;
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    id v50 = v107;
    sub_2615612B0((uint64_t)&v124, 1, 0);
    if (v50)
    {
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      id v51 = v113;
      if (qword_26A921638 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v109, (uint64_t)qword_26A921D50);
      id v52 = v50;
      id v53 = v50;
      uint64_t v54 = sub_2615695F0();
      os_log_type_t v55 = sub_2615698B0();
      if (os_log_type_enabled(v54, v55))
      {
        unsigned __int8 v56 = (uint8_t *)swift_slowAlloc();
        id v57 = (void *)swift_slowAlloc();
        uint64_t v105 = v37;
        *(_DWORD *)unsigned __int8 v56 = 138412290;
        char v113 = v51;
        id v58 = v50;
        uint64_t v59 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)&long long v124 = v59;
        sub_261569960();
        *id v57 = v59;

        _os_log_impl(&dword_26153C000, v54, v55, "failed to render for snapshot: %@", v56, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v57, -1, -1);
        MEMORY[0x263E3AFE0](v56, -1, -1);

        sub_261548184(v112, (uint64_t)v111, (uint64_t)v113, v105, (uint64_t)v108, v106);
      }
      else
      {
        sub_261548184(v24, (uint64_t)v111, (uint64_t)v51, v37, (uint64_t)v108, v106);
      }
      uint64_t v76 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v49 = v110;
    }
    else
    {
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_261548184(v24, (uint64_t)v111, (uint64_t)v113, v37, (uint64_t)v108, v106);
      uint64_t v76 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
    }
  }
  else
  {
    if ((v43 & 1) == 0)
    {
      if (qword_26A921638 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v109, (uint64_t)qword_26A921D50);
      id v60 = sub_2615695F0();
      os_log_type_t v61 = sub_2615698A0();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = v37;
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v63 = 0;
        _os_log_impl(&dword_26153C000, v60, v61, "▶️ reenabling automatic drawing", v63, 2u);
        uint64_t v64 = v63;
        uint64_t v37 = v62;
        MEMORY[0x263E3AFE0](v64, -1, -1);
      }

      uint64_t v24 = v112;
      id v29 = v108;
    }
    v41[v42] = 1;
    id v104 = v41;
    uint64_t v105 = v37;
    if (v38)
    {
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v49 = v110;
    }
    else
    {
      uint64_t v69 = (uint64_t)v29;
      char v70 = v152;
      uint64_t v71 = v24;
      char v72 = v111;
      uint64_t v49 = v24;
      uint64_t v73 = v113;
      sub_2615480DC(v71, (uint64_t)v111, v113, v37, v69, 1);
      sub_261548178(v110, 0, 0, 0, 0, v70);
      unsigned __int8 v152 = 1;
      os_log_type_t v111 = v72;
      uint64_t v65 = v72;
      char v113 = v73;
      uint64_t v66 = v73;
      uint64_t v67 = v37;
      uint64_t v68 = v69;
    }
    long long v118 = v155;
    long long v119 = v156;
    v120[0] = v157;
    long long v116 = v153;
    long long v117 = v154;
    *(void *)&v120[1] = v158;
    *((void *)&v120[1] + 1) = v49;
    *(void *)&long long v121 = v65;
    *((void *)&v121 + 1) = v66;
    *(void *)&long long v122 = v67;
    *((void *)&v122 + 1) = v68;
    unsigned __int8 v123 = v152;
    unsigned __int8 v132 = v152;
    long long v130 = v121;
    long long v131 = v122;
    long long v128 = v157;
    long long v129 = v120[1];
    long long v126 = v155;
    long long v127 = v156;
    long long v124 = v153;
    long long v125 = v154;
    uint64_t v74 = v65;
    nullsub_2(&v124);
    uint64_t v75 = v114 + 144;
    sub_261562A0C(v114 + 144, (uint64_t)&v133, (uint64_t *)&unk_26A921D90);
    sub_261562A0C((uint64_t)&v124, v75, (uint64_t *)&unk_26A921D90);
    sub_2615480E8((uint64_t)&v116, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_261562A70((uint64_t)&v133, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);
    objc_msgSend(v104, sel_setNeedsDisplay);
    sub_261548184(v112, (uint64_t)v111, (uint64_t)v113, v105, (uint64_t)v108, v106);
    uint64_t v76 = v74;
  }
  long long v135 = v155;
  long long v136 = v156;
  long long v137 = v157;
  long long v133 = v153;
  long long v134 = v154;
  *(void *)&long long v138 = v158;
  *((void *)&v138 + 1) = v49;
  *(void *)&long long v139 = v76;
  *((void *)&v139 + 1) = v66;
  *(void *)&long long v140 = v67;
  *((void *)&v140 + 1) = v68;
  unsigned __int8 v141 = v152;
  return sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
}

uint64_t sub_2615611CC(uint64_t a1, unint64_t a2)
{
  type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken();
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_261563E00(v2, a1, a2);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_261563AB4(&v7, a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  *(unsigned char *)(*(void *)(v2 + 104)
           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) = 1;
  sub_26154A098();
  return v5;
}

void sub_2615612B0(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = v3;
  LODWORD(v7) = a2;
  uint64_t v9 = sub_261569610();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = *(_OWORD *)(a1 + 112);
  long long v139 = *(_OWORD *)(a1 + 96);
  long long v140 = v13;
  char v141 = *(unsigned char *)(a1 + 128);
  long long v14 = *(_OWORD *)(a1 + 48);
  long long v135 = *(_OWORD *)(a1 + 32);
  long long v136 = v14;
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v137 = *(_OWORD *)(a1 + 64);
  long long v138 = v15;
  long long v16 = *(_OWORD *)(a1 + 16);
  long long v133 = *(_OWORD *)a1;
  long long v134 = v16;
  swift_beginAccess();
  sub_26155DE68((uint64_t)(v5 + 4), (uint64_t)&v121);
  if (*((void *)&v122 + 1))
  {
    long long v142 = v4;
    sub_261548858(&v121, (uint64_t)v130);
    if (qword_26A921638 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v9, (uint64_t)qword_26A921D50);
    char v18 = *(void (**)(char *))(v10 + 16);
    uint64_t v115 = v17;
    v18(v12);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_26154809C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2615480DC);
    id v116 = v12;
    uint64_t v19 = sub_2615695F0();
    os_log_type_t v20 = sub_2615698A0();
    int v21 = v20;
    BOOL v22 = os_log_type_enabled(v19, v20);
    long long v118 = v5;
    LODWORD(v114) = v7;
    if (v22)
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v112 = v10;
      uint64_t v24 = v23;
      uint64_t v111 = swift_slowAlloc();
      uint64_t v119 = v111;
      *(_DWORD *)uint64_t v24 = 136447234;
      v108[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921E80);
      uint64_t v25 = swift_allocObject();
      long long v117 = a3;
      uint64_t v26 = v25;
      long long v113 = xmmword_26156B4E0;
      *(_OWORD *)(v25 + 16) = xmmword_26156B4E0;
      uint64_t v27 = *((void *)&v133 + 1);
      *(void *)(v25 + 56) = MEMORY[0x263F8EF38];
      unint64_t v7 = sub_2615643FC();
      *(void *)(v26 + 64) = v7;
      *(void *)(v26 + 32) = v27;
      uint64_t v28 = sub_261569710();
      *(void *)&long long v121 = sub_2615453FC(v28, v29, &v119);
      sub_261569960();
      swift_bridgeObjectRelease();
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      *(_WORD *)(v24 + 12) = 2080;
      if (BYTE8(v135)) {
        uint64_t v30 = 5457241;
      }
      else {
        uint64_t v30 = 20302;
      }
      int v110 = v21;
      if (BYTE8(v135)) {
        unint64_t v31 = 0xE300000000000000;
      }
      else {
        unint64_t v31 = 0xE200000000000000;
      }
      os_log_t v109 = v19;
      *(void *)&long long v121 = sub_2615453FC(v30, v31, &v119);
      sub_261569960();
      swift_bridgeObjectRelease();
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      *(_WORD *)(v24 + 22) = 2082;
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = v113;
      uint64_t v33 = *((void *)&v134 + 1);
      *(void *)(v32 + 56) = MEMORY[0x263F8EF38];
      *(void *)(v32 + 64) = v7;
      *(void *)(v32 + 32) = v33;
      uint64_t v34 = sub_261569710();
      *(void *)&long long v121 = sub_2615453FC(v34, v35, &v119);
      sub_261569960();
      swift_bridgeObjectRelease();
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      *(_WORD *)(v24 + 32) = 2080;
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = v113;
      long long v127 = v139;
      long long v128 = v140;
      char v129 = v141;
      long long v123 = v135;
      long long v124 = v136;
      long long v125 = v137;
      long long v126 = v138;
      long long v121 = v133;
      long long v122 = v134;
      WallpaperMetalCoordination.WallpaperState.rotationLandscapeAmount.getter();
      uint64_t v37 = MEMORY[0x263F8D648];
      *(void *)(v36 + 56) = MEMORY[0x263F8D5C8];
      *(void *)(v36 + 64) = v37;
      *(_DWORD *)(v36 + 32) = v38;
      uint64_t v39 = sub_261569710();
      *(void *)&long long v121 = sub_2615453FC(v39, v40, &v119);
      uint64_t v5 = v118;
      LOBYTE(v7) = (_BYTE)v114;
      sub_261569960();
      swift_bridgeObjectRelease();
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      a3 = v117;
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      *(_WORD *)(v24 + 42) = 2082;
      if (v7) {
        uint64_t v41 = 5457241;
      }
      else {
        uint64_t v41 = 20302;
      }
      if (v7) {
        unint64_t v42 = 0xE300000000000000;
      }
      else {
        unint64_t v42 = 0xE200000000000000;
      }
      *(void *)&long long v121 = sub_2615453FC(v41, v42, &v119);
      int v43 = v142;
      sub_261569960();
      swift_bridgeObjectRelease();
      os_log_t v44 = v109;
      _os_log_impl(&dword_26153C000, v109, (os_log_type_t)v110, "rendering state [unlock %{public}s, dark %s, dim %{public}s, land %s], is snapshot %{public}s", (uint8_t *)v24, 0x34u);
      uint64_t v45 = v111;
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v45, -1, -1);
      MEMORY[0x263E3AFE0](v24, -1, -1);

      (*(void (**)(id, uint64_t))(v112 + 8))(v116, v9);
      if ((v7 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);
      sub_2615480E8((uint64_t)&v133, (void (*)(void, void, void, void, void, void))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261548178);

      (*(void (**)(id, uint64_t))(v10 + 8))(v116, v9);
      int v43 = v142;
      if ((v7 & 1) == 0)
      {
LABEL_18:
        if (!a3)
        {
          id v60 = sub_2615695F0();
          os_log_type_t v61 = sub_2615698B0();
          if (os_log_type_enabled(v60, v61))
          {
            uint64_t v62 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v62 = 0;
            _os_log_impl(&dword_26153C000, v60, v61, "no drawable available", v62, 2u);
            MEMORY[0x263E3AFE0](v62, -1, -1);
          }
          goto LABEL_75;
        }
        id v46 = objc_msgSend((id)swift_unknownObjectRetain(), sel_texture);
        goto LABEL_30;
      }
    }
    id v46 = (id)v5[17];
    if (v46)
    {
      swift_unknownObjectRetain();
      id v50 = sub_2615695F0();
      os_log_type_t v51 = sub_2615698A0();
      if (os_log_type_enabled(v50, v51))
      {
        id v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v52 = 0;
        _os_log_impl(&dword_26153C000, v50, v51, "reusing existing snapshot texture", v52, 2u);
        MEMORY[0x263E3AFE0](v52, -1, -1);
      }

      a3 = 0;
      goto LABEL_30;
    }
    char v63 = v7;
    uint64_t v64 = sub_2615695F0();
    os_log_type_t v65 = sub_2615698A0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl(&dword_26153C000, v64, v65, "making new snapshot texture", v66, 2u);
      MEMORY[0x263E3AFE0](v66, -1, -1);
    }

    uint64_t v67 = (void *)v118[13];
    id v68 = objc_msgSend(v67, sel_layer);
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_drawableSize);
    double v70 = v69;

    if ((~*(void *)&v70 & 0x7FF0000000000000) != 0)
    {
      if (v70 > -9.22337204e18)
      {
        if (v70 < 9.22337204e18)
        {
          id v71 = objc_msgSend(v67, sel_layer);
          self;
          objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_drawableSize);
          double v73 = v72;

          if ((~*(void *)&v73 & 0x7FF0000000000000) != 0)
          {
            if (v73 > -9.22337204e18)
            {
              uint64_t v5 = v118;
              if (v73 < 9.22337204e18)
              {
                uint64_t v74 = (void *)v118[11];
                uint64_t v75 = (*(uint64_t (**)(void))(v118[3] + 8))();
                uint64_t v76 = sub_2615641AC((uint64_t)v70, (uint64_t)v73, v74, v75);
                if (v43) {
                  goto LABEL_76;
                }
                uint64_t v77 = v76;
                v5[17] = v76;
                swift_unknownObjectRetain();
                swift_unknownObjectRelease();
                a3 = 0;
                LOBYTE(v7) = v63;
                id v46 = v77;
LABEL_30:
                id v53 = objc_msgSend((id)v5[12], sel_commandBuffer);
                if (v53)
                {
                  id v116 = v53;
                  long long v117 = a3;
                  uint64_t v54 = v5[16];
                  long long v142 = v43;
                  if (v54)
                  {
                    if ((*(unsigned char *)(v54 + 48) & 1) == 0)
                    {
                      id v58 = v46;
                      id v57 = (void *)sub_261554B48();
                      *(void *)&long long v113 = v78;
                      int v79 = 0;
LABEL_59:
                      uint64_t v84 = v131;
                      uint64_t v85 = v132;
                      __swift_project_boxed_opaque_existential_1(v130, v131);
                      long long v127 = v139;
                      long long v128 = v140;
                      char v129 = v141;
                      long long v123 = v135;
                      long long v124 = v136;
                      long long v125 = v137;
                      long long v126 = v138;
                      long long v121 = v133;
                      long long v122 = v134;
                      uint64_t v119 = (uint64_t)v57;
                      char v120 = v79;
                      int v86 = *(void (**)(long long *, id, uint64_t *, id, uint64_t, uint64_t))(v85 + 48);
                      sub_261564164(v57, v79);
                      uint64_t v87 = v142;
                      v86(&v121, v58, &v119, v116, v84, v85);
                      if (v87)
                      {
                        sub_261564188(v57, v79);
                        objc_msgSend(v116, sel_commit);
                        sub_261544B2C();
                        swift_allocError();
                        *long long v88 = 2;
                        swift_willThrow();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();

                        sub_261564188(v57, v79);
                        swift_unknownObjectRelease();
                        goto LABEL_76;
                      }
                      LODWORD(v142) = v79;
                      sub_261564188(v57, v79);
                      id v89 = v116;
                      objc_msgSend(v116, sel_commit);
                      id v90 = v117;
                      if (v114)
                      {
                        objc_msgSend(v89, sel_waitUntilCompleted);
                        uint64_t v91 = (void *)v118[14];
                        unint64_t v92 = (void *)v118[17];
                        if (v92 && (id v93 = objc_msgSend(v92, sel_iosurface)) != 0)
                        {
                          *(void *)&long long v121 = v93;
                          type metadata accessor for IOSurfaceRef(0);
                          uint64_t v94 = sub_261569B30();
                        }
                        else
                        {
                          uint64_t v94 = 0;
                        }
                        objc_msgSend(v91, sel_setContents_, v94);
                        swift_unknownObjectRelease();
                        objc_msgSend(v91, sel_setHidden_, 0);
                        double v103 = (void *)v118[15];
                        if (v103)
                        {
                          id v104 = v103;
                          id v105 = objc_msgSend(v91, sel_contents);
                          if (v105)
                          {
                            sub_261569980();
                            swift_unknownObjectRelease();
                            __swift_project_boxed_opaque_existential_1(&v121, *((uint64_t *)&v122 + 1));
                            id v105 = (id)sub_261569B30();
                            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v121);
                          }
                          objc_msgSend(v104, sel_setContents_, v105);
                          swift_unknownObjectRelease();
                          objc_msgSend(v104, sel_setHidden_, 0);
                          id v106 = objc_msgSend(v104, sel_mask);
                          id v107 = (id)v113;
                          objc_msgSend(v106, sel_setContents_, v107);

                          swift_unknownObjectRelease();
                          swift_unknownObjectRelease();
                          sub_261564188(v57, v142);
                          swift_unknownObjectRelease();
                        }
                        else
                        {
                          swift_unknownObjectRelease();
                          swift_unknownObjectRelease();

                          sub_261564188(v57, v142);
                          swift_unknownObjectRelease();
                        }
                        goto LABEL_76;
                      }
                      uint64_t v114 = v57;
                      objc_msgSend(v89, sel_waitUntilScheduled);
                      if (v90) {
                        objc_msgSend(v90, sel_present);
                      }
                      id v95 = (void *)v113;
                      if ((void)v113)
                      {
                        uint64_t v96 = v118[16];
                        if (v96) {
                          objc_msgSend(*(id *)(v96 + 24), sel_setContents_, (void)v113);
                        }
                      }
                      if (v118[17])
                      {
                        double v97 = sub_2615695F0();
                        os_log_type_t v98 = sub_2615698A0();
                        if (os_log_type_enabled(v97, v98))
                        {
                          size_t v99 = (uint8_t *)swift_slowAlloc();
                          *(_WORD *)size_t v99 = 0;
                          _os_log_impl(&dword_26153C000, v97, v98, "discarding snapshot resources", v99, 2u);
                          MEMORY[0x263E3AFE0](v99, -1, -1);
                        }
                      }
                      CGColorSpaceRef v100 = v118;
                      v118[17] = 0;
                      swift_unknownObjectRelease();
                      double v101 = (void *)v100[14];
                      objc_msgSend(v101, sel_setContents_, 0);
                      objc_msgSend(v101, sel_setHidden_, 1);
                      id v60 = (id)v100[15];
                      [v60 setContents:0];
                      id v102 = [v60 mask];
                      objc_msgSend(v102, sel_setContents_, 0);

                      [v60 setHidden:1];
                      swift_unknownObjectRelease();
                      swift_unknownObjectRelease();

                      sub_261564188(v114, v142);
                      swift_unknownObjectRelease();
LABEL_75:

                      goto LABEL_76;
                    }
                    if ((v7 & 1) == 0)
                    {
                      id v58 = v46;
                      id v57 = *(void **)(v54 + 24);
                      id v80 = v57;
                      goto LABEL_53;
                    }
                    os_log_type_t v55 = (void *)v5[15];
                    if (v55)
                    {
                      swift_retain();
                      id v56 = objc_msgSend(v55, sel_mask);
                      if (v56)
                      {
                        id v57 = v56;
                        id v58 = v46;
                        swift_release();
LABEL_53:
                        *(void *)&long long v113 = 0;
                        int v79 = 1;
                        goto LABEL_59;
                      }
                    }
                    else
                    {
                      swift_retain();
                    }
                    id v58 = v46;
                    uint64_t v81 = sub_2615695F0();
                    os_log_type_t v82 = sub_2615698B0();
                    if (os_log_type_enabled(v81, v82))
                    {
                      uint64_t v83 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)uint64_t v83 = 0;
                      _os_log_impl(&dword_26153C000, v81, v82, "🚨 couldn’t find mask layer when creating snapshot! time occlusion may be wrong", v83, 2u);
                      MEMORY[0x263E3AFE0](v83, -1, -1);
                    }
                    swift_release();
                  }
                  else
                  {
                    id v58 = v46;
                  }
                  *(void *)&long long v113 = 0;
                  id v57 = 0;
                  int v79 = 255;
                  goto LABEL_59;
                }
                sub_261544B2C();
                swift_allocError();
                *uint64_t v59 = 2;
                swift_willThrow();
                swift_unknownObjectRelease();
                swift_unknownObjectRelease();
LABEL_76:
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v130);
                return;
              }
              goto LABEL_88;
            }
LABEL_87:
            __break(1u);
LABEL_88:
            __break(1u);
            return;
          }
LABEL_86:
          __break(1u);
          goto LABEL_87;
        }
LABEL_85:
        __break(1u);
        goto LABEL_86;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_85;
  }
  sub_26154B598((uint64_t)&v121, (uint64_t *)&unk_26A921640);
  if (qword_26A921638 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v9, (uint64_t)qword_26A921D50);
  double v47 = sub_2615695F0();
  os_log_type_t v48 = sub_2615698B0();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_26153C000, v47, v48, "got a rendering environment update before our renderer is set up", v49, 2u);
    MEMORY[0x263E3AFE0](v49, -1, -1);
  }
}

void sub_26156241C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + 312;
  swift_beginAccess();
  uint64_t v7 = *(void *)(*(void *)(v3 + 312) + 16);
  swift_beginAccess();
  sub_261562CD4(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (!*(void *)(*(void *)v6 + 16))
    {
      *(unsigned char *)(*(void *)(v3 + 104)
               + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) = 0;
      sub_26154A098();
    }
  }
}

id *WallpaperMetalCoordination.RenderingCoordinator.deinit()
{
  sub_26154B598((uint64_t)(v0 + 4), (uint64_t *)&unk_26A921640);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
  sub_261562A0C((uint64_t)(v0 + 18), (uint64_t)v2, (uint64_t *)&unk_26A921D90);
  sub_261562A70((uint64_t)v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_261544BF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_261548178);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.__deallocating_deinit()
{
  WallpaperMetalCoordination.RenderingCoordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2615625E0(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_261562618(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_261562640(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_26156271C;
  return v6(a1);
}

uint64_t sub_26156271C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_261562814(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_261569960();
  *a1 = v7;
  long long v8 = *a2;
  if (*a2)
  {
    *long long v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

double sub_2615628CC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 2;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

uint64_t type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator()
{
  return self;
}

uint64_t sub_261562914()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26156294C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_261562984(void *a1)
{
  return sub_26155F134(a1);
}

uint64_t sub_26156298C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2615629F0(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_261562A0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_261562A70(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  return a1;
}

void sub_261562AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, void (*a18)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t), void (*a19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  if (a6 != 2)
  {
    a18(a7, a8, a9, a10, a11, HIDWORD(a11) & 1);
    a19(a12, a13, a14, a15, a16, a17 & 1);
  }
}

uint64_t type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken()
{
  return self;
}

uint64_t sub_261562BAC(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_261569BD0();
  sub_261569BE0();
  uint64_t v4 = sub_261569BF0();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(void *)(v7 + 8 * v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)(v7 + 8 * v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v13 = *v1;
  *unsigned int v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_261562E64();
    uint64_t v10 = v13;
  }
  uint64_t v11 = *(void *)(*(void *)(v10 + 48) + 8 * v6);
  sub_261563740(v6);
  *unsigned int v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_261562CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_261569BD0();
  swift_bridgeObjectRetain();
  sub_261569730();
  uint64_t v6 = sub_261569BF0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_261569B40() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      long long v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_261569B40() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_261562FFC();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_2615638EC(v8);
  uint64_t *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

void *sub_261562E64()
{
  unsigned int v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921760);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2615699B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    double result = (void *)swift_release();
    *unsigned int v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_261562FFC()
{
  unsigned int v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921E70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2615699B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    double result = (void *)swift_release();
    *unsigned int v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    double result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2615631B0()
{
  unsigned int v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921E70);
  uint64_t v3 = sub_2615699C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unsigned int v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_261569BD0();
    swift_bridgeObjectRetain();
    sub_261569730();
    uint64_t result = sub_261569BF0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unsigned int v1 = v0;
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

uint64_t sub_261563460()
{
  unsigned int v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921E70);
  uint64_t v3 = sub_2615699C0();
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
                unsigned int v1 = v0;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_261569BD0();
      sub_261569730();
      uint64_t result = sub_261569BF0();
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unsigned int v1 = v4;
  return result;
}

unint64_t sub_261563740(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2615699A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_261569BD0();
        sub_261569BE0();
        unint64_t v10 = sub_261569BF0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          unint64_t v12 = (void *)(v11 + 8 * v2);
          int64_t v13 = (void *)(v11 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *unint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_2615638EC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2615699A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_261569BD0();
        swift_bridgeObjectRetain();
        sub_261569730();
        uint64_t v10 = sub_261569BF0();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_261563AB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_261569BD0();
  swift_bridgeObjectRetain();
  sub_261569730();
  uint64_t v8 = sub_261569BF0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_261569B40() & 1) != 0)
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
      int64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_261569B40() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_261563C64(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_261563C64(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_261563460();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_261562FFC();
      goto LABEL_22;
    }
    sub_2615631B0();
  }
  uint64_t v11 = *v4;
  sub_261569BD0();
  sub_261569730();
  uint64_t result = sub_261569BF0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_261569B40(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_261569B60();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_261569B40();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

uint64_t sub_261563E00(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  swift_weakInit();
  if (qword_26A921638 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_261569610();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A921D50);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_2615695F0();
  os_log_type_t v9 = sub_2615698A0();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)unint64_t v10 = 136446210;
    swift_bridgeObjectRetain();
    sub_2615453FC(a2, a3, &v13);
    sub_261569960();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_26153C000, v8, v9, "ContinuousRenderingToken “%{public}s“ init", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v11, -1, -1);
    MEMORY[0x263E3AFE0](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  swift_weakAssign();
  *(unsigned char *)(v4 + 24) = 0;
  return v4;
}

uint64_t sub_261563FE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 32;
  swift_beginAccess();
  return sub_26155DE68(v3, a2);
}

uint64_t method lookup function for WallpaperMetalCoordination.RenderingCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WallpaperMetalCoordination.RenderingCoordinator);
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.renderer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.__allocating_init(identifier:rendering:environment:lookIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.attachToViews(background:floating:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.handleRenderingEnvironmentUpdate(_:animationSettings:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.startContinuousRendering(reason:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t method lookup function for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken);
}

id sub_261564164(id result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_26156417C(result, a2 & 1);
  }
  return result;
}

id sub_26156417C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_unknownObjectRetain();
  }
}

void sub_261564188(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_2615641A0(a1, a2 & 1);
  }
}

void sub_2615641A0(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_unknownObjectRelease();
  }
}

void *sub_2615641AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A921E90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26156B1B0;
  os_log_type_t v9 = (void *)*MEMORY[0x263F0EF50];
  uint64_t v10 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F0EF50];
  *(void *)(inited + 40) = a1;
  uint64_t v11 = (void *)*MEMORY[0x263F0EDF8];
  *(void *)(inited + 64) = v10;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = a2;
  uint64_t v12 = (void *)*MEMORY[0x263F0ED48];
  *(void *)(inited + 104) = v10;
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 120) = 4;
  uint64_t v13 = (void *)*MEMORY[0x263F0EE48];
  *(void *)(inited + 144) = v10;
  *(void *)(inited + 152) = v13;
  *(void *)(inited + 184) = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 160) = 1111970369;
  id v14 = v9;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  sub_26153EE8C(inited);
  type metadata accessor for CFString(0);
  sub_261564450();
  CFDictionaryRef v18 = (const __CFDictionary *)sub_261569660();
  swift_bridgeObjectRelease();
  IOSurfaceRef v19 = IOSurfaceCreate(v18);

  if (v19)
  {
    uint64_t v20 = self;
    uint64_t v21 = v19;
    id v22 = objc_msgSend(v20, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, a4, a1, a2, 0);
    objc_msgSend(v22, sel_setUsage_, 4);
    id v23 = objc_msgSend(a3, sel_newTextureWithDescriptor_iosurface_plane_, v22, v21, 0);
    if (v23)
    {
      a3 = v23;
    }
    else
    {
      sub_261544B2C();
      swift_allocError();
      unsigned char *v25 = 3;
      swift_willThrow();
    }
  }
  else
  {
    sub_261544B2C();
    swift_allocError();
    *uint64_t v24 = 3;
    swift_willThrow();
  }
  return a3;
}

unint64_t sub_2615643FC()
{
  unint64_t result = qword_26A921E88;
  if (!qword_26A921E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921E88);
  }
  return result;
}

unint64_t sub_261564450()
{
  unint64_t result = qword_26A921838;
  if (!qword_26A921838)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921838);
  }
  return result;
}

uint64_t sub_2615644A8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2615644E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_26155E640;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A921EA0 + dword_26A921EA0);
  return v6(a1, v4);
}

BOOL static UnlockState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

void static UnlockState.locked.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

uint64_t UnlockState.ScreenState.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t UnlockState.ScreenState.hashValue.getter()
{
  return sub_261569BF0();
}

void UnlockState.screenState.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

double UnlockState.progress.getter()
{
  return *(double *)(v0 + 8);
}

double UnlockState.lockProgress.getter()
{
  return 1.0 - *(double *)(v0 + 8);
}

BOOL UnlockState.isTransitioning.getter()
{
  double v1 = *(double *)(v0 + 8);
  BOOL v3 = v1 > 0.01 && *(unsigned char *)v0 == 2;
  return v1 < 0.99 && v3;
}

BOOL static UnlockState.ScreenState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL UnlockState.isLocked.getter()
{
  return *v0 == 0;
}

BOOL UnlockState.isNotLocked.getter()
{
  return *v0 != 0;
}

BOOL UnlockState.isUnlocked.getter()
{
  return *v0 == 1;
}

BOOL UnlockState.isNotUnlocked.getter()
{
  return *v0 != 1;
}

uint64_t UnlockState.description.getter()
{
  sub_2615699E0();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "screenState:");
  sub_261569760();
  swift_bridgeObjectRelease();
  sub_261569760();
  sub_261569870();
  sub_261569760();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t UnlockState.ScreenState.description.getter()
{
  return *(void *)&aLocked_0[8 * *v0];
}

unint64_t sub_2615647FC()
{
  unint64_t result = qword_26A921EB0;
  if (!qword_26A921EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921EB0);
  }
  return result;
}

BOOL sub_261564850(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

uint64_t getEnumTagSinglePayload for UnlockState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UnlockState(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for UnlockState()
{
  return &type metadata for UnlockState;
}

uint64_t getEnumTagSinglePayload for UnlockState.ScreenState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UnlockState.ScreenState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261564A6CLL);
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

ValueMetadata *type metadata accessor for UnlockState.ScreenState()
{
  return &type metadata for UnlockState.ScreenState;
}

BOOL static TransitionDirection.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TransitionDirection.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t TransitionDirection.hashValue.getter()
{
  return sub_261569BF0();
}

uint64_t StateTransition.previous.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t StateTransition.current.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t StateTransition.init(previous:current:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  os_log_type_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);
  v9(a3 - 8, a4, a1);
  uint64_t v7 = a4 + *(int *)(type metadata accessor for StateTransition() + 28);
  return v9(v7, a2, a3);
}

uint64_t type metadata accessor for StateTransition()
{
  return __swift_instantiateGenericMetadata();
}

void StateTransition<A>.transitionDirection.getter(char *a1@<X8>)
{
  double v2 = *(double *)(v1 + 8);
  double v3 = *(double *)(v1 + 32);
  char v4 = 2 * (v2 >= v3);
  if (v3 < v2) {
    char v4 = 1;
  }
  *a1 = v4;
}

unint64_t sub_261564C80()
{
  unint64_t result = qword_26A921EB8[0];
  if (!qword_26A921EB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A921EB8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TransitionDirection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261564DA0);
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

ValueMetadata *type metadata accessor for TransitionDirection()
{
  return &type metadata for TransitionDirection;
}

uint64_t sub_261564DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_261564DE0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_261564E70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    uint64_t *v4 = *a2;
    unsigned int v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    id v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, v5);
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t sub_261564F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8) + 8;
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))v6;
  (*(void (**)(uint64_t, uint64_t))v6)(a1, v3);
  unint64_t v4 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v6 + 72)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 72);
  return v7(v4, v3);
}

unint64_t sub_261565018(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), (*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), v5);
  return a1;
}

unint64_t sub_2615650AC(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = v6 + 24;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), (*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), v5);
  return a1;
}

unint64_t sub_261565140(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), (*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), v5);
  return a1;
}

unint64_t sub_2615651D4(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  uint64_t v8 = v6 + 40;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), v5);
  return a1;
}

uint64_t sub_261565268(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v8 = ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v6;
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void sub_2615653D4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x2615655FCLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        id v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.isEnabled.getter()
{
  char v1 = *v0;
  unsigned int v5 = &type metadata for WatchFacesWallpaperSupportFeatureFlags;
  unint64_t v6 = sub_26156567C();
  v4[0] = v1;
  char v2 = sub_2615695B0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_26156567C()
{
  unint64_t result = qword_26A921F40;
  if (!qword_26A921F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F40);
  }
  return result;
}

BOOL static WatchFacesWallpaperSupportFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.hashValue.getter()
{
  return sub_261569BF0();
}

const char *WatchFacesWallpaperSupportFeatureFlags.domain.getter()
{
  return "NanoTimeKit";
}

const char *WatchFacesWallpaperSupportFeatureFlags.feature.getter()
{
  char v1 = "catskill_poster";
  if (*v0 != 1) {
    char v1 = "rhizome";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "extragalactic_poster";
  }
}

const char *sub_2615657B4()
{
  return "NanoTimeKit";
}

const char *sub_2615657C8()
{
  char v1 = "catskill_poster";
  if (*v0 != 1) {
    char v1 = "rhizome";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "extragalactic_poster";
  }
}

uint64_t PrivateFeatureFlags.isEnabled.getter()
{
  char v1 = *v0;
  unsigned int v5 = &type metadata for PrivateFeatureFlags;
  unint64_t v6 = sub_261565868();
  v4[0] = v1;
  char v2 = sub_2615695B0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_261565868()
{
  unint64_t result = qword_26A921F48;
  if (!qword_26A921F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F48);
  }
  return result;
}

BOOL static PrivateFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrivateFeatureFlags.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t PrivateFeatureFlags.hashValue.getter()
{
  return sub_261569BF0();
}

const char *PrivateFeatureFlags.domain.getter()
{
  return "NanoTimeKitExtras";
}

const char *PrivateFeatureFlags.feature.getter()
{
  if (*v0) {
    return "rhizome_design_tweaks";
  }
  else {
    return "catskill_design_tweaks";
  }
}

unint64_t sub_26156598C()
{
  unint64_t result = qword_26A921F50;
  if (!qword_26A921F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F50);
  }
  return result;
}

unint64_t sub_2615659E4()
{
  unint64_t result = qword_26A921F58;
  if (!qword_26A921F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F58);
  }
  return result;
}

const char *sub_261565A38()
{
  return "NanoTimeKitExtras";
}

const char *sub_261565A4C()
{
  if (*v0) {
    return "rhizome_design_tweaks";
  }
  else {
    return "catskill_design_tweaks";
  }
}

unsigned char *storeEnumTagSinglePayload for WatchFacesWallpaperSupportFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261565B44);
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

ValueMetadata *type metadata accessor for WatchFacesWallpaperSupportFeatureFlags()
{
  return &type metadata for WatchFacesWallpaperSupportFeatureFlags;
}

unsigned char *storeEnumTagSinglePayload for PrivateFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261565C48);
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

ValueMetadata *type metadata accessor for PrivateFeatureFlags()
{
  return &type metadata for PrivateFeatureFlags;
}

BOOL static WakeState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

__n128 static WakeState.on.getter@<Q0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(__n128 *)(a1 + 8) = result;
  return result;
}

uint64_t WakeState.ScreenState.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t WakeState.ScreenState.hashValue.getter()
{
  return sub_261569BF0();
}

void WakeState.screenState.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

double WakeState.linearProgress.getter()
{
  return *(double *)(v0 + 8);
}

double WakeState.backlightProgress.getter()
{
  return *(double *)(v0 + 16);
}

BOOL WakeState.isTransitioning.getter()
{
  return *(double *)(v0 + 16) > 0.01 && *(unsigned char *)v0 == 2;
}

BOOL static WakeState.ScreenState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL WakeState.isOn.getter()
{
  return *v0 == 0;
}

BOOL WakeState.isNotOn.getter()
{
  return *v0 != 0;
}

BOOL WakeState.isOff.getter()
{
  return *v0 == 1;
}

BOOL WakeState.isNotOff.getter()
{
  return *v0 != 1;
}

void static WakeState.off.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

uint64_t WakeState.ScreenState.description.getter()
{
  return qword_26156BB38[*v0];
}

uint64_t WakeState.description.getter()
{
  return 0;
}

unint64_t sub_261565F34()
{
  unint64_t result = qword_26A921F60;
  if (!qword_26A921F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F60);
  }
  return result;
}

BOOL sub_261565F8C(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t getEnumTagSinglePayload for WakeState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[24]) {
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

uint64_t storeEnumTagSinglePayload for WakeState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WakeState()
{
  return &type metadata for WakeState;
}

unsigned char *storeEnumTagSinglePayload for WakeState.ScreenState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261566128);
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

ValueMetadata *type metadata accessor for WakeState.ScreenState()
{
  return &type metadata for WakeState.ScreenState;
}

uint64_t SnapshotManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = objc_msgSend(self, sel_defaultManager);
  *(void *)(v0 + 24) = sub_26153EFBC(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t SnapshotManager.init()()
{
  *(void *)(v0 + 16) = objc_msgSend(self, sel_defaultManager);
  *(void *)(v0 + 24) = sub_26153EFBC(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t sub_261566214@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921F68);
  MEMORY[0x270FA5388](v7 - 8);
  BOOL v9 = (char *)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  id v13 = objc_msgSend(*(id *)(v3 + 16), sel_URLsForDirectory_inDomains_, 13, 1);
  uint64_t v14 = sub_261569480();
  uint64_t v15 = sub_2615697E0();

  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = v16;
  if (*(void *)(v15 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v9, v15 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)), v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v9, 1, 1, v14);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v14) == 1)
  {
    sub_261567E70((uint64_t)v9);
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v19 = a2[3];
    uint64_t v20 = a2;
    uint64_t v21 = a3;
    uint64_t v22 = v12;
    uint64_t v23 = v20[4];
    __swift_project_boxed_opaque_existential_1(v20, v19);
    v26[0] = v10;
    v26[1] = v11;
    v26[2] = v22;
    a3 = v21;
    (*(void (**)(void *, uint64_t, uint64_t))(v23 + 16))(v26, v19, v23);
    sub_261569460();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v14);
    uint64_t v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a3, v18, 1, v14);
}

id sub_261566470(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *(void *)&long long v5 = *a1;
  *((void *)&v5 + 1) = v2;
  uint64_t v6 = v3;
  if (v2 < 0) {
    return sub_261566CF0(&v5, a2);
  }
  else {
    return sub_2615664BC((uint64_t *)&v5, a2);
  }
}

id sub_2615664BC(uint64_t *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921F68);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_261569480();
  os_log_type_t v61 = *(uint8_t **)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v59 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v57 - v10;
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a2[3];
  uint64_t v16 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v15);
  uint64_t v64 = v12;
  uint64_t v65 = v13;
  uint64_t v66 = v14;
  uint64_t v17 = (*(uint64_t (**)(NSObject **, uint64_t, uint64_t))(v16 + 8))(&v64, v15, v16);
  id v58 = (char *)v12;
  uint64_t v64 = v12;
  uint64_t v65 = v13;
  uint64_t v18 = v13;
  uint64_t v66 = v14;
  uint64_t v19 = v61;
  sub_261566214((uint64_t *)&v64, a2, (uint64_t)v6);
  if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v19 + 6))(v6, 1, v7) == 1)
  {
    sub_261567E70((uint64_t)v6);
    if (qword_26B40E300 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_261569610();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B40E528);
    sub_261567F38((uint64_t)a2, (uint64_t)&v64);
    uint64_t v21 = sub_2615695F0();
    os_log_type_t v22 = sub_2615698A0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v63 = v24;
      id v60 = v17;
      *(_DWORD *)uint64_t v23 = 136315138;
      os_log_type_t v61 = v23 + 4;
      uint64_t v25 = v67;
      uint64_t v26 = v68;
      __swift_project_boxed_opaque_existential_1(&v64, v67);
      v62[0] = v58;
      v62[1] = v18;
      v62[2] = v14;
      uint64_t v27 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 16))(v62, v25, v26);
      v62[0] = sub_2615453FC(v27, v28, &v63);
      sub_261569960();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v64);
      _os_log_impl(&dword_26153C000, v21, v22, "_cachedOnDiskSnapshot: Could not generate URL for snapshotFilename: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v24, -1, -1);
      MEMORY[0x263E3AFE0](v23, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v64);
    }

    return 0;
  }
  (*((void (**)(char *, char *, uint64_t))v19 + 4))(v11, v6, v7);
  if (qword_26B40E300 != -1) {
    swift_once();
  }
  id v60 = v17;
  uint64_t v29 = sub_261569610();
  uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_26B40E528);
  unint64_t v31 = v59;
  (*((void (**)(char *, char *, uint64_t))v19 + 2))(v59, v11, v7);
  uint64_t v32 = sub_2615695F0();
  os_log_type_t v33 = sub_2615698A0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    id v58 = (char *)v30;
    unint64_t v35 = (uint8_t *)v34;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v64 = v36;
    *(_DWORD *)unint64_t v35 = 136315138;
    sub_261567F9C();
    uint64_t v37 = sub_261569B10();
    v62[0] = sub_2615453FC(v37, v38, (uint64_t *)&v64);
    uint64_t v39 = v61;
    sub_261569960();
    swift_bridgeObjectRelease();
    uint64_t v59 = (char *)*((void *)v39 + 1);
    ((void (*)(char *, uint64_t))v59)(v31, v7);
    _os_log_impl(&dword_26153C000, v32, v33, "_cachedOnDiskSnapshot: Looking for snapshot at URL: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v36, -1, -1);
    MEMORY[0x263E3AFE0](v35, -1, -1);
  }
  else
  {
    uint64_t v59 = (char *)*((void *)v19 + 1);
    ((void (*)(char *, uint64_t))v59)(v31, v7);
  }

  sub_261569470();
  id v40 = objc_allocWithZone(MEMORY[0x263F827E8]);
  uint64_t v41 = (void *)sub_2615696D0();
  swift_bridgeObjectRelease();
  id v42 = objc_msgSend(v40, sel_initWithContentsOfFile_, v41);

  int v43 = v60;
  os_log_t v44 = sub_2615695F0();
  os_log_type_t v45 = sub_2615698A0();
  id v60 = v44;
  BOOL v46 = os_log_type_enabled(v44, v45);
  if (!v42)
  {
    if (v46)
    {
      id v58 = v11;
      os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
      id v52 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v51 = 138543362;
      uint64_t v64 = v43;
      id v53 = v43;
      uint64_t v11 = v58;
      sub_261569960();
      *id v52 = v43;

      _os_log_impl(&dword_26153C000, v60, v45, "_cachedOnDiskSnapshot: No snapshot found on disk for key=%{public}@", v51, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
      swift_arrayDestroy();
      MEMORY[0x263E3AFE0](v52, -1, -1);
      MEMORY[0x263E3AFE0](v51, -1, -1);
    }
    else
    {
    }
    os_log_type_t v55 = v59;

    ((void (*)(char *, uint64_t))v55)(v11, v7);
    return 0;
  }
  if (v46)
  {
    id v58 = v11;
    double v47 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v48 = (void *)swift_slowAlloc();
    *(_DWORD *)double v47 = 138543362;
    uint64_t v64 = v43;
    uint64_t v49 = v7;
    id v50 = v43;
    sub_261569960();
    *os_log_type_t v48 = v43;

    uint64_t v7 = v49;
    uint64_t v11 = v58;
    _os_log_impl(&dword_26153C000, v60, v45, "_cachedOnDiskSnapshot: Found cached snapshot on disk for key=%{public}@", v47, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v48, -1, -1);
    MEMORY[0x263E3AFE0](v47, -1, -1);
  }
  else
  {
  }
  uint64_t v54 = v59;

  ((void (*)(char *, uint64_t))v54)(v11, v7);
  return v42;
}

void *sub_261566CF0(long long *a1, void *a2)
{
  long long v26 = *a1;
  uint64_t v3 = *((void *)a1 + 2);
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v4);
  long long v28 = v26;
  uint64_t v29 = v3;
  uint64_t v6 = (void *)(*(uint64_t (**)(long long *, uint64_t, uint64_t))(v5 + 8))(&v28, v4, v5);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v2 + 24);
  if (*(void *)(v7 + 16))
  {
    id v8 = v6;
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_261545D00((uint64_t)v8);
    if (v10)
    {
      uint64_t v11 = *(void **)(*(void *)(v7 + 56) + 8 * v9);
      id v12 = v11;

      swift_bridgeObjectRelease();
      if (qword_26B40E300 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_261569610();
      __swift_project_value_buffer(v13, (uint64_t)qword_26B40E528);
      uint64_t v14 = v8;
      uint64_t v15 = sub_2615695F0();
      os_log_type_t v16 = sub_2615698A0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 138543362;
        uint64_t v18 = v14;
        sub_261569960();
        *uint64_t v27 = v14;

        _os_log_impl(&dword_26153C000, v15, v16, "_cachedInMemorySnapshot: Found cached snapshot in memory for key=%{public}@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
        swift_arrayDestroy();
        MEMORY[0x263E3AFE0](v27, -1, -1);
        MEMORY[0x263E3AFE0](v17, -1, -1);
      }
      else
      {

        uint64_t v15 = v14;
      }
      goto LABEL_14;
    }

    swift_bridgeObjectRelease();
  }
  if (qword_26B40E300 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_261569610();
  __swift_project_value_buffer(v19, (uint64_t)qword_26B40E528);
  uint64_t v20 = v6;
  uint64_t v15 = sub_2615695F0();
  os_log_type_t v21 = sub_2615698A0();
  if (os_log_type_enabled(v15, v21))
  {
    os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v22 = 138543362;
    uint64_t v24 = v20;
    sub_261569960();
    void *v23 = v20;

    _os_log_impl(&dword_26153C000, v15, v21, "_cachedInMemorySnapshot: No snapshot found in memory for key=%{public}@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v23, -1, -1);
    MEMORY[0x263E3AFE0](v22, -1, -1);
    uint64_t v11 = 0;
  }
  else
  {

    uint64_t v11 = 0;
    uint64_t v15 = v20;
  }
LABEL_14:

  return v11;
}

void sub_2615670A8(UIImage *a1, void *a2, void *a3)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *(void *)&long long v5 = *a2;
  *((void *)&v5 + 1) = v3;
  uint64_t v6 = v4;
  if (v3 < 0) {
    sub_2615670F4(a1, &v5, a3);
  }
  else {
    sub_2615671F0(a1, (uint64_t *)&v5, a3);
  }
}

void sub_2615670F4(void *a1, long long *a2, void *a3)
{
  uint64_t v4 = v3;
  long long v13 = *a2;
  uint64_t v6 = *((void *)a2 + 2);
  uint64_t v7 = a3[3];
  uint64_t v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  long long v15 = v13;
  uint64_t v16 = v6;
  unint64_t v9 = (void *)(*(uint64_t (**)(long long *, uint64_t, uint64_t))(v8 + 8))(&v15, v7, v8);
  swift_beginAccess();
  id v10 = v9;
  id v11 = a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = 0x8000000000000000;
  sub_2615474B0((uint64_t)a1, v10, isUniquelyReferenced_nonNull_native);
  *(void *)(v4 + 24) = v14;

  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t sub_2615671F0(UIImage *a1, uint64_t *a2, void *a3)
{
  uint64_t v59 = a1;
  uint64_t v65 = sub_261569480();
  uint64_t v67 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v64 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261569610();
  uint64_t v66 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921F68);
  uint64_t v8 = MEMORY[0x270FA5388](v58);
  uint64_t v63 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v57 = (uint64_t)&v56 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v18 = *a2;
  uint64_t v17 = a2[1];
  uint64_t v19 = a2[2];
  uint64_t v20 = a3[3];
  uint64_t v21 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v20);
  uint64_t v70 = v18;
  uint64_t v71 = v17;
  uint64_t v72 = v19;
  id v60 = (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v21 + 8))(&v70, v20, v21);
  uint64_t v70 = v18;
  uint64_t v71 = v17;
  uint64_t v72 = v19;
  uint64_t v68 = v16;
  sub_261566214(&v70, a3, (uint64_t)v16);
  if (qword_26B40E300 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v6, (uint64_t)qword_26B40E528);
  uint64_t v23 = v66;
  uint64_t v24 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v62, v22, v6);
  sub_261567ED0((uint64_t)v68, (uint64_t)v14);
  uint64_t v25 = sub_2615695F0();
  os_log_type_t v26 = sub_2615698A0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v61 = v22;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v70 = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v29 = v65;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48))(v14, 1, v65) == 1)
    {
      unint64_t v30 = 0xEE004C5255746F68;
      uint64_t v31 = 0x7370616E53206F4ELL;
    }
    else
    {
      sub_261567ED0((uint64_t)v14, v57);
      uint64_t v31 = sub_261569720();
      unint64_t v30 = v34;
    }
    uint64_t v69 = sub_2615453FC(v31, v30, &v70);
    sub_261569960();
    swift_bridgeObjectRelease();
    sub_261567E70((uint64_t)v14);
    _os_log_impl(&dword_26153C000, v25, v26, "_saveSnapshotToDisk: snapshotURL: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v28, -1, -1);
    MEMORY[0x263E3AFE0](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v66 + 8))(v24, v6);
    uint64_t v33 = v67;
    uint64_t v32 = v64;
  }
  else
  {
    sub_261567E70((uint64_t)v14);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v6);
    uint64_t v32 = v64;
    uint64_t v29 = v65;
    uint64_t v33 = v67;
  }
  uint64_t v35 = v63;
  sub_261567ED0((uint64_t)v68, v63);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v35, 1, v29) == 1)
  {
    sub_261567E70(v35);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v32, v35, v29);
    uint64_t v36 = UIImagePNGRepresentation(v59);
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = sub_2615694E0();
      unint64_t v40 = v39;

      sub_2615694F0();
      uint64_t v66 = v38;
      id v47 = v60;
      os_log_type_t v48 = sub_2615695F0();
      os_log_type_t v49 = sub_261569890();
      if (os_log_type_enabled(v48, v49))
      {
        os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
        id v52 = (void *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v51 = 138543362;
        uint64_t v70 = (uint64_t)v47;
        id v53 = v47;
        uint64_t v32 = v64;
        sub_261569960();
        *id v52 = v47;

        uint64_t v29 = v65;
        _os_log_impl(&dword_26153C000, v48, v49, "Saved snapshot view for key=%{public}@ to disk", v51, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
        swift_arrayDestroy();
        uint64_t v54 = v52;
        uint64_t v33 = v67;
        MEMORY[0x263E3AFE0](v54, -1, -1);
        MEMORY[0x263E3AFE0](v51, -1, -1);
        sub_26155A4F8(v66, v40);
      }
      else
      {
        sub_26155A4F8(v66, v40);
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v29);
      return sub_261567E70((uint64_t)v68);
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v29);
  }
  id v41 = v60;
  id v42 = sub_2615695F0();
  os_log_type_t v43 = sub_2615698B0();
  if (os_log_type_enabled(v42, v43))
  {
    os_log_t v44 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v45 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_t v44 = 138543362;
    uint64_t v70 = (uint64_t)v41;
    id v46 = v41;
    sub_261569960();
    *os_log_type_t v45 = v41;

    _os_log_impl(&dword_26153C000, v42, v43, "Failed to create PNG data when saving snapshot to disk for key=%{public}@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921770);
    swift_arrayDestroy();
    MEMORY[0x263E3AFE0](v45, -1, -1);
    MEMORY[0x263E3AFE0](v44, -1, -1);
  }
  else
  {
  }
  return sub_261567E70((uint64_t)v68);
}

uint64_t sub_261567C08()
{
  swift_beginAccess();
  *(void *)(v0 + 24) = MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

uint64_t SnapshotManager.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SnapshotManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_261567CB4(UIImage *a1, void *a2, void *a3)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *(void *)&long long v5 = *a2;
  *((void *)&v5 + 1) = v3;
  uint64_t v6 = v4;
  if (v3 < 0) {
    sub_2615670F4(a1, &v5, a3);
  }
  else {
    sub_2615671F0(a1, (uint64_t *)&v5, a3);
  }
}

id sub_261567D0C(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *(void *)&long long v5 = *a1;
  *((void *)&v5 + 1) = v2;
  uint64_t v6 = v3;
  if (v2 < 0) {
    return sub_261566CF0(&v5, a2);
  }
  else {
    return sub_2615664BC((uint64_t *)&v5, a2);
  }
}

uint64_t dispatch thunk of SnapshotIdentifierProvider.snapshotKey(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SnapshotIdentifierProvider.snapshotFilename(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SnapshotManagerProtocol.saveSnapshot(image:type:filenameProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SnapshotManagerProtocol.cachedSnapshot(for:filenameProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for SnapshotManager()
{
  return self;
}

uint64_t method lookup function for SnapshotManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnapshotManager);
}

uint64_t dispatch thunk of SnapshotManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SnapshotManager.cachedSnapshot(for:filenameProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SnapshotManager.saveSnapshot(image:type:filenameProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SnapshotManager.removeLocalSnapshots()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_261567E70(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921F68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_261567ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_261567F38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_261567F9C()
{
  unint64_t result = qword_26A921F78;
  if (!qword_26A921F78)
  {
    sub_261569480();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F78);
  }
  return result;
}

void SnapshotType.init(renderer:)(void *a1@<X0>, void *a2@<X8>)
{
  unsigned int v4 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_isSnapshot);
  swift_unknownObjectRelease();
  if (v4)
  {
    unsigned int v5 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_isPreview);
    swift_unknownObjectRelease();
    id v6 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
    swift_unknownObjectRelease();
    if (v5)
    {

      a2[1] = 0;
      a2[2] = 0;
      *a2 = v6;
    }
    else
    {
      id v7 = objc_msgSend(a1, sel_environment);
      swift_getObjectType();
      PRPosterRenderingEnvironment.unlockState.getter((uint64_t)v10);

      swift_unknownObjectRelease();
      uint64_t v8 = v11;
      unint64_t v9 = v10[0] | 0x8000000000000000;
      *a2 = v6;
      a2[1] = v9;
      a2[2] = v8;
    }
  }
  else
  {

    *(_OWORD *)a2 = xmmword_26156BC10;
    a2[2] = 0;
  }
}

uint64_t SnapshotType.description.getter()
{
  if ((*(void *)(v0 + 8) & 0x8000000000000000) != 0)
  {
    uint64_t v2 = 0x7265686374697773;
    sub_261569760();
    swift_bridgeObjectRelease();
    sub_261569760();
  }
  else
  {
    uint64_t v2 = 0x2D77656976657270;
  }
  sub_261569760();
  swift_bridgeObjectRelease();
  return v2;
}

void PRRenderer.snapshotType.getter(void *a1@<X8>)
{
  id v3 = v1;
  SnapshotType.init(renderer:)(v3, a1);
}

BOOL _s26WatchFacesWallpaperSupport12SnapshotTypeO2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  double v3 = *a1;
  uint64_t v2 = *((void *)a1 + 1);
  double v5 = *a2;
  uint64_t v4 = *((void *)a2 + 1);
  if ((v2 & 0x8000000000000000) == 0) {
    return v4 >= 0 && *(void *)&v3 == *(void *)&v5;
  }
  uint64_t v8 = 0;
  if (v4 < 0 && *(void *)&v3 == *(void *)&v5) {
    return a1[2] == a2[2] && v4 == v2;
  }
  return v8;
}

uint64_t getEnumTagSinglePayload for SnapshotType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 2;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SnapshotType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 4 * -a2;
      *(void *)(result + 16) = 0;
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_26156848C(uint64_t a1)
{
  return *(void *)(a1 + 8) >> 63;
}

uint64_t sub_261568498(uint64_t result)
{
  *(void *)(result + 8) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_2615684A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = *(void *)(result + 8) & 3 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for SnapshotType()
{
  return &type metadata for SnapshotType;
}

BOOL static WallpaperMetalRenderingFloatingLayerStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WallpaperMetalRenderingFloatingLayerStyle.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t WallpaperMetalRenderingFloatingLayerStyle.hashValue.getter()
{
  return sub_261569BF0();
}

unint64_t sub_26156855C()
{
  unint64_t result = qword_26A921F80;
  if (!qword_26A921F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F80);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26156867CLL);
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

ValueMetadata *type metadata accessor for WallpaperMetalRenderingFloatingLayerStyle()
{
  return &type metadata for WallpaperMetalRenderingFloatingLayerStyle;
}

uint64_t initializeBufferWithCopyOfBuffer for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_26156417C(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1)
{
}

uint64_t assignWithCopy for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_26156417C(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2615641A0(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2615641A0(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_261568840(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_261568848(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalRenderingFloatingLayerStyle.MaskResource()
{
  return &type metadata for WallpaperMetalRenderingFloatingLayerStyle.MaskResource;
}

uint64_t dispatch thunk of static WallpaperMetalRendering.colorPixelFormat.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.colorSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.needsCommandBufferForSetup.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.floatingLayerStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of WallpaperMetalRendering.init(device:identifier:pixelWidth:pixelHeight:commandBuffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t dispatch thunk of WallpaperMetalRendering.render(state:into:floatingLayerMask:commandBuffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

id sub_261568908()
{
  switch(*v0)
  {
    case 1:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1054615798;
      int v7 = 1058139013;
      goto LABEL_12;
    case 2:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1054951342;
      int v8 = 1065017672;
      goto LABEL_16;
    case 3:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1052266988;
      int v5 = 1059313418;
      goto LABEL_7;
    case 4:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1060320051;
      int v5 = 1050253722;
      goto LABEL_7;
    case 5:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v2) = 1044549468;
      LODWORD(v4) = 1060991140;
      double v6 = 0.0;
      LODWORD(v3) = 1060991140;
      break;
    case 6:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1062165545;
      LODWORD(v2) = 1038174126;
      int v9 = 1062501089;
      goto LABEL_17;
    case 7:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1061830001;
      LODWORD(v3) = 1036831949;
      double v4 = 0.0;
      LODWORD(v2) = 0.75;
      break;
    case 8:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1063675494;
      int v7 = 1035489772;
LABEL_12:
      LODWORD(v2) = v7;
      double v4 = 0.0;
      LODWORD(v3) = 1.0;
      break;
    case 9:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1064849900;
      LODWORD(v2) = 1065185444;
      int v9 = 1017370378;
      goto LABEL_17;
    case 0xA:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1059816735;
      LODWORD(v2) = 1065185444;
      LODWORD(v3) = 1058139013;
      double v4 = 0.0;
      break;
    case 0xB:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1059816735;
      int v8 = 1058139013;
LABEL_16:
      LODWORD(v2) = v8;
      int v9 = 1065185444;
LABEL_17:
      LODWORD(v3) = v9;
      double v6 = 0.0;
      break;
    case 0xC:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1064011039;
      LODWORD(v4) = 1041865114;
      LODWORD(v2) = 1034147594;
      int v10 = 1062333317;
      goto LABEL_20;
    case 0xD:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v6) = 1041865114;
      LODWORD(v4) = 1064011039;
      LODWORD(v2) = 1062333317;
      int v10 = 1034147594;
LABEL_20:
      LODWORD(v3) = v10;
      break;
    default:
      id v1 = objc_allocWithZone(MEMORY[0x263F15808]);
      LODWORD(v4) = 1054615798;
      int v5 = 1058139013;
LABEL_7:
      LODWORD(v3) = v5;
      double v6 = 0.0;
      LODWORD(v2) = 1.0;
      break;
  }
  return objc_msgSend(v1, sel_initWithControlPoints__::, v6, v4, v2, v3);
}

BOOL static TimingFunction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TimingFunction.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t TimingFunction.hashValue.getter()
{
  return sub_261569BF0();
}

float FloatingPoint<>.retimed(_:)(float a1)
{
  id v2 = sub_261568908();
  *(float *)&double v3 = a1;
  objc_msgSend(v2, sel__solveForInput_, v3);
  float v5 = v4;

  return v5;
}

double FloatingPoint<>.retimed(_:)(double a1)
{
  id v2 = sub_261568908();
  *(float *)&double v3 = a1;
  objc_msgSend(v2, sel__solveForInput_, v3);
  LODWORD(a1) = v4;

  return *(float *)&a1;
}

unint64_t sub_261568DDC()
{
  unint64_t result = qword_26A921F88;
  if (!qword_26A921F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F88);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TimingFunction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TimingFunction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x261568F8CLL);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimingFunction()
{
  return &type metadata for TimingFunction;
}

BOOL static Keyframe.Name.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Keyframe.Name.hash(into:)()
{
  return sub_261569BE0();
}

uint64_t Keyframe.Name.hashValue.getter()
{
  return sub_261569BF0();
}

double Keyframe.Progress.wakeProgress.getter()
{
  return *(double *)v0;
}

double Keyframe.Progress.unlockProgress.getter()
{
  return *(double *)(v0 + 8);
}

void Keyframe.Progress.init(wakeProgress:unlockProgress:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *a1 = a2;
  a1[1] = a3;
}

unint64_t Keyframe.Progress.description.getter()
{
  return 0xD000000000000018;
}

unint64_t sub_261569140()
{
  unint64_t result = qword_26A921F90;
  if (!qword_26A921F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A921F90);
  }
  return result;
}

uint64_t sub_261569198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for Keyframe()
{
  return &type metadata for Keyframe;
}

unsigned char *storeEnumTagSinglePayload for Keyframe.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261569288);
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

ValueMetadata *type metadata accessor for Keyframe.Name()
{
  return &type metadata for Keyframe.Name;
}

ValueMetadata *type metadata accessor for Keyframe.Progress()
{
  return &type metadata for Keyframe.Progress;
}

uint64_t sub_2615692D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2615692E0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2615692F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_261569300()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_261569310()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_261569320()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_261569330()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_261569340()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_261569350()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_261569360()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_261569370()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_261569380()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_261569390()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2615693A0()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_2615693B0()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_2615693C0()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_2615693D0()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_2615693E0()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_2615693F0()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_261569400()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_261569410()
{
  return MEMORY[0x270EEE8D8]();
}

uint64_t sub_261569420()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_261569430()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_261569440()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_261569450()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_261569460()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_261569470()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_261569480()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_261569490()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2615694A0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2615694B0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2615694C0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2615694D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2615694E0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2615694F0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_261569500()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_261569510()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_261569520()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_261569530()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_261569540()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_261569550()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_261569560()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_261569570()
{
  return MEMORY[0x270EF1510]();
}

uint64_t sub_261569580()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_261569590()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_2615695A0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2615695B0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2615695C0()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2615695D0()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2615695E0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2615695F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_261569600()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_261569610()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_261569620()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_261569630()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_261569640()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_261569650()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_261569660()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_261569670()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_261569680()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_261569690()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_2615696A0()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_2615696B0()
{
  return MEMORY[0x270F9D288]();
}

uint64_t sub_2615696C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2615696D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2615696E0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2615696F0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_261569700()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_261569710()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_261569720()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_261569730()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_261569740()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_261569750()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_261569760()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_261569770()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_261569780()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_261569790()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2615697A0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2615697B0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2615697C0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2615697D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2615697E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2615697F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_261569800()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_261569810()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_261569820()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_261569830()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_261569840()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_261569850()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_261569860()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_261569870()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_261569880()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_261569890()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2615698A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2615698B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2615698C0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2615698D0()
{
  return MEMORY[0x270FA1288]();
}

uint64_t sub_2615698E0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2615698F0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_261569900()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_261569910()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_261569920()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_261569930()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_261569940()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_261569950()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_261569960()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_261569970()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_261569980()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_261569990()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2615699A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2615699B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2615699C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2615699D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2615699E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2615699F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_261569A00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_261569A10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_261569A20()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_261569A30()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_261569A40()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_261569A50()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_261569A60()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_261569A70()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_261569A80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_261569A90()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_261569AA0()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_261569AB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_261569AC0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_261569AD0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_261569AE0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_261569AF0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_261569B10()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_261569B20()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_261569B30()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_261569B40()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_261569B50()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_261569B60()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_261569B70()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_261569B80()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_261569B90()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_261569BA0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_261569BB0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_261569BC0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_261569BD0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_261569BE0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_261569BF0()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
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

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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