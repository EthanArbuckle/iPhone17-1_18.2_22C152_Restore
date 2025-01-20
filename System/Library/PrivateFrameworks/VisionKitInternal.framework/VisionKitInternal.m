_VKStickerEffectViewInternal *VKInternalStickerEffectViewWithDevice(void *a1)
{
  id v1;
  _VKStickerEffectViewInternal *v2;
  uint64_t vars8;

  v1 = a1;
  v2 = [[_VKStickerEffectViewInternal alloc] initWithDevice:v1];

  return v2;
}

uint64_t VKStickerEffectViewExtraScaleToIncludeStroke(uint64_t a1)
{
  return +[_VKStickerEffectViewInternal extraScaleToIncludeStrokeWithEffectType:bounds:](_VKStickerEffectViewInternal, "extraScaleToIncludeStrokeWithEffectType:bounds:", a1);
}

uint64_t vk_isCameraApp()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.camera"];

  return v2;
}

uint64_t vk_isPhotosApp()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.mobileslideshow"];

  return v2;
}

uint64_t sub_260D56F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_260D56F18()
{
  sub_260D589B8(v0 + 16);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

id sub_260D56F50()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15890]), sel_init);
  objc_msgSend(v0, sel_setStiffness_, 39.4784176);
  objc_msgSend(v0, sel_stiffness);
  double v2 = sqrt(v1);
  objc_msgSend(v0, sel_setDamping_, v2 + v2);
  id v3 = v0;
  v4 = (void *)sub_260D756E0();
  objc_msgSend(v3, sel_setFromValue_, v4);

  id v5 = v3;
  v6 = (void *)sub_260D756E0();
  objc_msgSend(v5, sel_setToValue_, v6);

  id v7 = v5;
  objc_msgSend(v7, sel_settlingDuration);
  objc_msgSend(v7, sel_setDuration_);

  return v7;
}

uint64_t sub_260D57050(void *a1, uint64_t a2)
{
  return sub_260D5706C(a1, a2) & 1;
}

uint64_t sub_260D5706C(void *a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x261228FE0](*a1 + 16);
  if (result)
  {
    uint64_t v4 = result;
    swift_unknownObjectRelease();
    return v4 == a2;
  }
  return result;
}

uint64_t sub_260D570BC()
{
  type metadata accessor for StickerEffectMotionManager();
  swift_allocObject();
  uint64_t result = sub_260D570F8();
  qword_26A8E5390 = result;
  return result;
}

uint64_t sub_260D570F8()
{
  *(unsigned char *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 48) = 1;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  *(unsigned char *)(v0 + 80) = 1;
  *(void *)(v0 + 88) = 0;
  *(unsigned char *)(v0 + 96) = 1;
  *(void *)(v0 + 104) = sub_260D56F50();
  *(void *)(v0 + 112) = 0x3FF0000000000000;
  *(void *)(v0 + 120) = 0;
  *(unsigned char *)(v0 + 128) = 1;
  *(void *)(v0 + 136) = MEMORY[0x263F8EE78];
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F01788]), sel_init);
  *(void *)(v0 + 16) = v1;
  if (v1) {
    objc_msgSend(v1, sel_setDeviceMotionUpdateInterval_, 0.0166666667);
  }
  double v2 = self;
  id v3 = objc_msgSend(v2, sel_defaultCenter);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v0, sel_backgroundFrom_, *MEMORY[0x263F83330], 0);

  id v4 = objc_msgSend(v2, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v0, sel_foregroundFrom_, *MEMORY[0x263F833B8], 0);

  return v0;
}

void sub_260D57234()
{
  uint64_t v1 = v0;
  double v2 = (unint64_t *)(v0 + 136);
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 136);
  if (v3 >> 62) {
    goto LABEL_76;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x2612287D0](v5, v3);
      }
      else
      {
        uint64_t v6 = *(void *)(v3 + 8 * v5 + 32);
        swift_retain();
      }
      uint64_t v7 = MEMORY[0x261228FE0](v6 + 16);
      swift_release();
      swift_unknownObjectRelease();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        uint64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
        }
        else if (!(*v2 >> 62))
        {
          if (v15 == *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_12;
          }
          goto LABEL_20;
        }
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_260D75810();
        swift_bridgeObjectRelease();
        if (v15 == v34) {
          goto LABEL_12;
        }
LABEL_20:
        uint64_t v16 = v5 + 5;
        while (2)
        {
          unint64_t v3 = v16 - 4;
          unint64_t v17 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            uint64_t v18 = MEMORY[0x2612287D0](v16 - 4);
          }
          else
          {
            if ((v3 & 0x8000000000000000) != 0) {
              goto LABEL_66;
            }
            if (v3 >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_67;
            }
            uint64_t v18 = *(void *)(v17 + 8 * v16);
            swift_retain();
          }
          uint64_t v19 = MEMORY[0x261228FE0](v18 + 16);
          swift_release();
          swift_unknownObjectRelease();
          if (!v19) {
            goto LABEL_46;
          }
          if (v3 == v5) {
            goto LABEL_45;
          }
          unint64_t v20 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            uint64_t v21 = MEMORY[0x2612287D0](v5, *v2);
            unint64_t v20 = *v2;
            if ((*v2 & 0xC000000000000001) == 0) {
              goto LABEL_31;
            }
          }
          else
          {
            if (v5 < 0) {
              goto LABEL_70;
            }
            if ((unint64_t)v5 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_71;
            }
            uint64_t v21 = *(void *)(v20 + 8 * v5 + 32);
            swift_retain();
            if ((v20 & 0xC000000000000001) == 0)
            {
LABEL_31:
              if ((v3 & 0x8000000000000000) != 0) {
                goto LABEL_72;
              }
              if (v3 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_73;
              }
              uint64_t v22 = *(void *)(v20 + 8 * v16);
              swift_retain();
LABEL_34:
              int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *double v2 = v20;
              if (!isUniquelyReferenced_nonNull_bridgeObject
                || (v20 & 0x8000000000000000) != 0
                || (v20 & 0x4000000000000000) != 0)
              {
                sub_260D58E6C(v20);
                unint64_t v20 = v24;
                *double v2 = v24;
              }
              *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v22;
              swift_release();
              sub_260D756B0();
              unint64_t v25 = *v2;
              int v26 = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *double v2 = v25;
              if (!v26 || (v25 & 0x8000000000000000) != 0 || (v25 & 0x4000000000000000) != 0)
              {
                sub_260D58E6C(v25);
                unint64_t v25 = v27;
                *double v2 = v27;
              }
              if ((v3 & 0x8000000000000000) != 0) {
                goto LABEL_74;
              }
              if (v3 >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_75;
              }
              *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 8 * v16) = v21;
              swift_release();
              sub_260D756B0();
LABEL_45:
              if (__OFADD__(v5++, 1)) {
                goto LABEL_69;
              }
LABEL_46:
              uint64_t v29 = v16 - 3;
              if (__OFADD__(v3, 1)) {
                goto LABEL_68;
              }
              if (*v2 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v30 = sub_260D75810();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v30 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              ++v16;
              if (v29 == v30) {
                goto LABEL_12;
              }
              continue;
            }
          }
          break;
        }
        uint64_t v22 = MEMORY[0x2612287D0](v16 - 4, v20);
        unint64_t v20 = *v2;
        goto LABEL_34;
      }
      uint64_t v8 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        break;
      }
      ++v5;
      if (v8 == v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_260D75810();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  if (*v2 >> 62) {
    goto LABEL_80;
  }
  uint64_t v5 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_12:
  while (!(*v2 >> 62))
  {
    uint64_t v9 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v5) {
      goto LABEL_14;
    }
LABEL_79:
    __break(1u);
LABEL_80:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_260D75810();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_260D75810();
  swift_bridgeObjectRelease();
  if (v9 < v5) {
    goto LABEL_79;
  }
LABEL_14:
  sub_260D58EE8(v5, v9);
  swift_endAccess();
  v10 = *(void **)(v1 + 16);
  if (v10)
  {
    char v11 = *(unsigned char *)(v1 + 24);
    id v12 = v10;
    v13 = v12;
    if (v11) {
      goto LABEL_16;
    }
    if (objc_msgSend(v12, sel_isDeviceMotionActive))
    {
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_260D75810();
        swift_bridgeObjectRelease();
        if (v35) {
          goto LABEL_58;
        }
      }
      else if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_58;
      }
LABEL_16:
      objc_msgSend(v13, sel_stopDeviceMotionUpdates);
      char v14 = *(unsigned char *)(v1 + 48);
      *(_OWORD *)(v1 + 64) = *(_OWORD *)(v1 + 32);
      *(unsigned char *)(v1 + 80) = v14;
      *(CFTimeInterval *)(v1 + 88) = CACurrentMediaTime();
      *(unsigned char *)(v1 + 96) = 0;
      *(void *)(v1 + 32) = 0;
      *(void *)(v1 + 40) = 0;
      *(unsigned char *)(v1 + 48) = 1;
    }
    else
    {
LABEL_58:
      if ((*(unsigned char *)(v1 + 24) & 1) == 0 && (objc_msgSend(v13, sel_isDeviceMotionActive) & 1) == 0)
      {
        unint64_t v31 = *v2;
        if (v31 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v36 = sub_260D75810();
          swift_bridgeObjectRelease();
          if (!v36) {
            goto LABEL_63;
          }
        }
        else if (!*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_63;
        }
        id v32 = objc_msgSend(self, sel_mainQueue);
        v37[4] = sub_260D591F4;
        v37[5] = v1;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 1107296256;
        v37[2] = sub_260D57838;
        v37[3] = &block_descriptor;
        v33 = _Block_copy(v37);
        swift_retain();
        swift_release();
        objc_msgSend(v13, sel_startDeviceMotionUpdatesToQueue_withHandler_, v32, v33);

        _Block_release(v33);
        v13 = v32;
      }
    }
LABEL_63:
  }
}

void sub_260D57838(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_260D578D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6 = sub_260D754F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260D754D0();
  *(unsigned char *)(a1 + 24) = a4;
  swift_retain();
  sub_260D57234();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_260D579C8(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    double v5 = CACurrentMediaTime();
    id v6 = objc_msgSend(a2, sel_attitude);
    objc_msgSend(v6, sel_quaternion);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    *(float *)&unsigned int v15 = v8;
    *(float *)&unsigned int v16 = v10;
    *(float *)&unsigned int v17 = v12;
    v20.i64[0] = __PAIR64__(v16, v15);
    *(float *)&unsigned int v18 = v14;
    v20.i64[1] = v17;
    float32x4_t v100 = (float32x4_t)xmmword_260D76510;
    float32x4_t v19 = vmulq_f32(v20, (float32x4_t)xmmword_260D76510);
    v20.i32[3] = v18;
    float v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0];
    v22.f32[0] = 0.0 * v21;
    v22.f32[1] = 0.0 * v21;
    v22.i64[1] = __PAIR64__(v18, LODWORD(v21));
    int8x16_t v23 = (int8x16_t)vmulq_f32(v22, v22);
    float32x2_t v24 = vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
    if (vaddv_f32(v24) == 0.0)
    {
      float32x4_t v25 = (float32x4_t)xmmword_260D76520;
    }
    else
    {
      unsigned __int32 v26 = vadd_f32(v24, (float32x2_t)vdup_lane_s32((int32x2_t)v24, 1)).u32[0];
      float32x2_t v27 = vrsqrte_f32((float32x2_t)v26);
      float32x2_t v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26, vmul_f32(v27, v27)));
      float32x4_t v25 = vmulq_f32(vmulq_n_f32(v22, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26, vmul_f32(v28, v28))).f32[0]), (float32x4_t)xmmword_260D76530);
    }
    int32x4_t v29 = (int32x4_t)vnegq_f32(v20);
    int8x16_t v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v20, vtrn1q_s32((int32x4_t)v20, v29));
    float32x4_t v31 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v29, 8uLL), *(float32x2_t *)v25.f32, 1), (float32x4_t)vextq_s8(v30, v30, 8uLL), v25.f32[0]);
    float32x4_t v32 = (float32x4_t)vrev64q_s32((int32x4_t)v20);
    v32.i32[0] = v29.i32[1];
    v32.i32[3] = v29.i32[2];
    float32x4_t v33 = vaddq_f32(v31, vmlaq_laneq_f32(vmulq_laneq_f32(v20, v25, 3), v32, v25, 2));
    if (*(unsigned char *)(v4 + 48))
    {
      *(float32x4_t *)(v4 + 32) = v33;
      *(unsigned char *)(v4 + 48) = 0;
      uint64_t v34 = v33.i64[1];
      uint64_t v35 = v33.i64[0];
    }
    else
    {
      uint64_t v35 = *(void *)(v4 + 32);
      uint64_t v34 = *(void *)(v4 + 40);
    }
    v36.i64[0] = v35;
    v36.i64[1] = v34;
    float32x4_t v106 = v36;
    float32x4_t v101 = v33;
    if ((*(unsigned char *)(v4 + 80) & 1) == 0 && (*(unsigned char *)(v4 + 96) & 1) == 0)
    {
      float32x4_t v104 = *(float32x4_t *)(v4 + 64);
      double v37 = v5 - *(double *)(v4 + 88);
      v38 = *(void **)(v4 + 104);
      objc_msgSend(v38, sel_duration, 0, 1065353216);
      double v40 = fmin(fmax(v37 / v39, 0.0), 1.0);
      *(float *)&double v40 = v40;
      objc_msgSend(v38, sel__solveForInput_, v40);
      simd_slerp(v104, v106, v41);
      float32x4_t v106 = v42;
    }
    swift_beginAccess();
    unint64_t v43 = *(void *)(v4 + 136);
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_260D75810();
      uint64_t v44 = result;
    }
    else
    {
      uint64_t v44 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
    }
    if (v44)
    {
      if (v44 >= 1)
      {
        uint64_t v45 = 0;
        float32x4_t v46 = vmulq_f32(v106, (float32x4_t)xmmword_260D76530);
        int32x4_t v47 = (int32x4_t)vnegq_f32(v46);
        float32x4_t v48 = (float32x4_t)vrev64q_s32((int32x4_t)v46);
        int8x16_t v49 = (int8x16_t)vtrn2q_s32((int32x4_t)v46, vtrn1q_s32((int32x4_t)v46, v47));
        v48.i32[0] = v47.i32[1];
        v48.i32[3] = v47.i32[2];
        float32x4_t v107 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v46, v101, 3), v48, v101, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v46, (int8x16_t)v47, 8uLL), *(float32x2_t *)v101.f32, 1), (float32x4_t)vextq_s8(v49, v49, 8uLL), v101.f32[0]));
        float32x4_t v102 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 2);
        float32x4_t v103 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v107.f32, 0);
        while (1)
        {
          if ((v43 & 0xC000000000000001) != 0)
          {
            uint64_t v50 = MEMORY[0x2612287D0](v45, v43);
          }
          else
          {
            uint64_t v50 = *(void *)(v43 + 8 * v45 + 32);
            swift_retain();
          }
          uint64_t v51 = MEMORY[0x261228FE0](v50 + 16);
          if (v51) {
            break;
          }
          swift_release();
LABEL_18:
          if (v44 == ++v45) {
            goto LABEL_57;
          }
        }
        v52 = (unsigned char *)v51;
        float32x4_t v105 = *(float32x4_t *)(v51 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation);
        *(float32x4_t *)(v51 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation) = v107;
        v53 = (void *)MEMORY[0x261228FE0](v51 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
        if (!v53) {
          goto LABEL_27;
        }
        v54 = v53;
        objc_msgSend(v53, sel__horizontalVelocity);
        double v56 = fabs(v55);
        objc_msgSend(v54, sel__verticalVelocity);
        double v58 = v57;

        double v59 = fabs(v58);
        if (v56 > v59) {
          double v59 = v56;
        }
        float v60 = v59;
        if (v60 != 0.0)
        {
          BOOL v71 = v60 >= 0.0 && v60 < 0.2;
          float32x4_t v62 = v105;
          if (v71)
          {
            *(float *)&int v76 = 0.01;
          }
          else
          {
            if (v60 < 0.2 || v60 >= 0.5)
            {
              float v73 = 100.0;
              if (v60 >= 100.0 || v60 < 1.0) {
                float v73 = 0.004;
              }
              if (v60 >= 0.5 && v60 < 1.0) {
                float v61 = 0.1;
              }
              else {
                float v61 = v73;
              }
              goto LABEL_28;
            }
            *(float *)&int v76 = 0.05;
          }
          float v61 = *(float *)&v76;
        }
        else
        {
LABEL_27:
          float v61 = 0.003;
          float32x4_t v62 = v105;
        }
LABEL_28:
        float32x4_t v63 = vmulq_f32(v62, (float32x4_t)xmmword_260D76530);
        int32x4_t v64 = (int32x4_t)vnegq_f32(v63);
        int8x16_t v65 = (int8x16_t)vtrn2q_s32((int32x4_t)v63, vtrn1q_s32((int32x4_t)v63, v64));
        float32x4_t v66 = vmlaq_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v63, (int8x16_t)v64, 8uLL), *(float32x2_t *)v107.f32, 1), (float32x4_t)vextq_s8(v65, v65, 8uLL), v103);
        float32x4_t v67 = (float32x4_t)vrev64q_s32((int32x4_t)v63);
        v67.i32[0] = v64.i32[1];
        v67.i32[3] = v64.i32[2];
        float32x4_t v68 = vaddq_f32(vmlaq_f32(vmulq_laneq_f32(v63, v107, 3), v67, v102), v66);
        float32x4_t v69 = vmulq_f32(v68, v68);
        float v70 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).f32[0]), v68.f32[3]);
        if (fabsf(v70 + v70) >= v61)
        {
          v52[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
          if (!*(void *)&v52[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
            objc_msgSend(v52, sel_setNeedsLayout);
          }
        }
        if (!*(void *)&v52[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]
          && (v52[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] & 1) != 0)
        {
          objc_msgSend(v52, sel_setNeedsLayout);
        }
        swift_release();
        swift_unknownObjectRelease();
        goto LABEL_18;
      }
      __break(1u);
      goto LABEL_73;
    }
LABEL_57:
    uint64_t result = swift_bridgeObjectRelease();
    if (*(unsigned char *)(v4 + 48))
    {
LABEL_73:
      __break(1u);
      return result;
    }
    uint64_t v77 = *(void *)(v4 + 32);
    uint64_t v78 = *(void *)(v4 + 40);
    v79.i64[0] = v77;
    v79.i64[1] = v78;
    float32x4_t v80 = vmulq_f32(v79, (float32x4_t)xmmword_260D76530);
    int32x4_t v81 = (int32x4_t)vnegq_f32(v80);
    int8x16_t v82 = (int8x16_t)vtrn2q_s32((int32x4_t)v80, vtrn1q_s32((int32x4_t)v80, v81));
    float32x4_t v83 = (float32x4_t)vrev64q_s32((int32x4_t)v80);
    v83.i32[0] = v81.i32[1];
    v83.i32[3] = v81.i32[2];
    float32x4_t v84 = vaddq_f32(vmlaq_f32(vmulq_laneq_f32(v80, v101, 3), v83, (float32x4_t)vdupq_laneq_s32((int32x4_t)v101, 2)), vmlaq_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v80, (int8x16_t)v81, 8uLL), *(float32x2_t *)v101.f32, 1), (float32x4_t)vextq_s8(v82, v82, 8uLL), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v101.f32, 0)));
    float32x4_t v85 = vmulq_f32(v84, v100);
    v80.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v85, 2), vaddq_f32(v85, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 1))).f32[0];
    v86.i64[0] = vdupq_lane_s32((int32x2_t)COERCE_UNSIGNED_INT(0.0 * v80.f32[0]), 0).u64[0];
    v86.i64[1] = __PAIR64__(v84.u32[3], v80.u32[0]);
    int8x16_t v87 = (int8x16_t)vmulq_f32(v86, v86);
    float32x2_t v88 = vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v87, v87, 8uLL));
    if (vaddv_f32(v88) == 0.0)
    {
      float32x4_t v89 = (float32x4_t)xmmword_260D76520;
    }
    else
    {
      unsigned __int32 v90 = vadd_f32(v88, (float32x2_t)vdup_lane_s32((int32x2_t)v88, 1)).u32[0];
      float32x2_t v91 = vrsqrte_f32((float32x2_t)v90);
      float32x2_t v92 = vmul_f32(v91, vrsqrts_f32((float32x2_t)v90, vmul_f32(v91, v91)));
      float32x4_t v89 = vmulq_f32(vmulq_n_f32(v86, vmul_f32(v92, vrsqrts_f32((float32x2_t)v90, vmul_f32(v92, v92))).f32[0]), (float32x4_t)xmmword_260D76530);
    }
    int32x4_t v93 = (int32x4_t)vnegq_f32(v89);
    int8x16_t v94 = (int8x16_t)vtrn2q_s32((int32x4_t)v89, vtrn1q_s32((int32x4_t)v89, v93));
    float32x4_t v95 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v89, (int8x16_t)v93, 8uLL), *(float32x2_t *)v84.f32, 1), (float32x4_t)vextq_s8(v94, v94, 8uLL), v84.f32[0]);
    float32x4_t v96 = (float32x4_t)vrev64q_s32((int32x4_t)v89);
    v96.i32[0] = v93.i32[1];
    v96.i32[3] = v93.i32[2];
    float32x4_t v97 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v89, v84, 3), v96, v84, 2), v95);
    float32x4_t v98 = vmulq_f32(v97, v97);
    float v99 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v98, 2), vaddq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v98.f32, 1))).f32[0]), v97.f32[3]);
    if (fabsf(v99 + v99) <= 0.62832)
    {
      if (*(unsigned char *)(v4 + 128)) {
        return swift_release();
      }
      *(void *)(v4 + 120) = 0;
    }
    else
    {
      if (*(unsigned char *)(v4 + 128))
      {
        *(double *)(v4 + 120) = v5;
        *(unsigned char *)(v4 + 128) = 0;
        return swift_release();
      }
      if (v5 - *(double *)(v4 + 120) <= 1.0) {
        return swift_release();
      }
      *(void *)(v4 + 64) = v77;
      *(void *)(v4 + 72) = v78;
      *(unsigned char *)(v4 + 80) = 0;
      *(CFTimeInterval *)(v4 + 88) = CACurrentMediaTime();
      *(unsigned char *)(v4 + 96) = 0;
      *(void *)(v4 + 32) = 0;
      *(void *)(v4 + 40) = 0;
      *(unsigned char *)(v4 + 48) = 1;
      *(void *)(v4 + 120) = 0;
    }
    *(unsigned char *)(v4 + 128) = 1;
    return swift_release();
  }
  return result;
}

uint64_t sub_260D580F8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 144, 15);
}

uint64_t type metadata accessor for StickerEffectMotionManager()
{
  return self;
}

uint64_t type metadata accessor for StickerEffectMotionManager.WeakObserver()
{
  return self;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_260D581AC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_260D581CC(uint64_t result, int a2, int a3)
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

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
}

void type metadata accessor for StickerShaderIridescence(uint64_t a1)
{
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

void type metadata accessor for VKIStickerEffectType(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for StickerComicRenderer.Parameters(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_260D58298(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_260D582B8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

BOOL sub_260D582F8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260D5830C(uint64_t a1)
{
  uint64_t v2 = sub_260D597A4(&qword_26A8E49D8, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_260D58378(uint64_t a1)
{
  uint64_t v2 = sub_260D597A4(&qword_26A8E49D8, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_260D583E8(uint64_t a1)
{
  uint64_t v2 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EEF788](a1, v2);
}

void sub_260D58454(void *a1@<X8>)
{
  *a1 = 0;
}

id sub_260D5845C()
{
  return *v0;
}

uint64_t sub_260D58464@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *sub_260D5846C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_260D58480(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_260D584B0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_260D584C4(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_260D584D8()
{
  return sub_260D755B0();
}

uint64_t sub_260D58524()
{
  return sub_260D755A0();
}

uint64_t sub_260D5857C()
{
  return sub_260D758E0();
}

void *sub_260D585E4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_260D585F4(void *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_260D58600@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_260D58610(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_260D5861C()
{
  return sub_260D75660();
}

uint64_t sub_260D5862C(uint64_t a1)
{
  uint64_t v2 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_260D58698(uint64_t a1)
{
  uint64_t v2 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_260D58704(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_260D58794()
{
  id v1 = *v0;
  uint64_t v2 = sub_260D75780();

  return v2;
}

uint64_t sub_260D587CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_260D58848()
{
  return sub_260D758E0();
}

void *sub_260D588A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_260D588B4()
{
  swift_getWitnessTable();
  return sub_260D75590();
}

uint64_t sub_260D58920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_260D589A4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260D589B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_260D589E0(uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t v4 = v2;
  unint64_t v7 = *v2;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_260D58D48(a1, a2, v7);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if (v3) {
    return v8;
  }
  if ((v10 & 1) == 0)
  {
    unint64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_54;
    }
    if (*v4 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_260D75810();
      swift_bridgeObjectRelease();
      if (v11 != v28) {
        goto LABEL_6;
      }
    }
    else if (v11 != *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      unint64_t v11 = v8 + 5;
      uint64_t v30 = a2;
      while (1)
      {
        unint64_t v12 = v11 - 4;
        unint64_t v13 = *v4;
        if ((*v4 & 0xC000000000000001) != 0)
        {
          uint64_t v14 = MEMORY[0x2612287D0](v11 - 4);
        }
        else
        {
          if ((v12 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v12 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_45;
          }
          uint64_t v14 = *(void *)(v13 + 8 * v11);
          swift_retain();
        }
        uint64_t v31 = v14;
        char v15 = a1(&v31);
        swift_release();
        if ((v15 & 1) == 0) {
          break;
        }
LABEL_32:
        unint64_t v25 = v11 - 3;
        if (__OFADD__(v12, 1)) {
          goto LABEL_46;
        }
        if (*v4 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v26 = sub_260D75810();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v26 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v11;
        if (v25 == v26) {
          return v8;
        }
      }
      if (v12 == v8)
      {
LABEL_31:
        if (__OFADD__(v8++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      unint64_t v16 = *v4;
      if ((*v4 & 0xC000000000000001) != 0)
      {
        uint64_t v17 = MEMORY[0x2612287D0](v8, *v4);
        unint64_t v16 = *v4;
        if ((*v4 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v12 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v18 = *(void *)(v16 + 8 * v11);
          swift_retain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v8 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v17 = *(void *)(v16 + 8 * v8 + 32);
        swift_retain();
        if ((v16 & 0xC000000000000001) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v18 = MEMORY[0x2612287D0](v11 - 4, v16);
      unint64_t v16 = *v4;
LABEL_20:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      unint64_t *v4 = v16;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v16 & 0x8000000000000000) != 0
        || (v16 & 0x4000000000000000) != 0)
      {
        sub_260D58E6C(v16);
        unint64_t v16 = v20;
        unint64_t *v4 = v20;
      }
      *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v18;
      swift_release();
      sub_260D756B0();
      unint64_t v21 = *v4;
      int v22 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      unint64_t *v4 = v21;
      if (!v22 || (v21 & 0x8000000000000000) != 0 || (v21 & 0x4000000000000000) != 0)
      {
        sub_260D58E6C(v21);
        unint64_t v21 = v23;
        unint64_t *v4 = v23;
      }
      a2 = v30;
      if ((v12 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v12 >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 8 * v11) = v17;
      swift_release();
      sub_260D756B0();
      goto LABEL_31;
    }
    return v8;
  }
  if (!(*v4 >> 62)) {
    return *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_260D75810();
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t sub_260D58D48(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x2612287D0](v7, a3);
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_260D75810();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v10 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

void sub_260D58E6C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_260D75810();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2612287E0);
}

uint64_t sub_260D58EE8(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_260D75810();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_260D75810();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_260D75810();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x2612287E0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for StickerEffectMotionManager.WeakObserver();
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_260D75810();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_260D75830();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_260D75810();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_260D756B0();
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

id sub_260D59210()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_260D755F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_260D75620();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = *(id *)(v1 + 16);
  if (result)
  {
    id result = objc_msgSend(result, sel_deviceMotion);
    if (result)
    {
      uint64_t v11 = result;
      sub_260D59524();
      uint64_t v19 = v3;
      uint64_t v18 = sub_260D75740();
      uint64_t v12 = swift_allocObject();
      swift_weakInit();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v12;
      *(void *)(v13 + 24) = v11;
      aBlock[4] = sub_260D595DC;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_260D6B1B0;
      aBlock[3] = &block_descriptor_57;
      uint64_t v14 = _Block_copy(aBlock);
      swift_retain();
      id v15 = v11;
      sub_260D75600();
      uint64_t v20 = MEMORY[0x263F8EE78];
      sub_260D597A4((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
      sub_260D59628();
      sub_260D757A0();
      uint64_t v16 = (void *)v18;
      MEMORY[0x261228760](0, v9, v5, v14);
      _Block_release(v14);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_release();
      return (id)swift_release();
    }
  }
  return result;
}

unint64_t sub_260D59524()
{
  unint64_t result = qword_26A8E4980;
  if (!qword_26A8E4980)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8E4980);
  }
  return result;
}

uint64_t sub_260D59564()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260D5959C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260D595DC()
{
  return sub_260D579C8(*(void *)(v0 + 16), *(void **)(v0 + 24));
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

unint64_t sub_260D59628()
{
  unint64_t result = qword_26A8E50C0;
  if (!qword_26A8E50C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A8E4990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E50C0);
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

void simd_slerp(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3 = vmulq_f32(a1, a2);
  float32x4_t v4 = (float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
  *(float32x2_t *)v3.f32 = vadd_f32(*(float32x2_t *)v3.f32, *(float32x2_t *)v4.f32);
  v3.f32[0] = vaddv_f32(*(float32x2_t *)v3.f32);
  v4.i64[0] = 0;
  _simd_slerp_internal(a1, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v3, v4)), 0), (int8x16_t)vnegq_f32(a2), (int8x16_t)a2), a3);
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

void type metadata accessor for MTLCommandBufferError(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_260D5975C()
{
  return sub_260D597A4(&qword_26A8E49C8, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D597A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260D597EC()
{
  return sub_260D597A4(&qword_26A8E49D0, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D59834()
{
  return sub_260D597A4(&qword_26A8E49D8, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D5987C()
{
  return sub_260D597A4(&qword_26A8E49E0, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D598C4()
{
  return sub_260D597A4(&qword_26A8E49E8, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D5990C()
{
  return sub_260D597A4(&qword_26A8E49F0, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_260D59968(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_260D599B0()
{
  return sub_260D597A4(&qword_26A8E49F8, type metadata accessor for Code);
}

unint64_t sub_260D599FC()
{
  unint64_t result = qword_26A8E4A00;
  if (!qword_26A8E4A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4A00);
  }
  return result;
}

uint64_t sub_260D59A50()
{
  return sub_260D597A4(&qword_26A8E4A08, type metadata accessor for Code);
}

uint64_t sub_260D59A98()
{
  return sub_260D597A4((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
}

uint64_t sub_260D59AE0()
{
  return sub_260D597A4((unint64_t *)&qword_26A8E4A18, type metadata accessor for CFString);
}

uint64_t sub_260D59B28()
{
  return sub_260D597A4(&qword_26A8E4A20, type metadata accessor for CFString);
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5 = 1.0 - a3;
  float32x4_t v6 = vsubq_f32(a1, a2);
  int8x16_t v7 = (int8x16_t)vmulq_f32(v6, v6);
  float32x4_t v8 = vaddq_f32(a1, a2);
  int8x16_t v9 = (int8x16_t)vmulq_f32(v8, v8);
  float v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  float v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0) {
    sinf(v11);
  }
  if ((float)(v5 * v11) != 0.0) {
    sinf(v5 * v11);
  }
  float v12 = v11 * a3;
  if (v12 != 0.0) {
    sinf(v12);
  }
}

uint64_t VKIStickerEffectType.description.getter(unint64_t a1)
{
  if (a1 > 4) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aNone[8 * a1];
  }
}

uint64_t sub_260D59D38()
{
  return VKIStickerEffectType.description.getter(*v0);
}

uint64_t sub_260D59D88()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_type;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_260D59E1C(uint64_t a1)
{
  float32x4_t v3 = (void *)(v1 + OBJC_IVAR____VKStickerEffectInternal_type);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D59E68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D59F70()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  if (*v1 > 4uLL) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aNone[8 * *v1];
  }
}

uint64_t sub_260D5A03C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5A0D0(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A11C())()
{
  return j_j__swift_endAccess;
}

float sub_260D5A1C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5A25C(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A2B0())()
{
  return j_j__swift_endAccess;
}

float sub_260D5A354()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5A3F0(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A444())()
{
  return j_j__swift_endAccess;
}

float sub_260D5A4E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5A584(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A5D8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5A67C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5A710(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A75C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5A800()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5A894(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5A8E0())()
{
  return j_j__swift_endAccess;
}

float sub_260D5A984()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_normalsRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5AA20(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5AA74())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5AB18()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5ABAC(int a1)
{
  float32x4_t v3 = (_DWORD *)(v1 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5ABF8())()
{
  return j__swift_endAccess;
}

uint64_t sub_260D5ACA0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5AD34(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5AD80())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5AE24()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5AEB8(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5AF04())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5AFA8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5B03C(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B088())()
{
  return j_j__swift_endAccess;
}

float sub_260D5B12C()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5B1C8(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B21C())()
{
  return j_j__swift_endAccess;
}

float sub_260D5B2C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5B35C(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B3B0())()
{
  return j_j__swift_endAccess;
}

double sub_260D5B454()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_260D5B4F0(double a1)
{
  float32x4_t v3 = (double *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B544())()
{
  return j_j__swift_endAccess;
}

double sub_260D5B5E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_260D5B684(double a1)
{
  float32x4_t v3 = (double *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B6D8())()
{
  return j_j__swift_endAccess;
}

float sub_260D5B77C()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5B818(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5B86C())()
{
  return j_j__swift_endAccess;
}

float sub_260D5B910()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_260D5B9AC(float a1)
{
  float32x4_t v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5BA00())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_260D5BAA4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5BB38(char a1)
{
  float32x4_t v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
  uint64_t result = swift_beginAccess();
  *float32x4_t v3 = a1;
  return result;
}

uint64_t (*sub_260D5BB84())()
{
  return j_j__swift_endAccess;
}

double sub_260D5BBE0()
{
  byte_26A8E5398 = 0;
  unk_26A8E539C = xmmword_260D76B20;
  double result = 5.23869072e-11;
  unk_26A8E53AC = 0x3DCCCCCD3F000000;
  qword_26A8E53B8 = 6;
  return result;
}

double sub_260D5BC10()
{
  byte_26A8E53C0 = 1;
  *(_OWORD *)&algn_26A8E53C1[3] = xmmword_260D76B30;
  double result = 5.23869072e-11;
  *(void *)&algn_26A8E53C1[19] = 0x3DCCCCCD3F000000;
  qword_26A8E53E0 = 6;
  return result;
}

uint64_t sub_260D5BC6C()
{
  uint64_t v1 = (float *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  if (*v1 == 0.0
    || (uint64_t v2 = (float *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius), swift_beginAccess(), *v2 == 0.0))
  {
    BOOL v3 = 0;
  }
  else
  {
    float32x4_t v8 = (void *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
    swift_beginAccess();
    BOOL v3 = COERCE_FLOAT(*v8) != 0.0 || COERCE_FLOAT(HIDWORD(*v8)) != 0.0;
  }
  uint64_t v4 = (_DWORD *)(v0 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  if (*v4) {
    return 1;
  }
  float v5 = (unsigned char *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  if (*v5) {
    return 1;
  }
  float32x4_t v6 = (unsigned char *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  if (*v6 == 1) {
    return 1;
  }
  return v3;
}

uint64_t sub_260D5BE00()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D5BE94(char a1)
{
  BOOL v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = a1;
  return result;
}

uint64_t (*sub_260D5BEE0())()
{
  return j_j__swift_endAccess;
}

__n128 sub_260D5BF3C()
{
  if (qword_26A8E48D8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A8E53B8;
  uint64_t v2 = v0 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  __n128 result = (__n128)unk_26A8E539C;
  uint64_t v4 = unk_26A8E53AC;
  *(unsigned char *)uint64_t v2 = byte_26A8E5398;
  *(__n128 *)(v2 + 4) = result;
  *(void *)(v2 + 20) = v4;
  *(void *)(v2 + 32) = v1;
  return result;
}

__n128 sub_260D5C058()
{
  if (qword_26A8E48E0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A8E53E0;
  uint64_t v2 = v0 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  __n128 result = *(__n128 *)&algn_26A8E53C1[3];
  uint64_t v4 = *(void *)&algn_26A8E53C1[19];
  *(unsigned char *)uint64_t v2 = byte_26A8E53C0;
  *(__n128 *)(v2 + 4) = result;
  *(void *)(v2 + 20) = v4;
  *(void *)(v2 + 32) = v1;
  return result;
}

id static StickerEffect.effectWithType(_:)(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      if (qword_26A8E48F0 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_26A8E4B58;
      break;
    case 2:
      if (qword_26A8E48F8 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_26A8E4B60;
      break;
    case 3:
      if (qword_26A8E4900 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_26A8E4B68;
      break;
    case 4:
      if (qword_26A8E4908 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_26A8E4B70;
      break;
    default:
      if (qword_26A8E48E8 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_26A8E4B50;
      break;
  }
  uint64_t v2 = (void *)*v1;
  return v2;
}

uint64_t sub_260D5C304()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  uint64_t v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  char *v1 = 0;
  uint64_t v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
  swift_beginAccess();
  *(_DWORD *)uint64_t v2 = 0;
  BOOL v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha];
  swift_beginAccess();
  *(_DWORD *)BOOL v3 = 0;
  uint64_t v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
  swift_beginAccess();
  *(void *)uint64_t v4 = 0;
  float v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
  swift_beginAccess();
  *(void *)float v5 = 0;
  float32x4_t v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  uint64_t result = swift_beginAccess();
  *(void *)float32x4_t v6 = 0;
  qword_26A8E4B50 = (uint64_t)v0;
  return result;
}

id StickerEffect.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static StickerEffect.none.getter()
{
  return sub_260D5CAC8(&qword_26A8E48E8, (void **)&qword_26A8E4B50);
}

uint64_t sub_260D5C4A8()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  id v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  char *v1 = 1;
  uint64_t v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *uint64_t v2 = 0;
  BOOL v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier];
  swift_beginAccess();
  *(_DWORD *)BOOL v3 = 1075838976;
  uint64_t v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier];
  swift_beginAccess();
  *(_DWORD *)uint64_t v4 = 1075838976;
  float v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier];
  swift_beginAccess();
  *(_DWORD *)float v5 = 0x40000000;
  float32x4_t v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  uint64_t result = swift_beginAccess();
  *(void *)float32x4_t v6 = 1;
  qword_26A8E4B58 = (uint64_t)v0;
  return result;
}

id static StickerEffect.stroke.getter()
{
  return sub_260D5CAC8(&qword_26A8E48F0, (void **)&qword_26A8E4B58);
}

char *sub_260D5C620()
{
  uint64_t result = sub_260D5C640();
  qword_26A8E4B60 = (uint64_t)result;
  return result;
}

char *sub_260D5C640()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  id v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  char *v1 = 0;
  uint64_t v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
  swift_beginAccess();
  *uint64_t v2 = 1;
  BOOL v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *BOOL v3 = 0;
  uint64_t v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
  swift_beginAccess();
  *(_DWORD *)uint64_t v4 = 0;
  float v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha];
  swift_beginAccess();
  *(_DWORD *)float v5 = 0;
  float32x4_t v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
  swift_beginAccess();
  *(void *)float32x4_t v6 = 0;
  int8x16_t v7 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
  swift_beginAccess();
  *(void *)int8x16_t v7 = 0;
  float32x4_t v8 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  swift_beginAccess();
  *(void *)float32x4_t v8 = 2;
  return v0;
}

id static StickerEffect.comic.getter()
{
  return sub_260D5CAC8(&qword_26A8E48F8, (void **)&qword_26A8E4B60);
}

uint64_t sub_260D5C804()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  id v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  char *v1 = 0;
  uint64_t v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isPuffy];
  swift_beginAccess();
  *uint64_t v2 = 1;
  BOOL v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *BOOL v3 = 0;
  uint64_t v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v4 = 3;
  qword_26A8E4B68 = (uint64_t)v0;
  return result;
}

id static StickerEffect.puffy.getter()
{
  return sub_260D5CAC8(&qword_26A8E4900, (void **)&qword_26A8E4B68);
}

char *sub_260D5C930()
{
  uint64_t result = sub_260D5C950();
  qword_26A8E4B70 = (uint64_t)result;
  return result;
}

char *sub_260D5C950()
{
  uint64_t v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  id v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  char *v1 = 1;
  uint64_t v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_iridescence];
  swift_beginAccess();
  *(_DWORD *)uint64_t v2 = 3;
  BOOL v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *BOOL v3 = 0;
  uint64_t v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier];
  swift_beginAccess();
  *(_DWORD *)uint64_t v4 = 0x40000000;
  float v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier];
  swift_beginAccess();
  *(_DWORD *)float v5 = 0x40000000;
  float32x4_t v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier];
  swift_beginAccess();
  *(_DWORD *)float32x4_t v6 = 0x40000000;
  int8x16_t v7 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  swift_beginAccess();
  *(void *)int8x16_t v7 = 4;
  return v0;
}

id static StickerEffect.iridescent.getter()
{
  return sub_260D5CAC8(&qword_26A8E4908, (void **)&qword_26A8E4B70);
}

id sub_260D5CAC8(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  BOOL v3 = *a2;
  return v3;
}

id sub_260D5CB38(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  float v5 = *a4;
  return v5;
}

id StickerEffect.init()()
{
  *(void *)&v0[OBJC_IVAR____VKStickerEffectInternal_type] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isStroked] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_strokeRadius] = 1023745720;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius] = 994352038;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier] = 1065353216;
  v0[OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isPuffy] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_normalsRadius] = 1021396910;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_iridescence] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isBrushed] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius] = 1017370378;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha] = 1046562734;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset] = 0xBBA3D70A00000000;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier] = 1065353216;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier] = 1065353216;
  v0[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled] = 0;
  uint64_t v1 = OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  uint64_t v2 = qword_26A8E48D8;
  BOOL v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = &v3[v1];
  uint64_t v5 = qword_26A8E53B8;
  long long v6 = unk_26A8E539C;
  uint64_t v7 = unk_26A8E53AC;
  char *v4 = byte_26A8E5398;
  *(_OWORD *)(v4 + 4) = v6;
  *(void *)(v4 + 20) = v7;
  *((void *)v4 + 4) = v5;
  v3[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled] = 1;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for StickerEffect();
  return objc_msgSendSuper2(&v9, sel_init);
}

id StickerEffect.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerEffect();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerEffect()
{
  return self;
}

uint64_t sub_260D5CDE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  BOOL v3 = (void *)(*a1 + OBJC_IVAR____VKStickerEffectInternal_type);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_260D5CE3C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  BOOL v3 = (void *)(*a2 + OBJC_IVAR____VKStickerEffectInternal_type);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = v2;
  return result;
}

uint64_t sub_260D5CE8C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isStroked, a2);
}

uint64_t sub_260D5CE98(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isStroked);
}

float sub_260D5CEA4@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_strokeRadius, a2);
}

uint64_t sub_260D5CEB0(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
}

float sub_260D5CEBC@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius, a2);
}

uint64_t sub_260D5CEC8(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
}

float sub_260D5CED4@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier, a2);
}

uint64_t sub_260D5CEE0(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
}

uint64_t sub_260D5CEEC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier, a2);
}

uint64_t sub_260D5CEF8(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
}

uint64_t sub_260D5CF04@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isPuffy, a2);
}

uint64_t sub_260D5CF10(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isPuffy);
}

float sub_260D5CF1C@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_normalsRadius, a2);
}

uint64_t sub_260D5CF28(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
}

uint64_t sub_260D5CF34@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  BOOL v3 = (_DWORD *)(*a1 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_260D5CF88(int *a1, void *a2)
{
  int v2 = *a1;
  BOOL v3 = (_DWORD *)(*a2 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = v2;
  return result;
}

uint64_t sub_260D5CFD8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke, a2);
}

uint64_t sub_260D5CFE4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
}

uint64_t sub_260D5CFF0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isBrushed, a2);
}

uint64_t sub_260D5CFFC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isBrushed);
}

uint64_t sub_260D5D008@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke, a2);
}

uint64_t sub_260D5D014(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
}

float sub_260D5D020@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowRadius, a2);
}

uint64_t sub_260D5D02C(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
}

float sub_260D5D038@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowAlpha, a2);
}

uint64_t sub_260D5D044(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
}

double sub_260D5D050@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_42Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowOffset, a2);
}

uint64_t sub_260D5D05C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_43Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
}

double sub_260D5D068@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_42Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowParallax, a2);
}

double keypath_get_42Tm@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_260D5D0C4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_43Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
}

uint64_t keypath_set_43Tm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  long long v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  void *v6 = v5;
  return result;
}

float sub_260D5D124@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier, a2);
}

uint64_t sub_260D5D130(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
}

float sub_260D5D13C@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_18Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier, a2);
}

float keypath_get_18Tm@<S0>(void *a1@<X0>, void *a2@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v4 = (float *)(*a1 + *a2);
  swift_beginAccess();
  float result = *v4;
  *a3 = *(_DWORD *)v4;
  return result;
}

uint64_t sub_260D5D198(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_19Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
}

uint64_t keypath_set_19Tm(int *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v5 = *a1;
  long long v6 = (_DWORD *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  _DWORD *v6 = v5;
  return result;
}

uint64_t sub_260D5D1F8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isComicEnabled, a2);
}

uint64_t sub_260D5D204(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
}

uint64_t sub_260D5D210@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled, a2);
}

uint64_t keypath_get_16Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_260D5D26C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
}

uint64_t keypath_set_17Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  long long v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

uint64_t method lookup function for StickerEffect(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StickerEffect);
}

uint64_t dispatch thunk of StickerEffect.type.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of StickerEffect.type.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of StickerEffect.type.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of StickerEffect.requiresDeviceMotion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of StickerEffect.applyComicParameters()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of StickerEffect.applyComicInkParameters()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x300))();
}

id sub_260D5E19C(void *a1)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = vcvt_f32_f64(*(float64x2_t *)(v1 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, v3, 8, 0);
}

id sub_260D5E214()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicColorStrokeShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicColorStrokeShader()
{
  return self;
}

id sub_260D5E26C(void *a1)
{
  return sub_260D5E378(a1, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor);
}

id sub_260D5E2D4()
{
  return sub_260D5E424(type metadata accessor for StickerComicBFBlurPassOneShader);
}

uint64_t type metadata accessor for StickerComicBFBlurPassOneShader()
{
  return self;
}

id sub_260D5E310(void *a1)
{
  return sub_260D5E378(a1, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor);
}

id sub_260D5E378(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  float v4 = *(double *)(v3 + *a2);
  float v5 = *(double *)(v3 + *a3);
  float32x2_t v6 = vcvt_f32_f64(*(float64x2_t *)(v3 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  *(float *)float32x4_t v8 = v4;
  *(float *)&v8[1] = v5;
  float32x2_t v9 = v6;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, v8, 16, 0);
}

id sub_260D5E40C()
{
  return sub_260D5E424(type metadata accessor for StickerComicBFBlurPassTwoShader);
}

id sub_260D5E424(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicBFBlurPassTwoShader()
{
  return self;
}

uint64_t sub_260D5E480(void *a1)
{
  uint64_t v3 = v1;
  v20[1] = *(id *)MEMORY[0x263EF8340];
  if (qword_26A8E48E8 != -1) {
    swift_once();
  }
  float v5 = (void *)qword_26A8E4B50;
  *(void *)(v1 + 16) = a1;
  *(_OWORD *)(v1 + 32) = xmmword_260D76540;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = v5;
  *(_DWORD *)(v1 + 64) = 1065353216;
  *(void *)(v1 + 72) = 0x3F0000003F000000;
  *(_DWORD *)(v1 + 80) = 1065353216;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 168) = 0u;
  type metadata accessor for StickerEffectRenderer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = self;
  id v8 = v5;
  swift_unknownObjectRetain();
  id v9 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v20[0] = 0;
  id v10 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v9, v20);

  id v11 = v20[0];
  if (v10)
  {
    *(void *)(v3 + 24) = v10;
    type metadata accessor for StickerShaderAlphaToLumaGenerator();
    swift_allocObject();
    swift_unknownObjectRetain();
    id v12 = v11;
    swift_unknownObjectRetain();
    uint64_t v13 = sub_260D62EFC(a1, v10);
    BOOL v14 = v2 == 0;
    if (!v2)
    {
      *(void *)(v3 + 184) = v13;
      type metadata accessor for StickerShaderStrokeGenerator();
      swift_allocObject();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      *(void *)(v3 + 192) = sub_260D74380(a1, v10);
      type metadata accessor for StickerShaderNormalGenerator();
      swift_allocObject();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      *(void *)(v3 + 200) = sub_260D62028(a1, v10);
      type metadata accessor for StickerShaderShadowGenerator();
      uint64_t v18 = swift_allocObject();
      *(_DWORD *)(v18 + 24) = 1036831949;
      *(void *)(v18 + 32) = 0;
      *(void *)(v18 + 40) = 0;
      *(void *)(v18 + 48) = 0;
      *(void *)(v18 + 56) = 10;
      *(void *)(v18 + 16) = a1;
      *(void *)(v3 + 208) = v18;
      type metadata accessor for StickerComicRenderer();
      swift_allocObject();
      uint64_t v19 = swift_unknownObjectRetain();
      *(void *)(v3 + 216) = StickerComicRenderer.init(device:)(v19);
      return v3;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v15 = v20[0];
    sub_260D75580();

    swift_willThrow();
    BOOL v14 = 0;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v16 = *(void **)(v3 + 48);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v14) {
    swift_release();
  }
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_260D5E874(void *a1, uint64_t a2, uint64_t a3)
{
  float v5 = *(void **)(v3 + 48);
  if (!v5) {
    return;
  }
  uint64_t v6 = v3;
  uint64_t v54 = v4;
  id v9 = (char *)*(id *)(v3 + 56);
  id v10 = v5;
  id v12 = (__CVBuffer *)sub_260D5FD34(v10, a2, a3);
  uint64_t v13 = v11;
  BOOL v14 = *(void **)(v3 + 136);
  if (!v14)
  {
    CVPixelBufferRef v37 = sub_260D605B0(v10, v12, v11, *(void **)(v3 + 16));
    if (v4) {
      goto LABEL_23;
    }
    uint64_t v54 = 0;
    *(void *)(v3 + 136) = v37;
    swift_unknownObjectRelease();
    *(void *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    BOOL v14 = *(void **)(v3 + 136);
    if (!v14)
    {
LABEL_23:

      return;
    }
  }
  v52 = v10;
  if (*(void *)(v3 + 144)
    || (id v15 = &v9[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled], swift_beginAccess(), (*v15 & 1) == 0))
  {
    swift_unknownObjectRetain();
  }
  else
  {
    uint64_t v16 = self;
    swift_unknownObjectRetain();
    id v17 = objc_msgSend(v16, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, v12, v13, 0);
    objc_msgSend(v17, sel_setStorageMode_, 2);
    objc_msgSend(v17, sel_setUsage_, 5);
    *(void *)(v6 + 144) = objc_msgSend(*(id *)(v6 + 16), sel_newTextureWithDescriptor_, v17);
    swift_unknownObjectRelease();
    uint64_t v18 = *(void **)(v6 + 144);
    if (!v18)
    {

      swift_unknownObjectRelease();
      return;
    }
    uint64_t v19 = *(void *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 32];
    v55[0] = v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters];
    long long v56 = *(_OWORD *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 4];
    uint64_t v57 = *(void *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 20];
    uint64_t v58 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    sub_260D648E0(v14, v18, v55, a1, v20);
    if (v54)
    {

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_release();
      return;
    }
    swift_unknownObjectRelease();

    swift_release();
  }
  v21.n64_u64[0] = sub_260D60CBC(*(void *)(v6 + 56), (uint64_t)v12, v13, a2, a3, *(float *)(v6 + 64)).n64_u64[0];
  unint64_t v22 = v21.n64_u64[0];
  if (!*(void *)(v6 + 152))
  {
    uint64_t v23 = *(__n64 **)(v6 + 184);
    v23[7].n64_u64[0] = v21.n64_u64[0];
    v23[6].n64_u64[0] = (unint64_t)v14;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    float32x2_t v24 = *(void **)(v6 + 184);
    uint64_t v26 = v24[8];
    uint64_t v25 = v24[9];
    v24[8] = a2;
    v24[9] = a3;
    if (v26 != a2 || v25 != a3)
    {
      v24[10] = 0;
      swift_unknownObjectRelease();
    }
    swift_retain();
    sub_260D632F0(a1);
    uint64_t v28 = v27;
    swift_release();
    *(void *)(v6 + 152) = v28;
    swift_unknownObjectRelease();
    *(void *)(v6 + 160) = 0;
    swift_unknownObjectRelease();
  }
  uint64_t v29 = &v9[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  if (*v29 == 1 && !*(void *)(v6 + 160))
  {
    float v38 = sub_260D74FD0((uint64_t)v9, a2, a3, *(float *)(v6 + 64));
    uint64_t v39 = *(void *)(v6 + 192);
    *(void *)(v39 + 64) = v22;
    *(float *)(v39 + 48) = v38;
    *(_DWORD *)(v39 + 52) = v40;
    *(void *)(v39 + 56) = *(void *)(v6 + 152);
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    float v41 = *(void **)(v6 + 192);
    uint64_t v43 = v41[9];
    uint64_t v42 = v41[10];
    v41[9] = a2;
    v41[10] = a3;
    if (v43 != a2 || v42 != a3)
    {
      v41[12] = 0;
      swift_unknownObjectRelease();
    }
    swift_retain();
    sub_260D74804(a1);
    uint64_t v45 = v44;
    swift_release();
    *(void *)(v6 + 160) = v45;
    swift_unknownObjectRelease();
    *(void *)(v6 + 176) = 0;
    swift_unknownObjectRelease();
    *(void *)(v6 + 168) = 0;
    swift_unknownObjectRelease();
    if (*(void *)(v6 + 176)) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
  if (!*(void *)(v6 + 176))
  {
LABEL_17:
    uint64_t v30 = *(void *)(v6 + 208);
    uint64_t v31 = (float *)&v9[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    float v32 = *v31;
    float v33 = *(float *)(v30 + 24);
    *(float *)(v30 + 24) = *v31;
    if (v32 != v33)
    {
      uint64_t v34 = *(void **)(v30 + 48);
      *(void *)(v30 + 48) = 0;
    }
    uint64_t v35 = *(void *)(v6 + 160);
    if (!v35)
    {
      uint64_t v35 = *(void *)(v6 + 152);
      swift_unknownObjectRetain();
    }
    swift_unknownObjectRetain();
    swift_retain();
    sub_260D62A90(v35);
    swift_release();
    swift_retain();
    uint64_t v36 = sub_260D62B14((uint64_t)a1);
    swift_release();
    *(void *)(v6 + 176) = v36;
    swift_unknownObjectRelease();
    *(void *)(v6 + 168) = 0;
    swift_unknownObjectRelease();
  }
LABEL_30:
  float32x4_t v46 = &v9[OBJC_IVAR____VKStickerEffectInternal_isPuffy];
  swift_beginAccess();
  if (*v46 == 1 && !*(void *)(v6 + 168))
  {
    uint64_t v47 = *(void *)(v6 + 200);
    float32x4_t v48 = &v9[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    *(_DWORD *)(v47 + 48) = *(_DWORD *)v48;
    uint64_t v49 = *(void *)(v47 + 56);
    *(void *)(v47 + 56) = *(void *)(v6 + 152);
    swift_unknownObjectRetain_n();
    swift_retain();
    sub_260D61FC4(v49);
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_retain();
    sub_260D62430(a1);
    uint64_t v51 = v50;
    swift_release();

    swift_unknownObjectRelease();
    *(void *)(v6 + 168) = v51;
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

unint64_t sub_260D5EE94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E4F28);
  uint64_t v2 = sub_260D75820();
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
    sub_260D60E14(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_260D5F50C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_260D60E7C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    void v3[2] = v12;
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

unint64_t sub_260D5EFB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E4F18);
  uint64_t v2 = (void *)sub_260D75820();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_260D5F50C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

uint64_t sub_260D5F0B0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void **)(v0 + 48);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_260D5F16C()
{
  sub_260D5F0B0();
  return MEMORY[0x270FA0228](v0, 224, 15);
}

uint64_t type metadata accessor for StickerEffectRenderer()
{
  return self;
}

void destroy for StickerEffectRenderer.Parameters(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a1 + 16);
  id v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  uint64_t v7 = *(void **)(a2 + 24);
  char v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy52_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  long long v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for StickerEffectRenderer.Parameters(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 52)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StickerEffectRenderer.Parameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 52) = 1;
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
    *(unsigned char *)(result + 52) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerEffectRenderer.Parameters()
{
  return &type metadata for StickerEffectRenderer.Parameters;
}

void *sub_260D5F3FC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F40);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_260D5F71C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_260D5F50C(uint64_t a1)
{
  sub_260D758C0();
  type metadata accessor for CFString(0);
  sub_260D61EC8(&qword_26A8E4F20, type metadata accessor for CFString);
  sub_260D755A0();
  uint64_t v2 = sub_260D758E0();
  return sub_260D5F5C0(a1, v2);
}

unint64_t sub_260D5F5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_260D61EC8(&qword_26A8E4F20, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_260D75590();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_260D75590();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

char *sub_260D5F71C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    id v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)sub_260D75830();
  __break(1u);
  return result;
}

void *sub_260D5F808()
{
  uint64_t v1 = (unsigned char *)(v0[7] + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  __n128 result = (void *)swift_beginAccess();
  if (*v1 != 1)
  {
    v0[11] = 4;
    uint64_t v26 = (void *)v0[2];
    __asm { FMOV            V0.2S, #-1.0 }
    v42[0] = _D0;
    v42[1] = 0xBF8000003F800000;
    __asm { FMOV            V8.2S, #1.0 }
    v42[2] = 0x3F800000BF800000;
    v42[3] = _D8;
    id v33 = objc_msgSend(v26, sel_newBufferWithBytes_length_options_, v42, 32, 0);
    if (!v33
      || (v0[12] = v33,
          swift_unknownObjectRelease(),
          v40[0] = 0x3F80000000000000,
          v40[1] = _D8,
          v40[2] = 0,
          v40[3] = 1065353216,
          (id v33 = objc_msgSend(v26, sel_newBufferWithBytes_length_options_, v40, 32, 0)) == 0))
    {
LABEL_38:
      type metadata accessor for MTLCommandBufferError((uint64_t)v33);
      uint64_t v41 = 1;
      sub_260D71864(MEMORY[0x263F8EE78]);
      sub_260D61EC8((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
      sub_260D75560();
      return (void *)swift_willThrow();
    }
    v0[13] = v33;
    return (void *)swift_unknownObjectRelease();
  }
  int64_t v3 = *(void *)(MEMORY[0x263F8EE78] + 16);
  int64_t v4 = v3 + 2;
  if (!__OFADD__(v3, 2))
  {
    char v5 = (void *)MEMORY[0x263F8EE78];
    float v6 = 0.0;
    uint64_t v7 = 1;
    float v39 = -1.0;
    char v8 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      __n128 result = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!result || (unint64_t v9 = v5[3], v10 = v9 >> 1, (uint64_t)(v9 >> 1) < v4))
      {
        if (v3 <= v4) {
          int64_t v11 = v4;
        }
        else {
          int64_t v11 = v3;
        }
        __n128 result = sub_260D5F3FC(result, v11, 1, v5);
        char v5 = result;
        unint64_t v9 = result[3];
        unint64_t v10 = v9 >> 1;
      }
      unint64_t v12 = v5[2];
      unint64_t v13 = v12 + 1;
      if (v10 <= v12)
      {
        __n128 result = sub_260D5F3FC((void *)(v9 > 1), v12 + 1, 1, v5);
        char v5 = result;
        unint64_t v9 = result[3];
        unint64_t v10 = v9 >> 1;
      }
      *(float *)&uint64_t v14 = v39;
      v5[2] = v13;
      v5[v12 + 4] = __PAIR64__(-1.0, LODWORD(v39));
      int64_t v15 = v12 + 2;
      if ((uint64_t)v10 < v15)
      {
        __n128 result = sub_260D5F3FC((void *)(v9 > 1), v15, 1, v5);
        *(float *)&uint64_t v14 = v39;
        char v5 = result;
      }
      HIDWORD(v14) = 1.0;
      v5[2] = v15;
      v5[v13 + 4] = v14;
      int64_t v16 = v8[2];
      int64_t v17 = v16 + 2;
      if (__OFADD__(v16, 2))
      {
        __break(1u);
        goto LABEL_42;
      }
      __n128 result = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!result || (unint64_t v18 = v8[3], v19 = v18 >> 1, (uint64_t)(v18 >> 1) < v17))
      {
        if (v16 <= v17) {
          int64_t v20 = v16 + 2;
        }
        else {
          int64_t v20 = v16;
        }
        __n128 result = sub_260D5F3FC(result, v20, 1, v8);
        char v8 = result;
        unint64_t v18 = result[3];
        unint64_t v19 = v18 >> 1;
      }
      unint64_t v21 = v8[2];
      unint64_t v22 = v21 + 1;
      if (v19 <= v21)
      {
        __n128 result = sub_260D5F3FC((void *)(v18 > 1), v21 + 1, 1, v8);
        char v8 = result;
        unint64_t v18 = result[3];
        unint64_t v19 = v18 >> 1;
      }
      float v23 = v6 / 200.0;
      *(float *)&uint64_t v24 = v6 / 200.0;
      HIDWORD(v24) = 1.0;
      _DWORD v8[2] = v22;
      v8[v21 + 4] = v24;
      int64_t v25 = v21 + 2;
      if ((uint64_t)v19 < v25)
      {
        __n128 result = sub_260D5F3FC((void *)(v18 > 1), v25, 1, v8);
        float v23 = v6 / 200.0;
        char v8 = result;
      }
      _DWORD v8[2] = v25;
      v8[v22 + 4] = LODWORD(v23);
      if (v7 == 201) {
        break;
      }
      float v6 = (float)v7;
      float v39 = (float)((float)(v6 + v6) / 200.0) + -1.0;
      int64_t v3 = v5[2];
      ++v7;
      int64_t v4 = v3 + 2;
      if (__OFADD__(v3, 2)) {
        goto LABEL_42;
      }
    }
    v0[11] = v5[2];
    unint64_t v34 = v5[2];
    if (v34 >> 60) {
      goto LABEL_43;
    }
    uint64_t v35 = (void *)v0[2];
    id v36 = objc_msgSend(v35, sel_newBufferWithBytes_length_options_, v5 + 4, 8 * v34, 0);
    swift_bridgeObjectRelease();
    if (!v36)
    {
      swift_bridgeObjectRelease();
      id v33 = 0;
      goto LABEL_38;
    }
    v0[12] = v36;
    swift_unknownObjectRetain();
    __n128 result = (void *)swift_unknownObjectRelease();
    unint64_t v37 = v8[2];
    if (v37 >> 60) {
      goto LABEL_44;
    }
    id v38 = objc_msgSend(v35, sel_newBufferWithBytes_length_options_, v8 + 4, 8 * v37, 0);
    swift_bridgeObjectRelease();
    if (v38)
    {
      swift_unknownObjectRelease();
      v0[13] = v38;
    }
    else
    {
      type metadata accessor for MTLCommandBufferError(0);
      uint64_t v41 = 1;
      sub_260D71864(MEMORY[0x263F8EE78]);
      sub_260D61EC8((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
      sub_260D75560();
      swift_willThrow();
    }
    return (void *)swift_unknownObjectRelease();
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

id sub_260D5FD34(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, sel_size);
  double v7 = v6;
  id result = objc_msgSend(a1, sel_scale);
  double v10 = v7 * v9;
  if ((~COERCE__INT64(v7 * v9) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  objc_msgSend(a1, sel_size);
  double v12 = v11;
  id result = objc_msgSend(a1, sel_scale);
  double v14 = v12 * v13;
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  float v15 = (float)((float)(uint64_t)v14 / (float)(uint64_t)v10) / (float)((float)a3 / (float)a2);
  float v16 = 1.0;
  float v17 = 1.0 / v15;
  if (v15 <= 1.0)
  {
    float v17 = 1.0;
    float v16 = v15;
  }
  float v18 = ceilf(v17 * (float)a2);
  if ((~LODWORD(v18) & 0x7F800000) == 0) {
    goto LABEL_22;
  }
  if (v18 <= -9.2234e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v18 >= 9.2234e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  float v19 = ceilf(v16 * (float)a3);
  if ((~LODWORD(v19) & 0x7F800000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v19 <= -9.2234e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v19 < 9.2234e18) {
    return (id)(uint64_t)v18;
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_260D5FEFC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  double v6 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  char v46 = *v6;
  double v7 = (int *)(a3 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  int v45 = *v7;
  char v8 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  char v44 = *v8;
  double v9 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  char v43 = *v9;
  double v10 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  swift_beginAccess();
  char v42 = *v10;
  double v11 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  swift_beginAccess();
  char v41 = *v11;
  double v12 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  swift_beginAccess();
  char v40 = *v12;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128B0]), sel_init);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v46, 53, 0);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v45, 29, 1);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v44, 53, 2);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v43, 53, 3);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v42, 53, 4);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v41, 53, 5);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v40, 53, 6);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129C0]), sel_init);
  float v15 = (void *)sub_260D75650();
  id v39 = 0;
  id v16 = objc_msgSend(a2, sel_newFunctionWithName_constantValues_error_, v15, v13, &v39);

  if (!v16
    || (id v17 = v39,
        objc_msgSend(v14, sel_setVertexFunction_, v16),
        swift_unknownObjectRelease(),
        float v18 = (void *)sub_260D75650(),
        id v39 = 0,
        id v19 = objc_msgSend(a2, sel_newFunctionWithName_constantValues_error_, v18, v13, &v39),
        v18,
        !v19))
  {
LABEL_13:
    id v38 = v39;
    sub_260D75580();

    swift_willThrow();
    return;
  }
  id v20 = v39;
  objc_msgSend(v14, sel_setFragmentFunction_, v19);
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(v14, sel_colorAttachments);
  id v22 = objc_msgSend(v21, sel_objectAtIndexedSubscript_, 0);

  if (!v22)
  {
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v22, sel_setPixelFormat_, 80);

  id v23 = objc_msgSend(v14, sel_colorAttachments);
  id v24 = objc_msgSend(v23, sel_objectAtIndexedSubscript_, 0);

  if (!v24)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v24, sel_setBlendingEnabled_, 1);

  id v25 = objc_msgSend(v14, sel_colorAttachments);
  id v26 = objc_msgSend(v25, sel_objectAtIndexedSubscript_, 0);

  if (!v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v26, sel_setRgbBlendOperation_, 0);

  id v27 = objc_msgSend(v14, sel_colorAttachments);
  id v28 = objc_msgSend(v27, sel_objectAtIndexedSubscript_, 0);

  if (!v28)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v28, sel_setSourceRGBBlendFactor_, 4);

  id v29 = objc_msgSend(v14, sel_colorAttachments);
  id v30 = objc_msgSend(v29, sel_objectAtIndexedSubscript_, 0);

  if (!v30)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  objc_msgSend(v30, sel_setDestinationRGBBlendFactor_, 5);

  id v31 = objc_msgSend(v14, sel_colorAttachments);
  id v32 = objc_msgSend(v31, sel_objectAtIndexedSubscript_, 0);

  if (!v32)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(v32, sel_setAlphaBlendOperation_, 0);

  id v33 = objc_msgSend(v14, sel_colorAttachments);
  id v34 = objc_msgSend(v33, sel_objectAtIndexedSubscript_, 0);

  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v34, sel_setSourceAlphaBlendFactor_, 1);

  id v35 = objc_msgSend(v14, sel_colorAttachments);
  id v36 = objc_msgSend(v35, sel_objectAtIndexedSubscript_, 0);

  if (v36)
  {
    objc_msgSend(v36, sel_setDestinationAlphaBlendFactor_, 5);

    objc_msgSend(v14, sel_setDepthAttachmentPixelFormat_, 252);
    id v39 = 0;
    if (objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v14, &v39))
    {
      id v37 = v39;

      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
}

CVPixelBufferRef sub_260D605B0(void *a1, CVPixelBufferRef a2, int64_t a3, void *a4)
{
  cacheOut[1] = *(CVMetalTextureCacheRef *)MEMORY[0x263EF8340];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  cacheOut[0] = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVReturn v10 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a4, 0, cacheOut);
  CVMetalTextureCacheRef v11 = cacheOut[0];
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = cacheOut[0] == 0;
  }
  if (v12)
  {
    CVReturn v13 = v10;
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v14 = v13;
    *(unsigned char *)(v14 + 4) = 0;
    swift_willThrow();

LABEL_31:
    return a2;
  }
  id v59 = a1;
  CGColorSpaceRef v63 = DeviceRGB;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260D76CB0;
  id v16 = (void *)*MEMORY[0x263F04240];
  uint64_t v17 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F04240];
  *(void *)(inited + 40) = a2;
  int64_t v61 = (int64_t)a2;
  a2 = (CVPixelBufferRef)*MEMORY[0x263F04118];
  *(void *)(inited + 64) = v17;
  *(void *)(inited + 72) = a2;
  int64_t v60 = a3;
  *(void *)(inited + 80) = a3;
  float v18 = (void *)*MEMORY[0x263F04180];
  *(void *)(inited + 104) = v17;
  *(void *)(inited + 112) = v18;
  uint64_t v19 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 120) = 1111970369;
  CFAllocatorRef v64 = v9;
  id v20 = (void *)*MEMORY[0x263F040A0];
  *(void *)(inited + 144) = v19;
  *(void *)(inited + 152) = v20;
  uint64_t v21 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 160) = 1;
  id v22 = (void *)*MEMORY[0x263F04090];
  *(void *)(inited + 184) = v21;
  *(void *)(inited + 192) = v22;
  *(unsigned char *)(inited + 200) = 1;
  id v23 = (void *)*MEMORY[0x263F04158];
  *(void *)(inited + 224) = v21;
  *(void *)(inited + 232) = v23;
  *(unsigned char *)(inited + 240) = 1;
  id v24 = (void *)*MEMORY[0x263F04130];
  *(void *)(inited + 264) = v21;
  *(void *)(inited + 272) = v24;
  CVMetalTextureCacheRef textureCache = v11;
  id v25 = v16;
  id v26 = a2;
  id v27 = v18;
  id v28 = v20;
  id v29 = v22;
  id v30 = v23;
  id v31 = v24;
  unint64_t v32 = sub_260D5EE94(MEMORY[0x263F8EE78]);
  *(void *)(inited + 304) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F00);
  *(void *)(inited + 280) = v32;
  sub_260D5EE94(inited);
  type metadata accessor for CFString(0);
  sub_260D61EC8((unint64_t *)&qword_26A8E4A18, type metadata accessor for CFString);
  CFDictionaryRef v33 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E4F10);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_260D76CC0;
  id v35 = (void *)*MEMORY[0x263F041B0];
  *(void *)(v34 + 32) = *MEMORY[0x263F041B0];
  *(void *)(v34 + 40) = 1;
  id v36 = v35;
  sub_260D5EFB0(v34);
  CFDictionaryRef v37 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  CVPixelBufferPoolRef poolOut = 0;
  CVReturn v38 = CVPixelBufferPoolCreate(v64, v37, v33, &poolOut);
  CVReturn v39 = v38;
  if (v38 || !poolOut)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v53 = v39;
    *(unsigned char *)(v53 + 4) = 0;
    swift_willThrow();

LABEL_30:
    goto LABEL_31;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  char v40 = poolOut;
  CVReturn v41 = CVPixelBufferPoolCreatePixelBuffer(v64, v40, &pixelBufferOut);
  if (v41 || !pixelBufferOut)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v54 = v41;
    *(unsigned char *)(v54 + 4) = 0;
    swift_willThrow();
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  a2 = pixelBufferOut;
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a2);
  if (!BaseAddress)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v55 = 0;
LABEL_27:
    *(unsigned char *)(v55 + 4) = 1;
    swift_willThrow();

    goto LABEL_28;
  }
  char v43 = BaseAddress;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  int v45 = CGBitmapContextCreate(v43, v61, v60, 8uLL, BytesPerRow, v63, 0x2002u);
  if (!v45)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v55 = 1;
    goto LABEL_27;
  }
  char v46 = v45;
  double v47 = (double)v60;
  CGContextTranslateCTM(v45, 0.0, (double)v60);
  CGContextScaleCTM(v46, 1.0, -1.0);
  UIGraphicsPushContext(v46);
  double v48 = (double)v61;
  objc_msgSend(v59, sel_drawInRect_, 0.0, 0.0, (double)v61, (double)v60);
  UIGraphicsPopContext();
  CVPixelBufferUnlockBaseAddress(a2, 0);
  CVMetalTextureRef textureOut = 0;
  if ((double)v61 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v48 >= 9.22337204e18)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((*(void *)&v48 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v47 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_38;
  }
  if (v47 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
  }
  if (v47 >= 9.22337204e18) {
    goto LABEL_40;
  }
  CVReturn v49 = CVMetalTextureCacheCreateTextureFromImage(v64, textureCache, a2, 0, MTLPixelFormatBGRA8Unorm, (uint64_t)v48, (uint64_t)v47, 0, &textureOut);
  if (v49 || !textureOut)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v57 = v49;
    *(unsigned char *)(v57 + 4) = 0;
    swift_willThrow();

LABEL_35:
    goto LABEL_29;
  }
  int8x16_t v65 = v46;
  CVPixelBufferRef v50 = a2;
  uint64_t v51 = textureOut;
  v52 = (__CVBuffer *)CVMetalTextureGetTexture(v51);
  if (!v52)
  {
    sub_260D60DC0();
    swift_allocError();
    *(_DWORD *)uint64_t v58 = 2;
    *(unsigned char *)(v58 + 4) = 1;
    swift_willThrow();

    goto LABEL_35;
  }
  a2 = v52;

  return a2;
}

__n64 sub_260D60CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6)
{
  float v12 = sub_260D74FD0(a1, a4, a5, a6);
  float v14 = v13;
  float v15 = sub_260D62D50(a1, a4, a5, a6);
  float v18 = (float)((float)a3 / (float)a2) / (float)((float)a5 / (float)a4);
  float v19 = 1.0 / v18;
  if (v18 <= 1.0) {
    float v19 = 1.0;
  }
  float v20 = fabsf(*(float *)v16.i32);
  float v21 = fabsf(*(float *)v17.i32);
  float32x2_t v23 = vabs_f32((float32x2_t)vzip2_s32(v16, v17));
  float32x2_t v22 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
  v22.f32[0] = v20;
  v23.f32[0] = v21;
  if (v18 > 1.0) {
    float v18 = 1.0;
  }
  float32x2_t v24 = vadd_f32(v22, v23);
  if (v24.f32[0] <= v24.f32[1]) {
    v24.f32[0] = v24.f32[1];
  }
  float v25 = 1.0 - (float)((float)(v15 + v24.f32[0]) + (float)(v15 + v24.f32[0]));
  float v26 = 1.0 - (float)((float)(v12 + v14) + (float)(v12 + v14));
  float v27 = v26 * v18;
  result.n64_f32[0] = v25 * (float)(v26 * v19);
  result.n64_f32[1] = v25 * v27;
  return result;
}

unint64_t sub_260D60DC0()
{
  unint64_t result = qword_26A8E4EF0;
  if (!qword_26A8E4EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4EF0);
  }
  return result;
}

uint64_t sub_260D60E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_260D60E7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

float sub_260D60E8C(uint64_t a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_260D74FD0(a1, a5, a6, a2);
  float v10 = sub_260D62D50(a1, a5, a6, a2);
  float v12 = fabsf(*(float *)v11.i32);
  float32x2_t v14 = vabs_f32((float32x2_t)vzip2_s32(v11, v13));
  float32x2_t v15 = (float32x2_t)vdup_lane_s32((int32x2_t)v14, 0);
  v15.f32[0] = v12;
  v14.i32[0] = fabsf(*(float *)v13.i32);
  float32x2_t v16 = vadd_f32(v15, v14);
  if (v16.f32[0] <= v16.f32[1]) {
    v16.f32[0] = v16.f32[1];
  }
  return 1.0 - (float)((float)(v10 + v16.f32[0]) + (float)(v10 + v16.f32[0]));
}

void sub_260D60F84(__n128 *a1, void *a2, id a3)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(a3, sel_width);
  id v126 = a3;
  id v7 = objc_msgSend(a3, sel_height);
  CFAllocatorRef v9 = *(void **)(v3 + 48);
  char v8 = *(char **)(v3 + 56);
  float v10 = (char *)a1[1].n128_u64[1];
  v127 = v9;
  uint64_t v128 = (uint64_t)v7;
  v124 = v8;
  if (v10 == v8)
  {
    id v40 = v9;
    CVReturn v41 = v8;
    CVReturn v39 = (void *)a1[1].n128_u64[0];
    if (!v39) {
      goto LABEL_31;
    }
  }
  else
  {
    float v11 = *(float *)(v3 + 64);
    *(void *)(v3 + 112) = 0;
    id v12 = v9;
    int32x2_t v13 = v8;
    swift_unknownObjectRelease();
    *(void *)(v3 + 120) = 0;
    swift_unknownObjectRelease();
    float32x2_t v14 = &v10[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
    swift_beginAccess();
    int v15 = *v14;
    float32x2_t v16 = &v13[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
    swift_beginAccess();
    if (v15 != *v16)
    {
      *(void *)(v3 + 96) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 104) = 0;
      swift_unknownObjectRelease();
    }
    int32x2_t v17 = &v10[OBJC_IVAR____VKStickerEffectInternal_isStroked];
    swift_beginAccess();
    int v18 = *v17;
    float v19 = &v13[OBJC_IVAR____VKStickerEffectInternal_isStroked];
    swift_beginAccess();
    if (v18 != *v19
      || (float v20 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_strokeRadius],
          swift_beginAccess(),
          float v21 = *v20,
          float32x2_t v22 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_strokeRadius],
          swift_beginAccess(),
          v21 != *v22)
      || a1[2].n128_f32[0] != v11)
    {
      *(void *)(v3 + 152) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 160) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 176) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 168) = 0;
      swift_unknownObjectRelease();
    }
    float32x2_t v23 = &v10[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
    swift_beginAccess();
    int v24 = *v23;
    float v25 = &v13[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
    swift_beginAccess();
    if (v24 != *v25
      || v10[OBJC_IVAR____VKStickerEffectInternal_comicParameters] != v13[OBJC_IVAR____VKStickerEffectInternal_comicParameters])
    {
      *(void *)(v3 + 144) = 0;
      swift_unknownObjectRelease();
    }
    float v26 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    float v27 = *v26;
    id v28 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    CFAllocatorRef v9 = v127;
    if (v27 != *v28)
    {
      *(void *)(v3 + 168) = 0;
      swift_unknownObjectRelease();
    }
    id v29 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    float v30 = *v29;
    id v31 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    if (v30 != *v31) {
      goto LABEL_19;
    }
    unint64_t v32 = (float32x2_t *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
    swift_beginAccess();
    float32x2_t v33 = *v32;
    uint64_t v34 = (float32x2_t *)&v13[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
    swift_beginAccess();
    float32x2_t v35 = *v34;
    int32x2_t v36 = vceq_f32(v33, *v34);
    if ((v36.i8[0] & 1) == 0
      || (v36.i8[4] & 1) == 0
      || (CFDictionaryRef v37 = (float32x2_t *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowParallax],
          swift_beginAccess(),
          int32x2_t v38 = vceq_f32(*v37, v35),
          (v38.i8[0] & 1) == 0)
      || (v38.i8[4] & 1) == 0
      || a1[2].n128_f32[0] != v11)
    {
LABEL_19:
      *(void *)(v3 + 152) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 160) = 0;
      swift_unknownObjectRelease();
      *(void *)(v3 + 176) = 0;
      swift_unknownObjectRelease();
    }
    CVReturn v39 = (void *)a1[1].n128_u64[0];
    if (!v39) {
      goto LABEL_31;
    }
  }
  id v42 = v39;
  id v44 = sub_260D5FD34(v42, (uint64_t)v6, v128);
  int v45 = *(void **)(v3 + 136);
  if (v45 && (id v46 = v43, v44 == objc_msgSend(v45, sel_width)) && *(void *)(v3 + 136))
  {
    id v47 = objc_msgSend((id)swift_unknownObjectRetain(), sel_height);
    swift_unknownObjectRelease();

    BOOL v48 = v46 == v47;
    CFAllocatorRef v9 = v127;
    if (v48) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  *(void *)(v3 + 136) = 0;
  swift_unknownObjectRelease();
  *(void *)(v3 + 144) = 0;
  swift_unknownObjectRelease();
LABEL_31:
  id v49 = objc_msgSend(v126, sel_width);
  CVPixelBufferRef v50 = *(void **)(v3 + 176);
  if (!v50
    || v49 != objc_msgSend(v50, sel_width)
    || (id v51 = objc_msgSend(v126, sel_height), (v52 = *(void **)(v3 + 176)) == 0)
    || v51 != objc_msgSend(v52, sel_height))
  {
    *(void *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
  }
  if (v39)
  {
    if (!v9 || v39 != v9) {
      goto LABEL_41;
    }
  }
  else if (v9)
  {
LABEL_41:
    *(void *)(v3 + 136) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 144) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    *(void *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
  }
  uint64_t v53 = *(void **)(v3 + 48);
  uint64_t v54 = *(void **)(v3 + 56);
  __n128 v55 = a1[1];
  *(__n128 *)(v3 + 32) = *a1;
  *(__n128 *)(v3 + 48) = v55;
  *(__n128 *)(v3 + 64) = a1[2];
  *(_DWORD *)(v3 + 80) = a1[3].n128_u32[0];
  id v56 = v39;
  uint64_t v57 = v10;

  if (*(void *)(v3 + 96) && *(void *)(v3 + 104))
  {
    uint64_t v58 = v57;
    uint64_t v59 = v125;
    id v60 = (id)v128;
  }
  else
  {
    int64_t v61 = v57;
    sub_260D5F808();
    uint64_t v59 = v125;
    id v60 = (id)v128;
    if (v125)
    {

LABEL_60:
      return;
    }
  }
  uint64_t v62 = *(void *)(v3 + 112);
  if (v62) {
    goto LABEL_48;
  }
  sub_260D5FEFC(*(void **)(v3 + 16), *(void **)(v3 + 24), (uint64_t)v57);
  if (v59)
  {

    goto LABEL_60;
  }
  *(void *)(v3 + 112) = v64;
  swift_unknownObjectRelease();
  uint64_t v62 = *(void *)(v3 + 112);
  if (!v62)
  {

LABEL_73:
    char v80 = 1;
LABEL_74:
    LOBYTE(v129[0]) = v80;
    return;
  }
LABEL_48:
  uint64_t v63 = *(void *)(v3 + 120);
  if (v63)
  {
    swift_unknownObjectRetain();
  }
  else
  {
    int8x16_t v65 = *(void **)(v3 + 16);
    id v66 = objc_allocWithZone(MEMORY[0x263F128A0]);
    swift_unknownObjectRetain();
    id v67 = objc_msgSend(v66, sel_init);
    objc_msgSend(v67, sel_setDepthCompareFunction_, 3);
    objc_msgSend(v67, sel_setDepthWriteEnabled_, 1);
    id v68 = objc_msgSend(v65, sel_newDepthStencilStateWithDescriptor_, v67);

    *(void *)(v3 + 120) = v68;
    swift_unknownObjectRelease();
    uint64_t v63 = *(void *)(v3 + 120);
    if (!v63)
    {

      goto LABEL_72;
    }
  }
  float32x4_t v69 = *(void **)(v3 + 128);
  if (v69)
  {
    swift_unknownObjectRetain();
    if (v6 == objc_msgSend(v69, sel_width))
    {
      float v70 = *(void **)(v3 + 128);
      if (v70)
      {
        if (v60 == objc_msgSend(v70, sel_height))
        {
          uint64_t v71 = *(void *)(v3 + 128);
          if (v71) {
            goto LABEL_58;
          }
          goto LABEL_66;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  v72 = *(void **)(v3 + 16);
  id v73 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 252, v6, v60, 0);
  v74 = v57;
  uint64_t v75 = v62;
  uint64_t v76 = v63;
  id v77 = v73;
  if (objc_msgSend(v72, sel_supportsFamily_, 1001)) {
    uint64_t v78 = 3;
  }
  else {
    uint64_t v78 = 2;
  }
  objc_msgSend(v77, sel_setStorageMode_, v78);
  objc_msgSend(v77, sel_setUsage_, 4);
  id v79 = objc_msgSend(v72, sel_newTextureWithDescriptor_, v77);

  uint64_t v63 = v76;
  uint64_t v62 = v75;
  uint64_t v57 = v74;
  *(void *)(v3 + 128) = v79;
  swift_unknownObjectRelease();
  uint64_t v71 = *(void *)(v3 + 128);
  if (!v71)
  {
LABEL_66:

    swift_unknownObjectRelease();
LABEL_72:
    swift_unknownObjectRelease();
    goto LABEL_73;
  }
LABEL_58:
  swift_unknownObjectRetain();
  sub_260D5E874(a2, (uint64_t)v6, v128);
  if (v59)
  {

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_60;
  }
  if (*(void *)(v3 + 144))
  {
    id v122 = *(id *)(v3 + 144);
    goto LABEL_77;
  }
  if (!*(void *)(v3 + 136))
  {

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  id v122 = *(id *)(v3 + 136);
  swift_unknownObjectRetain();
LABEL_77:
  uint64_t v121 = v63;
  if (*(void *)(v3 + 160))
  {
    uint64_t v81 = *(void *)(v3 + 160);
    goto LABEL_81;
  }
  if (!*(void *)(v3 + 152))
  {
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  uint64_t v81 = swift_unknownObjectRetain();
LABEL_81:
  uint64_t v120 = v81;
  if (*(void *)(v3 + 168))
  {
    uint64_t v82 = *(void *)(v3 + 168);
    uint64_t v83 = *(void *)(v3 + 176);
    if (v83) {
      goto LABEL_83;
    }
    goto LABEL_94;
  }
  if (!*(void *)(v3 + 152))
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  uint64_t v82 = *(void *)(v3 + 152);
  swift_unknownObjectRetain();
  uint64_t v83 = *(void *)(v3 + 176);
  if (!v83)
  {
LABEL_94:
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    char v80 = 1;
    goto LABEL_74;
  }
LABEL_83:
  uint64_t v119 = v71;
  uint64_t v84 = v83;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v85 = objc_msgSend(v122, sel_width);
  id v86 = objc_msgSend(v122, sel_height);
  float v87 = a1[2].n128_f32[0];
  uint64_t v116 = (uint64_t)v86;
  uint64_t v117 = (uint64_t)v85;
  unint64_t v88 = sub_260D60CBC((uint64_t)v57, (uint64_t)v85, (uint64_t)v86, (uint64_t)v6, v128, v87).n64_u64[0];
  uint64_t v118 = (uint64_t)v6;
  sub_260D62D50((uint64_t)v57, (uint64_t)v6, v128, v87);
  uint64_t v90 = v89;
  uint64_t v92 = v91;
  int v94 = v93;
  *(double *)&long long v95 = MEMORY[0x261228710](*a1);
  unint64_t v96 = a1[2].n128_u64[1];
  unsigned __int32 v97 = a1[3].n128_u32[0];
  v129[0] = v95;
  v129[1] = v98;
  v129[2] = v99;
  v129[3] = v100;
  unint64_t v130 = v96;
  unsigned __int32 v131 = v97;
  unint64_t v132 = v88;
  int v133 = v94;
  uint64_t v134 = v90;
  uint64_t v135 = v92;
  float v136 = 1.0 / (float)v128;
  id v101 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129A0]), sel_init);
  id v102 = objc_msgSend(v101, sel_colorAttachments);
  id v103 = objc_msgSend(v102, sel_objectAtIndexedSubscript_, 0);

  if (!v103)
  {
    __break(1u);
    goto LABEL_99;
  }
  objc_msgSend(v103, sel_setLoadAction_, 2);

  id v104 = objc_msgSend(v101, sel_colorAttachments);
  id v105 = objc_msgSend(v104, sel_objectAtIndexedSubscript_, 0);

  if (!v105)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  objc_msgSend(v105, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  id v106 = objc_msgSend(v101, sel_colorAttachments);
  id v107 = objc_msgSend(v106, sel_objectAtIndexedSubscript_, 0);

  if (!v107)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  objc_msgSend(v107, sel_setTexture_, v126);

  id v108 = objc_msgSend(v101, sel_depthAttachment);
  if (!v108)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  v109 = v108;
  objc_msgSend(v108, sel_setLoadAction_, 2);

  id v110 = objc_msgSend(v101, sel_depthAttachment);
  if (!v110)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  v111 = v110;
  objc_msgSend(v110, sel_setClearDepth_, 1.0);

  id v112 = objc_msgSend(v101, sel_depthAttachment);
  if (v112)
  {
    v113 = v112;
    objc_msgSend(v112, sel_setTexture_, v119);

    id v114 = objc_msgSend(a2, sel_renderCommandEncoderWithDescriptor_, v101);
    if (v114)
    {
      v115 = v114;
      objc_msgSend(v114, sel_setRenderPipelineState_, v62, v116, v117);
      objc_msgSend(v115, sel_setDepthStencilState_, v121);
      objc_msgSend(v115, sel_setVertexBuffer_offset_atIndex_, *(void *)(v3 + 96), 0, 0);
      objc_msgSend(v115, sel_setVertexBuffer_offset_atIndex_, *(void *)(v3 + 104), 0, 1);
      objc_msgSend(v115, sel_setVertexBytes_length_atIndex_, v129, 128, 2);
      objc_msgSend(v115, sel_setFragmentBytes_length_atIndex_, v129, 128, 0);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v122, 0);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v120, 1);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v82, 2);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v84, 3);
      objc_msgSend(v115, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, *(void *)(v3 + 88));
      objc_msgSend(v115, sel_endEncoding);
      swift_unknownObjectRelease();
    }
    sub_260D60E8C((uint64_t)v57, v87, v117, v116, v118, v128);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    char v80 = 0;
    goto LABEL_74;
  }
LABEL_103:
  __break(1u);
}

uint64_t sub_260D61EC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StickerEffectRenderer.TextureError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StickerEffectRenderer.TextureError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_260D61F74(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_260D61F94(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerEffectRenderer.TextureError()
{
  return &type metadata for StickerEffectRenderer.TextureError;
}

uint64_t sub_260D61FC4(uint64_t result)
{
  uint64_t v2 = v1[7];
  if (v2)
  {
    if (result && v2 == result) {
      return result;
    }
  }
  else if (!result)
  {
    return result;
  }
  v1[8] = 0;
  swift_unknownObjectRelease();
  v1[9] = 0;
  swift_unknownObjectRelease();
  v1[10] = 0;
  return swift_unknownObjectRelease();
}

void *sub_260D62028(void *a1, void *a2)
{
  char v3 = (void *)v2;
  v32[4] = *MEMORY[0x263EF8340];
  *(_DWORD *)(v2 + 48) = 1022739087;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(void *)(v2 + 96) = 125;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  id v6 = objc_allocWithZone(MEMORY[0x263F129C0]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = objc_msgSend(v6, sel_init);
  char v8 = (void *)sub_260D75650();
  id v9 = objc_msgSend(a2, sel_newFunctionWithName_, v8);

  objc_msgSend(v7, sel_setVertexFunction_, v9);
  swift_unknownObjectRelease();
  float v10 = (void *)sub_260D75650();
  id v11 = objc_msgSend(a2, sel_newFunctionWithName_, v10);

  objc_msgSend(v7, sel_setFragmentFunction_, v11);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v7, sel_colorAttachments);
  id v13 = objc_msgSend(v12, sel_objectAtIndexedSubscript_, 0);

  if (!v13) {
    __break(1u);
  }
  objc_msgSend(v13, sel_setPixelFormat_, v3[12]);

  id v30 = 0;
  id v14 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v7, &v30);
  id v15 = v14;
  id v16 = v30;
  if (!v14)
  {
    id v27 = v30;
    sub_260D75580();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    int v28 = 0;
    goto LABEL_9;
  }
  v3[11] = v14;
  __asm { FMOV            V8.2S, #1.0 }
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  id v22 = v16;
  id v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_260D71864(MEMORY[0x263F8EE78]);
    sub_260D62A38();
    sub_260D75560();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  id v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    id v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  int v28 = 1;
  sub_260D71864(MEMORY[0x263F8EE78]);
  sub_260D62A38();
  sub_260D75560();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28) {
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v15) {
    swift_unknownObjectRelease();
  }
  type metadata accessor for StickerShaderNormalGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_260D62430(void *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v1 + 56);
  if (v2)
  {
    uint64_t v4 = *(void *)(v1 + 64);
    swift_unknownObjectRetain();
    if (!v4)
    {
      id v5 = objc_msgSend(v2, sel_width);
      id v6 = objc_msgSend(v2, sel_height);
      id v7 = self;
      id v8 = objc_msgSend(v7, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 55, v5, v6, 0);
      objc_msgSend(v8, sel_setUsage_, 7);
      objc_msgSend(v8, sel_setStorageMode_, 2);
      id v9 = *(void **)(v1 + 16);
      *(void *)(v1 + 64) = objc_msgSend(v9, sel_newTextureWithDescriptor_, v8);
      swift_unknownObjectRelease();
      *(void *)(v1 + 72) = objc_msgSend(v9, sel_newTextureWithDescriptor_, v8);
      swift_unknownObjectRelease();
      id v10 = objc_msgSend(v7, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(void *)(v1 + 96), v5, v6, 0);
      objc_msgSend(v10, sel_setUsage_, 7);
      objc_msgSend(v10, sel_setStorageMode_, 2);
      id v11 = objc_msgSend(v9, sel_newTextureWithDescriptor_, v10);

      *(void *)(v1 + 80) = v11;
      swift_unknownObjectRelease();
      uint64_t v4 = *(void *)(v1 + 64);
      if (!v4) {
        goto LABEL_16;
      }
    }
    id v12 = *(void **)(v1 + 72);
    if (v12)
    {
      id v13 = *(void **)(v1 + 80);
      if (v13)
      {
        uint64_t v14 = *(void *)(v1 + 16);
        id v15 = objc_allocWithZone(MEMORY[0x263F132B0]);
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        id v16 = objc_msgSend(v15, sel_initWithDevice_, v14);
        float v17 = *(float *)(v1 + 48);
        id v42 = v13;
        float v18 = v17 * (float)(uint64_t)objc_msgSend(v13, sel_width);
        if (v18 >= 1.0)
        {
          id v19 = objc_allocWithZone(MEMORY[0x263F13288]);
          *(float *)&double v20 = v18;
          id v21 = objc_msgSend(v19, sel_initWithDevice_sigma_, v14, v20);
          objc_msgSend(v21, sel_setEdgeMode_, 1);
          objc_msgSend(v21, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v4);
          objc_msgSend(v16, sel_encodeToCommandBuffer_primaryTexture_secondaryTexture_destinationTexture_, a1, v4, v2, v12);

          for (float i = v18 * 0.5; i >= 1.0; float i = i * 0.5)
          {
            id v23 = objc_allocWithZone(MEMORY[0x263F13288]);
            *(float *)&double v24 = i;
            id v25 = objc_msgSend(v23, sel_initWithDevice_sigma_, v14, v24);
            objc_msgSend(v25, sel_setEdgeMode_, 1);
            objc_msgSend(v25, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v12, v4);
            objc_msgSend(v16, sel_encodeToCommandBuffer_primaryTexture_secondaryTexture_destinationTexture_, a1, v4, v2, v12);
          }
        }
        float v26 = *(float *)(v1 + 48);
        float v27 = v26 * (float)(uint64_t)objc_msgSend(v42, sel_width);
        id v28 = objc_msgSend(v42, sel_width);
        id v29 = objc_msgSend(v42, sel_height);
        v30.i64[0] = (uint64_t)v28;
        v30.i64[1] = (uint64_t)v29;
        __asm { FMOV            V1.2S, #1.0 }
        float32x2_t v43 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_s64(v30)));
        float v44 = v27;
        id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129A0]), sel_init);
        id v37 = objc_msgSend(v36, sel_colorAttachments);
        id v38 = objc_msgSend(v37, sel_objectAtIndexedSubscript_, 0);

        if (v38)
        {
          objc_msgSend(v38, sel_setTexture_, v42);

          id v39 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v36);
          if (v39)
          {
            id v40 = v39;
            objc_msgSend(v39, sel_setRenderPipelineState_, *(void *)(v1 + 88));
            objc_msgSend(v40, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 32), 0, 0);
            objc_msgSend(v40, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 40), 0, 1);
            if (v18 < 1.0) {
              CVReturn v41 = v2;
            }
            else {
              CVReturn v41 = v12;
            }
            objc_msgSend(v40, sel_setFragmentTexture_atIndex_, v41, 0);
            objc_msgSend(v40, sel_setFragmentBytes_length_atIndex_, &v43, 16, 0);
            objc_msgSend(v40, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
            objc_msgSend(v40, sel_endEncoding);
            swift_unknownObjectRelease();
          }
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    else
    {
LABEL_16:
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_260D62980()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_260D629E0()
{
  sub_260D62980();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for StickerShaderNormalGenerator()
{
  return self;
}

unint64_t sub_260D62A38()
{
  unint64_t result = qword_26A8E4A10;
  if (!qword_26A8E4A10)
  {
    type metadata accessor for MTLCommandBufferError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4A10);
  }
  return result;
}

uint64_t sub_260D62A90(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = a1;
  if (swift_unknownObjectRetain())
  {
    if (v3) {
      BOOL v4 = a1 == v3;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4) {
      goto LABEL_9;
    }
LABEL_7:
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  if (!v3) {
    goto LABEL_7;
  }
LABEL_9:
  *(void *)(v1 + 40) = 0;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_10:
  return swift_unknownObjectRelease();
}

uint64_t sub_260D62B14(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(v1 + 40);
  swift_unknownObjectRetain();
  if (v4) {
    goto LABEL_4;
  }
  id v5 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(void *)(v1 + 56), objc_msgSend(v2, sel_width), objc_msgSend(v2, sel_height), 0);
  objc_msgSend(v5, sel_setUsage_, 7);
  objc_msgSend(v5, sel_setStorageMode_, 2);
  id v6 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v5);

  *(void *)(v1 + 40) = v6;
  swift_unknownObjectRelease();
  uint64_t v4 = *(void *)(v1 + 40);
  if (v4)
  {
LABEL_4:
    float v7 = *(float *)(v1 + 24);
    id v8 = objc_msgSend((id)swift_unknownObjectRetain(), sel_width);
    id v9 = *(void **)(v1 + 48);
    if (v9) {
      goto LABEL_5;
    }
    float v10 = (float)(v7 * (float)(uint64_t)v8) / 3.0349;
    uint64_t v11 = *(void *)(v1 + 16);
    id v12 = objc_allocWithZone(MEMORY[0x263F13288]);
    *(float *)&double v13 = v10;
    id v14 = objc_msgSend(v12, sel_initWithDevice_sigma_, v11, v13);
    id v15 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = v14;

    id v16 = *(void **)(v1 + 48);
    if (!v16) {
      goto LABEL_9;
    }
    objc_msgSend(v16, sel_setEdgeMode_, 1);
    id v9 = *(void **)(v1 + 48);
    if (v9)
    {
LABEL_5:
      objc_msgSend(v9, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v4);
    }
    else
    {
LABEL_9:
      swift_unknownObjectRelease();
      uint64_t v4 = 0;
    }
  }
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_260D62CDC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for StickerShaderShadowGenerator()
{
  return self;
}

float sub_260D62D50(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  if (a3 <= a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a3;
  }
  float v6 = fminf(fmaxf((float)((float)((float)v5 / a4) + -30.0) / 90.0, 0.0), 1.0);
  float v7 = (float)(v6 * v6) * (float)((float)(v6 * -2.0) + 3.0);
  id v8 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  float v12 = *v8 + (float)(v7 * (float)(1.0 - *v8));
  swift_beginAccess();
  id v9 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  float v10 = v12 * *v9;
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  return v10;
}

void *sub_260D62EFC(void *a1, void *a2)
{
  uint64_t v3 = (void *)v2;
  v32[4] = *MEMORY[0x263EF8340];
  *(void *)(v2 + 48) = 0;
  __asm { FMOV            V8.2S, #1.0 }
  *(void *)(v2 + 56) = _D8;
  *(void *)(v2 + 72) = 0;
  *(void *)(v2 + 80) = 0;
  *(void *)(v2 + 64) = 0;
  *(_OWORD *)(v2 + 96) = xmmword_260D76F80;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  id v11 = objc_allocWithZone(MEMORY[0x263F129C0]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v12 = objc_msgSend(v11, sel_init);
  double v13 = (void *)sub_260D75650();
  id v14 = objc_msgSend(a2, sel_newFunctionWithName_, v13);

  objc_msgSend(v12, sel_setVertexFunction_, v14);
  swift_unknownObjectRelease();
  id v15 = (void *)sub_260D75650();
  id v16 = objc_msgSend(a2, sel_newFunctionWithName_, v15);

  objc_msgSend(v12, sel_setFragmentFunction_, v16);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v12, sel_colorAttachments);
  id v18 = objc_msgSend(v17, sel_objectAtIndexedSubscript_, 0);

  if (!v18) {
    __break(1u);
  }
  objc_msgSend(v18, sel_setPixelFormat_, v3[13]);

  id v30 = 0;
  id v19 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v12, &v30);
  id v20 = v19;
  id v21 = v30;
  if (!v19)
  {
    id v27 = v30;
    sub_260D75580();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    int v28 = 0;
    goto LABEL_9;
  }
  v3[11] = v19;
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  id v22 = v21;
  id v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_260D71864(MEMORY[0x263F8EE78]);
    sub_260D62A38();
    sub_260D75560();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  id v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    id v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  int v28 = 1;
  sub_260D71864(MEMORY[0x263F8EE78]);
  sub_260D62A38();
  sub_260D75560();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28) {
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v20) {
    swift_unknownObjectRelease();
  }
  type metadata accessor for StickerShaderAlphaToLumaGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_260D632F0(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(v1 + 48);
  if (v2)
  {
    uint64_t v4 = *(void *)(v1 + 80);
    if (v4)
    {
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v5 = self;
      uint64_t v6 = *(void *)(v1 + 104);
      uint64_t v7 = *(void *)(v1 + 64);
      uint64_t v8 = *(void *)(v1 + 72);
      swift_unknownObjectRetain();
      id v9 = objc_msgSend(v5, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v6, v7, v8, 0);
      objc_msgSend(v9, sel_setUsage_, 7);
      objc_msgSend(v9, sel_setStorageMode_, 2);
      id v10 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v9);

      *(void *)(v1 + 80) = v10;
      swift_unknownObjectRelease();
      uint64_t v4 = *(void *)(v1 + 80);
      if (!v4)
      {
LABEL_10:
        swift_unknownObjectRelease();
        return;
      }
    }
    id v11 = objc_allocWithZone(MEMORY[0x263F129A0]);
    swift_unknownObjectRetain();
    id v12 = objc_msgSend(v11, sel_init);
    id v13 = objc_msgSend(v12, sel_colorAttachments);
    id v14 = objc_msgSend(v13, sel_objectAtIndexedSubscript_, 0);

    if (v14)
    {
      objc_msgSend(v14, sel_setTexture_, v4);

      id v15 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v12);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)(v1 + 56);
        int v18 = 1061158912;
        uint64_t v19 = v17;
        objc_msgSend(v15, sel_setRenderPipelineState_, *(void *)(v1 + 88));
        objc_msgSend(v16, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 32), 0, 0);
        objc_msgSend(v16, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 40), 0, 1);
        objc_msgSend(v16, sel_setFragmentTexture_atIndex_, v2, 0);
        objc_msgSend(v16, sel_setFragmentBytes_length_atIndex_, &v18, 16, 0);
        objc_msgSend(v16, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
        objc_msgSend(v16, sel_endEncoding);
        swift_unknownObjectRelease();
      }

      goto LABEL_10;
    }
    __break(1u);
  }
}

uint64_t sub_260D63594()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_260D635E4()
{
  sub_260D63594();
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for StickerShaderAlphaToLumaGenerator()
{
  return self;
}

id sub_260D6363C(void *a1)
{
  return sub_260D63738(a1, &OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma);
}

id sub_260D6369C()
{
  return sub_260D637D8(type metadata accessor for StickerComicStrokeShader);
}

uint64_t type metadata accessor for StickerComicStrokeShader()
{
  return self;
}

id sub_260D636D8(void *a1)
{
  return sub_260D63738(a1, &OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma);
}

id sub_260D63738(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  float v3 = *(double *)(v2 + *a2);
  float32x2_t v5 = vcvt_f32_f64(*(float64x2_t *)(v2 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  float v6 = v3;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v5, 16, 0);
}

id sub_260D637C0()
{
  return sub_260D637D8(type metadata accessor for StickerComicStrokeAndBlendShader);
}

id sub_260D637D8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicStrokeAndBlendShader()
{
  return self;
}

uint64_t StickerComicRenderer.__allocating_init(device:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  StickerComicRenderer.init(device:)(a1);
  return v2;
}

uint64_t sub_260D63884(unint64_t a1)
{
  if (!(a1 >> 62)) {
    return *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_260D75810();
  swift_bridgeObjectRelease();
  return v2;
}

VisionKitInternal::StickerComicRenderer::Style_optional __swiftcall StickerComicRenderer.Style.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  char *v1 = v2;
  return (VisionKitInternal::StickerComicRenderer::Style_optional)rawValue;
}

uint64_t StickerComicRenderer.Style.rawValue.getter()
{
  return *v0;
}

BOOL sub_260D63908(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_260D63920()
{
  return sub_260D758E0();
}

uint64_t sub_260D63968()
{
  return sub_260D758D0();
}

uint64_t sub_260D63994()
{
  return sub_260D758E0();
}

void *sub_260D639D8@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_260D639F8(void *a1@<X8>)
{
  *a1 = *v1;
}

void StickerComicRenderer.Parameters.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *StickerComicRenderer.Parameters.style.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*StickerComicRenderer.Parameters.style.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.smooth.getter()
{
  return *(float *)(v0 + 4);
}

void StickerComicRenderer.Parameters.smooth.setter(float a1)
{
  *(float *)(v1 + 4) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.smooth.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.brightness.getter()
{
  return *(float *)(v0 + 8);
}

void StickerComicRenderer.Parameters.brightness.setter(float a1)
{
  *(float *)(v1 + 8) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.brightness.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.loose.getter()
{
  return *(float *)(v0 + 12);
}

void StickerComicRenderer.Parameters.loose.setter(float a1)
{
  *(float *)(v1 + 12) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.loose.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param1.getter()
{
  return *(float *)(v0 + 16);
}

void StickerComicRenderer.Parameters.param1.setter(float a1)
{
  *(float *)(v1 + 16) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param1.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param2.getter()
{
  return *(float *)(v0 + 20);
}

void StickerComicRenderer.Parameters.param2.setter(float a1)
{
  *(float *)(v1 + 20) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param2.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param3.getter()
{
  return *(float *)(v0 + 24);
}

void StickerComicRenderer.Parameters.param3.setter(float a1)
{
  *(float *)(v1 + 24) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param3.modify())()
{
  return nullsub_1;
}

uint64_t StickerComicRenderer.Parameters.quantizeLevels.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t StickerComicRenderer.Parameters.quantizeLevels.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*StickerComicRenderer.Parameters.quantizeLevels.modify())()
{
  return nullsub_1;
}

BOOL static StickerComicRenderer.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t StickerComicRenderer.Error.hash(into:)()
{
  return sub_260D758D0();
}

uint64_t StickerComicRenderer.Error.hashValue.getter()
{
  return sub_260D758E0();
}

void *sub_260D63C18(void *a1)
{
  char v3 = v1;
  v31[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for StickerComicRenderer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v31[0] = 0;
  id v7 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v6, v31);

  id v8 = v31[0];
  if (!v7)
  {
    id v12 = v31[0];
    sub_260D75580();

    swift_willThrow();
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  id v30 = v3;
  id v9 = (objc_class *)type metadata accessor for StickerComicSobelShader();
  objc_allocWithZone(v9);
  id v10 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v11 = sub_260D73F6C(a1, v7);
  if (v2)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    char v3 = v30;
LABEL_6:
    type metadata accessor for StickerComicRenderer.Shaders();
    swift_deallocPartialClassInstance();
    return v3;
  }
  v30[2] = v11;
  id v13 = (objc_class *)type metadata accessor for StickerComicGaussBlurExpressShader();
  id v14 = (char *)objc_allocWithZone(v13);
  *(void *)&v14[OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v29 = v13;
  v30[3] = sub_260D73F6C(a1, v7);
  id v15 = (objc_class *)type metadata accessor for StickerComicGaussBlurExpressPassTwoShader();
  id v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[4] = sub_260D73F6C(a1, v7);
  uint64_t v17 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicBFBlurPassOneShader());
  *(void *)&v17[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor] = 0;
  *(void *)&v17[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[5] = sub_260D73F6C(a1, v7);
  int v18 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicBFBlurPassTwoShader());
  *(void *)&v18[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor] = 0;
  *(void *)&v18[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[6] = sub_260D73F6C(a1, v7);
  id v19 = objc_allocWithZone((Class)type metadata accessor for StickerComicVignetteAndQuantizeShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[7] = sub_260D7518C(a1, v7);
  uint64_t v20 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicEdgesShader());
  *(void *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_threshold] = 0x3FE0000000000000;
  *(void *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold] = 0x3FE0000000000000;
  *(void *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma] = 0;
  *(void *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[9] = sub_260D73F6C(a1, v7);
  id v21 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicStrokeShader());
  *(void *)&v21[OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[10] = sub_260D73F6C(a1, v7);
  id v22 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicStrokeAndBlendShader());
  *(void *)&v22[OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[11] = sub_260D73F6C(a1, v7);
  id v23 = objc_allocWithZone((Class)type metadata accessor for StickerComicColorStrokeShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[8] = sub_260D73F6C(a1, v7);
  id v24 = objc_allocWithZone((Class)type metadata accessor for StickerComicLookupFilterShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[12] = sub_260D73F6C(a1, v7);
  id v25 = objc_allocWithZone(v9);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[13] = sub_260D73F6C(a1, v7);
  id v26 = (char *)objc_allocWithZone(v29);
  *(void *)&v26[OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[14] = sub_260D73F6C(a1, v7);
  id v27 = (char *)objc_allocWithZone(v15);
  *(void *)&v27[OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma] = 0x3FE0000000000000;
  char v3 = v30;
  v30[15] = sub_260D73F6C(a1, v7);
  return v3;
}

id *sub_260D64728()
{
  return v0;
}

uint64_t sub_260D647B0()
{
  uint64_t v0 = sub_260D64728();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t StickerComicRenderer.init(device:)(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 32) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 40) = v3;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(void *)(v1 + 16) = a1;
  type metadata accessor for StickerComicRenderer.Shaders();
  swift_allocObject();
  uint64_t v4 = (void *)swift_unknownObjectRetain();
  float32x2_t v5 = sub_260D63C18(v4);
  if (v2)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for StickerComicRenderer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 24) = v5;
  }
  return v1;
}

uint64_t type metadata accessor for StickerComicRenderer.Shaders()
{
  return self;
}

uint64_t type metadata accessor for StickerComicRenderer()
{
  return self;
}

uint64_t sub_260D648E0(void *a1, void *a2, char *a3, void *a4, int8x16_t a5)
{
  char v9 = *a3;
  int v10 = *((_DWORD *)a3 + 1);
  int v11 = *((_DWORD *)a3 + 2);
  int v12 = *((_DWORD *)a3 + 3);
  int v13 = *((_DWORD *)a3 + 4);
  int v14 = *((_DWORD *)a3 + 5);
  int v15 = *((_DWORD *)a3 + 6);
  uint64_t v16 = *((void *)a3 + 4);
  v22[0] = *a3;
  int v23 = v10;
  int v24 = v11;
  int v25 = v12;
  int v26 = v13;
  int v27 = v14;
  int v28 = v15;
  uint64_t v29 = v16;
  if ((sub_260D6A740((uint64_t)v22, a5) & 1) == 0)
  {
    char v18 = 0;
LABEL_8:
    sub_260D6A7B0();
    swift_allocError();
    *id v19 = v18;
    return swift_willThrow();
  }
  if (objc_msgSend(a1, sel_pixelFormat) != (id)80 || objc_msgSend(a2, sel_pixelFormat) != (id)80)
  {
    char v18 = 1;
    goto LABEL_8;
  }
  if (v9) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = sub_260D69FCC();
  }
  v22[0] = v9;
  int v23 = v10;
  int v24 = v11;
  int v25 = v12;
  int v26 = v13;
  int v27 = v14;
  int v28 = v15;
  uint64_t v29 = v16;
  sub_260D6A804(a1, (uint64_t)v22);
  v22[0] = v9;
  int v23 = v10;
  int v24 = v11;
  int v25 = v12;
  int v26 = v13;
  int v27 = v14;
  int v28 = v15;
  uint64_t v29 = v16;
  sub_260D64AAC(v22, (unint64_t)a1, (uint64_t)a2, v17, a4);
  swift_beginAccess();
  uint64_t v21 = MEMORY[0x263F8EE78];
  *(void *)(v5 + 32) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v5 + 40) = v21;
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_260D64AAC(unsigned char *a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = v5;
  v498 = *(void **)(v5 + 24);
  id v8 = (uint64_t *)(v5 + 40);
  if ((*a1 & 1) == 0)
  {
    v495 = a4;
    swift_beginAccess();
    while (1)
    {
      unint64_t v9 = *v8;
      if ((unint64_t)*v8 >> 62) {
        break;
      }
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0) {
        goto LABEL_50;
      }
LABEL_20:
      double v18 = *(double *)(v7 + 48);
      double v17 = *(double *)(v7 + 56);
      id v19 = self;
      if (v18 <= -9.22337204e18) {
        goto LABEL_724;
      }
      if (v18 >= 9.22337204e18) {
        goto LABEL_726;
      }
      if ((*(void *)&v18 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v17 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_728;
      }
      if (v17 <= -9.22337204e18) {
        goto LABEL_730;
      }
      if (v17 >= 9.22337204e18) {
        goto LABEL_732;
      }
      id v20 = objc_msgSend(v19, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v18, (uint64_t)v17, 0);
      objc_msgSend(v20, sel_setUsage_, 5);
      uint64_t v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v20);

      if (v6)
      {
        swift_beginAccess();
        uint64_t v21 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v21);
        if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_260D756C0();
        }
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_260D75810();
    swift_bridgeObjectRelease();
    if (v22 <= 0) {
      goto LABEL_20;
    }
LABEL_50:
    unint64_t v9 = *v8;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_945;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v32 = *(void *)(v9 + 32);
      swift_unknownObjectRetain();
      goto LABEL_53;
    }
    __break(1u);
LABEL_947:
    swift_bridgeObjectRetain();
    uint64_t v33 = MEMORY[0x2612287D0](1, v9);
    swift_bridgeObjectRelease();
    while (1)
    {
      unint64_t v9 = *v8;
      if ((unint64_t)*v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_260D75810();
        swift_bridgeObjectRelease();
        if (v46 > 0)
        {
LABEL_102:
          unint64_t v9 = *v8;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_951;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            unint64_t v54 = *(void *)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_105;
          }
          __break(1u);
LABEL_953:
          swift_bridgeObjectRetain();
          unint64_t v75 = MEMORY[0x2612287D0](0, v9);
          swift_bridgeObjectRelease();
LABEL_136:
          sub_260D73DAC(v6, v75, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          uint64_t v63 = v498[4];
          unint64_t v76 = 0xC3E0000000000001;
          uint64_t v24 = 0x7FF0000000000000;
          while (2)
          {
            unint64_t v9 = *v8;
            if (!((unint64_t)*v8 >> 62))
            {
              if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0) {
                break;
              }
              goto LABEL_139;
            }
            swift_bridgeObjectRetain();
            uint64_t v82 = sub_260D75810();
            swift_bridgeObjectRelease();
            if (v82 <= 0)
            {
LABEL_139:
              double v78 = *(double *)(v7 + 48);
              double v77 = *(double *)(v7 + 56);
              id v79 = self;
              if (v78 <= -9.22337204e18) {
                goto LABEL_754;
              }
              if (v78 >= 9.22337204e18) {
                goto LABEL_756;
              }
              if ((*(void *)&v78 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v77 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_758;
              }
              if (v77 <= -9.22337204e18) {
                goto LABEL_761;
              }
              if (v77 >= 9.22337204e18) {
                goto LABEL_762;
              }
              id v80 = objc_msgSend(v79, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v78, (uint64_t)v77, 0);
              objc_msgSend(v80, sel_setUsage_, 5);
              uint64_t v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v80);

              if (v6)
              {
                swift_beginAccess();
                uint64_t v81 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v81);
                if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_260D756C0();
                }
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              continue;
            }
            break;
          }
          unint64_t v9 = *v8;
          uint64_t v494 = v63;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_957;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            uint64_t v6 = *(void *)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_153;
          }
          __break(1u);
LABEL_959:
          swift_bridgeObjectRetain();
          unint64_t v94 = MEMORY[0x2612287D0](1, v76);
          swift_bridgeObjectRelease();
LABEL_169:
          sub_260D73DAC(v63, v94, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          long long v95 = (void *)v498[5];
          unint64_t v9 = *v8;
          unint64_t v96 = swift_bridgeObjectRetain();
          uint64_t v97 = sub_260D63884(v96);
          swift_bridgeObjectRelease();
          if (v97 <= 1)
          {
            uint64_t v24 = 0xC3E0000000000001;
            uint64_t v6 = 0x43E0000000000000;
            do
            {
              double v101 = *(double *)(v7 + 48);
              double v100 = *(double *)(v7 + 56);
              id v102 = self;
              if (v101 <= -9.22337204e18) {
                goto LABEL_773;
              }
              if (v101 >= 9.22337204e18) {
                goto LABEL_775;
              }
              if ((*(void *)&v101 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v100 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_776;
              }
              if (v100 <= -9.22337204e18) {
                goto LABEL_777;
              }
              if (v100 >= 9.22337204e18) {
                goto LABEL_781;
              }
              id v104 = objc_msgSend(v102, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v101, (uint64_t)v100, 0);
              objc_msgSend(v104, sel_setUsage_, 5);
              id v105 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v104);

              if (v105)
              {
                swift_beginAccess();
                uint64_t v106 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v106);
                uint64_t v63 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
                sub_260D6A714(v63);
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              unint64_t v9 = *v8;
              unint64_t v98 = swift_bridgeObjectRetain();
              uint64_t v99 = sub_260D63884(v98);
              swift_bridgeObjectRelease();
            }
            while (v99 < 2);
          }
          unint64_t v9 = *v8;
          v495 = v95;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_963;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            uint64_t v63 = *(void *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_201;
          }
          __break(1u);
LABEL_965:
          swift_bridgeObjectRetain();
          uint64_t v6 = MEMORY[0x2612287D0](1, v9);
          swift_bridgeObjectRelease();
          unint64_t v9 = *v8;
LABEL_221:
          unint64_t v134 = swift_bridgeObjectRetain();
          uint64_t v135 = sub_260D63884(v134);
          swift_bridgeObjectRelease();
          if (v135 <= 0)
          {
            uint64_t v24 = 0x43E0000000000000;
            uint64_t v63 = 0x7FF0000000000000;
            do
            {
              double v366 = *(double *)(v7 + 48);
              double v365 = *(double *)(v7 + 56);
              v367 = self;
              if (v366 <= -9.22337204e18) {
                goto LABEL_835;
              }
              if (v366 >= 9.22337204e18) {
                goto LABEL_836;
              }
              if ((*(void *)&v366 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v365 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_840;
              }
              if (v365 <= -9.22337204e18) {
                goto LABEL_841;
              }
              if (v365 >= 9.22337204e18) {
                goto LABEL_842;
              }
              id v369 = objc_msgSend(v367, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v366, (uint64_t)v365, 0);
              objc_msgSend(v369, sel_setUsage_, 5);
              id v370 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v369);

              if (v370)
              {
                swift_beginAccess();
                uint64_t v371 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v371);
                sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              unint64_t v9 = *v8;
              unint64_t v363 = swift_bridgeObjectRetain();
              uint64_t v364 = sub_260D63884(v363);
              swift_bridgeObjectRelease();
            }
            while (v364 < 1);
          }
          uint64_t v107 = *v8;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_969;
          }
          unint64_t v9 = v494;
          if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            uint64_t v136 = *(void *)(v107 + 32);
            swift_unknownObjectRetain();
            goto LABEL_225;
          }
          __break(1u);
LABEL_971:
          swift_bridgeObjectRetain();
          uint64_t v148 = MEMORY[0x2612287D0](2, v9);
          swift_bridgeObjectRelease();
          unint64_t v9 = *v8;
LABEL_241:
          unint64_t v149 = swift_bridgeObjectRetain();
          uint64_t v150 = sub_260D63884(v149);
          swift_bridgeObjectRelease();
          if (v150 <= 1)
          {
            uint64_t v6 = 0xC3E0000000000001;
            uint64_t v107 = 0x7FF0000000000000;
            do
            {
              double v154 = *(double *)(v7 + 48);
              double v153 = *(double *)(v7 + 56);
              v155 = self;
              if (v154 <= -9.22337204e18) {
                goto LABEL_793;
              }
              if (v154 >= 9.22337204e18) {
                goto LABEL_794;
              }
              if ((*(void *)&v154 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v153 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_797;
              }
              if (v153 <= -9.22337204e18) {
                goto LABEL_798;
              }
              if (v153 >= 9.22337204e18) {
                goto LABEL_799;
              }
              id v157 = objc_msgSend(v155, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v154, (uint64_t)v153, 0);
              objc_msgSend(v157, sel_setUsage_, 5);
              id v158 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v157);

              if (v158)
              {
                swift_beginAccess();
                uint64_t v159 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v159);
                uint64_t v63 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
                sub_260D6A714(v63);
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              unint64_t v9 = *v8;
              unint64_t v151 = swift_bridgeObjectRetain();
              uint64_t v152 = sub_260D63884(v151);
              swift_bridgeObjectRelease();
            }
            while (v152 < 2);
          }
          unint64_t v9 = *v8;
          v495 = (void *)v148;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_975;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            uint64_t v63 = *(void *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_273;
          }
          __break(1u);
LABEL_977:
          __break(1u);
LABEL_978:
          swift_bridgeObjectRetain();
          uint64_t v173 = MEMORY[0x2612287D0](0, v107);
          swift_bridgeObjectRelease();
          uint64_t v24 = (uint64_t)v495;
LABEL_277:
          sub_260D73BC4(v24, v63, v173, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          unint64_t v174 = v498[9];
          unint64_t v9 = *v8;
          unint64_t v175 = swift_bridgeObjectRetain();
          uint64_t v176 = sub_260D63884(v175);
          swift_bridgeObjectRelease();
          if (v176 <= 1)
          {
            uint64_t v63 = 0xC3E0000000000001;
            uint64_t v107 = 0x7FF0000000000000;
            do
            {
              double v180 = *(double *)(v7 + 48);
              double v179 = *(double *)(v7 + 56);
              v181 = self;
              if (v180 <= -9.22337204e18) {
                goto LABEL_803;
              }
              if (v180 >= 9.22337204e18) {
                goto LABEL_804;
              }
              if ((*(void *)&v180 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v179 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_805;
              }
              if (v179 <= -9.22337204e18) {
                goto LABEL_806;
              }
              if (v179 >= 9.22337204e18) {
                goto LABEL_807;
              }
              id v183 = objc_msgSend(v181, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v180, (uint64_t)v179, 0);
              objc_msgSend(v183, sel_setUsage_, 5);
              id v184 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v183);

              if (v184)
              {
                swift_beginAccess();
                uint64_t v185 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v185);
                uint64_t v24 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
                sub_260D6A714(v24);
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              unint64_t v9 = *v8;
              unint64_t v177 = swift_bridgeObjectRetain();
              uint64_t v178 = sub_260D63884(v177);
              swift_bridgeObjectRelease();
            }
            while (v178 < 2);
          }
          unint64_t v9 = *v8;
          a2 = v174;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_984;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            uint64_t v202 = *(void *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_318;
          }
          __break(1u);
LABEL_986:
          swift_bridgeObjectRetain();
          unint64_t v214 = MEMORY[0x2612287D0](2, v9);
          swift_bridgeObjectRelease();
LABEL_334:
          sub_260D73DAC(v494, v214, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          a2 = v498[13];
          unint64_t v9 = *v8;
          unint64_t v215 = swift_bridgeObjectRetain();
          uint64_t v216 = sub_260D63884(v215);
          swift_bridgeObjectRelease();
          if (v216 > 1)
          {
LABEL_367:
            unint64_t v9 = *v8;
            if ((*v8 & 0xC000000000000001) == 0)
            {
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                uint64_t v494 = *(void *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_370;
              }
              __break(1u);
LABEL_994:
              swift_bridgeObjectRetain();
              unint64_t v242 = MEMORY[0x2612287D0](0, v9);
              swift_bridgeObjectRelease();
LABEL_374:
              sub_260D73DAC(v494, v242, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = v498[14];
              unint64_t v9 = *v8;
              unint64_t v243 = swift_bridgeObjectRetain();
              uint64_t v244 = sub_260D63884(v243);
              swift_bridgeObjectRelease();
              if (v244 <= 3)
              {
                do
                {
                  double v248 = *(double *)(v7 + 48);
                  double v247 = *(double *)(v7 + 56);
                  v249 = self;
                  if (v248 <= -9.22337204e18) {
                    goto LABEL_828;
                  }
                  if (v248 >= 9.22337204e18) {
                    goto LABEL_829;
                  }
                  if ((*(void *)&v248 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v247 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_830;
                  }
                  if (v247 <= -9.22337204e18) {
                    goto LABEL_831;
                  }
                  if (v247 >= 9.22337204e18) {
                    goto LABEL_832;
                  }
                  id v251 = objc_msgSend(v249, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v248, (uint64_t)v247, 0);
                  objc_msgSend(v251, sel_setUsage_, 5);
                  id v252 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v251);

                  if (v252)
                  {
                    swift_beginAccess();
                    uint64_t v253 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v253);
                    sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *v8;
                  unint64_t v245 = swift_bridgeObjectRetain();
                  uint64_t v246 = sub_260D63884(v245);
                  swift_bridgeObjectRelease();
                }
                while (v246 < 4);
              }
              unint64_t v9 = *v8;
              if ((*v8 & 0xC000000000000001) != 0) {
                goto LABEL_998;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 3uLL)
              {
                uint64_t v494 = *(void *)(v9 + 56);
                swift_unknownObjectRetain();
                goto LABEL_394;
              }
              __break(1u);
LABEL_1000:
              swift_bridgeObjectRetain();
              unint64_t v266 = MEMORY[0x2612287D0](1, v9);
              swift_bridgeObjectRelease();
LABEL_410:
              sub_260D73DAC(v494, v266, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = v498[15];
              unint64_t v9 = *v8;
              unint64_t v267 = swift_bridgeObjectRetain();
              uint64_t v268 = sub_260D63884(v267);
              swift_bridgeObjectRelease();
              if (v268 <= 1)
              {
                do
                {
                  double v272 = *(double *)(v7 + 48);
                  double v271 = *(double *)(v7 + 56);
                  v273 = self;
                  if (v272 <= -9.22337204e18) {
                    goto LABEL_848;
                  }
                  if (v272 >= 9.22337204e18) {
                    goto LABEL_849;
                  }
                  if ((*(void *)&v272 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v271 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_850;
                  }
                  if (v271 <= -9.22337204e18) {
                    goto LABEL_851;
                  }
                  if (v271 >= 9.22337204e18) {
                    goto LABEL_852;
                  }
                  id v275 = objc_msgSend(v273, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v272, (uint64_t)v271, 0);
                  objc_msgSend(v275, sel_setUsage_, 5);
                  id v276 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v275);

                  if (v276)
                  {
                    swift_beginAccess();
                    uint64_t v277 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v277);
                    sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *v8;
                  unint64_t v269 = swift_bridgeObjectRetain();
                  uint64_t v270 = sub_260D63884(v269);
                  swift_bridgeObjectRelease();
                }
                while (v270 < 2);
              }
              unint64_t v9 = *v8;
              if ((*v8 & 0xC000000000000001) != 0) {
                goto LABEL_1002;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                uint64_t v494 = *(void *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_426;
              }
              __break(1u);
LABEL_1004:
              swift_bridgeObjectRetain();
              unint64_t v289 = MEMORY[0x2612287D0](3, v9);
              swift_bridgeObjectRelease();
LABEL_442:
              sub_260D73DAC(v494, v289, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = v498[8];
              unint64_t v9 = *(void *)v24;
              unint64_t v290 = swift_bridgeObjectRetain();
              uint64_t v291 = sub_260D63884(v290);
              swift_bridgeObjectRelease();
              if (v291 <= 1)
              {
                do
                {
                  double v295 = *(double *)(v7 + 64);
                  double v294 = *(double *)(v7 + 72);
                  v296 = self;
                  if (v295 <= -9.22337204e18) {
                    goto LABEL_868;
                  }
                  if (v295 >= 9.22337204e18) {
                    goto LABEL_869;
                  }
                  if ((*(void *)&v295 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v294 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_870;
                  }
                  if (v294 <= -9.22337204e18) {
                    goto LABEL_871;
                  }
                  if (v294 >= 9.22337204e18) {
                    goto LABEL_872;
                  }
                  id v298 = objc_msgSend(v296, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v295, (uint64_t)v294, 0);
                  objc_msgSend(v298, sel_setUsage_, 5);
                  id v299 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v298);

                  if (v299)
                  {
                    swift_beginAccess();
                    uint64_t v300 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v300);
                    sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *(void *)v24;
                  unint64_t v292 = swift_bridgeObjectRetain();
                  uint64_t v293 = sub_260D63884(v292);
                  swift_bridgeObjectRelease();
                }
                while (v293 < 2);
              }
              unint64_t v9 = *(void *)v24;
              if ((*(void *)v24 & 0xC000000000000001) != 0) {
                goto LABEL_1006;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                uint64_t v494 = *(void *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_458;
              }
              __break(1u);
LABEL_1008:
              swift_bridgeObjectRetain();
              unint64_t v493 = MEMORY[0x2612287D0](0, v9);
              swift_bridgeObjectRelease();
LABEL_462:
              unint64_t v9 = *v8;
              unint64_t v303 = swift_bridgeObjectRetain();
              uint64_t v304 = sub_260D63884(v303);
              swift_bridgeObjectRelease();
              if (v304 <= 1)
              {
                do
                {
                  double v308 = *(double *)(v7 + 48);
                  double v307 = *(double *)(v7 + 56);
                  v309 = self;
                  if (v308 <= -9.22337204e18) {
                    goto LABEL_878;
                  }
                  if (v308 >= 9.22337204e18) {
                    goto LABEL_879;
                  }
                  if ((*(void *)&v308 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v307 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_880;
                  }
                  if (v307 <= -9.22337204e18) {
                    goto LABEL_881;
                  }
                  if (v307 >= 9.22337204e18) {
                    goto LABEL_882;
                  }
                  id v311 = objc_msgSend(v309, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v308, (uint64_t)v307, 0);
                  objc_msgSend(v311, sel_setUsage_, 5);
                  id v312 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v311);

                  if (v312)
                  {
                    swift_beginAccess();
                    uint64_t v313 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v313);
                    sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *v8;
                  unint64_t v305 = swift_bridgeObjectRetain();
                  uint64_t v306 = sub_260D63884(v305);
                  swift_bridgeObjectRelease();
                }
                while (v306 < 2);
              }
              unint64_t v9 = *v8;
              if ((*v8 & 0xC000000000000001) != 0) {
                goto LABEL_1010;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                uint64_t v314 = *(void *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_478;
              }
              __break(1u);
LABEL_1012:
              swift_bridgeObjectRetain();
              uint64_t v494 = MEMORY[0x2612287D0](1, v9);
              swift_bridgeObjectRelease();
              unint64_t v9 = *v8;
LABEL_494:
              unint64_t v326 = swift_bridgeObjectRetain();
              uint64_t v327 = sub_260D63884(v326);
              swift_bridgeObjectRelease();
              if (v327 <= 2)
              {
                do
                {
                  double v331 = *(double *)(v7 + 48);
                  double v330 = *(double *)(v7 + 56);
                  v332 = self;
                  if (v331 <= -9.22337204e18) {
                    goto LABEL_898;
                  }
                  if (v331 >= 9.22337204e18) {
                    goto LABEL_899;
                  }
                  if ((*(void *)&v331 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v330 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_900;
                  }
                  if (v330 <= -9.22337204e18) {
                    goto LABEL_901;
                  }
                  if (v330 >= 9.22337204e18) {
                    goto LABEL_902;
                  }
                  id v334 = objc_msgSend(v332, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v331, (uint64_t)v330, 0);
                  objc_msgSend(v334, sel_setUsage_, 5);
                  id v335 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v334);

                  if (v335)
                  {
                    swift_beginAccess();
                    uint64_t v336 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v336);
                    sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *v8;
                  unint64_t v328 = swift_bridgeObjectRetain();
                  uint64_t v329 = sub_260D63884(v328);
                  swift_bridgeObjectRelease();
                }
                while (v329 < 3);
              }
              unint64_t v9 = *v8;
              if ((*v8 & 0xC000000000000001) != 0) {
                goto LABEL_1014;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 2uLL)
              {
                unint64_t v493 = *(void *)(v9 + 48);
                swift_unknownObjectRetain();
                goto LABEL_510;
              }
              __break(1u);
LABEL_1016:
              swift_bridgeObjectRetain();
              uint64_t v340 = MEMORY[0x2612287D0](0, v9);
              swift_bridgeObjectRelease();
              v339 = v495;
LABEL_514:
              sub_260D73BC4(v494, v493, v340, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              if (v339)
              {
                a2 = v498[11];
                swift_unknownObjectRetain();
                unint64_t v9 = *(void *)v24;
                unint64_t v341 = swift_bridgeObjectRetain();
                uint64_t v342 = sub_260D63884(v341);
                swift_bridgeObjectRelease();
                if (v342 <= 0)
                {
                  do
                  {
                    double v478 = *(double *)(v7 + 64);
                    double v477 = *(double *)(v7 + 72);
                    v479 = self;
                    if (v478 <= -9.22337204e18) {
                      goto LABEL_923;
                    }
                    if (v478 >= 9.22337204e18) {
                      goto LABEL_924;
                    }
                    if ((*(void *)&v478 & 0x7FF0000000000000) == 0x7FF0000000000000
                      || (*(void *)&v477 & 0x7FF0000000000000) == 0x7FF0000000000000)
                    {
                      goto LABEL_925;
                    }
                    if (v477 <= -9.22337204e18) {
                      goto LABEL_926;
                    }
                    if (v477 >= 9.22337204e18) {
                      goto LABEL_927;
                    }
                    id v481 = objc_msgSend(v479, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v478, (uint64_t)v477, 0);
                    objc_msgSend(v481, sel_setUsage_, 5);
                    id v482 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v481);

                    if (v482)
                    {
                      swift_beginAccess();
                      uint64_t v483 = swift_unknownObjectRetain();
                      MEMORY[0x2612286A0](v483);
                      sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
                      sub_260D756D0();
                      sub_260D756B0();
                      swift_endAccess();
                      swift_unknownObjectRelease();
                    }
                    unint64_t v9 = *(void *)v24;
                    unint64_t v475 = swift_bridgeObjectRetain();
                    uint64_t v476 = sub_260D63884(v475);
                    swift_bridgeObjectRelease();
                  }
                  while (v476 < 1);
                }
                unint64_t v9 = *(void *)v24;
                if ((*(void *)v24 & 0xC000000000000001) != 0) {
                  goto LABEL_1018;
                }
                if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  uint64_t v494 = *(void *)(v9 + 32);
                  swift_unknownObjectRetain();
                  goto LABEL_519;
                }
                __break(1u);
                goto LABEL_1020;
              }
              v498 = (void *)v498[11];
              unint64_t v9 = *v8;
              unint64_t v451 = swift_bridgeObjectRetain();
              uint64_t v452 = sub_260D63884(v451);
              swift_bridgeObjectRelease();
              if (v452 <= 1)
              {
                do
                {
                  double v456 = *(double *)(v7 + 48);
                  double v455 = *(double *)(v7 + 56);
                  v457 = self;
                  if (v456 <= -9.22337204e18) {
                    goto LABEL_933;
                  }
                  if (v456 >= 9.22337204e18) {
                    goto LABEL_934;
                  }
                  if ((*(void *)&v456 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(void *)&v455 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_935;
                  }
                  if (v455 <= -9.22337204e18) {
                    goto LABEL_936;
                  }
                  if (v455 >= 9.22337204e18) {
                    goto LABEL_937;
                  }
                  id v459 = objc_msgSend(v457, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v456, (uint64_t)v455, 0);
                  objc_msgSend(v459, sel_setUsage_, 5);
                  id v460 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v459);

                  if (v460)
                  {
                    swift_beginAccess();
                    uint64_t v461 = swift_unknownObjectRetain();
                    MEMORY[0x2612286A0](v461);
                    sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
                    sub_260D756D0();
                    sub_260D756B0();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  unint64_t v9 = *v8;
                  unint64_t v453 = swift_bridgeObjectRetain();
                  uint64_t v454 = sub_260D63884(v453);
                  swift_bridgeObjectRelease();
                }
                while (v454 < 2);
              }
              unint64_t v9 = *v8;
              if ((*v8 & 0xC000000000000001) != 0) {
                goto LABEL_1026;
              }
              if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                id v8 = *(uint64_t **)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_680;
              }
              __break(1u);
LABEL_1028:
              swift_bridgeObjectRetain();
              uint64_t v474 = MEMORY[0x2612287D0](1, v9);
              swift_bridgeObjectRelease();
LABEL_696:
              sub_260D73BC4(a3, (unint64_t)v8, v474, a5);
LABEL_697:
              swift_unknownObjectRelease();
              return swift_unknownObjectRelease();
            }
LABEL_992:
            swift_bridgeObjectRetain();
            uint64_t v494 = MEMORY[0x2612287D0](1, v9);
            swift_bridgeObjectRelease();
LABEL_370:
            unint64_t v9 = *(void *)v24;
            unint64_t v240 = swift_bridgeObjectRetain();
            uint64_t v241 = sub_260D63884(v240);
            swift_bridgeObjectRelease();
            if (v241 <= 0)
            {
              do
              {
                double v427 = *(double *)(v7 + 64);
                double v426 = *(double *)(v7 + 72);
                v428 = self;
                if (v427 <= -9.22337204e18) {
                  goto LABEL_893;
                }
                if (v427 >= 9.22337204e18) {
                  goto LABEL_894;
                }
                if ((*(void *)&v427 & 0x7FF0000000000000) == 0x7FF0000000000000
                  || (*(void *)&v426 & 0x7FF0000000000000) == 0x7FF0000000000000)
                {
                  goto LABEL_895;
                }
                if (v426 <= -9.22337204e18) {
                  goto LABEL_896;
                }
                if (v426 >= 9.22337204e18) {
                  goto LABEL_897;
                }
                id v430 = objc_msgSend(v428, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v427, (uint64_t)v426, 0);
                objc_msgSend(v430, sel_setUsage_, 5);
                id v431 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v430);

                if (v431)
                {
                  swift_beginAccess();
                  uint64_t v432 = swift_unknownObjectRetain();
                  MEMORY[0x2612286A0](v432);
                  sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
                  sub_260D756D0();
                  sub_260D756B0();
                  swift_endAccess();
                  swift_unknownObjectRelease();
                }
                unint64_t v9 = *(void *)v24;
                unint64_t v424 = swift_bridgeObjectRetain();
                uint64_t v425 = sub_260D63884(v424);
                swift_bridgeObjectRelease();
              }
              while (v425 < 1);
            }
            unint64_t v9 = *(void *)v24;
            if ((*(void *)v24 & 0xC000000000000001) != 0) {
              goto LABEL_994;
            }
            if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              unint64_t v242 = *(void *)(v9 + 32);
              swift_unknownObjectRetain();
              goto LABEL_374;
            }
            __break(1u);
LABEL_996:
            swift_bridgeObjectRetain();
            unint64_t v254 = MEMORY[0x2612287D0](1, v9);
            swift_bridgeObjectRelease();
LABEL_390:
            sub_260D73DAC(a3, v254, a5);
            return swift_unknownObjectRelease();
          }
          while (1)
          {
            double v220 = *(double *)(v7 + 48);
            double v219 = *(double *)(v7 + 56);
            v221 = self;
            if (v220 <= -9.22337204e18) {
              break;
            }
            if (v220 >= 9.22337204e18) {
              goto LABEL_819;
            }
            if ((*(void *)&v220 & 0x7FF0000000000000) == 0x7FF0000000000000
              || (*(void *)&v219 & 0x7FF0000000000000) == 0x7FF0000000000000)
            {
              goto LABEL_820;
            }
            if (v219 <= -9.22337204e18) {
              goto LABEL_821;
            }
            if (v219 >= 9.22337204e18) {
              goto LABEL_822;
            }
            id v223 = objc_msgSend(v221, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v220, (uint64_t)v219, 0);
            objc_msgSend(v223, sel_setUsage_, 5);
            id v224 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v223);

            if (v224)
            {
              swift_beginAccess();
              uint64_t v225 = swift_unknownObjectRetain();
              MEMORY[0x2612286A0](v225);
              sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
              sub_260D756D0();
              sub_260D756B0();
              swift_endAccess();
              swift_unknownObjectRelease();
            }
            unint64_t v9 = *v8;
            unint64_t v217 = swift_bridgeObjectRetain();
            uint64_t v218 = sub_260D63884(v217);
            swift_bridgeObjectRelease();
            if (v218 >= 2) {
              goto LABEL_367;
            }
          }
LABEL_818:
          __break(1u);
LABEL_819:
          __break(1u);
LABEL_820:
          __break(1u);
LABEL_821:
          __break(1u);
LABEL_822:
          __break(1u);
LABEL_823:
          __break(1u);
LABEL_824:
          __break(1u);
LABEL_825:
          __break(1u);
LABEL_826:
          __break(1u);
LABEL_827:
          __break(1u);
LABEL_828:
          __break(1u);
LABEL_829:
          __break(1u);
LABEL_830:
          __break(1u);
LABEL_831:
          __break(1u);
LABEL_832:
          __break(1u);
LABEL_833:
          __break(1u);
LABEL_834:
          __break(1u);
LABEL_835:
          __break(1u);
LABEL_836:
          __break(1u);
LABEL_837:
          __break(1u);
LABEL_838:
          __break(1u);
LABEL_839:
          __break(1u);
LABEL_840:
          __break(1u);
LABEL_841:
          __break(1u);
LABEL_842:
          __break(1u);
LABEL_843:
          __break(1u);
LABEL_844:
          __break(1u);
LABEL_845:
          __break(1u);
LABEL_846:
          __break(1u);
LABEL_847:
          __break(1u);
LABEL_848:
          __break(1u);
LABEL_849:
          __break(1u);
LABEL_850:
          __break(1u);
LABEL_851:
          __break(1u);
LABEL_852:
          __break(1u);
LABEL_853:
          __break(1u);
LABEL_854:
          __break(1u);
LABEL_855:
          __break(1u);
LABEL_856:
          __break(1u);
LABEL_857:
          __break(1u);
LABEL_858:
          __break(1u);
LABEL_859:
          __break(1u);
LABEL_860:
          __break(1u);
LABEL_861:
          __break(1u);
LABEL_862:
          __break(1u);
LABEL_863:
          __break(1u);
LABEL_864:
          __break(1u);
LABEL_865:
          __break(1u);
LABEL_866:
          __break(1u);
LABEL_867:
          __break(1u);
LABEL_868:
          __break(1u);
LABEL_869:
          __break(1u);
LABEL_870:
          __break(1u);
LABEL_871:
          __break(1u);
LABEL_872:
          __break(1u);
LABEL_873:
          __break(1u);
LABEL_874:
          __break(1u);
LABEL_875:
          __break(1u);
LABEL_876:
          __break(1u);
LABEL_877:
          __break(1u);
LABEL_878:
          __break(1u);
LABEL_879:
          __break(1u);
LABEL_880:
          __break(1u);
LABEL_881:
          __break(1u);
LABEL_882:
          __break(1u);
LABEL_883:
          __break(1u);
LABEL_884:
          __break(1u);
LABEL_885:
          __break(1u);
LABEL_886:
          __break(1u);
LABEL_887:
          __break(1u);
LABEL_888:
          __break(1u);
LABEL_889:
          __break(1u);
LABEL_890:
          __break(1u);
LABEL_891:
          __break(1u);
LABEL_892:
          __break(1u);
LABEL_893:
          __break(1u);
LABEL_894:
          __break(1u);
LABEL_895:
          __break(1u);
LABEL_896:
          __break(1u);
LABEL_897:
          __break(1u);
LABEL_898:
          __break(1u);
LABEL_899:
          __break(1u);
LABEL_900:
          __break(1u);
LABEL_901:
          __break(1u);
LABEL_902:
          __break(1u);
LABEL_903:
          __break(1u);
LABEL_904:
          __break(1u);
LABEL_905:
          __break(1u);
LABEL_906:
          __break(1u);
LABEL_907:
          __break(1u);
LABEL_908:
          __break(1u);
LABEL_909:
          __break(1u);
LABEL_910:
          __break(1u);
LABEL_911:
          __break(1u);
LABEL_912:
          __break(1u);
LABEL_913:
          __break(1u);
LABEL_914:
          __break(1u);
LABEL_915:
          __break(1u);
LABEL_916:
          __break(1u);
LABEL_917:
          __break(1u);
LABEL_918:
          __break(1u);
LABEL_919:
          __break(1u);
LABEL_920:
          __break(1u);
LABEL_921:
          __break(1u);
LABEL_922:
          __break(1u);
LABEL_923:
          __break(1u);
LABEL_924:
          __break(1u);
LABEL_925:
          __break(1u);
LABEL_926:
          __break(1u);
LABEL_927:
          __break(1u);
LABEL_928:
          __break(1u);
LABEL_929:
          __break(1u);
LABEL_930:
          __break(1u);
LABEL_931:
          __break(1u);
LABEL_932:
          __break(1u);
LABEL_933:
          __break(1u);
LABEL_934:
          __break(1u);
LABEL_935:
          __break(1u);
LABEL_936:
          __break(1u);
LABEL_937:
          __break(1u);
LABEL_938:
          __break(1u);
LABEL_939:
          __break(1u);
LABEL_940:
          __break(1u);
LABEL_941:
          __break(1u);
LABEL_942:
          __break(1u);
LABEL_943:
          swift_bridgeObjectRetain();
          uint64_t v23 = MEMORY[0x2612287D0](0, v9);
          swift_bridgeObjectRelease();
LABEL_35:
          sub_260D73DAC(v23, a2, a5);
          swift_unknownObjectRelease();
          uint64_t v6 = 0xC3E0000000000001;
          uint64_t v24 = 0x7FF0000000000000;
          while (2)
          {
            unint64_t v9 = *v8;
            if (!((unint64_t)*v8 >> 62))
            {
              if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1) {
                break;
              }
              goto LABEL_38;
            }
            swift_bridgeObjectRetain();
            uint64_t v31 = sub_260D75810();
            swift_bridgeObjectRelease();
            if (v31 <= 1)
            {
LABEL_38:
              double v26 = *(double *)(v7 + 48);
              double v25 = *(double *)(v7 + 56);
              int v27 = self;
              if (v26 <= -9.22337204e18) {
                goto LABEL_733;
              }
              if (v26 >= 9.22337204e18) {
                goto LABEL_735;
              }
              if ((*(void *)&v26 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(void *)&v25 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_736;
              }
              if (v25 <= -9.22337204e18) {
                goto LABEL_739;
              }
              if (v25 >= 9.22337204e18) {
                goto LABEL_741;
              }
              id v28 = objc_msgSend(v27, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v26, (uint64_t)v25, 0);
              objc_msgSend(v28, sel_setUsage_, 5);
              id v29 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v28);

              if (v29)
              {
                swift_beginAccess();
                uint64_t v30 = swift_unknownObjectRetain();
                MEMORY[0x2612286A0](v30);
                if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_260D756C0();
                }
                sub_260D756D0();
                sub_260D756B0();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              continue;
            }
            break;
          }
          unint64_t v9 = *v8;
          if ((*v8 & 0xC000000000000001) == 0)
          {
            if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
            {
              uint64_t v33 = *(void *)(v9 + 40);
              swift_unknownObjectRetain();
              continue;
            }
            __break(1u);
            goto LABEL_949;
          }
          goto LABEL_947;
        }
      }
      else if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0)
      {
        goto LABEL_102;
      }
      double v42 = *(double *)(v7 + 48);
      double v41 = *(double *)(v7 + 56);
      float32x2_t v43 = self;
      if (v42 <= -9.22337204e18) {
        goto LABEL_743;
      }
      if (v42 >= 9.22337204e18) {
        goto LABEL_745;
      }
      if ((*(void *)&v42 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v41 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_747;
      }
      if (v41 <= -9.22337204e18) {
        goto LABEL_749;
      }
      if (v41 >= 9.22337204e18) {
        goto LABEL_751;
      }
      id v44 = objc_msgSend(v43, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v42, (uint64_t)v41, 0);
      objc_msgSend(v44, sel_setUsage_, 5);
      uint64_t v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v44);

      if (v6)
      {
        swift_beginAccess();
        uint64_t v45 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v45);
        if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_260D756C0();
        }
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
  }
  swift_beginAccess();
  while (1)
  {
    unint64_t v9 = *v8;
    if ((unint64_t)*v8 >> 62) {
      break;
    }
    if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0) {
      goto LABEL_32;
    }
LABEL_5:
    double v11 = *(double *)(v7 + 48);
    double v10 = *(double *)(v7 + 56);
    int v12 = self;
    if (v11 <= -9.22337204e18)
    {
      __break(1u);
LABEL_724:
      __break(1u);
LABEL_725:
      __break(1u);
LABEL_726:
      __break(1u);
LABEL_727:
      __break(1u);
LABEL_728:
      __break(1u);
LABEL_729:
      __break(1u);
LABEL_730:
      __break(1u);
LABEL_731:
      __break(1u);
LABEL_732:
      __break(1u);
LABEL_733:
      __break(1u);
LABEL_734:
      __break(1u);
LABEL_735:
      __break(1u);
LABEL_736:
      __break(1u);
LABEL_737:
      __break(1u);
LABEL_738:
      __break(1u);
LABEL_739:
      __break(1u);
LABEL_740:
      __break(1u);
LABEL_741:
      __break(1u);
LABEL_742:
      __break(1u);
LABEL_743:
      __break(1u);
LABEL_744:
      __break(1u);
LABEL_745:
      __break(1u);
LABEL_746:
      __break(1u);
LABEL_747:
      __break(1u);
LABEL_748:
      __break(1u);
LABEL_749:
      __break(1u);
LABEL_750:
      __break(1u);
LABEL_751:
      __break(1u);
LABEL_752:
      __break(1u);
LABEL_753:
      __break(1u);
LABEL_754:
      __break(1u);
LABEL_755:
      __break(1u);
LABEL_756:
      __break(1u);
LABEL_757:
      __break(1u);
LABEL_758:
      __break(1u);
LABEL_759:
      __break(1u);
LABEL_760:
      __break(1u);
LABEL_761:
      __break(1u);
LABEL_762:
      __break(1u);
      goto LABEL_763;
    }
    if (v11 >= 9.22337204e18) {
      goto LABEL_725;
    }
    if ((*(void *)&v11 & 0x7FF0000000000000) == 0x7FF0000000000000
      || (*(void *)&v10 & 0x7FF0000000000000) == 0x7FF0000000000000)
    {
      goto LABEL_727;
    }
    if (v10 <= -9.22337204e18) {
      goto LABEL_729;
    }
    if (v10 >= 9.22337204e18) {
      goto LABEL_731;
    }
    id v13 = objc_msgSend(v12, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v11, (uint64_t)v10, 0);
    objc_msgSend(v13, sel_setUsage_, 5);
    id v14 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v13);

    if (v14)
    {
      swift_beginAccess();
      uint64_t v15 = swift_unknownObjectRetain();
      MEMORY[0x2612286A0](v15);
      if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_260D756C0();
      }
      sub_260D756D0();
      sub_260D756B0();
      swift_endAccess();
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_260D75810();
  swift_bridgeObjectRelease();
  if (v16 <= 0) {
    goto LABEL_5;
  }
LABEL_32:
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_943;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v23 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_35;
  }
  __break(1u);
LABEL_945:
  swift_bridgeObjectRetain();
  uint64_t v32 = MEMORY[0x2612287D0](0, v9);
  swift_bridgeObjectRelease();
LABEL_53:
  sub_260D73DAC(v32, a2, a5);
  swift_unknownObjectRelease();
  uint64_t v33 = v498[3];
  uint64_t v24 = 0x7FF0000000000000;
  while (2)
  {
    unint64_t v9 = *v8;
    if (!((unint64_t)*v8 >> 62))
    {
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1) {
        break;
      }
      goto LABEL_56;
    }
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_260D75810();
    swift_bridgeObjectRelease();
    if (v40 <= 1)
    {
LABEL_56:
      double v35 = *(double *)(v7 + 48);
      double v34 = *(double *)(v7 + 56);
      id v36 = self;
      if (v35 <= -9.22337204e18) {
        goto LABEL_734;
      }
      if (v35 >= 9.22337204e18) {
        goto LABEL_737;
      }
      if ((*(void *)&v35 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v34 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_738;
      }
      if (v34 <= -9.22337204e18) {
        goto LABEL_740;
      }
      if (v34 >= 9.22337204e18) {
        goto LABEL_742;
      }
      id v37 = objc_msgSend(v36, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v35, (uint64_t)v34, 0);
      objc_msgSend(v37, sel_setUsage_, 5);
      id v38 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v37);

      if (v38)
      {
        swift_beginAccess();
        uint64_t v39 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v39);
        if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_260D756C0();
        }
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      continue;
    }
    break;
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0)
  {
LABEL_949:
    swift_bridgeObjectRetain();
    uint64_t v6 = MEMORY[0x2612287D0](1, v9);
    swift_bridgeObjectRelease();
    while (1)
    {
LABEL_88:
      unint64_t v9 = *v8;
      if ((unint64_t)*v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_260D75810();
        swift_bridgeObjectRelease();
        if (v53 > 0)
        {
LABEL_133:
          unint64_t v9 = *v8;
          if ((*v8 & 0xC000000000000001) != 0) {
            goto LABEL_953;
          }
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            unint64_t v75 = *(void *)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_136;
          }
          __break(1u);
LABEL_955:
          swift_bridgeObjectRetain();
          uint64_t v63 = MEMORY[0x2612287D0](0, v9);
          swift_bridgeObjectRelease();
          unint64_t v9 = *v8;
LABEL_120:
          unint64_t v64 = swift_bridgeObjectRetain();
          uint64_t v65 = sub_260D63884(v64);
          swift_bridgeObjectRelease();
          if (v65 > 1)
          {
LABEL_166:
            unint64_t v76 = *v8;
            if ((*v8 & 0xC000000000000001) != 0) {
              goto LABEL_959;
            }
            unint64_t v9 = (unint64_t)v495;
            if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 1uLL)
            {
              __break(1u);
              goto LABEL_962;
            }
            unint64_t v94 = *(void *)(v76 + 40);
            swift_unknownObjectRetain();
            goto LABEL_169;
          }
          uint64_t v24 = 0xC3E0000000000001;
          while (1)
          {
            double v69 = *(double *)(v7 + 48);
            double v68 = *(double *)(v7 + 56);
            float v70 = self;
            if (v69 <= -9.22337204e18) {
              break;
            }
            if (v69 >= 9.22337204e18) {
              goto LABEL_765;
            }
            if ((*(void *)&v69 & 0x7FF0000000000000) == 0x7FF0000000000000
              || (*(void *)&v68 & 0x7FF0000000000000) == 0x7FF0000000000000)
            {
              goto LABEL_766;
            }
            if (v68 <= -9.22337204e18) {
              goto LABEL_767;
            }
            if (v68 >= 9.22337204e18) {
              goto LABEL_771;
            }
            id v72 = objc_msgSend(v70, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v69, (uint64_t)v68, 0);
            objc_msgSend(v72, sel_setUsage_, 5);
            id v73 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v72);

            if (v73)
            {
              swift_beginAccess();
              uint64_t v74 = swift_unknownObjectRetain();
              MEMORY[0x2612286A0](v74);
              uint64_t v6 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
              sub_260D6A714(v6);
              sub_260D756D0();
              sub_260D756B0();
              swift_endAccess();
              swift_unknownObjectRelease();
            }
            unint64_t v9 = *v8;
            unint64_t v66 = swift_bridgeObjectRetain();
            uint64_t v67 = sub_260D63884(v66);
            swift_bridgeObjectRelease();
            if (v67 >= 2) {
              goto LABEL_166;
            }
          }
LABEL_763:
          __break(1u);
LABEL_764:
          __break(1u);
LABEL_765:
          __break(1u);
LABEL_766:
          __break(1u);
LABEL_767:
          __break(1u);
LABEL_768:
          __break(1u);
LABEL_769:
          __break(1u);
LABEL_770:
          __break(1u);
LABEL_771:
          __break(1u);
LABEL_772:
          __break(1u);
LABEL_773:
          __break(1u);
LABEL_774:
          __break(1u);
LABEL_775:
          __break(1u);
LABEL_776:
          __break(1u);
LABEL_777:
          __break(1u);
LABEL_778:
          __break(1u);
LABEL_779:
          __break(1u);
LABEL_780:
          __break(1u);
LABEL_781:
          __break(1u);
LABEL_782:
          __break(1u);
LABEL_783:
          __break(1u);
LABEL_784:
          __break(1u);
LABEL_785:
          __break(1u);
LABEL_786:
          __break(1u);
LABEL_787:
          __break(1u);
LABEL_788:
          __break(1u);
LABEL_789:
          __break(1u);
LABEL_790:
          __break(1u);
LABEL_791:
          __break(1u);
LABEL_792:
          __break(1u);
LABEL_793:
          __break(1u);
LABEL_794:
          __break(1u);
LABEL_795:
          __break(1u);
LABEL_796:
          __break(1u);
LABEL_797:
          __break(1u);
LABEL_798:
          __break(1u);
LABEL_799:
          __break(1u);
LABEL_800:
          __break(1u);
LABEL_801:
          __break(1u);
LABEL_802:
          __break(1u);
LABEL_803:
          __break(1u);
LABEL_804:
          __break(1u);
LABEL_805:
          __break(1u);
LABEL_806:
          __break(1u);
LABEL_807:
          __break(1u);
LABEL_808:
          __break(1u);
LABEL_809:
          __break(1u);
LABEL_810:
          __break(1u);
LABEL_811:
          __break(1u);
LABEL_812:
          __break(1u);
LABEL_813:
          __break(1u);
LABEL_814:
          __break(1u);
LABEL_815:
          __break(1u);
LABEL_816:
          __break(1u);
LABEL_817:
          __break(1u);
          goto LABEL_818;
        }
      }
      else if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0)
      {
        goto LABEL_133;
      }
      double v48 = *(double *)(v7 + 48);
      double v47 = *(double *)(v7 + 56);
      id v49 = self;
      if (v48 <= -9.22337204e18) {
        goto LABEL_744;
      }
      if (v48 >= 9.22337204e18) {
        goto LABEL_746;
      }
      if ((*(void *)&v48 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v47 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_748;
      }
      if (v47 <= -9.22337204e18) {
        goto LABEL_750;
      }
      if (v47 >= 9.22337204e18) {
        goto LABEL_752;
      }
      id v50 = objc_msgSend(v49, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v48, (uint64_t)v47, 0);
      objc_msgSend(v50, sel_setUsage_, 5);
      id v51 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v50);

      if (v51)
      {
        swift_beginAccess();
        uint64_t v52 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v52);
        if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_260D756C0();
        }
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    uint64_t v6 = *(void *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_88;
  }
  __break(1u);
LABEL_951:
  swift_bridgeObjectRetain();
  unint64_t v54 = MEMORY[0x2612287D0](0, v9);
  swift_bridgeObjectRelease();
LABEL_105:
  sub_260D73DAC(v33, v54, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __n128 v55 = (void *)v498[4];
  uint64_t v24 = 0xC3E0000000000001;
  uint64_t v6 = 0x43E0000000000000;
  while (2)
  {
    unint64_t v9 = *v8;
    if (!((unint64_t)*v8 >> 62))
    {
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0) {
        break;
      }
      goto LABEL_108;
    }
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_260D75810();
    swift_bridgeObjectRelease();
    if (v62 <= 0)
    {
LABEL_108:
      double v57 = *(double *)(v7 + 48);
      double v56 = *(double *)(v7 + 56);
      uint64_t v58 = self;
      if (v57 <= -9.22337204e18) {
        goto LABEL_753;
      }
      if (v57 >= 9.22337204e18) {
        goto LABEL_755;
      }
      if ((*(void *)&v57 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v56 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_757;
      }
      if (v56 <= -9.22337204e18) {
        goto LABEL_759;
      }
      if (v56 >= 9.22337204e18) {
        goto LABEL_760;
      }
      id v59 = objc_msgSend(v58, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v57, (uint64_t)v56, 0);
      objc_msgSend(v59, sel_setUsage_, 5);
      id v60 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v59);

      if (v60)
      {
        swift_beginAccess();
        uint64_t v61 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v61);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      continue;
    }
    break;
  }
  unint64_t v9 = *v8;
  v495 = v55;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_955;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v63 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_120;
  }
  __break(1u);
LABEL_957:
  swift_bridgeObjectRetain();
  uint64_t v6 = MEMORY[0x2612287D0](0, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_153:
  unint64_t v83 = swift_bridgeObjectRetain();
  uint64_t v84 = sub_260D63884(v83);
  swift_bridgeObjectRelease();
  if (v84 <= 1)
  {
    uint64_t v24 = 0x43E0000000000000;
    do
    {
      double v88 = *(double *)(v7 + 48);
      double v87 = *(double *)(v7 + 56);
      uint64_t v89 = self;
      if (v88 <= -9.22337204e18) {
        goto LABEL_764;
      }
      if (v88 >= 9.22337204e18) {
        goto LABEL_768;
      }
      if ((*(void *)&v88 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v87 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_769;
      }
      if (v87 <= -9.22337204e18) {
        goto LABEL_770;
      }
      if (v87 >= 9.22337204e18) {
        goto LABEL_772;
      }
      id v91 = objc_msgSend(v89, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v88, (uint64_t)v87, 0);
      objc_msgSend(v91, sel_setUsage_, 5);
      id v92 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v91);

      if (v92)
      {
        swift_beginAccess();
        uint64_t v93 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v93);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v85 = swift_bridgeObjectRetain();
      uint64_t v86 = sub_260D63884(v85);
      swift_bridgeObjectRelease();
    }
    while (v86 < 2);
  }
  uint64_t v107 = *v8;
  if ((*v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    unint64_t v108 = MEMORY[0x2612287D0](1, v107);
    swift_bridgeObjectRelease();
LABEL_185:
    sub_260D73DAC(v6, v108, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v63 = v498[5];
    unint64_t v9 = *v8;
    unint64_t v109 = swift_bridgeObjectRetain();
    uint64_t v110 = sub_260D63884(v109);
    swift_bridgeObjectRelease();
    if (v110 <= 1)
    {
      uint64_t v107 = 0xC3E0000000000001;
      uint64_t v24 = 0x43E0000000000000;
      do
      {
        double v114 = *(double *)(v7 + 48);
        double v113 = *(double *)(v7 + 56);
        v115 = self;
        if (v114 <= -9.22337204e18) {
          goto LABEL_774;
        }
        if (v114 >= 9.22337204e18) {
          goto LABEL_778;
        }
        if ((*(void *)&v114 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v113 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_779;
        }
        if (v113 <= -9.22337204e18) {
          goto LABEL_780;
        }
        if (v113 >= 9.22337204e18) {
          goto LABEL_782;
        }
        id v117 = objc_msgSend(v115, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v114, (uint64_t)v113, 0);
        objc_msgSend(v117, sel_setUsage_, 5);
        uint64_t v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v117);

        if (v6)
        {
          swift_beginAccess();
          uint64_t v118 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v118);
          sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v111 = swift_bridgeObjectRetain();
        uint64_t v112 = sub_260D63884(v111);
        swift_bridgeObjectRelease();
      }
      while (v112 < 2);
    }
    unint64_t v9 = *v8;
    uint64_t v494 = v63;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_965;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
    {
      uint64_t v6 = *(void *)(v9 + 40);
      swift_unknownObjectRetain();
      goto LABEL_221;
    }
    __break(1u);
    goto LABEL_967;
  }
  unint64_t v9 = v494;
  if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    unint64_t v108 = *(void *)(v107 + 40);
    swift_unknownObjectRetain();
    goto LABEL_185;
  }
LABEL_962:
  __break(1u);
LABEL_963:
  swift_bridgeObjectRetain();
  uint64_t v63 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_201:
  unint64_t v119 = swift_bridgeObjectRetain();
  uint64_t v120 = sub_260D63884(v119);
  swift_bridgeObjectRelease();
  if (v120 <= 0)
  {
    uint64_t v24 = 0xC3E0000000000001;
    do
    {
      double v357 = *(double *)(v7 + 48);
      double v356 = *(double *)(v7 + 56);
      v358 = self;
      if (v357 <= -9.22337204e18) {
        goto LABEL_833;
      }
      if (v357 >= 9.22337204e18) {
        goto LABEL_834;
      }
      if ((*(void *)&v357 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v356 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_837;
      }
      if (v356 <= -9.22337204e18) {
        goto LABEL_838;
      }
      if (v356 >= 9.22337204e18) {
        goto LABEL_839;
      }
      id v360 = objc_msgSend(v358, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v357, (uint64_t)v356, 0);
      objc_msgSend(v360, sel_setUsage_, 5);
      id v361 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v360);

      if (v361)
      {
        swift_beginAccess();
        uint64_t v362 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v362);
        uint64_t v6 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_260D6A714(v6);
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v354 = swift_bridgeObjectRetain();
      uint64_t v355 = sub_260D63884(v354);
      swift_bridgeObjectRelease();
    }
    while (v355 < 1);
  }
  uint64_t v107 = *v8;
  if ((*v8 & 0xC000000000000001) != 0)
  {
LABEL_967:
    swift_bridgeObjectRetain();
    uint64_t v121 = MEMORY[0x2612287D0](0, v107);
    swift_bridgeObjectRelease();
LABEL_205:
    sub_260D73BC4(v63, a2, v121, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    unint64_t v122 = v498[6];
    unint64_t v9 = *v8;
    unint64_t v123 = swift_bridgeObjectRetain();
    uint64_t v124 = sub_260D63884(v123);
    swift_bridgeObjectRelease();
    if (v124 <= 2)
    {
      uint64_t v63 = 0xC3E0000000000001;
      uint64_t v6 = 0x43E0000000000000;
      uint64_t v107 = 0x7FF0000000000000;
      do
      {
        double v128 = *(double *)(v7 + 48);
        double v127 = *(double *)(v7 + 56);
        v129 = self;
        if (v128 <= -9.22337204e18) {
          goto LABEL_783;
        }
        if (v128 >= 9.22337204e18) {
          goto LABEL_784;
        }
        if ((*(void *)&v128 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v127 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_785;
        }
        if (v127 <= -9.22337204e18) {
          goto LABEL_786;
        }
        if (v127 >= 9.22337204e18) {
          goto LABEL_791;
        }
        id v131 = objc_msgSend(v129, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v128, (uint64_t)v127, 0);
        objc_msgSend(v131, sel_setUsage_, 5);
        id v132 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v131);

        if (v132)
        {
          swift_beginAccess();
          uint64_t v133 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v133);
          uint64_t v24 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
          sub_260D6A714(v24);
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v125 = swift_bridgeObjectRetain();
        uint64_t v126 = sub_260D63884(v125);
        swift_bridgeObjectRelease();
      }
      while (v126 < 3);
    }
    unint64_t v9 = *v8;
    a2 = v122;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_971;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 2uLL)
    {
      uint64_t v148 = *(void *)(v9 + 48);
      swift_unknownObjectRetain();
      goto LABEL_241;
    }
    __break(1u);
    goto LABEL_973;
  }
  if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v121 = *(void *)(v107 + 32);
    swift_unknownObjectRetain();
    goto LABEL_205;
  }
  __break(1u);
LABEL_969:
  swift_bridgeObjectRetain();
  uint64_t v136 = MEMORY[0x2612287D0](0, v107);
  swift_bridgeObjectRelease();
LABEL_225:
  sub_260D73BC4(v6, a2, v136, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = v498[6];
  unint64_t v9 = *v8;
  unint64_t v137 = swift_bridgeObjectRetain();
  uint64_t v138 = sub_260D63884(v137);
  swift_bridgeObjectRelease();
  if (v138 <= 2)
  {
    uint64_t v107 = 0xC3E0000000000001;
    uint64_t v6 = 0x43E0000000000000;
    uint64_t v24 = 0x7FF0000000000000;
    do
    {
      double v142 = *(double *)(v7 + 48);
      double v141 = *(double *)(v7 + 56);
      v143 = self;
      if (v142 <= -9.22337204e18) {
        goto LABEL_787;
      }
      if (v142 >= 9.22337204e18) {
        goto LABEL_788;
      }
      if ((*(void *)&v142 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v141 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_789;
      }
      if (v141 <= -9.22337204e18) {
        goto LABEL_790;
      }
      if (v141 >= 9.22337204e18) {
        goto LABEL_792;
      }
      id v145 = objc_msgSend(v143, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v142, (uint64_t)v141, 0);
      objc_msgSend(v145, sel_setUsage_, 5);
      id v146 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v145);

      if (v146)
      {
        swift_beginAccess();
        uint64_t v147 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v147);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v139 = swift_bridgeObjectRetain();
      uint64_t v140 = sub_260D63884(v139);
      swift_bridgeObjectRelease();
    }
    while (v140 < 3);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0)
  {
LABEL_973:
    swift_bridgeObjectRetain();
    uint64_t v63 = MEMORY[0x2612287D0](2, v9);
    swift_bridgeObjectRelease();
    unint64_t v9 = *v8;
LABEL_257:
    unint64_t v160 = swift_bridgeObjectRetain();
    uint64_t v161 = sub_260D63884(v160);
    swift_bridgeObjectRelease();
    if (v161 <= 1)
    {
      uint64_t v107 = 0xC3E0000000000001;
      uint64_t v24 = 0x7FF0000000000000;
      do
      {
        double v165 = *(double *)(v7 + 48);
        double v164 = *(double *)(v7 + 56);
        v166 = self;
        if (v165 <= -9.22337204e18) {
          goto LABEL_795;
        }
        if (v165 >= 9.22337204e18) {
          goto LABEL_796;
        }
        if ((*(void *)&v165 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v164 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_800;
        }
        if (v164 <= -9.22337204e18) {
          goto LABEL_801;
        }
        if (v164 >= 9.22337204e18) {
          goto LABEL_802;
        }
        id v168 = objc_msgSend(v166, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v165, (uint64_t)v164, 0);
        objc_msgSend(v168, sel_setUsage_, 5);
        id v169 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v168);

        if (v169)
        {
          swift_beginAccess();
          uint64_t v170 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v170);
          sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v162 = swift_bridgeObjectRetain();
        uint64_t v163 = sub_260D63884(v162);
        swift_bridgeObjectRelease();
      }
      while (v163 < 2);
    }
    unint64_t v9 = *v8;
    uint64_t v494 = v63;
    if ((*v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = MEMORY[0x2612287D0](1, v9);
      swift_bridgeObjectRelease();
      unint64_t v9 = *v8;
    }
    else
    {
      if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 1uLL) {
        goto LABEL_977;
      }
      uint64_t v6 = *(void *)(v9 + 40);
      swift_unknownObjectRetain();
    }
    unint64_t v186 = swift_bridgeObjectRetain();
    uint64_t v187 = sub_260D63884(v186);
    swift_bridgeObjectRelease();
    if (v187 <= 0)
    {
      uint64_t v24 = 0x43E0000000000000;
      uint64_t v63 = 0x7FF0000000000000;
      do
      {
        double v384 = *(double *)(v7 + 48);
        double v383 = *(double *)(v7 + 56);
        v385 = self;
        if (v384 <= -9.22337204e18) {
          goto LABEL_859;
        }
        if (v384 >= 9.22337204e18) {
          goto LABEL_864;
        }
        if ((*(void *)&v384 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v383 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_865;
        }
        if (v383 <= -9.22337204e18) {
          goto LABEL_866;
        }
        if (v383 >= 9.22337204e18) {
          goto LABEL_867;
        }
        id v387 = objc_msgSend(v385, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v384, (uint64_t)v383, 0);
        objc_msgSend(v387, sel_setUsage_, 5);
        id v388 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v387);

        if (v388)
        {
          swift_beginAccess();
          uint64_t v389 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v389);
          sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v381 = swift_bridgeObjectRetain();
        uint64_t v382 = sub_260D63884(v381);
        swift_bridgeObjectRelease();
      }
      while (v382 < 1);
    }
    unint64_t v9 = *v8;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_980;
    }
    uint64_t v107 = v494;
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v188 = *(void *)(v9 + 32);
      swift_unknownObjectRetain();
      goto LABEL_298;
    }
    __break(1u);
    goto LABEL_982;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 2uLL)
  {
    uint64_t v63 = *(void *)(v9 + 48);
    swift_unknownObjectRetain();
    goto LABEL_257;
  }
  __break(1u);
LABEL_975:
  swift_bridgeObjectRetain();
  uint64_t v63 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_273:
  unint64_t v171 = swift_bridgeObjectRetain();
  uint64_t v172 = sub_260D63884(v171);
  swift_bridgeObjectRelease();
  if (v172 <= 0)
  {
    do
    {
      double v375 = *(double *)(v7 + 48);
      double v374 = *(double *)(v7 + 56);
      v376 = self;
      if (v375 <= -9.22337204e18) {
        goto LABEL_858;
      }
      if (v375 >= 9.22337204e18) {
        goto LABEL_860;
      }
      if ((*(void *)&v375 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v374 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_861;
      }
      if (v374 <= -9.22337204e18) {
        goto LABEL_862;
      }
      if (v374 >= 9.22337204e18) {
        goto LABEL_863;
      }
      id v378 = objc_msgSend(v376, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v375, (uint64_t)v374, 0);
      objc_msgSend(v378, sel_setUsage_, 5);
      id v379 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v378);

      if (v379)
      {
        swift_beginAccess();
        uint64_t v380 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v380);
        uint64_t v6 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_260D6A714(v6);
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v372 = swift_bridgeObjectRetain();
      uint64_t v373 = sub_260D63884(v372);
      swift_bridgeObjectRelease();
    }
    while (v373 < 1);
  }
  uint64_t v107 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_978;
  }
  unint64_t v9 = a2;
  uint64_t v24 = (uint64_t)v495;
  if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v173 = *(void *)(v107 + 32);
    swift_unknownObjectRetain();
    goto LABEL_277;
  }
  __break(1u);
LABEL_980:
  swift_bridgeObjectRetain();
  uint64_t v188 = MEMORY[0x2612287D0](0, v9);
  swift_bridgeObjectRelease();
  uint64_t v107 = v494;
LABEL_298:
  sub_260D73BC4(v107, v6, v188, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = v498[7];
  uint64_t v24 = v7 + 32;
  swift_beginAccess();
  unint64_t v9 = *(void *)(v7 + 32);
  unint64_t v189 = swift_bridgeObjectRetain();
  uint64_t v190 = sub_260D63884(v189);
  swift_bridgeObjectRelease();
  if (v190 <= 0)
  {
    uint64_t v107 = 0xC3E0000000000001;
    uint64_t v63 = 0x7FF0000000000000;
    do
    {
      double v393 = *(double *)(v7 + 64);
      double v392 = *(double *)(v7 + 72);
      v394 = self;
      if (v393 <= -9.22337204e18) {
        goto LABEL_873;
      }
      if (v393 >= 9.22337204e18) {
        goto LABEL_874;
      }
      if ((*(void *)&v393 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v392 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_875;
      }
      if (v392 <= -9.22337204e18) {
        goto LABEL_876;
      }
      if (v392 >= 9.22337204e18) {
        goto LABEL_877;
      }
      id v396 = objc_msgSend(v394, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v393, (uint64_t)v392, 0);
      objc_msgSend(v396, sel_setUsage_, 5);
      id v397 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v396);

      if (v397)
      {
        swift_beginAccess();
        uint64_t v398 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v398);
        sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *(void *)v24;
      unint64_t v390 = swift_bridgeObjectRetain();
      uint64_t v391 = sub_260D63884(v390);
      swift_bridgeObjectRelease();
    }
    while (v391 < 1);
  }
  unint64_t v9 = *(void *)v24;
  if ((*(void *)v24 & 0xC000000000000001) != 0)
  {
LABEL_982:
    swift_bridgeObjectRetain();
    uint64_t v494 = MEMORY[0x2612287D0](0, v9);
    swift_bridgeObjectRelease();
LABEL_302:
    unint64_t v9 = *v8;
    unint64_t v191 = swift_bridgeObjectRetain();
    uint64_t v192 = sub_260D63884(v191);
    swift_bridgeObjectRelease();
    if (v192 <= 2)
    {
      do
      {
        double v196 = *(double *)(v7 + 48);
        double v195 = *(double *)(v7 + 56);
        v197 = self;
        if (v196 <= -9.22337204e18) {
          goto LABEL_808;
        }
        if (v196 >= 9.22337204e18) {
          goto LABEL_809;
        }
        if ((*(void *)&v196 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v195 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_810;
        }
        if (v195 <= -9.22337204e18) {
          goto LABEL_811;
        }
        if (v195 >= 9.22337204e18) {
          goto LABEL_812;
        }
        id v199 = objc_msgSend(v197, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v196, (uint64_t)v195, 0);
        objc_msgSend(v199, sel_setUsage_, 5);
        id v200 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v199);

        if (v200)
        {
          swift_beginAccess();
          uint64_t v201 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v201);
          sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v193 = swift_bridgeObjectRetain();
        uint64_t v194 = sub_260D63884(v193);
        swift_bridgeObjectRelease();
      }
      while (v194 < 3);
    }
    unint64_t v9 = *v8;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_986;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 2uLL)
    {
      unint64_t v214 = *(void *)(v9 + 48);
      swift_unknownObjectRetain();
      goto LABEL_334;
    }
    __break(1u);
    goto LABEL_988;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v494 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_302;
  }
  __break(1u);
LABEL_984:
  swift_bridgeObjectRetain();
  uint64_t v202 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_318:
  unint64_t v203 = swift_bridgeObjectRetain();
  uint64_t v204 = sub_260D63884(v203);
  swift_bridgeObjectRelease();
  if (v204 <= 2)
  {
    uint64_t v107 = 0x7FF0000000000000;
    do
    {
      double v208 = *(double *)(v7 + 48);
      double v207 = *(double *)(v7 + 56);
      v209 = self;
      if (v208 <= -9.22337204e18) {
        goto LABEL_813;
      }
      if (v208 >= 9.22337204e18) {
        goto LABEL_814;
      }
      if ((*(void *)&v208 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v207 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_815;
      }
      if (v207 <= -9.22337204e18) {
        goto LABEL_816;
      }
      if (v207 >= 9.22337204e18) {
        goto LABEL_817;
      }
      id v211 = objc_msgSend(v209, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v208, (uint64_t)v207, 0);
      objc_msgSend(v211, sel_setUsage_, 5);
      id v212 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v211);

      if (v212)
      {
        swift_beginAccess();
        uint64_t v213 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v213);
        uint64_t v63 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_260D6A714(v63);
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v205 = swift_bridgeObjectRetain();
      uint64_t v206 = sub_260D63884(v205);
      swift_bridgeObjectRelease();
    }
    while (v206 < 3);
  }
  unint64_t v9 = *v8;
  v495 = (void *)v202;
  if ((*v8 & 0xC000000000000001) != 0)
  {
LABEL_988:
    swift_bridgeObjectRetain();
    uint64_t v63 = MEMORY[0x2612287D0](2, v9);
    swift_bridgeObjectRelease();
    unint64_t v9 = *v8;
LABEL_350:
    unint64_t v226 = swift_bridgeObjectRetain();
    uint64_t v227 = sub_260D63884(v226);
    swift_bridgeObjectRelease();
    if (v227 <= 0)
    {
      do
      {
        double v413 = *(double *)(v7 + 48);
        double v412 = *(double *)(v7 + 56);
        v414 = self;
        if (v413 <= -9.22337204e18) {
          goto LABEL_883;
        }
        if (v413 >= 9.22337204e18) {
          goto LABEL_884;
        }
        if ((*(void *)&v413 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v412 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_885;
        }
        if (v412 <= -9.22337204e18) {
          goto LABEL_886;
        }
        if (v412 >= 9.22337204e18) {
          goto LABEL_887;
        }
        id v416 = objc_msgSend(v414, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v413, (uint64_t)v412, 0);
        objc_msgSend(v416, sel_setUsage_, 5);
        id v417 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v416);

        if (v417)
        {
          swift_beginAccess();
          uint64_t v418 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v418);
          sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *v8;
        unint64_t v410 = swift_bridgeObjectRetain();
        uint64_t v411 = sub_260D63884(v410);
        swift_bridgeObjectRelease();
      }
      while (v411 < 1);
    }
    uint64_t v107 = *v8;
    if ((*v8 & 0xC000000000000001) != 0) {
      goto LABEL_990;
    }
    unint64_t v9 = a2;
    uint64_t v24 = (uint64_t)v495;
    if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v228 = *(void *)(v107 + 32);
      swift_unknownObjectRetain();
      goto LABEL_354;
    }
    __break(1u);
    goto LABEL_992;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 2uLL)
  {
    uint64_t v63 = *(void *)(v9 + 48);
    swift_unknownObjectRetain();
    goto LABEL_350;
  }
  __break(1u);
LABEL_990:
  swift_bridgeObjectRetain();
  uint64_t v228 = MEMORY[0x2612287D0](0, v107);
  swift_bridgeObjectRelease();
  uint64_t v24 = (uint64_t)v495;
LABEL_354:
  sub_260D73BC4(v24, v63, v228, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  unint64_t v9 = *v8;
  unint64_t v229 = swift_bridgeObjectRetain();
  uint64_t v230 = sub_260D63884(v229);
  swift_bridgeObjectRelease();
  if (v230 <= 1)
  {
    do
    {
      double v234 = *(double *)(v7 + 48);
      double v233 = *(double *)(v7 + 56);
      v235 = self;
      if (v234 <= -9.22337204e18) {
        goto LABEL_823;
      }
      if (v234 >= 9.22337204e18) {
        goto LABEL_824;
      }
      if ((*(void *)&v234 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v233 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_825;
      }
      if (v233 <= -9.22337204e18) {
        goto LABEL_826;
      }
      if (v233 >= 9.22337204e18) {
        goto LABEL_827;
      }
      id v237 = objc_msgSend(v235, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v234, (uint64_t)v233, 0);
      objc_msgSend(v237, sel_setUsage_, 5);
      id v238 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v237);

      if (v238)
      {
        swift_beginAccess();
        uint64_t v239 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v239);
        uint64_t v24 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_260D6A714(v24);
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v231 = swift_bridgeObjectRetain();
      uint64_t v232 = sub_260D63884(v231);
      swift_bridgeObjectRelease();
    }
    while (v232 < 2);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_996;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    unint64_t v254 = *(void *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_390;
  }
  __break(1u);
LABEL_998:
  swift_bridgeObjectRetain();
  uint64_t v494 = MEMORY[0x2612287D0](3, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_394:
  unint64_t v255 = swift_bridgeObjectRetain();
  uint64_t v256 = sub_260D63884(v255);
  swift_bridgeObjectRelease();
  if (v256 <= 1)
  {
    do
    {
      double v260 = *(double *)(v7 + 48);
      double v259 = *(double *)(v7 + 56);
      v261 = self;
      if (v260 <= -9.22337204e18) {
        goto LABEL_843;
      }
      if (v260 >= 9.22337204e18) {
        goto LABEL_844;
      }
      if ((*(void *)&v260 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v259 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_845;
      }
      if (v259 <= -9.22337204e18) {
        goto LABEL_846;
      }
      if (v259 >= 9.22337204e18) {
        goto LABEL_847;
      }
      id v263 = objc_msgSend(v261, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v260, (uint64_t)v259, 0);
      objc_msgSend(v263, sel_setUsage_, 5);
      id v264 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v263);

      if (v264)
      {
        swift_beginAccess();
        uint64_t v265 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v265);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v257 = swift_bridgeObjectRetain();
      uint64_t v258 = sub_260D63884(v257);
      swift_bridgeObjectRelease();
    }
    while (v258 < 2);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_1000;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    unint64_t v266 = *(void *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_410;
  }
  __break(1u);
LABEL_1002:
  swift_bridgeObjectRetain();
  uint64_t v494 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_426:
  unint64_t v278 = swift_bridgeObjectRetain();
  uint64_t v279 = sub_260D63884(v278);
  swift_bridgeObjectRelease();
  if (v279 <= 3)
  {
    do
    {
      double v283 = *(double *)(v7 + 48);
      double v282 = *(double *)(v7 + 56);
      v284 = self;
      if (v283 <= -9.22337204e18) {
        goto LABEL_853;
      }
      if (v283 >= 9.22337204e18) {
        goto LABEL_854;
      }
      if ((*(void *)&v283 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v282 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_855;
      }
      if (v282 <= -9.22337204e18) {
        goto LABEL_856;
      }
      if (v282 >= 9.22337204e18) {
        goto LABEL_857;
      }
      id v286 = objc_msgSend(v284, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v283, (uint64_t)v282, 0);
      objc_msgSend(v286, sel_setUsage_, 5);
      id v287 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v286);

      if (v287)
      {
        swift_beginAccess();
        uint64_t v288 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v288);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v280 = swift_bridgeObjectRetain();
      uint64_t v281 = sub_260D63884(v280);
      swift_bridgeObjectRelease();
    }
    while (v281 < 4);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_1004;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 3uLL)
  {
    unint64_t v289 = *(void *)(v9 + 56);
    swift_unknownObjectRetain();
    goto LABEL_442;
  }
  __break(1u);
LABEL_1006:
  swift_bridgeObjectRetain();
  uint64_t v494 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)v24;
LABEL_458:
  unint64_t v301 = swift_bridgeObjectRetain();
  uint64_t v302 = sub_260D63884(v301);
  swift_bridgeObjectRelease();
  if (v302 <= 0)
  {
    do
    {
      double v436 = *(double *)(v7 + 64);
      double v435 = *(double *)(v7 + 72);
      v437 = self;
      if (v436 <= -9.22337204e18) {
        goto LABEL_903;
      }
      if (v436 >= 9.22337204e18) {
        goto LABEL_904;
      }
      if ((*(void *)&v436 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v435 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_905;
      }
      if (v435 <= -9.22337204e18) {
        goto LABEL_906;
      }
      if (v435 >= 9.22337204e18) {
        goto LABEL_907;
      }
      id v439 = objc_msgSend(v437, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v436, (uint64_t)v435, 0);
      objc_msgSend(v439, sel_setUsage_, 5);
      id v440 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v439);

      if (v440)
      {
        swift_beginAccess();
        uint64_t v441 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v441);
        sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *(void *)v24;
      unint64_t v433 = swift_bridgeObjectRetain();
      uint64_t v434 = sub_260D63884(v433);
      swift_bridgeObjectRelease();
    }
    while (v434 < 1);
  }
  unint64_t v9 = *(void *)v24;
  if ((*(void *)v24 & 0xC000000000000001) != 0) {
    goto LABEL_1008;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v493 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_462;
  }
  __break(1u);
LABEL_1010:
  swift_bridgeObjectRetain();
  uint64_t v314 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
LABEL_478:
  sub_260D73BC4(v494, v493, v314, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = v498[9];
  unint64_t v9 = *v8;
  unint64_t v315 = swift_bridgeObjectRetain();
  uint64_t v316 = sub_260D63884(v315);
  swift_bridgeObjectRelease();
  if (v316 <= 1)
  {
    do
    {
      double v320 = *(double *)(v7 + 48);
      double v319 = *(double *)(v7 + 56);
      v321 = self;
      if (v320 <= -9.22337204e18) {
        goto LABEL_888;
      }
      if (v320 >= 9.22337204e18) {
        goto LABEL_889;
      }
      if ((*(void *)&v320 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v319 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_890;
      }
      if (v319 <= -9.22337204e18) {
        goto LABEL_891;
      }
      if (v319 >= 9.22337204e18) {
        goto LABEL_892;
      }
      id v323 = objc_msgSend(v321, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v320, (uint64_t)v319, 0);
      objc_msgSend(v323, sel_setUsage_, 5);
      id v324 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v323);

      if (v324)
      {
        swift_beginAccess();
        uint64_t v325 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v325);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v317 = swift_bridgeObjectRetain();
      uint64_t v318 = sub_260D63884(v317);
      swift_bridgeObjectRelease();
    }
    while (v318 < 2);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_1012;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    uint64_t v494 = *(void *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_494;
  }
  __break(1u);
LABEL_1014:
  swift_bridgeObjectRetain();
  unint64_t v493 = MEMORY[0x2612287D0](2, v9);
  swift_bridgeObjectRelease();
  unint64_t v9 = *v8;
LABEL_510:
  unint64_t v337 = swift_bridgeObjectRetain();
  uint64_t v338 = sub_260D63884(v337);
  swift_bridgeObjectRelease();
  if (v338 <= 0)
  {
    do
    {
      double v445 = *(double *)(v7 + 48);
      double v444 = *(double *)(v7 + 56);
      v446 = self;
      if (v445 <= -9.22337204e18) {
        goto LABEL_908;
      }
      if (v445 >= 9.22337204e18) {
        goto LABEL_909;
      }
      if ((*(void *)&v445 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v444 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_910;
      }
      if (v444 <= -9.22337204e18) {
        goto LABEL_911;
      }
      if (v444 >= 9.22337204e18) {
        goto LABEL_912;
      }
      id v448 = objc_msgSend(v446, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v445, (uint64_t)v444, 0);
      objc_msgSend(v448, sel_setUsage_, 5);
      id v449 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v448);

      if (v449)
      {
        swift_beginAccess();
        uint64_t v450 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v450);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v442 = swift_bridgeObjectRetain();
      uint64_t v443 = sub_260D63884(v442);
      swift_bridgeObjectRelease();
    }
    while (v443 < 1);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0) {
    goto LABEL_1016;
  }
  v339 = v495;
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v340 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_514;
  }
  __break(1u);
LABEL_1018:
  swift_bridgeObjectRetain();
  uint64_t v494 = MEMORY[0x2612287D0](0, v9);
  swift_bridgeObjectRelease();
LABEL_519:
  unint64_t v9 = *v8;
  unint64_t v343 = swift_bridgeObjectRetain();
  uint64_t v344 = sub_260D63884(v343);
  swift_bridgeObjectRelease();
  if (v344 <= 1)
  {
    do
    {
      double v348 = *(double *)(v7 + 48);
      double v347 = *(double *)(v7 + 56);
      v349 = self;
      if (v348 <= -9.22337204e18) {
        goto LABEL_913;
      }
      if (v348 >= 9.22337204e18) {
        goto LABEL_914;
      }
      if ((*(void *)&v348 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v347 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_915;
      }
      if (v347 <= -9.22337204e18) {
        goto LABEL_916;
      }
      if (v347 >= 9.22337204e18) {
        goto LABEL_917;
      }
      id v351 = objc_msgSend(v349, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v348, (uint64_t)v347, 0);
      objc_msgSend(v351, sel_setUsage_, 5);
      id v352 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v351);

      if (v352)
      {
        swift_beginAccess();
        uint64_t v353 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v353);
        sub_260D6A714(*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *v8;
      unint64_t v345 = swift_bridgeObjectRetain();
      uint64_t v346 = sub_260D63884(v345);
      swift_bridgeObjectRelease();
    }
    while (v346 < 2);
  }
  unint64_t v9 = *v8;
  if ((*v8 & 0xC000000000000001) != 0)
  {
LABEL_1020:
    swift_bridgeObjectRetain();
    id v8 = (uint64_t *)MEMORY[0x2612287D0](1, v9);
    swift_bridgeObjectRelease();
LABEL_595:
    unint64_t v9 = *(void *)v24;
    unint64_t v399 = swift_bridgeObjectRetain();
    uint64_t v400 = sub_260D63884(v399);
    swift_bridgeObjectRelease();
    if (v400 <= 1)
    {
      do
      {
        double v404 = *(double *)(v7 + 64);
        double v403 = *(double *)(v7 + 72);
        v405 = self;
        if (v404 <= -9.22337204e18) {
          goto LABEL_918;
        }
        if (v404 >= 9.22337204e18) {
          goto LABEL_919;
        }
        if ((*(void *)&v404 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(void *)&v403 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_920;
        }
        if (v403 <= -9.22337204e18) {
          goto LABEL_921;
        }
        if (v403 >= 9.22337204e18) {
          goto LABEL_922;
        }
        id v407 = objc_msgSend(v405, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v404, (uint64_t)v403, 0);
        objc_msgSend(v407, sel_setUsage_, 5);
        id v408 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v407);

        if (v408)
        {
          swift_beginAccess();
          uint64_t v409 = swift_unknownObjectRetain();
          MEMORY[0x2612286A0](v409);
          sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
          sub_260D756D0();
          sub_260D756B0();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        unint64_t v9 = *(void *)v24;
        unint64_t v401 = swift_bridgeObjectRetain();
        uint64_t v402 = sub_260D63884(v401);
        swift_bridgeObjectRelease();
      }
      while (v402 < 2);
    }
    unint64_t v9 = *(void *)v24;
    if ((*(void *)v24 & 0xC000000000000001) != 0) {
      goto LABEL_1022;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
    {
      uint64_t v419 = *(void *)(v9 + 40);
      swift_unknownObjectRetain();
      goto LABEL_623;
    }
    __break(1u);
LABEL_1024:
    swift_bridgeObjectRetain();
    unint64_t v423 = MEMORY[0x2612287D0](0, v9);
    swift_bridgeObjectRelease();
    uint64_t v422 = (uint64_t)v495;
LABEL_627:
    sub_260D73BC4(a3, v423, v422, a5);
    goto LABEL_697;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    id v8 = *(uint64_t **)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_595;
  }
  __break(1u);
LABEL_1022:
  swift_bridgeObjectRetain();
  uint64_t v419 = MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
LABEL_623:
  sub_260D73BC4(v494, (unint64_t)v8, v419, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v8 = (uint64_t *)v498[12];
  unint64_t v9 = *(void *)v24;
  unint64_t v420 = swift_bridgeObjectRetain();
  uint64_t v421 = sub_260D63884(v420);
  swift_bridgeObjectRelease();
  if (v421 <= 0)
  {
    do
    {
      double v487 = *(double *)(v7 + 64);
      double v486 = *(double *)(v7 + 72);
      v488 = self;
      if (v487 <= -9.22337204e18) {
        goto LABEL_928;
      }
      if (v487 >= 9.22337204e18) {
        goto LABEL_929;
      }
      if ((*(void *)&v487 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v486 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_930;
      }
      if (v486 <= -9.22337204e18) {
        goto LABEL_931;
      }
      if (v486 >= 9.22337204e18) {
        goto LABEL_932;
      }
      id v490 = objc_msgSend(v488, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v487, (uint64_t)v486, 0);
      objc_msgSend(v490, sel_setUsage_, 5);
      id v491 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v490);

      if (v491)
      {
        swift_beginAccess();
        uint64_t v492 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v492);
        sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *(void *)v24;
      unint64_t v484 = swift_bridgeObjectRetain();
      uint64_t v485 = sub_260D63884(v484);
      swift_bridgeObjectRelease();
    }
    while (v485 < 1);
  }
  unint64_t v9 = *(void *)v24;
  if ((*(void *)v24 & 0xC000000000000001) != 0) {
    goto LABEL_1024;
  }
  uint64_t v422 = (uint64_t)v495;
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v423 = *(void *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_627;
  }
  __break(1u);
LABEL_1026:
  swift_bridgeObjectRetain();
  id v8 = (uint64_t *)MEMORY[0x2612287D0](1, v9);
  swift_bridgeObjectRelease();
LABEL_680:
  unint64_t v9 = *(void *)v24;
  unint64_t v462 = swift_bridgeObjectRetain();
  uint64_t v463 = sub_260D63884(v462);
  uint64_t result = swift_bridgeObjectRelease();
  if (v463 <= 1)
  {
    do
    {
      double v468 = *(double *)(v7 + 64);
      double v467 = *(double *)(v7 + 72);
      v469 = self;
      if (v468 <= -9.22337204e18) {
        goto LABEL_938;
      }
      if (v468 >= 9.22337204e18) {
        goto LABEL_939;
      }
      if ((*(void *)&v468 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v467 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_940;
      }
      if (v467 <= -9.22337204e18) {
        goto LABEL_941;
      }
      if (v467 >= 9.22337204e18) {
        goto LABEL_942;
      }
      id v471 = objc_msgSend(v469, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v468, (uint64_t)v467, 0);
      objc_msgSend(v471, sel_setUsage_, 5);
      id v472 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v471);

      if (v472)
      {
        swift_beginAccess();
        uint64_t v473 = swift_unknownObjectRetain();
        MEMORY[0x2612286A0](v473);
        sub_260D6A714(*(void *)((*(void *)v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_260D756D0();
        sub_260D756B0();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      unint64_t v9 = *(void *)v24;
      unint64_t v465 = swift_bridgeObjectRetain();
      uint64_t v466 = sub_260D63884(v465);
      uint64_t result = swift_bridgeObjectRelease();
    }
    while (v466 < 2);
  }
  unint64_t v9 = *(void *)v24;
  if ((*(void *)v24 & 0xC000000000000001) != 0) {
    goto LABEL_1028;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    uint64_t v474 = *(void *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_696;
  }
  __break(1u);
  return result;
}

id sub_260D69FCC()
{
  cacheOut[1] = *(CVMetalTextureCacheRef *)MEMORY[0x263EF8340];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_260D75650();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_imageNamed_, v2);

  if (!v3)
  {

    return 0;
  }
  objc_msgSend(v3, sel_size);
  double v5 = v4;
  objc_msgSend(v3, sel_scale);
  double v7 = v5 * v6;
  if ((~COERCE__INT64(v5 * v6) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  objc_msgSend(v3, sel_size);
  double v9 = v8;
  objc_msgSend(v3, sel_scale);
  double v11 = v9 * v10;
  if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  cacheOut[0] = 0;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVReturn v13 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(id *)(v0 + 16), 0, cacheOut);
  CVMetalTextureCacheRef v14 = cacheOut[0];
  if (v13 || !cacheOut[0])
  {

    return 0;
  }
  id v60 = v3;
  CGColorSpaceRef v61 = DeviceRGB;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260D76CB0;
  uint64_t v16 = (void *)*MEMORY[0x263F04240];
  uint64_t v17 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F04240];
  *(void *)(inited + 40) = (uint64_t)v7;
  int64_t v59 = (uint64_t)v7;
  double v18 = (void *)*MEMORY[0x263F04118];
  *(void *)(inited + 64) = v17;
  *(void *)(inited + 72) = v18;
  int64_t v58 = (uint64_t)v11;
  *(void *)(inited + 80) = (uint64_t)v11;
  id v19 = (void *)*MEMORY[0x263F04180];
  *(void *)(inited + 104) = v17;
  *(void *)(inited + 112) = v19;
  uint64_t v20 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 120) = 1111970369;
  uint64_t v21 = (void *)*MEMORY[0x263F040A0];
  *(void *)(inited + 144) = v20;
  *(void *)(inited + 152) = v21;
  uint64_t v22 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 160) = 1;
  uint64_t v23 = (void *)*MEMORY[0x263F04090];
  *(void *)(inited + 184) = v22;
  *(void *)(inited + 192) = v23;
  *(unsigned char *)(inited + 200) = 1;
  uint64_t v24 = (void *)*MEMORY[0x263F04158];
  *(void *)(inited + 224) = v22;
  *(void *)(inited + 232) = v24;
  *(unsigned char *)(inited + 240) = 1;
  double v25 = (void *)*MEMORY[0x263F04130];
  *(void *)(inited + 264) = v22;
  *(void *)(inited + 272) = v25;
  CVMetalTextureCacheRef textureCache = v14;
  id v26 = v16;
  id v27 = v18;
  id v28 = v19;
  id v29 = v21;
  id v30 = v23;
  id v31 = v24;
  id v32 = v25;
  sub_260D5EE94(MEMORY[0x263F8EE78]);
  type metadata accessor for CFString(0);
  sub_260D6B004();
  uint64_t v33 = sub_260D75630();
  swift_bridgeObjectRelease();
  type metadata accessor for CFDictionary(0);
  *(void *)(inited + 304) = v34;
  *(void *)(inited + 280) = v33;
  sub_260D5EE94(inited);
  CFDictionaryRef v35 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E4F10);
  uint64_t v36 = swift_initStackObject();
  *(_OWORD *)(v36 + 16) = xmmword_260D76CC0;
  id v37 = (void *)*MEMORY[0x263F041B0];
  *(void *)(v36 + 32) = *MEMORY[0x263F041B0];
  *(void *)(v36 + 40) = 1;
  id v38 = v37;
  sub_260D5EFB0(v36);
  CFDictionaryRef v39 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  CVPixelBufferPoolRef poolOut = 0;
  CVReturn v40 = CVPixelBufferPoolCreate(v12, v39, v35, &poolOut);
  CVPixelBufferPoolRef v41 = poolOut;
  if (v40 || !poolOut)
  {

    return 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  double v42 = poolOut;
  CVReturn v43 = CVPixelBufferPoolCreatePixelBuffer(v12, v42, &pixelBufferOut);
  CVPixelBufferRef v44 = pixelBufferOut;
  if (v43 || !pixelBufferOut)
  {

    return 0;
  }
  uint64_t v45 = pixelBufferOut;
  CVPixelBufferLockBaseAddress(v45, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v45);
  if (!BaseAddress
    || (double v47 = BaseAddress,
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v45),
        (id v49 = CGBitmapContextCreate(v47, v59, v58, 8uLL, BytesPerRow, v61, 0x2002u)) == 0))
  {

    return 0;
  }
  double v50 = (double)v58;
  id v51 = v49;
  CGContextTranslateCTM(v49, 0.0, (double)v58);
  CGContextScaleCTM(v51, 1.0, -1.0);
  UIGraphicsPushContext(v51);
  double v52 = (double)v59;
  objc_msgSend(v60, sel_drawInRect_, 0.0, 0.0, (double)v59, (double)v58);
  UIGraphicsPopContext();
  CVPixelBufferUnlockBaseAddress(v45, 0);
  CVMetalTextureRef textureOut = 0;
  if ((double)v59 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v52 >= 9.22337204e18)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((*(void *)&v52 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&v50 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v50 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  if (v50 >= 9.22337204e18) {
    goto LABEL_43;
  }
  CVReturn v53 = CVMetalTextureCacheCreateTextureFromImage(v12, textureCache, v45, 0, MTLPixelFormatBGRA8Unorm, v59, v58, 0, &textureOut);
  CVMetalTextureRef v54 = textureOut;
  if (v53 || !textureOut)
  {

    return 0;
  }
  __n128 v55 = textureOut;
  id v56 = CVMetalTextureGetTexture(v55);

  return v56;
}

uint64_t StickerComicRenderer.deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StickerComicRenderer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_260D6A714(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_260D756C0();
  }
  return result;
}

uint64_t sub_260D6A740(uint64_t a1, int8x16_t a2)
{
  a2.i64[0] = *(void *)(a1 + 4);
  float32x4_t v2 = *(float32x4_t *)(a1 + 12);
  float32x4_t v3 = (float32x4_t)vextq_s8((int8x16_t)v2, a2, 8uLL);
  a2.i64[1] = *(void *)(a1 + 12);
  __asm { FMOV            V3.4S, #1.0 }
  int8x8_t v9 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32((float32x4_t)a2, _Q3), (int16x8_t)vcgtq_f32(v3, (float32x4_t)xmmword_260D770B0))));
  int32x4_t v10 = (int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)xmmword_260D770B0, v3));
  v9.i16[3] = vmovn_s16(vmovn_hight_s32(*(int16x4_t *)&v10, v10)).i16[3];
  uint8x8_t v11 = (uint8x8_t)vcltz_s8(vshl_n_s8(v9, 7uLL));
  v11.i8[0] = vminv_u8(v11);
  __int32 v12 = v11.i32[0];
  uint16x4_t v13 = (uint16x4_t)vmovn_s32(vcltzq_f32(v2));
  v13.i16[0] = vmaxv_u16(v13);
  return v12 & ~v13.i32[0] & 1;
}

unint64_t sub_260D6A7B0()
{
  unint64_t result = qword_26A8E4F60;
  if (!qword_26A8E4F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4F60);
  }
  return result;
}

uint64_t sub_260D6A804(void *a1, uint64_t a2)
{
  float v5 = *(float *)(a2 + 4);
  float v4 = *(float *)(a2 + 8);
  float v7 = *(float *)(a2 + 12);
  float v6 = *(float *)(a2 + 16);
  unint64_t v8 = *(void *)(a2 + 32);
  double v9 = (double)(uint64_t)objc_msgSend(a1, sel_width);
  id v10 = objc_msgSend(a1, sel_height);
  double v11 = v9 * 0.76;
  double v12 = (double)(uint64_t)v10 * 0.76;
  if (v12 >= v9 * 0.76) {
    double v13 = v9 * 0.76;
  }
  else {
    double v13 = (double)(uint64_t)v10 * 0.76;
  }
  if (v11 > v12) {
    double v14 = v9 * 0.76;
  }
  else {
    double v14 = (double)(uint64_t)v10 * 0.76;
  }
  if (v13 > 720.0)
  {
    double v15 = 720.0 / v13;
LABEL_11:
    double v12 = v12 * v15;
    double v11 = v11 * v15;
    goto LABEL_12;
  }
  if (v14 < 140.0)
  {
    double v15 = 140.0 / v14;
    goto LABEL_11;
  }
LABEL_12:
  *(double *)(v2 + 64) = v11;
  *(double *)(v2 + 72) = v12;
  double v16 = (float)((float)(v5 + v5) + 1.0);
  *(double *)(v2 + 48) = v11 / v16;
  *(double *)(v2 + 56) = v12 / v16;
  uint64_t v17 = *(void **)(v2 + 24);
  uint64_t v18 = v17[5];
  *(void *)(v18 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor) = 0x3FBBC408E0000000;
  *(void *)(v18 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma) = 0x401A0A4260000000;
  uint64_t v19 = v17[6];
  *(void *)(v19 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor) = 0x3FBBC408E0000000;
  *(void *)(v19 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma) = 0x401A0A4260000000;
  uint64_t v20 = v17[7];
  *(void *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart) = 0x3FD3333333333333;
  *(void *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd) = 0x3FE999999999999ALL;
  *(void *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode) = 0;
  if ((v8 & 0x8000000000000000) != 0 || HIDWORD(v8))
  {
    uint64_t result = sub_260D757F0();
    __break(1u);
  }
  else
  {
    *(float *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels) = (float)v8;
    float v21 = 1.0 / (float)v8;
    if (!v8) {
      float v21 = 0.0;
    }
    *(float *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip) = v21;
    uint64_t v22 = v17[9];
    *(double *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma) = (float)(1.0 - v4) * 3.807
                                                                                          + 1.6;
    uint64_t v23 = OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold;
    *(void *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold) = 0x3FF0000000000000;
    *(void *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode) = 0;
    uint64_t v24 = v17[10];
    *(double *)(v24 + OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma) = v7 * 12.0 + 4.0;
    uint64_t v25 = v17[11];
    *(double *)(v25 + OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma) = v7 * 32.0 + 4.8;
    double v26 = v7 * 6.0 + 2.340625;
    uint64_t v27 = v17[3];
    *(double *)(v27 + OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma) = v26;
    uint64_t v28 = v17[4];
    *(double *)(v28 + OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma) = v26;
    uint64_t v29 = v17[14];
    *(void *)(v29 + OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma) = 0x4001800000000000;
    uint64_t v30 = v17[15];
    *(void *)(v30 + OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma) = 0x4001800000000000;
    *(double *)(v22 + v23) = v6 * -0.65 + 1.0;
    uint64_t v31 = *(void *)(v2 + 64);
    uint64_t v32 = *(void *)(v2 + 72);
    uint64_t v33 = (void *)(v24 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    void *v33 = v31;
    v33[1] = v32;
    uint64_t v34 = (void *)(v25 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *uint64_t v34 = v31;
    v34[1] = v32;
    CFDictionaryRef v35 = (void *)(v20 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *CFDictionaryRef v35 = v31;
    v35[1] = v32;
    uint64_t v36 = (void *)(v17[8] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *uint64_t v36 = v31;
    v36[1] = v32;
    id v37 = (void *)(v17[12] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *id v37 = v31;
    v37[1] = v32;
    uint64_t v38 = *(void *)(v2 + 48);
    uint64_t v39 = *(void *)(v2 + 56);
    uint64_t result = OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size;
    CVPixelBufferPoolRef v41 = (void *)(v17[2] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *CVPixelBufferPoolRef v41 = v38;
    v41[1] = v39;
    double v42 = (void *)(v18 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *double v42 = v38;
    v42[1] = v39;
    CVReturn v43 = (void *)(v19 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *CVReturn v43 = v38;
    v43[1] = v39;
    CVPixelBufferRef v44 = (void *)(v22 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *CVPixelBufferRef v44 = v38;
    v44[1] = v39;
    uint64_t v45 = (void *)(v27 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *uint64_t v45 = v38;
    v45[1] = v39;
    uint64_t v46 = (void *)(v28 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *uint64_t v46 = v38;
    v46[1] = v39;
    double v47 = (void *)(v29 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *double v47 = v38;
    v47[1] = v39;
    double v48 = (void *)(v30 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *double v48 = v38;
    v48[1] = v39;
    id v49 = (void *)(v17[13] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *id v49 = v38;
    v49[1] = v39;
  }
  return result;
}

unint64_t sub_260D6AC60()
{
  unint64_t result = qword_26A8E4F68;
  if (!qword_26A8E4F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4F68);
  }
  return result;
}

unint64_t sub_260D6ACB8()
{
  unint64_t result = qword_26A8E4F70;
  if (!qword_26A8E4F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4F70);
  }
  return result;
}

uint64_t method lookup function for StickerComicRenderer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StickerComicRenderer);
}

uint64_t dispatch thunk of StickerComicRenderer.__allocating_init(device:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of StickerComicRenderer.process(inputTexture:outputTexture:parameters:commandBuffer:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Style()
{
  return &type metadata for StickerComicRenderer.Style;
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

uint64_t getEnumTagSinglePayload for StickerComicRenderer.Parameters(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[40]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StickerComicRenderer.Parameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Parameters()
{
  return &type metadata for StickerComicRenderer.Parameters;
}

uint64_t _s17VisionKitInternal20StickerComicRendererC5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17VisionKitInternal20StickerComicRendererC5StyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x260D6AFB8);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_260D6AFE0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_260D6AFE8(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Error()
{
  return &type metadata for StickerComicRenderer.Error;
}

unint64_t sub_260D6B004()
{
  unint64_t result = qword_26A8E4A18;
  if (!qword_26A8E4A18)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E4A18);
  }
  return result;
}

uint64_t sub_260D6B064(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_260D75810();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v6 = 4;
      do
      {
        uint64_t v7 = v6 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = MEMORY[0x2612287D0](v6 - 4, a3);
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v8 = *(void *)(a3 + 8 * v6);
          swift_retain();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v15 = v8;
        char v10 = a1(&v15);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v12 & 1;
        }
        char v11 = v10;
        swift_release();
        if (v11)
        {
          swift_bridgeObjectRelease();
          char v12 = 1;
          return v12 & 1;
        }
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  char v12 = 0;
  return v12 & 1;
}

id sub_260D6B1B4()
{
  id result = objc_msgSend(self, sel_mapTableWithKeyOptions_valueOptions_, 5, 0);
  qword_26A8E53E8 = (uint64_t)result;
  return result;
}

id sub_260D6B1F8()
{
  id result = objc_msgSend(self, sel_weakObjectsHashTable);
  qword_26A8E4F98 = (uint64_t)result;
  return result;
}

void sub_260D6B234(id a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
  uint64_t v5 = MEMORY[0x261228FE0](v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
  if (!v5)
  {
    if (!a1) {
      return;
    }
LABEL_6:
    id v6 = a1;
    objc_msgSend(v6, sel__removeScrollViewScrollObserver_, v2);
    if (qword_26A8E4918 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_26A8E4F98, sel_removeObject_, v6);
    goto LABEL_9;
  }
  id v6 = (id)v5;
  if (a1)
  {
    sub_260D7250C(0, &qword_26A8E50C8);
    a1 = a1;
    id v7 = v6;
    char v8 = sub_260D75770();

    if (v8) {
      return;
    }
    goto LABEL_6;
  }
LABEL_9:

  uint64_t v9 = (void *)MEMORY[0x261228FE0](v4);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, sel__addScrollViewScrollObserver_, v2);
    if (qword_26A8E4918 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_26A8E4F98, sel_addObject_, v10);
  }
}

void sub_260D6B3DC(double a1)
{
  *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_requiredScale) = a1;
  uint64_t v2 = OBJC_IVAR____VKStickerEffectViewInternal_appliedScale;
  if (a1 > 0.0 && *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) != a1)
  {
    *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) = a1;
    uint64_t v4 = self;
    objc_msgSend(v4, sel_begin);
    objc_msgSend(v4, sel_setDisableActions_, 1);
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer);
    CATransform3DMakeScale(&v6, 1.0 / *(double *)(v1 + v2), 1.0 / *(double *)(v1 + v2), 1.0);
    objc_msgSend(v5, sel_setSublayerTransform_, &v6);
    objc_msgSend(v4, sel_commit);
  }
}

void sub_260D6B4CC(char a1)
{
  if (v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] == (a1 & 1)) {
    return;
  }
  uint64_t v2 = OBJC_IVAR____VKStickerEffectViewInternal_displayLink;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink];
  if (!v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive])
  {
    if (!v3)
    {
      double v13 = 0;
      goto LABEL_13;
    }
LABEL_11:
    double v14 = self;
    id v15 = v3;
    id v16 = objc_msgSend(v14, sel_mainRunLoop);
    objc_msgSend(v15, sel_removeFromRunLoop_forMode_, v16, *MEMORY[0x263EFF588]);

    double v13 = *(void **)&v1[v2];
LABEL_13:
    *(void *)&v1[v2] = 0;
    goto LABEL_14;
  }
  if (v3) {
    goto LABEL_11;
  }
  id v4 = objc_msgSend(v1, sel_window);
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, sel_screen);

    id v5 = objc_msgSend(v6, sel_displayLinkWithTarget_selector_, v1, sel__internalUpdateFromDisplayLink_);
  }
  id v7 = *(void **)&v1[v2];
  *(void *)&v1[v2] = v5;

  char v8 = *(void **)&v1[v2];
  if (v8)
  {
    id v9 = v8;
    sub_260D75710();
    objc_msgSend(v9, sel_setPreferredFrameRateRange_);

    id v10 = *(void **)&v1[v2];
    if (v10)
    {
      char v11 = self;
      id v12 = v10;
      id v17 = objc_msgSend(v11, sel_mainRunLoop);
      objc_msgSend(v12, sel_addToRunLoop_forMode_, v17, *MEMORY[0x263EFF588]);

      double v13 = v17;
LABEL_14:
    }
  }
}

void sub_260D6B6DC()
{
  if (qword_26A8E48D0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A8E5390;
  if (*(unsigned char *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_motionActive) != 1)
  {
    MEMORY[0x270FA5388]();
    v7[2] = v0;
    v7[3] = &off_270CFE9A8;
    swift_beginAccess();
    uint64_t v3 = sub_260D589E0(sub_260D737F8, (uint64_t)v7);
    uint64_t v4 = v3;
    unint64_t v5 = *(void *)(v1 + 136);
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_260D75810();
      swift_bridgeObjectRelease();
      if (v6 >= v4) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6 >= v3)
      {
LABEL_9:
        sub_260D58EE8(v4, v6);
        swift_endAccess();
        sub_260D57234();
        return;
      }
    }
    __break(1u);
    return;
  }
  uint64_t v2 = qword_26A8E5390;
  sub_260D71B50(v0, v2);
}

id sub_260D6B868()
{
  id result = sub_260D6B8B8(27.4155678);
  qword_26A8E4FA0 = (uint64_t)result;
  return result;
}

id sub_260D6B890()
{
  id result = sub_260D6B8B8(15.4212569);
  qword_26A8E4FA8 = (uint64_t)result;
  return result;
}

id sub_260D6B8B8(double a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15890]), sel_init);
  objc_msgSend(v2, sel_setStiffness_, a1);
  objc_msgSend(v2, sel_stiffness);
  double v4 = sqrt(v3);
  objc_msgSend(v2, sel_setDamping_, v4 + v4);
  id v5 = v2;
  objc_msgSend(v5, sel_settlingDuration);
  objc_msgSend(v5, sel_setDuration_);

  uint64_t v6 = *MEMORY[0x263F15EB0];
  id v7 = self;
  id v8 = v5;
  id v9 = objc_msgSend(v7, sel_functionWithName_, v6);
  objc_msgSend(v8, sel_setTimingFunction_, v9);

  return v8;
}

id sub_260D6B9C8(__n128 a1)
{
  uint64_t v2 = 0;
  long long v3 = *(_OWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
  while (1)
  {
    long long v8 = v3;
    float v5 = *(float *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    __n128 v9 = a1;
    float v6 = *(float *)((unint64_t)&v9 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    BOOL v4 = v5 == v6;
    if (v2 == 3) {
      break;
    }
    while (1)
    {
      ++v2;
      if (v4) {
        break;
      }
      if (v2 == 3) {
        goto LABEL_8;
      }
      BOOL v4 = 0;
    }
  }
  if (v5 != v6)
  {
LABEL_8:
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
      return objc_msgSend(v1, sel_setNeedsLayout);
    }
  }
  return result;
}

uint64_t sub_260D6BAC0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D6BB54(char a1)
{
  long long v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
  uint64_t result = swift_beginAccess();
  *long long v3 = a1;
  return result;
}

uint64_t (*sub_260D6BBA0())()
{
  return j_j__swift_endAccess;
}

void static StickerEffectView.extraScaleToIncludeStroke(withEffectType:bounds:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
}

uint64_t sub_260D6BC60()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_260D6BCF4(char a1)
{
  long long v3 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
  uint64_t result = swift_beginAccess();
  *long long v3 = a1;
  return result;
}

uint64_t (*sub_260D6BD40())()
{
  return j__swift_endAccess;
}

float sub_260D6BDE4()
{
  uint64_t v1 = v0 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition;
  swift_beginAccess();
  return *(float *)v1;
}

id sub_260D6BE84(float a1)
{
  long long v3 = (float *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
  id result = (id)swift_beginAccess();
  float v5 = *v3;
  *long long v3 = a1;
  if (v5 != a1)
  {
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
      return objc_msgSend(v1, sel_setNeedsLayout);
    }
  }
  return result;
}

void (*sub_260D6BF1C(void *a1))(id **a1)
{
  long long v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____VKStickerEffectViewInternal_curlPosition;
  v3[3] = v1;
  v3[4] = v4;
  float v5 = (_DWORD *)(v1 + v4);
  swift_beginAccess();
  *((_DWORD *)v3 + 10) = *v5;
  return sub_260D6BF9C;
}

void sub_260D6BF9C(id **a1)
{
  uint64_t v1 = *a1;
  float v2 = *((float *)*a1 + 10);
  id v4 = (*a1)[3];
  long long v3 = (char *)(*a1)[4];
  float v5 = *(float *)&v3[(void)v4];
  *(float *)&v3[(void)v4] = v2;
  if (v2 != v5)
  {
    float v6 = v1[3];
    v6[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(void *)&v6[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
      objc_msgSend(v1[3], sel_setNeedsLayout);
    }
  }
  free(v1);
}

id sub_260D6C06C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  float v2 = *v1;
  return v2;
}

void sub_260D6C120(void *a1)
{
  long long v3 = (void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_effect];
  swift_beginAccess();
  id v4 = *v3;
  *long long v3 = a1;
  id v5 = a1;
  if (v4 != a1)
  {
    sub_260D6F264();
    v1[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
      objc_msgSend(v1, sel_setNeedsLayout);
    }
  }
}

void (*sub_260D6C1D8(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  id v4 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  id v5 = *v4;
  v3[3] = *v4;
  id v6 = v5;
  return sub_260D6C260;
}

void sub_260D6C260(void **a1, char a2)
{
  float v2 = *a1;
  id v4 = (id *)((char *)*a1 + 24);
  id v3 = *v4;
  if (a2)
  {
    sub_260D6C120(v3);
  }
  else
  {
    sub_260D6C120(v3);
  }
  free(v2);
}

uint64_t sub_260D6C3D8()
{
  type metadata accessor for StickerEffect();
  uint64_t v0 = swift_dynamicCastClass();
  if (v0)
  {
    id v1 = (id)v0;
    swift_unknownObjectRetain();
  }
  else
  {
    if (qword_26A8E48E8 != -1) {
      swift_once();
    }
    id v1 = (id)qword_26A8E4B50;
  }
  sub_260D6C120(v1);
  return swift_unknownObjectRelease();
}

uint64_t sub_260D6C484()
{
  type metadata accessor for StickerEffect();
  uint64_t v0 = swift_dynamicCastClass();
  if (v0)
  {
    id v1 = (id)v0;
    swift_unknownObjectRetain_n();
  }
  else
  {
    uint64_t v2 = qword_26A8E48E8;
    swift_unknownObjectRetain();
    if (v2 != -1) {
      swift_once();
    }
    id v1 = (id)qword_26A8E4B50;
  }
  sub_260D6C120(v1);
  return swift_unknownObjectRelease();
}

void (*sub_260D6C540(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  id v4 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  id v5 = *v4;
  v3[3] = *v4;
  id v6 = v5;
  return sub_260D6C5C8;
}

void sub_260D6C5C8(void **a1, char a2)
{
  id v3 = *a1;
  type metadata accessor for StickerEffect();
  uint64_t v4 = swift_dynamicCastClass();
  id v5 = (id)v4;
  if (a2)
  {
    if (v4)
    {
      swift_unknownObjectRetain_n();
    }
    else
    {
      uint64_t v6 = qword_26A8E48E8;
      swift_unknownObjectRetain();
      if (v6 != -1) {
        swift_once();
      }
      id v5 = (id)qword_26A8E4B50;
    }
    sub_260D6C120(v5);
    swift_unknownObjectRelease();
  }
  else
  {
    if (v4)
    {
      swift_unknownObjectRetain();
    }
    else
    {
      if (qword_26A8E48E8 != -1) {
        swift_once();
      }
      id v5 = (id)qword_26A8E4B50;
    }
    sub_260D6C120(v5);
  }
  swift_unknownObjectRelease();
  free(v3);
}

void *sub_260D6C75C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_260D6C830(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;
  sub_260D6C918((uint64_t)v4);
}

void sub_260D6C8A0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
  sub_260D6C918((uint64_t)v4);
}

void sub_260D6C918(uint64_t a1)
{
  id v3 = (uint64_t *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    if (a1 && v4 == a1) {
      return;
    }
  }
  else if (!a1)
  {
    return;
  }
  id v5 = *(void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
  objc_msgSend(v5, sel_setHidden_, v4 == 0);
  if ((objc_msgSend(v5, sel_isHidden) & 1) == 0)
  {
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
      objc_msgSend(v1, sel_setNeedsLayout);
    }
  }
  sub_260D6F264();
}

void (*sub_260D6C9F0(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____VKStickerEffectViewInternal_image;
  v3[4] = v1;
  v3[5] = v4;
  id v5 = (void **)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  v3[3] = *v5;
  id v7 = v6;
  return sub_260D6CA78;
}

void sub_260D6CA78(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v4 = (void **)(*(void *)a1 + 24);
  id v3 = *v4;
  uint64_t v6 = *(void *)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 40);
  id v7 = *(void **)(v6 + v5);
  *(void *)(v6 + v5) = *v4;
  if (a2)
  {
    id v8 = v3;
    sub_260D6C918((uint64_t)v7);

    id v7 = *v4;
  }
  else
  {
    id v9 = v3;
    sub_260D6C918((uint64_t)v7);
  }
  free(v2);
}

uint64_t sub_260D6CB5C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  return *v1;
}

void sub_260D6CC18(char a1)
{
  int v3 = a1 & 1;
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  int v5 = *v4;
  unsigned char *v4 = a1;
  if (v5 != v3) {
    sub_260D6F264();
  }
}

void sub_260D6CC80(unsigned __int8 *a1, void *a2)
{
  int v2 = *a1;
  int v3 = (unsigned char *)(*a2 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  int v4 = *v3;
  *int v3 = v2;
  if (v2 != v4) {
    sub_260D6F264();
  }
}

void (*sub_260D6CCE8(void *a1))(uint64_t a1)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  v3[3] = v1;
  v3[4] = v4;
  int v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_260D6CD68;
}

void sub_260D6CD68(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 40);
  int v5 = *(unsigned __int8 *)(v3 + v2);
  *(unsigned char *)(v3 + v2) = v4;
  if (v4 != v5) {
    sub_260D6F264();
  }
  free(v1);
}

uint64_t sub_260D6CE24()
{
  uint64_t v1 = v0;
  sub_260D757B0();
  sub_260D75680();
  uint64_t v5 = *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
  sub_260D75840();
  sub_260D75680();
  swift_bridgeObjectRelease();
  sub_260D75680();
  uint64_t v2 = (id *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_effect];
  swift_beginAccess();
  id v3 = objc_msgSend(*v2, sel_description, v5);
  sub_260D75660();

  sub_260D75680();
  swift_bridgeObjectRelease();
  sub_260D75680();
  swift_beginAccess();
  sub_260D75680();
  swift_bridgeObjectRelease();
  sub_260D75680();
  objc_msgSend(v1, sel_bounds);
  type metadata accessor for CGRect(0);
  sub_260D757E0();
  sub_260D75680();
  swift_beginAccess();
  sub_260D75680();
  swift_bridgeObjectRelease();
  return 0;
}

char *StickerEffectView.__allocating_init(device:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return StickerEffectView.init(device:)(a1);
}

char *StickerEffectView.init(device:)(void *a1)
{
  id v56 = a1;
  uint64_t v57 = sub_260D75720();
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_260D75730();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260D75620();
  MEMORY[0x270FA5388]();
  id v8 = &v1[OBJC_IVAR____VKStickerEffectViewInternal_logger];
  id v9 = v1;
  __n128 v55 = v8;
  sub_260D755D0();
  uint64_t v53 = OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel) = 0;
  uint64_t v10 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15820]), sel_init);
  uint64_t v54 = v10;
  *(void *)((char *)v9 + v10) = v11;
  uint64_t v12 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
  *(void *)((char *)v9 + v12) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) = 1;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) = 0;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount) = 0;
  id v51 = (char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
  uint64_t v52 = v12;
  swift_unknownObjectWeakInit();
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_requiredScale) = 0x3FF0000000000000;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) = 0x3FF0000000000000;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_strokeScale) = 0x3FF0000000000000;
  uint64_t v13 = OBJC_IVAR____VKStickerEffectViewInternal_renderQueue;
  sub_260D7250C(0, (unint64_t *)&qword_26A8E4980);
  sub_260D75610();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F138], v4);
  uint64_t v59 = MEMORY[0x263F8EE78];
  sub_260D73588(&qword_26A8E5028, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E5030);
  sub_260D724BC(&qword_26A8E5038, &qword_26A8E5030);
  sub_260D757A0();
  *(void *)((char *)v9 + v13) = sub_260D75760();
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_renderer) = 0;
  uint64_t v14 = OBJC_IVAR____VKStickerEffectViewInternal_displayLink;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink) = 0;
  uint64_t v15 = qword_26A8E4F90;
  if (__OFADD__(qword_26A8E4F90, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  ++qword_26A8E4F90;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber) = v15;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_motionActive) = 0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation) = xmmword_260D76540;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration1) = 0x3FF3333333333333;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration2) = 0x3FF999999999999ALL;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle) = xmmword_260D773A0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle) = xmmword_260D76540;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = 0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation) = xmmword_260D76540;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_screenCenterDuration) = 0x3FD999999999999ALL;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = 0x3F0000003F000000;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke) = 1;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion) = 1;
  *(_DWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition) = 1065353216;
  id v3 = (char *)OBJC_IVAR____VKStickerEffectViewInternal_effect;
  *(void *)&v3[(void)v9] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  id v7 = (char *)OBJC_IVAR____VKStickerEffectViewInternal_image;
  *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_image) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused) = 0;
  if (qword_26A8E4910 != -1) {
LABEL_9:
  }
    swift_once();
  id v16 = (void *)qword_26A8E53E8;
  id v17 = v56;
  id v18 = objc_msgSend((id)qword_26A8E53E8, sel_objectForKey_, v56);
  if (v18 || (id v18 = objc_msgSend(v17, sel_newCommandQueue), objc_msgSend(v16, sel_setObject_forKey_, v18, v17), v18))
  {
    *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_device) = v17;
    *(void *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue) = v18;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    uint64_t v19 = (objc_class *)type metadata accessor for StickerEffectView();
    v58.receiver = v9;
    v58.super_class = v19;
    uint64_t v20 = (char *)objc_msgSendSuper2(&v58, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v20, sel_setClipsToBounds_, 0);
    uint64_t v21 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
    uint64_t v22 = *(void **)&v20[OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer];
    objc_msgSend(v22, sel_setMasksToBounds_, 0);
    id v23 = v22;
    id v24 = objc_msgSend(v20, sel_layer);
    objc_msgSend(v24, sel_bounds);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    objc_msgSend(v23, sel_setFrame_, v26, v28, v30, v32);
    id v33 = objc_msgSend(v20, sel_layer);
    objc_msgSend(v33, sel_addSublayer_, *(void *)&v20[v21]);

    uint64_t v34 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
    CFDictionaryRef v35 = *(void **)&v20[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    objc_msgSend(v35, sel_setDevice_, v17);
    objc_msgSend(v35, sel_setHidden_, 1);
    objc_msgSend(v35, sel_setOpaque_, 0);
    uint64_t v36 = *(void **)&v20[v21];
    id v37 = v35;
    objc_msgSend(v36, sel_bounds);
    objc_msgSend(v37, sel_setFrame_);

    uint64_t v38 = *(void **)&v20[v34];
    objc_msgSend(v38, sel_setPresentsWithTransaction_, 1);
    objc_msgSend(*(id *)&v20[v21], sel_addSublayer_, v38);
    id v39 = objc_msgSend(self, sel_defaultCenter);
    CVReturn v40 = v20;
    CVPixelBufferPoolRef v41 = (void *)sub_260D75650();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v40, sel_scrollViewWillChange_, v41, 0);

    double v42 = v40;
    CVReturn v43 = (void *)sub_260D75650();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v42, sel_scrollViewDidChange_, v43, 0);

    CVPixelBufferRef v44 = v42;
    uint64_t v45 = (void *)sub_260D75650();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v44, sel_scrollViewWillChange_, v45, 0);

    uint64_t v46 = v44;
    double v47 = (void *)sub_260D75650();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v46, sel_scrollViewDidChange_, v47, 0);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v49 = sub_260D755E0();
    (*(void (**)(char *, uint64_t))(*(void *)(v49 - 8) + 8))(v55, v49);

    swift_unknownObjectWeakDestroy();
    swift_release();

    double v50 = *(void **)&v7[(void)v9];
    type metadata accessor for StickerEffectView();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v46;
}

id StickerEffectView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_260D6DB0C()
{
  uint64_t v1 = v0;
  sub_260D754E0();
  if (!v14)
  {
    sub_260D72F3C((uint64_t)v13);
    return;
  }
  sub_260D7250C(0, &qword_26A8E50C8);
  if (swift_dynamicCast())
  {
    id v2 = v12;
    if (objc_msgSend(v0, sel_isDescendantOfView_, v12))
    {
      id v3 = &v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve];
      uint64_t v4 = MEMORY[0x261228FE0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]);
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        id v6 = v12;
        char v7 = sub_260D75770();

        if (v7)
        {

          uint64_t v8 = *(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount];
          BOOL v9 = __OFADD__(v8, 1);
          uint64_t v10 = v8 + 1;
          if (v9) {
            __break(1u);
          }
          else {
            *(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = v10;
          }
          return;
        }
      }
      *(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
      id v11 = (void *)MEMORY[0x261228FE0](v3);
      swift_unknownObjectWeakAssign();
      id v2 = v12;
      sub_260D6B234(v11);
    }
  }
}

void sub_260D6DC84()
{
  uint64_t v1 = v0;
  sub_260D754E0();
  if (v14)
  {
    sub_260D7250C(0, &qword_26A8E50C8);
    if (swift_dynamicCast())
    {
      id v2 = v12;
      uint64_t v3 = v0 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
      uint64_t v4 = MEMORY[0x261228FE0](v0 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
      if (!v4) {
        goto LABEL_7;
      }
      uint64_t v5 = (void *)v4;
      id v2 = v12;
      char v6 = sub_260D75770();

      if ((v6 & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v7 = OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount;
      uint64_t v8 = *(void *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount);
      BOOL v9 = v8 < 1;
      uint64_t v10 = v8 - 1;
      if (!v9)
      {
        *(void *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount) = v10;
LABEL_7:

        return;
      }
      id v11 = (void *)MEMORY[0x261228FE0](v3);
      swift_unknownObjectWeakAssign();
      sub_260D6B234(v11);

      *(void *)(v1 + v7) = 0;
    }
  }
  else
  {
    sub_260D72F3C((uint64_t)v13);
  }
}

uint64_t sub_260D6DDCC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_260D754F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  BOOL v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260D754D0();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_260D6DEBC()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    id v2 = v1;
    sub_260D6F6FC(v1);
    uint64_t v4 = v3;

    *(void *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v4;
    sub_260D6F264();
  }
}

id sub_260D6E0A0()
{
  uint64_t v1 = (id *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  if (*v1) {
    return objc_msgSend(*v1, sel_size);
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for StickerEffectView();
  return objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
}

void sub_260D6E114()
{
  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for StickerEffectView();
  objc_msgSendSuper2(&v26, sel_layoutSubviews);
  uint64_t v1 = self;
  objc_msgSend(v1, sel_begin);
  objc_msgSend(v1, sel_setDisableActions_, 1);
  id v2 = *(void **)&v0[OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer];
  id v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_bounds);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v2, sel_setFrame_, v5, v7, v9, v11);
  uint64_t v12 = *(void **)&v0[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);
  id v13 = objc_msgSend(v0, sel_window);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_screen);

    objc_msgSend(v15, sel_nativeScale);
    double v17 = v16;
  }
  else
  {
    double v17 = 0.0;
  }
  objc_msgSend(v12, sel_bounds);
  double v18 = v17 * CGRectGetWidth(v27);
  objc_msgSend(v12, sel_bounds);
  double v19 = v17 * CGRectGetHeight(v28);
  if (v18 * v19 > 2359296.0)
  {
    double v20 = 2359296.0 / (v18 * v19);
    double v18 = v18 * v20;
    double v19 = v19 * v20;
  }
  double v21 = floor(v18);
  double v22 = floor(v19);
  objc_msgSend(v12, sel_drawableSize);
  if (v21 != v24 || v22 != v23)
  {
    objc_msgSend(v12, sel_setDrawableSize_, v21, v22);
    objc_msgSend(v12, sel_setContentsScale_, v17);
    v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  }
  objc_msgSend(v1, sel_commit);
  if (!*(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]
    && *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer]
    && v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] == 1
    && (v0[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] & 1) == 0)
  {
    v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 0;
    sub_260D6F934();
  }
}

void sub_260D6E3E0()
{
  uint64_t v1 = sub_260D755F0();
  unint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  double v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260D75620();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v33 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = (objc_class *)type metadata accessor for StickerEffectView();
  v36.receiver = v0;
  v36.super_class = v8;
  objc_msgSendSuper2(&v36, sel_didMoveToWindow);
  v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  if (!*(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]) {
    objc_msgSend(v0, sel_setNeedsLayout);
  }
  sub_260D6F264();
  id v9 = objc_msgSend(v0, sel_window);

  if (!v9
    || (double v10 = &v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve],
        double v11 = (void *)MEMORY[0x261228FE0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]),
        v11,
        v11))
  {
    id v12 = objc_msgSend(v0, sel_window);

    if (v12)
    {
      id v13 = (void *)MEMORY[0x261228FE0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]);
      swift_unknownObjectWeakAssign();
      sub_260D6B234(v13);

      *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
    }
    goto LABEL_25;
  }
  uint64_t v32 = v6;
  if (qword_26A8E4918 != -1) {
    goto LABEL_21;
  }
  while (1)
  {
    id v14 = objc_msgSend((id)qword_26A8E4F98, sel_allObjects);
    sub_260D7250C(0, &qword_26A8E50C8);
    unint64_t v15 = sub_260D756A0();

    if (v15 >> 62) {
      break;
    }
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v16) {
      goto LABEL_23;
    }
LABEL_10:
    CGRect v28 = v4;
    uint64_t v29 = v5;
    unint64_t v30 = v2;
    uint64_t v31 = v1;
    uint64_t v1 = 4;
    unint64_t v2 = 0x265573000uLL;
    while (1)
    {
      double v17 = (v15 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x2612287D0](v1 - 4, v15)
          : (char *)*(id *)(v15 + 8 * v1);
      double v4 = v17;
      uint64_t v5 = v1 - 3;
      if (__OFADD__(v1 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v0, sel_isDescendantOfView_, v17))
      {
        swift_bridgeObjectRelease();
        double v18 = (void *)MEMORY[0x261228FE0](v10);
        swift_unknownObjectWeakAssign();
        double v19 = v4;
        sub_260D6B234(v18);

        goto LABEL_19;
      }

      ++v1;
      if (v5 == v16)
      {
        swift_bridgeObjectRelease();
LABEL_19:
        unint64_t v2 = v30;
        uint64_t v1 = v31;
        double v4 = v28;
        uint64_t v5 = v29;
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_21:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_260D75810();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_10;
  }
LABEL_23:
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v6 = v32;
LABEL_25:
  id v20 = objc_msgSend(v0, sel_window);

  if (v20)
  {
    if (!*(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer])
    {
      uint64_t v21 = v6;
      uint64_t v22 = *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_device];
      uint64_t v32 = *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderQueue];
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v22;
      *(void *)(v23 + 24) = v0;
      aBlock[4] = sub_260D7249C;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_260D6B1B0;
      aBlock[3] = &block_descriptor_0;
      double v24 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      double v25 = v0;
      objc_super v26 = v33;
      sub_260D75600();
      uint64_t v34 = MEMORY[0x263F8EE78];
      sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
      sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
      sub_260D757A0();
      MEMORY[0x261228760](0, v26, v4, v24);
      _Block_release(v24);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v5);
      swift_release();
    }
  }
}

uint64_t sub_260D6E958(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_260D755F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_260D75620();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  double v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for StickerEffectRenderer();
  swift_allocObject();
  double v11 = (void *)swift_unknownObjectRetain();
  uint64_t v12 = sub_260D5E480(v11);
  sub_260D7250C(0, (unint64_t *)&qword_26A8E4980);
  uint64_t v20 = sub_260D75740();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = sub_260D73700;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_260D6B1B0;
  aBlock[3] = &block_descriptor_108;
  id v14 = _Block_copy(aBlock);
  id v15 = a2;
  swift_retain();
  swift_release();
  sub_260D75600();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
  uint64_t v19 = v7;
  sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
  sub_260D757A0();
  uint64_t v16 = (void *)v20;
  MEMORY[0x261228760](0, v10, v6, v14);
  _Block_release(v14);
  swift_release();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
}

id sub_260D6ECA8(unsigned char *a1, uint64_t a2)
{
  *(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderer] = a2;
  swift_retain();
  id result = (id)swift_release();
  a1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  if (!*(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
  {
    return objc_msgSend(a1, sel_setNeedsLayout);
  }
  return result;
}

uint64_t sub_260D6ED30(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id StickerEffectView.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_260D755F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_260D75620();
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v9, sel_removeObserver_, v1);

  sub_260D7250C(0, (unint64_t *)&qword_26A8E4980);
  double v10 = (void *)sub_260D75740();
  aBlock[4] = sub_260D6F0BC;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_260D6B1B0;
  aBlock[3] = &block_descriptor_5;
  double v11 = _Block_copy(aBlock);
  sub_260D75600();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
  sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
  sub_260D757A0();
  MEMORY[0x261228760](0, v8, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  uint64_t v12 = (objc_class *)type metadata accessor for StickerEffectView();
  v16.receiver = v14;
  v16.super_class = v12;
  return objc_msgSendSuper2(&v16, sel_dealloc);
}

void sub_260D6F0BC()
{
  if (qword_26A8E48D0 != -1) {
    swift_once();
  }
  sub_260D57234();
}

void sub_260D6F264()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_window);

  if (v2
    && (uint64_t v3 = &v1[OBJC_IVAR____VKStickerEffectViewInternal_isPaused], swift_beginAccess(), (*v3 & 1) == 0)
    && (swift_beginAccess(), (sub_260D5BC6C() & 1) != 0))
  {
    BOOL v4 = CACurrentMediaTime() < *(double *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime] + 1.2 + 1.6;
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    BOOL v4 = 0;
  }
  char v6 = v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive];
  v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] = v4;
  sub_260D6B4CC(v6);
  v1[OBJC_IVAR____VKStickerEffectViewInternal_motionActive] = v5;
  sub_260D6B6DC();
}

void sub_260D6F378()
{
  *(CFTimeInterval *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_260D6F264();
}

void sub_260D6F408(void *a1)
{
  uint64_t v2 = OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) & 1) == 0)
  {
    objc_msgSend(a1, sel_targetTimestamp);
    double v4 = v3;
    if (qword_26A8E4920 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_26A8E4FA0, sel_settlingDuration);
    double v6 = v5;
    if (qword_26A8E4928 != -1) {
      swift_once();
    }
    uint64_t v7 = (void *)qword_26A8E4FA8;
    objc_msgSend((id)qword_26A8E4FA8, sel_settlingDuration);
    double v9 = v8;
    uint64_t v10 = OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime;
    double v11 = (v4 - *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime)) / v6;
    *(float *)&double v11 = v11;
    *(float *)&double v11 = fminf(fmaxf(*(float *)&v11, 0.0), 1.0);
    objc_msgSend((id)qword_26A8E4FA0, sel__solveForInput_, v11);
    float v13 = v12;
    double v14 = (v4 - *(double *)(v1 + v10) + -1.2) / v9;
    *(float *)&double v14 = v14;
    *(float *)&double v14 = fminf(fmaxf(*(float *)&v14, 0.0), 1.0);
    objc_msgSend(v7, sel__solveForInput_, v14);
    if (v15 <= 0.985) {
      float v16 = v15;
    }
    else {
      float v16 = 1.0;
    }
    if (v13 <= 0.999) {
      float v17 = v13;
    }
    else {
      float v17 = 1.0;
    }
    simd_quatf v25 = *(simd_quatf *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle);
    simd_slerp((float32x4_t)v25, *(float32x4_t *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle), v17);
    simd_slerp(v18, (float32x4_t)v25, v16);
    __n128 v19 = *(__n128 *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation);
    *(_OWORD *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation) = v20;
    sub_260D6B9C8(v19);
    uint64_t v21 = *(void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    id v22 = v21;
    sub_260D6F6FC(v21);
    uint64_t v24 = v23;

    *(void *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v24;
    if (CACurrentMediaTime() >= *(double *)(v1 + v10) + 1.2 + 1.6) {
      sub_260D6F264();
    }
    if (*(unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) == 1 && (*(unsigned char *)(v1 + v2) & 1) == 0)
    {
      *(unsigned char *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) = 0;
      sub_260D6F934();
    }
  }
}

void sub_260D6F6FC(void *a1)
{
  id v3 = objc_msgSend(v1, sel_window);
  if (!v3)
  {
    float32x2_t v14 = (float32x2_t)0x3F0000003F000000;
    float v15 = 1.0;
    if (!a1) {
      return;
    }
    goto LABEL_11;
  }
  double v4 = v3;
  id v5 = objc_msgSend(v1, sel_layer);
  id v6 = objc_msgSend(v5, sel_presentationLayer);

  if (v6)
  {
    objc_msgSend(v6, sel_bounds);
    double MidX = CGRectGetMidX(v27);
    objc_msgSend(v6, sel_bounds);
    double MidY = CGRectGetMidY(v28);
    id v9 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v6, sel_convertPoint_toLayer_, v9, MidX, MidY);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    objc_msgSend(v1, sel_bounds);
    double v16 = CGRectGetMidX(v29);
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v1, sel_convertPoint_toCoordinateSpace_, v4, v16, CGRectGetMidY(v30));
    double v11 = v17;
    double v13 = v18;
  }
  objc_msgSend(v4, sel_bounds);
  double v20 = v19;
  double v22 = v21;

  v14.f32[0] = v11 / v20;
  float32_t v23 = v13 / v22;
  v14.f32[1] = v23;
  if (v20 > v22) {
    double v24 = v20;
  }
  else {
    double v24 = v22;
  }
  float v15 = 1.0 / v24;
  if (a1)
  {
LABEL_11:
    if (v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] == 1)
    {
      float32x2_t v25 = vsub_f32(v14, *(float32x2_t *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter]);
      if (v15 < sqrtf(vaddv_f32(vmul_f32(v25, v25))))
      {
        id v26 = a1;
        objc_msgSend(v26, sel_targetTimestamp);
        objc_msgSend(v26, sel_timestamp);
      }
    }
  }
}

void sub_260D6F934()
{
  uint64_t v1 = sub_260D755F0();
  uint64_t v34 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_260D75620();
  uint64_t v32 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = *(void *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue);
  float32x4_t v30 = *(float32x4_t *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation);
  float32x4_t v29 = *(float32x4_t *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation);
  id v6 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  uint64_t v7 = *v6;
  double v8 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  id v9 = *v8;
  double v10 = *(void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_metalLayer);
  id v11 = v7;
  id v12 = v9;
  objc_msgSend(v10, sel_contentsScale);
  double v14 = v13;
  uint64_t v15 = *(void *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter);
  double v16 = (__int32 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  if (*v6 && (uint64_t v17 = *(void *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderer)) != 0)
  {
    int32x4_t v18 = (int32x4_t)vnegq_f32(v29);
    int8x16_t v19 = (int8x16_t)vtrn2q_s32((int32x4_t)v29, vtrn1q_s32((int32x4_t)v29, v18));
    float32x4_t v20 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v29, (int8x16_t)v18, 8uLL), *(float32x2_t *)v30.f32, 1), (float32x4_t)vextq_s8(v19, v19, 8uLL), v30.f32[0]);
    float32x4_t v21 = (float32x4_t)vrev64q_s32((int32x4_t)v29);
    v21.i32[0] = v18.i32[1];
    v21.i32[3] = v18.i32[2];
    float32x4_t v29 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v29, v30, 3), v21, v30, 2), v20);
    __int32 v23 = *v16;
    *(unsigned char *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) = 1;
    v30.i64[0] = *(void *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderQueue);
    uint64_t v24 = swift_allocObject();
    swift_unknownObjectWeakInit();
    float32x2_t v25 = (float32x4_t *)swift_allocObject();
    uint64_t v26 = v31;
    v25[1].i64[0] = v24;
    v25[1].i64[1] = v26;
    v25[2].i64[0] = v17;
    v25[3] = v29;
    v25[4].i64[0] = (uint64_t)v7;
    v25[4].i64[1] = (uint64_t)v12;
    float32_t v22 = v14;
    v25[5].f32[0] = v22;
    v25[5].i64[1] = v15;
    v25[6].i32[0] = v23;
    aBlock[4] = sub_260D73798;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_260D6B1B0;
    aBlock[3] = &block_descriptor_117;
    CGRect v27 = _Block_copy(aBlock);
    swift_retain_n();
    v29.i64[0] = (uint64_t)v12;
    id v28 = v11;
    swift_retain();
    swift_unknownObjectRetain();
    sub_260D75600();
    uint64_t v35 = MEMORY[0x263F8EE78];
    sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
    sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
    sub_260D757A0();
    MEMORY[0x261228760](0, v5, v3, v27);
    _Block_release(v27);
    swift_release();

    (*(void (**)(char *, uint64_t))(v34 + 8))(v3, v1);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
    swift_release();
    swift_release();
  }
  else
  {
  }
}

void sub_260D6FE18(uint64_t a1, void *a2, uint64_t a3, __n128 *a4)
{
  uint64_t v7 = sub_260D755F0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  double v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_260D75620();
  id v12 = *(NSObject **)(v11 - 8);
  MEMORY[0x270FA5388]();
  double v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x261228FE0](a1 + 16);
  if (v15)
  {
    double v16 = (void *)v15;
    os_log_t v40 = v12;
    id v17 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v15
                                                                + OBJC_IVAR____VKStickerEffectViewInternal_metalLayer), sel_nextDrawable));
    if (v17)
    {
      int32x4_t v18 = v17;
      id v19 = objc_msgSend(a2, sel_commandBuffer);
      if (v19)
      {
        float32x4_t v20 = v19;
        uint64_t v39 = v8;
        sub_260D60F84(a4, v19, objc_msgSend(v18, sel_texture));
        uint64_t v22 = v21;
        swift_unknownObjectRelease();
        objc_msgSend(v20, sel_commit);
        objc_msgSend(v20, sel_waitUntilScheduled);
        id v23 = objc_msgSend(v20, sel_error);
        if (v23)
        {
          id v24 = v23;
          float32x2_t v25 = sub_260D755C0();
          os_log_type_t v26 = sub_260D756F0();
          if (os_log_type_enabled(v25, v26))
          {
            os_log_t v40 = v25;
            CGRect v27 = (uint8_t *)swift_slowAlloc();
            id v28 = (void *)swift_slowAlloc();
            *(_DWORD *)CGRect v27 = 138412290;
            id v29 = v24;
            uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
            aBlock[0] = v30;
            sub_260D75790();
            *id v28 = v30;

            os_log_t v31 = v40;
            _os_log_impl(&dword_260D55000, v40, v26, "Error in commandBuffer rendering sticker effect, bailing %@", v27, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E5230);
            swift_arrayDestroy();
            MEMORY[0x261228F70](v28, -1, -1);
            MEMORY[0x261228F70](v27, -1, -1);
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
          }
          else
          {
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
          }
        }
        else
        {
          if ((v22 & 0x100000000) != 0) {
            double v32 = 1.0;
          }
          else {
            double v32 = *(float *)&v22;
          }
          sub_260D7250C(0, (unint64_t *)&qword_26A8E4980);
          uint64_t v38 = sub_260D75740();
          uint64_t v33 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v34 = swift_allocObject();
          *(void *)(v34 + 16) = v33;
          *(void *)(v34 + 24) = v18;
          *(double *)(v34 + 32) = v32;
          *(_DWORD *)(v34 + 40) = 1065353216;
          aBlock[4] = sub_260D737E8;
          aBlock[5] = v34;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_260D6B1B0;
          aBlock[3] = &block_descriptor_124;
          id v37 = _Block_copy(aBlock);
          swift_unknownObjectRetain();
          swift_release();
          sub_260D75600();
          aBlock[0] = MEMORY[0x263F8EE78];
          sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
          sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
          sub_260D757A0();
          objc_super v36 = v37;
          uint64_t v35 = (void *)v38;
          MEMORY[0x261228760](0, v14, v10, v37);
          _Block_release(v36);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v7);
          ((void (*)(char *, uint64_t))v40[1].isa)(v14, v11);
        }
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
}

void sub_260D703E4(uint64_t a1, void *a2, double a3, float a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x261228FE0](v7);
  if (v8)
  {
    uint64_t v9 = (unsigned char *)v8;
    double v10 = self;
    objc_msgSend(v10, sel_begin);
    objc_msgSend(v10, sel_setDisableActions_, 1);
    objc_msgSend(a2, sel_present);
    v9[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
    sub_260D6B3DC(a3);
    *(double *)&v9[OBJC_IVAR____VKStickerEffectViewInternal_strokeScale] = a4;
    objc_msgSend(v10, sel_commit);
  }
}

void sub_260D704C4(void *a1, uint64_t a2)
{
  id v47 = a1;
  uint64_t v4 = sub_260D755F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260D75620();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = (void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  uint64_t v13 = *v12;
  if (*v12)
  {
    float32x4_t v14 = *(float32x4_t *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation];
    float32x4_t v15 = *(float32x4_t *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
    int32x4_t v16 = (int32x4_t)vnegq_f32(v15);
    int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
    float32x4_t v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v14.f32[0]);
    float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
    v19.i32[0] = v16.i32[1];
    v19.i32[3] = v16.i32[2];
    float32x4_t v42 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v14, 3), v19, v14, 2), v18);
    float32x4_t v20 = (void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_effect];
    swift_beginAccess();
    uint64_t v45 = v7;
    uint64_t v21 = *v20;
    uint64_t v22 = *(void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    id v23 = v13;
    uint64_t v46 = v9;
    id v24 = v23;
    id v25 = v21;
    objc_msgSend(v22, sel_contentsScale);
    float v27 = v26;
    uint64_t v28 = *(void *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter];
    id v29 = &v2[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
    swift_beginAccess();
    int v30 = *(_DWORD *)v29;
    uint64_t v31 = *(void *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_renderer];
    uint64_t v44 = v8;
    uint64_t v32 = *(void *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
    uint64_t v43 = *(void *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_renderQueue];
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v31;
    *(void *)(v33 + 24) = v2;
    *(void *)(v33 + 32) = v24;
    *(float32x4_t *)(v33 + 48) = v42;
    *(void *)(v33 + 64) = v13;
    *(void *)(v33 + 72) = v25;
    *(float *)(v33 + 80) = v27;
    *(void *)(v33 + 88) = v28;
    *(_DWORD *)(v33 + 96) = v30;
    id v34 = v47;
    *(void *)(v33 + 104) = v32;
    *(void *)(v33 + 112) = v34;
    *(void *)(v33 + 120) = a2;
    aBlock[4] = sub_260D7261C;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_260D6B1B0;
    aBlock[3] = &block_descriptor_11;
    uint64_t v35 = _Block_copy(aBlock);
    swift_retain_n();
    id v36 = v24;
    id v47 = v25;
    id v37 = v2;
    swift_retain();
    id v38 = v36;
    sub_260D75600();
    uint64_t v48 = MEMORY[0x263F8EE78];
    sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
    sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
    uint64_t v39 = v45;
    sub_260D757A0();
    MEMORY[0x261228760](0, v11, v39, v35);
    _Block_release(v35);
    swift_release();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v39, v4);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v44);
    swift_release();
  }
  else
  {
    sub_260D725C4();
    os_log_t v40 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v41 = 3;
    *(unsigned char *)(v41 + 4) = 1;
    ((void (*)(void, void *))v47)(0, v40);
  }
}

void sub_260D7099C(uint64_t a1, uint64_t a2, void *a3, __n128 *a4, uint64_t a5, void (*a6)(void, void), uint64_t a7)
{
  poolOut[46] = *(CVPixelBufferPoolRef *)MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v88 = a2;
  }
  else
  {
    type metadata accessor for StickerEffectRenderer();
    swift_allocObject();
    unint64_t v66 = (void *)swift_unknownObjectRetain();
    sub_260D5E480(v66);
    uint64_t v88 = a2;
  }
  swift_retain();
  objc_msgSend(a3, sel_size);
  double v13 = v12;
  objc_msgSend(a3, sel_scale);
  double v15 = v13 * v14;
  if ((~COERCE__INT64(v13 * v14) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(a3, sel_size);
  double v17 = v16;
  objc_msgSend(a3, sel_scale);
  double v19 = v17 * v18;
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v20 = (uint64_t)v19;
  v21.n64_u64[0] = sub_260D60CBC(a4[1].n128_i64[1], (uint64_t)v15, v20, (uint64_t)v15, v20, a4[2].n128_f32[0]).n64_u64[0];
  float v22 = (float)(uint64_t)v15 / v21.n64_f32[0];
  if (v22 <= -9.2234e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (v22 >= 9.2234e18)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  float v23 = (float)v20 / v21.n64_f32[1];
  if ((LODWORD(v22) & 0x7F800000) == 0x7F800000
    || (COERCE_UNSIGNED_INT((float)v20 / v21.n64_f32[1]) & 0x7F800000) == 2139095040)
  {
    goto LABEL_51;
  }
  if (v23 <= -9.2234e18)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
  }
  if (v23 >= 9.2234e18) {
    goto LABEL_53;
  }
  uint64_t v84 = a3;
  unint64_t v85 = a4;
  uint64_t v89 = a6;
  uint64_t v91 = a7;
  uint64_t v25 = (uint64_t)v22;
  uint64_t v26 = (uint64_t)v23;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_260D76CB0;
  uint64_t v28 = (void *)*MEMORY[0x263F04240];
  uint64_t v29 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F04240];
  *(void *)(inited + 40) = v25;
  size_t v86 = v25;
  int v30 = (void *)*MEMORY[0x263F04118];
  *(void *)(inited + 64) = v29;
  *(void *)(inited + 72) = v30;
  size_t v87 = v26;
  *(void *)(inited + 80) = v26;
  uint64_t v31 = (void *)*MEMORY[0x263F04180];
  *(void *)(inited + 104) = v29;
  *(void *)(inited + 112) = v31;
  uint64_t v32 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 120) = 1111970369;
  uint64_t v33 = (void *)*MEMORY[0x263F040A0];
  *(void *)(inited + 144) = v32;
  *(void *)(inited + 152) = v33;
  uint64_t v34 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 160) = 1;
  uint64_t v35 = (void *)*MEMORY[0x263F04090];
  *(void *)(inited + 184) = v34;
  *(void *)(inited + 192) = v35;
  *(unsigned char *)(inited + 200) = 1;
  id v36 = (void *)*MEMORY[0x263F04158];
  *(void *)(inited + 224) = v34;
  *(void *)(inited + 232) = v36;
  *(unsigned char *)(inited + 240) = 1;
  id v37 = (void *)*MEMORY[0x263F04130];
  *(void *)(inited + 264) = v34;
  *(void *)(inited + 272) = v37;
  id v38 = v28;
  id v39 = v30;
  id v40 = v31;
  id v41 = v33;
  id v42 = v35;
  id v43 = v36;
  id v44 = v37;
  unint64_t v45 = sub_260D5EE94(MEMORY[0x263F8EE78]);
  *(void *)(inited + 304) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4F00);
  *(void *)(inited + 280) = v45;
  sub_260D5EE94(inited);
  type metadata accessor for CFString(0);
  sub_260D73588((unint64_t *)&qword_26A8E4A18, type metadata accessor for CFString);
  CFDictionaryRef v46 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E4F10);
  uint64_t v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = xmmword_260D76CC0;
  uint64_t v48 = (void *)*MEMORY[0x263F041B0];
  *(void *)(v47 + 32) = *MEMORY[0x263F041B0];
  *(void *)(v47 + 40) = 1;
  id v49 = v48;
  sub_260D5EFB0(v47);
  CFDictionaryRef v50 = (const __CFDictionary *)sub_260D75630();
  swift_bridgeObjectRelease();
  poolOut[0] = 0;
  CFAllocatorRef v51 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVReturn v52 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v50, v46, poolOut);
  if (v52 || !poolOut[0])
  {
    sub_260D725C4();
    uint64_t v63 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v65 = v52;
    *(unsigned char *)(v65 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_40:

    goto LABEL_41;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v53 = poolOut[0];
  CVReturn v54 = CVPixelBufferPoolCreatePixelBuffer(v51, v53, &pixelBufferOut);
  if (v54 || !pixelBufferOut)
  {
    sub_260D725C4();
    uint64_t v63 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v67 = v54;
    *(unsigned char *)(v67 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_39:

    goto LABEL_40;
  }
  CVMetalTextureCacheRef cacheOut = 0;
  __n128 v55 = *(void **)(v88 + OBJC_IVAR____VKStickerEffectViewInternal_device);
  id v56 = pixelBufferOut;
  CVReturn v57 = CVMetalTextureCacheCreate(v51, 0, v55, 0, &cacheOut);
  if (v57 || !cacheOut)
  {
    sub_260D725C4();
    uint64_t v63 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v68 = v57;
    *(unsigned char *)(v68 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_38:

    goto LABEL_39;
  }
  CVMetalTextureRef textureOut = 0;
  objc_super v58 = v56;
  uint64_t v59 = cacheOut;
  CVReturn v60 = CVMetalTextureCacheCreateTextureFromImage(v51, v59, v58, 0, MTLPixelFormatBGRA8Unorm, v86, v87, 0, &textureOut);
  if (v60) {
    BOOL v61 = 1;
  }
  else {
    BOOL v61 = textureOut == 0;
  }
  if (v61)
  {
    CVReturn v62 = v60;
    sub_260D725C4();
    uint64_t v63 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v64 = v62;
    *(unsigned char *)(v64 + 4) = 0;
    swift_willThrow();

LABEL_37:
    swift_release();

    goto LABEL_38;
  }
  CVBufferRef buffer = v58;
  double v69 = textureOut;
  id v70 = CVMetalTextureGetTexture(v69);
  if (!v70)
  {
    sub_260D725C4();
    uint64_t v63 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v74 = 2;
    *(unsigned char *)(v74 + 4) = 1;
    swift_willThrow();

    goto LABEL_37;
  }
  uint64_t v71 = v70;
  uint64_t v82 = v69;
  CVBufferSetAttachment(buffer, (CFStringRef)*MEMORY[0x263F03E38], DeviceRGB, kCVAttachmentMode_ShouldPropagate);
  id v72 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v88
                                                              + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue), sel_commandBuffer));
  if (v72)
  {
    id v73 = v72;
    swift_retain();
    sub_260D60F84(v85, v73, v71);
    swift_release();
    uint64_t v76 = swift_allocObject();
    double v77 = v89;
    uint64_t v90 = v59;
    *(void *)(v76 + 16) = v77;
    *(void *)(v76 + 24) = v91;
    *(void *)(v76 + 32) = buffer;
    *(void *)(v76 + 40) = v86;
    *(void *)(v76 + 48) = v87;
    *(void *)(v76 + 56) = DeviceRGB;
    *(_DWORD *)(v76 + 64) = 8194;
    *(void *)(v76 + 72) = v84;
    aBlock[4] = sub_260D73620;
    aBlock[5] = v76;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_260D71664;
    aBlock[3] = &block_descriptor_102;
    double v78 = _Block_copy(aBlock);
    id v79 = buffer;
    swift_retain();
    id v80 = DeviceRGB;
    id v81 = v84;
    swift_release();
    objc_msgSend(v73, sel_addCompletedHandler_, v78);
    _Block_release(v78);
    objc_msgSend(v73, sel_commit);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_release();
    return;
  }
  type metadata accessor for MTLCommandBufferError(0);
  void aBlock[6] = 1;
  sub_260D71864(MEMORY[0x263F8EE78]);
  sub_260D73588((unint64_t *)&qword_26A8E4A10, type metadata accessor for MTLCommandBufferError);
  sub_260D75560();
  uint64_t v63 = (void *)aBlock[0];
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_release();
LABEL_41:
  id v75 = v63;
  v89(0, v63);
}

void sub_260D713FC(void *a1, void (*a2)(id, id), uint64_t a3, __CVBuffer *a4, size_t a5, size_t a6, CGColorSpace *a7, uint32_t a8, void *a9)
{
  id v15 = objc_msgSend(a1, sel_error);
  if (v15)
  {
    id v16 = v15;
    id v33 = v15;
    a2(0, v16);
    goto LABEL_3;
  }
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  uint64_t v20 = CGBitmapContextCreate(BaseAddress, a5, a6, 8uLL, BytesPerRow, a7, a8);
  if (v20)
  {
    __n64 v21 = v20;
    CGImageRef Image = CGBitmapContextCreateImage(v20);
    if (Image)
    {
      CGImageRef v23 = Image;
      CVPixelBufferUnlockBaseAddress(a4, 0);
      id v24 = v23;
      objc_msgSend(a9, sel_scale);
      double v26 = v25;
      id v27 = objc_msgSend(a9, sel_imageOrientation);
      id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v24, v27, v26);

      id v33 = v28;
      a2(v28, 0);

LABEL_3:
      double v17 = v33;
      goto LABEL_5;
    }
    sub_260D725C4();
    uint64_t v29 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v31 = 3;
    *(unsigned char *)(v31 + 4) = 1;
    swift_willThrow();
  }
  else
  {
    sub_260D725C4();
    uint64_t v29 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v30 = 1;
    *(unsigned char *)(v30 + 4) = 1;
    swift_willThrow();
  }
  id v32 = v29;
  a2(0, v29);

  double v17 = v29;
LABEL_5:
}

uint64_t sub_260D71664(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_260D71730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_260D75570();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id StickerEffectView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void StickerEffectView.init(frame:)()
{
}

unint64_t sub_260D71864(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E51C0);
  uint64_t v2 = sub_260D75820();
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
    sub_260D73658(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_260D71990(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_260D60E7C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    void v3[2] = v14;
    v6 += 48;
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

unint64_t sub_260D71990(uint64_t a1, uint64_t a2)
{
  sub_260D758C0();
  sub_260D75670();
  uint64_t v4 = sub_260D758E0();
  return sub_260D71A08(a1, a2, v4);
}

unint64_t sub_260D71A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_260D75850() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_260D75850() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_260D75850()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

void sub_260D71B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a2 + 136);
  swift_beginAccess();
  unint64_t v5 = *(void *)(a2 + 136);
  v9[2] = a1;
  v9[3] = &off_270CFE9A8;
  swift_bridgeObjectRetain();
  char v6 = sub_260D6B064(sub_260D737F8, (uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    type metadata accessor for StickerEffectMotionManager.WeakObserver();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 24) = 0;
    swift_unknownObjectWeakInit();
    *(void *)(v7 + 24) = &off_270CFE9A8;
    swift_unknownObjectWeakAssign();
    uint64_t v8 = swift_beginAccess();
    MEMORY[0x2612286A0](v8);
    if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_260D756C0();
    }
    sub_260D756D0();
    sub_260D756B0();
    swift_endAccess();
    sub_260D57234();
  }
}

void sub_260D71C88(uint64_t a1, double a2, double a3)
{
  if (a1 < 0)
  {
    sub_260D757F0();
    __break(1u);
    JUMPOUT(0x260D71F10);
  }
  switch(a1)
  {
    case 1:
      if (qword_26A8E48F0 != -1) {
        swift_once();
      }
      unint64_t v5 = &qword_26A8E4B58;
      break;
    case 2:
      if (qword_26A8E48F8 != -1) {
        swift_once();
      }
      unint64_t v5 = &qword_26A8E4B60;
      break;
    case 3:
      if (qword_26A8E4900 != -1) {
        swift_once();
      }
      unint64_t v5 = &qword_26A8E4B68;
      break;
    case 4:
      if (qword_26A8E4908 != -1) {
        swift_once();
      }
      unint64_t v5 = &qword_26A8E4B70;
      break;
    default:
      if (qword_26A8E48E8 != -1) {
        goto LABEL_29;
      }
      goto LABEL_4;
  }
  while (1)
  {
    if (a2 <= -9.22337204e18)
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (a2 >= 9.22337204e18) {
      goto LABEL_25;
    }
    if ((*(void *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000
      || (*(void *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000)
    {
      goto LABEL_26;
    }
    if (a3 > -9.22337204e18) {
      break;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_once();
LABEL_4:
    unint64_t v5 = &qword_26A8E4B50;
  }
  if (a3 >= 9.22337204e18) {
    goto LABEL_28;
  }
  sub_260D74FD0(*v5, (uint64_t)a2, (uint64_t)a3, 1.0);
}

uint64_t type metadata accessor for StickerEffectView()
{
  uint64_t result = qword_26A8E5140;
  if (!qword_26A8E5140) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void _s17VisionKitInternal17StickerEffectViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = v0;
  sub_260D75720();
  MEMORY[0x270FA5388]();
  v13[0] = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_260D75730();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  char v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260D75620();
  MEMORY[0x270FA5388]();
  sub_260D755D0();
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel] = 0;
  uint64_t v7 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15820]), sel_init);
  uint64_t v8 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
  *(void *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
  v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_requiredScale] = 0x3FF0000000000000;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_appliedScale] = 0x3FF0000000000000;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_strokeScale] = 0x3FF0000000000000;
  uint64_t v9 = OBJC_IVAR____VKStickerEffectViewInternal_renderQueue;
  sub_260D7250C(0, (unint64_t *)&qword_26A8E4980);
  sub_260D75610();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F138], v3);
  v13[1] = MEMORY[0x263F8EE78];
  sub_260D73588(&qword_26A8E5028, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E5030);
  sub_260D724BC(&qword_26A8E5038, &qword_26A8E5030);
  sub_260D757A0();
  *(void *)&v0[v9] = sub_260D75760();
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer] = 0;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink] = 0;
  uint64_t v10 = qword_26A8E4F90;
  uint64_t v11 = qword_26A8E4F90 + 1;
  if (__OFADD__(qword_26A8E4F90, 1)) {
    __break(1u);
  }
  qword_26A8E4F90 = v11;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber] = v10;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] = 0;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_motionActive] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation] = xmmword_260D76540;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration1] = 0x3FF3333333333333;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration2] = 0x3FF999999999999ALL;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle] = xmmword_260D773A0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle] = xmmword_260D76540;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation] = xmmword_260D76540;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_screenCenterDuration] = 0x3FD999999999999ALL;
  *(void *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter] = 0x3F0000003F000000;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke] = 1;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion] = 1;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition] = 1065353216;
  uint64_t v12 = OBJC_IVAR____VKStickerEffectViewInternal_effect;
  *(void *)&v1[v12] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  *(void *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_image] = 0;
  v1[OBJC_IVAR____VKStickerEffectViewInternal_isPaused] = 0;

  sub_260D75800();
  __break(1u);
}

uint64_t sub_260D7245C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260D7249C()
{
  return sub_260D6E958(*(void *)(v0 + 16), *(void **)(v0 + 24));
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

uint64_t sub_260D724BC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_260D7250C(uint64_t a1, unint64_t *a2)
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

void _s17VisionKitInternal17StickerEffectViewC23resetRestingOrientationyyFZ_0()
{
  if (qword_26A8E48D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A8E5390;
  char v1 = *(unsigned char *)(qword_26A8E5390 + 48);
  *(_OWORD *)(qword_26A8E5390 + 64) = *(_OWORD *)(qword_26A8E5390 + 32);
  *(unsigned char *)(v0 + 80) = v1;
  *(CFTimeInterval *)(v0 + 88) = CACurrentMediaTime();
  *(unsigned char *)(v0 + 96) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 48) = 1;
}

unint64_t sub_260D725C4()
{
  unint64_t result = qword_26A8E50D0;
  if (!qword_26A8E50D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E50D0);
  }
  return result;
}

uint64_t sub_260D72620@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke, a2);
}

uint64_t sub_260D7262C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
}

uint64_t sub_260D72638@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion, a2);
}

uint64_t sub_260D72644(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_17Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
}

float sub_260D72650@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (float *)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  float result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

id sub_260D726A4(float *a1)
{
  return sub_260D6BE84(*a1);
}

id sub_260D726CC@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_260D72730(id *a1)
{
}

id sub_260D7275C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_260D727C4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_260D7282C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_16Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_isPaused, a2);
}

uint64_t sub_260D7283C()
{
  return type metadata accessor for StickerEffectView();
}

uint64_t sub_260D72844()
{
  uint64_t result = sub_260D755E0();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for StickerEffectView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StickerEffectView);
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x310))();
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x340))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of StickerEffectView.effect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of StickerEffectView.effect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of StickerEffectView.effect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x368))();
}

uint64_t dispatch thunk of StickerEffectView._effect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x370))();
}

uint64_t dispatch thunk of StickerEffectView._effect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of StickerEffectView._effect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of StickerEffectView.image.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of StickerEffectView.image.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of StickerEffectView.image.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of StickerEffectView.__allocating_init(device:)()
{
  return (*(uint64_t (**)(void))(v0 + 952))();
}

uint64_t dispatch thunk of StickerEffectView._observeScrollViewDidScroll(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of StickerEffectView.playSettlingAnimation()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of StickerEffectView.snapshot(completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x420))();
}

ValueMetadata *type metadata accessor for StickerEffectView.SnapshotError()
{
  return &type metadata for StickerEffectView.SnapshotError;
}

uint64_t sub_260D72F3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E51B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_260D72F9C(char *a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_260D755F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260D75620();
  uint64_t v50 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  uint64_t v12 = (void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  BOOL v13 = *v12;
  if (*v12)
  {
    float32x4_t v14 = *(float32x4_t *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation];
    float32x4_t v15 = *(float32x4_t *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
    int32x4_t v16 = (int32x4_t)vnegq_f32(v15);
    int8x16_t v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
    float32x4_t v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v14.f32[0]);
    float32x4_t v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
    v19.i32[0] = v16.i32[1];
    v19.i32[3] = v16.i32[2];
    float32x4_t v45 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v14, 3), v19, v14, 2), v18);
    uint64_t v20 = (void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_effect];
    swift_beginAccess();
    uint64_t v47 = v4;
    __n64 v21 = *v20;
    float v22 = *(void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    id v23 = v13;
    uint64_t v48 = v5;
    id v24 = v23;
    _Block_copy(a2);
    id v25 = v21;
    uint64_t v49 = v8;
    id v26 = v25;
    objc_msgSend(v22, sel_contentsScale);
    float v28 = v27;
    uint64_t v29 = *(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter];
    uint64_t v30 = &a1[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
    swift_beginAccess();
    int v31 = *(_DWORD *)v30;
    uint64_t v32 = *(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderer];
    uint64_t v33 = *(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
    uint64_t v46 = *(void *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderQueue];
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v32;
    *(void *)(v34 + 24) = a1;
    *(void *)(v34 + 32) = v24;
    *(float32x4_t *)(v34 + 48) = v45;
    *(void *)(v34 + 64) = v13;
    *(void *)(v34 + 72) = v26;
    *(float *)(v34 + 80) = v28;
    *(void *)(v34 + 88) = v29;
    *(_DWORD *)(v34 + 96) = v31;
    *(void *)(v34 + 104) = v33;
    *(void *)(v34 + 112) = sub_260D73504;
    *(void *)(v34 + 120) = v11;
    aBlock[4] = sub_260D7261C;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_260D6B1B0;
    aBlock[3] = &block_descriptor_96;
    uint64_t v35 = _Block_copy(aBlock);
    swift_retain_n();
    id v36 = v24;
    id v37 = v26;
    id v38 = a1;
    swift_retain();
    id v39 = v36;
    sub_260D75600();
    uint64_t v51 = MEMORY[0x263F8EE78];
    sub_260D73588((unint64_t *)&unk_26A8E50B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8E4990);
    sub_260D724BC((unint64_t *)&qword_26A8E50C0, (uint64_t *)&unk_26A8E4990);
    uint64_t v40 = v47;
    sub_260D757A0();
    MEMORY[0x261228760](0, v10, v7, v35);
    _Block_release(v35);
    swift_release();

    (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v40);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v49);
    swift_release();
  }
  else
  {
    sub_260D725C4();
    id v41 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v42 = 3;
    *(unsigned char *)(v42 + 4) = 1;
    _Block_copy(a2);
    id v43 = (void *)sub_260D75570();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v43);
  }
  return swift_release();
}

uint64_t sub_260D734CC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_260D73504(uint64_t a1, uint64_t a2)
{
  sub_260D71730(a1, a2, *(void *)(v2 + 16));
}

uint64_t objectdestroy_7Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 128, 15);
}

void sub_260D73570()
{
  sub_260D7099C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), (__n128 *)(v0 + 48), *(void *)(v0 + 104), *(void (**)(void, void))(v0 + 112), *(void *)(v0 + 120));
}

uint64_t sub_260D73588(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260D735D0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_260D73620(void *a1)
{
  sub_260D713FC(a1, *(void (**)(id, id))(v1 + 16), *(void *)(v1 + 24), *(__CVBuffer **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(CGColorSpace **)(v1 + 56), *(_DWORD *)(v1 + 64), *(void **)(v1 + 72));
}

uint64_t sub_260D73658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E51C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260D736C0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_260D73700()
{
  return sub_260D6ECA8(*(unsigned char **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_260D73708()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260D73740()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 100, 15);
}

void sub_260D73798()
{
  sub_260D6FE18(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), (__n128 *)(v0 + 48));
}

uint64_t sub_260D737A8()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 44, 7);
}

void sub_260D737E8()
{
  sub_260D703E4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(double *)(v0 + 32), *(float *)(v0 + 40));
}

uint64_t sub_260D737F8(void *a1)
{
  return sub_260D57050(a1, *(void *)(v1 + 16)) & 1;
}

id sub_260D73850()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicLookupFilterShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicLookupFilterShader()
{
  return self;
}

id sub_260D738A8(void *a1)
{
  return sub_260D63738(a1, &OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma);
}

id sub_260D73908()
{
  return sub_260D739BC(type metadata accessor for StickerComicGaussBlurExpressShader);
}

uint64_t type metadata accessor for StickerComicGaussBlurExpressShader()
{
  return self;
}

id sub_260D73944(void *a1)
{
  return sub_260D63738(a1, &OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma);
}

id sub_260D739A4()
{
  return sub_260D739BC(type metadata accessor for StickerComicGaussBlurExpressPassTwoShader);
}

id sub_260D739BC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicGaussBlurExpressPassTwoShader()
{
  return self;
}

void sub_260D73A18(uint64_t a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129A0]), sel_init);
  id v6 = objc_msgSend(v5, sel_colorAttachments);
  id v7 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, 0);

  if (!v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(v7, sel_setTexture_, a1);

  id v8 = objc_msgSend(v5, sel_colorAttachments);
  id v9 = objc_msgSend(v8, sel_objectAtIndexedSubscript_, 0);

  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_msgSend(v9, sel_setLoadAction_, 2);

  id v10 = objc_msgSend(v5, sel_colorAttachments);
  id v11 = objc_msgSend(v10, sel_objectAtIndexedSubscript_, 0);

  if (!v11)
  {
LABEL_9:
    __break(1u);
    return;
  }
  objc_msgSend(v11, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  id v12 = objc_msgSend(a2, sel_renderCommandEncoderWithDescriptor_, v5);
  if (v12) {
    objc_msgSend(v12, sel_setRenderPipelineState_, *(void *)(v2 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_pipelineState));
  }
}

void sub_260D73BC4(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  sub_260D73A18(a1, a4);
  if (!v7) {
    return;
  }
  id v8 = v7;
  objc_msgSend(v7, sel_setFragmentTexture_atIndex_, a2, 0);
  objc_msgSend(v8, sel_setFragmentTexture_atIndex_, a3, 1);
  if (qword_26A8E4938 != -1) {
    swift_once();
  }
  unint64_t v9 = *(void *)(qword_26A8E5428 + 16);
  if (v9 >> 61)
  {
    __break(1u);
  }
  else
  {
    a2 = 0x265573000uLL;
    objc_msgSend(v8, sel_setVertexBytes_length_atIndex_, qword_26A8E5428 + 32, 4 * v9, 0);
    if (qword_26A8E4930 == -1) {
      goto LABEL_6;
    }
  }
  swift_once();
LABEL_6:
  uint64_t v10 = qword_26A8E5420;
  unint64_t v11 = *(void *)(qword_26A8E5420 + 16);
  if (v11 >> 61)
  {
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v8, *(SEL *)(a2 + 2864), qword_26A8E5420 + 32, 4 * v11, 1);
  unint64_t v12 = *(void *)(v10 + 16);
  if (v12 >> 61)
  {
LABEL_15:
    __break(1u);
    return;
  }
  objc_msgSend(v8, *(SEL *)(a2 + 2864), v10 + 32, 4 * v12, 2);
  (*(void (**)(void *))((*MEMORY[0x263F8EED0] & *v4) + 0x98))(v8);
  objc_msgSend(v8, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
  objc_msgSend(v8, sel_endEncoding);
  swift_unknownObjectRelease();
}

void sub_260D73DAC(uint64_t a1, unint64_t a2, void *a3)
{
  sub_260D73A18(a1, a3);
  if (!v5) {
    return;
  }
  id v6 = v5;
  objc_msgSend(v5, sel_setFragmentTexture_atIndex_, a2, 0);
  if (qword_26A8E4938 != -1) {
    swift_once();
  }
  unint64_t v7 = *(void *)(qword_26A8E5428 + 16);
  if (v7 >> 61)
  {
    __break(1u);
  }
  else
  {
    a2 = 0x265573000uLL;
    objc_msgSend(v6, sel_setVertexBytes_length_atIndex_, qword_26A8E5428 + 32, 4 * v7, 0);
    if (qword_26A8E4930 == -1) {
      goto LABEL_6;
    }
  }
  swift_once();
LABEL_6:
  unint64_t v8 = *(void *)(qword_26A8E5420 + 16);
  if (v8 >> 61)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v6, *(SEL *)(a2 + 2864), qword_26A8E5420 + 32, 4 * v8, 1);
    (*(void (**)(void *))((*MEMORY[0x263F8EED0] & *v3) + 0x98))(v6);
    objc_msgSend(v6, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
    objc_msgSend(v6, sel_endEncoding);
    swift_unknownObjectRelease();
  }
}

void sub_260D73F44()
{
  qword_26A8E5420 = (uint64_t)&unk_270CFE8B0;
}

void sub_260D73F58()
{
  qword_26A8E5428 = (uint64_t)&unk_270CFE870;
}

char *sub_260D73F6C(void *a1, void *a2)
{
  v20[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = &v2[OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size];
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = v2;
  unint64_t v7 = (void *)sub_260D75650();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a2, sel_newFunctionWithName_, v7);

  unint64_t v9 = (void *)sub_260D75650();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a2, sel_newFunctionWithName_, v9);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129C0]), sel_init);
  objc_msgSend(v11, sel_setVertexFunction_, v8);
  objc_msgSend(v11, sel_setFragmentFunction_, v10);
  id v12 = objc_msgSend(v11, sel_colorAttachments);
  id v13 = objc_msgSend(v12, sel_objectAtIndexedSubscript_, 0);

  if (!v13) {
    __break(1u);
  }
  objc_msgSend(v13, sel_setPixelFormat_, 80);

  v20[0] = 0;
  id v14 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v11, v20);
  if (v14)
  {
    id v15 = v14;
    id v16 = v20[0];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    *(void *)&v6[OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_pipelineState] = v15;
    v19.receiver = v6;
    v19.super_class = (Class)type metadata accessor for StickerComicShaderBase();
    id v6 = (char *)objc_msgSendSuper2(&v19, sel_init);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    id v17 = v20[0];
    sub_260D75580();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    type metadata accessor for StickerComicShaderBase();
    swift_deallocPartialClassInstance();
  }
  return v6;
}

id sub_260D7422C()
{
  return sub_260D742CC(type metadata accessor for StickerComicShaderBase);
}

uint64_t type metadata accessor for StickerComicShaderBase()
{
  return self;
}

id sub_260D74278()
{
  return sub_260D742CC(type metadata accessor for StickerComicOneInputShader);
}

uint64_t type metadata accessor for StickerComicOneInputShader()
{
  return self;
}

id sub_260D742B4()
{
  return sub_260D742CC(type metadata accessor for StickerComicTwoInputShader);
}

id sub_260D742CC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicTwoInputShader()
{
  return self;
}

id sub_260D74328()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicSobelShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicSobelShader()
{
  return self;
}

void *sub_260D74380(void *a1, void *a2)
{
  objc_super v3 = (void *)v2;
  v32[4] = *MEMORY[0x263EF8340];
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  __asm { FMOV            V8.2S, #1.0 }
  *(void *)(v2 + 64) = _D8;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 112) = xmmword_260D77650;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  id v11 = objc_allocWithZone(MEMORY[0x263F129C0]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v12 = objc_msgSend(v11, sel_init);
  id v13 = (void *)sub_260D75650();
  id v14 = objc_msgSend(a2, sel_newFunctionWithName_, v13);

  objc_msgSend(v12, sel_setVertexFunction_, v14);
  swift_unknownObjectRelease();
  id v15 = (void *)sub_260D75650();
  id v16 = objc_msgSend(a2, sel_newFunctionWithName_, v15);

  objc_msgSend(v12, sel_setFragmentFunction_, v16);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v12, sel_colorAttachments);
  id v18 = objc_msgSend(v17, sel_objectAtIndexedSubscript_, 0);

  if (!v18) {
    __break(1u);
  }
  objc_msgSend(v18, sel_setPixelFormat_, v3[14]);

  id v30 = 0;
  id v19 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v12, &v30);
  id v20 = v19;
  id v21 = v30;
  if (!v19)
  {
    id v27 = v30;
    sub_260D75580();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    int v28 = 0;
    goto LABEL_9;
  }
  v3[13] = v19;
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  id v22 = v21;
  id v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_260D71864(MEMORY[0x263F8EE78]);
    sub_260D62A38();
    sub_260D75560();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  id v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  id v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    id v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  int v28 = 1;
  sub_260D71864(MEMORY[0x263F8EE78]);
  sub_260D62A38();
  sub_260D75560();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28) {
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v20) {
    swift_unknownObjectRelease();
  }
  type metadata accessor for StickerShaderStrokeGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t sub_260D74780()
{
  uint64_t v0 = sub_260D755E0();
  __swift_allocate_value_buffer(v0, qword_26A8E5320);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A8E5320);
  return sub_260D755D0();
}

void sub_260D74804(void *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v1 + 56);
  if (!v2) {
    return;
  }
  objc_super v3 = *(void **)(v1 + 96);
  if (v3)
  {
    swift_unknownObjectRetain();
    if (objc_msgSend(v3, sel_width) == *(id *)(v1 + 72))
    {
      uint64_t v4 = *(void **)(v1 + 96);
      if (v4)
      {
        if (objc_msgSend(v4, sel_height) == *(id *)(v1 + 80))
        {
          uint64_t v5 = *(void *)(v1 + 96);
          if (v5) {
            goto LABEL_7;
          }
LABEL_15:
          swift_unknownObjectRelease();
          return;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  id v9 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(void *)(v1 + 112), *(void *)(v1 + 72), *(void *)(v1 + 80), 0);
  objc_msgSend(v9, sel_setUsage_, 7);
  objc_msgSend(v9, sel_setStorageMode_, 2);
  id v10 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v9);

  *(void *)(v1 + 96) = v10;
  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)(v1 + 96);
  if (!v5) {
    goto LABEL_15;
  }
LABEL_7:
  id v6 = *(void **)(v1 + 88);
  if (v6)
  {
    swift_unknownObjectRetain();
    if (objc_msgSend(v6, sel_width) == *(id *)(v1 + 72))
    {
      unint64_t v7 = *(void **)(v1 + 88);
      if (v7)
      {
        if (objc_msgSend(v7, sel_height) == *(id *)(v1 + 80))
        {
          id v8 = *(void **)(v1 + 88);
          if (!v8) {
            goto LABEL_34;
          }
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  id v11 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(void *)(v1 + 120), *(void *)(v1 + 72), *(void *)(v1 + 80), 0);
  objc_msgSend(v11, sel_setUsage_, 7);
  objc_msgSend(v11, sel_setStorageMode_, 2);
  id v12 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v11);

  *(void *)(v1 + 88) = v12;
  swift_unknownObjectRelease();
  id v8 = *(void **)(v1 + 88);
  if (!v8)
  {
LABEL_34:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
LABEL_18:
  id v13 = objc_msgSend((id)swift_unknownObjectRetain(), sel_width);
  id v14 = objc_msgSend(v8, sel_height);
  if ((uint64_t)v14 <= (uint64_t)v13) {
    uint64_t v15 = (uint64_t)v13;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  uint64_t v16 = *(void *)(v1 + 16);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F13280]), sel_initWithDevice_, v16);
  id v18 = objc_msgSend(v2, sel_width);
  if (v18 != objc_msgSend(v8, sel_width) || (id v19 = objc_msgSend(v2, sel_height), v19 != objc_msgSend(v8, sel_height)))
  {
    if (qword_26A8E4940 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_260D755E0();
    __swift_project_value_buffer(v34, (uint64_t)qword_26A8E5320);
    uint64_t v35 = sub_260D755C0();
    os_log_type_t v36 = sub_260D756F0();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v37 = 0;
      _os_log_impl(&dword_260D55000, v35, v36, "Source texture size (maskTexture) does not match destination texture (distanceTexture)", v37, 2u);
      MEMORY[0x261228F70](v37, -1, -1);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      return;
    }

    swift_unknownObjectRelease();
    goto LABEL_34;
  }
  objc_msgSend(v17, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v8);
  float v20 = (float)v15;
  float v21 = (float)(*(float *)(v1 + 52) * (float)v15) / 3.0349;
  id v22 = objc_allocWithZone(MEMORY[0x263F13288]);
  *(float *)&double v23 = v21;
  id v38 = objc_msgSend(v22, sel_initWithDevice_sigma_, v16, v23);
  objc_msgSend(v38, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v8, v2);
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F129A0]), sel_init);
  id v25 = objc_msgSend(v24, sel_colorAttachments);
  id v26 = objc_msgSend(v25, sel_objectAtIndexedSubscript_, 0);

  if (!v26)
  {
    __break(1u);
    goto LABEL_37;
  }
  objc_msgSend(v26, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  id v27 = objc_msgSend(v24, sel_colorAttachments);
  id v28 = objc_msgSend(v27, sel_objectAtIndexedSubscript_, 0);

  if (!v28)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  objc_msgSend(v28, sel_setLoadAction_, 2);

  id v29 = objc_msgSend(v24, sel_colorAttachments);
  id v30 = objc_msgSend(v29, sel_objectAtIndexedSubscript_, 0);

  if (!v30)
  {
LABEL_38:
    __break(1u);
    return;
  }
  objc_msgSend(v30, sel_setTexture_, v5);

  id v31 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v24);
  if (v31)
  {
    uint64_t v32 = v31;
    float v33 = *(float *)(v1 + 48) * v20;
    v40[0] = v33 + -1.0;
    v40[1] = v33;
    objc_msgSend(v31, sel_setRenderPipelineState_, *(void *)(v1 + 104));
    objc_msgSend(v32, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 32), 0, 0);
    objc_msgSend(v32, sel_setVertexBuffer_offset_atIndex_, *(void *)(v1 + 40), 0, 1);
    objc_msgSend(v32, sel_setFragmentTexture_atIndex_, v2, 0);
    objc_msgSend(v32, sel_setFragmentBytes_length_atIndex_, v40, 8, 0);
    objc_msgSend(v32, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
    objc_msgSend(v32, sel_endEncoding);
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t sub_260D74E74()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_260D74ECC()
{
  sub_260D74E74();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for StickerShaderStrokeGenerator()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_260D74F5C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
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

float sub_260D74FD0(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  id v8 = (unsigned char *)(a1 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  float v9 = 0.0;
  if (*v8 == 1)
  {
    if (a3 <= a2) {
      uint64_t v10 = a2;
    }
    else {
      uint64_t v10 = a3;
    }
    float v11 = fminf(fmaxf((float)((float)((float)v10 / a4) + -30.0) / 90.0, 0.0), 1.0);
    float v12 = (float)(v11 * v11) * (float)((float)(v11 * -2.0) + 3.0);
    id v13 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
    swift_beginAccess();
    float v14 = *v13;
    float v15 = *v13 + (float)(v12 * (float)(1.0 - *v13));
    uint64_t v16 = (unsigned char *)(a1 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
    swift_beginAccess();
    if (*v16) {
      float v15 = v14;
    }
    id v17 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
    swift_beginAccess();
    float v9 = v15 * *v17;
    swift_beginAccess();
  }
  return v9;
}

uint64_t sub_260D75158()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for StickerShaderGenerator()
{
  return self;
}

char *sub_260D7518C(void *a1, void *a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode) = 0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteCenter) = _Q0;
  id v8 = (void *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteColor);
  *id v8 = 0;
  v8[1] = 0;
  *(void *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart) = 0x3FD3333333333333;
  *(void *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd) = 0x3FE8000000000000;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels) = 1086324736;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip) = 1042983595;
  return sub_260D73F6C(a1, a2);
}

id sub_260D7524C(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode);
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (v2 > 0x7FFFFFFF) {
    goto LABEL_5;
  }
  long long v3 = *(_OWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteColor);
  float32x2_t v4 = vcvt_f32_f64(*(float64x2_t *)(v1
                                   + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteCenter));
  float v5 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart);
  float v6 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd);
  int v7 = *(_DWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels);
  int v8 = *(_DWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip);
  int v10 = *(void *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode);
  float32x2_t v11 = v4;
  long long v12 = v3;
  float v13 = v5;
  float v14 = v6;
  int v15 = v7;
  int v16 = v8;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v10, 48, 0);
}

id sub_260D75340()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicVignetteAndQuantizeShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicVignetteAndQuantizeShader()
{
  return self;
}

id sub_260D75398(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode);
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (v2 > 0x7FFFFFFF) {
    goto LABEL_5;
  }
  float v3 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_threshold);
  float v4 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold);
  float v5 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma);
  float32x2_t v7 = vcvt_f32_f64(*(float64x2_t *)(v1 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  float v8 = v4;
  float v9 = v3;
  int v10 = v2;
  float v11 = v5;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v7, 24, 0);
}

id sub_260D75478()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicEdgesShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicEdgesShader()
{
  return self;
}

uint64_t sub_260D754D0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_260D754E0()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_260D754F0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_260D75560()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_260D75570()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_260D75580()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_260D75590()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_260D755A0()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_260D755B0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_260D755C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_260D755D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_260D755E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_260D755F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_260D75600()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_260D75610()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_260D75620()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_260D75630()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_260D75640()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_260D75650()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_260D75660()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_260D75670()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260D75680()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260D75690()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_260D756A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_260D756B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_260D756C0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_260D756D0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_260D756E0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_260D756F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_260D75700()
{
  return MEMORY[0x270FA2F20]();
}

uint64_t sub_260D75710()
{
  return MEMORY[0x270FA1288]();
}

uint64_t sub_260D75720()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_260D75730()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_260D75740()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_260D75750()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_260D75760()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_260D75770()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_260D75780()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_260D75790()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_260D757A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_260D757B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260D757C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_260D757D0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_260D757E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_260D757F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_260D75800()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_260D75810()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_260D75820()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_260D75830()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_260D75840()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_260D75850()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260D75880()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260D75890()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260D758A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260D758B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260D758C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260D758D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_260D758E0()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
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

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
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

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
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